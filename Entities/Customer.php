<?php

class Customer {

    public $id_contract;
    public $status;
    public $db;

    public function __construct($id_contract, $status)
    {
        $this->id_contract = $id_contract;
        $this->status = $status;
    }

    public function get_data()
    {
        Database::getInstance();
        $data = array();

        //selecting data for table
        if($result = Database::query("SELECT cust.name_customer, cust.company, cont.number, cont.date_sign
                  FROM obj_customers cust JOIN obj_contracts cont
                  ON cust.id_customer = cont.id_customer
                  WHERE cont.id_contract = {$this->id_contract}
                  OR cust.name_customer = {$this->id_contract}")){

            while($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
        }

        //selecting services from checkbox
        if($query = Database::query("SELECT s.title_service, s.status FROM obj_services s
                  JOIN obj_contracts con
                  ON s.id_contract = con.id_contract
                  JOIN obj_customers c
                  ON con.id_customer = c.id_customer
                  WHERE s.status {$this->status}
                  AND s.id_contract = {$this->id_contract}
                  OR c.name_customer = {$this->id_contract}")){

            while($row = $query->fetch_assoc()) {
                $data[] = $row;
            }
        }
        echo json_encode($data);
    }
}
