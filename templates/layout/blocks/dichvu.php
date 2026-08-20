<div class="news-item" data-aos="fade-up">
    <p class="image w-100">
        <a class="scale-img" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>">
            <img class="lazy w-100" onerror="this.src='<?= THUMBS ?>/500x300x1/assets/images/noimage.png';" data-src="<?= $func->addWebpToUrl(THUMBS.'/500x300x1/'.UPLOAD_NEWS_L.$v['photo']);?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
        </a>
    </p>
    <div class="info">
        <h3 class="name mb-0">
            <a class="text-split text-split-2 text-decoration-none" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>"><?= $v['name' . $lang] ?></a>
        </h3>
        <p><?= $v['desc' . $lang] ?></p>
    </div>
</div>