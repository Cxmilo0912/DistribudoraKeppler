using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Cliente
{
    public partial class DashboardCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cliente"] == null)
                Response.Redirect("~/Vista/Auth/Login.aspx");
        }

        private static readonly HashSet<string> EstadosFinalizados = new HashSet<string>
        {
            "Entregado", "Cancelado", "Rechazado", "Devuelto"
        };

        [WebMethod]
        public static object MtCargarResumenDashboard()
        {
            Modelo.Cliente cliente = (Modelo.Cliente)HttpContext.Current.Session["Cliente"];
            if (cliente == null)
                return new { success = false, mensaje = "Sesión no válida" };

            PedidoL oPedidoL = new PedidoL();
            List<Pedido> pedidos = oPedidoL.MtListarPedidosCliente(cliente.Id);

            DateTime ahora = DateTime.Now;
            int pedidosDelMes = pedidos.Count(p => p.Fecha.Month == ahora.Month && p.Fecha.Year == ahora.Year);
            decimal totalInvertido = pedidos.Sum(p => p.Total);
            int enProceso = pedidos.Count(p => !EstadosFinalizados.Contains(p.Estado));

            decimal totalPendiente = pedidos.Where(p => !EstadosFinalizados.Contains(p.Estado)).Sum(p => p.Total);
            int pedidosEntregados = pedidos.Count(p => p.Estado == "Entregado");
            int porcentajeEntregados = pedidos.Count > 0 ? (int)Math.Round(pedidosEntregados * 100m / pedidos.Count) : 0;

            Pedido ultimoPedido = pedidos.OrderByDescending(p => p.Fecha).FirstOrDefault();

            return new
            {
                success = true,
                pedidosDelMes = pedidosDelMes,
                totalInvertido = totalInvertido.ToString("N2"),
                enProceso = enProceso,
                totalPendiente = totalPendiente.ToString("N2"),
                porcentajeEntregados = porcentajeEntregados,
                totalPedidos = pedidos.Count,
                ultimoPedidoCodigo = ultimoPedido != null ? (ultimoPedido.CodigoPedido ?? ("#" + ultimoPedido.Id)) : null,
                ultimoPedidoFecha = ultimoPedido != null ? ultimoPedido.Fecha.ToString("dd MMM yyyy") : null,
                ultimoPedidoTotal = ultimoPedido != null ? ultimoPedido.Total.ToString("N2") : null
            };
        }
    }

}