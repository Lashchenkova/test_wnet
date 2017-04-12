<?php

class Database {

    public $db;
    private static $instance;

    public static function getInstance()
    {
        if(is_null(self::$instance)){
            self::$instance = new self();
        }

        return self::$instance;
    }

    private function __construct()
    {
        try {
            $this->db = new mysqli('localhost', 'root', '', 'test_wnet');
        } catch (Exception $e){
            echo $e->getMessage();
            exit;
        }
    }

    private function __clone(){}
    private function __wake(){}

    public static function query($sql)
    {
        $obj=self::$instance;
        return $obj->db->query($sql);
    }
}



