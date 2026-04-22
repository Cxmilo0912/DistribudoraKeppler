<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="PerfilAdministrador.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Aministrador.PerfilAdministrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <title>Kepler Admin - Perfil del Administrador</title>
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet" />
        <script>
            tailwind.config = {
                darkMode: "class",
                theme: {
                    extend: {
                        colors: {
                            primary: "#000080",
                            "background-light": "#F8FAFC",
                            "background-dark": "#0F172A",
                        },
                        fontFamily: {
                            display: ["Inter", "sans-serif"],
                        },
                        borderRadius: {
                            DEFAULT: "0.75rem",
                        },
                    },
                },
            };
        </script>
        <style>
            .material-symbols-outlined {
                font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            }

            body {
                font-family: 'Inter', sans-serif;
            }
        </style>
    </head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="flex-1 flex flex-col">
        <header class="h-16 bg-white dark:bg-slate-900 border-b border-slate-200 dark:border-slate-800 flex items-center justify-between px-8">
            <div class="flex items-center gap-2 text-slate-600 dark:text-slate-400">
                <span class="material-symbols-outlined text-xl">person</span>
                <h2 class="font-medium">Perfil del Administrador</h2>
            </div>
            <div class="flex items-center gap-6">
                <button class="relative text-slate-500 hover:text-primary transition-colors">
                    <span class="material-symbols-outlined">notifications</span>
                    <span class="absolute top-0 right-0 w-2 h-2 bg-red-500 rounded-full border-2 border-white dark:border-slate-900"></span>
                </button>
                <div class="flex items-center gap-3 pl-6 border-l border-slate-200 dark:border-slate-800">
                    <div class="text-right">
                        <p class="text-sm font-bold text-slate-900 dark:text-slate-100">Carlos Rodriguez</p>
                        <p class="text-[10px] text-slate-500 dark:text-slate-400 uppercase">ID: Kepler-001</p>
                    </div>
                    <div class="w-10 h-10 rounded-full bg-slate-100 dark:bg-slate-800 border-2 border-blue-500/20 p-0.5">
                        <img alt="Carlos Avatar Small" class="w-full h-full rounded-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA5CFXUCGeXjG-6FVYpA6ctlMmjcrh8VzyDYLQ12HhK0ahU-3pOP1u5XQyR3hXyA0u8KycUhqF1vQ2E_x1fHZkpegLu8hCsUB6xRMcDHlOv43hWYvBjEeA5UW5kYtNHOm7mGn3MZQEfk-3-LR7gSR_RNwSKDc5L_BBM5rtO2ixzaAOod1FHoB4VFC5kwCWVoTNyTgpEWXvaLlEYqIUiTQZjdabcKldBfs6fSRjfYcKqVFNnbup62u79uAq049wivChq6BS8KNVYVPo" />
                    </div>
                </div>
            </div>
        </header>
        <div class="p-8 grid grid-cols-12 gap-8">
            <div class="col-span-12 lg:col-span-4 flex flex-col gap-6">
                <div class="bg-white dark:bg-slate-800 rounded-2xl shadow-sm border border-slate-200 dark:border-slate-700 p-8 flex flex-col items-center">
                    <div class="relative mb-6">
                        <div class="w-32 h-32 rounded-full border-4 border-blue-100 dark:border-slate-700 p-1">
                            <img alt="Carlos Rodriguez Avatar Large" class="w-full h-full rounded-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBnvs2VvtVFsG6YtuqAu6yXNKrS92eZnv8T8TAhHURJcB0WS3D4xpWt9pd-n0jM33WOnWZVKbm9_w4-IXrJRb9ykfb9Uw5ylSQfkL63ktnka53nIn7x9a20TOJMaqRGGIdEqGyJk0y3JWJIIRtje_aAVQdSlS8-ZqT-nHJCw41121SW3Kc79TqXBLiHbcT5XJWe-vEoJAYEfBiOAl8zJLtostQklxkiEn0pIMoGcY3o34Chms09UPR98JrNU3Yb0fMUZWK8GdNQee4" />
                        </div>
                        <button class="absolute bottom-1 right-1 w-8 h-8 bg-primary text-white rounded-full flex items-center justify-center border-2 border-white dark:border-slate-800">
                            <span class="material-symbols-outlined text-base">photo_camera</span>
                        </button>
                    </div>
                    <h3 class="text-xl font-bold text-slate-900 dark:text-white mb-1">Carlos Rodriguez</h3>
                    <p class="text-slate-500 dark:text-slate-400 text-sm mb-4">Administrador General</p>
                    <span class="px-4 py-1 bg-blue-50 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400 text-[10px] font-bold uppercase tracking-widest rounded-full mb-8">Activo</span>
                    <div class="w-full space-y-3">
                        <button class="w-full py-3 bg-primary text-white font-semibold rounded-xl flex items-center justify-center gap-2 hover:bg-blue-900 transition-colors">
                            <span class="material-symbols-outlined text-lg">edit</span>
                            Editar Información
                        </button>
                        <button class="w-full py-3 bg-slate-100 dark:bg-slate-700 text-slate-700 dark:text-slate-300 font-semibold rounded-xl flex items-center justify-center gap-2 hover:bg-slate-200 dark:hover:bg-slate-600 transition-colors">
                            Descargar Reporte ID
                        </button>
                        <button class="w-full py-3 bg-slate-50 dark:bg-slate-700/50 text-slate-600 dark:text-slate-400 font-semibold rounded-xl flex items-center justify-center gap-2 hover:bg-red-50 dark:hover:bg-red-900/20 hover:text-red-600 transition-colors">
                            <span class="material-symbols-outlined text-lg">logout</span>
                            Cerrar sesión
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-span-12 lg:col-span-8 flex flex-col gap-6">
                <div class="bg-white dark:bg-slate-800 rounded-2xl shadow-sm border border-slate-200 dark:border-slate-700 overflow-hidden">
                    <div class="px-6 py-4 border-b border-slate-100 dark:border-slate-700 flex items-center gap-3">
                        <span class="material-symbols-outlined text-primary">contact_page</span>
                        <h4 class="font-bold text-slate-900 dark:text-white">Información de Contacto</h4>
                    </div>
                    <div class="p-8 grid grid-cols-1 md:grid-cols-2 gap-y-8 gap-x-12">
                        <div>
                            <p class="text-[10px] text-slate-400 dark:text-slate-500 uppercase font-bold tracking-wider mb-1">Nombre Completo</p>
                            <p class="text-sm font-medium text-slate-800 dark:text-slate-200">Carlos Andres Rodriguez Garcia</p>
                        </div>
                        <div>
                            <p class="text-[10px] text-slate-400 dark:text-slate-500 uppercase font-bold tracking-wider mb-1">Correo Electrónico</p>
                            <p class="text-sm font-medium text-slate-800 dark:text-slate-200">CarlosGarcia@gmail.com</p>
                        </div>
                        <div>
                            <p class="text-[10px] text-slate-400 dark:text-slate-500 uppercase font-bold tracking-wider mb-1">Teléfono</p>
                            <p class="text-sm font-medium text-slate-800 dark:text-slate-200">+57 3125273732</p>
                        </div>
                        <div>
                            <p class="text-[10px] text-slate-400 dark:text-slate-500 uppercase font-bold tracking-wider mb-1">Ubicación</p>
                            <p class="text-sm font-medium text-slate-800 dark:text-slate-200">Colombia, Boyaca, Duitama, Sogamoso</p>
                        </div>
                    </div>
                </div>
                <div class="bg-white dark:bg-slate-800 rounded-2xl shadow-sm border border-slate-200 dark:border-slate-700 overflow-hidden">
                    <div class="px-6 py-4 border-b border-slate-100 dark:border-slate-700 flex items-center gap-3">
                        <span class="material-symbols-outlined text-primary">lock</span>
                        <h4 class="font-bold text-slate-900 dark:text-white">Seguridad y Contraseña</h4>
                    </div>
                    <div class="p-8 space-y-6">
                        <div class="max-w-md">
                            <label class="block text-xs font-semibold text-slate-700 dark:text-slate-300 mb-2">Contraseña Actual</label>
                            <div class="relative">
                                <input class="w-full bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-700 rounded-xl px-4 py-2.5 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all outline-none" type="password" value="••••••••" />
                                <span class="material-symbols-outlined absolute right-3 top-2.5 text-slate-400 cursor-pointer">visibility</span>
                            </div>
                        </div>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label class="block text-xs font-semibold text-slate-700 dark:text-slate-300 mb-2">Nueva Contraseña</label>
                                <div class="relative">
                                    <input class="w-full bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-700 rounded-xl px-4 py-2.5 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all outline-none" placeholder="Mínimo 8 caracteres" type="password" />
                                    <span class="material-symbols-outlined absolute right-3 top-2.5 text-slate-400 cursor-pointer">visibility</span>
                                </div>
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-slate-700 dark:text-slate-300 mb-2">Confirmar Nueva Contraseña</label>
                                <div class="relative">
                                    <input class="w-full bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-700 rounded-xl px-4 py-2.5 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all outline-none" placeholder="Repite la contraseña" type="password" />
                                    <span class="material-symbols-outlined absolute right-3 top-2.5 text-slate-400 cursor-pointer">visibility</span>
                                </div>
                            </div>
                        </div>
                        <div class="flex justify-end pt-2">
                            <button class="px-6 py-2.5 bg-blue-50 dark:bg-blue-900/20 text-primary dark:text-blue-400 font-bold text-sm rounded-xl hover:bg-primary hover:text-white dark:hover:bg-primary transition-all">
                                Actualizar Contraseña
                            </button>
                        </div>
                    </div>
                </div>
                <div class="bg-white dark:bg-slate-800 rounded-2xl shadow-sm border border-slate-200 dark:border-slate-700 overflow-hidden">
                    <div class="px-6 py-4 border-b border-slate-100 dark:border-slate-700 flex items-center gap-3">
                        <span class="material-symbols-outlined text-primary">history</span>
                        <h4 class="font-bold text-slate-900 dark:text-white">Actividad de Sesión</h4>
                    </div>
                    <div class="p-4 divide-y divide-slate-100 dark:divide-slate-700">
                        <div class="flex items-center justify-between p-4 hover:bg-slate-50 dark:hover:bg-slate-700/50 rounded-xl transition-colors">
                            <div class="flex items-center gap-4">
                                <div class="w-10 h-10 bg-green-50 dark:bg-green-900/20 rounded-xl flex items-center justify-center text-green-600 dark:text-green-400">
                                    <span class="material-symbols-outlined">laptop_mac</span>
                                </div>
                                <div>
                                    <p class="text-sm font-bold text-slate-800 dark:text-slate-200">Chrome en macOS (Esta sesión)</p>
                                    <p class="text-xs text-slate-500 dark:text-slate-400">Colombia, Duitama • Hace 2 minutos</p>
                                </div>
                            </div>
                            <span class="px-3 py-1 bg-green-100 dark:bg-green-900/40 text-green-700 dark:text-green-300 text-[10px] font-bold uppercase tracking-wider rounded-lg">Online</span>
                        </div>
                        <div class="flex items-center justify-between p-4 hover:bg-slate-50 dark:hover:bg-slate-700/50 rounded-xl transition-colors">
                            <div class="flex items-center gap-4">
                                <div class="w-10 h-10 bg-slate-100 dark:bg-slate-700 rounded-xl flex items-center justify-center text-slate-600 dark:text-slate-400">
                                    <span class="material-symbols-outlined">smartphone</span>
                                </div>
                                <div>
                                    <p class="text-sm font-bold text-slate-800 dark:text-slate-200">App Kepler iOS</p>
                                    <p class="text-xs text-slate-500 dark:text-slate-400">Colombia, Duitama • Ayer, 18:45</p>
                                </div>
                            </div>
                            <button class="text-red-500 text-xs font-bold uppercase tracking-wider hover:underline">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
