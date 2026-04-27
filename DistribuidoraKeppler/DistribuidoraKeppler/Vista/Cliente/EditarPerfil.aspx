<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="EditarPerfil.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.EditarPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #F8F9FB;
            color: #111827;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 p-10 overflow-y-auto">
        <!-- Header -->
        <header class="mb-8 flex items-center gap-4">
            <a href="PerfilCliente.aspx" class="w-10 h-10 bg-white rounded-xl border border-gray-100 flex items-center justify-center hover:bg-gray-50 transition-colors">
                <svg class="w-5 h-5 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path d="M15 19l-7-7 7-7" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" />
                </svg>
            </a>
            <div>
                <h2 class="text-3xl font-bold text-gray-900">Editar Perfil</h2>
                <p class="text-gray-500 mt-1">Actualice su información personal.</p>
            </div>
        </header>

        <!-- Formulario -->
        <div class="bg-white rounded-3xl p-8 border border-gray-100 shadow-sm max-w-2xl">

            <!-- Mensaje de error -->
            <asp:Panel ID="pnlError" runat="server" Visible="false"
                CssClass="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-xl mb-6 flex items-center gap-2">
                <span class="material-symbols-outlined text-red-500">error</span>
                <asp:Label ID="lblError" runat="server" />
            </asp:Panel>

            <!-- NombreEmpresa -->
            <div class="mb-6">
                <label class="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">
                    Nombre Empresa
           
                </label>
                <asp:TextBox
                    ID="txtNombreEmpresa"
                    runat="server"
                    MaxLength="100"
                    CssClass="w-full bg-[#F8F9FB] border border-gray-200 rounded-xl px-4 py-3 text-gray-900 font-medium focus:outline-none focus:ring-2 focus:ring-[#0A0A6E] focus:border-transparent transition-all" />
                <asp:RequiredFieldValidator
                    ID="rfvNombre" runat="server"
                    ControlToValidate="txtNombreEmpresa"
                    ErrorMessage="El nombre es obligatorio."
                    CssClass="text-red-500 text-xs mt-1 block"
                    Display="Dynamic" />
            </div>

            <!-- Email -->
            <div class="mb-6">
                <label class="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">
                    Correo Electrónico
           
                </label>
                <asp:TextBox
                    ID="txtEmail"
                    runat="server"
                    TextMode="Email"
                    MaxLength="100"
                    CssClass="w-full bg-[#F8F9FB] border border-gray-200 rounded-xl px-4 py-3 text-gray-900 font-medium focus:outline-none focus:ring-2 focus:ring-[#0A0A6E] focus:border-transparent transition-all" />
                <asp:RequiredFieldValidator
                    ID="rfvEmail" runat="server"
                    ControlToValidate="txtEmail"
                    ErrorMessage="El correo es obligatorio."
                    CssClass="text-red-500 text-xs mt-1 block"
                    Display="Dynamic" />
                <asp:RegularExpressionValidator
                    ID="revEmail" runat="server"
                    ControlToValidate="txtEmail"
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                    ErrorMessage="El correo no tiene un formato válido."
                    CssClass="text-red-500 text-xs mt-1 block"
                    Display="Dynamic" />
            </div>

            <!-- Teléfono -->
            <div class="mb-6">
                <label class="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">
                    Teléfono
           
                </label>
                <asp:TextBox
                    ID="txtTelefono"
                    runat="server"
                    MaxLength="20"
                    CssClass="w-full bg-[#F8F9FB] border border-gray-200 rounded-xl px-4 py-3 text-gray-900 font-medium focus:outline-none focus:ring-2 focus:ring-[#0A0A6E] focus:border-transparent transition-all" />
                <asp:RequiredFieldValidator
                    ID="rfvTelefono" runat="server"
                    ControlToValidate="txtTelefono"
                    ErrorMessage="El teléfono es obligatorio."
                    CssClass="text-red-500 text-xs mt-1 block"
                    Display="Dynamic" />
            </div>

            <!-- Dirección -->
            <div class="mb-6">
                <label class="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">
                    Dirección
           
                </label>
                <asp:TextBox
                    ID="txtDireccion"
                    runat="server"
                    MaxLength="200"
                    CssClass="w-full bg-[#F8F9FB] border border-gray-200 rounded-xl px-4 py-3 text-gray-900 font-medium focus:outline-none focus:ring-2 focus:ring-[#0A0A6E] focus:border-transparent transition-all" />
                <asp:RequiredFieldValidator
                    ID="rfvDireccion" runat="server"
                    ControlToValidate="txtDireccion"
                    ErrorMessage="La dirección es obligatoria."
                    CssClass="text-red-500 text-xs mt-1 block"
                    Display="Dynamic" />
            </div>

            <!-- Barrio -->
            <div class="mb-8">
                <label class="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">
                    Barrio
           
                </label>
                <asp:DropDownList
                    ID="ddlBarrio"
                    runat="server"
                    CssClass="w-full bg-[#F8F9FB] border border-gray-200 rounded-xl px-4 py-3 text-gray-900 font-medium focus:outline-none focus:ring-2 focus:ring-[#0A0A6E] focus:border-transparent transition-all" />
                <asp:RequiredFieldValidator
                    ID="rfvBarrio" runat="server"
                    ControlToValidate="ddlBarrio"
                    InitialValue="0"
                    ErrorMessage="Seleccione un barrio."
                    CssClass="text-red-500 text-xs mt-1 block"
                    Display="Dynamic" />
            </div>

            <!-- Botones -->
            <div class="flex gap-3">
                <asp:Button
                    ID="btnGuardar"
                    runat="server"
                    Text="Guardar cambios"
                    OnClick="btnGuardar_Click"
                    CssClass="bg-[#0A0A6E] text-white px-6 py-3 rounded-xl font-medium text-sm hover:opacity-90 transition-opacity cursor-pointer" />
                <a href="PerfilCliente.aspx"
                    class="bg-[#F3F4F6] text-gray-700 px-6 py-3 rounded-xl font-medium text-sm hover:bg-gray-200 transition-colors">Cancelar
            </a>
            </div>
        </div>

    </main>
</asp:Content>
