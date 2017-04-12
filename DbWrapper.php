<?php

class DbWrapper {

    public $db;
    private static $instance;
    public $id_contract;

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

    public function get_data($id_contract, $status) {

        $data = array();

        //selecting data for table
        if($result = $this->db->query("SELECT cust.name_customer, cust.company, cont.number, cont.date_sign
                  FROM obj_customers cust JOIN obj_contracts cont
                  ON cust.id_customer = cont.id_customer
                  WHERE cont.id_contract = {$id_contract} 
                  OR cust.name_customer = {$id_contract}")){
            while($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
        }

        //selecting services from checkbox
        if($query = $this->db->query("SELECT s.title_service, s.status FROM obj_services s 
                  JOIN obj_contracts con 
                  ON s.id_contract = con.id_contract
                  JOIN obj_customers c 
                  ON con.id_customer = c.id_customer
                  WHERE s.id_contract = {$id_contract} 
                  OR c.name_customer = {$id_contract} 
                  AND s.status {$status}")){
            while($row = $query->fetch_assoc()) {
                $data[] = $row;
            }
        }
        echo json_encode($data);
    }
}