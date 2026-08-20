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
$sql = "  select   id, name$lang,   slugvi, slugen, photo,  desc$lang, attributes,date_created, type from #_news WHERE $where $where2 ORDER BY numb, id DESC LIMIT $offset, $limit";
$items = $d->rawQuery($sql, $params);
if (!empty($items)) {
    foreach ($items as $v) {
        ?>
        <div class="col-6 col-sm-6 col-md-4 col-lg-4 mb-3">
            <?php include TEMPLATE . LAYOUT . "blocks/post.php"; ?>
        </div>
        <?php
    }
}
