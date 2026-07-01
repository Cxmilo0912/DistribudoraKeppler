using DistribuidoraKeppler.Datos.PreventistaDatos;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica.PreventistaLogica
{
    public class PreventistaL
    {
        PreventistaD oPreventista = new PreventistaD();
        public decimal MtVentasTotalesPorDia(int idUsuario)
        {
            return oPreventista.MtVentasTotalesPorDia(idUsuario);
        }

        public int MtTotalPedidosHoy(int idUsuario)
        {
            return oPreventista.MtTotalPedidosHoy(idUsuario);
        }
        public int MtClientesAtendidosHoy(int idUsuario)
        {
            return oPreventista.MtTotalClientesAtendidos(idUsuario);
        }

        public Sector MtSectorDelDia(int idUsuario)
        {
            return oPreventista.MtObtenerSectorDelDia(idUsuario);
        }

        public List<Pedido> MtActividadHoy(int idUsuario)
        {
            return oPreventista.MtActividadHoy(idUsuario);
        }

        public List<Cliente> MtListarClientesAsociados(int idUsuario)
        {
            return oPreventista.MtListarClientesAsociados(idUsuario);
        }

        public List<Pedido> MtListarPedidosPreventista(int idUsuario)
        {
            return oPreventista.MtListarPedidosPreventista(idUsuario);
        }

        public List<Barrio> MtListarBarrios()
        {
            return oPreventista.MtListarBarrios();
        }

        public string MtAgregarCliente(Cliente oCliente, int idUsuario, string clave)
        {
            if (string.IsNullOrWhiteSpace(oCliente.NombreEmpresa))
                return "El nombre del cliente es obligatorio.";

            if (string.IsNullOrWhiteSpace(oCliente.Telefono))
                return "El teléfono del cliente es obligatorio.";


            oCliente.Contrasena = HashHelper.Encriptar(clave);

            int idCliente = oPreventista.MtCrearCliente(oCliente);

            if (idCliente <= 0)
                return "No se pudo registrar el cliente.";

            if (!oPreventista.MtClienteYaAsociado(idUsuario, idCliente))
                oPreventista.MtAsociarClientePreventista(idUsuario, idCliente);

            return "";
        }

        public List<Producto> MtListarProductosActivos()
        {
            return oPreventista.MtListarProductosActivos();
        }

        public Cliente MtBuscarClientePorTelefono(string telefono)
        {
            return oPreventista.MtBuscarClientePorTelefono(telefono);
        }

        public string MtCrearPedido(Cliente oCliente, List<DetallePedido> oDetalles, string direccionEntrega, int idUsuario)
        {
            if (oCliente == null || string.IsNullOrWhiteSpace(oCliente.NombreEmpresa))
                return "Debes ingresar el nombre del cliente.";

            if (oCliente.Id <= 0 && string.IsNullOrWhiteSpace(oCliente.Telefono))
                return "Debes ingresar el teléfono del cliente.";

            if (oDetalles == null || oDetalles.Count == 0)
                return "El pedido debe tener al menos un producto.";

            decimal total = oDetalles.Sum(d => d.Cantidad * d.PrecioUnitario);

            Pedido oPedido = new Pedido
            {
                DireccionEntrega = direccionEntrega,
                Total = total
            };

            int idPedido = oPreventista.MtCrearPedidoCompleto(oCliente, oPedido, oDetalles, idUsuario);

            return idPedido > 0 ? "" : "No se pudo registrar el pedido. Intenta nuevamente.";
        }
    }
}