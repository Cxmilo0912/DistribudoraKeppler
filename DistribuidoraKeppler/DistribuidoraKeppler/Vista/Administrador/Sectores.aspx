<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="Sectores.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.Sectores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="https://cdn.datatables.net/v/bs5/jszip-3.10.1/dt-2.0.8/b-3.0.2/b-colvis-3.0.2/b-html5-3.0.2/b-print-3.0.2/cr-2.0.3/fc-5.0.1/fh-4.0.1/r-3.0.2/sp-2.3.3/sl-2.0.3/datatables.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>

    <script src="https://cdn.datatables.net/v/bs5/jszip-3.10.1/dt-2.0.8/b-3.0.2/b-colvis-3.0.2/b-html5-3.0.2/b-print-3.0.2/cr-2.0.3/fc-5.0.1/fh-4.0.1/r-3.0.2/sp-2.3.3/sl-2.0.3/datatables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        #tablaSectores tbody tr {
            transition: background-color 0.15s ease;
        }

        #tablaSectores tbody td {
            padding: .85rem 1.25rem;
            font-size: .9rem;
            border-bottom: 1px solid #f2f4f9;
            vertical-align: middle;
        }

        #tablaSectores tbody tr:last-child td {
            border-bottom: none;
        }

        #tablaSectores tbody tr:hover td {
            background-color: rgba(11,17,132,0.025);
        }

        .dt-search input {
            border-radius: .75rem !important;
            border: 1px solid #e2e8f0 !important;
            padding: .45rem 1rem !important;
            font-size: .82rem !important;
        }

        .dt-length select {
            border-radius: .75rem !important;
            border: 1px solid #e2e8f0 !important;
            font-size: .82rem !important;
        }

        .dt-paging .page-link {
            border-radius: .5rem !important;
            color: #0b1184 !important;
            font-size: .8rem;
        }

        .dt-paging .active .page-link {
            background-color: #0b1184 !important;
            border-color: #0b1184 !important;
            color: #fff !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="px-4 px-md-5 py-4">

        <header class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <p class="text-muted mb-1 small fw-semibold" style="text-transform: uppercase; letter-spacing: .04em;">Localización / Sectores</p>
                <h2 class="fw-bold text-dark mb-0" style="font-size: 1.5rem;">Gestión de Sectores</h2>
            </div>
            <div class="d-flex gap-2">
                <button type="button" class="btn btn-primary d-inline-flex gap-2 btn-crear"
                    data-bs-toggle="modal" data-bs-target="#modalSector"
                    style="background: linear-gradient(135deg,#4f46e5 ,#0b1184); border-color: #0b1184; border-radius: .75rem; font-weight: 600;">
                    <i class="bi bi-plus-lg"></i>Nuevo Sector
                </button>
                <button type="button" onclick="window.location.href='AsignarSector.aspx'"
                    class="btn d-inline-flex gap-2"
                    style="background: linear-gradient(135deg,#0b1184,#4f46e5); color: #fff; border: none; border-radius: .75rem; font-weight: 600; font-size: .85rem; padding: 10px 20px; box-shadow: 0 4px 14px rgba(11,17,132,0.25);">
                    <i class="bi bi-arrow-right-circle-fill"></i>
                    Asignar Sectores
                </button>
            </div>
        </header>

        <div class="card border-0 rounded-4 overflow-hidden" style="box-shadow: 0 2px 14px rgba(17,24,76,0.07);">
            <div class="card-header bg-white border-0 px-4 pt-4 pb-3 d-flex justify-content-between align-items-center">
                <h6 class="fw-bold mb-0 text-dark d-flex align-items-center gap-2">
                    <i class="bi bi-compass-fill" style="color: #0b1184;"></i>
                    Lista de Sectores
                </h6>
                <span class="badge rounded-pill px-3 py-2"
                    style="background: #eef0fd; color: #0b1184; font-size: .7rem; font-weight: 600;">Registro Activo
                </span>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive px-3 pb-3">
                    <table id="tablaSectores" class="table table-hover align-middle mb-0 w-100">
                        <thead>
                            <tr style="background: #f8f9fc;">
                                <th style="font-size: .68rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #9aa0b4; border-bottom: none; padding: .9rem 1.25rem;">Id</th>
                                <th style="font-size: .68rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #9aa0b4; border-bottom: none; padding: .9rem 1.25rem;">Nombre</th>
                                <th style="font-size: .68rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #9aa0b4; border-bottom: none; padding: .9rem 1.25rem;">Días de Visita</th>
                                <th style="font-size: .68rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #9aa0b4; border-bottom: none; padding: .9rem 1.25rem;">Capacidad Máxima</th>
                                <th style="font-size: .68rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #9aa0b4; border-bottom: none; padding: .9rem 1.25rem;">Estado</th>
                                <th style="font-size: .68rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #9aa0b4; border-bottom: none; padding: .9rem 1.25rem;">Municipio</th>
                                <th class="text-end" style="font-size: .68rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #9aa0b4; border-bottom: none; padding: .9rem 1.25rem;">Acciones</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!--Modal Crear -->
    <div class="modal fade" id="modalSector" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 480px;">
            <div class="modal-content" style="border: none; border-radius: 20px; overflow: hidden;">
                <div class="d-flex align-items-center justify-content-between px-4 py-3" style="border-bottom: 1px solid #f1f5f9;">
                    <div class="d-flex align-items-center gap-3">
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                            style="width: 40px; height: 40px; background: linear-gradient(135deg,#4f46e5 ,#0b1184);">
                            <i class="bi bi-compass-fill text-white"></i>
                        </div>
                        <div>
                            <h6 class="modal-title fw-bold mb-0" style="font-size: .95rem;">Nuevo Sector</h6>
                            <p class="text-muted mb-0" style="font-size: .75rem;">Complete los datos del sector</p>
                        </div>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="px-4 py-4">
                    <div class="mb-3">
                        <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Nombre del Sector *</label>
                        <input id="txtNombreSector" class="form-control" placeholder="Ej: Norte, Centro, Occidente..." style="border-radius: .75rem;" />
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Días de Visita *</label>
                            <input id="txtDiasVisita" class="form-control" placeholder="Ej: Lunes, Martes..." style="border-radius: .75rem;" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Capacidad Máxima *</label>
                            <input id="txtCapacidad" type="number" class="form-control" placeholder="Ej: 15" style="border-radius: .75rem;" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Municipio Relacionado *</label>
                            <asp:DropDownList ID="ddlMunicipio" runat="server" CssClass="form-select"></asp:DropDownList>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Estado *</label>
                            <select id="ddlEstado" class="form-select" style="border-radius: .75rem;">
                                <option value="1">Activo</option>
                                <option value="0">Inactivo</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="d-flex justify-content-end gap-2 px-4 py-3" style="background: #f8fafc; border-top: 1px solid #f1f5f9;">
                    <button type="button" class="btn btn-sm fw-semibold text-muted" data-bs-dismiss="modal"
                        style="background: #f1f5f9; border: none; border-radius: 10px; padding: 8px 18px;">
                        Cancelar                  
                    </button>
                    <button id="btnGuardar" type="button" class="btn btn-sm fw-semibold text-white px-4"
                        style="background: linear-gradient(135deg,#4f46e5 ,#0b1184); border-color: #0b1184; border-radius: .75rem; font-weight: 600;">
                        Guardar Sector
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!--Modal Editar -->
    <div class="modal fade" id="modalEditarSector" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 480px;">
            <div class="modal-content" style="border: none; border-radius: 20px; overflow: hidden;">
                <div class="d-flex align-items-center justify-content-between px-4 py-3" style="border-bottom: 1px solid #f1f5f9;">
                    <div class="d-flex align-items-center gap-3">
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                            style="width: 40px; height: 40px; background: linear-gradient(135deg,#0b1184,#4f46e5);">
                            <i class="bi bi-pencil-fill text-white"></i>
                        </div>
                        <div>
                            <h6 class="fw-bold mb-0" style="font-size: .95rem;">Editar Sector</h6>
                            <p class="text-muted mb-0" style="font-size: .75rem;">Modifique los datos del sector</p>
                        </div>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="px-4 py-4">
                    <input type="hidden" id="txtEditIdSector" />

                    <div class="mb-3">
                        <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Nombre del Sector *</label>
                        <input id="txtEditNombreSector" class="form-control" placeholder="Ej: Norte, Centro, Occidente..." style="border-radius: .75rem;" />
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Días de Visita *</label>
                            <input id="txtEditDiasVisita" class="form-control" placeholder="Ej: Lunes, Martes..." style="border-radius: .75rem;" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Capacidad Máxima *</label>
                            <input id="txtEditCapacidad" type="number" class="form-control" placeholder="Ej: 15" style="border-radius: .75rem;" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Municipio Relacionado *</label>
                            <asp:DropDownList ID="ddlEditMunicipio" runat="server" CssClass="form-select" Style="border-radius: .75rem;"></asp:DropDownList>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Estado *</label>
                            <select id="ddlEditEstado" class="form-select" style="border-radius: .75rem;">
                                <option value="1">Activo</option>
                                <option value="0">Inactivo</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="d-flex justify-content-end gap-2 px-4 py-3" style="background: #f8fafc; border-top: 1px solid #f1f5f9;">
                    <button type="button" class="btn btn-sm fw-semibold text-muted" data-bs-dismiss="modal"
                        style="background: #f1f5f9; border: none; border-radius: 10px; padding: 8px 18px;">
                        Cancelar
                    </button>
                    <button id="btnGuardarEdit" type="button" class="btn btn-sm fw-semibold text-white px-4"
                        style="background: linear-gradient(135deg,#4f46e5 ,#0b1184); border: none; border-radius: .75rem; font-weight: 600;">
                        <i class="bi bi-check-lg me-1"></i>Actualizar Sector
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script src="../Assets/js/Sector.js?V=1.8"></script>
</asp:Content>
