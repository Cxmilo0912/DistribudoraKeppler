<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarProducto.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.EditarProducto" %>

<!DOCTYPE html>

<html class="light" lang="es">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&amp;display=swap"
        rel="stylesheet" />
    <link
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
        rel="stylesheet" />
    <link
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
        rel="stylesheet" />
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "on-primary-container": "#7889e7",
                        "on-surface-variant": "#454652",
                        "on-secondary-fixed-variant": "#404754",
                        "primary": "#000c46",
                        "outline-variant": "#c5c5d4",
                        "inverse-on-surface": "#eaf1ff",
                        "on-secondary-container": "#5c6370",
                        "on-error": "#ffffff",
                        "background": "#f8f9ff",
                        "surface": "#f8f9ff",
                        "secondary-fixed": "#dce3f2",
                        "secondary-container": "#d9e0f0",
                        "error": "#ba1a1a",
                        "on-error-container": "#93000a",
                        "on-background": "#0b1c30",
                        "primary-container": "#001b79",
                        "inverse-primary": "#bac3ff",
                        "primary-fixed": "#dee1ff",
                        "surface-container": "#e5eeff",
                        "tertiary-fixed": "#ffdad4",
                        "surface-bright": "#f8f9ff",
                        "surface-variant": "#d3e4fe",
                        "on-tertiary-fixed-variant": "#80291b",
                        "error-container": "#ffdad6",
                        "surface-container-lowest": "#ffffff",
                        "secondary-fixed-dim": "#bfc7d6",
                        "on-primary-fixed": "#001159",
                        "outline": "#757683",
                        "tertiary": "#320200",
                        "on-primary-fixed-variant": "#2b3e97",
                        "on-surface": "#0b1c30",
                        "surface-tint": "#4557b1",
                        "surface-container-high": "#dce9ff",
                        "secondary": "#575f6c",
                        "on-tertiary": "#ffffff",
                        "on-secondary-fixed": "#151c27",
                        "on-secondary": "#ffffff",
                        "tertiary-fixed-dim": "#ffb4a6",
                        "on-tertiary-fixed": "#3f0300",
                        "tertiary-container": "#560902",
                        "on-primary": "#ffffff",
                        "surface-container-low": "#eff4ff",
                        "surface-container-highest": "#d3e4fe",
                        "on-tertiary-container": "#df6f5b",
                        "primary-fixed-dim": "#bac3ff",
                        "inverse-surface": "#213145",
                        "surface-dim": "#cbdbf5"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "full": "9999px"
                    },
                    "spacing": {
                        "container-margin": "24px",
                        "xs": "8px",
                        "base": "4px",
                        "sm": "12px",
                        "md": "16px",
                        "lg": "24px",
                        "xl": "32px",
                        "gutter": "20px"
                    },
                    "fontFamily": {
                        "h1": ["Inter"],
                        "body-md": ["Inter"],
                        "label-md": ["Inter"],
                        "label-caps": ["Inter"],
                        "h3": ["Inter"],
                        "h2": ["Inter"],
                        "body-sm": ["Inter"]
                    },
                    "fontSize": {
                        "h1": ["28px", { "lineHeight": "36px", "letterSpacing": "-0.02em", "fontWeight": "700" }],
                        "body-md": ["14px", { "lineHeight": "20px", "fontWeight": "400" }],
                        "label-md": ["14px", { "lineHeight": "20px", "fontWeight": "500" }],
                        "label-caps": ["12px", { "lineHeight": "16px", "letterSpacing": "0.05em", "fontWeight": "600" }],
                        "h3": ["16px", { "lineHeight": "24px", "fontWeight": "600" }],
                        "h2": ["20px", { "lineHeight": "28px", "letterSpacing": "-0.01em", "fontWeight": "600" }],
                        "body-sm": ["13px", { "lineHeight": "18px", "fontWeight": "400" }]
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
                   
        } 
/* END EXTERNAL SOURC
    </style>
</head>

<body class="bg-background text-on-background min-h-screen">
    <!-- Main Content -->
    <main class="ml-64 pt-24 pb-12 px-8 min-h-screen">
        <div class="max-w-6xl mx-auto">
            <!-- Page Header -->
            <div class="flex flex-col md:flex-row md:items-center justify-between mb-8 gap-4">
                <div>
                    <div class="flex items-center gap-2 text-slate-400 mb-2">
                        <span class="text-xs font-medium">Gestión de Productos</span>
                        <span class="material-symbols-outlined text-[14px]"
                            data-icon="chevron_right">chevron_right</span>
                        <span class="text-xs font-medium text-[#001B79]">Editar Producto</span>
                    </div>
                    <h2 class="font-h1 text-h1 text-on-background">Editar Producto</h2>
                    <p class="font-body-md text-body-md text-slate-500 mt-1">
                        Actualice los campos para modificar el artículo en el catálogo oficial.
                    </p>
                </div>
                <div class="flex items-center gap-3">
                    <button
                        class="px-6 py-2.5 rounded-lg border border-slate-200 bg-white text-[#001B79] font-semibold text-sm hover:bg-slate-50 transition-colors">
                        Cancelar
                    </button>
                    <button
                        class="px-6 py-2.5 rounded-lg bg-[#001B79] text-white font-semibold text-sm shadow-md hover:bg-[#000c46] transition-all active:scale-95">
                        Guardar Cambios
                    </button>
                </div>
            </div>
            <!-- Form Layout -->
            <div class="grid grid-cols-12 gap-8">
                <!-- Left Column -->
                <div class="col-span-12 lg:col-span-8 space-y-8">
                    <!-- Información General Card -->
                    <div class="bg-white rounded-2xl shadow-[0px_4px_12px_rgba(0,0,0,0.05)] overflow-hidden">
                        <div class="p-6 border-b border-slate-100 flex items-center gap-3">
                            <div
                                class="w-8 h-8 rounded-full bg-secondary-container flex items-center justify-center text-[#001B79]">
                                <span class="material-symbols-outlined text-[18px]" data-icon="info">info</span>
                            </div>
                            <h3 class="font-h3 text-h3">Información General</h3>
                        </div>
                        <div class="p-6 space-y-6">
                            <div class="space-y-1.5">
                                <label class="text-label-md font-label-md text-slate-500">Nombre del Producto</label>
                                <input
                                    class="w-full bg-white border border-slate-200 rounded-lg px-4 py-3 text-body-md focus:border-[#001B79] focus:ring-2 focus:ring-[#001B79]/10 outline-none transition-all"
                                    type="text" value="Coca Cola Sin Azúcar 500ml" />
                            </div>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div class="space-y-1.5">
                                    <label class="text-label-md font-label-md text-slate-500">Marca</label>
                                    <input
                                        class="w-full bg-white border border-slate-200 rounded-lg px-4 py-3 text-body-md focus:border-[#001B79] focus:ring-2 focus:ring-[#001B79]/10 outline-none transition-all"
                                        type="text" value="Coca Cola" />
                                </div>
                                <div class="space-y-1.5">
                                    <label class="text-label-md font-label-md text-slate-500">Categoría</label>
                                    <select
                                        class="w-full bg-white border border-slate-200 rounded-lg px-4 py-3 text-body-md focus:border-[#001B79] focus:ring-2 focus:ring-[#001B79]/10 outline-none transition-all appearance-none cursor-pointer">
                                        <option selected="">Refrescos</option>
                                        <option>Jugos</option>
                                        <option>Aguas</option>
                                        <option>Energéticas</option>
                                    </select>
                                </div>
                            </div>
                            <div class="space-y-1.5">
                                <label class="text-label-md font-label-md text-slate-500">Descripción detallada</label>
                                <textarea
                                    class="w-full bg-white border border-slate-200 rounded-lg px-4 py-3 text-body-md focus:border-[#001B79] focus:ring-2 focus:ring-[#001B79]/10 outline-none transition-all resize-none"
                                    rows="4">Refresco carbonatado sabor original sin azúcar. Contenido neto 500ml. Botella de plástico 100% reciclable.</textarea>
                            </div>
                        </div>
                    </div>
                    <!-- Inventario y Precios Card -->
                    <div class="bg-white rounded-2xl shadow-[0px_4px_12px_rgba(0,0,0,0.05)] overflow-hidden">
                        <div class="p-6 border-b border-slate-100 flex items-center gap-3">
                            <div
                                class="w-8 h-8 rounded-full bg-secondary-container flex items-center justify-center text-[#001B79]">
                                <span class="material-symbols-outlined text-[18px]" data-icon="payments">payments</span>
                            </div>
                            <h3 class="font-h3 text-h3">Inventario y Precios</h3>
                        </div>
                        <div class="p-6">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6">
                                <div class="space-y-1.5">
                                    <label class="text-label-md font-label-md text-slate-500">
                                        Precio de Venta
                                        ($)</label>
                                    <div class="relative">
                                        <span class="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400">$</span>
                                        <input
                                            class="w-full bg-white border border-slate-200 rounded-lg pl-8 pr-4 py-3 text-body-md font-semibold text-[#001B79] focus:border-[#001B79] focus:ring-2 focus:ring-[#001B79]/10 outline-none transition-all"
                                            type="text" value="1.50" />
                                    </div>
                                </div>
                                <div class="space-y-1.5">
                                    <label class="text-label-md font-label-md text-slate-500">Costo Unitario</label>
                                    <div class="relative">
                                        <span class="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400">$</span>
                                        <input
                                            class="w-full bg-white border border-slate-200 rounded-lg pl-8 pr-4 py-3 text-body-md focus:border-[#001B79] focus:ring-2 focus:ring-[#001B79]/10 outline-none transition-all"
                                            type="text" value="0.85" />
                                    </div>
                                </div>
                                <div class="space-y-1.5">
                                    <label class="text-label-md font-label-md text-slate-500">Stock Actual</label>
                                    <div class="flex items-center gap-3">
                                        <input
                                            class="w-full bg-white border border-slate-200 rounded-lg px-4 py-3 text-body-md focus:border-[#001B79] focus:ring-2 focus:ring-[#001B79]/10 outline-none transition-all"
                                            type="number" value="124" />
                                        <span
                                            class="bg-emerald-100 text-emerald-700 px-3 py-1 rounded-full text-[10px] font-bold uppercase whitespace-nowrap">En
                                            Stock</span>
                                    </div>
                                </div>
                                <div class="space-y-1.5">
                                    <label class="text-label-md font-label-md text-slate-500">
                                        SKU / Código
                                        Interno</label>
                                    <input
                                        class="w-full bg-slate-50 border border-slate-200 rounded-lg px-4 py-3 text-body-md text-slate-600 font-mono focus:ring-2 focus:ring-[#001B79]/10 outline-none transition-all"
                                        type="text" value="BEB-CC-SIN-500" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Right Column -->
                <div class="col-span-12 lg:col-span-4 space-y-8">
                    <!-- Media Card -->
                    <div class="bg-white rounded-2xl shadow-[0px_4px_12px_rgba(0,0,0,0.05)] overflow-hidden">
                        <div class="p-6 border-b border-slate-100 flex items-center gap-3">
                            <div
                                class="w-8 h-8 rounded-full bg-secondary-container flex items-center justify-center text-[#001B79]">
                                <span class="material-symbols-outlined text-[18px]" data-icon="image">image</span>
                            </div>
                            <h3 class="font-h3 text-h3">Media</h3>
                        </div>
                        <div class="p-6 space-y-6">
                            <div
                                class="aspect-square w-full rounded-xl border-2 border-dashed border-slate-200 bg-slate-50 flex flex-col items-center justify-center p-4 text-center group cursor-pointer hover:bg-slate-100 transition-colors">
                                <img alt="Current product" class="w-full h-48 object-contain mb-4"
                                    data-alt="Commercial studio photo of a Coca Cola 500ml plastic bottle on a white background with crisp reflections"
                                    src="https://lh3.googleusercontent.com/aida-public/AB6AXuBWblJ-quKv6zkHT7UjWKKrNSdo5DpaLSEyAM1qjqTBZkKwDz9I7govLHOtvQNRuqxBpsscj0KdPnJh0sH5_kfy8WcDpbR3OWjTlR_lznZZMNTCvgaEmLdxMQuqOa6bWZQQkBzvA2oacx2-nPy9SnYU1ItdkVOCvwKjIRTcbaF-_aWzZDiZ_7I-HbhvMz6jHUbMI7d8XPCaCkVrHtPaETxtRW0j9KwngphEBkTzvRekllmGUpSHAKjrz791uPvZ2ZGvTw4jm2pXjss" />
                                <span class="material-symbols-outlined text-slate-400 text-3xl mb-2"
                                    data-icon="cloud_upload">cloud_upload</span>
                                <p class="text-sm font-semibold text-[#001B79]">Haga clic para cambiar imagen</p>
                                <p class="text-[11px] text-slate-500 mt-1">Soporta: JPG, PNG, WEBP (Max 2MB)</p>
                            </div>
                            <div class="space-y-3">
                                <p class="text-label-md font-label-md text-slate-500">Archivos actuales</p>
                                <div
                                    class="flex items-center justify-between p-3 bg-slate-50 rounded-lg border border-slate-200">
                                    <div class="flex items-center gap-3">
                                        <div
                                            class="w-10 h-10 bg-white rounded border border-slate-100 flex items-center justify-center overflow-hidden">
                                            <img alt="Thumbnail" class="w-full h-full object-cover"
                                                data-alt="Small thumbnail of a beverage bottle on plain background"
                                                src="https://lh3.googleusercontent.com/aida-public/AB6AXuBd5KglOWMjrSzaBSukB56Z0GZA1f4y2kZYP-S9JV9fXGJB-uNcGjsk5oGpkgfOQbACjprknbTkkI3ucYhQIbpImNOXsLYWHABXXujVgX-OumrcnfZcx7cKbAPsdNw4I232wmJrHVDL_ZdE22Ejj2oBMhJlb62dZy1V36tH4PPayFgHGjaAt48Se7PEXc27rOy7xxA2h-v-rgw8i_KYEqHVUW5rn0iyyD3nGvG3PKAz9ghxNdYXmMXwenTGKC-tP7k8kfO1LJ4f520" />
                                        </div>
                                        <div class="overflow-hidden">
                                            <p class="text-xs font-semibold text-on-background truncate">
                                                coca_cola_500ml.jpg
                                            </p>
                                            <p class="text-[10px] text-slate-400 uppercase">Principal • 425 KB</p>
                                        </div>
                                    </div>
                                    <button
                                        class="text-error hover:bg-error-container p-1.5 rounded-md transition-colors">
                                        <span class="material-symbols-outlined text-[18px]"
                                            data-icon="delete">delete</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </main>
</body>

</html>
 