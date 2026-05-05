using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;

namespace DistribuidoraKeppler.Logica
{
    public class ClienteL
    {
        ClienteD clienteD = new ClienteD();
        UsuarioD usuarioD = new UsuarioD();

        
        public bool MtCrearCliente(Cliente cliente, string clave)
        {
            if (cliente == null) return false;

            if (string.IsNullOrEmpty(cliente.Email) ||
                string.IsNullOrEmpty(clave) ||
                string.IsNullOrEmpty(cliente.NombreEmpresa))
                return false;

            var existente = usuarioD.ObtenerPorCorreo(cliente.Email);

            if (existente != null)
                return false;

            cliente.Contrasena = HashHelper.Encriptar(clave);

            return clienteD.MtInsertarDatosCliente(cliente);
        }

   
        public bool MtCambiaContrasena(int idCliente, string actual, string nueva)
        {
            var cliente = clienteD.MtObtenerPorId(idCliente);

            if (cliente == null) return false;

            string hashActual = HashHelper.Encriptar(actual);

            if (cliente.Contrasena != hashActual)
                return false;

            string hashNueva = HashHelper.Encriptar(nueva);

            return clienteD.ActualizarContrasena(idCliente, hashNueva);
        }

        public bool MtActualizarPerfil(Cliente cliente)
        {
            if (cliente == null)
                return false;

            if (string.IsNullOrEmpty(cliente.NombreEmpresa) ||
                string.IsNullOrEmpty(cliente.Email))
                return false;

            if (!cliente.Email.Contains("@"))
                return false;

            var existente = usuarioD.ObtenerPorCorreo(cliente.Email);

            if (existente != null)
            {
                // Si es Cliente
                if (existente is Cliente clienteExistente)
                {
                    if (clienteExistente.Id != cliente.Id)
                        return false;
                }
                else
                {
                    return false;
                }
            }

            return clienteD.ActualizarCliente(cliente);
        }
    }
}