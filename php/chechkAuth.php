<?php
session_start();
require_once '../dtb/dtb.php';
require_once 'functions.php';

function tryToken($token){
    global $dtb;
    $stm = $dtb->prepare("SELECT `id` FROM `users` WHERE `id`=?");
    $stm->bindParam(1, $token);
    if($stm->execute()){
        if($stm->rowCount() > 0){
            return true;
        } else {
            return False;
        }
    } else {
        return False;
    }
    return false;
}

function isAuth(){
    if(isset($_SESSION['accesToken'])){
        if(!tryToken($_SESSION['accesToken'])){
            errrorDie(['message'=>'no access']);
        }
    } else {
        if($_SERVER['REQUEST_METHOD'] == 'POST'){
            if(isset($_POST['accesToken'])){
                if(tryToken($_POST['accesToken'])){
                    $_SESSION['accesToken'] = $_POST['accesToken'];
                }
            }  
        }
    }
}

?>  