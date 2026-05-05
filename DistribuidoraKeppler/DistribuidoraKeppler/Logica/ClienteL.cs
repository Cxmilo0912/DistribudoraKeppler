using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica
{
    public class ClienteL
    {
        ClienteD oClienteD = new ClienteD();
        
        // Obtener cliente por Id
        public Cliente MtObtenerPorId(int id)
        {
            if (id <= 0) return null;

            return oClienteD.MtObtenerPorId(id);
        }

        public Cliente MtObtenerPorEmail(string email)
        {
            if (string.IsNullOrEmpty(email)) return null;

            return oClienteD.MtObtenerPorEmail(email);
        }
        // Metodo Para crear nuevo cliente
        public bool MtCrearCliente(Cliente cliente, string clave)
        {
            if (cliente == null) return false;

            if (string.IsNullOrEmpty(cliente.Email) ||
                string.IsNullOrEmpty(clave) ||
                string.IsNullOrEmpty(cliente.NombreEmpresa))
                return false;

            UsuarioD usuarioD = new UsuarioD();
            var existente = usuarioD.ObtenerPorCorreo(cliente.Email);

            if (existente != null)
                return false;

            cliente.Contrasena = HashHelper.Encriptar(clave);

            return oClienteD.MtInsertarDatosCliente(cliente);
        }

        // Metodo Para cambiar la Contraseña
        public bool MtCambiaContrasena(int idCliente, string actual, string nueva)
        {
            var cliente = oClienteD.MtObtenerPorId(idCliente);

            if (cliente == null) return false;

            string hashActual = HashHelper.Encriptar(actual);

            if (cliente.Contrasena != hashActual)
                return false;

            string hashNueva = HashHelper.Encriptar(nueva);

            return oClienteD.ActualizarContrasena(idCliente, hashNueva);
        }

        // Metodo para Actualizar Perfil
        public bool MtActualizarPerfil(Cliente cliente)
        {
            if (cliente == null)
                return false;

            if (string.IsNullOrEmpty(cliente.NombreEmpresa) ||
                string.IsNullOrEmpty(cliente.Email))
                return false;

            if (!cliente.Email.Contains("@"))
                return false;

            // Validar duplicado (opcional pero recomendado)
            UsuarioD usuarioD = new UsuarioD();
            var existente = usuarioD.ObtenerPorCorreo(cliente.Email);

            if (existente != null && ((Cliente)existente).Id != cliente.Id)
                return false;

            return oClienteD.ActualizarCliente(cliente);
        }

        public bool MtActualizarImagen(int idCliente, string ruta)
        {
            if (string.IsNullOrEmpty(ruta))
                return false;

            return oClienteD.ActualizarImagen(idCliente, ruta);
        }
    }
}