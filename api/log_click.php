<?php
include "config.php";

$type = htmlspecialchars($_POST['type'] ?? '');
if (!$type) die('Missing type');

$ip = $_SERVER['REMOTE_ADDR'];
$userAgent = $_SERVER['HTTP_USER_AGENT'];
$deviceType = ($detect->isMobile() || $detect->isTablet()) ? 'mobile' : 'computer';
 

// API miễn phí lấy vị trí theo IP (ip-api.com)
$geo = @json_decode(file_get_contents("http://ip-api.com/json/{$ip}?fields=country,city,status"), true);
$country = $geo['status'] == 'success' ? $geo['country'] : 'Unknown';
$city = $geo['status'] == 'success' ? $geo['city'] : 'Unknown';


/* thời gian chống spam (tính bằng giây) */
$limitSeconds = 60; // ví dụ: chỉ cho 1 lần mỗi phút

/* kiểm tra xem IP + type đã click trong 1 phút qua chưa */
$check = $d->rawQueryOne(
    "SELECT id FROM #_counter WHERE ip = ? AND type = ? AND created_at >= DATE_SUB(NOW(), INTERVAL ? SECOND) LIMIT 1",
    [$ip, $type, $limitSeconds]
);

if ($check) {
    // Đã có click gần đây => bỏ qua
    die('spam');
}


// Lưu vào DB
$d->rawQuery(
    "INSERT INTO #_counter (ip, user_agent, devicetype, type, country, city, created_at) 
     VALUES (?, ?, ?, ?, ?, ?, NOW())",
    [$ip, $userAgent, $deviceType, $type, $country, $city]
);
echo 'ok';
