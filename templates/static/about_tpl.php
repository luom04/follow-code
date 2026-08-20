<section class="wrap-about py-3 py-lg-4">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-12 col-lg-5 mb-3 mb-lg-0">
                <div class="title-main">
                    <h2 class="text-black"><?= htmlspecialchars_decode($about['name' . $lang]) ?></h2>
                </div>
                <div class="content-text">
                    <?= htmlspecialchars_decode($about['desc' . $lang]) ?>
                </div>
            </div>
            <div class="col-12 col-lg-6">
                <div class="about-img scale-img rounded-lg">
                    <img src="<?= $func->addWebpToUrl(THUMBS . '/630x354x1/' . UPLOAD_NEWS_L . $about['photo']); ?>"
                        alt="<?= strip_tags($about['name' . $lang]) ?>" />
                </div>
            </div>
        </div>
    </div>
</section>
<div class="container">
 <div class="row justify-content-between">
    <?php foreach ($thongsos as $v) {
        preg_match('/^([+-]?\d*\.?\d+)([^0-9\.]*)$/', $v['subname' . $lang], $matches); ?>
        <div class="col-6 p-2 d-flex justify-content-center">
            <div class="counter-item">
                <p class="number">
                    <span class="counter" data-counter-time="8000"
                        data-counter-delay="50"><?= $matches[1] ?></span>
                    <span><?= $matches[2] ?></span>
                </p>
                <div class="name"><?= $v['name' . $lang] ?></div>
            </div>
        </div>
    <?php } ?>
</div>
</div>
<section class="wrap-tamnhin py-3 py-lg-4">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-7 d-flex align-items-center pe-lg-5">
                <div>
                    <h3 class=""><?= $tamnhin['name' . $lang] ?></h3>
                    <div><?= htmlspecialchars_decode($tamnhin['desc' . $lang]) ?></div>
                </div>
            </div>
            <div class="col-12 col-lg-5">
                    <div><img class="w-100 lazy rounded-lg"
                        data-src="<?= $func->addWebpToUrl(THUMBS . '/620x350x1/' . UPLOAD_NEWS_L . $tamnhin['photo']); ?>"
                        alt="<?= $tamnhin['name' . $lang] ?>" title="<?= $tamnhin['name' . $lang] ?>" /></div>
            </div>
        </div>
    </div>
</section>
<section class="wrap-sumenh py-3 py-lg-4">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-7  ps-lg-5 order-lg-2 d-flex align-items-center">
                <div>
                    <h3 class=""><?= $sumenh['name' . $lang] ?></h3>
                    <div><?= htmlspecialchars_decode($sumenh['desc' . $lang]) ?></div>
                </div>
            </div>
            <div class="col-12 col-lg-5 order-lg-1">
                <div><img class="w-100 lazy rounded-lg"
                        data-src="<?= $func->addWebpToUrl(THUMBS . '/620x350x1/' . UPLOAD_NEWS_L . $sumenh['photo']); ?>"
                        alt="<?= $sumenh['name' . $lang] ?>" title="<?= $sumenh['name' . $lang] ?>" /></div>
            </div>
        </div>
    </div>
</section>
<?php if ($giatris) { ?>
    <section class="wrap-giatri bg-gray2 py-3 py-lg-4">
        <div class="container">
            <div class="title-main text-center">
                <h2> <span>Giá trị cốt lõi</span> </h2>
            </div>
            <div class="owl-page owl-carousel owl-theme"
                data-items="screen:0|items:1|margin:10,screen:425|items:1|margin:10,screen:575|items:2|margin:20,screen:767|items:3|margin:20,screen:991|items:3|margin:20,screen:1199|items:5|margin:20"
                data-rewind="1" data-autoplay="1" data-loop="0" data-lazyload="0" data-mousedrag="1" data-touchdrag="1"
                data-smartspeed="800" data-autoplayspeed="800" data-autoplaytimeout="5000" data-dots="0" data-animations=""
                data-nav="0" data-navcontainer="">
                <?php foreach ($giatris as $v) { ?>
                    <div class="giatri-item">
                        <div class="info">
                            <h4 class="name "><?= $v['name' . $lang] ?></h4>
                            <p class="desc  mb-0"><?= $v['desc' . $lang] ?></p>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </section>
<?php } ?>

<?php if ($lichsus) { ?>
    <section class="wrap-history py-3 py-lg-4 mb-3 mb-lg-4">
        <div class="container">
            <div class="title-main text-center">
                <p class="mb-1 fs-16 fw-600"><span>Lịch sử hình thành</span></p>
                <h2 class="mt-2"><span><?= $sloganHistory['name' . $lang] ?></span></h2>
                <p class="mt-2"><?= $sloganHistory['desc' . $lang] ?></p>
            </div>
            <div class="slider slider-nav my-3">
                <?php foreach ($lichsus as $k => $v) { ?>
                    <div class="year-item"><span><?= $v['date_timeline'] ?></span></div>
                <?php } ?>
            </div>
            <div class="slider slider-for">
                <?php foreach ($lichsus as $k => $v) { ?>
                    <div class="history-item">
                        <div class="row align-items-center">
                            <div class="col-md-6 col-12">
                                <div class="name "><?= $v['name' . $lang] ?></div>
                                <div><?= htmlspecialchars_decode($v['desc' . $lang]) ?></div>
                            </div>
                            <div class="col-md-6 col-12 mb-4 mb-md-0 bg-ht">
                                <img class="w-100 rounded-lg"
                                    onerror="this.src='<?= THUMBS ?>/600x350x1/assets/images/noimage.png'"
                                    src="<?= $func->addWebpToUrl(THUMBS . '/600x350x1/' . UPLOAD_NEWS_L . $v['photo']); ?>"
                                    alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </section>
<?php } ?>




<section class="new bg-gray2 py-2 py-lg-4">
    <div class="container">
        <div class="title-main text-center">
            <h2 class="text-black">Dự án của chúng tôi</h2>
        </div>
        <div class="row">
            <?php if (isset($duan) && count($duan) > 0) { ?>
                <?php foreach ($duan as $v) { ?>
                    <div class="col-6 col-sm-6 col-md-4 col-lg-4 mb-3">
                        <?php include TEMPLATE . LAYOUT . "blocks/dichvu.php"; ?>
                    </div>
                <?php }
            } ?>
        </div>
        <?php if (isset($duan) && count($duan) > 6) { ?>
            <div class="d-flex justify-content-center">
                <a href="du-an"
                    class="d-block align-items-center text-white py-2 px-4 bg-main rounded-pill fw-bold pulse2">Xem tất cả
                    bài viết <i class="fa-solid fa-angles-right"></i></a>
            </div>
        <?php } ?>
    </div>
</section>


<?php if ($brandIndex) { ?>
    <section class="wrap-brand py-3 py-lg-4 mb-3 mb-lg-4">
        <div class="container">
            <div class="title-main text-center">
                <h2 class="text-black">Thương hiệu</h2>
            </div>
            <div class="d-flex flex-wrap gap-2">
                <?php foreach ($brandIndex as $v) { ?>
                    <a class="brand-item" href="<?= $v['link'] ?>" target="_blank" title="<?= $v['name' . $lang] ?>"
                        data-aos="fade-up">
                        <p class="image mb-0 scale-img">
                            <img class="lazy" onerror="this.src='<?= THUMBS ?>/240x120x1/assets/images/noimage.png';"
                                data-src="<?= $func->addWebpToUrl(THUMBS . '/240x120x2/' . UPLOAD_PRODUCT_L . $v['photo']); ?>"
                                alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                        </p>
                    </a>
                <?php } ?>
            </div>
        </div>
    </section>
<?php } ?>