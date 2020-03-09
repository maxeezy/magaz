<?php
require_once  'E:\prog\os\OSPanel\domains\magaz\engine\database\pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);
$ot = (int)$inputData['count'];
$do = 6;
$query = "SELECT  name,id,price,img FROM `goods` LIMIT ".$ot ." , ". $do;

if (count(queryAssocNoP("SELECT * FROM `goods`",$pdo))>$inputData['count']){
    $some=queryAssocNoP($query,$pdo);
    print json_encode($some);
}
else{

}