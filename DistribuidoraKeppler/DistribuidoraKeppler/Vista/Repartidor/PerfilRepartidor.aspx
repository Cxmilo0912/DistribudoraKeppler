<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerfilRepartidor.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Repartidor.PerfilRepartidor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Perfil de Usuario</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet" />
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        primary: "#0D1B3E", // Deep Navy from the image
                        "background-light": "#F4F7F9",
                        "background-dark": "#0F172A",
                        "accent-blue": "#000066",
                    },
                    fontFamily: {
                        display: ["Manrope", "sans-serif"],
                        body: ["Manrope", "sans-serif"],
                    },
                    borderRadius: {
                        DEFAULT: "12px",
                        'xl': '24px',
                    },
                },
            },
        };
    </script>
    <style>
        body {
            font-family: 'Manrope', sans-serif;
            -webkit-tap-highlight-color: transparent;
        }

        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

            .material-symbols-outlined.filled {
                font-variation-settings: 'FILL' 1;
            }

        .hide-scrollbar::-webkit-scrollbar {
            display: none;
        }

        .hide-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }
    </style>
    <style>
        body {
            min-height: max(884px, 100dvh);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="bg-primary pt-12 pb-24 px-6 relative text-white">
            <div class="flex justify-between items-center mb-6">
                <button class="p-2 -ml-2 rounded-full hover:bg-white/10 transition-colors">
                    <span class="material-symbols-outlined">arrow_back_ios_new</span>
                </button>
                <h1 class="text-xl font-bold">Mi perfil</h1>
                <button class="p-2 -mr-2 rounded-full hover:bg-white/10 transition-colors">
                    <span class="material-symbols-outlined">edit</span>
                </button>
            </div>
            <div class="flex flex-col items-center text-center">
                <div class="relative mb-4">
                    <div class="w-24 h-24 rounded-full border-4 border-white overflow-hidden bg-slate-200">
                        <img alt="Avatar de Santiago Chaparro" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCjkhYIdHDitTsZ7H1eXIL3VupsXH2yVviiiNo8-gJbC1pFU9I-gNgA8i7QTsaG1rOQe8aCtCTBxXxfGUbyxcIyP0C9KEBtjSqUZLClhknDP3Ocs-x_rXR7vatV11281DCOGexx_6fgohq83oWdiFdcvtsC4Xg9GXmqSY-kpQHnN3ZmtRj24YHrGOStMVxgT-nspkHL3O8OwN1RSt7GhaeV6OlpLoBRlN0j1Sfy1c2Sgw7o0HKcbEfqu1883xCmDuWUg2ppPtir00c" />
                    </div>
                </div>
                <h2 class="text-2xl font-extrabold mb-1">Santiago Chaparro</h2>
                <p class="text-white/80 text-sm mb-4">Repartidor: CC 1.024.883.401</p>
                <div class="bg-black/20 backdrop-blur-sm border border-white/20 rounded-full px-4 py-1.5 flex items-center gap-2">
                    <div class="w-2 h-2 bg-green-500 rounded-full"></div>
                    <span class="text-xs font-semibold tracking-wide">Activo</span>
                </div>
            </div>
        </header>
        <main class="flex-1 px-4 -mt-12 pb-32 overflow-y-auto hide-scrollbar z-10">
            <section class="bg-white dark:bg-slate-800 rounded-xl shadow-sm mb-4 p-5">
                <h3 class="text-xs font-bold text-slate-500 dark:text-slate-400 uppercase tracking-widest mb-6">Información Personal</h3>
                <div class="space-y-6">
                    <div class="border-b border-slate-100 dark:border-slate-700 pb-3">
                        <label class="block text-xs font-medium text-slate-400 dark:text-slate-500 mb-1">Nombre completo</label>
                        <div class="text-sm font-semibold text-primary dark:text-white">Jose Santiago Chaparro Torres</div>
                    </div>
                    <div class="border-b border-slate-100 dark:border-slate-700 pb-3">
                        <label class="block text-xs font-medium text-slate-400 dark:text-slate-500 mb-1">Cédula de ciudadanía</label>
                        <div class="text-sm font-semibold text-primary dark:text-white">1.024.883.401</div>
                    </div>
                    <div class="border-b border-slate-100 dark:border-slate-700 pb-3 flex justify-between items-end">
                        <div>
                            <label class="block text-xs font-medium text-slate-400 dark:text-slate-500 mb-1">Teléfono</label>
                            <div class="text-sm font-semibold text-primary dark:text-white">+57 312 456 7890</div>
                        </div>
                        <button class="text-slate-400 hover:text-primary transition-colors">
                            <span class="material-symbols-outlined text-xl">content_copy</span>
                        </button>
                    </div>
                    <div class="border-b border-slate-100 dark:border-slate-700 pb-3 flex justify-between items-end">
                        <div>
                            <label class="block text-xs font-medium text-slate-400 dark:text-slate-500 mb-1">Correo electrónico</label>
                            <div class="text-sm font-semibold text-primary dark:text-white">s.chaparro@kepler.com</div>
                        </div>
                        <button class="text-slate-400 hover:text-primary transition-colors">
                            <span class="material-symbols-outlined text-xl">content_copy</span>
                        </button>
                    </div>
                    <div>
                        <label class="block text-xs font-medium text-slate-400 dark:text-slate-500 mb-1">Fecha de ingreso</label>
                        <div class="text-sm font-semibold text-primary dark:text-white">12 Octubre, 2021</div>
                    </div>
                </div>
            </section>
            <section class="bg-white dark:bg-slate-800 rounded-xl shadow-sm mb-8 p-5">
                <h3 class="text-xs font-bold text-slate-500 dark:text-slate-400 uppercase tracking-widest mb-6">Información Laboral</h3>
                <div class="space-y-6">
                    <div class="border-b border-slate-100 dark:border-slate-700 pb-3">
                        <label class="block text-xs font-medium text-slate-400 dark:text-slate-500 mb-1">Cargo</label>
                        <div class="text-sm font-semibold text-primary dark:text-white">Repartidor</div>
                    </div>
                    <div class="border-b border-slate-100 dark:border-slate-700 pb-3">
                        <label class="block text-xs font-medium text-slate-400 dark:text-slate-500 mb-1">Zona asignada</label>
                        <div class="text-sm font-semibold text-primary dark:text-white">Sogamoso - Chapinero / Zona Rosa</div>
                    </div>
                    <div class="border-b border-slate-100 dark:border-slate-700 pb-3">
                        <label class="block text-xs font-medium text-slate-400 dark:text-slate-500 mb-1">Vehículo</label>
                        <div class="text-sm font-semibold text-primary dark:text-white">Motocicleta Yamaha - FZ6 (GHS-12D)</div>
                    </div>
                    <div class="flex justify-between items-center">
                        <div>
                            <label class="block text-xs font-medium text-slate-400 dark:text-slate-500 mb-1">Estado documentos</label>
                            <div class="text-sm font-semibold text-primary dark:text-white">Verificados</div>
                        </div>
                        <div class="bg-slate-100 dark:bg-slate-700 rounded-full px-3 py-1 text-[10px] font-bold text-slate-600 dark:text-slate-300">
                            1 PENDIENTE
                        </div>
                    </div>
                </div>
            </section>
            <button class="w-full bg-white dark:bg-slate-800 py-4 rounded-xl shadow-sm flex items-center justify-center gap-3 active:scale-95 transition-transform mb-8">
                <span class="material-symbols-outlined text-red-500">logout</span>
                <span class="font-bold text-primary dark:text-white">Cerrar sesión</span>
            </button>
            <p class="text-center text-slate-400 dark:text-slate-500 text-xs font-medium">
                Kepler Portal Preventista v2.4.0
            </p>
        </main>
        <nav class="fixed bottom-0 left-0 right-0 bg-white dark:bg-slate-900 border-t border-slate-100 dark:border-slate-800 px-6 py-3 flex justify-between items-center z-50">
            <button class="flex flex-col items-center gap-1 text-slate-400 dark:text-slate-500">
                <span class="material-symbols-outlined">home</span>
                <span class="text-[10px] font-medium">Inicio</span>
            </button>
            <button class="flex flex-col items-center gap-1 text-slate-400 dark:text-slate-500">
                <span class="material-symbols-outlined">shopping_bag</span>
                <span class="text-[10px] font-medium">Pedidos</span>
            </button>
            <button class="flex flex-col items-center gap-1 text-slate-400 dark:text-slate-500">
                <span class="material-symbols-outlined">description</span>
                <span class="text-[10px] font-medium">Documentos</span>
            </button>
            <button class="flex flex-col items-center gap-1 text-primary dark:text-blue-400">
                <span class="material-symbols-outlined filled">person</span>
                <span class="text-[10px] font-bold">Perfil</span>
            </button>
        </nav>
    </form>
</body>
</html>
