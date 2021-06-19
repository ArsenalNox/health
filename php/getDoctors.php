<?php
//Списки докторов

require_once '../dtb/dtb.php';
require_once 'functions.php';

if($_SERVER['REQUEST_METHOD'] == 'POST'){
    if(isset($_POST['search_method'])){
        switch($_POST['search_method']){
            case 'departament': //Получаение списка отделений 
                $stm= $dtb->prepare("SELECT * FROM depos");
                if($stm->execute()){
                    $depos = [];
                    while($row = $stm->fetch(PDO::FETCH_ASSOC)){
                        $depos[] = [
                            "name" => $row['depo'],
                            "id"   => $row['id']
                        ];
                    }
                
                    die(json_encode([
                        'type' => 'success',
                        'data' => $depos
                    ]));
                }
                break;
            case 'spec': //Получаение списка врачей отделения 
                $stm= $dtb->prepare("SELECT * FROM doctors WHERE departament = ?");
                if(!isset($_POST['id'])) {
                    errrorDie([
                        'type'    => 'error',
                        'message' => 'Отсутсвует айди отделения'
                    ]);
                }
                $stm->bindParam(1, $_POST['id']);
                if($stm->execute()){
                    $doctors = [];
                    while($row = $stm->fetch(PDO::FETCH_ASSOC)){
                        $doctors[] = $row;
                    }
                    die(json_encode([
                        'type' => 'success',
                        'data' => $doctors
                    ]));
                }
                break;
        }
    }
} else {
    errrorDie([
        'type'    => 'error',
        'message' => 'Неправильный метод'
    ]);
}
?>