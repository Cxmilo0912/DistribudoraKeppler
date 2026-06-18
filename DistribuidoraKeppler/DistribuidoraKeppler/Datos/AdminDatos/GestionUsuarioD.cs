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

                using (SqlCommand cmd = new SqlCommand("spListarTrabajadores", cn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        List<Usuario> lista = new List<Usuario>();
                        while (dr.Read())
                        {
                            oTrabajadores.Add(new Usuario
                            {
                                Id = Convert.ToInt32(dr["Id"]),
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

        public int MtTotalUsuariosDelSistema()
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                using (SqlCommand cmd = new SqlCommand("spTotalUsuarios", cn))
                {
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        public int MtTotalAdministradores()
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                using (SqlCommand cmd = new SqlCommand("spTotalAdministradores", cn))
                {
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        public int MtTotalDistribuidores()
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                using (SqlCommand cmd = new SqlCommand("spTotalDistribuidores", cn))
                {
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        public int MtTotalPreventistas()
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                using (SqlCommand cmd = new SqlCommand("spTotalPreventistas", cn))
                {
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }

        }

        public int MtUsuariosInactivos()
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                using (SqlCommand cmd = new SqlCommand("spUsuariosInactivos", cn))
                {
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        public int MtTotalPersonalBodega()
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                using (SqlCommand cmd = new SqlCommand("spTotalPersonalBodega", cn))
                {
                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }
}
}
