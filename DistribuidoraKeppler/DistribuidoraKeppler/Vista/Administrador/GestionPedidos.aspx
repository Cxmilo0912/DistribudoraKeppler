<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.Pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Kepler Admin - Gestión de Pedidos</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Google Fonts: Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&amp;display=swap" rel="stylesheet" />

    <style data-purpose="kepler-pedidos-theme">
        /* ── Variables globales Kepler ─────────────────────────────── */
        :root {
            --kepler-blue: #0b1184;
            --kepler-blue-dark: #060a52;
            --kepler-blue-light: #eef0fd;
            --kepler-bg: #f4f6fb;
            /* Estados de pedido */
            --status-pending: #f5a623;
            --status-pending-bg: #fef6e7;
            --status-confirmed: #185fa5;
            --status-confirmed-bg: #e6f1fb;
            --status-preparing: #7c4dd6;
            --status-preparing-bg: #f1ecfb;
            --status-shipping: #0f6e56;
            --status-shipping-bg: #e1f5ee;
            --status-delivered: #1e9e5a;
            --status-delivered-bg: #e3f7ec;
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

            aside a:hover, .sidebar a:hover, .nav-link:hover {
                color: rgba(255,255,255,0.8) !important;
                text-decoration: none !important;
            }

        /* ── Botón primario Kepler ─────────────────────────────────── */
        .btn-kepler {
            background-color: var(--kepler-blue);
            border-color: var(--kepler-blue);
            color: #fff;
            font-weight: 600;
            border-radius: 0.75rem;
            padding: 0.65rem 1.4rem;
            transition: background-color .2s ease, box-shadow .2s ease;
        }

            .btn-kepler:hover {
                background-color: var(--kepler-blue-dark);
                border-color: var(--kepler-blue-dark);
                color: #fff;
                box-shadow: 0 6px 18px rgba(11,17,132,.22);
            }

        /* ── Botón secundario ─────────────────────────────────────── */
        .btn-kepler-outline {
            background: #fff;
            border: 1px solid #e3e6f0;
            color: #4b5563;
            font-weight: 600;
            border-radius: 0.75rem;
            padding: 0.65rem 1.4rem;
            transition: background-color .15s ease;
        }

            .btn-kepler-outline:hover {
                background: #f4f6fb;
            }

        /* ── Tarjeta base ──────────────────────────────────────────── */
        .kepler-card {
            border: none !important;
            border-radius: 1.25rem;
            box-shadow: 0 2px 14px rgba(17,24,76,.06);
        }

        /* ── Barra de búsqueda ─────────────────────────────────────── */
        .kepler-search-wrap {
            position: relative;
            flex: 1;
            min-width: 260px;
            max-width: 520px;
        }

            .kepler-search-wrap .search-icon {
                position: absolute;
                left: 1rem;
                top: 50%;
                transform: translateY(-50%);
                color: #9aa0b4;
                font-size: 0.95rem;
                pointer-events: none;
            }

            .kepler-search-wrap .clear-icon {
                position: absolute;
                right: 1rem;
                top: 50%;
                transform: translateY(-50%);
                color: #9aa0b4;
                cursor: pointer;
                display: none;
            }

                .kepler-search-wrap .clear-icon:hover {
                    color: #4b5563;
                }

        .kepler-search-input {
            width: 100%;
            border: none;
            border-radius: 1rem;
            background: #fff;
            padding: 0.72rem 2.6rem 0.72rem 2.6rem;
            font-size: 0.9rem;
            box-shadow: 0 1px 6px rgba(17,24,76,.07);
            outline: none;
            transition: box-shadow .2s ease;
        }

            .kepler-search-input:focus {
                box-shadow: 0 0 0 0.2rem rgba(11,17,132,.12);
            }

        /* ── Filtros de estado ─────────────────────────────────────── */
        .kepler-filter-btn {
            border: none;
            border-radius: 999px;
            font-size: 0.83rem;
            font-weight: 600;
            padding: 0.45rem 1.1rem;
            background: #fff;
            color: #6b7280;
            border: 1px solid #e3e6f0;
            transition: background .15s ease, color .15s ease, border-color .15s ease;
        }

            .kepler-filter-btn.active,
            .kepler-filter-btn:hover {
                background: var(--kepler-blue);
                color: #fff;
                border-color: var(--kepler-blue);
            }

            .kepler-filter-btn .badge-count {
                font-weight: 400;
                font-size: 0.75rem;
                opacity: .7;
                margin-left: 4px;
            }

        /* ── Tarjeta de pedido ─────────────────────────────────────── */
        .order-card {
            background: #fff;
            border-radius: 1.1rem;
            border: 1px solid transparent;
            box-shadow: 0 1px 6px rgba(17,24,76,.05);
            padding: 1.1rem 1.5rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            transition: border-color .15s ease, box-shadow .15s ease, transform .15s ease;
            animation: fadeInUp .25s ease-out forwards;
            opacity: 0;
        }

            .order-card:hover {
                border-color: #dde1f5;
                box-shadow: 0 4px 16px rgba(11,17,132,.09);
                transform: translateY(-1px);
            }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(8px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .order-id {
            font-weight: 700;
            color: var(--kepler-blue);
            font-size: 0.95rem;
            min-width: 100px;
        }

        .order-client-name {
            font-weight: 600;
            font-size: 0.9rem;
            color: #1e2433;
        }

        .order-client-email {
            font-size: 0.78rem;
            color: #9aa0b4;
        }

        .order-date {
            font-size: 0.85rem;
            color: #6b7280;
        }

        .order-total-label {
            font-size: 0.7rem;
            color: #9aa0b4;
        }

        .order-total-value {
            font-weight: 700;
            font-size: 0.9rem;
            color: #1e2433;
        }

        /* ── Badges de estado ──────────────────────────────────────── */
        .status-badge {
            display: inline-block;
            border-radius: 999px;
            font-size: 0.72rem;
            font-weight: 700;
            padding: 0.38rem 0.9rem;
            min-width: 110px;
            text-align: center;
        }

        .status-Pendiente {
            background: var(--status-pending-bg);
            color: var(--status-pending);
        }

        .status-Confirmado {
            background: var(--status-confirmed-bg);
            color: var(--status-confirmed);
        }

        .status-En-preparacion {
            background: var(--status-preparing-bg);
            color: var(--status-preparing);
        }

        .status-En-reparto {
            background: var(--status-shipping-bg);
            color: var(--status-shipping);
        }

        .status-Entregado {
            background: var(--status-delivered-bg);
            color: var(--status-delivered);
        }

        /* ── Highlight de búsqueda ─────────────────────────────────── */
        .highlight {
            background-color: #fde68a;
            font-weight: 700;
            padding: 0 2px;
            border-radius: 2px;
        }

        /* ── Estado vacío ──────────────────────────────────────────── */
        #empty-state {
            display: none;
            text-align: center;
            padding: 4rem 0;
        }

            #empty-state.visible {
                display: block;
            }

        .empty-icon-box {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: #f1f3f9;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.25rem;
            font-size: 2rem;
            color: #c5cae5;
        }

        /* ── Paginación ────────────────────────────────────────────── */
        .kepler-page-btn {
            border-radius: 0.6rem;
            border: 1px solid #e3e6f0;
            background: #fff;
            color: #4b5563;
            font-size: 0.85rem;
            font-weight: 500;
            padding: 0.45rem 1rem;
            transition: background .15s ease;
        }

            .kepler-page-btn:hover {
                background: #f4f6fb;
            }

            .kepler-page-btn.active {
                background: var(--kepler-blue);
                color: #fff;
                border-color: var(--kepler-blue);
                font-weight: 700;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="px-4 px-md-5 py-4 d-flex flex-column" style="min-height: calc(100vh - 64px);">

        <!-- ── ENCABEZADO ────────────────────────────────────────────── -->
        <header class="d-flex align-items-center justify-content-between flex-wrap gap-3 mb-4">
            <div>
                <span class="badge rounded-pill px-3 py-1 mb-2 text-white fw-semibold d-inline-block"
                    style="background-color: var(--kepler-blue); font-size: .7rem; letter-spacing: .04em;">Módulo Ventas
                </span>
                <h2 class="fw-bold text-dark mb-0">Gestión de pedidos</h2>
            </div>
            <div class="d-flex align-items-center gap-2">
                <button class="btn btn-light rounded-circle position-relative shadow-sm border" style="width: 42px; height: 42px;">
                    <i class="bi bi-bell"></i>
                    <span class="position-absolute top-0 end-0 translate-middle p-1 bg-danger border border-light rounded-circle"></span>
                </button>
            </div>
        </header>

        <!-- ── BÚSQUEDA Y CONTROLES ──────────────────────────────────── -->
        <section class="mb-4">
            <div class="d-flex align-items-center flex-wrap gap-3 mb-3">

                <!-- Buscador -->
                <div class="kepler-search-wrap">
                    <i class="bi bi-search search-icon"></i>
                    <input class="kepler-search-input"
                        id="order-search"
                        placeholder="Buscar por número de pedido, cliente o correo..."
                        type="text" />
                    <i class="bi bi-x-circle clear-icon" id="clear-search"></i>
                </div>

                <!-- Datepicker placeholder -->
                <div class="position-relative">
                    <input class="kepler-search-input"
                        placeholder="Filtrar por fecha"
                        type="text"
                        style="width: 200px; padding-left: 1rem; padding-right: 2.6rem;" />
                    <i class="bi bi-calendar3" style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); color: #9aa0b4; pointer-events: none;"></i>
                </div>

                <!-- Acciones -->
                <div class="d-flex gap-2 ms-auto">
                    <button class="btn btn-kepler d-flex align-items-center gap-2">
                        <i class="bi bi-plus-lg"></i>
                        <span>Nuevo pedido</span>
                    </button>
                    <button class="btn btn-kepler-outline d-flex align-items-center gap-2">
                        <i class="bi bi-download"></i>
                        <span>Exportar</span>
                    </button>
                </div>
            </div>

            <!-- Filtros de estado -->
            <div class="d-flex align-items-center flex-wrap gap-2" id="status-filters">
                <button class="kepler-filter-btn active" data-filter="all">
                    Todos <span class="badge-count" id="count-all"></span>
                </button>
                <button class="kepler-filter-btn" data-filter="Pendiente">
                    Pendientes <span class="badge-count" id="count-pending"></span>
                </button>
                <button class="kepler-filter-btn" data-filter="Confirmado">
                    Confirmados <span class="badge-count" id="count-confirmed"></span>
                </button>
                <button class="kepler-filter-btn" data-filter="En preparacion">
                    En preparación <span class="badge-count" id="count-preparing"></span>
                </button>
                <button class="kepler-filter-btn" data-filter="En reparto">
                    En reparto <span class="badge-count" id="count-shipping"></span>
                </button>
                <button class="kepler-filter-btn" data-filter="Entregado">
                    Entregados <span class="badge-count" id="count-delivered"></span>
                </button>
            </div>
        </section>

        <!-- ── LISTA DE PEDIDOS ──────────────────────────────────────── -->
        <section class="flex-grow-1 mb-4">

            <!-- Estado vacío -->
            <div id="empty-state">
                <div class="empty-icon-box"><i class="bi bi-search"></i></div>
                <h5 class="fw-bold text-dark">No se encontraron pedidos</h5>
                <p class="text-muted small">Prueba con términos diferentes o limpia los filtros.</p>
            </div>

            <!-- Grid de tarjetas de pedido -->
            <div class="d-flex flex-column gap-3" id="order-list"></div>

        </section>

        <!-- ── PAGINACIÓN ────────────────────────────────────────────── -->
        <footer class="d-flex align-items-center justify-content-between pt-3 border-top">
            <p class="small text-muted mb-0" id="results-count"></p>
            <div class="d-flex gap-1">
                <button class="kepler-page-btn">Anterior</button>
                <button class="kepler-page-btn active">1</button>
                <button class="kepler-page-btn">2</button>
                <button class="kepler-page-btn">3</button>
                <button class="kepler-page-btn">Siguiente</button>
            </div>
        </footer>

    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script data-purpose="pedidos-logic">
        const ORDERS_DATA = [
            { id: '#ORD-5821', client: 'Roberto Gómez', email: 'robertoream@gmail.com', date: '12 oct 2023', total: '$1.250,00', status: 'Pendiente' },
            { id: '#ORD-5822', client: 'Roberto Gómez', email: 'robertoream@gmail.com', date: '12 oct 2023', total: '$1.250,00', status: 'Confirmado' },
            { id: '#ORD-5823', client: 'Roberto Gómez', email: 'robertoream@gmail.com', date: '12 oct 2023', total: '$1.250,00', status: 'En preparacion' },
            { id: '#ORD-5824', client: 'Roberto Gómez', email: 'robertoream@gmail.com', date: '12 oct 2023', total: '$1.250,00', status: 'En reparto' },
            { id: '#ORD-5825', client: 'Roberto Gómez', email: 'robertoream@gmail.com', date: '12 oct 2023', total: '$1.250,00', status: 'Entregado' },
            { id: '#ORD-6001', client: 'Ana Martínez', email: 'anamtz@outlook.com', date: '15 oct 2023', total: '$850,50', status: 'Pendiente' },
            { id: '#ORD-6002', client: 'Luis Pérez', email: 'lperez@company.com', date: '16 oct 2023', total: '$2.100,00', status: 'Confirmado' }
        ];

        const orderList = document.getElementById('order-list');
        const searchInput = document.getElementById('order-search');
        const clearBtn = document.getElementById('clear-search');
        const emptyState = document.getElementById('empty-state');
        const resultsCount = document.getElementById('results-count');
        const filterBtns = document.querySelectorAll('.kepler-filter-btn');

        let searchTerm = '';
        let statusFilter = 'all';

        /* ── Resaltado de texto ─────────────────────────────────── */
        function highlight(text, term) {
            if (!term.trim()) return text;
            return text.replace(new RegExp(`(${term})`, 'gi'), '<span class="highlight">$1</span>');
        }

        /* ── Clase CSS del badge de estado ─────────────────────── */
        function statusClass(status) {
            return 'status-' + status.replace(/\s+/g, '-');
        }

        /* ── Renderizado ────────────────────────────────────────── */
        function render() {
            const filtered = ORDERS_DATA.filter(o => {
                const q = searchTerm.toLowerCase();
                const matchSearch = o.id.toLowerCase().includes(q)
                    || o.client.toLowerCase().includes(q)
                    || o.email.toLowerCase().includes(q);
                const matchStatus = statusFilter === 'all' || o.status === statusFilter;
                return matchSearch && matchStatus;
            });

            resultsCount.textContent = `Mostrando ${filtered.length} de ${ORDERS_DATA.length} pedidos`;

            if (filtered.length === 0) {
                orderList.innerHTML = '';
                emptyState.classList.add('visible');
                return;
            }

            emptyState.classList.remove('visible');
            orderList.innerHTML = filtered.map((o, i) => `
                <div class="order-card" style="animation-delay:${i * 45}ms">

                    <div class="order-id">${highlight(o.id, searchTerm)}</div>

                    <div style="flex:1; min-width:160px;">
                        <div class="order-client-name">${highlight(o.client, searchTerm)}</div>
                        <div class="order-client-email">${highlight(o.email, searchTerm)}</div>
                    </div>

                    <div class="order-date d-none d-md-block" style="min-width:110px;">
                        <i class="bi bi-calendar3 me-1" style="font-size:.75rem;opacity:.5;"></i>${o.date}
                    </div>

                    <div style="min-width:90px;">
                        <div class="order-total-label">Total</div>
                        <div class="order-total-value">${o.total}</div>
                    </div>

                    <div style="min-width:130px;">
                        <span class="status-badge ${statusClass(o.status)}">${o.status}</span>
                    </div>

                    <div class="d-flex gap-3 ms-auto" style="color:#c5cae5;">
                        <button class="btn btn-sm btn-light border rounded-2" title="Ver detalle" style="color:var(--kepler-blue);">
                            <i class="bi bi-eye"></i>
                        </button>
                        <button class="btn btn-sm btn-light border rounded-2" title="Editar" style="color:#c2790a;">
                            <i class="bi bi-pencil-square"></i>
                        </button>
                    </div>

                </div>
            `).join('');
        }

        /* ── Contadores de badges ───────────────────────────────── */
        function updateCounts() {
            const count = s => ORDERS_DATA.filter(o => o.status === s).length;
            document.getElementById('count-all').textContent = ORDERS_DATA.length;
            document.getElementById('count-pending').textContent = count('Pendiente');
            document.getElementById('count-confirmed').textContent = count('Confirmado');
            document.getElementById('count-preparing').textContent = count('En preparacion');
            document.getElementById('count-shipping').textContent = count('En reparto');
            document.getElementById('count-delivered').textContent = count('Entregado');
        }

        /* ── Eventos ────────────────────────────────────────────── */
        searchInput.addEventListener('input', e => {
            searchTerm = e.target.value;
            clearBtn.style.display = searchTerm ? 'block' : 'none';
            render();
        });

        clearBtn.addEventListener('click', () => {
            searchInput.value = '';
            searchTerm = '';
            clearBtn.style.display = 'none';
            render();
        });

        filterBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                filterBtns.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');
                statusFilter = btn.dataset.filter;
                render();
            });
        });

        /* ── Init ───────────────────────────────────────────────── */
        updateCounts();
        render();
    </script>

</asp:Content>
