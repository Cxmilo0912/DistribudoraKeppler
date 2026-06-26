using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;
using System;
using System.Collections.Generic;

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

            ResultadoLogin resultado = logica.MtValidarLogin(
                txtUsuario.Text.Trim(),
                txtClave.Text.Trim()
            );


            if (resultado != null)
            {


                if (resultado.Rol == "Cliente")
                {
                    Session["Rol"] = resultado.Rol;
                    SesionHelper.Usuario = resultado.Usuario;
                    SesionHelper.Rol = resultado.Rol;
                    Session["Cliente"] = resultado.Cliente;
                    Session["IdCliente"] = resultado.Cliente.Id;
                    Response.Redirect("~/Vista/Cliente/DashboardCliente.aspx", false);

                }
                else
                {
                    Session["Rol"] = resultado.Rol;
                    SesionHelper.Usuario = resultado.Usuario;
                    SesionHelper.Rol = resultado.Rol;

                    string rol = resultado.Rol.Trim().ToLower();
                    List<Rol> roles = logica.MtRolesPorUsuario(resultado.Usuario.Id);


                    if (roles.Count > 1)
                    {
                        Session["RolesDisponibles"] = roles;
                        Session["UsuarioTemporal"] = resultado.Usuario;
                        Response.Redirect("~/Vista/Auth/SeleccionRol.aspx");
                    }
                    if (resultado.Usuario.Estado == 0)
                    {
                        string script = "Swal.fire('Error', 'Usuario inactivo, por favor contacte con el administrador', 'error');";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                    }
                    switch (rol)
                    {
                        case "administrador":
                            Session["Usuario"] = resultado.Usuario;
                            Response.Redirect("~/Vista/Administrador/DashboardAdministrador.aspx", false);
                            break;
                        case "bodega":
                            Session["Usuario"] = resultado.Usuario;
                            Response.Redirect("~/Vista/Bodega/DashboardBodega.aspx", false);
                            break;
                        case "preventista":
                            Session["Usuario"] = resultado.Usuario;
                            Response.Redirect("~/Vista/Preventista/Preventista.aspx", false);
                            break;
                        case "repartidor":
                            Session["Usuario"] = resultado.Usuario;
                            Response.Redirect("~/Vista/Repartidor/Repartidor.aspx", false);
                            break;
                        default:
                            Response.Write("Rol no reconocido: " + resultado.Rol);
                            break;
                    }

                    Context.ApplicationInstance.CompleteRequest();
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