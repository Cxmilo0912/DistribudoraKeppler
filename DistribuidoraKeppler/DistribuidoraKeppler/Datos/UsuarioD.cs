using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using DistribuidoraKeppler.Modelo;

namespace DistribuidoraKeppler.Datos
{
    public class UsuarioD
    {
        public Usuario MtObtenerUsuarioPorEmail(string email)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = @"SELECT U.*,R.Id as IdRol, R.Nombre AS NomRol 
                               FROM Usuario U 
                                Inner Join UsuarioRol UR ON U.Id = UR.IdUsuario
                               INNER JOIN Rol R ON UR.IdRol = R.Id 
                               WHERE U.Email = @Email";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = email;

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    return new Usuario
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        Nombre = dr["Nombre"].ToString(),
                        Email = dr["Email"].ToString(),
                        Contrasena = dr["Contrasena"].ToString(),
                        Foto = dr["Foto"] == DBNull.Value ? null : dr["Foto"].ToString(),
                        Estado = Convert.ToByte(dr["Estado"]),
                        Documento = Convert.ToInt32(dr["Documento"]),
                        Rol = new Rol
                        {
                            Id = Convert.ToInt32(dr["IdRol"]),
                            Nombre = dr["NomRol"].ToString()
                        }
                    };
                }
            }

            return null;
        }


        public object ObtenerPorCorreo(string email)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                // Usuario
                string sqlU = "SELECT Id, Nombre FROM Usuario WHERE Email=@E";
                SqlCommand cmdU = new SqlCommand(sqlU, con);
                cmdU.Parameters.AddWithValue("@E", email);

                SqlDataReader drU = cmdU.ExecuteReader();

                if (drU.Read())
                {
                    return new Usuario
                    {
                        Id = Convert.ToInt32(drU["Id"]),
                        Nombre = drU["Nombre"].ToString()
                    };
                }
                drU.Close();

                // Cliente
                string sqlC = "SELECT Id, Email FROM Cliente WHERE Email=@E";
                SqlCommand cmdC = new SqlCommand(sqlC, con);
                cmdC.Parameters.AddWithValue("@E", email);

                SqlDataReader drC = cmdC.ExecuteReader();

                if (drC.Read())
                {
                    return new Cliente
                    {
                        Id = Convert.ToInt32(drC["Id"]),
                        Email = drC["Email"].ToString()
                    };
                }
            }

            return null;
        }

        public Usuario MtObtenerUsuarioPorId(int id)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = @"SELECT U.*, R.Nombre AS NomRol 
                               FROM Usuario U 
                               INNER JOIN Rol R ON U.IdRol = R.Id
                               WHERE U.Id = @Id";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Id", id);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    return new Usuario
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        Nombre = dr["Nombre"].ToString(),
                        Email = dr["Email"].ToString(),
                        Contrasena = dr["Contrasena"].ToString(),
                        Foto = dr["Foto"] == DBNull.Value ? null : dr["Foto"].ToString(),
                        Estado = Convert.ToByte(dr["Estado"]),
                        Documento = Convert.ToInt32(dr["Documento"]),
                        Rol = new Rol
                        {
                            Id = Convert.ToInt32(dr["IdRol"]),
                            Nombre = dr["NomRol"].ToString()
                        }
                    };
                }
            }

            return null;
        }


        public bool ActualizarUsuario(Usuario usuario)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = @"UPDATE Usuario SET 
                               Nombre = @Nombre,
                               Email = @Email
                               WHERE Id = @Id";

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@Nombre", usuario.Nombre);
                cmd.Parameters.AddWithValue("@Email", usuario.Email);
                cmd.Parameters.AddWithValue("@Id", usuario.Id);

                return cmd.ExecuteNonQuery() > 0;
            }
        }


        public bool ActualizarContrasena(int idUsuario, string nuevaContrasena)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = "UPDATE Usuario SET Contrasena = @Pass WHERE Id = @Id";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Pass", nuevaContrasena);
                cmd.Parameters.AddWithValue("@Id", idUsuario);

                return cmd.ExecuteNonQuery() > 0;
            }
        }


        public bool ActualizarFoto(int idUsuario, string rutaFoto)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = "UPDATE Usuario SET Foto = @Foto WHERE Id = @Id";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Foto",
                    string.IsNullOrEmpty(rutaFoto) ? (object)DBNull.Value : rutaFoto);
                cmd.Parameters.AddWithValue("@Id", idUsuario);

                return cmd.ExecuteNonQuery() > 0;
            }
        }

        public void GuardarToken(string email, string token, DateTime expira)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = @"
        UPDATE Usuario 
        SET TokenRecuperacion = @Token, FechaExpiracion = @Expira
        WHERE Email = @Email;

        UPDATE Cliente 
        SET TokenRecuperacion = @Token, FechaExpiracion = @Expira
        WHERE Email = @Email;";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Token", token);
                cmd.Parameters.AddWithValue("@Expira", expira);
                cmd.Parameters.AddWithValue("@Email", email);

                cmd.ExecuteNonQuery();
            }
        }

        public string ObtenerEmailPorToken(string token)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = @"
        SELECT Email FROM Usuario 
        WHERE TokenRecuperacion = @Token AND FechaExpiracion > GETUTCDATE()

        UNION

        SELECT Email FROM Cliente 
        WHERE TokenRecuperacion = @Token AND FechaExpiracion > GETUTCDATE()";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Token", token);

                object result = cmd.ExecuteScalar();

                return result != null ? result.ToString() : null;
            }
        }

        public bool ActualizarPassword(string email, string nueva)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = @"
        UPDATE Usuario 
        SET Contrasena = @Pass, TokenRecuperacion = NULL, FechaExpiracion = NULL
        WHERE Email = @Email;

        UPDATE Cliente 
        SET Contrasena = @Pass, TokenRecuperacion = NULL, FechaExpiracion = NULL
        WHERE Email = @Email;";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Pass", nueva);
                cmd.Parameters.AddWithValue("@Email", email);

                return cmd.ExecuteNonQuery() > 0;
            }
        }
        public List<Rol> MtListarRoles()
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                List<Rol> roles = new List<Rol>();
                cn.Open();
                string consulta = @"SELECT * FROM Rol Where Nombre != 'Cliente';";
                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            roles.Add(new Rol
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Nombre = dr["Nombre"].ToString()
                            });
                        }
                    }
                }
                return roles;
            }
        }

        public bool MtCrearUsuario(Usuario usuario, int idRol)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                int idUsuario = 0;
                string consultaUsuario = @"INSERT INTO Usuario 
                                    (Nombre, Email, Contrasena, Estado, Documento) 
                                    VALUES (@Nombre, @Email, @Contrasena, @Estado, @Documento);
                                    Select SCOPE_IDENTITY()";

                string consultaRol = @"Insert Into UsuarioRol (IdUsuario, IdRol)
                                     Values(@idUsuario, @idRol)";
                using (SqlCommand cmd = new SqlCommand(consultaUsuario, cn))
                {
                    cmd.Parameters.AddWithValue("@Nombre", usuario.Nombre);
                    cmd.Parameters.AddWithValue("@Email", usuario.Email);
                    cmd.Parameters.AddWithValue("@Contrasena", usuario.Contrasena);
                    cmd.Parameters.AddWithValue("@Estado", usuario.Estado);
                    cmd.Parameters.AddWithValue("@Documento", usuario.Documento);

                    idUsuario = Convert.ToInt32(cmd.ExecuteScalar());
                }

                using (SqlCommand cmdRol = new SqlCommand(consultaRol, cn))
                {
                    cmdRol.Parameters.AddWithValue("@idUsuario", idUsuario);
                    cmdRol.Parameters.AddWithValue("@idRol", idRol);

                    return cmdRol.ExecuteNonQuery() > 0;
                }
            }
        }

        public bool MtEditarUsuario(Usuario oUsuario, int idRol)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                string consultaUpdate = @"UPDATE Usuario 
                                    SET Nombre = @Nombre, 
                                        Email = @Email, 
                                        Documento = @Documento, 
                                        Estado = @Estado 
                                    WHERE Id = @Id";
                using (SqlCommand cmdUpdate = new SqlCommand(consultaUpdate, cn))
                {
                    cmdUpdate.Parameters.AddWithValue("@Nombre", oUsuario.Nombre);
                    cmdUpdate.Parameters.AddWithValue("@Email", oUsuario.Email);
                    cmdUpdate.Parameters.AddWithValue("@Documento", oUsuario.Documento);
                    cmdUpdate.Parameters.AddWithValue("@Estado", oUsuario.Estado);
                    cmdUpdate.Parameters.AddWithValue("@Id", oUsuario.Id);
                    cmdUpdate.ExecuteNonQuery();
                }


                string consultaDelete = @"Delete From UsuarioRol Where IdUsuario = @idUsuario";

                using (SqlCommand cmdDelete = new SqlCommand(consultaDelete,cn))
                {
                    cmdDelete.Parameters.AddWithValue("@idUsuario", oUsuario.Id);
                    cmdDelete.ExecuteNonQuery();
                }

                string consultaInsertRol = @"Insert Into UsuarioRol (IdUsuario, IdRol)
                                     Values(@idUsuario, @idRol)";

                using (SqlCommand cmdInsert = new SqlCommand(consultaInsertRol, cn))
                {
                    cmdInsert.Parameters.AddWithValue("@idUsuario", oUsuario.Id);
                    cmdInsert.Parameters.AddWithValue("@idRol", idRol);

                    return cmdInsert.ExecuteNonQuery() > 0;
                }
            }
        }

        public bool MtEliminarUsuario(int id)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                string consulta = @"DELETE FROM Usuario WHERE Id = @Id";
                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    int filasAfectadas = cmd.ExecuteNonQuery();
                    return filasAfectadas > 0;
                }
            }
        }

        public List<Rol> MtRolesPorUsuario(int idUsuario)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                List<Rol> roles = new List<Rol>();
                string consulta = @"SELECT r.Id, r.Nombre 
                FROM UsuarioRol ur
                INNER JOIN Rol r ON ur.IdRol = r.Id
                WHERE ur.IdUsuario = @idUsuario";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@idUsuario", idUsuario);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            roles.Add(new Rol
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Nombre = dr["Nombre"].ToString()
                            });

                        }
                    }
                }
                return roles;
            }
        }

        public List<object> MtListarPersonalMovilizado()
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                List<object> lista = new List<object>();

                string consulta = @"Select u.Id as IdUsuario, u.Nombre as Trabajador, u.Documento, u.Email, r.Nombre as Cargo,
                                   ISNULL(s.Nombre, 'Sin sector asignado') as SectorAsignado, m.Nombre as NombreMunicipio From Rol r 
                                   Inner Join UsuarioRol ur  
                                   ON
                                   r.Id = ur.IdRol
                                   Inner Join Usuario u 
                                   ON
                                   ur.IdUsuario = u.Id
                                   Left Join AsignarSector asec 
                                   ON
                                   u.Id = asec.IdUsuario
                                   Left Join Sector s
                                   ON
                                   asec.IdSector = s.Id
                                   Inner Join Municipio m 
                                   ON
                                   s.IdMunicipio = m.Id
                                   Where r.Nombre IN ('Preventista', 'Distribuidor');";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new
                            {
                                Id = dr["IdUsuario"].ToString(),
                                Trabajador = dr["Trabajador"].ToString(),
                                Email = dr["Email"].ToString(),
                                Cargo = dr["Cargo"].ToString(),
                                Documento = dr["Documento"].ToString(),
                                SectorAsignado = dr["SectorAsignado"].ToString(),
                                Municipio = dr["NombreMunicipio"].ToString()
                            });
                        }
                    }
                    return lista;
                }

            }
        }

        public bool MtAsignarSector(int idTrabajador, int idSector)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = @"Insert Into AsignarSector(IdUsuario, IdSector) 
                                    Values(@idUsuario, @idSector)";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@idUsuario", idTrabajador);
                    cmd.Parameters.AddWithValue("@idSector", idSector);

                    return cmd.ExecuteNonQuery() > 0;

                }
            }
        }

        public bool MtReasignarSector(int idUsuario, int idSector)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                string consultaBorrar = @"Delete From AsignarSector Where IdUsuario = @idUsuario";
                using (SqlCommand cmdBorrar = new SqlCommand(consultaBorrar, cn))
                {
                    cmdBorrar.Parameters.AddWithValue("@idUsuario", idUsuario);
                    cmdBorrar.ExecuteNonQuery();
                }

                string consultaInsertar = @"Insert Into AsignarSector(IdUsuario, IdSector) 
                                    Values(@idUsuario, @idSector)";

                using (SqlCommand cmdInsertar = new SqlCommand(consultaInsertar, cn))
                {
                    cmdInsertar.Parameters.AddWithValue("@idUsuario", idUsuario);
                    cmdInsertar.Parameters.AddWithValue("@idSector", idSector);
                    return cmdInsertar.ExecuteNonQuery() > 0;
                }
            }
        }
    }
}