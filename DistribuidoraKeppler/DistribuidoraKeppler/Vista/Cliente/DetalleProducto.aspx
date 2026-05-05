<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="DetalleProducto.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.DetalleProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Outfit', sans-serif;
            background: #f4f6f9;
        }

        .det-wrap {
            max-width: 1100px;
            margin: 0 auto;
            padding: 1.5rem 1rem 3rem;
        }

        /* ── Breadcrumb ── */
        .breadcrumb {
            display: flex;
            align-items: center;
            gap: 6px;
            font-size: 13px;
            color: #8a95a3;
            margin-bottom: 1.5rem;
        }

            .breadcrumb a {
                color: #8a95a3;
                text-decoration: none;
            }

                .breadcrumb a:hover {
                    color: #1e3a8a;
                }

            .breadcrumb span {
                color: #0f1f35;
                font-weight: 500;
            }

        .breadcrumb-sep {
            font-size: 11px;
        }

        /* ── Layout principal ── */
        .det-main {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
            background: #ffffff;
            border: 1px solid #eaedf1;
            border-radius: 18px;
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

        /* Panel imagen */
        .det-img-panel {
            background: #f8f9fb;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2.5rem;
            min-height: 400px;
            position: relative;
        }

            .det-img-panel img {
                max-width: 100%;
                max-height: 300px;
                object-fit: contain;
            }

        /* Panel info */
        .det-info-panel {
            padding: 2.25rem 2rem;
        }

        .det-cat-badge {
            display: inline-block;
            background: #eef2ff;
            color: #3730a3;
            border-radius: 20px;
            padding: 4px 14px;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.07em;
            margin-bottom: 1rem;
        }

        .det-nombre {
            font-size: 30px;
            font-weight: 700;
            color: #0f1f35;
            line-height: 1.2;
            margin: 0 0 0.75rem;
        }

        .det-meta {
            display: flex;
            align-items: center;
            gap: 16px;
            font-size: 13px;
            color: #8a95a3;
            margin-bottom: 1.5rem;
        }

            .det-meta strong {
                color: #0f1f35;
            }

        .det-meta-sep {
            color: #dde1e8;
        }

        /* Precio */
        .det-precio-box {
            background: #f8f9fb;
            border-radius: 12px;
            padding: 1.1rem 1.25rem;
            margin-bottom: 1.25rem;
            display: flex;
            align-items: baseline;
            gap: 10px;
        }

        .det-precio {
            font-size: 34px;
            font-weight: 700;
            color: #0f1f35;
        }

        .det-precio-unit {
            font-size: 13px;
            color: #8a95a3;
        }

        /* Stock */
        .det-stock {
            display: flex;
            align-items: center;
            gap: 7px;
            font-size: 13px;
            font-weight: 500;
            margin-bottom: 1.5rem;
        }

        .det-stock-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
        }

        .stock-ok .det-stock-dot {
            background: #22c55e;
        }

        .stock-ok .det-stock-txt {
            color: #15803d;
        }

        .stock-ago .det-stock-dot {
            background: #ef4444;
        }

        .stock-ago .det-stock-txt {
            color: #dc2626;
        }

        /* Descripción */
        .det-desc-title {
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: #4a5568;
            margin-bottom: 6px;
        }

        .det-desc {
            font-size: 14px;
            color: #6b7280;
            line-height: 1.6;
            margin-bottom: 1.5rem;
        }

        /* Cantidad + botón */
        .det-actions {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 1.25rem;
        }

        .qty-box {
            display: flex;
            align-items: center;
            gap: 0;
            border: 1px solid #e2e6ed;
            border-radius: 10px;
            overflow: hidden;
        }

        .qty-btn {
            width: 38px;
            height: 42px;
            background: #f8f9fb;
            border: none;
            font-size: 18px;
            cursor: pointer;
            color: #4a5568;
            transition: background 0.15s;
        }

            .qty-btn:hover {
                background: #eef2ff;
                color: #1e3a8a;
            }

        .qty-input {
            width: 48px;
            height: 42px;
            text-align: center;
            border: none;
            border-left: 1px solid #e2e6ed;
            border-right: 1px solid #e2e6ed;
            font-size: 15px;
            font-weight: 600;
            font-family: 'Outfit', sans-serif;
            color: #0f1f35;
            outline: none;
        }

        .btn-agregar {
            flex: 1;
            background: #1e3a8a;
            color: #ffffff;
            border: none;
            border-radius: 10px;
            padding: 12px 20px;
            font-size: 15px;
            font-weight: 600;
            font-family: 'Outfit', sans-serif;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: background 0.2s;
        }

            .btn-agregar:hover {
                background: #1e40af;
            }

            .btn-agregar:disabled {
                background: #c0c8d8;
                cursor: not-allowed;
            }

        /* Garantías */
        .det-garantias {
            display: flex;
            gap: 1.5rem;
            font-size: 12px;
            color: #8a95a3;
        }

        .det-garantia {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        /* ── Info cards inferiores ── */
        .det-info-cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 1rem;
        }

        .info-card {
            background: #ffffff;
            border: 1px solid #eaedf1;
            border-radius: 14px;
            padding: 1.5rem;
        }

        .info-card-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            margin-bottom: 0.75rem;
        }

        .icon-nutri {
            background: #eff6ff;
        }

        .icon-emp {
            background: #fff7ed;
        }

        .icon-vida {
            background: #f5f3ff;
        }

        .info-card-title {
            font-size: 14px;
            font-weight: 600;
            color: #0f1f35;
            margin-bottom: 6px;
        }

        .info-card-text {
            font-size: 13px;
            color: #8a95a3;
            line-height: 1.5;
        }

        @media (max-width: 700px) {
            .det-main {
                grid-template-columns: 1fr;
            }

            .det-info-cards {
                grid-template-columns: 1fr;
            }

            .det-nombre {
                font-size: 22px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="det-wrap">

        <%-- ── Breadcrumb ── --%>
        <nav class="breadcrumb">
            <a href="CatalogoProductos.aspx">Inicio</a>
            <span class="breadcrumb-sep">›</span>
            <a href="CatalogoProductos.aspx">
                <asp:Literal ID="litCategoriaBread" runat="server" />
            </a>
            <span class="breadcrumb-sep">›</span>
            <span>
                <asp:Literal ID="litNombreBread" runat="server" /></span>
        </nav>

        <%-- ── Panel principal ── --%>
        <div class="det-main">

            <%-- Imagen --%>
            <div class="det-img-panel">
                <asp:Image ID="imgProducto" runat="server" />
            </div>

            <%-- Info --%>
            <div class="det-info-panel">
                <span class="det-cat-badge">
                    <asp:Literal ID="litCategoria" runat="server" />
                </span>

                <h1 class="det-nombre">
                    <asp:Literal ID="litNombre" runat="server" />
                </h1>

                <div class="det-meta">
                    <span>Marca: <strong>
                        <asp:Literal ID="litMarca" runat="server" /></strong></span>
                    <span class="det-meta-sep">|</span>
                    <span>SKU:
                        <asp:Literal ID="litSku" runat="server" /></span>
                </div>

                <%-- Precio --%>
                <div class="det-precio-box">
                    <span class="det-precio">$<asp:Literal ID="litPrecio" runat="server" />
                    </span>
                    <span class="det-precio-unit">COP / unidad</span>
                </div>

                <%-- Stock --%>
                <div id="divStock" runat="server" class="det-stock">
                    <span class="det-stock-dot"></span>
                    <span class="det-stock-txt">
                        <asp:Literal ID="litStock" runat="server" />
                    </span>
                </div>

                <%-- Descripción --%>
                <p class="det-desc-title">Descripción del producto</p>
                <p class="det-desc">
                    <asp:Literal ID="litDescripcion" runat="server" />
                </p>

                <%-- Cantidad + agregar --%>
                <div class="det-actions">
                    <div class="qty-box">
                        <button type="button" class="qty-btn"
                            onclick="cambiarCantidad(-1)">
                            −</button>
                        <asp:TextBox ID="txtCantidad" runat="server"
                            Text="1" CssClass="qty-input" />
                        <button type="button" class="qty-btn"
                            onclick="cambiarCantidad(1)">
                            +</button>
                    </div>

                    <asp:Button ID="btnAgregar" runat="server"
                        CssClass="btn-agregar"
                        OnClick="btnAgregar_Click"></asp:Button>
                </div>

                <div class="det-garantias">
                    <div class="det-garantia">&#128666; Envío en 24-48 horas</div>
                    <div class="det-garantia">&#128737; Garantía de calidad</div>
                </div>
            </div>
        </div>

        <%-- ── Info cards ── --%>
        <div class="det-info-cards">
            <asp:Panel ID="pnlNutricional" runat="server" CssClass="info-card">
                <div class="info-card-icon icon-nutri">&#127381;</div>
                <p class="info-card-title">Info. Nutricional</p>
                <p class="info-card-text">
                    <asp:Literal ID="litNutricional" runat="server" />
                </p>
            </asp:Panel>

            <asp:Panel ID="pnlEmpaque" runat="server" CssClass="info-card">
                <div class="info-card-icon icon-emp">&#128230;</div>
                <p class="info-card-title">Empaque</p>
                <p class="info-card-text">
                    <asp:Literal ID="litEmpaque" runat="server" />
                </p>
            </asp:Panel>

            <asp:Panel ID="pnlVidaUtil" runat="server" CssClass="info-card">
                <div class="info-card-icon icon-vida">&#128197;</div>
                <p class="info-card-title">Vida Útil</p>
                <p class="info-card-text">
                    <asp:Literal ID="litVidaUtil" runat="server" />
                </p>
            </asp:Panel>
        </div>

    </div>

    <script>
        function cambiarCantidad(delta) {
            var input = document.getElementById('<%= txtCantidad.ClientID %>');
            var val = parseInt(input.value) + delta;
            if (val < 1) val = 1;
            input.value = val;
        }
    </script>
</asp:Content>
