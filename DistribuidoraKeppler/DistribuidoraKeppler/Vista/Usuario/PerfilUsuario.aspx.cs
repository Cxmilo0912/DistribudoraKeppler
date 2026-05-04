using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Utilidades;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Usuario
{
    public partial class PerfilUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Postback para evitar recargar los datos cada vez que se envía un formulario
            if (!IsPostBack)
            {
                var u = SesionHelper.Usuario; // Obtener el usuario de la sesión
                if (u == null)
                {
                    Response.Redirect("/Vista/Auth/Login.aspx"); // Redirigir al login si no hay usuario en sesión
                    return;
                }

                // Mostrar los datos del usuario en los controles de la página
                txtNombre.Text = u.Nombre;
                txtEmail.Text = u.Email;


                imgPerfil.ImageUrl = string.IsNullOrEmpty(u.Foto) ? "/Imagenes/default-profile.png" : u.Foto; // Mostrar foto de perfil o imagen por defecto
            }

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            var uSesion = SesionHelper.Usuario;

            Modelo.Usuario u = new Modelo.Usuario
            {
                Id = uSesion.Id,
                Nombre = txtNombre.Text.Trim(),
                Email = txtEmail.Text.Trim()
            };

            UsuarioL oUsuarioL = new UsuarioL();

            bool ok = oUsuarioL.MtActualizarPerfil(u); // Llamar al método de la lógica para actualizar el perfil del usuario

            if (ok)
            {
                SesionHelper.Usuario = u;

                ScriptManager.RegisterStartupScript(this, GetType(), "ok",
                    "Swal.fire('OK','Datos actualizados','success')", true);
            }
        }

        protected void btnCambiarPass_Click(object sender, EventArgs e)
        {
            if (SesionHelper.Usuario == null)
            {
                Response.Redirect("~/Vista/Auth/Login.aspx");
                return;
            }

            string actual = txtActual.Text;
            string nueva = txtNueva.Text;
            string confirmar = txtConfirmar.Text;

            // Validar confirmación
            if (nueva != confirmar)
            {
                Mostrar("Error", "Las contraseñas no coinciden", "error");
                return;
            }

            UsuarioL logica = new UsuarioL();

            bool resultado = logica.MtCambiarContrasena(
                SesionHelper.Usuario.Id,
                actual,
                nueva
            );

            if (resultado)
            {
                Mostrar("OK", "Contraseña actualizada", "success");
            }
            else
            {
                Mostrar("Error", "Contraseña actual incorrecta o inválida", "error");
            }
        }

        private void Mostrar(string titulo, string mensaje, string tipo)
        {
            string script = $"Swal.fire('{titulo}', '{mensaje}', '{tipo}');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }

        protected void btnSubirFoto_Click(object sender, EventArgs e)
        {
            if (SesionHelper.Usuario == null)
            {
                Response.Redirect("~/Vista/Auth/Login.aspx");
                return;
            }

            if (!fuImagen.HasFile)
            {
                Mostrar("Error", "Selecciona una imagen", "error");
                return;
            }

            string extension = Path.GetExtension(fuImagen.FileName).ToLower();

            // Validar tipo de archivo
            string[] extensionesPermitidas = { ".jpg", ".jpeg", ".png" };

            if (!extensionesPermitidas.Contains(extension))
            {
                Mostrar("Error", "Solo se permiten imágenes JPG o PNG", "error");
                return;
            }

            // Nombre único
            string nombreArchivo = $"user_{SesionHelper.Usuario.Id}_{DateTime.Now.Ticks}{extension}";

            // Ruta física en servidor
            string rutaServidor = Server.MapPath("~/Imagenes/Usuarios/");

            // Crear carpeta si no existe
            if (!Directory.Exists(rutaServidor))
            {
                Directory.CreateDirectory(rutaServidor);
            }

            string rutaCompleta = Path.Combine(rutaServidor, nombreArchivo);

            // Guardar archivo
            fuImagen.SaveAs(rutaCompleta);

            // Ruta relativa para BD
            string rutaBD = "~/Imagenes/Usuarios/" + nombreArchivo;

            UsuarioL logica = new UsuarioL();

            bool ok = logica.MtActualizarFoto(SesionHelper.Usuario.Id, rutaBD);

            if (ok)
            {
                // Actualizar sesión
                SesionHelper.Usuario.Foto = rutaBD;

                imgPerfil.ImageUrl = rutaBD;

                Mostrar("OK", "Foto actualizada", "success");
            }
            else
            {
                Mostrar("Error", "No se pudo guardar la imagen", "error");
            }
        }
    }
}