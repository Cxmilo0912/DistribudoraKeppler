using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica
{
    public class DashboardAdministradorL
    {
        DashboardAdministradorD dashboardD = new DashboardAdministradorD();
        public int MtTotalClientes()
        {

            return dashboardD.ObtenerTotalClientes();
        }

        public int MtProductosActivos()
        {
            return dashboardD.MtProductosActivos();
        }
        public int MtProductosTotales()
        {
            return dashboardD.MtTotalProductos();
        }

        public int MtPedidosActivos()
        {
            return dashboardD.MtPedidosActivos();
        }

        public double MtVentasDiarias()
        {
            return dashboardD.MtVentasDiarias();
        }

        public List<Pedido> MtUltimosPedidos()
        {
            return dashboardD.MtUltimosPedidos();
        }

        public object MtProductoMasVendido()
        {
            dynamic productoVendido = dashboardD.MtProductoMasVendido();

            string nombre = productoVendido.Nombre;
            int cantidad = productoVendido.CantidadVendida;

            string alertaStock = "Normal";
            string categoriaRendimiento = "Bajo Rendimiento";
            string sugerenciaAccion = "Mantener monitoreo";

            if (cantidad > 0)
            {
                if (cantidad >= 50)
                {
                    categoriaRendimiento = "Producto Estrella ⭐";
                    sugerenciaAccion = "Impulsar publicidad y asegurar distribución prioritaria.";
                }
                else if (cantidad >= 20)
                {
                    categoriaRendimiento = "Rendimiento Moderado 📈";
                    sugerenciaAccion = "Mantener stock estándar en bodega.";
                }

                int stockActualEnBodega = dashboardD.MtObtenerStockPorNombre(nombre);

                if (stockActualEnBodega <= (cantidad * 0.2)) 
                {
                    alertaStock = "CRÍTICO - Riesgo de desabastecimiento";
                    sugerenciaAccion = "¡URGENTE! Generar orden de compra con el proveedor.";
                }
            }

            return new
            {
                Nombre = nombre,
                CantidadVendida = cantidad,
                Clasificacion = categoriaRendimiento,
                EstadoInventario = alertaStock,
                AccionRecomendada = sugerenciaAccion
            };
        }
    }
}