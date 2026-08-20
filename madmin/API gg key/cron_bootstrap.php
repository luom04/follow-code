<?php
// Cron bootstrap (không cần session/admin)
$root = dirname(__DIR__, 2); // = /public_html

if (!defined('LIBRARIES')) define('LIBRARIES', $root . '/libraries/');
if (!defined('SOURCES'))   define('SOURCES', $root . '/sources/');
if (!defined('THUMBS'))    define('THUMBS', 'thumbs');

require_once LIBRARIES . 'config.php';
require_once LIBRARIES . 'autoload.php';
new AutoLoad();

// DB theo framework của bạn
$d = new PDODb($config['database']);
$cache = new Cache($d);
$func  = new Functions($d, $cache);



function decodeSettingJson($raw)
{
    if (!is_string($raw) || trim($raw) === '') return null;

    // Giải mã HTML entities (&quot; → ")
    $raw = html_entity_decode($raw, ENT_QUOTES | ENT_HTML5, 'UTF-8');

    // Loại BOM nếu có
    $raw = preg_replace('/^\xEF\xBB\xBF/', '', $raw);

    $arr = json_decode($raw, true);
    return is_array($arr) ? $arr : null;
}