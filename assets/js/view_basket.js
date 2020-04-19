function view_basket() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", 'http://magaz/engine/api/good/view_basket.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            delete_fields();
            let result = JSON.parse(xhr.responseText);
            if(result===null){
                request_to_aut2();
            }
            else if (result.length===0){
                no_basket_script();
            }
            else {
                view_basket_script(result);
                add_filed_buy();
            }
        }
    }
}

function view_basket_script(result) {
    document.querySelector(".basket-content").insertAdjacentHTML("beforeend","<div class='basket-title'>Корзина</div>");
    document.querySelector(".basket-content").insertAdjacentHTML("beforeend","<div class='basket-goods'></div>");
    document.querySelector(".basket-content").insertAdjacentHTML("beforeend","<div class='basket-total'></div>");
    for (let i = 0; i < result.length; i++) {
        document.querySelector(".basket-goods").insertAdjacentHTML("beforeend","<div class='basket-goods-x' id='"+result[i]['id']+"'><div class='basket-goods-button-close'><button class='basket-goods-button-close-butt' onclick='delete_basket("+result[i]['id']+")'><img src='../assets/img/close.png' class='basket-goods-button-img'></button></div><div class='basket-goods-x-photo-count'><div class='basket-goods-x-photo-block'><img src='"+result[i]['img']+"' class='basket-goods-x-photo-img'></div><div class='basket-goods-x-count-block'><button class='basket-goods-x-count-button' onclick='minus("+result[i]['id']+")'>-</button><div class='basket-goods-x-count-field'>"+result[i]['count']+"</div><button class='basket-goods-x-count-button' onclick='plus("+result[i]['id']+")'>+</button></div></div><div class='basket-goods-x-description'><div class='basket-goods-x-description-name'>"+result[i]['name']+"</div><div class='basket-goods-x-price-block'><div class='basket-goods-x-price-one'><div class='basket-goods-x-price-one-text'>Цена за один товар:</div><div class='basket-goods-x-price-one-price'>"+result[i]['price']+"р</div></div><div class='basket-goods-x-price-few'><div class='basket-goods-x-price-few-text'>Сумма:</div><div class='basket-goods-x-price-few-price'>"+result[i]['summ']+"р</div></div></div></div></div>");
    }
}


function no_basket_script() {
    document.querySelector(".basket-content").insertAdjacentHTML("beforeend","<div class='basket-title'>Корзина</div>");
    document.querySelector(".basket-content").insertAdjacentHTML("beforeend","<div class='basket-favorites-no-goods'>Нет добавленных товаров в корзину</div>");
}


function request_to_aut2() {
    document.querySelector(".basket-content").insertAdjacentHTML("beforeend","<div class='basket-title'>Корзина</div>");
    document.querySelector(".basket-content").insertAdjacentHTML("beforeend","<div class='basket-favorites-please-aut'><div class='basket-favorites-please-aut-a'>Корзина не доступна, пожалуйста <a href='/account'>авторизируйтесь.</a></div></div>");
}

function delete_fields() {
    let out_field = document.querySelector(".basket-content");
    while (out_field.lastChild){
        out_field.removeChild(out_field.firstChild);
    }
}
function add_filed_buy() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", 'http://magaz/engine/api/good/get_order.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            if (xhr.responseText===null){

            }
            else
            {
                let result = JSON.parse(xhr.responseText);
                document.querySelector(".basket-total").insertAdjacentHTML("beforeend","<div class='basket-total-title'>Сумма заказа</div><div class='basket-total-main-wrap'><div class='basket-total-main'><div class='basket-total-main-line'><div class='basket-total-main-line-text1'>Товаров на сумму:</div><div class='basket-total-main-line-price'>"+result['total']+"р</div></div><div class='basket-total-main-line'><div class='basket-total-main-line-text2'>Доставка:</div><div class='basket-total-main-line-price'>50р</div></div><div class='basket-total-main-line'><div class='basket-total-main-line-text3'>Итого:</div><div class='basket-total-main-line-price'>"+result['total_dil']+"р</div></div></div></div><div class='basket-total-button-block'><button class='basket-total-button' onclick='accept_basket()'>Оформить заказ</button></div>")
            }
        }
    }
}