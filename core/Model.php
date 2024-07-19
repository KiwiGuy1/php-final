<?php

class Model
{
    protected $db;

    public function __construct()
    {
        $config = require_once '../config/db.php';
        $dsn = "mysql:host={$config['host']};dbname={$config['dbname']}";
        $this->db = new PDO($dsn, $config['username'], $config['password']);
        $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
}
?>
