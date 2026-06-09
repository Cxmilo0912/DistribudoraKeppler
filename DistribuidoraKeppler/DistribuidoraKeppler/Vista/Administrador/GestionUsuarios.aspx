<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="GestionUsuarios.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Aministrador.GestionUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Kepler Admin - Gestión de Usuarios</title>

    <link href="https://cdn.datatables.net/v/bs5/jszip-3.10.1/dt-2.0.8/b-3.0.2/b-colvis-3.0.2/b-html5-3.0.2/b-print-3.0.2/cr-2.0.3/fc-5.0.1/fh-4.0.1/r-3.0.2/sp-2.3.3/sl-2.0.3/datatables.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <script src="https://cdn.datatables.net/v/bs5/jszip-3.10.1/dt-2.0.8/b-3.0.2/b-colvis-3.0.2/b-html5-3.0.2/b-print-3.0.2/cr-2.0.3/fc-5.0.1/fh-4.0.1/r-3.0.2/sp-2.3.3/sl-2.0.3/datatables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="../Assets/css/GestionUsuario.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <body class="bg-gray-50 font-sans text-gray-800">
        <!-- Main Content Area -->
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
                <button data-role="" class="bg-slate-900 text-white px-5 py-1.5 rounded-full text-sm font-medium transition-colors">Todos</button>
                <button type="button" data-role="Administrador" class="bg-white border border-gray-200 text-gray-600 px-5 py-1.5 rounded-full text-sm font-medium hover:bg-gray-50 transition-colors">Administrador</button>
                <button type="button" data-role="Preventista" class="bg-white border border-gray-200 text-gray-600 px-5 py-1.5 rounded-full text-sm font-medium hover:bg-gray-50 transition-colors">Preventista</button>
                <button type="button" data-role="Bodega" class="bg-white border border-gray-200 text-gray-600 px-5 py-1.5 rounded-full text-sm font-medium hover:bg-gray-50 transition-colors">Bodega</button>
                <button type="button" data-role="Distribuidor" class="bg-white border border-gray-200 text-gray-600 px-5 py-1.5 rounded-full text-sm font-medium hover:bg-gray-50 transition-colors">Distribuidor</button>
            </div>
        </section>
        <!-- END: Filters -->
        <!-- BEGIN: User Table Card -->
        <div class="bg-white rounded-3x1 shadow-sm border border-gray-100 overflow-hidden" data-purpose="user-table-container">
            <div class="user-table-wrapper p-4">
                <table id="example" class="w-full text-sm text-left border-separate border-spacing-0">
                    <thead class="bg-slate-50 text-slate-600">
                        <tr>
                            <th >Id</th>
                            <th >Nombre</th>
                            <th >Email</th>
                            <th >Rol</th>
                            <th >Estado</th>
                            <th >Acciones</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-50">
                    </tbody>
                </table>
            </div>
        </div>
    </body>
    <script src="../Assets/js/GestionUsuario.js"></script>


</asp:Content>
