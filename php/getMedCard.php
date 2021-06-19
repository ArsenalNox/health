<?php


require_once '../dtb/dtb.php'; 
require_once 'functions.php'; 
require_once 'checkAuth.php';

if(isAuth()){
    $uid = getUserId();
    $stm = $dtb->prepare("SELECT 
        medcardhistory.id,
        medcardhistory.uid,
        medcardhistory.action,
        medcardhistory.textContent,
        medcardhistory.result,
        medcardhistory.doctor,
        medcardhistory.pdf,
        appointments.date,
        appointments.time,
        appointments.state,
        appointments.sid

    FROM medcardhistory LEFT JOIN appointments ON medcardhistory.appt = appointments.id WHERE medcardhistory.uid = ? ORDER BY appointments.date ASC");
    $stm->bindParam(1, $uid);
    if($stm->execute()){
        $data['appointments_complete'] = [];
        while($row = $stm->fetch(PDO::FETCH_ASSOC)){
            $data['appointments_complete'][] = $row;
        }
        
    } else {
        errrorDie([
            'type'  => 'error',
            'data'  => $stm->errorInfo()
        ]);
    }


    $stm = $dtb->prepare("SELECT * FROM appointments WHERE uid=? ORDER BY date ASC");
    $stm->bindParam(1, $uid);
    if($stm->execute()){
        $data['appointments_planned'] = [];
        while($row = $stm->fetch(PDO::FETCH_ASSOC)){
            $data['appointments_planned'][] = $row;
        }
    } else {
        errrorDie([
            'type'  => 'error',
            'data'  => $stm->errorInfo()  
        ]);
    }



    die(json_encode([
        'type' => 'success',
        'data' => $data
    ]));
} else {
    errrorDie([
        'type'    => 'error',
        'message' => 'Не авторизован'
    ]);
}
?>