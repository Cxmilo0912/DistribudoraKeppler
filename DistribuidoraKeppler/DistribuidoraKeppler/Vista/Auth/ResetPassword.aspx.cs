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
                lblError.Visible = false;

                string token = Request.QueryString["token"];

                if (string.IsNullOrEmpty(token))
                {
                    MostrarError("Token no proporcionado. No puedes cambiar la contraseña sin un enlace válido.");
                    return;
                }

                UsuarioD datos = new UsuarioD();
                string email = datos.ObtenerEmailPorToken(token);

                if (email == null)
                {
                    MostrarError("El enlace de recuperación es inválido o ya ha expirado.");
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
                if (string.IsNullOrWhiteSpace(txtNueva.Text) || string.IsNullOrWhiteSpace(txtConfirmar.Text))
                {
                    MostrarError("Por favor, completa ambos campos.");
                    return;
                }

                if (txtNueva.Text == txtConfirmar.Text)
                {
                    try
                    {
                        datos.ActualizarPassword(email, txtNueva.Text);

                        lblError.Text = "¡Contraseña actualizada con éxito!";
                        lblError.CssClass = "block mb-4 p-3 text-xs font-semibold text-green-600 bg-green-50 border border-green-200 rounded-lg text-center";
                        lblError.Visible = true;

                        txtNueva.Visible = false;
                        txtConfirmar.Visible = false;
                        btnCambiar.Visible = false;
                    }
                    catch (Exception ex)
                    {
                        MostrarError("Ocurrió un error al actualizar: " + ex.Message);
                    }
                }
                else
                {
                    MostrarError("Las contraseñas ingresadas no coinciden.");
                }
            }
            else
            {
                MostrarError("No se pudo procesar la solicitud. El token ya no es válido.");
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