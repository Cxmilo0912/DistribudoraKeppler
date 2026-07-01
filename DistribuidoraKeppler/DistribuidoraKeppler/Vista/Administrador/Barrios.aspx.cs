using DistribuidoraKeppler.Logica;
using DistribuidoraKeppler.Logica.AdminLogica;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DistribuidoraKeppler.Vista.Administrador
{
    public partial class Barrios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BarrioL oBarrioL = new BarrioL();
                List<Barrio> lista = oBarrioL.MtListarBarrios();
                rptBarrios.DataSource = lista;
                rptBarrios.DataBind();

                MunicipioL oMunicipioL = new MunicipioL();
                List<Municipio> listaMuni = oMunicipioL.MtListarMunicipios();
                ddlMunicipio.DataSource = listaMuni;
                ddlMunicipio.DataTextField = "Nombre";
                ddlMunicipio.DataValueField = "Id";
                ddlMunicipio.DataBind();

                ddlMunicipio.Items.Insert(0, new ListItem("Elija un Municipio", "0"));

            }
        }

        protected void btnGuardarBarrio_Click(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<Sector> MtSectoresPorMunicipio(int idMunicipio)
        {
            SectorL oSectorL = new SectorL();
            return oSectorL.MtSectoresPorMunicipio(idMunicipio);
        }

        [WebMethod]
        public static bool MtCrearBarrio(string nombre, int idSector)
        {
            BarrioL oBarrioL = new BarrioL();
            return oBarrioL.MtRegistrarBarrio(nombre, idSector);
        }

        [WebMethod]
        public static bool MtEditarBarrio(int idBarrio, string nombre, int idSector)
        {
            BarrioL oBarrioL = new BarrioL();

            return oBarrioL.MtActualizarBarrio(idBarrio, nombre, idSector);
        }
    }
}