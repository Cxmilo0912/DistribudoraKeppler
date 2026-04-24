using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic; // 🔥 IMPORTANTE
using DistribuidoraKeppler.Modelo;

namespace DistribuidoraKeppler.Datos
{
    public class UsuarioD
    {
        public object ObtenerUsuario(string email, string contrasena)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();
                // 1. Intentar con Trabajadores
                string sqlU = "SELECT U.*, R.Nombre AS NomRol FROM Usuario U INNER JOIN Rol R ON U.IdRol = R.Id WHERE Email=@E AND Contrasena=@P";
                SqlCommand cmdU = new SqlCommand(sqlU, con);
                cmdU.Parameters.AddWithValue("@E", email);
                cmdU.Parameters.AddWithValue("@P", contrasena);
                SqlDataReader drU = cmdU.ExecuteReader();

                if (drU.Read())
                {
                    return new Usuario
                    {
                        Id = Convert.ToInt32(drU["Id"]),
                        Nombre = drU["Nombre"].ToString(),
                        Rol = new Rol { Id = Convert.ToInt32(drU["IdRol"]), Nombre = drU["NomRol"].ToString() }
                    };
                }
                drU.Close();

                // 2. Intentar con Clientes
                string sqlC = @"SELECT C.*, B.Id AS BarrioId, B.Nombre AS BarrioNombre 
                FROM Cliente C
                INNER JOIN Barrio B ON C.IdBarrio = B.Id
                WHERE C.Email = @E AND C.Contrasena = @P";

                SqlCommand cmdC = new SqlCommand(sqlC, con);
                cmdC.Parameters.AddWithValue("@E", email);
                cmdC.Parameters.AddWithValue("@P", contrasena);
                SqlDataReader drC = cmdC.ExecuteReader();

                if (drC.Read())
                {
                    return new Cliente
                    {
                        Id = Convert.ToInt32(drC["Id"]),
                        Nit = drC["Nit"].ToString(),
                        NombreEmpresa = drC["NombreEmpresa"].ToString(),
                        Email = drC["Email"].ToString(),
                        Telefono = drC["Telefono"].ToString(),
                        Direccion = drC["Direccion"].ToString(),
                        Imagen = drC["Imagen"].ToString(),
                        Barrio = new Barrio
                        {
                            Id = Convert.ToInt32(drC["BarrioId"]),
                            Nombre = drC["BarrioNombre"].ToString()
                        }
                    };
                }
            }
            return null;
        }

        // 🔍 BUSCAR POR CORREO
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

        // 🔐 GUARDAR TOKEN
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

        // 🔎 VALIDAR TOKEN
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

        // 🔄 CAMBIAR CONTRASEÑA
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

        // 🔥 NUEVO: OBTENER TODOS LOS CORREOS
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
    }
}