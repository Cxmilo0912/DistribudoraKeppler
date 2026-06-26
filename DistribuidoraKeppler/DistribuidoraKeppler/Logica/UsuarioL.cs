using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;
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
            
            if (u == null)
                return false;

            // Validar que el nombre y el email no estén vacíos
            if (string.IsNullOrEmpty(u.Nombre) || string.IsNullOrEmpty(u.Email))
                return false;

            if (!u.Email.Contains("@"))
                return false;

            var existente = oUsuarioD.ObtenerPorCorreo(u.Email);

            // validar que no sea otro usuario
            if (existente != null && ((Usuario)existente).Id != u.Id)
                return false;

            return oUsuarioD.ActualizarUsuario(u);
        }

        // Metodo para cambiar contraseña
        public bool MtCambiarContrasena(int idUsuario, string actual, string nueva)
        {
            if (string.IsNullOrEmpty(actual) || string.IsNullOrEmpty(nueva))
                return false;

            var usuario = oUsuarioD.MtObtenerUsuarioPorId(idUsuario);

            if (usuario == null)
                return false;

            string hashActual = HashHelper.Encriptar(actual);

            // Validar contraseña actual
            if (usuario.Contrasena != hashActual)
                return false;

            // Validar longitud mínima
            if (nueva.Length < 6)
                return false;

            string hashNueva = HashHelper.Encriptar(nueva);

            return oUsuarioD.ActualizarContrasena(idUsuario, hashNueva);
        }

        // Metodo para actualizar foto
        public bool MtActualizarFoto(int idUsuario, string ruta)
        {
            if (string.IsNullOrEmpty(ruta))
                return false;

            return oUsuarioD.ActualizarFoto(idUsuario, ruta);
        }

        // Metodo para Crear Usuario nuevo

        public List<Rol> MtListarRoles()
        {
            return oUsuarioD.MtListarRoles();
        }

        public bool MtCrearUsuario(Usuario usuario, int idRol)
        {
            return oUsuarioD.MtCrearUsuario(usuario, idRol);
        }

        public bool MtEditarUsuario(Usuario oUsuario)
        {
            return oUsuarioD.MtEditarUsuario(oUsuario);
        }

        public bool MtEliminarUsuario(int id)
        {
            return oUsuarioD.MtEliminarUsuario(id);
        }


}
}