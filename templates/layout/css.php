<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.css">
<link
    href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Lexend:wght@100..900&family=Manrope:wght@200..800&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Noto+Sans:ital,wght@0,100..900;1,100..900&family=Nunito:ital,wght@0,200..1000;1,200..1000&family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Oswald:wght@200..700&family=Quicksand:wght@300..700&family=Raleway:ital,wght@0,100..900;1,100..900&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap"
    rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Lexend:wght@100..900&display=swap" rel="stylesheet">

<link
    href="https://fonts.googleapis.com/css2?family=Anton&family=Google+Sans:ital,opsz,wght@0,17..18,400..700;1,17..18,400..700&display=swap"
    rel="stylesheet">
<!-- Css Files -->
<?php
$css->set("css/animate.min.css");
$css->set("bootstrap/bootstrap.css");
$css->set("holdon/HoldOn.css");
$css->set("holdon/HoldOn-style.css");
$css->set("confirm/confirm.css");
$css->set("simplenotify/simple-notify.css");
$css->set("mmenu/mmenu.css");
$css->set("fancybox5/fancybox.css");
$css->set("slick/slick.css");
$css->set("slick/slick-theme.css");
$css->set("slick/slick-style.css");
// $css->set("magiczoomplus/magiczoomplus.css");
$css->set("owlcarousel2/owl.carousel.css");
$css->set("owlcarousel2/owl.theme.default.css");
$css->set("select2/select2.css");
// $css->set("css/accordion-slider.min.css");
// $css->set("css/swiper-bundle.min.css");
// $css->set("css/gallery.css");
$css->set("simplyscroll/jquery.simplyscroll-style.css");
$css->set("simplyscroll/jquery.simplyscroll.css");
if ($deviceType == 'computer')
    $css->set("aos/aos.css");
$css->set("css/fonts.css");
$css->set("css/effects.css");
$css->set("css/base.css");
$css->set("css/cart.css");
$css->set("css/toc.css");
$css->set("css/menu.css");
$css->set("css/style.css");
$css->set("css/responsive.css");
if ($source == 'contact')
    $css->set("css/galaxy.css");

echo $css->get();
?>

<!-- Background -->
<?php
$bgbody = $d->rawQueryOne("select status, options, photo from #_photo where act = ? and type = ? limit 0,1", array('photo_static', 'background'));
if (!empty($bgbody['status']) && strpos($bgbody['status'], 'hienthi') !== false) {
    $bgbodyOptions = json_decode($bgbody['options'], true)['background'];
    if ($bgbodyOptions['type_show']) {
        echo '<style type="text/css">body{background: url(' . UPLOAD_PHOTO_L . $bgbody['photo'] . ') ' . $bgbodyOptions['repeat'] . ' ' . $bgbodyOptions['position'] . ' ' . $bgbodyOptions['attachment'] . ' ;background-size:' . $bgbodyOptions['size'] . '}</style>';
    } else {
        echo ' <style type="text/css">body{background-color:#' . $bgbodyOptions['color'] . '}</style>';
    }
}
?>

<!-- Js Google Analytic -->
<?= $func->decodeHtmlChars($setting['analytics']) ?>

<!-- Js Head -->
<?= $func->decodeHtmlChars($setting['headjs']) ?>