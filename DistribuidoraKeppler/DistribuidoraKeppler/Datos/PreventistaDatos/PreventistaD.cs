using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Datos.PreventistaDatos
{
    public class PreventistaD
    {
        public decimal MtVentasTotalesPorDia(int idUsuario)
        {
            decimal total = 0;

            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = @"SELECT ISNULL(SUM(p.Total), 0)
                                    FROM   UsuarioPedido up
                                    INNER  JOIN Pedido p ON p.Id = up.IdPedido
                                    WHERE  up.IdUsuario    = @idUsuario
                                    AND    up.FechaPreventa = CAST(GETDATE() AS DATE)";

                SqlCommand cmd = new SqlCommand(consulta, conn);

                cmd.Parameters.AddWithValue("@idUsuario", idUsuario);

                total = Convert.ToDecimal(cmd.ExecuteScalar());
            }

            return total;
        }

        public int MtTotalPedidosHoy(int idUsuario)
        {
            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = @"SELECT COUNT(up.Id)
                                    FROM   UsuarioPedido up
                                    WHERE  up.IdUsuario    = @idUsuario
                                    AND    up.FechaPreventa = CAST(GETDATE() AS DATE)";

                SqlCommand cmd = new SqlCommand(consulta, conn);

                cmd.Parameters.AddWithValue("@idUsuario", idUsuario);

                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public int MtTotalClientesAtendidos(int idUsuario)
        {
            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = @"SELECT COUNT(DISTINCT p.IdCliente)
                                    FROM   UsuarioPedido up
                                    INNER  JOIN Pedido p ON p.Id = up.IdPedido
                                    WHERE  up.IdUsuario    = @idUsuario
                                    AND    up.FechaPreventa = CAST(GETDATE() AS DATE)";
                SqlCommand cmd = new SqlCommand(consulta, conn);

                cmd.Parameters.AddWithValue("@idUsuario", idUsuario);

                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public Sector MtObtenerSectorDelDia(int idUsuario)
        {
            Sector sector = null;
            string[] dias = { "Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado" };
            string diaActual = dias[(int)DateTime.Now.DayOfWeek];

            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = @"SELECT s.Id, s.Nombre, s.DiasVisita, s.CapacidadMaxima, s.Estado
                                    FROM   AsignarSector asg
                                    INNER  JOIN Sector s ON s.Id = asg.IdSector
                                    WHERE  asg.IdUsuario = @idUsuario
                                    AND    s.DiasVisita LIKE '%' + @diaHoy + '%'
                                    AND    s.Estado = 1";
                SqlCommand cmd = new SqlCommand(consulta, conn);

                cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
                cmd.Parameters.AddWithValue("@diaHoy", diaActual);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    return sector = new Sector()
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        Nombre = dr["Nombre"] == DBNull.Value ? "" : dr["Nombre"].ToString(),
                        DiasVisita = dr["DiasVisita"] == DBNull.Value ? "" : dr["DiasVisita"].ToString(),
                        CapacidadMaxima = dr["CapacidadMaxima"] == DBNull.Value ? 0 : Convert.ToInt32(dr["CapacidadMaxima"]),
                        Estado = dr["Estado"] != DBNull.Value && Convert.ToBoolean(dr["Estado"])
                    };
                }

                // Cargar los barrios que componen el sector
                sector.Barrios = new List<Barrio>();
                string consultaBarrios = "SELECT Id, Nombre FROM Barrio WHERE IdSector = @idSector ORDER BY Nombre";
                using (SqlCommand cmdB = new SqlCommand(consultaBarrios, conn))
                {
                    cmdB.Parameters.AddWithValue("@idSector", sector.Id);
                    using (SqlDataReader drB = cmdB.ExecuteReader())
                    {
                        while (drB.Read())
                        {
                            sector.Barrios.Add(new Barrio
                            {
                                Id = Convert.ToInt32(drB["Id"]),
                                Nombre = drB["Nombre"] == DBNull.Value ? "" : dr["Nombre"].ToString()
                            });
                        }
                    }
                }

                return sector;

            }
        }
        public List<Pedido> MtActividadHoy(int idUsuario)
        {
            List<Pedido> lista = new List<Pedido>();

            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = @"SELECT p.Id, p.CodigoPedido, p.Fecha, p.Estado, p.Total,
                                           c.Id AS IdCliente, c.NombreEmpresa, c.Direccion
                                    FROM   UsuarioPedido up
                                    INNER  JOIN Pedido p  ON p.Id = up.IdPedido
                                    INNER  JOIN Cliente c ON c.Id = p.IdCliente
                                    WHERE  up.IdUsuario     = @idUsuario
                                    AND    up.FechaPreventa = CAST(GETDATE() AS DATE)
                                    ORDER  BY p.Id DESC";

                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("@idUsuario", idUsuario);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        lista.Add(new Pedido
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            CodigoPedido = dr["CodigoPedido"].ToString(),
                            Fecha = Convert.ToDateTime(dr["Fecha"]),
                            Estado = dr["Estado"] == DBNull.Value ? "" : dr["Estado"].ToString(),
                            Total = dr["Total"] == DBNull.Value ? 0 : Convert.ToDecimal(dr["Total"]),
                            IdCliente = new Cliente
                            {
                                Id = Convert.ToInt32(dr["IdCliente"]),
                                NombreEmpresa = dr["NombreEmpresa"].ToString(),
                                Direccion = dr["Direccion"] == DBNull.Value ? "" : dr["Direccion"].ToString()
                            }
                        });
                    }
                }
            }

            return lista;
        }

        public List<Cliente> MtListarClientesAsociados(int idUsuario)
        {
            List<Cliente> lista = new List<Cliente>();

            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = @"SELECT c.Id, c.NombreEmpresa, c.Nit, c.Direccion, c.Email, c.Telefono, c.Imagen,
                                           b.Id AS BarrioId, b.Nombre AS BarrioNombre
                                    FROM   DistribuidorCliente dc
                                    INNER  JOIN Cliente c ON c.Id = dc.IdCliente
                                    LEFT   JOIN Barrio  b ON b.Id = c.IdBarrio
                                    WHERE  dc.IdUsuario = @idUsuario
                                    ORDER  BY c.NombreEmpresa";

                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("@idUsuario", idUsuario);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        lista.Add(new Cliente
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            NombreEmpresa = dr["NombreEmpresa"].ToString(),
                            Nit = dr["Nit"] == DBNull.Value ? "" : dr["Nit"].ToString(),
                            Direccion = dr["Direccion"] == DBNull.Value ? "" : dr["Direccion"].ToString(),
                            Email = dr["Email"] == DBNull.Value ? "" : dr["Email"].ToString(),
                            Telefono = dr["Telefono"] == DBNull.Value ? "" : dr["Telefono"].ToString(),
                            Imagen = dr["Imagen"] == DBNull.Value ? "" : dr["Imagen"].ToString(),
                            Barrio = dr["BarrioId"] == DBNull.Value ? null : new Barrio
                            {
                                Id = Convert.ToInt32(dr["BarrioId"]),
                                Nombre = dr["BarrioNombre"].ToString()
                            }
                        });
                    }
                }
            }

            return lista;
        }

        public bool MtClienteYaAsociado(int idUsuario, int idCliente)
        {
            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();
                string consulta = "SELECT COUNT(1) FROM DistribuidorCliente WHERE IdUsuario = @idUsuario AND IdCliente = @idCliente";
                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
                cmd.Parameters.AddWithValue("@idCliente", idCliente);
                return Convert.ToInt32(cmd.ExecuteScalar()) > 0;
            }
        }

        public void MtAsociarClientePreventista(int idUsuario, int idCliente)
        {
            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();
                string consulta = "INSERT INTO DistribuidorCliente (IdUsuario, IdCliente) VALUES (@idUsuario, @idCliente)";
                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
                cmd.Parameters.AddWithValue("@idCliente", idCliente);
                cmd.ExecuteNonQuery();
            }
        }

        public int MtCrearCliente(Cliente cliente)
        {
            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = @"INSERT INTO Cliente (NombreEmpresa, Nit, Direccion, Email, Contrasena, Telefono, Imagen, IdBarrio)
                                    VALUES (@nombre, @nit, @direccion, @email, @contrasena, @telefono, @imagen, @idBarrio);
                                    SELECT CAST(SCOPE_IDENTITY() AS INT)";

                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("@nombre", cliente.NombreEmpresa);
                cmd.Parameters.AddWithValue("@nit", string.IsNullOrEmpty(cliente.Nit) ? (object)DBNull.Value : cliente.Nit);
                cmd.Parameters.AddWithValue("@direccion", cliente.Direccion ?? "");
                cmd.Parameters.AddWithValue("@email", string.IsNullOrEmpty(cliente.Email) ? (object)DBNull.Value : cliente.Email);
                cmd.Parameters.AddWithValue("@contrasena", string.IsNullOrEmpty(cliente.Contrasena) ? (object)DBNull.Value : cliente.Contrasena);
                cmd.Parameters.AddWithValue("@telefono", cliente.Telefono ?? "");
                cmd.Parameters.AddWithValue("@imagen", DBNull.Value);
                cmd.Parameters.AddWithValue("@idBarrio", cliente.Barrio != null && cliente.Barrio.Id > 0 ? (object)cliente.Barrio.Id : (object)DBNull.Value);

                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public List<Barrio> MtListarBarrios()
        {
            List<Barrio> lista = new List<Barrio>();

            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();
                string consulta = "SELECT Id, Nombre FROM Barrio ORDER BY Nombre";
                SqlCommand cmd = new SqlCommand(consulta, conn);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        lista.Add(new Barrio
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            Nombre = dr["Nombre"].ToString()
                        });
                    }
                }
            }

            return lista;
        }

        public List<Pedido> MtListarPedidosPreventista(int idUsuario)
        {
            List<Pedido> lista = new List<Pedido>();
            Dictionary<int, Pedido> mapaPedidos = new Dictionary<int, Pedido>();

            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();

                string consulta = @"SELECT p.Id, p.CodigoPedido, p.Fecha, p.Estado, p.DireccionEntrega, p.Total,
                                           c.Id AS IdCliente, c.NombreEmpresa,
                                           dp.Id AS IdDetalle, dp.Cantidad, dp.PrecioUnitario,
                                           pr.Id AS IdProducto, pr.Nombre AS NombreProducto
                                    FROM   UsuarioPedido up
                                    INNER  JOIN Pedido p          ON p.Id = up.IdPedido
                                    INNER  JOIN Cliente c         ON c.Id = p.IdCliente
                                    LEFT   JOIN DetallePedido dp  ON dp.IdPedido = p.Id
                                    LEFT   JOIN Producto pr       ON pr.Id = dp.IdProducto
                                    WHERE  up.IdUsuario = @idUsuario
                                    ORDER  BY p.Fecha DESC, p.Id DESC";

                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("@idUsuario", idUsuario);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        int idPedido = Convert.ToInt32(dr["Id"]);

                        if (!mapaPedidos.TryGetValue(idPedido, out Pedido pedido))
                        {
                            pedido = new Pedido
                            {
                                Id = idPedido,
                                CodigoPedido = dr["CodigoPedido"].ToString(),
                                Fecha = Convert.ToDateTime(dr["Fecha"]),
                                Estado = dr["Estado"] == DBNull.Value ? "" : dr["Estado"].ToString(),
                                DireccionEntrega = dr["DireccionEntrega"] == DBNull.Value ? "" : dr["DireccionEntrega"].ToString(),
                                Total = dr["Total"] == DBNull.Value ? 0 : Convert.ToDecimal(dr["Total"]),
                                IdCliente = new Cliente
                                {
                                    Id = Convert.ToInt32(dr["IdCliente"]),
                                    NombreEmpresa = dr["NombreEmpresa"].ToString()
                                },
                                Detalles = new List<DetallePedido>()
                            };
                            mapaPedidos.Add(idPedido, pedido);
                            lista.Add(pedido);
                        }

                        if (dr["IdDetalle"] != DBNull.Value)
                        {
                            pedido.Detalles.Add(new DetallePedido
                            {
                                Id = Convert.ToInt32(dr["IdDetalle"]),
                                Cantidad = Convert.ToInt32(dr["Cantidad"]),
                                PrecioUnitario = Convert.ToDecimal(dr["PrecioUnitario"]),
                                IdProducto = new Producto
                                {
                                    Id = Convert.ToInt32(dr["IdProducto"]),
                                    Nombre = dr["NombreProducto"].ToString()
                                }
                            });
                        }
                    }
                }
            }

            return lista;
        }

        public Cliente MtBuscarClientePorTelefono(string telefono)
        {
            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();
                string consulta = "SELECT Id, NombreEmpresa, Direccion, Telefono FROM Cliente WHERE Telefono = @telefono";
                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("@telefono", telefono);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        return new Cliente
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            NombreEmpresa = dr["NombreEmpresa"].ToString(),
                            Direccion = dr["Direccion"] == DBNull.Value ? "" : dr["Direccion"].ToString(),
                            Telefono = dr["Telefono"].ToString()
                        };
                    }
                }
            }
            return null;
        }

        public List<Producto> MtListarProductosActivos()
        {
            List<Producto> lista = new List<Producto>();

            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();
                string consulta = @"SELECT Id, Nombre, Precio, Stock, Imagen
                                    FROM   Producto
                                    WHERE  Estado = 'Activo'
                                    ORDER  BY Nombre";
                SqlCommand cmd = new SqlCommand(consulta, conn);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        lista.Add(new Producto
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            Nombre = dr["Nombre"].ToString(),
                            Precio = dr["Precio"] == DBNull.Value ? 0 : Convert.ToDecimal(dr["Precio"]),
                            Stock = dr["Stock"] == DBNull.Value ? 0 : Convert.ToInt32(dr["Stock"]),
                            Imagen = dr["Imagen"] == DBNull.Value ? "" : dr["Imagen"].ToString()
                        });
                    }
                }
            }

            return lista;
        }

        // Crea (o reutiliza) el cliente, el pedido, sus detalles y el
        // vínculo UsuarioPedido + DistribuidorCliente, todo en una
        // transacción para no dejar datos huérfanos.
        public int MtCrearPedidoCompleto(Cliente oCliente, Pedido oPedido, List<DetallePedido> oDetalles, int idUsuario)
        {
            using (SqlConnection conn = ConexionDB.MtAbrirConexion())
            {
                conn.Open();
                SqlTransaction tx = conn.BeginTransaction();

                try
                {
                    int idCliente = oCliente.Id;

                    // 1) Cliente: si no trae Id, se crea uno nuevo con los
                    //    datos capturados durante la visita.
                    if (idCliente <= 0)
                    {
                        string sqlCliente = @"INSERT INTO Cliente (NombreEmpresa, Direccion, Telefono, IdBarrio)
                                              VALUES (@nombre, @direccion, @telefono, @idBarrio);
                                              SELECT CAST(SCOPE_IDENTITY() AS INT)";
                        SqlCommand cmdCliente = new SqlCommand(sqlCliente, conn, tx);
                        cmdCliente.Parameters.AddWithValue("@nombre", oCliente.NombreEmpresa);
                        cmdCliente.Parameters.AddWithValue("@direccion", oCliente.Direccion ?? "");
                        cmdCliente.Parameters.AddWithValue("@telefono", oCliente.Telefono ?? "");
                        cmdCliente.Parameters.AddWithValue("@idBarrio", oCliente.Barrio != null && oCliente.Barrio.Id > 0 ? (object)oCliente.Barrio.Id : (object)DBNull.Value);
                        idCliente = Convert.ToInt32(cmdCliente.ExecuteScalar());
                    }

                    // 2) Asociar cliente-preventista si todavía no existe el vínculo (HU-109/HU-111)
                    SqlCommand cmdAsociado = new SqlCommand(
                        "SELECT COUNT(1) FROM DistribuidorCliente WHERE IdUsuario = @idUsuario AND IdCliente = @idCliente", conn, tx);
                    cmdAsociado.Parameters.AddWithValue("@idUsuario", idUsuario);
                    cmdAsociado.Parameters.AddWithValue("@idCliente", idCliente);
                    bool yaAsociado = Convert.ToInt32(cmdAsociado.ExecuteScalar()) > 0;

                    if (!yaAsociado)
                    {
                        SqlCommand cmdAsociar = new SqlCommand(
                            "INSERT INTO DistribuidorCliente (IdUsuario, IdCliente) VALUES (@idUsuario, @idCliente)", conn, tx);
                        cmdAsociar.Parameters.AddWithValue("@idUsuario", idUsuario);
                        cmdAsociar.Parameters.AddWithValue("@idCliente", idCliente);
                        cmdAsociar.ExecuteNonQuery();
                    }

                    // 3) Pedido
                    string sqlPedido = @"INSERT INTO Pedido (Fecha, Estado, DireccionEntrega, Total, IdCliente)
                                         VALUES (@fecha, @estado, @direccion, @total, @idCliente);
                                         SELECT CAST(SCOPE_IDENTITY() AS INT)";
                    SqlCommand cmdPedido = new SqlCommand(sqlPedido, conn, tx);
                    cmdPedido.Parameters.AddWithValue("@fecha", DateTime.Now.Date);
                    cmdPedido.Parameters.AddWithValue("@estado", "Pendiente");
                    cmdPedido.Parameters.AddWithValue("@direccion", oPedido.DireccionEntrega ?? oCliente.Direccion ?? "");
                    cmdPedido.Parameters.AddWithValue("@total", oPedido.Total);
                    cmdPedido.Parameters.AddWithValue("@idCliente", idCliente);
                    int idPedido = Convert.ToInt32(cmdPedido.ExecuteScalar());

                    // 4) Detalles del pedido
                    string sqlDetalle = @"INSERT INTO DetallePedido (Cantidad, PrecioUnitario, IdPedido, IdProducto)
                                          VALUES (@cantidad, @precio, @idPedido, @idProducto)";
                    foreach (var detalle in oDetalles)
                    {
                        SqlCommand cmdDetalle = new SqlCommand(sqlDetalle, conn, tx);
                        cmdDetalle.Parameters.AddWithValue("@cantidad", detalle.Cantidad);
                        cmdDetalle.Parameters.AddWithValue("@precio", detalle.PrecioUnitario);
                        cmdDetalle.Parameters.AddWithValue("@idPedido", idPedido);
                        cmdDetalle.Parameters.AddWithValue("@idProducto", detalle.IdProducto.Id);
                        cmdDetalle.ExecuteNonQuery();
                    }

                    // 5) Vínculo preventista-pedido 
                    string sqlUsuarioPedido = @"INSERT INTO UsuarioPedido (IdUsuario, IdPedido, FechaPreventa)
                                                VALUES (@idUsuario, @idPedido, CAST(GETDATE() AS DATE))";
                    SqlCommand cmdUP = new SqlCommand(sqlUsuarioPedido, conn, tx);
                    cmdUP.Parameters.AddWithValue("@idUsuario", idUsuario);
                    cmdUP.Parameters.AddWithValue("@idPedido", idPedido);
                    cmdUP.ExecuteNonQuery();

                    tx.Commit();
                    return idPedido;
                }
                catch (Exception ex)
                {
                    tx.Rollback();
                    Trace.WriteLine(ex.Message);
                    return 0;
                }
            }
        }
    }
}