<?php
session_start();
define('LIBRARIES', '../../libraries/');

require_once LIBRARIES . "config.php";
require_once LIBRARIES . 'autoload.php';
new AutoLoad();
$injection = new AntiSQLInjection();
$d = new PDODb($config['database']);
$cache = new Cache($d);
$func = new Functions($d, $cache);
$emailer = new Email($d);
$langadmin = $_SESSION['langadmin'] = 'vi';
require_once LIBRARIES."lang/admin/".$langadmin.".php";

$email = (!empty($_POST['email'])) ? $_POST['email'] : '';

$error = "";
$success = "";

/* Còn số lần đăng nhập */
if ($error == '') {
    /* Kiểm tra thông tin đăng nhập */
    if ($email == '') {
        $error = "Email không được để trống";
    } else if(!$func->isEmail($email)){
        $error = "Email không hợp lệ";
    } else {
        // Kiểm tra email có tồn tại trong bảng users
        $row = $d->rawQueryOne("SELECT * FROM #_user WHERE email = ?", [$email]);
        if(!$row) {
            $error = "Email không tồn tại trong hệ thống";
        } else {

            if (strtotime($row['reset_expired']) > time()) {
                $error = "Bạn vừa yêu cầu cung cấp mật khẩu. Vui lòng đợi 15 phút trước khi yêu cầu lại";
            } else {
                // Nếu tồn tại thì sinh mã reset
                $reset_code = $func->digitalRandom(0, 3, 6); // 6 chữ số
                $expired_at   = date("Y-m-d H:i:s", strtotime("+15 minutes"));

                

                // Gửi email
                $subject = "Khôi phục mật khẩu";
                $content = "Xin chào, bạn đã yêu cầu đặt lại mật khẩu. Mã xác nhận của bạn là: <b>".$reset_code."</b> (hết hạn sau 15 phút)";
                $linkreset = $configBase . ADMIN . "/reset-password?code=" . $reset_code;
                
                /* Defaults attributes email */
                $emailDefaultAttrs = $emailer->defaultAttrs();
                /* Variables email */
                $emailVars = array(
                    '{emailInfoSignup}',
                    '{emailLinkReset}'
                );
                $emailVars = $emailer->addAttrs($emailVars, $emailDefaultAttrs['vars']);
                /* Values email */
                $emailVals = array(
                    $content,
                    $linkreset
                );
                $emailVals = $emailer->addAttrs($emailVals, $emailDefaultAttrs['vals']);

                /* Send email admin */
                $arrayEmail = array(
                    "dataEmail" => array(
                        "name" => $row['fullname'],
                        "email" => $row['email']
                    )
                );
                $subject = "Yêu cầu khôi phục mật khẩu " . $setting['name' . $lang];
                $message = str_replace($emailVars, $emailVals, $emailer->markdown('user/forgot-password'));
                $file = 'file_attach';
                if($emailer->send("customer", $arrayEmail, $subject, $message, $file)) {
                    // Lưu vào DB để sau verify
                    $d->rawQuery("UPDATE #_user SET reset_code = ?, reset_expired = ? WHERE id = ?", [$reset_code, $expired_at, $row['id']]);
                    $success = "Mã xác nhận đã được gửi tới email của bạn";
                } else {
                    $error = "Gửi mật khẩu thất bại";
                }
            }
        }
    }
}

$data = array('success' => $success, 'error' => $error);
echo json_encode($data);