<%@ Page Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!-- Tailwind + iconos -->
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />

<div class="flex min-h-screen bg-gray-100 font-sans">

    <!-- SIDEBAR -->
    <aside class="w-64 bg-white border-r flex flex-col p-6">

        <!-- LOGO -->
        <div class="flex items-center gap-3 mb-8">
            <div class="bg-blue-900 text-white p-2 rounded-lg">
                <span class="material-symbols-outlined">rocket_launch</span>
            </div>
            <div>
                <h2 class="font-bold text-blue-900">Kepler</h2>
                <p class="text-xs text-gray-500">Distribution</p>
            </div>
        </div>

        <!-- MENU -->
        <nav class="space-y-2 text-sm">

            <div class="flex items-center gap-3 bg-blue-900 text-white p-3 rounded-lg">
                <span class="material-symbols-outlined">dashboard</span>
                Dashboard
            </div>

            <div class="flex items-center gap-3 p-3 hover:bg-gray-100 rounded-lg cursor-pointer">
                <span class="material-symbols-outlined">shopping_bag</span>
                Catálogo
            </div>

            <div class="flex items-center gap-3 p-3 hover:bg-gray-100 rounded-lg cursor-pointer">
                <span class="material-symbols-outlined">list_alt</span>
                Mis pedidos
            </div>

            <div class="flex items-center gap-3 p-3 hover:bg-gray-100 rounded-lg cursor-pointer">
                <span class="material-symbols-outlined">history</span>
                Historial
            </div>

            <div class="flex items-center gap-3 p-3 hover:bg-gray-100 rounded-lg cursor-pointer">
                <span class="material-symbols-outlined">settings</span>
                Configuración
            </div>

        </nav>

        <!-- USUARIO -->
        <div class="mt-auto pt-6 border-t flex items-center gap-3">
            <img class="w-10 h-10 rounded-full" src="https://i.pravatar.cc/100" />
            <div>
                <p class="text-sm font-bold">Carlos</p>
                <p class="text-xs text-gray-500">ID: #44291</p>
            </div>
        </div>

    </aside>

    <!-- CONTENIDO -->
    <main class="flex-1 p-8">

        <!-- HEADER -->
        <div class="flex justify-between items-center mb-8">
            <div>
                <h1 class="text-3xl font-bold">¡Bienvenido, Carlos!</h1>
                <p class="text-gray-500">Aquí tienes el resumen de tu cuenta</p>
            </div>

            <div class="flex gap-3">
                <button class="px-4 py-2 border rounded-lg text-sm">Soporte</button>
                <button class="px-4 py-2 bg-blue-900 text-white rounded-lg shadow">Nueva solicitud</button>
            </div>
        </div>

        <div class="grid grid-cols-4 gap-6">

            <!-- IZQUIERDA -->
            <div class="col-span-3 space-y-6">

                <!-- CARDS -->
                <div class="grid grid-cols-3 gap-6">

                    <div class="bg-white p-6 rounded-xl shadow">
                        <p class="text-gray-500 text-sm">Pedidos del mes</p>
                        <p class="text-3xl font-bold mt-2">2</p>
                        <p class="text-green-500 text-sm mt-1">+15%</p>
                    </div>

                    <div class="bg-white p-6 rounded-xl shadow">
                        <p class="text-gray-500 text-sm">Total invertido</p>
                        <p class="text-3xl font-bold mt-2">$45,200</p>
                        <p class="text-red-500 text-sm mt-1">-5%</p>
                    </div>

                    <div class="bg-white p-6 rounded-xl shadow">
                        <p class="text-gray-500 text-sm">En proceso</p>
                        <p class="text-3xl font-bold mt-2">2</p>
                    </div>

                </div>

                <!-- ACCESOS -->
                <div>
                    <h3 class="font-bold mb-4 flex items-center gap-2">
                        <span class="material-symbols-outlined text-blue-900">bolt</span>
                        Accesos rápidos
                    </h3>

                    <div class="grid grid-cols-3 gap-4">

                        <div class="bg-blue-900 text-white p-6 rounded-xl text-center shadow hover:scale-105 transition">
                            <span class="material-symbols-outlined text-3xl mb-2">add_shopping_cart</span>
                            <p class="font-bold">Realizar pedido</p>
                        </div>

                        <div class="bg-white p-6 rounded-xl text-center border hover:shadow">
                            <span class="material-symbols-outlined text-3xl mb-2">grid_view</span>
                            <p class="font-bold">Ver catálogo</p>
                        </div>

                        <div class="bg-white p-6 rounded-xl text-center border hover:shadow">
                            <span class="material-symbols-outlined text-3xl mb-2">history</span>
                            <p class="font-bold">Historial</p>
                        </div>

                    </div>
                </div>

                <!-- TABLA -->
                <div class="bg-white rounded-xl shadow overflow-hidden">
                    <div class="p-4 border-b flex justify-between">
                        <h3 class="font-bold">Últimos pedidos</h3>
                        <span class="text-blue-900 text-sm cursor-pointer">Ver todos</span>
                    </div>

                    <table class="w-full text-sm">
                        <thead class="bg-gray-100">
                            <tr>
                                <th class="p-3 text-left">ID</th>
                                <th class="p-3 text-left">Fecha</th>
                                <th class="p-3 text-left">Total</th>
                                <th class="p-3 text-left">Estado</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr class="border-t">
                                <td class="p-3 font-bold">#9802</td>
                                <td class="p-3">22 Mayo</td>
                                <td class="p-3">$12,450</td>
                                <td class="p-3 text-yellow-500 font-bold">Pendiente</td>
                            </tr>

                            <tr class="border-t">
                                <td class="p-3 font-bold">#9745</td>
                                <td class="p-3">18 Mayo</td>
                                <td class="p-3">$8,900</td>
                                <td class="p-3 text-blue-500 font-bold">En camino</td>
                            </tr>

                            <tr class="border-t">
                                <td class="p-3 font-bold">#9688</td>
                                <td class="p-3">15 Mayo</td>
                                <td class="p-3">$23,850</td>
                                <td class="p-3 text-green-500 font-bold">Entregado</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>

            <!-- PANEL DERECHO -->
            <div class="bg-blue-900 text-white p-6 rounded-xl shadow space-y-6">

                <div>
                    <p class="text-sm opacity-80">Crédito disponible</p>
                    <p class="text-3xl font-bold">$150,000</p>
                </div>

                <div class="bg-white/20 p-4 rounded-lg">
                    <p class="text-sm">Próximo vencimiento</p>
                    <p class="font-bold">05 Junio</p>
                    <p class="text-xs">Monto: $18,250</p>
                </div>

                <button class="bg-white text-blue-900 w-full py-2 rounded-lg font-bold hover:bg-gray-200">
                    PAGAR AHORA
                </button>

            </div>

        </div>

    </main>

</div>

</asp:Content>