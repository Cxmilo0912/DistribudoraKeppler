using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Datos
{
    public class BarrioD
    {
        public List<Barrio> MtListarBarrios()
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {

                List<Barrio> oBarrios = new List<Barrio>();
                cn.Open();

                string consulta = @"SELECT b.Id, b.Nombre,s.Nombre AS SectorNombre
                                    FROM Barrio b
                                    INNER JOIN Sector s ON b.IdSector = s.Id";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            oBarrios.Add(new Barrio
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Nombre = dr["Nombre"].ToString(),
                                Sector = new Sector
                                {
                                    Nombre = dr["SectorNombre"].ToString()
                                }
                            });
                        }

                    }
                }

                return oBarrios;
            }
        }

        public bool MtRegistrarBarrio(string barrio, int idSector)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                string consulta = @"INSERT INTO Barrio (Nombre, IdSector) VALUES (@nombre, @idSector)";
                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@nombre", barrio);
                    cmd.Parameters.AddWithValue("@idSector", idSector);
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public bool MtEditarBarrio(int idBarrio, string nombre, int idSector)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                string consulta = @"UPDATE Barrio SET Nombre = @nombre, IdSector = @idSector WHERE Id = @id";
                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@nombre", nombre);
                    cmd.Parameters.AddWithValue("@idSector", idSector);
                    cmd.Parameters.AddWithValue("@id", idBarrio);
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }
    }
}