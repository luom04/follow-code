<div class="container">
    <div class="title-main-detail has-line text-center mb-2">
        <div class="title"><?=$rowDetail['name' . $lang]?></div>
    </div>
    <div class="d-flex flex-wrap justify-content-center mb-4 gap-2">
        <?php foreach($rowDetailContent as $content ){ ?>
            <a href="javascript:;" onclick="goToByScroll('title-<?=$content['id']?>', 170)" class="btn-main py-2 px-4 px-lg-5 text-split text-split-1"><?=$content['name'.$lang]?></a>
        <?php } ?>
        <?php if($rowTags){ ?>
        <a href="javascript:;" onclick="goToByScroll('title-doingu')" class="btn-main py-2 px-4 px-lg-5 text-split text-split-1">Danh sách bác sĩ</a>
        <?php } ?>
    </div>
    <div class="mb-lg-4"><?=htmlspecialchars_decode($rowDetail['desc'.$lang])?></div>
    
    <?php foreach($rowDetailContent as $k => $content ){ ?>
    <div class="row align-items-center">
        <div class="col-12 col-lg-6 mb-4 <?=$k%2==0 ? 'order-lg-1' : 'order-lg-2'?>">
            <div class="title-main mb-3"><h4 id="title-<?=$content['id']?>"><?=$content['name'.$lang]?></h4></div>
            <div><?=htmlspecialchars_decode($content['desc'.$lang])?></div>
        </div>
        <div class="col-12 col-lg-6 mb-4 <?=$k%2==0 ? 'order-lg-2' : 'order-lg-1'?>">
            <img class="lazy rounded-lg w-100" data-src="<?=UPLOAD_NEWS_L . $content['photo']?>" alt="<?=$content['name'.$lang]?>">
        </div>
    </div>
    <?php } ?>

    <?php if($rowTags){ ?>
    <div class="title-main text-center mb-2">
        <h2 id="title-doingu">Danh sách bác sĩ</h2>
    </div>
    <div class="row">
        <?php foreach ($rowTags as $k => $v) { ?>
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4"><?php include TEMPLATE . LAYOUT . "blocks/doingu.php"; ?></div>
        <?php } ?>
    </div>
    <?php } ?>
</div>
<?php if($rowDetail['content' . $lang]) { ?>
<div class="py-3 py-lg-4" style="background-color: #f8f8f8;">
    <div class="container">
        <div class="content-text" id="noidung">
            <?=htmlspecialchars_decode($rowDetail['content'.$lang])?>
            <div class="hide-content" style="background: linear-gradient(transparent, #f8f8f8 100%)">
                <div class="buttons-common active">
                    <a href="javascript:;" class="blob-btn active btn py-2 px-5 btn-view-full-content" data-target="#noidung">
                        <span class="blob-txt text-uppercase">Xem thêm
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1"/>
                            </svg>
                        </span>
                        <span class="blob-btn__inner">
                            <span class="blob-btn__blobs">
                                <span class="blob-btn__blob"></span>
                                <span class="blob-btn__blob"></span>
                                <span class="blob-btn__blob"></span>
                                <span class="blob-btn__blob"></span>
                            </span>
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<?php } ?>

<div class="container py-3 py-lg-4">
    <div class="row">
        <div class="col-12 col-lg-12">
            <div class="content-main">
                <div class="title-main mb-2"><h3><?=$setting['name'.$lang]?></h3></div>
                <div class="mb-3">Mọi thắc mắc và đóng góp ý kiến xin gửi về địa chỉ email hoặc số điện thoại. Chúng tôi sẽ phản hồi trong thời gian sớm nhất.</div>
                <div class="contact-article row justify-content-between">
                    <div class="contact-text col-lg-5 order-lg-3 mt-lg-4">
                        <div class="title-main mb-3"><h5>Thông tin liên hệ</h5></div>
                        <b class="text-main">Hotline liên hệ</b>
                        <div class="d-flex mb-3">
                            <div class="icon me-2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-forward-fill" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.761.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
                                </svg>
                            </div>
                            <div class="info">
                                <a href="tel:<?= $func->parsePhone($optsetting['hotline']) ?>" class="phone"><?=$optsetting['hotline']?></a>
                            </div>
                        </div>
                        <b class="text-main">Email</b>
                        <div class="d-flex align-items-center mb-3">
                            <div class="icon me-2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414zM0 4.697v7.104l5.803-3.558zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586zm3.436-.586L16 11.801V4.697z"></path>
                                </svg>
                            </div>
                            <div class="info">
                                <a href="mailto:<?=$optsetting['email'] ?>"><?=$optsetting['email']?></a>
                            </div>
                        </div>
                        <b class="text-main">Địa chỉ liên hệ</b>
                        <div class="d-flex">
                            <div class="icon me-2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                                    <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10m0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6"></path>
                                </svg>
                            </div>
                            <div class="info">
                                <a href="<?= $optsetting['link_googlemaps'] ?>" target="_blank"><?=$setting['address'.$lang]?></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-auto order-lg-2 border-start mt-3 mt-lg-4"></div>
                    <form class="contact-form validation-contact col-lg-5 order-lg-1" novalidate method="post" action="" enctype="multipart/form-data">
                        <div class="row">
                            <div class="contact-input col-sm-6">
                                <div class="form-floating form-floating-cus">
                                    <input type="text" name="dataContact[fullname]" class="form-control text-sm" id="fullname-contact" placeholder="<?= hoten ?>" value="<?= $flash->get('fullname') ?>" required>
                                    <label for="fullname-contact"><?= hoten ?></label>
                                </div>
                                <div class="invalid-feedback"><?= vuilongnhaphoten ?></div>
                            </div>
                            <div class="contact-input col-sm-6">
                                <div class="form-floating form-floating-cus">
                                    <input type="tel" name="dataContact[phone]" class="form-control text-sm" id="phone-contact" placeholder="<?= dienthoai ?>" value="<?= $flash->get('phone') ?>" required pattern="(0|\+84)(3[2-9]|5[689]|7[06-9]|8[1-5]|9[0-9])[0-9]{7}">
                                    <label for="phone-contact"><?= dienthoai ?></label>
                                </div>
                                <div class="invalid-feedback"><?= vuilongnhapsodienthoai ?></div>
                            </div>
                            <div class="contact-input col-sm-6">
                                <div class="form-floating form-floating-cus">
                                    <input type="text" class="form-control text-sm" id="address-contact" name="dataContact[address]" placeholder="<?= diachi ?>" value="<?= $flash->get('address') ?>" required />
                                    <label for="address-contact"><?= diachi ?></label>
                                </div>
                                <div class="invalid-feedback"><?= vuilongnhapdiachi ?></div>
                            </div>
                            <div class="contact-input col-sm-6">
                                <div class="form-floating form-floating-cus">
                                    <input type="email" class="form-control text-sm" id="email-contact" name="dataContact[email]" placeholder="Email" value="<?= $flash->get('email') ?>" required />
                                    <label for="email-contact">Email</label>
                                </div>
                                <div class="invalid-feedback"><?= vuilongnhapdiachiemail ?></div>
                            </div>
                        </div>
                        <div class="contact-input">
                            <div class="form-floating form-floating-cus">
                                <input type="text" class="form-control text-sm" id="subject-contact" name="dataContact[subject]" placeholder="<?= 'Dịch vụ quan tâm' ?>" value="<?= $flash->get('subject') ?>" required />
                                <label for="subject-contact"><?= 'Dịch vụ quan tâm' ?></label>
                            </div>
                            <div class="invalid-feedback"><?= vuilongnhapchude ?></div>
                        </div>
                        <div class="contact-input">
                            <div class="form-floating form-floating-cus">
                                <textarea class="form-control text-sm" id="content-contact" name="dataContact[content]" placeholder="<?= noidung ?>" required /><?= $flash->get('content') ?></textarea>
                                <label for="content-contact"><?= noidung ?></label>
                            </div>

                            <div class="invalid-feedback"><?= vuilongnhapnoidung ?></div>
                        </div>
                        <?php /*
                        <div class="contact-input">
                            <input type="file" class="form-control" name="file_attach" id="file_attach">
                        </div>
                        */?>
                        <input type="submit" class="btn btn-main mr-2" name="submit-contact" value="<?= gui ?>" disabled />
                        <input type="reset" class="btn btn-secondary" value="<?= nhaplai ?>" />
                        <input type="hidden" name="recaptcha_response_contact" id="recaptchaResponseContact">
                    </form>
                </div>
                <div class="contact-map"><?= $func->decodeHtmlChars($optsetting['coords_iframe']) ?></div>
            </div>
        </div>
    </div>
</div>