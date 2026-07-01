<%@ Page Title="Crear Producto - Keppler" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="CrearProducto.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.CrearProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" />

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

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
                <button type="button" class="w-full sm:w-auto bg-slate-800 hover:bg-slate-700 text-slate-300 px-5 py-2.5 rounded-xl text-xs font-semibold border border-slate-700/40 transition-all cursor-pointer" onclick="window.location.href='GestionProductos.aspx'">
                    Cancelar
                </button>

                <asp:LinkButton ID="btnGuardar" runat="server" CssClass="w-full sm:w-auto bg-blue-600 hover:bg-blue-500 text-white px-5 py-2.5 rounded-xl flex items-center justify-center gap-2 text-xs font-semibold shadow-lg shadow-blue-600/10 transition-all active:scale-[0.98] cursor-pointer" OnClick="btnGuardar_Click"><i class="fas fa-save"></i>Guardar Producto</asp:LinkButton>
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
                        <asp:TextBox ID="txtNombre" runat="server" class="w-full border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 px-4 text-sm text-slate-800 transition-all placeholder:text-slate-400" placeholder="Ej. Coca Cola Sin Azúcar 500ml"></asp:TextBox>
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
                        <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="6" Columns="50" CssClass="w-full border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 px-4 text-sm text-slate-800 transition-all placeholder:text-slate-400 resize-none" placeholder="Escriba aquí los detalles del producto, empaque o notas comerciales..."></asp:TextBox>
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
                            <asp:TextBox ID="txtStock" runat="server" CssClass="w-full border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 px-4 text-sm text-slate-800 transition-all"></asp:TextBox>
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Límite de Venta (Por Pedido)</label>
                            <asp:TextBox ID="txtLimiteVenta" runat="server" CssClass="w-full border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 px-4 text-sm text-slate-800 transition-all"></asp:TextBox>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2 text-red-600">Límite Mínimo (Alerta Stock) *</label>
                            <asp:TextBox ID="txtLimiteMinimo" runat="server" CssClass="w-full border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 px-4 text-sm text-slate-800 transition-all" placeholder="Ej. 10"></asp:TextBox>
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2 text-emerald-600">Límite Máximo (Capacidad)</label>
                            <asp:TextBox ID="txtLimiteMaximo" runat="server" CssClass="w-full border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 px-4 text-sm text-slate-800 transition-all" placeholder="Ej. 500"></asp:TextBox>
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
                            <span class="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 text-sm font-semibold">$ </span>
                            <asp:TextBox ID="txtPrecio" runat="server" CssClass="w-full border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 px-4 text-sm text-slate-800 transition-all" placeholder="0.00"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm space-y-4">
                    <div class="flex items-center gap-2.5 pb-2 border-b border-slate-100 text-slate-800 font-bold text-base">
                        <i class="fas fa-image text-blue-600"></i>
                        <span>Imagen del Producto</span>
                    </div>

                    <!-- Preview -->
                    <div class="w-full h-44 bg-slate-50 rounded-xl border border-slate-200 flex items-center justify-content-center overflow-hidden">
                        <img id="imgPrevisualizacion"
                            src="https://placehold.co/200x180?text=Sin+imagen"
                            class="max-h-full max-w-full object-contain p-3"
                            alt="Previsualización" />
                    </div>

                    <!-- Input URL -->
                    <div>
                        <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">URL de la imagen</label>
                        <div class="relative">
                            <i class="fas fa-link absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 text-xs"></i>
                            <input type="text" id="txtImagenUrl"
                                oninput="document.getElementById('imgPrevisualizacion').src = this.value || 'https://placehold.co/200x180?text=Sin+imagen'"
                                class="w-full pl-10 pr-4 py-2.5 border border-slate-200 rounded-xl text-sm text-slate-800 focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 transition-all placeholder:text-slate-400"
                                placeholder="https://ejemplo.com/imagen.png" />
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <p class="text-center text-[11px] text-slate-400 font-medium">
            * Los campos marcados con asterisco son requeridos para procesar el formulario de forma segura en la base de datos.
        </p>
    </div>
    <script>

        $(document).ready(function () {
            $('#txtImagenUrl').on('input change keyup paste', function () {

                // Recibir el valor de la url
                var urlIngresada = $(this).val().trim();

                // Cuando esta vacio el campo pone una imagen por defecto
                var imagenPorDefecto = "https://placehold.co/110?text=Sin+Imagen";

                // Si hay algo escrito se intenta cargar
                if (urlIngresada !== "") {
                    $('#imgPrevisualizacion').attr('src', urlIngresada);
                } else {
                    // Si se elimina vuelve la imagen por defecto
                    $('#imgPrevisualizacion').attr('src', imagenPorDefecto);
                }
            });
            $('#imgPrevisualizacion').on('error', function () {
                $(this).off('error').attr('src', 'https://placehold.co/130/ff0000/ffffff?text=Error+en+URL');
            });
        });
    </script>
</asp:Content>
