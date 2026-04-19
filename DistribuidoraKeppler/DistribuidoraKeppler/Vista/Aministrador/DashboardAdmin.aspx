<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardAdmin.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Aministrador.DashboardAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Kepler Admin Dashboard</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <!-- Google Fonts: Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet" />
    <style data-purpose="typography">
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
    <style data-purpose="custom-colors">
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
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
</head>
<body class="bg-white text-slate-800 antialiased h-screen flex overflow-hidden">
    <%--<form id="form1" runat="server">--%>
        <!-- BEGIN: Sidebar -->
        <aside class="w-64 flex-shrink-0 border-r border-gray-100 flex flex-col h-full bg-white" data-purpose="sidebar">
            <!-- Logo Section -->
            <div class="p-6 flex items-center space-x-3">
                <div class="w-10 h-10 bg-kepler-blue rounded-xl flex items-center justify-center">
                    <span class="material-symbols-outlined text-white text-xl">hub</span>
                </div>
                <div>
                    <h1 class="font-bold text-lg leading-tight">Kepler Admin</h1>
                    <p class="text-[10px] text-gray-400 font-medium">Sistema de Distribución</p>
                </div>
            </div>
            <!-- Navigation Menu -->
            <nav class="flex-1 px-4 mt-4 space-y-1 overflow-y-auto">
                <a class="flex items-center space-x-3 px-4 py-3 bg-kepler-blue text-white rounded-xl font-medium transition-all shadow-lg shadow-blue-900/20" href="#">
                    <span class="material-symbols-outlined text-xl">dashboard</span>
                    <span>Tablero</span>
                </a>
                <a class="flex items-center space-x-3 px-4 py-3 text-gray-500 hover:bg-gray-50 rounded-xl font-medium transition-all" href="#">
                    <span class="material-symbols-outlined text-xl opacity-60">group</span>
                    <span>Gestión de Usuarios</span>
                </a>
                <a class="flex items-center space-x-3 px-4 py-3 text-gray-500 hover:bg-gray-50 rounded-xl font-medium transition-all" href="#">
                    <span class="material-symbols-outlined text-xl opacity-60">inventory_2</span>
                    <span>Gestión de Productos</span>
                </a>
                <a class="flex items-center space-x-3 px-4 py-3 text-gray-500 hover:bg-gray-50 rounded-xl font-medium transition-all" href="#">
                    <span class="material-symbols-outlined text-xl opacity-60">loyalty</span>
                    <span>Gestión de Marcas</span>
                </a>
                <a class="flex items-center space-x-3 px-4 py-3 text-gray-500 hover:bg-gray-50 rounded-xl font-medium transition-all" href="#">
                    <span class="material-symbols-outlined text-xl opacity-60">category</span>
                    <span>Gestión de Categorias</span>
                </a>
                <a class="flex items-center space-x-3 px-4 py-3 text-gray-500 hover:bg-gray-50 rounded-xl font-medium transition-all" href="#">
                    <span class="material-symbols-outlined text-xl opacity-60">shopping_cart</span>
                    <span>Pedidos</span>
                </a>
                <a class="flex items-center space-x-3 px-4 py-3 text-gray-500 hover:bg-gray-50 rounded-xl font-medium transition-all" href="#">
                    <span class="material-symbols-outlined text-xl opacity-60">storefront</span>
                    <span>Inventario</span>
                </a>
                <a class="flex items-center space-x-3 px-4 py-3 text-gray-500 hover:bg-gray-50 rounded-xl font-medium transition-all" href="#">
                    <span class="material-symbols-outlined text-xl opacity-60">bar_chart</span>
                    <span>Reportes</span>
                </a>
                <div class="pt-4 border-t border-gray-100 mt-4">
                    <a class="flex items-center space-x-3 px-4 py-3 text-gray-500 hover:bg-gray-50 rounded-xl font-medium transition-all" href="#">
                        <span class="material-symbols-outlined text-xl opacity-60">settings</span>
                        <span>Configuración</span>
                    </a>
                </div>
            </nav>
            <!-- Sidebar Footer: User Profile -->
            <div class="p-4 border-t border-gray-100">
                <div class="bg-gray-50 p-3 rounded-2xl flex items-center space-x-3">
                    <img alt="Carlos Rodriguez" class="w-10 h-10 rounded-full object-cover" src="https://lh3.googleusercontent.com/aida/ADBb0ujYO60_xe7nXQSFXwTxsMJDxFHC9kBymgpFFu4D2-RjOAG1iNTjYCbvfDrxol-u1N8R9PYDHA0UGO0GpLabyjHVkyvnPYgFL-Ig9_SdI0cZ00YLWoHxxlZ68VCm6de8ns3fIYgoqXJadcAjnUe5oE-pu4H-9J0l61LWi1VGbaEUW1P0zkthUjHaBwo7WDMynxIr70KDICuXov0-N17HqaUZMCSi-YxS7cOK4X0BUYp4MXtJq0LXGGqiLgg" />
                    <div class="overflow-hidden">
                        <p class="text-sm font-bold truncate">Carlos Rodriguez</p>
                        <p class="text-[11px] text-gray-400">Admin</p>
                    </div>
                </div>
            </div>
        </aside>
        <!-- END: Sidebar -->
        <!-- BEGIN: Main Content Area -->
        <main class="flex-1 flex flex-col h-full bg-main-content overflow-y-auto">
            <!-- BEGIN: Header -->
            <header class="flex items-center justify-between px-8 py-4 bg-transparent" data-purpose="top-header">
                <!-- Search Bar -->
                <div class="relative w-96">
                    <span class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                        <span class="material-symbols-outlined text-gray-400 text-lg">search</span>
                    </span>
                    <input class="block w-full pl-11 pr-4 py-2.5 bg-gray-100 border-none rounded-2xl text-sm focus:ring-2 focus:ring-blue-100 transition-all placeholder:text-gray-400" placeholder="Buscar pedidos, productos o clientes..." type="text" />
                </div>
                <!-- Right Header Tools -->
                <div class="flex items-center space-x-6">
                    <button class="relative p-1 text-gray-400 hover:text-gray-600 transition-colors">
                        <span class="material-symbols-outlined text-gray-400">notifications</span>
                        <span class="absolute top-0 right-0 block h-2 w-2 rounded-full bg-red-500 ring-2 ring-white"></span>
                    </button>
                    <button class="text-gray-400 hover:text-gray-600 transition-colors">
                        <span class="material-symbols-outlined text-gray-400">help_outline</span>
                    </button>
                    <div class="h-8 w-[1px] bg-gray-200"></div>
                    <div class="flex items-center space-x-3">
                        <div class="text-right">
                            <p class="text-xs font-bold">Panel Kepler</p>
                            <p class="text-[10px] text-gray-400">V2.4.0</p>
                        </div>
                        <div class="w-10 h-10 bg-kepler-blue text-white rounded-xl flex items-center justify-center font-bold text-sm">
                            K
                        </div>
                    </div>
                </div>
            </header>
            <!-- END: Header -->
            <!-- BEGIN: Dashboard Body -->
            <div class="px-8 pb-8 space-y-8">
                <!-- Welcome Section -->
                <div class="flex items-end justify-between">
                    <div>
                        <h2 class="text-3xl font-bold text-slate-800">Resumen General</h2>
                        <p class="text-gray-400 mt-1">Bienvenido el sistema de distribución Kepler. Aquí tienes los datos de hoy.</p>
                    </div>
                    <button class="bg-kepler-blue hover:bg-blue-900 text-white px-6 py-3 rounded-2xl flex items-center space-x-2 font-semibold text-sm transition-all shadow-lg shadow-blue-900/20">
                        <span class="material-symbols-outlined text-white text-sm">download</span>
                        <span>Generar Reporte</span>
                    </button>
                </div>
                <!-- BEGIN: Summary Cards -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                    <!-- Card 1: Ventas de Hoy -->
                    <div class="bg-white p-6 rounded-[2rem] shadow-sm border border-gray-50 relative">
                        <div class="flex items-start justify-between">
                            <div class="p-3 bg-blue-100 rounded-xl"><span class="material-symbols-outlined text-blue-500">payments</span></div>
                            <span class="text-[11px] font-bold text-emerald-500 bg-emerald-50 px-2.5 py-1 rounded-lg">+15%</span>
                        </div>
                        <div class="mt-4">
                            <p class="text-sm font-medium text-gray-400">Ventas de Hoy</p>
                            <h3 class="text-2xl font-black mt-1">$12,450.00</h3>
                        </div>
                    </div>
                    <!-- Card 2: Pedidos Activos -->
                    <div class="bg-white p-6 rounded-[2rem] shadow-sm border border-gray-50 relative">
                        <div class="flex items-start justify-between">
                            <div class="p-3 bg-purple-100 rounded-xl"><span class="material-symbols-outlined text-purple-500">inventory_2</span></div>
                            <span class="text-[11px] font-bold text-emerald-500 bg-emerald-50 px-2.5 py-1 rounded-lg">+5%</span>
                        </div>
                        <div class="mt-4">
                            <p class="text-sm font-medium text-gray-400">Pedidos Activos</p>
                            <h3 class="text-2xl font-black mt-1">84</h3>
                        </div>
                    </div>
                    <!-- Card 3: Productos Bajo Stock -->
                    <div class="bg-white p-6 rounded-[2rem] shadow-sm border border-gray-50 relative">
                        <div class="flex items-start justify-between">
                            <div class="p-3 bg-orange-100 rounded-xl"><span class="material-symbols-outlined text-orange-500">warning</span></div>
                            <div class="p-3 bg-orange-100 rounded-xl"><span class="material-symbols-outlined text-orange-500">warning</span></div>
                        </div>
                        <div class="mt-4">
                            <p class="text-sm font-medium text-gray-400">Productos Bajo Stock</p>
                            <h3 class="text-2xl font-black mt-1">12</h3>
                        </div>
                    </div>
                    <!-- Card 4: Clientes Registrados -->
                    <div class="bg-white p-6 rounded-[2rem] shadow-sm border border-gray-50 relative">
                        <div class="flex items-start justify-between">
                            <div class="p-3 bg-indigo-100 rounded-xl"><span class="material-symbols-outlined text-indigo-500">person_add</span></div>
                            <span class="text-[11px] font-bold text-emerald-500 bg-emerald-50 px-2.5 py-1 rounded-lg">+10%</span>
                        </div>
                        <div class="mt-4">
                            <p class="text-sm font-medium text-gray-400">Clientes Registrados</p>
                            <h3 class="text-2xl font-black mt-1">1,250</h3>
                        </div>
                    </div>
                </div>
                <!-- END: Summary Cards -->
                <!-- BEGIN: Charts & Featured Section -->
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                    <!-- Left: Sales Performance Chart -->
                    <div class="lg:col-span-2 bg-white p-8 rounded-[2.5rem] shadow-sm">
                        <div class="flex items-center justify-between mb-8">
                            <div>
                                <h4 class="text-xl font-bold">Rendimiento de Ventas</h4>
                                <p class="text-sm text-gray-400">Volumen de ventas semanal</p>
                            </div>
                            <div class="bg-gray-100 p-1 rounded-xl flex">
                                <button class="px-4 py-1.5 bg-white shadow-sm rounded-lg text-xs font-bold">Semana</button>
                                <button class="px-4 py-1.5 text-gray-400 text-xs font-bold hover:text-gray-600">Mes</button>
                                <button class="px-4 py-1.5 text-gray-400 text-xs font-bold hover:text-gray-600">Año</button>
                            </div>
                        </div>
                        <!-- Bar Graph Simulation -->
                        <div class="flex items-end justify-between h-48 px-2">
                            <div class="flex flex-col items-center group">
                                <div class="w-12 bg-blue-100 h-24 group-hover:bg-blue-200 transition-colors rounded-t-lg"></div>
                                <span class="text-[10px] font-bold text-gray-400 mt-3">LUN</span>
                            </div>
                            <div class="flex flex-col items-center group">
                                <div class="w-12 bg-blue-100 h-36 group-hover:bg-blue-200 transition-colors rounded-t-lg"></div>
                                <span class="text-[10px] font-bold text-gray-400 mt-3">MAR</span>
                            </div>
                            <div class="flex flex-col items-center group">
                                <div class="w-12 bg-blue-100 h-28 group-hover:bg-blue-200 transition-colors rounded-t-lg"></div>
                                <span class="text-[10px] font-bold text-gray-400 mt-3">MIE</span>
                            </div>
                            <div class="flex flex-col items-center group">
                                <div class="w-12 bg-blue-100 h-32 group-hover:bg-blue-200 transition-colors rounded-t-lg"></div>
                                <span class="text-[10px] font-bold text-gray-400 mt-3">JUE</span>
                            </div>
                            <div class="flex flex-col items-center group">
                                <div class="w-12 bg-kepler-blue h-44 shadow-lg shadow-blue-900/30 rounded-t-lg"></div>
                                <span class="text-[10px] font-bold text-slate-800 mt-3">VIE</span>
                            </div>
                            <div class="flex flex-col items-center group">
                                <div class="w-12 bg-blue-100 h-34 group-hover:bg-blue-200 transition-colors rounded-t-lg"></div>
                                <span class="text-[10px] font-bold text-gray-400 mt-3">SAB</span>
                            </div>
                            <div class="flex flex-col items-center group">
                                <div class="w-12 bg-blue-100 h-20 group-hover:bg-blue-200 transition-colors rounded-t-lg"></div>
                                <span class="text-[10px] font-bold text-gray-400 mt-3">DOM</span>
                            </div>
                        </div>
                    </div>
                    <!-- Right: Monthly Growth Card -->
                    <div class="bg-kepler-blue p-8 rounded-[2.5rem] shadow-xl text-white flex flex-col justify-between">
                        <div>
                            <h4 class="text-xl font-medium opacity-90">Crecimiento Mensual</h4>
                            <p class="text-xs opacity-60 mt-1">Basado en el mismo periodo el mes anterior.</p>
                            <div class="mt-8 flex items-center space-x-4">
                                <span class="text-5xl font-black">+24.8%</span>
                                <div class="bg-white/10 px-3 py-1.5 rounded-full flex items-center space-x-1.5">
                                    <span class="material-symbols-outlined text-white text-[12px]">trending_up</span>
                                    <span class="text-[10px] font-bold">Alto</span>
                                </div>
                            </div>
                        </div>
                        <div class="mt-12">
                            <p class="text-[10px] font-bold opacity-50 tracking-widest uppercase">Producto más vendido</p>
                            <div class="mt-4 flex items-center space-x-4 bg-white/10 p-4 rounded-2xl">
                                <div class="w-12 h-12 bg-white/10 rounded-xl flex items-center justify-center">
                                    <span class="material-symbols-outlined text-white opacity-80">local_cafe</span>
                                </div>
                                <div>
                                    <p class="font-bold text-sm">Cafd Premium Kepler</p>
                                    <p class="text-xs opacity-60">1,402 Unidades</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END: Charts & Featured Section -->
                <!-- BEGIN: Recent Orders Table -->
                <section class="bg-white rounded-[2.5rem] shadow-sm overflow-hidden border border-gray-50">
                    <div class="px-8 py-6 border-b border-gray-50">
                        <h4 class="font-bold">Pedidos Recientes</h4>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse">
                            <thead>
                                <tr class="text-[10px] font-bold text-gray-400 uppercase tracking-wider">
                                    <th class="px-8 py-4">ID Pedido</th>
                                    <th class="px-8 py-4">Cliente</th>
                                    <th class="px-8 py-4">Fecha</th>
                                    <th class="px-8 py-4">Total</th>
                                    <th class="px-8 py-4">Estado</th>
                                    <th class="px-8 py-4 text-right">Acciones</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-50">
                                <!-- Row 1 -->
                                <tr class="hover:bg-gray-50/50 transition-colors">
                                    <td class="px-8 py-4 text-sm font-bold">#ORD-9021</td>
                                    <td class="px-8 py-4">
                                        <div class="flex items-center space-x-3">
                                            <div class="w-8 h-8 rounded-full bg-blue-100 flex items-center justify-center text-[10px] font-bold text-blue-600">MA</div>
                                            <span class="text-sm font-medium">Maria Alarcon</span>
                                        </div>
                                    </td>
                                    <td class="px-8 py-4 text-sm text-gray-500">Oct 24, 2023</td>
                                    <td class="px-8 py-4 text-sm font-bold">$2,450.00</td>
                                    <td class="px-8 py-4">
                                        <span class="px-3 py-1 rounded-lg bg-emerald-100 text-emerald-700 text-[10px] font-bold tracking-wide">ENTREGADO</span>
                                    </td>
                                    <td class="px-8 py-4 text-right">
                                        <button class="text-gray-300 hover:text-gray-500">
                                            <span class="material-symbols-outlined text-gray-400">more_vert</span>
                                        </button>
                                    </td>
                                </tr>
                                <!-- Row 2 -->
                                <tr class="hover:bg-gray-50/50 transition-colors">
                                    <td class="px-8 py-4 text-sm font-bold">#ORD-9022</td>
                                    <td class="px-8 py-4">
                                        <div class="flex items-center space-x-3">
                                            <div class="w-8 h-8 rounded-full bg-purple-100 flex items-center justify-center text-[10px] font-bold text-purple-600">JR</div>
                                            <span class="text-sm font-medium">Juan Ramirez</span>
                                        </div>
                                    </td>
                                    <td class="px-8 py-4 text-sm text-gray-500">Oct 23, 2023</td>
                                    <td class="px-8 py-4 text-sm font-bold">$840.00</td>
                                    <td class="px-8 py-4">
                                        <span class="px-3 py-1 rounded-lg bg-orange-100 text-orange-700 text-[10px] font-bold tracking-wide">PENDIENTE</span>
                                    </td>
                                    <td class="px-8 py-4 text-right">
                                        <button class="text-gray-300 hover:text-gray-500">
                                            <span class="material-symbols-outlined text-gray-400">more_vert</span>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
                <!-- END: Recent Orders Table -->
            </div>
            <!-- END: Dashboard Body -->
        </main>
        <!-- END: Main Content Area -->
    <%--</form>--%>
</body>
</html>
