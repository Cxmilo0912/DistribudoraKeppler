<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Auth.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - Distribuidora Kepler</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Google Fonts: Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&amp;display=swap" rel="stylesheet" />
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        :root {
            --kepler-blue: #0b1184;
            --kepler-blue-dark: #060a52;
            --kepler-blue-light: #eef0fd;
        }

        * {
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Inter', sans-serif;
            background-color: #f0f2f8;
        }

        .login-screen {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1.5rem;
        }

        .login-shell {
            width: 100%;
            max-width: 900px;
            min-height: 560px;
            background: #fff;
            border-radius: 1.5rem;
            box-shadow: 0 30px 80px rgba(0,0,0,0.35);
            display: flex;
            overflow: hidden;
            opacity: 0;
            transform: translateY(16px);
            animation: fadeInUp 0.6s ease forwards;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-brand-panel {
            flex: 1;
            background: linear-gradient(135deg, var(--kepler-blue) 0%, var(--kepler-blue-dark) 100%);
            padding: 3rem 2.5rem;
            color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
            overflow: hidden;
        }

            .login-brand-panel::after {
                content: '';
                position: absolute;
                width: 280px;
                height: 280px;
                border-radius: 50%;
                background: rgba(255,255,255,0.04);
                bottom: -100px;
                left: -80px;
            }

        .login-brand-icon {
            width: 48px;
            height: 48px;
            background: rgba(255,255,255,0.12);
            border-radius: 0.85rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.4rem;
            margin-bottom: 1.5rem;
            position: relative;
            z-index: 1;
        }

        .login-brand-panel h2 {
            font-weight: 800;
            font-size: 1.6rem;
            margin: 0 0 .5rem;
            position: relative;
            z-index: 1;
        }

        .login-brand-panel p.subtitle {
            font-size: .9rem;
            opacity: .65;
            max-width: 260px;
            margin: 0;
            position: relative;
            z-index: 1;
        }

        .login-feature-list {
            position: relative;
            z-index: 1;
            display: flex;
            flex-direction: column;
            gap: .85rem;
        }

            .login-feature-list .item {
                display: flex;
                align-items: center;
                gap: .6rem;
                font-size: .85rem;
                opacity: .85;
            }

                .login-feature-list .item i {
                    color: #8fd9b6;
                }

        .login-form-panel {
            flex: 1;
            padding: 3rem 2.75rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-form-inner {
            max-width: 320px;
            margin: 0 auto;
            width: 100%;
        }

            .login-form-inner h3 {
                font-weight: 800;
                color: #1e2433;
                margin-bottom: .25rem;
            }

            .login-form-inner p.lead-text {
                font-size: .87rem;
                color: #9aa0b4;
                margin-bottom: 1.75rem;
            }

        .form-label {
            font-size: .78rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: .04em;
            color: #6b7280;
            margin-bottom: .4rem;
        }

        .kepler-input-group {
            position: relative;
            margin-bottom: 1.1rem;
        }

            .kepler-input-group i {
                position: absolute;
                left: 14px;
                top: 50%;
                transform: translateY(-50%);
                color: #9aa0b4;
                font-size: .95rem;
                pointer-events: none;
            }

            .kepler-input-group .form-control {
                padding-left: 2.6rem;
                border-radius: .75rem;
                border: 1px solid #e3e6f0;
                background-color: #f8f9fc;
                font-size: .9rem;
                padding-top: .65rem;
                padding-bottom: .65rem;
            }

                .kepler-input-group .form-control:focus {
                    background-color: #fff;
                    border-color: var(--kepler-blue);
                    box-shadow: 0 0 0 0.2rem rgba(11,17,132,.12);
                }

        .login-options-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.4rem;
        }

            .login-options-row .form-check-label {
                font-size: .82rem;
                color: #6b7280;
            }

            .login-options-row a {
                font-size: .82rem;
                color: var(--kepler-blue);
                font-weight: 600;
                text-decoration: none;
            }

                .login-options-row a:hover {
                    text-decoration: underline;
                }

        .btn-kepler-login {
            width: 100%;
            background-color: var(--kepler-blue);
            border-color: var(--kepler-blue);
            color: #fff;
            font-weight: 700;
            border-radius: .75rem;
            padding: .7rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: .5rem;
            transition: background-color .2s ease, box-shadow .2s ease;
        }

            .btn-kepler-login:hover {
                background-color: var(--kepler-blue-dark);
                border-color: var(--kepler-blue-dark);
                color: #fff;
                box-shadow: 0 8px 20px rgba(11,17,132,.25);
            }

        .login-signup-text {
            text-align: center;
            font-size: .85rem;
            color: #6b7280;
            margin-top: 1.3rem;
        }

            .login-signup-text a {
                color: var(--kepler-blue);
                font-weight: 600;
                text-decoration: none;
            }

        .login-footer-note {
            text-align: center;
            font-size: .75rem;
            color: #b0b5c8;
            margin-top: 1.5rem;
        }

        @media (max-width: 767.98px) {
            .login-brand-panel {
                display: none;
            }

            .login-shell {
                min-height: auto;
            }

            .login-form-panel {
                padding: 2.5rem 1.75rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-screen">
            <div class="login-shell">

                <!-- ── Panel izquierdo: branding ─────────────────────── -->
                <div class="login-brand-panel">
                    <div>
                        <div class="login-brand-icon">
                            <i class="bi bi-box-seam"></i>
                        </div>
                        <h2>Distribuidora Kepler</h2>
                        <p class="subtitle">Sistema de gestión de distribución. Controla pedidos, inventario y usuarios desde un solo lugar.</p>
                    </div>
                    <div class="login-feature-list">
                        <div class="item"><i class="bi bi-check-circle-fill"></i>Gestión de pedidos en tiempo real</div>
                        <div class="item"><i class="bi bi-check-circle-fill"></i>Control de inventario centralizado</div>
                        <div class="item"><i class="bi bi-check-circle-fill"></i>Reportes y analítica de ventas</div>
                    </div>
                </div>

                <!-- ── Panel derecho: formulario ─────────────────────── -->
                <div class="login-form-panel">
                    <div class="login-form-inner">

                        <h3>Bienvenido de nuevo</h3>
                        <p class="lead-text">Ingresa tus credenciales para continuar</p>

                        <label class="form-label">Correo electrónico</label>
                        <div class="kepler-input-group">
                            <i class="bi bi-envelope-fill"></i>
                            <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="ejemplo@empresa.com" TextMode="Email"></asp:TextBox>
                        </div>

                        <label class="form-label">Contraseña</label>
                        <div class="kepler-input-group">
                            <i class="bi bi-lock-fill"></i>
                            <asp:TextBox ID="txtClave" runat="server" CssClass="form-control" TextMode="Password" placeholder="Ingresa tu contraseña"></asp:TextBox>
                        </div>

                        <div class="login-options-row">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="chkRecordar" />
                                <label class="form-check-label" for="chkRecordar">Recordar usuario</label>
                            </div>
                            <a href="RecuperarPassword.aspx">¿Olvidaste tu contraseña?</a>
                        </div>

                        <asp:Button ID="btnLogin" runat="server" Text="Iniciar sesión" CssClass="btn btn-kepler-login" OnClick="btnLogin_Click" />

                        <p class="login-signup-text">
                            ¿No tienes cuenta? <a href="#">Crear cuenta</a>
                        </p>

                        <p class="login-footer-note">Distribuidora Kepler &copy; 2026</p>

                    </div>
                </div>

            </div>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
