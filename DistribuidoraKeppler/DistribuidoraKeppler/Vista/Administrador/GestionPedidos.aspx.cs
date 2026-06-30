using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Administrador
{
    public partial class Pedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        // ── Listar todos los pedidos ───────────────────────────────────
        [WebMethod]
        public static object MtListarPedidos()
        {
            PedidoL oPedidoL = new PedidoL();
            List<Pedido> lista = oPedidoL.MtListarPedido();

            // Convertimos a una lista anónima para que JSON.stringify la serialice bien
            List<object> resultado = new List<object>();
            foreach (Pedido p in lista)
            {
                resultado.Add(new
                {
                    id = p.Id,
                    codigoPedido = p.CodigoPedido,
                    fecha = p.Fecha.ToString("dd MMM yyyy"),
                    estado = p.Estado,
                    total = p.Total.ToString("N2"),
                    cliente = p.IdCliente.NombreEmpresa,
                    emailCliente = p.IdCliente.Email
                });
            }

            return new { data = resultado };
        }

        // ── Cambiar estado de un pedido ────────────────────────────────
        [WebMethod]
        public static object MtCambiarEstado(int idPedido, string nuevoEstado)
        {
            PedidoL oPedidoL = new PedidoL();
            string error = oPedidoL.MtCambiarEstado(idPedido, nuevoEstado);

            if (error == null)
                return new { ok = true, mensaje = "Estado actualizado correctamente." };
            else
                return new { ok = false, mensaje = error };
        }
    }
}