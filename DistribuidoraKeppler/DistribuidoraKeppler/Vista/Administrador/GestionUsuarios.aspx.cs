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
            MtCargas();
        }

        public void MtCargas()
        {
            GestionUsuarioL oGestionUsuarioL = new GestionUsuarioL();
            lblTotalUsuarios.Text = oGestionUsuarioL.MtTotalUsuariosDelSistema().ToString();
            lblAdmins.Text = oGestionUsuarioL.MtTotalAdministradores().ToString();
            lblBodega.Text = oGestionUsuarioL.MtTotalPersonalBodega().ToString();
            lblPrev.Text = oGestionUsuarioL.MtTotalPreventistas().ToString();
            lblDistribuidores.Text = oGestionUsuarioL.MtTotalDistribuidores().ToString();
            lblInactivo.Text = oGestionUsuarioL.MtUsuariosInactivos().ToString();
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