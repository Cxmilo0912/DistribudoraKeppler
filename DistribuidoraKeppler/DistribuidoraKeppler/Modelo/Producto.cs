using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Modelo
{
    public class Producto
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public int Stock { get; set; }
        public string Estado { get; set; }
        public int LimiteVenta { get; set; }
        public int LimiteMinimo { get; set; }
        public int LimiteMaximo { get; set; }
        public int IdMarca { get; set; }
        public int IdCategoria { get; set; }
        public string MarcaNombre { get; set; }
        public string CategoriaNombre { get; set; }
    }
}