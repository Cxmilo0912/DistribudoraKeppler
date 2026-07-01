$(document).ready(function () {
    $(document).on('click', '#btnConfirmarPedido', function (e) {

        e.preventDefault();
        let claveCarrito = 'carritoCompras';
        const userId = localStorage.getItem("usuarioActivoId");
        if (userId) {
            claveCarrito = `carritoCliente-${userId}`;
        }


        let carrito = JSON.parse(localStorage.getItem(claveCarrito)) || [];

        var totalPago = 0;

        var pedidoDetalles = [];
        carrito.forEach(prod => {
            totalPago += prod.precio * prod.cantidad;

            var detalle = {
                PrecioUnitario: prod.precio,
                Cantidad: prod.cantidad,
                IdProducto: {
                    Id: prod.id
                }
            };
            pedidoDetalles.push(detalle);
        });

        var pedido = {
            Total: totalPago
        }
        var moneda = "COP";
        var correoCompra = "julilo09123452@gmail.com";

        Swal.fire({
            title: 'Preparando pago seguro...',
            text: 'Te estamos redirigiendo a la pasarela de PayU',
            allowOutsideClick: false,
            didOpen: () => {
                Swal.showLoading();
            }
        });
        var urlRaiz = window.location.protocol + "//" + window.location.host;

        var urlMetodo = urlRaiz + "/Vista/Cliente/Carrito/Carrito.aspx/MtGenerarFirma";

        let descripcionFactura = "Resumen de la factura: ";

        let listaProductosNombre = carrito.map(prod => `${prod.nombre} (x${prod.cantidad})`);
        descripcionFactura += listaProductosNombre.join(' | ');

        if (descripcionFactura.length > 254) {
            descripcionFactura = descripcionFactura.substring(0, 250) + "...";
        }


        $.ajax({
            type: "POST",
            url: "Carrito.aspx/MtCrearPedido",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                oPedido: pedido,
                oDetalles: pedidoDetalles
            }),
            dataType: "json",
            success: function (respuesta) {

                var idPedido = respuesta.d.IdPedido;
                if (!idPedido || idPedido === 0) {
                    Swal.fire('Error', 'No se pudo crear el pedido', 'error');
                    return;
                }

                var referenciaUnica = "KEP-" + idPedido;
                let claveCarrito = 'carritoCompras';
                const userId = localStorage.getItem("usuarioActivoId");
                if (userId) {
                    claveCarrito = `carritoCliente-${userId}`;
                }

                localStorage.removeItem(claveCarrito);

                $.ajax({
                    type: "POST",
                    url: urlMetodo,
                    data: JSON.stringify({
                        referencia: referenciaUnica,
                        monto: totalPago,
                        moneda: moneda
                    }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",

                    success: function (response) {
                        var resultado = response.d;

                        if (resultado.Success) {


                            var campos = {
                                'merchantId': '508029',
                                'accountId': '512321',
                                'description': 'Prueba',
                                'referenceCode': referenciaUnica,
                                'amount': resultado.MontoFinal,
                                'tax': '0',
                                'taxReturnBase': '0',
                                'currency': moneda,
                                'signature': resultado.Signature || resultado.signature,
                                'test': '1', // Modo pruebas
                                'buyerEmail': correoCompra,
                                'responseUrl': 'https://localhost:44317//Vista/Cliente/Carrito/Pago.aspx',
                                'confirmationUrl': 'https://figurine-chivalry-porcupine.ngrok-free.dev/Vista/Cliente/Carrito/Pago.aspx'
                            };

                            var $formVirtual = $('<form>', {
                                action: 'https://sandbox.checkout.payulatam.com/ppp-web-gateway-payu/',
                                method: 'post'
                            });

                            $.each(campos, function (key, val) {
                                $formVirtual.append($('<input>', {
                                    type: 'hidden',
                                    name: key,
                                    value: val
                                }));
                            });


                            Swal.close();

                            $formVirtual.appendTo('body').submit();

                        }
                    }
                })
            }
        })
    });
});



function MtRenderizarCarro() {

    const contenedor = document.getElementById("contenedorCarrito");
    const lblSubTotal = document.getElementById("subtotal");
    const totalDOM = document.getElementById("total");
    const panel = document.getElementById("panelVacio");
    let claveCarrito = 'carritoCompras';
    const userId = localStorage.getItem("usuarioActivoId");
    if (userId) {
        claveCarrito = `carritoCliente-${userId}`;
    }

    let carrito = JSON.parse(localStorage.getItem(claveCarrito)) || [];

    let acumulado = 0;

    if (!contenedor) return;


    if (carrito.length == 0) {
        contenedor.innerHTML = '';
        panel.style.display = 'block';
        lblSubTotal.innerText = "0.00";
        totalDOM.innerText = "0.00";
        return;
    }
    panel.style.display = 'none';
    contenedor.innerHTML = '';

    carrito.forEach((prod, posicion) => {
        const subTotal = prod.precio * prod.cantidad;
        acumulado += subTotal;

        const productoHtml = `
            <div class="producto-row p-3 mb-3 border-bottom">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="fw-bold mb-0">${prod.nombre}</h6>
                        ${prod.descripcion ? `<small style="font-size: 0.85rem;" class="text-muted d-block">${prod.descripcion}</small>` : ''}
                        <small style="font-size: 0.9rem;" class="text-muted">$${prod.precio} x ${prod.cantidad}</small>
                    </div>
                    <div class="d-flex align-items-center">
                        <span style="color: #1e3a8a; font-size: 1.1rem;" class="fw-bold me-3">$${subTotal}</span>
                        <button type="button" class="btn btn-outline-danger btn-sm border-0" onclick="MtEliminarProducto(${posicion})">
                            <i class="bi bi-trash"></i>
                        </button>
                    </div>
                </div>
            </div>
        `;
        contenedor.insertAdjacentHTML('beforeend', productoHtml);
    });

    const totalArreglado = acumulado.toLocaleString();
    if (lblSubTotal) lblSubTotal.innerText = totalArreglado;
    if (totalDOM) totalDOM.innerText = totalArreglado;
};



function MtEliminarProducto(posicion) {

    let claveCarrito = 'carritoCompras';
    const userId = localStorage.getItem("usuarioActivoId");
    if (userId) {
        claveCarrito = `carritoCliente-${userId}`;
    }


    let carrito = JSON.parse(localStorage.getItem(claveCarrito)) || [];

    carrito.splice(posicion, 1);

    localStorage.setItem(claveCarrito, JSON.stringify(carrito));

    MtRenderizarCarro();
};

document.addEventListener('DOMContentLoaded', MtRenderizarCarro);



