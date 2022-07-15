-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 24, 2022 at 07:00 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nodemysql`
--

-- --------------------------------------------------------

--
-- Table structure for table `campEnroll`
--

CREATE TABLE `campEnroll` (
  `name` varchar(20) NOT NULL,
  `age` varchar(10) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `bloodgroup` varchar(10) NOT NULL,
  `date` varchar(60) NOT NULL,
  `place` varchar(50) NOT NULL,
  `campname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `campEnroll`
--

INSERT INTO `campEnroll` (`name`, `age`, `gender`, `phone`, `email`, `bloodgroup`, `date`, `place`, `campname`) VALUES
('Mohammad Munzir', '20', 'Male', '8310559080', 'muzain.ashraf@gmail.com', 'A+ve', 'Tue Feb 22 2022 00:00:00 GMT+0530 (India Standard Time)', 'P A College of Engineering Manglore ', 'pace-camp');

-- --------------------------------------------------------

--
-- Table structure for table `campschedule`
--

CREATE TABLE `campschedule` (
  `name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `time` varchar(10) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `campschedule`
--

INSERT INTO `campschedule` (`name`, `address`, `time`, `date`) VALUES
('joseph-joins', 'st joseph Engineering College Manglore', '10:00', '2022-03-14'),
('lions club', 'lions club panemangaluru B.C.ROAD', '11:00', '2022-01-29'),
('pace-camp', 'P A College of Engineering Manglore ', '9:00', '2022-02-22'),
('sahyadri-camp', 'sahyadri engineering college adyar kannur ,dk', '9:30', '2022-02-10');

-- --------------------------------------------------------

--
-- Table structure for table `Donation`
--

CREATE TABLE `Donation` (
  `amount` int(100) NOT NULL,
  `transaction-id` varchar(20) NOT NULL,
  `name` varchar(25) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Donation`
--

INSERT INTO `Donation` (`amount`, `transaction-id`, `name`, `phone`) VALUES
(200, 'RTTCVB-987', '', ''),
(200, 'RTTCB-1234', '', ''),
(500, 'TTRVD-BVF2', '', ''),
(300, 'RTTBCD-345S', 'Mohammad Munzir', '9844914055');

-- --------------------------------------------------------

--
-- Table structure for table `Hospital`
--

CREATE TABLE `Hospital` (
  `Hosp_id` int(5) NOT NULL,
  `Hosp_name` varchar(20) DEFAULT NULL,
  `Hosp_district` varchar(10) DEFAULT NULL,
  `Hosp_state` varchar(10) DEFAULT NULL,
  `Hosp_address` varchar(50) DEFAULT NULL,
  `availableBlood` varchar(100) DEFAULT NULL,
  `Hosp_category` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Hospital`
--

INSERT INTO `Hospital` (`Hosp_id`, `Hosp_name`, `Hosp_district`, `Hosp_state`, `Hosp_address`, `availableBlood`, `Hosp_category`) VALUES
(101, 'SOMAYAJI HOSPITAL', 'D.K', 'KARNATAKA', 'B.C Road, Mangalore, 574219', 'A+ve:15 B+ve:12 O+ve:25', 'private');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campschedule`
--
ALTER TABLE `campschedule`
  ADD UNIQUE KEY `id` (`name`);

--
-- Indexes for table `Hospital`
--
ALTER TABLE `Hospital`
  ADD PRIMARY KEY (`Hosp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
