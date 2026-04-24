using DistribuidoraKeppler.Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Administrador
{
    public partial class GestionMarcas1 : System.Web.UI.Page
    {
        MarcaD marcaD = new MarcaD();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarMarcas();
            }


        }
        public void CargarMarcas()
        {
            rpMarcas.DataSource = marcaD.ListarMarcas();
            rpMarcas.DataBind();
        }
    }
}