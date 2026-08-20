<?php /*
<i class="fa-regular fa-house"></i> // trang chủ
<i class="fa-solid fa-headset"></i> // tai nghe
<i class="fa-solid fa-phone"></i> // điện thoại
<i class="fa-solid fa-envelope"></i> // thư điện tử
<i class="fa-regular fa-calendar-days"></i> // lịch
<i class="fa-regular fa-alarm-clock"></i> // đồng hồ
<i class="fa-solid fa-angles-right"></i> // mũi tên phải đôi
<i class="fa-solid fa-arrow-right"></i> // mũi tên phải đơn
<i class="fa-solid fa-arrow-up-from-bracket"></i> // tải lên
<i class="fa-solid fa-caret-down"></i> // mũi tên xuống drowpown
<i class="fa-solid fa-cart-shopping"></i> // giỏ hàng
<i class="fa-solid fa-check"></i> // dấu tích
<i class="fa-solid fa-circle-arrow-right"></i> // mũi tên tròn phải
<i class="fa-solid fa-circle-chevron-right"></i> // mũi tên tròn phải nhỏ
<i class="fa-regular fa-lightbulb"></i> // ý tưởng
<i class="fa-solid fa-location-dot"></i> // định vị
<i class="fa-regular fa-paper-plane"></i> // máy bay giấy
<i class="fa-solid fa-paper-plane"></i> // máy bay giấy đặc
<i class="fa-regular fa-user"></i> // người dùng
<i class="fa-regular fa-circle-user"></i> // người dùng tròn
<i class="fa-solid fa-quote-right"></i> // dấu ngoặc kép phải
*/ ?>
<?php include TEMPLATE . LAYOUT ."newsletter.php"; ?>
<?php include TEMPLATE . LAYOUT ."feedback.php"; ?>
<?php if ($criteria) { ?>
    <section class="wrap-criteria py-2 py-lg-4">
        <div class="container">
            <div class="owl-page owl-carousel owl-theme"
                data-items="screen:0|items:1|margin:10,screen:425|items:1|margin:10,screen:575|items:2|margin:20,screen:767|items:3|margin:20,screen:991|items:3|margin:20,screen:1199|items:4|margin:40"
                data-rewind="1" data-autoplay="1" data-loop="0" data-lazyload="0" data-mousedrag="1" data-touchdrag="1"
                data-smartspeed="800" data-autoplayspeed="800" data-autoplaytimeout="5000" data-dots="0" data-animations=""
                data-nav="0" data-navcontainer="">
                <?php foreach ($criteria as $v) { ?>
                    <div class="criteria-item image-rotate" data-aos="fade-up">
                        <p class="image">
                            <img class="w-100 lazy" onerror="this.src='<?= THUMBS ?>/56x56x2/assets/images/noimage.png';" 
                                data-src="<?= $func->addWebpToUrl(THUMBS . '/56x56x2/' . UPLOAD_NEWS_L . $v['photo']); ?>"
                                alt="<?= $v['name' . $lang] ?>" />
                        </p>
                        <div class="info">
                            <h3 class="name text-split"><?= $v['name' . $lang] ?></h3>
                            <p class="desc text-split mb-0"><?= $v['desc' . $lang] ?></p>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </section>
<?php } ?>

<section class="category py-2 py-lg-4">
    <div class="container">
        <div class="title-main">
            <h2>Danh mục sản phẩm</h2>
        </div>
        <div class="row aos-init aos-animate"  data-aos="fade-up" data-aos-duration="1000">
            <?php foreach ($productListMenu as $i => $v) { ?>
                <a class="col-4 col-sm-3 col-lg-2 category-item" href="<?= $v[$sluglang] ?>" data-aos="fade-up">
                    <p class="image"> 
                        <img class=" lazy" onerror="this.src='<?= THUMBS ?>/70x70x1/assets/images/noimage.png';"
                            data-src="<?= $func->addWebpToUrl(THUMBS . '/70x70x2/' . UPLOAD_PRODUCT_L . $v['photo']); ?>"
                            alt="<?= $v['name' . $lang] ?>" />
                    </p>
                    <div class="info">
                        <h3 class="name text-split mb-0"><?= $v['name' . $lang] ?></h3>
                    </div>
                </a>
            <?php } ?>
        </div>
    </div>
</section>

<section class="productHot py-2 py-lg-4">
    <div class="container gradien-pro rounded-lg pb-2 pb-lg-4">
        <div class="text-center mb-lg-4 mb-2">
            <div class="gradient-title d-inline-flex m-auto py-2">
                <div class="title-main text-center m-0">
                    <h2 class="text-white">Sản phẩm nổi bật</h2>
                </div>
            </div>
        </div>
        <div class="owl-page owl-carousel owl-theme"
            data-items="screen:0|items:2|margin:10,screen:425|items:2|margin:10,screen:575|items:3|margin:10,screen:767|items:3|margin:10,screen:991|items:4|margin:10,screen:1199|items:5|margin:10"
            data-rewind="1" data-autoplay="1" data-loop="0" data-lazyload="0" data-mousedrag="1" data-touchdrag="1"
            data-smartspeed="300" data-autoplayspeed="500" data-autoplaytimeout="3500" data-dots="0" data-nav="1"
            data-navcontainer=".control-khuyenmai">
            <?php foreach ($productHot as $k => $v) { ?>
                <div><?php include TEMPLATE . LAYOUT . "blocks/product.php"; ?></div>
            <?php } ?>
        </div>
        <div class="buttons-common text-center m-auto d-flex justify-content-center mt-2 position-relative">
            <a href="san-pham" class="  blob-btn btn py-2 px-5 rounded btn-view-full-content fw-bold">
                <span class="blob-txt">Xem tất cả
                    <i class="fa-solid fa-arrow-right"></i>
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
</section>


<?php if ($productListHot) {
    foreach ($productListHot as $klist => $vlist) {
        $productCats = $d->rawQuery("select name$lang, slugvi, slugen, photo, id from #_product_cat where id_list = ? and find_in_set('noibat',status) and find_in_set('hienthi',status) order by numb,id desc", array($vlist['id']));
        $ajaxKey = uniqid();
        ?>
        <section class="wrap-product-list ">
            <!-- Banner cấp 1 -->
            <?php /*
            <a class="d-block m-auto text-center" href="<?=$vlist[$sluglang]?>" title="<?=$vlist['name'.$lang]?>">
                <img onerror="this.src='<?=THUMBS.'/1440x333x2/assets/images/noimage.png';?>';" src="<?=THUMBS.'/1440x333x1/'.UPLOAD_PRODUCT_L.$vlist['photo']?>" alt="<?=$vlist['name'.$lang]?>">
            </a> */ ?>
            <div class="container py-2 py-lg-3">
                <div class="title-main d-flex flex-wrap align-items-start justify-content-between ">
                    <h2 class="mb-2 mb-lg-0"><?= $vlist['name' . $lang] ?></h2>
                    <div class="d-flex flex-wrap title-sanpham align-items-center gap-1 my-2">
                        <?php if (count($productCats)) { ?>
                            <?php foreach ($productCats as $kcat => $vcat) { ?>
                                <div class="choose-list">
                                    <button class="<?= $kcat == 0 ? 'choosed' : '' ?>" data-ajax="product"
                                        data-ajax-key="<?= $ajaxKey ?>" data-show="row" data-status="" data-paging="0"
                                        data-perpage="<?= $deviceType == 'mobile' ? '6' : '12' ?>" data-list="<?= $vlist['id'] ?>"
                                        data-cat="<?= $vcat['id'] ?>">
                                        <?= $vcat['name' . $lang] ?>
                                    </button>
                                </div>
                            <?php } ?>
                        <?php } else { ?>
                            <!-- NÚT MẶC ĐỊNH KHI KHÔNG CÓ CAT -->
                            <div class="choose-list">
                                <button class="choosed" data-ajax="product" data-ajax-key="<?= $ajaxKey ?>" data-show="row"
                                    data-status="" data-paging="0" data-perpage="<?= $deviceType == 'mobile' ? '6' : '12' ?>"
                                    data-list="<?= $vlist['id'] ?>" data-cat="0">
                                    Tất cả
                                </button>
                            </div>
                        <?php } ?>
                        <a href="<?= $vlist[$sluglang] ?>" class="d-flex align-items-center text-main py-1 px-2">
                            Xem thêm
                        </a>
                    </div>
                </div>
                <div class="show-padding show-padding-product<?= $ajaxKey ?>">

                </div>
            </div>
        </section>
    <?php }
} ?>

<?php
$left = array_slice($visaos, 0, 3);
$right = array_slice($visaos, 3, 3);
?>
<section class="why py-2 py-lg-4">
    <div class="container">
        <div class="title-main text-center mb-4">
            <h2>Lý do tại sao chọn chúng tôi</h2>
        </div>

        <div class="row align-items-center g-4">
            <!-- LEFT -->
            <div class="col-12 col-lg-4 order-2 order-lg-1">
                <?php foreach ($left as $v) { ?>
                    <div class="why-item d-flex align-items-center gap-3 mb-4" data-aos="fade-up">
                        <div class="why-icon flex-shrink-0">
                            <img class="lazy" onerror="this.src='<?= THUMBS ?>/47x47x1/assets/images/noimage.png';"
                                data-src="<?= $func->addWebpToUrl(THUMBS . '/47x47x2/' . UPLOAD_NEWS_L . $v['photo']); ?>"
                                alt="<?= $v['name' . $lang] ?>">
                        </div>
                        <div class="why-info">
                            <div class="why-title fw-semibold"><?= $v['name' . $lang] ?></div>
                            <?php if (!empty($v['desc' . $lang])) { ?>
                                <div class="why-desc text-muted small"><?= $v['desc' . $lang] ?></div>
                            <?php } ?>
                        </div>
                    </div>
                <?php } ?>
            </div>
            <!-- CENTER IMAGE -->
            <div class="col-12 col-lg-4 order-1 order-lg-2 text-center">
                <img class="img-fluid why-center-img" src="<?= UPLOAD_PHOTO_L . $bannervs['photo'] ?>"
                    alt="<?= $bannervs['name' . $lang] ?>">
            </div>
            <!-- RIGHT -->
            <div class="col-12 col-lg-4 order-3 order-lg-3 mt-0">
                <?php foreach ($right as $v) { ?>
                    <div class="why-item d-flex align-items-center gap-3 mb-4" data-aos="fade-up">
                        <div class="why-icon flex-shrink-0">
                            <img class="lazy" onerror="this.src='<?= THUMBS ?>/47x47x1/assets/images/noimage.png';"
                                data-src="<?= $func->addWebpToUrl(THUMBS . '/47x47x2/' . UPLOAD_NEWS_L . $v['photo']); ?>"
                                alt="<?= $v['name' . $lang] ?>">
                        </div>
                        <div class="why-info">
                            <div class="why-title fw-semibold"><?= $v['name' . $lang] ?></div>
                            <?php if (!empty($v['desc' . $lang])) { ?>
                                <div class="why-desc text-muted small"><?= $v['desc' . $lang] ?></div>
                            <?php } ?>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
</section>


<section class="feedback py-2 py-lg-4">
    <div class="container">
        <div class="title-main text-center">
            <h2>Cảm nhận của khác hàng</h2>
        </div>
        <div class="owl-page owl-carousel owl-theme"
            data-items="screen:0|items:1|margin:10,screen:425|items:1|margin:10,screen:575|items:2|margin:20,screen:767|items:3|margin:20,screen:991|items:3|margin:20,screen:1199|items:3|margin:20"
            data-rewind="1" data-autoplay="1" data-loop="0" data-lazyload="0" data-mousedrag="1" data-touchdrag="1"
            data-smartspeed="800" data-autoplayspeed="800" data-autoplaytimeout="5000" data-dots="0" data-animations=""
            data-nav="0" data-navcontainer="">
            <?php foreach ($feedback as $v) { ?>
                <div class="giatri-item bg-gray2  rounded-3 " data-aos="fade-up">
                    <div class="row justify-content-start align-items-center  p-2 p-lg-3">
                        <p class="image rounded-circle mb-0 p-0">
                            <img class="w-100 lazy rounded-circle" onerror="this.src='<?= THUMBS ?>/150x150x1/assets/images/noimage.png';"
                                data-src="<?= $func->addWebpToUrl(THUMBS . '/150x150x1/' . UPLOAD_NEWS_L . $v['photo']); ?>"
                                alt="<?= $v['name' . $lang] ?>" />
                        </p>
                        <div class="info text-start">
                            <h3 class="name text-split"><?= $v['name' . $lang] ?></h3>
                            <p class="subname text-split mb-0"><?= $v['subname' . $lang] ?></p>
                        </div>
                    </div>
                    <p class="desc  mb-0 p-2 p-lg-3"><?= $v['desc' . $lang] ?></p>
                    <img class="w-100 lazy" onerror="this.src='<?= THUMBS ?>/380x204x1/assets/images/noimage.png';"
                        data-src="<?= $func->addWebpToUrl(THUMBS . '/380x204x1/' . UPLOAD_NEWS_L . $v['icon']); ?>"
                        alt="<?= $v['name' . $lang] ?>" />

                </div>
            <?php } ?>
        </div>
    </div>
</section>

<section class="new py-2 py-lg-4">
    <div class="container">
        <div class="title-main text-center">
            <h2>Kiến thức</h2>
        </div>
        <div class="row">
            <?php if (isset($kienthuc) && count($kienthuc) > 0) { ?>
                <?php foreach ($kienthuc as $v) { ?>
                    <div class="col-6 col-sm-6 col-md-4 col-lg-4 mb-3  aos-init aos-animate"  data-aos="fade-right" data-aos-duration="1000">
                        <?php include TEMPLATE . LAYOUT . "blocks/post.php"; ?>
                    </div>
                <?php }
            } ?>
        </div>
        <div class="d-flex justify-content-center">
            <a href="kien-thuc" title="Xem tất cả bài viết"
                class="d-block align-items-center text-white py-2 px-4 bg-main rounded-pill fw-bold pulse2">Xem tất cả
                bài viết <i class="fa-solid fa-angles-right"></i></a>
        </div>
    </div>
</section>
<section class="wrap-hinhanh py-3 py-lg-4 ">
    <div class="container">
        <div class="title-main text-center">
            <h2>Hình ảnh công ty</h2>
        </div>
        <div class="gird-images  aos-init aos-animate"  data-aos="fade-right" data-aos-duration="1000">
            <?php foreach ($hinhanhs as $v) { ?>
                <a class="box-images " href="<?= $v['slug' . $lang] ?>" title="<?= $v['name' . $lang] ?>">
                    <img src="<?= $func->addWebpToUrl(THUMBS . '/600x350x1/' . UPLOAD_PRODUCT_L . $v['photo']); ?>"
                        alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                </a>
            <?php } ?>
        </div>
        <div class="d-flex justify-content-center mt-3 mt-lg-4">
            <a href="thu-vien-anh" title="Xem tất cả hình ảnh" class="btn-main blob-btn btn py-2 px-4 rounded-pill  pulse2">Xem tất cả hình ảnh <i
                    class="fa-solid fa-angles-right"></i></a>
        </div>

    </div>
</section>


<?php if ($doitacs) { ?>
    <section class="wrap-doitac py-3 py-lg-4 mb-3 mb-lg-4">
        <div class="container">
            <div class="title-main text-center">
                <h2>Những đối tác uy tín của chúng tôi</h2>
            </div>
            <div class="d-flex flex-wrap gap-2">
                <?php foreach ($doitacs as $v) { ?>
                    <a class="brand-item" href="<?= $v['link'] ?>" target="_blank" title="<?= $v['name' . $lang] ?>"
                        data-aos="fade-up">
                        <p class="image mb-0 scale-img">
                            <img class="lazy" onerror="this.src='<?= THUMBS ?>/240x120x1/assets/images/noimage.png';"
                                data-src="<?= $func->addWebpToUrl(THUMBS . '/240x120x2/' . UPLOAD_PHOTO_L . $v['photo']); ?>"
                                alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                        </p>
                    </a>
                <?php } ?>
            </div>
        </div>
    </section>
<?php } ?>




<section class="news-faq py-2 py-lg-4">
    <div class="container">
        <div class="title-main text-center">
            <h2>Câu hỏi thường gặp</h2>
            <p>Mọi điều bạn cần biết về chúng tôi HDT</p>
        </div>
        <div class="row d-flex justify-content-between">
            <div class="col-12 col-lg-7 aos-init aos-animate"  data-aos="fade-right" data-aos-duration="1000">
                <div class="accordion" id="faqAccordion">
                    <?php foreach ($faq as $v) { ?>
                        <div class="accordion-item">
                            <h3 class="accordion-header" id="heading<?= $v['id'] ?>">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapse<?= $v['id'] ?>" aria-expanded="false">
                                    <?= $v['name' . $lang] ?>
                                </button>
                            </h3>
                            <div id="collapse<?= $v['id'] ?>" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                <div class="accordion-body"><?= $v['desc' . $lang] ?></div>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            </div>
            <div class="col-12 col-lg-5 aos-init aos-animate"  data-aos="fade-left" data-aos-duration="1000">
                <img class="img-fluid why-center-img" src="<?= UPLOAD_PHOTO_L . $bannerfaq['photo'] ?>"
                    alt="<?= $bannerfaq['name' . $lang] ?>">
            </div>

        </div>
        <div class="row justify-content-center">
            <div class="col-12 mt-2 aos-init aos-animate"  data-aos="fade-up" data-aos-duration="1000">
                <?php if ($about['content' . $lang]) { ?>
                    <div class="content-text" id="noidung">
                        <?= htmlspecialchars_decode($about['content' . $lang]) ?>
                        <div class="hide-content">
                            <div class="buttons-common active">
                                <a href="javascript:;"
                                    class=" active blob-btn btn py-2 px-5 rounded-pill btn-view-full-content"
                                    data-target="#noidung">
                                    <span class="blob-txt">Xem thêm bài viết
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
                <?php } ?>
            </div>
        </div>
    </div>
</section>





<?php /*



<section class="faq-section py-2 py-lg-5">
<div class="container">
<div class="title-main text-center">
<h2><?=cauhoi?> <span><?=thuonggap?></span></h2>
</div>
<div class="accordion position-relative" id="faqAccordion">
<?php foreach ($faq as $v) { ?>
<div class="accordion-item">
<h2 class="accordion-header" id="heading<?=$v['id']?>">
<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<?=$v['id']?>">
<?=$v['name'.$lang]?>
</button>
</h2>
<div id="collapse<?=$v['id']?>" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
<div class="accordion-body">
<?=$v['desc'.$lang]?>
</div>
</div>
</div>
<?php } ?>
<?php if (count($faq) > 7) { ?>
<div class="hide-content" style="background: linear-gradient(transparent, #fff 100%)">
<div class="buttons-common active">
<a href="javascript:;" class="btn-detail blob-btn blob-txt rounded btn-view-full-content pulse2" data-target="#faqAccordion"><span><?=xemthem?></span></a>
</div>
</div>
<?php } ?>
</div>
</div>
</section>
<script>
document.addEventListener("DOMContentLoaded", function() {
const items = document.querySelectorAll(".accordion-item");

items.forEach(item => {
const header = item.querySelector(".accordion-header");
const body = item.querySelector(".accordion-body");

header.addEventListener("click", () => {
const isActive = item.classList.contains("active");
// Đóng tất cả
document.querySelectorAll(".accordion-item").forEach(i => i.classList.remove("active"));
// Nếu chưa mở thì mở
if (!isActive) item.classList.add("active");
});
});
});
</script>


<?php if ($productCatsHot) { if($deviceType == 'mobile') { $showCat = 12; }else{ $showCat = 16; } ?>
<section class="wrap-category mb-3 mb-lg-4">
<div class="container position-relative">
<div class="bg-white rounded p-2 p-lg-3">
<div class="owl-page owl-carousel owl-theme" data-items="screen:0|items:1" data-rewind="1" data-autoplay="0" data-loop="0" data-lazyload="0" data-mousedrag="1" data-touchdrag="1" data-smartspeed="800" data-autoplayspeed="800" data-autoplaytimeout="5000" data-dots="0" data-animations="" data-nav="1" data-navcontainer=".control-category">
<div class="d-flex flex-wrap">
<?php foreach ($productCatsHot as $k => $v) { ?>
<a class="category-item" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>">
<p class="image scale-img">
<img onerror="this.src='<?= THUMBS ?>/100x100x1/assets/images/noimage.png';" src="<?= THUMBS ?>/100x100x2/<?= UPLOAD_PRODUCT_L . $v['photo'] ?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
</p>
<h2 class="name text-split text-split-1 mb-0"><?= $v['name' . $lang] ?></h2>
</a>
<?php if (($k+1)%$showCat == 0 && ($k+1) < count($productCatsHot)) { echo '</div><div class="d-flex flex-wrap">';} ?>
<?php } ?>
</div>
</div>
<?php if (count($productCatsHot) > $showCat) { ?>
<div class="control-category control-owl transition"></div>
<?php } ?>
</div>
</div>
</section>
<?php } ?>

<?php if( !$func->isGoogleSpeed() ) { ?>

<?php include TEMPLATE . LAYOUT . "spdaxem.php"; ?>

<?php if($productSales) { $isLazy = true; $classes=""; ?>
<section class="wrap-product mb-3 mb-lg-4">
<div class="container">
<div class="bg-white rounded p-3">
<div class="title-main d-block d-md-flex align-items-start justify-content-between">
<h2 class="d-flex align-items-center">
<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="#ffd83b" class="bi bi-lightning-charge-fill" viewBox="0 0 16 16">
<path d="M11.251.068a.5.5 0 0 1 .227.58L9.677 6.5H13a.5.5 0 0 1 .364.843l-8 8.5a.5.5 0 0 1-.842-.49L6.323 9.5H3a.5.5 0 0 1-.364-.843l8-8.5a.5.5 0 0 1 .615-.09z"/>
</svg>
<span style="color: #f00">GIẢM GIÁ SỐC</span>
</h2>
<a href="giam-gia-soc" class="d-none d-md-flex align-items-center text-main">
Xem thêm
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" style="margin-top: -2px;" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
<path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708"/>
<path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708"/>
</svg>
</a>
</div>
<div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5">
<?php foreach ($productSales as $k => $v) { ?>
<div class="col d-flex mb-3">
<?php include TEMPLATE . LAYOUT . "blocks/product.php"; ?>
</div>
<?php } ?>
</div>
</div>
</div>
</section>
<?php } ?>



<?php if ($brandIndex) { ?>
<section class="wrap-brand mb-3 mb-lg-4">
<div class="container">
<div class="title-main">
<h2>Thương hiệu</h2>
</div>
<div class="d-flex flex-wrap gap-2">
<?php foreach ($brandIndex as $v) { ?>
<a class="brand-item" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>" data-aos="fade-up">
<p class="image mb-0 scale-img">
<img class="lazy" onerror="this.src='<?= THUMBS ?>/240x120x1/assets/images/noimage.png';" data-src="<?= THUMBS ?>/240x120x1/<?= UPLOAD_PRODUCT_L . $v['photo'] ?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
</p>
</a>
<?php } ?>
</div>
</div>
</section>
<?php } ?>

<?php if ($news) { ?>
<section class="wrap-news">
<div class="container">
<div class="title-main">
<h2>Tiện ích dành cho bạn</h2>
</div>
<div class="row">
<div class="col-12 col-lg-5">
<a class="news-index" href="<?= $news[0][$sluglang] ?>" title="<?= $news[0]['name' . $lang] ?>" data-aos="fade-up">
<p class="image scale-img mb-0">
<img class="lazy" data-src="<?= THUMBS ?>/<?=$deviceType == 'mobile' ? '500x225x1' : '517x297x1'?>/<?= UPLOAD_NEWS_L . $news[0]['photo'] ?>" alt="<?= $news[0]['name' . $lang] ?>" title="<?= $news[0]['name' . $lang] ?>" />
</p>
<h2 class="name mb-0" style="font-size: 18px"><?= $news[0]['name' . $lang] ?></h2>
</a>
</div>
<div class="col-12 col-lg-7">
<div class="row">
<?php foreach ($news as $k => $v) { if($k == 0 || $k > 6) continue; ?>
<div class="col-6 col-md-4">
<a class="news-index" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>" data-aos="fade-up">
<p class="image scale-img mb-0">
<img class="lazy" onerror="this.src='<?= THUMBS ?>/233x140x1/assets/images/noimage.png';" data-src="<?= THUMBS ?>/233x140x1/<?= UPLOAD_NEWS_L . $v['photo'] ?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
</p>
<h2 class="name mb-0"><span class="text-split text-split-2"><?= $v['name' . $lang] ?></span></h2>
</a>
</div>
<?php } ?>
</div>
</div>
</div>
</div>
</section>
<?php } ?>

<section class="wrap-cauhoi mb-3">
<div class="container">
<?php if ($news) { ?>
<div class="title-main">
<h2>Mọi người tìm kiếm nhiều</h2>
</div>
<div class="mb-3">
<?php foreach ($tagsProduct as $v) { ?>
<a class="btn-main gray text-sm px-2 py-2 rounded-pill me-1 mb-2" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>">
<?= $v['name' . $lang] ?>
</a>
<?php } ?>
</div>
<?php } ?>

<div class="row justify-content-center">
<div class="col-12">
<?php if($about['desc' . $lang]) { ?>
<div class="content-text" id="noidung">
<?=htmlspecialchars_decode($about['desc'.$lang])?>
<div class="hide-content">
<div class="buttons-common active">
<a href="javascript:;" class=" active blob-btn btn py-2 px-5 rounded btn-view-full-content" data-target="#noidung">
<span class="blob-txt">Xem thêm
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down" viewBox="0 0 16 16">
<path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1"/>
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
<?php } ?>
</div>
</div>
</div>
</section>
<?php } ?>
*/ ?>