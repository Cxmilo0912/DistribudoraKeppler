using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;
using System.Collections.Generic;

namespace DistribuidoraKeppler.Logica
{
    public class LoginL
    {
        public ResultadoLogin MtValidarLogin(string email, string clave)
        {
            string hash = HashHelper.Encriptar(clave);
            email = email.Trim();

            var usuario = new UsuarioD().MtObtenerUsuarioPorEmail(email);

            if (usuario != null && usuario.Contrasena == hash)
            {
                return new ResultadoLogin
                {
                    Usuario = usuario,
                    Rol = usuario.Rol.Nombre
                };
            }

            var cliente = new ClienteD().MtObtenerPorEmail(email);

            if (cliente != null && cliente.Contrasena == hash)
            {
                return new ResultadoLogin
                {
                    Cliente = cliente,
                    Rol = "Cliente"
                };
            }

            return null;
        }

    
        public bool MtUsuarioNuevo(string contrasena, int idEmpleado)
        {
            UsuarioD datos = new UsuarioD();

            string hash = HashHelper.Encriptar(contrasena);

            return datos.ActualizarContrasena(idEmpleado, hash);
        }

        public bool CambiarContrasenaCliente(int idCliente, string nuevaContrasena)
        {
            ClienteD clienteD = new ClienteD();

            string hash = HashHelper.Encriptar(nuevaContrasena);

            return clienteD.ActualizarContrasena(idCliente, hash);
        }
        public bool CambiarContrasenaPorEmail(string email, string nuevaContrasena)
        {
            string hash = HashHelper.Encriptar(nuevaContrasena);

            UsuarioD datos = new UsuarioD();
            datos.ActualizarPassword(email, hash);

            return datos.ActualizarPassword(email, hash);
        }

        public List<Rol> MtRolesPorUsuario(int idUsuario)
        {
            UsuarioD oUsuarioD = new UsuarioD();
            return oUsuarioD.MtRolesPorUsuario(idUsuario);
        }
    }
}