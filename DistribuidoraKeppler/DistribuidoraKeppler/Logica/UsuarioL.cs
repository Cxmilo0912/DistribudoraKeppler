using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica
{
    public class UsuarioL
    {
        public UsuarioM ValidarLogin(string Usuario, string Contraseña)
        {
            UsuarioD datos = new UsuarioD();
            return datos.ObtenerUsuario(Usuario,Contraseña);
        }
    }
}