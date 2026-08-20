<div class="banner-top text-center py-2">
    <div class="container">
        <div class="row justify-content-between align-items-center">
            <div class="col-auto">
                <a class="logo d-block peShiner" href="<?= $configBase ?>" title="<?= $setting['name' . $lang] ?>">
                    <img onerror="this.src='<?= THUMBS ?>/271x55x1/assets/images/noimage.png';"
                        src="<?= $func->addWebpToUrl(THUMBS . '/271x55x2/' . UPLOAD_PHOTO_L . $logo['photo']); ?>"
                        alt="<?= $setting['name' . $lang] ?>" title="<?= $setting['name' . $lang] ?>" width="271" height="55" />
                </a>
            </div>
            <?php if ($deviceType != 'mobile') { ?>
                <div class="col-auto">
                    <div class="search-wrapper active">
                        <input type="text" id="keyword" data-placeholders="Bạn tìm gì...." onkeydown="doEnter(event,'keyword');" value=""
                            class="form-control input-placeholder border-0 flex-grow-1">
                        <button class="btn btn-close d-none" id="btn-clear-keyword"> &times; </button>
                        <button class="btn btn-search btn-light" onclick="onSearch('keyword')">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-search" viewBox="0 0 16 16">
                                <path
                                    d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0">
                                </path>
                            </svg>
                        </button>
                    </div>
                    <div id="search-result"></div>
                </div>
            <?php } ?>
            <div class="col-auto d-flex justify-content-between align-items-center">
                <div class="d-none d-lg-block me-2 ms-lg-3">
                    <div class="hotline d-flex align-items-center">
                        <!-- Generator: Adobe Illustrator 19.1.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                        <img src="assets/images/calll.png" class="me-2" alt="Hotline">
                        <div class="d-block">
                            <a class="d-block" href="tel:<?= $func->parsePhone($optsetting['hotline']) ?>"
                                onclick="countClick('hotline')" title="Hotline">
                                <?= $optsetting['hotline'] ?>
                            </a>
                            <a class="d-block" href="tel:<?= $func->parsePhone($optsetting['phone']) ?>"
                                onclick="countClick('phone')" title="Phone">
                                <?= $optsetting['phone'] ?>
                            </a>
                        </div>
                    </div>
                </div>
                <?php if ($config['cart']['active'] || $config['watermark']['active'] == true) { ?>
                    <div class="me-2 ms-auto ms-lg-0">
                        <a href="gio-hang" class="cart d-flex align-items-center" onclick="countClick('order')" title="Giỏ hàng">
                            <img src="assets/images/cart.png" class="me-2" alt=" Giỏ hàng">
                            <div class="text-start">
                                <span class="d-block fw-500 color-666666">Giỏ hàng</span>
                                <b class="fw-bold text-main fs-16">
                                    <?= (!empty($_SESSION['cart'])) ? count($_SESSION['cart']) : 0 ?> sản phẩm
                                </b>
                            </div>
                        </a>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
</div>
<div id="header" class="shadow">
    <div class="header-bottom">
        <div class="container">
            <div class="row align-items-center justify-content-md-between justify-content-center">

                <div class="col d-flex align-items-center justify-content-between">
                    <?php if ($deviceType != 'mobile') { ?>
                        <div class="menu-wrapper d-none d-lg-block">
                            <a href="javascript:;" class="btn-main menu-toggle" title="Danh mục sản phẩm">
                                <svg enable-background="new 0 0 24 24" fill="#ffffff" height="16" viewBox="0 0 24 24"
                                    width="16" class="me-2" xmlns="http://www.w3.org/2000/svg">
                                    <g id="List">
                                        <path d="m21 7h-18c-1.3 0-1.3-2 0-2h18c1.3 0 1.3 2 0 2z" />
                                        <path d="m18 13h-15c-1.3 0-1.3-2 0-2h15c1.3 0 1.3 2 0 2z" />
                                        <path d="m12 19h-9c-1.3 0-1.3-2 0-2h9c1.3 0 1.3 2 0 2z" />
                                    </g>
                                </svg>
                                <span>Danh Mục sản phẩm</span>
                            </a>
                            <?php if (count($productListMenu)) { ?>
                                <div class="menu-dropdown">
                                    <ul class="menu-left">
                                        <?php foreach ($productListMenu as $klist => $vlist) { ?>
                                            <li data-target="<?= $vlist[$sluglang] ?>" <?= $klist == 0 ? 'class="active"' : '' ?>><a
                                                    href="<?= $vlist[$sluglang] ?>" title="<?= $vlist['name' . $lang] ?>"><?= $vlist['name' . $lang] ?></a> </li>
                                        <?php } ?>
                                    </ul>
                                    <div class="menu-right">
                                        <?php foreach ($productListMenu as $klist => $vlist) {
                                            $productCatMenu = $d->rawQuery("select name$lang, slugvi, slugen, photo, id from #_product_cat where id_list = ? and find_in_set('hienthi',status) order by numb,id desc", array($vlist['id']));
                                        ?>
                                            <div class="menu-panel <?= $klist == 0 ? 'active' : '' ?>"
                                                id="<?= $vlist[$sluglang] ?>">
                                                <div class="mb-2"><a class="fw-bold" href="<?= $vlist[$sluglang] ?>"
                                                        title="<?= $vlist['name' . $lang] ?>"><?= $vlist['name' . $lang] ?></a></div>
                                                <div class="d-flex flex-wrap gap-2">
                                                    <?php foreach ($productCatMenu as $k => $v) { ?>
                                                        <a class="category-item" href="<?= $v[$sluglang] ?>"
                                                            title="<?= $v['name' . $lang] ?>" data-aos="fade-up">
                                                            <p class="image scale-img">
                                                                <img onerror="this.src='<?= THUMBS ?>/100x100x1/assets/images/noimage.png';"
                                                                    src="<?= $func->addWebpToUrl(THUMBS . '/100x100x1/' . UPLOAD_PRODUCT_L . $v['photo']); ?>"
                                                                    alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                                                            </p>
                                                            <p class="name text-split text-split-2 mb-0"><?= $v['name' . $lang] ?></p>
                                                        </a>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>
                    <?php } ?>
                    <ul class="header-ul d-flex flex-grow-1 align-items-center justify-content-between ms-auto ms-lg-0">
                        <li class="d-none d-xl-block"><a href="" class=" <?= $com == 'index' ? 'active' : '' ?>" title="Trang chủ">Trang
                                chủ</a></li>
                        <li class="d-none d-xl-block line"></li>
                        <li class="d-none d-xl-block"><a href="gioi-thieu"
                                class=" <?= $com == 'gioi-thieu' ? 'active' : '' ?>" title="Giới thiệu">Giới thiệu</a></li>
                        <li class="d-none d-xl-block line"></li>
                        <li class="has-child d-none d-xl-block"><a href="thuong-hieu"
                                class=" <?= $com == 'thuong-thieu' ? 'active' : '' ?>" title="Thương hiệu">Thương hiệu</a>
                            <ul class="submenu">
                                <?php foreach ($brands as $v) { ?>
                                    <li>
                                        <a class="brand-item" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>">
                                            <p class="image mb-0 scale-img">
                                                <img onerror="this.src='<?= THUMBS ?>/240x120x1/assets/images/noimage.png';"
                                                    src="<?= $func->addWebpToUrl(THUMBS . '/240x120x2/' . UPLOAD_PRODUCT_L . $v['photo']); ?>"
                                                    alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" width="240" height="120" />
                                            </p>
                                        </a>
                                    </li>
                                <?php } ?>
                            </ul>
                        </li>
                        <li class="d-none d-xl-block line"></li>
                        <li class="d-none d-xl-block"><a href="catalogue"
                                class=" <?= $com == 'catalogue' ? 'active' : '' ?>" title="Catalogue">Catalogue</a></li>
                        <li class="d-none d-xl-block line"></li>
                        <li class="d-none d-xl-block"><a href="tai-lieu-ky-thuat"
                                class=" <?= $com == 'tai-lieu-ky-thuat' ? 'active' : '' ?>" title="Tài liệu kỹ thuật">Tài liệu kỹ thuật</a></li>

                        <li class="d-none d-xl-block line"></li>
                        <li class="d-none d-xl-block"><a href="kien-thuc"
                                class=" <?= $com == 'kien-thuc' ? 'active' : '' ?>" title="Kiến thức">Kiến thức</a>
                        </li>
                        <li class="d-none d-xl-block line"></li>
                        <li class="d-none d-xl-block me-2" onclick="countClick('contact')"><a href="lien-he"
                                class=" <?= $com == 'lien-he' ? 'active' : '' ?>" title="Liên hệ">Liên hệ</a></li>
                        <li class="d-block d-xl-none">
                            <a id="hamburger" href="#menu" title="Menu"><span></span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <?php if ($deviceType == 'mobile') { ?>
        <div class="header-nav">
            <div class="container position-relative d-flex align-items-center z-1001">
                <div class="menu-wrapper mobile me-2">
                    <a href="javascript:;" class="btn-main d-flex flex-column p-1 pt-2 fw-light menu-toggle mobile">
                        <span
                            style="height: 1px; background: #fff; display: block; width: 23px; margin-bottom: 3px;"></span>
                        <span
                            style="height: 1px; background: #fff; display: block; width: 23px; margin-bottom: 3px;"></span>
                        <span
                            style="height: 1px; background: #fff; display: block; width: 23px; margin-bottom: 3px;"></span>
                        <span class="d-flex" style="font-size: 8px">Danh Mục</span>
                    </a>
                    <?php if (count($productListMenu)) { ?>
                        <div class="menu-dropdown">
                            <div class="menu-header d-flex align-items-center justify-content-between">
                                Danh mục sản phẩm
                                <a href="javascript:;" class="btn-close-menu"></a>
                            </div>
                            <div class="d-flex pt-2" style="background: #f2f2f2;">
                                <ul class="menu-left me-2">
                                    <?php foreach ($productListMenu as $klist => $vlist) { ?>
                                        <li data-target="<?= $vlist[$sluglang] ?>" <?= $klist == 0 ? 'class="active"' : '' ?>>
                                            <?= $vlist['name' . $lang] ?>
                                        </li>
                                    <?php } ?>
                                    <li><a href="gioi-thieu" title="Giới thiệu">Giới thiệu</a></li>
                                    <li data-target="thuong-hieu" title="Thương hiệu">Thương hiệu</li>
                                    <li><a href="catalogue" title="Catalogue">Catalogue</a></li>
                                    <li><a href="tai-lieu-ky-thuat" title="Tài liệu kỹ thuật">Tài liệu kỹ thuật</a></li>
                                    <li><a href="kien-thuc" title="Kiến thức">Kiến thức</a></li>
                                    <li><a href="lien-he" onclick="countClick('contact')" title="Liên hệ">Liên hệ</a></li>
                                </ul>
                                <div class="menu-right">
                                    <?php foreach ($productListMenu as $klist => $vlist) {
                                        $productCatMenu = $d->rawQuery("select name$lang, slugvi, slugen, photo, id from #_product_cat where id_list = ? and find_in_set('hienthi',status) order by numb,id desc", array($vlist['id']));
                                    ?>
                                        <div class="menu-panel <?= $klist == 0 ? 'active' : '' ?>" id="<?= $vlist[$sluglang] ?>">
                                            <div class="mb-2"><a class="fw-bold"
                                                    href="<?= $vlist[$sluglang] ?>"><?= $vlist['name' . $lang] ?></a></div>
                                            <div class="d-flex flex-wrap">
                                                <?php foreach ($productCatMenu as $k => $v) { ?>
                                                    <a class="category-item" href="<?= $v[$sluglang] ?>"
                                                        title="<?= $v['name' . $lang] ?>" data-aos="fade-up">
                                                        <p class="image scale-img">
                                                            <img onerror="this.src='<?= THUMBS ?>/100x100x1/assets/images/noimage.png';"
                                                                src="<?= $func->addWebpToUrl(THUMBS . '/100x100x1/' . UPLOAD_PRODUCT_L . $v['photo']); ?>"
                                                                alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" width="100" height="100" />
                                                        </p>
                                                        <p class="fs-14 fw-bold name text-split text-split-2 mb-0"><?= $v['name' . $lang] ?></p>
                                                    </a>
                                                <?php } ?>
                                            </div>
                                        </div>
                                    <?php } ?>
                                    <div class="menu-panel" id="thuong-hieu">
                                        <div class="mb-2"><a class="fw-bold" href="thuong-hieu" title="Thương Hiệu">Thương Hiệu</a></div>
                                        <div class="d-flex flex-wrap gap-2">
                                            <?php foreach ($brands as $k => $v) { ?>
                                                <a class="category-item" href="<?= $v[$sluglang] ?>"
                                                    title="<?= $v['name' . $lang] ?>" data-aos="fade-up">
                                                    <p class="image scale-img">
                                                        <img onerror="this.src='<?= THUMBS ?>/100x100x1/assets/images/noimage.png';"
                                                            src="<?= $func->addWebpToUrl(THUMBS . '/100x100x1/' . UPLOAD_PRODUCT_L . $v['photo']); ?>"
                                                            alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" width="100" height="100" />
                                                    </p>
                                                    <p title="<?= $v['name' . $lang] ?>" class="name text-split text-split-2 mb-0"><?= $v['name' . $lang] ?></p>
                                                </a>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                </div>
                <div class="search-wrapper active">
                    <input type="text" id="keyword" placeholder="Bạn tìm gì...." onkeydown="doEnter(event,'keyword');"
                        value="" class="form-control border-0 flex-grow-1 ">
                    <button class="btn btn-close d-none" id="btn-clear-keyword" title="Xóa"> &times; </button>
                    <button class="btn btn-search btn-light" onclick="onSearch('keyword')" title="Tìm kiếm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-search" viewBox="0 0 16 16">
                            <path
                                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0">
                            </path>
                        </svg>
                    </button>
                </div>
                <a href="gio-hang" class="cart d-none align-items-center" title="Giỏ hàng">
                    <svg clip-rule="evenodd" fill-rule="evenodd" class="ms-1" height="30" stroke-linejoin="round"
                        stroke-miterlimit="2" viewBox="0 0 48 48" width="32" xmlns="http://www.w3.org/2000/svg">
                        <g transform="translate(-53 -212)">
                            <g transform="translate(-355 -60)">
                                <g id="ngicon">
                                    <path
                                        d="m422.519 285.5h-2.657c-1.836 0-3.36 1.419-3.491 3.251l-1.714 24c-.069.969.267 1.923.929 2.634.663.711 1.59 1.115 2.562 1.115h27.704c.972 0 1.899-.404 2.562-1.115.662-.711.998-1.665.929-2.634l-1.714-24c-.131-1.832-1.655-3.251-3.491-3.251h-2.638v-.5c0-5.247-4.253-9.5-9.5-9.5-5.055 0-9.727 4.026-9.5 9.5.007.166.013.333.019.5zm18.981 3v7.5c0 .828-.672 1.5-1.5 1.5s-1.5-.672-1.5-1.5v-7.5h-13v7.5c0 .828-.672 1.5-1.5 1.5s-1.5-.672-1.5-1.5c0 0 .13-3.505.087-7.5h-2.725c-.262 0-.48.203-.498.464 0 0-1.715 24-1.715 24-.01.139.038.275.133.377.095.101.227.159.366.159h27.704c.139 0 .271-.058.366-.159.095-.102.143-.238.133-.377l-1.715-24c-.018-.261-.236-.464-.498-.464zm-3-3v-.5c0-3.59-2.91-6.5-6.5-6.5-3.59 0-6.5 2.91-6.5 6.5v.5z" />
                                </g>
                            </g>
                        </g>
                    </svg>
                    <b class="fw-600 text-red">
                        <?= (!empty($_SESSION['cart'])) ? count($_SESSION['cart']) : 0 ?>
                    </b>
                </a>

                <div id="search-result"></div>
            </div>
        </div>
    <?php } ?>
</div>
<?php include TEMPLATE . LAYOUT . "mmenu.php"; ?>
<!-- backdrop -->
<div class="menu-backdrop"></div>