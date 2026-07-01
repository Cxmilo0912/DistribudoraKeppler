<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="Inventario.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.Inventario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

    <style>
        body, input, select, button {
            font-family: 'Outfit', sans-serif !important;
        }
        /* Custom scrollbar para la grilla o el body */
        ::-webkit-scrollbar {
            width: 6px;
        }

        ::-webkit-scrollbar-track {
            background: transparent;
        }

        ::-webkit-scrollbar-thumb {
            background: #cbd5e1;
            border-radius: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-7xl mx-auto space-y-6 py-4 px-2">

        <div class="bg-gradient-to-r from-[#001838] to-[#000b1a] rounded-2xl p-6 md:p-8 flex flex-col sm:flex-row items-center justify-between gap-4 shadow-xl shadow-blue-950/10 border border-slate-900/40">
            <div>
                <h2 class="text-2xl md:text-3xl font-bold text-white tracking-tight">Gestión de Productos</h2>
                <p class="text-sm text-slate-400 mt-1">Supervise y gestione el catálogo junto al inventario en tiempo real.</p>
            </div>
            <div class="flex flex-wrap items-center gap-3 w-full sm:w-auto justify-end">
                <button class="w-full sm:w-auto bg-blue-600 hover:bg-blue-500 text-white px-5 py-2.5 rounded-xl flex items-center justify-center gap-2 text-xs font-semibold shadow-lg shadow-blue-600/10 transition-all active:scale-[0.98] cursor-pointer">
                    <i class="fas fa-sync-alt"></i>Actualizar Stock
                </button>
                <button class="w-full sm:w-auto bg-slate-800 hover:bg-slate-700 text-slate-300 px-5 py-2.5 rounded-xl flex items-center justify-center gap-2 text-xs font-semibold border border-slate-700/40 transition-all cursor-pointer">
                    <i class="fas fa-download"></i>Exportar
                </button>
            </div>
        </div>

        <div class="bg-white p-5 rounded-2xl border border-slate-200/80 shadow-sm flex flex-col lg:flex-row items-center gap-4 justify-between">
            <div class="flex flex-col sm:flex-row items-center gap-3 w-full lg:flex-1">
                <div class="relative w-full sm:max-w-xs">
                    <i class="fas fa-search absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 text-xs"></i>
                    <input type="text" class="w-full pl-10 pr-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-xs text-slate-800 focus:outline-none focus:border-blue-600 focus:bg-white focus:ring-4 focus:ring-blue-600/10 transition-all" placeholder="Buscar por nombre, Codigo..." />
                </div>
                <div class="relative w-full sm:w-48">
                    <asp:DropDownList ID="ddlCat" runat="server" CssClass="w-full bg-white border border-slate-200 pl-4 pr-10 py-2.5 rounded-xl text-xs font-medium text-slate-700 appearance-none focus:outline-none focus:border-blue-600 transition-all cursor-pointer">
                    </asp:DropDownList>
                    <i class="fas fa-chevron-down absolute right-4 top-1/2 -translate-y-1/2 text-slate-400 pointer-events-none text-[10px]"></i>
                </div>
                <div class="relative w-full sm:w-48">
                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="w-full bg-white border border-slate-200 pl-4 pr-10 py-2.5 rounded-xl text-xs font-medium text-slate-700 appearance-none focus:outline-none focus:border-blue-600 transition-all cursor-pointer">

                    </asp:DropDownList>
                    <i class="fas fa-chevron-down absolute right-4 top-1/2 -translate-y-1/2 text-slate-400 pointer-events-none text-[10px]"></i>
                </div>
            </div>

            <div class="shrink-0 flex items-center justify-between w-full lg:w-auto bg-red-50/60 border border-red-100 px-4 py-2.5 rounded-xl gap-4">
                <div class="flex items-center gap-2 text-red-600">
                    <i class="fas fa-exclamation-triangle text-xs"></i>
                    <span class="text-xs font-bold uppercase tracking-wider">Ver Stock Bajo</span>
                </div>
                <label class="relative inline-flex items-center cursor-pointer">
                    <input type="checkbox" checked="checked" class="sr-only peer" />
                    <div class="w-9 h-5 bg-slate-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-slate-300 after:border after:rounded-full after:h-4 after:w-4 after:transition-all peer-checked:bg-red-500"></div>
                </label>
            </div>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-5">
            <!-- Pega aquí el ItemTemplate del Repeater -->
            <asp:Repeater ID="rptInventario" runat="server">
                <ItemTemplate>
                    <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden flex flex-col justify-between group hover:border-blue-500/30 hover:shadow-md transition-all duration-200">
                        <div class="p-4 space-y-3">
                            <div class="relative w-full h-40 bg-slate-50 rounded-xl overflow-hidden flex items-center justify-center border border-slate-100">
                                <img src="<%# Eval("Imagen") %>" alt='<%# Eval("Nombre") %>' class="max-h-full max-w-full object-contain p-2 group-hover:scale-105 transition-transform duration-300" />
                                <span class="absolute top-2 left-2 px-2.5 py-1 bg-blue-50 text-blue-600 text-[10px] font-bold rounded-lg uppercase tracking-wide border border-blue-100/50">
                                    <%# Eval("CategoriaNombre") %>
                                </span>
                                <button type="button" class="absolute top-2 right-2 text-slate-400 hover:text-slate-600 bg-white/80 backdrop-blur-sm w-7 h-7 rounded-lg flex items-center justify-center border border-slate-200/40 transition-colors">
                                    <i class="fas fa-ellipsis-v text-xs"></i>
                                </button>
                            </div>
                            <div>
                                <p class="text-xs font-medium text-slate-400"><%# Eval("MarcaNombre") %></p>
                                <h4 class="font-bold text-slate-800 text-sm truncate mt-0.5"><%# Eval("Nombre") %></h4>
                                <p class="text-[11px] text-slate-400 font-mono mt-0.5">SKU: <%# Eval("CodigoProducto") %></p>
                            </div>
                        </div>
                        <div class="px-4 py-3 bg-slate-50/80 border-t border-slate-100 flex items-center justify-between">
                            <div>
                                <p class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Existencias</p>
                                <p class="text-sm font-bold text-slate-800 mt-0.5"><%# Eval("Stock") %> <span class="text-xs font-normal text-slate-400">unid.</span></p>
                            </div>
                            <span class="inline-flex items-center gap-1 px-2.5 py-1 bg-blue-100 text-blue-700 text-[9px] font-bold rounded-md uppercase tracking-wide"></span>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="bg-white p-4 rounded-2xl border border-slate-200/80 shadow-sm flex items-center justify-between">
            <p class="text-slate-400 text-xs font-medium">Mostrando 4 de 128 productos</p>
            <div class="flex items-center gap-1">
                <button class="w-8 h-8 flex items-center justify-center rounded-xl border border-slate-200 text-slate-400 hover:bg-slate-50 transition-colors cursor-pointer">
                    <i class="fas fa-chevron-left text-[10px]"></i>
                </button>
                <div class="px-3 py-1 text-xs font-bold text-slate-700">
                    1 / 32
                </div>
                <button class="w-8 h-8 flex items-center justify-center rounded-xl border border-slate-200 text-slate-400 hover:bg-slate-50 transition-colors cursor-pointer">
                    <i class="fas fa-chevron-right text-[10px]"></i>
                </button>
            </div>
        </div>

    </div>
    <script src="../Assets/js/Inventario.js?v=1.0"></script>
</asp:Content>
