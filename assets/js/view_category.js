function view_category() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", 'http://magaz/engine/api/good/view_category.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            let result = JSON.parse(xhr.responseText);
            for (let i = 0; i < result.length; i++) {
                document.querySelector('.goods-category-content').insertAdjacentHTML("beforeend","<div class='goods-category-x'><a href='/badges-category/"+result[i]['id']+"'><img class='goods-category-x-img' src='"+result[i]['img']+"'></a></div>")
            }
        }
    }
}