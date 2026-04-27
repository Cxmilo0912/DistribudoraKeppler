<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="CreacionProducto.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Aministrador.CreacionProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Kepler Admin - Crear Nuevo Producto</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Tailwind CSS v3 CDN -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <!-- Custom Fonts (Inter or similar sans-serif) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet" />
    <style data-purpose="custom-styles">
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8fafc;
        }

        .sidebar-active {
            background-color: #0c1b4d;
            color: white;
        }

        .custom-shadow {
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.05), 0 1px 2px 0 rgba(0, 0, 0, 0.03);
        }

        .input-focus:focus {
            outline: none;
            border-color: #0c1b4d;
            ring: 1px solid #0c1b4d;
        }
    </style>
    <script>
        function mostrarAlerta(titulo, texto, icono) {
            Swal.fire({
                title: titulo,
                text: texto,
                icon: icono,
                confirmButtonColor: '#0c1b4d'
            });
        }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="flex-1 overflow-y-auto p-8" data-purpose="scrollable-content">
        <div class="max-w-6xl mx-auto">
            <div class="flex justify-between items-end mb-8">
                <div>
                    <h2 class="text-2xl font-bold text-gray-900">Crear Nuevo Producto</h2>
                    <p class="text-sm text-gray-500 mt-1">Complete los campos obligatorios para registrar el artículo en el catálogo oficial.</p>
                </div>
                <div class="flex gap-3">
                    <div class="mt-6">
                        <asp:Button ID="Button1" runat="server" Text="Cancelar"
                            CssClass="w-full bg-[#0c1b4d] text-white font-bold py-2 px-4 rounded-lg hover:bg-blue-900 transition duration-300 cursor-pointer"
                            OnClick="btnCerrar_Click" />
                    </div>
                    <div class="mt-6">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar Producto"
                            CssClass="w-full bg-[#0c1b4d] text-white font-bold py-2 px-4 rounded-lg hover:bg-blue-900 transition duration-300 cursor-pointer"
                            OnClick="btnGuardar_Click" />
                    </div>
                </div>
            </div>
            <div class="grid grid-cols-12 gap-8">
                <div class="col-span-12 lg:col-span-8 space-y-6">
                    <section class="bg-white border border-gray-200 rounded-xl p-6 custom-shadow">
                        <div class="flex items-center gap-2 mb-6">
                            <div class="p-1.5 bg-blue-50 text-[#0c1b4d] rounded-md">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24">
                                    <path d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path></svg>
                            </div>
                            <h3 class="font-bold text-[#0c1b4d]">Información General</h3>
                        </div>
                        <div class="space-y-4">
                            <div>
                                <label class="block text-xs font-semibold text-gray-700 mb-1">Nombre del Producto *</label>
                                <asp:TextBox ID="txtNombre" runat="server"
                                    CssClass="w-full px-4 py-2 border border-gray-200 rounded-lg text-sm bg-white focus:border-[#0c1b4d] focus:ring-0 outline-none"
                                    placeholder="Ej. Coca Cola Sin Azúcar 500ml">
                                </asp:TextBox>
                            </div>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label class="block text-xs font-semibold text-gray-700 mb-1">Marca *</label>
                                    <asp:TextBox ID="txtMarca" runat="server"
                                        CssClass="w-full px-4 py-2 border border-gray-200 rounded-lg text-sm bg-white focus:border-[#0c1b4d] focus:ring-0 outline-none"
                                        placeholder="Ej. Coca Cola">
                                    </asp:TextBox>
                                </div>
                                <div>
                                    <label class="block text-xs font-semibold text-gray-700 mb-1">Categoría *</label>
                                    <asp:DropDownList ID="ddlCategorias" runat="server"
                                        CssClass="w-full px-4 py-2 border border-gray-200 rounded-lg text-sm bg-white focus:border-[#0c1b4d] focus:ring-0 outline-none appearance-none cursor-pointer">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-gray-700 mb-1">Descripción detallada</label>
                                <asp:TextBox ID="txtDescripcion" runat="server"
                                    TextMode="MultiLine"
                                    Rows="4"
                                    CssClass="w-full px-4 py-2 border border-gray-200 rounded-lg text-sm bg-white focus:border-[#0c1b4d] focus:ring-0 outline-none resize-none"
                                    placeholder="Especificaciones, ingredientes o detalles adicionales...">
                                </asp:TextBox>
                            </div>
                        </div>
                    </section>
                    <section class="bg-white border border-gray-200 rounded-xl p-6 custom-shadow">
                        <div class="flex items-center gap-2 mb-6">
                            <div class="p-1.5 bg-blue-50 text-[#0c1b4d] rounded-md">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24">
                                    <path d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path></svg>
                            </div>
                            <h3 class="font-bold text-[#0c1b4d]">Inventario y Precios</h3>
                        </div>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label class="block text-xs font-semibold text-gray-700 mb-1">Precio de Venta ($) *</label>
                                <div class="relative">
                                    <span class="absolute left-4 top-2.5 text-gray-400 text-sm">$</span>
                                    <asp:TextBox ID="txtPrecio" runat="server"
                                        CssClass="w-full pl-8 pr-4 py-2 border border-gray-200 rounded-lg text-sm bg-white focus:border-[#0c1b4d] focus:ring-0 outline-none"
                                        placeholder="0.00">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div>
                            <label class="block text-xs font-semibold text-gray-700 mb-1">Límite de Venta (Cantidad) *</label>
                            <asp:TextBox ID="txtLimiteVenta" runat="server"
                                TextMode="Number"
                                CssClass="w-full px-4 py-2 border border-gray-200 rounded-lg text-sm bg-white focus:border-[#0c1b4d] focus:ring-0 outline-none"
                                placeholder="Ej. 10">
                            </asp:TextBox>
                        </div>
                        <div>
                            <label class="block text-xs font-semibold text-gray-700 mb-1">Cantidad Inicial *</label>
                            <asp:TextBox ID="txtLimiteMinimo" runat="server"
                                TextMode="Number"
                                step="1"
                                min="0"
                                Value="0"
                                CssClass="w-full px-4 py-2 border border-gray-200 rounded-lg text-sm bg-white focus:border-[#0c1b4d] focus:ring-0 outline-none">
                            </asp:TextBox>
                        </div>
                        <div>
                            <label class="block text-xs font-semibold text-gray-700 mb-1">Stock Actual (Cantidad en bodega)</label>
                            <asp:TextBox ID="txtStock" runat="server"
                                TextMode="Number"
                                min="0"
                                Value="0"
                                CssClass="w-full px-4 py-2 border border-gray-200 rounded-lg text-sm bg-white focus:border-[#0c1b4d] focus:ring-0 outline-none">
                            </asp:TextBox>
                        </div>
                </div>
                </section>
            </div>
            <div class="col-span-12 lg:col-span-4 space-y-6">
                <section class="bg-white border border-gray-200 rounded-xl p-6 custom-shadow h-fit">
                    <div class="flex items-center gap-2 mb-6">
                        <div class="p-1.5 bg-blue-50 text-[#0c1b4d] rounded-md">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewbox="0 0 24 24">
                                <path d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path></svg>
                        </div>
                        <h3 class="font-bold text-[#0c1b4d]">Media</h3>
                    </div>
                    <div class="border-2 border-dashed border-blue-100 rounded-xl p-8 flex flex-col items-center text-center bg-blue-50/20 mb-6" data-purpose="dropzone">
                        <div class="w-12 h-12 bg-white rounded-lg flex items-center justify-center shadow-sm mb-4">
                            <svg class="w-6 h-6 text-[#0c1b4d]" fill="none" stroke="currentColor" viewbox="0 0 24 24">
                                <path d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path></svg>
                        </div>
                        <p class="text-sm font-bold text-[#0c1b4d] mb-1">Subir imagen del producto</p>
                        <p class="text-[11px] text-gray-500 leading-relaxed">
                            Arrastra la imagen aquí o haz clic para buscar.<br />
                            Soportado: JPG, PNG (Max 5MB)
                        </p>
                    </div>
                    <div class="border border-gray-100 rounded-lg p-2 flex items-center gap-3 bg-gray-50/50" data-purpose="file-list-item">
                        <div class="w-12 h-10 bg-gray-200 rounded overflow-hidden">
                            <img alt="Preview" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDwMDbcI5WzhQ9LVR1u3w3t6TYKkzF3pk6IvDEkwPws4EFKBx06GrLOBSijUV-bu_-ee9qpPuYj57zQRCGrhzPfmFGzHmgKh7Tl_VovvKP18TLYZ-rqtCca-p88ii6WJ34gOu9ExCAnHT-B39NhZoZ7phAHnIkBaNMRISXmsGxoflMuWOuCCEBqfTDMSk6tYoW-xiRyZtgQpZO3FDfbzynVzfsd6KRQdzIcnTroxByD3O6ewhY056OzSllPVNI47vWBBKlEBdONvjE" />
                        </div>
                        <div class="flex-1 min-w-0">
                            <p class="text-xs font-bold text-gray-800 truncate">preview_image.jpg</p>
                            <p class="text-[10px] text-gray-400">1.2 MB • Completado</p>
                        </div>
                        <button class="text-gray-400 hover:text-red-500 p-1">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewbox="0 0 24 24">
                                <path d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path></svg>
                        </button>
                    </div>
                </section>
            </div>
        </div>
        <div class="mt-8 pt-8 border-t border-gray-200 flex justify-end">
            <p class="text-[10px] text-gray-400 italic">* Todos los campos marcados con asterisco son obligatorios para el guardado.</p>
        </div>
    </div>
    </div>
    </main>

</asp:Content>
