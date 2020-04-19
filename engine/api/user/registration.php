<?php
require_once __DIR__ . '/../../database/pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);
$alert= [];
if (empty($inputData['login'])) {
    $alert[] =  "Не введены данные в поле логин";
}

if (empty($inputData['mail'])) {
    $alert[] = "Не введены данные в поле мэйл";

}
if (preg_match('/@/',$inputData['mail'])!=1){
    $alert[] = "Не забудьте знак @";
}
if (empty($inputData['password'])) {
    $alert[] =  "Не введены данные в поле пороль";

}
if(strlen($inputData['login'])<6||strlen($inputData['mail'])<6||strlen($inputData['password'])<6||(strlen($inputData['login'])>64||strlen($inputData['mail'])>64||strlen($inputData['password'])>64)){
    $alert[] = "Данные в полях меньше 6 или больше 64";
}

if(queryObj("SELECT id FROM `user` where login = :login",[':login' => $inputData['login']],$pdo)){
    $alert[] = "Пользователь с таким логином уже существует";
}

if(queryObj("SELECT id FROM `user` where email = :mail",[':mail' => $inputData['mail']],$pdo)){
    $alert[] = "Пользователь с таким мэйлом уже существует";
}

if (empty($alert)){
    $login = trim($inputData['login']);
    $mail = trim($inputData['mail']);
    $password = trim($inputData['password']);
    add("INSERT INTO `user`(id,  email, login, password, rank_id) VALUES (NULL, :mail, :login,:password, 1)",[':mail'=>$mail,':login'=>$login,':password'=>password_hash($password,PASSWORD_BCRYPT)],$pdo);
    $alert['good']  = "Вы зарегестрированы. Можете ";
}
print  json_encode($alert);