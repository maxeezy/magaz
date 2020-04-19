<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
if(isset($_SESSION['logged_user'])){
    $goods =  queryAssoc("SELECT goods.id,goods.name,goods.price,goods.img,basket.count, (SELECT goods.price * basket.count) AS `summ` FROM goods INNER JOIN user INNER JOIN basket ON goods.id = basket.good_id AND user.id = basket.user_id   WHERE user.login = :user_login",[':user_login'=>$_SESSION['logged_user']['login']],$pdo);
    if($goods){

    }
    else{
        $goods = [];
    }
}
print  json_encode($goods);
//НАписать запрос с подсчитом сууммы взависимости от количества
