<?php

require_once '../dtb/dtb.php';
require_once 'functions.php';
require_once 'checkAuth.php';

if(isAuth()){
    $data = [];
    $stm = $dtb->prepare("SELECT id, email, name, surename, patronymic FROM users WHERE token = ?");
    $stm->bindParam(1, $_POST['accesToken']);
    if($stm->execute()){
        if($stm->rowCount() > 0){
            $row = $stm->fetch(PDO::FETCH_ASSOC);
            $data['personal'] = $row;
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

    $uid = getUserId();
    $stm = $dtb->prepare('SELECT * FROM passport WHERE uid = ?');
    $stm->bindParam(1, $uid);
    if($stm->execute()){
        if($stm->rowCount() > 0){
            $row = $stm->fetch(PDO::FETCH_ASSOC);
            $data['passport'] = $row;
        }
    }

    die(json_encode([
        'type' => 'success',
        'data' => $data
    ]));

} else {
    errrorDie([
        'type'    => 'error',
        'message' => 'unauthorized'
    ]);
}