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
    public partial class GestionCategorias : System.Web.UI.Page
    {
        protected List<Categoria> lista = new List<Categoria>();
        protected void Page_Load(object sender, EventArgs e)
        {
            CategoriaL oCategoriaL = new CategoriaL();
            lista = oCategoriaL.MtObtenerCategorias();

            var count = lista.Count;
        }
        

        protected void lbtnEditar_Click(object sender, EventArgs e)
        {

        }
    }
}