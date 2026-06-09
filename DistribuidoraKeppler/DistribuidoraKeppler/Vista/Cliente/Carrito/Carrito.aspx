<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.Carrito.Carrito1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    <style>
        body {
            background-color: #f4f7f6;
        }

        .carrito-card {
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0,0,0,0.08);
            background: white;
            border: none;
        }

        .producto-row {
            border-radius: 12px;
            border: 1px solid #f0f0f0;
            transition: all 0.2s;
            background: #fff;
            margin-bottom: 15px;
        }

            .producto-row:hover {
                box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            }

        .total-card {
            border-radius: 20px;
            background-color: #ffffff;
            border: none;
            box-shadow: 0 0 20px rgba(0,0,0,0.08);
        }

        .btn-confirmar {
            border-radius: 10px;
            padding: 12px;
            font-weight: bold;
        }

        #btnVacio {
            background-color: #1e3a8a;
            color: white;
        }

        #btnConfirmarPedido {
            background-color: #1e3a8a;
            color: white;
        }

        #total {
            color: #1e3a8a;
        }

        #logoCar {
            color: #1e3a8a;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:HiddenField ID="CarritoData" runat="server" />

    <div class="container mt-5 mb-5">
        <h3 class="fw-bold mb-4"><i id="logoCar" class="bi bi-cart3 me-2 text-success"></i>Mi Carrito</h3>

        <div class="row">
            <div class="col-md-8">
                <div class="card carrito-card p-4">

                    <!-- Local Storage -->
                    <div class="container mt-4">
                        <h4>Tu Carrito de Compras</h4>
                        <div id="contenedorCarrito">
                        </div>

                        <div class="text-end mt-3">
                            <h5>Total: <span id="carrito-total" class="text-success">$0.00</span></h5>
                        </div>
                    </div>

                    <div id="panelVacio" class="text-center py-5" style="display: none;">
                        <i class="bi bi-cart-x text-secondary" style="font-size: 4rem;"></i>
                        <h5 class="text-muted mt-3">Tu carrito está vacío</h5>
                        <a id="btnVacio" href="../CatalogoProductos.aspx" class="btn mt-3">Ir a Productos</a>
                    </div>

                </div>
            </div>

            <div class="col-md-4">
                <div class="card total-card p-4">
                    <h5 class="fw-bold mb-4">Resúmen del pedido</h5>
                    <div class="d-flex justify-content-between mb-2">
                        <span class="text-muted">Subtotal</span>
                        <span class="fw-bold">$<span id="subtotal">0.00</span></span>
                    </div>
                    <hr />
                    <div class="d-flex justify-content-between mb-4">
                        <span class="fw-bold fs-5">Total</span>
                        <span id="total" class="fw-bold fs-5 ">$0.00</span>
                    </div>

                    <button type="button" id="btnConfirmarPedido" class="btn w-100 btn-confirmar">
                        <i class="bi bi-credit-card-2-back mr-2"></i>Confirmar y Pagar con PayU
                    </button>

                    <a href="../CatalogoProductos.aspx" class="btn btn-outline-secondary w-100 mt-2 border-0">Seguir comprando</a>
                </div>
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../Assets/js/Carrito.js?v=2.0"></script>


</asp:Content>
