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
    public partial class Preventista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verificar sesión activa
            if (!SesionHelper.MtEstaAutenticado())
            {
                Response.Redirect("~/Vista/Auth/Login.aspx");
                return;
            }
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            SesionHelper.MtCerrarSesion();
            Response.Redirect("~/Vista/Auth/Login.aspx");
        }

        [WebMethod]
        public static object MtVentasTotalesHoy()
        {
            int idUsuario = ObtenerIdUsuarioEnSesion();
            if (idUsuario == 0) return new { ok = false, total = "0.00" };

            PreventistaL oL = new PreventistaL();
            decimal total = oL.MtVentasTotalesPorDia(idUsuario);

            return new { ok = true, total = total.ToString("N2") };
        }

        [WebMethod]
        public static object MtPedidosHoy()
        {
            int idUsuario = ObtenerIdUsuarioEnSesion();
            if (idUsuario == 0) return new { ok = false, cantidad = 0 };

            PreventistaL oL = new PreventistaL();
            int cantidad = oL.MtTotalPedidosHoy(idUsuario);

            return new { ok = true, cantidad = cantidad };
        }

        [WebMethod]
        public static object MtClientesAtendidosHoy()
        {
            int idUsuario = ObtenerIdUsuarioEnSesion();
            if (idUsuario == 0) return new { ok = false, cantidad = 0 };

            PreventistaL oL = new PreventistaL();
            int cantidad = oL.MtClientesAtendidosHoy(idUsuario);

            return new { ok = true, cantidad = cantidad };
        }

        [WebMethod]
        public static object MtSectorDelDia()
        {
            int idUsuario = ObtenerIdUsuarioEnSesion();
            if (idUsuario == 0) return new { ok = false };

            PreventistaL oL = new PreventistaL();
            var sector = oL.MtSectorDelDia(idUsuario);

            if (sector == null)
                return new { ok = true, tieneSector = false };

            return new
            {
                ok = true,
                tieneSector = true,
                nombre = sector.Nombre,
                diasVisita = sector.DiasVisita,
                barrios = sector.Barrios?.Select(b => b.Nombre).ToList() ?? new List<string>()
            };
        }

        [WebMethod]
        public static object MtActividadHoy()
        {
            int idUsuario = ObtenerIdUsuarioEnSesion();
            if (idUsuario == 0) return new { ok = false, actividad = new object[0] };

            PreventistaL oL = new PreventistaL();
            var pedidos = oL.MtActividadHoy(idUsuario);

            var actividad = pedidos.Select(p => new
            {
                codigo = p.CodigoPedido,
                cliente = p.IdCliente.NombreEmpresa,
                direccion = p.IdCliente.Direccion,
                total = p.Total.ToString("N2"),
                estado = p.Estado
            }).ToList();

            return new { ok = true, actividad = actividad };
        }

        
        private static int ObtenerIdUsuarioEnSesion()
        {
            var usuario = HttpContext.Current.Session["Usuario"]
                          as Modelo.Usuario;

            return usuario != null ? usuario.Id : 0;
        }
    }
}
