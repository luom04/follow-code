<?php
define('LAYOUT', 'layout/');
include "config.php";

$lang = $config['website']['lang-default'] ?? 'vi';

$type   = $_GET['type'] ?? '';
$list = (int)($_GET['list'] ?? 0);
$offset = (int)($_GET['offset'] ?? 0);
$limit  = (int)($_GET['limit'] ?? 8);
$where2 = "";
if ($list) {
    $where2 .= " and id_list = $list";
}

$where = "type = ? AND find_in_set('hienthi',status)";

$params = [$type];
$sql = "  select  photo, name$lang,desc$lang, slugvi, slugen, sale_price, regular_price, pre_price, discount, id, desc$lang, icon, attributes  from #_product WHERE $where $where2 ORDER BY numb, id DESC LIMIT $offset, $limit";
$items = $d->rawQuery($sql, $params);
if (!empty($items)) {
    foreach ($items as $v) {
        ?>
        <div class="col mb-3" data-aos="fade-up" data-aos-duration="1000">
            <?php include TEMPLATE . LAYOUT . "blocks/product.php"; ?>
        </div>
        <?php
    }
}
