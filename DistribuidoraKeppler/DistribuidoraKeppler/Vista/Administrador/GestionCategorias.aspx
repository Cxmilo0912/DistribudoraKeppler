<%@ Page Title="Gestión de Categorías - Keppler" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="GestionCategorias.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.GestionCategorias" %>

<%-- =========================================================================
     BLOQUE 1: ARCHIVOS Y ESTILOS (HEAD)
     ========================================================================= --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Google Fonts: Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&amp;display=swap" rel="stylesheet" />

    <style data-purpose="kepler-categorias-theme">

        /* ── Variables globales Kepler ─────────────────────────────────── */
        :root {
            --kepler-blue:       #0b1184;
            --kepler-blue-dark:  #060a52;
            --kepler-blue-light: #eef0fd;
            --kepler-bg:         #f4f6fb;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--kepler-bg);
        }

        /* ── Blindaje sidebar de la Master Page ────────────────────────── */
        aside a, .sidebar a, .nav-link, aside .text-blue-600 {
            color: #ffffff !important;
            text-decoration: none !important;
        }
        aside a:hover, .sidebar a:hover, .nav-link:hover {
            color: rgba(255,255,255,0.8) !important;
        }

        /* ── Botón primario Kepler ──────────────────────────────────────── */
        .btn-kepler {
            background-color: var(--kepler-blue);
            border-color:     var(--kepler-blue);
            color: #fff;
            font-weight: 600;
            border-radius: 0.75rem;
            padding: 0.65rem 1.4rem;
            transition: background-color 0.2s ease, box-shadow 0.2s ease;
        }
        .btn-kepler:hover {
            background-color: var(--kepler-blue-dark);
            border-color:     var(--kepler-blue-dark);
            color: #fff;
            box-shadow: 0 6px 18px rgba(11, 17, 132, 0.22);
        }

        /* ── Tarjetas generales ─────────────────────────────────────────── */
        .kepler-card {
            border: none !important;
            border-radius: 1.25rem;
            box-shadow: 0 2px 14px rgba(17, 24, 76, 0.06);
            transition: transform 0.22s cubic-bezier(0.4,0,0.2,1),
                        box-shadow 0.22s ease;
        }
        .kepler-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 28px rgba(11, 17, 132, 0.10) !important;
        }

        /* ── Tarjeta hero oscura con gradiente ─────────────────────────── */
        .kepler-hero-card {
            background: linear-gradient(135deg, var(--kepler-blue) 0%, var(--kepler-blue-dark) 100%);
        }

        /* ── Glassmorphism sobre fondo oscuro ──────────────────────────── */
        .glass-badge {
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            border: 1px solid rgba(255,255,255,0.18);
        }

        /* ── Tarjetas de estadísticas pequeñas ─────────────────────────── */
        .kepler-stat-card {
            background: #fff;
            border-radius: 1.25rem;
            padding: 1rem 1.25rem;
            box-shadow: 0 2px 14px rgba(17, 24, 76, 0.06);
            border: none !important;
        }

        /* ── Barra de búsqueda ──────────────────────────────────────────── */
        .kepler-search-bar {
            border-radius: 1rem;
            border: none;
            box-shadow: 0 1px 6px rgba(17, 24, 76, 0.07);
            background: #fff;
        }
        .kepler-search-bar .input-group-text {
            background: #fff;
            border: none;
            color: #9aa0b4;
            padding-left: 1.1rem;
        }
        .kepler-search-bar .form-control {
            border: none;
            background: #fff;
            box-shadow: none;
            font-size: 0.9rem;
            padding: 0.8rem 1rem 0.8rem 0;
        }
        .kepler-search-bar .form-control:focus {
            box-shadow: none;
        }

        /* ── Tabla ──────────────────────────────────────────────────────── */
        #example thead th {
            font-size: 0.68rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: #9aa0b4;
            background-color: #f8f9fc;
            border-bottom: none !important;
            padding: 0.9rem 1.25rem;
        }
        #example tbody td {
            padding: 0.85rem 1.25rem;
            vertical-align: middle;
            border-bottom: 1px solid #f2f4f9;
            font-size: 0.9rem;
        }
        #example tbody tr:last-child td { border-bottom: none; }
        .table-hover tbody tr {
            transition: background-color 0.15s ease;
        }
        .table-hover tbody tr:hover {
            background-color: rgba(11, 17, 132, 0.025) !important;
        }

        /* ── Badge de stock ─────────────────────────────────────────────── */
        .badge-stock {
            background-color: var(--kepler-blue-light);
            color: var(--kepler-blue);
            font-weight: 600;
            border-radius: 999px;
            padding: 0.4rem 0.85rem;
            font-size: 0.78rem;
        }

        /* ── Ícono de categoría en tabla ────────────────────────────────── */
        .cat-icon-box {
            width: 38px;
            height: 38px;
            border-radius: 0.6rem;
            background-color: var(--kepler-blue-light);
            color: var(--kepler-blue);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
            flex-shrink: 0;
        }

        /* ── Paginación de DataTables ───────────────────────────────────── */
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            border-radius: 0.6rem !important;
            padding: 5px 12px !important;
            margin: 0 2px;
            border: 1px solid #e3e6f0 !important;
            background: #fff !important;
            color: var(--kepler-blue) !important;
            font-size: 0.82rem;
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button.current,
        .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
            background: var(--kepler-blue) !important;
            color: #fff !important;
            border-color: var(--kepler-blue) !important;
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
            background: var(--kepler-blue-light) !important;
            color: var(--kepler-blue) !important;
            border-color: #c8cdf5 !important;
        }

        /* ── Modal ──────────────────────────────────────────────────────── */
        .kepler-modal .modal-content {
            border: none;
            border-radius: 1.25rem;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(11, 17, 132, 0.18);
        }
        .kepler-modal .modal-header {
            background: linear-gradient(135deg, var(--kepler-blue) 0%, var(--kepler-blue-dark) 100%);
            border: none;
            padding: 1.1rem 1.5rem;
        }
        .kepler-modal .modal-body {
            padding: 1.5rem;
            background: #fff;
        }
        .kepler-modal .modal-footer {
            background: #f8f9fc;
            border: none;
            padding: 1rem 1.5rem;
        }
        .kepler-modal label {
            font-size: 0.7rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: #9aa0b4;
            margin-bottom: 0.4rem;
        }
        .kepler-modal .form-control {
            background-color: #f4f6fb;
            border: none;
            border-radius: 0.75rem;
            padding: 0.7rem 1rem;
            font-size: 0.9rem;
            box-shadow: none;
        }
        .kepler-modal .form-control:focus {
            background-color: #eef0fd;
            box-shadow: 0 0 0 0.2rem rgba(11,17,132,0.1);
        }

    </style>
</asp:Content>

<%-- =========================================================================
     BLOQUE 2: CUERPO VISUAL (CONTENTPLACEHOLDER1)
     ========================================================================= --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="px-4 px-md-5 py-4">

        <!-- ── ENCABEZADO ─────────────────────────────────────────────────── -->
        <header class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center gap-3 mb-4">
            <div>
                <span class="badge rounded-pill px-3 py-1 mb-2 text-white fw-semibold"
                      style="background-color: var(--kepler-blue); font-size: 0.7rem; letter-spacing: 0.04em;">
                    Módulo Almacén
                </span>
                <h2 class="fw-bold text-dark mb-1">Gestión de categorías</h2>
                <p class="text-muted small mb-0">Estructura de catálogo jerárquico para la optimización de stock de la distribuidora.</p>
            </div>
            <button type="button"
                    class="btn btn-kepler d-inline-flex align-items-center gap-2"
                    data-bs-toggle="modal"
                    data-bs-target="#modalCategoria">
                <i class="bi bi-plus-lg"></i>
                <span>Crear categoría</span>
            </button>
        </header>

        <!-- ── GRID BENTO (HERO + STATS) ──────────────────────────────────── -->
        <div class="row g-3 mb-4">

            <!-- Hero Card -->
            <div class="col-12 col-xl-6">
                <div class="kepler-card kepler-hero-card card text-white p-4 position-relative overflow-hidden h-100">
                    <div class="position-relative d-flex flex-column h-100 justify-content-between" style="z-index: 1;">
                        <div>
                            <span class="glass-badge badge rounded-pill px-3 py-1 text-white small mb-3 d-inline-block">
                                Control operativo
                            </span>
                            <h4 class="fw-bold mb-2">Segmentación estratégica</h4>
                            <p class="small mb-4" style="opacity: 0.65; max-width: 400px;">
                                La correcta organización por familias de productos mejora los tiempos de preparación
                                de pedidos y la logística interna en bodega.
                            </p>
                        </div>
                        <div class="d-flex gap-3">
                            <div class="glass-badge px-3 py-2 rounded-3 text-center" style="min-width: 100px;">
                                <span class="d-block fw-bold mb-0" style="font-size: 1.75rem;">12</span>
                                <span style="font-size: 0.65rem; text-transform: uppercase; letter-spacing: 0.05em; opacity: 0.6;">Secciones</span>
                            </div>
                            <div class="glass-badge px-3 py-2 rounded-3 text-center" style="min-width: 100px;">
                                <span class="d-block fw-bold mb-0" style="font-size: 1.75rem;">342</span>
                                <span style="font-size: 0.65rem; text-transform: uppercase; letter-spacing: 0.05em; opacity: 0.6;">Ítems activos</span>
                            </div>
                        </div>
                    </div>
                    <!-- Círculo decorativo de fondo -->
                    <div class="position-absolute rounded-circle bg-white"
                         style="width: 260px; height: 260px; bottom: -80px; right: -80px; opacity: 0.04; z-index: 0;"></div>
                </div>
            </div>

            <!-- Stat: Productos globales -->
            <div class="col-12 col-md-6 col-xl-3">
                <div class="kepler-stat-card kepler-card h-100 d-flex flex-column justify-content-between">
                    <div class="d-flex justify-content-between align-items-start">
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                             style="width: 42px; height: 42px; background-color: #e3f7ec; color: #1e9e5a;">
                            <i class="bi bi-box-seam-fill fs-5"></i>
                        </div>
                        <span class="small fw-semibold text-success">
                            <i class="bi bi-arrow-up-short"></i>+8% mes
                        </span>
                    </div>
                    <div class="mt-4">
                        <p class="text-muted mb-1" style="font-size: 0.7rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em;">Productos globales</p>
                        <h3 class="fw-bold mb-0" style="color: var(--kepler-blue); font-size: 2rem;">342</h3>
                    </div>
                </div>
            </div>

            <!-- Stat: Promedio densidad -->
            <div class="col-12 col-md-6 col-xl-3">
                <div class="kepler-stat-card kepler-card h-100 d-flex flex-column justify-content-between">
                    <div class="d-flex justify-content-between align-items-start">
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                             style="width: 42px; height: 42px; background-color: #fef2e1; color: #c2790a;">
                            <i class="bi bi-pie-chart-fill fs-5"></i>
                        </div>
                        <span class="small text-muted">Equilibrado</span>
                    </div>
                    <div class="mt-4">
                        <p class="text-muted mb-1" style="font-size: 0.7rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em;">Promedio densidad</p>
                        <h3 class="fw-bold mb-0" style="color: var(--kepler-blue); font-size: 2rem;">28.5</h3>
                    </div>
                </div>
            </div>

        </div>
        <!-- FIN GRID BENTO -->

        <!-- ── BARRA DE BÚSQUEDA ───────────────────────────────────────────── -->
        <div class="mb-4">
            <div class="input-group kepler-search-bar overflow-hidden">
                <span class="input-group-text">
                    <i class="bi bi-search"></i>
                </span>
                <input id="txtBuscarCategoria"
                       class="form-control"
                       placeholder="Filtrar categorías por coincidencia de texto en tiempo real..."
                       type="text" />
            </div>
        </div>

        <!-- ── TABLA DE CATEGORÍAS ─────────────────────────────────────────── -->
        <div class="kepler-card card overflow-hidden mb-4">
            <div class="card-header bg-white border-0 px-4 pt-4 pb-3 d-flex justify-content-between align-items-center">
                <h5 class="fw-bold mb-0 text-dark">Categorías registradas</h5>
                <span class="badge rounded-pill px-3 py-2 border fw-normal small"
                      style="background-color: var(--kepler-blue-light); color: var(--kepler-blue); font-size: 0.72rem;">
                    Visualización dinámica
                </span>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table id="example" class="table table-hover align-middle mb-0 w-100">
                        <thead>
                            <tr>
                                <th>Estructura / Categoría</th>
                                <th>Descripción</th>
                                <th>Volumen de stock</th>
                                <th class="text-end" style="width: 130px;">Operaciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Fila de ejemplo — tus datos vendrán del CodeBehind -->
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="cat-icon-box">
                                            <i class="bi bi-folder2-open"></i>
                                        </div>
                                        <div>
                                            <span class="fw-semibold d-block text-dark">Bebidas</span>
                                            <small class="text-muted" style="font-size: 0.7rem;">ID-001</small>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-muted small">
                                    Productos líquidos, refrescos enlatados, jugos naturales y aguas minerales.
                                </td>
                                <td>
                                    <span class="badge-stock">25 productos</span>
                                </td>
                                <td class="text-end">
                                    <div class="d-inline-flex gap-2">
                                        <button type="button"
                                                class="btn btn-sm btn-light border rounded-2"
                                                style="color: #c2790a;"
                                                title="Editar categoría">
                                            <i class="bi bi-pencil-square"></i>
                                        </button>
                                        <button type="button"
                                                class="btn btn-sm btn-light border rounded-2"
                                                style="color: #d63c1d;"
                                                title="Eliminar categoría">
                                            <i class="bi bi-trash3"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- FIN TABLA -->

    </div>
    <!-- FIN CONTENEDOR PRINCIPAL -->

    <!-- =========================================================================
         MODAL CREAR CATEGORÍA
         ========================================================================= -->
    <div class="modal fade kepler-modal" id="modalCategoria" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title d-flex align-items-center gap-2 fw-bold fs-6 text-white">
                        <i class="bi bi-folder-plus fs-5"></i>
                        <span>Añadir nueva categoría</span>
                    </h5>
                    <button type="button" class="btn-close btn-close-white shadow-none" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Nombre comercial</label>
                        <input type="text"
                               class="form-control"
                               placeholder="Ej: Abarrotes, Confitería, Bebidas..." />
                    </div>
                    <div class="mb-0">
                        <label class="form-label">Descripción de alcance</label>
                        <textarea class="form-control"
                                  rows="3"
                                  placeholder="Especifica qué tipos de productos abarca esta categoría..."></textarea>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button"
                            class="btn btn-link link-secondary text-decoration-none fw-semibold small"
                            data-bs-dismiss="modal">
                        Cancelar
                    </button>
                    <button type="button" class="btn btn-kepler px-4">
                        Confirmar registro
                    </button>
                </div>

            </div>
        </div>
    </div>

    <!-- ── SCRIPTS ──────────────────────────────────────────────────────────── -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            var table = $('#example').DataTable({
                searching: true,
                paging: true,
                info: false,
                pageLength: 5,
                dom: 'rtp',
                language: {
                    paginate: {
                        previous: "<i class='bi bi-chevron-left'></i>",
                        next: "<i class='bi bi-chevron-right'></i>"
                    }
                }
            });

            $('#txtBuscarCategoria').on('keyup input', function () {
                table.search($(this).val()).draw();
            });
        });
    </script>
</asp:Content>

