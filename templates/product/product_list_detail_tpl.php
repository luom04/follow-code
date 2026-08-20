<div class="container">
    <div class="row">
        <div class="col-12 col-lg-9 mb-4">
            <div class="title-main">
                <h2><?=$productList['name' . $lang]?></h2>
                <span class="underline"></span>
            </div>
            <?php if (!empty($productList['content' . $lang])) { ?>
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
                <div class="content-main content-text" id="toc-content"><?= htmlspecialchars_decode($productList['content' . $lang]) ?></div>
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
        </div>
        <div class="col-12 col-lg-3 mb-4">
            <div class="sidebar" <?=$source !='index' ? 'style="margin-top: 0px"' : ''?>>
                <div class="widget other mb-4">
                    <div class="widget-title">
                        Loại xe khác
                    </div>
                    <div class="widget-content">
                        <ul class="widget-ul">
                        <?php foreach ($productListMenu as $k => $v) { if( $v['id'] != $productList['id'] ) { ?>
                            <li>
                                <a href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>" class="news-other d-flex flex-wrap align-items-center">
                                    <div class="position-relative scale-img pic-news-other">
                                        <img class="lazy w-100" data-src="<?= $func->addWebpToUrl(THUMBS.'/280x200x1/'.UPLOAD_PRODUCT_L.$v['photo']);?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
                                    </div>
                                    <div class="info-news-other">
                                        <h3 class="name-news-other text-split"><?= $v['name' . $lang] ?></h3>
                                        <div class="desc-news-other text-split"><?= $v['desc' . $lang] ?></div>
                                    </div>
                                </a>
                            </li>
                        <?php } } ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>