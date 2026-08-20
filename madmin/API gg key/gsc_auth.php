<?php
session_start();

define('LIBRARIES', dirname(__DIR__, 2) . '/libraries/');
require_once LIBRARIES . "config.php";
require_once LIBRARIES . "autoload.php";
new AutoLoad();

require __DIR__ . '/../../vendor/autoload.php';

$d = new PDODb($config['database']);
$cache = new Cache($d);
$func  = new Functions($d, $cache);

function decodeSettingJson($raw) {
  if (!is_string($raw) || trim($raw) === '') return null;
  $raw = trim($raw);
  $raw = html_entity_decode($raw, ENT_QUOTES | ENT_HTML5, 'UTF-8');
  $raw = preg_replace('/^\xEF\xBB\xBF/', '', $raw);
  $arr = json_decode($raw, true);
  return is_array($arr) ? $arr : null;
}

$setting = $d->rawQueryOne("SELECT * FROM #_setting LIMIT 0,1");
if (!$setting) { http_response_code(500); exit("Missing setting row"); }

$optsetting = !empty($setting['options']) ? json_decode($setting['options'], true) : [];
$base = rtrim(($optsetting['website'] ?? ''), '/');
if ($base === '') { http_response_code(500); exit("Missing options.website"); }

$redirectUri = $base . '/madmin/api/gsc_auth.php';

/**
 * Nếu chưa có code (bước start auth), lúc này mới bắt buộc login admin.
 * Còn khi Google redirect về có ?code=..., nếu session bị rớt thì vẫn cho xử lý để khỏi lỗi.
 */
if (!isset($_GET['code'])) {
  if ($func->checkLoginAdmin() == false) {
    http_response_code(403);
    exit('Forbidden');
  }
}

$oauthArr = decodeSettingJson($setting['tokenoauth'] ?? '');
if (!$oauthArr) {
  http_response_code(500);
  exit("OAuth JSON invalid in setting.tokenoauth: " . json_last_error_msg());
}

$client = new Google_Client();
$client->setAuthConfig($oauthArr);
$client->setScopes([Google_Service_SearchConsole::WEBMASTERS_READONLY]);
$client->setAccessType('offline');
$client->setPrompt('consent');
$client->setIncludeGrantedScopes(true);
$client->setRedirectUri($redirectUri);

if (!isset($_GET['code'])) {
  header('Location: ' . $client->createAuthUrl());
  exit;
}

$token = $client->fetchAccessTokenWithAuthCode($_GET['code']);
if (!empty($token['error'])) {
  http_response_code(500);
  exit("Auth error: " . ($token['error_description'] ?? $token['error']));
}

// nếu Google không trả refresh_token (vì đã consent trước đó) thì giữ refresh_token cũ nếu có
$old = decodeSettingJson($setting['tokengsc'] ?? '');
if (is_array($old) && !empty($old['refresh_token']) && empty($token['refresh_token'])) {
  $token['refresh_token'] = $old['refresh_token'];
}

// lưu vào cột tokengsc
$tokenJson = json_encode($token, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);

$d->rawQuery(
  "UPDATE #_setting SET tokengsc=? WHERE id=?",
  [$tokenJson, (int)$setting['id']]
);

echo "OK - Token saved to setting.tokengsc";
