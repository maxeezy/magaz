<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
if (isset($_SESSION['logged_user'])){
    $info = queryAssoc("SELECT user.name,user.login,user.surname,user.email,user.login,adress.city,adress.street,adress.house,adress.index_adress FROM `user` INNER JOIN adress ON user.id = adress.user_id WHERE user.id = (SELECT id FROM `user` WHERE login = :login)",[':login'=>$_SESSION['logged_user']['login']],$pdo);
    print json_encode($info);
}