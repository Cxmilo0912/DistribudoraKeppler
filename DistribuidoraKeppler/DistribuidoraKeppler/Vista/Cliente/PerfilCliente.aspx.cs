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

namespace DistribuidoraKeppler.Vista.Cliente
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Postback para evitar recargar los datos cada vez que se envía un formulario

            if (!IsPostBack)
            {
                if (SesionHelper.Cliente == null)
                {
                    Response.Redirect("~/Vista/Auth/Login.aspx");
                    return;
                }

                CargarDatos();
            }
        }

        protected void btnSubirFoto_Click(object sender, EventArgs e)
        {
            if (SesionHelper.Cliente == null)
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

            string[] permitidas = { ".jpg", ".jpeg", ".png" };

            if (!permitidas.Contains(extension))
            {
                Mostrar("Error", "Solo JPG o PNG", "error");
                return;
            }

            // Tamaño (2MB)
            if (fuImagen.PostedFile.ContentLength > 2 * 1024 * 1024)
            {
                Mostrar("Error", "Máx 2MB", "error");
                return;
            }

            string nombre = $"cliente_{SesionHelper.Cliente.Id}_{DateTime.Now.Ticks}{extension}";

            string rutaServidor = Server.MapPath("~/Imagenes/Clientes/");

            if (!Directory.Exists(rutaServidor))
                Directory.CreateDirectory(rutaServidor);

            string rutaCompleta = Path.Combine(rutaServidor, nombre);

            fuImagen.SaveAs(rutaCompleta);

            string rutaBD = "~/Imagenes/Clientes/" + nombre;

            ClienteL logica = new ClienteL();

            bool ok = logica.MtActualizarImagen(SesionHelper.Cliente.Id, rutaBD);

            if (ok)
            {
                // actualizar sesión
                SesionHelper.Cliente.Imagen = rutaBD;

                imgPerfil.ImageUrl = rutaBD;

                Mostrar("OK", "Imagen actualizada", "success");
            }
            else
            {
                Mostrar("Error", "No se pudo guardar", "error");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            var clienteSesion = SesionHelper.Cliente;

            Modelo.Cliente cliente = new Modelo.Cliente
            {
                Id = clienteSesion.Id,
                NombreEmpresa = txtNombre.Text.Trim(),
                Email = txtEmail.Text.Trim(),
                Telefono = txtTelefono.Text.Trim(),
                Direccion = txtDireccion.Text.Trim(),
                Barrio = clienteSesion.Barrio // importante
            };

            ClienteL logica = new ClienteL();

            bool ok = logica.MtActualizarPerfil(cliente);

            if (ok)
            {
                // refrescar sesión
                SesionHelper.Cliente = logica.MtObtenerPorId(cliente.Id);

                Mostrar("OK", "Perfil actualizado", "success");
            }
            else
            {
                Mostrar("Error", "No se pudo actualizar", "error");
            }
        }
        private void CargarDatos()
        {
            var cliente = SesionHelper.Cliente;

            txtNombre.Text = cliente.NombreEmpresa;
            txtEmail.Text = cliente.Email;
            txtTelefono.Text = cliente.Telefono;
            txtDireccion.Text = cliente.Direccion;

            imgPerfil.ImageUrl = string.IsNullOrEmpty(cliente.Imagen)
                ? "~/Imagenes/default.png"
                : cliente.Imagen;
        }

        private void Mostrar(string t, string m, string tipo)
        {
            string script = $"Swal.fire('{t}','{m}','{tipo}');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }

        protected void btnCambiarPass_Click(object sender, EventArgs e)
        {
            if (SesionHelper.Cliente == null)
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

            ClienteL logica = new ClienteL();

            bool resultado = logica.MtCambiaContrasena(
                SesionHelper.Cliente.Id,
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
    }

}