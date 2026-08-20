<?php if ($productListMenu) {
    foreach ($productListMenu as $klist => $vlist) {
        $productCats = $d->rawQuery("select name$lang, slugvi, slugen, photo, id from #_product_cat where id_list = ? and find_in_set('hienthi',status) order by numb,id desc", array($vlist['id']));
        $ajaxKey = uniqid();
?>
        <section class="wrap-product-list pb-3 pb-lg-4">
            <div class="container">
                <div class="title-main d-block d-md-flex align-items-end justify-content-between mb-3">
                    <div class="title">
                        <span><?= $vlist['name' . $lang] ?></span>
                    </div>
                    <div class="owl-cat d-flex flex-wrap ms-auto gap-1">
                        <a href="<?= $vlist[$sluglang] ?>" class="py-1 px-2 active">Tất cả</a>
                        <?php foreach ($productCats as $kcat => $vcat) { ?>
                            <a href="<?= $vcat[$sluglang] ?>" class="py-1 px-2">
                                <?= $vcat['name' . $lang] ?>
                            </a>
                        <?php } ?>
                    </div>
                </div>
                <div class="show-padding show-padding-product<?= $ajaxKey ?>">
                    <div class="choose-list">
                        <button class="d-none choosed" data-ajax="product" data-ajax-key="<?= $ajaxKey ?>" data-show="row"
                            data-status="" data-paging="0" data-perpage="<?= $deviceType == 'mobile' ? '6' : '5' ?>"
                            data-list="<?= $vlist['id'] ?>" data-cat="">
                        </button>
                    </div>
                </div>
                <div class="text-center">
                    <div class="buttons-common active">
                        <a href="<?= $vlist[$sluglang] ?>" class="blob-btn active btn py-2 px-5">
                            <span class="blob-txt text-uppercase">Xem tất cả sản phẩm</span>
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
        </section>
<?php }
} ?>