<?php
session_start();

define('LIBRARIES', dirname(__DIR__, 2) . '/libraries/');
define('THUMBS', 'thumbs');

require_once LIBRARIES . "config.php";
require_once LIBRARIES . "autoload.php";
new AutoLoad();

require __DIR__ . '/../../vendor/autoload.php';

$d = new PDODb($config['database']);
$cache = new Cache($d);
$func  = new Functions($d, $cache);

if ($func->checkLoginAdmin() == false) {
  http_response_code(403);
  exit('Forbidden');
}

/* helper: decode JSON lưu kiểu &quot; */
function decodeSettingJson($raw) {
  if (!is_string($raw) || trim($raw) === '') return null;
  $raw = trim($raw);
  $raw = html_entity_decode($raw, ENT_QUOTES | ENT_HTML5, 'UTF-8');
  $raw = preg_replace('/^\xEF\xBB\xBF/', '', $raw);
  $arr = json_decode($raw, true);
  return is_array($arr) ? $arr : null;
}
function encodeJson($arr) {
  return json_encode($arr, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
}

/* chống spam */
$cooldown = 0; // bạn đang để 0
$flagFile = __DIR__ . '/gsc_last_run.txt';
$last = is_file($flagFile) ? (int)@file_get_contents($flagFile) : 0;
if (time() - $last < $cooldown) {
  exit('Vui lòng chờ ' . ($cooldown - (time() - $last)) . ' giây rồi cập nhật tiếp.');
}
@file_put_contents($flagFile, (string)time());

/* lấy setting */
$setting = $d->rawQueryOne("SELECT * FROM #_setting LIMIT 0,1");
if (!$setting) {
  http_response_code(500);
  exit("ERROR: Missing setting row");
}
$optsetting = !empty($setting['options']) ? json_decode($setting['options'], true) : [];
$siteUrl = rtrim(($optsetting['website'] ?? ''), '/') . '/';
if ($siteUrl === '/') {
  http_response_code(500);
  exit("ERROR: Missing options.website");
}

/* thời gian */
$ngay  = (new DateTime('yesterday'))->format('Y-m-d');
$start = (new DateTime('-90 days'))->format('Y-m-d');
$end   = $ngay;

try {
  /* OAuth config từ cột tokenoauth */
  $oauthArr = decodeSettingJson($setting['tokenoauth'] ?? '');
  if (!$oauthArr) {
    throw new Exception("OAuth JSON invalid in setting.tokenoauth");
  }

  /* token từ cột tokengsc:
     - có thể bạn lưu token dạng JSON object, hoặc JSON string
  */
  $tokengscRaw = $setting['tokengsc'] ?? '';
  $tokengscRaw = html_entity_decode((string)$tokengscRaw, ENT_QUOTES | ENT_HTML5, 'UTF-8');
  $tokengscRaw = trim($tokengscRaw);

  // Nếu cột tokengsc đang lưu trực tiếp JSON token => decode luôn
  $token = json_decode($tokengscRaw, true);

  // Nếu tokengsc lại là JSON string lồng (hiếm) => decode 2 lần
  if (is_string($token)) {
    $token = json_decode($token, true);
  }

  if (!is_array($token)) {
    throw new Exception("GSC token invalid in setting.tokengsc");
  }

  $client = new Google_Client();
  $client->setAuthConfig($oauthArr);
  $client->setScopes([Google_Service_SearchConsole::WEBMASTERS_READONLY]);
  $client->setAccessType('offline');
  $client->setAccessToken($token);

  /* refresh token nếu hết hạn, rồi lưu lại vào DB */
  if ($client->isAccessTokenExpired()) {
    $refreshToken = $token['refresh_token'] ?? null;
    if (!$refreshToken) throw new Exception("Missing refresh_token in setting.tokengsc");

    $newToken = $client->fetchAccessTokenWithRefreshToken($refreshToken);
    if (!empty($newToken['error'])) throw new Exception("Refresh error: " . json_encode($newToken));

    $merged = array_merge($token, $newToken);
    if (!isset($merged['refresh_token'])) $merged['refresh_token'] = $refreshToken;

    $d->rawQuery(
      "UPDATE #_setting SET tokengsc=? WHERE id=?",
      [encodeJson($merged), (int)$setting['id']]
    );

    $client->setAccessToken($merged);
    $token = $merged;
  }

  $service = new Google_Service_SearchConsole($client);

  /* ===== query+page (phân trang) ===== */
  $rowsAll = [];
  $startRow = 0;
  $pageSize = 25000;

  do {
    $req = new Google_Service_SearchConsole_SearchAnalyticsQueryRequest();
    $req->setStartDate($start);
    $req->setEndDate($end);
    $req->setDimensions(['query', 'page']);
    $req->setRowLimit($pageSize);
    $req->setStartRow($startRow);

    $res  = $service->searchanalytics->query($siteUrl, $req);
    $rows = $res->getRows() ?? [];

    $rowsAll = array_merge($rowsAll, $rows);
    $startRow += $pageSize;
  } while (count($rows) === $pageSize);

  $rows = $rowsAll;

  /* gom keyword */
  $best = [];
  foreach ($rows as $row) {
    $keys  = $row->getKeys(); // [query, page]
    $query = $keys[0] ?? '';
    $page  = $keys[1] ?? '';
    if ($query === '') continue;

    $clicks = (int)$row->getClicks();
    $impr   = (int)$row->getImpressions();
    $pos    = (float)$row->getPosition();

    if (!isset($best[$query])) {
      $best[$query] = [
        'clicks' => $clicks,
        'impr'   => $impr,
        'pos'    => $pos,
        'page'   => $page,
        'bi'     => $impr,
        'bc'     => $clicks,
      ];
    } else {
      $best[$query]['clicks'] += $clicks;
      $best[$query]['impr']   += $impr;
      $best[$query]['pos']     = min($best[$query]['pos'], $pos);

      if ($impr > $best[$query]['bi'] || ($impr == $best[$query]['bi'] && $clicks > $best[$query]['bc'])) {
        $best[$query]['page'] = $page;
        $best[$query]['bi']   = $impr;
        $best[$query]['bc']   = $clicks;
      }
    }
  }

  /* ===== page-only ===== */
  $reqPage = new Google_Service_SearchConsole_SearchAnalyticsQueryRequest();
  $reqPage->setStartDate($start);
  $reqPage->setEndDate($end);
  $reqPage->setDimensions(['page']);
  $reqPage->setRowLimit(25000);

  $resPage  = $service->searchanalytics->query($siteUrl, $reqPage);
  $rowsPage = $resPage->getRows() ?? [];

  $pages = [];
  foreach ($rowsPage as $row) {
    $keys = $row->getKeys(); // [page]
    $page = $keys[0] ?? '';
    if ($page === '') continue;

    $pages[$page] = [
      'clicks' => (int)$row->getClicks(),
      'impr'   => (int)$row->getImpressions(),
      'pos'    => (float)$row->getPosition(),
    ];
  }

  /* ===== lưu DB: 1 transaction cho cả 2 bảng ===== */
  $d->rawQuery("START TRANSACTION");

  $d->rawQuery("DELETE FROM #_keyword_rank WHERE ngay=?", [$ngay]);
  foreach ($best as $kw => $v) {
    $d->rawQuery(
      "INSERT INTO #_keyword_rank (ngay,tukhoa,luotnhap,luothienthi,thu_hang,linktop,hienthi,ngaytao)
       VALUES (?,?,?,?,?,?,?,?)",
      [$ngay, $kw, (int)$v['clicks'], (int)$v['impr'], (float)$v['pos'], $v['page'], 1, time()]
    );
  }

  // $d->rawQuery("DELETE FROM #_page_rank WHERE ngay=?", [$ngay]);
  // foreach ($pages as $url => $v) {
  //   $d->rawQuery(
  //     "INSERT INTO #_page_rank (ngay,url,luotnhap,luothienthi,thu_hang,hienthi,ngaytao)
  //      VALUES (?,?,?,?,?,?,?)",
  //     [$ngay, $url, (int)$v['clicks'], (int)$v['impr'], (float)$v['pos'], 1, time()]
  //   );
  // }

  $d->rawQuery("COMMIT");

  echo "OK|kw_saved=" . count($best) . "|page_saved=" . count($pages) . "|snapshot=" . $ngay;

} catch (Throwable $e) {
  try { $d->rawQuery("ROLLBACK"); } catch (Throwable $ignored) {}
  http_response_code(500);
  echo "ERROR: " . $e->getMessage();
}
