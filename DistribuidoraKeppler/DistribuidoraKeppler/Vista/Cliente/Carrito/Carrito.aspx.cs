using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Cliente.Carrito
{
    public partial class Carrito1 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static object MtCrearPedido(Pedido oPedido, List<DetallePedido> oDetalles)
        {
            
            Modelo.Cliente cliente = (Modelo.Cliente)HttpContext.Current.Session["Cliente"];
            int idCliente = cliente.Id;
            Pedido nuevoPedido = new Pedido
            {
                Fecha = DateTime.Now,
                Estado = "En Proceso",
                DireccionEntrega = cliente.Direccion,
                Total = oPedido.Total,
                Cliente = new Modelo.Cliente
                {
                    Id = idCliente
                } 

            };

            PedidoL oPedidoL = new PedidoL();

            int idPedido = oPedidoL.MtCrearPedido(nuevoPedido, oDetalles);

            return new { Success = idPedido > 0, IdPedido = idPedido };

        }

        [WebMethod]
        public static object MtGenerarFirma(string referencia, decimal monto, string moneda)
        {
            string apiKey = "4Vj8eK4rloUd272L48hsrarnUA";
            string merchantId = "508029";
            decimal montoRedondeado = Math.Round(monto, 0, MidpointRounding.AwayFromZero);
            string montoFormateado = montoRedondeado.ToString("0.00", System.Globalization.CultureInfo.InvariantCulture);


            string cadenaOriginal = $"{apiKey}~{merchantId}~{referencia}~{montoFormateado}~{moneda}";

            string rutaLog = System.Web.HttpContext.Current.Server.MapPath("~/payu_log_debug.txt");
            System.IO.File.AppendAllText(rutaLog, $"Cadena armada en C#: {cadenaOriginal}{Environment.NewLine}");

            using (MD5 md5 = MD5.Create())
            {
                byte[] inputBytes = Encoding.UTF8.GetBytes(cadenaOriginal);

                byte[] hashBytes = md5.ComputeHash(inputBytes);

                StringBuilder sb = new StringBuilder();

                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("x2"));
                }
                string firma = sb.ToString();

                System.IO.File.AppendAllText(rutaLog, $"Firma MD5: {firma}{Environment.NewLine}");
                System.IO.File.AppendAllText(rutaLog, $"--- FIN OK ---{Environment.NewLine}");
                return new
                {
                    Success = true,
                    Signature = sb.ToString(),
                    MontoFinal = montoFormateado
                };

            }

        }
    }
}