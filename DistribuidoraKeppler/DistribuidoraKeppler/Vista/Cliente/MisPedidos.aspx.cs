using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;
using System;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Cliente
{
    public partial class MisPedidos : System.Web.UI.Page
    {
        private static readonly CultureInfo _es = new CultureInfo("es-ES");
        private readonly PedidoL oPedidoL = new PedidoL();

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
                CargarPedidos(cliente.Id);
            }
        }

        private void CargarPedidos(int idCliente)
        {
            var pedidos = oPedidoL.MtObtenerTodosPedidosPorCliente(idCliente);
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

            string codigo = string.IsNullOrEmpty(pedido.CodigoPedido)
                ? "#KEP-" + pedido.Id
                : pedido.CodigoPedido;

            ((Literal)e.Item.FindControl("litCodigo")).Text = codigo;

            ((Literal)e.Item.FindControl("litFecha")).Text =
                pedido.Fecha.ToString("dd MMMM yyyy", _es);

            ((Literal)e.Item.FindControl("litDireccion")).Text =
                HttpUtility.HtmlEncode(pedido.DireccionEntrega);

            ((Literal)e.Item.FindControl("litTotal")).Text =
                "L. " + pedido.Total.ToString("N2", _es);

            string css = GetEstadoClass(pedido.Estado);
            ((Literal)e.Item.FindControl("litEstado")).Text =
                "<span class=\"px-3 py-1 " + css + " text-[10px] font-bold rounded-full uppercase\">"
                + pedido.Estado + "</span>";

            var litAcciones = (Literal)e.Item.FindControl("litAcciones");
            if (oPedidoL.MtPuedeCancelar(pedido))
            {
                string codigoJs = HttpUtility.JavaScriptStringEncode(codigo);
                DateTime limite = PedidoL.MtFechaLimiteCancelacion(pedido.Fecha);
                litAcciones.Text =
                    "<div class=\"flex flex-col gap-1\">" +
                    "<button type=\"button\" onclick=\"abrirModalCancelacion('" + pedido.Id + "', '" + codigoJs + "')\" " +
                    "class=\"px-3 py-1.5 bg-red-50 text-red-600 border border-red-200 rounded-lg text-xs font-semibold hover:bg-red-100 transition-colors\">" +
                    "Cancelar</button>" +
                    "<span class=\"text-[10px] text-slate-400\">Hasta el " + limite.ToString("dd MMM", _es) + "</span>" +
                    "</div>";
            }
            else
            {
                litAcciones.Text = "<span class=\"text-slate-300\">—</span>";
            }
        }

        protected void btnConfirmarCancelacion_Click(object sender, EventArgs e)
        {
            Modelo.Cliente cliente = SesionHelper.Cliente;
            if (cliente == null) { Response.Redirect("~/Vista/Auth/Login.aspx"); return; }

            if (!int.TryParse(hfPedidoId.Value, out int idPedido) || idPedido <= 0)
            {
                MostrarMensaje(false, "Solicitud inválida.");
                CargarPedidos(cliente.Id);
                return;
            }

            var pedidos = oPedidoL.MtObtenerTodosPedidosPorCliente(cliente.Id);
            var pedido = pedidos.FirstOrDefault(p => p.Id == idPedido);

            if (pedido == null || !oPedidoL.MtPuedeCancelar(pedido))
            {
                MostrarMensaje(false, "No es posible cancelar este pedido. Verifica su estado y que esté dentro del plazo de 3 días hábiles.");
                CargarPedidos(cliente.Id);
                return;
            }

            bool ok = oPedidoL.MtCancelarPedido(idPedido, cliente.Id);
            MostrarMensaje(ok,
                ok ? "Tu pedido ha sido cancelado correctamente."
                   : "No se pudo cancelar el pedido. Por favor inténtalo de nuevo.");
            CargarPedidos(cliente.Id);
        }

        private void MostrarMensaje(bool exito, string texto)
        {
            string css = exito
                ? "flex items-center gap-3 bg-emerald-50 border border-emerald-200 text-emerald-800 rounded-xl px-5 py-4 mb-6"
                : "flex items-center gap-3 bg-red-50 border border-red-200 text-red-800 rounded-xl px-5 py-4 mb-6";
            string icon = exito ? "check_circle" : "error";
            litMensaje.Text = "<div class=\"" + css + "\"><span class=\"material-icons-outlined text-xl\">" + icon + "</span><span>" + HttpUtility.HtmlEncode(texto) + "</span></div>";
            pnlMensaje.Visible = true;
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
