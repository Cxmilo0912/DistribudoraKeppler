<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="DashboardPreventista.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Preventista.DashboardPreventista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Manrope:wght@700;800&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#4648d4",
                        "primary-container": "#6063ee",
                        "on-primary": "#ffffff",
                        "surface": "#fcf8ff",
                        "on-surface": "#1b1b23",
                        "surface-container-low": "#f5f2fe",
                        "surface-container-lowest": "#ffffff",
                        "on-surface-variant": "#464545",
                        "outline-variant": "#c7c4d7",
                        "tertiary-fixed": "#ffdcc5",
                        "on-tertiary-fixed-variant": "#703700",
                        "primary-fixed-dim": "#c0c1ff",
                        "primary-fixed": "#e1e0ff"
                    }
                }
            }
        }
    </script>
    <style>
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
        body { font-family: 'Inter', sans-serif; background-color: #fcf8ff; }
        h1, h2, h3 { font-family: 'Manrope', sans-serif; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="min-h-screen pb-32 text-on-surface">
        <header class="w-full pt-4 pb-2 px-6 flex justify-between items-center max-w-xl mx-auto">
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 rounded-full bg-primary-fixed-dim flex items-center justify-center overflow-hidden">
                    <img class="w-full h-full object-cover" src="https://ui-avatars.com/api/?name=Juan+Perez&background=4648d4&color=fff" alt="Perfil" />
                </div>
                <div>
                    <h1 class="font-manrope font-bold text-[18px] leading-tight">¡Hola, Juan Pérez!</h1>
                    <p class="text-on-surface-variant text-[12px]">ID: 4529</p>
                </div>
            </div>
            <button type="button" class="w-10 h-10 flex items-center justify-center rounded-full hover:bg-slate-100 transition-colors">
                <span class="material-symbols-outlined text-indigo-600">notifications</span>
            </button>
        </header>

        <main class="px-6 max-w-xl mx-auto space-y-8">
            <section class="mt-2">
                <p class="text-primary font-semibold text-[14px] uppercase tracking-wider">Viernes, 25 de Octubre</p>
            </section>

            <section>
                <div class="relative overflow-hidden rounded-xl bg-gradient-to-br from-primary to-primary-container p-6 text-on-primary shadow-lg">
                    <div class="relative z-10">
                        <p class="text-on-primary/80 font-medium text-[14px]">Resumen de ventas del día</p>
                        <div class="mt-4 flex flex-col gap-1">
                            <span class="text-[12px] opacity-90">Ventas Totales:</span>
                            <div class="flex items-baseline gap-3">
                                <h2 class="text-[32px] font-bold tracking-tight">$12,450.00</h2>
                                <span class="bg-white/20 px-2 py-1 rounded-full text-[12px] font-bold">+12.5%</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-2 gap-4 mt-4">
                    <div class="bg-white p-4 rounded-xl shadow-sm border border-slate-100">
                        <p class="text-on-surface-variant text-[12px] font-medium">Pedidos</p>
                        <p class="text-[20px] font-bold">18</p>
                    </div>
                    <div class="bg-white p-4 rounded-xl shadow-sm border border-slate-100">
                        <p class="text-on-surface-variant text-[12px] font-medium">Visitas</p>
                        <div class="flex items-baseline gap-1">
                            <p class="text-[20px] font-bold">24</p>
                            <p class="text-on-surface-variant text-[14px]">/30</p>
                        </div>
                    </div>
                </div>
            </section>

            <section>
                <h3 class="font-bold text-[18px] mb-4">Accesos rápidos</h3>
                <div class="grid grid-cols-3 gap-3">
                    <button type="button" class="flex flex-col items-center p-4 bg-surface-container-low rounded-xl gap-2 hover:bg-indigo-50 transition-all">
                        <div class="w-12 h-12 bg-primary rounded-full flex items-center justify-center text-white">
                            <span class="material-symbols-outlined">add_shopping_cart</span>
                        </div>
                        <span class="text-[10px] font-bold uppercase">Nuevo Pedido</span>
                    </button>
                    </div>
            </section>

            <section>
                <div class="flex justify-between items-center mb-4">
                    <h3 class="font-bold text-[18px]">Actividad reciente</h3>
                    <a href="#" class="text-primary font-bold text-[12px]">Ver todo</a>
                </div>
                <div class="space-y-4">
                    <div class="flex items-center justify-between bg-white p-4 rounded-xl shadow-sm">
                        <div class="flex items-center gap-3">
                            <div class="w-10 h-10 rounded-full bg-green-100 flex items-center justify-center text-green-600">
                                <span class="material-symbols-outlined">check_circle</span>
                            </div>
                            <div>
                                <p class="font-bold text-[14px]">Pedido #8902</p>
                                <p class="text-on-surface-variant text-[12px]">Mini Market La Esperanza</p>
                            </div>
                        </div>
                        <div class="text-right">
                            <p class="font-bold text-[14px]">$1,250.00</p>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <nav class="fixed bottom-0 left-0 right-0 z-50 flex justify-around items-center px-4 pb-6 pt-3 bg-white/80 backdrop-blur-xl border-t border-slate-100">
            <a class="flex flex-col items-center text-indigo-700 px-5 py-2" href="#">
                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">home</span>
                <span class="text-[10px] font-semibold">Inicio</span>
            </a>
            <a class="flex flex-col items-center text-slate-400 px-5 py-2" href="#">
                <span class="material-symbols-outlined">shopping_cart</span>
                <span class="text-[10px] font-semibold">Pedidos</span>
            </a>
            <a class="flex flex-col items-center text-slate-400 px-5 py-2" href="#">
                <span class="material-symbols-outlined">group</span>
                <span class="text-[10px] font-semibold">Clientes</span>
            </a>
        </nav>

        <button type="button" class="fixed bottom-28 right-6 w-14 h-14 bg-primary text-white rounded-full shadow-2xl flex items-center justify-center active:scale-90 transition-transform z-40">
            <span class="material-symbols-outlined text-[28px]">add</span>
        </button>
    </div>
</asp:Content>