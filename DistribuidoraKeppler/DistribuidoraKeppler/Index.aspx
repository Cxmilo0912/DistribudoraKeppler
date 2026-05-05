<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="DistribuidoraKeppler.Index" %>

<!DOCTYPE html>

<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700;800&amp;family=Space+Grotesk:wght@400;500;700&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=account_box" />
    <link rel="stylesheet" href="Vista/Assets/css/Index.css" />
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "tertiary-fixed-dim": "#94d4b5",
                        "on-primary-fixed-variant": "#005234",
                        "on-primary-fixed": "#002112",
                        "background": "#121414",
                        "on-error-container": "#ffdad6",
                        "tertiary": "#94d4b5",
                        "on-primary": "#003823",
                        "surface-container": "#1e2020",
                        "primary-container": "#08a56e",
                        "inverse-primary": "#006c46",
                        "on-secondary-fixed": "#351000",
                        "on-tertiary-fixed-variant": "#09513a",
                        "surface-variant": "#333535",
                        "surface-container-highest": "#333535",
                        "surface": "#121414",
                        "secondary-fixed-dim": "#ffb693",
                        "secondary": "#ffb693",
                        "on-tertiary-fixed": "#002115",
                        "on-secondary-container": "#572000",
                        "on-surface-variant": "#bccabf",
                        "surface-container-high": "#282a2a",
                        "surface-bright": "#383939",
                        "primary-fixed-dim": "#5ddda1",
                        "primary": "#5ddda1",
                        "inverse-on-surface": "#2f3131",
                        "error": "#ffb4ab",
                        "on-primary-container": "#00311d",
                        "outline-variant": "#3d4a41",
                        "surface-dim": "#121414",
                        "primary-fixed": "#7bfabb",
                        "inverse-surface": "#e2e2e2",
                        "tertiary-fixed": "#aff0d1",
                        "on-tertiary": "#003826",
                        "on-tertiary-container": "#003121",
                        "on-error": "#690005",
                        "secondary-fixed": "#ffdbcc",
                        "error-container": "#93000a",
                        "on-secondary": "#561f00",
                        "surface-tint": "#5ddda1",
                        "on-secondary-fixed-variant": "#7a3000",
                        "outline": "#86948a",
                        "tertiary-container": "#5f9d81",
                        "surface-container-lowest": "#0d0f0f",
                        "on-surface": "#e2e2e2",
                        "on-background": "#e2e2e2",
                        "surface-container-low": "#1a1c1c",
                        "secondary-container": "#fe6b00"
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
                        "label": ["Space Grotesk"]
                    }
                },
            },
        }
    </script>
    <script>
        function abrirModal(nombre, marca, precio, stock, categoria, descripcion, imagen) {
            const modal = document.getElementById('modal');

            document.getElementById('modal-nombre').innerText = nombre;
            document.getElementById('modal-marca').innerText = marca;
            document.getElementById('modal-precio').innerText = precio;
            document.getElementById('modal-stock').innerText = stock;
            document.getElementById('modal-categoria').innerText = categoria;
            document.getElementById('modal-descripcion').innerText = descripcion;
            document.getElementById('modal-img').src = imagen;


            modal.classList.remove('hidden');
            modal.classList.add('flex');
        }

        function cerrarModal() {
            const modal = document.getElementById('modal');
            modal.classList.add('hidden');
            modal.classList.remove('flex');
        }
    </script>
    <title>Distribuidora Keppler</title>
</head>
<div id="modal" class="fixed inset-0 hidden items-center justify-center z-50">

    <!-- Overlay -->
    <div class="absolute inset-0 bg-black/60 backdrop-blur-sm" onclick="cerrarModal()"></div>

    <!-- Contenido -->
    <div class="relative w-[95%] max-w-5xl bg-white/90 backdrop-blur-xl rounded-2xl shadow-2xl overflow-hidden flex flex-col md:flex-row animate-[fadeIn_.3s_ease]">

        <!-- Imagen -->
        <div class="md:w-1/2 h-64 md:h-auto bg-gray-100">
            <img id="modal-img" class="w-full h-full object-cover" src="https://es.dreamstime.com/photos-images/coca-cola-logo.html" alt="hola" />
        </div>
        <!-- Info -->
        <div class="md:w-1/2 p-6 flex flex-col">

            <!-- Header -->
            <div class="flex justify-between items-start mb-4">
                <div>
                    <h2 id="modal-nombre" class="text-2xl font-extrabold text-gray-900"></h2>
                    <p id="modal-marca" class="text-sm text-gray-500"></p>
                </div>

                <button onclick="cerrarModal()" class="text-gray-400 hover:text-black text-xl">
                    ✕
                </button>
            </div>

            <!-- Precio -->
            <div class="mb-4">
                <span id="modal-precio" class="text-2xl font-bold text-primary"></span>
            </div>

            <!-- Info rápida -->
            <div class="grid grid-cols-2 gap-4 text-sm mb-4">
                <div class="bg-gray-100 p-3 rounded-lg">
                    <span class="text-gray-500 block">Stock</span>
                    <span id="modal-stock" class="font-semibold text-gray-800"></span>
                </div>
                <div class="bg-gray-100 p-3 rounded-lg">
                    <span class="text-gray-500 block">Categoría</span>
                    <span id="modal-categoria" class="font-semibold text-gray-800"></span>
                </div>
            </div>

            <!-- Descripción -->
            <div class="flex-1 mb-6">
                <h3 class="text-sm font-bold text-gray-700 mb-2">Descripción</h3>
                <p id="modal-descripcion" class="text-sm text-gray-600 leading-relaxed"></p>
            </div>

        </div>
    </div>
</div>
<body class="bg-background text-on-background font-body selection:bg-primary selection:text-on-primary">
    <div id="app">
        <section id="inicio" class="relative h-screen bg-black overflow-hidden flex flex-col">
            <canvas id="canvas" class="absolute inset-0 w-full h-full"></canvas>
            <div class="relative z-10 hero">
                <!-- TopNavBar -->
                <nav class="absolute top-0 left-0 right-0 z-20 flex justify-between items-center w-full px-4 md:px-8 py-4 bg-[#1a1c1c]/80 backdrop-blur">
                    <div class="hidden md:flex items-center gap-8">
                        <span class="text-xl md:text-2xl font-black tracking-tighter text-[#5ddda1] uppercase font-headline">Distribuidora - Keppler</span>

                        <a href="#inicio" class="menu-item text-xl md:text-lg font-black tracking-tighter text-[#5ddda1] uppercase font-headline uppercase cursor-pointer">Inicio</a>

                        <a href="#catalogo" class="menu-item text-xl md:text-lg font-black tracking-tighter text-[#5ddda1] uppercase font-headline uppercase cursor-pointer">Catálogo</a>
                    </div>
                </nav>


                <!-- Main Content Canvas -->
                <main class="pt-24 flex-1 flex items-center">
                    <!-- Hero Carousel Section -->
                    <div class="max-w-7x1 mx-auto px-6 lg:px-12 w-full">
                        <div id="Prueba" class="flex flex-col md:flex-row items-center md:items-stretch justify-start gap-10 md:gap-20 w-full h-full">
                            <!-- Text Area -->
                            <div class="w-full md:w-2/3 text-center md:text-left space-y-4 md:space-y-6">
                                <h1 class="text-4xl sm:text-5xl md:text-6xl lg:text-8xl font-black text-on-background tracking-tighter leading-none font-headline">MÁS ALLÁ
                            <br />
                                    <span class="text-primary">DEL MUNDO.</span>
                                </h1>
                                <p class="text-lg lg:text-xl text-on-surface-variant max-w-xl font-body leading-relaxed">
                                    Llevamos tus productos con rapidez, confianza y seguridad, asegurando que lleguen a su destino en perfectas condiciones. Nuestro compromiso es ofrecer un servicio de logística eficiente y confiable, adaptándonos a las necesidades de cada cliente.
                                </p>
                            </div>
                            <!-- CTA Buttons Column (Aligned Right and Centered Vertically) -->
                            <div class="w-full md:w-1/3 flex flex-col gap-4 items-center md:items-end md:justify-center">
                                <a href="Vista/Cliente/Registro.aspx" class="flex items-center justify-between px-4 py-3 md:px-6 md:py-5 text-base md:text-lg">
    <span class="font-label font-bold text-lg uppercase tracking-tight">Registrarse</span>
    <span class="material-symbols-outlined">account_box</span>
</a>


                                <a href="Vista/Auth/Login.aspx" class="flex items-center justify-between px-4 py-3 md:px-6 md:py-5 text-base md:text-lg"><span class="font-label font-bold text-lg uppercase tracking-tight">Iniciar Sesión</span>
                                    <span class="material-symbols-outlined">login
                                    </span>
                                </a>

                            </div>
                        </div>
                    </div>
                    <!-- Bottom Data Ticker (Kinetic Element) -->

                </main>
            </div>
        </section>


        <section id="catalogo" class="min-h-screen bg-white">
            <div class="flex">
                <!-- Main Content Area -->
                <main class="flex-1 p-8 max-w-7xl mx-auto">
                    <div class="grid grid-cols-12 gap-8">
                        <!-- Left Sidebar Filters -->
                        <aside class="col-span-12 lg:col-span-3 space-y-6">
                            <div class="bg-white border border-outline-variant p-6 rounded-xl shadow-sm">
                                <h3 class="text-black font-bold text-lg mb-4 flex items-center">
                                    <span class="material-symbols-outlined mr-2 text-primary">filter_list</span>
                                    Productos por Categoría
                                </h3>
                                <div class="space-y-2">
                                    <div class="flex items-center justify-between p-2 rounded-lg  text-primary font-semibold text-sm">
                                        <button id="btnTodasCategorias"
                                            class="filtro-btn categoria-item w-full flex items-center justify-between p-2 rounded-lg text-black font-bold hover:bg-gray-50 text-sm font-medium">
                                            <span>Todos los productos</span>
                                            <span class="bg-gray-200 text-gray-700 text-[10px] px-2 py-0.5 rounded-full">
                                                <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
                                            </span>
                                        </button>
                                    </div>
                                    <asp:Repeater ID="rptCategorias" runat="server">
                                        <ItemTemplate>
                                            <button class="filtro-btn categoria-item w-full flex items-center justify-between p-2 rounded-lg text-black font-bold hover:bg-gray-50 text-sm font-medium"
                                                data-categoria="<%# Eval("Nombre") %>">
                                                <span><%# Eval("Nombre") %></span>
                                            </button>

                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <button id="btnVerMas" class="w-full mt-2 text-primary font-bold text-sm hover:underline">
                                        Ver más
                                    </button>
                                </div>
                            </div>
                        </aside>
                        <!-- Product Grid -->
                        <div class="col-span-12 lg:col-span-9">
                            <div class="flex items-center justify-between mb-8">
                                <h2 class="text-2xl font-bold text-black">Catálogo</h2>
                            </div>
                            <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-6">
                                <asp:Repeater ID="rptProductos" runat="server">
                                    <ItemTemplate>

                                        <div class="bg-white border border-outline-variant rounded-xl overflow-hidden hover:shadow-lg transition-all group flex flex-col" data-categoria="<%# Eval("CategoriaNombre") %>">

                                            <div class="h-52 overflow-hidden relative">
                                                <img class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                                                    src="https://es.dreamstime.com/photos-images/coca-cola-logo.html" />
                                                <span class="absolute top-3 left-3 bg-green-100 text-green-700 text-[10px] font-bold px-2 py-1 rounded-full uppercase tracking-wider">Fresh Produce
                                                </span>
                                            </div>

                                            <div class="p-6 flex-grow flex flex-col">
                                                <h3 class="text-lg font-bold text-black mb-1">
                                                    <%# Eval("Nombre") %>
                                                </h3>
                                                <p class="text-sm text-gray-500 mb-4">
                                                    <%# Eval("MarcaNombre") %>
                                                </p>

                                                <div class="mt-auto space-y-4">
                                                    <div class="h-[1px] bg-gray-100 w-full"></div>
                                                    <button type="button"
                                                        onclick="abrirModal(
                                                        '<%# Eval("Nombre") %>',
                                                        '<%# Eval("MarcaNombre") %>',
                                                        '$ <%# Eval("Precio") %>',
                                                        '<%# Eval("Stock") %>',
                                                        '<%# Eval("CategoriaNombre") %>',
                                                        '<%# Eval("Descripcion") %>',
                                                        'img.jpg'
                                                        )"
                                                        class="w-full py-2.5 rounded-lg border-2 border-primary text-primary font-bold text-sm hover:bg-primary hover:text-white transition-all active:scale-95">
                                                        Ver Más...
                                                    </button>
                                                </div>
                                            </div>

                                        </div>

                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <br />
                            <!-- Skeleton/Promo Card 6 -->
                            <div class="bg-surface-container border border-dashed border-outline-variant rounded-xl overflow-hidden flex flex-col items-center justify-center p-8 text-center gap-4">
                                <div class="w-16 h-16 rounded-full bg-primary-container flex items-center justify-center">
                                    <span class="material-symbols-outlined text-on-primary-container text-3xl">add_business</span>
                                </div>
                                <h3 class="text-lg font-bold text-on-surface">¿Quieres hacer un pedido?</h3>
                                <p class="text-sm text-on-surface-variant">Para hacer tu pedido debes iniciar primero sesión</p>
                                <a href="Vista/Auth/Login.aspx" class="mt-2 text-primary font-bold text-sm flex items-center gap-1 hover:gap-2 transition-all">Iniciar Sesión <span class="material-symbols-outlined text-[18px]">arrow_forward</span></a>
                            </div>
                        </div>
                    </div>
            </div>
        </main>
    </div>


    <!-- Mobile Bottom NavBar (Visible only on small screens) -->
    <nav class="md:hidden fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 h-16 flex items-center justify-around z-50">
        <a class="flex flex-col items-center text-primary" href="#">
            <span class="material-symbols-outlined">inventory_2</span>
            <span class="text-[10px] font-bold">Catalog</span>
        </a>
        <a class="flex flex-col items-center text-gray-400" href="#">
            <span class="material-symbols-outlined">search</span>
            <span class="text-[10px] font-medium">Search</span>
        </a>
        <a class="flex flex-col items-center text-gray-400" href="#">
            <span class="material-symbols-outlined">shopping_cart</span>
            <span class="text-[10px] font-medium">Cart</span>
        </a>
        <a class="flex flex-col items-center text-gray-400" href="#">
            <span class="material-symbols-outlined">person</span>
            <span class="text-[10px] font-medium">Account</span>
        </a>
    </nav>

    </section>
        <style>
            @keyframes marquee {
                0% {
                    transform: translateX(0);
                }

                100% {
                    transform: translateX(-50%);
                }
            }

            .animate-marquee {
                animation: marquee 20s linear infinite;
            }
        </style>
    </div>
</body>

<script type="module" src="Vista/Assets/js/Index.js"></script>
<script type="module">
    import TubesCursor from "https://cdn.jsdelivr.net/npm/threejs-components@0.0.19/build/cursors/tubes1.min.js";

    document.addEventListener("DOMContentLoaded", () => {

        const canvas = document.getElementById('canvas');

        if (canvas) {
            const app = TubesCursor(canvas, {
                tubes: {
                    colors: ["#f967fb", "#53bc28", "#6958d5"],
                    lights: {
                        intensity: 200,
                        colors: ["#83f36e", "#fe8a2e", "#ff008a", "#60aed5"]
                    }
                }
            });
        }

        //VER MÁS
        const btn = document.getElementById("btnVerMas");

        if (!btn) return;

        const limite = 3;
        let expandido = false;

        function aplicarItem() {
            const categorias = document.querySelectorAll(".categoria-item");

            categorias.forEach((cat, index) => {
                if (!expandido && index >= limite) {
                    cat.classList.add("hidden");
                } else {
                    cat.classList.remove("hidden");
                }
            });

            btn.innerText = expandido ? "Ver menos" : "Ver más";
        }

        btn.addEventListener("click", () => {
            expandido = !expandido;
            aplicarItem();
        });

        aplicarItem();
    });


    // FILTRO DE CATEGORÍAS
    const filtros = document.querySelectorAll(".filtro-btn");
    const productos = document.querySelectorAll("#rptProductos .group, [data-categoria]");

    // Helper: normalizar texto para comparar sin tildes ni mayúsculas
    function normalizar(str) {
        return str.trim().toLowerCase()
            .normalize("NFD")
            .replace(/[\u0300-\u036f]/g, "");
    }

    let categoriaActiva = null;

    filtros.forEach(btn => {
        btn.addEventListener("click", () => {
            const categoriaSeleccionada = btn.dataset.categoria;

            // Si ya estaba activo, deseleccionar (mostrar todo)
            if (categoriaActiva === categoriaSeleccionada) {
                categoriaActiva = null;
            } else {
                categoriaActiva = categoriaSeleccionada;
            }

            // Actualizar estilos de botones activos
            filtros.forEach(b => b.classList.remove("bg-surface-container-low", "text-primary", "font-semibold"));
            if (categoriaActiva) {
                btn.classList.add("bg-surface-container-low", "text-primary", "font-semibold");
            }

            // Filtrar tarjetas
            document.querySelectorAll("[data-categoria]").forEach(card => {
                if (!categoriaActiva) {
                    card.style.display = "";
                } else {
                    const catCard = normalizar(card.dataset.categoria || "");
                    const catFiltro = normalizar(categoriaActiva);
                    card.style.display = catCard === catFiltro ? "" : "none";
                }
            });
        });
    });

    // Botón "Todas las Categorías"
    document.querySelector(".bg-surface-container-low.text-primary")
        ?.addEventListener("click", () => {
            categoriaActiva = null;
            filtros.forEach(b => b.classList.remove("bg-surface-container-low", "text-primary", "font-semibold"));
            document.querySelectorAll("[data-categoria]").forEach(card => {
                card.style.display = "";
            });
        });

</script>
</html>
