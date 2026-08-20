<?php
if (!defined('SOURCES')) die("Error");

$id = htmlspecialchars($_GET['id']);
if ($id) {
    /* Lấy tag detail */
    $rowDetail = $d->rawQueryOne("select id, name$lang, desc$lang, content$lang, content1$lang, content2$lang, content3$lang, type, photo, slugvi, slugen, options, attributes from #_tags where id = ? and type = ? limit 0,1", array($id, $type));
    $bannerqc = null;
    $attrs = json_decode($rowDetail['attributes'],true);
    /* SEO */
    $titleMain = $rowDetail['name' . $lang];
    $seoDB = $seo->getOnDB($rowDetail['id'], 'tags', 'man', $rowDetail['type']);
    $seo->set('h1', $rowDetail['name' . $lang]);
    if (!empty($seoDB['title' . $seolang])) $seo->set('title', $seoDB['title' . $seolang]);
    else $seo->set('title', $rowDetail['name' . $lang]);
    if (!empty($seoDB['keywords' . $seolang])) $seo->set('keywords', $seoDB['keywords' . $seolang]);
    if (!empty($seoDB['description' . $seolang])) $seo->set('description', $seoDB['description' . $seolang]);
    $seo->set('url', $func->getPageURL());
    $imgJson = (!empty($rowDetail['options'])) ? json_decode($rowDetail['options'], true) : null;
    if (empty($imgJson) || ($imgJson['p'] != $rowDetail['photo'])) {
        $imgJson = $func->getImgSize($rowDetail['photo'], UPLOAD_TAGS_L . $rowDetail['photo']);
        $seo->updateSeoDB(json_encode($imgJson), 'tags', $rowDetail['id']);
    }
    if (!empty($imgJson)) {
        $seo->set('photo', $configBase . THUMBS . '/' . $imgJson['w'] . 'x' . $imgJson['h'] . 'x2/' . UPLOAD_TAGS_L . $rowDetail['photo']);
        $seo->set('photo:width', $imgJson['w']);
        $seo->set('photo:height', $imgJson['h']);
        $seo->set('photo:type', $imgJson['m']);
    }

    /* breadCrumbs */
    if (!empty($titleMain)) $breadcr->set($rowDetail[$sluglang], $titleMain);
    $breadcrumbs = $breadcr->get();
    $breadcrumbs = null;
}else{
    $bannerqc = $cache->get("select name$lang, photo, link from #_photo where type = ? and act = ? and find_in_set('hienthi',status) limit 0,1", array('doi-ngu', 'photo_static'), 'fetch', 7200);
    $doingus = $d->rawQuery("select name$lang, desc$lang, slugvi, slugen, photo, attributes, id from #_tags where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('doi-ngu-bac-si'));
    /* SEO */
    $seopage = $d->rawQueryOne("select * from #_seopage where type = ? limit 0,1", array('doi-ngu-bac-si'));
    $seo->set('h1', $titleMain);
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

    /* breadCrumbs */
    if (!empty($titleMain)) $breadcr->set($com, $titleMain);
    $breadcrumbs = $breadcr->get();
}
