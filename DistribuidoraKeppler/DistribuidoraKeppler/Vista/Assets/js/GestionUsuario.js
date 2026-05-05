
$(document).ready(function () {
    var table = $('#example').DataTable({
        searching: true,
        paging: true,
        info: false,
        dom: 'tp',
        columnDefs: [
            {
                targets: 2,
                render: function (data, type, row) {
                    // LOG CRÍTICO — muestra qué recibe DataTables de esa celda
                    if (type === 'filter') {
                        var texto = $('<div>').html(data).text().trim();
                        console.log("CELDA ROL → raw:", JSON.stringify(data), "| limpio:", JSON.stringify(texto));
                        return texto;
                    }
                    return data;
                }
            }
        ],
        language: {
            paginate: { previous: "Anterior", next: "Siguiente" }
        },
        drawCallback: function () {
            $('.dataTables_paginate').addClass('flex justify-end mt-4');
        }
    });

    $('input[placeholder="Buscar por nombre, correo o rol..."]').on('input keyup', function () {
        table.search($(this).val()).draw();
    });

    $(document).on('click', '[data-purpose="role-filters"] button', function () {
        $('[data-purpose="role-filters"] button')
            .removeClass('bg-slate-900 text-white')
            .addClass('bg-white border border-gray-200 text-gray-600');
        $(this)
            .removeClass('bg-white border border-gray-200 text-gray-600')
            .addClass('bg-slate-900 text-white');

        var rol = $(this).attr('data-role') || "";
        console.log("Filtrando por:", rol);

        // ← Obtiene la instancia directamente, sin variable global
        var dt = $('#example').DataTable();

        if (rol === "") {
            dt.column(2).search('').draw();
        } else {
            dt.column(2).search(rol.trim(), true, false).draw();
            // true = regex, false = no smart search
            // buscamos el texto con posibles espacios alrededor
        }
    });
});