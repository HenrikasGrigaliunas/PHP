-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2023 at 10:28 PM
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
-- Database: `spotify`
--

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `songs` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `name`, `user_id`, `songs`, `created_at`) VALUES
(1, 'Geriausios dainos', 2, '', '2023-02-27 13:23:41'),
(2, 'chill', 3, '', '2023-02-28 13:23:41'),
(3, 'Topai', 4, '', '2023-02-25 13:23:41'),
(4, 'Top List', 6, '', '2023-02-24 13:23:41'),
(5, 'Naujausios Dainos', 6, '', '2023-02-28 17:16:34'),
(6, 'Geriausios Dainos', 4, '', '2023-03-05 23:00:43');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `album` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `link` varchar(255) NOT NULL,
  `photo` blob NOT NULL,
  `playlist_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `name`, `author`, `album`, `year`, `link`, `photo`, `playlist_id`, `created_at`) VALUES
(1, 'Flowers', 'Miley Cyrus', 'Album', 2023, 'https://www.youtube.com/watch?v=G7KNmW9a75Y', '', 5, '2023-02-17 13:58:18'),
(3, 'Lift Me Up', 'RIHANNA', 'Lift Me Up', 2023, 'https://www.youtube.com/watch?v=Mx_OexsUI2M', '', 0, '2023-02-25 21:02:49'),
(4, 'Celestial', 'Ed Sheeran', 'Celestial', 2022, 'https://www.youtube.com/watch?v=23g5HBOg3Ic', '', 0, '2023-02-25 21:06:59'),
(5, 'Palauksiu kol užmigsi', 'Monique', 'Palauksiu kol užmigsi', 2022, 'https://www.youtube.com/watch?v=4iRRvN23F08', '', 0, '2023-02-25 21:09:49'),
(6, 'Thousand Lullabies', 'Dynoro', 'Thousand Lullabies', 2023, 'https://www.youtube.com/watch?v=nLOxOYUCkMM', '', 0, '2023-02-25 21:11:53'),
(8, 'Lay Low', 'Tiesto', 'Lay Low', 2023, 'https://www.youtube.com/watch?v=EfWmWlW2PvM', 0x636f7665722e6a7067, 0, '2023-03-05 23:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `songs_playlists`
--

CREATE TABLE `songs_playlists` (
  `id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `songs_playlists`
--

INSERT INTO `songs_playlists` (`id`, `song_id`, `playlist_id`) VALUES
(1, 1, 6),
(2, 3, 6),
(3, 4, 6),
(4, 5, 6),
(5, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `role`, `created_at`) VALUES
(3, 'Henrikas', 'Grigas', 'henrikas@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', 0, '2023-02-15 23:07:47'),
(4, 'Ieva', 'Ievute', 'ieva@mail.com', '1e4d8b1bf55ed46c0e11d0c7a1849b73', 0, '2023-02-15 23:14:59'),
(5, '', '', 'admin@mail.com', '21232f297a57a5a743894a0e4a801fc3', 1, '2023-02-17 12:12:27'),
(6, 'Dainius', 'Petrus', 'dainius@mail.com', '65e49cdb4efa13d956080e109bf39749', 0, '2023-02-25 20:44:05'),
(7, 'Simona', 'Lape', 'simona@mail.com', '3506e1dff0db4e4d78412e2feb7c0a95', 0, '2023-02-25 22:52:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs_playlists`
--
ALTER TABLE `songs_playlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `song_id` (`song_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `songs_playlists`
--
ALTER TABLE `songs_playlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
