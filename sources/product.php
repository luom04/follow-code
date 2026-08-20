<?php
if (!defined('SOURCES'))
    die("Error");

@$id = htmlspecialchars($_GET['id']);
@$idl = htmlspecialchars($_GET['idl']);
@$idc = htmlspecialchars($_GET['idc']);
@$idi = htmlspecialchars($_GET['idi']);
@$ids = htmlspecialchars($_GET['ids']);
@$idb = htmlspecialchars($_GET['idb']);

$bannerqc = null;
$filterActive = $idl ?: 0;
$filterKey = 'idList';

$sliderKM = $cache->get("select name$lang, desc$lang, photo, link, link_video from #_photo where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('san-pham'), 'result', 7200);
$doingu = $d->rawQuery("select name$lang,subname$lang, desc$lang,phone,zalo,photo,icon from #_news where type = ?  and find_in_set('sanpham',status) and find_in_set('hienthi',status) order by numb,id desc limit 0,4", array('doi-ngu'));


if ($id != '') {
    /* Lấy sản phẩm detail */
    $rowDetail = $d->rawQueryOne("select type, id, name$lang, slugvi, slugen, desc$lang, content$lang, thongso$lang, quatang$lang, code, view, id_brand, id_list, id_cat, id_item, id_sub, photo, options, discount, sale_price, regular_price, pre_price, attributes, status from #_product where id = ? and type = ? and find_in_set('hienthi',status) limit 0,1", array($id, $type));
    $rowDetailAttrs = json_decode($rowDetail['attributes'], true);
    /* Product seen */
    $func->product_seen_exists($rowDetail['id']);
    /* Product seen */
    if ($_SESSION['pro_seen']) {
        $productSeens = $d->rawQuery("select photo, name$lang, slugvi, slugen, sale_price, regular_price, pre_price, discount, id, attributes from #_product where id <> ? and id in('" . join(",", $_SESSION['pro_seen']) . "') and type = ? and find_in_set('hienthi',status) limit 0,12", array($rowDetail['id'], $type));
    } else {
        $productSeens = null;
    }

    /* Cập nhật lượt xem */
    $views = array();
    $views['view'] = $rowDetail['view'] + 1;
    $d->where('id', $rowDetail['id']);
    $d->update('product', $views);


    $attributes = $d->rawQuery("SELECT id, name$lang, type_show FROM #_attributes WHERE id IN(SELECT attribute_id FROM #_product_attributes WHERE product_id = ?) and find_in_set('hienthi',status) order by numb,id desc", [$id]);
    $options = $d->rawQuery("SELECT id, attribute_id, option_id, option_key, name, color, image, sort_order FROM #_product_attribute_options WHERE product_id = ? ORDER BY sort_order ASC, id ASC", [$id]);
    // Gom options theo attribute_id để tiện render
    $optionsByAttr = [];
    foreach ($options as $opt) {
        $optionsByAttr[$opt['attribute_id']][] = $opt;
    }

    $sql = "SELECT id, combination_key, sku,combo_name, price, discount_price, weight, 
                percent_discount, sort_order, stock, image
            FROM #_product_variants
            WHERE product_id = ?
            ORDER BY sort_order ASC, id ASC";
    $variants = $d->rawQuery($sql, [$id]);

    $sql = "SELECT vo.variant_id,
               vo.option_id,
               ao.name$lang AS option_name,
               a.name$lang  AS attr_name
        FROM #_product_variant_options AS vo
        JOIN #_attribute_options AS ao ON vo.option_id = ao.id
        JOIN #_attributes AS a ON ao.attribute_id = a.id
        WHERE vo.variant_id IN (SELECT id FROM #_product_variants WHERE product_id = ?)";
    $variantOptions = $d->rawQuery($sql, [$id]);

    $variantOptionsByVariant = [];
    foreach ($variantOptions as $vo) {
        $variantOptionsByVariant[$vo['variant_id']][] = [
            'key' => $vo['option_id'],
            'name' => $vo['option_name'], // tên option (Đỏ, 800x600,…)
            'attrName' => $vo['attr_name']    // tên thuộc tính (Màu sắc, Kích thước,…)
        ];
    }


    // Ghép vào mảng variantData theo combination_key
    $variantData = [];
    foreach ($variants as $v) {
        $variantData[$v['combination_key']] = [
            'id' => $v['id'],
            'sku' => $v['sku'],
            'comboName' => $v['combo_name'],
            'price' => $v['price'],
            'discount' => $v['discount_price'],
            'weight' => $v['weight'],
            'percent' => $v['percent_discount'],
            'sort' => $v['sort_order'],
            'stock' => $v['stock'],
            'image' => $v['image'],
            'options' => $variantOptionsByVariant[$v['id']] ?: []
        ];
    }

    /* Lấy tags */
    $productTags = $d->rawQuery("select id_tags from #_product_tags where id_parent = ?", array($rowDetail['id']));
    $productTags = (!empty($productTags)) ? $func->joinCols($productTags, 'id_tags') : array();

    if (!empty($productTags)) {
        $rowTags = $d->rawQuery("select id, name$lang, slugvi, slugen from #_tags where type='" . $type . "' and id in ($productTags) and find_in_set('hienthi',status) order by numb,id desc");
    }

    /* Lấy cấp 1 */
    $productList = $d->rawQueryOne("select id, name$lang, slugvi, slugen from #_product_list where id = ? and type = ? and find_in_set('hienthi',status) limit 0,1", array($rowDetail['id_list'], $type));

    /* Lấy cấp 2 */
    $productCat = $d->rawQueryOne("select id, name$lang, slugvi, slugen from #_product_cat where id = ? and type = ? and find_in_set('hienthi',status) limit 0,1", array($rowDetail['id_cat'], $type));

    /* Lấy cấp 3 */
    $productItem = $d->rawQueryOne("select id, name$lang, slugvi, slugen from #_product_item where id = ? and type = ? and find_in_set('hienthi',status) limit 0,1", array($rowDetail['id_item'], $type));

    /* Lấy cấp 4 */
    $productSub = $d->rawQueryOne("select id, name$lang, slugvi, slugen from #_product_sub where id = ? and type = ? and find_in_set('hienthi',status) limit 0,1", array($rowDetail['id_sub'], $type));

    /* Lấy thương hiệu */
    $productBrand = $d->rawQueryOne("select name$lang, slugvi, slugen, id from #_product_brand where id = ? and type = ? and find_in_set('hienthi',status)", array($rowDetail['id_brand'], $type));

    /* Lấy hình ảnh con */
    $rowDetailPhoto = $d->rawQuery("select photo from #_gallery where id_parent = ? and com='product' and type = ? and kind='man' and val = ? and find_in_set('hienthi',status) order by numb,id desc", array($rowDetail['id'], $type, $type));
    /* Lấy thông số */
    $rowDetailContent = $d->rawQuery("select name$lang, content$lang from #_gallery where id_parent = ? and com='product' and type = ? and kind='man' and val = ? and find_in_set('hienthi',status) order by numb,id desc", array($rowDetail['id'], $type, 'noi-dung'));

    $camket = $cache->get("select name$lang, content$lang from #_static where type = ? limit 0,1", array('cam-ket'), 'fetch', 7200);

    /* Lấy sản phẩm cùng loại */
    $where = "";
    $where = "id <> ? and id_brand = ? and type = ? and find_in_set('hienthi',status)";
    $params = array($id, $rowDetail['id_brand'], $type);

    $curPage = $getPage;
    $perPage = 8;
    $startpoint = ($curPage * $perPage) - $perPage;
    $limit = " limit " . $startpoint . "," . $perPage;
    $sql = "select photo, name$lang, slugvi, slugen,desc$lang, sale_price, regular_price, pre_price, discount, id, attributes from #_product where $where order by numb,id desc $limit";
    $product = $d->rawQuery($sql, $params);
    $sqlNum = "select count(*) as 'num' from #_product where $where order by numb,id desc";
    $count = $d->rawQueryOne($sqlNum, $params);
    $total = (!empty($count)) ? $count['num'] : 0;
    $url = $func->getCurrentPageURL();
    $paging = $func->pagination($total, $perPage, $curPage, $url);

    /* Comment */
    // $comment = new Comments($d, $func, $rowDetail['id'], $rowDetail['type']);

    /* SEO */
    $seoDB = $seo->getOnDB($rowDetail['id'], 'product', 'man', $rowDetail['type']);
    $seo->set('h1', $rowDetail['name' . $lang]);
    if (!empty($seoDB['title' . $seolang]))
        $seo->set('title', $seoDB['title' . $seolang]);
    else
        $seo->set('title', $rowDetail['name' . $lang]);
    if (!empty($seoDB['keywords' . $seolang]))
        $seo->set('keywords', $seoDB['keywords' . $seolang]);
    if (!empty($seoDB['description' . $seolang]))
        $seo->set('description', $seoDB['description' . $seolang]);
    $seo->set('url', $func->getPageURL());
    $imgJson = (!empty($rowDetail['options'])) ? json_decode($rowDetail['options'], true) : null;
    if (empty($imgJson) || ($imgJson['p'] != $rowDetail['photo'])) {
        $imgJson = $func->getImgSize($rowDetail['photo'], UPLOAD_PRODUCT_L . $rowDetail['photo']);
        $seo->updateSeoDB(json_encode($imgJson), 'product', $rowDetail['id']);
    }
    if (!empty($imgJson)) {
        $seo->set('photo', $configBase . THUMBS . '/' . $imgJson['w'] . 'x' . $imgJson['h'] . 'x2/' . UPLOAD_PRODUCT_L . $rowDetail['photo']);
        $seo->set('photo:width', $imgJson['w']);
        $seo->set('photo:height', $imgJson['h']);
        $seo->set('photo:type', $imgJson['m']);
    }

    /* breadCrumbs */
    if (!empty($titleMain))
        $breadcr->set($com, $titleMain);
    if (!empty($productList))
        $breadcr->set($productList[$sluglang], $productList['name' . $lang]);
    if (!empty($productCat))
        $breadcr->set($productCat[$sluglang], $productCat['name' . $lang]);
    if (!empty($productItem))
        $breadcr->set($productItem[$sluglang], $productItem['name' . $lang]);
    if (!empty($productSub))
        $breadcr->set($productSub[$sluglang], $productSub['name' . $lang]);
    $breadcr->set($rowDetail[$sluglang], $rowDetail['name' . $lang]);
    $breadcrumbs = $breadcr->get();

    /* QuickView */
    if ($func->isAjax() && !empty($_GET['quickview'])) {
        $quickview = true;
        include TEMPLATE . "product/product_detail_tpl.php";
        exit;
    }
} else if ($idl != '') {
    /* Lấy cấp 1 detail */
    $productList = $d->rawQueryOne("select id, name$lang, content$lang, slugvi, slugen, type, photo, options from #_product_list where id = ? and type = ? limit 0,1", array($idl, $type));
    // $galleryList = $d->rawQuery("select * from #_gallery where id_parent = ? and com = ? and type = ? and kind = ? and val = ? order by numb,id desc", array($idl, 'product', 'san-pham', 'man_list', 'taptin'));
    $filterActive = $idl;

    $lists = $d->rawQuery("select id, name$lang, slugvi, slugen, type, photo from #_product_list where id != ? and type = ? and find_in_set('hienthi',status) order by numb,id desc", array($idl, $type));
    $cats = $d->rawQuery("select id, name$lang, slugvi, slugen, type, photo from #_product_cat where id_list = ? and type = ? and find_in_set('hienthi',status) order by numb,id desc", array($idl, $type));

    $productSales = $d->rawQuery("select id, name$lang, slugvi, slugen, photo, regular_price, sale_price, discount, attributes from #_product where id_list = ? and type = ? and find_in_set('khuyenmai',status) and find_in_set('hienthi',status)", array($idl, $type));


    /* SEO */
    $titleCate = $productList['name' . $lang];
    $slugCate = $productList['slug' . $lang];
    $contentCate = $productList['content' . $lang];
    $seoDB = $seo->getOnDB($productList['id'], 'product', 'man_list', $productList['type']);
    $seo->set('h1', $productList['name' . $lang]);
    if (!empty($seoDB['title' . $seolang]))
        $seo->set('title', $seoDB['title' . $seolang]);
    else
        $seo->set('title', $productList['name' . $lang]);
    if (!empty($seoDB['keywords' . $seolang]))
        $seo->set('keywords', $seoDB['keywords' . $seolang]);
    if (!empty($seoDB['description' . $seolang]))
        $seo->set('description', $seoDB['description' . $seolang]);
    $seo->set('url', $func->getPageURL());
    $imgJson = (!empty($productList['options'])) ? json_decode($productList['options'], true) : null;
    if (empty($imgJson) || ($imgJson['p'] != $productList['photo'])) {
        $imgJson = $func->getImgSize($productList['photo'], UPLOAD_PRODUCT_L . $productList['photo']);
        $seo->updateSeoDB(json_encode($imgJson), 'product_list', $productList['id']);
    }
    if (!empty($imgJson)) {
        $seo->set('photo', $configBase . THUMBS . '/' . $imgJson['w'] . 'x' . $imgJson['h'] . 'x2/' . UPLOAD_PRODUCT_L . $productList['photo']);
        $seo->set('photo:width', $imgJson['w']);
        $seo->set('photo:height', $imgJson['h']);
        $seo->set('photo:type', $imgJson['m']);
    }

    /* Lấy sản phẩm */
    $where = "";
    $where = "type = ? and find_in_set('list-$idl',id_danhmuc) and find_in_set('hienthi',status)";
    $params = array($type);

    $curPage = $getPage;
    $perPage = 30;
    $startpoint = ($curPage * $perPage) - $perPage;
    $limit = " limit " . $startpoint . "," . $perPage;
    $sql = "select photo, name$lang, slugvi, slugen, sale_price, regular_price, pre_price, discount, id, attributes from #_product where $where order by numb,id desc $limit";
    $product = $d->rawQuery($sql, $params);
    $sqlNum = "select count(*) as 'num' from #_product where $where order by numb,id desc";
    $count = $d->rawQueryOne($sqlNum, $params);
    $total = (!empty($count)) ? $count['num'] : 0;
    $url = $func->getCurrentPageURL();
    $paging = $func->pagination($total, $perPage, $curPage, $url);

    /* breadCrumbs */
    if (!empty($titleMain))
        $breadcr->set($com, $titleMain);
    if (!empty($productList))
        $breadcr->set($productList[$sluglang], $productList['name' . $lang]);
    $breadcrumbs = $breadcr->get();

} else if ($idc != '') {
    /* Lấy cấp 2 detail */
    $productCat = $d->rawQueryOne("select id, id_list, name$lang, content$lang, slugvi, slugen, type, photo, options from #_product_cat where id = ? and type = ? limit 0,1", array($idc, $type));
    $filterActive = $idc;
    $filterKey = 'idCat';
    $filterLists = $d->rawQuery("select id, name$lang, content$lang, slugvi, slugen, type, photo, options from #_product_cat where id_list = ? and type = ? and find_in_set('hienthi',status)", array($productCat['id_list'], $type));

    /* Lấy cấp 1 */
    $productList = $d->rawQueryOne("select id, name$lang, slugvi, slugen from #_product_list where id = ? and type = ? limit 0,1", array($productCat['id_list'], $type));

    /* Lấy cấp 1 */
    $lists = $d->rawQuery("select id, name$lang, slugvi, slugen, type, photo from #_product_cat where id != ? and type = ? and find_in_set('hienthi',status) order by numb,id desc", array($idc, $type));
    $cats = $d->rawQuery("select id, name$lang, slugvi, slugen, type, photo from #_product_item where id_cat = ? and type = ? and find_in_set('hienthi',status) order by numb,id desc", array($idc, $type));

    /* Lấy sản phẩm */
    $where = "";
    $where = "type = ? and find_in_set('cat-$idc',id_danhmuc) and find_in_set('hienthi',status)";
    $params = array($type);

    $curPage = $getPage;
    $perPage = 20;
    $startpoint = ($curPage * $perPage) - $perPage;
    $limit = " limit " . $startpoint . "," . $perPage;
    $sql = "select photo, name$lang, slugvi, slugen, sale_price, regular_price, pre_price, discount, id, attributes from #_product where $where order by numb,id desc $limit";
    $product = $d->rawQuery($sql, $params);
    $sqlNum = "select count(*) as 'num' from #_product where $where order by numb,id desc";
    $count = $d->rawQueryOne($sqlNum, $params);
    $total = (!empty($count)) ? $count['num'] : 0;
    $url = $func->getCurrentPageURL();
    $paging = $func->pagination($total, $perPage, $curPage, $url);

    /* SEO */
    $titleCate = $productCat['name' . $lang];
    $contentCate = $productCat['content' . $lang];
    $seoDB = $seo->getOnDB($productCat['id'], 'product', 'man_cat', $productCat['type']);
    $seo->set('h1', $productCat['name' . $lang]);
    if (!empty($seoDB['title' . $seolang]))
        $seo->set('title', $seoDB['title' . $seolang]);
    else
        $seo->set('title', $productCat['name' . $lang]);
    if (!empty($seoDB['keywords' . $seolang]))
        $seo->set('keywords', $seoDB['keywords' . $seolang]);
    if (!empty($seoDB['description' . $seolang]))
        $seo->set('description', $seoDB['description' . $seolang]);
    $seo->set('url', $func->getPageURL());
    $imgJson = (!empty($productCat['options'])) ? json_decode($productCat['options'], true) : null;
    if (empty($imgJson) || ($imgJson['p'] != $productCat['photo'])) {
        $imgJson = $func->getImgSize($productCat['photo'], UPLOAD_PRODUCT_L . $productCat['photo']);
        $seo->updateSeoDB(json_encode($imgJson), 'product_cat', $productCat['id']);
    }
    if (!empty($imgJson)) {
        $seo->set('photo', $configBase . THUMBS . '/' . $imgJson['w'] . 'x' . $imgJson['h'] . 'x2/' . UPLOAD_PRODUCT_L . $productCat['photo']);
        $seo->set('photo:width', $imgJson['w']);
        $seo->set('photo:height', $imgJson['h']);
        $seo->set('photo:type', $imgJson['m']);
    }

    /* breadCrumbs */
    if (!empty($titleMain))
        $breadcr->set($com, $titleMain);
    if (!empty($productList))
        $breadcr->set($productList[$sluglang], $productList['name' . $lang]);
    if (!empty($productCat))
        $breadcr->set($productCat[$sluglang], $productCat['name' . $lang]);
    $breadcrumbs = $breadcr->get();
} else if ($idi != '') {
    /* Lấy cấp 3 detail */
    $productItem = $d->rawQueryOne("select id, id_list, id_cat, name$lang,content$lang, slugvi, slugen, type, photo, options from #_product_item where id = ? and type = ? limit 0,1", array($idi, $type));

    $filterActive = $idi;
    $filterKey = 'idItem';
    $filterLists = $d->rawQuery("select id, name$lang, content$lang, slugvi, slugen, type, photo, options from #_product_item where id_list = ? and id_cat = ? and type = ? and find_in_set('hienthi',status)", array($productItem['id_list'], $productItem['id_cat'], $type));


    /* Lấy cấp 1 */
    $productList = $d->rawQueryOne("select id, name$lang, slugvi, slugen from #_product_list where id = ? and type = ? limit 0,1", array($productItem['id_list'], $type));

    /* Lấy cấp 2 */
    $productCat = $d->rawQueryOne("select id, name$lang, slugvi, slugen from #_product_cat where id_list = ? and id = ? and type = ? limit 0,1", array($productItem['id_list'], $productItem['id_cat'], $type));

    /* Lấy sản phẩm */
    $where = "";
    $where = "type = ? and find_in_set('item-$idi',id_danhmuc) and find_in_set('hienthi',status)";
    $params = array($type);

    $curPage = $getPage;
    $perPage = 20;
    $startpoint = ($curPage * $perPage) - $perPage;
    $limit = " limit " . $startpoint . "," . $perPage;
    $sql = "select photo, name$lang, slugvi, slugen, sale_price, regular_price, pre_price, discount, id, attributes from #_product where $where order by numb,id desc $limit";
    $product = $d->rawQuery($sql, $params);
    $sqlNum = "select count(*) as 'num' from #_product where $where order by numb,id desc";
    $count = $d->rawQueryOne($sqlNum, $params);
    $total = (!empty($count)) ? $count['num'] : 0;
    $url = $func->getCurrentPageURL();
    $paging = $func->pagination($total, $perPage, $curPage, $url);

    /* SEO */
    $titleCate = $productItem['name' . $lang];
    $contentCate = $productItem['content' . $lang];
    $seoDB = $seo->getOnDB($productItem['id'], 'product', 'man_item', $productItem['type']);
    $seo->set('h1', $productItem['name' . $lang]);
    if (!empty($seoDB['title' . $seolang]))
        $seo->set('title', $seoDB['title' . $seolang]);
    else
        $seo->set('title', $productItem['name' . $lang]);
    if (!empty($seoDB['keywords' . $seolang]))
        $seo->set('keywords', $seoDB['keywords' . $seolang]);
    if (!empty($seoDB['description' . $seolang]))
        $seo->set('description', $seoDB['description' . $seolang]);
    $seo->set('url', $func->getPageURL());
    $imgJson = (!empty($productItem['options'])) ? json_decode($productItem['options'], true) : null;
    if (empty($imgJson) || ($imgJson['p'] != $productItem['photo'])) {
        $imgJson = $func->getImgSize($productItem['photo'], UPLOAD_PRODUCT_L . $productItem['photo']);
        $seo->updateSeoDB(json_encode($imgJson), 'product_item', $productItem['id']);
    }
    if (!empty($imgJson)) {
        $seo->set('photo', $configBase . THUMBS . '/' . $imgJson['w'] . 'x' . $imgJson['h'] . 'x2/' . UPLOAD_PRODUCT_L . $productItem['photo']);
        $seo->set('photo:width', $imgJson['w']);
        $seo->set('photo:height', $imgJson['h']);
        $seo->set('photo:type', $imgJson['m']);
    }

    /* breadCrumbs */
    if (!empty($titleMain))
        $breadcr->set($com, $titleMain);
    if (!empty($productList))
        $breadcr->set($productList[$sluglang], $productList['name' . $lang]);
    if (!empty($productCat))
        $breadcr->set($productCat[$sluglang], $productCat['name' . $lang]);
    if (!empty($productItem))
        $breadcr->set($productItem[$sluglang], $productItem['name' . $lang]);
    $breadcrumbs = $breadcr->get();
} else if ($ids != '') {
    /* Lấy cấp 4 */
    $productSub = $d->rawQueryOne("select id, id_list, id_cat, id_item, name$lang, slugvi, slugen, type, photo, options from #_product_sub where id = ? and type = ? limit 0,1", array($ids, $type));

    /* Lấy cấp 1 */
    $productList = $d->rawQueryOne("select id, name$lang, slugvi, slugen from #_product_list where id = ? and type = ? limit 0,1", array($productSub['id_list'], $type));

    /* Lấy cấp 2 */
    $productCat = $d->rawQueryOne("select id, name$lang, slugvi, slugen from #_product_cat where id_list = ? and id = ? and type = ? limit 0,1", array($productSub['id_list'], $productSub['id_cat'], $type));

    /* Lấy cấp 3 */
    $productItem = $d->rawQueryOne("select id, name$lang, slugvi, slugen from #_product_item where id_list = ? and id_cat = ? and id = ? and type = ? limit 0,1", array($productSub['id_list'], $productSub['id_cat'], $productSub['id_item'], $type));

    /* Lấy sản phẩm */
    $where = "";
    $where = "id_sub = ? and type = ? and find_in_set('hienthi',status)";
    $params = array($ids, $type);

    $curPage = $getPage;
    $perPage = 20;
    $startpoint = ($curPage * $perPage) - $perPage;
    $limit = " limit " . $startpoint . "," . $perPage;
    $sql = "select photo, name$lang, slugvi, slugen, sale_price, regular_price, pre_price, discount, id, attributes from #_product where $where order by numb,id desc $limit";
    $product = $d->rawQuery($sql, $params);
    $sqlNum = "select count(*) as 'num' from #_product where $where order by numb,id desc";
    $count = $d->rawQueryOne($sqlNum, $params);
    $total = (!empty($count)) ? $count['num'] : 0;
    $url = $func->getCurrentPageURL();
    $paging = $func->pagination($total, $perPage, $curPage, $url);

    /* SEO */
    $titleCate = $productSub['name' . $lang];
    $seoDB = $seo->getOnDB($productSub['id'], 'product', 'man_sub', $productSub['type']);
    $seo->set('h1', $productSub['name' . $lang]);
    if (!empty($seoDB['title' . $seolang]))
        $seo->set('title', $seoDB['title' . $seolang]);
    else
        $seo->set('title', $productSub['name' . $lang]);
    if (!empty($seoDB['keywords' . $seolang]))
        $seo->set('keywords', $seoDB['keywords' . $seolang]);
    if (!empty($seoDB['description' . $seolang]))
        $seo->set('description', $seoDB['description' . $seolang]);
    $seo->set('url', $func->getPageURL());
    $imgJson = (!empty($productSub['options'])) ? json_decode($productSub['options'], true) : null;
    if (empty($imgJson) || ($imgJson['p'] != $productSub['photo'])) {
        $imgJson = $func->getImgSize($productSub['photo'], UPLOAD_PRODUCT_L . $productSub['photo']);
        $seo->updateSeoDB(json_encode($imgJson), 'product_sub', $productSub['id']);
    }
    if (!empty($imgJson)) {
        $seo->set('photo', $configBase . THUMBS . '/' . $imgJson['w'] . 'x' . $imgJson['h'] . 'x2/' . UPLOAD_PRODUCT_L . $productSub['photo']);
        $seo->set('photo:width', $imgJson['w']);
        $seo->set('photo:height', $imgJson['h']);
        $seo->set('photo:type', $imgJson['m']);
    }

    /* breadCrumbs */
    if (!empty($titleMain))
        $breadcr->set($com, $titleMain);
    if (!empty($productList))
        $breadcr->set($productList[$sluglang], $productList['name' . $lang]);
    if (!empty($productCat))
        $breadcr->set($productCat[$sluglang], $productCat['name' . $lang]);
    if (!empty($productItem))
        $breadcr->set($productItem[$sluglang], $productItem['name' . $lang]);
    if (!empty($productSub))
        $breadcr->set($productSub[$sluglang], $productSub['name' . $lang]);
    $breadcrumbs = $breadcr->get();
} else if ($idb != '') {
    /* Lấy brand detail */
    $productBrand = $d->rawQueryOne("select name$lang, slugvi, slugen, id, type, photo, options from #_product_brand where id = ? and type = ? limit 0,1", array($idb, $type));

    /* SEO */
    $titleCate = $productBrand['name' . $lang];
    $seoDB = $seo->getOnDB($productBrand['id'], 'product', 'man_brand', $productBrand['type']);
    $seo->set('h1', $productBrand['name' . $lang]);
    if (!empty($seoDB['title' . $seolang]))
        $seo->set('title', $seoDB['title' . $seolang]);
    else
        $seo->set('title', $productBrand['name' . $lang]);
    if (!empty($seoDB['keywords' . $seolang]))
        $seo->set('keywords', $seoDB['keywords' . $seolang]);
    if (!empty($seoDB['description' . $seolang]))
        $seo->set('description', $seoDB['description' . $seolang]);
    $seo->set('url', $func->getPageURL());
    $imgJson = (!empty($productBrand['options'])) ? json_decode($productBrand['options'], true) : null;
    if (empty($imgJson) || ($imgJson['p'] != $productBrand['photo'])) {
        $imgJson = $func->getImgSize($productBrand['photo'], UPLOAD_PRODUCT_L . $productBrand['photo']);
        $seo->updateSeoDB(json_encode($imgJson), 'product_brand', $productBrand['id']);
    }
    if (!empty($imgJson)) {
        $seo->set('photo', $configBase . THUMBS . '/' . $imgJson['w'] . 'x' . $imgJson['h'] . 'x2/' . UPLOAD_PRODUCT_L . $productBrand['photo']);
        $seo->set('photo:width', $imgJson['w']);
        $seo->set('photo:height', $imgJson['h']);
        $seo->set('photo:type', $imgJson['m']);
    }

    /* Lấy sản phẩm */
    $where = "";
    $where = "id_brand = ? and type = ? and find_in_set('hienthi',status)";
    $params = array($productBrand['id'], $type);
    $sql = "select photo, name$lang, slugvi, slugen, sale_price, regular_price, pre_price, discount, id, id_danhmuc, attributes from #_product where $where order by numb,id desc";
    $products = $d->rawQuery($sql, $params);

    $productListBrand = [];
    foreach ($productListMenu as $klist => $list) {
        $listId = 'list-' . $list['id'];

        $matchedProducts = array_filter($products, function ($product) use ($listId) {
            return strpos($product['id_danhmuc'], $listId) !== false;
        });
        if (!empty($matchedProducts)) {
            $productListBrand[$klist] = $list;
            $productListBrand[$klist]['products'] = array_values($matchedProducts);
        }
    }

    /* breadCrumbs */
    $breadcr->set($productBrand[$sluglang], $titleCate);
    $breadcrumbs = $breadcr->get();

    $template = "product/brand_detail";


} else {
    /* SEO */
    $seopage = $d->rawQueryOne("select * from #_seopage where type = ? limit 0,1", array($type));
    $seo->set('h1', $titleMain);
    if (!empty($seopage['title' . $seolang]))
        $seo->set('title', $seopage['title' . $seolang]);
    else
        $seo->set('title', $titleMain);
    if (!empty($seopage['keywords' . $seolang]))
        $seo->set('keywords', $seopage['keywords' . $seolang]);
    if (!empty($seopage['description' . $seolang]))
        $seo->set('description', $seopage['description' . $seolang]);
    $seo->set('url', $func->getPageURL());
    $imgJson = (!empty($seopage['options'])) ? json_decode($seopage['options'], true) : null;
    if (!empty($seopage['photo'])) {
        if (empty($imgJson) || ($imgJson['p'] != $seopage['photo'])) {
            $imgJson = $func->getImgSize($seopage['photo'], UPLOAD_SEOPAGE_L . $seopage['photo']);
            $seo->updateSeoDB(json_encode($imgJson), 'seopage', $seopage['id']);
        }
        if (!empty($imgJson)) {
            $seo->set('photo', $configBase . THUMBS . '/' . $imgJson['w'] . 'x' . $imgJson['h'] . 'x2/' . UPLOAD_SEOPAGE_L . $seopage['photo']);
            $seo->set('photo:width', $imgJson['w']);
            $seo->set('photo:height', $imgJson['h']);
            $seo->set('photo:type', $imgJson['m']);
        }
    }

    if (!empty($_GET['q'])) {
        $tukhoa_show = htmlspecialchars($_GET['q']);
        $tukhoa = htmlspecialchars($_GET['q']);
        $tukhoa = $func->changeTitle($tukhoa);
        if ($tukhoa) {
            $where = "";
            $where = "type = ? and (name$lang LIKE ? or slugvi LIKE ? or slugen LIKE ? or code LIKE ?) and find_in_set('hienthi',status)";
            $params = array($type, "%$tukhoa%", "%$tukhoa%", "%$tukhoa%", "%$tukhoa%");

            $curPage = $getPage;
            $perPage = 20;
            $startpoint = ($curPage * $perPage) - $perPage;
            $limit = " limit " . $startpoint . "," . $perPage;
            $sql = "select photo, name$lang, slugvi, slugen, sale_price, regular_price, pre_price, discount, id, desc$lang, icon, attributes from #_product where $where order by numb,id desc $limit";
            $product = $d->rawQuery($sql, $params);
            $sqlNum = "select count(*) as 'num' from #_product where $where order by numb,id desc";
            $count = $d->rawQueryOne($sqlNum, $params);
            $total = (!empty($count)) ? $count['num'] : 0;
            $url = $func->getCurrentPageURL();
            $paging = $func->pagination($total, $perPage, $curPage, $url);
        }
    } else if ($com == 'thuong-hieu') {
        $template = "product/brand";
    } else if ($com == 'thu-vien-anh') {
        /* Lấy tất cả sản phẩm */
        $where = "";
        $where = "type = ? and find_in_set('hienthi',status)";
        $params = array($type);
        $curPage = $getPage;
        $perPage = 20;
        $startpoint = ($curPage * $perPage) - $perPage;
        $limit = " limit " . $startpoint . "," . $perPage;
        $sql = "select photo, name$lang, slugvi, slugen,  discount, id, desc$lang, icon, attributes from #_product where $where order by numb,id desc $limit";
        $product = $d->rawQuery($sql, $params);
        $sqlNum = "select count(*) as 'num' from #_product where $where order by numb,id desc";
        $count = $d->rawQueryOne($sqlNum, $params);
        $total = (!empty($count)) ? $count['num'] : 0;
        $url = $func->getCurrentPageURL();
        $paging = $func->pagination($total, $perPage, $curPage, $url);

    } else if ($com == 'san-phams') {
        $where = "type = ? AND find_in_set('hienthi',status)";
        $params = [$type];
        /* LOAD BAN ĐẦU */
        $perPage = 10;
        $offset = 0;
        $sql = "select photo, name$lang, slugvi, slugen, sale_price, regular_price, pre_price, discount, id, desc$lang, icon, attributes from #_product where $where order by numb,id desc LIMIT $offset, $perPage ";
        $product = $d->rawQuery($sql, $params);
        /* ĐẾM TỔNG */
        $sqlNum = "SELECT COUNT(*) as num FROM #_product WHERE $where";
        $total = (int) $d->rawQueryOne($sqlNum, $params)['num'];
        /* KHÔNG PAGINATION */
        $paging = '';
        // /* Lấy tất cả sản phẩm */
        //  $where = "";
        // $where = "type = ? and find_in_set('hienthi',status)";
        // $params = array($type);

        // $curPage = $getPage;
        // $perPage = 20;
        // $startpoint = ($curPage * $perPage) - $perPage;
        // $limit = " limit " . $startpoint . "," . $perPage;
        // $sql = "select photo, name$lang, slugvi, slugen, sale_price, regular_price, pre_price, discount, id, desc$lang, icon, attributes from #_product where $where order by numb,id desc $limit";
        // $product = $d->rawQuery($sql, $params);
        // $sqlNum = "select count(*) as 'num' from #_product where $where order by numb,id desc";
        // $count = $d->rawQueryOne($sqlNum, $params);
        // $total = (!empty($count)) ? $count['num'] : 0;
        // $url = $func->getCurrentPageURL();
        // $paging = $func->pagination($total, $perPage, $curPage, $url);
    } else {
        $productSales = $d->rawQuery("select id, name$lang, slugvi, slugen,desc$lang, photo, regular_price, sale_price, discount, attributes from #_product where type = ?  and find_in_set('hienthi',status)", array($type));
        $template = "product/product_filter";
    }
    /* breadCrumbs */
    if (!empty($titleMain))
        $breadcr->set($com, $titleMain);
    $breadcrumbs = $breadcr->get();
}
