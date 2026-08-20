<?php
session_start();
define('LIBRARIES', '../libraries/');
define('THUMBS', 'thumbs');
define('WATERMARK', 'watermark');
define('TEMPLATE', '../templates/');

if (empty($_SESSION['lang'])) $_SESSION['lang'] = 'vi';
$lang = $_SESSION['lang'];

require_once LIBRARIES . "config.php";
require_once LIBRARIES . 'autoload.php';
new AutoLoad();
$d = new PDODb($config['database']);
$cache = new Cache($d);
$func = new Functions($d, $cache);
$cart = new Cart($d);
$detect = new MobileDetect();
require_once LIBRARIES . "lang/web/$lang.php";

$deviceType = ($detect->isMobile() || $detect->isTablet()) ? 'mobile' : 'computer';
/* Slug lang */
$sluglang = 'slugvi';

/* Setting */
$sqlCache = "select * from #_setting";
$setting = $cache->get($sqlCache, null, 'fetch', 7200);
$optsetting = (!empty($setting['options'])) ? json_decode($setting['options'], true) : null;

$filterNhienlieu = [
    'nlxang' => 'Xăng',
    'nldau' => 'Dầu',
    'nldien' => 'Điện',
];
$filterHopso = [
    'sotudong' => 'Số tự động',
    'sosan' => 'Số sàn'
];
$filterXuatxu = [
    'laprap' => 'Lắp ráp',
    'nhapkhau' => 'Nhập khẩu'
];
