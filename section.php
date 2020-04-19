<?php
session_start();
require_once __DIR__ . '/engine/database/pdo.php';
if (isset($_GET['id'])){
    if (queryObj("SELECT * FROM `category_good` where category_id = :category_id",[':category_id'=>$_GET['id']],$pdo))
    {
        include __DIR__ . '/engine/config/constructor.php';
    }
    else{
        header('Location: /404');
    }
}
else{
    include __DIR__ . '/engine/config/constructor.php';

}
