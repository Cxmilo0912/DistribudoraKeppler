using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;

namespace DistribuidoraKeppler.Logica
{
    public class BodegaL
    {
        public List<Sector> MtListarSectores()
        {
            BodegaD oBodegaD = new BodegaD();
            return oBodegaD.MtListarSectores();
        }

        public List<Pedido> MtListarPedidosPendientes(int idSector)
        {
            BodegaD oBodegaD = new BodegaD();
            return oBodegaD.MtListarPedidosPendientes(idSector);
        }

        public List<Usuario> MtListarRepartidoresPorSector(int idSector)
        {
            if (idSector <= 0) return new List<Usuario>();

            BodegaD oBodegaD = new BodegaD();
            return oBodegaD.MtListarRepartidoresPorSector(idSector);
        }

        public List<Usuario> MtListarRepartidoresActivos()
        {
            BodegaD oBodegaD = new BodegaD();
            return oBodegaD.MtListarRepartidoresActivos();
        }

        public List<Usuario> MtListarRepartidoresConSectores()
        {
            BodegaD oBodegaD = new BodegaD();
            return oBodegaD.MtListarRepartidoresConSectores();
        }

        public string MtAsignarPedido(int idPedido, int idRepartidor)
        {
            if (idPedido <= 0) return "El pedido indicado no es válido";
            if (idRepartidor <= 0) return "Debe seleccionar un repartidor";

            BodegaD oBodegaD = new BodegaD();
            bool resultado = oBodegaD.MtAsignarPedido(idPedido, idRepartidor);

            return resultado
                ? null
                : "No se pudo asignar el pedido. Puede que ya haya sido asignado por otro usuario.";
        }

        public string MtAgregarSectorRepartidor(int idUsuario, int idSector)
        {
            if (idUsuario <= 0) return "El repartidor indicado no es válido";
            if (idSector <= 0) return "Debe seleccionar un sector";

            BodegaD oBodegaD = new BodegaD();
            oBodegaD.MtAgregarSectorRepartidor(idUsuario, idSector);
            return null;
        }

        public string MtQuitarSectorRepartidor(int idUsuario, int idSector)
        {
            if (idUsuario <= 0) return "El repartidor indicado no es válido";
            if (idSector <= 0) return "El sector indicado no es válido";

            BodegaD oBodegaD = new BodegaD();
            oBodegaD.MtQuitarSectorRepartidor(idUsuario, idSector);
            return null;
        }

        public List<Pedido> MtListarHistorialEntregas()
        {
            BodegaD oBodegaD = new BodegaD();
            return oBodegaD.MtListarHistorialEntregas();
        }

        public List<ReporteEntrega> MtListarReporteEntregas(int idRepartidor, int idSector, DateTime? fechaInicio, DateTime? fechaFin)
        {
            if (fechaInicio.HasValue && fechaFin.HasValue && fechaInicio.Value > fechaFin.Value)
            {
                DateTime intercambio = fechaInicio.Value;
                fechaInicio = fechaFin;
                fechaFin = intercambio;
            }

            BodegaD oBodegaD = new BodegaD();
            return oBodegaD.MtListarReporteEntregas(idRepartidor, idSector, fechaInicio, fechaFin);
        }

        public List<HorarioLaboral> MtListarHorarioLaboral(int idUsuario)
        {
            if (idUsuario <= 0) return new List<HorarioLaboral>();

            BodegaD oBodegaD = new BodegaD();
            return oBodegaD.MtListarHorarioLaboral(idUsuario);
        }
    }
}
