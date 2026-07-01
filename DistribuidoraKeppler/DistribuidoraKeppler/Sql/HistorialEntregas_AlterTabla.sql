-- Historial de Entregas (Bodega)
-- La tabla UsuarioPedido relaciona un pedido con el repartidor que lo tiene asignado,
-- pero no registraba el momento en el que la entrega se completó.
-- Este script agrega el único campo necesario para poder consultar ese historial:
-- la fecha y hora de la entrega.

IF NOT EXISTS (
    SELECT 1 FROM sys.columns
    WHERE Name = N'FechaEntrega' AND Object_ID = Object_ID(N'UsuarioPedido')
)
BEGIN
    ALTER TABLE UsuarioPedido ADD FechaEntrega DATETIME NULL;
END
GO

-- Cuando se marque un pedido como entregado, además de:
--     UPDATE Pedido SET Estado = 'Entregado' WHERE Id = @idPedido;
-- se debe registrar la fecha/hora de la entrega en UsuarioPedido:
--     UPDATE UsuarioPedido SET FechaEntrega = GETDATE()
--     WHERE IdPedido = @idPedido AND IdUsuario = @idRepartidor;
