<?php
if($_SERVER['REQUEST_METHOD'] == 'GET'){
    $result = [];

    $stmCtg1 = $dtb->prepare();
    $stmCtg2 = $dtb->prepare();
    $stmCtg3 = $dtb->prepare();
    $stmCtg4 = $dtb->prepare();
    $stmCtg5 = $dtb->prepare();

    die(json_encode(['result'=>$result]));
}
?>