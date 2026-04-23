console.log("INIT DATATABLE");
$(document).ready(function () {
    var table = $('#example').DataTable({
        searching: true,
        paging: true,
        info: false,
        dom: 'tp',
        language: {
            url: '//cdn.datatables.net/plug-ins/2.0.0/i18n/es-ES.json'
        }
    });

    // Barra de búsqueda del header
    $('input[placeholder="Buscar por nombre, correo o rol..."]').on('input keyup', function () {
        table.search($(this).val()).draw();
    });

    // Botones de filtro por rol
    $(document).on('click', '[data-purpose="role-filters"] button', function () {
        $('[data-purpose="role-filters"] button')
            .removeClass('bg-slate-900 text-white')
            .addClass('bg-white border border-gray-200 text-gray-600');
        $(this)
            .removeClass('bg-white border border-gray-200 text-gray-600')
            .addClass('bg-slate-900 text-white');

        var rol = $(this).data('role');

        if (rol === "") {
            table.search('')
            table.column(2).search('').draw();
        } else {
            // exact match, case insensitive
            table.search('')
            table.column(2).search('^' + rol + '$', true, false).draw();
        }
    });
});