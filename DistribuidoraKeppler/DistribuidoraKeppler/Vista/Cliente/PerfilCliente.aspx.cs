using DistribuidoraKeppler.Datos;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Cliente
{
    public partial class WebForm1 : System.Web.UI.Page
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

                if (Session["SesionCliente"] == null)
                {
                    Response.Redirect("~/Vista/Login.aspx");
                    return;
                }
                CargarDatosCliente();
            }
        }

        private void CargarDatosCliente()
        {
            // Ejemplo: obtener cliente desde Session o una capa de negocio
            Modelo.Cliente cliente = (Modelo.Cliente)Session["SesionCliente"];

            // Imagen de perfil
            imgPerfil.ImageUrl = !string.IsNullOrEmpty(cliente.Imagen)
                ? cliente.Imagen
                : "~/Recursos/default-avatar.png";

            // Encabezado
            lblNombreEmpresa.Text = cliente.NombreEmpresa;
            lblNit.Text = cliente.Nit;

            // Información de contacto
            lblNombreContacto.Text = cliente.NombreEmpresa;
            lblEmail.Text = cliente.Email;
            lblTelefono.Text = cliente.Telefono;

            // Dirección y barrio
            lblDireccion.Text = cliente.Direccion;
            lblBarrio.Text = cliente.Barrio.Nombre ?? "Sin barrio asignado";
        }


        protected void btnEditar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vista/Cliente/EditarPerfil.aspx");
        }



        protected void btnCambiarContrasena_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Vista/Cliente/CambiarContrasena.aspx");
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

            Modelo.Cliente cliente = (Modelo.Cliente)Session["SesionCliente"];

            // Nombre único para evitar colisiones
            string nombreArchivo = $"cliente_{cliente.Id}_{DateTime.Now.Ticks}{extension}";
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
            bool actualizado = datos.ActualizarImagen(cliente.Id, rutaDB);

            if (actualizado)
            {
                // Actualizar Session para reflejar el cambio
                cliente.Imagen = rutaDB;
                Session["SesionCliente"] = cliente;

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