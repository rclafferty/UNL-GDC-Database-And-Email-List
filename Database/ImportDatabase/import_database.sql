-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: class
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
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emails` (
  `memberID` int(11) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  UNIQUE KEY `email_2` (`email`),
  KEY `memberID` (`memberID`),
  KEY `email` (`email`),
  CONSTRAINT `emails_ibfk_1` FOREIGN KEY (`memberID`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (1,'mallman@gmail.com'),(2,'aconway@gmail.com'),(3,'mfitzpatrick@gmail.com'),(4,'smcnamara@gmail.com'),(5,'unixon@gmail.com'),(6,'sfulton@gmail.com'),(7,'hleblanc@gmail.com'),(8,'jwynn@gmail.com'),(9,'eguest@gmail.com'),(10,'erobins@gmail.com'),(11,'kmonaghan@gmail.com'),(12,'jhayward@gmail.com'),(13,'scalvert@gmail.com'),(14,'rbloom@gmail.com'),(15,'damos@gmail.com'),(16,'jthompson@gmail.com'),(17,'modoherty@gmail.com'),(18,'tfowler@gmail.com'),(19,'awebber@gmail.com'),(20,'msummers@gmail.com'),(21,'trodgers@gmail.com'),(22,'slynch@gmail.com'),(23,'arodrigues@gmail.com'),(24,'tedge@gmail.com'),(25,'wmilner@gmail.com'),(26,'tneale@gmail.com'),(27,'bbarr@gmail.com'),(28,'adavies@gmail.com'),(29,'lmccartney@gmail.com'),(30,'ktanner@gmail.com'),(31,'aweber@gmail.com'),(32,'owade@gmail.com'),(33,'zramsey@gmail.com'),(34,'rbriggs@gmail.com'),(35,'mnolan@gmail.com'),(36,'jfrederick@gmail.com'),(37,'belliott@gmail.com'),(38,'mbeech@gmail.com'),(39,'sbull@gmail.com'),(40,'rferrell@gmail.com'),(41,'esosa@gmail.com'),(42,'ilandry@gmail.com'),(43,'smosley@gmail.com'),(44,'lventura@gmail.com'),(45,'lwormald@gmail.com'),(46,'roreilly@gmail.com'),(47,'dhudson@gmail.com'),(48,'sfreeman@gmail.com'),(49,'cboyce@gmail.com'),(50,'rvilla@gmail.com'),(51,'cproctor@gmail.com'),(52,'icolon@gmail.com'),(53,'elyon@gmail.com'),(54,'mzuniga@gmail.com'),(55,'gwhittle@gmail.com'),(56,'mcisneros@gmail.com'),(57,'edodson@gmail.com'),(58,'abest@gmail.com'),(59,'croche@gmail.com'),(60,'bmartin@gmail.com'),(61,'hhuff@gmail.com'),(62,'kstamp@gmail.com'),(63,'kwang@gmail.com'),(64,'lridley@gmail.com'),(65,'jhughes@gmail.com'),(66,'mhayward@gmail.com'),(67,'cbrady@gmail.com'),(68,'ksims@gmail.com'),(69,'epitts@gmail.com');
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventattendance`
--

DROP TABLE IF EXISTS `eventattendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventattendance` (
  `eventID` int(11) DEFAULT NULL,
  `memberID` int(11) DEFAULT NULL,
  KEY `eventID` (`eventID`),
  KEY `memberID` (`memberID`),
  CONSTRAINT `eventattendance_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `events` (`id`),
  CONSTRAINT `eventattendance_ibfk_2` FOREIGN KEY (`memberID`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventattendance`
--

LOCK TABLES `eventattendance` WRITE;
/*!40000 ALTER TABLE `eventattendance` DISABLE KEYS */;
INSERT INTO `eventattendance` VALUES (1,1),(1,2),(1,5),(2,1),(2,2),(2,3),(2,4),(2,64),(3,1),(3,2),(3,58),(4,1),(4,2),(4,4),(5,1),(5,2),(5,4),(6,1),(6,2),(6,4),(7,1),(7,2),(7,53),(8,1),(8,3),(8,5),(8,2),(8,66),(8,43),(8,64),(8,4),(8,59),(8,60),(8,62),(9,1),(9,2),(9,5),(10,2),(10,1),(10,43),(10,48),(10,3),(10,50),(10,52),(10,49),(10,6),(10,7),(10,41),(10,57),(11,2),(11,48),(11,66),(11,4),(11,5),(11,58),(11,63),(11,3),(11,40),(11,1),(11,64),(11,43),(11,65),(12,1),(12,2),(12,4),(12,3),(12,16),(12,15),(12,20),(12,10),(12,12),(12,25),(12,11),(12,18),(12,9),(13,1),(13,2),(14,1),(14,2),(14,4),(14,6),(14,7);
/*!40000 ALTER TABLE `eventattendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `locationID` int(11) DEFAULT NULL,
  `eventTypeID` int(11) DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `locationID` (`locationID`),
  KEY `eventTypeID` (`eventTypeID`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`locationID`) REFERENCES `locations` (`id`),
  CONSTRAINT `events_ibfk_2` FOREIGN KEY (`eventTypeID`) REFERENCES `eventtypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Spring 2019 Club Fair',7,1,'2019-01-28 00:00:00','2019-01-28 00:00:00'),(2,'GDC Showcase',3,1,'2019-04-25 00:00:00','2019-04-25 00:00:00'),(3,'Introduce A Girl To Engineering Day',5,1,'2019-05-11 00:00:00','2019-05-11 00:00:00'),(4,'Reverse Career Fair',8,1,'2019-09-25 00:00:00','2019-09-25 00:00:00'),(5,'CSE Involvement Fair',6,1,'2019-09-26 00:00:00','2019-09-26 00:00:00'),(6,'Big Red Welcome',9,2,'2019-08-25 00:00:00','2019-08-25 00:00:00'),(7,'Chillennium 2018',10,3,'2018-10-12 00:00:00','2018-10-14 00:00:00'),(8,'K-State Game Jam 2019',11,3,'2019-02-08 00:00:00','2019-02-10 00:00:00'),(9,'Chillennium 2019',10,3,'2019-10-04 00:00:00','2019-10-06 00:00:00'),(10,'Q&A Talk with Laura Adams and Tyler Padgett',1,4,'2018-10-28 00:00:00','2018-10-28 00:00:00'),(11,'Q&A Talk with Joel Clark',1,4,'2019-02-17 00:00:00','2019-02-17 00:00:00'),(12,'Q&A Talk with Gracie Arenas',1,4,'2019-10-27 00:00:00','2019-10-27 00:00:00'),(13,'ALEC 102 Presentation',12,5,'2019-04-18 00:00:00','2019-04-18 00:00:00'),(14,'Insane Inflatable 5K',4,6,'2019-10-25 00:00:00','2019-10-25 00:00:00');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventtypes`
--

DROP TABLE IF EXISTS `eventtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventType` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventtypes`
--

LOCK TABLES `eventtypes` WRITE;
/*!40000 ALTER TABLE `eventtypes` DISABLE KEYS */;
INSERT INTO `eventtypes` VALUES (1,'Showcase'),(2,'Festival'),(3,'Competition'),(4,'Guest Speaker'),(5,'Classroom Visit'),(6,'Fundraiser');
/*!40000 ALTER TABLE `eventtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `building` varchar(30) DEFAULT NULL,
  `room` int(11) DEFAULT NULL,
  `city` varchar(20) NOT NULL DEFAULT 'Lincoln',
  `state` varchar(2) NOT NULL DEFAULT 'NE',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_2` (`name`),
  UNIQUE KEY `building` (`building`,`room`,`city`,`state`),
  KEY `name` (`name`,`building`,`room`,`city`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (2,'Avery 106','Avery Hall',106,'Lincoln','NE'),(1,'Avery 19','Avery Hall',19,'Lincoln','NE'),(3,'Avery Basement','Avery Hall',NULL,'Lincoln','NE'),(7,'City Campus Student Union','City Campus Student Union',NULL,'Lincoln','NE'),(12,'East Campus',NULL,NULL,'Lincoln','NE'),(5,'Innovation Campus','Innovation Campus',NULL,'Lincoln','NE'),(11,'KSU Engineering Hall','Engineering Hall',NULL,'Manhattan','KS'),(4,'Lincoln Airfield',NULL,NULL,'Lincoln','NE'),(8,'Pinacle Bank Arena','Pinacle Bank Arena',NULL,'Lincoln','NE'),(6,'Schorr Center','Schorr Center',NULL,'Lincoln','NE'),(9,'Stadium Parking Lot',NULL,NULL,'Lincoln','NE'),(10,'TAMU Memorial Student Center','Memorial Student Center',NULL,'College Station','TX');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `majors`
--

DROP TABLE IF EXISTS `majors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `majors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `major` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `major` (`major`),
  KEY `major_2` (`major`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majors`
--

LOCK TABLES `majors` WRITE;
/*!40000 ALTER TABLE `majors` DISABLE KEYS */;
INSERT INTO `majors` VALUES (10,'Accounting'),(7,'Actuarial Science'),(13,'Architecture'),(5,'Biological Systems Engineering'),(6,'Chemical Engineering'),(3,'Computer Engineering'),(1,'Computer Science'),(8,'Electrical Engineering'),(9,'Graphic Design'),(15,'Marketing'),(14,'Mathematics'),(12,'Music'),(11,'N/A'),(4,'Software Engineering'),(2,'Undeclared');
/*!40000 ALTER TABLE `majors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetingattendance`
--

DROP TABLE IF EXISTS `meetingattendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetingattendance` (
  `meetingID` int(11) DEFAULT NULL,
  `memberID` int(11) DEFAULT NULL,
  UNIQUE KEY `meetingID` (`meetingID`,`memberID`),
  KEY `memberID` (`memberID`),
  CONSTRAINT `meetingattendance_ibfk_1` FOREIGN KEY (`meetingID`) REFERENCES `meetings` (`id`),
  CONSTRAINT `meetingattendance_ibfk_2` FOREIGN KEY (`memberID`) REFERENCES `members` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetingattendance`
--

LOCK TABLES `meetingattendance` WRITE;
/*!40000 ALTER TABLE `meetingattendance` DISABLE KEYS */;
INSERT INTO `meetingattendance` VALUES (1,1),(1,2),(1,3),(1,42),(1,44),(1,53),(2,1),(2,2),(2,3),(2,40),(2,42),(2,44),(2,53),(3,1),(3,2),(3,3),(3,6),(3,17),(3,42),(3,44),(3,45),(3,46),(3,47),(3,48),(3,51),(3,52),(3,53),(3,56),(3,57),(4,1),(4,2),(4,3),(4,6),(4,7),(4,41),(4,43),(4,48),(4,49),(4,50),(4,52),(4,57),(5,1),(5,2),(5,3),(5,40),(5,43),(5,48),(5,52),(6,3),(6,6),(6,7),(6,40),(6,43),(6,45),(6,48),(6,52),(7,1),(7,2),(7,3),(7,40),(7,43),(7,48),(8,3),(8,43),(9,1),(9,2),(9,3),(9,40),(9,43),(9,48),(10,1),(10,2),(10,3),(10,5),(10,40),(10,43),(10,48),(11,1),(11,2),(11,3),(11,4),(11,5),(11,17),(11,48),(11,58),(11,59),(11,60),(11,61),(11,62),(11,63),(11,64),(11,66),(11,67),(12,1),(12,2),(12,3),(12,5),(12,40),(12,43),(12,58),(12,63),(12,64),(12,66),(13,1),(13,2),(13,3),(13,4),(13,5),(13,40),(13,43),(13,48),(13,58),(13,63),(13,64),(13,65),(13,66),(14,1),(14,2),(14,3),(14,4),(14,43),(14,48),(14,58),(14,61),(14,64),(14,67),(15,1),(15,4),(15,5),(15,43),(15,58),(15,61),(15,64),(15,68),(15,69),(16,1),(16,2),(17,1),(17,2),(17,3),(17,43),(17,58),(17,61),(17,64),(18,3),(18,4),(18,43),(18,58),(19,1),(19,2),(19,3),(19,4),(19,5),(19,40),(19,61),(20,1),(20,2),(20,3),(20,4),(20,5),(20,40),(20,43),(20,58),(20,61),(20,64),(21,1),(21,2),(21,3),(21,4),(21,5),(21,14),(21,15),(21,16),(21,23),(21,25),(21,26),(21,28),(21,29),(21,35),(21,36),(21,37),(21,38),(21,39),(22,1),(22,2),(22,3),(22,4),(22,5),(22,14),(22,15),(22,16),(22,22),(22,23),(22,24),(22,25),(22,28),(22,33),(22,34),(22,35),(22,36),(23,3),(23,4),(23,9),(23,15),(23,16),(23,21),(23,25),(23,26),(23,28),(23,30),(23,31),(23,33),(23,36),(24,1),(24,2),(24,4),(24,5),(24,9),(24,10),(24,11),(24,15),(24,21),(24,22),(24,25),(24,31),(24,34),(25,3),(25,4),(25,6),(25,7),(25,9),(25,10),(25,15),(25,16),(25,19),(25,20),(25,22),(25,26),(25,28),(25,31),(25,34),(25,35),(25,36),(26,1),(26,2),(26,3),(26,4),(26,5),(26,6),(26,7),(26,9),(26,10),(26,11),(26,12),(26,15),(26,16),(26,18),(26,19),(26,20),(26,25),(26,28),(26,31),(26,34),(26,35),(26,36),(27,1),(27,2),(27,3),(27,4),(27,9),(27,10),(27,11),(27,12),(27,15),(27,16),(27,18),(27,20),(27,25),(28,1),(28,2),(28,3),(28,4),(28,5),(28,6),(28,7),(28,9),(28,10),(28,11),(28,12),(28,15),(28,17),(28,20),(28,25),(28,35),(29,1),(29,2),(29,3),(29,9),(29,10),(29,12),(29,15),(29,16),(29,20),(29,25),(29,27),(29,31),(29,34),(29,36),(30,1),(30,2),(30,3),(30,4),(30,5),(30,8),(30,9),(30,10),(30,11),(30,12),(30,15),(30,16),(30,25),(30,27),(30,31),(30,35),(31,1),(31,2),(31,3),(31,4),(31,5),(31,9),(31,10),(31,15),(31,16),(31,20),(31,25),(31,27),(31,31),(31,34),(31,35),(31,36);
/*!40000 ALTER TABLE `meetingattendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeID` int(11) DEFAULT '1',
  `meetingDate` datetime NOT NULL,
  `topic` varchar(200) DEFAULT NULL,
  `locationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meetingDate` (`meetingDate`),
  KEY `typeID` (`typeID`),
  KEY `locationID` (`locationID`),
  KEY `topic` (`topic`),
  CONSTRAINT `meetings_ibfk_1` FOREIGN KEY (`typeID`) REFERENCES `meetingtypes` (`id`),
  CONSTRAINT `meetings_ibfk_2` FOREIGN KEY (`locationID`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
INSERT INTO `meetings` VALUES (1,1,'2018-09-16 19:00:00','Inaugural Meeting',1),(2,5,'2018-09-23 19:00:00','Recruitment Meeting',1),(3,1,'2018-10-21 19:00:00','General Work Day',1),(4,2,'2018-10-28 19:00:00','Q&A Session with Laura and Tyler',1),(5,1,'2018-11-04 19:00:00','General Meeting',1),(6,4,'2018-11-11 19:00:00','General Work Day',1),(7,1,'2018-11-18 19:00:00','2019 Elections and Constitution Approval',1),(8,4,'2018-12-02 19:00:00','General Work Day',1),(9,1,'2018-12-09 19:00:00','RSO Application',1),(10,1,'2019-01-13 19:00:00','Pre-Recruiting Meeting',1),(11,5,'2019-01-27 19:00:00','Recruitment Meeting',1),(12,3,'2019-02-03 19:00:00','2D Game Kit Demo',1),(13,2,'2019-02-17 19:00:00','Q&A Session with Joel Clark',2),(14,3,'2019-03-03 19:00:00','Git Demo',1),(15,3,'2019-03-10 19:00:00','2D Movement Demo',1),(16,4,'2019-03-24 19:00:00','Optional Work Day',1),(17,3,'2019-03-31 19:00:00','Game Design Activity',1),(18,3,'2019-04-07 19:00:00','2D Art Demo',1),(19,1,'2019-04-14 19:00:00','Nominations Announcement',1),(20,6,'2019-04-28 19:00:00','Special Elections - Treasurer & Dev Lead',1),(21,5,'2019-09-08 19:00:00','Fall 2019 Recruiting Meeting',1),(22,3,'2019-09-15 19:00:00','Git Good Demo',1),(23,1,'2019-09-22 19:00:00','Unity 2D Demo',1),(24,1,'2019-09-29 19:00:00','Game Design Activity',1),(25,1,'2019-10-06 19:00:00','Team Brainstorming',1),(26,4,'2019-10-13 19:00:00','Work Day',1),(27,4,'2019-10-27 19:00:00','Q&A Session with Gracie Arenas Strittmatter',1),(28,1,'2019-11-03 19:00:00','Juice It Video & Discussion',1),(29,1,'2019-11-10 19:00:00','Elections & Nominations Announced',1),(30,3,'2019-11-17 19:00:00','2D Animation Demo',1),(31,6,'2019-11-24 19:00:00','2020 Officer Elections',1);
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetingtypes`
--

DROP TABLE IF EXISTS `meetingtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetingtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meetingType` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meetingType` (`meetingType`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetingtypes`
--

LOCK TABLES `meetingtypes` WRITE;
/*!40000 ALTER TABLE `meetingtypes` DISABLE KEYS */;
INSERT INTO `meetingtypes` VALUES (3,'Demo'),(6,'Elections'),(1,'General Meeting'),(2,'Guest Speaker'),(5,'Recruitment Meeting'),(4,'Work Day');
/*!40000 ALTER TABLE `meetingtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(15) NOT NULL,
  `lastName` varchar(15) NOT NULL,
  `majorID` int(11) DEFAULT '1',
  `doubleMajorID` int(11) DEFAULT '1',
  `yearID` int(11) DEFAULT '1',
  `github` varchar(20) NOT NULL DEFAULT 'N/A',
  `discord` varchar(20) NOT NULL DEFAULT 'N/A',
  `googleDrive` varchar(40) NOT NULL DEFAULT 'N/A',
  PRIMARY KEY (`id`),
  UNIQUE KEY `firstName_2` (`firstName`,`lastName`),
  KEY `majorID` (`majorID`),
  KEY `doubleMajorID` (`doubleMajorID`),
  KEY `yearID` (`yearID`),
  KEY `firstName` (`firstName`,`lastName`),
  KEY `github` (`github`,`discord`,`googleDrive`),
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`majorID`) REFERENCES `majors` (`id`),
  CONSTRAINT `members_ibfk_2` FOREIGN KEY (`doubleMajorID`) REFERENCES `majors` (`id`),
  CONSTRAINT `members_ibfk_3` FOREIGN KEY (`yearID`) REFERENCES `schoolyears` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Anayah','Conway',1,2,1,'aconway','aconway#4648','aconway@gmail.com'),(2,'Maha','Fitzpatrick',1,2,1,'mfitzpatrick','mfitzpatrick#9924','mfitzpatrick@gmail.com'),(3,'Stephen','Mcnamara',3,2,2,'smcnamara','smcnamara#6963','smcnamara@gmail.com'),(4,'Uzair','Nixon',4,2,3,'unixon','unixon#9318','unixon@gmail.com'),(5,'Sommer','Fulton',5,2,3,'sfulton','sfulton#1645','sfulton@gmail.com'),(6,'Harvey','Leblanc',4,2,2,'hleblanc','hleblanc#3878','hleblanc@gmail.com'),(7,'JohnJames','Wynn',6,2,2,'jwynn','jwynn#5164','jwynn@gmail.com'),(8,'Eliza','Guest',4,2,4,'eguest','eguest#4130','eguest@gmail.com'),(9,'Efa','Robins',2,2,4,'erobins','erobins#5659','erobins@gmail.com'),(10,'Kelsea','Monaghan',1,2,3,'kmonaghan','kmonaghan#7864','kmonaghan@gmail.com'),(11,'Joe','Hayward',1,2,4,'jhayward','jhayward#7694','jhayward@gmail.com'),(12,'Sahar','Calvert',1,7,4,'scalvert','scalvert#9040','scalvert@gmail.com'),(13,'Rudi','Bloom',8,2,4,'rbloom','rbloom#9010','rbloom@gmail.com'),(14,'Deen','Amos',3,2,4,'damos','damos#6813','damos@gmail.com'),(15,'Jason','Thompson',4,2,4,'jthompson','jthompson#6103','jthompson@gmail.com'),(16,'Maggie','ODoherty',1,9,4,'modoherty','modoherty#6897','modoherty@gmail.com'),(17,'Talha','Fowler',4,2,3,'tfowler','tfowler#7696','tfowler@gmail.com'),(18,'Aqeel','Webber',1,2,4,'awebber','awebber#2662','awebber@gmail.com'),(19,'Mikael','Summers',1,2,4,'msummers','msummers#5002','msummers@gmail.com'),(20,'TylerJay','Rodgers',4,2,4,'trodgers','trodgers#3853','trodgers@gmail.com'),(21,'Silas','Lynch',6,2,4,'slynch','slynch#1949','slynch@gmail.com'),(22,'Arjan','Rodrigues',3,2,2,'arodrigues','arodrigues#9821','arodrigues@gmail.com'),(23,'Tony','Edge',1,2,4,'tedge','tedge#7583','tedge@gmail.com'),(24,'Waleed','Milner',1,2,3,'wmilner','wmilner#2849','wmilner@gmail.com'),(25,'Theia','Neale',1,2,4,'tneale','tneale#6202','tneale@gmail.com'),(26,'Brittany','Barr',4,2,4,'bbarr','bbarr#2564','bbarr@gmail.com'),(27,'Abraham','Davies',10,2,4,'adavies','adavies#4920','adavies@gmail.com'),(28,'Lorenzo','Mccartney',4,2,4,'lmccartney','lmccartney#9780','lmccartney@gmail.com'),(29,'Korben','Tanner',1,2,3,'ktanner','ktanner#2445','ktanner@gmail.com'),(30,'Athena','Weber',1,2,4,'aweber','aweber#6124','aweber@gmail.com'),(31,'Osman','Wade',4,2,4,'owade','owade#5483','owade@gmail.com'),(32,'Zayyan','Ramsey',1,2,4,'zramsey','zramsey#8818','zramsey@gmail.com'),(33,'Rajveer','Briggs',4,2,4,'rbriggs','rbriggs#8426','rbriggs@gmail.com'),(34,'Mathilde','Nolan',4,2,4,'mnolan','mnolan#9772','mnolan@gmail.com'),(35,'Jasmine','Frederick',4,2,4,'jfrederick','jfrederick#0489','jfrederick@gmail.com'),(36,'Bhavik','Elliott',4,2,4,'belliott','belliott#9683','belliott@gmail.com'),(37,'Mahi','Beech',1,2,4,'mbeech','mbeech#8136','mbeech@gmail.com'),(38,'Shirley','Bull',11,2,5,'sbull','sbull#6347','sbull@gmail.com'),(39,'Rayhaan','Ferrell',1,12,3,'rferrell','rferrell#5035','rferrell@gmail.com'),(40,'Ellesha','Sosa',13,2,2,'esosa','esosa#3281','esosa@gmail.com'),(41,'Izabel','Landry',1,14,3,'ilandry','ilandry#1644','ilandry@gmail.com'),(42,'Stefan','Mosley',1,2,2,'smosley','smosley#7057','smosley@gmail.com'),(43,'Luisa','Ventura',1,2,6,'lventura','lventura#1716','lventura@gmail.com'),(44,'LexiMai','Wormald',1,2,2,'lwormald','lwormald#8414','lwormald@gmail.com'),(45,'Rikki','OReilly',1,2,3,'roreilly','roreilly#7130','roreilly@gmail.com'),(46,'Daniella','Hudson',4,2,3,'dhudson','dhudson#1422','dhudson@gmail.com'),(47,'Siyana','Freeman',1,2,3,'sfreeman','sfreeman#3071','sfreeman@gmail.com'),(48,'Colleen','Boyce',4,2,2,'cboyce','cboyce#4385','cboyce@gmail.com'),(49,'RileyJay','Villa',4,2,3,'rvilla','rvilla#0159','rvilla@gmail.com'),(50,'Cassidy','Proctor',1,2,3,'cproctor','cproctor#1978','cproctor@gmail.com'),(51,'Isla','Colon',1,2,6,'icolon','icolon#6085','icolon@gmail.com'),(52,'Esther','Lyon',6,2,2,'elyon','elyon#1720','elyon@gmail.com'),(53,'Myla','Zuniga',1,2,2,'mzuniga','mzuniga#0537','mzuniga@gmail.com'),(54,'Gordon','Whittle',1,2,3,'gwhittle','gwhittle#0640','gwhittle@gmail.com'),(55,'Morris','Cisneros',3,2,6,'mcisneros','mcisneros#8001','mcisneros@gmail.com'),(56,'Emillie','Dodson',11,2,5,'edodson','edodson#3031','edodson@gmail.com'),(57,'Albert','Best',11,2,5,'abest','abest#7088','abest@gmail.com'),(58,'Clinton','Roche',9,2,3,'croche','croche#5099','croche@gmail.com'),(59,'Bjorn','Martin',4,2,3,'bmartin','bmartin#0214','bmartin@gmail.com'),(60,'Harper','Huff',4,2,3,'hhuff','hhuff#7721','hhuff@gmail.com'),(61,'Karol','Stamp',15,2,3,'kstamp','kstamp#6507','kstamp@gmail.com'),(62,'Kerys','Wang',4,2,3,'kwang','kwang#9301','kwang@gmail.com'),(63,'Lesley','Ridley',1,2,5,'lridley','lridley#8955','lridley@gmail.com'),(64,'Jax','Hughes',1,2,2,'jhughes','jhughes#0404','jhughes@gmail.com'),(65,'Maleeha','Hayward',1,2,6,'mhayward','mhayward#9234','mhayward@gmail.com'),(66,'Carlie','Brady',1,2,3,'cbrady','cbrady#7103','cbrady@gmail.com'),(67,'Kendall','Sims',1,2,6,'ksims','ksims#1951','ksims@gmail.com'),(68,'Elly','Pitts',11,2,5,'epitts','epitts#6316','epitts@gmail.com'),(69,'Brady','Cundall',11,2,5,'N/A','N/A','N/A');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolyears`
--

DROP TABLE IF EXISTS `schoolyears`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schoolyears` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schoolYear` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schoolYear` (`schoolYear`),
  KEY `schoolYear_2` (`schoolYear`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolyears`
--

LOCK TABLES `schoolyears` WRITE;
/*!40000 ALTER TABLE `schoolyears` DISABLE KEYS */;
INSERT INTO `schoolyears` VALUES (4,'Freshman'),(2,'Junior'),(1,'Masters'),(5,'N/A'),(6,'Senior'),(3,'Sophomore');
/*!40000 ALTER TABLE `schoolyears` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'class'
--

--
-- Dumping routines for database 'class'
--
/*!50003 DROP FUNCTION IF EXISTS `AddMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `AddMember`(
    firstName varchar(15),
    lastName varchar(15),
    major varchar(30),
    doubleMajor varchar(30),
    schoolYear varchar(20),
    github varchar(20),
    discord varchar(20),
    googleDrive varchar(40)
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    -- DECLARE product int DEFAULT 0;
    -- SET product = num * num;
    -- RETURN (product);

    DECLARE memberMajor varchar(30);
    DECLARE memberMajorID int;
    DECLARE memberDMajor varchar(30);
    DECLARE memberDMajorID int;
    DECLARE memberYear varchar(20);
    DECLARE memberYearID int;

    DECLARE memberGitHub varchar(20);
    DECLARE memberDiscord varchar(20);
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND BEGIN END;

    IF major IS NULL THEN
        SET memberMajor = 'Undeclared';
    ELSE
        SET memberMajor = major;
    END IF;

    IF doubleMajor IS NULL THEN
        SET memberDMajor = 'Undeclared';
    ELSE
        SET memberDMajor = doubleMajor;
    END IF;

    IF schoolYear IS NULL THEN
        SET memberYear = 'N/A';
    ELSE
        SET memberYear = schoolYear;
    END IF;

    -- Check major
	SELECT id
	INTO memberMajorID
	FROM Majors m
	WHERE m.major LIKE CONCAT('%', memberMajor, '%');

    -- If not found
    IF memberMajorID IS NULL THEN
        -- Insert
        INSERT INTO Majors (major) VALUE (memberMajor);

        -- Get new ID
        SELECT id
        INTO memberMajorID
        FROM Majors m
        WHERE m.major LIKE CONCAT('%', memberMajor, '%');
    END IF;

    -- Check double major
	SELECT id
	INTO memberDMajorID
	FROM Majors m
	WHERE m.major LIKE CONCAT('%', memberDMajor, '%');

    -- If double major not found
    IF memberDMajorID IS NULL THEN
        -- Insert
        INSERT INTO Majors (major) VALUE (memberDMajor);

        -- Get new ID
        SELECT id
        INTO memberDMajorID
        FROM Majors m
        WHERE m.major LIKE CONCAT('%', memberDMajor, '%');
    END IF;

    -- Check school year
	SELECT id
	INTO memberYearID
	FROM SchoolYears s
	WHERE s.schoolYear LIKE CONCAT('%', memberYear, '%');

    -- If school year not found
    IF memberYearID IS NULL THEN
        -- Insert
        INSERT INTO Majors (major) VALUE (memberDMajor);

        -- Get new ID
        SELECT id
        INTO memberYearID
        FROM SchoolYears s
        WHERE s.schoolYear LIKE CONCAT('%', memberYear, '%');
    END IF;

    IF github IS NULL THEN
        SET memberGitHub = 'N/A';
    ELSE
        SET memberGitHub = github;
    END IF;

    IF discord IS NULL THEN
        SET memberDiscord = 'N/A';
    ELSE
        SET memberDiscord = discord;
    END IF;

    INSERT INTO Members (firstName, lastName, majorID, doubleMajorID, yearID, github, discord, googleDrive) VALUE (firstName, lastName, memberMajorID, memberDMajorID, memberYearID, memberGitHub, memberDiscord, googleDrive);
	return (True);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddArchivedMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddArchivedMember`(
    firstName varchar(15),
    lastName varchar(15)
)
BEGIN
	CALL AddMember(firstName, lastName, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddLocation`(
    locationName varchar(30),
    building varchar(30),
    room int,
    city varchar(20),
    state varchar(2)
)
BEGIN
    INSERT INTO Locations(name, building, room, city, state) VALUE (locationName, building, room, city, state);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddLocationNameOnly` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddLocationNameOnly`(
    locationName varchar(20)
)
BEGIN
    INSERT INTO Locations(name) VALUE (locationName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddMeeting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddMeeting`(
    meeting datetime,
    meetingTopic varchar(200),
    locationName varchar(50),
    meetingType varchar(40)
)
BEGIN
    DECLARE meetingLocationID int;
    DECLARE meetingTypeID int;
    SELECT id
    INTO meetingLocationID
    FROM Locations l
    WHERE l.name LIKE locationName;
    SELECT id
    INTO meetingTypeID
    FROM MeetingTypes mt
    WHERE mt.meetingType LIKE meetingType;
    IF meetingLocationID IS NOT NULL THEN
        IF meetingTypeID IS NULL THEN
            CALL AddMeetingType(meetingType);
        END IF;
        SELECT id
        INTO meetingTypeID
        FROM MeetingTypes mt
        WHERE mt.meetingType LIKE meetingType;
		INSERT INTO Meetings (meetingDate, topic, locationID, typeID) VALUE (meeting, meetingTopic, meetingLocationID, meetingTypeID);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddMeetingAttendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddMeetingAttendance`(
    firstName varchar(15),
    lastName varchar(15),
    meeting datetime
)
BEGIN
    DECLARE memberDatabaseID int;
    DECLARE meetingTimeID int;
    SELECT id
    INTO memberDatabaseID
    FROM Members m
    WHERE m.firstName LIKE CONCAT('%', firstName, '%')
        AND m.lastName LIKE CONCAT('%', lastName, '%');
    IF memberDatabaseID IS NOT NULL THEN
    
        SELECT id
        INTO meetingTimeID
        FROM Meetings me
        WHERE me.meetingDate LIKE meeting;
        IF meetingTimeID IS NULL THEN
            INSERT INTO Meetings (meetingDate) VALUE (meeting);
            SELECT id
            INTO meetingTimeID
            FROM Meetings me
            WHERE me.meetingDate LIKE meeting;
        END IF;
        
        INSERT INTO MeetingAttendance (meetingID, memberID) VALUES (meetingTimeID, memberDatabaseID);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddMeetingType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddMeetingType`(
    meetingType varchar(40)
)
BEGIN
    IF meetingType IS NOT NULL THEN
        INSERT INTO MeetingTypes (meetingType) VALUE (meetingType);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddMember`(
    firstName varchar(15),
    lastName varchar(15),
    major varchar(30),
    doubleMajor varchar(30),
    schoolYear varchar(20),
    github varchar(20),
    discord varchar(20),
    googleDrive varchar(40),
    primaryEmail varchar(40)
)
BEGIN
    DECLARE memberMajor varchar(30);
    DECLARE memberMajorID int;
    DECLARE memberDMajor varchar(30);
    DECLARE memberDMajorID int;
    DECLARE memberYear varchar(20);
    DECLARE memberYearID int;
    DECLARE memberGitHub varchar(20);
    DECLARE memberDiscord varchar(20);
    DECLARE memberGoogleDrive varchar(40);
    
    DECLARE memberIDNumber int;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND BEGIN END;
    IF major IS NULL THEN
        SET memberMajor = 'N/A';
    ELSE
        SET memberMajor = major;
    END IF;
    IF doubleMajor IS NULL THEN
        SET memberDMajor = 'Undeclared';
    ELSE
        SET memberDMajor = doubleMajor;
    END IF;
    IF schoolYear IS NULL THEN
        SET memberYear = 'N/A';
    ELSE
        SET memberYear = schoolYear;
    END IF;
    -- Check major
	SELECT id
	INTO memberMajorID
	FROM Majors m
	WHERE m.major LIKE CONCAT('%', memberMajor, '%');
    
    if memberMajorID is null then
		INSERT INTO Majors (major) VALUE (memberMajor);
        
		SELECT id
		INTO memberMajorID
		FROM Majors m
		WHERE m.major LIKE CONCAT('%', memberMajor, '%');
    end if;
    -- Check double major
	SELECT id
	INTO memberDMajorID
	FROM Majors m
	WHERE m.major LIKE CONCAT('%', memberDMajor, '%');
    
    if memberDMajorID is null then
		INSERT INTO Majors (major) VALUE (memberDMajor);
        
		SELECT id
		INTO memberDMajorID
		FROM Majors m
		WHERE m.major LIKE CONCAT('%', memberDMajor, '%');
	end if;
    -- Check school year
	SELECT id
	INTO memberYearID
	FROM SchoolYears s
	WHERE s.schoolYear LIKE CONCAT('%', memberYear, '%');
    
    if memberYearID is null then
		INSERT INTO SchoolYears (schoolYear) VALUE (memberYear);
        
		SELECT id
		INTO memberYearID
		FROM SchoolYears s
		WHERE s.schoolYear LIKE CONCAT('%', memberYear, '%');
    end if;
    IF github IS NULL THEN
        SET memberGitHub = 'N/A';
    ELSE
        SET memberGitHub = github;
    END IF;
    IF discord IS NULL THEN
        SET memberDiscord = 'N/A';
    ELSE
        SET memberDiscord = discord;
    END IF;
    
    IF googleDrive IS NULL THEN
		SET memberGoogleDrive = 'N/A';
	ELSE
		set memberGoogleDrive = googleDrive;
	END IF;
    INSERT INTO Members (firstName, lastName, majorID, doubleMajorID, yearID, github, discord, googleDrive) VALUES (firstName, lastName, memberMajorID, memberDMajorID, memberYearID, memberGitHub, memberDiscord, memberGoogleDrive);
	
    SELECT id
    INTO memberIDNumber
    FROM Members m
    WHERE m.firstName LIKE firstName AND m.lastName LIKE lastName;
    
    IF primaryEmail IS NOT NULL THEN
		INSERT INTO Emails(memberID, email) VALUE (memberIDNumber, primaryEmail);
	ELSE
		IF googleDrive IS NOT NULL THEN
			INSERT INTO Emails(memberID, email) VALUE (memberIDNumber, googleDrive);
		END IF;
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

-- Dump completed on 2019-12-04 23:51:32
