<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Auth.ResetPassword" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Nueva contraseña - Distribuidora Keppler</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { background-color: #0b1724; }
    </style>
</head>
<body class="flex items-center justify-center min-h-screen">
    <form runat="server" class="w-full max-w-sm p-4">
        
        <div class="bg-white p-8 rounded-xl shadow-lg text-center">
            <h2 class="text-2xl font-bold text-gray-800 mb-2">Nueva contraseña</h2>
            <p class="text-sm text-gray-500 mb-6 text-center">Ingresa tu nueva clave de acceso.</p>

            <asp:Label ID="lblError" runat="server" 
                CssClass="block mb-6 p-3 text-xs font-semibold text-red-600 bg-red-50 border border-red-200 rounded-lg text-center" 
                Visible="false"></asp:Label>

            <div class="text-left space-y-4">
                <div class="relative">
                    <label class="text-[10px] font-bold text-gray-400 uppercase tracking-widest ml-1">Nueva Contraseña</label>
                    <asp:TextBox ID="txtNueva" runat="server" 
                        CssClass="w-full p-3 mt-1 border border-gray-200 rounded focus:outline-none focus:ring-2 focus:ring-gray-800 transition pr-10" 
                        TextMode="Password" placeholder="••••••••" />
                    <button type="button" onclick="togglePassword('<%= txtNueva.ClientID %>')" class="absolute right-3 top-9 text-gray-400 hover:text-gray-600">
                        👈
                    </button>
                </div>

                <div class="relative">
                    <label class="text-[10px] font-bold text-gray-400 uppercase tracking-widest ml-1">Confirmar Contraseña</label>
                    <asp:TextBox ID="txtConfirmar" runat="server" 
                        CssClass="w-full p-3 mt-1 border border-gray-200 rounded focus:outline-none focus:ring-2 focus:ring-gray-800 transition pr-10" 
                        TextMode="Password" placeholder="••••••••" />
                    <button type="button" onclick="togglePassword('<%= txtConfirmar.ClientID %>')" class="absolute right-3 top-9 text-gray-400 hover:text-gray-600">
                        👈
                    </button>
                </div>

                <asp:Button ID="btnCambiar" runat="server" 
                    Text="Actualizar contraseña" 
                    OnClick="btnCambiar_Click" 
                    CssClass="w-full bg-[#111827] hover:bg-black text-white font-bold py-3 rounded transition duration-200 mt-2 cursor-pointer" />
            </div>

            <p class="mt-8 text-[10px] text-gray-300">© Distribuidora Keppler</p>
        </div>
    </form>

    <script>
        function togglePassword(clientId) {
            var input = document.getElementById(clientId);
            if (input.type === "password") {
                input.type = "text";
            } else {
                input.type = "password";
            }
        }
    </script>
</body>
</html>