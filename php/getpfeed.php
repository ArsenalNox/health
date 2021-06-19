<?php
require_once '../dtb/dtb.php';
require_once 'functions.php';

$stm = $dtb->prepare('SELECT * FROM `pfeed`');
if($stm->execute()){
    $posts = [];

    while($row = $stm->fetch(PDO::FETCH_ASSOC)){
        $posts[] = $row;
    }
    die(json_encode([
        'success' => 'true',
        'data' => $posts
    ]));    
}
?>