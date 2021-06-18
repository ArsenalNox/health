<?php
try {
$dtb = new PDO("mysql:sql=mysql;host=localhost", 'root', '');
} catch( Exception $e){
    die('Error connecting');
}
?>