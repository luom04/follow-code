<?php
class Cart
{
    private $d;

    function __construct($d)
    {
        $this->d = $d;
    }

    public function getProductInfo($pid = 0)
    {
        $row = null;
        if ($pid) {
            $row = $this->d->rawQueryOne("select * from #_product where id = ? limit 0,1", array($pid));
        }
        return $row;
    }

    public function getProductColor($color = 0)
    {
        $str = '';
        if ($color) {
            $row = $this->d->rawQueryOne("select namevi from #_color where id = ? limit 0,1", array($color));
            $str = $row['namevi'];
        }
        return $str;
    }

    public function getProductSize($size = 0)
    {
        $str = '';
        if ($size) {
            $row = $this->d->rawQueryOne("select namevi from #_size where id = ? limit 0,1", array($size));
            $str = $row['namevi'];
        }
        return $str;
    }

    public function removeProduct($code_order = '')
    {
        if (!empty($_SESSION['cart']) && $code_order != '') {
            $max = count($_SESSION['cart']);

            for ($i = 0; $i < $max; $i++) {
                if ($code_order == $_SESSION['cart'][$i]['code']) {
                    unset($_SESSION['cart'][$i]);
                    break;
                }
            }

            $_SESSION['cart'] = array_values($_SESSION['cart']);
        }
    }
    
    public function getOrderTotal()
    {
        global $d;
        $sum = 0;

        if (!empty($_SESSION['cart'])) {
            $max = count($_SESSION['cart']);

            for ($i = 0; $i < $max; $i++) {
                $pid = $_SESSION['cart'][$i]['productid'];
                $q = $_SESSION['cart'][$i]['qty'];
                $variant = $_SESSION['cart'][$i]['variant'] ?: [];

                $proinfo = $this->getProductInfo($pid);

                // Giá mặc định từ sản phẩm
                $price = ($proinfo['sale_price'] > 0) ? $proinfo['sale_price'] : $proinfo['regular_price'];

                // Ưu tiên giá từ variant
                if (!empty($variant)) {
                    if (!empty($variant['discount']) && $variant['discount'] > 0) {
                        $price = $variant['discount'];
                    } elseif (!empty($variant['price']) && $variant['price'] > 0) {
                        $price = $variant['price'];
                    }
                }

                $sum += ($price * $q);
            }
        }

        return $sum;
    }

    public function addToCart($q = 1, $pid = 0, $variant = [])
    {
        if ($pid < 1 || $q < 1) return;

        // Nếu không có variant nào (sản phẩm không có thuộc tính)
        if (empty($variant) || empty($variant['key'])) {
            $comboKey = 'default'; // gán mặc định
        } else {
            $comboKey = $variant['key']; // vd: den|800x600|dong
        }

        // Tạo mã code_order duy nhất
        $code_order = md5($pid . $comboKey);

        if (!isset($_SESSION['cart'])) {
            $_SESSION['cart'] = [];
        }

        // Nếu chưa tồn tại thì thêm mới
        if (!$this->productExists($code_order, $q)) {
            $max = count($_SESSION['cart']);
            $_SESSION['cart'][$max] = [
                'productid' => $pid,
                'qty'       => $q,
                'code'      => $code_order,
                'variant'   => $variant
            ];
        }
    }

    private function productExists($code_order = '', $q = 1)
    {
        $flag = 0;

        if (!empty($_SESSION['cart']) && $code_order != '') {
            $q = ($q > 1) ? $q : 1;
            $max = count($_SESSION['cart']);

            for ($i = 0; $i < $max; $i++) {
                if ($code_order == $_SESSION['cart'][$i]['code']) {
                    $_SESSION['cart'][$i]['qty'] += $q;
                    $flag = 1;
                }
            }
        }

        return $flag;
    }
}
