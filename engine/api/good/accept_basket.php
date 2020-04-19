<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
$inputData = json_decode(file_get_contents("php://input"), true);
$alert = [];
if (isset($_SESSION['logged_user'])) {
    $goods = queryAssoc("SELECT goods.id,basket.count,goods.price * basket.count AS `total` FROM goods INNER JOIN user INNER JOIN basket ON goods.id = basket.good_id AND user.id = basket.user_id   WHERE user.login = :user_login", [':user_login' => $_SESSION['logged_user']['login']], $pdo);
    if ($goods) {
        $userInfo = queryAssoc("SELECT  `city`, `street`, `house`, `index_adress` FROM `adress` WHERE user_id = (SELECT id FROM `user` WHERE login = :login)", [':login' => $_SESSION['logged_user']['login']], $pdo);
        $error = 0;
        foreach ($userInfo[0] as $key => $value) {
            if ($value == null) {
                $error++;
            }

        }

        if ($error == 0) {
            $totalSumm = 0;
            for ($i = 0; $i < count($goods); $i++) {
                $totalSumm += $goods[$i]['total'];
            }
            $totalSumm += 50;

            add("INSERT INTO `buy`(`id`,`user_id`,`status_id`, `cost`, `date`) VALUES (NULL , (SELECT id FROM `user` WHERE login = :login), 1 ,:cost,:date)", [':login' => $_SESSION['logged_user']['login'], ':cost' => $totalSumm, ':date' => date("Y-m-d H:i:s")], $pdo);

            $idBuy = $pdo->lastInsertId();
            for ($i = 0; $i < count($goods); $i++) {
                add("INSERT INTO `buy_goods` (`buy_id`,`good_id`,`count`) VALUES (:buy_id,:good_id,:count)", ['buy_id' => $idBuy, ':good_id' => $goods[$i]['id'], ':count' => $goods[$i]['count']], $pdo);
            }

            add("DELETE  FROM `basket` WHERE user_id = (SELECT id FROM `user` WHERE login = :login)", [':login' => $_SESSION['logged_user']['login']], $pdo);
            $alert[] = "Заказ оформлен";
        } else {
            $alert[] = "Для заказа товаров, нужно заполнить все поля данных в профиле";
        }
    }
}
echo json_encode($alert);