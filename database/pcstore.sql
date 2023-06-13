-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2020 at 09:32 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pcstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_ids` text NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` text NOT NULL,
  `description` text NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `image_path` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_ids`, `title`, `author`, `description`, `qty`, `price`, `image_path`, `date_created`) VALUES
(1, '5', 'Asus', 'Graphic Card', 'Asus GTX 1660 Super', 100 , 250 , '2.jpg', now()),
(2, '4', 'Curcial', 'Hard Disk', 'Curcial BX500 240 GB', 100 , 25 , '3.jpg', now()),
(3, '2,11', 'Hyperx', 'Microphone', 'Hyperx Quadcast', 100 , 99 , '5.jpg', now()),
(4, '7', 'Hyperx', 'RAM', 'Hyperx Fury 8 GB', 100 , 20 , '6.jpg', now()),
(5, '6', 'Intel', 'Processor', 'Intel Core i9 9900K', 100 , 350 , '7.jpg', now()),
(6, '8,11', 'MSI', 'Headset', 'Msi DS502', 100 , 50 , '9.jpg', now()),
(7, '12,11', 'Asus', 'Mouse', 'Asus Gladius 2 Core', 100 , 45 , '12.jpg', now()),
(8, '14', 'MSI', 'Cooler', 'Msi Mag Coreliquid 360r', 100 , 100 , '13.jpg', now()),
(9, '1', 'Dell', 'Monitor', 'Dell S2721HGF 144Hz', 100 , 150 , '15.jpg', now()),
(10, '1', 'AORUS', 'Monitor', 'AORUS FI27Q-X 27" 240Hz', 100 , 200 , '16.png', now()),
(11, '6', 'AMD', 'Processor', 'AMD Ryzen 5 3600', 100 , 190 , '17.jpg', now()),
(12, '5', 'Nvidia', 'Graphic Card', 'Nvidia GeForce RTX 2060', 100 , 350 , '18.png', now()),
(13, '8,11', 'Hyperx', 'Headset', 'Hyperx Cloud Alpha', 100 , 89 , '19.jpg', now()),
(14, '9,11', 'XPG', 'Keyboard', 'XPG K10', 100 , 35 , '20.jpg', now()),
(15, '7', 'XPG', 'RAM', 'XPG Lancer 16 GB RGB', 100 , 60 , '8.jpg', now()),
(16, '4', 'WD', 'Hard Disk', 'WD Blue 1TB SATA 6 Gb/s', 100 , 50 , '14.png', now()),
(17, '3', 'Corsair', 'Case', 'Corsair Obsidian 500D', 100 , 85 , '11.png', now()),
(18, '10', 'MSI', 'Motherboard', 'MSI B450 Gaming Wifi', 100 , 110 , '10.jpg', now()),
(19, '13', 'EVGA', 'Power Supply', 'EVGA Power Supply 600w', 100 , 55 , '4.jpg', now()),
(20, '3', 'Asus', 'Case', 'Asus GT501 TUF Case', 100 , 90 , '1.jpg', now()),
(21, '10', 'Gigabyte', 'Motherboard', 'Gigabyte B450M Gaming', 100 , 80 , '36.png', now());
-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `customer_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Monitor', 'Monitor'),
(2, 'Microphone', 'Microphone'),
(3, 'Case', 'Case'),
(4, 'Hard Disk', 'Hard Disk'),
(5, 'Graphic Card', 'Graphic Card'),
(6, 'Processor', 'Processor'),
(7, 'RAM', 'RAM'),
(8, 'Headset', 'Headset'),
(9, 'Keyboard', 'Keyboard'),
(10, 'Motherboard', 'Motherboard'),
(11, 'Accessories', 'Accessories'),
(12, 'Mouse', 'Mouse'),
(13, 'Power Supply', 'Power Supply'),
(14, 'Cooler', 'Cooler');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`, `contact`, `email`, `password`, `date_created`) VALUES
(1, 'sharly fayez', 'address', '01006340213', 'sharly@gmail.com', '123456', now());

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `address` text NOT NULL,
  `total_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `address`, `total_amount`, `status`, `date_created`) VALUES
(1, 1, 'Sample address', 0, 1, now());

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(1, 1, 1, 4, 2500),
(2, 1, 2, 3, 1800);

-- --------------------------------------------------------


--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', '0192023a7bbd73250516f069df18b500', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);


-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
