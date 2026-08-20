<section class="wrap-pro-detail py-2 mb-3">
    <div class="container">
        <div class="d-flex flex-wrap justify-content-between">
            <div class="left-pro-detail mb-3 mb-lg-0">
                <div class="gallery-pro-detail flex-column flex-column-reverse flex-sm-row">
                    <div class="slider-products mb-2 mb-lg-0 slick-init-hidden">
                        <div class="item">
                            <?php if ($config['watermark']['active'] == true) { ?>
                                <a href="<?= WATERMARK ?>/product/550x480x2/<?= UPLOAD_PRODUCT_L . $rowDetail['photo'] ?>"
                                    data-fancybox="product-detail" title="<?= $rowDetail['name' . $lang] ?>">
                                    <img onerror="this.src='<?= THUMBS ?>/550x480x2/assets/images/noimage.png';"
                                        src="<?= WATERMARK ?>/product/550x480x2/<?= UPLOAD_PRODUCT_L . $rowDetail['photo'] ?>"
                                        alt="<?= $rowDetail['name' . $lang] ?>">
                                </a>
                            <?php } else { ?>
                                <a href="<?= THUMBS ?>/550x480x2/<?= UPLOAD_PRODUCT_L . $rowDetail['photo'] ?>"
                                    data-fancybox="product-detail" title="<?= $rowDetail['name' . $lang] ?>">
                                    <img onerror="this.src='<?= THUMBS ?>/550x480x2/assets/images/noimage.png';"
                                        src="<?= THUMBS ?>/550x480x2/<?= UPLOAD_PRODUCT_L . $rowDetail['photo'] ?>"
                                        alt="<?= $rowDetail['name' . $lang] ?>">
                                </a>
                            <?php } ?>
                        </div>
                        <?php if ($rowDetailPhoto) {
                            foreach ($rowDetailPhoto as $v) { ?>
                                <div class="item">
                                    <?php if ($config['watermark']['active'] == true) { ?>
                                        <a href="<?= WATERMARK ?>/product/550x480x2/<?= UPLOAD_PRODUCT_L . $v['photo'] ?>"
                                            data-fancybox="product-detail" title="<?= $v['name' . $lang] ?>">
                                            <img onerror="this.src='<?= THUMBS ?>/550x480x2/assets/images/noimage.png';"
                                                src="<?= WATERMARK ?>/product/550x480x2/<?= UPLOAD_PRODUCT_L . $v['photo'] ?>"
                                                alt="<?= $v['name' . $lang] ?>">
                                        </a>
                                    <?php } else { ?>
                                        <a href="<?= THUMBS ?>/550x480x2/<?= UPLOAD_PRODUCT_L . $v['photo'] ?>"
                                            data-fancybox="product-detail" title="<?= $v['name' . $lang] ?>">
                                            <img onerror="this.src='<?= THUMBS ?>/550x480x2/assets/images/noimage.png';"
                                                src="<?= THUMBS ?>/550x480x2/<?= UPLOAD_PRODUCT_L . $v['photo'] ?>"
                                                alt="<?= $v['name' . $lang] ?>">
                                        </a>
                                    <?php } ?>

                                </div>
                        <?php }
                        } ?>
                    </div>
                    <div class="gallery-pro-detail-left d-flex flex-sm-column align-items-center mt-2">
                        <?php if ($rowDetailAttrs['video']) { ?>
                            <a href="<?= $rowDetailAttrs['video'] ?>" data-fancybox
                                class="product-video d-flex flex-column align-items-center justify-content-center">
                                <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                                    <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                                    <g id="SVGRepo_iconCarrier">
                                        <path
                                            d="M19.5617 7C19.7904 5.69523 18.7863 4.5 17.4617 4.5H6.53788C5.21323 4.5 4.20922 5.69523 4.43784 7"
                                            stroke="#1C274C" stroke-width="1.5"></path>
                                        <path
                                            d="M17.4999 4.5C17.5283 4.24092 17.5425 4.11135 17.5427 4.00435C17.545 2.98072 16.7739 2.12064 15.7561 2.01142C15.6497 2 15.5194 2 15.2588 2H8.74099C8.48035 2 8.35002 2 8.24362 2.01142C7.22584 2.12064 6.45481 2.98072 6.45704 4.00434C6.45727 4.11135 6.47146 4.2409 6.49983 4.5"
                                            stroke="#1C274C" stroke-width="1.5"></path>
                                        <path
                                            d="M21.1935 16.793C20.8437 19.2739 20.6689 20.5143 19.7717 21.2572C18.8745 22 17.5512 22 14.9046 22H9.09536C6.44881 22 5.12553 22 4.22834 21.2572C3.33115 20.5143 3.15626 19.2739 2.80648 16.793L2.38351 13.793C1.93748 10.6294 1.71447 9.04765 2.66232 8.02383C3.61017 7 5.29758 7 8.67239 7H15.3276C18.7024 7 20.3898 7 21.3377 8.02383C22.0865 8.83268 22.1045 9.98979 21.8592 12"
                                            stroke="#1C274C" stroke-width="1.5" stroke-linecap="round"></path>
                                        <path
                                            d="M14.5812 13.6159C15.1396 13.9621 15.1396 14.8582 14.5812 15.2044L11.2096 17.2945C10.6669 17.6309 10 17.1931 10 16.5003L10 12.32C10 11.6273 10.6669 11.1894 11.2096 11.5258L14.5812 13.6159Z"
                                            stroke="#1C274C" stroke-width="1.5"></path>
                                    </g>
                                </svg>
                                <span>Video</span>
                            </a>
                        <?php } ?>
                        <div class="slider-product-thumbs slick-init-hidden w-100">
                            <div class="item">
                                <a href="javascript:;" class="p-1 align-items-center"
                                    title="<?= $rowDetail['name' . $lang] ?>" style="width: 100% !important;">
                                    <img onerror="this.src='<?= THUMBS ?>/200x200x2/assets/images/noimage.png';"
                                        src="<?= WATERMARK ?>/product/200x200x2/<?= UPLOAD_PRODUCT_L . $rowDetail['photo'] ?>"
                                        alt="<?= $rowDetail['name' . $lang] ?>">
                                </a>
                            </div>
                            <?php if ($rowDetailPhoto) {
                                foreach ($rowDetailPhoto as $v) { ?>
                                    <div class="item">
                                        <a href="javascript:;" class="p-1 d-flex align-items-center"
                                            title="<?= $v['name' . $lang] ?>">
                                            <img onerror="this.src='<?= THUMBS ?>/200x200x2/assets/images/noimage.png';"
                                                src="<?= WATERMARK ?>/product/200x200x2/<?= UPLOAD_PRODUCT_L . $v['photo'] ?>"
                                                alt="<?= $v['name' . $lang] ?>">
                                        </a>
                                    </div>
                            <?php }
                            } ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-pro-detail">
                <ul class="attr-pro-detail">
                    <div class="text-split text-split-2" id="product-title" data-idproduct="<?= $rowDetail['id'] ?>"
                        data-base="<?= $rowDetail['name' . $lang] ?>"> <?= $rowDetail['name' . $lang] ?> </div>
                    <?php if (!empty($rowDetail['code'])) { ?>
                        <div class="d-flex align-items-center">
                            <span class="mx-1 fw-bold">Mã SP:</span> #<span id="product-sku">
                                <?= $rowDetail['code'] ?>
                            </span>
                        </div>
                    <?php } ?>

                    <li class="price-block-pro-detail">
                        <?php if ($rowDetail['sale_price']) { ?>
                            <label class="attr-label-pro-detail d-block mb-2"><span class="price-new-pro-detail"
                                    id="product-discount-price"><?= $func->formatMoney($rowDetail['sale_price']) ?></span><span
                                    class="price-old-pro-detail"
                                    id="product-price"><?= $func->formatMoney($rowDetail['regular_price']) ?></span> <span
                                    id="product-percent-discount"
                                    class="price-discount-pro-detail">-<?= $rowDetail['discount'] ?>%</span></label>
                        <?php } else { ?>
                            <label class="attr-label-pro-detail d-block mb-2"><span class="price-new-pro-detail"
                                    id="product-discount-price"><?= ($rowDetail['regular_price']) ? $func->formatMoney($rowDetail['regular_price']) : "Liên hệ: " . $optsetting['hotline'] ?></span><span
                                    id="product-price" class="price-old-pro-detail"></span></label>
                        <?php } ?>
                    </li>
                    <?php if ($productBrand) { ?>
                        <div class="d-flex align-items-center mb-2">
                            <span class="mx-1 fw-bold">Thương hiệu:</span> <span class="">
                                <?= $productBrand['name' . $lang] ?>
                            </span>
                        </div>
                    <?php } ?>
                    <?php if ($rowDetail['desc' . $lang]) { ?>
                        <li class="mb-3">
                            <div>
                                <?= htmlspecialchars_decode($rowDetail['desc' . $lang]) ?>
                            </div>
                        </li>
                    <?php } ?>
                    <?php if (!empty($attributes) && !empty($optionsByAttr)) { ?>
                        <?php foreach ($attributes as $attr) { ?>
                            <?php $param = $func->changeTitle($attr['name' . $lang]); // "mau-sac", "kich-thuoc"... 
                            ?>

                            <li class="product-attr mb-3">
                                <label class="attr-label-pro-detail d-block mb-2"><?= $attr['name' . $lang] ?>:</label>
                                <div class="attr-options d-flex flex-wrap">
                                    <?php foreach ($optionsByAttr[$attr['id']] as $opt) { ?>
                                        <?php if ($attr['type_show'] == 2) { ?>
                                            <label class="btn-option">
                                                <input type="radio" name="attr[<?= $attr['id'] ?>]" value="<?= $opt['id'] ?>"
                                                    data-key="<?= $opt['option_id'] ?>" data-param="<?= $param ?>"
                                                    data-slug="<?= $func->changeTitle($opt['name']) ?>">
                                                <span><?= $opt['name'] ?></span>
                                            </label>
                                        <?php } elseif ($attr['type_show'] == 1) { ?>
                                            <label class="color-option d-flex align-items-center">
                                                <input type="radio" name="attr[<?= $attr['id'] ?>]" value="<?= $opt['id'] ?>"
                                                    data-key="<?= $opt['option_id'] ?>" data-param="<?= $param ?>"
                                                    data-slug="<?= $func->changeTitle($opt['name']) ?>">
                                                <span class="circle" style="background: <?= $opt['color'] ?>"></span>
                                                <span class="ms-2"><?= $opt['name'] ?></span>
                                            </label>
                                        <?php } else { ?>
                                            <label class="img-option">
                                                <input type="radio" name="attr[<?= $attr['id'] ?>]" value="<?= $opt['id'] ?>"
                                                    data-key="<?= $opt['option_id'] ?>">
                                                <span><img onerror="this.src='assets/images/noimage.png';"
                                                        src="<?= UPLOAD_ATTR_L . $opt['image'] ?>" alt=""></span>
                                            </label>
                                        <?php } ?>
                                    <?php } ?>
                                </div>
                            </li>
                        <?php } ?>
                    <?php } ?>



                    <div class="cart-pro-detail d-flex flex-wrap align-items-center justify-content-between">
                        <a class="addcart btn-main danger d-block" data-id="<?= $rowDetail['id'] ?>"
                            data-action="buynow"><span class="fw-600 fs-18"><?= muangay ?></span><br>
                            <span class="fw-500 text-capitalize">Giao nhanh từ 2 giờ hoặc nhận tại cửa
                                hàng</span></a>
                        <a class="addcart btn-main danger outline" data-id="<?= $rowDetail['id'] ?>"
                            data-action="addnow">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                                class="bi bi-cart-check me-3" viewBox="0 0 16 16">
                                <path
                                    d="M11.354 6.354a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0z" />
                                <path
                                    d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1zm3.915 10L3.102 4h10.796l-1.313 7zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0m7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0" />
                            </svg>
                            <span><?= themvaogiohang ?></span>
                        </a>
                    </div>
                    </li>
                </ul>
                <div class="py-3 py-md-1 rounded-4 support-wrap">
                    <div class="d-flex align-items-end justify-content-start flex-wrap gap-2 mb-3">
                        <div class="h5 fw-bold mb-0">Hỗ trợ đặt hàng / báo giá</div>
                        <div class="text-muted small">Thứ 2 - Thứ 7 (7h30 - 17h)</div>
                    </div>

                    <div class="row g-3">
                        <!-- Item -->
                        <?php foreach ($doingu as $v) { ?>
                            <div class="col-12 col-md-6">
                                <div class="support-card d-flex align-items-center gap-3 p-1 rounded-4 bg-light">
                                    <div class="avatar ">
                                        <img class="rounded-circle"
                                            src="<?= THUMBS ?>/70x70x1/<?= UPLOAD_NEWS_L . $v['photo'] ?>"
                                            alt="<?= $v['name' . $lang]; ?>">
                                    </div>

                                    <div class="flex-grow-1">
                                        <div class="d-flex align-items-center  flex-wrap">
                                            <div class="fw-bold fs-17 text-danger me-1"><?= $v['name' . $lang]; ?></div>
                                            <div class="text-muted"><?= $v['phone']; ?></div>
                                        </div>

                                        <div class="row  justify-content-between  mt-1">
                                            <div class="col-6 p-0">
                                                <a class="fw-600 btn btn-sm btn-outline-danger rounded-pill px-2 support-btn"
                                                    href="tel:<?= $v['phone']; ?>">
                                                    <span class="me-1 ">📞</span> Gọi điện
                                                </a>
                                            </div>
                                            <div class="col-6 p-0">
                                                <a class="fw-600 btn btn-sm btn-outline-primary rounded-pill px-2 support-btn "
                                                    href="https://zalo.me/<?= $v['zalo']; ?>" target="_blank"
                                                    rel="noopener">
                                                    <span class="me-1 "><img width="20" src="assets/images/zalo0.png"
                                                            alt="zalo"></span> Nhắn tin
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<?php if (empty($quickview)) { ?>
    <section class="wrap-pro-info mb-3">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-4 order-lg-2 mb-3 mb-lg-0">
                    <div class="sidebar">
                        <div class="bg-gray2 rounded-lg p-3">
                            <div class="title-main mb-3">
                                <h5>Thông số kỹ thuật</h5>
                            </div>
                            <div class="thongso-pro-detail"><?= $func->decodeHtmlChars($rowDetail['thongso' . $lang]) ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-8 order-lg-1">
                    <div class="bg-gray2 rounded-lg p-3">
                        <div class="d-flex flex-wrap justify-content-start">
                            <div class="title-main">
                                <h5>Chi tiết sản phẩm</h5>
                            </div>
                            <?php foreach ($rowDetailContent as $content) { ?>
                                <h5><a href="javascript:;"
                                        onclick="if( !$('.btn-view-full-content').hasClass('is-show') ) $('.btn-view-full-content').trigger('click'); goToByScroll('title-<?= $content['id'] ?>', 170)"><?= $content['name' . $lang] ?></a>
                                </h5>
                            <?php } ?>
                        </div>
                        <?php if ($rowDetail['content' . $lang]) { ?>
                            <div class="meta-toc">
                                <div class="wrap-toc">
                                    <div class="toc-head">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" x="0" y="0"
                                            viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve"
                                            class="">
                                            <g>
                                                <path
                                                    d="M464.883 64.267H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.013-21.136-47.149-47.116-47.149zM47.134 64.267C21.145 64.267 0 85.411 0 111.4s21.145 47.133 47.134 47.133 47.133-21.144 47.133-47.133-21.144-47.133-47.133-47.133zM47.134 208.867C21.145 208.867 0 230.011 0 256s21.145 47.133 47.134 47.133S94.267 281.989 94.267 256s-21.144-47.133-47.133-47.133zM47.134 353.467C21.145 353.467 0 374.611 0 400.6s21.145 47.133 47.134 47.133 47.133-21.144 47.133-47.133-21.144-47.133-47.133-47.133zM464.883 208.867H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.013-21.136-47.149-47.116-47.149zM464.883 353.467H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.012-21.136-47.149-47.116-47.149z"
                                                    opacity="1" class=""></path>
                                            </g>
                                        </svg>
                                        Mục lục
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                            class="bi bi-caret-down-fill ms-auto cursor-pointer" viewBox="0 0 16 16">
                                            <path
                                                d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                                        </svg>
                                    </div>
                                    <ul class="toc-list" data-toc-headings="h1, h2, h3"></ul>
                                </div>
                            </div>
                            <div class="meta-toc-fixed">
                                <a class="menu-dropdown-button">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" x="0" y="0"
                                        viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve"
                                        class="">
                                        <g>
                                            <path
                                                d="M464.883 64.267H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.013-21.136-47.149-47.116-47.149zM47.134 64.267C21.145 64.267 0 85.411 0 111.4s21.145 47.133 47.134 47.133 47.133-21.144 47.133-47.133-21.144-47.133-47.133-47.133zM47.134 208.867C21.145 208.867 0 230.011 0 256s21.145 47.133 47.134 47.133S94.267 281.989 94.267 256s-21.144-47.133-47.133-47.133zM47.134 353.467C21.145 353.467 0 374.611 0 400.6s21.145 47.133 47.134 47.133 47.133-21.144 47.133-47.133-21.144-47.133-47.133-47.133zM464.883 208.867H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.013-21.136-47.149-47.116-47.149zM464.883 353.467H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.012-21.136-47.149-47.116-47.149z"
                                                opacity="1" class=""></path>
                                        </g>
                                    </svg>
                                </a>
                            </div>
                            <div id="toc-content">
                                <div class="content-text" id="noidung" style="max-height: 550px">
                                    <?= $func->decodeHtmlChars($rowDetail['content' . $lang]) ?>

                                    <?php foreach ($rowDetailContent as $k => $content) { ?>
                                        <h2 id="title-<?= $content['id'] ?>"><?= $content['name' . $lang] ?></h2>
                                        <div><?= htmlspecialchars_decode($content['desc' . $lang]) ?></div>
                                    <?php } ?>

                                    <div class="hide-content" style="background: linear-gradient(transparent, #fff 100%)">
                                        <div class="buttons-common active">
                                            <a href="javascript:;"
                                                class="active blob-btn rounded btn py-2 px-4 btn-view-full-content"
                                                data-target="#noidung">
                                                <span class="blob-txt">Xem thêm bài viết
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                        fill="currentColor" class="bi bi-arrow-down" viewBox="0 0 16 16">
                                                        <path fill-rule="evenodd"
                                                            d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1" />
                                                    </svg>
                                                </span>
                                                <span class="blob-btn__inner">
                                                    <span class="blob-btn__blobs">
                                                        <span class="blob-btn__blob"></span>
                                                        <span class="blob-btn__blob"></span>
                                                        <span class="blob-btn__blob"></span>
                                                        <span class="blob-btn__blob"></span>
                                                    </span>
                                                </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <?php if (!empty($product)) { ?>
        <section class="wrap-other mb-3">
            <div class="container position-relative">
                <div class="title-main">
                    <h5>Sản phẩm cùng loại</h3>
                </div>
                <div class="owl-page owl-carousel owl-theme"
                    data-items="screen:0|items:2|margin:15,screen:425|items:2|margin:15,screen:575|items:3|margin:15,screen:767|items:3|margin:15,screen:991|items:4|margin:15,screen:1199|items:5|margin:15"
                    data-rewind="1" data-autoplay="1" data-loop="0" data-lazyload="0" data-mousedrag="1" data-touchdrag="1"
                    data-smartspeed="300" data-autoplayspeed="500" data-autoplaytimeout="3500" data-dots="0" data-nav="1"
                    data-navcontainer=".control-other">
                    <?php foreach ($product as $k => $v) { ?>
                        <?php include TEMPLATE . LAYOUT . "blocks/product.php"; ?>
                    <?php } ?>
                </div>
                <?php if (count($product) > 5) { ?>
                    <div class="control-other control-owl transition"></div>
                <?php } ?>
            </div>
        </section>
    <?php } ?>



<?php } ?>