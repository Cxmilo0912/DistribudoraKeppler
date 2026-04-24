using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Cliente
{
    public partial class EditarPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (Session["SesionCliente"] == null)
            {
                Response.Redirect("~/Vista/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                CargarBarrios();
                CargarDatosActuales();
            }
        }

        private void CargarBarrios()
        {
            ClienteD datos = new ClienteD();
            var barrios = datos.ObtenerBarrios();

            ddlBarrio.DataSource = barrios;
            ddlBarrio.DataTextField = "Nombre";   // propiedad del objeto Barrio
            ddlBarrio.DataValueField = "Id";
            ddlBarrio.DataBind();

            // Opción inicial
            ddlBarrio.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Seleccione un barrio --", "0"));
        }

        private void CargarDatosActuales()
        {
            // Pre-rellena el formulario con los datos actuales del cliente
            Modelo.Cliente cliente = (Modelo.Cliente)Session["SesionCliente"];

            txtNombreEmpresa.Text = cliente.NombreEmpresa;
            txtEmail.Text = cliente.Email;
            txtTelefono.Text = cliente.Telefono;
            txtDireccion.Text = cliente.Direccion;

            // Selecciona el barrio actual en el DropDown
            if (cliente.Barrio != null)
                ddlBarrio.SelectedValue = cliente.Barrio.Id.ToString();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            Modelo.Cliente cliente = (Modelo.Cliente)Session["SesionCliente"];

            // Actualiza los campos con los nuevos valores
            cliente.NombreEmpresa = txtNombreEmpresa.Text.Trim();
            cliente.Email = txtEmail.Text.Trim();
            cliente.Telefono = txtTelefono.Text.Trim();
            cliente.Direccion = txtDireccion.Text.Trim();
            cliente.Barrio = new Barrio
            {
                Id = Convert.ToInt32(ddlBarrio.SelectedValue),
                Nombre = ddlBarrio.SelectedItem.Text
            };

            ClienteD datos = new ClienteD();
            bool actualizado = datos.ActualizarCliente(cliente);

            if (actualizado)
            {
                // ✅ Actualiza la Session con los nuevos datos
                Session["SesionCliente"] = cliente;
                Response.Redirect("~/Vista/Cliente/PerfilCliente.aspx");
            }
            else
            {
                pnlError.Visible = true;
                lblError.Text = "No se pudo actualizar. Intente nuevamente.";
            }
        }
      
    }
}