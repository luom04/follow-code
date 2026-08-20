<?php
session_start();

define('LIBRARIES', dirname(__DIR__, 2) . '/libraries/');
require_once LIBRARIES . "config.php";
require_once LIBRARIES . "autoload.php";
new AutoLoad();

$d = new PDODb($config['database']);
$cache = new Cache($d);
$func  = new Functions($d, $cache);

if ($func->checkLoginAdmin() == false) {
  http_response_code(403);
  exit('Forbidden');
}

$cooldown = 300; // 5 phút
$flagFile = __DIR__ . '/gsc_last_run.txt';
$last = is_file($flagFile) ? (int)@file_get_contents($flagFile) : 0;
$remain = max(0, $cooldown - (time() - $last));

header('Content-Type: application/json; charset=utf-8');
echo json_encode([
  'cooldown' => $cooldown,
  'last' => $last,
  'remain' => $remain
]);
