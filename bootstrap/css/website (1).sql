-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2023 at 09:23 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `website`
--

-- --------------------------------------------------------

--
-- Table structure for table `addon_products`
--

CREATE TABLE `addon_products` (
  `addon_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addon_products`
--

INSERT INTO `addon_products` (`addon_id`, `product_name`, `price`) VALUES
(1, 'Private martial arts tuition – per hour', 15),
(2, 'Use of fitness room – per visit', 6),
(3, 'Personal fitness training – per hour', 35);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `subscription_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `features` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`subscription_id`, `name`, `price`, `features`) VALUES
(1, 'Basic', 25.00, '1 martial art\r\n2 sessions per week'),
(2, 'Intermediate ', 35.00, '1 martial art – 3 sessions per week'),
(3, 'Advanced ', 45.00, 'Any 2 martial arts – 5 sessions per week'),
(4, 'Elite', 60.00, 'Unlimited Classes'),
(5, 'Kids', 60.00, 'unlimited classes');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `contact` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `address`, `dob`, `contact`, `email`, `password`, `create_datetime`) VALUES
(1, 'Dolan Garner', 'dekax', 'Illum facilis sunt ', '1979-01-25', '+1 (241) 238-4592', 'syxifeqo@mailinator.com', 'f3ed11bbdb94fd9ebdefbaf646ab94d3', '2023-09-06 08:10:20'),
(2, 'Kylie Emerson', 'sulo', 'Ad nulla dolore plac', '2000-09-07', '+1 (309) 503-1933', 'gebizohoca@mailinator.com', '0b3ed17fda47b10a48f90434335f61cc', '2023-09-06 08:29:37'),
(3, 'Sulochana Poudel', 'sulochana', 'Nayabazar', '2003-08-13', '9815164957', 'sulopoudel606@gmail.com', '352ea5e714456ce9fc09c8862990ddb4', '2023-09-06 10:38:50'),
(4, 'Sajeena', 'Malla', 'Pokhara', '2023-09-22', '9817183924', 'sajeenamalla2@gmail.com', 'd16fb36f0911f878998c136191af705e', '2023-09-06 15:18:04'),
(5, 'Bradley Lowe', 'micun', 'Voluptatem Excepteu', '1985-02-12', '+1 (419) 301-2166', 'nycamapagy@mailinator.com', 'f3ed11bbdb94fd9ebdefbaf646ab94d3', '2023-09-07 13:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_addons`
--

CREATE TABLE `user_addons` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `addons_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `user_subscription_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_subscriptions`
--

INSERT INTO `user_subscriptions` (`user_subscription_id`, `username`, `subscription_id`, `date`) VALUES
(1, 'Sulochana', 1, '2023-09-07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon_products`
--
ALTER TABLE `addon_products`
  ADD PRIMARY KEY (`addon_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`subscription_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_addons`
--
ALTER TABLE `user_addons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addon` (`addons_id`),
  ADD KEY `ueser` (`username`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`user_subscription_id`),
  ADD KEY `sub` (`subscription_id`),
  ADD KEY `user` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon_products`
--
ALTER TABLE `addon_products`
  MODIFY `addon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_addons`
--
ALTER TABLE `user_addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `user_subscription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_addons`
--
ALTER TABLE `user_addons`
  ADD CONSTRAINT `addon` FOREIGN KEY (`addons_id`) REFERENCES `addon_products` (`addon_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ueser` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD CONSTRAINT `sub` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`subscription_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`username`) REFERENCES `users` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
