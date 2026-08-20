<?php
if (!defined('SOURCES')) die("Error");

switch ($act) {
    case "man_photo":
        viewPhotos();
        $template = "gallery/man/photos";
        break;
    case "add_photo":
        $template = "gallery/man/photo_add";
        break;
    case "edit_photo":
        editPhoto();
        $template = "gallery/man/photo_edit";
        break;
    case "save_photo":
        savePhoto();
        break;
    case "delete_photo":
        deletePhoto();
        break;
    default:
        $template = "404";
}

/* View photo */
function viewPhotos()
{
    global $d, $langadmin, $func, $curPage, $items, $paging, $type, $kind, $val, $id_parent, $com;

    $where = "id_parent = ? and com = ? and type = ? and kind = ? and val = ?";

    $perPage = 10;
    $startpoint = ($curPage * $perPage) - $perPage;
    $limit = " limit " . $startpoint . "," . $perPage;
    $sql = "select * from #_gallery where $where order by numb,id desc $limit";
    $items = $d->rawQuery($sql, array($id_parent, $com, $type, $kind, $val));
    $sqlNum = "select count(*) as 'num' from #_gallery where $where order by numb,id desc";
    $count = $d->rawQueryOne($sqlNum, array($id_parent, $com, $type, $kind, $val));
    $total = (!empty($count)) ? $count['num'] : 0;
    $url = "" . $com . "?act=man_photo&id_parent=" . $id_parent . "&type=" . $type . "&kind=" . $kind . "&val=" . $val;
    $paging = $func->pagination($total, $perPage, $curPage, $url);
}

/* Edit photo */
function editPhoto()
{
    global $d, $langadmin, $func, $curPage, $item, $type, $kind, $val, $id_parent, $com;

    $id = (!empty($_GET['id'])) ? htmlspecialchars($_GET['id']) : 0;

    if (empty($id)) {
        $func->transfer(khongnhanduocdulieu, "" . $com . "?act=man_photo&id_parent=" . $id_parent . "&type=" . $type . "&kind=" . $kind . "&val=" . $val . "&p=" . $curPage, false);
    } else {
        $item = $d->rawQueryOne("select * from #_gallery where id_parent = ? and com = ? and type = ? and kind = ? and val = ? and id = ? order by numb,id desc limit 0,1", array($id_parent, $com, $type, $kind, $val, $id));
        if (empty($item)) {
            $func->transfer(dulieukhongcothuc, "" . $com . "?act=man_photo&id_parent=" . $id_parent . "&type=" . $type . "&kind=" . $kind . "&val=" . $val . "&p=" . $curPage, false);
        }
    }
}

/* Save photo */
function savePhoto()
{
    global $d, $langadmin, $curPage, $func, $config, $dfgallery, $type, $kind, $val, $id_parent, $com;

    /* Check post */
    if (empty($_POST)) {
        $func->transfer(khongnhanduocdulieu, "" . $com . "?act=man_photo&id_parent=" . $id_parent . "&type=" . $type . "&kind=" . $kind . "&val=" . $val . "&p=" . $curPage, false);
    }

    /* Post dữ liệu */
    $id = (!empty($_POST['id'])) ? htmlspecialchars($_POST['id']) : 0;
    $data = (!empty($_POST['data'])) ? $_POST['data'] : null;
    $dataMultiTemp = (!empty($_POST['dataMulti'])) ? $_POST['dataMulti'] : null;
    if ($data) {
        foreach ($data as $column => $value) {
            $data[$column] = htmlspecialchars($func->sanitize($value));
        }
        $data['regular_price'] = (isset($data['regular_price']) && $data['regular_price'] != '') ? str_replace(",", "", $data['regular_price']) : 0;
        $data['sale_price'] = (isset($data['sale_price']) && $data['sale_price'] != '') ? str_replace(",", "", $data['sale_price']) : 0;
        $data['discount'] = (isset($data['discount']) && $data['discount'] != '') ? $data['discount'] : 0;

        if (isset($_POST['status'])) {
            $status = '';
            foreach ($_POST['status'] as $attr_column => $attr_value) if ($attr_value != "") $status .= $attr_value . ',';
            $data['status'] = (!empty($status)) ? rtrim($status, ",") : "";
        } else {
            $data['status'] = "";
        }
    }

    /* Save data */
    if ($id) {
        $data['date_updated'] = time();

        $d->where('id', $id);
        $d->where('com', $com);
        $d->where('type', $type);
        $d->where('kind', $kind);
        $d->where('val', $val);
        if ($d->update('gallery', $data)) {

            if (isset($_FILES['files']) && $_FILES['files']['name'][0] != '') {
                $files = $_FILES['files'];
                $photoUpdate = array();

                // Lặp qua từng file
                foreach ($files['name'] as $i => $name) {
                    if ($name == '') continue;

                    $_FILES['file_temp'] = [
                        'name'     => $_FILES['files']['name'][$i],
                        'type'     => $_FILES['files']['type'][$i],
                        'tmp_name' => $_FILES['files']['tmp_name'][$i],
                        'error'    => $_FILES['files']['error'][$i],
                        'size'     => $_FILES['files']['size'][$i]
                    ];

                    // Đặt tên file
                    $file_name = $func->uploadName($name);

                    // Upload (sử dụng hàm uploadImage có sẵn của bạn)
                    $photo = $func->uploadImage(
                        'file_temp', // index
                        $config[$com][$type][$dfgallery][$val]['img_type_photo'],
                        "../upload/" . $com . "/",
                        $file_name
                    );

                    if ($photo) {
                        $photoUpdate[] = $photo;
                    }
                }

                if (!empty($photoUpdate)) {
                    $d->where('id', $id);
                    $d->update('gallery', ['photo_multiple' => implode(',', $photoUpdate)]);
                }
            }

            /* Photo */
            if ($func->hasFile("file")) {
                $photoUpdate = array();
                $file_name = $func->uploadName($_FILES["file"]["name"]);

                if ($photo = $func->uploadImage("file", $config[$com][$type][$dfgallery][$val]['img_type_photo'], "../upload/" . $com . "/", $file_name)) {
                    $row = $d->rawQueryOne("select id, photo from #_gallery where id_parent = ? and com = ? and type = ? and kind = ? and val = ? and id = ? order by numb,id desc limit 0,1", array($id_parent, $com, $type, $kind, $val, $id));

                    if (!empty($row)) {
                        $func->deleteFile("../upload/" . $com . "/" . $row['photo']);
                    }

                    $photoUpdate['photo'] = $photo;
                    $d->where('id', $id);
                    $d->update('gallery', $photoUpdate);
                    unset($photoUpdate);
                }
            }

            /* File attach */
            if ($func->hasFile("file_attach")) {
                $fileUpdate = array();
                $file_name = $func->uploadName($_FILES["file_attach"]["name"]);

                if ($file_attach = $func->uploadImage("file_attach", $config[$com][$type][$dfgallery][$val]['file_type_photo'], UPLOAD_FILE, $file_name . "-attach")) {
                    $row = $d->rawQueryOne("select id, file_attach from #_gallery where id_parent = ? and com = ? and type = ? and kind = ? and val = ? and id = ? order by numb,id desc limit 0,1", array($id_parent, $com, $type, $kind, $val, $id));

                    if (!empty($row)) {
                        $func->deleteFile(UPLOAD_FILE . $row['file_attach']);
                    }

                    $fileUpdate['file_attach'] = $file_attach;
                    $d->where('id', $id);
                    $d->update('gallery', $fileUpdate);
                    unset($fileUpdate);
                }
            }

            $func->transfer(capnhatdulieuthanhcong, "" . $com . "?act=man_photo&id_parent=" . $id_parent . "&type=" . $type . "&kind=" . $kind . "&val=" . $val . "&p=" . $curPage);
        } else {
            $func->transfer(capnhatdulieubiloi, "" . $com . "?act=man_photo&id_parent=" . $id_parent . "&type=" . $type . "&kind=" . $kind . "&val=" . $val . "&p=" . $curPage, false);
        }
    } else {
        $data['com'] = $com;
        $data['type'] = $type;
        $data['kind'] = $kind;
        $data['val'] = $val;
        $data['numb'] = 1;
        $data['date_created'] = time();
        $data['id_parent'] = $id_parent;

        if ($dataMultiTemp) {
            for ($i = 1; $i <= count($dataMultiTemp); $i++) {

                $dataMulti = array_merge($data, $dataMultiTemp[$i]);

                if ($d->insert('gallery', $dataMulti)) {
                    $id_insert = $d->getLastInsertId();
                    /* File attach */
                    if (isset($config[$com][$type][$dfgallery][$val]['file_photo']) && $config[$com][$type][$dfgallery][$val]['file_photo'] == true) {
                        if ($func->hasFile("file_attach" . $i)) {
                            $fileUpdate = array();
                            $file_name = $func->uploadName($_FILES["file_attach" . $i]["name"]);

                            if ($file_attach = $func->uploadImage("file_attach" . $i, $config[$com][$type][$dfgallery][$val]['file_type_photo'], UPLOAD_FILE, $file_name . "-attach" . $i)) {
                                $fileUpdate['file_attach'] = $file_attach;
                                $d->where('id', $id_insert);
                                $d->update('gallery', $fileUpdate);
                                unset($fileUpdate);
                            }
                        }
                    }
                    /* Photo */
                    if (isset($config[$com][$type][$dfgallery][$val]['images_photo']) && $config[$com][$type][$dfgallery][$val]['images_photo'] == true) {
                        if ($func->hasFile("file" . $i)) {
                            $photoUpdate = array();
                            $file_name = $func->uploadName($_FILES["file" . $i]["name"]);

                            if ($photo = $func->uploadImage("file" . $i, $config[$com][$type][$dfgallery][$val]['img_type_photo'], "../upload/" . $com . "/", $file_name . $i)) {
                                $photoUpdate['photo'] = $photo;
                                $d->where('id', $id_insert);
                                $d->update('gallery', $photoUpdate);
                                unset($photoUpdate);
                            }
                        }
                    }
                } else {
                    $func->transfer(luudulieuthatbai, "" . $com . "?act=man_photo&id_parent=" . $id_parent . "&type=" . $type . "&kind=" . $kind . "&val=" . $val . "&p=" . $curPage, false);
                }
            }
            $func->transfer(luudulieuthanhcong, "" . $com . "?act=man_photo&id_parent=" . $id_parent . "&type=" . $type . "&kind=" . $kind . "&val=" . $val . "&p=" . $curPage);
        }elseif ($d->insert('gallery', $data)) {
            $id_insert = $d->getLastInsertId();
            /* Photo */
            if (isset($config[$com][$type][$dfgallery][$val]['images_photo']) && $config[$com][$type][$dfgallery][$val]['images_photo'] == true) {
                if (isset($_FILES['files']) && $_FILES['files']['name'][0] != '') {
                    $files = $_FILES['files'];
                    $photoUpdate = array();

                    // Lặp qua từng file
                    foreach ($files['name'] as $i => $name) {
                        if ($name == '') continue;

                        $_FILES['file_temp'] = [
                            'name'     => $_FILES['files']['name'][$i],
                            'type'     => $_FILES['files']['type'][$i],
                            'tmp_name' => $_FILES['files']['tmp_name'][$i],
                            'error'    => $_FILES['files']['error'][$i],
                            'size'     => $_FILES['files']['size'][$i]
                        ];

                        // Đặt tên file
                        $file_name = $func->uploadName($name);

                        // Upload (sử dụng hàm uploadImage có sẵn của bạn)
                        $photo = $func->uploadImage(
                            'file_temp', // index
                            $config[$com][$type][$dfgallery][$val]['img_type_photo'],
                            "../upload/" . $com . "/",
                            $file_name
                        );

                        if ($photo) {
                            $photoUpdate[] = $photo;
                        }
                    }

                    if (!empty($photoUpdate)) {
                        $d->where('id', $id_insert);
                        $d->update('gallery', ['photo_multiple' => implode(',', $photoUpdate)]);
                    }
                }
            }

            $func->transfer(luudulieuthanhcong, "" . $com . "?act=man_photo&id_parent=" . $id_parent . "&type=" . $type . "&kind=" . $kind . "&val=" . $val . "&p=" . $curPage);
        }else {
            $func->transfer(luudulieuthatbai, "" . $com . "?act=man_photo&id_parent=" . $id_parent . "&type=" . $type . "&kind=" . $kind . "&val=" . $val . "&p=" . $curPage, false);
        }
    }
}

/* Delete photo */
function deletePhoto()
{
    global $d, $langadmin, $curPage, $func, $type, $kind, $val, $id_parent, $com;

    $id = (!empty($_GET['id'])) ? htmlspecialchars($_GET['id']) : 0;

    if ($id) {
        $row = $d->rawQueryOne("select id, photo, file_attach from #_gallery where id = ? and com = ? and type = ? and kind = ? and val = ? limit 0,1", array($id, $com, $type, $kind, $val));

        if (!empty($row)) {
            $func->deleteFile("../upload/" . $com . "/" . $row['photo']);
            $func->deleteFile(UPLOAD_FILE . $row['file_attach']);
            $d->rawQuery("delete from #_gallery where id = ?", array($id));
            $func->transfer(xoadulieuthanhcong, "" . $com . "?act=man_photo&id_parent=" . $id_parent . "&type=" . $type . "&kind=" . $kind . "&val=" . $val . "&p=" . $curPage);
        } else {
            $func->transfer(xoadulieubiloi, dulieukhongcothuc, "" . $com . "?act=man_photo&id_parent=" . $id_parent . "&type=" . $type . "&kind=" . $kind . "&val=" . $val . "&p=" . $curPage, false);
        }
    } elseif (isset($_GET['listid'])) {
        $listid = explode(",", $_GET['listid']);

        for ($i = 0; $i < count($listid); $i++) {
            $id = htmlspecialchars($listid[$i]);
            $row = $d->rawQueryOne("select id, photo, file_attach from #_gallery where id = ? limit 0,1", array($id));

            if (!empty($row)) {
                $func->deleteFile("../upload/" . $com . "/" . $row['photo']);
                $func->deleteFile(UPLOAD_FILE . $row['file_attach']);
                $d->rawQuery("delete from #_gallery where id = ? and com = ? and type = ? and kind = ? and val = ?", array($id, $com, $type, $kind, $val));
            }
        }

        $func->transfer(xoadulieuthanhcong, "" . $com . "?act=man_photo&id_parent=" . $id_parent . "&type=" . $type . "&kind=" . $kind . "&val=" . $val . "&p=" . $curPage);
    } else {
        $func->transfer(khongnhanduocdulieu, "" . $com . "?act=man_photo&id_parent=" . $id_parent . "&type=" . $type . "&kind=" . $kind . "&val=" . $val . "&p=" . $curPage, false);
    }
}
