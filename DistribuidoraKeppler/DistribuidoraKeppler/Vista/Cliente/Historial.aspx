<%@ Page Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="Historial.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.Historial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Historial de Pedidos - Keppler</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet" />
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        primary: "#000080",
                        secondary: "#000033",
                    },
                    fontFamily: {
                        display: ["Manrope", "sans-serif"],
                        sans: ["Manrope", "sans-serif"],
                    },
                },
            },
        };
    </script>
    <style>
        .custom-scrollbar::-webkit-scrollbar { width: 4px; }
        .custom-scrollbar::-webkit-scrollbar-thumb { background: #e2e8f0; border-radius: 10px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Modal Detalle Pedido -->
    <div id="modalDetalle" class="fixed inset-0 z-50 hidden items-center justify-center bg-black/50 backdrop-blur-sm p-4">
        <div class="bg-white rounded-2xl w-full max-w-2xl shadow-2xl flex flex-col max-h-[90vh]">
            <div class="flex items-center justify-between p-6 border-b border-slate-100">
                <div>
                    <h3 class="text-lg font-bold text-slate-900">Detalle del Pedido</h3>
                    <p id="modalCodigo" class="text-sm text-slate-500 mt-0.5"></p>
                </div>
                <button type="button" onclick="cerrarModal()" class="p-2 rounded-xl hover:bg-slate-100 transition-colors">
                    <span class="material-icons-outlined text-slate-500">close</span>
                </button>
            </div>
            <div class="overflow-y-auto custom-scrollbar flex-1 p-6">
                <div id="modalProductos" class="space-y-3"></div>
            </div>
            <div class="p-6 border-t border-slate-100 flex justify-between items-center">
                <span class="text-sm font-semibold text-slate-500">Total del pedido</span>
                <span id="modalTotal" class="text-xl font-extrabold text-primary"></span>
            </div>
        </div>
    </div>

    <div class="min-h-screen bg-slate-50 p-8">

        <!-- Header con métricas -->
        <div class="mb-8 flex flex-col md:flex-row md:items-center md:justify-between gap-4">
            <div>
                <h2 class="text-3xl font-extrabold text-slate-900">Historial de Pedidos</h2>
                <p class="text-slate-500 mt-1">Registro completo de todas tus compras</p>
            </div>
            <div class="flex gap-4">
                <div class="bg-white rounded-2xl border border-slate-100 px-5 py-3 text-center shadow-sm">
                    <p class="text-2xl font-extrabold text-primary" id="totalPedidos">—</p>
                    <p class="text-[11px] font-bold text-slate-400 uppercase tracking-wider mt-0.5">Pedidos</p>
                </div>
                <div class="bg-white rounded-2xl border border-slate-100 px-5 py-3 text-center shadow-sm">
                    <p class="text-2xl font-extrabold text-teal-600" id="totalEntregados">—</p>
                    <p class="text-[11px] font-bold text-slate-400 uppercase tracking-wider mt-0.5">Entregados</p>
                </div>
                <div class="bg-white rounded-2xl border border-slate-100 px-5 py-3 text-center shadow-sm">
                    <p class="text-2xl font-extrabold text-slate-700" id="totalGastado">—</p>
                    <p class="text-[11px] font-bold text-slate-400 uppercase tracking-wider mt-0.5">Total gastado</p>
                </div>
            </div>
        </div>

        <!-- Buscador -->
        <div class="relative mb-6 max-w-sm">
            <span class="material-icons-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400 text-lg">search</span>
            <input type="text" id="buscador" placeholder="Buscar por código o dirección..."
                oninput="aplicarFiltros()"
                class="w-full pl-9 pr-4 py-2.5 rounded-xl border border-slate-200 text-sm font-medium focus:outline-none focus:border-primary focus:ring-1 focus:ring-primary bg-white" />
        </div>

        <!-- Tabla -->
        <div class="bg-white rounded-2xl border border-slate-100 shadow-sm overflow-hidden">
            <div class="p-6 flex justify-between items-center border-b border-slate-100">
                <h3 class="text-base font-bold text-slate-900">Todos los pedidos</h3>
                <span id="contadorPedidos" class="text-xs font-bold text-slate-400 uppercase tracking-wider">0 pedidos</span>
            </div>

            <div id="estadoCargando" class="p-12 text-center">
                <span class="material-icons-outlined text-4xl text-slate-300 animate-spin block mb-3">autorenew</span>
                <p class="text-slate-400 text-sm font-medium">Cargando historial...</p>
            </div>

            <div id="estadoVacio" class="p-12 text-center hidden">
                <span class="material-icons-outlined text-5xl text-slate-200 block mb-3">history</span>
                <p class="text-slate-500 font-semibold text-base">Sin pedidos para este filtro</p>
                <p class="text-slate-400 text-sm mt-1">Prueba con otro estado o realiza tu primer pedido.</p>
            </div>

            <div id="contenedorTabla" class="overflow-x-auto hidden">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 border-y border-slate-100">
                        <tr>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Código</th>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Fecha</th>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Dirección</th>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Total</th>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Estado</th>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Detalle</th>
                        </tr>
                    </thead>
                    <tbody id="tablaPedidos" class="divide-y divide-slate-50"></tbody>
                </table>
            </div>
        </div>

    </div>

    <script>
        let todosPedidos = [];

        const coloresEstado = {
            'En Proceso':     'bg-slate-100 text-slate-600',
            'Aprobado':       'bg-emerald-100 text-emerald-700',
            'Pendiente':      'bg-amber-100 text-amber-700',
            'Rechazado':      'bg-rose-100 text-rose-700',
            'Confirmado':     'bg-blue-100 text-blue-700',
            'En preparacion': 'bg-indigo-100 text-indigo-700',
            'En reparto':     'bg-purple-100 text-purple-700',
            'Entregado':      'bg-teal-100 text-teal-700',
        };

        function obtenerClaseEstado(estado) {
            return coloresEstado[estado] || 'bg-slate-100 text-slate-600';
        }

        function cargarHistorial() {
            fetch('Historial.aspx/MtCargarHistorial', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({})
            })
            .then(r => r.json())
            .then(resp => {
                const datos = resp.d;
                document.getElementById('estadoCargando').classList.add('hidden');

                if (!datos.success || datos.data.length === 0) {
                    document.getElementById('estadoVacio').classList.remove('hidden');
                    actualizarMetricas([]);
                    return;
                }

                todosPedidos = datos.data;
                actualizarMetricas(todosPedidos);
                renderizarTabla(todosPedidos);
            })
            .catch(() => {
                document.getElementById('estadoCargando').classList.add('hidden');
                document.getElementById('estadoVacio').classList.remove('hidden');
            });
        }

        function actualizarMetricas(pedidos) {
            document.getElementById('totalPedidos').textContent = pedidos.length;
            const entregados = pedidos.filter(p => p.estado === 'Entregado').length;
            document.getElementById('totalEntregados').textContent = entregados;
            const total = pedidos.reduce((acc, p) => acc + parseFloat(p.total.replace(/,/g, '')), 0);
            document.getElementById('totalGastado').textContent = '$ ' + total.toLocaleString('es-CO', { minimumFractionDigits: 2 });
        }

        function renderizarTabla(pedidos) {
            const tbody = document.getElementById('tablaPedidos');
            const contador = document.getElementById('contadorPedidos');
            contador.textContent = pedidos.length + ' pedido' + (pedidos.length !== 1 ? 's' : '');

            if (pedidos.length === 0) {
                tbody.innerHTML = '';
                document.getElementById('contenedorTabla').classList.add('hidden');
                document.getElementById('estadoVacio').classList.remove('hidden');
                return;
            }

            document.getElementById('estadoVacio').classList.add('hidden');
            document.getElementById('contenedorTabla').classList.remove('hidden');

            tbody.innerHTML = pedidos.map(p => `
                <tr class="hover:bg-slate-50/50 transition-colors">
                    <td class="px-6 py-4 font-bold text-slate-800">${p.codigoPedido || '#' + p.id}</td>
                    <td class="px-6 py-4 text-slate-500 text-sm">${p.fecha}</td>
                    <td class="px-6 py-4 text-slate-500 text-sm max-w-xs truncate">${p.direccion || '—'}</td>
                    <td class="px-6 py-4 font-bold text-slate-800">$ ${p.total}</td>
                    <td class="px-6 py-4">
                        <span class="px-3 py-1 rounded-full text-[10px] font-bold uppercase ${obtenerClaseEstado(p.estado)}">
                            ${p.estado}
                        </span>
                    </td>
                    <td class="px-6 py-4">
                        <button type="button" onclick="abrirDetalle(${p.id}, '${(p.codigoPedido || '#' + p.id).replace(/'/g, "\\'")}', '$ ${p.total}')"
                            class="text-primary font-bold text-sm hover:underline flex items-center gap-1">
                            <span class="material-icons-outlined text-base">visibility</span> Ver
                        </button>
                    </td>
                </tr>
            `).join('');
        }

        function aplicarFiltros() {
            const texto = document.getElementById('buscador').value.toLowerCase().trim();
            const resultado = texto
                ? todosPedidos.filter(p =>
                    (p.codigoPedido || '').toLowerCase().includes(texto) ||
                    (p.direccion || '').toLowerCase().includes(texto))
                : todosPedidos;
            renderizarTabla(resultado);
        }

        function abrirDetalle(idPedido, codigo, total) {
            document.getElementById('modalCodigo').textContent = codigo;
            document.getElementById('modalTotal').textContent = total;
            document.getElementById('modalProductos').innerHTML =
                '<div class="flex justify-center py-6"><span class="material-icons-outlined text-3xl text-slate-300 animate-spin">autorenew</span></div>';

            document.getElementById('modalDetalle').classList.remove('hidden');
            document.getElementById('modalDetalle').classList.add('flex');

            fetch('Historial.aspx/MtCargarDetallePedido', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ idPedido: idPedido })
            })
            .then(r => r.json())
            .then(resp => {
                const datos = resp.d;
                const contenedor = document.getElementById('modalProductos');

                if (!datos.success || datos.data.length === 0) {
                    contenedor.innerHTML = '<p class="text-slate-400 text-sm text-center py-4">Sin productos registrados.</p>';
                    return;
                }

                contenedor.innerHTML = datos.data.map(d => `
                    <div class="flex items-center gap-4 p-3 bg-slate-50 rounded-xl">
                        <img src="${d.imagen || ''}" alt="${d.producto}"
                            class="w-14 h-14 rounded-lg object-cover bg-slate-200 flex-shrink-0"
                            onerror="this.src=''; this.className='w-14 h-14 rounded-lg bg-slate-200 flex-shrink-0'" />
                        <div class="flex-1 min-w-0">
                            <p class="font-semibold text-slate-800 text-sm truncate">${d.producto}</p>
                            <p class="text-xs text-slate-400 mt-0.5">Precio unitario: $ ${d.precioUnitario}</p>
                        </div>
                        <div class="text-right flex-shrink-0">
                            <p class="text-xs text-slate-400">x${d.cantidad}</p>
                            <p class="font-bold text-slate-800 text-sm">$ ${d.subtotal}</p>
                        </div>
                    </div>
                `).join('');
            })
            .catch(() => {
                document.getElementById('modalProductos').innerHTML =
                    '<p class="text-slate-400 text-sm text-center py-4">Error al cargar el detalle.</p>';
            });
        }

        function cerrarModal() {
            document.getElementById('modalDetalle').classList.add('hidden');
            document.getElementById('modalDetalle').classList.remove('flex');
        }

        document.getElementById('modalDetalle').addEventListener('click', function (e) {
            if (e.target === this) cerrarModal();
        });

        document.addEventListener('DOMContentLoaded', cargarHistorial);
    </script>

</asp:Content>
