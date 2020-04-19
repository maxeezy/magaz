<?php
session_start();
if(isset($_SESSION['logged_user'])){
    if ($_SESSION['logged_user']['rank']=='admin'){
        header('Location: /admin');
    }
    else{
        header('Location: /user');
    }
}
else{
    include __DIR__ . '/engine/config/constructor.php';
}