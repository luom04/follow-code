<?php
class FaviconGenerator
{
    public $error = '';

    /* Các file PNG cần xuất: tên file => kích thước */
    private $pngSizes = array(
        'favicon-96x96.png' => 96,
        'apple-touch-icon.png' => 180,
        'web-app-manifest-192x192.png' => 192,
        'web-app-manifest-512x512.png' => 512
    );

    /* Các kích thước gói trong favicon.ico */
    private $icoSizes = array(16, 32, 48);

    /*
     * Sinh trọn bộ favicon vào $outputDir
     * $srcPath: đường dẫn ảnh gốc (png/jpg/webp)
     * $appTitle: tên web (ghi vào site.webmanifest)
     * $outputDir: thư mục xuất bộ icon (vd: ../upload/favicon/)
     * $rootIcoPath: nếu truyền vào, chép thêm 1 bản favicon.ico ra đây (vd: ../favicon.ico cho bot tự mò)
     * Trả về true/false (lỗi ghi ở $this->error)
     */
    public function generate($srcPath, $appTitle, $outputDir, $rootIcoPath = '')
    {
        $src = $this->loadSquareImage($srcPath);
        if (!$src) return false;

        $outputDir = rtrim($outputDir, '/');
        if (!is_dir($outputDir) && !@mkdir($outputDir, 0755, true)) {
            $this->error = 'Không tạo được thư mục ' . $outputDir;
            imagedestroy($src);
            return false;
        }

        foreach ($this->pngSizes as $name => $size) {
            $im = $this->resizeTo($src, $size);
            imagepng($im, $outputDir . '/' . $name, 9);
            imagedestroy($im);
        }

        file_put_contents($outputDir . '/favicon.ico', $this->buildIco($src));
        file_put_contents($outputDir . '/favicon.svg', $this->buildSvg($src));
        file_put_contents($outputDir . '/site.webmanifest', $this->buildManifest($appTitle));
        imagedestroy($src);

        /* Bản favicon.ico ở thư mục gốc cho crawler truy cập thẳng /favicon.ico */
        if ($rootIcoPath != '') {
            @copy($outputDir . '/favicon.ico', $rootIcoPath);
        }

        return true;
    }

    /* Đọc ảnh gốc và đệm thành hình vuông nền trong suốt */
    private function loadSquareImage($path)
    {
        $info = @getimagesize($path);
        if (empty($info[0]) || empty($info[1])) {
            $this->error = 'File không phải ảnh hợp lệ';
            return false;
        }

        switch ($info['mime']) {
            case 'image/png':
                $im = @imagecreatefrompng($path);
                break;
            case 'image/jpeg':
                $im = @imagecreatefromjpeg($path);
                break;
            case 'image/webp':
                $im = (function_exists('imagecreatefromwebp')) ? @imagecreatefromwebp($path) : false;
                break;
            default:
                $im = false;
        }

        if (!$im) {
            $this->error = 'Không đọc được ảnh (' . $info['mime'] . ')';
            return false;
        }

        $w = imagesx($im);
        $h = imagesy($im);
        if ($w == $h) return $im;

        /* Ảnh chữ nhật: đặt vào giữa khung vuông, phần thừa trong suốt */
        $size = max($w, $h);
        $square = $this->createTransparent($size);
        imagecopy($square, $im, (int)(($size - $w) / 2), (int)(($size - $h) / 2), 0, 0, $w, $h);
        imagedestroy($im);

        return $square;
    }

    /* Tạo canvas vuông nền trong suốt */
    private function createTransparent($size)
    {
        $im = imagecreatetruecolor($size, $size);
        imagealphablending($im, false);
        imagesavealpha($im, true);
        imagefill($im, 0, 0, imagecolorallocatealpha($im, 0, 0, 0, 127));

        return $im;
    }

    /* Resize ảnh vuông về kích thước mới, giữ trong suốt */
    private function resizeTo($src, $size)
    {
        $im = $this->createTransparent($size);
        imagecopyresampled($im, $src, 0, 0, 0, 0, $size, $size, imagesx($src), imagesy($src));

        return $im;
    }

    /* Xuất ảnh ra chuỗi PNG */
    private function pngData($src, $size)
    {
        $im = $this->resizeTo($src, $size);
        ob_start();
        imagepng($im, null, 9);
        imagedestroy($im);

        return ob_get_clean();
    }

    /*
     * Dựng file .ico đa kích thước (16+32+48), mỗi entry là 1 ảnh PNG
     * Cấu trúc: ICONDIR (6 byte) + n * ICONDIRENTRY (16 byte) + dữ liệu ảnh
     */
    private function buildIco($src)
    {
        $images = array();
        foreach ($this->icoSizes as $size) {
            $images[$size] = $this->pngData($src, $size);
        }

        $count = count($images);
        $header = pack('vvv', 0, 1, $count);
        $body = '';
        $offset = 6 + 16 * $count;

        foreach ($images as $size => $data) {
            /* width, height (0 = 256), colors, reserved, planes, bpp, size, offset */
            $header .= pack('CCCCvvVV', $size % 256, $size % 256, 0, 0, 1, 32, strlen($data), $offset);
            $offset += strlen($data);
            $body .= $data;
        }

        return $header . $body;
    }

    /* Bọc ảnh PNG 512px vào vỏ SVG (không phải vector hóa thật) */
    private function buildSvg($src)
    {
        $b64 = base64_encode($this->pngData($src, 512));

        return '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="512" height="512" viewBox="0 0 512 512">'
            . '<image width="512" height="512" xlink:href="data:image/png;base64,' . $b64 . '"/>'
            . '</svg>';
    }

    /* Sinh site.webmanifest cho Android/PWA */
    private function buildManifest($appTitle)
    {
        $manifest = array(
            'name' => $appTitle,
            'short_name' => $appTitle,
            'icons' => array(
                /* Đường dẫn tương đối: tự resolve theo vị trí file manifest, chạy đúng cả khi web nằm trong thư mục con */
                array('src' => 'web-app-manifest-192x192.png', 'sizes' => '192x192', 'type' => 'image/png', 'purpose' => 'maskable'),
                array('src' => 'web-app-manifest-512x512.png', 'sizes' => '512x512', 'type' => 'image/png', 'purpose' => 'maskable')
            ),
            'theme_color' => '#ffffff',
            'background_color' => '#ffffff',
            'display' => 'standalone'
        );

        return json_encode($manifest, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    }
}
