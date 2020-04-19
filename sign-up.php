<?php
session_start();
if(isset($_SESSION['logged_user'])){
    header('Location: /user');
}else{
    include __DIR__ . '/engine/config/constructor.php';
}