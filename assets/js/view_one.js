function view_one() {
    var link = new URL(location.href);
    var arr=link.href.split('/');
    var xhr = new XMLHttpRequest();
    var json = JSON.stringify({
        good_id: arr[4]
    });

    xhr.open("POST", 'http://magaz/engine/api/good/view_one.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send(json);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            let result = JSON.parse(xhr.responseText);
            document.querySelector('.main-good-all-name').innerText = result['name'];
            document.querySelector('.main-good-all-price-cost').innerText = result['price']+"р.";
            document.querySelector('.main-good-all-describe').innerText = result['description'];
            document.querySelector('.main-good-photo-img').src = result['img'];

        }
    };
}