using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using System;
using System.Web.UI;

namespace DistribuidoraKeppler.Vista.Administrador
{
    public partial class GestionMarcas1 : System.Web.UI.Page
    {
        MarcaD marcaD = new MarcaD();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarMarcas();
            }
        }

        public void CargarMarcas()
        {
            var lista = marcaD.ListarMarcas();
            rpMarcas.DataSource = lista;
            rpMarcas.DataBind();
            lblTotalMarcas.Text = lista.Count.ToString();
        }

        protected void btnGuardarMarca_Click(object sender, EventArgs e)
        {
            // VALIDACIÓN BÁSICA
            if (txtNombreMarca.Text.Trim() == "")
            {
                ScriptManager.RegisterStartupScript(
     this, GetType(),
     "alert",
     @"Swal.fire({
          icon: 'warning',
          title: 'Campo obligatorio',
          text: 'Ingrese el nombre de la marca',
          confirmButtonColor: '#f59e0b'
      });",
     true
                 );
                return;
            }

            // CREAR OBJETO MARCA (SIN LOGO)
            Marca m = new Marca
            {
                Nombre = txtNombreMarca.Text.Trim()
            };

            // GUARDAR EN BASE DE DATOS
            marcaD.InsertarMarca(m);

            // RECARGAR LISTA
            CargarMarcas();

            // LIMPIAR CAMPO
            txtNombreMarca.Text = "";

            // CERRAR MODAL Y MENSAJE
            ScriptManager.RegisterStartupScript(
     this, GetType(),
     "ok",
     @"cerrarModalMarca();
      Swal.fire({
          icon: 'success',
          title: 'Marca guardada',
          text: 'La marca se registró correctamente',
          confirmButtonColor: '#2563eb'
      });",
     true
             );
        }
    }
}