<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sell a Car</title>
</head>
<body>
    <h1>Sell a Car</h1>
    <form action="/sell/add" method="POST">
        <label for="make">Make:</label>
        <input type="text" name="make" id="make">
        <label for="model">Model:</label>
        <input type="text" name="model" id="model">
        <label for="seller_id">Seller ID:</label>
        <input type="text" name="seller_id" id="seller_id">
        <button type="submit">Add Car</button>
    </form>
</body>
</html>
