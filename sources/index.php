<?php
if (!defined('SOURCES')) die("Error");
/* static */
$popup = $cache->get("select name$lang, photo, link from #_photo where type = ? and act = ? and find_in_set('hienthi',status) limit 0,1", array('popup', 'photo_static'), 'fetch', 7200);
$bannervs = $cache->get("select name$lang, photo, link from #_photo where type = ? and act = ? and find_in_set('hienthi',status) limit 0,1", array('banner-vs', 'photo_static'), 'fetch', 7200);
$bannerfaq = $cache->get("select name$lang, photo, link from #_photo where type = ? and act = ? and find_in_set('hienthi',status) limit 0,1", array('banner-faq', 'photo_static'), 'fetch', 7200);
$bannerform = $cache->get("select name$lang, photo, link from #_photo where type = ? and act = ? and find_in_set('hienthi',status) limit 0,1", array('banner-form', 'photo_static'), 'fetch', 7200);
$slider = $cache->get("select name$lang, desc$lang, photo, link, link_video from #_photo where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('slide'), 'result', 7200);
$bannerBottom = $cache->get("select name$lang, desc$lang, photo, link, link_video from #_photo where type = ? and find_in_set('hienthi',status) order by numb,id desc limit 0,2", array('banner-bottom'), 'result', 7200);
$SliderBaochi = $d->rawQuery("select name$lang, desc$lang, link, photo from #_photo where type = ? and find_in_set('hienthi',status) order by numb, id desc", array('bao-chi'));

$productCatsHot = $d->rawQuery("select name$lang, slugvi, slugen, photo, id from #_product_cat where type= ? and find_in_set('hienthi',status) order by numb,id desc", array('san-pham'));
$visaos = $d->rawQuery("select id, name$lang, desc$lang, slugvi, slugen, photo, position from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc limit 0,6", array('vi-sao'));


$dichvu = $d->rawQueryOne("select name$lang, desc$lang, photo from #_static where type = ? limit 0,1", array('dich-vu'));
$products = $d->rawQuery("select id, name$lang, slugvi, slugen, photo, regular_price, sale_price, discount, attributes from #_product where type = ? and find_in_set('noibat',status) and find_in_set('hienthi',status)", array('san-pham'));
$productSales = $d->rawQuery("select id, name$lang, slugvi, slugen, photo, regular_price, sale_price, discount, attributes from #_product where type = ? and find_in_set('noibat',status) and find_in_set('hienthi',status)", array('san-pham'));

$about = $d->rawQueryOne("select name$lang, desc$lang, content$lang, photo from #_static where type = ? and find_in_set('hienthi',status) limit 0,1", array('gioi-thieu'));
$news = $d->rawQuery("select id, name$lang, desc$lang, slugvi, slugen, photo, attributes, date_created, type from #_news where type = ? and find_in_set('noibat',status) and find_in_set('hienthi',status) order by numb,id desc limit 0,10", array('tin-tuc'));
$kienthuc = $d->rawQuery("select id, name$lang, desc$lang, slugvi, slugen, photo, date_created, type from #_news where type = ? and find_in_set('noibat',status) and find_in_set('hienthi',status) order by numb,id desc limit 0,6", array('kien-thuc'));
$criteria = $d->rawQuery("select id, name$lang, desc$lang, slugvi, slugen, photo, attributes, date_created, type from #_news where type = ?  and find_in_set('hienthi',status) order by numb,id desc limit 0,10", array('tieu-chi'));
$faq = $d->rawQuery("select name$lang, desc$lang, id from #_news where type = ? and find_in_set('hienthi',status) order by numb, id desc", array('cau-hoi'));
$feedback = $d->rawQuery("select name$lang,subname$lang, desc$lang,photo,icon, id from #_news where type = ? and find_in_set('hienthi',status) order by numb, id desc", array('khach-hang'));
$doitacs = $d->rawQuery("select name$lang, link, photo from #_photo where type = ? and find_in_set('hienthi',status) order by numb, id desc", array('doi-tac'));



/* multi */
// $brand = $cache->get("select name$lang, slugvi, slugen, id, photo from #_product_brand where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('san-pham'), 'result', 7200);
$productHot = $d->rawQuery("select id, name$lang, slugvi,desc$lang, slugen, photo, regular_price, sale_price, discount from #_product where type = ? and find_in_set('noibat',status) and find_in_set('hienthi',status)", array('san-pham'));
$proListHot = $d->rawQuery("select name$lang, slugvi, slugen, id from #_product_list where type = ? and find_in_set('noibat',status) and find_in_set('hienthi',status) order by numb,id desc", array('san-pham'));
// $videoHot = $d->rawQuery("select id,name$lang, link_video from #_photo where type = ? and find_in_set('noibat',status) and find_in_set('hienthi',status)", array('video'));

/* SEO */
$seopage = $d->rawQueryOne("select * from #_seopage where type = ? limit 0,1", array('trang-chu'));
$seo->set('h1', $seopage['title' . $seolang]);
if (!empty($seopage['title' . $seolang])) $seo->set('title', $seopage['title' . $seolang]);
else $seo->set('title', $titleMain);
if (!empty($seopage['keywords' . $seolang])) $seo->set('keywords', $seopage['keywords' . $seolang]);
if (!empty($seopage['description' . $seolang])) $seo->set('description', $seopage['description' . $seolang]);
$seo->set('url', $func->getPageURL());
$imgJson = (!empty($seopage['options'])) ? json_decode($seopage['options'], true) : null;
if (!empty($seopage['photo'])) {
    if (empty($imgJson) || ($imgJson['p'] != $seopage['photo'])) {
        $imgJson = $func->getImgSize($seopage['photo'], UPLOAD_SEOPAGE_L . $seopage['photo']);
        $seo->updateSeoDB(json_encode($imgJson), 'seopage', $seopage['id']);
    }
    if (!empty($imgJson)) {
        $seo->set('photo', $configBase . THUMBS . '/' . $imgJson['w'] . 'x' . $imgJson['h'] . 'x2/' . UPLOAD_SEOPAGE_L . $seopage['photo']);
        $seo->set('photo:width', $imgJson['w']);
        $seo->set('photo:height', $imgJson['h']);
        $seo->set('photo:type', $imgJson['m']);
    }
}
