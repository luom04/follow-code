<div class="container">
    <div class="title-main text-center"><div class="title"><span><?= (!empty($titleCate)) ? $titleCate : @$titleMain ?></span></div></div>
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