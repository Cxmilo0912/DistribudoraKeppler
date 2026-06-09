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
    }
}