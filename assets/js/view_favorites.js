function view_favorites() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", 'http://magaz/engine/api/good/view_favorites.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            delete_fields();
            let result = JSON.parse(xhr.responseText);
            if(result===null){
                request_to_aut();
            }
            else if (result.length===0){
                no_favorites_script();
            }
            else {
                view_favorites_script(result);
            }
        }
    }
}

function view_favorites_script(result) {
    document.querySelector(".basket-content").insertAdjacentHTML("beforeend","<div class='basket-title'>Список желаний</div>");
    document.querySelector(".basket-content").insertAdjacentHTML("beforeend","<div class='basket-goods'></div>");
    document.querySelector(".basket-content").insertAdjacentHTML("beforeend","<div class='basket-total-button-block favorites-button-to_korzine'></div>");
    for (let i = 0; i < result.length; i++) {
        document.querySelector(".basket-goods").insertAdjacentHTML("beforeend","<div class='basket-goods-x'><div class='basket-goods-button-close'><button class='basket-goods-button-close-butt' onclick='delete_favorites("+result[i]['id']+")'><img src='../assets/img/close.png' class='basket-goods-button-img'></button></div><div class='basket-goods-x-photo-count'><div class='basket-goods-x-photo-block'><img src='"+result[i]['img']+"' class='basket-goods-x-photo-img'></div><div class='basket-goods-x-count-block'><button class='basket-goods-x-count-button' onclick='favorites_to_basket("+result[i]['id']+")'>+</button></div></div><div class='basket-goods-x-description'><div class='basket-goods-x-description-name'>"+result[i]['name']+"</div><div class='basket-goods-x-price-block'><div class='basket-goods-x-price-one'><div class='basket-goods-x-price-one-text'>Цена за один товар:</div><div class='basket-goods-x-price-one-price'>"+result[i]['price']+"</div></div></div></div></div>")
    }
    document.querySelector(".basket-total-button-block").insertAdjacentHTML("beforeend","<a href='/basket' class='basket-total-button'>Перейти в корзину</a>");
}


function no_favorites_script() {
    document.querySelector(".basket-content").insertAdjacentHTML("beforeend","<div class='basket-title'>Список желаний</div>");
    document.querySelector(".basket-content").insertAdjacentHTML("beforeend","<div class='basket-favorites-no-goods'>Нет добавленных товаров в избранном</div>");
}


function request_to_aut() {
    document.querySelector(".basket-content").insertAdjacentHTML("beforeend","<div class='basket-title'>Список желаний</div>");
    document.querySelector(".basket-content").insertAdjacentHTML("beforeend","<div class='basket-favorites-please-aut'><div class='basket-favorites-please-aut-a'>Список желаний не доступен, пожалуйста <a href='/account'>авторизируйтесь.</a></div></div>");
}

function delete_fields() {
    let out_field = document.querySelector(".basket-content");
    while (out_field.lastChild){
        out_field.removeChild(out_field.firstChild);
    }
}