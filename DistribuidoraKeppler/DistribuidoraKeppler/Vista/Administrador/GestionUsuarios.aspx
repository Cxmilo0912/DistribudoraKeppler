<%@ Page Title="Kepler Admin - Gestión de Usuarios" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="GestionUsuarios.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Aministrador.GestionUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <link href="https://cdn.datatables.net/v/bs5/jszip-3.10.1/dt-2.0.8/b-3.0.2/b-colvis-3.0.2/b-html5-3.0.2/b-print-3.0.2/cr-2.0.3/fc-5.0.1/fh-4.0.1/r-3.0.2/sp-2.3.3/sl-2.0.3/datatables.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <script src="https://cdn.datatables.net/v/bs5/jszip-3.10.1/dt-2.0.8/b-3.0.2/b-colvis-3.0.2/b-html5-3.0.2/b-print-3.0.2/cr-2.0.3/fc-5.0.1/fh-4.0.1/r-3.0.2/sp-2.3.3/sl-2.0.3/datatables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="../Assets/css/GestionUsuario.css" />
    <style>
        .dt-paging .pagination,
        .dataTables_paginate .pagination,
        .pagination {
            display: flex !important;
            gap: 8px !important; /* Separa los botones para que no se vean pegados */
            margin-top: 20px !important;
            padding-left: 0;
            list-style: none;
        }

            .dt-paging .pagination .page-item .page-link,
            .dataTables_paginate .pagination .page-item .page-link,
            .pagination .page-item .page-link {
                border: 1px solid #dee2e6 !important;
                color: #0d6efd !important; /* Azul de Bootstrap */
                background-color: #ffffff !important;
                padding: 6px 14px !important;
                border-radius: 8px !important; /* Bordes redondeados modernos */
                font-weight: 500 !important;
                transition: all 0.2s ease-in-out !important;
                box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05) !important;
            }

                .dt-paging .pagination .page-item .page-link:hover,
                .dataTables_paginate .pagination .page-item .page-link:hover,
                .pagination .page-item .page-link:hover {
                    background-color: #f8f9fa !important;
                    color: #0a58ca !important;
                    border-color: #cbd5e1 !important;
                    transform: translateY(-1px) !important; /* Sutil efecto de levante */
                }

            .dt-paging .pagination .page-item.active .page-link,
            .dataTables_paginate .pagination .page-item.active .page-link,
            .pagination .page-item.active .page-link {
                background-color: #0d6efd !important; /* Azul sólido */
                border-color: #0d6efd !important;
                color: #ffffff !important;
                font-weight: bold !important;
                box-shadow: 0 4px 10px rgba(13, 110, 253, 0.25) !important; /* Sombra elegante */
            }

            /* 5. Estilo para los botones deshabilitados (Anterior/Siguiente cuando no se pueden usar) */
            .dt-paging .pagination .page-item.disabled .page-link,
            .dataTables_paginate .pagination .page-item.disabled .page-link,
            .pagination .page-item.disabled .page-link {
                background-color: #f1f5f9 !important;
                color: #94a3b8 !important;
                border-color: #e2e8f0 !important;
                opacity: 0.7 !important;
                cursor: not-allowed !important;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-4 bg-light min-vh-100">

        <header class="d-flex flex-column flex-md-row align-items-md-center justify-content-between pb-4 mb-4 border-bottom" data-purpose="main-header">
            <div>
                <h1 class="h2 fw-bold text-dark mb-1">Gestión de Usuarios</h1>
                <p class="text-muted small mb-0">Administra los accesos, roles y permisos de la plataforma.</p>
            </div>

            <div class="d-flex align-items-center gap-3 mt-3 mt-md-0">
                <button type="button" class="btn btn-primary d-inline-flex align-items-center gap-2 px-4 py-2 rounded-3 shadow-sm fw-semibold">
                    <i class="bi bi-person-plus-fill"></i>
                    <span>Agregar Usuario</span>
                </button>

                <div class="position-relative">
                    <button type="button" class="btn btn-white border rounded-circle d-flex align-items-center justify-center p-2 shadow-sm hover-bg-light" style="width: 42px; height: 42px;">
                        <i class="bi bi-bell text-secondary fs-5"></i>
                    </button>
                    <span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle">
                        <span class="visually-hidden">Alertas</span>
                    </span>
                </div>
            </div>
        </header>
        <section class="row g-3 mb-4">
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card border-0 shadow-sm rounded-3 p-3">
                    <div class="d-flex align-items-center justify-content-between">
                        <div>
                            <span class="text-muted small fw-bold text-uppercase">Total Usuarios</span>
                            <br />
                            <asp:Label ID="lblTotalUsuarios" runat="server" Text="" CssClass="fw-bold text-dark mt-1 mb-0 "></asp:Label>
                        </div>
                        <div class="p-3 bg-primary-subtle text-primary rounded-3 fs-3 d-flex">
                            <i class="bi bi-people"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card border-0 shadow-sm rounded-3 p-3">
                    <div class="d-flex align-items-center justify-content-between">
                        <div>
                            <span class="text-muted small fw-bold text-uppercase">Administradores</span>
                            <br />
                            <asp:label ID="lblAdmins" runat="server" text="" cssclass="fw-bold text-dark mt-1 mb-0 "></asp:label>
                        </div>
                        <div class="p-3 bg-dark-subtle text-dark rounded-3 fs-3 d-flex">
                            <i class="bi bi-shield-lock"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card border-0 shadow-sm rounded-3 p-3">
                    <div class="d-flex align-items-center justify-content-between">
                        <div>
                            <span class="text-muted small fw-bold text-uppercase">Preventistas</span>
                            <br />
                            <asp:Label ID="lblPrev" runat="server" Text="" CssClass="fw-bold text-dark mt-1 mb-0"></asp:Label>
                        </div>
                        <div class="p-3 bg-info-subtle text-info rounded-3 fs-3 d-flex">
                            <i class="bi bi-briefcase"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-md-6 col-xl-3">
                <div class="card border-0 shadow-sm rounded-3 p-3">
                    <div class="d-flex align-items-center justify-content-between">
                        <div>
                            <span class="text-muted small fw-bold text-uppercase" style="font-size: 0.75rem; letter-spacing: 0.05em;">Personal de Bodega</span>
                            <br />
                            <asp:Label ID="lblBodega" runat="server" Text="" CssClass="fw-bold text-dark mt-1 mb-0 "></asp:Label>
                        </div>
                        <div class="p-3 bg-info-subtle text-info-emphasis rounded-3 fs-3 d-flex">
                            <i class="bi bi-box-seam"></i>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-md-6 col-xl-3">
                <div class="card border-0 shadow-sm rounded-3 p-3">
                    <div class="d-flex align-items-center justify-content-between">
                        <div>
                            <span class="text-muted small fw-bold text-uppercase" style="font-size: 0.75rem; letter-spacing: 0.05em;">Distribuidores</span>
                            <br />
                            <asp:Label ID="lblDistribuidores" runat="server" Text="" CssClass="fw-bold text-dark mt-1 mb-0 "></asp:Label>
                        </div>
                        <div class="p-3 bg-warning-subtle text-warning-emphasis rounded-3 fs-3 d-flex">
                            <i class="bi bi-truck"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="card border-0 shadow-sm rounded-3 p-3">
                    <div class="d-flex align-items-center justify-content-between">
                        <div>
                            <span class="text-muted small fw-bold text-uppercase">Personal Inactivo</span>
                            <br />
                            <asp:Label ID="lblInactivo" runat="server" Text="" CssClass="fw-bold text-dark mt-1 mb-0"></asp:Label>
                        </div>
                        <div class="p-3 bg-danger-subtle text-danger rounded-3 fs-3 d-flex">
                            <i class="bi bi-person-x"></i>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="card border-0 shadow-sm rounded-3 p-3 mb-4" data-purpose="role-filters">
            <div class="d-flex flex-column flex-md-row align-items-md-center gap-3">
                <div class="d-flex align-items-center gap-2 text-secondary text-uppercase fw-bold" style="font-size: 0.75rem; letter-spacing: 0.05em;">
                    <i class="bi bi-funnel-fill"></i>
                    <span>Filtrar por rol:</span>
                </div>
                <div class="d-flex flex-wrap gap-2">
                    <button type="button" data-role="" class="btn btn-dark rounded-pill px-4 btn-sm fw-medium">Todos</button>
                    <button type="button" data-role="Administrador" class="btn btn-outline-secondary btn-white rounded-pill px-4 btn-sm fw-medium text-dark hover-bg-light">Administrador</button>
                    <button type="button" data-role="Preventista" class="btn btn-outline-secondary btn-white rounded-pill px-4 btn-sm fw-medium text-dark hover-bg-light">Preventista</button>
                    <button type="button" data-role="Bodega" class="btn btn-outline-secondary btn-white rounded-pill px-4 btn-sm fw-medium text-dark hover-bg-light">Bodega</button>
                    <button type="button" data-role="Distribuidor" class="btn btn-outline-secondary btn-white rounded-pill px-4 btn-sm fw-medium text-dark hover-bg-light">Distribuidor</button>
                </div>
            </div>
        </section>
        <div class="card border-0 shadow-sm rounded-3 overflow-hidden" data-purpose="user-table-container">
            <div class="card-body p-4">
                <div class="table-responsive">
                    <table id="example" class="table table-hover align-middle w-full text-sm m-0">
                        <thead class="table-light text-secondary uppercase">
                            <tr>
                                <th class="border-bottom-0 fw-bold">Id</th>
                                <th class="border-bottom-0 fw-bold">Nombre</th>
                                <th class="border-bottom-0 fw-bold">Email</th>
                                <th class="border-bottom-0 fw-bold">Rol</th>
                                <th class="border-bottom-0 fw-bold">Estado</th>
                                <th class="border-bottom-0 fw-bold">Acciones</th>
                            </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="../Assets/js/GestionUsuario.js?v=1.6"></script>
</asp:Content>
