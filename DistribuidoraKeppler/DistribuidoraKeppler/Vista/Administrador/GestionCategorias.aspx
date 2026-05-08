<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="GestionCategorias.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.GestionCategorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Gestión de Categorías - InventoryPro</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.8/css/jquery.dataTables.min.css">
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "on-secondary-fixed": "#161c22",
                        "surface-container-high": "#e6e8ea",
                        "primary-fixed-dim": "#aec7fc",
                        "secondary-fixed": "#dde3eb",
                        "on-primary-container": "#718abb",
                        "secondary": "#595f66",
                        "error-container": "#ffdad6",
                        "surface-tint": "#465e8d",
                        "inverse-surface": "#2d3133",
                        "on-tertiary-fixed-variant": "#404754",
                        "surface-container-highest": "#e0e3e5",
                        "surface-dim": "#d8dadc",
                        "primary-fixed": "#d7e2ff",
                        "on-primary-fixed": "#001a40",
                        "on-primary": "#ffffff",
                        "secondary-container": "#dde3eb",
                        "on-secondary-fixed-variant": "#41474e",
                        "tertiary-container": "#1c232f",
                        "surface-container-lowest": "#ffffff",
                        "outline": "#747780",
                        "on-secondary": "#ffffff",
                        "on-error-container": "#93000a",
                        "on-tertiary": "#ffffff",
                        "tertiary-fixed-dim": "#c0c7d6",
                        "primary-container": "#00214d",
                        "on-tertiary-fixed": "#151c27",
                        "surface-container": "#eceef0",
                        "on-primary-fixed-variant": "#2d4674",
                        "on-secondary-container": "#5f656c",
                        "surface-container-low": "#f2f4f6",
                        "tertiary": "#060d18",
                        "on-background": "#191c1e",
                        "surface-variant": "#e0e3e5",
                        "error": "#ba1a1a",
                        "background": "#f7f9fb",
                        "on-tertiary-container": "#838a99",
                        "tertiary-fixed": "#dce2f3",
                        "inverse-primary": "#aec7fc",
                        "surface": "#f7f9fb",
                        "secondary-fixed-dim": "#c1c7cf",
                        "on-surface": "#191c1e",
                        "primary": "#000b23",
                        "on-error": "#ffffff",
                        "surface-bright": "#f7f9fb",
                        "on-surface-variant": "#44474f",
                        "outline-variant": "#c4c6d0",
                        "inverse-on-surface": "#eff1f3"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "full": "9999px"
                    },
                    "spacing": {
                        "table-row-padding": "1.25rem",
                        "inline-gap": "1rem",
                        "stack-gap": "1.5rem",
                        "container-padding": "2rem"
                    },
                    "fontFamily": {
                        "body-md": ["Inter"],
                        "body-sm": ["Inter"],
                        "label-caps": ["Inter"],
                        "headline-md": ["Inter"],
                        "headline-lg": ["Inter"]
                    },
                    "fontSize": {
                        "body-md": ["14px", { "lineHeight": "20px", "fontWeight": "400" }],
                        "body-sm": ["13px", { "lineHeight": "18px", "fontWeight": "400" }],
                        "label-caps": ["11px", { "lineHeight": "16px", "letterSpacing": "0.05em", "fontWeight": "700" }],
                        "headline-md": ["18px", { "lineHeight": "24px", "fontWeight": "600" }],
                        "headline-lg": ["24px", { "lineHeight": "32px", "fontWeight": "700" }]
                    }
                },
            },
        }
    </script>
    <script>
        function abrirModal() {
            document.getElementById('modalCategoria').classList.remove('hidden');
        }

        function cerrarModal() {
            document.getElementById('modalCategoria').classList.add('hidden');
        }
    </script>
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            display: inline-block;
            vertical-align: middle;
        }

        /*PARTE EDITADA POR JHON*/
        .dataTables_wrapper .dataTables_paginate {
            margin-top: 20px;
        }

            .dataTables_wrapper .dataTables_paginate .paginate_button {
                border-radius: 10px !important;
                border: 1px solid #E2E8F0 !important;
                margin: 0 4px;
                background: white !important;
                color: #475569 !important;
            }

                .dataTables_wrapper .dataTables_paginate .paginate_button.current {
                    background: #00214D !important;
                    color: white !important;
                    border: none !important;
                }

                .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
                    background: #F8FAFC !important;
                    color: #00214D !important;
                }

                .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
                    color: white !important;
                }
        /*PARTE EDITADA POR JHON-FIN*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Main Content Canvas -->

    <main>
        <section class="p-container-padding max-w-7xl mx-auto w-full flex flex-col gap-stack-gap">
            <!-- Page Header -->
            <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h2 class="text-headline-lg font-headline-lg text-[#00214D]">Gestión de Categorías</h2>
                    <p class="text-body-md font-body-md text-slate-500">Organiza y administra las agrupaciones de tus productos.</p>
                </div>
                <button type="button" onclick="abrirModal()" class="bg-primary-container text-white px-6 py-2.5 rounded-lg font-body-md font-semibold flex items-center gap-2 shadow-sm hover:opacity-90 active:scale-[0.98] transition-all">
                    <span class="material-symbols-outlined text-sm">add</span>
                    Agregar Categoría
                </button>
            </div>

            <%-- PARTE EDITADA POR JOHN- INICIO --%>
            <!-- Search Section -->
            <div class="w-full">
                <div class="relative group">
                    <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                        <span class="material-symbols-outlined text-slate-400 group-focus-within:text-primary-container transition-colors" data-icon="search">search</span>
                    </div>
                    <input class="w-full bg-white border border-[#E2E8F0] rounded-xl py-4 pl-12 pr-4 focus:ring-2 focus:ring-[#00214D]/10 focus:border-[#00214D] outline-none transition-all shadow-sm font-body-md" placeholder="Buscar categoría por nombre..." type="text" />
                </div>
            </div>
            <!-- Content Card (Table) -->
            <div class="bg-white rounded-xl border border-[#E2E8F0] shadow-[0px_4px_12px_rgba(0,0,0,0.05)] overflow-hidden">
                <div class="overflow-x-auto">
                    <table id="example" class="w-full text-left border-collapse">
                        <thead class="bg-slate-50/50 border-b border-[#E2E8F0]">
                            <tr>
                                <th class="px-6 py-4 text-label-caps font-label-caps text-slate-500 uppercase tracking-wider">NOMBRE DE LA CATEGORÍA</th>
                                <th class="px-6 py-4 text-label-caps font-label-caps text-slate-500 uppercase tracking-wider">DESCRIPCIÓN</th>
                                <th class="px-6 py-4 text-label-caps font-label-caps text-slate-500 uppercase tracking-wider">PRODUCTOS</th>
                                <th class="px-6 py-4 text-label-caps font-label-caps text-slate-500 uppercase tracking-wider text-right">ACCIONES</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-[#E2E8F0]">
                            <%foreach (var item in lista)
                                {  %>
                            <!-- Row 1 -->
                            <tr class="hover:bg-slate-50/50 transition-colors">

                                <td class="px-6 py-table-row-padding">
                                    <div class="flex items-center gap-4">
                                        <div class="h-10 w-10 bg-slate-100 rounded-lg flex items-center justify-center text-slate-600">
                                            <span class="material-symbols-outlined" data-icon="coffee">coffee</span>
                                        </div>
                                        <span class="font-body-md font-bold text-[#00214D]"><%=item.Nombre%></span>
                                    </div>
                                </td>
                                <td class="px-6 py-table-row-padding text-body-md text-slate-600"><%=item.Descripcion%></td>
                                <td class="px-6 py-table-row-padding">
                                    <span class="inline-flex items-center px-3 py-1 bg-[#d7e2ff] text-[#00214d] text-xs font-semibold rounded-full"><%=item.TotalProductos%> Productos
                                    </span>
                                </td>
                                <td class="px-6 py-table-row-padding text-right">
                                    <div class="flex justify-end gap-2">
                                        <button class="p-2 text-slate-400 hover:text-[#00214D] hover:bg-slate-100 rounded-lg transition-colors">
                                            <span class="material-symbols-outlined" data-icon="edit">edit</span>
                                        </button>
                                        <button class="p-2 text-slate-400 hover:text-error hover:bg-error-container/20 rounded-lg transition-colors">
                                            <span class="material-symbols-outlined" data-icon="delete">delete</span>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <%} %>
                        </tbody>
                        <%-- PARTE EDITADA POR JOHN- FIN --%>
                    </table>
                </div>
            </div>
            <!-- Bento Info Section (Optional Visual Flare) -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="md:col-span-2 p-6 bg-[#00214D] text-white rounded-2xl flex flex-col justify-between min-h-[160px] relative overflow-hidden">
                    <div class="z-10">
                        <h3 class="text-headline-md mb-2">Resumen de Inventario</h3>
                        <p class="text-slate-300 max-w-md">Optimiza la distribución de tus productos categorizando eficientemente según la demanda estacional.</p>
                    </div>
                    <div class="z-10 mt-4 flex gap-4">
                        <div class="bg-white/10 backdrop-blur-md p-3 rounded-xl">
                            <span class="block text-xl font-bold">12</span>
                            <span class="text-[10px] uppercase tracking-wider text-slate-400">Total Categorías</span>
                        </div>
                        <div class="bg-white/10 backdrop-blur-md p-3 rounded-xl">
                            <span class="block text-xl font-bold">342</span>
                            <span class="text-[10px] uppercase tracking-wider text-slate-400">Total Productos</span>
                        </div>
                    </div>
                    <!-- Decorative element -->
                    <div class="absolute -right-10 -bottom-10 w-48 h-48 bg-white/5 rounded-full blur-3xl"></div>
                </div>
                <div class="p-6 bg-white border border-[#E2E8F0] rounded-2xl flex flex-col items-center justify-center text-center shadow-sm">
                    <div class="w-12 h-12 bg-slate-100 rounded-full flex items-center justify-center mb-3">
                        <span class="material-symbols-outlined text-[#00214D]" data-icon="auto_awesome">auto_awesome</span>
                    </div>
                    <h4 class="font-bold text-[#00214D] mb-1">Auto-Clasificación</h4>
                    <p class="text-body-sm text-slate-500">¿Deseas activar la clasificación inteligente por IA?</p>
                    <button class="mt-4 text-[#00214D] font-semibold text-xs uppercase tracking-widest hover:underline">Configurar</button>
                </div>
            </div>
        </section>
    </main>
    <div id="modalCategoria" class="fixed inset-0 z-[100] flex items-center justify-center bg-black/60 hidden backdrop-blur-sm p-4">
        <div class="bg-white rounded-2xl shadow-2xl w-full max-w-md overflow-hidden transform transition-all">
            <div class="flex items-center justify-between px-6 py-4 border-b border-slate-100 bg-white">
                <h3 class="text-headline-md font-bold text-[#00214D]">Crear Nueva Categoría</h3>
                <button type="button" onclick="cerrarModal()" class="text-slate-400 hover:text-slate-600 transition-colors">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>

            <div class="p-6 flex flex-col gap-5">
                <div class="space-y-1">
                    <label class="text-body-sm font-bold text-slate-700 uppercase tracking-wider">Nombre de la Categoría</label>
                    <asp:TextBox ID="txtNombreCat" runat="server" CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl py-3 px-4 focus:ring-2 focus:ring-[#00214D]/10 focus:border-[#00214D] outline-none transition-all" placeholder="Ej. Electrónicos"></asp:TextBox>
                </div>
                <div class="px-6 py-4 bg-slate-50 flex justify-end gap-3">
                    <button type="button" onclick="cerrarModal()" class="px-4 py-2 text-slate-500 font-semibold hover:text-slate-700 transition-all">Cancelar</button>
                    <asp:Button ID="btnGuardarCat" runat="server" Text="Guardar Categoría" OnClick="btnGuardarCat_Click"
                        CssClass="bg-[#00214D] text-white px-6 py-2 rounded-lg font-semibold shadow-md hover:opacity-90 active:scale-95 transition-all cursor-pointer" />
                </div>
            </div>
        </div>
    </div>

    <%-- PARTE EDITADA POR JOHN- INICIO --%>
    <script>
        $(document).ready(function () {
            var table = $('#example').DataTable({
                searching: true,
                paging: true,
                info: false,

                pageLength: 5,

                dom: 'rtp',



                language: {
                    paginate: { previous: "Anterior", next: "Siguiente" }
                },
                drawCallback: function () {
                    $('.dataTables_paginate').addClass('flex justify-end mt-4');
                }
            });

            $('input[placeholder="Buscar categoría por nombre..."]').on('keyup input', function () {
                table.search($(this).val()).draw();
            });
        });
    </script>
    <%-- PARTE EDITADA POR JOHN- FIN --%>
</asp:Content>
