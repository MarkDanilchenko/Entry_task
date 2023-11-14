const dataTableGrades = document.getElementById('dataTableGrades');
if (dataTableGrades) {
	const th = dataTableGrades.querySelectorAll('th');
	let tbody = dataTableGrades.querySelector('tbody');
	let rows = [...tbody.rows];

	th.forEach((element) => {
		element.addEventListener('click', () => {
			console.log(element.cellIndex);
			let columnIndex = element.cellIndex;
			if (columnIndex == 1) {
				let sortDirection = element.getAttribute('data-sort-direction') === 'asc' ? 'desc' : 'asc';
				element.setAttribute('data-sort-direction', sortDirection);
				rows.sort((a, b) => {
					let aText = a.cells[columnIndex].textContent;
					let bText = b.cells[columnIndex].textContent;
					if (sortDirection === 'asc') {
						return aText === bText ? 0 : aText > bText ? 1 : -1;
					} else {
						return aText === bText ? 0 : aText < bText ? 1 : -1;
					}
				});
				tbody.append(...rows);
			} else {
				return;
			}
		});
	});
}
