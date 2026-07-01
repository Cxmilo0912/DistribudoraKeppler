<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="ReporteEntregas.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Bodega.ReporteEntregas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="min-h-screen bg-gray-100 font-sans">

        <!-- HEADER -->
        <div class="flex justify-between items-center mb-8">
            <div>
                <h1 class="text-3xl font-bold">Reporte de Entregas</h1>
                <p class="text-gray-500">Entregas realizadas y pendientes por repartidor, sector y fecha</p>
            </div>
        </div>

        <!-- FILTROS -->
        <div class="bg-white rounded-xl shadow p-4 mb-6">
            <div class="grid grid-cols-1 md:grid-cols-5 gap-4 items-end">
                <div>
                    <label class="text-xs font-bold text-gray-500 uppercase block mb-1">Repartidor</label>
                    <asp:DropDownList ID="ddlRepartidor" runat="server"
                        CssClass="w-full px-3 py-2 border rounded-lg text-sm focus:ring-2 focus:ring-blue-300 outline-none">
                    </asp:DropDownList>
                </div>
                <div>
                    <label class="text-xs font-bold text-gray-500 uppercase block mb-1">Sector</label>
                    <asp:DropDownList ID="ddlSector" runat="server"
                        CssClass="w-full px-3 py-2 border rounded-lg text-sm focus:ring-2 focus:ring-blue-300 outline-none">
                    </asp:DropDownList>
                </div>
                <div>
                    <label class="text-xs font-bold text-gray-500 uppercase block mb-1">Desde</label>
                    <asp:TextBox ID="txtFechaInicio" runat="server" TextMode="Date"
                        CssClass="w-full px-3 py-2 border rounded-lg text-sm focus:ring-2 focus:ring-blue-300 outline-none"></asp:TextBox>
                </div>
                <div>
                    <label class="text-xs font-bold text-gray-500 uppercase block mb-1">Hasta</label>
                    <asp:TextBox ID="txtFechaFin" runat="server" TextMode="Date"
                        CssClass="w-full px-3 py-2 border rounded-lg text-sm focus:ring-2 focus:ring-blue-300 outline-none"></asp:TextBox>
                </div>
                <div>
                    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click"
                        CssClass="bg-blue-900 text-white px-4 py-2 rounded-lg font-bold hover:bg-blue-800 transition text-sm w-full" />
                </div>
            </div>
        </div>

        <!-- RESUMEN -->
        <div class="grid grid-cols-2 gap-6 mb-6">
            <div class="bg-white p-6 rounded-xl shadow">
                <div class="flex justify-between items-center">
                    <p class="text-gray-500 text-sm">Entregas realizadas</p>
                    <span class="material-symbols-outlined text-green-600">task_alt</span>
                </div>
                <asp:Label ID="lblTotalRealizados" runat="server" CssClass="text-3xl font-bold block mt-2 text-green-700"></asp:Label>
            </div>
            <div class="bg-white p-6 rounded-xl shadow">
                <div class="flex justify-between items-center">
                    <p class="text-gray-500 text-sm">Entregas pendientes</p>
                    <span class="material-symbols-outlined text-yellow-500">pending_actions</span>
                </div>
                <asp:Label ID="lblTotalPendientes" runat="server" CssClass="text-3xl font-bold block mt-2 text-yellow-600"></asp:Label>
            </div>
        </div>

        <!-- TABLA -->
        <div class="bg-white rounded-xl shadow overflow-hidden">
            <div class="p-4 border-b flex justify-between items-center flex-wrap gap-3">
                <h3 class="font-bold">Detalle del reporte</h3>
                <div class="flex gap-2">
                    <asp:Button ID="btnExportarPdf" runat="server" Text="Exportar PDF" OnClick="btnExportarPdf_Click"
                        CssClass="bg-red-600 text-white px-3 py-2 rounded-lg text-xs font-bold hover:bg-red-700 transition" />
                    <asp:Button ID="btnExportarExcel" runat="server" Text="Exportar Excel" OnClick="btnExportarExcel_Click"
                        CssClass="bg-green-700 text-white px-3 py-2 rounded-lg text-xs font-bold hover:bg-green-800 transition" />
                </div>
            </div>

            <asp:Panel ID="pnlSinRegistros" runat="server" CssClass="p-10 text-center" Visible="false">
                <span class="material-symbols-outlined text-5xl text-gray-200 block mb-2">search_off</span>
                <p class="text-gray-500 font-semibold">No se encontraron registros para los filtros seleccionados</p>
            </asp:Panel>

            <div class="overflow-x-auto">
                <asp:GridView ID="gvReporte" runat="server" AutoGenerateColumns="false"
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
                        <asp:BoundField DataField="Sector" HeaderText="Sector"
                            ItemStyle-CssClass="px-4 py-3" HeaderStyle-CssClass="px-4 py-3" />

                        <asp:TemplateField HeaderText="Estado" ItemStyle-CssClass="px-4 py-3" HeaderStyle-CssClass="px-4 py-3">
                            <ItemTemplate>
                                <span class='px-3 py-1 rounded-full text-xs font-bold <%# Eval("Estado").ToString() == "Realizado" ? "bg-green-100 text-green-700" : "bg-yellow-100 text-yellow-700" %>'>
                                    <%# Eval("Estado") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="FechaAsignacion" HeaderText="Fecha de asignación"
                            ItemStyle-CssClass="px-4 py-3" HeaderStyle-CssClass="px-4 py-3" />
                        <asp:BoundField DataField="FechaEntrega" HeaderText="Fecha de entrega"
                            ItemStyle-CssClass="px-4 py-3" HeaderStyle-CssClass="px-4 py-3" />
                        <asp:BoundField DataField="Observaciones" HeaderText="Observaciones"
                            ItemStyle-CssClass="px-4 py-3" HeaderStyle-CssClass="px-4 py-3" />
                    </Columns>

                </asp:GridView>
            </div>
        </div>

    </div>

</asp:Content>
