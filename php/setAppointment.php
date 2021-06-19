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
    if(isset($_POST['docuid'])){
        $uid = getUserId();
        if($uid !== false){
            $dateToday = date('Y-m-d');
            $time      = date('H:i:s');
            $sid = 1;
            $status = 'Ожидает подтвержения';

            $stm = $dtb->prepare("INSERT INTO `appointments`(`did`,`uid`,`sid`,`date`,`time`,`state`) VALUES(?,?,?,?,?,?)");

            $stm->bindParam(1, $_POST['docuid']);
            $stm->bindParam(2, $uid);
            $stm->bindParam(3, $sid);
            $stm->bindParam(4, $dateToday);
            $stm->bindParam(5, $time);
            $stm->bindParam(6, $status);

            if($stm->execute()){
                die(json_encode([
                    'type'    => 'success',
                    'message' => 'Запись созданна'
                ]));
            } else {
                errrorDie([
                    'type'    => 'error',
                    'message' => 'Не удалось создать запись',
                    'data'    => [$dateToday, $time, $status, $sid, $uid, $_POST['docuid']]
                ]);
            }

        } else {
            errrorDie([
                'type'    => 'error',
                'message' => 'Не удалось получить айди пользователя'
            ]);
        }
    } else {
        errrorDie([
            'type'    => 'error',
            'message' => 'Отсутсвует айди доктора'
        ]);
    }
} else {
    errrorDie([
        'type'    => 'error',
        'message' => 'Пользователь не авторизирован'
    ]);
}
