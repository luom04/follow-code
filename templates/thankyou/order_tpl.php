<?php
if($code){
?>
<div class="thankyou-page container py-3 py-lg-4">
    <div class="card shadow-sm">
        <div class="card-body text-center">
            <h2 class="text-success mb-3">🎉 Đặt hàng thành công!</h2>
            <p class="mb-4">Cảm ơn <span class="fw-bold"><?= $fullname ?></span> đã tin tưởng đặt hàng.  
            Đơn hàng của bạn đã được ghi nhận với mã:</p>
            
            <h3 class="text-primary">#<?= $code ?></h3>
            <p><small>Ngày đặt: <?= date("d/m/Y H:i", $order_date) ?></small></p>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-header bg-light">
            <h5 class="mb-0">Thông tin giao hàng</h5>
        </div>
        <div class="card-body">
            <div class="info-table">
                <div class="row">
                    <div class="cell th">Họ và tên</div>
                    <div class="cell td"><?= $fullname ?></div>
                </div>
                <div class="row">
                    <div class="cell th">Email</div>
                    <div class="cell td"><?= $email ?></div>
                </div>
                <div class="row">
                    <div class="cell th">Số điện thoại</div>
                    <div class="cell td"><?= $phone ?></div>
                </div>
                <div class="row">
                    <div class="cell th">Địa chỉ</div>
                    <div class="cell td"><?= $address ?></div>
                </div>
                <div class="row">
                    <div class="cell th">Phương thức thanh toán</div>
                    <div class="cell td"><?= $order_payment_text ?></div>
                </div>
            </div>
        </div>
    </div>

    <div class="card mt-3">
        <div class="card-header bg-light">
            <h5 class="mb-0">Chi tiết đơn hàng</h5>
        </div>
        <div class="card-body">
            <div class="list-procart">
                <div class="procart procart-label">
                    <div class="row row-10">
                        <div class="pic-procart d-none d-md-block col-3 col-md-2 mg-col-10 fw-bold"><?= hinhanh ?></div>
                        <div class="info-procart col-7 col-md-5 mg-col-10 fw-bold"><?= tensanpham ?></div>
                        <div class="quantity-procart d-none d-md-block col-3 col-md-2 mg-col-10 fw-bold"><?= soluong ?></div>
                        <div class="price-procart col-5 col-md-3 mg-col-10 fw-bold"><?= thanhtien ?></div>
                    </div>
                </div>
                <?php
                    foreach ($order_detail as $k => $v) {
                        $rowDetail = $d->rawQueryOne("select slugvi, slugen from #_product where id = ? ", array($v['id_product']));
                ?>
                    <div class="procart">
                        <div class="row row-10">
                            <div class="pic-procart col-3 col-md-2 mg-col-10">
                                <a class="text-decoration-none" href="<?= $rowDetail[$sluglang] ?>" target="_blank" title="<?= $v['name'] ?>">
                                    <?= $func->getImage(['sizes' => '85x85x1', 'upload' => UPLOAD_PRODUCT_L, 'image' => $v['photo'], 'alt' => $v['name']]) ?>
                                </a>
                            </div>
                            <div class="info-procart col-9 col-md-5 mg-col-10">
                                <h3 class="name-procart"><a class="text-decoration-none" href="<?= $rowDetail[$sluglang] ?>" target="_blank" title="<?= $v['name'] ?>"><?= $v['name'] ?></a></h3>
                                <?php if (!empty($v['attributes'])) { ?>    
                                    <div class="attribute-procart">
                                        <?= $v['attributes'] ?>
                                    </div>
                                <?php } ?>
                            </div>
                            <div class="quantity-procart d-flex align-items-center col-5 col-md-2 mg-col-10">
                                <span class="d-block d-md-none fw-bold">Số lượng:</span> <?=$v['quantity']?>
                            </div>
                            <div class="price-procart col-7 col-md-3 mg-col-10">
                                <?php if ($v['sale_price']) { ?>
                                <div>
                                    <p class="mb-0 price-new-cart">
                                        <?= $func->formatMoney($v['sale_price']) ?>   
                                    </p>
                                    <p class="mb-0 price-old-cart">
                                        <?= $func->formatMoney($v['regular_price']) ?>
                                    </p>
                                </div>
                                <?php } else { ?>
                                    <p class="mb-0 price-new-cart">
                                        <?= $func->formatMoney($v['regular_price']) ?>
                                    </p>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
            <div class="money-procart">
                <div class="total-procart">
                    <p><?= tongtien ?>:</p>
                    <p class="total-price load-price-total"><?= $func->formatMoney($order['total_price']) ?></p>
                </div>
            </div>
        </div>
    </div>

    <div class="text-center mt-4">
        <a href="<?= $rowDetail[$sluglang] ?>" class="btn btn-secondary text-uppercase fs-14 mx-2">Về sản phẩm vừa đặt</a>
        <a href="/" class="btn btn-primary text-uppercase fs-14 mx-2">Tiếp tục mua sắm</a>
    </div>
</div>
<?php } else { ?>
<div class="container py-3 py-lg-4">
    <div class="alert alert-danger w-100 text-center" role="alert">
        <strong>Không tìm thấy đơn hàng!</strong>
    </div>
</div>
<?php } ?>