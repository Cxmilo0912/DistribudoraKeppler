using DistribuidoraKeppler.Datos;
using DistribuidoraKeppler.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DistribuidoraKeppler.Logica
{
    public class ProductoL
    {
        ProductoD productos = new ProductoD();
        public string MtRegistrarProducto(Producto oProducto)
        {
            if (string.IsNullOrEmpty(oProducto.Nombre) || string.IsNullOrEmpty(oProducto.Descripcion) || oProducto.Precio <= 0 || oProducto.Stock < 0 || oProducto.LimiteVenta <= 0 || oProducto.LimiteMinimo < 0 || oProducto.IdCategoria <= 0)
            {
                return "Todos los campos son obligatorios y deben ser válidos.";
            }
            bool resultado = productos.MtRegistrarProducto(oProducto);
            if (resultado)
            {
                return "OK";
            }
            else
            {
                return "Hubo un error al guardar en la base de datos.";
            }
            return resultado ? "Producto registrado exitosamente." : "Error al registrar el producto.";
        }
    }
}