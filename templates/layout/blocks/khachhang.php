<div class="khachhang-item">
    <div class="desc"><?= $v['desc' . $lang] ?></div>
    <div class="info">
        <div class="image">
            <img onerror="this.src='<?= THUMBS ?>/100x100x1/assets/images/noimage.png';" src="<?= THUMBS ?>/100x100x1/<?= UPLOAD_NEWS_L . $v['photo'] ?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
        </div>
        <h3 class="name">
            <?= $v['name' . $lang] ?>
            <span><?= $v['subname' . $lang] ?></span>
        </h3>
    </div>
</div>