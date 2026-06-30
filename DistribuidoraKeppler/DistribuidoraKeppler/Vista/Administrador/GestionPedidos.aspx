<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="GestionPedidos.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.Pedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Kepler Admin - Gestión de Pedidos</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Google Fonts: Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />

    <style data-purpose="kepler-pedidos-theme">
        :root {
            --kepler-blue: #0b1184;
            --kepler-blue-dark: #060a52;
            --kepler-blue-light: #eef0fd;
            --kepler-bg: #f4f6fb;
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

        aside a, .sidebar a, .nav-link,
        .list-group-item a, [class*="sidebar"] a, [class*="menu"] a {
            color: #ffffff !important;
            text-decoration: none !important;
        }

            aside a:hover, .sidebar a:hover, .nav-link:hover {
                color: rgba(255,255,255,0.8) !important;
            }

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
            padding: 0.72rem 2.6rem;
            font-size: 0.9rem;
            box-shadow: 0 1px 6px rgba(17,24,76,.07);
            outline: none;
            transition: box-shadow .2s ease;
        }

            .kepler-search-input:focus {
                box-shadow: 0 0 0 0.2rem rgba(11,17,132,.12);
            }

        .kepler-filter-btn {
            border-radius: 999px;
            font-size: 0.83rem;
            font-weight: 600;
            padding: 0.45rem 1.1rem;
            background: #fff;
            color: #6b7280;
            border: 1px solid #e3e6f0;
            transition: background .15s ease, color .15s ease, border-color .15s ease;
        }

            .kepler-filter-btn.active, .kepler-filter-btn:hover {
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

        .highlight {
            background-color: #fde68a;
            font-weight: 700;
            padding: 0 2px;
            border-radius: 2px;
        }

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

        /* ── Modal cambio de estado ──────────────────────────────────── */
        .modal-status-btn {
            border-radius: 999px;
            font-size: 0.82rem;
            font-weight: 600;
            padding: 0.45rem 1.1rem;
            border: 2px solid transparent;
            transition: all .15s ease;
            cursor: pointer;
        }

            .modal-status-btn.selected {
                border-color: var(--kepler-blue) !important;
                box-shadow: 0 0 0 3px rgba(11,17,132,.15);
            }

        /* ── Spinner de carga ────────────────────────────────────────── */
        #loading-state {
            text-align: center;
            padding: 3rem 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="px-4 px-md-5 py-4 d-flex flex-column" style="min-height: calc(100vh - 64px);">

        <!-- ── ENCABEZADO ─────────────────────────────────────────────── -->
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

        <!-- ── BÚSQUEDA Y CONTROLES ───────────────────────────────────── -->
        <section class="mb-4">
            <div class="d-flex align-items-center flex-wrap gap-3 mb-3">

                <div class="kepler-search-wrap">
                    <i class="bi bi-search search-icon"></i>
                    <input class="kepler-search-input" id="order-search"
                        placeholder="Buscar por código, cliente o correo..." type="text" />
                    <i class="bi bi-x-circle clear-icon" id="clear-search"></i>
                </div>

                <div class="d-flex gap-2 ms-auto">
                    <button class="btn btn-kepler-outline d-flex align-items-center gap-2" onclick="exportarCSV()">
                        <i class="bi bi-download"></i><span>Exportar</span>
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

        <!-- ── LISTA DE PEDIDOS ───────────────────────────────────────── -->
        <section class="flex-grow-1 mb-4">

            <!-- Cargando -->
            <div id="loading-state">
                <div class="spinner-border text-primary" role="status"></div>
                <p class="text-muted mt-2 small">Cargando pedidos...</p>
            </div>

            <!-- Estado vacío -->
            <div id="empty-state">
                <div class="empty-icon-box"><i class="bi bi-search"></i></div>
                <h5 class="fw-bold text-dark">No se encontraron pedidos</h5>
                <p class="text-muted small">Prueba con términos diferentes o limpia los filtros.</p>
            </div>

            <!-- Grid de pedidos -->
            <div class="d-flex flex-column gap-3" id="order-list"></div>

        </section>

        <!-- ── PAGINACIÓN ─────────────────────────────────────────────── -->
        <footer class="d-flex align-items-center justify-content-between pt-3 border-top">
            <p class="small text-muted mb-0" id="results-count"></p>
            <div class="d-flex gap-1" id="pagination-wrap"></div>
        </footer>
    </div> 

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script data-purpose="pedidos-logic">

        /* ── Estado global ──────────────────────────────────────────── */
        let ORDERS_DATA = [];
        let searchTerm = '';
        let statusFilter = 'all';
        let currentPage = 1;
        const PAGE_SIZE = 10;

        // Para el modal de cambio de estado
        let pedidoSeleccionado = null;
        let nuevoEstado = null;

        /* ── Referencias DOM ───────────────────────────────────────── */
        const orderList = document.getElementById('order-list');
        const searchInput = document.getElementById('order-search');
        const clearBtn = document.getElementById('clear-search');
        const emptyState = document.getElementById('empty-state');
        const loadingState = document.getElementById('loading-state');
        const resultsCount = document.getElementById('results-count');
        const filterBtns = document.querySelectorAll('.kepler-filter-btn');
        const pagWrap = document.getElementById('pagination-wrap');

        /* ── Cargar pedidos desde el servidor ──────────────────────── */
        function cargarPedidos() {
            loadingState.style.display = 'block';
            orderList.innerHTML = '';
            emptyState.classList.remove('visible');

            fetch('GestionPedidos.aspx/MtListarPedidos', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json; charset=utf-8' },
                body: '{}'
            })
                .then(r => r.json())
                .then(json => {
                    ORDERS_DATA = json.d.data;
                    loadingState.style.display = 'none';
                    updateCounts();
                    render();
                })
                .catch(err => {
                    loadingState.style.display = 'none';
                    orderList.innerHTML = '<p class="text-danger small">Error al cargar los pedidos. Verifique la conexión.</p>';
                    console.error(err);
                });
        }

        /* ── Resaltado ─────────────────────────────────────────────── */
        function highlight(text, term) {
            if (!term.trim()) return text;
            return text.replace(new RegExp('(' + term + ')', 'gi'), '<span class="highlight">$1</span>');
        }

        /* ── Clase CSS de badge ────────────────────────────────────── */
        function statusClass(status) {
            return 'status-' + status.replace(/\s+/g, '-');
        }

        /* ── Filtrar datos ─────────────────────────────────────────── */
        function filteredData() {
            return ORDERS_DATA.filter(o => {
                const q = searchTerm.toLowerCase();
                const matchSearch = o.codigoPedido.toLowerCase().includes(q)
                    || o.cliente.toLowerCase().includes(q)
                    || o.emailCliente.toLowerCase().includes(q);
                const matchStatus = statusFilter === 'all' || o.estado === statusFilter;
                return matchSearch && matchStatus;
            });
        }

        /* ── Renderizado ───────────────────────────────────────────── */
        function render() {
            const filtered = filteredData();
            const total = filtered.length;
            const pages = Math.ceil(total / PAGE_SIZE) || 1;
            if (currentPage > pages) currentPage = pages;

            const desde = (currentPage - 1) * PAGE_SIZE;
            const pagina = filtered.slice(desde, desde + PAGE_SIZE);

            resultsCount.textContent = 'Mostrando ' + pagina.length + ' de ' + total + ' pedidos';

            if (pagina.length === 0) {
                orderList.innerHTML = '';
                emptyState.classList.add('visible');
                renderPaginacion(pages);
                return;
            }

            emptyState.classList.remove('visible');
            orderList.innerHTML = pagina.map((o, i) => `
                <div class="order-card" style="animation-delay:${i * 40}ms">

                    <div class="order-id">${highlight('#' + o.codigoPedido, searchTerm)}</div>

                    <div style="flex:1; min-width:160px;">
                        <div class="order-client-name">${highlight(o.cliente, searchTerm)}</div>
                        <div class="order-client-email">${highlight(o.emailCliente, searchTerm)}</div>
                    </div>

                    <div class="order-date d-none d-md-block" style="min-width:110px;">
                        <i class="bi bi-calendar3 me-1" style="font-size:.75rem;opacity:.5;"></i>${o.fecha}
                    </div>

                    <div style="min-width:90px;">
                        <div class="order-total-label">Total</div>
                        <div class="order-total-value">$${o.total}</div>
                    </div>

                    <div style="min-width:130px;">
                        <span class="status-badge ${statusClass(o.estado)}">${o.estado}</span>
                    </div>
                   

                </div>
            `).join('');

            renderPaginacion(pages);
        }

        /* ── Paginación ────────────────────────────────────────────── */
        function renderPaginacion(pages) {
            let html = `<button class="kepler-page-btn" ${currentPage === 1 ? 'disabled' : ''}
                            onclick="cambiarPagina(${currentPage - 1})">Anterior</button>`;

            for (let p = 1; p <= pages; p++) {
                html += `<button class="kepler-page-btn ${p === currentPage ? 'active' : ''}"
                             onclick="cambiarPagina(${p})">${p}</button>`;
            }

            html += `<button class="kepler-page-btn" ${currentPage === pages ? 'disabled' : ''}
                         onclick="cambiarPagina(${currentPage + 1})">Siguiente</button>`;

            pagWrap.innerHTML = html;
        }

        function cambiarPagina(p) {
            currentPage = p;
            render();
        }

        /* ── Contadores de filtros ──────────────────────────────────── */
        function updateCounts() {
            const count = s => ORDERS_DATA.filter(o => o.estado === s).length;
            document.getElementById('count-all').textContent = ORDERS_DATA.length;
            document.getElementById('count-pending').textContent = count('Pendiente');
            document.getElementById('count-confirmed').textContent = count('Confirmado');
            document.getElementById('count-preparing').textContent = count('En preparacion');
            document.getElementById('count-shipping').textContent = count('En reparto');
            document.getElementById('count-delivered').textContent = count('Entregado');
        }


        function seleccionarEstado(estado) {
            nuevoEstado = estado;
            document.querySelectorAll('.modal-status-btn').forEach(b => b.classList.remove('selected'));
            event.target.classList.add('selected');
        }       

        /* ── Exportar CSV ──────────────────────────────────────────── */
        function exportarCSV() {
            const data = filteredData();
            if (data.length === 0) { alert('No hay pedidos para exportar.'); return; }

            let csv = 'Código,Cliente,Email,Fecha,Total,Estado\n';
            data.forEach(o => {
                csv += `${o.codigoPedido},"${o.cliente}","${o.emailCliente}","${o.fecha}","${o.total}","${o.estado}"\n`;
            });

            const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
            const link = document.createElement('a');
            link.href = URL.createObjectURL(blob);
            link.download = 'pedidos_keppler.csv';
            link.click();
        }

        /* ── Eventos ────────────────────────────────────────────────── */
        searchInput.addEventListener('input', e => {
            searchTerm = e.target.value;
            clearBtn.style.display = searchTerm ? 'block' : 'none';
            currentPage = 1;
            render();
        });

        clearBtn.addEventListener('click', () => {
            searchInput.value = '';
            searchTerm = '';
            clearBtn.style.display = 'none';
            currentPage = 1;
            render();
        });

        filterBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                filterBtns.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');
                statusFilter = btn.dataset.filter;
                currentPage = 1;
                render();
            });
        });

        /* ── Init ───────────────────────────────────────────────────── */
        cargarPedidos();

    </script>
</asp:Content>
