using DistribuidoraKeppler.Logica.PreventistaLogica;
using DistribuidoraKeppler.Utilidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Preventista
{
    public partial class Pedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SesionHelper.MtEstaAutenticado())
            {
                Response.Redirect("~/Vista/Auth/Login.aspx");
            }
        }

        [WebMethod]
        public static object MtListarPedidos()
        {
            int idUsuario = ObtenerIdUsuarioEnSesion();
            if (idUsuario == 0) return new { ok = false, pedidos = new object[0] };

            PreventistaL oL = new PreventistaL();
            var pedidos = oL.MtListarPedidosPreventista(idUsuario).Select(p => new
            {
                codigo = p.CodigoPedido,
                fecha = p.Fecha.ToString("dd/MM/yyyy"),
                estado = p.Estado,
                total = p.Total.ToString("N2"),
                cliente = p.Cliente.NombreEmpresa,
                detalles = p.Detalles.Select(d => new
                {
                    producto = d.IdProducto.Nombre,
                    cantidad = d.Cantidad,
                    subtotal = (d.Cantidad * d.PrecioUnitario).ToString("N2")
                }).ToList()
            }).ToList();

            return new { ok = true, pedidos = pedidos };
        }

        private static int ObtenerIdUsuarioEnSesion()
        {
            var usuario = System.Web.HttpContext.Current.Session["Usuario"] as Modelo.Usuario;
            return usuario != null ? usuario.Id : 0;
        }
    }
}