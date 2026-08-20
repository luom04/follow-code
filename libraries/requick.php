<?php

$router->setBasePath($config['database']['url'] . ADMIN);
// Định nghĩa route
$router->map('GET', '/login', function () {
    $_REQUEST['com'] = 'user';
    $_REQUEST['act'] = 'login';
});

$router->map('GET', '/forgot-password', function () {
    $_REQUEST['com'] = 'user';
    $_REQUEST['act'] = 'forgot-password';
});

$router->map('GET|POST', '/reset-password', function () {
    $_REQUEST['com'] = 'user';
    $_REQUEST['act'] = 'reset-password';
});

$router->map('GET|POST', '/[a:com]', function ($com) {
    $_REQUEST['com'] = $_GET['com'] = $com;
});

$match = $router->match();

if ($match && is_callable($match['target'])) {
    call_user_func_array($match['target'], $match['params']);
} else {
    header($_SERVER["SERVER_PROTOCOL"] . ' 404 Not Found');
}

/* Request data */
$com = (!empty($_REQUEST['com'])) ? htmlspecialchars($_REQUEST['com']) : '';
$act = (!empty($_REQUEST['act'])) ? htmlspecialchars($_REQUEST['act']) : '';
$type = (!empty($_REQUEST['type'])) ? htmlspecialchars($_REQUEST['type']) : '';
$kind = (!empty($_REQUEST['kind'])) ? htmlspecialchars($_REQUEST['kind']) : '';
$val = (!empty($_REQUEST['val'])) ? htmlspecialchars($_REQUEST['val']) : '';
$variant = (!empty($_REQUEST['variant'])) ? htmlspecialchars($_REQUEST['variant']) : '';
$id_parent = (!empty($_REQUEST['id_parent'])) ? htmlspecialchars($_REQUEST['id_parent']) : '';
$id = (!empty($_REQUEST['id'])) ? htmlspecialchars($_REQUEST['id']) : '';
$curPage = (!empty($_REQUEST['p'])) ? htmlspecialchars($_REQUEST['p']) : 1;
if (!empty($kind)) $dfgallery = ($kind == 'man_list') ? 'gallery_list' : 'gallery';
else $dfgallery = '';

// Kiểm tra nếu đã có cookie
if (isset($_COOKIE['admin_session'])) {
    // Giải mã session data từ cookie
    $session_data = json_decode(base64_decode($_COOKIE['admin_session']), true);

    if (is_array($session_data) && isset($session_data['username']) && isset($session_data['password'])) {
        // Kiểm tra thông tin đăng nhập trong database
        $username = $session_data['username'];
        $password = $session_data['password']; // Đã được mã hóa
        $token = $session_data['token'];

        $row = $d->rawQueryOne(
            "select * from #_user where username = ? and password = ? and find_in_set('hienthi',status) limit 0,1",
            array($username, $password)
        );

        if (!empty($row['id'])) {
            // Khôi phục session từ cookie
            $_SESSION[$loginAdmin] = $session_data;

            // Khôi phục các session khác
            if (isset($_COOKIE['admin_token'])) {
                $_SESSION[TOKEN] = $_COOKIE['admin_token'];
            }

            if (isset($_COOKIE['admin_isLoggedIn'])) {
                $_SESSION['isLoggedIn'] = $_COOKIE['admin_isLoggedIn'];
            }

            // Cập nhật thời gian đăng nhập và token nếu cần
            $timenow = time();
            $sessionhash = md5(sha1($row['password'] . $row['username']));
            $_SESSION[$loginAdmin]['login_token'] = $token;

            // Cập nhật thông tin trong database
            $d->rawQuery(
                "update #_user set secret_key = ?, login_session = ?, lastlogin = ?, user_token = ? where id = ?",
                array($token, $sessionhash, $timenow, $token, $row['id'])
            );
        } else {
            // Xóa cookie nếu thông tin không hợp lệ
            setcookie('admin_session', '', time() - 3600, '/');
            setcookie('admin_token', '', time() - 3600, '/');
            setcookie('admin_isLoggedIn', '', time() - 3600, '/');
        }
    }
}

/* Kiểm tra 2 máy đăng nhập cùng 1 tài khoản */
if (!empty($_SESSION[$loginAdmin]['active'])) {
    $id_user = (int)$_SESSION[$loginAdmin]['id'];
    $timenow = time();

    $row = $d->rawQueryOne("select username, password, lastlogin, user_token from #_user WHERE id = ? limit 0,1", array($id_user));

    $sessionhash = md5(sha1($row['password'] . $row['username']));

    if ($_SESSION[$loginAdmin]['login_session'] != $sessionhash || ($timenow - $row['lastlogin']) > 3600 || !isset($_SESSION[TOKEN])) {
        if (!empty($_SESSION[TOKEN])) unset($_SESSION[TOKEN]);
        unset($_SESSION[$loginAdmin]);
        $func->redirect($configBase . ADMIN . "/login");
    }

    if ($_SESSION[$loginAdmin]['login_token'] !== $row['user_token']) $alertlogin = 'Có người đang đăng nhập tài khoản của bạn.';
    else $alertlogin = '';

    // $token = md5(time());
    // $_SESSION[$loginAdmin]['login_token'] = $token;

    // /* Cập nhật lại thời gian hoạt động và token */
    // $d->rawQuery("update #_user set lastlogin = ?, user_token = ? where id = ?", array($timenow, $token, $id_user));
}

/* Kiểm tra phân quyền */
if (!empty($config['permission']['active']) && !empty($_SESSION[$loginAdmin]['active'])) {
    /* Lấy quyền */
    $_SESSION[$loginAdmin]['permissions'] = array();
    if (!empty($_SESSION[$loginAdmin]['id'])) {
        $id_permission = $d->rawQueryOne("select id_permission from #_user where id = ? and find_in_set('hienthi',status) limit 0,1", array($_SESSION[$loginAdmin]['id']));
        if (!empty($id_permission['id_permission'])) {
            $permission = $d->rawQueryOne("select id from #_permission_group where id = ? and find_in_set('hienthi',status) limit 0,1", array($id_permission['id_permission']));
            if (!empty($permission['id'])) {
                $user_permission = $d->rawQuery("select permission from #_permission where id_permission_group = ?", array($permission['id']));
                if (!empty($user_permission)) {
                    foreach ($user_permission as $value) {
                        $_SESSION[$loginAdmin]['permissions'][] = $value['permission'];
                    }
                }
            }
        }
    }

    /* Kiểm tra quyền */
    if ($func->checkRole()) {
        $is_permission = true;

        if (!empty($com) && !in_array($com, ['user', 'index']) && !empty($act) && !in_array($act, ['save', 'save_list', 'save_cat', 'save_item', 'save_sub', 'save_brand', 'save_color', 'save_size', 'saveImages', 'uploadExcel', 'save_static', 'save_photo'])) {
            $sum_permission = '';
            $sum_permission .= $com . '_' . $act;
            $sum_permission .= (!empty($variant)) ? '_' . $variant : '';
            $sum_permission .= (!empty($type)) ? '_' . $type : '';

            if (isset($_SESSION[$loginAdmin]['permissions'])) {
                if (!in_array($sum_permission, $_SESSION[$loginAdmin]['permissions'])) {
                    $func->transfer("Bạn không có quyền truy cập vào khu vực này", "index.php", false);
                }
            }
        }
    }
}

/* Kiểm tra đăng nhập */
if ($func->checkLoginAdmin() == false && !in_array($act, ['login', 'forgot-password', 'reset-password'])) {

    $func->redirect($configBase . ADMIN . "/login");
}

/* Delete gallery */
$func->deleteGallery();

/* Delete cache */
$cacheAction = array(
    'save',
    'save_copy',
    'save_list',
    'save_cat',
    'save_item',
    'save_sub',
    'save_brand',
    'save_size',
    'save_color',
    'save_static',
    'save_photo',
    'save_city',
    'save_district',
    'save_ward',
    'update',
    'delete',
    'delete_list',
    'delete_cat',
    'delete_item',
    'delete_sub',
    'delete_brand',
    'delete_city',
    'delete_district',
    'delete_ward'
);
if (isset($_POST) && isset($cacheAction) && count($cacheAction) > 0) {
    if (in_array($act, $cacheAction)) {
        $cache->delete();
    }
}

/* Include sources */
if (file_exists(SOURCES . $com . '.php')) include SOURCES . $com . ".php";
else $template = "index";
