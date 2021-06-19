<?php
require_once '../dtb/dtb.php';
require_once 'functions.php';
require_once 'checkAuth.php';

if(isAuth()){

$uid = getUserId();
$data = [];
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
        'type' => 'error',
        'data' => 'Неавторизован'
    ]);
}

?>