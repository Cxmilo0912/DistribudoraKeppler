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

    }
}