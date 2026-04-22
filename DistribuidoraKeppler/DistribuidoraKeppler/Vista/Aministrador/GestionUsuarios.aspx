<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="GestionUsuarios.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Aministrador.GestionUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Kepler Admin - Gestión de Usuarios</title>
    <!-- Tailwind CSS v3 CDN -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.datatables.net/2.3.7/css/dataTables.bootstrap5.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <body class="bg-gray-50 font-sans text-gray-800">
        <div class="flex min-h-screen">
            <!-- Main Content Area -->
            <main class="flex-grow ml-72 p-10">
                <!-- BEGIN: Header Section -->
                <header class="flex items-center justify-between mb-8" data-purpose="main-header">
                    <h2 class="text-3xl font-extrabold text-gray-800">Gestión de Usuarios</h2>
                    <div class="flex items-center space-x-6 flex-grow justify-center max-w-2xl px-8">
                        <div class="relative w-full">
                            <span class="absolute inset-y-0 left-0 flex items-center pl-4 pointer-events-none">
                                <i class="fas fa-search text-gray-400"></i>
                            </span>
                            <input class="w-full bg-white border-none rounded-xl py-3 pl-12 pr-4 shadow-sm text-sm focus:ring-2 focus:ring-indigo-500" placeholder="Buscar por nombre, correo o rol..." type="text" />
                        </div>
                    </div>
                    <div class="flex items-center space-x-4">
                        <button class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-2.5 rounded-xl font-semibold flex items-center space-x-2 shadow-lg shadow-blue-200 transition-all">
                            <i class="fas fa-user-plus"></i>
                            <span>Agregar Usuario</span>
                        </button>
                        <div class="relative">
                            <button class="w-10 h-10 bg-white rounded-full flex items-center justify-center text-gray-500 shadow-sm border border-gray-100 hover:bg-gray-50">
                                <i class="far fa-bell text-lg"></i>
                            </button>
                            <span class="absolute top-0 right-0 w-2 h-2 bg-red-500 rounded-full border-2 border-white"></span>
                        </div>
                    </div>
                </header>
                <!-- END: Header Section -->
                <!-- BEGIN: Filters -->
                <section class="mb-8 flex items-center space-x-4" data-purpose="role-filters">
                    <span class="text-xs font-bold text-gray-400 uppercase tracking-widest">Filtrar por rol:</span>
                    <div class="flex flex-wrap gap-2">
                        <button class="bg-slate-900 text-white px-5 py-1.5 rounded-full text-sm font-medium transition-colors">Todos</button>
                        <button class="bg-white border border-gray-200 text-gray-600 px-5 py-1.5 rounded-full text-sm font-medium hover:bg-gray-50 transition-colors">Administrador</button>
                        <button class="bg-white border border-gray-200 text-gray-600 px-5 py-1.5 rounded-full text-sm font-medium hover:bg-gray-50 transition-colors">Preventista</button>
                        <button class="bg-white border border-gray-200 text-gray-600 px-5 py-1.5 rounded-full text-sm font-medium hover:bg-gray-50 transition-colors">Cliente</button>
                        <button class="bg-white border border-gray-200 text-gray-600 px-5 py-1.5 rounded-full text-sm font-medium hover:bg-gray-50 transition-colors">Encargado</button>
                        <button class="bg-white border border-gray-200 text-gray-600 px-5 py-1.5 rounded-full text-sm font-medium hover:bg-gray-50 transition-colors">Distribuidor</button>
                        <button class="bg-white border border-gray-200 text-gray-600 px-5 py-1.5 rounded-full text-sm font-medium hover:bg-gray-50 transition-colors">Repartidor</button>
                    </div>
                </section>
                <!-- END: Filters -->
                <!-- BEGIN: User Table Card -->
                <div class="bg-white rounded-3xl shadow-sm border border-gray-100 overflow-hidden" data-purpose="user-table-container">
                    <table id="empleadosLista" class="table table-striped w-full text-left border-collapse">
                        <thead>
                            <tr class="text-[11px] font-bold text-gray-400 uppercase tracking-widest border-b border-gray-100">
                                <th class="py-6 px-8">Nombre</th>
                                <th class="py-6 px-8">Correo</th>
                                <th class="py-6 px-8">Rol</th>
                                <th class="py-6 px-8">Estado</th>
                                <th class="py-6 px-8 text-right">Acciones</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-50"></tbody>
                        <tfoot>
                            <tr class="text-[11px] font-bold text-gray-400 uppercase tracking-widest border-b border-gray-100">
                                <th class="py-6 px-8">Nombre</th>
                                <th class="py-6 px-8">Correo</th>
                                <th class="py-6 px-8">Rol</th>
                                <th class="py-6 px-8">Estado</th>
                                <th class="py-6 px-8 text-right">Acciones</th>
                            </tr>
                        </tfoot>

                    </table>
                    <!-- Table Footer/Pagination -->
                    <div class="bg-white px-8 py-6 flex items-center justify-between border-t border-gray-50" data-purpose="table-pagination">
                        <p class="text-sm text-gray-400 font-medium">Mostrando <span class="text-gray-700">1-6</span> de <span class="text-gray-700">42</span> usuarios</p>
                        <div class="flex items-center space-x-2">
                            <button class="w-8 h-8 flex items-center justify-center rounded-lg text-gray-400 hover:bg-gray-100 transition-colors">
                                <i class="fas fa-chevron-left text-xs"></i>
                            </button>
                            <button class="w-10 h-10 flex items-center justify-center rounded-lg bg-slate-900 text-white font-bold text-sm shadow-md">1</button>
                            <button class="w-8 h-8 flex items-center justify-center rounded-lg text-gray-600 hover:bg-gray-100 font-medium text-sm transition-colors">2</button>
                            <button class="w-8 h-8 flex items-center justify-center rounded-lg text-gray-600 hover:bg-gray-100 font-medium text-sm transition-colors">3</button>
                            <span class="text-gray-400 px-1 text-sm">...</span>
                            <button class="w-8 h-8 flex items-center justify-center rounded-lg text-gray-600 hover:bg-gray-100 font-medium text-sm transition-colors">8</button>
                            <button class="w-8 h-8 flex items-center justify-center rounded-lg text-gray-400 hover:bg-gray-100 transition-colors">
                                <i class="fas fa-chevron-right text-xs"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <!-- END: User Table Card -->
            </main>
        </div>
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    </body>
    </html>
</asp:Content>
