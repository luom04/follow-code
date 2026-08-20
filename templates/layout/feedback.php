
<section class="feedback  py-2 py-lg-4">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-3">
                <div class="title-main ">
                    <img src="assets/images/six.png" alt="">
                    <h2 class="mt-3"><?=khachhangnoigivechungtoi?></h2>
                </div>
            </div>
            <div class="col-12 col-lg-9">
                <div class="owl-page owl-carousel owl-theme"
                    data-items="screen:0|items:1|margin:10,screen:425|items:1|margin:10,screen:575|items:2|margin:20,screen:767|items:3|margin:20,screen:991|items:3|margin:20,screen:1199|items:3|margin:20"
                    data-rewind="1" data-autoplay="1" data-loop="0" data-lazyload="0" data-mousedrag="1" data-touchdrag="1"
                    data-smartspeed="800" data-autoplayspeed="800" data-autoplaytimeout="5000" data-dots="0" data-animations=""
                    data-nav="0" data-navcontainer="">
                    <?php foreach ($feedback as $v) { ?>
                        <div class="feedback-item   rounded-3 " data-aos="fade-up">
                        <div class="bg-desc-feedback p-2 p-lg-3">
                                <div class="star text-yellow">
                                    <?php for ($i = 0; $i < 5; $i++) { ?>
                                        <i class="fa-solid fa-star"></i>
                                    <?php } ?>
                                </div>
                                <p class="desc text-split text-split-3  mb-0 "><?= $v['desc' . $lang] ?></p>
                            </div>
                            <div class="row justify-content-start align-items-center px-2  py-2 py-lg-3">
                                <div class="col-3 image  mb-0 p-0">
                                    <img class="w-100 lazy rounded-circle"
                                        data-src="<?= $func->addWebpToUrl(THUMBS . '/150x150x1/' . UPLOAD_NEWS_L . $v['photo']); ?>"
                                        alt="<?= $v['name' . $lang] ?>" />
                                </div>
                                <div class="col-9 info text-start">
                                    <h4 class="name fs-20 fw-500 text-split"><?= $v['name' . $lang] ?></h4>
                                    <p class="subname fs-16 text-split mb-0"><?= $v['subname' . $lang] ?></p>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                </div>  
            </div>
        </div>
    </div>
</section>