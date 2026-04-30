
using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica
{
    public class LoginL
    {
        // Método para validar el login de un usuario o cliente
        public ResultadoLogin MtValidarLogin(string email, string clave)
        {
            UsuarioD oUsuarioD = new UsuarioD();
            string hash = HashHelper.Encriptar(clave); // Hash de la contraseña ingresada

            var usuario = oUsuarioD.MtObtenerUsuarioPorEmail(email); // Llamamos al método para obtener el usuario por email

         

            if (usuario != null && usuario.Contrasena == hash)
            {
                return new ResultadoLogin // Si el usuario existe y la contraseña es correcta, devolvemos el resultado con el usuario y su rol
                {
                    Usuario = usuario,
                    Rol = usuario.Rol.Nombre
                };
            }

            var cliente = oUsuarioD.MtObtenerClientePorEmail(email); // Si no se encontró un usuario, intentamos obtener un cliente por email

            if (cliente != null && cliente.Contrasena == hash)
            {
                return new ResultadoLogin // Lo mismo que hicimos con el usuario, pero para el cliente
                {
                    Cliente = cliente,
                    Rol = "Cliente"
                };
            }

            return null; // Si no se encontró ni un usuario ni un cliente, devolvemos null
        }

        public string MtUsuarioNuevo(string contrasena, int idEmpleado)
        {
            UsuarioD datos = new UsuarioD();            
            string resultado = datos.MtNuevoUsuario(contrasena, idEmpleado);
            return resultado;
        }
    }
}