<%@ Page Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Kepler Distribution Dashboard</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet" />
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        primary: "#000080",
                        secondary: "#000033",
                        "background-light": "#f8fafc",
                        "background-dark": "#0f172a",
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
        .custom-scrollbar::-webkit-scrollbar {
            width: 4px;
        }

        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: #e2e8f0;
            border-radius: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" class="bg-background-light dark:bg-background-dark text-slate-800 dark:text-slate-200 min-h-screen flex" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 p-8 overflow-y-auto custom-scrollbar">
        <header class="flex justify-between items-start mb-8">
            <div>
                <h2 class="text-3xl font-extrabold text-slate-900 dark:text-white">¡Bienvenido de nuevo, Carlos!</h2>
                <p class="text-slate-500 dark:text-slate-400 mt-1">Aquí tienes el resumen de tu cuenta para hoy, 24 de Mayo.</p>
            </div>
            <div class="flex gap-3">
                <button class="px-5 py-2.5 bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-700 dark:text-slate-200 font-semibold rounded-xl hover:bg-slate-50 transition-colors">
                    Soporte Técnico
                </button>
                <button class="px-5 py-2.5 bg-primary text-white font-semibold rounded-xl hover:opacity-90 transition-opacity">
                    Solicitar Preventista
                </button>
            </div>
        </header>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
            <div class="bg-white dark:bg-slate-800 p-6 rounded-2xl border border-slate-100 dark:border-slate-700 shadow-sm">
                <div class="flex justify-between items-start mb-4">
                    <span class="text-[11px] font-bold text-slate-400 uppercase tracking-wider">Pedidos del Mes</span>
                    <div class="p-2 bg-blue-50 dark:bg-blue-900/30 rounded-lg">
                        <span class="material-icons-outlined text-blue-500 text-xl">shopping_cart</span>
                    </div>
                </div>
                <div class="flex flex-col">
                    <span class="text-4xl font-extrabold mb-1">2</span>
                    <span class="text-emerald-500 text-xs font-bold flex items-center">
                        <span class="material-icons-outlined text-sm mr-1">trending_up</span>
                        +15% vs mes anterior
                    </span>
                </div>
            </div>
            <div class="bg-white dark:bg-slate-800 p-6 rounded-2xl border border-slate-100 dark:border-slate-700 shadow-sm">
                <div class="flex justify-between items-start mb-4">
                    <span class="text-[11px] font-bold text-slate-400 uppercase tracking-wider">Total Invertido</span>
                    <div class="p-2 bg-indigo-50 dark:bg-indigo-900/30 rounded-lg">
                        <span class="material-icons-outlined text-indigo-500 text-xl">payments</span>
                    </div>
                </div>
                <div class="flex flex-col">
                    <span class="text-4xl font-extrabold mb-1">L. 45,200.00</span>
                    <span class="text-rose-500 text-xs font-bold flex items-center">
                        <span class="material-icons-outlined text-sm mr-1">trending_down</span>
                        -5% vs mes anterior
                    </span>
                </div>
            </div>
            <div class="bg-white dark:bg-slate-800 p-6 rounded-2xl border border-slate-100 dark:border-slate-700 shadow-sm">
                <div class="flex justify-between items-start mb-4">
                    <span class="text-[11px] font-bold text-slate-400 uppercase tracking-wider">En Proceso</span>
                    <div class="p-2 bg-amber-50 dark:bg-amber-900/30 rounded-lg">
                        <span class="material-icons-outlined text-amber-500 text-xl">event_note</span>
                    </div>
                </div>
                <div class="flex flex-col">
                    <span class="text-4xl font-extrabold mb-1">2</span>
                    <span class="text-slate-400 text-xs font-bold flex items-center">
                        <span class="material-icons-outlined text-sm mr-1">remove</span>
                        Sin cambios
                    </span>
                </div>
            </div>
        </div>
        <h3 class="flex items-center gap-2 text-lg font-bold mb-5">
            <span class="material-icons-outlined text-blue-600">bolt</span>
            Accesos Rápidos
        </h3>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
            <button class="bg-primary hover:bg-secondary text-white p-8 rounded-2xl flex flex-col items-center justify-center gap-3 transition-all group border-0">
                <span class="material-icons-outlined text-4xl group-hover:scale-110 transition-transform">add_shopping_cart</span>
                <span class="text-lg font-bold">Realizar pedido</span>
            </button>
            <button class="bg-white dark:bg-slate-800 border-2 border-slate-100 dark:border-slate-700 p-8 rounded-2xl flex flex-col items-center justify-center gap-3 hover:border-primary dark:hover:border-primary transition-all group">
                <span class="material-icons-outlined text-4xl text-primary group-hover:scale-110 transition-transform">grid_view</span>
                <span class="text-lg font-bold">Ver catálogo</span>
            </button>
            <button class="bg-white dark:bg-slate-800 border-2 border-slate-100 dark:border-slate-700 p-8 rounded-2xl flex flex-col items-center justify-center gap-3 hover:border-primary dark:hover:border-primary transition-all group">
                <span class="material-icons-outlined text-4xl text-primary group-hover:scale-110 transition-transform">history</span>
                <span class="text-lg font-bold">Ver historial</span>
            </button>
        </div>
        <div class="bg-white dark:bg-slate-800 rounded-2xl border border-slate-100 dark:border-slate-700 overflow-hidden">
            <div class="p-6 flex justify-between items-center">
                <h3 class="text-lg font-bold">Últimos Pedidos</h3>
                <a class="text-primary font-bold text-sm hover:underline" href="#">Ver todos</a>
            </div>
            <div class="overflow-x-auto">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 dark:bg-slate-900/50 border-y border-slate-100 dark:border-slate-700">
                        <tr>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase">ID Pedido</th>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase">Fecha</th>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase">Total</th>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase">Estado</th>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase">Acción</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-50 dark:divide-slate-700">
                        <tr class="hover:bg-slate-50/50 dark:hover:bg-slate-700/30 transition-colors">
                            <td class="px-6 py-4 font-bold">#KEP-9802</td>
                            <td class="px-6 py-4 text-slate-500 dark:text-slate-400">22 Mayo, 2024</td>
                            <td class="px-6 py-4 font-bold">L. 12,450.00</td>
                            <td class="px-6 py-4">
                                <span class="px-3 py-1 bg-amber-100 text-amber-700 dark:bg-amber-900/40 dark:text-amber-300 text-[10px] font-bold rounded-full uppercase">Pendiente</span>
                            </td>
                            <td class="px-6 py-4">
                                <button class="text-primary font-bold text-sm hover:underline">Detalles</button>
                            </td>
                        </tr>
                        <tr class="hover:bg-slate-50/50 dark:hover:bg-slate-700/30 transition-colors">
                            <td class="px-6 py-4 font-bold">#KEP-9745</td>
                            <td class="px-6 py-4 text-slate-500 dark:text-slate-400">18 Mayo, 2024</td>
                            <td class="px-6 py-4 font-bold">L. 8,900.00</td>
                            <td class="px-6 py-4">
                                <span class="px-3 py-1 bg-blue-100 text-blue-700 dark:bg-blue-900/40 dark:text-blue-300 text-[10px] font-bold rounded-full uppercase">En Camino</span>
                            </td>
                            <td class="px-6 py-4">
                                <button class="text-primary font-bold text-sm hover:underline">Detalles</button>
                            </td>
                        </tr>
                        <tr class="hover:bg-slate-50/50 dark:hover:bg-slate-700/30 transition-colors">
                            <td class="px-6 py-4 font-bold">#KEP-9688</td>
                            <td class="px-6 py-4 text-slate-500 dark:text-slate-400">15 Mayo, 2024</td>
                            <td class="px-6 py-4 font-bold">L. 23,850.00</td>
                            <td class="px-6 py-4">
                                <span class="px-3 py-1 bg-emerald-100 text-emerald-700 dark:bg-emerald-900/40 dark:text-emerald-300 text-[10px] font-bold rounded-full uppercase">Entregado</span>
                            </td>
                            <td class="px-6 py-4">
                                <button class="text-primary font-bold text-sm hover:underline">Detalles</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    <aside class="w-80 flex-shrink-0 p-8 space-y-6">
        <div class="bg-secondary rounded-[24px] p-6 text-white shadow-xl">
            <h4 class="text-sm font-bold opacity-80 mb-6">Estado de Cuenta</h4>
            <div class="mb-6">
                <p class="text-[10px] uppercase font-bold tracking-widest opacity-60 mb-1">Crédito Disponible</p>
                <div class="flex flex-col">
                    <span class="text-4xl font-extrabold">L. 150,000</span>
                    <span class="text-2xl font-bold opacity-80 mt-[-4px]">.00</span>
                </div>
            </div>
            <div class="space-y-2 mb-6">
                <div class="h-2 w-full bg-blue-900/50 rounded-full overflow-hidden">
                    <div class="h-full bg-white w-[30%]"></div>
                </div>
                <p class="text-[10px] opacity-60">Has utilizado el 30% de tu límite (L. 200,000.00)</p>
            </div>
            <div class="bg-blue-900/40 rounded-2xl p-4 mb-6">
                <div class="flex gap-3">
                    <div class="p-2 bg-amber-500 rounded-lg h-fit">
                        <span class="material-icons-outlined text-white text-lg">calendar_today</span>
                    </div>
                    <div>
                        <p class="text-[10px] uppercase font-bold opacity-60">Próximo Vencimiento</p>
                        <p class="text-lg font-bold">05 de Junio</p>
                        <p class="text-[10px] opacity-60 mt-1">Monto a pagar: L. 18,250.00</p>
                    </div>
                </div>
            </div>
            <button class="w-full bg-white text-secondary font-extrabold py-4 rounded-2xl hover:bg-slate-100 transition-colors uppercase tracking-widest text-sm shadow-lg">
                Pagar Ahora
            </button>
        </div>
        <div class="bg-white dark:bg-slate-800 rounded-2xl p-6 border border-slate-100 dark:border-slate-700">
            <h4 class="text-sm font-bold text-slate-900 dark:text-white mb-4">Asesor Asignado</h4>
            <div class="flex items-center gap-3 mb-6">
                <div class="w-12 h-12 bg-slate-100 dark:bg-slate-700 rounded-full flex items-center justify-center">
                    <span class="material-icons-outlined text-slate-400">person</span>
                </div>
                <div>
                    <p class="font-bold text-slate-900 dark:text-white">Samuel Rincon</p>
                    <p class="text-[10px] text-slate-400 font-medium uppercase">Ejecutivo de Cuenta</p>
                </div>
            </div>
            <div class="space-y-3">
                <div class="flex items-center gap-3 text-slate-500 dark:text-slate-400">
                    <span class="material-icons-outlined text-lg">mail</span>
                    <span class="text-xs font-semibold">s.rincon@kepler.com</span>
                </div>
                <div class="flex items-center gap-3 text-slate-500 dark:text-slate-400">
                    <span class="material-icons-outlined text-lg">phone</span>
                    <span class="text-xs font-semibold">+57 3125789746</span>
                </div>
            </div>
        </div>
    </aside>
    <script>
        // Dark mode toggle could be implemented here
        // For now, it respects system preferences or the 'light' class on html
    </script>
</asp:Content>
