<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="AsignarSector.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.AsignarSector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="px-4 px-md-5 py-4">

        <header class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <a class="text-muted mb-1 small fw-semibold" style="text-transform: uppercase; letter-spacing: .04em;" href="Sectores.aspx">Sectores</a>
                <p class="text-muted mb-1 small fw-semibold" style="text-transform: uppercase; letter-spacing: .04em;"> / Trabajadores</p>
                <h2 class="fw-bold text-dark mb-0" style="font-size: 1.5rem;">Gestión de Trabajadores</h2>
            </div>
            <div class="d-flex gap-2">
                <button type="button" class="btn d-inline-flex align-items-center gap-2"
                    data-bs-toggle="modal" data-bs-target="#modalAsignarSector"
                    style="background: #eef0fd; color: #0b1184; border: none; border-radius: .75rem; font-weight: 600; font-size: .85rem;">
                    <i class="bi bi-geo-alt-fill"></i>Asignar Sector
                </button>
            </div>
        </header>

        <!-- Pon tu Repeater aquí -->
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
            <asp:Repeater ID="rptTrabajadores" runat="server">
                <ItemTemplate>
                    <div class="bg-white rounded-3 border border-light shadow-sm p-4 d-flex flex-column gap-3"
                        style="border-radius: 1.25rem !important; box-shadow: 0 2px 14px rgba(17,24,76,0.06) !important;">

                        <!-- Avatar y nombre -->
                        <div class="d-flex align-items-center gap-3">
                            <div class="rounded-circle d-flex align-items-center justify-content-center text-white fw-bold"
                                style="width: 46px; height: 46px; background: linear-gradient(135deg,#0b1184,#4f46e5); font-size: 1.1rem; flex-shrink: 0;">
                                <%# Eval("Trabajador").ToString().Substring(0,1).ToUpper() %>
                            </div>
                            <div class="min-w-0">
                                <h6 class="fw-bold text-dark mb-0 text-truncate" style="font-size: .9rem;"><%# Eval("Trabajador") %></h6>
                                <span class="badge rounded-pill mt-1" style="background: #eef0fd; color: #0b1184; font-size: .65rem; font-weight: 600;">
                                    <%# Eval("Cargo") %>
                                </span>
                            </div>
                        </div>

                        <!-- Info -->
                        <div class="d-flex flex-column gap-1">
                            <p class="mb-0 text-muted d-flex align-items-center gap-2" style="font-size: .78rem;">
                                <i class="bi bi-envelope" style="color: #0b1184;"></i>
                                <%# Eval("Email") %>
                            </p>
                            <p class="mb-0 text-muted d-flex align-items-center gap-2" style="font-size: .78rem;">
                                <i class="bi bi-card-text" style="color: #0b1184;"></i>
                                <%# Eval("Documento") %>
                            </p>
                            <p class="mb-0 text-muted d-flex align-items-center gap-2" style="font-size: .78rem;">
                                <i class="bi bi-building" style="color: #0b1184;"></i>
                                <%# Eval("Municipio")%>
                            </p>
                            <p class="mb-0 text-muted d-flex align-items-center gap-2" style="font-size: .78rem;">
                                <i class="bi bi-geo-alt" style="color: #0b1184;"></i>
                                <%# Eval("SectorAsignado") ?? "Sin sector asignado" %>
                            </p>
                        </div>

                        <!-- Acciones -->
                        <div class="d-flex gap-2 mt-1">
                            <button type="button" class="btn btn-sm flex-fill fw-semibold btn-editar-trabajador"
                                data-id='<%# Eval("Id") %>'
                                data-nombre='<%# Eval("Trabajador") %>'
                                onclick="abrirModalEditar(this)"
                                style="background: #eef0fd; color: #0b1184; border: none; border-radius: .6rem; font-size: .78rem;">
                                <i class="bi bi-pencil-square me-1"></i>Editar
                            </button>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>

    <!-- Modal Asignar Sector -->
    <div class="modal fade" id="modalAsignarSector" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 460px;">
            <div class="modal-content" style="border: none; border-radius: 20px; overflow: hidden;">
                <div class="d-flex align-items-center justify-content-between px-4 py-3" style="border-bottom: 1px solid #f1f5f9;">
                    <div class="d-flex align-items-center gap-3">
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                            style="width: 40px; height: 40px; background: linear-gradient(135deg,#0b1184,#060a52);">
                            <i class="bi bi-geo-alt-fill text-white"></i>
                        </div>
                        <div>
                            <h6 class="fw-bold mb-0" style="font-size: .95rem;">Asignar Sector</h6>
                            <p class="text-muted mb-0" style="font-size: .75rem;">Asigna un sector a un trabajador</p>
                        </div>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="px-4 py-4">
                    <div class="mb-3">
                        <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Trabajador *</label>
                        <asp:DropDownList ID="ddlTrabajador" runat="server" CssClass="form-select" />
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
                    <button id="btnAsignarSector" type="button" onclick="asignarSector()"
                        class="btn btn-sm fw-semibold text-white px-4"
                        style="background: #0b1184; border: none; border-radius: 10px;">
                        <i class="bi bi-check-lg me-1"></i>Asignar
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Editar Trabajador -->
    <div class="modal fade" id="modalEditarTrabajador" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 460px;">
            <div class="modal-content" style="border: none; border-radius: 20px; overflow: hidden;">
                <div class="d-flex align-items-center justify-content-between px-4 py-3" style="border-bottom: 1px solid #f1f5f9;">
                    <div class="d-flex align-items-center gap-3">
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                            style="width: 40px; height: 40px; background: linear-gradient(135deg,#4f46e5 ,#0b1184);">
                            <i class="bi bi-pencil-fill text-white"></i>
                        </div>
                        <div>
                            <h6 class="fw-bold mb-0" style="font-size: .95rem;">Editar Trabajador</h6>
                            <p class="text-muted mb-0" style="font-size: .75rem;">Modifique los datos del trabajador</p>
                        </div>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="px-4 py-4">
                    <input type="hidden" id="txtEditIdTrabajador" />
                    <div class="mb-3">
                        <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Nombre</label>
                        <input id="txtEditNombreTrabajador" class="form-control" style="border-radius: .75rem;" readonly />
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
                    <button id="btnGuardarEditTrabajador" type="button" onclick="guardarEdicionTrabajador()"
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
                url: "AsignarSector.aspx/MtSectoresPorMunicipio",
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

        function asignarSector() {
            var idTrabajador = parseInt($("select[id$='ddlTrabajador']").val()) || 0;
            var idSector = parseInt($("select[id$='ddlSector']").val()) || 0;

            if (idTrabajador === 0 || idSector === 0) {
                Swal.fire('Error', 'Seleccione un trabajador y un sector.', 'error');
                return;
            }

            $.ajax({
                type: "POST",
                url: "AsignarSector.aspx/MtAsignarSector",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ idTrabajador: idTrabajador, idSector: idSector }),
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        Swal.fire('¡Listo!', 'Sector asignado correctamente.', 'success');
                        location.reload();
                        bootstrap.Modal.getInstance(document.getElementById('modalAsignarSector')).hide();
                    } else {
                        Swal.fire('Error', 'No se pudo asignar el sector.', 'error');
                    }
                },
                error: function (xhr) {
                    console.error("Error:", xhr.responseText);
                    Swal.fire('Error', 'Ocurrió un error en el servidor.', 'error');
                }
            });
        };

        function abrirModalEditar(btn) {
            var id = btn.getAttribute('data-id');
            var nombre = btn.getAttribute('data-nombre');

            $('#txtEditIdTrabajador').val(id);
            $('#txtEditNombreTrabajador').val(nombre);
            $('#ddlEditSector').html('<option value="">Seleccione un municipio primero</option>');

            var ddlMunicipio = document.querySelector("select[id$='ddlMunicipio']");
            var ddlEditMunicipio = document.getElementById('ddlEditMunicipio');
            ddlEditMunicipio.innerHTML = ddlMunicipio.innerHTML;

            new bootstrap.Modal(document.getElementById('modalEditarTrabajador')).show();
        }

        function cargarSectoresEdit(idMunicipio) {
            var ddlSector = document.getElementById('ddlEditSector');
            ddlSector.innerHTML = '<option value="">Cargando...</option>';

            $.ajax({
                type: "POST",
                url: "AsignarSector.aspx/MtSectoresPorMunicipio",
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

        function guardarEdicionTrabajador() {
            var idTrabajador = parseInt($('#txtEditIdTrabajador').val()) || 0;
            var idSector = parseInt($('#ddlEditSector').val()) || 0;

            if (idSector === 0) {
                Swal.fire('Error', 'Seleccione un sector.', 'error');
                return;
            }

            $.ajax({
                type: "POST",
                url: "AsignarSector.aspx/MtReasignarSector",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ idTrabajador: idTrabajador, idSector: idSector }),
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        Swal.fire('¡Listo!', 'Sector actualizado correctamente.', 'success').then(function () {
                            location.reload();
                        });
                    } else {
                        Swal.fire('Error', 'No se pudo actualizar el sector.', 'error');
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
