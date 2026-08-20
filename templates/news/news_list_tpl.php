<div class="container">
    <div class="row flex-column-reverse flex-lg-row">
        <div class="col-12 col-lg-3 mb-4">
            <?php include TEMPLATE . LAYOUT . "sidebar.php"; ?>
        </div>
        <div class="col-12 col-lg-9 mb-4">
            <div class="title-main text-center"><div class="title"><?= (!empty($titleCate)) ? $titleCate : @$titleMain ?></div></div>
            <div class="title-submain text-center"><?=$optsetting['subtitle']?></div>
            <div class="wrap-service-list">
                <div class="service-lists">
                    <div class="row justify-content-center">
                    <?php foreach ($newsListMenuService as $k => $v) { ?>
                        <div class="col-6 col-sm-6 col-md-4 mb-2" data-aos="fade-up">
                            <a class="service-list" title="<?= $v['name' . $lang] ?>" href="<?= $v[$sluglang] ?>">
                                <img class="w-100 lazy" data-src="<?= $func->addWebpToUrl(THUMBS.'/560x320x1/'.UPLOAD_NEWS_L.$v['photo']);?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                                <h2 class="name"><?=$v['name'.$lang]?></h2>
                                <div class="info">
                                    <h3><?= $v['name' . $lang] ?></h3>
                                </div>
                            </a>
                        </div>
                    <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>