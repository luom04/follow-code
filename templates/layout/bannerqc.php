<?php if($bannerqc){ ?>
<div class="position-relative">
    <img class="w-100" src="<?=($type == 'san-pham' ? UPLOAD_PRODUCT_L : ($type == 'chuyen-khoa' ? UPLOAD_NEWS_L : UPLOAD_PHOTO_L)) . $bannerqc['photo']?>" alt="" width="1920" height="450">
</div>
<?php } ?>