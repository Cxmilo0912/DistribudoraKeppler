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
    public partial class Sectores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MunicipioL oMunicipioL = new MunicipioL();

            List<Municipio> lista = oMunicipioL.MtListarMunicipios();

            ddlMunicipio.DataSource = lista;
            ddlMunicipio.DataTextField = "Nombre";
            ddlMunicipio.DataValueField = "Id";
            ddlMunicipio.DataBind();

            ddlEditMunicipio.DataSource = lista.OrderBy(m=> m.Nombre);
            ddlEditMunicipio.DataTextField = "Nombre";
            ddlEditMunicipio.DataValueField = "Id";
            ddlEditMunicipio.DataBind();

            ddlMunicipio.Items.Insert(0,new ListItem("--- Seleccione un Municipio ---", "0"));
        }


        [WebMethod]
        public static object MtListarSectores()
        {
            SectorL oSectorL = new SectorL();

            List<Sector> lista = oSectorL.MtListarSectores();

            return new { data = lista };

        }

        [WebMethod]
        public static bool MtCrearSector(Sector oSector)
        {
            Sector nuevoSector = new Sector
            {
                Nombre = oSector.Nombre,
                DiasVisita = oSector.DiasVisita,
                CapacidadMaxima = oSector.CapacidadMaxima,
                Estado = oSector.Estado,
                Municipio = new Municipio
                {
                    Id = oSector.Municipio.Id,
                }
            };
            SectorL oSectorL = new SectorL();


            return oSectorL.MtCrearSector(nuevoSector);
        }

        [WebMethod]
        public static bool MtEditarSector(Sector oSector)
        {
            Sector editSector = new Sector
            {
                Id = oSector.Id,
                Nombre = oSector.Nombre,
                DiasVisita = oSector.DiasVisita,
                CapacidadMaxima = oSector.CapacidadMaxima,
                Estado = oSector.Estado,
                Municipio = new Municipio
                {
                    Id = oSector.Municipio.Id
                }
            };

            SectorL oSectorL = new SectorL();

            return oSectorL.MtEditarSector(editSector);
        }

    }
}