<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="PCliente.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Cliente.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <title>Kepler Distribution - Mi Perfil</title>
        <!-- Tailwind CSS CDN -->
        <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
        <!-- Google Fonts: Inter -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet" />
        <style data-purpose="global-styles">
            body {
                font-family: 'Inter', sans-serif;
                background-color: #F8F9FB;
                color: #111827;
            }

            .active-nav {
                background-color: #0A0A6E;
                color: white !important;
            }
        </style>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet" />
    </head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
        <!-- BEGIN: Main Content -->
        <main class="flex-1 p-10 overflow-y-auto">
            <!-- Page Header -->
            <header class="mb-8">
                <h2 class="text-3xl font-bold text-gray-900">Mi Perfil</h2>
                <p class="text-gray-500 mt-1">Gestione su información personal y preferencias de cuenta.</p>
            </header>
            <!-- Profile Summary Card -->
            <section class="bg-white rounded-3xl p-8 border border-gray-100 shadow-sm mb-10 flex items-center justify-between" data-purpose="profile-card">
                <div class="flex items-center gap-8">
                    <!-- Avatar with Upload Icon -->
                    <div class="relative">
                        <div class="w-32 h-32 rounded-full border-2 border-gray-100 p-1">
                            <div class="w-full h-full rounded-full bg-[#f3f4f6] overflow-hidden flex items-center justify-center">
                                <!-- TEMP_AVATAR Placeholder -->
                                <img alt="Profile Image" class="object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuB_KyU-mZlZH0sN8h0bROXs8XIMY86sbLziDEBq4lO1eNOWjzRG_Dg7tnY_khjtySxNNWPTBOeyi6TsxvG6jj21LRPW9qXHw5Ho0YZCnfjYkQsneNlZw0GO0DEwzx6F5fnAfJtE_d_RBTUaiAOocAWMYa1fpDs8Xli0AqGtL_-xpfmvRoJdxa6Z3fJGISq8xkPSX9WG3gsgRXIBs8IPDacs3oirH0kPi7OEhgNS7PwQtWxZEyUkkPR-PXIDsDxQZHUUBuIocefulyU" />
                            </div>
                        </div>
                        <button class="absolute bottom-1 right-1 bg-[#0A0A6E] p-2 rounded-full border-4 border-white text-white hover:bg-blue-900 transition-all">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewbox="0 0 24 24">
                                <path d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path><path d="M15 13a3 3 0 11-6 0 3 3 0 016 0z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path></svg>
                        </button>
                    </div>
                    <!-- User Info -->
                    <div>
                        <h3 class="text-2xl font-bold text-gray-900">Santiago Chaparro</h3>
                        <div class="flex items-center gap-2 mt-2">
                            <span class="bg-[#EBE9FE] text-[#4F46E5] text-[10px] font-bold px-2.5 py-1 rounded-md tracking-wider">CLIENTE PREMIUM</span>
                            <span class="bg-[#F3F4F6] text-gray-500 text-[10px] font-bold px-2.5 py-1 rounded-md">ID: #44291</span>
                        </div>
                    </div>
                </div>
                <!-- Action Buttons -->
                <div class="flex gap-3">
                    <button class="bg-[#0A0A6E] text-white px-5 py-2.5 rounded-xl font-medium text-sm flex items-center gap-2 hover:opacity-90 transition-opacity">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewbox="0 0 24 24">
                            <path d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path></svg>
                        Editar información
                    </button>
                    <button class="bg-[#F3F4F6] text-gray-700 px-5 py-2.5 rounded-xl font-medium text-sm flex items-center gap-2 hover:bg-gray-200 transition-colors">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewbox="0 0 24 24">
                            <path d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path></svg>
                        Cambiar contraseña
                    </button>
                </div>
            </section>
            <!-- Details Grid -->
            <div class="grid grid-cols-2 gap-8 mb-10">
                <!-- Contact Info Section -->
                <div data-purpose="contact-info-section">
                    <div class="flex items-center gap-2 mb-4">
                        <span class="text-[#0A0A6E]"><span class="material-symbols-outlined">contact_mail</span></span>
                        <h4 class="font-bold text-gray-800">Información de Contacto</h4>
                    </div>
                    <div class="bg-white rounded-2xl border border-gray-100 overflow-hidden divide-y divide-gray-50">
                        <div class="p-5">
                            <p class="text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-1">Nombre Completo</p>
                            <p class="text-gray-900 font-medium">Santiago Chaparro</p>
                        </div>
                        <div class="p-5">
                            <p class="text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-1">Correo electrónico</p>
                            <p class="text-gray-900 font-medium">Santiago2007@gmail.com</p>
                        </div>
                        <div class="p-5">
                            <p class="text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-1">Teléfono de contacto</p>
                            <p class="text-gray-900 font-medium">+57 3125489542</p>
                        </div>
                    </div>
                </div>
                <!-- Shipping Info Section -->
                <div data-purpose="shipping-info-section">
                    <div class="flex items-center gap-2 mb-4">
                        <span class="text-[#0A0A6E]"><span class="material-symbols-outlined">local_shipping</span></span>
                        <h4 class="font-bold text-gray-800">Dirección y Entrega</h4>
                    </div>
                    <div class="bg-white rounded-2xl border border-gray-100 p-6 h-[278px] flex flex-col justify-between">
                        <div>
                            <p class="text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2">Dirección de entrega principal</p>
                            <p class="text-gray-900 font-medium text-lg leading-snug">
                                Av. Central 1230, Edificio Plaza Norte, Suite 4B<br />
                                Sogamoso
                            </p>
                        </div>
                        <!-- Geolocalization Box -->
                        <div class="bg-[#F8F9FB] rounded-xl p-4 border border-gray-100 flex items-center justify-between cursor-pointer hover:bg-gray-50 transition-colors">
                            <div class="flex items-center gap-4">
                                <div class="w-12 h-12 bg-white rounded-lg flex items-center justify-center border border-gray-100 shadow-sm text-[#0A0A6E]">
                                    <span class="material-symbols-outlined">map</span>
                                </div>
                                <div>
                                    <p class="text-[11px] text-gray-500">Geolocalización activa</p>
                                    <p class="font-bold text-[#0A0A6E] text-sm">Sector Norte Centro</p>
                                </div>
                            </div>
                            <svg class="w-4 h-4 text-gray-300" fill="none" stroke="currentColor" viewbox="0 0 24 24">
                                <path d="M9 5l7 7-7 7" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path></svg>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Configuration Shortcuts -->
            <section data-purpose="account-config-grid">
                <h4 class="font-bold text-gray-800 mb-4">Configuración de Cuenta</h4>
                <div class="grid grid-cols-3 gap-6">
                    <!-- Card: Estado Cuenta -->
                    <div class="bg-white p-5 rounded-2xl border border-gray-100 flex items-center gap-4 hover:shadow-md transition-shadow cursor-pointer">
                        <div class="w-12 h-12 bg-[#F0FDF4] rounded-full flex items-center justify-center text-[#16A34A]">
                            <span class="material-symbols-outlined">verified_user</span>
                        </div>
                        <div>
                            <p class="font-bold text-gray-900 text-sm">Estado Cuenta</p>
                            <p class="text-xs text-gray-500">Verificada</p>
                        </div>
                    </div>
                    <!-- Card: Notificaciones -->
                    <div class="bg-white p-5 rounded-2xl border border-gray-100 flex items-center gap-4 hover:shadow-md transition-shadow cursor-pointer">
                        <div class="w-12 h-12 bg-[#EFF6FF] rounded-full flex items-center justify-center text-[#2563EB]">
                            <span class="material-symbols-outlined">notifications</span>
                        </div>
                        <div>
                            <p class="font-bold text-gray-900 text-sm">Notificaciones</p>
                            <p class="text-xs text-gray-500">Email y SMS</p>
                        </div>
                    </div>
                    <!-- Card: Método Pago -->
                    <div class="bg-white p-5 rounded-2xl border border-gray-100 flex items-center gap-4 hover:shadow-md transition-shadow cursor-pointer">
                        <div class="w-12 h-12 bg-[#F5F3FF] rounded-full flex items-center justify-center text-[#7C3AED]">
                            <span class="material-symbols-outlined">credit_card</span>
                        </div>
                        <div>
                            <p class="font-bold text-gray-900 text-sm">Método Pago</p>
                            <p class="text-xs text-gray-500">Transferencia</p>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- END: Main Content -->
</asp:Content>
