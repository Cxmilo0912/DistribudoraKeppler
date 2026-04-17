<%@ Page Title="Kepler Admin Dashboard" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="DashboardAdministrador.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Aministrador.DashboardAdministrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet" />

    <style>
        :root {
            --kepler-blue: #090e82;
            --kepler-blue-light: #1e249d;
            --bg-gray: #f4f7fe;
        }

        .bg-kepler-blue {
            background-color: var(--kepler-blue);
        }

        .text-kepler-blue {
            color: var(--kepler-blue);
        }

        .bg-main-content {
            background-color: var(--bg-gray);
        }

        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-main-content min-h-screen p-8">
        <div class="flex items-end justify-between mb-8">
            <div>
                <h2 class="text-3xl font-bold text-slate-800">Resumen General</h2>
                <p class="text-gray-400 mt-1">Bienvenido al sistema de distribución Kepler.</p>
            </div>
            <button class="bg-kepler-blue hover:bg-blue-900 text-white px-6 py-3 rounded-2xl flex items-center space-x-2 font-semibold text-sm transition-all shadow-lg shadow-blue-900/20">
                <span class="material-symbols-outlined text-white text-sm">download</span>
                <span>Generar Reporte</span>
            </button>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
            <div class="bg-white p-6 rounded-[2rem] shadow-sm border border-gray-50">
                <p class="text-sm font-medium text-gray-400">Ventas de Hoy</p>
                <h3 class="text-2xl font-black mt-1">$12,450.00</h3>
            </div>
            <div class="bg-white p-6 rounded-[2rem] shadow-sm border border-gray-50">
                <p class="text-sm font-medium text-gray-400">Pedidos Activos</p>
                <h3 class="text-2xl font-black mt-1">84</h3>
            </div>
            <div class="bg-white p-6 rounded-[2rem] shadow-sm border border-gray-50">
                <p class="text-sm font-medium text-gray-400">Bajo Stock</p>
                <h3 class="text-2xl font-black mt-1">12</h3>
            </div>
            <div class="bg-white p-6 rounded-[2rem] shadow-sm border border-gray-50">
                <p class="text-sm font-medium text-gray-400">Clientes</p>
                <h3 class="text-2xl font-black mt-1">1,250</h3>
            </div>
        </div>

        <section class="bg-white rounded-[2.5rem] shadow-sm overflow-hidden border border-gray-50">
            <div class="px-8 py-6 border-b border-gray-50">
                <h4 class="font-bold">Pedidos Recientes</h4>
            </div>
            <div class="p-8 text-center text-gray-400">
                Aquí iría el GridView o la tabla de pedidos.
            </div>
        </section>
    </div>
</asp:Content>
