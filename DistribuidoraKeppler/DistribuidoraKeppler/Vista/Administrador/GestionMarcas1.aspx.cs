using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using System;
using System.Web.UI;

namespace DistribuidoraKeppler.Vista.Administrador
{
    public partial class GestionMarcas1 : System.Web.UI.Page
    {
        MarcaD marcaD = new MarcaD(); //crear el objeto

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // evita recargar datos en cada clic
            {
                CargarMarcas();
            }
        }

        public void CargarMarcas()
        {
            var lista = marcaD.ListarMarcas(); //Llama a la BD y trae las marcas
            rpMarcas.DataSource = lista;
            rpMarcas.DataBind();
            lblTotalMarcas.Text = lista.Count.ToString(); //Muestra el total de marcas
        }

        protected void btnGuardarMarca_Click(object sender, EventArgs e)
        {
            // El campo no este vacio
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

            // crea objeto 
            Marca m = new Marca
            {
                Nombre = txtNombreMarca.Text.Trim()
            };

            // guarda en la BD
            marcaD.InsertarMarca(m);

            
            CargarMarcas();

            
            txtNombreMarca.Text = "";

            // cierra la venta y manda el mensaje 
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