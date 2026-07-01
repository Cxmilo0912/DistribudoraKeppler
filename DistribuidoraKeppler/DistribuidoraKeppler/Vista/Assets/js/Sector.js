//sector
$(document).ready(function () {
    var tableSectores = $('#tablaSectores').DataTable({
        searching: true,
        paging: true,
        responsive: true,
        layout: {
            topEnd: [
                {
                    buttons: [
                        { extend: 'copyHtml5', text: '<i class="bi bi-clipboard"></i> Copiar', exportOptions: { columns: [0, 1, 2, 3, 4, 5] } },
                        { extend: 'csvHtml5', text: '<i class="bi bi-filetype-csv"></i> CSV', exportOptions: { columns: [0, 1, 2, 3, 4, 5] } },
                        { extend: 'excelHtml5', text: '<i class="bi bi-file-earmark-excel"></i> Excel', exportOptions: { columns: [0, 1, 2, 3, 4, 5] } },
                        { extend: 'pdfHtml5', text: '<i class="bi bi-file-earmark-pdf"></i> PDF', orientation: 'landscape', pageSize: 'LEGAL', exportOptions: { columns: [0, 1, 2, 3, 4, 5] } },
                        { extend: 'print', text: '<i class="bi bi-printer"></i> Imprimir', exportOptions: { columns: [0, 1, 2, 3, 4, 5] } }
                    ]
                },
                'search'
            ]
        },
        "ajax": {
            "url": "Sectores.aspx/MtListarSectores",
            "type": "POST",
            "contentType": "application/json; charset=utf-8",
            "data": function (d) {
                return JSON.stringify({});
            },
            "dataSrc": function (json) {
                return json.d.data;
            }
        },
        "columns": [
            { "data": "Id" },
            {
                "data": "Nombre",
                "render": function (data) {
                    return `<span class="fw-semibold text-dark">${data}</span>`;
                }
            },
            {
                "data": "DiasVisita",
                "render": function (data) {
                    return `
            <div class="d-inline-flex align-items-center gap-1.5 px-2 py-1 rounded bg-light border text-secondary" style="font-size: .82rem; font-weight: 500;">
                <i class="bi bi-calendar-event text-primary"></i>
                <span>${data}</span>
            </div>`;
                }
            },
            {
                "data": "CapacidadMaxima",
                "render": function (data) {
                    return `<span class="badge bg-light text-dark border px-2.5 py-1.5 font-monospace fs-6 fw-medium" style="border-radius: .4rem;">${data}</span>`;
                }
            },
            {
                "data": "Estado",
                "render": function (data) {
                    if (data === 1 || data === true || data === "1") {
                        return '<span class="badge bg-success-subtle text-success border border-success/20 rounded-pill px-3 py-2 fw-semibold" style="font-size: 0.75rem;">Activo</span>';
                    } else {
                        return '<span class="badge bg-danger-subtle text-danger border border-danger/20 rounded-pill px-3 py-2 fw-semibold" style="font-size: 0.75rem;">Inactivo</span>';
                    }
                }
            },
            {
                "data": "Municipio.Nombre",
                "defaultContent": `<span class="text-muted small"><i>Sin asignar</i></span>`,
                "render": function (data) {
                    if (!data) return `<span class="text-muted small"><i>Sin asignar</i></span>`;
                    return `
            <div class="d-inline-flex align-items-center gap-1.5 px-2.5 py-1.5 rounded-3 fw-medium" 
                 style="background: #f8fafc; color: #475569; font-size: .82rem; border: 1px solid #e2e8f0;">
                <i class="bi bi-geo-alt-fill text-slate-400" style="color: #94a3b8;"></i>
                <span>${data}</span>
            </div>`;
                }
            },
            {
                "data": null,
                "className": "text-end",
                "render": function (data, type, row) {
                    return `
                <div class="text-center">
                    <button type="button" class="btn btn-outline-info btn-sm btn-editar">
                        <i class="bi bi-pencil"></i> Editar 
                    </button>
                </div>`;
                }
            }
        ],
    });
    function limpiarFormulario() {
        $('#modalEditarSector input').val(''); //limipia todo
        $('#ddlEstado').val("1");
    }
    $(document).on('click', '.btn-editar', function (e) {
        e.preventDefault();


        var row = $(this).closest('tr');

        if (row.hasClass('child')) {
            row = row.prev();
        }

        var data = $('#tablaSectores').DataTable().row(row).data();
        console.log("Datos del Sector de la fila:", data); // Revisa esto en F12

        if (data != null) {
            $('#txtEditIdSector').val(data.Id);
            $('#txtEditNombreSector').val(data.Nombre);
            $('#txtEditDiasVisita').val(data.DiasVisita);
            $('#txtEditCapacidad').val(data.CapacidadMaxima);
            $("select[id$='ddlEditMunicipio'] option:contains('" + data.Municipio.Nombre + "')").prop('selected', true);
            $('#ddlEditEstado').val(data.Estado);

            new bootstrap.Modal(document.getElementById('modalEditarSector')).show();
        } else {
            Swal.fire('Error', 'No se pudieron capturar los datos de la fila.', 'error');
        }

    });

    $('#btnGuardarEdit').click(function (e) {
        e.preventDefault();

        console.log("click disparado");  // ← agrega esto
        console.log("Id:", $('#txtEditIdSector').val());
        var sector = {
            Id: parseInt($('#txtEditIdSector').val()) || 0,
            Nombre: $('#txtEditNombreSector').val().trim(),
            DiasVisita: $('#txtEditDiasVisita').val().trim(),
            CapacidadMaxima: parseInt($('#txtEditCapacidad').val()) || 0,
            Municipio: {
                Id: parseInt($("select[id$='ddlEditMunicipio']").val()) || 0
            },
            Estado: parseInt($('#ddlEditEstado').val()) || 0
        }

        if (sector.Nombre === "") {
            Swal.fire('Error', 'El sector necesita un nombre', 'error');
            return;
        }

        $.ajax({
            type: "POST",
            url: "Sectores.aspx/MtEditarSector",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({ oSector: sector }),
            dataType: "json",
            success: function (respuesta) {
                if (respuesta.d) {
                    Swal.fire('¡Realizado!', 'La accion se modifico con exito', 'success');
                    var modalElement = document.getElementById('modalEditarSector');
                    var myModal = bootstrap.Modal.getInstance(modalElement);
                    if (myModal) myModal.hide();
                    limpiarFormulario();
                    $('#tablaSectores').DataTable().ajax.reload();
                }
            },
            error: function (xhr) {
                console.error("Status: " + status);
                console.error("Error completo del backend:", xhr.responseText);
                console.error("Error en ajax: " + xhr.responseText);
            }
        })
    })

});