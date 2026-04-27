using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Globalization; // Necesario para InvariantCulture
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Aministrador
{
    public partial class CreacionProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarComboCategorias();
            }
        }

        private void CargarComboCategorias()
        {
            try
            {
                CategoriaL logica = new CategoriaL();
                var dt = logica.MtObtenerCategorias();

                ddlCategorias.DataSource = dt;
                ddlCategorias.DataTextField = "Nombre";
                ddlCategorias.DataValueField = "Id";
                ddlCategorias.DataBind();

                ddlCategorias.Items.Insert(0, new ListItem("Seleccione categoría", "0"));
            }
            catch (Exception ex)
            {
                LanzarAlerta("Error de Carga", "No se pudieron cargar las categorías.", "error");
            }
        }
        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionProductos.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                // 1. Validaciones de Selección
                if (ddlCategorias.SelectedValue == "0" || string.IsNullOrEmpty(ddlCategorias.SelectedValue))
                {
                    LanzarAlerta("Atención", "Debe seleccionar una categoría.", "warning");
                    return;
                }

                // 2. Intentar parsear los datos numéricos de forma segura
                // Esto evita que el programa "explote" y caiga en el Catch genérico
                bool precioOk = decimal.TryParse(txtPrecio.Text, NumberStyles.Any, CultureInfo.InvariantCulture, out decimal precio);
                bool limiteVentaOk = int.TryParse(txtLimiteVenta.Text, out int limiteVenta);
                bool limiteMinimoOk = int.TryParse(txtLimiteMinimo.Text, out int limiteMinimo);
                bool stockOk = int.TryParse(txtStock.Text, out int stock);
                bool marcaOk = int.TryParse(txtMarca.Text, out int idMarca);

                if (!precioOk || !limiteVentaOk || !limiteMinimoOk || !stockOk || !marcaOk)
                {
                    LanzarAlerta("Formato Incorrecto", "Asegúrate de que los campos numéricos (Precio, Stock, Marca ID) no contengan letras o símbolos inválidos.", "warning");
                    return;
                }

                // 3. Llenar el objeto Modelo
                Producto oProducto = new Producto
                {
                    Nombre = txtNombre.Text.Trim(),
                    Precio = precio,
                    Descripcion = txtDescripcion.Text.Trim(),
                    Estado = "Activo",
                    LimiteVenta = limiteVenta,
                    LimiteMinimo = limiteMinimo,
                    Stock = stock,
                    IdMarca = idMarca,
                    IdCategoria = Convert.ToInt32(ddlCategorias.SelectedValue)
                };

                // 4. Llamar a la Capa de Lógica
                ProductoL logica = new ProductoL();
                string resultado = logica.MtRegistrarProducto(oProducto);

                if (resultado == "OK")
                {
                    LanzarAlerta("¡Éxito!", "Producto guardado correctamente", "success");
                    LimpiarFormulario();
                }
                else
                {
                    LanzarAlerta("Error", resultado, "error");
                }
            }
            catch (Exception ex)
            {
                LanzarAlerta("Error Crítico", "Ocurrió un error inesperado: " + ex.Message, "error");
            }
        }

        private void LanzarAlerta(string titulo, string mensaje, string tipo)
        {
            // Limpiamos el mensaje de comillas simples para evitar errores de JS
            string msgLimpio = mensaje.Replace("'", "");
            string script = $"mostrarAlerta('{titulo}', '{msgLimpio}', '{tipo}');";
            ScriptManager.RegisterStartupScript(this, GetType(), "swal", script, true);
        }

        private void LimpiarFormulario()
        {
            txtNombre.Text = "";
            txtPrecio.Text = "";
            txtDescripcion.Text = "";
            txtLimiteVenta.Text = "";
            txtLimiteMinimo.Text = ""; // Estaba repetido Venta en tu código original
            txtStock.Text = "";
            txtMarca.Text = "";
            ddlCategorias.SelectedIndex = 0;
        }
    }
}