<%@ Page Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true"
    CodeBehind="MisPedidos.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.MisPedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Mis Pedidos — Keppler</title>
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
        <!-- Controles ocultos para la cancelación -->
        <asp:HiddenField ID="hfPedidoId" runat="server" />
        <asp:Button ID="btnConfirmarCancelacion" runat="server"
            OnClick="btnConfirmarCancelacion_Click"
            Style="display:none" Text="x" />

        <!-- Encabezado -->
        <header class="flex justify-between items-start mb-8">
            <div>
                <h2 class="text-3xl font-extrabold text-slate-900">Mis Pedidos</h2>
                <p class="text-slate-500 mt-1">Historial completo de todos tus pedidos</p>
            </div>
            <a href="CatalogoProductos.aspx"
               class="px-5 py-2.5 bg-primary text-white font-semibold rounded-xl hover:opacity-90 transition-opacity no-underline text-sm">
                + Nuevo Pedido
            </a>
        </header>

        <!-- Mensajes de éxito / error -->
        <asp:Panel ID="pnlMensaje" runat="server" Visible="false">
            <asp:Literal ID="litMensaje" runat="server" />
        </asp:Panel>

        <!-- Botones de filtro -->
        <div class="flex gap-2 mb-6 flex-wrap">
            <button onclick="filtrar(this, '')"
                class="filtro-btn px-5 py-2 rounded-full text-sm font-semibold border-2 border-primary bg-primary text-white transition-all">
                Todos
            </button>
            <button onclick="filtrar(this, 'activo')"
                class="filtro-btn px-5 py-2 rounded-full text-sm font-semibold border-2 border-slate-200 text-slate-600 hover:border-primary hover:text-primary transition-all">
                Activos
            </button>
            <button onclick="filtrar(this, 'Entregado')"
                class="filtro-btn px-5 py-2 rounded-full text-sm font-semibold border-2 border-slate-200 text-slate-600 hover:border-primary hover:text-primary transition-all">
                Entregados
            </button>
            <button onclick="filtrar(this, 'Cancelado')"
                class="filtro-btn px-5 py-2 rounded-full text-sm font-semibold border-2 border-slate-200 text-slate-600 hover:border-primary hover:text-primary transition-all">
                Cancelados
            </button>
        </div>

        <!-- Tarjeta con la tabla -->
        <div class="bg-white rounded-2xl border border-slate-100 overflow-hidden shadow-sm">
            <asp:Panel ID="pnlTabla" runat="server">
                <div class="overflow-x-auto">
                    <table id="tablaPedidos" class="w-full text-left">
                        <thead class="bg-slate-50 border-y border-slate-100">
                            <tr>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">ID Pedido</th>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Fecha</th>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Dirección de Entrega</th>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Total</th>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Estado</th>
                                <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Acciones</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                            <asp:Repeater ID="rptPedidos" runat="server" OnItemDataBound="rptPedidos_ItemDataBound">
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
                                        <td class="px-6 py-4">
                                            <asp:Literal ID="litAcciones" runat="server" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlSinPedidos" runat="server" Visible="false">
                <div class="py-20 flex flex-col items-center text-slate-400">
                    <span class="material-icons-outlined text-5xl mb-3">inbox</span>
                    <p class="font-semibold text-lg">Aún no tienes pedidos</p>
                    <p class="text-sm mt-1">Explora el catálogo y realiza tu primer pedido</p>
                    <a href="CatalogoProductos.aspx"
                       class="mt-6 px-6 py-2.5 bg-primary text-white rounded-xl font-semibold text-sm hover:opacity-90 transition-opacity no-underline">
                        Ver catálogo
                    </a>
                </div>
            </asp:Panel>
        </div>
    </div>

    <!-- Modal de confirmación de cancelación -->
    <div id="modalCancelacion" class="hidden fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
        <div class="bg-white rounded-2xl p-8 max-w-md w-full shadow-2xl">
            <div class="flex items-center gap-3 mb-4">
                <span class="material-icons-outlined text-red-500 text-3xl">cancel</span>
                <h3 class="text-xl font-bold text-slate-900">Cancelar pedido</h3>
            </div>
            <p class="text-slate-600 mb-1">¿Estás seguro de que deseas cancelar el pedido</p>
            <p class="font-bold text-slate-900 text-lg mb-4" id="modalCodigoPedido"></p>
            <p class="text-sm text-slate-600 bg-amber-50 border border-amber-200 rounded-xl px-4 py-3">
                Esta acción no se puede deshacer. El pedido quedará marcado como <strong>Cancelado</strong>.
            </p>
            <div class="flex gap-3 mt-6">
                <button onclick="cerrarModalCancelacion()"
                    class="flex-1 px-4 py-2.5 border-2 border-slate-200 text-slate-600 font-semibold rounded-xl hover:border-slate-300 transition-colors">
                    Volver
                </button>
                <button onclick="confirmarCancelacion()"
                    class="flex-1 px-4 py-2.5 bg-red-600 text-white font-semibold rounded-xl hover:bg-red-700 transition-colors">
                    Sí, cancelar pedido
                </button>
            </div>
        </div>
    </div>

    <script>
        const ACTIVOS = ['Pendiente', 'En Proceso', 'En Camino'];

        function filtrar(btn, filtro) {
            document.querySelectorAll('.filtro-btn').forEach(function (b) {
                b.classList.remove('bg-primary', 'text-white', 'border-primary');
                b.classList.add('border-slate-200', 'text-slate-600');
            });
            btn.classList.add('bg-primary', 'text-white', 'border-primary');
            btn.classList.remove('border-slate-200', 'text-slate-600');

            document.querySelectorAll('#tablaPedidos tbody tr').forEach(function (tr) {
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

        function abrirModalCancelacion(id, codigo) {
            document.getElementById('<%= hfPedidoId.ClientID %>').value = id;
            document.getElementById('modalCodigoPedido').textContent = codigo;
            document.getElementById('modalCancelacion').classList.remove('hidden');
        }

        function cerrarModalCancelacion() {
            document.getElementById('modalCancelacion').classList.add('hidden');
        }

        function confirmarCancelacion() {
            __doPostBack('<%= btnConfirmarCancelacion.UniqueID %>', '');
        }
    </script>
</asp:Content>
