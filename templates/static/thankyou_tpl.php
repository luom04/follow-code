<?php

if($code){
?>
<div class="thankyou-page container py-3 py-lg-4">
    <div class="card shadow-sm">
        <div class="card-body text-center">
            <h2 class="text-success mb-3">🎉 Đặt hàng thành công!</h2>
            <p class="mb-4">Cảm ơn <strong><?= $fullname ?></strong> đã tin tưởng đặt hàng.  
            Đơn hàng của bạn đã được ghi nhận với mã:</p>
            
            <h3 class="text-primary">#<?= $code ?></h3>
            <p><small>Ngày đặt: <?= date("d/m/Y H:i", $order_date) ?></small></p>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-header bg-light">
            <h5 class="mb-0">Thông tin đơn hàng</h5>
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

    <div class="text-center mt-4">
        <a href="/" class="btn btn-primary text-uppercase">Tiếp tục mua sắm</a>
    </div>
</div>
<?php } else { ?>
<div class="container py-3 py-lg-4">
    <div class="alert alert-danger w-100 text-center" role="alert">
        <strong>Không tìm thấy đơn hàng!</strong>
    </div>
</div>
<?php } ?>