using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;

namespace DistribuidoraKeppler.Modelo
{
    public class Cliente
    {
        public int Id { get; set; }

        public string NombreEmpresa { get; set; }

        public string Nit { get; set; }

        public string Direccion { get; set; }

        public string Email { get; set; }

        public string Contrasena { get; set; }

        public string Telefono { get; set; }

        public string Imagen { get; set; }

        public Barrio Barrio { get; set; }
    }
}