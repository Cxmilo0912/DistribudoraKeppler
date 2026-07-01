using System;

namespace DistribuidoraKeppler.Modelo
{
    // Representa un día de la jornada laboral asignada a un usuario
    // (una fila = un día de la semana con su hora de entrada y salida).
    public class HorarioLaboral
    {
        public string DiaSemana { get; set; }

        public TimeSpan HoraEntrada { get; set; }

        public TimeSpan HoraSalida { get; set; }
    }
}
