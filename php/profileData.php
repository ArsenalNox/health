<?php

require_once '../dtb/dtb.php';
require_once 'functions.php';
require_once 'checkAuth.php';

if(isAuth()){
    $stm = $dtb->prepare("SELECT id, email, name, surename. patronymic FROM users WHERE token = ?");
    $stm->bindParam(1, $_POST['token']);
    if($stm->execute()){
        if($stm->rowCount() > 0){
            
        }
    } else {
        errrorDie([
            'type'    => 'error',
            'message' => 'Ошибка бд'
        ]);
    }
} else {
    errrorDie([
        'type'    => 'error',
        'message' => 'unauthorized'
    ]);
}