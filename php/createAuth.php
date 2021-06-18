<?php
require_once '../dtb/dtb.php';
require_once 'function.php';
$error = [];


header('content-type: application/json');
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    if(isset($_POST['uid']) && isset($_POST['pwd'])){
        $uid = $_POST['uid'];
        $pwd = $_POST['pwd'];

        $stm = $dtb->prepare("SELECT `id` FROM `users` WHERE `uid`=? AND `pwd`=? ");
        $stm->bindParam(1, $uid);
        $stm->bindParam(2, $pwd);
        if($stm->execute()){
            if($stm->rowCount() > 0){
                $accesToken = bin2hex(random_bytes(256));
                $row = $stm->fetch(PDO::FETCH_ASSOC);

                $stm = $dtb->prepare("UPDATE `users` SET `token`=? WHERE `id`=?");
                $stm->bindParam(1, $accesToken);
                $stm->bindParam(2, $row['id']);
                if($stm->execute()){
                    die(json_encode($accesToken));
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