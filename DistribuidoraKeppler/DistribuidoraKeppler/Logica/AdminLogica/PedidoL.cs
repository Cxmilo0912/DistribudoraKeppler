using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using Microsoft.Identity.Client;
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

        // === Metodos creados Por Jhon ===
        public List<Pedido> MtListarPedido()
        {
            PedidoD oPedidoD = new PedidoD();

            return oPedidoD.MtListarPedidos();
        }

        public string MtCambiarEstado(int idPedido, string nuevoEstado)
        {
            PedidoD oPedidoD = new PedidoD();

            if (idPedido <= 0)
            {
                return "El ID del pedido no es valido";
            }

            string[] estadosValidos = { "Pendiente", "Confirmado", "En preparacion", "En reparto", "Entregado" };
            bool esValido = false;

            foreach (string e in estadosValidos)
            {
                if (e == nuevoEstado)
                {
                    esValido = true;
                    break;
                }
            }

            if (!esValido)
            {
                return "El estado indicado no es válido";
            }

            bool resultado = oPedidoD.MtCambiarEstadoPedido(idPedido, nuevoEstado);
            return resultado ? null : "No se pudo actualizar el estado del pedido";
        }
        // === Metodos creados Por Jhon ===
    }
}