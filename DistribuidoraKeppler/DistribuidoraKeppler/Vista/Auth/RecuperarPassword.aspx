<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarPassword.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Auth.RecuperarPassword" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Recuperar contraseña</title>
</head>
<body>
    <form runat="server">

        <h2>Recuperar contraseña</h2>

        <asp:TextBox ID="txtCorreo" runat="server" placeholder="Correo" />
        <br />
        <br />

        <asp:Button ID="btnEnviar" runat="server" Text="Enviar enlace" OnClick="btnEnviar_Click" />

    </form>
</body>
</html>
