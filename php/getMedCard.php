<?php
require_once '../dtb/dtb.php'; 
require_once 'functions.php'; 
require_once 'checkAuth.php';

if(isAuth()){
    $uid = getUserId();
    $stm = $dtb->prepare("SELECT * FROM medcardhistory WHERE uid = ?");
    $stm->bindParam(1, $uid);
    if($stm->execute()){
        $data = [];
        while($row = $stm->fetch(PDO::FETCH_ASSOC)){
            $data[] = $row;
        }
        die(json_encode([
            'type' => 'success',
            'data' => $data
        ]));
    }
}
?>