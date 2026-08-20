<?php
// Query ảnh galaxy (nếu cần)
$galaxy = $cache->get(
    "select name$lang, photo, link from #_photo where type = ? and find_in_set('hienthi',status) order by numb,id desc",
    array('galaxy'),
    'result',
    7200
);
?>

<div translate="no" class="galaxy-wrap zoom-large data-close controls-close view-3D set-speed">
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

                <div id="venus" class="orbit">
                    <div class="pos">
                        <div class="planet"
                            style="background-image:url('<?= UPLOAD_PHOTO_L . ($galaxy[0]['photo'] ?? '') ?>');">
                        </div>
                    </div>
                </div>

                <div id="venus2" class="orbit">
                    <div class="pos">
                        <div class="planet"
                            style="background-image:url('<?= UPLOAD_PHOTO_L . ($galaxy[1]['photo'] ?? '') ?>');"></div>
                    </div>
                </div>
                <div id="earth" class="orbit">
                    <div class="pos">
                        <div class="planet"
                            style="background-image:url('<?= UPLOAD_PHOTO_L . ($galaxy[2]['photo'] ?? '') ?>');"></div>
                    </div>
                </div>
                <div id="mars" class="orbit">
                    <div class="pos">
                        <div class="planet"
                            style="background-image:url('<?= UPLOAD_PHOTO_L . ($galaxy[3]['photo'] ?? '') ?>');"></div>
                    </div>
                </div>
                <div id="jupiter" class="orbit">
                    <div class="pos">
                        <div class="planet"
                            style="background-image:url('<?= UPLOAD_PHOTO_L . ($galaxy[4]['photo'] ?? '') ?>');"></div>
                    </div>
                </div>
                <div id="saturn" class="orbit">
                    <div class="pos">
                        <div class="planet"
                            style="background-image:url('<?= UPLOAD_PHOTO_L . ($galaxy[5]['photo'] ?? '') ?>');"></div>
                    </div>
                </div>
                <div id="uranus" class="orbit">
                    <div class="pos">
                        <div class="planet"
                            style="background-image:url('<?= UPLOAD_PHOTO_L . ($galaxy[6]['photo'] ?? '') ?>');"></div>
                    </div>
                </div>
                <div id="uranus2" class="orbit">
                    <div class="pos">
                        <div class="planet"
                            style="background-image:url('<?= UPLOAD_PHOTO_L . ($galaxy[7]['photo'] ?? '') ?>');"></div>
                    </div>
                </div>
                <div id="neptune" class="orbit">
                    <div class="pos">
                        <div class="planet"
                            style="background-image:url('<?= UPLOAD_PHOTO_L . ($galaxy[8]['photo'] ?? '') ?>');"></div>
                    </div>
                </div>
                <div id="neptune2" class="orbit">
                    <div class="pos">
                        <div class="planet"
                            style="background-image:url('<?= UPLOAD_PHOTO_L . ($galaxy[9]['photo'] ?? '') ?>');"></div>
                    </div>
                </div>

                <!-- 5 hành tinh thêm -->
                <div id="pluto" class="orbit">
                    <div class="pos">
                        <div class="planet"
                            style="background-image:url('<?= UPLOAD_PHOTO_L . ($galaxy[10]['photo'] ?? '') ?>');"></div>
                    </div>
                </div>
                <div id="eris" class="orbit">
                    <div class="pos">
                        <div class="planet"
                            style="background-image:url('<?= UPLOAD_PHOTO_L . ($galaxy[11]['photo'] ?? '') ?>');"></div>
                    </div>
                </div>
                <div id="haumea" class="orbit">
                    <div class="pos">
                        <div class="planet"
                            style="background-image:url('<?= UPLOAD_PHOTO_L . ($galaxy[12]['photo'] ?? '') ?>');"></div>
                    </div>
                </div>
                <div id="makemake" class="orbit">
                    <div class="pos">
                        <div class="planet"
                            style="background-image:url('<?= UPLOAD_PHOTO_L . ($galaxy[13]['photo'] ?? '') ?>');"></div>
                    </div>
                </div>
                <div id="planet-x" class="orbit">
                    <div class="pos">
                        <div class="planet"
                            style="background-image:url('<?= UPLOAD_PHOTO_L . ($galaxy[14]['photo'] ?? '') ?>');"></div>
                    </div>
                </div>

                <div id="sun"></div>
            </div>
        </div>
    </div>
</div>