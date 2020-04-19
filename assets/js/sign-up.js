function sign_up(form) {
    var xhr = new XMLHttpRequest();
    var json = JSON.stringify({
        login: form.login.value,
        mail: form.mail.value,
        password: form.password.value,
    });

    xhr.open("POST", 'http://magaz/engine/api/user/registration.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send(json);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            let result = JSON.parse(xhr.responseText);
                modal_windowSignUp(result);
        }
    };
}
function modal_windowSignUp(result) {
    document.body.insertAdjacentHTML("beforeend", "<div class='black-screen'></div>");
    document.body.insertAdjacentHTML("beforeend", "<div class='modal'><div class='modal-content'></div></div>");
    let black_screen = document.querySelector('.black-screen');
    let modal_content = document.querySelector('.modal-content');
    let modal = document.querySelector('.modal');
    modal.insertAdjacentHTML('afterbegin',"<button class='modal-close' onclick='closeModal()'>X</button>");
    for (let i = 0; i < result.length; i++) {
        modal_content.insertAdjacentHTML("beforeend", "<div class='modal-mb'>" + result[i] + "</div>");
    }
    if (result['good']){
        modal_content.insertAdjacentHTML("beforeend", "<div class='modal-mb'>" + result['good'] + "</div><div><a href='/account' class='modal-a'>авторизирузоваться</a></div>");
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