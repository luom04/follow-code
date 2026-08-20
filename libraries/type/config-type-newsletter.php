<?php
/* Đăng ký nhận tin */
$nametype = "newsletter";
$config['newsletter'][$nametype]['title_main'] = "Đăng ký nhận tin";
$config['newsletter'][$nametype]['file'] = false;
$config['newsletter'][$nametype]['email'] = true;
$config['newsletter'][$nametype]['is_send'] = false;
$config['newsletter'][$nametype]['fullname'] = false;
$config['newsletter'][$nametype]['phone'] = false;
$config['newsletter'][$nametype]['address'] = false;
$config['newsletter'][$nametype]['subject'] = false;
$config['newsletter'][$nametype]['content'] = false;
$config['newsletter'][$nametype]['notes'] = true;
$config['newsletter'][$nametype]['confirm_status'] = array("1" => daxem, "2" => dalienhe, "3" => dathongbao);
$config['newsletter'][$nametype]['show_name'] = true;
$config['newsletter'][$nametype]['show_subject'] = true;
$config['newsletter'][$nametype]['show_phone'] = true;
$config['newsletter'][$nametype]['show_date'] = true;
$config['newsletter'][$nametype]['file_type'] = '.doc|.docx|.pdf|.rar|.zip|.ppt|.pptx|.xls|.xlsx|.jpg|.png|.gif|.webp|.WEBP';

$nametype = "tu-van";
$config['newsletter'][$nametype]['title_main'] = "Đăng ký tư vấn";
$config['newsletter'][$nametype]['file'] = false;
$config['newsletter'][$nametype]['email'] = false;
$config['newsletter'][$nametype]['is_send'] = false;
$config['newsletter'][$nametype]['fullname'] = true;
$config['newsletter'][$nametype]['phone'] = true;
$config['newsletter'][$nametype]['address'] = false;
$config['newsletter'][$nametype]['subject'] = true;
$config['newsletter'][$nametype]['content'] = false;
$config['newsletter'][$nametype]['notes'] = true;
$config['newsletter'][$nametype]['confirm_status'] = array("1" => daxem, "2" => dalienhe, "3" => dathongbao);
$config['newsletter'][$nametype]['show_name'] = true;
$config['newsletter'][$nametype]['show_subject'] = true;
$config['newsletter'][$nametype]['show_phone'] = true;
$config['newsletter'][$nametype]['show_date'] = true;
$config['newsletter'][$nametype]['file_type'] = '.doc|.docx|.pdf|.rar|.zip|.ppt|.pptx|.xls|.xlsx|.jpg|.png|.gif|.webp|.WEBP';



// $nametype = "datxe";
// $config['newsletter'][$nametype]['title_main'] = "Đặt xe";
// $config['newsletter'][$nametype]['file'] = false;
// $config['newsletter'][$nametype]['ngaydi'] = true;
// $config['newsletter'][$nametype]['ngayve'] = true;
// $config['newsletter'][$nametype]['email'] = true;
// $config['newsletter'][$nametype]['is_send'] = false;
// $config['newsletter'][$nametype]['fullname'] = true;
// $config['newsletter'][$nametype]['phone'] = true;
// $config['newsletter'][$nametype]['loaixe'] = true;
// $config['newsletter'][$nametype]['address'] = false;
// $config['newsletter'][$nametype]['subject'] = true;
// $config['newsletter'][$nametype]['content'] = true;
// $config['newsletter'][$nametype]['notes'] = true;
// $config['newsletter'][$nametype]['confirm_status'] = array("1" => daxem, "2" => dalienhe, "3" => dathongbao);
// $config['newsletter'][$nametype]['show_name'] = true;
// $config['newsletter'][$nametype]['show_subject'] = true;
// $config['newsletter'][$nametype]['show_phone'] = true;
// $config['newsletter'][$nametype]['show_date'] = true;
// $config['newsletter'][$nametype]['file_type'] = '.doc|.docx|.pdf|.rar|.zip|.ppt|.pptx|.xls|.xlsx|.jpg|.png|.gif|.webp|.WEBP';
