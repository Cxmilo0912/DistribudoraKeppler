using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Web.UI;

namespace DistribuidoraKeppler.Vista.Bodega
{
    public partial class AsignarPedidos : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null || SesionHelper.Rol != "Bodega")
                Response.Redirect("~/Vista/Auth/Login.aspx");
        }

        [WebMethod]
        public static object MtListarSectores()
        {
            BodegaL oBodegaL = new BodegaL();
            List<Sector> sectores = oBodegaL.MtListarSectores();

            List<object> resultado = new List<object>();
            foreach (Sector s in sectores)
            {
                resultado.Add(new { id = s.Id, nombre = s.Nombre });
            }

            return new { success = true, data = resultado };
        }

        [WebMethod]
        public static object MtListarPedidosPendientes(int idSector)
        {
            if (HttpContext.Current.Session["Usuario"] == null)
                return new { success = false, mensaje = "Sesión no válida" };

            BodegaL oBodegaL = new BodegaL();
            List<Pedido> pedidos = oBodegaL.MtListarPedidosPendientes(idSector);

            List<object> resultado = new List<object>();
            foreach (Pedido p in pedidos)
            {
                resultado.Add(new
                {
                    id = p.Id,
                    codigoPedido = p.CodigoPedido,
                    fecha = p.Fecha.ToString("dd MMM yyyy"),
                    cliente = p.IdCliente.NombreEmpresa,
                    direccion = p.DireccionEntrega,
                    sector = p.Sector != null ? p.Sector.Nombre : "Sin sector",
                    idSector = p.Sector != null ? p.Sector.Id : 0,
                    estado = p.Estado
                });
            }

            return new { success = true, data = resultado };
        }

        [WebMethod]
        public static object MtListarRepartidoresPorSector(int idSector)
        {
            if (HttpContext.Current.Session["Usuario"] == null)
                return new { success = false, mensaje = "Sesión no válida" };

            // Se muestran todos los repartidores activos (Distribuidor/Bodega), sin
            // importar el sector del pedido, para que Bodega pueda elegir entre
            // cualquiera que esté trabajando actualmente y no solo entre los pocos
            // que tengan ese sector puntual mapeado en AsignarSector.
            BodegaL oBodegaL = new BodegaL();
            List<Modelo.Usuario> repartidores = oBodegaL.MtListarRepartidoresActivos();

            List<object> resultado = new List<object>();
            foreach (Modelo.Usuario u in repartidores)
            {
                resultado.Add(new { id = u.Id, nombre = u.Nombre, email = u.Email });
            }

            return new { success = true, data = resultado };
        }

        [WebMethod]
        public static object MtAsignarPedido(int idPedido, int idRepartidor)
        {
            if (HttpContext.Current.Session["Usuario"] == null)
                return new { success = false, mensaje = "Sesión no válida" };

            BodegaL oBodegaL = new BodegaL();
            string error = oBodegaL.MtAsignarPedido(idPedido, idRepartidor);

            if (error != null)
                return new { success = false, mensaje = error };

            return new { success = true, mensaje = "Pedido asignado correctamente" };
        }

        [WebMethod]
        public static object MtListarRepartidoresConSectores()
        {
            if (HttpContext.Current.Session["Usuario"] == null)
                return new { success = false, mensaje = "Sesión no válida" };

            BodegaL oBodegaL = new BodegaL();
            List<Modelo.Usuario> repartidores = oBodegaL.MtListarRepartidoresConSectores();

            List<object> resultado = new List<object>();
            foreach (Modelo.Usuario u in repartidores)
            {
                List<object> sectores = new List<object>();
                foreach (Sector s in u.Sectores)
                {
                    sectores.Add(new { id = s.Id, nombre = s.Nombre });
                }

                resultado.Add(new
                {
                    id = u.Id,
                    nombre = u.Nombre,
                    email = u.Email,
                    sectores = sectores
                });
            }

            return new { success = true, data = resultado };
        }

        [WebMethod]
        public static object MtAgregarSectorRepartidor(int idUsuario, int idSector)
        {
            if (HttpContext.Current.Session["Usuario"] == null)
                return new { success = false, mensaje = "Sesión no válida" };

            BodegaL oBodegaL = new BodegaL();
            string error = oBodegaL.MtAgregarSectorRepartidor(idUsuario, idSector);

            if (error != null)
                return new { success = false, mensaje = error };

            return new { success = true };
        }

        [WebMethod]
        public static object MtQuitarSectorRepartidor(int idUsuario, int idSector)
        {
            if (HttpContext.Current.Session["Usuario"] == null)
                return new { success = false, mensaje = "Sesión no válida" };

            BodegaL oBodegaL = new BodegaL();
            string error = oBodegaL.MtQuitarSectorRepartidor(idUsuario, idSector);

            if (error != null)
                return new { success = false, mensaje = error };

            return new { success = true };
        }
    }
}
