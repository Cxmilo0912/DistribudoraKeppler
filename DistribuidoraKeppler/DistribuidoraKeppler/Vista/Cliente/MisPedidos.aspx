<%@ Page Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="MisPedidos.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.MisPedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Mis Pedidos - Keppler</title>
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

    <!-- Modal Ruta de Entrega -->
    <div id="modalRuta" class="fixed inset-0 z-50 hidden items-center justify-center bg-black/50 backdrop-blur-sm p-4">
        <div class="bg-white rounded-2xl w-full max-w-2xl shadow-2xl flex flex-col max-h-[90vh]">
            <div class="flex items-center justify-between p-6 border-b border-slate-100">
                <div>
                    <h3 class="text-lg font-bold text-slate-900">Ruta de Entrega</h3>
                    <p id="modalRutaCodigo" class="text-sm text-slate-500 mt-0.5"></p>
                </div>
                <button type="button" onclick="cerrarModalRuta()" class="p-2 rounded-xl hover:bg-slate-100 transition-colors">
                    <span class="material-icons-outlined text-slate-500">close</span>
                </button>
            </div>
            <div class="p-6 space-y-4">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-xs font-bold text-slate-400 uppercase tracking-wider">Zona de entrega</p>
                        <p id="modalRutaDireccion" class="text-sm font-semibold text-slate-800 mt-0.5"></p>
                    </div>
                    <span id="modalRutaEstado" class="px-3 py-1 rounded-full text-[10px] font-bold uppercase flex-shrink-0"></span>
                </div>
                <div class="rounded-xl overflow-hidden border border-slate-100">
                    <iframe id="modalRutaMapa" class="w-full h-96 border-0" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </div>
    </div>

    <div class="min-h-screen bg-slate-50 p-8">

        <!-- Header -->
        <div class="mb-8">
            <h2 class="text-3xl font-extrabold text-slate-900">Mis Pedidos</h2>
            <p class="text-slate-500 mt-1">Historial completo de tus pedidos en Keppler</p>
        </div>

        <!-- Filtros de estado -->
        <div class="flex flex-wrap gap-2 mb-6" id="filtrosEstado">
            <button type="button" onclick="filtrarPorEstado('')" data-estado=""
                class="filtro-btn px-4 py-2 rounded-xl text-sm font-semibold border-2 border-primary bg-primary text-white transition-all">
                Todos
            </button>
            <button type="button" onclick="filtrarPorEstado('En Proceso')" data-estado="En Proceso"
                class="filtro-btn px-4 py-2 rounded-xl text-sm font-semibold border-2 border-slate-200 text-slate-600 hover:border-primary hover:text-primary transition-all">
                En Proceso
            </button>
            <button type="button" onclick="filtrarPorEstado('Confirmado')" data-estado="Confirmado"
                class="filtro-btn px-4 py-2 rounded-xl text-sm font-semibold border-2 border-slate-200 text-slate-600 hover:border-primary hover:text-primary transition-all">
                Confirmado
            </button>
            <button type="button" onclick="filtrarPorEstado('Empaquetado')" data-estado="Empaquetado"
                class="filtro-btn px-4 py-2 rounded-xl text-sm font-semibold border-2 border-slate-200 text-slate-600 hover:border-primary hover:text-primary transition-all">
                Empaquetado
            </button>
            <button type="button" onclick="filtrarPorEstado('En Camino')" data-estado="En Camino"
                class="filtro-btn px-4 py-2 rounded-xl text-sm font-semibold border-2 border-slate-200 text-slate-600 hover:border-primary hover:text-primary transition-all">
                En Camino
            </button>
            <button type="button" onclick="filtrarPorEstado('Entregado')" data-estado="Entregado"
                class="filtro-btn px-4 py-2 rounded-xl text-sm font-semibold border-2 border-slate-200 text-slate-600 hover:border-primary hover:text-primary transition-all">
                Entregado
            </button>
            <button type="button" onclick="filtrarPorEstado('Cancelado')" data-estado="Cancelado"
                class="filtro-btn px-4 py-2 rounded-xl text-sm font-semibold border-2 border-slate-200 text-slate-600 hover:border-primary hover:text-primary transition-all">
                Cancelado
            </button>
            <button type="button" onclick="filtrarPorEstado('Devuelto')" data-estado="Devuelto"
                class="filtro-btn px-4 py-2 rounded-xl text-sm font-semibold border-2 border-slate-200 text-slate-600 hover:border-primary hover:text-primary transition-all">
                Devuelto
            </button>
        </div>

        <!-- Tabla de pedidos -->
        <div class="bg-white rounded-2xl border border-slate-100 shadow-sm overflow-hidden">
            <div class="p-6 flex justify-between items-center border-b border-slate-100">
                <h3 class="text-base font-bold text-slate-900">Lista de Pedidos</h3>
                <span id="contadorPedidos" class="text-xs font-bold text-slate-400 uppercase tracking-wider">0 pedidos</span>
            </div>

            <!-- Estado cargando -->
            <div id="estadoCargando" class="p-12 text-center">
                <span class="material-icons-outlined text-4xl text-slate-300 animate-spin block mb-3">autorenew</span>
                <p class="text-slate-400 text-sm font-medium">Cargando pedidos...</p>
            </div>

            <!-- Estado vacío -->
            <div id="estadoVacio" class="p-12 text-center hidden">
                <span class="material-icons-outlined text-5xl text-slate-200 block mb-3">shopping_cart</span>
                <p class="text-slate-500 font-semibold text-base">No tienes pedidos aún</p>
                <p class="text-slate-400 text-sm mt-1">Cuando realices un pedido, aparecerá aquí.</p>
                <a href="CatalogoProductos.aspx" class="inline-block mt-4 px-5 py-2.5 bg-primary text-white font-semibold text-sm rounded-xl hover:opacity-90 transition-opacity">
                    Ver catálogo
                </a>
            </div>

            <!-- Tabla -->
            <div id="contenedorTabla" class="overflow-x-auto hidden">
                <table class="w-full text-left">
                    <thead class="bg-slate-50 border-y border-slate-100">
                        <tr>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Código</th>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Fecha</th>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Dirección</th>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Total</th>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Estado</th>
                            <th class="px-6 py-4 text-[11px] font-bold text-slate-400 uppercase tracking-wider">Acción</th>
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
            'En Proceso':      'bg-slate-100 text-slate-600',
            'Aprobado':        'bg-emerald-100 text-emerald-700',
            'Pendiente':       'bg-amber-100 text-amber-700',
            'Rechazado':       'bg-rose-100 text-rose-700',
            'Confirmado':      'bg-blue-100 text-blue-700',
            'En preparacion':  'bg-indigo-100 text-indigo-700',
            'En reparto':      'bg-purple-100 text-purple-700',
            'Entregado':       'bg-teal-100 text-teal-700',
            'Empaquetado':     'bg-indigo-100 text-indigo-700',
            'En Camino':       'bg-purple-100 text-purple-700',
            'Cancelado':       'bg-rose-100 text-rose-700',
            'Devuelto':        'bg-orange-100 text-orange-700',
        };

        function obtenerClaseEstado(estado) {
            return coloresEstado[estado] || 'bg-slate-100 text-slate-600';
        }

        function cargarPedidos() {
            fetch('MisPedidos.aspx/MtCargarMisPedidos', {
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
                    return;
                }

                todosPedidos = datos.data;
                document.getElementById('contenedorTabla').classList.remove('hidden');
                renderizarTabla(todosPedidos);
            })
            .catch(() => {
                document.getElementById('estadoCargando').classList.add('hidden');
                document.getElementById('estadoVacio').classList.remove('hidden');
            });
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
                <tr class="hover:bg-slate-50/50 transition-colors" data-estado="${p.estado}">
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
                        <div class="flex items-center gap-3">
                            <button type="button" onclick="abrirDetalle(${p.id}, '${(p.codigoPedido || '#' + p.id).replace(/'/g, "\\'")}', '$ ${p.total}')"
                                class="text-primary font-bold text-sm hover:underline flex items-center gap-1">
                                <span class="material-icons-outlined text-base">visibility</span> Ver detalle
                            </button>
                            ${p.barrio ? `
                            <button type="button" onclick="abrirRuta('${(p.codigoPedido || '#' + p.id).replace(/'/g, "\\'")}', '${p.barrio.replace(/'/g, "\\'")}', '${p.estado}')"
                                class="text-primary font-bold text-sm hover:underline flex items-center gap-1">
                                <span class="material-icons-outlined text-base">map</span> Ver ruta
                            </button>` : ''}
                            ${estadosCancelables.includes(p.estado) ? `
                            <button type="button" onclick="cancelarPedido(${p.id}, '${(p.codigoPedido || '#' + p.id).replace(/'/g, "\\'")}')"
                                class="text-rose-600 font-bold text-sm hover:underline flex items-center gap-1">
                                <span class="material-icons-outlined text-base">cancel</span> Cancelar
                            </button>` : ''}
                        </div>
                    </td>
                </tr>
            `).join('');
        }

        // Estados en los que el cliente aún puede solicitar la cancelación del pedido
        const estadosCancelables = ['Confirmado', 'Empaquetado', 'En Camino'];

        function cancelarPedido(idPedido, codigo) {
            Swal.fire({
                title: '¿Cancelar pedido?',
                text: `Se cancelará el pedido ${codigo}. Solo es posible dentro de los primeros 3 días hábiles.`,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, cancelar',
                cancelButtonText: 'No'
            }).then((resultado) => {
                if (!resultado.isConfirmed) return;

                fetch('MisPedidos.aspx/MtCancelarPedido', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ idPedido: idPedido })
                })
                .then(r => r.json())
                .then(resp => {
                    const datos = resp.d;
                    if (datos.success) {
                        Swal.fire('Pedido cancelado', 'El pedido se canceló correctamente', 'success')
                            .then(() => cargarPedidos());
                    } else {
                        Swal.fire('No se pudo cancelar', datos.mensaje || 'Intenta nuevamente', 'error');
                    }
                })
                .catch(() => {
                    Swal.fire('Error', 'No se pudo cancelar el pedido', 'error');
                });
            });
        }

        function filtrarPorEstado(estado) {
            // Actualizar botones
            document.querySelectorAll('.filtro-btn').forEach(btn => {
                const esActivo = btn.dataset.estado === estado;
                btn.classList.toggle('bg-primary', esActivo);
                btn.classList.toggle('text-white', esActivo);
                btn.classList.toggle('border-primary', esActivo);
                btn.classList.toggle('border-slate-200', !esActivo);
                btn.classList.toggle('text-slate-600', !esActivo);
            });

            const filtrados = estado === ''
                ? todosPedidos
                : todosPedidos.filter(p => p.estado === estado);

            renderizarTabla(filtrados);
        }

        function abrirDetalle(idPedido, codigo, total) {
            document.getElementById('modalCodigo').textContent = codigo;
            document.getElementById('modalTotal').textContent = total;
            document.getElementById('modalProductos').innerHTML =
                '<div class="flex justify-center py-6"><span class="material-icons-outlined text-3xl text-slate-300 animate-spin">autorenew</span></div>';

            document.getElementById('modalDetalle').classList.remove('hidden');
            document.getElementById('modalDetalle').classList.add('flex');

            fetch('MisPedidos.aspx/MtCargarDetallePedido', {
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

        // Dirección de origen de la distribuidora usada como punto de partida de la ruta
        const direccionDistribuidora = 'Distribuidora Keppler, Bogotá, Colombia';

        function abrirRuta(codigo, barrio, estado) {
            const zonaEntrega = `${barrio}, Bogotá, Colombia`;

            document.getElementById('modalRutaCodigo').textContent = codigo;
            document.getElementById('modalRutaDireccion').textContent = zonaEntrega;

            const badgeEstado = document.getElementById('modalRutaEstado');
            badgeEstado.textContent = estado;
            badgeEstado.className = 'px-3 py-1 rounded-full text-[10px] font-bold uppercase flex-shrink-0 ' + obtenerClaseEstado(estado);

            const origen = encodeURIComponent(direccionDistribuidora);
            const destino = encodeURIComponent(zonaEntrega);
            document.getElementById('modalRutaMapa').src = `https://www.google.com/maps?saddr=${origen}&daddr=${destino}&output=embed`;

            document.getElementById('modalRuta').classList.remove('hidden');
            document.getElementById('modalRuta').classList.add('flex');
        }

        function cerrarModalRuta() {
            document.getElementById('modalRuta').classList.add('hidden');
            document.getElementById('modalRuta').classList.remove('flex');
            document.getElementById('modalRutaMapa').src = '';
        }

        document.getElementById('modalRuta').addEventListener('click', function (e) {
            if (e.target === this) cerrarModalRuta();
        });

        document.addEventListener('DOMContentLoaded', cargarPedidos);
    </script>

</asp:Content>
