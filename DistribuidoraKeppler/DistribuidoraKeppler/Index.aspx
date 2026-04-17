<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="DistribuidoraKeppler.Index" %>

<!DOCTYPE html>

<html class="light" lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Keppler Food Distribution | Abastece tu negocio</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300;400;500;600;700;800&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "secondary-fixed-dim": "#ffb59d",
                        "surface-container-lowest": "#ffffff",
                        "surface-container-highest": "#dbe4e5",
                        "on-secondary-container": "#5d1900",
                        "error-container": "#ffdad6",
                        "on-tertiary-fixed-variant": "#0e5138",
                        "primary": "#003345",
                        "tertiary-fixed": "#b1f0ce",
                        "surface-tint": "#2a657e",
                        "on-secondary": "#ffffff",
                        "secondary-container": "#fe6a34",
                        "on-surface-variant": "#40484c",
                        "outline-variant": "#c0c7cd",
                        "on-surface": "#151d1e",
                        "on-primary-container": "#83bad6",
                        "surface": "#f2fbfc",
                        "on-primary": "#ffffff",
                        "on-tertiary-container": "#82c0a0",
                        "outline": "#71787d",
                        "on-tertiary-fixed": "#002114",
                        "inverse-primary": "#96ceeb",
                        "on-tertiary": "#ffffff",
                        "error": "#ba1a1a",
                        "tertiary-container": "#0b4f36",
                        "on-primary-fixed-variant": "#044d65",
                        "primary-fixed-dim": "#96ceeb",
                        "tertiary-fixed-dim": "#95d4b3",
                        "background": "#f2fbfc",
                        "on-background": "#151d1e",
                        "surface-container": "#e7f0f1",
                        "surface-variant": "#dbe4e5",
                        "surface-dim": "#d3dcdd",
                        "on-error-container": "#93000a",
                        "inverse-surface": "#293233",
                        "primary-container": "#004b63",
                        "on-error": "#ffffff",
                        "on-secondary-fixed": "#390c00",
                        "primary-fixed": "#bfe8ff",
                        "on-primary-fixed": "#001f2b",
                        "secondary": "#ab3500",
                        "tertiary": "#003623",
                        "secondary-fixed": "#ffdbd0",
                        "surface-bright": "#f2fbfc",
                        "on-secondary-fixed-variant": "#832600",
                        "surface-container-high": "#e1eaeb",
                        "surface-container-low": "#ecf5f6",
                        "inverse-on-surface": "#e9f2f3"
                    },
                    "borderRadius": {
                        "DEFAULT": "1rem",
                        "lg": "2rem",
                        "xl": "3rem",
                        "full": "9999px"
                    },
                    "fontFamily": {
                        "headline": ["Manrope"],
                        "body": ["Manrope"],
                        "label": ["Manrope"]
                    }
                },
            },
        }
    </script>
    <style>
        body {
            font-family: 'Manrope', sans-serif;
            background-color: #f2fbfc;
        }

        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        .editorial-shadow {
            box-shadow: 0 8px 32px -4px rgba(0, 51, 69, 0.06);
        }

        .glass-nav {
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
        }
    </style>
</head>
<body class="text-on-surface selection:bg-secondary-fixed selection:text-on-secondary-fixed">
    <form id="form1" runat="server">
        <!-- TopNavBar -->
        <nav class="fixed top-0 w-full z-50 bg-slate-50/80 dark:bg-slate-950/80 backdrop-blur-md shadow-sm dark:shadow-none">
            <div class="flex justify-between items-center px-8 py-4 max-w-screen-2xl mx-auto">
                <div class="flex items-center gap-12">
                    <span class="text-2xl font-black tracking-tighter text-cyan-900 dark:text-cyan-50">Keppler</span>
                    <div class="hidden md:flex gap-8 items-center">
                        <a class="text-cyan-900 dark:text-cyan-400 border-b-2 border-orange-600 pb-1 font-manrope tracking-tight font-bold" href="#">Seasonal Offers</a>
                        <a class="text-slate-600 dark:text-slate-400 hover:text-cyan-800 dark:hover:text-cyan-200 transition-colors font-manrope tracking-tight font-bold" href="#">Pantry</a>
                        <a class="text-slate-600 dark:text-slate-400 hover:text-cyan-800 dark:hover:text-cyan-200 transition-colors font-manrope tracking-tight font-bold" href="#">Drinks</a>
                        <a class="text-slate-600 dark:text-slate-400 hover:text-cyan-800 dark:hover:text-cyan-200 transition-colors font-manrope tracking-tight font-bold" href="#">Cleaning</a>
                        <a class="text-slate-600 dark:text-slate-400 hover:text-cyan-800 dark:hover:text-cyan-200 transition-colors font-manrope tracking-tight font-bold" href="#">Bulk Deals</a>
                    </div>
                </div>
                <div class="flex items-center gap-4">
                    <div class="hidden lg:flex items-center bg-surface-container-low px-4 py-2 rounded-full outline-variant/15 border border-transparent focus-within:border-primary transition-all">
                        <span class="material-symbols-outlined text-outline">search</span>
                        <input class="bg-transparent border-none focus:ring-0 text-sm w-48" placeholder="Search products..." type="text" />
                    </div>
                    <button class="p-2 hover:bg-slate-200/50 dark:hover:bg-slate-800/50 rounded-full transition-all">
                        <span class="material-symbols-outlined text-cyan-900 dark:text-cyan-400">shopping_cart</span>
                    </button>
                    <button class="p-2 hover:bg-slate-200/50 dark:hover:bg-slate-800/50 rounded-full transition-all">
                        <span class="material-symbols-outlined text-cyan-900 dark:text-cyan-400">person</span>
                    </button>
                </div>
            </div>
        </nav>
        <main class="pt-24">
            <!-- Hero Section -->
            <section class="px-8 max-w-screen-2xl mx-auto mb-24">
                <div class="relative overflow-hidden rounded-lg min-h-[600px] flex items-center bg-primary">
                    <div class="absolute inset-0 z-0">
                        <img alt="Warehouse background" class="w-full h-full object-cover opacity-40" data-alt="Modern professional food distribution warehouse interior with organized high shelves and bright clean industrial lighting at dawn" src="https://lh3.googleusercontent.com/aida-public/AB6AXuD50nDPTRcc_dbNnFL40oAOC_Omm0ddi_2uaPRw3OOi3rA0qbQOsPBy7ScYlnim7v7VGy_I4C0gc2QphYpSnObHD1eQThlO7aM-NGrFweYZHcnk3V1Hv96PSza3RJepQ7ECSsVNMjK0J2-IE7-hoxF21ltj-sNFRyoVNUU6s31ajPys9Xia_uigImuzM_uqUs4WW8L-gckQ4DwXNTGK7gZVleJkZcjNQSu-3SkiJhp--3aPf4LOsNB86SCsbIcTytWR4vTfe4kkKNX_" />
                        <div class="absolute inset-0 bg-gradient-to-r from-primary via-primary/80 to-transparent"></div>
                    </div>
                    <div class="relative z-10 px-12 md:px-24 max-w-3xl">
                        <span class="inline-block px-4 py-1 rounded-full bg-secondary text-on-secondary text-xs font-bold tracking-widest uppercase mb-6">Socio Logístico Premium</span>
                        <h1 class="text-6xl md:text-7xl font-bold text-white tracking-tighter mb-6 leading-tight">Abastece tu negocio con lo mejor.
                        </h1>
                        <p class="text-xl text-primary-fixed opacity-90 mb-10 leading-relaxed font-light">
                            Descubre nuestro catálogo mayorista con descuentos exclusivos y logística de prioridad para que tu inventario nunca se detenga.
                        </p>
                        <div class="flex flex-wrap gap-4">
                            <button class="px-10 py-4 bg-secondary text-on-secondary font-bold rounded-full hover:scale-105 transition-transform editorial-shadow">
                                Explorar Catálogo
                            </button>
                            <button class="px-10 py-4 bg-primary-container text-white font-bold rounded-full border border-white/20 hover:bg-white/10 transition-all">
                                Ver Ofertas
                            </button>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Category Grid -->
            <section class="px-8 max-w-screen-2xl mx-auto mb-24">
                <div class="flex items-end justify-between mb-12">
                    <div>
                        <span class="text-secondary font-bold tracking-widest text-xs uppercase block mb-2">Selección Gourmet</span>
                        <h2 class="text-4xl font-bold tracking-tighter text-primary">Compra por Categorías</h2>
                    </div>
                    <a class="text-primary font-bold hover:underline flex items-center gap-2" href="#">Ver todas <span class="material-symbols-outlined">arrow_forward</span>
                    </a>
                </div>
                <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-8">
                    <!-- Category Item -->
                    <div class="flex flex-col items-center group cursor-pointer">
                        <div class="w-32 h-32 rounded-full bg-surface-container-high flex items-center justify-center mb-4 group-hover:scale-110 group-hover:bg-primary-fixed transition-all duration-300">
                            <span class="material-symbols-outlined text-4xl text-primary">local_drink</span>
                        </div>
                        <span class="font-bold text-primary">Bebidas</span>
                    </div>
                    <div class="flex flex-col items-center group cursor-pointer">
                        <div class="w-32 h-32 rounded-full bg-surface-container-high flex items-center justify-center mb-4 group-hover:scale-110 group-hover:bg-primary-fixed transition-all duration-300">
                            <span class="material-symbols-outlined text-4xl text-primary">kitchen</span>
                        </div>
                        <span class="font-bold text-primary">Despensa</span>
                    </div>
                    <div class="flex flex-col items-center group cursor-pointer">
                        <div class="w-32 h-32 rounded-full bg-surface-container-high flex items-center justify-center mb-4 group-hover:scale-110 group-hover:bg-primary-fixed transition-all duration-300">
                            <span class="material-symbols-outlined text-4xl text-primary">cleaning_services</span>
                        </div>
                        <span class="font-bold text-primary">Aseo Hogar</span>
                    </div>
                    <div class="flex flex-col items-center group cursor-pointer">
                        <div class="w-32 h-32 rounded-full bg-surface-container-high flex items-center justify-center mb-4 group-hover:scale-110 group-hover:bg-primary-fixed transition-all duration-300">
                            <span class="material-symbols-outlined text-4xl text-primary">self_care</span>
                        </div>
                        <span class="font-bold text-primary">Cuidado Personal</span>
                    </div>
                    <div class="flex flex-col items-center group cursor-pointer">
                        <div class="w-32 h-32 rounded-full bg-surface-container-high flex items-center justify-center mb-4 group-hover:scale-110 group-hover:bg-primary-fixed transition-all duration-300">
                            <span class="material-symbols-outlined text-4xl text-primary">pets</span>
                        </div>
                        <span class="font-bold text-primary">Mascotas</span>
                    </div>
                    <div class="flex flex-col items-center group cursor-pointer">
                        <div class="w-32 h-32 rounded-full bg-surface-container-high flex items-center justify-center mb-4 group-hover:scale-110 group-hover:bg-primary-fixed transition-all duration-300">
                            <span class="material-symbols-outlined text-4xl text-primary">icecream</span>
                        </div>
                        <span class="font-bold text-primary">Snacks</span>
                    </div>
                </div>
            </section>
            <!-- Product Recommendations -->
            <section class="px-8 max-w-screen-2xl mx-auto mb-24">
                <div class="bg-surface-container-low rounded-lg p-12">
                    <div class="mb-12">
                        <h2 class="text-4xl font-bold tracking-tighter text-primary">Recomendados para ti</h2>
                        <p class="text-on-surface-variant mt-2">Productos seleccionados basados en la demanda de tu sector.</p>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
                        <!-- Product Card -->
                        <div class="bg-surface-container-lowest rounded-lg p-6 group transition-all editorial-shadow flex flex-col">
                            <div class="relative mb-6 overflow-hidden rounded-lg aspect-square">
                                <img alt="Coca Cola" class="w-full h-full object-contain group-hover:scale-110 transition-transform duration-500" data-alt="Professional studio photograph of a 2.5 liter Coca-Cola bottle with condensation droplets on a clean white background" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBoPVVk27-1IZUSAu857cFFPbIy3Tgl6H5rd2qzFHGGa8V6ZUhWDZCJNoPxSFa5L0qCfKHN1p2637WVZ2aFXnBnwhgCPtQeu_P23RPLm1rRjm9QtQBi4LnJBt7uTeCSskKP_fSautCN0vIW6xw82RnCRiL0TSjfPbjSHxhEK98uulMXBxzuzj1b1beC2qn8sxkxfmJ2W6fgciUxB28FqItyjORspC7yyhakSeU56dwHoKG2wAgvO-L2VSstttaPhEY98o7dYugyi0bB" />
                                <span class="absolute top-2 left-2 bg-secondary-container text-on-secondary-container text-[10px] font-bold px-2 py-1 rounded uppercase">Top Seller</span>
                            </div>
                            <div class="mt-auto">
                                <span class="text-xs font-bold text-on-surface-variant uppercase tracking-widest block mb-1">Coca-Cola</span>
                                <h3 class="font-bold text-primary mb-2 line-clamp-2">Pack Coca-Cola Original 2.5L x 6 Unidades</h3>
                                <div class="flex items-baseline gap-2 mb-6">
                                    <span class="text-xl font-black text-secondary">$32.400</span>
                                    <span class="text-sm text-outline line-through">$36.000</span>
                                </div>
                                <button class="w-full py-3 bg-primary-container text-white rounded-full font-bold hover:bg-primary transition-colors flex items-center justify-center gap-2">
                                    <span class="material-symbols-outlined text-sm">add_shopping_cart</span>
                                    Agregar al pedido
                                </button>
                            </div>
                        </div>
                        <div class="bg-surface-container-lowest rounded-lg p-6 group transition-all editorial-shadow flex flex-col">
                            <div class="relative mb-6 overflow-hidden rounded-lg aspect-square">
                                <img alt="Oreo" class="w-full h-full object-contain group-hover:scale-110 transition-transform duration-500" data-alt="Package of Oreo cookies displayed in a commercial studio setting with sharp focus and vibrant blue packaging" src="https://lh3.googleusercontent.com/aida-public/AB6AXuC8RDx6I7EcfwDRSoUOORgYn-G1v3rTaCTfyt_fbbf8e-zhWMkOMZ0Qy5TI3CIVytjtPx0BNAABKwJ00iLtc7pk1AifZvWiCMGD2rzPE5Rrl6KUIZpxoWp9iUsla1jd8nJxXBLKnGn7Gq8jL1Kw9Q8Q_fPdj0nfOIDyDQ2GfGE5tCRUJAc30UwezNWK8rVsPT0fD7fveaI-g6K6ka7A4TsgTapF-GpTfwrgnIucE1K5sE6uheXEOUvmHifN4yUx-frtKfMb9bNPwsO1" />
                                <span class="absolute top-2 left-2 bg-primary text-on-primary text-[10px] font-bold px-2 py-1 rounded uppercase">Exclusivo</span>
                            </div>
                            <div class="mt-auto">
                                <span class="text-xs font-bold text-on-surface-variant uppercase tracking-widest block mb-1">Mondelēz</span>
                                <h3 class="font-bold text-primary mb-2 line-clamp-2">Caja Galletas Oreo Original 36 Unidades</h3>
                                <div class="flex items-baseline gap-2 mb-6">
                                    <span class="text-xl font-black text-secondary">$18.900</span>
                                    <span class="text-sm text-outline line-through">$21.500</span>
                                </div>
                                <button class="w-full py-3 bg-primary-container text-white rounded-full font-bold hover:bg-primary transition-colors flex items-center justify-center gap-2">
                                    <span class="material-symbols-outlined text-sm">add_shopping_cart</span>
                                    Agregar al pedido
                                </button>
                            </div>
                        </div>
                        <div class="bg-surface-container-lowest rounded-lg p-6 group transition-all editorial-shadow flex flex-col">
                            <div class="relative mb-6 overflow-hidden rounded-lg aspect-square">
                                <img alt="Colgate" class="w-full h-full object-contain group-hover:scale-110 transition-transform duration-500" data-alt="Toothpaste tube and box professionally lit on a bright surface highlighting oral hygiene product packaging" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAQZecV83urW00yuyP4TUtqROd_-7_1rZUd-T7gQQT5L8EgdwdL-l9CK8VkgC86EQMIJ-0gOBCj8lu_y5jD5YcvsGKjzB-HxOfTYfWrr3EDINHehxL1NQg2Pn7O4blOOYCqHlHZ0nW_NTPvjO55FRP-I8dSJRDsUyDitRVWr56OC2LjRU6n3J_juQAuY7bwTCGm5TbojntJnY5iJI2UXfxW76u2mUHGBtMDSbUKDWTskMQa6Ji9fKozAvKEOQ7cCZPyLJ2j4wn8KMuY" />
                            </div>
                            <div class="mt-auto">
                                <span class="text-xs font-bold text-on-surface-variant uppercase tracking-widest block mb-1">Colgate-Palmolive</span>
                                <h3 class="font-bold text-primary mb-2 line-clamp-2">Pack Crema Dental Colgate Triple Acción 150ml x 3</h3>
                                <div class="flex items-baseline gap-2 mb-6">
                                    <span class="text-xl font-black text-secondary">$14.200</span>
                                </div>
                                <button class="w-full py-3 bg-primary-container text-white rounded-full font-bold hover:bg-primary transition-colors flex items-center justify-center gap-2">
                                    <span class="material-symbols-outlined text-sm">add_shopping_cart</span>
                                    Agregar al pedido
                                </button>
                            </div>
                        </div>
                        <div class="bg-surface-container-lowest rounded-lg p-6 group transition-all editorial-shadow flex flex-col">
                            <div class="relative mb-6 overflow-hidden rounded-lg aspect-square">
                                <img alt="Detergent" class="w-full h-full object-contain group-hover:scale-110 transition-transform duration-500" data-alt="Large laundry detergent container in professional studio lighting against a clean neutral background" src="https://lh3.googleusercontent.com/aida-public/AB6AXuC5Ve8CxDFNnDL3pPDgoxwSa8QOoVpS5vdoI9O2MILSBBzaNWQy9f3qxl8LAD-vTkSWgRPXL068gXfvoKtTKpEZxs3fQH2PCGDMiNx0P4etLTQCWeJLRPReZhxGd1K4LjY23DAKGUMTSHvJPbxOYUN7Sgz7pdL_RdM1vwoNBvceHCII_Gr2cHFxHANARtrQ8p_OIJoct394--zNoY1Ky5zHQyo8GJ8BgHgmYqO2Q64nPRaVQtvQqlgUMm3wuPp6REjUPZnZEATl1C8m" />
                                <span class="absolute top-2 left-2 bg-tertiary-container text-on-tertiary-container text-[10px] font-bold px-2 py-1 rounded uppercase">Eco-Choice</span>
                            </div>
                            <div class="mt-auto">
                                <span class="text-xs font-bold text-on-surface-variant uppercase tracking-widest block mb-1">Procter &amp; Gamble</span>
                                <h3 class="font-bold text-primary mb-2 line-clamp-2">Detergente Líquido Ariel Power 5L</h3>
                                <div class="flex items-baseline gap-2 mb-6">
                                    <span class="text-xl font-black text-secondary">$45.600</span>
                                    <span class="text-sm text-outline line-through">$52.000</span>
                                </div>
                                <button class="w-full py-3 bg-primary-container text-white rounded-full font-bold hover:bg-primary transition-colors flex items-center justify-center gap-2">
                                    <span class="material-symbols-outlined text-sm">add_shopping_cart</span>
                                    Agregar al pedido
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Trust Bar -->
            <section class="px-8 max-w-screen-2xl mx-auto mb-24 text-center">
                <span class="text-sm font-bold text-outline tracking-widest uppercase block mb-12">MARCAS QUE CONFÍAN EN NOSOTROS</span>
                <div class="flex flex-wrap justify-center items-center gap-12 md:gap-24 opacity-60 grayscale hover:grayscale-0 transition-all">
                    <span class="text-3xl font-black text-primary tracking-tighter">Coca-Cola</span>
                    <span class="text-3xl font-black text-primary tracking-tighter italic">Oreo</span>
                    <span class="text-3xl font-black text-primary tracking-tighter">Colgate</span>
                    <span class="text-3xl font-black text-primary tracking-tighter">Nestlé</span>
                    <span class="text-3xl font-black text-primary tracking-tighter">Bimbo</span>
                </div>
            </section>
            <!-- Feature Highlights -->
            <section class="px-8 max-w-screen-2xl mx-auto mb-24 grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="bg-primary p-8 rounded-lg text-white flex gap-6 items-start">
                    <div class="w-12 h-12 bg-primary-container rounded-full flex items-center justify-center flex-shrink-0">
                        <span class="material-symbols-outlined text-primary-fixed">local_shipping</span>
                    </div>
                    <div>
                        <h4 class="font-bold text-xl mb-2">Envío Gratis</h4>
                        <p class="text-primary-fixed opacity-70">En pedidos superiores a $200.000 para toda el área metropolitana.</p>
                    </div>
                </div>
                <div class="bg-primary p-8 rounded-lg text-white flex gap-6 items-start">
                    <div class="w-12 h-12 bg-primary-container rounded-full flex items-center justify-center flex-shrink-0">
                        <span class="material-symbols-outlined text-primary-fixed">support_agent</span>
                    </div>
                    <div>
                        <h4 class="font-bold text-xl mb-2">Soporte 24/7</h4>
                        <p class="text-primary-fixed opacity-70">Asesoría personalizada para la gestión de tu inventario en cualquier momento.</p>
                    </div>
                </div>
                <div class="bg-primary p-8 rounded-lg text-white flex gap-6 items-start">
                    <div class="w-12 h-12 bg-primary-container rounded-full flex items-center justify-center flex-shrink-0">
                        <span class="material-symbols-outlined text-primary-fixed">verified_user</span>
                    </div>
                    <div>
                        <h4 class="font-bold text-xl mb-2">Pagos Seguros</h4>
                        <p class="text-primary-fixed opacity-70">Múltiples opciones de pago con encriptación de nivel bancario.</p>
                    </div>
                </div>
            </section>
        </main>
        <!-- Footer -->
        <footer class="bg-cyan-950 dark:bg-slate-950 w-full mt-24 border-t border-cyan-900 dark:border-slate-800">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-12 px-12 py-16 max-w-screen-2xl mx-auto">
                <div class="flex flex-col gap-6">
                    <span class="text-xl font-bold text-white">Keppler</span>
                    <p class="font-manrope text-sm leading-relaxed text-cyan-100/70">
                        Líderes en distribución de alimentos y productos de consumo masivo para el sector HORECA y minoristas.
                    </p>
                    <div class="flex gap-4">
                        <div class="w-10 h-10 rounded-full border border-cyan-800 flex items-center justify-center text-white hover:bg-orange-500 hover:border-orange-500 transition-all cursor-pointer">
                            <span class="material-symbols-outlined text-sm">public</span>
                        </div>
                        <div class="w-10 h-10 rounded-full border border-cyan-800 flex items-center justify-center text-white hover:bg-orange-500 hover:border-orange-500 transition-all cursor-pointer">
                            <span class="material-symbols-outlined text-sm">chat</span>
                        </div>
                    </div>
                </div>
                <div class="flex flex-col gap-4">
                    <h5 class="text-orange-500 font-semibold mb-2">Compañía</h5>
                    <a class="text-cyan-100/70 hover:text-white transition-colors hover:translate-x-1 duration-300 font-manrope text-sm leading-relaxed" href="#">About Us</a>
                    <a class="text-cyan-100/70 hover:text-white transition-colors hover:translate-x-1 duration-300 font-manrope text-sm leading-relaxed" href="#">Distribution Network</a>
                    <a class="text-cyan-100/70 hover:text-white transition-colors hover:translate-x-1 duration-300 font-manrope text-sm leading-relaxed" href="#">Quality Control</a>
                </div>
                <div class="flex flex-col gap-4">
                    <h5 class="text-orange-500 font-semibold mb-2">Ayuda</h5>
                    <a class="text-cyan-100/70 hover:text-white transition-colors hover:translate-x-1 duration-300 font-manrope text-sm leading-relaxed" href="#">Contact Support</a>
                    <a class="text-cyan-100/70 hover:text-white transition-colors hover:translate-x-1 duration-300 font-manrope text-sm leading-relaxed" href="#">Terms of Service</a>
                    <a class="text-cyan-100/70 hover:text-white transition-colors hover:translate-x-1 duration-300 font-manrope text-sm leading-relaxed" href="#">Shipping Policy</a>
                </div>
                <div class="flex flex-col gap-4">
                    <h5 class="text-orange-500 font-semibold mb-2">Newsletter</h5>
                    <p class="text-cyan-100/70 font-manrope text-sm leading-relaxed mb-2">Suscríbete para recibir ofertas exclusivas.</p>
                    <div class="flex flex-col gap-3">
                        <input class="bg-cyan-900/50 border-none rounded-lg px-4 py-2 text-white text-sm focus:ring-2 focus:ring-orange-500 transition-all" placeholder="tu@email.com" type="email" />
                        <button class="bg-orange-500 text-white font-bold py-2 rounded-lg hover:bg-orange-600 transition-all">Newsletter Sign-up</button>
                    </div>
                </div>
            </div>
            <div class="px-12 py-8 max-w-screen-2xl mx-auto border-t border-cyan-900/50 flex flex-col md:flex-row justify-between items-center gap-4">
                <span class="font-manrope text-sm leading-relaxed text-cyan-100/70">© 2024 Keppler Food Distribution. All rights reserved.</span>
                <div class="flex gap-8">
                    <a class="text-cyan-100/30 hover:text-white text-xs uppercase tracking-widest transition-colors" href="#">Privacidad</a>
                    <a class="text-cyan-100/30 hover:text-white text-xs uppercase tracking-widest transition-colors" href="#">Cookies</a>
                </div>
            </div>
        </footer>
    </form>
</body>
</html>
