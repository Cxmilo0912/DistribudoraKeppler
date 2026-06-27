using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Auth
{
    public partial class SeleccionRol : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Rol> roles = Session["RolesDisponibles"] as List<Rol>;
                if (roles == null) { Response.Redirect("~/Vista/Auth/Login.aspx"); return; }

                string rolId = Request.QueryString["rolId"];

                if (!string.IsNullOrEmpty(rolId))
                {
                    Rol rolElegido = roles.FirstOrDefault(r => r.Id == Convert.ToInt32(rolId));

                    if (rolElegido != null)
                    {
                        Session["Rol"] = rolElegido.Nombre;
                        Session["Usuario"] = Session["UsuarioTemporal"];
                        Session.Remove("RolesDisponibles");
                        Session.Remove("UsuarioTemporal");

                        switch (rolElegido.Nombre.ToLower())
                        {
                            case "administrador": Response.Redirect("~/Vista/Administrador/DashboardAdministrador.aspx"); break;
                            case "bodega": Response.Redirect("~/Vista/Bodega/DashboardBodega.aspx"); break;
                            case "preventista": Response.Redirect("~/Vista/Preventista/Preventista.aspx"); break;
                            case "repartidor": Response.Redirect("~/Vista/Repartidor/Repartidor.aspx"); break;
                        }
                    }
                }
                else
                {
                    rptRoles.DataSource = roles;
                    rptRoles.DataBind();
                }
            }
        }
    }
}