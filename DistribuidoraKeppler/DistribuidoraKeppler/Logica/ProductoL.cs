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
            if (string.IsNullOrEmpty(oProducto.Nombre) || string.IsNullOrEmpty(oProducto.Descripcion) || oProducto.Precio <= 0 || oProducto.Stock < 0 || string.IsNullOrEmpty(oProducto.Estado) || oProducto.LimiteVenta <= 0 || oProducto.LimiteMinimo < 0 || oProducto.IdCategoria <= 0)
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
        }
        public List<Producto> ListarProductos()
        {
            return productos.ListarProductos();
        }
        public bool EliminarProducto(int idProducto)
        {
            return productos.EliminarProducto(idProducto);
        }

        //--METODOS CREADOS POR JHON -- INICIO//
        
        //Metodo para Cargar el Catalogo de los produtos 
        public List<Producto> MtObtenerCatalogoPaginado(string busqueda, int idCategoria, int pagina, int tamPagina, out bool hayMas) 
        {
            var oTodos = productos.MtObtenerCatalogo(busqueda, idCategoria);
            var oPaginados = oTodos.Take(pagina * tamPagina).ToList();
            hayMas = oTodos.Count > pagina * tamPagina;
            return oPaginados;
        }

        //--METODOS CREADOS POR JHON -- FIN//

    }
}