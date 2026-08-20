<?php
include "config.php";

// Lấy setting
$setting = $d->rawQueryOne("SELECT * FROM #_setting LIMIT 0,1");
$optsetting = (!empty($setting['options'])) ? json_decode($setting['options'], true) : null;

$apiKey = $optsetting['prompt_apikey'] ?? '';
if (!$apiKey) {
    echo json_encode(['error' => true, 'message' => "Vui lòng nhập API Key"]);
    exit;
}

// Lấy dữ liệu POST & lọc
$title = trim(strip_tags($_POST['title'] ?? ''));
$desc = trim(strip_tags($_POST['desc'] ?? ''));
$lang = trim(strip_tags($_POST['lang'] ?? 'vi'));
$words = intval($_POST['words'] ?? 1000);
$keywords = trim($_POST['keywords'] ?? ''); // vẫn giữ dấu tiếng Việt
$showProduct = !empty($_POST['showProduct']);
$showService = !empty($_POST['showService']);
$showContact = !empty($_POST['showContact']);
$style = trim(strip_tags($_POST['style'] ?? ''));
$colorH2 = trim(strip_tags($_POST['colorH2'] ?? '#000')); // màu H2

if (!$title || !$words) {
    echo json_encode(['error' => true, 'message' => 'Thiếu tiêu đề hoặc số từ']);
    exit;
}

/* ==========================
   TÁCH KEYWORDS & TÌM BACKLINK
   ========================== */
$keywordsList = array_map('trim', explode(',', $keywords));
$keywordLinks = [];

foreach ($keywordsList as $kw) {
    if ($kw === '')
        continue;

    $product = $d->rawQueryOne("
        SELECT slugvi FROM (
            SELECT slugvi FROM #_product_list WHERE namevi LIKE ?
            UNION
            SELECT slugvi FROM #_product_cat WHERE namevi LIKE ?
            UNION
            SELECT slugvi FROM #_product_item WHERE namevi LIKE ?
            UNION
            SELECT slugvi FROM #_product_sub WHERE namevi LIKE ?
            UNION
            SELECT slugvi FROM #_product WHERE namevi LIKE ?
        ) AS combined
        LIMIT 1
    ", ["%{$kw}%", "%{$kw}%", "%{$kw}%", "%{$kw}%", "%{$kw}%"]);

    if (!empty($product['slugvi'])) {
        $link = $configBase . $product['slugvi'];
        $keywordLinks[$kw] = $link;
    }

    // Tìm bài viết trong bảng news (tìm tên gần đúng)
    $post = $d->rawQueryOne("
        SELECT slugvi FROM (
            SELECT slugvi FROM #_news_list WHERE namevi LIKE ?
            UNION
            SELECT slugvi FROM #_news_cat WHERE namevi LIKE ?
            UNION
            SELECT slugvi FROM #_news_item WHERE namevi LIKE ?
            UNION
            SELECT slugvi FROM #_news_sub WHERE namevi LIKE ?
            UNION
            SELECT slugvi FROM #_news WHERE namevi LIKE ?
        ) AS combined
        LIMIT 1
    ", ["%{$kw}%", "%{$kw}%", "%{$kw}%", "%{$kw}%", "%{$kw}%"]);

    if (!empty($post['slugvi'])) {
        // Tạo link bài viết (sửa 'san-pham' nếu cấu trúc link khác)
        $link = $configBase . $post['slugvi'];
        $keywordLinks[$kw] = $link;
    }
}

/* ==========================
   YÊU CẦU FORMAT HTML
   ========================== */
$htmlFormat = "
Yêu cầu định dạng trực tiếp trong các thẻ html:
- Font-size mặc định: 16px.
- <h2>: font-size 20px, in đậm, màu: {$colorH2}.
- <h3>: font-size 18px, in đậm.
- Có thể chèn liên kết (backlink) vào từ khoá theo danh sách sau:
";

if (!empty($keywordLinks)) {
    foreach ($keywordLinks as $kw => $link) {
        $htmlFormat .= "\n+ {$kw} → {$link}";
    }
} else {
    $htmlFormat .= "\n(Không có danh sách từ khoá backlink)";
}

/* ==========================
   TẠO PROMPT
   ========================== */
$prompt = "Hãy viết một bài viết chuẩn SEO {$words} từ cho tiêu đề '{$title}'";
if ($desc) {
    $prompt .= " bám sát mô tả sau: \n {$desc}";
}

if ($keywords) {
    $prompt .= " có chứa các từ khoá {$keywords}";
}
$prompt .= ".\n";

if (!empty($optsetting['prompt_linhvuc'])) {
    $prompt .= "- Lĩnh vực kinh doanh: {$optsetting['prompt_linhvuc']}\n";
}
if ($showProduct && !empty($optsetting['prompt_sanpham'])) {
    $prompt .= "- Sản phẩm: {$optsetting['prompt_sanpham']}\n";
}
if ($showService && !empty($optsetting['prompt_dichvu'])) {
    $prompt .= "- Dịch vụ: {$optsetting['prompt_dichvu']}\n";
}


$prompt .= "\nYêu cầu:\n";
$prompt .= "- Văn phong {$style}.\n";
$prompt .= "- Văn bản phải định dạng HTML (h2, h3, p, ul, li...).\n";
$prompt .= "- Không dùng <!DOCTYPE html>, <html>, <head>, <body>.\n";
$prompt .= "- Ngôi thứ ba.\n";
$prompt .= "- Không lặp lại thông tin.\n";
$prompt .= "- Bài viết phải có ít nhất 4 thẻ <h2>, mỗi <h2> có từ 1-3 thẻ <h3> mô tả chi tiết.\n";
$prompt .= "- Các đoạn văn <p> phải phân chia rõ ràng giữa các tiêu đề.\n";
$prompt .= "- Tối đa 5 backlink.\n";
$prompt .= "{$htmlFormat}\n";
if ($showContact) {
    $prompt .= "Yêu cầu bao gồm thông tin liên hệ dưới đây:\n";
    $prompt .= "{$setting['namevi']}\n";
    $prompt .= "- Địa chỉ: {$setting['addressvi']}\n";
    $prompt .= "- Hotline: {$optsetting['hotline']}\n";
    $prompt .= "- Điện thoại: {$optsetting['phone']}\n";
    $prompt .= "- Email: {$optsetting['email']}\n";
    $prompt .= "- Website: {$optsetting['website']}\n";
}

/* ==========================
   GỌI API GEMINI
   ========================== */
$data = [
    "contents" => [
        [
            "parts" => [
                ["text" => $prompt]
            ]
        ]
    ]
];

$url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key={$apiKey}";

$proxyHost = "160.25.77.31";
$proxyPort = 8200;
$proxyUser = "hoahd98mima";
$proxyPass = "mima@123";


$ch = curl_init($url);
curl_setopt_array($ch, [
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_POST => true,
    CURLOPT_HTTPHEADER => ['Content-Type: application/json'],
    CURLOPT_POSTFIELDS => json_encode($data, JSON_UNESCAPED_UNICODE),

    // ✅ Proxy IP-based (KHÔNG user/pass)
    CURLOPT_PROXY => "http://{$proxyHost}:{$proxyPort}",
    CURLOPT_PROXYTYPE => CURLPROXY_HTTP,
    CURLOPT_HTTPPROXYTUNNEL => true,

    CURLOPT_CONNECTTIMEOUT => 20,
    CURLOPT_TIMEOUT => 60,

    // test nhanh
    CURLOPT_SSL_VERIFYPEER => false,
    CURLOPT_SSL_VERIFYHOST => 0,
]);
$response = curl_exec($ch);
$curlErr = curl_error($ch);
$info = curl_getinfo($ch);
curl_close($ch);

if ($response === false) {
    echo json_encode([
        'error' => true,
        'message' => 'Lỗi kết nối API: ' . $curlErr,
        'curl_info' => $info
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

$result = json_decode($response, true);

if (!isset($result['candidates'][0]['content']['parts'][0]['text'])) {
    echo json_encode([
        'error' => true,
        'message' => 'Bạn đã sử dụng vượt quá hạn mức (quota) trong ngày. Vui lòng thử lại vào  ngày mai hoặc sử dụng một tài khoản Gmail khác để tạo API key mới. Mong bạn thông cảm cho sự bất tiện này.',
        'raw' => $result
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

echo json_encode([
    'error' => false,
    'result' => $result['candidates'][0]['content']['parts'][0]['text']
], JSON_UNESCAPED_UNICODE);
