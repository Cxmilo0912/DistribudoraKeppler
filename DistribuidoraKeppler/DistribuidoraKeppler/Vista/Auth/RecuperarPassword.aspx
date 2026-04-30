<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarPassword.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Auth.RecuperarPassword" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Recuperar Contraseña - Distribuidora Keppler</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { background-color: #0b1724; }
    </style>
</head>
<body class="flex items-center justify-center min-h-screen">
    <form runat="server" class="w-full max-w-sm p-4">
        
        <div class="bg-white p-8 rounded-xl shadow-2xl text-center">
            <div class="flex justify-center mb-4">
                <svg class="w-12 h-12 text-gray-800" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                </svg>
            </div>

            <h2 class="text-2xl font-bold text-gray-800 mb-2">Recuperar contraseña</h2>
            <p class="text-sm text-gray-500 mb-8">Ingresa tu correo para recibir las instrucciones.</p>

            <asp:Label ID="lblMensaje" runat="server" 
                CssClass="block mb-6 p-3 text-xs font-semibold rounded-lg text-center" 
                Visible="false"></asp:Label>

            <div class="text-left space-y-5">
                <div>
                    <label class="text-[10px] font-bold text-gray-400 uppercase tracking-widest ml-1">Correo Electrónico</label>
                    <asp:TextBox ID="txtEmail" runat="server" 
                        CssClass="w-full p-3 mt-1 border border-gray-200 rounded focus:outline-none focus:ring-2 focus:ring-gray-800 transition" 
                        placeholder="ejemplo@correo.com" TextMode="Email" />
                </div>

                <asp:Button ID="btnEnviar" runat="server" 
                    Text="Enviar enlace" 
                    OnClick="btnEnviar_Click" 
                    CssClass="w-full bg-[#111827] hover:bg-black text-white font-bold py-3 rounded transition duration-200 cursor-pointer" />
            </div>

            <div class="mt-6">
                <a href="Login.aspx" class="text-xs text-gray-400 hover:text-gray-600 transition underline decoration-gray-300">
                    ← Volver al inicio de sesión
                </a>
            </div>

            <p class="mt-10 text-[10px] text-gray-300">© Distribuidora Keppler</p>
        </div>

    </form>
</body>
</html>