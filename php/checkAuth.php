<?php
require_once '../dtb/dtb.php';
require_once 'functions.php';

function tryToken($token){
    global $dtb;
    $stm = $dtb->prepare("SELECT `id` FROM `users` WHERE `id`=?");
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
        if(!tryToken($_SESSION['accesToken'])){
            return false;
        }
        return true;
    } else {
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            if(isset($_POST['accesToken'])){
                if(tryToken($_POST['accesToken'])){
                    $_SESSION['accesToken'] = $_POST['accesToken'];
                    return true;
                }
            } 
            return false;
        }
    }
}

?>  