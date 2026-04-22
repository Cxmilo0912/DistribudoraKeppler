<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Auth.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login - Distribuidora Kepler</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background: #0d1b2a; /* Azul oscuro */
            font-family: 'Segoe UI', sans-serif;
        }
        .login-container {
            max-width: 420px;
            margin: 80px auto;
            padding: 35px;
            background: #ffffff; /* Fondo blanco */
            border-radius: 12px;
            box-shadow: 0px 6px 20px rgba(0,0,0,0.3);
        }
        .login-container h3 {
            color: #0d1b2a;
            font-weight: bold;
        }
        .form-label {
            color: #0d1b2a;
            font-weight: 500;
        }
        .form-control {
            border-radius: 6px;
        }
        .btn-primary {
            background-color: #0d1b2a;
            border-color: #0d1b2a;
            width: 100%;
            font-weight: bold;
            border-radius: 6px;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h3 class="text-center mb-4">Iniciar Sesión</h3>
            <div class="mb-3">
                <label for="txtUsuario" class="form-label">Usuario</label>
                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="Ingrese su usuario"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="txtClave" class="form-label">Contraseña</label>
                <asp:TextBox ID="txtClave" runat="server" CssClass="form-control" TextMode="Password" placeholder="Ingrese su contraseña"></asp:TextBox>
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Ingresar" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
            <div class="text-center mt-3">
                <a href="#">¿Olvidó su contraseña?</a>
            </div>
        </div>
    </form>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
