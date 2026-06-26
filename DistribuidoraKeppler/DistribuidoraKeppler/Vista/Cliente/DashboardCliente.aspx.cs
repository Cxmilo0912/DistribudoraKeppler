using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;
using System;
using System.Globalization;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Cliente
{
    public partial class DashboardCliente : System.Web.UI.Page
    {
        private static readonly CultureInfo _es = new CultureInfo("es-ES");
        private readonly PedidoL oPedidoL = new PedidoL();

        protected int PedidosMes { get; private set; }
        protected decimal TotalMes { get; private set; }
        protected int EnProceso { get; private set; }
        protected string TrendPedidosIcon { get; private set; }
        protected string TrendPedidosClass { get; private set; }
        protected string TrendPedidosText { get; private set; }
        protected string TrendTotalIcon { get; private set; }
        protected string TrendTotalClass { get; private set; }
        protected string TrendTotalText { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Modelo.Cliente cliente = SesionHelper.Cliente;
                if (cliente == null)
                {
                    Response.Redirect("~/Vista/Auth/Login.aspx");
                    return;
                }

                lblNombreCliente.Text = cliente.NombreEmpresa;
                lblFechaHoy.Text = DateTime.Now.ToString("dd 'de' MMMM", _es);

                CargarEstadisticas(cliente.Id);
                CargarUltimosPedidos(cliente.Id);
            }
        }

        private void CargarEstadisticas(int idCliente)
        {
            oPedidoL.MtObtenerEstadisticasCliente(idCliente,
                out int pedidosMes, out decimal totalMes, out int enProceso,
                out int pedidosMesAnterior, out decimal totalMesAnterior);

            PedidosMes = pedidosMes;
            TotalMes   = totalMes;
            EnProceso  = enProceso;

            SetTrendPedidos(pedidosMes, pedidosMesAnterior);
            SetTrendTotal(totalMes, totalMesAnterior);
        }

        private void SetTrendPedidos(int actual, int anterior)
        {
            if (anterior == 0)
            {
                TrendPedidosIcon = "remove"; TrendPedidosClass = "text-slate-400";
                TrendPedidosText = "Sin datos del mes anterior"; return;
            }
            double pct = ((double)(actual - anterior) / anterior) * 100;
            if (pct > 0)      { TrendPedidosIcon = "trending_up";   TrendPedidosClass = "text-emerald-500"; TrendPedidosText = "+" + pct.ToString("0") + "% vs mes anterior"; }
            else if (pct < 0) { TrendPedidosIcon = "trending_down"; TrendPedidosClass = "text-rose-500";    TrendPedidosText = pct.ToString("0") + "% vs mes anterior"; }
            else               { TrendPedidosIcon = "remove";        TrendPedidosClass = "text-slate-400";   TrendPedidosText = "Sin cambios"; }
        }

        private void SetTrendTotal(decimal actual, decimal anterior)
        {
            if (anterior == 0)
            {
                TrendTotalIcon = "remove"; TrendTotalClass = "text-slate-400";
                TrendTotalText = "Sin datos del mes anterior"; return;
            }
            double pct = ((double)(actual - anterior) / (double)anterior) * 100;
            if (pct > 0)      { TrendTotalIcon = "trending_up";   TrendTotalClass = "text-emerald-500"; TrendTotalText = "+" + pct.ToString("0") + "% vs mes anterior"; }
            else if (pct < 0) { TrendTotalIcon = "trending_down"; TrendTotalClass = "text-rose-500";    TrendTotalText = pct.ToString("0") + "% vs mes anterior"; }
            else               { TrendTotalIcon = "remove";        TrendTotalClass = "text-slate-400";   TrendTotalText = "Sin cambios"; }
        }

        private void CargarUltimosPedidos(int idCliente)
        {
            var pedidos = oPedidoL.MtObtenerUltimosPedidosPorCliente(idCliente, 5);
            rptPedidos.DataSource = pedidos;
            rptPedidos.DataBind();
            pnlSinPedidos.Visible = pedidos.Count == 0;
            pnlTabla.Visible      = pedidos.Count > 0;
        }

        protected void rptPedidos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item &&
                e.Item.ItemType != ListItemType.AlternatingItem) return;

            var pedido = (Pedido)e.Item.DataItem;

            var litCodigo = (Literal)e.Item.FindControl("litCodigo");
            litCodigo.Text = string.IsNullOrEmpty(pedido.CodigoPedido)
                ? "#KEP-" + pedido.Id
                : pedido.CodigoPedido;

            var litFecha = (Literal)e.Item.FindControl("litFecha");
            litFecha.Text = pedido.Fecha.ToString("dd MMMM, yyyy", _es);

            var litTotal = (Literal)e.Item.FindControl("litTotal");
            litTotal.Text = "L. " + pedido.Total.ToString("N2", _es);

            var litEstado = (Literal)e.Item.FindControl("litEstado");
            string css = GetEstadoClass(pedido.Estado);
            litEstado.Text = "<span class=\"px-3 py-1 " + css + " text-[10px] font-bold rounded-full uppercase\">"
                           + pedido.Estado + "</span>";
        }

        private string GetEstadoClass(string estado)
        {
            switch (estado)
            {
                case "Pendiente":  return "bg-amber-100 text-amber-700";
                case "En Camino":  return "bg-blue-100 text-blue-700";
                case "En Proceso": return "bg-indigo-100 text-indigo-700";
                case "Entregado":  return "bg-emerald-100 text-emerald-700";
                case "Cancelado":  return "bg-red-100 text-red-700";
                default:           return "bg-slate-100 text-slate-700";
            }
        }
    }
}
