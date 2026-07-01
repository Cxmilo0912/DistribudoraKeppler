using DistribuidoraKeppler.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Cliente
{
    public partial class DetalleProducto : System.Web.UI.Page
    {
        ProductoL oLogica = new ProductoL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!int.TryParse(Request.QueryString["id"], out int id))
                {
                    Response.Redirect("/Vista/Cliente/CatalogoProductos.aspx");
                    return;
                }
                MtCargarDetalle(id);
            }
        }

        private void MtCargarDetalle(int id)
        {
            try
            {
                var oProducto = oLogica.MtObtenerDetalle(id);

                // Breadcrumb 
                litCategoriaBread.Text = oProducto.CategoriaNombre;
                litNombreBread.Text = oProducto.Nombre;

                // Informacion Principal
                litCategoria.Text = oProducto.CategoriaNombre;
                litNombre.Text = oProducto.Nombre;
                litMarca.Text = oProducto.MarcaNombre;
                litSku.Text = $"PRD-{oProducto.Id:D5}";
                litPrecio.Text = string.Format("{0:N0}", oProducto.Precio);
                litDescripcion.Text = oProducto.Descripcion;

                imgProducto.ImageUrl = string.IsNullOrEmpty(oProducto.Imagen) ? "/Imagenes/Productos/default.png" : oProducto.Imagen;

                imgProducto.AlternateText = oProducto.Nombre;

                // Datos para agregar al carrito desde el cliente (JS)
                btnAgregar.Attributes["data-id"] = oProducto.Id.ToString();
                btnAgregar.Attributes["data-nombre"] = oProducto.Nombre;
                btnAgregar.Attributes["data-precio"] = oProducto.Precio.ToString(System.Globalization.CultureInfo.InvariantCulture);
                btnAgregar.Attributes["data-descripcion"] = oProducto.Descripcion;

                // Stock y límites de venta
                if (oProducto.Stock > 0)
                {
                    divStock.Attributes["class"] = "det-stock stock-ok";
                    litStock.Text = $"Stock disponible: {oProducto.Stock} unidades";
                    btnAgregar.Text = "🛒  Agregar al carrito";
                    btnAgregar.Enabled = true;
                }
                else
                {
                    divStock.Attributes["class"] = "det-stock stock-ago";
                    litStock.Text = "Producto agotado";
                    btnAgregar.Text = "Sin stock";
                    btnAgregar.Enabled = false;
                }

                // Límites para el contador JS
                txtCantidad.Attributes["data-min"] = oProducto.LimiteMinimo.ToString();
                txtCantidad.Attributes["data-max"] = oProducto.Stock.ToString();
                txtCantidad.Text = oProducto.LimiteMinimo.ToString();
            }
            catch
            {
                Response.Redirect("/Vista/Cliente/CatalogoProductos.aspx");
            }
        }
    }
}