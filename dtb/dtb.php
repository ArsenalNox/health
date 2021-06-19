<?php
header("Access-Control-Allow-Origin: *");
header('content-type: application/json');

try {
$dtb = new PDO("mysql:host=localhost;dbname=health;charset=utf8", 'root', '');
} catch( Exception $e){
    die('Error connecting');
}
?>