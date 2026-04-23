using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
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
    }
}