<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="HorarioLaboral.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Bodega.HorarioLaboral" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="min-h-screen bg-gray-100 font-sans">

        <!-- HEADER -->
        <div class="flex justify-between items-center mb-8">
            <div>
                <h1 class="text-3xl font-bold">Horario Laboral</h1>
                <p class="text-gray-500">Jornada laboral asignada: días de trabajo, hora de entrada y hora de salida</p>
            </div>
        </div>

        <!-- SELECTOR DE EMPLEADO: por defecto muestra el propio, pero se puede
             consultar el de cualquier repartidor/bodega activo -->
        <div class="bg-white rounded-xl shadow p-4 mb-6">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4 items-end">
                <div class="md:col-span-3">
                    <label class="text-xs font-bold text-gray-500 uppercase block mb-1">Empleado</label>
                    <asp:DropDownList ID="ddlEmpleado" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlEmpleado_SelectedIndexChanged"
                        CssClass="w-full px-3 py-2 border rounded-lg text-sm focus:ring-2 focus:ring-blue-300 outline-none">
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <!-- TARJETA / TABLA DE HORARIO (solo lectura) -->
        <div class="bg-white rounded-xl shadow overflow-hidden">
            <div class="p-4 border-b flex items-center gap-3">
                <span class="material-symbols-outlined text-blue-900">person</span>
                <div>
                    <h3 class="font-bold">Horario asignado a: <asp:Label ID="lblUsuario" runat="server"></asp:Label></h3>
                    <p class="text-xs text-gray-400">Consulta de solo lectura</p>
                </div>
            </div>

            <!-- Mensaje cuando el usuario no tiene ningún horario registrado -->
            <asp:Panel ID="pnlSinHorario" runat="server" CssClass="p-10 text-center" Visible="false">
                <span class="material-symbols-outlined text-5xl text-gray-200 block mb-2">event_busy</span>
                <p class="text-gray-500 font-semibold">No existe un horario laboral registrado para su usuario</p>
            </asp:Panel>

            <div class="overflow-x-auto">
                <asp:GridView ID="gvHorario" runat="server" AutoGenerateColumns="false"
                    CssClass="w-full text-sm" GridLines="None">

                    <HeaderStyle CssClass="bg-gray-100 text-left text-xs font-bold text-gray-500 uppercase" />
                    <RowStyle CssClass="border-b hover:bg-gray-50" />

                    <Columns>
                        <asp:BoundField DataField="DiaSemana" HeaderText="Día de la semana"
                            ItemStyle-CssClass="px-4 py-3 font-semibold" HeaderStyle-CssClass="px-4 py-3" />
                        <asp:BoundField DataField="HoraEntrada" HeaderText="Hora de entrada"
                            ItemStyle-CssClass="px-4 py-3" HeaderStyle-CssClass="px-4 py-3" />
                        <asp:BoundField DataField="HoraSalida" HeaderText="Hora de salida"
                            ItemStyle-CssClass="px-4 py-3" HeaderStyle-CssClass="px-4 py-3" />
                    </Columns>

                </asp:GridView>
            </div>
        </div>

    </div>

</asp:Content>
