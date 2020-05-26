<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);
if ($_SESSION['logged_user']['rank']=="admin"){
    $some = [];
    if (empty($inputData['name'])){
        $some[] = "Введите название товара";
    }
    if (empty($inputData['desc'])){
        $some[] = "Введите описание товара";
    }
    if (empty($inputData['img'])){
        $some[] = "Введите ссылку на изображение товара";
    }
    if (empty($inputData['price'])){
        $some[] = "Введите цену товара";
    }
    if (empty($inputData['type'])){
        $some[] = "Введите тип  товара";
    }

    if (empty($some)){
        if ($inputData['type']=='4'){
            if (empty($inputData['category'])){
                $some[] = "Введите катеорию товара";
            }
            else{
                add("INSERT INTO `goods`(id, type_id, name, description, price, img) VALUES (NULL ,:type,:name,:desc,:price,:img)",[':type'=>(int)$inputData['type'],':name'=>$inputData['name'],':desc'=>$inputData['desc'],':price'=>(int)$inputData['price'],':img'=>$inputData['img']],$pdo);
                add("INSERT INTO `category_good`(category_id, good_id) VALUES (:category,:good)",[':category'=>(int)$inputData['category'],':good'=>(int)$pdo->lastInsertId()],$pdo);
                $some[] = "Товар добавлен";
            }
        }
        else{
            add("INSERT INTO `goods`(id, type_id, name, description, price, img) VALUES (NULL ,:type,:name,:desc,:price,:img)",[':type'=>(int)$inputData['type'],':name'=>$inputData['name'],':desc'=>$inputData['desc'],':price'=>(int)$inputData['price'],':img'=>$inputData['img']],$pdo);
            $some[] = "Товар добавлен";

        }
    }
    echo json_encode($some);
}