using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
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

        // El sitio tiene enableViewState="false" (Web.config), así que ddlMarca pierde sus
        // Items en cada postback si solo se llena en !IsPostBack. Se recarga en Page_Init
        // (antes de LoadPostBackData) para que el valor posteado por el navegador se pueda
        // volver a seleccionar correctamente.
        protected void Page_Init(object sender, EventArgs e)
        {
            MtCargarMarcas();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            MtCargarCategorias(); // Sin ViewState, hay que re-bindear en cada request para que no desaparezcan los botones de categoría

            if (!IsPostBack)
            {
                Session["CategoriaActiva"] = 0;
                Session["PaginaActual"] = 1;
                MtCargarProductos();
            }
        }
        private void MtCargarCategorias()
        {
            var categorias = oLogica.MtObtenerCategoriasConTodos();
            categorias.Insert(0, new Categoria { Id = 0, Nombre = "Todos" }); // Botón para quitar el filtro de categoría (no existe en la tabla real)
            rptCategorias.DataSource = categorias;
            rptCategorias.DataBind();
        }

        private void MtCargarMarcas()
        {
            ddlMarca.DataSource = oLogica.MtObtenerMarcas();
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();
            ddlMarca.Items.Insert(0, new ListItem("Todas las marcas", "0"));
        }

        private void MtCargarProductos()
        {
            string busqueda = txtBuscar.Text.Trim(); // Obtener texto de búsqueda
            int idCategoria = Convert.ToInt32(Session["CategoriaActiva"] ?? 0); // 0 para "Todos los productos"
            int idMarca = Convert.ToInt32(ddlMarca.SelectedValue); // 0 para "Todas las marcas"
            int pagina = Convert.ToInt32(Session["PaginaActual"] ?? 1);

            decimal? precioMin = decimal.TryParse(txtPrecioMin.Text, out var min) ? min : (decimal?)null;
            decimal? precioMax = decimal.TryParse(txtPrecioMax.Text, out var max) ? max : (decimal?)null;

            if (precioMin.HasValue && precioMax.HasValue && precioMin > precioMax)
            {
                var temp = precioMin;
                precioMin = precioMax;
                precioMax = temp;
            }

            string orden = ddlOrden.SelectedValue;

            var oProdutos = oLogica.MtObtenerCatalogoPaginado(busqueda, idCategoria, idMarca, precioMin, precioMax, orden, pagina, TamPagina, out bool hayMas);

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

        protected void ddlOrden_SelectedIndexChanged(object sender, EventArgs e)
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
    }
}