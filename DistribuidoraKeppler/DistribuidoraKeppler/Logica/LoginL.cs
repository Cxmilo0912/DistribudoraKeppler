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

            if (resultado == null) return null; // Error de credenciales

            // Aquí podrías agregar reglas de negocio, por ejemplo:
            // "Si es un trabajador pero su cuenta está desactivada..."

            return resultado; // Pasa el objeto (sea Usuario o Cliente) a Presentación
        }
    }
}