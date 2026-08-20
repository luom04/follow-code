<?php
if ((isset($_GET['month']) && $_GET['month'] != '') && (isset($_GET['year']) && $_GET['year'] != '')) {
    $time = $_GET['year'] . '-' . $_GET['month'] . '-1';
    $date = strtotime($time);
} else {
    $date = strtotime(date('y-m-d'));
}
$day = date('d', $date);
$month = date('m', $date);
$year = date('Y', $date);
$firstDay = mktime(0, 0, 0, $month, 1, $year);
$dayOfWeek = date('D', $firstDay);
$daysInMonth = cal_days_in_month(0, $month, $year);
$timestamp = strtotime('next Sunday');
$weekDays = array();
/* Make data for js chart */
$charts = array();
$charts['month'] = $month;

for ($i = 1; $i <= $daysInMonth; $i++) {
    $k = $i + 1;
    $begin = strtotime($year . '-' . $month . '-' . $i);
    /*
    if ($k == 32) {
        $month = $month + 1;
        if ($month == 13) {
            $year = $year + 1;
            $month = 1;
        }
        $k = 1;
    }
    */

    $end = strtotime($year . '-' . $month . '-' . $k);
    $todayrc = $d->rawQueryOne("select count(*) as todayrecord from #_counter where tm >= ? and tm < ?", array($begin, $end));
    $today_visitors = $todayrc['todayrecord'];
    $charts['series'][] = $today_visitors;
    $charts['labels'][] = 'D' . $i;
}


$countIP = $d->rawQuery("select ip, count(id) as countid from #_counter group by ip order by countid desc limit 0,10");
$countUserAgent = $d->rawQuery("select user_agent from #_counter");
$countChrome = $d->rawQueryOne("select count(id) as countid from #_counter where user_agent like '%Chrome%'");
$countDeviceDesktop = $d->rawQueryOne("select count(id) as countid from #_counter where devicetype = 'computer'");
$countDeviceMobile = $d->rawQueryOne("select count(id) as countid from #_counter where devicetype = 'mobile'");
$countThietBi = $d->rawQuery("select id_user, count(user_agent) as cuser_agent from #_user_log group by id_user order by cuser_agent desc limit 0,10");
$counter = $statistic->getCounter();
$online = $statistic->getOnline();
$deviceType = ($detect->isMobile() || $detect->isTablet()) ? 'mobile' : 'computer';

$getUser = $d->rawQuery("select * from #_member  ");


// Đếm số lượt theo loại
$types = ['hotline', 'zalo', 'contact', 'order'];
$counts = [];

foreach ($types as $t) {
    $row = $d->rawQueryOne("SELECT COUNT(*) AS cnt FROM #_counter WHERE `type` = ?", [$t]);
    $counts[$t] = (int) ($row['cnt'] ?? 0);
}


// Theo quốc gia
$countryStats = $d->rawQuery("
    SELECT country, COUNT(id) AS total 
    FROM #_counter 
    WHERE country IS NOT NULL 
    GROUP BY country 
    ORDER BY total DESC 
    LIMIT 10
");

// Theo thành phố
$cityStats = $d->rawQuery("
    SELECT city, COUNT(id) AS total 
    FROM #_counter 
    WHERE city IS NOT NULL 
    GROUP BY city 
    ORDER BY total DESC 
    LIMIT 10
");

/* Tính tổng */
$totalCountry = array_sum(array_column($countryStats, 'total'));
$totalCity = array_sum(array_column($cityStats, 'total'));

?>
<style>
    .online-donutTop {
        position: absolute;
        bottom: 82px;
        left: 50%;
        transform: translateX(-50%);
        color: #888888;
        font-size: 16px;
        font-weight: 500;
        text-align: center;
        margin-bottom: 0;
        line-height: 1.2;
    }

    .online-donutTop span {
        display: block;
        color: #000000;
        font-size: 37px;
        font-weight: 700;
    }

    #detail-donutTop {
        display: flex;
        flex-flow: wrap;
        justify-content: space-between;
        border-top: 1px solid #ebebeb;
        margin-top: 40px;
    }

    #detail-donutTop p {
        font-size: 14px;
        margin: 5px 0;
        width: calc(100% / 2);
        text-align: start;
    }

    #detail-donutTop span {
        display: inline-block;
        width: 12px;
        height: 12px;
        border-radius: 50%;
        margin-right: 6px;
    }

    .box-bom3 {
        height: 315px;
        overflow: auto;
    }


    .counter-card {
        border-radius: 1rem;
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
        padding: 20px;
        color: #333;
        transition: .3s;
    }

    .counter-icon {
        font-size: 1.5rem;
        color: #aaa;
        margin-bottom: 10px;
        border-radius: 100%;
        background-color: #e8e8e8;
        width: 45px;
        height: 45px;
        line-height: 45px;
        position: absolute;
        right: 20px;
        top: 12px;
        text-align: center;
    }

    .counter-icon i {
        font-size: 18px;
    }

    .counter-card:hover {
        transform: translateY(-3px);
    }

    .counter-number {
        font-size: 3rem;
        font-weight: 600;
        color: #f8b400;
    }

    .font-weight-bold {
        font-weight: bold;
    }
</style>
<!-- Main content -->
<section class="content mb-3">
    <div class="container-fluid">
        <h5 class="pt-3 pb-2"><?= dashboard ?></h5>
        <div class="row mb-2 text-sm">
            <div class="col-12 col-sm-6 col-md-3">
                <a class="my-info-box info-box" href="setting?act=update" title="<?= cauhinhwebsite ?>">
                    <span class="my-info-box-icon info-box-icon btn-main"><i class="fas fa-cogs"></i></span>
                    <div class="info-box-content ">
                        <span class="info-box-text text-capitalize"><?= cauhinhwebsite ?></span>
                        <span class="info-box-number"><?= xemthem ?></span>
                    </div>
                </a>
            </div>
            <div class="col-12 col-sm-6 col-md-3">
                <a class="my-info-box info-box" href="user?act=info_admin" title="<?= quanlytaikhoan ?>">
                    <span class="my-info-box-icon info-box-icon btn-main"><i class="fas fa-user-cog"></i></span>
                    <div class="info-box-content ">
                        <span class="info-box-text text-capitalize"><?= quanlytaikhoan ?></span>
                        <span class="info-box-number"><?= xemthem ?></span>
                    </div>
                </a>
            </div>
            <div class="clearfix hidden-md-up"></div>
            <div class="col-12 col-sm-6 col-md-3">
                <a class="my-info-box info-box" href="user?act=info_admin&changepass=1" title="<?= doimatkhau ?>">
                    <span class="my-info-box-icon info-box-icon btn-main"><i class="fas fa-key"></i></span>
                    <div class="info-box-content ">
                        <span class="info-box-text text-capitalize"><?= doimatkhau ?></span>
                        <span class="info-box-number"><?= xemthem ?></span>
                    </div>
                </a>
            </div>
            <div class="col-12 col-sm-6 col-md-3">
                <a class="my-info-box info-box" href="contact?act=man" title="<?= thulienhe ?>">
                    <span class="my-info-box-icon info-box-icon btn-main"><i class="fas fa-address-book"></i></span>
                    <div class="info-box-content ">
                        <span class="info-box-text text-capitalize"><?= thulienhe ?></span>
                        <span class="info-box-number"><?= xemthem ?></span>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<section class="content pb-2">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <div class="card box3 mb-lg-0 h-100">
                    <div class="card-header  border-0 mb-1">
                        <h5 class="mb-0 text-center">Thống kê truy cập online</h5>
                    </div>
                    <div class="p-2 p-md-2 p-lg-3">
                        <div class="box-charts text-center">
                            <div class="pos-donutTop" style="position: relative; bottom: 20px;">
                                <div id="donutTop"></div>
                                <p class="online-donutTop">Đang online <span><?= $online ?></span></p>
                            </div>
                            <div id="detail-donutTop" class="mt-3 p-1">
                                <p><span style="background:#fff; box-shadow:0 0 3px #cacacaff;"></span>Online: <strong><?= $online ?></strong></p>
                                <p><span style="background:#f96c6c;"></span>Tuần: <strong><?= $counter['week'] ?></strong></p>
                                <p><span style="background:#6083e8;"></span>Tháng: <strong><?= $counter['month'] ?></strong></p>
                                <p><span style="background:#f4db55;"></span>Tổng: <strong><?= $counter['total'] ?></strong></p>
                            </div>

                            <!-- Hidden data -->
                            <input type="hidden" class="week" data-value="<?= $counter['week'] ?>">
                            <input type="hidden" class="month" data-value="<?= $counter['month'] ?>">
                            <input type="hidden" class="total" data-value="<?= $counter['total'] ?>">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="">
                    <div class="">
                        <div class="container-fluid d-flex justify-content-between align-items-center flex-wrap p-0">
                            <h5 class=" col-md-3 p-0"><?= thongketruycapthang ?> <?= $month ?>/<?= $year ?></h5>
                            <form class="form-filter-charts row align-items-center justify-content-end  col-md-9 p-0" action="index.php" method="get" name="form-thongke" accept-charset="utf-8">
                                <div class="mb-2 d-none d-lg-flex"><i class="fas fa-calendar-alt"></i></div>
                                <div class="col-md-4 col-lg-4">
                                    <div class="form-group mb-2">
                                        <select class="form-control select2" name="month" id="month">
                                            <option value="">Chọn tháng</option>
                                            <?php for ($i = 1; $i <= 12; $i++) { ?>
                                                <?php
                                                if (isset($_GET['year'])) $selected = ($i == $_GET['month']) ? 'selected' : '';
                                                else $selected = ($i == date('m')) ? 'selected' : '';
                                                ?>
                                                <option value="<?= $i ?>" <?= $selected ?>><?= thang ?> <?= $i ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 col-lg-4 p-lg-0">
                                    <div class="form-group mb-2 ">
                                        <select class="form-control select2" name="year" id="year">
                                            <option value="">Chọn năm</option>
                                            <?php for ($i = 2000; $i <= date('Y') + 20; $i++) { ?>
                                                <?php
                                                if (isset($_GET['year'])) $selected = ($i == $_GET['year']) ? 'selected' : '';
                                                else $selected = ($i == date('Y')) ? 'selected' : '';
                                                ?>
                                                <option value="<?= $i ?>" <?= $selected ?>><?= year ?> <?= $i ?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3 col-lg-3 ">
                                    <div class="form-group mb-2 w-100"><button type="submit" class="btn btn-main w-100"><?= thongke ?></button></div>
                                </div>
                            </form>
                        </div>
                        <div class="card h-100 mb-lg-0">
                            <div class="card-body">
                                <div id="apexMixedChart"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>

<section class="content py-2">
    <div class="container-fluid">
        <h5 class=" fw-semibold">Thống kê traffic</h5>
        <div class="row">
            <div class="col-md-3 mb-3">
                <div class="counter-card card">
                    <div class="counter-icon"><i class="fa fa-phone"></i></div>
                    <h5 class="font-weight-bold">Hotline</h5>
                    <div class="counter-number"><?= $counts['hotline'] ?></div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="counter-card card">
                    <div class="counter-icon"><i class="fa fa-comments"></i></div>
                    <h5 class="font-weight-bold">Zalo</h5>
                    <div class="counter-number"><?= $counts['zalo'] ?></div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="counter-card card">
                    <div class="counter-icon"><i class="fa fa-envelope"></i></div>
                    <h5 class="font-weight-bold">Liên hệ</h5>
                    <div class="counter-number"><?= $counts['contact'] ?></div>
                </div>
            </div>
            <?php if ($config['cart']['active'] == true) { ?>
                <div class="col-md-3 mb-3">
                    <div class="counter-card card">
                        <div class="counter-icon"><i class="fa fa-shopping-bag"></i></div>
                        <h5 class="font-weight-bold">Đơn hàng</h5>
                        <div class="counter-number"><?= $counts['order'] ?></div>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
</section>

<?php
$last = $d->rawQueryOne("SELECT ngay FROM #_keyword_rank ORDER BY ngay DESC LIMIT 1");
$ngay = $last['ngay'] ?? date('Y-m-d');
$list = $d->rawQuery(" SELECT * FROM #_keyword_rank WHERE ngay=? ORDER BY luothienthi DESC, luotnhap DESC LIMIT 0,100", [$ngay]);
?>
<?php if (!empty($list)) { ?>
    <section class="content pb-4 mb-4">
        <div class="container-fluid">
            <div class="d-flex align-items-center justify-content-between mb-3 flex-wrap">
                <h5 class="mb-0 fw-semibold">Top 100 thứ hạng từ khóa</h5>
                <div class="d-flex gap-2 align-items-center flex-wrap">
                    <span class="text-muted small">
                        Dữ liệu cập nhật theo GSC (có thể trễ 1–2 ngày): <b><?= $ngay ?></b>
                    </span>
                    <button type="button" class="btn btn-sm btn-primary ml-2" id="btnGscUpdate">
                        <span class="txt">Cập nhật</span>
                        <span class="spinner-border spinner-border-sm d-none" role="status" aria-hidden="true"></span>
                    </button>
                </div>
            </div>
            <div id="gscMsg" class="small mb-2"></div>
            <div class="table-responsive" style="max-height:260px; overflow:auto;">
                <table class="table table-hover align-middle mb-0">
                    <thead class="sticky-tops bg-light">
                        <tr>
                            <th style="width:70px;">STT</th>
                            <th>Từ khóa</th>
                            <th class="text-end" style="width:140px;">Lượt nhấp</th>
                            <th class="text-end" style="width:120px;">Thứ hạng</th>
                            <th class="text-end" style="width:140px;">Lượt hiển thị</th>
                            <th style="min-width:320px;">Link top</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($list)): $i = 1;
                            foreach ($list as $row): ?>
                                <tr>
                                    <td><?= $i++ ?></td>
                                    <td><?= htmlspecialchars($row['tukhoa'] ?? '') ?></td>
                                    <td class="text-end"><?= number_format((int)$row['luotnhap']) ?></td>
                                    <td class="text-end"><?= round((float)$row['thu_hang'], 2) ?></td>
                                    <td class="text-end"><?= number_format((int)$row['luothienthi']) ?></td>
                                    <td>
                                        <?php if (!empty($row['linktop'])): ?>
                                            <a href="<?= htmlspecialchars($row['linktop']) ?>" target="_blank" rel="noopener">
                                                <?= htmlspecialchars($row['linktop']) ?>
                                            </a>
                                        <?php endif; ?>
                                    </td>
                                </tr>
                            <?php endforeach;
                        else: ?>
                            <tr>
                                <td colspan="6" class="text-center text-muted py-4">Chưa có dữ liệu</td>
                            </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
<?php } ?>
<script defer>
    (function() {
        const btn = document.getElementById('btnGscUpdate');
        const msg = document.getElementById('gscMsg');
        if (!btn) return;

        const txt = btn.querySelector('.txt') || btn;
        const spn = btn.querySelector('.spinner-border');
        let timer = null;

        function setLoading(isLoading) {
            btn.disabled = isLoading;
            if (spn) spn.classList.toggle('d-none', !isLoading);
            if (isLoading) txt.textContent = 'Đang cập nhật...';
        }

        function setCountdown(seconds) {
            clearInterval(timer);

            if (seconds <= 0) {
                btn.disabled = false;
                txt.textContent = 'Cập nhật';
                return;
            }

            btn.disabled = true;
            const tick = () => {
                const m = Math.floor(seconds / 60);
                const s = seconds % 60;
                txt.textContent = `Đã cập nhật (${m}:${String(s).padStart(2,'0')})`;
                seconds--;
                if (seconds < 0) {
                    clearInterval(timer);
                    btn.disabled = false;
                    txt.textContent = 'Cập nhật';
                }
            };
            tick();
            timer = setInterval(tick, 1000);
        }

        async function loadCooldown() {
            try {
                const res = await fetch('/madmin/api/gsc_status.php', {
                    credentials: 'same-origin',
                    cache: 'no-store'
                });
                if (!res.ok) return;
                const data = await res.json();
                if (data && typeof data.remain === 'number') {
                    setCountdown(data.remain);
                }
            } catch (e) {}
        }

        // Khi vào trang, nếu còn cooldown thì khóa nút luôn
        loadCooldown();

        btn.addEventListener('click', async () => {
            setLoading(true);
            msg.className = "small text-primary mb-2";
            msg.textContent = "Đang lấy dữ liệu từ Google Search Console...";

            try {
                const res = await fetch('/madmin/api/gsc_update_now.php', {
                    method: 'GET',
                    credentials: 'same-origin',
                    cache: 'no-store'
                });

                const text = await res.text();
                if (!res.ok) throw new Error(text || ('HTTP ' + res.status));

                msg.className = "small text-success mb-2";
                msg.textContent = text;

                if (spn) spn.classList.add('d-none');
                setCountdown(300);

                setTimeout(() => location.reload(), 700);

            } catch (e) {
                msg.className = "small text-danger mb-2";
                msg.textContent = "Lỗi: " + e.message;
                if (spn) spn.classList.add('d-none');
                btn.disabled = false;
                txt.textContent = 'Cập nhật';
            }
        });
    })();
</script>


<section class="content pb-4">
    <div class="container-fluid">
        <div class="">
            <div class="">
                <div class="row">
                    <!-- Thống kê trình duyệt -->
                    <div class="col-md-4">
                        <div class="card-header p-0 mb-3 border-0">
                            <h5 class="mb-0"><?= thongketruycaptrinhduyet ?></h5>
                        </div>
                        <div class="info-box box-bom3 w-100 p-3">
                            <ul class="text-decoration-none list-unstyled w-100">
                                <?php
                                // Khởi tạo bộ đếm
                                $browsers = [
                                    'Chrome' => 0,
                                    'Edge' => 0,
                                    'Firefox' => 0,
                                    'Safari' => 0,
                                    'Opera' => 0,
                                    'IE' => 0,
                                    'Other' => 0
                                ];

                                // Lặp qua tất cả user agent
                                foreach ($countUserAgent as $item) {
                                    $ua = $item['user_agent'] ?? '';

                                    if (stripos($ua, 'OPR/') !== false || stripos($ua, 'Opera') !== false) {
                                        $browsers['Opera']++;
                                    } elseif (stripos($ua, 'Edg/') !== false || stripos($ua, 'Edge') !== false) {
                                        $browsers['Edge']++;
                                    } elseif (stripos($ua, 'Chrome') !== false && stripos($ua, 'Edg/') === false && stripos($ua, 'OPR/') === false) {
                                        $browsers['Chrome']++;
                                    } elseif (stripos($ua, 'Safari') !== false && stripos($ua, 'Chrome') === false) {
                                        $browsers['Safari']++;
                                    } elseif (stripos($ua, 'Firefox') !== false) {
                                        $browsers['Firefox']++;
                                    } elseif (stripos($ua, 'MSIE') !== false || stripos($ua, 'Trident/7') !== false) {
                                        $browsers['IE']++;
                                    } else {
                                        $browsers['Other']++;
                                    }
                                }
                                ?>

                                <!-- Hiển thị kết quả -->
                                <li class="d-flex justify-content-between align-items-center py-2">
                                    <p class="m-0 fst-italic font-weight-bolder">
                                        <img class="mr-2" src="assets/images/icon_chrome.png" alt="Chrome">Chrome
                                    </p>
                                    <p class="m-0"><?= $browsers['Chrome'] ?></p>
                                </li>
                                <li class="d-flex justify-content-between align-items-center py-2">
                                    <p class="m-0 fst-italic font-weight-bolder">
                                        <img class="mr-2" src="assets/images/icon_edge.png" alt="Edge">Microsoft Edge
                                    </p>
                                    <p class="m-0"><?= $browsers['Edge'] ?></p>
                                </li>
                                <li class="d-flex justify-content-between align-items-center py-2">
                                    <p class="m-0 fst-italic font-weight-bolder">
                                        <img class="mr-2" src="assets/images/icon_internetex.png" alt="Internet Explorer">Internet Explorer
                                    </p>
                                    <p class="m-0"><?= $browsers['IE'] ?></p>
                                </li>
                                <li class="d-flex justify-content-between align-items-center py-2">
                                    <p class="m-0 fst-italic font-weight-bolder">
                                        <img class="mr-2" src="assets/images/icon_filefox.png" alt="Firefox">Mozilla Firefox
                                    </p>
                                    <p class="m-0"><?= $browsers['Firefox'] ?></p>
                                </li>
                                <li class="d-flex justify-content-between align-items-center py-2">
                                    <p class="m-0 fst-italic font-weight-bolder">
                                        <img class="mr-2" src="assets/images/icon_safari.png" alt="Safari">Safari
                                    </p>
                                    <p class="m-0"><?= $browsers['Safari'] ?></p>
                                </li>
                                <li class="d-flex justify-content-between align-items-center py-2">
                                    <p class="m-0 fst-italic font-weight-bolder">
                                        <img class="mr-2" src="assets/images/icon_opera.png" alt="Opera">Opera
                                    </p>
                                    <p class="m-0"><?= $browsers['Opera'] ?></p>
                                </li>
                                <li class="d-flex justify-content-between align-items-center py-2">
                                    <p class="m-0 fst-italic font-weight-bolder">
                                        <img class="mr-2" src="assets/images/icon_orther.png" alt="Khác">Khác
                                    </p>
                                    <p class="m-0"><?= $browsers['Other'] ?></p>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <!-- Thống kê thiết bị -->
                    <div class="col-md-4">
                        <div class="card-header p-0 mb-3 border-0 ">
                            <h5 class="mb-0"><?= thongketruycapthietbi ?></h5>
                        </div>
                        <div class="info-box box-bom3">
                            <?php
                            $totalDevices = $countDeviceDesktop['countid'] + $countDeviceMobile['countid'];
                            if ($totalDevices > 0) {
                                $percentDesktop = round($countDeviceDesktop['countid'] / $totalDevices * 100);
                                $percentMobile = 100 - $percentDesktop;

                                $degDesktop = $percentDesktop * 3.6;
                                $degMobile = $percentMobile * 3.6;
                            } else {
                                $percentDesktop = $percentMobile = 0;
                                $degDesktop = $degMobile = 0;
                            }
                            ?>
                            <div class="container">
                                <div class="row">
                                    <!-- Desktop -->
                                    <div class="col-md-6 mb-1 mb-lg-0">
                                        <div class="  text-center">
                                            <div class="card-body">
                                                <div class="position-relative d-inline-block mb-1 mb-lg-0">
                                                    <img src="assets/images/pc2-icon.gif" alt="Desktop" class="mb-2" width="137">
                                                    <div class="overlay font-weight-bold"> Desktop</div>
                                                    <div class="left" style="--deg: <?= ($degDesktop > 180 ? 180 : $degDesktop) ?>deg"></div>
                                                    <?php if ($degDesktop > 180) { ?>
                                                        <div class="right" style="--deg: <?= $degDesktop ?>deg"></div>
                                                    <?php } ?>
                                                </div>
                                                <h5 class="mb-1 font-weight-bold text-main" style="font-size: 2rem; "><?= $percentDesktop ?>%</h5>
                                                <p class="mb-0 text-muted"><?= $countDeviceDesktop['countid'] ?> lượt truy cập</p>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Mobile -->
                                    <div class="col-md-6 mb-1 mb-lg-0">
                                        <div class="      text-center">
                                            <div class="card-body">
                                                <div class="position-relative d-inline-block ">
                                                    <img src="assets/images/mobile-icon.gif" alt="Mobile" class="mb-2" width="60">
                                                    <div class="overlay font-weight-bold"> Mobile</div>
                                                    <div class="left" style="--deg: <?= ($degMobile > 180 ? 180 : $degMobile) ?>deg"></div>
                                                    <?php if ($degMobile > 180) { ?>
                                                        <div class="right" style="--deg: <?= $degMobile ?>deg"></div>
                                                    <?php } ?>
                                                </div>
                                                <h5 class="mb-1 font-weight-bold fs-5 text-main" style="font-size: 2rem; "><?= $percentMobile ?>%</h5>
                                                <p class="mb-0 text-muted"><?= $countDeviceMobile['countid'] ?> lượt truy cập</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- Thống kê IP -->
                    <div class="col-md-4">
                        <div class="card-header p-0 mb-3 border-0">
                            <h5 class="mb-0"><?= thongkeiptruycapweb ?></h5>
                        </div>
                        <div class="info-box box-bom3 p-3  d-block ">
                            <?php foreach ($countIP as $item): ?>
                                <div class="mb-1 d-flex justify-content-between align-items-center">
                                    <div>
                                        <i class="fa-solid fa-location-crosshairs mr-2"></i>
                                        <strong style="color:#635dff;"><?= $item['ip'] ?></strong>
                                    </div>
                                    <div>
                                        <span class="badge  ml-2"><?= $item['countid'] ?> lượt</span>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<section class="content pb-4">
    <div class="container-fluid">
        <div class="">
            <div class="">
                <div class="row">
                    <!-- Theo Quốc Gia -->
                    <div class="col-md-6">
                        <div class="card  info-box  p-3 box-bom3 mb-4">
                            <div class="d-flex justify-content-between align-items-center border-0 ">
                                <h5 class=" mb-2">Số người dùng theo <a href="#" style="color:#635dff;">Mã quốc gia</a></h5>
                            </div>
                            <table class="table">
                                <thead class="border-0 ">
                                    <tr class="border-0 ">
                                        <th>QUỐC GIA</th>
                                        <th class="text-right ">LƯỢNG TRUY CẬP</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($countryStats as $c):
                                        $percent = $totalCountry ? round(($c['total'] / $totalCountry) * 100, 2) : 0;
                                    ?>
                                        <tr class="border-0">
                                            <td class="fw-bold pt-3"><?= htmlspecialchars($c['country']) ?></td>
                                            <td class="text-right pt-3">
                                                <div class="progress" style="height:6px;">
                                                    <div class="progress-bar bg-warning" style="width: <?= $percent ?>%"></div>
                                                </div>
                                                <small><?= $c['total'] ?> (<?= $percent ?>%)</small>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Theo Thành Phố -->
                    <div class="col-md-6">
                        <div class="card info-box  box-bom3 p-3 mb-4">
                            <div class="d-flex justify-content-between align-items-center border-0 ">
                                <h5 class=" mb-2">Số người dùng theo <a href="#" style="color:#635dff;">Mã thành phố</a></h5>
                            </div>
                            <table class="table table-sm">
                                <thead class="text-muted">
                                    <tr>
                                        <th>THÀNH PHỐ</th>
                                        <th class="text-right">LƯỢNG TRUY CẬP</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($cityStats as $c):
                                        $percent = $totalCity ? round(($c['total'] / $totalCity) * 100, 2) : 0;
                                    ?>
                                        <tr>
                                            <td class="fw-bold pt-3"><?= htmlspecialchars($c['city']) ?></td>
                                            <td class="text-right pt-3">
                                                <div class="progress" style="height:6px;">
                                                    <div class="progress-bar bg-warning" style="width: <?= $percent ?>%"></div>
                                                </div>
                                                <small><?= $c['total'] ?> (<?= $percent ?>%)</small>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="assets/apexcharts/apexcharts.min.js"></script>

<script>
    $(document).ready(function() {
        // ✅ Lấy giá trị sau khi DOM đã sẵn sàng
        var cweek = parseInt($("input.week").data('value')) || 0;
        var cmonth = parseInt($("input.month").data('value')) || 0;
        var ctotal = parseInt($("input.total").data('value')) || 0;

        var optionsDonutTop = {
            chart: {
                height: 290,
                type: 'donut',
                offsetY: 20
            },
            plotOptions: {
                pie: {
                    customScale: 1,
                    donut: {
                        size: '58%',
                    }
                }
            },
            colors: ['#f96c6c', '#6083e8', '#FFD04D'],
            series: [cweek, cmonth, ctotal],
            labels: ['Trong tuần', 'Trong tháng', 'Tổng truy cập'],
            dataLabels: {
                enabled: true,
                formatter: function(val, opts) {
                    // Hiển thị phần trăm + số lượt
                    return opts.w.globals.series[opts.seriesIndex];
                }
            },
            legend: {
                show: false
            }
        };

        var chartDonut2 = new ApexCharts(document.querySelector('#donutTop'), optionsDonutTop);
        chartDonut2.render();
    });
</script>