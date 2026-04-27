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
            string rol = Session["rol"] as string;

            menuAdmin.Visible = false;
            menuCliente.Visible = false;
            menuRepartidor.Visible = false;
            menuPreventista.Visible = false;
            menuBodega.Visible = false;

            if (string.IsNullOrEmpty(rol))
                return;

            switch (rol)
            {
                case "Admin":
                    menuAdmin.Visible = true;
                    break;

                case "Cliente":
                    menuCliente.Visible = true;
                    break;

                case "Repartidor":
                    menuRepartidor.Visible = true;
                    break;

                case "Preventista":
                    menuPreventista.Visible = true;
                    break;

                case "Bodega":
                    menuBodega.Visible = true;
                    break;
            
            }
        }

    }
    
}