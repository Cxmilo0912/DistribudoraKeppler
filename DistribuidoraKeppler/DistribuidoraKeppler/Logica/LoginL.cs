using DistribuidoraKeppler.Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica
{
    public class LoginL
    {
        public object ValidarLogin(string user, string pass)
        {
            UsuarioD datos = new UsuarioD();
            object resultado = datos.ObtenerUsuario(user, pass);

            if (resultado == null) return null;

            return resultado; 
        }
    }
}