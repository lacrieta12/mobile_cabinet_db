-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2024 at 08:51 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobile_cabinet_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `organisation` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `postalcode` varchar(100) NOT NULL,
  `PIN` int(5) NOT NULL,
  `is_super_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `email`, `organisation`, `address`, `city`, `state`, `country`, `postalcode`, `PIN`, `is_super_admin`) VALUES
(1, 'admin', '$2b$12$9SXSizGuPDTFXzahIqooZeDFvgWsbCIYXzNZNyco4j4qfOCs8It16', 'admin@gmail.conm', 'admin org', 'jl admin no 23', 'Bandung', 'Jawa Barat', 'Indonesia', '232341', 123456, 1),
(8, 'user', '$2b$12$bGATGZ5Z4I4U0qRYXhR3F.OIbetEmNploo9FV3N2kMNoQ.6mzWi7e', 'user@gmail.con7', 'userorg1', 'jl user no. 1232', 'Cimahi3', 'Jawa Barat4', 'Indonesia5', '232346', 313123, 0),
(10, 'abcde', '$2b$12$.WA6b2.UFPCmh6jzOBX.UOcdDcPkupf6IKrapiKMjCSHlIKK2/UV2', 'abcd@gmail.com', 'Polman', 'Jl Dago', 'Bandung', 'Jawa Barat', 'Negara', '123321', 123456, 0),
(11, 'user2', '$2b$12$H4vUDLs5PTgnl0Qw2ARZmOwRXZnP/05OsiI6veXC3OJqpPAti7.ku', 'user2@gmail.com', 'perusahaan', 'bandung', 'bandung', 'jawa barat', 'Indonesia', '40622', 123456, 0),
(12, 'Pengguna1', '$2b$12$kzjm9AqudfSk/d3epR01COrGOjA2ZP/6eGUkNrdtgOUNhZtMamb0W', 'pengguna1@email.com', 'Organisasi', 'Rumah', 'Jakarta', 'DKI Jakarta', 'Indonesia', '11002', 123456, 0),
(13, 'pengguna2', '$2b$12$qCtJnnNYJW3pc/3Em6XrHeOJASbbFiKNVGgAiAMd6ztceISQTdll.', 'pengguna2@email.com', 'Organisasi', 'Rumah', 'Jakarta', 'DKI Jakarta', 'Indonesia', '11002', 123456, 0);

-- --------------------------------------------------------

--
-- Table structure for table `data_trans`
--

CREATE TABLE `data_trans` (
  `id_transaksi` int(100) NOT NULL,
  `username` varchar(10) NOT NULL,
  `id_dokumen` varchar(10) NOT NULL,
  `status_dev1` int(1) NOT NULL DEFAULT 0,
  `status_dev2` int(1) NOT NULL DEFAULT 0,
  `status_dev3` int(1) NOT NULL DEFAULT 0,
  `waktu_trans` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_trans`
--

INSERT INTO `data_trans` (`id_transaksi`, `username`, `id_dokumen`, `status_dev1`, `status_dev2`, `status_dev3`, `waktu_trans`) VALUES
(133, 'admin', '4', 1, 1, 1, '2023-05-10 18:26:31'),
(135, 'admin', '23', 1, 1, 1, '2023-05-10 18:48:32'),
(136, 'admin', '14', 1, 1, 1, '2023-05-10 18:49:25'),
(137, 'admin', 'nama_dokum', 1, 1, 1, '2023-05-10 18:50:12'),
(139, 'admin', 'nama_dokum', 1, 1, 1, '2023-05-10 18:52:09'),
(140, 'admin', 'nama_dokum', 1, 1, 1, '2023-05-10 18:52:52'),
(141, 'admin', 'nama_dokum', 1, 1, 1, '2023-05-10 18:54:23'),
(142, 'admin', '23', 1, 1, 1, '2023-05-10 18:56:47'),
(143, 'Admin 2', '23', 1, 1, 1, '2023-05-10 19:07:26'),
(144, 'Admin 2', '14', 1, 1, 1, '2023-05-12 09:48:04'),
(145, '1', '14', 1, 1, 1, '2023-05-18 10:36:37'),
(146, '5', '14', 1, 1, 1, '2023-05-22 08:48:56'),
(147, '4', '14', 1, 1, 1, '2023-05-22 13:47:43'),
(148, '4', 'f336a93a0', 1, 1, 1, '2023-06-16 14:26:39'),
(149, '4', 'f336a93a0', 1, 1, 1, '2023-06-16 14:30:40'),
(150, '4', 'f336a93a0', 1, 1, 1, '2023-06-16 14:31:11'),
(151, '4', '14', 1, 1, 1, '2023-06-16 14:36:20'),
(152, '4', '14', 1, 1, 1, '2023-06-16 14:39:21'),
(153, '4', '14', 1, 1, 1, '2023-06-16 14:39:32'),
(154, '4', '14', 1, 1, 1, '2023-06-16 14:39:49'),
(155, '4', 'f336a93a0', 1, 1, 1, '2023-06-16 14:41:01'),
(156, '4', '14', 1, 1, 1, '2023-06-16 14:41:11'),
(157, '4', '14', 1, 1, 1, '2023-06-16 14:45:30'),
(158, '4', '14', 1, 1, 1, '2023-06-16 14:45:50'),
(159, '4', '14', 1, 1, 1, '2023-06-16 14:46:03'),
(160, '4', '14', 1, 1, 1, '2023-06-16 14:46:38'),
(161, '4', '14', 1, 1, 1, '2023-06-16 14:55:45'),
(162, '4', '14', 1, 1, 1, '2023-06-16 14:59:11'),
(163, '4', '14', 1, 1, 1, '2023-06-16 15:01:12'),
(164, '4', '14', 1, 1, 1, '2023-06-16 15:01:22'),
(165, '4', '14', 1, 1, 1, '2023-06-16 15:03:07'),
(166, '4', '14', 1, 1, 1, '2023-06-16 15:04:56'),
(167, '4', 'f336a93a0', 1, 1, 1, '2023-06-16 15:09:01'),
(168, '4', '14', 1, 1, 1, '2023-06-16 15:14:32'),
(169, '4', '14', 0, 0, 0, '2023-06-16 15:30:49'),
(170, '4', '14', 1, 1, 1, '2023-06-16 15:31:24'),
(171, '4', '14', 0, 0, 0, '2023-06-16 15:35:06'),
(172, '4', '14', 1, 1, 1, '2023-06-16 15:35:56'),
(173, '4', '14', 0, 0, 0, '2023-06-16 15:37:09'),
(174, '4', '14', 0, 0, 0, '2023-06-16 15:37:57'),
(175, '4', '14', 1, 1, 1, '2023-06-16 15:38:29'),
(176, '6', '14', 1, 1, 1, '2023-06-16 19:18:39'),
(177, '6', '14', 0, 0, 0, '2023-06-16 19:19:19'),
(178, '6', '14', 1, 1, 1, '2023-06-16 19:19:43'),
(179, '6', '14', 1, 1, 1, '2023-06-16 19:21:56'),
(180, '6', '14', 0, 0, 0, '2023-06-16 19:22:10'),
(181, '6', '14', 1, 1, 1, '2023-06-16 19:22:42'),
(182, '6', '14', 0, 0, 0, '2023-06-16 19:23:09'),
(183, '6', '14', 1, 1, 1, '2023-06-16 19:23:49'),
(184, '6', '87e2d4080', 1, 1, 1, '2023-06-20 10:44:28'),
(185, '6', '87e2d4080', 1, 1, 1, '2023-06-20 10:45:17'),
(186, '4', '7fade6902', 1, 1, 1, '2023-07-14 10:12:13'),
(187, '1', '4', 1, 1, 1, '2023-09-24 17:01:55'),
(188, '1', '4', 0, 0, 0, '2023-09-24 17:02:27'),
(189, '1', '7fade6902', 1, 1, 1, '2023-09-25 09:42:06'),
(190, '1', '14', 1, 1, 1, '2023-11-06 14:21:45'),
(191, '1', '14', 0, 0, 0, '2023-11-06 14:29:35'),
(192, '1', '14', 1, 1, 1, '2023-11-06 14:32:54'),
(193, '1', '14', 1, 1, 1, '2023-11-06 14:34:06'),
(194, '1', '14', 1, 1, 1, '2023-11-06 14:35:07'),
(195, '1', '14', 1, 1, 1, '2023-11-06 14:36:50'),
(196, '1', '14', 1, 1, 1, '2023-11-06 14:38:43'),
(197, '1', '14', 1, 1, 1, '2023-11-06 14:40:56'),
(198, '1', '14', 1, 1, 1, '2023-11-06 14:43:39'),
(199, '1', '14', 1, 1, 1, '2023-11-06 14:44:50'),
(200, '1', '14', 1, 1, 1, '2023-11-06 14:47:43'),
(201, '1', '14', 1, 1, 1, '2023-11-06 14:49:09'),
(202, '1', '14', 1, 1, 1, '2023-11-06 14:52:12'),
(203, '1', '14', 1, 1, 1, '2023-11-06 15:21:19'),
(204, '1', '14', 1, 1, 1, '2023-11-06 15:23:19'),
(205, '1', '14', 1, 1, 1, '2023-11-06 15:24:09'),
(206, '1', '14', 1, 1, 1, '2023-11-06 15:27:03'),
(207, '1', '14', 1, 1, 1, '2023-11-06 15:28:20'),
(208, '1', '14', 1, 1, 1, '2023-11-06 16:11:27'),
(209, '1', '14', 1, 1, 1, '2023-11-06 16:19:25'),
(210, '1', '14', 0, 0, 0, '2023-11-06 16:20:12'),
(211, '1', '14', 1, 1, 1, '2023-11-06 16:20:27'),
(212, '1', '14', 1, 1, 1, '2023-11-06 16:21:53'),
(213, '1', '14', 1, 1, 1, '2023-11-06 16:23:21'),
(214, '1', '14', 0, 0, 0, '2023-11-06 16:34:45'),
(215, '1', '14', 1, 1, 1, '2023-11-06 16:35:00'),
(216, '1', 'f407d51b7', 1, 1, 1, '2023-11-06 16:37:01'),
(217, '1', 'f96a74bd7', 1, 1, 1, '2023-11-06 16:38:02'),
(218, '1', 'f96a74bd7', 1, 1, 1, '2023-11-06 16:39:10'),
(219, '1', 'ff3feb547', 1, 1, 1, '2023-11-06 16:39:59'),
(220, '1', 'f96a74bd7', 1, 1, 1, '2023-11-06 16:42:14'),
(221, '1', 'ff3feb547', 1, 1, 1, '2023-11-06 16:44:38'),
(222, '1', 'f407d51b7', 1, 1, 1, '2023-11-06 16:45:20'),
(223, '1', 'ff3feb547', 1, 1, 1, '2023-11-06 16:51:01'),
(224, '1', '14', 1, 1, 1, '2023-11-06 16:52:45'),
(225, '1', 'ff3feb547', 0, 0, 0, '2023-11-06 16:53:33'),
(226, '1', 'ff3feb547', 1, 1, 1, '2023-11-06 16:53:42'),
(227, '1', 'f407d51b7', 1, 1, 1, '2023-11-06 16:54:42'),
(228, '1', '14', 0, 0, 0, '2023-11-06 16:55:52'),
(229, '1', '14', 1, 1, 1, '2023-11-07 09:45:02'),
(230, '1', 'f96a74bd7', 1, 1, 1, '2023-11-07 09:45:47'),
(231, '1', 'ff3feb547', 1, 1, 1, '2023-11-07 09:47:41'),
(232, '1', '14', 1, 1, 1, '2023-11-07 09:48:33'),
(233, '1', '14', 0, 0, 0, '2023-11-07 09:52:59'),
(234, '1', '14', 1, 1, 1, '2023-11-07 09:52:59'),
(235, '1', 'f407d51b7', 1, 1, 1, '2023-11-07 09:54:05'),
(236, '1', 'f407d51b7', 1, 1, 1, '2023-11-07 09:54:46'),
(237, '1', 'f96a74bd7', 1, 1, 1, '2023-11-07 09:55:36'),
(238, '1', 'ff3feb547', 1, 1, 1, '2023-11-07 09:56:24'),
(239, '1', 'f407d51b7', 0, 0, 0, '2023-11-07 10:09:05'),
(240, '1', 'f407d51b7', 1, 1, 1, '2023-11-07 10:11:41'),
(241, '1', 'f407d51b7', 1, 1, 1, '2023-11-07 10:15:53'),
(242, '1', 'f407d51b7', 1, 1, 1, '2023-11-07 10:17:55'),
(243, '1', 'f96a74bd7', 1, 1, 1, '2023-11-07 10:18:39'),
(244, '1', '14', 1, 1, 1, '2023-11-07 10:31:49'),
(245, '1', '14', 1, 1, 1, '2023-11-07 10:35:23'),
(246, '1', '14', 1, 1, 1, '2023-11-07 10:40:08'),
(247, '1', '14', 0, 0, 0, '2023-11-07 11:19:08'),
(248, '1', '14', 1, 1, 1, '2023-11-07 11:20:34'),
(249, '1', '14', 0, 0, 0, '2023-11-07 11:28:22'),
(250, '1', '14', 1, 1, 1, '2023-11-07 11:29:03'),
(251, '1', '14', 1, 1, 1, '2023-11-07 14:36:39'),
(252, '1', '14', 1, 1, 1, '2023-11-07 14:39:06'),
(253, '1', '14', 1, 1, 1, '2023-11-07 14:45:08'),
(254, '1', '14', 1, 1, 1, '2023-11-07 14:48:21'),
(255, '1', '14', 1, 1, 1, '2023-11-07 14:58:23'),
(256, '1', 'f96a74bd7', 1, 1, 1, '2023-11-07 15:00:26'),
(257, '1', 'f96a74bd7', 1, 1, 1, '2023-11-07 15:45:30'),
(258, '1', 'f407d51b7', 1, 1, 1, '2023-11-07 15:47:01'),
(259, '1', '14', 1, 1, 1, '2023-11-07 15:48:35'),
(260, '1', '14', 1, 1, 1, '2023-11-07 15:50:49'),
(261, '1', '14', 1, 1, 1, '2023-11-07 15:51:49'),
(262, '1', 'f96a74bd7', 1, 1, 1, '2023-11-07 15:52:37'),
(263, '1', 'f96a74bd7', 1, 1, 1, '2023-11-07 15:53:45'),
(264, '1', 'f96a74bd7', 1, 1, 1, '2023-11-07 15:55:16'),
(265, '1', 'f407d51b7', 1, 1, 1, '2023-11-07 15:56:30'),
(266, '1', '14', 1, 1, 1, '2023-11-07 16:16:34'),
(267, '1', 'f96a74bd7', 1, 1, 1, '2023-11-07 16:17:39'),
(268, '1', 'ff3feb547', 1, 1, 1, '2023-11-07 16:22:02'),
(269, '1', 'f96a74bd7', 1, 1, 1, '2023-11-07 16:27:31'),
(270, '1', 'f96a74bd7', 1, 1, 1, '2023-11-07 16:29:15'),
(271, '1', 'f407d51b7', 1, 1, 1, '2023-11-07 16:29:54'),
(272, '1', '57651a177', 1, 1, 1, '2023-11-07 16:31:04'),
(273, '1', 'ff3feb547', 1, 1, 1, '2023-11-07 16:38:53'),
(274, '1', 'f407d51b7', 1, 1, 1, '2023-11-07 16:42:32'),
(275, '1', '14', 1, 1, 1, '2023-11-07 16:44:23'),
(276, '1', 'f96a74bd7', 1, 1, 1, '2023-11-07 16:45:28'),
(277, '1', '5f5075237', 1, 1, 1, '2023-11-08 10:29:32'),
(278, '1', '9c00387d7', 1, 1, 1, '2023-11-08 10:41:56'),
(279, '1', 'a7a548507', 1, 1, 1, '2023-11-08 10:44:51'),
(280, '1', 'b5a0269a7', 1, 1, 1, '2023-11-08 10:48:36'),
(281, '1', '81b5e1eb7', 1, 1, 1, '2023-11-08 10:50:39'),
(282, '1', '81b5e1eb7', 1, 1, 1, '2023-11-08 10:51:58'),
(283, '1', '81b5e1eb7', 1, 1, 1, '2023-11-08 10:52:57'),
(284, '1', 'b5a0269a7', 1, 1, 1, '2023-11-08 10:53:53'),
(285, '1', '81b5e1eb7', 1, 1, 1, '2023-11-08 11:06:27'),
(286, '1', 'b5a0269a7', 1, 1, 1, '2023-11-08 11:41:33'),
(287, '1', 'b5a0269a7', 1, 1, 1, '2023-11-08 11:43:24'),
(288, '1', '58045f557', 1, 1, 1, '2023-11-08 13:50:39'),
(289, '1', 'e2a9effd7', 1, 1, 1, '2023-11-08 13:51:13'),
(290, '1', 'e2a9effd7', 1, 1, 1, '2023-11-08 13:52:24'),
(291, '1', 'd3bab5f17', 1, 1, 1, '2023-11-08 14:04:58'),
(292, '1', '5ba1c3a57', 1, 1, 1, '2023-11-08 14:09:54'),
(293, '1', 'd87bec8a7', 1, 1, 1, '2023-11-08 14:15:02'),
(294, '1', '646965bf7', 1, 1, 1, '2023-11-08 14:15:58'),
(295, '1', 'd87bec8a7', 1, 1, 1, '2023-11-08 14:26:33'),
(296, '1', '41f31d347', 1, 1, 1, '2023-11-08 14:28:09'),
(297, '1', '7ccc35e87', 1, 1, 1, '2023-11-08 14:41:24'),
(298, '1', '80854ad47', 1, 1, 1, '2023-11-08 14:42:11'),
(299, '1', '81b5e1eb7', 1, 1, 1, '2023-11-08 14:42:47'),
(300, '1', '9c00387d7', 1, 1, 1, '2023-11-08 14:51:22'),
(301, '1', 'd87bec8a7', 1, 1, 1, '2023-11-08 14:52:41'),
(302, '1', '5ba1c3a57', 1, 1, 1, '2023-11-08 14:53:35'),
(303, '1', '874b98657', 1, 1, 1, '2023-11-08 14:54:22'),
(304, '8', '81b5e1eb7', 1, 1, 1, '2023-11-08 15:57:55'),
(305, '8', '9889f4b67', 0, 0, 0, '2023-11-08 16:13:04'),
(306, '8', '9889f4b67', 1, 1, 1, '2023-11-08 16:14:13'),
(307, '8', '9889f4b67', 1, 1, 1, '2023-11-08 16:16:03'),
(308, '8', '81b5e1eb7', 1, 1, 1, '2023-11-08 16:22:24'),
(309, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:48:32'),
(310, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:48:35'),
(311, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:48:35'),
(312, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:48:35'),
(313, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:48:36'),
(314, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:48:37'),
(315, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:48:38'),
(316, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:48:40'),
(317, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:48:41'),
(318, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:48:51'),
(319, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:48:53'),
(320, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:51:31'),
(321, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:51:33'),
(322, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:51:34'),
(323, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:51:35'),
(324, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:52:09'),
(325, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:54:31'),
(326, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:54:32'),
(327, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:54:33'),
(328, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:54:34'),
(329, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:54:35'),
(330, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:54:35'),
(331, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:54:35'),
(332, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:54:36'),
(333, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:54:36'),
(334, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:54:37'),
(335, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:55:27'),
(336, '1', '81b5e1eb7', 0, 0, 0, '2023-11-08 16:55:30'),
(337, '1', '81b5e1eb7', 1, 1, 1, '2023-11-08 16:55:32'),
(338, '1', '7ccc35e87', 0, 0, 0, '2023-11-09 09:44:28'),
(339, '1', '7ccc35e87', 0, 0, 0, '2023-11-09 09:44:32'),
(340, '1', '7ccc35e87', 0, 0, 0, '2023-11-09 09:44:32'),
(341, '1', '7ccc35e87', 0, 0, 0, '2023-11-09 09:44:33'),
(342, '1', '7ccc35e87', 0, 0, 0, '2023-11-09 09:44:33'),
(343, '1', '7ccc35e87', 0, 0, 0, '2023-11-09 09:44:34'),
(344, '1', '7ccc35e87', 0, 0, 0, '2023-11-09 09:44:34'),
(345, '1', '7ccc35e87', 0, 0, 0, '2023-11-09 09:44:34'),
(346, '1', '7ccc35e87', 0, 0, 0, '2023-11-09 09:44:35'),
(347, '1', '7ccc35e87', 0, 0, 0, '2023-11-09 09:44:35'),
(348, '1', '7ccc35e87', 0, 0, 0, '2023-11-09 09:44:35'),
(349, '1', '7ccc35e87', 1, 1, 1, '2023-11-09 09:44:35'),
(350, '1', '81b5e1eb7', 1, 1, 1, '2023-11-09 09:49:48'),
(351, '8', '81b5e1eb7', 0, 0, 0, '2023-11-09 09:54:20'),
(352, '8', '81b5e1eb7', 0, 0, 0, '2023-11-09 09:54:32'),
(353, '8', '81b5e1eb7', 0, 0, 0, '2023-11-09 09:54:32'),
(354, '8', '81b5e1eb7', 0, 0, 0, '2023-11-09 09:54:32'),
(355, '8', '81b5e1eb7', 0, 0, 0, '2023-11-09 09:54:32'),
(356, '8', '81b5e1eb7', 0, 0, 0, '2023-11-09 09:54:32'),
(357, '8', '81b5e1eb7', 0, 0, 0, '2023-11-09 09:54:32'),
(358, '8', '81b5e1eb7', 0, 0, 0, '2023-11-09 09:54:33'),
(359, '8', '81b5e1eb7', 0, 0, 0, '2023-11-09 09:54:33'),
(360, '8', '81b5e1eb7', 0, 0, 0, '2023-11-09 09:54:33'),
(361, '8', '81b5e1eb7', 1, 1, 1, '2023-11-09 09:54:33'),
(362, '1', '6f4d06499', 0, 0, 0, '2023-12-06 03:16:00'),
(363, '1', '6f4d06499', 0, 0, 0, '2023-12-06 03:17:14'),
(364, '1', '6f4d06499', 0, 0, 0, '2023-12-06 03:17:15'),
(365, '1', '6f4d06499', 0, 0, 0, '2023-12-06 03:17:15'),
(366, '1', '6f4d06499', 0, 0, 0, '2023-12-06 03:17:15'),
(367, '1', '6f4d06499', 0, 0, 0, '2023-12-06 03:17:16'),
(368, '1', '6f4d06499', 0, 0, 0, '2023-12-06 03:17:16'),
(369, '1', '6f4d06499', 0, 0, 0, '2023-12-06 03:20:06'),
(370, '1', 'f57ca4377', 0, 0, 0, '2023-12-06 03:23:59'),
(371, '1', '862510da9', 1, 1, 1, '2023-12-06 03:26:20'),
(372, '1', '6f4d06499', 1, 1, 1, '2023-12-06 03:38:55'),
(373, '1', '6f4d06499', 1, 1, 1, '2023-12-06 03:55:52'),
(374, '1', '7de226b89', 1, 1, 1, '2023-12-06 04:06:51'),
(375, '1', '98bc8ce19', 1, 1, 1, '2023-12-06 04:20:03'),
(376, '1', '9ca8bc7d9', 1, 1, 1, '2023-12-06 05:02:23'),
(377, '1', '6f4d06499', 1, 1, 1, '2023-12-12 13:39:17'),
(378, '1', '6f4d06499', 1, 1, 1, '2023-12-12 14:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `door_locks`
--

CREATE TABLE `door_locks` (
  `id_loker` int(5) NOT NULL,
  `device_ke` int(1) NOT NULL,
  `rak_ke` int(1) NOT NULL,
  `status_pintu` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `door_locks`
--

INSERT INTO `door_locks` (`id_loker`, `device_ke`, `rak_ke`, `status_pintu`) VALUES
(1, 1, 1, 0),
(2, 2, 1, 0),
(3, 2, 2, 0),
(4, 3, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `list_dokumen`
--

CREATE TABLE `list_dokumen` (
  `id_dokumen` varchar(10) NOT NULL,
  `nama_dokumen` varchar(255) NOT NULL,
  `device_ke` int(11) NOT NULL,
  `rak_ke` int(1) NOT NULL,
  `baris_ke` int(11) NOT NULL,
  `kolom_ke` int(11) NOT NULL,
  `status_option` int(1) NOT NULL DEFAULT 0,
  `status_document` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `list_dokumen`
--

INSERT INTO `list_dokumen` (`id_dokumen`, `nama_dokumen`, `device_ke`, `rak_ke`, `baris_ke`, `kolom_ke`, `status_option`, `status_document`) VALUES
('028330897', 'Dokumen 20', 2, 1, 2, 5, 0, 0),
('0d7f54a29', 'Document tes', 78, 1, 1, 1, 1, 0),
('1aa1eda39', 'Dokumen lemari 2', 2, 1, 1, 1, 1, 0),
('1be28f367', 'tes 2', 1, 1, 1, 1, 0, 0),
('23d542867', 'Dokumen 21', 2, 2, 1, 1, 0, 0),
('41f31d347', 'Dokumen 22', 2, 2, 1, 2, 1, 0),
('54e89ed37', 'Dokumen 23', 2, 2, 1, 3, 0, 0),
('58045f557', 'Dokumen 24', 2, 2, 1, 4, 1, 0),
('5ba1c3a57', 'Dokumen 25', 2, 2, 1, 5, 0, 0),
('5f5075237', 'Dokumen 26', 2, 2, 2, 1, 1, 0),
('646965bf7', 'Dokumen 27', 2, 2, 2, 2, 1, 0),
('6b7a53dc7', 'Dokumen 28', 2, 2, 2, 3, 0, 0),
('6f4d06499', 'Document 1', 1, 1, 1, 3, 0, 0),
('70a560c47', 'Dokumen 29', 2, 2, 2, 4, 0, 0),
('741b870d7', 'Dokumen 30', 2, 2, 2, 5, 0, 0),
('7ccc35e87', 'Dokumen 31', 3, 1, 1, 1, 0, 0),
('7de226b89', 'Document 2', 2, 1, 1, 3, 1, 0),
('80854ad47', 'Dokumen 32', 3, 1, 1, 2, 1, 0),
('81b5e1eb7', 'Dokumen 1', 1, 1, 1, 1, 1, 0),
('83c839987', 'Dokumen 33', 3, 1, 1, 3, 0, 0),
('862510da9', '1', 1, 12, 1, 1, 0, 0),
('874b98657', 'Dokumen 34', 3, 1, 1, 4, 1, 0),
('88b244589', 'Dokumen tambahan', 1, 1, 2, 2, 1, 0),
('8a4e077b7', 'Dokumen 2', 1, 1, 1, 2, 0, 0),
('8b854ab57', 'Dokumen 35', 3, 1, 1, 5, 0, 0),
('900355097', 'Dokumen 36', 3, 1, 2, 1, 0, 0),
('94dc10887', 'Dokumen 3', 1, 1, 1, 3, 0, 0),
('94e4487f7', 'Dokumen 37', 3, 1, 2, 2, 0, 0),
('9889f4b67', 'Dokumen 4', 1, 1, 1, 4, 0, 0),
('98bc8ce19', 'Document 3', 2, 2, 1, 3, 1, 0),
('993897697', 'Dokumen 38', 3, 1, 2, 3, 0, 0),
('9c00387d7', 'Dokumen 5', 1, 1, 1, 5, 0, 0),
('9ca8bc7d9', 'Document 4', 3, 1, 1, 3, 1, 0),
('9d6990097', 'Dokumen 39', 3, 1, 2, 4, 0, 0),
('9ead680e7', 'dokumen aku', 1, 1, 1, 1, 1, 0),
('a0bddb987', 'Dokumen 40', 3, 1, 2, 5, 0, 0),
('a1a0575e7', 'Dokumen 6', 1, 1, 2, 1, 0, 0),
('a7a548507', 'Dokumen 7', 1, 1, 2, 2, 1, 0),
('ab0cc9757', 'Dokumen 8', 1, 1, 2, 3, 0, 0),
('afeb1cdf7', 'Dokumen 9', 1, 1, 2, 4, 0, 0),
('b5a0269a7', 'Dokumen 10', 1, 1, 2, 5, 0, 0),
('c3616c847', 'dokumen dia', 1, 1, 1, 1, 0, 0),
('d3bab5f17', 'Dokumen 11', 2, 1, 1, 1, 1, 0),
('d87bec8a7', 'Dokumen 12', 2, 1, 1, 2, 1, 0),
('db910be87', 'Dokumen 13', 2, 1, 1, 3, 0, 0),
('df4848187', 'Dokumen 14', 2, 1, 1, 4, 0, 0),
('e2a9effd7', 'Dokumen 15', 2, 1, 1, 5, 0, 0),
('e7092eac7', 'Dokumen 16', 2, 1, 2, 1, 0, 0),
('eb7295527', 'Dokumen 17', 2, 1, 2, 2, 0, 0),
('f57ca4377', 'tes', 1, 1, 1, 1, 0, 0),
('f6f2ab747', 'Dokumen 18', 2, 1, 2, 3, 0, 0),
('fa72b2097', 'Dokumen 19', 2, 1, 2, 4, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `register_history`
--

CREATE TABLE `register_history` (
  `id_register` int(11) NOT NULL,
  `user_register` varchar(255) NOT NULL,
  `register_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register_history`
--

INSERT INTO `register_history` (`id_register`, `user_register`, `register_time`) VALUES
(1, '1111', '2023-05-12 16:55:21');

-- --------------------------------------------------------

--
-- Table structure for table `search_history`
--

CREATE TABLE `search_history` (
  `id_search` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `search_keyword` varchar(255) NOT NULL,
  `search_time` datetime NOT NULL DEFAULT current_timestamp(),
  `information` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `search_history`
--

INSERT INTO `search_history` (`id_search`, `username`, `search_keyword`, `search_time`, `information`) VALUES
(277, 'admin', 'Dokumen 1', '2023-11-08 09:28:30', 'Add Document'),
(278, 'admin', 'Dokumen 2', '2023-11-08 09:28:45', 'Add Document'),
(279, 'admin', 'Dokumen 3', '2023-11-08 09:29:02', 'Add Document'),
(280, 'admin', 'Dokumen 4', '2023-11-08 09:29:09', 'Add Document'),
(281, 'admin', 'Dokumen 5', '2023-11-08 09:29:14', 'Add Document'),
(282, 'admin', 'Dokumen 6', '2023-11-08 09:29:24', 'Add Document'),
(283, 'admin', 'Dokumen 7', '2023-11-08 09:29:34', 'Add Document'),
(284, 'admin', 'Dokumen 8', '2023-11-08 09:29:40', 'Add Document'),
(285, 'admin', 'Dokumen 9', '2023-11-08 09:29:48', 'Add Document'),
(286, 'admin', 'Dokumen 10', '2023-11-08 09:29:57', 'Add Document'),
(287, 'admin', 'Dokumen 11', '2023-11-08 09:30:48', 'Add Document'),
(288, 'admin', 'Dokumen 12', '2023-11-08 09:30:56', 'Add Document'),
(289, 'admin', 'Dokumen 13', '2023-11-08 09:31:01', 'Add Document'),
(290, 'admin', 'Dokumen 14', '2023-11-08 09:31:07', 'Add Document'),
(291, 'admin', 'Dokumen 15', '2023-11-08 09:31:13', 'Add Document'),
(292, 'admin', 'Dokumen 16', '2023-11-08 09:31:20', 'Add Document'),
(293, 'admin', 'Dokumen 17', '2023-11-08 09:31:28', 'Add Document'),
(294, 'admin', 'Dokumen 18', '2023-11-08 09:31:47', 'Add Document'),
(295, 'admin', 'Dokumen 19', '2023-11-08 09:31:53', 'Add Document'),
(296, 'admin', 'Dokumen 20', '2023-11-08 09:32:06', 'Add Document'),
(297, 'admin', 'Dokumen 21', '2023-11-08 09:33:02', 'Add Document'),
(298, 'admin', 'Dokumen 22', '2023-11-08 09:33:53', 'Add Document'),
(299, 'admin', 'Dokumen 23', '2023-11-08 09:34:25', 'Add Document'),
(300, 'admin', 'Dokumen 24', '2023-11-08 09:34:30', 'Add Document'),
(301, 'admin', 'Dokumen 25', '2023-11-08 09:34:36', 'Add Document'),
(302, 'admin', 'Dokumen 26', '2023-11-08 09:34:42', 'Add Document'),
(303, 'admin', 'Dokumen 27', '2023-11-08 09:34:51', 'Add Document'),
(304, 'admin', 'Dokumen 28', '2023-11-08 09:35:02', 'Add Document'),
(305, 'admin', 'Dokumen 29', '2023-11-08 09:35:11', 'Add Document'),
(306, 'admin', 'Dokumen 30', '2023-11-08 09:35:17', 'Add Document'),
(307, 'admin', 'Dokumen 31', '2023-11-08 09:35:32', 'Add Document'),
(308, 'admin', 'Dokumen 32', '2023-11-08 09:35:38', 'Add Document'),
(309, 'admin', 'Dokumen 33', '2023-11-08 09:35:43', 'Add Document'),
(310, 'admin', 'Dokumen 34', '2023-11-08 09:35:49', 'Add Document'),
(311, 'admin', 'Dokumen 35', '2023-11-08 09:35:56', 'Add Document'),
(312, 'admin', 'Dokumen 36', '2023-11-08 09:36:04', 'Add Document'),
(313, 'admin', 'Dokumen 37', '2023-11-08 09:36:12', 'Add Document'),
(314, 'admin', 'Dokumen 38', '2023-11-08 09:36:19', 'Add Document'),
(315, 'admin', 'Dokumen 39', '2023-11-08 09:36:26', 'Add Document'),
(316, 'admin', 'Dokumen 40', '2023-11-08 09:36:32', 'Add Document'),
(317, 'admin', 'dokumen 26', '2023-11-08 10:29:26', 'Search'),
(318, 'admin', 'Dokumen 26', '2023-11-08 10:29:28', 'Take'),
(319, 'admin', 'dokumen 5', '2023-11-08 10:41:52', 'Search'),
(320, 'admin', 'Dokumen 5', '2023-11-08 10:41:53', 'Take'),
(321, 'admin', 'dokumen 7', '2023-11-08 10:44:46', 'Search'),
(322, 'admin', 'Dokumen 7', '2023-11-08 10:44:48', 'Take'),
(323, 'admin', 'dokumen 10', '2023-11-08 10:48:31', 'Search'),
(324, 'admin', 'Dokumen 10', '2023-11-08 10:48:33', 'Take'),
(325, 'admin', 'dokumen 1', '2023-11-08 10:50:34', 'Search'),
(326, 'admin', 'Dokumen 1', '2023-11-08 10:50:36', 'Take'),
(327, 'admin', 'dokumen 1', '2023-11-08 10:51:54', 'Search'),
(328, 'admin', 'Dokumen 1', '2023-11-08 10:51:55', 'Restore'),
(329, 'admin', 'dokumen 1', '2023-11-08 10:52:53', 'Search'),
(330, 'admin', 'Dokumen 1', '2023-11-08 10:52:54', 'Take'),
(331, 'admin', 'dokumen 10', '2023-11-08 10:53:48', 'Search'),
(332, 'admin', 'Dokumen 10', '2023-11-08 10:53:50', 'Restore'),
(333, 'admin', 'dokumen 1', '2023-11-08 11:06:22', 'Search'),
(334, 'admin', 'Dokumen 1', '2023-11-08 11:06:25', 'Restore'),
(335, 'admin', 'dokumen 10', '2023-11-08 11:41:27', 'Search'),
(336, 'admin', 'Dokumen 10', '2023-11-08 11:41:29', 'Take'),
(337, 'admin', 'dokumen 10', '2023-11-08 11:43:19', 'Search'),
(338, 'admin', 'Dokumen 10', '2023-11-08 11:43:21', 'Restore'),
(339, 'admin', 'dokumen 24', '2023-11-08 13:50:31', 'Search'),
(340, 'admin', 'Dokumen 24', '2023-11-08 13:50:33', 'Take'),
(341, 'admin', 'dokumen 15', '2023-11-08 13:51:08', 'Search'),
(342, 'admin', 'Dokumen 15', '2023-11-08 13:51:10', 'Take'),
(343, 'admin', 'dokumen 15', '2023-11-08 13:52:16', 'Search'),
(344, 'admin', 'Dokumen 15', '2023-11-08 13:52:18', 'Restore'),
(345, 'admin', 'dokumen 1', '2023-11-08 14:04:33', 'Search'),
(346, 'admin', 'dokumen 11', '2023-11-08 14:04:45', 'Search'),
(347, 'admin', 'Dokumen 11', '2023-11-08 14:04:47', 'Take'),
(348, 'admin', 'dokumen 25', '2023-11-08 14:09:48', 'Search'),
(349, 'admin', 'Dokumen 25', '2023-11-08 14:09:51', 'Take'),
(350, 'admin', 'dokumen 1', '2023-11-08 14:14:45', 'Search'),
(351, 'admin', 'dokumen 12', '2023-11-08 14:14:55', 'Search'),
(352, 'admin', 'Dokumen 12', '2023-11-08 14:14:57', 'Take'),
(353, 'admin', 'dokumen 27', '2023-11-08 14:15:53', 'Search'),
(354, 'admin', 'Dokumen 27', '2023-11-08 14:15:55', 'Take'),
(355, 'admin', 'dokumen 12', '2023-11-08 14:26:29', 'Search'),
(356, 'admin', 'Dokumen 12', '2023-11-08 14:26:30', 'Restore'),
(357, 'admin', 'dokumen 22', '2023-11-08 14:28:03', 'Search'),
(358, 'admin', 'Dokumen 22', '2023-11-08 14:28:06', 'Take'),
(359, 'admin', 'dokumen 31', '2023-11-08 14:41:18', 'Search'),
(360, 'admin', 'Dokumen 31', '2023-11-08 14:41:19', 'Take'),
(361, 'admin', 'dokumen 32', '2023-11-08 14:42:06', 'Search'),
(362, 'admin', 'Dokumen 32', '2023-11-08 14:42:07', 'Take'),
(363, 'admin', 'dokumen 1', '2023-11-08 14:42:43', 'Search'),
(364, 'admin', 'Dokumen 1', '2023-11-08 14:42:45', 'Take'),
(365, 'admin', 'dokumen 5', '2023-11-08 14:51:05', 'Search'),
(366, 'admin', 'Dokumen 5', '2023-11-08 14:51:06', 'Restore'),
(367, 'admin', 'dokumen 12', '2023-11-08 14:52:23', 'Search'),
(368, 'admin', 'Dokumen 12', '2023-11-08 14:52:25', 'Take'),
(369, 'admin', 'dokumen 25', '2023-11-08 14:53:30', 'Search'),
(370, 'admin', 'Dokumen 25', '2023-11-08 14:53:32', 'Restore'),
(371, 'admin', 'dokumen 34', '2023-11-08 14:54:17', 'Search'),
(372, 'admin', 'Dokumen 34', '2023-11-08 14:54:18', 'Take'),
(373, 'user', 'dokumen 1', '2023-11-08 15:57:36', 'Search'),
(374, 'user', 'Dokumen 1', '2023-11-08 15:57:37', 'Restore'),
(375, 'user', 'dokumen 4', '2023-11-08 16:12:37', 'Search'),
(376, 'user', 'Dokumen 4', '2023-11-08 16:12:39', 'Take'),
(377, 'user', 'dokumen 4', '2023-11-08 16:13:36', 'Search'),
(378, 'user', 'Dokumen 4', '2023-11-08 16:13:38', 'Take'),
(379, 'user', 'dokumen 4', '2023-11-08 16:15:51', 'Search'),
(380, 'user', 'Dokumen 4', '2023-11-08 16:15:53', 'Restore'),
(381, 'user', 'dokumen aku', '2023-11-08 16:17:20', 'Add Document'),
(382, 'user', 'dokumen aku', '2023-11-08 16:17:41', 'Search'),
(383, 'user', 'dokumen aku', '2023-11-08 16:17:43', 'Take'),
(384, 'user', 'dokumen dia', '2023-11-08 16:18:22', 'Add Document'),
(385, 'user', 'dokumen dia', '2023-11-08 16:18:28', 'Search'),
(386, 'user', 'dokumen dia', '2023-11-08 16:18:30', 'Take'),
(387, 'user', 'dokumen dia', '2023-11-08 16:19:32', 'Search'),
(388, 'user', 'dokumen dia', '2023-11-08 16:19:35', 'Restore'),
(389, 'user', 'tes', '2023-11-08 16:19:46', 'Add Document'),
(390, 'user', 'tes 2', '2023-11-08 16:20:50', 'Add Document'),
(391, 'user', 'tes 2', '2023-11-08 16:21:05', 'Search'),
(392, 'user', 'tes 2', '2023-11-08 16:21:07', 'Restore'),
(393, 'user', 'dokumen 1', '2023-11-08 16:22:18', 'Search'),
(394, 'user', 'Dokumen 1', '2023-11-08 16:22:20', 'Take'),
(395, 'admin', 'dokumen 1', '2023-11-08 16:48:16', 'Search'),
(396, 'admin', 'Dokumen 1', '2023-11-08 16:48:18', 'Restore'),
(397, 'admin', 'dokumen 1', '2023-11-08 16:52:35', 'Search'),
(398, 'admin', 'Dokumen 1', '2023-11-08 16:52:36', 'Restore'),
(399, 'admin', 'dokumen 1', '2023-11-08 16:54:26', 'Search'),
(400, 'admin', 'Dokumen 1', '2023-11-08 16:54:28', 'Take'),
(401, 'admin', 'dokumen 1', '2023-11-08 16:55:24', 'Search'),
(402, 'admin', 'Dokumen 1', '2023-11-08 16:55:25', 'Take'),
(403, 'admin', 'dokumen 31', '2023-11-09 09:44:22', 'Search'),
(404, 'admin', 'Dokumen 31', '2023-11-09 09:44:24', 'Restore'),
(405, 'admin', 'dokumen 1', '2023-11-09 09:49:42', 'Search'),
(406, 'admin', 'Dokumen 1', '2023-11-09 09:49:45', 'Restore'),
(407, 'user', 'dokumen 1', '2023-11-09 09:54:14', 'Search'),
(408, 'user', 'Dokumen 1', '2023-11-09 09:54:16', 'Take'),
(409, 'admin', 'Document 1', '2023-12-06 03:11:11', 'Add Document'),
(410, 'admin', 'Document 2', '2023-12-06 03:11:36', 'Add Document'),
(411, 'admin', 'Document', '2023-12-06 03:12:21', 'Add Document'),
(412, 'admin', 'Document 4', '2023-12-06 03:12:27', 'Add Document'),
(413, 'admin', 'Document 1', '2023-12-06 03:13:54', 'Search'),
(414, 'admin', 'Document 1', '2023-12-06 03:15:47', 'Search'),
(415, 'admin', 'Document 1', '2023-12-06 03:15:53', 'Take'),
(416, 'admin', 'tes', '2023-12-06 03:23:55', 'Search'),
(417, 'admin', 'tes', '2023-12-06 03:23:57', 'Take'),
(418, 'admin', '1', '2023-12-06 03:26:08', 'Add Document'),
(419, 'admin', '1', '2023-12-06 03:26:16', 'Search'),
(420, 'admin', '1', '2023-12-06 03:26:18', 'Restore'),
(421, 'admin', 'Document 1', '2023-12-06 03:31:33', 'Search'),
(422, 'admin', 'tes', '2023-12-06 03:36:20', 'Search'),
(423, 'admin', 'document 1', '2023-12-06 03:38:48', 'Search'),
(424, 'admin', 'Document 1', '2023-12-06 03:38:51', 'Take'),
(425, 'admin', 'Document 1', '2023-12-06 03:55:40', 'Search'),
(426, 'admin', 'Document 1', '2023-12-06 03:55:43', 'Take'),
(427, 'admin', 'Document 2', '2023-12-06 04:06:46', 'Search'),
(428, 'admin', 'Document 2', '2023-12-06 04:06:48', 'Take'),
(429, 'admin', 'Document 3', '2023-12-06 04:19:56', 'Search'),
(430, 'admin', 'Document 3', '2023-12-06 04:19:58', 'Take'),
(431, 'admin', 'Document 4', '2023-12-06 05:02:16', 'Search'),
(432, 'admin', 'Document 4', '2023-12-06 05:02:18', 'Take'),
(433, 'admin', 'Document 3', '2023-12-06 05:14:28', 'Search'),
(434, 'admin', 'Document tes', '2023-12-06 15:32:55', 'Add Document'),
(435, 'admin', 'Dokumen lemari 2', '2023-12-06 15:40:26', 'Add Document'),
(436, 'admin', 'Dokumen Lemari 2', '2023-12-06 15:41:20', 'Search'),
(437, 'admin', 'Document 1', '2023-12-12 13:36:25', 'Search'),
(438, 'admin', 'Document 1', '2023-12-12 13:38:20', 'Restore'),
(439, 'admin', 'Document 1', '2023-12-12 14:07:20', 'Search'),
(440, 'admin', 'Document 1', '2023-12-12 14:07:38', 'Take'),
(441, 'admin', 'Document 1', '2023-12-12 14:30:01', 'Search'),
(442, 'admin', 'Document 1', '2023-12-12 14:30:26', 'Restore'),
(443, 'admin', 'Dokumen tambahan', '2023-12-12 16:05:02', 'Add Document');

-- --------------------------------------------------------

--
-- Table structure for table `store_history`
--

CREATE TABLE `store_history` (
  `id_store` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `store_keyword` varchar(255) NOT NULL,
  `store_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_history`
--

INSERT INTO `store_history` (`id_store`, `username`, `store_keyword`, `store_time`) VALUES
(1, 'Admin 2', 'Dokumen 12', '2023-05-11 10:06:48'),
(2, 'Admin 2', 'Dokuumen 12', '2023-05-11 10:11:35'),
(4, '2312', 'dokumen 13', '2023-06-16 14:25:20'),
(5, 'admin', '123abc', '2023-09-27 17:29:33'),
(6, 'admin', '321bca', '2023-09-27 17:30:18');

-- --------------------------------------------------------

--
-- Table structure for table `update_history`
--

CREATE TABLE `update_history` (
  `id_update` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `update_time` datetime NOT NULL DEFAULT current_timestamp(),
  `information` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `update_history`
--

INSERT INTO `update_history` (`id_update`, `username`, `update_time`, `information`) VALUES
(97, 'admin', '2023-11-08 09:27:43', 'Login'),
(98, 'admin', '2023-11-08 09:49:01', 'Logout'),
(99, 'admin', '2023-11-08 10:17:19', 'Login'),
(100, 'admin', '2023-11-08 10:18:32', 'Logout'),
(101, 'user', '2023-11-08 10:18:38', 'Login'),
(102, 'user', '2023-11-08 10:19:48', 'Logout'),
(103, 'admin', '2023-11-08 10:20:04', 'Login'),
(104, 'admin', '2023-11-08 11:33:59', 'Logout'),
(105, 'admin', '2023-11-08 11:34:06', 'Login'),
(106, 'admin', '2023-11-08 13:50:20', 'Login'),
(107, 'admin', '2023-11-08 14:57:36', 'Logout'),
(108, 'user', '2023-11-08 14:57:56', 'Login'),
(109, 'admin', '2023-11-08 16:48:04', 'Login'),
(110, 'admin', '2023-11-08 16:55:18', 'Login'),
(111, 'admin', '2023-11-09 09:44:16', 'Login'),
(112, 'admin', '2023-11-09 09:52:08', 'Logout'),
(113, 'user', '2023-11-09 09:54:05', 'Login'),
(114, 'admin', '2023-12-06 03:10:42', 'Login'),
(115, 'admin', '2023-12-06 03:10:45', 'Logout'),
(116, 'admin', '2023-12-06 03:10:48', 'Login'),
(117, 'admin', '2023-12-06 03:12:30', 'Logout'),
(118, 'admin', '2023-12-06 03:13:36', 'Login'),
(119, 'admin', '2023-12-06 03:15:10', 'Logout'),
(120, 'admin', '2023-12-06 03:15:32', 'Login'),
(121, 'admin', '2023-12-06 03:23:25', 'Logout'),
(122, 'admin', '2023-12-06 03:23:29', 'Login'),
(123, 'admin', '2023-12-06 03:28:17', 'Login'),
(124, 'admin', '2023-12-06 03:38:32', 'Logout'),
(125, 'admin', '2023-12-06 03:38:37', 'Login'),
(126, 'admin', '2023-12-06 03:50:54', 'Logout'),
(127, 'admin', '2023-12-06 03:52:48', 'Login'),
(128, 'admin', '2023-12-06 03:54:48', 'Register Account'),
(129, 'admin', '2023-12-06 03:55:07', 'Logout'),
(130, 'admin', '2023-12-06 03:55:27', 'Login'),
(131, 'admin', '2023-12-06 05:13:07', 'Logout'),
(132, 'admin', '2023-12-06 05:14:06', 'Login'),
(133, 'admin', '2023-12-06 15:39:18', 'Logout'),
(134, 'admin', '2023-12-06 15:39:44', 'Login'),
(135, 'admin', '2023-12-06 15:44:01', 'Register Account'),
(136, 'admin', '2023-12-06 15:44:31', 'Update Account'),
(137, 'admin', '2023-12-06 15:44:38', 'Logout'),
(138, 'pengguna1', '2023-12-06 15:44:47', 'Login'),
(139, 'Pengguna1', '2023-12-06 15:45:14', 'Logout'),
(140, 'admin', '2023-12-12 13:35:02', 'Login'),
(141, 'admin', '2023-12-12 14:29:11', 'Logout'),
(142, 'admin', '2023-12-12 14:29:31', 'Login'),
(143, 'admin', '2023-12-12 15:04:29', 'Update Account'),
(144, 'admin', '2023-12-12 15:04:44', 'Update Account'),
(145, 'admin', '2023-12-12 15:31:31', 'Login'),
(146, 'admin', '2023-12-12 16:21:17', 'Update Account'),
(147, 'admin', '2023-12-12 16:44:36', 'Register Account');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_trans`
--
ALTER TABLE `data_trans`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `door_locks`
--
ALTER TABLE `door_locks`
  ADD PRIMARY KEY (`id_loker`);

--
-- Indexes for table `list_dokumen`
--
ALTER TABLE `list_dokumen`
  ADD PRIMARY KEY (`id_dokumen`);

--
-- Indexes for table `register_history`
--
ALTER TABLE `register_history`
  ADD PRIMARY KEY (`id_register`);

--
-- Indexes for table `search_history`
--
ALTER TABLE `search_history`
  ADD PRIMARY KEY (`id_search`);

--
-- Indexes for table `store_history`
--
ALTER TABLE `store_history`
  ADD PRIMARY KEY (`id_store`);

--
-- Indexes for table `update_history`
--
ALTER TABLE `update_history`
  ADD PRIMARY KEY (`id_update`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `data_trans`
--
ALTER TABLE `data_trans`
  MODIFY `id_transaksi` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=379;

--
-- AUTO_INCREMENT for table `door_locks`
--
ALTER TABLE `door_locks`
  MODIFY `id_loker` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `register_history`
--
ALTER TABLE `register_history`
  MODIFY `id_register` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `search_history`
--
ALTER TABLE `search_history`
  MODIFY `id_search` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=444;

--
-- AUTO_INCREMENT for table `store_history`
--
ALTER TABLE `store_history`
  MODIFY `id_store` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `update_history`
--
ALTER TABLE `update_history`
  MODIFY `id_update` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
