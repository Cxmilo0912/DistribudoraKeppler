<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Preventista.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Preventista.Preventista" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8"/>
    <title>Preventista</title>

    <!-- Tailwind -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Fuente -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>

    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        .card {
            box-shadow: 
                0 10px 25px rgba(0,0,0,0.05),
                0 4px 10px rgba(0,0,0,0.03);
            backdrop-filter: blur(6px);
        }

        .gradient {
            background: linear-gradient(135deg, #5b7cff 0%, #6f8cff 50%, #7c95ff 100%);
            box-shadow: 0 10px 30px rgba(91,124,255,0.4);
        }
    </style>
</head>

<body class="bg-gradient-to-br from-[#eef2ff] via-[#f4f6fb] to-[#e9eefc]">

<form id="form1" runat="server">

<div class="max-w-md mx-auto min-h-screen flex flex-col">

<!-- HEADER -->
<div class="bg-white/80 backdrop-blur-md px-4 py-4 flex justify-between items-center border-b border-white/40">
    <div class="flex items-center gap-3">
        <img src="https://i.pravatar.cc/100" class="w-12 h-12 rounded-full border"/>
        <div>
            <h1 class="font-bold text-gray-900">¡Hola, Juan Pérez!</h1>
            <p class="text-xs text-gray-500">Preventista Kepler • ID: 4529</p>
        </div>
    </div>
    <span class="text-xl">🔔</span>
</div>

<!-- CONTENIDO -->
<div class="px-4 py-4 flex-1 pb-24">

    <p class="text-gray-500 text-sm mb-2">Viernes, 25 de Octubre</p>

    <h2 class="font-bold text-gray-800 mb-3">Resumen de ventas del día</h2>

    <!-- CARD AZUL -->
    <div class="gradient text-white p-5 rounded-2xl card mb-4">
        <div class="flex justify-between text-sm opacity-80">
            <span>Ventas Totales</span>
            <span class="bg-white/20 px-2 rounded text-xs">+12.5%</span>
        </div>
        <h2 class="text-3xl font-bold mt-2">$12,450.00</h2>
    </div>

    <!-- STATS -->
    <div class="grid grid-cols-2 gap-3 mb-5">
        <div class="bg-white/80 backdrop-blur-md p-4 rounded-xl card border border-white/40">
            <p class="text-xs text-gray-500">Pedidos</p>
            <p class="text-xl font-bold">18</p>
        </div>
        <div class="bg-white/80 backdrop-blur-md p-4 rounded-xl card border border-white/40">
            <p class="text-xs text-gray-500">Visitas</p>
            <p class="text-xl font-bold">24/30</p>
        </div>
    </div>

    <!-- ACCESOS -->
    <h2 class="font-bold text-gray-800 mb-3">Accesos rápidos</h2>

    <div class="grid grid-cols-3 gap-3 mb-6">

        <asp:Button ID="btnPedido" runat="server" Text="Nuevo Pedido"
            CssClass="bg-white/80 backdrop-blur-md rounded-xl p-4 text-[10px] font-bold card border border-white/40" />

        <asp:Button ID="btnClientes" runat="server" Text="Clientes"
            CssClass="bg-white/80 backdrop-blur-md rounded-xl p-4 text-[10px] font-bold card border border-white/40" />

        <asp:Button ID="btnDocs" runat="server" Text="Documentos"
            CssClass="bg-white/80 backdrop-blur-md rounded-xl p-4 text-[10px] font-bold card border border-white/40" />

    </div>

    <!-- PROXIMA VISITA -->
    <div class="flex justify-between mb-2">
        <h2 class="font-bold text-gray-800">Próxima visita</h2>
        <span class="text-blue-500 text-xs font-bold">VER RUTA</span>
    </div>

    <div class="bg-white/80 backdrop-blur-md p-3 rounded-xl card flex gap-3 mb-6 border border-white/40">
        <img src="https://picsum.photos/100" class="w-16 h-16 rounded-lg"/>
        <div class="flex-1">
            <div class="flex justify-between">
                <h3 class="text-sm font-bold">Mini Market La Esperanza</h3>
                <span class="text-blue-500 text-xs">10:45 AM</span>
            </div>
            <p class="text-xs text-gray-500">Av. Central 452, Sector B</p>
            <span class="text-green-600 bg-green-100 px-2 py-1 text-xs rounded">En ruta</span>
        </div>
    </div>

    <!-- ACTIVIDAD -->
    <h2 class="font-bold text-gray-800 mb-3">Actividad reciente</h2>

    <div class="space-y-3">

        <div class="flex gap-3">
            <div class="w-10 h-10 bg-green-100 rounded-full flex items-center justify-center">✔</div>
            <div>
                <p class="text-sm font-semibold">Pedido #8902 - Entregado</p>
                <p class="text-xs text-gray-500">Hace 15 min • Bodega Don Pepe</p>
            </div>
        </div>

        <div class="flex gap-3">
            <div class="w-10 h-10 bg-blue-100 rounded-full flex items-center justify-center">📄</div>
            <div>
                <p class="text-sm font-semibold">Nuevo pedido creado</p>
                <p class="text-xs text-gray-500">Hace 45 min • $450.00 • Super X</p>
            </div>
        </div>

    </div>

</div>

<!-- NAVBAR -->
<div class="fixed bottom-0 left-0 right-0 max-w-md mx-auto bg-white/80 backdrop-blur-md border-t border-white/40 flex justify-around py-3 text-xs">

    <asp:Button ID="btnInicio" runat="server" Text="Inicio"
        CssClass="text-blue-600 font-bold bg-transparent border-none" />

    <asp:Button ID="btnNavPedidos" runat="server" Text="Pedidos"
        CssClass="text-gray-400 bg-transparent border-none" />

    <asp:Button ID="btnNavClientes" runat="server" Text="Clientes"
        CssClass="text-gray-400 bg-transparent border-none" />

    <asp:Button ID="btnNavAjustes" runat="server" Text="Ajustes"
        CssClass="text-gray-400 bg-transparent border-none" />

</div>

</div>

</form>
</body>
</html>