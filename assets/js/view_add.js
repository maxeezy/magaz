function view_add() {
    let count = document.getElementsByClassName('goods-item-x').length;

    let xhr = new XMLHttpRequest();
    var json = JSON.stringify(
        {
            count: count
        }
    );
    xhr.open("POST", 'http://magaz/engine/api/good/view_add.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send(json);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            let result = JSON.parse(xhr.responseText);
            console.log(result);
            if (result != null) {
                for (let i = 0; i < result.length; i++) {
                    document.querySelector('.goods-item-xs').insertAdjacentHTML("beforeend", "<div class='goods-item-x'><a href='http://magaz/good/" + result[i]['id'] + "'><div class='goods-item-x-wrap'><div class='goods-item-x-content'><div class='goods-item-x-img'><img src='" + result[i]['img'] + "'  class='img-goods'></div><div class='goods-x-describe'><div class='goods-x-describe-title'>" + result[i]['name'] + "</div><div class='goods-x-describe-price'>" + result[i]['price'] + "  ₽</div></div></div></div></a></div>");
                }
                console.log(count);
            }
            else {
                document.querySelector('.goods-button-all').remove();
            }
        }
    }
}