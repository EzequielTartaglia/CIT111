CREATE DATABASE  IF NOT EXISTS `v_art` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `v_art`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: v_art
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `artist_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `mname` varchar(20) DEFAULT NULL,
  `lname` varchar(25) NOT NULL,
  `dob` int NOT NULL,
  `dod` int DEFAULT NULL,
  `country` varchar(25) NOT NULL,
  `local` enum('y','n') DEFAULT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10989990 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `artwork`
--

DROP TABLE IF EXISTS `artwork`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artwork` (
  `artwork_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `artyear` int NOT NULL,
  `period` varchar(25) DEFAULT NULL,
  `artdescription` varchar(200) DEFAULT NULL,
  `arttype` varchar(50) DEFAULT NULL,
  `artlocation` varchar(100) DEFAULT NULL,
  `donated` varchar(75) DEFAULT NULL,
  `artfile` varchar(25) NOT NULL,
  `artist_id` int NOT NULL,
  PRIMARY KEY (`artwork_id`),
  KEY `fk_artwork_artist_idx` (`artist_id`),
  CONSTRAINT `fk_artwork_artist` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `artwork_keyword`
--

DROP TABLE IF EXISTS `artwork_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artwork_keyword` (
  `artwork_id` int NOT NULL,
  `keyword_id` int NOT NULL,
  PRIMARY KEY (`artwork_id`,`keyword_id`),
  KEY `fk_artwork_has_keyword_keyword1_idx` (`keyword_id`),
  KEY `fk_artwork_has_keyword_artwork1_idx` (`artwork_id`),
  CONSTRAINT `fk_artwork_has_keyword_artwork1` FOREIGN KEY (`artwork_id`) REFERENCES `artwork` (`artwork_id`),
  CONSTRAINT `fk_artwork_has_keyword_keyword1` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keyword`
--

DROP TABLE IF EXISTS `keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keyword` (
  `keyword_id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(15) NOT NULL,
  PRIMARY KEY (`keyword_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'v_art'
--

--
-- Dumping routines for database 'v_art'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-17  0:15:36
