<?php

require_once '../dtb/dtb.php';
require_once 'functions.php';
require_once 'checkAuth.php';

if(isAuth()){
    $uid = getUserId();
    $lorem = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure esse suscipit praesentium illum debitis omnis, quaerat dolorum, dolor corrupti dicta voluptates eligendi aperiam expedita mollitia ea, maxime sunt voluptate optia"';
    $result = $_POST['result'];
    $doctor = $_POST['doctor'];

    $stm = $dtb->prepare("INSERT INTO `medcardhistory`(`uid`, `action`, `textContent`, `result`, `doctor`, `appt`) VALUES (?, ?, ?, ?, ?, ?)");
    $stm->bindParam(1, $uid);
    $stm->bindParam(2, $_POST['action']);
    $stm->bindParam(3, $lorem);
    $stm->bindParam(4, $result);
    $stm->bindParam(5, $doctor);
    $stm->bindParam(6, $_POST['appt']);

    if($stm->execute()){
        die(json_encode([
            'type' => 'success',
            'data' => 'Успешно добавил'
        ]));
    } else {
        errrorDie([
            'success'    => 'error',
            'message'    => 'Не прошёл запрос',
            'errorInfo'  => $stm->errorInfo()
        ]);
    }
}
