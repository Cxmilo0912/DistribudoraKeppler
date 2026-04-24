<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrarCliente.aspx.cs" Inherits="DistribuidoraKeppler.Vista.RegistrarCliente" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Registro de Cliente - Distribuidora Keppler</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <div class="card p-4 shadow-lg" style="max-width:500px; margin:auto;">
            <h3 class="text-center mb-4 text-primary">Registro de Cliente</h3>

            <div class="mb-3">
                <asp:Label runat="server" AssociatedControlID="txtNombreEmpresa" Text="Nombre Empresa" CssClass="form-label" />
                <asp:TextBox ID="txtNombreEmpresa" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <asp:Label runat="server" AssociatedControlID="txtNit" Text="NIT" CssClass="form-label" />
                <asp:TextBox ID="txtNit" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <asp:Label runat="server" AssociatedControlID="txtDireccion" Text="Dirección" CssClass="form-label" />
                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <asp:Label runat="server" AssociatedControlID="txtEmail" Text="Email" CssClass="form-label" />
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
            </div>

            <div class="mb-3">
                <asp:Label runat="server" AssociatedControlID="txtTelefono" Text="Teléfono" CssClass="form-label" />
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" />
            </div>

            <div class="mb-3">
                <asp:Label runat="server" AssociatedControlID="txtContrasena" Text="Contraseña" CssClass="form-label" />
                <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control" TextMode="Password" />
            </div>

            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-primary w-100" OnClick="btnRegistrar_Click" />
        </div>
    </form>
</body>
</html>
