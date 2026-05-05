<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="PerfilUsuario.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Usuario.PerfilUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600&family=DM+Serif+Display&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Outfit', sans-serif;
            background: #f4f6f9;
        }

        .perfil-wrap {
            max-width: 820px;
            margin: 2.5rem auto;
            padding: 0 1rem;
        }

        /* ── Header ── */
        .perfil-header {
            background: #1a1033;
            border-radius: 16px;
            padding: 2rem 2.25rem;
            display: flex;
            align-items: center;
            gap: 1.75rem;
            margin-bottom: 1.25rem;
        }

        .perfil-avatar-img {
            width: 88px;
            height: 88px;
            border-radius: 50%;
            object-fit: cover;
            border: 2.5px solid #7c5ce8;
            display: block;
        }

        .perfil-avatar-placeholder {
            width: 88px;
            height: 88px;
            border-radius: 50%;
            background: #2a1f4a;
            border: 2.5px solid #7c5ce8;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'DM Serif Display', serif;
            font-size: 30px;
            color: #c4b0f5;
            flex-shrink: 0;
        }

        .perfil-header-info {
            flex: 1;
        }

        .perfil-nombre {
            font-size: 21px;
            font-weight: 600;
            color: #ede8fc;
            margin: 0 0 3px;
        }

        .perfil-email-display {
            font-size: 13px;
            color: #8070aa;
            margin: 0 0 12px;
        }

        .perfil-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: #2a1f4a;
            border: 0.5px solid #4a3880;
            border-radius: 20px;
            padding: 4px 12px;
            font-size: 11px;
            color: #a08de0;
            font-weight: 500;
        }

            .perfil-badge::before {
                content: '';
                display: inline-block;
                width: 6px;
                height: 6px;
                border-radius: 50%;
                background: #7c5ce8;
            }

        .perfil-upload-zone {
            margin-left: auto;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            gap: 8px;
        }

            .perfil-upload-zone input[type=file] {
                font-size: 12px;
                color: #8070aa;
                width: 180px;
            }

        .btn-foto {
            background: transparent;
            border: 0.5px solid #4a3880;
            border-radius: 8px;
            color: #a08de0;
            font-family: 'Outfit', sans-serif;
            font-size: 13px;
            font-weight: 500;
            padding: 7px 18px;
            cursor: pointer;
            transition: background 0.2s, color 0.2s;
        }

            .btn-foto:hover {
                background: #2a1f4a;
                color: #c4b0f5;
            }

        /* ── Cards ── */
        .perfil-card {
            background: #ffffff;
            border: 0.5px solid #e2e6ed;
            border-radius: 14px;
            padding: 1.75rem 2rem;
            margin-bottom: 1.25rem;
        }

        .perfil-card-title {
            font-size: 11px;
            font-weight: 600;
            color: #8a95a3;
            text-transform: uppercase;
            letter-spacing: 0.09em;
            margin: 0 0 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 0.5px solid #eaedf1;
        }

        /* ── Campos ── */
        .perfil-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.25rem;
        }

        .field-full {
            grid-column: 1 / -1;
        }

        .perfil-field {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

            .perfil-field label {
                font-size: 11px;
                font-weight: 600;
                color: #8a95a3;
                letter-spacing: 0.05em;
                text-transform: uppercase;
            }

            .perfil-field .form-control,
            .perfil-field input {
                background: #f8f9fb;
                border: 0.5px solid #dde1e8;
                border-radius: 8px;
                padding: 10px 14px;
                font-size: 14px;
                font-family: 'Outfit', sans-serif;
                color: #1a1033;
                transition: border-color 0.2s, box-shadow 0.2s;
                width: 100%;
                box-sizing: border-box;
            }

                .perfil-field .form-control:focus,
                .perfil-field input:focus {
                    outline: none;
                    border-color: #7c5ce8;
                    box-shadow: 0 0 0 3px rgba(124, 92, 232, 0.12);
                    background: #ffffff;
                }

        /* ── Botones ── */
        .btn-guardar {
            margin-top: 1.5rem;
            background: #1a1033;
            color: #c4b0f5;
            border: none;
            border-radius: 8px;
            padding: 11px 28px;
            font-size: 14px;
            font-weight: 500;
            font-family: 'Outfit', sans-serif;
            cursor: pointer;
            transition: background 0.2s;
        }

            .btn-guardar:hover {
                background: #2a1f4a;
                color: #ede8fc;
            }

        .btn-pass {
            margin-top: 1.5rem;
            background: transparent;
            color: #6d3ae0;
            border: 0.5px solid #c4b0f5;
            border-radius: 8px;
            padding: 11px 28px;
            font-size: 14px;
            font-weight: 500;
            font-family: 'Outfit', sans-serif;
            cursor: pointer;
            transition: background 0.2s;
        }

            .btn-pass:hover {
                background: #f5f2ff;
            }

        @media (max-width: 600px) {
            .perfil-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .perfil-upload-zone {
                margin-left: 0;
                align-items: flex-start;
            }

            .perfil-grid {
                grid-template-columns: 1fr;
            }

            .field-full {
                grid-column: 1;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <%-- ── Header de perfil ── --%>
        <div class="perfil-header">
            <div class="perfil-avatar-placeholder">
                <asp:Image ID="imgPerfil" runat="server" CssClass="perfil-avatar-img"
                    Style="display: none;" />
                <asp:Literal ID="litIniciales" runat="server" Text="U" />
            </div>

            <div class="perfil-header-info">
                <p class="perfil-nombre">
                    <asp:Literal ID="litNombreHeader" runat="server" Text="Usuario" />
                </p>
                <p class="perfil-email-display">
                    <asp:Literal ID="litEmailHeader" runat="server" Text="usuario@keppler.com" />
                </p>
                <span class="perfil-badge">Usuario interno</span>
            </div>

            <div class="perfil-upload-zone">
                <asp:FileUpload ID="fuImagen" runat="server" />
                <asp:Button ID="btnSubirFoto" runat="server"
                    Text="Cambiar foto"
                    CssClass="btn-foto"
                    OnClick="btnSubirFoto_Click" />
            </div>
        </div>

        <%-- ── Datos del usuario ── --%>
        <div class="perfil-card">
            <p class="perfil-card-title">Datos personales</p>

            <div class="perfil-grid">
                <div class="perfil-field">
                    <label for="<%= txtNombre.ClientID %>">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                </div>

                <div class="perfil-field">
                    <label for="<%= txtEmail.ClientID %>">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                </div>
            </div>

            <asp:Button ID="btnGuardar" runat="server"
                Text="Guardar cambios"
                OnClick="btnGuardar_Click"
                CssClass="btn-guardar" />
        </div>

        <%-- ── Seguridad ── --%>
        <div class="perfil-card">
            <p class="perfil-card-title">Seguridad</p>

            <div class="perfil-grid">
                <div class="perfil-field field-full">
                    <label for="<%= txtActual.ClientID %>">Contraseña actual</label>
                    <asp:TextBox ID="txtActual" runat="server"
                        TextMode="Password"
                        CssClass="form-control"
                        placeholder="Ingresa tu contraseña actual" />
                </div>

                <div class="perfil-field">
                    <label for="<%= txtNueva.ClientID %>">Nueva contraseña</label>
                    <asp:TextBox ID="txtNueva" runat="server"
                        TextMode="Password"
                        CssClass="form-control"
                        placeholder="Mínimo 8 caracteres" />
                </div>

                <div class="perfil-field">
                    <label for="<%= txtConfirmar.ClientID %>">Confirmar contraseña</label>
                    <asp:TextBox ID="txtConfirmar" runat="server"
                        TextMode="Password"
                        CssClass="form-control"
                        placeholder="Repite la nueva contraseña" />
                </div>
            </div>

            <asp:Button ID="btnCambiarPass" runat="server"
                Text="Actualizar contraseña"
                CssClass="btn-pass"
                OnClick="btnCambiarPass_Click" />
        </div>
</asp:Content>
