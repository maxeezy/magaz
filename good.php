<?php
session_start();
require_once __DIR__ . '/engine/database/pdo.php';
$tovar= queryObj('SELECT name FROM `goods` WHERE id = :id',[':id'=>$_GET['id']],$pdo);
if (!$tovar) {
    header('Location: /404');
} else {
    include __DIR__ . '/engine/config/constructor.php';
}
