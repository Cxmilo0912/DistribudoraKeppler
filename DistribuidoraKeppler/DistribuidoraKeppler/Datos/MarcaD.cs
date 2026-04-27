using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Datos
{
    public class MarcaD
    {
        public List<Marca> ListarMarcas()
        {
            List<Marca> lista = new List<Marca>();

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string query = "SELECT Id, Nombre FROM Marca";
                using (SqlCommand cmd = new SqlCommand(query, cn))
                {
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        Marca m = new Marca()
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            Nombre = dr["Nombre"].ToString()
                        };

                        lista.Add(m);
                    }
                }
            }

            return lista;
        }
    }
}