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
    public partial class AsignarSector : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                UsuarioL oUsuarioL = new UsuarioL();
                var listaTrabajador = oUsuarioL.MtListarPersonalMovilizado();
                rptTrabajadores.DataSource = listaTrabajador;
                rptTrabajadores.DataBind();

                var trabajadoresSinSector = ((IEnumerable<dynamic>)listaTrabajador)
                    .Where(t => t.SectorAsignado == "Sin sector asignado")
                    .ToList();
                ddlTrabajador.DataSource = trabajadoresSinSector;
                ddlTrabajador.DataTextField = "Trabajador";
                ddlTrabajador.DataValueField = "Id";
                ddlTrabajador.DataBind();



                MunicipioL oMunicipioL = new MunicipioL();
                List<Municipio> lista = oMunicipioL.MtListarMunicipios();
                ddlMunicipio.DataSource = lista;
                ddlMunicipio.DataTextField = "Nombre";
                ddlMunicipio.DataValueField = "Id";
                ddlMunicipio.DataBind();

                ddlMunicipio.Items.Insert(0, new ListItem("Elija un Municipio", "0"));

            }

        }

        [WebMethod]
        public static List<Sector> MtSectoresPorMunicipio(int idMunicipio)
        {
            SectorL oSectorL = new SectorL();
            return oSectorL.MtSectoresPorMunicipio(idMunicipio);
        }

        [WebMethod]
        public static bool MtAsignarSector(int idTrabajador, int idSector)
        {
            UsuarioL oUsuarioL = new UsuarioL();
            return oUsuarioL.MtAsignarSector(idTrabajador, idSector);
        }
        [WebMethod]
        public static bool MtReasignarSector(int idTrabajador, int idSector)
        {
            UsuarioL oUsuarioL = new UsuarioL();
            return oUsuarioL.MtReasignarSector(idTrabajador, idSector);
        }
    }
}