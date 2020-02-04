-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: circuito_memos
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
-- Dumping data for table `actores`
--

LOCK TABLES `actores` WRITE;
/*!40000 ALTER TABLE `actores` DISABLE KEYS */;
/*!40000 ALTER TABLE `actores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actores_BEFORE_INSERT` BEFORE INSERT ON `actores` FOR EACH ROW BEGIN
 UPDATE actores SET created_by = user() WHERE id = NEW.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actores_AFTER_UPDATE` AFTER UPDATE ON `actores` FOR EACH ROW BEGIN
 IF (NEW.surname != OLD.surname AND OLD.id=NEW.id) 
   THEN
	INSERT INTO actores_reg(actores_id,field,old_value,new_value) VALUES (OLD.id,'surname',OLD.surname,NEW.surname); 
 END IF;
 IF (NEW.`name` != OLD.`name` AND OLD.id=NEW.id)
   THEN
    INSERT INTO actores_reg(actores_id,field,old_value,new_value) VALUES (OLD.id,'name',OLD.`name`,NEW.`name`); 
 END IF;
 IF (NEW.dni != OLD.dni AND OLD.id=NEW.id) 
   THEN
    INSERT INTO actores_reg(actores_id,field,old_value,new_value) VALUES (OLD.id,'dni',OLD.dni,NEW.dni); 
 END IF;
 IF (NEW.born_date != OLD.born_date AND OLD.id=NEW.id) 
   THEN
    INSERT INTO actores_reg(actores_id,field,old_value,new_value) VALUES (OLD.id,'born_date',OLD.born_date,NEW.born_date); 
 END IF;
 # Register editing user 
UPDATE actores SET last_edited_by = user() WHERE id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actores_AFTER_DELETE` AFTER DELETE ON `actores` FOR EACH ROW BEGIN
	INSERT INTO actores_delitions SELECT * FROM actores WHERE id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `actores_delitions`
--

LOCK TABLES `actores_delitions` WRITE;
/*!40000 ALTER TABLE `actores_delitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `actores_delitions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actores_delitions_AFTER_INSERT` AFTER INSERT ON `actores_delitions` FOR EACH ROW BEGIN
	UPDATE actores_delitions SET deleted_by = user() WHERE id_delition = NEW.id_delition;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `actores_enroll`
--

LOCK TABLES `actores_enroll` WRITE;
/*!40000 ALTER TABLE `actores_enroll` DISABLE KEYS */;
/*!40000 ALTER TABLE `actores_enroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `actores_reg`
--

LOCK TABLES `actores_reg` WRITE;
/*!40000 ALTER TABLE `actores_reg` DISABLE KEYS */;
/*!40000 ALTER TABLE `actores_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `actores_roles`
--

LOCK TABLES `actores_roles` WRITE;
/*!40000 ALTER TABLE `actores_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `actores_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `assignments_memos`
--

LOCK TABLES `assignments_memos` WRITE;
/*!40000 ALTER TABLE `assignments_memos` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignments_memos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `assignments_memos_AFTER_UPDATE` AFTER UPDATE ON `assignments_memos` FOR EACH ROW BEGIN
IF (NEW.status_efective = '1' AND OLD.resulting_status=NEW.resulting_status AND OLD.assigments_id=NEW.assigments_id) 
   THEN
    UPDATE assignments SET `status` = OLD.resulting_status WHERE id = OLD.assigments_id;
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `assignments_oficios`
--

LOCK TABLES `assignments_oficios` WRITE;
/*!40000 ALTER TABLE `assignments_oficios` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignments_oficios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `depart`
--

LOCK TABLES `depart` WRITE;
/*!40000 ALTER TABLE `depart` DISABLE KEYS */;
INSERT INTO `depart` VALUES (1,'LA PLATA','1\r','2019-11-28 19:39:45'),(2,'ADOLFO ALSINA','23\r','2019-11-28 19:39:45'),(3,'ALBERTI','15\r','2019-11-28 19:39:45'),(4,'ALMIRANTE BROWN','5\r','2019-11-28 19:39:45'),(5,'AVELLANEDA','2\r','2019-11-28 19:39:45'),(6,'AYACUCHO','18\r','2019-11-28 19:39:45'),(7,'AZUL','25\r','2019-11-28 19:39:45'),(8,'BAHÍA BLANCA','22\r','2019-11-28 19:39:45'),(9,'BALCARCE','20\r','2019-11-28 19:39:45'),(10,'BARADERO','12\r','2019-11-28 19:39:45'),(11,'ARRECIFES','12\r','2019-11-28 19:39:45'),(12,'BOLÍVAR','25\r','2019-11-28 19:39:45'),(13,'BRAGADO','15\r','2019-11-28 19:39:45'),(14,'CORONEL BRANDSEN','1\r','2019-11-28 19:39:45'),(15,'CAMPANA','11\r','2019-11-28 19:39:45'),(16,'CAÑUELAS','10\r','2019-11-28 19:39:45'),(17,'CARLOS CASARES','15\r','2019-11-28 19:39:45'),(18,'CARLOS TEJEDOR','16\r','2019-11-28 19:39:45'),(19,'CARMEN DE ARECO','13\r','2019-11-28 19:39:45'),(20,'DAIREAUX','23\r','2019-11-28 19:39:45'),(21,'CASTELLI','18\r','2019-11-28 19:39:45'),(22,'COLÓN','13\r','2019-11-28 19:39:45'),(23,'CORONEL DORREGO','21\r','2019-11-28 19:39:45'),(24,'CORONEL PRINGLES','21\r','2019-11-28 19:39:45'),(25,'CORONEL SUÁREZ','23\r','2019-11-28 19:39:45'),(26,'CHACABUCO','14\r','2019-11-28 19:39:45'),(27,'CHASCOMÚS','17\r','2019-11-28 19:39:45'),(28,'CHIVILCOY','15\r','2019-11-28 19:39:45'),(29,'DOLORES','18\r','2019-11-28 19:39:45'),(30,'ESTEBAN ECHEVERRÍA','5\r','2019-11-28 19:39:45'),(31,'EXALTACIÓN DE LA CRUZ','11\r','2019-11-28 19:39:45'),(32,'FLORENCIO VARELA','4\r','2019-11-28 19:39:45'),(33,'GENERAL ALVARADO','19\r','2019-11-28 19:39:45'),(34,'GENERAL ALVEAR','24\r','2019-11-28 19:39:45'),(35,'GENERAL ARENALES','14\r','2019-11-28 19:39:45'),(36,'GENERAL BELGRANO','17\r','2019-11-28 19:39:45'),(37,'GENERAL GUIDO','18\r','2019-11-28 19:39:45'),(38,'GENERAL LAMADRID','23\r','2019-11-28 19:39:45'),(39,'GENERAL LAVALLE','18\r','2019-11-28 19:39:45'),(40,'GENERAL MADARIAGA','18\r','2019-11-28 19:39:45'),(41,'GENERAL PAZ','17\r','2019-11-28 19:39:45'),(42,'GENERAL PINTO','14\r','2019-11-28 19:39:45'),(43,'GENERAL PUEYRREDÓN','19\r','2019-11-28 19:39:45'),(44,'GENERAL RODRÍGUEZ','10\r','2019-11-28 19:39:45'),(45,'GENERAL SAN MARTÍN','7\r','2019-11-28 19:39:45'),(47,'ZÁRATE','11\r','2019-11-28 19:39:45'),(48,'GENERAL VIAMONTE','14\r','2019-11-28 19:39:45'),(49,'GENERAL VILLEGAS','16\r','2019-11-28 19:39:45'),(50,'A. GONZÁLES CHAVES','21\r','2019-11-28 19:39:45'),(51,'GUAMINÍ','23\r','2019-11-28 19:39:45'),(52,'BENITO JUÁREZ','21\r','2019-11-28 19:39:45'),(53,'JUNÍN','14\r','2019-11-28 19:39:45'),(54,'LAPRIDA','21\r','2019-11-28 19:39:45'),(55,'TIGRE','6\r','2019-11-28 19:39:45'),(56,'LAS FLORES','24\r','2019-11-28 19:39:45'),(57,'GENERAL LAS HERAS','10\r','2019-11-28 19:39:45'),(58,'LEANDRO N. ALEM','14\r','2019-11-28 19:39:45'),(59,'LINCOLN','14\r','2019-11-28 19:39:45'),(60,'LOBERÍA','20\r','2019-11-28 19:39:45'),(61,'LOBOS','24\r','2019-11-28 19:39:45'),(62,'LOMAS DE ZAMORA','2\r','2019-11-28 19:39:45'),(63,'LUJÁN','10\r','2019-11-28 19:39:45'),(64,'MAGDALENA','1\r','2019-11-28 19:39:45'),(65,'MAIPÚ','18\r','2019-11-28 19:39:45'),(66,'SALTO','13\r','2019-11-28 19:39:45'),(67,'MARCOS PAZ','10\r','2019-11-28 19:39:45'),(68,'MAR CHIQUITA','19\r','2019-11-28 19:39:45'),(69,'LA MATANZA','3\r','2019-12-13 16:01:06'),(70,'MERCEDES','10\r','2019-11-28 19:39:45'),(71,'MERLO','8\r','2019-11-28 19:39:45'),(72,'MONTE','17\r','2019-11-28 19:39:45'),(73,'MORENO','9\r','2019-11-28 19:39:45'),(74,'NAVARRO','10\r','2019-11-28 19:39:45'),(75,'NECOCHEA','20\r','2019-11-28 19:39:45'),(76,'9 DE JULIO','15\r','2019-11-28 19:39:45'),(77,'OLAVARRÍA','25\r','2019-11-28 19:39:45'),(78,'PATAGONES','22\r','2019-11-28 19:39:45'),(79,'PEHUAJÓ','15\r','2019-11-28 19:39:45'),(80,'PELLEGRINI','16\r','2019-11-28 19:39:45'),(81,'PERGAMINO','13\r','2019-11-28 19:39:45'),(82,'PILA','17\r','2019-11-28 19:39:45'),(83,'PILAR','11\r','2019-11-28 19:39:45'),(84,'PUÁN','23\r','2019-11-28 19:39:45'),(85,'QUILMES','4\r','2019-11-28 19:39:45'),(86,'RAMALLO','12\r','2019-11-28 19:39:45'),(87,'RAUCH','17\r','2019-11-28 19:39:45'),(88,'RIVADAVIA','16\r','2019-11-28 19:39:45'),(89,'ROJAS','13\r','2019-11-28 19:39:45'),(90,'ROQUE PÉREZ','24\r','2019-11-28 19:39:45'),(91,'SAAVEDRA','23\r','2019-11-28 19:39:45'),(92,'SALADILLO','24\r','2019-11-28 19:39:45'),(93,'SAN ANDRÉS DE GILES','10\r','2019-11-28 19:39:45'),(94,'SAN ANTONIO DE ARECO','13\r','2019-11-28 19:39:45'),(95,'SAN FERNANDO','6\r','2019-11-28 19:39:45'),(96,'SAN ISIDRO','6\r','2019-11-28 19:39:45'),(97,'SAN NICOLÁS','12\r','2019-11-28 19:39:45'),(98,'SAN PEDRO','12\r','2019-11-28 19:39:45'),(99,'SAN VICENTE','5\r','2019-11-28 19:39:45'),(100,'MORÓN','8\r','2019-11-28 19:39:45'),(101,'SUIPACHA','10\r','2019-11-28 19:39:45'),(102,'TANDIL','20\r','2019-11-28 19:39:45'),(103,'TAPALQUÉ','25\r','2019-11-28 19:39:45'),(104,'TORDILLO','18\r','2019-11-28 19:39:45'),(105,'TORNQUIST','23\r','2019-11-28 19:39:45'),(106,'TRENQUE LAUQUEN','16\r','2019-11-28 19:39:45'),(107,'TRES ARROYOS','21\r','2019-11-28 19:39:45'),(108,'25 DE MAYO','24\r','2019-11-28 19:39:45'),(109,'VICENTE LÓPEZ','6\r','2019-11-28 19:39:45'),(110,'VILLARINO','22\r','2019-11-28 19:39:45'),(111,'LANÚS','2\r','2019-11-28 19:39:45'),(112,'CORONEL ROSALES','22\r','2019-11-28 19:39:45'),(113,'BERISSO','1\r','2019-11-28 19:39:45'),(114,'ENSENADA','1\r','2019-11-28 19:39:45'),(115,'SAN CAYETANO','20\r','2019-11-28 19:39:45'),(116,'ESCOBAR','11\r','2019-11-28 19:39:45'),(117,'TRES DE FEBRERO','7\r','2019-11-28 19:39:45'),(118,'HIPÓLITO YRIGOYEN','15\r','2019-11-28 19:39:45'),(119,'BERAZATEGUI','4\r','2019-11-28 19:39:45'),(120,'SALLIQUELÓ','16\r','2019-11-28 19:39:45'),(121,'CAPITÁN SARMIENTO','12\r','2019-11-28 19:39:45'),(123,'PARTIDO DE LA COSTA','18\r','2019-11-28 19:39:45'),(124,'PINAMAR','18\r','2019-11-28 19:39:45'),(125,'VILLA GESELL','18\r','2019-11-28 19:39:45'),(126,'MONTE HERMOSO','22\r','2019-11-28 19:39:45'),(127,'TRES LOMAS','16\r','2019-11-28 19:39:45'),(128,'FLORENTINO AMEGHINO','14\r','2019-11-28 19:39:45'),(129,'PRESIDENTE PERÓN','5\r','2019-11-28 19:39:45'),(130,'EZEIZA','5\r','2019-11-28 19:39:45'),(131,'SAN MIGUEL','9\r','2019-11-28 19:39:45'),(132,'JOSÉ C. PAZ','9\r','2019-11-28 19:39:45'),(133,'MALVINAS ARGENTINAS','9\r','2019-11-28 19:39:45'),(134,'PUNTA INDIO','1\r','2019-11-28 19:39:45'),(135,'HURLINGHAM','7\r','2019-11-28 19:39:45'),(136,'ITUZAINGÓ','8\r','2019-11-28 19:39:45'),(137,'LEZAMA','17\r','2019-11-28 19:39:45');
/*!40000 ALTER TABLE `depart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estabs`
--

LOCK TABLES `estabs` WRITE;
/*!40000 ALTER TABLE `estabs` DISABLE KEYS */;
INSERT INTO `estabs` VALUES (3,'secundaria',60000001,1,'CENS','451','CENS 451, LA PLATA','2020-02-03 15:52:53'),(6,'secundaria',60000002,1,'CENS','452','CENS 452, LA PLATA','2020-02-03 15:53:04'),(7,'primaria',60000003,1,'EEPA','701','EEPA 701, LA PLATA','2020-02-03 15:53:31');
/*!40000 ALTER TABLE `estabs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `estabs_BEFORE_INSERT` BEFORE INSERT ON `estabs` FOR EACH ROW BEGIN
 SET NEW.`name` = concat(NEW.tipo,' ',NEW.numero
  ,', ',(SELECT depart.`name` FROM depart WHERE depart.id=NEW.dist_id)
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `memos`
--

LOCK TABLES `memos` WRITE;
/*!40000 ALTER TABLE `memos` DISABLE KEYS */;
/*!40000 ALTER TABLE `memos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `memos_AFTER_INSERT` AFTER INSERT ON `memos` FOR EACH ROW BEGIN
 UPDATE memos SET created_by = user() WHERE id = NEW.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `memos_AFTER_UPDATE` AFTER UPDATE ON `memos` FOR EACH ROW BEGIN
IF (NEW.approval_date != null AND OLD.id=NEW.id) 
   THEN
    UPDATE memos SET `status` = 'approved' WHERE id = OLD.id;
 END IF;
IF (NEW.issue_date != null AND OLD.id=NEW.id) 
   THEN
    UPDATE memos SET `status` = 'issued' WHERE id = OLD.id;
    UPDATE assignments_memos SET status_efective = '1' WHERE memos_id = OLD.id;
 END IF;
# Register editing user 
UPDATE memos SET last_edited_by = user() WHERE id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `memos_BEFORE_DELETE` BEFORE DELETE ON `memos` FOR EACH ROW BEGIN
  IF approval_date <> null THEN
   IF user() <> 'root@localhost' THEN
    SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
      SET MESSAGE_TEXT = 'No tiene permiso de borrar la entrada.';
   END IF;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `memos_AFTER_DELETE` AFTER DELETE ON `memos` FOR EACH ROW BEGIN
 INSERT INTO memos_delitions SELECT * FROM memos WHERE id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `memos_delitions`
--

LOCK TABLES `memos_delitions` WRITE;
/*!40000 ALTER TABLE `memos_delitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `memos_delitions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `memos_delitions_AFTER_INSERT` AFTER INSERT ON `memos_delitions` FOR EACH ROW BEGIN
	UPDATE memos_delitions SET deleted_by = user() WHERE id_delition = NEW.id_delition;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (1,'CEBAS'),(3,'EDUCACIÓN A DISTANCIA'),(2,'EDUCACIÓN EN CONTEXTO DE ENCIERRO'),(11,'EDUCACIÓN EN ENTORNOS LABORALES'),(4,'FINES DEUDORES DE MATERIAS'),(6,'FINES TRAYECTO PRIMARIO'),(5,'FINES TRAYECTO SECUNDARIO'),(7,'PRIMARIA'),(8,'SECUNDARIA CON OFICIOS'),(9,'SECUNDARIA PARA FORMACIÓN PROFESIONAL'),(10,'SECUNDARIA RURAL');
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'circuito_memos'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `daily_expires` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `daily_expires` ON SCHEDULE EVERY 1 DAY STARTS '2020-02-01 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO CALL check_assignment_for_expire() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'circuito_memos'
--
/*!50003 DROP PROCEDURE IF EXISTS `check_assignment_for_expire` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_assignment_for_expire`()
BEGIN
DECLARE val1 INT DEFAULT NULL;
DECLARE val2 DATE DEFAULT NULL;
DECLARE done TINYINT DEFAULT FALSE; -- we need a boolean variable to tell us when the cursor is out of data
DECLARE cursor1
 CURSOR FOR SELECT t1.id,t1.end_date FROM assignments t1 WHERE t1.end_date > current_date(); 
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE; -- a cursor that runs out of data throws an exception; we need to catch this.

OPEN cursor1;
my_loop: 
LOOP
  FETCH NEXT FROM cursor1 INTO val1, val2;
  IF done THEN -- this will be true when we are out of rows to read, so we go to the statement after END LOOP.
    LEAVE my_loop; 
  ELSE -- val1 and val2 will be the next values from c1 and c2 in table t1, so now we call the procedure with them for this "row"
    UPDATE assignments SET `status` = 'down' where id = val1; 
  END IF;
END LOOP;
CLOSE cursor1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-03 14:34:36
