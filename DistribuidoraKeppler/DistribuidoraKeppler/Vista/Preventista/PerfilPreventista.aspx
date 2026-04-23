<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerfilPreventista.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Preventista.PerfilPreventista" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Perfil del Preventista</title>
    <!-- Tailwind CSS v3 CDN with plugins -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <!-- Tailwind Configuration for custom colors -->
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'kepler-blue': '#526cf5',
                        'kepler-gray-bg': '#f8f9fb',
                        'kepler-text-gray': '#6b7280',
                        'kepler-logout-bg': '#fff5f5',
                        'kepler-logout-text': '#ef4444'
                    }
                }
            }
        }
    </script>
    <style data-purpose="custom-layout">
        body {
            -webkit-tap-highlight-color: transparent;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }
        /* Ensures the camera icon is perfectly centered on its background */
        .camera-overlay {
            bottom: 4px;
            right: 4px;
        }
    </style>
</head>
<body class="bg-kepler-gray-bg min-h-screen text-slate-800">
    <form id="form1" runat="server">
        <header class="sticky top-0 z-50 bg-white border-b border-gray-100 px-4 py-4 flex items-center justify-between" data-purpose="app-header">
            <button aria-label="Volver" class="p-2 -ml-2 text-slate-600">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18" stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
            </button>
            <h1 class="text-xl font-bold text-slate-800">Perfil del Preventista</h1>
            <!-- Spacer for centering title -->
            <div class="w-10"></div>
        </header>
        <!-- END: NavigationHeader -->
        <main class="max-w-md mx-auto pb-10">
            <!-- BEGIN: ProfileHeaderSection -->
            <section class="flex flex-col items-center pt-8 pb-6 bg-white" data-purpose="user-identity">
                <!-- Profile Picture with Camera Icon Overlay -->
                <div class="relative mb-4">
                    <div class="w-32 h-32 rounded-full overflow-hidden border-2 border-white shadow-sm">
                        <!-- The provided image IMAGE_4 is the UI itself, so we use a placeholder or assume the person image is part of IMAGE_4 -->
                        <img alt="Juan Pérez" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida/ADBb0ujnxb93hAeIyJ28W4uug4eHgPkPVFxYKAZCDHxjWGiMQW_dBr5gDdlpQFMOFIQcONtWOHHMTYYUJatFXpcH61Ml_V7D5CrQZxqNfhxHWjbGGT153AVOQ9UntFcqu9_IMcRxslRl5y68ZuOyloKTFTNmmzxovr_O1cNxje9BuX-XAcPozf2O0Q60dgkgIhPjQG7rxtA19CSVlq1Wg6_7ekT8YE1ZZtRPbL9og-Vl_WPXSXvKCLoYQT4itb6Ot71MIgt8uPYTn53L3Q" />
                    </div>
                    <button class="camera-overlay absolute bg-kepler-blue p-2 rounded-full border-2 border-white text-white shadow-md hover:bg-blue-600 transition-colors" data-purpose="edit-photo-trigger">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M6.827 6.175A2.31 2.31 0 015.186 7.23c-.38.054-.757.112-1.134.175C2.999 7.58 2.25 8.507 2.25 9.574V18a2.25 2.25 0 002.25 2.25h15a2.25 2.25 0 002.25-2.25V9.574c0-1.067-.75-1.994-1.802-2.169a48.324 48.324 0 00-1.134-.175 2.31 2.31 0 01-1.64-1.055l-.822-1.316a2.192 2.192 0 00-1.736-1.039 48.774 48.774 0 00-5.232 0 2.192 2.192 0 00-1.736 1.039l-.821 1.316z" stroke-linecap="round" stroke-linejoin="round"></path>
                            <path d="M16.5 12.75a4.5 4.5 0 11-9 0 4.5 4.5 0 019 0zM18.75 10.5h.008v.008h-.008V10.5z" stroke-linecap="round" stroke-linejoin="round"></path>
                        </svg>
                    </button>
                </div>
                <h2 class="text-2xl font-bold text-slate-900">Juan Pérez</h2>
                <p class="text-kepler-blue font-medium mt-1">Preventista Senior - Kepler</p>
                <p class="text-kepler-text-gray text-sm mt-1">ID Empleado: #KEP-2024-882</p>
            </section>
            <!-- END: ProfileHeaderSection -->
            <!-- BEGIN: ContactInformation -->
            <section class="px-5 mt-8" data-purpose="contact-details">
                <h3 class="text-xs font-bold text-slate-500 uppercase tracking-widest mb-3 ml-1">Información de contacto</h3>
                <div class="bg-white rounded-2xl border border-gray-100 overflow-hidden shadow-sm">
                    <!-- Email Row -->
                    <button class="w-full flex items-center p-4 hover:bg-gray-50 transition-colors border-b border-gray-100 text-left" data-purpose="email-action">
                        <div class="bg-indigo-50 p-3 rounded-xl mr-4 text-kepler-blue">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" stroke-linecap="round" stroke-linejoin="round"></path>
                            </svg>
                        </div>
                        <div class="flex-grow">
                            <p class="text-xs text-kepler-text-gray">Correo electrónico</p>
                            <p class="text-slate-900 font-medium text-lg truncate">juan.perez@kepler.com</p>
                        </div>
                        <svg class="w-5 h-5 text-slate-300" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M8.25 4.5l7.5 7.5-7.5 7.5" stroke-linecap="round" stroke-linejoin="round"></path>
                        </svg>
                    </button>
                    <!-- Phone Row -->
                    <button class="w-full flex items-center p-4 hover:bg-gray-50 transition-colors text-left" data-purpose="phone-action">
                        <div class="bg-indigo-50 p-3 rounded-xl mr-4 text-kepler-blue">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 002.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 01-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 00-1.091-.852H4.5A2.25 2.25 0 002.25 4.5v2.25z" stroke-linecap="round" stroke-linejoin="round"></path>
                            </svg>
                        </div>
                        <div class="flex-grow">
                            <p class="text-xs text-kepler-text-gray">Teléfono móvil</p>
                            <p class="text-slate-900 font-medium text-lg">+34 612 345 678</p>
                        </div>
                        <svg class="w-5 h-5 text-slate-300" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M8.25 4.5l7.5 7.5-7.5 7.5" stroke-linecap="round" stroke-linejoin="round"></path>
                        </svg>
                    </button>
                </div>
            </section>
            <!-- END: ContactInformation -->
            <!-- BEGIN: QuickActions -->
            <section class="px-5 mt-6 space-y-3" data-purpose="profile-actions">
                <!-- Edit Profile -->
                <button class="w-full flex items-center justify-between p-4 bg-white rounded-2xl border border-gray-100 shadow-sm hover:bg-gray-50 transition-colors" data-purpose="edit-profile">
                    <div class="flex items-center">
                        <div class="text-slate-700 mr-4">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10" stroke-linecap="round" stroke-linejoin="round"></path>
                            </svg>
                        </div>
                        <span class="text-lg font-semibold text-slate-800">Editar perfil</span>
                    </div>
                    <svg class="w-5 h-5 text-slate-300" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M8.25 4.5l7.5 7.5-7.5 7.5" stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>
                </button>
                <!-- Change Password -->
                <button class="w-full flex items-center justify-between p-4 bg-white rounded-2xl border border-gray-100 shadow-sm hover:bg-gray-50 transition-colors" data-purpose="change-password">
                    <div class="flex items-center">
                        <div class="text-slate-700 mr-4">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path d="M16.023 9.348h4.992v-.001M2.985 19.644v-4.992m0 0h4.992m-4.993 0l3.181 3.183a8.25 8.25 0 0013.803-3.7M4.031 9.865a8.25 8.25 0 0113.803-3.7l3.181 3.182m0-4.991v4.99" stroke-linecap="round" stroke-linejoin="round"></path>
                            </svg>
                        </div>
                        <span class="text-lg font-semibold text-slate-800">Cambiar contraseña</span>
                    </div>
                    <svg class="w-5 h-5 text-slate-300" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M8.25 4.5l7.5 7.5-7.5 7.5" stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>
                </button>
            </section>
            <!-- END: QuickActions -->
            <!-- BEGIN: LogoutSection -->
            <div class="px-5 mt-10">
                <button class="w-full py-4 flex items-center justify-center space-x-3 bg-kepler-logout-bg border border-red-100 rounded-2xl text-kepler-logout-text font-bold text-lg active:bg-red-100 transition-colors" data-purpose="logout-button">
                    <svg class="w-6 h-6 rotate-180" fill="none" stroke="currentColor" stroke-width="2" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15m3 0l3-3m0 0l-3-3m3 3H9" stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>
                    <span>Cerrar sesión</span>
                </button>
            </div>
            <!-- END: LogoutSection -->
        </main>
    </form>
</body>
</html>
