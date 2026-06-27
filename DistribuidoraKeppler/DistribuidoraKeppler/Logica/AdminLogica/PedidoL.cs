using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica
{
    public class PedidoL
    {
        {

            PedidoD oPedidoCompleto = new PedidoD();

            return oPedidoCompleto.MtCrearPedido(oPedido, oDetalles);
        }

        public List<Pedido> MtObtenerUltimosPedidosPorCliente(int idCliente, int cantidad = 5)
        {
            if (idCliente <= 0) return new List<Pedido>();
            return new PedidoD().MtObtenerUltimosPedidosPorCliente(idCliente, cantidad);
        }

        {


        public bool MtPuedeCancelar(Pedido pedido)
        {
            if (pedido.Estado != "Pendiente" && pedido.Estado != "En Proceso")
                return false;
            return DateTime.Today <= MtFechaLimiteCancelacion(pedido.Fecha);
        }

        public bool MtCancelarPedido(int idPedido, int idCliente)
        {
            if (idPedido <= 0 || idCliente <= 0) return false;
            return new PedidoD().MtCancelarPedido(idPedido, idCliente);
        }
    }
}