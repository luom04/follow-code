<?php
include "config.php";

$cmd = (!empty($_POST['cmd'])) ? htmlspecialchars($_POST['cmd']) : '';
$id = (!empty($_POST['id'])) ? htmlspecialchars($_POST['id']) : 0;
$variant = (!empty($_POST['variant'])) ? $_POST['variant'] : [];
$quantity = (!empty($_POST['quantity'])) ? htmlspecialchars($_POST['quantity']) : 1;
$code = (!empty($_POST['code'])) ? htmlspecialchars($_POST['code']) : '';
$ward = (!empty($_POST['ward'])) ? htmlspecialchars($_POST['ward']) : 0;

if ($cmd == 'add-cart' && $id > 0) {
    $cart->addToCart($quantity, $id, $variant);
    $max = (!empty($_SESSION['cart'])) ? count($_SESSION['cart']) : 0;
    $data = array('max' => $max);

    echo json_encode($data);
} else if ($cmd == 'update-cart' && $id > 0 && $code != '') {
    if (!empty($_SESSION['cart'])) {
        $max = count($_SESSION['cart']);
        for ($i = 0; $i < $max; $i++) {
            if ($code == $_SESSION['cart'][$i]['code']) {
                $variant = $_SESSION['cart'][$i]['variant'] ?: [];
                if ($quantity) $_SESSION['cart'][$i]['qty'] = $quantity;
                break;
            }
        }
    }

    if (!empty($config['order']['ship'])) {
        $shipData = (!empty($ward)) ? $func->getInfoDetail('ship_price', "ward", $ward) : array();
        $ship = (!empty($shipData)) ? $shipData['ship_price'] : 0;
    }

    $proinfo = $cart->getProductInfo($id);
    $pro_price = $proinfo['regular_price'];
    $pro_price_new = $proinfo['sale_price'];

    // Nếu variant có giá thì override
    $variant_price = $variant['price'] ?: 0;
    $variant_discount = $variant['discount'] ?: 0;

    $pro_price = ($variant_price > 0) ? $variant_price : $pro_price;
    $pro_price_new = ($variant_discount > 0) ? $variant_discount : $pro_price_new;

    $pro_price_qty = $pro_price * $quantity;
    $pro_price_new_qty = $pro_price_new * $quantity;



    $pro_price = $func->formatMoney($pro_price * $quantity);
    $pro_price_new = $func->formatMoney($pro_price_new * $quantity);

    $temp = $cart->getOrderTotal();
    $tempText = $func->formatMoney($temp);
    $total = $cart->getOrderTotal();
    if (!empty($ship)) $total += $ship;
    $totalText = $func->formatMoney($total);
    $data = array('regularPrice' => $pro_price, 'salePrice' => $pro_price_new, 'tempText' => $tempText, 'totalText' => $totalText);

    echo json_encode($data);
} else if ($cmd == 'delete-cart' && $code != '') {
    if (!empty($config['order']['ship'])) {
        $shipData = (!empty($ward)) ? $func->getInfoDetail('ship_price', "ward", $ward) : array();
        $ship = (!empty($shipData)) ? $shipData['ship_price'] : 0;
    }

    $cart->removeProduct($code);
    $max = (!empty($_SESSION['cart'])) ? count($_SESSION['cart']) : 0;
    $temp = $cart->getOrderTotal();
    $tempText = $func->formatMoney($temp);
    $total = $cart->getOrderTotal();
    if (!empty($ship)) $total += $ship;
    $totalText = $func->formatMoney($total);
    $data = array('max' => $max, 'tempText' => $tempText, 'totalText' => $totalText);

    echo json_encode($data);
} else if ($cmd == 'ship-cart') {
    $shipData = array();
    $shipPrice = 0;
    $shipText = '0đ';
    $total = 0;
    $totalText = '';

    if ($id) $shipData = $func->getInfoDetail('ship_price', "ward", $id);

    $total = $cart->getOrderTotal();
    if (!empty($shipData['ship_price'])) {
        $total += $shipData['ship_price'];
        $shipText = $func->formatMoney($shipData['ship_price']);
    }
    $totalText = $func->formatMoney($total);
    $shipPrice = (!empty($shipData['ship_price'])) ? $shipData['ship_price'] : 0;
    $data = array('shipText' => $shipText, 'ship' => $shipPrice, 'totalText' => $totalText);

    echo json_encode($data);
} else if ($cmd == 'popup-cart') { ?>
    <form class="form-cart" method="post" action="" enctype="multipart/form-data">
        <div class="wrap-cart">
            <div class="top-cart border-right-0">
                <div class="list-procart">
                    <div class="procart procart-label">
                        <div class="row row-10">
                            <div class="pic-procart d-none d-md-block col-3 col-md-2 mg-col-10"><?= hinhanh ?></div>
                            <div class="info-procart col-7 col-md-5 mg-col-10"><?= tensanpham ?></div>
                            <div class="quantity-procart d-none d-md-block col-3 col-md-2 mg-col-10"><?= soluong ?></div>
                            <div class="price-procart col-5 col-md-3 mg-col-10"><?= thanhtien ?></div>
                        </div>
                    </div>
                    <?php $max = count($_SESSION['cart']);
                    for ($i = 0; $i < $max; $i++) {
                        $pid = $_SESSION['cart'][$i]['productid'];
                        $quantity = $_SESSION['cart'][$i]['qty'];
                        $code = ($_SESSION['cart'][$i]['code']) ? $_SESSION['cart'][$i]['code'] : '';
                        $variant = $_SESSION['cart'][$i]['variant'] ?: [];
                        $proinfo = $cart->getProductInfo($pid);
                        $photo = !empty($variant['image']) ? $variant['image'] : $proinfo['photo'];
                        $pro_price = $proinfo['regular_price'];
                        $pro_price_new = $proinfo['sale_price'];

                        // Nếu variant có giá thì override
                        $variant_price = $variant['price'] ?: 0;
                        $variant_discount = $variant['discount'] ?: 0;

                        $pro_price = ($variant_price > 0) ? $variant_price : $pro_price;
                        $pro_price_new = ($variant_discount > 0) ? $variant_discount : $pro_price_new;

                        $pro_price_qty = $pro_price * $quantity;
                        $pro_price_new_qty = $pro_price_new * $quantity;
                    ?>
                        <div class="procart procart-<?= $code ?>">
                            <div class="row row-10">
                                <div class="pic-procart col-3 col-md-2 mg-col-10">
                                    <a class="text-decoration-none" href="<?= $proinfo[$sluglang] ?>" target="_blank" title="<?= $proinfo['name' . $lang] ?>"><?= $func->getImage(['sizes' => '85x85x2', 'upload' => UPLOAD_PRODUCT_L, 'image' => $photo, 'alt' => $proinfo['name' . $lang]]) ?></a>
                                    <a class="del-procart text-decoration-none" data-code="<?= $code ?>">
                                        <i class="fa fa-times-circle"></i>
                                        <span><?= xoa ?></span>
                                    </a>
                                </div>
                                <div class="info-procart col-6 col-md-5 mg-col-10">
                                    <h3 class="name-procart"><a class="text-decoration-none" href="<?= $proinfo[$sluglang] ?>" target="_blank" title="<?= $proinfo['name' . $lang] ?>"><?= $proinfo['name' . $lang] ?></a></h3>
                                    <?php if (!empty($variant['options'])) { ?>
                                        <div class="attribute-procart">
                                            <?php foreach ($variant['options'] as $opt) { ?>
                                                <span class="badge bg-light fw-600 text-sm text-dark"><?= $opt['attrName'] ?>: <?= $opt['name'] ?></span>
                                            <?php } ?>
                                        </div>
                                    <?php } ?>
                                </div>
                                <div class="quantity-procart d-flex align-items-center col-5 col-md-2 mg-col-10">
                                    
                                    <div class="quantity-counter-procart quantity-counter-procart-<?= $code ?>">
                                        <span class="counter-procart-minus counter-procart">-</span>
                                        <input type="number" class="quantity-procart" min="1" value="<?= $quantity ?>" data-pid="<?= $pid ?>" data-code="<?= $code ?>" />
                                        <span class="counter-procart-plus counter-procart">+</span>
                                    </div>
                                </div>
                                <div class="price-procart col-7 col-md-3 mg-col-10">
                                    <?php if ($pro_price_new) { ?>
                                        <p class="price-new-cart load-price-new-<?= $code ?>">
                                            <?= $func->formatMoney($pro_price_new_qty) ?>
                                        </p>
                                        <p class="price-old-cart load-price-<?= $code ?>">
                                            <?= $func->formatMoney($pro_price_qty) ?>
                                        </p>
                                    <?php } else { ?>
                                        <p class="price-new-cart load-price-<?= $code ?>">
                                            <?= $func->formatMoney($pro_price_qty) ?>
                                        </p>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                </div>
                <div class="money-procart">
                    <div class="total-procart">
                        <p><?= tamtinh ?>:</p>
                        <p class="total-price load-price-temp"><?= $func->formatMoney($cart->getOrderTotal()) ?></p>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="san-pham" class="btn-main outline px-3 py-2" title="<?= tieptucmuahang ?>">
                        <i class="fa fa-angle-double-left"></i>
                        <span><?= tieptucmuahang ?></span>
                    </a>
                    <a class="btn btn-primary text-uppercase btn-cart" href="gio-hang" title="<?= thanhtoan ?>"><?= thanhtoan ?></a>
                </div>
            </div>
        </div>
    </form>
<?php }
?>