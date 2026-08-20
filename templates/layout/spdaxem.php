<?php if($productSeens) { $isLazy = false; $classes="box-product-list"; ?>
<section class="wrap-product-seen mb-3 mb-lg-4">
    <div class="container">
        <div class="title-main d-block d-md-flex align-items-start justify-content-between">
            <h2>Sản phẩm đã xem</h2>
            <a href="javascript:;" class="remove-history d-none d-md-flex align-items-center text-muted">
                Xoá lịch sử
            </a>
        </div>
        <div class="owl-page owl-carousel owl-theme" data-items="screen:0|items:1|margin:10,screen:425|items:1|margin:10,screen:575|items:2|margin:10,screen:767|items:3|margin:10,screen:991|items:3|margin:20,screen:1199|items:4|margin:20" data-center="0" data-rewind="1" data-autoplay="1" data-loop="0" data-lazyload="0" data-mousedrag="1" data-touchdrag="1" data-smartspeed="300" data-autoplayspeed="1000" data-autoplaytimeout="5500" data-dots="1" data-nav="0" data-navcontainer="">
            <?php foreach ($productSeens as $k => $v) { ?>
            <?php include TEMPLATE . LAYOUT . "blocks/product.php"; ?>
            <?php } ?>
        </div>
    </div>
</section>
<?php } ?>