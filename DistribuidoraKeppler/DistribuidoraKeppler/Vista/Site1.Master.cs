using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Rol"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            string rol = Session["Rol"].ToString();

            menuAdmin.Visible = (rol == "Admin");
            menuBodega.Visible = (rol == "Bodega");
            menuCliente.Visible = (rol == "Cliente");
            menuPreventista.Visible = (rol == "Preventista");
            menuRepartidor.Visible = (rol == "Repartidor");
        }
    }
}