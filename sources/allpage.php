<?php
if (!defined('SOURCES'))
    die("Error");
$hinhanhs = $d->rawQuery("select id, name$lang, slugvi, slugen, photo from #_product where type = ?  and find_in_set('hienthi',status) limit 0,8", array('thu-vien-anh'));
$video_home = $d->rawQuery("select link, id, name$lang from #_photo where type = ? and act <> ? and find_in_set('hienthi',status) order by numb, id desc", array('video', 'photo_static'));
$cauhois = $d->rawQuery("select id, name$lang, desc$lang, photo from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc limit 0,8", array('cau-hoi'));

/* static */
$copyright = $cache->get("select name$lang, content$lang from #_static where type = ? limit 0,1", array('copyright'), 'fetch', 7200);
$bannertop = $cache->get("select name$lang, photo, link from #_photo where type = ? and act = ? and find_in_set('hienthi',status) limit 0,1", array('banner-top', 'photo_static'), 'fetch', 7200);

$favicon = $cache->get("select photo from #_photo where type = ? and act = ? and find_in_set('hienthi',status) limit 0,1", array('favicon', 'photo_static'), 'fetch', 7200);
$logo = $cache->get("select id, photo, options from #_photo where type = ? and act = ? and find_in_set('hienthi',status) limit 0,1", array('logo', 'photo_static'), 'fetch', 7200);
$logofooter = $cache->get("select id, photo, options from #_photo where type = ? and act = ? and find_in_set('hienthi',status) limit 0,1", array('logo-footer', 'photo_static'), 'fetch', 7200);

$banner = $cache->get("select photo from #_photo where type = ? and act = ? and find_in_set('hienthi',status) limit 0,1", array('banner', 'photo_static'), 'fetch', 7200);
$slogan = $d->rawQueryOne("select name$lang from #_static where type = ? limit 0,1", array('slogan'));
$footer = $cache->get("select name$lang, desc$lang, content$lang, photo from #_static where type = ? limit 0,1", array('footer'), 'fetch', 7200);
$footerHotro = $cache->get("select name$lang, desc$lang, content$lang, photo from #_static where type = ? limit 0,1", array('support'), 'fetch', 7200);
$tuyendung = $d->rawQuery("select id, name$lang, desc$lang, slugvi,slugen,date_created, type from #_news where type = ?  and find_in_set('hienthi',status) order by numb,id desc", array('tuyen-dung'));

$hochokhachhang = $d->rawQuery("select id, name$lang,subname$lang, desc$lang,phone,zalo,photo,icon from #_news where type = ?  and find_in_set('footer',status) and find_in_set('hienthi',status) order by numb,id desc limit 0,4", array('doi-ngu'));

$hotlines = $cache->get("select name$lang, desc$lang, photo, link from #_photo where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('hotline'), 'result', 7200);
$brands = $d->rawQuery("select id, name$lang, slugvi, slugen, photo, status from #_product_brand where type = ? and find_in_set('hienthi',status)", array('san-pham'));
$brandIndex = $brandInner = [];
foreach ($brands as $v) {
    if (strpos($v['status'], 'noibat') !== false) {
        $brandIndex[] = $v;
    }
    if (strpos($v['status'], 'noibat2') !== false) {
        $brandInner[] = $v;
    }
}

$bannerqc = $cache->get("select name$lang, photo, link from #_photo where type = ? and act = ? and find_in_set('hienthi',status) limit 0,1", array($type, 'photo_static'), 'fetch', 7200);
// $filterPrices = $d->rawQuery("select id ,name$lang,min,max,type from #_search where type = ? and hienthi > 0 ORDER BY stt, id DESC", array('khoang-gia'));
// $filterPrices = $d->rawQuery("select * from #_search where type = ? and hienthi > 0 ORDER BY stt, id DESC", array('khoang-gia'));
$prices = $d->rawQuery("select name$lang, price_from, price_to from #_tags where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('bo-loc-gia'));
$filterPrices = [];
foreach ($prices as $v) {
    $key = $v['price_from'] . '-' . $v['price_to'];
    $value = $v['name' . $lang];
    $filterPrices[$key] = $value;
}
// $filterColor = $d->rawQuery("select id, name$lang, photo from #_color where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('san-pham'));


$attrFilters = $_POST['attr'] ?? [];
$productIdsFinal = null; // null = chưa có nhóm nào hợp lệ

foreach ($attrFilters as $attrId => $optionIds) {
    $attrId = (int) $attrId;

    // optionIds có thể là "1,2" hoặc array -> ép về array int sạch
    if (!is_array($optionIds)) {
        $optionIds = explode(',', (string) $optionIds);
    }
    $optionIds = array_values(array_filter(array_map('intval', $optionIds)));

    if (empty($optionIds))
        continue; // bỏ qua nhóm không chọn gì

    $sql = "
        select distinct product_id
        from table_product_attribute_options
        where attribute_id = ?
          and option_id in (" . implode(',', $optionIds) . ")
    ";
    $rows = $d->rawQuery($sql, [$attrId]);

    $ids = array_values(array_map('intval', array_column($rows, 'product_id')));

    // Nếu group này không có sản phẩm nào -> AND chắc chắn rỗng luôn
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

// Chỉ add điều kiện khi thật sự có ít nhất 1 nhóm option được chọn
if ($productIdsFinal !== null) {
    if (!empty($productIdsFinal)) {
        $where .= " and id in (" . implode(',', $productIdsFinal) . ")";
    } else {
        $where .= " and 0=1";
    }
}


// $filterSizes = $d->rawQuery("select id, name$lang, photo from #_size where type = ? and find_in_set('hienthi',status) order by numb,id desc",array('san-pham'));
// $filterPrices = ['0-300000000' => 'Dưới 300tr', '300000000-500000000' => '300 - 500tr', '500000000-700000000' => '500 - 700tr', '700000000-1000000000' => '700 - 1tỷ', '1000000000-2000000000' => '1 - 2tỷ', '2000000000-3000000000' => '2 - 3tỷ', '3000000000' => 'Trên 3tỷ', 'a-z' => 'Giá từ thấp đến cao', 'z-a' => 'Giá từ cao đến thấp'];
// $filterNhienlieu = [
//     'nlxang' => 'Xăng',
//     'nldau' => 'Dầu',
//     'nldien' => 'Điện',
// ];
// $filterHopso = [
//     'sotudong' => 'Số tự động',
//     'sosan' => 'Số sàn'
// ];
// $filterXuatxu = [
//     'laprap' => 'Lắp ráp',
//     'nhapkhau' => 'Nhập khẩu'
// ];


// $allChuyenKhoas = $d->rawQuery("select id, name$lang, desc$lang, slugvi, slugen, photo, icon, status, type from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc",array('chuyen-khoa'));
// $allDichvus = $d->rawQuery("select id, name$lang, desc$lang, slugvi, slugen, photo, icon, status, type from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc",array('dich-vu'));
// $allGoiKhams = $d->rawQuery("select id, id_list, name$lang, slugvi, slugen, photo, regular_price, sale_price, discount from #_product where type = ? and find_in_set('hienthi',status)", array('goi-kham'));
// $allDonHangs = $d->rawQuery("select id, name$lang, subname$lang, desc$lang, link, slugvi, slugen, photo, date_timeline from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc limit 0,10",array('don-hang-ao'));
// $allDiadiems = $d->rawQuery("select name$lang, photo, slugvi, slugen, id from #_tags where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('dich-vu'));

/* multi */
$tagsProduct = $d->rawQuery("select name$lang, slugvi, slugen, id from #_tags where type = ? and find_in_set('noibat',status) and find_in_set('hienthi',status) order by numb,id desc", array('san-pham'));
// $tagsNews = $d->rawQuery("select name$lang, slugvi, slugen, id from #_tags where type = ? and find_in_set('noibat',status) and find_in_set('hienthi',status) order by numb,id desc", array('tin-tuc'));

$chinhsach = $d->rawQuery("select name$lang, slugvi, slugen, id, photo from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('chinh-sach'));
$huongdan = $d->rawQuery("select name$lang, slugvi, slugen, id, photo from #_news where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('huong-dan'));

$logo_chungchi = $d->rawQuery("select name$lang, photo, link from #_photo where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('chung-chi'));

$logo_payments = $d->rawQuery("select name$lang, photo, link from #_photo where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('payment-method'));
$social = $d->rawQuery("select name$lang, photo, link from #_photo where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('social'));

if ($_SESSION['pro_seen']) {
    $productSeens = $d->rawQuery("select photo, name$lang, slugvi, slugen, sale_price, regular_price, pre_price, discount, id, attributes from #_product where id in('" . join(",", $_SESSION['pro_seen']) . "') and type = ? and find_in_set('hienthi',status) limit 0,12", array('san-pham'));
} else {
    $productSeens = null;
}

$filterLists = $productListMenu = $d->rawQuery("
    SELECT 
        l.id, 
        l.namevi, 
        l.slugvi, 
        l.slugen, 
        l.photo, 
        l.icon, 
        l.status, 
        l.type,
        GROUP_CONCAT(CONCAT(c.id, '::', c.namevi) SEPARATOR '||') AS child_data
    FROM #_product_list l
    LEFT JOIN #_product_cat c ON c.id_list = l.id
    WHERE l.type = ? 
      AND FIND_IN_SET('hienthi', l.status)
    GROUP BY l.id
    ORDER BY l.numb, l.id DESC
", array('san-pham'));

foreach ($productListMenu as &$row) {
    if ($row['child_data']) {
        $childs = explode('||', $row['child_data']);
        $row['childs'] = array_map(function ($child) {
            list($id, $namevi) = explode('::', $child);
            return ['id' => $id, 'namevi' => $namevi];
        }, $childs);
    } else {
        $row['childs'] = [];
    }
    unset($row['child_data']);
}

$productListMenu = $d->rawQuery("select name$lang, desc$lang, slugvi, slugen, photo, icon, type, status, id from #_product_list where find_in_set('hienthi',status) order by numb,id desc", array());
$productListHot = [];
foreach ($productListMenu as $v) {
    if (strpos($v['status'], 'noibat') !== false) {
        $productListHot[] = $v;
    }
}



$newsListMenu = $d->rawQuery("select name$lang, desc$lang, slugvi, slugen, photo, icon, type, status, id from #_news_list where find_in_set('hienthi',status) order by numb,id desc", array());
$newsListMenuNews = [];
$newsListDichVuHot = [];

foreach ($newsListMenu as $v) {
    if ($v['type'] == 'tin-tuc') {
        $newsListMenuNews[] = $v;
        if (strpos($v['status'], 'noibat') !== false) {
            $newsListDichVuHot[] = $v;
        }
    }
}

/* Get statistic */
$counter = $statistic->getCounter();
$online = $statistic->getOnline();

$seopage = $d->rawQueryOne("select * from #_seopage where type = ? limit 0,1", array($type));

/* Newsletter */
if (!empty($_POST['dataNewsletter'])) {
    if ($config['googleAPI']['recaptcha']['active'] && $config['googleAPI']['recaptcha']['sitekey']) {
        $responseCaptcha = $_POST['recaptchaResponse'];
        $resultCaptcha = $func->checkRecaptcha($responseCaptcha);
        $scoreCaptcha = (!empty($resultCaptcha['score'])) ? $resultCaptcha['score'] : 0;
        $actionCaptcha = (!empty($resultCaptcha['action'])) ? $resultCaptcha['action'] : '';
        $testCaptcha = (!empty($resultCaptcha['test'])) ? $resultCaptcha['test'] : false;
    } else {
        $testCaptcha = true;
    }

    $dataNewsletter = (!empty($_POST['dataNewsletter'])) ? $_POST['dataNewsletter'] : null;

    /* Valid data */
    if (empty($dataNewsletter['email'])) {
        $flash->set('error', emailkhongduoctrong);
    }

    if (!empty($dataNewsletter['email']) && !$func->isEmail($dataNewsletter['email'])) {
        $flash->set('error', emailkhonghople);
    }
    // validate số điện thoại
    if (empty($dataNewsletter['phone'])) {
        $flash->set('error', sodienthoaikhongduoctrong);
    } else if (!$func->isPhone($dataNewsletter['phone'])) {
        $flash->set('error', sodienthoaikhonghople);
    }

    $error = $flash->get('error');

    if (!empty($error)) {
        $func->transfer($error, $configBase, false);
    }

    /* Save data */
    if (($scoreCaptcha >= 0.5 && $actionCaptcha == 'validation_newsletter') || $testCaptcha) {
        foreach ($dataNewsletter as $column => $value) {
            $dataNewsletter[$column] = htmlspecialchars($value);
        }
        $dataNewsletter['subject'] = 'Đăng ký nhận tin';
        $dataNewsletter['type'] = 'newsletter';
        $dataNewsletter['numb'] = 1;
        $dataNewsletter['date_created'] = time();
        if ($d->insert('newsletter', $dataNewsletter)) {

            /* Gán giá trị gửi email */
            $strThongtin = '';
            $emailer->set('tennguoigui', $dataNewsletter['fullname']);
            $emailer->set('emailnguoigui', $dataNewsletter['email']);
            $emailer->set('dienthoainguoigui', $dataNewsletter['phone']);
            $emailer->set('diachinguoigui', $dataNewsletter['address']);
            $emailer->set('tieudelienhe', $dataNewsletter['subject']);
            $emailer->set('noidunglienhe', $dataNewsletter['content']);
            if ($emailer->get('tennguoigui')) {
                $strThongtin .= '<span style="text-transform:capitalize">' . $emailer->get('tennguoigui') . '</span><br>';
            }
            if ($emailer->get('emailnguoigui')) {
                $strThongtin .= '<a href="mailto:' . $emailer->get('emailnguoigui') . '" target="_blank">' . $emailer->get('emailnguoigui') . '</a><br>';
            }
            if ($emailer->get('diachinguoigui')) {
                $strThongtin .= '' . $emailer->get('diachinguoigui') . '<br>';
            }
            if ($emailer->get('dienthoainguoigui')) {
                $strThongtin .= 'Tel: ' . $emailer->get('dienthoainguoigui') . '';
            }
            $emailer->set('thongtin', $strThongtin);

            /* Defaults attributes email */
            $emailDefaultAttrs = $emailer->defaultAttrs();

            /* Variables email */
            $emailVars = array(
                '{emailTitleSender}',
                '{emailInfoSender}',
                '{emailSubjectSender}',
                '{emailContentSender}'
            );
            $emailVars = $emailer->addAttrs($emailVars, $emailDefaultAttrs['vars']);

            /* Values email */
            $emailVals = array(
                $emailer->get('tennguoigui'),
                $emailer->get('thongtin'),
                $emailer->get('tieudelienhe'),
                $emailer->get('noidunglienhe')
            );
            $emailVals = $emailer->addAttrs($emailVals, $emailDefaultAttrs['vals']);

            /* Send email admin */
            $arrayEmail = null;
            $subject = "Đăng ký nhận tin " . $setting['name' . $lang];
            $message = str_replace($emailVars, $emailVals, $emailer->markdown('contact/admin_' . $lang));
            $file = 'file_attach';
            $emailer->send("admin", $arrayEmail, $subject, $message, $file);

            $func->transfer("Đăng ký nhận tin thành công. Chúng tôi sẽ liên hệ lại bạn trong thời gian sớm nhất", $configBase);
        } else {
            $func->transfer("Đăng ký thất bại. Vui lòng thử lại sau", $configBase, false);
        }
    } else {
        $func->transfer("Đăng ký thất bại. Vui lòng thử lại sau", $configBase, false);
    }
}

/* Tư vấn */
if (!empty($_POST['dataTuvan'])) {

    /* Bỏ kiểm tra Recaptcha – luôn cho phép */
    $testCaptcha = true;

    /* Lấy dữ liệu */
    $dataTuvan = (!empty($_POST['dataTuvan'])) ? $_POST['dataTuvan'] : null;

    /* Kiểm tra lỗi flash */
    $error = $flash->get('error');
    if (!empty($error)) {
        $func->transfer($error, $configBase, false);
    }

    /* Lưu dữ liệu */
    if ($testCaptcha) {
        foreach ($dataTuvan as $column => $value) {
            $dataTuvan[$column] = htmlspecialchars($value);
        }

        $dataTuvan['subject'] = 'Đăng ký tư vấn';
        $dataTuvan['type'] = 'tu-van';
        $dataTuvan['numb'] = 1;
        $dataTuvan['date_created'] = time();

        if ($d->insert('newsletter', $dataTuvan)) {

            /* Gán giá trị gửi email */
            $strThongtin = '';
            $emailer->set('tennguoigui', $dataTuvan['fullname']);
            $emailer->set('dienthoainguoigui', $dataTuvan['phone']);
            $emailer->set('noidunglienhe', $dataTuvan['notes']);
            $emailer->set('tieudelienhe', $dataTuvan['subject']); // BẮT BUỘC – KHÔNG ĐƯỢC XOÁ

            if ($emailer->get('tennguoigui')) {
                $strThongtin .= '<span style="text-transform:capitalize">' . $emailer->get('tennguoigui') . '</span><br>';
            }
            if ($emailer->get('dienthoainguoigui')) {
                $strThongtin .= 'Tel: ' . $emailer->get('dienthoainguoigui') . '<br>';
            }

            $emailer->set('thongtin', $strThongtin);

            /* Defaults attributes email */
            $emailDefaultAttrs = $emailer->defaultAttrs();

            /* Variables email */
            $emailVars = array(
                '{emailTitleSender}',
                '{emailInfoSender}',
                '{emailSubjectSender}',
                '{emailContentSender}'
            );
            $emailVars = $emailer->addAttrs($emailVars, $emailDefaultAttrs['vars']);

            /* Values email */
            $emailVals = array(
                $emailer->get('tennguoigui'),
                $emailer->get('thongtin'),
                $emailer->get('tieudelienhe'),
                $emailer->get('noidunglienhe')
            );
            $emailVals = $emailer->addAttrs($emailVals, $emailDefaultAttrs['vals']);

            /* Send email admin */
            $arrayEmail = null;
            $subject = "Đăng ký tư vấn " . $setting['name' . $lang];

            // Lấy template email
            $message = $emailer->markdown('contact/admin_' . $lang);

            // Nếu template rỗng -> tạo fallback tránh lỗi Message body empty
            if (empty(trim($message))) {
                $message = "
                    <h3>Thông tin đăng ký</h3>
                    <p><strong>Họ tên:</strong> " . $emailer->get('tennguoigui') . "</p>
                    <p><strong>SĐT:</strong> " . $emailer->get('dienthoainguoigui') . "</p>
                    <p><strong>Nội dung:</strong> " . $emailer->get('noidunglienhe') . "</p>
                ";
            }

            // Thay biến
            $message = str_replace($emailVars, $emailVals, $message);

            $file = 'file_attach';
            $emailer->send("admin", $arrayEmail, $subject, $message, $file);

            /* Thông báo thành công */
            $func->transfer("Đăng ký thành công. Chúng tôi sẽ liên hệ bạn sớm nhất!", $configBase);
        } else {
            $func->transfer("Đăng ký thất bại. Vui lòng thử lại sau", $configBase, false);
        }
    } else {
        $func->transfer("Đăng ký thất bại. Vui lòng thử lại sau", $configBase, false);
    }
}
/* Advisory */
if (!empty($_POST['dataAdvisory'])) {

    if ($config['googleAPI']['recaptcha']['active'] && $config['googleAPI']['recaptcha']['sitekey']) {
        $responseCaptcha = $_POST['recaptchaResponse'];
        $resultCaptcha = $func->checkRecaptcha($responseCaptcha);
        $scoreCaptcha = (!empty($resultCaptcha['score'])) ? $resultCaptcha['score'] : 0;
        $actionCaptcha = (!empty($resultCaptcha['action'])) ? $resultCaptcha['action'] : '';
        $testCaptcha = (!empty($resultCaptcha['test'])) ? $resultCaptcha['test'] : false;
    } else {
        $testCaptcha = true;
    }

    $dataAdvisory = (!empty($_POST['dataAdvisory'])) ? $_POST['dataAdvisory'] : null;

    /* Save data */
    if (($scoreCaptcha >= 0.5 && $actionCaptcha == 'validation_advisory') || $testCaptcha) {
        foreach ($dataAdvisory as $column => $value) {
            $dataAdvisory[$column] = htmlspecialchars($value);
        }
        if ($d->insert('newsletter', $dataAdvisory)) {

            /* Gán giá trị gửi email */
            $strThongtin = '';
            $emailer->set('tennguoigui', $dataAdvisory['fullname']);
            $emailer->set('dienthoainguoigui', $dataAdvisory['phone']);
            $emailer->set('tieudelienhe', $dataAdvisory['subject']);
            if ($emailer->get('tennguoigui')) {
                $strThongtin .= '<span style="text-transform:capitalize">' . $emailer->get('tennguoigui') . '</span><br>';
            }
            if ($emailer->get('emailnguoigui')) {
                $strThongtin .= '<a href="mailto:' . $emailer->get('emailnguoigui') . '" target="_blank">' . $emailer->get('emailnguoigui') . '</a><br>';
            }
            if ($emailer->get('diachinguoigui')) {
                $strThongtin .= '' . $emailer->get('diachinguoigui') . '<br>';
            }
            if ($emailer->get('dienthoainguoigui')) {
                $strThongtin .= 'Tel: ' . $emailer->get('dienthoainguoigui') . '';
            }
            $emailer->set('thongtin', $strThongtin);

            /* Defaults attributes email */
            $emailDefaultAttrs = $emailer->defaultAttrs();

            /* Variables email */
            $emailVars = array(
                '{emailTitleSender}',
                '{emailInfoSender}',
                '{emailSubjectSender}',
                '{emailContentSender}'
            );
            $emailVars = $emailer->addAttrs($emailVars, $emailDefaultAttrs['vars']);

            /* Values email */
            $emailVals = array(
                $emailer->get('tennguoigui'),
                $emailer->get('thongtin'),
                $emailer->get('tieudelienhe'),
                $emailer->get('noidunglienhe')
            );
            $emailVals = $emailer->addAttrs($emailVals, $emailDefaultAttrs['vals']);

            /* Send email admin */
            $arrayEmail = null;
            $subject = "Đăng ký tư vấn " . $setting['name' . $lang];
            $message = str_replace($emailVars, $emailVals, $emailer->markdown('contact/admin_' . $lang));
            $file = 'file_attach';
            $emailer->send("admin", $arrayEmail, $subject, $message, $file);

            $func->transfer("Đăng ký tư vấn thành công. Chúng tôi sẽ liên hệ lại bạn trong thời gian sớm nhất", $_SERVER['HTTP_REFERER']);
        } else {
            $func->transfer("Đăng ký thất bại. Vui lòng thử lại sau", $_SERVER['HTTP_REFERER'], false);
        }
    } else {
        $func->transfer("Đăng ký thất bại. Vui lòng thử lại sau", $_SERVER['HTTP_REFERER'], false);
    }
}

/* Booking */
if (!empty($_POST['submit-appointment'])) {
    // $responseCaptcha = $_POST['recaptcha_response_sellcar'];
    // $resultCaptcha = $func->checkRecaptcha($responseCaptcha);
    // $scoreCaptcha = (!empty($resultCaptcha['score'])) ? $resultCaptcha['score'] : 0;
    // $actionCaptcha = (!empty($resultCaptcha['action'])) ? $resultCaptcha['action'] : '';
    // $testCaptcha = (!empty($resultCaptcha['test'])) ? $resultCaptcha['test'] : false;
    $dataAppointment = (!empty($_POST['dataAppointment'])) ? $_POST['dataAppointment'] : null;

    /* Save data */
    // if (($scoreCaptcha >= 0.5 && $actionCaptcha == 'Sellcar') || true) {
    if (true) {
        foreach ($dataAppointment as $column => $value) {
            if (is_array($value)) {
                $dataAppointment[$column] = json_encode($value, true);
            } else {
                $dataAppointment[$column] = htmlspecialchars($value);
            }
        }
        $dataAppointment['subject'] = 'Đăng ký khám "' . $dataAppointment['subject'] . '"';
        $dataAppointment['type'] = 'dang-ky-kham';
        $dataAppointment['numb'] = 1;
        $dataAppointment['date_created'] = time();

        if ($d->insert('newsletter', $dataAppointment)) {

            /* Gán giá trị gửi email */
            $strThongtin = '';
            $emailer->set('tennguoigui', $dataAppointment['fullname']);
            $emailer->set('dienthoainguoigui', $dataAppointment['phone']);
            $emailer->set('tieudelienhe', $dataAppointment['subject']);
            if ($emailer->get('tennguoigui')) {
                $strThongtin .= '<span style="text-transform:capitalize">' . $emailer->get('tennguoigui') . '</span><br>';
            }
            if ($emailer->get('emailnguoigui')) {
                $strThongtin .= '<a href="mailto:' . $emailer->get('emailnguoigui') . '" target="_blank">' . $emailer->get('emailnguoigui') . '</a><br>';
            }
            if ($emailer->get('diachinguoigui')) {
                $strThongtin .= '' . $emailer->get('diachinguoigui') . '<br>';
            }
            if ($emailer->get('dienthoainguoigui')) {
                $strThongtin .= 'Tel: ' . $emailer->get('dienthoainguoigui') . '<br>';
            }

            if ($dataAppointment['attributes']) {
                $attrs = json_decode($dataAppointment['attributes'], true);
                if ($attrs['ngaysinh']) {
                    $strThongtin .= 'Ngày sinh: ' . $attrs['ngaysinh'] . '<br>';
                }
                if ($attrs['gioitinh']) {
                    $strThongtin .= 'Giới tính: ' . $attrs['gioitinh'] . '<br>';
                }
                if ($attrs['bacsi']) {
                    $strThongtin .= 'Bác sĩ: ' . $attrs['bacsi'] . '<br>';
                }
                if ($attrs['ngaykham']) {
                    $strThongtin .= 'Ngày khám: ' . $attrs['ngaykham'] . '<br>';
                }
                if ($attrs['giokham']) {
                    $strThongtin .= 'Giờ khám: ' . $attrs['giokham'] . '<br>';
                }
            }

            $emailer->set('thongtin', $strThongtin);

            /* Defaults attributes email */
            $emailDefaultAttrs = $emailer->defaultAttrs();

            /* Variables email */
            $emailVars = array(
                '{emailTitleSender}',
                '{emailInfoSender}',
                '{emailSubjectSender}',
                '{emailContentSender}'
            );
            $emailVars = $emailer->addAttrs($emailVars, $emailDefaultAttrs['vars']);

            /* Values email */
            $emailVals = array(
                $emailer->get('tennguoigui'),
                $emailer->get('thongtin'),
                $emailer->get('tieudelienhe'),
                $emailer->get('noidunglienhe')
            );
            $emailVals = $emailer->addAttrs($emailVals, $emailDefaultAttrs['vals']);

            /* Send email admin */
            $arrayEmail = null;
            $subject = "Đăng ký lịch khám " . $setting['name' . $lang];
            $message = str_replace($emailVars, $emailVals, $emailer->markdown('contact/admin_' . $lang));
            $file = 'file_attach';

            $emailer->send("admin", $arrayEmail, $subject, $message, $file);

            $func->transfer("Đơn hàng của bạn đặt thành công. Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất", @$_SERVER['HTTP_REFERER'] ?: $configBase);
        } else {
            $func->transfer("Đăng ký thất bại. Vui lòng thử lại sau", @$_SERVER['HTTP_REFERER'] ?: $configBase, false);
        }
    } else {
        $func->transfer("Đăng ký thất bại. Vui lòng thử lại sau", @$_SERVER['HTTP_REFERER'] ?: $configBase, false);
    }
}



/* Đặt xe */
if (!empty($_POST['dataDatxe'])) {
    if ($config['googleAPI']['recaptcha']['active'] && $config['googleAPI']['recaptcha']['sitekey']) {
        $responseCaptcha = $_POST['recaptchaResponse'];
        $resultCaptcha = $func->checkRecaptcha($responseCaptcha);
        $scoreCaptcha = (!empty($resultCaptcha['score'])) ? $resultCaptcha['score'] : 0;
        $actionCaptcha = (!empty($resultCaptcha['action'])) ? $resultCaptcha['action'] : '';
        $testCaptcha = (!empty($resultCaptcha['test'])) ? $resultCaptcha['test'] : false;
    } else {
        $testCaptcha = true;
    }

    $dataDatxe = (!empty($_POST['dataDatxe'])) ? $_POST['dataDatxe'] : null;

    /* Valid data */
    if (empty($dataDatxe['email'])) {
        $flash->set('error', emailkhongduoctrong);
    }

    if (!empty($dataDatxe['email']) && !$func->isEmail($dataDatxe['email'])) {
        $flash->set('error', emailkhonghople);
    }
    if (empty($dataDatxe['fullname'])) {
        $flash->set('error', 'Vui lòng nhập họ và tên');
    }

    if (empty($dataDatxe['phone'])) {
        $flash->set('error', 'Vui lòng nhập số điện thoại');
    }

    if (empty($dataDatxe['ngaydi'])) {
        $flash->set('error', 'Vui lòng nhập ngày đi');
    }

    if (empty($dataDatxe['ngayve'])) {
        $flash->set('error', 'Vui lòng nhập ngày về');
    }

    if (empty($dataDatxe['loaixe'])) {
        $flash->set('error', 'Vui lòng chọn loại xe');
    }

    if (empty($dataDatxe['content'])) {
        $flash->set('error', 'Vui lòng nhập lịch trình chi tiết');
    }

    $error = $flash->get('error');

    if (!empty($error)) {
        $func->transfer($error, $configBase, false);
    }

    /* Save data */
    if (($scoreCaptcha >= 0.5 && $actionCaptcha == 'validation_newsletter') || $testCaptcha) {
        foreach ($dataDatxe as $column => $value) {
            $dataDatxe[$column] = htmlspecialchars($value);
        }
        $dataDatxe['ngaydi'] = strtotime($dataDatxe['ngaydi']);
        $dataDatxe['ngayve'] = strtotime($dataDatxe['ngayve']);
        $dataDatxe['subject'] = 'Đặt xe';
        $dataDatxe['type'] = 'datxe';
        $dataDatxe['numb'] = 1;
        $dataDatxe['date_created'] = time();
        if ($d->insert('newsletter', $dataDatxe)) {

            /* Gán giá trị gửi email */
            $strThongtin = '';
            $emailer->set('tennguoigui', $dataDatxe['fullname']);
            $emailer->set('emailnguoigui', $dataDatxe['email']);
            $emailer->set('dienthoainguoigui', $dataDatxe['phone']);
            $emailer->set('diachinguoigui', $dataDatxe['address']);
            $emailer->set('tieudelienhe', $dataDatxe['subject']);
            $emailer->set('noidunglienhe', $dataDatxe['content']);
            if ($emailer->get('tennguoigui')) {
                $strThongtin .= '<span style="text-transform:capitalize">' . $emailer->get('tennguoigui') . '</span><br>';
            }
            if ($emailer->get('emailnguoigui')) {
                $strThongtin .= '<a href="mailto:' . $emailer->get('emailnguoigui') . '" target="_blank">' . $emailer->get('emailnguoigui') . '</a><br>';
            }
            if ($emailer->get('diachinguoigui')) {
                $strThongtin .= '' . $emailer->get('diachinguoigui') . '<br>';
            }
            if ($emailer->get('dienthoainguoigui')) {
                $strThongtin .= 'Tel: ' . $emailer->get('dienthoainguoigui') . '';
            }
            $emailer->set('thongtin', $strThongtin);

            /* Defaults attributes email */
            $emailDefaultAttrs = $emailer->defaultAttrs();

            /* Variables email */
            $emailVars = array(
                '{emailTitleSender}',
                '{emailInfoSender}',
                '{emailSubjectSender}',
                '{emailContentSender}'
            );
            $emailVars = $emailer->addAttrs($emailVars, $emailDefaultAttrs['vars']);

            /* Values email */
            $emailVals = array(
                $emailer->get('tennguoigui'),
                $emailer->get('thongtin'),
                $emailer->get('tieudelienhe'),
                $emailer->get('noidunglienhe')
            );
            $emailVals = $emailer->addAttrs($emailVals, $emailDefaultAttrs['vals']);

            /* Send email admin */
            $arrayEmail = null;
            $subject = "Đặt xe " . $setting['name' . $lang];
            $message = str_replace($emailVars, $emailVals, $emailer->markdown('contact/admin_' . $lang));
            $file = 'file_attach';
            $emailer->send("admin", $arrayEmail, $subject, $message, $file);

            $func->transfer("Đặt xe thành công. Chúng tôi sẽ liên hệ lại bạn trong thời gian sớm nhất", $configBase);
        } else {
            $func->transfer("Đặt xe thất bại. Vui lòng thử lại sau", $configBase, false);
        }
    } else {
        $func->transfer("Đặt xe thất bại. Vui lòng thử lại sau", $configBase, false);
    }
}
