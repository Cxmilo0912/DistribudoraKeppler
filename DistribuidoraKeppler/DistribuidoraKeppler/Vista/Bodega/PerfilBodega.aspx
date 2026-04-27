<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="PerfilBodega.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Bodega.PerfilBodega" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Perfil de Usuario</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet" />
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        primary: "#2563eb",
                        "background-light": "#f8f9ff",
                        "background-dark": "#0f172a",
                        "navy-sidebar": "#0d1b3e",
                        "banner-blue": "#204291",
                    },
                    fontFamily: {
                        display: ["Manrope", "sans-serif"],
                        sans: ["Manrope", "sans-serif"],
                    },
                    borderRadius: { DEFAULT: "12px" },
                },
            },
        };
    </script>
    <style>
        body {
            font-family: 'Manrope', sans-serif;
        }

        /* Ocultar inputs de edicion por defecto */
        .campo-input {
            display: none;
        }

        .campo-texto {
            display: block;
        }

        /* Modo edicion activo */
        .modo-edicion .campo-input {
            display: block;
        }

        .modo-edicion .campo-texto {
            display: none;
        }

        /* Toast de notificacion */
        #toast {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            padding: .75rem 1.5rem;
            border-radius: 12px;
            font-weight: 600;
            font-size: .875rem;
            transform: translateY(6rem);
            opacity: 0;
            transition: all .35s cubic-bezier(.4,0,.2,1);
            z-index: 9999;
        }

            #toast.show {
                transform: translateY(0);
                opacity: 1;
            }

            #toast.success {
                background: #22c55e;
                color: #fff;
            }

            #toast.error {
                background: #ef4444;
                color: #fff;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%-- Toast de notificaciones --%>
    <div id="toast"></div>

    <%-- Mensajes ocultos que usa JS para el toast --%>
    <asp:HiddenField ID="hfMensaje" runat="server" Value="" />
    <asp:HiddenField ID="hfTipoMsg" runat="server" Value="" />

    <main class="flex-1 flex flex-col min-w-0">

        <%-- HEADER --%>
        <header class="h-16 bg-white dark:bg-slate-900 border-b border-slate-200 dark:border-slate-800 flex items-center justify-between px-8">
            <div class="flex items-center space-x-2 text-sm">
                <span class="text-slate-400">Inicio</span>
                <span class="material-icons-outlined text-sm text-slate-300">chevron_right</span>
                <span class="text-slate-900 dark:text-slate-100 font-medium">Mi perfil</span>
            </div>
            <div class="flex items-center space-x-6">
                <button class="relative text-slate-500 hover:text-slate-700 dark:hover:text-slate-300">
                    <span class="material-icons-outlined">notifications</span>
                    <span class="absolute top-0 right-0 w-2 h-2 bg-red-500 rounded-full border-2 border-white dark:border-slate-900"></span>
                </button>
                <div class="h-8 w-px bg-slate-200 dark:bg-slate-700"></div>
                <div class="flex items-center space-x-3">
                    <asp:Label ID="lblNombreHeader" runat="server"
                        CssClass="text-sm font-medium text-slate-700 dark:text-slate-300" />
                    <asp:Image ID="imgAvatarHeader" runat="server"
                        CssClass="w-9 h-9 rounded-full bg-slate-200 object-cover"
                        AlternateText="Avatar" />
                </div>
            </div>
        </header>

        <div class="p-8 space-y-6 max-w-7xl mx-auto w-full">

            <%-- BANNER / FOTO DE PERFIL --%>
            <div class="relative rounded-2xl overflow-hidden shadow-sm">
                <div class="h-32 bg-banner-blue"></div>
                <div class="bg-slate-800 p-8 flex items-end justify-between -mt-1">
                    <div class="flex items-center space-x-6 -mt-20">

                        <%-- Avatar grande + botón subir foto --%>
                        <div class="relative group">
                            <asp:Image ID="imgAvatarGrande" runat="server"
                                CssClass="w-32 h-32 rounded-full border-4 border-white shadow-lg bg-white object-cover"
                                AlternateText="Avatar" />

                            <%-- Overlay para subir foto --%>
                            <label for="<%= fuFoto.ClientID %>"
                                class="absolute inset-0 flex flex-col items-center justify-center rounded-full
                                   bg-black/50 opacity-0 group-hover:opacity-100 cursor-pointer transition-opacity">
                                <span class="material-icons-outlined text-white text-2xl">photo_camera</span>
                                <span class="text-white text-xs font-semibold mt-1">Cambiar</span>
                            </label>

                            <%-- FileUpload oculto --%>
                            <asp:FileUpload ID="fuFoto" runat="server" CssClass="hidden" accept="image/*"
                                onchange="this.form.submit()" />

                            <%-- Botón oculto que dispara el upload al cambiar el file --%>
                            <asp:Button ID="btnSubirFoto" runat="server" Text=""
                                CssClass="hidden" OnClick="btnSubirFoto_Click"
                                UseSubmitBehavior="false" />
                        </div>

                        <div class="pb-2">
                            <h1 class="text-2xl font-bold text-white mb-1">
                                <asp:Label ID="lblNombreBanner" runat="server" /></h1>
                            <p class="text-slate-300 text-sm mb-4">
                                <asp:Label ID="lblRolBanner" runat="server" />
                            </p>
                            <div class="flex space-x-2">
                                <span class="px-3 py-1 bg-green-500/20 text-green-400 text-xs font-semibold rounded-full border border-green-500/30">Activa</span>
                                <span class="px-3 py-1 bg-primary/20 text-primary text-xs font-semibold rounded-full border border-primary/30">Zona Norte</span>
                                <asp:Label ID="lblFechaIngresoBadge" runat="server"
                                    CssClass="px-3 py-1 bg-slate-700 text-slate-300 text-xs font-semibold rounded-full border border-slate-600" />
                            </div>
                        </div>
                    </div>

                    <%-- Botones Editar / Guardar / Cancelar --%>
                    <div class="flex space-x-3 pb-2" id="panelBotonesEdicion">
                        <button type="button" id="btnModoEdicion"
                            class="px-5 py-2.5 bg-primary text-white text-sm font-semibold rounded-lg hover:bg-blue-700 transition-colors"
                            onclick="activarEdicion()">
                            Editar perfil
                        </button>
                        <asp:Button ID="btnGuardarPerfil" runat="server" Text="Guardar cambios"
                            CssClass="hidden px-5 py-2.5 bg-green-600 text-white text-sm font-semibold rounded-lg hover:bg-green-700 transition-colors"
                            OnClick="btnGuardarPerfil_Click" />
                        <button type="button" id="btnCancelarEdicion"
                            class="hidden px-5 py-2.5 bg-transparent border border-white/20 text-white text-sm font-semibold rounded-lg hover:bg-white/10 transition-colors"
                            onclick="cancelarEdicion()">
                            Cancelar
                        </button>
                    </div>
                </div>
            </div>

            <%-- FILA 1: Información personal + Laboral --%>
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

                <%-- Información personal --%>
                <div id="panelInfoPersonal"
                    class="lg:col-span-2 bg-white dark:bg-slate-900 p-8 rounded-2xl shadow-sm border border-slate-100 dark:border-slate-800">
                    <div class="flex items-center justify-between mb-8">
                        <h2 class="text-lg font-bold text-slate-800 dark:text-white">Información personal</h2>
                        <span class="material-icons-outlined text-slate-400">info</span>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                        <%-- Nombre --%>
                        <div class="space-y-2">
                            <label class="text-xs font-bold text-slate-400 uppercase tracking-wider">Nombre Completo</label>
                            <p class="campo-texto text-slate-700 dark:text-slate-300 font-medium p-1">
                                <asp:Label ID="lblNombreTexto" runat="server" />
                            </p>
                            <asp:TextBox ID="txtNombre" runat="server"
                                CssClass="campo-input w-full bg-slate-50 dark:bg-slate-800 border-none rounded-xl p-4 text-slate-700 dark:text-slate-300 focus:ring-2 focus:ring-primary/20" />
                        </div>

                        <%-- Documento --%>
                        <div class="space-y-2">
                            <label class="text-xs font-bold text-slate-400 uppercase tracking-wider">Documento</label>
                            <p class="campo-texto text-slate-700 dark:text-slate-300 font-medium p-1">
                                <asp:Label ID="lblDocumentoTexto" runat="server" />
                            </p>
                            <asp:TextBox ID="txtDocumento" runat="server"
                                CssClass="campo-input w-full bg-slate-50 dark:bg-slate-800 border-none rounded-xl p-4 text-slate-700 dark:text-slate-300 focus:ring-2 focus:ring-primary/20" />
                        </div>

                        <%-- Email --%>
                        <div class="space-y-2">
                            <label class="text-xs font-bold text-slate-400 uppercase tracking-wider">Correo Electrónico</label>
                            <p class="campo-texto text-slate-700 dark:text-slate-300 font-medium p-1">
                                <asp:Label ID="lblEmailTexto" runat="server" />
                            </p>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"
                                CssClass="campo-input w-full bg-slate-50 dark:bg-slate-800 border-none rounded-xl p-4 text-slate-700 dark:text-slate-300 focus:ring-2 focus:ring-primary/20" />
                        </div>

                        <%-- Rol (solo lectura) --%>
                        <div class="space-y-2 md:col-span-2">
                            <label class="text-xs font-bold text-slate-400 uppercase tracking-wider">Rol</label>
                            <p class="text-slate-700 dark:text-slate-300 font-medium p-1">
                                <asp:Label ID="lblRolTexto" runat="server" />
                            </p>
                        </div>
                    </div>
                </div>

                <%-- Información laboral (solo lectura) --%>
                <div class="bg-white dark:bg-slate-900 p-8 rounded-2xl shadow-sm border border-slate-100 dark:border-slate-800">
                    <h2 class="text-lg font-bold text-slate-800 dark:text-white mb-8">Información laboral</h2>
                    <div class="space-y-6">
                        <div>
                            <div class="text-[11px] text-slate-400 font-bold uppercase mb-1">Tipo de Contrato</div>
                            <div class="text-sm font-semibold text-slate-800 dark:text-slate-200">
                                <asp:Label ID="lblContrato" runat="server" />
                            </div>
                        </div>
                        <div class="pt-4 border-t border-slate-50 dark:border-slate-800">
                            <div class="text-[11px] text-slate-400 font-bold uppercase mb-1">Supervisor</div>
                            <div class="text-sm font-semibold text-slate-800 dark:text-slate-200">
                                <asp:Label ID="lblSupervisor" runat="server" />
                            </div>
                        </div>
                        <div class="pt-4 border-t border-slate-50 dark:border-slate-800">
                            <div class="text-[11px] text-slate-400 font-bold uppercase mb-1">Fecha de Ingreso</div>
                            <div class="text-sm font-semibold text-slate-800 dark:text-slate-200">
                                <asp:Label ID="lblFechaIngreso" runat="server" />
                            </div>
                        </div>
                        <div class="pt-4 border-t border-slate-50 dark:border-slate-800">
                            <div class="text-[11px] text-slate-400 font-bold uppercase mb-1">Vehículo asignado</div>
                            <div class="text-sm font-semibold text-slate-800 dark:text-slate-200">
                                <asp:Label ID="lblVehiculo" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- FILA 2: Seguridad + Actividad reciente --%>
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

                <%-- Seguridad --%>
                <div class="lg:col-span-2 bg-white dark:bg-slate-900 p-8 rounded-2xl shadow-sm border border-slate-100 dark:border-slate-800">
                    <h2 class="text-lg font-bold text-slate-800 dark:text-white mb-8">Seguridad y Acceso</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">

                        <div class="space-y-2">
                            <label class="text-xs font-bold text-slate-400 uppercase tracking-wider">Contraseña Actual</label>
                            <asp:TextBox ID="txtContrasenaActual" runat="server" TextMode="Password"
                                CssClass="w-full bg-slate-50 dark:bg-slate-800 border-none rounded-xl p-4 text-slate-700 dark:text-slate-300 focus:ring-2 focus:ring-primary/20"
                                placeholder="••••••••" />
                        </div>

                        <div class="space-y-2">
                            <label class="text-xs font-bold text-slate-400 uppercase tracking-wider">Nueva Contraseña</label>
                            <asp:TextBox ID="txtNuevaContrasena" runat="server" TextMode="Password"
                                CssClass="w-full bg-slate-50 dark:bg-slate-800 border-none rounded-xl p-4 text-slate-700 dark:text-slate-300 focus:ring-2 focus:ring-primary/20"
                                placeholder="••••••••" />
                        </div>

                        <div class="space-y-2 md:col-span-2">
                            <label class="text-xs font-bold text-slate-400 uppercase tracking-wider">Confirmar Contraseña</label>
                            <asp:TextBox ID="txtConfirmarContrasena" runat="server" TextMode="Password"
                                CssClass="w-full bg-slate-50 dark:bg-slate-800 border-none rounded-xl p-4 text-slate-700 dark:text-slate-300 focus:ring-2 focus:ring-primary/20"
                                placeholder="••••••••" />
                        </div>
                    </div>
                    <div class="flex justify-end">
                        <asp:Button ID="btnActualizarContrasena" runat="server" Text="Actualizar Contraseña"
                            CssClass="bg-[#0d1b3e] text-white px-8 py-3 rounded-xl font-bold text-sm hover:bg-slate-900 transition-colors shadow-lg cursor-pointer"
                            OnClick="btnActualizarContrasena_Click" />
                    </div>
                </div>

                <%-- Actividad reciente --%>
                <div class="bg-white dark:bg-slate-900 p-8 rounded-2xl shadow-sm border border-slate-100 dark:border-slate-800">
                    <h2 class="text-lg font-bold text-slate-800 dark:text-white mb-8">Actividad reciente</h2>
                    <div class="relative space-y-8 pb-4">
                        <div class="absolute left-[7px] top-2 bottom-2 w-[2px] bg-slate-100 dark:bg-slate-800"></div>
                        <asp:Repeater ID="rptActividad" runat="server">
                            <ItemTemplate>
                                <div class="relative pl-8">
                                    <div class="absolute left-0 top-1.5 w-4 h-4 bg-primary rounded-full border-4 border-blue-100 dark:border-blue-900/50"></div>
                                    <div class="text-[11px] text-slate-400 font-bold mb-1">
                                        <%# Eval("Fecha") %>
                                    </div>
                                    <div class="text-sm font-medium text-slate-700 dark:text-slate-300">
                                        <%# Eval("Descripcion") %>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>

            <%-- Cerrar sesión --%>
            <div class="bg-red-50 dark:bg-red-950/20 border border-red-100 dark:border-red-900/30 p-6 rounded-2xl flex items-center justify-between">
                <div>
                    <h3 class="text-red-600 dark:text-red-400 font-bold mb-1">Cerrar Sesión</h3>
                    <p class="text-red-500/80 dark:text-red-400/60 text-sm">Al salir, deberás ingresar tus credenciales nuevamente.</p>
                </div>
                <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión"
                    CssClass="bg-[#e53935] hover:bg-[#d32f2f] text-white px-8 py-3 rounded-xl font-bold text-sm shadow-md transition-all active:scale-95 cursor-pointer"
                    OnClick="btnCerrarSesion_Click"
                    OnClientClick="return confirm('¿Seguro que deseas cerrar sesión?');" />
            </div>

            <footer class="text-center py-8 text-slate-400 text-xs">
                © 2024 Kepler Distributor Web Portal. Todos los derechos reservados.
            </footer>
        </div>
    </main>

    <script>
        /* ── Toast ── */
        function mostrarToast(msg, tipo) {
            const t = document.getElementById('toast');
            t.textContent = msg;
            t.className = 'show ' + tipo;
            setTimeout(() => t.className = '', 3000);
        }

        /* Leer mensaje del servidor al cargar */
        window.addEventListener('load', function () {
            const msg = document.getElementById('<%= hfMensaje.ClientID %>').value;
            const tipo = document.getElementById('<%= hfTipoMsg.ClientID %>').value;
            if (msg) mostrarToast(msg, tipo);
        });

        /* ── Modo edición ── */
        function activarEdicion() {
            document.getElementById('panelInfoPersonal').classList.add('modo-edicion');
            document.getElementById('btnModoEdicion').classList.add('hidden');
            document.getElementById('<%= btnGuardarPerfil.ClientID %>').classList.remove('hidden');
            document.getElementById('btnCancelarEdicion').classList.remove('hidden');
        }

        function cancelarEdicion() {
            document.getElementById('panelInfoPersonal').classList.remove('modo-edicion');
            document.getElementById('btnModoEdicion').classList.remove('hidden');
            document.getElementById('<%= btnGuardarPerfil.ClientID %>').classList.add('hidden');
            document.getElementById('btnCancelarEdicion').classList.add('hidden');
        }

        /* ── Upload foto: envía el form al seleccionar archivo ── */
        document.addEventListener('DOMContentLoaded', function () {
            const fu = document.getElementById('<%= fuFoto.ClientID %>');
            if (fu) {
                fu.addEventListener('change', function () {
                    // Simula clic en el botón oculto para hacer postback
                    document.getElementById('<%= btnSubirFoto.ClientID %>').click();
            });
            }
        });
    </script>

</asp:Content>
