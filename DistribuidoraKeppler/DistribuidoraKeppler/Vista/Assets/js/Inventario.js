document.addEventListener('DOMContentLoaded', function () {
    const inputBuscar = document.querySelector('input[placeholder="Buscar por nombre, Codigo..."]');
    const selects = document.querySelectorAll('.bg-white.p-5 select');
    const selectCategoria = selects[0];
    const selectMarca = selects[1];
    const chkStockBajo = document.querySelector('input.sr-only[type="checkbox"]');
    const grid = document.querySelector('.grid.gap-5');

    function obtenerCards() {
        return grid ? Array.from(grid.querySelectorAll(':scope > div')) : [];
    }

    function poblarFiltros() {
        const cards = obtenerCards();
        const categorias = new Set();
        const marcas = new Set();

        cards.forEach(card => {
            const cat = card.querySelector('span.absolute')?.textContent.trim();
            const marca = card.querySelector('p.text-xs.font-medium')?.textContent.trim();
            if (cat) categorias.add(cat);
            if (marca) marcas.add(marca);
        });

        selectCategoria.innerHTML = '<option>Todas las Categorías</option>';
        selectMarca.innerHTML = '<option>Todas las Marcas</option>';

        categorias.forEach(c => selectCategoria.add(new Option(c, c)));
        marcas.forEach(m => selectMarca.add(new Option(m, m)));
    }

    function filtrar() {
        const texto = inputBuscar.value.toLowerCase().trim();
        const catSelec = selectCategoria.value;
        const marcaSelec = selectMarca.value;
        const soloStockBajo = chkStockBajo.checked;

        obtenerCards().forEach(card => {
            const nombre = card.querySelector('h4')?.textContent.toLowerCase() || '';
            const sku = card.querySelector('p.font-mono')?.textContent.toLowerCase() || '';
            const categoria = card.querySelector('span.absolute')?.textContent.trim() || '';
            const marca = card.querySelector('p.text-xs.font-medium')?.textContent.trim() || '';
            const stock = parseInt(card.querySelector('p.text-sm.font-bold')?.textContent) || 0;

            const okTexto = !texto || nombre.includes(texto) || sku.includes(texto);
            const okCategoria = catSelec === 'Todas las Categorías' || categoria === catSelec;
            const okMarca = marcaSelec === 'Todas las Marcas' || marca === marcaSelec;
            const okStock = !soloStockBajo || stock < 20;

            card.style.display = (okTexto && okCategoria && okMarca && okStock) ? '' : 'none';
        });
    }

    poblarFiltros();

    inputBuscar.addEventListener('input', filtrar);
    selectCategoria.addEventListener('change', filtrar);
    selectMarca.addEventListener('change', filtrar);
    chkStockBajo.addEventListener('change', filtrar);
});