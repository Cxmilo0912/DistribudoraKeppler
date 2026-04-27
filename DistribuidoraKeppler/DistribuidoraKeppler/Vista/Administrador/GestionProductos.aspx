<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="GestionProductos.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Aministrador.GestionPeoductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Gestión de Productos - Kepler Admin</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "background": "#f8f9fa",
                        "surface-bright": "#f8f9fa",
                        "outline": "#757780",
                        "on-primary-fixed": "#001847",
                        "on-tertiary": "#ffffff",
                        "tertiary": "#0c0100",
                        "surface-tint": "#495d90",
                        "primary-fixed": "#dae2ff",
                        "on-secondary-container": "#5b6278",
                        "tertiary-fixed-dim": "#ffb59e",
                        "secondary-fixed": "#dbe2fc",
                        "secondary-container": "#d8dff9",
                        "on-surface-variant": "#44464f",
                        "error-container": "#ffdad6",
                        "surface-container-highest": "#e1e3e4",
                        "on-background": "#191c1d",
                        "surface-container-high": "#e7e8e9",
                        "tertiary-fixed": "#ffdbd0",
                        "surface-container-lowest": "#ffffff",
                        "on-tertiary-fixed": "#390b00",
                        "surface-dim": "#d9dadb",
                        "surface-container": "#edeeef",
                        "error": "#ba1a1a",
                        "surface-container-low": "#f3f4f5",
                        "inverse-on-surface": "#f0f1f2",
                        "inverse-surface": "#2e3132",
                        "on-secondary": "#ffffff",
                        "on-secondary-fixed-variant": "#3f465b",
                        "primary-container": "#001a4b",
                        "on-tertiary-container": "#bd725a",
                        "on-error": "#ffffff",
                        "outline-variant": "#c5c6d0",
                        "tertiary-container": "#3c0d01",
                        "on-tertiary-fixed-variant": "#723522",
                        "on-error-container": "#93000a",
                        "on-primary-fixed-variant": "#314577",
                        "on-primary": "#ffffff",
                        "primary-fixed-dim": "#b2c5ff",
                        "surface": "#f8f9fa",
                        "primary": "#000311",
                        "on-surface": "#191c1d",
                        "on-primary-container": "#7084ba",
                        "secondary-fixed-dim": "#bfc6df",
                        "secondary": "#575e74",
                        "surface-variant": "#e1e3e4",
                        "on-secondary-fixed": "#141b2e",
                        "inverse-primary": "#b2c5ff"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.125rem",
                        "lg": "0.25rem",
                        "xl": "0.5rem",
                        "full": "0.75rem"
                    },
                    "fontFamily": {
                        "headline": ["Inter"],
                        "body": ["Inter"],
                        "label": ["Inter"]
                    }
                }
            }
        }
    </script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Header Section -->
    <header class="flex justify-between items-center w-full px-12 py-8 bg-surface">
        <div>
            <h2 class="text-3xl font-black text-primary-container tracking-tight">Gestión de Productos</h2>
            <div class="flex items-center gap-2 mt-1">
                <span class="text-sm text-on-secondary-container font-medium uppercase tracking-widest">Inventario</span>
                <span class="text-slate-300">/</span>
                <span class="text-sm text-slate-500">Catálogo</span>
            </div>
        </div>
        <div class="flex items-center gap-4">
            <asp:LinkButton ID="btnCrearProducto" runat="server"
                OnClick="btnCrearProducto_Click"
                CssClass="flex items-center gap-2 px-6 py-3 bg-primary-container text-white rounded-md font-semibold text-sm hover:opacity-90 transition-all">
    <span class="material-symbols-outlined text-sm">add</span>
    Crear producto
            </asp:LinkButton>
        </div>
    </header>
    <!-- Filters & Navigation -->
    <section class="px-12 pb-6 space-y-6">
        <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
            <div class="relative flex-1 max-w-xl">
                <span class="material-symbols-outlined absolute left-4 top-1/2 -translate-y-1/2 text-slate-400">search</span>
                <input class="w-full pl-12 pr-4 py-3 bg-surface-container-lowest border border-outline-variant/20 rounded-lg text-sm focus:ring-1 focus:ring-primary-container focus:border-primary-container outline-none transition-all" placeholder="Buscar por nombre, SKU o marca..." type="text" />
            </div>
            <div class="flex items-center gap-3">
                <button type="button" class="flex items-center gap-2 px-4 py-2.5 bg-surface-container-lowest border border-outline-variant/20 text-on-surface-variant rounded-lg text-sm font-medium hover:bg-surface-container-low transition-all">
                    <span class="material-symbols-outlined text-sm">filter_list</span>
                    Filtros Avanzados
                </button>
                <button type="button" class="flex items-center gap-2 px-4 py-2.5 bg-surface-container-lowest border border-outline-variant/20 text-on-surface-variant rounded-lg text-sm font-medium hover:bg-surface-container-low transition-all">
                    <span class="material-symbols-outlined text-sm">download</span>
                    Exportar
                </button>
            </div>
        </div>
        <!-- Categories Pills -->
        <div class="flex items-center gap-2 overflow-x-auto pb-2 scrollbar-hide">
            <button type="button" class="px-5 py-2 rounded-full bg-primary-container text-white text-xs font-bold uppercase tracking-wider">Todos</button>
            <button type="button" class="px-5 py-2 rounded-full bg-surface-container-lowest border border-outline-variant/20 text-slate-600 text-xs font-bold uppercase tracking-wider hover:bg-surface-container-low transition-all">Bebidas</button>
            <button type="button" class="px-5 py-2 rounded-full bg-surface-container-lowest border border-outline-variant/20 text-slate-600 text-xs font-bold uppercase tracking-wider hover:bg-surface-container-low transition-all">Cuidado del hogar</button>
            <button type="button" class="px-5 py-2 rounded-full bg-surface-container-lowest border border-outline-variant/20 text-slate-600 text-xs font-bold uppercase tracking-wider hover:bg-surface-container-low transition-all">Cuidado personal</button>
            <button type="button" class="px-5 py-2 rounded-full bg-surface-container-lowest border border-outline-variant/20 text-slate-600 text-xs font-bold uppercase tracking-wider hover:bg-surface-container-low transition-all">Confitería y snacks</button>
            <button type="button" class="px-5 py-2 rounded-full bg-surface-container-lowest border border-outline-variant/20 text-slate-600 text-xs font-bold uppercase tracking-wider hover:bg-surface-container-low transition-all">Abarrotes</button>
        </div>
    </section>
    <!-- Product Table Canvas -->
    <section class="px-12 flex-1">
        <div class="bg-surface-container-lowest rounded-xl overflow-hidden shadow-[0_4px_24px_rgba(0,0,0,0.03)] border border-outline-variant/10">
            <table class="w-full text-left border-collapse">
                <thead>
                    <tr class="bg-surface-container-low border-b border-outline-variant/10">
                        <th class="px-6 py-4 text-[11px] font-extrabold text-slate-500 uppercase tracking-widest">Producto</th>
                        <th class="px-6 py-4 text-[11px] font-extrabold text-slate-500 uppercase tracking-widest">Marca</th>
                        <th class="px-6 py-4 text-[11px] font-extrabold text-slate-500 uppercase tracking-widest">Categoría</th>
                        <th class="px-6 py-4 text-[11px] font-extrabold text-slate-500 uppercase tracking-widest text-right">Precio</th>
                        <th class="px-6 py-4 text-[11px] font-extrabold text-slate-500 uppercase tracking-widest text-center">Stock</th>
                        <th class="px-6 py-4 text-[11px] font-extrabold text-slate-500 uppercase tracking-widest text-right">Acciones</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-outline-variant/5">
                    <asp:Repeater ID="rpProductos" runat="server">
                        <ItemTemplate>
                            <tr class="hover:bg-surface-container-low/50 transition-all group">
                                <td class="px-6 py-4">
                                    <div class="flex items-center gap-4">
                                        <div class="w-12 h-12 rounded-lg bg-surface-container-low flex items-center justify-center overflow-hidden border border-outline-variant/10">
                                            <span class="material-symbols-outlined text-slate-300">inventory_2</span>
                                        </div>
                                        <div class="flex flex-col">
                                            <span class="text-sm font-bold text-primary-container"><%# Eval("Nombre") %></span>
                                            <span class="text-[11px] text-slate-400">ID: <%# Eval("Id") %></span>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm text-slate-600 font-medium"><%# Eval("MarcaNombre") %></td>
                                <td class="px-6 py-4">
                                    <span class="px-3 py-1 bg-secondary-container/50 text-on-secondary-container text-[10px] font-bold uppercase rounded-full">
                                        <%# Eval("CategoriaNombre") %>
                                    </span>
                                </td>
                                <td class="px-6 py-4 text-sm font-bold text-primary-container text-right">$ <%# string.Format("{0:N0}", Eval("Precio")) %>
                                </td>
                                <td class="px-6 py-4 text-center">
                                    <div class='inline-flex items-center justify-center px-2 py-1 rounded-md <%# Convert.ToInt32(Eval("Stock")) <= Convert.ToInt32(Eval("LimiteMinimo")) ? "bg-error-container/30 text-error" : "bg-surface-container-low text-on-surface" %>'>
                                        <span class="text-xs font-bold"><%# Eval("Stock") %></span>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-right">
                                    <div class="flex items-center justify-end gap-2">
                                        <asp:LinkButton runat="server" CommandArgument='<%# Eval("Id") %>' CssClass="p-2 text-slate-400 hover:text-primary-container transition-colors">
                        <span class="material-symbols-outlined text-lg">edit</span>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server" CommandArgument='<%# Eval("Id") %>' OnClientClick="return confirm('¿Está seguro de eliminar?');" CssClass="p-2 text-slate-400 hover:text-error transition-colors">
                        <span class="material-symbols-outlined text-lg">delete</span>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
            <!-- Pagination -->
            <div class="flex items-center justify-between px-8 py-4 bg-surface-container-low/30">
                <span class="text-xs font-medium text-slate-500 uppercase tracking-tighter">Mostrando 1 a 6 de 1,245 productos</span>
                <div class="flex items-center gap-1">
                    <button type="button" class="p-2 text-slate-400 hover:bg-white rounded-md transition-all"><span class="material-symbols-outlined text-base">chevron_left</span></button>
                    <button type="button" class="w-8 h-8 flex items-center justify-center rounded-md bg-primary-container text-white text-xs font-bold shadow-md">1</button>
                    <button type="button" class="w-8 h-8 flex items-center justify-center rounded-md hover:bg-white text-slate-600 text-xs font-bold transition-all">2</button>
                    <button type="button" class="w-8 h-8 flex items-center justify-center rounded-md hover:bg-white text-slate-600 text-xs font-bold transition-all">3</button>
                    <span class="px-2 text-slate-400 text-xs">...</span>
                    <button type="button" class="w-8 h-8 flex items-center justify-center rounded-md hover:bg-white text-slate-600 text-xs font-bold transition-all">208</button>
                    <button type="button" class="p-2 text-slate-400 hover:bg-white rounded-md transition-all"><span class="material-symbols-outlined text-base">chevron_right</span></button>
                </div>
            </div>
        </div>
    </section>
    <!-- Summary Cards Footer -->
    <footer class="px-12 py-10 grid grid-cols-1 md:grid-cols-3 gap-6">
        <div class="bg-primary-container text-white p-8 rounded-xl flex flex-col gap-1 shadow-sm relative overflow-hidden group">
            <div class="absolute -right-4 -bottom-4 opacity-10 group-hover:scale-110 transition-transform duration-700">
                <span class="material-symbols-outlined text-9xl">inventory_2</span>
            </div>
            <span class="text-[11px] font-black uppercase tracking-[0.2em] opacity-60">TOTAL PRODUCTOS</span>

            <asp:Label ID="lblTotalProductos" runat="server" CssClass="text-4xl font-extrabold tracking-tight" Text="0"></asp:Label>
        </div>

        <div class="bg-surface-container-lowest border border-outline-variant/10 p-8 rounded-xl flex flex-col gap-1 shadow-sm relative overflow-hidden">
        </div>

        <div class="bg-surface-container-lowest border border-outline-variant/10 p-8 rounded-xl flex flex-col gap-1 shadow-sm relative overflow-hidden">
        </div>
    </footer>
    
</asp:Content>
