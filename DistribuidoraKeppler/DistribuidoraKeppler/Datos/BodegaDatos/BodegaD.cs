using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DistribuidoraKeppler.Datos
{
    public class BodegaD
    {
        // Roles que pueden recibir la entrega de un pedido (repartidores).
        private const string FiltroRolesRepartidor = "r.Nombre IN ('Distribuidor', 'Bodega')";

        public List<Sector> MtListarSectores()
        {
            List<Sector> lista = new List<Sector>();

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = "SELECT Id, Nombre FROM Sector WHERE Estado = 1 ORDER BY Nombre";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        lista.Add(new Sector
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            Nombre = dr["Nombre"].ToString()
                        });
                    }
                }
            }

            return lista;
        }

        // Pedidos que no tienen ningún repartidor asignado en UsuarioPedido.
        // idSector = 0 => sin filtro de sector (todos los pedidos pendientes).
        public List<Pedido> MtListarPedidosPendientes(int idSector)
        {
            List<Pedido> lista = new List<Pedido>();

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = $@"SELECT p.Id,
                                             p.CodigoPedido,
                                             p.Fecha,
                                             p.Estado,
                                             p.DireccionEntrega,
                                             p.Total,
                                             c.Id     AS IdCliente,
                                             c.NombreEmpresa,
                                             c.Email  AS EmailCliente,
                                             s.Id     AS SectorId,
                                             s.Nombre AS SectorNombre
                                      FROM   Pedido p
                                      INNER JOIN Cliente c ON c.Id = p.IdCliente
                                      LEFT  JOIN Barrio  b ON b.Id = c.IdBarrio
                                      LEFT  JOIN Sector  s ON s.Id = b.IdSector
                                      WHERE  p.Estado <> 'Entregado'
                                        AND  NOT EXISTS (
                                                 SELECT 1
                                                 FROM   UsuarioPedido up
                                                 INNER JOIN UsuarioRol ur ON ur.IdUsuario = up.IdUsuario
                                                 INNER JOIN Rol r ON r.Id = ur.IdRol
                                                 WHERE  up.IdPedido = p.Id AND {FiltroRolesRepartidor}
                                             )
                                        AND  (@idSector = 0 OR s.Id = @idSector)
                                      ORDER  BY p.Fecha ASC";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@idSector", idSector);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new Pedido
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                CodigoPedido = dr["CodigoPedido"] == DBNull.Value ? "" : dr["CodigoPedido"].ToString(),
                                Fecha = Convert.ToDateTime(dr["Fecha"]),
                                Estado = dr["Estado"].ToString(),
                                DireccionEntrega = dr["DireccionEntrega"] == DBNull.Value ? "" : dr["DireccionEntrega"].ToString(),
                                Total = Convert.ToDecimal(dr["Total"]),
                                IdCliente = new Cliente
                                {
                                    Id = Convert.ToInt32(dr["IdCliente"]),
                                    NombreEmpresa = dr["NombreEmpresa"].ToString(),
                                    Email = dr["EmailCliente"] == DBNull.Value ? "" : dr["EmailCliente"].ToString()
                                },
                                Sector = dr["SectorId"] != DBNull.Value ? new Sector
                                {
                                    Id = Convert.ToInt32(dr["SectorId"]),
                                    Nombre = dr["SectorNombre"].ToString()
                                } : null
                            });
                        }
                    }
                }
            }

            return lista;
        }

        // Repartidores (Distribuidor o Bodega) activos con ese sector asignado en AsignarSector.
        public List<Usuario> MtListarRepartidoresPorSector(int idSector)
        {
            List<Usuario> lista = new List<Usuario>();

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = $@"SELECT DISTINCT u.Id, u.Nombre, u.Email, u.Documento, u.Estado
                                      FROM   Usuario u
                                      INNER JOIN UsuarioRol ur ON ur.IdUsuario = u.Id
                                      INNER JOIN Rol r ON r.Id = ur.IdRol
                                      INNER JOIN AsignarSector asg ON asg.IdUsuario = u.Id
                                      WHERE  {FiltroRolesRepartidor}
                                        AND  u.Estado = 1
                                        AND  asg.IdSector = @idSector
                                      ORDER  BY u.Nombre";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@idSector", idSector);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new Usuario
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Nombre = dr["Nombre"].ToString(),
                                Email = dr["Email"].ToString(),
                                Documento = Convert.ToInt32(dr["Documento"]),
                                Estado = Convert.ToByte(dr["Estado"])
                            });
                        }
                    }
                }
            }

            return lista;
        }

        // Todos los repartidores (Distribuidor / Bodega) activos, sin importar si tienen o no
        // un sector asignado en AsignarSector. Se usa para que Bodega pueda elegir entre
        // cualquier repartidor que esté trabajando actualmente, no solo los mapeados al sector.
        public List<Usuario> MtListarRepartidoresActivos()
        {
            List<Usuario> lista = new List<Usuario>();

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = $@"SELECT DISTINCT u.Id, u.Nombre, u.Email, u.Documento, u.Estado
                                      FROM   Usuario u
                                      INNER JOIN UsuarioRol ur ON ur.IdUsuario = u.Id
                                      INNER JOIN Rol r ON r.Id = ur.IdRol
                                      WHERE  {FiltroRolesRepartidor}
                                        AND  u.Estado = 1
                                      ORDER  BY u.Nombre";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        lista.Add(new Usuario
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            Nombre = dr["Nombre"].ToString(),
                            Email = dr["Email"].ToString(),
                            Documento = Convert.ToInt32(dr["Documento"]),
                            Estado = Convert.ToByte(dr["Estado"])
                        });
                    }
                }
            }

            return lista;
        }

        // Todos los repartidores (Distribuidor / Bodega) junto con los sectores que ya tienen asignados.
        public List<Usuario> MtListarRepartidoresConSectores()
        {
            Dictionary<int, Usuario> repartidores = new Dictionary<int, Usuario>();

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = $@"SELECT u.Id, u.Nombre, u.Email,
                                             asg.IdSector, s.Nombre AS SectorNombre
                                      FROM   Usuario u
                                      INNER JOIN UsuarioRol ur ON ur.IdUsuario = u.Id
                                      INNER JOIN Rol r ON r.Id = ur.IdRol
                                      LEFT  JOIN AsignarSector asg ON asg.IdUsuario = u.Id
                                      LEFT  JOIN Sector s ON s.Id = asg.IdSector
                                      WHERE  {FiltroRolesRepartidor}
                                      ORDER  BY u.Nombre";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        int idUsuario = Convert.ToInt32(dr["Id"]);

                        Usuario repartidor;
                        if (!repartidores.TryGetValue(idUsuario, out repartidor))
                        {
                            repartidor = new Usuario
                            {
                                Id = idUsuario,
                                Nombre = dr["Nombre"].ToString(),
                                Email = dr["Email"].ToString(),
                                Sectores = new List<Sector>()
                            };
                            repartidores.Add(idUsuario, repartidor);
                        }

                        if (dr["IdSector"] != DBNull.Value)
                        {
                            repartidor.Sectores.Add(new Sector
                            {
                                Id = Convert.ToInt32(dr["IdSector"]),
                                Nombre = dr["SectorNombre"].ToString()
                            });
                        }
                    }
                }
            }

            return new List<Usuario>(repartidores.Values);
        }

        // Asigna el pedido al repartidor mediante UsuarioPedido y pasa el pedido a "En reparto".
        // Usa una transacción con UPDLOCK/HOLDLOCK para evitar que dos usuarios de Bodega
        // asignen el mismo pedido al mismo tiempo.
        public bool MtAsignarPedido(int idPedido, int idRepartidor)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = $@"BEGIN TRY
                                        BEGIN TRANSACTION;

                                        IF EXISTS (
                                            SELECT 1
                                            FROM   UsuarioPedido up WITH (UPDLOCK, HOLDLOCK)
                                            INNER JOIN UsuarioRol ur ON ur.IdUsuario = up.IdUsuario
                                            INNER JOIN Rol r ON r.Id = ur.IdRol
                                            WHERE  up.IdPedido = @idPedido AND {FiltroRolesRepartidor}
                                        )
                                        BEGIN
                                            ROLLBACK TRANSACTION;
                                            SELECT 0;
                                            RETURN;
                                        END

                                        INSERT INTO UsuarioPedido (IdUsuario, IdPedido) VALUES (@idRepartidor, @idPedido);
                                        UPDATE Pedido SET Estado = 'En reparto' WHERE Id = @idPedido;

                                        COMMIT TRANSACTION;
                                        SELECT 1;
                                    END TRY
                                    BEGIN CATCH
                                        IF @@TRANCOUNT > 0
                                            ROLLBACK TRANSACTION;
                                        THROW;
                                    END CATCH;";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@idPedido", idPedido);
                    cmd.Parameters.AddWithValue("@idRepartidor", idRepartidor);

                    object resultado = cmd.ExecuteScalar();
                    return resultado != null && Convert.ToInt32(resultado) == 1;
                }
            }
        }

        // Asigna un sector a un repartidor (idempotente: no duplica si ya lo tenía).
        public void MtAgregarSectorRepartidor(int idUsuario, int idSector)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = @"IF NOT EXISTS (SELECT 1 FROM AsignarSector WHERE IdUsuario = @idUsuario AND IdSector = @idSector)
                                     INSERT INTO AsignarSector (IdUsuario, IdSector) VALUES (@idUsuario, @idSector)";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
                    cmd.Parameters.AddWithValue("@idSector", idSector);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        // Quita un sector de un repartidor.
        public void MtQuitarSectorRepartidor(int idUsuario, int idSector)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = "DELETE FROM AsignarSector WHERE IdUsuario = @idUsuario AND IdSector = @idSector";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
                    cmd.Parameters.AddWithValue("@idSector", idSector);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        // Historial de entregas realizadas: pedidos en estado 'Entregado' junto con el
        // repartidor que los entregó y la fecha/hora en que se registró la entrega.
        public List<Pedido> MtListarHistorialEntregas()
        {
            List<Pedido> lista = new List<Pedido>();

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = $@"SELECT p.Id,
                                             p.CodigoPedido,
                                             c.NombreEmpresa,
                                             u.Nombre AS NombreRepartidor,
                                             up.FechaEntrega
                                      FROM   UsuarioPedido up
                                      INNER JOIN Pedido     p  ON p.Id = up.IdPedido
                                      INNER JOIN Cliente    c  ON c.Id = p.IdCliente
                                      INNER JOIN Usuario    u  ON u.Id = up.IdUsuario
                                      INNER JOIN UsuarioRol ur ON ur.IdUsuario = u.Id
                                      INNER JOIN Rol        r  ON r.Id = ur.IdRol
                                      WHERE  p.Estado = 'Entregado'
                                        AND  up.FechaEntrega IS NOT NULL
                                        AND  {FiltroRolesRepartidor}
                                      ORDER  BY up.FechaEntrega DESC";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        lista.Add(new Pedido
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            CodigoPedido = dr["CodigoPedido"] == DBNull.Value ? "" : dr["CodigoPedido"].ToString(),
                            IdCliente = new Cliente
                            {
                                NombreEmpresa = dr["NombreEmpresa"].ToString()
                            },
                            Repartidor = new Usuario
                            {
                                Nombre = dr["NombreRepartidor"].ToString()
                            },
                            FechaEntrega = Convert.ToDateTime(dr["FechaEntrega"])
                        });
                    }
                }
            }

            return lista;
        }

        // Reporte de entregas realizadas y pendientes, filtrable por repartidor, sector
        // y rango de fechas (se filtra por FechaEntrega si ya se entregó, o por
        // FechaAsignacion si todavía está pendiente).
        public List<ReporteEntrega> MtListarReporteEntregas(int idRepartidor, int idSector, DateTime? fechaInicio, DateTime? fechaFin)
        {
            List<ReporteEntrega> lista = new List<ReporteEntrega>();

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = $@"SELECT p.Id,
                                             p.CodigoPedido,
                                             c.NombreEmpresa,
                                             u.Id     AS IdRepartidor,
                                             u.Nombre AS NombreRepartidor,
                                             s.Id     AS IdSector,
                                             s.Nombre AS NombreSector,
                                             up.FechaAsignacion,
                                             up.FechaEntrega,
                                             up.Observaciones
                                      FROM   UsuarioPedido up
                                      INNER JOIN Pedido     p  ON p.Id = up.IdPedido
                                      INNER JOIN Cliente    c  ON c.Id = p.IdCliente
                                      INNER JOIN Usuario    u  ON u.Id = up.IdUsuario
                                      INNER JOIN UsuarioRol ur ON ur.IdUsuario = u.Id
                                      INNER JOIN Rol        r  ON r.Id = ur.IdRol
                                      LEFT  JOIN Barrio     b  ON b.Id = c.IdBarrio
                                      LEFT  JOIN Sector     s  ON s.Id = b.IdSector
                                      WHERE  {FiltroRolesRepartidor}
                                        AND  (@idRepartidor = 0 OR u.Id = @idRepartidor)
                                        AND  (@idSector = 0 OR s.Id = @idSector)
                                        AND  (@fechaInicio IS NULL OR ISNULL(up.FechaEntrega, up.FechaAsignacion) >= @fechaInicio)
                                        AND  (@fechaFin IS NULL OR ISNULL(up.FechaEntrega, up.FechaAsignacion) < DATEADD(DAY, 1, @fechaFin))
                                      ORDER  BY up.FechaAsignacion DESC";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@idRepartidor", idRepartidor);
                    cmd.Parameters.AddWithValue("@idSector", idSector);
                    cmd.Parameters.AddWithValue("@fechaInicio", (object)fechaInicio ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@fechaFin", (object)fechaFin ?? DBNull.Value);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            DateTime? fechaEntrega = dr["FechaEntrega"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(dr["FechaEntrega"]);

                            lista.Add(new ReporteEntrega
                            {
                                IdPedido = Convert.ToInt32(dr["Id"]),
                                NumeroPedido = dr["CodigoPedido"] == DBNull.Value ? "" : dr["CodigoPedido"].ToString(),
                                Cliente = new Cliente
                                {
                                    NombreEmpresa = dr["NombreEmpresa"].ToString()
                                },
                                Repartidor = new Usuario
                                {
                                    Id = Convert.ToInt32(dr["IdRepartidor"]),
                                    Nombre = dr["NombreRepartidor"].ToString()
                                },
                                Sector = dr["IdSector"] != DBNull.Value ? new Sector
                                {
                                    Id = Convert.ToInt32(dr["IdSector"]),
                                    Nombre = dr["NombreSector"].ToString()
                                } : null,
                                Estado = fechaEntrega.HasValue ? "Realizado" : "Pendiente",
                                FechaAsignacion = Convert.ToDateTime(dr["FechaAsignacion"]),
                                FechaEntrega = fechaEntrega,
                                Observaciones = dr["Observaciones"] == DBNull.Value ? "" : dr["Observaciones"].ToString()
                            });
                        }
                    }
                }
            }

            return lista;
        }

        // Horario laboral asignado a un usuario (Bodega). Usa el procedimiento
        // almacenado sp_ObtenerHorarioLaboralPorUsuario, que ya devuelve los
        // días ordenados de Lunes a Domingo. Si el usuario no tiene horario
        // asignado, la lista viene vacía (no es un error).
        public List<HorarioLaboral> MtListarHorarioLaboral(int idUsuario)
        {
            List<HorarioLaboral> lista = new List<HorarioLaboral>();

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                using (SqlCommand cmd = new SqlCommand("sp_ObtenerHorarioLaboralPorUsuario", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdUsuario", idUsuario);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new HorarioLaboral
                            {
                                DiaSemana = dr["DiaSemana"].ToString(),
                                HoraEntrada = (TimeSpan)dr["HoraEntrada"],
                                HoraSalida = (TimeSpan)dr["HoraSalida"]
                            });
                        }
                    }
                }
            }

            return lista;
        }
    }
}
