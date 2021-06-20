<?php
session_start();

require_once '../dtb/dtb.php';
require_once 'functions.php';
require_once 'checkAuth.php';

if($_SERVER['REQUEST_METHOD'] !== 'POST'){
    errrorDie([
        'type'    => 'error',
        'message' => 'Неправильный метод'
    ]);
}

if(isAuth()){
    $token = getUserToken();
    $stm = $dtb->prepare('UPDATE users SET token = null WHERE token = ?');
    $stm->bindParam(1, $token);
    if($stm->execute()){
        die(json_encode([
            'type' => 'success'
        ]));
    } else {
        errrorDie([
            'type' => 'error',
            'message' => 'нет такого токена'
        ]);
    }

} else {
    errrorDie([
        'type'    => 'error',
        'message' => 'Неправильный метод'
    ]);
}
?>