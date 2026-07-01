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
            ProductoL oProductoL = new ProductoL();
            List<Producto> lista = oProductoL.ListarProductos();

            rptInventario.DataSource = lista;
            rptInventario.DataBind();
            List<Categoria> listaCat = oProductoL.MtObtenerCategoriasConTodos();

            MarcaL oMarcaL = new MarcaL();
            List<Marca> listaM = oMarcaL.MtListarMarcas();
            ddlCat.DataSource = listaCat.ToList();
            ddlCat.DataTextField = "Nombre";
            ddlCat.DataValueField = "Id";
            ddlCat.DataBind();
            ddlCat.Items.Insert(0, new ListItem("--- Seleccione una Categoria ---", "0"));


            ddlMarca.DataSource = listaM.ToList();
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();
            ddlMarca.Items.Insert(0, new ListItem("--- Seleccione una Marca ---", "0"));

        }
    }
}