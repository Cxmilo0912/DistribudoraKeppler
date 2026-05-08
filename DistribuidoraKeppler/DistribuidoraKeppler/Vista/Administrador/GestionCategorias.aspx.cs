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
    public partial class GestionCategorias : System.Web.UI.Page
    {
        protected List<Categoria> lista = new List<Categoria>();
        protected void Page_Load(object sender, EventArgs e)
        {
            CategoriaL oCategoriaL = new CategoriaL();
            lista = oCategoriaL.MtObtenerCategorias();

            var count = lista.Count;
        }
        protected void btnGuardarCat_Click(object sender, EventArgs e)
        {
            try
            {
                // 1. Obtener el nombre del TextBox del modal
                string nombre = txtNombreCat.Text.Trim();

                // 2. Validación rápida
                if (string.IsNullOrEmpty(nombre))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "val", "swal('Cuidado', 'Debes ingresar un nombre para la categoría', 'warning');", true);
                    return;
                }

                // 3. Crear el objeto con los datos
                Categoria nuevaCat = new Categoria
                {
                    Nombre = nombre
                };

                // 4. Ejecutar el guardado a través de la lógica
                CategoriaL categoriaL = new CategoriaL();
                bool exito = categoriaL.RegistrarCategoria(nuevaCat);

                if (exito)
                {
                    // Limpiamos el campo para la próxima vez
                    txtNombreCat.Text = "";

                    // 5. Notificar éxito y cerrar el modal mediante JavaScript
                    // Usamos cerrarModal() que es la función que tienes en el ASPX
                    string script = "cerrarModal(); swal('¡Hecho!', 'Categoría guardada correctamente', 'success');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "success", script, true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "error", "swal('Error', 'No se pudo guardar la categoría. Revisa si ya existe.', 'error');", true);
                }
            }
            catch (Exception ex)
            {
                // En caso de un error inesperado (conexión, etc.)
                string errorMsg = $"swal('Error de Sistema', '{ex.Message}', 'error');";
                ScriptManager.RegisterStartupScript(this, GetType(), "exception", errorMsg, true);
            }
        }

        protected void lbtnEditar_Click(object sender, EventArgs e)
        {

        }
    }
}