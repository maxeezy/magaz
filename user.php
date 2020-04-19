<?php
session_start();
require_once __DIR__ . '/engine/database/pdo.php';
if($_SESSION['logged_user']['rank']=="user"){
    if (isset($_GET['orderId'])){
        if (queryObj("SELECT * FROM buy WHERE id= :id AND user_id = (SELECT id FROM `user` WHERE login = :login)",[':id'=>$_GET['orderId'],':login'=>$_SESSION['logged_user']['login']],$pdo)){

        }
        else{
            header('Location: /404');
        }
    }
    include __DIR__ . '/engine/config/constructor.php';
}
else{
    header('Location: /404');
}