<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="Pago.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.Carrito.Pago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="max-w-lg mx-auto py-10 px-4 space-y-5">

        <!-- Logo -->
        <div class="text-center mb-2">
            <div class="inline-flex items-center gap-2">
                <div class="bg-gradient-to-tr from-blue-700 to-indigo-500 p-2 rounded-xl">
                    <i class="fas fa-boxes-stacked text-white text-lg"></i>
                </div>
                <span class="font-black text-slate-800 text-lg tracking-wide uppercase">Keppler</span>
            </div>
        </div>

        <!-- Bloque de estado -->
        <asp:Panel ID="pnlEstado" runat="server"
            CssClass="rounded-2xl p-8 text-center shadow-xl">

            <div class="flex items-center justify-center w-16 h-16 rounded-full bg-white/20 mx-auto mb-4">
                <asp:Literal ID="lblIcono" runat="server" Text="" />
            </div>

            <h2 class="text-2xl font-bold mb-1 text-slate-800">
                <asp:Label ID="lblTituloEstado" runat="server" Text="" />
            </h2>

            <asp:Label ID="lblMensaje" runat="server" CssClass="text-sm text-slate-600 block mt-2" Text="" />
        </asp:Panel>

        <!-- Detalles -->
        <div class="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
            <div class="px-6 py-4 border-b border-slate-100">
                <h3 class="font-bold text-slate-800 text-sm">Detalles de la transacción</h3>
            </div>
            <div class="divide-y divide-slate-100">

                <div class="flex justify-between items-center px-6 py-3">
                    <span class="text-xs text-slate-400 font-semibold uppercase tracking-wide">Referencia</span>
                    <asp:Label ID="lblReferencia" runat="server" CssClass="text-sm font-mono font-bold text-slate-700" Text="" />
                </div>

                <div class="flex justify-between items-center px-6 py-3">
                    <span class="text-xs text-slate-400 font-semibold uppercase tracking-wide">ID Transacción</span>
                    <asp:Label ID="lblTransaccionId" runat="server" CssClass="text-sm font-mono text-slate-600" Text="" />
                </div>

                <div class="flex justify-between items-center px-6 py-3">
                    <span class="text-xs text-slate-400 font-semibold uppercase tracking-wide">Monto</span>
                    <asp:Label ID="lblMonto" runat="server" CssClass="text-sm font-bold text-slate-800" Text="" />
                </div>

                <div class="flex justify-between items-center px-6 py-3">
                    <span class="text-xs text-slate-400 font-semibold uppercase tracking-wide">Método de pago</span>
                    <asp:Label ID="lblMetodoPago" runat="server" CssClass="text-sm text-slate-600" Text="" />
                </div>

                <div class="flex justify-between items-center px-6 py-3">
                    <span class="text-xs text-slate-400 font-semibold uppercase tracking-wide">Autorización</span>
                    <asp:Label ID="lblAutorizacion" runat="server" CssClass="text-sm font-mono text-slate-600" Text="" />
                </div>

                <div class="flex justify-between items-center px-6 py-3">
                    <span class="text-xs text-slate-400 font-semibold uppercase tracking-wide">Correo</span>
                    <asp:Label ID="lblEmail" runat="server" CssClass="text-sm text-slate-600" Text="" />
                </div>

                <div class="flex justify-between items-center px-6 py-3">
                    <span class="text-xs text-slate-400 font-semibold uppercase tracking-wide">Fecha</span>
                    <asp:Label ID="lblFecha" runat="server" CssClass="text-sm text-slate-600" Text="" />
                </div>

            </div>
        </div>

        <!-- Acciones -->
        <div class="flex gap-3">
            <a href="../CatalogoProductos.aspx"
                class="flex-1 text-center bg-slate-100 hover:bg-slate-200 text-slate-700 font-semibold text-sm py-3 rounded-xl transition-all">Seguir comprando
            </a>
            <a href="../DetalleProducto.aspx"
                class="flex-1 text-center bg-[#0b1184] hover:bg-[#060a52] text-white font-semibold text-sm py-3 rounded-xl transition-all">Ver mis pedidos
            </a>
        </div>

    </div>

    <script src="../../Assets/js/Pago.js"></script>

</asp:Content>
