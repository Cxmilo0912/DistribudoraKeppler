<%@ Page Title="Crear Usuario - Keppler" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="CrearTrabajador.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.CrearTrabajador" %>

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
                    <span class="hover:text-white cursor-pointer transition-colors">Usuarios</span>
                    <i class="fas fa-chevron-right text-[9px] text-slate-600"></i>
                    <span class="text-blue-400">Nuevo Registro</span>
                </nav>
                <h2 class="text-2xl md:text-3xl font-bold text-white tracking-tight">Crear Nuevo Usuario</h2>
                <p class="text-sm text-slate-400 mt-1">Configure los accesos y datos de identidad del nuevo integrante de la plataforma.</p>
            </div>
            <div class="flex items-center gap-3 w-full sm:w-auto justify-end">
                <button type="button" class="w-full sm:w-auto bg-slate-800 hover:bg-slate-700 text-slate-300 px-5 py-2.5 rounded-xl text-xs font-semibold border border-slate-700/40 transition-all cursor-pointer" onclick="window.location.href='GestionUsuarios.aspx'">
                    Cancelar
                </button>
                <asp:Button ID="btnGuardar" runat="server" CssClass="w-full sm:w-auto bg-blue-600 hover:bg-blue-500 text-white px-5 py-2.5 rounded-xl flex items-center justify-center gap-2 text-xs font-semibold shadow-lg shadow-blue-600/10 transition-all active:scale-[0.98] cursor-pointer" OnClick="btnGuardar_Click" Text="Crear Usuario" />
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

            <div class="lg:col-span-2 space-y-6">

                <div class="bg-white p-6 md:p-8 rounded-2xl border border-slate-200/80 shadow-sm space-y-5">
                    <div class="flex items-center gap-2.5 pb-3 border-b border-slate-100 text-slate-800 font-bold text-base">
                        <i class="fas fa-id-card text-blue-600"></i>
                        <span>Datos de Identidad</span>
                    </div>

                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Nombre Completo *</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="w-full border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 px-4 text-sm text-slate-800 transition-all placeholder:text-slate-400" placeholder="Ej. Juan Román Riquelme"></asp:TextBox>
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Documento de Identidad *</label>
                            <asp:TextBox ID="txtDocumento" runat="server" CssClass="w-full border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 px-4 text-sm text-slate-800 transition-all placeholder:text-slate-400" placeholder="C.C. o NIT..."></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="bg-white p-6 md:p-8 rounded-2xl border border-slate-200/80 shadow-sm space-y-5">
                    <div class="flex items-center gap-2.5 pb-3 border-b border-slate-100 text-slate-800 font-bold text-base">
                        <i class="fas fa-lock text-blue-600"></i>
                        <span>Seguridad y Credenciales</span>
                    </div>

                    <div>
                        <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Correo Electrónico *</label>
                        <div class="relative">
                            <span class="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 text-sm"><i class="fas fa-envelope"></i></span>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="w-full pl-10 pr-4 border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 text-sm text-slate-800 transition-all placeholder:text-slate-400" placeholder="ejemplo@kepler.com" AutoCompleteType="Email"></asp:TextBox>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Rol Asignado *</label>
                            <div class="relative">
                                <asp:DropDownList ID="ddlRoles" runat="server" CssClass="w-full bg-white border border-slate-200 pl-4 pr-10 py-2.5 rounded-xl text-sm text-slate-700 appearance-none focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 transition-all cursor-pointer"></asp:DropDownList>
                                <i class="fas fa-chevron-down absolute right-4 top-1/2 -translate-y-1/2 text-slate-400 pointer-events-none text-[10px]"></i>
                            </div>
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-slate-500 uppercase tracking-wider mb-2">Contraseña *</label>
                            <div class="relative">
                                <span class="absolute left-4 top-1/2 -translate-y-1/2 text-slate-400 text-sm"><i class="fas fa-key"></i></span>
                                <asp:TextBox ID="txtContraseña" runat="server" CssClass="w-full pl-10 pr-10 border border-slate-200 rounded-xl focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 py-2.5 text-sm text-slate-800 transition-all placeholder:text-slate-400" placeholder="••••••••"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="space-y-6">

                <div class="bg-white p-6 rounded-2xl border border-slate-200/80 shadow-sm space-y-4">
                    <div class="flex items-center gap-2.5 pb-2 border-b border-slate-100 text-slate-800 font-bold text-base">
                        <i class="fas fa-camera text-blue-600"></i>
                        <span>Fotografía</span>
                    </div>

                    <div class="border-2 border-dashed border-blue-100 rounded-xl bg-blue-50/20 p-5 flex flex-col items-center justify-center text-center transition-all hover:bg-blue-50/40 hover:border-blue-300 cursor-pointer">
                        <div class="w-10 h-10 bg-blue-100 rounded-xl flex items-center justify-center mb-3 text-blue-600 shadow-sm">
                            <i class="fas fa-user-circle text-base"></i>
                        </div>
                        <p class="text-xs font-bold text-slate-800">Cargar Foto de Perfil</p>
                        <p class="text-[11px] text-slate-400 mt-1 leading-normal px-2">Click para examinar archivos locales.</p>
                        <p class="text-[9px] text-slate-400 uppercase font-medium mt-1">Soportado: PNG, JPG (Max 3MB)</p>
                    </div>

                    <div class="border border-slate-100 bg-slate-50/50 rounded-xl p-2.5 flex items-center gap-3">
                        <div class="w-10 h-10 rounded-full bg-white overflow-hidden flex-shrink-0 border border-slate-200 flex items-center justify-center shadow-inner">
                            <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuBT4kS5zK_xscYvgvpuDLGFi74OX5bEevuT1_nchyTD5szD9M-GGpSsQNWC4xU7m8knhD2rEBCfc5mAPwZOxhm7oeQoByUA29xYoCfAdK-0aTdNFAQ7-lzAIUxn2z3-Ks0kUA7xoGMY3q3HHioQGqTeIB6c-lNRV7BBAIwc45-nEiGYOIPSaFMgc4d1VtNF5Hz118SCRdF0pPSCxw0ohtovAiBdTukh1Xbo5wLUu96tYs5MJForv6Wu_7CUo6x7YVmr83eZpN1pEGE" alt="User Avatar Preview" class="w-full h-full object-cover" />
                        </div>
                        <div class="flex-1 min-w-0">
                            <p class="text-[11px] font-bold text-slate-700 truncate">default_avatar.jpg</p>
                            <p class="text-[10px] text-slate-400 font-medium mt-0.5">Preestablecido</p>
                        </div>
                    </div>
                </div>

                <div class="bg-blue-50/60 border border-blue-100/80 p-4 rounded-xl flex items-start gap-3">
                    <i class="fas fa-info-circle text-blue-600 mt-0.5 text-sm"></i>
                    <div>
                        <h4 class="text-xs font-bold text-[#001838] leading-tight">Envío Automático</h4>
                        <p class="text-[11px] text-slate-600 mt-0.5 leading-relaxed">El sistema remitirá las credenciales al correo del usuario de manera inmediata tras el guardado.</p>
                    </div>
                </div>

            </div>

        </div>

    </div>
</asp:Content>
