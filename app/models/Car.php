<?php

class Car extends Model
{
    public function getAll()
    {
        $stmt = $this->db->query('SELECT * FROM cars');
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getById($id)
    {
        $stmt = $this->db->prepare('SELECT * FROM cars WHERE id = :id');
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function add($data)
    {
        $stmt = $this->db->prepare('INSERT INTO cars (make, model, seller_id) VALUES (:make, :model, :seller_id)');
        $stmt->execute([
            'make' => $data['make'],
            'model' => $data['model'],
            'seller_id' => $data['seller_id']
        ]);
    }
}
?>
