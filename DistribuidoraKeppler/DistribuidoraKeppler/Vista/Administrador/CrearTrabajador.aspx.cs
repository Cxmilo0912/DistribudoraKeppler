using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Administrador
{
    public partial class CrearTrabajador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioL oCrearUsuarioL = new UsuarioL();
            List<Rol> roles = oCrearUsuarioL.MtListarRoles();
            ddlRoles.DataSource = roles.ToList();
            ddlRoles.DataTextField = "Nombre";
            ddlRoles.DataValueField = "Id";
            ddlRoles.DataBind();



        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Modelo.Usuario oUsuario = new Modelo.Usuario
            {
                Nombre = txtNombre.Text,
                Documento = Convert.ToInt32(txtDocumento.Text),
                Estado = 1,
                Email = txtEmail.Text,
                Contrasena = HashHelper.Encriptar(txtContraseña.Text)
            };
            UsuarioL oCrearUsuarioL = new UsuarioL();

            bool resultado = oCrearUsuarioL.MtCrearUsuario(oUsuario, Convert.ToInt32(ddlRoles.SelectedValue));

            if (resultado)
            {
                string script = @"Swal.fire({
                icon: 'success',
                title: '¡Éxito!',
                text: 'Usuario creado con éxito',
                confirmButtonText: 'Aceptar'
                }).then((result) => {
                if (result.isConfirmed) {
                window.location.href = 'GestionUsuarios.aspx';
                }
                });";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
        }
    }
}
