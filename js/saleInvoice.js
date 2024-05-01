let jsonData = localStorage.getItem('jsonData');
jsonData = JSON.parse(jsonData);
console.log(jsonData);
var totalNumber = 0;
jsonData.forEach(function(rows){
    let tableRow = document.querySelector('.tableRow');
    let td = document.createElement('tr');
    td.innerHTML = `
        <td>${rows['number']}</td>
        <td>${rows['itemCode']}</td>
        <td>${rows['itemName']}</td>
        <td>${rows['qty']}</td>
        <td>${rows['totalPrice']}</td>
    `
    tableRow.appendChild(td);
    totalNumber = totalNumber + Number(rows['totalPrice']);
    console.log(totalNumber);
})
const total = document.getElementById('total');
total.innerText = totalNumber;

