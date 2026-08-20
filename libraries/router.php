<?php
/* Check HTTP */
$func->checkHTTP($http, $config['arrayDomainSSL'], $configBase, $configUrl);

/* Validate URL */
$func->checkUrl($config['website']['index']);

/* Check login */
$func->checkLoginMember();

if (!empty($config['website']['linkredirect'])) {
    $func->checkRedirect();
}

/* Mobile detect */
$deviceType = ($detect->isMobile() || $detect->isTablet()) ? 'mobile' : 'computer';
define('TEMPLATE', ($deviceType == 'computer') ? './templates/' : './templates/');

/* Router */
$wtm = $cache->get(
    "select status, photo, options from #_photo where type = ? and act = ? limit 0,1",
    array('watermark', 'photo_static'),
    'fetch',
    7200
);

$wtmPro = [
    "hienthi" => 1,
    "photo" => $wtm['photo'],
    "options" => $wtm['options']
];
$router->setBasePath($config['database']['url']);

$router->map('GET|POST', '', 'index', 'home');
$router->map('GET|POST', 'index.php', 'index', 'index');
$router->map('GET|POST', 'sitemap.xml', 'sitemap', 'sitemap');
$router->map('GET|POST', '[a:com]', 'allpage', 'show');
$router->map('GET|POST', 'ngon-ngu/[a:lang]/', 'ngon-ngu', 'lang');
$router->map('GET|POST', 'account/[a:action]', 'account', 'account');
$router->map('GET', THUMBS . '/[i:w]x[i:h]x[i:z]/[**:src]', function ($w, $h, $z, $src) {
    global $func, $config;
    if ($config['webp'] && preg_match('/\.(?!webp$).*\.webp$/i', $src)) {
        $func->createThumb($w, $h, $z, $src, null, THUMBS, false, array(), 100, true);
    } else {
        $func->createThumb($w, $h, $z, $src, null, THUMBS);
    }
}, 'thumb');
$router->map('GET', WATERMARK . '/product/[i:w]x[i:h]x[i:z]/[**:src]', function ($w, $h, $z, $src) {
    global $func, $wtmPro, $config;

    if ($config['webp'] && preg_match('/\.(?!webp$).*\.webp$/i', $src)) {
        $func->createThumb($w, $h, $z, $src, $wtmPro, "product", false, array(), 100, true);
    } else {
        $func->createThumb($w, $h, $z, $src, $wtmPro, "product");
    }
}, 'watermark');
$router->map('GET', WATERMARK . '/news/[i:w]x[i:h]x[i:z]/[**:src]', function ($w, $h, $z, $src) {
    global $func, $wtmNews, $config;
    if ($config['webp'] && preg_match('/\.(?!webp$).*\.webp$/i', $src)) {
        $func->createThumb($w, $h, $z, $src, $wtmNews, "news", false, array(), 100, true);
    } else {
        $func->createThumb($w, $h, $z, $src, $wtmNews, "news");
    }
}, 'watermarkNews');




/* Router match */
$match = $router->match();

/* Router check */
if (is_array($match)) {
    if (is_callable($match['target'])) {
        call_user_func_array($match['target'], $match['params']);
    } else {
        $com = (!empty($match['params']['com'])) ? htmlspecialchars($match['params']['com']) : htmlspecialchars($match['target']);
        $getPage = !empty($_GET['p']) ? htmlspecialchars($_GET['p']) : 1;
    }
} else {
    header('HTTP/1.0 404 Not Found', true, 404);
    include("404.php");
    exit;
}


/* Setting */
$sqlCache = "select * from #_setting";
$setting = $cache->get($sqlCache, null, 'fetch', 7200);
$optsetting = (!empty($setting['options'])) ? json_decode($setting['options'], true) : null;


/* Lang */
if (!empty($match['params']['lang']))
    $_SESSION['lang'] = $match['params']['lang'];
else if (empty($_SESSION['lang']) && empty($match['params']['lang']))
    $_SESSION['lang'] = $optsetting['lang_default'];
$lang = $_SESSION['lang'];

/* Check lang */
$weblang = (!empty($config['website']['lang'])) ? array_keys($config['website']['lang']) : array();

if (!in_array($lang, $weblang)) {
    $_SESSION['lang'] = 'vi';
    $lang = $_SESSION['lang'];
}


$viSlug = [
    've-chung-toi',
    'san-pham',
    'dich-vu',
    'chung-chi',
    'tin-tuc',
    'chinh-sach',
    'lien-he',
];

$enSlug = [
    'about-us',
    'products',
    'services',
    'certificates',
    'news',
    'policy',
    'contact',
];
if (in_array($com, $viSlug)) {
    $_SESSION['lang'] = 'vi';
} else if (in_array($com, $enSlug)) {
    $_SESSION['lang'] = 'en';
}
$lang = $_SESSION['lang'];

/* Tối ưu link */
$requick = array(
    /* Sản phẩm */
    array("tbl" => "product_list", "field" => "idl", "source" => "product", "com" => "san-pham", "type" => "san-pham", 'priority_menu' => '0.8', 'priority_detail' => '0.6',),
    array("tbl" => "product_cat", "field" => "idc", "source" => "product", "com" => "san-pham", "type" => "san-pham", 'priority_menu' => '0.7', 'priority_detail' => '0.6',),
    array("tbl" => "product_item", "field" => "idi", "source" => "product", "com" => "san-pham", "type" => "san-pham", 'priority_menu' => '0.8', 'priority_detail' => '0.6',),
    // array("tbl" => "product_sub", "field" => "ids", "source" => "product", "com" => "san-pham", "type" => "san-pham", 'priority_menu' => '0.7', 'priority_detail' => '0.6',),
    array("tbl" => "product_brand", "field" => "idb", "source" => "product", "com" => "thuong-hieu", "type" => "san-pham", 'priority_menu' => '0.7', 'priority_detail' => '0.6',),
    array("tbl" => "product", "field" => "id", "source" => "product", "com" => "san-pham", "type" => "san-pham", "menu" => true),

    /* Tags */
    array("tbl" => "tags", "tbltag" => "product", "field" => "id", "source" => "tags", "com" => "tags-san-pham", "type" => "san-pham", "menu" => true, 'priority_menu' => '0.5', 'priority_detail' => '0.5',),
    // array("tbl" => "tags", "tbltag" => "news", "field" => "id", "source" => "tags", "com" => "doi-ngu-bac-si", "type" => "doi-ngu-bac-si", "menu" => true),
    // array("tbl" => "tags", "tbltag" => "news", "field" => "id", "source" => "tags", "com" => "tac-gia", "type" => "thu-vien-suc-khoe", "menu" => true),

    /* Tin tức */
    // array("tbl" => "news_list", "field" => "idl", "source" => "news", "com" => "dich-vu", "type" => "dich-vu"),
    // array("tbl" => "news", "field" => "id", "source" => "news", "com" => "dich-vu", "type" => "dich-vu", "menu" => true),

    array("tbl" => "news_list", "field" => "idl", "source" => "news", "com" => "tin-tuc", "type" => "tin-tuc", 'priority_menu' => '0.8', 'priority_detail' => '0.6',),
    array("tbl" => "news", "field" => "id", "source" => "news", "com" => "tin-tuc", "type" => "tin-tuc", "menu" => true, 'priority_menu' => '0.8', 'priority_detail' => '0.6',),
    /* Bài viết */

    array("tbl" => "news", "field" => "id", "source" => "news", "com" => "he-thong-cua-hang", "type" => "chi-nhanh", "menu" => true),
    array("tbl" => "news", "field" => "id", "source" => "news", "com" => "kien-thuc", "type" => "kien-thuc", "menu" => true),
    array("tbl" => "news", "field" => "id", "source" => "news", "com" => "catalogue", "type" => "catalogue", "menu" => true),
    array("tbl" => "news", "field" => "id", "source" => "news", "com" => "tai-lieu-ky-thuat", "type" => "tai-lieu-ky-thuat", "menu" => true),
    array("tbl" => "news", "field" => "id", "source" => "news", "com" => "tuyen-dung", "type" => "tuyen-dung", "menu" => false, 'priority_menu' => '0.5', 'priority_detail' => '0.5',),
    array("tbl" => "news", "field" => "id", "source" => "news", "com" => "chinh-sach", "type" => "chinh-sach", "menu" => false, 'priority_menu' => '0.5', 'priority_detail' => '0.5',),
    array("tbl" => "news", "field" => "id", "source" => "news", "com" => "huong-dan", "type" => "huong-dan", "menu" => false),


    /* Thư viện ảnh */
    // array("tbl"=>"product","field"=>"id","source"=>"product","com"=>"thu-vien-anh","type"=>"thu-vien-anh",'menu'=>true),

    /* Video */
    // array("tbl"=>"photo","field"=>"id","source"=>"video","com"=>"video","type"=>"video",'menu'=>true),

    /* Trang tĩnh */
    array("tbl" => "static", "field" => "id", "source" => "static", "com" => "gioi-thieu", "type" => "gioi-thieu", "menu" => true, 'priority_menu' => '0.5', 'priority_detail' => '0.5',),

    /* Liên hệ */
    array("tbl" => "", "field" => "id", "source" => "", "com" => "lien-he", "type" => "", "menu" => true, 'priority_menu' => '0.5', 'priority_detail' => '0.5',),
);

/* Find data */
if (!empty($com) && !in_array($com, ['tim-kiem', 'account', 'sitemap', 'gio-hang', 'ngon-ngu', 'thank-you', 'cam-on-da-dat-hang'])) {
    foreach ($requick as $k => $v) {
        $urlTbl = (!empty($v['tbl'])) ? $v['tbl'] : '';
        $urlTblTag = (!empty($v['tbltag'])) ? $v['tbltag'] : '';
        $urlType = (!empty($v['type'])) ? $v['type'] : '';
        $urlField = (!empty($v['field'])) ? $v['field'] : '';
        $urlCom = (!empty($v['com'])) ? $v['com'] : '';

        if (!empty($urlTbl) && !in_array($urlTbl, ['static', 'photo'])) {
            $row = $d->rawQueryOne("select id, slugvi, slugen from #_$urlTbl where (slugvi = ? or slugen = ?) and type = ? and find_in_set('hienthi',status) limit 0,1", array($com, $com, $urlType));

            if (!empty($row['id'])) {
                $_GET[$urlField] = $row['id'];
                if ($com == $row['slugvi']) {
                    $_SESSION['lang'] = 'vi';
                } else if ($com == $row['slugen']) {
                    $_SESSION['lang'] = 'en';
                }
                $lang = $_SESSION['lang'];
                $com = $urlCom;
                break;
            }
        }
    }
}


/* Slug lang */
$sluglang = 'slug' . $lang;

/* SEO Lang */
$seolang = $lang;

/* Require datas lang */
require_once LIBRARIES . "lang/web/$lang.php";

/* Switch coms */
switch ($com) {
    case 'lien-he':
        $source = "contact";
        $template = "contact/contact";
        $seo->set('type', 'object');
        $titleMain = lienhe;
        break;

    case 'gioi-thieu':
        $source = "static";
        $template = "static/about";
        $type = 'gioi-thieu';
        $seo->set('type', 'article');
        $titleMain = "Về chúng tôi";
        break;

    case 'tin-tuc':
        $source = "news";
        $template = isset($_GET['id']) ? "news/news_detail" : "news/dichvu";
        $seo->set('type', isset($_GET['id']) ? "article" : "object");
        $type = $com;
        $titleMain = "Tin tức";
        break;

    case 'dich-vu':
        $source = "news";
        $template = isset($_GET['id']) ? "news/news_detail" : "news/dichvu";
        $seo->set('type', isset($_GET['id']) ? "article" : "object");
        $type = $com;
        $titleMain = "Dịch vụ";
        break;

    case 'he-thong-cua-hang':
        $source = "news";
        $template = isset($_GET['id']) ? "news/news_detail" : "news/news";
        $seo->set('type', isset($_GET['id']) ? "article" : "object");
        $type = 'chi-nhanh';
        $titleMain = "Hệ thống cửa hàng";
        break;

    case 'catalogue':
        $source = "news";
        $template = isset($_GET['id']) ? "news/news_detail" : "news/news";
        $seo->set('type', isset($_GET['id']) ? "article" : "object");
        $type = $com;
        $titleMain = "Catalogue";
        break;
    case 'tai-lieu-ky-thuat':
        $source = "news";
        $template = isset($_GET['id']) ? "news/news_detail" : "news/news";
        $seo->set('type', isset($_GET['id']) ? "article" : "object");
        $type = $com;
        $titleMain = "Tài liệu kỹ thuật";
        break;
    case 'tin-tuc':
        $source = "news";
        $template = isset($_GET['id']) ? "news/news_detail" : "news/news";
        $seo->set('type', isset($_GET['id']) ? "article" : "object");
        $type = $com;
        $titleMain = "Tin tức";
        break;
    case 'kien-thuc':
        $source = "news";
        $template = isset($_GET['id']) ? "news/news_detail" : "news/news";
        $seo->set('type', isset($_GET['id']) ? "article" : "object");
        $type = $com;
        $titleMain = "Kiến thức";
        break;
    case 'chinh-sach':
        $source = "news";
        $template = isset($_GET['id']) ? "news/news_detail" : "";
        $seo->set('type', 'article');
        $type = $com;
        $titleMain = "Chính sách";
        break;

    case 'huong-dan':
        $source = "news";
        $template = isset($_GET['id']) ? "news/news_detail" : "";
        $seo->set('type', 'article');
        $type = $com;
        $titleMain = "Hướng dẫn";
        break;

    case 'thuong-hieu':
        $source = "product";
        $template = "product/brand";
        $seo->set('type', 'object');
        $type = 'san-pham';
        $titleMain = "Thương hiệu";
        break;

    case 'san-pham':
        $source = "product";
        $template = isset($_GET['id']) ? "product/product_detail" : "product/product";
        $seo->set('type', isset($_GET['id']) ? "article" : "object");
        $type = $com;
        $titleMain = "Sản phẩm";
        break;

    case 'thu-vien-anh':
        $source = "product";
        $template = isset($_GET['id']) ? "album/album_detail" : "album/album";
        $seo->set('type', isset($_GET['id']) ? "article" : "object");
        $type = $com;
        $titleMain = thuvienanh;
        break;

    // case 'video':
    // $source = "video";
    // $template = "video/video";
    // $type = $com;
    // $seo->set('type','object');
    // $titleMain = "Video";
    // break;

    case 'tim-kiem':
        $source = "search";
        $template = "product/product";
        $seo->set('type', 'object');
        $titleMain = timkiem;
        break;

    case 'tags-san-pham':
        $source = "tags";
        $template = "product/product_tags";
        $type = $urlType;
        $table = $urlTblTag;
        $seo->set('type', 'object');
        $titleMain = null;
        break;

    case 'tac-gia':
        $source = "tags";
        $template = "news/news";
        $type = $urlType;
        $table = $urlTblTag;
        $seo->set('type', 'object');
        $titleMain = null;
        break;

    case 'gio-hang':
        $source = "order";
        $template = 'order/order';
        $titleMain = giohang;
        $seo->set('type', 'object');
        break;

    case 'thank-you':
        $source = "static";
        $template = 'static/thankyou';
        $titleMain = null;
        $seo->set('type', 'object');
        break;

    case 'cam-on-da-dat-hang':
        $source = "thankyou";
        $template = 'thankyou/order';
        $type = 'order';
        $titleMain = "Cám ơn đã đặt hàng";
        $seo->set('type', 'object');
        break;

    case 'account':
        $source = "user";
        break;

    case 'ngon-ngu':
        if (isset($lang)) {
            switch ($lang) {
                case 'vi':
                    $_SESSION['lang'] = 'vi';
                    break;
                case 'en':
                    $_SESSION['lang'] = 'en';
                    break;
                default:
                    $_SESSION['lang'] = 'vi';
                    break;
            }
        }

        $url = $_SERVER['HTTP_REFERER'] ? $_SERVER['HTTP_REFERER'] : '/';
        $slugFromUrl = trim(parse_url($url, PHP_URL_PATH), '/');
        $redirectUrl = "";
        $comLangMap = [
            've-chung-toi' => 'about-us',
            'about-us' => 've-chung-toi',
            'san-pham' => 'products',
            'products' => 'san-pham',
            'news' => 'tin-tuc',
            'tin-tuc' => 'news',
            'dich-vu' => 'services',
            'services' => 'dich-vu',
            'chung-chi' => 'certificates',
            'certificates' => 'chung-chi',
            'tim-kiem' => 'search',
            'search' => 'tim-kiem',
            'chinh-sach' => 'policy',
            'policy' => 'chinh-sach',
            'lien-he' => 'contact',
            'contact' => 'lien-he',
            'gio-hang' => 'shopping-cart',
            'shopping-cart' => 'gio-hang'
        ];
        $redirectUrl = $slugFromUrl ? $comLangMap[$slugFromUrl] : "";
        if (!$redirectUrl && $slugFromUrl != '') {
            foreach ($requick as $k => $v) {
                $urlTbl = (!empty($v['tbl'])) ? $v['tbl'] : '';
                $urlType = (!empty($v['type'])) ? $v['type'] : '';
                $urlField = (!empty($v['field'])) ? $v['field'] : '';
                $urlCom = (!empty($v['com'])) ? $v['com'] : '';

                if (!empty($urlTbl) && !in_array($urlTbl, ['static', 'photo'])) {
                    $row = $d->rawQueryOne("select id, slugvi, slugen from #_$urlTbl where (slugvi = ? or slugen = ?) and type = ? and find_in_set('hienthi',status) limit 0,1", array($slugFromUrl, $slugFromUrl, $urlType));

                    if (!empty($row['id'])) {
                        $redirectUrl = $row['slug' . $lang];
                        break;
                    }
                }
            }
        }
        $func->redirect("/" . $redirectUrl);

        break;

    case 'sitemap':
        include_once LIBRARIES . "sitemap.php";
        exit();

    case '':
    case 'index':
        $source = "index";
        $template = "index/index";
        $seo->set('type', 'website');
        break;

    default:
        header('HTTP/1.0 404 Not Found', true, 404);
        include("404.php");
        exit();
}
/* Require datas for all page */
require_once SOURCES . "allpage.php";
/* Include sources */
if (!empty($source)) {
    include SOURCES . $source . ".php";
}
/* Include sources */
if (empty($template)) {
    header('HTTP/1.0 404 Not Found', true, 404);
    include("404.php");
    exit();
}
