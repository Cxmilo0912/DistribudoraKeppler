$(document).ready(function () {
    MtRenderizarCarro();
    $(document).on('click', '#btnConfirmarPedido', function (e) {

        e.preventDefault();
        let carrito = JSON.parse(localStorage.getItem('carritoCompras')) || [];

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
        var referenciaUnica = "KEP-" + new Date().getTime();
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
                console.log("Pedido Creado");

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
                                'responseUrl': 'https://figurine-chivalry-porcupine.ngrok-free.dev/Vista/Cliente/Carrito/ResultadoPago.aspx',
                                'confirmationUrl': 'https://figurine-chivalry-porcupine.ngrok-free.dev/Vista/Cliente/Carrito/ResultadoPago.aspx'
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
    let carrito = JSON.parse(localStorage.getItem('carritoCompras')) || [];
    const contenedor = document.getElementById('contenedorCarrito');
    const totalDOM = document.getElementById('carrito-total');
    const panel = document.getElementById('panelVacio');

    if (!contenedor) return;

    contenedor.innerHTML = '';
    let totalGeneral = 0;

    if (carrito.length === 0) {
        contenedor.innerHTML = '';
        panel.style.display = 'block';
        return;
    }

    carrito.forEach((prod, posicion) => {
        const subTotal = (prod.precio * prod.cantidad).toFixed(2);
        totalGeneral += prod.precio * prod.cantidad;

        const productoHtml = `
            <div class="producto-row p-3 mb-3 border-bottom">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <h6 class="fw-bold mb-0">${prod.nombre}</h6>
                        <small class="text-muted">$${prod.precio.toFixed(2)} x ${prod.cantidad}</small>
                    </div>
                    <div class="d-flex align-items-center">
                        <span class="fw-bold text-success me-3">$${subTotal}</span>
                        <button type="button" class="btn btn-outline-danger btn-sm border-0" onclick="MtEliminarProducto(${posicion})">
                            <i class="bi bi-trash"></i>
                        </button>
                    </div>
                </div>
            </div>
        `;

        contenedor.insertAdjacentHTML('beforeend', productoHtml);
    });

    if (totalDOM) {
        totalDOM.innerText = `$${totalGeneral.toFixed(2)}`;
    }
};

function MtEliminarProducto(posicion) {
    let carrito = JSON.parse(localStorage.getItem('carritoCompras')) || [];

    carrito.splice(posicion, 1);

    localStorage.setItem('carritoCompras', JSON.stringify(carrito));

    MtRenderizarCarro();
};



