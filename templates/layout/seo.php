<ul class="h-card d-none">
    <li class="h-fn fn"><?= $setting['name' . $lang] ?></li>
    <li class="h-org org"><?= $setting['name' . $lang] ?></li>
    <li class="h-tel tel"><?= preg_replace('/[^0-9]/', '', $optsetting['hotline']); ?></li>
    <li><a class="u-url ul" href="<?= $configBase ?>"><?= $configBase ?></a></li>
</ul>

<h1 class="d-none"><?= $seo->get('h1') ?></h1>