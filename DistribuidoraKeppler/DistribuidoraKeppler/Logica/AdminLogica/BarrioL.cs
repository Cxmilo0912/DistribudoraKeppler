using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica.AdminLogica
{
    public class BarrioL
    {
        BarrioD oBarrioD = new BarrioD();

        public List<Barrio> MtListarBarrios()
        {
            return oBarrioD.MtListarBarrios();
        }

        public bool MtRegistrarBarrio(string barrio, int idSector)
        {
            return oBarrioD.MtRegistrarBarrio(barrio, idSector);
        }

        public bool MtActualizarBarrio(int idBarrio, string nombre, int idSector)
        {
            return oBarrioD.MtEditarBarrio(idBarrio,nombre,idSector);
        }

    }
}