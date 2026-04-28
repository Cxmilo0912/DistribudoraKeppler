using DistribuidoraKeppler.Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica
{
    public class DashboardAdministradorL
    {
        public int MtTotalClientes()
        {
            DashboardAdministradorD dashboardD = new DashboardAdministradorD();
            return dashboardD.ObtenerTotalClientes();
        }

        public int MtProductosActivos()
        {
            DashboardAdministradorD oDBodarAdmin = new DashboardAdministradorD();

            return oDBodarAdmin.MtProductosActivos();
        }
    }
}