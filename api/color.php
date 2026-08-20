<?php
include "config.php";

$id_color = (!empty($_POST['id_color'])) ? htmlspecialchars($_POST['id_color']) : 0;
$id_size = (!empty($_POST['id_size'])) ? htmlspecialchars($_POST['id_size']) : 0;
$id_pro = (!empty($_POST['id_pro'])) ? htmlspecialchars($_POST['id_pro']) : 0;

$where = "where id_parent = $id_pro and com = 'product' and type = 'san-pham' and kind = 'man' and val = 'san-pham'";
$params = array();
if($id_color){
    $where .= " and id_color = $id_color";
}
if($id_size){
    $where .= " and id_size = $id_size";
}
$rowDetailPhoto = $d->rawQueryOne("select * from #_gallery $where and find_in_set('hienthi',status) order by numb, id desc", $params);
$dataJson = array();
if (!empty($rowDetailPhoto)) {
    $photoDetails = explode(',', $rowDetailPhoto['photo_multiple']);
    $dataJson['conhang'] = strpos($rowDetailPhoto['status'], 'conhang') !== false ? 1 : 0;
    if (!empty($rowDetailPhoto['sale_price'])) {
        // Có giá khuyến mãi
        $dataJson['giaban'] = 
            '<label class="attr-label-pro-detail d-block mb-2">Giá sản phẩm: <span class="price-discount-pro-detail">-' . $rowDetailPhoto['discount'] . '%</span></label>'
        . '<div><span class="price-new-pro-detail">'.$func->formatMoney($rowDetailPhoto['sale_price']).'</span>'
        . '<span class="price-old-pro-detail">'.$func->formatMoney($rowDetailPhoto['regular_price']).'</span></div>';
    } else {
        $dataJson['giaban'] = !empty($rowDetailPhoto['regular_price'])
            ? '<label class="attr-label-pro-detail d-block mb-2">Giá sản phẩm:</label><div><span class="price-new-pro-detail">'.$func->formatMoney($rowDetailPhoto['regular_price']).'</span></div>'
            : '<label class="attr-label-pro-detail d-block mb-2">Giá sản phẩm:</label><div><span class="price-new-pro-detail">Liên hệ: '.$optsetting['hotline'].'</span></div>';
    }

    $htmlSlider = '';
    /* Slider chính */
    $htmlSlider .= '<div class="slider-products mb-3 mb-sm-0" data-status="'.(strpos($rowDetailPhoto['status'], 'conhang') !== false ? 1 : 0).'">';
    foreach ($photoDetails as $v) {
        $htmlSlider .= '
            <div class="item">
                <a href="'.THUMBS.'/1000x1000x2/'.UPLOAD_PRODUCT_L.$v.'" data-fancybox="product-detail" title="'.$rowDetailPhoto['name'.$lang].'">
                    <img onerror="this.src=\''.THUMBS.'/1000x1000x2/assets/images/noimage.png\';" 
                        src="'.THUMBS.'/1000x1000x2/'.UPLOAD_PRODUCT_L.$v.'" 
                        alt="'.$rowDetailPhoto['name'.$lang].'">
                </a>
            </div>';
    }
    $htmlSlider .= '</div>';

    /* Slider thumbnails */
    $htmlSlider .= '<div class="slider-product-thumbs">';
    foreach ($photoDetails as $v) {
        $htmlSlider .= '
            <div class="item">
                <a href="javascript:;" class="p-2 d-flex align-items-center" title="'.$rowDetailPhoto['name'.$lang].'">
                    <img onerror="this.src=\''.THUMBS.'/250x250x2/assets/images/noimage.png\';" 
                        src="'.THUMBS.'/250x250x2/'.UPLOAD_PRODUCT_L.$v.'" 
                        alt="'.$rowDetailPhoto['name'.$lang].'">
                </a>
            </div>';
    }
    $htmlSlider .= '</div>';

    $dataJson['htmlSlider'] = $htmlSlider;
}
echo json_encode($dataJson);