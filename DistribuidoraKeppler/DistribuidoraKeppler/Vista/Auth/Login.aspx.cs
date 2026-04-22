using System;
using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;

namespace DistribuidoraKeppler.Vista.Auth
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtUsuario.Text.Trim();     
            string contrasena = txtClave.Text.Trim();     

            UsuarioD datos = new UsuarioD();
            UsuarioM acceso = datos.ObtenerUsuario(email, contrasena);

            if (acceso != null)
            {
                string script = $"Swal.fire('Login correcto', 'Bienvenido {acceso.Nombre} – Rol: {acceso.Rol}', 'success');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

                switch (acceso.IdRol)
                {
                    case 1: Response.Redirect("~/Vista/Aministrador/DashboardAdministrador.aspx"); break;
                    case 2: Response.Redirect("~/Vista/Preventista/DashboardPreventista.aspx"); break;
                    case 3: Response.Redirect("~/Vista/Bodega/DashboardBodega.aspx"); break;
                    case 4: Response.Redirect("~/Vista/Cliente/DashboardCliente.aspx"); break;
                    default: Response.Redirect("~/Vista/Repartidor/Repartidor.aspx"); break;
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
