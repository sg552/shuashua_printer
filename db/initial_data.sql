-- MySQL dump 10.13  Distrib 5.1.54, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: jingluo
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4

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
-- Table structure for table `acupuncture_points`
--

DROP TABLE IF EXISTS `acupuncture_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acupuncture_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  `meridian_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acupuncture_points`
--

LOCK TABLES `acupuncture_points` WRITE;
/*!40000 ALTER TABLE `acupuncture_points` DISABLE KEYS */;
INSERT INTO `acupuncture_points` VALUES (1,'大敦穴( 井穴 ）','在足拇趾末节背外侧，趾甲角后0.1寸。',1,1,'2012-09-11 05:28:31','2012-09-11 05:31:14'),(2,'行间 ( 荥穴 )','在足背侧，当第1趾缝趾蹼的后方。',2,1,'2012-09-11 05:28:57','2012-09-11 05:31:38'),(3,'太冲（俞穴，原穴）','足背，第一、二跖骨结合部之前凹陷中',3,1,'2012-09-11 05:29:20','2012-09-11 05:59:33'),(4,'中封','内踝前1寸，胫骨前肌腱内缘',4,1,'2012-09-11 05:59:55','2012-09-11 06:00:07'),(5,'蠡沟','内踝高点上5寸，胫骨内侧面的中央',5,1,'2012-09-11 05:59:59','2012-09-11 06:00:33'),(6,'中都','内踝高点上7寸，胫骨内侧面的中央 ',6,1,'2012-09-11 06:00:55','2012-09-11 06:00:55'),(7,'膝关','阴陵泉穴后1寸',7,1,'2012-09-11 06:01:21','2012-09-11 06:01:21'),(8,'曲泉（合穴）','屈膝，当膝内侧横纹头上方凹陷中',8,1,'2012-09-11 06:02:05','2012-09-11 06:02:05'),(9,'隐白','仰卧或正坐平放足底，在足趾末节内侧，距趾甲角0.1寸',1,2,'2012-09-11 06:23:03','2012-09-11 06:23:03'),(10,'大都','在足内侧缘，当足大趾本节前下方赤白肉际凹陷处。',2,2,'2012-09-11 06:27:16','2012-09-11 06:27:16'),(11,'太白（原穴）','在足内侧缘，当足大趾本节后下方赤白肉际凹陷处。',3,2,'2012-09-11 06:27:38','2012-09-11 06:28:06'),(12,'公孙','在足内侧缘，第一趾骨基底部的前下方',4,2,'2012-09-11 06:30:08','2012-09-11 06:40:11'),(13,'商丘','在足内踝前下方凹陷中，当丹骨结节与内踝尖连线的中点处',5,2,'2012-09-11 06:30:54','2012-09-11 06:30:54'),(14,'三阴交','小腿内侧，踝尖上3寸，胫骨内侧缘后方',6,2,'2012-09-11 06:41:51','2012-09-11 06:41:57'),(15,'漏谷','小腿内侧，内踝尖上6寸，胫骨内侧缘后方',7,2,'2012-09-11 06:43:36','2012-09-11 06:43:36'),(16,'地机','阴陵泉下3寸，小腿内侧，内踝尖与阴陵泉的连线上',8,2,'2012-09-11 06:45:09','2012-09-11 06:45:09'),(17,'阴陵泉','小腿内侧，膝下胫骨内侧凹陷中，与足三里相对。 ( 内踝尖上13寸（？），胫骨后缘内侧 )',9,2,'2012-09-11 06:47:32','2012-09-11 06:51:18');
/*!40000 ALTER TABLE `acupuncture_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arranged_acupuncture_points`
--

DROP TABLE IF EXISTS `arranged_acupuncture_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arranged_acupuncture_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  `acupuncture_point_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arranged_acupuncture_points`
--

LOCK TABLES `arranged_acupuncture_points` WRITE;
/*!40000 ALTER TABLE `arranged_acupuncture_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `arranged_acupuncture_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meridians`
--

DROP TABLE IF EXISTS `meridians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meridians` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meridians`
--

LOCK TABLES `meridians` WRITE;
/*!40000 ALTER TABLE `meridians` DISABLE KEYS */;
INSERT INTO `meridians` VALUES (1,'足阙阴肝经','2012-09-11 05:23:36','2012-09-11 06:19:45'),(2,'足太阴脾经','2012-09-11 06:19:35','2012-09-11 06:19:35');
/*!40000 ALTER TABLE `meridians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120910082243'),('20120910082455'),('20120910082619'),('20120910083026');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-11 14:51:51
