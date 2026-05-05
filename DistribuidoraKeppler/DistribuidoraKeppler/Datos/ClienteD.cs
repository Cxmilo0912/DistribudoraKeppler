using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Vista.Cliente;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;


namespace DistribuidoraKeppler.Datos
{
    public class ClienteD
    {
        // Obtener cliente por Email
        public Cliente MtObtenerPorEmail(string email)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = @"SELECT C.*, B.Id AS BarrioId, B.Nombre AS BarrioNombre
                               FROM Cliente C
                               INNER JOIN Barrio B ON C.IdBarrio = B.Id
                               WHERE C.Email = @E";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.Add("@E", SqlDbType.VarChar).Value = email;

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        return MapearCliente(dr);
                    }
                }
            }
            return null;
        }

        // Mapeo del cliente
        private Cliente MapearCliente(SqlDataReader dr)
        {
            return new Cliente
            {
                Id = Convert.ToInt32(dr["Id"]),
                NombreEmpresa = dr["NombreEmpresa"].ToString(),
                Nit = dr["Nit"]?.ToString(),
                Email = dr["Email"].ToString(),
                Contrasena = dr["Contrasena"].ToString(),
                Telefono = dr["Telefono"].ToString(),
                Direccion = dr["Direccion"].ToString(),
                Imagen = dr["Imagen"]?.ToString(),
                Barrio = new Barrio
                {
                    Id = Convert.ToInt32(dr["BarrioId"]),
                    Nombre = dr["BarrioNombre"].ToString()
                }
            };
        }

        public bool ActualizarImagen(int idCliente, string rutaImagen)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();
                string sql = "UPDATE Cliente SET Imagen = @Img WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Img", rutaImagen);
                cmd.Parameters.AddWithValue("@Id", idCliente);

                return cmd.ExecuteNonQuery() > 0;
            }
        }

        // Trae todos los barrios para el DropDown
        public List<Barrio> ObtenerBarrios()
        {
            List<Barrio> lista = new List<Barrio>();

            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();
                string sql = "SELECT Id, Nombre FROM Barrio ORDER BY Nombre";
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new Barrio
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        Nombre = dr["Nombre"].ToString()
                    });
                }
            }

            return lista;
        }

        // Actualiza los datos del cliente en la BD
        public bool ActualizarCliente(Cliente cliente)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();
                string sql = @"UPDATE Cliente SET 
                            NombreEmpresa = @Nombre,
                            Email         = @Email,
                            Telefono      = @Telefono,
                            Direccion     = @Direccion,
                            IdBarrio      = @IdBarrio
                            WHERE Id = @Id";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Nombre", cliente.NombreEmpresa);
                cmd.Parameters.AddWithValue("@Email", cliente.Email);
                cmd.Parameters.AddWithValue("@Telefono", cliente.Telefono);
                cmd.Parameters.AddWithValue("@Direccion", cliente.Direccion);
                cmd.Parameters.AddWithValue("@IdBarrio", cliente.Barrio.Id);
                cmd.Parameters.AddWithValue("@Id", cliente.Id);

                return cmd.ExecuteNonQuery() > 0;
            }
        }

        // Actualizar la contrasena del usuario 
        public bool ActualizarContrasena(int idCliente, string nuevaContrasena)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();
                string sql = "UPDATE Cliente SET Contrasena = @Pass WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Pass", nuevaContrasena);
                cmd.Parameters.AddWithValue("@Id", idCliente);

                return cmd.ExecuteNonQuery() > 0;
            }
        }

        // Metodo Para insertar datos de Cliente 
        public bool MtInsertarDatosCliente(Cliente cliente)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = @"INSERT INTO Cliente 
                (NombreEmpresa, Nit, Direccion, Email, Contrasena, Telefono, Imagen, IdBarrio)
                VALUES 
                (@NombreEmpresa, @Nit, @Direccion, @Email, @Contrasena, @Telefono, @Imagen, @IdBarrio)";

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@NombreEmpresa", cliente.NombreEmpresa);
                cmd.Parameters.AddWithValue("@Nit", cliente.Nit);
                cmd.Parameters.AddWithValue("@Direccion", cliente.Direccion);
                cmd.Parameters.AddWithValue("@Email", cliente.Email);
                cmd.Parameters.AddWithValue("@Contrasena", cliente.Contrasena);
                cmd.Parameters.AddWithValue("@Telefono", cliente.Telefono);

                cmd.Parameters.AddWithValue("@Imagen",
                    string.IsNullOrEmpty(cliente.Imagen) ? (object)DBNull.Value : cliente.Imagen);

                cmd.Parameters.AddWithValue("@IdBarrio", cliente.Barrio.Id);

                return cmd.ExecuteNonQuery() > 0;
            }
        }

        //Metodo para obtener client por Id
        public Cliente MtObtenerPorId(int idCliente)
        {
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();

                string sql = @"SELECT C.*, B.Id AS BarrioId, B.Nombre AS BarrioNombre 
                       FROM Cliente C
                       INNER JOIN Barrio B ON C.IdBarrio = B.Id
                       WHERE C.Id = @Id";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Id", idCliente);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    return new Cliente
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        NombreEmpresa = dr["NombreEmpresa"].ToString(),
                        Email = dr["Email"].ToString(),
                        Contrasena = dr["Contrasena"].ToString(),
                        Telefono = dr["Telefono"].ToString(),
                        Direccion = dr["Direccion"].ToString(),
                        Imagen = dr["Imagen"].ToString(),
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

    }
}