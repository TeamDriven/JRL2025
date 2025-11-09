-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 09, 2025 at 04:50 AM
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
-- Database: `jrl2025`
--

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `match_num` int(11) DEFAULT NULL,
  `red_foul` int(11) DEFAULT 0,
  `red_tech_foul` int(11) DEFAULT 0,
  `blue_foul` int(11) DEFAULT 0,
  `blue_tech_foul` int(11) DEFAULT 0,
  `red1` int(11) DEFAULT 0,
  `red2` int(11) DEFAULT 0,
  `red3` int(11) DEFAULT 0,
  `blue1` int(11) DEFAULT NULL,
  `blue2` int(11) DEFAULT NULL,
  `blue3` int(11) DEFAULT NULL,
  `score_lock` int(11) DEFAULT 0,
  `played` int(11) DEFAULT 0,
  `red_auto_mob` int(11) DEFAULT 0,
  `blue_auto_mob` int(11) DEFAULT 0,
  `blue_auto_diamond_ref` int(11) DEFAULT 0,
  `red_auto_diamond_ref` int(11) DEFAULT 0,
  `blue_auto_ore_ref` int(11) DEFAULT 0,
  `red_auto_ore_ref` int(11) DEFAULT 0,
  `blue_auto_diamond_depo` int(11) DEFAULT 0,
  `red_auto_diamond_depo` int(11) DEFAULT 0,
  `blue_auto_ore_depo` int(11) DEFAULT 0,
  `red_auto_ore_depo` int(11) DEFAULT 0,
  `blue_tele_diamond_depo` int(11) DEFAULT 0,
  `red_tele_diamond_depo` int(11) DEFAULT 0,
  `blue_tele_ore_depo` int(11) DEFAULT 0,
  `red_tele_ore_depo` int(11) DEFAULT 0,
  `blue_tele_diamond_ref` int(11) DEFAULT 0,
  `red_tele_diamond_ref` int(11) DEFAULT 0,
  `blue_tele_ore_ref` int(11) DEFAULT 0,
  `red_tele_ore_ref` int(11) DEFAULT 0,
  `blue_endgame_park` int(11) DEFAULT 0,
  `red_endgame_park` int(11) DEFAULT 0,
  `blue_endgame_climb` int(11) DEFAULT 0,
  `red_endgame_climb` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`match_num`, `red_foul`, `red_tech_foul`, `blue_foul`, `blue_tech_foul`, `red1`, `red2`, `red3`, `blue1`, `blue2`, `blue3`, `score_lock`, `played`, `red_auto_mob`, `blue_auto_mob`, `blue_auto_diamond_ref`, `red_auto_diamond_ref`, `blue_auto_ore_ref`, `red_auto_ore_ref`, `blue_auto_diamond_depo`, `red_auto_diamond_depo`, `blue_auto_ore_depo`, `red_auto_ore_depo`, `blue_tele_diamond_depo`, `red_tele_diamond_depo`, `blue_tele_ore_depo`, `red_tele_ore_depo`, `blue_tele_diamond_ref`, `red_tele_diamond_ref`, `blue_tele_ore_ref`, `red_tele_ore_ref`, `blue_endgame_park`, `red_endgame_park`, `blue_endgame_climb`, `red_endgame_climb`) VALUES
(3, 0, 0, 0, 0, 21, 17, 30, 3, 12, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 0, 0, 0, 0, 26, 10, 33, 20, 13, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 0, 0, 0, 0, 23, 24, 2, 11, 4, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 0, 0, 0, 0, 6, 19, 1, 22, 29, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 0, 1, 1, 0, 7, 36, 25, 28, 27, 31, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 1, 1, 0, 0, 8, 34, 32, 14, 9, 16, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1),
(8, 0, 0, 0, 0, 31, 10, 21, 36, 33, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 0, 0, 0, 0, 12, 1, 9, 25, 6, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 0, 0, 0, 0, 8, 28, 3, 14, 16, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 0, 0, 0, 0, 26, 19, 29, 20, 32, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 0, 0, 0, 0, 24, 18, 4, 34, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 0, 0, 0, 0, 5, 23, 7, 30, 13, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 0, 0, 0, 0, 31, 4, 26, 12, 21, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 0, 0, 0, 0, 30, 15, 18, 36, 3, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 0, 0, 0, 0, 27, 29, 20, 28, 22, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 0, 0, 0, 0, 9, 17, 14, 5, 33, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 0, 0, 0, 0, 34, 6, 8, 13, 7, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 0, 0, 0, 0, 35, 32, 10, 19, 24, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 0, 0, 0, 0, 15, 3, 31, 27, 29, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 0, 0, 0, 0, 4, 26, 11, 30, 36, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 0, 0, 0, 0, 14, 35, 2, 20, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 0, 0, 0, 0, 12, 16, 10, 22, 9, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 0, 0, 0, 0, 24, 28, 7, 17, 18, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 0, 0, 0, 0, 19, 33, 34, 8, 13, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 0, 0, 0, 0, 26, 35, 12, 3, 30, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 0, 0, 0, 0, 6, 13, 1, 36, 23, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 0, 0, 0, 0, 8, 4, 33, 31, 28, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 0, 0, 0, 0, 19, 22, 7, 2, 32, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(26, 0, 0, 0, 0, 14, 21, 10, 15, 11, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 0, 0, 0, 0, 34, 24, 9, 18, 20, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(32, 0, 0, 0, 0, 23, 27, 20, 31, 34, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(33, 0, 0, 0, 0, 1, 29, 19, 32, 30, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(35, 0, 0, 0, 0, 4, 2, 24, 6, 33, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(36, 0, 0, 0, 0, 11, 28, 8, 35, 13, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 0, 0, 0, 0, 36, 10, 12, 14, 16, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34, 0, 0, 0, 0, 26, 9, 22, 5, 25, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(41, 0, 0, 0, 0, 28, 33, 4, 30, 8, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(38, 0, 0, 0, 0, 10, 7, 29, 21, 34, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(40, 0, 0, 0, 0, 15, 12, 19, 20, 5, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(37, 0, 0, 0, 0, 22, 32, 26, 36, 27, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(39, 0, 0, 0, 0, 3, 13, 17, 35, 24, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(42, 0, 0, 0, 0, 6, 23, 2, 9, 11, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(46, 0, 0, 0, 0, 9, 18, 4, 27, 23, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(43, 0, 0, 0, 0, 32, 36, 25, 10, 20, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(45, 0, 0, 0, 0, 24, 21, 8, 17, 2, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(44, 0, 0, 0, 0, 28, 35, 13, 7, 16, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(47, 0, 0, 0, 0, 19, 15, 29, 30, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(48, 0, 0, 0, 0, 14, 34, 11, 22, 6, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49, 0, 0, 0, 0, 27, 32, 12, 3, 7, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(51, 0, 0, 0, 0, 1, 36, 6, 9, 23, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(50, 0, 0, 0, 0, 24, 18, 33, 35, 4, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(52, 0, 0, 0, 0, 5, 29, 20, 26, 14, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(53, 0, 0, 0, 0, 15, 10, 21, 34, 19, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54, 0, 0, 0, 0, 13, 31, 25, 8, 11, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `match_time` int(11) DEFAULT NULL,
  `match_num` int(11) DEFAULT NULL,
  `red_score` int(11) DEFAULT NULL,
  `blue_score` int(11) DEFAULT NULL,
  `red1` tinyint(4) DEFAULT NULL,
  `red2` tinyint(4) DEFAULT NULL,
  `red3` tinyint(4) DEFAULT NULL,
  `blue1` tinyint(4) DEFAULT NULL,
  `blue2` tinyint(4) DEFAULT NULL,
  `blue3` tinyint(4) DEFAULT NULL,
  `red_auto_score` int(11) DEFAULT NULL,
  `red_tele_score` int(11) DEFAULT NULL,
  `red_endgame_score` int(11) DEFAULT NULL,
  `blue_auto_score` int(11) DEFAULT NULL,
  `blue_tele_score` int(11) DEFAULT NULL,
  `blue_endgame_score` int(11) DEFAULT NULL,
  `display_state` int(11) DEFAULT NULL,
  `ranking_page_state` int(11) DEFAULT NULL,
  `score_lock` int(11) DEFAULT 0,
  `blue_confirm` int(11) DEFAULT NULL,
  `red_confirm` int(11) DEFAULT NULL,
  `red_penalties` int(11) DEFAULT NULL,
  `blue_penalties` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`match_time`, `match_num`, `red_score`, `blue_score`, `red1`, `red2`, `red3`, `blue1`, `blue2`, `blue3`, `red_auto_score`, `red_tele_score`, `red_endgame_score`, `blue_auto_score`, `blue_tele_score`, `blue_endgame_score`, `display_state`, `ranking_page_state`, `score_lock`, `blue_confirm`, `red_confirm`, `red_penalties`, `blue_penalties`) VALUES
(140, 2, 5, 15, 7, 36, 25, 28, 27, 31, 0, 0, 0, 0, 0, 0, 1, NULL, 0, 1, 0, 15, 5);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `team_num` int(4) NOT NULL,
  `team_name` text NOT NULL,
  `matches_played` int(11) DEFAULT 0,
  `qualification_score` int(11) DEFAULT 0,
  `endgame_score` int(11) DEFAULT 0,
  `auto_score` int(11) DEFAULT 0,
  `tele_score` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`team_num`, `team_name`, `matches_played`, `qualification_score`, `endgame_score`, `auto_score`, `tele_score`) VALUES
(5, 'Team 5', 0, 0, 0, 0, 0),
(1, 'Team 1', 0, 0, 0, 0, 0),
(2, 'Team 2', 0, 0, 0, 0, 0),
(6, 'Team 6', 0, 0, 0, 0, 0),
(3, 'Team 3', 0, 0, 0, 0, 0),
(4, 'Team 4', 0, 0, 0, 0, 0),
(8, 'Team 8', 1, 2, 22, 36, 21),
(10, 'Team 10', 0, 0, 0, 0, 0),
(7, 'Team 7', 1, 0, 0, 0, 0),
(9, 'Team 9', 1, 0, 0, 16, 0),
(11, 'Team 11', 0, 0, 0, 0, 0),
(12, 'Team 12', 0, 0, 0, 0, 0),
(15, 'Team 15', 0, 0, 0, 0, 0),
(14, 'Team 14', 1, 0, 0, 16, 0),
(13, 'Team 13', 0, 0, 0, 0, 0),
(16, 'Team 16', 1, 0, 0, 16, 0),
(19, 'Team 19', 0, 0, 0, 0, 0),
(17, 'Team 17', 0, 0, 0, 0, 0),
(18, 'Team 18', 0, 0, 0, 0, 0),
(20, 'Team 20', 0, 0, 0, 0, 0),
(22, 'Team 22', 0, 0, 0, 0, 0),
(21, 'Team 21', 0, 0, 0, 0, 0),
(24, 'Team 24', 0, 0, 0, 0, 0),
(23, 'Team 23', 0, 0, 0, 0, 0),
(26, 'Team 26', 0, 0, 0, 0, 0),
(25, 'Team 25', 1, 0, 0, 0, 0),
(28, 'Team 28', 1, 2, 0, 0, 0),
(27, 'Team 27', 1, 2, 0, 0, 0),
(29, 'Team 29', 0, 0, 0, 0, 0),
(31, 'Team 31', 1, 2, 0, 0, 0),
(30, 'Team 30', 0, 0, 0, 0, 0),
(32, 'Team 32', 1, 2, 22, 36, 21),
(33, 'Team 33', 0, 0, 0, 0, 0),
(35, 'Team 35', 0, 0, 0, 0, 0),
(34, 'Team 34', 1, 2, 22, 36, 21),
(36, 'Team 36', 1, 0, 0, 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
