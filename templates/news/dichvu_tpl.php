
<div class="container py-2 py-lg-5">
    <div class="row">
        <div class="col-12 col-lg-12 mb-lg-4">
            <div class="title-main text-center text-uppercase"><div class="title"><?= (!empty($titleCate)) ? $titleCate : @$titleMain ?></div></div>
            <div class="loading-news">
                <div class="row">
                    <?php if (isset($news) && count($news) > 0) { ?>
                        <?php foreach ($news as $v) { ?>
                            <div class="col-6 col-sm-6 col-md-4 col-lg-4 mb-3">
                                <?php include TEMPLATE . LAYOUT . "blocks/dichvu.php"; ?>
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
                    <?php }  ?>
                    
                    <div class="col-12">
                        <div class="pagination-home w-100 d-none"><?= (!empty($paging)) ? $paging : '' ?></div>
                    </div>
                </div>
            </div>
            <input type="hidden" id="news-list" value="<?= $idl?>">
            <input type="hidden" id="news-offset" value="8">
            <input type="hidden" id="news-limit" value="8">
            <input type="hidden" id="news-total" value="<?= $total ?>">
            <input type="hidden" id="news-type" value="<?= $type ?>">
            <?php if ($total > 8) { ?>
            <div class="d-flex justify-content-center mt-3">
                <a href="javascript:void(0)" class="news-load-more btn-main px-3 py-2 rounded-3">
                    Xem thêm <span id="news-remaining" class="px-1"> <?= $total - 8 ?> </span> <h2><?= (!empty($titleCate)) ? $titleCate : @$titleMain ?></h2>
                </a>
            </div>
            <?php } ?>
            <?php if($contentCate) { ?>
            <div class="position-relative">
                <div class="content-text" id="noidung">
                    <?= $func->decodeHtmlChars($contentCate) ?>
                    <div class="hide-content">
                        <div class="buttons-common active">
                            <a href="javascript:;" class="blob-btn active btn py-2 px-5 btn-view-full-content" data-target="#noidung">
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
            </div>
            <?php } ?>
        </div>
    </div>
</div>