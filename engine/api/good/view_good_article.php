<?php
require_once  'E:\prog\os\OSPanel\domains\magaz\engine\database\pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);
$types = [
    'brace' => 'Браслет','pendants' => 'Кулон', 'passport-covers' => 'Обложка на паспорт', 'badges-category' => 'Значок'
];
$inputData['article'] = 'badges-category';
$inputData['id'] = '1';
if (!isset($inputData['id'])){
     $sql = "SELECT goods.id,goods.name,goods.price,goods.img FROM goods INNER JOIN good_type ON goods.type_id=good_type.id WHERE good_type.name = :type_name";
     $some = queryAssoc($sql,[':type_name'=>$types[$inputData['article']]],$pdo);
}
else{
    $sql2 = "SELECT goods.id,goods.name,goods.price,goods.img FROM goods INNER JOIN good_type INNER JOIN category_good INNER JOIN category ON category_good.category_id = category.id AND category_good.good_id = goods.id AND goods.type_id = good_type.id WHERE category.id = :category_id AND goods.type_id = :type_id";
    $some = var_dump(queryAssoc($sql2,[':category_id'=>$inputData['id'],':type_id'=>$types[$inputData['article']]],$pdo));

}
var_dump($inputData);
var_dump( $some);
if ($some){
    print json_encode($some);
}