using DistribuidoraKeppler.Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Cliente
{
    public partial class CambiarContrasena : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (Session["SesionCliente"] == null)
            {
                Response.Redirect("~/Vista/Login.aspx");
                return;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            Modelo.Cliente cliente = (Modelo.Cliente)Session["SesionCliente"];

            // Verificar que la contraseña actual sea correcta
            if (txtActual.Text.Trim() != cliente.Contrasena)
            {
                pnlError.Visible = true;
                lblError.Text = "La contraseña actual es incorrecta.";
                return;
            }

            // Verificar que la nueva no sea igual a la actual
            if (txtNueva.Text.Trim() == cliente.Contrasena)
            {
                pnlError.Visible = true;
                lblError.Text = "La nueva contraseña debe ser diferente a la actual.";
                return;
            }

            ClienteD datos = new ClienteD();
            bool actualizado = datos.ActualizarContrasena(cliente.Id, txtNueva.Text.Trim());

            if (actualizado)
            {
                // ✅ Actualiza la contraseña en Session
                cliente.Contrasena = txtNueva.Text.Trim();
                Session["SesionCliente"] = cliente;

                // Redirige con mensaje de éxito
                Response.Redirect("~/Vista/Cliente/PerfilCliente.aspx?msg=contrasena");
            }
            else
            {
                pnlError.Visible = true;
                lblError.Text = "No se pudo actualizar. Intente nuevamente.";
            }

        }
    }
}