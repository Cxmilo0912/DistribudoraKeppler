$(document).ready(function () {
    var table = $('#tablaMunicipios').DataTable({
        searching: true,
        paging: true,

        layout: {
            topEnd: [
                {
                    buttons: [
                        {
                            extend: 'copyHtml5',
                            text: '<i class="bi bi-clipboard"></i> Copiar',
                            exportOptions: {
                                columns: [0, 1, 2, 3]
                            }
                        }, {
                            extend: 'csvHtml5',
                            text: '<i class="bi bi-filetype-csv"></i> CSV',

                            exportOptions: {
                                columns: [0, 1, 2, 3]
                            }
                        }, {
                            extend: 'excelHtml5',
                            text: '<i class="bi bi-file-earmark-excel"></i> Excel',

                            exportOptions: {
                                columns: [0, 1, 2, 3]
                            }
                        }, {
                            extend: 'pdfHtml5',
                            text: '<i class="bi bi-file-earmark-pdf"></i> PDF',

                            orientation: 'landscape', // Orientación horizontal para mejor visualización de las columnas'
                            pageSize: 'LEGAL',
                            exportOptions: {
                                columns: [0, 1, 2, 3]
                            }
                        }, {
                            extend: 'print',
                            text: '<i class="bi bi-printer"></i> Imprimir',
                            exportOptions: {
                                columns: [0, 1, 2, 3]
                            }
                        }
                    ]
                },
                'search'
            ]
        },

        "ajax": {
            "url": "Municipios.aspx/MtListarMunicipios",
            "type": "POST",
            "contentType": "application/json; charset=utf-8",
            "data": function (d) {
                return JSON.stringify({});
            },
            "dataSrc": function (json) {
                return json.d.data;
            }
        },
        "columns": [
            { "data": "Id" },
            { "data": "Nombre" },
            {
                "data": "Estado",
                "render": function (data) {
                    if (data === 1) {
                        return '<span class="badge bg-success-subtle text-success rounded-pill px-3 py-2">Activo</span>';
                    } else if (data === 0) {
                        return '<span class="badge bg-danger-subtle text-danger rounded-pill px-3 py-2">Inactivo</span>';
                    }
                    return data;

                }
            },
            {
                "data": "CantidadSectores",
                "render": function (data) {
                    if (data === 0 || data === null || data === undefined || data === "") {
                        return `
            <div class="d-flex align-items-center gap-2" style="font-size: .85rem; color: #94a3b8;">
                <i class="bi bi-geo-alt fs-6"></i>
                <span class="fw-medium">Sin asignar</span>
            </div>`;
                    }

                    // Si tiene 1 o más sectores, muestra el contador azul estilizado
                    return `
        <div class="d-inline-flex align-items-center gap-2 px-2.5 py-1.5 rounded-3 fw-medium" 
             style="background: #f0f4fe; color: #0b1184; font-size: .82rem; border: 1px solid #e1e9fe;">
            <i class="bi bi-geo-alt fs-6"></i>
            <span>${data} Sector(es)</span>
        </div>`;
                }
            },
            {
                "data": null,
                "render": function (data, type, row) { // Renderizar los botones de acción para editar y eliminar, con clases específicas para cada acción
                    return `
                <div class="text-center">
                    <button type="button" class="btn btn-outline-info btn-sm btn-editar">
                        <i class="bi bi-pencil"></i> Editar
                    </button>
                </div>`;
                }
            }
        ],
        language: {
            "paginate": {
                "previous": "<i class='bi bi-chevron-left'></i> Anterior",
                "next": "Siguiente <i class='bi bi-chevron-right'></i>"
            }
        },

    });

    function limpiarFormulario() {
        $('#modalMunicipio input').val(''); //limipia todo
        $('#ddlEstado').val("1");
    }

    $(document).on('click', '.btn-editar', function (e) {

        e.preventDefault();


        var row = $(this).closest('tr');

        if (row.hasClass('child')) {
            row = row.prev();
        }

        var data = $('#tablaMunicipios').DataTable().row(row).data();


        if (data != null) {
            $('#txtNombre').val(data.Nombre);
            $('#ddlEstado').val(data.Estado);

            $('#modalMunicipio .modal-title').text("Editar Municipio");
            $('#btnGuardar').text("Actualizar Cambios").data("modo", "editar").data("id", data.Id);

            $('#modalMunicipio').appendTo("body").modal('show');
        } else {
            Swal.fire('Error', 'No se pudieron capturar los datos de la fila.', 'error');
        }

    });

    $('.btn-crear').click(function () {
        limpiarFormulario();
        $('#modalMunicipio .modal-title').text("Nuevo Municipio");
        $('#btnGuardar').text("Guardar Municipio").data("modo", "crear").data("id", 0);
        $('#modalMunicipio').appendTo("body").modal('show');
    });

    $('#btnGuardar').click(function () {

        var modo = $(this).data("modo");
        var idMunicipio = $(this).data("id")


        var municipio = {
            Id: idMunicipio,
            Nombre: $('#txtNombre').val().trim(),
            Estado: parseInt($('#ddlEstado').val()) || 0
        }

        if (municipio.Nombre === "") {
            Swal.fire('Error', 'El municipio necesita un nombre', 'error');
            return;
        }

        var urlDestino = (modo === "editar") ? "Municipios.aspx/MtEditarMunicipio" : "Municipios.aspx/MtCrearMunicipio";

        $.ajax({
            type: "POST",
            url: urlDestino,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({ oMunicipio: municipio }),
            dataType: "json",
            success: function (respuesta) {
                if (respuesta.d) {
                    Swal.fire('¡Realizado!', 'La accion se modifico con exito', 'success');
                    $('#modalMunicipio').modal('hide');
                    limpiarFormulario();
                    $('#tablaMunicipios').DataTable().ajax.reload();
                }
            },
            error: function (xhr) {
                console.error("Error en ajax: " + xhr.responseText);
            }
        })


    });


});

