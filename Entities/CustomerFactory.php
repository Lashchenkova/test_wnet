<?php

class CustomerFactory{

    private static $customers = array();

    public static function create($id_contract, $status)
    {
        if(!array_key_exists($id_contract, self::$customers)) {
            self::$customers[$id_contract] = new Customer($id_contract, $status);
        }

        return self::$customers[$id_contract];
    }
}
