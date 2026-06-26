<%@ Page Title="Seleccionar Rol" Language="C#" AutoEventWireup="true" CodeBehind="SeleccionRol.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Auth.SeleccionRol" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Seleccionar Rol - Keppler</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        *, *::before, *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f1f5f9;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            background: white;
            border-radius: 20px;
            padding: 40px;
            max-width: 580px;
            width: 100%;
            box-shadow: 0 8px 32px rgba(0,0,0,0.08);
            border: 1px solid #e2e8f0;
        }

        .header {
            text-align: center;
            margin-bottom: 32px;
        }

            .header .icon-wrap {
                width: 56px;
                height: 56px;
                background: linear-gradient(135deg, #2563eb, #4f46e5);
                border-radius: 16px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 16px;
                box-shadow: 0 4px 16px rgba(37,99,235,0.3);
            }

                .header .icon-wrap .material-symbols-outlined {
                    font-size: 28px;
                    color: white;
                }

            .header h1 {
                font-size: 22px;
                font-weight: 800;
                color: #0f172a;
            }

            .header p {
                font-size: 14px;
                color: #64748b;
                margin-top: 6px;
            }

        .roles-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 16px;
        }

        .rol-card {
            border: 2px solid #e2e8f0;
            border-radius: 14px;
            padding: 28px 20px;
            cursor: pointer;
            transition: all 0.2s;
            text-align: center;
            background: #f8fafc;
            text-decoration: none;
            display: block;
        }

            .rol-card:hover {
                border-color: #2563eb;
                background: #eff6ff;
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(37,99,235,0.12);
            }

        .card-icon {
            width: 52px;
            height: 52px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 14px;
        }

            .card-icon .material-symbols-outlined {
                font-size: 26px;
                color: white;
            }

        .card-title {
            font-size: 14px;
            font-weight: 700;
            color: #1e293b;
        }

        .card-desc {
            font-size: 12px;
            color: #94a3b8;
            margin-top: 4px;
        }

        .bg-admin {
            background: linear-gradient(135deg, #2563eb, #4f46e5);
        }

        .bg-bodega {
            background: linear-gradient(135deg, #0891b2, #0e7490);
        }

        .bg-prev {
            background: linear-gradient(135deg, #7c3aed, #6d28d9);
        }

        .bg-rep {
            background: linear-gradient(135deg, #d97706, #b45309);
        }

        .bg-cliente {
            background: linear-gradient(135deg, #059669, #047857);
        }

        .card-icon .material-symbols-outlined {
            color: black;
        }

        .material-symbols-outlined {
            font-family: 'Material Symbols Outlined' !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <div class="icon-wrap">
                    <span class="material-symbols-outlined">manage_accounts</span>
                </div>
                <h1>¿Con qué rol deseas ingresar?</h1>
                <p>Tienes múltiples roles asignados. Selecciona uno para continuar.</p>
            </div>
            <asp:Repeater ID="rptRoles" runat="server">
                <ItemTemplate>
                    <a href='SeleccionRol.aspx?rolId=<%# Eval("Id") %>' class="rol-card">
                        <div class="card-icon">
                            <span class="card-title"><%# (Eval("Nombre").ToString()) %></span>
                        </div>
                        <div class="card-title"><%# Eval("Nombre") %></div>
                        <div class="card-desc">Ingresar como <%# Eval("Nombre") %></div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
