using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;
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

            var resultado = logica.MtValidarLogin(txtUsuario.Text.Trim(), txtClave.Text.Trim()); // Llama al método de validación de login

            if (resultado != null)
            {


                SesionHelper.Usuario = resultado.Usuario; // Guarda el usuario en la sesión
                SesionHelper.Cliente = resultado.Cliente;
                SesionHelper.Rol = resultado.Rol;

                switch (resultado.Rol)
                {
                    case "Administrador":
                        Response.Redirect("~/Vista/Administrador/DashboardAdministrador.aspx");
                        break;

                    case "Bodega":
                        Response.Redirect("~/Vista/Bodega/DashboardBodega.aspx");
                        break;

                    case "Preventista":
                        Response.Redirect("~/Vista/Preventista/Preventista.aspx");
                        break;

                    case "Repartidor":
                        Response.Redirect("~/Vista/Repartidor/Repartidor.aspx");
                        break;

                    case "Cliente":
                        Response.Redirect("~/Vista/Cliente/DashboardCliente.aspx");
                        break;
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
