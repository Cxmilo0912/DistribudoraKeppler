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
        public int MtTotalUsuariosDelSistema()
        {
            GestionUsuarioD oGestionUsuarioD = new GestionUsuarioD();
            return oGestionUsuarioD.MtTotalUsuariosDelSistema();
        }

        public int MtTotalAdministradores()
        {
            GestionUsuarioD oGestionUsuarioD = new GestionUsuarioD();
            return oGestionUsuarioD.MtTotalAdministradores();
        }

        public int MtTotalDistribuidores()
        {
            GestionUsuarioD oGestionUsuarioD = new GestionUsuarioD();
            return oGestionUsuarioD.MtTotalDistribuidores();
        }

        public int MtTotalPreventistas()
        {
            GestionUsuarioD oGestionUsuarioD = new GestionUsuarioD();
            return oGestionUsuarioD.MtTotalPreventistas();
        }

        public int MtTotalPersonalBodega()
        {
            GestionUsuarioD oGestionUsuarioD = new GestionUsuarioD();
            return oGestionUsuarioD.MtTotalPersonalBodega();
        }

        public int MtUsuariosInactivos()
        {
            GestionUsuarioD oGestionUsuarioD = new GestionUsuarioD();
            return oGestionUsuarioD.MtUsuariosInactivos();
        }
    }
}