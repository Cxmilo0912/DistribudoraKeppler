using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Datos.AdminDatos
{
    public class MunicipioD
    {

        public List<Municipio> MtListarMunicipios()
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                List<Municipio> lista = new List<Municipio>();
                cn.Open();

                string consulta = @"Select m.*, Count(s.Id) as Sectores From Municipio m
                                    Left Join Sector s
                                    ON
                                    m.Id = s.IdMunicipio
                                    Group By m.Id, m.Nombre, m.Estado;";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {

                            lista.Add(new Municipio
                            {
                                Id = Convert.ToInt32(dr["Id"]),
                                Nombre = dr["Nombre"].ToString(),
                                Estado = Convert.ToByte(dr["Estado"]),
                                CantidadSectores = Convert.ToInt32(dr["Sectores"])
                            });


                        }
                    }
                }
                return lista;
            }
        }

        public bool MtCrearMunicipio(Municipio oMunicipio)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = @"Insert Into Municipio(Nombre, Estado) Values(@nombre, @estado)";

                using (SqlCommand cmd = new SqlCommand(consulta,cn))
                {
                    cmd.Parameters.AddWithValue("@nombre", oMunicipio.Nombre);
                    cmd.Parameters.AddWithValue("@estado", oMunicipio.Estado);

                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        public bool MtEditarMunicipio(Municipio oMunicipio, int id)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = @"Update Municipio Set Nombre = @nombre, Estado = @estado Where Id = @Id";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@nombre", oMunicipio.Nombre);
                    cmd.Parameters.AddWithValue("@estado", oMunicipio.Estado);
                    cmd.Parameters.AddWithValue("@Id", id);

                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        
    }
}