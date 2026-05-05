using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using DistribuidoraKeppler.Modelo;

namespace DistribuidoraKeppler.Datos
{
    public class UsuarioD
    {
        // Método para obtener un usuario o cliente por correo electrónico
        public Usuario MtObtenerUsuarioPorEmail(string email)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = @"SELECT U.*, R.Nombre AS NomRol 
                       FROM Usuario U 
                       INNER JOIN Rol R ON U.IdRol = R.Id 
                       WHERE U.Email = @E";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add("@E", System.Data.SqlDbType.VarChar).Value = email;

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    return new Usuario
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        Nombre = dr["Nombre"].ToString(),
                        Email = dr["Email"].ToString(),
                        Contrasena = dr["Contrasena"].ToString(),
                        Foto = dr["Foto"].ToString(),
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

        // Método para obtener un cliente por correo electrónico
        public Cliente MtObtenerClientePorEmail(string email)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = @"SELECT C.*, B.Id AS BarrioId, B.Nombre AS BarrioNombre 
                       FROM Cliente C
                       INNER JOIN Barrio B ON C.IdBarrio = B.Id
                       WHERE C.Email = @E";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add("@E", System.Data.SqlDbType.VarChar).Value = email;  // El system.Data.SqlDbType.VarChar es importante para evitar problemas de conversión de tipos, sirve para indicar que el parámetro es de tipo cadena de texto (varchar) en la base de datos, lo que ayuda a prevenir errores al ejecutar la consulta.

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    return new Cliente
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        Nit = dr["Nit"].ToString(),
                        NombreEmpresa = dr["NombreEmpresa"].ToString(),
                        Email = dr["Email"].ToString(),
                        Telefono = dr["Telefono"].ToString(),
                        Direccion = dr["Direccion"].ToString(),
                        Imagen = dr["Imagen"].ToString(),
                        Contrasena = dr["Contrasena"].ToString(),
                        Barrio = new Barrio
                        {
                            Id = Convert.ToInt32(dr["BarrioId"]),
                            Nombre = dr["BarrioNombre"].ToString()
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

                string sqlU = "SELECT * FROM Usuario WHERE Email=@E";
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

                string sqlC = "SELECT * FROM Cliente WHERE Email=@E";
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

        public string MtNuevoUsuario(string contrasena, int idEmpleado)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                string consulta = @"UPDATE Usuario SET Contrasena=@contrasena WHERE Id=@idEmpleado";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@contrasena", contrasena);
                    cmd.Parameters.AddWithValue("@idEmpleado", idEmpleado);
                    int filasAfectadas = cmd.ExecuteNonQuery();
                    if (filasAfectadas > 0)
                    {
                        return "Contraseña actualizada correctamente";
                    }
                    else
                    {
                        return "No se encontró el usuario con el Id proporcionado";
                    }
                }
            }
        }
        public void GuardarToken(string email, string token, DateTime expira)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = @"
                UPDATE Usuario 
                SET TokenRecuperacion=@T, FechaExpiracion=@F 
                WHERE Email=@E;

                UPDATE Cliente 
                SET TokenRecuperacion=@T, FechaExpiracion=@F 
                WHERE Email=@E;";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@T", token);
                cmd.Parameters.AddWithValue("@F", expira);
                cmd.Parameters.AddWithValue("@E", email);

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
        WHERE TokenRecuperacion=@T

        UNION

        SELECT Email FROM Cliente 
        WHERE TokenRecuperacion=@T";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@T", token);

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
                SET Contrasena=@P, TokenRecuperacion=NULL, FechaExpiracion=NULL 
                WHERE Email=@E;

                UPDATE Cliente 
                SET Contrasena=@P, TokenRecuperacion=NULL, FechaExpiracion=NULL 
                WHERE Email=@E;";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@P", nueva);
                cmd.Parameters.AddWithValue("@E", email);

                cmd.ExecuteNonQuery();
            }
        }

        public List<string> ObtenerTodosLosCorreos()
        {
            List<string> lista = new List<string>();

            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = @"
                SELECT Email FROM Usuario
                UNION
                SELECT Email FROM Cliente";

                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(dr["Email"].ToString());
                }
            }

            return lista;
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

        public bool ActualizarUsuario(Usuario usuario)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();
                string sql = @"UPDATE Usuario SET 
                            Nombre        = @Nombre,
                            Email         = @Email
                            WHERE Id = @Id";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Nombre", usuario.Nombre);
                cmd.Parameters.AddWithValue("@Email", usuario.Email);
                cmd.Parameters.AddWithValue("@Id", usuario.Id);


                return cmd.ExecuteNonQuery() > 0;
            }
        }

        public bool MtActualizarCliente(Cliente cliente)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();
                string sql = @"UPDATE Cliente SET 
                            NombreEmpresa = @NombreEmpresa,
                            Telefono      = @Telefono,
                            Direccion     = @Direccion
                            WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@NombreEmpresa", cliente.NombreEmpresa);
                cmd.Parameters.AddWithValue("@Telefono", cliente.Telefono);
                cmd.Parameters.AddWithValue("@Direccion", cliente.Direccion);
                cmd.Parameters.AddWithValue("@Id", cliente.Id);
                return cmd.ExecuteNonQuery() > 0;
            }
        }

        // Metodo Para obtener el usuario por su Id
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
                        Foto = dr["Foto"].ToString(),
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

        // Metodo para insertar usuario
        public bool MtInsertarUsuario(Usuario usuario)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();
                string sql = @"INSERT INTO Usuario (Nombre, Email, Contrasena, Foto, Estado, Documento, IdRol) 
                               VALUES (@Nombre, @Email, @Contrasena, @Foto, @Estado, @Documento, @IdRol)";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Nombre", usuario.Nombre);
                cmd.Parameters.AddWithValue("@Email", usuario.Email);
                cmd.Parameters.AddWithValue("@Contrasena", usuario.Contrasena);
                cmd.Parameters.AddWithValue("@Foto", string.IsNullOrEmpty(usuario.Foto) ? (object)DBNull.Value : usuario.Foto); cmd.Parameters.AddWithValue("@Estado", usuario.Estado);
                cmd.Parameters.AddWithValue("@Documento", usuario.Documento);
                cmd.Parameters.AddWithValue("@IdRol", usuario.Rol.Id);
                return cmd.ExecuteNonQuery() > 0;
            }
        }


        // Metodo para actualizar la foto del usuario
        public bool ActualizarFoto(int idUsuario, string rutaFoto)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();
                string sql = "UPDATE Usuario SET Foto = @Foto WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Foto", rutaFoto);
                cmd.Parameters.AddWithValue("@Id", idUsuario);
                return cmd.ExecuteNonQuery() > 0;
            }
        }
    }
}
