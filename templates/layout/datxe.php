<div class="all_dknt ">
    <form class="validation-newsletter p-2 plg-0 " novalidate="" id="frm-newsletter" method="post" action="" enctype="multipart/form-data">
        <div class="all_dknt1 position-relative">
            <div class="row">
                <div class="newsletter-input col-12 col-lg-3 py-1 py-lg-2">
                    <span class="d-block"> Ngày đi</span>
                    <input type="date" class="form-control text-sm" id="ngaydi-newsletter" name="dataDatxe[ngaydi]" value="<?= $flash->get('ngaydi') ?>" placeholder="Ngày đi" required="">
                    <div class="invalid-feedback">Vui lòng nhập ngày đi</div>
                </div>
                <div class="newsletter-input col-12 col-lg-3 py-1 py-lg-2">
                    <span> Ngày về</span>
                    <input type="date" class="form-control text-sm" id="ngayve-newsletter" name="dataDatxe[ngayve]" value="<?= $flash->get('ngayve') ?>" placeholder="Ngày về" required="">
                    <div class="invalid-feedback">Vui lòng nhập ngày về</div>
                </div>

                <div class="newsletter-input col-12 col-lg-3 py-1 py-lg-2">
                    <span>Họ và tên</span>
                    <input type="text" class="form-control text-sm" id="fullname-newsletter" name="dataDatxe[fullname]" value="<?= $flash->get('fullname') ?>" placeholder="Nhập họ tên" required="">
                    <div class="invalid-feedback">Vui lòng nhập họ và tên</div>
                </div>
                <div class="newsletter-input col-12 col-lg-3 py-1 py-lg-2">
                    <span>Số điện thoại</span>
                    <input type="number" class="form-control text-sm" id="phone-newsletter" name="dataDatxe[phone]" value="<?= $flash->get('phone') ?>" placeholder="Nhập số điện thoại" required="">
                    <div class="invalid-feedback">Vui lòng nhập số điện thoại</div>
                </div>
            </div>

            <div class="row w-100" >
                <div class="newsletter-input col-lg-4 col-12 py-1 py-lg-2">
                    <span>Email</span>
                    <input type="email" class="form-control text-sm" id="email-newsletter" name="dataDatxe[email]" value="<?= $flash->get('email') ?>" placeholder="Nhập email">
                    <div class="invalid-feedback">Vui lòng nhập địa chỉ email</div>
                </div>
                <div class="newsletter-input col-lg-4 col-12 py-1 py-lg-2">
                    <span>Loại xe</span>

                    <select name="dataDatxe[loaixe]" id="loaixe-newsletter" required="">
                        <option value="">Loại xe</option>
                        <?php foreach ($loaixe as $v) { ?>
                        <option value="<?= $v['id'] ?>"><?= $v['name'.$lang] ?></option>
                        <?php } ?>
                    </select>
                </div>

                <div class="newsletter-input col-lg-4 col-12 py-1 py-lg-2">
                    <span>Lịch trình chi tiết</span>
                    <textarea type="text" class="form-control" id="content-newsletter" name="dataDatxe[content]" placeholder="Lịch trình chi tiết" required=""></textarea>
                    <div class="invalid-feedback">Vui lòng nhập lịch trình chi tiết</div>
                </div>
            </div>
            <div class="newsletter-button">
                <input type="submit" class="btn btn-sm" value="Đặt xe">
                <input type="hidden" id="type" name="type" value="dat-xe-nhanh">
                <input type="hidden"  name="submit-newsletter" value="1">
            </div>
        </div>
    </form>
</div>