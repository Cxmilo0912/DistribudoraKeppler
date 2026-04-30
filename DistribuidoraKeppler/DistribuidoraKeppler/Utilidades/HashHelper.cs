using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text; // Importar el espacio de nombres para SHA256

namespace DistribuidoraKeppler.Utilidades
{
    public class HashHelper
    {
        public static string Encriptar(string texto)
        {
            // Implementacion de logica de encriptacion usando SHA256
            using (SHA256 sha = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(texto);
                byte[] hash = sha.ComputeHash(bytes);

                StringBuilder sb = new StringBuilder(); // Crear un StringBuilder para construir la cadena de hash
                foreach (byte b in hash)
                {
                    sb.Append(b.ToString("x2")); // Convertir cada byte a su representación hexadecimal
                }

                return sb.ToString(); // Devolver la cadena de hash resultante
            }

        }
    }
}