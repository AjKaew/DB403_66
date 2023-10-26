-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db403-mysql
-- Generation Time: Oct 26, 2023 at 02:01 AM
-- Server version: 8.1.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_activity`
--
CREATE DATABASE IF NOT EXISTS `student_activity` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `student_activity`;

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activityID` char(4) NOT NULL,
  `activityName` varchar(100) DEFAULT NULL,
  `activityDate` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `majorID` char(2) NOT NULL,
  `majorName` varchar(50) DEFAULT NULL,
  `faculty` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`majorID`, `majorName`, `faculty`) VALUES
('AN', 'การออกแบบเชิงโต้ตอบและการพัฒนาเกม', 'ANT'),
('DB', 'ระบบสารสนเทศเพื่อธุรกิจดิจิทัล', 'CIBA'),
('IB', 'ธุรกิจระหว่างประเทศ', 'CIBA'),
('IT', 'เทคโนโลยีสารสนเทศ', 'CITE'),
('MG', 'การตลาด', 'CIBA'),
('MS', 'การจัดการ', 'CIBA');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `studentID` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `activityID` char(4) NOT NULL,
  `registerDate` date DEFAULT NULL,
  `activityStatus` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentID` char(8) NOT NULL,
  `studentName` varchar(100) DEFAULT NULL,
  `majorID` char(2) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentID`, `studentName`, `majorID`, `password`) VALUES
('66123456', 'สมชาย ที่สุด', 'IT', '$2y$10$IeHVk5uloVUHFQfnpVKxD.Gq0pPI3F40XhdRit0523byOybjeK81q'),
('66123457', 'สมชาย ที่สุดมาก', 'AN', '$2y$10$IeHVk5uloVUHFQfnpVKxD.Gq0pPI3F40XhdRit0523byOybjeK81q'),
('66123458', 'aaaaa', 'IB', '$2y$10$IeHVk5uloVUHFQfnpVKxD.Gq0pPI3F40XhdRit0523byOybjeK81q');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activityID`);

--
-- Indexes for table `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`majorID`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`studentID`,`activityID`),
  ADD KEY `activityID` (`activityID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`),
  ADD KEY `majorID` (`majorID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `register`
--
ALTER TABLE `register`
  ADD CONSTRAINT `register_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`),
  ADD CONSTRAINT `register_ibfk_2` FOREIGN KEY (`activityID`) REFERENCES `activity` (`activityID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`majorID`) REFERENCES `major` (`majorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
