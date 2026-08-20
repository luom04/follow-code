<?php if (!empty($popup)) { ?>
<!-- Modal popup -->
<div id="popup" class="modal fade" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-body text-center position-relative">
                <button type="button" class="btn-close position-absolute" style="top: -30px; right: 0px;" data-bs-dismiss="modal" aria-label="Close"></button>
                <a href="<?= $popup['link'] ?>" target="_blank" title="<?= $popup['name' . $lang] ?>">
                    <?= $func->getImage(['sizes' => '0x530x1', 'upload' => UPLOAD_PHOTO_L, 'image' => $popup['photo'], 'alt' => 'Popup']) ?>
                </a>
            </div>
        </div>
    </div> 
</div>
<?php } ?>

<!-- Modal quickview -->
<div class="modal fade" id="goikham-quickview" tabindex="-1" aria-labelledby="goikham-quickviewLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <button type="button" class="btn-close" style="position: absolute;top: 5px;right: 5px; z-index: 10" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body"></div>
        </div>
    </div>
</div>
<?php /*
<div class="modal fade" id="appointment-modal" tabindex="-1" aria-labelledby="appointment-cartLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="btn-close" style="position: absolute;top: 5px;right: 5px;" data-bs-dismiss="modal" aria-label="Close"></button>
                <form class="validation-appointment-modal" novalidate method="post" action="">
                    <div class="title-submain mb-2">
                        <img src="<?= THUMBS ?>/120x42x1/<?= UPLOAD_PHOTO_L . $logo['photo'] ?>" alt="<?=$setting['name'.$lang]?>" title="<?=$setting['name'.$lang]?>" />
                    </div>
                    <div class="title-main mb-4">
                        <h5>Đặt lịch</h5>
                    </div>
                    <div class="row">
                        <div class="col-12 col-sm-6 mb-3">
                            <input type="text" name="dataAppointment[fullname]" class="form-control" placeholder="<?= hoten ?>" value="<?= $flash->get('fullname') ?>" required>
                        </div>
                        <div class="col-12 col-sm-6 mb-3">
                            <input type="tel" name="dataAppointment[phone]" class="form-control" placeholder="<?= dienthoai ?>" value="<?= $flash->get('phone') ?>" required pattern="(0|\+84)(3[2-9]|5[689]|7[06-9]|8[1-5]|9[0-9])[0-9]{7}">
                        </div>
                        <div class="col-12 col-sm-6 mb-3">
                            <input type="text" onfocus="this.type='date';" name="dataAppointment[attributes][ngaysinh]" class="form-control" value="" placeholder="Ngày sinh" required />
                        </div>
                        <div class="col-12 col-sm-6 mb-3">
                            <select name="dataAppointment[attributes][gioitinh]" class="form-select" required>
                                <option value="">-- Giới tính</option>
                                <option value="Nam">Nam</option>
                                <option value="Nữ">Nữ</option>
                            </select>
                        </div>
                        <div class="col-12 col-sm-6 mb-3">
                            <select name="dataAppointment[subject]" class="form-select select-chuyenkhoa" required>
                                <option value="">-- Vui lòng chọn chuyên khoa</option>
                                <?php foreach ($allChuyenKhoas as $klist => $vlist) { ?>
                                <option value="<?= $vlist['name' . $lang] ?>" data-id="<?=$vlist['id']?>">
                                    <?= $vlist['name' . $lang] ?>
                                </option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="col-12 col-sm-6 mb-3">
                            <select name="dataAppointment[attributes][bacsi]" class="form-select select-bacsi" required>
                                <option value="">-- Vui lòng chọn bác sĩ</option>
                            </select>
                        </div>
                        <div class="col-12 col-sm-6 mb-3">
                            <input type="text" onfocus="this.type='date';" name="dataAppointment[attributes][ngaykham]" class="form-control" value="" placeholder="Ngày khám" required />
                        </div>
                        <div class="col-12 col-sm-6 mb-3">
                            <input type="text" onfocus="this.type='time';" name="dataAppointment[attributes][giokham]" class="form-control" value="" placeholder="Giờ khám" required />
                        </div>
                        <div class="col-12 mb-3">
                            <textarea name="dataAppointment[content]" rows="4" class="form-control" placeholder="Triệu chứng" required></textarea>
                        </div>
                    </div>
                    <div class="text-right">
                        <div class="buttons-common active">
                            <button type="submit" class="blob-btn btn active px-4 py-2" name="submit-appointment" value="send">
                                <span class="blob-txt">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5"/>
                                    </svg>
                                    Gửi thông tin
                                </span>
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
            </div>
        </div>
    </div>
</div>*/ ?>


<!-- Modal cart -->
<div class="modal fade" id="popup-cart" tabindex="-1" aria-labelledby="popup-cartLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title fs-5" id="popup-cartLabel"><?= giohangcuaban ?></h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>
<?php /*
<div class="modal fade booking" id="popup-booking" tabindex="-1" aria-labelledby="booking-cartLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title fs-5" id="booking-cartLabel"><?= datlich ?></h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="validation-newsletter form-booking" novalidate method="post" action="booking" enctype="multipart/form-data">
                    <div class="newsletter-booking">
                        <div class="form-floating form-floating-cus">
                            <input type="text" id="phone-booking" class="form-control text-sm" name="dataBooking[fullname]" placeholder="<?= hoten ?>" required />
                            <label for="fullname-booking"><?= hoten ?></label>
                        </div>
                    </div>
                    <div class="newsletter-booking">
                        <div class="form-floating form-floating-cus">
                            <input type="number" id="phone-booking" class="form-control text-sm" name="dataBooking[phone]" placeholder="<?= dienthoai ?>" required />
                            <label for="phone-booking"><?= dienthoai ?></label>
                        </div>
                    </div>
                    <div class="newsletter-booking">
                        <div class="form-floating form-floating-cus">
                            <input type="date" id="date-booking" class="form-control text-sm" name="dataBooking[ngay]" required />
                            <label for="date-booking">Ngày khám</label>
                        </div>
                    </div>
                    <div class="newsletter-booking">
                        <div class="form-floating form-floating-cus">
                            <input type="time" id="time-booking" class="form-control text-sm" name="dataBooking[gio]" required />
                            <label for="time-booking">Giờ khám</label>
                        </div>
                    </div>
                    <div class="newsletter-booking">
                        <div class="form-floating form-floating-cus">
                            <textarea name="dataBooking[content]" id="content-booking" class="form-control text-sm" placeholder="Vấn đề gặp phải" required></textarea>
                            <label for="content-booking">Vấn đề gặp phải</label>
                        </div>
                    </div>
                    <div class="d-flex align-items-center justify-content-between flex-wrap">
                        <div class="d-dongy">

                            <div class="form-check form-switch">
                                <input name="ok" class="form-check-input" type="checkbox" id="ok_booking">
                                <label class="form-check-label" for="ok_booking">ĐỒNG Ý ĐẶT LỊCH</label>
                            </div>
                            <p class="mb-0 desc-dongy">*Thông tin của bạn sẽ được bảo mật.</p>
                        </div>
                        <div class="booking-button">
                            <input type="submit" class="btn btn-sm bg-default btn-primary " name="submit-booking" value="<?= dangky ?>" disabled>
                        </div>
                    </div>
                    <input type="hidden" class="btn btn-sm" name="recaptcha_response_booking" id="recaptchaResponseBooking">
                    <input type="hidden" name="url-current" value="<?= $func->getCurrentPageURL() ?>">
                </form>
            </div>
        </div>
    </div>
</div>*/ ?>