<?php
//Устанавливает направление к врачу
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
    if(!isset($_POST['id'])){
        errrorDie([
            'type'    => 'error',
            'message' => 'Отсутствует айди записи'
        ]);
    }

    $stm = $dtb->prepare("SELECT * FROM appointments WHERE id = ?");
    $stm->bindParam(1, $_POST['id']);
    if($stm->execute()){
        if($stm->rowCount() == 0){
            errrorDie([
                'type'    => 'error',
                'message' => 'Запись с таким айди не существует'
            ]);
        }
    }
    $stm = $dtb->prepare("DELETE FROM appointments WHERE id = ?");
    $stm->bindParam(1, $_POST['id']);
    if($stm->execute()){
        die(json_encode([
            'type'    => 'success',
            'message' => 'Запись успешно удалена'
        ]));
    } else {
        errrorDie([
            'type'    => 'error',
            'message' => 'Не удалось удалить запись'
        ]);
    }



} else {
    errrorDie([
        'type'    => 'error',
        'message' => 'Не авторизован'
    ]);
}

?>