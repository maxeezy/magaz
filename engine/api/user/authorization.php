<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);
$alert = [];

if (empty($inputData['login'])) {
    $alert[] = "Не введены данные в поле логин";
}
if (empty($inputData['password'])) {
    $alert[] = "Не введены данные в поле пароль";
}
if (empty($alert)) {
    $user = queryObj("SELECT user.login,user.password,rank.name AS `rank` FROM `user` INNER JOIN `rank` ON user.rank_id=rank.id where login = :login", [':login' => $inputData['login']], $pdo);
    if ($user) {
        if(password_verify($inputData['password'],$user->password)){
            $_SESSION['logged_user']['login'] = $user->login;
            $_SESSION['logged_user']['rank'] = $user->rank;
        }
        else{
            $alert[] = "Неверный пароль";
        }
    }
    else{
        $alert[] = "Пользователя с таким логином не существует";
    }
}
print json_encode($alert);