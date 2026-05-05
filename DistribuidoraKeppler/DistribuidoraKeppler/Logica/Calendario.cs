using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica
{
    public class Calendario
    {
        public static object ObtenerDatosCalendario()
        {
            DateTime hoy = DateTime.Now;
            // Obtenemos el nombre del mes y año para la cabecera
            string mesAnio = hoy.ToString("MMMM yyyy", new System.Globalization.CultureInfo("es-ES"));

            return new
            {
                MesAnio = mesAnio,
                DiaActual = hoy.Day,
                MesActual = hoy.Month,
                AnioActual = hoy.Year
            };
        }
    }
}