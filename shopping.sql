-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2024 at 05:24 PM
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
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerId` int(10) NOT NULL,
  `CustomerCode` varchar(255) DEFAULT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `MobileNo` int(10) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `StateCode` int(10) DEFAULT NULL,
  `TownshipCode` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductId` int(10) NOT NULL,
  `ProductCode` varchar(255) DEFAULT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `ProductPrice` int(10) DEFAULT NULL,
  `productCategoryCode` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductId`, `ProductCode`, `ProductName`, `ProductPrice`, `productCategoryCode`) VALUES
(1, '9160', 'Oshi Potato chips', 37, 1),
(2, '9304', 'Red Bull', 5, 2),
(3, '9646', 'Pocky Chocolate Stick', 23, 1),
(4, '8922', 'Pepsi', 5, 2),
(5, '8058', 'Mogu Mogu Orange', 91, 2),
(6, '9346', 'Oreo', 20, 1),
(7, '6667', 'Biogesic', 10, 3),
(8, '9821', 'Civit', 15, 3),
(9, '1483', 'Pond\'s black', 199, 4),
(10, '6747', 'Nivea blue', 169, 4),
(12, '6747', 'Nivea pink', 169, 4);

-- --------------------------------------------------------

--
-- Table structure for table `productcategory`
--

CREATE TABLE `productcategory` (
  `ProductCategoryId` int(10) NOT NULL,
  `productCategoryCode` int(10) DEFAULT NULL,
  `ProductCategoryName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productcategory`
--

INSERT INTO `productcategory` (`ProductCategoryId`, `productCategoryCode`, `ProductCategoryName`) VALUES
(1, 1, 'Snacks and Chips'),
(2, 2, 'Beverages'),
(3, 3, 'Medicine'),
(4, 4, 'Personal Care Items'),
(5, 5, 'Alcohol');

-- --------------------------------------------------------

--
-- Table structure for table `saleinvoice`
--

CREATE TABLE `saleinvoice` (
  `SaleInvoiceId` int(10) NOT NULL,
  `SaleInvoiceDateTime` date DEFAULT NULL,
  `VoucherNo` int(10) DEFAULT NULL,
  `TotalAmount` int(10) DEFAULT NULL,
  `Discount` int(10) DEFAULT NULL,
  `StaffCode` int(10) DEFAULT NULL,
  `Tax` int(10) DEFAULT NULL,
  `PaymentType` varchar(255) DEFAULT NULL,
  `CustomerAccountNo` int(10) DEFAULT NULL,
  `PaymentAmount` int(10) DEFAULT NULL,
  `ReceiveAmount` int(10) DEFAULT NULL,
  `ChangeAmount` int(10) DEFAULT NULL,
  `CustomerCode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saleinvoicedetail`
--

CREATE TABLE `saleinvoicedetail` (
  `SaleInvoiceDetailId` int(10) NOT NULL,
  `VoucherNo` int(10) DEFAULT NULL,
  `ProductCode` varchar(255) DEFAULT NULL,
  `Quantity` int(10) DEFAULT NULL,
  `Price` int(10) DEFAULT NULL,
  `Amount` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `ShopId` int(10) NOT NULL,
  `ShopCode` varchar(255) DEFAULT NULL,
  `ShopName` varchar(255) DEFAULT NULL,
  `MobileNo` int(10) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffId` int(10) NOT NULL,
  `StaffCode` varchar(255) DEFAULT NULL,
  `StaffName` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `MobileNo` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Position` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffId`, `StaffCode`, `StaffName`, `DateOfBirth`, `MobileNo`, `Address`, `Gender`, `Position`) VALUES
(6, '2237', 'Ellswerth Cockings', '2008-08-22', '2313415811', 'PO Box 35841', 'Bigender', 'Support'),
(7, '4820', 'Kelwin Reaman', '2010-10-02', '2153922202', 'PO Box 66462', 'Male', 'Human Resources'),
(8, '6075', 'Kris Simionescu', '2016-03-05', '8322488395', 'Suite 6', 'Male', 'Sales'),
(9, '5825', 'Jenilee Leftwich', '2011-02-11', '9256831913', '4th Floor', 'Female', 'Accounting'),
(10, '2953', 'Jesus Wetherburn', '2016-06-28', '7743928808', '15th Floor', 'Male', 'Accounting'),
(11, '8842', 'Wilt Sherr', '2018-02-05', '9373010934', 'Room 834', 'Male', 'Business Development'),
(12, '2008', 'Jocelyne Feavers', '2020-01-17', '8722479446', 'Room 808', 'Female', 'Sales'),
(13, '9109', 'Lucas Rumbelow', '2017-06-25', '8371406948', 'PO Box 46455', 'Male', 'Marketing'),
(14, '7856', 'Angel Sloley', '2016-01-22', '9493792605', 'Apt 333', 'Female', 'Marketing'),
(15, '9738', 'Dilly Remer', '2002-04-20', '4735315350', 'PO Box 88141', 'Male', 'Sales'),
(16, '6496', 'Pansie Presslie', '2001-12-24', '2095694424', 'Apt 54', 'Female', 'Business Development'),
(17, '4092', 'Hasheem Biddlecombe', '2012-06-25', '4563487343', 'Apt 200', 'Male', 'Legal'),
(18, '3222', 'Doy Riha', '2017-11-27', '4167279344', '1st Floor', 'Male', 'Legal'),
(19, '7527', 'Dex Hastelow', '2016-11-16', '5945224119', 'Suite 48', 'Male', 'Legal'),
(20, '5931', 'Philipa Segot', '2017-03-17', '9736556099', 'PO Box 20176', 'Female', 'Research and Development'),
(21, '2480', 'Burlie Akett', '2006-04-02', '4135691033', '9th Floor', 'Male', 'Engineering'),
(22, '7343', 'Darby Scutt', '2018-02-06', '9175038825', 'Suite 90', 'Male', 'Accounting'),
(23, '6638', 'Rhianna Burwell', '2017-07-26', '5573347107', 'Room 1612', 'Female', 'Business Development');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerId`),
  ADD UNIQUE KEY `CustomerCode` (`CustomerCode`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductId`),
  ADD KEY `FK_product_productCategoryCode` (`productCategoryCode`);

--
-- Indexes for table `productcategory`
--
ALTER TABLE `productcategory`
  ADD PRIMARY KEY (`ProductCategoryId`),
  ADD UNIQUE KEY `ProductCategoryCode` (`productCategoryCode`);

--
-- Indexes for table `saleinvoice`
--
ALTER TABLE `saleinvoice`
  ADD PRIMARY KEY (`SaleInvoiceId`),
  ADD UNIQUE KEY `VoucherNo` (`VoucherNo`);

--
-- Indexes for table `saleinvoicedetail`
--
ALTER TABLE `saleinvoicedetail`
  ADD PRIMARY KEY (`SaleInvoiceDetailId`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`ShopId`),
  ADD UNIQUE KEY `ShopCode` (`ShopCode`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffId`),
  ADD UNIQUE KEY `StaffCode` (`StaffCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `productcategory`
--
ALTER TABLE `productcategory`
  MODIFY `ProductCategoryId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `saleinvoice`
--
ALTER TABLE `saleinvoice`
  MODIFY `SaleInvoiceId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saleinvoicedetail`
--
ALTER TABLE `saleinvoicedetail`
  MODIFY `SaleInvoiceDetailId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `ShopId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_product_productCategoryCode` FOREIGN KEY (`productCategoryCode`) REFERENCES `productcategory` (`productCategoryCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
