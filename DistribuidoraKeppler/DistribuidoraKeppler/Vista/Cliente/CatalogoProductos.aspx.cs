using DistribuidoraKeppler.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Cliente
{
    public partial class CatalogoProductos : System.Web.UI.Page
    {
        private const int TamPagina = 8; // Cantidad de productos por página
        ProductoL oLogica = new ProductoL();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Session["CategoriaActiva"] = 0;
                Session["PaginaActual"] = 1;
                MtCargarCategorias();
                MtCargarProductos();
            }
        }
        private void MtCargarCategorias()
        {
            rptCategorias.DataSource = oLogica.MtObtenerCategoriasConTodos();
            rptCategorias.DataBind();
        }

        private void MtCargarProductos()
        {
            string busqueda = txtBuscar.Text.Trim(); // Obtener texto de búsqueda
            int idCategoria = Convert.ToInt32(Session["CategoriaActiva"] ?? 0); // 0 para "Todos los productos"
            int pagina = Convert.ToInt32(Session["PaginaActual"] ?? 1);

            var oProdutos = oLogica.MtObtenerCatalogoPaginado(busqueda, idCategoria, pagina, TamPagina, out bool hayMas);

            rptProductos.DataSource = oProdutos; // Asignar productos al Repeater
            rptProductos.DataBind(); // Re-bind para mostrar los productos filtrados

            pnlEmpty.Visible = oProdutos.Count == 0; // Mostrar mensaje si no hay productos
            btnVerMas.Visible = hayMas; // Mostrar botón "Ver más" solo si hay más productos para cargar
        }

        protected void btnVerMas_Click(object sender, EventArgs e)
        {
            Session["PaginaActual"] = Convert.ToInt32(Session["PaginaActual"]) + 1;
            MtCargarProductos();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Session["PaginaActual"] = 1;
            MtCargarProductos();
        }
        protected void FiltrarCategoria_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            Session["CategoriaActiva"] = Convert.ToInt32(e.CommandArgument);
            Session["PaginaActual"] = 1;
            txtBuscar.Text = string.Empty;
            MtCargarCategorias(); // re-bind para actualizar clase "activo"
            MtCargarProductos();
        }

        protected void AgregarCarrito_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            
        }
    }
}