<?php
require_once __DIR__ . '/../../database/pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);
$info = queryAssocNoP('SELECT  name,id,price,img FROM `goods` LIMIT 6',$pdo);
if($info){
    print json_encode($info);
}
else{
    http_response_code(404);
}