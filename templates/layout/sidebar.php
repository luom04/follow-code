<div class="sidebar">
    <?php /*
    <div class="widget category mb-4">
        <div class="widget-title d-flex justify-content-between">
            Danh mục sản phẩm
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none">
                <path d="M4 12H20M4 8H20M4 16H12" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </div>
        <div class="widget-content">
            <ul class="widget-ul">
                <?php if (count($productListMenu)) { ?>
                <?php foreach ($productListMenu as $klist => $vlist) {
                    $productCatMenu = $d->rawQuery("select name$lang, slugvi, slugen, id from #_product_cat where id_list = ? and find_in_set('hienthi',status) order by numb,id desc", array($vlist['id'])); ?>
                    <li class="<?php if($vlist['id'] == $productList['id'] || $vlist['id'] == $idl){ echo ' active'; } ?>">
                        <a title="<?= $vlist['name' . $lang] ?>" href="<?= $vlist[$sluglang] ?>"><?= $vlist['name' . $lang] ?></a>
                        <?php if (!empty($productCatMenu)) { ?>
                            <ul>
                                <?php foreach ($productCatMenu as $kcat => $vcat) {
                                    $productItemMenu = $d->rawQuery("select name$lang, slugvi, slugen, id from #_product_item where id_cat = ? and find_in_set('hienthi',status) order by numb,id desc", array($vcat['id'])); ?>
                                    <li class="<?php if($vcat['id'] == $productCat['id']){ echo ' active'; } ?>">
                                        <a title="<?= $vcat['name' . $lang] ?>" href="<?= $vcat[$sluglang] ?>"><?= $vcat['name' . $lang] ?></a>
                                        <?php if (!empty($productItemMenu)) { ?>
                                            <ul>
                                                <?php foreach ($productItemMenu as $kitem => $vitem) {
                                                    $productSubMenu = $d->rawQuery("select name$lang, slugvi, slugen, id from #_product_sub where id_item = ? and find_in_set('hienthi',status) order by numb,id desc", array($vitem['id'])); ?>
                                                    <li class="<?php if (!empty($productSubMenu)) { echo 'has-child'; } if($vitem['id'] == $productItem['id']){ echo ' active'; } ?>">
                                                        <a title="<?= $vitem['name' . $lang] ?>" href="<?= $vitem[$sluglang] ?>"><?= $vitem['name' . $lang] ?></a>
                                                        <?php if (!empty($productSubMenu)) { ?>
                                                            <ul>
                                                                <?php foreach ($productSubMenu as $ksub => $vsub) { ?>
                                                                    <li>
                                                                        <a title="<?= $vsub['name' . $lang] ?>" href="<?= $vsub[$sluglang] ?>"><?= $vsub['name' . $lang] ?></a>
                                                                    </li>
                                                                <?php } ?>
                                                            </ul>
                                                        <?php } ?>
                                                    </li>
                                                <?php } ?>
                                            </ul>
                                        <?php } ?>
                                        <?php if (!empty($productItemMenu)) { echo '<i class="icon"></i>'; } ?>
                                    </li>
                                <?php } ?>
                            </ul>
                        <?php } ?>
                        <?php if (!empty($productCatMenu)) { echo '<i class="icon"></i>'; } ?>
                    </li>
                <?php } ?>
                <?php } ?>
            </ul>
        </div>
    </div>*/ ?>
    <div class="widget mb-4">
        <div class="widget-title">
            Đặt lịch khám
        </div>
        <div class="widget-content">
            <form class="validation-appointment-1" novalidate method="post" action="">
                <div class="mb-3">
                    <input type="text" name="dataAppointment[fullname]" class="form-control" placeholder="<?= hoten ?>" value="<?= $flash->get('fullname') ?>" required>
                </div>
                <div class="mb-3">
                    <input type="tel" name="dataAppointment[phone]" class="form-control" placeholder="<?= dienthoai ?>" value="<?= $flash->get('phone') ?>" required pattern="(0|\+84)(3[2-9]|5[689]|7[06-9]|8[1-5]|9[0-9])[0-9]{7}">
                </div>
                <div class="mb-3">
                    <input type="text" onfocus="this.type='date';" name="dataAppointment[attributes][ngaysinh]" class="form-control" value="" placeholder="Ngày sinh" required />
                </div>
                <div class="mb-3">
                    <select name="dataAppointment[attributes][gioitinh]" class="form-select" required>
                        <option value="">-- Giới tính</option>
                        <option value="Nam">Nam</option>
                        <option value="Nữ">Nữ</option>
                    </select>
                </div>
                <div class="mb-3">
                    <select name="dataAppointment[subject]" class="form-select select-chuyenkhoa" required>
                        <option value="">-- Vui lòng chọn chuyên khoa</option>
                        <?php foreach ($allChuyenKhoas as $klist => $vlist) { ?>
                        <option value="<?= $vlist['name' . $lang] ?>" data-id="<?= $vlist['id'] ?>">
                            <?= $vlist['name' . $lang] ?>
                        </option>
                        <?php } ?>
                    </select>
                </div>
                <div class="mb-3">
                    <select name="dataAppointment[attributes][bacsi]" class="form-select select-bacsi" required>
                        <option value="">-- Vui lòng chọn bác sĩ</option>
                    </select>
                </div>
                <div class="mb-3">
                    <input type="text" onfocus="this.type='date';" name="dataAppointment[attributes][ngaykham]" class="form-control" value="" placeholder="Ngày khám" required />
                </div>
                <div class="mb-3">
                    <input type="text" onfocus="this.type='time';" name="dataAppointment[attributes][giokham]" class="form-control" value="" placeholder="Giờ khám" required />
                </div>
                <div class="mb-3">
                    <textarea name="dataAppointment[content]" rows="4" class="form-control" placeholder="Triệu chứng" required></textarea>
                </div>
                <div class="">
                    <div class="buttons-common w-100 active">
                        <button type="submit" class="blob-btn btn w-100 active px-4 py-2" name="submit-appointment" value="send">
                            <span class="blob-txt">Đặt lịch khám</span>
                            <span class="blob-btn__inner">
                                <span class="blob-btn__blobs">
                                    <span class="blob-btn__blob"></span>
                                    <span class="blob-btn__blob"></span>
                                    <span class="blob-btn__blob"></span>
                                    <span class="blob-btn__blob"></span>
                                </span>
                            </span>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="widget service mb-4">
        <div class="widget-title">
            Dịch vụ
        </div>
        <div class="widget-content">
            <ul class="widget-ul">
            <?php foreach ($allDichvus as $k => $v) { ?>
                <li><a title="<?= $v['name' . $lang] ?>" href="<?= $v[$sluglang] ?>"><?= $v['name' . $lang] ?></a></li>
            <?php } ?>
            </ul>
        </div>
    </div>
</div>