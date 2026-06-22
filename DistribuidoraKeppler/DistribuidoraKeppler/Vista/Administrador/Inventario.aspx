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
                    <input type="text" class="w-full pl-10 pr-4 py-2.5 bg-slate-50 border border-slate-200 rounded-xl text-xs text-slate-800 focus:outline-none focus:border-blue-600 focus:bg-white focus:ring-4 focus:ring-blue-600/10 transition-all" placeholder="Buscar por nombre, SKU..." />
                </div>
                <div class="relative w-full sm:w-48">
                    <select class="w-full bg-white border border-slate-200 pl-4 pr-10 py-2.5 rounded-xl text-xs font-medium text-slate-700 appearance-none focus:outline-none focus:border-blue-600 transition-all cursor-pointer">
                        <option>Todas las Categorías</option>
                    </select>
                    <i class="fas fa-chevron-down absolute right-4 top-1/2 -translate-y-1/2 text-slate-400 pointer-events-none text-[10px]"></i>
                </div>
                <div class="relative w-full sm:w-48">
                    <select class="w-full bg-white border border-slate-200 pl-4 pr-10 py-2.5 rounded-xl text-xs font-medium text-slate-700 appearance-none focus:outline-none focus:border-blue-600 transition-all cursor-pointer">
                        <option>Todas las Marcas</option>
                    </select>
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

            <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden flex flex-col justify-between group hover:border-blue-500/30 hover:shadow-md transition-all duration-200">
                <div class="p-4 space-y-3">
                    <div class="relative w-full h-40 bg-slate-50 rounded-xl overflow-hidden flex items-center justify-center border border-slate-100">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDr_KkxV4aykaRtofMgdo-FGqX6nP_U_yBqYPG6jGdcq2ZTFKM7mK5jBzyf378SX_mbY_Wq4_UCE5qVXacCF-sQ0-D_S1QEwEBjeiHb1v64yogaTQLdJ57BnhgkM-W6lpxTR6hLTzwFdVLqdZIUQdLSPWEsSIawM_x5y_GZhoobq3io-x8M7JeL-o14a7LcJJaayW9NTVykgof_q2D13Ay0OqN5hnNxC7XmVBPFJTj7JARc-48iwqOhVUU46eaSC-cxnI3vOLhB7d8" alt="Coca Cola" class="max-h-full max-w-full object-contain p-2 group-hover:scale-105 transition-transform duration-300" />
                        <span class="absolute top-2 left-2 px-2.5 py-1 bg-blue-50 text-blue-600 text-[10px] font-bold rounded-lg uppercase tracking-wide border border-blue-100/50">Bebidas
                        </span>
                        <button class="absolute top-2 right-2 text-slate-400 hover:text-slate-600 bg-white/80 backdrop-blur-sm w-7 h-7 rounded-lg flex items-center justify-center border border-slate-200/40 transition-colors">
                            <i class="fas fa-ellipsis-v text-xs"></i>
                        </button>
                    </div>
                    <div>
                        <p class="text-xs font-medium text-slate-400">Coca Cola</p>
                        <h4 class="font-bold text-slate-800 text-sm truncate mt-0.5">Coca Cola 2L</h4>
                        <p class="text-[11px] text-slate-400 font-mono mt-0.5">SKU: BEB-001-2L</p>
                    </div>
                </div>
                <div class="px-4 py-3 bg-slate-50/80 border-t border-slate-100 flex items-center justify-between">
                    <div>
                        <p class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Existencias</p>
                        <p class="text-sm font-bold text-red-600 mt-0.5">12 <span class="text-xs font-normal text-slate-400">unid.</span></p>
                    </div>
                    <span class="inline-flex items-center gap-1 px-2.5 py-1 bg-red-100 text-red-700 text-[9px] font-bold rounded-md uppercase tracking-wide">
                        <i class="fas fa-exclamation text-[8px]"></i>Crítico
                    </span>
                </div>
            </div>

            <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden flex flex-col justify-between group hover:border-blue-500/30 hover:shadow-md transition-all duration-200">
                <div class="p-4 space-y-3">
                    <div class="relative w-full h-40 bg-slate-50 rounded-xl overflow-hidden flex items-center justify-center border border-slate-100">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuCZhFl_rLhguzJuA1zBTjboANEWusfHKkBaaLVgLw0AhkiM4cELJx4WE9_nAlWIoEH2NTUCP-dgdnGu6jYIR95R6kkqs5Ut_FwI5OByoGcD5VR3EIS9mo9VlM2DU1X5ShzW5Rkr6yieWEn8Rmh-fxwYV606fLqRvs57kcRaYKaYmuj2JTY5ZcA8gPo2CxopNowtby16NcEgBYdd7Ycn7oeMnlIR6t6ofBf8cKzG47qy9Y_OetCYuiH2Jg1FkSEApN0XtKP3hhS5uyc" alt="Ariel" class="max-h-full max-w-full object-contain p-2 group-hover:scale-105 transition-transform duration-300" />
                        <span class="absolute top-2 left-2 px-2.5 py-1 bg-emerald-50 text-emerald-600 text-[10px] font-bold rounded-lg uppercase tracking-wide border border-emerald-100/50">Hogar
                        </span>
                        <button class="absolute top-2 right-2 text-slate-400 hover:text-slate-600 bg-white/80 backdrop-blur-sm w-7 h-7 rounded-lg flex items-center justify-center border border-slate-200/40 transition-colors">
                            <i class="fas fa-ellipsis-v text-xs"></i>
                        </button>
                    </div>
                    <div>
                        <p class="text-xs font-medium text-slate-400">Ariel</p>
                        <h4 class="font-bold text-slate-800 text-sm truncate mt-0.5">Ariel Líquido 3L</h4>
                        <p class="text-[11px] text-slate-400 font-mono mt-0.5">SKU: HOG-042-3L</p>
                    </div>
                </div>
                <div class="px-4 py-3 bg-slate-50/80 border-t border-slate-100 flex items-center justify-between">
                    <div>
                        <p class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Existencias</p>
                        <p class="text-sm font-bold text-slate-800 mt-0.5">154 <span class="text-xs font-normal text-slate-400">unid.</span></p>
                    </div>
                    <span class="inline-flex items-center gap-1 px-2.5 py-1 bg-emerald-100 text-emerald-700 text-[9px] font-bold rounded-md uppercase tracking-wide">
                        <i class="fas fa-check text-[8px]"></i>Abundante
                    </span>
                </div>
            </div>

            <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden flex flex-col justify-between group hover:border-blue-500/30 hover:shadow-md transition-all duration-200">
                <div class="p-4 space-y-3">
                    <div class="relative w-full h-40 bg-slate-50 rounded-xl overflow-hidden flex items-center justify-center border border-slate-100">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuD4XKOyxw4qxaljpRwjOmWy032H2BbcwN6s-UF3o9KaKRP_8T9gK93TD8WsqmzeQ4lZV5AG8EcDUhk9YjywbqabyvqZmxhNo2tbxPbjv2iS-exGWJhg6iY5lZ16HhGP6KdcAx4FCvdOLKjmCfW0qq86lZlW_MD6-LukDJT3rCS9rqLyZJ0vdp88Z2E1gn8vFPGtn4CzPpP5iHi5teSBWsQ_qhvJOfDfFW5EgBg2nW9YKfYcnVUOZlCZolj17V4DS9KCAWGzEtC1wQM" alt="Oreo" class="max-h-full max-w-full object-contain p-2 group-hover:scale-105 transition-transform duration-300" />
                        <span class="absolute top-2 left-2 px-2.5 py-1 bg-orange-50 text-orange-600 text-[10px] font-bold rounded-lg uppercase tracking-wide border border-orange-100/50">Confitería
                        </span>
                        <button class="absolute top-2 right-2 text-slate-400 hover:text-slate-600 bg-white/80 backdrop-blur-sm w-7 h-7 rounded-lg flex items-center justify-center border border-slate-200/40 transition-colors">
                            <i class="fas fa-ellipsis-v text-xs"></i>
                        </button>
                    </div>
                    <div>
                        <p class="text-xs font-medium text-slate-400">Oreo</p>
                        <h4 class="font-bold text-slate-800 text-sm truncate mt-0.5">Oreo Clásica</h4>
                        <p class="text-[11px] text-slate-400 font-mono mt-0.5">SKU: SNK-112-X4</p>
                    </div>
                </div>
                <div class="px-4 py-3 bg-slate-50/80 border-t border-slate-100 flex items-center justify-between">
                    <div>
                        <p class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Existencias</p>
                        <p class="text-sm font-bold text-orange-600 mt-0.5">45 <span class="text-xs font-normal text-slate-400">unid.</span></p>
                    </div>
                    <span class="inline-flex items-center gap-1 px-2.5 py-1 bg-orange-100 text-orange-700 text-[9px] font-bold rounded-md uppercase tracking-wide">
                        <i class="fas fa-clock text-[8px]"></i>Bajo
                    </span>
                </div>
            </div>

            <div class="bg-white rounded-2xl border border-slate-200/80 shadow-sm overflow-hidden flex flex-col justify-between group hover:border-blue-500/30 hover:shadow-md transition-all duration-200">
                <div class="p-4 space-y-3">
                    <div class="relative w-full h-40 bg-slate-50 rounded-xl overflow-hidden flex items-center justify-center border border-slate-100">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuBeDNv_nPSilFzWzF4JWOQRIda421txg9SoLGkIUhzKGmhauJF9vUyakAN6kTFjPf9ZQUXv5Pa_ubtR6UjGlUneyx01yFmONxeVn_dLklVf69MP2CiX3q2TQN01ebn8kHb-rcEzjEMuC0YQ8yIIM1_3gfkKbJbjVvdy9zMIfAcKhkJVwH3pg35w0NahECY3aXZNp2DfgHNbCWrK8s7CNQsRzJXpr_kW_xEaDs8pxihnvDGxdrkELEQWm94A5afYyeNgEaD8G4ilPig" alt="Pantene" class="max-h-full max-w-full object-contain p-2 group-hover:scale-105 transition-transform duration-300" />
                        <span class="absolute top-2 left-2 px-2.5 py-1 bg-purple-50 text-purple-600 text-[10px] font-bold rounded-lg uppercase tracking-wide border border-purple-100/50">Cosméticos
                        </span>
                        <button class="absolute top-2 right-2 text-slate-400 hover:text-slate-600 bg-white/80 backdrop-blur-sm w-7 h-7 rounded-lg flex items-center justify-center border border-slate-200/40 transition-colors">
                            <i class="fas fa-ellipsis-v text-xs"></i>
                        </button>
                    </div>
                    <div>
                        <p class="text-xs font-medium text-slate-400">P&G</p>
                        <h4 class="font-bold text-slate-800 text-sm truncate mt-0.5">Pantene Reparación</h4>
                        <p class="text-[11px] text-slate-400 font-mono mt-0.5">SKU: PER-S54-400</p>
                    </div>
                </div>
                <div class="px-4 py-3 bg-slate-50/80 border-t border-slate-100 flex items-center justify-between">
                    <div>
                        <p class="text-[10px] font-bold text-slate-400 uppercase tracking-wider">Existencias</p>
                        <p class="text-sm font-bold text-slate-800 mt-0.5">89 <span class="text-xs font-normal text-slate-400">unid.</span></p>
                    </div>
                    <span class="inline-flex items-center gap-1 px-2.5 py-1 bg-blue-100 text-blue-700 text-[9px] font-bold rounded-md uppercase tracking-wide">
                        <i class="fas fa-heart-circle-check text-[8px]"></i>Estable
                    </span>
                </div>
            </div>

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
</asp:Content>
