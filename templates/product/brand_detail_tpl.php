<?php if ($productListBrand) {
    foreach ($productListBrand as $klist => $vlist) { ?>
        <section class="wrap-product-list">
            <div class="container">
                <div class="title-main text-center title-main-detail">
                    <div class="title"><span><?= (!empty($titleCate)) ? $titleCate : @$titleMain ?></span></div>
                </div>
                <div class="title-main">
                    <h2><?= $vlist['name' . $lang] ?></h2>
                </div>
                <div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5">
                    <?php if (!empty($vlist['products'])) { ?>
                        <?php foreach ($vlist['products'] as $k => $v) { ?>
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
                </div>
            </div>
        </section>
    <?php }
} ?>