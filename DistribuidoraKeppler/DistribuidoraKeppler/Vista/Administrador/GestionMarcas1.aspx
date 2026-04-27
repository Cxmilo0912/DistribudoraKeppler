<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Vista/Site1.Master" CodeBehind="GestionMarcas1.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.GestionMarcas1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="p-6">

        <!-- HEADER -->
        <div class="mb-6">
            <h2 class="text-2xl font-bold text-gray-800">Gestión de Marcas</h2>
            <p class="text-sm text-gray-500">
               <%-- Administra y visualiza las marcas registradas en el sistema--%>
            </p>
        </div>

        <!-- CARDS -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">

            <div class="bg-white rounded-xl p-5 shadow">
                <p class="text-sm text-gray-500">Total de marcas</p>
                <p class="text-2xl font-bold text-gray-800">
                    <asp:Label ID="lblTotalMarcas" runat="server" Text="0" />
                </p>
            </div>

            <div class="bg-white rounded-xl p-5 shadow">
                <p class="text-sm text-gray-500">Nuevas este mes</p>
                <p class="text-2xl font-bold text-gray-800">3</p>
            </div>

            <div class="bg-white rounded-xl p-5 shadow">
                <p class="text-sm text-gray-500">Productos asociados</p>
                <p class="text-2xl font-bold text-gray-800">200</p>
            </div>

        </div>

        <!-- ACCIONES -->
        <div class="flex justify-between items-center mb-4">
            <h3 class="text-lg font-semibold text-gray-800">Lista de Marcas</h3>

            <!-- BOTÓN MODIFICADO -->
            <asp:Button
                ID="btnAgregarMarca"
                runat="server"
                Text="+ Agregar Marca"
                OnClientClick="abrirModalMarca(); return false;"
                CssClass="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700" />
        </div>

        <!-- TABLA -->
        <div class="bg-white rounded-xl shadow overflow-hidden">

            <table class="w-full text-sm">
                <thead class="bg-gray-100 text-gray-600">
                    <tr>
                        <th class="text-left px-6 py-3">Nombre de la marca</th>
                        <th class="text-right px-6 py-3">Acciones</th>
                    </tr>
                </thead>

                <tbody>
                    <asp:Repeater ID="rpMarcas" runat="server">
                        <ItemTemplate>
                            <tr class="border-t hover:bg-gray-50">
                                <td class="px-6 py-4 font-medium text-gray-800">
                                    <%# Eval("Nombre") %>
                                </td>
                                <td class="px-6 py-4 text-right space-x-3">
                                    <asp:LinkButton runat="server"
                                        CssClass="text-blue-600 hover:underline">
                                        Editar
                                    </asp:LinkButton>
                                    <asp:LinkButton runat="server"
                                        CssClass="text-red-600 hover:underline">
                                        Eliminar
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

        </div>

    </div>

    <!-- MODAL AGREGAR MARCA  -->
    <div id="modalMarca"
        class="fixed inset-0 bg-black bg-opacity-40 hidden flex items-center justify-center z-50">

        <div class="bg-white rounded-xl w-full max-w-lg p-6 relative">

            <!-- HEADER -->
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-lg font-semibold">Agregar Nueva Marca</h3>
                <button type="button"
                    onclick="cerrarModalMarca()"
                    class="text-gray-400 hover:text-gray-600">
                    ✕
                </button>
            </div>

            <!-- FORMULARIO -->
            <div class="space-y-4">

                <div>
                    <label class="text-sm text-gray-600">Nombre de la Marca</label>
                    <asp:TextBox ID="txtNombreMarca" runat="server"
                        CssClass="w-full border rounded-lg px-3 py-2"
                        placeholder="Ej: Coca Cola, Scott..." />
                </div>

                <div>
                    <label class="text-sm text-gray-600">País de Origen</label>
                    <asp:TextBox ID="txtPaisOrigen" runat="server"
                        CssClass="w-full border rounded-lg px-3 py-2"
                        placeholder="Ej: Colombia..." />
                </div>

                <div>
                    <label class="text-sm text-gray-600">Descripción</label>
                    <asp:TextBox ID="txtDescripcion" runat="server"
                        TextMode="MultiLine" Rows="3"
                        CssClass="w-full border rounded-lg px-3 py-2"
                        placeholder="Breve descripcion de la marca..." />
                </div>

                <div>
                    <label class="text-sm text-gray-600">Logo de la Marca</label>
                    <asp:FileUpload ID="fuLogo" runat="server"
                        CssClass="w-full border-2 border-dashed rounded-lg p-4 text-center" />
                    <p class="text-xs text-gray-400 mt-1">
                        PNG, JPG hasta 5MB
                    </p>
                </div>

            </div>

            <!-- FOOTER -->
            <div class="flex justify-end gap-3 mt-6">
                <button type="button"
                    onclick="cerrarModalMarca()"
                    class="px-4 py-2 rounded-lg border">
                    Cancelar
                </button>

                <asp:Button
                    ID="btnGuardarMarca"
                    runat="server"
                    Text="Guardar Marca"
                    OnClick="btnGuardarMarca_Click"
                    CssClass="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700" />
            </div>


        </div>
    </div>

    <!-- SCRIPT MODAL -->
    <script type="text/javascript">
        function abrirModalMarca() {
            document.getElementById('modalMarca').classList.remove('hidden');
        }

        function cerrarModalMarca() {
            document.getElementById('modalMarca').classList.add('hidden');
        }
    </script>
    <!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
