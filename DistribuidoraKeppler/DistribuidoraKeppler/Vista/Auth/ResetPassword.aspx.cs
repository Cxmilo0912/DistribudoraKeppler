using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Logica;
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
                lblError.Visible = false;

                string token = Request.QueryString["token"];

                if (string.IsNullOrEmpty(token))
                {
                    MostrarError("Token no proporcionado.");
                    BloquearFormulario();
                    return;
                }

                UsuarioD datos = new UsuarioD();
                string email = datos.ObtenerEmailPorToken(token);

                if (email == null)
                {
                    MostrarError("El enlace es inválido o expirado.");
                    BloquearFormulario();
                    return;
                }

                // guardar para despues
                ViewState["email"] = email;
                ViewState["token"] = token;
            }
        }

        protected void btnCambiar_Click(object sender, EventArgs e)
        {
            string nuevaPass = txtNueva.Text.Trim();
            string confirmar = txtConfirmar.Text.Trim();

            if (string.IsNullOrEmpty(nuevaPass))
            {
                MostrarError("Ingresa una contraseña");
                return;
            }

            if (nuevaPass != confirmar)
            {
                MostrarError("Las contraseñas no coinciden.");
                return;
            }

            if (ViewState["email"] == null)
            {
                MostrarError("Sesión inválida. Intenta nuevamente.");
                BloquearFormulario();
                return;
            }

            string email = ViewState["email"].ToString();
            string token = ViewState["token"].ToString();

            LoginL logica = new LoginL();

            bool ok = logica.CambiarContrasenaPorEmail(email, nuevaPass);

            if (ok)
            {
                UsuarioD datos = new UsuarioD();

                lblError.CssClass = "block mb-4 p-3 text-xs font-semibold text-green-600 bg-green-50 border border-green-200 rounded-lg text-center";
                lblError.Text = "Contraseña actualizada correctamente.";
                lblError.Visible = true;

                BloquearFormulario();
            }
            else
            {
                MostrarError("Error al actualizar la contraseña");
            }
        }

        private void MostrarError(string mensaje)
        {
            lblError.Text = mensaje;
            lblError.CssClass = "block mb-4 p-3 text-xs font-semibold text-red-600 bg-red-50 border border-red-200 rounded-lg text-center";
            lblError.Visible = true;
        }

        // Método de seguridad 
        private void BloquearFormulario()
        {
            txtNueva.Visible = false;
            txtConfirmar.Visible = false;
            btnCambiar.Visible = false;
        }
    }
}