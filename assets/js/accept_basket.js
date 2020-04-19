function accept_basket() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", 'http://magaz/engine/api/good/accept_basket.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            let result = JSON.parse(xhr.responseText);
            view_basket();
            modal_windowBasket(result);
            console.log(result);
        }
    }
}

function modal_windowBasket(result) {
    document.body.insertAdjacentHTML("beforeend", "<div class='black-screen'></div>");
    document.body.insertAdjacentHTML("beforeend", "<div class='modal'><div class='modal-content'></div></div>");
    let black_screen = document.querySelector('.black-screen');
    let modal_content = document.querySelector('.modal-content');
    let modal = document.querySelector('.modal');
    modal.insertAdjacentHTML('afterbegin', "<button class='modal-close' onclick='closeModal()'>X</button>");
    for (let i = 0; i < result.length; i++) {
        modal_content.insertAdjacentHTML("beforeend", "<div class='modal-mb'>" + result[i] + "</div>");
    }
}


function closeModal() {
    let modal = document.querySelector('.modal');
    let black_screen = document.querySelector('.black-screen');
    if (modal && black_screen) {
        modal.remove();
        black_screen.remove();
    }
}