<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="PerfilCliente.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="max-width: 900px; margin: auto;">

        <h2>Mi Perfil</h2>

        <asp:Image ID="imgPerfil" runat="server" Width="120" />
        <div style="margin-top: 10px;">
            <asp:FileUpload ID="fuImagen" runat="server" CssClass="form-control" />

            <asp:Button ID="btnSubirFoto" runat="server"
                Text="Subir Foto"
                CssClass="btn btn-primary mt-2"
                OnClick="btnSubirFoto_Click" />
        </div>
        <div>
            <label>Empresa:</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
        </div>

        <div>
            <label>Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
        </div>

        <div>
            <label>Teléfono:</label>
            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" />
        </div>

        <div>
            <label>Dirección:</label>
            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" />
        </div>

        <asp:Button ID="btnGuardar" runat="server"
            Text="Guardar cambios"
            OnClick="btnGuardar_Click"
            CssClass="btn btn-success" />
        <%-- Cambiar contraseña --%>
        <div class="bg-white p-6 rounded-xl shadow mt-6">

            <h2 class="text-lg font-bold mb-4">Cambiar contraseña</h2>

            <asp:TextBox ID="txtActual" runat="server"
                TextMode="Password"
                CssClass="w-full p-2 border rounded mb-3"
                placeholder="Contraseña actual" />

            <asp:TextBox ID="txtNueva" runat="server"
                TextMode="Password"
                CssClass="w-full p-2 border rounded mb-3"
                placeholder="Nueva contraseña" />

            <asp:TextBox ID="txtConfirmar" runat="server"
                TextMode="Password"
                CssClass="w-full p-2 border rounded mb-3"
                placeholder="Confirmar contraseña" />

            <asp:Button ID="btnCambiarPass" runat="server"
                Text="Actualizar contraseña"
                CssClass="bg-blue-600 text-white px-4 py-2 rounded"
                OnClick="btnCambiarPass_Click" />

        </div>
    </div>
</asp:Content>
