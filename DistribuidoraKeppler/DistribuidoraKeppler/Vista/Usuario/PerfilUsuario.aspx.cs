using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Utilidades;
using System;
using System.Collections.Generic;
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
            var u = SesionHelper.Usuario; // Obtener el usuario de la sesión para actualizar sus datos

            u.Nombre = txtNombre.Text.Trim();
            u.Email = txtEmail.Text.Trim();

            UsuarioL oUsuarioL = new UsuarioL();

            bool ok = oUsuarioL.MtActualizarPerfil(u); // Llamar al método de la lógica para actualizar el perfil del usuario

            if (ok)
            {
                SesionHelper.Usuario = u;

                ScriptManager.RegisterStartupScript(this, GetType(), "ok",
                    "Swal.fire('OK','Datos actualizados','success')", true);
            }
        }
    }
}