function sign_in(form) {
    var xhr = new XMLHttpRequest();
    var json = JSON.stringify({
        login: form.login.value,
        password: form.password.value
    });
    xhr.open("POST", 'http://magaz/engine/api/user/authorization.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send(json);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            let result = JSON.parse(xhr.responseText);
            if (result.length===0){
                document.location.href = "http://magaz/user";
            }
            else {
                modal_windowSignIn(result);
            }

        }
    };
}
function modal_windowSignIn(result) {
    document.body.insertAdjacentHTML("beforeend", "<div class='black-screen'></div>");
    document.body.insertAdjacentHTML("beforeend", "<div class='modal'><div class='modal-content'></div></div>");
    let black_screen = document.querySelector('.black-screen');
    let modal_content = document.querySelector('.modal-content');
    let modal = document.querySelector('.modal');
    modal.insertAdjacentHTML('afterbegin',"<button class='modal-close' onclick='closeModal()'>X</button>");
    for (let i = 0; i < result.length; i++) {
        modal_content.insertAdjacentHTML("beforeend", "<div class='modal-mb'>" + result[i] + "</div>");
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