<div class="wrap-level">
    <div class="container">
        <div class="row  row-cols-3 row-cols-sm-3 row-cols-md-4 row-cols-lg-5">
            <?php foreach ($productListMenu as $k => $v) { ?>
                <div class="box-level ">
                    <div class="pic-product">
                        <a class="text-decoration-none scale-img rounded-3" href="<?= $v[$sluglang] ?>"
                            title="<?= $v['name' . $lang] ?>">
                            <?php if (isset($isLazy) && $isLazy == false) { ?>
                                <img class="w-100 img-<?= $v['id'] ?>"
                                    onerror="this.src='<?= THUMBS ?>/500x500x1/assets/images/noimage.png';"
                                    src="<?= $func->addWebpToUrl(THUMBS . '/600x600x1/' . UPLOAD_PRODUCT_L . $v['photo']); ?>"
                                    alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                            <?php } else { ?>
                                <img class="lazy w-100 img-<?= $v['id'] ?>"
                                    onerror="this.src='<?= THUMBS ?>/500x500x1/assets/images/noimage.png';"
                                    data-src="<?= $func->addWebpToUrl(THUMBS . '/600x600x1/' . UPLOAD_PRODUCT_L . $v['photo']); ?>"
                                    alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                            <?php } ?>
                        </a>
                    </div>
                    <div class="info-product mt-2">
                        <h3 class="mb-0"><a class="text-split name-product" href="<?= $v[$sluglang] ?>"
                                title="<?= $v['name' . $lang] ?>"><?= $v['name' . $lang] ?></a></h3>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
</div>
<?php
$attrsShow = $d->rawQuery(" select id, name$lang as name, options from #_attributes where type='san-pham' and type_show = 1 and find_in_set('hienthi',status) order by numb, id desc", []);

$attrsParsed = [];
foreach ($attrsShow as $attr) {
    $opts = json_decode($attr['options'], true);
    if (is_array($opts) && !empty($opts)) {
        $attrsParsed[] = [
            'id' => (int) $attr['id'],
            'name' => $attr['name'],
            'options' => $opts
        ];
    }
}



?>


<div class="container">
    <div class="row flex-column-reverse flex-lg-row">
        <div class="col-12 col-lg-12 mb-4">
            <div class="wrap-filter position-relative mb-4 d-none flex-wrap gap-2">
                <?php if ($_GET['q']) { ?>
                    <div class="search">
                        <input type="text" name="q" placeholder="Tìm kiếm ..." value="<?= $_GET['q'] ?>"
                            class="form-control">
                        <div class="buttons-common active">
                            <a href="javascript:;" class="blob-btn active rounded-pill btn btn-result px-4 py-2">
                                <span class="blob-txt text-uppercase">Xem kết quả</span>
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
                <?php } ?>
                <div class="filter-item">
                    <a href="#" class="btn-main filter-title px-3 py-1 outline">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-sliders" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                d="M11.5 2a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M9.05 3a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0V3zM4.5 7a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M2.05 8a2.5 2.5 0 0 1 4.9 0H16v1H6.95a2.5 2.5 0 0 1-4.9 0H0V8zm9.45 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m-2.45 1a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0v-1z" />
                        </svg>
                        <span class="d-block ms-2">Bộ lọc</span>
                        <span class="filter-counter <?= ($filterActive || isset($_GET)) ? 'show' : '' ?>"
                            data-key="all"><?= ($filterActive) ? '1' : '' ?></span>
                    </a>
                    <div class="filter-dropdown filter-dropdown-all">
                        <h6 class="fw-bold">Danh mục</h6>
                        <div class="filter-dropdown-list d-flex flex-wrap gap-2 mb-3">
                            <?php foreach ($filterLists as $k => $v) { ?>
                                <div class="filter-dropdown-item">
                                    <a href="<?= $v[$sluglang] ?>"
                                        class="btn-main btn-filter btn-filter-all outline gray  px-2 py-1 <?= ($filterActive && $filterActive == $v['id']) ? 'active' : '' ?>"
                                        data-multiple="" data-key="<?= $filterKey ?>" data-value="<?= $v['id'] ?>">
                                        <?= $v['name' . $lang] ?>
                                    </a>
                                </div>
                            <?php } ?>
                        </div>
                        <h6 class="fw-bold">Thương hiệu</h6>
                        <div class="filter-dropdown-list d-flex flex-wrap gap-2 mb-3">
                            <?php foreach ($brands as $k => $v) {
                                if (!isset($brandIds) || in_array($v['id'], $brandIds)) { ?>
                                    <div class="filter-dropdown-item">
                                        <a href="<?= $v[$sluglang] ?>"
                                            class="btn-main btn-filter btn-filter-all outline gray  px-2 py-1" data-multiple="1"
                                            data-key="brand" data-value="<?= $v['id'] ?>">
                                            <?= $v['name' . $lang] ?>
                                        </a>
                                    </div>
                                <?php }
                            } ?>
                        </div>

                        <h6 class="fw-bold">Lọc theo giá</h6>
                        <div class="filter-dropdown-list d-flex flex-wrap gap-2 mb-3">
                            <?php foreach ($filterPrices as $k => $v) { ?>
                                <div class="filter-dropdown-item">
                                    <a href="javascript:;"
                                        class="btn-main btn-filter btn-filter-all outline gray rounded-pill  px-2 py-1 <?= (isset($_GET) && $_GET['giaban'] == $k) ? 'active' : '' ?>"
                                        data-multiple="" data-key="giaban" data-value="<?= $k ?>">
                                        <?= $v ?>
                                    </a>
                                </div>
                            <?php } ?>
                            <div class="filter-dropdown-item">
                                <a href="javascript:;" class="btn-main btn-filter btn-filter-all outline gray px-2 py-1"
                                    data-key="giaban" data-value="a-z">
                                    Giá thấp → cao
                                </a>
                            </div>
                            <div class="filter-dropdown-item">
                                <a href="javascript:;" class="btn-main btn-filter btn-filter-all outline gray px-2 py-1"
                                    data-key="giaban" data-value="z-a">
                                    Giá cao → thấp
                                </a>
                            </div>
                        </div>
                        <?php foreach ($attrsParsed as $attr) { ?>
                            <h6 class="fw-bold"><?= $attr['name'] ?></h6>
                            <div class="filter-dropdown-list d-flex flex-wrap gap-2 mb-3">
                                <?php foreach ($attr['options'] as $op) {
                                    $opId = (int) $op['id'];
                                    $opName = $op['name' . $lang] ?? $op['name'] ?? '';
                                    $opColor = $op['color'] ?? '';
                                    ?>
                                    <a href="javascript:;" class="btn-main btn-filter btn-filter-all outline gray px-2 py-1"
                                        data-key="attr[<?= $attr['id'] ?>]" data-value="<?= $opId ?>" data-multiple="1">

                                        <?php if ($opColor && $attr['name'] == 'Màu sắc') { ?>
                                            <span
                                                style="width:12px;height:12px;border-radius:50%;background:<?= $opColor ?>;display:inline-block;margin-right:5px;"></span>
                                        <?php } ?>
                                        <?= $opName ?>
                                    </a>
                                <?php } ?>
                            </div>
                        <?php } ?>


                        <div class="d-flex justify-content-center pt-3 border-top">
                            <div class="buttons-common active">
                                <a href="javascript:;" class="blob-btn active btn btn-result rounded-pill px-4 py-1">
                                    <span class="blob-txt text-uppercase">Xem kết quả</span>
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
                <div class="filter-item">
                    <a href="#" class="btn-main filter-title px-3 py-1 outline gray">
                        <span class="d-block">Danh mục</span>
                        <span class="filter-counter <?= ($filterActive) ? 'show' : '' ?>"
                            data-key="<?= $filterKey ?>"><?= ($filterActive) ? '1' : '' ?></span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-chevron-expand" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                d="M3.646 9.146a.5.5 0 0 1 .708 0L8 12.793l3.646-3.647a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 0-.708m0-2.292a.5.5 0 0 0 .708 0L8 3.207l3.646 3.647a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 0 0 0 .708" />
                        </svg>
                    </a>
                    <div class="filter-dropdown">
                        <div class="filter-dropdown-list d-flex flex-wrap gap-2 mb-3">
                            <?php foreach ($filterLists as $k => $v) { ?>
                                <div class="filter-dropdown-item">
                                    <a href="<?= $v[$sluglang] ?>"
                                        class="btn-main btn-filter btn-filter-single outline gray px-2 py-1 <?= ($filterActive && $filterActive == $v['id']) ? 'active' : '' ?>"
                                        data-multiple="" data-key="<?= $filterKey ?>" data-value="<?= $v['id'] ?>">
                                        <?= $v['name' . $lang] ?>
                                    </a>
                                </div>
                            <?php } ?>
                        </div>
                        <div class="d-flex justify-content-center pt-3 border-top">
                            <div class="buttons-common active">
                                <a href="javascript:;" class="blob-btn active btn btn-result rounded-pill px-4 py-1">
                                    <span class="blob-txt text-uppercase">Xem kết quả</span>
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
                <div class="filter-item">
                    <a href="#" class="btn-main filter-title px-3 py-1 outline gray">
                        <span class="d-block">Thương hiệu</span>
                        <span class="filter-counter" <?= (isset($_GET) && $_GET['brand']) ? 'show' : '' ?>
                            data-key="brand"><?= (isset($_GET) && $_GET['brand']) ? '1' : '' ?></span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-chevron-expand" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                d="M3.646 9.146a.5.5 0 0 1 .708 0L8 12.793l3.646-3.647a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 0-.708m0-2.292a.5.5 0 0 0 .708 0L8 3.207l3.646 3.647a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 0 0 0 .708" />
                        </svg>
                    </a>
                    <div class="filter-dropdown">
                        <div class="filter-dropdown-list d-flex flex-wrap gap-2 mb-3">
                            <?php foreach ($brands as $k => $v) {
                                if (!isset($brandIds) || in_array($v['id'], $brandIds)) { ?>
                                    <div class="filter-dropdown-item">
                                        <a href="<?= $v[$sluglang] ?>"
                                            class="btn-main btn-filter btn-filter-single outline gray px-2 py-1 <?= (isset($_GET) && $_GET['brand'] == $v['id']) ? 'active' : '' ?>"
                                            data-multiple="1" data-key="brand" data-value="<?= $v['id'] ?>">
                                            <?= $v['name' . $lang] ?>
                                        </a>
                                    </div>
                                <?php }
                            } ?>
                        </div>
                        <div class="d-flex justify-content-center pt-3 border-top">
                            <div class="buttons-common active">
                                <a href="javascript:;" class="blob-btn active btn btn-result rounded-pill px-4 py-1">
                                    <span class="blob-txt text-uppercase">Xem kết quả</span>
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

                <div class="filter-item">
                    <a href="#" class="btn-main filter-title px-3 py-1 outline gray">
                        <span class="d-block">Lọc theo giá</span>
                        <span class="filter-counter <?= (isset($_GET) && $_GET['giaban']) ? 'show' : '' ?>"
                            data-key="giaban"><?= (isset($_GET) && $_GET['giaban']) ? '1' : '' ?></span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-chevron-expand" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                d="M3.646 9.146a.5.5 0 0 1 .708 0L8 12.793l3.646-3.647a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 0-.708m0-2.292a.5.5 0 0 0 .708 0L8 3.207l3.646 3.647a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 0 0 0 .708" />
                        </svg>
                    </a>
                    <div class="filter-dropdown">
                        <div class="filter-dropdown-list d-flex flex-wrap gap-2 mb-3">
                            <?php foreach ($filterPrices as $k => $v) { ?>
                                <div class="filter-dropdown-item">
                                    <a href="javascript:;"
                                        class="btn-main btn-filter btn-result outline gray rounded-pill  px-2 py-1 <?= (isset($_GET) && $_GET['giaban'] == $k) ? 'active' : '' ?>"
                                        data-multiple="" data-key="giaban" data-value="<?= $k ?>">
                                        <?= $v ?>
                                    </a>
                                </div>
                            <?php } ?>
                            <div class="filter-dropdown-item">
                                <a href="javascript:;" class="btn-main btn-filter btn-result outline gray px-2 py-1"
                                    data-key="giaban" data-value="a-z">
                                    Giá thấp → cao
                                </a>
                            </div>
                            <div class="filter-dropdown-item">
                                <a href="javascript:;" class="btn-main btn-filter btn-result outline gray px-2 py-1"
                                    data-key="giaban" data-value="z-a">
                                    Giá cao → thấp
                                </a>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center pt-3 border-top">
                            <div class="buttons-common active">
                                <a href="javascript:;" class="blob-btn active btn btn-result rounded-pill px-4 py-1">
                                    <span class="blob-txt text-uppercase">Xem kết quả</span>
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
            </div>

            <div class="filter-result"></div>

            <?php if ($contentCate) { ?>
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="position-relative mt-4">
                            <div class="content-text" id="noidung"><?= $func->decodeHtmlChars($contentCate) ?></div>
                            <div class="hide-content">
                                <div class="buttons-common active">
                                    <a href="javascript:;"
                                        class="active rounded blob-btn btn py-2 px-5 btn-view-full-content"
                                        data-target="#noidung">
                                        <span class="blob-txt text-uppercase">Xem thêm
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
                </div>
            <?php } ?>
        </div>
    </div>
</div>