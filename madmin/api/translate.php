<?php
include "config.php";
header('Content-Type: application/json; charset=utf-8');

// Setting
$setting = $d->rawQueryOne("select * from #_setting limit 0,1");
$rawOpt = html_entity_decode($setting['options'] ?? '', ENT_QUOTES | ENT_HTML5, 'UTF-8');
$optsetting = $rawOpt ? json_decode($rawOpt, true) : null;

$apiKey = $optsetting['prompt_apikey'] ?? '';
if (!$apiKey) {
    echo json_encode(['error' => true, 'message' => "Vui lòng nhập API Key"], JSON_UNESCAPED_UNICODE);
    exit;
}

// Input
$title = trim((string) ($_POST['title'] ?? ''));
$desc = trim((string) ($_POST['desc'] ?? ''));
$content = trim((string) ($_POST['content'] ?? ''));

// (tuỳ bạn) chặn quá dài để tránh timeout/quota
$maxLen = 30000;
if (mb_strlen($content) > $maxLen) {
    echo json_encode(['error' => true, 'message' => "Content quá dài (tối đa {$maxLen} ký tự)"], JSON_UNESCAPED_UNICODE);
    exit;
}

$prompt =
    "Hãy dịch sang tiếng Anh và CHỈ trả về JSON thuần (không markdown, không giải thích).\n" .
    "JSON chỉ có 3 field: title, description, content.\n" .
    "Nội dung JSON phải là tiếng Anh.\n\n" .
    "Title: {$title}\n" .
    "Description: {$desc}\n" .
    "Content: {$content}\n";

$url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=" . urlencode($apiKey);

// Proxy IP-based (từ dashboard)
$proxyHost = "160.25.77.31";
$proxyPort = 8200;

$payload = [
    "contents" => [
        [
            "parts" => [
                ["text" => $prompt]
            ]
        ]
    ],
    "generationConfig" => [
        "responseMimeType" => "application/json"
    ]
];

$ch = curl_init($url);
curl_setopt_array($ch, [
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_POST => true,
    CURLOPT_HTTPHEADER => ['Content-Type: application/json'],
    CURLOPT_POSTFIELDS => json_encode($payload, JSON_UNESCAPED_UNICODE),

    // Proxy (KHÔNG user/pass)
    CURLOPT_PROXY => "http://{$proxyHost}:{$proxyPort}",
    CURLOPT_PROXYTYPE => CURLPROXY_HTTP,
    CURLOPT_HTTPPROXYTUNNEL => true,

    CURLOPT_CONNECTTIMEOUT => 20,
    CURLOPT_TIMEOUT => 160,

    // test nhanh
    CURLOPT_SSL_VERIFYPEER => false,
    CURLOPT_SSL_VERIFYHOST => 0,
]);

$response = curl_exec($ch);
$errno = curl_errno($ch);
$err = curl_error($ch);
$http = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

if ($errno) {
    echo json_encode(['error' => true, 'message' => 'cURL error', 'detail' => $err], JSON_UNESCAPED_UNICODE);
    exit;
}

$result = json_decode($response, true);

// HTTP error từ Gemini
if ($http >= 400) {
    $msg = 'HTTP/API error';
    if (is_array($result) && isset($result['error']['message']))
        $msg = $result['error']['message'];

    http_response_code($http);
    echo json_encode([
        'error' => true,
        'http' => $http,
        'message' => $msg,
        'status' => $result['error']['status'] ?? null,
        'raw' => $result
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

if (!is_array($result)) {
    echo json_encode([
        'error' => true,
        'message' => 'Response is not valid JSON (outer)',
        'raw' => $response
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

// Lấy text/hoặc inline json (tuỳ Gemini trả)
$text = $result['candidates'][0]['content']['parts'][0]['text'] ?? '';
if ($text === '') {
    echo json_encode(['error' => true, 'message' => 'No candidates text', 'raw' => $result], JSON_UNESCAPED_UNICODE);
    exit;
}

// Parse JSON
$parsed = json_decode($text, true);

// Nếu model lỡ trả thêm chữ, bóc {...} đầu tiên
if (!is_array($parsed)) {
    if (preg_match('/\{[\s\S]*\}/', $text, $m)) {
        $parsed = json_decode($m[0], true);
    }
}

if (!is_array($parsed)) {
    echo json_encode([
        'error' => true,
        'message' => 'Không parse được JSON từ Gemini',
        'json_error' => json_last_error_msg(),
        'text' => $text
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

// Normalize output
$newResult = [
    'title' => (string) ($parsed['title'] ?? ''),
    'description' => (string) ($parsed['description'] ?? ''),
    'content' => (string) ($parsed['content'] ?? ''),
];

echo json_encode(['error' => false, 'result' => $newResult], JSON_UNESCAPED_UNICODE);
