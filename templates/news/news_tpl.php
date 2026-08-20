<?php if($tags_detail){ ?>
<div class="container bg pt-4 pt-lg-5 mb-4 mb-lg-5">
    <div class="row align-items-center justify-content-center">
        <div class="col-12 col-lg-5">
            <h4 class="author-title"><?="Tác giả tại " . $setting['name' . $lang]?></h4>
            <h2 class="author-name"><?= $tags_detail['name' . $lang] ?></h2>
            <div class="author-subname"><?= $tags_detail['subname' . $lang] ?></div>
            <div><?= $func->decodeHtmlChars($tags_detail['desc' . $lang]) ?></div>
        </div>
        <div class="col-12 col-lg-auto">
            <img class="lazy" data-src="<?= UPLOAD_TAGS_L . $tags_detail['photo'] ?>" style="max-height: 450px" alt="<?= $tags_detail['name' . $lang] ?>" title="<?= $tags_detail['name' . $lang] ?>" />
        </div>
    </div>
</div>
<div class="container mb-4 mb-lg-5">
    <?php if($tags_detail['content'.$lang]){ ?>
    <div class="content-text" id="noidung" style="max-height: 250px;">
        <?=$func->decodeHtmlChars($tags_detail['content'.$lang])?>
        <div class="hide-content">
            <div class="buttons-common">
                <a href="javascript:;" class="blob-btn btn rounded-pill py-2 px-5 btn-view-full-content" data-target="#noidung">
                    <span class="blob-txt text-uppercase">Xem thêm
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
<?php } ?>
<div class="container">
    <?php if (isset($lists) && count($lists) > 0) { ?>
    <?php foreach ($lists as $k => $v) { ?>
    <div class="row d-fex align-items-center list-item">
        <div class="col-12 col-lg-7">
            <div class="title-main mb-0 mb-lg-2">
                <div class="title">
                    <a class="d-block mb-2 text-split" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>"><span><?= $v['name' . $lang] ?></span></a>
                </div>
            </div>
            <div class="desc text-split mb-2"><?= $func->decodeHtmlChars($v['desc' . $lang]) ?></div>
            <div class="readmore"><a href="<?= $v[$sluglang] ?>" class="btn btn-main py-2 px-5" title="<?= $v['name' . $lang] ?>"> <?=xemthem?> <i class="bi bi-arrow-right"></i> </a></div>
        </div>
        <div class="col-12 col-lg-5">
            <p class="image w-100 rounded overflow-hidden">
                <a class="scale-img" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>">
                    <img class="lazy w-100 rounded-lg" onerror="this.src='<?= THUMBS ?>/600x360x1/assets/images/noimage.png';" data-src="<?= $func->addWebpToUrl(THUMBS.'/600x360x1/'.UPLOAD_NEWS_L.$v['photo']);?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                </a>
            </p>
        </div>
    </div>
    <?php } } ?>
    <div class="row">
        <div class="col-12 col-lg-9 mb-3 mb-lg-4">
            <div class="title-main title-main-detail"><div class="title"><?= (!empty($titleCate)) ? $titleCate : @$titleMain ?></div></div>
            <div class="row">
                <?php if (isset($news) && count($news) > 0) { ?>
                    <?php foreach ($news as $k => $v) { ?>
                        <div class="col-6 col-sm-6 col-md-4 d-flex mb-3" data-aos="fade-up" data-aos-duration="1000">
                        <?php include TEMPLATE . LAYOUT . "blocks/post.php"; ?>
                        </div>
                    <?php } ?>
                <?php } else { ?>
                    <?php if(!$contentCate) { ?>
                    <div class="col-12">
                        <div class="alert alert-warning w-100" role="alert">
                            <strong><?= khongtimthayketqua ?></strong>
                        </div>
                    </div>
                    <?php } ?>
                <?php } ?>
                <div class="col-12 d-none">
                    <div class="pagination-home w-100"><?= (!empty($paging)) ? $paging : '' ?></div>
                </div>
            </div>
            <?php if($contentCate) { ?>
            <div class="content-main content-text"><?= htmlspecialchars_decode($contentCate) ?></div>
            <?php } ?>
        </div>
        <div class="col-12 col-lg-3 mb-3 mb-lg-4">
            <div class="sidebar">
                <div class="row">
                    <?php foreach ($banners as $v) { ?>
                    <div class="col-6 col-sm-4 col-lg-12 mb-3">
                        <a class="d-block" href="<?= $v['link'] ?>" target="_blank" title="<?= $v['name' . $lang] ?>">
                            <img class="lazy rounded-lg w-100" onerror="this.src='<?= THUMBS ?>/500x0x1/assets/images/noimage.png';" data-src="<?= UPLOAD_PHOTO_L . $v['photo'] ?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                        </a>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>