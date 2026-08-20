<?php
if ($act == "add")
    $labelAct = "Thêm mới";
else if ($act == "edit")
    $labelAct = chinhsua;
else if ($act == "copy")
    $labelAct = "Sao chép";

$linkMan = "product?act=man&type=" . $type;
if ($act == 'add')
    $linkFilter = "product?act=add&type=" . $type;
else if ($act == 'edit')
    $linkFilter = "product?act=edit&type=" . $type . "&id=" . $id;
if ($act == "copy")
    $linkSave = "product?act=save_copy&type=" . $type;
else
    $linkSave = "product?act=save&type=" . $type;

/* Check cols */
if (isset($config['product'][$type]['gallery']) && count($config['product'][$type]['gallery']) > 0) {
    foreach ($config['product'][$type]['gallery'] as $key => $value) {
        if ($key == $type) {
            $keyGallery = $key;
            $flagGallery = true;
            break;
        }
    }
}

if (
    (isset($config['product'][$type]['dropdown']) && $config['product'][$type]['dropdown'] == true) ||
    (isset($config['product'][$type]['brand']) && $config['product'][$type]['brand'] == true) ||
    (isset($config['product'][$type]['tags']) && $config['product'][$type]['tags'] == true) ||
    (isset($config['product'][$type]['color']) && $config['product'][$type]['color'] == true) ||
    (isset($config['product'][$type]['size']) && $config['product'][$type]['size'] == true) ||
    (isset($config['product'][$type]['regular_price']) && $config['product'][$type]['regular_price'] == true) ||
    (isset($config['product'][$type]['images']) && $config['product'][$type]['images'] == true)
) {
    $colLeft = "col-xl-8";
    $colRight = "col-xl-4";
} else {
    $colLeft = "col-12";
    $colRight = "d-none";
}

?>

<script type="text/template" id="variant-card-template">
  <div class="card mb-2 variant-card" data-key="__KEY__">
    <div class="card-header bg-light d-flex justify-content-between align-items-center">
      <span class="variant-title">__LABEL__</span>
      <button type="button" class="btn btn-sm btn-link toggle-variant ml-auto collapsed"
              data-toggle="collapse" data-target="#variant-body-__ID__">
        <i class="fas fa-chevron-down"></i>
      </button>
    </div>
    <div id="variant-body-__ID__" class="collapse">
      <div class="card-body">
        <input type="hidden" name="variants[__KEY__][combination_key]" value="__KEY__">
        __VARIANT_OPTIONS__
        <div class="form-row">
          <div class="form-group col-md-4">
            <label>Mã sản phẩm</label>
            <input type="text" name="variants[__KEY__][sku]" value="__SKU__" class="form-control">
          </div>
          <div class="form-group col-md-4">
            <label>Tên tổ hợp</label>
            <input type="text" name="variants[__KEY__][comboName]" value="__COMBO_NAME__" class="form-control">
          </div>
          <div class="form-group col-md-4">
            <label>Giá bán</label>
            <div class="input-group">
                <input type="text" name="variants[__KEY__][price]" value="__PRICE__" class="format-price form-control">
                <div class="input-group-append">
                    <div class="input-group-text"><strong>VNĐ</strong></div>
                </div>
            </div>
          </div>
          <div class="form-group col-md-4">
            <label>Giá giảm</label>
            <div class="input-group">
                <input type="text" name="variants[__KEY__][discount]" value="__DISCOUNT__" class="format-price form-control">
                <div class="input-group-append">
                    <div class="input-group-text"><strong>VNĐ</strong></div>
                </div>
            </div>
            
          </div>
          <div class="form-group col-md-4">
            <label>Khối lượng (gram)</label>
            <input type="number" name="variants[__KEY__][weight]" value="__WEIGHT__" class="form-control">
          </div>
          <div class="form-group col-md-4">
            <label>% Giảm</label>

            <div class="input-group">
                <input type="number" name="variants[__KEY__][percent]" value="__PERCENT__" class=" form-control" min="0" max="100">
                <div class="input-group-append">
                    <div class="input-group-text"><strong>%</strong></div>
                </div>
            </div>
          </div>
          <div class="form-group col-md-4">
            <label>Thứ tự</label>
            <input type="number" name="variants[__KEY__][sort]" value="__SORT__" class="form-control">
          </div>
          <div class="form-group col-md-6">
            <label>Hình ảnh</label>
            <div class="thumb">
                <img src="__IMAGE__" alt="preview" class="preview">
                <span class="remove">&times;</span>
            </div>
            <input type="file" name="variants[__KEY__][photo]" class="d-none file-input">
            __INPUT_IMAGE__
          </div>
        </div>
      </div>
    </div>
  </div>
</script>

<!-- Template upload ảnh cho option -->
<script type="text/template" id="option-image-template">
  <div class="form-group option-image-item mb-2" data-value="__VALUE__" data-size-key="__SIZEKEY__">
    <label><strong class="text-split text-split-1">__OPTION__</strong></label>
    <div class="thumb">
      <img src="assets/images/noimage.png" alt="preview" class="preview">
      <span class="remove">&times;</span>
    </div>
    <input type="hidden" name="options[__ATTR__][__VALUE__][option_id]" value="__VALUE__">
    <input type="hidden" name="options[__ATTR__][__VALUE__][name]" value="__OPTION__">
    <input type="hidden" name="options[__ATTR__][__VALUE__][color]" value="__OPTION_COLOR__">
    <input type="file"   name="options[__ATTR__][__VALUE__][image]" class="d-none file-input">
    <input type="number" name="options[__ATTR__][__VALUE__][sort]" value="0" class="sort form-control mt-1" placeholder="Thứ tự">
    <div class="preview mt-1"></div>
  </div>
</script>

<!-- Content Header -->
<section class="content-header text-sm">
    <div class="container-fluid">
        <div class="row">
            <ol class="breadcrumb float-sm-left">
                <li class="breadcrumb-item"><a href="index.php" title="<?= dashboard ?>"><?= dashboard ?></a></li>
                <li class="breadcrumb-item active"><?= $labelAct ?> <?= $config['product'][$type]['title_main'] ?></li>
            </ol>
        </div>
    </div>
</section>

<!-- Main content -->
<section class="content">
    <form class="validation-form" novalidate method="post" action="<?= $linkSave ?>" enctype="multipart/form-data">
        <div class="card-footer text-sm sticky-top">
            <button type="submit" class="btn btn-sm bg-gradient-primary submit-check" disabled><i
                    class="far fa-save mr-2"></i><?= luu ?></button>
            <button type="submit" class="btn btn-sm bg-gradient-success submit-check" name="save-here" disabled><i
                    class="far fa-save mr-2"></i><?= luutaitrang ?></button>
             <?php if (count($config['website']['lang']) >= 2) { ?>
                <button type="button" class="btn btn-sm bg-gradient-danger translate-with-ai">Dịch AI</button>
                <button type="button" class="btn btn-sm bg-yellow text-white slugchange2">Lấy slug</button>
            <?php } ?>
            <button type="reset" class="btn btn-sm bg-gradient-secondary"><i
                    class="fas fa-redo mr-2"></i><?= lamlai ?></button>
            <a class="btn btn-sm bg-gradient-danger" href="<?= $linkMan ?>" title="<?= thoat ?>"><i
                    class="fas fa-sign-out-alt mr-2"></i><?= thoat ?></a>
        </div>

        <?= $flash->getMessages('admin') ?>

        <div class="row">
            <div class="<?= $colLeft ?>">
                <?php
                if (isset($config['product'][$type]['slug']) && $config['product'][$type]['slug'] == true) {
                    $slugchange = ($act == 'edit') ? 1 : 0;
                    $copy = ($act != 'copy') ? 0 : 1;
                    include TEMPLATE . LAYOUT . "slug.php";
                }
                $attributes = $attributes ?? [];
                $attrIds = !empty($attributes) ? array_column($attributes, 'attribute_id') : [];
                ?>
                <!-- Thuộc tính -->
                <?php if (isset($config['product'][$type]['attr']) && $config['product'][$type]['attr'] == true) { ?>
                    <div class="card card-primary card-outline text-sm">
                        <div class="card-header">
                            <h3 class="card-title">Thuộc tính <?= $config['product'][$type]['title_main'] ?></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                        class="fas fa-minus"></i></button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label class="d-block">Chọn thuộc tính</label>
                                <select id="id_attr" name="attributes[]" class="select multiselect" multiple>
                                    <?php foreach ($defaultAttributes as $attribute) {
                                        $selected = in_array($attribute['id'], array_column($attributes, 'attribute_id')) ? 'selected' : '';
                                        ?>
                                        <option value="<?= $attribute['id'] ?>" data-name="<?= $attribute['namevi'] ?>"
                                            <?= $selected ?>><?= $attribute['namevi'] ?></option>
                                    <?php } ?>
                                </select>
                            </div>

                            <div class="row" id="attribute-options">
                                <?php foreach ($defaultAttributes as $attribute) {
                                    $options = $d->rawQuery("SELECT * FROM #_attribute_options WHERE attribute_id = ? ORDER BY numb, id ASC", [$attribute['id']]);
                                    $attrSelected = in_array($attribute['id'], array_column($attributes, 'attribute_id'));
                                    ?>
                                    <div class="form-group col-sm-6 attr-options <?= $attrSelected ? '' : 'd-none' ?>"
                                        id="attr-<?= $attribute['id'] ?>">
                                        <label class="d-block"><?= $attribute['namevi'] ?></label>
                                        <select class="select multiselect attr-select" multiple
                                            data-attr="<?= $attribute['id'] ?>" data-attr-name="<?= $attribute['namevi'] ?>">
                                            <?php foreach ($options as $option) {
                                                $selected = '';
                                                if (!empty($optionsByAttr[$attribute['id']])) {
                                                    foreach ($optionsByAttr[$attribute['id']] as $optSaved) {
                                                        if ($optSaved['option_id'] == $option['id']) {
                                                            $selected = 'selected';
                                                            break;
                                                        }
                                                    }
                                                }
                                                ?>
                                                <option value="<?= $option['id'] ?>" data-option-color="<?= $option['color'] ?>"
                                                    <?= $selected ?>><?= $option['namevi'] ?></option>
                                            <?php } ?>
                                        </select>
                                        <div class="option-images mt-2 <?= $config['product'][$type]['images_attr']==false ? 'd-none' : '' ?>" id="option-images-<?= $attribute['id'] ?>">
                                            <?php if (!empty($optionsByAttr[$attribute['id']])) {
                                                foreach ($optionsByAttr[$attribute['id']] as $optSaved) { ?>
                                                    <div class="form-group option-image-item"
                                                        data-value="<?= $func->changeTitle($optSaved['name']) ?>">
                                                        <label><strong
                                                                class="text-split text-split-1"><?= $optSaved['name'] ?></strong></label>
                                                        <div class="thumb">
                                                            <img src="<?= $optSaved['image'] ? UPLOAD_ATTR . $optSaved['image'] : 'assets/images/noimage.png' ?>"
                                                                alt="preview" class="preview">
                                                            <span class="remove">&times;</span>
                                                        </div>
                                                        <input type="hidden"
                                                            name="options[<?= $attribute['id'] ?>][<?= $optSaved['option_id'] ?>][option_id]"
                                                            value="<?= $optSaved['option_id'] ?>">
                                                        <input type="hidden"
                                                            name="options[<?= $attribute['id'] ?>][<?= $optSaved['option_id'] ?>][name]"
                                                            value="<?= $optSaved['name'] ?>">
                                                        <input type="hidden"
                                                            name="options[<?= $attribute['id'] ?>][<?= $optSaved['option_id'] ?>][color]"
                                                            value="<?= $optSaved['color'] ?>">
                                                        <input type="hidden"
                                                            name="options[<?= $attribute['id'] ?>][<?= $optSaved['option_id'] ?>][photo]"
                                                            value="<?= $optSaved['image'] ?>" class="image-input">
                                                        <input type="file"
                                                            name="options[<?= $attribute['id'] ?>][<?= $optSaved['option_id'] ?>][image]"
                                                            class="d-none file-input">
                                                        <input type="number"
                                                            name="options[<?= $attribute['id'] ?>][<?= $optSaved['option_id'] ?>][sort]"
                                                            value="<?= $optSaved['sort_order'] ?>" class="sort form-control mt-1"
                                                            placeholder="Thứ tự">
                                                    </div>
                                                <?php }
                                            } ?>
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>

                            <!-- Bảng tổ hợp -->
                            <div id="variant-cards" class="d-none"></div>
                        </div>
                    </div>
                <?php } ?>
                <div class="card card-primary card-outline text-sm">
                    <div class="card-header">
                        <h3 class="card-title"><?= noidung ?> <?= $config['product'][$type]['title_main'] ?></h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                    class="fas fa-minus"></i></button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="card card-primary card-outline card-outline-tabs">
                            <div class="card-header p-0 border-bottom-0">
                                <ul class="nav nav-tabs" id="custom-tabs-three-tab-lang" role="tablist">
                                    <?php foreach ($config['website']['lang'] as $k => $v) { ?>
                                        <li class="nav-item">
                                            <a class="nav-link <?= ($k == 'vi') ? 'active' : '' ?>" id="tabs-lang"
                                                data-toggle="pill" href="#tabs-lang-<?= $k ?>" role="tab"
                                                aria-controls="tabs-lang-<?= $k ?>" aria-selected="true"><?= $v ?></a>
                                        </li>
                                    <?php } ?>
                                </ul>
                            </div>
                            <div class="card-body card-article">
                                <div class="tab-content" id="custom-tabs-three-tabContent-lang">
                                    <?php foreach ($config['website']['lang'] as $k => $v) { ?>
                                        <div class="tab-pane fade show <?= ($k == 'vi') ? 'active' : '' ?>"
                                            id="tabs-lang-<?= $k ?>" role="tabpanel" aria-labelledby="tabs-lang">
                                            <div class="form-group">
                                                <label for="name<?= $k ?>"><?= tieude ?> (<?= $k ?>):</label>
                                                <input type="text" class="form-control for-seo text-sm"
                                                    name="data[name<?= $k ?>]" id="name<?= $k ?>"
                                                    placeholder="<?= tieude ?> (<?= $k ?>)"
                                                    value="<?= (!empty($flash->has('name' . $k))) ? $flash->get('name' . $k) : @$item['name' . $k] ?>"
                                                    required>
                                            </div>
                                            <?php if (isset($config['product'][$type]['desc']) && $config['product'][$type]['desc'] == true) { ?>
                                                <div class="form-group">
                                                    <label for="desc<?= $k ?>"><?= "Mô tả" ?> (<?= $k ?>):</label>
                                                    <textarea data-height="300"
                                                        class="form-control for-seo text-sm <?= (isset($config['product'][$type]['desc_cke']) && $config['product'][$type]['desc_cke'] == true) ? 'form-control-ckeditor' : '' ?>"
                                                        name="data[desc<?= $k ?>]" id="desc<?= $k ?>" rows="5"
                                                        placeholder="<?= mota ?> (<?= $k ?>)"><?= $func->decodeHtmlChars($flash->get('desc' . $k)) ?: $func->decodeHtmlChars(@$item['desc' . $k]) ?></textarea>
                                                </div>
                                            <?php } ?>
                                            <?php if (isset($config['product'][$type]['thongso']) && $config['product'][$type]['thongso'] == true) { ?>
                                                <div class="form-group">
                                                    <label for="thongso<?= $k ?>"><?= "Thông số kỹ thuật" ?>
                                                        (<?= $k ?>):</label>
                                                    <textarea data-height="300"
                                                        class="form-control text-sm <?= (isset($config['product'][$type]['thongso_cke']) && $config['product'][$type]['thongso_cke'] == true) ? 'form-control-ckeditor' : '' ?>"
                                                        name="data[thongso<?= $k ?>]" id="thongso<?= $k ?>" rows="5"
                                                        placeholder="<?= noidung ?> (<?= $k ?>)"><?= $func->decodeHtmlChars($flash->get('thongso' . $k)) ?: $func->decodeHtmlChars(@$item['thongso' . $k]) ?></textarea>
                                                </div>
                                            <?php } ?>
                                            <?php if (isset($config['product'][$type]['content']) && $config['product'][$type]['content'] == true) { ?>
                                                <div class="form-group">
                                                    <label for="content<?= $k ?>"><?= noidung ?> (<?= $k ?>):</label>
                                                    <button class="content-with-ai" data-lang="<?= $k ?>"
                                                        data-com="<?= $com ?>">Viết AI</button>
                                                    <textarea data-height="500"
                                                        class="form-control for-seo text-sm <?= (isset($config['product'][$type]['content_cke']) && $config['product'][$type]['content_cke'] == true) ? 'form-control-ckeditor' : '' ?>"
                                                        name="data[content<?= $k ?>]" id="content<?= $k ?>" rows="5"
                                                        placeholder="<?= noidung ?> (<?= $k ?>)"><?= $func->decodeHtmlChars($flash->get('content' . $k)) ?: $func->decodeHtmlChars(@$item['content' . $k]) ?></textarea>
                                                </div>
                                            <?php } ?>
                                            <?php if (isset($config['product'][$type]['quatang']) && $config['product'][$type]['quatang'] == true) { ?>
                                                <div class="form-group">
                                                    <label for="quatang<?= $k ?>"><?= "Quà tặng" ?> (<?= $k ?>):</label>
                                                    <textarea data-height="300"
                                                        class="form-control for-seo text-sm <?= (isset($config['product'][$type]['quatang_cke']) && $config['product'][$type]['quatang_cke'] == true) ? 'form-control-ckeditor' : '' ?>"
                                                        name="data[quatang<?= $k ?>]" id="quatang<?= $k ?>" rows="5"
                                                        placeholder="<?= mota ?> (<?= $k ?>)"><?= $func->decodeHtmlChars($flash->get('quatang' . $k)) ?: $func->decodeHtmlChars(@$item['quatang' . $k]) ?></textarea>
                                                </div>
                                            <?php } ?>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <div class="<?= $colRight ?>">
                <?php if (
                    (isset($config['product'][$type]['dropdown']) && $config['product'][$type]['dropdown'] == true) ||
                    (isset($config['product'][$type]['brand']) && $config['product'][$type]['brand'] == true) ||
                    (isset($config['product'][$type]['tags']) && $config['product'][$type]['tags'] == true) ||
                    (isset($config['product'][$type]['color']) && $config['product'][$type]['color'] == true) ||
                    (isset($config['product'][$type]['size']) && $config['product'][$type]['size'] == true)
                ) { ?>
                    <div class="card card-primary card-outline text-sm">
                        <div class="card-header">
                            <h3 class="card-title">Danh mục <?= $config['product'][$type]['title_main'] ?></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                        class="fas fa-minus"></i></button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="form-group-category row">
                                <div class="form-group col-xl-12 col-sm-12">
                                    <label class="d-block" for="id_list">Danh mục sản phẩm:</label>
                                    <?= $func->getAllCategory('product', $type, @$item['id_danhmuc']) ?>
                                </div>
                                <?php if (isset($config['product'][$type]['dropdown']) && $config['product'][$type]['dropdown'] == true) { ?>
                                    <?php if (isset($config['product'][$type]['list']) && $config['product'][$type]['list'] == true) { ?>
                                        <div class="form-group col-xl-6 col-sm-4">
                                            <label class="d-block"
                                                for="id_list"><?= $config['product'][$type]['title_main_list'] ?>:</label>
                                            <?= $func->getAjaxCategory('product', 'list', $type) ?>
                                        </div>
                                    <?php } ?>
                                    <?php if (isset($config['product'][$type]['cat']) && $config['product'][$type]['cat'] == true) { ?>
                                        <div class="form-group col-xl-6 col-sm-4">
                                            <label class="d-block"
                                                for="id_cat"><?= $config['product'][$type]['title_main_cat'] ?>:</label>
                                            <?= $func->getAjaxCategory('product', 'cat', $type) ?>
                                        </div>
                                    <?php } ?>
                                    <?php if (isset($config['product'][$type]['item']) && $config['product'][$type]['item'] == true) { ?>
                                        <div class="form-group col-xl-6 col-sm-4">
                                            <label class="d-block" for="id_item"><?= danhmuccap3 ?>:</label>
                                            <?= $func->getAjaxCategory('product', 'item', $type) ?>
                                        </div>
                                    <?php } ?>
                                    <?php if (isset($config['product'][$type]['sub']) && $config['product'][$type]['sub'] == true) { ?>
                                        <div class="form-group col-xl-6 col-sm-4">
                                            <label class="d-block" for="id_sub"><?= danhmuccap4 ?>:</label>
                                            <?= $func->getAjaxCategory('product', 'sub', $type) ?>
                                        </div>
                                    <?php } ?>
                                <?php } ?>
                                <?php if (isset($config['product'][$type]['muakem']) && $config['product'][$type]['muakem'] == true) { ?>
                                    <div class="form-group col-xl-6 col-sm-4">
                                        <label class="d-block" for="id_tags">Sản phẩm mua kèm:</label>
                                        <?= $func->getProductIds(@$item['id'], 'dataMuakem', 'product', $type) ?>
                                    </div>
                                <?php } ?>
                                <?php if (isset($config['product'][$type]['brand']) && $config['product'][$type]['brand'] == true) { ?>
                                    <div class="form-group col-xl-6 col-sm-4">
                                        <label class="d-block"
                                            for="id_brand"><?= $config['product'][$type]['title_main_brand'] ?>:</label>
                                        <?= $func->getAjaxCategory('product', 'brand', $type, 'Chọn ' . $config['product'][$type]['title_main_brand']) ?>
                                    </div>
                                <?php } ?>
                                <?php if (isset($config['product'][$type]['tags']) && $config['product'][$type]['tags'] == true) { ?>
                                    <div class="form-group col-xl-6 col-sm-4">
                                        <label class="d-block" for="id_tags"><?= danhmuctags ?>:</label>
                                        <?= $func->getTags(@$item['id'], 'dataTags', 'product_tags', $type) ?>
                                    </div>
                                <?php } ?>
                                <?php if (isset($config['product'][$type]['color']) && $config['product'][$type]['color'] == true) { ?>
                                    <div class="form-group col-xl-6 col-sm-4">
                                        <label class="d-block"
                                            for="id_color"><?= $config['product'][$type]['title_main_color'] ?>:</label>
                                        <?= $func->getColor(@$item['id']) ?>
                                    </div>
                                <?php } ?>
                                <?php if (isset($config['product'][$type]['size']) && $config['product'][$type]['size'] == true) { ?>
                                    <div class="form-group col-xl-6 col-sm-4">
                                        <label class="d-block"
                                            for="id_size"><?= $config['product'][$type]['title_main_size'] ?>:</label>
                                        <?= $func->getSize(@$item['id']) ?>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                <?php } ?>
                <div class="card card-primary card-outline text-sm">
                    <div class="card-header">
                        <h3 class="card-title">Thông tin <?= $config['product'][$type]['title_main'] ?></h3>
                        <div class="card-tools">
                            <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                    class="fas fa-minus"></i></button>
                        </div>
                    </div>
                    <div class="card-body">

                        <div class="row">
                            <?php if (isset($config['product'][$type]['external_link']) && $config['product'][$type]['external_link'] == true) { ?>
                                <div class="form-group col-md-12">
                                    <label class="d-block" for="external_link"><?= "Link demo" ?>:</label>
                                    <input type="text" class="form-control text-sm" name="data[external_link]"
                                        id="external_link" placeholder="<?= "Link demo" ?>"
                                        value="<?= (!empty($flash->has('external_link'))) ? $flash->get('external_link') : @$item['external_link'] ?>">
                                </div>
                            <?php } ?>
                            <?php if (isset($config['product'][$type]['code']) && $config['product'][$type]['code'] == true) { ?>
                                <div class="form-group col-md-12">
                                    <label class="d-block" for="code"><?= masp ?>:</label>
                                    <input type="text" class="form-control text-sm" name="data[code]" id="code"
                                        placeholder="<?= masp ?>"
                                        value="<?= (!empty($flash->has('code'))) ? $flash->get('code') : @$item['code'] ?>">
                                </div>
                            <?php } ?>
                            <?php if (isset($config['product'][$type]['baohanh']) && $config['product'][$type]['baohanh'] == true) { ?>
                                <div class="form-group col-md-12">
                                    <label class="d-block" for="baohanh"><?= "Bảo hành" ?>:</label>
                                    <input type="text" class="form-control text-sm" name="dataAttrs[baohanh]" id="baohanh"
                                        placeholder="<?= "Bảo hành" ?>"
                                        value="<?= (!empty($flash->has('baohanh'))) ? $flash->get('baohanh') : @$attrs['baohanh'] ?>">
                                </div>
                            <?php } ?>
                            <?php if (isset($config['product'][$type]['regular_price']) && $config['product'][$type]['regular_price'] == true) { ?>
                                <div class="form-group col-md-6">
                                    <label class="d-block" for="regular_price"><?= gia ?>:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control format-price regular_price text-sm"
                                            name="data[regular_price]" id="regular_price" placeholder="<?= gia ?>"
                                            value="<?= (!empty($flash->has('regular_price'))) ? $flash->get('regular_price') : @$item['regular_price'] ?>">
                                        <div class="input-group-append">
                                            <div class="input-group-text"><strong>VNĐ</strong></div>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if (isset($config['product'][$type]['sale_price']) && $config['product'][$type]['sale_price'] == true) { ?>
                                <div class="form-group col-md-6">
                                    <label class="d-block" for="sale_price"><?= giamoi ?>:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control format-price sale_price text-sm"
                                            name="data[sale_price]" id="sale_price" placeholder="<?= giamoi ?>"
                                            value="<?= (!empty($flash->has('sale_price'))) ? $flash->get('sale_price') : @$item['sale_price'] ?>">
                                        <div class="input-group-append">
                                            <div class="input-group-text"><strong>VNĐ</strong></div>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>

                            <?php if (isset($config['product'][$type]['discount']) && $config['product'][$type]['discount'] == true) { ?>

                                <div class="form-group col-md-6">
                                    <label class="d-block" for="discount"><?= chieckhau ?>:</label>
                                    <div class="input-group">
                                        <input type="number" class="form-control discount_price text-sm"
                                            name="data[discount]" id="discount" placeholder="<?= chieckhau ?>"
                                            value="<?= (!empty($flash->has('discount'))) ? $flash->get('discount') : @$item['discount'] ?>"
                                            maxlength="3">
                                        <div class="input-group-append">
                                            <div class="input-group-text"><strong>%</strong></div>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if (isset($config['product'][$type]['quatang']) && $config['product'][$type]['quatang'] == true) { ?>
                                <div class="form-group col-md-6">
                                    <label class="d-block" for="pre_price"><?= "Giá trị quà tặng kèm theo" ?>:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control format-price pre_price text-sm"
                                            name="data[pre_price]" id="pre_price" placeholder="<?= giamoi ?>"
                                            value="<?= (!empty($flash->has('pre_price'))) ? $flash->get('pre_price') : @$item['pre_price'] ?>">
                                        <div class="input-group-append">
                                            <div class="input-group-text"><strong>VNĐ</strong></div>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if (isset($config['product'][$type]['linkvideo']) && $config['product'][$type]['linkvideo'] == true) { ?>
                                <div class="form-group col-md-12">
                                    <label class="d-block" for="video"><?= "Link Video" ?>:</label>
                                    <input type="text" class="form-control text-sm" name="dataAttrs[video]" id="video"
                                        placeholder="<?= "Link Video" ?>"
                                        value="<?= (!empty($flash->has('video'))) ? $flash->get('video') : @$attrs['video'] ?>">
                                </div>
                            <?php } ?>

                        </div>
                        <div class="form-group">
                            <?php $status_array = (!empty($item['status'])) ? explode(',', $item['status']) : array(); ?>
                            <?php if (isset($config['product'][$type]['check'])) {
                                foreach ($config['product'][$type]['check'] as $key => $value) { ?>
                                    <div class="form-group d-inline-block mb-2 mr-2">
                                        <label for="<?= $key ?>-checkbox"
                                            class="d-inline-block align-middle mb-0 mr-2"><?= $value ?>:</label>
                                        <div class="custom-control custom-checkbox d-inline-block align-middle">
                                            <input type="checkbox" class="custom-control-input <?= $key ?>-checkbox"
                                                name="status[<?= $key ?>]" id="<?= $key ?>-checkbox" <?= (empty($status_array) && empty($item['id']) ? ($key == 'hienthi') : in_array($key, $status_array)) ? 'checked' : '' ?> value="<?= $key ?>">
                                            <label for="<?= $key ?>-checkbox" class="custom-control-label"></label>
                                        </div>
                                    </div>
                                <?php }
                            } ?>
                        </div>
                        <div class="form-group">
                            <label for="numb" class="d-inline-block align-middle mb-0 mr-2"><?= sothutu ?>:</label>
                            <input type="number"
                                class="form-control form-control-mini w-25 text-left d-inline-block align-middle text-sm"
                                min="0" name="data[numb]" id="numb" placeholder="<?= sothutu ?>"
                                value="<?= isset($item['numb']) ? $item['numb'] : 1 ?>">
                        </div>
                    </div>
                </div>
                <?php if (isset($config['product'][$type]['boloc']) && $config['product'][$type]['boloc'] == true) { ?>
                    <div class="card card-primary card-outline text-sm">
                        <div class="card-header">
                            <h3 class="card-title">Thông tin bộ lọc</h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                        class="fas fa-minus"></i></button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <?php if (isset($config['product'][$type]['city']) && $config['product'][$type]['city'] == true) { ?>
                                    <div class="form-group col-xl-6 col-sm-4">
                                        <label class="d-block" for="id_city">Tỉnh/thành phố:</label>
                                        <?= $func->getAjaxPlace('city', 'Chọn tỉnh/thành phố') ?>
                                    </div>
                                <?php } ?>
                                <?php if (isset($config['product'][$type]['ward']) && $config['product'][$type]['ward'] == true) { ?>
                                    <div class="form-group col-xl-6 col-sm-4">
                                        <label class="d-block" for="id_ward">Quận/huyện:</label>
                                        <?= $func->getAjaxPlace('ward', 'Chọn quận/huyện') ?>
                                    </div>
                                <?php } ?>
                                <?php if (isset($config['product'][$type]['regular_price']) && $config['product'][$type]['regular_price'] == true) { ?>
                                    <div class="form-group col-md-6">
                                        <label class="d-block" for="regular_price"><?= gia ?>:</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control format-price regular_price text-sm"
                                                name="data[regular_price]" id="regular_price" placeholder="<?= gia ?>"
                                                value="<?= (!empty($flash->has('regular_price'))) ? $flash->get('regular_price') : @$item['regular_price'] ?>">
                                            <div class="input-group-append">
                                                <div class="input-group-text"><strong>VNĐ</strong></div>
                                            </div>
                                        </div>
                                    </div>
                                <?php } ?>
                                <?php if (isset($config['product'][$type]['area']) && $config['product'][$type]['area'] == true) { ?>
                                    <div class="form-group col-md-6">
                                        <label class="d-block" for="id_area">Diện tích:</label>
                                        <input type="text"
                                            oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                            class="form-control text-sm" name="data[id_area]" id="id_area"
                                            placeholder="Diện tích"
                                            value="<?= (!empty($flash->has('id_area'))) ? $flash->get('id_area') : @$item['id_area'] ?>">
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                <?php } ?>
                <?php if (isset($config['product'][$type]['icon']) && $config['product'][$type]['icon'] == true) { ?>
                    <div class="card card-primary card-outline text-sm">
                        <div class="card-header">
                            <h3 class="card-title">Icon <?= $config['product'][$type]['title_main'] ?></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                        class="fas fa-minus"></i></button>
                            </div>
                        </div>
                        <div class="card-body">
                            <?php
                            /* Photo detail */
                            $photoDetail1 = array();
                            $photoDetail1['upload'] = UPLOAD_PRODUCT_L;
                            $photoAction = 'icon';
                            $photoDetail1['image'] = (!empty($item) && $act != 'copy') ? $item['icon'] : '';
                            $photoDetail1['dimension'] = "Width: " . $config['product'][$type]['width_icon'] . " px - Height: " . $config['product'][$type]['height_icon'] . " px (" . $config['product'][$type]['img_type'] . ")";
                            /* Image */
                            include TEMPLATE . LAYOUT . "image1.php";
                            ?>
                        </div>
                    </div>
                <?php } ?>
                <?php if (isset($config['product'][$type]['images']) && $config['product'][$type]['images'] == true) { ?>
                    <div class="card card-primary card-outline text-sm">
                        <div class="card-header">
                            <h3 class="card-title"><?= hinhanh ?>     <?= $config['product'][$type]['title_main'] ?></h3>
                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                        class="fas fa-minus"></i></button>
                            </div>
                        </div>
                        <div class="card-body">
                            <?php
                            /* Photo detail */
                            $photoDetail = array();
                            $photoDetail['upload'] = UPLOAD_PRODUCT_L;
                            $photoAction = 'photo';
                            $photoDetail['image'] = (!empty($item) && $act != 'copy') ? $item['photo'] : '';
                            $photoDetail['dimension'] = "Width: " . $config['product'][$type]['width'] . " px - Height: " . $config['product'][$type]['height'] . " px (" . $config['product'][$type]['img_type'] . ")";

                            /* Image */
                            include TEMPLATE . LAYOUT . "image.php";
                            ?>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>

        <div class="card card-primary card-outline text-sm">
            <div class="card-header">
                <h3 class="card-title"><?= bosuutap ?> <?= $config['product'][$type]['title_main'] ?></h3>
                <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                            class="fas fa-minus"></i></button>
                </div>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <input type="file" name="files[]" id="filer-gallery" multiple="multiple">
                    <input type="hidden" class="col-filer" value="col-xl-2 col-lg-3 col-md-3 col-sm-4 col-6">
                    <input type="hidden" class="act-filer" value="man">
                    <input type="hidden" class="folder-filer" value="product">
                </div>
                <?php if (isset($gallery) && count($gallery) > 0) { ?>
                    <div class="form-group form-group-gallery">
                        <label class="label-filer"><?= albumhientai ?>:</label>
                        <div class="action-filer mb-3">
                            <a class="btn btn-sm bg-gradient-primary text-white check-all-filer mr-1"><i
                                    class="far fa-square mr-2"></i><?= chontatca ?></a>
                            <button type="button" class="btn btn-sm bg-gradient-success text-white sort-filer mr-1"><i
                                    class="fas fa-random mr-2"></i><?= sapxep ?></button>
                            <a class="btn btn-sm bg-gradient-danger text-white delete-all-filer"><i
                                    class="far fa-trash-alt mr-2"></i><?= xoatatca ?></a>
                        </div>
                        <div class="alert my-alert alert-sort-filer alert-info text-sm text-white bg-gradient-info"><i
                                class="fas fa-info-circle mr-2"></i><?= cothechonnhieuhinhdedichuyen ?></div>
                        <div class="jFiler-items my-jFiler-items jFiler-row">
                            <ul class="jFiler-items-list jFiler-items-grid row scroll-bar" id="jFilerSortable">
                                <?php foreach ($gallery as $v)
                                    echo $func->galleryFiler($v['numb'], $v['id'], $v['photo'], $v['namevi'], 'product', 'col-xl-2 col-lg-3 col-md-3 col-sm-4 col-6'); ?>
                            </ul>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
        <?php if (isset($config['product'][$type]['seo']) && $config['product'][$type]['seo'] == true) { ?>
            <div class="card card-primary card-outline text-sm">
                <div class="card-header">
                    <h3 class="card-title"><?= noidungseo ?></h3>
                    <a class="btn btn-sm bg-gradient-success d-inline-block text-white float-right create-seo"
                        title="<?= taoseo ?>"><?= taoseo ?></a>
                </div>
                <div class="card-body">
                    <?php
                    $seoDB = $seo->getOnDB($id, $com, 'man', $type);
                    include TEMPLATE . LAYOUT . "seo.php";
                    ?>
                </div>
            </div>
        <?php } ?>
        <?php if (isset($config['product'][$type]['schema']) && $config['product'][$type]['schema'] == true) { ?>
            <div class="card card-primary card-outline text-sm">
                <div class="card-header">
                    <h3 class="card-title">Schema JSON <a
                            href="https://developers.google.com/search/docs/advanced/structured-data/search-gallery"
                            target="_blank">(<?= tailieuthamkhao ?>)</a></h3>
                    <button type="submit" class="btn btn-sm bg-gradient-success float-right submit-check"
                        name="build-schema"><i class="far fa-save mr-2"></i><?= luuvataotudongschema ?></button>
                </div>
                <div class="card-body">
                    <?php
                    $seoDB = $seo->getOnDB($id, $com, 'man', $type);
                    include TEMPLATE . LAYOUT . "schema.php";
                    ?>
                    <input type="hidden" id="schema-type" value="product">
                </div>
            </div>
        <?php } ?>
        <div class="card-footer text-sm">
            <button type="submit" class="btn btn-sm bg-gradient-primary submit-check" disabled><i
                    class="far fa-save mr-2"></i><?= luu ?></button>
            <button type="submit" class="btn btn-sm bg-gradient-success submit-check" name="save-here" disabled><i
                    class="far fa-save mr-2"></i><?= luutaitrang ?></button>
            <button type="reset" class="btn btn-sm bg-gradient-secondary"><i
                    class="fas fa-redo mr-2"></i><?= lamlai ?></button>
            <a class="btn btn-sm bg-gradient-danger" href="<?= $linkMan ?>" title="<?= thoat ?>"><i
                    class="fas fa-sign-out-alt mr-2"></i><?= thoat ?></a>
            <input type="hidden" name="id" value="<?= (isset($item['id']) && $item['id'] > 0) ? $item['id'] : '' ?>">
        </div>
    </form>
</section>