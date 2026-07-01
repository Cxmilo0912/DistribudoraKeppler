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
    public partial class CrearPedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SesionHelper.MtEstaAutenticado())
            {
                Response.Redirect("~/Vista/Auth/Login.aspx");
            }
        }

        [WebMethod]
        public static object MtListarBarrios()
        {
            PreventistaL oL = new PreventistaL();
            var barrios = oL.MtListarBarrios().Select(b => new { id = b.Id, nombre = b.Nombre }).ToList();
            return new { ok = true, barrios = barrios };
        }

        [WebMethod]
        public static object MtListarProductos()
        {
            PreventistaL oL = new PreventistaL();
            var productos = oL.MtListarProductosActivos()
                .Select(p => new { id = p.Id, nombre = p.Nombre, precio = p.Precio, stock = p.Stock })
                .ToList();

            return new { ok = true, productos = productos };
        }

        [WebMethod]
        public static object MtBuscarCliente(string telefono)
        {
            PreventistaL oL = new PreventistaL();
            var cliente = oL.MtBuscarClientePorTelefono(telefono);

            if (cliente == null)
                return new { ok = true, encontrado = false };

            return new
            {
                ok = true,
                encontrado = true,
                id = cliente.Id,
                nombreEmpresa = cliente.NombreEmpresa,
                direccion = cliente.Direccion
            };
        }

        [WebMethod]
        public static object MtGuardarPedido(int idClienteExistente, string nombreCliente, string telefono,
            string direccion, int idBarrio, List<int> idsProducto, List<int> cantidades, List<decimal> precios)
        {
            int idUsuario = ObtenerIdUsuarioEnSesion();
            if (idUsuario == 0) return new { ok = false, mensaje = "Sesión expirada. Inicia sesión nuevamente." };

            Modelo.Cliente oCliente = new Modelo.Cliente
            {
                Id = idClienteExistente,
                NombreEmpresa = nombreCliente,
                Telefono = telefono,
                Direccion = direccion,
                Barrio = idBarrio > 0 ? new Barrio { Id = idBarrio } : null
            };

            List<DetallePedido> oDetalles = new List<DetallePedido>();
            if (idsProducto != null)
            {
                for (int i = 0; i < idsProducto.Count; i++)
                {
                    oDetalles.Add(new DetallePedido
                    {
                        Cantidad = cantidades[i],
                        PrecioUnitario = precios[i],
                        IdProducto = new Producto { Id = idsProducto[i] }
                    });
                }
            }

            PreventistaL oL = new PreventistaL();
            string error = oL.MtCrearPedido(oCliente, oDetalles, direccion, idUsuario);

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