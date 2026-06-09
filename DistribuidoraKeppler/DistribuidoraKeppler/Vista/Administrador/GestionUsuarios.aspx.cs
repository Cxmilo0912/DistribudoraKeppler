using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Aministrador
{
    public partial class GestionUsuarios : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static object MtListarTrabajadores()
        {
            GestionUsuarioL oGestionUsuarioL = new GestionUsuarioL();
            List<Modelo.Usuario> lista = oGestionUsuarioL.MtListarTrabajadores();
            
            return new {data = lista };
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void lbtnEditar_Click(object sender, EventArgs e)
        {

        }
    }
}