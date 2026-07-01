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
        <header class="relative overflow-hidden rounded-3xl bg-gradient-to-r from-primary to-secondary p-8 shadow-xl shadow-primary/10">
            <div class="absolute -top-10 -right-10 w-56 h-56 rounded-full bg-white/5"></div>
            <div class="absolute -bottom-16 right-24 w-40 h-40 rounded-full bg-white/5"></div>
            <div class="relative flex flex-col md:flex-row md:justify-between md:items-center gap-6">
                <div class="flex items-center gap-4">
                    <div class="w-14 h-14 rounded-2xl bg-white/10 border border-white/20 flex items-center justify-center text-white text-xl font-extrabold flex-shrink-0">
                        <%= ObtenerInicialCliente() %>
                    </div>
                    <div>
                        <h2 class="text-2xl md:text-3xl font-extrabold text-white">¡Bienvenido de nuevo, <%= DistribuidoraKeppler.Utilidades.SesionHelper.Cliente != null ? DistribuidoraKeppler.Utilidades.SesionHelper.Cliente.NombreEmpresa : "Cliente" %>!</h2>
                        <p class="text-white/70 mt-1">Aquí tienes el resumen de tu cuenta para hoy, <%= DateTime.Now.ToString("d 'de' MMMM", new System.Globalization.CultureInfo("es-ES")) %>.</p>
                    </div>
                </div>
                <div class="flex gap-3">
                    <button type="button" onclick="solicitarPreventista()" class="px-5 py-2.5 bg-white text-primary font-bold rounded-xl hover:bg-slate-100 hover:shadow-lg transition-all flex items-center gap-2 whitespace-nowrap">
                        <span class="material-icons-outlined text-lg">support_agent</span>
                        Solicitar Preventista
                    </button>
                </div>
            </div>
        </header>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div class="bg-white p-6 rounded-2xl border border-slate-100 border-t-4 border-t-blue-400 shadow-sm hover:shadow-lg hover:-translate-y-0.5 transition-all">
                <div class="flex justify-between items-start mb-4">
                    <span class="text-[11px] font-bold text-slate-400 uppercase tracking-wider">Pedidos del Mes</span>
                    <div class="p-2.5 bg-blue-50 rounded-xl">
                        <span class="material-icons-outlined text-blue-500 text-xl">shopping_cart</span>
                    </div>
                </div>
                <div class="flex flex-col">
                    <span id="statPedidosMes" class="text-4xl font-extrabold mb-1 text-slate-900">—</span>
                    <span class="text-slate-400 text-xs font-semibold">Realizados este mes</span>
                </div>
            </div>
            <div class="bg-white p-6 rounded-2xl border border-slate-100 border-t-4 border-t-indigo-400 shadow-sm hover:shadow-lg hover:-translate-y-0.5 transition-all">
                <div class="flex justify-between items-start mb-4">
                    <span class="text-[11px] font-bold text-slate-400 uppercase tracking-wider">Total Invertido</span>
                    <div class="p-2.5 bg-indigo-50 rounded-xl">
                        <span class="material-icons-outlined text-indigo-500 text-xl">payments</span>
                    </div>
                </div>
                <div class="flex flex-col">
                    <span id="statTotalInvertido" class="text-4xl font-extrabold mb-1 text-slate-900">—</span>
                    <span class="text-slate-400 text-xs font-semibold">Acumulado histórico</span>
                </div>
            </div>
            <div class="bg-white p-6 rounded-2xl border border-slate-100 border-t-4 border-t-amber-400 shadow-sm hover:shadow-lg hover:-translate-y-0.5 transition-all">
                <div class="flex justify-between items-start mb-4">
                    <span class="text-[11px] font-bold text-slate-400 uppercase tracking-wider">En Proceso</span>
                    <div class="p-2.5 bg-amber-50 rounded-xl">
                        <span class="material-icons-outlined text-amber-500 text-xl">event_note</span>
                    </div>
                </div>
                <div class="flex flex-col">
                    <span id="statEnProceso" class="text-4xl font-extrabold mb-1 text-slate-900">—</span>
                    <span class="text-slate-400 text-xs font-semibold">Pedidos activos ahora</span>
                </div>
            </div>
        </div>

        <div>
            <h3 class="flex items-center gap-2 text-lg font-bold text-slate-900 mb-5">
                <span class="p-1.5 bg-blue-50 rounded-lg flex items-center justify-center">
                    <span class="material-icons-outlined text-blue-600 text-xl">bolt</span>
                </span>
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
                <div class="p-6 flex justify-between items-center border-b border-slate-100">
                    <h3 class="text-lg font-bold text-slate-900 flex items-center gap-2">
                        <span class="material-icons-outlined text-primary text-xl">receipt_long</span>
                        Últimos Pedidos
                    </h3>
                    <a class="text-primary font-bold text-sm hover:underline flex items-center gap-1" href="MisPedidos.aspx">
                        Ver todos
                        <span class="material-icons-outlined text-base">arrow_forward</span>
                    </a>
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
                        <tbody id="tablaUltimosPedidos" class="divide-y divide-slate-50">
                            <tr>
                                <td class="px-6 py-8 text-slate-400 text-sm text-center" colspan="5">
                                    <span class="material-icons-outlined text-2xl align-middle animate-spin mr-2 text-slate-300">autorenew</span>
                                    Cargando pedidos...
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <aside class="space-y-6">
                <div class="relative overflow-hidden bg-gradient-to-br from-secondary to-primary rounded-[24px] p-6 text-white shadow-xl">
                    <div class="absolute -top-8 -right-8 w-32 h-32 rounded-full bg-white/5"></div>
                    <h4 class="relative text-sm font-bold opacity-80 mb-6 flex items-center gap-2">
                        <span class="material-icons-outlined text-lg">account_balance_wallet</span>
                        Estado de Cuenta
                    </h4>
                    <div class="relative mb-6">
                        <p class="text-[10px] uppercase font-bold tracking-widest opacity-60 mb-1">Total Pendiente por Pagar</p>
                        <div class="flex flex-col">
                            <span id="statTotalPendiente" class="text-4xl font-extrabold">L. —</span>
                        </div>
                    </div>
                    <div class="relative space-y-2 mb-6">
                        <div class="h-2 w-full bg-blue-900/50 rounded-full overflow-hidden">
                            <div id="barraEntregados" class="h-full bg-white transition-all duration-500" style="width: 0%"></div>
                        </div>
                        <p id="textoEntregados" class="text-[10px] opacity-60">Cargando historial de pedidos...</p>
                    </div>
                    <div class="relative bg-blue-900/40 rounded-2xl p-4 mb-6">
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
                    <a href="MisPedidos.aspx" class="relative block text-center w-full bg-white text-secondary font-extrabold py-4 rounded-2xl hover:bg-slate-100 transition-colors uppercase tracking-widest text-sm shadow-lg no-underline">
                        Ver Mis Pedidos
                    </a>
                </div>
            </aside>
        </div>
    </div>

    <script>
        function solicitarPreventista() {
            Swal.fire({
                icon: 'success',
                title: 'Solicitud enviada',
                text: 'Un preventista se pondrá en contacto contigo pronto.',
                confirmButtonText: 'Entendido'
            });
        }

        const coloresEstadoDashboard = {
            'Confirmado':  'bg-blue-100 text-blue-700',
            'Empaquetado': 'bg-indigo-100 text-indigo-700',
            'En Camino':   'bg-purple-100 text-purple-700',
            'Entregado':   'bg-emerald-100 text-emerald-700',
            'Cancelado':   'bg-rose-100 text-rose-700',
            'Devuelto':    'bg-orange-100 text-orange-700',
        };

        function obtenerClaseEstadoDashboard(estado) {
            return coloresEstadoDashboard[estado] || 'bg-slate-100 text-slate-600';
        }

        function renderizarUltimosPedidos(pedidos) {
            const tbody = document.getElementById('tablaUltimosPedidos');

            if (!pedidos || pedidos.length === 0) {
                tbody.innerHTML = `
                    <tr>
                        <td class="px-6 py-10 text-center" colspan="5">
                            <span class="material-icons-outlined text-4xl text-slate-200 block mb-2">shopping_cart</span>
                            <p class="text-slate-400 text-sm font-medium">Aún no tienes pedidos registrados.</p>
                        </td>
                    </tr>`;
                return;
            }

            tbody.innerHTML = pedidos.map(p => `
                <tr class="hover:bg-slate-50/50 transition-colors">
                    <td class="px-6 py-4 font-bold text-slate-800">${p.codigoPedido}</td>
                    <td class="px-6 py-4 text-slate-500">${p.fecha}</td>
                    <td class="px-6 py-4 font-bold">L. ${p.total}</td>
                    <td class="px-6 py-4">
                        <span class="px-3 py-1 ${obtenerClaseEstadoDashboard(p.estado)} text-[10px] font-bold rounded-full uppercase">${p.estado}</span>
                    </td>
                    <td class="px-6 py-4">
                        <a href="MisPedidos.aspx" class="text-primary font-bold text-sm hover:underline">Detalles</a>
                    </td>
                </tr>
            `).join('');
        }

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

                renderizarUltimosPedidos(datos.ultimosPedidos);
            })
            .catch(() => {});
        }

        document.addEventListener('DOMContentLoaded', cargarResumenDashboard);
    </script>
</asp:Content>
