<?php
$host = 'localhost';
$db   = 'magaz';
$user = 'root';
$pass = '';
$charset = 'utf8';
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$opt = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];
try{
    $pdo = new PDO($dsn, $user, $pass, $opt);
} catch (PDOException $e){
    die("Не могу подключиться к базе данных");
}
function add($sql, $params, $pdo)
{
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
}

function queryObj($sql, $params, $pdo)
{
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    return $some = $stmt->fetch(PDO::FETCH_OBJ);

}
function queryAssoc($sql, $params, $pdo)
{
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    return $some = $stmt->fetchAll(PDO::FETCH_ASSOC);

}
function queryAssocNoP($sql, $pdo)
{
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    return $some = $stmt->fetchAll(PDO::FETCH_ASSOC);

}
function queryObjNoP($sql, $pdo)
{
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    return $some = $stmt->fetch(PDO::FETCH_OBJ);

}