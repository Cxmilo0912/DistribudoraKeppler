using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica
{
    public class MarcaL
    {
        public List<Marca> MtListarMarcas() 
        {
            MarcaD oMarcas = new MarcaD();
            List<Marca> lista = oMarcas.ListarMarcas();
            return lista;
        }

        public bool MtEditarMarca(Marca oMarca)
        {
            MarcaD oMarcas = new MarcaD();
            bool resultado = oMarcas.MtEditarMarca(oMarca);
            return resultado;
        }

    }
}