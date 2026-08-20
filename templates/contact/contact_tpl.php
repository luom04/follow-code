<div class="container mb-3">
    <div class="row flex-column-reverse flex-lg-row">
        <div class="col-12 col-lg-12">
            <?= $flash->getMessages("frontend") ?>
            <div class="content-main">
                <div class="title-main-detail text-center">
                    <div class="title"><?= $titleMain ?></div>
                </div>
                <ul class="nav nav-tabs mb-3" id="hethongTabs" role="tablist">
                    <?php if (!empty($hethongs)) { ?> 
                        <li class="nav-item me-2" role="presentation">
                            <button class="nav-link d-flex align-items-center active" id="hethong0-tab" data-bs-toggle="tab"
                                data-bs-target="#hethong0" type="button" role="tab" aria-controls="hethong0"
                                aria-selected="true">
                                Trụ sở chính
                            </button>
                        </li>
                        <?php foreach ($hethongs as $k => $v) { ?>
                            <li class="nav-item me-2" role="presentation">
                                <button class="nav-link d-flex align-items-center" id="hethong<?= $v['id'] ?>-tab"
                                    data-bs-toggle="tab" data-bs-target="#hethong<?= $v['id'] ?>" type="button" role="tab"
                                    aria-controls="hethong<?= $v['id'] ?>" aria-selected="false">
                                    <?= $v['name' . $lang] ?>
                                </button>
                            </li>
                        <?php } ?>
                    <?php } ?>
                </ul>
                <div class="contact-article row">
                    <div class="contact-text col-lg-6">
                        <div class="tab-content" id="hethongTabsContent">
                            <div class="tab-pane fade show active" id="hethong0" role="tabpanel"
                                aria-labelledby="hethong0-tab">
                                <div><?= htmlspecialchars_decode($contact['content' . $lang]) ?></div>
                                <?php if (!empty($hethongs)) { ?> 
                                    <div class="contact-map"><?= htmlspecialchars_decode($optsetting['coords_iframe']) ?>
                                    </div>
                                <?php } ?>
                            </div>
                            <?php if (!empty($hethongs)) { ?> 
                                <?php foreach ($hethongs as $k => $v) { ?>
                                    <div class="tab-pane fade" id="hethong<?= $v['id'] ?>" role="tabpanel"
                                        aria-labelledby="hethong<?= $v['id'] ?>-tab">
                                        <div><?= htmlspecialchars_decode($v['desc' . $lang]) ?></div>
                                        <div class="contact-map"><?= htmlspecialchars_decode($v['iframe']) ?></div>
                                    </div>
                                <?php } ?>
                            <?php } ?>
                        </div>
                    </div>
                    <form class="contact-form validation_contact col-lg-6" novalidate method="post" action=""
                        enctype="multipart/form-data">
                        <div class="row">
                            <div class="contact-input col-sm-6">
                                <div class="form-floating form-floating-cus">
                                    <input type="text" name="dataContact[fullname]" class="form-control text-sm"
                                        id="fullname-contact" placeholder="<?= hoten ?>"
                                        value="<?= $flash->get('fullname') ?>" required>
                                    <label for="fullname-contact"><?= hoten ?></label>
                                </div>
                                <div class="invalid-feedback"><?= vuilongnhaphoten ?></div>
                            </div>
                            <div class="contact-input col-sm-6">
                                <div class="form-floating form-floating-cus">
                                    <input type="tel" name="dataContact[phone]" class="form-control text-sm"
                                        id="phone-contact" placeholder="<?= dienthoai ?>"
                                        value="<?= $flash->get('phone') ?>" required
                                        pattern="(0|\+84)(3[2-9]|5[689]|7[06-9]|8[1-5]|9[0-9])[0-9]{7}">
                                    <label for="phone-contact"><?= dienthoai ?></label>
                                </div>
                                <div class="invalid-feedback"><?= vuilongnhapsodienthoai ?></div>
                            </div>
                            <div class="contact-input col-sm-6">
                                <div class="form-floating form-floating-cus">
                                    <input type="text" class="form-control text-sm" id="address-contact"
                                        name="dataContact[address]" placeholder="<?= diachi ?>"
                                        value="<?= $flash->get('address') ?>" required />
                                    <label for="address-contact"><?= diachi ?></label>
                                </div>
                                <div class="invalid-feedback"><?= vuilongnhapdiachi ?></div>
                            </div>
                            <div class="contact-input col-sm-6">
                                <div class="form-floating form-floating-cus">
                                    <input type="email" class="form-control text-sm" id="email-contact"
                                        name="dataContact[email]" placeholder="Email"
                                        value="<?= $flash->get('email') ?>" required />
                                    <label for="email-contact">Email</label>
                                </div>
                                <div class="invalid-feedback"><?= vuilongnhapdiachiemail ?></div>
                            </div>
                        </div>
                        <div class="contact-input">
                            <div class="form-floating form-floating-cus">
                                <input type="text" class="form-control text-sm" id="subject-contact"
                                    name="dataContact[subject]" placeholder="<?= 'Dịch vụ quan tâm' ?>"
                                    value="<?= $flash->get('subject') ?>" required />
                                <label for="subject-contact"><?= chude ?></label>
                            </div>
                            <div class="invalid-feedback"><?= vuilongnhapchude ?></div>
                        </div>
                        <div class="contact-input">
                            <div class="form-floating form-floating-cus">
                                <textarea class="form-control text-sm" id="content-contact" name="dataContact[content]"
                                    placeholder="<?= noidung ?>" required /><?= $flash->get('content') ?></textarea>
                                <label for="content-contact"><?= noidung ?></label>
                            </div>

                            <div class="invalid-feedback"><?= vuilongnhapnoidung ?></div>
                        </div>
                        <?php /*
<div class="contact-input">
<input type="file" class="form-control" name="file_attach" id="file_attach">
</div>
*/ ?>
                        <button type="submit" class="btn btn-primary text-md mr-2" name="submit-contact"
                            disabled><?= gui ?></button>
                        <button type="reset" class="btn btn-secondary text-md"><?= nhaplai ?></button>
                    </form>
                </div>
                <?php if (empty($hethongs)) { ?>
                    <div class="contact-map"><?= htmlspecialchars_decode($optsetting['coords_iframe']) ?></div>
                <?php } ?>
            </div>
        </div>
    </div>
</div>
