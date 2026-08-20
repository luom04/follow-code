/* Validation form */
function validateForm(ele) {
  window.addEventListener(
    "load",
    function () {
      var forms = document.getElementsByClassName(ele);
      var validation = Array.prototype.filter.call(forms, function (form) {
        form.addEventListener(
          "submit",
          function (event) {
            if (form.checkValidity() === false) {
              event.preventDefault();
              event.stopPropagation();
            }
            form.classList.add("was-validated");
          },
          false,
        );
      });
      $("." + ele)
        .find("input[type=submit],button[type=submit]")
        .removeAttr("disabled");
    },
    false,
  );
}

/* Validation form chung */
validateForm("validation-form");

function isExist(ele) {
  return ele.length;
}

function getLen(str) {
  return /^\s*$/.test(str) ? 0 : str.length;
}

/* onChange Category */
function filterCategory(url) {
  if ($(".filter-category").length > 0 && url != "") {
    var id = "";
    var value = 0;

    $(".filter-category").each(function () {
      id = $(this).attr("id");
      if (id) {
        value = parseInt($("#" + id).val());
        if (value) {
          url += "&" + id + "=" + value;
        }
      }
    });
  }

  return url;
}

function onchangeCategory(obj) {
  var name = "";
  var keyword = $("#keyword").val();
  var url = LINK_FILTER;

  obj
    .parents(".form-group")
    .nextAll()
    .each(function () {
      name = $(this).find(".filter-category").attr("name");
      if ($(this) != obj) {
        $(this).find(".filter-category").val(0);
      }
    });

  url = filterCategory(url);

  if (keyword) {
    url += "&keyword=" + encodeURI(keyword);
  }

  return (window.location = url);
}

/* Search */
function doEnter(evt, obj, url) {
  if (url == "") {
    notifyDialog(LANG["duongdankhonghople"]);
    return false;
  }

  if (evt.keyCode == 13 || evt.which == 13) {
    onSearch(obj, url);
  }
}
function onSearch(obj, url) {
  if (url == "") {
    notifyDialog(LANG["duongdankhonghople"]);
    return false;
  } else {
    var keyword = $("#" + obj).val();
    url = filterCategory(url);

    if (keyword) {
      url += "&keyword=" + encodeURI(keyword);
    }

    window.location = filterCategory(url);
  }
}

/* Action order (Search - Export excel - Export word) */
function actionOrder(url) {
  var listid = "";
  var order_status = parseInt($("#order_status").val());
  var order_payment = parseInt($("#order_payment").val());
  var order_date = $("#order_date").val();
  var range_price = $("#range_price").val();
  var city = parseInt($("#id_city").val());
  var district = parseInt($("#id_district").val());
  var ward = parseInt($("#id_ward").val());
  var keyword = $("#keyword").val();

  $("input.select-checkbox").each(function () {
    if (this.checked) listid = listid + "," + this.value;
  });

  listid = listid.substr(1);
  if (listid) url += "&listid=" + listid;
  if (order_status) url += "&order_status=" + order_status;
  if (order_payment) url += "&order_payment=" + order_payment;
  if (order_date) url += "&order_date=" + order_date;
  if (range_price) url += "&range_price=" + range_price;
  if (city) url += "&id_city=" + city;
  if (district) url += "&id_district=" + district;
  if (ward) url += "&id_ward=" + ward;
  if (keyword) url += "&keyword=" + encodeURI(keyword);

  window.location = url;
}

/* Send email */
function sendEmail() {
  var listemail = "";

  $("input.select-checkbox").each(function () {
    if (this.checked) listemail = listemail + "," + this.value;
  });

  listemail = listemail.substr(1);

  if (listemail == "") {
    notifyDialog(LANG["banhaychonitnhat1mucdegui"]);
    return false;
  }

  $("#listemail").val(listemail);

  document.frmsendemail.submit();
}

/* Delete item */
function deleteItem(url) {
  holdonOpen();
  document.location = url;
}

/* Delete all */
function deleteAll(url) {
  var listid = "";

  $("input.select-checkbox").each(function () {
    if (this.checked) listid = listid + "," + this.value;
  });

  listid = listid.substr(1);

  if (listid == "") {
    notifyDialog(LANG["banhaychonitnhat1mucdexoa"]);
    return false;
  }

  holdonOpen();
  document.location = url + "&listid=" + listid;
}

/* Create sort filer */
let sortable;
function createSortFiler() {
  if ($("#jFilerSortable").length) {
    sortable = new Sortable.create(document.getElementById("jFilerSortable"), {
      animation: 600,
      swap: true,
      disabled: true,
      // swapThreshold: 0.25,
      ghostClass: "ghostclass",
      multiDrag: true,
      selectedClass: "selected",
      forceFallback: false,
      fallbackTolerance: 3,
      onEnd: function () {
        /* Get all filer sort */
        listid = new Array();
        jFilerItems = $("#jFilerSortable").find(".my-jFiler-item");
        jFilerItems.each(function (index) {
          listid.push($(this).data("id"));
        });

        /* Update number */
        var id_parent = ID;
        var com = COM;
        var kind = ACT;
        var type = TYPE;
        var colfiler = $(".col-filer").val();
        var actfiler = $(".act-filer").val();
        $.ajax({
          url: "api/filer.php",
          type: "POST",
          dataType: "json",
          async: false,
          data: {
            id_parent: id_parent,
            listid: listid,
            com: com,
            kind: actfiler,
            type: type,
            colfiler: colfiler,
            cmd: "updateNumb",
            hash: HASH,
          },
          success: function (result) {
            var arrid = result.id;
            var arrnumb = result.numb;
            for (var i = 0; i < arrid.length; i++)
              $(".my-jFiler-item-" + arrid[i])
                .find("input[type=number]")
                .val(arrnumb[i]);
          },
        });
      },
    });
  }
}

/* Destroy sort filer */
function destroySortFiler() {
  try {
    var destroy = sortable.destroy();
  } catch (e) {}
}

/* Refresh filer when complete action */
function refreshFiler() {
  $(".sort-filer, .check-all-filer").removeClass("active");
  $(".sort-filer").attr("disabled", false);
  $(".alert-sort-filer").hide();

  if ($(".check-all-filer").find("i").hasClass("fas fa-check-square")) {
    $(".check-all-filer")
      .find("i")
      .toggleClass("far fa-square fas fa-check-square");
  }

  $(".my-jFiler-items .jFiler-items-list")
    .find("input.filer-checkbox")
    .each(function () {
      $(this).prop("checked", false);
    });
}

/* Refresh filer if empty */
function refreshFilerIfEmpty() {
  var id_parent = ID;
  var com = COM;
  var type = TYPE;
  var colfiler = $(".col-filer").val();
  var actfiler = $(".act-filer").val();
  var cmd = "refresh";

  $.ajax({
    type: "POST",
    dataType: "html",
    url: "api/filer.php",
    async: false,
    data: {
      id_parent: id_parent,
      com: com,
      kind: actfiler,
      type: type,
      colfiler: colfiler,
      cmd: cmd,
      hash: HASH,
    },
    success: function (result) {
      $(".jFiler-items-list").first().find(".jFiler-item").remove();
      destroySortFiler();
      $tmp =
        '<div class="form-group form-group-gallery">' +
        '<label class="label-filer">' +
        LANG["albumhientai"] +
        ":</label>" +
        '<div class="action-filer mb-3">' +
        '<a class="btn btn-sm bg-gradient-primary text-white check-all-filer mr-1"><i class="far fa-square mr-2"></i>' +
        LANG["chontatca"] +
        "</a>" +
        '<button type="button" class="btn btn-sm bg-gradient-success text-white sort-filer mr-1"><i class="fas fa-random mr-2"></i>' +
        LANG["sapxep"] +
        "</button>" +
        '<a class="btn btn-sm bg-gradient-danger text-white delete-all-filer"><i class="far fa-trash-alt mr-2"></i>' +
        LANG["xoatatca"] +
        "</a>" +
        "</div>" +
        '<div class="alert my-alert alert-sort-filer alert-info text-sm text-white bg-gradient-info"><i class="fas fa-info-circle mr-2"></i>' +
        LANG["cothechonnhieuhinhdedichuyen"] +
        "</div>" +
        '<div class="jFiler-items my-jFiler-items jFiler-row">' +
        '<ul class="jFiler-items-list jFiler-items-grid row scroll-bar" id="jFilerSortable">' +
        result +
        "</ul></div></div>";
      $("#filer-gallery").parents(".form-group").after($tmp);
      createSortFiler();
    },
  });
}

/* Delete filer */
function deleteFiler(string) {
  var str = string.split(",");
  var id = str[0];
  var folder = str[1];
  var cmd = "delete";

  $.ajax({
    type: "POST",
    url: "api/filer.php",
    data: {
      id: id,
      folder: folder,
      cmd: cmd,
    },
  });

  $(".my-jFiler-item-" + id).remove();

  if ($(".my-jFiler-items ul li").length == 0) {
    $(".form-group-gallery").remove();
  }
}

/* Delete all filer */
function deleteAllFiler(folder) {
  var listid = "";
  var cmd = "delete-all";

  $("input.filer-checkbox").each(function () {
    if (this.checked) listid = listid + "," + this.value;
  });

  listid = listid.substr(1);

  if (listid == "") {
    notifyDialog(LANG["banhaychonitnhat1mucdexoa"]);
    return false;
  }

  $.ajax({
    type: "POST",
    url: "api/filer.php",
    data: {
      listid: listid,
      folder: folder,
      cmd: cmd,
    },
  });

  listid = listid.split(",");

  for (var i = 0; i < listid.length; i++) {
    $(".my-jFiler-item-" + listid[i]).remove();
  }

  if ($(".my-jFiler-items ul li").length == 0) {
    $(".form-group-gallery").remove();
  }

  refreshFiler();
}

/* Push OneSignal */
function pushOneSignal(url) {
  document.location = url;
}

/* HoldOn */
function holdonOpen(
  theme = "sk-circle",
  text = "Loading...",
  backgroundColor = "rgba(0,0,0,0.8)",
  textColor = "white",
) {
  var options = {
    theme: theme,
    message: text,
    backgroundColor: backgroundColor,
    textColor: textColor,
  };

  HoldOn.open(options);
}
function holdonClose() {
  HoldOn.close();
}

/* Go to element */
function goToByScroll(id, minusTop) {
  minusTop = parseInt(minusTop) ? parseInt(minusTop) : 0;
  id = id.replace("#", "");
  $("html,body").animate(
    {
      scrollTop: $("#" + id).offset().top - minusTop,
    },
    "slow",
  );
}

/* Show notify */
function showNotify(
  text = "Notify text",
  title = LANG["thongbao"],
  status = "success",
) {
  new Notify({
    status: status, // success, warning, error
    title: title,
    text: text,
    effect: "fade",
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
    position: "right top",
  });
}

/* Notify */
function notifyDialog(
  content = "",
  title = LANG["thongbao"],
  icon = "fas fa-exclamation-triangle",
  type = "blue",
) {
  $.alert({
    title: title,
    icon: icon, // font awesome
    type: type, // red, green, orange, blue, purple, dark
    content: content, // html, text
    backgroundDismiss: true,
    animationSpeed: 600,
    animation: "zoom",
    closeAnimation: "scale",
    typeAnimated: true,
    animateFromElement: false,
    autoClose: "accept|3000",
    escapeKey: "accept",
    buttons: {
      accept: {
        text: '<i class="fas fa-check align-middle mr-2"></i>' + LANG["dongy"],
        btnClass: "btn-blue btn-sm bg-gradient-primary",
      },
    },
  });
}

/* Confirm */
function confirmDialog(
  action,
  text,
  value,
  title = LANG["thongbao"],
  icon = "fas fa-exclamation-triangle",
  type = "blue",
) {
  $.confirm({
    title: title,
    icon: icon, // font awesome
    type: type, // red, green, orange, blue, purple, dark
    content: text, // html, text
    backgroundDismiss: true,
    animationSpeed: 600,
    animation: "zoom",
    closeAnimation: "scale",
    typeAnimated: true,
    animateFromElement: false,
    autoClose: "cancel|3000",
    escapeKey: "cancel",
    buttons: {
      success: {
        text: '<i class="fas fa-check align-middle mr-2"></i>' + LANG["dongy"],
        btnClass: "btn-blue btn-sm bg-gradient-primary",
        action: function () {
          if (action == "create-seo") {
            seoCreate();
          }
          if (action == "push-onesignal") pushOneSignal(value);
          if (action == "send-email") sendEmail();
          if (action == "delete-filer") deleteFiler(value);
          if (action == "delete-all-filer") deleteAllFiler(value);
          if (action == "delete-item") deleteItem(value);
          if (action == "delete-all") deleteAll(value);
          if (action == "delete-photo") deletePhoto(value);
        },
      },
      cancel: {
        text: '<i class="fas fa-times align-middle mr-2"></i>' + LANG["huybo"],
        btnClass: "btn-red btn-sm bg-gradient-danger",
      },
    },
  });
}
function deletePhoto(_root) {
  let id = _root.data("id");
  let upload = _root.data("upload");
  let action = _root.data("action");
  let table = _root.data("table");
  $.ajax({
    url: "api/deletephoto.php",
    type: "POST",
    data: { id: id, upload: upload, action: action, table: table },
    success: function (data) {
      _root.parents(".photoUpload-detail").html(data);
    },
  });
}
/* Rounde number */
function roundNumber(rnum, rlength) {
  return Math.round(rnum * Math.pow(10, rlength)) / Math.pow(10, rlength);
}

/* Max Datetime Picker */
function maxDate(element) {
  if (MAX_DATE) {
    $(element).datetimepicker({
      timepicker: false,
      format: "d/m/Y",
      formatDate: "d/m/Y",
      // minDate: '1950/01/01',
      maxDate: MAX_DATE,
    });
  }
}

/* Min Datetime Picker */
function minDate(element) {
  if (MAX_DATE) {
    $(element).datetimepicker({
      timepicker: false,
      format: "d/m/Y",
      formatDate: "d/m/Y",
      minDate: MAX_DATE,
      // maxDate: MAX_DATE
    });
  }
}

/* Youtube preview */
function youtubePreview(url, element) {
  var regExp =
    /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
  var match = url.match(regExp);
  url = match && match[7].length == 11 ? match[7] : false;

  $(element)
    .attr("src", "//www.youtube.com/embed/" + url)
    .css({ width: "250", height: "150" });
}

/* SEO */
function seoExist() {
  var inputs = $(".card-seo input.check-seo");
  var textareas = $(".card-seo textarea.check-seo");
  var flag = false;

  if (!flag) {
    inputs.each(function (index) {
      var input = $(this).attr("id");
      value = $("#" + input).val();
      if (value) {
        flag = true;
        return false;
      }
    });
  }

  if (!flag) {
    textareas.each(function (index) {
      var textarea = $(this).attr("id");
      value = $("#" + textarea).val();
      if (value) {
        flag = true;
        return false;
      }
    });
  }

  return flag;
}
function seoCreate() {
  var flag = true;
  var seolang = $("#seo-create").val();
  var seolangArray = seolang.split(",");
  var seolangCount = seolangArray.length;
  var inputArticle = $(".card-article input.for-seo");
  var textareaArticle = $(".card-article textarea.for-seo");
  var textareaArticleCount = textareaArticle.length;
  var count = 0;
  var inputSeo = $(".card-seo input.check-seo");
  var textareaSeo = $(".card-seo textarea.check-seo");

  /* SEO Create - Input */
  inputArticle.each(function (index) {
    var input = $(this).attr("id");
    var lang = input.substr(input.length - 2);
    if (seolang.indexOf(lang) >= 0) {
      name = $("#" + input).val();
      name = name.substr(0, 140);
      name = name.trim();
      $("#title" + lang + ", #keywords" + lang).val(name);
      seoCount($("#title" + lang));
      seoCount($("#keywords" + lang));
    }
  });

  /* SEO Create - Textarea */
  textareaArticle.each(function (index) {
    var textarea = $(this).attr("id");
    var lang = textarea.substr(textarea.length - 2);
    if (seolang.indexOf(lang) >= 0) {
      if (flag) {
        var content = $("#" + textarea).val();

        if (!content && CKEDITOR.instances[textarea]) {
          content = CKEDITOR.instances[textarea].getData();
        }

        if (content) {
          content = content.replace(/(<([^>]+)>)/gi, "");
          content = content.substr(0, 320);
          content = content.trim();
          content = content.replace(/[\r\n]+/gm, " ");
          $("#description" + lang).val(content);
          seoCount($("#description" + lang));
          flag = false;
        } else {
          flag = true;
        }
      }
      count++;
      if (count == textareaArticleCount / seolangCount) {
        flag = true;
        count = 0;
      }
    }
  });

  /* SEO Preview */
  for (var i = 0; i < seolangArray.length; i++) {
    if (seolangArray[i]) {
      seoPreview(seolangArray[i]);
    }
  }
  seoRankMath().init();
}
function seoPreview(lang) {
  var titlePreview = "#title-seo-preview" + lang;
  var descriptionPreview = "#description-seo-preview" + lang;
  var title = $("#title" + lang).val();
  var description = $("#description" + lang).val();

  if ($(titlePreview).length) {
    if (title) $(titlePreview).html(title);
    else $(titlePreview).html("Title");
  }

  if ($(descriptionPreview).length) {
    if (description) $(descriptionPreview).html(description);
    else $(descriptionPreview).html("Description");
  }
}
function seoCount(obj) {
  if (obj.length) {
    var countseo = parseInt(obj.val().toString().length);
    countseo = countseo ? countseo++ : 0;

    obj
      .parents("div.form-group")
      .children("div.label-seo")
      .find(".count-seo span")
      .html(countseo);
  }
}
function seoChange() {
  var seolang = "vi,en";
  var elementSeo = $(".card-seo .check-seo");

  elementSeo.each(function (index) {
    var element = $(this).attr("id");
    var lang = element.substr(element.length - 2);
    if (seolang.indexOf(lang) >= 0) {
      if ($("#" + element).length) {
        $("body").on("keyup", "#" + element, function () {
          seoPreview(lang);
        });
      }
    }
  });
}

/* Slug */
function slugConvert(slug, focus = false) {
  slug = slug.toLowerCase();
  slug = slug.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, "a");
  slug = slug.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, "e");
  slug = slug.replace(/i|í|ì|ỉ|ĩ|ị/gi, "i");
  slug = slug.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, "o");
  slug = slug.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, "u");
  slug = slug.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, "y");
  slug = slug.replace(/đ/gi, "d");
  slug = slug.replace(
    /\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi,
    "",
  );
  slug = slug.replace(/ /gi, "-");
  slug = slug.replace(/\-\-\-\-\-/gi, "-");
  slug = slug.replace(/\-\-\-\-/gi, "-");
  slug = slug.replace(/\-\-\-/gi, "-");
  slug = slug.replace(/\-\-/gi, "-");

  if (!focus) {
    slug = "@" + slug + "@";
    slug = slug.replace(/\@\-|\-\@|\@/gi, "");
  }

  return slug;
}
function slugPreview(title, lang, focus = false) {
  var slug = slugConvert(title, focus);

  $("#slug" + lang).val(slug);
  $("#slugurlpreview" + lang + " strong").html(slug);
  $("#seourlpreview" + lang + " strong").html(slug);
}
function slugPreviewTitleSeo(title, lang) {
  if ($("#title" + lang).length) {
    var titleSeo = $("#title" + lang).val();
    if (!titleSeo) {
      if (title) $("#title-seo-preview" + lang).html(title);
      else $("#title-seo-preview" + lang).html("Title");
    }
  }
}
function slugPress() {
  var sluglang = "vi,en";
  var inputArticle = $(".card-article input.for-seo");
  var id = $(".slug-id").val();
  var seourlstatic = true;
  // var seourlstatic = $(".slug-seo-preview").data("seourlstatic");

  inputArticle.each(function (index) {
    var name = $(this).attr("id");
    var lang = name.substr(name.length - 2);
    if (sluglang.indexOf(lang) >= 0) {
      if ($("#" + name).length) {
        $("body").on("keyup", "#" + name, function (e) {
          var keyCode = e.keyCode || e.which;
          var title = $("#" + name).val();

          if (keyCode != 13) {
            if ((!id || $("#slugchange").prop("checked")) && seourlstatic) {
              /* Slug preivew */
              slugPreview(title, lang);
            }

            /* Slug preivew title seo */
            slugPreviewTitleSeo(title, lang);

            /* slug Alert */
            slugAlert(2, lang);
          }
        });
      }

      if ($("#slug" + lang).length) {
        $("body").on("keyup", "#slug" + lang, function (e) {
          var keyCode = e.keyCode || e.which;
          var title = $("#slug" + lang).val();

          if (keyCode != 13) {
            /* Slug preivew */
            slugPreview(title, lang, true);

            /* slug Alert */
            slugAlert(2, lang);
          }
        });
      }
    }
  });
}
function slugChange(obj) {
  if (obj.is(":checked")) {
    /* Load slug theo tiêu đề mới */
    slugStatus(1);
    $(".slug-input").attr("readonly", true);
  } else {
    /* Load slug theo tiêu đề cũ */
    slugStatus(0);
    $(".slug-input").attr("readonly", false);
  }
}
function slugStatus(status) {
  var sluglang = "vi,en";
  var inputArticle = $(".card-article input.for-seo");

  inputArticle.each(function (index) {
    var name = $(this).attr("id");
    var lang = name.substr(name.length - 2);
    if (sluglang.indexOf(lang) >= 0) {
      var title = "";
      if (status == 1) {
        if ($("#" + name).length) {
          title = $("#" + name).val();

          /* Slug preivew */
          slugPreview(title, lang);

          /* Slug preivew title seo */
          slugPreviewTitleSeo(title, lang);
        }
      } else if (status == 0) {
        if ($("#slug-default" + lang).length) {
          title = $("#slug-default" + lang).val();

          /* Slug preivew */
          slugPreview(title, lang);

          /* Slug preivew title seo */
          slugPreviewTitleSeo(title, lang);
        }
      }
    }
  });
}
function slugAlert(result, lang) {
  if (result == 1) {
    $("#alert-slug-danger" + lang).addClass("d-none");
    $("#alert-slug-success" + lang).removeClass("d-none");
  } else if (result == 0) {
    $("#alert-slug-danger" + lang).removeClass("d-none");
    $("#alert-slug-success" + lang).addClass("d-none");
  } else if (result == 2) {
    $("#alert-slug-danger" + lang).addClass("d-none");
    $("#alert-slug-success" + lang).addClass("d-none");
  }
}
function slugCheck() {
  var sluglang = "vi,en";
  var slugInput = $(".slug-input");
  var id = $(".slug-id").val();
  var copy = $(".slug-copy").val();

  slugInput.each(function (index) {
    var slugId = $(this).attr("id");
    var slug = $(this).val();
    var lang = slugId.substr(slugId.length - 2);
    if (sluglang.indexOf(lang) >= 0) {
      if (slug) {
        $.ajax({
          url: "api/slug.php",
          type: "POST",
          dataType: "html",
          async: false,
          data: {
            slug: slug,
            id: id,
            copy: copy,
          },
          success: function (result) {
            slugAlert(result, lang);
          },
        });
      }
    }
  });
}

/* Reader image */
function readImage(inputFile, elementPhoto) {
  if (inputFile[0].files[0]) {
    if (inputFile[0].files[0].name.match(/.(jpg|jpeg|png|gif|webp|svg)$/i)) {
      var size = parseInt(inputFile[0].files[0].size) / 1024;

      if (size <= 4096) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $(elementPhoto).attr("src", e.target.result);
        };
        reader.readAsDataURL(inputFile[0].files[0]);
      } else {
        notifyDialog(LANG["dungluonghinhanhlondungluongchopheplt4mb4096kb"]);
        return false;
      }
    } else {
      $(elementPhoto).attr("src", "");
      notifyDialog(LANG["dinhdanghinhanhkhonghople"]);
      return false;
    }
  } else {
    $(elementPhoto).attr("src", "");
    return false;
  }
}

/* Photo zone */
function photoZone(eDrag, iDrag, eLoad) {
  if ($(eDrag).length) {
    /* Drag over */
    $(eDrag).on("dragover", function () {
      $(this).addClass("drag-over");
      return false;
    });

    /* Drag leave */
    $(eDrag).on("dragleave", function () {
      $(this).removeClass("drag-over");
      return false;
    });

    /* Drop */
    $(eDrag).on("drop", function (e) {
      e.preventDefault();
      $(this).removeClass("drag-over");

      var lengthZone = e.originalEvent.dataTransfer.files.length;

      if (lengthZone == 1) {
        $(iDrag).prop("files", e.originalEvent.dataTransfer.files);
        readImage($(iDrag), eLoad);
      } else if (lengthZone > 1) {
        notifyDialog(LANG["banchiduocchon1hinhanhdeupload"]);
        return false;
      } else {
        notifyDialog(LANG["dulieukhonghople"]);
        return false;
      }
    });

    /* File zone */
    $(iDrag).change(function () {
      readImage($(this), eLoad);
    });
  }
}

/* Watermark */
function toDataURL(url, callback) {
  var xhr = new XMLHttpRequest();
  xhr.onload = function () {
    var reader = new FileReader();
    reader.onloadend = function () {
      callback(reader.result);
    };
    reader.readAsDataURL(xhr.response);
  };
  xhr.open("GET", url);
  xhr.responseType = "blob";
  xhr.send();
}
function previewWatermark() {
  $o = $("#form-watermark");
  var formData = new FormData();
  formData.append("file", $("#file")[0].files[0]);
  formData.append("data", $o.serialize());

  $.ajax({
    type: "POST",
    url: "index.php?com=photo&act=save-watermark&type=" + TYPE,
    data: formData,
    cache: false,
    contentType: false,
    processData: false,
    dataType: "json",
    success: function (data) {
      var url =
        "index.php?com=photo&act=preview-watermark&type=" +
        TYPE +
        "&position=" +
        data.position +
        "&img=" +
        data.image +
        "&watermark=" +
        data.path +
        "&upload=" +
        data.upload +
        "&opacity=" +
        data.data.opacity +
        "&per=" +
        data.data.per +
        "&small_per=" +
        data.data.small_per +
        "&min=" +
        data.data.min +
        "&max=" +
        data.data.max +
        "&t=" +
        data.time;
      toDataURL(url, function (dataUrl) {
        notifyDialog(
          '<img src="' + dataUrl + '" alt="Preview Watermark">',
          "Preview Watermark",
          "fas fa-image",
          "blue",
        );
      });
    },
    error: function (data) {
      console.log("error");
    },
  });

  return false;
}

/* Login */
function login() {
  var username = $("#username").val();
  var password = $("#password").val();
  var remember = 0;
  if ($("#remember").prop("checked") == true) {
    remember = 1;
  }

  if (
    $(".alert-login").hasClass("alert-danger") ||
    $(".alert-login").hasClass("alert-success")
  ) {
    $(".alert-login").removeClass("alert-danger alert-success");
    $(".alert-login").addClass("d-none");
    $(".alert-login").html("");
  }

  if ($(".show-password").hasClass("active")) {
    $(".show-password").removeClass("active");
    $("#password").attr("type", "password");
    $(".show-password").find("span").toggleClass("fas fa-eye fas fa-eye-slash");
  }

  $(".show-password").addClass("disabled");
  $(".btn-login .sk-chase").removeClass("d-none");
  $(".btn-login span").addClass("d-none");
  $(".btn-login").attr("disabled", true);
  $("#username").attr("disabled", true);
  $("#password").attr("disabled", true);

  $.ajax({
    type: "POST",
    dataType: "json",
    url: "api/login.php",
    async: false,
    data: { username: username, password: password, remember: remember },
    success: function (result) {
      if (result.success) {
        window.location = "index.php";
      } else if (result.error) {
        $(".alert-login").removeClass("d-none");
        $(".show-password").removeClass("disabled");
        $(".btn-login .sk-chase").addClass("d-none");
        $(".btn-login span").removeClass("d-none");
        $(".btn-login").attr("disabled", false);
        $("#username").attr("disabled", false);
        $("#password").attr("disabled", false);
        $(".alert-login").removeClass("alert-success");
        $(".alert-login").addClass("alert-danger");
        $(".alert-login").html(result.error);
      }
    },
  });
}

/* Login */
function forgot() {
  var email = $("#email").val();

  if (
    $(".alert-login").hasClass("alert-danger") ||
    $(".alert-login").hasClass("alert-success")
  ) {
    $(".alert-login").removeClass("alert-danger alert-success");
    $(".alert-login").addClass("d-none");
    $(".alert-login").html("");
  }

  $(".btn-forgot .sk-chase").removeClass("d-none");
  $(".btn-forgot span").addClass("d-none");
  $(".btn-forgot").attr("disabled", true);
  $("#email").attr("disabled", true);

  $.ajax({
    type: "POST",
    dataType: "json",
    url: "api/forgot.php",
    async: false,
    data: { email: email },
    beforeSend: function () {},
    success: function (result) {
      $(".alert-login").removeClass("d-none");
      if (result.success) {
        window.location = "/login";
      } else if (result.error) {
        $(".btn-forgot .sk-chase").addClass("d-none");
        $(".btn-forgot span").removeClass("d-none");
        $(".btn-forgot").attr("disabled", false);

        $(".btn-forgot").attr("disabled", false);
        $("#email").attr("disabled", false);
        $(".alert-login").removeClass("alert-success").addClass("alert-danger");
        $(".alert-login").html(result.error);
      }
    },
  });
}

/* Random password */
function randomPassword() {
  var str = "";

  for (i = 0; i < 9; i++) {
    str +=
      "!@#$%^&*()?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".charAt(
        Math.floor(Math.random() * 62),
      );
  }

  $("#new-password").val(str);
  $("#renew-password").val(str);
  $("#show-password").html(str);
}

/* Check permissions */
function loadPermissions() {
  if (
    $(".card-permission").find("input[type=checkbox]:checked").length ==
    $(".card-permission").find("input[type=checkbox]").length
  ) {
    $("input#selectall-checkbox").prop("checked", true);
  } else {
    $("input#selectall-checkbox").prop("checked", false);
  }
}

function seoRankMath() {
  var seolang = $("#seo-create").val();
  var seolangArray = seolang.split(",");
  var content = {};
  var keyword = {};
  var title = {};
  var description = {};
  var slug = {};

  for (var i = 0; i < seolangArray.length; i++) {
    content[seolangArray[i]] = "";
    keyword[seolangArray[i]] = {
      this: $("#keywords" + seolangArray[i]),
      value: $("#keywords" + seolangArray[i]).val(),
    };
    title[seolangArray[i]] = {
      this: $("#title" + seolangArray[i]),
      value: $("#title" + seolangArray[i]).val(),
    };
    description[seolangArray[i]] = {
      this: $("#description" + seolangArray[i]),
      value: $("#description" + seolangArray[i]).val(),
    };
    slug[seolangArray[i]] = $("#slug" + seolangArray[i]).val();
  }

  return {
    icon: {
      error:
        '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16"><path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293z"/></svg>',
      success:
        '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16"><path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/></svg>',
    },
    messageError: {
      keywordInTitle: "Thêm Từ khóa chính vào tiêu đề SEO.",
    },
    messageSuccess: {
      keywordInTitle:
        "Tuyệt vời! Bạn đang sử dụng Keyword chính trong tiêu đề SEO.",
      lengthTitle: "Tuyệt vời! Tiêu đề của bạn đã có độ dài tối ưu",
      lengthMetaDescription:
        "Tuyệt vời! Mô tả meta seo của bạn đã có độ dài tối ưu",
    },
    domain: CONFIG_BASE,
    lang: `vi`,
    content,
    get keyword() {
      return keyword;
    },
    get title() {
      return title;
    },
    get description() {
      return description;
    },
    get slug() {
      return slug;
    },
    init() {
      var root = this;
      setTimeout(function () {
        for (var editorId in CKEDITOR.instances) {
          let subID = editorId.substring(7);
          root.content[subID] = CKEDITOR.instances[editorId].getData();
        }
      }, 100);
      let targetObj = {};
      let observerObj = {};
      for (var i = 0; i < seolangArray.length; i++) {
        let subID = seolangArray[i];
        this.title[subID].value = this.title[subID].value
          ? this.title[subID].value.toLowerCase()
          : "";
        this.keyword[subID].value = this.keyword[subID].value
          ? this.keyword[subID].value.toLowerCase()
          : "";
        this.description[subID].value = this.description[subID].value
          ? this.description[subID].value.toLowerCase()
          : "";

        targetObj[subID] = document.getElementById("slugurlpreview" + subID)
          ? document.getElementById("slugurlpreview" + subID).firstElementChild
          : "";
        observerObj[subID] = new MutationObserver(function (mutations) {
          mutations.forEach(function (mutation) {
            root.slug[subID] = mutation.target.textContent
              ? mutation.target.textContent.toLowerCase()
              : "";
          });
        });
        if (targetObj[subID])
          observerObj[subID].observe(targetObj[subID], { childList: true });
      }
      setTimeout(function () {
        for (var editorId in CKEDITOR.instances) {
          let subID = editorId.substring(7);
          var editor = CKEDITOR.instances[editorId];
          if (editor) {
            editor.on(
              "change",
              function (evt) {
                var nnn = evt.editor.getData();
                root.setContent(subID, nnn);
                root.seoRankMathGroup();
              },
              this,
            );
          }
        }
      }, 100);
      setTimeout(function () {
        root.seoRankMathGroup();
      }, 200);
    },
    setContent(key, value) {
      this.content[key] = value;
    },
    getContent(key) {
      return this.content[key];
    },
    async seoRankMathGroup() {
      let point = 0;
      let root = this;
      let seoPanel = $(`#seo-general-` + this.lang);
      let regex = new RegExp(root.keyword[root.lang].value, "i");

      if (this.keyword[this.lang].value.length !== 0) {
        if (root.title[root.lang].value.search(regex) !== -1) {
          point++;
          root.seoRankMathChangeStatus(`keywordInTitle`, `success`);
        } else root.seoRankMathChangeStatus(`keywordInTitle`, `error`);
        let beginTitle = root.title[root.lang].value.search(regex);
        if (beginTitle === 0) {
          point++;
          root.seoRankMathChangeStatus(`titleStartWithKeyword`, `success`);
        } else if (beginTitle == -1) {
          root.seoRankMathChangeStatus(`titleStartWithKeyword`, `error`);
        } else {
          let endTitle = beginTitle + root.keyword[root.lang].value.length;
          if (endTitle === root.title[root.lang].value.length) {
            root.seoRankMathChangeStatus(`titleStartWithKeyword`, `error`);
          } else {
            point++;
            root.seoRankMathChangeStatus(`titleStartWithKeyword`, `success`);
          }
        }
      }
      let titleLength = root.title[root.lang].value.length;
      if (titleLength >= 10 && titleLength <= 70) {
        point++;
        root.seoRankMathChangeStatus("lengthTitle", "success");
      } else {
        if (titleLength > 70)
          mess =
            "Tiêu đề có " + titleLength + " ký tự. Hãy xem xét rút ngắn nó.";
        if (titleLength < 10)
          mess =
            "Tiêu đề " +
            titleLength +
            " ký tự (ngắn). Cố gắng có được 70 ký tự";
        seoPanel
          .find('li[key="lengthTitle"]')
          .removeClass("test-success")
          .addClass("test-fail");
        seoPanel.find('li[key="lengthTitle"]').find("span.txt").html(mess);
        seoPanel
          .find('li[key="lengthTitle"]')
          .find("span.icon")
          .html(this.icon.error);
      }
      if (root.keyword[root.lang].value.length !== 0) {
        if (root.description[root.lang].value.search(regex) !== -1) {
          point++;
          root.seoRankMathChangeStatus("keywordInMetaDescription", "success");
        } else
          root.seoRankMathChangeStatus("keywordInMetaDescription", "error");
      }
      let descriptionLength = root.description[root.lang].value.length;
      if (descriptionLength >= 160 && descriptionLength <= 300) {
        point++;
        root.seoRankMathChangeStatus("lengthMetaDescription", "success");
      } else {
        if (descriptionLength > 300)
          mess =
            "Mô tả meta SEO có " +
            descriptionLength +
            " ký tự. Hãy xem xét rút ngắn nó.";
        if (descriptionLength < 160)
          mess =
            "Mô tả meta SEO có " +
            descriptionLength +
            " ký tự (ngắn). Cố gắng thành 160 ký tự";
        seoPanel
          .find('li[key="lengthMetaDescription"]')
          .removeClass("test-success")
          .addClass("test-fail");
        seoPanel
          .find('li[key="lengthMetaDescription"]')
          .find("span.txt")
          .html(mess);
        seoPanel
          .find('li[key="lengthMetaDescription"]')
          .find("span.icon")
          .html(root.icon.error);
      }
      if (root.keyword[root.lang].value.length !== 0) {
        if (
          root.slug[root.lang].search(
            root.ChangeToSlug(root.keyword[root.lang].value),
          ) !== -1
        ) {
          point++;
          root.seoRankMathChangeStatus("keywordInPermalink", "success");
        }
      }
      let object = seoPanel.find('li[key="lengthPermalink"]');
      let slugLength = root.slug[root.lang].length + root.domain.length - 8;
      if (slugLength > 75 || slugLength < 35) {
        if (slugLength > 75)
          mess =
            "Url có " + slugLength + " ký tự (dài). Hãy xem xét rút ngắn nó.";
        if (slugLength < 35) mess = "Url có " + slugLength + " ký tự (ngắn).";
        object.removeClass("test-success").addClass("test-fail");
        object.find("span.txt").html(mess);
        object.find("span.icon").html(root.icon.error);
      } else {
        point++;
        mess = "Url có " + slugLength + " ký tự. Tuyệt vời!";
        object.removeClass("test-fail").addClass("test-success");
        object.find("span.txt").html(mess);
        object.find("span.icon").html(root.icon.success);
      }
      let contentRemoveHtml = await root
        .stripHtml(root.content[root.lang])
        .toLowerCase();
      if (root.keyword[root.lang].value.length !== 0) {
        let regex = new RegExp(root.keyword[root.lang].value, "i");
        let searchKey = contentRemoveHtml.search(regex);
        if (searchKey !== -1) {
          point++;
          root.seoRankMathChangeStatus("keywordInContent", "success");
          let firstKeyword = contentRemoveHtml
            .substr(0, root.keyword[root.lang].value.length)
            .toLowerCase();
          if (root.keyword[root.lang].value.toLowerCase() === firstKeyword) {
            point++;
            root.seoRankMathChangeStatus("keywordIn10Percent", "success");
          }
        }
      }
      let contentWord = contentRemoveHtml.split(/[\s.,;]+/).length;
      if (contentWord >= 600 && contentWord <= 2500) {
        point++;
        root.seoRankMathChangeStatus("lengthContent", "success");
      } else root.seoRankMathChangeStatus("lengthContent", "error");
      let tmp = document.createElement("div");
      tmp.innerHTML = root.content[root.lang];
      let internalLinks = tmp.getElementsByTagName("a");
      if (internalLinks.length === 0)
        root.seoRankMathChangeStatus("linksHasInternal", "error");
      else {
        let linksHasInternal = false;
        $.each(internalLinks, function (index, value) {
          if (
            internalLinks[index].href.toLowerCase().search(root.domain) !== -1
          ) {
            point++;
            root.seoRankMathChangeStatus("linksHasInternal", "success");
            linksHasInternal = true;
            return true;
          }
        });
        if (linksHasInternal === false)
          root.seoRankMathChangeStatus("linksHasInternal", "error");
      }
      if (root.keyword[root.lang].value.length !== 0) {
        let regex = new RegExp(root.keyword[root.lang].value, "i");
        let keywordInSubheadings = false;
        let headingH2 = tmp.getElementsByTagName("h2");
        if (headingH2.length !== 0) {
          $.each(headingH2, function (index, value) {
            if (headingH2[index].innerText.toLowerCase().search(regex) !== -1) {
              point++;
              root.seoRankMathChangeStatus("keywordInSubheadings", "success");
              keywordInSubheadings = true;
              return true;
            }
          });
        }
        let headingH3 = tmp.getElementsByTagName("h3");
        if (keywordInSubheadings === false && headingH3.length !== 0) {
          $.each(headingH3, function (index, value) {
            if (headingH3[index].innerText.toLowerCase().search(regex) !== -1) {
              point++;
              root.seoRankMathChangeStatus("keywordInSubheadings", "success");
              keywordInSubheadings = true;
              return true;
            }
          });
        }
        let headingH4 = tmp.getElementsByTagName("h4");
        if (keywordInSubheadings === false && headingH4.length !== 0) {
          $.each(headingH4, function (index, value) {
            if (headingH4[index].innerText.toLowerCase().search(regex) !== -1) {
              point++;
              root.seoRankMathChangeStatus("keywordInSubheadings", "success");
              keywordInSubheadings = true;
              return true;
            }
          });
        }
        let headingH5 = tmp.getElementsByTagName("h5");
        if (keywordInSubheadings === false && headingH5.length !== 0) {
          $.each(headingH5, function (index, value) {
            if (headingH5[index].innerText.toLowerCase().search(regex) !== -1) {
              point++;
              root.seoRankMathChangeStatus("keywordInSubheadings", "success");
              keywordInSubheadings = true;
              return true;
            }
          });
        }
        let headingH6 = tmp.getElementsByTagName("h5");
        if (keywordInSubheadings === false && headingH6.length !== 0) {
          $.each(headingH6, function (index, value) {
            if (headingH6[index].innerText.toLowerCase().search(regex) !== -1) {
              point++;
              root.seoRankMathChangeStatus("keywordInSubheadings", "success");
              keywordInSubheadings = true;
              return true;
            }
          });
        }
        if (keywordInSubheadings === false)
          root.seoRankMathChangeStatus("keywordInSubheadings", "error");
      }
      let img = tmp.getElementsByTagName("img");
      if (img.length === 0) {
        root.seoRankMathChangeStatus("keywordInImageAlt", "error");
        root.seoRankMathChangeStatus("contentHasAssets", "error");
      } else {
        if (root.keyword[root.lang].value.length !== 0) {
          let keywordInImageAlt = false;
          if (img.length >= 2) {
            point++;
            root.seoRankMathChangeStatus("contentHasAssets", "success");
          } else root.seoRankMathChangeStatus("contentHasAssets", "error");
          $.each(img, function (index, value) {
            let regex = new RegExp(root.keyword[root.lang].value, "i");
            if (img[index].alt.toLowerCase().search(regex) !== -1) {
              point++;
              root.seoRankMathChangeStatus("keywordInImageAlt", "success");
              keywordInImageAlt = true;
              return true;
            }
          });
          if (keywordInImageAlt === false)
            root.seoRankMathChangeStatus("keywordInImageAlt", "error");
        }
      }
      if (root.keyword[root.lang].value.length !== 0) {
        object = seoPanel.find('li[key="keywordDensity"]');
        let mess;
        let contentRemoveHtml = await root
          .stripHtml(root.content[root.lang])
          .toLowerCase();
        let contentWord = contentRemoveHtml.split(/[\s.,;]+/).length;
        let nkr = root.occurrences(
          contentRemoveHtml,
          root.keyword[root.lang].value.toLowerCase(),
        );
        let keywordDensity = (nkr / contentWord) * 100;
        keywordDensity = keywordDensity.toFixed(2);
        if (keywordDensity > 2.5 || keywordDensity < 0.75) {
          if (keywordDensity > 2.5)
            mess =
              "Mật độ từ khóa là " +
              keywordDensity +
              " (cao). Số lần từ khóa xuất hiện là " +
              nkr +
              ".";
          if (keywordDensity < 0.75)
            mess =
              "Mật độ từ khóa là " +
              keywordDensity +
              " (thấp). Số lần từ khóa xuất hiện là " +
              nkr +
              ".";
          object.removeClass("test-success").addClass("test-fail");
          object.find("span.txt").html(mess);
          object.find("span.icon").html(root.icon.error);
        } else {
          point++;
          mess =
            "Mật độ từ khóa là " +
            keywordDensity +
            ". Số lần từ khóa xuất hiện là " +
            nkr +
            ".";
          object.removeClass("test-fail").addClass("test-success");
          object.find("span.txt").html(mess);
          object.find("span.icon").html(root.icon.success);
        }
      }
      let tagP = tmp.getElementsByTagName("p");
      if (tagP.length >= 2) {
        point++;
        root.seoRankMathChangeStatus("contentHasShortParagraphs", "success");
      } else root.seoRankMathChangeStatus("contentHasShortParagraphs", "error");
      if (root.keyword[root.lang].value.length === 0) {
        root.seoRankMathChangeStatus("keywordNotUsed", "error");
        root.seoRankMathChangeStatus("keywordInTitle", "error");
        root.seoRankMathChangeStatus("titleStartWithKeyword", "error");
        root.seoRankMathChangeStatus("keywordInMetaDescription", "error");
        root.seoRankMathChangeStatus("keywordInPermalink", "error");
        root.seoRankMathChangeStatus("keywordInContent", "error");
        root.seoRankMathChangeStatus("keywordIn10Percent", "error");
        root.seoRankMathChangeStatus("keywordInImageAlt", "error");
        root.seoRankMathChangeStatus("keywordDensity", "error");
        root.seoRankMathChangeStatus("keywordInSubheadings", "error");
      } else {
        point++;
        root.seoRankMathChangeStatus("keywordNotUsed", "success");
      }
      point = ((point > 17 ? 17 : point) / 17) * 100;
      $("#seo_point_" + root.lang).html(Math.ceil(point));
    },
    seoRankMathChangeStatus(key, status) {
      let object = $(`#seo-general-` + this.lang).find('li[key="' + key + '"]');
      if (status === "success") {
        object.removeClass("test-fail").addClass("test-success");
        object.find("span.txt").html(this.messageSuccess[key]);
        object.find("span.icon").html(this.icon.success);
      } else {
        object.removeClass("test-success").addClass("test-fail");
        object.find("span.txt").html(this.messageError[key]);
        object.find("span.icon").html(this.icon.error);
      }
    },
    stripHtml(html) {
      let tmp = document.createElement("DIV");
      tmp.innerHTML = html;
      return tmp.textContent || tmp.innerText || "";
    },
    ChangeToSlug(title) {
      let slug = title.toLowerCase();
      slug = slug.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, "a");
      slug = slug.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, "e");
      slug = slug.replace(/i|í|ì|ỉ|ĩ|ị/gi, "i");
      slug = slug.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, "o");
      slug = slug.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, "u");
      slug = slug.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, "y");
      slug = slug.replace(/đ/gi, "d");
      slug = slug.replace(
        /\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi,
        "",
      );
      slug = slug.replace(/ /gi, "-");
      slug = slug.replace(/\-\-\-\-\-/gi, "-");
      slug = slug.replace(/\-\-\-\-/gi, "-");
      slug = slug.replace(/\-\-\-/gi, "-");
      slug = slug.replace(/\-\-/gi, "-");
      slug = "@" + slug + "@";
      slug = slug.replace(/\@\-|\-\@|\@/gi, "");
      return slug;
    },
    occurrences(string, subString, allowOverlapping) {
      string += "";
      subString += "";
      if (subString.length <= 0) return string.length + 1;
      var n = 0,
        pos = 0,
        step = allowOverlapping ? 1 : subString.length;
      while (true) {
        pos = string.indexOf(subString, pos);
        if (pos >= 0) {
          ++n;
          pos += step;
        } else break;
      }
      return n;
    },
  };
}

// Hàm chuyển đổi từ "1.200.000" => 1200000
function toNumber(val) {
  if (!val) return 0;
  return parseFloat(val.toString().replace(/[^0-9.-]/g, "")) || 0;
}

$(document).on("change", ".file_upload_video", function (evt) {
  var $source = $("#video_here");
  $source[0].src = URL.createObjectURL(this.files[0]);
  $source.parent()[0].load();
});

var current_lang = "vi";

// Khi user click thì đổi lang và gọi lại
$(".nav-link").on("click", function () {
  current_lang = $(this).data("value");
  if ($("#card-seo").length) {
    seoRankMath(current_lang).init();
  }
});

$(document).ready(function () {
  if ($("#card-seo").length) {
    seoRankMath(current_lang).init();
  }
  Fancybox.bind("[data-fancybox]", {});

  if ($("#add-photo").length) {
    let index = 0;
    $("#add-photo").click(function () {
      index++;
      let template = $("#photo-template").html();
      template = template.replace(/__INDEX__/g, index);
      $("#photo-container").append(template);
    });
    // Xóa item
    $("body").on("click", ".remove-photo", function () {
      $(this).closest(".photo-item").remove();
    });
  }

  $("body").on("click", ".delete-photo-multiple a", function () {
    let photo = $(this).data("photo"); // lấy tên ảnh
    let $input = $("input#photo_multiple"); // input hidden
    let current = $input.val().split(","); // chuyển thành mảng
    // Lọc bỏ ảnh bị xoá
    let updated = current.filter(function (item) {
      return item !== photo;
    });
    // Cập nhật lại value input
    $input.val(updated.join(","));

    // Xoá ảnh trên giao diện
    $(this).closest(".photoUpload-detail").remove();
  });

  $("body").on("click", ".delete-photo a", function (event) {
    confirmDialog("delete-photo", LANG["banmuonxoahinhanhnay"], $(this));
  });
  /* Loader */
  if ($(".loader-wrapper").length) {
    setTimeout(function () {
      $(".loader-wrapper").fadeOut("medium");
    }, 300);
  }

  /* Login */
  if (LOGIN_PAGE) {
    $("#username, #password").keypress(function (event) {
      if (event.keyCode == 13 || event.which == 13) login();
    });

    $(".btn-login").click(function () {
      login();
    });

    $(".btn-forgot").click(function () {
      forgot();
    });

    $(".show-password").click(function () {
      if ($("#password").val()) {
        if ($(this).hasClass("active")) {
          $(this).removeClass("active");
          $("#password").attr("type", "password");
        } else {
          $(this).addClass("active");
          $("#password").attr("type", "text");
        }
        $(this).find("i").toggleClass("fas fa-eye fas fa-eye-slash");
      }
    });
  }

  /* Permission */
  if (ADD_OR_EDIT_PERMISSIONS) {
    loadPermissions();

    $("input#selectall-checkbox").click(function () {
      $this = $(this);
      if ($this.prop("checked")) {
        $(".card-permission")
          .find("input[type=checkbox]")
          .prop("checked", true);
      } else {
        $(".card-permission")
          .find("input[type=checkbox]")
          .prop("checked", false);
      }
    });

    $(".card-permission").change(function () {
      loadPermissions();
    });
  }

  /* Menu */
  if ($(".sidebar").length) {
    if ($(".menu-group").length) {
      var navlink = $(".menu-group").find(".nav-link.active").first();
      if (navlink.length) {
        var menugroup = navlink.parents(".menu-group");
        menugroup.addClass("menu-open");
        menugroup.find(">.nav-link").addClass("active");
      }
    }

    if (
      $(".nav-sidebar").find(">li.nav-item").not(".menu-group, .d-none").length
    ) {
      var navitem = $(".nav-sidebar")
        .find(">li.nav-item")
        .not(".menu-group, .d-none");
      navitem.each(function (index) {
        var navtreeview = $(this).find(">ul.nav-treeview");
        if (navtreeview.length) {
          var navitemchild = $(this)
            .find(">ul.nav-treeview")
            .find(">li.nav-item");
          var navitemchildnone = $(this)
            .find(">ul.nav-treeview")
            .find(">li.nav-item.d-none");
          if (navitemchild.length) {
            if (navitemchild.length == navitemchildnone.length) {
              if (!$(this).hasClass("d-none")) {
                $(this).addClass("d-none");
              }
            }
          } else if (navitemchild.length == 0 && navitemchildnone.length == 0) {
            if (!$(this).hasClass("d-none")) {
              $(this).addClass("d-none");
            }
          }
        }
      });
    }

    $(".sidebar li.menu-group").each(function () {
      // Tìm tất cả các nav-item bên trong
      const items = $(this).find("li.nav-item");

      // Kiểm tra nếu tất cả đều có class d-none
      const allHidden =
        items.length > 0 && items.filter(":not(.d-none)").length === 0;

      if (allHidden) {
        $(this).hide(); // Ẩn menu-group
      }
    });
  }

  /* Import excell */
  if (IMPORT_IMAGE_EXCELL && $(".copy-excel").length) {
    $(".copy-excel").click(function () {
      var text = $(this).data("text");
      var dummy = document.createElement("input");

      dummy.select();
      dummy.setSelectionRange(0, 99999);
      navigator.clipboard.writeText(text);

      if (!$(this).hasClass("active")) {
        $(this).addClass("active");
        $(this).html("Copied");
      }
    });
  }

  /* Order */
  if (ORDER_ADVANCED_SEARCH) {
    /* Date range picker */
    $("#order_date").daterangepicker({
      callback: this.render,
      autoUpdateInput: false,
      timePicker: false,
      timePickerIncrement: 30,
      locale: {
        format: "DD/MM/YYYY",
        // format: 'DD/MM/YYYY hh:mm A'
      },
    });

    $("#order_date").on("apply.daterangepicker", function (ev, picker) {
      $(this).val(
        picker.startDate.format("DD/MM/YYYY") +
          " - " +
          picker.endDate.format("DD/MM/YYYY"),
      );
    });

    $("#order_date").on("cancel.daterangepicker", function (ev, picker) {
      $(this).val("");
    });

    /* rangeSlider */
    $("#range_price").ionRangeSlider({
      skin: "flat",
      min: ORDER_MIN_TOTAL,
      max: ORDER_MAX_TOTAL,
      from: ORDER_PRICE_FROM,
      to: ORDER_PRICE_TO,
      type: "double",
      step: 1,
      // prefix  : 'đ ',
      postfix: " đ",
      prettify: true,
      hasGrid: true,
    });
  }

  /* Product */
  $(document).on(
    "input",
    ".regular_price, .sale_price, .discount_price",
    function () {
      let $price = $(".regular_price");
      let $discount = $(".sale_price");
      let $percent = $(".discount_price");

      let price = toNumber($price.val());
      let discount = toNumber($discount.val());
      let percent = toNumber($percent.val());

      // Nếu thay đổi giá mới (sale_price) → tính %
      if ($(this).is($discount)) {
        if (price > 0 && discount > 0 && discount < price) {
          percent = Math.round(((price - discount) / price) * 100);
          $percent.val(percent);
        } else {
          $percent.val(0);
        }
      }

      // Nếu thay đổi % giảm (discount) → tính giá mới
      if ($(this).is($percent)) {
        if (price > 0 && percent > 0 && percent <= 100) {
          discount = Math.round(price - (price * percent) / 100);
          $discount.val(discount);
        } else {
          $discount.val("");
        }
      }

      // Nếu thay đổi giá gốc (regular_price) → tính lại sale_price dựa trên % đang có
      if ($(this).is($price)) {
        if (price > 0 && percent > 0) {
          discount = Math.round(price - (price * percent) / 100);
          $discount.val(discount);
        }
      }

      // Sau khi tính toán → format lại
      $(".format-price").priceFormat({
        limit: 13,
        prefix: "",
        centsLimit: 0,
      });
    },
  );

  /* Setting */
  if ($(".mailertype").length) {
    $(".mailertype").click(function () {
      var value = parseInt($(this).val());

      if (value == 1) {
        $(".host-email").removeClass("d-none");
        $(".host-email").addClass("d-block");
        $(".gmail-email").removeClass("d-block");
        $(".gmail-email").addClass("d-none");
      }
      if (value == 2) {
        $(".gmail-email").removeClass("d-none");
        $(".gmail-email").addClass("d-block");
        $(".host-email").removeClass("d-block");
        $(".host-email").addClass("d-none");
      }
    });
  }

  /* Max Datetime Picker */
  if ($(".max-date").length) {
    maxDate(".max-date");
  }

  /* Min Datetime Picker */
  if ($(".min-date").length) {
    minDate(".min-date");
  }

  /* Select 2 */
  if ($(".select2").length) {
    $(".select2").select2();
  }

  /* Format price */
  if ($(".format-price").length) {
    $(".format-price").priceFormat({
      limit: 13,
      prefix: "",
      centsLimit: 0,
    });
  }

  /* PhotoZone */
  if ($("#photo-zone").length) {
    photoZone("#photo-zone", "#file-zone", "#photoUpload-preview img");
  }
  /* PhotoZone1 */
  if ($("#photo-zone1").length) {
    photoZone("#photo-zone1", "#file-zone1", "#photoUpload-preview1 img");
  }

  /* Sumoselect */
  if ($(".multiselect").length) {
    window.asd = $(".multiselect").SumoSelect({
      placeholder: LANG["chondanhmuc"],
      selectAll: true,
      search: true,
      searchText: LANG["timkiem"],
      locale: ["OK", "Cancel", "Select all"],
      //captionFormat: 'Đã chọn {0} mục',
      //captionFormatAllSelected: 'Đã chọn tất cả {0} mục'
    });
  }

  /* Ckeditor */
  if ($(".form-control-ckeditor").length) {
    $(".form-control-ckeditor").each(function () {
      var id = $(this).attr("id");
      var height = $(this).data("height");
      if (height > 0) {
        CKEDITOR.replace(id, {
          height: height,
        });
      } else {
        CKEDITOR.replace(id);
      }
    });
  }

  /* Comment */
  if ($(".comment-manager").length) {
    $(".comment-manager").comments({
      url: "api/comment.php",
    });
  }

  /* Ajax category */
  if ($(".select-category")) {
    $("body").on("change", ".select-category", function () {
      var id = $(this).val();
      var child = $(this).data("child");
      var level = parseInt($(this).data("level"));
      var table = $(this).data("table");
      var type = $(this).data("type");

      if ($("#" + child).length) {
        $.ajax({
          url: "api/category.php",
          type: "POST",
          data: {
            level: level,
            id: id,
            table: table,
            type: type,
          },
          success: function (result) {
            var op = "<option value='0'>" + LANG["chondanhmuc"] + "</option>";

            if (level == 0) {
              $("#id_cat").html(op);
              $("#id_item").html(op);
              $("#id_sub").html(op);
            } else if (level == 1) {
              $("#id_item").html(op);
              $("#id_sub").html(op);
            } else if (level == 2) {
              $("#id_sub").html(op);
            }
            $("#" + child).html(result);
          },
        });

        return false;
      }
    });
  }

  /* Ajax place */
  if ($(".select-place").length) {
    $("body").on("change", ".select-place", function () {
      var id = $(this).val();
      var child = $(this).data("child");
      var level = parseInt($(this).data("level"));
      var table = $(this).data("table");

      if ($("#" + child).length) {
        $.ajax({
          url: "api/place.php",
          type: "POST",
          data: {
            level: level,
            id: id,
            table: table,
          },
          success: function (result) {
            var op = "<option value='0'>" + LANG["chondanhmuc"] + "</option>";

            if (level == 0) {
              $("#id_district").html(op);
              $("#id_ward").html(op);
            } else if (level == 1) {
              $("#id_ward").html(op);
            }
            $("#" + child).html(result);
          },
        });
      }

      return false;
    });
  }

  /* Database */
  if ($(".btn-database").length) {
    $("body").on("click", ".btn-database", function () {
      var action = $(this).data("action");

      if (action) {
        holdonOpen();
        $.ajax({
          url: "api/database.php",
          type: "POST",
          dataType: "json",
          data: {
            action: action,
          },
          error: function () {
            holdonClose();
          },
          success: function (result) {
            if (result) {
              $(".result-database").html("");
              for (var i = 0; i < result.length; i++) {
                $str = "";
                $str += '<div class="col-md-4">';
                $str +=
                  '<div class="alert alert-success alert-dismissible bg-gradient-success">';
                $str += "<h6><strong>" + result[i].table + "</strong></h6>";
                $str +=
                  "<div><strong>Action:</strong> " +
                  result[i].action +
                  "</div>";
                $str +=
                  "<div><strong>Status:</strong> " + result[i].text + "</div>";
                $str += "</div>";
                $str += "</div>";
                $(".result-database").append($str);
              }
            } else {
              $(".result-database").html(
                '<div class="col-12"><span class="text-danger">' +
                  LANG["xulythatbaivuilongthulaisau"] +
                  "</span></div>",
              );
            }

            holdonClose();
          },
        });
      }

      return false;
    });
  }

  /* Check required form */
  if ($(".submit-check").length) {
    $(".submit-check").click(function () {
      var formCheck = $(this).parents("form.validation-form");

      /* Holdon */
      holdonOpen();

      /* Check slug */
      slugCheck();

      /* Elements */
      var flag = true;
      var slugs = "";
      var slugOffset = $(".card-slug");
      var slugsInValid = $(".card-slug :required:invalid");
      var slugsError = $(".card-slug .text-danger").not(".d-none");
      var cardOffset = 0;
      var elementsInValid = $(".card :required:invalid");

      /* Check if has slug vs name */
      if (slugsInValid.length || slugsError.length) {
        flag = false;
        slugs = slugsError.length ? slugsError : slugsInValid;

        /* Check elements empty */
        slugs.each(function () {
          $this = $(this);
          var tabPane = $this.parents(".tab-pane");
          var tabPaneID = tabPane.attr("id");
          $('.nav-tabs a[href="#' + tabPaneID + '"]').tab("show");
          return false;
        });

        /* Scroll to error */
        setTimeout(function () {
          $("html,body").animate(
            { scrollTop: slugOffset.offset().top - 40 },
            "medium",
          );
        }, 500);
      } else if (elementsInValid.length) {
        flag = false;

        /* Check elements empty */
        elementsInValid.each(function () {
          $this = $(this);
          cardOffset = $this.parents(".card-body");
          var cardCollapsed = $this.parents(".card.collapsed-card");

          if (cardCollapsed.length) {
            cardCollapsed.find(".card-body").show();
            cardCollapsed
              .find(".btn-tool i")
              .toggleClass("fas fa-plus fas fa-minus");
            cardCollapsed.removeClass("collapsed-card");
          }

          var tabPane = $this.parents(".tab-pane");
          var tabPaneID = tabPane.attr("id");
          $('.nav-tabs a[href="#' + tabPaneID + '"]').tab("show");

          return false;
        });

        /* Scroll to error */
        if (cardOffset) {
          setTimeout(function () {
            $("html,body").animate(
              { scrollTop: cardOffset.offset().top - 100 },
              "medium",
            );
          }, 500);
        }
      }

      /* Holdon close */
      holdonClose();

      /* Check form validated */
      if (!flag) {
        formCheck.addClass("was-validated");
      } else {
        formCheck.removeClass("was-validated");
      }

      return flag;
    });
  }

  /* Push oneSignal */
  if ($("#push-onesignal").length) {
    $("body").on("click", "#push-onesignal", function () {
      var url = $(this).data("url");
      confirmDialog("push-onesignal", LANG["banmuondaytinnay"], url);
    });
  }

  /* Send email */
  if ($("#send-email").length) {
    $("body").on("click", "#send-email", function () {
      confirmDialog(
        "send-email",
        LANG["banmuonguithongtinchocacmucdachon"],
        "",
      );
    });
  }

  /* Check item */
  if ($(".select-checkbox").length) {
    var lastChecked = null;
    var $checkboxItem = $(".select-checkbox");

    $checkboxItem.click(function (e) {
      if (!lastChecked) {
        lastChecked = this;
        return;
      }

      if (e.shiftKey) {
        var start = $checkboxItem.index(this);
        var end = $checkboxItem.index(lastChecked);
        $checkboxItem
          .slice(Math.min(start, end), Math.max(start, end) + 1)
          .prop("checked", true);
      }

      lastChecked = this;
    });
  }

  /* Check all */
  if ($("#selectall-checkbox").length) {
    $("body").on("click", "#selectall-checkbox", function () {
      var parentTable = $(this).parents("table");
      var input = parentTable.find("input.select-checkbox");

      if ($(this).is(":checked")) {
        input.each(function () {
          $(this).prop("checked", true);
        });
      } else {
        input.each(function () {
          $(this).prop("checked", false);
        });
      }
    });
  }

  /* Delete item */
  if ($("#delete-item").length) {
    $("body").on("click", "#delete-item", function () {
      var url = $(this).data("url");
      confirmDialog("delete-item", LANG["bancochacmuonxoamucnay"], url);
    });
  }

  /* Delete all */
  if ($("#delete-all").length) {
    $("body").on("click", "#delete-all", function () {
      var url = $(this).data("url");
      confirmDialog("delete-all", LANG["bancochacmuonxoanhungmucnay"], url);
    });
  }

  /* Load name input file */
  if ($(".custom-file input[type=file]").length) {
    $("body").on("change", ".custom-file input[type=file]", function () {
      var fileName = $(this).val();
      fileName = fileName.substr(
        fileName.lastIndexOf("\\") + 1,
        fileName.length,
      );
      $(this).siblings("label").html(fileName);
    });
  }

  /* Change status */
  if ($(".show-checkbox").length) {
    $("body").on("click", ".show-checkbox", function () {
      var id = $(this).attr("data-id");
      var table = $(this).attr("data-table");
      var attr = $(this).attr("data-attr");
      var $this = $(this);

      $.ajax({
        url: "api/status.php",
        type: "POST",
        dataType: "html",
        data: {
          id: id,
          table: table,
          attr: attr,
        },
        success: function () {
          if ($this.is(":checked")) $this.prop("checked", false);
          else $this.prop("checked", true);
        },
      });

      return false;
    });
  }

  /* Change numb */
  if ($("input.update-numb").length) {
    $("body").on("change", "input.update-numb", function () {
      var id = $(this).attr("data-id");
      var table = $(this).attr("data-table");
      var value = $(this).val();

      $.ajax({
        url: "api/numb.php",
        type: "POST",
        dataType: "html",
        data: {
          id: id,
          table: table,
          value: value,
        },
      });

      return false;
    });
  }

  /* Watermark */
  if ($(".watermark-position label").length) {
    $(".watermark-position label").click(function () {
      if ($(".upload-file-image img").length) {
        var img = $(".upload-file-image img").attr("src");

        if (img) {
          $(".watermark-position label img").attr(
            "src",
            ASSET + "assets/images/noimage.png",
          );
          $(this).find("img").attr("src", img);
          $(this).find("img").show();
        }
      } else {
        notifyDialog(LANG["dulieuhinhanhkhonghople"]);
        return false;
      }
    });
  }

  /* Slug */
  slugPress();
  if ($("#slugchange").length) {
    $("body").on("click", "#slugchange", function () {
      slugChange($(this));
    });
  }

  /* SEO */
  seoChange();
  if (
    $(".title-seo").length &&
    $(".keywords-seo").length &&
    $(".description-seo").length
  ) {
    $("body").on(
      "keyup",
      ".title-seo, .keywords-seo, .description-seo",
      function () {
        seoCount($(this));
      },
    );
  }
  if ($(".create-seo").length) {
    $("body").on("click", ".create-seo", function () {
      if (seoExist())
        confirmDialog(
          "create-seo",
          LANG["noidungseodaduocthietlapbanmuontaolainoidungseo"],
          "",
        );
      else {
        seoCreate();
      }
    });
  }

  /* Copy */
  if ($(".copy-now").length) {
    $("body").on("click", ".copy-now", function (e) {
      e.preventDefault();
      var id = $(this).attr("data-id");
      var table = $(this).attr("data-table");
      var copyimg = $(this).attr("data-copyimg");

      holdonOpen();

      $.ajax({
        url: "api/copy.php",
        type: "POST",
        dataType: "html",
        async: false,
        data: {
          id: id,
          table: table,
          copyimg: copyimg,
        },
        success: function () {
          holdonClose();
        },
      });

      window.location.reload(true);
    });
  }

  /* Sort filer */
  if (ACTIVE_GALLERY) {
    createSortFiler();
  }

  /* Check all filer */
  $("body").on("click", ".check-all-filer", function () {
    var parentFiler = $(".my-jFiler-items .jFiler-items-list");
    var input = parentFiler.find("input.filer-checkbox");
    var jFilerItems = $("#jFilerSortable").find(".my-jFiler-item");

    $(this).find("i").toggleClass("far fa-square fas fa-check-square");
    if ($(this).hasClass("active")) {
      $(this).removeClass("active");
      $(".sort-filer").removeClass("active");
      $(".sort-filer").attr("disabled", false);
      input.each(function () {
        $(this).prop("checked", false);
      });
    } else {
      sortable.option("disabled", true);
      $(this).addClass("active");
      $(".sort-filer").attr("disabled", true);
      $(".alert-sort-filer").hide();
      $(".my-jFiler-item-trash").show();
      input.each(function () {
        $(this).prop("checked", true);
      });
      jFilerItems.each(function () {
        $(this).find("input").attr("disabled", false);
      });
      jFilerItems.each(function () {
        $(this).removeClass("moved");
      });
    }
  });

  /* Check filer */
  $("body").on("click", ".filer-checkbox", function () {
    var input = $(".my-jFiler-items .jFiler-items-list").find(
      "input.filer-checkbox:checked",
    );

    if (input.length) $(".sort-filer").attr("disabled", true);
    else $(".sort-filer").attr("disabled", false);
  });

  /* Sort filer */
  $("body").on("click", ".sort-filer", function () {
    var jFilerItems = $("#jFilerSortable").find(".my-jFiler-item");

    if ($(this).hasClass("active")) {
      sortable.option("disabled", true);
      $(this).removeClass("active");
      $(".alert-sort-filer").hide();
      $(".my-jFiler-item-trash").show();
      jFilerItems.each(function () {
        $(this).find("input").attr("disabled", false);
        $(this).removeClass("moved");
      });
    } else {
      sortable.option("disabled", false);
      $(this).addClass("active");
      $(".alert-sort-filer").show();
      $(".my-jFiler-item-trash").hide();
      jFilerItems.each(function () {
        $(this).find("input").attr("disabled", true);
        $(this).addClass("moved");
      });
    }
  });

  /* Delete filer */
  $("body").on("click", ".my-jFiler-item-trash", function () {
    var id = $(this).data("id");
    var folder = $(this).data("folder");
    var str = id + "," + folder;
    confirmDialog("delete-filer", LANG["bancochacmuonxoahinhanhnay"], str);
  });

  /* Delete all filer */
  $("body").on("click", ".delete-all-filer", function () {
    var folder = $(".folder-filer").val();
    confirmDialog(
      "delete-all-filer",
      LANG["bancochacmuonxoacachinhanhdachon"],
      folder,
    );
  });

  /* Hash upload multi filer */
  $("form.validation-form").append(
    '<input type="hidden" name="hash" value="' + HASH + '" />',
  );
  $("#filer-gallery").attr({
    "data-params": BASE64_QUERY_STRING,
    "data-hash": HASH,
  });

  /* Change info filer */
  $("body").on("change", ".my-jFiler-item-info", function () {
    var id = $(this).data("id");
    var info = $(this).data("info");
    var value = $(this).val();
    var id_parent = ID;
    var com = COM;
    var kind = ACT;
    var type = TYPE;
    var colfiler = $(".col-filer").val();
    var actfiler = $(".act-filer").val();
    var cmd = "info";

    $.ajax({
      type: "POST",
      dataType: "html",
      url: "api/filer.php",
      async: false,
      data: {
        id: id,
        id_parent: id_parent,
        info: info,
        value: value,
        com: com,
        kind: actfiler,
        type: type,
        colfiler: colfiler,
        cmd: cmd,
        hash: HASH,
      },
      success: function (result) {
        destroySortFiler();
        $("#jFilerSortable").html(result);
        createSortFiler();
      },
    });

    return false;
  });

  /* Filer */
  if ($("#filer-gallery").length) {
    createSortFiler();
    $("#filer-gallery").filer({
      limit: null,
      maxSize: null,
      extensions: [
        "jpg",
        "png",
        "jpeg",
        "JPG",
        "PNG",
        "JPEG",
        "Png",
        "webp",
        "WEBP",
      ],
      changeInput:
        '<div class="jFiler-input-dragDrop"><div class="jFiler-input-inner"><div class="jFiler-input-icon"><i class="icon-jfi-cloud-up-o"></i></div><div class="jFiler-input-text"><h3>' +
        LANG["keovathahinhvaoday"] +
        '</h3> <span style="display:inline-block; margin: 15px 0">' +
        LANG["hoac"] +
        '</span></div><a class="jFiler-input-choose-btn blue">' +
        LANG["chonhinh"] +
        "</a></div></div>",
      theme: "dragdropbox",
      showThumbs: true,
      addMore: true,
      allowDuplicates: false,
      clipBoardPaste: false,
      dragDrop: {
        dragEnter: null,
        dragLeave: null,
        drop: null,
        dragContainer: null,
      },
      captions: {
        button: LANG["themhinh"],
        feedback: LANG["vuilongchonhinhanh"],
        feedback2: LANG["nhunghinhdaduocchon"],
        drop: LANG["keohinhvaodaydeupload"],
        removeConfirmation: LANG["banmuonloaibohinhanhnay"],
        errors: {
          filesLimit: "Chỉ được upload mỗi lần {{fi-limit}} " + LANG["hinhanh"],
          filesType:
            LANG["chihotrotaptinlahinhanhcodinhdang"] + ": {{fi-extensions}}",
          filesSize:
            LANG["hinhanh"] +
            " {{fi-name}} " +
            LANG["cokichthuocqualonvuilonguploadhinhanhcokichthuoctoida"] +
            " {{fi-maxSize}} MB.",
          filesSizeAll:
            LANG[
              "nhunghinhanhbanchoncokichthuocqualonvuilongchonnhunghinhanhcokichthuoctoida"
            ] + " {{fi-maxSize}} MB.",
        },
      },
      afterShow: function () {
        var jFilerItems = $(
          ".my-jFiler-items .jFiler-items-list li.jFiler-item",
        );
        var jFilerItemsLength = 0;
        var jFilerItemsLast = 0;
        if (jFilerItems.length) {
          jFilerItemsLength = jFilerItems.length;
          jFilerItemsLast = parseInt(
            jFilerItems.last().find("input[type=number]").val(),
          );
        }
        $(".jFiler-items-list li.jFiler-item").each(function (index) {
          var colClass = $(".col-filer").val();
          var parent = $(this).parent();
          if (!parent.is("#jFilerSortable")) {
            jFilerItemsLast += 1;
            $(this).find("input[type=number]").val(jFilerItemsLast);
          }
          if (!$(this).hasClass(colClass))
            $("li.jFiler-item").addClass(colClass);
        });
      },
      uploadFile: {
        url: "api/upload.php",
        data: $("#filer-gallery").data(),
        type: "POST",
        enctype: "multipart/form-data",
        dataType: "json",
        async: false,
        beforeSend: function () {
          holdonOpen();
        },
        success: function (data, el) {
          data = JSON.parse(data);
          if (data["success"] == true) {
            var parent = el.find(".jFiler-jProgressBar").parent();
            el.find(".jFiler-jProgressBar").fadeOut("slow", function () {
              $(
                '<div class = "jFiler-item-others text-success"><i class = "icon-jfi-check-circle"></i> Success</div>',
              )
                .hide()
                .appendTo(parent)
                .fadeIn("slow");
            });
          } else {
            var parent = el.find(".jFiler-jProgressBar").parent();
            el.find(".jFiler-jProgressBar").fadeOut("slow", function () {
              $(
                '<div class = "jFiler-item-others text-error"><i class = "icon-jfi-minus-circle"></i> Error</div>',
              )
                .hide()
                .appendTo(parent)
                .fadeIn("slow");
            });
          }
        },
        error: function (el) {
          var parent = el.find(".jFiler-jProgressBar").parent();
          el.find(".jFiler-jProgressBar").fadeOut("slow", function () {
            $(
              '<div class = "jFiler-item-others text-error"><i class = "icon-jfi-minus-circle"></i> Error</div>',
            )
              .hide()
              .appendTo(parent)
              .fadeIn("slow");
          });
        },
        onComplete: function () {
          refreshFiler();
          if ($(".my-jFiler-item-info").length) {
            $(".jFiler-items-list").first().find(".jFiler-item").remove();
            $(".my-jFiler-item-info").trigger("change");
          } else {
            refreshFilerIfEmpty();
          }
          holdonClose();
        },
        statusCode: {},
        onProgress: function () {},
      },
      templates: {
        box: '<ul class="jFiler-items-list jFiler-items-grid row scroll-bar"></ul>',
        item:
          '<li class="jFiler-item">\
	                        <div class="jFiler-item-container">\
	                            <div class="jFiler-item-inner">\
	                                <div class="jFiler-item-thumb">\
	                                    <div class="jFiler-item-status"></div>\
	                                    <div class="jFiler-item-thumb-overlay">\
	                                        <div class="jFiler-item-info">\
	                                            <div style="display:table-cell;vertical-align: middle;">\
	                                                <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name}}</b></span>\
	                                                <span class="jFiler-item-others">{{fi-size2}}</span>\
	                                            </div>\
	                                        </div>\
	                                    </div>\
	                                    {{fi-image}}\
	                                </div>\
	                                <div class="jFiler-item-assets jFiler-row">\
	                                    <ul class="list-inline pull-left">\
	                                        <li>{{fi-progressBar}}</li>\
	                                    </ul>\
	                                    <ul class="list-inline pull-right">\
	                                        <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
	                                    </ul>\
	                                </div>\
	                                <input type="number" class="form-control form-control-sm mb-1" name="numb-filer[]" placeholder="' +
          LANG["sothutu"] +
          '"/>\
	                                <input type="text" class="form-control form-control-sm" name="name-filer[]" placeholder="Tiêu đề"/>\
	                            </div>\
	                        </div>\
	                    </li>',
        itemAppend:
          '<li class="jFiler-item">\
	                            <div class="jFiler-item-container">\
	                                <div class="jFiler-item-inner">\
	                                    <div class="jFiler-item-thumb">\
	                                        <div class="jFiler-item-status"></div>\
	                                        <div class="jFiler-item-thumb-overlay">\
	                                            <div class="jFiler-item-info">\
	                                                <div style="display:table-cell;vertical-align: middle;">\
	                                                    <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name}}</b></span>\
	                                                    <span class="jFiler-item-others">{{fi-size2}}</span>\
	                                                </div>\
	                                            </div>\
	                                        </div>\
	                                        {{fi-image}}\
	                                    </div>\
	                                    <div class="jFiler-item-assets jFiler-row">\
	                                        <ul class="list-inline pull-left">\
	                                            <li><span class="jFiler-item-others">{{fi-icon}}</span></li>\
	                                        </ul>\
	                                        <ul class="list-inline pull-right">\
	                                            <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
	                                        </ul>\
	                                    </div>\
	                                    <input type="number" class="form-control form-control-sm mb-1" name="numb-filer[]" placeholder="' +
          LANG["sothutu"] +
          '"/>\
	                                	<input type="text" class="form-control form-control-sm" name="name-filer[]" placeholder="Tiêu đề"/>\
	                                </div>\
	                            </div>\
	                        </li>',
        progressBar: '<div class="bar"></div>',
        itemAppendToEnd: true,
        canvasImage: false,
        removeConfirmation: true,
        _selectors: {
          list: ".jFiler-items-list",
          item: ".jFiler-item",
          progressBar: ".bar",
          remove: ".jFiler-item-trash-action",
        },
      },
    });
  }

  /* Filer import */
  if ($("#filer-import").length) {
    $("#filer-import").filer({
      limit: null,
      maxSize: null,
      extensions: [
        "jpg",
        "png",
        "jpeg",
        "JPG",
        "PNG",
        "JPEG",
        "Png",
        "WEBP",
        "webp",
        "ico",
      ],
      changeInput:
        '<a class="jFiler-input-choose-btn border-primary btn btn-sm bg-gradient-primary text-white mb-3"><i class="fas fa-cloud-upload-alt mr-2"></i>' +
        LANG["uploadhinhanh"] +
        "</a>",
      theme: "default",
      showThumbs: true,
      addMore: true,
      allowDuplicates: false,
      clipBoardPaste: false,
      captions: {
        button: LANG["themhinh"],
        feedback: LANG["vuilongchonhinhanh"],
        feedback2: LANG["nhunghinhdaduocchon"],
        drop: LANG["keohinhvaodaydeupload"],
        removeConfirmation: LANG["banmuonloaibohinhanhnay"],
        errors: {
          filesLimit:
            LANG["chiduocuploadmoilan"] + " {{fi-limit}} " + LANG["hinhanh"],
          filesType:
            LANG["chihotrotaptinlahinhanhcodinhdang"] + ": {{fi-extensions}}",
          filesSize:
            LANG["hinhanh"] +
            " {{fi-name}} " +
            LANG["cokichthuocqualonvuilonguploadhinhanhcokichthuoctoida"] +
            " {{fi-maxSize}} MB.",
          filesSizeAll:
            LANG[
              "nhunghinhanhbanchoncokichthuocqualonvuilongchonnhunghinhanhcokichthuoctoida"
            ] + " {{fi-maxSize}} MB.",
        },
      },
      afterShow: function () {
        var jFilerItems = $(
          ".my-jFiler-items .jFiler-items-list li.jFiler-item",
        );
        var jFilerItemsLength = 0;
        var jFilerItemsLast = 0;
        if (jFilerItems.length) {
          jFilerItemsLength = jFilerItems.length;
          jFilerItemsLast = parseInt(
            jFilerItems.last().find("input[type=number]").val(),
          );
        }
        $(".jFiler-items-list li.jFiler-item").each(function (index) {
          var colClass = $(".col-filer").val();
          var parent = $(this).parent();
          if (!parent.is("#jFilerSortable")) {
            jFilerItemsLast += 1;
            $(this).find("input[type=number]").val(jFilerItemsLast);
          }
          if (!$(this).hasClass(colClass))
            $("li.jFiler-item").addClass(colClass);
        });
      },
      templates: {
        box: '<ul class="jFiler-items-list jFiler-items-grid row scroll-bar"></ul>',
        item:
          '<li class="jFiler-item">\
	                        <div class="jFiler-item-container">\
	                            <div class="jFiler-item-inner">\
	                                <div class="jFiler-item-thumb">\
	                                    <div class="jFiler-item-status"></div>\
	                                    <div class="jFiler-item-thumb-overlay">\
	                                        <div class="jFiler-item-info">\
	                                            <div style="display:table-cell;vertical-align: middle;">\
	                                                <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name}}</b></span>\
	                                                <span class="jFiler-item-others">{{fi-size2}}</span>\
	                                            </div>\
	                                        </div>\
	                                    </div>\
	                                    {{fi-image}}\
	                                </div>\
	                                <div class="jFiler-item-assets jFiler-row">\
	                                    <ul class="list-inline pull-left">\
	                                        <li>{{fi-progressBar}}</li>\
	                                    </ul>\
	                                    <ul class="list-inline pull-right">\
	                                        <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
	                                    </ul>\
	                                </div>\
	                                <input type="number" class="form-control form-control-sm mb-1" name="numb-filer[]" placeholder="' +
          LANG["sothutu"] +
          '"/>\
	                            </div>\
	                        </div>\
	                    </li>',
        itemAppend:
          '<li class="jFiler-item">\
	                            <div class="jFiler-item-container">\
	                                <div class="jFiler-item-inner">\
	                                    <div class="jFiler-item-thumb">\
	                                        <div class="jFiler-item-status"></div>\
	                                        <div class="jFiler-item-thumb-overlay">\
	                                            <div class="jFiler-item-info">\
	                                                <div style="display:table-cell;vertical-align: middle;">\
	                                                    <span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name}}</b></span>\
	                                                    <span class="jFiler-item-others">{{fi-size2}}</span>\
	                                                </div>\
	                                            </div>\
	                                        </div>\
	                                        {{fi-image}}\
	                                    </div>\
	                                    <div class="jFiler-item-assets jFiler-row">\
	                                        <ul class="list-inline pull-left">\
	                                            <li><span class="jFiler-item-others">{{fi-icon}}</span></li>\
	                                        </ul>\
	                                        <ul class="list-inline pull-right">\
	                                            <li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
	                                        </ul>\
	                                    </div>\
	                                    <input type="number" class="form-control form-control-sm mb-1" name="numb-filer[]" placeholder="' +
          LANG["sothutu"] +
          '"/>\
	                                </div>\
	                            </div>\
	                        </li>',
        progressBar: '<div class="bar"></div>',
        itemAppendToEnd: true,
        canvasImage: false,
        removeConfirmation: true,
        _selectors: {
          list: ".jFiler-items-list",
          item: ".jFiler-item",
          progressBar: ".bar",
          remove: ".jFiler-item-trash-action",
        },
      },
    });
  }

  /* Ckeditor */
  // if ($('.form-control-ckeditor').length) {
  // 	CKEDITOR.editorConfig = function (config) {

  // 		/* Config General */
  // 		config.language = 'vi';
  // 		config.skin = 'moono-lisa';
  // 		config.width = 'auto';
  // 		config.height = 620;

  // 		/* Allow element */
  // 		config.allowedContent = true;

  // 		/* Entities */
  // 		config.entities = false;
  // 		config.entities_latin = false;
  // 		config.entities_greek = false;
  // 		config.basicEntities = false;

  // 		/* Config CSS */
  // 		config.contentsCss = [CONFIG_BASE + ADMIN + '/ckeditor/contents.css'];

  // 		/* All Plugins */
  // 		config.extraPlugins = 'texttransform,copyformatting,html5video,html5audio,flash,youtube,wordcount,tableresize,widget,lineutils,clipboard,dialog,dialogui,widgetselection,lineheight,video,videodetector';

  // 		/* Config Lineheight */
  // 		config.line_height = '1;1.1;1.2;1.3;1.4;1.5;2;2.5;3;3.5;4;4.5;5';

  // 		/* Config Word */
  // 		config.pasteFromWordRemoveFontStyles = false;
  // 		config.pasteFromWordRemoveStyles = false;

  // 		/* Config ELFinder */
  // 		config.filebrowserBrowseUrl = 'elfinder/index.php';

  // 		/* Config ToolBar */
  // 		config.toolbar = [
  // 			{ name: 'document', items: ['Source', '-', 'NewPage', 'Preview', 'Print', '-', 'Templates'] },
  // 			{ name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', 'PasteFromExcel', '-', 'Undo', 'Redo'] },
  // 			{ name: 'editing', items: ['Find', 'Replace', '-', 'SelectAll', '-', 'Scayt'] },
  // 			{ name: 'forms', items: ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'] },
  // 			'/',
  // 			{ name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat'] },
  // 			{ name: 'texttransform', items: ['TransformTextToUppercase', 'TransformTextToLowercase', 'TransformTextCapitalize', 'TransformTextSwitcher'] },
  // 			{ name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language'] },
  // 			{ name: 'links', items: ['Link', 'Unlink', 'Anchor'] },
  // 			{ name: 'insert', items: ['Image', 'Flash', 'Youtube', 'VideoDetector', 'Html5video', 'Video', 'Html5audio', 'Iframe', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak'] },
  // 			'/',
  // 			{ name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize', 'lineheight'] },
  // 			{ name: 'colors', items: ['TextColor', 'BGColor'] },
  // 			{ name: 'tools', items: ['Maximize', 'ShowBlocks'] },
  // 			{ name: 'about', items: ['About'] }
  // 		];

  // 		/* Config StylesSet */
  // 		config.stylesSet = [
  // 			{ name: 'Font Seguoe Regular', element: 'span', attributes: { 'class': 'segui' } },
  // 			{ name: 'Font Seguoe Semibold', element: 'span', attributes: { 'class': 'seguisb' } },
  // 			{ name: 'Italic title', element: 'span', styles: { 'font-style': 'italic' } },
  // 			{ name: 'Special Container', element: 'div', styles: { 'background': '#eee', 'border': '1px solid #ccc', 'padding': '5px 10px' } },
  // 			{ name: 'Big', element: 'big' },
  // 			{ name: 'Small', element: 'small' },
  // 			{ name: 'Inline ', element: 'q' },
  // 			{ name: 'marker', element: 'span', attributes: { 'class': 'marker' } }
  // 		];

  // 		/* Config Wordcount */
  // 		config.wordcount = {
  // 			showParagraphs: true,
  // 			showWordCount: true,
  // 			showCharCount: true,
  // 			countSpacesAsChars: false,
  // 			countHTML: false,
  // 			filter: new CKEDITOR.htmlParser.filter({
  // 				elements: {
  // 					div: function (element) {
  // 						if (element.attributes.class == 'mediaembed') {
  // 							return false;
  // 						}
  // 					}
  // 				}
  // 			})
  // 		};
  // 	};
  // }

  /* apexMixedChart */
  if ($("#apexMixedChart").length) {
    var apexMixedChart;
    var options = {
      colors: ["#f7ee2d"],
      chart: {
        id: "apexMixedChart",
        height: 340,
        type: "line",
        dropShadow: {
          enabled: true,
          color: "#FFD04D",
          top: 18,
          left: 7,
          blur: 20,
          opacity: 0.4,
        },
      },
      series: [
        {
          name: "Thống kê truy cập tháng " + CHARTS["month"],
          type: "line",
          data: CHARTS["series"],
        },
      ],
      stroke: {
        curve: "smooth",
      },
      grid: {
        borderColor: "#e7e7e7",
        row: {
          colors: ["#f3f3f3", "transparent"],
          opacity: 0.5,
        },
      },
      markers: {
        size: 1,
      },
      dataLabels: {
        enabled: false,
      },
      labels: CHARTS["labels"],
      legend: {
        position: "top",
        horizontalAlign: "right",
        floating: true,
        offsetY: -25,
        offsetX: -5,
      },
    };

    apexMixedChart = new ApexCharts(
      document.querySelector("#apexMixedChart"),
      options,
    );
    apexMixedChart.render();
  }
  // Post 8200
  // if ($('.translate-with-ai').length) {
  // 	$('.translate-with-ai').on('click', function (event) {
  // 		event.preventDefault();
  // 		const btn = $(this);
  // 		const title = $('#namevi').val();
  // 		const desc = $('#descvi').val();
  // 		const content = $('#contentvi').val();
  // 		btn.text('Đang tạo nội dung...').prop('disabled', true);

  // 		$.ajax({
  // 			url: 'api/translate.php',
  // 			type: 'POST',
  // 			data: {
  // 				title: title,
  // 				desc: desc,
  // 				content: content
  // 			},
  // 			success: function (response) {
  // 				response = JSON.parse(response);
  // 				if (response.error === true) {
  // 					alert(response.message);
  // 				} else {
  // 					// let rawJsonString = response.result.replace(/^```json\s*/, '').replace(/^json\s*/, '').replace(/\s*```$/, '');
  // 					let resultObj = response.result;

  // 					if (resultObj.title) $('#nameen').val(resultObj.title).trigger('change');
  // 					if (resultObj.description) {
  // 						if (CKEDITOR.instances['descen']) {
  // 							CKEDITOR.instances['descen'].setData(resultObj.description);
  // 						} else {
  // 							$('#descen').val(resultObj.description);
  // 						}
  // 					}
  // 					if (resultObj.content) {
  // 						if (CKEDITOR.instances['contenten']) {
  // 							CKEDITOR.instances['contenten'].setData(resultObj.content);
  // 						} else {
  // 							$('#contenten').val(resultObj.content);
  // 						}
  // 					}
  // 				}
  // 			},
  // 			complete: function () {
  // 				btn.text('Dịch AI').prop('disabled', false);
  // 				// Tắt active hiện tại
  // 				const targetId = '#tabs-lang-en';
  // 				$('#custom-tabs-trans-tab-lang .nav-link').removeClass('active').attr('aria-selected', 'false');
  // 				$('#custom-tabs-trans-tabContent-lang .tab-pane').removeClass('show active');

  // 				// Bật tab mới
  // 				$('#custom-tabs-trans-tab-lang .nav-link[href="' + targetId + '"]').addClass('active').attr('aria-selected', 'true');
  // 				$('#custom-tabs-trans-tabContent-lang ' + targetId).addClass('show active');
  // 			}
  // 		});

  // 	});
  // }

  // if ($('.content-with-ai').length) {
  // 	let aiLang = '', aiCom = '', aiTitle = '';
  // 	$('.content-with-ai').on('click', function (event) {
  // 		event.preventDefault();
  // 		const btn = $(this);
  // 		aiLang = btn.attr('data-lang');
  // 		aiCom = btn.attr('data-com');
  // 		aiTitle = $('#name' + aiLang).val();
  // 		console.log(aiTitle);
  // 		$('#ai-title').val(aiTitle);
  // 		$('#aiContentModal').modal('show');
  // 	});

  // 	// Khi nhấn "Tạo nội dung"
  // 	$('#generate-ai-content').on('click', function () {
  // 		const style = $('#ai-style').val();
  // 		const lang = $('#ai-lang').val();
  // 		const keywords = $('#ai-keywords').val();
  // 		const words = $('#ai-words').val();
  // 		const desc = $('#ai-desc').val();
  // 		const colorH2 = $('#ai-colorH2').val();
  // 		const showProduct = $('#show-product').is(':checked');
  // 		const showService = $('#show-service').is(':checked');
  // 		const showContact = $('#show-contact').is(':checked');

  // 		const btn = $(this).text('Đang tạo nội dung...').prop('disabled', true);

  // 		$.ajax({
  // 			url: 'api/content.php',
  // 			type: 'POST',
  // 			data: {
  // 				lang: lang,
  // 				com: aiCom,
  // 				title: aiTitle,
  // 				desc: desc,
  // 				style: style,
  // 				keywords: keywords,
  // 				words: words,
  // 				colorH2: colorH2,
  // 				showProduct: showProduct,
  // 				showService: showService,
  // 				showContact: showContact
  // 			},
  // 			success: function (response) {
  // 				response = JSON.parse(response);
  // 				if (response.error === true) {
  // 					alert(response.message);
  // 				} else {
  // 					CKEDITOR.instances['content' + aiLang].setData(response.result);
  // 					$('#aiContentModal').modal('hide');
  // 				}
  // 			},
  // 			complete: function () {
  // 				btn.text('Tạo nội dung').prop('disabled', false);
  // 			}
  // 		});
  // 	});
  // }
  if ($(".translate-with-ai").length) {
    $(".translate-with-ai").on("click", function (event) {
      event.preventDefault();
      const btn = $(this);

      const slug = $("#slugvi").val();
      const title = $("#namevi").val();
      const desc = $("#descvi").val();
      const content = $("#contentvi").val();

      // Validate bắt buộc
      if (!title || !title.trim()) {
        showNotify(
          "Vui lòng nhập tiêu đề tiếng Việt",
          LANG["thongbao"],
          "error",
        );
        return;
      }

      if (!content || !content.trim()) {
        showNotify(
          "Vui lòng nhập nội dung tiếng Việt",
          LANG["thongbao"],
          "error",
        );
        return;
      }

      btn.text("Đang tạo nội dung...").prop("disabled", true);

      $.ajax({
        url: "api/translate_new.php",
        type: "POST",
        dataType: "json", // ✅ thêm dòng này
        data: { slug, title, desc, content },

        success: function (response) {
          // ✅ KHÔNG JSON.parse nữa
          if (response && response.error) {
            showNotify(
              response.message || "Có lỗi xảy ra",
              LANG["thongbao"],
              "error",
            );
            return;
          }

          const translations = response?.data?.translations || {};

          // Lặp qua từng ngôn ngữ và cập nhật vào các field tương ứng
          for (const [langCode, langData] of Object.entries(translations)) {
            // Thông báo cho từng ngôn ngữ
            if (langData.error) {
              showNotify(
                `[${langCode.toUpperCase()}] ${langData.message}`,
                LANG["thongbao"],
                "error",
              );
              continue;
            }
            // Cập nhật đường dẫn
            if (langData.slug) {
              $(`#slug${langCode}`).val(langData.slug).trigger("change");
            }

            // Cập nhật title
            if (langData.title) {
              $(`#name${langCode}`).val(langData.title).trigger("change");
            }

            // Cập nhật description
            if (langData.description !== undefined) {
              if (CKEDITOR.instances[`desc${langCode}`]) {
                CKEDITOR.instances[`desc${langCode}`].setData(
                  langData.description || "",
                );
              } else {
                $(`#desc${langCode}`).val(langData.description || "");
              }
            }

            // Cập nhật content
            if (langData.content !== undefined) {
              if (CKEDITOR.instances[`content${langCode}`]) {
                CKEDITOR.instances[`content${langCode}`].setData(
                  langData.content || "",
                );
              } else {
                $(`#content${langCode}`).val(langData.content || "");
              }
            }

            // Thông báo thành công cho ngôn ngữ này
            showNotify(
              `[${langCode.toUpperCase()}] Dịch thành công!`,
              LANG["thongbao"],
              "success",
            );
          }
        },

        error: function (xhr) {
          let msg = "Lỗi khi gọi API";
          try {
            const j = xhr.responseJSON || JSON.parse(xhr.responseText);
            msg = j.message || msg;
          } catch (e) {}
          showNotify(msg, LANG["thongbao"], "error");
        },

        complete: function () {
          btn.text("Dịch AI").prop("disabled", false);
        },
      });
    });
  }

  if ($(".content-with-ai").length) {
    let aiLang = "",
      aiCom = "",
      aiTitle = "";
    $(".content-with-ai").on("click", function (event) {
      event.preventDefault();
      const btn = $(this);
      aiLang = btn.attr("data-lang");
      aiCom = btn.attr("data-com");
      aiTitle = $("#name" + aiLang).val();
      console.log(aiTitle);
      $("#ai-title").val(aiTitle);
      $("#aiContentModal").modal("show");
    });

    // Khi nhấn "Tạo nội dung"
    $("#generate-ai-content").on("click", function () {
      const style = $("#ai-style").val();
      const lang = $("#ai-lang").val();
      const keywords = $("#ai-keywords").val();
      const words = $("#ai-words").val();
      const desc = $("#ai-desc").val();
      const colorH2 = $("#ai-colorH2").val();
      const showProduct = $("#show-product").is(":checked");
      const showService = $("#show-service").is(":checked");
      const showContact = $("#show-contact").is(":checked");

      const btn = $(this).text("Đang tạo nội dung...").prop("disabled", true);

      $.ajax({
        url: "api/content_new.php",
        type: "POST",
        data: {
          lang: lang,
          com: aiCom,
          title: aiTitle,
          desc: desc,
          style: style,
          keywords: keywords,
          words: words,
          colorH2: colorH2,
          showProduct: showProduct,
          showService: showService,
          showContact: showContact,
        },
        success: function (response) {
          response = JSON.parse(response);
          if (response.error === true) {
            showNotify(response.message, LANG["thongbao"], "error");
          } else {
            CKEDITOR.instances["content" + aiLang].setData(response.result);
            $("#aiContentModal").modal("hide");
          }
        },
        complete: function () {
          btn.text("Tạo nội dung").prop("disabled", false);
        },
      });
    });
  }
  if ($(".slugchange2").length) {
    $(".slugchange2").on("click", function (event) {
      event.preventDefault();
      const btn = $(this);
      const slug = $("#slugvi").val();
      const title = $("#namevi").val();

      // Validate bắt buộc
      if (!title || !title.trim()) {
        showNotify(
          "Vui lòng nhập tiêu đề tiếng Việt",
          LANG["thongbao"],
          "error",
        );
        return;
      }

      btn.text("Đang tạo slug...").prop("disabled", true);

      $.ajax({
        url: "api/translate_slug.php",
        type: "POST",
        dataType: "json", // ✅ thêm dòng này
        data: { slug, title },

        success: function (response) {
          // ✅ KHÔNG JSON.parse nữa
          if (response && response.error) {
            showNotify(
              response.message || "Có lỗi xảy ra",
              LANG["thongbao"],
              "error",
            );
            return;
          }

          const translations = response?.data?.translations || {};

          // Lặp qua từng ngôn ngữ và cập nhật vào các field tương ứng
          for (const [langCode, langData] of Object.entries(translations)) {
            // Thông báo cho từng ngôn ngữ
            if (langData.error) {
              showNotify(
                `[${langCode.toUpperCase()}] ${langData.message}`,
                LANG["thongbao"],
                "error",
              );
              continue;
            }
            // Cập nhật đường dẫn
            if (langData.slug) {
              $(`#slug${langCode}`).val(langData.slug).trigger("change");
            }

            // Cập nhật title
            if (langData.title) {
              $(`#name${langCode}`).val(langData.title).trigger("change");
            }
            // Thông báo thành công cho ngôn ngữ này
            showNotify(
              `[${langCode.toUpperCase()}] Lấy Slug thành công!`,
              LANG["thongbao"],
              "success",
            );
          }
        },

        error: function (xhr) {
          let msg = "Lỗi khi gọi API";
          try {
            const j = xhr.responseJSON || JSON.parse(xhr.responseText);
            msg = j.message || msg;
          } catch (e) {}
          showNotify(msg, LANG["thongbao"], "error");
        },

        complete: function () {
          btn.text("Lấy Slug").prop("disabled", false);
        },
      });
    });
  }

  if ($("#add-option").length) {
    let indexOpt = $("#options-table tbody tr").length + 1;
    // Thêm lựa chọn
    $("#add-option").on("click", function () {
      let template = $("#option-template").html();
      template = template.replace(/__i__/g, indexOpt); // thay __i__ bằng số indexOpt
      let newRow = $(template);
      $("#options-table tbody").append(newRow);
      jscolor.install();
      indexOpt++;
    });

    // Xóa lựa chọn
    $("body").on("click", ".remove-option", function () {
      $(this).closest("tr").remove();
      indexOpt--;
    });
  }

  if ($("#id_attr").length) {
    let variantData = VARIANT_DATA; // Lưu dữ liệu nhập

    // Khi chọn thuộc tính
    $("#id_attr").on("change", function () {
      let selected = $(this).val() || [];
      $("#attribute-options .attr-options").addClass("d-none");

      $("#attribute-options .attr-options").each(function () {
        let attrId = $(this).attr("id").replace("attr-", "");
        if (selected.includes(attrId)) {
          $(this).removeClass("d-none");
        } else {
          // Ẩn và clear data để không submit
          $(this)
            .addClass("d-none")
            .find("select, input")
            .val("")
            .prop("checked", false);
        }
      });
      buildVariantCards();
    });

    // Khi chọn option của 1 attribute
    $(document).on("change", ".attr-select", function () {
      let $select = $(this);
      let attrId = $(this).data("attr");
      let selected = $(this).val() || [];

      let $container = $("#option-images-" + attrId);

      // Xóa các input không còn trong selected
      $container.find(".option-image-item").each(function () {
        let val = $(this).data("value");
        if (!selected.includes(val)) {
          $(this).remove();
        }
      });

      // Thêm input mới cho option vừa chọn
      selected.forEach(function (opt) {
        if (
          $container.find('.option-image-item[data-value="' + opt + '"]')
            .length === 0
        ) {
          let tpl = $("#option-image-template").html();
          let optKey = opt;
          let optLabel = $select.find('option[value="' + opt + '"]').text();
          let optColor = $select
            .find('option[value="' + opt + '"]')
            .attr("data-option-color");
          tpl = tpl
            .replace(/__ATTR__/g, attrId)
            .replace(/__OPTION_COLOR__/g, optColor)
            .replace(/__OPTION__/g, optLabel)
            .replace(/__VALUE__/g, optKey);
          $container.append(tpl);
        }
      });
      buildVariantCards();
    });
    $(document).on(
      "input",
      'input[name^="variants"][name$="[price]"], input[name^="variants"][name$="[discount]"], input[name^="variants"][name$="[percent]"]',
      function () {
        let $row = $(this).closest(".row, .variant-card"); // wrapper mỗi variant

        let $price = $row.find('input[name$="[price]"]');
        let $discount = $row.find('input[name$="[discount]"]');
        let $percent = $row.find('input[name$="[percent]"]');

        let price = toNumber($price.val());
        let discount = toNumber($discount.val());
        let percent = toNumber($percent.val());

        // Nếu thay đổi ở ô discount
        if ($(this).is($discount)) {
          if (price > 0 && discount > 0 && discount < price) {
            percent = Math.round(((price - discount) / price) * 100);
            $percent.val(percent);
          } else {
            $percent.val(0);
          }
        }

        // Nếu thay đổi ở ô percent
        if ($(this).is($percent)) {
          if (price > 0 && percent > 0 && percent <= 100) {
            discount =
              Math.ceil((price - (price * percent) / 100) / 1000) * 1000;
            $discount.val(discount);
          } else {
            $discount.val("");
          }
        }

        // Nếu thay đổi ở ô price → tính lại discount dựa trên percent
        if ($(this).is($price)) {
          if (price > 0 && percent > 0) {
            discount =
              Math.ceil((price - (price * percent) / 100) / 1000) * 1000;
            $discount.val(discount);
          }
        }
        // Sau khi gán lại → format lại các ô giá
        $(".format-price").priceFormat({
          limit: 13,
          prefix: "",
          centsLimit: 0,
        });
      },
    );

    $(document).on(
      "click",
      ".option-image-item img.preview, .form-group img.preview",
      function () {
        $(this)
          .closest(".option-image-item, .form-group")
          .find(".file-input")
          .click();
      },
    );

    $(document).on(
      "click",
      ".option-image-item .remove, .form-group .remove",
      function () {
        let $item = $(this).closest(".option-image-item, .form-group");
        $item.find("img.preview").attr("src", "assets/images/noimage.png");
        $item.find(".file-input").val("");
        $item.find(".image-input").val("");
      },
    );

    $(document).on(
      "change",
      ".option-image-item .file-input, .variant-card .file-input",
      function () {
        let input = this;
        let $item = $(input).closest(".option-image-item, .form-group");
        if (input.files && input.files[0]) {
          let reader = new FileReader();
          reader.onload = function (e) {
            $item.find("img.preview").attr("src", e.target.result);
          };
          reader.readAsDataURL(input.files[0]);
        }
      },
    );

    // Hàm build bảng tổ hợp
    function buildVariantCards() {
      // Lưu lại dữ liệu cũ
      // $('#variant-cards .variant-card').each(function () {
      // 	let key = $(this).data('key');
      // 	variantData[key] = {
      // 		sku: $(this).find('input[name$="[sku]"]').val(),
      // 		price: $(this).find('input[name$="[price]"]').val(),
      // 		discount: $(this).find('input[name$="[discount]"]').val(),
      // 		weight: $(this).find('input[name$="[weight]"]').val(),
      // 		percent: $(this).find('input[name$="[percent]"]').val(),
      // 		sort: $(this).find('input[name$="[sort]"]').val()
      // 	};
      // });
      $("#variant-cards .variant-card").each(function () {
        let key = $(this).data("key");
        let skuVal = $(this).find('input[name$="[sku]"]').val();
        let comboVal = $(this).find('input[name$="[comboName]"]').val();

        // giữ như cũ
        variantData[key] = variantData[key] || {};
        variantData[key].sku = skuVal;
        variantData[key].comboName = comboVal;

        // NEW: lưu sku theo kích thước (data-size-key sẽ set ở dưới)
        let sizeKey = $(this).data("sizeKey");
        if (sizeKey) {
          variantData["skuBySize"] = variantData["skuBySize"] || {};
          variantData["skuBySize"][sizeKey] = skuVal;
          variantData.comboBySize = variantData.comboBySize || {};
          variantData.comboBySize[sizeKey] = comboVal;
        }

        // các field khác vẫn theo key (nếu bạn muốn)
        variantData[key].price = $(this).find('input[name$="[price]"]').val();
        variantData[key].discount = $(this)
          .find('input[name$="[discount]"]')
          .val();
        variantData[key].weight = $(this).find('input[name$="[weight]"]').val();
        variantData[key].percent = $(this)
          .find('input[name$="[percent]"]')
          .val();
        variantData[key].sort = $(this).find('input[name$="[sort]"]').val();
      });

      let groups = [];
      $(".attr-select").each(function () {
        let $select = $(this);
        let attrName = $(this).data("attr-name");
        let values = $(this).val() || [];
        if (values.length > 0) {
          // groups.push(values.map(v => ({attrName, value: v})));
          groups.push(
            values.map((v) => {
              let label = $select.find('option[value="' + v + '"]').text();
              return { attrName, value: v, label: label };
            }),
          );
        }
      });

      if (groups.length === 0) {
        $("#variant-cards").html("");
        return;
      }

      let combinations = cartesian(groups);
      if (combinations.length > 200) {
        alert(
          "Quá nhiều tổ hợp (" +
            combinations.length +
            "). Hãy giới hạn lại số option.",
        );
        return;
      }

      let html = "";
      function escAttr(str) {
        return String(str ?? "")
          .replace(/&/g, "&amp;")
          .replace(/"/g, "&quot;")
          .replace(/'/g, "&#39;")
          .replace(/</g, "&lt;")
          .replace(/>/g, "&gt;");
      }
      combinations.forEach((combo, i) => {
        let comboArr = Array.isArray(combo) ? combo : [combo];
        let key = comboArr.map((c) => c.value).join("|");
        let label = comboArr
          .map((c) => `${c.attrName}: ${c.label}`)
          .join(" - ");
        let old = variantData[key] || {};
        let sizeItem = comboArr.find((c) => c.attrName === "Kích thước");
        let sizeKey = sizeItem ? sizeItem.value : "";
        let skuBySize =
          variantData.skuBySize && sizeKey
            ? variantData.skuBySize[sizeKey]
            : "";
        let skuValue = skuBySize || old.sku || "";
        let comboBySize =
          variantData.comboBySize && sizeKey
            ? variantData.comboBySize[sizeKey]
            : "";
        let comboNameValue = comboBySize || old.comboName || "";

        let optionInputs = "";
        comboArr.forEach((opt) => {
          optionInputs += `<input type="hidden" name="variant_options[${key}][]" value="${opt.value}">`;
        });
        let imageHtml = "assets/images/noimage.png";
        let imageInput = "";
        if (old.image) {
          imageInput = `<input type="hidden" name="variants[${key}][image]" value="${old.image}" class="image-input"></input>`;
          imageHtml = UPLOAD_PRODUCT + old.image;
        }

        let tpl = $("#variant-card-template").html();
        tpl = tpl
          .replace(/__KEY__/g, key)
          .replace(/__ID__/g, i)
          .replace(/__LABEL__/g, label)
          // .replace(/__SKU__/g, old.sku || '')
          .replace(/__SKU__/g, skuValue)
          .replace(/__COMBO_NAME__/g, old.comboName || escAttr(comboNameValue))
          .replace(/__PRICE__/g, old.price || 0)
          .replace(/__DISCOUNT__/g, old.discount || 0)
          .replace(/__WEIGHT__/g, old.weight || 0)
          .replace(/__PERCENT__/g, old.percent || 0)
          .replace(/__SORT__/g, old.sort || 0)
          .replace(/__VARIANT_OPTIONS__/g, optionInputs || "")
          .replace(/__INPUT_IMAGE__/g, imageInput)
          .replace(/__IMAGE__/g, imageHtml)
          .replace(/__SIZEKEY__/g, sizeKey);

        html += tpl;
      });

      $("#variant-cards").html(html);
      $(".format-price").priceFormat({
        limit: 13,
        prefix: "",
        centsLimit: 0,
      });
    }

    function cartesian(arr) {
      if (arr.length === 1) return arr[0];
      return arr.reduce((a, b) =>
        a.flatMap((d) => b.map((e) => [].concat(d, e))),
      );
    }
    buildVariantCards();
  }
  if ($("select#id_danhmuc").length) {
    $(document).on("change", "#id_danhmuc", function () {
      let sumo = this.sumo;
      let $select = $(this);

      // 1) Khi chọn con -> auto chọn cha (gắn cờ autoselect)
      $select.find("option:selected").each(function () {
        let parent = $(this).data("parent");
        while (parent) {
          let $parentOpt = $select.find('option[value="' + parent + '"]');
          if ($parentOpt.length === 0) break;

          if (!$parentOpt.is(":selected")) {
            sumo.selectItem($parentOpt.index());
            $parentOpt.attr("data-autoselect", "1"); // đánh dấu là auto
          }

          parent = $parentOpt.data("parent");
        }
      });

      // 2) Nếu cha được auto chọn mà không còn con nào -> bỏ cha
      $select.find('option[data-autoselect="1"]').each(function () {
        let val = $(this).val();
        let $children = $select.find('option[data-parent="' + val + '"]');
        let anySelected = $children.filter(":selected").length > 0;

        if (!anySelected) {
          sumo.unSelectItem($(this).index());
          $(this).removeAttr("data-autoselect");
        }
      });
    });
  }
});
