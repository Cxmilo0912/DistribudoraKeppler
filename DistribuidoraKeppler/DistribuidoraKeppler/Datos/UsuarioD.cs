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

                string sql = @"SELECT U.*, R.Nombre AS NomRol 
                               FROM Usuario U 
                               INNER JOIN Rol R ON U.IdRol = R.Id 
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


        public bool MtInsertarUsuario(Usuario usuario)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = @"INSERT INTO Usuario 
                               (Nombre, Email, Contrasena, Foto, Estado, Documento, IdRol) 
                               VALUES 
                               (@Nombre, @Email, @Contrasena, @Foto, @Estado, @Documento, @IdRol)";

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@Nombre", usuario.Nombre);
                cmd.Parameters.AddWithValue("@Email", usuario.Email);
                cmd.Parameters.AddWithValue("@Contrasena", usuario.Contrasena);
                cmd.Parameters.AddWithValue("@Foto",
                    string.IsNullOrEmpty(usuario.Foto) ? (object)DBNull.Value : usuario.Foto);
                cmd.Parameters.AddWithValue("@Estado", usuario.Estado);
                cmd.Parameters.AddWithValue("@Documento", usuario.Documento);
                cmd.Parameters.AddWithValue("@IdRol", usuario.Rol.Id);

                return cmd.ExecuteNonQuery() > 0;
            }
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
        WHERE TokenRecuperacion = @Token AND FechaExpiracion > GETDATE()

        UNION

        SELECT Email FROM Cliente 
        WHERE TokenRecuperacion = @Token AND FechaExpiracion > GETDATE()";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Token", token);

                object result = cmd.ExecuteScalar();

                return result != null ? result.ToString() : null;
            }
        }

        public void ActualizarPassword(string email, string nueva)
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

                cmd.ExecuteNonQuery();
            }
        }
    }
}