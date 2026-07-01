using DistribuidoraKeppler.Datos.AdminDatos;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica.AdminLogica
{
    public class MunicipioL
    {
        MunicipioD oMunicipioD = new MunicipioD();

        public List<Municipio> MtListarMunicipios()
        {
            if (oMunicipioD.MtListarMunicipios().Count < 0)
            {
                return new List<Municipio>();
            }

            return oMunicipioD.MtListarMunicipios();
        }


        public bool MtCrearMunicipio(Municipio oMunicipio)
        {
            return oMunicipioD.MtCrearMunicipio(oMunicipio);
        }

        public bool MtEditarMunicipio(Municipio oMunicipio, int id)
        {
            return oMunicipioD.MtEditarMunicipio(oMunicipio, id);
        }
    }
}