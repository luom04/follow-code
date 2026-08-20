<?php
define('ROOT', __DIR__);
define('AJAX', false);

require_once ROOT . '/libraries/autoload.php';
require_once ROOT . '/libraries/config.php';
require_once ROOT . '/libraries/functions.php';
require_once ROOT . '/libraries/router.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ mặt trời</title>
    <link rel="stylesheet" href="http://localhost/2026/january/congtyhdt_104425w/assets/css/galaxy.css" type="text/css"
        media="all">
</head>
<?php
$galaxy = $cache->get("select name$lang, photo, link from #_photo where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('galaxy'), 'result', 7200);
?>

<body translate="no" class="zoom-large data-close controls-close view-3D set-speed">
    <div id="universe" class="scale-stretched">
        <div id="galaxy">
            <div id="solar-system" class="earth">
                <div id="mercury" class="orbit">
                    <div class="pos">
                        <div class="planet">
                            <dl class="infos">
                                <dt>Mercury</dt>
                                <dd><span></span></dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div id="venus" class="orbit"
                    style="background-image: url(<?= UPLOAD_PHOTO_L . $galaxy[0]['photo'] ?>);">
                    <div class="pos">
                        <div class="planet">
                        </div>
                    </div>
                </div>
                <div id="venus2" class="orbit">
                    <div class="pos">
                        <div class="planet">
                        </div>
                    </div>
                </div>
                <div id="earth" class="orbit">
                    <div class="pos">
                        <div class="planet">
                        </div>
                    </div>
                </div>
                <div id="mars" class="orbit">
                    <div class="pos">
                        <div class="planet">
                        </div>
                    </div>
                </div>
                <div id="jupiter" class="orbit">
                    <div class="pos">
                        <div class="planet">
                        </div>
                    </div>
                </div>
                <div id="saturn" class="orbit">
                    <div class="pos">
                        <div class="planet">
                        </div>
                    </div>
                </div>
                <div id="uranus" class="orbit">
                    <div class="pos">
                        <div class="planet">
                        </div>
                    </div>
                </div>
                <div id="uranus2" class="orbit">
                    <div class="pos">
                        <div class="planet">
                        </div>
                    </div>
                </div>
                <div id="neptune" class="orbit">
                    <div class="pos">
                        <div class="planet">
                        </div>
                    </div>
                </div>
                <div id="neptune2" class="orbit">
                    <div class="pos">
                        <div class="planet">
                        </div>
                    </div>
                </div>
                <!-- Pluto -->
                <div id="pluto" class="orbit">
                    <div class="pos">
                        <div class="planet">
                            <dl class="infos">
                                <dt>Pluto</dt>
                                <dd><span></span></dd>
                            </dl>
                        </div>
                    </div>
                </div>

                <!-- Eris -->
                <div id="eris" class="orbit">
                    <div class="pos">
                        <div class="planet">
                            <dl class="infos">
                                <dt>Eris</dt>
                                <dd><span></span></dd>
                            </dl>
                        </div>
                    </div>
                </div>

                <!-- Haumea -->
                <div id="haumea" class="orbit">
                    <div class="pos">
                        <div class="planet">
                            <dl class="infos">
                                <dt>Haumea</dt>
                                <dd><span></span></dd>
                            </dl>
                        </div>
                    </div>
                </div>

                <!-- Makemake -->
                <div id="makemake" class="orbit">
                    <div class="pos">
                        <div class="planet">
                            <dl class="infos">
                                <dt>Makemake</dt>
                                <dd><span></span></dd>
                            </dl>
                        </div>
                    </div>
                </div>

                <!-- Planet X (giả lập) -->
                <div id="planet-x" class="orbit">
                    <div class="pos">
                        <div class="planet">
                            <dl class="infos">
                                <dt>Planet X</dt>
                                <dd><span></span></dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div id="sun">
                </div>
            </div>
        </div>
    </div>
</body>

</html>