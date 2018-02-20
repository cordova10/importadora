$(function () {

    $(document).on('change', '.dev-select-page', function () {
        var $e = $(this);
        var url = $e.data('url');
        url = url.replace(/(pageSize=)[^\&]+/, '$1' + $e.val());
        if ($e.val() != '') {
            getDetails(url);
        }
    });

    $(document).on('click', '.dev-a-page', function (e) {
        e.preventDefault();
        var $e = $(this);
        var url = $e.attr('href');
        getDetails(url);
    });

    $(document).on('click', '.dev-btn-filter', function (e) {
        var $e = $(this);
        var url = $e.data('url');
        var $t = $($e.data('target'));

        if ($e.data('clear') != undefined)
            $t.val('');
        if (url.indexOf('filter') == -1)
            url += '&filter=' + $t.val();
        else
            url = url.replace(/(filter=)[^\&]+/, '$1' + $t.val());
        getDetails(url);
    });

    $(document).on('keypress', '.dev-txt-filter', function (e) {
        var $e = $(this);
        if (e.keyCode == 13) { //si presiono Enter ejecuto la peticion
            var url = $e.data('url');
            if (url.indexOf('filter') == -1)
                url += '&filter=' + $e.val();
            else
                url = url.replace(/(filter=)[^\&]+/, '$1' + $e.val());
            getDetails(url);
        }
    });

    $(document).on('click', '.dev-deleted-confirm', function (e) {
        e.preventDefault();
        var $e = $(this);
        var $d = $($e.data('target'));

        $d.modal();

    });



    //get html partial via ajax
    $('.dev-get-partial').click(function (e) {
        e.preventDefault();
        var $e = $(this);
        var $t = $($e.data('target'));
        ajax.get($e.data('url'), null, $e, function (data) {
            $t.find('.modal-body').empty().append(data);
            console.log($t.find('.modal-body').html());
            $t.modal();
        });
    });


    if ($('.dev-autocomplete-select').length > 0)
        $('.dev-autocomplete-select').select2();

    $('.dev-autocomplete-select').change(function () {
        var $d = $(this);
        if ($d.data('target') !== '' || $d.data('target') !== undefined)
            $($d.data('target')).val($d.val());
    });

    $('.dev-tipo-divisa').change(function () {
        var $d = $(this);
        var tasa = '';
        if ($d.val() == 'V') { //venta
            $('#dev-destino-div').show();
            $('#dev-origen-div').hide();
            tasa = $d.data('tasaventa');
        } else if ($d.val() == 'C') { //compra
            $('#dev-origen-div').show();
            $('#dev-destino-div').hide();
            tasa = $d.data('tasacompra');
        } else {
            $('#dev-origen-div').hide();
            $('#dev-destino-div').hide();
        }

        if (tasa != '') {
            $('#tasa').val(tasa);
        }
    });//.trigger('change');

    $('.dev-tipo-divisa[data-eseditar="0"]').trigger('change');

    $('input[data-val-formateado]').each(function () {
        $(this).val($(this).data('val-formateado'));
    });


    //iniciaizo el plugin 
    if ($('.tree').length > 0)
        $('.tree').treegrid();

    //evento click del treeview de origenes destinos de divisas
    $('.dev-selected-tree-origen-destino').click(function (e) {
        e.preventDefault();
        var $e = $(this);
        var codigo = $e.data('valor');
        var label = $e.data('label');
        var $c = $($e.data('target'));
        var $p = $($e.data('content-parent'));
        //$c.find('option[value="' + codigo + '"]').val();
        $p.modal('hide');


        $c.find('option').each(function () {
            if ($(this).val() == codigo) {
                $(this).attr('selected', true);
                $(this).parent().trigger('change');
                return false;
            }
        });

    });

    //
    $('.dev-chk-selcted').click(function () {
        var $e = $(this);
        var $t = $($e.data('target'));

        $t.val($e.val());
        $('span[for="' + $e.data('target').replace('#', "") + '"]').parent().hide();
    });





    $('.dev-editar-origen-destino').click(function (e) {
        e.preventDefault();
        var $c = $($(this).data('target'));
        var val = $(this).data('grupo');
        val = val.replace('a', '');
        var prefix = $(this).data('prefix');
        $c.find('[id="' + prefix + '_grupo"]').val(val);
        $c.find('[id="' + prefix + '_descripcion"]').val($(this).data('descripcion'));
        if ($(this).data('eseditar'))
            $c.find('[id="' + prefix + '_grupo"]').attr('readonly', true);
        else $c.find('[id="' + prefix + '_grupo"]').attr('readonly', false);
        $c.modal();
    });


    submitLoading();

    $(document).on('keypress', '.dev-enter', function (e) {
        if (e.keyCode == 13) { //si presiono Enter ejecuto la peticion
            $('#btnFilter').trigger('click');
        }

    });

    setCalendar();

    $(document).on('click', '.dev-filter-ajax', function () {
        var $f = $($(this).data('form'));
        if ($(this).data('clear') != undefined)
            $f.find('input[type="text"]').val('');

        var url = $f.attr('action') + "?" + $f.serialize();
        getDetails(url);
    });

    $(document).on('click', '.dev-chk-subasta', function () {
        var $t = $($(this).data('enable'));
        if ($(this).is(':checked'))
            $t.attr('readonly', false);
        else $t.attr('readonly', true);
    });

    //iniialio tooltip
    if ($('.dev-tooltip').length > 0)
        $('.dev-tooltip').tooltip();

});


function submitLoading() {
    $('form[data-loading="true"]').submit(function (e) {
        // e.preventDefault();
        if ($(this).valid()) {
            alertas.show();
            // alert('valid');
        } else {
            //alert('no valid');
        }
    });

    //para formularios que descargan archivos
    $('form[data-loading-download="true"]').submit(function (e) {
        if ($(this).valid()) {
            blockResubmit($(this)); //muestra loading 
        }
    });
}


alertas = {
    show: function () {
        $("body").addClass("loading");
    },
    hide: function () {
        $("body").removeClass("loading");
    },
    success: function (MSG) {

        noty({
            text: MSG,
		    type: 'success',
		    timeout: 2000
	    });
    },
    error: function (MSG) {

        noty({
            text: MSG,
            type: 'error',
            timeout: 5000
        });
    },
    warn: function (MSG) {
        noty({
            text: MSG,
            type: 'warning',
            timeout: 5000
        });
    },
    info: function (MSG) {
        noty({
            text: MSG,
            type: 'information',
            timeout: 5000
        });
    },
    erroresModelState: function () {
        var MSG = '';
        $('.validation-summary-errors').hide().children('ul').find('li').each(function () {
            if($(this).text().trim()!='') MSG += "- " + $(this).text().trim() + "\n";
        });
        if (MSG == "")
            MSG = "Valide la informacion";

        alertas.error(MSG);
    }

}

function getDetails(url) {
    alertas.show();
    $.ajax({
        url: url,
        success: function (data, textStatus, xhr) {
            alertas.hide();
            $('#ajaxDetails').empty().append(data);
            var login = xhr.getResponseHeader('login');
            if (login != null) window.location.reload();//window.location = login;
            $("#filter").val($("#filter").val()).focus();
        },
        error: function (xhr, ajaxOptions, thrownError) {
            alertas.error('Error en el servidor: ' + thrownError);
            alertas.hide();
        }
    });
}

function GotoUrl(url) {
    alertas.show();
    $.post(
        url,
        function (res) {
            $("#ContentPage").html(res);
            alertas.hide();
        }, 'html'
    );
}

function setCalendar() {

    if ($('.date').length > 0)
        $('.date').datepicker({
            orientation: "top auto",
            autoclose: true,
            format: 'dd/mm/yyyy'
        });
}


var attempts = 30; //30 segundos como timeout
var downloadTimer; //objeto timer interval

function blockResubmit($form) {
    var downloadToken = setFormToken($form); //crea un token que se envia al server
    alertas.show();
    downloadTimer = window.setInterval(function () {
        var token = getCookie("stop_loading_token");
        if ((token == downloadToken) || (attempts == 0)) {
            unblockSubmit();
        }
        attempts--;
    }, 1000);
}


function getCookie(name) {
    var parts = document.cookie.split(name + "=");
    if (parts.length == 2) return parts.pop().split(";").shift();
}

function expireCookie(cName) {
    document.cookie =
        encodeURIComponent(cName) + "=deleted; expires=" + new Date(0).toUTCString();
}
function setFormToken($form) {
    var downloadToken = new Date().getTime();
    //creo el input y lo envio al formulario
    $form.append('<input type="hidden" id="stop_loading_token" name="stop_loading_token" value="' + downloadToken + '" />');
    return downloadToken;
}
function unblockSubmit() {
    window.clearInterval(downloadTimer);
    expireCookie("stop_loading_token");
    $('#stop_loading_token').remove();
    attempts = 30;
    alertas.hide();
}







