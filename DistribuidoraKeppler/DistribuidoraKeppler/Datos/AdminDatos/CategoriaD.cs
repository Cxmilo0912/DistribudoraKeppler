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
                string consulta = @"SELECT
                                    c.Id,
                                    c.Nombre,
                                    c.Descripcion,
                                    COUNT(p.Id) AS TotalProductos
                                    FROM Categoria c
                                    LEFT JOIN Producto p
                                        ON p.IdCategoria = c.Id
                                    GROUP BY
                                        c.Id,
                                        c.Nombre,
                                        c.Descripcion";
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
                                Descripcion = dr["Descripcion"].ToString(), // Jhon
                                TotalProductos = Convert.ToInt32(dr["TotalProductos"])
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