<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
$order = [];
if (isset($_SESSION['logged_user'])){
    $order = queryAssoc("SELECT buy.id AS `buy_id`,buy.status_id,buy.cost,buy.date,buy_goods.count,goods.id AS `good_id`,goods.img,status.name FROM buy_goods INNER JOIN buy INNER JOIN user INNER JOIN status INNER JOIN goods ON goods.id = buy_goods.good_id AND buy.user_id = user.id AND status.id = buy.status_id AND buy.id = buy_goods.buy_id WHERE buy.user_id = (SELECT id FROM `user` WHERE login = :login)",[':login'=>$_SESSION['logged_user']['login']],$pdo);
}
echo json_encode($order);