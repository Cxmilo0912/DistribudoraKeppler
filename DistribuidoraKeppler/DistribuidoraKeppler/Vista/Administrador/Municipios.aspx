<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site1.Master" AutoEventWireup="true" CodeBehind="Municipios.aspx.cs" Inherits="DistribuidoraKeppler.Vista.Administrador.Municipios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://cdn.datatables.net/v/bs5/jszip-3.10.1/dt-2.0.8/b-3.0.2/b-colvis-3.0.2/b-html5-3.0.2/b-print-3.0.2/cr-2.0.3/fc-5.0.1/fh-4.0.1/r-3.0.2/sp-2.3.3/sl-2.0.3/datatables.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <script src="https://cdn.datatables.net/v/bs5/jszip-3.10.1/dt-2.0.8/b-3.0.2/b-colvis-3.0.2/b-html5-3.0.2/b-print-3.0.2/cr-2.0.3/fc-5.0.1/fh-4.0.1/r-3.0.2/sp-2.3.3/sl-2.0.3/datatables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        #tablaMunicipios tbody tr {
            transition: background-color 0.15s ease;
        }

        #tablaMunicipios tbody td {
            padding: .85rem 1.25rem;
            font-size: .9rem;
            border-bottom: 1px solid #f2f4f9;
            vertical-align: middle;
        }

        #tablaMunicipios tbody tr:last-child td {
            border-bottom: none;
        }

        #tablaMunicipios tbody tr:hover td {
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
                <p class="text-muted mb-1 small fw-semibold" style="text-transform: uppercase; letter-spacing: .04em;">Localización / Municipios</p>
                <h2 class="fw-bold text-dark mb-0" style="font-size: 1.5rem;">Gestión de Municipios</h2>
            </div>
            <button type="button" class="btn btn-primary d-inline-flex align-items-center gap-2 btn-crear"
                data-bs-toggle="modal" data-bs-target="#modalMunicipio"
                style="background: #0b1184; border-color: #0b1184; border-radius: .75rem; font-weight: 600;">
                <i class="bi bi-plus-lg"></i>Nuevo Municipio
            </button>
        </header>

        <!-- Tabla va aquí -->
        <div class="card border-0 rounded-4 overflow-hidden" style="box-shadow: 0 2px 14px rgba(17,24,76,0.07);">
            <div class="card-header bg-white border-0 px-4 pt-4 pb-3 d-flex justify-content-between align-items-center">
                <h6 class="fw-bold mb-0 text-dark d-flex align-items-center gap-2">
                    <i class="bi bi-map-fill" style="color: #0b1184;"></i>
                    Lista de Municipios
                </h6>
                <span class="badge rounded-pill px-3 py-2"
                    style="background: #eef0fd; color: #0b1184; font-size: .7rem; font-weight: 600;">Registro activo
                </span>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive px-3 pb-3">
                    <table id="tablaMunicipios" class="table table-hover align-middle mb-0 w-100">
                        <thead>
                            <tr style="background: #f8f9fc;">
                                <th style="font-size: .68rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #9aa0b4; border-bottom: none; padding: .9rem 1.25rem;">Id</th>
                                <th style="font-size: .68rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #9aa0b4; border-bottom: none; padding: .9rem 1.25rem;">Nombre</th>
                                <th style="font-size: .68rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #9aa0b4; border-bottom: none; padding: .9rem 1.25rem;">Estado</th>
                                <th style="font-size: .68rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #9aa0b4; border-bottom: none; padding: .9rem 1.25rem;">Sectores</th>
                                <th class="text-end" style="font-size: .68rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #9aa0b4; border-bottom: none; padding: .9rem 1.25rem;">Acciones</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

    <!-- Modal Crear Municipio -->
    <div class="modal fade" id="modalMunicipio" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 460px;">
            <div class="modal-content" style="border: none; border-radius: 20px; overflow: hidden;">
                <div class="d-flex align-items-center justify-content-between px-4 py-3" style="border-bottom: 1px solid #f1f5f9;">
                    <div class="d-flex align-items-center gap-3">
                        <div class="rounded-3 d-flex align-items-center justify-content-center"
                            style="width: 40px; height: 40px; background: linear-gradient(135deg,#0b1184,#060a52);">
                            <i class="bi bi-map-fill text-white"></i>
                        </div>
                        <div>
                            <h6 class="modal-title fw-bold mb-0" style="font-size: .95rem;">Nuevo Municipio</h6>
                            <p class="text-muted mb-0" style="font-size: .75rem;">Complete los datos del municipio</p>
                        </div>
                    </div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="px-4 py-4">
                    <div class="mb-3">
                        <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Nombre *</label>
                        <input id="txtNombre" class="form-control" placeholder="Ej: Monguí, Duitama..." />
                    </div>

                    <div class="mb-3">
                        <label class="form-label" style="font-size: .7rem; font-weight: 700; text-transform: uppercase; letter-spacing: .05em; color: #94a3b8;">Estado *</label>
                        <select id="ddlEstado" class="w-full bg-white border border-slate-200 pl-4 pr-10 py-2.5 rounded-xl text-sm text-slate-700 appearance-none focus:outline-none focus:border-blue-600 focus:ring-4 focus:ring-blue-600/10 transition-all cursor-pointer">
                            <option value="1">Activo</option>
                            <option value="0">Inactivo</option>
                        </select>
                    </div>
                </div>
                <div class="d-flex justify-content-end gap-2 px-4 py-3" style="background: #f8fafc; border-top: 1px solid #f1f5f9;">
                    <button type="button" class="btn btn-sm fw-semibold text-muted" data-bs-dismiss="modal"
                        style="background: #f1f5f9; border: none; border-radius: 10px; padding: 8px 18px;">
                        Cancelar</button>
                    <button id="btnGuardar" class="btn btn-sm fw-semibold text-white px-4" style="background: #0b1184; border-color: #0b1184; border-radius: .75rem; font-weight: 600;"></button>
                </div>
            </div>
        </div>
    </div>


    <script src="../Assets/js/Municipio.js?V=1.1"></script>
</asp:Content>
