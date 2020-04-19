<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);
if (isset($_SESSION['logged_user'])){
    if(queryObj("SELECT favorites.good_id FROM `favorites` INNER JOIN `goods` INNER JOIN `user` ON favorites.user_id = user.id AND favorites.good_id = goods.id WHERE goods.id = :good_id AND user.id = (SELECT id FROM `user` WHERE login = :login) ",[':good_id'=>$inputData['id'],':login'=>$_SESSION['logged_user']['login']],$pdo)){
        add("DELETE FROM `favorites` WHERE user_id = (SELECT id FROM `user` WHERE login = :login) AND good_id = :good_id",[':login'=>$_SESSION['logged_user']['login'],':good_id'=>$inputData['id']],$pdo);
    }
}
