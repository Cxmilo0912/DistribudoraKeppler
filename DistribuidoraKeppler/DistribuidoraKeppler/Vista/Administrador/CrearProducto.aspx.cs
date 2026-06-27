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
    public partial class CrearProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoL oProductoL = new ProductoL();
            List<Categoria> lista = oProductoL.MtObtenerCategoriasConTodos();

            MarcaL oMarcaL = new MarcaL();
            List<Marca> listaM = oMarcaL.MtListarMarcas();
            ddlCategoria.DataSource = lista.ToList();
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataValueField = "Id";
            ddlCategoria.DataBind();
            ddlCategoria.Items.Insert(0, new ListItem("--- Seleccione una Categoria ---", "0"));


            ddlMarca.DataSource = listaM.ToList();
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();
            ddlMarca.Items.Insert(0, new ListItem("--- Seleccione una Marca ---", "0"));

        }
    }
}