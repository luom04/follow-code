<?php $attrs = json_decode($v['attributes'], true); ?>
<div class="box-product <?= $classes ?> box-shadow-ccc">
    <div class="pic-product">
        <a class="text-decoration-none scale-img<?= $classes ? '' : '2' ?>" href="<?= $v[$sluglang] ?>"
            title="<?= $v['name' . $lang] ?>">
            <?php if ($config['watermark']['active'] == true) { ?>
                <img class="lazy w-100 img-<?= $v['id'] ?>"
                    onerror="this.src='<?= THUMBS ?>/387x239x1/assets/images/noimage.png';"
                    data-src="<?= $func->addWebpToUrl(THUMBS . '/387x239x1/' . UPLOAD_PRODUCT_L . $v['photo']); ?>"
                    alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
            <?php } else { ?>
                <img class="lazy w-100 img-<?= $v['id'] ?>"
                    onerror="this.src='<?= THUMBS ?>/387x239x1/assets/images/noimage.png';"
                    data-src="<?= $func->addWebpToUrl(THUMBS . '/387x239x1/' . UPLOAD_PRODUCT_L . $v['photo']); ?>"
                    alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
            <?php } ?>
        </a>
    </div>
    <div class="info-product mb-2">
        <div class="title-main">
            <h3 class="mb-0">
                <a class="text-split name-product" href="<?= $v[$sluglang] ?>"
                    title="<?= $v['name' . $lang] ?>"><?= $v['name' . $lang] ?>
                </a>
            </h3>
        </div>
        <div class="desc mb-2"><?= htmlspecialchars_decode($v['desc' . $lang]) ?></div>
        <?php if ($v['discount']) { ?>
            <p class="price-product d-flex align-items-center gap-2">
                <span class="price-new"><?= $func->formatMoney($v['sale_price']) ?></span>
                <?php if ($v['discount']) { ?>
                    <span class="price-per"><?= '-' . $v['discount'] . '%' ?></span>
                <?php } ?>
                <span class="price-old"><?= $func->formatMoney($v['regular_price']) ?></span>
            </p>
        <?php } else { ?>
            <p class="price-product d-flex align-items-center gap-2"><span
                    class="price-new"><?= ($v['regular_price']) ? $func->formatMoney($v['regular_price']) : "Liên hệ" ?></span>
            </p>
        <?php } ?>
        <a class="addcart  btn outline w-100 bg-submain text-white fw-bold p-1 mt-2" data-id="<?= $v['id'] ?>"
            data-action="addnow">
            <span><?= themvaogiohang ?></span>
        </a>
    </div>

</div>