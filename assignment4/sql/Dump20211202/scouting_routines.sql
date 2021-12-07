-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: scouting
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Temporary view structure for view `draftprospectives`
--

DROP TABLE IF EXISTS `draftprospectives`;
/*!50001 DROP VIEW IF EXISTS `draftprospectives`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `draftprospectives` AS SELECT 
 1 AS `aName`,
 1 AS `aPosition`,
 1 AS `tName`,
 1 AS `tConference`,
 1 AS `ranking`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `pointguardoutliers`
--

DROP TABLE IF EXISTS `pointguardoutliers`;
/*!50001 DROP VIEW IF EXISTS `pointguardoutliers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pointguardoutliers` AS SELECT 
 1 AS `aName`,
 1 AS `aPosition`,
 1 AS `tName`,
 1 AS `tConference`,
 1 AS `ranking`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `centergeographicaldensity`
--

DROP TABLE IF EXISTS `centergeographicaldensity`;
/*!50001 DROP VIEW IF EXISTS `centergeographicaldensity`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `centergeographicaldensity` AS SELECT 
 1 AS `aName`,
 1 AS `aPosition`,
 1 AS `tName`,
 1 AS `ranking`,
 1 AS `count(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `draftprospectives`
--

/*!50001 DROP VIEW IF EXISTS `draftprospectives`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `draftprospectives` AS select `a`.`aName` AS `aName`,`a`.`aPosition` AS `aPosition`,`a`.`tName` AS `tName`,`a`.`tConference` AS `tConference`,`t`.`ranking` AS `ranking` from ((`athlete` `a` join `city` `c`) join `team` `t`) where ((`t`.`ranking` <= 25) and (`a`.`tName` = `t`.`tName`) and (`a`.`tConference` = `t`.`tConference`) and (`c`.`cityID` = `t`.`cityID`) and (`a`.`age` >= 18) and (`a`.`age` <= 21)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pointguardoutliers`
--

/*!50001 DROP VIEW IF EXISTS `pointguardoutliers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pointguardoutliers` AS select `a`.`aName` AS `aName`,`a`.`aPosition` AS `aPosition`,`a`.`tName` AS `tName`,`a`.`tConference` AS `tConference`,`t`.`ranking` AS `ranking` from ((`athlete` `a` join `city` `c`) join `team` `t`) where ((`a`.`height` > 191) and (`a`.`tName` = `t`.`tName`) and (`a`.`tConference` = `t`.`tConference`) and (`c`.`cityID` = `t`.`cityID`) and (`a`.`aPosition` = 'Point Guard')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `centergeographicaldensity`
--

/*!50001 DROP VIEW IF EXISTS `centergeographicaldensity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `centergeographicaldensity` AS select `a`.`aName` AS `aName`,`a`.`aPosition` AS `aPosition`,`a`.`tName` AS `tName`,`t`.`ranking` AS `ranking`,count(0) AS `count(*)` from ((`athlete` `a` join `city` `c`) join `team` `t`) where ((`a`.`aPosition` = 'Center') and (`c`.`cityName` = 'London') and (`a`.`tName` = `t`.`tName`) and (`c`.`cityID` = `t`.`cityID`)) */;
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

-- Dump completed on 2021-12-02 16:26:42
