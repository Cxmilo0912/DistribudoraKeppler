using System;
using System.Configuration;
using System.Data.SqlClient;
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
                string sqlC = "SELECT * FROM Cliente WHERE Email=@E AND Contrasena=@P";
                SqlCommand cmdC = new SqlCommand(sqlC, con);
                cmdC.Parameters.AddWithValue("@E", email);
                cmdC.Parameters.AddWithValue("@P", contrasena);
                SqlDataReader drC = cmdC.ExecuteReader();

                if (drC.Read())
                {
                    return new Cliente
                    {
                        Nit = drC["Nit"].ToString(),
                        NombreEmpresa = drC["NombreEmpresa"].ToString(),
                        Email = drC["Email"].ToString()
                    };
                }
            }
            return null;
        }
    }
}
