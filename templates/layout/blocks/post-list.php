<div class="news-item list">
    <p class="image">
        <a class="scale-img" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>">
            <img class="lazy w-100" onerror="this.src='<?= THUMBS ?>/500x333x1/assets/images/noimage.png';" data-src="<?= $func->addWebpToUrl(THUMBS.'/500x333x1/'.UPLOAD_NEWS_L.$v['photo']);?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
        </a>
    </p>
    <div class="info">
        <div class="d-flex align-items-center text-gray mb-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#ffcb0f" class="bi bi-calendar2-week" viewBox="0 0 16 16">
                <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1z"/>
                <path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5zM11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5z"/>
            </svg>
            <span class="d-block mx-2 text-sm">Ngày đăng: <?= date("d/m/Y h:i A", $v['date_created']) ?></span>
            
        </div>
        <h3 class="name">
            <a class="text-split text-split-2" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>"><?= $v['name' . $lang] ?></a>
        </h3>
        <p class="desc text-split text-split-2 mb-0"><?= $v['desc' . $lang] ?></p>
    </div>
</div>