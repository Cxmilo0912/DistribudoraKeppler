<%@ Page Language="C#"  AutoEventWireup="true"MasterPageFile="~/Vista/Site1.Master"CodeBehind="GestionMarcas1.aspx.cs"Inherits="DistribuidoraKeppler.Vista.Administrador.GestionMarcas1" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="p-6">

        <!-- TÍTULO -->
        <h2 class="text-2xl font-bold mb-6">
            Gestión de Marcas
        </h2>

        <!-- LISTADO DE MARCAS -->
        <asp:Repeater ID="rpMarcas" runat="server">
            <ItemTemplate>
                <div class="bg-white p-4 mb-3 rounded-lg shadow">
                    <h3 class="text-lg font-semibold text-gray-800">
                        <%# Eval("Nombre") %>
                    </h3>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>

</asp:Content>