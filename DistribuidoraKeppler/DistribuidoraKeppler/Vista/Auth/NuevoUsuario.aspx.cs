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
            LoginL oLoginL = new LoginL();

            int IdUsuario = Convert.ToInt32(Session["IdUsuario"]);
            string resultado = oLoginL.MtUsuarioNuevo(txtNuevaClave.Text, IdUsuario);

            string rol = Session["RolUsuario"].ToString();

            if (!txtNuevaClave.Text.Any() || !txtConfirmarClave.Text.Any())
            {
                string script = @"Swal.fire({
                    title: 'Inconsistencia estructural de datos', 
                    text: 'Rellena los campos chaval, AMBOS', 
                    icon: 'info'});";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
            else
            {
                if (txtNuevaClave.Text != txtConfirmarClave.Text)
                {
                    string script = @"Swal.fire({
                    title: 'Error', 
                    text: 'Las contraseñas no coinciden', 
                    icon: 'error'});";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

                }
                else
                {
                    if (resultado == "Contraseña actualizada correctamente")
                    {
                        string script = @"Swal.fire({
                    title: 'Exito', 
                    text: 'Contraseña actualizada correctamente', 
                    icon: 'success'});";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

                        switch (rol)
                        {
                            case "Administrador": Response.Redirect("~/Vista/Administrador/DashboardAdministrador.aspx"); break;
                            case "Preventista": Response.Redirect("~/Vista/Preventista/Preventista.aspx"); break;
                            case "Distribuidor": Response.Redirect("~/Vista/Repartidor/Repartidor.aspx"); break;
                            case "Bodega": Response.Redirect("~/Vista/Bodega/DashboardBodega.aspx"); break;
                        }

                    }
                }
            }
        }
    }
}