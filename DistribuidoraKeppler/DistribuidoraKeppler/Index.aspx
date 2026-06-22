<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="DistribuidoraKeppler.Index" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Distribuidora Keppler</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght=300;400;500;600;700;800;900&display=swap" rel="stylesheet" />
    <style>
        /* ── Reset & Base ── */
        *, *::before, *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        :root {
            --blue: #0b1184;
            --blue-deep: #060b5c;
            --blue-mid: #1a24c2;
            --blue-light: #7b8cff;
            --surface: #f0f2f8;
            --white: #ffffff;
            --ink: #1a1f3a;
            --ink-muted: #5a6280;
            --border: #dde0ef;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--surface);
            color: var(--ink);
            overflow-x: hidden;
        }

        /* ════════════════════════════════════════
           NAV
        ════════════════════════════════════════ */
        .kp-nav {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 100;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 2.5rem;
            height: 64px;
            background: rgba(6, 11, 92, 0.92);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid rgba(123, 140, 255, 0.15);
        }

        .kp-nav__brand {
            font-size: 1.1rem;
            font-weight: 800;
            letter-spacing: -0.03em;
            color: var(--white);
            text-decoration: none;
        }

            .kp-nav__brand span {
                color: var(--blue-light);
            }

        .kp-nav__links {
            display: flex;
            gap: 2rem;
            list-style: none;
            margin-bottom: 0;
        }

            .kp-nav__links a {
                font-size: 0.82rem;
                font-weight: 600;
                letter-spacing: 0.06em;
                text-transform: uppercase;
                color: rgba(255,255,255,0.65);
                text-decoration: none;
                transition: color 0.2s;
            }

                .kp-nav__links a:hover {
                    color: #fff;
                }

        .kp-nav__cta {
            display: flex;
            gap: 0.75rem;
        }

        .btn-nav {
            padding: 0.4rem 1.1rem;
            font-size: 0.8rem;
            font-weight: 700;
            font-family: 'Inter', sans-serif;
            letter-spacing: 0.03em;
            border-radius: 0.4rem;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-nav--outline {
            background: transparent;
            border: 1.5px solid rgba(123, 140, 255, 0.5);
            color: var(--blue-light);
        }

            .btn-nav--outline:hover {
                border-color: var(--blue-light);
                color: #fff;
            }

        .btn-nav--fill {
            background: var(--blue-light);
            border: 1.5px solid var(--blue-light);
            color: var(--blue-deep);
        }

            .btn-nav--fill:hover {
                background: #fff;
                border-color: #fff;
                color: var(--blue-deep);
            }

        /* ════════════════════════════════════════
           HERO
        ════════════════════════════════════════ */
        .kp-hero {
            min-height: 100vh;
            background: linear-gradient(150deg, var(--blue-deep) 0%, var(--blue) 55%, var(--blue-mid) 100%);
            display: flex;
            align-items: center;
            padding-top: 64px;
            position: relative;
            overflow: hidden;
        }

            .kp-hero::before {
                content: '';
                position: absolute;
                inset: 0;
                background-image: radial-gradient(circle, rgba(123,140,255,0.22) 1px, transparent 1px);
                background-size: 32px 32px;
                pointer-events: none;
            }

            .kp-hero::after {
                content: '';
                position: absolute;
                width: 700px;
                height: 700px;
                border-radius: 50%;
                background: radial-gradient(circle, rgba(123,140,255,0.15) 0%, transparent 70%);
                top: -200px;
                right: -100px;
                pointer-events: none;
            }

        .kp-hero__inner {
            position: relative;
            z-index: 2;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2.5rem;
            display: grid;
            grid-template-columns: 1fr auto;
            align-items: center;
            gap: 4rem;
        }

        .kp-hero__eyebrow {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            color: var(--blue-light);
            margin-bottom: 1.5rem;
        }

            .kp-hero__eyebrow::before {
                content: '';
                display: block;
                width: 24px;
                height: 2px;
                background: var(--blue-light);
            }

        .kp-hero__headline {
            font-size: clamp(3rem, 7vw, 6.5rem);
            font-weight: 900;
            line-height: 0.92;
            letter-spacing: -0.04em;
            color: var(--white);
            margin-bottom: 1.75rem;
        }

            .kp-hero__headline em {
                font-style: normal;
                color: var(--blue-light);
            }

        .kp-hero__body {
            font-size: 1rem;
            color: rgba(255,255,255,0.6);
            line-height: 1.7;
            max-width: 480px;
            margin-bottom: 2.5rem;
        }

        .kp-hero__actions {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .btn-hero {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.8rem 1.75rem;
            font-size: 0.88rem;
            font-weight: 700;
            font-family: 'Inter', sans-serif;
            letter-spacing: 0.02em;
            border-radius: 0.5rem;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-hero--primary {
            background: var(--white);
            color: var(--blue-deep);
            border: 2px solid var(--white);
        }

            .btn-hero--primary:hover {
                background: var(--blue-light);
                border-color: var(--blue-light);
                color: var(--blue-deep);
                transform: translateY(-2px);
            }

        .btn-hero--secondary {
            background: transparent;
            color: var(--white);
            border: 2px solid rgba(255,255,255,0.3);
        }

            .btn-hero--secondary:hover {
                border-color: rgba(255,255,255,0.7);
                transform: translateY(-2px);
            }

        /* Stats */
        .kp-hero__stats {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
            padding: 2rem;
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(123,140,255,0.2);
            border-radius: 1rem;
            min-width: 200px;
            backdrop-filter: blur(8px);
        }

        .kp-stat__number {
            font-size: 2rem;
            font-weight: 900;
            color: var(--white);
            letter-spacing: -0.04em;
            line-height: 1;
        }

        .kp-stat__label {
            font-size: 0.72rem;
            font-weight: 600;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: rgba(255,255,255,0.45);
            margin-top: 0.2rem;
        }

        .kp-stat__divider {
            height: 1px;
            background: rgba(123,140,255,0.2);
        }

        /* ════════════════════════════════════════
           SECCIÓN CATÁLOGO
        ════════════════════════════════════════ */
        .kp-catalog {
            background: var(--white);
            padding: 4rem 0;
        }

        .kp-catalog__header {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2.5rem 2.5rem;
            display: flex;
            align-items: baseline;
            justify-content: space-between;
            border-bottom: 1px solid var(--border);
        }

        .kp-catalog__title {
            font-size: 1.75rem;
            font-weight: 800;
            color: var(--blue);
            letter-spacing: -0.03em;
        }

            .kp-catalog__title span {
                color: var(--ink-muted);
                font-weight: 400;
                font-size: 0.9rem;
                margin-left: 0.75rem;
            }

        .kp-catalog__body {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2.5rem;
            display: grid;
            grid-template-columns: 240px 1fr;
            gap: 2.5rem;
        }

        /* Sidebar */
        .kp-sidebar {
            position: sticky;
            top: 80px;
            align-self: start;
        }

        .kp-sidebar__box {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 0.85rem;
            padding: 1.5rem;
        }

        .kp-sidebar__heading {
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--ink-muted);
            margin-bottom: 1rem;
        }

        .kp-filter-btn {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
            padding: 0.55rem 0.75rem;
            border-radius: 0.45rem;
            background: transparent;
            border: none;
            font-size: 0.84rem;
            font-weight: 500;
            font-family: 'Inter', sans-serif;
            color: var(--ink);
            cursor: pointer;
            transition: background 0.15s, color 0.15s;
            text-align: left;
            margin-bottom: 0.25rem;
        }

            .kp-filter-btn:hover {
                background: #e8eaf5;
            }

            .kp-filter-btn.active {
                background: #e4e6f8;
                color: var(--blue);
                font-weight: 700;
            }

        .kp-filter-badge {
            font-size: 0.68rem;
            font-weight: 700;
            background: var(--border);
            color: var(--ink-muted);
            padding: 0.15rem 0.5rem;
            border-radius: 999px;
        }

        .kp-filter-btn.active .kp-filter-badge {
            background: rgba(11,17,132,0.12);
            color: var(--blue);
        }

        #btnVerMas {
            margin-top: 0.5rem;
            width: 100%;
            padding: 0.45rem;
            font-size: 0.78rem;
            font-weight: 700;
            color: var(--blue);
            background: transparent;
            border: none;
            cursor: pointer;
            font-family: 'Inter', sans-serif;
            text-align: center;
        }

            #btnVerMas:hover {
                text-decoration: underline;
            }

        /* Product grid */
        .kp-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 1.25rem;
        }

        .kp-card {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 0.85rem;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            transition: box-shadow 0.2s, transform 0.2s;
        }

            .kp-card:hover {
                box-shadow: 0 8px 32px rgba(11,17,132,0.1);
                transform: translateY(-3px);
            }

        .kp-card__img {
            height: 180px;
            overflow: hidden;
            background: var(--surface);
        }

            .kp-card__img img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.4s;
            }

        .kp-card:hover .kp-card__img img {
            transform: scale(1.06);
        }

        .kp-card__body {
            flex: 1;
            display: flex;
            flex-direction: column;
            padding: 1.1rem;
        }

        .kp-card__brand {
            font-size: 0.7rem;
            font-weight: 600;
            letter-spacing: 0.06em;
            text-transform: uppercase;
            color: var(--ink-muted);
            margin-bottom: 0.3rem;
        }

        .kp-card__name {
            font-size: 0.95rem;
            font-weight: 700;
            color: var(--ink);
            line-height: 1.3;
            margin-bottom: auto;
        }

        .kp-card__divider {
            height: 1px;
            background: var(--border);
            margin: 1rem 0 0.75rem;
        }

        .kp-card__btn {
            width: 100%;
            padding: 0.55rem;
            font-size: 0.8rem;
            font-weight: 700;
            font-family: 'Inter', sans-serif;
            letter-spacing: 0.02em;
            background: transparent;
            border: 1.5px solid var(--blue);
            color: var(--blue);
            border-radius: 0.45rem;
            cursor: pointer;
            transition: background 0.2s, color 0.2s;
        }

            .kp-card__btn:hover {
                background: var(--blue);
                color: #fff;
            }

        /* Promo card */
        .kp-promo-card {
            border: 1.5px dashed var(--border);
            border-radius: 0.85rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 2.5rem 1.5rem;
            text-align: center;
            gap: 0.75rem;
            background: var(--surface);
        }

        .kp-promo-card__icon {
            width: 52px;
            height: 52px;
            border-radius: 50%;
            background: rgba(11,17,132,0.08);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .kp-promo-card__title {
            font-size: 0.95rem;
            font-weight: 700;
            color: var(--ink);
        }

        .kp-promo-card__sub {
            font-size: 0.8rem;
            color: var(--ink-muted);
            line-height: 1.5;
        }

        .kp-promo-card__link {
            font-size: 0.82rem;
            font-weight: 700;
            color: var(--blue);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
        }

            .kp-promo-card__link:hover {
                text-decoration: underline;
            }

        /* ── CSS Puro para el Modal Reemplazando Tailwind ── */
        .kp-modal {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(5px);
            display: none; /* Oculto por defecto */
            align-items: center;
            justify-content: center;
            z-index: 2000;
            padding: 1rem;
        }

            .kp-modal.active {
                display: flex; /* Se muestra al activar */
            }

        .kp-modal__content {
            background: #ffffff;
            width: 100%;
            max-width: 900px;
            border-radius: 1rem;
            overflow: hidden;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            animation: kpFadeIn 0.3s ease;
        }

        @keyframes kpFadeIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }

            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        /* ════════════════════════════════════════
           RESPONSIVE
        ════════════════════════════════════════ */
        @media (max-width: 900px) {
            .kp-catalog__body {
                grid-template-columns: 1fr;
            }

            .kp-sidebar {
                position: static;
            }
        }

        @media (max-width: 640px) {
            .kp-hero__inner {
                grid-template-columns: 1fr;
            }

            .kp-hero__stats {
                display: none;
            }

            .kp-nav__links {
                display: none;
            }

            .kp-catalog__body {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>

    <div id="modal" class="kp-modal" onclick="cerrarModalExterno(event)">
        <div class="kp-modal__content">
            <div class="row g-0">
                <div class="col-md-6 bg-light" style="min-height: 300px;">
                    <img id="modal-img" class="w-100 h-100" style="object-fit: cover;" src="" alt="Producto" />
                </div>
                <div class="col-md-6 p-4 d-flex flex-column">
                    <div class="d-flex justify-content-between align-items-start mb-3">
                        <div>
                            <h2 id="modal-nombre" class="h3 fw-bold text-dark m-0"></h2>
                            <p id="modal-marca" class="text-muted small m-0 mt-1"></p>
                        </div>
                        <button type="button" onclick="cerrarModal()" class="btn-close" aria-label="Close"></button>
                    </div>

                    <div class="mb-3">
                        <span id="modal-precio" class="h4 fw-bold text-primary"></span>
                    </div>

                    <div class="row g-2 text-center mb-3">
                        <div class="col-6">
                            <div class="p-2 bg-light rounded">
                                <span class="text-muted d-block small">Stock</span>
                                <span id="modal-stock" class="fw-semibold text-dark"></span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="p-2 bg-light rounded">
                                <span class="text-muted d-block small">Categoría</span>
                                <span id="modal-categoria" class="fw-semibold text-dark"></span>
                            </div>
                        </div>
                    </div>

                    <div class="flex-grow-1">
                        <h3 class="h6 fw-bold text-secondary mb-2">Descripción</h3>
                        <p id="modal-descripcion" class="text-muted small lh-base"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <nav class="kp-nav">
        <a href="#inicio" class="kp-nav__brand">Distribuidora<span> Keppler</span></a>
        <ul class="kp-nav__links">
            <li><a href="#inicio">Inicio</a></li>
            <li><a href="#catalogo">Catálogo</a></li>
        </ul>
        <div class="kp-nav__cta">
            <a href="Vista/Auth/Login.aspx" class="btn-nav btn-nav--outline">Iniciar sesión</a>
            <a href="Vista/Cliente/Registro.aspx" class="btn-nav btn-nav--fill">Registrarse</a>
        </div>
    </nav>

    <form id="form1" runat="server">
        <section id="inicio" class="kp-hero">
            <div class="kp-hero__inner">
                <div>
                    <div class="kp-hero__eyebrow">Distribución nacional de confianza</div>
                    <h1 class="kp-hero__headline">MÁS ALLÁ<br />
                        <em>DEL MUNDO.</em></h1>
                    <p class="kp-hero__body">Llevamos sus productos con rapidez, confianza y seguridad. Logística eficiente adaptada a cada cliente, con seguimiento en tiempo real y atención personalizada.</p>
                    <div class="kp-hero__actions">
                        <a href="#catalogo" class="btn-hero btn-hero--primary">Ver catálogo →</a>
                        <a href="Vista/Cliente/Registro.aspx" class="btn-hero btn-hero--secondary">Crear cuenta</a>
                    </div>
                </div>
                <div class="kp-hero__stats">
                    <div>
                        <div class="kp-stat__number">+<asp:Label ID="lblTotalProductos" runat="server" Text=""></asp:Label></div>
                        <div class="kp-stat__label">Productos</div>
                    </div>
                    <div class="kp-stat__divider"></div>
                    <div>
                        <div class="kp-stat__number">12</div>
                        <div class="kp-stat__label">Categorías</div>
                    </div>
                    <div class="kp-stat__divider"></div>
                </div>
            </div>
        </section>

        <section id="catalogo" class="kp-catalog">
            <div class="kp-catalog__header">
                <h2 class="kp-catalog__title">Catálogo<span>Explore todos nuestros productos</span></h2>
            </div>

            <div class="kp-catalog__body">
                <aside class="kp-sidebar">
                    <div class="kp-sidebar__box">
                        <p class="kp-sidebar__heading">Categorías</p>
                        <button type="button" id="btnTodasCategorias" class="kp-filter-btn active">
                            <span>Todos los productos</span>
                            <span class="kp-filter-badge">
                                <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label></span>
                        </button>
                        <asp:Repeater ID="rptCategorias" runat="server">
                            <ItemTemplate>
                                <button type="button" class="kp-filter-btn categoria-item" data-categoria="<%# Eval("Nombre") %>">
                                    <span><%# Eval("Nombre") %></span>
                                </button>
                            </ItemTemplate>
                        </asp:Repeater>
                        <button type="button" id="btnVerMas">Ver más ↓</button>
                    </div>
                </aside>

                <div>
                    <div class="kp-grid">
                        <asp:Repeater ID="rptProductos" runat="server">
                            <ItemTemplate>
                                <div class="kp-card" data-categoria="<%# Eval("CategoriaNombre") %>">
                                    <div class="kp-card__img">
                                        <img src="<%# Eval("Imagen") %>" alt="Producto" loading="lazy" />
                                    </div>
                                    <div class="kp-card__body">
                                        <p class="kp-card__brand"><%# Eval("MarcaNombre") %></p>
                                        <p class="kp-card__name"><%# Eval("Nombre") %></p>
                                        <div class="kp-card__divider"></div>

                                        <button type="button" class="kp-card__btn btn-detalle"
                                            data-nombre="<%# Eval("Nombre") %>"
                                            data-marca="<%# Eval("MarcaNombre") %>"
                                            data-precio="$ <%# Eval("Precio") %>"
                                            data-stock="<%# Eval("Stock") %>"
                                            data-categoria="<%# Eval("CategoriaNombre") %>"
                                            data-descripcion="<%# Eval("Descripcion") %>"
                                            data-imagen="<%# Eval("Imagen") %>">
                                            Ver detalle
                                        </button>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <div class="kp-promo-card">
                            <div class="kp-promo-card__icon">🛒</div>
                            <p class="kp-promo-card__title">¿Listo para pedir?</p>
                            <p class="kp-promo-card__sub">Inicie sesión para gestionar sus pedidos y acceder a precios diferenciados.</p>
                            <a href="Vista/Auth/Login.aspx" class="kp-promo-card__link">Iniciar sesión →</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>

    <script>
        function abrirModal(nombre, marca, precio, stock, categoria, descripcion, imagen) {
            document.getElementById('modal-nombre').innerText = nombre;
            document.getElementById('modal-marca').innerText = marca;
            document.getElementById('modal-precio').innerText = precio;
            document.getElementById('modal-stock').innerText = stock;
            document.getElementById('modal-categoria').innerText = categoria;
            document.getElementById('modal-descripcion').innerText = descripcion;
            document.getElementById('modal-img').src = imagen;

            document.getElementById('modal').classList.add('active');
        }

        function cerrarModal() {
            document.getElementById('modal').classList.remove('active');
        }

        function cerrarModalExterno(e) {
            if (e.target.id === 'modal') {
                cerrarModal();
            }
        }

        document.addEventListener("DOMContentLoaded", () => {
            // Clics de los botones detalle
            const botonesDetalle = document.querySelectorAll(".btn-detalle");
            botonesDetalle.forEach(boton => {
                boton.addEventListener("click", () => {
                    abrirModal(
                        boton.dataset.nombre,
                        boton.dataset.marca,
                        boton.dataset.precio,
                        boton.dataset.stock,
                        boton.dataset.categoria,
                        boton.dataset.descripcion,
                        boton.dataset.imagen
                    );
                });
            });

            // Funcionalidad "Ver más" en categorías
            const btn = document.getElementById("btnVerMas");
            if (btn) {
                const limite = 3;
                let expandido = false;

                function aplicarItem() {
                    const categorias = document.querySelectorAll(".categoria-item");
                    categorias.forEach((cat, index) => {
                        if (!expandido && index >= limite) {
                            cat.style.display = "none";
                        } else {
                            cat.style.display = "flex";
                        }
                    });
                    btn.innerText = expandido ? "Ver menos ↑" : "Ver más ↓";
                }

                btn.addEventListener("click", () => {
                    expandido = !expandido;
                    aplicarItem();
                });
                aplicarItem();
            }

            // Filtro de categorías funcional
            const filtros = document.querySelectorAll(".kp-filter-btn");

            function normalizar(str) {
                return str.trim().toLowerCase()
                    .normalize("NFD")
                    .replace(/[\u0300-\u036f]/g, "");
            }

            filtros.forEach(btnFiltro => {
                btnFiltro.addEventListener("click", () => {
                    filtros.forEach(b => b.classList.remove("active"));
                    btnFiltro.classList.add("active");

                    const categoriaSeleccionada = btnFiltro.dataset.categoria;

                    document.querySelectorAll(".kp-card").forEach(card => {
                        if (!categoriaSeleccionada) {
                            card.style.display = ""; // Muestra todos
                        } else {
                            const catCard = normalizar(card.dataset.categoria || "");
                            const catFiltro = normalizar(categoriaSeleccionada);
                            card.style.display = catCard === catFiltro ? "" : "none";
                        }
                    });
                });
            });

            // Botón directo para restablecer el filtro
            document.getElementById("btnTodasCategorias")?.addEventListener("click", () => {
                filtros.forEach(b => b.classList.remove("active"));
                document.getElementById("btnTodasCategorias").classList.add("active");
                document.querySelectorAll(".kp-card").forEach(card => {
                    card.style.display = "";
                });
            });
        });
    </script>
</body>
</html>
