<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Preventista.aspx.cs"
    Inherits="DistribuidoraKeppler.Vista.Preventista.Preventista" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Preventista – Kepler</title>

    <!-- Tailwind -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />

    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        .card-shadow {
            box-shadow: 0 10px 25px rgba(0,0,0,0.05), 0 4px 10px rgba(0,0,0,0.03);
        }

        /* Gradiente principal de la card de ventas */
        .gradient-ventas {
            background: linear-gradient(135deg, #3b4fea 0%, #5b7cff 60%, #7c95ff 100%);
            box-shadow: 0 10px 30px rgba(59,79,234,0.35);
        }

        /* Spinner de carga */
        .skeleton {
            background: linear-gradient(90deg, #e5e7eb 25%, #f3f4f6 50%, #e5e7eb 75%);
            background-size: 200% 100%;
            animation: shimmer 1.2s infinite;
            border-radius: 6px;
            display: inline-block;
        }

        @keyframes shimmer {
            from {
                background-position: 200% 0;
            }

            to {
                background-position: -200% 0;
            }
        }

        /* Contador que hace "tick" al cargar */
        .stat-value {
            transition: opacity .3s ease;
        }

            .stat-value.loading {
                opacity: 0.3;
            }
    </style>
</head>
<body class="bg-gradient-to-br from-[#eef2ff] via-[#f4f6fb] to-[#e9eefc]">
    <form id="form1" runat="server">

        <div class="max-w-md mx-auto min-h-screen flex flex-col">

            <!-- ── HEADER ──────────────────────────────────────────────────── -->
            <div class="bg-white/80 backdrop-blur-md px-4 py-4 flex justify-between items-center border-b border-white/40 sticky top-0 z-10">
                <div class="flex items-center gap-3">
                    <!-- Foto de perfil -->
                    <div class="w-12 h-12 rounded-full bg-blue-100 flex items-center justify-center overflow-hidden border-2 border-blue-200">
                        <i class="bi bi-person-fill text-blue-500 text-xl"></i>
                    </div>
                    <div>
                        <h1 class="font-bold text-gray-900 text-sm" id="lbl-saludo">Cargando...</h1>
                        <p class="text-xs text-gray-500" id="lbl-rol">Preventista Kepler</p>
                    </div>
                </div>
                <asp:Button ID="btnCerrarSesion" runat="server" Text="Salir"
                    CssClass="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded-lg text-xs font-semibold"
                    OnClick="btnCerrarSesion_Click" />
            </div>

            <!-- ── CONTENIDO PRINCIPAL ──────────────────────────────────────── -->
            <div class="px-4 py-4 flex-1 pb-28 space-y-5">

                <!-- Fecha -->
                <p class="text-gray-400 text-xs font-medium" id="lbl-fecha"></p>

                <!-- ── CARD VENTAS TOTALES DEL DÍA (HU-103) ──────────────── -->
                <section>
                    <h2 class="font-bold text-gray-700 text-sm mb-2">Resumen del día</h2>
                    <div class="gradient-ventas text-white p-5 rounded-2xl">
                        <div class="flex justify-between items-start">
                            <div>
                                <p class="text-xs opacity-70 mb-1">Ventas Totales del Día</p>
                                <!-- HU-103: este valor se carga desde el WebMethod -->
                                <h2 class="text-3xl font-bold stat-value loading" id="stat-ventas">$0.00
                                </h2>
                                <p class="text-xs opacity-60 mt-1">Actualizado al iniciar sesión</p>
                            </div>
                            <div class="bg-white/20 rounded-xl p-3">
                                <i class="bi bi-graph-up-arrow text-2xl"></i>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- ── TARJETAS PEDIDOS Y CLIENTES (HU-104 y HU-105) ────────── -->
                <section class="grid grid-cols-2 gap-3">

                    <!-- HU-104: Pedidos creados hoy -->
                    <div class="bg-white/80 backdrop-blur-md p-4 rounded-xl card-shadow border border-white/40">
                        <div class="flex justify-between items-start mb-1">
                            <p class="text-xs text-gray-400 font-medium">Pedidos hoy</p>
                            <span class="bg-blue-50 text-blue-500 rounded-lg p-1">
                                <i class="bi bi-bag-check text-sm"></i>
                            </span>
                        </div>
                        <p class="text-2xl font-bold text-gray-800 stat-value loading" id="stat-pedidos">0</p>
                        <p class="text-xs text-gray-400 mt-1">pedidos registrados</p>
                    </div>

                    <!-- HU-105: Clientes atendidos hoy -->
                    <div class="bg-white/80 backdrop-blur-md p-4 rounded-xl card-shadow border border-white/40">
                        <div class="flex justify-between items-start mb-1">
                            <p class="text-xs text-gray-400 font-medium">Clientes hoy</p>
                            <span class="bg-green-50 text-green-500 rounded-lg p-1">
                                <i class="bi bi-people text-sm"></i>
                            </span>
                        </div>
                        <p class="text-2xl font-bold text-gray-800 stat-value loading" id="stat-clientes">0</p>
                        <p class="text-xs text-gray-400 mt-1">clientes atendidos</p>
                    </div>

                </section>

                <!-- ── SECTOR DEL DÍA (HU-87) ───────────────────────────────── -->
                <section>
                    <h2 class="font-bold text-gray-700 text-sm mb-2">Sector asignado hoy</h2>
                    <div id="sector-loading" class="h-20 skeleton w-full"></div>

                    <div id="sector-card" class="bg-white/80 backdrop-blur-md p-4 rounded-xl card-shadow border border-white/40" style="display: none;">
                        <div class="flex items-center gap-2 mb-2">
                            <span class="bg-orange-50 text-orange-500 rounded-lg p-1.5">
                                <i class="bi bi-geo-alt text-sm"></i>
                            </span>
                            <p class="font-bold text-gray-800 text-sm" id="sector-nombre">—</p>
                        </div>
                        <p class="text-xs text-gray-400 mb-2">Días de visita: <span id="sector-dias">—</span></p>
                        <div id="sector-barrios" class="flex flex-wrap gap-1.5"></div>
                    </div>

                    <div id="sector-vacio" class="text-center py-4" style="display: none;">
                        <p class="text-gray-400 text-sm">No tienes un sector asignado para hoy</p>
                    </div>
                </section>

                <!-- ── ACCESOS RÁPIDOS ────────────────────────────────────────── -->
                <section>
                    <h2 class="font-bold text-gray-700 text-sm mb-2">Accesos rápidos</h2>
                    <div class="grid grid-cols-3 gap-3">

                        <a href="CrearPedido.aspx"
                            class="bg-white/80 backdrop-blur-md rounded-xl p-4 card-shadow border border-white/40 flex flex-col items-center gap-1 hover:bg-blue-50 transition-colors">
                            <i class="bi bi-plus-circle text-blue-500 text-2xl"></i>
                            <span class="text-[10px] font-bold text-gray-600">Nuevo Pedido</span>
                        </a>

                        <a href="Clientes.aspx"
                            class="bg-white/80 backdrop-blur-md rounded-xl p-4 card-shadow border border-white/40 flex flex-col items-center gap-1 hover:bg-green-50 transition-colors">
                            <i class="bi bi-people text-green-500 text-2xl"></i>
                            <span class="text-[10px] font-bold text-gray-600">Clientes</span>
                        </a>

                        <a href="Pedidos.aspx"
                            class="bg-white/80 backdrop-blur-md rounded-xl p-4 card-shadow border border-white/40 flex flex-col items-center gap-1 hover:bg-purple-50 transition-colors">
                            <i class="bi bi-bag-check text-purple-500 text-2xl"></i>
                            <span class="text-[10px] font-bold text-gray-600">Pedidos</span>
                        </a>
                    </div>
                </section>

                <!-- ── ACTIVIDAD RECIENTE (HU-108) ──────────────────────────── -->
                <section>
                    <div class="flex justify-between items-center mb-2">
                        <h2 class="font-bold text-gray-700 text-sm">Actividad de hoy</h2>
                        <a href="Pedidos.aspx" class="text-blue-500 text-xs font-bold cursor-pointer">VER TODO</a>
                    </div>

                    <!-- Estado de carga -->
                    <div id="actividad-loading" class="space-y-3">
                        <div class="h-14 skeleton w-full"></div>
                        <div class="h-14 skeleton w-full"></div>
                    </div>

                    <!-- Lista de actividad - se llena con JS -->
                    <div id="actividad-lista" class="space-y-3" style="display: none;"></div>

                    <!-- Sin actividad -->
                    <div id="actividad-vacia" class="text-center py-6" style="display: none;">
                        <i class="bi bi-calendar-x text-gray-300 text-3xl"></i>
                        <p class="text-gray-400 text-sm mt-2">Sin actividad registrada hoy</p>
                    </div>
                </section>

            </div>

            <!-- ── NAVBAR INFERIOR ───────────────────────────────────────────── -->
            <div class="fixed bottom-0 left-0 right-0 max-w-md mx-auto bg-white/90 backdrop-blur-md border-t border-gray-100 flex justify-around py-3">
                <button type="button" class="flex flex-col items-center gap-0.5 text-blue-600">
                    <i class="bi bi-house-fill text-lg"></i>
                    <span class="text-[10px] font-bold">Inicio</span>
                </button>
                <a href="Pedidos.aspx" class="flex flex-col items-center gap-0.5 text-gray-400">
                    <i class="bi bi-bag text-lg"></i>
                    <span class="text-[10px]">Pedidos</span>
                </a>
                <a href="Clientes.aspx" class="flex flex-col items-center gap-0.5 text-gray-400">
                    <i class="bi bi-people text-lg"></i>
                    <span class="text-[10px]">Clientes</span>
                </a>
                <a href="PerfilPreventista.aspx" class="flex flex-col items-center gap-0.5 text-gray-400">
                    <i class="bi bi-person text-lg"></i>
                    <span class="text-[10px]">Perfil</span>
                </a>
            </div>

        </div>
    </form>

    <script>
        /* ── Fecha legible en el header ──────────────────────────────── */
        const diasSemana = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];
        const meses = ['enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'];
        const hoy = new Date();
        document.getElementById('lbl-fecha').textContent =
            diasSemana[hoy.getDay()] + ', ' + hoy.getDate() + ' de ' + meses[hoy.getMonth()] + ' de ' + hoy.getFullYear();

        /* ── Helper: llamar un WebMethod ASP.NET ─────────────────────── */
        function callWM(metodo, body) {
            return fetch('Preventista.aspx/' + metodo, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json; charset=utf-8' },
                body: body ? JSON.stringify(body) : '{}'
            }).then(r => r.json()).then(j => j.d);
        }

        /* ── Saludo con el nombre del usuario ───────────────────────── */
        // Se puede ampliar con un WebMethod; por ahora usamos dato de sesión
        // que ASP.NET no expone al JS, así que usamos un placeholder genérico.
        document.getElementById('lbl-saludo').textContent = '¡Hola, bienvenido!';

        /* ── HU-103: Cargar ventas totales del día ───────────────────── */
        callWM('MtVentasTotalesHoy').then(resp => {
            const el = document.getElementById('stat-ventas');
            el.classList.remove('loading');
            if (resp && resp.ok) {
                el.textContent = '$' + resp.total;
            } else {
                el.textContent = '$0.00';
            }
        }).catch(() => {
            document.getElementById('stat-ventas').textContent = '$0.00';
        });

        /* ── HU-104: Cargar pedidos del día ──────────────────────────── */
        callWM('MtPedidosHoy').then(resp => {
            const el = document.getElementById('stat-pedidos');
            el.classList.remove('loading');
            el.textContent = (resp && resp.ok) ? resp.cantidad : '0';
        }).catch(() => {
            document.getElementById('stat-pedidos').classList.remove('loading');
        });

        /* ── HU-105: Cargar clientes atendidos hoy ───────────────────── */
        callWM('MtClientesAtendidosHoy').then(resp => {
            const el = document.getElementById('stat-clientes');
            el.classList.remove('loading');
            el.textContent = (resp && resp.ok) ? resp.cantidad : '0';
        }).catch(() => {
            document.getElementById('stat-clientes').classList.remove('loading');
        });

        /* ── HU-87: Sector asignado hoy con sus barrios ──────────────── */
        callWM('MtSectorDelDia').then(resp => {
            document.getElementById('sector-loading').style.display = 'none';

            if (resp && resp.ok && resp.tieneSector) {
                document.getElementById('sector-nombre').textContent = resp.nombre;
                document.getElementById('sector-dias').textContent = resp.diasVisita;

                const cont = document.getElementById('sector-barrios');
                cont.innerHTML = '';
                (resp.barrios || []).forEach(b => {
                    const chip = document.createElement('span');
                    chip.className = 'bg-orange-50 text-orange-600 text-[11px] font-semibold px-2 py-1 rounded-lg';
                    chip.textContent = b;
                    cont.appendChild(chip);
                });

                document.getElementById('sector-card').style.display = 'block';
            } else {
                document.getElementById('sector-vacio').style.display = 'block';
            }
        }).catch(() => {
            document.getElementById('sector-loading').style.display = 'none';
            document.getElementById('sector-vacio').style.display = 'block';
        });

        /* ── HU-108: Actividad reciente (pedidos creados hoy) ─────────── */
        callWM('MtActividadHoy').then(resp => {
            document.getElementById('actividad-loading').style.display = 'none';

            const lista = (resp && resp.ok) ? resp.actividad : [];

            if (!lista.length) {
                document.getElementById('actividad-vacia').style.display = 'block';
                return;
            }

            const cont = document.getElementById('actividad-lista');
            cont.innerHTML = '';

            lista.forEach(item => {
                const fila = document.createElement('div');
                fila.className = 'bg-white/80 backdrop-blur-md p-3 rounded-xl card-shadow border border-white/40 flex justify-between items-center';
                fila.innerHTML = `
                <div>
                    <p class="font-semibold text-gray-800 text-sm">${item.cliente}</p>
                    <p class="text-xs text-gray-400">${item.codigo} · ${item.estado}</p>
                </div>
                <p class="font-bold text-blue-600 text-sm">$${item.total}</p>
            `;
                cont.appendChild(fila);
            });

            cont.style.display = 'block';
        }).catch(() => {
            document.getElementById('actividad-loading').style.display = 'none';
            document.getElementById('actividad-vacia').style.display = 'block';
        });

    </script>
</body>
</html>
