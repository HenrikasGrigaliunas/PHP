-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2023 at 10:29 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `youtube`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`) VALUES
(1, 'Trending', '2023-03-12 22:48:22'),
(2, 'Movies', '2023-03-12 22:48:33'),
(3, 'Music', '2023-03-12 22:54:09'),
(4, 'Sports', '2023-03-12 22:55:00'),
(5, 'Gaming', '2023-03-12 22:55:58'),
(6, 'Cars', '2023-03-15 23:58:02'),
(7, 'Travel', '2023-03-17 21:29:24');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `video_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_name`, `video_id`, `comment`, `created_at`) VALUES
(1, 'rockstar', 1, 'crazy', '2023-03-18 00:27:45'),
(2, 'marcius', 8, 'The best Chillout Music', '2023-03-18 22:48:38'),
(3, 'gerdux', 9, 'Beautiful', '2023-03-18 22:56:44'),
(4, 'henrix', 10, 'TopCar', '2023-03-18 23:02:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `email`, `password`, `created_at`) VALUES
(1, 'henrix', 'henrikas@mail.com', '2e19386b703f7004a28c5c972f274674', '2023-03-13 20:34:31'),
(2, 'marcius', 'martynas@mail.com', 'd790656f303ce8ad5eb9a4a9a7b0afd5', '2023-03-13 20:38:00'),
(3, 'pieva', 'ieva@mail.com', 'f41b569412ef7581cb80f0b3b61c5fef', '2023-03-13 20:39:35'),
(4, 'rockstar', 'rokas@mail.com', 'b7433696216f6f2e16999f908ff9234e', '2023-03-15 21:51:45'),
(5, 'test', 'test@mail.com', '098f6bcd4621d373cade4e832627b4f6', '2023-03-17 19:27:24'),
(6, 'gerdux', 'gerda@mail.com', 'd629de2ecfc6d6640872b938ec187716', '2023-03-18 20:51:45');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `thumbnail_url` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `name`, `video_url`, `thumbnail_url`, `category_id`, `created_at`) VALUES
(1, 'CRAZY CONCEPTS THAT WILL BLOW YOUR MIND', 'https://www.youtube.com/embed/G0xtoJb6GgU', 'https://img.youtube.com/vi/G0xtoJb6GgU/maxresdefault.jpg', 1, '2023-03-07 10:42:56'),
(3, 'Avatar: The Way of Water | Official Trailer', 'https://www.youtube.com/embed/d9MyW72ELq0', 'https://img.youtube.com/vi/d9MyW72ELq0/maxresdefault.jpg', 2, '2023-03-07 20:37:04'),
(4, 'Chillout Lounge - Calm & Relaxing Background Music', 'https://www.youtube.com/embed/9UMxZofMNbA', 'https://img.youtube.com/vi/9UMxZofMNbA/maxresdefault.jpg', 3, '2023-03-07 20:37:06'),
(5, 'K.Maksvytis: apie dvikovą su „Olympiacos“ ir jų lyderius', 'https://www.youtube.com/embed/Lu8aVWKPzpo', 'https://img.youtube.com/vi/Lu8aVWKPzpo/maxresdefault.jpg', 4, '2023-03-15 23:04:19'),
(6, 'Official Minecraft Trailer', 'https://www.youtube.com/embed/MmB9b5njVbA', 'https://img.youtube.com/vi/MmB9b5njVbA/maxresdefault.jpg', 5, '2023-03-15 23:35:02'),
(8, 'The Very Best Of Enigma 90s Cynosure Chillout Music Mix 2023', 'https://www.youtube.com/embed/1ulwMq8sdh4', 'https://img.youtube.com/vi/1ulwMq8sdh4/maxresdefault.jpg', 3, '2023-03-18 22:47:04'),
(9, '23 Most Beautiful Caribbean Islands', 'https://www.youtube.com/embed/hRpxiDCZj8E', 'https://img.youtube.com/vi/hRpxiDCZj8E/maxresdefault.jpg', 7, '2023-03-18 22:55:07'),
(10, '2023 Porsche 911 Turbo S - Full Black/Blue Carbon 911 by TopCar Design', 'https://www.youtube.com/embed/GXwaQIZJkp8', 'https://img.youtube.com/vi/GXwaQIZJkp8/maxresdefault.jpg', 6, '2023-03-18 23:01:49'),
(11, 'Zalgiris Kaunas vs Olympiacos Piraeus | Full Match Highlights | EuroLeague Season 2022-23', 'https://www.youtube.com/embed/OrZ94015cv0', 'https://img.youtube.com/vi/OrZ94015cv0/maxresdefault.jpg', 4, '2023-03-18 23:17:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Video category` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `Video category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
