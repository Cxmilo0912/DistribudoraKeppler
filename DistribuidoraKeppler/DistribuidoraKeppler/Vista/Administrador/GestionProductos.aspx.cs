using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
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
                MtCargarCards();
            }
        }

        [WebMethod]
        public static object CargarProductos()
        {

            ProductoL logica = new ProductoL();

            List<Producto> listaProductos = logica.ListarProductos();

            return new { data = listaProductos };
        }


        protected void btnEditar_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        //Camilo

        public void MtCargarCards()
        {
            DashboardAdministradorL oAdminL = new DashboardAdministradorL();
            lblTotalProductos.Text = oAdminL.MtProductosTotales().ToString();

            CategoriaL oCategoriaL = new CategoriaL();
            lblCat.Text = oCategoriaL.MtContarCategorias().ToString();
            ProductoL oProductoL = new ProductoL();
            List<Categoria> lista = oProductoL.MtObtenerCategoriasConTodos();

            MarcaL oMarcaL = new MarcaL();
            List<Marca> listaM = oMarcaL.MtListarMarcas();
            ddlCategoria.DataSource = lista.ToList();
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataValueField = "Id";
            ddlCategoria.DataBind();

            ddlMarca.DataSource = listaM.ToList();
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();


        }

        [WebMethod]
        public static bool MtEditarProducto(Producto oProducto)
        {
            Producto nuevoProducto = new Producto
            {
                Id = oProducto.Id,
                Nombre = oProducto.Nombre,
                Descripcion = oProducto.Descripcion,
                Estado = oProducto.Estado,
                Precio = oProducto.Precio,
                Stock = oProducto.Stock,
                LimiteMinimo = oProducto.LimiteMinimo,
                LimiteVenta = oProducto.LimiteVenta,
                IdCategoria = oProducto.IdCategoria,
                IdMarca = oProducto.IdMarca,
                Imagen = oProducto.Imagen

            };


            ProductoL oProductoL = new ProductoL();
            bool resultado = oProductoL.MtEditarProducto(nuevoProducto);
            return resultado;
        }


        protected void btnCrearProducto_Click1(object sender, EventArgs e)
        {
            Response.Redirect("CrearProducto.aspx");
        }
    }
}