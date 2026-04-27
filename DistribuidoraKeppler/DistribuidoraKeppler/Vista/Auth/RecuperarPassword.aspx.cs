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

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string email = txtCorreo.Text.Trim();

            UsuarioD datos = new UsuarioD();
            var user = datos.ObtenerPorCorreo(email);

            if (user != null)
            {
                string token = Guid.NewGuid().ToString();
                DateTime expira = DateTime.Now.AddHours(1);

                datos.GuardarToken(email, token, expira);

                // 🔥 LINK DINÁMICO (IMPORTANTE)
                string link = "https://saxophone-decline-pegboard.ngrok-free.dev/Vista/Auth/ResetPassword.aspx?token=" + token;

                EnviarCorreo(email, link);

                Response.Write("Revisa tu correo");
            }
            else
            {
                Response.Write("Correo no encontrado");
            }
        }

        // 🔥 MÉTODO DE ENVÍO CORREGIDO
        private void EnviarCorreo(string destino, string link)
        {
            try
            {
                MailMessage correo = new MailMessage();
                correo.From = new MailAddress("distribuidorakeppler@gmail.com", "Distribuidora Kepler");

                // 🚨 CORRECCIÓN: Solo enviar al que lo solicitó
                correo.To.Add(destino);

                correo.Subject = "Recuperar contraseña - Distribuidora Kepler";

                // Usar IsBodyHtml = true para que el link sea clickeable
                correo.IsBodyHtml = true;
                correo.Body = $@"
            <h3>Solicitud de cambio de contraseña</h3>
            <p>Has solicitado restablecer tu contraseña en Distribuidora Kepler.</p>
            <p>Haz clic en el siguiente enlace para continuar:</p>
            <a href='{link}'>Restablecer Contraseña</a>
            <br><br>
            <p>Este enlace expirará en 1 hora.</p>";

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("distribuidorakeppler@gmail.com", "ifbu xnmz ryed rsyf");

                smtp.Send(correo);
            }
            catch (Exception ex)
            {
                // En producción, es mejor usar un Label que Response.Write
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}