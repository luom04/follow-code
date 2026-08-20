<div class="container">
    <div class="row flex-column-reverse flex-lg-row">
        <?php /*
        <div class="col-12 col-lg-3 mb-4">
            <?php include TEMPLATE . LAYOUT . "sidebar.php"; ?>
        </div> */ ?>
        <div class="col-12 col-lg-12 mb-lg-4">
            <div class="title-submain text-center"><?=$optsetting['subtitle']?></div>
            <div class="title-main text-center"><h2><?=$rowDetail['name' . $lang]?></h2></div>
            <div class="time-main">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-check-fill" viewBox="0 0 16 16">
                    <path d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4zM16 14V5H0v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2m-5.146-5.146-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708.708"/>
                </svg>
                <span class="mx-2"><?= date("d/m/Y h:i A", $rowDetail['date_created']) ?></span>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill me-2" viewBox="0 0 16 16">
                    <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                    <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                </svg>
                <?= $rowDetail['view'] ?> <?= luotxem ?>
            </div>
            <?php if (!empty($rowDetail['content' . $lang])) { ?>
                <div class="meta-toc">
                    <div class="wrap-toc">
                        <div class="toc-head">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" x="0" y="0" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="M464.883 64.267H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.013-21.136-47.149-47.116-47.149zM47.134 64.267C21.145 64.267 0 85.411 0 111.4s21.145 47.133 47.134 47.133 47.133-21.144 47.133-47.133-21.144-47.133-47.133-47.133zM47.134 208.867C21.145 208.867 0 230.011 0 256s21.145 47.133 47.134 47.133S94.267 281.989 94.267 256s-21.144-47.133-47.133-47.133zM47.134 353.467C21.145 353.467 0 374.611 0 400.6s21.145 47.133 47.134 47.133 47.133-21.144 47.133-47.133-21.144-47.133-47.133-47.133zM464.883 208.867H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.013-21.136-47.149-47.116-47.149zM464.883 353.467H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.012-21.136-47.149-47.116-47.149z" opacity="1" class=""></path></g></svg>
                            Mục lục
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill ms-auto cursor-pointer" viewBox="0 0 16 16">
                                <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
                            </svg>
                        </div>
                        <ul class="toc-list" data-toc-headings="h1, h2, h3"></ul>
                    </div>
                </div>
                <div class="meta-toc-fixed">
                    <a class="menu-dropdown-button">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" x="0" y="0" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="M464.883 64.267H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.013-21.136-47.149-47.116-47.149zM47.134 64.267C21.145 64.267 0 85.411 0 111.4s21.145 47.133 47.134 47.133 47.133-21.144 47.133-47.133-21.144-47.133-47.133-47.133zM47.134 208.867C21.145 208.867 0 230.011 0 256s21.145 47.133 47.134 47.133S94.267 281.989 94.267 256s-21.144-47.133-47.133-47.133zM47.134 353.467C21.145 353.467 0 374.611 0 400.6s21.145 47.133 47.134 47.133 47.133-21.144 47.133-47.133-21.144-47.133-47.133-47.133zM464.883 208.867H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.013-21.136-47.149-47.116-47.149zM464.883 353.467H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.012-21.136-47.149-47.116-47.149z" opacity="1" class=""></path></g></svg>
                    </a>
                </div>
                <div class="content-main content-text" id="toc-content"><?= htmlspecialchars_decode($rowDetail['content' . $lang]) ?></div>
                <div class="share mb-4">
                    <b><?= chiase ?></b>
                    <div class="social-plugin">
                        <?php
                        $params = array();
                        $params['oaid'] = $optsetting['oaidzalo'];
                        echo $func->markdown('social/share', $params);
                        ?>
                    </div>
                </div>
            <?php } else { ?>
                <div class="alert alert-warning w-100 mb-4" role="alert">
                    <strong><?= noidungdangcapnhat ?></strong>
                </div>
            <?php } ?>
            <div class="title-submain text-center"><?=$optsetting['subtitle']?></div>
            <div class="title-main text-center"><h2><?=$titleMain . ' khác'?></h2></div>
            <div class="row">
                <?php if (isset($news) && count($news) > 0) { ?>
                    <?php foreach ($news as $k => $v) { ?>
                        <div class="col-4">
                            <?php include TEMPLATE . LAYOUT . "blocks/post.php"; ?>
                        </div>
                    <?php } ?>
                <?php } else { ?>
                    <div class="col-12">
                        <div class="alert alert-warning w-100" role="alert">
                            <strong><?= khongtimthayketqua ?></strong>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
</div>