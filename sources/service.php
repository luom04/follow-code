<?php
if (!defined('SOURCES')) die("Error");

@$id = htmlspecialchars($_GET['id']);
@$idl = htmlspecialchars($_GET['idl']);
@$idc = htmlspecialchars($_GET['idc']);
@$idi = htmlspecialchars($_GET['idi']);
@$ids = htmlspecialchars($_GET['ids']);
if ($idl != '') {
    /* Lấy cấp 1 detail */
    $newsList = $d->rawQueryOne("select id, name$lang, desc$lang, slugvi, slugen, type, photo, options from #_news_list where id = ? and type = ? limit 0,1", array($idl, $type));

    /* SEO */
    $titleCate = $newsList['name' . $lang];
    $seoDB = $seo->getOnDB($newsList['id'], 'news', 'man_list', $newsList['type']);
    $seo->set('h1', $newsList['name' . $lang]);
    if (!empty($seoDB['title' . $seolang])) $seo->set('title', $seoDB['title' . $seolang]);
    else $seo->set('title', $newsList['name' . $lang]);
    if (!empty($seoDB['keywords' . $seolang])) $seo->set('keywords', $seoDB['keywords' . $seolang]);
    if (!empty($seoDB['description' . $seolang])) $seo->set('description', $seoDB['description' . $seolang]);
    $seo->set('url', $func->getPageURL());
    $imgJson = (!empty($newsList['options'])) ? json_decode($newsList['options'], true) : null;
    if (empty($imgJson) || ($imgJson['p'] != $newsList['photo'])) {
        $imgJson = $func->getImgSize($newsList['photo'], UPLOAD_NEWS_L . $newsList['photo']);
        $seo->updateSeoDB(json_encode($imgJson), 'news_list', $newsList['id']);
    }
    if (!empty($imgJson)) {
        $seo->set('photo', $configBase . THUMBS . '/' . $imgJson['w'] . 'x' . $imgJson['h'] . 'x2/' . UPLOAD_NEWS_L . $newsList['photo']);
        $seo->set('photo:width', $imgJson['w']);
        $seo->set('photo:height', $imgJson['h']);
        $seo->set('photo:type', $imgJson['m']);
    }

    /* Lấy bài viết */
    $where = "";
    $where = "id_list = ? and type = ? and find_in_set('hienthi',status)";
    $params = array($idl, $type);

    $curPage = $getPage;
    $perPage = 1000;
    $startpoint = ($curPage * $perPage) - $perPage;
    $limit = " limit " . $startpoint . "," . $perPage;
    $sql = "select id, name$lang, slugvi, slugen, photo, date_created, desc$lang, content$lang, position from #_news where $where order by numb,id desc $limit";
    $news = $d->rawQuery($sql, $params);
    $sqlNum = "select count(*) as 'num' from #_news where $where order by numb,id desc";
    $count = $d->rawQueryOne($sqlNum, $params);
    $total = (!empty($count)) ? $count['num'] : 0;
    $url = $func->getCurrentPageURL();
    $paging = $func->pagination($total, $perPage, $curPage, $url);

    /* breadCrumbs */
    if (!empty($titleMain)) $breadcr->set($com, $titleMain);
    if (!empty($newsList)) $breadcr->set($newsList[$sluglang], $newsList['name' . $lang]);
    $breadcrumbs = $breadcr->get();

    $html_breadcrumbs = '<div>
        <h1>'.$newsList['name'.$lang].'</h1>
        <h5>'.$newsList['desc'.$lang].'</h5>
    </div>';
}