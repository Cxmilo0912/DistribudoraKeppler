using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;

namespace DistribuidoraKeppler.Logica
{
    public class LoginL
    {
        public ResultadoLogin MtValidarLogin(string email, string clave)
        {
            UsuarioD usuarioD = new UsuarioD();
            ClienteD clienteD = new ClienteD();

            string hash = HashHelper.Encriptar(clave);
            email = email.Trim();

           
            var usuario = usuarioD.MtObtenerUsuarioPorEmail(email);

            if (usuario != null && usuario.Contrasena == hash)
            {
                return new ResultadoLogin
                {
                    Usuario = usuario,
                    Rol = usuario.Rol.Nombre
                };
            }

         
            var cliente = clienteD.ObtenerPorEmail(email);

            if (cliente != null && cliente.Contrasena == hash)
            {
                return new ResultadoLogin
                {
                    Cliente = cliente,
                    Rol = "cliente"
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