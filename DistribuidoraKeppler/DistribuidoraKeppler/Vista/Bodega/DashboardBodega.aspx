<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="DashboardBodega.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Bodega.DashboardBodega" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex min-h-screen bg-gray-100 font-sans">

        <!-- SIDEBAR -->
        <aside class="w-64 bg-white shadow-lg flex flex-col p-6">

            <div class="flex items-center gap-3 mb-10">
                <div class="bg-blue-900 text-white p-3 rounded-xl">
                    <span class="material-symbols-outlined">inventory</span>
                </div>
                <div>
                    <h2 class="font-bold text-lg text-blue-900">Kepler</h2>
                    <p class="text-xs text-gray-500">Bodega</p>
                </div>
            </div>

            <nav class="space-y-2 text-sm">

                <div class="flex items-center gap-3 bg-blue-900 text-white p-3 rounded-lg shadow">
                    <span class="material-symbols-outlined">dashboard</span>
                    Dashboard
                </div>

                <div class="flex items-center gap-3 p-3 hover:bg-gray-100 rounded-lg cursor-pointer">
                    <span class="material-symbols-outlined">inventory_2</span>
                    Productos
                </div>

                <div class="flex items-center gap-3 p-3 hover:bg-gray-100 rounded-lg cursor-pointer">
                    <span class="material-symbols-outlined">local_shipping</span>
                    Pedidos
                </div>

            </nav>

        </aside>

        <!-- MAIN -->
        <main class="flex-1 p-8">

            <!-- HEADER -->
            <div class="flex justify-between items-center mb-8">
                <div>
                    <h1 class="text-3xl font-bold">Dashboard Bodega</h1>
                    <p class="text-gray-500">Resumen general</p>
                </div>

                <div class="flex items-center gap-4">
                    <input type="text" placeholder="Buscar..."
                        class="px-3 py-2 border rounded-lg text-sm focus:ring-2 focus:ring-blue-300 outline-none" />

                    <img src="https://i.pravatar.cc/40" class="rounded-full" />
                    <span class="font-semibold">Admin</span>
                </div>
            </div>

            <div class="grid grid-cols-4 gap-6">

                <!-- IZQUIERDA -->
                <div class="col-span-3 space-y-6">

                    <!-- CARDS -->
                    <div class="grid grid-cols-4 gap-6">

                        <div class="bg-white p-6 rounded-xl shadow hover:shadow-lg transition">
                            <div class="flex justify-between items-center">
                                <p class="text-gray-500 text-sm">Pedidos</p>
                                <span class="material-symbols-outlined text-blue-900">shopping_cart</span>
                            </div>
                            <asp:Label ID="lblPedidos" runat="server" CssClass="text-3xl font-bold block mt-2"></asp:Label>
                        </div>

                        <div class="bg-white p-6 rounded-xl shadow hover:shadow-lg transition">
                            <div class="flex justify-between items-center">
                                <p class="text-gray-500 text-sm">Asignados</p>
                                <span class="material-symbols-outlined text-green-600">check_circle</span>
                            </div>
                            <asp:Label ID="lblAsignados" runat="server" CssClass="text-3xl font-bold block mt-2"></asp:Label>
                        </div>

                        <div class="bg-white p-6 rounded-xl shadow hover:shadow-lg transition">
                            <div class="flex justify-between items-center">
                                <p class="text-gray-500 text-sm">En camino</p>
                                <span class="material-symbols-outlined text-yellow-500">local_shipping</span>
                            </div>
                            <asp:Label ID="lblCamino" runat="server" CssClass="text-3xl font-bold block mt-2"></asp:Label>
                        </div>

                        <div class="bg-white p-6 rounded-xl shadow hover:shadow-lg transition">
                            <div class="flex justify-between items-center">
                                <p class="text-gray-500 text-sm">Entregados</p>
                                <span class="material-symbols-outlined text-indigo-600">task_alt</span>
                            </div>
                            <asp:Label ID="lblEntregados" runat="server" CssClass="text-3xl font-bold block mt-2"></asp:Label>
                        </div>

                    </div>

                    <!-- TABLA -->
                    <div class="bg-white rounded-xl shadow overflow-hidden">

                        <div class="p-4 border-b flex justify-between items-center">
                            <h3 class="font-bold">Pedidos recientes</h3>
                            <span class="text-sm text-blue-900 cursor-pointer">Ver todos</span>
                        </div>

                        <asp:GridView ID="gvPedidos" runat="server" AutoGenerateColumns="false"
                            CssClass="w-full text-sm">

                            <HeaderStyle CssClass="bg-gray-100 text-left" />
                            <RowStyle CssClass="hover:bg-gray-50" />

                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" />
                                <asp:BoundField DataField="Cliente" HeaderText="Cliente" />
                                <asp:BoundField DataField="Direccion" HeaderText="Dirección" />

                                <asp:TemplateField HeaderText="Estado">
                                    <ItemTemplate>
                                        <span class="px-3 py-1 rounded-full text-xs font-bold
                                        <%# Eval("Estado").ToString() == "Pendiente" ? "bg-yellow-100 text-yellow-700" :
                                            Eval("Estado").ToString() == "En camino" ? "bg-blue-100 text-blue-700" :
                                            Eval("Estado").ToString() == "Entregado" ? "bg-green-100 text-green-700" :
                                            "bg-gray-100 text-gray-700" %>">
                                            <%# Eval("Estado") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>

                        </asp:GridView>

                    </div>

                </div>

                <!-- PANEL DERECHO -->
                <div class="space-y-6">

                    <div class="bg-blue-900 text-white p-6 rounded-xl shadow">
                        <p class="text-sm opacity-80">Pedidos hoy</p>
                        <asp:Label ID="lblHoy" runat="server" CssClass="text-4xl font-bold"></asp:Label>
                    </div>

                    <div class="bg-white p-6 rounded-xl shadow">
                        <p class="text-sm text-gray-500">Pendientes</p>
                        <asp:Label ID="lblPendientes" runat="server" CssClass="text-xl font-bold text-red-500"></asp:Label>
                    </div>

                    <button class="bg-blue-900 text-white w-full py-2 rounded-lg font-bold hover:bg-blue-800 transition">
                        Ver pedidos
                    </button>

                </div>

            </div>

        </main>

    </div>

</asp:Content>

