<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);
$alert=[];
if (isset($_SESSION['logged_user'])){
    if(queryObj("SELECT name FROM goods WHERE id = :id",[':id'=>$inputData['id']],$pdo)){
        $user_id = queryObj("SELECT id FROM `user` WHERE login = :login",[':login'=>$_SESSION['logged_user']['login']],$pdo);
        if(queryObj("SELECT user_id FROM `favorites` WHERE user_id = :user_id AND good_id = :good_id",[':user_id'=>$user_id->id,':good_id'=>$inputData['id']],$pdo)){
            //add("UPDATE `favorites` SET good_id = :good_id WHERE user_id = :user_id",[':good_id'=>$inputData['id'],':user_id'=>$user_id->id],$pdo);
            $alert['already'] = "Уже добавлено";
        }
        else{
            add("INSERT INTO `favorites`(user_id, good_id) VALUES (:user_id,:good_id)",[':good_id'=>$inputData['id'],':user_id'=>$user_id->id],$pdo);
            $alert['ok'] = "Добавленно в избранное";
        }
    }
    else{
        $alert['no'] = "Данного товара нет в наличии";
    }
}
else{
    $alert['aut'] = "Для добавление в избранное";
}
print  json_encode($alert);