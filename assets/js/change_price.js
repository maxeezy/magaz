function plus(id) {
    let good = document.getElementById(id);
    let price = good.querySelector('.basket-goods-x-price-one-price');
    let count = good.querySelector('.basket-goods-x-count-field');
    count.innerText = parseInt(count.textContent) + 1;
    let summ = good.querySelector('.basket-goods-x-price-few-price');
    let total = document.querySelectorAll('.basket-total-main-line-price');
    let new_summ =  parseInt(price.textContent.slice(0,-1)) * parseInt(count.textContent);
    let raznica = new_summ - parseInt(summ.textContent.slice(0,-1));
    summ.innerText = new_summ + "р";
    let new_total = (parseInt(total[0].textContent.slice(0,-1))) + raznica;
    total[0].innerText = new_total + "р";
    total[2].innerText = (new_total + 50) + "р";
    change_count(id,count.textContent);
    console.log(count.textContent);
}
function minus(id) {
    let good = document.getElementById(id);
    let price = good.querySelector('.basket-goods-x-price-one-price');
    let count = good.querySelector('.basket-goods-x-count-field');
    if ((parseInt(count.textContent) - 1)>0){
        count.innerText = parseInt(count.textContent) - 1;
    }
    let summ = good.querySelector('.basket-goods-x-price-few-price');
    let total = document.querySelectorAll('.basket-total-main-line-price');
    let new_summ =  parseInt(price.textContent.slice(0,-1)) * parseInt(count.textContent);
    let raznica =   parseInt(summ.textContent.slice(0,-1))  - new_summ;
    summ.innerText = new_summ + "р";
    let new_total = parseInt(total[0].textContent.slice(0,-1)) - raznica;
    total[0].innerText = new_total + "р";
    total[2].innerText = (new_total + 50) + "р";
    change_count(id,count.textContent);

}

function change_count(id,count) {
    let xhr = new XMLHttpRequest();
    let json = JSON.stringify({
        id: id,
        count: count
    });
    xhr.open("POST", 'http://magaz/engine/api/good/change_count.php', true);
    xhr.setRequestHeader('Content-type', 'application/json; charset=utf-8');
    xhr.send(json);

}