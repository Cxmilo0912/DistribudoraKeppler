using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using DistribuidoraKeppler.Utilidades;
using iTextSharp.text;
using iTextSharp.text.pdf;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Bodega
{
    public partial class ReporteEntregas : Page
    {
        private static readonly string[] Encabezados =
        {
            "N° Pedido", "Cliente", "Repartidor", "Sector", "Estado",
            "Fecha asignación", "Fecha entrega", "Observaciones"
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null || SesionHelper.Rol != "Bodega")
            {
                Response.Redirect("~/Vista/Auth/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                MtCargarFiltros();
                MtCargarReporte();
            }
        }

        private void MtCargarFiltros()
        {
            BodegaL oBodegaL = new BodegaL();

            ddlRepartidor.Items.Clear();
            ddlRepartidor.Items.Add(new System.Web.UI.WebControls.ListItem("Todos", "0"));
            foreach (Modelo.Usuario u in oBodegaL.MtListarRepartidoresConSectores())
            {
                ddlRepartidor.Items.Add(new System.Web.UI.WebControls.ListItem(u.Nombre, u.Id.ToString()));
            }

            ddlSector.Items.Clear();
            ddlSector.Items.Add(new System.Web.UI.WebControls.ListItem("Todos", "0"));
            foreach (Sector s in oBodegaL.MtListarSectores())
            {
                ddlSector.Items.Add(new System.Web.UI.WebControls.ListItem(s.Nombre, s.Id.ToString()));
            }
        }

        private List<ReporteEntrega> MtObtenerReporteFiltrado()
        {
            int idRepartidor;
            int.TryParse(ddlRepartidor.SelectedValue, out idRepartidor);

            int idSector;
            int.TryParse(ddlSector.SelectedValue, out idSector);

            DateTime? fechaInicio = null;
            DateTime valorFechaInicio;
            if (!string.IsNullOrWhiteSpace(txtFechaInicio.Text) && DateTime.TryParse(txtFechaInicio.Text, out valorFechaInicio))
            {
                fechaInicio = valorFechaInicio;
            }

            DateTime? fechaFin = null;
            DateTime valorFechaFin;
            if (!string.IsNullOrWhiteSpace(txtFechaFin.Text) && DateTime.TryParse(txtFechaFin.Text, out valorFechaFin))
            {
                fechaFin = valorFechaFin;
            }

            BodegaL oBodegaL = new BodegaL();
            return oBodegaL.MtListarReporteEntregas(idRepartidor, idSector, fechaInicio, fechaFin);
        }

        private void MtCargarReporte()
        {
            List<ReporteEntrega> reporte = MtObtenerReporteFiltrado();

            int totalRealizados = 0;
            int totalPendientes = 0;

            List<object> datos = new List<object>();
            foreach (ReporteEntrega r in reporte)
            {
                if (r.Estado == "Realizado") totalRealizados++;
                else totalPendientes++;

                datos.Add(new
                {
                    NumeroPedido = string.IsNullOrEmpty(r.NumeroPedido) ? r.IdPedido.ToString() : r.NumeroPedido,
                    Cliente = r.Cliente.NombreEmpresa,
                    Repartidor = r.Repartidor.Nombre,
                    Sector = r.Sector != null ? r.Sector.Nombre : "Sin sector",
                    Estado = r.Estado,
                    FechaAsignacion = r.FechaAsignacion.ToString("dd/MM/yyyy HH:mm"),
                    FechaEntrega = r.FechaEntrega.HasValue ? r.FechaEntrega.Value.ToString("dd/MM/yyyy HH:mm") : "-",
                    Observaciones = string.IsNullOrEmpty(r.Observaciones) ? "-" : r.Observaciones
                });
            }

            lblTotalRealizados.Text = totalRealizados.ToString();
            lblTotalPendientes.Text = totalPendientes.ToString();

            bool sinRegistros = datos.Count == 0;
            gvReporte.Visible = !sinRegistros;
            pnlSinRegistros.Visible = sinRegistros;

            if (!sinRegistros)
            {
                gvReporte.DataSource = datos;
                gvReporte.DataBind();
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            MtCargarReporte();
        }

        protected void btnExportarPdf_Click(object sender, EventArgs e)
        {
            List<ReporteEntrega> reporte = MtObtenerReporteFiltrado();

            using (MemoryStream ms = new MemoryStream())
            {
                Document documento = new Document(PageSize.A4.Rotate(), 20, 20, 20, 20);
                PdfWriter.GetInstance(documento, ms);
                documento.Open();

                documento.Add(new Paragraph("Reporte de Entregas", FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 16)));
                documento.Add(new Paragraph(" "));

                PdfPTable tabla = new PdfPTable(Encabezados.Length);
                tabla.WidthPercentage = 100;

                Font fuenteEncabezado = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 9);
                foreach (string encabezado in Encabezados)
                {
                    PdfPCell celda = new PdfPCell(new Phrase(encabezado, fuenteEncabezado));
                    celda.BackgroundColor = new BaseColor(230, 230, 230);
                    tabla.AddCell(celda);
                }

                Font fuenteCelda = FontFactory.GetFont(FontFactory.HELVETICA, 8);
                foreach (ReporteEntrega r in reporte)
                {
                    tabla.AddCell(new Phrase(string.IsNullOrEmpty(r.NumeroPedido) ? r.IdPedido.ToString() : r.NumeroPedido, fuenteCelda));
                    tabla.AddCell(new Phrase(r.Cliente.NombreEmpresa, fuenteCelda));
                    tabla.AddCell(new Phrase(r.Repartidor.Nombre, fuenteCelda));
                    tabla.AddCell(new Phrase(r.Sector != null ? r.Sector.Nombre : "Sin sector", fuenteCelda));
                    tabla.AddCell(new Phrase(r.Estado, fuenteCelda));
                    tabla.AddCell(new Phrase(r.FechaAsignacion.ToString("dd/MM/yyyy HH:mm"), fuenteCelda));
                    tabla.AddCell(new Phrase(r.FechaEntrega.HasValue ? r.FechaEntrega.Value.ToString("dd/MM/yyyy HH:mm") : "-", fuenteCelda));
                    tabla.AddCell(new Phrase(string.IsNullOrEmpty(r.Observaciones) ? "-" : r.Observaciones, fuenteCelda));
                }

                documento.Add(tabla);
                documento.Close();

                MtEnviarArchivo(ms.ToArray(), "application/pdf", "ReporteEntregas.pdf");
            }
        }

        protected void btnExportarExcel_Click(object sender, EventArgs e)
        {
            List<ReporteEntrega> reporte = MtObtenerReporteFiltrado();

            using (ExcelPackage paquete = new ExcelPackage())
            {
                ExcelWorksheet hoja = paquete.Workbook.Worksheets.Add("Reporte de Entregas");

                for (int i = 0; i < Encabezados.Length; i++)
                {
                    hoja.Cells[1, i + 1].Value = Encabezados[i];
                    hoja.Cells[1, i + 1].Style.Font.Bold = true;
                }

                int fila = 2;
                foreach (ReporteEntrega r in reporte)
                {
                    hoja.Cells[fila, 1].Value = string.IsNullOrEmpty(r.NumeroPedido) ? r.IdPedido.ToString() : r.NumeroPedido;
                    hoja.Cells[fila, 2].Value = r.Cliente.NombreEmpresa;
                    hoja.Cells[fila, 3].Value = r.Repartidor.Nombre;
                    hoja.Cells[fila, 4].Value = r.Sector != null ? r.Sector.Nombre : "Sin sector";
                    hoja.Cells[fila, 5].Value = r.Estado;
                    hoja.Cells[fila, 6].Value = r.FechaAsignacion.ToString("dd/MM/yyyy HH:mm");
                    hoja.Cells[fila, 7].Value = r.FechaEntrega.HasValue ? r.FechaEntrega.Value.ToString("dd/MM/yyyy HH:mm") : "-";
                    hoja.Cells[fila, 8].Value = string.IsNullOrEmpty(r.Observaciones) ? "-" : r.Observaciones;
                    fila++;
                }

                if (hoja.Dimension != null)
                {
                    hoja.Cells[hoja.Dimension.Address].AutoFitColumns();
                }

                MtEnviarArchivo(paquete.GetAsByteArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "ReporteEntregas.xlsx");
            }
        }

        private void MtEnviarArchivo(byte[] contenido, string tipoContenido, string nombreArchivo)
        {
            Response.Clear();
            Response.ContentType = tipoContenido;
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.BinaryWrite(contenido);
            Response.Flush();
            Response.SuppressContent = true;
            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }
    }
}
