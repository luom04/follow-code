<div class="footer">
    <div class="footer-article py-3 py-lg-4">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-12 col-lg-4 mb-2 mb-lg-0">
                    <a class="logo peShiner" href="<?= $configBase ?>">
                        <img onerror="this.src='<?= THUMBS ?>/105x42x1/assets/images/noimage.png';"
                            src="<?= $func->addWebpToUrl(UPLOAD_PHOTO_L . $logofooter['photo']); ?>"
                            alt="<?= $setting['name' . $lang] ?>" title="<?= $setting['name' . $lang] ?>" width="105" height="42" />
                    </a>
                    <p class="footer-title"><?= $footer['name' . $lang] ?></p>
                    <div><?= htmlspecialchars_decode($footer['content' . $lang]) ?></div>
                    <p class="footer-title "><?= mangxahoi ?></p>
                    <div class="footer-social">
                        <?php foreach ($social as $k => $v) { ?>
                            <a href="<?= $v['link'] ?>" title="<?= $v['name' . $lang] ?>" target="_blank">
                                <img onerror="this.src='<?= THUMBS ?>/25x0x1/assets/images/noimage.png';"
                                    src="<?= $func->addWebpToUrl(UPLOAD_PHOTO_L . $v['photo']); ?>"
                                    alt="<?= $v['name' . $lang] ?>" width="25" height="25" />
                            </a>
                        <?php } ?>
                    </div>
                </div>
                <div class="col-12 col-lg-8">
                    <div class="row">
                        <div class="col-12 col-md-6 col-lg-4 mb-2 mb-lg-0">
                            <p class="footer-title">Truy cập nhanh</p>
                            <ul class="footer-ul">
                                <li><a href="gioi-thieu" title="Giới thiệu">Giới thiệu</a></li>
                                <li><a href="thuong-hieu" title="Thương hiệu">Thương hiệu</a></li>
                                <li><a href="catalogue" title="Catalogue">Catalogue</a></li>
                                <li><a href="tai-lieu-ky-thuat" title="Tài liệu kỹ thuật">Tài liệu kỹ thuật</a></li>
                                <li><a href="kien-thuc" title="Kiến thức">Kiến thức</a></li>
                                <li><a href="lien-he" onclick="countClick('contact')" title="Liên hệ">Liên hệ</a></li>
                            </ul>
                        </div>
                        <div class="col-12 col-md-6 col-lg-4 mb-2 mb-lg-0">
                            <p class="footer-title"><?= chinhsach ?></p>
                            <ul class="footer-ul">
                                <?php foreach ($chinhsach as $k => $v) { ?>
                                    <li><a href="<?= $v[$sluglang] ?>"
                                            title="<?= $v['name' . $lang] ?>"><?= $v['name' . $lang] ?></a></li>
                                <?php } ?>
                            </ul>
                            <div class="footer-chungchi ms-0 ms-lg-5">
                                <?php foreach ($logo_chungchi as $k => $v) { ?>
                                    <a href="<?= $v['link'] ?>" title="<?= $v['name' . $lang] ?>" target="_blank">
                                        <img onerror="this.src='<?= THUMBS ?>/80x0x1/assets/images/noimage.png';"
                                            src="<?= $func->addWebpToUrl(UPLOAD_PHOTO_L . $v['photo']); ?>"
                                            alt="<?= $v['name' . $lang] ?>" width="80" height="80" />
                                    </a>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="col-12 col-md-6 col-lg-4 mb-2 mb-lg-0">
                            <p class="footer-title">Hỗ trợ khách hàng</p>
                            <div class="row">
                                <?php foreach ($hochokhachhang as $k => $v) { ?>
                                    <div class="col-6 text-center p-2">
                                        <div class="images mb-2">
                                            <img onerror="this.src='<?= THUMBS ?>/115x115x1/assets/images/noimage.png';"
                                                src="<?= $func->addWebpToUrl(UPLOAD_NEWS_L . $v['icon']); ?>"
                                                alt="<?= $v['name' . $lang] ?>" width="115" height="115" />
                                        </div>
                                        <div class="info">
                                            <h4 class="name fw-bold text-main mb-1"><?= $v['name' . $lang] ?></h4>
                                            <p><i class="fa-solid text-main fa-phone"></i> <?= $v['subname' . $lang] ?></p>
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-powered py-1">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="footer-copyright col-md-auto"><?= htmlspecialchars_decode($copyright['name' . $lang]) ?>. <a
                        target="_blank"><?= thietkewebmima ?></a></div>
                <div class="footer-statistic col-md-auto">
                    <?= dangonline ?>: <b><?= $online ?></b>
                    <span>|</span>
                    <?= homnay ?>: <b><?= $counter['today'] ?></b>
                    <span>|</span>
                    <?= tongtruycap ?>: <b><?= $counter['total'] ?></b>
                </div>
            </div>
        </div>
    </div>
    <div class="container py-2">
        <div><?= htmlspecialchars_decode($footer['desc' . $lang]) ?></div>
    </div>
</div>

<?php if (false && $com != 'gio-hang' && $config['order']['active']) { ?>
    <a class="cart-fixed text-decoration-none" href="gio-hang" title="Giỏ hàng" onclick="countClick('order')">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-handbag"
            viewBox="0 0 16 16">
            <path
                d="M8 1a2 2 0 0 1 2 2v2H6V3a2 2 0 0 1 2-2m3 4V3a3 3 0 1 0-6 0v2H3.36a1.5 1.5 0 0 0-1.483 1.277L.85 13.13A2.5 2.5 0 0 0 3.322 16h9.355a2.5 2.5 0 0 0 2.473-2.87l-1.028-6.853A1.5 1.5 0 0 0 12.64 5zm-1 1v1.5a.5.5 0 0 0 1 0V6h1.639a.5.5 0 0 1 .494.426l1.028 6.851A1.5 1.5 0 0 1 12.678 15H3.322a1.5 1.5 0 0 1-1.483-1.723l1.028-6.851A.5.5 0 0 1 3.36 6H5v1.5a.5.5 0 1 0 1 0V6z">
            </path>
        </svg>
        <span class="count-cart"><?= (!empty($_SESSION['cart'])) ? count($_SESSION['cart']) : 0 ?></span>
    </a>
<?php } ?>


<div class="wrap-frame d-none d-lg-block">
    <a class="btn-frame text-decoration-none" target="_blank"
        href="tel:<?= $func->parsePhone($optsetting['hotline']) ?>" onclick="countClick('hotline')" title="Hotline">
        <div class="animated infinite zoomIn kenit-alo-circle"></div>
        <div class="animated infinite pulse kenit-alo-circle-fill"></div>
        <i>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" class="text-white" width="24" height="24">
                <path
                    d="M23.45 20.93a3 3 0 0 0-4.25 0l-1.45 1.45a26.14 26.14 0 0 1-4.51-3.62 26.62 26.62 0 0 1-3.62-4.51l1.45-1.45a3 3 0 0 0 0-4.25L8.24 5.73a2.93 2.93 0 0 0-2.11-.88h0A3 3 0 0 0 4 5.73L2.64 7.08A6.37 6.37 0 0 0 1 12.33c.32 3.75 2.78 8.26 6.57 12.06S15.92 30.64 19.67 31a7.87 7.87 0 0 0 .84 0 6.07 6.07 0 0 0 4.41-1.64L26.27 28a3 3 0 0 0 .88-2.13 2.93 2.93 0 0 0-.88-2.11zm1.41 5.66L23.5 27.94a4.57 4.57 0 0 1-3.66 1c-3.25-.28-7.39-2.58-10.81-6S3.31 15.41 3 12.16a4.53 4.53 0 0 1 1-3.66L5.41 7.14a1 1 0 0 1 .71-.29h0a1 1 0 0 1 .71.29L9.66 10a1 1 0 0 1 0 1.41l-2 2a1 1 0 0 0-.16 1.21 27.49 27.49 0 0 0 4.33 5.58 27.49 27.49 0 0 0 5.58 4.33 1 1 0 0 0 1.21-.16l2-2a1 1 0 0 1 1.41 0l2.83 2.83h0a1 1 0 0 1 .29.71A1 1 0 0 1 24.86 26.59zM26.6 5.39A14.92 14.92 0 0 0 16 1a1 1 0 1 0 0 2A13 13 0 0 1 29 16.11a1 1 0 0 0 1 1h0a1 1 0 0 0 1-1A14.91 14.91 0 0 0 26.6 5.39z"
                    class="color000 svgShape"></path>
                <path
                    d="M20.91,11.11a6,6,0,0,1,1.77,4.31,1,1,0,0,0,1,1h0a1,1,0,0,0,1-1,8,8,0,0,0-8-8.1,1,1,0,1,0,0,2A6,6,0,0,1,20.91,11.11Z"
                    class="color000 svgShape"></path>
            </svg>
        </i>
        <span>Call me: <?= $optsetting['hotline'] ?></span>
    </a>
    <a class="btn-frame text-decoration-none" target="_blank"
        href="https://zalo.me/<?= $func->parsePhone($optsetting['zalo']) ?>" onclick="countClick('zalo')" title="Zalo">
        <div class="animated infinite zoomIn kenit-alo-circle"></div>
        <div class="animated infinite pulse kenit-alo-circle-fill"></div>
        <i>
            <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="30" height="30" viewBox="0 0 50 50">
                <path
                    d="M 9 4 C 6.2504839 4 4 6.2504839 4 9 L 4 41 C 4 43.749516 6.2504839 46 9 46 L 41 46 C 43.749516 46 46 43.749516 46 41 L 46 9 C 46 6.2504839 43.749516 4 41 4 L 9 4 z M 9 6 L 15.576172 6 C 12.118043 9.5981082 10 14.323627 10 19.5 C 10 24.861353 12.268148 29.748596 15.949219 33.388672 C 15.815412 33.261195 15.988635 33.48288 16.005859 33.875 C 16.023639 34.279773 15.962689 34.835916 15.798828 35.386719 C 15.471108 36.488324 14.785653 37.503741 13.683594 37.871094 A 1.0001 1.0001 0 0 0 13.804688 39.800781 C 16.564391 40.352722 18.51646 39.521812 19.955078 38.861328 C 21.393696 38.200845 22.171033 37.756375 23.625 38.34375 A 1.0001 1.0001 0 0 0 23.636719 38.347656 C 26.359037 39.41176 29.356235 40 32.5 40 C 36.69732 40 40.631169 38.95117 44 37.123047 L 44 41 C 44 42.668484 42.668484 44 41 44 L 9 44 C 7.3315161 44 6 42.668484 6 41 L 6 9 C 6 7.3315161 7.3315161 6 9 6 z M 18.496094 6 L 41 6 C 42.668484 6 44 7.3315161 44 9 L 44 34.804688 C 40.72689 36.812719 36.774644 38 32.5 38 C 29.610147 38 26.863646 37.459407 24.375 36.488281 C 22.261967 35.634656 20.540725 36.391201 19.121094 37.042969 C 18.352251 37.395952 17.593707 37.689389 16.736328 37.851562 C 17.160501 37.246758 17.523335 36.600775 17.714844 35.957031 C 17.941109 35.196459 18.033096 34.45168 18.003906 33.787109 C 17.974816 33.12484 17.916946 32.518297 17.357422 31.96875 L 17.355469 31.966797 C 14.016928 28.665356 12 24.298743 12 19.5 C 12 14.177406 14.48618 9.3876296 18.496094 6 z M 32.984375 14.986328 A 1.0001 1.0001 0 0 0 32 16 L 32 25 A 1.0001 1.0001 0 1 0 34 25 L 34 16 A 1.0001 1.0001 0 0 0 32.984375 14.986328 z M 18 16 A 1.0001 1.0001 0 1 0 18 18 L 21.197266 18 L 17.152344 24.470703 A 1.0001 1.0001 0 0 0 18 26 L 23 26 A 1.0001 1.0001 0 1 0 23 24 L 19.802734 24 L 23.847656 17.529297 A 1.0001 1.0001 0 0 0 23 16 L 18 16 z M 29.984375 18.986328 A 1.0001 1.0001 0 0 0 29.162109 19.443359 C 28.664523 19.170123 28.103459 19 27.5 19 C 25.578848 19 24 20.578848 24 22.5 C 24 24.421152 25.578848 26 27.5 26 C 28.10285 26 28.662926 25.829365 29.160156 25.556641 A 1.0001 1.0001 0 0 0 31 25 L 31 22.5 L 31 20 A 1.0001 1.0001 0 0 0 29.984375 18.986328 z M 38.5 19 C 36.578848 19 35 20.578848 35 22.5 C 35 24.421152 36.578848 26 38.5 26 C 40.421152 26 42 24.421152 42 22.5 C 42 20.578848 40.421152 19 38.5 19 z M 27.5 21 C 28.340272 21 29 21.659728 29 22.5 C 29 23.340272 28.340272 24 27.5 24 C 26.659728 24 26 23.340272 26 22.5 C 26 21.659728 26.659728 21 27.5 21 z M 38.5 21 C 39.340272 21 40 21.659728 40 22.5 C 40 23.340272 39.340272 24 38.5 24 C 37.659728 24 37 23.340272 37 22.5 C 37 21.659728 37.659728 21 38.5 21 z">
                </path>
            </svg>
        </i>
        <span>Zalo: <?= $optsetting['zalo'] ?></span>
    </a>
    <?php /*
<a class="btn-frame text-decoration-none" target="_blank" href="<?=$optsetting['fanpage']?>">
<div class="animated infinite zoomIn kenit-alo-circle"></div>
<div class="animated infinite pulse kenit-alo-circle-fill"></div>
<i>
<svg width="40px" height="40px" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><path d="M 16 4 C 9.410156 4 4 9.136719 4 15.5 C 4 18.890625 5.570313 21.902344 8 24 L 8 28.625 L 12.4375 26.40625 C 13.566406 26.746094 14.746094 27 16 27 C 22.589844 27 28 21.863281 28 15.5 C 28 9.136719 22.589844 4 16 4 Z M 16 6 C 21.558594 6 26 10.265625 26 15.5 C 26 20.734375 21.558594 25 16 25 C 14.804688 25 13.664063 24.773438 12.59375 24.40625 L 12.1875 24.28125 L 10 25.375 L 10 23.125 L 9.625 22.8125 C 7.40625 21.0625 6 18.441406 6 15.5 C 6 10.265625 10.441406 6 16 6 Z M 14.875 12.34375 L 8.84375 18.71875 L 14.25 15.71875 L 17.125 18.8125 L 23.09375 12.34375 L 17.8125 15.3125 Z"/></svg>
</i>
</a>
<?= $addons->setAddons('fanpage-facebook', 'fanpage-facebook', 10);  ?>
<?= $addons->setAddons('footer-map', 'footer-map', 10); ?>

*/ ?>
</div>