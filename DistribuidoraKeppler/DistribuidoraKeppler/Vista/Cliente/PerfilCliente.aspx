<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="PerfilCliente.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="max-width: 900px; margin: auto;">

        <h2 style="margin-bottom: 20px;">Mi Perfil</h2>

        <div style="display: flex; gap: 30px; background: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">

            <!-- FOTO -->
            <div>
                <asp:Image ID="imgPerfil" runat="server"
                    Width="150" Height="150"
                    Style="border-radius: 50%; object-fit: cover;" />
            </div>

            <!-- DATOS -->
            <div style="flex: 1;">

                <p><strong>Empresa:</strong></p>
                <asp:Label ID="lblEmpresa" runat="server" />

                <p style="margin-top: 10px;"><strong>Email:</strong></p>
                <asp:Label ID="lblEmail" runat="server" />

                <p style="margin-top: 10px;"><strong>Teléfono:</strong></p>
                <asp:Label ID="lblTelefono" runat="server" />

                <p style="margin-top: 10px;"><strong>Dirección:</strong></p>
                <asp:Label ID="lblDireccion" runat="server" />

            </div>
        </div>
    </div>
</asp:Content>
