-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2019 at 04:29 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_majd_fares_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `phone-Number` int(11) NOT NULL,
  `email` varchar(55) NOT NULL,
  `driving-license-Number` int(11) NOT NULL,
  `Driving-license-issue` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `firstName`, `lastName`, `phone-Number`, `email`, `driving-license-Number`, `Driving-license-issue`) VALUES
(1, 'Constantin', 'Kraft', 545655462, 'ckraft@dgdf.at', 43243, '2000-03-04'),
(2, 'Sam', 'Fares', 342432456, 'sfares@gmail.de', 432345, '2001-09-01'),
(3, 'Marlene', 'Piffl', 353456634, 'mpiffl@ausre.at', 4656543, '2007-01-01'),
(4, 'Leya', 'Fares', 435456657, 'lfares@hotmail.com', 432978, '2012-01-01'),
(5, 'Mar', 'simon', 435467674, 'msimonl@ausre.at', 151515153, '2006-01-01'),
(6, 'Gabi', 'Piffl', 537698345, 'gpiffl@ausre.at', 437812, '2007-01-01'),
(7, 'Vin', 'Diesel', 797979765, 'Vdiesel@hotmail.com', 432978, '2018-01-01'),
(8, 'Roy', 'Fares', 988967761, 'rfares@hotmail.com', 877856, '2018-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(22) NOT NULL,
  `title` varchar(23) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeID`, `firstName`, `lastName`, `title`) VALUES
(1, 'Majd', 'Fares', 'BA'),
(2, 'Maya', 'Assaf', 'MA');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `insuranceID` int(11) NOT NULL,
  `policyNumber` int(11) NOT NULL,
  `description` text NOT NULL,
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`insuranceID`, `policyNumber`, `description`, `cost`) VALUES
(1, 1234, 'Wienerstaedtische', 150),
(2, 1456, 'Allianz', 75);

-- --------------------------------------------------------

--
-- Table structure for table `loction`
--

CREATE TABLE `loction` (
  `loctionID` int(11) NOT NULL,
  `country` varchar(21) NOT NULL,
  `city` varchar(21) NOT NULL,
  `streetAddress` varchar(23) NOT NULL,
  `zip.code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loction`
--

INSERT INTO `loction` (`loctionID`, `country`, `city`, `streetAddress`, `zip.code`) VALUES
(1, 'Syria', 'Damascus', 'alhamra', 4),
(2, 'Syria', 'Damascus', 'victoria', 3),
(131, 'Austria', 'Vienna', 'MariahilfeStaße', 1070),
(132, 'Austria', 'Salzburg', 'st.wolfgang', 431);

-- --------------------------------------------------------

--
-- Table structure for table `rental-office`
--

CREATE TABLE `rental-office` (
  `officeID` int(11) NOT NULL,
  `officeName` varchar(43) NOT NULL,
  `fk_customerID` int(11) NOT NULL,
  `fk_vehicleID` int(11) NOT NULL,
  `fk_employeeID` int(11) NOT NULL,
  `fk_insuranceID` int(11) NOT NULL,
  `start-date` date NOT NULL,
  `end-date` date NOT NULL,
  `fk_pickup-loctionID` int(11) NOT NULL,
  `fk_dropoff-loctionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rental-office`
--

INSERT INTO `rental-office` (`officeID`, `officeName`, `fk_customerID`, `fk_vehicleID`, `fk_employeeID`, `fk_insuranceID`, `start-date`, `end-date`, `fk_pickup-loctionID`, `fk_dropoff-loctionID`) VALUES
(1, 'Super', 1, 1, 1, 1, '2019-03-15', '2019-03-09', 131, 132),
(2, 'Oida', 6, 3, 2, 2, '2019-04-01', '2019-04-03', 132, 131);

-- --------------------------------------------------------

--
-- Table structure for table `rental_invoice`
--

CREATE TABLE `rental_invoice` (
  `invoiceID` int(11) NOT NULL,
  `fk_emp_ID` int(11) NOT NULL,
  `vin-No` int(11) NOT NULL,
  `officeName` varchar(22) NOT NULL,
  `vehicleRental` int(11) NOT NULL,
  `services-Tax` int(11) NOT NULL,
  `insurance-cost-total` int(11) NOT NULL,
  `total-amount-payable` int(11) NOT NULL,
  `discount-amount` float NOT NULL,
  `net-amount-payable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rental_invoice`
--

INSERT INTO `rental_invoice` (`invoiceID`, `fk_emp_ID`, `vin-No`, `officeName`, `vehicleRental`, `services-Tax`, `insurance-cost-total`, `total-amount-payable`, `discount-amount`, `net-amount-payable`) VALUES
(1, 1, 344556, 'Super', 335, 45, 150, 530, 10, 475),
(2, 1, 879876, 'Super', 430, 50, 125, 605, 20, 450);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservationID` int(11) NOT NULL,
  `fk_vehiclecategoryID` int(11) NOT NULL,
  `fk_officeID` int(11) NOT NULL,
  `fk_CusID` int(11) NOT NULL,
  `fk_PickuploctionID` int(11) NOT NULL,
  `fk_Dropoff_loctionID` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservationID`, `fk_vehiclecategoryID`, `fk_officeID`, `fk_CusID`, `fk_PickuploctionID`, `fk_Dropoff_loctionID`, `total`, `date`) VALUES
(1, 6, 2, 0, 131, 132, 300, '2019-05-01'),
(2, 4, 1, 0, 2, 1, 500, '2019-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `vehicleID` int(11) NOT NULL,
  `fk_categoryID` int(11) NOT NULL,
  `fk_loctionID` int(11) NOT NULL,
  `vehicleName` varchar(23) NOT NULL,
  `description` text NOT NULL,
  `vin-No` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`vehicleID`, `fk_categoryID`, `fk_loctionID`, `vehicleName`, `description`, `vin-No`) VALUES
(1, 1, 131, 'BMW', '', 344556),
(2, 6, 132, 'AUDI', '', 879876),
(3, 4, 1, 'BMW', '', 432354);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_category`
--

CREATE TABLE `vehicle_category` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(21) NOT NULL,
  `vehicleName` varchar(22) NOT NULL,
  `vehicleModel` varchar(32) NOT NULL,
  `color` varchar(10) NOT NULL,
  `gearboxType` varchar(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `vehicle-dailyRent` int(11) NOT NULL,
  `faulType` varchar(8) NOT NULL,
  `modelYear` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_category`
--

INSERT INTO `vehicle_category` (`categoryID`, `categoryName`, `vehicleName`, `vehicleModel`, `color`, `gearboxType`, `quantity`, `vehicle-dailyRent`, `faulType`, `modelYear`) VALUES
(1, 'BMW', '1er-line', 'sport', 'Black', 'automatic', 3, 50, 'diesel', '2003-01-01'),
(2, 'BMW', '5er-line', 'Limousine', 'white', 'manual ', 2, 75, 'diesel', '2009-01-10'),
(3, 'BMW', '3er-line', 'sport', 'rose', 'automatic', 9, 50, 'diesel', '2009-01-01'),
(4, 'BMW', '5er-line', 'FamilyVan', 'white', 'manual ', 1, 75, 'diesel', '2010-01-10'),
(5, 'AUDI', 'A4', 'Limousine', 'blue', 'manual ', 5, 100, 'diesel', '2019-01-10'),
(6, 'AUDI', 'A1', 'sport', 'Black', 'automatic', 3, 50, 'diesel', '2004-01-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insuranceID`);

--
-- Indexes for table `loction`
--
ALTER TABLE `loction`
  ADD PRIMARY KEY (`loctionID`);

--
-- Indexes for table `rental-office`
--
ALTER TABLE `rental-office`
  ADD PRIMARY KEY (`officeID`),
  ADD UNIQUE KEY `fk_pickup-loctionID` (`fk_pickup-loctionID`),
  ADD UNIQUE KEY `fk_dropoff-loctionID` (`fk_dropoff-loctionID`),
  ADD KEY `fk_customerID` (`fk_customerID`),
  ADD KEY `fk_employeeID` (`fk_employeeID`),
  ADD KEY `fk_insuranceID` (`fk_insuranceID`),
  ADD KEY `fk_vehicleID` (`fk_vehicleID`);

--
-- Indexes for table `rental_invoice`
--
ALTER TABLE `rental_invoice`
  ADD PRIMARY KEY (`invoiceID`),
  ADD KEY `fk_emp_ID` (`fk_emp_ID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservationID`),
  ADD KEY `fk_office` (`fk_officeID`),
  ADD KEY `fk_vehiclecategoryID` (`fk_vehiclecategoryID`),
  ADD KEY `fk_PickuploctionID` (`fk_PickuploctionID`),
  ADD KEY `fk_dropoff_loctionID` (`fk_Dropoff_loctionID`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`vehicleID`),
  ADD KEY `fk_categoryID` (`fk_categoryID`),
  ADD KEY `fk_loctionID` (`fk_loctionID`);

--
-- Indexes for table `vehicle_category`
--
ALTER TABLE `vehicle_category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rental-office`
--
ALTER TABLE `rental-office`
  ADD CONSTRAINT `fk_customerID` FOREIGN KEY (`fk_customerID`) REFERENCES `customer` (`customerID`),
  ADD CONSTRAINT `fk_dropoff-loctionID` FOREIGN KEY (`fk_dropoff-loctionID`) REFERENCES `loction` (`loctionID`),
  ADD CONSTRAINT `fk_employeeID` FOREIGN KEY (`fk_employeeID`) REFERENCES `employee` (`employeeID`),
  ADD CONSTRAINT `fk_insuranceID` FOREIGN KEY (`fk_insuranceID`) REFERENCES `insurance` (`insuranceID`),
  ADD CONSTRAINT `fk_pickup-loctionID` FOREIGN KEY (`fk_pickup-loctionID`) REFERENCES `loction` (`loctionID`),
  ADD CONSTRAINT `fk_vehicleID` FOREIGN KEY (`fk_vehicleID`) REFERENCES `vehicles` (`vehicleID`);

--
-- Constraints for table `rental_invoice`
--
ALTER TABLE `rental_invoice`
  ADD CONSTRAINT `fk_emp_ID` FOREIGN KEY (`fk_emp_ID`) REFERENCES `employee` (`employeeID`) ON UPDATE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_PickuploctionID` FOREIGN KEY (`fk_PickuploctionID`) REFERENCES `loction` (`loctionID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_dropoff_loctionID` FOREIGN KEY (`fk_Dropoff_loctionID`) REFERENCES `loction` (`loctionID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_office` FOREIGN KEY (`fk_officeID`) REFERENCES `rental-office` (`officeID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vehiclecategoryID` FOREIGN KEY (`fk_vehiclecategoryID`) REFERENCES `vehicle_category` (`categoryID`) ON UPDATE CASCADE;

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `fk_categoryID` FOREIGN KEY (`fk_categoryID`) REFERENCES `vehicle_category` (`categoryID`),
  ADD CONSTRAINT `fk_loctionID` FOREIGN KEY (`fk_loctionID`) REFERENCES `loction` (`loctionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
