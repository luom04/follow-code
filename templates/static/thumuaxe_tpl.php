<section class="wrap-quytrinh-thumua mb-3 mb-lg-5">
    <div class="container">
        <div class="title-main text-center">
            <h2>Cách <span>bán ô tô cũ Thành phố Hồ Chí Minh giá cao cùng</span> Auto Minh Quân</h2>
        </div>
        <div class="owl-page owl-carousel owl-theme" data-items="screen:0|items:2|margin:10,screen:425|items:2|margin:10,screen:575|items:2|margin:20,screen:767|items:3|margin:20,screen:991|items:3|margin:20,screen:1199|items:4|margin:30" data-center="0" data-rewind="1" data-autoplay="1" data-loop="1" data-lazyload="0" data-mousedrag="1" data-touchdrag="1" data-smartspeed="800" data-autoplayspeed="800" data-autoplaytimeout="5000" data-dots="0" data-animations="" data-nav="0" data-navcontainer="">
            <?php foreach ($quytrinhs as $k => $v) { ?>
            <div class="quytrinhtm-item shadow">
                <div class="d-flex align-items-center px-3 text-primary">
                    <div class="num me-2"><?=$k+1?></div>
                    <h3 class="name mt-2 mb-0 text-split"><?=$v['name'.$lang]?></h3>
                </div>
                <div class="px-3"><p class="desc text-split"><?=$v['desc'.$lang]?></p></div>
                <p class="image mb-0">
                    <img class="w-100" src="<?= THUMBS ?>/540x360x1/<?= UPLOAD_NEWS_L . $v['photo'] ?>" alt="<?=$v['name'.$lang]?>"/>
                </p>
            </div>
            <?php } ?>
        </div>
    </div>
</section>

<section class="wrap-tieuchi py-4 py-lg-4">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-4 mb-4 mb-lg-0">
                <div class="title-main mb-lg-5">
                    <h3>Số liệu của Auto <span>Minh Quân</span></h3>
                </div>
                <div class="row justify-content-between">
                    <?php foreach ($thongsos as $v) { preg_match('/^([+-]?\d*\.?\d+)([^0-9\.]*)$/', $v['subname'.$lang], $matches); ?>
                    <div class="col-6">
                        <div class="counter-item">
                            <p class="number">
                                <span class="counter" data-counter-time="8000" data-counter-delay="50"><?=$matches[1]?></span>
                                <span><?=$matches[2]?></span>
                            </p>
                            <div class="text-gray"><?=$v['name'.$lang]?></div>
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div>
            <div class="tieuchi-inner col-12 col-lg-8">
                <div class="title-main text-center">
                    <h3>Vì sao chọn mua Auto <span>Minh Quân</span></h3>
                </div>
                <div class="row justify-content-between">
                    <div class="col-12 col-lg-5">
                        <?php foreach ($visaos as $k => $v) { if($k < 3){ ?>
                        <div class="tieuchi-item mb-3 d-flex justify-content-between <?=$k != 1 ? 'ms-4':''?>" data-img="<?= UPLOAD_NEWS_L . $v['photo'] ?>" data-aos="fade-up">
                            <div class="num"><?=$k+1?></div>
                            <div class="info">
                                <h4 class="name text-split"><?= $v['name' . $lang] ?></h4>
                                <p class="desc text-split text-split-2"><?= $v['desc' . $lang] ?></p>
                            </div>
                        </div>
                        <?php } } ?>
                    </div>
                    <div class="col-12 col-lg-5">
                        <?php foreach ($visaos as $k => $v) { if($k > 2 && $k < 6){ ?>
                        <div class="tieuchi-item mb-3 d-flex justify-content-between <?=$k != 4 ? '':'ms-4'?>" data-img="<?= UPLOAD_NEWS_L . $v['photo'] ?>" data-aos="fade-up">
                            <div class="num"><?=$k+1?></div>
                            <div class="info">
                                <h4 class="name text-split"><?= $v['name' . $lang] ?></h4>
                                <p class="desc text-split text-split-2"><?= $v['desc' . $lang] ?></p>
                            </div>
                        </div>
                        <?php } } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="wrap-video mb-3">
    <div class="container">
        <div class="title-main">
            <h3>Video của <span>Auto Minh Quân</span></h3>
        </div>
        <div class="owl-page owl-carousel owl-theme" data-items="screen:0|items:2|margin:10,screen:425|items:2|margin:10,screen:575|items:2|margin:20,screen:767|items:3|margin:20,screen:991|items:4|margin:20,screen:1199|items:5|margin:15" data-center="0" data-rewind="1" data-autoplay="1" data-loop="1" data-lazyload="0" data-mousedrag="1" data-touchdrag="1" data-smartspeed="800" data-autoplayspeed="800" data-autoplaytimeout="5000" data-dots="0" data-animations="" data-nav="0" data-navcontainer="">
            <?php foreach ($videos as $k => $v) { ?>
            <div class="video">
                <div class="scale-img image"><img class="w-100" src="<?= $func->addWebpToUrl(THUMBS.'/400x300x1/'.UPLOAD_PHOTO_L.$v['photo']);?>" alt="<?=$v['name'.$lang]?>"/></div>
                <?php $checkVideo = $func->checkVideoLink($v['link']);?>
                <a class="btn-play" data-platform="<?=$checkVideo['platform']?>" data-videoid="<?=$checkVideo['video_id']?>" title="<?= $v['name' . $lang] ?>">
                    <svg width="50" height="50" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M13.8876 9.9348C14.9625 10.8117 15.5 11.2501 15.5 12C15.5 12.7499 14.9625 13.1883 13.8876 14.0652C13.5909 14.3073 13.2966 14.5352 13.0261 14.7251C12.7888 14.8917 12.5201 15.064 12.2419 15.2332C11.1695 15.8853 10.6333 16.2114 10.1524 15.8504C9.6715 15.4894 9.62779 14.7336 9.54038 13.2222C9.51566 12.7947 9.5 12.3757 9.5 12C9.5 11.6243 9.51566 11.2053 9.54038 10.7778C9.62779 9.26636 9.6715 8.51061 10.1524 8.1496C10.6333 7.78859 11.1695 8.11466 12.2419 8.76679C12.5201 8.93597 12.7888 9.10831 13.0261 9.27492C13.2966 9.46483 13.5909 9.69274 13.8876 9.9348Z" stroke="#ffffff" stroke-width="1.5"></path> <path d="M7 3.33782C8.47087 2.48697 10.1786 2 12 2C17.5228 2 22 6.47715 22 12C22 17.5228 17.5228 22 12 22C6.47715 22 2 17.5228 2 12C2 10.1786 2.48697 8.47087 3.33782 7" stroke="#ffffff" stroke-width="1.5" stroke-linecap="round"></path> </g></svg>
                </a>
            </div>
            <?php } ?>
        </div>
    </div>
</section>

<section class="wrap-hinhanh mb-3 mb-lg-5">
    <div class="container">
        <div class="title-main">
            <h3>Hình ảnh của <span>Auto Minh Quân</span></h3>
        </div>
        <div class="owl-page owl-carousel owl-theme" data-items="screen:0|items:2|margin:10,screen:425|items:2|margin:10,screen:575|items:2|margin:20,screen:767|items:3|margin:20,screen:991|items:3|margin:20,screen:1199|items:3|margin:30" data-center="0" data-rewind="1" data-autoplay="1" data-loop="1" data-lazyload="0" data-mousedrag="1" data-touchdrag="1" data-smartspeed="800" data-autoplayspeed="800" data-autoplaytimeout="5000" data-dots="0" data-animations="" data-nav="0" data-navcontainer="">
            <?php foreach ($hinhanhs as $k => $v) { ?>
            <a data-fancybox="gallery" href="<?=UPLOAD_PHOTO_L . $v['photo'] ?>" class="scale-img">
                <img class="w-100" src="<?= $func->addWebpToUrl(THUMBS.'/400x250x1/'.UPLOAD_PHOTO_L.$v['photo']);?>" alt="<?=$v['name'.$lang]?>"/>
            </a>
            <?php } ?>
        </div>
    </div>
</section>

<section class="wrap-baochi mb-3">
    <div class="container">
        <div class="title-main text-center mb-0">
            <h3>Báo chí nói gì về thu mua xe <span>Auto Minh Quân</span></h3>
        </div>
        <div class="title-desc text-center mb-3">Auto Minh Quân được báo chí đánh giá cao nhờ thu mua xe cũ uy tín, định giá sát thực tế và quy trình nhanh gọn hỗ trợ khách hàng tận nơi.</div>
        <div class="owl-page owl-carousel owl-theme" data-items="screen:0|items:2|margin:10,screen:425|items:2|margin:10,screen:575|items:2|margin:20,screen:767|items:3|margin:20,screen:991|items:4|margin:20,screen:1199|items:5|margin:15" data-center="0" data-rewind="1" data-autoplay="1" data-loop="1" data-lazyload="0" data-mousedrag="1" data-touchdrag="1" data-smartspeed="800" data-autoplayspeed="800" data-autoplaytimeout="5000" data-dots="0" data-animations="" data-nav="0" data-navcontainer="">
            <?php foreach ($baochis as $k => $v) { ?>
            <a href="<?=$v['link']?>" class="scale-img">
                <img class="w-100" src="<?= $func->addWebpToUrl(THUMBS.'/240x120x2/'.UPLOAD_PHOTO_L.$v['photo']);?>" alt="<?=$v['name'.$lang]?>"/>
            </a>
            <?php } ?>
        </div>
    </div>
</section>
<?php foreach ($baivietkhac as $k => $v) { ?>
<section class="wrap-content mb-3 mb-lg-5">
    <div class="container">
        <div class="p-3 p-lg-4 bg-white rounded-xl border">
            <?=htmlspecialchars_decode($v['content'.$lang])?>
        </div>
    </div>
</section>
<?php } ?>

<section class="wrap-cauhoi py-3">
    <div class="container">
        <div class="title-main text-center mb-4"><h2>Câu hỏi thường gặp</h2></div>
        <div class="accordion" id="accordionExample">
            <?php foreach ($cauhois as $k => $v) { ?>
            <div class="accordion-item">
                <h2 class="accordion-header" id="heading<?=$k?>">
                    <button class="accordion-button <?=$k==0?'':'collapsed'?>" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<?=$k?>" aria-expanded="true" aria-controls="collapse<?=$k?>">
                        <?=$v['name' . $lang]?>
                    </button>
                </h2>
                <div id="collapse<?=$k?>" class="accordion-collapse collapse <?=$k==0?'show':''?>" aria-labelledby="heading<?=$k?>" data-bs-parent="#accordionExample">
                    <div class="accordion-body"><?=$v['desc' . $lang]?></div>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</section>