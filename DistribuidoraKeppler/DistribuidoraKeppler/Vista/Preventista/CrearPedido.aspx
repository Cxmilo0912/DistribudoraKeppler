<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearPedido.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Preventista.CrearPedido" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Nuevo pedido – Kepler</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />

    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        .card-shadow {
            box-shadow: 0 10px 25px rgba(0,0,0,0.05), 0 4px 10px rgba(0,0,0,0.03);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-[#eef2ff] via-[#f4f6fb] to-[#e9eefc]">
    <form id="form1" runat="server">
        <div class="max-w-md mx-auto min-h-screen flex flex-col pb-10">

            <!-- HEADER -->
            <div class="bg-white/80 backdrop-blur-md px-4 py-4 flex items-center gap-3 border-b border-white/40 sticky top-0 z-10">
                <a href="Preventista.aspx" class="text-gray-500"><i class="bi bi-arrow-left text-xl"></i></a>
                <h1 class="font-bold text-gray-900 text-sm">Nuevo pedido</h1>
            </div>

            <div class="px-4 py-4 flex-1 space-y-5">

                <!-- ── DATOS DEL CLIENTE (HU-43) ───────────────────────────── -->
                <section class="bg-white/80 backdrop-blur-md p-4 rounded-xl card-shadow border border-white/40 space-y-3">
                    <h2 class="font-bold text-gray-700 text-sm">Datos del cliente</h2>

                    <div>
                        <label class="text-xs text-gray-500 font-medium">Teléfono</label>
                        <div class="flex gap-2 mt-1">
                            <input type="text" id="inp-telefono" placeholder="Ej: 3001234567"
                                class="flex-1 border border-gray-200 rounded-lg px-3 py-2 text-sm" />
                            <button type="button" id="btn-buscar-cliente"
                                class="bg-blue-500 text-white px-3 rounded-lg text-xs font-semibold">
                                Buscar</button>
                        </div>
                        <p class="text-[11px] text-gray-400 mt-1" id="lbl-busqueda"></p>
                    </div>

                    <div>
                        <label class="text-xs text-gray-500 font-medium">Nombre / Empresa</label>
                        <input type="text" id="inp-nombre" placeholder="Nombre del cliente"
                            class="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm mt-1" />
                    </div>

                    <div>
                        <label class="text-xs text-gray-500 font-medium">Ubicación / Dirección</label>
                        <input type="text" id="inp-direccion" placeholder="Dirección del punto de venta"
                            class="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm mt-1" />
                    </div>

                    <div>
                        <label class="text-xs text-gray-500 font-medium">Barrio</label>
                        <select id="sel-barrio" class="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm mt-1">
                            <option value="0">Selecciona un barrio</option>
                        </select>
                    </div>

                    <input type="hidden" id="hid-idCliente" value="0" />
                </section>

                <!-- ── PRODUCTOS (HU-43) ───────────────────────────────────── -->
                <section>
                    <h2 class="font-bold text-gray-700 text-sm mb-2">Productos</h2>
                    <div id="prod-loading" class="space-y-2">
                        <div class="h-12 bg-gray-100 rounded-lg animate-pulse"></div>
                        <div class="h-12 bg-gray-100 rounded-lg animate-pulse"></div>
                    </div>
                    <div id="prod-lista" class="space-y-2"></div>
                </section>

                <!-- ── CARRITO ──────────────────────────────────────────────── -->
                <section id="carrito-section" style="display: none;">
                    <h2 class="font-bold text-gray-700 text-sm mb-2">Resumen del pedido</h2>
                    <div id="carrito-lista" class="space-y-2"></div>
                    <div class="flex justify-between items-center mt-3 bg-white/80 p-3 rounded-xl card-shadow border border-white/40">
                        <p class="text-sm font-semibold text-gray-600">Total</p>
                        <p class="text-lg font-bold text-blue-600" id="lbl-total">$0.00</p>
                    </div>
                </section>

                <p id="lbl-error" class="text-xs text-red-500 font-semibold"></p>

                <button type="button" id="btn-guardar"
                    class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 rounded-xl">
                    Guardar pedido
                </button>
            </div>
        </div>
    </form>

    <script>
        const productos = {};   // catálogo cargado del servidor: id -> {nombre, precio, stock}
        const carrito = {};     // carrito en memoria: id -> cantidad

        function callWM(metodo, body) {
            return fetch('CrearPedido.aspx/' + metodo, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json; charset=utf-8' },
                body: body ? JSON.stringify(body) : '{}'
            }).then(r => r.json()).then(j => j.d);
        }

        /* ── Cargar barrios ──────────────────────────────────────────── */
        callWM('MtListarBarrios').then(resp => {
            if (!resp || !resp.ok) return;
            const sel = document.getElementById('sel-barrio');
            resp.barrios.forEach(b => {
                const opt = document.createElement('option');
                opt.value = b.id;
                opt.textContent = b.nombre;
                sel.appendChild(opt);
            });
        });

        /* ── Cargar catálogo de productos activos ────────────────────── */
        callWM('MtListarProductos').then(resp => {
            document.getElementById('prod-loading').style.display = 'none';
            const cont = document.getElementById('prod-lista');

            if (!resp || !resp.ok || !resp.productos.length) {
                cont.innerHTML = '<p class="text-gray-400 text-sm text-center py-4">No hay productos disponibles</p>';
                return;
            }

            resp.productos.forEach(p => {
                productos[p.id] = p;

                const fila = document.createElement('div');
                fila.className = 'bg-white/80 p-3 rounded-xl card-shadow border border-white/40 flex justify-between items-center';
                fila.innerHTML = `
                    <div>
                        <p class="text-sm font-semibold text-gray-800">${p.nombre}</p>
                        <p class="text-xs text-gray-400">$${p.precio} · stock: ${p.stock}</p>
                    </div>
                    <div class="flex items-center gap-2">
                        <button type="button" class="btn-menos w-7 h-7 rounded-full bg-gray-100 text-gray-600 font-bold">-</button>
                        <span class="w-6 text-center text-sm font-semibold" id="cant-${p.id}">0</span>
                        <button type="button" class="btn-mas w-7 h-7 rounded-full bg-blue-100 text-blue-600 font-bold">+</button>
                    </div>
                `;
                fila.querySelector('.btn-mas').onclick = () => cambiarCantidad(p.id, 1);
                fila.querySelector('.btn-menos').onclick = () => cambiarCantidad(p.id, -1);
                cont.appendChild(fila);
            });
        });

        function cambiarCantidad(idProducto, delta) {
            const actual = carrito[idProducto] || 0;
            const nueva = Math.max(0, Math.min(productos[idProducto].stock, actual + delta));
            carrito[idProducto] = nueva;
            document.getElementById('cant-' + idProducto).textContent = nueva;
            pintarCarrito();
        }

        function pintarCarrito() {
            const cont = document.getElementById('carrito-lista');
            const seccion = document.getElementById('carrito-section');
            cont.innerHTML = '';
            let total = 0;
            let items = 0;

            Object.keys(carrito).forEach(id => {
                const cant = carrito[id];
                if (cant > 0) {
                    items++;
                    const sub = cant * productos[id].precio;
                    total += sub;
                    const fila = document.createElement('div');
                    fila.className = 'flex justify-between text-sm bg-white/60 px-3 py-2 rounded-lg';
                    fila.innerHTML = `<span>${productos[id].nombre} x${cant}</span><span class="font-semibold">$${sub.toFixed(2)}</span>`;
                    cont.appendChild(fila);
                }
            });

            seccion.style.display = items > 0 ? 'block' : 'none';
            document.getElementById('lbl-total').textContent = '$' + total.toFixed(2);
        }

        /* ── Buscar cliente existente por teléfono ───────────────────── */
        document.getElementById('btn-buscar-cliente').onclick = () => {
            const telefono = document.getElementById('inp-telefono').value.trim();
            if (!telefono) return;

            callWM('MtBuscarCliente', { telefono: telefono }).then(resp => {
                const lbl = document.getElementById('lbl-busqueda');
                if (resp && resp.ok && resp.encontrado) {
                    document.getElementById('hid-idCliente').value = resp.id;
                    document.getElementById('inp-nombre').value = resp.nombreEmpresa;
                    document.getElementById('inp-direccion').value = resp.direccion;
                    lbl.textContent = 'Cliente existente encontrado y cargado.';
                    lbl.className = 'text-[11px] text-green-600 mt-1';
                } else {
                    document.getElementById('hid-idCliente').value = 0;
                    lbl.textContent = 'No existe, se registrará como cliente nuevo al guardar.';
                    lbl.className = 'text-[11px] text-amber-600 mt-1';
                }
            });
        };

        /* ── Guardar pedido ───────────────────────────────────────────── */
        document.getElementById('btn-guardar').onclick = () => {
            const errorEl = document.getElementById('lbl-error');
            errorEl.textContent = '';

            const idsProducto = [];
            const cantidades = [];
            const precios = [];

            Object.keys(carrito).forEach(id => {
                if (carrito[id] > 0) {
                    idsProducto.push(parseInt(id));
                    cantidades.push(carrito[id]);
                    precios.push(productos[id].precio);
                }
            });

            const payload = {
                idClienteExistente: parseInt(document.getElementById('hid-idCliente').value),
                nombreCliente: document.getElementById('inp-nombre').value.trim(),
                telefono: document.getElementById('inp-telefono').value.trim(),
                direccion: document.getElementById('inp-direccion').value.trim(),
                idBarrio: parseInt(document.getElementById('sel-barrio').value),
                idsProducto: idsProducto,
                cantidades: cantidades,
                precios: precios
            };

            callWM('MtGuardarPedido', payload).then(resp => {
                if (resp && resp.ok) {
                    window.location.href = 'Pedidos.aspx';
                } else {
                    errorEl.textContent = (resp && resp.mensaje) || 'No se pudo guardar el pedido.';
                }
            }).catch(() => {
                errorEl.textContent = 'Ocurrió un error al guardar el pedido.';
            });
        };
    </script>
</body>
</html>
