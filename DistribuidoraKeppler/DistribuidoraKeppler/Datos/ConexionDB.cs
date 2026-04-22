
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Datos
{
    public class ConexionDB
    {
        private static readonly string cadena = System.Configuration.ConfigurationManager.ConnectionStrings["ConexionBD"].ConnectionString;

        public static SqlConnection MtAbrirConexion()
        {
            if (string.IsNullOrEmpty(cadena))
            {
                throw new Exception("La cadena de conexión no se ha configurado correctamente.");
            }

            return new SqlConnection(cadena);
        }

    }
}