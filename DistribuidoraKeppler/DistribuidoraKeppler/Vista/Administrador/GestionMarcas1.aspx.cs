using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Modelo;
using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace DistribuidoraKeppler.Vista.Administrador
{
    public partial class GestionMarcas1 : System.Web.UI.Page
    {
        MarcaD marcaD = new MarcaD(); //crear el objeto

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
        private void Mostrar(string titulo, string mensaje, string tipo)
        {
            string script = $"Swal.fire('{titulo}', '{mensaje}', '{tipo}');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }
        protected void btnActualizarMarca_Click(object sender, EventArgs e)
        {

            string extension = Path.GetExtension(fuImagen.FileName).ToLower();


            string[] extensionesPermitidas = { ".jpg", ".jpeg", ".png" };

            if (!extensionesPermitidas.Contains(extension))
            {
                Mostrar("Error", "Solo se permiten imágenes JPG o PNG", "error");
                return;
            }

            string nombreArchivo = $"marca_{txtEditNombre.Text}_{DateTime.Now.Ticks}{extension}";

            string rutaServidor = Server.MapPath("~/Imagenes/Marcas/");

            if (!Directory.Exists(rutaServidor))
            {
                Directory.CreateDirectory(rutaServidor);
            }

            string rutaCompleta = Path.Combine(rutaServidor, nombreArchivo);

            fuImagen.SaveAs(rutaCompleta);

            string rutaDb = "~/Imagenes/Marcas/" + nombreArchivo;

            Marca oMarca = new Marca
            {
                Id = Convert.ToInt32(hfIdMarca.Value),
                Nombre = txtEditNombre.Text,
                Logo = rutaDb
            };

            MarcaL oMarcaL = new MarcaL();
            bool resultado = oMarcaL.MtEditarMarca(oMarca);

            if (resultado)
            {
                ScriptManager.RegisterStartupScript(
    this, GetType(),
    "alert",
    @"Swal.fire({
          icon: 'success',
          title: 'Marca Actualizada',
          text: 'La marca se ha actualizado correctamente',
          confirmButtonColor: '#f59e0b'
      });",
    true
      );
                CargarMarcas();
            }



            
        }
    }
}