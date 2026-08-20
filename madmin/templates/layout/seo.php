<!-- SEO -->
<?php
$slugurlArray = '';
$seo_create = '';
if (($com == "static" || $com == "seopage") && isset($config['website']['comlang'])) {
    foreach ($config['website']['comlang'] as $k => $v) {
        if ($type == $k) {
            $slugurlArray = $v;
            break;
        }
    }
}
$listCriteria = [
    'keywordNotUsed' => 'Đặt Từ khóa tập trung cho nội dung này.',
    'keywordInTitle' => 'Thêm từ khóa chính vào tiêu đề SEO.',
    'titleStartWithKeyword' => 'Sử dụng từ khóa chính gần đầu tiêu đề SEO.',
    'lengthTitle' => 'Tiêu đề của bài viết phải lớn hơn 40 ký tự và khuyến cáo nhỏ hơn 70 ký tự',
    'keywordInMetaDescription' => 'Thêm Từ khóa tập trung vào Mô tả meta SEO của bạn.',
    'lengthMetaDescription' => 'Mô tả meta SEO của bạn nên có từ 160 đến 300 ký tự.',
    'keywordInPermalink' => 'Sử dụng từ khóa chính trong URL.',
    'lengthPermalink' => 'URL không khả dụng. Thêm URL ngắn.',
    'keywordIn10Percent' => 'Sử dụng từ khóa chính ở đầu nội dung của bạn.',
    'keywordInContent' => 'Sử dụng từ khóa chính trong nội dung.',
    'lengthContent' => 'Nội dung phải dài 600-2500 từ.',
    'linksHasInternal' => 'Thêm liên kết nội bộ vào nội dung của bạn.',
    'keywordInSubheadings' => 'Sử dụng từ khóa chính trong (các) tiêu đề phụ như H2, H3, H4, v.v..',
    'keywordInImageAlt' => 'Thêm từ khóa vào thuộc tính alt của hình ảnh',
    'keywordDensity' => 'Mật độ từ khóa là 0. Nhắm đến khoảng 1% Mật độ từ khóa.',
    'contentHasShortParagraphs' => 'Thêm các đoạn văn ngắn và súc tích để dễ đọc và UX hơn.',
    'contentHasAssets' => 'Thêm một vài hình ảnh để làm cho nội dung của bạn hấp dẫn.',
];
?>
<div class="card-seo" id="card-seo">
    <div class="card card-primary card-outline card-outline-tabs">
        <div class="card-header p-0 border-bottom-0">
            <ul class="nav nav-tabs" id="custom-tabs-three-tab-lang" role="tablist">
                <?php foreach ($config['website']['seo'] as $k => $v) {
                    $seo_create .= $k . ","; ?>
                    <li class="nav-item">
                        <a class="nav-link <?= ($k == 'vi') ? 'active' : '' ?>" id="tabs-lang" data-value="<?= $k ?>" data-toggle="pill" href="#tabs-seolang-<?= $k ?>" role="tab" aria-controls="tabs-seolang-<?= $k ?>" aria-selected="true">SEO (<?= $v ?>)</a>
                    </li>
                <?php } ?>
            </ul>
        </div>
        <div class="card-body">
            <div class="tab-content" id="custom-tabs-three-tabContent-lang">
                <?php foreach ($config['website']['seo'] as $k => $v) { ?>
                    <div class="tab-pane fade show <?= ($k == 'vi') ? 'active' : '' ?>" id="tabs-seolang-<?= $k ?>" role="tabpanel" aria-labelledby="tabs-lang">
                        <div class="form-group">
                            <div class="label-seo">
                                <label for="title<?= $k ?>">SEO Title (<?= $k ?>):</label>
                                <strong class="count-seo"><span><?= mb_strlen(htmlspecialchars(@$seoDB['title' . $k]?:'')) ?></span>/70 <?=kytu?></strong>
                            </div>
                            <input type="text" class="form-control check-seo title-seo text-sm" onkeyup="seoRankMath().init();" name="dataSeo[title<?= $k ?>]" id="title<?= $k ?>" placeholder="SEO Title (<?= $k ?>)" value="<?= (!empty($flash->has('title' . $k))) ? $flash->get('title' . $k) : @$seoDB['title' . $k] ?>">
                        </div>
                        <div class="form-group">
                            <div class="label-seo">
                                <label for="keywords<?= $k ?>">SEO Keywords (<?= $k ?>):</label>
                                <strong class="count-seo"><span><?= mb_strlen(htmlspecialchars(@$seoDB['keywords' . $k]?:'')) ?></span>/300 <?=kytu?></strong>
                            </div>
                            <input type="text" class="form-control check-seo keywords-seo text-sm" onkeyup="seoRankMath().init();" name="dataSeo[keywords<?= $k ?>]" id="keywords<?= $k ?>" placeholder="SEO Keywords (<?= $k ?>)" value="<?= (!empty($flash->has('keywords' . $k))) ? $flash->get('keywords' . $k) : @$seoDB['keywords' . $k] ?>">
                        </div>
                        <div class="form-group">
                            <div class="label-seo">
                                <label for="description<?= $k ?>">SEO Description (<?= $k ?>):</label>
                                <strong class="count-seo"><span><?= mb_strlen(htmlspecialchars(@$seoDB['description' . $k] ?: '')) ?></span>/300 <?=kytu?></strong>
                            </div>
                            <textarea class="form-control check-seo description-seo text-sm" onkeyup="seoRankMath().init();" name="dataSeo[description<?= $k ?>]" id="description<?= $k ?>" rows="5" placeholder="SEO Description (<?= $k ?>)"><?= $func->decodeHtmlChars($flash->get('description' . $k)) ?: $func->decodeHtmlChars(@$seoDB['description' . $k]) ?></textarea>
                        </div>
                        <?php if($com != 'seopage') { ?>
                        <div class="seo-panel-group mb-0 seo-general" id="seo-general-<?=$k?>" >
                            <ul>
                            <?php foreach ($listCriteria as $key => $label){ ?>
                                <li key="<?=$key?>" class="seo-check-<?=$key?> test-fail">
                                    <span class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293z"/>
                                        </svg>
                                    </span>
                                    <span class="txt"><?=$label?></span>
                                </li>
                            <?php } ?>
                            </ul>
                        </div>
                        <?php } ?>

                        <?php /* if($k == "vi" || $k == "en") { ?>
                            <!-- SEO preview -->
                            <div class="form-group form-group-seo-preview callout callout-warning mb-0">
                                <label class="label-seo-preview"><i class="fas fa-info mr-2"></i>Khi lên top, page này sẽ hiển thị theo dạng mẫu như sau:</label>
                                <div class="seo-preview">
                                    <?php if($slugurlArray) { ?>
                                        <p class="slug-seo-preview" id="seourlpreview<?=$k?>" data-seourlstatic="0"><?=$configBase?><strong><?=$slugurlArray[$k]?></strong></p>
                                    <?php } else { ?>
                                        <p class="slug-seo-preview" id="seourlpreview<?=$k?>" data-seourlstatic="<?=($com == 'setting') ? 0 : 1?>"><?=$configBase?><strong><?=@$item['slug'.$k]?></strong></p>
                                    <?php } ?>
                                    <p class="title-seo-preview text-split" id="title-seo-preview<?=$k?>"><?php if(isset($seoDB['title'.$k])) { echo @$seoDB['title'.$k]; } else if(isset($item['name'.$k])) { echo @$item['name'.$k]; } else { echo "Title"; } ?></p>
                                    <p class="description-seo-preview text-split" id="description-seo-preview<?=$k?>"><?=(isset($seoDB['description'.$k])) ? @$seoDB['description'.$k] : "Description"?></p>
                                </div>
                            </div>
                        <?php } */ ?>
                    </div>
                <?php } ?>
            </div>
        </div>
        <input type="hidden" id="seo-create" value="<?= (isset($seo_create)) ? rtrim($seo_create, ",") : '' ?>">
    </div>
</div>