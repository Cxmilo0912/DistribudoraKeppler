using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace DistribuidoraKeppler.Vista.Bodega
{
    public partial class HistorialEntregas : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null || SesionHelper.Rol != "Bodega")
            {
                Response.Redirect("~/Vista/Auth/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                MtCargarHistorial();
            }
        }

        private void MtCargarHistorial()
        {
            BodegaL oBodegaL = new BodegaL();
            List<Pedido> entregas = oBodegaL.MtListarHistorialEntregas();

            List<object> datos = new List<object>();
            foreach (Pedido p in entregas)
            {
                datos.Add(new
                {
                    NumeroPedido = string.IsNullOrEmpty(p.CodigoPedido) ? p.Id.ToString() : p.CodigoPedido,
                    Cliente = p.IdCliente.NombreEmpresa,
                    Repartidor = p.Repartidor.Nombre,
                    FechaEntrega = p.FechaEntrega.Value.ToString("dd/MM/yyyy"),
                    HoraEntrega = p.FechaEntrega.Value.ToString("HH:mm")
                });
            }

            bool sinRegistros = datos.Count == 0;

            gvHistorialEntregas.Visible = !sinRegistros;
            pnlSinRegistros.Visible = sinRegistros;

            if (!sinRegistros)
            {
                gvHistorialEntregas.DataSource = datos;
                gvHistorialEntregas.DataBind();
            }
        }
    }
}
