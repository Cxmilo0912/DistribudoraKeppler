using DistribuidoraKeppler.Modelo;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Datos
{
    public class ProductoD
    {
        private readonly string _conn = ConfigurationManager.ConnectionStrings["ConexionDB"].ConnectionString;
        public bool MtRegistrarProducto(Producto producto)
        {
            try
            {
                using (var conexion = ConexionDB.MtAbrirConexion())
                {
                    conexion.Open();
                    string query = @"INSERT INTO Producto 
                            (Nombre, Descripcion, Precio, Stock, Estado, LimiteVenta, LimiteMinimo, IdCategoria, IdMarca) 
                            VALUES 
                            (@Nombre, @Descripcion, @Precio, @Stock, @Estado, @LimiteVenta, @LimiteMinimo, @IdCategoria, @IdMarca)";

                    using (var comando = new System.Data.SqlClient.SqlCommand(query, conexion))
                    {
                        comando.Parameters.AddWithValue("@Nombre", producto.Nombre);
                        comando.Parameters.AddWithValue("@Descripcion", producto.Descripcion);
                        comando.Parameters.AddWithValue("@Precio", producto.Precio);
                        comando.Parameters.AddWithValue("@Stock", producto.Stock);
                        comando.Parameters.AddWithValue("@Estado", producto.Estado);
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

        public bool EliminarProducto(int id)
        {
            try
            {
                using (var conexion = ConexionDB.MtAbrirConexion())
                {
                    conexion.Open();
                    string query = "DELETE FROM Producto WHERE Id = @Id";
                    using (var comando = new SqlCommand(query, conexion))
                    {
                        comando.Parameters.AddWithValue("@Id", id);
                        int filasAfectadas = comando.ExecuteNonQuery();
                        return filasAfectadas > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al eliminar el producto: " + ex.Message);
            }
        }

        // -- PARTE HECHA POR JHON -- INICIO //

        // Metodo para obtener el catalogo de los productos
        public List<Producto> MtObtenerCatalogo(string busqueda, int idCategoria)
        {
            List<Producto> oLista = new List<Producto>();

            using (var conexion = ConexionDB.MtAbrirConexion())
            {


                string sql = @"
                SELECT  p.Id, p.Nombre, p.Descripcion, p.Precio,
                        p.Stock, p.Estado, p.Imagen,
                        p.LimiteVenta, p.LimiteMinimo, p.LimiteMaximo,
                        p.IdMarca, p.IdCategoria,
                        m.Nombre  AS NombreMarca,
                        c.Nombre  AS NombreCategoria
                FROM    dbo.Producto  p
                INNER JOIN dbo.Marca     m ON m.Id = p.IdMarca
                INNER JOIN dbo.Categoria c ON c.Id = p.IdCategoria
                WHERE   p.Estado = 'Activo'
                  AND  (@Busqueda    = ''
                        OR p.Nombre  LIKE '%' + @Busqueda + '%'
                        OR m.Nombre  LIKE '%' + @Busqueda + '%')
                  AND  (@IdCategoria = 0
                        OR p.IdCategoria = @IdCategoria)
                ORDER BY p.Nombre";

                using (var oCon = new SqlConnection(_conn))
                using (var oCmd = new SqlCommand(sql, oCon))
                {
                    oCmd.Parameters.Add("@Busqueda", SqlDbType.NVarChar).Value = busqueda ?? ""; // Si busqueda es null, se asigna una cadena vacía para evitar errores en la consulta
                    oCmd.Parameters.Add("@IdCategoria", SqlDbType.Int).Value = idCategoria; // Si idCategoria es 0, se considerará como "todas las categorías" en la consulta
                    oCon.Open();

                    using (var oDr = oCmd.ExecuteReader())
                    {
                        while (oDr.Read())
                        {
                            oLista.Add(MtMapear(oDr));
                        }
                    }

                }
            }
            return oLista;
        }

        // Metodo para Obtener los productos por Id
        public Producto MtObtenerPorId(int id)
        {
            Producto oProducto = null;

            string sql = @"
                SELECT  p.Id, p.Nombre, p.Descripcion, p.Precio,
                        p.Stock, p.Estado, p.Imagen,
                        p.LimiteVenta, p.LimiteMinimo, p.LimiteMaximo,
                        p.IdMarca, p.IdCategoria,
                        m.Nombre  AS NombreMarca,
                        c.Nombre  AS NombreCategoria
                FROM    dbo.Producto  p
                INNER JOIN dbo.Marca     m ON m.Id = p.IdMarca
                INNER JOIN dbo.Categoria c ON c.Id = p.IdCategoria
                WHERE   p.Id = @Id";

            using (var oCon = new SqlConnection(_conn))
            using (var oCmd = new SqlCommand(sql, oCon))
            {
                oCmd.Parameters.Add("@Id", SqlDbType.Int).Value = id;
                oCon.Open();

                using (var oDr = oCmd.ExecuteReader())
                {
                    if (oDr.Read())
                    {
                        oProducto = MtMapear(oDr);
                    }
                }
            }

            return oProducto;
        }
         // Metodo para obtener las Categorias
         public List<Categoria> MtObtenerCategoria()
        {
            var oLista = new List<Categoria>();

            string sql = @"SELECT Id, Nombre FROM dbo.Categoria ORDER BY Nombre";

            using (var oCon = new SqlConnection(_conn))
            using (var oCmd = new SqlCommand(sql, oCon))
            {
                oCon.Open();
                using (var oDr = oCmd.ExecuteReader())
                {
                    while (oDr.Read())
                    {
                        oLista.Add(new Categoria
                        {
                            Id = (int)oDr["Id"],
                            Nombre = oDr["Nombre"].ToString()
                        });
                    }
                }
            }
            return oLista;
        }


        // Metodo para Mapear el DataRead
        private Producto MtMapear(SqlDataReader oDr)
        {
            return new Producto
            {
                Id = (int)oDr["Id"],
                Nombre = oDr["Nombre"].ToString(),
                Descripcion = oDr["Descripcion"].ToString(),
                Precio = (decimal)oDr["Precio"],
                Stock = (int)oDr["Stock"],
                Estado = oDr["Estado"].ToString(),
                Imagen = oDr["Imagen"] == DBNull.Value
                                      ? null
                                      : oDr["Imagen"].ToString(),
                LimiteVenta = Convert.ToInt32(oDr["LimiteVenta"]),
                LimiteMinimo = Convert.ToInt32(oDr["LimiteMinimo"]),
                LimiteMaximo = oDr["LimiteMaximo"] == DBNull.Value
                                      ? (int?)null
                                      : Convert.ToInt32(oDr["LimiteMaximo"]),
                IdMarca = (int)oDr["IdMarca"],
                IdCategoria = (int)oDr["IdCategoria"],
                MarcaNombre = oDr["NombreMarca"].ToString(),
                CategoriaNombre = oDr["NombreCategoria"].ToString()
            };
        }
        //--FIN DEL CODIGO GENERADO POR JHON --//
    }
}
