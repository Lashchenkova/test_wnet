<?php

$id_contract = "'" . $_GET['name'] . "'";
$status = "IS NOT NULL";

//checking checkbox
if (!empty($_GET['check'])) {
    if (count($_GET['check']) > 1) { //adding "" for mysql query
        $status = "IN (" . "'" . implode("', '", $_GET['check']) . "')";
    } else {
        $status = "= " . "'" . implode("', '", $_GET['check']) . "'";
    }
}

spl_autoload_register(function ($class_name) {
    $filename = "Entities/{$class_name}.php";
    if(file_exists($filename)){
        require_once $filename;
    }else{
        throw new Exception('File not found');
    }
});

CustomerFactory::create($id_contract, $status)->get_data();