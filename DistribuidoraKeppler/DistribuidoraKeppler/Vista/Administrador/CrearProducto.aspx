<%@ Page Title="Crear Producto - Keppler" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="CrearProducto.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.CrearProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

    <style>
        body, input, select, textarea, button {
            font-family: 'Outfit', sans-serif !important;
        }

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
    <div class="max-w-5xl mx-auto space-y-6 py-4 px-2">

        <div class="bg-gradient-to-r from-[#001838] to-[#000b1a] rounded-2xl p-6 md:p-8 flex flex-col sm:flex-row items-center justify-between gap-4 shadow-xl shadow-blue-950/10 border border-slate-900/40">
            <div>
                <nav class="flex items-center gap-2 text-xs font-medium text-slate-400 mb-1.5 uppercase tracking-wider">
                    <span class="hover:text-white cursor-pointer transition-colors">Productos</span>
                    <i class="fas fa-chevron-right text-[9px] text-slate-600"></i>
                    <span class="text-blue-400">Nuevo Producto</span>
                </nav>
                <h2 class="text-2xl md:text-3xl font-bold text-white tracking-tight">Crear Nuevo Producto</h2>
                <p class="text-sm text-slate-400 mt-1">Registre los datos correspondientes para ingresar el artículo al sistema.</p>
            </div>
            <div class="flex items-center gap-3 w-full sm:w-auto justify-end">
                <button type="button" class="w-full sm:w-auto bg-slate-800 hover:bg-slate-700 text-slate-300 px-5 py-2.5 rounded-xl text-xs font-semibold border border-slate-700/40 transition-all cursor-pointer">
                    Cancelar
                </button>
                <button type="button" class="w-full sm:w-auto bg-blue-600 hover:bg-blue-500 text-white px-5 py-2.5 rounded-xl flex items-center justify-center gap-2 text-xs font-semibold shadow-lg shadow-blue-600/10 transition-all active:scale-[0.98] cursor-pointer">
                    <i class="fas fa-save"></i>Guardar Producto
                </button>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

            <div class="lg:col-span-2 space-y-6">

                <div class="bg-white p-6 md:p-8 rounded-2xl border border-slate-200/80 shadow-sm space-y-5">
                    <div class="flex items-center gap-2.5 pb-3 border-b border-slate-100 text-slate-800 font-bold text-base">
                        <i class="fas fa-info-circle text-blue-600"></i>
                        <span>Información Básica</span>
                    </div>

                    <div>
                        <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Nombre del Producto *</label>
                        <input type="text" class="w-full border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 px-4 text-sm text-slate-800 transition-all placeholder:text-slate-400" placeholder="Ej. Coca Cola Sin Azúcar 500ml" />
                    </div>

                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Marca *</label>
                            <asp:DropDownList ID="ddlMarca" runat="server" CssClass="w-full bg-white border border-slate-200 pl-4 pr-10 py-2.5 rounded-xl text-sm text-slate-700 appearance-none focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 transition-all cursor-pointer"></asp:DropDownList>
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Categoría *</label>
                            <div class="relative">
                                <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="w-full bg-white border border-slate-200 pl-4 pr-10 py-2.5 rounded-xl text-sm text-slate-700 appearance-none focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 transition-all cursor-pointer"></asp:DropDownList>
                                <i class="fas fa-chevron-down absolute right-4 top-1/2 -translate-y-1/2 text-slate-400 pointer-events-none text-[10px]"></i>
                            </div>
                        </div>
                    </div>

                    <div>
                        <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Descripción</label>
                        <textarea rows="4" class="w-full border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 px-4 text-sm text-slate-800 transition-all placeholder:text-slate-400 resize-none" placeholder="Escriba aquí los detalles del producto, empaque o notas comerciales..."></textarea>
                    </div>
                </div>

                <div class="bg-white p-6 md:p-8 rounded-2xl border border-slate-200/80 shadow-sm space-y-5">
                    <div class="flex items-center gap-2.5 pb-3 border-b border-slate-100 text-slate-800 font-bold text-base">
                        <i class="fas fa-boxes text-blue-600"></i>
                        <span>Inventario y Límites</span>
                    </div>

                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Stock Inicial *</label>
                            <input type="number" class="w-full border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 px-4 text-sm text-slate-800 transition-all" value="0" min="0" />
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Límite de Venta (Por Pedido)</label>
                            <input type="number" class="w-full border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 px-4 text-sm text-slate-800 transition-all" placeholder="Sin límite" min="1" />
                        </div>
                    </div>

                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2 text-red-600">Límite Mínimo (Alerta Stock) *</label>
                            <input type="number" class="w-full border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 px-4 text-sm text-slate-800 transition-all" placeholder="Ej. 10" min="0" />
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2 text-emerald-600">Límite Máximo (Capacidad)</label>
                            <input type="number" class="w-full border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 px-4 text-sm text-slate-800 transition-all" placeholder="Ej. 500" min="1" />
                        </div>
                    </div>
                </div>

            </div>

            <div class="space-y-6">

                <div class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm space-y-4">
                    <div class="flex items-center gap-2.5 pb-2 border-b border-slate-100 text-slate-800 font-bold text-base">
                        <i class="fas fa-dollar-sign text-blue-600"></i>
                        <span>Valor Comercial</span>
                    </div>
                    <div>
                        <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Precio de Venta *</label>
                        <div class="relative">
                            <span class="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 text-sm font-semibold">$</span>
                            <input type="text" class="w-full pl-9 pr-4 border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 text-sm text-slate-800 font-semibold transition-all placeholder:text-slate-300" placeholder="0.00" />
                        </div>
                    </div>
                </div>

                <div class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm space-y-4">
                    <div class="flex items-center gap-2.5 pb-2 border-b border-slate-100 text-slate-800 font-bold text-base">
                        <i class="fas fa-image text-blue-600"></i>
                        <span>Imagen del Producto</span>
                    </div>

                    <div class="border-2 border-dashed border-blue-100 rounded-xl bg-blue-50/20 p-6 flex flex-col items-center justify-center text-center transition-all hover:bg-blue-50/40 hover:border-blue-300 cursor-pointer">
                        <div class="w-10 h-10 bg-blue-100 rounded-xl flex items-center justify-center mb-3 text-blue-600 shadow-sm">
                            <i class="fas fa-cloud-upload-alt text-base"></i>
                        </div>
                        <p class="text-xs font-bold text-slate-800">Cargar Archivo</p>
                        <p class="text-[11px] text-slate-400 mt-1 leading-normal px-2">Suelte el archivo aquí o haga clic para buscar.</p>
                    </div>

                    <div class="border border-slate-100 bg-slate-50/50 rounded-xl p-2.5 flex items-center gap-3">
                        <div class="w-11 h-11 rounded-lg bg-white overflow-hidden flex-shrink-0 border border-slate-200 flex items-center justify-center">
                            <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuC6UwbMNGRsts1XJGbXovUL49N5MKmrq9aiZpVBdV5TPexRals1Cu7f2lAST5kgvg1iXS0u0ku-KBhWJyn-Zwej6e3jW_YJDWv-rZvEXh00IMs5h0_FOdjRibFydnMmRB9KjhW1TyyskZJhArvjMD2eh9NQdcV1UM23r6EswYdGLouF0jyl4q2JkxuznM0jnPTGjF-lUHFxFpmBNmBXUT_FNHx0FtpF2Z9dJ5x7FPBvcAHPKSlDeobDfrHkn0IXhnEFjUfWffPZI1Q" alt="Preview" class="max-h-full max-w-full object-contain p-0.5" />
                        </div>
                        <div class="flex-1 min-w-0">
                            <p class="text-[11px] font-bold text-slate-700 truncate">preview_producto.jpg</p>
                            <p class="text-[10px] text-emerald-600 font-medium mt-0.5"><i class="fas fa-check-circle"></i>Listo para subir</p>
                        </div>
                        <button type="button" class="text-slate-400 hover:text-red-500 p-1.5 transition-colors cursor-pointer">
                            <i class="fas fa-trash-alt text-xs"></i>
                        </button>
                    </div>
                </div>

            </div>

        </div>

        <p class="text-center text-[11px] text-slate-400 font-medium">
            * Los campos marcados con asterisco son requeridos para procesar el formulario de forma segura en la base de datos.
        </p>

    </div>
</asp:Content>
