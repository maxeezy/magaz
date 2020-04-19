<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
if(isset($_SESSION['logged_user'])){
    $goods =  queryAssoc("SELECT goods.id,goods.name,goods.price,goods.img FROM goods INNER JOIN user INNER JOIN favorites ON  favorites.user_id = user.id AND favorites.good_id = goods.id WHERE user.login = :user_login",[':user_login'=>$_SESSION['logged_user']['login']],$pdo);
    if($goods){

    }
    else{
        $goods = [];
    }
}
print  json_encode($goods);