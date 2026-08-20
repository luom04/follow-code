<?php $attrs = json_decode($v['attributes'],true); ?>
<div class="box-product box-product-list">
    <div class="pic-product">
        <a class="text-decoration-none scale-img" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>">
            <?php if(isset($isLazy) && $isLazy == false  ) {?>
            <img class="w-100 img-<?= $v['id'] ?>" onerror="this.src='<?= THUMBS ?>/500x400x1/assets/images/noimage.png';" src="<?= $func->addWebpToUrl(THUMBS.'/500x400x1/'.UPLOAD_PRODUCT_L.$v['photo']);?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
            <?php }else{ ?>
            <img class="lazy w-100 img-<?= $v['id'] ?>" onerror="this.src='<?= THUMBS ?>/500x400x1/assets/images/noimage.png';" data-src="<?= $func->addWebpToUrl(THUMBS.'/500x400x1/'.UPLOAD_PRODUCT_L.$v['photo']);?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
            <?php } ?>
        </a>
        <?php if ($v['discount']) { ?>
        <span class="price-per"><?= '-' . $v['discount'] . '%' ?></span>
        <?php } ?>
    </div>
    <div class="info-product">
        <h3 class="mb-0"><a class="text-split name-product" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>"><?= $v['name' . $lang] ?></a></h3>
        
        <p class="price-product d-flex align-items-center gap-2">
            Giá bán:
            <?php if ($v['discount']) { ?>
                <span class="price-new"><?= $func->formatMoney($v['sale_price']) ?></span>
                <span class="price-old"><?= $func->formatMoney($v['regular_price']) ?></span>
            <?php } else { ?>
                <span class="price-new"><?= ($v['regular_price']) ? $func->formatMoney($v['regular_price']) : "Liên hệ ngay" ?></span>
            <?php } ?>
        </p>
        <?php if($v['pre_price']){ ?>
        <p class="price-product d-flex align-items-center gap-2">Giá trả trước: <span class="price-new" style="color: black;"><?=$func->formatMoney($v['pre_price'])?></span></p>
        <?php } ?>
    </div>
</div>