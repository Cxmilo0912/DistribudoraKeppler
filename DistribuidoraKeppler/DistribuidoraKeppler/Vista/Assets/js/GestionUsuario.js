
$(document).ready(function () {
    var table = $('#example').DataTable({
        searching: true,
        paging: true,
        pageLength: 2,
        responsive: true,
        "initComplete": function (settings, json) {
            $('#example thead').hide();
        },
        layout: {
            topEnd: [
                {
                    buttons: [
                        {
                            extend: 'copyHtml5',
                            text: '<i class="bi bi-clipboard"></i> Copiar',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4, 5]
                            }
                        }, {
                            extend: 'csvHtml5',
                            text: '<i class="bi bi-filetype-csv"></i> CSV',

                            exportOptions: {
                                columns: [0, 1, 2, 3, 4, 5]
                            }
                        }, {
                            extend: 'excelHtml5',
                            text: '<i class="bi bi-file-earmark-excel"></i> Excel',

                            exportOptions: {
                                columns: [0, 1, 2, 3, 4, 5]
                            }
                        }, {
                            extend: 'pdfHtml5',
                            text: '<i class="bi bi-file-earmark-pdf"></i> PDF',

                            orientation: 'landscape', // Orientación horizontal para mejor visualización de las columnas'
                            pageSize: 'LEGAL',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4]
                            }
                        }, {
                            extend: 'print',
                            text: '<i class="bi bi-printer"></i> Imprimir',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4]
                            }
                        }
                    ]
                },
                'search'
            ],
        },
        "ajax": {
            "url": "GestionUsuarios.aspx/MtListarTrabajadores",
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
            {
                "data": "Foto",
                "render": function (data) {
                    var src = (data && data.length > 10) ? data.replace("~/", "/DistribuidoraKeppler/") : "https://ui-avatars.com/api/?name=User&background=e2e8f0&color=64748b";
                    return '<img src="' + src + '" class="rounded-circle" style="width:38px;height:38px;object-fit:cover;" />';
                }
            },
            { "data": "Id" },
            { "data": "Nombre" },
            { "data": "Email" },
            { "data": "Documento" },
            {
                "data": "Rol.Nombre",
                "render": function (data) {
                    if (data === "Administrador") {
                        return '<span class="badge bg-primary-subtle text-primary rounded-pill px-3 py-2">Administrador</span>';
                    } else if (data === "Preventista") {
                        return '<span class="badge bg-purple-subtle text-purple rounded-pill px-3 py-2" style="background-color: #f3e8ff; color: #6b21a8;">Preventista</span>';
                    } else if (data === "Distribuidor") {
                        return '<span class="badge bg-warning-subtle text-warning-emphasis rounded-pill px-3 py-2">Distribuidor</span>';
                    } else if (data === "Bodega") {
                        return '<span class="badge bg-info-subtle text-info-emphasis rounded-pill px-3 py-2">Bodega</span>';
                    }
                    return data;
                }
            },
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
                "data": null,
                "render": function (data, type, row) { // Renderizar los botones de acción para editar y eliminar, con clases específicas para cada acción
                    return `
            <div class="text-center">
                <button type="button" class="btn btn-outline-info btn-sm btn-editar">
                    <i class="bi bi-pencil"></i> Editar
                </button>
                <button type="button" class="btn btn-outline-danger btn-sm btn-eliminar">
                    <i class="bi bi-trash"></i> Borrar
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
        drawCallback: function () {
            $('.dt-paging').addClass('d-flex justify-content-end mt-3');
        }
    });

    $('input[placeholder="Buscar por nombre, correo o rol..."]').on('input keyup', function () {
        table.search($(this).val()).draw();
    });

    $(document).on('click', '[data-purpose="role-filters"] button', function () {
        $('[data-purpose="role-filters"] button')
            .removeClass('bg-slate-900 text-white')
            .addClass('bg-white border border-gray-200 text-gray-600');
        $(this)
            .removeClass('bg-white border border-gray-200 text-gray-600')
            .addClass('bg-slate-900 text-white');

        var rol = $(this).attr('data-role') || "";
        console.log("Filtrando por:", rol);

        // ← Obtiene la instancia directamente, sin variable global
        var dt = $('#example').DataTable();

        if (rol === "") {
            dt.column(3).search('').draw();
        } else {
            dt.column(3).search(rol.trim(), true, false).draw();
            // true = regex, false = no smart search
            // buscamos el texto con posibles espacios alrededor
        }
    });

    $(document).on('click', '.btn-editar', function () {
        var row = $(this).closest('tr');
        if (row.hasClass('child')) { row = row.prev(); }

        var data = $('#example').DataTable().row(row).data();

        if (data != null) {
            $('#txtIdTrabajador').val(data.Id);
            $('#txtNombre').val(data.Nombre);
            $('#txtDocumento').val(data.Documento);
            $('#txtEmail').val(data.Email);
            $("select[id$=ddlRol] option:contains('" + data.Rol.Nombre + "')").prop('selected', true);
            $('#ddlEstado').val(data.Estado);

            $('#modalEditarUsuario').modal('show');

        }
    });
    function limpiarFormulario() {
        $('#modalEditarUsuario input').val(''); //limipia todo

    }
    $(document).on('click', '#btnGuardar', function () {
        var usuario = {
            Id: parseInt($('#txtIdTrabajador').val()) || 0,
            Nombre: $('#txtNombre').val().trim(),
            Email: $('#txtEmail').val().trim(),
            Documento: parseInt($('#txtDocumento').val()) || 0,
            Rol: {
                Id: parseInt($("select[id$='ddlRol']").val()) || 0
            },
            Estado: parseInt($("select[id$='ddlEstado']").val()) || 0
        };

        if (usuario.Nombre === "") {
            Swal.fire({ title: 'Error', text: 'El usuario debe contener un nombre', icon: 'error' });
            return;
        }

        Swal.fire({
            title: 'Está editando la información del usuario',
            text: '¿Desea guardar los cambios?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Sí, guardar',
            cancelButtonText: 'Cancelar',
            confirmButtonColor: '#10B981',
            cancelButtonColor: '#ef4444'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: "POST",
                    url: "GestionUsuarios.aspx/MtEditarUsuario",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ oUsuario: usuario }),
                    dataType: "json",
                    success: function (respuesta) {
                        if (respuesta.d) {
                            Swal.fire('¡Actualizado!', 'El usuario se modificó con éxito.', 'success');
                            $('#modalEditarUsuario').modal('hide');
                            limpiarFormulario();
                            $('#example').DataTable().ajax.reload();
                        } else {
                            Swal.fire('Error', 'No se pudieron guardar los cambios.', 'error');
                        }
                    }
                });
            } else {
                Swal.fire('Cancelado', 'No se realizó ninguna modificación.', 'info');
                $('#modalEditarUsuario').modal('hide');
                limpiarFormulario();
            }
        });
    });

    $(document).on('click', '.btn-eliminar', function () {
        var row = $(this).closest('tr');
        if (row.hasClass('child')) row = row.prev();

        var data = $('#example').DataTable().row(row).data();

        Swal.fire({
            title: '¿Deseas eliminar el usuario?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Continuar',
            cancelButtonText: 'Se me ache achi 🤌🏻',
            confirmButtonColor: '#10B981',
            cancelButtonColor: '#ef4444'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: "POST",
                    url: "GestionUsuarios.aspx/MtEliminarUsuario",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ id: data.Id }), // Solo se envia el Id
                    dataType: "json",
                    success: function (respuesta) {
                        if (respuesta.d) {
                            Swal.fire('¡Eliminado!', 'El usuario se ha eliminado con éxito.', 'success');
                            $('#example').DataTable().ajax.reload(); // Refrescar tabla
                        } else {
                            Swal.fire('¡Ooops!', 'El usuario no se ha eliminado debido a un error del sistema.', 'error');
                            alert("No se pudo eliminar el usuario.");
                        }
                    },
                    error: function (xhr) {
                        console.error(xhr.responseText); //Esta linea imprime en caso de error
                    }
                })
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                Swal.fire('Cancelado', 'No se pudo eliminar el usuario.', 'error');
            }
        })
    })
});