using DistribuidoraKeppler.Logica;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Aministrador
{
    public partial class GestionPeoductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProductos();
            }
        }
        private void CargarProductos()
        {
            try
            {
                ProductoL logica = new ProductoL();

                // Suponiendo que tu método devuelve una List<ProductosM>
                var listaProductos = logica.ListarProductos();

                if (listaProductos != null && listaProductos.Count > 0)
                {
                    rpProductos.DataSource = listaProductos;
                    rpProductos.DataBind();

                    // Actualizar el contador del footer
                    lblTotalProductos.Text = listaProductos.Count.ToString();
                }
            }
            catch (Exception ex)
            {
                // ScriptManager para mostrar error si algo falla
            }
        }

        protected void btnCrearProducto_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreacionProducto.aspx");
        }
    }
}