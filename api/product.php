<?php
define('LAYOUT', 'layout/');
include "config.php";

/* Paginations */
include LIBRARIES . "class/class.PaginationsAjax.php";
$pagingAjax = new PaginationsAjax();
$pagingAjax->perpage = (!empty($_GET['perpage'])) ? htmlspecialchars($_GET['perpage']) : 1;
$eShow = htmlspecialchars($_GET['eShow']);
$isPage = (isset($_GET['isPage']) && $_GET['isPage'] > 0) ? htmlspecialchars($_GET['isPage']) : 0;
$idList = (!empty($_GET['idList'])) ? htmlspecialchars($_GET['idList']) : 0;
$idCat = (isset($_GET['idCat']) && $_GET['idCat'] > 0) ? htmlspecialchars($_GET['idCat']) : 0;
$status = (!empty($_GET['status'])) ? htmlspecialchars($_GET['status']) : '';
$show = (!empty($_GET['show'])) ? htmlspecialchars($_GET['show']) : '';

$p = (!empty($_GET['p'])) ? htmlspecialchars($_GET['p']) : 1;
$start = ($p - 1) * $pagingAjax->perpage;
$pageLink = "api/product.php?perpage=" . $pagingAjax->perpage;
$tempLink = "";
$where = "";
$params = array();

/* Math url */
if ($idList>0) {
    $tempLink .= "&idList=" . $idList;
    $where .= " and id_list = ?";
    array_push($params, $idList);
    // $productList = $d->rawQueryOne("select id, name$lang, desc$lang, slugvi, slugen, type, photo, options from #_product_list where id = ? and type = ? limit 0,1", array($idList, 'san-pham'));

}
if ($idCat>0) {
    $tempLink .= "&idCat=" . $idCat;
    $where .= " and id_cat = ?";
    array_push($params, $idCat);
}
if ($status) {
    $tempLink .= "&status=" . $status;
    $where .= " and find_in_set('$status',status)";
}
$tempLink .= "&p=";
$pageLink .= $tempLink;

/* Get data */
$sql = "select name$lang, slugvi, slugen, id, photo,desc$lang, regular_price, sale_price, discount, attributes, type from #_product where type='san-pham' $where and find_in_set('hienthi',status) order by numb,id desc";
$sqlCache = $sql . " limit $start, $pagingAjax->perpage";
$items = $cache->get($sqlCache, $params, 'result', 7200);

/* Count all data */
$countItems = count($cache->get($sql, $params, 'result', 7200));


/* Get page result */
if($isPage){ $pagingItems = $pagingAjax->getAllPageLinks($countItems, $pageLink, $eShow); }
?>
<?php if ($countItems) {
    if($show == 'owl'){
?>
<div class="owl-page owl-carousel owl-theme" data-items="screen:0|items:2|margin:20,screen:425|items:2|margin:30,screen:575|items:3|margin:20,screen:767|items:3|margin:30,screen:991|items:4|margin:20,screen:1199|items:4|margin:30" data-rewind="1" data-autoplay="1" data-loop="0" data-lazyload="0" data-mousedrag="1" data-touchdrag="1" data-smartspeed="300" data-autoplayspeed="500" data-autoplaytimeout="3500" data-dots="1" data-nav="0" data-navcontainer="">
    <?php foreach ($items as $k => $v) { ?>
        <?php include TEMPLATE . LAYOUT . "blocks/product.php"; ?>
    <?php } ?>
</div>
<?php }else{ ?>
    <div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5">
        <?php foreach ($items as $k => $v) { ?>
            <div class="col d-flex mb-3" data-aos="fade-up">
                <?php include TEMPLATE . LAYOUT . "blocks/product.php"; ?>
            </div>
        <?php } ?>
    </div>
    <?php if($isPage){ ?>
    <div class="pagination-ajax"><?= $pagingItems ?></div>
    <?php } ?>
<?php }
}else { ?>
<div class="alert alert-warning w-100" role="alert">
    <strong><?= khongtimthayketqua ?></strong>
</div>
<?php } ?>