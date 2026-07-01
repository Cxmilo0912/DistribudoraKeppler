using System;

namespace DistribuidoraKeppler.Modelo
{
    public class ReporteEntrega
    {
        public int IdPedido { get; set; }

        public string NumeroPedido { get; set; }

        public Cliente Cliente { get; set; }

        public Usuario Repartidor { get; set; }

        public Sector Sector { get; set; }

        public string Estado { get; set; }

        public DateTime FechaAsignacion { get; set; }

        public DateTime? FechaEntrega { get; set; }

        public string Observaciones { get; set; }
    }
}
