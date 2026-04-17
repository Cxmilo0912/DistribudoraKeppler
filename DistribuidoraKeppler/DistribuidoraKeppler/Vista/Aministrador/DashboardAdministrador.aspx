<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="DashboardAdministrador.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Aministrador.DashboardAdministrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

    ```
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />

    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

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
    </style>
    ```

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    ```
    <div class="bg-white text-slate-800 antialiased h-screen flex overflow-hidden">

        <!-- Sidebar -->
        <aside class="w-64 border-r border-gray-100 flex flex-col bg-white">
            <div class="p-6 flex items-center space-x-3">
                <div class="w-10 h-10 bg-kepler-blue rounded-xl flex items-center justify-center">
                    <span class="material-symbols-outlined text-white text-xl">hub</span>
                </div>
                <div>
                    <h1 class="font-bold text-lg">Kepler Admin</h1>
                    <p class="text-[10px] text-gray-400">Sistema de Distribución</p>
                </div>
            </div>

            <nav class="flex-1 px-4 mt-4 space-y-1">
                <a class="flex items-center px-4 py-3 bg-kepler-blue text-white rounded-xl">Dashboard
                </a>
                <a class="flex items-center px-4 py-3 text-gray-500 hover:bg-gray-50 rounded-xl">Usuarios
                </a>
                <a class="flex items-center px-4 py-3 text-gray-500 hover:bg-gray-50 rounded-xl">Productos
                </a>
            </nav>
        </aside>

        <!-- Main -->
        <main class="flex-1 bg-main-content p-8 overflow-y-auto">

            <h2 class="text-3xl font-bold mb-6">Resumen General</h2>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">

                <div class="bg-white p-6 rounded-2xl shadow">
                    <p class="text-gray-400">Ventas de Hoy</p>
                    <h3 class="text-2xl font-bold">$12,450</h3>
                </div>

                <div class="bg-white p-6 rounded-2xl shadow">
                    <p class="text-gray-400">Pedidos</p>
                    <h3 class="text-2xl font-bold">84</h3>
                </div>

                <div class="bg-white p-6 rounded-2xl shadow">
                    <p class="text-gray-400">Stock Bajo</p>
                    <h3 class="text-2xl font-bold">12</h3>
                </div>

                <div class="bg-white p-6 rounded-2xl shadow">
                    <p class="text-gray-400">Clientes</p>
                    <h3 class="text-2xl font-bold">1250</h3>
                </div>

            </div>

        </main>

    </div>
    ```

</asp:Content>
