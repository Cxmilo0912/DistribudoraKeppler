using DistribuidoraKeppler.Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica
{
    public class DashboardAdministradorL
    {
        DashboardAdministradorD dashboardD = new DashboardAdministradorD();
        public int MtTotalClientes()
        {

            return dashboardD.ObtenerTotalClientes();
        }

        public int MtProductosActivos()
        {
            return dashboardD.MtProductosActivos();
        }
        public int MtProductosTotales()
        {
            return dashboardD.MtTotalProductos();
        }
    }
}