using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Modelo
{
    public class Usuario
    {
        public int Id { get; set; }

        public string Nombre { get; set; }

        public string Email { get; set; }

        public string Contrasena { get; set; }

        public byte Estado { get; set; }

        public Rol IdRol { get; set; }
    }
}