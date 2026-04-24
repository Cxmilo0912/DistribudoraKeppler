<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionMarcas1.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.GestionMarcas1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Gestión de Marcas</title>
</head>

<body>
    <form id="form1" runat="server">

        <div style="padding: 20px;">

            <h2 style="font-size: 24px; font-weight: bold;">Listado de Marcas
            </h2>

            <!-- AQUÍ SE MUESTRAN LAS MARCAS -->
            <asp:Repeater ID="rpMarcas" runat="server">
                <ItemTemplate>
                    <div style="background: #f5f5f5; padding: 12px; margin-top: 10px; border-radius: 8px;">
                        <h3 style="margin: 0;"><%# Eval("Nombre") %></h3>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>

    </form>
</body>
</html>
