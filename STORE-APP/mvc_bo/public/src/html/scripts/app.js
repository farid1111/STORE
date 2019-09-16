(function ($) {
  'use strict';

  window.app = {
    name: 'Flatkit',
    version: '1.1.3',
    // for chart colors
    color: {
      'primary': '#0cc2aa',
      'accent': '#a88add',
      'warn': '#fcc100',
      'info': '#6887ff',
      'success': '#6cc788',
      'warning': '#f77a99',
      'danger': '#f44455',
      'white': '#ffffff',
      'light': '#f1f2f3',
      'dark': '#2e3e4e',
      'black': '#2a2b3c'
    },
    setting: {
      theme: {
        primary: 'primary',
        accent: 'accent',
        warn: 'warn'
      },
      color: {
        primary: '#0cc2aa',
        accent: '#a88add',
        warn: '#fcc100'
      },
      folded: false,
      boxed: false,
      container: false,
      themeID: 1,
      bg: ''
    }
  };

  var setting = 'jqStorage-' + app.name + '-Setting',
    storage = $.localStorage;

  if (storage.isEmpty(setting)) {
    storage.set(setting, app.setting);
  } else {
    app.setting = storage.get(setting);
  }
  var v = window.location.search.substring(1).split('&');
  for (var i = 0; i < v.length; i++) {
    var n = v[i].split('=');
    app.setting[n[0]] = (n[1] == "true" || n[1] == "false") ? (n[1] == "true") : n[1];
    storage.set(setting, app.setting);
  }

  // init
  function setTheme() {

    $('body').removeClass($('body').attr('ui-class')).addClass(app.setting.bg).attr('ui-class', app.setting.bg);
    app.setting.folded ? $('#aside').addClass('folded') : $('#aside').removeClass('folded');
    app.setting.boxed ? $('body').addClass('container') : $('body').removeClass('container');

    $('.switcher input[value="' + app.setting.themeID + '"]').prop('checked', true);
    $('.switcher input[value="' + app.setting.bg + '"]').prop('checked', true);

    $('[data-target="folded"] input').prop('checked', app.setting.folded);
    $('[data-target="boxed"] input').prop('checked', app.setting.boxed);

  }

  // click to switch
  $(document).on('click.setting', '.switcher input', function (e) {
    var $this = $(this), $target;
    $target = $this.parent().attr('data-target') ? $this.parent().attr('data-target') : $this.parent().parent().attr('data-target');
    app.setting[$target] = $this.is(':checkbox') ? $this.prop('checked') : $(this).val();
    ($(this).attr('name') == 'color') && (app.setting.theme = eval('[' + $(this).parent().attr('data-value') + ']')[0]) && setColor();
    storage.set(setting, app.setting);
    setTheme(app.setting);
  });

  function setColor() {
    app.setting.color = {
      primary: getColor(app.setting.theme.primary),
      accent: getColor(app.setting.theme.accent),
      warn: getColor(app.setting.theme.warn)
    };
  };

  function getColor(name) {
    return app.color[name] ? app.color[name] : palette.find(name);
  };

  function init() {
    $('[ui-jp]').uiJp();
    $('body').uiInclude();
  }

  $(document).on('pjaxStart', function () {
    $('#aside').modal('hide');
    $('body').removeClass('modal-open').find('.modal-backdrop').remove();
    $('.navbar-toggleable-sm').collapse('hide');
  });

  init();
  setTheme();


  // ======================================================================================
  // ======================================================================================
  // MY SCRIPTS:
  // ======================================================================================
  // ======================================================================================

  $(function () {
    var current = location.pathname;
    $('li a.menuChoco').each(function () {
      var $this = $(this);
      if ($this.attr('href').indexOf(current) !== -1) {
        $this.addClass('active');
      }
    })
  })


  // TOOLTIP
  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  })



  // ===========================================================
  // AJAX ADD CATEGORY
  // ===========================================================

  $('#add-category').submit(function (e) {
    e.preventDefault()
    let $form = $(this),
      cat = $form.find("input[name='cat_descr']").val(),
      url = $form.attr("action");
    let posting = $.post(url, { cat_descr: cat }, data => console.log(data, 'first success'), 'json')
      .done(data => console.log(data, "second success"))
      .fail(() => console.log("ERROR!"))
      .always((data) => {
        console.log("finished");
        let input = $("input[name='cat_descr']")[0];
        input.value = '';
        input.focus();
      });
  })

  // ===========================================================
  // AJAX DELETE CATEGORY
  // ===========================================================
  var urlCatDelete;
  var catIdDelete;
  var elemCatDelete;
  $('.categories_delete').click(function (e) {
    e.preventDefault()
    $('.tooltip').tooltip('hide');
    elemCatDelete = $(this);
    catIdDelete = $(elemCatDelete).data('id');
    urlCatDelete = $(elemCatDelete).data("link");

    $('.cat-id-confirm').html(elemCatDelete[0].dataset.id)
    $('.cat-descr-confirm').html(elemCatDelete[0].dataset.descr)
  })
  // Ajax:
  $('.modal-del').click(function (e) {
    if ($(e.currentTarget).data('modaldelete')) {
      $.post(urlCatDelete, { 'cat_id': catIdDelete }, (data) => {
        if (data.isDeleted) {
          $('.total-categories').html(data.total)
          let elem = $(elemCatDelete).parent().parent().parent().parent();
          elem.css('background', '#eceeef')
          elem.fadeOut('slow', function () {
            $(this).remove();
            $('.tooltip').tooltip('hide');
          });
        }
      }, 'json')
    }
  })


  // ===========================================================
  // AJAX UPDATE CATEGORY
  // ===========================================================
  var cats = JSON.parse(localStorage.getItem('cats'))
  $('.update-descr-input').attr('value', cats.cat_descr)

  $('.categories_update').click(function (e) {
    var el = $(this)
    let categories = {
      cat_id: el.data('id'),
      cat_descr: el.data('descr')
    };
    localStorage.setItem('cats', JSON.stringify(categories));
  })

  // Ajax:
  $('#category-update-form').submit(function (e) {
    e.preventDefault()
    let $form = $(this),
      newValue = $form.find("input[name='cat_descr']"),
      url = $form.attr("action");

    $.post(url, { 'cat_id': cats.cat_id, 'cat_descr': newValue.val() }, (data) => {
      if (data === 1) {
        console.log("Votre catégorie a bien été mise à jour!")
        console.log()
      }
    }, 'json')
      .always((data) => {
        newValue[0].value = ''
        newValue[0].focus();
      });
  })
  // ===========================================================
  // AJAX SHOW CATEGORY DETAILS
  // ===========================================================
  $('.show-cat-details').click(function (e) {
    e.preventDefault()
    var el = $(this),
      catId = $(el).data('id'),
      catDescr = $(el).data('descr');
    $('.cat-id-details').html(catId)
    $('.cat-descr-details').html(catDescr)
  })


  // ===========================================================
  // AJAX SHOW PRODUCT DETAILS
  // ===========================================================
  $('.show-product').click(function (e) {
    e.preventDefault()
    var el = $(this),
      proId = $(el).data('proid'),
      url = $(el).data("link");
    $.post(url, { pro_id: proId }, (product) => {
      $('.pro_img_url_recto').attr('src', product['pro_img_url_recto'])
      $('.pro_title').html(product['pro_title'])
      $('.pro_descr').html(product['pro_descr'])
      $('.pro_id').html(product['pro_id'])
      $('.pro_price').html(product['pro_price_euro'])
      $('.pro_date').html(new Date(product['pro_date']).toLocaleString())
    }, 'json')
  })

  // ===========================================================
  // AJAX ADD CUSTOMER
  // ===========================================================
  $('#add-customer').submit(function (e) {
    e.preventDefault()
    let $form = $(this),
      cus_civility = $form.find("input[name='cus_civility']:checked"),
      cus_lastname = $form.find("input[name='cus_lastname']"),
      cus_firstname = $form.find("input[name='cus_firstname']"),
      cus_mail = $form.find("input[name='cus_mail']"),
      cus_password = $form.find("input[name='cus_password']"),
      cus_password2 = $form.find("input[name='cus_password2']"),
      url = $form.attr("action");
    $.post(url, { cus_civility: cus_civility.val(), cus_lastname: cus_lastname.val(), cus_firstname: cus_firstname.val(), cus_mail: cus_mail.val(), cus_password: cus_password.val() },
      (data) => console.log(data.cus_lastname, 'first success'), 'json')
      .always(() => {
        console.log("finished");
        cus_lastname[0].value = ''
        cus_firstname[0].value = ''
        cus_mail[0].value = ''
        cus_password[0].value = ''
        cus_password2[0].value = ''
      });
  })

  // ===========================================================
  // AJAX DELETE CUSTOMER
  // ===========================================================
  var urlCusDel;
  var cusIdDel;
  var elemCusDel;
  var cusFnameDel;
  var cusLnameDel;
  $('.customer-delete').click(function (e) {
    e.preventDefault()
    $('.tooltip').tooltip('hide');
    elemCusDel = $(this);
    cusIdDel = $(elemCusDel).data('id');
    urlCusDel = $(elemCusDel).data("link");
    cusFnameDel = $(elemCusDel).data("firstname");
    cusLnameDel = $(elemCusDel).data("lastname");

    console.log(elemCusDel);

    $('.cus-id-confirm').html(elemCusDel[0].dataset.id)
    $('.cus-fname-confirm').html(elemCusDel[0].dataset.firstname)
    $('.cus-lname-confirm').html(elemCusDel[0].dataset.lastname)
  })

  // Ajax:
  $('.modal-cus-del').click(function (e) {
    if ($(e.currentTarget).data('modalcusdelete')) {
      $.post(urlCusDel, { 'cus_id': cusIdDel }, (data) => {
        if (data.isDeleted) {
          $('.total-customers').html(data.total)
          let elem = $(elemCusDel).parent().parent().parent().parent();
          elem.css('background', '#eceeef')
          elem.fadeOut('slow', function () {
            $(this).remove();
            $('.tooltip').tooltip('hide');
          });
        }
      }, 'json')
    }
  })
  // ===========================================================
  // AJAX SHOW DETAILS CUSTOMER
  // ===========================================================
  $('.show-cus-details').click(function (e) {
    e.preventDefault()
    var el = $(this),
      firstname = $(el).data('firstname'),
      lastname = $(el).data('lastname'),
      mail = $(el).data('mail');
    $('.cus-name-details').html(firstname + ' ' + lastname)
    $('.cus-mail-details').html(mail)
  })
  // ===========================================================
  // AJAX UPDATE CUSTOMER
  // ===========================================================
  // $('.up-cus-civility').prop('checked', true);
  var cuss = JSON.parse(localStorage.getItem('customers'))
  $('.up-cus-lastname').attr('value', cuss.cus_lastname)
  $('.up-cus-firstname').attr('value', cuss.cus_firstname)
  $('.up-cus-mail').attr('value', cuss.cus_mail)


  $('.customers-update').click(function (e) {
    let el = $(this)
    let customers = {
      cus_id: el.data('id'),
      cus_lastname: el.data('lastname'),
      cus_firstname: el.data('firstname'),
      cus_mail: el.data('mail'),
    }
    localStorage.setItem('customers', JSON.stringify(customers));


  })

  // Ajax:
  $('#customer-update-form').submit(function (e) {
    e.preventDefault()
    let $form = $(this),
      cus_civility = $form.find("input[name='cus_civility']:checked"),
      cus_lastname = $form.find("input[name='cus_lastname']"),
      cus_firstname = $form.find("input[name='cus_firstname']"),
      cus_mail = $form.find("input[name='cus_mail']"),
      cus_password = $form.find("input[name='cus_password']"),
      url = $form.attr("action");

    $.post(url, {
      'cus_id': cuss.cus_id,
      'cus_civility': cus_civility.val(),
      'cus_lastname': cus_lastname.val(),
      'cus_firstname': cus_firstname.val(),
      'cus_mail': cus_mail.val(),
      'cus_password': cus_password.val(),
    }, (data) => {
      console.log("Votre Produit a bien été mise à jour!")
    }, 'json')
      .always((data) => {
        cus_lastname[0].value = ''
        cus_firstname[0].value = ''
        cus_mail[0].value = ''
        cus_password[0].value = ''
        $('.cus-password-2').val('')
      });
  })

  // ===========================================================
  // AJAX ADD PRODUCT
  // ===========================================================
  $('#add-product').submit(function (e) {
    e.preventDefault()
    let $form = $(this),
      pro_title = $form.find("input[name='pro_title']"),
      pro_subtitle1 = $form.find("input[name='pro_subtitle1']"),
      pro_subtitle2 = $form.find("input[name='pro_subtitle2']"),
      pro_img_url_recto = $form.find("input[name='pro_img_url_recto']"),
      pro_img_url_verso = $form.find("input[name='pro_img_url_verso']"),
      pro_descr = $form.find("textarea[name='pro_descr']"),
      pro_price_euro = $form.find("input[name='pro_price_euro']"),
      url = $form.attr("action");

    $.post(url, {
      pro_title: pro_title.val(),
      pro_subtitle1: pro_subtitle1.val(),
      pro_subtitle2: pro_subtitle2.val(),
      pro_img_url_recto: pro_img_url_recto.val(),
      pro_img_url_verso: pro_img_url_verso.val(),
      pro_descr: pro_descr.val(),
      pro_price_euro: pro_price_euro.val()
    },
      (data) => console.log(data.pro_title, 'first success'), 'json')
      .always(() => {
        console.log("finished");
        pro_title[0].value = ''
        pro_subtitle1[0].value = ''
        pro_subtitle2[0].value = ''
        pro_img_url_recto[0].value = ''
        pro_img_url_verso[0].value = ''
        pro_descr[0].value = ''
        pro_price_euro[0].value = ''
      });
  })

  // ===========================================================
  // AJAX DELETE PRODUCT
  // ===========================================================

  var urlProDelete;
  var proIdDelete;
  var elemProDelete;
  $('.products-delete').click(function (e) {
    e.preventDefault()
    $('.tooltip').tooltip('hide');
    elemProDelete = $(this);
    proIdDelete = $(elemProDelete).data('proid');
    urlProDelete = $(elemProDelete).data("link");


    $('.pro-id-confirm').html(elemProDelete[0].dataset.proid)
    $('.pro-title-confirm').html(elemProDelete[0].dataset.title)
  })
  // Ajax:
  $('.modal-del').click(function (e) {
    if ($(e.currentTarget).data('modaldelete')) {
      $.post(urlProDelete, { 'pro_id': proIdDelete }, (data) => {
        if (data.isDeleted) {
          $('.total-products').html(data.total)
          let elem = $(elemProDelete).parent().parent().parent().parent();
          elem.css('background', '#eceeef')
          elem.fadeOut('slow', function () {
            $(this).remove();
            $('.tooltip').tooltip('hide');
          });
        }
      }, 'json')
    }
  })

  // ===========================================================
  // AJAX UPDATE PRODUCT
  // ===========================================================
  var pros = JSON.parse(localStorage.getItem('products'))
  $('.up-pro-title').attr('value', pros.pro_title)
  $('.up-pro-subtitle1').attr('value', pros.pro_subtitle1)
  $('.up-pro-subtitle2').attr('value', pros.pro_subtitle2)
  $('.up-pro-img-recto').attr('value', pros.pro_img_url_recto)
  $('.up-pro-img-verso').attr('value', pros.pro_img_url_verso)
  $('.up-pro-descr').html(pros.pro_descr)
  $('.up-pro-price').attr('value', pros.pro_price_euro)

  $('.products-update').click(function (e) {
    let el = $(this)
    let products = {
      pro_id: el.data('id'),
      pro_title: el.data('title'),
      pro_subtitle1: el.data('subtitle1'),
      pro_subtitle2: el.data('subtitle2'),
      pro_img_url_recto: el.data('img_url_recto'),
      pro_img_url_verso: el.data('img_url_verso'),
      pro_descr: el.data('descr'),
      pro_price_euro: el.data('price_euro'),
    }
    localStorage.setItem('products', JSON.stringify(products));
  })

  // Ajax:
  $('#product-update-form').submit(function (e) {
    e.preventDefault()
    let $form = $(this),
      pro_title = $form.find("input[name='pro_title']"),
      pro_subtitle1 = $form.find("input[name='pro_subtitle1']"),
      pro_subtitle2 = $form.find("input[name='pro_subtitle2']"),
      pro_img_url_recto = $form.find("input[name='pro_img_url_recto']"),
      pro_img_url_verso = $form.find("input[name='pro_img_url_verso']"),
      pro_descr = $form.find("textarea[name='pro_descr']"),
      pro_price_euro = $form.find("input[name='pro_price_euro']"),
      url = $form.attr("action");

    $.post(url, {
      'pro_id': pros.pro_id,
      'pro_title': pro_title.val(),
      'pro_subtitle1': pro_subtitle1.val(),
      'pro_subtitle2': pro_subtitle2.val(),
      'pro_img_url_recto': pro_img_url_recto.val(),
      'pro_img_url_verso': pro_img_url_verso.val(),
      'pro_descr': pro_descr.val(),
      'pro_price_euro': pro_price_euro.val()
    }, (data) => {
      console.log("Votre Produit a bien été mise à jour!")
    }, 'json')
      .always((data) => {
        pro_title[0].value = ''
        pro_subtitle1[0].value = ''
        pro_subtitle2[0].value = ''
        pro_img_url_recto[0].value = ''
        pro_img_url_verso[0].value = ''
        $('.textarea-update').val('')
        pro_price_euro[0].value = ''
      });
  })


})(jQuery);

