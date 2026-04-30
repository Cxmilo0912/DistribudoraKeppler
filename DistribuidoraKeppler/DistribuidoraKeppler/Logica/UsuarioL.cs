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
        private UsuarioD oUsuarioD = new UsuarioD();

        // Metodo para obtener usuario por id
        public Usuario MtObtenerUsuarioPorId(int id)
        {
            return oUsuarioD.MtObtenerUsuarioPorId(id);
        }

        // Metodo para actualizar datos del Usuario
        public bool MtActualizarPerfil(Usuario u)
        {
            // Validar que el nombre y el email no estén vacíos
            if (string.IsNullOrEmpty(u.Nombre) || string.IsNullOrEmpty(u.Email))
            {
                return false;
            }
            return oUsuarioD.ActualizarUsuario(u);
        }

        // Metodo para cambiar contraseña
        public bool MtCambiarContrasena(int idUsuario, string nuevaClave)
        {
            if (string.IsNullOrEmpty(nuevaClave))
                return false;

            string hash = Utilidades.HashHelper.Encriptar(nuevaClave);

            return oUsuarioD.ActualizarContrasena(idUsuario, hash);
        }

        // Metodo para actualizar foto
        public bool MtActualizarFoto(int idUsuario, string ruta)
        {
            if (string.IsNullOrEmpty(ruta))
                return false;

            return oUsuarioD.ActualizarFoto(idUsuario, ruta);
        }

        // Metodo para Crear Usuario nuevo
        public bool MtCrearUsuario(Usuario usuario, string clave)
        {
            if (string.IsNullOrEmpty(clave))
            {
                return false;
            }
            usuario.Contrasena = Utilidades.HashHelper.Encriptar(clave); // Encriptar la contraseña antes de guardarla
            return oUsuarioD.MtInsertarUsuario(usuario);
        }
    }
    
}