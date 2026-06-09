using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Cliente.Carrito
{
    public partial class ResultadoPago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                MtRespuestaPago();
            }
        }


        public void MtRespuestaPago()
        {
            string rutaLog = Server.MapPath("~/payu_log_debug.txt");
            File.AppendAllText(rutaLog, $"=== POST RECIBIDO: {DateTime.Now} ==={Environment.NewLine}");

            // Primero loguea TODO lo que llega
            foreach (string key in Request.Form.AllKeys)
            {
                File.AppendAllText(rutaLog, $"{key} = {Request.Form[key]}{Environment.NewLine}");
            }

            // Luego captura los campos
            string referencia = Request.Form["reference_sale"];
            string transaccionId = Request.Form["transaction_id"];
            string estadoPol = Request.Form["state_pol"];         // 4=Aprobado 6=Rechazado 7=Pendiente
            string valor = Request.Form["value"];
            string moneda = Request.Form["currency"];
            string firma = Request.Form["sign"];
            string medioPago = Request.Form["payment_method_type"];
            string correoComprador = Request.Form["buyer_email"];

            File.AppendAllText(rutaLog, $"--- Ref: {referencia} | Estado: {estadoPol} | Valor: {valor} ---{Environment.NewLine}");

            // Paso 2 → llamas tu capa Lógica
            // Paso 3 → la lógica llama tu capa Datos

            Response.Clear();
            Response.StatusCode = 200;
            Response.ContentType = "text/plain";
            Response.Write("OK");
            Response.End();
        }



    }
}
