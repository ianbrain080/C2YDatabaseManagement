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
-- Temporary view structure for view `view_recipientdeliveryavg`
--

DROP TABLE IF EXISTS `view_recipientdeliveryavg`;
/*!50001 DROP VIEW IF EXISTS `view_recipientdeliveryavg`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_recipientdeliveryavg` AS SELECT 
 1 AS `recipient_FName`,
 1 AS `recipient_LName`,
 1 AS `recipientDeliveryValue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_volunteerhourstotal`
--

DROP TABLE IF EXISTS `view_volunteerhourstotal`;
/*!50001 DROP VIEW IF EXISTS `view_volunteerhourstotal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_volunteerhourstotal` AS SELECT 
 1 AS `volunteer_FName`,
 1 AS `volunteer_LName`,
 1 AS `totalHours`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_recipientdeliveryavg`
--

/*!50001 DROP VIEW IF EXISTS `view_recipientdeliveryavg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_recipientdeliveryavg` AS select `r`.`Recipient_FName` AS `recipient_FName`,`r`.`Recipient_LName` AS `recipient_LName`,avg(`d`.`TotalDeliveryValue`) AS `recipientDeliveryValue` from ((`recipient` `r` join `delivery` `d` on((`d`.`Recipient_RecipientID` = `r`.`RecipientID`))) join `donation` `don` on((`d`.`Donation_DonationID` = `don`.`DonationID`))) group by `r`.`Recipient_FName`,`r`.`Recipient_LName` order by `recipientDeliveryValue` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_volunteerhourstotal`
--

/*!50001 DROP VIEW IF EXISTS `view_volunteerhourstotal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_volunteerhourstotal` AS select `v`.`Volunteer_FName` AS `volunteer_FName`,`v`.`volunteer_LName` AS `volunteer_LName`,sum(`d`.`VolunteerHours`) AS `totalHours` from (`volunteer` `v` join `delivery` `d` on((`d`.`Volunteer_VolunteerID` = `v`.`VolunteerID`))) where (month(`d`.`DeliveryDate`) = (month(curdate()) - 1)) group by `v`.`Volunteer_FName`,`v`.`volunteer_LName` order by `totalHours` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-09 19:03:29
