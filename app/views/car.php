<div class="container">
    <h2>Car Table</h2>
    <table class="table">
        <thead>
            <tr>
                <th>Make</th>
                <th>Model</th>
                <th>Year</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($cars as $car): ?>
                <tr>
                    <td><?php echo $car['manufacturer_name']; ?></td>
                    <td><?php echo $car['model_name']; ?></td>
                    <td><?php echo $car['year']; ?></td>
                    <td><?php echo '$' . number_format($car['price'], 2, ',', '.'); ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>