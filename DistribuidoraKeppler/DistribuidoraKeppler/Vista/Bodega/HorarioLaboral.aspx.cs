using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Utilidades;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Bodega
{
    // Página de solo consulta: muestra el horario laboral asignado a un usuario
    // (Bodega o repartidor). Por defecto se ve el propio horario, pero desde el
    // selector de empleado se puede consultar el de cualquier otro trabajador
    // activo. No permite crear, editar ni eliminar horarios.
    public partial class HorarioLaboral : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Solo usuarios autenticados con rol Bodega pueden ver esta página.
            if (Session["Usuario"] == null || SesionHelper.Rol != "Bodega")
            {
                Response.Redirect("~/Vista/Auth/Login.aspx");
                return;
            }

            // La información se carga automáticamente al ingresar (no depende de ninguna acción del usuario).
            if (!IsPostBack)
            {
                MtCargarEmpleados();
                MtCargarHorario(Convert.ToInt32(ddlEmpleado.SelectedValue));
            }
        }

        // Llena el selector con todos los trabajadores activos (Distribuidor/Bodega),
        // dejando preseleccionado al usuario que inició sesión.
        private void MtCargarEmpleados()
        {
            BodegaL oBodegaL = new BodegaL();

            ddlEmpleado.Items.Clear();
            foreach (Modelo.Usuario u in oBodegaL.MtListarRepartidoresActivos())
            {
                ddlEmpleado.Items.Add(new ListItem(u.Nombre, u.Id.ToString()));
            }

            ListItem itemUsuarioActual = ddlEmpleado.Items.FindByValue(SesionHelper.Usuario.Id.ToString());
            if (itemUsuarioActual != null)
            {
                ddlEmpleado.SelectedValue = itemUsuarioActual.Value;
            }
        }

        // Consulta y muestra el horario del empleado seleccionado en el combo.
        private void MtCargarHorario(int idUsuario)
        {
            lblUsuario.Text = ddlEmpleado.SelectedItem != null ? ddlEmpleado.SelectedItem.Text : SesionHelper.Usuario.Nombre;

            BodegaL oBodegaL = new BodegaL();
            List<Modelo.HorarioLaboral> horario = oBodegaL.MtListarHorarioLaboral(idUsuario);

            bool sinHorario = horario.Count == 0;

            // Si el empleado seleccionado no tiene horario asignado, se muestra el mensaje y se oculta la tabla.
            gvHorario.Visible = !sinHorario;
            pnlSinHorario.Visible = sinHorario;

            if (!sinHorario)
            {
                List<object> datos = new List<object>();
                foreach (Modelo.HorarioLaboral h in horario)
                {
                    datos.Add(new
                    {
                        DiaSemana = h.DiaSemana,
                        HoraEntrada = DateTime.Today.Add(h.HoraEntrada).ToString("hh:mm tt"),
                        HoraSalida = DateTime.Today.Add(h.HoraSalida).ToString("hh:mm tt")
                    });
                }

                gvHorario.DataSource = datos;
                gvHorario.DataBind();
            }
        }

        protected void ddlEmpleado_SelectedIndexChanged(object sender, EventArgs e)
        {
            MtCargarHorario(Convert.ToInt32(ddlEmpleado.SelectedValue));
        }
    }
}
