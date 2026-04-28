using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DistribuidoraKeppler.Datos;

namespace DistribuidoraKeppler.Vista.Aministrador
{
    public partial class DashboardAdministrador : System.Web.UI.Page
    {
        ClienteD clienteD = new ClienteD();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //ejecuta el metodo
            {
                CargarTotalClientes();
                
            }
        }
        public void CargarTotalClientes() 
        {
            int total = clienteD.ObtenerTotalClientes(); // Llama a la base de datos
            lblTotalClientes.Text = total.ToString();    //Muestra el numero de clientes 
        }

       
    }
}