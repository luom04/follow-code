<?php
$linkMan = "product?act=man_attr&type=" . $type;
$linkSave = "product?act=save_attr&type=" . $type;
?>
<!-- Content Header -->
<section class="content-header text-sm">
    <div class="container-fluid">
        <div class="row">
            <ol class="breadcrumb float-sm-left">
                <li class="breadcrumb-item"><a href="index.php" title="<?=dashboard?>"><?=dashboard?></a></li>
                <li class="breadcrumb-item active"><?="Chi tiết thuộc tính"?></li>
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

        <?= $flash->getMessages('admin') ?>
        <div class="row">
            <div class=" <?= $config['product'][$type]['chu_attr']==true ? 'col-xl-12' : 'col-xl-8' ?>">
                <div class="card card-primary card-outline text-sm">
                    <div class="card-header">
                        <h3 class="card-title"><?= ($act == "edit_attr") ? capnhat : themmoi; ?> <?="thuộc tính"?></h3>
                    </div>
                    <div class="card-body">
                        <div class="card card-primary card-outline card-outline-tabs">
                            <div class="card-header p-0 border-bottom-0">
                                <ul class="nav nav-tabs" id="custom-tabs-three-tab-lang" role="tablist">
                                    <?php foreach ($config['website']['lang'] as $k => $v) { ?>
                                        <li class="nav-item">
                                            <a class="nav-link <?= ($k == 'vi') ? 'active' : '' ?>" id="tabs-lang" data-toggle="pill" href="#tabs-lang-<?= $k ?>" role="tab" aria-controls="tabs-lang-<?= $k ?>" aria-selected="true"><?= $v ?></a>
                                        </li>
                                    <?php } ?>
                                </ul>
                            </div>
                            <div class="card-body card-article">
                                <div class="tab-content" id="custom-tabs-three-tabContent-lang">
                                    <?php foreach ($config['website']['lang'] as $k => $v) { ?>
                                        <div class="tab-pane fade show <?= ($k == 'vi') ? 'active' : '' ?>" id="tabs-lang-<?= $k ?>" role="tabpanel" aria-labelledby="tabs-lang">
                                            <div class="form-group">
                                                <label for="name<?= $k ?>"><?=tieude?> (<?= $k ?>):</label>
                                                <input type="text" class="form-control for-seo text-sm" name="data[name<?= $k ?>]" id="name<?= $k ?>" placeholder="<?=tieude?> (<?= $k ?>)" value="<?= (!empty($flash->has('name' . $k))) ? $flash->get('name' . $k) : @$item['name' . $k] ?>" required>
                                            </div>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card card-primary card-outline text-sm">
                    <div class="card-header">
                        <h3 class="card-title">Thêm lựa chọn</h3>
                    </div>
                    <div class="card-body table-responsive">
                        <table class="table table-hover" id="options-table">
                            <thead>
                                <tr>
                                    <th class="align-middle text-center">STT</th>
                                    <th class="align-middle">Tiêu đề</th>
                                    <?php if($config['product'][$type]['color_attr']== true){ ?>
                                    <th class="align-middle">Màu sắc</th>
                                    <?php } ?>
                                    <?php if($config['product'][$type]['image_attr']== true){ ?>
                                    <th class="align-middle">Hình ảnh</th>
                                    <?php } ?>
                                    <th class="align-middle text-center">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if($options){ foreach($options as $key => $option){ ?>
                                <tr>
                                    <td class="align-middle">
                                        <input type="hidden" name="dataOption[<?=$key?>][id]" min="0" value="<?=$option['id']?>" />
                                        <input type="number" class="form-control form-control-mini m-auto" name="dataOption[<?=$key?>][numb]" min="0" value="<?=$option['numb']?>" />
                                    </td>
                                    <td class="align-middle">
                                        <input type="text" class="form-control text-sm" name="dataOption[<?=$key?>][namevi]" placeholder="Tiêu đề" value="<?=$option['namevi']?>" required>
                                    </td>
                                    <?php if($config['product'][$type]['color_attr']== true){ ?>
                                    <td class="align-middle">
                                        <input type="text" class="form-control text-sm" data-jscolor="{}" name="dataOption[<?=$key?>][color]" maxlength="7" value="<?=$option['color']?>">
                                    </td>
                                    <?php } ?>
                                    <?php if($config['product'][$type]['image_attr']== true){ ?>
                                    <td class="align-middle">
                                        <input type="text" class="form-control text-sm" name="dataOption[<?=$key?>][image]" placeholder="Hình ảnh" value="<?=$option['image']?>">
                                    </td>
                                    <?php } ?>
                                    <?php if($option['photo']){ ?>
                                        <td class="align-middle">
                                            <div class="mb-2 position-relative">
                                                <input type="hidden" name="dataOption[<?=$key?>][photo]" value="<?=$option['photo']?>">
                                                <img class="rounded" onerror="this.src='<?=ASSET . THUMBS?>/50x50x1/assets/images/noimage.png';" src="<?=ASSET . THUMBS . "/50x50x1/upload/attrs/" . $option['photo']?>" alt="Alt Photo">
                                                
                                            </div>
                                            <div class="custom-file my-custom-file">
                                                <input type="file" class="custom-file-input" name="dataOption[<?=$key?>][file]" lang="vi">
                                                <label class="custom-file-label mb-0" data-browse="Chọn">Chọn file</label>
                                            </div>

                                        </td>
                                    <?php } ?>

                                    <td class="align-middle text-center text-md text-nowrap">
                                        <a class="text-danger remove-option" href="javascript:;" title="Xóa"><i class="fas fa-trash-alt"></i></a>
                                    </td>
                                </tr>
                                <?php } } else {?>
                                <tr>
                                    <td class="align-middle">
                                        <input type="number" class="form-control form-control-mini m-auto" name="dataOption[1][numb]" min="0" value="1" />
                                    </td>
                                    <td class="align-middle">
                                        <input type="text" class="form-control text-sm" name="dataOption[1][namevi]" placeholder="Tiêu đề" value="" required>
                                    </td>
                                    <?php if($config['product'][$type]['color_attr']== true){ ?>
                                    <td class="align-middle">
                                        <input type="text" class="form-control text-sm" data-jscolor="{}" name="dataOption[1][color]" maxlength="7" value="#000000">
                                    </td>
                                    <?php } ?>
                                    <?php if($config['product'][$type]['image_attr']== true){ ?>
                                    <td class="align-middle">
                                        <input type="text" class="form-control text-sm" name="dataOption[1][image]" placeholder="Hình ảnh" value="">
                                    </td>
                                    <td class="align-middle">
                                        <div class="custom-file my-custom-file">
                                            <input type="file" class="custom-file-input" name="dataOption[1][file]" lang="vi">
                                            <label class="custom-file-label mb-0" data-browse="Chọn">Chọn file</label>
                                        </div>
                                    </td>
                                    <?php } ?>

                                    <td class="align-middle text-center text-md text-nowrap">
                                        <a class="text-danger remove-option" href="javascript:;" title="Xóa"><i class="fas fa-trash-alt"></i></a>
                                    </td>
                                </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer text-sm">
                        <a id="add-option" class="btn btn-sm bg-gradient-primary" href="javascript:;" title="Thêm lựa chọn">
                            <i class="fas fa-plus mr-2"></i>Thêm lựa chọn
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 <?= $config['product'][$type]['chu_attr']==true ? 'd-none' : '' ?>">
                <div class="card card-primary card-outline text-sm">
                    <div class="card-header">
                        <h3 class="card-title">Thông tin thuộc tính</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="type_show"><?="Trình bày"?>:</label>
                            <select class="custom-select text-sm" name="data[type_show]" id="type_show">
                                <option <?= (isset($item['type_show']) && $item['type_show'] == 0) ? "selected" : "" ?> value="0"><?="Chữ"?></option>
                                <option <?= (isset($item['type_show']) && $item['type_show'] == 1) ? "selected" : "" ?> value="1"><?="Màu"?></option>
                                <option <?= (isset($item['type_show']) && $item['type_show'] == 2) ? "selected" : "" ?> value="2"><?="Hình ảnh"?></option>
                            </select>
                        </div>
                        <div class="form-group">
                            <?php $status_array = (!empty($item['status'])) ? explode(',', $item['status']) : array(); ?>
                            <?php if (isset($config['product'][$type]['check_attr'])) {
                                foreach ($config['product'][$type]['check_attr'] as $key => $value) { ?>
                                    <div class="form-group d-inline-block mb-2 mr-2">
                                        <label for="<?= $key ?>-checkbox" class="d-inline-block align-middle mb-0 mr-2"><?= $value ?>:</label>
                                        <div class="custom-control custom-checkbox d-inline-block align-middle">
                                            <input type="checkbox" class="custom-control-input <?= $key ?>-checkbox" name="status[<?= $key ?>]" id="<?= $key ?>-checkbox" <?= (empty($status_array) && empty($item['id']) ? ($key == 'hienthi') : in_array($key, $status_array)) ? 'checked' : '' ?> value="<?= $key ?>">
                                            <label for="<?= $key ?>-checkbox" class="custom-control-label"></label>
                                        </div>
                                    </div>
                            <?php }
                            } ?>
                        </div>
                        <div class="form-group">
                            <label for="numb" class="d-inline-block align-middle mb-0 mr-2"><?=sothutu?>:</label>
                            <input type="number" class="form-control form-control-mini d-inline-block align-middle text-sm" min="0" name="data[numb]" id="numb" placeholder="<?=sothutu?>" value="<?= isset($item['numb']) ? $item['numb'] : 1 ?>">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-footer text-sm">
            <button type="submit" class="btn btn-sm bg-gradient-primary submit-check" disabled><i class="far fa-save mr-2"></i><?=luu?></button>
            <button type="submit" class="btn btn-sm bg-gradient-success submit-check" name="save-here" disabled><i class="far fa-save mr-2"></i><?=luutaitrang?></button>
            <button type="reset" class="btn btn-sm bg-gradient-secondary"><i class="fas fa-redo mr-2"></i><?=lamlai?></button>
            <a class="btn btn-sm bg-gradient-danger" href="<?= $linkMan ?>" title="<?=thoat?>"><i class="fas fa-sign-out-alt mr-2"></i><?=thoat?></a>
            <input type="hidden" name="id" value="<?= (isset($item['id']) && $item['id'] > 0) ? $item['id'] : '' ?>">
        </div>
    </form>
</section>

<!-- Template ẩn -->
<script type="text/template" id="option-template">
    <tr>
        <td class="align-middle text-center stt">
            <input type="number" class="form-control form-control-mini m-auto" name="dataOption[__i__][numb]" min="0" value="__i__" />
        </td>
        <td class="align-middle">
            <input type="text" class="form-control text-sm" name="dataOption[__i__][namevi]" placeholder="Tiêu đề" required>
        </td>
        <?php if($config['product'][$type]['color_attr']== true){ ?>
        <td class="align-middle">
            <input type="text" class="form-control text-sm" data-jscolor="{}" name="dataOption[__i__][color]" value="#000000">
        </td>
        <?php } ?>
        <?php if($config['product'][$type]['image_attr']== true){ ?>
        <td class="align-middle">
            <input type="text" class="form-control text-sm" name="dataOption[__i__][image]" placeholder="Hình ảnh" value="">
        </td>
        <td class="align-middle">
            <div class="custom-file my-custom-file">
                <input type="file" class="custom-file-input" name="dataOption[__i__][file]" lang="vi">
                <label class="custom-file-label mb-0" data-browse="Chọn">Chọn file</label>
            </div>
        </td>
        <?php } ?>

        <td class="align-middle text-center text-md text-nowrap">
            <a class="text-danger remove-option" href="javascript:;" title="Xóa">
                <i class="fas fa-trash-alt"></i>
            </a>
        </td>
    </tr>
</script>