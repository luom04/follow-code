<?php
define('LAYOUT', 'layout/');
include "config.php";

/* Receive POST filters */
$perpage = (!empty($_POST['perpage'])) ? (int) $_POST['perpage'] : 30;
$p = (!empty($_POST['p'])) ? (int) $_POST['p'] : 1;
$start = ($p - 1) * $perpage;

$idItem = !empty($_POST['idItem']) ? (int) $_POST['idItem'] : 0;
$idCat = !empty($_POST['idCat']) ? (int) $_POST['idCat'] : 0;
$idList = !empty($_POST['idList']) ? (int) $_POST['idList'] : 0;
$price = $_POST['giaban'] ?: '';

$brands = $_POST['brand'] ?: [];
// $colors = $_POST['color'] ?: [];

$keyword = $_POST['q'] ?: '';
$size = $_POST['size'] ?: '';
$namsx = $_POST['namsx'] ?: '';
$nhienlieu = $_POST['nhienlieu'] ?: '';
$hopso = $_POST['hopso'] ?: '';
$xuatxu = $_POST['xuatxu'] ?: '';
$attrFilters = $_POST['attr'] ?? []; // nhận từ data-key="attr[ID]"
$productIdsFinal = null;
$params = [];
$where = " where type = 'san-pham' and find_in_set('hienthi',status)";

foreach ($attrFilters as $attrId => $optionIds) {
    $attrId = (int) $attrId;

    if (!is_array($optionIds)) {
        $optionIds = explode(',', (string) $optionIds);
    }
    $optionIds = array_values(array_filter(array_map('intval', $optionIds)));
    if (empty($optionIds))
        continue;

    $rows = $d->rawQuery("
        SELECT DISTINCT product_id
        FROM #_product_attribute_options
        WHERE attribute_id = ?
          AND option_id IN (" . implode(',', $optionIds) . ")
    ", [$attrId]);

    $ids = array_values(array_column($rows, 'product_id'));

    // Nếu 1 nhóm không có sản phẩm => AND chắc chắn rỗng
    if (empty($ids)) {
        $productIdsFinal = [];
        break;
    }

    // Giao (AND) giữa các nhóm thuộc tính
    if ($productIdsFinal === null) {
        $productIdsFinal = $ids;
    } else {
        $productIdsFinal = array_values(array_intersect($productIdsFinal, $ids));
        if (empty($productIdsFinal))
            break;
    }
}

// Chỉ add điều kiện khi user thật sự chọn ít nhất 1 option
if ($productIdsFinal !== null) {
    $where .= !empty($productIdsFinal)
        ? " and id in (" . implode(',', $productIdsFinal) . ")"
        : " and 0=1";
}



/* Apply filters */
if ($idItem > 0) {
    $where .= " and find_in_set('item-$idItem',id_danhmuc)";
}

if ($idCat > 0) {
    $where .= " and find_in_set('cat-$idCat',id_danhmuc)";
}

if ($idList > 0) {
    $where .= " and find_in_set('list-$idList',id_danhmuc)";
}
if ($brands) {
    $where .= " and id_brand in(" . join(',', $brands) . ")";
}
// if ($colors) {
//     $productColor = $d->rawQuery("select id_parent from #_product_sale where id_color in(" . join(',', $colors) . ")", array());
//     $productColor = (!empty($productColor)) ? $func->joinCols($productColor, 'id_parent') : array();
//     $where .= " and id in(" . $productColor . ")";
// }

if (!empty($price)) {
    if ($price == 'a-z') {
        $order = "order by 
            case 
                when sale_price > 0 then sale_price 
                else regular_price 
            end asc";
    } elseif ($price == 'z-a') {
        $order = "order by 
            case 
                when sale_price > 0 then sale_price 
                else regular_price 
            end desc";
    } else {
        $range = explode('-', $price);
        if (count($range) == 2) {
            $where .= " and (
                case 
                    when sale_price > 0 then sale_price 
                    else regular_price 
                end
            ) >= ? and (
                case 
                    when sale_price > 0 then sale_price 
                    else regular_price 
                end
            ) <= ?";
            $params[] = (int) $range[0];
            $params[] = (int) $range[1];
        } elseif (count($range) == 1) {
            $where .= " and (
                case 
                    when sale_price > 0 then sale_price 
                    else regular_price 
                end
            ) >= ?";
            $params[] = (int) $range[0];
        }
    }
}
if ($keyword) {
    $tukhoa = $func->changeTitle($keyword);
    $code = explode(" ", $keyword);
    if (count($code) > 1) {
        $code = end($code);
    } else {
        $code = $tukhoa;
    }

    // Tạo điều kiện tìm kiếm cho từng từ trong keyword
    $words = explode(" ", $keyword);


    $wordConditions = [];

    // Thêm điều kiện tìm kiếm cơ bản
    $wordConditions[] = "name$lang LIKE ?";
    $params[] = "%$keyword%";

    if (count($words) >= 3) {
        $wordConditions[] = "name$lang LIKE ?";
        $wordend = end($words);
        $params[] = "%$wordend%";
    }

    $wordConditions[] = "slugvi LIKE ?";
    $params[] = "%$tukhoa%";

    $wordConditions[] = "slugen LIKE ?";
    $params[] = "%$tukhoa%";

    $wordConditions[] = "code LIKE ?";
    $params[] = "%$code%";

    // // Thêm điều kiện cho từng từ riêng lẻ
    // foreach ($words as $word) {
    //     $word = trim($word);
    //     if (!empty($word)) {
    //         $wordConditions[] = "name$lang LIKE ?";
    //         $params[] = "%$word%";
    //     }
    // }

    $where .= " and (" . implode(" or ", $wordConditions) . ")";
}
if ($size) {
    $where .= " and (quick_search LIKE '%$size%')";
}
if ($namsx) {
    $where .= " and (quick_search LIKE '%$namsx%')";
}
if ($nhienlieu) {
    $where .= " and (quick_search LIKE '%$nhienlieu%')";
}
if ($hopso) {
    $where .= " and (quick_search LIKE '%$hopso%')";
}
if ($xuatxu) {
    $where .= " and (quick_search LIKE '%$xuatxu%')";
}

$order = $order ?? "order by numb, id desc";

/* Main query */
$sqlBase = "select name$lang,desc$lang, slugvi, slugen, id, photo, regular_price, sale_price, pre_price, discount, attributes, type from #_product $where $order";


/* Get total */
$countItems = count($cache->get($sqlBase, $params, 'result', 3600));

/* Get current items */
$sqlLimit = $sqlBase . " limit $start, $perpage";
$items = $cache->get($sqlLimit, $params, 'result', 3600);

/* Output */
if ($items) {
    echo '<div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-5">';
    foreach ($items as $v) {
        echo '<div class="col mb-3 d-flex">';
        include TEMPLATE . LAYOUT . "blocks/product.php";
        echo '</div>';
    }
    echo '</div>';

    // Kiểm tra còn bao nhiêu sản phẩm
    $remain = $countItems - ($start + count($items));
    if ($remain > 0) {
        echo '<div class="wrap-more text-center mt-4">';
        echo '<a href="javascript:;" class="btn-main text-lg outline px-5 py-2 btn-show-more-filter" data-page="' . ($p + 1) . '"> Xem thêm <span class="remain mx-1">(' . $remain . ')</span> sản phẩm</a>';
        echo '</div>';
    }
} else {
    echo '<div class="alert alert-warning w-100" role="alert"><strong>Không tìm thấy sản phẩm phù hợp</strong></div>';
}