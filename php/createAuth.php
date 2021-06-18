<?php
session_start();
require_once '../dtb/dtb.php';
require_once 'functions.php';
$error = [];


header('content-type: application/json');
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    if(isset($_POST['uid']) && isset($_POST['pwd'])){
        $uid = $_POST['uid'];
        $pwd = $_POST['pwd'];

        $stm = $dtb->prepare("SELECT `id`, `pwd` FROM `users` WHERE `uid`=? ");
        $stm->bindParam(1, $uid);
        if($stm->execute()){
            if($stm->rowCount() > 0){
                $accesToken = bin2hex(random_bytes(256));
                $row = $stm->fetch(PDO::FETCH_ASSOC);
                if(!password_verify($pwd, $row['pwd'])){
                    errrorDie([
                        'message' => 'unable to find user', 
                        'hash'    => $row['pwd'], 
                        'pwd'     => $pwd]
                    );
                }
                $stm = $dtb->prepare("UPDATE `users` SET `token`=? WHERE `id`=?");
                $stm->bindParam(1, $accesToken);
                $stm->bindParam(2, $row['id']);
                if($stm->execute()){
                    $_SESSION['accesToken'] = $accesToken;
                    errrorDie(json_encode(['token'=>$accesToken]));
                } else {
                    errrorDie(['message' => 'error while updating access token']);
                }
            } else{
                errrorDie(['message' => 'unable to find user']);
            }
        }else{
            errrorDie(['message' => 'unable to execute query']);
        }

    } else {
        errrorDie(['message' => 'pwd or uid not set']);
    }
} else {
        errrorDie(['message' => 'invalid method']);
}

?>