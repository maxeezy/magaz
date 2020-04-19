<?php
session_start();
require_once __DIR__ . '/../../database/pdo.php';
if(isset($_SESSION['logged_user'])){
    $goods =  queryAssoc("SELECT goods.price * basket.count AS `total` FROM goods INNER JOIN user INNER JOIN basket ON goods.id = basket.good_id AND user.id = basket.user_id   WHERE user.login = :user_login",[':user_login'=>$_SESSION['logged_user']['login']],$pdo);
    if ($goods){
        $total  = 0;
        for($i = 0; $i < count($goods);$i++){
            $total += $goods[$i]['total'];
        }
        $asnw['total'] = $total;
        $asnw['total_dil'] = $total + 50;
    }
}
print  json_encode($asnw);

