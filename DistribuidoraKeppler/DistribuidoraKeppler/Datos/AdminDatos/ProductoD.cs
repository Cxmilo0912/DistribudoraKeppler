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
        public bool MtRegistrarProducto(Producto producto, int idMarca, int idCategoria)
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
                        comando.Parameters.AddWithValue("@IdCategoria", idCategoria);
                        comando.Parameters.AddWithValue("@IdMarca", idMarca);

                        int filasAfectadas = comando.ExecuteNonQuery();
                        return filasAfectadas > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error en la inserción: " + ex.Message);
            }
        }

        public List<Producto> ListarProductos()
        {
            List<Producto> lista = new List<Producto>();

            using (var conexion = ConexionDB.MtAbrirConexion())
            {
                conexion.Open();

                string query = @"SELECT p.Imagen,p.CodigoProducto, p.Id, p.Nombre, p.Descripcion, p.Precio, p.Stock, 
                                        p.LimiteVenta, p.LimiteMinimo, p.IdCategoria, p.IdMarca, p.Estado,
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
                            Imagen = reader["Imagen"].ToString(),
                            CodigoProducto = reader["CodigoProducto"].ToString(),
                            Id = Convert.ToInt32(reader["Id"]),
                            Nombre = reader["Nombre"].ToString(),
                            Descripcion = reader["Descripcion"].ToString(),
                            Precio = Convert.ToDecimal(reader["Precio"]),
                            Stock = Convert.ToInt32(reader["Stock"]),
                            LimiteVenta = Convert.ToInt32(reader["LimiteVenta"]),
                            LimiteMinimo = Convert.ToInt32(reader["LimiteMinimo"]),
                            IdCategoria = new Categoria
                            {
                                Id = Convert.ToInt32(reader["IdCategoria"]),
                            },
                            IdMarca = new Marca
                            {
                                Id = Convert.ToInt32(reader["IdMarca"]),
                            },
                            Estado = reader["Estado"].ToString(),
                            MarcaNombre = reader["Marca"].ToString(),
                            CategoriaNombre = reader["Categoria"].ToString()
                        });
                    }
                }
            }
            return lista;
        }

        // -- PARTE HECHA POR JHON -- INICIO //

        // Metodo para obtener el catalogo de los productos
        public List<Producto> MtObtenerCatalogo(string busqueda, int idCategoria, int idMarca, decimal? precioMin, decimal? precioMax, string orden)
        {
            List<Producto> oLista = new List<Producto>();

            // Whitelist de criterios de orden: nunca se concatena texto proveniente del usuario en el ORDER BY.
            string ordenSql;
            switch (orden)
            {
                case "reciente":
                    ordenSql = "p.Id DESC"; // Aproximación: no existe columna de fecha de creación en Producto
                    break;
                case "mas_comprado":
                    ordenSql = "ISNULL(vc.TotalComprado, 0) DESC";
                    break;
                case "az":
                default:
                    ordenSql = "p.Nombre ASC";
                    break;
            }

            using (var conexion = ConexionDB.MtAbrirConexion())
            {
                conexion.Open();

                string sql = $@"
                SELECT  p.Id, p.Nombre, p.Descripcion, p.Precio,
                        p.Stock, p.Estado, p.Imagen,
                        p.LimiteVenta, p.LimiteMinimo, p.LimiteMaximo,
                        p.IdMarca, p.IdCategoria,
                        m.Nombre  AS NombreMarca,
                        c.Nombre  AS NombreCategoria
                FROM    dbo.Producto  p
                INNER JOIN dbo.Marca     m ON m.Id = p.IdMarca
                INNER JOIN dbo.Categoria c ON c.Id = p.IdCategoria
                LEFT JOIN (
                        SELECT IdProducto, SUM(Cantidad) AS TotalComprado
                        FROM   dbo.DetallePedido
                        GROUP BY IdProducto
                ) vc ON vc.IdProducto = p.Id
                WHERE   p.Estado = 'Activo'
                  AND  (@Busqueda    = ''
                        OR p.Nombre  LIKE '%' + @Busqueda + '%'
                        OR m.Nombre  LIKE '%' + @Busqueda + '%')
                  AND  (@IdCategoria = 0
                        OR p.IdCategoria = @IdCategoria)
                  AND  (@IdMarca = 0
                        OR p.IdMarca = @IdMarca)
                  AND  (@PrecioMin IS NULL
                        OR p.Precio >= @PrecioMin)
                  AND  (@PrecioMax IS NULL
                        OR p.Precio <= @PrecioMax)
                ORDER BY {ordenSql}";

                using (var oCmd = new SqlCommand(sql, conexion))
                {
                    oCmd.Parameters.Add("@Busqueda", SqlDbType.NVarChar).Value = busqueda ?? ""; // Si busqueda es null, se asigna una cadena vacía para evitar errores en la consulta
                    oCmd.Parameters.Add("@IdCategoria", SqlDbType.Int).Value = idCategoria; // Si idCategoria es 0, se considerará como "todas las categorías" en la consulta
                    oCmd.Parameters.Add("@IdMarca", SqlDbType.Int).Value = idMarca; // Si idMarca es 0, se considerará como "todas las marcas" en la consulta
                    oCmd.Parameters.Add("@PrecioMin", SqlDbType.Decimal).Value = (object)precioMin ?? DBNull.Value;
                    oCmd.Parameters.Add("@PrecioMax", SqlDbType.Decimal).Value = (object)precioMax ?? DBNull.Value;
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

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {

                cn.Open();
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


                using (var oCmd = new SqlCommand(sql, cn))
                {
                    oCmd.Parameters.Add("@Id", SqlDbType.Int).Value = id;

                    using (var oDr = oCmd.ExecuteReader())
                    {
                        if (oDr.Read())
                        {
                            oProducto = MtMapear(oDr);
                        }
                    }
                }
            }

            return oProducto;
        }
        // Metodo para obtener las Categorias
        public List<Categoria> MtObtenerCategoria()
        {
            var oLista = new List<Categoria>();

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string sql = @"SELECT Id, Nombre FROM dbo.Categoria ORDER BY Nombre";

                using (var oCmd = new SqlCommand(sql, cn))
                {
                    using (var oDr = oCmd.ExecuteReader())
                    {
                        while (oDr.Read())
                        {
                            oLista.Add(new Categoria
                            {
                                Id = Convert.ToInt32(oDr["Id"]),
                                Nombre = oDr["Nombre"].ToString()
                            });
                        }
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
                IdMarca = new Marca
                {
                    Id = Convert.ToInt32(oDr["IdMarca"])
                },
                IdCategoria = new Categoria
                {
                    Id = Convert.ToInt32(oDr["IdCategoria"])
                },
                MarcaNombre = oDr["NombreMarca"].ToString(),
                CategoriaNombre = oDr["NombreCategoria"].ToString()
            };
        }
        //--FIN DEL CODIGO GENERADO POR JHON --//


        //Camilo
        public bool MtEditarProducto(Producto oProducto)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = @"Update Producto SET 
                Nombre = @Nombre, 
                Descripcion = @Descripcion, 
                Estado = @Estado,
                Precio = @Precio, 
                Stock = @Stock, 
                LimiteMinimo = @lMinimo,
                LimiteVenta = @lVenta,
                IdCategoria = @IdCat,
                IdMarca = @IdMarca,
                Imagen = @Img
                Where Id = @Id";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@Nombre", oProducto.Nombre);
                    cmd.Parameters.AddWithValue("@Descripcion", oProducto.Descripcion);
                    cmd.Parameters.AddWithValue("@Estado", oProducto.Estado);
                    cmd.Parameters.AddWithValue("@Precio", oProducto.Precio);
                    cmd.Parameters.AddWithValue("@Stock", oProducto.Stock);
                    cmd.Parameters.AddWithValue("@lMinimo", oProducto.LimiteMinimo);
                    cmd.Parameters.AddWithValue("@lVenta", oProducto.LimiteVenta);
                    cmd.Parameters.AddWithValue("@IdCat", oProducto.IdCategoria.Id);
                    cmd.Parameters.AddWithValue("@IdMarca", oProducto.IdMarca.Id);
                    cmd.Parameters.AddWithValue("@Img", oProducto.Imagen);
                    cmd.Parameters.AddWithValue("@Id", oProducto.Id);

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }


        public int MtContarProductosTotales()
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                using (SqlCommand cmd = new SqlCommand("spContarTotalProductos", cn))
                {
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }
    }
}
