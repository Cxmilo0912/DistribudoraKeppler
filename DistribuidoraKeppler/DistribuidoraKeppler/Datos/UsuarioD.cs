using System;
using System.Configuration;
using System.Data.SqlClient;
using DistribuidoraKeppler.Modelo;

namespace DistribuidoraKeppler.Datos
{
    public class UsuarioD
    {
        private string cadenaConexion = ConfigurationManager.ConnectionStrings["ConexionDB"].ConnectionString;

        public UsuarioM ObtenerUsuario(string email, string contrasena)
        {
            using (SqlConnection con = new SqlConnection(cadenaConexion))
            {
                string query = @"SELECT u.Id, u.Nombre, u.Email, u.Contrasena, u.Estado, u.IdRol, r.Nombre AS Rol
                                 FROM Usuario u
                                 LEFT JOIN Rol r ON u.IdRol = r.Id
                                 WHERE u.Email = @Email AND u.Contrasena = @Contrasena";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Contrasena", contrasena);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                UsuarioM u = null;

                if (reader.Read())
                {
                    u = new UsuarioM
                    {
                        Id = Convert.ToInt32(reader["Id"]),
                        Nombre = reader["Nombre"].ToString(),
                        Email = reader["Email"].ToString(),
                        Contrasena = reader["Contrasena"].ToString(),
                        Estado = reader["Estado"].ToString(),
                        IdRol = reader["IdRol"] != DBNull.Value ? Convert.ToInt32(reader["IdRol"]) : 0,
                        Rol = reader["Rol"] != DBNull.Value ? reader["Rol"].ToString() : "Sin rol"
                    };
                }

                return u;
            }
        }
    }
}
