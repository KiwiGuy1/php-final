<?php

class Car extends Model
{
    public function getAll()
    {
        $stmt = $this->db->query('SELECT * FROM CarInventoryView');
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getById($id)
    {
        $stmt = $this->db->prepare('SELECT * FROM cars WHERE id = :id');
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function search($make = '', $model = '', $year = '', $price = '')
{
    // Start with a base query
    $query = 'SELECT * FROM CarInventoryView WHERE 1=1';

    // Initialize an array to store query parameters
    $params = [];

    // Add filters to the query if they are provided
    if (!empty($make)) {
        $query .= ' AND manufacturer_model LIKE :make';
        $params[':make'] = "%{$make}%";
    }
    if (!empty($model)) {
        $query .= ' AND model_name LIKE :model';
        $params[':model'] = "%{$model}%";
    }
    if (!empty($year)) {
        $query .= ' AND year = :year';
        $params[':year'] = $year;
    }
    if (!empty($price)) {
        $query .= ' AND price <= :price'; 
        $params[':price'] = $price;
    }

    // Prepare the SQL statement
    $stmt = $this->db->prepare($query);

    // Bind parameters dynamically
    foreach ($params as $key => $value) {
        $stmt->bindValue($key, $value);
    }

    // Execute the statement
    try {
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo $e->getMessage();
        return [];
    }
}

}
?>
