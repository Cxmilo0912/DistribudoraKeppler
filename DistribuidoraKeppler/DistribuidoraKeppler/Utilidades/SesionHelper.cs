using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Utilidades
{
    public class SesionHelper
    {
        // Propiedades para acceder al usuario almacenado en la sesión
        public static Usuario Usuario
        {
            get => HttpContext.Current.Session["Usuario"] as Usuario; // Obtiene el usuario de la sesión
            set => HttpContext.Current.Session["Usuario"] = value; // Establece el usuario en la sesión
        }
        public static Cliente Cliente
        {
            get => HttpContext.Current.Session["Cliente"] as Cliente; // Obtiene el cliente de la sesión
            set => HttpContext.Current.Session["Cliente"] = value; // Establece el cliente en la sesión
        }
        public static string Rol
        {
            get => HttpContext.Current.Session["Rol"]?.ToString(); // Obtiene el rol de la sesión
            set => HttpContext.Current.Session["Rol"] = value; // Establece el rol en la sesión
        }

        // Establecemos metodo para la autenticación de la sesión
        public static bool MtEstaAutenticado()
        {
            return Usuario != null || Cliente != null; // Verifica si hay un usuario o cliente autenticado en la sesión
        }

        // Método para cerrar la sesión
        public static void MtCerrarSesion()
        {
            HttpContext.Current.Session.Clear(); // Limpia toda la sesión
            HttpContext.Current.Session.Abandon(); // Abandona la sesión actual
        }

    }
}