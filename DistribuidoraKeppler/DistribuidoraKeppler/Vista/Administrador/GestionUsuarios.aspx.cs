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
            UsuarioL oCrear = new UsuarioL();
            List<Rol> roles = oCrear.MtListarRoles();
            ddlRol.DataSource = roles.ToList();
            ddlRol.DataTextField = "Nombre";
            ddlRol.DataValueField = "Id";
            ddlRol.DataBind();
        }
        [WebMethod]
        public static object MtListarTrabajadores()
        {
            GestionUsuarioL oGestionUsuarioL = new GestionUsuarioL();
            List<Modelo.Usuario> lista = oGestionUsuarioL.MtListarTrabajadores();

            return new { data = lista };
        }

        [WebMethod]
        public static bool MtEditarUsuario(Modelo.Usuario oUsuario)
        {
            Modelo.Usuario oNuevoUsuario = new Modelo.Usuario
            {
                Id = oUsuario.Id,
                Nombre = oUsuario.Nombre,
                Email = oUsuario.Email,
                Documento = oUsuario.Documento,
                Estado = oUsuario.Estado
            };

            UsuarioL oUsuarioL = new UsuarioL();

            bool resultado = oUsuarioL.MtEditarUsuario(oNuevoUsuario, oUsuario.Rol.Id);

            return resultado;
        }

        [WebMethod]

        public static bool MtEliminarUsuario(int id)
        {
            UsuarioL oUsuarioL = new UsuarioL();
            return oUsuarioL.MtEliminarUsuario(id);
        }

    }
}