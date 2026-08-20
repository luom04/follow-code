<?php 
$productListMenu = $d->rawQuery("select name$lang, type, status, id from #_product_list where type = ? and find_in_set('hienthi',status) order by numb,id desc", array('san-pham'));
$city = $d->rawQuery("select id, name from #_city where find_in_set('hienthi',status) order by numb,id desc");
$khoanggia = $d->rawQuery("select  namevi as name, id from #_search where type = ? and hienthi > 0 order by stt,id desc",array('khoang-gia'));
$dientich = $d->rawQuery("select  namevi as name, id from #_search where type = ? and hienthi > 0 order by stt,id desc",array('dien-tich'));
?>


 <div class="filer-box">
    <form action="tim-kiem">
        <div class="d-input">
            <label for="">Tỉnh/ thành</label>
            <select id="realEstate-city" name="city"  class="select-city-cart form-select form-control select2 text-sm">
                <option value="0">Chọn Tỉnh/ thành</option>
                <?php foreach ($city as $key => $value) { ?>
                    <option value="<?=$value['id']?>"><?=$value['name']?></option>
                <?php } ?>
            </select>                
        </div>
        <div class="d-input">
            <label for="">Quận/ huyện</label>
            <select id="realEstate-ward" name="ward"  class="select-ward-cart select-ward form-select form-control select2 text-sm"><option value="0">Chọn Quận/ huyện</option>
            </select>
        </div>
       
        <div class="d-input">
            <label for="">Loại bất động sản</label>
            <select name="realEstate-list" id="realEstate-list" class="select2">
                <option value="">Chọn loại bất động sản</option>
                <?php foreach ($productListMenu as $klist => $v) { ?>
                    <option value="<?=$v['id']?>"><?=$v['name'.$lang]?></option> 
                <?php }  ?>
            </select>
        </div>
        <div class="d-input">
            <label for="">Giá</label>
            <select name="realEstate-khoanggia" id="realEstate-khoanggia" class="select2">
                <option value="">Chọn giá</option>
                <?php foreach ($khoanggia as $k => $v) { ?>
                    <option value="<?= $v['id'] ?>"><?= $v['name'] ?></option>
                <?php } ?>
            </select>
        </div>
        <div class="d-input">
            <label for="">Diện tích</label>
            <select name="realEstate-area" id="realEstate-area" class="select2">
                <option value="">Chọn diện tích</option>
                <?php foreach ($dientich as $k => $v) { ?>
                    <option value="<?= $v['id'] ?>"><?= $v['name'] ?></option>
                <?php } ?>
            </select>
        </div>
        <a href="javascript:void(0)" class="btn-search filer-button realEstate-btn  pulse2" style="color: #fff !important;"><i class="fa fa-search"></i> Tìm kiếm</a>

    </form>
</div>