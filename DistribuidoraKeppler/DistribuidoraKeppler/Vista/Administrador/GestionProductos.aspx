<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="GestionProductos.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Aministrador.GestionPeoductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Gestión de Productos - Kepler Admin</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "background": "#f8f9fa",
                        "surface-bright": "#f8f9fa",
                        "outline": "#757780",
                        "on-primary-fixed": "#001847",
                        "on-tertiary": "#ffffff",
                        "tertiary": "#0c0100",
                        "surface-tint": "#495d90",
                        "primary-fixed": "#dae2ff",
                        "on-secondary-container": "#5b6278",
                        "tertiary-fixed-dim": "#ffb59e",
                        "secondary-fixed": "#dbe2fc",
                        "secondary-container": "#d8dff9",
                        "on-surface-variant": "#44464f",
                        "error-container": "#ffdad6",
                        "surface-container-highest": "#e1e3e4",
                        "on-background": "#191c1d",
                        "surface-container-high": "#e7e8e9",
                        "tertiary-fixed": "#ffdbd0",
                        "surface-container-lowest": "#ffffff",
                        "on-tertiary-fixed": "#390b00",
                        "surface-dim": "#d9dadb",
                        "surface-container": "#edeeef",
                        "error": "#ba1a1a",
                        "surface-container-low": "#f3f4f5",
                        "inverse-on-surface": "#f0f1f2",
                        "inverse-surface": "#2e3132",
                        "on-secondary": "#ffffff",
                        "on-secondary-fixed-variant": "#3f465b",
                        "primary-container": "#001a4b",
                        "on-tertiary-container": "#bd725a",
                        "on-error": "#ffffff",
                        "outline-variant": "#c5c6d0",
                        "tertiary-container": "#3c0d01",
                        "on-tertiary-fixed-variant": "#723522",
                        "on-error-container": "#93000a",
                        "on-primary-fixed-variant": "#314577",
                        "on-primary": "#ffffff",
                        "primary-fixed-dim": "#b2c5ff",
                        "surface": "#f8f9fa",
                        "primary": "#000311",
                        "on-surface": "#191c1d",
                        "on-primary-container": "#7084ba",
                        "secondary-fixed-dim": "#bfc6df",
                        "secondary": "#575e74",
                        "surface-variant": "#e1e3e4",
                        "on-secondary-fixed": "#141b2e",
                        "inverse-primary": "#b2c5ff"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.125rem",
                        "lg": "0.25rem",
                        "xl": "0.5rem",
                        "full": "0.75rem"
                    },
                    "fontFamily": {
                        "headline": ["Inter"],
                        "body": ["Inter"],
                        "label": ["Inter"]
                    }
                }
            }
        }
    </script>
    <link href="https://cdn.datatables.net/v/bs5/jszip-3.10.1/dt-2.0.8/b-3.0.2/b-colvis-3.0.2/b-html5-3.0.2/b-print-3.0.2/cr-2.0.3/fc-5.0.1/fh-4.0.1/r-3.0.2/sp-2.3.3/sl-2.0.3/datatables.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <script src="https://cdn.datatables.net/v/bs5/jszip-3.10.1/dt-2.0.8/b-3.0.2/b-colvis-3.0.2/b-html5-3.0.2/b-print-3.0.2/cr-2.0.3/fc-5.0.1/fh-4.0.1/r-3.0.2/sp-2.3.3/sl-2.0.3/datatables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        #tablaProductos {
            border-collapse: separate !important;
            border-spacing: 0 !important;
            margin-top: 15px !important;
            margin-bottom: 15px !important;
            border-radius: 12px !important;
            overflow: hidden !important;
            border: 1px solid #e2e8f0 !important;
        }


            #tablaProductos thead th {
                background-color: #001A4B !important;
                color: #ffffff !important;
                text-transform: uppercase;
                font-size: 0.75rem;
                font-weight: 700;
                letter-spacing: 0.5px;
                padding: 14px 16px !important;
                border: none !important;
            }


            #tablaProductos tbody td {
                background-color: #ffffff !important;
                color: #334155 !important;
                padding: 12px 16px !important;
                vertical-align: middle !important;
                border-bottom: 1px solid #f1f5f9 !important;
                font-size: 1rem;
                transition: background-color 0.2s ease;
                font-weight: 600 !important;
            }

            #tablaProductos tbody tr:hover td {
                background-color: #f8fafc !important;
                cursor: pointer;
            }

            #tablaProductos tbody tr:last-child td:first-child {
                border-bottom-left-radius: 12px;
            }

            #tablaProductos tbody tr:last-child td:last-child {
                border-bottom-right-radius: 12px;
            }


        .btn-editar {
            border-radius: 6px !important;
            font-weight: 500 !important;
            padding: 5px 12px !important;
            font-size: 0.85rem !important;
            border-color: #0ea5e9 !important;
            color: #0ea5e9 !important;
            transition: all 0.2s ease !important;
        }

            .btn-editar:hover {
                background-color: #0ea5e9 !important;
                color: white !important;
                transform: translateY(-2px);
                box-shadow: 0 4px 6px -1px rgba(14, 165, 233, 0.2);
            }

        .btn-eliminar {
            border-radius: 6px !important;
            font-weight: 500 !important;
            padding: 5px 12px !important;
            font-size: 0.85rem !important;
            border-color: #ef4444 !important;
            color: #ef4444 !important;
            transition: all 0.2s ease !important;
        }

            .btn-eliminar:hover {
                background-color: #ef4444 !important;
                color: white !important;
                transform: translateY(-2px);
                box-shadow: 0 4px 6px -1px rgba(239, 68, 68, 0.2);
            }



        .dataTables_paginate .paginate_button {
            padding: 6px 12px !important;
            margin-left: 5px !important;
            border-radius: 6px !important;
            border: 1px solid #cbd5e1 !important;
            background: white !important;
            color: #0f172a !important;
            font-weight: 500 !important;
            font-size: 0.85rem !important;
            cursor: pointer;
            transition: all 0.2s ease;
        }

            .dataTables_paginate .paginate_button:hover {
                background: #f1f5f9 !important;
                color: #0f172a !important;
                border-color: #94a3b8 !important;
            }

            .dataTables_paginate .paginate_button.current {
                background: #0f172a !important;
                color: white !important;
                border-color: #0f172a !important;
            }

            .dataTables_paginate .paginate_button.disabled {
                opacity: 0.5 !important;
                cursor: not-allowed !important;
                background: #f8fafc !important;
            }

        .dt-buttons .btn {
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            margin-right: 5px;
        }

        .dt-buttons {
            margin-bottom: 10px;
        }


        div.dt-search {
            display: inline-flex !important;
            align-items: center;
        }



        .buttons-copy {
            background-color: #3B82F6 !important;
            color: white !important;
        }

            .buttons-copy:hover {
                background-color: #06B6D4 !important;
                transform: translateY(10px);
            }

        .buttons-csv {
            background-color: #10B981 !important;
            color: white !important;
        }

            .buttons-csv:hover {
                background-color: #047857 !important;
                transform: translateY(10px);
            }

        .buttons-excel {
            background-color: #27ae60 !important;
            color: white !important;
        }

            .buttons-excel:hover {
                background-color: #219150 !important;
                transform: translateY(10px);
            }

        .buttons-pdf {
            background-color: #e74c3c !important;
            color: white !important;
        }

            .buttons-pdf:hover {
                background-color: #df3030 !important;
                transform: translateY(10px);
            }

        .buttons-print {
            background-color: #4B5563 !important;
            color: white !important;
        }

            .buttons-print:hover {
                background-color: #4F46E5 !important;
                transform: translateY(10px);
            }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="modal fade" id="modalProducto" tabindex="-1" aria-labelledby="modalEditarProductoLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">

                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="modalEditarProductoLabel">
                        <i class="fas fa-box-open me-2"></i>Editar Detalles del Producto
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <form id="formEditarProducto" autocomplete="off" enctype="multipart/form-data">

                        <input type="hidden" id="txtIdProducto" name="id" />

                        <div class="row">
                            <div class="col-lg-8">
                                <div class="row g-3">

                                    <div class="col-12">
                                        <label for="txtNombre" class="form-label fw-bold">Nombre del Producto</label>
                                        <input type="text" class="form-control" id="txtNombre" name="nombre" required />
                                    </div>

                                    <div class="col-12">
                                        <label for="txtDescripcion" class="form-label fw-bold">Descripción</label>
                                        <textarea class="form-control" id="txtDescripcion" name="descripcion" rows="2"></textarea>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="ddlCategoria" class="form-label fw-bold">Categoría</label>
                                        <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select"></asp:DropDownList>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="ddlMarca" class="form-label fw-bold">Marca</label>
                                        <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="txtEstado" class="form-label fw-bold">Estado</label>
                                        <input type="text" class="form-control" id="txtEstado" name="estado" step="0.01" min="0" required />

                                    </div>

                                    <div class="col-md-6">
                                        <label for="txtPrecio" class="form-label fw-bold">Precio ($)</label>
                                        <input type="number" class="form-control" id="txtPrecio" name="precio" step="0.01" min="0" required />
                                    </div>

                                    <div class="col-md-6">
                                        <label for="txtStock" class="form-label fw-bold">Stock Actual</label>
                                        <input type="number" class="form-control" id="txtStock" name="stock" min="0" required />
                                    </div>

                                    <div class="col-md-6">
                                        <label for="txtLimiteMinimo" class="form-label fw-bold">Límite Mínimo (Stock Crítico)</label>
                                        <input type="number" class="form-control" id="txtLimiteMinimo" name="limiteMinimo" min="0" required />
                                    </div>

                                    <div class="col-md-6">
                                        <label for="txtLimiteVenta" class="form-label fw-bold">Límite de Venta (Por transacción)</label>
                                        <input type="number" class="form-control" id="txtLimiteVenta" name="limiteVenta" min="1" required />
                                    </div>

                                </div>
                            </div>

                            <div class="col-lg-4 border-start ps-lg-4 mt-4 mt-lg-0 d-flex flex-column justify-content-between">
                                <div>
                                    <label class="form-label fw-bold d-block mb-3">Imagen del Producto</label>

                                    <div class="text-center p-3 border rounded bg-light mb-3" style="min-height: 200px; display: flex; align-items: center; justify-content: center;">
                                        <img id="imgPrevisualizacion" src="https://via.placeholder.com/180" class="img-fluid rounded shadow-sm" alt="Previsualización" style="max-height: 180px; object-fit: contain;" />
                                    </div>

                                    <div class="input-group">
                                        <span class="input-group-text bg-white"><i class="bi bi-link-45deg"></i></span>
                                        <input type="text" id="txtImagenUrl" class="form-control" placeholder="Pega el link aquí..." />
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>

                <div class="modal-footer bg-light">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="fas fa-times me-1"></i>Cancelar
                    </button>
                    <button type="button" class="btn btn-success" id="btnGuardar">
                        <i class="fas fa-save me-1"></i>Guardar Cambios
                    </button>
                </div>

            </div>
        </div>
    </div>
    <header class="flex justify-between items-center w-full px-12 py-8 bg-surface">
        <div>
            <h2 class="text-3xl font-black text-primary-container tracking-tight">Gestión de Productos</h2>
            <div class="flex items-center gap-2 mt-1">
                <span class="text-sm text-on-secondary-container font-medium uppercase tracking-widest">Inventario</span>
                <span class="text-slate-300">/</span>
                <span class="text-sm text-slate-500">Catálogo</span>
            </div>
        </div>
        <div class="flex items-center gap-4">
            <asp:LinkButton ID="btnCrearProducto" runat="server"
                OnClick="btnCrearProducto_Click"
                CssClass="flex items-center gap-2 px-6 py-3 bg-primary-container text-white rounded-md font-semibold text-sm hover:opacity-90 transition-all">
    <span class="material-symbols-outlined text-sm">add</span>
    Crear producto
            </asp:LinkButton>
        </div>
    </header>
    <section class="px-12 pb-6 space-y-6">
        <div class="flex items-center gap-2 overflow-x-auto pb-2 scrollbar-hide">
        </div>
    </section>
    <section class="px-12 flex-1">
        <div class="bg-surface-container-lowest rounded-xl overflow-hidden shadow-[0_4px_24px_rgba(0,0,0,0.03)] border border-outline-variant/10">
            <table id="tablaProductos" class="table table-striped table-hover" style="width: 100%" clientidmode="Static">
                <thead>
                    <tr>
                        <th>Imagen</th>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Descripcion</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Limite de Venta</th>
                        <th>Limite Minimo</th>
                        <th>Marca</th>
                        <th>Categoria</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </section>
    <footer class="px-12 py-10 grid grid-cols-1 md:grid-cols-3 gap-6">
        <div class="bg-primary-container text-white p-8 rounded-xl flex flex-col gap-1 shadow-sm relative overflow-hidden group">
            <div class="absolute -right-4 -bottom-4 opacity-10 group-hover:scale-110 transition-transform duration-700">
                <span class="material-symbols-outlined text-9xl">inventory_2</span>
            </div>
            <span class="text-[11px] font-black uppercase tracking-[0.2em] opacity-60">TOTAL PRODUCTOS</span>

            <asp:Label ID="lblTotalProductos" runat="server" CssClass="text-4xl font-extrabold tracking-tight" Text="0"></asp:Label>
        </div>

        <div class="bg-surface-container-lowest border border-outline-variant/10 p-8 rounded-xl flex flex-col gap-1 shadow-sm relative overflow-hidden">
        </div>

        <div class="bg-surface-container-lowest border border-outline-variant/10 p-8 rounded-xl flex flex-col gap-1 shadow-sm relative overflow-hidden">
        </div>
    </footer>
    <script>
        $(document).ready(function () {
            var table = $('#tablaProductos').DataTable({
                responsive: true,
                colReorder: true,
                layout: {
                    topStart: 'search',
                    bottomStart: 'pageLength',
                    topEnd: [
                        {
                            buttons: [
                                {
                                    extend: 'copyHtml5',
                                    text: '<i class="bi bi-clipboard"></i> Copiar',
                                    exportOptions: {
                                        columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                                    }
                                }, {
                                    extend: 'csvHtml5',
                                    text: '<i class="bi bi-filetype-csv"></i> CSV',

                                    exportOptions: {
                                        columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                                    }
                                }, {
                                    extend: 'excelHtml5',
                                    text: '<i class="bi bi-file-earmark-excel"></i> Excel',

                                    exportOptions: {
                                        columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                                    }
                                }, {
                                    extend: 'pdfHtml5',
                                    text: '<i class="bi bi-file-earmark-pdf"></i> PDF',

                                    orientation: 'landscape', // Orientación horizontal para mejor visualización de las columnas'
                                    pageSize: 'LEGAL',
                                    exportOptions: {
                                        columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                                    }
                                }, {
                                    extend: 'print',
                                    text: '<i class="bi bi-printer"></i> Imprimir',
                                    exportOptions: {
                                        columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                                    }
                                }
                            ]
                        },
                    ]
                },
                "ajax": {
                    "url": "GestionProductos.aspx/CargarProductos",
                    "type": "POST",
                    "contentType": "application/json; charset=utf-8",
                    "data": function (d) {
                        return JSON.stringify();
                    },
                    "dataSrc": function (json) {
                        return json.d.data;
                    }
                },
                "columns": [
                    {
                        "data": "Imagen", // Configuración para mostrar la imagen del producto
                        "render": function (data) { // Renderizar la imagen con un tamaño fijo de 50x50 píxeles, manteniendo la proporción y mostrando un placeholder si la URL no es válida
                            var urlFinal = (data && data.length > 10) ? data : "https://via.placeholder.com/50?text=N/A"; // la condicion es para verificar si la URL es válida, si no lo es, se muestra un placeholder con el texto

                            return `
    <div class="text-center">
        <img src="${urlFinal}" 
             class="rounded shadow-sm border" 
             style="height:50px; width:50px; object-fit:contain; background-color: #fff;" 
             onerror="this.src='https://via.placeholder.com/50?text=Error';" />
    </div>`;
                        }
                    },
                    {
                        "data": "Id"
                    },
                    { "data": "Nombre" },
                    { "data": "Descripcion" },
                    {
                        "data": "Precio", "render": function (data) {
                            return "$" + parseFloat(data).toLocaleString('es-CO');
                        }
                    },
                    { "data": "Stock" },
                    { "data": "LimiteVenta" },
                    { "data": "LimiteMinimo" },
                    { "data": "MarcaNombre" },
                    { "data": "CategoriaNombre" },
                    {
                        "data": "Estado",
                        "render": function (data) {
                            if (data === "Activo") {
                                return `<span class="badge bg-success">Activo</span>`;
                            } else if (data === "Inactivo") {
                                return `<span class="badge bg-danger">Inactivo</span>`;
                            }
                        }
                    },
                    {
                        "data": null,
                        "render": function (data, type, row) {
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
            });
        });

        $(document).on('click', '.btn-editar', function (e) {
            var row = $(this).closest('tr');
            if (row.hasClass('child')) {
                row = row.prev();
            }
            var data = $('#tablaProductos').DataTable().row(row).data();

            if (data != null) {
                $('#txtIdProducto').val(data.Id);
                $('#txtNombre').val(data.Nombre);
                $('#txtDescripcion').val(data.Descripcion);
                $("select[id$=ddlCategoria] option:contains('" + data.CategoriaNombre + "')").prop('selected', true);
                $("select[id$=ddlMarca] option:contains('" + data.MarcaNombre + "')").prop('selected', true);
                $('#txtEstado').val(data.Estado);
                $('#txtPrecio').val(data.Precio);
                $('#txtStock').val(data.Stock);
                $('#txtLimiteMinimo').val(data.LimiteMinimo);
                $('#txtLimiteVenta').val(data.LimiteVenta);
                $('#txtImagenUrl').val(data.Imagen);

                $('#imgPrevisualizacion').attr('src', data.Imagen || "https://via.placeholder.com/110?text=Sin+Imagen");





                $('#modalProducto').modal('show');
            }
        });
        function limpiarFormulario() {
            $('#modalProducto input').val(''); //limipia todo
            $('#imgPrevisualizacion').attr('src', 'https://via.placeholder.com/110?text=Sin+Imagen'); //vuelve por defecto la img

        }
        $('#txtImagenUrl').on('input change keyup paste', function () {

            // Recibir el valor de la url
            var urlIngresada = $(this).val().trim();

            // Cuando esta vacio el campo pone una imagen por defecto
            var imagenPorDefecto = "https://via.placeholder.com/130?text=Sin+Imagen";

            // Si hay algo escrito se intenta cargar
            if (urlIngresada !== "") {
                $('#imgPrevisualizacion').attr('src', urlIngresada);
            } else {
                // Si se elimina vuelve la imagen por defecto
                $('#imgPrevisualizacion').attr('src', imagenPorDefecto);
            }
        });
        $('#imgPrevisualizacion').on('error', function () {
            $(this).attr('src', 'https://via.placeholder.com/130/ff0000/ffffff?text=Error+en+URL');
        });
        $(document).ready(function () {
            $('#btnGuardar').click(function () {
                var idProducto = $(this).data("id");

                var producto =
                {
                    Id: parseInt($('#txtIdProducto').val()) || 0,
                    Nombre: $('#txtNombre').val().trim(),
                    Descripcion: $('#txtDescripcion').val().trim(),
                    Estado: $('#txtEstado').val().trim(),
                    Precio: parseFloat($('#txtPrecio').val().toString().replace(',', '.')) || 0,
                    Stock: parseInt($('#txtStock').val()) || 0,
                    LimiteMinimo: parseInt($('#txtLimiteMinimo').val()) || 0,
                    LimiteVenta: parseInt($('#txtLimiteVenta').val()) || 0,
                    IdMarca: {
                        Id: parseInt($("select[id$=ddlMarca]").val()) || 0
                    },
                    IdCategoria: {
                        Id: parseInt($("select[id$=ddlCategoria]").val()) || 0
                    },
                    Imagen: $('#txtImagenUrl').val().trim()

                };

                if (producto.Nombre === "") {
                    Swal.fire({
                        title: 'Falla al actualizar el producto',
                        text: 'El producto debe contener un nombre',
                        icon: 'error'
                    });
                    return;
                }
                Swal.fire({
                    title: 'Está editando la información del producto',
                    text: '¿Desea guardar los cambios?',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonText: 'Sí, Te Amo💗',
                    cancelButtonText: 'No, Soy Infiel👻',
                    confirmButtonColor: '#10B981',
                    cancelButtonColor: '#ef4444'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            type: "POST",
                            url: "GestionProductos.aspx/MtEditarProducto",
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify({ oProducto: producto }),
                            dataType: "json",
                            success: function (respuesta) {
                                if (respuesta.d) {
                                    Swal.fire('¡Actualizado!', 'El producto se modificó con éxito.', 'success');
                                    $('#modalProducto').modal('hide');
                                    limpiarFormulario();
                                    $('#tablaProductos').DataTable().ajax.reload();
                                } else {
                                    Swal.fire('Error', 'No se pudieron guardar los cambios en el servidor.', 'error');
                                }
                            }
                        });
                    } else if (result.dismiss === Swal.DismissReason.cancel) {
                        Swal.fire('Cancelado', 'No se realizó ninguna modificación.', 'info');
                        $('#modalProducto').modal('hide');
                        limpiarFormulario();
                    }
                });

            });
        });

        $(document).on('click', '.btn-eliminar', function () {
            var row = $(this).closest('tr');
            if (row.hasClass('child')) row = row.prev();

            var data = $('#tablaProductos').DataTable().row(row).data();

            Swal.fire({
                title: '¿Deseas eliminar el producto?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Sí, Te Amo💗',
                cancelButtonText: 'No, Soy Infiel👻',
                confirmButtonColor: '#10B981',
                cancelButtonColor: '#ef4444'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: "POST",
                        url: "GestionProductos.aspx/MtEliminarProducto",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ id: data.Id }), // Solo se envia el Id
                        dataType: "json",
                        success: function (respuesta) {
                            if (respuesta.d) {
                                alert("Producto eliminado correctamente.");
                                $('#tablaProductos').DataTable().ajax.reload(); // Refrescar tabla
                            } else {
                                alert("No se pudo eliminar el producto.");
                            }
                        },
                        error: function (xhr) {
                            console.error(xhr.responseText); //Esta linea imprime en caso de error
                        }
                    })
                    Swal.fire('¡Eliminado!', 'El producto se ha eliminado con éxito.', 'success');
                } else if (result.dismiss === Swal.DismissReason.cancel) {
                    Swal.fire('Cancelado', 'No se pudo eliminar el producto.', 'error');
                }
            })
        });
    </script>
</asp:Content>
