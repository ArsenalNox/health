<?php
//Создаёт запись к врачу
require_once '../dtb/dtb.php';
require_once 'functions.php';
require_once 'checkAuth.php';

if(isAuth()){
    $uid = getUserId();
    if(isset($_POST['did']) && isset($_POST['time']) && isset($_POST['sid']) && isset($_POST['date'])){

        //Проверить, сущесвтует ли уже эта запись
        $stm = $dtb->prepare('SELECT id FROM appointments WHERE uid = ? AND state != "завершён" AND did = ? AND time = ?');
        $stm->bindParam(1, $uid);
        $stm->bindParam(2, $_POST['did']);
        $stm->bindParam(3, $_POST['time']);
        if($stm->execute()){
            if($stm->rowCount() > 0){
                errrorDie([
                    'type'    => 'error',
                    'message' => 'Запись уже сущесвтует'
                ]);
            }
        }

        $stm = $dtb->prepare("INSERT INTO `appointments`(`did`,`uid`,`date`,`time`,`sid`,`state`) VALUES(?,?,?,?,?, 'ожидает подтверждения')");
        $stm->bindParam(1,$_POST['did']);
        $stm->bindParam(2,$uid);
        $stm->bindParam(3,$_POST['date']);
        $stm->bindParam(4,$_POST['time']);
        $stm->bindParam(5,$_POST['sid']);
        if($stm->execute()){
            die(json_encode([
                'type'    => 'success',
                'message' => 'Запись успешно созданна'
            ]));
        } else {
            errrorDie([
                'type'      => 'error',
                'message'   => 'Не удалось создать запись',
                'errorInfo' => $stm->errorInfo()
            ]);
        }

    } else {
        errrorDie([
            'type'    => 'error',
            'message' => 'Отсутсвуют айди доктора\время\услуга'
        ]);
    }
} else {
    errrorDie([
        'type'    => 'error',
        'message' => 'Не авторизован'
    ]);
}


?>