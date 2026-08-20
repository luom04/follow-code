<section class="wrap-form py-3 py-lg-4" style="background: #F6FBFF;">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-12 col-lg-6 mb-2 mb-lg-0">
                <img class="img-fluid why-center-img" src="<?= UPLOAD_PHOTO_L . $bannerform['photo'] ?>" alt="<?= $bannerform['name' . $lang] ?>" title="<?= $bannerform['name' . $lang] ?>" width="100%" height="auto">
            </div>
            <div class="col-12 col-lg-6">
                <div class="title-main text-center">
                    <h2><?= dangkynhantuvan ?></h2>
                </div>
                <div class="bg-form py-4 px-2 px-lg-5 rounded-lg">
                    <form class="validation-newsletter form-tuvan" novalidate method="post" action="" enctype="multipart/form-data">
                        <div class="newsletter-tuvan mb-2">
                            <div class="f form-floating-cus">
                                <label for="fullname-tuvan" class="text-main fs-20 fw-500"><?= hoten ?></label>
                                <input type="text" id="phone-tuvan" class="form-control text-sm py-2" name="dataNewsletter[fullname]" placeholder="<?= hoten ?>" required />
                            </div>
                        </div>
                        <div class="row  mb-2">
                            <div class="col-12 col-lg-6">
                                <div class="newsletter-tuvan">
                                    <div class=" form-floating-cus">
                                        <label for="phone-tuvan" class="text-main fs-20 fw-500"><?= dienthoai ?></label>
                                        <input type="number" id="phone-tuvan" class="form-control text-sm py-2" name="dataNewsletter[phone]" placeholder="<?= dienthoai ?>" required />
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <div class="newsletter-tuvan">
                                    <div class=" form-floating-cus">
                                        <label for="email-tuvan" class="text-main fs-20 fw-500">Email</label>
                                        <input type="email" id="email-tuvan" class="form-control text-sm py-2 " name="dataNewsletter[email]" placeholder="Email" required />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="newsletter-tuvan">
                            <div class=" form-floating-cus">
                                <label for="content-tuvan" class="text-main fs-20 fw-500"><?= noidung ?></label>
                                <textarea name="dataNewsletter[content]" id="content-tuvan" class="form-control text-sm py-2" placeholder="<?= noidungcantuvan ?>" style="height: 83px;" required></textarea>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-sm bg-default btn-primary fs-21 w-100 bg-red border-red py-2 mt-2 mt-lg-3" name="submit-newsletter" disabled>
                            <?= guidenhantuvan ?>
                        </button>
                        <input type="hidden" class="btn btn-sm" name="recaptcha_response_newsletter" id="recaptchaResponsenewsletter">
                        <input type="hidden" name="csrf_token" value="">
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>