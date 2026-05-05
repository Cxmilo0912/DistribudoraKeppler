<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.Registro" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <title>Registro de Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364); /* degradado elegante */
            color: #f5f5f5;
        }
        .card {
            border-radius: 1rem;
            overflow: hidden;
            background-color: #1a1c1c;
            color: #f5f5f5;
        }
        .card-header {
            background: #5ddda1;
            color: #002112;
            font-weight: 700;
            text-align: center;
            font-size: 1.5rem;
        }
        .form-label {
            font-weight: 600;
            color: #e2e2e2;
        }
        .form-control {
            background-color: #2c2f2f;
            border: none;
            color: #f5f5f5;
        }
        .form-control:focus {
            background-color: #353838;
            box-shadow: 0 0 0 0.2rem rgba(93, 221, 161, 0.25);
        }
        .btn-success {
            background-color: #08a56e;
            border: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-success:hover {
            background-color: #006c46;
            transform: scale(1.03);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="d-flex justify-content-center align-items-center vh-100">
        <div class="card shadow-lg w-100" style="max-width: 600px;">
            <div class="card-header py-3">
                Registro de Cliente
            </div>
            <div class="card-body p-4">
                <!-- Nombre Empresa -->
                <div class="mb-3">
                    <label class="form-label">Nombre de la Empresa</label>
                    <asp:TextBox ID="txtNombreEmpresa" runat="server" CssClass="form-control" />
                </div>

                <!-- NIT -->
                <div class="mb-3">
                    <label class="form-label">NIT</label>
                    <asp:TextBox ID="txtNit" runat="server" CssClass="form-control" />
                </div>

                <!-- Dirección -->
                <div class="mb-3">
                    <label class="form-label">Dirección</label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" />
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <label class="form-label">Correo Electrónico</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
                </div>

                <!-- Teléfono -->
                <div class="mb-3">
                    <label class="form-label">Teléfono</label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" TextMode="Phone" />
                </div>

                <!-- Contraseña -->
                <div class="mb-3">
                    <label class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control" TextMode="Password" />
                </div>

                <!-- Botón Registrar -->
                <div class="d-grid mt-4">
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-success btn-lg"
                        OnClick="btnRegistrar_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
