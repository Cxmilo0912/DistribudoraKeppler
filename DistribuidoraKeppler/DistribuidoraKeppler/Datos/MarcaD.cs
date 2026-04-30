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
            List<Marca> lista = new List<Marca>(); //crea una lista vacia donde guardo los datos 

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string query = "SELECT Id, Nombre  FROM Marca"; //Trae todos los registros de la tabla marca
                using (SqlCommand cmd = new SqlCommand(query, cn)) 
                {
                    SqlDataReader dr = cmd.ExecuteReader(); // ejecuta la consulta y devuelve los datos 

                    while (dr.Read())
                    {
                        Marca m = new Marca() //crea un objeto 
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            Nombre = dr["Nombre"].ToString()
                        };

                        lista.Add(m); // Agrega la marca a la lista 
                    }
                }
            }

            return lista;
        }

        public void InsertarMarca(Marca m)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string query = "INSERT INTO Marca (Nombre) VALUES (@Nombre)"; // Insertar datos 
                using (SqlCommand cmd = new SqlCommand(query, cn))
                {
                    cmd.Parameters.AddWithValue("@Nombre", m.Nombre); // asigna el valor del parametro 
                    cmd.ExecuteNonQuery(); // ejecuta la accion 
                }
            }
        }
    }
}