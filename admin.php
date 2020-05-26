<?php
session_start();
if ($_SESSION['logged_user']['rank'] == "admin") {
    include __DIR__ . '/engine/config/constructor.php';

}
else{
    header('Location: /404');
}