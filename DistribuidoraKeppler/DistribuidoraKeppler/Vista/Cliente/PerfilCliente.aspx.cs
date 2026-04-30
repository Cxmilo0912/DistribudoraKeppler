using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Utilidades;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Cliente
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Postback para evitar recargar los datos cada vez que se envía un formulario
            if (!IsPostBack)
            {
                var c = SesionHelper.Cliente; // Obtener el cliente de la sesión

                if (c == null)
                {
                    Response.Redirect("/Vista/Auth/Login.aspx"); // Redirigir al login si no hay cliente en sesión
                }
                else
                {
                    // Mostrar los datos del cliente en los controles de la página
                    lblEmpresa.Text = c.NombreEmpresa;
                    lblEmail.Text = c.Email;
                    lblTelefono.Text = c.Telefono;
                    lblDireccion.Text = c.Direccion;

                    imgPerfil.ImageUrl = string.IsNullOrEmpty(c.Imagen) ? "/Imagenes/default-profile.png" : c.Imagen; // Mostrar foto de perfil o imagen por defecto
                }
            }
        }
    }
       
}