
function bindActionToButton(element, element_result, url_action, objects) {
    element.unbind();
    element.bind("click", function (event, hdnPage) {
        string_data = {};
        var arrayLength = objects.attributes.length;
        for (i = 0; i < arrayLength; i++) {
            if (typeof objects.elements[i] === "string")
                string_data[objects.attributes[i]] = objects.elements[i];
            else
                string_data[objects.attributes[i]] = objects.elements[i].val();
        }
        $('#spinner').show();
        $.ajax({
            url: url_action,
            type: 'POST',
            data: string_data,
            success: function (data) {
                element_result.html(data).promise().done(function () {
                    $('#spinner').hide();
                });
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $('#spinner').hide();
                console.log('Error al actualizar.' + " " + thrownError);
            }
        });
        return false;
    });
}

function loadDetailsFromFilter(element, url_action, objects, esBtnLimpiar) {
    element.unbind();
    element.bind("click", function (event, hdnPage) {
        string_data = {};
        string_data.pagesize = $('#selectRecords').val();
        if (hdnPage === undefined || hdnPage == null) {
            string_data.page = 1;
        } else {
            string_data.page = hdnPage.hdnPage;
        }
        var arrayLength = objects.attributes.length;
        for (i = 0; i < arrayLength; i++) {
            if (esBtnLimpiar) {
                objects.elements[i].val(objects.empties[i]);
                string_data[objects.attributes[i]] = objects.empties[i];
            } else {
                if (typeof objects.elements[i] === "string")
                    string_data[objects.attributes[i]] = objects.elements[i];
                else
                    string_data[objects.attributes[i]] = objects.elements[i].val();
            }
        }
        $('#spinner').show();
        $.ajax({
            url: url_action,
            type: 'POST',
            data: string_data,
            success: function (data) {
                $("#ajaxDetails").html(data).promise().done(function () {
                    $('#spinner').hide();
                });
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $('#spinner').hide();
                console.log('Error al actualizar.' + " " + thrownError);
            }
        });
        return false;
    });

}

function cleanAndSetupIndex(objects) {
    $('#selectRecords').val("20");
    var arrayLength = objects.attributes.length;
    for (i = 0; i < arrayLength; i++) {
        objects.elements[i].val(objects.empties[i]);
        objects.elements[i].tooltip();
    }
}

function selectRecordsSetup(url_action, objects) {

    loadDetailsFromFilter($('#btnFilter'), url_action, objects, false);
    loadDetailsFromFilter($('#btnClear'), url_action, objects, true);

    $('#selectRecords').change(function () {
        $('#spinner').show();
        string_data = {};
        string_data.pagesize = $(this).val();
        string_data.page = $("#hdnCurrentPage").val();
        var arrayLength = objects.attributes.length;
        for (i = 0; i < arrayLength; i++) {
            if (typeof objects.elements[i] === "string")
                string_data[objects.attributes[i]] = objects.elements[i];
            else
                string_data[objects.attributes[i]] = objects.elements[i].val();
        }
        $.ajax({
            url: url_action,
            type: 'POST',
            data: string_data,
            success: function (data) {
                $("#ajaxDetails").html(data).promise().done(function () {
                    $('#spinner').hide();
                });
            },
            error: function (xhr, ajaxOptions, thrownError) {
                $('#spinner').hide();
                console.log('Error al actualizar.' + " " + thrownError);
            }
        });
    });
}

function reloadModalBinding() {

    $("a[data-modal]").click(function (e) {

        alertas.show();

        $('#myModalContent').load(this.href, function () {

            alertas.hide();

            $('#myModal').modal({
                backdrop: 'static',
                keyboard: true,
            }, 'show');
            var no_ajax = $('form', this).data('no-ajax');
            if (no_ajax == undefined)
                bindForm(this);
        });

        return false;
    });
}

function bindForm(dialog) {
    $.validator.unobtrusive.parse($('form', dialog)); //validar formulario
    $('form', dialog).submit(function () {
        if ($(this).valid()) {
            $.ajax({
                url: this.action,
                type: this.method,
                data: $(this).serialize(),
                success: function (result)
                {
                    if (result.success && result.url !== undefined) {
                        $('#myModal').modal('hide');
                        setTimeout("GotoUrl('" + result.url + "')", 500);
                        
                    }
                    else if (result.success) {
                        $('#myModal').modal('hide');
                        $('#btnFilter').trigger("click", { hdnPage: $("#hdnCurrentPage").val() });
                        alertas.success("Operación realizada con éxito");
                        //si es satisfactorio y viene un html entonces lo inserto en el div,
                        if(result.html)
                             $("#ajaxDetails").html(result.html);
                    } else {
                        $('#myModalContent').html(result);
                        alertas.erroresModelState();
                        bindForm();
                    }
                },
                error: function () {
                    alertas.error('Ha ocurrido un error en el servidor');
                }
            });
            return false;
        }
    });
}