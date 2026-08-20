<div class="container py-2">
    <div class="row">
        <div class="col-12 col-lg-12 mb-lg-4">
            <?php if ($cats) { ?>
                <div class="row row-cols-2 row-cols-sm-4 row-cols-md-5 row-cols-lg-8 mb-3">
                    <?php foreach ($cats as $k => $v) { ?>
                        <div class="col mb-3">
                            <a class="cat-item w-100  bg-white p-0" href="<?= $v[$sluglang] ?>"
                                title="<?= $v['name' . $lang] ?>" data-aos="fade-up">
                                <p class="image mb-1 scale-img  rounded-lg">
                                    <img onerror="this.src='<?= THUMBS ?>/223x223x1/assets/images/noimage.png';"
                                        src="<?= THUMBS ?>/223x223x1/<?= UPLOAD_PRODUCT_L . $v['photo'] ?>"
                                        alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                                </p>
                                <h4 class="name fs-18 mt-2 fw-600  ms-0 mb-0"><?= $v['name' . $lang] ?></h4>
                            </a>
                        </div>
                    <?php } ?>
                </div>
            <?php } ?>
            <?php if (@$cats) { ?>
                <div class="title-main d-block d-md-flex align-items-center justify-content-start mb-3">
                    <div class="title me-3"><?= (!empty($titleCate)) ? $titleCate : @$titleMain ?></div>
                    <div class="wrap-filter position-relative ms-2 mb-2 mb-lg-0 d-none flex-wrap gap-2">
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
                                    data-key="all">
                                    <?= ($filterActive) ? '1' : '' ?>
                                </span>
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
                                                    class="btn-main btn-filter btn-filter-all outline gray  px-2 py-1"
                                                    data-multiple="1" data-key="brand" data-value="<?= $v['id'] ?>">
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
                                        <a href="javascript:;"
                                            class="btn-main btn-filter btn-filter-all outline gray px-2 py-1"
                                            data-key="giaban" data-value="a-z">
                                            Giá thấp → cao
                                        </a>
                                    </div>
                                    <div class="filter-dropdown-item">
                                        <a href="javascript:;"
                                            class="btn-main btn-filter btn-filter-all outline gray px-2 py-1"
                                            data-key="giaban" data-value="z-a">
                                            Giá cao → thấp
                                        </a>
                                    </div>
                                </div>
                                <?php foreach ($attrsParsed as $attr) { ?>
                                    <h6 class="fw-bold">
                                        <?= $attr['name'] ?>
                                    </h6>
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
                                        <a href="javascript:;"
                                            class="blob-btn active btn btn-result rounded-pill px-4 py-1">
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
                                    data-key="<?= $filterKey ?>">
                                    <?= ($filterActive) ? '1' : '' ?>
                                </span>
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
                                        <a href="javascript:;"
                                            class="blob-btn active btn btn-result rounded-pill px-4 py-1">
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
                                    data-key="brand">
                                    <?= (isset($_GET) && $_GET['brand']) ? '1' : '' ?>
                                </span>
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
                                        <a href="javascript:;"
                                            class="blob-btn active btn btn-result rounded-pill px-4 py-1">
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
                                    data-key="giaban">
                                    <?= (isset($_GET) && $_GET['giaban']) ? '1' : '' ?>
                                </span>
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
                                        <a href="javascript:;"
                                            class="blob-btn active btn btn-result rounded-pill px-4 py-1">
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
                </div>
            <?php } else { ?>
                <div class="title-main d-block d-md-flex align-items-center justify-content-start mb-3">
                    <div class="title me-3"><?= (!empty($titleCate)) ? $titleCate : @$titleMain ?></div>
                    <div class="wrap-filter position-relative mb-2 mb-lg-0 d-none flex-wrap gap-2">
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
                                    data-key="all">
                                    <?= ($filterActive) ? '1' : '' ?>
                                </span>
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
                                                    class="btn-main btn-filter btn-filter-all outline gray  px-2 py-1"
                                                    data-multiple="1" data-key="brand" data-value="<?= $v['id'] ?>">
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
                                        <a href="javascript:;"
                                            class="btn-main btn-filter btn-filter-all outline gray px-2 py-1"
                                            data-key="giaban" data-value="a-z">
                                            Giá thấp → cao
                                        </a>
                                    </div>
                                    <div class="filter-dropdown-item">
                                        <a href="javascript:;"
                                            class="btn-main btn-filter btn-filter-all outline gray px-2 py-1"
                                            data-key="giaban" data-value="z-a">
                                            Giá cao → thấp
                                        </a>
                                    </div>
                                </div>
                                <?php foreach ($attrsParsed as $attr) { ?>
                                    <h6 class="fw-bold">
                                        <?= $attr['name'] ?>
                                    </h6>
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
                                        <a href="javascript:;"
                                            class="blob-btn active btn btn-result rounded-pill px-4 py-1">
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
                                    data-key="<?= $filterKey ?>">
                                    <?= ($filterActive) ? '1' : '' ?>
                                </span>
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
                                        <a href="javascript:;"
                                            class="blob-btn active btn btn-result rounded-pill px-4 py-1">
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
                                    data-key="brand">
                                    <?= (isset($_GET) && $_GET['brand']) ? '1' : '' ?>
                                </span>
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
                                        <a href="javascript:;"
                                            class="blob-btn active btn btn-result rounded-pill px-4 py-1">
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
                                    data-key="giaban">
                                    <?= (isset($_GET) && $_GET['giaban']) ? '1' : '' ?>
                                </span>
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
                                        <a href="javascript:;"
                                            class="blob-btn active btn btn-result rounded-pill px-4 py-1">
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
                </div>
                <?php if ($tukhoa) { ?>
                    <div class="mb-4">Tìm thấy (<?= $total ?>): <span>"<?php echo $tukhoa_show; ?>"</span></div>
                <?php } ?>
            <?php } ?>
            <div class="filter-result"></div>
            <?php
            /* if ($com == 'san-pham') { ?>

<div class="loading-product">
<div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5">
<?php if (!empty($product)) { ?>
<?php foreach ($product as $k => $v) { ?>
<div class="col mb-3" data-aos="fade-up" data-aos-duration="1000">
<?php include TEMPLATE . LAYOUT . "blocks/product.php"; ?>
</div>
<?php } ?>
<?php } else { ?>
<div class="col-12">
<div class="alert alert-warning w-100" role="alert">
<strong><?= khongtimthayketqua ?></strong>
</div>
</div>
<?php } ?>

<div class="col-12">
<div class="pagination-home w-100"><?= (!empty($paging)) ? $paging : '' ?></div>
</div>
</div>
</div>
<input type="hidden" id="product-list" value="<?= $idl ?>">
<input type="hidden" id="product-offset" value="10">
<input type="hidden" id="product-limit" value="10">
<input type="hidden" id="product-total" value="<?= $total ?>">
<input type="hidden" id="product-type" value="<?= $type ?>">
<?php if ($total > 10) { ?>
<div class="d-flex justify-content-center mt-3">
<a href="javascript:void(0)" class="product-load-more btn-main px-3 py-2 rounded-3">
Xem thêm <span id="product-remaining" class="px-1"> <?= $total - 10 ?> </span> sản phẩm
</a>
</div>
<?php }
} */ ?>

            <?php if ($contentCate) { ?>
                <div class="position-relative mt-4">
                    <div class="content-text" id="noidung">
                        <?= $func->decodeHtmlChars($contentCate) ?>
                        <div class="hide-content">
                            <div class="buttons-common active">
                                <a href="javascript:;"
                                    class="blob-btn active rounded-pill btn py-2 px-5 btn-view-full-content"
                                    data-target="#noidung">
                                    <span class="blob-txt text-uppercase">Xem thêm
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                            class="bi bi-arrow-down" viewBox="0 0 16 16">
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