-- Horario Laboral (Bodega)
-- Tabla nueva: no existía ningún concepto de jornada laboral en el proyecto.
-- Un usuario puede tener varios días asignados, cada uno con su propia hora
-- de entrada/salida (permite horarios distintos por día, ej. sábado medio día).
-- NumeroDia (1=Lunes ... 7=Domingo) existe solo para poder ordenar el reporte
-- por día de la semana en vez de orden alfabético.

IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE Name = N'HorarioLaboral')
BEGIN
    CREATE TABLE HorarioLaboral
    (
        Id           INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        IdUsuario    INT NOT NULL,
        NumeroDia    TINYINT NOT NULL,
        DiaSemana    NVARCHAR(20) NOT NULL,
        HoraEntrada  TIME NOT NULL,
        HoraSalida   TIME NOT NULL,
        CONSTRAINT FK_HorarioLaboral_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
        CONSTRAINT CK_HorarioLaboral_NumeroDia CHECK (NumeroDia BETWEEN 1 AND 7)
    );
END
GO

-- Procedimiento almacenado: devuelve el horario de un usuario ordenado por día
-- de la semana (Lunes -> Domingo). Si el usuario no tiene horario, no
-- devuelve filas (la capa de Datos interpreta esto como "sin horario asignado").
IF EXISTS (SELECT 1 FROM sys.procedures WHERE Name = N'sp_ObtenerHorarioLaboralPorUsuario')
BEGIN
    DROP PROCEDURE sp_ObtenerHorarioLaboralPorUsuario;
END
GO

CREATE PROCEDURE sp_ObtenerHorarioLaboralPorUsuario
    @IdUsuario INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DiaSemana,
           HoraEntrada,
           HoraSalida
    FROM   HorarioLaboral
    WHERE  IdUsuario = @IdUsuario
    ORDER  BY NumeroDia;
END
GO
