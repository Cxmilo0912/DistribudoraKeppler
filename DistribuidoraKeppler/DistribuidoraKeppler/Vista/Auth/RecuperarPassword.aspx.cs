using System;
using System.Net;
using System.Net.Mail;
using DistribuidoraKeppler.Datos;

namespace DistribuidoraKeppler.Vista.Auth
{
    public partial class RecuperarPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMensaje.Visible = false;
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                MostrarMensaje("Por favor, ingresa tu correo electrónico.", false);
                return;
            }

            UsuarioD datos = new UsuarioD();
            var user = datos.ObtenerPorCorreo(email);

            if (user != null)
            {
                string token = Guid.NewGuid().ToString();
                DateTime expira = DateTime.Now.AddHours(1);
                datos.GuardarToken(email, token, expira);

                string link = Request.Url.GetLeftPart(UriPartial.Authority) + "/Vista/Auth/ResetPassword.aspx?token=" + token;

                if (EnviarCorreo(email, link))
                {
                    MostrarMensaje("¡Revisa tu correo! Te hemos enviado las instrucciones.", true);
                    txtEmail.Enabled = false;
                    btnEnviar.Visible = false;
                }
            }
            else
            {
                MostrarMensaje("El correo no está registrado en nuestro sistema.", false);
            }
        }

        private bool EnviarCorreo(string destino, string link)
        {
            try
            {
                MailMessage correo = new MailMessage();
                correo.From = new MailAddress("distribuidorakeppler@gmail.com", "Distribuidora Kepler");
                correo.To.Add(destino);
                correo.Subject = "Recuperar contraseña - Distribuidora Kepler";
                correo.IsBodyHtml = true;
                correo.Body = $@"
                    <div style='font-family: sans-serif; padding: 20px;'>
                        <h2>Recuperación de Contraseña</h2>
                        <p>Haz clic en el enlace para restablecer tu acceso:</p>
                        <a href='{link}' style='background: #111827; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px;'>Restablecer Contraseña</a>
                    </div>";

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("distribuidorakeppler@gmail.com", "ifbu xnmz ryed rsyf");

                smtp.Send(correo);
                return true;
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al enviar: " + ex.Message, false);
                return false;
            }
        }

        private void MostrarMensaje(string texto, bool esExito)
        {
            lblMensaje.Text = texto;
            lblMensaje.Visible = true;
            lblMensaje.CssClass = esExito
                ? "block mb-6 p-3 text-xs font-semibold text-green-600 bg-green-50 border border-green-200 rounded-lg text-center"
                : "block mb-6 p-3 text-xs font-semibold text-red-600 bg-red-50 border border-red-200 rounded-lg text-center";
        }
    }
}