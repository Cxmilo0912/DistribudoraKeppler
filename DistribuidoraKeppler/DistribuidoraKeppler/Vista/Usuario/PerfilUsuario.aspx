<%@ Page Title="Perfil de Usuario - Keppler" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="PerfilUsuario.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Usuario.PerfilUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body, input, button, textarea {
            font-family: 'Outfit', sans-serif !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="max-w-4xl mx-auto space-y-6 py-4">

        <div class="bg-gradient-to-r from-[#001838] to-[#000b1a] rounded-2xl p-6 md:p-8 flex flex-col md:flex-row items-center justify-between gap-6 shadow-xl shadow-blue-950/10 border border-slate-900/40">

            <div class="flex flex-col sm:flex-row items-center gap-5 w-full md:w-auto">
                <div class="relative shrink-0">
                    <div class="w-24 h-24 rounded-full bg-gradient-to-tr from-blue-600 to-indigo-600 border-4 border-blue-500/30 flex items-center justify-center font-bold text-3xl text-white shadow-lg">
                        <asp:Image ID="imgPerfil" runat="server" CssClass="w-full h-full rounded-full object-cover" Style="display: none;" />
                        <asp:Literal ID="litIniciales" runat="server" Text="U" />
                    </div>
                </div>

                <div class="text-center sm:text-left">
                    <h2 class="text-2xl font-bold text-white tracking-tight">
                        <asp:Literal ID="litNombreHeader" runat="server" Text="Nombre Usuario" />
                    </h2>
                    <p class="text-sm text-slate-400 mt-0.5">
                        <asp:Literal ID="litEmailHeader" runat="server" Text="usuario@keppler.com" />
                    </p>
                    <div class="mt-3">
                        <span class="inline-flex items-center gap-2 bg-blue-500/10 border border-blue-500/20 text-blue-400 text-xs font-semibold px-3 py-1 rounded-full">
                            <span class="w-1.5 h-1.5 rounded-full bg-blue-400 animate-pulse"></span>
                            Personal Interno
                        </span>
                    </div>
                </div>
            </div>

            <div class="flex flex-col items-center md:items-end gap-2 w-full md:w-auto border-t border-slate-800/60 md:border-t-0 pt-4 md:pt-0">
                <asp:FileUpload ID="fuImagen" runat="server"
                    CssClass="block w-full text-xs text-slate-400 file:mr-4 file:py-2 file:px-4 file:rounded-xl file:border-0 file:text-xs file:font-semibold file:bg-slate-800 file:text-slate-200 hover:file:bg-slate-700 transition-all cursor-pointer max-w-xs" />

                <asp:Button ID="btnSubirFoto" runat="server"
                    Text="Cambiar foto"
                    CssClass="w-full md:w-auto mt-1 bg-slate-800 hover:bg-slate-700 text-slate-300 font-medium text-xs px-4 py-2 rounded-xl border border-slate-700/40 transition-all cursor-pointer shadow-sm"
                    OnClick="btnSubirFoto_Click" />
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

            <div class="bg-white rounded-2xl p-6 border border-slate-200/80 shadow-sm lg:col-span-2 flex flex-col justify-between">
                <div>
                    <div class="border-b border-slate-100 pb-3 mb-5">
                        <h3 class="text-xs font-bold text-slate-400 uppercase tracking-widest">Datos Personales</h3>
                    </div>

                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <div class="flex flex-col gap-1.5">
                            <label class="text-xs font-bold text-slate-500 uppercase tracking-wider" for="<%= txtNombre.ClientID %>">Nombre Completo</label>
                            <asp:TextBox ID="txtNombre" runat="server"
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-800 focus:outline-none focus:border-blue-600 focus:bg-white focus:ring-4 focus:ring-blue-600/10 transition-all" />
                        </div>

                        <div class="flex flex-col gap-1.5">
                            <label class="text-xs font-bold text-slate-500 uppercase tracking-wider" for="<%= txtEmail.ClientID %>">Correo Electrónico</label>
                            <asp:TextBox ID="txtEmail" runat="server"
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-800 focus:outline-none focus:border-blue-600 focus:bg-white focus:ring-4 focus:ring-blue-600/10 transition-all" />
                        </div>
                    </div>
                </div>

                <div class="pt-6 mt-6 border-t border-slate-100 flex justify-end">
                    <asp:Button ID="btnGuardar" runat="server"
                        Text="Guardar Cambios"
                        OnClick="btnGuardar_Click"
                        CssClass="w-full sm:w-auto bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-500 hover:to-blue-600 text-white font-semibold text-sm px-6 py-2.5 rounded-xl cursor-pointer shadow-md shadow-blue-600/10 transition-all active:scale-[0.98]" />
                </div>
            </div>

            <div class="bg-white rounded-2xl p-6 border border-slate-200/80 shadow-sm flex flex-col justify-between">
                <div>
                    <div class="border-b border-slate-100 pb-3 mb-5">
                        <h3 class="text-xs font-bold text-slate-400 uppercase tracking-widest">Seguridad</h3>
                    </div>

                    <div class="space-y-4">
                        <div class="flex flex-col gap-1.5">
                            <label class="text-xs font-bold text-slate-500 uppercase tracking-wider" for="<%= txtActual.ClientID %>">Clave Actual</label>
                            <asp:TextBox ID="txtActual" runat="server"
                                TextMode="Password"
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-800 focus:outline-none focus:border-blue-600 focus:bg-white focus:ring-4 focus:ring-blue-600/10 transition-all"
                                placeholder="••••••••" />
                        </div>

                        <div class="flex flex-col gap-1.5">
                            <label class="text-xs font-bold text-slate-500 uppercase tracking-wider" for="<%= txtNueva.ClientID %>">Nueva Clave</label>
                            <asp:TextBox ID="txtNueva" runat="server"
                                TextMode="Password"
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-800 focus:outline-none focus:border-blue-600 focus:bg-white focus:ring-4 focus:ring-blue-600/10 transition-all"
                                placeholder="Mín. 8 caracteres" />
                        </div>

                        <div class="flex flex-col gap-1.5">
                            <label class="text-xs font-bold text-slate-500 uppercase tracking-wider" for="<%= txtConfirmar.ClientID %>">Confirmar Clave</label>
                            <asp:TextBox ID="txtConfirmar" runat="server"
                                TextMode="Password"
                                CssClass="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-2.5 text-sm text-slate-800 focus:outline-none focus:border-blue-600 focus:bg-white focus:ring-4 focus:ring-blue-600/10 transition-all"
                                placeholder="Repita la clave" />
                        </div>
                    </div>
                </div>

                <div class="pt-6 mt-6 border-t border-slate-100">
                    <asp:Button ID="btnCambiarPass" runat="server"
                        Text="Actualizar Contraseña"
                        CssClass="w-full bg-slate-100 hover:bg-slate-200 text-blue-600 border border-blue-200/60 font-semibold text-sm px-4 py-2.5 rounded-xl cursor-pointer transition-all active:scale-[0.98]"
                        OnClick="btnCambiarPass_Click" />
                </div>
            </div>

        </div>
    </div>
</asp:Content>
