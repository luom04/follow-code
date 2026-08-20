<?php
$linkMan = "" . $com . "?act=man_photo&id_parent=" . $id_parent . "&kind=" . $kind . "&val=" . $val . "&type=" . $type;
$linkSave = "" . $com . "?act=save_photo&id_parent=" . $id_parent . "&kind=" . $kind . "&val=" . $val . "&type=" . $type;
?>
<!-- Content Header -->
<section class="content-header text-sm">
    <div class="container-fluid">
        <div class="row">
            <ol class="breadcrumb float-sm-left">
                <li class="breadcrumb-item"><a href="index.php" title="<?=dashboard?>"><?=dashboard?></a></li>
                <li class="breadcrumb-item active"><?=themmoi?> <?= $config[$com][$type][$dfgallery][$val]['title_main_photo'] ?></li>
            </ol>
        </div>
    </div>
</section>

<!-- Main content -->
<section class="content">
    <form class="validation-form" novalidate method="post" action="<?= $linkSave ?>" enctype="multipart/form-data">
        <div class="card-footer text-sm sticky-top">
            <button type="submit" class="btn btn-sm bg-gradient-primary submit-check" disabled><i class="far fa-save mr-2"></i><?=luu?></button>
            <button type="submit" class="btn btn-sm bg-gradient-success submit-check" name="save-here" disabled><i class="far fa-save mr-2"></i><?=luutaitrang?></button>
            <button type="reset" class="btn btn-sm bg-gradient-secondary"><i class="fas fa-redo mr-2"></i><?=lamlai?></button>
            <a class="btn btn-sm bg-gradient-danger" href="<?= $linkMan ?>" title="<?=thoat?>"><i class="fas fa-sign-out-alt mr-2"></i><?=thoat?></a>
        </div>
        <?php if (isset($config[$com][$type][$dfgallery][$val]['cart_photo']) && $config[$com][$type][$dfgallery][$val]['cart_photo'] == true) { ?>
            <?php
            $rows = $d->rawQuery("select id_color, id_size from #_product_sale where id_parent = ?", array($id_parent));
            
            $color = (!empty($rows)) ? $func->joinCols($rows, 'id_color') : array();
            $color = (!empty($color)) ? explode(",", $color) : array();

            $size = (!empty($rows)) ? $func->joinCols($rows, 'id_size') : array();
            $size = (!empty($size)) ? explode(",", $size) : array();

            if (!empty($color)) {
                $cols = ["namevi", "id", "color", "type_show"];
                $d->where('id', $color, 'IN');
                $d->where('type', $type);
                $result_color = $d->get("color", null, $cols);
            }

            if (!empty($size)) {
                $cols = ["namevi", "id"];
                $d->where('id', $size, 'IN');
                $d->where('type', $type);
                $result_size = $d->get("size", null, $cols);
            }
            ?>
            <div class="card card-primary card-outline text-sm">
                <div class="card-header">
                    <h3 class="card-title"><?=danhmucmausac?></h3>
                </div>
                <div class="card-body">
                    <?php if (isset($result_color) && count($result_color) > 0) {
                        foreach ($result_color as $k => $v) { ?>
                            <div class="custom-control custom-radio d-inline-block mr-3 text-md">
                                <input class="custom-control-input" type="radio" id="id_color<?= $k ?>" name="data[id_color]" value="<?= @$v['id'] ?>">
                                <label for="id_color<?= $k ?>" class="custom-control-label font-weight-normal"><?= $v['namevi'] ?></label>
                            </div>
                        <?php }
                    } else { ?>
                        <div class="alert alert-warning" role="alert">
                            <strong><?=khongcomausac?></strong>
                        </div>
                    <?php } ?>
                </div>
            </div>
            <div class="card card-primary card-outline text-sm">
                <div class="card-header">
                    <h3 class="card-title"><?=danhmuckichthuoc?></h3>
                </div>
                <div class="card-body">
                    <?php if (isset($result_size) && count($result_size) > 0) {
                        foreach ($result_size as $k => $v) { ?>
                            <div class="custom-control custom-radio d-inline-block mr-3 text-md">
                                <input class="custom-control-input" type="radio" id="id_size<?= $k ?>" name="data[id_size]" value="<?= @$v['id'] ?>">
                                <label for="id_size<?= $k ?>" class="custom-control-label font-weight-normal"><?= $v['namevi'] ?></label>
                            </div>
                        <?php }
                    } else { ?>
                        <div class="alert alert-warning" role="alert">
                            <strong><?=khongcokichthuoc?></strong>
                        </div>
                    <?php } ?>
                </div>
            </div>
            <div class="card card-primary card-outline text-sm">
                <div class="card-header">
                    <h3 class="card-title"><?="Thông tin"?></h3>
                </div>
                <div class="card-body">
                    <?php if (isset($config[$com][$type][$dfgallery][$val]['images_photo']) && $config[$com][$type][$dfgallery][$val]['images_photo'] == true) { ?>
                    <div class="form-group">
                        <label class="d-block" for="formFileMultiple" ><?="Hình ảnh"?>:</label>
                        <input type="file" name="files[]" id="formFileMultiple" multiple>
                    </div>
                    <?php } ?>
                    <div class="form-group">
                        <label class="d-block" for="regular_price"><?=gia?>:</label>
                        <div class="input-group">
                            <input type="text" class="form-control format-price regular_price text-sm" name="data[regular_price]" id="regular_price" placeholder="<?=gia?>" value="<?= (!empty($flash->has('regular_price'))) ? $flash->get('regular_price') : @$item['regular_price'] ?>">
                            <div class="input-group-append">
                                <div class="input-group-text"><strong>VNĐ</strong></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="d-block" for="sale_price"><?=giamoi?>:</label>
                        <div class="input-group">
                            <input type="text" class="form-control format-price sale_price text-sm" name="data[sale_price]" id="sale_price" placeholder="<?=giamoi?>" value="<?= (!empty($flash->has('sale_price'))) ? $flash->get('sale_price') : @$item['sale_price'] ?>">
                            <div class="input-group-append">
                                <div class="input-group-text"><strong>VNĐ</strong></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="d-block" for="discount"><?=chieckhau?>:</label>
                        <div class="input-group">
                            <input type="text" class="form-control discount text-sm" name="data[discount]" id="discount" placeholder="<?=chieckhau?>" value="<?= (!empty($flash->has('discount'))) ? $flash->get('discount') : @$item['discount'] ?>" maxlength="3" readonly>
                            <div class="input-group-append">
                                <div class="input-group-text"><strong>%</strong></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <?php if (isset($config[$com][$type][$dfgallery][$val]['check_photo'])) {
                            foreach ($config[$com][$type][$dfgallery][$val]['check_photo'] as $key => $value) { ?>
                                <div class="form-group d-inline-block mb-2 mr-2">
                                    <label for="<?= $key ?>-checkbox" class="d-inline-block align-middle mb-0 mr-2"><?= $value ?>:</label>
                                    <div class="custom-control custom-checkbox d-inline-block align-middle">
                                        <input type="checkbox" class="custom-control-input <?= $key ?>-checkbox" name="status[<?= $key ?>]" id="<?= $key ?>-checkbox" value="<?= $key ?>" checked>
                                        <label for="<?= $key ?>-checkbox" class="custom-control-label"></label>
                                    </div>
                                </div>
                        <?php }
                        } ?>
                    </div>
                </div>
            </div>
        <?php }else{ ?>
        <!-- Nút thêm -->
        <div id="photo-container"></div>
        <div class="mb-3"><button type="button" id="add-photo" class="btn btn-success">+ Thêm hình ảnh</button></div>
        <?php } ?>
        <div class="card-footer text-sm">
            <button type="submit" class="btn btn-sm bg-gradient-primary submit-check" disabled><i class="far fa-save mr-2"></i><?=luu?></button>
            <button type="submit" class="btn btn-sm bg-gradient-success submit-check" name="save-here" disabled><i class="far fa-save mr-2"></i><?=luutaitrang?></button>
            <button type="reset" class="btn btn-sm bg-gradient-secondary"><i class="fas fa-redo mr-2"></i><?=lamlai?></button>
            <a class="btn btn-sm bg-gradient-danger" href="<?= $linkMan ?>" title="<?=thoat?>"><i class="fas fa-sign-out-alt mr-2"></i><?=thoat?></a>
        </div>
    </form>
</section>

<!-- Template ẩn -->
<script type="text/template" id="photo-template">
    <div class="card card-primary card-outline text-sm photo-item">
        <div class="card-header">
            <h3 class="card-title">Ảnh số: __INDEX__</h3>
            <div class="card-tools">
                <button type="button" class="btn btn-sm btn-danger remove-photo"><i class="fas fa-minus"></i></button>
            </div>
        </div>
        <div class="card-body">
            <!-- Upload ảnh -->
            <div class="form-group">
                <div class="upload-file">
                    <p>Tải hình ảnh:</p>
                    <label class="upload-file-label mb-2" for="file__INDEX__">
                        <div class="upload-file-image rounded mb-3">
                            <img src="<?=ASSET . THUMBS?>/250x250x2/assets/images/noimage.png" class="rounded img-upload" width="250">
                        </div>
                        <div class="custom-file my-custom-file">
                            <input type="file" class="custom-file-input" name="file__INDEX__" id="file__INDEX__" lang="vi">
                            <label class="custom-file-label mb-0" for="file__INDEX__">Chọn file</label>
                        </div>
                    </label>
                    <p class=""><strong >Tên file:</strong> <span></span></p>
                    <strong class="d-block text-sm">Width: 250px - Height: 250px (jpg|png|gif)</strong>
                </div>
            </div>

            <!-- Video -->
            <div class="form-group">
                <label for="link_video__INDEX__">Video:</label>
                <input type="text" class="form-control text-sm" name="dataMulti[__INDEX__][link_video]" id="link_video__INDEX__" placeholder="Video">
            </div>

            <!-- Số thứ tự -->
            <div class="form-group">
                <label for="numb__INDEX__" class="d-inline-block align-middle mb-0 mr-2">Số thứ tự:</label>
                <input type="number" class="form-control form-control-mini d-inline-block align-middle text-sm" 
                       min="0" name="dataMulti[__INDEX__][numb]" id="numb__INDEX__" value="1">
            </div>
        </div>
    </div>
</script>