function to_basket() {
    let count = document.getElementById("input");
    check_count(count);
    var link = new URL(location.href);
    var arr = link.href.split('/');
    var xhr = new XMLHttpRequest();
    var json = JSON.stringify({
        id: arr[4],
        count: count.value
    });
    xhr.open("POST", 'http://magaz/engine/api/good/to_basket.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send(json);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            let result = JSON.parse(xhr.responseText);
            modal_windowToBasket(result);
        }
    };
}


function check_count(input) {
    input.value = parseInt(input.value);
    if ((input.value < 1) || (isNaN(input.value))) {
        input.value = 1;
    }

}

function modal_windowToBasket(result) {
    document.body.insertAdjacentHTML("beforeend", "<div class='black-screen'></div>");
    document.body.insertAdjacentHTML("beforeend", "<div class='modal'><div class='modal-content'></div></div>");
    let black_screen = document.querySelector('.black-screen');
    let modal_content = document.querySelector('.modal-content');
    let modal = document.querySelector('.modal');
    modal.insertAdjacentHTML('afterbegin',"<button class='modal-close' onclick='closeModal()'>X</button>");
    if (result['ok']) {
        modal_content.insertAdjacentHTML("beforeend", "<div class='modal_ok'>" + result['ok'] + "</div>");
    } else if (result['already']) {
        modal_content.insertAdjacentHTML("beforeend", "<div class='modal_not_ok'>" + result['already'] + "</div>");
    }
    else if(result['no']){
        modal_content.insertAdjacentHTML("beforeend", "<div class='modal_not_ok'>" + result['no'] + "</div>");
    }
    else if(result['aut']){
        modal_content.insertAdjacentHTML("beforeend", "<div class='modal_not_ok'>" + result['aut'] + "</div><div><a href='/account' class='modal-a'>Авторизируйтесь</a></div>");
    }
}


function closeModal() {
    let modal = document.querySelector('.modal');
    let black_screen = document.querySelector('.black-screen');
    if (modal&&black_screen){
        modal.remove();
        black_screen.remove();
    }
}