<?php
if (!defined('LIBRARIES'))
    die("Error");

/* Timezone */
date_default_timezone_set('Asia/Ho_Chi_Minh');

/* Cấu hình coder */
define('MM_CONTRACT', 'MSHD');
define('MM_AUTHOR', 'admin@gmail.com');

/* Cấu hình chung */
/* PHP Ver: 8.2.4 | Update: 22-7-2023 */
$config = array(
    'author' => array(
        'name' => 'Nguyen Van Luom',
        'email' => 'luomnv04.mima@gmail.com',
        'zalo' => '0359744735',
        'timefinish' => '2026'
    ),
    'arrayDomainSSL' => array(), // code2.mimadigi.vn
    'database' => array(
        'server-name' => $_SERVER["SERVER_NAME"],
        'url' => '/2026/source_mima_hoa/',
        'type' => 'mysql',
        'host' => 'localhost',
        'username' => 'root', // code2_user 
        'password' => '', // YeAsVDIy05GUzoJKVlAs
        'dbname' => 'database_mima_hoa',
        'port' => 3306,
        'prefix' => 'table_',
        'charset' => 'utf8mb4'
    ),
    'website' => array(
        'error-reporting' => false,
        'secret' => '$admin@',
        'password' => '123qwe@Handi',
        'salt' => '(EF}vhmn>q',
        'md5' => 'e8898e106bfb9277aba9c5c0feeb77c3',
        'debug-developer' => true,
        'debug-css' => true,
        'debug-js' => true,
        'index' => false,
        'linkredirect' => false,
        'image' => array(),
        'noseo' => array('user', 'order', 'search'), //source
        'video' => array(
            'extension' => array('mp4', 'mkv'),
            'poster' => array(
                'width' => 700,
                'height' => 610,
                'extension' => '.jpg|.png|.jpeg'
            ),
            'allow-size' => '1100Mb',
            'max-size' => 1001 * 10241 * 10241
        ),
        'upload' => array(
            'max-width' => 2000,
            'max-height' => 1600
        ),
        'adminlang' => array(
            'active' => false,
            'key' => array('vi', 'en'),
            'lang' => array(
                'vi' => 'Tiếng Việt',
                // 'en' => 'Tiếng Anh'
            )
        ),
        'lang' => array(
            'vi' => 'Tiếng Việt',
            // 'en' => 'Tiếng Anh'
        ),
        'lang-doc' => 'vi',  //thay đổi thành lang nếu là song ngữ
        'slug' => array(
            'vi' => 'Tiếng Việt',
            // 'en' => 'Tiếng Anh'
        ),
        'seo' => array(
            'vi' => 'Tiếng Việt',
            // 'en' => 'Tiếng Anh'
        ),
        'comlang' => array(
            "gioi-thieu" => array("vi" => "gioi-thieu", "en" => "about-us"),
            "san-pham" => array("vi" => "san-pham", "en" => "product"),
            "tin-tuc" => array("vi" => "tin-tuc", "en" => "news"),
            "tuyen-dung" => array("vi" => "tuyen-dung", "en" => "recruitment"),
            "thu-vien-anh" => array("vi" => "thu-vien-anh", "en" => "gallery"),
            "video" => array("vi" => "video", "en" => "video"),
            "lien-he" => array("vi" => "lien-he", "en" => "contact")
        )
    ),
    'webp' => array(
        'active' => true,
    ),
    'cart' => array(
        'active' => false,
    ),
    'watermark' => array(
        'active' => false,
    ),
    'order' => array(
        'active' => false,
        'ship' => false
    ),

    'login' => array(
        'admin' => 'LoginAdmin' . MM_CONTRACT,
        'member' => 'LoginMember' . MM_CONTRACT,
        'attempt' => 5,
        'delay' => 15
    ),
    'googleAPI' => array(
        'recaptcha' => array(
            'active' => false,
            'urlapi' => 'https://www.google.com/recaptcha/api/siteverify',
            'sitekey' => '',
            'secretkey' => ''
        )
    ),
    'oneSignal' => array(
        'active' => false,
        'id' => 'af12ae0e-cfb7-41d0-91d8-8997fca889f8',
        'restId' => 'MWFmZGVhMzYtY2U0Zi00MjA0LTg0ODEtZWFkZTZlNmM1MDg4'
    )
);

/* Error reporting */
error_reporting(($config['website']['error-reporting']) ? E_ALL : 0);
/* Cấu hình http  lên hosting đóng lại*/
if (isset($_SERVER['HTTPS']) && ($_SERVER['HTTPS'] == 'on' || $_SERVER['HTTPS'] == 1) || isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') {
    $http = 'https://';
} else {
    $http = 'http://';
}
/* Error reporting lên hosting bật lên  */
// $http = 'https://';
/* Redirect http/https */
if (!count($config['arrayDomainSSL']) && $http == 'https://') {
    $host = $_SERVER['HTTP_HOST'];
    $request_uri = $_SERVER['REQUEST_URI'];
    $good_url = "http://" . $host . $request_uri;
    header("HTTP/1.1 301 Moved Permanently");
    header("Location: $good_url");
    exit;
}

/* CheckSSL */
if (count($config['arrayDomainSSL'])) {
    include LIBRARIES . "checkSSL.php";
}

/* Cấu hình base */
$configUrl = $config['database']['server-name'] . $config['database']['url'];
$configBase = $http . $configUrl;

/* Token */
define('TOKEN', md5(MM_CONTRACT . $config['database']['url']));

/* Path */
define('ROOT', str_replace(basename(__DIR__), '', __DIR__));
define('ASSET', $http . $configUrl);
define('ADMIN', 'madmin');

/* Cấu hình login */
$loginAdmin = $config['login']['admin'];
$loginMember = $config['login']['member'];

/* Cấu hình upload */
require_once LIBRARIES . "constant.php";
