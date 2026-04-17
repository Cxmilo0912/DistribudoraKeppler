<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="Repartidor.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Distribuidor.Repartidor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&amp;family=Inter:wght@400;500;600&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "on-primary-container": "#fffbff",
                        "on-secondary": "#ffffff",
                        "on-error-container": "#93000a",
                        "surface-variant": "#e4e1ed",
                        "background": "#fcf8ff",
                        "secondary": "#575992",
                        "on-primary-fixed-variant": "#2f2ebe",
                        "on-tertiary-fixed": "#301400",
                        "tertiary-fixed": "#ffdcc5",
                        "surface-container-highest": "#e4e1ed",
                        "surface-container-high": "#e9e6f3",
                        "surface-container-lowest": "#ffffff",
                        "error-container": "#ffdad6",
                        "on-error": "#ffffff",
                        "primary-fixed-dim": "#c0c1ff",
                        "tertiary-fixed-dim": "#ffb783",
                        "surface-container": "#efecf8",
                        "on-surface-variant": "#464554",
                        "surface-tint": "#494bd6",
                        "surface-dim": "#dbd8e4",
                        "on-tertiary": "#ffffff",
                        "surface-bright": "#fcf8ff",
                        "surface-container-low": "#f5f2fe",
                        "primary-fixed": "#e1e0ff",
                        "inverse-surface": "#303038",
                        "outline": "#767586",
                        "on-secondary-fixed": "#13144a",
                        "on-background": "#1b1b23",
                        "on-tertiary-fixed-variant": "#703700",
                        "on-tertiary-container": "#fffbff",
                        "tertiary-container": "#b55d00",
                        "on-secondary-container": "#494b83",
                        "on-primary-fixed": "#07006c",
                        "error": "#ba1a1a",
                        "secondary-fixed": "#e1e0ff",
                        "on-secondary-fixed-variant": "#404178",
                        "secondary-fixed-dim": "#c0c1ff",
                        "on-surface": "#1b1b23",
                        "tertiary": "#904900",
                        "primary-container": "#6063ee",
                        "inverse-on-surface": "#f2effb",
                        "secondary-container": "#bdbefe",
                        "primary": "#4648d4",
                        "surface": "#fcf8ff",
                        "inverse-primary": "#c0c1ff",
                        "on-primary": "#ffffff",
                        "outline-variant": "#c7c4d7"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "full": "9999px"
                    },
                    "fontFamily": {
                        "headline": ["Manrope"],
                        "body": ["Inter"],
                        "label": ["Inter"]
                    }
                },
            },
        }
    </script>
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        body {
            font-family: 'Inter', sans-serif;
            -webkit-tap-highlight-color: transparent;
        }

        h1, h2, h3 {
            font-family: 'Manrope', sans-serif;
        }
    </style>
    <style>
        body {
            min-height: max(884px, 100dvh);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex justify-between items-center px-6 py-4 w-full max-w-7xl mx-auto">
        <div class="flex items-center gap-4">
            <div class="w-10 h-10 rounded-full bg-primary-fixed-dim flex items-center justify-center overflow-hidden">
                <img alt="Santiago Chaparro" class="w-full h-full object-cover" data-alt="Professional headshot of a friendly smiling man with short dark hair in a bright office setting, high-end photography style" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBYOVlWg6iMOb-KkEcTqVYSBlDkTRjZLE0QnjzNeoO8_9n7RBJ5iJuvchiB-ShDI3MBRfoezURaf8ufJWQC6FoKwGw_eh8EuFyxTesa52Z8I_HLtahuliSkrXeksZVFs2h4HegrzWae5yAu2cuoG1pwSKiSrXhSoWs1CYQ29zEvDIdcL-H_y1zGlURAZ3HJ608WyMRrQPIVnxTLgG7iHTN68tcKOWG4ydv_A4Sg92QJI73rHfKHA1P9IWCyB4U8ptSM3PGiId8JPj0" />
            </div>
            <div>
                <h1 class="text-2xl font-black text-indigo-700 dark:text-indigo-300 tracking-tighter">KEPLER</h1>
                <p class="text-[11px] font-bold text-slate-500 uppercase tracking-widest leading-none">Bienvenido, Santiago Chaparro</p>
            </div>
        </div>
        <button class="p-2 text-indigo-600 dark:text-indigo-400 hover:bg-indigo-50 dark:hover:bg-indigo-900/20 transition-colors active:scale-95">
            <span class="material-symbols-outlined" data-icon="notifications">notifications</span>
        </button>
    </div>
    </header>
    <main class="max-w-7xl mx-auto px-6 pt-6 space-y-8">
        <!-- Notification Banner -->
        <section class="relative overflow-hidden">
            <div class="bg-surface-container-lowest p-5 rounded-xl border-l-4 border-primary flex items-center gap-4 shadow-sm">
                <div class="flex-shrink-0 w-10 h-10 rounded-full bg-primary/10 flex items-center justify-center text-primary">
                    <span class="material-symbols-outlined" data-icon="event_repeat">event_repeat</span>
                </div>
                <div>
                    <p class="text-on-surface font-semibold text-sm">Tu horario del lunes fue actualizado</p>
                    <p class="text-on-surface-variant text-xs mt-0.5">Revisa los cambios en la sección de Horario.</p>
                </div>
            </div>
        </section>
        <!-- Actions Grid (Bento Style) -->
        <section>
            <div class="grid grid-cols-2 gap-4">
                <!-- Mis pedidos -->
                <div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm hover:bg-indigo-50/50 transition-colors cursor-pointer relative group">
                    <div class="absolute top-4 right-4 bg-primary text-on-primary text-[10px] font-bold px-2 py-0.5 rounded-full">
                        24
                    </div>
                    <div class="w-12 h-12 bg-surface-container-high rounded-lg flex items-center justify-center text-primary mb-4 group-hover:scale-110 transition-transform">
                        <span class="material-symbols-outlined" data-icon="inventory_2">inventory_2</span>
                    </div>
                    <p class="font-bold text-on-surface text-sm">Mis pedidos</p>
                </div>
                <!-- Horario -->
                <div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm hover:bg-indigo-50/50 transition-colors cursor-pointer group">
                    <div class="w-12 h-12 bg-surface-container-high rounded-lg flex items-center justify-center text-primary mb-4 group-hover:scale-110 transition-transform">
                        <span class="material-symbols-outlined" data-icon="calendar_today">calendar_today</span>
                    </div>
                    <p class="font-bold text-on-surface text-sm">Horario</p>
                </div>
                <!-- Observaciones -->
                <div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm hover:bg-indigo-50/50 transition-colors cursor-pointer group">
                    <div class="w-12 h-12 bg-surface-container-high rounded-lg flex items-center justify-center text-primary mb-4 group-hover:scale-110 transition-transform">
                        <span class="material-symbols-outlined" data-icon="rate_review">rate_review</span>
                    </div>
                    <p class="font-bold text-on-surface text-sm">Observaciones</p>
                </div>
                <!-- Documentos -->
                <div class="bg-surface-container-lowest p-6 rounded-xl shadow-sm hover:bg-indigo-50/50 transition-colors cursor-pointer relative group">
                    <div class="absolute top-4 right-4 text-tertiary">
                        <span class="material-symbols-outlined text-lg" data-icon="priority_high">priority_high</span>
                    </div>
                    <div class="w-12 h-12 bg-surface-container-high rounded-lg flex items-center justify-center text-primary mb-4 group-hover:scale-110 transition-transform">
                        <span class="material-symbols-outlined" data-icon="description">description</span>
                    </div>
                    <p class="font-bold text-on-surface text-sm">Documentos</p>
                </div>
            </div>
        </section>
        <!-- Summary Section (Editorial Style) -->
        <section class="space-y-4">
            <div class="flex justify-between items-end">
                <h2 class="text-[11px] font-extrabold text-slate-400 uppercase tracking-[0.2em]">RESUMEN DE HOY</h2>
                <p class="text-xs font-semibold text-primary">Ver detalle</p>
            </div>
            <div class="bg-surface-container-low rounded-[1.5rem] p-2">
                <div class="bg-surface-container-lowest rounded-[1rem] overflow-hidden shadow-sm">
                    <!-- Total -->
                    <div class="flex items-center justify-between p-5 border-b border-surface-container">
                        <div class="flex items-center gap-3">
                            <div class="w-2 h-2 rounded-full bg-primary"></div>
                            <span class="text-sm font-semibold text-on-surface">Total</span>
                        </div>
                        <span class="text-sm font-bold text-primary">8 Pedidos</span>
                    </div>
                    <!-- Entregados -->
                    <div class="flex items-center justify-between p-5 border-b border-surface-container">
                        <div class="flex items-center gap-3">
                            <div class="w-2 h-2 rounded-full bg-emerald-500"></div>
                            <span class="text-sm font-semibold text-on-surface">Entregados</span>
                        </div>
                        <span class="text-sm font-bold text-emerald-600">5 Entregados</span>
                    </div>
                    <!-- Pendientes -->
                    <div class="flex items-center justify-between p-5">
                        <div class="flex items-center gap-3">
                            <div class="w-2 h-2 rounded-full bg-orange-500"></div>
                            <span class="text-sm font-semibold text-on-surface">Pendientes</span>
                        </div>
                        <span class="text-sm font-bold text-orange-600">3 Pendientes</span>
                    </div>
                </div>
            </div>
        </section>
        <!-- Performance Graph Mock (Extra Editorial Element) -->
        <section class="bg-primary-container p-6 rounded-[2rem] text-on-primary-container relative overflow-hidden shadow-xl">
            <div class="relative z-10">
                <h3 class="font-headline text-lg font-bold mb-1">Rendimiento Semanal</h3>
                <p class="text-xs opacity-80 mb-6">Estás un 12% arriba respecto a la semana pasada</p>
                <div class="flex items-end justify-between h-20 gap-2">
                    <div class="w-full bg-on-primary-container/20 rounded-t-lg h-[40%]"></div>
                    <div class="w-full bg-on-primary-container/20 rounded-t-lg h-[65%]"></div>
                    <div class="w-full bg-on-primary-container/20 rounded-t-lg h-[50%]"></div>
                    <div class="w-full bg-on-primary-container/20 rounded-t-lg h-[85%]"></div>
                    <div class="w-full bg-on-primary-container rounded-t-lg h-[100%]"></div>
                    <div class="w-full bg-on-primary-container/20 rounded-t-lg h-[60%]"></div>
                    <div class="w-full bg-on-primary-container/20 rounded-t-lg h-[45%]"></div>
                </div>
            </div>
            <!-- Decorative background gradient texture -->
            <div class="absolute top-0 right-0 w-32 h-32 bg-white/10 rounded-full -mr-16 -mt-16 blur-3xl"></div>
            <div class="absolute bottom-0 left-0 w-32 h-32 bg-black/10 rounded-full -ml-16 -mb-16 blur-3xl"></div>
        </section>
    </main>
    <!-- BottomNavBar -->
    <nav class="fixed bottom-0 w-full z-50 rounded-t-[2rem] bg-white/90 dark:bg-slate-900/90 backdrop-blur-2xl shadow-[0_-8px_30px_rgb(0,0,0,0.04)]">
        <div class="flex justify-around items-center w-full px-4 pt-3 pb-8">
            <!-- Inicio (Active) -->
            <a class="flex flex-col items-center justify-center bg-indigo-100 dark:bg-indigo-900/40 text-indigo-700 dark:text-indigo-200 rounded-2xl px-5 py-2 tap-highlight-none active:scale-90 transition-all duration-200" href="#">
                <span class="material-symbols-outlined" data-icon="home" style="font-variation-settings: 'FILL' 1;">home</span>
                <span class="font-['Inter'] text-[11px] font-bold uppercase tracking-wider mt-1">Inicio</span>
            </a>
            <!-- Pedidos -->
            <a class="flex flex-col items-center justify-center text-slate-400 dark:text-slate-500 px-5 py-2 hover:text-indigo-500 transition-all tap-highlight-none active:scale-90 duration-200" href="#">
                <span class="material-symbols-outlined" data-icon="inventory_2">inventory_2</span>
                <span class="font-['Inter'] text-[11px] font-semibold uppercase tracking-wider mt-1">Pedidos</span>
            </a>
            <!-- Documentos -->
            <a class="flex flex-col items-center justify-center text-slate-400 dark:text-slate-500 px-5 py-2 hover:text-indigo-500 transition-all tap-highlight-none active:scale-90 duration-200" href="#">
                <span class="material-symbols-outlined" data-icon="description">description</span>
                <span class="font-['Inter'] text-[11px] font-semibold uppercase tracking-wider mt-1">Documentos</span>
            </a>
            <!-- Perfil -->
            <a class="flex flex-col items-center justify-center text-slate-400 dark:text-slate-500 px-5 py-2 hover:text-indigo-500 transition-all tap-highlight-none active:scale-90 duration-200" href="#">
                <span class="material-symbols-outlined" data-icon="person">person</span>
                <span class="font-['Inter'] text-[11px] font-semibold uppercase tracking-wider mt-1">Perfil</span>
            </a>
        </div>
    </nav>
</asp:Content>
