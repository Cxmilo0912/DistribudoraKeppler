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
        public int MtCrearPedido(Pedido oPedido, List<DetallePedido> oDetalles)
        {
            if (oPedido.Total <= 0) return 0;
            if (oDetalles.Count <= 0) return 0;

            PedidoD oPedidoCompleto = new PedidoD();

            return oPedidoCompleto.MtCrearPedido(oPedido, oDetalles);

        }

        public bool MtActualizarPedido(Pedido oPedido)
        {
            PedidoD oPedidoD = new PedidoD();

            return oPedidoD.MtActualizarPedido(oPedido);


        }
    }
}