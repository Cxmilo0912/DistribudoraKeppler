<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="PerfilUsuario.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Usuario.PerfilUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="max-width:900px; margin:auto;">

    <%-- Perfil de usuario --%>
    <h2>Mi Perfil</h2>
    <%-- Foto de perfil --%>
    <div>
        <asp:Image ID="imgPerfil" runat="server" Width="120" />
    </div>
    <%-- Datos del usuario --%>
    <div>
        <label>Nombre:</label>
        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
    </div>

    <div>
        <label>Email:</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
    </div>
    <%-- Guardar cambios --%>
    <div style="margin-top:15px;">
        <asp:Button ID="btnGuardar" runat="server"
            Text="Guardar Cambios"
            OnClick="btnGuardar_Click"
            CssClass="btn btn-success" />
    </div>

</div>
</asp:Content>
