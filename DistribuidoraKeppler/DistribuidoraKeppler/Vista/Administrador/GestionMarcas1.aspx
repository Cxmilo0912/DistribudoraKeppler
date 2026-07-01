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

        <!-- ENCABEZADO -->
        <header class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center gap-3 mb-4">
            <div>
                <p class="text-muted mb-1 small fw-semibold" style="letter-spacing: 0.04em; text-transform: uppercase;">Inventario / Marcas</p>
                <h2 class="fw-bold text-dark mb-0" style="font-size: 1.5rem;">Gestión de Marcas</h2>
            </div>
            <button type="button" class="btn btn-kepler d-inline-flex align-items-center gap-2"
                data-bs-toggle="modal" data-bs-target="#modalMarca">
                <i class="bi bi-plus-lg"></i>
                <span>Nueva Marca</span>
            </button>
        </header>

        <!-- STATS -->
        <div class="row g-3 mb-4">
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="kepler-stat-card kepler-card h-100">
                    <div class="d-flex align-items-center justify-content-between">
                        <div>
                            <p class="text-muted mb-1" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em;">Total Marcas</p>
                            <asp:Label ID="lblTotalMarcas" runat="server" CssClass="fw-bold mb-0" Style="font-size: 1.75rem; color: var(--kepler-blue);" Text="0" />
                        </div>
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                            style="width: 46px; height: 46px; background-color: var(--kepler-blue-light); color: var(--kepler-blue); flex-shrink: 0;">
                            <i class="bi bi-patch-check-fill fs-5"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="kepler-stat-card kepler-card h-100">
                    <div class="d-flex align-items-center justify-content-between">
                        <div>
                            <p class="text-muted mb-1" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em;">Nuevas este mes</p>
                            <h3 class="fw-bold mb-0" style="font-size: 1.75rem; color: #1e9e5a;">3</h3>
                        </div>
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                            style="width: 46px; height: 46px; background-color: #e3f7ec; color: #1e9e5a; flex-shrink: 0;">
                            <i class="bi bi-calendar-check-fill fs-5"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="kepler-stat-card kepler-card h-100">
                    <div class="d-flex align-items-center justify-content-between">
                        <div>
                            <p class="text-muted mb-1" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em;">Productos asociados</p>
                            <h3 class="fw-bold mb-0" style="font-size: 1.75rem; color: var(--kepler-blue);">200</h3>
                        </div>
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                            style="width: 46px; height: 46px; background-color: var(--kepler-blue-light); color: var(--kepler-blue); flex-shrink: 0;">
                            <i class="bi bi-box-seam-fill fs-5"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- TABLA -->
        <div class="kepler-card card overflow-hidden mb-4">
            <div class="card-header bg-white border-0 px-4 pt-4 pb-3 d-flex justify-content-between align-items-center">
                <h6 class="fw-bold mb-0 text-dark d-flex align-items-center gap-2">
                    <i class="bi bi-tag-fill" style="color: var(--kepler-blue);"></i>
                    Lista de marcas
                </h6>
                <span class="badge rounded-pill px-3 py-2"
                    style="background-color: var(--kepler-blue-light); color: var(--kepler-blue); font-size: .7rem; font-weight: 600;">Registro activo
                </span>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table kepler-table table-hover align-middle mb-0 w-100">
                        <thead>
                            <tr>
                                <th>Marca</th>
                                <th class="text-end" style="width: 180px;">Acciones</th>
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
                                                <button type="button" class="btn btn-sm btn-action-edit px-3 btn-editar"
                                                    data-id="<%# Eval("Id") %>"
                                                    data-nombre="<%# Eval("Nombre") %>">
                                                    <i class="bi bi-pencil-square me-1"></i>Editar</button>
                                                <button type="button" class="btn btn-sm btn-action-del px-3 btn-eliminar"><i class="bi bi-trash3 me-1"></i>Eliminar</button>
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

    </div>

    <!-- MODAL AGREGAR MARCA -->
    <div class="modal fade" id="modalMarca" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 480px;">
            <div class="modal-content" style="border: none; border-radius: 20px; overflow: hidden; box-shadow: 0 20px 60px rgba(0,0,0,0.12);">

                <!-- Header -->
                <div class="d-flex align-items-center justify-content-between px-4 py-3" style="border-bottom: 1px solid #f1f5f9;">
                    <div class="d-flex align-items-center gap-3">
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                            style="width: 40px; height: 40px; background: linear-gradient(135deg, #0b1184, #060a52);">
                            <i class="bi bi-patch-plus-fill text-white"></i>
                        </div>
                        <div>
                            <h6 class="fw-bold mb-0 text-dark" style="font-size: 0.95rem;">Nueva Marca</h6>
                            <p class="text-muted mb-0" style="font-size: 0.75rem;">Complete los datos de la marca</p>
                        </div>
                    </div>
                    <button type="button" class="btn-close shadow-none" data-bs-dismiss="modal"></button>
                </div>

                <!-- Body -->
                <div class="px-4 py-4" style="background: #fff;">
                    <div class="mb-3">
                        <label class="form-label" style="font-size: 0.7rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em; color: #94a3b8;">Nombre de la marca *</label>
                        <asp:TextBox ID="txtNombreMarca" runat="server"
                            CssClass="form-control"
                            placeholder="Ej: Coca-Cola, Colgate, Scott..." />
                    </div>
                    <div class="mb-3">
                        <label class="form-label" style="font-size: 0.7rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em; color: #94a3b8;">País de origen</label>
                        <asp:TextBox ID="txtPaisOrigen" runat="server"
                            CssClass="form-control"
                            placeholder="Ej: Colombia, Estados Unidos..." />
                    </div>
                    <div class="mb-3">
                        <label class="form-label" style="font-size: 0.7rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em; color: #94a3b8;">Descripción</label>
                        <asp:TextBox ID="txtTextMode" runat="server"
                            TextMode="MultiLine" Rows="3"
                            CssClass="form-control"
                            placeholder="Breve descripción de la marca..." />
                    </div>
                    <div class="mb-1">
                        <label class="form-label" style="font-size: 0.7rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em; color: #94a3b8;">Logo</label>
                        <div class="upload-zone">
                            <i class="bi bi-cloud-arrow-up fs-4 mb-1 d-block" style="color: var(--kepler-blue); opacity: .5;"></i>
                            <input type="file" id="fuLogo" name="fuLogo" class="form-control form-control-sm mt-2" accept=".png,.jpg,.jpeg" />
                            <p class="text-muted mb-0 mt-2" style="font-size: .72rem;">PNG, JPG · Máx 5 MB</p>
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <div class="d-flex align-items-center justify-content-end gap-2 px-4 py-3" style="background: #f8fafc; border-top: 1px solid #f1f5f9;">
                    <button type="button" class="btn btn-sm fw-semibold text-muted" data-bs-dismiss="modal"
                        style="background: #f1f5f9; border: none; border-radius: 10px; padding: 8px 18px;">
                        Cancelar
                    </button>
                    <asp:Button ID="btnGuardarMarca" runat="server"
                        Text="Guardar Marca"
                        OnClick="btnGuardarMarca_Click"
                        CssClass="btn btn-kepler btn-sm px-4"
                        UseSubmitBehavior="false" />
                </div>

            </div>
        </div>
    </div>

    <!--Modal Editar -->
    <div class="modal fade" id="modalEditarMarca" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 440px;">
            <div class="modal-content" style="border: none; border-radius: 20px; overflow: hidden; box-shadow: 0 20px 60px rgba(0,0,0,0.12);">

                <!-- Header -->
                <div class="d-flex align-items-center justify-content-between px-4 py-3" style="border-bottom: 1px solid #f1f5f9;">
                    <div class="d-flex align-items-center gap-3">
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                            style="width: 40px; height: 40px; background: linear-gradient(135deg, #0b1184, #060a52);">
                            <i class="bi bi-pencil-square text-white"></i>
                        </div>
                        <div>
                            <h6 class="fw-bold mb-0 text-dark" style="font-size: 0.95rem;">Editar Marca</h6>
                            <p class="text-muted mb-0" style="font-size: 0.75rem;">Modifica los datos de la marca</p>
                        </div>
                    </div>
                    <button type="button" class="btn-close shadow-none" data-bs-dismiss="modal"></button>
                </div>

                <!-- Body -->
                <div class="px-4 py-4" style="background: #fff;">
                    <asp:HiddenField ID="hfIdMarca" runat="server" />

                    <div class="mb-3">
                        <label class="form-label" style="font-size: 0.7rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em; color: #94a3b8;">Nombre de la marca *</label>
                        <asp:TextBox ID="txtEditNombre" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-1">
                        <label class="form-label" style="font-size: 0.7rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.05em; color: #94a3b8;">Logo</label>
                        <div class="upload-zone">
                            <i class="bi bi-cloud-arrow-up fs-4 mb-1 d-block" style="color: var(--kepler-blue); opacity: .5;"></i>
                            <asp:FileUpload ID="fuImagen" runat="server" CssClass="form-control form-control-sm mt-2" />
                            <p class="text-muted mb-0 mt-2" style="font-size: .72rem;">PNG, JPG · Máx 5 MB</p>
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <div class="d-flex align-items-center justify-content-end gap-2 px-4 py-3" style="background: #f8fafc; border-top: 1px solid #f1f5f9;">
                    <button type="button" class="btn btn-sm fw-semibold text-muted" data-bs-dismiss="modal"
                        style="background: #f1f5f9; border: none; border-radius: 10px; padding: 8px 18px;">
                        Cancelar
                    </button>
                    <asp:Button ID="btnActualizarMarca" runat="server"
                        Text="Actualizar Marca"
                        OnClick="btnActualizarMarca_Click"
                        CssClass="btn btn-ke"/>
                </div>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function abrirModal(nombre, logo) {
            document.getElementById('txtEditNombreMarca').innerText = nombre;

            document.getElementById('modalEditarMarca').classList.add('active');
        };

        function cerrarModal() {
            document.getElementById('modalEditarMarca').classList.remove('active')
        }


        document.addEventListener('DOMContentLoaded', function () {
            document.querySelectorAll('.btn-editar').forEach(function (boton) {
                boton.addEventListener('click', function () {
                    var idMarca = boton.dataset.id;
                    var nombreMarca = boton.dataset.nombre;

                    document.getElementById('<%= hfIdMarca.ClientID %>').value = idMarca;
                    document.getElementById('<%= txtEditNombre.ClientID %>').value = nombreMarca;

                    var inputNativo = document.getElementById('txtEditNombreMarca');
                    if (inputNativo) inputNativo.value = nombreMarca;

                    new bootstrap.Modal(document.getElementById('modalEditarMarca')).show();
                });
            });
        });
    </script>

</asp:Content>
