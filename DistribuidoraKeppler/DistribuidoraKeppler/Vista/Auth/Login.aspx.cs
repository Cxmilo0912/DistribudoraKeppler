using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using System;

namespace DistribuidoraKeppler.Vista.Auth
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            LoginL logica = new LoginL();
            object ingreso = logica.ValidarLogin(txtUsuario.Text, txtClave.Text);

            if (ingreso != null)
            {
                if (ingreso is Usuario u)
                {
                    Session["SesionTrabajador"] = u;

                    switch (u.Rol.Id)
                    {
                        case 1:
                            Session["rol"] = "Admin";
                            Response.Redirect("~/Vista/Administrador/DashboardAdministrador.aspx");
                            break;

                        case 2:
                            Session["rol"] = "Preventista";
                            Response.Redirect("~/Vista/Preventista/Preventista.aspx");
                            break;

                        case 3:
                            Session["rol"] = "Repartidor";
                            Response.Redirect("~/Vista/Repartidor/Repartidor.aspx");
                            break;

                        case 4:
                            Session["rol"] = "Bodega";
                            Response.Redirect("~/Vista/Bodega/DashboardBodega.aspx");
                            break;
                    }
                }

 
                else if (ingreso is Modelo.Cliente c)
                {
                    Session["SesionCliente"] = c;
                    Session["rol"] = "Cliente";

                    Response.Redirect("~/Vista/Cliente/DashboardCliente.aspx");
                }
            }
            else
            {
                string script = "Swal.fire('Error', 'Usuario o contraseña incorrectos', 'error');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
        }
    }
}
