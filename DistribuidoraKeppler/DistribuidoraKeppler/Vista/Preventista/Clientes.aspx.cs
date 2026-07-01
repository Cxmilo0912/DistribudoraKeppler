using DistribuidoraKeppler.Logica.PreventistaLogica;
using DistribuidoraKeppler.Modelo;
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
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SesionHelper.MtEstaAutenticado())
            {
                Response.Redirect("~/Vista/Auth/Login.aspx");
            }
        }

        [WebMethod]
        public static object MtListarClientes()
        {
            int idUsuario = ObtenerIdUsuarioEnSesion();
            if (idUsuario == 0) return new { ok = false, clientes = new object[0] };

            PreventistaL oL = new PreventistaL();
            var clientes = oL.MtListarClientesAsociados(idUsuario).Select(c => new
            {
                id = c.Id,
                nombreEmpresa = c.NombreEmpresa,
                nit = c.Nit,
                telefono = c.Telefono,
                direccion = c.Direccion,
                email = c.Email,
                barrio = c.Barrio != null ? c.Barrio.Nombre : ""
            }).ToList();

            return new { ok = true, clientes = clientes };
        }

        [WebMethod]
        public static object MtListarBarrios()
        {
            PreventistaL oL = new PreventistaL();
            var barrios = oL.MtListarBarrios().Select(b => new { id = b.Id, nombre = b.Nombre }).ToList();
            return new { ok = true, barrios = barrios };
        }

        [WebMethod]
        public static object MtAgregarCliente(string nombreEmpresa, string nit, string telefono,
            string direccion, string email,string contrasena, int idBarrio)
        {
            int idUsuario = ObtenerIdUsuarioEnSesion();
            if (idUsuario == 0) return new { ok = false, mensaje = "Sesión expirada. Inicia sesión nuevamente." };

            Modelo.Cliente oCliente = new Modelo.Cliente
            {
                NombreEmpresa = nombreEmpresa,
                Nit = nit,
                Telefono = telefono,
                Direccion = direccion,
                Email = email,                
                Barrio = idBarrio > 0 ? new Barrio { Id = idBarrio } : null
            };

            PreventistaL oL = new PreventistaL();
            string error = oL.MtAgregarCliente(oCliente, idUsuario, contrasena);

            if (!string.IsNullOrEmpty(error))
                return new { ok = false, mensaje = error };

            return new { ok = true };
        }

        private static int ObtenerIdUsuarioEnSesion()
        {
            var usuario = System.Web.HttpContext.Current.Session["Usuario"] as Modelo.Usuario;
            return usuario != null ? usuario.Id : 0;
        }
    }
}