<?php
require_once __DIR__ . '/../../database/pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);
$res = queryObj("SELECT name,price,description,img FROM `goods` WHERE id=:id",[':id'=>$inputData['good_id']],$pdo);
print json_encode($res);