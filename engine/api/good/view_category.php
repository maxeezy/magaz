<?php
require_once __DIR__ . '/../../database/pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);
$some = queryAssocNoP("SELECT * FROM `category`",$pdo);
print json_encode($some);