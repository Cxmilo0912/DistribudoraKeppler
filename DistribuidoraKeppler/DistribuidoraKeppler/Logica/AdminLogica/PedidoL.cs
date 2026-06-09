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
        public bool MtCrearPedido (Pedido oPedido, List<DetallePedido> oDetalles) 
        {
            if (oPedido.Total <= 0) return false;
            if(oDetalles.Count <= 0) return false;

            PedidoD oPedidoCompleto = new PedidoD();

            return oPedidoCompleto.MtCrearPedido(oPedido, oDetalles);

        }
    }
}