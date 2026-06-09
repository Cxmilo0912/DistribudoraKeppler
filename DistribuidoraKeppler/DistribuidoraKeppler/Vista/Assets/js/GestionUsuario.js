
$(document).ready(function () {
    var table = $('#example').DataTable({
        searching: true,
        paging: true,
        colReorder: true,
        pageLength: 2,
        layout: {
            topEnd: [
                {
                    buttons: [
                        {
                            extend: 'copyHtml5',
                            text: '<i class="bi bi-clipboard"></i> Copiar',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4]
                            }
                        }, {
                            extend: 'csvHtml5',
                            text: '<i class="bi bi-filetype-csv"></i> CSV',

                            exportOptions: {
                                columns: [0, 1, 2, 3, 4]
                            }
                        }, {
                            extend: 'excelHtml5',
                            text: '<i class="bi bi-file-earmark-excel"></i> Excel',

                            exportOptions: {
                                columns: [0, 1, 2, 3, 4]
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
            ]
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
            { "data": "Id" },
            { "data": "Nombre" },
            { "data": "Email" },
            {
                "data": "Rol.Nombre",
                "render": function (data) {
                    if (data === "Administrador") {
                        return '<span class="px-2 py-1 bg-blue-100 text-blue-800 rounded-full text-sm">Administrador</span>';
                    } else if (data === "Preventista") {
                        return '<span class="px-2 py-1 bg-purple-100 text-purple-800 rounded-full text-sm">Preventista</span>';
                    } else if (data === "Distribuidor") {
                        return '<span class="px-2 py-1 bg-orange-100 text-orange-800 rounded-full text-sm">Distribuidor</span>';
                    } else if (data === "Bodega") {
                        return '<span class="px-2 py-1 bg-pink-100 text-pink-800 rounded-full text-sm">Bodega</span>';
                    }
                }
            },
            {
                "data": "Estado",
                "render": function (data) {
                    if (data === 1) {
                        return '<span class="px-2 py-1 bg-green-100 text-green-800 rounded-full text-sm">Activo</span>';
                    } else if (data === 0) {
                        return '<span class="px-2 py-1 bg-red-100 text-red-800 rounded-full text-sm">Inactivo</span>';
                    }

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
            paginate: { previous: "Anterior", next: "Siguiente" }
        },
        drawCallback: function () {
            $('.dataTables_paginate').addClass('flex justify-end mt-4');
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
});