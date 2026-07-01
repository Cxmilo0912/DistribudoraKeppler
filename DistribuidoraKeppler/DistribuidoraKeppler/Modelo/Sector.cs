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
        public bool Estado { get; set; }
        public List<Barrio> Barrios { get; set; }
    }
}