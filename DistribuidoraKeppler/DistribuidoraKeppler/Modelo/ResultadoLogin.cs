using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Modelo
{
    public class ResultadoLogin
    {
        public Usuario Usuario { get; set; }
        public Cliente Cliente { get; set; }
        public string Rol { get; set; }
    }
}