<?php
header("Access-Control-Allow-Origin: *");
header('content-type: application/json');

session_start();
require_once '../dtb/dtb.php';
require_once 'functions.php';
$error = [];


if($_SERVER['REQUEST_METHOD'] == 'POST'){
    if(isset($_POST['email']) && isset($_POST['pwd'])){
        $email = $_POST['email'];
        $pwd = $_POST['pwd'];

        $stm = $dtb->prepare("SELECT `id`, `pwd` FROM `users` WHERE `email`=? ");
        $stm->bindParam(1, $email);
        if($stm->execute()){
            if($stm->rowCount() > 0){
                $accesToken = bin2hex(random_bytes(128));
                $row = $stm->fetch(PDO::FETCH_ASSOC);
                if(!password_verify($pwd, $row['pwd'])){
                    errrorDie([
                        'message' => 'Неверный пароль', 
                        'hash'    => $row['pwd'], 
                        'pwd'     => $pwd]
                    );
                }
                $stm = $dtb->prepare("UPDATE `users` SET `token`=? WHERE `id`=?");
                $stm->bindParam(1, $accesToken);
                $stm->bindParam(2, $row['id']);
                if($stm->execute()){
                    $_SESSION['accesToken'] = $accesToken;
                    die(json_encode([
                        'type'  => 'success',
                        'token' =>  $accesToken]));
                } else {
                    errrorDie([
                        "type"    => 'error',
                        'message' => 'Ошибка при обновления токена доступа'
                    ]);
                }
            } else{
                errrorDie([
                    "type"    => 'error',
                    'message' => 'Неверный пароль/логин'
                ]);
            }
        }else{
            errrorDie([
                'type'   => 'error',
                'message' => 'Не удалось выполнить запрос к базе данных']);
        }

    } else {
        errrorDie([
            'type'    => 'error',
            'message' => 'Отсутсвует пароль или логин'
        ]);
    }
} else {
        errrorDie([
            'error'   => 'error',
            'message' => 'Неправильный метод'
        ]);
}

?>