<div class="menu ms-auto">
    <ul class="menu-main d-flex align-items-center justify-content-end">
        <li><a class="<?php if ($source == 'index') echo 'active'; ?>" href="<?= $configBase ?>">Trang chủ</a></li>
        <li><a class="<?php if ($com == 'gioi-thieu') echo 'active'; ?>" href="gioi-thieu">Giới thiệu</a></li>
        <li><a class="has-child <?php if ($com == 'san-pham') echo 'active'; ?>" href="san-pham">Sản phẩm</a>
            <?php if (count($productListMenu)) { ?>
            <ul class="submenu">
                <?php foreach ($productListMenu as $klist => $vlist) {
                    if($klist < 5) $productCatMenu = $d->rawQuery("select name$lang, slugvi, slugen, id from #_product_cat where id_list = ? and find_in_set('hienthi',status) order by numb,id desc limit 0,4", array($vlist['id'])); else $productCatMenu = null; ?>
                    <li>
                        <div class="px-2 border">
                            <a class="fw-bold" title="<?= $vlist['name' . $lang] ?>" href="<?= $vlist[$sluglang] ?>"><?= $vlist['name' . $lang] ?></a>
                            <?php if (!empty($productCatMenu)) { ?>
                            <ul>
                            <?php foreach ($productCatMenu as $kcat => $vcat) { ?>
                                <li>
                                    <a class="cat" title="<?= $vcat['name' . $lang] ?>" href="<?= $vcat[$sluglang] ?>"><?= $vcat['name' . $lang] ?></a>
                                </li>
                                <?php if($kcat == 3){ echo '<div class="d-none">'; } if($kcat > 3 && ($kcat+1) == count($productCatMenu)){ echo '</div><li class="more"><a href="javascript:;" class="d-block text-md text-center">Xem thêm</a></li>'; } ?>
                            <?php } ?>
                            </ul>
                            <?php } ?>
                        </div>
                    </li>
                <?php } ?>
            </ul>
            <?php } ?>
        </li>
        <li><a class="has-child <?php if ($com == 'dich-vu') echo 'active'; ?>" href="dich-vu">Dịch vụ</a>
            <?php if (count($newsListMenuDichVu)) { ?>
            <ul>
                <?php foreach ($newsListMenuDichVu as $klist => $vlist) { ?>
                <li>
                    <a title="<?= $vlist['name' . $lang] ?>" href="<?= $vlist[$sluglang] ?>"><?= $vlist['name' . $lang] ?></a>
                </li>
                <?php } ?>
            </ul>
            <?php } ?>
        </li>
        <li><a class="<?php if ($com == 'tin-tuc') echo 'active'; ?>" href="tin-tuc">Tin tức</a></li>
        <li><a class="<?php if ($com == 'lien-he') echo 'active'; ?>" href="lien-he">Liên hệ</a></li>
    </ul>
</div>
<?php include TEMPLATE . LAYOUT . "mmenu.php"; ?>