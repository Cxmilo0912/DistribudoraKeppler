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

        protected string ObtenerInicialCliente()
        {
            string nombre = DistribuidoraKeppler.Utilidades.SesionHelper.Cliente != null
                ? DistribuidoraKeppler.Utilidades.SesionHelper.Cliente.NombreEmpresa
                : null;

            return !string.IsNullOrWhiteSpace(nombre) ? nombre.Trim().Substring(0, 1).ToUpper() : "C";
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

            // Traduce los estados internos del pedido a los estados que ve el cliente
            Dictionary<string, string> mapaEstados = new Dictionary<string, string>
            {
                { "En Proceso", "Confirmado" },
                { "Pendiente", "Confirmado" },
                { "Aprobado", "Confirmado" },
                { "Confirmado", "Confirmado" },
                { "En preparacion", "Empaquetado" },
                { "Empaquetado", "Empaquetado" },
                { "En reparto", "En Camino" },
                { "En Camino", "En Camino" },
                { "Entregado", "Entregado" },
                { "Rechazado", "Cancelado" },
                { "Cancelado", "Cancelado" },
                { "Devuelto", "Devuelto" }
            };

            List<object> ultimosPedidos = pedidos
                .OrderByDescending(p => p.Fecha)
                .Take(3)
                .Select(p => new
                {
                    id = p.Id,
                    codigoPedido = p.CodigoPedido ?? ("#" + p.Id),
                    fecha = p.Fecha.ToString("dd MMM yyyy"),
                    total = p.Total.ToString("N2"),
                    estado = mapaEstados.ContainsKey(p.Estado) ? mapaEstados[p.Estado] : p.Estado
                })
                .Cast<object>()
                .ToList();

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
                ultimoPedidoTotal = ultimoPedido != null ? ultimoPedido.Total.ToString("N2") : null,
                ultimosPedidos = ultimosPedidos
            };
        }
    }

}