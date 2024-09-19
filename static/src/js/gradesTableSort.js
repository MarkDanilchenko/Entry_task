const dataTableGrades = document.getElementById('dataTableGrades');
if (dataTableGrades) {
  const th = dataTableGrades.querySelectorAll('th');
  const tbody = dataTableGrades.querySelector('tbody');
  const rows = [...tbody.rows];

  th.forEach((element) => {
    element.addEventListener('click', () => {
      const columnIndex = element.cellIndex;
      if (columnIndex == 1) {
        const sortDirection = element.getAttribute('data-sort-direction') === 'asc' ? 'desc' : 'asc';
        element.setAttribute('data-sort-direction', sortDirection);
        rows.sort((a, b) => {
          const aText = a.cells[columnIndex].textContent;
          const bText = b.cells[columnIndex].textContent;
          if (sortDirection === 'asc') {
            return aText === bText ? 0 : aText > bText ? 1 : -1;
          } else {
            return aText === bText ? 0 : aText < bText ? 1 : -1;
          }
        });
        tbody.append(...rows);
      }
    });
  });
}
