-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 25, 2025 at 03:05 AM
-- Server version: 10.6.21-MariaDB-cll-lve
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kzfmevjj_printcrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile_number` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`) VALUES
(1, '1 Color'),
(2, '2 Color'),
(3, '3 Color'),
(4, '4 Color'),
(5, '5 Color'),
(6, '6 Color'),
(7, '7 Color'),
(8, '8 Color'),
(9, 'Multi Color'),
(10, 'noprinting');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `Name` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Contact` bigint(10) DEFAULT NULL,
  `email` text DEFAULT NULL,
  `website` text DEFAULT NULL,
  `Registerd` date DEFAULT NULL,
  `Valid` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `Name`, `Address`, `Contact`, `email`, `website`, `Registerd`, `Valid`) VALUES
(1, 'Vista Print n Pack', 'Gala no 5, Ground Floor, K T Aspire Industrial Estate Dewan And Shah Udyog Nagar, Golani Naka, Vasai East, Vasai-Virar, Maharashtra 401208', 8108110190, 'info@vistaprintnpack.com', 'https://vistaprintnpack.com', '2024-11-01', '2025-11-23');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `name`, `created_at`, `description`, `updated_at`) VALUES
(1, 'Paper Department', '2024-11-18 20:14:40', 'Paper Department', '2024-11-22 08:51:29'),
(2, 'Printer Department', '2024-11-18 20:15:02', 'Printer Department', NULL),
(3, 'Plate Department', '2024-11-18 20:15:20', 'Plate Department', NULL),
(4, 'Lamination Department', '2024-11-18 20:15:40', 'Lamination Department', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lamination_types`
--

CREATE TABLE `lamination_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lamination_types`
--

INSERT INTO `lamination_types` (`id`, `name`) VALUES
(1, 'Glossy'),
(2, 'Matte'),
(4, 'Velvet'),
(5, 'direct punching'),
(6, 'Warnish'),
(7, 'Dripoff');

-- --------------------------------------------------------

--
-- Table structure for table `paper_qualities`
--

CREATE TABLE `paper_qualities` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paper_qualities`
--

INSERT INTO `paper_qualities` (`id`, `name`) VALUES
(7, 'FBB BOARD'),
(8, 'ITC CYBER EXCEL (CREAM)'),
(9, 'ITC CARTIN lUMINA (WHITE)'),
(10, 'JK TUFF COAT (CREAM )'),
(11, 'JK ULTIMA (WHITE)'),
(12, 'ITC SAFAIRE GRAPHIC (WHITE)'),
(13, 'Artcard');

-- --------------------------------------------------------

--
-- Table structure for table `paper_sizes`
--

CREATE TABLE `paper_sizes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paper_sizes`
--

INSERT INTO `paper_sizes` (`id`, `name`) VALUES
(1, 'A4'),
(2, 'A3'),
(3, 'Letter'),
(4, 'Legal');

-- --------------------------------------------------------

--
-- Table structure for table `plate_types`
--

CREATE TABLE `plate_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plate_types`
--

INSERT INTO `plate_types` (`id`, `name`) VALUES
(1, 'Offset'),
(4, 'Digital');

-- --------------------------------------------------------

--
-- Table structure for table `printing_types`
--

CREATE TABLE `printing_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `printing_types`
--

INSERT INTO `printing_types` (`id`, `name`) VALUES
(1, 'Offset'),
(2, 'Secreen Printing'),
(3, 'noprinting'),
(4, 'noprinting');

-- --------------------------------------------------------

--
-- Table structure for table `processes`
--

CREATE TABLE `processes` (
  `process_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `status` enum('Pending','In Progress','Completed') DEFAULT 'Pending',
  `assigned_to` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_tasks`
--

CREATE TABLE `sub_tasks` (
  `sub_task_id` int(11) NOT NULL,
  `main_task_id` int(11) NOT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('Pending','In Progress','Completed','Cancel') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `delivery_date` date NOT NULL,
  `assigned_to_department` int(11) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `admin_comment` text DEFAULT NULL,
  `admin_updated_on` datetime DEFAULT NULL,
  `manager_comment` text DEFAULT NULL,
  `manager_updated_on` datetime DEFAULT NULL,
  `user_comment` text DEFAULT NULL,
  `user_updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_tasks`
--

INSERT INTO `sub_tasks` (`sub_task_id`, `main_task_id`, `assigned_to`, `description`, `status`, `created_at`, `updated_at`, `delivery_date`, `assigned_to_department`, `completed_at`, `admin_comment`, `admin_updated_on`, `manager_comment`, `manager_updated_on`, `user_comment`, `user_updated_on`) VALUES
(3, 1, 4, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Completed', '2024-11-25 06:24:13', '2025-01-10 18:16:37', '2024-11-28', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(4, 1, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-11-25 06:24:13', '2025-01-10 18:16:48', '2024-11-28', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(5, 2, 11, 'Paper Quality: FBB BOARD\r\nPaper Size: 25 x 28\r\nPaper GSM: 330\r\nPaper Quantity: 2600\r\n        ', 'Completed', '2024-11-25 06:50:27', '2024-12-19 07:24:19', '0000-00-00', 1, '2024-12-19 07:24:19', NULL, NULL, NULL, NULL, '', NULL),
(6, 2, 12, 'Paper Quality: FBB BOARD\r\nPaper Size: 25 x 28\r\nPaper GSM: 330\r\nPaper Quantity: 2600\r\n\r\nPaper Vendor: shubhampaper\r\nCutting Size: 14 x 25\r\nPrinting Quantity: 5200\r\nPrinting Type: Offset\r\nColor: 2 Color', 'Completed', '2024-11-25 06:50:27', '2025-01-15 11:08:03', '2024-12-27', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(7, 2, 14, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Completed', '2024-11-25 06:50:27', '2025-01-15 11:08:14', '2024-12-27', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(8, 2, 13, 'Lamination Type: Matte\r\nUV: no\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-11-25 06:50:27', '2025-01-15 11:08:21', '2024-12-28', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(9, 3, 11, 'Paper Quality: FBB BOARD\r\nPaper Size: 30 x 36\r\nPaper GSM: 330\r\nPaper Quantity: 2600\r\n\r\nDilvary @ KT ASPIRE        ', 'Completed', '2024-11-25 07:01:52', '2024-12-19 07:24:32', '0000-00-00', 1, '2024-12-19 07:24:32', NULL, NULL, NULL, NULL, '', NULL),
(10, 3, 15, 'Paper Quality: FBB BOARD\r\nPaper Size: 30 x 36\r\nPaper GSM: 330\r\nPaper Quantity: 2600\r\n\r\nPaper Vendor: shubhampaper\r\nCutting Size: 18 x 30\r\nPrinting Quantity: 5200\r\nPrinting Type: Offset\r\nColor: 1 Color', 'Completed', '2024-11-25 07:01:52', '2025-01-15 11:08:31', '2024-11-26', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(11, 3, 14, 'Plate Type: Offset\r\nDeliver to Printer: noprinting', 'Completed', '2024-11-25 07:01:52', '2025-01-15 11:08:38', '2024-11-27', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(12, 3, 13, 'Lamination Type: direct punching\r\nUV: no\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-11-25 07:01:52', '2025-01-15 11:08:44', '2024-11-28', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(13, 5, 16, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 25x35\r\nPaper GSM: 320\r\nPaper Quantity: 1750\r\n        ', 'Completed', '2024-11-26 08:54:44', '2025-01-13 06:44:53', '2024-11-27', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(14, 5, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 25x35\r\nPaper GSM: 320\r\nPaper Quantity: 1750\r\n\r\nPaper Vendor: instock\r\nCutting Size: 25x17.5\r\nPrinting Quantity: 3500\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-11-26 08:54:44', '2025-01-13 06:44:30', '2024-11-28', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(15, 5, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Completed', '2024-11-26 08:54:44', '2025-01-13 06:45:17', '2024-11-27', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(16, 5, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: old\r\nPunching: old\r\n        ', 'Completed', '2024-11-26 08:54:44', '2025-01-13 06:45:32', '2024-12-05', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(17, 6, 16, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 25x35\r\nPaper GSM: 320\r\nPaper Quantity: 2600\r\n        ', 'Completed', '2024-11-26 09:05:10', '2025-01-13 06:38:41', '2024-11-27', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(18, 6, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 25x35\r\nPaper GSM: 320\r\nPaper Quantity: 2600\r\n\r\nPaper Vendor: instock\r\nCutting Size: 25x17.5\r\nPrinting Quantity: 5200\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-11-26 09:05:10', '2025-01-13 06:39:32', '2024-11-28', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(19, 6, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Completed', '2024-11-26 09:05:10', '2025-01-13 06:39:43', '2024-11-27', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(20, 6, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Completed', '2024-11-26 09:05:10', '2025-01-13 06:39:54', '2024-12-05', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(21, 7, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 18 x 26\r\nPaper GSM: 350\r\nPaper Quantity: 1000\r\n        ', 'Completed', '2024-11-26 09:29:36', '2024-11-27 11:39:27', '0000-00-00', 1, '2024-11-27 11:39:27', NULL, NULL, NULL, NULL, '', NULL),
(22, 7, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 18 x 26\r\nPaper GSM: 350\r\nPaper Quantity: 800\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 24 x 14.65\r\nPrinting Quantity: 800\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-11-26 09:29:36', '2025-01-15 11:10:20', '2024-11-28', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(23, 7, 14, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Completed', '2024-11-26 09:29:36', '2025-01-15 11:10:26', '2024-11-27', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(24, 7, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: old\r\nPunching: old\r\n        ', 'Completed', '2024-11-26 09:29:36', '2025-01-13 06:47:34', '2024-12-05', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(25, 8, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 27 x 21.8\r\nPaper GSM: 340\r\nPaper Quantity: 7909\r\n\r\n@Metar Printer', 'Completed', '2024-11-27 06:12:58', '2024-11-27 11:39:34', '0000-00-00', 1, '2024-11-27 11:39:34', NULL, NULL, NULL, NULL, '', NULL),
(26, 8, 18, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 27 x 21.8\r\nPaper GSM: 340\r\nPaper Quantity: 7900\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 27 x 21.8\r\nPrinting Quantity: 5200\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-11-27 06:12:58', '2025-01-29 10:39:22', '2024-12-03', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(27, 8, 9, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Completed', '2024-11-27 06:12:58', '2025-01-29 10:39:30', '2024-11-28', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(28, 8, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Completed', '2024-11-27 06:12:58', '2025-01-29 10:39:35', '2024-12-06', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(29, 9, 16, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 27 x 21.8\r\nPaper GSM: 340\r\nPaper Quantity: 7900\r\n        ', 'Completed', '2024-11-27 06:19:30', '2025-01-29 10:39:54', '2024-11-30', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(30, 9, 18, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 27 x 21.8\r\nPaper GSM: 340\r\nPaper Quantity: 7900\r\n\r\nPaper Vendor: instock\r\nCutting Size: 27 x 21.8\r\nPrinting Quantity: 2700\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-11-27 06:19:30', '2025-01-29 10:40:00', '2024-12-03', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(31, 9, 9, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Completed', '2024-11-27 06:19:30', '2025-01-29 10:40:07', '2024-11-28', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(32, 9, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Completed', '2024-11-27 06:19:30', '2025-01-29 10:40:12', '2024-12-06', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(33, 10, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 28.7 x 34.5\r\nPaper GSM: 350\r\nPaper Quantity: 400\r\n\r\n@Metar', 'Completed', '2024-11-27 06:38:34', '2024-11-27 11:39:44', '0000-00-00', 1, '2024-11-27 11:39:44', NULL, NULL, NULL, NULL, '', NULL),
(34, 10, 18, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 28.7 x 34.5\r\nPaper GSM: 350\r\nPaper Quantity: 400\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 33 x 13.62\r\nPrinting Quantity: 650\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-11-27 06:38:34', '2025-01-13 06:46:04', '2024-12-03', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(35, 10, 9, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Completed', '2024-11-27 06:38:34', '2025-01-13 06:46:30', '2024-11-28', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(36, 10, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Completed', '2024-11-27 06:38:34', '2025-01-13 06:46:43', '2024-12-07', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(37, 11, 8, 'Paper Quality: ITC SAFAIRE GRAPHIC (WHITE)\r\nPaper Size: 21.5 x   26.9\r\nPaper GSM: 400\r\nPaper Quantity: 3000\r\n \r\n@Metar', 'Completed', '2024-11-27 06:55:41', '2024-11-27 11:39:55', '0000-00-00', 1, '2024-11-27 11:39:55', NULL, NULL, NULL, NULL, '', NULL),
(38, 11, 18, 'Paper Quality: ITC SAFAIRE GRAPHIC (WHITE)\r\nPaper Size: 21.5 x   26.8\r\nPaper GSM: 400\r\nPaper Quantity: 3000\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 21.5 x 26.8\r\nPrinting Quantity: 1700\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-11-27 06:55:41', '2025-01-20 16:48:34', '2024-12-03', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(39, 11, 9, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Completed', '2024-11-27 06:55:41', '2025-01-20 16:48:18', '2024-11-28', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(40, 11, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Completed', '2024-11-27 06:55:41', '2025-01-13 16:02:10', '2024-12-07', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(41, 12, 2, 'Paper Quality: ITC SAFAIRE GRAPHIC (WHITE)\r\nPaper Size: 21.5 x   26.8\r\nPaper GSM: 400\r\nPaper Quantity: 3000\r\n        @Metar', 'Completed', '2024-11-27 07:07:31', '2025-01-21 15:06:57', '2024-11-30', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(42, 12, 18, 'Paper Quality: ITC SAFAIRE GRAPHIC (WHITE)\r\nPaper Size: 21.5 x   26.8\r\nPaper GSM: 400\r\nPaper Quantity: 3000\r\n\r\nPaper Vendor: paper\r\nCutting Size: 21.5 x 26.8\r\nPrinting Quantity: 650\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-11-27 07:07:31', '2025-01-21 15:07:12', '2024-12-03', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(43, 12, 14, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Completed', '2024-11-27 07:07:31', '2025-01-21 15:07:26', '2024-11-28', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(44, 12, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Completed', '2024-11-27 07:07:31', '2025-01-13 06:47:16', '2024-12-07', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(45, 13, 16, 'Paper Quality: ITC SAFAIRE GRAPHIC (WHITE)\r\nPaper Size: 21.5 x 26.8\r\nPaper GSM: 400\r\nPaper Quantity: 3000\r\n        ', 'Completed', '2024-11-27 07:12:48', '2025-01-21 15:07:52', '2024-11-28', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(46, 13, 18, 'Paper Quality: ITC SAFAIRE GRAPHIC (WHITE)\r\nPaper Size: 21.5 x 26.8\r\nPaper GSM: 400\r\nPaper Quantity: 3000\r\n\r\nPaper Vendor: instock\r\nCutting Size: 21.5 x 26.8\r\nPrinting Quantity: 650\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-11-27 07:12:48', '2025-01-21 15:08:04', '2024-12-03', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(47, 13, 14, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Completed', '2024-11-27 07:12:48', '2025-01-21 15:30:53', '2024-11-28', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(48, 13, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Completed', '2024-11-27 07:12:48', '2025-01-13 16:03:03', '2024-12-07', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(49, 14, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 27 x 20.6\r\nPaper GSM: 340\r\nPaper Quantity: 1000\r\n        @ Shreeji', 'Completed', '2024-11-27 09:17:43', '2024-11-27 11:40:03', '0000-00-00', 1, '2024-11-27 11:40:03', NULL, NULL, NULL, NULL, '', NULL),
(50, 14, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 27 x 20.6\r\nPaper GSM: 340\r\nPaper Quantity: 1000\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 27 x 20.6\r\nPrinting Quantity: 1000\r\nPrinting Type: Offset\r\nColor: 6 Color', 'Completed', '2024-11-27 09:17:43', '2025-01-21 15:31:04', '2024-12-03', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(51, 14, 14, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Completed', '2024-11-27 09:17:43', '2025-01-21 15:31:15', '2024-11-28', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(52, 14, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: old\r\nPunching: old\r\n        ', 'Completed', '2024-11-27 09:17:43', '2025-01-13 16:03:31', '2024-12-07', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(53, 16, 19, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 22 x 29\r\nPaper GSM: 400\r\nPaper Quantity: 9060\r\n        @Metar printer', 'Pending', '2024-11-27 11:53:35', '2024-11-27 11:53:35', '2024-11-30', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 16, 18, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 22 x 29\r\nPaper GSM: 400\r\nPaper Quantity: 9060\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 22 x 29\r\nPrinting Quantity: 7530\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2024-11-27 11:53:35', '2024-11-27 11:53:35', '2024-12-03', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 16, 9, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Pending', '2024-11-27 11:53:35', '2024-11-27 11:53:35', '2024-11-28', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 16, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Completed', '2024-11-27 11:53:35', '2025-01-13 16:04:03', '2024-12-08', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(57, 17, 16, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 22 x 29\r\nPaper GSM: 400\r\nPaper Quantity: 9060\r\n        @Metar', 'Completed', '2024-11-27 11:58:50', '2025-01-21 15:31:45', '2024-11-30', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(58, 17, 18, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 22 x 29\r\nPaper GSM: 400\r\nPaper Quantity: 9060\r\n\r\nPaper Vendor: instock\r\nCutting Size: 22 x 29\r\nPrinting Quantity: 1530\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-11-27 11:58:50', '2025-01-21 15:31:30', '2024-12-03', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(59, 17, 9, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Completed', '2024-11-27 11:58:50', '2025-01-21 15:31:39', '2024-11-28', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(60, 17, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Completed', '2024-11-27 11:58:50', '2025-01-13 16:04:25', '2024-12-08', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(61, 18, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 46 x 36\r\nPaper GSM: 350\r\nPaper Quantity: 500\r\n        @Hiyan', 'Completed', '2024-11-28 11:34:27', '2024-11-29 08:08:57', '0000-00-00', 1, '2024-11-29 08:08:57', NULL, NULL, NULL, NULL, '', NULL),
(62, 18, 15, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 46 x 36\r\nPaper GSM: 350\r\nPaper Quantity: 500\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 1700\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-11-28 11:34:27', '2025-01-23 12:41:44', '2024-12-03', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(63, 18, 9, 'Plate Type: Offset\r\nDeliver to Printer: noprinting', 'Completed', '2024-11-28 11:34:27', '2025-01-23 12:41:58', '2024-11-29', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(64, 18, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Completed', '2024-11-28 11:34:27', '2025-01-13 16:04:51', '2024-12-08', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(65, 18, 20, 'Printing', 'Completed', '2024-11-28 11:38:15', '2025-01-23 12:42:10', '2024-12-04', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(66, 18, 20, 'Printing', 'Completed', '2024-11-28 11:38:21', '2025-01-23 12:42:21', '2024-12-04', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(67, 19, 11, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 18 x 25 / 25 x 36\r\nPaper GSM: 320\r\nPaper Quantity: 2300\r\n        ', 'Completed', '2024-11-29 06:50:34', '2025-01-11 09:10:57', '2024-12-02', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(68, 19, 12, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 18 x 25 / 25 x 36\r\nPaper GSM: 320\r\nPaper Quantity: 2300\r\n\r\nPaper Vendor: shubhampaper\r\nCutting Size: 18 x 25\r\nPrinting Quantity: 2400\r\nPrinting Type: Offset\r\nColor: 2 Color', 'Completed', '2024-11-29 06:50:34', '2025-01-11 09:11:10', '2024-12-05', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(69, 19, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Completed', '2024-11-29 06:50:34', '2025-01-11 09:12:53', '2024-11-30', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(70, 19, 13, 'Lamination Type: Warnish\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Completed', '2024-11-29 06:50:34', '2025-01-11 09:12:58', '2024-12-08', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(71, 20, 11, 'Paper Quality: FBB BOARD\r\nPaper Size: 25 x 38\r\nPaper GSM: 330\r\nPaper Quantity: 1000\r\n@Rameshwar\r\n        ', 'Completed', '2024-11-29 07:00:04', '2025-01-30 05:18:02', '2024-12-02', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(72, 20, 12, 'Paper Quality: FBB BOARD\r\nPaper Size: 25 x 38\r\nPaper GSM: 330\r\nPaper Quantity: 1000\r\n\r\nPaper Vendor: shubhampaper\r\nCutting Size: 19 x 25\r\nPrinting Quantity: 2000\r\nPrinting Type: Offset\r\nColor: 1 Color', 'Completed', '2024-11-29 07:00:04', '2025-01-30 05:18:14', '2024-12-05', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(73, 20, 14, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Completed', '2024-11-29 07:00:04', '2025-01-30 05:18:24', '2024-11-30', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(74, 20, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-11-29 07:00:04', '2025-01-30 05:18:33', '2024-12-08', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(75, 21, 11, 'Paper Quality: FBB BOARD\r\nPaper Size: 23 x 36\r\nPaper GSM: 350\r\nPaper Quantity: 900\r\n        @Rameshwar', 'Completed', '2024-11-29 10:17:08', '2025-01-27 09:02:18', '2024-12-02', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(76, 21, 12, 'Paper Quality: FBB BOARD\r\nPaper Size: 23 x 36\r\nPaper GSM: 350\r\nPaper Quantity: 900\r\n\r\nPaper Vendor: shubhampaper\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 1700\r\nPrinting Type: Offset\r\nColor: 2 Color', 'Completed', '2024-11-29 10:17:08', '2025-01-27 09:02:37', '2024-12-05', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(78, 21, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2024-11-29 10:17:08', '2025-01-13 16:05:24', '2024-12-08', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(79, 22, 11, 'Paper Quality: FBB BOARD\r\nPaper Size: 23 x 36\r\nPaper GSM: 350\r\nPaper Quantity: 900\r\n        ', 'Completed', '2024-11-29 10:25:09', '2025-01-27 09:03:15', '2024-12-02', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(80, 22, 20, 'Paper Quality: FBB BOARD\r\nPaper Size: 23 x 36\r\nPaper GSM: 350\r\nPaper Quantity: 900\r\n\r\nPaper Vendor: shubhampaper\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 600\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-11-29 10:25:09', '2025-01-29 10:36:19', '2024-12-05', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(81, 22, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-11-29 10:25:09', '2025-01-29 10:36:27', '2024-11-30', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(82, 22, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2024-11-29 10:25:09', '2025-01-13 16:05:59', '2024-12-08', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(83, 23, 16, 'Paper Quality: FBB BOARD\r\nPaper Size: 23 x 36\r\nPaper GSM: 350\r\nPaper Quantity: 900\r\n        ', 'Completed', '2024-11-29 10:32:36', '2025-01-29 10:37:00', '2024-12-02', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(84, 23, 20, 'Paper Quality: FBB BOARD\r\nPaper Size: 23 x 36\r\nPaper GSM: 350\r\nPaper Quantity: 900\r\n\r\nPaper Vendor: instock\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 1200\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-11-29 10:32:36', '2025-01-29 10:37:07', '2024-12-05', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(85, 23, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-11-29 10:32:36', '2025-01-29 10:37:11', '2024-11-30', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(86, 23, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-11-29 10:32:36', '2025-01-13 16:06:21', '2024-12-08', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(87, 24, 8, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 36\r\nPaper GSM: 400\r\nPaper Quantity: 400\r\n        @Hiyan', 'Completed', '2024-11-30 06:05:15', '2024-11-30 09:05:40', '0000-00-00', 1, '2024-11-30 09:05:40', NULL, NULL, NULL, NULL, '', NULL),
(88, 24, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 36\r\nPaper GSM: 400\r\nPaper Quantity: 400\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 23.75 x 16.57\r\nPrinting Quantity: 700\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-11-30 06:05:15', '2025-01-29 07:00:25', '2024-12-06', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(89, 24, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-11-30 06:05:15', '2025-01-29 07:00:30', '2024-12-01', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(90, 24, 13, 'Lamination Type: Matte\r\nUV: embossed\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2024-11-30 06:05:15', '2025-01-13 16:06:40', '2024-12-08', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(91, 25, 16, 'Paper Quality: FBB BOARD\r\nPaper Size: 22 x 34\r\nPaper GSM: 320\r\nPaper Quantity: 500\r\n        ', 'Completed', '2024-11-30 08:39:52', '2025-01-29 10:33:43', '2024-12-02', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(92, 25, 20, 'Paper Quality: FBB BOARD\r\nPaper Size: 22 x 34\r\nPaper GSM: 320\r\nPaper Quantity: 500\r\n\r\nPaper Vendor: instock\r\nCutting Size: 17 x 22\r\nPrinting Quantity: 1000\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-11-30 08:39:52', '2025-01-29 10:33:48', '2024-12-04', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(93, 25, 14, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-11-30 08:39:52', '2025-01-29 10:33:53', '2024-12-01', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(94, 25, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-11-30 08:39:52', '2025-01-29 08:23:49', '2024-12-08', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 26, 11, 'Paper Quality: JK TUFF COAT (CREAM )\r\nPaper Size: 31.5 x 22\r\nPaper GSM: 350\r\nPaper Quantity: 1950\r\n@Hiyan\r\n        ', 'Completed', '2024-12-03 06:44:27', '2025-01-29 10:34:27', '2024-12-04', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(96, 26, 20, 'Paper Quality: JK TUFF COAT (CREAM )\r\nPaper Size: 31.5 x 22\r\nPaper GSM: 350\r\nPaper Quantity: 1950\r\n\r\nPaper Vendor: shubhampaper\r\nCutting Size: 15.75 x 22\r\nPrinting Quantity: 2700\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-03 06:44:27', '2025-01-29 10:34:32', '2024-12-08', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(97, 26, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-12-03 06:44:27', '2025-01-29 10:34:37', '2024-12-04', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(98, 26, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-12-03 06:44:27', '2025-01-13 16:07:29', '2024-12-12', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(99, 27, 16, 'Paper Quality: JK TUFF COAT (CREAM )\r\nPaper Size: 31.5 x 22\r\nPaper GSM: 350\r\nPaper Quantity: 1950\r\n        @Hiyan', 'Completed', '2024-12-03 06:48:16', '2025-01-29 10:35:04', '2024-12-04', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(100, 27, 20, 'Paper Quality: JK TUFF COAT (CREAM )\r\nPaper Size: 31.5 x 22\r\nPaper GSM: 350\r\nPaper Quantity: 1950\r\n\r\nPaper Vendor: instock\r\nCutting Size: 15.75 x 22\r\nPrinting Quantity: 1200\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-03 06:48:16', '2025-01-29 10:35:08', '2024-12-08', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(101, 27, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-12-03 06:48:16', '2025-01-29 10:35:13', '2024-12-04', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(102, 27, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-12-03 06:48:16', '2025-01-13 16:08:11', '2024-12-12', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(103, 28, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 23.6 x 36\r\nPaper GSM: 320\r\nPaper Quantity: 1120\r\n        @Rameshwar', 'Completed', '2024-12-03 09:55:12', '2025-01-29 10:32:23', '2024-12-04', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(104, 28, 12, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 23.6 x 36\r\nPaper GSM: 320\r\nPaper Quantity: 1120\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 2233\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-03 09:55:12', '2025-01-29 10:32:28', '2024-12-08', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(105, 28, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Completed', '2024-12-03 09:55:12', '2025-01-29 10:32:33', '2024-12-04', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(106, 28, 13, 'Lamination Type: Dripoff\r\nUV: no\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-12-03 09:55:12', '2025-01-13 16:08:35', '2024-12-12', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(107, 30, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 28,7 X 34,5\r\nPaper GSM: 400\r\nPaper Quantity: 930\r\n        @Magistick printer', 'Completed', '2024-12-03 10:10:14', '2025-01-29 10:31:24', '2024-12-04', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(108, 30, 22, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 28,7 X 34,5\r\nPaper GSM: 400\r\nPaper Quantity: 930\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 17.24 x 26.75\r\nPrinting Quantity: 1860\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-03 10:10:14', '2025-01-29 10:31:28', '2024-12-08', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(109, 30, 9, 'Plate Type: Offset\r\nDeliver to Printer: magistickprinter', 'Completed', '2024-12-03 10:10:14', '2025-01-29 10:31:35', '2024-12-04', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(110, 30, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Completed', '2024-12-03 10:10:14', '2025-01-13 16:09:02', '2024-12-12', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(111, 31, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 28,7 X 26,2\r\nPaper GSM: 400\r\nPaper Quantity: 3000\r\n        @Pushpa', 'Completed', '2024-12-03 10:22:39', '2025-01-29 10:30:02', '2024-12-06', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(112, 31, 23, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 28,7 X 26,2\r\nPaper GSM: 400\r\nPaper Quantity: 3000\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 26.18 x 27.32\r\nPrinting Quantity: 3000\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-03 10:22:39', '2025-01-29 10:30:08', '2024-12-08', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(113, 31, 9, 'Plate Type: Offset\r\nDeliver to Printer: pushpaprinter', 'Completed', '2024-12-03 10:22:39', '2025-01-29 10:30:46', '2024-12-04', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(114, 31, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Completed', '2024-12-03 10:22:39', '2025-01-29 10:30:51', '2024-12-12', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(115, 32, 16, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 28,7 X 26,2\r\nPaper GSM: 400\r\nPaper Quantity: 3000\r\n        @pushpa', 'Completed', '2024-12-03 10:26:47', '2025-01-29 10:16:58', '2024-12-06', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(116, 32, 23, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 28,7 X 26,2\r\nPaper GSM: 400\r\nPaper Quantity: 3000\r\n\r\nPaper Vendor: instock\r\nCutting Size: 26.18 x 27.32\r\nPrinting Quantity: 600\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-03 10:26:47', '2025-01-29 10:17:03', '2024-12-08', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(117, 32, 9, 'Plate Type: Offset\r\nDeliver to Printer: pushpaprinter', 'Completed', '2024-12-03 10:26:47', '2025-01-29 10:17:07', '2024-12-04', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(118, 32, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Completed', '2024-12-03 10:26:47', '2025-01-13 16:10:20', '2024-12-12', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(119, 33, 16, 'Paper Quality: FBB BOARD\r\nPaper Size: 22 x 34\r\nPaper GSM: 320\r\nPaper Quantity: 600\r\n        ', 'Pending', '2024-12-04 09:36:33', '2024-12-04 09:36:33', '2024-12-05', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 33, 12, 'Paper Quality: FBB BOARD\r\nPaper Size: 22 x 34\r\nPaper GSM: 320\r\nPaper Quantity: 600\r\n\r\nPaper Vendor: instock\r\nCutting Size: 17 x 22\r\nPrinting Quantity: 1200\r\nPrinting Type: Offset\r\nColor: 2 Color', 'Pending', '2024-12-04 09:36:33', '2024-12-04 09:36:33', '2024-12-07', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 33, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Pending', '2024-12-04 09:36:33', '2024-12-04 09:36:33', '2024-12-05', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 33, 13, 'Lamination Type: Matte\r\nUV: no\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2024-12-04 09:36:33', '2024-12-04 09:36:33', '2024-12-13', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 34, 16, 'Paper Quality: FBB BOARD\r\nPaper Size: 22 x 34\r\nPaper GSM: 320\r\nPaper Quantity: 243\r\n        ', 'Completed', '2024-12-04 09:44:01', '2025-01-29 07:01:20', '2024-12-05', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(124, 34, 12, 'Paper Quality: FBB BOARD\r\nPaper Size: 22 x 34\r\nPaper GSM: 320\r\nPaper Quantity: 243\r\n\r\nPaper Vendor: instock\r\nCutting Size: 17 x 22\r\nPrinting Quantity: 486\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-04 09:44:01', '2025-01-29 07:01:25', '2024-12-07', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(125, 34, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Completed', '2024-12-04 09:44:01', '2025-01-29 07:01:30', '2024-12-05', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(126, 34, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2024-12-04 09:44:01', '2025-01-13 16:10:53', '2024-12-13', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(127, 35, 21, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 23 x 36\r\nPaper GSM: 400\r\nPaper Quantity: 600\r\n        ', 'Completed', '2024-12-06 07:26:08', '2025-01-29 10:18:48', '2024-12-09', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(128, 35, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 23 x 36\r\nPaper GSM: 400\r\nPaper Quantity: 600\r\n\r\nPaper Vendor: prakashpaper\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 1200\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-06 07:26:08', '2025-01-29 10:18:53', '2024-12-12', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(129, 35, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-12-06 07:26:08', '2025-01-29 10:18:58', '2024-12-07', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(130, 35, 13, 'Lamination Type: Matte\r\nUV: embossed\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-12-06 07:26:08', '2025-01-13 16:11:14', '2024-12-15', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(131, 36, 19, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 22 x 27\r\nPaper GSM: 350\r\nPaper Quantity: 5200\r\n        @Metar', 'Completed', '2024-12-10 09:12:26', '2025-01-29 10:20:41', '2024-12-12', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(132, 36, 18, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 22 x 27\r\nPaper GSM: 350\r\nPaper Quantity: 5200\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 22 x 27\r\nPrinting Quantity: 5200\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-10 09:12:26', '2025-01-29 10:20:46', '2024-12-15', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(133, 36, 9, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Completed', '2024-12-10 09:12:26', '2025-01-29 10:20:50', '2024-12-11', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(134, 36, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Completed', '2024-12-10 09:12:26', '2025-01-29 10:20:54', '2024-12-19', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(135, 37, 8, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 21.5 x 26\r\nPaper GSM: 400\r\nPaper Quantity: 650\r\n        @Hiyan', 'Completed', '2024-12-12 06:40:37', '2025-01-29 10:22:09', '2024-12-15', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(136, 37, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 21.5 x 26\r\nPaper GSM: 400\r\nPaper Quantity: 650\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 21.5 x 26\r\nPrinting Quantity: 650\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-12 06:40:37', '2025-01-29 10:22:15', '2024-12-18', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(137, 37, 14, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-12-12 06:40:37', '2025-01-29 10:22:20', '2024-12-13', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(138, 37, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: old\r\nPunching: old\r\n        ', 'Completed', '2024-12-12 06:40:37', '2025-01-13 16:11:37', '2024-12-21', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(139, 38, 8, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 21.5 x 24\r\nPaper GSM: 400\r\nPaper Quantity: 2300\r\n        @Magistick', 'Completed', '2024-12-12 06:48:30', '2025-01-29 10:23:17', '2024-12-15', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(140, 38, 22, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 21.5 x 24\r\nPaper GSM: 400\r\nPaper Quantity: 2300\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 21.5 x 24\r\nPrinting Quantity: 1400\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-12 06:48:30', '2025-01-29 10:23:22', '2024-12-18', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(141, 38, 9, 'Plate Type: Offset\r\nDeliver to Printer: magistickprinter', 'Completed', '2024-12-12 06:48:30', '2025-01-29 10:23:27', '2024-12-13', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(142, 38, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: old\r\nPunching: old\r\n        ', 'Completed', '2024-12-12 06:48:30', '2025-01-13 16:12:06', '2024-12-21', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(143, 39, 16, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 21.5 x 24\r\nPaper GSM: 400\r\nPaper Quantity: 2300\r\n        @Magistick', 'Completed', '2024-12-12 06:54:42', '2025-01-29 10:24:07', '2024-12-15', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(144, 39, 22, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 21.5 x 24\r\nPaper GSM: 400\r\nPaper Quantity: 2300\r\n\r\nPaper Vendor: instock\r\nCutting Size: 21.5 x 24\r\nPrinting Quantity: 900\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-12 06:54:42', '2025-01-29 10:24:12', '2024-12-18', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(145, 39, 9, 'Plate Type: Offset\r\nDeliver to Printer: magistickprinter', 'Completed', '2024-12-12 06:54:42', '2025-01-29 10:24:16', '2024-12-13', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(146, 39, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Completed', '2024-12-12 06:54:42', '2025-01-13 16:12:30', '2024-12-21', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(147, 40, 8, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 21.5 x 24.5\r\nPaper GSM: 400\r\nPaper Quantity: 820\r\n        @Hiyan', 'Completed', '2024-12-12 12:11:10', '2025-01-29 10:07:06', '2024-12-15', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(148, 40, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 21.5 x 24.5\r\nPaper GSM: 400\r\nPaper Quantity: 820\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 21.5 x 24.5\r\nPrinting Quantity: 820\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-12 12:11:10', '2025-01-29 10:07:11', '2024-12-15', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(149, 40, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-12-12 12:11:10', '2025-01-29 10:07:16', '2024-12-13', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(150, 40, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-12-12 12:11:10', '2025-01-13 16:12:52', '2024-12-21', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(151, 41, 16, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 17.49 x 25\r\nPaper GSM: 400\r\nPaper Quantity: 11860\r\n       ', 'Completed', '2024-12-16 06:53:44', '2025-01-30 05:34:16', '2024-12-19', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(152, 41, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 17.49 x 25\r\nPaper GSM: 400\r\nPaper Quantity: 11860\r\n\r\nPaper Vendor: instock\r\nCutting Size: 17.49 x 25\r\nPrinting Quantity: 11860\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-12-16 06:53:44', '2025-01-30 05:34:21', '2024-12-19', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(153, 41, 14, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Completed', '2024-12-16 06:53:44', '2025-01-30 05:34:26', '2024-12-17', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(154, 41, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: old\r\nPunching: old\r\n        ', 'Completed', '2024-12-16 06:53:44', '2025-01-30 05:34:30', '2024-12-25', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(155, 42, 16, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 17.49 x 25\r\nPaper GSM: 400\r\nPaper Quantity: 1820\r\n        ', 'Completed', '2024-12-16 10:49:24', '2025-01-29 10:07:55', '2024-12-19', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(156, 42, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 17.49 x 25\r\nPaper GSM: 400\r\nPaper Quantity: 1820\r\n\r\nPaper Vendor: instock\r\nCutting Size: 17.49 x 25\r\nPrinting Quantity: 1820\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-12-16 10:49:24', '2025-01-29 10:08:00', '2024-12-22', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(157, 42, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Completed', '2024-12-16 10:49:24', '2025-01-29 10:08:07', '2024-12-17', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(158, 42, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Completed', '2024-12-16 10:49:24', '2025-01-13 16:13:15', '2024-12-25', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(159, 43, 16, 'Paper Quality: FBB BOARD\r\nPaper Size: 20 x 40\r\nPaper GSM: 125\r\nPaper Quantity: 600\r\n        ', 'Completed', '2024-12-16 11:07:05', '2025-01-29 10:08:50', '2024-12-17', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(160, 43, 3, 'Paper Quality: FBB BOARD\r\nPaper Size: 20 x 40\r\nPaper GSM: 125\r\nPaper Quantity: 600\r\n\r\nPaper Vendor: instock\r\nCutting Size: 20 x13.3\r\nPrinting Quantity: 1620\r\nPrinting Type: Offset\r\nColor: 1 Color', 'Completed', '2024-12-16 11:07:05', '2025-01-29 10:08:53', '2024-12-20', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(161, 43, 9, 'Plate Type: Offset\r\nDeliver to Printer: printer', 'Completed', '2024-12-16 11:07:05', '2025-01-29 10:08:57', '2024-12-17', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(162, 43, 13, 'Lamination Type: direct punching\r\nUV: no\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2024-12-16 11:07:05', '2025-01-13 16:13:37', '2024-12-25', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(163, 44, 8, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 41.5\r\nPaper GSM: 400\r\nPaper Quantity: 1800\r\n        ', 'Completed', '2024-12-16 11:15:28', '2025-01-29 10:11:56', '2024-12-19', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(164, 44, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 41.5\r\nPaper GSM: 400\r\nPaper Quantity: 1800\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 24 x 19.72\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-16 11:15:28', '2025-01-29 10:12:01', '2024-12-22', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(165, 44, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-12-16 11:15:28', '2025-01-29 10:12:06', '2024-12-17', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(166, 44, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Completed', '2024-12-16 11:15:28', '2025-01-13 16:14:04', '2024-12-25', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(167, 45, 16, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 41.5\r\nPaper GSM: 400\r\nPaper Quantity: 1800\r\n        ', 'Completed', '2024-12-16 11:23:09', '2025-01-29 10:14:01', '2024-12-19', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(168, 45, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 41.5\r\nPaper GSM: 400\r\nPaper Quantity: 1800\r\n\r\nPaper Vendor: instock\r\nCutting Size: 24 x 19.72\r\nPrinting Quantity: 900\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-16 11:23:09', '2025-01-29 10:14:06', '2024-12-22', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(169, 45, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter\r\nsingle plate', 'Completed', '2024-12-16 11:23:09', '2025-01-29 10:14:12', '2024-12-17', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(170, 45, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: old\r\nPunching: old\r\n        ', 'Completed', '2024-12-16 11:23:09', '2025-01-13 16:14:32', '2024-12-25', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(171, 46, 16, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 41.5\r\nPaper GSM: 400\r\nPaper Quantity: 1800\r\n        ', 'Completed', '2024-12-16 11:29:11', '2025-01-29 10:14:41', '2024-12-19', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(172, 46, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 41.5\r\nPaper GSM: 400\r\nPaper Quantity: 1800\r\n\r\nPaper Vendor: instock\r\nCutting Size: 24 x 19.72\r\nPrinting Quantity: 1525\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-16 11:29:11', '2025-01-29 10:14:47', '2024-12-22', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(173, 46, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter\r\nsingle plate', 'Completed', '2024-12-16 11:29:11', '2025-01-29 10:14:52', '2024-12-17', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(174, 46, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: old\r\nPunching: old\r\n        ', 'Completed', '2024-12-16 11:29:11', '2025-01-13 16:15:10', '2024-12-25', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(175, 47, 19, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 26.75 x 23\r\nPaper GSM: 400\r\nPaper Quantity: 4400\r\n        @Pushpa', 'Completed', '2024-12-16 11:37:04', '2025-01-30 05:35:08', '2024-12-19', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(176, 47, 23, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 26.75 x 23\r\nPaper GSM: 400\r\nPaper Quantity: 4400\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 26.75 x 21.75\r\nPrinting Quantity: 3700\r\nPrinting Type: Offset\r\nColor: 6 Color', 'Completed', '2024-12-16 11:37:04', '2025-01-30 05:35:13', '2024-12-22', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(177, 47, 14, 'Plate Type: Offset\r\nDeliver to Printer: pushpaprinter', 'Completed', '2024-12-16 11:37:04', '2025-01-30 05:35:19', '2024-12-17', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(178, 47, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: old\r\nPunching: old\r\n        ', 'Completed', '2024-12-16 11:37:04', '2025-01-30 05:35:23', '2024-12-25', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(179, 48, 16, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 26.75 x 23\r\nPaper GSM: 400\r\nPaper Quantity: 4400\r\n        ', 'Completed', '2024-12-16 11:43:20', '2025-01-29 10:05:54', '2024-12-19', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(180, 48, 23, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 26.75 x 23\r\nPaper GSM: 400\r\nPaper Quantity: 4400\r\n\r\nPaper Vendor: instock\r\nCutting Size: 26.75 x 21.75\r\nPrinting Quantity: 650\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-12-16 11:43:20', '2025-01-29 10:05:59', '2024-12-22', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(181, 48, 9, 'Plate Type: Offset\r\nDeliver to Printer: pushpaprinter', 'Completed', '2024-12-16 11:43:20', '2025-01-29 10:06:04', '2024-12-17', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(182, 48, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Completed', '2024-12-16 11:43:20', '2025-01-13 16:01:45', '2024-12-25', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(183, 49, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 28 x 40\r\nPaper GSM: 350\r\nPaper Quantity: 300\r\n        @MasterPrint', 'Pending', '2024-12-17 11:03:45', '2024-12-17 11:03:45', '2024-12-20', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(184, 49, 24, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 28 x 40\r\nPaper GSM: 350\r\nPaper Quantity: 300\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 23.44 x 13.15\r\nPrinting Quantity: 750\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2024-12-17 11:03:45', '2024-12-17 11:03:45', '2024-12-24', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(185, 49, 9, 'Plate Type: Offset\r\nDeliver to Printer: masterprint', 'Pending', '2024-12-17 11:03:45', '2024-12-17 11:03:45', '2024-12-18', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(186, 49, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2024-12-17 11:03:45', '2025-01-13 16:15:47', '2024-12-26', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(187, 50, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 36.8 x 28.7\r\nPaper GSM: 350\r\nPaper Quantity: 900\r\n        @Masterprint', 'Completed', '2024-12-17 11:13:04', '2025-01-29 10:05:05', '2024-12-20', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(188, 50, 24, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 36.8 x 28.7\r\nPaper GSM: 350\r\nPaper Quantity: 900\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 17.67 x 26.87\r\nPrinting Quantity: 1700\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-12-17 11:13:04', '2025-01-29 10:05:10', '2024-12-24', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(189, 50, 9, 'Plate Type: Offset\r\nDeliver to Printer: masterprint', 'Completed', '2024-12-17 11:13:04', '2025-01-29 10:05:15', '2024-12-18', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(190, 50, 13, 'Lamination Type: Matte\r\nUV: no\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2024-12-17 11:13:04', '2025-01-13 16:16:35', '2024-12-26', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(191, 51, 8, 'Paper Quality: FBB BOARD\r\nPaper Size: 25 x 38\r\nPaper GSM: 320\r\nPaper Quantity: 1100\r\n        ', 'Completed', '2024-12-17 12:37:56', '2025-01-29 09:58:41', '2024-12-18', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(192, 51, 17, 'Paper Quality: FBB BOARD\r\nPaper Size: 25 x 38\r\nPaper GSM: 320\r\nPaper Quantity: 1100\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 21.9 x 19.73\r\nPrinting Quantity: 2100\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-17 12:37:56', '2025-01-29 09:58:46', '2024-12-18', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(193, 51, 14, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Completed', '2024-12-17 12:37:56', '2025-01-29 09:58:52', '2024-12-18', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(194, 51, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-12-17 12:37:56', '2025-01-13 16:16:59', '2024-12-19', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(195, 52, 2, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 36 x 46\r\nPaper GSM: 350\r\nPaper Quantity: 200\r\n        @Hiyan', 'Completed', '2024-12-18 10:28:52', '2025-02-10 07:20:23', '2024-12-21', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(197, 52, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-12-18 10:28:52', '2025-02-10 07:20:16', '2024-12-19', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(198, 52, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-12-18 10:28:52', '2025-01-13 16:17:34', '2024-12-27', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(199, 53, 16, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 17.49 x 25\r\nPaper GSM: 400\r\nPaper Quantity: 5200\r\n        @Shreeji', 'Completed', '2024-12-18 11:24:58', '2025-01-29 10:00:00', '2024-12-21', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(200, 53, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 17.49 x 25\r\nPaper GSM: 400\r\nPaper Quantity: 5200\r\n\r\nPaper Vendor: instock\r\nCutting Size: 17.49 x 25\r\nPrinting Quantity: 5200\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-12-18 11:24:58', '2025-01-29 10:00:05', '2024-12-22', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(201, 53, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Completed', '2024-12-18 11:24:58', '2025-01-29 10:00:10', '2024-12-19', 3, NULL, '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sub_tasks` (`sub_task_id`, `main_task_id`, `assigned_to`, `description`, `status`, `created_at`, `updated_at`, `delivery_date`, `assigned_to_department`, `completed_at`, `admin_comment`, `admin_updated_on`, `manager_comment`, `manager_updated_on`, `user_comment`, `user_updated_on`) VALUES
(202, 53, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Completed', '2024-12-18 11:24:58', '2025-01-29 10:00:15', '2024-12-27', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(203, 54, 2, 'Paper Quality: FBB BOARD\r\nPaper Size: 112 x 80 cms\r\nPaper GSM: 310\r\nPaper Quantity: 1300\r\n        @Shreeji', 'Completed', '2024-12-18 11:48:54', '2025-01-29 10:00:41', '2024-12-21', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(204, 54, 17, 'Paper Quality: FBB BOARD\r\nPaper Size: 112 x 80 cms\r\nPaper GSM: 310\r\nPaper Quantity: 1300\r\n\r\nPaper Vendor: green globe\r\nCutting Size: 22 x 15.5\r\nPrinting Quantity: 5200\r\nPrinting Type: Offset\r\nColor: 2 Color', 'Completed', '2024-12-18 11:48:54', '2025-01-29 10:00:46', '2024-12-24', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(205, 54, 14, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Completed', '2024-12-18 11:48:54', '2025-01-29 10:00:50', '2024-12-19', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(206, 54, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-12-18 11:48:54', '2025-01-13 16:18:05', '2024-12-28', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(207, 55, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 12 x 23\r\nPaper GSM: 350\r\nPaper Quantity: 1860\r\n        @Shreeji', 'Completed', '2024-12-21 10:02:37', '2025-01-29 10:01:26', '2024-12-24', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(208, 55, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 12 x 23\r\nPaper GSM: 350\r\nPaper Quantity: 1860\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 12 x 23\r\nPrinting Quantity: 1860\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-21 10:02:37', '2025-01-29 10:01:32', '2024-12-27', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(209, 55, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Completed', '2024-12-21 10:02:37', '2025-01-29 10:01:37', '2024-12-22', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(210, 55, 13, 'Lamination Type: Glossy\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2024-12-21 10:02:37', '2025-01-13 16:18:32', '2024-12-28', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(211, 56, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 26 x 34\r\nPaper GSM: 400\r\nPaper Quantity: 700\r\n        @Shreeji', 'Completed', '2024-12-23 08:08:55', '2025-01-29 10:02:11', '2024-12-26', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(212, 56, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 26 x 34\r\nPaper GSM: 400\r\nPaper Quantity: 700\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 24.75 x 14.75\r\nPrinting Quantity: 1360\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-12-23 08:08:55', '2025-01-29 10:02:15', '2024-12-29', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(213, 56, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Completed', '2024-12-23 08:08:55', '2025-01-29 10:02:20', '2024-12-24', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(214, 56, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: old\r\nPunching: old\r\n        ', 'Completed', '2024-12-23 08:08:55', '2025-01-14 15:59:50', '2025-01-01', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(215, 57, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 51 x 31\r\nPaper GSM: 400\r\nPaper Quantity: 1350\r\n        @Pushpa', 'Completed', '2024-12-23 09:16:55', '2025-01-29 10:03:15', '2024-12-26', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(216, 57, 23, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 51 x 31\r\nPaper GSM: 400\r\nPaper Quantity: 1350\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 23.75 x 30.9\r\nPrinting Quantity: 2700\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-12-23 09:16:55', '2025-01-29 10:03:21', '2024-12-29', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(217, 57, 9, 'Plate Type: Offset\r\nDeliver to Printer: pushpaprinter', 'Completed', '2024-12-23 09:16:55', '2025-01-29 10:03:26', '2024-12-24', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(218, 57, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Completed', '2024-12-23 09:16:55', '2025-01-13 16:19:27', '2025-01-01', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(219, 58, 19, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 55cm x 46.5cm\r\nPaper GSM: 350\r\nPaper Quantity: 3100\r\n        @Rameshwar', 'Completed', '2024-12-23 09:38:19', '2025-01-29 09:49:50', '2024-12-26', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(220, 58, 12, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 55cm x 46.5cm\r\nPaper GSM: 350\r\nPaper Quantity: 3100\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 55cm x 46.5cm\r\nPrinting Quantity: 3100\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-23 09:38:19', '2025-01-29 09:49:54', '2024-12-29', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(221, 58, 14, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Completed', '2024-12-23 09:38:19', '2025-01-29 09:49:59', '2024-12-24', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(222, 58, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-12-23 09:38:19', '2025-01-13 16:20:15', '2025-01-01', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(223, 59, 26, 'Paper Quality: FBB BOARD\r\nPaper Size: 20 x 28\r\nPaper GSM: 157\r\nPaper Quantity: 1850\r\n        @Shreeji', 'Pending', '2024-12-23 11:14:54', '2024-12-23 11:14:54', '2024-12-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(224, 59, 17, 'Paper Quality: FBB BOARD\r\nPaper Size: 20 x 28\r\nPaper GSM: 157\r\nPaper Quantity: 1850\r\n\r\nPaper Vendor: akshitapaper\r\nCutting Size: 20 x 28\r\nPrinting Quantity: 1200\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-12-23 11:14:54', '2025-02-06 12:03:14', '0000-00-00', 2, '2025-02-06 12:03:14', NULL, NULL, NULL, NULL, '', NULL),
(225, 59, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2024-12-23 11:14:54', '2024-12-23 11:14:54', '2024-12-24', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(226, 59, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2024-12-23 11:14:54', '2024-12-23 11:14:54', '2025-01-01', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(227, 60, 16, 'Paper Quality: FBB BOARD\r\nPaper Size: 20 x 28\r\nPaper GSM: 157\r\nPaper Quantity: 1850\r\n        ', 'Pending', '2024-12-23 11:18:48', '2024-12-23 11:18:48', '2024-12-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(228, 60, 17, 'Paper Quality: FBB BOARD\r\nPaper Size: 20 x 28\r\nPaper GSM: 157\r\nPaper Quantity: 1850\r\n\r\nPaper Vendor: instock\r\nCutting Size: 20 x 28\r\nPrinting Quantity: 650\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-12-23 11:18:48', '2025-02-06 12:03:22', '0000-00-00', 2, '2025-02-06 12:03:22', NULL, NULL, NULL, NULL, '', NULL),
(229, 60, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2024-12-23 11:18:48', '2024-12-23 11:18:48', '2024-12-24', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(230, 60, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2024-12-23 11:18:48', '2024-12-23 11:18:48', '2025-01-01', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(231, 61, 8, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 21.4 x 23.4\r\nPaper GSM: 330\r\nPaper Quantity: 1200\r\n        ', 'Completed', '2024-12-26 08:15:33', '2025-01-29 09:50:48', '2024-12-29', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(232, 61, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 21.4 x 23.4\r\nPaper GSM: 330\r\nPaper Quantity: 1200\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 21.4 x 23.4\r\nPrinting Quantity: 1200\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-26 08:15:33', '2025-01-29 09:50:53', '2025-01-02', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(233, 61, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-12-26 08:15:33', '2025-01-29 09:50:58', '2024-12-27', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(234, 61, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-12-26 08:15:33', '2025-01-13 16:21:22', '2025-01-04', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(235, 62, 8, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 28.2 x 24\r\nPaper GSM: 330\r\nPaper Quantity: 1400\r\n        ', 'Completed', '2024-12-26 08:19:33', '2025-01-29 09:52:25', '2024-12-29', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(236, 62, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 28.2 x 24\r\nPaper GSM: 330\r\nPaper Quantity: 1400\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 14.11 X 23.34\r\nPrinting Quantity: 2700\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-26 08:19:33', '2025-01-29 09:52:30', '2025-01-02', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(237, 62, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-12-26 08:19:33', '2025-01-29 09:52:34', '2024-12-27', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(238, 62, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-12-26 08:19:33', '2025-01-13 16:21:52', '2025-01-04', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(239, 63, 8, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 21.4 x 20\r\nPaper GSM: 340\r\nPaper Quantity: 650\r\n        ', 'Completed', '2024-12-26 08:23:32', '2025-01-29 09:53:21', '2024-12-29', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(240, 63, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 21.4 x 20\r\nPaper GSM: 340\r\nPaper Quantity: 650\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 21.4 x 20\r\nPrinting Quantity: 650\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-26 08:23:32', '2025-01-29 09:53:25', '2025-01-02', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(241, 63, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-12-26 08:23:32', '2025-01-29 09:53:30', '2024-12-27', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(242, 63, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-12-26 08:23:32', '2025-01-13 16:22:29', '2025-01-04', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(243, 64, 16, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 21.4 x 20\r\nPaper GSM: 340\r\nPaper Quantity: 1800\r\n        ', 'Completed', '2024-12-26 08:27:41', '2025-01-29 09:54:12', '2024-12-29', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(244, 64, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 21.4 x 20\r\nPaper GSM: 340\r\nPaper Quantity: 1800\r\n\r\nPaper Vendor: instock\r\nCutting Size: 21.4 x 20\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-26 08:27:41', '2025-01-29 09:54:17', '2025-01-01', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(245, 64, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-12-26 08:27:41', '2025-01-29 09:54:22', '2024-12-27', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(246, 64, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-12-26 08:27:41', '2025-01-13 16:23:44', '2025-01-04', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(247, 65, 25, 'Paper Quality: Artcard\r\nPaper Size: 23 x 36\r\nPaper GSM: 350\r\nPaper Quantity: 300\r\n        ', 'Completed', '2024-12-26 11:40:49', '2025-01-29 09:54:48', '2024-12-29', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(248, 65, 12, 'Paper Quality: Artcard\r\nPaper Size: 23 x 36\r\nPaper GSM: 350\r\nPaper Quantity: 300\r\n\r\nPaper Vendor: greenglobe\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 600\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-12-26 11:40:49', '2025-01-29 09:54:53', '2025-01-01', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(249, 65, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Completed', '2024-12-26 11:40:49', '2025-01-29 09:54:58', '2024-12-27', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(250, 65, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2024-12-26 11:40:49', '2025-01-14 16:00:48', '2025-01-04', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(251, 66, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 21.4 X 32\r\nPaper GSM: 330\r\nPaper Quantity: 2600\r\n        ', 'Completed', '2024-12-30 05:20:49', '2025-01-29 09:55:41', '2025-01-02', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(252, 66, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 21.4 X 32\r\nPaper GSM: 330\r\nPaper Quantity: 2600\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 19.25 x 16\r\nPrinting Quantity: 5200\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2024-12-30 05:20:49', '2025-01-29 09:55:46', '2025-01-05', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(253, 66, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Completed', '2024-12-30 05:20:49', '2025-01-29 09:55:50', '2024-12-31', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(254, 66, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Completed', '2024-12-30 05:20:49', '2025-01-29 09:55:55', '2025-01-08', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(255, 67, 21, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 400\r\nPaper Quantity: 600\r\n        ', 'Completed', '2024-12-31 10:07:26', '2025-01-29 09:56:47', '2025-01-03', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(256, 67, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 400\r\nPaper Quantity: 600\r\n\r\nPaper Vendor: prakashpaper\r\nCutting Size: 24.75 x 12.64\r\nPrinting Quantity: 1650\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2024-12-31 10:07:26', '2025-01-29 09:56:54', '2025-01-06', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(257, 67, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2024-12-31 10:07:26', '2025-01-29 09:56:59', '2025-01-01', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(258, 67, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2024-12-31 10:07:26', '2025-01-14 16:01:13', '2025-01-09', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(259, 68, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 350\r\nPaper Quantity: 600\r\n        @Hiyan', 'Completed', '2025-01-02 09:23:43', '2025-01-29 09:31:50', '2025-01-05', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(260, 68, 20, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 350\r\nPaper Quantity: 600\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 22.64 x 19\r\nPrinting Quantity: 1200\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-02 09:23:43', '2025-01-29 09:31:55', '2025-01-08', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(261, 68, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2025-01-02 09:23:43', '2025-01-29 09:32:03', '2025-01-03', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(262, 68, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2025-01-02 09:23:43', '2025-01-29 09:32:10', '2025-01-11', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(263, 69, 19, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 38 x 25\r\nPaper GSM: 350\r\nPaper Quantity: 4265\r\n        @Rameshwar', 'Completed', '2025-01-02 10:57:43', '2025-02-11 06:40:44', '2025-01-05', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(264, 69, 12, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 38 x 25\r\nPaper GSM: 350\r\nPaper Quantity: 4265\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 19 x 25\r\nPrinting Quantity: 8530\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-02 10:57:43', '2025-02-11 06:41:08', '2025-01-08', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(265, 69, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Completed', '2025-01-02 10:57:43', '2025-02-11 06:41:17', '2025-01-03', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(266, 69, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Completed', '2025-01-02 10:57:43', '2025-02-11 06:41:30', '2025-01-11', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(267, 70, 19, 'Paper Quality: Artcard\r\nPaper Size: 24 x 36\r\nPaper GSM: 300\r\nPaper Quantity: 2500\r\n        @Rameshwar', 'Completed', '2025-01-02 11:46:12', '2025-01-29 09:37:44', '2025-01-05', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(268, 70, 12, 'Paper Quality: Artcard\r\nPaper Size: 24 x 36\r\nPaper GSM: 300\r\nPaper Quantity: 2500\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 18 x 22\r\nPrinting Quantity: 5000\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2025-01-02 11:46:12', '2025-01-29 09:37:49', '2025-01-08', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(269, 70, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Completed', '2025-01-02 11:46:12', '2025-01-29 09:37:53', '2025-01-03', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(270, 70, 13, 'Lamination Type: Matte\r\nUV: no\r\nEmboss: no\r\nPunching: no\r\n        ', 'Completed', '2025-01-02 11:46:12', '2025-01-29 09:37:58', '2025-01-11', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(271, 71, 21, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 36 x 46\r\nPaper GSM: 400\r\nPaper Quantity: 300\r\n        @Hiyan', 'Completed', '2025-01-04 07:14:11', '2025-01-29 09:43:16', '2025-01-07', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(272, 71, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 36 x 46\r\nPaper GSM: 400\r\nPaper Quantity: 300\r\n\r\nPaper Vendor: prakashpaper\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-04 07:14:11', '2025-01-29 09:43:21', '2025-01-10', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(273, 71, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2025-01-04 07:14:11', '2025-01-29 09:43:26', '2025-01-05', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(274, 71, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2025-01-04 07:14:11', '2025-01-14 16:02:23', '2025-01-12', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(275, 72, 21, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 28 x 44\r\nPaper GSM: 400\r\nPaper Quantity: 550\r\n        ', 'Completed', '2025-01-04 07:20:51', '2025-01-29 09:44:34', '2025-01-07', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(276, 72, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 28 x 44\r\nPaper GSM: 400\r\nPaper Quantity: 550\r\n\r\nPaper Vendor: prakashpaper\r\nCutting Size: 28 x 14.6\r\nPrinting Quantity: 1650\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-04 07:20:51', '2025-01-29 09:44:39', '2025-01-10', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(277, 72, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2025-01-04 07:20:51', '2025-01-29 09:44:44', '2025-01-05', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(278, 72, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2025-01-04 07:20:51', '2025-01-14 16:03:01', '2025-01-12', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(279, 73, 25, 'Paper Quality: FBB BOARD\r\nPaper Size: 44 x 38\r\nPaper GSM: 350\r\nPaper Quantity: 4000\r\n        ', 'Completed', '2025-01-04 09:04:32', '2025-01-21 07:46:31', '2025-01-07', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(280, 73, 24, 'Paper Quality: FBB BOARD\r\nPaper Size: 44 x 38\r\nPaper GSM: 350\r\nPaper Quantity: 4000\r\n\r\nPaper Vendor: greenglobe\r\nCutting Size: 22 x 19\r\nPrinting Quantity: 4000\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-04 09:04:32', '2025-01-29 09:45:29', '2025-01-10', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(281, 73, 9, 'Plate Type: Offset\r\nDeliver to Printer: masterprint', 'Completed', '2025-01-04 09:04:32', '2025-01-29 09:45:35', '2025-01-05', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(282, 73, 13, 'Lamination Type: Dripoff\r\nUV: no\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2025-01-04 09:04:32', '2025-01-29 09:45:40', '2025-01-11', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(283, 74, 25, 'Paper Quality: FBB BOARD\r\nPaper Size: 28 x 44\r\nPaper GSM: 390\r\nPaper Quantity: 700\r\n        ', 'Completed', '2025-01-04 09:09:57', '2025-01-29 09:46:32', '2025-01-07', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(284, 74, 24, 'Paper Quality: FBB BOARD\r\nPaper Size: 28 x 44\r\nPaper GSM: 390\r\nPaper Quantity: 700\r\n\r\nPaper Vendor: greenglobe\r\nCutting Size: 20 x 28\r\nPrinting Quantity: 1340\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-04 09:09:57', '2025-01-29 09:46:38', '2025-01-10', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(285, 74, 9, 'Plate Type: Offset\r\nDeliver to Printer: masterprint', 'Completed', '2025-01-04 09:09:57', '2025-01-29 09:46:43', '2025-01-05', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(286, 74, 13, 'Lamination Type: Dripoff\r\nUV: no\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2025-01-04 09:09:57', '2025-01-29 09:46:48', '2025-01-12', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(287, 75, 19, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 22 x 26.75\r\nPaper GSM: 400\r\nPaper Quantity: 3000\r\n        ', 'Completed', '2025-01-04 09:23:58', '2025-01-29 09:47:25', '2025-01-07', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(288, 75, 23, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 22 x 26.75\r\nPaper GSM: 400\r\nPaper Quantity: 3000\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 22 x 26.75\r\nPrinting Quantity: 1650\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2025-01-04 09:23:58', '2025-01-29 09:47:31', '2025-01-10', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(289, 75, 9, 'Plate Type: Offset\r\nDeliver to Printer: pushpaprinter', 'Completed', '2025-01-04 09:23:58', '2025-01-29 09:47:35', '2025-01-05', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(290, 75, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Completed', '2025-01-04 09:23:58', '2025-01-29 09:47:42', '2025-01-12', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(291, 76, 19, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 36 x 46\r\nPaper GSM: 300\r\nPaper Quantity: 1300\r\n        ', 'Pending', '2025-01-04 12:37:11', '2025-01-04 12:37:11', '2025-01-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(292, 76, 12, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 36 x 46\r\nPaper GSM: 300\r\nPaper Quantity: 1300\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 21.61 x 17\r\nPrinting Quantity: 5200\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-04 12:37:11', '2025-01-04 12:37:11', '2025-01-10', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(293, 76, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Pending', '2025-01-04 12:37:11', '2025-01-04 12:37:11', '2025-01-05', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(294, 76, 13, 'Lamination Type: Matte\r\nUV: no\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2025-01-04 12:37:11', '2025-01-04 12:37:11', '2025-01-12', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(295, 77, 2, 'Paper Quality: JK TUFF COAT (CREAM )\r\nPaper Size: 36 x 46\r\nPaper GSM: 350\r\nPaper Quantity: 600\r\n        ', 'Pending', '2025-01-06 11:59:06', '2025-01-06 11:59:06', '2025-01-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(296, 77, 17, 'Paper Quality: JK TUFF COAT (CREAM )\r\nPaper Size: 36 x 46\r\nPaper GSM: 350\r\nPaper Quantity: 600\r\n\r\nPaper Vendor: paper\r\nCutting Size: 16 x 23.75\r\nPrinting Quantity: 2400\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-06 11:59:06', '2025-01-06 11:59:06', '2025-01-07', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(297, 77, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-01-06 11:59:06', '2025-01-06 11:59:06', '2025-01-06', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(298, 77, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2025-01-06 11:59:06', '2025-01-06 11:59:06', '2025-01-08', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(299, 78, 8, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 24 x 39.5\r\nPaper GSM: 400\r\nPaper Quantity: 1400\r\n        @Hiyan', 'Completed', '2025-01-07 08:58:15', '2025-01-29 08:56:24', '2025-01-10', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(300, 78, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 24 x 39.5\r\nPaper GSM: 400\r\nPaper Quantity: 1400\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 23.91 x 19.72\r\nPrinting Quantity: 1400\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-07 08:58:15', '2025-01-29 08:56:31', '2025-01-14', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(301, 78, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2025-01-07 08:58:15', '2025-01-29 08:56:48', '2025-01-08', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(302, 78, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2025-01-07 08:58:15', '2025-01-14 16:03:45', '2025-01-16', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(303, 79, 21, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 28 x 44\r\nPaper GSM: 400\r\nPaper Quantity: 200\r\n        ', 'Completed', '2025-01-07 10:01:22', '2025-01-29 08:58:25', '2025-01-10', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(304, 79, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 28 x 44\r\nPaper GSM: 400\r\nPaper Quantity: 200\r\n\r\nPaper Vendor: prakashpaper\r\nCutting Size: 25.89 x 21.14\r\nPrinting Quantity: 400\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-07 10:01:22', '2025-01-29 08:58:31', '2025-01-13', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(305, 79, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2025-01-07 10:01:22', '2025-01-29 08:58:38', '2025-01-08', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(306, 79, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2025-01-07 10:01:22', '2025-01-14 16:04:07', '2025-01-16', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(307, 80, 21, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 91.5 x 117\r\nPaper GSM: 400\r\nPaper Quantity: 100\r\n        ', 'Completed', '2025-01-07 10:10:01', '2025-01-29 09:00:28', '2025-01-10', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(308, 80, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 91.5 x 117\r\nPaper GSM: 400\r\nPaper Quantity: 100\r\n\r\nPaper Vendor: prakashpaper\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 400\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-07 10:10:01', '2025-01-29 09:00:35', '2025-01-13', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(309, 80, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2025-01-07 10:10:01', '2025-01-29 09:00:43', '2025-01-08', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(310, 80, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2025-01-07 10:10:01', '2025-01-14 16:04:34', '2025-01-16', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(311, 81, 19, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 63.5 x 89.5 cm\r\nPaper GSM: 400\r\nPaper Quantity: 500\r\n        ', 'Completed', '2025-01-07 10:33:58', '2025-01-29 09:01:46', '2025-01-10', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(312, 81, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 63.5 x 89.5 cm\r\nPaper GSM: 400\r\nPaper Quantity: 500\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 24.75 x 17.56\r\nPrinting Quantity: 650\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-07 10:33:58', '2025-01-29 09:01:56', '2025-01-13', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(313, 81, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2025-01-07 10:33:58', '2025-01-29 09:02:01', '2025-01-08', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(314, 81, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2025-01-07 10:33:58', '2025-01-16 04:59:36', '2025-01-16', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(315, 82, 16, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 63.5 x 89.5 cm\r\nPaper GSM: 400\r\nPaper Quantity: 500\r\n        ', 'Completed', '2025-01-07 10:39:11', '2025-01-29 09:03:05', '2025-01-10', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(316, 82, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 63.5 x 89.5 cm\r\nPaper GSM: 400\r\nPaper Quantity: 500\r\n\r\nPaper Vendor: instock\r\nCutting Size: 24.75 x 17.56\r\nPrinting Quantity: 350\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-07 10:39:11', '2025-01-29 09:03:17', '2025-01-13', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(317, 82, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2025-01-07 10:39:11', '2025-01-29 09:03:34', '2025-01-08', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(318, 82, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2025-01-07 10:39:11', '2025-01-16 05:00:01', '2025-01-16', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(319, 83, 19, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 63.5 x 80cm\r\nPaper GSM: 400\r\nPaper Quantity: 900\r\n        ', 'Completed', '2025-01-07 10:53:24', '2025-01-29 09:13:32', '2025-01-10', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(320, 83, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 63.5 x 80cm\r\nPaper GSM: 400\r\nPaper Quantity: 900\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 22.32 x 15.75\r\nPrinting Quantity: 1800\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-07 10:53:24', '2025-01-29 09:13:38', '2025-01-13', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(321, 83, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2025-01-07 10:53:24', '2025-01-29 09:13:44', '2025-01-08', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(322, 83, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2025-01-07 10:53:24', '2025-01-16 05:00:32', '2025-01-16', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(323, 84, 19, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 63.5 x 100.5cm\r\nPaper GSM: 400\r\nPaper Quantity: 1100\r\n        ', 'Completed', '2025-01-07 10:57:20', '2025-01-29 09:23:48', '2025-01-10', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(324, 84, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 63.5 x 100.5cm\r\nPaper GSM: 400\r\nPaper Quantity: 1100\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 23.42 x 19.75\r\nPrinting Quantity: 2150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-07 10:57:20', '2025-01-29 09:23:54', '2025-01-13', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(325, 84, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2025-01-07 10:57:20', '2025-01-29 09:23:59', '2025-01-08', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(326, 84, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2025-01-07 10:57:20', '2025-01-29 09:24:05', '2025-01-16', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(327, 85, 19, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 63.5 x 119\r\nPaper GSM: 350\r\nPaper Quantity: 1300\r\n        ', 'Completed', '2025-01-07 11:01:25', '2025-01-29 09:24:52', '2025-01-10', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(328, 85, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 63.5 x 119\r\nPaper GSM: 350\r\nPaper Quantity: 1300\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 23.75 x 18.42\r\nPrinting Quantity: 2650\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-07 11:01:25', '2025-01-29 09:24:58', '2025-01-13', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(329, 85, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2025-01-07 11:01:25', '2025-01-29 09:25:03', '2025-01-08', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(330, 85, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2025-01-07 11:01:25', '2025-01-29 09:25:10', '2025-01-16', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(331, 86, 19, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 23 reel\r\nPaper GSM: 350\r\nPaper Quantity: 650\r\n        ', 'Completed', '2025-01-08 10:30:55', '2025-01-29 09:26:46', '2025-01-11', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(332, 86, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 23 reel\r\nPaper GSM: 350\r\nPaper Quantity: 650\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 22.16 x 16.26\r\nPrinting Quantity: 650\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-08 10:30:55', '2025-01-29 09:26:51', '2025-01-14', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(333, 86, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2025-01-08 10:30:55', '2025-01-29 09:26:55', '2025-01-09', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(334, 86, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2025-01-08 10:30:55', '2025-01-29 09:27:00', '2025-01-15', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(335, 87, 16, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 23 reel\r\nPaper GSM: 350\r\nPaper Quantity: 350\r\n        ', 'Completed', '2025-01-08 10:37:08', '2025-01-29 09:27:34', '2025-01-11', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(336, 87, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 23 reel\r\nPaper GSM: 350\r\nPaper Quantity: 350\r\n\r\nPaper Vendor: instock\r\nCutting Size: 21.38 x 16.65\r\nPrinting Quantity: 350\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-08 10:37:08', '2025-01-29 09:27:41', '2025-01-14', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(337, 87, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2025-01-08 10:37:08', '2025-01-29 09:27:47', '2025-01-09', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(338, 87, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2025-01-08 10:37:08', '2025-01-29 09:27:53', '2025-01-15', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(339, 88, 19, 'Paper Quality: FBB BOARD\r\nPaper Size: 25 reel\r\nPaper GSM: 350\r\nPaper Quantity: 2500\r\n        ', 'Completed', '2025-01-08 10:47:18', '2025-01-29 09:28:22', '2025-01-11', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(340, 88, 12, 'Paper Quality: FBB BOARD\r\nPaper Size: 25 reel\r\nPaper GSM: 350\r\nPaper Quantity: 2500\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 19 x 25\r\nPrinting Quantity: 2500\r\nPrinting Type: Offset\r\nColor: 1 Color', 'Completed', '2025-01-08 10:47:18', '2025-01-29 09:28:28', '2025-01-14', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(341, 88, 14, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Completed', '2025-01-08 10:47:18', '2025-01-29 09:28:33', '2025-01-09', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(342, 88, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2025-01-08 10:47:18', '2025-01-29 09:28:39', '2025-01-16', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(343, 89, 19, 'Paper Quality: FBB BOARD\r\nPaper Size: 59.7 x 91.5\r\nPaper GSM: 400\r\nPaper Quantity: 250\r\n        ', 'Pending', '2025-01-08 10:50:36', '2025-01-08 10:50:36', '2025-01-11', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(344, 89, 20, 'Paper Quality: FBB BOARD\r\nPaper Size: 59.7 x 91.5\r\nPaper GSM: 400\r\nPaper Quantity: 250\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 22 x 16\r\nPrinting Quantity: 500\r\nPrinting Type: Offset\r\nColor: 2 Color', 'Pending', '2025-01-08 10:50:36', '2025-01-08 10:50:36', '2025-01-14', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(345, 89, 14, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-08 10:50:36', '2025-01-08 10:50:36', '2025-01-09', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(346, 89, 13, 'Lamination Type: direct punching\r\nUV: no\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-08 10:50:36', '2025-01-08 10:50:36', '2025-01-16', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(347, 90, 8, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 400\r\nPaper Quantity: 500\r\n        ', 'Pending', '2025-01-09 07:17:53', '2025-01-09 07:17:53', '2025-01-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(348, 90, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 400\r\nPaper Quantity: 500\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 24.33 x 19.31\r\nPrinting Quantity: 1000\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-09 07:17:53', '2025-01-09 07:17:53', '2025-01-15', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(349, 90, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-09 07:17:53', '2025-01-09 07:17:53', '2025-01-10', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(350, 90, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2025-01-09 07:17:53', '2025-01-16 04:59:15', '2025-01-17', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(351, 91, 2, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 22 x 17\r\nPaper GSM: 400\r\nPaper Quantity: 1400\r\n        ', 'Pending', '2025-01-09 10:00:34', '2025-01-09 10:00:34', '2025-01-12', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(352, 91, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 22 x 17\r\nPaper GSM: 400\r\nPaper Quantity: 1400\r\n\r\nPaper Vendor: paper\r\nCutting Size: 22 x 17\r\nPrinting Quantity: 1400\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-09 10:00:34', '2025-01-09 10:00:34', '2025-01-15', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(353, 91, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-09 10:00:34', '2025-01-09 10:00:34', '2025-01-10', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(354, 91, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-09 10:00:34', '2025-01-09 10:00:34', '2025-01-17', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(355, 92, 2, 'Paper Quality: FBB BOARD\r\nPaper Size: 23 x 36\r\nPaper GSM: 350\r\nPaper Quantity: 1100\r\n        ', 'Pending', '2025-01-10 05:57:36', '2025-01-10 05:57:36', '2025-01-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(356, 92, 17, 'Paper Quality: FBB BOARD\r\nPaper Size: 23 x 36\r\nPaper GSM: 350\r\nPaper Quantity: 1100\r\n\r\nPaper Vendor: paper\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 2200\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-10 05:57:36', '2025-01-10 05:57:36', '2025-01-17', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(357, 92, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-01-10 05:57:36', '2025-01-10 05:57:36', '2025-01-11', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(358, 92, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2025-01-10 05:57:36', '2025-01-21 14:29:05', '2025-01-18', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(359, 93, 2, 'Paper Quality: FBB BOARD\r\nPaper Size: 25 x 34\r\nPaper GSM: 350\r\nPaper Quantity: 3400\r\n        ', 'Pending', '2025-01-11 05:14:01', '2025-01-11 05:14:01', '2025-01-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(360, 93, 12, 'Paper Quality: FBB BOARD\r\nPaper Size: 25 x 34\r\nPaper GSM: 350\r\nPaper Quantity: 3400\r\n\r\nPaper Vendor: paper\r\nCutting Size: 25 x 17\r\nPrinting Quantity: 6800\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-01-11 05:14:01', '2025-01-11 05:14:01', '2025-01-17', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(361, 93, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Pending', '2025-01-11 05:14:01', '2025-01-11 05:14:01', '2025-01-12', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(362, 93, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Pending', '2025-01-11 05:14:01', '2025-01-11 05:14:01', '2025-01-18', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(363, 94, 27, 'Paper Quality: FBB BOARD\r\nPaper Size: 44 x 34\r\nPaper GSM: 290\r\nPaper Quantity: 1300\r\n        ', 'Completed', '2025-01-11 08:12:10', '2025-01-29 08:26:45', '2025-01-14', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(364, 94, 12, 'Paper Quality: FBB BOARD\r\nPaper Size: 44 x 34\r\nPaper GSM: 290\r\nPaper Quantity: 1300\r\n\r\nPaper Vendor: ashtvinayakpaper\r\nCutting Size: 22 x 17\r\nPrinting Quantity: 5200\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-11 08:12:10', '2025-01-29 08:26:51', '2025-01-17', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(365, 94, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Completed', '2025-01-11 08:12:10', '2025-01-29 08:26:57', '2025-01-12', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(366, 94, 13, 'Lamination Type: Matte\r\nUV: no\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2025-01-11 08:12:10', '2025-01-29 08:27:03', '2025-01-19', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(367, 95, 27, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 44 x 34\r\nPaper GSM: 350\r\nPaper Quantity: 1200\r\n        ', 'Completed', '2025-01-11 08:26:53', '2025-01-29 07:12:11', '2025-01-14', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(368, 95, 12, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 44 x 34\r\nPaper GSM: 350\r\nPaper Quantity: 1200\r\n\r\nPaper Vendor: ashtvinayakpaper\r\nCutting Size: 22 x 17\r\nPrinting Quantity: 2650\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2025-01-11 08:26:53', '2025-01-29 07:12:23', '2025-01-17', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(369, 95, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Completed', '2025-01-11 08:26:53', '2025-01-29 07:12:29', '2025-01-12', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(370, 95, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Completed', '2025-01-11 08:26:53', '2025-01-29 07:12:34', '2025-01-18', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(371, 96, 25, 'Paper Quality: Artcard\r\nPaper Size: 23 x 36\r\nPaper GSM: 157\r\nPaper Quantity: 750\r\n        ', 'Pending', '2025-01-13 07:15:44', '2025-01-13 07:15:44', '2025-01-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(372, 96, 17, 'Paper Quality: Artcard\r\nPaper Size: 23 x 36\r\nPaper GSM: 157\r\nPaper Quantity: 750\r\n\r\nPaper Vendor: greenglobe\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 1200\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-13 07:15:44', '2025-02-06 12:03:39', '0000-00-00', 2, '2025-02-06 12:03:39', NULL, NULL, NULL, NULL, '', NULL),
(373, 96, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-01-13 07:15:44', '2025-01-13 07:15:44', '2025-01-14', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(374, 96, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-13 07:15:44', '2025-01-13 07:15:44', '2025-01-21', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(375, 97, 27, 'Paper Quality: FBB BOARD\r\nPaper Size: 46 x 31.5\r\nPaper GSM: 345\r\nPaper Quantity: 900\r\n        ', 'Pending', '2025-01-13 11:16:20', '2025-01-13 11:16:20', '2025-01-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(376, 97, 20, 'Paper Quality: FBB BOARD\r\nPaper Size: 46 x 31.5\r\nPaper GSM: 345\r\nPaper Quantity: 900\r\n\r\nPaper Vendor: ashtvinayakpaper\r\nCutting Size: 22.25 x 15.75\r\nPrinting Quantity: 3450\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-13 11:16:20', '2025-01-13 11:16:20', '2025-01-19', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(377, 97, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-13 11:16:20', '2025-01-13 11:16:20', '2025-01-14', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(378, 97, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-13 11:16:20', '2025-01-13 11:16:20', '2025-01-21', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(379, 98, 27, 'Paper Quality: FBB BOARD\r\nPaper Size: 46 x 39.5\r\nPaper GSM: 345\r\nPaper Quantity: 600\r\n        ', 'Pending', '2025-01-13 11:20:18', '2025-01-13 11:20:18', '2025-01-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(380, 98, 20, 'Paper Quality: FBB BOARD\r\nPaper Size: 46 x 39.5\r\nPaper GSM: 345\r\nPaper Quantity: 600\r\n\r\nPaper Vendor: ashtvinayakpaper\r\nCutting Size: 23 x 19.75\r\nPrinting Quantity: 2150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-13 11:20:18', '2025-01-13 11:20:18', '2025-01-19', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(381, 98, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-13 11:20:18', '2025-01-13 11:20:18', '2025-01-14', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(382, 98, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2025-01-13 11:20:18', '2025-01-13 11:20:18', '2025-01-21', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(383, 99, 27, 'Paper Quality: FBB BOARD\r\nPaper Size: 46 x 32\r\nPaper GSM: 345\r\nPaper Quantity: 800\r\n        ', 'Pending', '2025-01-13 12:22:38', '2025-01-13 12:22:38', '2025-01-16', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(384, 99, 17, 'Paper Quality: FBB BOARD\r\nPaper Size: 46 x 32\r\nPaper GSM: 345\r\nPaper Quantity: 800\r\n\r\nPaper Vendor: ashtvinayakpaper\r\nCutting Size: 16 x 23.75\r\nPrinting Quantity: 3200\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-13 12:22:38', '2025-01-13 12:22:38', '2025-01-19', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(385, 99, 14, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-01-13 12:22:38', '2025-01-13 12:22:38', '2025-01-14', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(386, 99, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-13 12:22:38', '2025-01-13 12:22:38', '2025-01-22', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(387, 100, 2, 'Paper Quality: Artcard\r\nPaper Size: 23 x 36\r\nPaper GSM: 350\r\nPaper Quantity: 400\r\n        ', 'Pending', '2025-01-14 07:33:15', '2025-01-14 07:33:15', '2025-01-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(388, 100, 12, 'Paper Quality: Artcard\r\nPaper Size: 23 x 36\r\nPaper GSM: 350\r\nPaper Quantity: 400\r\n\r\nPaper Vendor: paper\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 800\r\nPrinting Type: Offset\r\nColor: 2 Color', 'Pending', '2025-01-14 07:33:15', '2025-01-14 07:33:15', '2025-01-21', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(389, 100, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Pending', '2025-01-14 07:33:15', '2025-01-14 07:33:15', '2025-01-15', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(390, 100, 13, 'Lamination Type: Warnish\r\nUV: no\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-14 07:33:15', '2025-01-14 07:33:15', '2025-01-22', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(391, 101, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 20 x 43\r\nPaper GSM: 400\r\nPaper Quantity: 350\r\n        ', 'Completed', '2025-01-15 09:10:09', '2025-01-30 05:45:38', '2025-01-18', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(392, 101, 18, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 20 x 43\r\nPaper GSM: 400\r\nPaper Quantity: 350\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 19.75 x 18.36\r\nPrinting Quantity: 700\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Completed', '2025-01-15 09:10:09', '2025-01-30 05:45:51', '2025-01-21', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(393, 101, 9, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Completed', '2025-01-15 09:10:09', '2025-01-30 05:46:03', '2025-01-16', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(394, 101, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Completed', '2025-01-15 09:10:09', '2025-01-30 05:46:11', '2025-01-24', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(395, 102, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 21.4 X 20.5\r\nPaper GSM: 340\r\nPaper Quantity: 1000\r\n        ', 'Pending', '2025-01-20 07:16:38', '2025-01-20 07:16:38', '2025-01-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(396, 102, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 21.4 X 20.5\r\nPaper GSM: 340\r\nPaper Quantity: 1000\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 20.51 x 21\r\nPrinting Quantity: 1000\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-01-20 07:16:38', '2025-01-20 07:16:38', '2025-01-26', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(397, 102, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-01-20 07:16:38', '2025-01-20 07:16:38', '2025-01-21', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(398, 102, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-01-20 07:16:38', '2025-01-20 07:16:38', '2025-01-28', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sub_tasks` (`sub_task_id`, `main_task_id`, `assigned_to`, `description`, `status`, `created_at`, `updated_at`, `delivery_date`, `assigned_to_department`, `completed_at`, `admin_comment`, `admin_updated_on`, `manager_comment`, `manager_updated_on`, `user_comment`, `user_updated_on`) VALUES
(399, 103, 16, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 44 x 34\r\nPaper GSM: 350\r\nPaper Quantity: 1200\r\n        ', 'Pending', '2025-01-20 08:57:48', '2025-01-20 08:57:48', '2025-01-23', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(400, 103, 12, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 44 x 34\r\nPaper GSM: 350\r\nPaper Quantity: 1200\r\n\r\nPaper Vendor: instock\r\nCutting Size: 22 x 17\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-20 08:57:48', '2025-01-20 08:57:48', '2025-01-26', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(401, 103, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Pending', '2025-01-20 08:57:48', '2025-01-20 08:57:48', '2025-01-21', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(402, 103, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-20 08:57:48', '2025-01-20 08:57:48', '2025-01-28', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(403, 104, 8, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 24 x 39.5\r\nPaper GSM: 400\r\nPaper Quantity: 800\r\n        ', 'Pending', '2025-01-21 12:14:33', '2025-01-21 12:14:33', '2025-01-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(404, 104, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 24 x 39.5\r\nPaper GSM: 400\r\nPaper Quantity: 800\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 24 x 19.75\r\nPrinting Quantity: 1275\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-21 12:14:33', '2025-01-21 12:14:33', '2025-01-27', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(405, 104, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-21 12:14:33', '2025-01-21 12:14:33', '2025-01-22', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(406, 104, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-21 12:14:33', '2025-01-21 12:14:33', '2025-01-28', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(407, 105, 16, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 24 x 39.5\r\nPaper GSM: 400\r\nPaper Quantity: 800\r\n        ', 'Pending', '2025-01-21 12:17:27', '2025-01-21 12:17:27', '2025-01-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(408, 105, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 24 x 39.5\r\nPaper GSM: 400\r\nPaper Quantity: 800\r\n\r\nPaper Vendor: instock\r\nCutting Size: 24 x 19.75\r\nPrinting Quantity: 165\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-21 12:17:27', '2025-01-21 12:17:27', '2025-01-27', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(409, 105, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-21 12:17:27', '2025-01-21 12:17:27', '2025-01-22', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(410, 105, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-21 12:17:27', '2025-01-21 12:17:27', '2025-01-29', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(411, 106, 8, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 23 x 36\r\nPaper GSM: 400\r\nPaper Quantity: 600\r\n        ', 'Completed', '2025-01-21 12:28:01', '2025-01-29 07:08:02', '2025-01-24', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(412, 106, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 23 x 36\r\nPaper GSM: 400\r\nPaper Quantity: 600\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 650\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-21 12:28:01', '2025-01-29 07:08:09', '2025-01-27', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(413, 106, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2025-01-21 12:28:01', '2025-01-29 07:08:18', '2025-01-22', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(414, 106, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2025-01-21 12:28:01', '2025-01-29 07:08:29', '2025-01-28', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(415, 107, 16, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 23 x 36\r\nPaper GSM: 400\r\nPaper Quantity: 600\r\n        ', 'Completed', '2025-01-21 12:30:28', '2025-01-29 07:04:48', '2025-01-24', 1, NULL, '', NULL, NULL, NULL, NULL, NULL),
(416, 107, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 23 x 36\r\nPaper GSM: 400\r\nPaper Quantity: 600\r\n\r\nPaper Vendor: instock\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 400\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Completed', '2025-01-21 12:30:28', '2025-01-29 07:04:55', '2025-01-27', 2, NULL, '', NULL, NULL, NULL, NULL, NULL),
(417, 107, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Completed', '2025-01-21 12:30:28', '2025-01-29 07:05:03', '2025-01-22', 3, NULL, '', NULL, NULL, NULL, NULL, NULL),
(418, 107, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Completed', '2025-01-21 12:30:28', '2025-01-29 07:05:14', '2025-01-28', 4, NULL, '', NULL, NULL, NULL, NULL, NULL),
(419, 109, 16, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 400\r\nPaper Quantity: 1400\r\n        ', 'Pending', '2025-01-21 12:57:38', '2025-01-21 12:57:38', '2025-01-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(420, 109, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 400\r\nPaper Quantity: 1400\r\n\r\nPaper Vendor: instock\r\nCutting Size: 24.75 x 12.64\r\nPrinting Quantity: 1650\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-21 12:57:38', '2025-01-21 12:57:38', '2025-01-27', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(421, 109, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-21 12:57:38', '2025-01-21 12:57:38', '2025-01-22', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(422, 109, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-21 12:57:38', '2025-01-21 12:57:38', '2025-01-29', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(423, 110, 16, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 400\r\nPaper Quantity: 400\r\n        ', 'Pending', '2025-01-21 13:00:01', '2025-01-21 13:00:01', '2025-01-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(424, 110, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 400\r\nPaper Quantity: 400\r\n\r\nPaper Vendor: instock\r\nCutting Size: 24.75  x 12.64\r\nPrinting Quantity: 1400\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-21 13:00:01', '2025-01-21 13:00:01', '2025-01-26', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(425, 110, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-21 13:00:01', '2025-01-21 13:00:01', '2025-01-22', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(426, 110, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-21 13:00:01', '2025-01-21 13:00:01', '2025-01-29', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(427, 111, 8, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 400\r\nPaper Quantity: 4200\r\n        ', 'Pending', '2025-01-23 07:08:25', '2025-01-23 07:08:25', '2025-01-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(428, 111, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 400\r\nPaper Quantity: 4200\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 25 x 19\r\nPrinting Quantity: 6150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-23 07:08:25', '2025-01-23 07:08:25', '2025-01-29', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(429, 111, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-23 07:08:25', '2025-01-23 07:08:25', '2025-01-24', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(430, 111, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-23 07:08:25', '2025-01-23 07:08:25', '2025-02-01', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(431, 112, 16, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 400\r\nPaper Quantity: 4200\r\n        ', 'Pending', '2025-01-23 07:11:10', '2025-01-23 07:11:10', '2025-01-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(432, 112, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 400\r\nPaper Quantity: 4200\r\n\r\nPaper Vendor: instock\r\nCutting Size: 25 x 19\r\nPrinting Quantity: 2150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-23 07:11:10', '2025-01-23 07:11:10', '2025-01-29', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(433, 112, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-23 07:11:10', '2025-01-23 07:11:10', '2025-01-24', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(434, 112, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-23 07:11:10', '2025-01-23 07:11:10', '2025-02-01', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(435, 113, 19, 'Paper Quality: FBB BOARD\r\nPaper Size: 26 x 36\r\nPaper GSM: 290\r\nPaper Quantity: 1000\r\n        ', 'Pending', '2025-01-23 08:50:59', '2025-01-23 08:50:59', '2025-01-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(436, 113, 17, 'Paper Quality: FBB BOARD\r\nPaper Size: 26 x 36\r\nPaper GSM: 290\r\nPaper Quantity: 1000\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 26 x 18\r\nPrinting Quantity: 2000\r\nPrinting Type: Offset\r\nColor: 3 Color', 'Pending', '2025-01-23 08:50:59', '2025-01-23 08:50:59', '2025-01-29', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(437, 113, 14, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-01-23 08:50:59', '2025-01-23 08:50:59', '2025-01-24', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(438, 113, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-23 08:50:59', '2025-01-23 08:50:59', '2025-02-01', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(439, 114, 16, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 44 x 34\r\nPaper GSM: 350\r\nPaper Quantity: 1200\r\n        ', 'Pending', '2025-01-24 06:09:30', '2025-01-24 06:09:30', '2025-01-25', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(440, 114, 12, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 44 x 34\r\nPaper GSM: 350\r\nPaper Quantity: 1200\r\n\r\nPaper Vendor: instock\r\nCutting Size: 22 x 17\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-01-24 06:09:30', '2025-01-24 06:09:30', '2025-01-27', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(441, 114, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Pending', '2025-01-24 06:09:30', '2025-01-24 06:09:30', '2025-01-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(442, 114, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-24 06:09:30', '2025-01-24 06:09:30', '2025-01-30', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(443, 115, 29, 'Paper Quality: FBB BOARD\r\nPaper Size: 31.5 x 41.5\r\nPaper GSM: 350\r\nPaper Quantity: 1300\r\n        ', 'Pending', '2025-01-24 06:18:27', '2025-01-24 06:18:27', '2025-01-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(444, 115, 12, 'Paper Quality: FBB BOARD\r\nPaper Size: 31.5 x 41.5\r\nPaper GSM: 350\r\nPaper Quantity: 1300\r\n\r\nPaper Vendor: bkenterprises\r\nCutting Size: 15.35 x 20.75\r\nPrinting Quantity: 4100\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-01-24 06:18:27', '2025-01-24 06:18:27', '2025-01-30', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(445, 115, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Pending', '2025-01-24 06:18:27', '2025-01-24 06:18:27', '2025-01-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(446, 115, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-24 06:18:27', '2025-01-24 06:18:27', '2025-01-31', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(447, 116, 16, 'Paper Quality: FBB BOARD\r\nPaper Size: 31.5 x 41.5\r\nPaper GSM: 350\r\nPaper Quantity: 1300\r\n        ', 'Pending', '2025-01-24 06:24:18', '2025-01-24 06:24:18', '2025-01-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(448, 116, 12, 'Paper Quality: FBB BOARD\r\nPaper Size: 31.5 x 41.5\r\nPaper GSM: 350\r\nPaper Quantity: 1300\r\n\r\nPaper Vendor: instock\r\nCutting Size: 15.35 x 20.75\r\nPrinting Quantity: 1100\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-24 06:24:18', '2025-01-24 06:24:18', '2025-01-30', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(449, 116, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Pending', '2025-01-24 06:24:18', '2025-01-24 06:24:18', '2025-01-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(450, 116, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-24 06:24:18', '2025-01-24 06:24:18', '2025-01-30', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(451, 117, 8, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 24 x 34\r\nPaper GSM: 350\r\nPaper Quantity: 575\r\n        ', 'Pending', '2025-01-24 07:08:05', '2025-01-24 07:08:05', '2025-01-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(452, 117, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 24 x 34\r\nPaper GSM: 350\r\nPaper Quantity: 575\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 16.75 x 22\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-24 07:08:05', '2025-01-24 07:08:05', '2025-01-30', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(453, 117, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-24 07:08:05', '2025-01-24 07:08:05', '2025-01-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(454, 117, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-24 07:08:05', '2025-01-24 07:08:05', '2025-01-30', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(455, 118, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 35.6  x 25\r\nPaper GSM: 320\r\nPaper Quantity: 500\r\n        ', 'Pending', '2025-01-24 07:50:36', '2025-01-24 07:50:36', '2025-01-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(456, 118, 23, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 35.6  x 25\r\nPaper GSM: 320\r\nPaper Quantity: 500\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 17.49 x 25\r\nPrinting Quantity: 1030\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-01-24 07:50:36', '2025-01-24 07:50:36', '2025-01-31', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(457, 118, 9, 'Plate Type: Offset\r\nDeliver to Printer: pushpaprinter', 'Pending', '2025-01-24 07:50:36', '2025-01-24 07:50:36', '2025-01-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(458, 118, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-01-24 07:50:36', '2025-01-24 07:50:36', '2025-01-31', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(459, 119, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 22 x 27\r\nPaper GSM: 400\r\nPaper Quantity: 400\r\n        ', 'Pending', '2025-01-24 08:37:51', '2025-01-24 08:37:51', '2025-01-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(460, 119, 23, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 22 x 27\r\nPaper GSM: 400\r\nPaper Quantity: 400\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 22 x 27\r\nPrinting Quantity: 400\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-01-24 08:37:51', '2025-01-24 08:37:51', '2025-01-27', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(461, 119, 14, 'Plate Type: Offset\r\nDeliver to Printer: pushpaprinter', 'Pending', '2025-01-24 08:37:51', '2025-01-24 08:37:51', '2025-01-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(462, 119, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-01-24 08:37:51', '2025-01-24 08:37:51', '2025-01-31', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(463, 120, 30, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 16.5 x 24\r\nPaper GSM: 350\r\nPaper Quantity: 4450\r\n        ', 'Pending', '2025-01-24 09:44:26', '2025-01-24 09:44:26', '2025-01-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(464, 120, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 16.5 x 24\r\nPaper GSM: 350\r\nPaper Quantity: 4450\r\n\r\nPaper Vendor: hirenbhai\r\nCutting Size: 16.5 x 24\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-24 09:44:26', '2025-01-24 09:44:26', '2025-01-28', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(465, 120, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-24 09:44:26', '2025-01-24 09:44:26', '2025-01-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(466, 120, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Pending', '2025-01-24 09:44:26', '2025-01-24 09:44:26', '2025-01-31', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(467, 121, 30, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 16.5 x 24\r\nPaper GSM: 350\r\nPaper Quantity: 4450\r\n        ', 'Pending', '2025-01-24 09:50:18', '2025-01-24 09:50:18', '2025-01-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(468, 121, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 16.5 x 24\r\nPaper GSM: 350\r\nPaper Quantity: 4450\r\n\r\nPaper Vendor: hirenbhai\r\nCutting Size: 16.5 x 24\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-01-24 09:50:18', '2025-01-24 09:50:18', '2025-01-30', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(469, 121, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-24 09:50:18', '2025-01-24 09:50:18', '2025-01-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(470, 121, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: old\r\nPunching: old\r\n        ', 'Pending', '2025-01-24 09:50:18', '2025-01-24 09:50:18', '2025-01-30', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(471, 122, 16, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 16.5 x 24\r\nPaper GSM: 350\r\nPaper Quantity: 4450\r\n        ', 'Pending', '2025-01-24 09:55:39', '2025-01-24 09:55:39', '2025-01-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(472, 122, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 16.5 x 24\r\nPaper GSM: 350\r\nPaper Quantity: 4450\r\n\r\nPaper Vendor: instock\r\nCutting Size: 16.5 x 24\r\nPrinting Quantity: 2150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-24 09:55:39', '2025-01-24 09:55:39', '2025-01-30', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(473, 122, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-24 09:55:39', '2025-01-24 09:55:39', '2025-01-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(474, 122, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: old\r\nPunching: old\r\n        ', 'Pending', '2025-01-24 09:55:39', '2025-01-24 09:55:39', '2025-01-31', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(475, 123, 30, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 26.75 x 16.5\r\nPaper GSM: 350\r\nPaper Quantity: 1150\r\n        ', 'Pending', '2025-01-24 10:05:40', '2025-01-24 10:05:40', '2025-01-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(476, 123, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 26.75 x 16.5\r\nPaper GSM: 350\r\nPaper Quantity: 1150\r\n\r\nPaper Vendor: hirenbhai\r\nCutting Size: 26.75 x 16.5\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-24 10:05:40', '2025-01-24 10:05:40', '2025-01-30', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(477, 123, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-24 10:05:40', '2025-01-24 10:05:40', '2025-01-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(478, 123, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Pending', '2025-01-24 10:05:40', '2025-01-24 10:05:40', '2025-01-31', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(479, 124, 30, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 24.2 x 19.75\r\nPaper GSM: 350\r\nPaper Quantity: 1150\r\n        ', 'Pending', '2025-01-24 10:09:47', '2025-01-24 10:09:47', '2025-01-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(480, 124, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 24.2 x 19.75\r\nPaper GSM: 350\r\nPaper Quantity: 1150\r\n\r\nPaper Vendor: hirenbhai\r\nCutting Size: 24.2 x 19.75\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-24 10:09:47', '2025-01-24 10:09:47', '2025-01-30', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(481, 124, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-24 10:09:47', '2025-01-24 10:09:47', '2025-01-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(482, 124, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Pending', '2025-01-24 10:09:47', '2025-01-24 10:09:47', '2025-01-31', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(483, 125, 30, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 21.75 x 17.87\r\nPaper GSM: 350\r\nPaper Quantity: 650\r\n        ', 'Pending', '2025-01-24 11:24:06', '2025-01-24 11:24:06', '2025-01-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(484, 125, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 21.75 x 17.87\r\nPaper GSM: 350\r\nPaper Quantity: 650\r\n\r\nPaper Vendor: hirenbhai\r\nCutting Size: 21.75 x 17.87\r\nPrinting Quantity: 650\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-24 11:24:06', '2025-01-24 11:24:06', '2025-01-28', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(485, 125, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-24 11:24:06', '2025-01-24 11:24:06', '2025-01-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(486, 125, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2025-01-24 11:24:06', '2025-01-24 11:24:06', '2025-01-31', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(487, 126, 30, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 21.75 x 16\r\nPaper GSM: 350\r\nPaper Quantity: 650\r\n        ', 'Pending', '2025-01-24 11:26:45', '2025-01-24 11:26:45', '2025-01-26', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(488, 126, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 21.75 x 16\r\nPaper GSM: 350\r\nPaper Quantity: 650\r\n\r\nPaper Vendor: hirenbhai\r\nCutting Size: 21.75 x 16\r\nPrinting Quantity: 650\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-24 11:26:45', '2025-01-24 11:26:45', '2025-01-29', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(489, 126, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-24 11:26:45', '2025-01-24 11:26:45', '2025-01-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(490, 126, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-24 11:26:45', '2025-01-24 11:26:45', '2025-01-31', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(491, 127, 25, 'Paper Quality: Artcard\r\nPaper Size: 23 x 36\r\nPaper GSM: 157\r\nPaper Quantity: 500\r\n        ', 'Pending', '2025-01-28 08:00:35', '2025-01-28 08:00:35', '2025-01-31', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(492, 127, 17, 'Paper Quality: Artcard\r\nPaper Size: 23 x 36\r\nPaper GSM: 157\r\nPaper Quantity: 500\r\n\r\nPaper Vendor: greenglobe\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 1200\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-28 08:00:35', '2025-01-28 08:00:35', '2025-02-03', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(493, 127, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-01-28 08:00:35', '2025-01-28 08:00:35', '2025-01-29', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(494, 127, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-28 08:00:35', '2025-01-28 08:00:35', '2025-02-06', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(495, 128, 19, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 25 x 15.29\r\nPaper GSM: 350\r\nPaper Quantity: 2650\r\n        ', 'Pending', '2025-01-29 06:05:50', '2025-01-29 06:05:50', '2025-02-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(496, 128, 17, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 25 x 15.29\r\nPaper GSM: 350\r\nPaper Quantity: 2650\r\n\r\nPaper Vendor: kavitripaper\r\nCutting Size: 24.75 x 15.29\r\nPrinting Quantity: 2650\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-29 06:05:50', '2025-01-29 06:05:50', '2025-02-04', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(497, 128, 14, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-01-29 06:05:50', '2025-01-29 06:05:50', '2025-01-30', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(498, 128, 13, 'Lamination Type: Dripoff\r\nUV: no\r\nEmboss: old\r\nPunching: old\r\n        ', 'Pending', '2025-01-29 06:05:50', '2025-01-29 06:05:50', '2025-02-08', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(499, 129, 30, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 20.75 x 17.6\r\nPaper GSM: 350\r\nPaper Quantity: 1000\r\n        ', 'Pending', '2025-01-29 08:35:15', '2025-01-29 08:35:15', '2025-02-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(500, 129, 17, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 20.75 x 17.6\r\nPaper GSM: 350\r\nPaper Quantity: 1000\r\n\r\nPaper Vendor: hirenbhai\r\nCutting Size: 20.75 x 17.6\r\nPrinting Quantity: 1000\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-29 08:35:15', '2025-01-29 08:35:15', '2025-02-02', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(501, 129, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-01-29 08:35:15', '2025-01-29 08:35:15', '2025-01-30', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(502, 129, 13, 'Lamination Type: Dripoff\r\nUV: no\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-01-29 08:35:15', '2025-01-29 08:35:15', '2025-02-08', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(503, 130, 16, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 18 x 23\r\nPaper GSM: 350\r\nPaper Quantity: 650\r\n        ', 'Pending', '2025-01-29 09:11:48', '2025-01-29 09:11:48', '2025-02-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(504, 130, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 18 x 23\r\nPaper GSM: 350\r\nPaper Quantity: 650\r\n\r\nPaper Vendor: instock\r\nCutting Size: 18 x 23\r\nPrinting Quantity: 650\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-29 09:11:48', '2025-01-29 09:11:48', '2025-02-01', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(505, 130, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-29 09:11:48', '2025-01-29 09:11:48', '2025-01-30', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(506, 130, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2025-01-29 09:11:48', '2025-01-29 09:11:48', '2025-02-06', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(507, 131, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 35.6 x 25\r\nPaper GSM: 320\r\nPaper Quantity: 1800\r\n        ', 'Pending', '2025-01-30 06:04:39', '2025-01-30 06:04:39', '2025-02-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(508, 131, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 35.6 x 25\r\nPaper GSM: 320\r\nPaper Quantity: 1800\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 17.5 x 25\r\nPrinting Quantity: 2650\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-01-30 06:04:39', '2025-01-30 06:04:39', '2025-02-05', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(509, 131, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-01-30 06:04:39', '2025-01-30 06:04:39', '2025-01-31', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(510, 131, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-01-30 06:04:39', '2025-01-30 06:04:39', '2025-02-07', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(511, 132, 16, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 35,6 x 25\r\nPaper GSM: 320\r\nPaper Quantity: 1800\r\n        ', 'Pending', '2025-01-30 06:10:07', '2025-01-30 06:10:07', '2025-02-02', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(512, 132, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 35,6 x 25\r\nPaper GSM: 320\r\nPaper Quantity: 1800\r\n\r\nPaper Vendor: instock\r\nCutting Size: 17.5 x 25\r\nPrinting Quantity: 985\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-01-30 06:10:07', '2025-01-30 06:10:07', '2025-02-05', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(513, 132, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-01-30 06:10:07', '2025-01-30 06:10:07', '2025-01-31', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(514, 132, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: old\r\nPunching: old\r\n        ', 'Pending', '2025-01-30 06:10:07', '2025-01-30 06:10:07', '2025-02-08', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(515, 133, 21, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 28 x 44\r\nPaper GSM: 400\r\nPaper Quantity: 400\r\n        ', 'Pending', '2025-01-31 05:58:54', '2025-01-31 05:58:54', '2025-02-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(516, 133, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 28 x 44\r\nPaper GSM: 400\r\nPaper Quantity: 400\r\n\r\nPaper Vendor: prakashpaper\r\nCutting Size: 25.87 x 21.14\r\nPrinting Quantity: 775\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-01-31 05:58:54', '2025-01-31 05:58:54', '2025-02-07', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(517, 133, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-01-31 05:58:54', '2025-01-31 05:58:54', '2025-02-01', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(518, 133, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-01-31 05:58:54', '2025-01-31 05:58:54', '2025-02-08', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(519, 134, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 24 x 34.5\r\nPaper GSM: 400\r\nPaper Quantity: 5200\r\n        ', 'Pending', '2025-02-01 10:45:50', '2025-02-01 10:45:50', '2025-02-03', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(520, 134, 23, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 24 x 34.5\r\nPaper GSM: 400\r\nPaper Quantity: 5200\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 24 x 34.5\r\nPrinting Quantity: 5200\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-01 10:45:50', '2025-02-01 10:45:50', '2025-02-06', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(521, 134, 9, 'Plate Type: Offset\r\nDeliver to Printer: pushpaprinter', 'Pending', '2025-02-01 10:45:50', '2025-02-01 10:45:50', '2025-02-02', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(522, 134, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Pending', '2025-02-01 10:45:50', '2025-02-01 10:45:50', '2025-02-10', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(523, 135, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 27 x 20.25\r\nPaper GSM: 350\r\nPaper Quantity: 5200\r\n        ', 'Pending', '2025-02-01 10:55:04', '2025-02-01 10:55:04', '2025-02-04', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(524, 135, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 27 x 20.25\r\nPaper GSM: 350\r\nPaper Quantity: 5200\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 27 x 20.25\r\nPrinting Quantity: 5200\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-01 10:55:04', '2025-02-01 10:55:04', '2025-02-06', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(525, 135, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-01 10:55:04', '2025-02-01 10:55:04', '2025-02-02', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(526, 135, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-01 10:55:04', '2025-02-01 10:55:04', '2025-02-10', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(527, 136, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 22.3 x 41.2\r\nPaper GSM: 360\r\nPaper Quantity: 3535\r\n        ', 'Pending', '2025-02-03 07:20:29', '2025-02-03 07:20:29', '2025-02-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(528, 136, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 22.3 x 41.2\r\nPaper GSM: 360\r\nPaper Quantity: 3535\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 20.51 x 21\r\nPrinting Quantity: 4200\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-03 07:20:29', '2025-02-03 07:20:29', '2025-02-09', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(529, 136, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-03 07:20:29', '2025-02-03 07:20:29', '2025-02-04', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(530, 136, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-03 07:20:29', '2025-02-03 07:20:29', '2025-02-10', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(531, 137, 16, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 22.3 x 41.2\r\nPaper GSM: 360\r\nPaper Quantity: 3535\r\n        ', 'Pending', '2025-02-03 07:24:34', '2025-02-03 07:24:34', '2025-02-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(532, 137, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 22.3 x 41.2\r\nPaper GSM: 360\r\nPaper Quantity: 3535\r\n\r\nPaper Vendor: instock\r\nCutting Size: 20.51 x 21\r\nPrinting Quantity: 2850\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-03 07:24:34', '2025-02-03 07:24:34', '2025-02-09', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(533, 137, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-03 07:24:34', '2025-02-03 07:24:34', '2025-02-04', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(534, 137, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-03 07:24:34', '2025-02-03 07:24:34', '2025-02-10', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(535, 138, 25, 'Paper Quality: FBB BOARD\r\nPaper Size: 86.5 x 61 cms (34 x 24)\r\nPaper GSM: 350\r\nPaper Quantity: 2650\r\n        ', 'Pending', '2025-02-03 09:53:09', '2025-02-03 09:53:09', '2025-02-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(536, 138, 17, 'Paper Quality: FBB BOARD\r\nPaper Size: 86.5 x 61 cms (34 x 24)\r\nPaper GSM: 350\r\nPaper Quantity: 2650\r\n\r\nPaper Vendor: greenglobe\r\nCutting Size: 16.38  x 24\r\nPrinting Quantity: 3150\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-03 09:53:09', '2025-02-03 09:53:09', '2025-02-09', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(537, 138, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-03 09:53:09', '2025-02-03 09:53:09', '2025-02-04', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(538, 138, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-02-03 09:53:09', '2025-02-03 09:53:09', '2025-02-11', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(539, 139, 16, 'Paper Quality: FBB BOARD\r\nPaper Size: 86.5 x 61 cms (34 x 24)\r\nPaper GSM: 350\r\nPaper Quantity: 2650\r\n        ', 'Pending', '2025-02-03 09:55:49', '2025-02-03 09:55:49', '2025-02-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(540, 139, 17, 'Paper Quality: FBB BOARD\r\nPaper Size: 86.5 x 61 cms (34 x 24)\r\nPaper GSM: 350\r\nPaper Quantity: 2650\r\n\r\nPaper Vendor: instock\r\nCutting Size: 16.38 x 24\r\nPrinting Quantity: 2150\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-03 09:55:49', '2025-02-03 09:55:49', '2025-02-09', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(541, 139, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-03 09:55:49', '2025-02-03 09:55:49', '2025-02-04', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(542, 139, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-02-03 09:55:49', '2025-02-03 09:55:49', '2025-02-11', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(543, 140, 16, 'Paper Quality: FBB BOARD\r\nPaper Size: 86.5 x 56 cms (34X22)\r\nPaper GSM: 350\r\nPaper Quantity: 2650\r\n        ', 'Pending', '2025-02-03 09:59:51', '2025-02-03 09:59:51', '2025-02-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(544, 140, 12, 'Paper Quality: FBB BOARD\r\nPaper Size: 86.5 x 56 cms (34X22)\r\nPaper GSM: 350\r\nPaper Quantity: 2650\r\n\r\nPaper Vendor: instock\r\nCutting Size: 21.75 x 16\r\nPrinting Quantity: 900\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-03 09:59:51', '2025-02-03 09:59:51', '2025-02-09', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(545, 140, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Pending', '2025-02-03 09:59:51', '2025-02-03 09:59:51', '2025-02-04', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(546, 140, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-03 09:59:51', '2025-02-03 09:59:51', '2025-02-11', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(547, 141, 25, 'Paper Quality: FBB BOARD\r\nPaper Size: 105.5 x 80 cms\r\nPaper GSM: 350\r\nPaper Quantity: 1100\r\n        ', 'Pending', '2025-02-03 10:04:50', '2025-02-03 10:04:50', '2025-02-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(548, 141, 12, 'Paper Quality: FBB BOARD\r\nPaper Size: 105.5 x 80 cms\r\nPaper GSM: 350\r\nPaper Quantity: 1100\r\n\r\nPaper Vendor: greenglobe\r\nCutting Size: 15.35 x 20.75\r\nPrinting Quantity: 3150\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-03 10:04:50', '2025-02-03 10:04:50', '2025-02-09', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(549, 141, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Pending', '2025-02-03 10:04:50', '2025-02-03 10:04:50', '2025-02-04', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(550, 141, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-03 10:04:50', '2025-02-03 10:04:50', '2025-02-11', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(551, 142, 16, 'Paper Quality: FBB BOARD\r\nPaper Size: 105.5 x 80 cms\r\nPaper GSM: 350\r\nPaper Quantity: 1100\r\n        ', 'Pending', '2025-02-03 10:07:11', '2025-02-03 10:07:11', '2025-02-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(552, 142, 12, 'Paper Quality: FBB BOARD\r\nPaper Size: 105.5 x 80 cms\r\nPaper GSM: 350\r\nPaper Quantity: 1100\r\n\r\nPaper Vendor: instock\r\nCutting Size: 15.35 x 20.75\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-03 10:07:11', '2025-02-03 10:07:11', '2025-02-09', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(553, 142, 9, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Pending', '2025-02-03 10:07:11', '2025-02-03 10:07:11', '2025-02-04', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(554, 142, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-02-03 10:07:11', '2025-02-03 10:07:11', '2025-02-11', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(555, 143, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 36 x 26\r\nPaper GSM: 400\r\nPaper Quantity: 1400\r\n        ', 'Pending', '2025-02-03 11:24:35', '2025-02-03 11:24:35', '2025-02-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(556, 143, 18, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 36 x 26\r\nPaper GSM: 400\r\nPaper Quantity: 1400\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 18 x 26\r\nPrinting Quantity: 700\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-03 11:24:35', '2025-02-03 11:24:35', '2025-02-09', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(557, 143, 9, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Pending', '2025-02-03 11:24:35', '2025-02-03 11:24:35', '2025-02-04', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(558, 143, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Pending', '2025-02-03 11:24:35', '2025-02-03 11:24:35', '2025-02-11', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(559, 144, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 31 x 41.5\r\nPaper GSM: 380\r\nPaper Quantity: 200\r\n        ', 'Pending', '2025-02-03 11:43:04', '2025-02-03 11:43:04', '2025-02-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(560, 144, 18, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 31 x 41.5\r\nPaper GSM: 380\r\nPaper Quantity: 200\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 24 x 14.65\r\nPrinting Quantity: 650\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-03 11:43:04', '2025-02-03 11:43:04', '2025-02-09', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(561, 144, 9, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Pending', '2025-02-03 11:43:04', '2025-02-03 11:43:04', '2025-02-04', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(562, 144, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-03 11:43:04', '2025-02-03 11:43:04', '2025-02-11', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(563, 145, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 26 x 34\r\nPaper GSM: 380\r\nPaper Quantity: 500\r\n        ', 'Pending', '2025-02-03 12:18:37', '2025-02-03 12:18:37', '2025-02-06', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(564, 145, 18, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 26 x 34\r\nPaper GSM: 380\r\nPaper Quantity: 500\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 23.88 x 16\r\nPrinting Quantity: 900\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-03 12:18:37', '2025-02-03 12:18:37', '2025-02-09', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(565, 145, 9, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Pending', '2025-02-03 12:18:37', '2025-02-03 12:18:37', '2025-02-04', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(566, 145, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Pending', '2025-02-03 12:18:37', '2025-02-03 12:18:37', '2025-02-11', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(567, 146, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 39.2 x 22.3\r\nPaper GSM: 360\r\nPaper Quantity: 1750\r\n        ', 'Pending', '2025-02-04 11:12:58', '2025-02-04 11:12:58', '2025-02-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(568, 146, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 39.2 x 22.3\r\nPaper GSM: 360\r\nPaper Quantity: 1750\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 19.25 x 22.22\r\nPrinting Quantity: 3500\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-04 11:12:58', '2025-02-04 11:12:58', '2025-02-10', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(569, 146, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-04 11:12:58', '2025-02-04 11:12:58', '2025-02-05', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(570, 146, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-04 11:12:58', '2025-02-04 11:12:58', '2025-02-12', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(571, 147, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 39.2 x 27.8\r\nPaper GSM: 360\r\nPaper Quantity: 575\r\n        ', 'Pending', '2025-02-04 11:15:02', '2025-02-04 11:15:02', '2025-02-07', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(572, 147, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 39.2 x 27.8\r\nPaper GSM: 360\r\nPaper Quantity: 575\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 27.75 x 19.75\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-04 11:15:02', '2025-02-04 11:15:02', '2025-02-10', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(573, 147, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-04 11:15:02', '2025-02-04 11:15:02', '2025-02-05', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(574, 147, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-04 11:15:02', '2025-02-04 11:15:02', '2025-02-12', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(575, 148, 29, 'Paper Quality: FBB BOARD\r\nPaper Size: 25 x 41.5\r\nPaper GSM: 350\r\nPaper Quantity: 1015\r\n        ', 'Pending', '2025-02-05 11:39:55', '2025-02-05 11:39:55', '2025-02-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(576, 148, 17, 'Paper Quality: FBB BOARD\r\nPaper Size: 25 x 41.5\r\nPaper GSM: 350\r\nPaper Quantity: 1015\r\n\r\nPaper Vendor: bkenterprises\r\nCutting Size: 24.88 x 20\r\nPrinting Quantity: 2050\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-05 11:39:55', '2025-02-05 11:39:55', '2025-02-11', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(577, 148, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-05 11:39:55', '2025-02-05 11:39:55', '2025-02-06', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(578, 148, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2025-02-05 11:39:55', '2025-02-05 11:39:55', '2025-02-12', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(579, 149, 16, 'Paper Quality: FBB BOARD\r\nPaper Size: 25 x 41.5\r\nPaper GSM: 350\r\nPaper Quantity: 1015\r\n        ', 'Pending', '2025-02-05 11:47:24', '2025-02-05 11:47:24', '2025-02-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(580, 149, 17, 'Paper Quality: FBB BOARD\r\nPaper Size: 25 x 41.5\r\nPaper GSM: 350\r\nPaper Quantity: 1015\r\n\r\nPaper Vendor: instock\r\nCutting Size: 24.88 x 20\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-05 11:47:24', '2025-02-05 11:47:24', '2025-02-10', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(581, 149, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-05 11:47:24', '2025-02-05 11:47:24', '2025-02-06', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(582, 149, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2025-02-05 11:47:24', '2025-02-05 11:47:24', '2025-02-12', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(583, 150, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 31.5 x 41.5\r\nPaper GSM: 350\r\nPaper Quantity: 300\r\n        ', 'Pending', '2025-02-05 11:56:21', '2025-02-05 11:56:21', '2025-02-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(584, 150, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 31.5 x 41.5\r\nPaper GSM: 350\r\nPaper Quantity: 300\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 24 x 14.65\r\nPrinting Quantity: 1000\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-05 11:56:21', '2025-02-05 11:56:21', '2025-02-11', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(585, 150, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-05 11:56:21', '2025-02-05 11:56:21', '2025-02-06', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(586, 150, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-05 11:56:21', '2025-02-05 11:56:21', '2025-02-12', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(587, 151, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 36 x 26.8\r\nPaper GSM: 400\r\nPaper Quantity: 1825\r\n        ', 'Pending', '2025-02-05 12:15:58', '2025-02-05 12:15:58', '2025-02-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(588, 151, 18, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 36 x 26.8\r\nPaper GSM: 400\r\nPaper Quantity: 1825\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 17.24 x 26.75\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-05 12:15:58', '2025-02-05 12:15:58', '2025-02-10', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(589, 151, 9, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Pending', '2025-02-05 12:15:58', '2025-02-05 12:15:58', '2025-02-06', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(590, 151, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-05 12:15:58', '2025-02-05 12:15:58', '2025-02-12', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(591, 152, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 36 x 26.8\r\nPaper GSM: 400\r\nPaper Quantity: 1825\r\n        ', 'Pending', '2025-02-05 12:18:56', '2025-02-05 12:18:56', '2025-02-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(592, 152, 18, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 36 x 26.8\r\nPaper GSM: 400\r\nPaper Quantity: 1825\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 17.24 x 26.75\r\nPrinting Quantity: 650\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-05 12:18:56', '2025-02-05 12:18:56', '2025-02-11', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(593, 152, 9, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Pending', '2025-02-05 12:18:56', '2025-02-05 12:18:56', '2025-02-06', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(594, 152, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-05 12:18:56', '2025-02-05 12:18:56', '2025-02-12', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sub_tasks` (`sub_task_id`, `main_task_id`, `assigned_to`, `description`, `status`, `created_at`, `updated_at`, `delivery_date`, `assigned_to_department`, `completed_at`, `admin_comment`, `admin_updated_on`, `manager_comment`, `manager_updated_on`, `user_comment`, `user_updated_on`) VALUES
(595, 153, 16, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 36 x 26.8\r\nPaper GSM: 400\r\nPaper Quantity: 1825\r\n        ', 'Pending', '2025-02-05 12:22:11', '2025-02-05 12:22:11', '2025-02-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(596, 153, 18, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 36 x 26.8\r\nPaper GSM: 400\r\nPaper Quantity: 1825\r\n\r\nPaper Vendor: instock\r\nCutting Size: 17.24 x 26.75\r\nPrinting Quantity: 1850\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-05 12:22:11', '2025-02-05 12:22:11', '2025-02-11', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(597, 153, 9, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Pending', '2025-02-05 12:22:11', '2025-02-05 12:22:11', '2025-02-06', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(598, 153, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-05 12:22:11', '2025-02-05 12:22:11', '2025-02-12', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(599, 154, 29, 'Paper Quality: FBB BOARD\r\nPaper Size: 46 x 36\r\nPaper GSM: 345\r\nPaper Quantity: 150\r\n        ', 'Pending', '2025-02-05 12:26:14', '2025-02-05 12:26:14', '2025-02-08', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(600, 154, 20, 'Paper Quality: FBB BOARD\r\nPaper Size: 46 x 36\r\nPaper GSM: 345\r\nPaper Quantity: 150\r\n\r\nPaper Vendor: bkenterprises\r\nCutting Size: 21.68 x 17.48\r\nPrinting Quantity: 525\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-05 12:26:14', '2025-02-05 12:26:14', '2025-02-11', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(601, 154, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-02-05 12:26:14', '2025-02-05 12:26:14', '2025-02-06', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(602, 154, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2025-02-05 12:26:14', '2025-02-05 12:26:14', '2025-02-12', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(603, 155, 25, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 91.5 x 55 cms\r\nPaper GSM: 335\r\nPaper Quantity: 1600\r\n        ', 'Pending', '2025-02-06 05:35:36', '2025-02-06 05:35:36', '2025-02-09', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(604, 155, 12, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 91.5 x 55 cms\r\nPaper GSM: 335\r\nPaper Quantity: 1600\r\n\r\nPaper Vendor: greenglobe\r\nCutting Size: 18 x 21.5\r\nPrinting Quantity: 3100\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-06 05:35:36', '2025-02-06 05:35:36', '2025-02-12', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(605, 155, 14, 'Plate Type: Offset\r\nDeliver to Printer: rameshvarprinter', 'Pending', '2025-02-06 05:35:36', '2025-02-06 05:35:36', '2025-02-07', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(606, 155, 13, 'Lamination Type: Matte\r\nUV: no\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-02-06 05:35:36', '2025-02-06 05:35:36', '2025-02-13', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(607, 156, 25, 'Paper Quality: FBB BOARD\r\nPaper Size: 96.5 x 63.5 cms\r\nPaper GSM: 335\r\nPaper Quantity: 400\r\n        ', 'Pending', '2025-02-10 10:33:38', '2025-02-10 10:33:38', '2025-02-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(608, 156, 17, 'Paper Quality: FBB BOARD\r\nPaper Size: 96.5 x 63.5 cms\r\nPaper GSM: 335\r\nPaper Quantity: 400\r\n\r\nPaper Vendor: greenglobe\r\nCutting Size: 23.75 x 18.3\r\nPrinting Quantity: 775\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-10 10:33:38', '2025-02-10 10:33:38', '2025-02-16', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(609, 156, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-10 10:33:38', '2025-02-10 10:33:38', '2025-02-11', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(610, 156, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2025-02-10 10:33:38', '2025-02-10 10:33:38', '2025-02-17', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(611, 157, 29, 'Paper Quality: FBB BOARD\r\nPaper Size: 28 x 32\r\nPaper GSM: 300\r\nPaper Quantity: 910\r\n        ', 'Pending', '2025-02-10 10:44:06', '2025-02-10 10:44:06', '2025-02-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(612, 157, 17, 'Paper Quality: FBB BOARD\r\nPaper Size: 28 x 32\r\nPaper GSM: 300\r\nPaper Quantity: 910\r\n\r\nPaper Vendor: bkenterprises\r\nCutting Size: 15.75 x 27\r\nPrinting Quantity: 1816\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-10 10:44:06', '2025-02-10 10:44:06', '2025-02-16', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(613, 157, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-10 10:44:06', '2025-02-10 10:44:06', '2025-02-11', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(614, 157, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2025-02-10 10:44:06', '2025-02-10 10:44:06', '2025-02-17', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(615, 158, 26, 'Paper Quality: FBB BOARD\r\nPaper Size: 28 x 44\r\nPaper GSM: 350\r\nPaper Quantity: 275\r\n        ', 'Pending', '2025-02-10 10:51:04', '2025-02-10 10:51:04', '2025-02-13', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(616, 158, 17, 'Paper Quality: FBB BOARD\r\nPaper Size: 28 x 44\r\nPaper GSM: 350\r\nPaper Quantity: 275\r\n\r\nPaper Vendor: akshitapaper\r\nCutting Size: 22 x 28\r\nPrinting Quantity: 1100\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-10 10:51:04', '2025-02-10 10:51:04', '2025-02-13', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(617, 158, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-10 10:51:04', '2025-02-10 10:51:04', '2025-02-11', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(618, 158, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2025-02-10 10:51:04', '2025-02-10 10:51:04', '2025-02-17', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(619, 159, 21, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 400\r\nPaper Quantity: 400\r\n        ', 'Pending', '2025-02-11 10:06:52', '2025-02-11 10:06:52', '2025-02-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(620, 159, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 38\r\nPaper GSM: 400\r\nPaper Quantity: 400\r\n\r\nPaper Vendor: prakashpaper\r\nCutting Size: 24.75 x 12.64\r\nPrinting Quantity: 1100\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-11 10:06:52', '2025-02-11 10:06:52', '2025-02-17', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(621, 159, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-02-11 10:06:52', '2025-02-11 10:06:52', '2025-02-12', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(622, 159, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-02-11 10:06:52', '2025-02-11 10:06:52', '2025-02-18', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(623, 160, 21, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 36\r\nPaper GSM: 400\r\nPaper Quantity: 200\r\n        ', 'Pending', '2025-02-11 10:11:20', '2025-02-11 10:11:20', '2025-02-14', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(624, 160, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 25 x 36\r\nPaper GSM: 400\r\nPaper Quantity: 200\r\n\r\nPaper Vendor: prakashpaper\r\nCutting Size: 25 x 12\r\nPrinting Quantity: 600\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-11 10:11:20', '2025-02-11 10:11:20', '2025-02-17', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(625, 160, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-02-11 10:11:20', '2025-02-11 10:11:20', '2025-02-12', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(626, 160, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2025-02-11 10:11:20', '2025-02-11 10:11:20', '2025-02-18', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(627, 161, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 24 x 31.5\r\nPaper GSM: 310\r\nPaper Quantity: 1750\r\n        ', 'Pending', '2025-02-14 08:20:23', '2025-02-14 08:20:23', '2025-02-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(628, 161, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 24 x 31.5\r\nPaper GSM: 310\r\nPaper Quantity: 1750\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 15.75 x 23.65\r\nPrinting Quantity: 3500\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-14 08:20:23', '2025-02-14 08:20:23', '2025-02-20', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(629, 161, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-14 08:20:23', '2025-02-14 08:20:23', '2025-02-15', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(630, 161, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: new\r\n        ', 'Pending', '2025-02-14 08:20:23', '2025-02-14 08:20:23', '2025-02-22', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(631, 162, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 35.6 x 25\r\nPaper GSM: 320\r\nPaper Quantity: 2500\r\n        ', 'Pending', '2025-02-15 07:52:38', '2025-02-15 07:52:38', '2025-02-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(632, 162, 31, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 35.6 x 25\r\nPaper GSM: 320\r\nPaper Quantity: 2500\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 18 x 25\r\nPrinting Quantity: 1820\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-15 07:52:38', '2025-02-15 07:52:38', '2025-02-20', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(633, 162, 9, 'Plate Type: Offset\r\nDeliver to Printer: manualprinter', 'Pending', '2025-02-15 07:52:38', '2025-02-15 07:52:38', '2025-02-16', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(634, 162, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-15 07:52:38', '2025-02-15 07:52:38', '2025-02-23', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(635, 163, 16, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 35.6 x 25\r\nPaper GSM: 320\r\nPaper Quantity: 2500\r\n        ', 'Pending', '2025-02-15 07:55:34', '2025-02-15 07:55:34', '2025-02-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(636, 163, 31, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 35.6 x 25\r\nPaper GSM: 320\r\nPaper Quantity: 2500\r\n\r\nPaper Vendor: instock\r\nCutting Size: 18 x 25\r\nPrinting Quantity: 3150\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-15 07:55:34', '2025-02-15 07:55:34', '2025-02-21', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(637, 163, 9, 'Plate Type: Offset\r\nDeliver to Printer: manualprinter', 'Pending', '2025-02-15 07:55:34', '2025-02-15 07:55:34', '2025-02-16', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(638, 163, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-15 07:55:34', '2025-02-15 07:55:34', '2025-02-22', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(639, 164, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 25 x 31.8\r\nPaper GSM: 350\r\nPaper Quantity: 1325\r\n        ', 'Pending', '2025-02-15 08:26:27', '2025-02-15 08:26:27', '2025-02-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(640, 164, 31, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 25 x 31.8\r\nPaper GSM: 350\r\nPaper Quantity: 1325\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 23.46 x 15.86\r\nPrinting Quantity: 2650\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-15 08:26:27', '2025-02-15 08:26:27', '2025-02-20', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(641, 164, 9, 'Plate Type: Offset\r\nDeliver to Printer: manualprinter', 'Pending', '2025-02-15 08:26:27', '2025-02-15 08:26:27', '2025-02-16', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(642, 164, 13, 'Lamination Type: Dripoff\r\nUV: no\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2025-02-15 08:26:27', '2025-02-15 08:26:27', '2025-02-22', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(643, 165, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 25 x 29.5\r\nPaper GSM: 360\r\nPaper Quantity: 500\r\n        ', 'Pending', '2025-02-15 09:08:39', '2025-02-15 09:08:39', '2025-02-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(644, 165, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 25 x 29.5\r\nPaper GSM: 360\r\nPaper Quantity: 500\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 24.75 x 14.75\r\nPrinting Quantity: 1000\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-15 09:08:39', '2025-02-15 09:08:39', '2025-02-20', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(645, 165, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-15 09:08:39', '2025-02-15 09:08:39', '2025-02-16', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(646, 165, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: old\r\nPunching: new\r\n        ', 'Pending', '2025-02-15 09:08:39', '2025-02-15 09:08:39', '2025-02-22', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(647, 166, 32, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 33 x 24\r\nPaper GSM: 350\r\nPaper Quantity: 2750\r\n        ', 'Pending', '2025-02-15 10:49:48', '2025-02-15 10:49:48', '2025-02-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(648, 166, 17, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 33 x 24\r\nPaper GSM: 350\r\nPaper Quantity: 2750\r\n\r\nPaper Vendor: vagadpaper\r\nCutting Size: 16.38 x 24\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-15 10:49:48', '2025-02-15 10:49:48', '2025-02-20', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(649, 166, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-15 10:49:48', '2025-02-15 10:49:48', '2025-02-16', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(650, 166, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-02-15 10:49:48', '2025-02-15 10:49:48', '2025-02-20', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(651, 167, 16, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 33 x 24\r\nPaper GSM: 350\r\nPaper Quantity: 2750\r\n        ', 'Pending', '2025-02-15 10:52:29', '2025-02-15 10:52:29', '2025-02-17', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(652, 167, 17, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 33 x 24\r\nPaper GSM: 350\r\nPaper Quantity: 2750\r\n\r\nPaper Vendor: instock\r\nCutting Size: 16.38 x 24\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-15 10:52:29', '2025-02-15 10:52:29', '2025-02-20', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(653, 167, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-15 10:52:29', '2025-02-15 10:52:29', '2025-02-16', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(654, 167, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-02-15 10:52:29', '2025-02-15 10:52:29', '2025-02-21', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(655, 168, 16, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 33 x 24\r\nPaper GSM: 350\r\nPaper Quantity: 2750\r\n        ', 'Pending', '2025-02-15 10:54:41', '2025-02-15 10:54:41', '2025-02-18', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(656, 168, 17, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 33 x 24\r\nPaper GSM: 350\r\nPaper Quantity: 2750\r\n\r\nPaper Vendor: instock\r\nCutting Size: 16.38 x 24\r\nPrinting Quantity: 3150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-15 10:54:41', '2025-02-15 10:54:41', '2025-02-21', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(657, 168, 9, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-15 10:54:41', '2025-02-15 10:54:41', '2025-02-16', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(658, 168, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-02-15 10:54:41', '2025-02-15 10:54:41', '2025-02-20', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(659, 169, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 27 x 40,5\r\nPaper GSM: 360\r\nPaper Quantity: 2600\r\n        ', 'Pending', '2025-02-19 06:22:03', '2025-02-19 06:22:03', '2025-02-22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(660, 169, 17, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 27 x 40,5\r\nPaper GSM: 360\r\nPaper Quantity: 2600\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 26.48 x 20.16\r\nPrinting Quantity: 5200\r\nPrinting Type: Offset\r\nColor: 5 Color', 'Pending', '2025-02-19 06:22:03', '2025-02-19 06:22:03', '2025-02-25', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(661, 169, 14, 'Plate Type: Offset\r\nDeliver to Printer: shreejiprinter', 'Pending', '2025-02-19 06:22:03', '2025-02-19 06:22:03', '2025-02-20', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(662, 169, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: old\r\nPunching: old\r\n        ', 'Pending', '2025-02-19 06:22:03', '2025-02-19 06:22:03', '2025-02-26', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(663, 170, 21, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 36 x 46\r\nPaper GSM: 400\r\nPaper Quantity: 200\r\n        ', 'Pending', '2025-02-21 09:03:28', '2025-02-21 09:03:28', '2025-02-24', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(664, 170, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 36 x 46\r\nPaper GSM: 400\r\nPaper Quantity: 200\r\n\r\nPaper Vendor: prakashpaper\r\nCutting Size: 16.61 x 19.31\r\nPrinting Quantity: 850\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-21 09:03:28', '2025-02-21 09:03:28', '2025-02-27', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(665, 170, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-02-21 09:03:28', '2025-02-21 09:03:28', '2025-02-22', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(666, 170, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-02-21 09:03:28', '2025-02-21 09:03:28', '2025-02-28', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(667, 171, 8, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 40.2 x 28.2\r\nPaper GSM: 300\r\nPaper Quantity: 700\r\n        ', 'Pending', '2025-02-24 09:44:16', '2025-02-24 09:44:16', '2025-02-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(668, 171, 22, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 40.2 x 28.2\r\nPaper GSM: 300\r\nPaper Quantity: 700\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 20.12 x 13.19\r\nPrinting Quantity: 2700\r\nPrinting Type: Offset\r\nColor: 2 Color', 'Pending', '2025-02-24 09:44:16', '2025-02-24 09:44:16', '2025-03-02', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(669, 171, 9, 'Plate Type: Offset\r\nDeliver to Printer: magistickprinter', 'Pending', '2025-02-24 09:44:16', '2025-02-24 09:44:16', '2025-02-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(670, 171, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: new\r\n        ', 'Pending', '2025-02-24 09:44:16', '2025-02-24 09:44:16', '2025-03-04', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(671, 172, 16, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 23 x 36\r\nPaper GSM: 400\r\nPaper Quantity: 600\r\n        ', 'Pending', '2025-02-24 09:49:37', '2025-02-24 09:49:37', '2025-02-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(672, 172, 20, 'Paper Quality: JK ULTIMA (WHITE)\r\nPaper Size: 23 x 36\r\nPaper GSM: 400\r\nPaper Quantity: 600\r\n\r\nPaper Vendor: instock\r\nCutting Size: 22.24 x 17.28\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-24 09:49:37', '2025-02-24 09:49:37', '2025-03-01', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(673, 172, 9, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-02-24 09:49:37', '2025-02-24 09:49:37', '2025-02-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(674, 172, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: no\r\nPunching: old\r\n        ', 'Pending', '2025-02-24 09:49:37', '2025-02-24 09:49:37', '2025-03-04', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(675, 173, 30, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 26.75 x 16.5\r\nPaper GSM: 350\r\nPaper Quantity: 1150\r\n        ', 'Pending', '2025-02-24 09:56:36', '2025-02-24 09:56:36', '2025-02-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(676, 173, 20, 'Paper Quality: ITC CYBER EXCEL (CREAM)\r\nPaper Size: 26.75 x 16.5\r\nPaper GSM: 350\r\nPaper Quantity: 1150\r\n\r\nPaper Vendor: hirenbhai\r\nCutting Size: 26.75 x 16.5\r\nPrinting Quantity: 1150\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-24 09:56:36', '2025-02-24 09:56:36', '2025-03-02', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(677, 173, 14, 'Plate Type: Offset\r\nDeliver to Printer: hiyanprinter', 'Pending', '2025-02-24 09:56:36', '2025-02-24 09:56:36', '2025-02-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(678, 173, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-24 09:56:36', '2025-02-24 09:56:36', '2025-03-04', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(679, 175, 8, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 27 x 43.3\r\nPaper GSM: 350\r\nPaper Quantity: 2600\r\n        ', 'Pending', '2025-02-24 10:18:22', '2025-02-24 10:18:22', '2025-02-27', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(680, 175, 18, 'Paper Quality: ITC CARTIN lUMINA (WHITE)\r\nPaper Size: 27 x 43.3\r\nPaper GSM: 350\r\nPaper Quantity: 2600\r\n\r\nPaper Vendor: milanpaper\r\nCutting Size: 26.61 x 21.65\r\nPrinting Quantity: 5200\r\nPrinting Type: Offset\r\nColor: 4 Color', 'Pending', '2025-02-24 10:18:22', '2025-02-24 10:18:22', '2025-03-02', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(681, 175, 9, 'Plate Type: Offset\r\nDeliver to Printer: metarprinter', 'Pending', '2025-02-24 10:18:22', '2025-02-24 10:18:22', '2025-02-25', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(682, 175, 13, 'Lamination Type: Matte\r\nUV: normal\r\nEmboss: new\r\nPunching: old\r\n        ', 'Pending', '2025-02-24 10:18:22', '2025-02-24 10:18:22', '2025-03-04', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `client_name` varchar(100) DEFAULT NULL,
  `client_mobile` varchar(15) DEFAULT NULL,
  `client_email` varchar(100) DEFAULT NULL,
  `client_address` text DEFAULT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `order_quantity` varchar(255) DEFAULT NULL,
  `date_of_order` date NOT NULL,
  `delivery_date` date NOT NULL,
  `paper_quality` varchar(50) DEFAULT NULL,
  `paper_size` varchar(50) DEFAULT NULL,
  `paper_gsm` int(11) DEFAULT NULL,
  `paper_quantity` int(11) DEFAULT NULL,
  `plate_type` varchar(50) DEFAULT NULL,
  `cutting_size` varchar(50) DEFAULT NULL,
  `cutting_size_quantity` int(11) DEFAULT NULL,
  `printing_type` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `lamination_type` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('Pending','In Progress','Completed') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creator` varchar(255) NOT NULL,
  `uv` varchar(50) NOT NULL,
  `emboss` varchar(50) NOT NULL,
  `punching` varchar(50) NOT NULL,
  `completed_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`task_id`, `client_id`, `client_name`, `client_mobile`, `client_email`, `client_address`, `task_name`, `order_quantity`, `date_of_order`, `delivery_date`, `paper_quality`, `paper_size`, `paper_gsm`, `paper_quantity`, `plate_type`, `cutting_size`, `cutting_size_quantity`, `printing_type`, `color`, `lamination_type`, `notes`, `status`, `created_at`, `updated_at`, `creator`, `uv`, `emboss`, `punching`, `completed_at`) VALUES
(1, NULL, 'Poonam corporation', '', '', '', 'Carry bag', '10,000', '2024-11-25', '2024-11-29', 'FBB BOARD', '22x25', 285, 5200, 'Offset', '20.75x25', 10200, 'Offset', '2 Color', 'Matte', 'Please Process urgent', 'Completed', '2024-11-25 06:22:58', '2025-01-10 18:17:06', 'admin', 'normal', 'no', 'old', '2025-01-10'),
(2, NULL, 'Poonam Corporation', '', '', '', '2 in 1 Top', '10k', '2024-11-25', '2024-12-28', 'FBB BOARD', '25 x 28', 330, 2600, 'Offset', '14 x 25', 5200, 'Offset', '2 Color', 'Matte', '', 'Completed', '2024-11-25 06:48:27', '2025-01-15 11:08:51', 'admin', 'no', 'no', 'old', '2025-01-15'),
(3, NULL, 'Poonam Corporation', '', '', '', '2 in 1 Bottom', '10k', '2024-11-25', '2024-11-28', 'FBB BOARD', '30 x 36', 330, 2600, 'Offset', '18 x 30', 5200, 'Offset', '1 Color', 'direct punching', '', 'Completed', '2024-11-25 07:00:51', '2025-01-15 11:09:28', 'admin', 'no', 'no', 'old', '2025-01-15'),
(4, NULL, 'Ycom', '', '', '', 'Racer_Avenger', '10', '2024-11-26', '2024-12-08', 'ITC CARTIN lUMINA (WHITE)', '25 x 35', 320, 1750, 'Offset', '25 x 17.5', 3500, 'Offset', '5 Color', 'Matte', '3 mm Hole\r\nDono ka outer bhi hai', 'Completed', '2024-11-26 08:22:41', '2024-11-26 08:30:11', 'admin', 'normal', 'old', 'old', '2024-11-26'),
(5, NULL, 'Ycom', '', '', '', 'Racer/Avenger Cabel', '10k each', '2024-11-26', '2024-12-06', 'ITC CARTIN lUMINA (WHITE)', '25x35', 320, 1750, 'Offset', '25x17.5', 3500, 'Offset', '5 Color', 'Matte', '3 mm hole in hanging \r\ndono ka outer bhi hai saath mai bhejna', 'Completed', '2024-11-26 08:53:55', '2025-01-13 16:20:20', 'admin', 'normal', 'old', 'old', '2025-01-13'),
(6, NULL, 'Ycom', '', '', '', 'Clone Cable - Inner', '30', '2024-11-26', '2024-12-06', 'ITC CARTIN lUMINA (WHITE)', '25x35', 320, 2600, 'Offset', '25x17.5', 5200, 'Offset', '5 Color', 'Matte', '3 mm hole in hanging / Outer bhi jayega sath me iska', 'Completed', '2024-11-26 09:04:08', '2025-01-13 06:40:05', 'admin', 'normal', 'new', 'new', '2025-01-13'),
(7, NULL, 'Ycom', '', '', '', 'Crossbuds TWS Sleeve', '4k', '2024-11-26', '2024-12-06', 'ITC CARTIN lUMINA (WHITE)', '18 x 26', 350, 800, 'Offset', '24 x 14.65', 800, 'Offset', '5 Color', 'Matte', 'Sab OLD hai / Only sleeve and Foam', 'Completed', '2024-11-26 09:28:37', '2025-01-20 16:47:27', 'admin', 'normal', 'old', 'old', '2025-01-20'),
(8, NULL, 'Palio', '', '', '', 'Pinb 07 Budget / Pinb 07 Budget Pro', '10', '2024-11-27', '2024-12-07', 'ITC CARTIN lUMINA (WHITE)', '27 x 21.8', 340, 7900, 'Offset', '27 x 21.8', 5200, 'Offset', '4 Color', 'Matte', 'Sath me clip jayega 20k / hanging style 2 line / 7900 Sheet aayega usme se 5200 hi chapna baki ka dusre job k liye hai', 'Completed', '2024-11-27 06:11:43', '2025-01-29 10:39:46', 'sanvi', 'normal', 'new', 'old', '2025-01-29'),
(9, NULL, 'Palio', '', '', '', 'Pinb 06 Garden', '10', '2024-11-27', '2024-12-07', 'ITC CARTIN lUMINA (WHITE)', '27 x 21.8', 340, 7900, 'Offset', '27 x 21.8', 2700, 'Offset', '4 Color', 'Matte', 'Sath me 10k clip jayega / hanging style 2 line / job sheet no. 8 mese jo bachega woh paper lena hai 2700 sheets', 'Completed', '2024-11-27 06:18:31', '2025-01-29 10:40:22', 'sanvi', 'normal', 'new', 'old', '2025-01-29'),
(10, NULL, 'Ycom', '', '', '', 'Tri Link Outer', '5k', '2024-11-27', '2024-12-07', 'ITC CARTIN lUMINA (WHITE)', '28.7 x 34.5', 350, 400, 'Offset', '33 x 13.62', 650, 'Offset', '5 Color', 'Matte', 'Punch New hai', 'Completed', '2024-11-27 06:34:17', '2025-01-20 16:47:37', 'sanvi', 'normal', 'new', 'new', '2025-01-20'),
(11, NULL, 'Ycom', '', '', '', 'Cable - Clone outer', '30k', '2024-11-27', '2024-12-07', 'ITC SAFAIRE GRAPHIC (WHITE)', '21.5 x   26.8', 400, 3000, 'Offset', '21.5 x 26.8', 1700, 'Offset', '5 Color', 'Matte', 'Punch OLD / Baki ka paper stock task no. 11-12 k liye use hoga / isme sirf 1700 sheet chapna', 'Completed', '2024-11-27 06:54:59', '2025-01-21 15:30:07', 'sanvi', 'normal', 'new', 'old', '2025-01-21'),
(12, NULL, 'Ycom', '', '', '', 'Cable - Avenger - Outer', '10k', '2024-11-27', '2024-12-07', 'ITC SAFAIRE GRAPHIC (WHITE)', '21.5 x   26.8', 400, 3000, 'Offset', '21.5 x 26.8', 650, 'Offset', '5 Color', 'Matte', 'Task No. 11 Same Punch aur usme se hi paper lena hai / isme 650 sheet chapna', 'Completed', '2024-11-27 07:06:30', '2025-01-21 15:30:13', 'sanvi', 'normal', 'new', 'old', '2025-01-21'),
(13, NULL, 'Ycom', '', '', '', 'Cable - Racer Outer', '10k', '2024-11-27', '2024-12-07', 'ITC SAFAIRE GRAPHIC (WHITE)', '21.5 x 26.8', 400, 3000, 'Offset', '21.5 x 26.8', 650, 'Offset', '5 Color', 'Matte', 'Task No. 11 Same punch aur usme se hi paper leha hai / isme 650 sheet chapna', 'Completed', '2024-11-27 07:11:50', '2025-01-21 15:31:54', 'sanvi', 'normal', 'new', 'old', '2025-01-21'),
(14, NULL, 'Ycom', '', '', '', 'Tri Link Inner', '5k', '2024-11-27', '2024-11-30', 'ITC CARTIN lUMINA (WHITE)', '27 x 20.6', 340, 1000, 'Offset', '27 x 20.6', 1000, 'Offset', '6 Color', 'Matte', '3mm hole for hanging style / sab old hai', 'Completed', '2024-11-27 09:16:56', '2025-01-21 15:31:59', 'sanvi', 'normal', 'old', 'old', '2025-01-21'),
(15, NULL, 'Ycom', '', '', '', 'Ultra / Cord Cable - Inner', '22k each', '2024-11-27', '2024-11-30', 'ITC CARTIN lUMINA (WHITE)', '22 x 29', 400, 9060, 'Offset', '22 x 29', 7530, 'Offset', '4 Color', 'Matte', '3mm hole for hanging style / task no. 15 - 16 paper merge karke aayega / yeh task me sirf 7530 sheet chapna', 'Completed', '2024-11-27 11:48:28', '2024-11-27 11:50:03', 'sanvi', 'normal', 'new', 'new', '2024-11-27'),
(16, NULL, 'Ycom', '', '', '', 'Cord / Ultra cable - Inner', '22k each', '2024-11-27', '2024-12-07', 'ITC CARTIN lUMINA (WHITE)', '22 x 29', 400, 9060, 'Offset', '22 x 29', 7530, 'Offset', '4 Color', 'Matte', '3mm hole hanging style / sathme outer & PVC bhi hai / task 15 - 16 paper merge karke aayega isme 7530 sheet chapna hai', 'Pending', '2024-11-27 11:52:52', '2024-11-27 11:52:52', 'sanvi', 'normal', 'new', 'new', NULL),
(17, NULL, 'Ycom', '', '', '', 'Line cable  - inner', '8k', '2024-11-27', '2024-12-08', 'ITC CARTIN lUMINA (WHITE)', '22 x 29', 400, 9060, 'Offset', '22 x 29', 1530, 'Offset', '4 Color', 'Matte', 'punch as per task no. 16 / outer and PVC ayega isme / task 16 - 17 paper merge karke aayega isme 1530 sheet chapna hai', 'Completed', '2024-11-27 11:57:59', '2025-01-21 15:32:03', 'sanvi', 'normal', 'new', 'new', '2025-01-21'),
(18, NULL, 'Palio', '', '', '', 'Angel / Tara TWS', '3', '2024-11-28', '2024-12-08', 'ITC CARTIN lUMINA (WHITE)', '46 x 36', 350, 500, 'Offset', '18 x 23', 1700, 'Offset', '4 Color', 'Matte', '6000 PVC Shantanu k pass se aayegi / Clip - Dono sath me jayega', 'Completed', '2024-11-28 11:33:19', '2025-01-23 12:42:42', 'sanvi', 'normal', 'new', 'new', '2025-01-23'),
(19, NULL, 'Jaisukh', '', '', '', 'Victoriya Tag', '50', '2024-11-29', '2024-12-08', 'ITC CYBER EXCEL (CREAM)', '18 x 25 / 25 x 36', 320, 2300, 'Offset', '18 x 25', 2400, 'Offset', '2 Color', 'Warnish', '18 x 25 - 22 pkt / 25 x 36 - 1 pkt / Graining / Victoriya - ONLY Embossed (FRONT SIDE) / 2 spl colour hai - sample match karlena', 'Completed', '2024-11-29 06:49:43', '2025-01-11 09:13:38', 'sanvi', 'normal', 'new', 'new', '2025-01-11'),
(20, NULL, 'Jaisukh', '', '', '', 'PopTees - Tag', '41', '2024-11-29', '2024-12-08', 'FBB BOARD', '25 x 38', 330, 1000, 'Offset', '19 x 25', 2000, 'Offset', '1 Color', 'Matte', 'O', 'Completed', '2024-11-29 06:58:28', '2025-01-30 05:18:47', 'sanvi', 'normal', 'no', 'old', '2025-01-30'),
(21, NULL, 'Shravan Bhai', '', '', '', 'RM_Wireless 3 NB', '3k', '2024-11-29', '2024-12-08', 'FBB BOARD', '23 x 36', 350, 900, 'Offset', '18 x 23', 1700, 'Offset', '2 Color', 'Matte', '100 Sheets isme extra aayegi Stock me rakho / Paper hanger', 'Completed', '2024-11-29 10:16:23', '2025-01-27 09:03:34', 'sanvi', 'normal', 'no', 'new', '2025-01-27'),
(22, NULL, 'Shravan Bhai', '', '', '', '141X - TWS', '1', '2024-11-29', '2024-12-08', 'FBB BOARD', '23 x 36', 350, 900, 'Offset', '18 x 23', 600, 'Offset', '4 Color', 'Matte', 'isme 900 sheet chapna hai baki ke task no. 23 k liye use karna / 4 x 7 hanging k liye rubber', 'Completed', '2024-11-29 10:24:27', '2025-01-29 10:36:43', 'sanvi', 'normal', 'no', 'new', '2025-01-29'),
(23, NULL, 'Shravan Bhai', '', '', '', 'Shine TWS', '1', '2024-11-29', '2024-12-08', 'FBB BOARD', '23 x 36', 350, 900, 'Offset', '18 x 23', 1200, 'Offset', '4 Color', 'Matte', 'iske pehelewala KEYPRO TWS ka punch aayega / 4 x 7 hanging k liye rubber / task no. 22 mese use karna paper', 'Completed', '2024-11-29 10:32:03', '2025-01-29 10:37:28', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(24, NULL, 'Stuffcool', '', '', '', 'Snap C Charger', '2', '2024-11-30', '2024-12-09', 'JK ULTIMA (WHITE)', '25 x 36', 400, 400, 'Offset', '23.75 x 16.57', 700, 'Offset', '4 Color', 'Matte', '100 Sheet extra aayegi 18 x 25 ki woh in stock me rakhna / New punch', 'Completed', '2024-11-30 06:04:25', '2025-01-29 07:00:52', 'sanvi', 'embossed', 'no', 'new', '2025-01-29'),
(25, NULL, 'Pareshbhai', '', '', '', 'Worthy Tag', '15', '2024-11-30', '2024-12-09', 'FBB BOARD', '22 x 34', 320, 500, 'Offset', '17 x 22', 1000, 'Offset', '4 Color', 'Matte', 'Old plate no. 65961 / paper stock mese us karna hai / hiyan me chapa tha last tym', 'Completed', '2024-11-30 08:38:45', '2025-01-29 10:34:10', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(26, NULL, 'Shravan Bhai', '', '', '', 'Jazz BT ANC', '5', '2024-12-03', '2024-12-13', 'JK TUFF COAT (CREAM )', '31.5 x 22', 350, 1950, 'Offset', '15.75 x 22', 2700, 'Offset', '4 Color', 'Matte', 'Aroma Old size punch / Hanging k liye rubber hanger - 4 x 7', 'Completed', '2024-12-03 06:43:45', '2025-01-29 10:34:52', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(27, NULL, 'Shravan Bhai', '', '', '', 'Silicone Material NB - BT', '2', '2024-12-03', '2024-12-13', 'JK TUFF COAT (CREAM )', '31.5 x 22', 350, 1950, 'Offset', '15.75 x 22', 1200, 'Offset', '4 Color', 'Matte', 'Aroma old punch / hanging k liye 4 x 7 rubber hanger / Task no. 26 ka bacha hua paper ayega iske liye', 'Completed', '2024-12-03 06:47:29', '2025-01-29 10:35:25', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(28, NULL, 'Jaisukh', '', '', '', 'Nadhi Tag', '50', '2024-12-03', '2024-12-13', 'ITC CARTIN lUMINA (WHITE)', '23.6 x 36', 320, 1120, 'Offset', '18 x 23', 2233, 'Offset', '4 Color', 'Dripoff', 'AV Sara tag ka punch h / pasting job / drippoff aayega', 'Completed', '2024-12-03 09:54:31', '2025-01-29 10:32:52', 'sanvi', 'no', 'no', 'old', '2025-01-29'),
(29, NULL, 'Ycom', '', '', '', 'Chromex Neckband Sleeve', '5', '2024-12-03', '2024-12-13', 'ITC CARTIN lUMINA (WHITE)', '28,7 X 34,5', 400, 930, 'Offset', '17.24 x 26.75', 1860, 'Offset', '4 Color', 'Matte', 'ycom k nexus shine wala punch ayega / hard board trey / foam / paper trey', 'Completed', '2024-12-03 10:01:14', '2024-12-03 10:04:49', 'sanvi', 'normal', 'new', 'old', '2024-12-03'),
(30, NULL, 'Ycom', '', '', '', 'Chromex Neckband Sleeve', '5', '2024-12-03', '2024-12-13', 'ITC CARTIN lUMINA (WHITE)', '28,7 X 34,5', 400, 930, 'Offset', '17.24 x 26.75', 1860, 'Offset', '4 Color', 'Matte', '(Ycom NB Sleeve New) Nexus_Shine ka punch aayega / hardboard trey / inner trey / foam', 'Completed', '2024-12-03 10:09:25', '2025-01-29 10:31:47', 'sanvi', 'normal', 'new', 'old', '2025-01-29'),
(31, NULL, 'Ycom', '', '', '', 'Cord / Ultra cable - outer', '2200', '2024-12-03', '2024-12-13', 'ITC CARTIN lUMINA (WHITE)', '28,7 X 26,2', 400, 3000, 'Offset', '26.18 x 27.32', 3000, 'Offset', '4 Color', 'Matte', 'isme only 2400 sheet chapna baki ka task no. 32 k liye rakhna', 'Completed', '2024-12-03 10:22:01', '2025-01-29 10:31:04', 'sanvi', 'normal', 'new', 'new', '2025-01-29'),
(32, NULL, 'Ycom', '', '', '', 'Line cable - outer', '800', '2024-12-03', '2024-12-06', 'ITC CARTIN lUMINA (WHITE)', '28,7 X 26,2', 400, 3000, 'Offset', '26.18 x 27.32', 600, 'Offset', '4 Color', 'Matte', 'task no. 31 mese paper lena chapna / ultra - cord outer ka punch same aayega', 'Completed', '2024-12-03 10:26:17', '2025-01-29 10:17:24', 'sanvi', 'normal', 'new', 'old', '2025-01-29'),
(33, NULL, 'Jaisukh', '', '', '', 'Jamli Fashion Tag', '20k', '2024-12-04', '2024-12-14', 'FBB BOARD', '22 x 34', 320, 600, 'Offset', '17 x 22', 1200, 'Offset', '2 Color', 'Matte', 'Front on Gold stamping / colour match karna hai sample k hisab se', 'Pending', '2024-12-04 09:35:55', '2024-12-04 09:35:55', 'sanvi', 'no', 'no', 'new', NULL),
(34, NULL, 'Jaisukh', '', '', '', 'Curves - Tag', '5', '2024-12-04', '2024-12-14', 'FBB BOARD', '22 x 34', 320, 243, 'Offset', '17 x 22', 486, 'Offset', '4 Color', 'Matte', 'pasting job', 'Completed', '2024-12-04 09:43:37', '2025-01-29 07:01:41', 'sanvi', 'normal', 'no', 'new', '2025-01-29'),
(35, NULL, 'Stuffcool', '', '', '', 'Novus 25', '4', '2024-12-06', '2024-12-16', 'JK ULTIMA (WHITE)', '23 x 36', 400, 600, 'Offset', '18 x 23', 1200, 'Offset', '4 Color', 'Matte', 'plate new aayegi OLD WALE ME MRP SECTION HAI', 'Completed', '2024-12-06 07:25:18', '2025-01-29 10:20:08', 'sanvi', 'embossed', 'no', 'old', '2025-01-29'),
(36, NULL, 'Palio', '', '', '', 'Pari / Music - NB', '10', '2024-12-10', '2024-12-20', 'ITC CARTIN lUMINA (WHITE)', '22 x 27', 350, 5200, 'Offset', '22 x 27', 5200, 'Offset', '4 Color', 'Matte', 'Oval - Star NB ka punch aayega', 'Completed', '2024-12-10 09:11:50', '2025-01-29 10:21:20', 'sanvi', 'normal', 'new', 'old', '2025-01-29'),
(37, NULL, 'Stuffcool', '', '', '', 'Click 20', '2', '2024-12-12', '2024-12-22', 'JK ULTIMA (WHITE)', '21.5 x 26', 400, 650, 'Offset', '21.5 x 26', 650, 'Offset', '4 Color', 'Matte', 'sab old hai', 'Completed', '2024-12-12 06:39:56', '2025-01-29 10:22:39', 'sanvi', 'normal', 'old', 'old', '2025-01-29'),
(38, NULL, 'Stuffcool', '', '', '', 'Major - Dec24 / Jan25', '5', '2024-12-12', '2024-12-22', 'JK ULTIMA (WHITE)', '21.5 x 24', 400, 2300, 'Offset', '21.5 x 24', 1400, 'Offset', '4 Color', 'Matte', 'only mfg date change / black plate change hai / 2.5k dec24 / 2.5k jan25', 'Completed', '2024-12-12 06:47:51', '2025-01-29 10:23:40', 'sanvi', 'normal', 'old', 'old', '2025-01-29'),
(39, NULL, 'Stuffcool', '', '', '', 'Alum PB', '3', '2024-12-12', '2024-12-22', 'JK ULTIMA (WHITE)', '21.5 x 24', 400, 2300, 'Offset', '21.5 x 24', 900, 'Offset', '4 Color', 'Matte', 'major old plunch / white PB1500 / black PB1500 / task no. 38 mese paper lena hai', 'Completed', '2024-12-12 06:54:04', '2025-01-29 10:24:26', 'sanvi', 'normal', 'new', 'old', '2025-01-29'),
(40, NULL, 'Stuffcool', '', '', '', 'Alto C to L cable', '4', '2024-12-12', '2024-12-22', 'JK ULTIMA (WHITE)', '21.5 x 24.5', 400, 820, 'Offset', '21.5 x 24.5', 820, 'Offset', '4 Color', 'Matte', 'old punch - Alto 100_Celer M', 'Completed', '2024-12-12 12:10:35', '2025-01-29 10:07:33', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(41, NULL, 'Ycom', '', '', '', 'Ryder cable - Inner', '70', '2024-12-16', '2024-12-26', 'ITC CARTIN lUMINA (WHITE)', '17.49 x 25', 400, 11860, 'Offset', '17.49 x 25', 11860, 'Offset', '5 Color', 'Matte', 'Stock mese paper lena h / plate aur sab old aayega', 'Completed', '2024-12-16 06:52:46', '2025-01-30 05:34:44', 'sanvi', 'normal', 'old', 'old', '2025-01-30'),
(42, NULL, 'Ycom', '', '', '', 'Play_Plug Cable - inner', '5', '2024-12-16', '2024-12-26', 'ITC CARTIN lUMINA (WHITE)', '17.49 x 25', 400, 1820, 'Offset', '17.49 x 25', 1820, 'Offset', '5 Color', 'Matte', 'paper in stock / punch old h', 'Completed', '2024-12-16 10:48:55', '2025-01-29 10:08:24', 'sanvi', 'normal', 'new', 'old', '2025-01-29'),
(43, NULL, 'Jaisukh', '', '', '', 'Victoriya plastic', '50', '2024-12-16', '2024-12-26', 'FBB BOARD', '20 x 40', 125, 600, 'Offset', '20 x13.3', 1620, 'Offset', '1 Color', 'direct punching', 'o', 'Completed', '2024-12-16 11:06:02', '2025-01-29 10:09:27', 'sanvi', 'no', 'no', 'new', '2025-01-29'),
(44, NULL, 'Stuffcool', '', '', '', 'Mega 2', '4', '2024-12-16', '2024-12-26', 'JK ULTIMA (WHITE)', '25 x 41.5', 400, 1800, 'Offset', '24 x 19.72', 1150, 'Offset', '4 Color', 'Matte', 'major punch / parekh se paper aayega milan me bill karna h / mega 2 / lucid / click 10 ka merge paper aayega', 'Completed', '2024-12-16 11:14:56', '2025-01-29 10:12:35', 'sanvi', 'normal', 'new', 'old', '2025-01-29'),
(45, NULL, 'Stuffcool', '', '', '', 'lucid', '3', '2024-12-16', '2024-12-26', 'JK ULTIMA (WHITE)', '25 x 41.5', 400, 1800, 'Offset', '24 x 19.72', 900, 'Offset', '4 Color', 'Matte', 'major punch', 'Completed', '2024-12-16 11:22:27', '2025-01-29 10:14:24', 'sanvi', 'normal', 'old', 'old', '2025-01-29'),
(46, NULL, 'Stuffcool', '', '', '', 'click 10', '5500', '2024-12-16', '2024-12-26', 'JK ULTIMA (WHITE)', '25 x 41.5', 400, 1800, 'Offset', '24 x 19.72', 1525, 'Offset', '4 Color', 'Matte', 'major ka punch', 'Completed', '2024-12-16 11:28:39', '2025-01-29 10:15:05', 'sanvi', 'normal', 'old', 'old', '2025-01-29'),
(47, NULL, 'Ycom', '', '', '', 'Ryder cable - outer', '7', '2024-12-16', '2024-12-26', 'JK ULTIMA (WHITE)', '26.75 x 23', 400, 4400, 'Offset', '26.75 x 21.75', 3700, 'Offset', '6 Color', 'Matte', 'sab old hai', 'Completed', '2024-12-16 11:36:32', '2025-01-30 05:35:42', 'sanvi', 'normal', 'old', 'old', '2025-01-30'),
(48, NULL, 'Ycom', '', '', '', 'Play_Plug cable - outer', '500', '2024-12-16', '2024-12-26', 'JK ULTIMA (WHITE)', '26.75 x 23', 400, 4400, 'Offset', '26.75 x 21.75', 650, 'Offset', '5 Color', 'Matte', 'punch old / ryder - play - plug paper merge karke aayega', 'Completed', '2024-12-16 11:42:53', '2025-01-29 10:06:18', 'sanvi', 'normal', 'new', 'old', '2025-01-29'),
(49, NULL, 'Teslaa', '', '', '', 'TSCDC - 161 Pro - Outer', '600', '2024-12-17', '2024-12-27', 'ITC CARTIN lUMINA (WHITE)', '28 x 40', 350, 300, 'Offset', '23.44 x 13.15', 750, 'Offset', '5 Color', 'Matte', 'Silver printing', 'Pending', '2024-12-17 11:03:11', '2024-12-17 11:03:11', 'sanvi', 'normal', 'no', 'new', NULL),
(50, NULL, 'Teslaa', '', '', '', 'TSCDC - 161 Pro / TSHF GO 6 - Inner', '6', '2024-12-17', '2024-12-27', 'ITC CARTIN lUMINA (WHITE)', '36.8 x 28.7', 350, 900, 'Offset', '17.67 x 26.87', 1700, 'Offset', '5 Color', 'Matte', 'TSCDC - 161 pro - 6k / TSHF GO6 - 3k / Silver printing', 'Completed', '2024-12-17 11:12:27', '2025-01-29 10:05:28', 'sanvi', 'no', 'no', 'new', '2025-01-29'),
(51, NULL, 'Jaisukh', '', '', '', 'Boy tone tag ff', '50', '2024-12-17', '2024-12-27', 'FBB BOARD', '25 x 38', 320, 1100, 'Offset', '21.9 x 19.73', 2100, 'Offset', '4 Color', 'Matte', 'Sab old h / pareskh se paper aayega milan me se billing hoga', 'Completed', '2024-12-17 12:37:27', '2025-01-29 09:59:07', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(52, NULL, 'Shravan Bhai', '', '', '', 'OP_BT_BudsX6_TWS', '1', '2024-12-18', '2024-12-28', 'ITC CYBER EXCEL (CREAM)', '36 x 46', 350, 200, 'Offset', '21.38 x 16.65', 650, 'Offset', '4 Color', 'Matte', 'old punch key pro ka / rubber hanger', 'Completed', '2024-12-18 10:27:24', '2025-02-10 07:21:42', 'sanvi', 'normal', 'no', 'old', '2025-02-10'),
(53, NULL, 'Ycom', '', '', '', 'Rapid cable - inner', '30', '2024-12-18', '2024-12-28', 'ITC CARTIN lUMINA (WHITE)', '17.49 x 25', 400, 5200, 'Offset', '17.49 x 25', 5200, 'Offset', '5 Color', 'Matte', 'new design inner nd outer / inner k liye paper stock mese lena h', 'Completed', '2024-12-18 11:24:06', '2025-01-29 10:00:28', 'sanvi', 'normal', 'new', 'old', '2025-01-29'),
(54, NULL, 'Paresh Bhai', '', '', '', 'Kevara Tag', '50', '2024-12-18', '2024-12-28', 'FBB BOARD', '112 x 80 cms', 310, 1300, 'Offset', '22 x 15.5', 5200, 'Offset', '2 Color', 'Matte', 'Diboss aayega / pasting job / sab old h', 'Completed', '2024-12-18 11:47:48', '2025-01-29 10:01:02', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(55, NULL, 'JU Gold', '', '', '', 'Cable - CB-JU201 - inner', '10', '2024-12-21', '2024-12-30', 'ITC CARTIN lUMINA (WHITE)', '12 x 23', 350, 1860, 'Offset', '12 x 23', 1860, 'Offset', '4 Color', 'Glossy', 'hanger nh aayega isme', 'Completed', '2024-12-21 10:01:54', '2025-01-29 10:01:58', 'sanvi', 'normal', 'no', 'new', '2025-01-29'),
(56, NULL, 'Ycom', '', '', '', 'Airpro - TWS', '7', '2024-12-23', '2025-01-02', 'ITC CARTIN lUMINA (WHITE)', '26 x 34', 400, 700, 'Offset', '24.75 x 14.75', 1360, 'Offset', '5 Color', 'Matte', '20 sheets extra (24.75 x 14.75) / black plate only new baki sab old / foam aayega sath me', 'Completed', '2024-12-23 08:08:19', '2025-01-29 10:02:53', 'sanvi', 'normal', 'old', 'old', '2025-01-29'),
(57, NULL, 'Ycom', '', '', '', 'Tejas_Hammer_Rover - cable inner', '15', '2024-12-23', '2025-01-02', 'ITC CARTIN lUMINA (WHITE)', '51 x 31', 400, 1350, 'Offset', '23.75 x 30.9', 2700, 'Offset', '5 Color', 'Matte', 'punch new aayega / Tejas - 2500 / Hammer - 5k / Rover - 7500 / hanging k liye 3mm ka hole', 'Completed', '2024-12-23 09:16:25', '2025-01-29 10:03:51', 'sanvi', 'normal', 'new', 'new', '2025-01-29'),
(58, NULL, 'Stuffcool', '', '', '', 'Warrenty card', '50', '2024-12-23', '2025-01-02', 'ITC CYBER EXCEL (CREAM)', '55cm x 46.5cm', 350, 3100, 'Offset', '55cm x 46.5cm', 3100, 'Offset', '4 Color', 'Matte', 'sab old hai', 'Completed', '2024-12-23 09:37:50', '2025-01-29 09:50:14', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(59, NULL, 'HoneyPort', '', '', '', 'Buzz tune 5 / Marcos / HP i Pro - TWS (Top Bottom)', '1k each', '2024-12-23', '2025-01-02', 'FBB BOARD', '20 x 28', 157, 1850, 'Offset', '20 x 28', 1200, 'Offset', '5 Color', 'Matte', 'Foam & paper trey ayega / punch new / bacha hua paper task no. 60 me aayega', 'Pending', '2024-12-23 11:14:09', '2024-12-23 11:14:09', 'sanvi', 'normal', 'no', 'new', NULL),
(60, NULL, 'HoneyPort', '', '', '', 'Buzz 7 neckband - gely box', '1k', '2024-12-23', '2024-12-26', 'FBB BOARD', '20 x 28', 157, 1850, 'Offset', '20 x 28', 650, 'Offset', '5 Color', 'Matte', 'itune k gely ka punch aayega / foam & Paper trey aayega / task no. 59 mese bacha hua paper lena h', 'Pending', '2024-12-23 11:18:19', '2024-12-23 11:18:19', 'sanvi', 'normal', 'no', 'old', NULL),
(61, NULL, 'Palio', '', '', '', 'P - 13_14_17 - inner (Cable)', '3', '2024-12-26', '2025-01-05', 'JK ULTIMA (WHITE)', '21.4 x 23.4', 330, 1200, 'Offset', '21.4 x 23.4', 1200, 'Offset', '4 Color', 'Matte', 'ok', 'Completed', '2024-12-26 08:15:01', '2025-01-29 09:51:46', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(62, NULL, 'Palio', '', '', '', 'P - 15_16 - Inner (Cable)', '15', '2024-12-26', '2025-01-05', 'JK ULTIMA (WHITE)', '28.2 x 24', 330, 1400, 'Offset', '14.11 X 23.34', 2700, 'Offset', '4 Color', 'Matte', 'P-15 - 5k inner with 500 pc outer / P-16 - 10k inner with 1000 pc outer', 'Completed', '2024-12-26 08:19:01', '2025-01-29 09:52:46', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(63, NULL, 'Palio', '', '', '', 'P-15 - Outer (Cable)', '500', '2024-12-26', '2024-12-29', 'JK ULTIMA (WHITE)', '21.4 x 20', 340, 650, 'Offset', '21.4 x 20', 650, 'Offset', '4 Color', 'Matte', 'P-15_16 k outer ka paper sath me aayega 1800 sheets / P-15 me 650 sheets chapega', 'Completed', '2024-12-26 08:23:05', '2025-01-29 09:53:58', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(64, NULL, 'Palio', '', '', '', 'P - 16 Outer (Cable)', '1', '2024-12-26', '2025-01-05', 'JK ULTIMA (WHITE)', '21.4 x 20', 340, 1800, 'Offset', '21.4 x 20', 1150, 'Offset', '4 Color', 'Matte', 'P-15_16 k outer ka paper sath me aayega / isme sirf 1150 sheet chapega', 'Completed', '2024-12-26 08:27:12', '2025-01-29 09:54:35', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(65, NULL, 'Paresh Bhai', '', '', '', 'JGD Tag', '21', '2024-12-26', '2025-01-05', 'Artcard', '23 x 36', 350, 300, 'Offset', '18 x 23', 600, 'Offset', '5 Color', 'Matte', 'Front Back tag h / UV aayega', 'Completed', '2024-12-26 11:40:16', '2025-01-29 09:55:29', 'sanvi', 'normal', 'no', 'new', '2025-01-29'),
(66, NULL, 'Ycom', '', '', '', 'Coommon_F9 - Earphone', '20', '2024-12-30', '2025-01-09', 'ITC CARTIN lUMINA (WHITE)', '21.4 X 32', 330, 2600, 'Offset', '19.25 x 16', 5200, 'Offset', '5 Color', 'Matte', '4 ups new Punch (Aqua Earphone Size OLD) /', 'Completed', '2024-12-30 05:19:51', '2025-01-29 09:56:07', 'sanvi', 'normal', 'new', 'new', '2025-01-29'),
(67, NULL, 'Stuffcool', '', '', '', 'Roam + PB', '3', '2024-12-31', '2025-01-10', 'JK ULTIMA (WHITE)', '25 x 38', 400, 600, 'Offset', '24.75 x 12.64', 1650, 'Offset', '4 Color', 'Matte', 'Major Plus ka punch aayega / 24.75 x 12.64 ki 50 sheet extra aayegi', 'Completed', '2024-12-31 10:06:50', '2025-01-29 09:57:18', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(68, NULL, 'Macho', '', '', '', 'Cable Inner', '4700', '2025-01-02', '2025-01-12', 'ITC CARTIN lUMINA (WHITE)', '25 x 38', 350, 600, 'Offset', '22.64 x 19', 1200, 'Offset', '4 Color', 'Matte', 'Punch - Landmark - CDC_128 (NEW HI BANANA PADEGA) / Hanging - Rubber Hanger / Set 1 - 350 sheets / Set 2 - 200 Sheets / Set 3 - 650 Sheets / Blister bhi jayega sath me', 'Completed', '2025-01-02 09:23:00', '2025-01-29 09:34:34', 'sanvi', 'normal', 'no', 'new', '2025-01-29'),
(69, NULL, 'Ycom', '', '', '', 'Original Combo Box - Inner', '50k', '2025-01-02', '2025-01-12', 'ITC CARTIN lUMINA (WHITE)', '38 x 25', 350, 4265, 'Offset', '19 x 25', 8530, 'Offset', '4 Color', 'Matte', 'hanging nhi h isme', 'Pending', '2025-01-02 10:57:15', '2025-01-02 10:57:15', 'sanvi', 'normal', 'new', 'new', NULL),
(70, NULL, 'Ycom', '', '', '', 'Thanq Card', '1', '2025-01-02', '2025-01-12', 'Artcard', '24 x 36', 300, 2500, 'Offset', '18 x 22', 5000, 'Offset', '5 Color', 'Matte', 'Self back Printing', 'Completed', '2025-01-02 11:44:57', '2025-01-29 09:38:47', 'sanvi', 'no', 'no', 'no', '2025-01-29'),
(71, NULL, 'Stuffcool', '', '', '', 'Quad Pro Black - 4in1 cable', '4', '2025-01-04', '2025-01-15', 'JK ULTIMA (WHITE)', '36 x 46', 400, 300, 'Offset', '18 x 23', 1150, 'Offset', '4 Color', 'Matte', 'Quad N1 Old Punch', 'Completed', '2025-01-04 07:13:37', '2025-01-29 09:44:19', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(72, NULL, 'Stuffcool', '', '', '', 'Jetset Charger', '3', '2025-01-04', '2025-01-14', 'JK ULTIMA (WHITE)', '28 x 44', 400, 550, 'Offset', '28 x 14.6', 1650, 'Offset', '4 Color', 'Matte', 'New punch', 'Completed', '2025-01-04 07:20:22', '2025-01-29 09:45:05', 'sanvi', 'normal', 'no', 'new', '2025-01-29'),
(73, NULL, 'Ycom', '', '', '', 'Battery Inner - Black', '22800', '2025-01-04', '2025-01-14', 'FBB BOARD', '44 x 38', 350, 4000, 'Offset', '22 x 19', 4000, 'Offset', '4 Color', 'Dripoff', '4 colour - White - Dripoff / inner & outer / backside me hole aayega', 'Completed', '2025-01-04 09:03:59', '2025-01-29 09:46:16', 'sanvi', 'no', 'no', 'new', '2025-01-29'),
(74, NULL, 'Ycom', '', '', '', 'Battery Outer - Black - 5 pcs', '2', '2025-01-04', '2025-01-14', 'FBB BOARD', '28 x 44', 390, 700, 'Offset', '20 x 28', 1340, 'Offset', '4 Color', 'Dripoff', '4 colour - dripoff - white / punch new - 05 pcs', 'Completed', '2025-01-04 09:09:32', '2025-01-29 09:47:09', 'sanvi', 'no', 'no', 'new', '2025-01-29'),
(75, NULL, 'Ycom', '', '', '', 'Rapid cable - Outer', '3', '2025-01-04', '2025-01-14', 'ITC CARTIN lUMINA (WHITE)', '22 x 26.75', 400, 3000, 'Offset', '22 x 26.75', 1650, 'Offset', '5 Color', 'Matte', 'Paper Rest in Stock', 'Completed', '2025-01-04 09:23:03', '2025-01-29 09:47:58', 'sanvi', 'normal', 'new', 'old', '2025-01-29'),
(76, NULL, 'Ycom', '', '', '', 'Original Combo Box - Outer', '5k', '2025-01-04', '2025-01-13', 'ITC CARTIN lUMINA (WHITE)', '36 x 46', 300, 1300, 'Offset', '21.61 x 17', 5200, 'Offset', '4 Color', 'Matte', 'Only lamination printing Corrugation me jayega yeh', 'Pending', '2025-01-04 12:36:42', '2025-01-04 12:36:42', 'sanvi', 'no', 'no', 'new', NULL),
(77, NULL, 'Shravan Bhai', '', '', '', 'OP_NB_DublePacking', '2k', '2025-01-06', '2025-01-08', 'JK TUFF COAT (CREAM )', '36 x 46', 350, 600, 'Offset', '16 x 23.75', 2400, 'Offset', '4 Color', 'Matte', '', 'Pending', '2025-01-06 11:58:34', '2025-01-06 11:58:34', 'sanvi', 'normal', 'no', 'new', NULL),
(78, NULL, 'Stuffcool', '', '', '', 'Major - Feb25 / Mar25', '5', '2025-01-07', '2025-01-17', 'JK ULTIMA (WHITE)', '24 x 39.5', 400, 1400, 'Offset', '23.91 x 19.72', 1400, 'Offset', '4 Color', 'Matte', '24 x 39.5 ka full size me 700 sheet stock me rakhna / sirf black plate aayegi new / magistick se bakike plate uthane old', 'Completed', '2025-01-07 08:57:39', '2025-01-29 08:57:15', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(79, NULL, 'Stuffcool', '', '', '', 'Giga PB', '1', '2025-01-07', '2025-01-17', 'JK ULTIMA (WHITE)', '28 x 44', 400, 200, 'Offset', '25.89 x 21.14', 400, 'Offset', '4 Color', 'Matte', 'Overall artwork change isliye sab plates new aayegi / Punch Old', 'Completed', '2025-01-07 10:00:49', '2025-01-29 08:58:54', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(80, NULL, 'Stuffcool', '', '', '', 'Nuevo 20_Charger', '1', '2025-01-07', '2025-01-17', 'JK ULTIMA (WHITE)', '91.5 x 117', 400, 100, 'Offset', '18 x 23', 400, 'Offset', '4 Color', 'Matte', 'Novus 25 charger ka punch aayega / yeh new artwork h', 'Completed', '2025-01-07 10:09:29', '2025-01-29 09:01:15', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(81, NULL, 'Shravan Bhai', '', '', '', 'Airbuds_CyberBuds_TWS', '1', '2025-01-07', '2025-01-17', 'ITC CYBER EXCEL (CREAM)', '63.5 x 89.5 cm', 400, 500, 'Offset', '24.75 x 17.56', 650, 'Offset', '4 Color', 'Matte', 'task no. 81-82 merge karke aayega yeh paper / rubber hanger', 'Completed', '2025-01-07 10:33:29', '2025-01-29 09:02:18', 'sanvi', 'normal', 'no', 'new', '2025-01-29'),
(82, NULL, 'Shravan Bhai', '', '', '', 'Airdopes161_TWS', '1', '2025-01-07', '2025-01-17', 'ITC CYBER EXCEL (CREAM)', '63.5 x 89.5 cm', 400, 500, 'Offset', '24.75 x 17.56', 350, 'Offset', '4 Color', 'Matte', 'task no. 81-82 ka paper merge karke aayega / dono ka punch same h / rubber hanger', 'Completed', '2025-01-07 10:38:40', '2025-01-29 09:03:54', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(83, NULL, 'Shravan Bhai', '', '', '', 'Set-1 / Set-2', '4', '2025-01-07', '2025-01-17', 'ITC CYBER EXCEL (CREAM)', '63.5 x 80cm', 400, 900, 'Offset', '22.32 x 15.75', 1800, 'Offset', '4 Color', 'Matte', 'Set-1 - 650 sheets - BT-1500, OP-500\r\nSet-2 - 1150 sheets - BT - leather - 2k, BT Shiney atom - 1k, OP - 1k\r\nPunch new', 'Completed', '2025-01-07 10:52:52', '2025-01-29 09:14:10', 'sanvi', 'normal', 'no', 'new', '2025-01-29'),
(84, NULL, 'Shravan Bhai', '', '', '', 'Set - 3', '2', '2025-01-07', '2025-01-17', 'ITC CYBER EXCEL (CREAM)', '63.5 x 100.5cm', 400, 1100, 'Offset', '23.42 x 19.75', 2150, 'Offset', '4 Color', 'Matte', 'ok', 'Completed', '2025-01-07 10:56:54', '2025-01-29 09:24:37', 'sanvi', 'normal', 'no', 'new', '2025-01-29'),
(85, NULL, 'Shravan Bhai', '', '', '', 'Set - 4', '5', '2025-01-07', '2025-01-17', 'ITC CYBER EXCEL (CREAM)', '63.5 x 119', 350, 1300, 'Offset', '23.75 x 18.42', 2650, 'Offset', '4 Color', 'Matte', 'ok', 'Completed', '2025-01-07 11:00:58', '2025-01-29 09:25:43', 'sanvi', 'normal', 'no', 'new', '2025-01-29'),
(86, NULL, 'Shravan Bhai', '', '', '', 'BT_OP_WOW_Pods_TWS', '1', '2025-01-08', '2025-01-18', 'ITC CYBER EXCEL (CREAM)', '23 reel', 350, 650, 'Offset', '22.16 x 16.26', 650, 'Offset', '4 Color', 'Matte', 'Old Punch - 141X / rubber hanger', 'Completed', '2025-01-08 10:30:31', '2025-01-29 09:27:19', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(87, NULL, 'Shravan Bhai', '', '', '', 'BT_Airdopes_385_TWS', '1', '2025-01-08', '2025-01-18', 'ITC CYBER EXCEL (CREAM)', '23 reel', 350, 350, 'Offset', '21.38 x 16.65', 350, 'Offset', '4 Color', 'Matte', 'old punch - key pro / rubber hanger', 'Completed', '2025-01-08 10:36:32', '2025-01-29 09:28:07', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(88, NULL, 'Jaisukh', '', '', '', 'PopTees - Tag', '50k', '2025-01-08', '2025-01-18', 'FBB BOARD', '25 reel', 350, 2500, 'Offset', '19 x 25', 2500, 'Offset', '1 Color', 'Matte', 'stamping', 'Pending', '2025-01-08 10:44:59', '2025-01-08 10:44:59', 'sanvi', 'normal', 'no', 'old', NULL),
(89, NULL, 'Jaisukh', '', '', '', 'DW Tag', '20k', '2025-01-08', '2025-01-18', 'FBB BOARD', '59.7 x 91.5', 400, 250, 'Offset', '22 x 16', 500, 'Offset', '2 Color', 'direct punching', 'Front back tag with PVC', 'Pending', '2025-01-08 10:50:08', '2025-01-08 10:50:08', 'sanvi', 'no', 'no', 'old', NULL),
(90, NULL, 'Stuffcool', '', '', '', 'Celer M - Cable', '5k', '2025-01-09', '2025-01-19', 'JK ULTIMA (WHITE)', '25 x 38', 400, 500, 'Offset', '24.33 x 19.31', 1000, 'Offset', '4 Color', 'Matte', 'alto celer m old punch', 'Pending', '2025-01-09 07:15:47', '2025-01-09 07:15:47', 'sanvi', 'normal', 'no', 'old', NULL),
(91, NULL, 'Stuffcool', '', '', '', 'Novus 25 KIT', '5k', '2025-01-09', '2025-01-19', 'JK ULTIMA (WHITE)', '22 x 17', 400, 1400, 'Offset', '22 x 17', 1400, 'Offset', '4 Color', 'Matte', 'Novus 25 ka punch aayega / UV Old chalega / sab plates nayi aayegi atwork me changes h overall', 'Pending', '2025-01-09 09:59:51', '2025-01-09 09:59:51', 'sanvi', 'normal', 'no', 'old', NULL),
(92, NULL, 'Shravan Bhai', '', '', '', 'CMT_RM_NB', '2k each', '2025-01-10', '2025-01-20', 'FBB BOARD', '23 x 36', 350, 1100, 'Offset', '18 x 23', 2200, 'Offset', '4 Color', 'Matte', 'Aroma Punch', 'Pending', '2025-01-10 05:56:49', '2025-01-10 05:56:49', 'sanvi', 'normal', 'no', 'old', NULL),
(93, NULL, 'Rivano', '', '', '', 'RNCB-50 - Inner', '40k', '2025-01-11', '2025-01-21', 'FBB BOARD', '25 x 34', 350, 3400, 'Offset', '25 x 17', 6800, 'Offset', '5 Color', 'Matte', '', 'Pending', '2025-01-11 05:13:04', '2025-01-11 05:13:04', 'sanvi', 'normal', 'new', 'new', NULL),
(94, NULL, 'Khimji Bhai', '', '', '', 'Theory_Tag', '50', '2025-01-11', '2025-01-21', 'FBB BOARD', '44 x 34', 290, 1300, 'Offset', '22 x 17', 5200, 'Offset', '4 Color', 'Matte', 'regular old punch with 4mm hole', 'Completed', '2025-01-11 08:11:24', '2025-01-29 08:53:44', 'sanvi', 'no', 'no', 'old', '2025-01-29'),
(95, NULL, 'Voy', '', '', '', 'Magnetic Dhun - Green', '5', '2025-01-11', '2025-01-21', 'ITC CYBER EXCEL (CREAM)', '44 x 34', 350, 1200, 'Offset', '22 x 17', 2650, 'Offset', '5 Color', 'Matte', 'unke blister k hisab se punch h NEW / Voy k aur 2 neckband h uska bhi mearge karke paper ayega', 'Completed', '2025-01-11 08:26:10', '2025-01-29 07:15:42', 'sanvi', 'normal', 'no', 'new', '2025-01-29'),
(96, NULL, 'Palio', '', '', '', 'TS09 - Power - TopBottom', '2k', '2025-01-13', '2025-01-23', 'Artcard', '23 x 36', 157, 750, 'Offset', '18 x 23', 1200, 'Offset', '4 Color', 'Matte', 'Acc Box / Foam / Paper Trey / TS 09 - Thunder Punch', 'Pending', '2025-01-13 07:15:13', '2025-01-13 07:15:13', 'sanvi', 'normal', 'no', 'old', NULL),
(97, NULL, 'Shravan Bhai', '', '', '', 'BT_OP_TWS - Set -1 / Set - 2 / Set - 3', '12k', '2025-01-13', '2025-01-23', 'FBB BOARD', '46 x 31.5', 345, 900, 'Offset', '22.25 x 15.75', 3450, 'Offset', '4 Color', 'Matte', '96 x 35 x 114 ka old punch / Set 1 - 1150 / Set 2 - 1150 / Set 3 - 1150', 'Pending', '2025-01-13 11:15:53', '2025-01-13 11:15:53', 'sanvi', 'normal', 'no', 'old', NULL),
(98, NULL, 'Shravan Bhai', '', '', '', 'BT_OP_TWS - Set - 4', '4k', '2025-01-13', '2025-01-23', 'FBB BOARD', '46 x 39.5', 345, 600, 'Offset', '23 x 19.75', 2150, 'Offset', '4 Color', 'Matte', '98 x 38 x 160 - new punch', 'Pending', '2025-01-13 11:19:44', '2025-01-13 11:19:44', 'sanvi', 'normal', 'no', 'new', NULL),
(99, NULL, 'Shravan Bhai', '', '', '', 'OP_Z2_ Duble Packing (repeat job)', '3k', '2025-01-13', '2025-01-23', 'FBB BOARD', '46 x 32', 345, 800, 'Offset', '16 x 23.75', 3200, 'Offset', '4 Color', 'Matte', 'repeat order', 'Pending', '2025-01-13 12:22:02', '2025-01-13 12:22:02', 'sanvi', 'normal', 'no', 'old', NULL),
(100, NULL, 'Paresh Bhai', '', '', '', 'Lecture_Tag', '25k', '2025-01-14', '2025-01-24', 'Artcard', '23 x 36', 350, 400, 'Offset', '18 x 23', 800, 'Offset', '2 Color', 'Warnish', 'Warnish / Graining / Punching - champion old punch', 'Pending', '2025-01-14 07:32:36', '2025-01-14 07:32:36', 'sanvi', 'no', 'no', 'old', NULL),
(101, NULL, 'Ycom', '', '', '', 'Smart Watch Sleeve', '1', '2025-01-15', '2025-01-25', 'ITC CARTIN lUMINA (WHITE)', '20 x 43', 400, 350, 'Offset', '19.75 x 18.36', 700, 'Offset', '5 Color', 'Matte', 'Bottom / Inner trey / Foam aayega isme', 'Completed', '2025-01-15 09:09:39', '2025-01-30 05:46:28', 'sanvi', 'normal', 'new', 'new', '2025-01-30'),
(102, NULL, 'Ycom', '', '', '', 'Jeet Charger', '5k', '2025-01-20', '2025-01-30', 'ITC CARTIN lUMINA (WHITE)', '21.4 X 20.5', 340, 1000, 'Offset', '20.51 x 21', 1000, 'Offset', '5 Color', 'Matte', 'old mese 3 ups chalenge UV & Emboss', 'Pending', '2025-01-20 07:15:51', '2025-01-20 07:15:51', 'sanvi', 'normal', 'new', 'old', NULL),
(103, NULL, 'Pramod', '', '', '', 'KM PlayMore', '2k', '2025-01-20', '2025-01-30', 'ITC CYBER EXCEL (CREAM)', '44 x 34', 350, 1200, 'Offset', '22 x 17', 1150, 'Offset', '4 Color', 'Matte', 'Voy - magnetic Dhun punch / task no. 95 mese paper lena h', 'Pending', '2025-01-20 08:57:14', '2025-01-20 08:57:14', 'sanvi', 'normal', 'no', 'old', NULL),
(104, NULL, 'Stuffcool', '', '', '', 'click 10', '4500', '2025-01-21', '2025-01-24', 'JK ULTIMA (WHITE)', '24 x 39.5', 400, 800, 'Offset', '24 x 19.75', 1275, 'Offset', '4 Color', 'Matte', 'stock mese paper use karna h 1400 sheets / task no. 104 - 105 paper size same h\r\nUV Old chalega', 'Pending', '2025-01-21 12:13:57', '2025-01-21 12:13:57', 'sanvi', 'normal', 'no', 'old', NULL),
(105, NULL, 'Stuffcool', '', '', '', 'Roam', '6k', '2025-01-21', '2025-01-31', 'JK ULTIMA (WHITE)', '24 x 39.5', 400, 800, 'Offset', '24 x 19.75', 165, 'Offset', '4 Color', 'Matte', 'magistick mese baki ke plate uthana isme sirf black palte new aayegi', 'Pending', '2025-01-21 12:16:56', '2025-01-21 12:16:56', 'sanvi', 'normal', 'no', 'old', NULL),
(106, NULL, 'Stuffcool', '', '', '', 'Ultimus 47', '2', '2025-01-21', '2025-01-31', 'JK ULTIMA (WHITE)', '23 x 36', 400, 600, 'Offset', '18 x 23', 650, 'Offset', '4 Color', 'Matte', 'all new plates / front side logo aur mrp section add hua h', 'Completed', '2025-01-21 12:27:35', '2025-01-29 07:11:24', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(107, NULL, 'Stuffcool', '', '', '', 'Ultimus 38', '1', '2025-01-21', '2025-01-31', 'JK ULTIMA (WHITE)', '23 x 36', 400, 600, 'Offset', '18 x 23', 400, 'Offset', '4 Color', 'Matte', 'task no. 106 - 107 paper merge karke aayega / UV OLD chalega', 'Completed', '2025-01-21 12:29:59', '2025-01-29 07:05:56', 'sanvi', 'normal', 'no', 'old', '2025-01-29'),
(108, NULL, 'Stuffcool', '', '', '', 'Major max', '2', '2025-01-21', '2025-01-31', 'JK ULTIMA (WHITE)', '25 x 38', 400, 1400, 'Offset', '24.75 x 12.64', 1150, 'Offset', '4 Color', 'Matte', 'all plates r new / uv new / ye size me 3 tukda niklega / task no. 108 - 109 - 110 sath me paper aayega', 'Pending', '2025-01-21 12:44:20', '2025-01-21 12:44:53', 'sanvi', 'normal', 'no', 'old', NULL),
(109, NULL, 'Stuffcool', '', '', '', 'Roam + PB', '3k', '2025-01-21', '2025-01-31', 'JK ULTIMA (WHITE)', '25 x 38', 400, 1400, 'Offset', '24.75 x 12.64', 1650, 'Offset', '4 Color', 'Matte', 'only black plate new / task no. 108 - 109 - 110 sath me aayega paper', 'Pending', '2025-01-21 12:57:09', '2025-01-21 12:57:09', 'sanvi', 'normal', 'no', 'old', NULL),
(110, NULL, 'Stuffcool', '', '', '', 'major plus', '2500', '2025-01-21', '2025-01-31', 'JK ULTIMA (WHITE)', '25 x 38', 400, 400, 'Offset', '24.75  x 12.64', 1400, 'Offset', '4 Color', 'Matte', 'uv old chalega / task no 108 - 109 - 110 paper sath me aayega', 'Pending', '2025-01-21 12:59:27', '2025-01-21 12:59:27', 'sanvi', 'normal', 'no', 'old', NULL),
(111, NULL, 'Stuffcool', '', '', '', 'Tug cable set - 1', '44k', '2025-01-23', '2025-02-02', 'JK ULTIMA (WHITE)', '25 x 38', 400, 4200, 'Offset', '25 x 19', 6150, 'Offset', '4 Color', 'Matte', 'isme se jo bachega paper woh task no. 112 me chalana h / inner trey bhi jayega sath me', 'Pending', '2025-01-23 07:08:03', '2025-01-23 07:08:03', 'sanvi', 'normal', 'no', 'old', NULL),
(112, NULL, 'Stuffcool', '', '', '', 'Tug cable set - 2', '44k', '2025-01-23', '2025-02-02', 'JK ULTIMA (WHITE)', '25 x 38', 400, 4200, 'Offset', '25 x 19', 2150, 'Offset', '4 Color', 'Matte', 'TASK NO. 111 ME SE LENA PAPER / INNER TRY BHI JAYEGA SATH ME', 'Pending', '2025-01-23 07:10:45', '2025-01-23 07:10:45', 'sanvi', 'normal', 'no', 'old', NULL),
(113, NULL, 'Paresh Bhai', '', '', '', 'Ozzu tag', '40k', '2025-01-23', '2025-02-02', 'FBB BOARD', '26 x 36', 290, 1000, 'Offset', '26 x 18', 2000, 'Offset', '3 Color', 'Matte', 'with plastic', 'Pending', '2025-01-23 08:50:34', '2025-01-23 08:50:34', 'sanvi', 'normal', 'no', 'old', NULL),
(114, NULL, 'Voy', '', '', '', 'Snaptone - Playmore', '2k', '2025-01-24', '2025-02-02', 'ITC CYBER EXCEL (CREAM)', '44 x 34', 350, 1200, 'Offset', '22 x 17', 1150, 'Offset', '5 Color', 'Matte', 'magnetic dhun punch / paper stock', 'Pending', '2025-01-24 06:08:53', '2025-01-24 06:08:53', 'sanvi', 'normal', 'no', 'old', NULL),
(115, NULL, 'Voy', '', '', '', 'Voy - ishine NB', '8k', '2025-01-24', '2025-02-03', 'FBB BOARD', '31.5 x 41.5', 350, 1300, 'Offset', '15.35 x 20.75', 4100, 'Offset', '5 Color', 'Matte', 'zoom wala punch / green spl color aayega', 'Pending', '2025-01-24 06:17:21', '2025-01-24 06:17:21', 'sanvi', 'normal', 'no', 'old', NULL),
(116, NULL, 'Voy', '', '', '', 'KM - ishone NB', '2k', '2025-01-24', '2025-02-03', 'FBB BOARD', '31.5 x 41.5', 350, 1300, 'Offset', '15.35 x 20.75', 1100, 'Offset', '4 Color', 'Matte', 'zoom wala punch / task no. 115 mese lena paper', 'Pending', '2025-01-24 06:23:51', '2025-01-24 06:23:51', 'sanvi', 'normal', 'no', 'old', NULL),
(117, NULL, 'Luckwell', '', '', '', 'Pushpa NB', '2k', '2025-01-24', '2025-02-03', 'ITC CYBER EXCEL (CREAM)', '24 x 34', 350, 575, 'Offset', '16.75 x 22', 1150, 'Offset', '4 Color', 'Matte', 'ycom sound wave punch / clip aayega hanging me', 'Pending', '2025-01-24 07:07:33', '2025-01-24 07:07:33', 'sanvi', 'normal', 'no', 'old', NULL),
(118, NULL, 'Ycom', '', '', '', 'Velocity cable inner', '5k', '2025-01-24', '2025-02-03', 'ITC CARTIN lUMINA (WHITE)', '35.6  x 25', 320, 500, 'Offset', '17.49 x 25', 1030, 'Offset', '5 Color', 'Matte', 'ryder cable inner punch', 'Pending', '2025-01-24 07:50:02', '2025-01-24 07:50:02', 'sanvi', 'normal', 'new', 'old', NULL),
(119, NULL, 'Ycom', '', '', '', 'Velocity cable outer', '500', '2025-01-24', '2025-02-03', 'ITC CARTIN lUMINA (WHITE)', '22 x 27', 400, 400, 'Offset', '22 x 27', 400, 'Offset', '5 Color', 'Matte', '', 'Pending', '2025-01-24 08:36:52', '2025-01-24 08:36:52', 'sanvi', 'normal', 'new', 'old', NULL),
(120, NULL, 'Voy', '', '', '', 'Fuel 3.0 - CMF NB Double packing', '1k', '2025-01-24', '2025-02-03', 'ITC CYBER EXCEL (CREAM)', '16.5 x 24', 350, 4450, 'Offset', '16.5 x 24', 1150, 'Offset', '4 Color', 'Matte', 'sab new aayega with window / hanging k liye dori', 'Pending', '2025-01-24 09:43:44', '2025-01-24 09:43:44', 'sanvi', 'normal', 'new', 'new', NULL),
(121, NULL, 'Voy', '', '', '', 'Fuel 3.0 - JBL NB Double packing', '1k', '2025-01-24', '2025-02-03', 'ITC CYBER EXCEL (CREAM)', '16.5 x 24', 350, 4450, 'Offset', '16.5 x 24', 1150, 'Offset', '5 Color', 'Matte', 'UV, Emboss, punch same as per task no. 120 / paper bhi usme se lena bacha hua / Dori / window', 'Pending', '2025-01-24 09:49:51', '2025-01-24 09:49:51', 'sanvi', 'normal', 'old', 'old', NULL),
(122, NULL, 'Voy', '', '', '', 'Fuel 3.0 - BT NB Double packing', '2k', '2025-01-24', '2025-02-03', 'ITC CYBER EXCEL (CREAM)', '16.5 x 24', 350, 4450, 'Offset', '16.5 x 24', 2150, 'Offset', '4 Color', 'Matte', 'task no. 120, 121, 122 paper mearge karke aayega / UV emboss punch same / dori', 'Pending', '2025-01-24 09:55:07', '2025-01-24 09:55:07', 'sanvi', 'normal', 'old', 'old', NULL),
(123, NULL, 'Voy', '', '', '', 'Buds Pro 3 - BT TWS', '5k', '2025-01-24', '2025-02-03', 'ITC CYBER EXCEL (CREAM)', '26.75 x 16.5', 350, 1150, 'Offset', '26.75 x 16.5', 1150, 'Offset', '4 Color', 'Matte', 'hanger black client ka', 'Pending', '2025-01-24 10:05:11', '2025-01-24 10:05:11', 'sanvi', 'normal', 'new', 'new', NULL),
(124, NULL, 'Voy', '', '', '', 'Buds 5 - OP BT - TWS', '5k', '2025-01-24', '2025-01-27', 'ITC CYBER EXCEL (CREAM)', '24.2 x 19.75', 350, 1150, 'Offset', '24.2 x 19.75', 1150, 'Offset', '4 Color', 'Matte', 'hanging client hanger / BT-2500_OP-1250_CNF-1250', 'Pending', '2025-01-24 10:09:25', '2025-01-24 10:09:25', 'sanvi', 'normal', 'new', 'new', NULL),
(125, NULL, 'Shravan Bhai', '', '', '', 'Airdopes Tour Pro - TWS', '2k', '2025-01-24', '2025-02-03', 'ITC CYBER EXCEL (CREAM)', '21.75 x 17.87', 350, 650, 'Offset', '21.75 x 17.87', 650, 'Offset', '4 Color', 'Matte', 'New punch with 4x7 hanging', 'Pending', '2025-01-24 11:23:36', '2025-01-24 11:23:36', 'sanvi', 'normal', 'no', 'new', NULL),
(126, NULL, 'Shravan Bhai', '', '', '', 'Buds Z2 TWS', '1k each', '2025-01-24', '2025-02-03', 'ITC CYBER EXCEL (CREAM)', '21.75 x 16', 350, 650, 'Offset', '21.75 x 16', 650, 'Offset', '4 Color', 'Matte', 'aroma old tws punch with 4x7 hanging', 'Pending', '2025-01-24 11:26:20', '2025-01-24 11:26:20', 'sanvi', 'normal', 'no', 'old', NULL),
(127, NULL, 'Palio', '', '', '', 'Ninja TWS - Top Bottom', '2k', '2025-01-28', '2025-02-08', 'Artcard', '23 x 36', 157, 500, 'Offset', '18 x 23', 1200, 'Offset', '4 Color', 'Matte', 'stock mese 300 sheet lena h / isme se 100 sheet bachenge / Acc Box / Foam / Paper Trey / TS 09 - Thunder Punch', 'Pending', '2025-01-28 08:00:11', '2025-01-28 08:00:11', 'sanvi', 'normal', 'no', 'old', NULL),
(128, NULL, 'CRP', '', '', '', 'DC Charger', '5k', '2025-01-29', '2025-02-08', 'ITC CYBER EXCEL (CREAM)', '25 x 15.29', 350, 2650, 'Offset', '24.75 x 15.29', 2650, 'Offset', '4 Color', 'Dripoff', 'Shreeji me print hoga aur master print me dripoff last tym jaise chalaya tha waise / sab old hai', 'Pending', '2025-01-29 06:05:01', '2025-01-29 06:05:01', 'sanvi', 'no', 'old', 'old', NULL),
(129, NULL, 'Voy', '', '', '', 'M8 Earphone - Silver packing', '5k', '2025-01-29', '2025-02-08', 'ITC CYBER EXCEL (CREAM)', '20.75 x 17.6', 350, 1000, 'Offset', '20.75 x 17.6', 1000, 'Offset', '4 Color', 'Dripoff', 'punch old hai / baki sab new / 4 colour printing shreeji me hoga / dripoff master print me hoga', 'Pending', '2025-01-29 08:34:42', '2025-01-29 08:34:42', 'sanvi', 'no', 'new', 'old', NULL),
(130, NULL, 'Stuffcool', '', '', '', 'nomad charger', '1k', '2025-01-29', '2025-02-08', 'JK ULTIMA (WHITE)', '18 x 23', 350, 650, 'Offset', '18 x 23', 650, 'Offset', '4 Color', 'Matte', 'new punch h / paper stock mese lena h', 'Pending', '2025-01-29 09:11:15', '2025-01-29 09:11:15', 'sanvi', 'normal', 'no', 'new', NULL),
(131, NULL, 'Ycom', '', '', '', 'Earphone - Aura_Shild_Ace', '5k each', '2025-01-30', '2025-02-09', 'ITC CARTIN lUMINA (WHITE)', '35.6 x 25', 320, 1800, 'Offset', '17.5 x 25', 2650, 'Offset', '5 Color', 'Matte', 'Earphone ka regular old punch aayega / task no. 131 - 132 ka paper merge karke aayega', 'Pending', '2025-01-30 06:04:12', '2025-01-30 06:04:12', 'sanvi', 'normal', 'new', 'old', NULL),
(132, NULL, 'Ycom', '', '', '', 'M8 pro earphone', '5k', '2025-01-30', '2025-02-09', 'ITC CARTIN lUMINA (WHITE)', '35,6 x 25', 320, 1800, 'Offset', '17.5 x 25', 985, 'Offset', '5 Color', 'Matte', 'only black plate new aayega q ki signature aur mobile no. change h / task no. 131 - 132 ka paper merge karke aayega', 'Pending', '2025-01-30 06:09:24', '2025-01-30 06:09:24', 'sanvi', 'normal', 'old', 'old', NULL),
(133, NULL, 'Stuffcool', '', '', '', 'Click 20', '2500', '2025-01-31', '2025-02-09', 'JK ULTIMA (WHITE)', '28 x 44', 400, 400, 'Offset', '25.87 x 21.14', 775, 'Offset', '4 Color', 'Matte', 'UV Old chalega', 'Pending', '2025-01-31 05:58:27', '2025-01-31 05:58:27', 'sanvi', 'normal', 'no', 'old', NULL),
(134, NULL, 'Ycom', '', '', '', 'Platinum - Zone X - Glowband - NB', '20k', '2025-02-01', '2025-02-11', 'ITC CARTIN lUMINA (WHITE)', '24 x 34.5', 400, 5200, 'Offset', '24 x 34.5', 5200, 'Offset', '5 Color', 'Matte', 'Platinum - 10k, Zone X - 5k , Glowband - 5k without PVC', 'Pending', '2025-02-01 10:44:09', '2025-02-01 10:44:09', 'sanvi', 'normal', 'new', 'new', NULL),
(135, NULL, 'Ycom', '', '', '', 'Apex_Luxe NB', '10k each', '2025-02-01', '2025-02-11', 'ITC CARTIN lUMINA (WHITE)', '27 x 20.25', 350, 5200, 'Offset', '27 x 20.25', 5200, 'Offset', '5 Color', 'Matte', 'Evaband Old Punch', 'Pending', '2025-02-01 10:54:25', '2025-02-01 10:54:25', 'sanvi', 'normal', 'new', 'old', NULL),
(136, NULL, 'Ycom', '', '', '', 'Jeet_Force - Charger', '12k each', '2025-02-03', '2025-02-13', 'ITC CARTIN lUMINA (WHITE)', '22.3 x 41.2', 360, 3535, 'Offset', '20.51 x 21', 4200, 'Offset', '5 Color', 'Matte', 'punch old hai / uv emboss new aayega', 'Pending', '2025-02-03 07:20:03', '2025-02-03 07:20:03', 'sanvi', 'normal', 'new', 'old', NULL),
(137, NULL, 'Ycom', '', '', '', 'Master_Raftar - charger', '8k each', '2025-02-03', '2025-02-13', 'ITC CARTIN lUMINA (WHITE)', '22.3 x 41.2', 360, 3535, 'Offset', '20.51 x 21', 2850, 'Offset', '5 Color', 'Matte', 'punch old / uv & emboss new / tas no. 137 - 136 ka paper merge karke aayega', 'Pending', '2025-02-03 07:24:12', '2025-02-03 07:24:12', 'sanvi', 'normal', 'new', 'old', NULL),
(138, NULL, 'Voy', '', '', '', 'BT_Ironic - Green (Double Packing)', '3k', '2025-02-03', '2025-02-13', 'FBB BOARD', '86.5 x 61 cms (34 x 24)', 350, 2650, 'Offset', '16.38  x 24', 3150, 'Offset', '5 Color', 'Matte', 'Fuel 3.0 Punch / task no. 138-139-140 marge karke aayega paper / double packing dori aayegi hanging k liye', 'Pending', '2025-02-03 09:52:46', '2025-02-03 09:52:46', 'sanvi', 'normal', 'no', 'old', NULL),
(139, NULL, 'Voy', '', '', '', 'JBL - Ironic - Orange (Double Packing)', '2k', '2025-02-03', '2025-02-13', 'FBB BOARD', '86.5 x 61 cms (34 x 24)', 350, 2650, 'Offset', '16.38 x 24', 2150, 'Offset', '5 Color', 'Matte', 'Fuel 3.0 Punch / task no. 138-139-140 marge karke aayega paper / double packing dori aayegi hanging k liye / Voy wala spl orange aayega', 'Pending', '2025-02-03 09:55:19', '2025-02-03 09:55:19', 'sanvi', 'normal', 'no', 'old', NULL);
INSERT INTO `tasks` (`task_id`, `client_id`, `client_name`, `client_mobile`, `client_email`, `client_address`, `task_name`, `order_quantity`, `date_of_order`, `delivery_date`, `paper_quality`, `paper_size`, `paper_gsm`, `paper_quantity`, `plate_type`, `cutting_size`, `cutting_size_quantity`, `printing_type`, `color`, `lamination_type`, `notes`, `status`, `created_at`, `updated_at`, `creator`, `uv`, `emboss`, `punching`, `completed_at`) VALUES
(140, NULL, 'Voy', '', '', '', 'Ozo TWS - Black green', '3k', '2025-02-03', '2025-02-13', 'FBB BOARD', '86.5 x 56 cms (34X22)', 350, 2650, 'Offset', '21.75 x 16', 900, 'Offset', '5 Color', 'Matte', 'Aroma old punch / client wala hanger (with blister) / task no. 138-139-140 marge karke aayega paper', 'Pending', '2025-02-03 09:59:21', '2025-02-03 09:59:21', 'sanvi', 'normal', 'new', 'old', NULL),
(141, NULL, 'Voy', '', '', '', 'Voy Dhun Pro - Orange', '6k', '2025-02-03', '2025-02-13', 'FBB BOARD', '105.5 x 80 cms', 350, 1100, 'Offset', '15.35 x 20.75', 3150, 'Offset', '5 Color', 'Matte', 'zoom old punch / task no. 141 - 142 sath me aayega paper', 'Pending', '2025-02-03 10:04:17', '2025-02-03 10:04:17', 'sanvi', 'normal', 'new', 'old', NULL),
(142, NULL, 'Voy', '', '', '', 'KM - Dhun Pro', '2K', '2025-02-03', '2025-02-13', 'FBB BOARD', '105.5 x 80 cms', 350, 1100, 'Offset', '15.35 x 20.75', 1150, 'Offset', '4 Color', 'Matte', 'zoom old punch / task no. 141 - 142 sath me aayega paper', 'Pending', '2025-02-03 10:06:48', '2025-02-03 10:06:48', 'sanvi', 'normal', 'no', 'old', NULL),
(143, NULL, 'Ycom', '', '', '', 'Thunder K-28 - Charger', '5k', '2025-02-03', '2025-02-13', 'ITC CARTIN lUMINA (WHITE)', '36 x 26', 400, 1400, 'Offset', '18 x 26', 700, 'Offset', '5 Color', 'Matte', 'without PVC / hanging k liye 3mm hole', 'Pending', '2025-02-03 11:23:53', '2025-02-03 11:23:53', 'sanvi', 'normal', 'new', 'new', NULL),
(144, NULL, 'Ycom', '', '', '', 'Leo TWS - Sleeve', '3k', '2025-02-03', '2025-02-13', 'ITC CARTIN lUMINA (WHITE)', '31 x 41.5', 380, 200, 'Offset', '24 x 14.65', 650, 'Offset', '5 Color', 'Matte', 'hard board trey / foam / paper trey / acc box / sleeve', 'Pending', '2025-02-03 11:42:40', '2025-02-03 11:42:40', 'sanvi', 'normal', 'new', 'old', NULL),
(145, NULL, 'Ycom', '', '', '', 'TWS - Truebuds 5 Sleeve - Black', '3k', '2025-02-03', '2025-02-13', 'ITC CARTIN lUMINA (WHITE)', '26 x 34', 380, 500, 'Offset', '23.88 x 16', 900, 'Offset', '4 Color', 'Matte', 'black single colour liya h / full set aayega isme', 'Pending', '2025-02-03 12:18:14', '2025-02-03 12:18:14', 'sanvi', 'normal', 'new', 'new', NULL),
(146, NULL, 'Ycom', '', '', '', 'Ystar Battery - Inner', '20k', '2025-02-04', '2025-02-14', 'ITC CARTIN lUMINA (WHITE)', '39.2 x 22.3', 360, 1750, 'Offset', '19.25 x 22.22', 3500, 'Offset', '5 Color', 'Matte', 'Y-Cell battery ka same punch / yellow spl colour aayega / Ycell jaisa same hanger chayie', 'Pending', '2025-02-04 11:12:34', '2025-02-04 11:12:34', 'sanvi', 'normal', 'new', 'old', NULL),
(147, NULL, 'Ycom', '', '', '', 'Ystar Battery - Outer', '4k', '2025-02-04', '2025-02-14', 'ITC CARTIN lUMINA (WHITE)', '39.2 x 27.8', 360, 575, 'Offset', '27.75 x 19.75', 1150, 'Offset', '5 Color', 'Matte', 'Y-Cell battery ka same punch / yellow spl colour aayega / Ycell jaisa same hanger chayie', 'Pending', '2025-02-04 11:14:41', '2025-02-04 11:14:41', 'sanvi', 'normal', 'new', 'old', NULL),
(148, NULL, 'Voy', '', '', '', 'OP_JBL_King Cobra - TWS', '1500 each', '2025-02-05', '2025-02-15', 'FBB BOARD', '25 x 41.5', 350, 1015, 'Offset', '24.88 x 20', 2050, 'Offset', '5 Color', 'Matte', 'new punch / task no. 148 - 149 aper sath me aayega / jbl orange spl colour h voy wala / hanger client ka hoga', 'Pending', '2025-02-05 11:39:32', '2025-02-05 11:39:32', 'sanvi', 'normal', 'no', 'new', NULL),
(149, NULL, 'Voy', '', '', '', 'Boat_KingCobra - tws', '4k', '2025-02-05', '2025-02-15', 'FBB BOARD', '25 x 41.5', 350, 1015, 'Offset', '24.88 x 20', 1150, 'Offset', '4 Color', 'Matte', 'punch same task no. 148 / paper bhi sath me aayega / black - 2k / white-1k / blue - 1k', 'Pending', '2025-02-05 11:46:22', '2025-02-05 11:46:22', 'sanvi', 'normal', 'no', 'new', NULL),
(150, NULL, 'Ycom', '', '', '', 'ECOPODS_2_ TWS', '5k', '2025-02-05', '2025-02-15', 'ITC CARTIN lUMINA (WHITE)', '31.5 x 41.5', 350, 300, 'Offset', '24 x 14.65', 1000, 'Offset', '5 Color', 'Matte', 'pura set jayega', 'Pending', '2025-02-05 11:55:46', '2025-02-05 11:55:46', 'sanvi', 'normal', 'new', 'old', NULL),
(151, NULL, 'Ycom', '', '', '', 'Dragon 2.0 - TWS black', '3k', '2025-02-05', '2025-02-15', 'ITC CARTIN lUMINA (WHITE)', '36 x 26.8', 400, 1825, 'Offset', '17.24 x 26.75', 1150, 'Offset', '4 Color', 'Matte', 'Shine X size punch / task no. 151 - 152 - 153 sath me aayega paper', 'Pending', '2025-02-05 12:15:04', '2025-02-05 12:15:04', 'sanvi', 'normal', 'new', 'old', NULL),
(152, NULL, 'Ycom', '', '', '', 'Funky Pro_Rokin - TWS', '1500', '2025-02-05', '2025-02-15', 'ITC CARTIN lUMINA (WHITE)', '36 x 26.8', 400, 1825, 'Offset', '17.24 x 26.75', 650, 'Offset', '5 Color', 'Matte', 'Shine X size punch / task no. 151 - 152 - 153 sath me aayega paper / Full set jayega', 'Pending', '2025-02-05 12:18:35', '2025-02-05 12:18:35', 'sanvi', 'normal', 'new', 'old', NULL),
(153, NULL, 'Ycom', '', '', '', 'Galaxy - TWS', '5k', '2025-02-05', '2025-02-15', 'ITC CARTIN lUMINA (WHITE)', '36 x 26.8', 400, 1825, 'Offset', '17.24 x 26.75', 1850, 'Offset', '4 Color', 'Matte', 'Shine X size punch / task no. 151 - 152 - 153 sath me aayega paper / Full set jayega', 'Pending', '2025-02-05 12:21:45', '2025-02-05 12:21:45', 'sanvi', 'normal', 'new', 'old', NULL),
(154, NULL, 'Voy', '', '', '', 'BT_TourPro - TWS', '1500', '2025-02-05', '2025-02-15', 'FBB BOARD', '46 x 36', 345, 150, 'Offset', '21.68 x 17.48', 525, 'Offset', '4 Color', 'Matte', '', 'Pending', '2025-02-05 12:25:47', '2025-02-05 12:25:47', 'sanvi', 'normal', 'no', 'new', NULL),
(155, NULL, 'Stuffcool', '', '', '', 'Warranty card - front back', '50k', '2025-02-06', '2025-02-16', 'ITC CYBER EXCEL (CREAM)', '91.5 x 55 cms', 335, 1600, 'Offset', '18 x 21.5', 3100, 'Offset', '4 Color', 'Matte', 'sab old hai', 'Pending', '2025-02-06 05:35:10', '2025-02-06 05:35:10', 'sanvi', 'no', 'no', 'old', NULL),
(156, NULL, 'Voy', '', '', '', 'RM_Buds T110', '2500', '2025-02-10', '2025-02-20', 'FBB BOARD', '96.5 x 63.5 cms', 335, 400, 'Offset', '23.75 x 18.3', 775, 'Offset', '5 Color', 'Matte', 'yellow spl colour RM wala', 'Pending', '2025-02-10 10:32:59', '2025-02-10 10:32:59', 'sanvi', 'normal', 'no', 'new', NULL),
(157, NULL, 'Voy', '', '', '', 'BT_Earphone - Orange', '10k', '2025-02-10', '2025-02-20', 'FBB BOARD', '28 x 32', 300, 910, 'Offset', '15.75 x 27', 1816, 'Offset', '5 Color', 'Matte', 'voy wala orange spl colour aayega', 'Pending', '2025-02-10 10:43:41', '2025-02-10 10:43:41', 'sanvi', 'normal', 'no', 'new', NULL),
(158, NULL, 'Voy', '', '', '', 'BT_Earphone - Orange - outer', '1k', '2025-02-10', '2025-02-20', 'FBB BOARD', '28 x 44', 350, 275, 'Offset', '22 x 28', 1100, 'Offset', '5 Color', 'Matte', 'voy wala spl orange colour aayega', 'Pending', '2025-02-10 10:50:25', '2025-02-10 10:50:25', 'sanvi', 'normal', 'no', 'new', NULL),
(159, NULL, 'Stuffcool', '', '', '', 'Major Ultra', '1900', '2025-02-11', '2025-02-21', 'JK ULTIMA (WHITE)', '25 x 38', 400, 400, 'Offset', '24.75 x 12.64', 1100, 'Offset', '4 Color', 'Matte', 'sirf black plate change h / pahele magistick me print hua tha job abhi hiyan me karna h / black plate hiyan me boli h / mfg date march 2025 / \r\n38 k baju 3 tukda niklega / major max punch / UV old chalega', 'Pending', '2025-02-11 10:06:25', '2025-02-11 10:06:25', 'sanvi', 'normal', 'no', 'old', NULL),
(160, NULL, 'Stuffcool', '', '', '', 'nova 65 - charger', '1k', '2025-02-11', '2025-02-21', 'JK ULTIMA (WHITE)', '25 x 36', 400, 200, 'Offset', '25 x 12', 600, 'Offset', '4 Color', 'Matte', '12 k baju 3 tukda niklega', 'Pending', '2025-02-11 10:10:56', '2025-02-11 10:10:56', 'sanvi', 'normal', 'no', 'new', NULL),
(161, NULL, 'Ycom', '', '', '', 'Matrix Cable - inner', '20k', '2025-02-14', '2025-02-24', 'ITC CARTIN lUMINA (WHITE)', '24 x 31.5', 310, 1750, 'Offset', '15.75 x 23.65', 3500, 'Offset', '5 Color', 'Matte', '', 'Pending', '2025-02-14 08:19:50', '2025-02-14 08:19:50', 'sanvi', 'normal', 'new', 'new', NULL),
(162, NULL, 'Ycom', '', '', '', 'Melody - Earphone', '10k', '2025-02-15', '2025-02-18', 'ITC CARTIN lUMINA (WHITE)', '35.6 x 25', 320, 2500, 'Offset', '18 x 25', 1820, 'Offset', '5 Color', 'Matte', 'M8 Pro earphone Old punch', 'Pending', '2025-02-15 07:52:07', '2025-02-15 07:52:07', 'sanvi', 'normal', 'new', 'old', NULL),
(163, NULL, 'Ycom', '', '', '', 'Everest - Earphone', '18k', '2025-02-15', '2025-02-25', 'ITC CARTIN lUMINA (WHITE)', '35.6 x 25', 320, 2500, 'Offset', '18 x 25', 3150, 'Offset', '5 Color', 'Matte', 'task no. 162 - 136 sath me aayega paper / same punch', 'Pending', '2025-02-15 07:55:09', '2025-02-15 07:55:09', 'sanvi', 'normal', 'new', 'old', NULL),
(164, NULL, 'Vali', '', '', '', 'Car Dongal', '625', '2025-02-15', '2025-02-25', 'ITC CARTIN lUMINA (WHITE)', '25 x 31.8', 350, 1325, 'Offset', '23.46 x 15.86', 2650, 'Offset', '4 Color', 'Dripoff', 'window aayega isme', 'Pending', '2025-02-15 08:25:59', '2025-02-15 08:25:59', 'sanvi', 'no', 'no', 'new', NULL),
(165, NULL, 'Ycom', '', '', '', 'Crossbuds - 97 x 47 x 116', '5k', '2025-02-15', '2025-02-25', 'ITC CARTIN lUMINA (WHITE)', '25 x 29.5', 360, 500, 'Offset', '24.75 x 14.75', 1000, 'Offset', '5 Color', 'Matte', 'only sleeve & Foam / punch old big - 97 x 47 x 116 / emboss old chalega / UV new aayega', 'Pending', '2025-02-15 09:08:03', '2025-02-15 09:08:03', 'sanvi', 'normal', 'old', 'new', NULL),
(166, NULL, 'Voy', '', '', '', 'OP - Fuel 2.0 (Double Packing)', '1k', '2025-02-15', '2025-02-25', 'ITC CYBER EXCEL (CREAM)', '33 x 24', 350, 2750, 'Offset', '16.38 x 24', 1150, 'Offset', '4 Color', 'Matte', 'Fuel 3.0 ka punch / task no. 166-167-168 ka paper sath me aayega', 'Pending', '2025-02-15 10:49:23', '2025-02-15 10:49:23', 'sanvi', 'normal', 'no', 'old', NULL),
(167, NULL, 'Voy', '', '', '', 'JBL - Fuel 2.0 - double packing', '1k', '2025-02-15', '2025-02-25', 'ITC CYBER EXCEL (CREAM)', '33 x 24', 350, 2750, 'Offset', '16.38 x 24', 1150, 'Offset', '5 Color', 'Matte', 'Fuel 3.0 ka punch / task no. 166-167-168 ka paper sath me aayega', 'Pending', '2025-02-15 10:51:54', '2025-02-15 10:51:54', 'sanvi', 'normal', 'no', 'old', NULL),
(168, NULL, 'Voy', '', '', '', 'BT - Fuel 2.0 (Double Packing)', '3k', '2025-02-15', '2025-02-25', 'ITC CYBER EXCEL (CREAM)', '33 x 24', 350, 2750, 'Offset', '16.38 x 24', 3150, 'Offset', '4 Color', 'Matte', 'Fuel 3.0 ka punch / task no. 166-167-168 ka paper sath me aayega', 'Pending', '2025-02-15 10:54:14', '2025-02-15 10:54:14', 'sanvi', 'normal', 'no', 'old', NULL),
(169, NULL, 'Ycom', '', '', '', 'Apex_Luxe NB', '10k each', '2025-02-19', '2025-03-01', 'ITC CARTIN lUMINA (WHITE)', '27 x 40,5', 360, 2600, 'Offset', '26.48 x 20.16', 5200, 'Offset', '5 Color', 'Matte', 'sab old hai', 'Pending', '2025-02-19 06:21:37', '2025-02-19 06:21:37', 'sanvi', 'normal', 'old', 'old', NULL),
(170, NULL, 'Stuffcool', '', '', '', 'Quad Pro Black - 4in1 cable', '2800', '2025-02-21', '2025-03-03', 'JK ULTIMA (WHITE)', '36 x 46', 400, 200, 'Offset', '16.61 x 19.31', 850, 'Offset', '4 Color', 'Matte', 'only black plate new', 'Pending', '2025-02-21 09:02:51', '2025-02-21 09:02:51', 'sanvi', 'normal', 'no', 'old', NULL),
(171, NULL, 'Paresh Bhai', '', '', '', 'Belle Tag', '50k', '2025-02-24', '2025-03-06', 'JK ULTIMA (WHITE)', '40.2 x 28.2', 300, 700, 'Offset', '20.12 x 13.19', 2700, 'Offset', '2 Color', 'Matte', 'pasting job / UV / Gold foiling', 'Pending', '2025-02-24 09:43:42', '2025-02-24 09:43:42', 'sanvi', 'normal', 'no', 'new', NULL),
(172, NULL, 'Stuffcool', '', '', '', 'Novus 25 - C to L', '4k', '2025-02-24', '2025-03-06', 'JK ULTIMA (WHITE)', '23 x 36', 400, 600, 'Offset', '22.24 x 17.28', 1150, 'Offset', '4 Color', 'Matte', 'novus 25 ka old punch / stock mese paper use karna h', 'Pending', '2025-02-24 09:49:06', '2025-02-24 09:49:06', 'sanvi', 'normal', 'no', 'old', NULL),
(173, NULL, 'Voy', '', '', '', 'Buds Pro 3 - BT TWS', '5k', '2025-02-24', '2025-03-06', 'ITC CYBER EXCEL (CREAM)', '26.75 x 16.5', 350, 1150, 'Offset', '26.75 x 16.5', 1150, 'Offset', '4 Color', 'Matte', 'sab old aayega / Emboss karna h abhi last tym nh kiya tha', 'Pending', '2025-02-24 09:55:43', '2025-02-24 09:55:43', 'sanvi', 'normal', 'new', 'old', NULL),
(174, NULL, 'Palio', '', '', '', '07_System_01Aura - NB', '10k each', '2025-02-24', '2025-03-06', 'ITC CARTIN lUMINA (WHITE)', '27 x 43.3', 350, 2600, 'Offset', '26.61 x 21.65', 5200, 'Offset', '4 Color', 'Matte', '', 'Pending', '2025-02-24 10:17:29', '2025-02-24 10:17:29', 'sanvi', 'normal', 'new', 'old', NULL),
(175, NULL, 'Palio', '', '', '', '07_System_01Aura - NB', '10k each', '2025-02-24', '2025-03-06', 'ITC CARTIN lUMINA (WHITE)', '27 x 43.3', 350, 2600, 'Offset', '26.61 x 21.65', 5200, 'Offset', '4 Color', 'Matte', '', 'Pending', '2025-02-24 10:17:33', '2025-02-24 10:17:33', 'sanvi', 'normal', 'new', 'old', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','manager','department') NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `email`, `department_id`) VALUES
(1, 'admin', '$2y$10$5KzAGzJ1dZM4la0IGLzviOaYQ9YbBuIUQ8RJOgPvYmVoBs9/bQNBG', 'admin', 'admin@admin.com', NULL),
(2, 'paper', '$2y$10$Lw267GcMP3AibGneDiNxGe8u0sz3oFsg81PCjBqQPiH/TWJd3ex8G', 'department', 'paper@admin.com', 1),
(3, 'printer', '$2y$10$GQse67H6B4/g/IrTrZ/v3efdWHKTARiYHT6a6JyiWWAXGrzR4.aye', 'department', 'printer@admin.com', 2),
(4, 'plate', '$2y$10$/EntfTPeD80DIVBgGirWMuZwV/lQyf5CNMhOyTZBk4OYuwHeS97HW', 'department', 'plate@admin.com', 3),
(5, 'lamination', '$2y$10$KejPLYkeVUHclRALeaK3zeQEhCEAaUyxJQt/f5lnKArx89VO4llNS', 'department', 'lamination@admin.com', 4),
(6, 'manager', '$2y$10$cZqjdbM1FE4WnIbrCru5q.XSd9qx7Mg6wkdgBghLvVpQXENcrqcAa', 'manager', 'manager@admin.com', NULL),
(7, 'sanvi', '$2y$10$JasBtmNwBSld2MEHD7N49.ClfWWe/u5ahx.JXaGvoHWIV3udxKB9W', 'admin', 'pearlenterprises1999@gmail.com', NULL),
(8, 'milanpaper', '$2y$10$cnlDZIRLvJ03znVehFAhJOjCiImWPJpvZAx1ZxMmbvlHeU2NNYYvq', 'department', NULL, 1),
(9, 'output', '$2y$10$UXRbrYRyeX7gknHKglNabO7Ry8iw2L8teH/RmCVvxffUJW0iK36HK', 'department', NULL, 3),
(10, 'rahul', '$2y$10$U1WNaAq9Y7sSxsYZ.sLduOupNImN8CCaeIHz7QlP6s2XoTfGOgO.y', 'admin', NULL, NULL),
(11, 'shubhampaper', '$2y$10$zX.RD1IKnWLa9t3JNSBbbuMW.t/5egzoatHk8510PsvH3kqjMkoOi', 'department', NULL, 1),
(12, 'rameshvarprinter', '$2y$10$tbuXiKKup2AvmltYF1XC/uPFOdK15InYzIp/ajAVrBB3uZxR5O34q', 'department', NULL, 2),
(13, 'factory', '$2y$10$wTQ6sIAh5OKxJXkji2seFu9H1xseJrHSyiKzDoHekrXaBEb2aguEy', 'department', NULL, 4),
(14, 'oldplate', '$2y$10$D104DK5fef85Gg85t7EO9.WVMb5T0YASoPGt51M09W.yTm1D.T3n2', 'department', '00@00.com', 3),
(15, 'noprinting', '$2y$10$b44OQEM2Mw/5q3WwVx1x8uHI1ga/CI0fXK2P3fX34nDhri4HR79me', 'department', NULL, 2),
(16, 'instock', '$2y$10$lJYZNzpeChntauqVF9iO7O4qoJy8jrXifkKynmNS4fMSWBfnV4uXi', 'department', NULL, 1),
(17, 'shreejiprinter', '$2y$10$T.c/pihB9WsmakxpYxyc4uRMVnRQcL5uMzHkjzn161ZsHhNKnIzsK', 'department', NULL, 2),
(18, 'metarprinter', '$2y$10$AVVGZWKsa0YBmRgZ4D7hBeVwIlmMCUWT1uNMWz6rYrQgCBys9yroS', 'department', NULL, 2),
(19, 'kavitripaper', '$2y$10$wyROZVqX9HjPA/fbNaB09uaE0sWWPGH5z8NQXUlP4sKY7aeAmxmu.', 'department', NULL, 1),
(20, 'hiyanprinter', '$2y$10$FCJ3dvzkHPBFr3qvIDbVyemUFjB4jZ9ukEo0SSuG9DfkLxy2c8FmC', 'department', NULL, 2),
(21, 'prakashpaper', '$2y$10$3ne3X74xg8.2F9MV5KVseeeoTASC.HbzcA7ZZbudmc8aXyvN55qy6', 'department', NULL, 1),
(22, 'magistickprinter', '$2y$10$31pjVT4.TxB498nWSJpxgeT1v9SbV1X7Hxv0yxfqR6lEXXt3gph5i', 'department', NULL, 2),
(23, 'pushpaprinter', '$2y$10$u5mUnlg.xbJT08cC1vOuRO02qkMUbpct6f5nHIj7svH/bsBibZmty', 'department', NULL, 2),
(24, 'masterprint', '$2y$10$YRqnrZrhE8v8Gql4x3gy5.ByLK9.qguckxGsQQf2I2U8aUbhXjOY2', 'department', NULL, 2),
(25, 'greenglobe', '$2y$10$tgQ7dd3Nd41gIBoEAqErOeIGLThAcX4xOGl5ywb/uSmQzYx7v5nGO', 'department', NULL, 1),
(26, 'akshitapaper', '$2y$10$rJsvXotX5MWHmdNnLuqD1eRPUPZwoRvqceLSywvUoN7O5vpp9eL.e', 'department', NULL, 1),
(27, 'ashtvinayakpaper', '$2y$10$d1MHu37avbPtCVTtMwVpdOYHfuhZKFL7.vHWP2GvWSIvYvfbG2jPa', 'department', NULL, 1),
(28, 'vardhmanpaper', '$2y$10$RaiEZ9jsHiHP1kllJxGzr.o2YtYZmqkq/0Iofx8ZTXg0VZ1qUcyCO', 'department', NULL, 1),
(29, 'bkenterprises', '$2y$10$7vR0JzO1SzCj2FcRj3tNN.k.BhLPXmRibNGL1HFfDFOcQVniTJjCq', 'department', NULL, 1),
(30, 'hirenbhai', '$2y$10$X.su7ExHmI4EapZ3wKMDD.VeYPF9umVSrnrA8RvQNP1aP4I85bk7S', 'department', NULL, 1),
(31, 'manualprinter', '$2y$10$MSlYs6CcgwYN7WiHZLVBxenLHXu7S4pohN28RB7rguim6dI4o96dy', 'department', NULL, 2),
(32, 'vagadpaper', '$2y$10$pnJrP9E2Y9QdRdDs17Dr2OuuVYZ2X9/O4mGHnSNEoHvygC5M8qfTe', 'department', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `lamination_types`
--
ALTER TABLE `lamination_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paper_qualities`
--
ALTER TABLE `paper_qualities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paper_sizes`
--
ALTER TABLE `paper_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plate_types`
--
ALTER TABLE `plate_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printing_types`
--
ALTER TABLE `printing_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `processes`
--
ALTER TABLE `processes`
  ADD PRIMARY KEY (`process_id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `sub_tasks`
--
ALTER TABLE `sub_tasks`
  ADD PRIMARY KEY (`sub_task_id`),
  ADD KEY `main_task_id` (`main_task_id`),
  ADD KEY `assigned_to` (`assigned_to`),
  ADD KEY `assigned_to_department` (`assigned_to_department`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `FK_client_id` (`client_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_department` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lamination_types`
--
ALTER TABLE `lamination_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `paper_qualities`
--
ALTER TABLE `paper_qualities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `paper_sizes`
--
ALTER TABLE `paper_sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `plate_types`
--
ALTER TABLE `plate_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `printing_types`
--
ALTER TABLE `printing_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `processes`
--
ALTER TABLE `processes`
  MODIFY `process_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_tasks`
--
ALTER TABLE `sub_tasks`
  MODIFY `sub_task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=683;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `processes`
--
ALTER TABLE `processes`
  ADD CONSTRAINT `processes_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
  ADD CONSTRAINT `processes_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `sub_tasks`
--
ALTER TABLE `sub_tasks`
  ADD CONSTRAINT `sub_tasks_ibfk_1` FOREIGN KEY (`main_task_id`) REFERENCES `tasks` (`task_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_tasks_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sub_tasks_ibfk_3` FOREIGN KEY (`assigned_to_department`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `FK_client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
