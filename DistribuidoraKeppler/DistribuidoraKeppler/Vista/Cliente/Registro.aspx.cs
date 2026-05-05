using System;
using DistribuidoraKeppler.Logica;

namespace DistribuidoraKeppler.Vista.Cliente
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            DistribuidoraKeppler.Modelo.Cliente cliente = new DistribuidoraKeppler.Modelo.Cliente
            {
                NombreEmpresa = txtNombreEmpresa.Text,
                Nit = txtNit.Text,
                Direccion = txtDireccion.Text,
                Email = txtEmail.Text,
                Telefono = txtTelefono.Text,
                Imagen = null,  
                Barrio = null    
            };

            ClienteL logica = new ClienteL();
            bool registrado = logica.MtCrearCliente(cliente, txtContrasena.Text);

            if (registrado)
            {
                Response.Write("<script>alert('Cliente registrado correctamente');</script>");
                Response.Redirect("~/Vista/Auth/Login.aspx");
            }
            else
            {
                Response.Write("<script>alert('Error al registrar cliente');</script>");
            }
        }
    }
}
