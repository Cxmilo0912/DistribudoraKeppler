using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using DistribuidoraKeppler.Utilidades;

namespace DistribuidoraKeppler.Vista
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null || Session["Cliente"] != null)
            {
                lblRol.Text = Session["Rol"]?.ToString() ?? "";
                string rol = SesionHelper.Rol; // Obtener el rol del usuario desde la sesión

                menuAdmin.Visible = false;
                menuCliente.Visible = false;
                menuRepartidor.Visible = false;
                menuPreventista.Visible = false;
                menuBodega.Visible = false;

                if (string.IsNullOrEmpty(rol))
                    return;

                switch (rol)
                {
                    case "Administrador":
                        menuAdmin.Visible = true;
                        break;

                    case "Cliente":
                        menuCliente.Visible = true;
                        break;

                    case "Repartidor":
                        menuRepartidor.Visible = true;
                        break;

                    case "Preventista":
                        menuPreventista.Visible = true;
                        break;

                    case "Bodega":
                        menuBodega.Visible = true;
                        break;
                }
            }
            else
            {
                Response.Redirect("~/Vista/Auth/Login.aspx", false);
            }
        }

        // CERRAR SESIÓN CON SWEET ALERT
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();

            string urlLogin = ResolveUrl("~/Vista/Auth/Login.aspx");
            string script = $@"
                Swal.fire({{
                    title: 'Sesión cerrada',
                    text: 'Has cerrado sesión correctamente',
                    icon: 'success',
                    confirmButtonText: 'OK'
                }}).then(() => {{
                    window.location.href = '{urlLogin}';
                }});
            ";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "logout", script, true);
        }



    }
}