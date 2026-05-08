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
                                Nombre = dr["Nombre"].ToString(),
                                Descripcion = dr["Descripcion"].ToString() // Jhon
                            });
                        }
                    }
                }
                return categorias;
            }
        }
        public bool EliminarCategoria(int idCategoria)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();
                string consulta = "DELETE FROM Categoria WHERE Id = @Id";
                using (SqlCommand cmd = new SqlCommand(consulta, con))
                {
                    cmd.Parameters.AddWithValue("@Id", idCategoria);
                    int filasAfectadas = cmd.ExecuteNonQuery();
                    return filasAfectadas > 0;
                }
            }
        }
        public bool RegistrarCategoria(Categoria categoria)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();
                string consulta = "INSERT INTO Categoria (Nombre) VALUES (@Nombre)";
                using (SqlCommand cmd = new SqlCommand(consulta, con))
                {
                    cmd.Parameters.AddWithValue("@Nombre", categoria.Nombre);
                    int filasAfectadas = cmd.ExecuteNonQuery();
                    return filasAfectadas > 0;
                }
            }
        }
    }
}