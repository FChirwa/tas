-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: art
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `patients` (`patient_id`),
  KEY `users` (`user_id`),
  CONSTRAINT `patients` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17736 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (17734,18496,NULL),(17735,18497,NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_attribute`
--

DROP TABLE IF EXISTS `person_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_attribute` (
  `person_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(50) NOT NULL,
  `person_attribute_type_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`person_attribute_id`),
  UNIQUE KEY `person_attribute_person_type` (`person_id`,`person_attribute_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_attribute`
--

LOCK TABLES `person_attribute` WRITE;
/*!40000 ALTER TABLE `person_attribute` DISABLE KEYS */;
INSERT INTO `person_attribute` VALUES (7,18496,'WHO stage 4 adult',1,1,'2012-11-13 08:41:33',1,'2012-11-13 08:41:33',0,NULL,NULL,NULL),(8,18496,'4',2,1,'2012-11-13 08:41:33',1,'2012-11-13 08:41:33',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `person_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_name`
--

DROP TABLE IF EXISTS `patient_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_name` (
  `patient_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `prefix` varchar(50) DEFAULT NULL,
  `given_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `family_name_prefix` varchar(50) DEFAULT NULL,
  `family_name` varchar(50) DEFAULT NULL,
  `family_name2` varchar(50) DEFAULT NULL,
  `family_name_suffix` varchar(50) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`patient_name_id`),
  KEY `name_for_patient` (`patient_id`),
  KEY `user_who_made_name` (`creator`),
  KEY `user_who_voided_name` (`voided_by`),
  KEY `first_name` (`given_name`),
  KEY `middle_name` (`middle_name`),
  KEY `last_name` (`family_name`),
  CONSTRAINT `name_for_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `user_who_made_name` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_name` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18532 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_name`
--

LOCK TABLES `patient_name` WRITE;
/*!40000 ALTER TABLE `patient_name` DISABLE KEYS */;
INSERT INTO `patient_name` VALUES (18530,0,18496,NULL,'John',NULL,NULL,'Banda',NULL,NULL,NULL,1,'2012-11-12 12:45:58',0,NULL,NULL,NULL,1,'2012-11-12 12:45:58'),(18531,0,18497,NULL,'John',NULL,NULL,'Banda',NULL,NULL,NULL,1,'2012-11-12 12:48:26',0,NULL,NULL,NULL,1,'2012-11-12 12:48:26');
/*!40000 ALTER TABLE `patient_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_identifier`
--

DROP TABLE IF EXISTS `patient_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_identifier` (
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `identifier_type` int(11) NOT NULL DEFAULT '0',
  `preferred` tinyint(4) NOT NULL DEFAULT '0',
  `location_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_id`,`identifier`,`identifier_type`),
  KEY `defines_identifier_type` (`identifier_type`),
  KEY `identifier_creator` (`creator`),
  KEY `identifier_voider` (`voided_by`),
  KEY `identifier_location` (`location_id`),
  KEY `identifier_name` (`identifier`),
  CONSTRAINT `defines_identifier_type` FOREIGN KEY (`identifier_type`) REFERENCES `patient_identifier_type` (`patient_identifier_type_id`),
  CONSTRAINT `identifier_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `identifier_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `identifies_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `patient_identifier_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_identifier`
--

LOCK TABLES `patient_identifier` WRITE;
/*!40000 ALTER TABLE `patient_identifier` DISABLE KEYS */;
INSERT INTO `patient_identifier` VALUES (18496,'Biwi (A8)',9,0,138,1,'2012-11-12 12:45:58',0,NULL,NULL,NULL),(18496,'Business',3,0,138,1,'2012-11-12 12:45:58',0,NULL,NULL,NULL),(18496,'DZA 1',18,0,138,1,'2012-11-12 14:16:58',0,NULL,NULL,NULL),(18496,'other',6,0,138,1,'2012-11-12 12:45:58',0,NULL,NULL,NULL),(18496,'P113800000016',1,0,138,1,'2012-11-12 12:45:59',0,NULL,NULL,NULL),(18496,'Unknown',11,0,138,1,'2012-11-12 12:45:58',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `patient_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_identifier_type`
--

DROP TABLE IF EXISTS `patient_identifier_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_identifier_type` (
  `patient_identifier_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `format` varchar(50) DEFAULT NULL,
  `check_digit` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`patient_identifier_type_id`),
  KEY `type_creator` (`creator`),
  CONSTRAINT `type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_identifier_type`
--

LOCK TABLES `patient_identifier_type` WRITE;
/*!40000 ALTER TABLE `patient_identifier_type` DISABLE KEYS */;
INSERT INTO `patient_identifier_type` VALUES (1,'National id','text','text',1,1,'2006-09-28 15:31:00'),(2,'Other name','text','text',0,1,'2006-09-28 15:32:00'),(3,'Occupation','text','text',0,1,'2006-09-28 15:32:00'),(5,'Cell phone number','text','text',0,1,'2006-09-28 15:33:00'),(6,'Physical address','text','text',0,1,'2006-09-28 15:33:00'),(8,'Heard about','text','text',0,1,'2006-09-28 15:35:00'),(9,'Traditional authority','text','text',0,1,'2006-09-28 15:36:00'),(10,'Filing number','text','text',0,1,'2006-10-25 10:34:16'),(11,'Home phone number','text','text',0,1,'2006-10-30 10:06:12'),(12,'Office phone number','text','text',0,1,'2006-10-30 10:06:51'),(16,'Legacy national id','Previous national identifier, used in systems that have been updated. Patient data that has been migrated should have a legacy national identifier',NULL,0,1,'2006-11-16 18:03:16'),(17,'Legacy pediatric id','Earliest pediatric patient id format. Useful for looking up a patient with an old label in the format P/1234/03',NULL,0,1,'2006-11-16 18:07:04'),(18,'Arv national id','',NULL,0,1,'2006-11-16 22:13:53'),(19,'Archived filing number','',NULL,0,1,'2006-11-16 22:13:53'),(20,'Legacy Lighthouse ID','Old Lighthouse ID. Encoding patient initials, year, month, day of registration, registration station code, sequence number of registration within the day','text',0,5,'2008-02-28 17:49:50'),(21,'TB treatment ID','text','text',0,1,'2010-07-06 00:00:00'),(22,'Pre ARV number ID','text','text',0,1,'2010-07-06 00:00:00'),(23,'Stand alone ARV number ID','text','text',0,1,'2010-07-06 00:00:00'),(24,'Migrated WHO stage','text','text',0,1,'2010-07-06 00:00:00'),(25,'New national id','text','text',0,1,'2010-08-02 00:00:00'),(26,'Nearest Health Clinic','text','text',0,1,'2010-10-05 00:00:00'),(27,'Previous ARV number','text','text',0,1,'2010-10-05 00:00:00'),(28,'ART number','text','text',0,1,'2011-04-12 09:00:00');
/*!40000 ALTER TABLE `patient_identifier_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `secret_question` varchar(255) DEFAULT NULL,
  `secret_answer` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_creator` (`creator`),
  KEY `user_who_changed_user` (`changed_by`),
  KEY `user_who_voided_user` (`voided_by`),
  CONSTRAINT `user_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_user` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_user` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'','admin','Admin','','User','2b6303d0491fb082b789bc947dd35e3bf8feb849','SkpOljpjJF',NULL,NULL,1,'2010-06-07 17:04:56',1,'2010-06-07 17:04:56',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `privilege` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES (76,'HIV First visit',''),(77,'ART Visit',''),(78,'Give drugs',''),(79,'HIV Staging',''),(80,'HIV Reception',''),(81,'Height/Weight',''),(82,'Update outcome',''),(83,'TB Reception',''),(84,'Enter past visit',''),(85,'View reports','');
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `user_role` (`user_id`),
  CONSTRAINT `role_definitions` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `user_role` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(1,2),(3,1),(4,2),(5,1),(6,1),(8,2),(9,2),(10,2),(11,2),(12,2),(13,3),(14,2),(15,1),(16,1),(17,5),(17,6),(28,3),(29,4),(30,6),(31,3),(32,6),(33,6),(34,6),(35,6),(36,6),(37,6),(38,2),(39,7),(40,5),(41,4),(42,4),(43,4),(44,3),(45,7),(46,3),(47,2),(48,8),(49,5),(50,7),(51,2),(52,2),(53,2),(54,6),(55,1),(55,2),(55,3),(56,2),(57,7),(58,6),(59,3),(60,4),(61,4),(62,7),(63,3),(64,2),(65,2),(66,3),(67,6),(68,6),(69,3),(70,6),(71,6),(72,6),(73,6),(74,6),(75,6),(76,6),(77,6),(79,7),(79,8),(80,7),(81,5),(82,2),(83,2),(84,2),(85,2),(86,4),(87,2),(88,3),(89,6),(90,4),(91,4),(92,7),(93,6),(94,7),(95,6),(96,6),(97,8),(98,6),(99,6),(100,2),(101,2),(102,2),(103,2),(103,4),(104,6),(105,2),(106,2),(107,6),(108,2),(108,4),(109,6),(110,3),(111,6),(112,4),(113,4),(114,3),(115,4),(116,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_privilege`
--

DROP TABLE IF EXISTS `role_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_privilege` (
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  PRIMARY KEY (`privilege_id`,`role_id`),
  KEY `role_privilege` (`role_id`),
  CONSTRAINT `privilege_definitons` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`privilege_id`),
  CONSTRAINT `role_privilege` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_privilege`
--

LOCK TABLES `role_privilege` WRITE;
/*!40000 ALTER TABLE `role_privilege` DISABLE KEYS */;
INSERT INTO `role_privilege` VALUES (1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(2,76),(2,77),(2,78),(2,79),(2,80),(2,81),(2,82),(2,83),(2,84),(2,85),(3,76),(3,77),(3,78),(3,79),(3,80),(3,81),(3,82),(3,83),(3,84),(3,85),(4,76),(4,77),(4,78),(4,79),(4,80),(4,81),(4,82),(4,83),(4,84),(4,85),(5,76),(5,77),(5,78),(5,79),(5,80),(5,81),(5,82),(5,83),(5,84),(5,85),(6,76),(6,77),(6,78),(6,79),(6,80),(6,81),(6,82),(6,83),(6,84),(6,85),(7,76),(7,77),(7,78),(7,79),(7,80),(7,81),(7,82),(7,83),(7,84),(7,85),(8,76),(8,77),(8,78),(8,79),(8,80),(8,81),(8,82),(8,83),(8,84),(8,85);
/*!40000 ALTER TABLE `role_privilege` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-16 20:46:50
