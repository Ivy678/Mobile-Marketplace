CREATE DATABASE  IF NOT EXISTS `online_phone_sales_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `online_phone_sales_db`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: online_phone_sales_db
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `user_name` varchar(50) NOT NULL,
  `model_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`user_name`,`model_id`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `user` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `phone_model` (`model_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_chk_1` CHECK ((`quantity` >= 1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('bobbb',4,8),('either00',5,1),('jack01',3,2),('Yutian',1,10),('Yutian',2,4);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) NOT NULL,
  `website` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `uk_Company_phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Apple','www.apple.com','1 Apple Park Way, Cupertino, CA','1-800-MY-APPLE'),(2,'Samsung','www.samsung.com','129 Samsung-ro, Yeongtong-gu, Suwon-si, Gyeonggi-do','+82-31-200-2111'),(3,'Google','www.google.com','1600 Amphitheatre Parkway, Mountain View, CA','1-650-253-0000'),(4,'LG','www.lg.com','222 LG-ro, Jinwi-myeon, Pyeongtaek-si, Gyeonggi-do','+82-2-3777-1114'),(5,'Sony','www.sony.com','1-7-1 Konan, Minato-ku, Tokyo','+81-3-6748-2111'),(6,'ITEL','https://www.itelinc.com','6676 Corporate Center Parkway Suite 107, Jacksonville, FL 32216','800-890-ITEL (4835)'),(7,'LAVA','https://www.lavamobiles.com','Plot Number A-56, Near Block A & Saharas Office, Sector 64-201301.','1860-500-5001'),(8,'MARQ','https://www.marq.com','215 South State Street, Suite 850, Salt Lake City, Utah 84111','860-799-7800'),(9,'MICROMAX','https://www.micromaxinfo.com','Micromax Informatics Ltd. 697, Udyog Vihar , Phase _V, Gurugram, Haryana _ 122016','91-129-4883999'),(10,'MOTOROLA','https://www.motorola.com','222 W. Merchandise Mart Plaza, Suite 1800 Chicago, Illinois 60654 USA','1 800 668 6765'),(11,'NOKIA','https://www.nokia.com',' 3100 Olympus Blvd Dallas, TX 75019','(972) 374-3000'),(12,'NOTHING','https://us.nothing.tech','London, England','1 833 495 40 81'),(13,'ONEPLUS','https://www.oneplus.com','Suite 300, Building 5, Riverside Commons, 5000 Riverside Drive, Irving, Texas 75039 USA','1(833)77-3633'),(14,'OPPO','https://www.oppo.com','Dongguan, 18 Haibin Road, Wusha, Chang\'an Town, China','328-007-8708'),(15,'POCO','https://www.po.co','33 Avenue B, New York, NY 10009','(212) 228-4461'),(16,'REALME','https://www.realme.com','Shenzhen, Guangdong','1800 102 2777'),(18,'TECNO','https://www.tecno-mobile.com','13735 Paseo Bonita Poway, CA 92064 United States','0421-11999666'),(19,'VIVO','https://www.vivo.com','No.1 vivo Road, Chang\'an Town, Dongguan City, Guangdong Province','0769-38816888'),(20,'XIAOMI','https://www.mi.com','Block E, Embassy Tech Village Marathahalli Outer Ring Road, Devarabisanahalli, Bengaluru 560103','1 929 207 2211');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `discount_code` varchar(20) NOT NULL,
  `discount_rate` decimal(5,2) NOT NULL,
  `start_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  PRIMARY KEY (`discount_code`),
  CONSTRAINT `chk_discount_rate` CHECK (((`discount_rate` >= 0) and (`discount_rate` <= 1))),
  CONSTRAINT `chk_expiration_date` CHECK ((`expiration_date` > `start_date`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES ('DISCOUNT10',0.10,'2023-01-01','2023-12-31'),('DISCOUNT20',0.20,'2024-01-01','2024-12-31'),('DISCOUNT30',0.30,'2025-01-01','2025-12-31'),('DISCOUNT40',0.40,'2026-01-01','2026-12-31'),('DISCOUNT50',0.50,'2027-01-01','2027-12-31');
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature` (
  `keyword` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`keyword`),
  CONSTRAINT `max_description_length` CHECK ((length(`description`) <= 1000)),
  CONSTRAINT `min_keyword_length` CHECK ((length(`keyword`) > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` VALUES ('5G','Supports 5G network connectivity'),('Dual_Camera','Has two rear-facing cameras'),('Fingerprint_Sensor','Has a built-in fingerprint sensor'),('Water_Resistant','Resistant to water damage'),('Wireless_Charging','Supports wireless charging');
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_discount`
--

DROP TABLE IF EXISTS `model_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_discount` (
  `model_id` int NOT NULL,
  `discount_code` varchar(20) NOT NULL,
  PRIMARY KEY (`model_id`,`discount_code`),
  KEY `discount_code` (`discount_code`),
  CONSTRAINT `model_discount_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `phone_model` (`model_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `model_discount_ibfk_2` FOREIGN KEY (`discount_code`) REFERENCES `discount` (`discount_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_discount`
--

LOCK TABLES `model_discount` WRITE;
/*!40000 ALTER TABLE `model_discount` DISABLE KEYS */;
INSERT INTO `model_discount` VALUES (1,'DISCOUNT10'),(2,'DISCOUNT20'),(3,'DISCOUNT30'),(4,'DISCOUNT40'),(5,'DISCOUNT50');
/*!40000 ALTER TABLE `model_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_feature`
--

DROP TABLE IF EXISTS `model_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_feature` (
  `model_id` int NOT NULL,
  `keyword` varchar(50) NOT NULL,
  PRIMARY KEY (`model_id`,`keyword`),
  KEY `keyword` (`keyword`),
  CONSTRAINT `model_feature_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `phone_model` (`model_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `model_feature_ibfk_2` FOREIGN KEY (`keyword`) REFERENCES `feature` (`keyword`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_feature`
--

LOCK TABLES `model_feature` WRITE;
/*!40000 ALTER TABLE `model_feature` DISABLE KEYS */;
INSERT INTO `model_feature` VALUES (1,'5G'),(2,'5G'),(3,'5G'),(1,'Dual_Camera'),(2,'Dual_Camera'),(3,'Dual_Camera'),(4,'Dual_Camera'),(2,'Water_Resistant'),(3,'Water_Resistant'),(4,'Water_Resistant'),(5,'Water_Resistant'),(1,'Wireless_Charging'),(3,'Wireless_Charging'),(4,'Wireless_Charging');
/*!40000 ALTER TABLE `model_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_model`
--

DROP TABLE IF EXISTS `order_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_model` (
  `order_id` int NOT NULL,
  `model_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`order_id`,`model_id`),
  KEY `model_id` (`model_id`),
  CONSTRAINT `order_model_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_model_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `phone_model` (`model_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_model`
--

LOCK TABLES `order_model` WRITE;
/*!40000 ALTER TABLE `order_model` DISABLE KEYS */;
INSERT INTO `order_model` VALUES (1,1,1),(1,2,2),(2,3,1),(3,4,3),(4,5,2);
/*!40000 ALTER TABLE `order_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `card_no` bigint NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_name` (`user_name`),
  KEY `card_no` (`card_no`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `user` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`card_no`) REFERENCES `payment` (`card_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2023-04-17','10:00:00','Yutian',12345678901),(2,'2023-04-16','15:30:00','jack01',23456789012),(3,'2023-04-15','11:45:00','bobbb',34567890123),(4,'2023-04-14','12:15:00','either00',45678901234),(5,'2023-04-13','09:00:00','cj345',56789012345);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `card_no` bigint NOT NULL,
  `card_type` varchar(50) NOT NULL,
  `expiration_date` date NOT NULL,
  PRIMARY KEY (`card_no`),
  CONSTRAINT `chk_card_type` CHECK ((`card_type` in (_utf8mb4'Credit Card',_utf8mb4'Debit Card',_utf8mb4'Gift Card')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (12345678901,'Credit Card','2025-01-01'),(23456789012,'Gift Card','2024-06-01'),(34567890123,'Debit Card','2026-09-01'),(45678901234,'Debit Card','2023-11-01'),(56789012345,'Credit Card','2027-03-01'),(67890123456,'Debit Card','2023-12-01'),(78901234567,'Gift Card','2024-12-01');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_model`
--

DROP TABLE IF EXISTS `phone_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_model` (
  `model_id` int NOT NULL AUTO_INCREMENT,
  `model_name` varchar(50) NOT NULL,
  `processor` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `screen_size` float NOT NULL,
  `memory_size` int NOT NULL,
  `release_date` date NOT NULL,
  `battery_size` float NOT NULL,
  `storage` int NOT NULL,
  `color` varchar(20) NOT NULL,
  `company_id` int NOT NULL,
  `inventory` int NOT NULL,
  PRIMARY KEY (`model_id`),
  KEY `fk_phone_model_company` (`company_id`),
  CONSTRAINT `phone_model_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chk_phone_model_battery_size` CHECK ((`battery_size` > 0)),
  CONSTRAINT `chk_phone_model_invemtory` CHECK ((`inventory` > 0)),
  CONSTRAINT `chk_phone_model_memory_size` CHECK ((`memory_size` > 0)),
  CONSTRAINT `chk_phone_model_price` CHECK ((`price` >= 0)),
  CONSTRAINT `chk_phone_model_screen_size` CHECK ((`screen_size` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=837 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_model`
--

LOCK TABLES `phone_model` WRITE;
/*!40000 ALTER TABLE `phone_model` DISABLE KEYS */;
INSERT INTO `phone_model` VALUES (1,'iPhone 13 Pro','A15 Bionic chip',999.00,6.1,128,'2021-09-24',3085,128,'Sierra Blue',1,20),(2,'Galaxy S21','Exynos 2100',799.99,6.2,128,'2021-01-29',4000,128,'Phantom Gray',2,35),(3,'Pixel 6','Google Tensor',699.00,6.4,128,'2021-10-28',4614,128,'Stormy Black',3,50),(4,'V60 ThinQ','Snapdragon 865',899.99,6.8,128,'2020-03-20',5000,256,'Classy Blue',4,75),(5,'Xperia 5 III','Snapdragon 888',949.99,6.1,128,'2021-08-30',4500,256,'Black',5,50),(6,'POCO M4 5G ','Mediatek Dimensity 700',159.99,16.71,4,'2021-01-08',5000,64,'Cool Blue',15,10),(7,'POCO C31 ','MediaTek Helio G35',119.99,16.59,4,'2021-01-11',5000,64,'Shadow Gray',15,10),(8,'POCO M4 5G ','Mediatek Dimensity 700',159.99,16.71,4,'2021-01-12',5000,64,'Yellow',15,10),(9,'REDMI 10 ','Qualcomm Snapdragon 680',149.99,17.02,4,'2021-01-13',6000,64,'Midnight Black',20,10),(10,'VIVO T1 44W ','Qualcomm Snapdragon 680',239.90,16.36,8,'2021-01-14',5000,128,'Midnight Galaxy',19,10),(11,'VIVO T1 44W ','Qualcomm Snapdragon 680',209.90,16.36,6,'2021-01-15',5000,128,'Starry Sky',19,10),(12,'INFINIX HOT 20 PLAY ','MediaTek G37',119.99,17.32,4,'2021-01-18',6000,64,'Racing Black',4,10),(13,'INFINIX HOT 20 PLAY ','MediaTek G37',119.99,17.32,4,'2021-01-19',6000,64,'Luna Blue',4,10),(14,'INFINIX HOT 20 PLAY ','MediaTek G37',119.99,17.32,4,'2021-01-20',6000,64,'Fantasy Purple',4,10),(15,'REDMI 9I SPORT ','MediaTek Helio G25',99.99,16.59,4,'2021-01-13',5000,64,'Carbon Black',20,10),(16,'INFINIX HOT 20 PLAY ','MediaTek G37',119.99,17.32,4,'2021-01-14',6000,64,'Aurora Green',4,10),(17,'POCO C31 ','MediaTek Helio G35',109.99,16.59,3,'2021-01-15',5000,32,'Shadow Gray',15,10),(18,'POCO C31 ','MediaTek G35',119.99,16.59,4,'2021-01-16',5000,64,'Royal Blue',15,10),(19,'APPLE IPHONE 11 ','A Bionic Chip',439.00,15.49,3,'2021-01-04',5000,64,'White',1,10),(20,'MOTOROLA G52 ','Qualcomm Snapdragon 680',179.99,16.76,4,'2020-04-19',5000,64,'Charcoal Grey',10,10),(21,'MOTOROLA G62 5G ','Qualcomm Snapdragon 695 5G',249.99,16.64,8,'2020-04-19',5000,128,'Midnight Gray',10,10),(22,'REALME C30 ','Unisoc T612',92.99,16.51,3,'2019-05-15',5000,32,'Bamboo Green',16,10),(23,'REALME C30 ','Unisoc T612',84.99,16.51,2,'2019-05-15',5000,32,'Lake Blue',16,10),(24,'VIVO T1 44W ','Qualcomm Snapdragon 680',239.90,16.36,8,'2021-01-15',5000,128,'Starry Sky',19,10),(25,'REALME C30 ','Unisoc T612',92.99,16.51,3,'2019-05-15',5000,32,'Lake Blue',16,10),(26,'REALME C30 ','Unisoc T612',92.99,16.51,3,'2019-05-15',5000,32,'Denim Black',16,25),(27,'POCO M4 PRO ','Mediatek Helio G96',179.99,16.33,6,'2019-05-16',5000,64,'Cool Blue',15,25),(28,'MOTOROLA G32 ','Qualcomm Snapdragon 680',169.99,16.64,4,'2020-04-19',5000,64,'Mineral Gray',10,25),(30,'MOTOROLA G52 ','Qualcomm Snapdragon 680',199.99,16.76,6,'2020-04-19',5000,128,'Metallic White',10,25),(31,'MOTOROLA G32 ','Qualcomm Snapdragon 680',169.99,16.64,4,'2020-04-19',5000,64,'Satin Silver',10,25),(32,'APPLE IPHONE 14 ','A Bionic Chip,  Core',799.00,15.49,4,'2021-01-04',5000,128,'Midnight',1,25),(33,'POCO M4 PRO ','Mediatek Helio G96',199.99,16.33,6,'2021-01-05',5000,128,'Cool Blue',15,25),(35,'REDMI 10 ','Qualcomm Snapdragon 680',169.99,17.02,6,'2021-01-13',6000,128,'Midnight Black',20,25),(36,'POCO M4 PRO 5G ','Mediatek Dimensity 810',199.99,16.76,6,'2021-01-14',5000,128,'Cool Blue',15,25),(37,'MOTOROLA G31 ','Mediatek Helio G85',139.99,16.26,4,'2020-04-19',5000,64,'Baby Blue',10,25),(38,'APPLE IPHONE 14 ','A Bionic Chip,  Core',799.00,15.49,6,'2021-01-04',5000,128,'Starlight',1,25),(41,'POCO M4 5G ','Mediatek Dimensity 700',189.99,16.71,6,'2022-06-13',5000,128,'Power Black',15,25),(42,'POCO C31 ','MediaTek Helio G35',109.99,16.59,3,'2022-06-14',5000,32,'Royal Blue',15,25),(43,'INFINIX NOTE 12I ','Mediatek Helio G85',129.99,17.02,4,'2022-06-15',5000,64,'Metaverse Blue',4,25),(44,'INFINIX NOTE 12I ','Mediatek Helio G85',129.99,17.02,4,'2022-06-16',5000,64,'Force Black',4,25),(45,'INFINIX HOT 12 ','Meditek Helio G37',129.99,17.32,4,'2022-06-17',6000,64,'Purple',4,25),(46,'INFINIX HOT 12 ','Meditek Helio G37',129.99,17.32,4,'2022-06-18',6000,64,'Exploratory Blue',4,25),(47,'REDMI 10 ','Qualcomm Snapdragon 680',149.99,17.02,4,'2021-01-13',6000,64,'Pacific Blue',20,25),(48,'APPLE IPHONE 11 ','A Bionic Chip',439.00,15.49,6,'2021-01-04',6000,64,'Black',1,25),(51,'MOTOROLA G62 5G ','Qualcomm Snapdragon 695 5G',249.99,16.64,8,'2020-04-19',5000,128,'Frosted Blue',10,25),(52,'MOTOROLA G31 ','Mediatek Helio G85',139.99,16.26,4,'2020-04-19',5000,64,'Meteorite Grey',10,25),(53,'INFINIX SMART 6 HD ','Mediatek Helio A22',89.99,16.76,2,'2020-04-20',5000,32,'Force Black',4,25),(54,'INFINIX SMART 6 HD ','Mediatek Helio A22',89.99,16.76,2,'2020-04-21',5000,32,'Aqua Sky',4,25),(55,'INFINIX SMART 6 HD ','Mediatek Helio A22',89.99,16.76,2,'2020-04-22',5000,32,'Origin Blue',4,25),(57,'POCO M4 5G ','Mediatek Dimensity 700',189.99,16.71,6,'2022-06-13',5000,128,'Cool Blue',15,25),(58,'APPLE IPHONE 14 ','A Bionic Chip,  Core',799.00,15.49,4,'2021-01-04',5000,128,'Purple',1,25),(60,'MOTOROLA E40 ','UNISOC T700',109.99,16.51,4,'2020-04-19',5000,64,'Carbon Gray',10,25),(61,'INFINIX HOT 12 ','Meditek Helio G37',129.99,17.32,4,'2020-04-20',6000,64,'Polar Black',4,25),(62,'INFINIX HOT 12 ','Meditek Helio G37',129.99,17.32,4,'2020-04-21',6000,64,'Turquoise Cyan',4,25),(63,'REDMI 9I SPORT ','MediaTek Helio G25',99.99,16.59,4,'2021-01-13',5000,64,'Coral Green',20,25),(65,'MOTOROLA E13 ','Unisoc T606',109.99,16.51,4,'2020-04-19',5000,64,'Cosmic Black',10,25),(66,'REALME C30 - LOCKED WITH AIRTEL PREPAID ','Unisoc T612',84.99,16.51,2,'2019-05-15',5000,32,'Denim Black',16,25),(67,'POCO M4 PRO ','Mediatek Helio G96',179.99,16.33,6,'2019-05-16',5000,64,'Yellow',15,25),(68,'MOTOROLA E13 ','Unisoc T606',109.99,16.51,4,'2020-04-19',5000,64,'Creamy White',10,25),(69,'POCO M4 PRO 5G ','Mediatek Dimensity 810',219.99,16.76,8,'2020-04-20',5000,128,'Power Black',15,25),(70,'POCO M4 PRO 5G ','Mediatek Dimensity 810',169.99,16.76,4,'2020-04-21',5000,64,'Cool Blue',15,25),(71,'POCO X4 PRO 5G ','Qualcomm Snapdragon 695 5G',239.99,16.94,6,'2020-04-22',5000,128,'Laser Black',15,25),(73,'POCO X4 PRO 5G ','Qualcomm Snapdragon 695 5G',239.99,16.94,6,'2022-06-13',5000,128,'Laser Blue',15,25),(74,'REALME C30 ','Unisoc T612',84.99,16.51,2,'2019-05-15',5000,32,'Bamboo Green',16,25),(75,'REALME C30 ','Unisoc T612',84.99,16.51,2,'2019-05-15',5000,32,'Denim Black',16,25),(77,'APPLE IPHONE 14 ','A Bionic Chip,  Core',799.00,15.49,6,'2021-01-04',5000,128,'Blue',1,25),(78,'INFINIX NOTE 12I ','Mediatek Helio G85',129.99,17.02,4,'2021-01-05',5000,64,'Alpine White',4,25),(79,'OPPO A17K ','Mediatek Helio P35',129.99,16.66,3,'2021-01-06',5000,64,'Gold',14,25),(80,'REALME 10 PRO+ 5G ','Mediatek Dimensity 1080 5G',279.99,17.02,8,'2019-05-15',5000,128,'Dark Matter',16,25),(81,'REDMI NOTE 10S ','Mediatek Helio G95',169.99,16.33,6,'2021-01-13',5000,64,'Frost White',20,25),(82,'POCO X4 PRO 5G ','Qualcomm Snapdragon 695 5G',259.99,16.94,8,'2021-01-14',5000,128,'Laser Blue',15,25),(83,'MOTOROLA G82 5G ','Qualcomm Snapdragon 695 5G',239.99,16.76,6,'2021-01-15',5000,128,'Meterorite Grey',10,25),(84,'POCO C50 ','Mediatek Helio A22, Upto 2.0 GHz',99.99,16.56,3,'2021-01-16',5000,32,'Country Green',15,25),(85,'MOTOROLA G82 5G ','Qualcomm Snapdragon 695 5G',259.99,16.76,8,'2020-04-19',5000,128,'White Lily',10,25),(86,'VIVO T1X ','Qualcomm Snapdragon 680',179.90,16.71,4,'2021-01-15',5000,128,'Gravity Black',19,25),(87,'VIVO T1X ','Qualcomm Snapdragon 680',169.90,16.71,4,'2021-01-15',5000,64,'Space Blue',19,25),(88,'VIVO T1X ','Qualcomm Snapdragon 680',169.90,16.71,4,'2021-01-15',5000,64,'Gravity Black',19,25),(89,'REDMI 10A ','Mediatek Helio G95',119.99,16.59,4,'2021-01-13',5000,64,'Slate grey',20,25),(90,'REDMI NOTE 11 SE ','Mediatek Helio G95 Octa Core',169.99,16.33,6,'2021-01-13',5000,64,'Cosmic White',20,25),(91,'ONEPLUS NORD CE 2 LITE 5G ','Mediatek Helio P35',199.99,16.74,6,'2021-01-14',5000,128,'Blue Tide',13,25),(92,'REALME C33 ','Unisoc T612',119.99,16.51,3,'2021-01-15',5000,32,'Night Sea',16,25),(93,'REALME C33 ','Unisoc T612',119.99,16.51,3,'2019-05-15',5000,32,'Sandy Gold',16,25),(94,'REALME C33 ','Unisoc T612',119.99,16.51,3,'2019-05-15',5000,32,'Aqua Blue',16,25),(95,'GOOGLE PIXEL 6A ','Google Tensor',439.99,15.6,6,'2019-05-16',4410,128,'Chalk',2,25),(96,'MOTOROLA G31 ','Mediatek Helio G85',169.99,16.26,6,'2020-04-19',5000,128,'Baby Blue',10,25),(97,'REALME NARZO 50 ','Mediatek Helio G96',159.99,16.76,4,'2019-05-15',5000,64,'Speed Blue',16,25),(98,'REALME NARZO 50 ','Mediatek Helio G96',159.99,16.76,4,'2019-05-15',5000,64,'Speed Black',16,25),(99,'POCO C50 ','Mediatek Helio A22, Upto 2.0 GHz',99.99,16.56,3,'2019-05-16',5000,32,'Royal Blue',15,25),(100,'OPPO F19 PRO+ 5G ','MediaTek Dimensity 800U',299.90,16.33,8,'2019-05-17',4310,128,'Fluid Black',14,50),(101,'POCO M4 PRO 5G ','Mediatek Dimensity 810',169.99,16.76,4,'2019-05-18',5000,64,'Yellow',15,50),(102,'OPPO K10 5G ','Mediatek Dimensity 810',259.99,16.66,8,'2019-05-19',5000,128,'Midnight Black',14,50),(103,'VIVO T1X ','Qualcomm Snapdragon 680',179.90,16.71,4,'2021-01-15',5000,128,'Space Blue',19,50),(104,'MOTOROLA G22 ','Mediatek Helio G37',139.99,16.51,4,'2020-04-19',5000,64,'Cosmic Black',10,50),(105,'INFINIX HOT 20 5G ','Dimensity 810',199.99,16.76,6,'2020-04-20',5000,128,'Blaster Green',4,50),(106,'VIVO T1X ','Qualcomm Snapdragon 680',189.90,16.71,6,'2021-01-15',5000,128,'Space Blue',19,50),(107,'REALME 10 PRO 5G ','Qualcomm Snapdragon 695 5G',229.99,17.07,8,'2019-05-15',5000,128,'Nebula Blue',16,50),(108,'REALME 10 PRO 5G ','Qualcomm Snapdragon 695 5G',209.99,17.07,6,'2019-05-15',5000,128,'Hyperspace',16,50),(109,'REALME 10 PRO 5G ','Qualcomm Snapdragon 695 5G',209.99,17.07,6,'2019-05-15',5000,128,'Dark Matter',16,50),(110,'REALME 10 PRO 5G ','Qualcomm Snapdragon 695 5G',209.99,17.07,6,'2019-05-15',5000,128,'Nebula Blue',16,50),(111,'MOTOROLA E13 ','Unisoc T606',109.99,16.51,4,'2020-04-19',5000,64,'Aurora Green',10,50),(112,'ONEPLUS NORD CE 2 LITE 5G ','Mediatek Dimensity 810',199.99,16.74,6,'2020-04-20',5000,128,'Black Dusk',13,50),(113,'APPLE IPHONE 11 ','A Bionic Chip',489.00,15.49,6,'2021-01-04',5000,128,'Black',1,50),(114,'REDMI 10A ','Mediatek Helio G95 Octa Core',104.99,16.59,3,'2021-01-13',5000,32,'Charcoal Black',20,50),(115,'APPLE IPHONE 12 ','A Bionic Chip with Next Generation Neural Engine',649.00,15.49,3,'2021-01-04',5000,128,'Black',1,50),(116,'REALME C35 ','Unisoc Tiger T616',139.99,16.76,4,'2019-05-15',5000,64,'Glowing Black',16,50),(117,'REALME C30S ','Unisoc SC9863A/ Unisoc SC9863A1',99.99,16.51,2,'2019-05-15',5000,32,'Stripe Blue',16,50),(118,'MOTOROLA G82 5G ','Qualcomm Snapdragon 695 5G',259.99,16.76,8,'2020-04-19',5000,128,'Meterorite Grey',10,50),(119,'REALME C33 ','Unisoc T612',129.99,16.51,4,'2019-05-15',5000,64,'Aqua Blue',16,50),(120,'REDMI 10 PRIME ','Helio G88',169.99,16.51,6,'2021-01-13',6000,128,'Astral White',20,50),(121,'REALME C33 ','Unisoc T612',129.99,16.51,4,'2019-05-15',5000,64,'Night Sea',16,50),(122,'REALME C33 ','Unisoc T612',129.99,16.51,4,'2019-05-15',5000,64,'Sandy Gold',16,50),(123,'REDMI 9I ','MediaTek Helio G25',99.99,16.59,4,'2021-01-13',5000,64,'Midnight Black',20,50),(124,'POCO M4 PRO ','Mediatek Helio G96',219.99,16.33,8,'2021-01-14',5000,128,'Power Black',15,50),(125,'MOTOROLA G22 ','Mediatek Helio G37',139.99,16.51,4,'2020-04-19',5000,64,'Iceberg Blue',10,50),(126,'VIVO T1X ','Qualcomm Snapdragon 680',189.90,16.71,6,'2021-01-15',5000,128,'Gravity Black',19,50),(127,'REDMI NOTE 12 PRO 5G ','Mediatek Dimensity 1080',279.99,16.94,6,'2021-01-13',5000,128,'Stardust Purple',20,50),(128,'REALME C35 ','Unisoc Tiger T616',139.99,16.76,4,'2019-05-15',5000,64,'Glowing Green',16,50),(129,'MOTOROLA G42 ','Qualcomm Snapdragon 680',169.99,16.43,4,'2020-04-19',5000,64,'Metallic Rose',10,50),(130,'POCO M4 PRO 5G ','Mediatek Dimensity 810',199.99,16.76,6,'2020-04-20',5000,128,'Yellow',15,50),(131,'POCO C50 ','Mediatek Helio A22, Upto 2.0 GHz',89.99,16.56,2,'2020-04-21',5000,32,'Country Green',15,50),(132,'POCO C50 ','Mediatek Helio A22, Upto 2.0 GHz',89.99,16.56,2,'2020-04-22',5000,32,'Royal Blue',15,50),(133,'REDMI 9 ACTIV ','Mediatek Helio G35',129.99,16.59,6,'2021-01-13',5000,128,'Coral Green',20,50),(134,'MOTOROLA E32 ','Mediatek Helio G37',119.99,16.51,4,'2020-04-19',5000,64,'Arctic Blue',10,50),(136,'REDMI NOTE 11 ','Mediatek Helio G35',189.99,16.33,6,'2021-01-13',5000,64,'Starburst White',20,50),(137,'REDMI NOTE 11 ','Mediatek Helio G35',179.99,16.33,4,'2021-01-13',5000,64,'Space Black',20,50),(138,'GOOGLE PIXEL 6A ','Google Tensor',439.99,15.6,6,'2021-01-14',4410,128,'Charcoal',2,50),(139,'OPPO F21 PRO ','Mediatek Dimensity 810',279.99,16.33,8,'2021-01-15',4500,128,'Sunset Orange',14,50),(140,'INFINIX HOT 12 PRO ','Unisoc T616',139.99,16.76,6,'2021-01-16',5000,64,'Lightsaber Green',4,50),(142,'APPLE IPHONE 13 ','A Bionic Chip',699.00,15.49,3,'2021-01-04',5000,128,'Pink',1,50),(143,'INFINIX HOT 12 PRO ','Unisoc T616',139.99,16.76,6,'2021-01-05',5000,64,'Electric Blue',4,50),(144,'APPLE IPHONE 13 ','A Bionic Chip',699.00,15.49,4,'2021-01-04',5000,128,'Blue',1,50),(145,'REALME NARZO 50 ','Mediatek Helio G96',179.99,16.76,6,'2019-05-15',5000,128,'Speed Black',16,50),(146,'REALME 9I 5G ','Mediatek Dimensity 810 5G',179.99,16.76,4,'2019-05-15',5000,64,'Rocking Black',16,50),(147,'REALME NARZO 50 ','Mediatek Helio G96',179.99,16.76,6,'2019-05-15',5000,128,'Speed Blue',16,50),(148,'INFINIX NOTE 12 5G ','Mediatek Dimensity 810 5G',199.99,17.02,6,'2019-05-16',5000,64,'Force Black',4,50),(149,'INFINIX NOTE 12 5G ','Mediatek Dimensity 810 5G',199.99,17.02,6,'2019-05-17',5000,64,'Snowfall',4,50),(150,'OPPO K10 5G ','Mediatek Dimensity 810',259.99,16.66,8,'2019-05-18',5000,128,'Ocean Blue',14,50),(151,'REDMI 9I SPORT ','MediaTek Helio G25',99.99,16.59,4,'2021-01-13',5000,64,'Metallic Blue',20,50),(152,'ONEPLUS NORD CE 2 LITE 5G ','Mediatek Dimensity 810',199.99,16.74,6,'2021-01-14',5000,128,'Blue Tide',13,50),(153,'OPPO F19 PRO+ 5G ','MediaTek Dimensity 800U',299.90,16.33,8,'2021-01-15',4310,128,'Space Silver',14,50),(155,'OPPO A17 ','Mediatek Helio G35',149.99,16.66,4,'2022-06-13',5000,64,'Midnight Black',14,50),(156,'REALME C35 ','Unisoc Tiger T616',149.99,16.76,4,'2019-05-15',5000,128,'Glowing Green',16,50),(157,'REALME C35 ','Unisoc Tiger T616',149.99,16.76,4,'2019-05-15',5000,128,'Glowing Black',16,50),(158,'REALME C35 ','Unisoc Tiger T616',159.99,16.76,6,'2019-05-15',5000,128,'Glowing Black',16,50),(159,'VIVO T1 5G ','Qualcomm Snapdragon 695',199.90,16.71,4,'2021-01-15',5000,128,'Starlight Black',19,50),(160,'REDMI 10 ','Qualcomm Snapdragon 680',169.99,17.02,6,'2021-01-13',6000,128,'Caribbean Green',20,50),(161,'INFINIX HOT 20 5G ','Dimensity 810',199.99,16.76,6,'2021-01-14',5000,128,'Space Blue',4,50),(162,'APPLE IPHONE 13 ','A Bionic Chip',699.00,15.49,4,'2021-01-04',5000,128,'Starlight',1,50),(163,'REALME C30S ','Unisoc SC9863A/ Unisoc SC9863A1',99.99,16.51,2,'2019-05-15',5000,32,'Stripe Black',16,50),(164,'POCO M4 PRO ','Mediatek Helio G96',199.99,16.33,6,'2019-05-16',5000,128,'Yellow',15,50),(165,'REALME 9I 5G ','Mediatek Dimensity 810 5G',179.99,16.76,4,'2019-05-15',5000,64,'Metallica Gold',16,50),(166,'MOTOROLA G62 5G ','Qualcomm Snapdragon 695 5G',219.99,16.64,6,'2020-04-19',5000,128,'Frosted Blue',10,50),(167,'REALME 10 ','Mediatek Helio G99 Octa Core',159.99,16.26,4,'2019-05-15',5000,64,'Clash White',16,50),(168,'REALME 10 ','Mediatek Helio G99 Octa Core',159.99,16.26,4,'2019-05-15',5000,64,'Rush Black',16,50),(169,'REALME 10 ','Mediatek Helio G99 Octa Core',199.99,16.26,8,'2019-05-15',5000,128,'Rush Black',16,50),(170,'REDMI A1 ','Qualcomm Snapdragon 680',89.99,16.56,2,'2021-01-13',5000,32,'Light Green',20,50),(171,'MOTOROLA G72 ','Mediatek Helio G99',219.99,16.64,6,'2020-04-19',5000,128,'Polar Blue',10,50),(172,'POCO X5 PRO 5G ','Qualcomm Snapdragon 778G',289.99,16.94,8,'2020-04-20',5000,256,'Yellow',15,50),(173,'REALME 10 PRO+ 5G ','Mediatek Dimensity 1080 5G',259.99,17.02,6,'2019-05-15',5000,128,'Dark Matter',16,50),(175,'MOTOROLA G82 5G','Qualcomm Snapdragon 695 5G',239.99,16.76,6,'2020-04-19',5000,128,'White Lily',10,50),(176,'POCO X5 PRO 5G ','Qualcomm Snapdragon 778G',289.99,16.94,8,'2020-04-20',5000,256,'Horizon Blue',15,50),(177,'REDMI A1 ','Qualcomm Snapdragon 680',89.99,16.56,2,'2021-01-13',5000,32,'Black',20,50),(178,'REALME C31 ','Unisoc T612',109.99,16.56,3,'2019-05-15',5000,32,'Light Silver',16,50),(179,'REALME C31 ','Unisoc T612',109.99,16.56,3,'2019-05-15',5000,32,'Dark Green',16,50),(180,'POCO M4 PRO 5G ','Mediatek Dimensity 810',219.99,16.76,8,'2019-05-16',5000,128,'Cool Blue',15,50),(181,'OPPO A17 ','Mediatek Helio G35',149.99,16.66,4,'2019-05-17',5000,64,'Sunlight Orange',14,50),(182,'REDMI 9 ACTIV ','Mediatek Helio G35',129.99,16.59,6,'2021-01-13',5000,128,'Carbon Black',20,50),(183,'POCO X5 PRO 5G ','Qualcomm Snapdragon 778G',289.99,16.94,8,'2021-01-14',5000,256,'Astral Black',15,50),(184,'OPPO RENO8T 5G ','Qualcomm Snapdragon 695',389.99,17.02,8,'2021-01-15',4800,128,'Midnight Black',14,50),(185,'OPPO F19 ','Qualcomm Snapdragon 662',209.90,16.33,6,'2021-01-16',5000,128,'Midnight Blue',14,50),(186,'POCO X4 PRO 5G ','Qualcomm Snapdragon 695 5G',259.99,16.94,8,'2021-01-17',5000,128,'Yellow',15,50),(187,'REDMI NOTE 11 ','Mediatek Helio G35',199.99,16.33,6,'2021-01-13',5000,128,'Horizon Blue',20,50),(188,'VIVO Y16 ','Mediatek Helio P35',159.99,16.54,4,'2021-01-15',5000,64,'Steller Black',19,50),(189,'REALME 9I 5G ','Mediatek Dimensity 810 5G',179.99,16.76,4,'2019-05-15',5000,64,'Soulful Blue',16,50),(192,'INFINIX HOT 12 PRO ','Unisoc T616',159.99,16.76,8,'2022-06-13',5000,128,'Halo White',4,50),(194,'REDMI 10A ','Mediatek Helio G35',119.99,16.59,4,'2021-01-13',5000,64,'Sea Blue',20,50),(195,'REDMI 10A ','Mediatek Helio G35',109.99,16.59,3,'2021-01-13',5000,32,'Sea Blue',20,50),(196,'POCO X5 PRO 5G ','Qualcomm Snapdragon 778G',259.99,16.94,6,'2021-01-14',5000,128,'Horizon Blue',15,50),(197,'MOTOROLA G62 5G ','Qualcomm Snapdragon 695 5G',219.99,16.64,6,'2021-01-15',5000,128,'Midnight Gray',10,50),(199,'MOTOROLA G42 ','Qualcomm Snapdragon 680',169.99,16.43,4,'2020-04-19',5000,64,'Atlantic Green',10,50),(200,'POCO M4 PRO 5G ','Mediatek Dimensity 810',219.99,16.76,8,'2020-04-20',5000,128,'Yellow',15,50),(201,'REALME C31 ','Unisoc T612',119.99,16.56,4,'2019-05-15',5000,64,'Light Silver',16,50),(202,'REALME C31 ','Unisoc T612',119.99,16.56,4,'2019-05-15',5000,64,'Dark Green',16,50),(203,'VIVO Y01 ','Mediatek Helio P35',129.99,16.54,2,'2021-01-15',5000,32,'Sapphire Blue',19,50),(204,'VIVO Y21 ','Mediatek Helio P35',179.90,16.54,4,'2021-01-15',5000,64,'Diamond Glow',19,50),(206,'POCO X4 PRO 5G ','Qualcomm Snapdragon 695 5G',239.99,16.94,6,'2022-06-13',5000,128,'Yellow',15,50),(207,'REDMI 10 PRIME ','Helio G88',169.99,16.51,6,'2021-01-13',6000,128,'Phantom Black',20,50),(208,'INFINIX HOT 20 5G ','Dimensity 810',199.99,16.76,6,'2021-01-14',5000,128,'Racing Black',4,50),(209,'VIVO Y02 ','MediaTek P22',129.99,16.54,3,'2021-01-15',5000,32,'Cosmic Grey',19,50),(210,'POCO M4 5G ','Mediatek Dimensity 700',189.99,16.71,6,'2021-01-16',5000,128,'Yellow',15,50),(211,'VIVO Y16 ','Mediatek Helio P35',129.99,16.54,3,'2021-01-17',5000,32,'Drizzling Gold',19,50),(212,'REALME C35 ','Unisoc Tiger T616',159.99,16.76,6,'2019-05-15',5000,128,'Glowing Green',16,50),(213,'REDMI NOTE 12 PRO 5G ','Mediatek Dimensity 1080',319.99,16.94,8,'2021-01-13',5000,256,'Onyx Black',20,50),(214,'VIVO T1 5G ','Qualcomm Snapdragon 695',239.90,16.71,8,'2021-01-15',5000,128,'Rainbow Fantasy',19,50),(215,'VIVO T1 5G ','Qualcomm Snapdragon 695',239.90,16.71,8,'2021-01-15',5000,128,'Starlight Black',19,50),(216,'REDMI NOTE 12 PRO 5G ','Mediatek Dimensity 1080',319.99,16.94,8,'2021-01-13',5000,256,'Stardust Purple',20,50),(217,'INFINIX NOTE 12 PRO 5G ','Mediatek Dimensity 810 5G',249.99,17.02,8,'2021-01-14',5000,128,'Force Black',4,50),(218,'MOTOROLA EDGE 30 ','Qualcomm Snapdragon 778G Plus',309.99,16.64,6,'2020-04-19',4020,128,'Aurora Green',10,50),(219,'NOTHING PHONE ','Qualcomm Snapdragon 778G+',429.99,16.64,4,'2018-01-11',4500,64,' Grey',12,50),(220,'INFINIX NOTE 12 PRO 5G ','Mediatek Dimensity 810 5G',249.99,17.02,8,'2018-01-12',5000,128,'Snowfall',4,50),(221,'POCO X4 PRO 5G ','Qualcomm Snapdragon 695 5G',229.99,16.94,6,'2018-01-13',5000,64,'Laser Blue',15,50),(222,'REDMI NOTE 12 PRO 5G ','Mediatek Dimensity 1080',279.99,16.94,6,'2021-01-13',5000,128,'Glacier Blue',20,50),(223,'INFINIX SMART 6 ','Mediatek Helio A22',89.99,16.76,2,'2021-01-14',5000,64,'Light Sea Green',4,50),(225,'OPPO K10 ','Qualcomm Snapdragon 680',189.99,16.74,6,'2022-06-13',5000,128,'Blue Flame',14,50),(226,'VIVO T1 PRO 5G ','Qualcomm Snapdragon 778G 5G Mobile Platform',289.90,16.36,6,'2021-01-15',4700,128,'Turbo Black',19,50),(227,'REALME C11 2021 ','Octa-core',79.99,16.51,2,'2019-05-15',5000,32,'Cool Blue',16,50),(228,'REALME C11 2021 ','Octa-core',79.99,16.51,2,'2019-05-15',5000,32,'Cool Grey',16,50),(229,'INFINIX HOT 12 PRO ','Unisoc T616',139.99,16.76,6,'2019-05-16',5000,64,'Racing Black',4,50),(230,'MOTOROLA EDGE 20 5G ','Qualcomm Snapdragon 778G',349.99,17.02,8,'2020-04-19',4000,128,'Frosted Pearl',10,50),(231,'MOTOROLA E32 ','Mediatek Helio G37',119.99,16.51,4,'2020-04-19',5000,64,'Eco Black',10,50),(232,'INFINIX HOT 12 PRO ','Unisoc T616',139.99,16.76,6,'2020-04-20',5000,64,'Halo White',4,50),(233,'INFINIX HOT 12 PRO ','Unisoc T616',159.99,16.76,8,'2020-04-21',5000,128,'Electric Blue',4,50),(234,'VIVO Y35 ','Qualcomm Snapdragon 680',229.99,16.71,8,'2021-01-15',5000,128,'Dawn Gold',19,50),(235,'REALME 10 PRO+ 5G ','Mediatek Dimensity 1080 5G',259.99,17.02,6,'2019-05-15',5000,128,'Hyperspace',16,50),(236,'REALME 10 PRO+ 5G ','Mediatek Dimensity 1080 5G',259.99,17.02,6,'2019-05-15',5000,128,'Nebula Blue',16,50),(237,'REALME 10 PRO+ 5G ','Mediatek Dimensity 1080 5G',279.99,17.02,8,'2019-05-15',5000,128,'Hyperspace',16,100),(239,'APPLE IPHONE 14 ','A Bionic Chip,  Core',799.00,15.49,4,'2021-01-04',4500,128,'Lavender',1,100),(240,'INFINIX ZERO 5G 2023 ','Mediatek Dimensity 920',249.99,17.22,3,'2021-01-05',5000,128,'Coral Orange',4,100),(241,'I KALL Z19PRO ','Octa Core',104.99,16.51,4,'2021-01-06',5000,64,'Blue',3,100),(242,'REDMI NOTE 12 PRO 5G ','Mediatek Dimensity 1080',279.99,16.94,6,'2021-01-13',5000,128,'Onyx Black',20,100),(243,'INFINIX ZERO 5G 2023 ','Mediatek Dimensity 920',249.99,17.22,6,'2021-01-14',5000,128,'Submariner Black',4,100),(244,'REALME C30 - LOCKED WITH AIRTEL PREPAID ','Unisoc T612',92.99,16.51,4,'2019-05-15',5000,32,'Bamboo Green',16,100),(245,'REDMI NOTE 12 PRO 5G ','Mediatek Dimensity 1080',319.99,16.94,6,'2021-01-13',5000,256,'Glacier Blue',20,100),(246,'APPLE IPHONE 14 PLUS ','A Bionic Chip,  Core',899.00,17.02,6,'2021-01-04',5000,128,'Midnight',1,100),(248,'APPLE IPHONE 14 PLUS ','A Bionic Chip,  Core',899.00,17.02,3,'2021-01-04',5000,128,'Purple',1,100),(249,'OPPO RENO8T 5G ','Qualcomm Snapdragon 695',389.99,17.02,4,'2021-01-05',4800,128,'Sunrise Gold',14,100),(250,'MOTOROLA EDGE 30 ','Qualcomm Snapdragon 778G Plus',349.99,16.64,4,'2020-04-19',4020,128,'Meteor Grey',10,100),(251,'MOTOROLA E13 ','Unisoc T606',99.99,16.51,2,'2020-04-19',5000,64,'Creamy White',10,100),(252,'APPLE IPHONE 14 PLUS ','A Bionic Chip,  Core',899.00,17.02,4,'2021-01-04',5000,128,'Starlight',1,100),(253,'INFINIX HOT 20 5G ','Dimensity 810',179.99,16.76,3,'2021-01-05',5000,64,'Blaster Green',4,100),(254,'REDMI 10A ','Mediatek Dimensity 1080',109.99,16.59,4,'2021-01-13',5000,32,'Slate Grey',20,100),(255,'VIVO Y15S ','Mediatek Helio P35',139.90,16.54,6,'2021-01-15',5000,32,'Wave Green',19,100),(256,'VIVO Y16 ','Mediatek Helio P35',139.99,16.54,6,'2021-01-15',5000,64,'Steller Black',19,100),(257,'VIVO Y16 ','Mediatek Helio P35',159.99,16.54,4,'2021-01-15',5000,64,'Drizzling Gold',19,100),(258,'APPLE IPHONE 14 ','A Bionic Chip,  Core',899.00,15.49,6,'2021-01-04',5000,256,'Purple',1,100),(259,'INFINIX SMART 6 ','Mediatek Helio A22',89.99,16.76,6,'2021-01-05',5000,64,'Polar Black',4,100),(260,'INFINIX SMART 6 ','Mediatek Helio A22',89.99,16.76,3,'2021-01-06',5000,64,'Heart Of Ocean',4,100),(261,'INFINIX SMART 6 ','Mediatek Helio A22',89.99,16.76,3,'2021-01-07',5000,64,'Starry Purple',4,100),(262,'ONEPLUS NORD CE 2 LITE 5G ','Qualcomm Snapdragon 695',199.99,16.74,4,'2021-01-08',5000,128,'Blue Tide',13,100),(263,'ONEPLUS NORD CE 2 LITE 5G ','Qualcomm Snapdragon 695',179.99,16.74,4,'2021-01-09',5000,128,'Blue Tide',13,100),(264,'POCO X4 PRO 5G ','Qualcomm Snapdragon 695 5G',259.99,16.94,8,'2021-01-10',5000,128,'Laser Black',15,100),(265,'MOTOROLA EDGE 30 ','Qualcomm Snapdragon 778G Plus',309.99,16.64,6,'2020-04-19',4020,128,'Meteor Grey',10,100),(266,'REDMI NOTE 11 ','Mediatek Dimensity 1080',199.99,16.33,6,'2021-01-13',5000,128,'Space Black',20,100),(267,'IQOO Z6 44W ','A Bionic Chip',179.99,16.36,6,'2021-01-14',5000,128,'Raven Black',5,100),(268,'INFINIX HOT 12 PRO ','Unisoc T616',159.99,16.76,8,'2021-01-15',5000,128,'Lightsaber Green',4,100),(269,'MICROMAX IN 2C ','Unisoc T610',94.99,16.56,3,'2021-01-16',5000,32,'Silver',9,100),(270,'OPPO F19 ','Qualcomm Snapdragon 662',209.90,16.33,6,'2021-01-17',5000,128,'Prism Black',14,100),(272,'MOTOROLA E13 ','Unisoc T606',99.99,16.51,2,'2020-04-19',5000,64,'Cosmic Black',10,100),(273,'INFINIX NOTE 12 PRO ','Mediatek Helio G99',219.99,17.02,8,'2020-04-20',5000,256,'Volcanic Grey',4,100),(274,'INFINIX NOTE 12 PRO ','Mediatek Helio G99',219.99,17.02,8,'2020-04-21',5000,256,'Tuscany Blue',4,100),(276,'REALME 9I 5G ','Mediatek Dimensity 810 5G',199.99,16.76,6,'2019-05-15',5000,128,'Rocking Black',16,100),(277,'OPPO K10 ','Qualcomm Snapdragon 680',189.99,16.74,6,'2019-05-16',5000,128,'Black Carbon',14,100),(278,'REDMI 10A SPORT ','Mediatek Dimensity 1080',139.99,16.59,6,'2021-01-13',5000,128,'SLATE GREY',20,100),(280,'POCO X5 PRO 5G ','Qualcomm Snapdragon 778G',259.99,16.94,6,'2022-06-13',5000,128,'Astral Black',15,100),(281,'ITEL VISION3 ','Unisoc 9863A',79.99,16.76,2,'2022-03-20',5000,32,'Jewel Blue',6,100),(282,'REALME NARZO 50A PRIME ','A Bionic Chip',134.99,16.76,4,'2019-05-15',5000,64,'Flash Black',16,100),(283,'OPPO A77S ','Qualcomm Snapdragon 680',229.99,16.66,8,'2019-05-16',5000,128,'Starry Black',14,100),(284,'MOTOROLA E13 ','Unisoc T606',99.99,16.51,2,'2020-04-19',5000,64,'Aurora Green',10,100),(285,'INFINIX NOTE 12 ','MediaTek Helio G88',159.99,17.02,4,'2020-04-20',5000,64,'Force Black',4,100),(286,'INFINIX NOTE 12 ','MediaTek Helio G88',159.99,17.02,4,'2020-04-21',5000,64,'Jewel Blue',4,100),(287,'VIVO T1 5G ','Qualcomm Snapdragon 695',209.90,16.71,6,'2021-01-15',5000,128,'Starlight Black',19,100),(288,'VIVO T1 5G ','Turbo Snapdragon 695',199.90,16.71,4,'2021-01-15',5000,128,'Rainbow Fantasy',19,100),(289,'VIVO T1 5G ','Qualcomm Snapdragon 695',209.90,16.71,6,'2021-01-15',5000,128,'Rainbow Fantasy',19,100),(290,'TECNO POVA 3 ','MediaTek Helio G88',149.99,17.53,4,'2023-01-01',7000,64,'Eco Black',18,100),(291,'TECNO POVA 3 ','MediaTek Helio G88',144.99,17.53,4,'2023-01-01',7000,64,'Electric Blue',18,100),(292,'REALME C11 2021 ','Octa-core',99.99,16.51,4,'2019-05-15',5000,64,'Cool Grey',16,100),(293,'REALME C11 2021 ','Octa-core',99.99,16.51,4,'2019-05-15',5000,64,'Cool Blue',16,100),(294,'INFINIX SMART 6 PLUS ','Mediatek Helio G25',99.99,17.32,3,'2019-05-16',5000,64,'Tranquil Sea Blue',4,100),(295,'REDMI NOTE 10 PRO ','Qualcomm Snapdragon 732G',199.99,16.94,6,'2021-01-13',5020,128,'Vintage Bronze',20,100),(296,'APPLE IPHONE 14 ','A Bionic Chip,  Core',899.00,15.49,2,'2021-01-04',5020,256,'Midnight',1,100),(298,'REALME C30S ','Unisoc SC9863A/ Unisoc SC9863A1',119.99,16.51,4,'2019-05-15',5000,64,'Stripe Black',16,100),(299,'REALME C30S ','Unisoc SC9863A/ Unisoc SC9863A1',119.99,16.51,4,'2019-05-15',5000,64,'Stripe Blue',16,100),(301,'INFINIX HOT 20 5G ','Dimensity 810',179.99,16.76,4,'2022-06-13',5000,64,'Racing Black',4,100),(303,'IQOO Z6 44W ','A Bionic Chip',179.99,16.36,6,'2022-06-13',5000,128,'Ravan Black',5,100),(304,'REDMI NOTE 11 ','Qualcomm Snapdragon 732G',179.99,16.33,4,'2022-06-14',5000,64,'Horizon Blue',20,100),(305,'ONEPLUS NORD CE 2 LITE 5G ','Qualcomm Snapdragon 680',199.99,16.74,6,'2022-06-15',5000,128,'Black Dusk',13,100),(306,'REALME C21 ','MediaTek Helio G35',99.99,16.51,3,'2019-05-15',5000,32,'Cross Blue',16,100),(307,'REALME C21 ','MediaTek Helio G35',109.99,16.51,4,'2019-05-15',5000,64,'Cross Black',16,100),(308,'REDMI NOTE 11S ','Qualcomm Snapdragon 732G',209.99,16.33,6,'2021-01-13',5000,128,'Horizon Blue',20,100),(309,'APPLE IPHONE 14 ','A Bionic Chip,  Core',899.00,15.49,2,'2021-01-04',5000,256,'Starlight',1,100),(310,'ITEL VISION3 ','Unisoc 9863A',79.99,16.76,2,'2021-01-05',5000,32,'Multi Green',6,100),(311,'INFINIX ZERO 20 ','Mediatek G99',249.99,17.02,8,'2021-01-06',4500,128,'Glitter Gold',4,100),(312,'INFINIX ZERO 20 ','Mediatek G99',249.99,17.02,8,'2021-01-07',4500,128,'DEEP GRAY',4,100),(313,'VIVO Y01 ','Mediatek Helio P35',129.99,16.54,2,'2021-01-08',5000,32,'Elegant Black',19,75),(314,'OPPO A77S ','Qualcomm Snapdragon 680',229.99,16.66,8,'2021-01-09',5000,128,'Sunset Orange',14,75),(315,'IQOO Z6 LITE 5G ','A Bionic Chip',159.99,16.97,4,'2021-01-10',5000,64,'Mystic Night',5,75),(316,'ONEPLUS NORD CE 2 LITE 5G ','Qualcomm Snapdragon 680',199.99,16.74,6,'2021-01-11',5000,128,'Black Dusk',13,75),(317,'VIVO Y33S ','MediaTek Helio G80',219.90,16.71,8,'2021-01-15',5000,128,'Mirror Black',19,75),(318,'REDMI 11 PRIME 5G ','Qualcomm Snapdragon 732G',159.99,16.71,4,'2021-01-13',5000,64,'Meadow Green',20,75),(319,'VIVO Y35 ','Qualcomm Snapdragon 680',229.99,16.71,8,'2021-01-15',5000,128,'Agate Black',19,75),(320,'REDMI 11 PRIME 5G ','Qualcomm Snapdragon 732G',179.99,16.71,6,'2021-01-13',5000,128,'Meadow Green',20,75),(321,'INFINIX HOT 12 PLAY ','Unisoc T610',119.99,17.32,4,'2021-01-14',6000,64,'Champagne Gold',4,75),(322,'INFINIX HOT 12 PLAY ','Unisoc T610',119.99,17.32,4,'2021-01-15',6000,64,'Horizon Blue',4,75),(323,'INFINIX HOT 12 PLAY ','Unisoc T610',119.99,17.32,4,'2021-01-16',6000,64,'Daylight Green',4,75),(324,'VIVO Y75 ','Mediatek G96',259.90,16.36,8,'2021-01-15',4050,128,'Dancing waves',19,75),(325,'NOTHING PHONE ','Qualcomm Snapdragon 778G+',399.99,16.64,8,'2018-01-11',4500,64,' Grey',12,75),(326,'NOTHING PHONE ','Qualcomm Snapdragon 778G+',429.99,16.64,8,'2018-01-11',4500,64,' Grey',12,75),(327,'NOTHING PHONE ','Qualcomm Snapdragon 778G+',399.99,16.64,8,'2018-01-11',4500,64,' Grey',12,75),(328,'REDMI NOTE 12 PRO 5G ','Mediatek Dimensity 1080',299.99,16.94,8,'2021-01-13',5000,128,'Glacier Blue',20,75),(329,'NOTHING PHONE ','Qualcomm Snapdragon 778G+',379.99,16.64,8,'2018-01-11',4500,64,' Grey',12,75),(330,'APPLE IPHONE 14 PLUS ','A Bionic Chip,  Core',999.00,17.02,2,'2021-01-04',4500,64,' Grey',1,75),(332,'REDMI NOTE 12 PRO+ 5G ','Mediatek Dimensity 1080',369.99,16.94,4,'2021-01-13',4980,256,'Iceberg Blue',20,75),(333,'VIVO Y100 5G ','Mediatek Dimensity 900',299.99,16.21,8,'2021-01-15',4500,128,'Metal Black',19,75),(334,'VIVO Y100 5G ','Mediatek Dimensity 900',299.99,16.21,8,'2021-01-15',4500,128,'Pacific Blue',19,75),(335,'VIVO Y100 5G ','Mediatek Dimensity 900',299.99,16.21,8,'2021-01-15',4500,128,'Twilight Gold',19,75),(336,'INFINIX SMART 6 PLUS ','Mediatek Helio G25',99.99,17.32,3,'2021-01-16',5000,64,'Miracle Black',4,75),(337,'REDMI NOTE 11 ','Mediatek Dimensity 1080',189.99,16.33,6,'2021-01-17',5000,64,'Horizon Blue',20,75),(338,'MICROMAX IN 2C ','Unisoc T610',94.99,16.56,3,'2021-01-18',5000,32,'Brown',9,75),(339,'INFINIX ZERO 20 ','Mediatek G99',249.99,17.02,8,'2021-01-19',4500,128,'Green Fantasy',4,75),(340,'REDMI NOTE 12 5G ','Mediatek Dimensity 1080',199.99,16.94,4,'2021-01-13',5000,128,'Frosted Green',20,75),(341,'REDMI NOTE 12 PRO 5G ','Mediatek Dimensity 1080',299.99,16.94,8,'2021-01-13',5000,128,'Onyx Black',20,75),(342,'REDMI 10 POWER ','Mediatek Dimensity 1080',189.99,17.02,8,'2021-01-13',6000,128,'Power Black',20,75),(343,'REDMI NOTE 12 PRO+ 5G ','Mediatek Dimensity 1080',339.99,16.94,8,'2021-01-13',4980,256,'Iceberg Blue',20,75),(345,'OPPO F19S ','Qualcomm Snapdragon 662',229.90,16.33,6,'2022-06-13',5000,128,'Glowing Gold',14,75),(346,'MOTOROLA G60 ','Qualcomm Snapdragon 732G',219.99,17.22,6,'2020-04-19',6000,128,'Moonless',10,75),(348,'REALME 10 ','Mediatek Helio G99 Octa Core',199.99,16.26,8,'2019-05-15',5000,128,'Clash White',16,75),(349,'VIVO T1 PRO 5G ','Qualcomm Snapdragon 778G 5G Mobile Platform',309.90,16.36,8,'2021-01-15',4700,128,'Turbo Black',19,75),(350,'REDMI 9A SPORT ','Mediatek Dimensity 1080',94.99,16.59,3,'2021-01-13',5000,32,'Coral Green',20,75),(351,'REDMI 9A SPORT ','Mediatek Dimensity 1080',84.99,16.59,2,'2021-01-13',5000,32,'Coral Green',20,75),(352,'REDMI 9A SPORT ','Mediatek Dimensity 1080',84.99,16.59,2,'2021-01-13',5000,32,'Carbon Black',20,75),(353,'TECNO SPARK 9 ','MediaTek Helio G37',99.99,16.76,6,'2023-01-01',5000,128,'Infinity Black',18,75),(354,'POCO M5 ','Mediatek Helio G99',159.99,16.71,4,'2023-01-02',5000,64,'Icy Blue',15,75),(355,'TECNO CAMON 19 ','MediaTek Helio G85',189.99,17.27,6,'2023-01-01',5000,128,'Memphis Green',18,75),(356,'INFINIX HOT 12 PLAY ','Unisoc T610',119.99,17.32,4,'2023-01-02',6000,64,'Racing Black',4,75),(358,'INFINIX ZERO 5G 2023 TURBO ','Mediatek Dimensity 1080',249.99,17.22,8,'2022-06-13',5000,256,'Coral Orange',4,75),(359,'VIVO Y02 ','MediaTek P22',129.99,16.54,3,'2022-06-14',5000,32,'Orchid Blue',19,75),(360,'INFINIX NOTE 12 ','MediaTek Helio G88',179.99,17.02,6,'2022-06-15',5000,128,'Jewel Blue',4,75),(361,'APPLE IPHONE 12 ','A Bionic Chip with Next Generation Neural Engine',599.00,15.49,2,'2022-06-16',5000,64,'Black',1,75),(362,'MOTOROLA EDGE 30 FUSION ','Qualcomm Snapdragon 888 +',499.99,16.64,8,'2022-06-17',4400,128,'Solar Gold',10,75),(363,'POCO M4 PRO ','Mediatek Helio G96',219.99,16.33,8,'2022-06-18',5000,128,'Cool Blue',15,75),(366,'REALME NARZO 50A PRIME ','A Bionic Chip',134.99,16.76,4,'2019-05-15',5000,64,'FLASH BLUE',16,75),(367,'MOTOROLA G31 ','Mediatek Helio G85',169.99,16.26,6,'2020-04-19',5000,128,'Meteorite Grey',10,75),(368,'REALME C20 ','MediaTek Helio G35',79.99,16.51,2,'2019-05-15',5000,32,'Cool Grey',16,75),(370,'MOTOROLA E40 ','UNISOC T700',109.99,16.51,4,'2020-04-19',5000,64,'Pink Clay',10,75),(371,'TECNO POP 6 PRO ','Unisoc SC9863A',179.99,16.66,2,'2023-01-01',5000,32,'Polar Black',18,75),(373,'GOOGLE PIXEL 7 ','Google Tensor G2',599.99,16,8,'2022-06-13',4270,128,'Lemongrass',2,75),(374,'GOOGLE PIXEL 7 ','Google Tensor G2',599.99,16,8,'2022-06-14',4270,128,'Obsidian',2,75),(375,'APPLE IPHONE 14 PLUS ','A Bionic Chip,  Core',899.00,17.02,2,'2021-01-04',4270,128,'Obsidian',1,75),(376,'POCO M5 ','Mediatek Helio G99',189.99,16.71,6,'2021-01-05',5000,128,'Icy Blue',15,75),(377,'REALME 9 PRO 5G ','Qualcomm Snapdragon 695',219.99,16.76,6,'2019-05-15',5000,128,'Sunrise Blue',16,75),(378,'APPLE IPHONE 11 ','A Bionic Chip',489.00,15.49,2,'2021-01-04',5000,128,'Red',1,75),(379,'REALME 9I 5G ','Mediatek Dimensity 810 5G',199.99,16.76,6,'2019-05-15',5000,128,'Metallica Gold',16,75),(380,'IQOO Z6 LITE 5G ','A Bionic Chip',179.99,16.97,6,'2019-05-16',5000,128,'Metallica Gold',5,75),(381,'TECNO POP 5 LTE ','Unisoc SC9863A',65.99,16.56,2,'2023-01-01',5000,32,'Ice Blue',18,75),(382,'APPLE IPHONE 12 ','A Bionic Chip with Next Generation Neural Engine',599.00,15.49,4,'2021-01-04',5000,64,'Purple',1,75),(383,'MOTOROLA EDGE 30 ','Qualcomm Snapdragon 778G Plus',349.99,16.64,8,'2020-04-19',4020,128,'Aurora Green',10,75),(385,'VIVO Y33T ','A Bionic Chip',229.90,16.71,8,'2021-01-15',5000,128,'Starry Gold',19,75),(386,'REALME NARZO 50I ','SC9863A',79.99,16.51,2,'2019-05-15',5000,32,'Mint Green',16,75),(387,'NOKIA G11 PLUS ','Octa Core',139.99,16.55,4,'2018-01-11',5000,64,' Grey',11,75),(388,'POCO M5 ','Mediatek Helio G99',189.99,16.71,6,'2018-01-12',5000,128,'Power Black',15,75),(389,'REDMI 9 ACTIV ','Mediatek Dimensity 1080',109.99,16.59,4,'2021-01-13',5000,64,'Coral Green',20,75),(390,'VIVO Y56 5G ','Mediatek Dimensity 700',249.99,16.71,8,'2021-01-15',5000,128,'Orange Shimmer',19,75),(391,'VIVO Y56 5G ','Mediatek Dimensity 700',249.99,16.71,8,'2021-01-15',5000,128,'Black Engine',19,75),(392,'OPPO F21S PRO 5G ','Qualcomm SM6225 Snapdragon 680 4G (6 nm)',319.99,16.33,8,'2021-01-16',4500,128,'Starlight Black',14,75),(393,'REALME 9 ','Qualcomm Snapdragon 680',209.99,16.26,6,'2019-05-15',5000,128,'Sunburst Gold',16,75),(394,'REALME 9 ','Qualcomm Snapdragon 680',229.99,16.26,8,'2019-05-15',5000,128,'Sunburst Gold',16,75),(395,'REALME 9 ','Qualcomm Snapdragon 680',209.99,16.26,6,'2019-05-15',5000,128,'Meteor Black',16,75),(396,'APPLE IPHONE 14 PLUS ','A Bionic Chip,  Core',999.00,17.02,4,'2021-01-04',5000,256,'Purple',1,75),(397,'APPLE IPHONE 14 PLUS ','A Bionic Chip,  Core',999.00,17.02,4,'2021-01-04',5000,256,'Starlight',1,75),(398,'IQOO NEO 6 5G ','A Bionic Chip',349.99,16.81,8,'2018-05-14',4700,128,'Dark Nova',5,75),(399,'VIVO Y22 ','Mediatek Helio G70',179.90,16.64,4,'2021-01-15',5000,64,'Metaverse Green',19,75),(400,'VIVO Y22 ','Mediatek Helio G70',199.90,16.64,6,'2021-01-15',5000,128,'Metaverse Green',19,75),(401,'REALME C20 ','MediaTek Helio G35',79.99,16.51,2,'2019-05-15',5000,32,'Cool Blue',16,75),(402,'REDMI K50I 5G ','Mediatek Dimensity 1080',319.99,16.76,6,'2021-01-13',5080,128,'Stealth Black',20,75),(403,'REDMI NOTE 12 PRO+ 5G ','Mediatek Dimensity 1080',339.99,16.94,8,'2021-01-13',4980,256,'Obsidian Black',20,75),(404,'MOTOROLA G40 FUSION ','Qualcomm Snapdragon 732G',169.99,17.22,4,'2020-04-19',6000,64,'Dynamic Gray',10,75),(405,'VIVO Y21 ','Mediatek Helio P35',179.90,16.54,4,'2021-01-15',5000,64,'Diamond Glow',19,50),(407,'REALME 9I 5G ','Mediatek Dimensity 810 5G',199.99,16.76,6,'2019-05-15',5000,128,'Soulful Blue',16,50),(408,'INFINIX SMART 6 PLUS ','Mediatek Helio G25',99.99,17.32,3,'2019-05-16',5000,64,'Crystal Violet',4,50),(409,'REALME 9 ','Qualcomm Snapdragon 680',229.99,16.26,8,'2019-05-15',5000,128,'Meteor Black',16,50),(410,'TECNO POP 5 LTE ','Unisoc SC9863A',179.99,16.56,2,'2023-01-01',5000,32,'Deepsea Luster',18,50),(411,'POCO C3 ','Mediatek Helio G35',179.99,16.59,3,'2023-01-02',5000,32,'Matte Black',15,50),(412,'IQOO Z6 LITE 5G ','A Bionic Chip',159.99,16.97,4,'2023-01-03',5000,32,'Matte Black',5,50),(414,'TECNO CAMON 19 ','MediaTek Helio G85',159.99,17.27,6,'2023-01-01',5000,128,'Eco Black',18,50),(415,'REALME NARZO 50I ','SC9863A',75.00,16.51,2,'2019-05-15',5000,32,'Carbon Black',16,50),(416,'VIVO T1 PRO 5G ','Qualcomm Snapdragon 778G 5G Mobile Platform',289.90,16.36,6,'2021-01-15',4700,128,'Turbo Cyan',19,50),(417,'ITEL VISION 3 ','Unisoc 9863A',89.99,16.76,3,'2021-01-16',5000,64,'Multi Green',6,50),(418,'ITEL VISION 3 ','Unisoc 9863A',179.99,16.76,3,'2021-01-17',5000,64,'Deep Ocean Black',6,50),(419,'REALME 9 PRO 5G ','Qualcomm Snapdragon 695',219.99,16.76,6,'2019-05-15',5000,128,'Midnight Black',16,50),(420,'APPLE IPHONE 14 PLUS ','A Bionic Chip,  Core',999.00,17.02,4,'2021-01-04',5000,256,'Blue',1,50),(422,'REALME 9 PRO 5G ','Qualcomm Snapdragon 695',239.99,16.76,8,'2019-05-15',5000,128,'Midnight Black',16,50),(423,'REALME 9 PRO 5G ','Qualcomm Snapdragon 695',219.99,16.76,6,'2019-05-15',5000,128,'Aurora Green',16,50),(424,'INFINIX HOT 11 ','MediaTek Helio G70',119.99,16.76,4,'2019-05-16',5200,64,'Silver Wave',4,50),(425,'POCO F4 5G ','Qualcomm Snapdragon 870',329.99,16.94,6,'2019-05-17',4500,128,'Night Black',15,50),(426,'REDMI NOTE 11 ','Mediatek Dimensity 1080',199.99,16.33,6,'2021-01-13',5000,128,'Starburst White',20,50),(427,'APPLE IPHONE 13 ','A Bionic Chip',799.00,15.49,4,'2021-01-04',5000,256,'Blue',1,50),(428,'REDMI NOTE 12 PRO+ 5G ','Mediatek Dimensity 1080',369.99,16.94,4,'2021-01-13',4980,256,'Arctic White',20,50),(430,'REDMI NOTE 12 PRO 5G ','Mediatek Dimensity 1080',299.99,16.94,8,'2021-01-13',5000,128,'Stardust Purple',20,50),(431,'VIVO Y21T ','Qualcomm Snapdragon 680',199.90,16.71,4,'2021-01-15',5000,128,'Midnight Blue',19,50),(432,'REALME 9 ','Qualcomm Snapdragon 680',229.99,16.26,8,'2019-05-15',5000,128,'Stargaze White',16,50),(433,'REDMI NOTE 10T 5G ','Mediatek Dimensity 700',189.99,16.66,6,'2021-01-13',5000,128,'Mint Green',20,50),(434,'REDMI 9 ACTIV ','Mediatek Dimensity 700',109.99,16.59,4,'2021-01-13',5000,64,'Carbon Black',20,50),(435,'IQOO Z6 44W ','A Bionic Chip',199.99,16.36,4,'2021-01-14',5000,128,'Lumina Blue',5,50),(437,'MOTOROLA G51 5G ','Qualcomm Snapdragon 480 Pro',179.99,17.27,4,'2020-04-19',5000,64,'Indigo Blue',10,50),(438,'OPPO A76 ','Qualcomm Snapdragon 680',214.99,16.66,6,'2020-04-20',5000,128,'Glowing Black',14,50),(439,'POCO F4 5G ','Qualcomm Snapdragon 870',399.99,16.94,6,'2020-04-21',4500,256,'Night Black',15,50),(440,'POCO X4 PRO 5G ','Qualcomm Snapdragon 695 5G',229.99,16.94,6,'2020-04-22',5000,64,'Yellow',15,50),(441,'REALME C21 ','MediaTek Helio G35',99.99,16.51,6,'2019-05-15',5000,32,'Cross Black',16,50),(442,'REDMI NOTE 12 PRO+ 5G ','Mediatek Dimensity 1080',369.99,16.94,6,'2021-01-13',4980,256,'Obsidian Black',20,50),(443,'APPLE IPHONE 13 ','A Bionic Chip',799.00,15.49,4,'2021-01-04',4980,256,'Starlight',1,50),(444,'REALME NARZO 50 PRO 5G ','Dimensity 920 5G',259.99,16.26,6,'2019-05-15',5000,128,'Hyper Black',16,50),(445,'VIVO Y33S ','MediaTek Helio G80',219.90,16.71,8,'2021-01-15',5000,128,'Midday Dream',19,50),(446,'XIAOMI 11LITE NE ','Qualcomm Snapdragon 778G',339.99,16.64,8,'2020-01-15',4250,128,'Vinyl Black',20,50),(447,'ITEL A23S ','Unisoc 9863A',48.99,12.7,2,'2020-01-16',3020,32,'Ocean Blue',6,50),(448,'POCO M4 PRO 5G ','Mediatek Dimensity 810',199.99,16.76,6,'2020-01-17',5000,128,'Power Black',15,50),(449,'INFINIX HOT 11S ','Mediatek Helio G88',149.99,17.22,4,'2020-01-18',5000,128,'Polar Black',4,50),(450,'INFINIX HOT 11S ','Mediatek Helio G88',149.99,17.22,4,'2020-01-19',5000,128,'Silver Wave',4,50),(451,'REDMI GO ','Qualcomm Snapdragon 425',179.99,12.7,1,'2020-01-15',3000,16,'Blue',20,50),(453,'REDMI NOTE 9 ','MediaTek Helio G85',164.99,16.59,4,'2020-01-15',5020,128,'Scarlet Red',20,50),(454,'APPLE IPHONE 11 ','A Bionic Chip',439.00,15.49,4,'2021-01-04',5020,64,'Red',1,50),(455,'REDMI 7A ','Qualcomm Snapdragon 439',179.99,13.84,2,'2020-01-15',4000,32,'Matte Blue',20,50),(456,'REALME GT 2 ','Qualcomm Snapdragon 888',399.99,16.81,8,'2019-05-15',5000,128,'Paper Green',16,50),(457,'REALME GT 2 ','Qualcomm Snapdragon 888',399.99,16.81,8,'2019-05-15',5000,128,'Steel Black',16,50),(458,'OPPO A76 ','Qualcomm Snapdragon 680',214.99,16.66,6,'2019-05-16',5000,128,'Glowing Blue',14,50),(460,'OPPO A12 ','MediaTek Helio P35',109.90,15.8,3,'2022-06-13',4230,32,'Blue',14,50),(462,'OPPO A55 ','MediaTek Helio G35',189.90,16.54,4,'2022-06-13',5000,64,'Starry Black',14,50),(463,'OPPO A55 ','MediaTek Helio G35',209.90,16.54,6,'2022-06-14',5000,128,'Starry Black',14,50),(465,'REALME 8I ','MediaTek Helio G96',179.99,16.76,6,'2019-05-15',5000,128,'Space Black',16,50),(466,'REALME 8I ','MediaTek Helio G96',159.99,16.76,4,'2019-05-15',5000,64,'Space Purple',16,50),(467,'APPLE IPHONE 13 ','A Bionic Chip',999.00,15.49,4,'2021-01-04',5000,512,'Midnight',1,50),(468,'APPLE IPHONE 12 ','A Bionic Chip with Next Generation Neural Engine',599.00,15.49,4,'2021-01-04',5000,64,'Blue',1,50),(469,'REDMI NOTE 11 PRO PLUS 5G ','Qualcomm Snapdragon 439',249.99,16.94,6,'2020-01-15',5000,128,'Stealth Black',20,50),(470,'OPPO A15S ','MediaTek Helio G35',139.90,16.56,4,'2020-01-16',4230,64,'Rainbow Silver',14,50),(471,'MI 11 LITE ','Qualcomm Snapdragon 732G',259.99,16.64,8,'2020-01-17',4250,128,'Tuscany Coral',9,50),(472,'VIVO V23E 5G ','Mediatek Dimensity 810',289.90,16.36,8,'2021-01-15',4050,128,'Sunshine Gold',19,50),(473,'TECNO SPARK 8 ','MediaTek Helio G25',134.99,16.66,4,'2023-01-01',5000,64,'Atlantic Blue',18,50),(476,'MOTOROLA G40 FUSION ','Qualcomm Snapdragon 732G',199.99,17.22,6,'2020-04-19',6000,128,'Frosted Champagne',10,50),(477,'POCO M5 ','Mediatek Helio G99',189.99,16.71,6,'2020-04-20',5000,128,'Yellow',15,50),(478,'MOTOROLA EDGE 30 FUSION ','Qualcomm Snapdragon 888 +',499.99,16.64,8,'2020-04-19',4400,128,'Cosmic grey',10,50),(481,'VIVO V21 5G ','MediaTek Dimensity 800U',329.90,16.36,8,'2021-01-15',4000,128,'Dusk Blue',19,50),(482,'IQOO Z6 44W ','A Bionic Chip',199.99,16.36,4,'2021-01-16',5000,128,'Raven Black',5,50),(483,'VIVO Y53S ','MediaTek Helio G80',229.90,16.71,8,'2021-01-17',5000,128,'Deep Sea Blue',19,50),(484,'OPPO F21S PRO ','Qualcomm SM6225 Snapdragon 680 4G (6 nm)',219.90,16.33,8,'2021-01-18',4500,128,'Dawnlight Gold',14,50),(485,'ITEL VISION 3 ','Unisoc 9863A',179.99,16.76,3,'2021-01-19',5000,64,'Multi Green',6,50),(486,'REALME NARZO 50 5G ','A Bionic Chip',179.90,16.76,4,'2019-05-15',5000,128,'Hyper Blue',16,50),(487,'REALME 9 5G ','Mediatek Dimensity 810',189.99,16.51,4,'2019-05-15',5000,64,'Supersonic Black',16,50),(488,'REALME 9 5G ','Mediatek Dimensity 810',209.99,16.51,6,'2019-05-15',5000,128,'Stargaze White',16,50),(489,'ITEL A23S ','Unisoc 9863A',48.99,12.7,2,'2019-05-16',3020,32,'Sky Cyan',6,50),(490,'REALME 9 5G ','Mediatek Dimensity 810',189.99,16.51,4,'2019-05-15',5000,64,'Meteor Black',16,50),(492,'REALME 8 ','MediaTek Helio G95',189.99,16.26,8,'2019-05-15',5000,128,'Cyber Silver',16,50),(493,'REALME 8 ','MediaTek Helio G95',179.99,16.26,6,'2019-05-15',5000,128,'Cyber Black',16,50),(494,'REALME C21Y ','Unisoc T610',99.99,16.51,3,'2019-05-15',5000,32,'Cross Black',16,50),(495,'REALME C21Y ','Unisoc T610',99.99,16.51,3,'2019-05-15',5000,32,'Cross Blue',16,50),(496,'ITEL VISION3 ','Unisoc 9863A',79.99,16.76,2,'2019-05-16',5000,32,'Deep Ocean Black',6,50),(498,'INFINIX SMART 5A ','MediaTek Helio A20',79.99,16.56,2,'2019-05-18',5000,32,'Midnight Black',4,50),(499,'NOKIA C01 PLUS ','Unisoc SC9863A',79.99,13.84,2,'2018-01-11',3000,32,'Blue',11,50),(502,'REALME C25_Y ','Unisoc T618',129.99,16.51,4,'2019-05-15',5000,64,'Metal Grey',16,50),(503,'REALME 9 PRO 5G ','Qualcomm Snapdragon 695',239.99,16.76,8,'2019-05-15',5000,128,'Sunrise Blue',16,50),(505,'ONEPLUS 10R 5G ','Qualcomm SM6225 Snapdragon 680 4G (6 nm)',429.99,17.02,4,'2022-06-13',5000,256,'Sierra Black',13,50),(506,'ITEL A49 ','Quad Core',57.99,16.76,2,'2022-06-14',4000,32,'Crystal Purple',6,50),(507,'ITEL A49 ','Quad Core',67.99,16.76,2,'2022-06-15',4000,32,'Sky Cyan',6,50),(508,'TECNO POVA 3 ','MediaTek Helio G88',149.99,17.53,4,'2023-01-01',7000,64,'Tech Silver',18,50),(509,'APPLE IPHONE 14 ','A Bionic Chip,  Core',899.00,15.49,4,'2021-01-04',7000,64,'Tech Silver',1,50),(511,'REDMI NOTE 11 SE ','Mediatek Helio G95 Octa Core',169.99,16.33,6,'2020-01-15',5000,64,'Bifrost Blue',20,50),(512,'REDMI NOTE 11T 5G ','Mediatek Helio G95 Octa Core',179.99,16.76,6,'2020-01-15',5000,128,'Stardust White',20,50),(513,'IQOO Z6 PRO 5G ','A Bionic Chip',279.90,16.36,6,'2020-01-16',4700,128,'Legion Sky',5,50),(514,'REDMI NOTE 11T 5G ','Mediatek Helio G95 Octa Core',229.99,16.76,8,'2020-01-17',5000,128,'Aquamarine Blue',20,50),(515,'IQOO Z6 PRO 5G ','SnapdragonÂ® 778G',179.99,16.36,6,'2020-01-18',4700,128,'Phantom Dusk',5,50),(516,'REALME 9 5G SE ','Qualcomm Snapdragon 778G',269.99,16.76,8,'2019-05-15',5000,128,'Starry Glow',16,50),(517,'REALME 9 5G SE ','Qualcomm Snapdragon 778G',249.99,16.76,6,'2019-05-15',5000,128,'Azure Glow',16,50),(518,'INFINIX HOT 11S ','Mediatek Helio G88',139.99,17.22,4,'2019-05-16',5000,64,'Silver Wave',4,50),(519,'TECNO SPARK 8C ','Unisoc T606',91.90,16.76,4,'2023-01-01',5000,64,'Diamond Grey',18,50),(520,'REALME GT 2 ','Qualcomm Snapdragon 888',449.99,16.81,4,'2019-05-15',5000,256,'Steel Black',16,50),(521,'APPLE IPHONE 14 PRO ','A Bionic Chip,  Core',1599.00,15.49,4,'2021-01-04',5000,512,'Space Black',1,50),(522,'TECNO SPARK 8C ','Unisoc T606',84.98,16.76,3,'2023-01-01',5000,64,'Diamond Grey',18,50),(524,'OPPO A12 ','MediaTek Helio P35',119.90,15.8,4,'2022-06-13',4230,64,'Flowing Silver',14,50),(527,'OPPO A15S ','MediaTek Helio P35',139.90,16.56,4,'2022-06-13',4230,64,'Fancy White',14,50),(529,'I KALL Z5 ','A Bionic Chip',179.99,13.84,3,'2022-06-15',3000,16,'Blue',3,50),(530,'MOTOROLA G60 ','Qualcomm Snapdragon 732G',219.99,17.27,6,'2020-04-19',6000,128,'Dynamic Gray',10,50),(532,'REALME NARZO 50I ','SC9863A',99.99,16.51,4,'2019-05-15',5000,64,'Carbon Black',16,50),(533,'REDMI A1+ ','Mediatek Helio A22',109.99,16.56,3,'2020-01-15',5000,32,'Black',20,50),(534,'POCO F3 GT 5G ','MediaTek Dimensity 1200',179.99,16.94,6,'2020-01-16',5065,128,'Predator Black',15,50),(535,'MOTOROLA EDGE 30 ULTRA ','Qualcomm Snapdragon 8+ Gen 1',699.99,16.94,8,'2020-04-19',4610,128,'Starlight White',10,50),(536,'APPLE IPHONE 14 PLUS ','A Bionic Chip,  Core',1199.00,17.02,4,'2021-01-04',4610,512,'Midnight',1,50),(537,'OPPO A77 ','Mediatek Helio G35',189.99,16.66,4,'2021-01-05',5000,64,'Sky Blue',14,50),(539,'APPLE IPHONE 14 PRO ','A Bionic Chip,  Core',1299.00,15.49,6,'2021-01-04',5000,128,'Gold',1,50),(541,'NOKIA C01 PLUS ','Unisoc SC9863A',69.99,13.84,2,'2018-01-11',3000,16,'Grey',11,50),(542,'ITEL VISION1 ','Unisoc SC9863A Octa Core',82.99,15.46,3,'2018-01-12',4000,32,'Gradation Blue',6,50),(543,'REALME GT NEO 3 ','Mediatek Dimensity 8100',459.99,17.02,6,'2019-05-15',4500,64,'Gradation Blue',16,50),(545,'REALME NARZO 30 ','MediaTek Helio G95',169.99,16.51,6,'2019-05-15',5000,128,'Racing Blue',16,50),(546,'REDMI 9 ACTIV ','Mediatek Helio G35',109.99,16.59,4,'2020-01-15',5000,64,'Carbon Black',20,50),(547,'REALME 9 5G SE ','Qualcomm Snapdragon 778G',249.99,16.76,6,'2019-05-15',5000,128,'Starry Glow',16,50),(548,'LAVA BLAZE PRO ','Mediatek G37 Octa Core',129.99,16.51,4,'2022-04-11',5000,64,'Glass Orange',7,50),(549,'TECNO SPARK GO 2022 ','Unisoc T606',179.99,16.56,2,'2023-01-01',5000,32,'Iris Purple',18,50),(550,'TECNO SPARK GO 2022 ','Helio A20',179.99,16.66,2,'2023-01-01',5000,32,'Atlantic Blue',18,50),(551,'REDMI 9I ','MediaTek Helio G25',99.99,16.59,4,'2020-01-15',5000,64,'Sea Blue',20,50),(554,'TECNO SPARK 9 ','MediaTek Helio G37',114.99,16.76,4,'2023-01-01',5000,64,'Sky Mirror',18,50),(555,'REALME C21Y ','Unisoc T610',109.99,16.51,4,'2019-05-15',5000,64,'Cross Blue',16,50),(556,'IQOO NEO 6 5G ','A Bionic Chip',349.90,16.81,8,'2019-05-16',4700,128,'Cyber Rage',5,50),(557,'APPLE IPHONE 14 PRO MAX ','A Bionic Chip,  Core',1399.00,17.02,6,'2021-01-04',4700,128,'Gold',1,50),(559,'REALME 8 ','MediaTek Helio G95',179.99,16.26,6,'2019-05-15',5000,128,'Cyber Silver',16,50),(560,'REDMI A1+ ','Mediatek Helio A22',99.99,16.56,2,'2020-01-15',5000,32,'Light Blue',20,50),(561,'ITEL A27 ','Unisoc SC9863A Octa Core',179.99,13.84,2,'2020-01-16',4000,32,'Deep Gray',6,50),(562,'REDMI NOTE 10S ','Mediatek Helio G95',209.99,16.33,8,'2020-01-17',5000,128,'Deep Sea Blue',20,50),(563,'OPPO A16 ','MediaTek Helio G35',159.90,16.56,4,'2020-01-18',5000,64,'Crystal Black',14,50),(564,'LAVA Z2 MAX ','MediaTek Helio Quad Core',84.49,17.78,2,'2022-04-11',6000,32,'Stroked Blue',7,50),(565,'REALME NARZO 50 5G ','A Bionic Chip',179.99,16.76,6,'2019-05-15',5000,64,'Hyper Blue',16,50),(566,'APPLE IPHONE 14 PRO ','A Bionic Chip,  Core',1299.00,15.49,6,'2021-01-04',5000,128,'Deep Purple',1,50),(568,'REDMI NOTE 11 PRO PLUS 5G ','Mediatek Helio G95',249.99,16.94,6,'2020-01-15',5000,128,'Stealth Black',20,50),(569,'VIVO Y21A ','Mediatek Helio P22',179.90,16.54,4,'2021-01-15',5000,64,'Midnight Blue',19,50),(570,'REDMI NOTE 10S ','Mediatek Helio G95',209.99,16.33,8,'2020-01-15',5000,128,'Frost White',20,50),(571,'REALME NARZO 50 5G ','A Bionic Chip',199.99,16.76,6,'2019-05-15',5000,128,'Hyper Black',16,50),(572,'OPPO A16 ','MediaTek Helio G35',159.90,16.56,4,'2019-05-16',5000,64,'Royal Gold',14,50),(574,'REDMI 9A SPORT ','Mediatek Helio G95',94.99,16.59,3,'2020-01-15',5000,32,'Carbon Black',20,50),(575,'REALME 9 PRO+ 5G ','Mediatek Dimensity 920',299.99,16.26,8,'2019-05-15',4500,128,'Midnight Black',16,50),(576,'REALME 9 PRO+ 5G ','Mediatek Dimensity 920',319.99,16.26,8,'2019-05-15',4500,256,'Midnight Black',16,50),(577,'INFINIX NOTE 12 TURBO ','Mediatek Helio G96',199.99,17.02,8,'2019-05-16',5000,128,'Snowfall',4,50),(578,'OPPO A57 ','Mediatek Helio G35',169.90,16.66,4,'2019-05-17',5000,64,'Glowing Gold',14,50),(580,'REDMI 11 PRIME ','Mediatek Helio G95',169.99,16.71,6,'2020-01-15',5000,128,'Peppy Purple',20,50),(581,'IQOO Z6 LITE 5G ','A Bionic Chip',179.99,16.97,6,'2020-01-16',5000,128,'Peppy Purple',5,50),(582,'MOTOROLA G30 ','Snapdragon 662',149.99,16.54,4,'2020-04-19',5000,64,'Dark Pearl',10,50),(583,'XIAOMI 12 PRO 5G ','Snapdragon@ 8 Gen 1',849.99,17.09,8,'2020-01-15',4600,256,'Noir Black',20,50),(584,'REALME 8 5G ','MediaTek Dimensity 700 (MT6833)',169.99,16.51,4,'2019-05-15',5000,128,'Supersonic Black',16,50),(586,'OPPO F21 PRO ','Mediatek Helio G35',259.99,16.33,8,'2022-06-13',4500,128,'Cosmic Black',14,50),(588,'REALME NARZO 30 ','MediaTek Helio G95',149.99,16.51,4,'2019-05-15',5000,64,'Racing Blue',16,50),(589,'REALME 8I ','MediaTek Helio G96',159.99,16.76,4,'2019-05-15',5000,64,'Space Black',16,50),(590,'IQOO Z6 5G ','A Bionic Chip',174.99,16.71,6,'2019-05-16',5000,128,'Dynamo Black',5,50),(592,'REDMI 9A ','Snapdragon@ 8 Gen 1',84.99,16.59,2,'2020-01-15',5000,32,'Midnight Black',20,50),(593,'LAVA Z2 ','MediaTek Helio G35',89.99,16.55,3,'2022-04-11',5000,32,'Flame Red',7,50),(595,'REDMI NOTE 10 PRO MAX ','Qualcomm Snapdragon 732G',229.99,16.94,6,'2020-01-15',5020,128,'Dark Nebula',20,50),(596,'POCO M5 ','Mediatek Helio G99',159.99,16.71,4,'2020-01-16',5000,64,'Yellow',15,50),(597,'VIVO V21 5G ','MediaTek Dimensity 800U',329.90,16.36,8,'2021-01-15',4000,128,'Sunset Dazzle',19,50),(598,'REALME C25_Y ','Unisoc T618',139.99,16.51,4,'2019-05-15',5000,128,'Metal Grey',16,50),(599,'NOKIA C01 PLUS ','Unisoc SC9863A',69.99,13.84,2,'2018-01-11',3000,16,'Blue',11,50),(600,'REDMI NOTE 12 5G ','Qualcomm Snapdragon 732G',199.99,16.94,4,'2020-01-15',5000,128,'Matte Black',20,25),(601,'TECNO SPARK 8C ','Unisoc T606',82.48,16.76,3,'2023-01-01',5000,64,'Magnet Black',18,25),(604,'TECNO SPARK 8T ','MediaTek Helio G35',98.50,16.76,4,'2023-01-01',5000,64,'Atlantic Blue',18,25),(605,'APPLE IPHONE 14 PRO MAX ','A Bionic Chip,  Core',1399.00,17.02,6,'2021-01-04',5000,128,'Space Black',1,25),(606,'REALME NARZO 30 PRO 5G ','MediaTek Dimensity 800U',219.99,16.51,8,'2019-05-15',5000,128,'Blade Silver',16,25),(607,'REALME NARZO 50 5G ','A Bionic Chip',179.90,16.76,6,'2019-05-15',5000,64,'Hyper Black',16,25),(608,'REDMI NOTE 11 PRO ','Qualcomm Snapdragon 732G',229.99,16.94,6,'2020-01-15',5000,128,'Star blue',20,25),(610,'XIAOMI 11LITE NE ','Qualcomm Snapdragon 778G',238.95,16.64,6,'2020-01-15',4250,128,'Diamond Dazzle',20,25),(611,'REALME GT 2 ','Qualcomm Snapdragon 888',399.99,16.81,8,'2019-05-15',5000,128,'Paper White',16,25),(612,'OPPO A16E ','Mediatek Helio P22',139.90,16.56,3,'2019-05-16',4230,32,'Midnight Black',14,25),(613,'APPLE IPHONE 14 PRO MAX ','A Bionic Chip,  Core',1399.00,17.02,6,'2021-01-04',4230,128,'Deep Purple',1,25),(614,'VIVO V23 PRO 5G ','Mediatek Dimensity 1200',419.90,16.66,8,'2021-01-15',4300,128,'Sunshine Gold',19,25),(615,'REDMI A1+ ','Mediatek Helio A22',99.99,16.56,2,'2020-01-15',5000,32,'Light Green',20,25),(616,'REALME C15 ','Mediatek Helio G35',179.99,16.56,4,'2019-05-15',6000,64,'Power Blue',16,25),(618,'VIVO V25 5G ','Mediatek Dimensity 900',329.99,16.36,8,'2021-01-15',4500,128,'Elegant Black',19,25),(619,'IQOO Z6 LITE 5G ','A Bionic Chip',159.99,16.97,4,'2021-01-16',5000,128,'Elegant Black',5,25),(620,'OPPO A57 ','Mediatek Helio G35',169.90,16.66,4,'2021-01-17',5000,64,'Glowing Black',14,25),(621,'MOTOROLA E7 POWER ','MediaTek Helio G25',119.99,16.54,4,'2020-04-19',5000,64,'Tahiti Blue',10,25),(622,'VIVO Y21G ','Mediatek MT6769 Helio G70',179.99,16.54,4,'2021-01-15',5000,64,'Midnight Blue',19,25),(623,'VIVO Y33T ','Qualcomm Snapdragon 680',174.90,16.71,8,'2021-01-15',5000,128,'Mirror Black',19,25),(625,'TECNO POP 5 PRO ','Helio A22',109.99,16.56,3,'2023-01-01',6000,32,'Ice Blue',18,25),(627,'REALME 9 5G SE ','Qualcomm Snapdragon 778G',269.99,16.76,8,'2019-05-15',5000,128,'Azure Glow',16,25),(629,'MOTOROLA G40 FUSION ','Qualcomm Snapdragon 732G',199.99,17.22,6,'2020-04-19',6000,128,'Dynamic Gray',10,25),(630,'OPPO A54 ','MediaTek Helio P35',179.90,16.54,6,'2020-04-20',5000,128,'Crystal Black',14,25),(631,'OPPO A54 ','MediaTek Helio P35',179.90,16.54,6,'2020-04-21',5000,128,'Starry Blue',14,25),(632,'APPLE IPHONE 11 ','A Bionic Chip',439.00,15.49,6,'2020-04-22',5000,64,'Yellow',1,25),(633,'APPLE IPHONE 12 ','A Bionic Chip with Next Generation Neural Engine',599.00,15.49,6,'2021-01-04',5000,64,'Red',1,25),(634,'MOTO G71 5G ','Qualcomm Snapdragon 695',229.99,16.26,6,'2020-04-19',5000,128,'Neptune Green',10,25),(635,'REDMI NOTE 10S ','Mediatek Helio G95',209.99,16.33,8,'2020-01-15',5000,128,'Shadow Black',20,25),(637,'APPLE IPHONE 12 MINI ','A Bionic Chip with Next Generation Neural Engine',749.00,13.72,6,'2021-01-04',5000,256,'Red',1,25),(638,'INFINIX NOTE 12 TURBO ','Mediatek Helio G96',199.99,17.02,8,'2021-01-05',5000,128,'Force Black',4,25),(639,'REALME 9 PRO+ 5G ','Mediatek Dimensity 920',279.99,16.26,6,'2021-01-06',4500,128,'Aurora Green',16,25),(640,'INFINIX NOTE 12 TURBO ','Mediatek Helio G96',199.99,17.02,8,'2021-01-07',5000,128,'Jewel Blue',4,25),(642,'TECNO SPARK 8C ','Unisoc T606',82.40,16.76,3,'2023-01-01',5000,64,'Turquoise Cyan',18,25),(643,'TECNO POVA NEO ','Helio G25',154.99,17.27,6,'2023-01-01',6000,128,'Geek Blue',18,25),(644,'TECNO SPARK 8C ','Unisoc T606',89.48,16.76,4,'2023-01-01',5000,64,'Iris Purple',18,25),(645,'TECNO POVA NEO ','Helio G25',154.99,17.27,6,'2023-01-01',6000,128,'Obsidian Black',18,25),(646,'REALME C25S ','MediaTek Helio G85',179.99,16.51,4,'2019-05-15',6000,128,'Watery Grey',16,25),(648,'TECNO SPARK 8 PRO ','Helio G25',134.99,17.27,4,'2023-01-01',5000,64,'Interstellar Black',18,25),(649,'REALME 9I ','Qualcomm Snapdragon 680 (SM6225)',179.99,16.76,6,'2019-05-15',5000,128,'Prism Blue',16,25),(650,'LAVA Z2C ','MediaTek Helio G35',84.99,16.55,2,'2022-04-11',5000,32,'Aqua Blue',7,25),(651,'REALME 8 5G ','MediaTek Dimensity 700 (MT6833)',169.99,16.51,4,'2019-05-15',5000,128,'Supersonic Blue',16,25),(652,'VIVO Y15S ','A Bionic Chip',99.09,16.54,3,'2021-01-15',5000,32,'MYSTIC BLUE',19,25),(653,'REDMI A1 ','Mediatek Helio G95',179.99,16.56,2,'2020-01-15',5000,32,'Black',20,25),(654,'POCO M4 PRO ','Mediatek Helio G96',199.99,16.33,6,'2020-01-16',5000,128,'Power Black',15,25),(655,'REALME GT 2 ','Qualcomm Snapdragon 888',449.99,16.81,6,'2019-05-15',5000,256,'Paper White',16,25),(656,'REDMI NOTE 10T 5G ','Mediatek Dimensity 700',169.99,16.66,4,'2020-01-15',5000,64,'Metallic Blue',20,25),(658,'XIAOMI 11LITE NE ','Qualcomm Snapdragon 778G',242.98,16.64,8,'2020-01-15',4250,128,'Vinyl Black',20,25),(659,'REALME NARZO 50 5G ','A Bionic Chip',189.90,16.76,4,'2019-05-15',5000,128,'Hyper Blue',16,25),(660,'INFINIX SMART HD 2021 ','MediaTek Helio A20',79.99,15.49,2,'2019-05-16',5000,32,'Topaz Blue',4,25),(661,'OPPO A54 ','MediaTek Helio P35',159.90,16.54,4,'2019-05-17',5000,128,'Moonlight Gold',14,25),(662,'OPPO A54 ','MediaTek Helio P35',159.90,16.54,4,'2019-05-18',5000,128,'Crystal Black',14,25),(664,'LAVA BEU ','Unisoc SC9863A Octa Core',77.77,15.44,2,'2022-04-11',4060,32,'ROSE PINK',7,25),(665,'MARQ BY FLIPKART M3 SMART ','Octa Core',79.99,15.46,2,'2022-05-20',5000,128,'ROSE PINK',8,25),(666,'APPLE IPHONE 13 PRO ','A Bionic Chip',1499.00,15.49,6,'2021-01-04',5000,512,'Silver',1,25),(667,'INFINIX NOTE 11S ','MediaTek Helio G96',169.99,17.65,6,'2021-01-05',5000,64,'Haze Green',4,25),(668,'INFINIX NOTE 11S ','MediaTek Helio G96',169.99,17.65,6,'2021-01-06',5000,64,'Mithril Grey',4,25),(669,'VIVO Y16 ','Mediatek Helio P35',139.99,16.54,3,'2021-01-07',5000,32,'Steller Black',19,25),(670,'OPPO A77 ','Mediatek Helio G35',199.99,16.66,4,'2021-01-08',5000,128,'Sky Blue',14,25),(671,'OPPO A77 ','Mediatek Helio G35',199.99,16.66,4,'2021-01-09',5000,128,'Sunset Orange',14,25),(672,'INFINIX NOTE 11 ','Mediatek Helio G88',169.99,17.02,6,'2021-01-10',5000,128,'Graphite Black',4,25),(673,'INFINIX NOTE 11 ','Mediatek Helio G88',169.99,17.02,6,'2021-01-11',5000,128,'Celestial Snow',4,25),(674,'INFINIX NOTE 11 ','Mediatek Helio G88',169.99,17.02,6,'2021-01-12',5000,128,'Glacier Green',4,25),(675,'POCO M4 PRO ','Mediatek Helio G96',179.99,16.33,6,'2021-01-13',5000,64,'Power Black',15,25),(676,'REALME 6 PRO ','Snapdragon 720G',179.99,16.76,6,'2019-05-15',4300,64,'Lightning Orange',16,25),(677,'ITEL A27 ','Unisoc 9832E',79.99,13.84,2,'2019-05-16',4000,32,'Silver Purple',6,25),(679,'VIVO Y16 ','Mediatek Helio P35',139.99,16.54,3,'2021-01-15',5000,64,'Drizzling Gold',19,25),(680,'XIAOMI 11LITE NE ','Qualcomm Snapdragon 778G',299.90,16.64,6,'2020-01-15',4250,128,'Vinyl Black',20,25),(681,'REDMI NOTE 10T 5G ','Mediatek Dimensity 700',179.99,16.66,4,'2020-01-15',5000,64,'Metallic Blue',20,25),(684,'VIVO V25 5G ','Mediatek Dimensity 900',179.99,16.36,8,'2021-01-15',4500,128,'Surfing Blue',19,25),(686,'VIVO Y15C ','Mediatek Helio P35',99.76,16.54,3,'2021-01-15',5000,32,'Wave Green',19,25),(687,'OPPO A31 ','MediaTek Helio P35 Octa Core',159.90,16.51,6,'2021-01-16',4230,128,'Mystery Black',14,25),(688,'REDMI NOTE 11 PRO ','Mediatek Dimensity 700',179.99,16.94,6,'2021-01-17',5000,128,'Stealth Black',20,25),(689,'POCO M3 PRO 5G ','MediaTek Dimensity 700',179.99,16.51,6,'2021-01-18',5000,128,'Yellow',15,25),(690,'REDMI NOTE 11 PRO ','Mediatek Dimensity 700',249.99,16.94,8,'2021-01-19',5000,128,'Phantom White',20,25),(693,'OPPO A16E ','Mediatek Helio P22',159.90,16.56,4,'2021-01-22',4230,64,'Midnight Black',14,25),(694,'OPPO A16E ','Mediatek Helio P22',159.90,16.56,4,'2021-01-23',4230,64,'Blue',14,10),(695,'TECNO SPARK 8P ','MediaTek Helio G85',179.99,16.76,4,'2021-01-24',5000,64,'Iris Purple',18,10),(696,'OPPO A74 5G ','Mediatek Helio P22',184.90,16.48,6,'2021-01-25',5000,128,'Fantastic Purple',14,10),(697,'INFINIX HOT 11 2022 ','UniSoc T610',129.99,17.02,4,'2021-01-26',5000,64,'Polar Black',4,10),(698,'APPLE IPHONE 13 ','A Bionic Chip',999.00,15.49,6,'2021-01-27',5000,512,'Pink',1,10),(699,'REDMI 9 ACTIV ','Mediatek Dimensity 700',179.99,16.59,4,'2021-01-28',5000,64,'Metallic Purple',20,10),(700,'OPPO F21S PRO 5G ','Mediatek Helio P22',319.99,16.33,8,'2021-01-29',4500,128,'Dawnlight Gold',14,10),(701,'POCO F1 ','Qualcomm Snapdragon 845',179.99,15.7,6,'2021-01-30',4000,64,'Rosso Red',15,10),(702,'OPPO A 78 5G ','Mediatek Helio P22',219.99,16.66,8,'2021-01-31',5000,128,'Black',14,10),(703,'APPLE IPHONE 14 PRO ','A Bionic Chip,  Core',1299.00,15.49,6,'2021-01-04',5000,128,'Space Black',1,10),(704,'MOTOROLA G51 5G ','Qualcomm Snapdragon 480 Pro',179.99,17.27,4,'2020-04-19',5000,64,'Bright Silver',10,10),(705,'MOTOROLA EDGE 20 FUSION 5G ','MediaTek Dimensity 800U',249.99,16.94,6,'2020-04-19',5000,128,'Electric Graphite',10,10),(706,'REALME NARZO 30 5G ','MediaTek Dimensity 700 (MT6833)',179.99,16.51,6,'2019-05-15',5000,128,'Racing Blue',16,10),(707,'REALME GT NEO 3 ','Mediatek Dimensity 8100',419.99,17.02,8,'2019-05-15',5000,256,'Asphalt Black',16,10),(709,'VIVO Y01A ','Mediatek Helio P35',129.99,16.54,2,'2021-01-15',5000,32,'Sapphire Blue',19,10),(710,'VIVO X80 ','Mediatek Dimensity 9000',599.99,17.22,8,'2021-01-15',4500,128,'Urban Blue',19,10),(711,'REDMI GO ','Qualcomm Snapdragon 425',179.99,12.7,1,'2020-01-15',3000,8,'Black',20,10),(712,'REDMI K50I ','Qualcomm Snapdragon 425',359.99,16.76,8,'2020-01-15',5080,256,'Phantom Blue',20,10),(714,'TECNO SPARK GO 2021 ','MediaTek Helio G85',179.99,16.56,2,'2023-01-01',5000,32,'Horizon Orange',18,10),(715,'REDMI NOTE 11 PRO ','Qualcomm Snapdragon 425',179.99,16.94,6,'2020-01-15',5000,128,'Star blue',20,10),(716,'REALME 9 PRO+ 5G ','Mediatek Dimensity 920',319.99,16.26,8,'2019-05-15',4500,256,'Sunrise Blue',16,10),(717,'REALME 9I ','Qualcomm Snapdragon 680 (SM6225)',169.99,16.76,4,'2019-05-15',5000,128,'Prism Black',16,10),(718,'REALME 9 PRO+ 5G ','Mediatek Dimensity 920',319.99,16.26,8,'2019-05-15',4500,256,'Aurora Green',16,10),(719,'REALME C11 ','Mediatek Helio G35',179.99,16.51,2,'2019-05-15',5000,32,'Rich Green',16,10),(720,'APPLE IPHONE 12 ','A Bionic Chip with Next Generation Neural Engine',749.00,15.49,6,'2021-01-04',5000,256,'Black',1,10),(721,'LAVA Z2 ','MediaTek Helio G35',89.99,16.55,3,'2022-04-11',5000,32,'Aqua Blue',7,10),(722,'POCO M4 PRO 5G ','Mediatek Dimensity 810',169.99,16.76,4,'2022-04-12',5000,64,'Power Black',15,10),(723,'TECNO SPARK 8C ','Unisoc T606',91.45,16.76,4,'2023-01-01',5000,64,'Magnet Black',18,10),(724,'REDMI NOTE 7S ','Qualcomm Snapdragon 660 AIE',179.99,16,4,'2020-01-15',4000,64,'Onyx Black',20,10),(725,'OPPO A55 ','MediaTek Helio G35',179.99,16.54,4,'2020-01-16',5000,64,'Rainbow Blue',14,10),(726,'APPLE IPHONE 14 PLUS ','A Bionic Chip,  Core',1199.00,17.02,3,'2021-01-04',5000,512,'Purple',1,10),(727,'VIVO Y33T ','Qualcomm Snapdragon 680',229.90,16.71,8,'2021-01-15',5000,128,'Mid day dream',19,10),(728,'REALME 8 ','MediaTek Helio G95',169.99,16.26,4,'2019-05-15',5000,128,'Cyber Silver',16,10),(729,'INFINIX ZERO 5G ','Mediatek Dimensity 900',249.99,17.22,8,'2019-05-16',5000,128,'Horizon Blue',4,10),(732,'OPPO A78 5G ','MediaTek Helio G35',219.99,16.66,8,'2022-06-13',5000,128,'Glowing Blue',14,10),(733,'APPLE IPHONE 12 ','A Bionic Chip with Next Generation Neural Engine',749.00,15.49,3,'2021-01-04',5000,256,'Green',1,10),(734,'REDMI NOTE 11 PRO PLUS 5G ','Qualcomm Snapdragon 660 AIE',179.99,16.94,8,'2020-01-15',5000,256,'PHANTOM WHITE',20,10),(735,'REALME NARZO 30 ','MediaTek Helio G95',169.99,16.51,6,'2019-05-15',5000,128,'Racing Silver',16,10),(736,'REALME GT NEO 3T ','Qualcomm Snapdragon 870',349.99,16.81,6,'2019-05-15',5000,128,'Dash Yellow',16,10),(737,'REALME GT NEO 3T ','Qualcomm Snapdragon 870',369.99,16.81,8,'2019-05-15',5000,128,'Shade Black',16,10),(738,'IQOO NEO 6 5G ','A Bionic Chip',179.99,16.81,8,'2019-05-16',4700,256,'Cyber Rage',5,10),(739,'REALME GT NEO 3T ','Qualcomm Snapdragon 870',389.99,16.81,8,'2019-05-17',5000,256,'Dash Yellow',16,10),(740,'I KALL 401 PRO DARK BLUE ','Mediatek',69.99,15.9,4,'2019-05-18',4000,64,'Dark Blue',3,10),(741,'REALME GT NEO 3T ','Qualcomm Snapdragon 870',389.99,16.81,8,'2019-05-19',5000,256,'Drifting White',16,10),(742,'REALME GT NEO 3T ','Qualcomm Snapdragon 870',389.99,16.81,8,'2019-05-20',5000,256,'Shade Black',16,10),(743,'REALME GT NEO 3T ','Qualcomm Snapdragon 870',349.99,16.81,6,'2019-05-21',5000,128,'Shade Black',16,10),(744,'REALME GT NEO 3T ','Qualcomm Snapdragon 870',349.99,16.81,6,'2019-05-22',5000,128,'Drifting White',16,10),(745,'ITEL A27 ','Unisoc 9832E',69.99,13.84,2,'2019-05-23',4000,32,'Crystal Blue',6,10),(746,'ITEL A27 ','Unisoc 9832E',69.99,13.84,2,'2019-05-24',4000,32,'Deep Grey',6,10),(747,'OPPO F21SPRO ','MediaTek Helio G35',229.29,16.33,8,'2019-05-25',4500,128,'Orange',14,10),(748,'POCO M2 PRO ','Qualcomm Snapdragon 720G',179.99,16.94,6,'2019-05-26',5000,128,'Green and Greener',15,10),(750,'MICROMAX BHARAT 2 PLUS ','SC9832',179.99,10.16,1,'2022-06-13',1600,8,'Champagne',9,10),(751,'MOTOROLA EDGE 30 ULTRA ','Qualcomm Snapdragon 8+ Gen 1',699.99,16.94,8,'2020-04-19',4610,128,'Interstellar Black',10,10),(752,'REDMI 6 ','2.0 GHz Mediatek P22 Octacore',179.99,13.84,3,'2020-01-15',3000,32,'Gold',20,10),(754,'REALME 9 PRO+ 5G ','Mediatek Dimensity 920',299.99,16.26,8,'2019-05-15',4500,128,'Sunrise Blue',16,10),(756,'REALME 3I ','MediaTek Helio P60 Octa Core 2.0 GHz',109.99,15.8,4,'2019-05-15',4230,64,'Diamond Blue',16,10),(757,'POCO M2 RELOADED ','MediaTek Helio G80',179.99,16.59,4,'2019-05-16',5000,64,'Greyish Black',15,10),(758,'INFINIX HOT 11 2022 ','UniSoc T610',129.99,17.02,4,'2019-05-17',5000,64,'Aurora Green',4,10),(759,'IQOO NEO 6 5G ','2.0 GHz Mediatek P22 Octacore',179.99,16.81,8,'2019-05-18',4700,128,'Cyber Rage',5,10),(760,'REALME C15 ','Mediatek Helio G35',179.99,16.56,3,'2019-05-15',6000,32,'Power Silver',16,10),(761,'MOTO C PLUS ','Mediatek MTK6737 Quad Core 1.3Ghz',179.99,12.7,2,'2020-04-19',4000,16,'Starry Black',10,10),(762,'MOTO C PLUS ','Mediatek MTK6737 Quad Core 1.3Ghz',179.99,12.7,2,'2020-04-19',4000,16,'Fine Gold',10,10),(763,'APPLE IPHONE 14 PLUS ','A Bionic Chip,  Core',1199.00,17.02,3,'2021-01-04',4000,512,'Starlight',1,10),(764,'REDMI NOTE 10S ','Mediatek Helio G95',189.99,16.33,6,'2020-01-15',5000,128,'Deep Sea Blue',20,10),(765,'APPLE IPHONE 14 PRO ','A Bionic Chip,  Core',1399.00,15.49,3,'2021-01-04',5000,256,'Space Black',1,10),(766,'REDMI 10 PRIME ','Mediatek Helio G95',149.99,16.51,4,'2020-01-15',6000,64,'Phantom Black',20,10),(767,'XIAOMI 11LITE NE ','Qualcomm Snapdragon 778G',254.90,16.64,8,'2020-01-15',4250,128,'Jazz Blue',20,10),(768,'REDMI NOTE 11 PRO PLUS 5G ','Qualcomm Snapdragon 778G',264.99,16.94,8,'2020-01-15',5000,128,'Mirage Blue',20,10),(769,'APPLE IPHONE 12 MINI ','A Bionic Chip with Next Generation Neural Engine',749.00,13.72,3,'2021-01-04',5000,256,'Black',1,10),(770,'REALME GT NEO 3 ','Mediatek Dimensity 8100',389.99,17.02,8,'2019-05-15',5000,128,'Asphalt Black',16,10),(771,'TECNO SPARK 9 ','MediaTek Helio G37',94.98,16.76,3,'2023-01-01',5000,64,'Sky Mirror',18,10),(773,'REDMI 11 PRIME ','Qualcomm Snapdragon 778G',139.99,16.71,3,'2020-01-15',5000,64,'Peppy Purple',20,10),(774,'OPPO RENO8 PRO 5G ','Mediatek Dimensity 8100 Max',529.99,17.02,3,'2020-01-16',4500,256,'Glazed Black',14,10),(775,'INFINIX HOT 11S ','MediaTek Helio G88',139.99,17.22,3,'2020-01-17',5000,64,'Polar Black',4,10),(777,'APPLE IPHONE 14 ','A Bionic Chip,  Core',1099.00,15.49,3,'2021-01-04',5000,512,'Blue',1,10),(778,'OPPO A17K ','MTK Helio G35',129.99,16.66,3,'2021-01-05',5000,64,'Gold',14,10),(779,'ONEPLUS 10R 5G ','MTK Helio G35',429.99,17.02,3,'2021-01-06',5000,256,'Sierra Black',13,10),(780,'OPPO A15S ','MTK Helio G35',113.89,16.56,4,'2021-01-07',4230,64,'Dynamic Black',14,10),(782,'REDMI NOTE 9 ','MediaTek Helio G85',164.99,16.59,4,'2020-01-15',5020,128,'Shadow Black',20,10),(783,'POCO X2 ','Qualcomm Snapdragon 730G',179.99,16.94,8,'2020-01-16',4500,256,'Matrix Purple',15,10),(785,'OPPO A74 5G BLACK ','MTK Helio G35',209.90,16.48,6,'2020-01-18',5000,128,'Fluid Black',14,10),(786,'I KALL Z20 PRO ','2.0 GHz Mediatek P22 Octacore',104.99,16.51,4,'2020-01-19',5000,64,'Black',3,10),(787,'MI 11X PRO 5G ','Qualcomm Snapdragon 888',449.99,16.94,8,'2020-01-20',4520,128,'Celestial Silver',9,10),(788,'REDMI NOTE 9 PRO ','QualcommÂ® Snapdragon_ 720G',179.99,16.94,4,'2020-01-15',5020,64,'Interstellar Black',20,10),(789,'APPLE IPHONE 12 MINI ','A Bionic Chip with Next Generation Neural Engine',749.00,13.72,3,'2021-01-04',5020,256,'Blue',1,10),(790,'APPLE IPHONE 14 PRO ','A Bionic Chip,  Core',1399.00,15.49,3,'2021-01-04',5020,256,'Deep Purple',1,10),(791,'OPPO A96 ','Qualcomm Snapdragon 680',239.99,16.74,8,'2021-01-05',5000,128,'Starry Black',14,10),(793,'REDMI 8 ','Qualcomm Snapdragon 439',109.99,15.8,4,'2020-01-15',5000,64,'Sapphire Blue',20,10),(794,'IQOO 9T 5G ','2.0 GHz Mediatek P22 Octacore',179.99,17.22,8,'2020-01-16',4700,128,'LEGEND',5,10),(795,'INFINIX HOT 11S ','MediaTek Helio G88',139.99,17.22,4,'2020-01-17',5000,64,'Green Wave',4,10),(797,'REDMI 9 ACTIV ','Mediatek Helio G35',179.99,16.59,6,'2020-01-15',5000,128,'Metallic Purple',20,10),(798,'APPLE IPHONE 14 PRO MAX ','A Bionic Chip,  Core',1399.00,17.02,3,'2021-01-04',5000,128,'Silver',1,10),(799,'REALME X50 PRO ','2.0 GHz Mediatek P22 Octacore',179.99,16.36,6,'2019-05-15',5000,256,'Moss Green',16,10),(800,'REALME X50 PRO ','2.0 GHz Mediatek P22 Octacore',179.99,16.36,8,'2019-05-15',4200,128,'Moss Green',16,10),(801,'NOKIA C21 PLUS ','Octa Core',129.99,16.69,4,'2018-01-11',5050,64,'Warm Grey',11,10),(802,'IQOO 9T 5G ','2.0 GHz Mediatek P22 Octacore',179.99,17.22,8,'2018-01-12',4700,128,'LEGEND',5,10),(803,'APPLE IPHONE 12 ','A Bionic Chip with Next Generation Neural Engine',749.00,15.49,3,'2021-01-04',4700,256,'Red',1,10),(805,'VIVO V25 5G ','Mediatek Dimensity 900',369.99,16.36,8,'2021-01-15',4500,256,'Surfing Blue',19,10),(806,'MI 11 LITE ','Qualcomm Snapdragon 732G',259.99,16.64,8,'2021-01-16',4250,128,'Vinyl Black',9,10),(807,'REDMI NOTE 10S ','Mediatek Helio G95',169.99,16.33,6,'2020-01-15',5000,64,'Shadow Black',20,10),(809,'XIAOMI 11I 5G ','Mediatek Dimensity 920',299.99,16.94,6,'2020-01-15',5160,128,'Purple Mist',20,10),(810,'ITEL A23 PRO ','Unisoc 9832E Quad Core',179.99,12.7,1,'2020-01-16',2400,8,'Lake Blue',6,10),(811,'ITEL A25 ','Cortex A53 architecture (Quad core)',179.99,12.7,1,'2020-01-17',3020,16,'Gradation Green',6,10),(812,'XIAOMI 12 PRO 5G ','Snapdragon@ 8 Gen 1',799.90,17.09,8,'2020-01-15',4600,256,'Couture Blue',20,10),(813,'REDMI NOTE 5 PRO ','Qualcomm Snapdragon 636',179.99,15.21,4,'2020-01-15',4000,64,'Gold',20,10),(814,'REDMI 8A DUAL ','Qualcomm Snapdragon 439',179.99,15.8,2,'2020-01-15',5000,32,'Sky White',20,10),(815,'POCO C3 ','Mediatek Helio G35',179.99,16.59,3,'2020-01-16',5000,32,'Matte Black',15,10),(816,'OPPO A54 ','MediaTek Helio P35',179.99,16.54,6,'2020-01-17',5000,128,'Moonlight Gold',14,10),(820,'APPLE IPHONE 13 ','A Bionic Chip',999.00,15.49,3,'2021-01-04',5000,128,'Awesome Blue',1,10),(821,'ITEL VISION3 TURBO ','Cortex A53 architecture (Quad core)',89.99,16.76,3,'2021-01-05',5000,64,'Multi Green',6,10),(822,'MI 10T ','Qualcomm Snapdragon 865',429.99,16.94,8,'2021-01-06',5000,128,'Cosmic Black',9,10),(823,'REALME NARZO 30 5G ','MediaTek Dimensity 700 (MT6833)',179.99,16.51,6,'2019-05-15',5000,128,'Racing Silver',16,10),(824,'OPPO A96 ','Qualcomm Snapdragon 680',239.99,16.74,8,'2019-05-16',5000,128,'Sunset Blue',14,10),(825,'REALME GT NEO 3 ','Mediatek Dimensity 8100',389.99,17.02,8,'2019-05-15',5000,128,'Nitro Blue',16,10),(826,'XIAOMI 12 PRO 5G ','Snapdragon@ 8 Gen 1',799.90,17.09,8,'2020-01-15',4600,256,'Opera Mauve',20,10),(827,'XIAOMI 11T PRO 5G HYPERPHONE ','Snapdragon@ 8 Gen 1',358.99,16.94,8,'2020-01-15',5000,128,'Celestial Magic',20,10),(828,'REDMI NOTE 10 PRO MAX ','Qualcomm Snapdragon 732G',229.99,16.94,6,'2020-01-15',5020,128,'Glacial Blue',20,10),(829,'POCO M2 PRO ','Qualcomm Snapdragon 720G',179.99,16.94,6,'2020-01-16',5000,64,'Out of the Blue',15,10),(830,'TECNO SPARK 7 ','Helio A25',89.99,16.56,2,'2020-01-17',6000,32,'Spruce Green',18,10),(831,'POCO X2 ','Qualcomm Snapdragon 730G',179.99,16.94,6,'2020-01-18',4500,64,'Matrix Purple',15,10),(832,'REALME GT NEO 2 ','Qualcomm Snapdragon 870',389.99,16.81,6,'2019-05-15',5000,256,'NEO Blue',16,10),(833,'REALME GT NEO 2 ','Qualcomm Snapdragon 870',389.99,16.81,6,'2019-05-15',5000,256,'NEO Black',16,10),(834,'REALME GT NEO 2 ','Qualcomm Snapdragon 870',349.99,16.81,8,'2019-05-15',5000,128,'NEO Black',16,7),(835,'REALME X50 PRO ','2.0 GHz Mediatek P22 Octacore',179.99,16.36,8,'2019-05-15',4200,128,'Rust Red',16,7),(836,'POCO M2 PRO ','Qualcomm Snapdragon 720G',179.99,16.94,6,'2019-05-16',5000,64,'Two Shades of Black',15,7);
/*!40000 ALTER TABLE `phone_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_User_user_name` (`user_name`),
  UNIQUE KEY `uq_User_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Yutian','John','Doe','johndoe@example.com','password123','555-555-1234','123 Main St','12345'),(2,'jack01','Jane','Smith','janesmith@example.com','password456','555-555-5678','456 Elm St','67890'),(3,'bobbb','Bob','Johnson','bobjohnson@example.com','password789','555-555-2468','789 Oak St','13579'),(4,'either00','Alice','Williams','alicewilliams@example.com','passwordabc','555-555-3691','246 Pine St','46802'),(5,'cj345','Chris','Jones','chrisjones@example.com','passworddef','555-555-1357','369 Cedar St','80246'),(6,'test','test','t','test@gmail.com','123456','524796','34 west st','25498');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `user_payment`
--

DROP TABLE IF EXISTS `user_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_payment` (
  `user_name` varchar(50) NOT NULL,
  `card_no` bigint NOT NULL,
  PRIMARY KEY (`user_name`,`card_no`),
  KEY `fk_user_payment_payment` (`card_no`),
  CONSTRAINT `user_payment_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `user` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_payment_ibfk_2` FOREIGN KEY (`card_no`) REFERENCES `payment` (`card_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_payment`
--

LOCK TABLES `user_payment` WRITE;
/*!40000 ALTER TABLE `user_payment` DISABLE KEYS */;
INSERT INTO `user_payment` VALUES ('Yutian',12345678901),('jack01',23456789012),('bobbb',34567890123),('bobbb',45678901234),('either00',56789012345),('cj345',67890123456),('cj345',78901234567);
/*!40000 ALTER TABLE `user_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'online_phone_sales_db'
--

--
-- Dumping routines for database 'online_phone_sales_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_new_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_account`(
    IN in_first_name VARCHAR(50),
    IN in_last_name VARCHAR(50),
    IN in_email VARCHAR(50),
    IN in_password VARCHAR(50),
    IN in_phone_no VARCHAR(20),
    IN in_address VARCHAR(100),
    IN in_zip_code VARCHAR(10),
    IN in_user_name VARCHAR(50)
)
BEGIN
    INSERT INTO User (first_name, last_name, email, password, phone_no, address, zip_code, user_name) 
    VALUES (in_first_name, in_last_name, in_email, in_password, in_phone_no, in_address, in_zip_code, in_user_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_new_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_payment`(
    IN in_user_name VARCHAR(50),
    IN in_card_no BIGINT,
    IN in_card_type VARCHAR(50),
    IN in_expiration_date DATETIME
)
BEGIN
	INSERT INTO payment ( card_no, card_type, expiration_date) 
    VALUES ( in_card_no, in_card_type, in_expiration_date);
    INSERT INTO user_payment (user_name, card_no) 
    VALUES (in_user_name, in_card_no);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `authentication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `authentication`(
    IN in_user_name VARCHAR(50),
    IN in_password VARCHAR(50)
)
BEGIN
    SELECT first_name
    FROM User 
    WHERE user_name = in_user_name AND password = in_password;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_order`(
	IN in_user_name VARCHAR(50), 
	IN in_card_no BIGINT
)
BEGIN
    DECLARE v_order_id INT;
    SET v_order_id = 0;
    
    START TRANSACTION;
    
    INSERT INTO orders (order_date, order_time, user_name, card_no)
    VALUES (CURDATE(), CURTIME(), in_user_name, in_card_no);
    
    SET v_order_id = LAST_INSERT_ID();
    
    INSERT INTO order_model (order_id, model_id, quantity)
    SELECT v_order_id, model_id, quantity 
    FROM cart 
    WHERE user_name = in_user_name;
    
    DELETE FROM cart WHERE user_name = in_user_name;
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_all_models` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_all_models`()
BEGIN
    SELECT pm.*, c.company_name
    FROM phone_model pm
    JOIN company c ON pm.company_id = c.company_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_by_brand` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_by_brand`(
    IN in_company_name VARCHAR(50)
)
BEGIN
    SELECT * 
    FROM phone_model pm 
    JOIN company c 
    ON pm.company_id = c.company_id 
    WHERE c.company_name Like concat("%", in_company_name, "%");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_by_color` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_by_color`(
    IN in_color VARCHAR(20)
)
BEGIN
    SELECT * 
    FROM phone_model pm
    WHERE pm.color Like concat("%", in_color, "%");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_by_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_by_price`(
    IN min_price DECIMAL(10,2),
    IN max_price DECIMAL(10,2)
)
BEGIN
    SELECT * 
    FROM phone_model 
    WHERE price BETWEEN min_price AND max_price;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_user_cart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_user_cart`(IN in_user_name VARCHAR(50))
BEGIN
  SELECT pm.model_id, 
		pm.model_name, 
		pm.price, 
        c.quantity 
  FROM phone_model pm 
  JOIN cart c 
	ON pm.model_id = c.model_id 
  WHERE c.user_name = in_user_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `display_user_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_user_payment`(
    IN in_user_name VARCHAR(50)
)
BEGIN
    SELECT p.card_no, p.card_type, p.expiration_date 
    FROM user_payment up 
    JOIN payment p USING(card_no)
    WHERE up.user_name = in_user_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_account_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_account_info`(
    IN in_user_name VARCHAR(50),
    IN in_first_name VARCHAR(50),
    IN in_last_name VARCHAR(50),
    IN in_email VARCHAR(50),
    IN in_password VARCHAR(50),
    IN in_phone_no VARCHAR(20),
    IN in_address VARCHAR(100),
    IN in_zip_code VARCHAR(10)
)
BEGIN
    UPDATE User SET 
    first_name = in_first_name, 
    last_name = in_last_name, 
    email = in_email, 
    password = in_password, 
    phone_no = in_phone_no, 
    address = in_address, 
    zip_code = in_zip_code 
    WHERE user_name = in_user_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_model_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_model_inventory`(
	IN in_model_id INT)
BEGIN
  SELECT inventory 
  FROM phone_model 
  WHERE model_id = in_model_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_item_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_item_detail`(IN p_model_id INT)
BEGIN
  SELECT 
    pm.model_id,
    pm.model_name,
    pm.processor,
    pm.price,
    pm.screen_size,
    pm.memory_size,
    pm.release_date,
    pm.battery_size,
    pm.storage,
    pm.color,
    c.company_name,
    c.website,
    c.address,
    c.phone,
    d.discount_code,
    d.discount_rate,
    d.start_date,
	d.expiration_date,
    f.keyword,
    f.description
  FROM 
    phone_model pm
	JOIN company c ON pm.company_id = c.company_id
	LEFT JOIN Model_feature mf 
		ON pm.model_id = mf.model_id
	LEFT JOIN feature f 
		ON mf.keyword = f.keyword
	LEFT JOIN model_discount md 
		ON pm.model_id = md.model_id
	LEFT JOIN discount d 
		ON md.discount_code = d.discount_code
	WHERE pm.model_id = p_model_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_order_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_order_detail`(IN in_order_id INT)
BEGIN
  SELECT 
    m.model_id,
	m.model_name, 
    m.processor, 
    m.price, 
    m.screen_size, 
    m.memory_size, 
    m.release_date, 
    m.battery_size, 
    m.storage, 
    m.color, 
    om.quantity
  FROM phone_model m
  JOIN order_model om 
	ON m.model_id = om.model_id
  WHERE om.order_id = in_order_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_user_order_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_user_order_history`(IN in_user_name VARCHAR(50))
BEGIN
	SELECT *
	FROM orders o
	WHERE o.user_name = in_user_name
	ORDER BY o.order_date DESC, o.order_time DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_add_cart_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_add_cart_item`(
    IN in_user_name VARCHAR(50), 
    IN in_model_id INT, 
    IN in_quantity INT)
BEGIN
  DECLARE current_stock INT;

  SELECT inventory INTO current_stock
  FROM phone_model pm
  WHERE pm.model_id = in_model_id;

  IF current_stock >= in_quantity THEN
    UPDATE phone_model pm
    SET inventory = inventory - in_quantity
    WHERE pm.model_id = in_model_id;

    INSERT INTO cart (user_name, model_id, quantity) 
    VALUES (in_user_name, in_model_id, in_quantity) 
    ON DUPLICATE KEY UPDATE quantity = quantity + in_quantity;
  ELSE
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Insufficient stock for the requested quantity.';
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_delete_cart_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_delete_cart_item`(
    IN in_user_name VARCHAR(50), 
    IN in_model_id INT)
BEGIN
  DECLARE current_cart_quantity INT;

  SELECT quantity INTO current_cart_quantity
  FROM cart
  WHERE user_name = in_user_name AND model_id = in_model_id;

  UPDATE phone_model
  SET inventory = inventory + current_cart_quantity
  WHERE model_id = in_model_id;

  DELETE FROM cart 
  WHERE user_name = in_user_name AND model_id = in_model_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_edit_cart_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_edit_cart_item`(
    IN in_user_name VARCHAR(50), 
    IN in_model_id INT, 
    IN in_new_quantity INT)
BEGIN
  DECLARE current_cart_quantity INT;
  DECLARE current_stock INT;
  DECLARE diff_quantity INT;

  SELECT quantity INTO current_cart_quantity
  FROM cart
  WHERE user_name = in_user_name AND model_id = in_model_id;

  SELECT inventory INTO current_stock
  FROM phone_model pm
  WHERE pm.model_id = in_model_id;

  SET diff_quantity = in_new_quantity - current_cart_quantity;

  IF diff_quantity <= current_stock THEN
    UPDATE phone_model
    SET inventory = inventory - diff_quantity
    WHERE model_id = in_model_id;

    UPDATE cart SET quantity = in_new_quantity 
    WHERE user_name = in_user_name AND model_id = in_model_id;
  ELSE
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Insufficient stock for the requested quantity.';
  END IF;
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

-- Dump completed on 2023-04-20 14:58:38
