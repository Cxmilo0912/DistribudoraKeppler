using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Administrador
{
    public partial class CrearProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

                ProductoL oProductoL = new ProductoL();
                List<Categoria> lista = oProductoL.MtObtenerCategoriasConTodos();

                MarcaL oMarcaL = new MarcaL();
                List<Marca> listaM = oMarcaL.MtListarMarcas();
                ddlCategoria.DataSource = lista.ToList();
                ddlCategoria.DataTextField = "Nombre";
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataBind();


                ddlMarca.DataSource = listaM.ToList();
                ddlMarca.DataTextField = "Nombre";
                ddlMarca.DataValueField = "Id";
                ddlMarca.DataBind();

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Producto oProducto = new Producto();

            oProducto.Nombre = txtNombre.Text;
            oProducto.Estado = "Activo";
            oProducto.Descripcion = txtDescripcion.Text;
            oProducto.Stock = Convert.ToInt32(txtStock.Text);
            oProducto.LimiteVenta = Convert.ToInt32(txtLimiteVenta.Text);
            oProducto.LimiteMinimo = Convert.ToInt32(txtLimiteMinimo.Text);
            oProducto.LimiteMaximo = Convert.ToInt32(txtLimiteMaximo.Text);
            oProducto.Precio = Convert.ToDecimal(txtPrecio.Text);


            ProductoL oProductoL = new ProductoL();
            string resultado = oProductoL.MtRegistrarProducto(oProducto, Convert.ToInt32(ddlMarca.SelectedValue), Convert.ToInt32(ddlCategoria.SelectedValue));

            if (resultado == "Todos los campos son obligatorios y deben ser válidos.")
            {
                string script = "Swal.fire('Error', 'Todos los campos son obligatorios y deben ser válidos.', 'error');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
            else if (resultado == "OK")
            {
                string script = @"
    Swal.fire({
        title: '¡Excelente!',
        text: 'Producto Creado Correctamente',
        icon: 'success',
        confirmButtonText: 'Ir al Catálogo',
        confirmButtonColor: '#1e3a8a'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = 'GestionProductos.aspx';
        }
    });
";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
        }
    }
}