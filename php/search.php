<?php
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    echo json_encode(['success' => True]);
}

die();
?>