-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 15, 2018 at 06:08 PM
-- Server version: 5.7.24-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ShoppingCart`
--

-- --------------------------------------------------------

--
-- Table structure for table `Cart`
--

CREATE TABLE `Cart` (
  `CartId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

CREATE TABLE `Category` (
  `CategoryId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ParentId` int(11) DEFAULT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Coupon`
--

CREATE TABLE `Coupon` (
  `CouponId` int(11) NOT NULL,
  `Code` varchar(255) NOT NULL,
  `Description` text,
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  `Value` float DEFAULT NULL,
  `StartDate` timestamp NULL DEFAULT NULL,
  `EndDate` timestamp NULL DEFAULT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Login`
--

CREATE TABLE `Login` (
  `LoginId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Userame` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `OrderProduct`
--

CREATE TABLE `OrderProduct` (
  `OrderProductId` int(11) NOT NULL,
  `SalesOrderId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `ProductCode` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text,
  `Price` float DEFAULT NULL,
  `Quantity` int(11) NOT NULL DEFAULT '0',
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `ProductId` int(11) NOT NULL,
  `ProductCode` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text,
  `Price` float DEFAULT NULL,
  `Quantity` int(11) DEFAULT '0',
  `Created_by` int(11) DEFAULT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_by` int(11) DEFAULT NULL,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`ProductId`, `ProductCode`, `Name`, `Description`, `Price`, `Quantity`, `Created_by`, `Created_date`, `Modified_by`, `Modified_date`) VALUES
(1, 'axcjklsdfg', 'Product 1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 10, 0, 1, '2018-12-12 21:08:58', NULL, '2018-12-12 21:12:36'),
(2, 'akjdfpcmrb', 'Product 2', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 12, 10, 1, '2018-12-12 21:11:40', NULL, '2018-12-12 21:12:41'),
(3, 'mnftclexdr', 'Product 3', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 15, 10, 1, '2018-12-12 21:11:40', NULL, '2018-12-12 21:12:47'),
(4, 'edtgzyplb', 'Product 4', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 29, 10, 1, '2018-12-12 21:11:40', NULL, '2018-12-12 21:12:52'),
(5, 'xbsjfyceby', 'Product 5', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 2, 10, 1, '2018-12-12 21:11:40', NULL, '2018-12-12 21:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `ProductCategorie`
--

CREATE TABLE `ProductCategorie` (
  `ProductCategorieId` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ProductTag`
--

CREATE TABLE `ProductTag` (
  `ProductTagId` int(11) NOT NULL,
  `TagId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Role`
--

CREATE TABLE `Role` (
  `RoleId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SalesOrder`
--

CREATE TABLE `SalesOrder` (
  `SalesOrderId` int(11) NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `Total` int(11) DEFAULT NULL,
  `CouponId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Tag`
--

CREATE TABLE `Tag` (
  `TagId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `UserId` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Active` tinyint(1) DEFAULT '1',
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `UserRole`
--

CREATE TABLE `UserRole` (
  `UserRoleId` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Cart`
--
ALTER TABLE `Cart`
  ADD PRIMARY KEY (`CartId`);

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Indexes for table `Coupon`
--
ALTER TABLE `Coupon`
  ADD PRIMARY KEY (`CouponId`);

--
-- Indexes for table `Login`
--
ALTER TABLE `Login`
  ADD PRIMARY KEY (`LoginId`);

--
-- Indexes for table `OrderProduct`
--
ALTER TABLE `OrderProduct`
  ADD PRIMARY KEY (`OrderProductId`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`ProductId`);

--
-- Indexes for table `ProductCategorie`
--
ALTER TABLE `ProductCategorie`
  ADD PRIMARY KEY (`ProductCategorieId`);

--
-- Indexes for table `ProductTag`
--
ALTER TABLE `ProductTag`
  ADD PRIMARY KEY (`ProductTagId`);

--
-- Indexes for table `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indexes for table `SalesOrder`
--
ALTER TABLE `SalesOrder`
  ADD PRIMARY KEY (`SalesOrderId`);

--
-- Indexes for table `Tag`
--
ALTER TABLE `Tag`
  ADD PRIMARY KEY (`TagId`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `UserRole`
--
ALTER TABLE `UserRole`
  ADD PRIMARY KEY (`UserRoleId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Cart`
--
ALTER TABLE `Cart`
  MODIFY `CartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `Category`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Coupon`
--
ALTER TABLE `Coupon`
  MODIFY `CouponId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Login`
--
ALTER TABLE `Login`
  MODIFY `LoginId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `OrderProduct`
--
ALTER TABLE `OrderProduct`
  MODIFY `OrderProductId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `ProductId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ProductCategorie`
--
ALTER TABLE `ProductCategorie`
  MODIFY `ProductCategorieId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ProductTag`
--
ALTER TABLE `ProductTag`
  MODIFY `ProductTagId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Role`
--
ALTER TABLE `Role`
  MODIFY `RoleId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `SalesOrder`
--
ALTER TABLE `SalesOrder`
  MODIFY `SalesOrderId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Tag`
--
ALTER TABLE `Tag`
  MODIFY `TagId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UserRole`
--
ALTER TABLE `UserRole`
  MODIFY `UserRoleId` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
