-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 09, 2025 at 03:22 AM
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
(2, 0, 0, 0, 0, 29, 8, 28, 2, 26, 33, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 0, 0, 1, 1, 21, 25, 22, 13, 19, 27, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0),
(6, 0, 0, 0, 0, 5, 24, 30, 6, 12, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 0, 0, 0, 0, 16, 14, 15, 3, 18, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 0, 0, 0, 0, 17, 1, 11, 20, 9, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 0, 0, 0, 0, 7, 34, 35, 10, 32, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 0, 0, 0, 0, 2, 9, 10, 19, 22, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 0, 0, 0, 0, 29, 25, 34, 35, 3, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 0, 0, 0, 0, 6, 20, 30, 28, 5, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 0, 0, 0, 0, 27, 31, 15, 1, 26, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 0, 0, 0, 0, 18, 4, 21, 36, 32, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 0, 0, 0, 0, 12, 13, 23, 7, 24, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 0, 0, 0, 0, 35, 25, 1, 11, 31, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 0, 0, 0, 0, 27, 18, 6, 20, 29, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 0, 0, 0, 0, 33, 26, 10, 5, 23, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 0, 0, 0, 0, 9, 13, 36, 22, 17, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 0, 0, 0, 0, 12, 7, 3, 19, 30, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 0, 0, 0, 0, 15, 28, 8, 34, 4, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 0, 0, 0, 0, 36, 25, 19, 3, 35, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 0, 0, 0, 0, 30, 27, 14, 10, 7, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 0, 0, 0, 0, 26, 8, 11, 22, 28, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 0, 0, 0, 0, 20, 5, 21, 24, 32, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 0, 0, 0, 0, 4, 29, 13, 18, 33, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 0, 0, 0, 0, 23, 17, 15, 12, 9, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(26, 0, 0, 0, 0, 11, 31, 4, 10, 26, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 0, 0, 0, 0, 21, 5, 35, 24, 25, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 0, 0, 0, 0, 30, 12, 7, 13, 29, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 0, 0, 0, 0, 3, 33, 19, 34, 17, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 0, 0, 0, 0, 14, 9, 6, 15, 23, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(33, 0, 0, 0, 0, 8, 18, 9, 31, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 0, 0, 0, 0, 20, 2, 22, 32, 18, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 0, 0, 0, 0, 16, 26, 28, 4, 13, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(32, 0, 0, 0, 0, 12, 23, 34, 21, 25, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(35, 0, 0, 0, 0, 20, 17, 27, 35, 15, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34, 0, 0, 0, 0, 32, 10, 14, 11, 6, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(37, 0, 0, 0, 0, 34, 10, 12, 28, 25, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(36, 0, 0, 0, 0, 1, 36, 24, 33, 30, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(39, 0, 0, 0, 0, 30, 33, 11, 36, 13, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(38, 0, 0, 0, 0, 23, 2, 29, 22, 18, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(40, 0, 0, 0, 0, 4, 15, 8, 3, 16, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(41, 0, 0, 0, 0, 1, 6, 27, 35, 5, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(42, 0, 0, 0, 0, 19, 7, 9, 20, 31, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(45, 0, 0, 0, 0, 22, 26, 11, 5, 24, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(44, 0, 0, 0, 0, 32, 15, 30, 6, 35, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(43, 0, 0, 0, 0, 16, 25, 36, 8, 10, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(48, 0, 0, 0, 0, 33, 28, 2, 18, 17, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(47, 0, 0, 0, 0, 7, 21, 34, 9, 14, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(46, 0, 0, 0, 0, 20, 31, 27, 1, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49, 0, 0, 0, 0, 16, 25, 23, 31, 13, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(51, 0, 0, 0, 0, 34, 2, 17, 3, 36, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(50, 0, 0, 0, 0, 26, 21, 11, 15, 1, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(52, 0, 0, 0, 0, 29, 33, 8, 35, 12, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(53, 0, 0, 0, 0, 22, 4, 10, 24, 18, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54, 0, 0, 0, 0, 30, 20, 5, 19, 28, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

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
(140, 2, 0, 0, 29, 8, 28, 2, 26, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL);

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
(1, 'Team 1', 0, 0, 0, 0, 0),
(3, 'Team 3', 0, 0, 0, 0, 0),
(2, 'Team 2', 1, 0, 0, 0, 0),
(6, 'Team 6', 0, 0, 0, 0, 0),
(5, 'Team 5', 0, 0, 0, 0, 0),
(4, 'Team 4', 0, 0, 0, 0, 0),
(9, 'Team 9', 0, 0, 0, 0, 0),
(10, 'Team 10', 0, 0, 0, 0, 0),
(7, 'Team 7', 0, 0, 0, 0, 0),
(8, 'Team 8', 1, 2, 0, 7, 5),
(11, 'Team 11', 0, 0, 0, 0, 0),
(12, 'Team 12', 0, 0, 0, 0, 0),
(16, 'Team 16', 0, 0, 0, 0, 0),
(14, 'Team 14', 0, 0, 0, 0, 0),
(13, 'Team 13', 2, 4, 44, 72, 42),
(17, 'Team 17', 0, 0, 0, 0, 0),
(15, 'Team 15', 0, 0, 0, 0, 0),
(18, 'Team 18', 0, 0, 0, 0, 0),
(20, 'Team 20', 0, 0, 0, 0, 0),
(19, 'Team 19', 2, 4, 44, 72, 42),
(23, 'Team 23', 0, 0, 0, 0, 0),
(22, 'Team 22', 2, 0, 0, 0, 0),
(21, 'Team 21', 2, 0, 0, 0, 0),
(24, 'Team 24', 0, 0, 0, 0, 0),
(25, 'Team 25', 2, 0, 0, 0, 0),
(26, 'Team 26', 1, 0, 0, 0, 0),
(28, 'Team 28', 1, 2, 0, 7, 5),
(29, 'Team 29', 1, 2, 0, 7, 5),
(27, 'Team 27', 2, 4, 44, 72, 42),
(34, 'Team 34', 0, 0, 0, 0, 0),
(33, 'Team 33', 1, 0, 0, 0, 0),
(30, 'Team 30', 0, 0, 0, 0, 0),
(32, 'Team 32', 0, 0, 0, 0, 0),
(31, 'Team 31', 0, 0, 0, 0, 0),
(35, 'Team 35', 0, 0, 0, 0, 0),
(36, 'Team 36', 0, 0, 0, 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
