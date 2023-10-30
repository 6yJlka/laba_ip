// Обновленный JavaScript-код в файле app.js
const addItemButton = document.getElementById('add-item');
const itemNameInput = document.getElementById('item-name');
const itemPriceInput = document.getElementById('item-price');
const orderTable = document.getElementById('order-table');
const totalPriceSpan = document.getElementById('total-price');

// Объект для хранения товаров и их стоимости
const products = {};

addItemButton.addEventListener('click', () => {
    const itemName = itemNameInput.value;
    const itemPrice = parseFloat(itemPriceInput.value);

    // Проверяем, что введенное наименование товара не содержит специальных символов и не является пробелом
    const specialChars = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
    if (itemName.trim() !== "" && !specialChars.test(itemName) && !isNaN(itemPrice) && itemPrice >= 0) {
        if (products[itemName]) {
            // Если товар с таким наименованием уже существует, обновляем стоимость
            products[itemName] += itemPrice;
            // Находим соответствующую строку и обновляем стоимость
            const rows = orderTable.querySelectorAll('tr');
            for (const row of rows) {
                const cells = row.querySelectorAll('td');
                if (cells[0].textContent === itemName) {
                    cells[1].textContent = products[itemName].toFixed(2);
                    break;
                }
            }
        } else {
            // Если товара с таким наименованием нет, добавляем новую строку
            products[itemName] = itemPrice;
            const newRow = document.createElement('tr');
            newRow.innerHTML = `
                <td>${itemName}</td>
                <td>${itemPrice.toFixed(2)}</td>
                <td><button class="remove-item">Удалить</button></td>
            `;
            orderTable.appendChild(newRow);
        }

        // Обновляем общую стоимость
        const total = Object.values(products).reduce((acc, val) => acc + val, 0);
        totalPriceSpan.textContent = total.toFixed(2);

        // Очищаем поля ввода
        itemNameInput.value = '';
        itemPriceInput.value = '';

        // Добавляем обработчики событий для кнопок удаления
        const removeButtons = document.querySelectorAll('.remove-item');
        for (const button of removeButtons) {
            button.addEventListener('click', () => {
                const row = button.closest('tr');
                const itemName = row.querySelector('td:first-child').textContent;
                const itemPrice = parseFloat(row.querySelector('td:nth-child(2)').textContent);
                delete products[itemName];
                row.remove();
                // Пересчитываем общую стоимость
                const total = Object.values(products).reduce((acc, val) => acc + val, 0);
                totalPriceSpan.textContent = total.toFixed(2);
            });
        }
    } else {
        alert('Введите корректное наименование и положительную стоимость товара.');
    }
});

// Добавляем обработчик для изменения фона ячеек таблицы при наведении мыши
orderTable.addEventListener('mouseover', (event) => {
    const target = event.target;
    if (target.tagName === 'TD') {
        target.style.backgroundColor = 'lightblue';
    }
});

orderTable.addEventListener('mouseout', (event) => {
    const target = event.target;
    if (target.tagName === 'TD') {
        target.style.backgroundColor = '';
    }
});
