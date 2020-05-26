<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
if ($_SESSION['logged_user']['rank']=="admin"){
    $some = queryAssocNoP("SELECT id,name FROM category",$pdo);
    echo json_encode($some);
}