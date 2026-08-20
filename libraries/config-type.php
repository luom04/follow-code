<?php
/* Config type - Group */
$config['group'] = array(
    'Group Giới Thiệu' => array(
        array(
            'photo_static' => array('gioi-thieu'),
        ),
        array(
            'static' => array('gioi-thieu'),
            'news' => array('lich-su-hinh-thanh', 'van-hoa', ),
        ),
        array(
            'static' => array('tam-nhin', 'su-menh'),
            'news' => array('gia-tri', 'thong-so'),
        ),
        array(
            'photo' => array('doi-tac')
        )
    ),
    
);
// Tạo riêng group sản phẩm
$productGroup = array();
// Nếu có watermark thì thêm vào
if (!empty($config['watermark']['active'])) {
    $productGroup[] = array(
        'photo_static' => array('watermark'),
    );
}
// Các phần còn lại
$productGroup[] = array(
    'photo' => array('san-pham'),
    'product' => array('san-pham'),
    'tags' => array('san-pham', 'bo-loc-gia'),
);

// Gán lại
$config['group']['Group Sản Phẩm'] = $productGroup;
/* Config type - Product */
require_once LIBRARIES . 'type/config-type-product.php';

/* Config type - Tags */
require_once LIBRARIES . 'type/config-type-tags.php';

/* Config type - Newsletter */
require_once LIBRARIES . 'type/config-type-newsletter.php';

/* Config type - News */
require_once LIBRARIES . 'type/config-type-news.php';

/* Config type - Static */
require_once LIBRARIES . 'type/config-type-static.php';

/* Config type - Photo */
require_once LIBRARIES . 'type/config-type-photo.php';

/* Seo page */
$config['seopage']['page'] = array(
    "trang-chu" => "Trang chủ",
    "gioi-thieu" => "Giới thiệu",
    "san-pham" => "Sản phẩm",
    "dich-vu" => "Dịch vụ",
    "tin-tuc" => "Tin tức",
    "lien-he" => "Liên hệ"
);
$config['seopage']['width'] = 1200;
$config['seopage']['height'] = 628;
$config['seopage']['thumb'] = '1200x628x2';
$config['seopage']['img_type'] = '.jpg|.gif|.png|.jpeg|.gif|.webp|.WEBP';

/* Setting */
$config['setting']['address'] = true;
$config['setting']['phone'] = true;
$config['setting']['hotline'] = true;
$config['setting']['zalo'] = true;
$config['setting']['oaidzalo'] = false;
$config['setting']['email'] = true;
$config['setting']['website'] = true;
$config['setting']['fanpage'] = true;
$config['setting']['coords'] = true;
$config['setting']['coords_iframe'] = true;
$config['setting']['worktime'] = true;
$config['setting']['footer'] = false;
$config['setting']['link_googlemaps'] = true;

/* Quản lý import */
$config['import']['images'] = false;
$config['import']['thumb'] = '100x100x1';
$config['import']['img_type'] = ".jpg|.gif|.png|.jpeg|.gif|.webp|.WEBP";

/* Quản lý export */
$config['export']['category'] = true;

/* Quản lý tài khoản */
$config['user']['active'] = false;
$config['user']['admin'] = false;
$config['user']['images'] = true;
$config['user']['check_admin'] = array("hienthi" => "Kích hoạt");
$config['user']['member'] = false;
$config['user']['check_member'] = array("hienthi" => "Kích hoạt");
$config['user']['width'] = 100;
$config['user']['height'] = 100;
$config['user']['thumb'] = '100x100x1';
$config['user']['img_type'] = '.jpg|.gif|.png|.jpeg|.gif|.JPG|.PNG|.JPEG|.Png|.GIF';
/* Quản lý phân quyền */
$config['permission']['active'] = false;
$config['permission']['check'] = array("hienthi" => "Kích hoạt");

/* Quản lý liên lệ */
$config['contact']['check'] = array("hienthi" => "Xác nhận");

/* Quản lý địa điểm */
$config['places']['active'] = false;
$config['places']['check_city'] = array("hienthi" => "Hiển thị");
$config['places']['check_district'] = array("hienthi" => "Hiển thị");
$config['places']['check_ward'] = array("hienthi" => "Hiển thị");
$config['places']['placesship'] = true;

/* Quản lý giỏ hàng */
$config['order']['active'] = false;
$config['order']['search'] = false;
$config['order']['excel'] = false;
$config['order']['word'] = false;
$config['order']['excelall'] = false;
$config['order']['wordall'] = false;
$config['order']['thumb'] = '100x100x1';

/* Quản lý thông báo đẩy */
$config['onesignal'] = false;

if ($config['website']['linkredirect'] == true) {
    $config['photo']['man_photo']['dieuhuonglink']['title_main_photo'] = "Link Redirect";
    $config['photo']['man_photo']['dieuhuonglink']['check_photo'] = array("hienthi" => "Hiển thị");
    $config['photo']['man_photo']['dieuhuonglink']['number_photo'] = 5;
    $config['photo']['man_photo']['dieuhuonglink']['loaidieuhuong_photo'] = true;
    $config['photo']['man_photo']['dieuhuonglink']['link_photo'] = true;
    $config['photo']['man_photo']['dieuhuonglink']['link2_photo'] = true;
}