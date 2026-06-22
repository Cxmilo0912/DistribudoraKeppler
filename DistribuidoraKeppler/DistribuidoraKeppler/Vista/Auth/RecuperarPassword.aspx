<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarPassword.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Auth.RecuperarPassword" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Recuperar Contraseña - Distribuidora Keppler</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght=300;400;500;600;700;800;900&display=swap" rel="stylesheet" />

    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'kp-electric': '#3b82f6',
                        'kp-light': '#94a3b8'
                    },
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    },
                    // Definimos la animación personalizada en la configuración de Tailwind
                    animation: {
                        'fade-in-up': 'fadeInUp 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards',
                    },
                    keyframes: {
                        fadeInUp: {
                            '0%': { opacity: '0', transform: 'translateY(16px)' },
                            '100%': { opacity: '1', transform: 'translateY(0)' },
                        }
                    }
                }
            }
        }
    </script>

    <style>
        .kp-bg-clear {
            background-color: #f8fafc;
            position: relative;
            overflow: hidden;
        }

            .kp-bg-clear::before {
                content: '';
                position: absolute;
                inset: 0;
                background-image: linear-gradient(to right, rgba(99, 102, 241, 0.04) 1px, transparent 1px), linear-gradient(to bottom, rgba(99, 102, 241, 0.04) 1px, transparent 1px);
                background-size: 20px 20px;
                pointer-events: none;
            }
    </style>
</head>
<body class="kp-bg-clear flex items-center justify-center min-h-screen p-4 font-sans">

    <!-- Añadí 'animate-fade-in-up' y 'opacity-0' para que empiece invisible y aparezca con estilo -->
    <form runat="server" class="w-full max-w-md relative z-10 animate-fade-in-up opacity-0">

        <!-- PANEL: Fondo carbono/oscuro premium con degradado interno sutil -->
        <div class="bg-gradient-to-b from-[#0f143c] to-[#090d26] p-8 rounded-2xl shadow-[0_30px_60px_-15px_rgba(15,20,60,0.35)] text-center border border-white/[0.08] relative overflow-hidden">

            <!-- Aura de luz azul eléctrica en el fondo de la tarjeta -->
            <div class="absolute -top-20 -left-20 w-44 h-44 bg-blue-500/10 rounded-full blur-3xl pointer-events-none"></div>

            <!-- Branding superior -->
            <div class="mb-6 relative z-10">
                <a href="../../Index.aspx" class="text-xl font-black tracking-tight text-white no-underline">Distribuidora<span class="text-kp-electric"> Keppler</span>
                </a>
            </div>

            <!-- Icono minimalista dentro de un contenedor oscuro con borde iluminado -->
            <div class="flex justify-center mb-5 relative z-10">
                <div class="p-3 bg-white/[0.03] border border-white/[0.08] rounded-xl shadow-inner">
                    <svg class="w-6 h-6 text-kp-electric" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                    </svg>
                </div>
            </div>

            <h2 class="text-2xl font-bold tracking-tight text-white mb-2 relative z-10">¿Olvidaste tu contraseña?</h2>
            <p class="text-sm text-kp-light max-w-xs mx-auto mb-6 relative z-10">Ingresa tu correo para recibir las instrucciones de recuperación.</p>

            <!-- Alerta ASP.NET sutil -->
            <asp:Label ID="lblMensaje" runat="server"
                CssClass="block mb-6 p-3 text-xs font-semibold rounded-lg text-center bg-white/[0.04] border border-white/[0.08] text-gray-300"
                Visible="false"></asp:Label>

            <!-- Formulario -->
            <div class="text-left space-y-4 relative z-10">
                <div>
                    <label class="text-[10px] font-bold text-kp-electric uppercase tracking-widest ml-1">Correo Electrónico</label>
                    <asp:TextBox ID="txtEmail" runat="server"
                        CssClass="w-full p-3 mt-1.5 bg-black/25 border border-white/[0.08] rounded-lg text-white placeholder-white/20 focus:outline-none focus:ring-2 focus:ring-kp-electric focus:border-transparent transition duration-200 text-sm"
                        placeholder="ejemplo@correo.com" TextMode="Email" />
                </div>

                <!-- Botón de acción principal con degradado azul eléctrico moderno -->
                <asp:Button ID="btnEnviar" runat="server"
                    Text="Enviar enlace de recuperación"
                    OnClick="btnEnviar_Click"
                    CssClass="w-full bg-gradient-to-r from-blue-600 to-indigo-600 hover:from-blue-500 hover:to-indigo-500 text-white font-semibold py-3.5 px-4 rounded-lg transition duration-200 cursor-pointer text-sm shadow-lg shadow-blue-950/50 hover:-translate-y-0.5 transform" />
            </div>

            <!-- Enlace de regreso con animación de hover discreta -->
            <div class="mt-8 pt-4 border-t border-white/[0.06] relative z-10">
                <a id="volver" href="Login.aspx" class="inline-flex items-center gap-2 text-xs font-medium text-kp-light hover:text-white transition-colors duration-200 group no-underline">
                    <span class="transform group-hover:-translate-x-1 transition-transform duration-200 text-kp-electric">←</span> Volver al inicio de sesión
                </a>
            </div>

            <p class="mt-8 text-[9px] font-medium text-white/20 tracking-wider uppercase relative z-10">© 2026 Distribuidora Keppler</p>
        </div>

    </form>
</body>
</html>
