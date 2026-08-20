<?php if ($slider) { ?>
<div class="slideshow">
    <div class="container-1920">
        <div class="slider">
            <div class="slbannerhh">
                <?php foreach ($slider as $v) { ?>
                    <?php if($v['link_video']){ ?>
                    <div class="item">
                        <div class="banvdimg">
                            <video class="ssvideo" muted="" playsinline="" poster="<?= UPLOAD_PHOTO_L . $v['link_video'] ?>" ><source src="<?= UPLOAD_PHOTO_L . $v['link_video'] ?>" type="video/mp4"></video>
                        </div>
                    </div>
                    <?php }else{ ?>
                    <div class="item">
                        <a class="slideshow-image" href="<?= $v['link'] ?>" target="_blank" title="<?= $v['name' . $lang] ?>">
                            <picture>
                                <img class="w-100 lazy" onerror="this.src='<?= THUMBS ?>/1920x1050x1/assets/images/noimage.png';"  data-src="<?= $func->addWebpToUrl(THUMBS.'/1920x1050x1/'.UPLOAD_PHOTO_L.$v['photo']);?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>"   width="1920" height="1050"   />
                            </picture>
                        </a>
                    </div>
                    <?php } ?>
                <?php } ?>
            </div>
        </div>
        <?php /*
        <div class="banner d-none d-md-block">
            <?php foreach ($bannerBottom as $v) { ?>
            <a class="banner-item" href="<?= $v['link'] ?>" target="_blank" title="<?= $v['name' . $lang] ?>">
                <img class="lazy" onerror="this.src='<?= THUMBS ?>/465x145x1/assets/images/noimage.png';" data-src="<?= THUMBS ?>/465x145x1/<?= UPLOAD_PHOTO_L . $v['photo'] ?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
            </a>
            <?php } ?>
        </div>*/ ?>
    </div>
</div>
<?php } ?>