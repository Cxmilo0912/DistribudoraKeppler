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
            if (string.IsNullOrEmpty(oProducto.Nombre) || string.IsNullOrEmpty(oProducto.Descripcion) || oProducto.Precio <= 0 || oProducto.Stock < 0 || string.IsNullOrEmpty(oProducto.Estado) || oProducto.LimiteVenta <= 0 || oProducto.LimiteMinimo < 0 || oProducto.IdCategoria.Id <= 0)
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

        //--METODOS CREADOS POR JHON -- INICIO//

        //Metodo para Cargar el Catalogo de los produtos 
        public List<Producto> MtObtenerCatalogoPaginado(string busqueda, int idCategoria, int pagina, int tamPagina, out bool hayMas)
        {
            var oTodos = productos.MtObtenerCatalogo(busqueda, idCategoria);
            var oPaginados = oTodos.Take(pagina * tamPagina).ToList();
            hayMas = oTodos.Count > pagina * tamPagina;
            return oPaginados;
        }

        // Metodo para obtener el detalle del producto
        public Producto MtObtenerDetalle(int id)
        {
            if (id <= 0)
            {
                throw new ArgumentException("Id de producto inválido.");
            }

            var oProducto = productos.MtObtenerPorId(id);

            if (oProducto == null)
            {
                throw new Exception("Producto no encontrado.");
            }
            return oProducto;
        }

        // Obtener todas las caterorias para el filtro del catalogo
        public List<Categoria> MtObtenerCategoriasConTodos()
        {
            var oLista = productos.MtObtenerCategoria();
            return oLista;
        }

        // Metodo para validar el stock disponible de un producto antes de realizar una venta
        public (bool esValida, string mensaje) MtValidadCantidad(Producto oProducto, int cantidad)
        {
            if (cantidad <= 0)
            {
                return (false, "La cantidad debe ser mayor a cero.");
            }
            if (cantidad > oProducto.Stock)
            {
                return (false, $"No hay suficiente stock disponible. Stock actual: {oProducto.Stock}");
            }
            if (cantidad > oProducto.LimiteVenta)
            {
                return (false, $"El límite de compra es {oProducto.LimiteVenta} unidades.");
            }

            if (cantidad < oProducto.LimiteMinimo)
            {
                return (false, $"La cantidad mínima de compra es {oProducto.LimiteMinimo} unidades.");
            }

            if (oProducto.LimiteMaximo.HasValue && cantidad > oProducto.LimiteMaximo.Value)
            {
                return (false, $"La cantidad máxima es {oProducto.LimiteMaximo.Value} unidades.");
            }
            return (true, string.Empty);
        }

        //--METODOS CREADOS POR JHON -- FIN//

        //Camilo
        public bool MtEditarProducto(Producto oProducto) 
        {
            ProductoD oProductoD = new ProductoD();

            bool verificacion = oProductoD.MtEditarProducto(oProducto);

            return verificacion;
        }


        public int MtContarTotalProductos()
        {
            return productos.MtContarProductosTotales();
        }
    }
}