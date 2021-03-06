<?php
//Регистрация 

session_start();
require_once '../dtb/dtb.php';
require_once 'checkAuth.php';
require_once 'functions.php';

if($_SERVER['REQUEST_METHOD'] == 'POST'){
    if(isAuth()) errrorDie([
                    'type' => 'error',
                    'message' => 'Пользователь авторизирован'
                ]);
    
    if(isset($_POST['name']) && isset($_POST['pwd']) && isset($_POST['email'])){
        $stm = $dtb->prepare("SELECT `id` FROM `users` WHERE `email`=?");
        $stm->bindParam(1, $_POST['email']);
        if($stm->execute()){
            if($stm->rowCount() > 0){
                errrorDie([
                    'type' => 'error',
                    'message' => 'Пользователь с таким электронными адресом уже существует'
                ]);
            }         
            
            $pwd = password_hash($_POST['pwd'], PASSWORD_BCRYPT, ['cost'=>10]);
            $stm = $dtb->prepare("INSERT INTO `users`(`email`,`name`,`pwd`) VALUES(?,?,?)");

            $stm->bindParam(1, $_POST['email']);
            $stm->bindParam(2, $_POST['name']);
            $stm->bindParam(3, $pwd);

            if($stm->execute()){
                $id = $dtb->lastInsertId();
                $stm = $dtb->prepare("INSERT INTO `passport`(
                    `uid`, 
                    `serial`,
                    `number`, 
                    `givenby`, 
                    `residense`, 
                    `code`) 
                    VALUES 
                    (
                        ?, 
                        5231, 
                        131313, 
                        'Отделом УФМС росси по нной области классического района', 
                        'Ул обычная квартира стандартная',
                        '325-235'
                    )");
                $stm->bindParam(1, $id);
                if($stm->execute()){
                    $data['error'] = null;
                } else {
                    $data['error'] = $stm->errorInfo();
                }

                die(json_encode([
                    'type'    => 'success',
                    'message' => 'Пользователь создан',
                    "id"      => $id,
                    'data'    => $data
                ]));

            } else {
                errrorDie([
                    'type'    => 'error',
                    'message' => 'Не удалось создать пользователя, ошибка со стороны бд'
                ]);
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
            'message' => 'Нет необходимых полей'
        ]);
    }
} else {
    errrorDie([
        'type' => 'error',
        'message' => 'Неправильный метод'
    ]);
}
?>