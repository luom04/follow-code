<?php  
	if(!defined('SOURCES')) die("Error");

	/* Tìm kiếm sản phẩm */
	
	// $tukhoa = htmlspecialchars($_GET['keyword']); 
	$tukhoa = isset($_REQUEST['keyword']) ? htmlspecialchars($_REQUEST['keyword']) : '';


	// $type = (isset($_GET['type']) && $_GET['type'] != '') ? htmlspecialchars($_GET['type']) :'san-pham';  
	$idList = (isset($_GET['id_list']) && $_GET['id_list'] > 0) ? htmlspecialchars($_GET['id_list']) : 0; 
	$idDistrict = (isset($_GET['id_city']) && $_GET['id_city'] > 0) ? htmlspecialchars($_GET['id_city']) : 0;
	$idWards = (isset($_GET['id_ward']) && $_GET['id_ward'] > 0) ? htmlspecialchars($_GET['id_ward']) : 0;
	$iddientich = (isset($_GET['id_area']) && $_GET['id_area'] > 0) ? htmlspecialchars($_GET['id_area']) : 0;
	$idPricerange = (isset($_GET['id_khoanggia']) && $_GET['id_khoanggia'] > 0) ? htmlspecialchars($_GET['id_khoanggia']) : 0;
	$where = ""; // Khởi tạo mặc định
	$whereorder = "";
	
if($idList){
    $where .= " and id_list = ".$idList;
}
if($idDistrict){
    $where .= " and id_city = ".$idDistrict;
}
if($idWards){
    $where .= " and id_ward = ".$idWards;
}
if($iddientich){
    $dientich2 = $d->rawQueryOne("select min,max from #_search where id = ".$iddientich);
    $where .= " and id_area BETWEEN ".$dientich2['min']." AND " .$dientich2['max'];
}
if($idPricerange){
    $khoanggia2 = $d->rawQueryOne("select min,max from #_search where id = ".$idPricerange);
    $where .= " and regular_price BETWEEN ".$khoanggia2['min']." AND " .$khoanggia2['max'];
}
	// Từ khóa
if($tukhoa != '')
{
    $tukhoa1 = htmlspecialchars($_GET['keyword']);
    $tukhoa = $func->changeTitle($tukhoa1);

    $where .= " and (name$lang LIKE '%".$tukhoa1."%' 
                or slugvi LIKE '%".$tukhoa."%' 
                or slugen LIKE '%".$tukhoa."%')";
}

	$curPage = $getPage;
	$perPage = 10;
	$startpoint = ($curPage * $perPage) - $perPage;
    $limit = " limit " . $startpoint . "," . $perPage;
	 $sql = "select  photo, name$lang, slugvi, slugen, sale_price, regular_price, pre_price, discount, id,area,location,price_text,desc$lang, attributes  from #_product where type = 'san-pham' $where $whereorder and find_in_set('hienthi',status) order by numb,id desc $limit";
	$product = $d->rawQuery($sql);
	$sqlNum = "select count(*) as 'num' from #_product where type = 'san-pham' $where and find_in_set('hienthi',status) order by numb,id desc";
	$count = $d->rawQueryOne($sqlNum);
	$total = (!empty($count)) ? $count['num'] : 0;
	$url = $func->getCurrentPageURL();
	$paging = $func->pagination($total,$perPage,$curPage,$url);
	/* SEO */
	$seo->set('title', $titleMain);

	/* breadCrumbs */
	$breadcr->set('', $titleMain);
	$breadcrumbs = $breadcr->get();
?>

<?php /*
if (!defined('SOURCES')) die("Error");

/* Tìm kiếm sản phẩm 
if (!empty($_GET['keyword'])) {
    $tukhoa_show = htmlspecialchars($_GET['keyword']);
    $tukhoa = htmlspecialchars($_GET['keyword']);
    $tukhoa = $func->changeTitle($tukhoa);
    if ($tukhoa) {
        $where = "";
        $where = "type = ? and (name$lang LIKE ? or slugvi LIKE ? or slugen LIKE ? or code LIKE ?) and find_in_set('hienthi',status)";
        $params = array("san-pham", "%$tukhoa%", "%$tukhoa%", "%$tukhoa%", "%$tukhoa%");

        $curPage = $getPage;
        $perPage = 20;
        $startpoint = ($curPage * $perPage) - $perPage;
        $limit = " limit " . $startpoint . "," . $perPage;
        $sql = "select photo, name$lang, slugvi, slugen, sale_price, regular_price, discount, id from #_product where $where order by numb,id desc $limit";
        $product = $d->rawQuery($sql, $params);
        $sqlNum = "select count(*) as 'num' from #_product where $where order by numb,id desc";
        $count = $d->rawQueryOne($sqlNum, $params);
        $total = (!empty($count)) ? $count['num'] : 0;
        $url = $func->getCurrentPageURL();
        $paging = $func->pagination($total, $perPage, $curPage, $url);
    }
}

/* SEO 
$seo->set('title', $titleMain);

/* breadCrumbs
$breadcr->set('', $titleMain);
$breadcrumbs = $breadcr->get();
*/ ?>
