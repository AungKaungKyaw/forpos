

const input1 = document.getElementById('inputItemCode');
const input2 = document.getElementById('itemQty');
const username = document.getElementById('user');
username.innerText = localStorage.getItem('username');
/*input1.addEventListener('submit',function (event){
    event.preventDefault();
    let inputVal = document.getElementById('inputItemCode').value();
    console.log(inputVal);
})*/

// item code enter နှိပ်လိုက်ရင် qty 1 ထားပြီး list ထဲထည့်မယ်
// qty ကိုထည့်ပြီး enter pressရင် item code ကိုကြည့်မယ်။ itemcode ရှိရင် list ထဲထည့်
//      item code မရှိရင် itemcode ထည့်ခိုင်း
var count = 1;
input1.addEventListener('keyup', function(e){
    if(e.keyCode ===13){
        console.log("inside itemcod");
        let itemCode = input1.value;

        // let itemCode = input1.value();
        reqData(itemCode, function (res){
            let res1 = JSON.parse(res);
            console.log(res1);
            displayData(res1,1);
        })
        clearValue();
    }
})
input2.addEventListener('keyup', function(e){
    if(e.keyCode ===13){
        // console.log("inside qty");
        let itemCode = input1.value;
        let qty = input2.value;
        console.log("input2 vale : " + qty);
        if(itemCode === '' || itemCode == null){
            document.getElementById('itemCodeSpan').innerText = "enter item code";
            return;
        }
        if(itemCode != '' && qty != ''){
            reqData(itemCode, function (res){
                let res1 = JSON.parse(res);
                console.log(res1);
                displayData(res1,qty);
            })
        }
        clearValue();
    }
})

function reqData(itemCode, callback){
    const xhr = new XMLHttpRequest();
    const url = 'http://localhost/project2/control/reqdata.php';
    xhr.open('POST',url);
    xhr.onreadystatechange = function (){
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // console.log("xhr.responseText");
                // console.log(xhr.responseText);
                callback(xhr.responseText);
            } else {
                console.error("request fail: " + xhr.status);
                callback(null, "request fail : " + xhr.status)
            }
        }
    }
    let jsonData = JSON.stringify({
        itemCode: itemCode
    })
    // console.log(jsonData);
    xhr.send(jsonData);
}
function displayData(data){
        let listItems = document.querySelectorAll('.tableRow');
        console.log("argument1///////////////////////////");
        console.log(arguments[1]);
        // listItems row တွေရှိမရှိအရင်စစ်တယ် ဘာလို့လဲဆိုတော့ same item ကိုနှစ်ခါချမိမှာစိုးလို့
        // listItems ထဲမှာ row တစ်ခုရှိနေရင် row ရဲ့ product code တူနေရင် နှစ်ခါမချမိအောင်
        if(listItems.length === 0){
            console.log("listItems is null");
            let tr = document.createElement('tr');
            tr.className = "tableRow";
            let tdCount = document.createElement('td');
            tdCount.innerText = count;
            tr.appendChild(tdCount);

            let tdProductCode = document.createElement('td');
            tdProductCode.innerText = data['ProductCode'];
            tr.appendChild(tdProductCode);

            let tdProductName = document.createElement('td');
            tdProductName.innerText = data['ProductName'];
            tr.appendChild(tdProductName);

            let tdProductQty = document.createElement('td');
            tdProductQty.id = 'itemQtyEdit' + count;
            tdProductQty.className = 'pointerCursor';
            tdProductQty.innerText = arguments[1];
            tr.appendChild(tdProductQty);
            console.log("tdProductQty");
            console.log(tdProductQty);

            let tdProductPrice = document.createElement('td');
            tdProductPrice.className = 'price';
            tdProductPrice.innerText = data['ProductPrice'] * arguments[1];
            tr.appendChild(tdProductPrice);

            //delete
            let tdDelete = document.createElement('td');
            tdDelete.className = 'deleteTable';
            tdDelete.innerText = 'Delete';
            tr.appendChild(tdDelete);

            count++;
            document.getElementById("tableBody").appendChild(tr);
        }else{
            console.log(listItems[0]);
            let secondCellValue = [];
            let rows = document.querySelectorAll('.tableRow');
            rows.forEach(function(row){
                let cells = row.querySelectorAll('td');
                secondCellValue.push(cells[1].innerText);
            })
            console.log(secondCellValue);

            if(!secondCellValue.includes(data['ProductCode'])){
                console.log("inside check point productCode : ");
                let tr = document.createElement('tr');
                tr.className = "tableRow";
                let tdCount = document.createElement('td');
                tdCount.innerText = count;
                tr.appendChild(tdCount);

                let tdProductCode = document.createElement('td');
                tdProductCode.innerText = data['ProductCode'];
                tr.appendChild(tdProductCode);

                let tdProductName = document.createElement('td');
                tdProductName.innerText = data['ProductName'];
                tr.appendChild(tdProductName);

                let tdProductQty = document.createElement('td');
                tdProductQty.id = 'itemQtyEdit' + count;
                tdProductQty.className = 'pointerCursor';
                tdProductQty.innerText = arguments[1];
                tr.appendChild(tdProductQty);
                console.log("tdProductQty");
                console.log(tdProductQty);

                let tdProductPrice = document.createElement('td');
                tdProductPrice.className = 'price';
                tdProductPrice.innerText = data['ProductPrice'] * arguments[1];
                tr.appendChild(tdProductPrice);

                //delete
                let tdDelete = document.createElement('td');
                tdDelete.className = 'deleteTable';
                tdDelete.innerText = 'Delete';
                tr.appendChild(tdDelete);

                count++;
                document.getElementById("tableBody").appendChild(tr);
            }
            else{
                console.log("do nothing");
            }

        }

}

function clearValue(){
    input1.value = '';
    input2.value = '';
}

/**
 * for edit and delete
 * */

// Event delegation for dynamically created elements
document.addEventListener('click', function(event) {
    let cells = document.querySelectorAll('.tableRow td');
// Output the attribute value of the fourth td element
    console.log("the attribute is ");
    console.log(cells[3].getAttribute('id'));

    cells.forEach(function(rows){
        // Check if the class attribute of the td element is 'pointerCursr'
        if(rows.getAttribute('class')=='pointerCursor'){
            // Add a click event listener to the td element
            rows.addEventListener('click',function(){
                let oldValue = rows.innerText;
                let input = document.createElement('input');
                input.type = 'text';
                input.value = oldValue;

                input.addEventListener('keyup',function (event){
                    // Check if the Enter key was pressed (key code 13)
                    if(event.keyCode === 13){
                        this.blur();
                    }
                });

                // Add blur event listener to the input
                input.addEventListener('blur',function(){
                    let newValue = this.value;
                    // Replace the content of the parent td element with the new value
                    this.parentNode.innerText = newValue;
                    let priceCell = rows.parentNode.querySelector('.price');
                    let oldTotalprice = priceCell.innerText;
                    let totalPrice = (oldTotalprice/oldValue) * newValue;
                    priceCell.innerText = totalPrice;
                    console.log("row : " + totalPrice);
                });

                this.innerText = '';
                this.appendChild(input);
                input.focus();
                // Output the text content of the clicked td element to the result element
                // document.getElementById('result').innerText = rows.innerText;
            });

        }
        else if(rows.getAttribute('class')=='deleteTable') {
            console.log("delet ehere");
            rows.addEventListener('click',function(){
                let rowToDelete = rows.closest('tr');
                console.log("row to delete : "+rowToDelete);
                console.log("rowToDelete.parentNode : "+rowToDelete.parentNode);
                rowToDelete.closest("tbody").removeChild(rowToDelete);
                /**
                 * the under is alternative ↓
                 * rowToDelete.parentNode.removeChild(rowToDelete);
                 * */
                console.log("something");
            })
        }
    });
});
var submit = document.getElementById('something');
submit.addEventListener('click',() =>{
    const tableRows = document.querySelectorAll('#tableBody .tableRow');
    let jsonData = [];
    tableRows.forEach(function(row){
        const columns = row.querySelectorAll('td');
        const rowData = {
            number : columns[0].innerText,
            itemCode : columns[1].innerText,
            itemName : columns[2].innerText,
            qty : columns[3].innerText,
            totalPrice : columns[4].innerText
        };
        jsonData.push(rowData);
        console.log(jsonData);
    })

    console.log(jsonData);
    if(jsonData.length > 0){
        localStorage.setItem('jsonData', JSON.stringify(jsonData));
        window.location.href = "http://localhost/project2/saleInvoice.html";
    }
})



// Select all td elements within elements having class 'tableRow'

