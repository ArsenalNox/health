<?php

function errrorDie($message){
    die(json_encode($message));
}

function createGuest($name, $phone) { //Создание гостя 
    global $dtb;
    $stm = $dtb->prepare("SELECT id FROM guests WHERE phone=?");
    $stm->bindParam(1, $phone);
    if($stm->execute()){
        if($stm->rowCount() > 0){
            $row = $stm->fetch(PDO::FETCH_ASSOC);
            return $row['id'];
        }

        $stm = $dtb->prepare("INSERT INTO `guests`(`name`, `phone`, `dateCreated`) VALUES(?, ?, ?) ");
        $dateCreated = date('Y-m-d');
        $stm->bindParam(1, $name);
        $stm->bindParam(2, $phone);
        $stm->bindParam(3, $dateCreated);
        if($stm->execute()){
            return $dtb->lastInsertId();
        }
    }
    return false;
}