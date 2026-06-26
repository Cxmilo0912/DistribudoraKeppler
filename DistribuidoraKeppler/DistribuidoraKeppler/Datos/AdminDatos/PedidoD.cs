using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Datos
{
    public class PedidoD
    {
        public bool MtCrearPedido(Pedido oPedido, List<DetallePedido> oDetalles)
        {
            try
            {
                using (SqlConnection cn = ConexionDB.MtAbrirConexion())
                {
                    cn.Open();
                    int idPedido = 0;

                    string consultaPedido = @"Insert Into Pedido (Fecha, Estado, DireccionEntrega, Total, IdCliente)
                                        Values (@fecha, @estado, @direccion, @total, @idCliente);
                                        Select SCOPE_IDENTITY()";

                    string consultaDetalles = @"Insert Into DetallePedido (Cantidad, PrecioUnitario, IdPedido, IdProducto)
                                          Values (@cantidad, @precio, @idPedido, @idProducto)";

                    using (SqlCommand cmdPedido = new SqlCommand(consultaPedido, cn))
                    {
                        cmdPedido.Parameters.AddWithValue("@fecha", oPedido.Fecha);
                        cmdPedido.Parameters.AddWithValue("@estado", oPedido.Estado);
                        cmdPedido.Parameters.AddWithValue("@direccion", oPedido.DireccionEntrega);
                        cmdPedido.Parameters.AddWithValue("@total", oPedido.Total);
                        cmdPedido.Parameters.AddWithValue("@idCliente", oPedido.IdCliente.Id);

                        idPedido = Convert.ToInt32(cmdPedido.ExecuteScalar());

                    }

                    foreach (DetallePedido detalle in oDetalles)
                    {
                        using (SqlCommand cmdDetalle = new SqlCommand(consultaDetalles, cn))
                        {
                            cmdDetalle.Parameters.AddWithValue("@cantidad", detalle.Cantidad);
                            cmdDetalle.Parameters.AddWithValue("@precio", detalle.PrecioUnitario);
                            cmdDetalle.Parameters.AddWithValue("@idPedido", idPedido);
                            cmdDetalle.Parameters.AddWithValue("@idProducto", detalle.IdProducto.Id);

                            cmdDetalle.ExecuteNonQuery();
                        }
                    }

                }
                return true;
            }
            catch (Exception ex) 
            {
                Console.WriteLine(ex.Message);
                return false;
            }
        }

        public List<Pedido> MtObtenerUltimosPedidosPorCliente(int idCliente, int cantidad = 5)
        {
            var lista = new List<Pedido>();
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();
                string sql = @"SELECT TOP (@cantidad) Id, CodigoPedido, Fecha, Estado, DireccionEntrega, Total
                               FROM Pedido
                               WHERE IdCliente = @IdCliente
                               ORDER BY Fecha DESC";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@cantidad", cantidad);
                cmd.Parameters.AddWithValue("@IdCliente", idCliente);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lista.Add(new Pedido
                    {
                        Id           = Convert.ToInt32(dr["Id"]),
                        CodigoPedido = dr["CodigoPedido"] == DBNull.Value ? null : dr["CodigoPedido"].ToString(),
                        Fecha        = Convert.ToDateTime(dr["Fecha"]),
                        Estado       = dr["Estado"].ToString(),
                        DireccionEntrega = dr["DireccionEntrega"].ToString(),
                        Total        = Convert.ToDecimal(dr["Total"])
                    });
                }
            }
            return lista;
        }

        public List<Pedido> MtObtenerTodosPedidosPorCliente(int idCliente)
        {
            var lista = new List<Pedido>();
            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();
                string sql = @"SELECT Id, CodigoPedido, Fecha, Estado, DireccionEntrega, Total
                               FROM Pedido
                               WHERE IdCliente = @IdCliente
                               ORDER BY Fecha DESC";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@IdCliente", idCliente);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lista.Add(new Pedido
                    {
                        Id               = Convert.ToInt32(dr["Id"]),
                        CodigoPedido     = dr["CodigoPedido"] == DBNull.Value ? null : dr["CodigoPedido"].ToString(),
                        Fecha            = Convert.ToDateTime(dr["Fecha"]),
                        Estado           = dr["Estado"].ToString(),
                        DireccionEntrega = dr["DireccionEntrega"].ToString(),
                        Total            = Convert.ToDecimal(dr["Total"])
                    });
                }
            }
            return lista;
        }

        public void MtObtenerEstadisticasCliente(int idCliente,
            out int pedidosMes, out decimal totalMes, out int enProceso,
            out int pedidosMesAnterior, out decimal totalMesAnterior)
        {
            pedidosMes = 0; totalMes = 0; enProceso = 0;
            pedidosMesAnterior = 0; totalMesAnterior = 0;

            using (SqlConnection con = ConexionDB.MtAbrirConexion())
            {
                con.Open();
                string sql = @"
                    SELECT
                        COUNT(CASE WHEN MONTH(Fecha) = MONTH(GETDATE()) AND YEAR(Fecha) = YEAR(GETDATE()) THEN 1 END) AS PedidosMes,
                        ISNULL(SUM(CASE WHEN MONTH(Fecha) = MONTH(GETDATE()) AND YEAR(Fecha) = YEAR(GETDATE()) THEN Total END), 0) AS TotalMes,
                        COUNT(CASE WHEN Estado NOT IN ('Entregado','Cancelado') THEN 1 END) AS EnProceso,
                        COUNT(CASE WHEN MONTH(Fecha) = MONTH(DATEADD(MONTH,-1,GETDATE())) AND YEAR(Fecha) = YEAR(DATEADD(MONTH,-1,GETDATE())) THEN 1 END) AS PedidosMesAnterior,
                        ISNULL(SUM(CASE WHEN MONTH(Fecha) = MONTH(DATEADD(MONTH,-1,GETDATE())) AND YEAR(Fecha) = YEAR(DATEADD(MONTH,-1,GETDATE())) THEN Total END), 0) AS TotalMesAnterior
                    FROM Pedido
                    WHERE IdCliente = @IdCliente";

                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@IdCliente", idCliente);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    pedidosMes         = Convert.ToInt32(dr["PedidosMes"]);
                    totalMes           = Convert.ToDecimal(dr["TotalMes"]);
                    enProceso          = Convert.ToInt32(dr["EnProceso"]);
                    pedidosMesAnterior = Convert.ToInt32(dr["PedidosMesAnterior"]);
                    totalMesAnterior   = Convert.ToDecimal(dr["TotalMesAnterior"]);
                }
            }
        }

        public bool MtCancelarPedido(int idPedido, int idCliente)
        {
            try
            {
                using (SqlConnection cn = ConexionDB.MtAbrirConexion())
                {
                    cn.Open();
                    string sql = @"UPDATE Pedido SET Estado = 'Cancelado'
                                   WHERE Id = @idPedido AND IdCliente = @idCliente
                                   AND Estado IN ('Pendiente', 'En Proceso')";
                    using (SqlCommand cmd = new SqlCommand(sql, cn))
                    {
                        cmd.Parameters.AddWithValue("@idPedido", idPedido);
                        cmd.Parameters.AddWithValue("@idCliente", idCliente);
                        return cmd.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }
        }
    }
}