using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Bodega
{
    public partial class PerfilBodega : Page
    {
        private DistribuidoraKeppler.Datos.UsuarioD _datos =
           new DistribuidoraKeppler.Datos.UsuarioD();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarPerfil();
        }

        //  Carga los datos en pantalla

        private void CargarPerfil()
        {
            Usuario usuario = Session["SesionTrabajador"] as Usuario;

            if (usuario == null)
            {
                Response.Redirect("~/Auth/Login.aspx");
                return;
            }

            // ── Labels de solo lectura ──
            lblNombreTexto.Text = usuario.Nombre;
            lblDocumentoTexto.Text = usuario.Documento.ToString();
            lblEmailTexto.Text = usuario.Email;
            lblRolTexto.Text = usuario.Rol?.Nombre ?? "";

            // ── TextBoxes editables ──
            txtNombre.Text = usuario.Nombre;
            txtDocumento.Text = usuario.Documento.ToString();
            txtEmail.Text = usuario.Email;

            // ── Banner y header ──
            lblNombreBanner.Text = usuario.Nombre;
            lblNombreHeader.Text = usuario.Nombre;
            lblRolBanner.Text = $"{usuario.Rol?.Nombre} • ID: {usuario.Id}";
            lblFechaIngresoBadge.Text = "Kepler";

            // ── Foto de perfil ──
            string rutaFoto = string.IsNullOrEmpty(usuario.Foto)
                ? ResolveUrl("~/Recursos/Imagenes/avatar-default.png")
                : ResolveUrl(usuario.Foto);

            imgAvatarGrande.ImageUrl = rutaFoto;
            imgAvatarHeader.ImageUrl = rutaFoto;
        }


        //  GUARDAR PERFIL  

        protected void btnGuardarPerfil_Click(object sender, EventArgs e)
        {
            Usuario usuario = Session["SesionTrabajador"] as Usuario;
            if (usuario == null) { Response.Redirect("~/Auth/Login.aspx"); return; }

            if (string.IsNullOrWhiteSpace(txtNombre.Text))
            {
                MostrarMensaje("El nombre no puede estar vacío.", "error");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                MostrarMensaje("El correo no puede estar vacío.", "error");
                return;
            }

            usuario.Nombre = txtNombre.Text.Trim();
            usuario.Email = txtEmail.Text.Trim();

            if (int.TryParse(txtDocumento.Text.Trim(), out int doc))
                usuario.Documento = doc;

            bool ok = _datos.ActualizarUsuario(usuario);

            if (ok)
            {
                Session["Usuario"] = usuario;
                CargarPerfil();
                MostrarMensaje("Perfil actualizado correctamente.", "success");
            }
            else
            {
                MostrarMensaje("No se pudo guardar. Intenta de nuevo.", "error");
            }
        }


        //  ACTUALIZAR CONTRASEÑA 

        protected void btnActualizarContrasena_Click(object sender, EventArgs e)
        {
            Usuario usuario = Session["SesionTrabajador"] as Usuario;
            if (usuario == null) { Response.Redirect("~/Auth/Login.aspx"); return; }

            string actual = txtContrasenaActual.Text;
            string nueva = txtNuevaContrasena.Text;
            string confirmar = txtConfirmarContrasena.Text;

            if (string.IsNullOrWhiteSpace(actual) ||
                string.IsNullOrWhiteSpace(nueva) ||
                string.IsNullOrWhiteSpace(confirmar))
            {
                MostrarMensaje("Completa todos los campos de contraseña.", "error");
                return;
            }

            // Compara contra la contraseña guardada en sesión
            if (actual != usuario.Contrasena)
            {
                MostrarMensaje("La contraseña actual es incorrecta.", "error");
                return;
            }

            if (nueva != confirmar)
            {
                MostrarMensaje("Las contraseñas nuevas no coinciden.", "error");
                return;
            }

            if (nueva.Length < 8)
            {
                MostrarMensaje("La contraseña debe tener al menos 8 caracteres.", "error");
                return;
            }

            bool ok = _datos.ActualizarContrasena(usuario.Id, nueva);

            if (ok)
            {
                usuario.Contrasena = nueva;
                Session["SesionTrabajador"] = usuario;

                txtContrasenaActual.Text = string.Empty;
                txtNuevaContrasena.Text = string.Empty;
                txtConfirmarContrasena.Text = string.Empty;

                MostrarMensaje("Contraseña actualizada correctamente.", "success");
            }
            else
            {
                MostrarMensaje("Error al actualizar la contraseña.", "error");
            }
        }

        protected void btnSubirFoto_Click(object sender, EventArgs e)
        {
            Usuario usuario = Session["SesionTrabajador"] as Usuario;
            if (usuario == null) { Response.Redirect("~/Auth/Login.aspx"); return; }

            if (!fuFoto.HasFile)
            {
                MostrarMensaje("No se seleccionó ningún archivo.", "error");
                return;
            }

            string extension = Path.GetExtension(fuFoto.FileName).ToLower();
            string[] validas = { ".jpg", ".jpeg", ".png", ".webp" };

            if (!Array.Exists(validas, ext => ext == extension))
            {
                MostrarMensaje("Solo se permiten imágenes JPG, PNG o WEBP.", "error");
                return;
            }

            if (fuFoto.PostedFile.ContentLength > 2 * 1024 * 1024)
            {
                MostrarMensaje("La imagen no debe superar 2 MB.", "error");
                return;
            }

            string carpeta = Server.MapPath("~/Recursos/Fotos/");
            if (!Directory.Exists(carpeta)) Directory.CreateDirectory(carpeta);

            string nombreArchivo = $"user_{usuario.Id}_{DateTime.Now:yyyyMMddHHmmss}{extension}";
            string rutaCompleta = Path.Combine(carpeta, nombreArchivo);
            fuFoto.SaveAs(rutaCompleta);

            // Eliminar foto anterior
            if (!string.IsNullOrEmpty(usuario.Foto))
            {
                string rutaAnterior = Server.MapPath(usuario.Foto);
                if (File.Exists(rutaAnterior)) File.Delete(rutaAnterior);
            }

            string nuevaRuta = $"~/Recursos/Fotos/{nombreArchivo}";
            bool ok = _datos.ActualizarFoto(usuario.Id, nuevaRuta);

            if (ok)
            {
                usuario.Foto = nuevaRuta;
                Session["Usuario"] = usuario;
                CargarPerfil();
                MostrarMensaje("Foto actualizada correctamente.", "success");
            }
            else
            {
                MostrarMensaje("No se pudo guardar la foto.", "error");
            }
        }

        // ─────────────────────────────────────────────
        //  CERRAR SESIÓN
        // ─────────────────────────────────────────────
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Auth/Login.aspx");
        }

        private void MostrarMensaje(string mensaje, string tipo)
        {
            hfMensaje.Value = mensaje;
            hfTipoMsg.Value = tipo;
        }
    }
}