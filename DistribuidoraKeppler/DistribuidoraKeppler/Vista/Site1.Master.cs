using System;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using DistribuidoraKeppler.Utilidades;

namespace DistribuidoraKeppler.Vista
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConfigurarMenuSegunRol();
                CargarCalendario();
            }
        }

        private void ConfigurarMenuSegunRol()
        {
            string rol = SesionHelper.Rol; // Obtener el rol del usuario desde la sesión

            // Resetear visibilidad
            menuAdmin.Visible = false;
            menuCliente.Visible = false;
            menuRepartidor.Visible = false;
            menuPreventista.Visible = false;
            menuBodega.Visible = false;

            if (string.IsNullOrEmpty(rol))
            {
                // Opcional: Redirigir al login si no hay sesión
                // Response.Redirect("~/Vista/Auth/Login.aspx");
                return;
            }

            switch (rol)
            {
                case "Administrador":
                    menuAdmin.Visible = true;
                    break;
                case "Cliente":
                    menuCliente.Visible = true;
                    break;
                case "Repartidor":
                    menuRepartidor.Visible = true;
                    break;
                case "Preventista":
                    menuPreventista.Visible = true;
                    break;
                case "Bodega":
                    menuBodega.Visible = true;
                    break;
            }
        }

        private void CargarCalendario()
        {
            DateTime hoy = DateTime.Now;
            // Configurar el nombre del mes y año (Ej: MAYO 2026)
            lblMesAnio.Text = hoy.ToString("MMMM yyyy").ToUpper();

            DateTime primerDiaMes = new DateTime(hoy.Year, hoy.Month, 1);
            int diasEnMes = DateTime.DaysInMonth(hoy.Year, hoy.Month);

            // Obtener el día de la semana (ajustado para que Lunes sea 0)
            int diaInicioSemana = ((int)primerDiaMes.DayOfWeek + 6) % 7;

            StringBuilder htmlCalendario = new StringBuilder();

            // 1. Espacios en blanco para los días antes del inicio del mes
            for (int i = 0; i < diaInicioSemana; i++)
            {
                htmlCalendario.Append("<div class='py-1'></div>");
            }

            // 2. Generar los números de los días
            for (int dia = 1; dia <= diasEnMes; dia++)
            {
                bool esHoy = (dia == hoy.Day);
                string estiloDia = esHoy
                    ? "bg-blue-600 text-white font-bold rounded-full shadow-md w-6 h-6 flex items-center justify-center mx-auto"
                    : "text-gray-700 hover:bg-gray-300 rounded-full w-6 h-6 flex items-center justify-center mx-auto transition-all cursor-default";

                htmlCalendario.Append($@"
                    <div class='py-1 flex justify-center items-center'>
                        <span class='{estiloDia}'>{dia}</span>
                    </div>");
            }

            ltlDiasCalendario.Text = htmlCalendario.ToString();
        }

        // CERRAR SESIÓN CON SWEET ALERT
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();

            // Script para mostrar alerta y luego redirigir
            string script = @"
                Swal.fire({
                    title: 'Sesión cerrada',
                    text: 'Has cerrado sesión correctamente',
                    icon: 'success',
                    confirmButtonColor: '#1e3a8a',
                    confirmButtonText: 'Entendido'
                }).then((result) => {
                    window.location.href = '" + ResolveUrl("~/Vista/Auth/Login.aspx") + @"';
                });
            ";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "logout", script, true);
        }
    }
}