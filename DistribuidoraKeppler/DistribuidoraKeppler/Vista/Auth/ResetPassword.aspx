<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Auth.ResetPassword" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Nueva contraseña</title>
</head>
<body>
    <form runat="server">

        <h2>Nueva contraseña</h2>

        <asp:TextBox ID="txtNueva" runat="server" TextMode="Password" placeholder="Nueva contraseña" />
        <br />
        <br />

        <asp:TextBox ID="txtConfirmar" runat="server" TextMode="Password" placeholder="Confirmar contraseña" />
        <br />
        <br />

        <asp:Button ID="btnCambiar" runat="server" Text="Cambiar" OnClick="btnCambiar_Click" />

    </form>
</body>
</html>
