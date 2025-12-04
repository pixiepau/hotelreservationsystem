-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2025 at 03:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelreservationsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `role` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `role`) VALUES
(1, 'Anne Bautista', 'Receptionist'),
(2, 'Robert Tan', 'Receptionist'),
(3, 'Bianca Belair', 'Staff'),
(4, 'Alexa Lim', 'Manager'),
(5, 'Rhea Yap', 'Front Desk'),
(6, 'Quinn Harley', 'Supervisor');

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `guest_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`guest_id`, `name`, `contact_number`, `email`, `address`) VALUES
(1, 'Keifer Cruz', '09456355789', 'keifer@gmail.com', 'Manila'),
(2, 'Shane Garcia', '09089424514', 'shane@gmail.com', 'Quezon City'),
(3, 'Carlos Mendoza', '09178887765', 'carlos@gmail.com', 'Tanauan City'),
(4, 'Alyssa Gonzales', '09223456781', 'alyssa@yahoo.com', 'Malvar, Batangas'),
(5, 'Rico Santos', '09354441234', 'rico.s@example.com', 'San Jose, Batangas'),
(6, 'Bianca Monteverde', '09193456789', 'bianca.m@gmail.com', 'Cuenca, Batangas'),
(7, 'Mark Velasco', '09981234567', 'markv@gmail.com', 'Sto. Tomas City');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(15) NOT NULL,
  `payment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `reservation_id`, `amount`, `payment_method`, `payment_date`) VALUES
(4, 1, 4000.00, 'Cash', '2025-12-01'),
(5, 2, 4000.00, 'GCash', '2025-12-03'),
(6, 3, 5000.00, 'Cash', '2025-12-13'),
(7, 3, 3200.00, 'Credit Card', '2025-02-01'),
(8, 4, 1200.00, 'Cash', '2025-02-10'),
(9, 5, 4500.00, 'GCash', '2025-02-15'),
(10, 6, 3800.00, 'Debit Card', '2025-03-01'),
(11, 7, 2500.00, 'Cash', '2025-03-05');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `guest_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `reservation_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `guest_id`, `room_id`, `admin_id`, `check_in_date`, `check_out_date`, `reservation_status`) VALUES
(1, 1, 1, 1, '2025-12-01', '2025-12-02', 'Confirmed'),
(2, 1, 2, 1, '2025-12-03', '2025-12-04', 'Confirmed'),
(3, 2, 2, 2, '2025-12-13', '2025-12-14', 'Confirmed'),
(4, 3, 3, 2, '2025-02-01', '2025-02-03', 'Confirmed'),
(5, 4, 4, 1, '2025-02-10', '2025-02-12', 'Pending'),
(6, 5, 5, 3, '2025-02-15', '2025-02-18', 'Confirmed'),
(7, 1, 6, 4, '2025-03-01', '2025-03-02', 'Cancelled'),
(8, 2, 7, 1, '2025-03-05', '2025-03-08', 'Confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `room_type` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Available',
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `room_type`, `price`, `status`, `capacity`) VALUES
(1, 'Standard', 1500.00, 'Available', 2),
(2, 'Deluxe', 2500.00, 'Available', 4),
(3, 'Suite', 4500.00, 'Available', 4),
(4, 'Executive', 3800.00, 'Occupied', 3),
(5, 'Family', 3200.00, 'Available', 6),
(6, 'Single', 1200.00, 'Available', 1),
(7, 'Twin Bed', 1800.00, 'Occupied', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guest_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `guest_id` (`guest_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `guest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`guest_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
