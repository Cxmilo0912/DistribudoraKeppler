using DistribuidoraKeppler.Datos;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Aministrador
{
    public partial class PerfilAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Mensaje de éxito al volver desde CambiarContrasena
                if (Request.QueryString["msg"] == "contrasena")
                {
                    string script = "Swal.fire('¡Listo!', 'Contraseña actualizada correctamente.', 'success');";
                    ClientScript.RegisterStartupScript(this.GetType(), "msg", script, true);
                }

                if (Session["SesionTrabajador"] == null)
                {
                    Response.Redirect("~/Vista/Login.aspx");
                    return;
                }
                CargarDatosAdmin();
            }
        }
        private void CargarDatosAdmin()
        {
            // Ejemplo: obtener cliente desde Session o una capa de negocio
            Modelo.Usuario admin = (Modelo.Usuario)Session["SesionTrabajador"];

            // Imagen de perfil
            imgPerfil.ImageUrl = !string.IsNullOrEmpty(admin.Foto)
                ? admin.Foto
                : "~/Recursos/default-avatar.png";

            // Encabezado
            lblNombreUsuario.Text = admin.Nombre;
            lblRol.Text = admin.Rol.Nombre;

            // Información de contacto
            lblNombreContacto.Text = admin.Nombre;
            lblEmail.Text = admin.Email;

            // Dirección y barrio
            lblDocumento.Text = admin.Documento.ToString();          
        }
        protected void btnSubirFoto_Click(object sender, EventArgs e)
        {
            if (!fuImagen.HasFile)
            {
                MostrarAlerta("warning", "No seleccionaste ninguna imagen.");
                return;
            }

            // Validar que sea imagen
            string[] extensionesPermitidas = { ".jpg", ".jpeg", ".png", ".webp" };
            string extension = Path.GetExtension(fuImagen.FileName).ToLower();

            if (!extensionesPermitidas.Contains(extension))
            {
                MostrarAlerta("error", "Solo se permiten imágenes JPG, PNG o WEBP.");
                return;
            }

            // Validar tamaño máximo (2MB)
            if (fuImagen.PostedFile.ContentLength > 2 * 1024 * 1024)
            {
                MostrarAlerta("error", "La imagen no puede superar 2MB.");
                return;
            }

            Modelo.Usuario usuario = (Modelo.Usuario)Session["SesionTrabajador"];

            // Nombre único para evitar colisiones
            string nombreArchivo = $"cliente_{usuario.Id}_{DateTime.Now.Ticks}{extension}";
            string carpeta = Server.MapPath("~/Imagenes/Perfiles/");

            // Crear carpeta si no existe
            if (!Directory.Exists(carpeta))
                Directory.CreateDirectory(carpeta);

            string rutaFisica = Path.Combine(carpeta, nombreArchivo);
            string rutaDB = $"~/Imagenes/Perfiles/{nombreArchivo}";

            // Guardar archivo en el servidor
            fuImagen.SaveAs(rutaFisica);

            // Guardar ruta en la base de datos
            ClienteD datos = new ClienteD();
            bool actualizado = datos.ActualizarImagen(usuario.Id, rutaDB);

            if (actualizado)
            {
                // Actualizar Session para reflejar el cambio
                usuario.Foto = rutaDB;
                Session["SesionCliente"] = usuario;

                imgPerfil.ImageUrl = ResolveUrl(rutaDB);
                MostrarAlerta("success", "Foto actualizada correctamente.");
            }
            else
            {
                MostrarAlerta("error", "No se pudo guardar en la base de datos.");
            }
        }

        private void MostrarAlerta(string tipo, string mensaje)
        {
            string script = $"Swal.fire('', '{mensaje}', '{tipo}');";
            ClientScript.RegisterStartupScript(this.GetType(), "alerta", script, true);
        }
    }
}