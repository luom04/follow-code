<form id="frm-sellcar" class="validation-sellcar" novalidate method="post" action="thu-mua-xe-cu-gia-cao">
    <div class="frm-content bg-white rounded-lg p-4">
        <div class="title-main text-center"><h3>Đăng ký bán xe</h3></div>
        <div class="row">
            <div class="col-6 pb-3">
                <label for="">Hãng xe</label>
                <select name="dataSellcar[attributes][hangxe]" id="parentSelect" class="form-select" required>
                    <option value="">-- Chọn hãng xe</option>
                    <?php foreach ($productListMenu as $k => $v) { ?>
                    <option value="<?=$v['name'.$lang]?>" ><?=$v['name'.$lang]?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="col-6 pb-3">
                <label for="">Dòng xe</label>
                <select name="dataSellcar[attributes][dongxe]" id="childSelect" class="form-select" required>
                    <option value="">-- Chọn dòng xe</option>
                    <?php foreach ($productListMenu as $k => $v) { ?>
                    <option value="<?=$v['name'.$lang]?>" ><?=$v['name'.$lang]?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="col-6 pb-3">
                <label for="">Phiên bản</label>
                <input type="text" name="dataSellcar[attributes][phienban]" id="phienban-sellcar" class="form-control" value="" placeholder="Nhập phiên bản" required />
            </div>
            <div class="col-6 pb-3">
                <label for="">Năm sản xuất</label>
                <input type="text" name="dataSellcar[attributes][namsx]" id="namsx-sellcar" class="form-control" value="" placeholder="Nhập năm sản xuất" required />
            </div>
            <div class="col-6 pb-3">
                <label for="">Họ và Tên</label>
                <input type="text" name="dataSellcar[fullname]" id="fullname-sellcar" class="form-control" value="" placeholder="Nhập họ và tên" required />
            </div>
            <div class="col-6 pb-3">
                <label for="">Số Điện Thoại</label>
                <input type="tel" name="dataSellcar[phone]" id="phone-sellcar" class="form-control" value="" placeholder="Nhập số điện thoại" required pattern="(0|\+84)(3[2-9]|5[689]|7[06-9]|8[1-5]|9[0-9])[0-9]{7}" />
            </div>
        </div>
        <input type="hidden" class="" name="recaptcha_response_sellcar" id="recaptchaResponseSellcar">
        <div class="buttons-common active w-100">
            <button type="submit" name="submit-sellcar" class="blob-btn btn rounded active w-100 py-2 px-5" value="send">
                <span class="blob-txt text-uppercase">Định giá bán xe ngay</span>
                <span class="blob-btn__inner">
                    <span class="blob-btn__blobs">
                        <span class="blob-btn__blob"></span>
                        <span class="blob-btn__blob"></span>
                        <span class="blob-btn__blob"></span>
                        <span class="blob-btn__blob"></span>
                    </span>
                </span>
            </button>
        </div>
    </div>
</form>