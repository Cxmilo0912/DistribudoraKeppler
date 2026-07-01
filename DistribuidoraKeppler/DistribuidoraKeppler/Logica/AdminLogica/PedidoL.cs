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

        // === Metodos creados por Andres ===
        public List<Pedido> MtListarPedidosCliente(int idCliente)
        {
            if (idCliente <= 0) return new List<Pedido>();

            PedidoD oPedidoD = new PedidoD();
            return oPedidoD.MtListarPedidosPorCliente(idCliente);
        }

        public List<DetallePedido> MtObtenerDetallePedido(int idPedido)
        {
            if (idPedido <= 0) return new List<DetallePedido>();

            PedidoD oPedidoD = new PedidoD();
            return oPedidoD.MtObtenerDetallesPedido(idPedido);
        }
        // === Metodos creados por Andres ===

        // === Cancelacion de pedido por el cliente (plazo de 3 dias habiles) ===
        private static readonly HashSet<string> EstadosNoCancelables = new HashSet<string>
        {
            "Entregado", "Cancelado", "Rechazado", "Devuelto"
        };

        private int MtContarDiasHabiles(DateTime desde, DateTime hasta)
        {
            int dias = 0;
            DateTime fecha = desde.Date.AddDays(1);

            while (fecha <= hasta.Date)
            {
                if (fecha.DayOfWeek != DayOfWeek.Saturday && fecha.DayOfWeek != DayOfWeek.Sunday)
                    dias++;

                fecha = fecha.AddDays(1);
            }

            return dias;
        }

        public string MtCancelarPedidoCliente(int idPedido, int idCliente)
        {
            if (idPedido <= 0 || idCliente <= 0)
                return "Datos inválidos";

            PedidoD oPedidoD = new PedidoD();
            Pedido pedido = oPedidoD.MtObtenerPedidoPorId(idPedido);

            if (pedido == null)
                return "El pedido no existe";

            if (pedido.IdCliente.Id != idCliente)
                return "El pedido no pertenece a este cliente";

            if (EstadosNoCancelables.Contains(pedido.Estado))
                return "Este pedido ya no se puede cancelar";

            int diasHabilesTranscurridos = MtContarDiasHabiles(pedido.Fecha, DateTime.Now);

            if (diasHabilesTranscurridos > 3)
                return "El plazo de 3 días hábiles para cancelar el pedido ya venció";

            bool ok = oPedidoD.MtCancelarPedido(idPedido);
            return ok ? null : "No se pudo cancelar el pedido";
        }
        // === Cancelacion de pedido por el cliente (plazo de 3 dias habiles) ===
    }
}