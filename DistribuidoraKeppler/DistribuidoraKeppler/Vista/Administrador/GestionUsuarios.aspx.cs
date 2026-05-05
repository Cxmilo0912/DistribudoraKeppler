using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Aministrador
{
    public partial class GestionUsuarios : System.Web.UI.Page
    {
        protected List<Modelo.Usuario> lista = new List<Modelo.Usuario>();
        protected void Page_Load(object sender, EventArgs e)
        {
            GestionUsuarioL oGestionUsuarioL = new GestionUsuarioL();
            lista = oGestionUsuarioL.MtListarTrabajadores();

            var count = lista.Count; // ¿Es 0 o tiene datos?

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void lbtnEditar_Click(object sender, EventArgs e)
        {

        }
    }
}