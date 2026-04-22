<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Repartidor.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Repartidor.Repartidor" %>

<!DOCTYPE html>
<html>
<head runat="server">
<meta charset="utf-8"/>
<title>Repartidor</title>

<script src="https://cdn.tailwindcss.com"></script>

<style>
    body { background: #eef2f7; }

    .card {
        box-shadow: 0 10px 25px rgba(0,0,0,0.06);
    }

    .badge {
        position: absolute;
        top: 10px;
        right: 12px;
        background: #3b2ea3;
        color: white;
        font-size: 11px;
        padding: 3px 7px;
        border-radius: 999px;
    }
</style>
</head>

<body>
<form id="form1" runat="server">

<div class="max-w-md mx-auto min-h-screen flex flex-col">

<!-- HEADER -->
<div class="bg-[#142f57] text-white px-5 pt-8 pb-6 flex justify-between items-center rounded-b-3xl">
    <div>
        <h1 class="text-lg font-semibold tracking-wide">KEPLER</h1>
        <p class="text-xs opacity-80">Bienvenido, Santiago Chaparro</p>
    </div>

    <div class="w-12 h-12 bg-white/20 rounded-full flex items-center justify-center">
        <!-- icono usuario -->
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-width="2" d="M5.121 17.804A9 9 0 1118.9 17.8M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
        </svg>
    </div>
</div>

<!-- ALERTA -->
<div class="px-4 mt-4">
    <div class="bg-gray-100 p-3 rounded-xl flex items-center gap-3 border-l-4 border-blue-600">
        <!-- campana -->
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-blue-700" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5"/>
        </svg>
        <span class="text-sm text-gray-700">Tu horario del lunes fue actualizado</span>
    </div>
</div>

<!-- BOTONES -->
<div class="grid grid-cols-2 gap-4 p-4">

    <!-- MIS PEDIDOS -->
    <div class="bg-white p-5 rounded-2xl card relative text-center">
        <span class="badge">3</span>

        <div class="w-12 h-12 mx-auto mb-2 bg-gray-100 rounded-full flex items-center justify-center">
            <!-- caja -->
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-[#1c3d6e]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-width="2" d="M20 7l-8-4-8 4m16 0v10l-8 4m8-14l-8 4m0 0L4 7m8 4v10"/>
            </svg>
        </div>

        <p class="font-semibold text-[#1c3d6e]">Mis pedidos</p>
    </div>

    <!-- HORARIO -->
    <div class="bg-white p-5 rounded-2xl card text-center">
        <div class="w-12 h-12 mx-auto mb-2 bg-gray-100 rounded-full flex items-center justify-center">
            <!-- reloj -->
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-[#1c3d6e]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
            </svg>
        </div>

        <p class="font-semibold text-[#1c3d6e]">Horario</p>
    </div>

    <!-- OBSERVACIONES -->
    <div class="bg-white p-5 rounded-2xl card text-center">
        <div class="w-12 h-12 mx-auto mb-2 bg-gray-100 rounded-full flex items-center justify-center">
            <!-- lápiz -->
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-[#1c3d6e]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-width="2" d="M11 5h2m-1 0v14m-7-7h14"/>
            </svg>
        </div>

        <p class="font-semibold text-[#1c3d6e]">Observaciones</p>
    </div>

    <!-- DOCUMENTOS -->
    <div class="bg-white p-5 rounded-2xl card relative text-center">
        <span class="badge">1</span>

        <div class="w-12 h-12 mx-auto mb-2 bg-gray-100 rounded-full flex items-center justify-center">
            <!-- documento -->
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-[#1c3d6e]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-width="2" d="M7 7h10M7 11h10M7 15h6"/>
            </svg>
        </div>

        <p class="font-semibold text-[#1c3d6e]">Documentos</p>
    </div>

</div>

<!-- RESUMEN -->
<div class="px-4 pb-24">
    <div class="bg-white rounded-2xl p-4 card">

        <h2 class="text-xs font-bold text-gray-500 mb-3 tracking-widest">
            RESUMEN DE HOY
        </h2>

        <div class="space-y-3">

            <div class="flex justify-between bg-gray-100 p-3 rounded-xl">
                <span class="text-gray-600 text-sm">Total</span>
                <span class="font-semibold text-blue-800 text-sm">8 Pedidos</span>
            </div>

            <div class="flex justify-between bg-green-100 p-3 rounded-xl">
                <span class="text-green-700 text-sm">Entregados</span>
                <span class="font-semibold text-green-800 text-sm">5 Entregados</span>
            </div>

            <div class="flex justify-between bg-orange-100 p-3 rounded-xl">
                <span class="text-orange-700 text-sm">Pendientes</span>
                <span class="font-semibold text-orange-800 text-sm">3 Pendientes</span>
            </div>

        </div>
    </div>
</div>

<!-- NAVBAR -->
<div class="fixed bottom-0 left-0 right-0 max-w-md mx-auto bg-white border-t flex justify-around py-2">

    <div class="flex flex-col items-center text-blue-600 text-xs">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mb-1" fill="currentColor" viewBox="0 0 24 24">
            <path d="M3 10l9-7 9 7v10a1 1 0 01-1 1h-5v-6H9v6H4a1 1 0 01-1-1V10z"/>
        </svg>
        Inicio
    </div>

    <div class="flex flex-col items-center text-gray-400 text-xs">
        📦<span>Pedidos</span>
    </div>

    <div class="flex flex-col items-center text-gray-400 text-xs">
        📄<span>Documentos</span>
    </div>

    <div class="flex flex-col items-center text-gray-400 text-xs">
        👤<span>Perfil</span>
    </div>

</div>

</div>

</form>
</body>
</html>