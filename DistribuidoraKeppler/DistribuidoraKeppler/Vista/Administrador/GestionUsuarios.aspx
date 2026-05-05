<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="GestionUsuarios.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Aministrador.GestionUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Kepler Admin - Gestión de Usuarios</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.3/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/2.3.7/css/dataTables.bootstrap5.css" />

    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.datatables.net/2.3.7/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.3.7/js/dataTables.bootstrap5.js"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

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
                            <th class="px-6 py-4 font-bold uppercase tracking-wider border-b border-slate-100">Nombre</th>
                            <th class="px-6 py-4 font-bold uppercase tracking-wider border-b border-slate-100">Email</th>
                            <th class="px-6 py-4 font-bold uppercase tracking-wider border-b border-slate-100">Rol</th>
                            <th class="px-6 py-4 font-bold uppercase tracking-wider border-b border-slate-100">Estado</th>
                            <th class="px-6 py-4 font-bold uppercase tracking-wider border-b border-slate-100 text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-50">
                        <%foreach (var item in lista)
                            {  %>
                        <tr class="hover:bg-slate-50/50 transition-colors group">
                            <td class="px-6 py-4 font-medium text-slate-900"><%=item.Nombre%></td>
                            <td class="px-6 py-4 text-slate-500"><%=item.Email%></td>
                            <td class="px6 py-4">
                                <span class="px-2 py-1 bg-slate-100 text-slate-700 rounded-md text-xs font-semibold"><%=item.Rol.Nombre%></span>
                            </td>
                            <td class="px-6 py-4">
                                <%if (item.Estado == 1)
                                    { %>
                                <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-emerald-100 text-emearald-800">
                                    <span class="w-1.5 h-1.5 mr-1.5 bg-emerald-500 rounded-full"></span>Activo
                                </span>
                                <%}else{  %>
                                <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-rose-100 text-rose-800">
                                    <span class="w-1.5 h-1.5 mr-1.5 bg-rose-500 rounded-full"></span>Inactivo
                                </span>
                                <%} %>
                            </td>
                            <td class="px-6 py-4 text-center">
                                <asp:LinkButton ID="lbtnEditar" runat="server" CssClass="text-slate-400 hover:text-indigo-600 transition-colors mr-3 btnEditar" OnClick="lbtnEditar_Click">
                                    <i class="fas fa-edit"></i>
                                </asp:LinkButton>
                                <button type="button" class="text-salte-400 hover:text-rose-600 transition-colors btnEliminar" title="Eliminar">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </td>
                        </tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
    <script src="../Assets/js/GestionUsuario.js"></script>


</asp:Content>
