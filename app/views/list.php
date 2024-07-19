<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List of Cars</title>
</head>
<body>
    <h1>List of Cars</h1>
    <ul>
        <?php foreach ($cars as $car): ?>
            <li><a href="/car/view/<?php echo $car['id']; ?>"><?php echo $car['make'] . ' ' . $car['model']; ?></a></li>
        <?php endforeach; ?>
    </ul>
</body>
</html>