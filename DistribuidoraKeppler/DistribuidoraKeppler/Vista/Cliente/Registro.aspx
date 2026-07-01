<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.Registro" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registro — Distribuidora Keppler</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <style>
        *, *::before, *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: #f0f2f8;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
        }

        /* ── Wrapper ── */
        .register-shell {
            display: flex;
            width: 100%;
            max-width: 980px;
            min-height: 620px;
            border-radius: 1.25rem;
            overflow: hidden;
            box-shadow: 0 24px 64px rgba(11, 17, 132, 0.18);
        }

        /* ── Panel izquierdo ── */
        .brand-panel {
            flex: 0 0 340px;
            background: linear-gradient(160deg, #0b1184 0%, #060b5c 100%);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 2.75rem 2.25rem;
            color: #fff;
            position: relative;
            overflow: hidden;
        }

            /* Círculo decorativo de fondo */
            .brand-panel::before {
                content: '';
                position: absolute;
                width: 340px;
                height: 340px;
                border-radius: 50%;
                border: 60px solid rgba(255,255,255,0.05);
                bottom: -80px;
                right: -100px;
                pointer-events: none;
            }

        .brand-logo {
            font-size: 1.35rem;
            font-weight: 700;
            letter-spacing: -0.02em;
            color: #fff;
        }

            .brand-logo span {
                color: #7b8cff;
            }

        .brand-copy {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

            .brand-copy h1 {
                font-size: 1.9rem;
                font-weight: 700;
                line-height: 1.2;
                margin-bottom: 0.85rem;
                letter-spacing: -0.03em;
            }

            .brand-copy p {
                font-size: 0.88rem;
                color: rgba(255,255,255,0.62);
                line-height: 1.65;
            }

        .brand-steps {
            list-style: none;
            margin-top: 2rem;
            display: flex;
            flex-direction: column;
            gap: 0.75rem;
        }

            .brand-steps li {
                display: flex;
                align-items: center;
                gap: 0.65rem;
                font-size: 0.82rem;
                color: rgba(255,255,255,0.7);
            }

                .brand-steps li::before {
                    content: '';
                    width: 6px;
                    height: 6px;
                    border-radius: 50%;
                    background: #7b8cff;
                    flex-shrink: 0;
                }

        .brand-footer {
            font-size: 0.72rem;
            color: rgba(255,255,255,0.3);
        }

        /* ── Panel derecho (formulario) ── */
        .form-panel {
            flex: 1;
            background: #fff;
            padding: 2.75rem 2.5rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            overflow-y: auto;
            perspective: 1000px;
        }

            .form-panel h2 {
                font-size: 1.4rem;
                font-weight: 700;
                color: #0b1184;
                letter-spacing: -0.02em;
                margin-bottom: 0.3rem;
            }

            .form-panel .subtitle {
                font-size: 0.82rem;
                color: #8690a4;
                margin-bottom: 1.8rem;
            }

        /* Grid de dos columnas */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0 1.25rem;
        }

        .field-full {
            grid-column: 1 / -1;
        }

        .field-group {
            margin-bottom: 1.1rem;
        }

            .field-group label {
                display: block;
                font-size: 0.75rem;
                font-weight: 600;
                color: #4a5068;
                margin-bottom: 0.35rem;
                letter-spacing: 0.02em;
                text-transform: uppercase;
            }

            .field-group input,
            .field-group .form-control {
                width: 100%;
                padding: 0.6rem 0.85rem;
                font-size: 0.9rem;
                font-family: 'Inter', sans-serif;
                background: #f5f6fb;
                border: 1.5px solid #e2e5f0;
                border-radius: 0.55rem;
                color: #1a1f3a;
                outline: none;
                transition: border-color 0.2s, box-shadow 0.2s;
            }

                .field-group input:focus,
                .field-group .form-control:focus {
                    border-color: #0b1184;
                    box-shadow: 0 0 0 3px rgba(11, 17, 132, 0.1);
                    background: #fff;
                }

        /* Botón */
        .btn-register {
            width: 100%;
            padding: 0.75rem;
            background: #0b1184;
            color: #fff;
            font-size: 0.92rem;
            font-weight: 600;
            font-family: 'Inter', sans-serif;
            border: none;
            border-radius: 0.6rem;
            cursor: pointer;
            letter-spacing: 0.01em;
            transition: background 0.2s, transform 0.15s;
            margin-top: 0.5rem;
        }

            .btn-register:hover {
                background: #0a0f72;
                transform: translateY(-1px);
            }

            .btn-register:active {
                transform: translateY(0);
            }

        .login-link {
            text-align: center;
            margin-top: 1.25rem;
            font-size: 0.8rem;
            color: #8690a4;
        }

            .login-link a {
                color: #0b1184;
                font-weight: 600;
                text-decoration: none;
            }

                .login-link a:hover {
                    text-decoration: underline;
                }

        #volver {
            color: #8690a4;
            font-weight: 700;
            text-decoration: none;
            padding-bottom: 20px;
            text-align: right;
            transition: transform 0.4s ease;
            font-size: 15px;
        }

            #volver:hover {
                color: #0b1184;
                text-decoration: underline;
                transform: translateZ(10px);
            }


        /* ── Responsive ── */
        @media (max-width: 720px) {
            .brand-panel {
                display: none;
            }

            .register-shell {
                border-radius: 0.85rem;
            }

            .form-panel {
                padding: 2rem 1.5rem;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .field-full {
                grid-column: 1;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-shell">

            <!-- ── Panel izquierdo: branding ── -->
            <div class="brand-panel">
                <div class="brand-logo">Distribuidora<span> Keppler</span></div>

                <div class="brand-copy">
                    <h1>Únase a nuestra red de distribución</h1>
                    <p>Acceda a catálogos exclusivos, historial de pedidos y precios diferenciados según su perfil comercial.</p>
                    <ul class="brand-steps">
                        <li>Complete su información empresarial</li>
                        <li>Verificamos su cuenta en 24 horas</li>
                        <li>Empiece a gestionar sus pedidos</li>
                    </ul>
                </div>

                <div class="brand-footer">© 2025 Distribuidora Keppler. Todos los derechos reservados.</div>
            </div>

            <!-- ── Panel derecho: formulario ── -->
            <div class="form-panel">
                <a id="volver" href="../../Index.aspx">Volver al Catálogo<i class="bi bi-arrow-right-short"></i></a>
                <h2>Crear cuenta</h2>
                <p class="subtitle">Ingrese los datos de su empresa para comenzar</p>

                <div class="form-grid">

                    <!-- Nombre Empresa -->
                    <div class="field-group field-full">
                        <label for="txtNombreEmpresa">Nombre de la Empresa</label>
                        <asp:TextBox ID="txtNombreEmpresa" runat="server" CssClass="form-control"
                            placeholder="Ej. Comercializadora ABC S.A.S" />
                    </div>

                    <!-- NIT -->
                    <div class="field-group">
                        <label for="txtNit">NIT</label>
                        <asp:TextBox ID="txtNit" runat="server" CssClass="form-control"
                            placeholder="900.123.456-7" />
                    </div>

                    <!-- Teléfono -->
                    <div class="field-group">
                        <label for="txtTelefono">Teléfono</label>
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"
                            TextMode="Phone" placeholder="300 000 0000" MaxLength="10"
                            pattern="3[0-9]{9}" title="Celular colombiano: 10 dígitos, inicia en 3" />
                    </div>

                    <!-- Dirección -->
                    <div class="field-group field-full">
                        <label for="txtDireccion">Dirección</label>
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"
                            placeholder="Calle 123 # 45-67, Bogotá" />
                    </div>

                    <!-- Email -->
                    <div class="field-group field-full">
                        <label for="txtEmail">Correo Electrónico</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"
                            TextMode="Email" placeholder="contacto@empresa.com" />
                    </div>

                    <!-- Contraseña -->
                    <div class="field-group field-full">
                        <label for="txtContrasena">Contraseña</label>
                        <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control"
                            TextMode="Password" placeholder="Mínimo 8 caracteres" />
                    </div>

                </div>

                <!-- Botón -->
                <asp:Button ID="btnRegistrar" runat="server"
                    Text="Crear cuenta"
                    CssClass="btn-register"
                    OnClick="btnRegistrar_Click" />

                <p class="login-link">¿Ya tiene cuenta? <a href="/Vista/Cliente/Login.aspx">Inicie sesión</a></p>
            </div>

        </div>
    </form>
</body>
</html>
