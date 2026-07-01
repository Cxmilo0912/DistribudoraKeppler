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
        public int MtCrearPedido(Pedido oPedido, List<DetallePedido> oDetalles)
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
                        cmdPedido.Parameters.AddWithValue("@idCliente", oPedido.Cliente.Id);

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
                    return idPedido;
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return 0;
            }
        }


        public bool MtActualizarPedido(Pedido oPedido)
        {
            using (SqlConnection cn = ConexionDB.MtAbrirConexion())
            {
                cn.Open();
                string consulta = @"BEGIN TRY
                                    BEGIN TRANSACTION;

                                    UPDATE Pedido 
                                    SET Estado = @estado
                                    WHERE Id = @idPedido;

                                    INSERT INTO PedidoMetodoPago (IdPedido, IdMetodoPago) 
                                    VALUES (@idPedido, @mPago);

                                    COMMIT TRANSACTION;
                                    END TRY
                                    BEGIN CATCH
                                    IF @@TRANCOUNT > 0
                                    BEGIN
                                    ROLLBACK TRANSACTION;
                                    END

                                    ;THROW;
                                    END CATCH;
                                    ";

                using (SqlCommand cmd = new SqlCommand(consulta,cn))
                {
                    cmd.Parameters.AddWithValue("@estado", oPedido.Estado);
                    cmd.Parameters.AddWithValue("@idPedido", oPedido.Id);
                    cmd.Parameters.AddWithValue("@mPago", oPedido.IdMetodoPago);

                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }
    }
}