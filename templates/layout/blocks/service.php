<div class="service-item <?=($k+1)%2 == 0 ? 'pt-lg-5' : ''?>" data-aos="fade-up">
    <p class="image w-100 <?=($k+1)%2 == 0 ? 'mt-lg-5' : ''?>">
        <a class="position-relative scale-img" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>">
            <?php if(isset($isLazy) && $isLazy == false  ) {?>
                <img class="w-100" onerror="this.src='<?= THUMBS ?>/500x333x1/assets/images/noimage.png';" src="<?= $func->addWebpToUrl(THUMBS.'/500x333x1/'.UPLOAD_NEWS_L.$v['photo']);?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
            <?php } else { ?>
                <img class="lazy w-100" onerror="this.src='<?= THUMBS ?>/500x333x1/assets/images/noimage.png';" data-src="<?= $func->addWebpToUrl(THUMBS.'/500x333x1/'.UPLOAD_NEWS_L.$v['photo']);?>" alt="<?= $v['name' . $lang] ?>" title="<?= $v['name' . $lang] ?>" />
            <?php } ?>
        </a>
    </p>
    <h3 class="name">
        <a class="text-split text-decoration-none" href="<?= $v[$sluglang] ?>" title="<?= $v['name' . $lang] ?>"><?= $v['name' . $lang] ?></a>
    </h3>
    <p class="desc text-split"><?= $v['desc' . $lang] ?></p>
</div>