<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="CambiarContrasena.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.CambiarContrasena" %>

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
                <h2 class="text-3xl font-bold text-gray-900">Cambiar Contraseña</h2>
                <p class="text-gray-500 mt-1">Actualice su contraseña de acceso.</p>
            </div>
        </header>

        <!-- Formulario -->
        <div class="bg-white rounded-3xl p-8 border border-gray-100 shadow-sm max-w-md">

            <!-- Mensaje error -->
            <asp:Panel ID="pnlError" runat="server" Visible="false"
                CssClass="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-xl mb-6 flex items-center gap-2">
                <span class="material-symbols-outlined text-red-500">error</span>
                <asp:Label ID="lblError" runat="server" />
            </asp:Panel>

            <!-- Contraseña actual -->
            <div class="mb-6">
                <label class="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">
                    Contraseña Actual
           
                </label>
                <div class="relative">
                    <asp:TextBox
                        ID="txtActual"
                        runat="server"
                        TextMode="Password"
                        CssClass="w-full bg-[#F8F9FB] border border-gray-200 rounded-xl px-4 py-3 text-gray-900 font-medium focus:outline-none focus:ring-2 focus:ring-[#0A0A6E] focus:border-transparent transition-all pr-12" />
                    <button type="button" onclick="togglePassword('txtActual', this)"
                        class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600">
                        <span class="material-symbols-outlined text-xl">visibility</span>
                    </button>
                </div>
                <asp:RequiredFieldValidator
                    ID="rfvActual" runat="server"
                    ControlToValidate="txtActual"
                    ErrorMessage="Ingrese su contraseña actual."
                    CssClass="text-red-500 text-xs mt-1 block"
                    Display="Dynamic" />
            </div>

            <!-- Nueva contraseña -->
            <div class="mb-6">
                <label class="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">
                    Nueva Contraseña
           
                </label>
                <div class="relative">
                    <asp:TextBox
                        ID="txtNueva"
                        runat="server"
                        TextMode="Password"
                        CssClass="w-full bg-[#F8F9FB] border border-gray-200 rounded-xl px-4 py-3 text-gray-900 font-medium focus:outline-none focus:ring-2 focus:ring-[#0A0A6E] focus:border-transparent transition-all pr-12" />
                    <button type="button" onclick="togglePassword('txtNueva', this)"
                        class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600">
                        <span class="material-symbols-outlined text-xl">visibility</span>
                    </button>
                </div>
                <asp:RequiredFieldValidator
                    ID="rfvNueva" runat="server"
                    ControlToValidate="txtNueva"
                    ErrorMessage="Ingrese la nueva contraseña."
                    CssClass="text-red-500 text-xs mt-1 block"
                    Display="Dynamic" />
                <asp:RegularExpressionValidator
                    ID="revNueva" runat="server"
                    ControlToValidate="txtNueva"
                    ValidationExpression="^.{6,}$"
                    ErrorMessage="La contraseña debe tener al menos 6 caracteres."
                    CssClass="text-red-500 text-xs mt-1 block"
                    Display="Dynamic" />
            </div>

            <!-- Confirmar nueva contraseña -->
            <div class="mb-8">
                <label class="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">
                    Confirmar Nueva Contraseña
           
                </label>
                <div class="relative">
                    <asp:TextBox
                        ID="txtConfirmar"
                        runat="server"
                        TextMode="Password"
                        CssClass="w-full bg-[#F8F9FB] border border-gray-200 rounded-xl px-4 py-3 text-gray-900 font-medium focus:outline-none focus:ring-2 focus:ring-[#0A0A6E] focus:border-transparent transition-all pr-12" />
                    <button type="button" onclick="togglePassword('txtConfirmar', this)"
                        class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600">
                        <span class="material-symbols-outlined text-xl">visibility</span>
                    </button>
                </div>
                <asp:RequiredFieldValidator
                    ID="rfvConfirmar" runat="server"
                    ControlToValidate="txtConfirmar"
                    ErrorMessage="Confirme la nueva contraseña."
                    CssClass="text-red-500 text-xs mt-1 block"
                    Display="Dynamic" />
                <asp:CompareValidator
                    ID="cvContrasena" runat="server"
                    ControlToValidate="txtConfirmar"
                    ControlToCompare="txtNueva"
                    ErrorMessage="Las contraseñas no coinciden."
                    CssClass="text-red-500 text-xs mt-1 block"
                    Display="Dynamic" />
            </div>

            <!-- Botones -->
            <div class="flex gap-3">
                <asp:Button
                    ID="btnGuardar"
                    runat="server"
                    Text="Actualizar contraseña"
                    OnClick="btnGuardar_Click"
                    CssClass="bg-[#0A0A6E] text-white px-6 py-3 rounded-xl font-medium text-sm hover:opacity-90 transition-opacity cursor-pointer" />
                <a href="PerfilCliente.aspx"
                    class="bg-[#F3F4F6] text-gray-700 px-6 py-3 rounded-xl font-medium text-sm hover:bg-gray-200 transition-colors">Cancelar
            </a>
            </div>
        </div>

    </main>

    <script>
        // Muestra/oculta la contraseña
        function togglePassword(controlId, btn) {
            var input = document.getElementById('<%= Page.ClientID %>_' + controlId)
                || document.querySelector('[id$="_' + controlId + '"]')
                || document.querySelector('[id*="' + controlId + '"]');
            var icon = btn.querySelector('span');
            if (input.type === 'password') {
                input.type = 'text';
                icon.textContent = 'visibility_off';
            } else {
                input.type = 'password';
                icon.textContent = 'visibility';
            }
        }
</script>
</asp:Content>
