using System;
using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;

namespace DistribuidoraKeppler.Vista
{
    public partial class RegistrarCliente : System.Web.UI.Page
    {
        ClienteD clienteD = new ClienteD();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtNombreEmpresa.Text = "";
                txtNit.Text = "";
                txtDireccion.Text = "";
                txtEmail.Text = "";
                txtTelefono.Text = "";
                txtContrasena.Text = "";
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Cliente nuevo = new Cliente
            {
                NombreEmpresa = txtNombreEmpresa.Text,
                Nit = txtNit.Text,
                Direccion = txtDireccion.Text,
                Email = txtEmail.Text,
                Telefono = txtTelefono.Text,
                Contrasena = txtContrasena.Text
            };

            bool registrado = clienteD.RegistrarCliente(nuevo);

            string script = registrado
                ? "Swal.fire('Éxito','Cliente registrado correctamente','success');"
                : "Swal.fire('Error','No se pudo registrar el cliente','error');";

            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }
    }
}
