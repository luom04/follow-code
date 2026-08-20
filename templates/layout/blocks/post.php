<?php $attrs = json_decode($v[ 'attributes'],true); ?>
<div class="news-item border-1 rounded-lg" data-aos="fade-up">
    <p class="image w-100">
        <a class="scale-img rounded-lg" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>">
            <?php if(isset($isLazy) && $isLazy == false  ) { ?>
            <img class="w-100" onerror="this.src='<?= THUMBS ?>/500x300x1/assets/images/noimage.png';" src="<?= $func->addWebpToUrl(THUMBS.'/500x300x1/'.UPLOAD_NEWS_L.$v['photo']);?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
            <?php }else{ ?>
            <img class="lazy w-100" onerror="this.src='<?= THUMBS ?>/500x300x1/assets/images/noimage.png';" data-src="<?= $func->addWebpToUrl(THUMBS.'/500x300x1/'.UPLOAD_NEWS_L.$v['photo']);?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
            <?php } ?>
        </a>
    </p>
    <div class="info">
        <h3 class="name mb-0">
            <a class="text-split text-split-2 text-decoration-none" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>"><?= $v['name' . $lang] ?></a>
        </h3>
        <?php if($v['desc' . $lang]) { ?>
        <p class="desc text-split"><?= $v['desc' . $lang] ?></p>
        <?php } ?>
        <a href="<?= $v[$sluglang] ?>">Xem thêm bài viết <i class="fa-solid fa-angles-right"></i></a>
    </div>
</div>