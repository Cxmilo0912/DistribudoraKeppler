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
    public partial class Municipios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MtListarMunicipios();
        }

        [WebMethod]
        public static object MtListarMunicipios()
        {
            MunicipioL oMunicipioL = new MunicipioL();

            List<Municipio> lista = oMunicipioL.MtListarMunicipios();


            return new { data =  lista};
        }

        [WebMethod]
        public static bool MtCrearMunicipio(Municipio oMunicipio)
        {
            Municipio nuevoMunicipio = new Municipio
            {
                Nombre = oMunicipio.Nombre,
                Estado = oMunicipio.Estado
            };

            MunicipioL oMunicipioL = new MunicipioL();

            bool resultado = oMunicipioL.MtCrearMunicipio(nuevoMunicipio);

            return resultado;
        }

        [WebMethod]
        public static bool MtEditarMunicipio(Municipio oMunicipio)
        {
            Municipio nuevoMunicipio = new Municipio
            {
                Nombre = oMunicipio.Nombre,
                Estado = oMunicipio.Estado
            };

            MunicipioL oMunicipioL = new MunicipioL();

            bool resultado = oMunicipioL.MtEditarMunicipio(oMunicipio, oMunicipio.Id);

            return resultado;
        }
}
}