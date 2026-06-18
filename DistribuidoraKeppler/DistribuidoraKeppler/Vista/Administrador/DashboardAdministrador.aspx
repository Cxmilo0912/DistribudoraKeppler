<%@ Page Title="Kepler Admin Dashboard" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="DashboardAdministrador.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Aministrador.DashboardAdministrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Admin</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Google Fonts: Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&amp;display=swap" rel="stylesheet" />

    <style data-purpose="kepler-theme">
        :root {
            --kepler-blue: #0b1184;
            --kepler-blue-dark: #060a52;
            --kepler-blue-light: #eef0fd;
            --kepler-bg: #f4f6fb;
            --kepler-radius: 1rem;
            --kepler-radius-lg: 1.5rem;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--kepler-bg);
        }

        .bg-kepler {
            background-color: var(--kepler-blue) !important;
        }

        .bg-kepler-gradient {
            background: linear-gradient(135deg, var(--kepler-blue) 0%, var(--kepler-blue-dark) 100%) !important;
        }

        .text-kepler {
            color: var(--kepler-blue) !important;
        }

        .bg-kepler-soft {
            background-color: var(--kepler-blue-light) !important;
        }

        .btn-kepler {
            background-color: var(--kepler-blue);
            border-color: var(--kepler-blue);
            color: #fff;
            font-weight: 600;
            border-radius: 0.75rem;
            padding: 0.6rem 1.25rem;
        }

            .btn-kepler:hover {
                background-color: var(--kepler-blue-dark);
                border-color: var(--kepler-blue-dark);
                color: #fff;
            }

        .kepler-card {
            border: none;
            border-radius: var(--kepler-radius-lg);
            box-shadow: 0 2px 14px rgba(17, 24, 76, 0.06);
        }

        .kepler-icon-box {
            width: 48px;
            height: 48px;
            border-radius: 0.9rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
        }

        .kepler-search {
            border-radius: 1rem;
            background-color: #f1f3f9;
            border: none;
            padding-left: 2.75rem;
        }

            .kepler-search:focus {
                background-color: #fff;
                box-shadow: 0 0 0 0.2rem rgba(11, 17, 132, 0.12);
            }

        .kepler-avatar {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.7rem;
            font-weight: 700;
        }

        .kepler-bar {
            width: 28px;
            border-radius: 0.5rem 0.5rem 0 0;
            background-color: #cfd8f7;
            transition: background-color 0.2s ease;
        }

            .kepler-bar.active {
                background-color: var(--kepler-blue);
            }

        .kepler-period-toggle .btn {
            font-size: 0.75rem;
            font-weight: 700;
            border-radius: 0.6rem;
            padding: 0.35rem 0.85rem;
        }

        .table-kepler thead th {
            font-size: 0.7rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.04em;
            color: #9aa0b4;
            border-bottom: 1px solid #eef0f6;
        }

        .table-kepler tbody td {
            vertical-align: middle;
            border-bottom: 1px solid #f3f4f9;
            font-size: 0.9rem;
        }

        .table-kepler tbody tr:last-child td {
            border-bottom: none;
        }

        .badge-soft-success {
            background-color: #e3f7ec;
            color: #1e9e5a;
            font-weight: 700;
        }

        .badge-soft-warning {
            background-color: #fef2e1;
            color: #c2790a;
            font-weight: 700;
        }

        .kepler-product-pill {
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 1rem;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- BEGIN: Header -->
    <header class="d-flex align-items-center justify-content-between px-4 px-md-5 py-3 flex-wrap gap-3">
        <div class="position-relative" style="max-width: 420px; width: 100%;">
            <i class="bi bi-search position-absolute top-50 translate-middle-y text-muted" style="left: 1rem;"></i>
            <input type="text" class="form-control kepler-search" placeholder="Buscar pedidos, productos o clientes..." />
        </div>

        <div class="d-flex align-items-center gap-3 gap-md-4">
            <button class="btn btn-link text-muted position-relative p-1">
                <i class="bi bi-bell fs-5"></i>
                <span class="position-absolute top-0 end-0 translate-middle p-1 bg-danger border border-light rounded-circle"></span>
            </button>
            <button class="btn btn-link text-muted p-1">
                <i class="bi bi-question-circle fs-5"></i>
            </button>
            <div class="vr d-none d-md-block"></div>
            <div class="d-flex align-items-center gap-2">
                <div class="text-end d-none d-sm-block">
                    <p class="mb-0 fw-bold small">Panel Kepler</p>
                    <p class="mb-0 text-muted" style="font-size: 0.7rem;">V2.4.0</p>
                </div>
                <div class="bg-kepler text-white rounded-3 d-flex align-items-center justify-content-center fw-bold" style="width: 42px; height: 42px;">
                    K
                </div>
            </div>
        </div>
    </header>
    <!-- END: Header -->

    <!-- BEGIN: Dashboard Body -->
    <div class="px-4 px-md-5 pb-5">

        <!-- Welcome Section -->
        <div class="d-flex align-items-end justify-content-between flex-wrap gap-3 mb-4">
            <div>
                <h2 class="fw-bold text-dark mb-1">Resumen general</h2>
                <p class="text-muted mb-0">Bienvenido al sistema de distribución Kepler. Aquí tienes los datos de hoy.</p>
            </div>
            <button class="btn btn-kepler d-flex align-items-center gap-2">
                <i class="bi bi-download"></i>
                <span>Generar reporte</span>
            </button>
        </div>

        <!-- BEGIN: Summary Cards -->
        <div class="row g-3 mb-4">
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="kepler-card card h-100 p-3">
                    <div class="kepler-icon-box bg-kepler-soft text-kepler mb-3">
                        <i class="bi bi-cash-coin"></i>
                    </div>
                    <p class="text-muted small mb-1">Ventas de hoy</p>
                    <h3 class="fw-bold mb-0">$12.450,00</h3>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="kepler-card card h-100 p-3">
                    <div class="kepler-icon-box mb-3" style="background-color: #f1ecfb; color: #7c4dd6;">
                        <i class="bi bi-box-seam"></i>
                    </div>
                    <p class="text-muted small mb-1">Pedidos activos</p>
                    <h3 class="fw-bold mb-0">84</h3>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="kepler-card card h-100 p-3">
                    <div class="kepler-icon-box mb-3" style="background-color: #e3f7ec; color: #1e9e5a;">
                        <i class="bi bi-check-circle"></i>
                    </div>
                    <p class="text-muted small mb-1">Productos con estado activo</p>
                    <h3 class="fw-bold mb-0">
                        <asp:Label ID="lblProductosActivos" runat="server" Text="Label"></asp:Label>
                    </h3>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="kepler-card card h-100 p-3">
                    <div class="kepler-icon-box mb-3" style="background-color: #fdeae3; color: #d6602f;">
                        <i class="bi bi-person-plus"></i>
                    </div>
                    <p class="text-muted small mb-1">Clientes registrados</p>
                    <h3 class="fw-bold mb-0">
                        <asp:Label ID="lblTotalClientes" runat="server" Text="0"></asp:Label>
                    </h3>
                </div>
            </div>
        </div>
        <!-- END: Summary Cards -->

        <!-- BEGIN: Charts & Featured Section -->
        <div class="row g-3 mb-4">
            <!-- Left: Sales Performance Chart -->
            <div class="col-12 col-lg-8">
                <div class="kepler-card card h-100 p-4">
                    <div class="d-flex align-items-center justify-content-between flex-wrap gap-3 mb-4">
                        <div>
                            <h5 class="fw-bold mb-1">Rendimiento de ventas</h5>
                            <p class="text-muted small mb-0">Volumen de ventas semanal</p>
                        </div>
                        <div class="kepler-period-toggle bg-light rounded-3 p-1 d-flex gap-1">
                            <button class="btn btn-white bg-white shadow-sm">Semana</button>
                            <button class="btn btn-link text-muted">Mes</button>
                            <button class="btn btn-link text-muted">Año</button>
                        </div>
                    </div>
                    <div class="d-flex align-items-end justify-content-between" style="height: 200px;">
                        <div class="d-flex flex-column align-items-center gap-2">
                            <div class="kepler-bar" style="height: 96px;"></div>
                            <span class="small text-muted fw-bold" style="font-size: 0.7rem;">LUN</span>
                        </div>
                        <div class="d-flex flex-column align-items-center gap-2">
                            <div class="kepler-bar" style="height: 144px;"></div>
                            <span class="small text-muted fw-bold" style="font-size: 0.7rem;">MAR</span>
                        </div>
                        <div class="d-flex flex-column align-items-center gap-2">
                            <div class="kepler-bar" style="height: 112px;"></div>
                            <span class="small text-muted fw-bold" style="font-size: 0.7rem;">MIE</span>
                        </div>
                        <div class="d-flex flex-column align-items-center gap-2">
                            <div class="kepler-bar" style="height: 128px;"></div>
                            <span class="small text-muted fw-bold" style="font-size: 0.7rem;">JUE</span>
                        </div>
                        <div class="d-flex flex-column align-items-center gap-2">
                            <div class="kepler-bar active" style="height: 176px;"></div>
                            <span class="small fw-bold text-dark" style="font-size: 0.7rem;">VIE</span>
                        </div>
                        <div class="d-flex flex-column align-items-center gap-2">
                            <div class="kepler-bar" style="height: 136px;"></div>
                            <span class="small text-muted fw-bold" style="font-size: 0.7rem;">SAB</span>
                        </div>
                        <div class="d-flex flex-column align-items-center gap-2">
                            <div class="kepler-bar" style="height: 80px;"></div>
                            <span class="small text-muted fw-bold" style="font-size: 0.7rem;">DOM</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right: Monthly Growth Card -->
            <div class="col-12 col-lg-4">
                <div class="kepler-card card h-100 p-4 bg-kepler-gradient text-white d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="fw-medium mb-1" style="opacity: 0.9;">Crecimiento mensual</h5>
                        <p class="small mb-0" style="opacity: 0.6;">Basado en el mismo periodo del mes anterior.</p>
                        <div class="d-flex align-items-center gap-3 mt-4">
                            <span class="fw-bold" style="font-size: 2.5rem;">+24.8%</span>
                            <span class="kepler-product-pill px-3 py-1 d-flex align-items-center gap-1" style="font-size: 0.7rem; font-weight: 700;">
                                <i class="bi bi-graph-up-arrow"></i>Alto
                            </span>
                        </div>
                    </div>
                    <div class="mt-4">
                        <p class="text-uppercase mb-2" style="font-size: 0.65rem; letter-spacing: 0.08em; opacity: 0.5; font-weight: 700;">Producto más vendido</p>
                        <div class="kepler-product-pill d-flex align-items-center gap-3 p-3">
                            <div class="d-flex align-items-center justify-content-center rounded-3" style="width: 46px; height: 46px; background-color: rgba(255,255,255,0.1);">
                                <i class="bi bi-cup-hot fs-5"></i>
                            </div>
                            <div>
                                <p class="fw-bold mb-0" style="font-size: 0.85rem;">Café Premium Kepler</p>
                                <p class="mb-0" style="font-size: 0.75rem; opacity: 0.6;">1.402 unidades</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END: Charts & Featured Section -->

        <!-- BEGIN: Recent Orders Table -->
        <div class="kepler-card card">
            <div class="card-header bg-white border-0 px-4 py-3">
                <h5 class="fw-bold mb-0">Pedidos recientes</h5>
            </div>
            <div class="table-responsive">
                <table class="table table-kepler mb-0">
                    <thead>
                        <tr>
                            <th class="px-4 py-3">ID pedido</th>
                            <th class="py-3">Cliente</th>
                            <th class="py-3">Fecha</th>
                            <th class="py-3">Total</th>
                            <th class="py-3">Estado</th>
                            <th class="py-3 text-end px-4">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="px-4 fw-bold">#ORD-9021</td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <div class="kepler-avatar" style="background-color: #e6f1fb; color: #185fa5;">MA</div>
                                    <span class="fw-medium">Maria Alarcon</span>
                                </div>
                            </td>
                            <td class="text-muted">24 oct, 2023</td>
                            <td class="fw-bold">$2.450,00</td>
                            <td><span class="badge badge-soft-success rounded-pill px-3 py-2">Entregado</span></td>
                            <td class="text-end px-4">
                                <button class="btn btn-link text-muted p-0">
                                    <i class="bi bi-three-dots-vertical"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td class="px-4 fw-bold">#ORD-9022</td>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <div class="kepler-avatar" style="background-color: #f1ecfb; color: #7c4dd6;">JR</div>
                                    <span class="fw-medium">Juan Ramirez</span>
                                </div>
                            </td>
                            <td class="text-muted">23 oct, 2023</td>
                            <td class="fw-bold">$840,00</td>
                            <td><span class="badge badge-soft-warning rounded-pill px-3 py-2">Pendiente</span></td>
                            <td class="text-end px-4">
                                <button class="btn btn-link text-muted p-0">
                                    <i class="bi bi-three-dots-vertical"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- END: Recent Orders Table -->

    </div>
    <!-- END: Dashboard Body -->

    <!-- Bootstrap 5 JS Bundle (incluye Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
