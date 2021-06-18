<?php
try {
$dtb = new PDO("mysql:host=localhost;dbname=health", 'root', '');
} catch( Exception $e){
    die('Error connecting');
}
?>