-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 20, 2024 at 03:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `used_car_site`
--

-- --------------------------------------------------------

--
-- Table structure for table `CarInventory`
--

CREATE TABLE `CarInventory` (
  `id` int(11) NOT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `mileage` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CarInventory`
--

INSERT INTO `CarInventory` (`id`, `manufacturer_id`, `model_id`, `seller_id`, `year`, `price`, `mileage`, `description`) VALUES
(1, 1, 1, 1, 2020, 24000.00, 15000, 'Well-maintained Toyota Camry with low mileage.'),
(2, 1, 2, 2, 2019, 18000.00, 30000, 'Reliable Toyota Corolla, great for daily commute.'),
(3, 2, 3, 3, 2018, 28000.00, 40000, 'Ford F-150, perfect for heavy-duty tasks.'),
(4, 3, 4, 1, 2021, 22000.00, 10000, 'Honda Civic, almost new and fuel-efficient.'),
(5, 3, 5, 4, 2017, 19000.00, 50000, 'Honda Accord, spacious and comfortable.'),
(6, 4, 6, 2, 2016, 25000.00, 60000, 'Chevrolet Silverado, strong and durable.'),
(7, 5, 7, 3, 2019, 20000.00, 35000, 'Nissan Altima, smooth ride and well-maintained.');

-- --------------------------------------------------------

--
-- Stand-in structure for view `CarInventoryView`
-- (See below for the actual view)
--
CREATE TABLE `CarInventoryView` (
`car_id` int(11)
,`manufacturer_name` varchar(100)
,`model_id` int(11)
,`model_name` varchar(100)
,`year` int(11)
,`price` decimal(10,2)
,`seller_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `Manufacturer`
--

CREATE TABLE `Manufacturer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Manufacturer`
--

INSERT INTO `Manufacturer` (`id`, `name`) VALUES
(1, 'Toyota'),
(2, 'Ford'),
(3, 'Honda'),
(4, 'Chevrolet'),
(5, 'Nissan');

-- --------------------------------------------------------

--
-- Table structure for table `Models`
--

CREATE TABLE `Models` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `manufacturer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Models`
--

INSERT INTO `Models` (`id`, `name`, `manufacturer_id`) VALUES
(1, 'Camry', 1),
(2, 'Corolla', 1),
(3, 'F-150', 2),
(4, 'Civic', 3),
(5, 'Accord', 3),
(6, 'Silverado', 4),
(7, 'Altima', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Sellers`
--

CREATE TABLE `Sellers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_info` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Sellers`
--

INSERT INTO `Sellers` (`id`, `name`, `contact_info`) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com'),
(3, 'Auto Dealer Inc.', 'contact@autodealer.com'),
(4, 'Cars4You', 'info@cars4you.com');

-- --------------------------------------------------------

--
-- Structure for view `CarInventoryView`
--
DROP TABLE IF EXISTS `CarInventoryView`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `CarInventoryView`  AS SELECT `CarInventory`.`id` AS `car_id`, `Manufacturer`.`name` AS `manufacturer_name`, `Models`.`id` AS `model_id`, `Models`.`name` AS `model_name`, `CarInventory`.`year` AS `year`, `CarInventory`.`price` AS `price`, `Sellers`.`name` AS `seller_name` FROM (((`CarInventory` join `Manufacturer` on(`CarInventory`.`manufacturer_id` = `Manufacturer`.`id`)) join `Models` on(`CarInventory`.`model_id` = `Models`.`id`)) join `Sellers` on(`CarInventory`.`seller_id` = `Sellers`.`id`)) ORDER BY `CarInventory`.`year` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CarInventory`
--
ALTER TABLE `CarInventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manufacturer_id` (`manufacturer_id`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `Manufacturer`
--
ALTER TABLE `Manufacturer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Models`
--
ALTER TABLE `Models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manufacturer_id` (`manufacturer_id`);

--
-- Indexes for table `Sellers`
--
ALTER TABLE `Sellers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `CarInventory`
--
ALTER TABLE `CarInventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Manufacturer`
--
ALTER TABLE `Manufacturer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Models`
--
ALTER TABLE `Models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Sellers`
--
ALTER TABLE `Sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CarInventory`
--
ALTER TABLE `CarInventory`
  ADD CONSTRAINT `CarInventory_ibfk_1` FOREIGN KEY (`manufacturer_id`) REFERENCES `Manufacturer` (`id`),
  ADD CONSTRAINT `CarInventory_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `Models` (`id`),
  ADD CONSTRAINT `CarInventory_ibfk_3` FOREIGN KEY (`seller_id`) REFERENCES `Sellers` (`id`);

--
-- Constraints for table `Models`
--
ALTER TABLE `Models`
  ADD CONSTRAINT `Models_ibfk_1` FOREIGN KEY (`manufacturer_id`) REFERENCES `Manufacturer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
