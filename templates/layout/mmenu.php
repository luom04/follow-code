<div class="menu-res">
    <nav id="menu">
        <ul>
            <?php /*
            <li class="mm-listitem-product d-inline-flex flex-wrap py-2">
                <?php foreach($productListMenu as $k => $v) { ?>
                <a class="btn-main outline px-1 py-0 text-sm" href="<?= $v[$sluglang] ?>"><?= $v['name' . $lang] ?></a>
                <?php } ?>
            </li> */ ?>
            <li><a href="<?= $configBase ?>">Trang chủ</a></li>
            <li><a href="gioi-thieu">Giới thiệu</a></li>
            <?php /*
            <li><a href="san-pham">Sản phẩm</a>
                <?php if (count($productListMenu)) { ?>
                <ul>
                    <?php foreach ($productListMenu as $klist => $vlist) {
                        $productCatMenu = $d->rawQuery("select name$lang, slugvi, slugen, id from #_product_cat where id_list = ? and find_in_set('hienthi',status) order by numb,id desc", array($vlist['id']));?>
                        <li>
                            <a title="<?= $vlist['name' . $lang] ?>" href="<?= $vlist[$sluglang] ?>"><?= $vlist['name' . $lang] ?></a>
                            <?php if (!empty($productCatMenu)) { ?>
                            <ul>
                            <?php foreach ($productCatMenu as $kcat => $vcat) {
                                $productItemMenu = $d->rawQuery("select name$lang, slugvi, slugen, id from #_product_item where id_cat = ? and find_in_set('hienthi',status) order by numb,id desc", array($vcat['id'])); ?>
                                <li>
                                    <a class="cat" title="<?= $vcat['name' . $lang] ?>" href="<?= $vcat[$sluglang] ?>"><?= $vcat['name' . $lang] ?></a>
                                    <?php if (!empty($productItemMenu)) { ?>
                                        <ul>
                                            <?php foreach ($productItemMenu as $kitem => $vitem) {
                                                $productSubMenu = $d->rawQuery("select name$lang, slugvi, slugen, id from #_product_sub where id_item = ? and find_in_set('hienthi',status) order by numb,id desc", array($vitem['id'])); ?>
                                                <li>
                                                    <a class="" title="<?= $vitem['name' . $lang] ?>" href="<?= $vitem[$sluglang] ?>"><?= $vitem['name' . $lang] ?></a>
                                                    <?php if (!empty($productSubMenu)) { ?>
                                                        <ul>
                                                            <?php foreach ($productSubMenu as $ksub => $vsub) { ?>
                                                                <li>
                                                                    <a class="transition" title="<?= $vsub['name' . $lang] ?>" href="<?= $vsub[$sluglang] ?>"><?= $vsub['name' . $lang] ?></a>
                                                                </li>
                                                            <?php } ?>
                                                        </ul>
                                                    <?php } ?>
                                                </li>
                                            <?php } ?>
                                        </ul>
                                    <?php } ?>
                                </li>
                            <?php } ?>
                            </ul>
                            <?php } ?>
                        </li>
                    <?php } ?>
                </ul>
                <?php } ?>
            </li>*/ ?>
            <li><a href="thuong-hieu">Thương hiệu</a>
                <?php if (count($brands)) { ?>
                <ul>
                    <?php foreach ($brands as $klist => $vlist) { ?>
                    <li>
                        <a title="<?= $vlist['name' . $lang] ?>" href="<?= $vlist[$sluglang] ?>"><?= $vlist['name' . $lang] ?></a>
                    </li>
                    <?php } ?>
                </ul>
                <?php } ?>
            </li>
            <li><a href="tin-tuc">Tin tức</a>
                <?php if (count($newsListMenuNews)) { ?>
                <ul>
                    <?php foreach ($newsListMenuNews as $klist => $vlist) { ?>
                    <li>
                        <a title="<?= $vlist['name' . $lang] ?>" href="<?= $vlist[$sluglang] ?>"><?= $vlist['name' . $lang] ?></a>
                    </li>
                    <?php } ?>
                </ul>
                <?php } ?>
            </li>
            <li><a href="he-thong-cua-hang">Hệ thống cửa hàng</a></li>
            <li><a href="tuyen-dung">Tuyển dụng</a></li>
            <li><a href="lien-he" onclick="countClick('contact')">Liên hệ</a></li>
            <li class="p-2"><?=htmlspecialchars_decode($footer['desc'.$lang]) ?></li>

        </ul>
    </nav>
</div>