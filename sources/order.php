<?php
if (!defined('SOURCES')) die("Error");

/* SEO */
$seo->set('title', $titleMain);

/* breadCrumbs */
if (!empty($titleMain)) $breadcr->set($com, $titleMain);
$breadcrumbs = $breadcr->get();

/* Tỉnh thành */
//$city = $d->rawQuery("select name, id from #_city order by numb desc");

/* Hình thức thanh toán */
$payments_info = $d->rawQuery("select name$lang, desc$lang, id from #_news where type = ? order by numb,id desc", array('hinh-thuc-thanh-toan'));

if (!empty($_POST['dataOrder'])) {
    /* Check order */
    if (empty($_SESSION['cart'])) {
        $func->transfer(donhangkhonghoplevuilongthulaisau, $configBase, false);
    }

    /* Data */
    $dataOrder = (!empty($_POST['dataOrder'])) ? $_POST['dataOrder'] : null;

    /* Info */
    $code = strtoupper($func->stringRandom(6));
    $order_date = time();
    $fullname = (!empty($dataOrder['fullname'])) ? htmlspecialchars($dataOrder['fullname']) : '';
    $email = (!empty($dataOrder['email'])) ? htmlspecialchars($dataOrder['email']) : '';
    $phone = (!empty($dataOrder['phone'])) ? htmlspecialchars($dataOrder['phone']) : '';
    $requirements = (!empty($dataOrder['requirements'])) ? htmlspecialchars($dataOrder['requirements']) : '';

    /* Place */
    $city = (!empty($dataOrder['city'])) ? htmlspecialchars($dataOrder['city']) : 0;
    $district = (!empty($dataOrder['district'])) ? htmlspecialchars($dataOrder['district']) : 0;
    $ward = (!empty($dataOrder['ward'])) ? htmlspecialchars($dataOrder['ward']) : 0;
    $city_text = $func->getInfoDetail('name', "city", $city);
    $ward_text = $func->getInfoDetail('name', "ward", $ward);
    $address = htmlspecialchars($dataOrder['address']) . ', ' . $ward_text['name'] . ', ' . $city_text['name'];

    /* Payment */
    $order_payment = (!empty($dataOrder['payments'])) ? htmlspecialchars($dataOrder['payments']) : 0;
    $order_payment_data = $func->getInfoDetail('namevi', 'news', $order_payment);
    $order_payment_text = $order_payment_data['namevi'];

    /* Ship */
    if (!empty($config['order']['ship'])) {
        $ship_data = (!empty($dataOrder['ward'])) ? $func->getInfoDetail('ship_price', "ward", $dataOrder['ward']) : array();
        $ship_price = (!empty($ship_data['ship_price'])) ? $ship_data['ship_price'] : 0;
    } else {
        $ship_price = 0;
    }

    /* Price */
    $temp_price = $cart->getOrderTotal();
    $total_price = (!empty($ship_price)) ? $cart->getOrderTotal() + $ship_price : $cart->getOrderTotal();

    /* Cart */
    $order_detail = '';
    $max = (!empty($_SESSION['cart'])) ? count($_SESSION['cart']) : 0;

    /* Valid data */
    if (empty($dataOrder['payments'])) {
        $response['messages'][] = chuachonhinhthucthanhtoan;
    }

    if (empty($dataOrder['fullname'])) {
        $response['messages'][] = hotenkhongduoctrong;
    }

    if (empty($dataOrder['phone'])) {
        $response['messages'][] = sodienthoaikhongduoctrong;
    }

    if (!empty($dataOrder['phone']) && !$func->isPhone($dataOrder['phone'])) {
        $response['messages'][] = sodienthoaikhonghople;
    }

    if (empty($dataOrder['city'])) {
        $response['messages'][] = chuachontinhthanhpho;
    }

    if (empty($dataOrder['ward'])) {
        $response['messages'][] = chuachonphuongxa;
    }


    if (empty($dataOrder['address'])) {
        $response['messages'][] = diachikhongduoctrong;
    }

    if (empty($dataOrder['email'])) {
        $response['messages'][] = emailkhongduoctrong;
    }

    if (!empty($dataOrder['email']) && !$func->isEmail($dataOrder['email'])) {
        $response['messages'][] = emailkhonghople;
    }

    if (!empty($response)) {
        /* Flash data */
        if (!empty($dataOrder)) {
            foreach ($dataOrder as $k => $v) {
                if (!empty($v)) {
                    $flash->set($k, $v);
                }
            }
        }

        /* Errors */
        $response['status'] = 'danger';
        $message = base64_encode(json_encode($response));
        $flash->set("message", $message);
        $func->redirect("gio-hang");
    }
    $data_donhangchitiet = [];
    /* Details order */
    for ($i = 0; $i < $max; $i++) {
        $pid = $_SESSION['cart'][$i]['productid'];
        $q = $_SESSION['cart'][$i]['qty'];
        $code_order = $_SESSION['cart'][$i]['code'];
        $variant = $_SESSION['cart'][$i]['variant'] ?: [];
        if ($q == 0) continue;

        $proinfo = $cart->getProductInfo($pid);
        
        // Lấy attribute text từ variant
        $text_attr = '';
        if (!empty($variant['options'])) {
            $arr = [];
            foreach ($variant['options'] as $opt) {
                if (is_array($opt) && isset($opt['attrName'], $opt['name'])) {
                    $arr[] = $opt['attrName'] . ': ' . $opt['name'];
                } elseif (is_string($opt)) {
                    // fallback nếu options chỉ là mảng key
                    $arr[] = $opt;
                }
            }
            $text_attr = implode(' - ', $arr);
        }
        // Giá mặc định từ product
        $pro_price      = $proinfo['regular_price'];
        $pro_price_new  = $proinfo['sale_price'];

        // Ưu tiên giá variant nếu có
        if (!empty($variant)) {
            if (!empty($variant['discount']) && $variant['discount'] > 0) {
                $pro_price_new = $variant['discount'];
                $pro_price = $variant['price'];
            } elseif (!empty($variant['price']) && $variant['price'] > 0) {
                $pro_price_new = $variant['price'];
                $pro_price = 0;
            }
        }
        $photo = !empty($variant['image']) ? $variant['image'] : $proinfo['photo'];
        $masp = !empty($variant['sku']) ? $variant['sku'] : $proinfo['code'];

        // Gom dữ liệu chi tiết đơn hàng vào mảng
        $data_donhangchitiet[] = [
            'id_product'     => $pid,
            'id_order'       => '',
            'photo'          => $photo,
            'name'           => $proinfo['name' . $lang],
            'code'           => $masp,
            'attributes'     => $text_attr,
            'regular_price'  => $pro_price,
            'sale_price'     => $pro_price_new,
            'quantity'       => $q
        ];

        /* Variables detail order */
        $orderDetailVars = array(
            '{productName}',
            '{productAttr}',
            '{productSalePrice}',
            '{productRegularPrice}',
            '{productQuantity}',
            '{productSaleTotalPrice}',
            '{productRegularTotalPrice}'
        );

        /* Values detail order */
        $orderDetailVals = array(
            $proinfo['name' . $lang],
            $text_attr,
            $func->formatMoney($pro_price_new),
            $func->formatMoney($pro_price),
            $q,
            $func->formatMoney($pro_price_new * $q),
            $func->formatMoney($pro_price * $q)
        );
        /* Get order details */
        $order_detail .= str_replace($orderDetailVars, $orderDetailVals, $emailer->markdown('order/details_'.$lang, ['productAttr' => $text_attr, 'salePrice' => $pro_price_new]));
    }

    /* Total order */
    /* Variables total order */
    $orderTotalVars = array(
        '{orderTempPrice}',
        '{orderShipPrice}',
        '{orderTotalPrice}'
    );

    /* Values total order */
    $orderTotalVals = array(
        $func->formatMoney($temp_price),
        $func->formatMoney($ship_price),
        $func->formatMoney($total_price)
    );

    /* Get total order */
    $order_detail .= str_replace($orderTotalVars, $orderTotalVals, $emailer->markdown('order/total_'.$lang, ['shipPrice' => $ship_price]));

    /* lưu đơn hàng */
    $data_donhang = array();
    $data_donhang['id_user'] = (!empty($_SESSION[$loginMember]['id'])) ? $_SESSION[$loginMember]['id'] : 0;
    $data_donhang['code'] = $code;
    $data_donhang['fullname'] = $fullname;
    $data_donhang['phone'] = $phone;
    $data_donhang['address'] = $address;
    $data_donhang['email'] = $email;
    $data_donhang['order_payment'] = $order_payment;
    $data_donhang['ship_price'] = $ship_price;
    $data_donhang['temp_price'] = $temp_price;
    $data_donhang['total_price'] = $total_price;
    $data_donhang['requirements'] = $requirements;
    $data_donhang['date_created'] = $order_date;
    $data_donhang['order_status'] = 1;
    $data_donhang['city'] = $city;
    $data_donhang['district'] = $district;
    $data_donhang['ward'] = $ward;
    $data_donhang['numb'] = 1;
    $id_insert = $d->insert('order', $data_donhang);

    /* lưu đơn hàng chi tiết */
    if ($id_insert) {
        foreach ($data_donhangchitiet as $chitiet) {
            $chitiet['id_order'] = $id_insert;
            $d->insert('order_detail', $chitiet);
        }
    }

    /* Defaults attributes email */
    $emailDefaultAttrs = $emailer->defaultAttrs();

    /* Variables email */
    $emailVars = array(
        '{emailOrderCode}',
        '{emailOrderInfoFullname}',
        '{emailOrderInfoEmail}',
        '{emailOrderInfoPhone}',
        '{emailOrderInfoAddress}',
        '{emailOrderPayment}',
        '{emailOrderShipPrice}',
        '{emailOrderInfoRequirements}',
        '{emailOrderDetails}'
    );
    $emailVars = $emailer->addAttrs($emailVars, $emailDefaultAttrs['vars']);

    /* Values email */
    $emailVals = array(
        $code,
        $fullname,
        $email,
        $phone,
        $address,
        $order_payment_text,
        $ship_price,
        $requirements,
        $order_detail
    );
    $emailVals = $emailer->addAttrs($emailVals, $emailDefaultAttrs['vals']);

    /* Send email admin */
    $arrayEmail = null;
    $subject = "Thông tin đơn hàng từ " . $setting['name' . $lang];
    $message = str_replace($emailVars, $emailVals, $emailer->markdown('order/admin_'.$lang, ['shipPrice' => $ship_price]));
    $file = '';
    $emailer->send("admin", $arrayEmail, $subject, $message, $file);

    /* Send email customer */
    $arrayEmail = array(
        "dataEmail" => array(
            "name" => $fullname,
            "email" => $email
        )
    );
    $subject = "Thông tin đơn hàng từ " . $setting['name' . $lang];
    $message = str_replace($emailVars, $emailVals, $emailer->markdown('order/customer_'.$lang, ['shipPrice' => $ship_price]));
    $file = '';
    $emailer->send("customer", $arrayEmail, $subject, $message, $file);


    /* Xóa giỏ hàng */
    unset($_SESSION['cart']);

    $flash->set("order_id", $id_insert);
    $flash->set("code", $code);
    $flash->set("order_date", $order_date);
    $flash->set("fullname", $fullname);
    $flash->set("email", $email);
    $flash->set("phone", $phone);
    $flash->set("address", $address);
    $flash->set("order_payment_text", $order_payment_text);

    $func->redirect("cam-on-da-dat-hang");
    // $func->transfer(thongtindonhangdaduocguithanhcong, $configBase);
}
