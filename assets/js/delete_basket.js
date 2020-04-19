function delete_basket(id) {
    var xhr = new XMLHttpRequest();
    var json = JSON.stringify({
        id: id
    });
    xhr.open("POST", 'http://magaz/engine/api/good/delete_basket.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send(json);
    view_basket();
}