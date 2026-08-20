<?php
if (!defined('SOURCES')) die("Error");

switch ($act) {
    case "delete":
        delete();
        break;

    default:
        $template = "404";
}

/* Delete cache */
function delete()
{
    global $func, $cache;

    array_map('unlink', glob(ROOT . "assets/caches/*"));

    if ($cache->delete()) $func->transfer(xoacachethanhcong, "index.php");
    else $func->transfer(xoacachethatbai, "index.php", false);
}
