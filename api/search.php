<?php
include "config.php";

$keyword = (!empty($_GET['keyword'])) ? htmlspecialchars($_GET['keyword']) : '';
$product = null;
if ($keyword){
    $tukhoa = $func->changeTitle($keyword);
    $code = explode(" ", $keyword);
    if (count($code) > 1) {
        $code = end($code);
    }else {
        $code = $tukhoa;
    }
    $product = $d->rawQuery("select photo, name$lang, code, slugvi, slugen, sale_price, regular_price, discount, id, desc$lang, icon, attributes from #_product where type = ? and (name$lang LIKE ? or slugvi LIKE ? or slugen LIKE ? or code LIKE ?) and find_in_set('hienthi',status) order by numb asc limit 0,6", array('san-pham',"%$keyword%", "%$tukhoa%", "%$tukhoa%", "%$code%"));
}

if ($product) { ?>
    <ul>
    <?php foreach ($product as $k => $v) { ?>
        <li class="">
            <a href="<?=$v[$sluglang]?>" class="d-flex p-2 align-items-center justify-content-between" title="<?= $v['name' . $lang] ?>">
                <div class="image">
                    <img src="<?= THUMBS ?>/60x60x1/<?= UPLOAD_PRODUCT_L . $v['photo'] ?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                </div>
                <div class="info">
                    <h5 class="name text-split text-split-2"><?= $v['name'.$lang] ?></h5>
                    <div class="code text-sm text-gray"><?=$v['code']?></div>
                    <div class="price d-flex align-items-center mb-0">
                        <?php if ($v['discount']) { ?>
                            <span class="price-new"><?= $func->formatMoney($v['sale_price']) ?></span>
                            <span class="price-old ms-2"><?= $func->formatMoney($v['regular_price']) ?></span>
                        <?php } else { ?>
                            <span class="price-new"><?= ($v['regular_price']) ? $func->formatMoney($v['regular_price']) : "Liên hệ ngay" ?></span>
                        <?php } ?>
                    </div>
                </div>
            </a>
        </li>
    <?php } ?>
    </ul>
<?php } else { ?>
    <div class="alert alert-warning w-100 mb-0" role="alert">
        <strong><?= khongtimthayketqua ?></strong>
    </div>
<?php } ?>