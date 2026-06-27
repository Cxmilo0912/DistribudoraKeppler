using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Administrador
{
    public partial class Inventario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MtCargarInventario();
            }
        }

        private void MtCargarInventario()
        {
            ProductoL  oProductoL = new ProductoL();
            List<Producto> lista = oProductoL.ListarProductos();

            rptInventario.DataSource = lista;
            rptInventario.DataBind();
        }
    }
}