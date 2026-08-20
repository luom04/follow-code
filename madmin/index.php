<?php
session_start();
define('LIBRARIES', '../libraries/');
define('SOURCES', './sources/');
define('TEMPLATE', './templates/');
define('LAYOUT', 'layout/');
define('THUMBS', 'thumbs');
define('JSONS', '../assets/jsons/');
define('WATERMARK', '../watermark');

require_once LIBRARIES . "config.php";
require_once LIBRARIES . 'autoload.php';
new AutoLoad();
$d = new PDODb($config['database']);
$flash = new Flash();
$seo = new Seo($d);
$emailer = new Email($d);
$cache = new Cache($d);
$router = new AltoRouter();
$func = new Functions($d, $cache);
$statistic = new Statistic($d, $cache);
$detect = new MobileDetect();

/* Check HTTP */
// $func->checkHTTP($http, $config['arrayDomainSSL'], $configBase, $configUrl);  // đoạn này bỏ theo trang hân di
$langadmin = (!empty($_SESSION['langadmin']) && in_array($_SESSION['langadmin'], $config['website']['adminlang']['key'])) ? $_SESSION['langadmin'] : 'vi';
$_SESSION['langadmin'] = 'vi';
require_once LIBRARIES."lang/admin/".$langadmin.".php";
/* Config type */
require_once LIBRARIES . "config-type.php";

/* Lang Init */
// require_once LIBRARIES."lang/langinit.php";

/* Setting */
$setting = $d->rawQueryOne("select * from #_setting limit 0,1");
$optsetting = (isset($setting['options']) && $setting['options'] != '') ? json_decode($setting['options'], true) : null;
$logo = $cache->get("select id, photo, options from #_photo where type = ? and act = ? and find_in_set('hienthi',status) limit 0,1", array('logo', 'photo_static'), 'fetch', 7200);
$favicon = $cache->get("select id, photo, options from #_photo where type = ? and act = ? and find_in_set('hienthi',status) limit 0,1", array('favicon', 'photo_static'), 'fetch', 7200);


/* Requick */
require_once LIBRARIES . "requick.php";
?>
<!DOCTYPE html>
<html lang="vi">

<head>

    <base href="<?= $configBase . ADMIN ?>/" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<?= ASSET . UPLOAD_PHOTO_L . ($favicon['photo'] ?: $logo['photo']) ?>" rel="shortcut icon" type="image/x-icon" />
    <title>Administrator - <?= $setting['namevi'] ?></title>
    <!-- Css all -->
    <?php include TEMPLATE . LAYOUT . "css.php"; ?>
</head>

<body class="sidebar-mini hold-transition text-sm">
    <!-- Loader -->
    <?php if ($template == 'index' || $template == 'user/login') include TEMPLATE . LAYOUT . "loader.php"; ?>

    <!-- Wrapper -->
    <?php if (isset($_SESSION[$loginAdmin]['active']) && ($_SESSION[$loginAdmin]['active'] == true)) { ?>
        <div class="wrapper">
            <?php
            include TEMPLATE . LAYOUT . "header.php";
            include TEMPLATE . LAYOUT . "menu.php";
            ?>
            <div class="content-wrapper"  data-background-color="<?= $setting['color_main']?>" data-themes-main="<?= $setting['themes_main']?>">
                <?php if ($alertlogin) { ?>
                    <section class="content">
                        <div class="container-fluid">
                            <div class="alert my-alert alert-warning alert-dismissible text-sm bg-gradient-warning mt-3 mb-0">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <i class="icon fas fa-exclamation-triangle"></i> <?= $alertlogin ?>
                            </div>
                        </div>
                    </section>
                <?php } ?>
                <?php include TEMPLATE . $template . "_tpl.php"; ?>
            </div>
            <?php include TEMPLATE . LAYOUT . "footer.php"; ?>
        </div>
        <div class="modal fade" id="aiContentModal" tabindex="-1" aria-labelledby="aiContentModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="aiContentModalLabel">Tạo nội dung bằng AI</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Đóng">&times;</button>
              </div>
              <div class="modal-body">
                <form id="aiContentForm">
                  <div class="mb-3">
                    <label for="ai-lang" class="form-label">Ngôn ngữ</label>
                    <select id="ai-lang" class="form-control text-sm">
                      <?php foreach ($config['website']['lang'] as $k => $v) { ?>
                      <option value="<?=$k?>" selected><?=$v?></option>
                      <?php } ?>
                    </select>
                  </div>
                  <div class="mb-3">
                    <label for="ai-keywords" class="form-label">Từ khoá mục tiêu</label>
                    <input type="text" class="form-control text-sm" id="ai-keywords" placeholder="Nhập từ khoá liên quan">
                  </div>

                  <div class="mb-3">
                    <label for="ai-title" class="form-label">Tiêu đề bài viết</label>
                    <input type="text" class="form-control text-sm" id="ai-title" placeholder="Nhập tiêu đề bài viết">
                  </div>

                  <div class="mb-3">
                    <label for="ai-desc" class="form-label">Mô tả bài viết</label>
                    <textarea rows="5" class="form-control text-sm" id="ai-desc" placeholder="Nhập mô tả bài viết"></textarea>
                  </div>

                  <div class="mb-3">
                    <label for="ai-colorH2" class="form-label">Màu sắc tiêu đề</label>
                    <input type="color" class="form-control text-sm" id="ai-colorH2" placeholder="Nhập màu sắc tiêu đề" value="<?=$optsetting['prompt_colorh2']?>">
                  </div>

                  <div class="mb-3">
                    <label for="ai-style" class="form-label">Phong cách viết</label>
                    <select id="ai-style" class="form-control text-sm">
                      <option value="truyền cảm hứng">Truyền cảm hứng</option>
                      <option value="chuyên nghiệp">Chuyên nghiệp</option>
                      <option value="hài hước">Hài hước</option>
                      <option value="thân thiện">Thân thiện</option>
                    </select>
                  </div>

                  <div class="mb-3">
                    <label for="ai-words" class="form-label">Độ dài</label>
                    <select id="ai-words" class="form-control text-sm">
                      <option value="1000 - 1500">1000 - 1500 từ</option>
                      <option value="1500 - 3000">1500 - 3000 từ</option>
                      <option value="3000 - 5000">3000 - 5000 từ</option>
                      <option value="5000">Trên 5000 từ</option>
                    </select>
                  </div>

                  <div class="form-check mb-2">
                    <input class="form-check-input" type="checkbox" id="show-product" checked>
                    <label class="form-check-label" for="show-product">Hiển thị sản phẩm</label>
                  </div>

                  <div class="form-check mb-2">
                    <input class="form-check-input" type="checkbox" id="show-service" checked>
                    <label class="form-check-label" for="show-service">Hiển thị dịch vụ</label>
                  </div>

                  <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" id="show-contact" checked>
                    <label class="form-check-label" for="show-contact">Hiển thị thông tin liên hệ</label>
                  </div>
                </form>
              </div>

              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Huỷ</button>
                <button type="button" class="btn btn-primary" id="generate-ai-content">Tạo nội dung</button>
              </div>
            </div>
          </div>
        </div>
    <?php include TEMPLATE . LAYOUT . "toggle.php"; ?>

    <?php } else {
        include TEMPLATE . "user/login_tpl.php";
    } ?>
    <!-- Js all -->
    <?php include TEMPLATE . LAYOUT . "js.php"; ?>
</body>

</html>