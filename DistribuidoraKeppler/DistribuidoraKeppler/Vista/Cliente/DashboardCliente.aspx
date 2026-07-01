<%@ Page Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="DashboardCliente.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.DashboardCliente" %>

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

        .kp-quick-btn {
            box-shadow: 0 1px 2px rgba(15, 23, 42, 0.04);
        }

        .kp-quick-btn:hover {
            box-shadow: 0 12px 24px -8px rgba(0, 0, 128, 0.25);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="space-y-10">
        <header class="flex flex-col md:flex-row md:justify-between md:items-start gap-4">
            <div>
                <h2 class="text-3xl font-extrabold text-slate-900">¡Bienvenido de nuevo, <%= DistribuidoraKeppler.Utilidades.SesionHelper.Cliente != null ? DistribuidoraKeppler.Utilidades.SesionHelper.Cliente.NombreEmpresa : "Cliente" %>!</h2>
                <p class="text-slate-500 mt-1">Aquí tienes el resumen de tu cuenta para hoy, 24 de Mayo.</p>
            </div>
            <div class="flex gap-3">
                <button class="px-5 py-2.5 bg-primary text-white font-semibold rounded-xl hover:opacity-90 hover:shadow-lg hover:shadow-primary/20 transition-all">
                    Solicitar Preventista
                </button>
            </div>
        </header>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md transition-shadow">
                <div class="flex justify-between items-start mb-4">
                    <span class="text-[11px] font-bold text-slate-400 uppercase tracking-wider">Pedidos del Mes</span>
                    <div class="p-2 bg-blue-50 rounded-lg">
                        <span class="material-icons-outlined text-blue-500 text-xl">shopping_cart</span>
                    </div>
                </div>
                <div class="flex flex-col">
                    <span id="statPedidosMes" class="text-4xl font-extrabold mb-1">—</span>
                    <span class="text-emerald-500 text-xs font-bold flex items-center">
                        <span class="material-icons-outlined text-sm mr-1">trending_up</span>
                        +15% vs mes anterior
                    </span>
                </div>
            </div>
            <div class="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md transition-shadow">
                <div class="flex justify-between items-start mb-4">
                    <span class="text-[11px] font-bold text-slate-400 uppercase tracking-wider">Total Invertido</span>
                    <div class="p-2 bg-indigo-50 rounded-lg">
                        <span class="material-icons-outlined text-indigo-500 text-xl">payments</span>
                    </div>
                </div>
                <div class="flex flex-col">
                    <span id="statTotalInvertido" class="text-4xl font-extrabold mb-1">—</span>
                    <span class="text-rose-500 text-xs font-bold flex items-center">
                        <span class="material-icons-outlined text-sm mr-1">trending_down</span>
                        -5% vs mes anterior
                    </span>
                </div>
            </div>
            <div class="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm hover:shadow-md transition-shadow">
                <div class="flex justify-between items-start mb-4">
                    <span class="text-[11px] font-bold text-slate-400 uppercase tracking-wider">En Proceso</span>
                    <div class="p-2 bg-amber-50 rounded-lg">
                        <span class="material-icons-outlined text-amber-500 text-xl">event_note</span>
                    </div>
                </div>
                <div class="flex flex-col">
                    <span id="statEnProceso" class="text-4xl font-extrabold mb-1">—</span>
                    <span class="text-slate-400 text-xs font-bold flex items-center">
                        <span class="material-icons-outlined text-sm mr-1">remove</span>
                        Sin cambios
                    </span>
                </div>
            </div>
        </div>

        <div>
            <h3 class="flex items-center gap-2 text-lg font-bold mb-5">
                <span class="material-icons-outlined text-blue-600">bolt</span>
                Accesos Rápidos
            </h3>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <a href="CatalogoProductos.aspx" class="kp-quick-btn bg-primary hover:bg-secondary text-white p-8 rounded-2xl flex flex-col items-center justify-center gap-3 transition-all group border-0 no-underline">
                    <span class="material-icons-outlined text-4xl group-hover:scale-110 transition-transform">add_shopping_cart</span>
                    <span class="text-lg font-bold">Realizar pedido</span>
                </a>
                <a href="CatalogoProductos.aspx" class="kp-quick-btn bg-white border-2 border-slate-100 p-8 rounded-2xl flex flex-col items-center justify-center gap-3 hover:border-primary transition-all group no-underline">
                    <span class="material-icons-outlined text-4xl text-primary group-hover:scale-110 transition-transform">grid_view</span>
                    <span class="text-lg font-bold text-slate-800">Ver catálogo</span>
                </a>
                <a href="Historial.aspx" class="kp-quick-btn bg-white border-2 border-slate-100 p-8 rounded-2xl flex flex-col items-center justify-center gap-3 hover:border-primary transition-all group no-underline">
                    <span class="material-icons-outlined text-4xl text-primary group-hover:scale-110 transition-transform">history</span>
                    <span class="text-lg font-bold text-slate-800">Ver historial</span>
                </a>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <div class="lg:col-span-2 bg-white rounded-2xl border border-slate-100 shadow-sm overflow-hidden h-fit">
                <div class="p-6 flex justify-between items-center">
                    <h3 class="text-lg font-bold">Últimos Pedidos</h3>
                    <a class="text-primary font-bold text-sm hover:underline" href="MisPedidos.aspx">Ver todos</a>
                </div>
                <div class="overflow-x-auto custom-scrollbar">
                    <table class="w-full text-left">
                        <thead class="bg-slate-50 border-y border-slate-100">
                            <tr>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase">ID Pedido</th>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase">Fecha</th>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase">Total</th>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase">Estado</th>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase">Acción</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-50">
                            <tr class="hover:bg-slate-50/50 transition-colors">
                                <td class="px-6 py-4 font-bold">#KEP-9802</td>
                                <td class="px-6 py-4 text-slate-500">22 Mayo, 2024</td>
                                <td class="px-6 py-4 font-bold">L. 12,450.00</td>
                                <td class="px-6 py-4">
                                    <span class="px-3 py-1 bg-amber-100 text-amber-700 text-[10px] font-bold rounded-full uppercase">Pendiente</span>
                                </td>
                                <td class="px-6 py-4">
                                    <a href="MisPedidos.aspx" class="text-primary font-bold text-sm hover:underline">Detalles</a>
                                </td>
                            </tr>
                            <tr class="hover:bg-slate-50/50 transition-colors">
                                <td class="px-6 py-4 font-bold">#KEP-9745</td>
                                <td class="px-6 py-4 text-slate-500">18 Mayo, 2024</td>
                                <td class="px-6 py-4 font-bold">L. 8,900.00</td>
                                <td class="px-6 py-4">
                                    <span class="px-3 py-1 bg-blue-100 text-blue-700 text-[10px] font-bold rounded-full uppercase">En Camino</span>
                                </td>
                                <td class="px-6 py-4">
                                    <a href="MisPedidos.aspx" class="text-primary font-bold text-sm hover:underline">Detalles</a>
                                </td>
                            </tr>
                            <tr class="hover:bg-slate-50/50 transition-colors">
                                <td class="px-6 py-4 font-bold">#KEP-9688</td>
                                <td class="px-6 py-4 text-slate-500">15 Mayo, 2024</td>
                                <td class="px-6 py-4 font-bold">L. 23,850.00</td>
                                <td class="px-6 py-4">
                                    <span class="px-3 py-1 bg-emerald-100 text-emerald-700 text-[10px] font-bold rounded-full uppercase">Entregado</span>
                                </td>
                                <td class="px-6 py-4">
                                    <a href="MisPedidos.aspx" class="text-primary font-bold text-sm hover:underline">Detalles</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <aside class="space-y-6">
                <div class="bg-secondary rounded-[24px] p-6 text-white shadow-xl">
                    <h4 class="text-sm font-bold opacity-80 mb-6">Estado de Cuenta</h4>
                    <div class="mb-6">
                        <p class="text-[10px] uppercase font-bold tracking-widest opacity-60 mb-1">Total Pendiente por Pagar</p>
                        <div class="flex flex-col">
                            <span id="statTotalPendiente" class="text-4xl font-extrabold">L. —</span>
                        </div>
                    </div>
                    <div class="space-y-2 mb-6">
                        <div class="h-2 w-full bg-blue-900/50 rounded-full overflow-hidden">
                            <div id="barraEntregados" class="h-full bg-white" style="width: 0%"></div>
                        </div>
                        <p id="textoEntregados" class="text-[10px] opacity-60">Cargando historial de pedidos...</p>
                    </div>
                    <div class="bg-blue-900/40 rounded-2xl p-4 mb-6">
                        <div class="flex gap-3">
                            <div class="p-2 bg-amber-500 rounded-lg h-fit">
                                <span class="material-icons-outlined text-white text-lg">calendar_today</span>
                            </div>
                            <div>
                                <p class="text-[10px] uppercase font-bold opacity-60">Último Pedido</p>
                                <p id="statUltimoPedidoCodigo" class="text-lg font-bold">Sin pedidos aún</p>
                                <p id="statUltimoPedidoInfo" class="text-[10px] opacity-60 mt-1"></p>
                            </div>
                        </div>
                    </div>
                    <a href="MisPedidos.aspx" class="block text-center w-full bg-white text-secondary font-extrabold py-4 rounded-2xl hover:bg-slate-100 transition-colors uppercase tracking-widest text-sm shadow-lg no-underline">
                        Ver Mis Pedidos
                    </a>
                </div>
                <div class="bg-white rounded-2xl p-6 border border-slate-100 shadow-sm">
                    <h4 class="text-sm font-bold text-slate-900 mb-4">Asesor Asignado</h4>
                    <div class="flex items-center gap-3 mb-6">
                        <div class="w-12 h-12 bg-slate-100 rounded-full flex items-center justify-center">
                            <span class="material-icons-outlined text-slate-400">person</span>
                        </div>
                        <div>
                            <p class="font-bold text-slate-900">Samuel Rincon</p>
                            <p class="text-[10px] text-slate-400 font-medium uppercase">Ejecutivo de Cuenta</p>
                        </div>
                    </div>
                    <div class="space-y-3">
                        <div class="flex items-center gap-3 text-slate-500">
                            <span class="material-icons-outlined text-lg">mail</span>
                            <span class="text-xs font-semibold">s.rincon@kepler.com</span>
                        </div>
                        <div class="flex items-center gap-3 text-slate-500">
                            <span class="material-icons-outlined text-lg">phone</span>
                            <span class="text-xs font-semibold">+57 3125789746</span>
                        </div>
                    </div>
                </div>
            </aside>
        </div>
    </div>

    <script>
        function cargarResumenDashboard() {
            fetch('DashboardCliente.aspx/MtCargarResumenDashboard', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({})
            })
            .then(r => r.json())
            .then(resp => {
                const datos = resp.d;
                if (!datos || !datos.success) return;

                document.getElementById('statPedidosMes').textContent = datos.pedidosDelMes;
                document.getElementById('statTotalInvertido').textContent = 'L. ' + datos.totalInvertido;
                document.getElementById('statEnProceso').textContent = datos.enProceso;

                document.getElementById('statTotalPendiente').textContent = 'L. ' + datos.totalPendiente;

                document.getElementById('barraEntregados').style.width = datos.porcentajeEntregados + '%';
                document.getElementById('textoEntregados').textContent = datos.totalPedidos > 0
                    ? `Has recibido el ${datos.porcentajeEntregados}% de tus ${datos.totalPedidos} pedido(s)`
                    : 'Aún no tienes pedidos registrados';

                if (datos.ultimoPedidoCodigo) {
                    document.getElementById('statUltimoPedidoCodigo').textContent = datos.ultimoPedidoCodigo;
                    document.getElementById('statUltimoPedidoInfo').textContent =
                        datos.ultimoPedidoFecha + ' — L. ' + datos.ultimoPedidoTotal;
                }
            })
            .catch(() => {});
        }

        document.addEventListener('DOMContentLoaded', cargarResumenDashboard);
    </script>
</asp:Content>
