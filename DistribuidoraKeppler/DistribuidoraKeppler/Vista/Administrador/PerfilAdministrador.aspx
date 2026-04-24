<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="PerfilAdministrador.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Aministrador.PerfilAdministrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <title>Kepler Admin - Perfil del Administrador</title>
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet" />
        <script>
            tailwind.config = {
                darkMode: "class",
                theme: {
                    extend: {
                        colors: {
                            primary: "#000080",
                            "background-light": "#F8FAFC",
                            "background-dark": "#0F172A",
                        },
                        fontFamily: {
                            display: ["Inter", "sans-serif"],
                        },
                        borderRadius: {
                            DEFAULT: "0.75rem",
                        },
                    },
                },
            };
        </script>
        <style>
            .material-symbols-outlined {
                font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            }

            body {
                font-family: 'Inter', sans-serif;
            }
        </style>
    </head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main class="flex-1 flex flex-col">
        <div class="p-8 grid grid-cols-12 gap-8">
            <div class="col-span-12 lg:col-span-4 flex flex-col gap-6">
                <div class="bg-white dark:bg-slate-800 rounded-2xl shadow-sm border border-slate-200 dark:border-slate-700 p-8 flex flex-col items-center">
                    <div class="relative mb-6">
                        <!-- Avatar -->
                        <div class="relative">
                            <div class="w-32 h-32 rounded-full border-2 border-gray-100 p-1">
                                <div class="w-full h-full rounded-full bg-[#f3f4f6] overflow-hidden flex items-center justify-center">
                                    <asp:Image
                                        ID="imgPerfil"
                                        runat="server"
                                        CssClass="object-cover w-full h-full"
                                        AlternateText="Foto de perfil" />
                                </div>
                            </div>

                            <%-- FileUpload oculto --%>
                            <asp:FileUpload ID="fuImagen" runat="server" Style="display: none;" accept="image/*" />

                            <%-- Botón ASP.NET oculto: solo para hacer el postback con el archivo --%>
                            <asp:Button ID="btnSubirFoto" runat="server" OnClick="btnSubirFoto_Click" Style="display: none;" />

                            <%-- Botón HTML visible: solo abre el explorador de archivos --%>
                            <button type="button" id="btnCamara"
                                class="absolute bottom-1 right-1 bg-[#0A0A6E] p-2 rounded-full border-4 border-white text-white hover:bg-blue-900 transition-all">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" />
                                    <path d="M15 13a3 3 0 11-6 0 3 3 0 016 0z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" />
                                </svg>
                            </button>
                        </div>

                        <script>
                            var btnCamara = document.getElementById('btnCamara');
                            var fuImagen = document.getElementById('<%= fuImagen.ClientID %>');
                            var btnSubir = document.getElementById('<%= btnSubirFoto.ClientID %>');

                            // Clic en cámara → abre el explorador
                            btnCamara.addEventListener('click', function () {
                                fuImagen.click();
                            });

                            // Al seleccionar archivo → hace clic en el botón ASP.NET oculto
                            fuImagen.addEventListener('change', function () {
                                if (this.files.length > 0) {
                                    btnSubir.click(); // ✅ Esto sí envía el archivo correctamente
                                }
                            });
                        </script>

                        <!-- User Info -->
                    </div>
                    <asp:Label
                        ID="lblNombreUsuario"
                        runat="server"
                        CssClass="text-xl font-bold text-slate-900 dark:text-white mb-1" />
                    <asp:Label
                        ID="lblRol"
                        runat="server"
                        CssClass="text-slate-500 dark:text-slate-400 text-sm mb-4" />
                    <span class="px-4 py-1 bg-blue-50 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400 text-[10px] font-bold uppercase tracking-widest rounded-full mb-8">Activo</span>

                    <!-- Action Buttons -->
                    <div class="w-full space-y-3">
                        <button class="w-full py-3 bg-primary text-white font-semibold rounded-xl flex items-center justify-center gap-2 hover:bg-blue-900 transition-colors">
                            <span class="material-symbols-outlined text-lg">edit</span>
                            Editar Información
                        </button>
                        <button class="w-full py-3 bg-slate-100 dark:bg-slate-700 text-slate-700 dark:text-slate-300 font-semibold rounded-xl flex items-center justify-center gap-2 hover:bg-slate-200 dark:hover:bg-slate-600 transition-colors">
                            Descargar Reporte ID
                        </button>
                        <button class="w-full py-3 bg-slate-50 dark:bg-slate-700/50 text-slate-600 dark:text-slate-400 font-semibold rounded-xl flex items-center justify-center gap-2 hover:bg-red-50 dark:hover:bg-red-900/20 hover:text-red-600 transition-colors">
                            <span class="material-symbols-outlined text-lg">logout</span>
                            Cerrar sesión
                        </button>
                    </div>
                </div>
            </div>

            <!-- Details Grid -->
            <div class="col-span-12 lg:col-span-8 flex flex-col gap-6">

                <!-- Información de Contacto -->
                <div class="bg-white dark:bg-slate-800 rounded-2xl shadow-sm border border-slate-200 dark:border-slate-700 overflow-hidden">
                    <div class="px-6 py-4 border-b border-slate-100 dark:border-slate-700 flex items-center gap-3">
                        <span class="material-symbols-outlined text-primary">contact_page</span>
                        <h4 class="font-bold text-slate-900 dark:text-white">Información de Contacto</h4>
                    </div>
                    <div class="p-8 grid grid-cols-1 md:grid-cols-2 gap-y-8 gap-x-12">
                        <div>
                            <p class="text-[10px] text-slate-400 dark:text-slate-500 uppercase font-bold tracking-wider mb-1">Nombre Completo</p>
                            <asp:Label
                                ID="lblNombreContacto"
                                runat="server"
                                CssClass="text-sm font-medium text-slate-800 dark:text-slate-200" />
                        </div>
                        <div>
                            <p class="text-[10px] text-slate-400 dark:text-slate-500 uppercase font-bold tracking-wider mb-1">Correo Electrónico</p>
                            <asp:Label
                                ID="lblEmail"
                                runat="server"
                                CssClass="text-sm font-medium text-slate-800 dark:text-slate-200" />
                        </div>
                        <div>
                            <p class="text-[10px] text-slate-400 dark:text-slate-500 uppercase font-bold tracking-wider mb-1">Documento</p>
                            <asp:Label
                                ID="lblDocumento"
                                runat="server"
                                CssClass="text-sm font-medium text-slate-800 dark:text-slate-200" />
                        </div>
                    </div>
                </div>

                <%-- Pensando en quitar esta funionalidad --%>
                <div class="bg-white dark:bg-slate-800 rounded-2xl shadow-sm border border-slate-200 dark:border-slate-700 overflow-hidden">
                    <div class="px-6 py-4 border-b border-slate-100 dark:border-slate-700 flex items-center gap-3">
                        <span class="material-symbols-outlined text-primary">lock</span>
                        <h4 class="font-bold text-slate-900 dark:text-white">Seguridad y Contraseña</h4>
                    </div>
                    <div class="p-8 space-y-6">
                        <div class="max-w-md">
                            <label class="block text-xs font-semibold text-slate-700 dark:text-slate-300 mb-2">Contraseña Actual</label>
                            <div class="relative">
                                <input class="w-full bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-700 rounded-xl px-4 py-2.5 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all outline-none" type="password" value="••••••••" />
                                <span class="material-symbols-outlined absolute right-3 top-2.5 text-slate-400 cursor-pointer">visibility</span>
                            </div>
                        </div>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label class="block text-xs font-semibold text-slate-700 dark:text-slate-300 mb-2">Nueva Contraseña</label>
                                <div class="relative">
                                    <input class="w-full bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-700 rounded-xl px-4 py-2.5 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all outline-none" placeholder="Mínimo 8 caracteres" type="password" />
                                    <span class="material-symbols-outlined absolute right-3 top-2.5 text-slate-400 cursor-pointer">visibility</span>
                                </div>
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-slate-700 dark:text-slate-300 mb-2">Confirmar Nueva Contraseña</label>
                                <div class="relative">
                                    <input class="w-full bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-700 rounded-xl px-4 py-2.5 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all outline-none" placeholder="Repite la contraseña" type="password" />
                                    <span class="material-symbols-outlined absolute right-3 top-2.5 text-slate-400 cursor-pointer">visibility</span>
                                </div>
                            </div>
                        </div>
                        <div class="flex justify-end pt-2">
                            <button class="px-6 py-2.5 bg-blue-50 dark:bg-blue-900/20 text-primary dark:text-blue-400 font-bold text-sm rounded-xl hover:bg-primary hover:text-white dark:hover:bg-primary transition-all">
                                Actualizar Contraseña
                            </button>
                        </div>
                    </div>
                </div>
                <%-- Pensando en quitar esta funionalidad --%>

                <div class="bg-white dark:bg-slate-800 rounded-2xl shadow-sm border border-slate-200 dark:border-slate-700 overflow-hidden">
                    <div class="px-6 py-4 border-b border-slate-100 dark:border-slate-700 flex items-center gap-3">
                        <span class="material-symbols-outlined text-primary">history</span>
                        <h4 class="font-bold text-slate-900 dark:text-white">Actividad de Sesión</h4>
                    </div>
                    <div class="p-4 divide-y divide-slate-100 dark:divide-slate-700">
                        <div class="flex items-center justify-between p-4 hover:bg-slate-50 dark:hover:bg-slate-700/50 rounded-xl transition-colors">
                            <div class="flex items-center gap-4">
                                <div class="w-10 h-10 bg-green-50 dark:bg-green-900/20 rounded-xl flex items-center justify-center text-green-600 dark:text-green-400">
                                    <span class="material-symbols-outlined">laptop_mac</span>
                                </div>
                                <div>
                                    <p class="text-sm font-bold text-slate-800 dark:text-slate-200">Chrome en macOS (Esta sesión)</p>
                                    <p class="text-xs text-slate-500 dark:text-slate-400">Colombia, Duitama • Hace 2 minutos</p>
                                </div>
                            </div>
                            <span class="px-3 py-1 bg-green-100 dark:bg-green-900/40 text-green-700 dark:text-green-300 text-[10px] font-bold uppercase tracking-wider rounded-lg">Online</span>
                        </div>
                        <div class="flex items-center justify-between p-4 hover:bg-slate-50 dark:hover:bg-slate-700/50 rounded-xl transition-colors">
                            <div class="flex items-center gap-4">
                                <div class="w-10 h-10 bg-slate-100 dark:bg-slate-700 rounded-xl flex items-center justify-center text-slate-600 dark:text-slate-400">
                                    <span class="material-symbols-outlined">smartphone</span>
                                </div>
                                <div>
                                    <p class="text-sm font-bold text-slate-800 dark:text-slate-200">App Kepler iOS</p>
                                    <p class="text-xs text-slate-500 dark:text-slate-400">Colombia, Duitama • Ayer, 18:45</p>
                                </div>
                            </div>
                            <button class="text-red-500 text-xs font-bold uppercase tracking-wider hover:underline">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
