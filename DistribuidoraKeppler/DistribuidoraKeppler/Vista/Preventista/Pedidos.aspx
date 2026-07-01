<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Preventista.Pedidos" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mis pedidos – Kepler</title>

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
            <div class="bg-white/80 backdrop-blur-md px-4 py-4 flex items-center justify-between border-b border-white/40 sticky top-0 z-10">
                <div class="flex items-center gap-3">
                    <a href="Preventista.aspx" class="text-gray-500"><i class="bi bi-arrow-left text-xl"></i></a>
                    <h1 class="font-bold text-gray-900 text-sm">Mis pedidos</h1>
                </div>
                <a href="CrearPedido.aspx" class="bg-blue-500 hover:bg-blue-600 text-white px-3 py-1.5 rounded-lg text-xs font-semibold">
                    <i class="bi bi-plus-lg"></i>Nuevo
                </a>
            </div>

            <div class="px-4 py-4 flex-1 space-y-3">

                <!-- ── LISTADO DETALLADO DE PEDIDOS (HU-110) ──────────────── -->
                <div id="pedidos-loading" class="space-y-2">
                    <div class="h-20 bg-gray-100 rounded-xl animate-pulse"></div>
                    <div class="h-20 bg-gray-100 rounded-xl animate-pulse"></div>
                    <div class="h-20 bg-gray-100 rounded-xl animate-pulse"></div>
                </div>

                <div id="pedidos-lista" class="space-y-3"></div>

                <div id="pedidos-vacio" class="text-center py-10" style="display: none;">
                    <i class="bi bi-bag text-gray-300 text-3xl"></i>
                    <p class="text-gray-400 text-sm mt-2">Aún no has registrado pedidos</p>
                </div>
            </div>
        </div>
    </form>

    <script>
        function callWM(metodo, body) {
            return fetch('Pedidos.aspx/' + metodo, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json; charset=utf-8' },
                body: body ? JSON.stringify(body) : '{}'
            }).then(r => r.json()).then(j => j.d);
        }

        function badgeColor(estado) {
            switch ((estado || '').toLowerCase()) {
                case 'pendiente': return 'bg-amber-50 text-amber-600';
                case 'entregado': return 'bg-green-50 text-green-600';
                case 'cancelado': return 'bg-red-50 text-red-600';
                default: return 'bg-blue-50 text-blue-600';
            }
        }

        callWM('MtListarPedidos').then(resp => {
            document.getElementById('pedidos-loading').style.display = 'none';
            const lista = (resp && resp.ok) ? resp.pedidos : [];

            if (!lista.length) {
                document.getElementById('pedidos-vacio').style.display = 'block';
                return;
            }

            const cont = document.getElementById('pedidos-lista');

            lista.forEach((p, idx) => {
                const detalleHtml = p.detalles.map(d =>
                    `<div class="flex justify-between text-xs text-gray-500 py-0.5">
                        <span>${d.producto} x${d.cantidad}</span>
                        <span>$${d.subtotal}</span>
                     </div>`
                ).join('');

                const card = document.createElement('div');
                card.className = 'bg-white/80 backdrop-blur-md rounded-xl card-shadow border border-white/40 overflow-hidden';
                card.innerHTML = `
                    <div class="p-3 flex justify-between items-center cursor-pointer" data-idx="${idx}">
                        <div>
                            <p class="text-sm font-semibold text-gray-800">${p.cliente}</p>
                            <p class="text-xs text-gray-400">${p.codigo} · ${p.fecha}</p>
                        </div>
                        <div class="text-right">
                            <p class="font-bold text-blue-600 text-sm">$${p.total}</p>
                            <span class="text-[10px] font-bold px-2 py-0.5 rounded-full ${badgeColor(p.estado)}">${p.estado}</span>
                        </div>
                    </div>
                    <div class="px-3 pb-3 border-t border-gray-100 pt-2" style="display:none;" id="detalle-${idx}">
                        ${detalleHtml || '<p class="text-xs text-gray-400">Sin productos registrados</p>'}
                    </div>
                `;
                card.querySelector('[data-idx]').onclick = () => {
                    const det = document.getElementById('detalle-' + idx);
                    det.style.display = det.style.display === 'none' ? 'block' : 'none';
                };
                cont.appendChild(card);
            });
        }).catch(() => {
            document.getElementById('pedidos-loading').style.display = 'none';
            document.getElementById('pedidos-vacio').style.display = 'block';
        });
    </script>
</body>
</html>
