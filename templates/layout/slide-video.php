<div class="slide-video">
    <video autoplay muted loop playsinline preload="none">
        <source src="<?=UPLOAD_FILE_L . $slideVideo['file_video']?>" type="video/mp4">
        Your browser does not support HTML5 video.
    </video>
    <?php if($slideVideo['name'.$lang] || $slideVideo['desc'.$lang]){ ?>
    <div class="slide-content">
        <div class="container d-flex">
            <div class="text-center">
                <h1><?=$slideVideo['name'.$lang]?></h1>
                <h6 class="fw-400"><?=$slideVideo['desc'.$lang]?></h6>
            </div>
        </div>
    </div>
    <?php } ?>
</div>