<%@ Page Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true"
    CodeBehind="Historial.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.Historial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Historial de Compras — Keppler</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet" />
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: "#000080",
                        secondary: "#000033",
                    },
                    fontFamily: {
                        display: ["Manrope", "sans-serif"],
                        sans: ["Manrope", "sans-serif"],
                    },
                },
            },
        };
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <!-- Encabezado -->
        <header class="flex justify-between items-start mb-8">
            <div>
                <h2 class="text-3xl font-extrabold text-slate-900">Historial de Compras</h2>
                <p class="text-slate-500 mt-1">Resumen completo de tu actividad de compra</p>
            </div>
            <a href="CatalogoProductos.aspx"
               class="px-5 py-2.5 bg-primary text-white font-semibold rounded-xl hover:opacity-90 transition-opacity no-underline text-sm">
                + Nuevo Pedido
            </a>
        </header>

        <!-- Tarjetas de resumen -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm">
                <div class="flex justify-between items-start mb-4">
                    <span class="text-[11px] font-bold text-slate-400 uppercase tracking-wider">Total Pedidos</span>
                    <div class="p-2 bg-blue-50 rounded-lg">
                        <span class="material-icons-outlined text-blue-500 text-xl">receipt_long</span>
                    </div>
                </div>
                <span class="text-4xl font-extrabold text-slate-900"><%= TotalPedidos %></span>
                <p class="text-xs text-slate-400 font-semibold mt-2">desde el inicio</p>
            </div>

            <div class="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm">
                <div class="flex justify-between items-start mb-4">
                    <span class="text-[11px] font-bold text-slate-400 uppercase tracking-wider">Total Gastado</span>
                    <div class="p-2 bg-indigo-50 rounded-lg">
                        <span class="material-icons-outlined text-indigo-500 text-xl">payments</span>
                    </div>
                </div>
                <span class="text-4xl font-extrabold text-slate-900">L. <%= string.Format("{0:N2}", TotalGastado) %></span>
                <p class="text-xs text-slate-400 font-semibold mt-2">acumulado histórico</p>
            </div>

            <div class="bg-white p-6 rounded-2xl border border-slate-100 shadow-sm">
                <div class="flex justify-between items-start mb-4">
                    <span class="text-[11px] font-bold text-slate-400 uppercase tracking-wider">Promedio por Pedido</span>
                    <div class="p-2 bg-emerald-50 rounded-lg">
                        <span class="material-icons-outlined text-emerald-500 text-xl">analytics</span>
                    </div>
                </div>
                <span class="text-4xl font-extrabold text-slate-900">L. <%= string.Format("{0:N2}", PromedioPedido) %></span>
                <p class="text-xs text-slate-400 font-semibold mt-2">valor promedio</p>
            </div>
        </div>

        <!-- Botones de filtro -->
        <div class="flex gap-2 mb-6 flex-wrap">
            <button onclick="filtrar(this, '')"
                class="filtro-btn px-5 py-2 rounded-full text-sm font-semibold border-2 border-primary bg-primary text-white transition-all">
                Todos
            </button>
            <button onclick="filtrar(this, 'Entregado')"
                class="filtro-btn px-5 py-2 rounded-full text-sm font-semibold border-2 border-slate-200 text-slate-600 hover:border-primary hover:text-primary transition-all">
                Entregados
            </button>
            <button onclick="filtrar(this, 'Cancelado')"
                class="filtro-btn px-5 py-2 rounded-full text-sm font-semibold border-2 border-slate-200 text-slate-600 hover:border-primary hover:text-primary transition-all">
                Cancelados
            </button>
            <button onclick="filtrar(this, 'activo')"
                class="filtro-btn px-5 py-2 rounded-full text-sm font-semibold border-2 border-slate-200 text-slate-600 hover:border-primary hover:text-primary transition-all">
                En Proceso
            </button>
        </div>

        <!-- Tabla -->
        <div class="bg-white rounded-2xl border border-slate-100 overflow-hidden shadow-sm">
            <asp:Panel ID="pnlTabla" runat="server">
                <div class="overflow-x-auto">
                    <table id="tablaHistorial" class="w-full text-left">
                        <thead class="bg-slate-50 border-y border-slate-100">
                            <tr>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">ID Pedido</th>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Fecha</th>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Dirección de Entrega</th>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Total</th>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Estado</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                            <asp:Repeater ID="rptHistorial" runat="server" OnItemDataBound="rptHistorial_ItemDataBound">
                                <ItemTemplate>
                                    <tr class="hover:bg-slate-50/50 transition-colors" data-estado='<%# Eval("Estado") %>'>
                                        <td class="px-6 py-4 font-bold text-slate-900">
                                            <asp:Literal ID="litCodigo" runat="server" />
                                        </td>
                                        <td class="px-6 py-4 text-slate-500 text-sm">
                                            <asp:Literal ID="litFecha" runat="server" />
                                        </td>
                                        <td class="px-6 py-4 text-slate-500 text-sm max-w-xs">
                                            <asp:Literal ID="litDireccion" runat="server" />
                                        </td>
                                        <td class="px-6 py-4 font-bold text-slate-900">
                                            <asp:Literal ID="litTotal" runat="server" />
                                        </td>
                                        <td class="px-6 py-4">
                                            <asp:Literal ID="litEstado" runat="server" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlSinHistorial" runat="server" Visible="false">
                <div class="py-20 flex flex-col items-center text-slate-400">
                    <span class="material-icons-outlined text-5xl mb-3">history</span>
                    <p class="font-semibold text-lg">Sin historial de pedidos</p>
                    <p class="text-sm mt-1">Cuando realices pedidos aparecerán aquí</p>
                    <a href="CatalogoProductos.aspx"
                       class="mt-6 px-6 py-2.5 bg-primary text-white rounded-xl font-semibold text-sm hover:opacity-90 transition-opacity no-underline">
                        Ver catálogo
                    </a>
                </div>
            </asp:Panel>
        </div>
    </div>

    <script>
        var ACTIVOS = ['Pendiente', 'En Proceso', 'En Camino'];

        function filtrar(btn, filtro) {
            document.querySelectorAll('.filtro-btn').forEach(function (b) {
                b.classList.remove('bg-primary', 'text-white', 'border-primary');
                b.classList.add('border-slate-200', 'text-slate-600');
            });
            btn.classList.add('bg-primary', 'text-white', 'border-primary');
            btn.classList.remove('border-slate-200', 'text-slate-600');

            document.querySelectorAll('#tablaHistorial tbody tr').forEach(function (tr) {
                var estado = tr.dataset.estado;
                var mostrar = false;
                if (!filtro) {
                    mostrar = true;
                } else if (filtro === 'activo') {
                    mostrar = ACTIVOS.indexOf(estado) !== -1;
                } else {
                    mostrar = estado === filtro;
                }
                tr.style.display = mostrar ? '' : 'none';
            });
        }
    </script>
</asp:Content>
