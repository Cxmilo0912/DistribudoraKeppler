<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Auth.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login - Distribuidora Kepler</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background: #0d1b2a; /* Azul oscuro institucional */
            font-family: 'Segoe UI', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .login-container {
            max-width: 420px;
            width: 100%;
            padding: 35px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0px 6px 20px rgba(0,0,0,0.3);
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.8s ease forwards;
        }
        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .login-container h3 {
            color: #0d1b2a;
            font-weight: bold;
        }
        .form-label {
            color: #0d1b2a;
            font-weight: 500;
        }
        .input-group-text {
            background: #0d1b2a;
            color: #fff;
            border: none;
        }
        .form-control {
            border-radius: 6px;
            transition: box-shadow 0.3s ease;
        }
        .form-control:focus {
            box-shadow: 0 0 8px rgba(13, 27, 42, 0.5);
            border-color: #0d1b2a;
        }
        .btn-primary {
            background-color: #0d1b2a;
            border-color: #0d1b2a;
            width: 100%;
            font-weight: bold;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        .btn-primary:hover {
            background-color: #1b263b;
            border-color: #1b263b;
        }
        a {
            color: #0d1b2a;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .footer {
            text-align: center;
            font-size: 0.85rem;
            color: #555;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container text-center">
            <i class="bi bi-box-seam" style="font-size: 3rem; color:#0d1b2a;"></i>
            <h3 class="mt-2">Distribuidora Kepler</h3>
            <p class="text-muted mb-3">Sistema de Gestión de Distribución</p>

            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="bi bi-envelope-fill"></i></span>
                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="ejemplo@empresa.com" TextMode="Email"></asp:TextBox>
            </div>

            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                <asp:TextBox ID="txtClave" runat="server" CssClass="form-control" TextMode="Password" placeholder="Ingrese su contraseña"></asp:TextBox>
            </div>

            <div class="form-check mb-3 text-start">
                <input class="form-check-input" type="checkbox" id="chkRecordar" />
                <label class="form-check-label" for="chkRecordar">Recordar usuario</label>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Iniciar sesión" CssClass="btn btn-primary" OnClick="btnLogin_Click" />

            <div class="text-center mt-3">
                <a href="#">¿Olvidaste tu contraseña?</a> - <a href="#">Crear cuenta</a>
            </div>

            <div class="footer">
                <img src="https://media.tenor.com/SWwBY1UvWmAAAAAC/zavvi-delivery.gif">..
            </div>
        </div>
    </form>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
