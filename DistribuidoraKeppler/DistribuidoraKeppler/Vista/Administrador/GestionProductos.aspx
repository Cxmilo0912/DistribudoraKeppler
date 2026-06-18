<%@ Page Title="Kepler Admin - Gestión de Productos" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="GestionProductos.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Aministrador.GestionPeoductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Gestión de Productos - Kepler Admin</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/v/bs5/jszip-3.10.1/dt-2.0.8/b-3.0.2/b-colvis-3.0.2/b-html5-3.0.2/b-print-3.0.2/cr-2.0.3/fc-5.0.1/fh-4.0.1/r-3.0.2/sp-2.3.3/sl-2.0.3/datatables.min.css" rel="stylesheet" />
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
            background-color: #f8f9fa;
        }

        /* Estilización Avanzada de la Tabla de Productos */
        #tablaProductos {
            border-collapse: separate !important;
            border-spacing: 0 !important;
            border-radius: 12px !important;
            overflow: hidden !important;
            border: 1px solid #dee2e6 !important;
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
                font-size: 0.9rem;
                font-weight: 500 !important;
            }

            #tablaProductos tbody tr:hover td {
                background-color: #f8fafc !important;
            }

        /* Diseño de botones de la tabla */
        .btn-action {
            border-radius: 6px !important;
            font-weight: 600 !important;
            padding: 5px 12px !important;
            font-size: 0.8rem !important;
            transition: all 0.2s ease !important;
        }

        /* Rediseño de Botones de Exportación de DataTables a Bootstrap 5 */
        .dt-buttons .btn {
            border-radius: 8px !important;
            font-weight: 600 !important;
            font-size: 0.85rem !important;
            padding: 6px 14px !important;
            margin-right: 5px !important;
            border: none !important;
            box-shadow: 0 2px 4px rgba(0,0,0,0.04) !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-4 bg-light min-vh-100">

        <div class="modal fade" id="modalProducto" tabindex="-1" aria-labelledby="modalEditarProductoLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered">
                <div class="modal-content border-0 shadow-lg rounded-3">
                    <div class="modal-header bg-dark text-white py-3">
                        <h5 class="modal-title d-flex align-items-center gap-2 fw-bold" id="modalEditarProductoLabel">
                            <i class="bi bi-box-seam-fill"></i>
                            <span>Detalles del Producto</span>
                        </h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body p-4">
                        <form id="formEditarProducto" autocomplete="off" enctype="multipart/form-data">
                            <input type="hidden" id="txtIdProducto" name="id" />

                            <div class="row g-4">
                                <div class="col-lg-8">
                                    <div class="row g-3">
                                        <div class="col-12">
                                            <label for="txtNombre" class="form-label small fw-bold text-secondary">Nombre del Producto</label>
                                            <input type="text" class="form-control rounded-2" id="txtNombre" name="nombre" required />
                                        </div>

                                        <div class="col-12">
                                            <label for="txtDescripcion" class="form-label small fw-bold text-secondary">Descripción</label>
                                            <textarea class="form-control rounded-2" id="txtDescripcion" name="descripcion" rows="2"></textarea>
                                        </div>

                                        <div class="col-md-6">
                                            <label for="ddlCategoria" class="form-label small fw-bold text-secondary">Categoría</label>
                                            <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select rounded-2"></asp:DropDownList>
                                        </div>

                                        <div class="col-md-6">
                                            <label for="ddlMarca" class="form-label small fw-bold text-secondary">Marca</label>
                                            <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select rounded-2">
                                                <asp:ListItem></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <div class="col-md-4">
                                            <label for="txtEstado" class="form-label small fw-bold text-secondary">Estado (1: Activo, 0: Inactivo)</label>
                                            <input type="text" class="form-control rounded-2" id="txtEstado" name="estado" min="0" max="1" required />
                                        </div>

                                        <div class="col-md-4">
                                            <label for="txtPrecio" class="form-label small fw-bold text-secondary">Precio ($)</label>
                                            <input type="number" class="form-control rounded-2" id="txtPrecio" name="precio" step="0.01" min="0" required />
                                        </div>

                                        <div class="col-md-4">
                                            <label for="txtStock" class="form-label small fw-bold text-secondary">Stock Actual</label>
                                            <input type="number" class="form-control rounded-2" id="txtStock" name="stock" min="0" required />
                                        </div>

                                        <div class="col-md-6">
                                            <label for="txtLimiteMinimo" class="form-label small fw-bold text-secondary">Límite Mínimo (Stock Crítico)</label>
                                            <input type="number" class="form-control rounded-2" id="txtLimiteMinimo" name="limiteMinimo" min="0" required />
                                        </div>

                                        <div class="col-md-6">
                                            <label for="txtLimiteVenta" class="form-label small fw-bold text-secondary">Límite de Venta (Por transacción)</label>
                                            <input type="number" class="form-control rounded-2" id="txtLimiteVenta" name="limiteVenta" min="1" required />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-4 border-start ps-lg-4 d-flex flex-column justify-content-between">
                                    <div>
                                        <label class="form-label small fw-bold text-secondary mb-3">Imagen del Producto</label>
                                        <div class="text-center p-3 border rounded bg-light mb-3 d-flex align-items-center justify-content-center" style="min-height: 220px;">
                                            <img id="imgPrevisualizacion" src="https://via.placeholder.com/180" class="img-fluid rounded shadow-sm" alt="Previsualización" style="max-height: 180px; object-fit: contain;" />
                                        </div>

                                        <div class="input-group shadow-sm">
                                            <span class="input-group-text bg-white border-end-0 text-secondary"><i class="bi bi-link-45deg"></i></span>
                                            <input type="text" id="txtImagenUrl" class="form-control border-start-0 ps-0" placeholder="URL de la imagen..." />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="modal-footer bg-light border-top-0 py-3">
                        <button type="button" class="btn btn-outline-secondary px-4 fw-semibold" data-bs-dismiss="modal">
                            <i class="bi bi-x-circle me-1"></i>Cancelar
                        </button>
                        <button type="button" class="btn btn-success px-4 fw-semibold shadow-sm" id="btnGuardar">
                            <i class="bi bi-check-circle me-1"></i>Guardar Cambios
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <header class="d-flex align-items-center justify-content-between pb-3 mb-4 border-bottom" data-purpose="main-header">
            <div>
                <h1 class="h2 fw-bold text-dark mb-1">Gestión de Productos</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 small uppercase tracking-wider font-weight-bold">
                        <li class="breadcrumb-item text-primary fw-semibold text-uppercase small">Inventario</li>
                        <li class="breadcrumb-item active text-muted small" aria-current="page">Catálogo</li>
                    </ol>
                </nav>
            </div>
            <div>
                <asp:LinkButton ID="btnCrearProducto" runat="server" OnClick="btnCrearProducto_Click"
                    CssClass="btn btn-dark d-inline-flex align-items-center gap-2 px-4 py-2.5 rounded-3 shadow-sm fw-semibold text-sm">
                    <i class="bi bi-plus-lg"></i>
                    <span>Crear producto</span>
                </asp:LinkButton>
            </div>
        </header>
        <main class="card border-0 shadow-sm rounded-3 overflow-hidden mb-4">
            <div class="card-body p-4">
                <div class="table-responsive">
                    <table id="tablaProductos" class="table table-hover align-middle w-100 m-0" clientidmode="Static">
                        <thead>
                            <tr>
                                <th>Imagen</th>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>Precio</th>
                                <th>Stock</th>
                                <th>Límite Venta</th>
                                <th>Límite Mín</th>
                                <th>Marca</th>
                                <th>Categoría</th>
                                <th>Estado</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
        <footer class="row g-3">
            <div class="col-12 col-md-4">
                <div class="card bg-primary text-white border-0 shadow-sm rounded-3 p-4 position-relative overflow-hidden group">
                    <div class="position-absolute end-0 bottom-0 mb-2 me-3 opacity-25" style="font-size: 4rem; line-height: 1;">
                        <i class="bi bi-box-seam"></i>
                    </div>
                    <span class="text-uppercase small tracking-widest fw-bold opacity-75 d-block mb-1">Total Productos</span>
                    <asp:Label ID="lblTotalProductos" runat="server" CssClass="display-6 fw-bold tracking-tight" Text="0"></asp:Label>
                </div>
            </div>

            <div class="col-12 col-md-4">
                <div class="card bg-white border border-light shadow-sm rounded-3 p-4 position-relative overflow-hidden">
                    <div class="position-absolute end-0 bottom-0 mb-2 me-3 text-danger opacity-25" style="font-size: 4rem; line-height: 1;">
                        <i class="bi bi-exclamation-triangle"></i>
                    </div>
                    <span class="text-uppercase small tracking-widest fw-bold text-muted d-block mb-1">Productos en Alerta</span>
                    <h3 class="display-6 fw-bold text-danger tracking-tight mb-0">--</h3>
                </div>
            </div>

            <div class="col-12 col-md-4">
                <div class="card bg-white border border-light shadow-sm rounded-3 p-4 position-relative overflow-hidden">
                    <div class="position-absolute end-0 bottom-0 mb-2 me-3 text-success opacity-25" style="font-size: 4rem; line-height: 1;">
                        <i class="bi bi-tags"></i>
                    </div>
                    <span class="text-uppercase small tracking-widest fw-bold text-muted d-block mb-1">Categorías del Sistema</span>
                    <h3 class="display-6 fw-bold text-success tracking-tight mb-0">--</h3>
                </div>
            </div>
        </footer>
    </div>
    <script>
        $(document).ready(function () {
            var table = $('#tablaProductos').DataTable({
                responsive: true,
                colReorder: true,
                "initComplete": function (settings, json) {
                    $('#tablaProductos thead').hide();
                },
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
