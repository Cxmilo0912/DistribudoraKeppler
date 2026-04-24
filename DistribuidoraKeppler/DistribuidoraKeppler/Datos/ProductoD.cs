using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Datos
{
    public class ProductoD
    {
        public bool MtRegistrarProducto(Producto producto)
        {
            try
            {
                using (var conexion = ConexionDB.MtAbrirConexion())
                {
                    conexion.Open();

                    // 1. Cambiado a "Producto" (singular)
                    // 2. Mantenemos las 8 columnas y 8 valores
                    string query = @"INSERT INTO Producto 
                            (Nombre, Descripcion, Precio, Stock, LimiteVenta, LimiteMinimo, IdCategoria, IdMarca) 
                            VALUES 
                            (@Nombre, @Descripcion, @Precio, @Stock, @LimiteVenta, @LimiteMinimo, @IdCategoria, @IdMarca)";

                    using (var comando = new System.Data.SqlClient.SqlCommand(query, conexion))
                    {
                        comando.Parameters.AddWithValue("@Nombre", producto.Nombre);
                        comando.Parameters.AddWithValue("@Descripcion", producto.Descripcion);
                        comando.Parameters.AddWithValue("@Precio", producto.Precio);
                        comando.Parameters.AddWithValue("@Stock", producto.Stock);
                        comando.Parameters.AddWithValue("@LimiteVenta", producto.LimiteVenta);
                        comando.Parameters.AddWithValue("@LimiteMinimo", producto.LimiteMinimo);
                        comando.Parameters.AddWithValue("@IdCategoria", producto.IdCategoria);
                        comando.Parameters.AddWithValue("@IdMarca", producto.IdMarca);

                        int filasAfectadas = comando.ExecuteNonQuery();
                        return filasAfectadas > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Esto enviará el mensaje de error hacia arriba para que lo veas en el SweetAlert
                throw new Exception("Error en la inserción: " + ex.Message);
            }
        }

        public List<Producto> ListarProductos()
        {
            List<Producto> lista = new List<Producto>();

            using (var conexion = ConexionDB.MtAbrirConexion())
            {
                conexion.Open();

                string query = @"SELECT p.Id, p.Nombre, p.Descripcion, p.Precio, p.Stock, 
                                        p.LimiteVenta, p.LimiteMinimo, p.IdCategoria, p.IdMarca,
                                        m.Nombre AS Marca, c.Nombre AS Categoria
                                 FROM Producto p
                                 LEFT JOIN Marca m ON p.IdMarca = m.Id
                                 LEFT JOIN Categoria c ON p.IdCategoria = c.Id";

                using (var comando = new SqlCommand(query, conexion))
                {
                    SqlDataReader reader = comando.ExecuteReader();

                    while (reader.Read())
                    {
                        lista.Add(new Producto
                        {
                            Id = Convert.ToInt32(reader["Id"]),
                            Nombre = reader["Nombre"].ToString(),
                            Descripcion = reader["Descripcion"].ToString(),
                            Precio = Convert.ToDecimal(reader["Precio"]),
                            Stock = Convert.ToInt32(reader["Stock"]),
                            LimiteVenta = Convert.ToInt32(reader["LimiteVenta"]),
                            LimiteMinimo = Convert.ToInt32(reader["LimiteMinimo"]),
                            IdCategoria = Convert.ToInt32(reader["IdCategoria"]),
                            IdMarca = Convert.ToInt32(reader["IdMarca"]),
                            MarcaNombre = reader["Marca"].ToString(),
                            CategoriaNombre = reader["Categoria"].ToString()
                        });
                    }
                }
            }
            return lista;
        }
    }
}
