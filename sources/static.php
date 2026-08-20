<?php
if (!defined('SOURCES'))
    die("Error");

/* Lấy bài viết tĩnh */
$static = $d->rawQueryOne("select id, type, name$lang, desc$lang, content$lang, photo, file_attach, date_created, date_updated, options from #_static where type = ? limit 0,1", array($type));

if ($type == 'gioi-thieu') {
    $about = $d->rawQueryOne("select name$lang, desc$lang, content$lang,file_attach, photo, photo1 from #_static where type = ? and find_in_set('hienthi',status) limit 0,1", array('gioi-thieu'));
    $sloganHistory = $d->rawQueryOne("select name$lang, desc$lang from #_static where type = ? limit 0,1", array('slogan-history'));
    $cauchuyen = $d->rawQueryOne("select id, type, name$lang, desc$lang, content$lang, photo, file_attach, date_created, date_updated, options from #_static where type = ? limit 0,1", array('cau-chuyen'));
    $tieuchis = $d->rawQuery("select id, name$lang, desc$lang, slugvi, slugen, photo, position from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('tieu-chi'));
    $team = $d->rawQuery("select id, name$lang, subname$lang, slugvi, slugen, photo, position from #_news where type = ? and find_in_set('gioithieu',status) order by numb,id desc", array('doi-ngu'));
    $duan = $d->rawQuery("select id, name$lang, desc$lang, slugvi, slugen, photo, position from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('du-an'));
    $lichsus = $d->rawQuery("select id, name$lang, desc$lang, slugvi, slugen, photo, date_timeline from #_news where type = ? and find_in_set('hienthi',status) order by (date_timeline = YEAR(NOW())) desc, numb asc, id desc
", array('lich-su-hinh-thanh'));
    $doingu = $d->rawQueryOne("select name$lang, desc$lang, photo from #_photo where type = ? and act = ? and find_in_set('hienthi',status) limit 0,1", array('doi-ngu-bac-si', 'photo_static'));
    $thongsos = $d->rawQuery("select id, name$lang, subname$lang, photo from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc limit 0,5", array('thong-so'));
    $doitacs = $d->rawQuery("select name$lang, link, photo from #_photo where type = ? and find_in_set('hienthi',status) order by numb, id desc", array('doi-tac'));

    $giatris = $d->rawQuery("select id, name$lang, desc$lang, photo from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc limit 0,8", array('gia-tri'));
    $tamnhin = $d->rawQueryOne("select id, type, name$lang, desc$lang, content$lang, photo, file_attach, date_created, date_updated, options from #_static where type = ? limit 0,1", array('tam-nhin'));
    $sumenh = $d->rawQueryOne("select id, type, name$lang, desc$lang, content$lang, photo, file_attach, date_created, date_updated, options from #_static where type = ? limit 0,1", array('su-menh'));
    $vanhoas = $d->rawQuery("select id, name$lang, desc$lang, photo from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc limit 0,8", array('van-hoa'));
}

if ($type == 'thu-mua-xe') {
    $quytrinhs = $d->rawQuery("select id, name$lang, desc$lang, slugvi, slugen, photo, position from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('quy-trinh-thu-mua'));

    $visaos = $d->rawQuery("select id, name$lang, desc$lang, slugvi, slugen, photo, position from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc limit 0,6", array('vi-sao'));
    $cauhois = $d->rawQuery("select id, name$lang, desc$lang, photo from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc limit 0,8", array('cau-hoi'));
    $videos = $d->rawQuery("select name$lang, photo, link from #_photo where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('video'));
    $hinhanhs = $d->rawQuery("select name$lang, photo, link from #_photo where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('hinh-anh'));
    $baochis = $d->rawQuery("select name$lang, photo, link from #_photo where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('bao-chi'));
    $baivietkhac = $d->rawQuery("select id, name$lang, content$lang from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc limit 0,8", array('thu-mua-xe'));
}

if ($com == 'thank-you') {
    $code = $flash->get("code");
    $order_date = $flash->get("order_date");
    $fullname = $flash->get("fullname");
    $email = $flash->get("email");
    $phone = $flash->get("phone");
    $address = $flash->get("address");
    $order_payment_text = $flash->get("order_payment_text");
}

/* SEO */
$seopage = $d->rawQueryOne("select * from #_seopage where type = ? limit 0,1", array($type));
$seo->set('h1', $titleMain);
if (!empty($seopage['title' . $seolang]))
    $seo->set('title', $seopage['title' . $seolang]);
else
    $seo->set('title', $titleMain);
if (!empty($seopage['keywords' . $seolang]))
    $seo->set('keywords', $seopage['keywords' . $seolang]);
if (!empty($seopage['description' . $seolang]))
    $seo->set('description', $seopage['description' . $seolang]);
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

/* breadCrumbs */
if (!empty($titleMain))
    $breadcr->set($com, $titleMain);
$breadcrumbs = $breadcr->get();
