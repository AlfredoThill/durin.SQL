-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: relevdatos
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `actores`
--

DROP TABLE IF EXISTS `actores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actores` (
  `id` int(11) NOT NULL,
  `surname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cuil` int(11) DEFAULT NULL,
  `dni` int(8) NOT NULL,
  `born_date` date DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tel` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actores_enroll`
--

DROP TABLE IF EXISTS `actores_enroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actores_enroll` (
  `id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `role_id` int(3) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(actores_assign)_id_to_actor_idx` (`actor_id`),
  KEY `FK(actores_assign)_id_to_role_idx` (`role_id`),
  CONSTRAINT `FK(actores_enroll)_id_to_actor` FOREIGN KEY (`actor_id`) REFERENCES `actores` (`id`),
  CONSTRAINT `FK(actores_enroll)_id_to_rol` FOREIGN KEY (`role_id`) REFERENCES `actores_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actores_role`
--

DROP TABLE IF EXISTS `actores_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actores_role` (
  `id` int(3) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `offer_id` int(2) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(actores_rols)_id_to_offer_idx` (`offer_id`),
  CONSTRAINT `FK(actores_role)_id_to_offer` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `id` int(11) NOT NULL,
  `enroll_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `current_status` set('up','down') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(assign)_id_to_enroll_idx` (`enroll_id`),
  CONSTRAINT `FK(assign)_id_to_enroll` FOREIGN KEY (`enroll_id`) REFERENCES `actores_enroll` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignments_estabs`
--

DROP TABLE IF EXISTS `assignments_estabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments_estabs` (
  `id` int(11) NOT NULL,
  `assign_id` int(11) NOT NULL,
  `estab_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(assign_estabs)_id_to_assign_idx` (`assign_id`),
  KEY `FK(assign_estabs)_id_to_estab_idx` (`estab_id`),
  CONSTRAINT `FK(assign_estabs)_id_to_assign` FOREIGN KEY (`assign_id`) REFERENCES `assignments` (`id`),
  CONSTRAINT `FK(assign_estabs)_id_to_estab` FOREIGN KEY (`estab_id`) REFERENCES `estabs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignments_history`
--

DROP TABLE IF EXISTS `assignments_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) NOT NULL,
  `status` set('up','down') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `motive_notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK(assign_hist)_id_to_assign_idx` (`assignment_id`),
  CONSTRAINT `FK(assign_hist)_id_to_assign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignments_memos`
--

DROP TABLE IF EXISTS `assignments_memos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments_memos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assign_id` int(11) NOT NULL,
  `inner_memo_id` int(11) NOT NULL,
  `pay_hours` int(2) NOT NULL,
  `nominal_status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `resulting_status` set('up','down') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_efective` set('y','n') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'n',
  `last_udpate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(assign_memo)_id_to_assign_idx` (`assign_id`),
  KEY `FK(assign_memo)_id_to_memo_idx` (`inner_memo_id`),
  CONSTRAINT `FK(assign_memo)_id_to_assign` FOREIGN KEY (`assign_id`) REFERENCES `assignments` (`id`),
  CONSTRAINT `FK(assign_memo)_id_to_memo` FOREIGN KEY (`inner_memo_id`) REFERENCES `memos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignments_offer_deudores`
--

DROP TABLE IF EXISTS `assignments_offer_deudores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments_offer_deudores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assign_id` int(11) NOT NULL,
  `deudores_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(assign_deudores)_id_to_assign_idx` (`assign_id`),
  KEY `FK(assign_deudores)_id_to_deu_idx` (`deudores_id`),
  CONSTRAINT `FK(assign_deudores)_id_to_assign` FOREIGN KEY (`assign_id`) REFERENCES `assignments` (`id`),
  CONSTRAINT `FK(assign_deudores)_id_to_deu` FOREIGN KEY (`deudores_id`) REFERENCES `offers_deudores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignments_offer_dist`
--

DROP TABLE IF EXISTS `assignments_offer_dist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments_offer_dist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assign_id` int(11) NOT NULL,
  `dist_id` int(11) NOT NULL,
  `trait` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(assign_ofi)_id_to_assign_idx` (`assign_id`),
  KEY `FK(assign_ofi)_id_to_dist_idx` (`dist_id`),
  CONSTRAINT `FK(assign_ofi)_id_to_assign` FOREIGN KEY (`assign_id`) REFERENCES `assignments` (`id`),
  CONSTRAINT `FK(assign_ofi)_id_to_dist` FOREIGN KEY (`dist_id`) REFERENCES `offers_dist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignments_offer_finests`
--

DROP TABLE IF EXISTS `assignments_offer_finests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments_offer_finests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assign_id` int(11) NOT NULL,
  `fines_id` int(11) NOT NULL,
  `trait` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(assign_finests)_id_to_assign_idx` (`assign_id`),
  KEY `FK(assign_finests)_id_to_fines_idx` (`fines_id`),
  CONSTRAINT `FK(assign_finests)_id_to_assign` FOREIGN KEY (`assign_id`) REFERENCES `assignments` (`id`),
  CONSTRAINT `FK(assign_finests)_id_to_fines` FOREIGN KEY (`fines_id`) REFERENCES `offers_finests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignments_offer_oficios`
--

DROP TABLE IF EXISTS `assignments_offer_oficios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments_offer_oficios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assign_id` int(11) NOT NULL,
  `oficios_id` int(11) NOT NULL,
  `trait` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Sería "OFICIO" para INSTRUCTOR o "MATERIA" para Docente.',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(assign_oficios)_id_to_assign_idx` (`assign_id`),
  KEY `FK(assign_oficios)_id_to_oficios_idx` (`oficios_id`),
  CONSTRAINT `FK(assign_oficios)_id_to_assign` FOREIGN KEY (`assign_id`) REFERENCES `assignments` (`id`),
  CONSTRAINT `FK(assign_oficios)_id_to_oficios` FOREIGN KEY (`oficios_id`) REFERENCES `offers_oficios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `depart`
--

DROP TABLE IF EXISTS `depart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `depart` (
  `id` int(11) NOT NULL,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `region` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes` (
  `id` int(11) NOT NULL,
  `surname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cuil` int(11) DEFAULT NULL,
  `dni` int(8) DEFAULT NULL,
  `gender` set('m','f') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `born_date` date DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tel` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docentes_assignment`
--

DROP TABLE IF EXISTS `docentes_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_assignment` (
  `id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `offer_id` int(2) NOT NULL,
  `status` set('up','down') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK(doc_assign)_id_to_offer_idx` (`offer_id`),
  KEY `FK(doc_assign)_id_to_doc_idx` (`doc_id`),
  CONSTRAINT `FK(doc_assign)_id_to_doc` FOREIGN KEY (`doc_id`) REFERENCES `docentes` (`id`),
  CONSTRAINT `FK(doc_assign)_id_to_offer` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docentes_history`
--

DROP TABLE IF EXISTS `docentes_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_history` (
  `id` int(11) NOT NULL,
  `docentes_assign` int(11) NOT NULL,
  `status` set('up','down') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK(doc_hist)_id_to_assign_idx` (`docentes_assign`),
  CONSTRAINT `FK(doc_hist)_id_to_assign` FOREIGN KEY (`docentes_assign`) REFERENCES `docentes_assignment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docentes_offer_cens`
--

DROP TABLE IF EXISTS `docentes_offer_cens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_offer_cens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_assign_id` int(11) NOT NULL,
  `secc.reg_id` int(11) NOT NULL,
  `module` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hours` int(2) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(doc_cens)_id_to_assign_idx` (`doc_assign_id`),
  KEY `FK(doc_cens)_id_to_secc_idx` (`secc.reg_id`),
  CONSTRAINT `FK(doc_cens)_id_to_assign` FOREIGN KEY (`doc_assign_id`) REFERENCES `docentes_assignment` (`id`),
  CONSTRAINT `FK(doc_cens)_id_to_secc` FOREIGN KEY (`secc.reg_id`) REFERENCES `offers_cens_secc.reg` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docentes_offer_deudores`
--

DROP TABLE IF EXISTS `docentes_offer_deudores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_offer_deudores` (
  `id` int(11) NOT NULL,
  `doc_assign_id` int(11) NOT NULL,
  `tut_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK(doc_deudores)_id_to_doc_idx` (`doc_assign_id`),
  KEY `FK(doc_deudores)_id_to_tut_idx` (`tut_id`),
  CONSTRAINT `FK(doc_deudores)_id_to_doc` FOREIGN KEY (`doc_assign_id`) REFERENCES `docentes_assignment` (`id`),
  CONSTRAINT `FK(doc_deudores)_id_to_tut` FOREIGN KEY (`tut_id`) REFERENCES `offers_deudores_tut` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docentes_offer_dist`
--

DROP TABLE IF EXISTS `docentes_offer_dist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_offer_dist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_assign_id` int(11) NOT NULL,
  `dist_id` int(11) NOT NULL,
  `mod_key` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(doc_dist)_id_to_assign_idx` (`doc_assign_id`),
  KEY `FK(doc_dist)_id_to_secc_idx` (`dist_id`),
  KEY `FK(doc_dist)_id_to_mod_idx` (`mod_key`),
  CONSTRAINT `FK(doc_dist)_id_to_assign` FOREIGN KEY (`doc_assign_id`) REFERENCES `docentes_assignment` (`id`),
  CONSTRAINT `FK(doc_dist)_id_to_mod` FOREIGN KEY (`mod_key`) REFERENCES `offers_dist_modskeys` (`id`),
  CONSTRAINT `FK(doc_dist)_id_to_secc` FOREIGN KEY (`dist_id`) REFERENCES `offers_dist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docentes_offer_finests`
--

DROP TABLE IF EXISTS `docentes_offer_finests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_offer_finests` (
  `id` int(11) NOT NULL,
  `doc_assign_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `module` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hours` int(2) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK(doc_finests)_id_to_assign_idx` (`doc_assign_id`),
  KEY `FK(doc_finests)_id_to_com_idx` (`com_id`),
  CONSTRAINT `FK(doc_finests)_id_to_assign` FOREIGN KEY (`doc_assign_id`) REFERENCES `docentes_assignment` (`id`),
  CONSTRAINT `FK(doc_finests)_id_to_com` FOREIGN KEY (`com_id`) REFERENCES `offers_finests_coms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docentes_offer_oficios`
--

DROP TABLE IF EXISTS `docentes_offer_oficios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_offer_oficios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_assign_id` int(11) NOT NULL,
  `oficios_id` int(11) NOT NULL,
  `module` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hours` int(2) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(doc_ofi)_id_to_assign_idx` (`doc_assign_id`),
  KEY `FK(doc_ofi)_id_to_ofi_idx` (`oficios_id`),
  CONSTRAINT `FK(doc_ofi)_id_to_assign` FOREIGN KEY (`doc_assign_id`) REFERENCES `docentes_assignment` (`id`),
  CONSTRAINT `FK(doc_ofi)_id_to_ofi` FOREIGN KEY (`oficios_id`) REFERENCES `offers_oficios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docentes_offer_prim`
--

DROP TABLE IF EXISTS `docentes_offer_prim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes_offer_prim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_assign_id` int(11) NOT NULL,
  `secc.reg_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(doc_prim)_id_to_assign_idx` (`doc_assign_id`),
  KEY `FK(doc_prim)_id_to_secc_idx` (`secc.reg_id`),
  CONSTRAINT `FK(doc_prim)_id_to_assign` FOREIGN KEY (`doc_assign_id`) REFERENCES `docentes_assignment` (`id`),
  CONSTRAINT `FK(doc_prim)_id_to_secc` FOREIGN KEY (`secc.reg_id`) REFERENCES `offers_prim_secc.reg` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `establecimientos`
--

DROP TABLE IF EXISTS `establecimientos`;
/*!50001 DROP VIEW IF EXISTS `establecimientos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `establecimientos` AS SELECT 
 1 AS `estabs$id`,
 1 AS `estabs$kind`,
 1 AS `estabs$cue`,
 1 AS `estabs$dist_id`,
 1 AS `depart$region`,
 1 AS `depart$distrito`,
 1 AS `estabs$localidad`,
 1 AS `estabs$tipo`,
 1 AS `estabs$numero`,
 1 AS `estabs$telefono`,
 1 AS `estabs$mails`,
 1 AS `estabs$horario`,
 1 AS `estabs$creation_year`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `estabs`
--

DROP TABLE IF EXISTS `estabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` set('primaria','secundaria','cebas') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cue` int(11) NOT NULL,
  `dist_id` int(11) NOT NULL,
  `tipo` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `numero` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `localidad` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `mails` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `horario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `creation_year` date DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `cue_UNIQUE` (`cue`),
  KEY `dist_id_idx` (`dist_id`),
  KEY `FK(estabs)_cue_to_mae_idx` (`cue`),
  CONSTRAINT `FK(estabs)_estabs_to_dist` FOREIGN KEY (`dist_id`) REFERENCES `depart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1614 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geo_deudores_hq`
--

DROP TABLE IF EXISTS `geo_deudores_hq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_deudores_hq` (
  `id` int(11) NOT NULL,
  `hq_id` int(11) NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `address` set('active','suspended','closed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK(deudores_hq)_id_to_hq_idx` (`hq_id`),
  CONSTRAINT `FK(deudores_hq)_id_to_hq` FOREIGN KEY (`hq_id`) REFERENCES `offers_deudores_hq` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geo_estabs`
--

DROP TABLE IF EXISTS `geo_estabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_estabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estab_id` int(11) DEFAULT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitud` decimal(11,8) NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `last_udpate` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `estab_id_UNIQUE` (`estab_id`),
  CONSTRAINT `FK(estabs_geo)_estabs_to_dist` FOREIGN KEY (`estab_id`) REFERENCES `estabs` (`dist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geo_finests_hq`
--

DROP TABLE IF EXISTS `geo_finests_hq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_finests_hq` (
  `id` int(11) NOT NULL,
  `hq_id` int(11) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(geo_finests_hq)_id_to_hq` (`hq_id`),
  CONSTRAINT `FK(geo_finests_hq)_id_to_hq` FOREIGN KEY (`hq_id`) REFERENCES `offers_finests_hq` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mae`
--

DROP TABLE IF EXISTS `mae`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mae` (
  `cue_id` int(11) NOT NULL,
  `jurisdiccion` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sector` set('estatal','privada','social/cooperativa') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ambito` set('urbano','rural','null') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `domicilio` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cp` int(4) unsigned zerofill NOT NULL,
  `codigo_area` int(9) unsigned zerofill NOT NULL,
  `localidad` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `departamento` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cue_id`),
  UNIQUE KEY `cue_UNIQUE` (`cue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `memos`
--

DROP TABLE IF EXISTS `memos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memos` (
  `id` int(11) NOT NULL,
  `memo_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `comunicado_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_gdrive` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `kind` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `total_hours` int(4) NOT NULL,
  `offer_id` int(2) NOT NULL,
  `estab_id` int(11) NOT NULL,
  `status` set('requested','approved','issued') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'requested',
  `request_date` timestamp NULL DEFAULT NULL,
  `approval_date` timestamp NULL DEFAULT NULL,
  `issue_date` timestamp NULL DEFAULT NULL,
  `motive_notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(memo)_id_to_offer_idx` (`offer_id`),
  KEY `FK(memo)_id_to_estab_idx` (`estab_id`),
  CONSTRAINT `FK(memo)_id_to_estab` FOREIGN KEY (`estab_id`) REFERENCES `estabs` (`id`),
  CONSTRAINT `FK(memo)_id_to_offer` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `id` int(2) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `creation_date` date DEFAULT NULL,
  `last_udpate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `offerscol_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_cens`
--

DROP TABLE IF EXISTS `offers_cens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_cens` (
  `id` int(11) NOT NULL,
  `estab_id` int(11) NOT NULL,
  `year` date NOT NULL,
  `link_gdrive` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `estab_id_idx` (`estab_id`),
  CONSTRAINT `FK(cens)_id_to_estab` FOREIGN KEY (`estab_id`) REFERENCES `estabs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_cens_align`
--

DROP TABLE IF EXISTS `offers_cens_align`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_cens_align` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cens_id` int(11) NOT NULL,
  `align` set('GESTION Y ORGA.','CS. SOC.','PRODUCCION','CS. NAT.') COLLATE latin1_spanish_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(cens_align)_id_to_cens_idx` (`cens_id`),
  CONSTRAINT `FK(cens_align)_id_to_cens` FOREIGN KEY (`cens_id`) REFERENCES `offers_cens_align` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_cens_secc`
--

DROP TABLE IF EXISTS `offers_cens_secc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_cens_secc` (
  `id` int(11) NOT NULL,
  `estab_id` int(11) NOT NULL,
  `course_year` set('1','2','3','4') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `creation_date` date NOT NULL,
  `status` set('active','suspended','closed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(cens_secc)_id_to_secc_idx` (`estab_id`),
  CONSTRAINT `FK(cens_secc)_id_to_secc` FOREIGN KEY (`estab_id`) REFERENCES `offers_cens` (`estab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_cens_secc.reg`
--

DROP TABLE IF EXISTS `offers_cens_secc.reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_cens_secc.reg` (
  `id` int(11) NOT NULL,
  `secc_id` int(11) NOT NULL,
  `cens_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(cens_secc.reg)_id_to_secc_idx` (`secc_id`),
  KEY `FK(cens_secc.reg)_id_to_cens_idx` (`cens_id`),
  CONSTRAINT `FK(cens_secc.reg)_id_to_cens` FOREIGN KEY (`cens_id`) REFERENCES `offers_cens` (`id`),
  CONSTRAINT `FK(cens_secc.reg)_id_to_secc` FOREIGN KEY (`secc_id`) REFERENCES `offers_cens_secc` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_deudores`
--

DROP TABLE IF EXISTS `offers_deudores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_deudores` (
  `id` int(11) NOT NULL,
  `dist_id` int(11) NOT NULL,
  `estab_id` int(11) NOT NULL,
  `year` date NOT NULL,
  `link_gdrive` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(deudores)_id_to_dist_idx` (`dist_id`),
  KEY `FK(deudores)_id_to_estab_idx` (`estab_id`),
  CONSTRAINT `FK(deudores)_id_to_dist` FOREIGN KEY (`dist_id`) REFERENCES `depart` (`id`),
  CONSTRAINT `FK(deudores)_id_to_estab` FOREIGN KEY (`estab_id`) REFERENCES `estabs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_deudores_hq`
--

DROP TABLE IF EXISTS `offers_deudores_hq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_deudores_hq` (
  `id` int(6) NOT NULL,
  `location` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mae_id` int(11) NOT NULL,
  `status` set('active','suspended','closed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK(deudores_hq)_cue_to_mae_idx` (`mae_id`),
  CONSTRAINT `FK(deudores_hq)_cue_to_mae` FOREIGN KEY (`mae_id`) REFERENCES `mae` (`cue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_deudores_tut`
--

DROP TABLE IF EXISTS `offers_deudores_tut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_deudores_tut` (
  `id` int(11) NOT NULL,
  `deudores_id` int(11) NOT NULL,
  `stage` set('1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sede_id` int(6) NOT NULL,
  `category` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(deudores_tut)_id_to_deu_idx` (`deudores_id`),
  KEY `FK(deudores_tut)_id_to_hq_idx` (`sede_id`),
  CONSTRAINT `FK(deudores_tut)_id_to_deu` FOREIGN KEY (`deudores_id`) REFERENCES `offers_deudores` (`id`),
  CONSTRAINT `FK(deudores_tut)_id_to_hq` FOREIGN KEY (`sede_id`) REFERENCES `offers_oficios_hq` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_dist`
--

DROP TABLE IF EXISTS `offers_dist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_dist` (
  `id` int(11) NOT NULL,
  `dist_id` int(11) NOT NULL,
  `estab_id` int(11) NOT NULL,
  `link_gdrive_est` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `link_gdrive_doc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `link_gdrive_cohr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `link_gdrive_reg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `org` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `orientation` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `kind` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(dist)_id_to_dist_idx` (`dist_id`),
  KEY `FK(dist)_id_to_estab_idx` (`estab_id`),
  CONSTRAINT `FK(dist)_id_to_dist` FOREIGN KEY (`dist_id`) REFERENCES `depart` (`id`),
  CONSTRAINT `FK(dist)_id_to_estab` FOREIGN KEY (`estab_id`) REFERENCES `estabs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_dist_modskeys`
--

DROP TABLE IF EXISTS `offers_dist_modskeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_dist_modskeys` (
  `id` int(11) NOT NULL,
  `module` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `key` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_finests`
--

DROP TABLE IF EXISTS `offers_finests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_finests` (
  `id` int(11) NOT NULL,
  `dist_id` int(11) NOT NULL,
  `estab_id` int(11) NOT NULL,
  `year` date NOT NULL,
  `quarter` set('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `link_gdrive` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(finests)_id_to_dist_idx` (`dist_id`),
  KEY `FK(finestts)_id_to_estab_idx` (`estab_id`),
  CONSTRAINT `FK(finests)_id_to_dist` FOREIGN KEY (`dist_id`) REFERENCES `depart` (`id`),
  CONSTRAINT `FK(finestts)_id_to_estab` FOREIGN KEY (`estab_id`) REFERENCES `estabs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_finests_coms`
--

DROP TABLE IF EXISTS `offers_finests_coms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_finests_coms` (
  `id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `com_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fines_id` int(11) NOT NULL,
  `course_year` set('1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `course_quater` set('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hq_id` int(11) NOT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `com_id` (`com_id`),
  KEY `FK(finests_coms)_id_to_fines_idx` (`fines_id`),
  KEY `FK(finests_coms)_id_to_hq_idx` (`hq_id`),
  CONSTRAINT `FK(finests_coms)_id_to_fines` FOREIGN KEY (`fines_id`) REFERENCES `offers_finests` (`dist_id`),
  CONSTRAINT `FK(finests_coms)_id_to_hq` FOREIGN KEY (`hq_id`) REFERENCES `offers_finests_hq` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_finests_hq`
--

DROP TABLE IF EXISTS `offers_finests_hq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_finests_hq` (
  `id` int(11) NOT NULL,
  `location` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `kind` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` set('active','sus','closed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_oficios`
--

DROP TABLE IF EXISTS `offers_oficios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_oficios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dist_id` int(11) NOT NULL,
  `estab_id` int(11) NOT NULL,
  `cfp_id` int(11) DEFAULT NULL,
  `cond` set('puro','conveniado') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `org_responsable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sede_id` int(11) DEFAULT NULL,
  `offer_id` int(2) NOT NULL,
  `d_social` set('si','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `c_vegetativo` set('si','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fam_prof_id` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(oficios)_id_to_dist_idx` (`dist_id`),
  KEY `FK(ofcicios)_id_to_estab_idx` (`estab_id`),
  KEY `FK(oficios)_id_to_sede_idx` (`sede_id`),
  KEY `FK(oficios)_id_to_fam_idx` (`fam_prof_id`),
  CONSTRAINT `FK(ofcicios)_id_to_estab` FOREIGN KEY (`estab_id`) REFERENCES `estabs` (`id`),
  CONSTRAINT `FK(oficios)_id_to_dist` FOREIGN KEY (`dist_id`) REFERENCES `depart` (`id`),
  CONSTRAINT `FK(oficios)_id_to_fam` FOREIGN KEY (`fam_prof_id`) REFERENCES `offers_oficios_fampro` (`id`),
  CONSTRAINT `FK(oficios)_id_to_sede` FOREIGN KEY (`sede_id`) REFERENCES `offers_oficios_hq` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_oficios_fampro`
--

DROP TABLE IF EXISTS `offers_oficios_fampro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_oficios_fampro` (
  `id` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_oficios_hq`
--

DROP TABLE IF EXISTS `offers_oficios_hq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_oficios_hq` (
  `id` int(11) NOT NULL,
  `name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `location` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_oficios_reg`
--

DROP TABLE IF EXISTS `offers_oficios_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_oficios_reg` (
  `id` int(11) NOT NULL,
  `oficios_id` int(11) NOT NULL,
  `year` date NOT NULL,
  `quarter` set('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `course` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `course_year` set('1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `course_quarter` set('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shift` set('m','t','v') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(oficios_reg)_id_to_com_idx` (`oficios_id`),
  CONSTRAINT `FK(oficios_reg)_id_to_com` FOREIGN KEY (`oficios_id`) REFERENCES `offers_oficios` (`dist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_prim`
--

DROP TABLE IF EXISTS `offers_prim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_prim` (
  `id` int(11) NOT NULL,
  `estab_id` int(11) NOT NULL,
  `year` date NOT NULL,
  `link_gdrive` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `dependency` int(11) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(prim)_id_to_estab_idx` (`estab_id`),
  CONSTRAINT `FK(prim)_id_to_estab` FOREIGN KEY (`estab_id`) REFERENCES `estabs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_prim_secc`
--

DROP TABLE IF EXISTS `offers_prim_secc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_prim_secc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estab_id` int(11) NOT NULL,
  `course_year` set('1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cycle` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `creation_date` date NOT NULL,
  `status` set('active','suspended','closed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(prim_secc)_id_to_estab_idx` (`estab_id`),
  CONSTRAINT `FK(prim_secc)_id_to_estab` FOREIGN KEY (`estab_id`) REFERENCES `estabs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers_prim_secc.reg`
--

DROP TABLE IF EXISTS `offers_prim_secc.reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers_prim_secc.reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `secc_id` int(11) NOT NULL,
  `prim_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(prim_seccreg)_id_to_secc_idx` (`secc_id`),
  KEY `FK(prim_seccreg)_id_to_prim_idx` (`prim_id`),
  CONSTRAINT `FK(prim_seccreg)_id_to_prim` FOREIGN KEY (`prim_id`) REFERENCES `offers_prim` (`id`),
  CONSTRAINT `FK(prim_seccreg)_id_to_secc` FOREIGN KEY (`secc_id`) REFERENCES `offers_prim_secc` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reso`
--

DROP TABLE IF EXISTS `reso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reso` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `kind` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `link_gdrive` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reso_estabs`
--

DROP TABLE IF EXISTS `reso_estabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reso_estabs` (
  `id` int(11) NOT NULL,
  `reso_id` int(11) NOT NULL,
  `estab_id` int(11) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `reso_id_idx` (`reso_id`),
  KEY `estab_id_idx` (`estab_id`),
  KEY `reso_id_idxF` (`reso_id`) /*!80000 INVISIBLE */,
  KEY `estab_id_idxF` (`estab_id`),
  CONSTRAINT `FK(reso_estabs)_id_to_estab` FOREIGN KEY (`estab_id`) REFERENCES `estabs` (`id`),
  CONSTRAINT `FK(reso_estabs)_id_to_reso` FOREIGN KEY (`reso_id`) REFERENCES `reso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `surname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cuil` int(11) DEFAULT NULL,
  `dni` int(8) DEFAULT NULL,
  `gender` set('m','f') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `born_date` date DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tel` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `_td_` tinyint(4) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`) /*!80000 INVISIBLE */,
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students_assignment`
--

DROP TABLE IF EXISTS `students_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_assignment` (
  `id` int(11) NOT NULL,
  `stud_id` int(11) NOT NULL,
  `offer_id` int(2) NOT NULL,
  `status` set('up','down') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'up',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(studs_offer)_id_to_offer_idx` (`offer_id`) /*!80000 INVISIBLE */,
  KEY `FK(studs_assign)_id_to_stud` (`stud_id`),
  CONSTRAINT `FK(studs_assign)_id_to_offer` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`),
  CONSTRAINT `FK(studs_assign)_id_to_stud` FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students_history`
--

DROP TABLE IF EXISTS `students_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_history` (
  `id` int(11) NOT NULL,
  `student_assign` int(11) NOT NULL,
  `status` set('up','down') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK(stud_hist)_id_to_stud_assign_idx` (`student_assign`),
  CONSTRAINT `FK(stud_hist)_id_to_stud_assign` FOREIGN KEY (`student_assign`) REFERENCES `students_assignment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students_offer_cens`
--

DROP TABLE IF EXISTS `students_offer_cens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_offer_cens` (
  `id` int(11) NOT NULL,
  `stud_assign_id` int(11) NOT NULL,
  `secc.reg_id` int(11) NOT NULL,
  `_tppi_` tinyint(4) DEFAULT NULL,
  `_tds_` tinyint(4) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(cens_stud)_id_to_secc.reg_idx` (`secc.reg_id`),
  KEY `FK(cens_stud)_id_to_student_idx` (`stud_assign_id`),
  CONSTRAINT `FK(cens_stud)_id_to_secc.reg` FOREIGN KEY (`secc.reg_id`) REFERENCES `offers_cens_secc.reg` (`id`),
  CONSTRAINT `FK(cens_stud)_id_to_student` FOREIGN KEY (`stud_assign_id`) REFERENCES `students_assignment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students_offer_deudores`
--

DROP TABLE IF EXISTS `students_offer_deudores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_offer_deudores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stud_assign_id` int(11) NOT NULL,
  `deudores_id` int(11) NOT NULL,
  `mae_id` int(11) DEFAULT NULL,
  `c_debt` int(2) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(studs_deudores)_id_to_assign_idx` (`stud_assign_id`),
  KEY `FK(studs_deudores)_id_to_deudo_idx` (`deudores_id`),
  KEY `FK(studs_deudores)_cue_to_mae_idx` (`mae_id`),
  CONSTRAINT `FK(studs_deudores)_cue_to_mae` FOREIGN KEY (`mae_id`) REFERENCES `mae` (`cue_id`),
  CONSTRAINT `FK(studs_deudores)_id_to_assign` FOREIGN KEY (`stud_assign_id`) REFERENCES `students_assignment` (`id`),
  CONSTRAINT `FK(studs_deudores)_id_to_deudo` FOREIGN KEY (`deudores_id`) REFERENCES `offers_deudores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students_offer_deudores_trayec`
--

DROP TABLE IF EXISTS `students_offer_deudores_trayec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_offer_deudores_trayec` (
  `id` int(11) NOT NULL,
  `stud_deudores_id` int(11) NOT NULL,
  `module` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `stage` set('1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `relative_year` int(1) DEFAULT NULL,
  `tut_id` int(11) NOT NULL,
  `grade` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `book` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `folio` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(stud_deudores)_id_to_deu_idx` (`stud_deudores_id`),
  KEY `FK(deudores_trayect)_id_to_tut_idx` (`tut_id`),
  CONSTRAINT `FK(deudores_trayec)_id_to_deu` FOREIGN KEY (`stud_deudores_id`) REFERENCES `students_offer_deudores` (`id`),
  CONSTRAINT `FK(deudores_trayect)_id_to_tut` FOREIGN KEY (`tut_id`) REFERENCES `offers_deudores_tut` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students_offer_dist`
--

DROP TABLE IF EXISTS `students_offer_dist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_offer_dist` (
  `id` int(11) NOT NULL,
  `stud_assign_id` int(11) NOT NULL,
  `soporte` set('PAPEL','VIRTUAL') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `resolucion` set('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `current_year` set('1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `perc_completed` decimal(5,2) DEFAULT NULL,
  `_tppi_` tinyint(4) DEFAULT NULL,
  `_tds_` tinyint(4) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(dist_stud)_id_to_stud_idx` (`stud_assign_id`),
  CONSTRAINT `FK(dist_stud)_id_to_stud` FOREIGN KEY (`stud_assign_id`) REFERENCES `students_assignment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students_offer_dist_trayec`
--

DROP TABLE IF EXISTS `students_offer_dist_trayec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_offer_dist_trayec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stud_dist_id` int(11) NOT NULL,
  `mod_lyc1` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_lyc1` timestamp NULL DEFAULT NULL,
  `mod_lyc2` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_lyc2` timestamp NULL DEFAULT NULL,
  `mod_hist1` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_hist1` timestamp NULL DEFAULT NULL,
  `mod_geo1` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_geo1` timestamp NULL DEFAULT NULL,
  `mod_dhyc` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_dhyc` timestamp NULL DEFAULT NULL,
  `mod_tdluyc1` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_tdluyc1` timestamp NULL DEFAULT NULL,
  `mod_fpet` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_fpet` timestamp NULL DEFAULT NULL,
  `mod_mat1` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_mat1` timestamp NULL DEFAULT NULL,
  `mod_mat2` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_mat2` timestamp NULL DEFAULT NULL,
  `mod_bio` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_bio` timestamp NULL DEFAULT NULL,
  `mod_pdls` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_pdls` timestamp NULL DEFAULT NULL,
  `mod_ing1` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_ing1` timestamp NULL DEFAULT NULL,
  `mod_ing2` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_ing2` timestamp NULL DEFAULT NULL,
  `mod_tdluyc2` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_tdluyc2` timestamp NULL DEFAULT NULL,
  `mod_filo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_filo` timestamp NULL DEFAULT NULL,
  `mod_lyc3` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_lyc3` timestamp NULL DEFAULT NULL,
  `mod_lyc4` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_lyc4` timestamp NULL DEFAULT NULL,
  `mod_hist2` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_hist2` timestamp NULL DEFAULT NULL,
  `mod_geo2` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_geo2` timestamp NULL DEFAULT NULL,
  `mod_mat3` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_mat3` timestamp NULL DEFAULT NULL,
  `mod_mat4` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_mat4` timestamp NULL DEFAULT NULL,
  `mod_fisica` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_fisica` timestamp NULL DEFAULT NULL,
  `mod_quim` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_quim` timestamp NULL DEFAULT NULL,
  `mod_econo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_econo` timestamp NULL DEFAULT NULL,
  `mod_cpol` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_cpol` timestamp NULL DEFAULT NULL,
  `mod_dys` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_dys` timestamp NULL DEFAULT NULL,
  `mod_eypp` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_eypp` timestamp NULL DEFAULT NULL,
  `mod_gpdpp` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_gpdpp` timestamp NULL DEFAULT NULL,
  `mod_sdinfo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_sdinfo` timestamp NULL DEFAULT NULL,
  `mod_tdlorg` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_tdlorg` timestamp NULL DEFAULT NULL,
  `mod_admdemp` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_admdemp` timestamp NULL DEFAULT NULL,
  `mod_pygdemp` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_update_pygdemp` timestamp NULL DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK(dist_trayec)_id_to_stud_idx` (`stud_dist_id`),
  CONSTRAINT `FK(dist_trayec)_id_to_stud` FOREIGN KEY (`stud_dist_id`) REFERENCES `students_offer_dist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students_offer_finests`
--

DROP TABLE IF EXISTS `students_offer_finests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_offer_finests` (
  `id` int(11) NOT NULL,
  `stud_assign_id` int(11) NOT NULL,
  `com_id` int(11) NOT NULL,
  `_tppi_` tinyint(4) DEFAULT NULL,
  `_tds_` tinyint(4) DEFAULT NULL,
  `last_udpate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(fines_studs)_id_to_com_idx` (`com_id`),
  KEY `FK(fines_studs)_id_to_stud_idx` (`stud_assign_id`),
  CONSTRAINT `FK(fines_studs)_id_to_com` FOREIGN KEY (`com_id`) REFERENCES `offers_finests_coms` (`id`),
  CONSTRAINT `FK(fines_studs)_id_to_stud` FOREIGN KEY (`stud_assign_id`) REFERENCES `students_assignment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students_offer_oficios`
--

DROP TABLE IF EXISTS `students_offer_oficios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_offer_oficios` (
  `id` int(11) NOT NULL,
  `stud_assign_id` int(11) NOT NULL,
  `reg_id` int(11) NOT NULL,
  `_tppi_` tinyint(4) DEFAULT NULL,
  `_tds_` tinyint(4) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(oficios_stud)_id_to_reg_idx` (`reg_id`),
  KEY `FK(oficios_stud)_id_to_stud_idx` (`stud_assign_id`),
  CONSTRAINT `FK(oficios_stud)_id_to_reg` FOREIGN KEY (`reg_id`) REFERENCES `offers_oficios_reg` (`id`),
  CONSTRAINT `FK(oficios_stud)_id_to_stud` FOREIGN KEY (`stud_assign_id`) REFERENCES `students_assignment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `students_offer_prim`
--

DROP TABLE IF EXISTS `students_offer_prim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_offer_prim` (
  `id` int(11) NOT NULL,
  `stud_assign_id` int(11) NOT NULL,
  `prim_id` int(11) NOT NULL,
  `id_sec` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ciclo_formativo` set('ALF','FI','FpP') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` set('up','down') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `_tppi_` tinyint(4) DEFAULT NULL,
  `_tds_` tinyint(4) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK(prim_stud)_id_to_prim_idx` (`prim_id`),
  KEY `FK(prim_stud)_id_to_stud_idx` (`stud_assign_id`),
  CONSTRAINT `FK(prim_stud)_id_to_prim` FOREIGN KEY (`prim_id`) REFERENCES `offers_prim` (`id`),
  CONSTRAINT `FK(prim_stud)_id_to_stud` FOREIGN KEY (`stud_assign_id`) REFERENCES `students_assignment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vud`
--

DROP TABLE IF EXISTS `vud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vud` (
  `ID` int(11) NOT NULL,
  `name` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `surname` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `last_year` int(2) DEFAULT NULL,
  `DNI` varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `Fecha_Nacimiento` varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `Email` varchar(45) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `Tel` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `Comentario` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `Distrito` varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `Oferta` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `Oferta_Final` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `Estado` varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `Region` int(11) NOT NULL,
  `Fecha_de_Inscripcion` varchar(25) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `establecimientos`
--

/*!50001 DROP VIEW IF EXISTS `establecimientos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `establecimientos` AS select `t1`.`id` AS `estabs$id`,`t1`.`kind` AS `estabs$kind`,`t1`.`cue` AS `estabs$cue`,`t1`.`dist_id` AS `estabs$dist_id`,`t2`.`region` AS `depart$region`,`t2`.`name` AS `depart$distrito`,`t1`.`localidad` AS `estabs$localidad`,`t1`.`tipo` AS `estabs$tipo`,`t1`.`numero` AS `estabs$numero`,`t1`.`telefono` AS `estabs$telefono`,`t1`.`mails` AS `estabs$mails`,`t1`.`horario` AS `estabs$horario`,`t1`.`creation_year` AS `estabs$creation_year` from (`estabs` `t1` join `depart` `t2` on((`t1`.`dist_id` = `t2`.`id`))) */;
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

-- Dump completed on 2020-01-13 12:00:39
