-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 26, 2021 at 04:05 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vote`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidats`
--

DROP TABLE IF EXISTS `candidats`;
CREATE TABLE IF NOT EXISTS `candidats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidat` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `candidats`
--

INSERT INTO `candidats` (`id`, `candidat`) VALUES
(1, 'Benhamidou Salma'),
(2, 'Boulanouar Mohamed'),
(3, 'Karkbane Dounia');

-- --------------------------------------------------------

--
-- Table structure for table `comanager`
--

DROP TABLE IF EXISTS `comanager`;
CREATE TABLE IF NOT EXISTS `comanager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comanager`
--

INSERT INTO `comanager` (`id`, `email`, `password`) VALUES
(1, 'centrecomptage.app@gmail.com', 'comptage123');

-- --------------------------------------------------------

--
-- Table structure for table `covotant`
--

DROP TABLE IF EXISTS `covotant`;
CREATE TABLE IF NOT EXISTS `covotant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `datenaissance` varchar(100) NOT NULL,
  `iden` varchar(1000) NOT NULL,
  `bulltinvote` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `covotant`
--

INSERT INTO `covotant` (`id`, `nom`, `prenom`, `datenaissance`, `iden`, `bulltinvote`) VALUES
(3, 'laachiri', 'anas', '1999-07-17', 'A1234\n', '-----BEGIN PGP MESSAGE-----\nVersion: Didisoft OpenPGP Library for Java 3.2\n\nhQEMA4h88jFSvqEHAQgAhG51isQnWRh1oRqjz9+JA+wbv3QN+62u6eokd03WhvQE\nVuqWBcbcTZMnoYIpau2ahdBjvykLiXeQmxw+fmO0ysEd4CquOc9Cxk0uL4Qr1pb/\nAgAtFG+fyKfpzfyRKnDWq46lOVkuHZbUR5s10bJsMCuHN5kOfvA5rl1FyANOYH2E\ntrFx1hbZpdFf9sHtY0zfNYuFvO+dz/pNPNPsG6fX6UyWGpmkGdOw6azHBkHaGmZ3\nlMGHjrQefSzUvXlkbyllaUjlCmugiBcERFRpu6X800mklMjBYkpVCxMWFq7/JagN\nRUYba/HgYtF+6g5iomEIzfSC9ZGmDGpuG8nYKFH0sdJXATa6wD26LFTYegpiJkbs\nQSkYY2OJALl/Yt2L2v0QcYiPV4DZx7QtPyBIfc/mtqwNIa0lBvJuCwqGEL9B1E0D\naA5FuuA9daE+Fpw2yEMMggvt2cR1o5ef\n=cZ2X\n-----END PGP MESSAGE-----\n'),
(4, 'oukrid', 'mouna', '1998-05-28', 'B1234\n', '-----BEGIN PGP MESSAGE-----\nVersion: Didisoft OpenPGP Library for Java 3.2\n\nhQEMA4h88jFSvqEHAQf7BcY21mdVUJ7GY2MBpvHJM8BFmBuBSCtEMGy4T9yBG3Xe\nLB9qstYCTVCH4SljDEK4MmIk8rq4uXR4AaIYH4L+qTm+oggjm6gljUIZ9eMH57Lj\nqzjeDjMEt4cALoIGINmRLFOn2Wn7v0qxgIf+X0lOoCEqlopku59D4S0MG0F0ZCBd\noX+XpPq2+pY7rO+V6h/Qa3UgRL+y6lgGwgk/ux2Jq5lhjvvcboATIAKCqW3qKGkI\nIb1aRriVPRt45O+eeD+3NqAHoXFF+uj2PeeaUdrDUXZTmqeU1IN0J1ZeNmu0mngJ\nmJRugHnDiJr95QdGQ1JuLUVmyyiAeF1Z87HezL2QOtJZAR3DEM6FA9/SL+248edB\n3kJzdfOM7tuTLwsM9Et3HNBC3rmhQTZC8JtfnpEE+Mac3wqTNx3x4IfU4IawNbj2\nTwJ6quAykI2ehuJrK/hztw8GpMc/y/mBJ6o=\n=/8wQ\n-----END PGP MESSAGE-----\n'),
(5, 'alaoui', 'driss', '1998-06-14', 'D1234\n', '-----BEGIN PGP MESSAGE-----\nVersion: Didisoft OpenPGP Library for Java 3.2\n\nhQEMA4h88jFSvqEHAQgAotxWV9hFbCoNsL8mnxtTa/Gb83b0JdfBXy4Tvee+VTFh\nXElkz85F+1jnOYTqqxwRfLffK85TQu7LXfkgTbEZrcH4NEbsFvBLf/M9c3tuqx1C\n+GaQd9KUAbj9nUbblQ6YSTknrYuQqUCEi2W4czEid7l+RCebJHZJhhJr5c6asFDC\nttUMoUHdMZrF9O7ktzQXaOnqwjOEw04sYQiQ1sA3SZ0W0I4z5LoxQb2WBB1XDLkH\nX3KgpTWZb9tVRmXc1Y3q/O9pNea8j7AFTB1zQI1Olj/ZHWuczftre+2K6mT8+PO8\nt26yiWg258zmVRUMqoLADQo+2xbomb9maRiZh69PYtJWAWAM81TcH4ku844B+zcA\nu5wLsl8bA71jurfgllI1sVlaGwpKAa3K7SFeab4HK65ESdYOlLSUt7ck3TiCm1YX\nJNAoqj/UNrd9yh4i7UYARNoPrBbwdjA=\n=Wqjy\n-----END PGP MESSAGE-----\n');

-- --------------------------------------------------------

--
-- Table structure for table `demanager`
--

DROP TABLE IF EXISTS `demanager`;
CREATE TABLE IF NOT EXISTS `demanager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `demanager`
--

INSERT INTO `demanager` (`id`, `email`, `password`) VALUES
(1, 'centredepouillement@gmail.com', 'depouillement123');

-- --------------------------------------------------------

--
-- Table structure for table `devotant`
--

DROP TABLE IF EXISTS `devotant`;
CREATE TABLE IF NOT EXISTS `devotant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iden` varchar(1000) NOT NULL,
  `bulltinvote` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `devotant`
--

INSERT INTO `devotant` (`id`, `iden`, `bulltinvote`) VALUES
(2, 'A1234', 'Benhamidou Salma\n'),
(3, 'B1234', 'Boulanouar Mohamed\n'),
(4, 'D1234', 'Karkbane Dounia\n');

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `datenaissance` varchar(100) NOT NULL,
  `iden` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employe`
--

INSERT INTO `employe` (`id`, `nom`, `prenom`, `datenaissance`, `iden`) VALUES
(1, 'laachiri', 'anas', '1999-07-17', 'A1234'),
(2, 'oukrid', 'mouna', '1998-05-28', 'B1234'),
(3, 'boussaid', 'badr', '1999-04-14', 'C1234'),
(4, 'alaoui', 'driss', '1998-06-14', 'D1234'),
(5, 'loutfi', 'ayoub', '1994-03-14', 'E1234'),
(6, 'mastas', 'nissrine', '1999-08-12', 'F1234'),
(7, 'fikri', 'ismail', '1998-02-17', 'G1234'),
(8, 'zahi', 'fath', '1996-05-29', 'H1234'),
(9, 'idichou', 'ikhlas', '1998-04-16', 'I1234'),
(10, 'abir', 'salma', '1994-03-16', 'J1234');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
