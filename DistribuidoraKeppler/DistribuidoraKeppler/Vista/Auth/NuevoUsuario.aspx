<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NuevoUsuario.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Auth.NuevoUsuario" %>

<!DOCTYPE html>

<html class="light" lang="es">
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;family=Inter:wght@400;500;600&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    "colors": {
                        "secondary-fixed-dim": "#adc6ff",
                        "surface-tint": "#565e74",
                        "secondary-fixed": "#d8e2ff",
                        "on-error-container": "#93000a",
                        "on-primary-container": "#7c839b",
                        "inverse-surface": "#2d3133",
                        "outline": "#76777d",
                        "surface-container-high": "#e6e8ea",
                        "surface-container": "#eceef0",
                        "surface": "#f7f9fb",
                        "surface-bright": "#f7f9fb",
                        "tertiary": "#000000",
                        "error-container": "#ffdad6",
                        "on-surface": "#191c1e",
                        "on-primary-fixed-variant": "#3f465c",
                        "on-background": "#191c1e",
                        "on-secondary-fixed": "#001a42",
                        "tertiary-container": "#0b1c30",
                        "secondary": "#0058be",
                        "on-secondary": "#ffffff",
                        "primary-fixed": "#dae2fd",
                        "background": "#f7f9fb",
                        "primary-fixed-dim": "#bec6e0",
                        "on-tertiary-container": "#75859d",
                        "on-secondary-fixed-variant": "#004395",
                        "tertiary-fixed-dim": "#b7c8e1",
                        "inverse-primary": "#bec6e0",
                        "error": "#ba1a1a",
                        "surface-variant": "#e0e3e5",
                        "surface-dim": "#d8dadc",
                        "on-secondary-container": "#fefcff",
                        "on-surface-variant": "#45464d",
                        "on-primary-fixed": "#131b2e",
                        "tertiary-fixed": "#d3e4fe",
                        "on-tertiary-fixed-variant": "#38485d",
                        "surface-container-low": "#f2f4f6",
                        "on-primary": "#ffffff",
                        "inverse-on-surface": "#eff1f3",
                        "on-tertiary-fixed": "#0b1c30",
                        "outline-variant": "#c6c6cd",
                        "surface-container-highest": "#e0e3e5",
                        "secondary-container": "#2170e4",
                        "primary-container": "#131b2e",
                        "on-error": "#ffffff",
                        "on-tertiary": "#ffffff",
                        "primary": "#000000",
                        "surface-container-lowest": "#ffffff"
                    },
                    "borderRadius": {
                        "DEFAULT": "0.125rem",
                        "lg": "0.25rem",
                        "xl": "0.5rem",
                        "full": "0.75rem"
                    },
                    "spacing": {
                        "sm": "8px",
                        "xs": "4px",
                        "xl": "48px",
                        "md": "16px",
                        "gutter": "20px",
                        "base": "4px",
                        "margin": "32px",
                        "lg": "24px"
                    },
                    "fontFamily": {
                        "body-lg": ["Inter"],
                        "body-md": ["Inter"],
                        "headline-lg": ["Manrope"],
                        "headline-md": ["Manrope"],
                        "label-sm": ["Inter"],
                        "label-md": ["Inter"],
                        "body-sm": ["Inter"],
                        "headline-sm": ["Manrope"]
                    },
                    "fontSize": {
                        "body-lg": ["16px", { "lineHeight": "24px", "letterSpacing": "0", "fontWeight": "400" }],
                        "body-md": ["14px", { "lineHeight": "20px", "letterSpacing": "0", "fontWeight": "400" }],
                        "headline-lg": ["30px", { "lineHeight": "38px", "letterSpacing": "-0.02em", "fontWeight": "700" }],
                        "headline-md": ["24px", { "lineHeight": "32px", "letterSpacing": "-0.01em", "fontWeight": "600" }],
                        "label-sm": ["11px", { "lineHeight": "14px", "letterSpacing": "0.05em", "fontWeight": "500" }],
                        "label-md": ["12px", { "lineHeight": "16px", "letterSpacing": "0.05em", "fontWeight": "600" }],
                        "body-sm": ["13px", { "lineHeight": "18px", "letterSpacing": "0", "fontWeight": "400" }],
                        "headline-sm": ["20px", { "lineHeight": "28px", "letterSpacing": "0", "fontWeight": "600" }]
                    }
                },
            },
        }
    </script>
    <style>
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            display: inline-block;
            line-height: 1;
            text-transform: none;
            letter-spacing: normal;
            word-wrap: normal;
            white-space: nowrap;
            direction: ltr;
        }

        body {
            background-color: #f7f9fb;
        }

        .input-group-text {
            background: #0d1b2a;
            color: #fff;
            border: none;
        }
    </style>
    <title></title>
</head>
<body class="font-body-md text-on-surface selection:bg-secondary selection:text-on-secondary">
    <form id="form1" runat="server">
        <!-- Top Navigation Bar (Shared Component) -->
        <header class="bg-slate-100 dark:bg-slate-900 border-b border-slate-200 dark:border-slate-800 sticky top-0 z-50">
            <div class="flex justify-between items-center h-16 px-6 w-full max-w-full">
                <div class="flex items-center gap-md">
                    <button class="text-slate-500 hover:text-slate-700 transition-colors">
                        <span class="material-symbols-outlined" data-icon="help_outline">help_outline</span>
                    </button>
                </div>
            </div>
        </header>
        <main class="min-h-[calc(100vh-128px)] flex items-center justify-center py-xl px-gutter">
            <div class="w-full max-w-4xl grid grid-cols-1 md:grid-cols-12 bg-white border border-outline-variant shadow-sm rounded-lg overflow-hidden">
                <!-- Visual Brand Side Panel -->
                <div class="hidden md:flex md:col-span-5 relative overflow-hidden bg-primary-container p-xl flex-col justify-between text-white">
                    <div class="z-10">
                        <div class="w-12 h-12 bg-secondary rounded-lg flex items-center justify-center mb-lg">
                            <span class="material-symbols-outlined text-white" data-icon="lock" style="font-variation-settings: 'FILL' 1;">lock</span>
                        </div>
                        <h2 class="font-headline-lg text-white mb-md">Seguridad de la Cuenta</h2>
                        <p class="font-body-md text-on-primary-container">Mantenga su información protegida siguiendo nuestros protocolos de seguridad empresarial.</p>
                    </div>
                    <!-- Background Decorative Pattern -->
                    <div class="absolute inset-0 opacity-10 pointer-events-none">
                        <svg height="100%" width="100%" xmlns="http://www.w3.org/2000/svg">
                            <defs>
                                <pattern height="40" id="grid" patternunits="userSpaceOnUse" width="40">
                                    <path d="M 40 0 L 0 0 0 40" fill="none" stroke="white" stroke-width="1"></path>
                                </pattern>
                            </defs>
                            <rect fill="url(#grid)" height="100%" width="100%"></rect>
                        </svg>
                    </div>
                </div>
                <!-- Form Content -->
                <div class="md:col-span-7 p-lg md:p-xl lg:p-[48px] bg-white">
                    <div class="mb-xl">
                        <h1 class="font-headline-lg text-primary mb-xs">Primer inicio de sesión</h1>
                        <p class="font-body-md text-on-surface-variant">Por favor, digite su nueva contraseña para continuar</p>
                    </div>
                    <form action="#" class="space-y-lg" method="POST">
                        <!-- New Password -->
                        <div class="space-y-xs">
                            <label class="font-label-md text-on-surface-variant" for="new-password">Nueva Contraseña</label>
                            <div class="relative mb-3 input-group">
                                <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                                <asp:TextBox ID="txtNuevaClave" CssClass="form-control" runat="server" TextMode="Password" placeholder="Digite su nueva contraseña"></asp:TextBox>
                                <button type="button" onclick="togglePassword('txtNuevaClave', this)"
                                    class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600">
                                    <span class="material-symbols-outlined text-xl">visibility</span>
                                </button>
                            </div>
                        </div>
                        <asp:RegularExpressionValidator ID="revNuevaContrasena" runat="server"
                            ControlToValidate="txtNuevaClave"
                            ErrorMessage="La contraseña debe tener almenos 8 caracteres, una mayuscula(A-Z) y un número (0-9)"
                            ValidationExpression="^(?=.*[A-Z])(?=.*\d).{8,}$"
                            CssClass="text-red-500 txt-xs mt-1 block"
                            Display="Dynamic">
                            
                        </asp:RegularExpressionValidator>
                        <!-- Confirm Password -->
                        <div class="space-y-xs">
                            <label class="font-label-md text-on-surface-variant" for="confirm-password">Confirmar Nueva Contraseña</label>
                            <div class="relative mb-3 input-group">
                                <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                                <asp:TextBox ID="txtConfirmarClave" CssClass="form-control" runat="server" TextMode="Password" placeholder="Digite nuevamente la contraseña"></asp:TextBox>
                                <button type="button" onclick="togglePassword('txtConfirmarClave', this)"
                                    class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600">
                                    <span class="material-symbols-outlined text-xl">visibility</span>
                                </button>
                            </div>
                        </div>
                        <asp:CompareValidator ID="cvContrasena" runat="server" ErrorMessage="Las coontraseñas no coinciden"
                            ControlToValidate="txtConfirmarClave"
                            ControlToCompare="txtNuevaClave"
                            CssClass="text-red-500 txt-xs mt-1 block"
                            Display="Dynamic"></asp:CompareValidator>
                        <!-- Action Button -->
                        <div class="pt-md">
                            <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" CssClass="w-full h-12 bg-primary text-on-primary font-label-md rounded hover:bg-slate-800 active:opacity-80 transition-all flex items-center justify-center gap-sm" OnClick="btnConfirmar_Click" />
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </form>
    <script>
        // Muestra/oculta la contraseña
        function togglePassword(controlId, btn) {
            var input = document.getElementById('<%= Page.ClientID %>_' + controlId)
                || document.querySelector('[id$="_' + controlId + '"]')
                || document.querySelector('[id*="' + controlId + '"]');
            var icon = btn.querySelector('span');
            if (input.type === 'password') {
                input.type = 'text';
                icon.textContent = 'visibility_off';
            } else {
                input.type = 'password';
                icon.textContent = 'visibility';
            }
        }
    </script>
</body>
</html>
