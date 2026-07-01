  <%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="AsignarPedidos.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Bodega.AsignarPedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Modal Asignar Pedido -->
    <div id="modalAsignar" class="fixed inset-0 z-50 hidden items-center justify-center bg-black/50 backdrop-blur-sm p-4">
        <div class="bg-white rounded-2xl w-full max-w-lg shadow-2xl flex flex-col max-h-[90vh]">
            <div class="flex items-center justify-between p-6 border-b">
                <div>
                    <h3 class="text-lg font-bold text-gray-900">Asignar repartidor</h3>
                    <p id="modalPedidoInfo" class="text-sm text-gray-500 mt-0.5"></p>
                </div>
                <button type="button" onclick="cerrarModalAsignar()" class="p-2 rounded-xl hover:bg-gray-100 transition-colors">
                    <span class="material-symbols-outlined text-gray-500">close</span>
                </button>
            </div>

            <div class="p-6 overflow-y-auto flex-1">
                <p class="text-xs font-bold text-gray-400 uppercase tracking-wider mb-3">
                    Repartidores disponibles en el sector
                </p>
                <div id="listaRepartidores" class="space-y-2">
                    <p class="text-sm text-gray-400">Cargando repartidores...</p>
                </div>
            </div>

            <div class="p-6 border-t flex justify-end gap-3">
                <button type="button" onclick="cerrarModalAsignar()"
                    class="px-4 py-2 rounded-lg text-sm font-semibold text-gray-600 hover:bg-gray-100 transition">
                    Cancelar
                </button>
                <button type="button" id="btnConfirmarAsignar" onclick="confirmarAsignacion()" disabled
                    class="px-4 py-2 rounded-lg text-sm font-bold bg-blue-900 text-white opacity-50 cursor-not-allowed hover:bg-blue-800 transition">
                    Asignar
                </button>
            </div>
        </div>
    </div>

    <div class="min-h-screen bg-gray-100 font-sans">

        <!-- HEADER -->
        <div class="flex justify-between items-center mb-8">
            <div>
                <h1 class="text-3xl font-bold">Asignación de Pedidos</h1>
                <p class="text-gray-500">Asigna pedidos pendientes a los repartidores de su sector</p>
            </div>
        </div>

        <!-- FILTRO POR SECTOR -->
        <div class="bg-white rounded-xl shadow p-4 mb-6 flex items-center gap-4">
            <label for="ddlSector" class="text-sm font-bold text-gray-600">Filtrar por sector:</label>
            <select id="ddlSector" onchange="cargarPedidos()"
                class="px-3 py-2 border rounded-lg text-sm focus:ring-2 focus:ring-blue-300 outline-none min-w-[220px]">
                <option value="0">Todos los sectores</option>
            </select>
            <span id="contadorPedidos" class="ml-auto text-sm text-gray-400 font-semibold"></span>
        </div>

        <!-- TABLA PEDIDOS PENDIENTES -->
        <div class="bg-white rounded-xl shadow overflow-hidden mb-10">
            <div class="p-4 border-b">
                <h3 class="font-bold">Pedidos pendientes por asignar</h3>
            </div>

            <div id="estadoCargando" class="p-10 text-center">
                <span class="material-symbols-outlined text-4xl text-gray-300 animate-spin block mb-2">progress_activity</span>
                <p class="text-gray-400 text-sm">Cargando pedidos...</p>
            </div>

            <div id="estadoVacio" class="p-10 text-center hidden">
                <span class="material-symbols-outlined text-5xl text-gray-200 block mb-2">inventory_2</span>
                <p class="text-gray-500 font-semibold">No hay pedidos pendientes por asignar</p>
            </div>

            <div id="contenedorTabla" class="overflow-x-auto hidden">
                <table class="w-full text-sm">
                    <thead class="bg-gray-100 text-left">
                        <tr>
                            <th class="px-4 py-3 font-bold text-gray-500 text-xs uppercase">N° Pedido</th>
                            <th class="px-4 py-3 font-bold text-gray-500 text-xs uppercase">Cliente</th>
                            <th class="px-4 py-3 font-bold text-gray-500 text-xs uppercase">Dirección</th>
                            <th class="px-4 py-3 font-bold text-gray-500 text-xs uppercase">Sector</th>
                            <th class="px-4 py-3 font-bold text-gray-500 text-xs uppercase">Estado</th>
                            <th class="px-4 py-3 font-bold text-gray-500 text-xs uppercase">Acción</th>
                        </tr>
                    </thead>
                    <tbody id="tablaPedidos" class="divide-y"></tbody>
                </table>
            </div>
        </div>

        <!-- SECTORES DE REPARTIDORES -->
        <div class="bg-white rounded-xl shadow overflow-hidden">
            <div class="p-4 border-b">
                <h3 class="font-bold">Sectores de cobertura de los repartidores</h3>
                <p class="text-xs text-gray-400 mt-1">Repartidores = usuarios con rol Distribuidor o Bodega. Define sus sectores para poder sugerirlos al asignar pedidos.</p>
            </div>

            <div class="overflow-x-auto">
                <table class="w-full text-sm">
                    <thead class="bg-gray-100 text-left">
                        <tr>
                            <th class="px-4 py-3 font-bold text-gray-500 text-xs uppercase">Repartidor</th>
                            <th class="px-4 py-3 font-bold text-gray-500 text-xs uppercase">Email</th>
                            <th class="px-4 py-3 font-bold text-gray-500 text-xs uppercase">Sectores asignados</th>
                            <th class="px-4 py-3 font-bold text-gray-500 text-xs uppercase">Agregar sector</th>
                        </tr>
                    </thead>
                    <tbody id="tablaRepartidores" class="divide-y">
                        <tr>
                            <td colspan="4" class="px-4 py-6 text-center text-gray-400">Cargando repartidores...</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

    <script>
        let sectores = [];
        let pedidoSeleccionado = null;
        let repartidorSeleccionado = null;

        const coloresEstado = {
            'En Proceso': 'bg-yellow-100 text-yellow-700',
            'Aprobado': 'bg-blue-100 text-blue-700',
            'Empaquetamiento': 'bg-indigo-100 text-indigo-700',
            'En reparto': 'bg-purple-100 text-purple-700',
            'Entregado': 'bg-green-100 text-green-700'
        };

        function claseEstado(estado) {
            return coloresEstado[estado] || 'bg-gray-100 text-gray-700';
        }

        function cargarSectores() {
            return fetch('AsignarPedidos.aspx/MtListarSectores', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({})
            })
            .then(r => r.json())
            .then(resp => {
                const datos = resp.d;
                if (!datos.success) return;

                sectores = datos.data;

                const ddl = document.getElementById('ddlSector');
                sectores.forEach(s => {
                    const opt = document.createElement('option');
                    opt.value = s.id;
                    opt.textContent = s.nombre;
                    ddl.appendChild(opt);
                });
            });
        }

        function cargarPedidos() {
            const idSector = document.getElementById('ddlSector').value;

            document.getElementById('estadoCargando').classList.remove('hidden');
            document.getElementById('estadoVacio').classList.add('hidden');
            document.getElementById('contenedorTabla').classList.add('hidden');

            fetch('AsignarPedidos.aspx/MtListarPedidosPendientes', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ idSector: parseInt(idSector, 10) })
            })
            .then(r => r.json())
            .then(resp => {
                const datos = resp.d;
                document.getElementById('estadoCargando').classList.add('hidden');

                if (!datos.success || datos.data.length === 0) {
                    document.getElementById('estadoVacio').classList.remove('hidden');
                    document.getElementById('contadorPedidos').textContent = '';
                    return;
                }

                document.getElementById('contadorPedidos').textContent =
                    datos.data.length + ' pedido' + (datos.data.length !== 1 ? 's' : '') + ' pendiente' + (datos.data.length !== 1 ? 's' : '');

                renderizarTabla(datos.data);
            })
            .catch(() => {
                document.getElementById('estadoCargando').classList.add('hidden');
                document.getElementById('estadoVacio').classList.remove('hidden');
            });
        }

        function renderizarTabla(pedidos) {
            const tbody = document.getElementById('tablaPedidos');
            document.getElementById('contenedorTabla').classList.remove('hidden');

            tbody.innerHTML = pedidos.map(p => `
                <tr class="hover:bg-gray-50">
                    <td class="px-4 py-3 font-bold text-gray-800">${p.codigoPedido || '#' + p.id}</td>
                    <td class="px-4 py-3 text-gray-600">${p.cliente}</td>
                    <td class="px-4 py-3 text-gray-600 max-w-xs truncate">${p.direccion || '—'}</td>
                    <td class="px-4 py-3 text-gray-600">${p.sector}</td>
                    <td class="px-4 py-3">
                        <span class="px-3 py-1 rounded-full text-xs font-bold ${claseEstado(p.estado)}">${p.estado}</span>
                    </td>
                    <td class="px-4 py-3">
                        <button type="button" onclick='abrirModalAsignar(${p.id}, ${p.idSector}, ${JSON.stringify(p.codigoPedido || ("#" + p.id))}, ${JSON.stringify(p.cliente)})'
                            class="px-3 py-1.5 rounded-lg text-xs font-bold bg-blue-900 text-white hover:bg-blue-800 transition">
                            Asignar
                        </button>
                    </td>
                </tr>
            `).join('');
        }

        function abrirModalAsignar(idPedido, idSector, codigo, cliente) {
            pedidoSeleccionado = idPedido;
            repartidorSeleccionado = null;

            document.getElementById('modalPedidoInfo').textContent = codigo + ' — ' + cliente;
            document.getElementById('listaRepartidores').innerHTML = '<p class="text-sm text-gray-400">Buscando repartidores...</p>';
            deshabilitarBotonAsignar();

            document.getElementById('modalAsignar').classList.remove('hidden');
            document.getElementById('modalAsignar').classList.add('flex');

            fetch('AsignarPedidos.aspx/MtListarRepartidoresPorSector', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ idSector: idSector })
            })
            .then(r => r.json())
            .then(resp => {
                const datos = resp.d;
                const contenedor = document.getElementById('listaRepartidores');

                if (!datos.success) {
                    contenedor.innerHTML = `<p class="text-sm text-amber-600">${datos.mensaje}</p>`;
                    return;
                }

                if (datos.data.length === 0) {
                    contenedor.innerHTML = '<p class="text-sm text-gray-400">No hay repartidores activos.</p>';
                    return;
                }

                contenedor.innerHTML = datos.data.map(r => `
                    <label class="flex items-center gap-3 p-3 border rounded-xl cursor-pointer hover:border-blue-400 transition">
                        <input type="radio" name="repartidor" value="${r.id}" onchange="repartidorSeleccionado=${r.id}; habilitarBotonAsignar();" class="accent-blue-900" />
                        <div>
                            <p class="font-semibold text-gray-800 text-sm">${r.nombre}</p>
                            <p class="text-xs text-gray-400">${r.email}</p>
                        </div>
                    </label>
                `).join('');
            })
            .catch(() => {
                document.getElementById('listaRepartidores').innerHTML =
                    '<p class="text-sm text-red-500">Error al cargar los repartidores.</p>';
            });
        }

        function habilitarBotonAsignar() {
            const btn = document.getElementById('btnConfirmarAsignar');
            btn.disabled = false;
            btn.classList.remove('opacity-50', 'cursor-not-allowed');
        }

        function deshabilitarBotonAsignar() {
            const btn = document.getElementById('btnConfirmarAsignar');
            btn.disabled = true;
            btn.classList.add('opacity-50', 'cursor-not-allowed');
        }

        function cerrarModalAsignar() {
            document.getElementById('modalAsignar').classList.add('hidden');
            document.getElementById('modalAsignar').classList.remove('flex');
        }

        function confirmarAsignacion() {
            if (!pedidoSeleccionado || !repartidorSeleccionado) return;

            fetch('AsignarPedidos.aspx/MtAsignarPedido', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ idPedido: pedidoSeleccionado, idRepartidor: repartidorSeleccionado })
            })
            .then(r => r.json())
            .then(resp => {
                const datos = resp.d;
                if (!datos.success) {
                    Swal.fire({ icon: 'error', title: 'No se pudo asignar', text: datos.mensaje });
                    return;
                }

                cerrarModalAsignar();
                Swal.fire({ icon: 'success', title: 'Pedido asignado', text: datos.mensaje, timer: 1800, showConfirmButton: false });
                cargarPedidos();
            })
            .catch(() => {
                Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo completar la asignación.' });
            });
        }

        function cargarRepartidores() {
            fetch('AsignarPedidos.aspx/MtListarRepartidoresConSectores', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({})
            })
            .then(r => r.json())
            .then(resp => {
                const datos = resp.d;
                const tbody = document.getElementById('tablaRepartidores');

                if (!datos.success || datos.data.length === 0) {
                    tbody.innerHTML = '<tr><td colspan="4" class="px-4 py-6 text-center text-gray-400">No hay repartidores registrados (rol Distribuidor o Bodega).</td></tr>';
                    return;
                }

                tbody.innerHTML = datos.data.map(r => `
                    <tr class="hover:bg-gray-50">
                        <td class="px-4 py-3 font-semibold text-gray-800">${r.nombre}</td>
                        <td class="px-4 py-3 text-gray-500">${r.email}</td>
                        <td class="px-4 py-3">
                            <div class="flex flex-wrap gap-1.5">
                                ${r.sectores.length > 0 ? r.sectores.map(s => `
                                    <span class="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs font-semibold bg-blue-100 text-blue-700">
                                        ${s.nombre}
                                        <button type="button" onclick="quitarSector(${r.id}, ${s.id})" class="hover:text-red-600 flex items-center">
                                            <span class="material-symbols-outlined !text-[14px]">close</span>
                                        </button>
                                    </span>
                                `).join('') : '<span class="text-xs text-gray-400">Sin sectores</span>'}
                            </div>
                        </td>
                        <td class="px-4 py-3">
                            <div class="flex items-center gap-2">
                                <select class="ddlNuevoSector-${r.id} px-2 py-1.5 border rounded-lg text-sm">
                                    ${sectores.map(s => `<option value="${s.id}">${s.nombre}</option>`).join('')}
                                </select>
                                <button type="button" onclick="agregarSector(${r.id})"
                                    class="px-3 py-1.5 rounded-lg text-xs font-bold bg-blue-900 text-white hover:bg-blue-800 transition">
                                    + Agregar
                                </button>
                            </div>
                        </td>
                    </tr>
                `).join('');
            });
        }

        function agregarSector(idUsuario) {
            const select = document.querySelector('.ddlNuevoSector-' + idUsuario);
            const idSector = parseInt(select.value, 10);

            fetch('AsignarPedidos.aspx/MtAgregarSectorRepartidor', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ idUsuario: idUsuario, idSector: idSector })
            })
            .then(r => r.json())
            .then(resp => {
                const datos = resp.d;
                if (!datos.success) {
                    Swal.fire({ icon: 'error', title: 'No se pudo agregar', text: datos.mensaje });
                    return;
                }
                cargarRepartidores();
            })
            .catch(() => {
                Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo agregar el sector.' });
            });
        }

        function quitarSector(idUsuario, idSector) {
            fetch('AsignarPedidos.aspx/MtQuitarSectorRepartidor', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ idUsuario: idUsuario, idSector: idSector })
            })
            .then(r => r.json())
            .then(resp => {
                const datos = resp.d;
                if (!datos.success) {
                    Swal.fire({ icon: 'error', title: 'No se pudo quitar', text: datos.mensaje });
                    return;
                }
                cargarRepartidores();
            })
            .catch(() => {
                Swal.fire({ icon: 'error', title: 'Error', text: 'No se pudo quitar el sector.' });
            });
        }

        document.getElementById('modalAsignar').addEventListener('click', function (e) {
            if (e.target === this) cerrarModalAsignar();
        });

        document.addEventListener('DOMContentLoaded', function () {
            cargarSectores().then(function () {
                cargarPedidos();
                cargarRepartidores();
            });
        });
    </script>

</asp:Content>
