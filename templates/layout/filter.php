<div class="container pb-4">
    <div class="search-multiple p-3 p-lg-4 bg-white rounded-lg shadow">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-7 pe-lg-4">
                <form action="san-pham" method="get">
                    <div class="title-main"><h4>Bạn muốn mua xe</h4></div>
                    <div class="banner-muaxe rounded overflow-hidden mb-3">
                        <div class="owl-page owl-carousel owl-theme" data-items="screen:0|items:1" data-rewind="1" data-autoplay="1" data-loop="0" data-lazyload="0" data-mousedrag="1" data-touchdrag="1" data-smartspeed="800" data-autoplayspeed="800" data-autoplaytimeout="5000" data-dots="0" data-animations="animate__fadeInDown" data-nav="1" data-navcontainer=".control-slideshow">
                            <?php foreach ($bannerMuaxe as $v) { ?>
                                <div owl-item-animation>
                                    <a href="<?= $v['link'] ?>" target="_blank" title="<?= $v['name' . $lang] ?>">
                                        <img class="w-100 lazy" data-src="<?= THUMBS ?>/640x90x1/<?= UPLOAD_PHOTO_L . $v['photo'] ?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                                    </a>
                                </div>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="owl-list mb-3">
                        <div class="owl-page owl-carousel owl-theme" data-items="screen:0|items:2|margin:10,screen:425|items:2|margin:10,screen:575|items:3|margin:20,screen:767|items:4|margin:20,screen:991|items:5|margin:20,screen:1199|items:3|margin:15" data-rewind="1" data-autoplay="0" data-loop="0" data-lazyload="0" data-mousedrag="1" data-touchdrag="1" data-smartspeed="800" data-autoplayspeed="800" data-autoplaytimeout="5000" data-dots="0" data-animations="" data-nav="0" data-navcontainer="">
                            <?php foreach ($filterSizes as $v) { ?>
                            <label class="checkbox-card">
                                <input type="radio" name="size" value="<?=$v['id']?>">
                                <div class="loaixe-item content d-flex align-items-center scale-img">
                                    <h2 class="name mb-0 text"><?= $v['name' . $lang] ?></h2>
                                    <p class="image">
                                        <img class="lazy" onerror="this.src='<?= THUMBS ?>/200x100x1/assets/images/noimage.png';" data-src="<?= THUMBS ?>/200x120x2/<?= UPLOAD_COLOR_L . $v['photo'] ?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                                    </p>
                                </div>
                            </label>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="owl-list mb-2">
                        <div class="owl-page owl-carousel owl-theme" data-items="screen:0|items:2|margin:10,screen:425|items:3|margin:10,screen:575|items:4|margin:10,screen:767|items:5|margin:10,screen:991|items:6|margin:10,screen:1199|items:7|margin:10" data-rewind="1" data-autoplay="1" data-loop="0" data-lazyload="0" data-mousedrag="1" data-touchdrag="1" data-smartspeed="800" data-autoplayspeed="800" data-autoplaytimeout="5000" data-dots="0" data-animations="" data-nav="0" data-navcontainer="">
                            <?php foreach ($productListMenu as $v) { ?>
                            <label class="checkbox-card">
                                <input type="radio" name="hangxe" value="<?=$v['id']?>">
                                <div class="hangxe-item d-flex flex-column content">
                                    <p class="image mb-0">
                                        <img class="mx-auto lazy" onerror="this.src='<?= THUMBS ?>/200x100x1/assets/images/noimage.png';" data-src="<?= THUMBS ?>/200x130x2/<?= UPLOAD_PRODUCT_L . $v['icon'] ?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                                    </p>
                                    <h5 class="name mb-0 text-split text-split-1"><?= $v['name' . $lang] ?></h5>
                                </div>
                            </label>
                            <?php } ?>
                        </div>
                    </div>
                    
                    <div class="owl-list mb-3">
                        <div class="owl-page owl-carousel owl-theme" data-items="screen:0|items:2|margin:10,screen:425|items:3|margin:10,screen:575|items:4|margin:10,screen:767|items:5|margin:10,screen:991|items:6|margin:10,screen:1199|items:7|margin:10" data-rewind="1" data-autoplay="0" data-loop="0" data-lazyload="0" data-mousedrag="1" data-touchdrag="1" data-smartspeed="800" data-autoplayspeed="800" data-autoplaytimeout="5000" data-dots="0" data-animations="" data-nav="0" data-navcontainer="">
                            <?php foreach ($filterPrices as $k => $v) { ?>
                            <label class="checkbox-card">
                                <input type="radio" name="giaban" value="<?=$k?>">
                                <div class="giaban-item content">
                                    <h5 class="name mb-0 text-split text-split-1"><?= $v ?></h5>
                                </div>
                            </label>
                            <?php } ?>
                        </div>
                    </div>

                    <div class="search">
                        <input type="text" name="q" placeholder="Tìm kiếm theo hãng xe, dòng xe ..." value="" class="form-control border-0 flex-grow-1 ">
                        <button type="submit" class="btn btn-search btn-light">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                            </svg>
                        </button>
                    </div>
                </form>
            </div>
            <div class="col-5 col-lg-5 ps-lg-4">
                <div class="title-main"><h4>Bạn muốn bán xe</h4></div>
                <form class="mb-4" novalidate method="get" action="thu-mua-xe-cu-gia-cao">
                    <div class="pb-3">
                        <select name="hangxe" id="parentSelect" class="form-select">
                            <option value="">-- Chọn hãng xe</option>
                        </select>
                    </div>
                    <div class="pb-3">
                        <select name="dongxe" id="childSelect" class="form-select">
                            <option value="">-- Chọn dòng xe</option>
                        </select>
                    </div>
                    <div class="buttons-common active w-100">
                        <button type="submit" class="blob-btn btn rounded active w-100 py-2 px-5">
                            <span class="blob-txt text-uppercase">Gửi thông tin</span>
                            <span class="blob-btn__inner">
                                <span class="blob-btn__blobs">
                                    <span class="blob-btn__blob"></span>
                                    <span class="blob-btn__blob"></span>
                                    <span class="blob-btn__blob"></span>
                                    <span class="blob-btn__blob"></span>
                                </span>
                            </span>
                        </button>
                    </div>
                </form>
                <div class="title-main text-center"><h4>Quy trình 4 bước</h4></div>
                <div class="row">
                    <?php foreach ($quytrinhs as $k => $v) { ?>
                    <div class="col-6 mb-3">
                        <div class="buttons-common active w-100">
                            <button type="submit" class="blob-btn btn rounded active w-100 py-2 px-2">
                                <span class="blob-txt d-flex align-items-center">
                                    <img src="<?= THUMBS ?>/100x100x2/<?= UPLOAD_NEWS_L . $v['photo'] ?>" width="30" class="me-3" alt="<?= $v['name' . $lang] ?>" />
                                    <?= $v['name' . $lang] ?>
                                </span>
                                <span class="blob-btn__inner">
                                    <span class="blob-btn__blobs">
                                        <span class="blob-btn__blob"></span>
                                        <span class="blob-btn__blob"></span>
                                        <span class="blob-btn__blob"></span>
                                        <span class="blob-btn__blob"></span>
                                    </span>
                                </span>
                            </button>
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>