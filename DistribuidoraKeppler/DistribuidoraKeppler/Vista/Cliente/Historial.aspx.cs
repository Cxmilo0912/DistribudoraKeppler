using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Cliente
{
    public partial class Historial : System.Web.UI.Page
    {
        private static readonly CultureInfo _es = new CultureInfo("es-ES");
        private readonly PedidoL oPedidoL = new PedidoL();

        protected int TotalPedidos { get; private set; }
        protected decimal TotalGastado { get; private set; }
        protected decimal PromedioPedido { get; private set; }

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
                CargarHistorial(cliente.Id);
            }
        }

        private void CargarHistorial(int idCliente)
        {
            List<Pedido> pedidos = oPedidoL.MtObtenerTodosPedidosPorCliente(idCliente);

            TotalPedidos  = pedidos.Count;
            TotalGastado  = pedidos.Sum(p => p.Total);
            PromedioPedido = TotalPedidos > 0 ? TotalGastado / TotalPedidos : 0;

            rptHistorial.DataSource = pedidos;
            rptHistorial.DataBind();

            pnlSinHistorial.Visible = pedidos.Count == 0;
            pnlTabla.Visible        = pedidos.Count > 0;
        }

        protected void rptHistorial_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item &&
                e.Item.ItemType != ListItemType.AlternatingItem) return;

            var pedido = (Pedido)e.Item.DataItem;

            ((Literal)e.Item.FindControl("litCodigo")).Text =
                string.IsNullOrEmpty(pedido.CodigoPedido)
                    ? "#KEP-" + pedido.Id
                    : pedido.CodigoPedido;

            ((Literal)e.Item.FindControl("litFecha")).Text =
                pedido.Fecha.ToString("dd MMMM yyyy", _es);

            ((Literal)e.Item.FindControl("litDireccion")).Text =
                System.Web.HttpUtility.HtmlEncode(pedido.DireccionEntrega);

            ((Literal)e.Item.FindControl("litTotal")).Text =
                "L. " + pedido.Total.ToString("N2", _es);

            string css = GetEstadoClass(pedido.Estado);
            ((Literal)e.Item.FindControl("litEstado")).Text =
                "<span class=\"px-3 py-1 " + css + " text-[10px] font-bold rounded-full uppercase\">"
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
