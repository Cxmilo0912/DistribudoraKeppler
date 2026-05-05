using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MtCargarProductos();
                MtCargarCategorias();
            }
        }

        public void MtCargarProductos()
        {
            ProductoL productoL = new ProductoL();
            List<Producto> productos = productoL.ListarProductos();
            // Aquí puedes enlazar la lista de productos a un control de tu página, como un GridView o Repeater.
            // Por ejemplo, si tienes un GridView llamado gvProductos:
            rptProductos.DataSource = productos;
            rptProductos.DataBind();

            lblTotal.Text = productos.Count.ToString();
        }

        public void MtCargarCategorias()
        {
            CategoriaL categoriaL = new CategoriaL();
            List<Categoria> categorias = categoriaL.MtObtenerCategorias();

            rptCategorias.DataSource = categorias;
            rptCategorias.DataBind();
        }
    }
}