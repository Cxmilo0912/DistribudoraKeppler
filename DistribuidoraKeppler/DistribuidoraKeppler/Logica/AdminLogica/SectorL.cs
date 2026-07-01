using DistribuidoraKeppler.Datos.AdminDatos;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica
{
    public class SectorL
    {
        SectorD oSectorD = new SectorD();

        public List<Sector> MtListarSectores()
        {
            if (oSectorD.MtListarSectores().Count < 0)
            {
                return new List<Sector>();
            }

            return oSectorD.MtListarSectores();
        }


        public bool MtCrearSector(Sector oSector)
        {
             bool resultado = oSectorD.MtCrearSector(oSector);

            return resultado == true ? true : false;
        }

        public bool MtEditarSector(Sector oSector)
        {
            return oSectorD.MtEditarSector(oSector);
        }

        public List<Sector> MtSectoresPorMunicipio(int idMunicipio)
        {
            return oSectorD.MtSectoresPorMunicipio(idMunicipio);
        }
    }
}