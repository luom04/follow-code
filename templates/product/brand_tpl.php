<?php /* if ($sliderKM) { ?>
<div class="container">
<div class="owl-page owl-carousel owl-theme" data-items="screen:0|items:1|margin:10" data-rewind="1" data-autoplay="1" data-loop="0" data-lazyload="0" data-mousedrag="1" data-touchdrag="1" data-smartspeed="800" data-autoplayspeed="800" data-autoplaytimeout="5000" data-dots="0" data-animations="" data-nav="0" data-navcontainer="">
<?php foreach ($sliderKM as $k => $v) { ?>
<div>
<a href="<?=$v['link']?>" class="d-block text-center"><img src="<?= $func->addWebpToUrl(THUMBS.'/1280x250x2/'.UPLOAD_PHOTO_L.$v['photo']);?>" alt="<?= $v['name' . $lang] ?>" /></a>
</div>
<?php } ?>
</div>
</div>
<?php } 
<div class="container mb-3">
<?php if ($productSales) { ?>
<div class="wrap-khuyenmai position-relative p-3 p-lg-4">
<div class="owl-page owl-carousel owl-theme" data-items="screen:0|items:2|margin:15,screen:425|items:2|margin:15,screen:575|items:3|margin:15,screen:767|items:3|margin:15,screen:991|items:4|margin:15,screen:1199|items:5|margin:15" data-rewind="1" data-autoplay="1" data-loop="0" data-lazyload="0" data-mousedrag="1" data-touchdrag="1" data-smartspeed="300" data-autoplayspeed="500" data-autoplaytimeout="3500" data-dots="0" data-nav="1" data-navcontainer=".control-khuyenmai">
<?php foreach ($productSales as $k => $v) { ?>
<?php include TEMPLATE . LAYOUT . "blocks/product.php"; ?>
<?php } ?>
</div>
<?php if (count($productSales) > 5) { ?>
<div class="control-khuyenmai control-owl transition"></div>
<?php } ?>
</div>
<?php } ?>
</div>

<?php include TEMPLATE . LAYOUT . "spdaxem.php"; ?>
*/ ?>
<div class="container">
    <div class="title-main text-center title-main-detail">
        <div class="title"><span>Thương hiệu</span></div>
    </div>
    <div class="row">
        <?php foreach ($brandInner as $v) { ?>
            <div class="col-3 col-lg-2 px-1 mb-1 mb-lg-3">
                <a class="brand-item" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>" data-aos="fade-up">
                    <p class="image scale-img">
                        <img class="lazy" onerror="this.src='<?= THUMBS ?>/240x120x2/assets/images/noimage.png';"
                            data-src="<?= $func->addWebpToUrl(THUMBS . '/240x120x2/' . UPLOAD_PRODUCT_L . $v['photo']); ?>"
                            alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                    </p>
                    <h3 class="name"><?= $v['name' . $lang] ?></h3>
                </a>
            </div>
        <?php } ?>
    </div>
</div>