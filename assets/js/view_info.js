function view_info() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", 'http://magaz/engine/api/user/view_info.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            let result = JSON.parse(xhr.responseText);
            view_info_script(result[0]);
            view_info_addButton();
        }
    }
}

function view_info_script(result) {

   for (let key in result){
       if(result[key]===null){
           result[key] = "Нет данных";
       }
       document.getElementById(key).querySelector('.user-content-info-row-some').innerText = result[key];
   }


}

function view_info_addButton(){
    let divs = document.querySelectorAll('.user-content-info-row');
    for (let i = 0; i < divs.length; i++) {
        if (!divs[i].querySelector('.user-content-info-butt-change')){
            divs[i].insertAdjacentHTML('beforeend',"<button class='user-content-info-butt-change' onclick='view_info_addButtonNext(this)'>Изменить</button>");
        }
    }

}

function view_info_addButtonNext(a) {
    let parent = a.parentNode;
    parent.querySelector('.user-content-info-butt-change').remove();
    // console.log(nado);
    // let field = document.getElementById(keys);
    // console.log(field);
    // field.querySelector('.user-content-info-butt-change').remove();
     parent.insertAdjacentHTML("beforeend","<input placeholder='Введите новое значение' class='user-content-info-butt-input'><button onclick='view_info_confirm(this.parentNode.id)' class='user-content-info-butt-confirm user-content-info-butt-change'>Подтвердить</button><button onclick='back(this.parentNode.id)' class='user-content-info-butt-back user-content-info-butt-change'>Отмена</button>");

}
function view_info_confirm(id) {
    let xhr = new XMLHttpRequest();
    let json = JSON.stringify({
        field: id,
        value: document.getElementById(id).querySelector('.user-content-info-butt-input').value
    });
    xhr.open("POST", 'http://magaz/engine/api/user/change_info.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send(json);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            let result = JSON.parse(xhr.responseText);
            back(id);
            view_info();
            modal_windowUser(result);
        }
    }
}
function back(id) {
    let div = document.getElementById(id);
    div.querySelector('.user-content-info-butt-confirm').remove();
    div.querySelector('.user-content-info-butt-back').remove();
    div.querySelector('.user-content-info-butt-input').remove();
    view_info_addButton();
}
function modal_windowUser(result) {
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