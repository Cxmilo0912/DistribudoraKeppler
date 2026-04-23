using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Datos
{
    public class GestionUsuarioD
    {
        public List<Usuario> MtListarTrabajadores()
        {
            List<Usuario> oTrabajadores = new List<Usuario>();
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                using (SqlCommand cmd = new SqlCommand("listarTrabajadores", cn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        List<Usuario> lista = new List<Usuario>();
                        while (dr.Read())
                        {
                            oTrabajadores.Add(new Usuario
                            {
                                Nombre = dr["Nombre"].ToString(),
                                Email = dr["Email"].ToString(),
                                Estado = Convert.ToByte(dr["Estado"]),
                                Rol = new Rol
                                {
                                    Nombre = dr["NombreRol"].ToString()
                                }
                            });
                        }

                    }
                    return oTrabajadores;
                }
            }
        }
    }

}
