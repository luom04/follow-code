/* Validation form */
validateForm("validation-newsletter");
validateForm("validation-contact");
validateForm("validation-advisory");
validateForm("validation-cart");
/* Lazys */
MM_FRAMEWORK.Lazys = function () {
  if (isExist($(".lazy"))) {
    var lazyLoadInstance = new LazyLoad({
      elements_selector: ".lazy",
    });
  }
};

/* Load name input file */
MM_FRAMEWORK.loadNameInputFile = function () {
  if (isExist($(".custom-file input[type=file]"))) {
    $("body").on("change", ".custom-file input[type=file]", function () {
      var fileName = $(this).val();
      fileName = fileName.substr(
        fileName.lastIndexOf("\\") + 1,
        fileName.length,
      );
      $(this).siblings("label").html(fileName);
    });
  }
};

/* Back to top */
MM_FRAMEWORK.GoTop = function () {
  $(window).scroll(function () {
    if (!$(".scrollToTop").length)
      $("body").append(
        '<div class="scrollToTop"><img src="' +
          GOTOP +
          '" alt="Go Top"/></div>',
      );
    if ($(this).scrollTop() > 100) $(".scrollToTop").fadeIn();
    else $(".scrollToTop").fadeOut();
  });

  $("body").on("click", ".scrollToTop", function () {
    $("html, body").animate({ scrollTop: 0 }, 800);
    return false;
  });
};

/* Alt images */
MM_FRAMEWORK.AltImg = function () {
  $("img").each(function (index, element) {
    if (!$(this).attr("alt") || $(this).attr("alt") == "") {
      $(this).attr("alt", WEBSITE_NAME);
    }
  });
};

/* Menu */
MM_FRAMEWORK.Menu = function () {
  /* Menu remove empty ul */
  if (isExist($(".menu"))) {
    $(".menu ul li a").each(function () {
      $this = $(this);

      if (!isExist($this.next("ul").find("li"))) {
        $this.next("ul").remove();
        $this.removeClass("has-child");
      }
    });

    var currentActive = $(".menu .menu-main > li > a.active");
    $(".menu .menu-main > li.has-backdrop").hover(
      function () {
        currentActive.removeClass("active");
        $(".menu-backdrop").addClass("active");
      },
      function () {
        $(".menu-backdrop").removeClass("active");
        currentActive.addClass("active");
      },
    );
  }

  /* Mmenu */
  if (isExist($("nav#menu"))) {
    $("nav#menu").mmenu({
      extensions: ["border-full", "position-left", "position-front"],
    });
  }

  $(".header-ul .submenu li.more a").on("click", function () {
    $(this).parent().prev().toggleClass("d-none");
    var currentText = $(this).text();
    if (currentText === "Xem thêm") {
      $(this).text("Thu gọn");
    } else {
      $(this).text("Xem thêm");
    }
  });

  if (isExist($(".menu-wrapper"))) {
    // Hiển thị menu + backdrop khi hover vào nút Danh mục
    $(".menu-wrapper")
      .not(".mobile")
      .on("mouseenter", function () {
        $(".menu-dropdown").stop(true, true).fadeIn(150);
        $(".menu-backdrop").addClass("active");
      });

    // Ẩn khi rời khỏi menu
    $(".menu-wrapper")
      .not(".mobile")
      .on("mouseleave", function () {
        $(".menu-dropdown").stop(true, true).fadeOut(150);
        $(".menu-backdrop").removeClass("active");
      });

    // Đổi panel khi hover item
    $(".menu-left li").on("mouseenter click", function () {
      $(".menu-left li").removeClass("active");
      $(".menu-panel").removeClass("active");

      $(this).addClass("active");
      $("#" + $(this).data("target")).addClass("active");
    });

    // Click backdrop để đóng
    $(".menu-backdrop").on("click", function () {
      $(".menu-dropdown").fadeOut(150);
      $(this).removeClass("active");
    });
  }
  if (isExist($(".menu-toggle"))) {
    // Toggle menu khi bấm nút (mobile)
    $(".menu-toggle.mobile").on("click", function () {
      $(".menu-dropdown").toggleClass("open");
      $(".menu-backdrop").toggleClass("show");
      $("body").toggleClass("no-scroll");
    });

    // Click backdrop để đóng
    $(".menu-backdrop, .btn-close-menu").on("click", function () {
      $(".menu-dropdown").removeClass("open");
      $("body").removeClass("no-scroll");
      $(this).removeClass("show");
    });
  }
};

/* Tools */
MM_FRAMEWORK.Tools = function () {
  if (isExist($(".toolbar"))) {
    $(".footer").css({ marginBottom: $(".toolbar").innerHeight() });
  }
};

/* Popup */
MM_FRAMEWORK.Popup = function () {
  if (isExist($("#popup"))) {
    $("#popup").modal("show");
  }
};

/* Pagings */
MM_FRAMEWORK.Pagings = function () {
  /* Products */
  if (isExist($(".paging-product"))) {
    loadPaging("api/product.php?perpage=4", ".paging-product");
  }

  /* Categories */
  if (isExist($(".paging-product-category"))) {
    $(".paging-product-category").each(function () {
      var list = $(this).data("list");
      loadPaging(
        "api/product.php?perpage=4&idList=" + list,
        ".paging-product-category-" + list,
      );
    });
  }

  if (isExist($(".choose-list"))) {
    $(".choose-list button.choosed").each(function () {
      var list = $(this).data("list");
      var cat = $(this).data("cat");
      var isPage = $(this).data("paging");
      var perpage = $(this).data("perpage");
      var ajaxFile = $(this).data("ajax");
      var ajaxKey = $(this).data("ajax-key");
      var status = $(this).data("status");
      var show = $(this).data("show");
      loadPaging(
        "api/" +
          ajaxFile +
          ".php?perpage=" +
          perpage +
          "&isPage=" +
          isPage +
          "&idList=" +
          list +
          "&idCat=" +
          cat +
          "&status=" +
          status +
          "&show=" +
          show,
        ".show-padding-" + ajaxFile + ajaxKey,
        function () {
          if (show == "owl")
            MM_FRAMEWORK.OwlData($(".owl-" + ajaxFile + ajaxKey));
        },
      );
    });

    $(".choose-list button").click(function () {
      // ($(this).parents('.choose-list').find("button").hasClass('choosed')) ? $(this).parents('.choose-list').find("button").removeClass('choosed'):'';
      // $(this).addClass('choosed');
      $(this).closest(".title-sanpham").find("button").removeClass("choosed");
      $(this).addClass("choosed");
      var list = $(this).attr("data-list") || 0;
      var cat = $(this).attr("data-cat") || 0;
      var isPage = $(this).attr("data-paging");
      var perpage = $(this).attr("data-perpage");
      var ajaxFile = $(this).attr("data-ajax");
      var ajaxKey = $(this).data("ajax-key");
      var status = $(this).attr("data-status");
      var show = $(this).attr("data-show");

      var url =
        "api/" +
        ajaxFile +
        ".php" +
        "?perpage=" +
        perpage +
        "&isPage=" +
        isPage +
        "&idList=" +
        list +
        "&idCat=" +
        cat +
        "&status=" +
        status +
        "&show=" +
        show;

      console.log("URL gửi:", url);
      loadPaging(
        "api/" +
          ajaxFile +
          ".php?perpage=" +
          perpage +
          "&isPage=" +
          isPage +
          "&idList=" +
          list +
          "&idCat=" +
          cat +
          "&status=" +
          status +
          "&show=" +
          show,
        ".show-padding-" + ajaxFile + ajaxKey,
        function () {
          if (show == "owl")
            MM_FRAMEWORK.OwlData($(".owl-" + ajaxFile + ajaxKey));
        },
      );
      return false;
    });
  }
};
if (isExist($(".blog-r ul"))) {
  $(".blog-r ul").simplyScroll({
    customClass: "vert",
    orientation: "vertical",
    // orientation: 'horizontal',
    auto: true,
    manualMode: "auto",
    pauseOnHover: 1,
    speed: 1,
    loop: 0,
  });
}
/* Ticker scroll 
MM_FRAMEWORK.TickerScroll = function () {
	if (isExist($('.news-scroll'))) {
		$('.news-scroll')
			.easyTicker({
				direction: 'up',
				easing: 'swing',
				speed: 'slow',
				interval: 3500,
				height: 'auto',
				visible: 3,
				mousePause: true,
				controls: {
					up: '.news-control#up',
					down: '.news-control#down'
					// toggle: '.toggle',
					// stopText: 'Stop'
				},
				callbacks: {
					before: function (ul, li) {
						// $(li).css('color', 'red');
					},
					after: function (ul, li) {}
				}
			})
			.data('easyTicker');
	}
};
*/

/* Photobox */
MM_FRAMEWORK.Photobox = function () {
  if (isExist($(".album-gallery"))) {
    $(".album-gallery").photobox("a", { thumbs: true, loop: false });
  }
};

/* Comment */
MM_FRAMEWORK.Comment = function () {
  if (isExist($(".comment-page"))) {
    $(".comment-page").comments({
      url: "api/comment.php",
    });
  }
};

/* DatePicker */
MM_FRAMEWORK.DatePicker = function () {
  if (isExist($("#birthday"))) {
    $("#birthday").datetimepicker({
      timepicker: false,
      format: "d/m/Y",
      formatDate: "d/m/Y",
      minDate: "01/01/1950",
      maxDate: TIMENOW,
    });
  }
};

/* Search */
MM_FRAMEWORK.Search = function () {
  if (isExist($(".icon-search"))) {
    $(".icon-search").click(function () {
      if ($(this).hasClass("active")) {
        $(this).removeClass("active");
        $(".search-grid")
          .stop(true, true)
          .animate({ opacity: "0", width: "0px" }, 200);
      } else {
        $(this).addClass("active");
        $(".search-grid")
          .stop(true, true)
          .animate({ opacity: "1", width: "230px" }, 200);
      }
      document.getElementById($(this).next().find("input").attr("id")).focus();
      $(".icon-search i").toggleClass("bi bi-x-lg");
    });
  }

  // if(isExist($('.search-wrapper'))) {
  // 	const search = document.querySelector(".search-wrapper");
  // 	const input = search.querySelector("input");
  // 	const btnSearch = search.querySelector(".btn-search");

  // 	btnSearch.addEventListener("click", () => {
  // 		if (!input.value.trim()) {
  // 			search.classList.add("active");
  // 			input.focus();
  // 		} else {
  // 			onSearch('keyword');
  // 		}
  // 	});

  // 	search.addEventListener("mouseenter", () => {
  // 		if (!input.matches(":focus")) {
  // 			search.classList.add("active");
  // 		}
  // 	});

  // 	search.addEventListener("mouseleave", () => {
  // 		if (!input.matches(":focus") && !input.value.trim()) {
  // 			search.classList.remove("active");
  // 		}
  // 	});
  // }
};

/* Videos */
MM_FRAMEWORK.Videos = function () {
  Fancybox.bind("[data-fancybox]", {});

  $(".btn-play").on("click", function (e) {
    e.preventDefault();
    var videoId = $(this).attr("data-videoid");
    var platform = $(this).attr("data-platform");
    if (platform == "youtube") {
      Fancybox.show([
        {
          src: "https://www.youtube.com/embed/" + videoId,
          type: "iframe",
          preload: false,
        },
      ]);
    }
    if (platform == "tiktok") {
      Fancybox.show(
        [
          {
            src: "https://www.tiktok.com/embed/v2/" + videoId,
            type: "iframe",
            // Cài đặt để iframe vừa khít
            preload: false,
            css: {
              width: "325px",
              height: "700px",
            },
            // Tùy chỉnh container
            dragToClose: false,
            closeButton: "top",
            padding: 0,
          },
        ],
        {
          // Tùy chọn chung
          showClass: "fancybox-tiktok-layout",
        },
      );
    }
  });
};

/* Owl Data */
MM_FRAMEWORK.OwlData = function (obj) {
  if (!isExist(obj)) return false;
  var items = obj.attr("data-items");
  var center = Number(obj.attr("data-center")) ? true : false;
  var rewind = Number(obj.attr("data-rewind")) ? true : false;
  var autoWidth = Number(obj.attr("data-autowidth")) ? true : false;
  var autoplay = Number(obj.attr("data-autoplay")) ? true : false;
  var loop = Number(obj.attr("data-loop")) ? true : false;
  var lazyLoad = Number(obj.attr("data-lazyload")) ? true : false;
  var mouseDrag = Number(obj.attr("data-mousedrag")) ? true : false;
  var touchDrag = Number(obj.attr("data-touchdrag")) ? true : false;
  var animations = obj.attr("data-animations") || false;
  var smartSpeed = Number(obj.attr("data-smartspeed")) || 800;
  var autoplaySpeed = Number(obj.attr("data-autoplayspeed")) || 800;
  var autoplayTimeout = Number(obj.attr("data-autoplaytimeout")) || 5000;
  var dots = Number(obj.attr("data-dots")) ? true : false;
  var responsive = {};
  var responsiveClass = true;
  var responsiveRefreshRate = 200;
  var nav = Number(obj.attr("data-nav")) ? true : false;
  var navContainer = obj.attr("data-navcontainer") || false;
  var navTextTemp =
    "<svg xmlns='http://www.w3.org/2000/svg' class='icon icon-tabler icon-tabler-chevron-left' width='44' height='45' viewBox='0 0 24 24' stroke-width='1.5' stroke='#2c3e50' fill='none' stroke-linecap='round' stroke-linejoin='round'><path stroke='none' d='M0 0h24v24H0z' fill='none'/><polyline points='15 6 9 12 15 18' /></svg>|<svg xmlns='http://www.w3.org/2000/svg' class='icon icon-tabler icon-tabler-chevron-right' width='44' height='45' viewBox='0 0 24 24' stroke-width='1.5' stroke='#2c3e50' fill='none' stroke-linecap='round' stroke-linejoin='round'><path stroke='none' d='M0 0h24v24H0z' fill='none'/><polyline points='9 6 15 12 9 18' /></svg>";
  var navText = obj.attr("data-navtext");
  navText =
    nav &&
    navContainer &&
    (((navText === undefined || Number(navText)) && navTextTemp) ||
      (isNaN(Number(navText)) && navText) ||
      (Number(navText) === 0 && false));

  if (items) {
    items = items.split(",");

    if (items.length) {
      var itemsCount = items.length;

      for (var i = 0; i < itemsCount; i++) {
        var options = items[i].split("|"),
          optionsCount = options.length,
          responsiveKey;

        for (var j = 0; j < optionsCount; j++) {
          const attr = options[j].indexOf(":")
            ? options[j].split(":")
            : options[j];

          if (attr[0] === "screen") {
            responsiveKey = Number(attr[1]);
          } else if (Number(responsiveKey) >= 0) {
            responsive[responsiveKey] = {
              ...responsive[responsiveKey],
              [attr[0]]: (isNumeric(attr[1]) && Number(attr[1])) ?? attr[1],
            };
          }
        }
      }
    }
  }

  if (nav && navText) {
    navText =
      navText.indexOf("|") > 0 ? navText.split("|") : navText.split(":");
    navText = [navText[0], navText[1]];
  }

  obj.owlCarousel({
    center,
    rewind,
    autoplay,
    autoWidth,
    loop,
    lazyLoad,
    mouseDrag,
    touchDrag,
    smartSpeed,
    autoplaySpeed,
    autoplayTimeout,
    dots,
    nav,
    navText,
    navContainer: nav && navText && navContainer,
    responsiveClass,
    responsiveRefreshRate,
    responsive,
  });

  if (autoplay) {
    obj.on("translate.owl.carousel", function (event) {
      obj.trigger("stop.owl.autoplay");
    });

    obj.on("translated.owl.carousel", function (event) {
      obj.trigger("play.owl.autoplay", [autoplayTimeout]);
    });
  }

  if (animations && isExist(obj.find("[owl-item-animation]"))) {
    var animation_now = "";
    var animation_count = 0;
    var animations_excuted = [];
    var animations_list = animations.indexOf(",")
      ? animations.split(",")
      : animations;

    obj.on("changed.owl.carousel", function (event) {
      $(this)
        .find(".owl-item.active")
        .find("[owl-item-animation]")
        .removeClass(animation_now);
    });

    obj.on("translate.owl.carousel", function (event) {
      var item = event.item.index;

      if (Array.isArray(animations_list)) {
        var animation_trim = animations_list[animation_count].trim();

        if (!animations_excuted.includes(animation_trim)) {
          animation_now = "animate__animated " + animation_trim;
          animations_excuted.push(animation_trim);
          animation_count++;
        }

        if (animations_excuted.length == animations_list.length) {
          animation_count = 0;
          animations_excuted = [];
        }
      } else {
        animation_now = "animate__animated " + animations_list.trim();
      }
      $(this)
        .find(".owl-item")
        .eq(item)
        .find("[owl-item-animation]")
        .addClass(animation_now);
    });
  }
};

/* Owl Page */
MM_FRAMEWORK.OwlPage = function () {
  if (isExist($(".owl-page"))) {
    $(".owl-page").each(function () {
      MM_FRAMEWORK.OwlData($(this));
    });
  }
};

/* Dom Change */
MM_FRAMEWORK.DomChange = function () {
  /* Video Fotorama */
  $("#video-fotorama").one("DOMSubtreeModified", function () {
    $("#fotorama-videos").fotorama();
  });

  /* Video Select */
  $("#video-select").one("DOMSubtreeModified", function () {
    $(".listvideos").change(function () {
      var id = $(this).val();
      $.ajax({
        url: "api/video.php",
        type: "POST",
        dataType: "html",
        data: {
          id: id,
        },
        beforeSend: function () {
          holdonOpen();
        },
        success: function (result) {
          $(".video-main").html(result);
          holdonClose();
        },
      });
    });
  });

  /* Chat Facebook */
  const targetNode = document.getElementById("messages-facebook");
  if (targetNode) {
    const observer = new MutationObserver(() => {
      observer.disconnect();
      ($(".js-facebook-messenger-box").on("click", function () {
        ($(
          ".js-facebook-messenger-box, .js-facebook-messenger-container",
        ).toggleClass("open"),
          $(".js-facebook-messenger-tooltip").length &&
            $(".js-facebook-messenger-tooltip").toggle());
      }),
        $(".js-facebook-messenger-box").hasClass("cfm") &&
          setTimeout(function () {
            $(".js-facebook-messenger-box").addClass("rubberBand animated");
          }, 3500),
        $(".js-facebook-messenger-tooltip").length &&
          ($(".js-facebook-messenger-tooltip").hasClass("fixed")
            ? $(".js-facebook-messenger-tooltip").show()
            : $(".js-facebook-messenger-box").on("hover", function () {
                $(".js-facebook-messenger-tooltip").show();
              }),
          $(".js-facebook-messenger-close-tooltip").on("click", function () {
            $(".js-facebook-messenger-tooltip").addClass("closed");
          })));
      $(".search_open").click(function () {
        $(".search_box_hide").toggleClass("opening");
      });
    });
    observer.observe(targetNode, { childList: true, subtree: true });
  }
};

/* Quick View */
MM_FRAMEWORK.QuickView = function (obj) {
  $("body").on("click", ".product-quick-view", function () {
    var slug = $(this).attr("data-slug");

    if (slug) {
      $.ajax({
        type: "POST",
        url: slug + "?quickview=1",
        dataType: "html",
        beforeSend: function () {
          holdonOpen();
        },
        success: function (result) {
          holdonClose();
          $("#popup-quickview").find(".modal-body").html(result);
          $("#popup-quickview").modal("show");
          // MagicZoom.refresh("Zoom-quickview");
          // MM_FRAMEWORK.OwlData($('.owl-pro-detail'));
          MagicZoom.refresh("Zoom-1");
          MM_FRAMEWORK.OwlData($(".owl-pro-detail"));
          MM_FRAMEWORK.Lazys();
        },
      });
    }
  });

  $("body").on("click", ".goikham-quick-view", function () {
    var slug = $(this).attr("data-slug");

    if (slug) {
      $.ajax({
        type: "POST",
        url: slug + "?quickview=1",
        dataType: "html",
        beforeSend: function () {
          holdonOpen();
        },
        success: function (result) {
          holdonClose();
          $("#goikham-quickview").find(".modal-body").html(result);
          $("#goikham-quickview").modal("show");
          validateForm("validation-appointment-3");
        },
      });
    }
  });
};

/* Cart */
MM_FRAMEWORK.Cart = function () {
  function updateUrlBySelectedParams() {
    const url = new URL(window.location.href);

    $(".product-attr").each(function () {
      const $checked = $(this).find('input[type="radio"]:checked');
      if (!$checked.length) return;

      const param = $checked.data("param"); // vd: mau / kich-thuoc / tinh-nang ...
      if (!param) return;

      // ưu tiên slug, nếu không có thì dùng key
      const v = String($checked.data("slug") ?? $checked.data("key") ?? "");
      if (!v) return;

      url.searchParams.set(param, v);
    });

    history.replaceState({}, "", url.toString());
  }

  function applySelectedParamsFromUrl() {
    const url = new URL(window.location.href);

    $(".product-attr").each(function () {
      const $first = $(this).find('input[type="radio"]').first();
      if (!$first.length) return;

      const param = $first.data("param");
      if (!param) return;

      const v = url.searchParams.get(param);
      if (!v) return;

      // thử match slug trước
      let $match = $(this).find('input[type="radio"][data-slug="' + v + '"]');

      // nếu không có slug thì match theo key
      if (!$match.length) {
        $match = $(this).find('input[type="radio"][data-key="' + v + '"]');
      }

      if ($match.length) $match.prop("checked", true);
    });
  }

  if (isExist($(".wrap-pro-detail"))) {
    // function loadVariantInfo(variant, comboKey) {
    // 	$.ajax({
    // 		url: '/ajax/-getvariant.php',
    // 		type: 'POST',
    // 		data: { key: comboKey },
    // 		dataType: 'json',
    // 		success: function(res) {
    // 			$('#product-sku').text(res.sku);
    // 			$('#product-price').text(res.price_text);
    // 			$('#product-stock').text(res.stock);
    // 			if (res.image) {
    // 				$('#product-image').attr('src', res.image);
    // 			}
    // 		}
    // 	});
    // }

    let DEFAULT_INFO = {
      name: $("#product-title").text(),
      sku: $("#product-sku").text(),
      price: $("#product-price").text(),
      discount: $("#product-discount-price").text(),
      percent: $("#product-percent-discount").text(),
    };

    function formatCurrency(value) {
      let num = Number(value) || 0;
      return num.toLocaleString("vi-VN") + "₫";
    }

    function loadVariantInfo(variant, comboKey) {
      if (variant.sku != "") {
        $("#product-sku").text(variant.sku || DEFAULT_INFO.sku);
      }

      if (variant.comboName != "") {
        $("#product-title").text(variant.comboName || DEFAULT_INFO.name);
      }
      if (Number(variant.price) == 0) {
        return;
      }

      // Giá giảm
      if (Number(variant.discount) > 0) {
        $("#product-discount-price").text(formatCurrency(variant.discount));
        $("#product-price")
          .text(formatCurrency(variant.price))
          .removeClass("d-none");
        $("#product-percent-discount")
          .text("-" + (variant.percent || 0) + "%")
          .removeClass("d-none");
      } else {
        $("#product-discount-price").text(formatCurrency(variant.price));
        $("#product-price").addClass("d-none");
        $("#product-percent-discount").addClass("d-none");
      }
    }

    function updateOptionsAvailability() {
      // Lấy attributes đang chọn
      let selected = {};
      $(".product-attr").each(function () {
        let $checked = $(this).find('input[type="radio"]:checked');
        if ($checked.length) {
          let attrId = $checked.attr("name");
          let key = $checked.data("key");
          selected[attrId] = key;
        }
      });

      // Kiểm tra từng option
      $(".product-attr").each(function () {
        let $attr = $(this);
        let attrId = $attr.find('input[type="radio"]').attr("name");

        $attr.find('input[type="radio"]').each(function () {
          let $input = $(this);
          let thisKey = $input.data("key");

          // Giả định tổ hợp nếu chọn option này
          let comboKeys = [];
          $(".product-attr").each(function () {
            let aId = $(this).find('input[type="radio"]').attr("name");
            if (aId === attrId) {
              comboKeys.push(thisKey); // option đang xét
            } else if (selected[aId]) {
              comboKeys.push(selected[aId]);
            }
          });

          // Nếu chưa chọn đủ thì luôn enable
          if (comboKeys.length < $(".product-attr").length) {
            $input
              .prop("disabled", false)
              .closest("label")
              .removeClass("disabled");
            return;
          }

          // Build comboKey theo thứ tự attributes
          let comboKey = comboKeys.join("|");
          if (VARIANT_DATA[comboKey]) {
            $input
              .prop("disabled", false)
              .closest("label")
              .removeClass("disabled");
          } else {
            $input
              .prop("disabled", true)
              .prop("checked", false)
              .closest("label")
              .addClass("disabled");
          }
        });

        // Nếu attribute này không còn radio nào được chọn → auto chọn cái khả dụng đầu tiên
        if ($attr.find('input[type="radio"]:checked').length === 0) {
          let $firstEnable = $attr.find('input[type="radio"]:enabled').first();
          if ($firstEnable.length) {
            $firstEnable.prop("checked", true).trigger("change");
          }
        }
      });

      // Sau khi cập nhật, thử build comboKey đầy đủ
      let keys = [];
      $(".product-attr").each(function () {
        let $checked = $(this).find('input[type="radio"]:checked');
        if ($checked.length) {
          keys.push($checked.data("key"));
        }
      });

      if (keys.length === $(".product-attr").length) {
        let comboKey = keys.join("|");
        if (VARIANT_DATA[comboKey]) {
          let variant = VARIANT_DATA[comboKey];
          loadVariantInfo(variant, comboKey);
        }
      }
    }

    // Gọi khi chọn option
    $(document).on("change", '.product-attr input[type="radio"]', function () {
      updateOptionsAvailability();
      updateUrlBySelectedParams();
    });
    // ✅ ưu tiên variant theo URL (nếu có)
    applySelectedParamsFromUrl();

    // nếu URL không có variant thì vẫn update như bình thường
    updateOptionsAvailability();

    window.addEventListener("popstate", function () {
      applySelectedParamsFromUrl();
      updateOptionsAvailability();
    });
  }

  /* Add */
  if (isExist($(".select-city-cart"))) {
    fetch(CONFIG_BASE + "assets/jsons/city-group.json", {
      headers: { "Content-Type": "application/json" },
    })
      .then((response) => {
        return response.json();
      })
      .then(function (data) {
        $.each(data.citysCentral, function (index, val) {
          $(".select-city-cart").append(
            `<option value="` + val.id + `">` + val.name + `</option>`,
          );
        });
      });
  }
  $("body").on("click", ".addcart", function () {
    $this = $(this);
    $parents = $this.parents(".right-pro-detail");
    var id = $this.data("id");
    var action = $this.data("action");
    var quantity = $parents.find(".quantity-pro-detail").find(".qty-pro").val();
    quantity = quantity ? quantity : 1;

    // Lấy các option_key đã chọn
    let keys = [];
    $(".product-attr").each(function () {
      let $checked = $(this).find('input[type="radio"]:checked');
      if ($checked.length) {
        keys.push($checked.data("key"));
      }
    });

    // Nếu chưa chọn đủ option thì báo lỗi
    if (keys.length < $(".product-attr").length) {
      alert("Vui lòng chọn đầy đủ thuộc tính sản phẩm");
      return;
    }

    let comboKey = keys.join("|");

    // Kiểm tra variant trong VARIANT_DATA
    // if (!VARIANT_DATA[comboKey]) {
    // 	alert("Tổ hợp không hợp lệ hoặc hết hàng");
    // 	return;
    // }

    let variant = VARIANT_DATA[comboKey] || [];
    if (variant) {
      variant["key"] = comboKey;
    }

    if (id) {
      $.ajax({
        url: "api/cart.php",
        type: "POST",
        dataType: "json",
        async: false,
        data: {
          cmd: "add-cart",
          id,
          quantity,
          variant,
        },
        beforeSend: function () {
          holdonOpen();
        },
        success: function (result) {
          if (action == "addnow") {
            $(".count-cart").html(result.max);
            $.ajax({
              url: "api/cart.php",
              type: "POST",
              dataType: "html",
              async: false,
              data: {
                cmd: "popup-cart",
              },
              success: function (result) {
                $("#popup-cart .modal-body").html(result);
                $("#popup-cart").modal("show");
                MM_FRAMEWORK.Lazys();
                holdonClose();
              },
            });
          } else if (action == "buynow") {
            window.location = CONFIG_BASE + "gio-hang";
          }
        },
      });
    }
  });

  /* Delete */
  $("body").on("click", ".del-procart", function () {
    confirmDialog("delete-procart", LANG["delete_product_from_cart"], $(this));
  });

  /* Counter */
  $("body").on("click", ".counter-procart", function () {
    var $button = $(this);
    var quantity = 1;
    var input = $button.parent().find("input");
    var id = input.data("pid");
    var code = input.data("code");
    var oldValue = $button.parent().find("input").val();
    if ($button.text() == "+") quantity = parseFloat(oldValue) + 1;
    else if (oldValue > 1) quantity = parseFloat(oldValue) - 1;
    $button.parent().find("input").val(quantity);
    updateCart(id, code, quantity);
  });

  /* Quantity */
  $("body").on("change", "input.quantity-procart", function () {
    var quantity = $(this).val() < 1 ? 1 : $(this).val();
    $(this).val(quantity);
    var id = $(this).data("pid");
    var code = $(this).data("code");
    updateCart(id, code, quantity);
  });

  /* City */
  if (isExist($(".select-city-cart"))) {
    $(".select-city-cart").change(function () {
      var id = $(this).val();
      if (id) {
        loadWard(id);
        loadShip();
      } else {
        $(".select-ward").html(
          `<option value="">` + LANG["ward"] + `</option>`,
        );
      }
    });
  }

  /* Ward */
  if (isExist($(".select-ward-cart"))) {
    $(".select-ward-cart").change(function () {
      var id = $(this).val();
      loadShip(id);
    });
  }

  /* Payments */
  if (isExist($(".payments-label"))) {
    $(".payments-label").click(function () {
      var payments = $(this).data("payments");
      $(".payments-cart .payments-label, .payments-info").removeClass("active");
      $(this).addClass("active");
      $(".payments-info-" + payments).addClass("active");
    });
  }

  /* Quantity detail page */
  if (isExist($(".quantity-pro-detail span"))) {
    $(".quantity-pro-detail span").click(function () {
      var $button = $(this);
      var oldValue = $button.parent().find("input").val();
      if ($button.text() == "+") {
        var newVal = parseFloat(oldValue) + 1;
      } else {
        if (oldValue > 1) var newVal = parseFloat(oldValue) - 1;
        else var newVal = 1;
      }
      $button.parent().find("input").val(newVal);
    });
  }
};

MM_FRAMEWORK.SlickProduct = function () {
  if (isExist($(".slider-products"))) {
    if ($(".slider-products").hasClass("slick-initialized")) {
      $(".slider-products").slick("unslick");
    }
    if ($(".slider-product-thumbs").hasClass("slick-initialized")) {
      $(".slider-product-thumbs").slick("unslick");
    }

    $(".slider-products").on("init", function () {
      $(this).removeClass("slick-init-hidden");
    });

    $(".slider-product-thumbs").on("init", function () {
      $(this).removeClass("slick-init-hidden");
    });

    $(".slider-products").slick({
      infinite: false,
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: true,
      draggable: true,
      asNavFor: ".slider-product-thumbs",
      prevArrow:
        '<button type="button" class="slick-prev"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-left" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M9.224 1.553a.5.5 0 0 1 .223.67L6.56 8l2.888 5.776a.5.5 0 1 1-.894.448l-3-6a.5.5 0 0 1 0-.448l3-6a.5.5 0 0 1 .67-.223"/></svg></button>',
      nextArrow:
        '<button type="button" class="slick-next"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671"/></svg></button>',
    });
    $(".slider-product-thumbs").slick({
      infinite: false,
      slidesToShow: $(".product-video").length ? 4 : 5,
      slidesToScroll: 1,
      asNavFor: ".slider-products",
      dots: false,
      arrows: false,
      centerMode: false,
      focusOnSelect: true,
      vertical: false,
      responsive: [
        {
          breakpoint: 576,
          settings: {
            slidesToShow: 4,
            vertical: false,
          },
        },
        {
          breakpoint: 460,
          settings: {
            slidesToShow: 4,
            vertical: false,
          },
        },
      ],
    });
  }

  if (isExist($(".slider-index"))) {
    $(".slider-index").slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      draggable: false,
      asNavFor: ".slider-index-thumbs",
    });
    $(".slider-index-thumbs").slick({
      infinite: false,
      slidesToShow: 3,
      slidesToScroll: 1,
      asNavFor: ".slider-index",
      dots: false,
      arrows: false,
      centerMode: false,
      focusOnSelect: true,
      vertical: true,
      responsive: [
        {
          breakpoint: 575,
          settings: {
            vertical: false,
            slidesToShow: 3,
            slidesToScroll: 1,
          },
        },
      ],
    });
  }

  if (isExist($(".slider-news"))) {
    $(".slider-news").slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      draggable: false,
      asNavFor: ".slider-news-thumbs",
    });
    $(".slider-news-thumbs").slick({
      infinite: false,
      slidesToShow: 4,
      slidesToScroll: 1,
      asNavFor: ".slider-news",
      dots: false,
      arrows: false,
      centerMode: false,
      focusOnSelect: true,
      vertical: true,
      responsive: [
        {
          breakpoint: 575,
          settings: {
            vertical: false,
            slidesToShow: 3,
            slidesToScroll: 1,
          },
        },
      ],
    });
  }
  if (isExist($(".slick-test"))) {
    $(".slick-test").slick({
      draggable: true, // Cho phép kéo chuột
      swipe: true, // Cho phép vuốt trên thiết bị di động
      touchMove: true, // Kích hoạt cảm ứng
      vertical: false, // Chay dọc
      slidesToShow: 4, // Số item hiển thị
      slidesToScroll: 1, // Số item cuộn khi chạy
      autoplay: true, // Tự động chạy
      autoplaySpeed: 3000, // Tốc độ chạy
      speed: 1000, // Tốc độ chuyển slider
      arrows: false, // Hiển thị mũi tên
      dots: false, // Hiển thị dấu chấm
      swipeToSlide: true, // Vuốt tự do, không bị ràng buộc số lượng slide cuộn
      responsive: [
        {
          breakpoint: 992,
          settings: {
            slidesToShow: 4,
            slidesToScroll: 1,
          },
        },
        {
          breakpoint: 768,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 1,
          },
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1,
          },
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1,
          },
        },
      ],
    });
    $(".service-next").on("click", function () {
      $(".slick-service").slick("slickNext");
    });
    $(".service-prev").on("click", function () {
      $(".slick-service").slick("slickPrev");
    });
  }
};

/* Slick */
MM_FRAMEWORK.SlickPage = function () {
  if (isExist($(".slider-video"))) {
    $(".slider-video").slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      fade: true,
      asNavFor: ".slider-video-thumb",
    });
    $(".slider-video-thumb").slick({
      slidesToShow: 4,
      slidesToScroll: 1,
      asNavFor: ".slider-video",
      arrows: false,
      dots: false,
      centerMode: false,
      focusOnSelect: true,
    });
  }

  if (isExist($(".slick-news"))) {
    $(".slick-news").slick({
      dots: false,
      infinite: true,
      autoplaySpeed: 3000,
      slidesToShow: 3,
      slidesToScroll: 1,
      adaptiveHeight: true,
      vertical: true,
      autoplay: true,
      infinite: true,
      arrows: false,
    });
  }

  if (isExist($(".slide-text"))) {
    $(".slide-text").slick({
      dots: false,
      infinite: true,
      autoplaySpeed: 3000,
      slidesToShow: 1,
      slidesToScroll: 1,
      adaptiveHeight: true,
      autoplay: true,
      arrows: true,
      fade: true,
    });
  }
  if (isExist($(".slick-v-3"))) {
    $(".slick-v-3").slick({
      dots: false,
      infinite: true,
      autoplaySpeed: 3000,
      slidesToShow: 3,
      slidesToScroll: 1,
      adaptiveHeight: true,
      vertical: true,
      autoplay: true,
      infinite: true,
      arrows: false,
    });
  }
  if (isExist($(".slider-for"))) {
    $(".slider-for").slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      infinite: true,
      asNavFor: ".slider-nav",
      adaptiveHeight: true,
    });
    $(".slider-nav").slick({
      infinite: true,
      slidesToShow: 7,
      slidesToScroll: 1,
      asNavFor: ".slider-for",
      dots: false,
      arrows: false,
      centerMode: true,
      focusOnSelect: true,
      vertical: false,
      responsive: [
        {
          breakpoint: 767,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 1,
            vertical: false,
          },
        },
        {
          breakpoint: 567,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1,
            vertical: false,
          },
        },
      ],
    });
  }
};

/* Aos */
MM_FRAMEWORK.AosAnimation = function () {
  AOS.init({});
};

/* TOC */
MM_FRAMEWORK.Toc = function () {
  if (isExist($(".toc-list"))) {
    $(".toc-list")
      .toc({
        content: "div#toc-content",
        headings: "h2,h3,h4",
      })
      .hide();

    $("body").on("click", ".toc-head", function () {
      $(this).parent().find(".toc-list").slideToggle();
    });

    if (!$(".toc-list li").length) {
      $(".meta-toc").hide();
    } else {
      $(".meta-toc .wrap-toc").clone().appendTo(".meta-toc-fixed");
    }

    $(".toc-list")
      .find("a")
      .click(function () {
        if (pseudoClick(this).before == true) {
          $(this).next().slideToggle();
        } else {
          var x = $(this).attr("data-rel");
          if (!$(".btn-view-full-content").hasClass("is-show"))
            $(".btn-view-full-content").trigger("click");
          goToByScroll(x);
        }
      });

    $("body").on("click", ".menu-dropdown-button", function () {
      $(".meta-toc-fixed .wrap-toc").slideToggle(200, function () {
        if ($(this).is(":hidden")) {
          $(".menu-dropdown-button").html(
            '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" x="0" y="0" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path d="M464.883 64.267H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.013-21.136-47.149-47.116-47.149zM47.134 64.267C21.145 64.267 0 85.411 0 111.4s21.145 47.133 47.134 47.133 47.133-21.144 47.133-47.133-21.144-47.133-47.133-47.133zM47.134 208.867C21.145 208.867 0 230.011 0 256s21.145 47.133 47.134 47.133S94.267 281.989 94.267 256s-21.144-47.133-47.133-47.133zM47.134 353.467C21.145 353.467 0 374.611 0 400.6s21.145 47.133 47.134 47.133 47.133-21.144 47.133-47.133-21.144-47.133-47.133-47.133zM464.883 208.867H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.013-21.136-47.149-47.116-47.149zM464.883 353.467H175.65c-25.98 0-47.117 21.137-47.117 47.149 0 25.98 21.137 47.117 47.117 47.117h289.232c25.98 0 47.117-21.137 47.117-47.117.001-26.012-21.136-47.149-47.116-47.149z" opacity="1" class=""></path></g></svg>',
          );
        } else {
          $(".menu-dropdown-button").html(
            '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16"><path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/></svg>',
          );
        }
        return false;
      });
    });

    $(document).scroll(function () {
      var y = $(this).scrollTop();
      if (y > $(".meta-toc").offset().top + $(".meta-toc").height()) {
        if ($(".toc-list li").length) $(".meta-toc-fixed").addClass("fixed");
      } else {
        $(".meta-toc-fixed").removeClass("fixed");
      }

      $("[id^=ftoc-heading]").each(function () {
        if (y >= $(this).offset().top) {
          var id = $(this).attr("id");
          $(".toc-list a").removeClass("active");
          $('.toc-list a[data-rel="#' + id + '"]').addClass("active");
        }
      });
    });
  }

  let btnTxt;
  $(".btn-view-full-content").click(function (event) {
    let _target = $($(this).attr("data-target"));
    let _hide_content = $(`.hide-content`);
    if (!$(this).hasClass("is-show")) {
      btnTxt = _hide_content.find(".blob-txt").html();
      (_hide_content
        .addClass("removeBlur")
        .find(".blob-txt")
        .text("Thu gọn")
        .append(
          `<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5"/></svg>`,
        ),
        _target.addClass("show-full-content"),
        $(this).addClass("is-show"));
    } else {
      (_hide_content.removeClass("removeBlur").find(".blob-txt").html(btnTxt),
        _target.removeClass("show-full-content"),
        $(this).removeClass("is-show"));
    }
  });
};

MM_FRAMEWORK.LoaderWrapper = function () {
  if (isExist($("#main-cube"))) {
    setTimeout(function () {
      $("#main-cube").fadeOut();
    }, 1500);
  }
};

MM_FRAMEWORK.Homes = function () {
  if (isExist($(".slbannerhh"))) {
    $(".slbannerhh").slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: true,
      dots: false,
      fade: true,
      autoplay: true,
      autoplaySpeed: 3000,
      speed: 1000,
    });
    $(".slbannerhh").addClass("active");
    var __selector = $(".slbannerhh");
    if (
      __selector.find(".item[data-slick-index=0]").find(".ssvideo").size() > 0
    ) {
      __selector.find(".item[data-slick-index=0]").find(".ssvideo")[0].play();
      __selector.slick("slickPause");
      change_slide(
        __selector.find(".item[data-slick-index=0]").find(".ssvideo"),
        __selector,
      );
    }
    $(".slbannerhh").on("afterChange", function (event, slick, currentSlide) {
      $(".ssvideo").each(function (e) {
        $(this)[0].currentTime = 0;
        $(this)[0].pause();
      });
      $(this).slick("slickPlay");
      var __current = $(this)
        .find(".item[data-slick-index=" + currentSlide + "]")
        .find(".ssvideo");
      if (__current.size() > 0) {
        __current[0].play();
        $(this).slick("slickPause");
        change_slide(__current, $(this));
      }
    });
    function change_slide(__this, banner) {
      if (__this[0].currentTime >= __this[0].duration) {
        banner.slick("slickNext");
        banner.slick("slickPlay");
      } else {
        setTimeout(function () {
          change_slide(__this, banner);
        }, 100);
      }
    }
  }

  if ($(".remove-history")) {
    $(".remove-history").on("click", function (e) {
      e.preventDefault();
      $.ajax({
        url: "api/rmhistory.php",
        type: "POST",
        beforeSend: function () {
          holdonOpen();
        },
        success: function (res) {
          $(".wrap-product-seen").remove();
          holdonClose();
        },
        error: function () {
          alert("Đã xảy ra lỗi khi thực thi.");
          holdonClose();
        },
      });
    });
  }

  if (isExist($(".lazy-video"))) {
    $(".lazy-video").on("click", function (e) {
      e.preventDefault();

      var videoUrl = $(this).data("video-url");
      var width = $(this).data("width");
      var height = $(this).data("height");

      Fancybox.show(
        [
          {
            src: videoUrl,
            width: width,
            height: height,
          },
        ],
        {
          video: {
            autoplay: true,
          },
        },
      );
    });
  }

  if (isExist($(".counter"))) {
    $(".counter").countUp();
  }

  if (isExist($(".widget-ul"))) {
    $(".widget-ul .icon").on("click", function (e) {
      $(this).parent().toggleClass("active");
    });
  }

  if (isExist($(".content-text"))) {
    $(".content-text table").each(function (i, val) {
      $(this).addClass("table table-bordered");
    });
  }

  if (isExist($(".scrollspy"))) {
    $(".scrollspy").on("click", function (e) {
      e.preventDefault();
      var id = $(this).attr("href");
      $("html, body").animate({ scrollTop: $(id).offset().top }, 500, "swing");
    });
  }

  if (isExist($(".wrap-filter"))) {
    function filterProduct(page = 1) {
      let filters = {};
      filters["p"] = page;
      filters["q"] = $('.wrap-filter input[name="q"]').val();

      $(".filter-dropdown").removeClass("show");

      // LẤY DUY NHẤT TỪ DROPDOWN-ALL để tránh trùng
      $(".wrap-filter .filter-dropdown-all .btn-filter-all.active").each(
        function () {
          let key = $(this).data("key"); // ví dụ: brand, giaban, attr[1]
          let value = $(this).data("value");
          let multiple = $(this).data("multiple");

          if (multiple) {
            if (!filters[key]) filters[key] = [];
            filters[key].push(value);
          } else {
            filters[key] = value;
          }
        },
      );
      console.log(filters);
      console.log("key=", $(this).data("key"), "value=", $(this).data("value"));

      $.ajax({
        url: "api/filter.php",
        type: "POST",
        data: filters,
        dataType: "html",
        beforeSend: function () {
          holdonOpen();
        },
        success: function (res) {
          $(".wrap-more").remove();
          if (page > 1) $(".filter-result").append(res);
          else $(".filter-result").html(res);
          MM_FRAMEWORK.Lazys();
          holdonClose();
        },
        error: function () {
          alert("Đã xảy ra lỗi khi tải kết quả.");
          holdonClose();
        },
      });
    }

    filterProduct();

    $(".wrap-filter .filter-item .filter-title").on("click", function (e) {
      e.preventDefault();
      var dropdown = $(this).next();
      if (dropdown.hasClass("show")) {
        dropdown.removeClass("show");
      } else {
        $(".filter-dropdown").removeClass("show");
        dropdown.addClass("show");
      }
    });
    $(".wrap-filter .filter-item .btn-filter").on("click", function (e) {
      e.preventDefault();
      let btn = $(this);
      let dataMultiple = btn.data("multiple");
      let dataKey = btn.data("key");
      let dataValue = btn.data("value");
      var $parent = btn.parents(".filter-dropdown-list");
      if (!dataMultiple) {
        var $isActive = btn.hasClass("active");
        $parent.find(".btn-filter").removeClass("active");
        if (!$isActive) {
          btn.addClass("active");
        }
      } else {
        btn.toggleClass("active");
      }

      if ($parent.find(".btn-filter.active").length > 0) {
        $('span.filter-counter[data-key="' + dataKey + '"]')
          .html($parent.find(".btn-filter.active").length)
          .addClass("show");
      } else {
        $('span.filter-counter[data-key="' + dataKey + '"]')
          .html("")
          .removeClass("show");
      }

      if (!btn.hasClass("btn-filter-all")) {
        if (!dataMultiple) {
          $(
            '.filter-dropdown-all .btn-filter-all[data-key="' + dataKey + '"]',
          ).removeClass("active");
          if (!$isActive) {
            $(
              '.filter-dropdown-all .btn-filter-all[data-key="' +
                dataKey +
                '"][data-value="' +
                dataValue +
                '"]',
            ).addClass("active");
          }
        } else {
          $(
            '.filter-dropdown-all .btn-filter-all[data-key="' +
              dataKey +
              '"][data-value="' +
              dataValue +
              '"]',
          ).toggleClass("active");
        }
      } else {
        $(
          '.filter-dropdown .btn-filter-single[data-key="' +
            dataKey +
            '"][data-value="' +
            dataValue +
            '"]',
        ).toggleClass("active");
      }

      if ($(".filter-dropdown-all").find(".btn-filter-all.active").length > 0) {
        $('span.filter-counter[data-key="all"]')
          .html($(".filter-dropdown-all").find(".btn-filter-all.active").length)
          .addClass("show");
      } else {
        $('span.filter-counter[data-key="all"]').html("").removeClass("show");
      }
    });

    $(".wrap-filter .btn-result").on("click", function (e) {
      e.preventDefault();
      filterProduct();
    });

    $("body").on("click", ".btn-show-more-filter", function () {
      const btn = $(this);
      const nextPage = parseInt(btn.data("page")) || 2;
      filterProduct(nextPage);
    });
  }

  if (isExist($(".select-chuyenkhoa"))) {
    $(".select-chuyenkhoa").on("change", function () {
      var selectedId = $(this).find("option:selected").data("id");
      var bacsi = $(this).parents("form").find(".select-bacsi");
      if (selectedId) {
        $.ajax({
          url: "api/bacsi.php",
          type: "POST",
          data: {
            id: selectedId,
          },
          success: function (result) {
            $(bacsi).html(result);
          },
        });
      }
    });
  }

  if (isExist($(".input-placeholder"))) {
    $(".input-placeholder").placeholderTyper();
  }
  /* Select 2 */
  if (isExist($(".select2"))) {
    $(".select2").select2();
  }

  // document.addEventListener('contextmenu', function (e) {
  // 	e.preventDefault(); // Ngăn menu chuột phải mặc định
  // 	alert("Đây là bản quyền thuộc " + WEBSITE_NAME + " - Bạn phải chịu trách nhiệm khi sao chép hình ảnh và nội dung");
  // });
};
MM_FRAMEWORK.aweOwlPage = function () {
  var owl = $(".owl-carousel.in-page");
  owl.each(function () {
    var xs_item = $(this).attr("data-xs-items");
    var md_item = $(this).attr("data-md-items");
    var lg_item = $(this).attr("data-lg-items");
    var sm_item = $(this).attr("data-sm-items");
    var margin = $(this).attr("data-margin");
    var dot = $(this).attr("data-dot");
    var nav = $(this).attr("data-nav");
    var height = $(this).attr("data-height");
    var play = $(this).attr("data-play");
    var loop = $(this).attr("data-loop");

    if (typeof margin !== typeof undefined && margin !== false) {
    } else {
      margin = 30;
    }
    if (typeof xs_item !== typeof undefined && xs_item !== false) {
    } else {
      xs_item = 1;
    }
    if (typeof sm_item !== typeof undefined && sm_item !== false) {
    } else {
      sm_item = 3;
    }
    if (typeof md_item !== typeof undefined && md_item !== false) {
    } else {
      md_item = 3;
    }
    if (typeof lg_item !== typeof undefined && lg_item !== false) {
    } else {
      lg_item = 3;
    }

    if (loop == 1) {
      loop = true;
    } else {
      loop = false;
    }
    if (dot == 1) {
      dot = true;
    } else {
      dot = false;
    }
    if (nav == 1) {
      nav = true;
    } else {
      nav = false;
    }
    if (play == 1) {
      play = true;
    } else {
      play = false;
    }

    $(this).owlCarousel({
      loop: loop,
      margin: Number(margin),
      responsiveClass: true,
      dots: dot,
      nav: nav,
      navText: [
        '<div class="owlleft"><svg viewBox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;"><polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline></svg></div>',
        '<div class="owlright"><svg viewBox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;"><polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline></svg></div>',
      ],
      autoplay: play,
      autoplayTimeout: 4000,
      smartSpeed: 3000,
      autoplayHoverPause: true,
      autoHeight: false,
      responsive: {
        0: {
          items: Number(xs_item),
        },
        600: {
          items: Number(sm_item),
        },
        1000: {
          items: Number(md_item),
        },
        1200: {
          items: Number(lg_item),
        },
      },
    });
  });
};

MM_FRAMEWORK.slickPage = function () {
  if (isExist($(".slick.in-page"))) {
    $(".slick.in-page").each(function () {
      var dots = $(this).attr("data-dots");
      var infinite = $(this).attr("data-infinite");
      var speed = $(this).attr("data-speed");
      var vertical = $(this).attr("data-vertical");
      var arrows = $(this).attr("data-arrows");
      var autoplay = $(this).attr("data-autoplay");
      var autoplaySpeed = $(this).attr("data-autoplaySpeed");
      var centerMode = $(this).attr("data-centerMode");
      var centerPadding = $(this).attr("data-centerPadding");
      var slidesDefault = $(this).attr("data-slidesDefault");
      var responsive = $(this).attr("data-responsive");
      var xs_item = $(this).attr("data-xs-items");
      var md_item = $(this).attr("data-md-items");
      var lg_item = $(this).attr("data-lg-items");
      var sm_item = $(this).attr("data-sm-items");
      var slidesDefault_ar = slidesDefault.split(":");
      var xs_item_ar = xs_item.split(":");
      var sm_item_ar = sm_item.split(":");
      var md_item_ar = md_item.split(":");
      var lg_item_ar = lg_item.split(":");
      var to_show = slidesDefault_ar[0];
      var to_scroll = slidesDefault_ar[1];
      if (responsive == 1) {
        responsive = true;
      } else {
        responsive = false;
      }
      if (dots == 1) {
        dots = true;
      } else {
        dots = false;
      }
      if (arrows == 1) {
        arrows = true;
      } else {
        arrows = false;
      }
      if (infinite == 1) {
        infinite = true;
      } else {
        infinite = false;
      }
      if (autoplay == 1) {
        autoplay = true;
      } else {
        autoplay = false;
      }
      if (centerMode == 1) {
        centerMode = true;
      } else {
        centerMode = false;
      }
      if (vertical == 1) {
        vertical = true;
      } else {
        vertical = false;
      }
      if (typeof speed !== typeof undefined && speed !== false) {
      } else {
        speed = 300;
      }
      if (
        typeof autoplaySpeed !== typeof undefined &&
        autoplaySpeed !== false
      ) {
      } else {
        autoplaySpeed = 2000;
      }
      if (
        typeof centerPadding !== typeof undefined &&
        centerPadding !== false
      ) {
      } else {
        centerPadding = "0px";
      }
      var reponsive_json = [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: Number(lg_item_ar[0]),
            slidesToScroll: Number(lg_item_ar[1]),
          },
        },
        {
          breakpoint: 992,
          settings: {
            slidesToShow: Number(md_item_ar[0]),
            slidesToScroll: Number(md_item_ar[1]),
          },
        },
        {
          breakpoint: 768,
          settings: {
            slidesToShow: Number(sm_item_ar[0]),
            slidesToScroll: Number(sm_item_ar[1]),
            vertical: false,
          },
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: Number(xs_item_ar[0]),
            slidesToScroll: Number(xs_item_ar[1]),
            vertical: false,
          },
        },
      ];
      if (responsive == 1) {
        $(this).slick({
          dots: dots,
          infinite: infinite,
          arrows: arrows,
          speed: Number(speed),
          vertical: vertical,
          slidesToShow: Number(to_show),
          slidesToScroll: Number(to_scroll),
          autoplay: autoplay,
          autoplaySpeed: Number(autoplaySpeed),
          responsive: reponsive_json,
        });
      } else {
        $(this).slick({
          dots: dots,
          infinite: infinite,
          arrows: arrows,
          speed: Number(speed),
          vertical: vertical,
          slidesToShow: Number(to_show),
          slidesToScroll: Number(to_scroll),
          autoplay: autoplay,
          autoplaySpeed: Number(autoplaySpeed),
        });
      }
    });
  }
};

MM_FRAMEWORK.Toolbar2 = function () {
  $("body").on("click", ".scrollToTopMobile", function () {
    $("html,body").animate(
      {
        scrollTop: 0,
      },
      800,
    );
    return false;
  });
  if (isExist($(".toolbar2"))) {
    $(".footer-wrapper").css({
      marginBottom: $(".toolbar2").innerHeight(),
    });
  }
  $(".toolbar2 .phone").click(function (e) {
    e.stopPropagation();
    $(".toolbar2").toggleClass("is-active");
  });
  $(document).click(function () {
    $(".toolbar2").removeClass("is-active");
  });
  $(window).scroll(function () {
    var ex6Exists = $(".ex6").length > 0;
    if ($(this).scrollTop() > 100) {
      if (!ex6Exists) {
        $(".toolbar2 .scrollToTopMobile").addClass("ex6");
      }
    } else {
      $(".toolbar2 .scrollToTopMobile").removeClass("ex6");
    }
  });
};

MM_FRAMEWORK.shinerLogo = function () {
  $(window).bind("load", function () {
    // var api = $(".peShiner").peShiner({ api: true, paused: true, reverse: true, repeat: 1, color: 'oceanHL'});
    // api.resume();
  });
  /* Menu fixed */
  function runFixedMenu() {
    const scrollTop = $(window).scrollTop();
    const headerHeight = $("#header").outerHeight() || 100; // fallback để tránh lỗi bằng 0

    if (DEVICE_TYPE === "computer") {
      if (scrollTop >= headerHeight) {
        $(".header-bottom").addClass(
          "fixed shadow animate__animated animate__fadeIn",
        );
      } else {
        $(".header-bottom").removeClass(
          "fixed shadow animate__animated animate__fadeIn",
        );
      }
    } else {
      if (scrollTop >= headerHeight) {
        $(".header-bottom").addClass(
          "fixed shadow animate__animated animate__fadeIn",
        );
      } else {
        $(".header-bottom").removeClass(
          "fixed shadow animate__animated animate__fadeIn",
        );
      }
    }
  }

  // chạy khi DOM sẵn sàng
  $(document).ready(function () {
    runFixedMenu();
    $(window).on("scroll", runFixedMenu);
    $(window).on("resize", runFixedMenu);
  });
};

MM_FRAMEWORK.tiktokLoad = function () {
  const playIcon =
    '<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16"><path d="m11.596 8.697-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393"/></svg>';
  const pauseIcon =
    '<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-pause-fill" viewBox="0 0 16 16"><path d="M5.5 3.5A1.5 1.5 0 0 1 7 5v6a1.5 1.5 0 0 1-3 0V5a1.5 1.5 0 0 1 1.5-1.5m5 0A1.5 1.5 0 0 1 12 5v6a1.5 1.5 0 0 1-3 0V5a1.5 1.5 0 0 1 1.5-1.5"/></svg>';

  $(".tiktok-button").on("click", function (e) {
    e.preventDefault();
    const tiktokButton = $(this);
    const tiktokButtonAct = tiktokButton.attr("data-action");
    const tiktokContainer = tiktokButton.parents(".tiktok-container");
    const tiktokIframe = tiktokContainer.find(".tiktok-iframe");

    const videoId = tiktokContainer.attr("data-tiktok-id");
    const videoThumbnail = tiktokContainer.attr("data-tiktok-thumbnail");
    if (!videoId) return;

    if (tiktokButtonAct == "play") {
      loadTikTokVideo(tiktokIframe, videoId);
      tiktokButton.attr("data-action", "pause").find("i").html(pauseIcon);
    } else {
      tiktokIframe.html(
        '<iframe height="540px" width= "100%" src="https://www.tiktok.com/player/v1/' +
          videoId +
          '?music_info=1&description=1" allow="fullscreen"></iframe>',
      );
      tiktokButton.attr("data-action", "play").find("i").html(playIcon);
    }
  });
};

/* Ready */
$(document).ready(function () {
  MM_FRAMEWORK.Homes();
  MM_FRAMEWORK.LoaderWrapper();
  MM_FRAMEWORK.shinerLogo();
  MM_FRAMEWORK.SlickPage();
  MM_FRAMEWORK.SlickProduct();
  if (DEVICE_TYPE == "computer") MM_FRAMEWORK.AosAnimation();
  MM_FRAMEWORK.Lazys();
  MM_FRAMEWORK.Tools();
  MM_FRAMEWORK.Popup();
  MM_FRAMEWORK.AltImg();
  if (DEVICE_TYPE == "computer") MM_FRAMEWORK.GoTop();
  MM_FRAMEWORK.Menu();
  MM_FRAMEWORK.OwlPage();
  MM_FRAMEWORK.Pagings();
  MM_FRAMEWORK.Cart();
  MM_FRAMEWORK.Videos();
  MM_FRAMEWORK.Photobox();
  MM_FRAMEWORK.Comment();
  MM_FRAMEWORK.Search();
  MM_FRAMEWORK.DomChange();
  MM_FRAMEWORK.DatePicker();
  MM_FRAMEWORK.loadNameInputFile();
  MM_FRAMEWORK.QuickView();
  MM_FRAMEWORK.Toc();
  MM_FRAMEWORK.Toolbar2();
});

//Bộ lọc tìm kiếm nâng cao
const arraySelect = ["list", "city", "ward", "area", "khoanggia"];
$("body").on("click", ".realEstate-btn", function () {
  let urlSearch = "";
  // var keyword = $('#realEstate-keyword').val();
  var type = "san-pham";
  // $('.demand-radio').each(function () {
  //     if ($(this).find('input').is(":checked")) {
  //         type = $(this).find('input').val()
  //     }
  // });
  // if (keyword.length > 0) {
  //     urlSearch += "&keyword=" + keyword;
  // }
  arraySelect.forEach(function (item) {
    if ($("#realEstate-" + item).val() != 0) {
      let urlText = "&id_" + item + "=" + $("#realEstate-" + item).val();
      urlSearch += urlText;
    }
  });
  console.log(urlSearch);
  window.location.href = "tim-kiem?type=" + type + urlSearch;
});

$(document).ready(function () {
  if (typeof $.i18n === "undefined") {
    console.error("i18n chưa load");
    return;
  }

  $.i18n({
    locale: document.documentElement.lang,
  })
    .load({
      vi: "assets/i18n/vi.json",
      en: "assets/i18n/en.json",
    })
    .done(function () {
      $(".news-load-more").on("click", function () {
        let offset = parseInt($("#news-offset").val());
        let limit = parseInt($("#news-limit").val());
        let total = parseInt($("#news-total").val());
        let list = parseInt($("#news-list").val());
        let type = $("#news-type").val();
        $.ajax({
          url: "api/loadmore.php",
          type: "GET",
          data: {
            offset: offset,
            limit: limit,
            list: list,
            type: type,
          },
          beforeSend: function () {
            $(".news-load-more").addClass("disabled").text("Đang tải...");
          },
          success: function (html) {
            $(".loading-news .row").append(html);
            let newOffset = offset + limit;
            $("#news-offset").val(newOffset);
            let remain = total - newOffset;
            if (remain <= 0) {
              $(".news-load-more").remove();
            } else {
              $("#news-remaining").text(remain);
              $(".news-load-more")
                .removeClass("disabled")
                .text("Xem thêm " + remain + " bài viết");
            }
            if (typeof MM_FRAMEWORK !== "undefined") {
              MM_FRAMEWORK.Lazys();
            }
          },
        });
      });

      $(".product-load-more").on("click", function () {
        let offset = parseInt($("#product-offset").val());
        let limit = parseInt($("#product-limit").val());
        let total = parseInt($("#product-total").val());
        let list = parseInt($("#product-list").val());
        let type = $("#product-type").val();
        $.ajax({
          url: "api/loadmoreproduct.php",
          type: "GET",
          data: {
            offset: offset,
            limit: limit,
            list: list,
            type: type,
          },
          beforeSend: function () {
            $(".product-load-more").addClass("disabled").text("Đang tải...");
          },
          success: function (html) {
            $(".loading-product .row").append(html);
            let newOffset = offset + limit;
            $("#product-offset").val(newOffset);
            let remain = total - newOffset;
            if (remain <= 0) {
              $(".product-load-more").remove();
            } else {
              $("#product-remaining").text(remain);
              $(".product-load-more")
                .removeClass("disabled")
                .text("Xem thêm " + remain + " bài viết");
            }
            if (typeof MM_FRAMEWORK !== "undefined") {
              MM_FRAMEWORK.Lazys();
            }
          },
        });
      });
    });
});
