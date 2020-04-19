function view_orders() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", 'http://magaz/engine/api/user/view_orders.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            let result = JSON.parse(xhr.responseText);
            console.log(result);
            if (result.length===0){
                no_orders();
            }
            else{
                view_orders_script(result);
            }
        }
    };
}

function no_orders() {
   document.querySelector('.user-content-orders-all').insertAdjacentHTML("beforeend","<div class='no_orders'>У вас еще нет заказов</div>")
}
function view_orders_script(result) {
    for (let i = 0; i < result.length; i++) {
        if(document.getElementById(result[i]['buy_id'])===null){
            document.querySelector('.user-content-orders-all').insertAdjacentHTML("beforeend","<div class='user-content-order-x' id='"+result[i]['buy_id']+"'><div class='user-content-order-x-wrap'><div class='user-content-order-x-up'><div class='user-content-order-x-up-left'><div class='user-content-order-x-up-left-number'>Заказ №: "+result[i]['buy_id']+"</div><div class='user-content-order-x-up-left-data'>Дата покупки: "+result[i]['date']+"</div></div><div class='user-content-order-x-up-right'><div class='user-content-order-x-up-right-price'>Цена: "+result[i]['cost']+" ₽</div></div></div><div class='user-content-order-x-down'><div class='user-content-order-x-down-left'>Статус: "+result[i]['name']+"</div><div class='user-content-order-x-down-right'><div class='user-content-order-x-down-good-x'><a href='/good/"+result[i]['good_id']+"'><img src='"+result[i]['img']+"'  class='user-content-order-x-down-good-x-img'></a><div class='user-content-order-x-down-good-x-count'>"+result[i]['count']+"шт</div></div></div></div></div></div>")
        }
        else{
            document.getElementById(result[i]['buy_id']).querySelector('.user-content-order-x-down-right').insertAdjacentHTML("beforeend","<div class='user-content-order-x-down-good-x'><a href='/good/"+result[i]['good_id']+"'><img src='"+result[i]['img']+"'  class='user-content-order-x-down-good-x-img'></a><div class='user-content-order-x-down-good-x-count'>"+result[i]['count']+"шт</div></div>");
        }
    }
}