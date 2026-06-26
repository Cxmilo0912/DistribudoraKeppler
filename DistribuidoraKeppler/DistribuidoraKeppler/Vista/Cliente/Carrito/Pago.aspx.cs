using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Cliente.Carrito
{
    public partial class Pago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                MtRespuestaPago();
            }
            else
            {
                MtCargarInterfazVisual();
            }
        }
        private void MtCargarInterfazVisual()
        {
            string estado = Request.QueryString["lapTransactionState"]; 
            string referencia = Request.QueryString["referenceCode"];
            string transaccionId = Request.QueryString["transactionId"];
            string valor = Request.QueryString["TX_VALUE"];
            string medioPago = Request.QueryString["lapPaymentMethod"];
            string autorizacion = Request.QueryString["authorizationCode"];
            string correo = Request.QueryString["buyerEmail"];
            string fecha = Request.QueryString["processingDate"];

            lblReferencia.Text = referencia ?? "N/A";
            lblTransaccionId.Text = transaccionId ?? "N/A";
            lblMonto.Text = valor != null ? $"${valor} COP" : "$0.00";
            lblMetodoPago.Text = medioPago ?? "N/A";
            lblAutorizacion.Text = string.IsNullOrEmpty(autorizacion) ? "N/A" : autorizacion;
            lblEmail.Text = correo ?? "N/A";
            lblFecha.Text = fecha ?? "N/A";

            if (estado == "4") 
            {
                pnlEstado.CssClass = "rounded-2xl p-8 text-center text-white shadow-xl bg-emerald-600 animate-fade-in";
                lblIcono.Text = "<i class='fas fa-circle-check text-3xl text-white'></i>";
                lblTituloEstado.Text = "¡Pago Aprobado!";
                lblMensaje.Text = "Tu pedido ya está siendo procesado en Distribuidora Keppler.";

                lblTituloEstado.ForeColor = System.Drawing.Color.White;
                lblMensaje.ForeColor = System.Drawing.Color.White;
            }
            else if (estado == "7") 
            {
                pnlEstado.CssClass = "rounded-2xl p-8 text-center text-slate-900 shadow-xl bg-amber-400 animate-fade-in";
                lblIcono.Text = "<i class='fas fa-clock text-3xl text-slate-900'></i>";
                lblTituloEstado.Text = "Pago Pendiente";
                lblMensaje.Text = "La pasarela está verificando tu transacción. Te avisaremos pronto.";

                lblTituloEstado.ForeColor = System.Drawing.Color.FromArgb(15, 23, 42); 
                lblMensaje.ForeColor = System.Drawing.Color.FromArgb(51, 65, 85);    
            }
            else 
            {
                pnlEstado.CssClass = "rounded-2xl p-8 text-center text-white shadow-xl bg-rose-600 animate-fade-in";
                lblIcono.Text = "<i class='fas fa-circle-xmark text-3xl text-white'></i>";
                lblTituloEstado.Text = "Pago Rechazado";
                lblMensaje.Text = "La transacción fue declinada por la pasarela o el banco.";

                lblTituloEstado.ForeColor = System.Drawing.Color.White;
                lblMensaje.ForeColor = System.Drawing.Color.White;
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

            int idPedido = Convert.ToInt32(referencia.Replace("KEP-", ""));

            File.AppendAllText(rutaLog, $"--- Ref: {referencia} | Estado: {estadoPol} | Valor: {valor} ---{Environment.NewLine}");

            MtActualizarPedido(medioPago, estadoPol, idPedido);

            Response.Clear();
            Response.StatusCode = 200;
            Response.ContentType = "text/plain";
            Response.Write("OK");
            Response.End();
        }


        public void MtActualizarPedido(string metodoPago, string estado, int idPedido)
        {
            string estadoTransaccion = (estado == "4") ? "Aprobado" : (estado == "6") ? "Rechazado" : (estado == "7") ? "Pendiente" : "Desconocido";


            Pedido oPedido = new Pedido
            {
                Id = idPedido,
                Estado = estadoTransaccion,
                IdMetodoPago = Convert.ToInt32(metodoPago)
            };

            PedidoL oPedidoL = new PedidoL();

            oPedidoL.MtActualizarPedido(oPedido);
        }
    }
}