using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Logica;

namespace DistribuidoraKeppler.Vista.Aministrador
{
    public partial class DashboardAdministrador : System.Web.UI.Page
    {
        DashboardAdministradorL oAdminL = new DashboardAdministradorL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //ejecuta el metodo
            {
                CargarInfoCards();

            }
        }
<<<<<<< HEAD
        public void CargarTotalClientes() 
        {
            int total = clienteD.ObtenerTotalClientes(); // Llama a la base de datos
            lblTotalClientes.Text = total.ToString();    //Muestra el numero de clientes 
=======
        public void CargarInfoCards()
        {
            int total = oAdminL.MtTotalClientes();
            lblTotalClientes.Text = total.ToString();
            int totalProductos = oAdminL.MtProductosActivos();
            lblProductosActivos.Text = totalProductos.ToString();
>>>>>>> 89bae78a586bbd7f6702809bcfbbc1ebc218e6f7
        }

        

       
    }
}