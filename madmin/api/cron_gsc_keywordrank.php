<?php

require __DIR__ . '/../../vendor/autoload.php';



ini_set('display_errors', 0);

error_reporting(E_ALL);



try {

   require __DIR__ . '/cron_bootstrap.php'; // ✅ có $d = new PDODb(...)



    $siteUrl = 'https://moitruongxanhphucnguyen.com/';



    $ngay  = (new DateTime('yesterday'))->format('Y-m-d');

    $start = (new DateTime('-28 days'))->format('Y-m-d');

    $end   = $ngay;



    // ===== OAuth =====

    $client = new Google_Client();

    $client->setAuthConfig(__DIR__ . '/gsc-oauth.json');

    $client->setScopes([Google_Service_SearchConsole::WEBMASTERS_READONLY]);

    $client->setAccessType('offline');



    $tokenPath = __DIR__ . '/gsc-token.json';

    if (!file_exists($tokenPath)) throw new Exception("Missing gsc-token.json");



    $token = json_decode(file_get_contents($tokenPath), true);

    $client->setAccessToken($token);



    if ($client->isAccessTokenExpired()) {

        $newToken = $client->fetchAccessTokenWithRefreshToken($client->getRefreshToken());

        if (!empty($newToken['error'])) throw new Exception("Refresh error: ".json_encode($newToken));

        $merged = array_merge($token, $newToken); // giữ refresh_token

        file_put_contents($tokenPath, json_encode($merged, JSON_PRETTY_PRINT|JSON_UNESCAPED_SLASHES));

    }



    $service = new Google_Service_SearchConsole($client);



    // ===== Query query+page để có linktop =====

    $req = new Google_Service_SearchConsole_SearchAnalyticsQueryRequest();

    $req->setStartDate($start);

    $req->setEndDate($end);

    $req->setDimensions(['query','page']);

    $req->setRowLimit(25000);



    $res  = $service->searchanalytics->query($siteUrl, $req);

    $rows = $res->getRows() ?? [];
    echo "rows=" . count($rows) . "\n";


    // ===== Gom theo keyword =====

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

                'best_impr' => $impr,

                'best_clicks' => $clicks,

            ];

        } else {

            $best[$query]['clicks'] += $clicks;

            $best[$query]['impr']   += $impr;

            $best[$query]['pos']     = min($best[$query]['pos'], $pos);



            // chọn linktop: ưu tiên impressions rồi tới clicks

            if ($impr > $best[$query]['best_impr'] || ($impr == $best[$query]['best_impr'] && $clicks > $best[$query]['best_clicks'])) {

                $best[$query]['page'] = $page;

                $best[$query]['best_impr'] = $impr;

                $best[$query]['best_clicks'] = $clicks;

            }

        }

    }



    // ===== Lưu snapshot theo ngày =====

    // Xóa toàn bộ snapshot ngày đó rồi insert lại (đơn giản, sạch)

    $d->rawQuery("DELETE FROM #_keyword_rank WHERE ngay=?", [$ngay]);



    foreach ($best as $kw => $v) {

        $d->rawQuery(

            "INSERT INTO #_keyword_rank (ngay, tukhoa, luotnhap, luothienthi, thu_hang, linktop, hienthi, ngaytao)

             VALUES (?,?,?,?,?,?,?,?)",

            [$ngay, $kw, (int)$v['clicks'], (int)$v['impr'], (float)$v['pos'], $v['page'], 1, time()]

        );

    }



    echo "OK | saved ".count($best)." keywords | window $start -> $end | snapshot=$ngay\n";



} catch (Throwable $e) {

    // Cron nên log ra file, nhưng in ra cũng được để debug

    echo "ERROR: ".$e->getMessage()."\n";

}

