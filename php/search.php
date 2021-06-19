<?php
require_once '../dtb/dtb.php';
require_once 'functions.php';

if($_SERVER['REQUEST_METHOD'] == 'GET'){
    if(!isset($_GET['query'])){
        errrorDie([
            'type'    => 'error',
            'message' => 'Отсутсвует поисковой параметр query'
        ]);
    }
    if(strlen($_GET['query'])<3){
        errrorDie([
            'type' => 'error',
            'message' => 'Поисковой параметр слишком короткий'
        ]);
    }

    $mysqli = new mysqli('localhost','root','','health');
    mysqli_set_charset($mysqli, 'utf-8');
    mysqli_query($mysqli, "SET NAMES 'utf8");
    mysqli_query($mysqli, "SET CHARACTER SET 'utf8';");
    mysqli_query($mysqli, "SET SESSION collation_connection = 'utf8_general_ci';");

    $result = [];
    $count = 0;
    $sql = "SELECT * FROM `doctors` LEFT JOIN `specialty` on doctors.speciality=specialty.id WHERE specialty LIKE '%?%'";
    $sql = str_replace('?', $_GET['query'], $sql);
    $res = mysqli_query($mysqli, $sql);
    if(mysqli_num_rows($res)>0){
        $result['spe'] = [];
        foreach($res as $row){
            $result['spe'][] = $row;
            $count++;
        }
    }
    
    $sql = "SELECT * FROM `services` WHERE name LIKE '%?%' OR description LIKE '%?%'";
    $sql = str_replace('?', $_GET['query'], $sql);
    $res = mysqli_query($mysqli, $sql);
    if(mysqli_num_rows($res)>0){
        $result['srv'] = [];
        foreach($res as $row){
            $result['srv'][] = $row;
        }
    }
   
    
    $sql = "SELECT * FROM `doctors` WHERE name LIKE '%?%' OR surename LIKE '%?%' OR patronymic LIKE '%?%'";
    $sql = str_replace('?', $_GET['query'], $sql);
    $res = mysqli_query($mysqli, $sql);
    if(mysqli_num_rows($res)>0){
        $result['doc'] = [];
        foreach($res as $row){
          $result['doc'][] = $row;
        }
    }

    die(json_encode(['result'=>$result]));
}
?>