<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);

if (isset($_SESSION['logged_user'])){
    if(is_numeric($inputData['count'])){
        if (!(int)$inputData['count']<1){
            $inputData['count'] = (int)$inputData['count'];
            if (queryObj("SELECT basket.user_id FROM basket INNER JOIN user INNER JOIN goods ON user.id = basket.user_id AND goods.id = basket.good_id WHERE user.login = :user_login AND goods.id = :good_id",[':user_login'=>$_SESSION['logged_user']['login'],':good_id'=>$inputData['id']],$pdo)){
                add("UPDATE `basket` SET `count` = :counts WHERE user_id = (SELECT id FROM `user` WHERE login = :login) AND good_id = :good_id",[':good_id'=>$inputData['id'],':login'=>$_SESSION['logged_user']['login'],':counts'=>$inputData['count']],$pdo);
            }
        }
    }
}
