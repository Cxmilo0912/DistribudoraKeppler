$(document).ready(function () {

    let claveCarrito = 'carritoCompras';

    const userId = localStorage.getItem("usuarioActivoId");

    if (userId) {
        claveCarrito = `carritoCliente-${userId}`
    }

    localStorage.removeItem(claveCarrito);
});