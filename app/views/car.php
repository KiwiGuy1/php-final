<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Car Details</title>
</head>
<body>
    <h1><?php echo $car['make'] . ' ' . $car['model']; ?></h1>
    <p>Seller ID: <?php echo $car['seller_id']; ?></p>
    <a href="/car/list">Back to List</a>
</body>
</html>
