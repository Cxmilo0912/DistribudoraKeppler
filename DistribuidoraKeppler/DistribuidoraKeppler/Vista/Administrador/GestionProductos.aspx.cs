using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Aministrador
{
    public partial class GestionPeoductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProductos();
            }
        }
        private void CargarProductos()
        {
            try
            {
                ProductoL logica = new ProductoL();

                var listaProductos = logica.ListarProductos();

                if (listaProductos != null && listaProductos.Count > 0)
                {
                    rpProductos.DataSource = listaProductos;
                    rpProductos.DataBind();

                    lblTotalProductos.Text = listaProductos.Count.ToString();
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void btnEliminar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                try
                {
                    int idProducto = Convert.ToInt32(e.CommandArgument);

                    ProductoL logica = new ProductoL();
                    bool eliminado = logica.EliminarProducto(idProducto);

                    if (eliminado)
                    {
                        CargarProductos();

                        ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                            "mostrarAlerta('¡Éxito!', 'Producto eliminado correctamente', 'success');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                        $"mostrarAlerta('Error', '{ex.Message}', 'error');", true);
                }
            }
        }

        protected void btnCrearProducto_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreacionProducto.aspx");
        }

        protected void btnEditar_Command(object sender, CommandEventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        protected void FiltrarCategoria_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string categoriaSeleccionada = btn.CommandArgument;

            ProductoL logica = new ProductoL();
            var listaCompleta = logica.ListarProductos();

            if (categoriaSeleccionada == "Todos")
            {
                rpProductos.DataSource = listaCompleta;
            }
            else
            {
                var listaFiltrada = listaCompleta.Where(p => p.CategoriaNombre == categoriaSeleccionada).ToList();
                rpProductos.DataSource = listaFiltrada;
            }
            rpProductos.DataBind();
            lblTotalProductos.Text = rpProductos.Items.Count.ToString();
            ActualizarEstiloBotones(categoriaSeleccionada);
        }
        private void ActualizarEstiloBotones(string categoria)
        {
            string claseActivo = "px-5 py-2 rounded-full bg-primary-container text-white text-xs font-bold uppercase tracking-wider";
            string claseInactivo = "px-5 py-2 rounded-full bg-surface-container-lowest border border-outline-variant/20 text-slate-600 text-xs font-bold uppercase tracking-wider hover:bg-surface-container-low transition-all";

            btnTodos.CssClass = btnBebidas.CssClass = btnHogar.CssClass = btnPersonal.CssClass = btnSnacks.CssClass = btnAbarrotes.CssClass = claseInactivo;

            if (categoria == "Todos") btnTodos.CssClass = claseActivo;
            else if (categoria == "Bebidas") btnBebidas.CssClass = claseActivo;
            else if (categoria == "Cuidado del hogar") btnHogar.CssClass = claseActivo;
            else if (categoria == "Cuidado personal") btnPersonal.CssClass = claseActivo;
            else if (categoria == "Snacks") btnSnacks.CssClass = claseActivo;
            else if (categoria == "Abarrotes") btnAbarrotes.CssClass = claseActivo;

        }
    }
}