using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;

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
    }
}