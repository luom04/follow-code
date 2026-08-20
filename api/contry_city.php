<?php
include "config.php";

/* Lấy IP chính xác */
$ip = $_SERVER['HTTP_CF_CONNECTING_IP'] 
    ?? $_SERVER['HTTP_X_FORWARDED_FOR'] 
    ?? $_SERVER['REMOTE_ADDR'];

/* User Agent */
$userAgent = $_SERVER['HTTP_USER_AGENT'] ?? 'Unknown';

/* Xác định thiết bị */
if (preg_match('/mobile/i', $userAgent)) {
    $deviceType = 'mobile';
} else {
    $deviceType = 'computer';
}

/* Loại truy cập (tự đặt hoặc lấy từ query) */
$type = $_GET['type'] ?? 'unknown';

/* Lấy City + Country từ ip-api.com */
$apiUrl = "http://ip-api.com/json/{$ip}?fields=status,country,city";

$context = stream_context_create([
    'http' => [
        'timeout' => 1   // tránh lag web nếu API chậm
    ]
]);

$geo = @file_get_contents($apiUrl, false, $context);
$geo = json_decode($geo, true);

$country = (!empty($geo['status']) && $geo['status'] == 'success') 
    ? $geo['country'] 
    : 'Unknown';

$city = (!empty($geo['status']) && $geo['status'] == 'success') 
    ? $geo['city'] 
    : 'Unknown';

/* Lưu DB */
$d->rawQuery(
    "INSERT INTO #_counter (ip, user_agent, devicetype, type, country, city, created_at)
     VALUES (?, ?, ?, ?, ?, ?, NOW())",
    [$ip, $userAgent, $deviceType, $type, $country, $city]
);

?>
