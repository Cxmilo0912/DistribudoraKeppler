using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Datos.AdminDatos
{
    public class SectorD
    {
        public List<Sector> MtListarSectores()
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                List<Sector> lista = new List<Sector>();

                string consulta = @"Select s.Id, s.Nombre, s.DiasVisita, s.CapacidadMaxima, s.Estado, m.Id as IdMunicipio, m.Nombre as Municipio From Sector s
                                   Inner JOIN Municipio m
                                   ON
                                   s.IdMunicipio = m.Id;";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new Sector
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Nombre = dr["Nombre"].ToString(),
                                DiasVisita = dr["DiasVisita"].ToString(),
                                CapacidadMaxima = Convert.ToInt32(dr["CapacidadMaxima"]),
                                Estado = Convert.ToByte(dr["Estado"]),
                                Municipio = new Municipio
                                {
                                    Id = Convert.ToInt32(dr["IdMunicipio"]),
                                    Nombre = dr["Municipio"].ToString()
                                }

                            });
                        }
                    }
                }

                return lista;
            }
        }

        public bool MtCrearSector(Sector oSector)
        {

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = @"Insert Into Sector(Nombre, DiasVisita, CapacidadMaxima, Estado, IdMunicipio)
                                   Values(@nom, @dVisita, @capacidad, @estado, @idMunicipio)";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@nom", oSector.Nombre);
                    cmd.Parameters.AddWithValue("@dVisita", oSector.DiasVisita);
                    cmd.Parameters.AddWithValue("@capacidad", oSector.CapacidadMaxima);
                    cmd.Parameters.AddWithValue("@estado", oSector.Estado);
                    cmd.Parameters.AddWithValue("@idMunicipio", oSector.Municipio.Id);


                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public bool MtEditarSector(Sector oSector)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = @"UPDATE Sector 
                                   SET 
                                   Nombre = @nom, 
                                   DiasVisita = @dVisita, 
                                   CapacidadMaxima = @capacidad, 
                                   Estado = @estado, 
                                   IdMunicipio = @idMunicipio
                                   WHERE Id = @id;";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@nom", oSector.Nombre);
                    cmd.Parameters.AddWithValue("@dVisita", oSector.DiasVisita);
                    cmd.Parameters.AddWithValue("@capacidad", oSector.CapacidadMaxima);
                    cmd.Parameters.AddWithValue("@estado", oSector.Estado);
                    cmd.Parameters.AddWithValue("@idMunicipio", oSector.Municipio.Id);
                    cmd.Parameters.AddWithValue("@id", oSector.Id);


                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public List<Sector> MtSectoresPorMunicipio(int idMunicipio)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                List<Sector> lista = new List<Sector>();

                string consulta = @"Select s.Id, s.Nombre From Sector s 
                                   Inner Join Municipio m 
                                   ON 
                                   s.IdMunicipio = m.Id
                                   Where m.Id = @municipio";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@municipio", idMunicipio);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(new Sector
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Nombre = dr["Nombre"].ToString()
                            });
                        }
                        return lista;
                    }
                }
            }
        }
    }
}