<?php
//Проверка\аунтефикация пользователя 
require_once '../dtb/dtb.php';
require_once 'functions.php';

function tryToken($token){
    //Пробует токен об бд
    global $dtb;
    $stm = $dtb->prepare("SELECT `id` FROM `users` WHERE `token`=?");
    $stm->bindParam(1, $token);
    if($stm->execute()){
        if($stm->rowCount() > 0){
            return true;
        }
    } 
    return false;
}

function isAuth(){
    if(isset($_SESSION['accesToken'])){
        if(tryToken($_SESSION['accesToken'])){
            return true;
        }
        return false;
    } else {
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            if(isset($_POST['accesToken'])){
                if(tryToken($_POST['accesToken'])){
                    $_SESSION['accesToken'] = $_POST['accesToken'];
                    return true;
                }
            }
        }
        return false;
    }
}

function getUserId(){ 
    //Получает айди пользователя по его токену
    global $dtb;
    $token = getUserToken();
    if($token !== false){
        $stm=$dtb->prepare("SELECT id FROM `users` WHERE token=?");
        $stm->bindParam(1, $token);
        if($stm->execute()){
            if($stm->rowCount() > 0){
                $row = $stm->fetch(PDO::FETCH_ASSOC);
                return $row['id'];
            }
        } else {
            return false;
        }
    } 
    return false;
}

function getUserToken(){
    if(isset($_SESSION['accesToken']) && isset($_POST['accesToken'])){
        if($_SESSION['accesToken'] == $_POST['accesToken']) return $_POST['accesToken'];
    }

    if(isset($_SESSION['accesToken'])) return $_SESSION['accesToken'];
    if(isset($_POST['accesToken']))    return $_POST['accesToken'];

    return false;
}
?>  