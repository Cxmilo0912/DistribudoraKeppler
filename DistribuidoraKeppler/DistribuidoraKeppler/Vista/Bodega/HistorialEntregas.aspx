<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="HistorialEntregas.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Bodega.HistorialEntregas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="min-h-screen bg-gray-100 font-sans">

        <!-- HEADER -->
        <div class="flex justify-between items-center mb-8">
            <div>
                <h1 class="text-3xl font-bold">Historial de Entregas</h1>
                <p class="text-gray-500">Entregas realizadas por los repartidores, ordenadas por la más reciente</p>
            </div>
        </div>

        <!-- TABLA HISTORIAL -->
        <div class="bg-white rounded-xl shadow overflow-hidden">
            <div class="p-4 border-b">
                <h3 class="font-bold">Entregas registradas</h3>
            </div>

            <asp:Panel ID="pnlSinRegistros" runat="server" CssClass="p-10 text-center" Visible="false">
                <span class="material-symbols-outlined text-5xl text-gray-200 block mb-2">local_shipping</span>
                <p class="text-gray-500 font-semibold">No hay entregas registradas</p>
            </asp:Panel>

            <div class="overflow-x-auto">
                <asp:GridView ID="gvHistorialEntregas" runat="server" AutoGenerateColumns="false"
                    CssClass="w-full text-sm" GridLines="None">

                    <HeaderStyle CssClass="bg-gray-100 text-left text-xs font-bold text-gray-500 uppercase" />
                    <RowStyle CssClass="border-b hover:bg-gray-50" />

                    <Columns>
                        <asp:BoundField DataField="NumeroPedido" HeaderText="N° Pedido"
                            ItemStyle-CssClass="px-4 py-3" HeaderStyle-CssClass="px-4 py-3" />
                        <asp:BoundField DataField="Cliente" HeaderText="Cliente"
                            ItemStyle-CssClass="px-4 py-3" HeaderStyle-CssClass="px-4 py-3" />
                        <asp:BoundField DataField="Repartidor" HeaderText="Repartidor"
                            ItemStyle-CssClass="px-4 py-3" HeaderStyle-CssClass="px-4 py-3" />
                        <asp:BoundField DataField="FechaEntrega" HeaderText="Fecha de entrega"
                            ItemStyle-CssClass="px-4 py-3" HeaderStyle-CssClass="px-4 py-3" />
                        <asp:BoundField DataField="HoraEntrega" HeaderText="Hora de entrega"
                            ItemStyle-CssClass="px-4 py-3" HeaderStyle-CssClass="px-4 py-3" />
                    </Columns>

                </asp:GridView>
            </div>
        </div>

    </div>

</asp:Content>
