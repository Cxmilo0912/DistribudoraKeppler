using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Modelo
{
    public class Sector
    {
        public int Id { get; set; }

        public string Nombre { get; set; }

        public string DiasVisita { get; set; }

        public int CapacidadMaxima { get; set; }

        public byte Estado { get; set; }

        public Municipio Municipio { get; set; }

    }
}