function favorites_to_basket(id){
    var xhr = new XMLHttpRequest();
    var json = JSON.stringify({
        id: id
    });
    xhr.open("POST", 'http://magaz/engine/api/good/favorite_to_basket.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send(json);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            let result = JSON.parse(xhr.responseText);
            if (result.length===0){

            }
            else {
                modal_windowToBasket(result);
            }
        }
    };
}
function modal_windowToBasket(result) {
    document.body.insertAdjacentHTML("beforeend", "<div class='black-screen'></div>");
    document.body.insertAdjacentHTML("beforeend", "<div class='modal'><div class='modal-content'></div></div>");
    let black_screen = document.querySelector('.black-screen');
    let modal_content = document.querySelector('.modal-content');
    let modal = document.querySelector('.modal');
    modal.insertAdjacentHTML('afterbegin',"<button class='modal-close' onclick='closeModal()'>X</button>");
    modal_content.insertAdjacentHTML("beforeend", "<div class='modal_ok'>" + result + "</div>");

}


function closeModal() {
    let modal = document.querySelector('.modal');
    let black_screen = document.querySelector('.black-screen');
    if (modal&&black_screen){
        modal.remove();
        black_screen.remove();
    }
}