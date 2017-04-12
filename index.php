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

include_once('DbWrapper.php');
DbWrapper::getInstance()->get_data($id_contract, $status);
