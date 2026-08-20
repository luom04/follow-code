<!DOCTYPE html>
<html lang="<?= $config['website']['lang-doc'] ?>" <?=($deviceType == 'mobile' ? 'class="no-js"' : '')?> >

<head>
    <?php include TEMPLATE . LAYOUT . "head.php"; ?>
    <?php include TEMPLATE . LAYOUT . "css.php"; ?>
</head>

<body class="page-<?=$source?>">
    <?php
    include TEMPLATE . LAYOUT . "seo.php";
    include TEMPLATE . LAYOUT . "header.php";
    if($source != 'index') include TEMPLATE . LAYOUT . "bannerqc.php";
    else include TEMPLATE . LAYOUT . "slide.php";
    if ($source != 'index') include TEMPLATE . LAYOUT . "breadcrumb.php";
    ?>
    <div class="<?= ($source == 'index' || $type == 'gioi-thieu') ? 'wrap-home' : 'wrap-home pt-2 pt-lg-2' ?>">
        <?php include TEMPLATE . $template . "_tpl.php"; ?>
    </div>
    <?php
        include TEMPLATE . LAYOUT . "footer.php";
        include TEMPLATE . LAYOUT . "modal.php";
        include TEMPLATE . LAYOUT . "js.php";
        if ($deviceType == 'mobile') include TEMPLATE . LAYOUT . "phone.php";
    ?>
</body>

</html>