using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica
{
    public class GestionUsuarioL
    {

        public List<Usuario> MtListarTrabajadores()
        {
            GestionUsuarioD oGestionUsuarioD = new Datos.GestionUsuarioD();
            return oGestionUsuarioD.MtListarTrabajadores();
        }
    }
}