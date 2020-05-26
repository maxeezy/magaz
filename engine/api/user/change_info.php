<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);
$alert = [];
if ($_SESSION['logged_user']) {
    if (count($inputData) == 2) {
        $user = queryObj("SELECT user.name,user.login,user.surname,user.email,user.login,adress.city,adress.street,adress.house,adress.index_adress FROM `user` INNER JOIN adress ON user.id = adress.user_id WHERE user.id = (SELECT id FROM `user` WHERE login = :login)", [':login' => $_SESSION['logged_user']['login']], $pdo);
        $inputData['value'] = trim($inputData['value']);
        switch ($inputData['field']) {
            case "email":
                if (preg_match('/@/', $inputData['value']) != 1) {
                    $alert[] = "Не забудьте знак @";
                } elseif (strlen($inputData['value']) < 6) {
                    $alert[] = "Почта не может быть короче 6 символов";
                } else {
                    if ($user->email != $inputData['value']) {
                        add("UPDATE `user` SET `email` = :email  WHERE login = :login", [':email' => $inputData['value'], ':login' => $_SESSION['logged_user']['login']], $pdo);
                        $alert[] = "Почта изменена";
                    } else {
                        $alert[] = "Введите почту отличную от существующей";
                    }
                }
                break;
            case "surname":
                if (strlen($inputData['value']) < 1) {
                    $alert[] = "Фамилия не может быть короче 1 символа";
                } elseif (preg_match('/[^а-я ]+/msiu', $inputData['value'])) {
                    $alert[] = "Вводите только буквы русского алфавита";
                } else {
                    if ($user->surname != $inputData['value']) {
                        add("UPDATE `user` SET `surname` = :surname  WHERE login = :login", [':surname' => $inputData['value'], ':login' => $_SESSION['logged_user']['login']], $pdo);
                        $alert[] = "Фамилия изменена";
                    } else {
                        $alert[] = "Введите фамилию отличную от существующей";
                    }
                }
                break;
            case "name":
                if (strlen($inputData['value']) < 1) {
                    $alert[] = "Имя не может быть короче 1 символа";
                } elseif (preg_match('/[^а-я ]+/msiu', $inputData['value'])) {
                    $alert[] = "Вводите только буквы русского алфавита";
                } else {
                    if ($user->name != $inputData['value']) {
                        add("UPDATE `user` SET `name` = :name  WHERE login = :login", [':name' => $inputData['value'], ':login' => $_SESSION['logged_user']['login']], $pdo);
                        $alert[] = "Имя изменено";
                    } else {
                        $alert[] = "Введите имя отличное от существующего";
                    }
                }
                break;
            case "street":
                if (strlen($inputData['value']) < 1) {
                    $alert[] = "Название улицы не может быть короче 1 символа";
                } elseif (preg_match('/[^а-я ]+/msiu', $inputData['value'])) {
                    $alert[] = "Вводите только буквы русского алфавита";
                } else {
                    if ($user->street != $inputData['value']) {
                        add("UPDATE `adress` SET `street` = :street WHERE user_id = (SELECT id FROM `user` WHERE login = :login)", [':street' => $inputData['value'], ':login' => $_SESSION['logged_user']['login']], $pdo);
                        $alert[] = "Улица изменена";
                    } else {
                        $alert[] = "Введите название улицы отличной от существующей";
                    }
                }
                break;
            case "city":
                if (strlen($inputData['value']) < 1) {
                    $alert[] = "Название города не может быть короче 1 символа";
                } elseif (preg_match('/[^а-я ]+/msiu', $inputData['value'])) {
                    $alert[] = "Вводите только буквы русского алфавита";
                } else {
                    if ($user->city != $inputData['value']) {
                        add("UPDATE `adress` SET `city` = :city WHERE user_id = (SELECT id FROM `user` WHERE login = :login)", [':city' => $inputData['value'], ':login' => $_SESSION['logged_user']['login']], $pdo);
                        $alert[] = "Город изменён";
                    } else {
                        $alert[] = "Введите название города отличного от существующего";
                    }
                }
                break;
            case "index_adress":
                if (strlen($inputData['value']) < 0) {
                    $alert[] = "Пустое значение";
                } elseif (!preg_match('/\d{6}/', $inputData['value'])) {
                    $alert[] = "Вводите корректный почтовый индекс";
                } else {
                    if ($user->index_adress != $inputData['value']) {
                        add("UPDATE `adress` SET `index_adress` = :index_adress WHERE user_id = (SELECT id FROM `user` WHERE login = :login)", [':index_adress' => $inputData['value'], ':login' => $_SESSION['logged_user']['login']], $pdo);
                        $alert[] = "Почтовый индекс изменён";
                    } else {
                        $alert[] = "Введите почтовый индекс отличный от существующего";
                    }
                }
                break;
            case "house":
                if (strlen($inputData['value']) < 0) {
                    $alert[] = "Пустое значение";
                } elseif (!preg_match('/\d/', $inputData['value'])) {
                    $alert[] = "Вводите корректный почтовый индекс";
                }
                else{
                    if ($user->house != $inputData['value']){
                        add("UPDATE `adress` SET `house` = :house WHERE user_id = (SELECT id FROM `user` WHERE login = :login)", [':house' => $inputData['value'], ':login' => $_SESSION['logged_user']['login']], $pdo);
                        $alert[] = "Номер дома изменён";
                    } else {
                        $alert[] = "Введите почтовый индекс отличный от существующего";
                    }
                }
                break;
            default:
                $alert[] = "Ошибка";
                break;
        }
    } else {
        $alert[] = "Ошибка";
    }
} else {
    $alert[] = "Ошибка";
}
print json_encode($alert);