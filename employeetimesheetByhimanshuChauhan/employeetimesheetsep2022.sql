-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2022 at 06:23 AM
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
-- Database: `employeetimesheetsep2022`
--

-- --------------------------------------------------------

--
-- Table structure for table `employeemaster`
--

CREATE TABLE `employeemaster` (
  `Id` int(11) NOT NULL,
  `EmpCode` varchar(20) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Department` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employeemaster`
--

INSERT INTO `employeemaster` (`Id`, `EmpCode`, `FirstName`, `LastName`, `Department`) VALUES
(1, 'EmpCode001', 'Adem', 'Arslan', 'Management'),
(2, 'EmpCode002', 'Emre', 'Demirci', 'Finance'),
(3, 'EmpCode003', 'Ecrin', 'Ozdemir', 'Technical'),
(4, 'EmpCode004', 'Zeynep', 'Yilmaz', 'Management'),
(5, 'EmpCode005', 'Deniz', 'Aksoy', 'Technical');

-- --------------------------------------------------------

--
-- Table structure for table `milestone`
--

CREATE TABLE `milestone` (
  `Id` int(11) NOT NULL,
  `ProjectId` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `milestone`
--

INSERT INTO `milestone` (`Id`, `ProjectId`, `Name`) VALUES
(1, 1, 'Inventory'),
(2, 1, 'Assigning Assets '),
(3, 2, 'Homepage Design'),
(4, 2, 'creating logo and mailers'),
(5, 3, 'mining data'),
(6, 3, 'deletion of junk data'),
(7, 4, 'Promotion '),
(8, 4, 'creating ads');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `Id` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`Id`, `Name`) VALUES
(1, 'Assets Management'),
(2, 'Graphic Designing'),
(3, 'Data Mining'),
(4, 'Marketing');

-- --------------------------------------------------------

--
-- Table structure for table `timesheet`
--

CREATE TABLE `timesheet` (
  `Id` int(11) NOT NULL,
  `ProjectId` int(11) NOT NULL,
  `MilestoneId` int(11) NOT NULL,
  `TaskName` varchar(50) NOT NULL,
  `LoggedHours` time NOT NULL,
  `TimesheetDate` date NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Empid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timesheet`
--

INSERT INTO `timesheet` (`Id`, `ProjectId`, `MilestoneId`, `TaskName`, `LoggedHours`, `TimesheetDate`, `Description`, `Empid`) VALUES
(1, 1, 2, 'Testing Reports', '01:00:00', '2022-09-01', '2 Reports pending', 1),
(13, 4, 8, 'himanshu', '13:00:00', '2022-09-18', 'best practice', 5),
(14, 2, 4, 'programming', '14:03:00', '2022-09-17', 'delay', 3),
(15, 2, 4, 'painting', '14:17:00', '2022-09-25', 'best painter', 4),
(20, 1, 2, 'himanshu', '14:38:00', '2022-09-09', 'sdfasdf', 1),
(22, 1, 2, 'programming', '14:44:00', '2022-09-11', 'dfgdf', 1),
(24, 2, 4, 'himanshu', '14:54:00', '2022-09-03', 'best practice', 1),
(25, 3, 6, 'test user', '14:05:00', '2022-09-11', 'let', 3),
(26, 4, 8, 'programming', '01:21:00', '2022-09-17', 'I am dot programmer', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employeemaster`
--
ALTER TABLE `employeemaster`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `milestone`
--
ALTER TABLE `milestone`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `timesheet`
--
ALTER TABLE `timesheet`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employeemaster`
--
ALTER TABLE `employeemaster`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `milestone`
--
ALTER TABLE `milestone`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `timesheet`
--
ALTER TABLE `timesheet`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
