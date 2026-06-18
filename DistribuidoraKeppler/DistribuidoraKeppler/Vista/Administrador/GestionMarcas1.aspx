<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vista/Site1.Master" CodeBehind="GestionMarcas1.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.GestionMarcas1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Bootstrap 5 + Bootstrap Icons + Inter -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&amp;display=swap" rel="stylesheet" />

    <style data-purpose="kepler-marcas-theme">
        /* ── Variables globales Kepler ─────────────────────────────── */
        :root {
            --kepler-blue: #0b1184;
            --kepler-blue-dark: #060a52;
            --kepler-blue-light: #eef0fd;
            --kepler-bg: #f4f6fb;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--kepler-bg);
        }

        /* ── Blindaje sidebar Master Page ──────────────────────────── */
        aside a, .sidebar a, .nav-link,
        .list-group-item a, [class*="sidebar"] a, [class*="menu"] a {
            color: #ffffff !important;
            text-decoration: none !important;
        }

            aside a:hover, .sidebar a:hover, .nav-link:hover,
            .list-group-item a:hover, [class*="sidebar"] a:hover, [class*="menu"] a:hover {
                color: rgba(255,255,255,0.8) !important;
                text-decoration: none !important;
            }

        .text-blue-600, .text-primary {
            color: #ffffff !important;
        }

        /* ── Botón primario Kepler ─────────────────────────────────── */
        .btn-kepler {
            background-color: var(--kepler-blue);
            border-color: var(--kepler-blue);
            color: #fff;
            font-weight: 600;
            border-radius: 0.75rem;
            padding: 0.65rem 1.4rem;
            transition: background-color 0.2s ease, box-shadow 0.2s ease;
        }

            .btn-kepler:hover {
                background-color: var(--kepler-blue-dark);
                border-color: var(--kepler-blue-dark);
                color: #fff;
                box-shadow: 0 6px 18px rgba(11, 17, 132, 0.22);
            }

        /* ── Tarjeta base ──────────────────────────────────────────── */
        .kepler-card {
            border: none !important;
            border-radius: 1.25rem;
            box-shadow: 0 2px 14px rgba(17, 24, 76, 0.06);
            transition: transform 0.22s cubic-bezier(0.4,0,0.2,1), box-shadow 0.22s ease;
        }

            .kepler-card:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 28px rgba(11, 17, 132, 0.10) !important;
            }

        /* ── Tarjeta hero ──────────────────────────────────────────── */
        .kepler-hero-card {
            background: linear-gradient(135deg, var(--kepler-blue) 0%, var(--kepler-blue-dark) 100%);
        }

        .glass-badge {
            background: rgba(255,255,255,0.12);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            border: 1px solid rgba(255,255,255,0.18);
        }

        /* ── Stat cards pequeñas ───────────────────────────────────── */
        .kepler-stat-card {
            background: #fff;
            border-radius: 1.25rem;
            padding: 1.1rem 1.25rem;
            box-shadow: 0 2px 14px rgba(17, 24, 76, 0.06);
            border: none !important;
        }

        /* ── Tabla ─────────────────────────────────────────────────── */
        .kepler-table thead th {
            font-size: 0.68rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: #9aa0b4;
            background-color: #f8f9fc;
            border-bottom: none !important;
            padding: 0.9rem 1.25rem;
        }

        .kepler-table tbody td {
            padding: 0.85rem 1.25rem;
            vertical-align: middle;
            border-bottom: 1px solid #f2f4f9;
            font-size: 0.9rem;
        }

        .kepler-table tbody tr:last-child td {
            border-bottom: none;
        }

        .kepler-table tbody tr {
            transition: background-color 0.15s ease;
        }

            .kepler-table tbody tr:hover {
                background-color: rgba(11,17,132,0.025) !important;
            }

        /* ── Ícono de marca en tabla ───────────────────────────────── */
        .brand-icon-box {
            width: 36px;
            height: 36px;
            border-radius: 0.6rem;
            background-color: var(--kepler-blue-light);
            color: var(--kepler-blue);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.95rem;
            flex-shrink: 0;
        }

        /* ── Botones de acción en tabla ────────────────────────────── */
        .btn-action-edit {
            color: #c2790a;
            background: #fff;
            border: 1px solid #e3e6f0;
            border-radius: 0.5rem;
        }

        .btn-action-del {
            color: #d63c1d;
            background: #fff;
            border: 1px solid #e3e6f0;
            border-radius: 0.5rem;
        }

        .btn-action-edit:hover {
            background: #fef2e1;
            border-color: #f0c97a;
            color: #c2790a;
        }

        .btn-action-del:hover {
            background: #faece7;
            border-color: #f0a08a;
            color: #d63c1d;
        }

        /* ── Zona de upload de logo ────────────────────────────────── */
        .upload-zone {
            border: 2px dashed #d0d4e8;
            border-radius: 0.75rem;
            background-color: #f8f9fc;
            padding: 1.25rem;
            text-align: center;
            transition: border-color 0.2s ease, background-color 0.2s ease;
        }

            .upload-zone:hover {
                border-color: var(--kepler-blue);
                background-color: var(--kepler-blue-light);
            }

        /* ── Modal ─────────────────────────────────────────────────── */
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
                background-color: var(--kepler-blue-light);
                box-shadow: 0 0 0 0.2rem rgba(11,17,132,0.1);
            }
    </style>

    <div class="px-4 px-md-5 py-4">

        <!-- ── ENCABEZADO ────────────────────────────────────────────────── -->
        <header class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center gap-3 mb-4">
            <div>
                <span class="badge rounded-pill px-3 py-1 mb-2 text-white fw-semibold d-inline-block"
                    style="background-color: var(--kepler-blue); font-size: 0.7rem; letter-spacing: 0.04em;">Módulo Inventario
                </span>
                <h2 class="fw-bold text-dark mb-1">Gestión de marcas</h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 small">
                        <li class="breadcrumb-item text-muted fw-semibold">Inventario</li>
                        <li class="breadcrumb-item active text-muted" aria-current="page">Marcas</li>
                    </ol>
                </nav>
            </div>
            <button type="button"
                class="btn btn-kepler d-inline-flex align-items-center gap-2"
                data-bs-toggle="modal"
                data-bs-target="#modalMarca">
                <i class="bi bi-plus-lg"></i>
                <span>Agregar marca</span>
            </button>
        </header>

        <!-- ── GRID BENTO (HERO + STATS) ─────────────────────────────────── -->
        <div class="row g-3 mb-4">

            <!-- Hero Card -->
            <div class="col-12 col-xl-6">
                <div class="kepler-card kepler-hero-card card text-white p-4 position-relative overflow-hidden h-100">
                    <div class="position-relative d-flex flex-column h-100 justify-content-between" style="z-index: 1;">
                        <div>
                            <span class="glass-badge badge rounded-pill px-3 py-1 text-white small mb-3 d-inline-block">Control de marca
                            </span>
                            <h4 class="fw-bold mb-2">Catálogo de marcas</h4>
                            <p class="small mb-0" style="opacity: .65; max-width: 400px;">
                                Administra y centraliza las marcas que distribuye Kepler. Una buena clasificación
                                por marca agiliza la gestión de proveedores y el control de stock.
                            </p>
                        </div>
                        <div class="d-flex gap-3 mt-4">
                            <div class="glass-badge px-3 py-2 rounded-3 text-center" style="min-width: 100px;">
                                <asp:Label ID="lblTotalMarcas" runat="server"
                                    CssClass="d-block fw-bold mb-0"
                                    Style="font-size: 1.75rem;"
                                    Text="0" />
                                <span style="font-size: .65rem; text-transform: uppercase; letter-spacing: .05em; opacity: .6;">Total marcas</span>
                            </div>
                            <div class="glass-badge px-3 py-2 rounded-3 text-center" style="min-width: 100px;">
                                <span class="d-block fw-bold mb-0" style="font-size: 1.75rem;">200</span>
                                <span style="font-size: .65rem; text-transform: uppercase; letter-spacing: .05em; opacity: .6;">Productos</span>
                            </div>
                        </div>
                    </div>
                    <div class="position-absolute rounded-circle bg-white"
                        style="width: 260px; height: 260px; bottom: -80px; right: -80px; opacity: .04; z-index: 0;">
                    </div>
                </div>
            </div>

            <!-- Stat: Nuevas este mes -->
            <div class="col-12 col-md-6 col-xl-3">
                <div class="kepler-stat-card kepler-card h-100 d-flex flex-column justify-content-between">
                    <div class="d-flex justify-content-between align-items-start">
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                            style="width: 42px; height: 42px; background-color: #e3f7ec; color: #1e9e5a;">
                            <i class="bi bi-calendar-check-fill fs-5"></i>
                        </div>
                        <span class="small fw-semibold text-success">
                            <i class="bi bi-arrow-up-short"></i>Este mes
                        </span>
                    </div>
                    <div class="mt-4">
                        <p class="text-muted mb-1" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em;">Nuevas marcas</p>
                        <h3 class="fw-bold mb-0" style="color: var(--kepler-blue); font-size: 2rem;">3</h3>
                    </div>
                </div>
            </div>

            <!-- Stat: Productos asociados -->
            <div class="col-12 col-md-6 col-xl-3">
                <div class="kepler-stat-card kepler-card h-100 d-flex flex-column justify-content-between">
                    <div class="d-flex justify-content-between align-items-start">
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                            style="width: 42px; height: 42px; background-color: #eef0fd; color: var(--kepler-blue);">
                            <i class="bi bi-box-seam-fill fs-5"></i>
                        </div>
                        <span class="small text-muted">Asociados</span>
                    </div>
                    <div class="mt-4">
                        <p class="text-muted mb-1" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em;">Productos asociados</p>
                        <h3 class="fw-bold mb-0" style="color: var(--kepler-blue); font-size: 2rem;">200</h3>
                    </div>
                </div>
            </div>

        </div>
        <!-- FIN GRID BENTO -->

        <!-- ── TABLA DE MARCAS ────────────────────────────────────────────── -->
        <div class="kepler-card card overflow-hidden mb-4">
            <div class="card-header bg-white border-0 px-4 pt-4 pb-3 d-flex justify-content-between align-items-center">
                <h5 class="fw-bold mb-0 text-dark">
                    <i class="bi bi-list-ul me-2" style="color: var(--kepler-blue);"></i>
                    Lista de marcas
                </h5>
                <span class="badge rounded-pill px-3 py-2 border fw-normal small"
                    style="background-color: var(--kepler-blue-light); color: var(--kepler-blue); font-size: .72rem;">Registro activo
                </span>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table kepler-table table-hover align-middle mb-0 w-100">
                        <thead>
                            <tr>
                                <th>Nombre de la marca</th>
                                <th class="text-end" style="width: 160px;">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rpMarcas" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center gap-3">
                                                <div class="brand-icon-box">
                                                    <i class="bi bi-tag-fill"></i>
                                                </div>
                                                <span class="fw-semibold text-dark"><%# Eval("Nombre") %></span>
                                            </div>
                                        </td>
                                        <td class="text-end">
                                            <div class="d-inline-flex gap-2">
                                                <asp:LinkButton runat="server"
                                                    CssClass="btn btn-sm btn-action-edit px-3"
                                                    title="Editar marca">
                                                    <i class="bi bi-pencil-square me-1"></i>Editar
                                                </asp:LinkButton>
                                                <asp:LinkButton runat="server"
                                                    CssClass="btn btn-sm btn-action-del px-3"
                                                    title="Eliminar marca">
                                                    <i class="bi bi-trash3 me-1"></i>Eliminar
                                                </asp:LinkButton>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- FIN TABLA -->

    </div>
    <!-- FIN CONTENEDOR PRINCIPAL -->

    <!-- =========================================================================
         MODAL AGREGAR MARCA
         ========================================================================= -->
    <div class="modal fade kepler-modal" id="modalMarca" tabindex="-1"
        aria-labelledby="modalMarcaLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title d-flex align-items-center gap-2 fw-bold fs-6 text-white"
                        id="modalMarcaLabel">
                        <i class="bi bi-patch-plus-fill fs-5"></i>
                        <span>Agregar nueva marca</span>
                    </h5>
                    <button type="button" class="btn-close btn-close-white shadow-none"
                        data-bs-dismiss="modal" aria-label="Close">
                    </button>
                </div>

                <div class="modal-body">
                    <div class="row g-3">

                        <div class="col-12">
                            <label class="form-label">Nombre de la marca</label>
                            <asp:TextBox ID="txtNombreMarca" runat="server"
                                CssClass="form-control"
                                placeholder="Ej: Coca-Cola, Scott, Colgate..." />
                        </div>

                        <div class="col-12">
                            <label class="form-label">País de origen</label>
                            <asp:TextBox ID="txtPaisOrigen" runat="server"
                                CssClass="form-control"
                                placeholder="Ej: Colombia, Estados Unidos..." />
                        </div>

                        <div class="col-12">
                            <label class="form-label">Descripción</label>
                            <asp:TextBox ID="txtTextMode" runat="server"
                                TextMode="MultiLine" Rows="3"
                                CssClass="form-control"
                                placeholder="Breve descripción de la marca..." />
                        </div>

                        <div class="col-12">
                            <label class="form-label">Logo de la marca</label>
                            <div class="upload-zone">
                                <i class="bi bi-cloud-arrow-up fs-3 mb-2 d-block" style="color: var(--kepler-blue); opacity: .5;"></i>
                                <asp:FileUpload ID="fuLogo" runat="server"
                                    CssClass="form-control form-control-sm" />
                                <p class="text-muted mb-0 mt-2" style="font-size: .75rem;">
                                    Formatos PNG, JPG · Máximo 5 MB
                                </p>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button"
                        class="btn btn-link link-secondary text-decoration-none fw-semibold small"
                        data-bs-dismiss="modal">
                        Cancelar
                    </button>
                    <asp:Button
                        ID="btnGuardarMarca"
                        runat="server"
                        Text="Guardar marca"
                        OnClick="btnGuardarMarca_Click"
                        CssClass="btn btn-kepler px-4" />
                </div>

            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</asp:Content>
