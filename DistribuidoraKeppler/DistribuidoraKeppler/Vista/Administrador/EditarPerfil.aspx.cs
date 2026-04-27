using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Administrador
{
    public partial class EditarPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (Session["SesionTrabajador"] == null)
            {
                Response.Redirect("~/Vista/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {            
                CargarDatosActuales();
            }
        }
        private void CargarDatosActuales()
        {
            // Pre-rellena el formulario con los datos actuales del Usuario
            Modelo.Usuario usuario = (Modelo.Usuario)Session["SesionTrabajador"];

            txtNombre.Text = usuario.Nombre;
            txtEmail.Text = usuario.Email;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            Modelo.Usuario usuario = (Modelo.Usuario)Session["SesionTrabajador"];

            // Actualiza los campos con los nuevos valores
            usuario.Nombre = txtNombre.Text.Trim();
            usuario.Email = txtEmail.Text.Trim();

            UsuarioD datos = new UsuarioD();
            bool actualizado = datos.ActualizarUsuario(usuario);

            if (actualizado)
            {
                // Actualiza la Session con los nuevos datos
                Session["SesionCliente"] = usuario;
                Response.Redirect("~/Vista/Administrador/PerfilAdministrador.aspx");
            }
            else
            {
                pnlError.Visible = true;
                lblError.Text = "No se pudo actualizar. Intente nuevamente.";
            }
        }
    }
}