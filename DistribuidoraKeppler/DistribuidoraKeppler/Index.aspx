<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="DistribuidoraKeppler.Index" %>

<!DOCTYPE html>

<html class="dark" lang="es">
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
    <title>Distribuidora Keppler</title>
</head>
<body class="bg-background text-on-background font-body selection:bg-primary selection:text-on-primary">
    <div id="app">
        <canvas id="canvas"></canvas>
        <div class="hero">
            <!-- TopNavBar -->
            <nav class="bg-[#1a1c1c] fixed top-0 left-0 right-0 z-50 flex justify-between items-center w-full px-4 md:px-8 py-4">
                <div class="hidden md:flex items-center gap-8">
                    <span class="text-lg md:text-xl font-black tracking-tighter text-[#5ddda1] uppercase font-headline">Distribuidora - Keppler</span>
                </div>
            </nav>
            <!-- Main Content Canvas -->
            <main class="pt-20">
                <!-- Hero Carousel Section -->
                <section class="relative min-h-screen w-full overflow-hidden flex items-center">
                    <div class="w-full pl-6 sm:pl-10 lg:pl-20 pr-4 h-full">
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
                                <a href="#" class="flex items-center justify-between px-4 py-3 md:px-6 md:py-5 text-base md:text-lg">
                                    <span class="font-label font-bold text-lg uppercase tracking-tight">Registrarse</span>
                                    <span class="material-symbols-outlined">account_box
                                    </span>
                                </a>

                                <a href="Vista/Auth/Login.aspx" class="flex items-center justify-between px-4 py-3 md:px-6 md:py-5 text-base md:text-lg"><span class="font-label font-bold text-lg uppercase tracking-tight">Iniciar Sesión</span>
                                    <span class="material-symbols-outlined">login
                                    </span>
                                </a>

                            </div>
                        </div>
                    </div>
                    <!-- Bottom Data Ticker (Kinetic Element) -->

                </section>
            </main>
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
    </div>
</body>
<script src="Vista/Assets/js/Index.js" type="module"></script>

</html>
