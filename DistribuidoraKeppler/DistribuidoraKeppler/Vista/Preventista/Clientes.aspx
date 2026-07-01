<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Preventista.Clientes" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mis clientes – Kepler</title>

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

        .modal-overlay {
            background: rgba(15,23,42,0.45);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-[#eef2ff] via-[#f4f6fb] to-[#e9eefc]">
    <form id="form1" runat="server">
        <div class="max-w-md mx-auto min-h-screen flex flex-col pb-10">

            <!-- HEADER -->
            <div class="bg-white/80 backdrop-blur-md px-4 py-4 flex items-center justify-between border-b border-white/40 sticky top-0 z-10">
                <div class="flex items-center gap-3">
                    <a href="Preventista.aspx" class="text-gray-500"><i class="bi bi-arrow-left text-xl"></i></a>
                    <h1 class="font-bold text-gray-900 text-sm">Mis clientes</h1>
                </div>
                <button type="button" id="btn-abrir-modal"
                    class="bg-green-500 hover:bg-green-600 text-white px-3 py-1.5 rounded-lg text-xs font-semibold flex items-center gap-1">
                    <i class="bi bi-plus-lg"></i>Nuevo
                </button>
            </div>

            <div class="px-4 py-4 flex-1 space-y-3">

                <input type="text" id="inp-filtro" placeholder="Buscar cliente..."
                    class="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm bg-white/80" />

                <!-- ── LISTADO DE CLIENTES ASOCIADOS (HU-109) ─────────────── -->
                <div id="clientes-loading" class="space-y-2">
                    <div class="h-16 bg-gray-100 rounded-xl animate-pulse"></div>
                    <div class="h-16 bg-gray-100 rounded-xl animate-pulse"></div>
                    <div class="h-16 bg-gray-100 rounded-xl animate-pulse"></div>
                </div>

                <div id="clientes-lista" class="space-y-2"></div>

                <div id="clientes-vacio" class="text-center py-10" style="display: none;">
                    <i class="bi bi-people text-gray-300 text-3xl"></i>
                    <p class="text-gray-400 text-sm mt-2">Aún no tienes clientes asociados</p>
                </div>
            </div>
        </div>

        <!-- ── MODAL: AGREGAR NUEVO CLIENTE (HU-111) ───────────────────── -->
        <div id="modal-cliente" class="fixed inset-0 modal-overlay flex items-center justify-center z-50 px-4" style="display: none;">
            <div class="bg-white rounded-2xl p-5 w-full max-w-md space-y-3">
                <div class="flex justify-between items-center">
                    <h2 class="font-bold text-gray-800 text-sm">Nuevo cliente</h2>
                    <button type="button" id="btn-cerrar-modal" class="text-gray-400"><i class="bi bi-x-lg"></i></button>
                </div>

                <div>
                    <label class="text-xs text-gray-500 font-medium">Nombre / Empresa *</label>
                    <input type="text" id="m-nombre" class="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm mt-1" />
                </div>
                <div>
                    <label class="text-xs text-gray-500 font-medium">NIT</label>
                    <input type="text" id="m-nit" class="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm mt-1" />
                </div>
                <div>
                    <label class="text-xs text-gray-500 font-medium">Teléfono *</label>
                    <input type="text" id="m-telefono" class="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm mt-1" />
                </div>
                <div>
                    <label class="text-xs text-gray-500 font-medium">Dirección</label>
                    <input type="text" id="m-direccion" class="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm mt-1" />
                </div>
                <div>
                    <label class="text-xs text-gray-500 font-medium">Email</label>
                    <input type="email" id="m-email" class="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm mt-1" />
                </div>
                <div>
                    <label class="text-xs text-gray-500 font-medium">Contraseña</label>
                    <input type="email" id="m-contrasena" class="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm mt-1" />
                </div>
                <div>
                    <label class="text-xs text-gray-500 font-medium">Barrio</label>
                    <select id="m-barrio" class="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm mt-1">
                        <option value="0">Selecciona un barrio</option>
                    </select>
                </div>

                <p id="m-error" class="text-xs text-red-500 font-semibold"></p>

                <button type="button" id="btn-guardar-cliente"
                    class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-2.5 rounded-xl">
                    Guardar cliente
                </button>
            </div>
        </div>
    </form>

    <script>
        let clientesCache = [];

        function callWM(metodo, body) {
            return fetch('Clientes.aspx/' + metodo, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json; charset=utf-8' },
                body: body ? JSON.stringify(body) : '{}'
            }).then(r => r.json()).then(j => j.d);
        }

        function pintarClientes(lista) {
            const cont = document.getElementById('clientes-lista');
            cont.innerHTML = '';

            if (!lista.length) {
                document.getElementById('clientes-vacio').style.display = 'block';
                cont.style.display = 'none';
                return;
            }

            document.getElementById('clientes-vacio').style.display = 'none';
            cont.style.display = 'block';

            lista.forEach(c => {
                const card = document.createElement('div');
                card.className = 'bg-white/80 backdrop-blur-md p-3 rounded-xl card-shadow border border-white/40 flex items-center gap-3';
                card.innerHTML = `
                    <div class="w-10 h-10 rounded-full bg-blue-100 flex items-center justify-center text-blue-500">
                        <i class="bi bi-building"></i>
                    </div>
                    <div class="flex-1">
                        <p class="text-sm font-semibold text-gray-800">${c.nombreEmpresa}</p>
                        <p class="text-xs text-gray-400">${c.telefono || 'Sin teléfono'} · ${c.barrio || 'Sin barrio'}</p>
                    </div>
                    <a href="tel:${c.telefono}" class="text-green-500"><i class="bi bi-telephone-fill"></i></a>
                `;
                cont.appendChild(card);
            });
        }

        /* ── HU-109: Cargar clientes asociados ──────────────────────── */
        callWM('MtListarClientes').then(resp => {
            document.getElementById('clientes-loading').style.display = 'none';
            clientesCache = (resp && resp.ok) ? resp.clientes : [];
            pintarClientes(clientesCache);
        }).catch(() => {
            document.getElementById('clientes-loading').style.display = 'none';
            document.getElementById('clientes-vacio').style.display = 'block';
        });

        document.getElementById('inp-filtro').addEventListener('input', (e) => {
            const texto = e.target.value.toLowerCase();
            const filtrados = clientesCache.filter(c => c.nombreEmpresa.toLowerCase().includes(texto));
            pintarClientes(filtrados);
        });

        /* ── HU-111: Modal para agregar cliente nuevo ───────────────── */
        callWM('MtListarBarrios').then(resp => {
            if (!resp || !resp.ok) return;
            const sel = document.getElementById('m-barrio');
            resp.barrios.forEach(b => {
                const opt = document.createElement('option');
                opt.value = b.id;
                opt.textContent = b.nombre;
                sel.appendChild(opt);
            });
        });

        document.getElementById('btn-abrir-modal').onclick = () => {
            document.getElementById('modal-cliente').style.display = 'flex';
        };
        document.getElementById('btn-cerrar-modal').onclick = () => {
            document.getElementById('modal-cliente').style.display = 'none';
        };

        document.getElementById('btn-guardar-cliente').onclick = () => {
            const errorEl = document.getElementById('m-error');
            errorEl.textContent = '';

            const payload = {
                nombreEmpresa: document.getElementById('m-nombre').value.trim(),
                nit: document.getElementById('m-nit').value.trim(),
                telefono: document.getElementById('m-telefono').value.trim(),
                direccion: document.getElementById('m-direccion').value.trim(),
                email: document.getElementById('m-email').value.trim(),
                contrasena: document.getElementById('m-contrasena').value.trim(),
                idBarrio: parseInt(document.getElementById('m-barrio').value)
            };

            callWM('MtAgregarCliente', payload).then(resp => {
                if (resp && resp.ok) {
                    document.getElementById('modal-cliente').style.display = 'none';
                    window.location.reload();
                } else {
                    errorEl.textContent = (resp && resp.mensaje) || 'No se pudo registrar el cliente.';
                }
            }).catch(() => {
                errorEl.textContent = 'Ocurrió un error al registrar el cliente.';
            });
        };
    </script>
</body>
</html>
