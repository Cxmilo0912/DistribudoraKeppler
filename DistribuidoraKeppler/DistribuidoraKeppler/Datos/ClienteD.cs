using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;


namespace DistribuidoraKeppler.Datos
{
    public class ClienteD
    {
        public int ObtenerTotalClientes()
        {
            int total = 0;

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string query = "SELECT COUNT(*) FROM Cliente";

                using (SqlCommand cmd = new SqlCommand(query, cn))
                {
                    total = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }

            return total;
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
        public bool ActualizarCliente(Modelo.Cliente cliente)
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

    }
}