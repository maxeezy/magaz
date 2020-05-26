<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);
$inputData['number'] = (int)$inputData['number'];
if ($_SESSION['logged_user']['rank']=="admin"){

    if ((empty($inputData['date']))&&(empty($inputData['number']))){

    }
    elseif (empty($inputData['date'])){
        $alert = [];
        $alert = queryAssoc("SELECT buy.id,buy.cost,buy.date,user.login AS `nickname`,user.email,status.name,buy_goods.count,goods.id AS `good_id`,goods.img FROM buy_goods INNER JOIN buy INNER JOIN user INNER JOIN status INNER JOIN goods ON goods.id = buy_goods.good_id AND buy.user_id = user.id AND status.id = buy.status_id AND buy.id = buy_goods.buy_id where buy.id = :buy_id",[':buy_id'=>$inputData['number']],$pdo);
    }
    elseif (empty($inputData['number'])){
        $alert = [];
        $alert = queryAssoc("SELECT buy.id,buy.cost,buy.date,user.login AS `nickname`,status.name,user.email,buy_goods.count,goods.id AS `good_id`,goods.img FROM buy_goods INNER JOIN buy INNER JOIN user INNER JOIN status INNER JOIN goods ON goods.id = buy_goods.good_id AND buy.user_id = user.id AND status.id = buy.status_id AND buy.id = buy_goods.buy_id where buy.date LIKE :buy_date",[':buy_date'=>$inputData['date']."%"],$pdo);
    }
    else{
        $alert = [];
        $alert = queryAssoc("SELECT buy.id,buy.cost,buy.date,user.login AS `nickname`,status.name,user.email,buy_goods.count,goods.id AS `good_id`,goods.img FROM buy_goods INNER JOIN buy INNER JOIN user INNER JOIN status INNER JOIN goods ON goods.id = buy_goods.good_id AND buy.user_id = user.id AND status.id = buy.status_id AND buy.id = buy_goods.buy_id where buy.id = :buy_id OR buy.date LIKE :buy_date",[':buy_id'=>$inputData['number'],':buy_date'=>$inputData['date'].'%'],$pdo);
    }
    echo json_encode($alert);
}

