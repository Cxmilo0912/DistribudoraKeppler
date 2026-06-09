<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="CatalogoProductos.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.CatalogoProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />

    <style>
        body {
            font-family: 'Outfit', sans-serif;
            background: #f4f6f9;
        }

        .cat-wrap {
            max-width: 1100px;
            margin: 0 auto;
            padding: 1.5rem 1rem 3rem;
        }

        /* ── Barra superior ── */
        .cat-topbar {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 1.5rem;
        }

        .cat-search-box {
            flex: 1;
            display: flex;
            align-items: center;
            gap: 10px;
            background: #ffffff;
            border: 1px solid #e2e6ed;
            border-radius: 12px;
            padding: 10px 16px;
            transition: box-shadow 0.2s, border-color 0.2s;
        }

            .cat-search-box:focus-within {
                border-color: #3b7dd8;
                box-shadow: 0 0 0 3px rgba(59,125,216,0.1);
            }

            .cat-search-box input {
                border: none;
                outline: none;
                font-family: 'Outfit', sans-serif;
                font-size: 14px;
                color: #1a2332;
                background: transparent;
                width: 100%;
            }

                .cat-search-box input::placeholder {
                    color: #b0b8c4;
                }

        .ico-search {
            color: #b0b8c4;
            font-size: 16px;
        }

        .btn-buscar {
            background: #1e3a8a;
            color: #fff;
            border: none;
            border-radius: 10px;
            padding: 10px 22px;
            font-size: 14px;
            font-weight: 500;
            font-family: 'Outfit', sans-serif;
            cursor: pointer;
            white-space: nowrap;
            transition: background 0.2s;
        }

            .btn-buscar:hover {
                background: #1e40af;
            }

        /* ── Filtros de categoría ── */
        .cat-filters {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-bottom: 1.75rem;
        }

        .cat-filter-btn {
            background: #ffffff;
            border: 1px solid #e2e6ed;
            border-radius: 24px;
            padding: 8px 20px;
            font-size: 13px;
            font-weight: 500;
            font-family: 'Outfit', sans-serif;
            color: #4a5568;
            cursor: pointer;
            transition: all 0.18s;
            white-space: nowrap;
        }

            .cat-filter-btn:hover {
                border-color: #1e3a8a;
                color: #1e3a8a;
            }

            .cat-filter-btn.activo {
                background: #1e3a8a;
                border-color: #1e3a8a;
                color: #ffffff;
            }

        /* ── Grid ── */
        .cat-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 1.25rem;
        }

        /* ── Card ── */
        .prod-card {
            background: #ffffff;
            border: 1px solid #eaedf1;
            border-radius: 16px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            transition: box-shadow 0.2s, transform 0.2s;
        }

            .prod-card:hover {
                box-shadow: 0 8px 28px rgba(30,58,138,0.1);
                transform: translateY(-3px);
            }

        /* Imagen clickeable */
        .prod-img-link {
            display: block;
            text-decoration: none;
            cursor: pointer;
        }

        .prod-img-wrap {
            width: 100%;
            height: 180px;
            background: #f8f9fb;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 16px;
            position: relative;
            overflow: hidden;
        }

            .prod-img-wrap img {
                max-width: 100%;
                max-height: 148px;
                object-fit: contain;
                transition: transform 0.25s;
            }

        .prod-img-link:hover .prod-img-wrap img {
            transform: scale(1.06);
        }

        /* Badge agotado sobre imagen */
        .badge-agotado {
            position: absolute;
            top: 10px;
            right: 10px;
            background: #fee2e2;
            color: #991b1b;
            border-radius: 20px;
            padding: 3px 10px;
            font-size: 10px;
            font-weight: 600;
        }

        /* Cuerpo */
        .prod-body {
            padding: 0.9rem 1rem 0;
            flex: 1;
        }

        .prod-marca {
            font-size: 10px;
            font-weight: 700;
            color: #1e3a8a;
            text-transform: uppercase;
            letter-spacing: 0.07em;
            margin-bottom: 4px;
        }

        .prod-nombre {
            font-size: 14px;
            font-weight: 600;
            color: #0f1f35;
            line-height: 1.35;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        /* Footer */
        .prod-footer {
            padding: 0.75rem 1rem 1rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 0.5rem;
        }

        .prod-precio {
            font-size: 18px;
            font-weight: 700;
            color: #0f1f35;
        }

        .btn-agregar {
            width: 38px;
            height: 38px;
            background: #eef2ff;
            border: none;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            color: #1e3a8a;
            font-size: 17px;
            transition: background 0.2s, transform 0.15s;
        }

            .btn-agregar:hover {
                background: #1e3a8a;
                color: #fff;
                transform: scale(1.08);
            }

        .bi-cart-fill {
            color: #1E3A8A;
            font-size: 20px;
        }

            .bi-cart-fill:hover {
                color: #eef2ff;
            }
        /* ── Ver más ── */
        .cat-ver-mas {
            text-align: center;
            margin-top: 2.5rem;
        }

        .btn-ver-mas {
            background: transparent;
            border: 1px solid #dde1e8;
            border-radius: 10px;
            padding: 11px 32px;
            font-size: 14px;
            font-family: 'Outfit', sans-serif;
            font-weight: 500;
            color: #4a5568;
            cursor: pointer;
            transition: border-color 0.2s, color 0.2s;
        }

            .btn-ver-mas:hover {
                border-color: #1e3a8a;
                color: #1e3a8a;
            }

        /* ── Empty state ── */
        .cat-empty {
            grid-column: 1/-1;
            text-align: center;
            padding: 5rem 1rem;
        }

        .cat-empty-icon {
            font-size: 52px;
        }

        .cat-empty-title {
            font-size: 17px;
            font-weight: 600;
            color: #4a5568;
            margin: 1rem 0 6px;
        }

        .cat-empty-sub {
            font-size: 13px;
            color: #8a95a3;
        }

        @media (max-width: 600px) {
            .cat-topbar {
                flex-wrap: wrap;
            }

            .cat-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 0.75rem;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cat-wrap">

        <%-- ── Buscador ── --%>
        <div class="cat-topbar">
            <div class="cat-search-box">
                <span class="ico-search">&#128269;</span>
                <asp:TextBox ID="txtBuscar" runat="server"
                    placeholder="Buscar marcas, productos o SKU..."
                    AutoComplete="off" />
            </div>
            <asp:Button ID="btnBuscar" runat="server"
                Text="Buscar"
                CssClass="btn-buscar"
                OnClick="btnBuscar_Click" />
        </div>
        <div id="cart-floating-button" onclick="window.location='Carrito/Carrito.aspx'" style="position: fixed; bottom: 30px; right: 30px; cursor: pointer; z-index: 1000;">
            <div style="background-color: #1E3A8A; width: 70px; height: 70px; border-radius: 50%; display: flex; align-items: center; justify-content: center; box-shadow: 0 4px 15px rgba(0,0,0,0.3); position: relative;">
                <i class="bi bi-cart-fill" style="color: white; font-size: 30px;"></i>

                <span id="cart-count" style="position: absolute; top: 0; right: 0; background-color: #e74c3c; color: white; border-radius: 50%; width: 26px; height: 26px; display: flex; align-items: center; justify-content: center; font-size: 13px; font-weight: bold; border: 2px solid white;"></span>
            </div>
        </div>

        <%-- ── Filtros de categoría ── --%>
        <div class="cat-filters">
            <asp:Repeater ID="rptCategorias" runat="server">
                <ItemTemplate>
                    <asp:LinkButton runat="server"
                        CssClass='<%# Convert.ToUInt32(Session["CategoriaActiva"]) == Convert.ToUInt32(Eval("Id")) ? "cat-filter-btn activo" : "cat-filter-btn" %>'
                        CommandArgument='<%# Eval("Id") %>'
                        OnCommand="FiltrarCategoria_Command"
                        Text='<%# Eval("Nombre") %>' />
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <%-- ── Grid de productos ── --%>
        <div class="cat-grid">
            <asp:Repeater ID="rptProductos" runat="server">
                <ItemTemplate>
                    <div class="prod-card">

                        <%-- Imagen → navega al detalle --%>
                        <a class="prod-img-link"
                            href='<%# "DetalleProducto.aspx?id=" + Eval("Id") %>'>
                            <div class="prod-img-wrap">
                                <asp:Image ID="imgProducto" runat="server"
                                    ImageUrl='<%# Eval("Imagen") %>'
                                    AlternateText='<%# Eval("Nombre") %>' />
                                <%# Convert.ToInt32(Eval("Stock")) == 0
                                    ? "<span class=\"badge-agotado\">Agotado</span>"
                                    : "" %>
                            </div>
                        </a>

                        <div class="prod-body">
                            <p class="prod-marca"><%# Eval("MarcaNombre") %></p>
                            <p class="prod-nombre"><%# Eval("Nombre") %></p>
                        </div>

                        <div class="prod-footer">
                            <span class="prod-precio">$<%# string.Format("{0:N0}", Eval("Precio")) %>
                            </span>
                            <button type="button" class="btn-agregar"
                                data-id='<%# Eval("Id") %>'
                                data-imagen='<%# Eval("Imagen") %>'
                                data-nombre='<%# Eval("Nombre") %>'
                                data-precio='<%# Eval("Precio") %>'>
                                <i class="bi bi-cart-fill"></i>
                            </button>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="cat-empty">
                <div class="cat-empty-icon">&#128270;</div>
                <p class="cat-empty-title">Sin resultados</p>
                <p class="cat-empty-sub">Intenta con otro término o categoría</p>
            </asp:Panel>
        </div>

        <%-- ── Ver más ── --%>
        <asp:Panel ID="pnlVerMas" runat="server" CssClass="cat-ver-mas">
            <asp:Button ID="btnVerMas" runat="server"
                Text="Ver más productos  ↓"
                CssClass="btn-ver-mas"
                OnClick="btnVerMas_Click" />
        </asp:Panel>
    </div>
    <script>
     document.addEventListener('DOMContentLoaded', () => {
                // Actualiza el número apenas carga la página
                MtActualizarContador();

            document.addEventListener('click', function (e) {
             const boton = e.target.closest('.btn-agregar');

            if (boton) {
                 const producto = {
                id: boton.getAttribute('data-id'),
            nombre: boton.getAttribute('data-nombre'),
            precio: parseFloat(boton.getAttribute('data-precio')),
            cantidad: 1
                 };
            MtAgregarAlCarrito(producto);
             }
         });
     });

            function MtAgregarAlCarrito(nuevoProducto) {
                let carrito = JSON.parse(localStorage.getItem('carritoCompras')) || [];
         const existe = carrito.find(p => p.id == nuevoProducto.id);

            if (existe) {
                existe.cantidad++;
         } else {
                carrito.push(nuevoProducto);
         }

            localStorage.setItem('carritoCompras', JSON.stringify(carrito));


            MtActualizarContador();


     }

            function MtActualizarContador() {
                let carrito = JSON.parse(localStorage.getItem('carritoCompras')) || [];
         // Sumamos las cantidades de todos los productos
         const total = carrito.reduce((acc, p) => acc + p.cantidad, 0);

            const badge = document.getElementById('cart-count');
            if (badge) {
                badge.innerText = total;
         }
     }
    </script>
</asp:Content>
