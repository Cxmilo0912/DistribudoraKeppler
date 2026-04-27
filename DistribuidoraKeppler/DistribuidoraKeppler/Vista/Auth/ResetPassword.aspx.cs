using DistribuidoraKeppler.Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Auth
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string token = Request.QueryString["token"];

                if (string.IsNullOrEmpty(token))
                {
                    Response.Write("Token inválido");
                    return;
                }

                UsuarioD datos = new UsuarioD();
                string email = datos.ObtenerEmailPorToken(token);

                if (email == null)
                {
                    Response.Write("Token inválido o no existe");
                }
            }
        }
        protected void btnCambiar_Click(object sender, EventArgs e)
        {
            string token = Request.QueryString["token"];

            UsuarioD datos = new UsuarioD();
            string email = datos.ObtenerEmailPorToken(token);

            if (email != null)
            {
                if (txtNueva.Text == txtConfirmar.Text)
                {
                    datos.ActualizarPassword(email, txtNueva.Text);

                    Response.Write("Contraseña actualizada correctamente");
                }
                else
                {
                    Response.Write("Las contraseñas no coinciden");
                }
            }
            else
            {
                Response.Write("Token inválido");
            }
        }
    }
}