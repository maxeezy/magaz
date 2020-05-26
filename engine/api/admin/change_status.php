<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);
if ($_SESSION['logged_user']['rank']=="admin"){
    $alert = [];
    if (!empty($inputData['id'])&&!empty($inputData['value'])){
        $obj = queryObj("SELECT * FROM buy WHERE id = :id",[':id'=>$inputData['id']],$pdo);
        if (queryObj("SELECT * FROM buy WHERE id = :id",[':id'=>$inputData['id']],$pdo)){
            if($obj->status_id!=$inputData['value']){
                add("UPDATE buy SET  status_id = :status_id WHERE id = :id",[':status_id'=>$inputData['value'],':id'=>$inputData['id']],$pdo);
                $alert[] = "Статус заказа изменен";
            }
            else{
                $alert[] = "Вы не изменили значение статуса!";
            }
        }
        else{
            $alert[] = "Такого заказа нет!";
        }
    }
    echo  json_encode($alert);
}