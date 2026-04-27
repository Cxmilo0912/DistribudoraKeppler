using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Datos
{
    public class CategoriaD
    {
        public List<Categoria> MtObtenerCategorias()
        {
            List<Categoria> categorias = new List<Categoria>();
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();
                string consulta = "Select * from Categoria";
                using (SqlCommand cmd = new SqlCommand(consulta, con))
                {

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            categorias.Add(new Categoria
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Nombre = dr["Nombre"].ToString()
                            });
                        }
                    }
                }
                return categorias;
            }
        }
    }
}