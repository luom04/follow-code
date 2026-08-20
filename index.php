<?php
// ini_set('display_errors', 1);
// error_reporting(E_ALL);

$uri = $_SERVER['REQUEST_URI'] ?? '';
$qs  = $_SERVER['QUERY_STRING'] ?? '';


// LOCK PAGE
// $lockFile = __DIR__ . '/lock.php';
// $host = $_SERVER['HTTP_HOST'] ?? '';
// $cleanUri = strtok($uri, '?');
// if (
//     file_exists($lockFile) &&
//     $cleanUri === '/'
// ) {
//     include __DIR__ . '/lock.php';
//     exit;
// }



if (strpos($uri, '/madmin/') === 0) {
    return;
}

/* Trailing slash -> 301 bỏ dấu "/" (thay cho rule .htaccess, host chạy nginx) */
$reqPath  = parse_url($uri, PHP_URL_PATH);
$basePath = rtrim(str_replace('\\', '/', dirname($_SERVER['SCRIPT_NAME'])), '/');

if ($reqPath !== $basePath . '/' && substr($reqPath, -1) === '/') {
    $fsPath = __DIR__ . substr($reqPath, strlen($basePath));
    if (!is_dir($fsPath)) {
        header('Location: ' . rtrim($reqPath, '/') . ($qs !== '' ? '?' . $qs : ''), true, 301);
        exit;
    }
}



$blockKeys = ['casino', 'poker', 'bet', 'slot', 'apk', 'hack', 'xxx', 'sex', 'adult'];
$blockPatterns = '/(casino|poker|bet|slot|xxx|apk|hack|sex|adult)/i';

$allowTracking = ['fbclid', 'gclid', 'zalo_refid', '_ga', '_gid'];
$allowPrefix = ['utm_'];

if ($qs && stripos($qs, '.html') !== false) {
    http_response_code(410);
    include __DIR__ . '/404.php';
    exit;
}

if (!empty($_GET) && count($_GET) > 15) {
    http_response_code(410);
    include __DIR__ . '/404.php';
    exit;
}

$cleanParams = [];
$hasSpam = false;

foreach ($_GET as $key => $value) {

    $keyLower = strtolower($key);

    // check prefix (PHP 7 compatible) 
    $allow = false;
    foreach ($allowPrefix as $p) {
        if (strpos($keyLower, $p) === 0) {
            $allow = true;
            break;
        }
    }
    // ❌ CHẶN dạng ?abc (không có value)
    if ($value === '' || is_null($value)) {
        http_response_code(410);
        include __DIR__ . '/404.php';
        exit;
    }
    if (in_array($keyLower, $allowTracking) || $allow) {
        $cleanParams[$key] = $value;
        continue;
    }

    if (in_array($keyLower, $blockKeys, true)) {
        $hasSpam = true;
        continue;
    }

    if (preg_match($blockPatterns, $key . $value)) {
        $hasSpam = true;
        continue;
    }

    if (strlen($value) > 500) {
        $hasSpam = true;
        continue;
    }

    if (preg_match('/<|>|script/i', $value)) {
        $hasSpam = true;
        continue;
    }

    $cleanParams[$key] = $value;
}

if ($hasSpam) {

    $newQuery = http_build_query($cleanParams);
    $baseUrl  = strtok($_SERVER['REQUEST_URI'], '?');

    header("Location: " . $baseUrl . ($newQuery ? '?' . $newQuery : ''), true, 301);
    exit;
}
session_start();
define('LIBRARIES', './libraries/');
define('SOURCES', './sources/');
define('LAYOUT', 'layout/');
define('THUMBS', 'thumbs');
define('JSONS', './assets/jsons/');
define('WATERMARK', 'watermark');

/* Config */
require_once LIBRARIES . "config.php";
require_once LIBRARIES . 'autoload.php';
new AutoLoad();

$injection = new AntiSQLInjection();
$d = new PDODb($config['database']);
$flash = new Flash();
$seo = new Seo($d);
$emailer = new Email($d);
$router = new AltoRouter();
$cache = new Cache($d);
$func = new Functions($d, $cache);
$breadcr = new BreadCrumbs($d);
$statistic = new Statistic($d, $cache);
$cart = new Cart($d);
$detect = new MobileDetect();
$addons = new AddonsOnline();
$css = new CssMinify($config['website']['debug-css'], $func);
$js = new JsMinify($config['website']['debug-js'], $func);

/* Router */
require_once LIBRARIES . "router.php";

$comLang = $config['website']['comlang'];
/* Template */
include TEMPLATE . "index.php";
