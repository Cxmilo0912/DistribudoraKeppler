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
                // VALIDACIÓN POR TIPO DE MODELO
                if (ingreso is Usuario u)
                {
                    Session["SesionTrabajador"] = u;
                    // Manejo de los 4 roles de trabajador
                    switch (u.Rol.Id)
                    {
                        case 1: Response.Redirect("~/Vista/Administrador/DashboardAdministrador.aspx"); break;
                        case 2: Response.Redirect("~/Vista/Preventista/Preventista.aspx"); break;
                        case 3: Response.Redirect("~/Vista/Bodega/DashboardBodega.aspx"); break;
                        case 4: Response.Redirect("~/Vista/Repartidor/Repartidor.aspx"); break;
                    }
                }
                else if (ingreso is Modelo.Cliente c)
                {
                    Session["SesionCliente"] = c;
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
