-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2021 at 08:58 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hostel`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb1_admin`
--

CREATE TABLE `tb1_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `First_name` varchar(100) NOT NULL,
  `Last_name` varchar(100) NOT NULL,
  `Username` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb1_admin`
--

INSERT INTO `tb1_admin` (`id`, `First_name`, `Last_name`, `Username`, `password`) VALUES
(1, 'Sugar', 'Cup', 'pie', 'ruchi');

-- --------------------------------------------------------

--
-- Table structure for table `tb1_category`
--

CREATE TABLE `tb1_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `types` varchar(150) NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL,
  `image_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb1_category`
--

INSERT INTO `tb1_category` (`id`, `title`, `types`, `featured`, `active`, `image_name`) VALUES
(28, '', '', 'No', 'No', 'Hostel_Category_485.jpg'),
(30, 'Private Hostel', 'Private', 'Yes', 'Yes', 'Hostel_Category_39.jpg'),
(31, 'College Hostel', 'College Hostel', 'Yes', 'Yes', 'Hostel_Category_29.jpg'),
(32, 'PG', 'Pg', 'Yes', 'Yes', 'Hostel_Category_720.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb1_contact`
--

CREATE TABLE `tb1_contact` (
  `id` int(10) UNSIGNED NOT NULL,
  `hostels` varchar(150) NOT NULL,
  `fees` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL,
  `gender` text NOT NULL,
  `pg` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb1_hostels_pg`
--

CREATE TABLE `tb1_hostels_pg` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `fees` decimal(10,2) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `featured` varchar(10) NOT NULL,
  `active` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb1_hostels_pg`
--

INSERT INTO `tb1_hostels_pg` (`id`, `title`, `description`, `fees`, `image_name`, `category_id`, `featured`, `active`) VALUES
(4, 'DY Patil Girls Hostel', 'Morning Breakfast, Afternoon Lunch, Evening Breakfast, Dinnner.Warm Luke Water 6-8.In Entry 8 pm.', '60000.00', 'Hostel4519.jpg', 31, 'Yes', 'Yes'),
(5, 'Angel Paradise', 'Morning Breakfast, Afternoon Lunch, Dinner.\r\nIn time 9 pm.', '53000.00', 'Hostel6935.jpg', 30, 'Yes', 'Yes'),
(6, 'Twinning', 'Boys Pg. Morning Breakfast, Dinner\r\nTwo Bachlores. Entry 10 pm.\r\n24/7 Water supply', '6000.00', 'Hostel2689.jpg', 32, 'Yes', 'Yes'),
(7, 'Addas', 'Girls Pg, Morning breakfast, Dinner\r\n3 Girls at a time. 24/7 Water supply.\r\nEntry 8:30pm', '8000.00', 'Hostel1900.jpg', 32, 'Yes', 'Yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb1_admin`
--
ALTER TABLE `tb1_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb1_category`
--
ALTER TABLE `tb1_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb1_contact`
--
ALTER TABLE `tb1_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb1_hostels_pg`
--
ALTER TABLE `tb1_hostels_pg`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb1_admin`
--
ALTER TABLE `tb1_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb1_category`
--
ALTER TABLE `tb1_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tb1_contact`
--
ALTER TABLE `tb1_contact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb1_hostels_pg`
--
ALTER TABLE `tb1_hostels_pg`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
