// Hàm để tải video TikTok
function loadTikTokVideo(container, videoId) {
	// Tạo iframe
	const iframe = document.createElement('iframe');
	iframe.width = '100%';
	iframe.height = '540px';
	iframe.src = `https://www.tiktok.com/player/v1/${videoId}?music_info=1&description=1`;
	iframe.allow = 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture';
	iframe.allowFullscreen = true;
	container.html(iframe);

	iframe.onload = function() {
        setTimeout(() => {
            try {
                iframe.contentWindow.postMessage({
                    "type": "unmute",
                    "x-tiktok-player": true
                }, '*');
                
                iframe.contentWindow.postMessage({
                    "type": "play",
                    "x-tiktok-player": true
                }, '*');
            } catch (e) {
                console.log('Không thể gửi message đến iframe:', e);
            }
        }, 500);
    };
}

function pseudoClick(parentElem) {

    var beforeClicked,
      afterClicked;

  var parentLeft = parseInt(parentElem.getBoundingClientRect().left, 10),
      parentTop = parseInt(parentElem.getBoundingClientRect().top, 10);

  var parentWidth = parseInt(window.getComputedStyle(parentElem).width, 10),
      parentHeight = parseInt(window.getComputedStyle(parentElem).height, 10);

  var before = window.getComputedStyle(parentElem, ':before');

  var beforeStart = parentLeft + (parseInt(before.getPropertyValue("left"), 10)),
      beforeEnd = beforeStart + parseInt(before.width, 10);

  var beforeYStart = parentTop + (parseInt(before.getPropertyValue("top"), 10)),
      beforeYEnd = beforeYStart + parseInt(before.height, 10);

  var after = window.getComputedStyle(parentElem, ':after');

  var afterStart = parentLeft + (parseInt(after.getPropertyValue("left"), 10)),
      afterEnd = afterStart + parseInt(after.width, 10);

  var afterYStart = parentTop + (parseInt(after.getPropertyValue("top"), 10)),
      afterYEnd = afterYStart + parseInt(after.height, 10);

  var mouseX = event.clientX,
      mouseY = event.clientY;

  beforeClicked = (mouseX >= beforeStart && mouseX <= beforeEnd && mouseY >= beforeYStart && mouseY <= beforeYEnd ? true : false); afterClicked = (mouseX >= afterStart && mouseX <= afterEnd && mouseY >= afterYStart && mouseY <= afterYEnd ? true : false);

  return {
    "before" : beforeClicked,
    "after"  : afterClicked

  };      

}

function isExist(ele) {
	return ele.length;
}

function isNumeric(value) {
	return /^\d+$/.test(value);
}

function getLen(str) {
	return /^\s*$/.test(str) ? 0 : str.length;
}

function showNotify(text = 'Notify text', title = LANG['thongbao'], status = 'success') {
	new Notify({
		status: status, // success, warning, error
		title: title,
		text: text,
		effect: 'fade',
		speed: 400,
		customClass: null,
		customIcon: null,
		showIcon: true,
		showCloseButton: true,
		autoclose: true,
		autotimeout: 3000,
		gap: 10,
		distance: 10,
		type: 3,
		position: 'right top'
	});
}

function notifyDialog(content = '', title = LANG['thongbao'], icon = 'fas fa-exclamation-triangle', type = 'blue') {
	$.alert({
		title: title,
		icon: icon, // font awesome
		type: type, // red, green, orange, blue, purple, dark
		content: content, // html, text
		backgroundDismiss: true,
		animationSpeed: 600,
		animation: 'zoom',
		closeAnimation: 'scale',
		typeAnimated: true,
		animateFromElement: false,
		autoClose: 'accept|3000',
		escapeKey: 'accept',
		buttons: {
			accept: {
				text: LANG['dongy'],
				btnClass: 'btn-sm btn-primary'
			}
		}
	});
}

function confirmDialog(action, text, value, title = LANG['thongbao'], icon = 'fas fa-exclamation-triangle', type = 'blue') {
	$.confirm({
		title: title,
		icon: icon, // font awesome
		type: type, // red, green, orange, blue, purple, dark
		content: text, // html, text
		backgroundDismiss: true,
		animationSpeed: 600,
		animation: 'zoom',
		closeAnimation: 'scale',
		typeAnimated: true,
		animateFromElement: false,
		autoClose: 'cancel|3000',
		escapeKey: 'cancel',
		buttons: {
			success: {
				text: LANG['dongy'],
				btnClass: 'btn-sm btn-primary',
				action: function () {
					if (action == 'delete-procart') deleteCart(value);
				}
			},
			cancel: {
				text: LANG['huy'],
				btnClass: 'btn-sm btn-danger'
			}
		}
	});
}

function loadReCaptcha(callback) {
    if (window.grecaptcha) {
        callback();
        return;
    }
    const script = document.createElement("script");
    script.src = "https://www.google.com/recaptcha/api.js?render=" + RECAPTCHA_SITEKEY;
    script.async = true;
    script.defer = true;
    script.onload = callback;
    document.body.appendChild(script);
}

function validateForm(ele = '') {
    if (ele) {
        $('.' + ele)
            .find('[type=submit]')
            .removeAttr('disabled');

        var forms = document.getElementsByClassName(ele);

        Array.prototype.forEach.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
					form.reportValidity();

                    form.classList.add('was-validated');
                    return;
                }
				// Ngăn submit gốc để chờ reCAPTCHA
				event.preventDefault();
				event.stopPropagation();
                form.classList.add('was-validated');
				if(RECAPTCHA_ACTIVE && RECAPTCHA_SITEKEY) {
					loadReCaptcha(function () {
						grecaptcha.ready(function () {
							grecaptcha.execute(RECAPTCHA_SITEKEY, {
								action: ele.replace(/-/g, "_") // lấy action theo class form
							}).then(function (token) {
								// Tìm hoặc tạo input hidden để chứa token
								let input = form.querySelector('.recaptcha-response');
								if (!input) {
									input = document.createElement("input");
									input.type = "hidden";
									input.name = "recaptchaResponse";
									input.className = "recaptcha-response";
									form.appendChild(input);
								}
								input.value = token;
								// Submit lại form
								form.submit();
							});
						});
					});
				}else{
					form.submit();
				}
            }, false);
        });
    }
}

function readImage(inputFile, elementPhoto) {
	if (inputFile[0].files[0]) {
		if (inputFile[0].files[0].name.match(/.(jpg|jpeg|png|gif)$/i)) {
			var size = parseInt(inputFile[0].files[0].size) / 1024;

			if (size <= 4096) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$(elementPhoto).attr('src', e.target.result);
				};
				reader.readAsDataURL(inputFile[0].files[0]);
			} else {
				notifyDialog(LANG['dungluonghinhanhlon']);
				return false;
			}
		} else {
			$(elementPhoto).attr('src', '');
			notifyDialog(LANG['dinhdanghinhanhkhonghople']);
			return false;
		}
	} else {
		$(elementPhoto).attr('src', '');
		return false;
	}
}

function photoZone(eDrag, iDrag, eLoad) {
	if ($(eDrag).length) {
		/* Drag over */
		$(eDrag).on('dragover', function () {
			$(this).addClass('drag-over');
			return false;
		});

		/* Drag leave */
		$(eDrag).on('dragleave', function () {
			$(this).removeClass('drag-over');
			return false;
		});

		/* Drop */
		$(eDrag).on('drop', function (e) {
			e.preventDefault();
			$(this).removeClass('drag-over');

			var lengthZone = e.originalEvent.dataTransfer.files.length;

			if (lengthZone == 1) {
				$(iDrag).prop('files', e.originalEvent.dataTransfer.files);
				readImage($(iDrag), eLoad);
			} else if (lengthZone > 1) {
				notifyDialog(LANG['banchiduocchon1hinhanhdeuplen']);
				return false;
			} else {
				notifyDialog(LANG['dulieukhonghople']);
				return false;
			}
		});

		/* File zone */
		$(iDrag).change(function () {
			readImage($(this), eLoad);
		});
	}
}

function generateCaptcha(action, id) {
	if (RECAPTCHA_ACTIVE && action && id && $('#' + id).length) {
		grecaptcha.execute(RECAPTCHA_SITEKEY, { action: action }).then(function (token) {
			var recaptchaResponse = document.getElementById(id);
			recaptchaResponse.value = token;
		});
	}
}

function loadPaging(url = '', eShow = '', callback = function(){}) {
	if ($(eShow).length && url) {
		$.ajax({
			url: url,
			type: 'GET',
			data: {
				eShow: eShow
			},
			success: function (result) {
				$(eShow).html(result);
				MM_FRAMEWORK.Lazys();
				callback();
			}
		});
	}
}
let delayTimer;
function doEnter(event, obj) {
	if (event.keyCode == 13 || event.which == 13) onSearch(obj);
	else {
		clearTimeout(delayTimer); // debounce
		delayTimer = setTimeout(() => {
			var keyword = $('#' + obj).val().trim();
			if (keyword != '') {
				$.ajax({
					type: "POST",
					url: "api/search.php?keyword=" + encodeURI(keyword),
					dataType: "html",
					beforeSend: function() {
						$("#search-result").removeClass('show');
					},
					success: function(result) {
						$("#search-result").html(result).addClass('show');
					},
				});
			}
		}, 300);

		$('#btn-clear-keyword').on('click', function () {
			$('#keyword').val('').focus();
			$('#search-result').removeClass('show').html('');
			$(this).addClass('d-none');
		});

		// ✅ Hiện hoặc ẩn nút clear
        if (keyword !== '') {
            $('#btn-clear-keyword').removeClass('d-none');
        } else {
            $('#btn-clear-keyword').addClass('d-none');
        }
	}
}

function onSearch(obj) {
	var keyword = $('#' + obj).val();

	if (keyword == '') {
		notifyDialog(LANG['no_keywords']);
		return false;
	} else {
		location.href = 'san-pham?q=' + encodeURI(keyword);
	}
}

function goToByScroll(id, minusTop) {
	minusTop = parseInt(minusTop) ? parseInt(minusTop) : 0;
	id = id.replace('#', '');
	$('html,body').animate(
		{
			scrollTop: $('#' + id).offset().top - minusTop
		},
		'slow'
	);
}

function holdonOpen(theme = 'sk-circle',text = 'Loading...',backgroundColor = 'rgba(0,0,0,0.8)',textColor = 'white') {
	var options = {
		theme: theme,
		message: text,
		backgroundColor: backgroundColor,
		textColor: textColor
	};

	HoldOn.open(options);
}

function holdonClose() {
	HoldOn.close();
}

function updateCart(id = 0, code = '', quantity = 1) {
	if (id) {
		var formCart = $('.form-cart');
		var ward = formCart.find('.select-ward-cart').val();

		$.ajax({
			type: 'POST',
			url: 'api/cart.php',
			dataType: 'json',
			data: {
				cmd: 'update-cart',
				id: id,
				code: code,
				quantity: quantity,
				ward: ward
			},
			beforeSend: function () {
				holdonOpen();
			},
			success: function (result) {
				if (result) {
					formCart.find('.load-price-' + code).html(result.regularPrice);
					formCart.find('.load-price-new-' + code).html(result.salePrice);
					formCart.find('.load-price-temp').html(result.tempText);
					formCart.find('.load-price-total').html(result.totalText);
				}
				holdonClose();
			}
		});
	}
}

function deleteCart(obj) {
	var formCart = $('.form-cart');
	var code = obj.data('code');
	var ward = formCart.find('.select-ward-cart').val();

	$.ajax({
		type: 'POST',
		url: 'api/cart.php',
		dataType: 'json',
		data: {
			cmd: 'delete-cart',
			code: code,
			ward: ward
		},
		beforeSend: function () {
			holdonOpen();
		},
		success: function (result) {
			$('.count-cart').html(result.max);
			if (result.max) {
				formCart.find('.load-price-temp').html(result.tempText);
				formCart.find('.load-price-total').html(result.totalText);
				formCart.find('.procart-' + code).remove();
			} else {
				$('.wrap-cart').html(
					'<a href="" class="empty-cart text-decoration-none d-block"><i class="fa-duotone fa-cart-xmark"></i><p>' +
						LANG['no_products_in_cart'] +
						'</p><span class="btn btn-main">' +
						LANG['back_to_home'] +
						'</span></a>'
				);
			}
			holdonClose();
		}
	});
}

function loadDistrict(id = 0) {
	holdonOpen();
	fetch(CONFIG_BASE+`assets/jsons/district-`+id+`.json`,{headers: {"Content-Type": "application/json"}}).then(response => {
		return response.json();
	}).then(function(data) {
		$('.select-district').html(`<option value="">Quận/huyện</option>`);
		$('.select-ward').html('<option value="">' + LANG['ward'] + '</option>');
		$.each(data, function(index, val) {
			$('.select-district').append(`<option value="`+val.id+`">`+val.name+`</option>`);
		});
		holdonClose()
	});
}

function loadWard(id = 0) {
	holdonOpen();
	fetch(CONFIG_BASE+`assets/jsons/wards-`+id+`.json`,{headers: {"Content-Type": "application/json"}}).then(response => {
		return response.json();
	}).then(function(data) {
		$('.select-ward').html(`<option value="">`+LANG['ward']+`</option>`);
		$.each(data, function(index, val) {
			$('.select-ward').append(`<option value="`+val.id+`">`+val.name+`</option>`);
		});
		holdonClose()
	});
}

function loadShip(id = 0) {
	if (SHIP_CART) {
		var formCart = $('.form-cart');

		$.ajax({
			type: 'POST',
			url: 'api/cart.php',
			dataType: 'json',
			data: {
				cmd: 'ship-cart',
				id: id
			},
			beforeSend: function () {
				holdonOpen();
			},
			success: function (result) {
				if (result) {
					formCart.find('.load-price-ship').html(result.shipText);
					formCart.find('.load-price-total').html(result.totalText);
				}
				holdonClose();
			}
		});
	}
}

function FirstLoadAPI(div, url, name_api) {
    $(div).addClass('active');
    var id = $(div).data('id');
    var tenkhongdau = $(div).data('tenkhongdau');
    FrameAjax(url, "POST", {
        id: id,
        tenkhongdau: tenkhongdau
    }, name_api);
}

function LoadAPI(div, url, name_api) {
    $(div).click(function(event) {
        $(div).removeClass('active');
        $(this).addClass('active');
        var id = $(this).data('id');
        var tenkhongdau = $(this).data('tenkhongdau');
        FrameAjax(url, "POST", {
            id: id,
            tenkhongdau: tenkhongdau
        }, name_api);
    });
}

function FrameAjax(url, type, data, name) {
    $.ajax({
        url: url,
        type: type,
        data: data,
        success: function(data) {
            $(name).html(data);
            MM_FRAMEWORK.Lazys();
        }
    });
}
