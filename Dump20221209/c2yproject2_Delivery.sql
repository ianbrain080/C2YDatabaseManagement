-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: c2yproject2
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `Delivery`
--

DROP TABLE IF EXISTS `Delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Delivery` (
  `DeliveryID` int NOT NULL AUTO_INCREMENT,
  `Donation_DonationID` int NOT NULL,
  `Volunteer_VolunteerID` int NOT NULL,
  `VolunteerHours` double NOT NULL,
  `Recipient_RecipientID` int NOT NULL,
  `DeliveryDate` date NOT NULL,
  `DeliveryQuantity` int NOT NULL,
  `TotalDeliveryValue` double NOT NULL,
  `Team` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`DeliveryID`),
  KEY `fk_delivery_donation_status1_idx` (`Donation_DonationID`),
  KEY `fk_delivery_volunteer1_idx` (`Volunteer_VolunteerID`),
  KEY `fk_delivery_recipient1_idx` (`Recipient_RecipientID`),
  CONSTRAINT `fk_delivery_donation_status1` FOREIGN KEY (`Donation_DonationID`) REFERENCES `Donation` (`DonationID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_delivery_recipient1` FOREIGN KEY (`Recipient_RecipientID`) REFERENCES `Recipient` (`RecipientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_delivery_volunteer1` FOREIGN KEY (`Volunteer_VolunteerID`) REFERENCES `Volunteer` (`VolunteerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-09 19:03:29
