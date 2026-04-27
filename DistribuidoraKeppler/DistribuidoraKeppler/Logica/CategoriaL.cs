using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica
{
    public class CategoriaL
    {
        CategoriaD categoria = new CategoriaD();
        public List<Categoria> MtObtenerCategorias()
        {
            return categoria.MtObtenerCategorias();
        }
    }
}