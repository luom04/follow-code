<div class="container">
    <div class="row flex-column-reverse flex-lg-row">
        <?php /*
        <div class="col-3 mb-4">
            <?php include TEMPLATE . LAYOUT . "sidebar.php"; ?>
        </div>*/ ?>
        <div class="col-12 mb-4">
            <?php if (!empty($static)) { ?>
            <div class="title-main-detail has-line text-center"><h2><?= $static['name' . $lang] ?></h2></div>
            <div class="content-text"><?= $func->decodeHtmlChars($static['content' . $lang]) ?></div>
            
            <?php } else { ?>
            <div class="alert alert-warning w-100" role="alert">
                <strong><?= dangcapnhatdulieu ?></strong>
            </div>
            <?php } ?>
        </div>
    </div>
</div>