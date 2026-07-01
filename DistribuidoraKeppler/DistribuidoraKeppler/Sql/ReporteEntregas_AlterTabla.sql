-- Reporte de Entregas (Bodega)
-- UsuarioPedido ya tiene FechaEntrega (historial de entregas). Para el reporte de
-- entregas realizadas/pendientes faltan dos campos:
--   - FechaAsignacion: cuándo se asignó el pedido al repartidor (se usa para filtrar
--     por fecha las entregas que aún no tienen FechaEntrega).
--   - Observaciones: notas libres sobre la asignación/entrega.

IF NOT EXISTS (
    SELECT 1 FROM sys.columns
    WHERE Name = N'FechaAsignacion' AND Object_ID = Object_ID(N'UsuarioPedido')
)
BEGIN
    ALTER TABLE UsuarioPedido
        ADD FechaAsignacion DATETIME NOT NULL CONSTRAINT DF_UsuarioPedido_FechaAsignacion DEFAULT (GETDATE());
END
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.columns
    WHERE Name = N'Observaciones' AND Object_ID = Object_ID(N'UsuarioPedido')
)
BEGIN
    ALTER TABLE UsuarioPedido ADD Observaciones NVARCHAR(500) NULL;
END
GO
