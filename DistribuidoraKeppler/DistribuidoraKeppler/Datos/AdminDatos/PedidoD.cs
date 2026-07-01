using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Datos
{
    public class PedidoD
    {
        public int MtCrearPedido(Pedido oPedido, List<DetallePedido> oDetalles)
        {
            try
            {
                using (SqlConnection cn = ConexionDB.MtAbrirConexion())
                {
                    cn.Open();
                    int idPedido = 0;

                    string consultaPedido = @"Insert Into Pedido (Fecha, Estado, DireccionEntrega, Total, IdCliente)
                                        Values (@fecha, @estado, @direccion, @total, @idCliente);
                                        Select SCOPE_IDENTITY()";

                    string consultaDetalles = @"Insert Into DetallePedido (Cantidad, PrecioUnitario, IdPedido, IdProducto)
                                          Values (@cantidad, @precio, @idPedido, @idProducto)";

                    using (SqlCommand cmdPedido = new SqlCommand(consultaPedido, cn))
                    {
                        cmdPedido.Parameters.AddWithValue("@fecha", oPedido.Fecha);
                        cmdPedido.Parameters.AddWithValue("@estado", oPedido.Estado);
                        cmdPedido.Parameters.AddWithValue("@direccion", oPedido.DireccionEntrega);
                        cmdPedido.Parameters.AddWithValue("@total", oPedido.Total);
                        cmdPedido.Parameters.AddWithValue("@idCliente", oPedido.IdCliente.Id);

                        idPedido = Convert.ToInt32(cmdPedido.ExecuteScalar());

                    }

                    foreach (DetallePedido detalle in oDetalles)
                    {
                        using (SqlCommand cmdDetalle = new SqlCommand(consultaDetalles, cn))
                        {
                            cmdDetalle.Parameters.AddWithValue("@cantidad", detalle.Cantidad);
                            cmdDetalle.Parameters.AddWithValue("@precio", detalle.PrecioUnitario);
                            cmdDetalle.Parameters.AddWithValue("@idPedido", idPedido);
                            cmdDetalle.Parameters.AddWithValue("@idProducto", detalle.IdProducto.Id);

                            cmdDetalle.ExecuteNonQuery();
                        }
                    }
                    return idPedido;
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return 0;
            }
        }


        public bool MtActualizarPedido(Pedido oPedido)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                string consulta = @"BEGIN TRY
                                    BEGIN TRANSACTION;

                                    UPDATE Pedido 
                                    SET Estado = @estado
                                    WHERE Id = @idPedido;

                                    INSERT INTO PedidoMetodoPago (IdPedido, IdMetodoPago) 
                                    VALUES (@idPedido, @mPago);

                                    COMMIT TRANSACTION;
                                    END TRY
                                    BEGIN CATCH
                                    IF @@TRANCOUNT > 0
                                    BEGIN
                                    ROLLBACK TRANSACTION;
                                    END

                                    ;THROW;
                                    END CATCH;
                                    ";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@estado", oPedido.Estado);
                    cmd.Parameters.AddWithValue("@idPedido", oPedido.Id);
                    cmd.Parameters.AddWithValue("@mPago", oPedido.IdMetodoPago);

                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        //=== Metodos creado por Jhon ===
        public List<Pedido> MtListarPedidos()
        {
            List<Pedido> lista = new List<Pedido>();

            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = @"SELECT p.Id,
                                           p.CodigoPedido,
                                           p.Fecha,
                                           p.Estado,
                                           p.DireccionEntrega,
                                           p.Total,
                                           c.Id         AS IdCliente,
                                           c.NombreEmpresa,
                                           c.Email      AS EmailCliente
                                    FROM   Pedido p
                                    INNER JOIN Cliente c ON c.Id = p.IdCliente
                                    ORDER  BY p.Fecha DESC";

                SqlCommand cmd = new SqlCommand(consulta, conn);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new Pedido()
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        CodigoPedido = dr["CodigoPedido"].ToString(),
                        Fecha = Convert.ToDateTime(dr["Fecha"]),
                        Estado = dr["Estado"].ToString(),
                        DireccionEntrega = dr["DireccionEntrega"] == DBNull.Value ? "" : dr["DireccionEntrega"].ToString(),
                        Total = Convert.ToDecimal(dr["Total"]),
                        IdCliente = new Cliente
                        {
                            Id = Convert.ToInt32(dr["IdCliente"]),
                            NombreEmpresa = dr["NombreEmpresa"].ToString(),
                            Email = dr["EmailCliente"] == DBNull.Value ? "" : dr["EmailCliente"].ToString()
                        }
                    });
                }
            }
            return lista;
        }

        public bool MtCambiarEstadoPedido(int idPedido, string nuevoEstado)
        {
            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = "UPDATE Pedido SET Estado = @estado WHERE Id = @id";

                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("@estado", nuevoEstado);
                cmd.Parameters.AddWithValue("@id", idPedido);

                return cmd.ExecuteNonQuery() > 0;
            }
        }
        //=== Metodos creados por Jhon ===

        //=== Metodos creados por Andres ===
        public List<Pedido> MtListarPedidosPorCliente(int idCliente)
        {
            List<Pedido> lista = new List<Pedido>();

            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = @"SELECT p.Id,
                                           p.CodigoPedido,
                                           p.Fecha,
                                           p.Estado,
                                           p.DireccionEntrega,
                                           p.Total,
                                           c.Id         AS IdCliente,
                                           c.NombreEmpresa,
                                           c.Email      AS EmailCliente,
                                           b.Id         AS IdBarrio,
                                           b.Nombre     AS BarrioNombre
                                    FROM   Pedido p
                                    INNER JOIN Cliente c ON c.Id = p.IdCliente
                                    LEFT JOIN  Barrio  b ON b.Id = c.IdBarrio
                                    WHERE  p.IdCliente = @idCliente
                                    ORDER  BY p.Fecha DESC";

                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("@idCliente", idCliente);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new Pedido()
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        CodigoPedido = dr["CodigoPedido"].ToString(),
                        Fecha = Convert.ToDateTime(dr["Fecha"]),
                        Estado = dr["Estado"].ToString(),
                        DireccionEntrega = dr["DireccionEntrega"] == DBNull.Value ? "" : dr["DireccionEntrega"].ToString(),
                        Total = Convert.ToDecimal(dr["Total"]),
                        IdCliente = new Cliente
                        {
                            Id = Convert.ToInt32(dr["IdCliente"]),
                            NombreEmpresa = dr["NombreEmpresa"].ToString(),
                            Email = dr["EmailCliente"] == DBNull.Value ? "" : dr["EmailCliente"].ToString(),
                            Barrio = dr["IdBarrio"] == DBNull.Value ? null : new Barrio
                            {
                                Id = Convert.ToInt32(dr["IdBarrio"]),
                                Nombre = dr["BarrioNombre"].ToString()
                            }
                        }
                    });
                }
            }
            return lista;
        }

        public List<DetallePedido> MtObtenerDetallesPedido(int idPedido)
        {
            List<DetallePedido> lista = new List<DetallePedido>();

            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = @"SELECT dp.Id,
                                           dp.Cantidad,
                                           dp.PrecioUnitario,
                                           pr.Id     AS IdProducto,
                                           pr.Nombre AS NombreProducto,
                                           pr.Imagen AS ImagenProducto
                                    FROM   DetallePedido dp
                                    INNER JOIN Producto pr ON pr.Id = dp.IdProducto
                                    WHERE  dp.IdPedido = @idPedido";

                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("@idPedido", idPedido);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new DetallePedido()
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        Cantidad = Convert.ToInt32(dr["Cantidad"]),
                        PrecioUnitario = Convert.ToDecimal(dr["PrecioUnitario"]),
                        IdProducto = new Producto
                        {
                            Id = Convert.ToInt32(dr["IdProducto"]),
                            Nombre = dr["NombreProducto"].ToString(),
                            Imagen = dr["ImagenProducto"] == DBNull.Value ? "" : dr["ImagenProducto"].ToString()
                        }
                    });
                }
            }
            return lista;
        }
        //=== Metodos creados por Andres ===

        //=== Metodos para cancelacion de pedido por el cliente ===
        public Pedido MtObtenerPedidoPorId(int idPedido)
        {
            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = @"SELECT Id, CodigoPedido, Fecha, Estado, DireccionEntrega, Total, IdCliente
                                    FROM   Pedido
                                    WHERE  Id = @idPedido";

                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("@idPedido", idPedido);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    return new Pedido()
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        CodigoPedido = dr["CodigoPedido"].ToString(),
                        Fecha = Convert.ToDateTime(dr["Fecha"]),
                        Estado = dr["Estado"].ToString(),
                        DireccionEntrega = dr["DireccionEntrega"] == DBNull.Value ? "" : dr["DireccionEntrega"].ToString(),
                        Total = Convert.ToDecimal(dr["Total"]),
                        IdCliente = new Cliente { Id = Convert.ToInt32(dr["IdCliente"]) }
                    };
                }
            }
            return null;
        }

        public bool MtCancelarPedido(int idPedido)
        {
            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = "UPDATE Pedido SET Estado = 'Cancelado' WHERE Id = @idPedido";

                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("@idPedido", idPedido);

                return cmd.ExecuteNonQuery() > 0;
            }
        }
        //=== Metodos para cancelacion de pedido por el cliente ===
    }
}