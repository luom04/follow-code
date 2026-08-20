<script src="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.js"></script>
<!-- Js Config -->
<script type="text/javascript">
    var MM_FRAMEWORK = MM_FRAMEWORK || {};
    var CONFIG_BASE = '<?= $configBase ?>';
    var ASSET = '<?= ASSET ?>';
    var WEBSITE_NAME = '<?= (!empty($setting['name' . $lang])) ? addslashes($setting['name' . $lang]) : '' ?>';
    var TIMENOW = '<?= date("d/m/Y", time()) ?>';
    var SHIP_CART = <?= (!empty($config['order']['ship'])) ? 'true' : 'false' ?>;
    var RECAPTCHA_ACTIVE = <?= (!empty($config['googleAPI']['recaptcha']['active'])) ? 'true' : 'false' ?>;
    var RECAPTCHA_SITEKEY = '<?= $config['googleAPI']['recaptcha']['sitekey'] ?>';
    var GOTOP = ASSET + 'assets/images/top.png';
    var LANG = {
        'no_keywords': '<?= chuanhaptukhoatimkiem ?>',
        'delete_product_from_cart': '<?= banmuonxoasanphamnay ?>',
        'no_products_in_cart': '<?= khongtontaisanphamtronggiohang ?>',
        'ward': '<?= phuongxa ?>',
        'back_to_home': '<?= vetrangchu ?>',
        'thongbao': '<?= thongbao ?>',
        'dongy': '<?= dongy ?>',
        'dungluonghinhanhlon': '<?= dungluonghinhanhlon ?>',
        'dulieukhonghople': '<?= dulieukhonghople ?>',
        'banchiduocchon1hinhanhdeuplen': '<?= banchiduocchon1hinhanhdeuplen ?>',
        'dinhdanghinhanhkhonghople': '<?= dinhdanghinhanhkhonghople ?>',
        'huy': '<?= huy ?>',
    };
    var DEVICE_TYPE = '<?=$deviceType?>'
    var LOGO_IMG='<?=$configBase?><?= UPLOAD_PHOTO_L . $logo['photo'] ?>';
    var DONHANGAO = <?=json_encode($allDonHangs, true)?>;
    var UPLOAD_NEWS = '<?=UPLOAD_NEWS_L?>';
    var CATEGORIES = <?=json_encode($productListMenu, true)?>;
    var VARIANT_DATA = <?= (!empty($variantData)) ? json_encode($variantData, JSON_UNESCAPED_UNICODE) : '{}' ?>;
    

</script>

<!-- Js Files -->
<script src="assets/js/jquery.min.js"> </script>
<script src="assets/js/jquery-migrate-3.0.0.min.js"> </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.i18n/1.0.7/jquery.i18n.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.i18n/1.0.7/jquery.i18n.messagestore.min.js"></script>
<?php
$js->set("js/lazyload.min.js");
$js->set("js/jquery.waypoints.min.js");
$js->set("js/jquery.countup.min.js");
$js->set("bootstrap/bootstrap.js");
$js->set("owlcarousel2/owl.carousel.js");
$js->set("holdon/HoldOn.js");
$js->set("confirm/confirm.js");
$js->set("simplenotify/simple-notify.js");
$js->set("datetimepicker/jquery.mousewheel.js");
$js->set("fancybox5/fancybox.umd.js");
$js->set("js/jquery.pixelentity.shiner.min.js");
// $js->set("magiczoomplus/magiczoomplus.js");
// $js->set("js/jquery.gallery.js");
// $js->set("js/modernizr.custom.53451.js");
// $js->set("js/jquery.accordionSlider.min.js");
$js->set("slick/slick.js");
// $js->set("js/swiper-bundle.min.js");
$js->set("simplyscroll/jquery.simplyscroll.js");
$js->set("select2/select2.full.js");
$js->set("js/placeholder.js");
$js->set("js/functions.js");
$js->set("mmenu/mmenu.js");
if($deviceType == 'computer') $js->set("aos/aos.js");
$js->set("toc/toc.js");
// $js->set("js/comment.js");
$js->set("js/apps.js");
echo $js->get();
?>
<!-- <script>
   var swiper = new Swiper(".mySwiper", {
      direction: "vertical",
      slidesPerView: 2,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
    });
</script> -->


<script>
function countClick(type) {
  fetch('api/log_click.php', {
    method: 'POST',
    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    body: 'type=' + encodeURIComponent(type)
  });
}
</script>
<?php if ( !$func->isGoogleSpeed() && !empty($config['oneSignal']['active'])) { ?>
    <!-- Js OneSignal -->
    <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
    <script type="text/javascript">
        var OneSignal = window.OneSignal || [];
        OneSignal.push(function() {
            OneSignal.init({
                appId: "<?= $config['oneSignal']['id'] ?>"
            });
        });
    </script>
<?php } ?>



<?php if( !$func->isGoogleSpeed() ) { ?>
    <!-- Js Structdata -->
    <?php include TEMPLATE . LAYOUT . "strucdata.php"; ?>

    <!-- Js Addons -->
    <?= $addons->set('script-main', 'script-main', 2); ?>
    <?= $addons->get(); ?>

    <!-- Js Body -->
    <?= $func->decodeHtmlChars($setting['bodyjs']) ?>
<?php } ?>


<?php if( !$func->isGoogleSpeed() ) { ?>
<?php /*
<div id="google_translate_element"></div>
<script type="text/javascript">
    function getCurrentLang() {
        const match = document.cookie.match(/googtrans=\/[^\/]+\/([^;]+)/);
        return match ? match[1] : 'vi';
    }

    function renderLangSwitcher() {
        const currentLang = getCurrentLang();
        const imageFlag = document.getElementById('languageFlag');
        const selectLang = document.getElementById('languageSelect');

        if (currentLang === 'vi') {
            imageFlag.src = "assets/images/vi.jpg";
            selectLang.value = "en|vi";
        } else {
            imageFlag.src = "assets/images/en.jpg";
            selectLang.value = "vi|en";
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        renderLangSwitcher();

        // Theo dõi thay đổi URL hash nếu dùng GTranslate dạng URL (#googtrans)
        window.addEventListener('hashchange', function () {
            setTimeout(renderLangSwitcher, 300);
        });

        // Theo dõi thay đổi cookie (trong trường hợp chuyển từ nơi khác)
        setInterval(() => {
            if (getCurrentLang() !== window.__lastLang) {
                window.__lastLang = getCurrentLang();
                renderLangSwitcher();
            }
        }, 1000);
    });

    function googleTranslateElementInit() {
        new google.translate.TranslateElement({
        pageLanguage: 'vi',
        autoDisplay: false,
        }, 'google_translate_element');
    }
    function GTranslateFireEvent(element, eventName) {
        try {
            if (document.createEvent) {
            var evt = document.createEvent("HTMLEvents");
            evt.initEvent(eventName, true, true);
            element.dispatchEvent(evt);
            } else {
            var evt = document.createEventObject();
            element.fireEvent('on' + eventName, evt);
            }
        } catch (e) {
            // catch silently
        }
    }

    function doGTranslate(lang_pair) {
        if (lang_pair.value) lang_pair = lang_pair.value;
        if (lang_pair == '') return;

        var lang = lang_pair.split('|')[1];
        var selectControl;
        var selects = document.getElementsByTagName('select');

        for (var i = 0; i < selects.length; i++) {
            if (selects[i].className == 'goog-te-combo') {
            selectControl = selects[i];
            }
        }

        if (document.getElementById('google_translate_element') == null ||
            document.getElementById('google_translate_element').innerHTML.length == 0 ||
            selectControl.length == 0 ||
            selectControl.innerHTML.length == 0) {
            setTimeout(function () {
            doGTranslate(lang_pair);
            }, 500);
        } else {
            selectControl.value = lang;
            GTranslateFireEvent(selectControl, 'change');
            GTranslateFireEvent(selectControl, 'change');
        }
    }
</script>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<div id="notify-popup" class="notify-popup" style="display: none;">
    <div class="notify-content">
        <img src="" alt="thumb" class="notify-image">
        <div class="notify-text">
            <div class="notify-title"></div>
            <div class="notify-action">Vừa đặt <a href="#" target="_blank"></a></div>
            <div class="notify-time"></div>
        </div>
        <span class="notify-close">×</span>
    </div>
</div>
<script>
    let currentIndex = 0;
    function getRandomTimeAgo() {
        const minutes = Math.floor(Math.random() * 10) + 1; // 1 -> 10
        return `${minutes} phút trước`;
    }
    function showNotifyDonHang(data) {
        $('#notify-popup .notify-image').attr('src', UPLOAD_NEWS + data.photo);
        $('#notify-popup .notify-title').text(data.namevi);
        $('#notify-popup .notify-action a').text(data.subnamevi).attr('href', data.link);
        $('#notify-popup .notify-time').text(data.date_timeline);

        $('#notify-popup').fadeIn();

        // Ẩn sau 4 giây
        setTimeout(() => {
            $('#notify-popup').fadeOut();
        }, 4000);
    }

    function startNotifyLoop() {
        setInterval(() => {
            showNotifyDonHang(DONHANGAO[currentIndex]);
            currentIndex = (currentIndex + 1) % DONHANGAO.length;
        }, 8000); // mỗi 8 giây
    }

    // Đóng thủ công
    $(document).on('click', '.notify-close', function () {
        $('#notify-popup').fadeOut();
    });

    $(document).ready(function () {
        if(DONHANGAO.length > 0) startNotifyLoop();
    });
</script>*/ ?>
<?php } ?>