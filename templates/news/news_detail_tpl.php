<div class="container">
    <div class="row mb-3">
        <div class="col-12 <?= $banners ? 'col-lg-9' : 'col-lg-12' ?>">
            <div class="title-main">
                <div class="title"><?= $rowDetail['name' . $lang] ?></div>
            </div>
            <div class="time-main">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#ffcb0f"
                    class="bi bi-eye-fill me-2" viewBox="0 0 16 16">
                    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
                    <path
                        d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
                </svg>
                <span class="d-block mx-2 text-sm"><?= $rowDetail['view'] ?> <?= luotxem ?></span>
                <?php if ($type == 'tin-tuc') { ?>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#ffcb0f"
                        class="bi bi-calendar2-week" viewBox="0 0 16 16">
                        <path
                            d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1z" />
                        <path
                            d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5zM11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5z" />
                    </svg>
                    <span class="d-block mx-2 text-sm">Ngày đăng:
                        <?= date("d/m/Y h:i A", $rowDetail['date_created']) ?></span>

                <?php } ?>
                <?php if (!empty($rowDetail['file_attach'])) { ?>
                    <a href="upload/file/<?= $rowDetail['file_attach'] ?>" target="_blank"
                        class="btn-main outline rounded-pill py-2 px-4 btn-view-full-content blob-txt font-weight-semibold">Xem
                        hồ sơ năng lực <i class="fa-solid fa-download ms-2"></i></a>
                <?php } ?>
            </div>


            <?php if (!empty($rowDetail['content' . $lang])) { ?>
                <div class="meta-toc">
                    <div class="wrap-toc">
                        <div class="toc-head">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" x="0" y="0" viewBox="0 0 512 512"
                                style="enable-background:new 0 0 512 512" xml:space="preserve" class="">
                                <g>
                                    <path
                                        d="M464.883 64.267H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.013-21.136-47.149-47.116-47.149zM47.134 64.267C21.145 64.267 0 85.411 0 111.4s21.145 47.133 47.134 47.133 47.133-21.144 47.133-47.133-21.144-47.133-47.133-47.133zM47.134 208.867C21.145 208.867 0 230.011 0 256s21.145 47.133 47.134 47.133S94.267 281.989 94.267 256s-21.144-47.133-47.133-47.133zM47.134 353.467C21.145 353.467 0 374.611 0 400.6s21.145 47.133 47.134 47.133 47.133-21.144 47.133-47.133-21.144-47.133-47.133-47.133zM464.883 208.867H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.013-21.136-47.149-47.116-47.149zM464.883 353.467H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.012-21.136-47.149-47.116-47.149z"
                                        opacity="1" class=""></path>
                                </g>
                            </svg>
                            Mục lục
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-caret-down-fill ms-auto cursor-pointer" viewBox="0 0 16 16">
                                <path
                                    d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z" />
                            </svg>
                        </div>
                        <ul class="toc-list" data-toc-headings="h1, h2, h3"></ul>
                    </div>
                </div>
                <div class="meta-toc-fixed">
                    <a class="menu-dropdown-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" x="0" y="0" viewBox="0 0 512 512"
                            style="enable-background:new 0 0 512 512" xml:space="preserve" class="">
                            <g>
                                <path
                                    d="M464.883 64.267H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.013-21.136-47.149-47.116-47.149zM47.134 64.267C21.145 64.267 0 85.411 0 111.4s21.145 47.133 47.134 47.133 47.133-21.144 47.133-47.133-21.144-47.133-47.133-47.133zM47.134 208.867C21.145 208.867 0 230.011 0 256s21.145 47.133 47.134 47.133S94.267 281.989 94.267 256s-21.144-47.133-47.133-47.133zM47.134 353.467C21.145 353.467 0 374.611 0 400.6s21.145 47.133 47.134 47.133 47.133-21.144 47.133-47.133-21.144-47.133-47.133-47.133zM464.883 208.867H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.013-21.136-47.149-47.116-47.149zM464.883 353.467H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.012-21.136-47.149-47.116-47.149z"
                                    opacity="1" class=""></path>
                            </g>
                        </svg>
                    </a>
                </div>
                <div class="content-main content-text" id="toc-content">
                    <?= htmlspecialchars_decode($rowDetail['content' . $lang]) ?>
                </div>
            <?php } else { ?>
                <div class="alert alert-warning w-100 mb-4" role="alert">
                    <strong><?= noidungdangcapnhat ?></strong>
                </div>
            <?php } ?>
            <?php if ($rowTags) {
                foreach ($rowTags as $k => $v) { ?>
                    <hr>
                    <div class="author-item d-flex justify-content-between mb-3">
                        <div class="image overflow-hidden">
                            <a class="scale-img d-block rounded-pill mb-2" href="<?= $v[$sluglang] ?>"
                                title="<?= $v['name' . $lang] ?>">
                                <img class="lazy w-100 rounded-pill"
                                    onerror="this.src='<?= THUMBS ?>/300x300x1/assets/images/noimage.png';"
                                    data-src="<?= $func->addWebpToUrl(THUMBS . '/300x300x1/' . UPLOAD_TAGS_L . $v['photo']); ?>"
                                    alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                            </a>
                            <p class="readmore text-center"><a href="<?= $v[$sluglang] ?>" class="btn btn-main"
                                    title="<?= $v['name' . $lang] ?>"> <?= "Đọc tiểu sử" ?> </a></p>
                        </div>
                        <div class="info">
                            <h3 class="name">
                                <a class="text-split text-decoration-none" href="<?= $v[$sluglang] ?>"
                                    title="<?= $v['name' . $lang] ?>"><?= $v['name' . $lang] ?></a>
                            </h3>
                            <h6 class="subname"><?= $v['subname' . $lang] ?></h6>
                            <p class="desc"><?= $v['desc' . $lang] ?></p>
                        </div>
                    </div>
                <?php }
            } ?>
            <?php if (!empty($rowDetail['iframe'])) { ?>
                <hr>
                <div class="contact-map">
                    <?= htmlspecialchars_decode($rowDetail['iframe']) ?>
                </div>

            <?php } ?>
        </div>
        <?php if (!empty($banners)) { ?>
        <div class="col-12 col-lg-3">
            <div class="sidebar">
                <div class="row">
                    <?php foreach ($banners as $v) { ?>
                        <div class="col-6 col-sm-4 col-lg-12 mb-3" data-aos="fade-up" data-aos-duration="1000">
                            <a class="d-block" href="<?= $v['link'] ?>" target="_blank" title="<?= $v['name' . $lang] ?>">
                                <img class="lazy rounded-lg w-100"
                                    onerror="this.src='<?= THUMBS ?>/500x0x1/assets/images/noimage.png';"
                                    data-src="<?= THUMBS ?>/500x0x1/<?= UPLOAD_PHOTO_L . $v['photo'] ?>"
                                    alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                            </a>
                        </div>
                    <?php } ?>
                </div>
            </div>
        </div>
        <?php } ?>
    </div>
    <?php if (count($news) && $type != 'chinh-sach') { ?>
        <div class="title-main-detail text-uppercase text-center">
            <h2>Các <?= $titleMain ?> khác</h2>
        </div>
        <div class="row">
            <?php foreach ($news as $k => $v) { ?>
                <div class="col-6 col-md-4 col-lg-3 d-fex mb-3">
                    <?php include TEMPLATE . LAYOUT . "blocks/post.php"; ?>
                </div>
            <?php } ?>
        </div>
    <?php } ?>
</div>