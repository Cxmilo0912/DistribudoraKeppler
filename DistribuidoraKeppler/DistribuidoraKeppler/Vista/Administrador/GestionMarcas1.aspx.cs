using DistribuidoraKeppler.Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            // Aquí irá la lógica de guardar marca
            CargarMarcas();
        }
    }
}