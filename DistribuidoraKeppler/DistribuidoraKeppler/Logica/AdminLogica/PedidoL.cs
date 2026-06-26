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

        public List<Pedido> MtObtenerUltimosPedidosPorCliente(int idCliente, int cantidad = 5)
        {
            if (idCliente <= 0) return new List<Pedido>();
            return new PedidoD().MtObtenerUltimosPedidosPorCliente(idCliente, cantidad);
        }

        public List<Pedido> MtObtenerTodosPedidosPorCliente(int idCliente)
        {
            if (idCliente <= 0) return new List<Pedido>();
            return new PedidoD().MtObtenerTodosPedidosPorCliente(idCliente);
        }

        public void MtObtenerEstadisticasCliente(int idCliente,
            out int pedidosMes, out decimal totalMes, out int enProceso,
            out int pedidosMesAnterior, out decimal totalMesAnterior)
        {
            pedidosMes = 0; totalMes = 0; enProceso = 0;
            pedidosMesAnterior = 0; totalMesAnterior = 0;
            if (idCliente <= 0) return;
            new PedidoD().MtObtenerEstadisticasCliente(idCliente,
                out pedidosMes, out totalMes, out enProceso,
                out pedidosMesAnterior, out totalMesAnterior);
        }

        public static DateTime MtFechaLimiteCancelacion(DateTime fechaPedido)
        {
            int diasHabiles = 0;
            DateTime limite = fechaPedido.Date;
            while (diasHabiles < 3)
            {
                limite = limite.AddDays(1);
                if (limite.DayOfWeek != DayOfWeek.Saturday && limite.DayOfWeek != DayOfWeek.Sunday)
                    diasHabiles++;
            }
            return limite;
        }

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