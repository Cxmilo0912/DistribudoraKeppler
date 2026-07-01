using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Web.UI;

namespace DistribuidoraKeppler.Vista.Cliente
{
    public partial class Historial : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cliente"] == null)
                Response.Redirect("~/Vista/Auth/Login.aspx");
        }

        [WebMethod]
        public static object MtCargarHistorial()
        {
            Modelo.Cliente cliente = (Modelo.Cliente)HttpContext.Current.Session["Cliente"];
            if (cliente == null)
                return new { success = false, mensaje = "Sesión no válida" };

            PedidoL oPedidoL = new PedidoL();
            List<Pedido> pedidos = oPedidoL.MtListarPedidosCliente(cliente.Id);

            List<object> resultado = new List<object>();
            foreach (Pedido p in pedidos)
            {
                if (p.Estado != "Entregado") continue;

                resultado.Add(new
                {
                    id = p.Id,
                    codigoPedido = p.CodigoPedido,
                    fecha = p.Fecha.ToString("dd MMM yyyy"),
                    estado = p.Estado,
                    total = p.Total.ToString("N2"),
                    direccion = p.DireccionEntrega
                });
            }

            return new { success = true, data = resultado };
        }

        [WebMethod]
        public static object MtCargarDetallePedido(int idPedido)
        {
            Modelo.Cliente cliente = (Modelo.Cliente)HttpContext.Current.Session["Cliente"];
            if (cliente == null)
                return new { success = false, mensaje = "Sesión no válida" };

            PedidoL oPedidoL = new PedidoL();
            List<DetallePedido> detalles = oPedidoL.MtObtenerDetallePedido(idPedido);

            List<object> resultado = new List<object>();
            foreach (DetallePedido d in detalles)
            {
                resultado.Add(new
                {
                    id = d.Id,
                    cantidad = d.Cantidad,
                    precioUnitario = d.PrecioUnitario.ToString("N2"),
                    subtotal = (d.Cantidad * d.PrecioUnitario).ToString("N2"),
                    producto = d.IdProducto.Nombre,
                    imagen = d.IdProducto.Imagen
                });
            }

            return new { success = true, data = resultado };
        }
    }
}
