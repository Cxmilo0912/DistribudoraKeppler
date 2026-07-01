using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Datos
{
    public class DashboardAdministradorD
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

        public int MtProductosActivos()
        {
            int total = 0;

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = "Select Count(Id) From Producto Where Estado = 'Activo'";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    total = Convert.ToInt32(cmd.ExecuteScalar());
                }

                return total;
            }
        }

        public int MtTotalProductos()
        {
            int total = 0;

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = "Select Count(Id) From Producto";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    total = Convert.ToInt32(cmd.ExecuteScalar());
                }

                return total;
            }
        }

        public int MtPedidosActivos()
        {
            int pedidos = 0;
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = @"SELECT Count(Id) From Pedido Where Estado != 'Entregado';";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    return pedidos = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        public double MtVentasDiarias()
        {
            double ventas = 0;
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                string consulta = @"SELECT ISNULL(SUM(Total), 0) AS VentaDiaria 
                                   FROM Pedido
                                   WHERE CAST(Fecha AS DATE) = CAST(GETDATE() AS DATE);
                                   ";
                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    return ventas = Convert.ToDouble(cmd.ExecuteScalar());
                }
            }
        }

        public List<Pedido> MtUltimosPedidos()
        {
            List<Pedido> lista = new List<Pedido>();

            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                string consulta = @"SELECT TOP 5 
                                    p.CodigoPedido, 
                                    c.NombreEmpresa AS Empresa, 
                                    p.Fecha, 
                                    p.Total, 
                                    p.Estado 
                                FROM Pedido p 
                                INNER JOIN Cliente c ON p.IdCliente = c.Id
                                WHERE p.Fecha >= DATEADD(day, -7, CAST(GETDATE() AS DATE)) 
                                  AND p.Fecha <= GETDATE()
                                ORDER BY p.Fecha DESC;";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        lista.Add(new Pedido
                        {
                            CodigoPedido = dr["CodigoPedido"].ToString(),
                            Cliente = new Cliente
                            {
                                NombreEmpresa = dr["NombreEmpresa"].ToString(),
                            },
                            Fecha = Convert.ToDateTime(dr["Fecha"]),
                            Total = Convert.ToDecimal(dr["Total"]),
                            Estado = dr["Estado"].ToString()
                        });

                    }
                }
            }
            return lista;
        }

        public object MtProductoMasVendido()
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();

                string consulta = @"SELECT TOP 1 
                                       p.Id, 
                                       p.Nombre AS Producto, 
                                       ISNULL(SUM(dp.Cantidad), 0) AS CantidadVendida
                                   FROM Pedido det
                                   INNER JOIN DetallePedido dp ON det.Id = dp.IdPedido
                                   INNER JOIN Producto p ON dp.IdProducto = p.Id
                                   GROUP BY p.Id, p.Nombre
                                   ORDER BY CantidadVendida DESC;";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        if (dr.Read())
                        {
                            return new
                            {
                                Nombre = dr["Producto"].ToString(),
                                CantidadVendida = Convert.ToInt32(dr["CantidadVendida"])
                            };
                        }
                    }
                }
            }
            return new
            {
                Nombre = "Sin ventas",
                Cantidad = 0
            };
        }

        public int MtObtenerStockPorNombre(string nombre)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                string consulta = @"Select Stock from Producto
                                   WHERE Nombre = @nombre
                                   ";

                using (SqlCommand cmd = new SqlCommand(consulta, cn))
                {
                    cmd.Parameters.AddWithValue("@nombre", nombre);

                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }
    }
}