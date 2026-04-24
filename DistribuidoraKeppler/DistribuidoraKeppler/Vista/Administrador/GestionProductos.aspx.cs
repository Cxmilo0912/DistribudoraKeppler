using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Aministrador
{
    public partial class GestionPeoductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCrearProducto_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreacionProducto.aspx");
        }
    }
}