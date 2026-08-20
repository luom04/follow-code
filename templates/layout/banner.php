<?php if ($sliderBottom) { ?>
<section class="wrap-banner mb-3">
    <div class="owl-page owl-carousel owl-theme" data-items="screen:0|items:1" data-rewind="1" data-autoplay="1" data-loop="0" data-lazyload="0" data-mousedrag="0" data-touchdrag="0" data-smartspeed="800" data-autoplayspeed="800" data-autoplaytimeout="5000" data-dots="0" data-animations="animate__fadeInDown, animate__backInUp, animate__rollIn, animate__backInRight, animate__zoomInUp, animate__backInLeft, animate__rotateInDownLeft, animate__backInDown, animate__zoomInDown, animate__fadeInUp, animate__zoomIn" data-nav="1" data-navcontainer=".control-banner">
        <?php foreach ($sliderBottom as $v) { ?>
            <div class="banner-item" owl-item-animation>
                <a class="banner-image" href="<?= $v['link'] ?>" target="_blank" title="<?= $v['name' . $lang] ?>">
                    <picture>
                        <source media="(max-width: 500px)" srcset="<?= THUMBS ?>/683x195x1/<?= UPLOAD_PHOTO_L . $v['photo'] ?>">
                        <img class="lazy" onerror="this.src='<?= THUMBS ?>/1920x390x1/assets/images/noimage.png';" data-src="<?= $func->addWebpToUrl(THUMBS.'/1920x390x1/'.UPLOAD_PHOTO_L.$v['photo']);?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" width="1920" height="390" />
                    </picture>
                </a>
            </div>
        <?php } ?>
    </div>
    <?php if (count($sliderBottom) > 1) { ?>
    <div class="control-banner control-owl transition"></div>
    <?php } ?>
</section>
<?php } ?>