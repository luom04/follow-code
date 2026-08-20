<div class="container">
    <div class="row flex-column-reverse flex-lg-row">
        <?php /*
        <div class="col-3 mb-4">
            <?php include TEMPLATE . LAYOUT . "sidebar.php"; ?>
        </div>*/ ?>
        <div class="col-12 mb-4">
            <div class="title-main-detail has-line text-center"><h2><?= $titleMain ?></h2></div>

            <?php if (!empty($showrooms)) { ?>
            <div class="row">
                <?php foreach ($showrooms as $k => $v) { ?>
                    <div class="col-6 col-sm-4 col-lg-3 mb-4">
                        <div data-aos="fade-up" data-aos-duration="1000">
                            <a class="d-block" data-fancybox="gallery" href="<?= ASSET . UPLOAD_PHOTO_L . $v['photo'] ?>" data-caption="" title="<?= $v['name' . $lang] ?>">
                                <img class="w-100" onerror="this.src='<?= THUMBS ?>/500x400x1/assets/images/noimage.png';" src="<?= $func->addWebpToUrl(THUMBS.'/500x400x2/'.UPLOAD_PHOTO_L.$v['photo']);?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                            </a>
                        </div>
                    </div>
                <?php } ?>
            </div>
                
            <?php } else { ?>
            <div class="alert alert-warning w-100" role="alert">
                <strong><?= dangcapnhatdulieu ?></strong>
            </div>
            <?php } ?>
        </div>
    </div>
</div>