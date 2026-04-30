using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Utilidades;

namespace DistribuidoraKeppler.Vista.Aministrador
{
    public partial class DashboardAdministrador : System.Web.UI.Page
    {
        DashboardAdministradorL oAdminL = new DashboardAdministradorL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //ejecuta el metodo
            {
                if (SesionHelper.Rol != "Administrador")
                {
                    Response.Redirect("~/Vista/Auth/Login.aspx");
                }
                CargarInfoCards();

            }
        }
        public void CargarInfoCards()
        {
            int total = oAdminL.MtTotalClientes();
            lblTotalClientes.Text = total.ToString();
            int totalProductos = oAdminL.MtProductosActivos();
            lblProductosActivos.Text = totalProductos.ToString();

        }

        

       
    }
}