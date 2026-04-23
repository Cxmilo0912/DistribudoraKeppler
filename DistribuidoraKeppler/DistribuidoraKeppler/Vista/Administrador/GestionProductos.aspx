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
    <main class="ml-72 flex-1 min-h-screen flex flex-col">
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
                        <!-- Row 1 -->
                        <tr class="hover:bg-surface-container-low/50 transition-all group">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-4">
                                    <div class="w-12 h-12 rounded-lg bg-surface-container-low flex items-center justify-center overflow-hidden border border-outline-variant/10">
                                        <img class="w-full h-full object-cover" data-alt="bottle of classic red coca-cola 2.5 liters on a clean studio background with soft lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCxgHxh7WZzrKf98BqScRxKzkfbA9pmv37yI47H2lbCp58rZFjb6T32jTC4SI4tYlgEhBZr0jSHIs2dOnKbWDPYgeCKB0PZL4lk0xt9PtnQltqCshTkqbol5lCLn_-4H7xjpLByL11xFHD2mln_jKujSukBaYh279PnlD5VoYRAFfZoviOBugut0zU0kFmzffrTURl-uNZiiKHCwaGg--Mpkx23356rt0P6PY7Fvfm027JeDP-HQsAflk5bCd6vEUCYeeJqULcsgMk" />
                                    </div>
                                    <div class="flex flex-col">
                                        <span class="text-sm font-bold text-primary-container">Coca Cola Original 2.5L</span>
                                        <span class="text-[11px] text-slate-400">SKU: BEB-001-25</span>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-sm text-slate-600 font-medium">Coca-Cola</td>
                            <td class="px-6 py-4">
                                <span class="px-3 py-1 bg-secondary-container/50 text-on-secondary-container text-[10px] font-bold uppercase rounded-full">Bebidas</span>
                            </td>
                            <td class="px-6 py-4 text-sm font-bold text-primary-container text-right">$ 7,800</td>
                            <td class="px-6 py-4 text-center">
                                <div class="inline-flex items-center justify-center px-2 py-1 bg-surface-container-low rounded-md">
                                    <span class="text-xs font-bold text-on-surface">450</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-right">
                                <div class="flex items-center justify-end gap-2">
                                    <button class="p-2 text-slate-400 hover:text-primary-container transition-colors"><span class="material-symbols-outlined text-lg">edit</span></button>
                                    <button class="p-2 text-slate-400 hover:text-error transition-colors"><span class="material-symbols-outlined text-lg">delete</span></button>
                                </div>
                            </td>
                        </tr>
                        <!-- Row 2 -->
                        <tr class="hover:bg-surface-container-low/50 transition-all group">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-4">
                                    <div class="w-12 h-12 rounded-lg bg-surface-container-low flex items-center justify-center overflow-hidden border border-outline-variant/10">
                                        <img class="w-full h-full object-cover" data-alt="stack of oreo cookies with blue packaging on a white studio background high contrast" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDF6uEnZ1D7iAiQFuk3Vb-237ZjG3WdcWz7nikrw1CTlAJhvpJzKnLPc8fR4cMqI8v6HVc7NH9rb8Uhla3aDxND6U462ukvOfxi7N7aEVT8CnxResCNJOLxT6Hj7YQoqc1frU3z4GBB6Z15G_Y3LEJ-vtxP-NFF5iQ4u0IyURQiPwpkB2GaZq13Zo29JqfzbbI_6Tq_7tioghA8jmif1h7Bs2PceMGl5KxP1gdOhuDoFW1wnc5dlYtZE7A8a6QkPquD_l5hHlEW9kM" />
                                    </div>
                                    <div class="flex flex-col">
                                        <span class="text-sm font-bold text-primary-container">Galletas Oreo Original x12</span>
                                        <span class="text-[11px] text-slate-400">SKU: SNK-042-X12</span>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-sm text-slate-600 font-medium">Nabisco</td>
                            <td class="px-6 py-4">
                                <span class="px-3 py-1 bg-tertiary-fixed-dim/30 text-on-tertiary-fixed-variant text-[10px] font-bold uppercase rounded-full">Confitería</span>
                            </td>
                            <td class="px-6 py-4 text-sm font-bold text-primary-container text-right">$ 5,200</td>
                            <td class="px-6 py-4 text-center">
                                <div class="inline-flex items-center justify-center px-2 py-1 bg-surface-container-low rounded-md">
                                    <span class="text-xs font-bold text-on-surface">1,200</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-right">
                                <div class="flex items-center justify-end gap-2">
                                    <button class="p-2 text-slate-400 hover:text-primary-container transition-colors"><span class="material-symbols-outlined text-lg">edit</span></button>
                                    <button class="p-2 text-slate-400 hover:text-error transition-colors"><span class="material-symbols-outlined text-lg">delete</span></button>
                                </div>
                            </td>
                        </tr>
                        <!-- Row 3 -->
                        <tr class="hover:bg-surface-container-low/50 transition-all group">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-4">
                                    <div class="w-12 h-12 rounded-lg bg-surface-container-low flex items-center justify-center overflow-hidden border border-outline-variant/10">
                                        <img class="w-full h-full object-cover" data-alt="liquid detergent in a blue plastic container on a shelf with clean lighting" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCWfuBC3hQ-VwIim0ty77t84vqu1cuaqBINUOntDn-8RMHMoVZrhwPmaB1ldWatewhhp88M0evEeG_LwO-gxMPORt3LRg8UG5n1wC0FaaRB8Okrtaulj1CYp3sLsX1rIdS1SnSFoOu_fh1qK9D62L5b9rsZxNIDEGmFu73OpuaSMC7BwCx4WfalATXGbs9DDy9bYhbRsPJot9yppKWPZaHoobymihZu1ddpuFtn3QdNAzxT6CYBP4IqUgpchln0-jBglGymEM7aoOQ" />
                                    </div>
                                    <div class="flex flex-col">
                                        <span class="text-sm font-bold text-primary-container">Detergente Ariel Líquido 2L</span>
                                        <span class="text-[11px] text-slate-400">SKU: HOG-099-2L</span>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-sm text-slate-600 font-medium">P&amp;G</td>
                            <td class="px-6 py-4">
                                <span class="px-3 py-1 bg-surface-container-high text-slate-700 text-[10px] font-bold uppercase rounded-full">Cuidado del hogar</span>
                            </td>
                            <td class="px-6 py-4 text-sm font-bold text-primary-container text-right">$ 32,500</td>
                            <td class="px-6 py-4 text-center">
                                <div class="inline-flex items-center justify-center px-2 py-1 bg-error-container/30 rounded-md">
                                    <span class="text-xs font-extrabold text-error">8</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-right">
                                <div class="flex items-center justify-end gap-2">
                                    <button class="p-2 text-slate-400 hover:text-primary-container transition-colors"><span class="material-symbols-outlined text-lg">edit</span></button>
                                    <button class="p-2 text-slate-400 hover:text-error transition-colors"><span class="material-symbols-outlined text-lg">delete</span></button>
                                </div>
                            </td>
                        </tr>
                        <!-- Row 4 -->
                        <tr class="hover:bg-surface-container-low/50 transition-all group">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-4">
                                    <div class="w-12 h-12 rounded-lg bg-surface-container-low flex items-center justify-center overflow-hidden border border-outline-variant/10">
                                        <img class="w-full h-full object-cover" data-alt="large bag of premium white rice on a rustic table with scattered grains around it" src="https://lh3.googleusercontent.com/aida-public/AB6AXuD5YNvRsCKoDv8p_vAU4-RSGqHHaZTmLHQmeTrJNcdaE1pynvm1lf7Vld_zq6Gh1itYR5AslmY1UASYL5hN8jcFDxoUjUJZXxgTFeoD3WyUMlZTRHSJYn86oKkpoIXETn0OiZt7NQLjPgHy0m4xAL2McbzYRcIqVxII4ujsYJdJV9SiYIQBomN4GW-9ZbVo7eKriJkqzhovZf5kIASS2Uti8rm0L0K0PJbronIIqpNdI11n9hOrOnTQmQbmTjzn4GMzu74yoytwiqA" />
                                    </div>
                                    <div class="flex flex-col">
                                        <span class="text-sm font-bold text-primary-container">Arroz Diana Premium 5kg</span>
                                        <span class="text-[11px] text-slate-400">SKU: ABA-012-5KG</span>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-sm text-slate-600 font-medium">Diana</td>
                            <td class="px-6 py-4">
                                <span class="px-3 py-1 bg-primary-fixed text-on-primary-fixed-variant text-[10px] font-bold uppercase rounded-full">Abarrotes</span>
                            </td>
                            <td class="px-6 py-4 text-sm font-bold text-primary-container text-right">$ 21,900</td>
                            <td class="px-6 py-4 text-center">
                                <div class="inline-flex items-center justify-center px-2 py-1 bg-surface-container-low rounded-md">
                                    <span class="text-xs font-bold text-on-surface">85</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-right">
                                <div class="flex items-center justify-end gap-2">
                                    <button class="p-2 text-slate-400 hover:text-primary-container transition-colors"><span class="material-symbols-outlined text-lg">edit</span></button>
                                    <button class="p-2 text-slate-400 hover:text-error transition-colors"><span class="material-symbols-outlined text-lg">delete</span></button>
                                </div>
                            </td>
                        </tr>
                        <!-- Row 5 -->
                        <tr class="hover:bg-surface-container-low/50 transition-all group">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-4">
                                    <div class="w-12 h-12 rounded-lg bg-surface-container-low flex items-center justify-center overflow-hidden border border-outline-variant/10">
                                        <img class="w-full h-full object-cover" data-alt="white and red toothpaste tube with toothbrush on a bright clean bathroom counter" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAQci_Vc3qVMNfTbxgQrOS-hkPSPmZG7K_jktUH_L8C0vZWilGSnPRuvo4wjTtPSi7NkUbCW54fL-u7_mEKRczZzJKaHqE0gFV5SdHUdsDuigFkHwBdQMCmZlj4w_Z8VhLLVAGaB7n3-WMYJN7pAPNT307I4nlhsAx_NLKt3iZuvIS2-bBbYKi23m2Px6P3SzyJpspdr-Hr6Th9mGyLgRmDnuh90PnDnZIA6uOaKAV3N6S00PDYqDBdu_zRtqmrdOfFQNr1eES7faI" />
                                    </div>
                                    <div class="flex flex-col">
                                        <span class="text-sm font-bold text-primary-container">Crema Dental Colgate Triple Acción</span>
                                        <span class="text-[11px] text-slate-400">SKU: PER-055-150</span>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-sm text-slate-600 font-medium">Colgate</td>
                            <td class="px-6 py-4">
                                <span class="px-3 py-1 bg-outline-variant/20 text-on-surface-variant text-[10px] font-bold uppercase rounded-full">Cuidado personal</span>
                            </td>
                            <td class="px-6 py-4 text-sm font-bold text-primary-container text-right">$ 9,400</td>
                            <td class="px-6 py-4 text-center">
                                <div class="inline-flex items-center justify-center px-2 py-1 bg-surface-container-low rounded-md">
                                    <span class="text-xs font-bold text-on-surface">210</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-right">
                                <div class="flex items-center justify-end gap-2">
                                    <button class="p-2 text-slate-400 hover:text-primary-container transition-colors"><span class="material-symbols-outlined text-lg">edit</span></button>
                                    <button class="p-2 text-slate-400 hover:text-error transition-colors"><span class="material-symbols-outlined text-lg">delete</span></button>
                                </div>
                            </td>
                        </tr>
                        <!-- Row 6 -->
                        <tr class="hover:bg-surface-container-low/50 transition-all group border-b-0">
                            <td class="px-6 py-4">
                                <div class="flex items-center gap-4">
                                    <div class="w-12 h-12 rounded-lg bg-surface-container-low flex items-center justify-center overflow-hidden border border-outline-variant/10">
                                        <img class="w-full h-full object-cover" data-alt="premium coffee beans in a black Juan Valdez bag with traditional Colombian graphics" src="https://lh3.googleusercontent.com/aida-public/AB6AXuD5-7EnPCA-0-mSzrqpdQy5z3o2QpINxl2q0eh_DE_dkpuPfj7eXto0O1ugzaOxu05hHWaNuIMu-KV18mRv1qeFimSsLp6DCJUvWAGKB2DT7VhLAWDjPb-ZdXkdFgqNEZUJKcRNd97upinKLmkSboJcmk9BLqqCNodnwu_SJHtzQ31LxQsDGmAJ3mzgvz9cgppaXgJxA7-4SX9Flh-TmNw1hS5yECv80Y-zzGj-DKPucckEG2WwfNMDk3443L_UVRbwyAVXsFk8Er4" />
                                    </div>
                                    <div class="flex flex-col">
                                        <span class="text-sm font-bold text-primary-container">Café Juan Valdez Volcán 500g</span>
                                        <span class="text-[11px] text-slate-400">SKU: BEB-201-500</span>
                                    </div>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-sm text-slate-600 font-medium">Juan Valdez</td>
                            <td class="px-6 py-4">
                                <span class="px-3 py-1 bg-secondary-container/50 text-on-secondary-container text-[10px] font-bold uppercase rounded-full">Bebidas</span>
                            </td>
                            <td class="px-6 py-4 text-sm font-bold text-primary-container text-right">$ 45,900</td>
                            <td class="px-6 py-4 text-center">
                                <div class="inline-flex items-center justify-center px-2 py-1 bg-error-container/30 rounded-md">
                                    <span class="text-xs font-extrabold text-error">6</span>
                                </div>
                            </td>
                            <td class="px-6 py-4 text-right">
                                <div class="flex items-center justify-end gap-2">
                                    <button class="p-2 text-slate-400 hover:text-primary-container transition-colors"><span class="material-symbols-outlined text-lg">edit</span></button>
                                    <button class="p-2 text-slate-400 hover:text-error transition-colors"><span class="material-symbols-outlined text-lg">delete</span></button>
                                </div>
                            </td>
                        </tr>
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
                <span class="text-4xl font-extrabold tracking-tight">1,245</span>
            </div>
            <div class="bg-surface-container-lowest border border-outline-variant/10 p-8 rounded-xl flex flex-col gap-1 shadow-sm relative overflow-hidden">
                <div class="absolute -right-4 -bottom-4 text-error opacity-5">
                    <span class="material-symbols-outlined text-9xl">report</span>
                </div>
                <span class="text-[11px] font-black text-slate-400 uppercase tracking-[0.2em]">BAJO STOCK</span>
                <div class="flex items-baseline gap-2">
                    <span class="text-4xl font-extrabold text-error tracking-tight">14</span>
                    <span class="text-xs font-bold text-error/60">Necesitan reposición</span>
                </div>
            </div>
            <div class="bg-surface-container-lowest border border-outline-variant/10 p-8 rounded-xl flex flex-col gap-1 shadow-sm relative overflow-hidden">
                <div class="absolute -right-4 -bottom-4 text-primary-container opacity-5">
                    <span class="material-symbols-outlined text-9xl">payments</span>
                </div>
                <span class="text-[11px] font-black text-slate-400 uppercase tracking-[0.2em]">VALOR INVENTARIO</span>
                <div class="flex items-baseline gap-2">
                    <span class="text-4xl font-extrabold text-primary-container tracking-tight">$ 42.8M</span>
                    <span class="text-xs font-bold text-on-primary-container/60">Actualizado hace 1h</span>
                </div>
            </div>
        </footer>
    </main>
</asp:Content>
