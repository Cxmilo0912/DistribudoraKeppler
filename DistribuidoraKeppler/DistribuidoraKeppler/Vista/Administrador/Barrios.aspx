<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="Barrios.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.Barrios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="px-4 px-md-5 py-4">

        <header class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <p class="text-muted mb-1 small fw-semibold" style="text-transform: uppercase; letter-spacing: .04em;">Localización / Barrios</p>
                <h2 class="fw-bold text-dark mb-0" style="font-size: 1.5rem;">Gestión de Barrios</h2>
            </div>
            <button type="button" class="btn btn-primary d-inline-flex align-items-center gap-2"
                data-bs-toggle="modal" data-bs-target="#modalBarrio"
                style="background: #0b1184; border-color: #0b1184; border-radius: .75rem; font-weight: 600;">
                <i class="bi bi-plus-lg"></i>Nuevo Barrio
            </button>
        </header>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
            <asp:Repeater ID="rptBarrios" runat="server">
                <ItemTemplate>
                    <div class="bg-white d-flex flex-column"
                        style="border-radius: 1.25rem; box-shadow: 0 2px 14px rgba(17,24,76,0.06); border: 1px solid #f1f5f9; overflow: hidden;">

                        <!-- Header degradado -->
                        <div class="d-flex align-items-center gap-3 px-4 py-3"
                            style="background: linear-gradient(135deg,#0b1184,#4f46e5);">
                            <div class="d-flex align-items-center justify-content-center rounded-3"
                                style="width: 40px; height: 40px; background: rgba(255,255,255,0.15); flex-shrink: 0;">
                                <i class="bi bi-house-fill text-white"></i>
                            </div>
                            <div class="min-w-0">
                                <p style="font-size: .6rem; font-weight: 700; text-transform: uppercase; letter-spacing: .07em; color: rgba(255,255,255,0.55); margin: 0;">Barrio</p>
                                <h6 class="text-white fw-bold mb-0 text-truncate" style="font-size: .95rem;"><%# Eval("Nombre") %></h6>
                            </div>
                        </div>

                        <!-- Cuerpo -->
                        <div class="d-flex flex-column gap-2 p-3" style="flex: 1;">

                            <!-- Sector -->
                            <div class="d-flex align-items-center gap-2 px-3 py-2"
                                style="background: #f8fafc; border-radius: .75rem; border: 1px solid #f1f5f9;">
                                <div class="d-flex align-items-center justify-content-center rounded-2"
                                    style="width: 28px; height: 28px; background: #eef0fd; flex-shrink: 0;">
                                    <i class="bi bi-geo-alt-fill" style="color: #0b1184; font-size: .75rem;"></i>
                                </div>
                                <div>
                                    <a href="Sectores.aspx" style="display: block; font-size: .6rem; font-weight: 700; text-transform: uppercase; letter-spacing: .06em; color: #94a3b8; margin: 0;">Sector</a>
                                    <a href="Sectores.aspx" style="display: block; font-size: .8rem; font-weight: 600; color: #334155; margin: 0;"><%# Eval("Sector.Nombre") %></a>
                                </div>
                            </div>

                            <!-- Botón -->
                            <button type="button" class="btn-editar-barrio"
                                data-id='<%# Eval("Id") %>'
                                data-nombre='<%# Eval("Nombre") %>'
                                onclick="abrirModalEditar(this)"
                                style="width: 100%; padding: .55rem; background: #eef0fd; color: #0b1184; border: none; border-radius: .75rem; font-size: .78rem; font-weight: 700; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: .4rem; margin-top: auto;"
                                onmouseover="this.style.background='#dde0fb'" onmouseout="this.style.background='#eef0fd'">
                                <i class="bi bi-pencil-square"></i>Editar
                            </button>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>

    <!-- Modal Crear Barrio -->
    <div class="modal fade" id="modalBarrio" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 460px;">
            <div class="modal-content" style="border: none; border-radius: 20px; overflow: hidden;">
                <div class="d-flex align-items-center justify-content-between px-4 py-3" style="border-bottom: 1px solid #f1f5f9;">
                    <div class="d-flex align-items-center gap-3">
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                            style="width: 40px; height: 40px; background: linear-gradient(135deg,#0b1184,#060a52);">
                            <i class="bi bi-geo-alt-fill text-white"></i>
                        </div>
                        <div>
                            <h6 class="fw-bold mb-0" style="font-size: .95rem;">Nuevo Barrio</h6>
                            <p class="text-muted mb-0" style="font-size: .75rem;">Complete los datos del barrio</p>
                        </div>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="px-4 py-4">
                    <div class="mb-3">
                        <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Nombre *</label>
                        <asp:TextBox ID="txtNombreBarrio" runat="server" CssClass="form-control" placeholder="Ej: El Poblado, Laureles..." />
                    </div>
                    <div class="mb-3">
                        <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Municipio *</label>
                        <asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-select"
                            onchange="cargarSectores(this.value)" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Sector *</label>
                        <asp:DropDownList ID="ddlSector" runat="server" CssClass="form-select" />
                    </div>
                </div>
                <div class="d-flex justify-content-end gap-2 px-4 py-3" style="background: #f8fafc; border-top: 1px solid #f1f5f9;">
                    <button type="button" class="btn btn-sm fw-semibold text-muted" data-bs-dismiss="modal"
                        style="background: #f1f5f9; border: none; border-radius: 10px; padding: 8px 18px;">
                        Cancelar</button>
                    <button id="btnCrearBarrio" type="button" onclick="crearBarrio()"
                        class="btn btn-sm fw-semibold text-white px-4"
                        style="background: #0b1184; border: none; border-radius: 10px;">
                        <i class="bi bi-check-lg me-1"></i>Asignar
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!--Modal Editar Barrio -->
    <div class="modal fade" id="modalEditarBarrio" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 460px;">
            <div class="modal-content" style="border: none; border-radius: 20px; overflow: hidden;">
                <div class="d-flex align-items-center justify-content-between px-4 py-3" style="border-bottom: 1px solid #f1f5f9;">
                    <div class="d-flex align-items-center gap-3">
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                            style="width: 40px; height: 40px; background: linear-gradient(135deg,#4f46e5 ,#0b1184);">
                            <i class="bi bi-pencil-fill text-white"></i>
                        </div>
                        <div>
                            <h6 class="fw-bold mb-0" style="font-size: .95rem;">Editar Barrio</h6>
                            <p class="text-muted mb-0" style="font-size: .75rem;">Modifique los datos Barrio</p>
                        </div>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="px-4 py-4">
                    <input type="hidden" id="txtEditIdBarrio" />
                    <div class="mb-3">
                        <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Nombre</label>
                        <input id="txtEditNombreBarrio" class="form-control" style="border-radius: .75rem;" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Municipio *</label>
                        <select id="ddlEditMunicipio" class="form-select" style="border-radius: .75rem;" onchange="cargarSectoresEdit(this.value)">
                            <!-- Se llena por JS -->
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Sector *</label>
                        <select id="ddlEditSector" class="form-select" style="border-radius: .75rem;">
                            <option value="">Seleccione un municipio primero</option>
                        </select>
                    </div>
                </div>
                <div class="d-flex justify-content-end gap-2 px-4 py-3" style="background: #f8fafc; border-top: 1px solid #f1f5f9;">
                    <button type="button" class="btn btn-sm fw-semibold text-muted" data-bs-dismiss="modal"
                        style="background: #f1f5f9; border: none; border-radius: 10px; padding: 8px 18px;">
                        Cancelar
                    </button>
                    <button id="btnGuardarEditBarrio" type="button" onclick="guardarEdicionBarrio()"
                        class="btn btn-sm fw-semibold text-white px-4"
                        style="background: linear-gradient(135deg,#4f46e5 ,#0b1184); border: none; border-radius: 10px;">
                        <i class="bi bi-check-lg me-1"></i>Guardar
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function cargarSectores(idMunicipio) {
            var ddlSector = document.querySelector("select[id$='ddlSector']");
            ddlSector.innerHTML = '<option value="">Cargando...</option>';

            $.ajax({
                type: "POST",
                url: "Barrios.aspx/MtSectoresPorMunicipio",
                data: JSON.stringify({ idMunicipio: parseInt(idMunicipio) }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    ddlSector.innerHTML = '<option value="">Seleccione un sector</option>';
                    if (response.d && response.d.length > 0) {
                        response.d.forEach(function (sector) {
                            ddlSector.innerHTML += '<option value="' + sector.Id + '">' + sector.Nombre + '</option>';
                        });
                    } else {
                        ddlSector.innerHTML = '<option value="">Sin sectores disponibles</option>';
                    }
                },
                error: function () {
                    ddlSector.innerHTML = '<option value="">Error al cargar</option>';
                }
            });
        }

        function crearBarrio() {
            var nombre = $("input[id$='txtNombreBarrio']").val().trim();
            var idSector = parseInt($("select[id$='ddlSector']").val()) || 0;

            if (nombre === "") {
                Swal.fire('Error', 'Ingrese el nombre del barrio.', 'error');
                return;
            }
            if (idSector === 0) {
                Swal.fire('Error', 'Seleccione un sector.', 'error');
                return;
            }

            $.ajax({
                type: "POST",
                url: "Barrios.aspx/MtCrearBarrio",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ nombre: nombre, idSector: idSector }),
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        Swal.fire('¡Listo!', 'Barrio creado correctamente.', 'success').then(function () {
                            location.reload();
                        });
                    } else {
                        Swal.fire('Error', 'No se pudo crear el barrio.', 'error');
                    }
                },
                error: function (xhr) {
                    console.error("Error:", xhr.responseText);
                    Swal.fire('Error', 'Ocurrió un error en el servidor.', 'error');
                }
            });
        }

        function abrirModalEditar(btn) {
            var id = btn.getAttribute('data-id');
            var nombre = btn.getAttribute('data-nombre');

            $('#txtEditIdBarrio').val(id);
            $('#txtEditNombreBarrio').val(nombre);
            $('#ddlEditSector').html('<option value="">Seleccione un municipio primero</option>');

            var ddlMunicipio = document.querySelector("select[id$='ddlMunicipio']");
            var ddlEditMunicipio = document.getElementById('ddlEditMunicipio');
            ddlEditMunicipio.innerHTML = ddlMunicipio.innerHTML;

            new bootstrap.Modal(document.getElementById('modalEditarBarrio')).show();
        }

        function cargarSectoresEdit(idMunicipio) {
            var ddlSector = document.getElementById('ddlEditSector');
            ddlSector.innerHTML = '<option value="">Cargando...</option>';

            $.ajax({
                type: "POST",
                url: "Barrios.aspx/MtSectoresPorMunicipio",
                data: JSON.stringify({ idMunicipio: parseInt(idMunicipio) }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    ddlSector.innerHTML = '<option value="">Seleccione un sector</option>';
                    if (response.d && response.d.length > 0) {
                        response.d.forEach(function (sector) {
                            ddlSector.innerHTML += '<option value="' + sector.Id + '">' + sector.Nombre + '</option>';
                        });
                    } else {
                        ddlSector.innerHTML = '<option value="">Sin sectores disponibles</option>';
                    }
                },
                error: function () {
                    ddlSector.innerHTML = '<option value="">Error al cargar</option>';
                }
            });
        }

        function guardarEdicionBarrio() {
            var idBarrio = parseInt($('#txtEditIdBarrio').val()) || 0;
            var nombre = $('#txtEditNombreBarrio').val().trim();
            var idSector = parseInt($('#ddlEditSector').val()) || 0;

            if (nombre === "") {
                Swal.fire('Error', 'Ingrese el nombre del barrio.', 'error');
                return;
            }
            if (idSector === 0) {
                Swal.fire('Error', 'Seleccione un sector.', 'error');
                return;
            }

            $.ajax({
                type: "POST",
                url: "Barrios.aspx/MtEditarBarrio",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ idBarrio: idBarrio, nombre: nombre, idSector: idSector }),
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        Swal.fire('¡Listo!', 'Barrio actualizado correctamente.', 'success').then(function () {
                            location.reload();
                        });
                    } else {
                        Swal.fire('Error', 'No se pudo actualizar el barrio.', 'error');
                    }
                },
                error: function (xhr) {
                    console.error("Error:", xhr.responseText);
                    Swal.fire('Error', 'Ocurrió un error en el servidor.', 'error');
                }
            });
        }
    </script>
</asp:Content>
