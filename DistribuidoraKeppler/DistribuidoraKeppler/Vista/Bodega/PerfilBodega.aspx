<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="PerfilBodega.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Bodega.PerfilBodega" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Perfil de Usuario - María Díaz Rodríguez</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet" />
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        primary: "#2563eb",
                        "background-light": "#f8f9ff",
                        "background-dark": "#0f172a",
                        "navy-sidebar": "#0d1b3e",
                        "banner-blue": "#204291",
                    },
                    fontFamily: {
                        display: ["Manrope", "sans-serif"],
                        sans: ["Manrope", "sans-serif"],
                    },
                    borderRadius: {
                        DEFAULT: "12px",
                    },
                },
            },
        };
    </script>
    <style>
        body {
            font-family: 'Manrope', sans-serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body class="bg-background-light dark:bg-background-dark text-slate-900 dark:text-slate-100 min-h-screen flex">
        <aside class="w-64 bg-navy-sidebar text-white flex flex-col h-screen sticky top-0 shrink-0">
            <div class="p-6 flex items-center space-x-3">
                <div class="w-10 h-10 bg-primary rounded-lg flex items-center justify-center font-bold text-xl">K</div>
                <div>
                    <div class="font-bold text-sm">Kepler</div>
                    <div class="text-[10px] text-slate-400 uppercase tracking-wider">Distribuidor</div>
                </div>
            </div>
            <div class="mx-4 p-3 bg-white/10 rounded-xl flex items-center space-x-3 mb-8">
                <img alt="User Avatar" class="w-10 h-10 rounded-full border-2 border-white/20" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCLeSlmhQ-6Z1dSvwpkqSGXtUi1ksE-SSJcaeixXJ5A-XD5pq6DQvLd9X4wv0uazr86KEcgcoEL8gDvX27nbvNoKYkrSRhD5zIIIWBvsgoQr01P3NuqzNBKIZklSkGdkgTg9TEFsBU2d_LENxCySLnzi2omVM3Jd6-b-yRFraIGneB5RrgfHFrJ_MyOLb3w0hwJuacx_-qJRWrEoWYaLysdLRETXVsRb4uqZVKO3ENkigKSyg6nU6nem6x4Ctd_pj_-OXcLU8VXJ28" />
                <div>
                    <div class="font-semibold text-sm">María Díaz</div>
                    <div class="text-[10px] text-slate-400">Distribuidor Senior</div>
                </div>
            </div>
            <nav class="flex-1 px-4 space-y-1">
                <a class="flex items-center space-x-3 p-3 rounded-lg hover:bg-white/5 transition-colors text-slate-400" href="#">
                    <span class="material-icons-outlined text-xl">grid_view</span>
                    <span class="text-sm font-medium">Dashboard</span>
                </a>
                <a class="flex items-center space-x-3 p-3 rounded-lg hover:bg-white/5 transition-colors text-slate-400" href="#">
                    <span class="material-icons-outlined text-xl">shopping_basket</span>
                    <span class="text-sm font-medium">Pedidos</span>
                </a>
                <a class="flex items-center space-x-3 p-3 rounded-lg hover:bg-white/5 transition-colors text-slate-400" href="#">
                    <span class="material-icons-outlined text-xl">local_shipping</span>
                    <span class="text-sm font-medium">Repartidores</span>
                </a>
                <a class="flex items-center space-x-3 p-3 rounded-lg hover:bg-white/5 transition-colors text-slate-400" href="#">
                    <span class="material-icons-outlined text-xl">schedule</span>
                    <span class="text-sm font-medium">Horario</span>
                </a>
                <a class="flex items-center space-x-3 p-3 rounded-lg hover:bg-white/5 transition-colors text-slate-400" href="#">
                    <span class="material-icons-outlined text-xl">history</span>
                    <span class="text-sm font-medium">Historial</span>
                </a>
                <a class="flex items-center space-x-3 p-3 rounded-lg hover:bg-white/5 transition-colors text-slate-400" href="#">
                    <span class="material-icons-outlined text-xl">bar_chart</span>
                    <span class="text-sm font-medium">Reportes</span>
                </a>
                <a class="flex items-center space-x-3 p-3 rounded-lg hover:bg-white/5 transition-colors text-slate-400" href="#">
                    <span class="material-icons-outlined text-xl">chat_bubble_outline</span>
                    <span class="text-sm font-medium">Observaciones</span>
                </a>
            </nav>
            <div class="p-4">
                <div class="bg-primary/20 p-4 rounded-xl border border-primary/30">
                    <div class="text-[10px] text-primary font-bold uppercase tracking-widest mb-1">Estado del sistema</div>
                    <div class="flex items-center space-x-2">
                        <div class="w-2 h-2 bg-green-400 rounded-full animate-pulse"></div>
                        <span class="text-xs font-medium">Operativo</span>
                    </div>
                </div>
            </div>
        </aside>
        <main class="flex-1 flex flex-col min-w-0">
            <header class="h-16 bg-white dark:bg-slate-900 border-b border-slate-200 dark:border-slate-800 flex items-center justify-between px-8">
                <div class="flex items-center space-x-2 text-sm">
                    <span class="text-slate-400">Inicio</span>
                    <span class="material-icons-outlined text-sm text-slate-300">chevron_right</span>
                    <span class="text-slate-900 dark:text-slate-100 font-medium">Mi perfil</span>
                </div>
                <div class="flex items-center space-x-6">
                    <button class="relative text-slate-500 hover:text-slate-700 dark:hover:text-slate-300">
                        <span class="material-icons-outlined">notifications</span>
                        <span class="absolute top-0 right-0 w-2 h-2 bg-red-500 rounded-full border-2 border-white dark:border-slate-900"></span>
                    </button>
                    <div class="h-8 w-px bg-slate-200 dark:bg-slate-700"></div>
                    <div class="flex items-center space-x-3">
                        <span class="text-sm font-medium text-slate-700 dark:text-slate-300">María Díaz Rodríguez</span>
                        <img alt="Profile" class="w-9 h-9 rounded-full bg-slate-200" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDWqbLT26GrN2Xg61oqnBjQsD0KTWLVsZRyyO9L_tBgpIueH_RTFCSSnsSWqhmixra8DQxJuAIIW-jDIAciLOo_MJpBbpJX16lViaD5UjefQRhppo5DThNUR_4tfhtUNHiUloocQdWxb3YZHmaqE0BzEoSzcGTpzUerZUe6ClhAW5ZE1zEcNl84UHACT4hftxPRzFpANQPtP26C2Mq_kDCxTFJGakTkSZ67GtFyz1sPIC7BkMDYgeZPQn_pqR-f1dTxFuqeOawmL34" />
                    </div>
                </div>
            </header>
            <div class="p-8 space-y-6 max-w-7xl mx-auto w-full">
                <div class="relative rounded-2xl overflow-hidden shadow-sm">
                    <div class="h-32 bg-banner-blue"></div>
                    <div class="bg-slate-800 dark:bg-slate-800 p-8 flex items-end justify-between -mt-1">
                        <div class="flex items-center space-x-6 -mt-20">
                            <div class="relative">
                                <img alt="Large Avatar" class="w-32 h-32 rounded-full border-4 border-white shadow-lg bg-white" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDVCEAn-Cei4sNyw5n6oBRMfLJweFoGl93P9Y1LvgxRN44syzYGENXXa-B2BRE0zjer4rg1lWtBMia902BLkWtEi4932f6p9NOqpRpxQIe0YbcizhU82hIieTybIjMF44AZ-_bAFJUReF8rn4_Y-0kaIVa1w5SOaRyei-kixJyW4y8neZmQ5Ms3xc4VRa6r91rDc1CBs_98biSPtpfXXwDFwsSDVeZV69nFtCIY8AKJT8TqcLK22WwoZig2TezXgR9CIMokJUqiWhU" />
                            </div>
                            <div class="pb-2">
                                <h1 class="text-2xl font-bold text-white mb-1">María Díaz Rodríguez</h1>
                                <p class="text-slate-300 text-sm mb-4">Distribuidora Senior • ID: KPL-9842</p>
                                <div class="flex space-x-2">
                                    <span class="px-3 py-1 bg-green-500/20 text-green-400 text-xs font-semibold rounded-full border border-green-500/30">Activa</span>
                                    <span class="px-3 py-1 bg-primary/20 text-primary text-xs font-semibold rounded-full border border-primary/30">Zona Norte</span>
                                    <span class="px-3 py-1 bg-slate-700 text-slate-300 text-xs font-semibold rounded-full border border-slate-600">Desde feb 2023</span>
                                </div>
                            </div>
                        </div>
                        <div class="flex space-x-3 pb-2">
                            <button class="px-5 py-2.5 bg-primary text-white text-sm font-semibold rounded-lg hover:bg-blue-700 transition-colors">Editar perfil</button>
                            <button class="px-5 py-2.5 bg-transparent border border-white/20 text-white text-sm font-semibold rounded-lg hover:bg-white/10 transition-colors">Seguridad</button>
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                    <div class="lg:col-span-2 bg-white dark:bg-slate-900 p-8 rounded-2xl shadow-sm border border-slate-100 dark:border-slate-800">
                        <div class="flex items-center justify-between mb-8">
                            <h2 class="text-lg font-bold text-slate-800 dark:text-white">Información personal</h2>
                            <span class="material-icons-outlined text-slate-400 cursor-pointer">info</span>
                        </div>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div class="space-y-2">
                                <label class="text-xs font-bold text-slate-400 uppercase tracking-wider">Nombre Completo</label>
                                <input class="w-full bg-slate-50 dark:bg-slate-800 border-none rounded-xl p-4 text-slate-700 dark:text-slate-300 focus:ring-2 focus:ring-primary/20" type="text" value="María Díaz Rodríguez" />
                            </div>
                            <div class="space-y-2">
                                <label class="text-xs font-bold text-slate-400 uppercase tracking-wider">Teléfono Móvil</label>
                                <input class="w-full bg-slate-50 dark:bg-slate-800 border-none rounded-xl p-4 text-slate-700 dark:text-slate-300 focus:ring-2 focus:ring-primary/20" type="text" value="+57 300 456 7890" />
                            </div>
                            <div class="space-y-2">
                                <label class="text-xs font-bold text-slate-400 uppercase tracking-wider">Correo Electrónico</label>
                                <input class="w-full bg-slate-50 dark:bg-slate-800 border-none rounded-xl p-4 text-slate-700 dark:text-slate-300 focus:ring-2 focus:ring-primary/20" type="email" value="maria.diaz@keplerdist.com" />
                            </div>
                            <div class="space-y-2">
                                <label class="text-xs font-bold text-slate-400 uppercase tracking-wider">Ciudad</label>
                                <div class="relative">
                                    <select class="w-full bg-slate-50 dark:bg-slate-800 border-none rounded-xl p-4 text-slate-700 dark:text-slate-300 focus:ring-2 focus:ring-primary/20 appearance-none">
                                        <option>Sogamoso</option>
                                        <option>Bogotá</option>
                                        <option>Medellín</option>
                                    </select>
                                    <span class="material-icons-outlined absolute right-4 top-1/2 -translate-y-1/2 text-slate-400 pointer-events-none">expand_more</span>
                                </div>
                            </div>
                            <div class="space-y-2 md:col-span-2">
                                <label class="text-xs font-bold text-slate-400 uppercase tracking-wider">Dirección de Residencia</label>
                                <input class="w-full bg-slate-50 dark:bg-slate-800 border-none rounded-xl p-4 text-slate-700 dark:text-slate-300 focus:ring-2 focus:ring-primary/20" type="text" value="Calle 127 #45-20, Apto 502" />
                            </div>
                        </div>
                    </div>
                    <div class="bg-white dark:bg-slate-900 p-8 rounded-2xl shadow-sm border border-slate-100 dark:border-slate-800">
                        <h2 class="text-lg font-bold text-slate-800 dark:text-white mb-8">Información laboral</h2>
                        <div class="space-y-6">
                            <div>
                                <div class="text-[11px] text-slate-400 font-bold uppercase mb-1">Tipo de Contrato</div>
                                <div class="text-sm font-semibold text-slate-800 dark:text-slate-200">Prestación de servicios</div>
                            </div>
                            <div class="pt-4 border-t border-slate-50 dark:border-slate-800">
                                <div class="text-[11px] text-slate-400 font-bold uppercase mb-1">Supervisor</div>
                                <div class="text-sm font-semibold text-slate-800 dark:text-slate-200">Carlos Méndez</div>
                            </div>
                            <div class="pt-4 border-t border-slate-50 dark:border-slate-800">
                                <div class="text-[11px] text-slate-400 font-bold uppercase mb-1">Fecha de Ingreso</div>
                                <div class="text-sm font-semibold text-slate-800 dark:text-slate-200">12 Feb 2023</div>
                            </div>
                            <div class="pt-4 border-t border-slate-50 dark:border-slate-800">
                                <div class="text-[11px] text-slate-400 font-bold uppercase mb-1">Vehículo asignado</div>
                                <div class="text-sm font-semibold text-slate-800 dark:text-slate-200">Chevrolet NHR - KPL982</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                    <div class="lg:col-span-2 bg-white dark:bg-slate-900 p-8 rounded-2xl shadow-sm border border-slate-100 dark:border-slate-800">
                        <h2 class="text-lg font-bold text-slate-800 dark:text-white mb-8">Seguridad y Acceso</h2>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                            <div class="space-y-2">
                                <label class="text-xs font-bold text-slate-400 uppercase tracking-wider">Nueva Contraseña</label>
                                <input class="w-full bg-slate-50 dark:bg-slate-800 border-none rounded-xl p-4 text-slate-700 dark:text-slate-300 focus:ring-2 focus:ring-primary/20" type="password" value="********" />
                            </div>
                            <div class="space-y-2">
                                <label class="text-xs font-bold text-slate-400 uppercase tracking-wider">Confirmar Contraseña</label>
                                <input class="w-full bg-slate-50 dark:bg-slate-800 border-none rounded-xl p-4 text-slate-700 dark:text-slate-300 focus:ring-2 focus:ring-primary/20" type="password" value="********" />
                            </div>
                        </div>
                        <div class="flex justify-end">
                            <button class="bg-[#0d1b3e] text-white px-8 py-3 rounded-xl font-bold text-sm hover:bg-slate-900 transition-colors shadow-lg">Actualizar Contraseña</button>
                        </div>
                    </div>
                    <div class="bg-white dark:bg-slate-900 p-8 rounded-2xl shadow-sm border border-slate-100 dark:border-slate-800">
                        <h2 class="text-lg font-bold text-slate-800 dark:text-white mb-8">Actividad reciente</h2>
                        <div class="relative space-y-8 pb-4">
                            <div class="absolute left-[7px] top-2 bottom-2 w-[2px] bg-slate-100 dark:bg-slate-800"></div>
                            <div class="relative pl-8">
                                <div class="absolute left-0 top-1.5 w-4 h-4 bg-primary rounded-full border-4 border-blue-100 dark:border-blue-900/50"></div>
                                <div class="text-[11px] text-slate-400 font-bold mb-1">Hoy, 10:30 AM</div>
                                <div class="text-sm font-medium text-slate-700 dark:text-slate-300">Sesión iniciada desde Sogamoso</div>
                            </div>
                            <div class="relative pl-8">
                                <div class="absolute left-0 top-1.5 w-4 h-4 bg-slate-300 dark:bg-slate-600 rounded-full border-4 border-slate-50 dark:border-slate-800"></div>
                                <div class="text-[11px] text-slate-400 font-bold mb-1">Ayer, 04:15 PM</div>
                                <div class="text-sm font-medium text-slate-700 dark:text-slate-300">Cambio de foto de perfil exitoso</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bg-red-50 dark:bg-red-950/20 border border-red-100 dark:border-red-900/30 p-6 rounded-2xl flex items-center justify-between">
                    <div>
                        <h3 class="text-red-600 dark:text-red-400 font-bold mb-1">Cerrar Sesión</h3>
                        <p class="text-red-500/80 dark:text-red-400/60 text-sm">Al salir, deberás ingresar tus credenciales nuevamente para acceder.</p>
                    </div>
                    <button class="bg-[#e53935] hover:bg-[#d32f2f] text-white px-8 py-3 rounded-xl font-bold text-sm shadow-md transition-all active:scale-95">
                        Cerrar Sesión
                    </button>
                </div>
                <footer class="text-center py-8 text-slate-400 text-xs">
                    © 2024 Kepler Distributor Web Portal. Todos los derechos reservados.
                </footer>
            </div>
        </main>

    </body>
</asp:Content>
