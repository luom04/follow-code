<?php

// /* Sản phẩm */
$nametype = "san-pham";
$config['product'][$nametype]['title_main'] = "Chi tiết sản phẩm";
$config['product'][$nametype]['dropdown'] = true;
$config['product'][$nametype]['list'] = true;
$config['product'][$nametype]['cat'] = true;
$config['product'][$nametype]['item'] = true;
$config['product'][$nametype]['sub'] = false;
$config['product'][$nametype]['brand'] = true;
$config['product'][$nametype]['color'] = false;
$config['product'][$nametype]['size'] = false;
$config['product'][$nametype]['tags'] = false;
$config['product'][$nametype]['attr'] = false;
$config['product'][$nametype]['import'] = false;
$config['product'][$nametype]['export'] = false;
$config['product'][$nametype]['view'] = true;
$config['product'][$nametype]['copy'] = true;
$config['product'][$nametype]['copy_image'] = true;
$config['product'][$nametype]['comment'] = false;
$config['product'][$nametype]['slug'] = true;
$config['product'][$nametype]['check'] = array("noibat" => "Trang chủ", "hienthi" => "Hiển thị");
$config['product'][$nametype]['images'] = true;
$config['product'][$nametype]['icon'] = false;
$config['product'][$nametype]['show_images'] = true;
$config['product'][$nametype]['gallery'] = array(
    $nametype => array(
        "title_main_photo" => "Hình ảnh",
        // "title_sub_photo" => "Biến thể",
        "check_photo" => array("conhang" => "Còn hàng", "hienthi" => "Hiển thị"),
        "number_photo" => 1,
        "images_photo" => true,
        "cart_photo" => true,
        "avatar_photo" => true,
        "name_photo" => false,
        "width_photo" => 1000,
        "height_photo" => 1000,
        "thumb_photo" => '100x100x1',
        "img_type_photo" => '.jpg|.gif|.png|.jpeg|.gif|.webp|.WEBP|svg'
    ),
    // "noi-dung" => array(
    //     "title_main_photo" => "Nội dung sản phẩm",
    //     "title_sub_photo" => "Nội dung",
    //     "check_photo" => array("hienthi" => "Hiển thị"),
    //     "number_photo" => 1,
    //     "images_photo" => false,
    //     "content_photo" => true,
    //     "content_cke_photo" => true,
    //     "avatar_photo" => true,
    //     "name_photo" => true,
    //     "width_photo" => 620,
    //     "height_photo" => 360,
    //     "thumb_photo" => '100x100x1',
    //     "img_type_photo" => '.jpg|.gif|.png|.jpeg|.gif|.webp|.WEBP|svg'
    // )
);
$config['product'][$nametype]['code'] = true; // Mã sản phẩm
$config['product'][$nametype]['regular_price'] = true; // Giá gốc
$config['product'][$nametype]['sale_price'] = true; // Giá bán
$config['product'][$nametype]['discount'] = true; // Giảm giá
$config['product'][$nametype]['quatang'] = false; // gộp giá quà tặng kèm
$config['product'][$nametype]['quatang_cke'] = false;
$config['product'][$nametype]['muakem'] = false;
$config['product'][$nametype]['tags'] = false;
$config['product'][$nametype]['desc'] = true;
$config['product'][$nametype]['desc_cke'] = true;
$config['product'][$nametype]['content'] = true;
$config['product'][$nametype]['content_cke'] = true;
$config['product'][$nametype]['baohanh'] = false;
$config['product'][$nametype]['thongso'] = true;
$config['product'][$nametype]['thongso_cke'] = true;
$config['product'][$nametype]['boloc'] = false;
$config['product'][$nametype]['city'] = false;
$config['product'][$nametype]['ward'] = false;
$config['product'][$nametype]['schema'] = true;
$config['product'][$nametype]['linkvideo'] = false; // link video
$config['product'][$nametype]['seo'] = true;
$config['product'][$nametype]['width'] = 550;
$config['product'][$nametype]['height'] = 550;
$config['product'][$nametype]['thumb'] = '100x69x1';
$config['product'][$nametype]['width_icon'] = 30;
$config['product'][$nametype]['height_icon'] = 30;
$config['product'][$nametype]['thumb_icon'] = '100x100x1';
$config['product'][$nametype]['img_type'] = '.jpg|.gif|.png|.jpeg|.gif|.webp|.WEBP|svg';

/* Sản phẩm (Attrs) */
// $config['product'][$nametype]['title_main_attr'] = "Thuộc tính";
// $config['product'][$nametype]['check_attr'] = array("hienthi" => "Hiển thị");
// $config['product'][$nametype]['chu_attr'] = true;
// $config['product'][$nametype]['images_attr'] = false;
// $config['product'][$nametype]['color_attr'] = false;
// $config['product'][$nametype]['width_attr'] = 30;
// $config['product'][$nametype]['height_attr'] = 30;
// $config['product'][$nametype]['thumb_attr'] = '100x100x1';
// $config['product'][$nametype]['img_type_attr'] = '.jpg|.gif|.png|.jpeg|.gif|.webp|.WEBP|svg';

/* Sản phẩm (Size) */
// $config['product'][$nametype]['title_main_size'] = "Kích thước";
// $config['product'][$nametype]['check_size'] = array("hienthi" => "Hiển thị");
// $config['product'][$nametype]['size_images'] = false;
// $config['product'][$nametype]['width_size'] = 400;
// $config['product'][$nametype]['height_size'] = 240;
// $config['product'][$nametype]['thumb_size'] = '100x60x1';
// $config['product'][$nametype]['img_type_size'] = '.jpg|.gif|.png|.jpeg|.gif|.webp|.WEBP|svg';

/* Sản phẩm (Color) */
// $config['product'][$nametype]['title_main_color'] = "Màu sắc";
// $config['product'][$nametype]['check_color'] = array("hienthi" => "Hiển thị");
// $config['product'][$nametype]['color_images'] = false;
// $config['product'][$nametype]['color_code'] = true;
// $config['product'][$nametype]['color_type'] = false;
// $config['product'][$nametype]['width_color'] = 30;
// $config['product'][$nametype]['height_color'] = 30;
// $config['product'][$nametype]['thumb_color'] = '100x100x1';
// $config['product'][$nametype]['img_type_color'] = '.jpg|.gif|.png|.jpeg|.gif|.webp|.WEBP|svg';

/* Sản phẩm (List) */
$config['product'][$nametype]['title_main_list'] = "Danh mục cấp 1";
$config['product'][$nametype]['images_list'] = true;
$config['product'][$nametype]['show_images_list'] = true;
$config['product'][$nametype]['slug_list'] = true;
$config['product'][$nametype]['check_list'] = array("noibat" => "Nổi bật", "hienthi" => "Hiển thị");
$config['product'][$nametype]['gallery_list'] = array();
$config['product'][$nametype]['desc_list'] = false;
$config['product'][$nametype]['desc_cke_list'] = false;
$config['product'][$nametype]['content_list'] = true;
$config['product'][$nametype]['content_cke_list'] = true;
$config['product'][$nametype]['seo_list'] = true;
$config['product'][$nametype]['width_list'] = 100;
$config['product'][$nametype]['height_list'] = 100;
$config['product'][$nametype]['thumb_list'] = '100x100x1';
$config['product'][$nametype]['icon_list'] = false;
$config['product'][$nametype]['width_icon_list'] = 200;
$config['product'][$nametype]['height_icon_list'] = 130;
$config['product'][$nametype]['thumb_icon_list'] = '100x65x1';
$config['product'][$nametype]['img_type_list'] = '.jpg|.gif|.png|.jpeg|.gif|.webp|.WEBP|svg';

/* Sản phẩm (Cat) */
$config['product'][$nametype]['title_main_cat'] = "Danh mục cấp 2";
$config['product'][$nametype]['images_cat'] = true;
$config['product'][$nametype]['show_images_cat'] = true;
$config['product'][$nametype]['slug_cat'] = true;
$config['product'][$nametype]['check_cat'] = array("noibat" => "Nổi bật", "hienthi" => "Hiển thị");
$config['product'][$nametype]['desc_cat'] = false;
$config['product'][$nametype]['desc_cke_cat'] = false;
$config['product'][$nametype]['content_cat'] = true;
$config['product'][$nametype]['content_cke_cat'] = true;
$config['product'][$nametype]['seo_cat'] = true;
$config['product'][$nametype]['width_cat'] = 223;
$config['product'][$nametype]['height_cat'] = 223;
$config['product'][$nametype]['thumb_cat'] = '223x223x1';
$config['product'][$nametype]['img_type_cat'] = '.jpg|.gif|.png|.jpeg|.gif|.webp|.WEBP|svg';

/* Sản phẩm (Item) */
$config['product'][$nametype]['title_main_item'] = "Danh mục cấp 3";
$config['product'][$nametype]['images_item'] = true;
$config['product'][$nametype]['show_images_item'] = true;
$config['product'][$nametype]['slug_item'] = true;
$config['product'][$nametype]['check_item'] = array("hienthi" => "Hiển thị");
$config['product'][$nametype]['desc_item'] = false;
$config['product'][$nametype]['desc_cke_item'] = false;
$config['product'][$nametype]['content_item'] = true;
$config['product'][$nametype]['content_cke_item'] = true;
$config['product'][$nametype]['seo_item'] = true;
$config['product'][$nametype]['width_item'] = 500;
$config['product'][$nametype]['height_item'] = 400;
$config['product'][$nametype]['thumb_item'] = '100x100x1';
$config['product'][$nametype]['img_type_item'] = '.jpg|.gif|.png|.jpeg|.gif|.webp|.WEBP|svg';

/* Sản phẩm (Sub) */
$config['product'][$nametype]['title_main_sub'] = danhmuccap4;
$config['product'][$nametype]['images_sub'] = false;
$config['product'][$nametype]['show_images_sub'] = false;
$config['product'][$nametype]['slug_sub'] = true;
$config['product'][$nametype]['check_sub'] = array("hienthi" => "Hiển thị");
$config['product'][$nametype]['desc_sub'] = false;
$config['product'][$nametype]['desc_cke_sub'] = false;
$config['product'][$nametype]['content_sub'] = true;
$config['product'][$nametype]['content_cke_sub'] = true;
$config['product'][$nametype]['seo_sub'] = true;
$config['product'][$nametype]['width_sub'] = 300;
$config['product'][$nametype]['height_sub'] = 200;
$config['product'][$nametype]['thumb_sub'] = '100x100x1';
$config['product'][$nametype]['img_type_sub'] = '.jpg|.gif|.png|.jpeg|.gif|.webp|.WEBP|svg';

/* Sản phẩm (Hãng) */
$config['product'][$nametype]['title_main_brand'] = "Thương hiệu";
$config['product'][$nametype]['list_brand'] = false;
$config['product'][$nametype]['images_brand'] = true;
$config['product'][$nametype]['show_images_brand'] = true;
$config['product'][$nametype]['slug_brand'] = true;
$config['product'][$nametype]['check_brand'] = array("noibat" => "Trang chủ", "noibat2" => "Trang trong", "hienthi" => "Hiển thị");
$config['product'][$nametype]['seo_brand'] = true;
$config['product'][$nametype]['width_brand'] = 240;
$config['product'][$nametype]['height_brand'] = 120;
$config['product'][$nametype]['thumb_brand'] = '100x65x2';
$config['product'][$nametype]['img_type_brand'] = '.jpg|.gif|.png|.jpeg|.gif|.webp|.WEBP|svg';


/* Thư viện ảnh */
$nametype = "thu-vien-anh";
$config['product'][$nametype]['title_main'] = thuvienanh;
$config['product'][$nametype]['check'] = array("hienthi" => "Hiển thị");
$config['product'][$nametype]['view'] = true;
$config['product'][$nametype]['copy'] = true;
$config['product'][$nametype]['copy_image'] = true;
$config['product'][$nametype]['slug'] = true;
$config['product'][$nametype]['images'] = true;
$config['product'][$nametype]['show_images'] = true;
$config['product'][$nametype]['gallery'] = array(
    $nametype => array(
        "title_main_photo" => hinhanhthuvienanh,
        "title_sub_photo" => hinhanh,
        "check_photo" => array("hienthi" => "Hiển thị"),
        "number_photo" => 2,
        "images_photo" => true,
        "avatar_photo" => true,
        "name_photo" => true,
        "width_photo" => 540,
        "height_photo" => 540,
        "thumb_photo" => '100x100x1',
        "img_type_photo" => '.jpg|.gif|.png|.jpeg|.gif|.webp|.WEBP|svg'
    )
);
$config['product'][$nametype]['seo'] = true;
$config['product'][$nametype]['width'] = 270;
$config['product'][$nametype]['height'] = 270;
$config['product'][$nametype]['thumb'] = '100x100x1';
$config['product'][$nametype]['img_type'] = '.jpg|.gif|.png|.jpeg|.gif|.webp|.WEBP|svg';
