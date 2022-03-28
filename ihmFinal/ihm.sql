-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2022 at 08:58 PM
-- Server version: 8.0.25
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ihm`
--

-- --------------------------------------------------------

--
-- Table structure for table `bought_nft`
--

CREATE TABLE `bought_nft` (
  `id_user` int NOT NULL,
  `id_nft` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'art'),
(2, 'photo'),
(3, 'music'),
(4, 'sport');

-- --------------------------------------------------------

--
-- Table structure for table `chain`
--

CREATE TABLE `chain` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chain`
--

INSERT INTO `chain` (`id`, `name`) VALUES
(1, 'ethereum'),
(2, 'bitcoin');

-- --------------------------------------------------------

--
-- Table structure for table `liked_nft`
--

CREATE TABLE `liked_nft` (
  `id_user` int NOT NULL,
  `id_nft` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nft`
--

CREATE TABLE `nft` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `quantity` int NOT NULL,
  `likes` int NOT NULL,
  `id_user` int NOT NULL,
  `id_category` int NOT NULL,
  `id_chain` int NOT NULL,
  `dir_nft` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nft`
--

INSERT INTO `nft` (`id`, `name`, `description`, `price`, `quantity`, `likes`, `id_user`, `id_category`, `id_chain`, `dir_nft`) VALUES
(14, 'Matoub', 'Matoub Lounes', 4.4, 5, 0, 4, 3, 1, '623f51f870764-1648316920.jpg'),
(15, 'Monkey', 'I am a monkey NFT', 1, 3, 0, 4, 1, 2, '623f52f524f4d-1648317173.jpg'),
(16, 'NBA', 'NBA player', 2, 4, 0, 4, 4, 1, '623f53bbbdde3-1648317371.jpg'),
(18, 'Mahrez', 'algerian football player', 4, 1, 0, 4, 4, 1, '623f5585b1c27-1648317829.jpg'),
(19, 'JSK', 'IMAZIGHEN', 10, 5, 0, 5, 4, 2, '623f584b7d326-1648318539.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(4, 'Abdou', 'abderrahmanebenaissa740@gmail.com', '94fc29f07032172379ed6d29109f5b6a'),
(5, 'hakim', 'hakimghernaout4@gmail.com', '94fc29f07032172379ed6d29109f5b6a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bought_nft`
--
ALTER TABLE `bought_nft`
  ADD PRIMARY KEY (`id_user`,`id_nft`),
  ADD KEY `id_nft` (`id_nft`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chain`
--
ALTER TABLE `chain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `liked_nft`
--
ALTER TABLE `liked_nft`
  ADD PRIMARY KEY (`id_user`,`id_nft`),
  ADD KEY `id_nft` (`id_nft`);

--
-- Indexes for table `nft`
--
ALTER TABLE `nft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_chain` (`id_chain`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chain`
--
ALTER TABLE `chain`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nft`
--
ALTER TABLE `nft`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bought_nft`
--
ALTER TABLE `bought_nft`
  ADD CONSTRAINT `bought_nft_ibfk_1` FOREIGN KEY (`id_nft`) REFERENCES `nft` (`id`),
  ADD CONSTRAINT `bought_nft_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `liked_nft`
--
ALTER TABLE `liked_nft`
  ADD CONSTRAINT `liked_nft_ibfk_1` FOREIGN KEY (`id_nft`) REFERENCES `nft` (`id`),
  ADD CONSTRAINT `liked_nft_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `nft`
--
ALTER TABLE `nft`
  ADD CONSTRAINT `nft_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `nft_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `nft_ibfk_3` FOREIGN KEY (`id_chain`) REFERENCES `chain` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
