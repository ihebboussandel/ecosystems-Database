-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2019 at 05:47 PM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edb_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `institution`
--

CREATE TABLE IF NOT EXISTS `institution` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `location` point NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institution`
--

INSERT INTO `institution` (`id`, `name`, `location`) VALUES
(1, 'INSTM', '\0\0\0\0\0\0\0\0\0\0\0\0\0@мллллл@');

-- --------------------------------------------------------

--
-- Table structure for table `measurement`
--

CREATE TABLE IF NOT EXISTS `measurement` (
  `id` int(11) NOT NULL,
  `temperature` float NOT NULL,
  `salinity` float NOT NULL,
  `oxygenlevel` float NOT NULL,
  `depth` float NOT NULL,
  `tur` float NOT NULL,
  `N_NO2` float NOT NULL,
  `N_NO3` float NOT NULL,
  `N_NH4` float NOT NULL,
  `N_NT` float NOT NULL,
  `P_PT` float NOT NULL,
  `chla` float NOT NULL,
  `P_PO4` float DEFAULT NULL,
  `date` timestamp NOT NULL,
  `station_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `measurement`
--

INSERT INTO `measurement` (`id`, `temperature`, `salinity`, `oxygenlevel`, `depth`, `tur`, `N_NO2`, `N_NO3`, `N_NH4`, `N_NT`, `P_PT`, `chla`, `P_PO4`, `date`, `station_id`) VALUES
(1, 23.4, 39.5, 7.5, 40, 7, 0.6, 7.2, 2, 17.6, 3.2, 6.8, NULL, '2016-08-31 23:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `measurement_owner`
--

CREATE TABLE IF NOT EXISTS `measurement_owner` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `measurement_id` int(11) NOT NULL,
  `station_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `measurement_owner`
--

INSERT INTO `measurement_owner` (`id`, `owner_id`, `measurement_id`, `station_id`) VALUES
(1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `m_region`
--

CREATE TABLE IF NOT EXISTS `m_region` (
  `id` int(11) NOT NULL,
  `lat` float NOT NULL,
  `lon` float NOT NULL,
  `mesure_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_region`
--

INSERT INTO `m_region` (`id`, `lat`, `lon`, `mesure_id`) VALUES
(2, 37.164, 9.7535, 1);

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE IF NOT EXISTS `station` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `insertion_date` timestamp NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`id`, `name`, `owner_id`, `insertion_date`) VALUES
(1, 's1', 1, '2019-07-07 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `aftername` varchar(20) NOT NULL,
  `age` date NOT NULL,
  `phone` int(11) NOT NULL,
  `region` varchar(20) NOT NULL,
  `sex` varchar(5) NOT NULL,
  `institution_id` int(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `account_creation` timestamp NOT NULL,
  `password` varchar(50) NOT NULL,
  `last_login` timestamp NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `aftername`, `age`, `phone`, `region`, `sex`, `institution_id`, `email`, `account_creation`, `password`, `last_login`, `type`) VALUES
(1, 'Bechir', 'Bjaoui', '2019-07-08', 2669324, 'Tunis', 'male', 1, 'user@domain.com', '0000-00-00 00:00:00', '123', '0000-00-00 00:00:00', 'admin'),
(2, 'iheb', '', '0000-00-00', 0, '', '0', 1, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `users`
--
CREATE TABLE IF NOT EXISTS `users` (
);

-- --------------------------------------------------------

--
-- Structure for view `users`
--
DROP TABLE IF EXISTS `users`;
-- in use(#1356 - View 'edb_database.users' references invalid table(s) or column(s) or function(s) or definer/invoker of view lack rights to use them)

--
-- Indexes for dumped tables
--

--
-- Indexes for table `institution`
--
ALTER TABLE `institution`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `measurement`
--
ALTER TABLE `measurement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `station_id` (`station_id`);

--
-- Indexes for table `measurement_owner`
--
ALTER TABLE `measurement_owner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `measurement_id` (`measurement_id`),
  ADD KEY `station_id` (`station_id`);

--
-- Indexes for table `m_region`
--
ALTER TABLE `m_region`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`mesure_id`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_id` (`institution_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `institution`
--
ALTER TABLE `institution`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `measurement`
--
ALTER TABLE `measurement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `measurement_owner`
--
ALTER TABLE `measurement_owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_region`
--
ALTER TABLE `m_region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `station`
--
ALTER TABLE `station`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `measurement`
--
ALTER TABLE `measurement`
  ADD CONSTRAINT `measurement_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `station` (`id`);

--
-- Constraints for table `measurement_owner`
--
ALTER TABLE `measurement_owner`
  ADD CONSTRAINT `measurement_owner_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `measurement_owner_ibfk_2` FOREIGN KEY (`measurement_id`) REFERENCES `measurement` (`id`);

--
-- Constraints for table `m_region`
--
ALTER TABLE `m_region`
  ADD CONSTRAINT `m_region_ibfk_1` FOREIGN KEY (`mesure_id`) REFERENCES `measurement` (`id`);

--
-- Constraints for table `station`
--
ALTER TABLE `station`
  ADD CONSTRAINT `station_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
