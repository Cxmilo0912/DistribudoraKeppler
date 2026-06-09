using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Modelo
{
    public class Pedido
    {
        public int Id { get; set; }

        public string CodigoPedido { get; set; }

        public DateTime Fecha { get; set; }

        public string Estado { get; set; }

        public string DireccionEntrega { get; set; }

        public decimal Total { get; set; }

        public Cliente IdCliente { get; set; }


    }
}