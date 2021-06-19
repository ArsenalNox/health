<?php

require_once '../dtb/dtb.php';
require_once 'functions.php';
require_once 'checkAuth.php';

if(isAuth()){
    $stm = $dtb->prepare("SELECT id, email, name, surename, patronymic FROM users WHERE token = ?");
    $stm->bindParam(1, $_POST['accesToken']);
    if($stm->execute()){
        if($stm->rowCount() > 0){
            $row = $stm->fetch(PDO::FETCH_ASSOC);
            die(json_encode($row));
        } else{
            errrorDie([
                'type'    => 'error',
                'message' => 'No user'
            ]);
        }
    } else {
        errrorDie([
            'type'    => 'error',
            'message' => $stm->errorInfo()
        ]);
    }
} else {
    errrorDie([
        'type'    => 'error',
        'message' => 'unauthorized'
    ]);
}