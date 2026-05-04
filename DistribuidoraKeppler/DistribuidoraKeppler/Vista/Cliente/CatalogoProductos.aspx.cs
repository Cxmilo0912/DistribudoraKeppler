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
        private const int PageSize = 8;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["CategoriaActiva"] = "Todos los productos";
                Session["PaginaActual"] = 1;
                //CargarCategorias();
                //CargarProductos();
            }
        }
        //private void CargarCategorias()
        //{
        //    var cats = CategoriaProductoNegocio.ObtenerTodas();
        //    // Agrega "Todos" al inicio
        //    cats.Insert(0, new CategoriaProducto { Nombre = "Todos los productos" });
        //    rptCategorias.DataSource = cats;
        //    rptCategorias.DataBind();
        //}

        //private void CargarProductos()
        //{
        //    string busqueda = txtBuscar.Text.Trim();
        //    string categoria = Session["CategoriaActiva"]?.ToString();
        //    int pagina = Convert.ToInt32(Session["PaginaActual"]);

        //    var todos = ProductoNegocio.ObtenerFiltrados(busqueda, categoria);

        //    // Paginación simple
        //    var pagina_actual = todos.Take(pagina * PageSize).ToList();

        //    rptProductos.DataSource = pagina_actual;
        //    rptProductos.DataBind();

        //    pnlEmpty.Visible = pagina_actual.Count == 0;
        //    pnlVerMas.Visible = todos.Count > pagina * PageSize;
        //}

        //protected void btnVerMas_Click(object sender, EventArgs e)
        //{
        //    Session["PaginaActual"] = Convert.ToInt32(Session["PaginaActual"]) + 1;
        //    CargarProductos();
        //}

        //protected void btnBuscar_Click(object sender, EventArgs e)
        //{
        //    Session["PaginaActual"] = 1;
        //    CargarProductos();
        //}
        //protected void FiltrarCategoria_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        //{
        //    Session["CategoriaActiva"] = e.CommandArgument.ToString();
        //    Session["PaginaActual"] = 1;
        //    txtBuscar.Text = string.Empty;
        //    CargarCategorias(); // re-bind para actualizar clase "activo"
        //    CargarProductos();
        //}

        protected void AgregarCarrito_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            int idProducto = Convert.ToInt32(e.CommandArgument);
            // TODO: lógica de carrito
        }
    }
}