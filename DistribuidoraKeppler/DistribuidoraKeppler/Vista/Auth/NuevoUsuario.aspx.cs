using DistribuidoraKeppler.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Auth
{
    public partial class NuevoUsuario : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(txtNuevaClave.Text) ||
                string.IsNullOrWhiteSpace(txtConfirmarClave.Text))
            {
                string script = @"Swal.fire({
            title: 'Campos vacíos', 
            text: 'Debes completar ambos campos', 
            icon: 'warning'});";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                return;
            }


            if (txtNuevaClave.Text != txtConfirmarClave.Text)
            {
                string script = @"Swal.fire({
            title: 'Error', 
            text: 'Las contraseñas no coinciden', 
            icon: 'error'});";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                return;
            }


            if (Session["IdUsuario"] == null || Session["RolUsuario"] == null)
            {
                Response.Redirect("~/Vista/Auth/Login.aspx");
                return;
            }

            int IdUsuario = Convert.ToInt32(Session["IdUsuario"]);
            string rol = Session["RolUsuario"].ToString();


            LoginL oLoginL = new LoginL();
            bool resultado = oLoginL.MtUsuarioNuevo(txtNuevaClave.Text, IdUsuario);

            if (resultado)
            {
                string script = @"Swal.fire({
            title: 'Éxito', 
            text: 'Contraseña actualizada correctamente', 
            icon: 'success'});";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);


                switch (rol)
                {
                    case "Administrador":
                        Response.Redirect("~/Vista/Administrador/DashboardAdministrador.aspx");
                        break;

                    case "Preventista":
                        Response.Redirect("~/Vista/Preventista/Preventista.aspx");
                        break;

                    case "Distribuidor":
                        Response.Redirect("~/Vista/Repartidor/Repartidor.aspx");
                        break;

                    case "Bodega":
                        Response.Redirect("~/Vista/Bodega/DashboardBodega.aspx");
                        break;

                    default:
                        Response.Redirect("~/Vista/Auth/Login.aspx");
                        break;
                }
            }
            else
            {
                string script = @"Swal.fire({
            title: 'Error', 
            text: 'No se pudo actualizar la contraseña', 
            icon: 'error'});";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
        }
    }
}
