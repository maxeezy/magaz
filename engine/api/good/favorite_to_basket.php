<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);
$alert = [];
if (isset($_SESSION['logged_user'])){
    if (queryObj("SELECT name FROM goods WHERE id = :id",[':id'=>$inputData['id']],$pdo)){
        if (queryObj("SELECT * FROM `basket` WHERE user_id = (SELECT id FROM `user` WHERE login = :login) AND good_id = :good_id",[':login'=>$_SESSION['logged_user']['login'],':good_id'=>$inputData['id']],$pdo)){
            $alert[] = "Товар уже есть в корзине";
        }
        else{
            add("INSERT INTO `basket`(user_id, good_id, count) VALUES ((SELECT id FROM `user` WHERE login = :login),:good_id,1)",[':login'=>$_SESSION['logged_user']['login'],':good_id'=>$inputData['id']],$pdo);
            $alert[] = "Товар добавлен в корзину";
        }
    }
}
print json_encode($alert);