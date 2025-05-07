CREATE DATABASE  IF NOT EXISTS `flight_tracker` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `flight_tracker`;
-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: localhost    Database: flight_tracker
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrators` (
  `Username` varchar(100) NOT NULL,
  `PasswordNum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES ('admin1','123456'),('admin2','01234567'),('admin4','password123');
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airlines`
--

DROP TABLE IF EXISTS `airlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airlines` (
  `IATA_Code` char(2) NOT NULL,
  `AirlineName` varchar(255) NOT NULL,
  `ICAO_Code` char(3) NOT NULL,
  `Country` varchar(100) NOT NULL,
  PRIMARY KEY (`IATA_Code`),
  UNIQUE KEY `AirlineName` (`AirlineName`),
  UNIQUE KEY `ICAO_Code` (`ICAO_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlines`
--

LOCK TABLES `airlines` WRITE;
/*!40000 ALTER TABLE `airlines` DISABLE KEYS */;
INSERT INTO `airlines` VALUES ('AA','American Airlines','AAL','USA'),('AS','Alaska Airlines','ASA','USA'),('B6','JetBlue Airways','JBU','USA'),('DL','Delta Airlines','DAL','USA'),('F9','Hawaiian Airlines','HAL','USA'),('HA','Sun Country Airlines','SCX','USA'),('NK','Spirit Airlines','NKS','USA'),('SW','Southwest Airlines','SWA','USA'),('UA','United Airlines','UAL','USA'),('WN','Frontier Airlines','FFT','USA');
/*!40000 ALTER TABLE `airlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airplane_models`
--

DROP TABLE IF EXISTS `airplane_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane_models` (
  `ModelID` int NOT NULL AUTO_INCREMENT,
  `Manufacturer` varchar(100) NOT NULL,
  `ModelName` varchar(100) NOT NULL,
  `SeatingCapacity` int NOT NULL,
  `DistanceRange` int NOT NULL,
  PRIMARY KEY (`ModelID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane_models`
--

LOCK TABLES `airplane_models` WRITE;
/*!40000 ALTER TABLE `airplane_models` DISABLE KEYS */;
INSERT INTO `airplane_models` VALUES (1,'Boeing','737-800',160,2935),(2,'Airbus','A320',150,3300),(3,'Boeing','737-700',140,3010),(4,'Airbus','A321',185,3200),(5,'Embraer','E175',76,2200),(6,'Bombardier','CRJ700',70,1378),(7,'Boeing','737 MAX 8',175,3550),(8,'Boeing','757-200',200,3900),(9,'Airbus','A319',128,3700),(10,'Bombardier','CRJ900',76,1550);
/*!40000 ALTER TABLE `airplane_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airports` (
  `IATA_Code` char(3) NOT NULL,
  `AirportName` varchar(255) NOT NULL,
  `StreetNumber` varchar(10) NOT NULL,
  `StreetName` varchar(255) NOT NULL,
  `City` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `ZipCode` varchar(10) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `ICAO_Code` char(4) NOT NULL,
  PRIMARY KEY (`IATA_Code`),
  UNIQUE KEY `AirportName` (`AirportName`),
  UNIQUE KEY `ICAO_Code` (`ICAO_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airports`
--

LOCK TABLES `airports` WRITE;
/*!40000 ALTER TABLE `airports` DISABLE KEYS */;
INSERT INTO `airports` VALUES ('BOS','Logan International Airport','16','Harborside Dr','Boston','Massachusetts','02128','USA','KBOS'),('EWR','Newark Liberty International Airport','13','Raymond Blvd','Newark','New Jersey','07114','USA','KEWR'),('IAD','Washington Dulles International Airport','21','Dulles Access Rd','Dulles','Virginia','20166','USA','KIAD'),('JFK','New York JFK International Airport','6','Queens Blvd','New York','New York','11430','USA','KJFK'),('LAX','Los Angeles International Airport','5','World Way','Los Angeles','California','90045','USA','KLAX'),('LGA','New York LaGuardia Airport','19','LaGuardia Rd','New York','New York','11371','USA','KLGA'),('MCO','Orlando International Airport','8','Jeff Fuqua Blvd','Orlando','Florida','32827','USA','KMCO'),('MIA','Miami International Airport','9','NW 21st St','Miami','Florida','33126','USA','KMIA'),('ORD','Chicago O’Hare International Airport','4','O’Hare Way','Chicago','Illinois','60666','USA','KORD'),('SFO','San Francisco International Airport','14','San Bruno Ave','San Francisco','California','94128','USA','KSFO');
/*!40000 ALTER TABLE `airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baggage_claims`
--

DROP TABLE IF EXISTS `baggage_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baggage_claims` (
  `BaggageClaimID` int NOT NULL AUTO_INCREMENT,
  `ClaimArea` varchar(50) NOT NULL,
  `TerminalID` int NOT NULL,
  PRIMARY KEY (`BaggageClaimID`),
  KEY `TerminalID` (`TerminalID`),
  CONSTRAINT `baggage_claims_ibfk_1` FOREIGN KEY (`TerminalID`) REFERENCES `terminals` (`TerminalID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baggage_claims`
--

LOCK TABLES `baggage_claims` WRITE;
/*!40000 ALTER TABLE `baggage_claims` DISABLE KEYS */;
INSERT INTO `baggage_claims` VALUES (1,'Claim 1',1),(2,'Claim 2',1),(3,'Claim 1',2),(4,'Claim 2',2),(5,'Claim A',3),(6,'Claim B',3),(7,'Claim International',4),(8,'Claim 1',5),(9,'Claim 2',6),(10,'Claim 3',7),(11,'Claim Tom Bradley',8),(12,'Claim 4',9),(13,'Claim 5',10),(14,'Claim 6',11),(15,'Claim 7',12),(16,'Claim 8',13),(17,'Claim 1',14),(18,'Claim 2',15),(19,'Claim 3',16),(20,'Claim 4',17),(21,'Claim 5',18),(22,'Claim 6',19),(23,'Claim A',20),(24,'Claim B',21),(25,'Claim C',22),(26,'Claim D',23),(27,'Claim E',24),(28,'Claim F',25),(29,'Claim G',26),(30,'Claim H',27),(31,'Claim J',28),(32,'Claim A',29),(33,'Claim B',30),(34,'Claim C',31),(35,'Claim 1',32),(36,'Claim 2',33),(37,'Claim 3',34),(38,'Claim International',35),(39,'Claim A',36),(40,'Claim B',37),(41,'Claim C',38),(42,'Claim E',39),(43,'Claim 1',40),(44,'Claim 2',41),(45,'Claim A',42),(46,'Claim B',43),(47,'Claim A/B',44),(48,'Claim C/D',45);
/*!40000 ALTER TABLE `baggage_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `PassengerID` int NOT NULL,
  `FlightID` int NOT NULL,
  `BookingConfirmationNumber` varchar(50) NOT NULL,
  `BookingDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `TicketClass` enum('Economy','Business','First') DEFAULT 'Economy',
  PRIMARY KEY (`BookingID`),
  UNIQUE KEY `BookingConfirmationNumber` (`BookingConfirmationNumber`),
  KEY `PassengerID` (`PassengerID`),
  KEY `FlightID` (`FlightID`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `passengers` (`PassengerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`FlightID`) REFERENCES `flights` (`FlightID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,1,1,'CONF12345','2024-12-05 15:59:06','Economy'),(2,2,2,'CONF23456','2024-12-05 15:59:06','Business'),(3,3,3,'CONF34567','2024-12-05 15:59:06','First'),(4,1,2,'CONF67890','2024-12-05 16:02:42','Economy'),(7,2,3,'CONF67891','2024-12-05 16:14:30','Economy');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `FlightID` int NOT NULL AUTO_INCREMENT,
  `AirlineIATA` char(2) NOT NULL,
  `AirplaneModelID` int NOT NULL,
  `RouteID` int NOT NULL,
  `ScheduledDeparture` datetime NOT NULL,
  `ScheduledArrival` datetime NOT NULL,
  `Status` enum('Scheduled','On Time','Delayed','Cancelled') DEFAULT 'Scheduled',
  `DepartureTerminal` int DEFAULT NULL,
  `ArrivalTerminal` int DEFAULT NULL,
  `BaggageClaimID` int DEFAULT NULL,
  PRIMARY KEY (`FlightID`),
  UNIQUE KEY `RouteID` (`RouteID`,`ScheduledDeparture`,`AirlineIATA`),
  KEY `AirlineIATA` (`AirlineIATA`),
  KEY `AirplaneModelID` (`AirplaneModelID`),
  KEY `DepartureTerminal` (`DepartureTerminal`),
  KEY `ArrivalTerminal` (`ArrivalTerminal`),
  KEY `BaggageClaimID` (`BaggageClaimID`),
  CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`AirlineIATA`) REFERENCES `airlines` (`IATA_Code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`AirplaneModelID`) REFERENCES `airplane_models` (`ModelID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `flights_ibfk_3` FOREIGN KEY (`RouteID`) REFERENCES `routes` (`RouteID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `flights_ibfk_4` FOREIGN KEY (`DepartureTerminal`) REFERENCES `terminals` (`TerminalID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `flights_ibfk_5` FOREIGN KEY (`ArrivalTerminal`) REFERENCES `terminals` (`TerminalID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `flights_ibfk_6` FOREIGN KEY (`BaggageClaimID`) REFERENCES `baggage_claims` (`BaggageClaimID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,'AA',1,1,'2024-12-01 08:00:00','2024-12-01 11:50:00','On Time',5,2,4),(2,'DL',2,2,'2024-12-01 09:30:00','2024-12-01 13:20:00','Delayed',6,11,14),(3,'UA',1,3,'2024-12-01 10:00:00','2024-12-01 14:30:00','Delayed',14,6,9),(4,'SW',2,4,'2024-12-01 11:15:00','2024-12-01 15:05:00','Scheduled',9,15,18),(5,'AA',1,5,'2024-12-01 12:45:00','2024-12-01 15:45:00','Scheduled',37,20,23),(6,'DL',2,6,'2024-12-01 13:30:00','2024-12-01 16:20:00','On Time',21,36,39),(7,'UA',1,7,'2024-12-01 14:00:00','2024-12-01 18:15:00','Cancelled',32,24,27),(8,'SW',2,8,'2024-12-01 15:15:00','2024-12-01 19:25:00','Scheduled',25,33,36),(9,'AA',1,9,'2024-12-01 16:00:00','2024-12-01 20:45:00','Delayed',44,29,32),(10,'DL',2,10,'2024-12-01 17:30:00','2024-12-01 19:00:00','On Time',30,45,48),(11,'UA',1,11,'2024-12-01 18:45:00','2024-12-01 19:15:00','Scheduled',40,15,18),(12,'SW',2,12,'2024-12-01 20:00:00','2024-12-01 21:30:00','Scheduled',17,41,44),(13,'AA',3,1,'2024-12-15 08:00:00','2024-12-15 11:00:00','Scheduled',5,2,4);
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `PassengerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `PassportNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PassengerID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `PassportNumber` (`PassportNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (1,'John','Smith','johnsmith@example.com','1234567890','A12345678'),(2,'Jane','Doe','janedoe@example.com','2345678901','B23456789'),(3,'Michael','Brown','michaelb@example.com','3456789012','C34567890'),(4,'Emily','Davis','emilyd@example.com','4567890123','D45678901'),(5,'Robert','Wilson','robertw@example.com','5678901234','E56789012'),(6,'Linda','Clark','lindac@example.com','6789012345','F67890123'),(7,'David','Lopez','davidl@example.com','7890123456','G78901234'),(8,'Susan','Harris','susanh@example.com','8901234567','H89012345'),(9,'James','Martinez','jamesm@example.com','9012345678','I90123456'),(10,'Patricia','Taylor','patriciat@example.com','0123456789','J01234567');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `RouteID` int NOT NULL AUTO_INCREMENT,
  `DepartureAirport` char(3) NOT NULL,
  `ArrivalAirport` char(3) NOT NULL,
  `Distance` int NOT NULL,
  `EstimatedTime` int NOT NULL,
  PRIMARY KEY (`RouteID`),
  UNIQUE KEY `DepartureAirport` (`DepartureAirport`,`ArrivalAirport`),
  KEY `ArrivalAirport` (`ArrivalAirport`),
  CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`DepartureAirport`) REFERENCES `airports` (`IATA_Code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`ArrivalAirport`) REFERENCES `airports` (`IATA_Code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,'LAX','ORD',1744,230),(2,'ORD','LAX',1744,230),(3,'JFK','LAX',2475,300),(4,'LAX','JFK',2475,300),(5,'BOS','MCO',1121,150),(6,'MCO','BOS',1121,150),(7,'SFO','MIA',2584,295),(8,'MIA','SFO',2584,295),(9,'IAD','EWR',198,50),(10,'EWR','IAD',198,50),(11,'LGA','JFK',18,30),(12,'JFK','LGA',18,30);
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminals`
--

DROP TABLE IF EXISTS `terminals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminals` (
  `TerminalID` int NOT NULL AUTO_INCREMENT,
  `TerminalName` varchar(50) NOT NULL,
  `AirportIATA` char(3) NOT NULL,
  PRIMARY KEY (`TerminalID`),
  KEY `AirportIATA` (`AirportIATA`),
  CONSTRAINT `terminals_ibfk_1` FOREIGN KEY (`AirportIATA`) REFERENCES `airports` (`IATA_Code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminals`
--

LOCK TABLES `terminals` WRITE;
/*!40000 ALTER TABLE `terminals` DISABLE KEYS */;
INSERT INTO `terminals` VALUES (1,'Terminal 1','ORD'),(2,'Terminal 2','ORD'),(3,'Terminal 3','ORD'),(4,'Terminal 5','ORD'),(5,'Terminal 1','LAX'),(6,'Terminal 2','LAX'),(7,'Terminal 3','LAX'),(8,'Tom Bradley International Terminal','LAX'),(9,'Terminal 4','LAX'),(10,'Terminal 5','LAX'),(11,'Terminal 6','LAX'),(12,'Terminal 7','LAX'),(13,'Terminal 8','LAX'),(14,'Terminal 1','JFK'),(15,'Terminal 2','JFK'),(16,'Terminal 4','JFK'),(17,'Terminal 5','JFK'),(18,'Terminal 7','JFK'),(19,'Terminal 8','JFK'),(20,'Terminal A','MCO'),(21,'Terminal B','MCO'),(22,'Terminal C','MCO'),(23,'Concourse D','MIA'),(24,'Concourse E','MIA'),(25,'Concourse F','MIA'),(26,'Concourse G','MIA'),(27,'Concourse H','MIA'),(28,'Concourse J','MIA'),(29,'Terminal A','EWR'),(30,'Terminal B','EWR'),(31,'Terminal C','EWR'),(32,'Terminal 1','SFO'),(33,'Terminal 2','SFO'),(34,'Terminal 3','SFO'),(35,'International Terminal','SFO'),(36,'Terminal A','BOS'),(37,'Terminal B','BOS'),(38,'Terminal C','BOS'),(39,'Terminal E','BOS'),(40,'Terminal A','LGA'),(41,'Terminal B','LGA'),(42,'Terminal C','LGA'),(43,'Terminal D','LGA'),(44,'Concourse A/B','IAD'),(45,'Concourse C/D','IAD');
/*!40000 ALTER TABLE `terminals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'flight_tracker'
--

--
-- Dumping routines for database 'flight_tracker'
--
/*!50003 DROP FUNCTION IF EXISTS `IsExistingAdministrator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `IsExistingAdministrator`(
    username VARCHAR(100),
    password VARCHAR(255)
) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
    DECLARE adminExists BOOLEAN;
    SELECT COUNT(*) > 0 INTO adminExists
    FROM administrators
    WHERE Username = username AND PasswordNum = password;

    RETURN adminExists;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddAdministrator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddAdministrator`(
    IN username VARCHAR(100),
    IN password VARCHAR(255)
)
BEGIN
    DECLARE adminExists BOOLEAN;

	SELECT COUNT(*) AS UserExists
	FROM administrators
	WHERE Username = username;
    IF adminExists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Administrator already exists.';
    ELSE
        INSERT INTO administrators (Username, PasswordNum)
        VALUES (username, password);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(
    IN passengerID INT,
    IN flightID INT,
    IN bookingConfirmationNumber VARCHAR(50),
    IN ticketClass ENUM('Economy', 'Business', 'First')
)
BEGIN
    DECLARE bookingExists INT;
    DECLARE currentBookings INT;
    DECLARE seatingCapacity INT;

    -- Check if the booking already exists
    SELECT COUNT(*) AS bookingExists
    FROM bookings
    WHERE PassengerID = passengerID AND FlightID = flightID AND BookingConfirmationNumber = bookingConfirmationNumber;

    IF bookingExists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Booking already exists.';
    END IF;

    -- Check current bookings for the flight
    SELECT COUNT(*) INTO currentBookings
    FROM bookings
    WHERE FlightID = flightID;

    -- Get seating capacity for the flight
    SELECT SeatingCapacity INTO seatingCapacity
    FROM flights
    JOIN airplane_models ON flights.AirplaneModelID = airplane_models.ModelID
    WHERE flights.FlightID = flightID;

    -- Ensure seating capacity is not exceeded
    IF currentBookings >= seatingCapacity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Seating capacity exceeded for this flight.';
    END IF;

    -- Insert new booking
    INSERT INTO bookings (PassengerID, FlightID, BookingConfirmationNumber, TicketClass)
    VALUES (passengerID, flightID, bookingConfirmationNumber, ticketClass);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddFlight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddFlight`(
    IN airlineIATA CHAR(2),
    IN airplaneModelID INT,
    IN routeID INT,
    IN scheduledDeparture DATETIME,
    IN scheduledArrival DATETIME,
    IN status ENUM('Scheduled', 'On Time', 'Delayed', 'Cancelled'),
    IN departureTerminal INT,
    IN arrivalTerminal INT,
    IN baggageClaimID INT
)
BEGIN
    DECLARE flightExists INT;

    -- Check if the flight already exists
    SELECT COUNT(*) AS flightExists
    FROM flights
    WHERE RouteID = routeID AND ScheduledDeparture = scheduledDeparture AND AirlineIATA = airlineIATA;

    IF flightExists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Flight already exists.';
    ELSE
        -- Insert new flight
        INSERT INTO flights (AirlineIATA, AirplaneModelID, RouteID, ScheduledDeparture, ScheduledArrival, Status, DepartureTerminal, ArrivalTerminal, BaggageClaimID)
        VALUES (airlineIATA, airplaneModelID, routeID, scheduledDeparture, scheduledArrival, status, departureTerminal, arrivalTerminal, baggageClaimID);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAirportIATACodes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAirportIATACodes`()
BEGIN
    SELECT IATA_Code
    FROM airports
    ORDER BY IATA_Code;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetArrivingFlights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetArrivingFlights`(
    IN flightDate DATE,
    IN airportIATA CHAR(3)
)
BEGIN
    SELECT 
        f.FlightID,
        f.AirlineIATA,
        f.ScheduledDeparture,
        f.ScheduledArrival,
        f.Status,
        a1.AirportName AS DepartureAirport,
        a2.AirportName AS ArrivalAirport,
        t2.TerminalName AS ArrivalTerminal
    FROM flights f
    JOIN routes r ON f.RouteID = r.RouteID
    JOIN airports a1 ON r.DepartureAirport = a1.IATA_Code
    JOIN airports a2 ON r.ArrivalAirport = a2.IATA_Code
    LEFT JOIN terminals t2 ON f.ArrivalTerminal = t2.TerminalID
    WHERE r.ArrivalAirport = airportIATA AND DATE(f.ScheduledArrival) = flightDate
    ORDER BY f.ScheduledArrival;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetDepartingFlights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDepartingFlights`(
    IN flightDate DATE,
    IN airportIATA CHAR(3)
)
BEGIN
    SELECT 
        f.FlightID,
        f.AirlineIATA,
        f.ScheduledDeparture,
        f.ScheduledArrival,
        f.Status,
        a1.AirportName AS DepartureAirport,
        a2.AirportName AS ArrivalAirport,
        t1.TerminalName AS DepartureTerminal
    FROM flights f
    JOIN routes r ON f.RouteID = r.RouteID
    JOIN airports a1 ON r.DepartureAirport = a1.IATA_Code
    JOIN airports a2 ON r.ArrivalAirport = a2.IATA_Code
    LEFT JOIN terminals t1 ON f.DepartureTerminal = t1.TerminalID
    WHERE r.DepartureAirport = airportIATA AND DATE(f.ScheduledDeparture) = flightDate
    ORDER BY f.ScheduledDeparture;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFlightDates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFlightDates`()
BEGIN
    SELECT DISTINCT DATE(ScheduledDeparture) AS FlightDate
    FROM flights
    ORDER BY FlightDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFlightInfoByConfirmation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFlightInfoByConfirmation`(
    IN bookingConfirmationNumber VARCHAR(50)
)
BEGIN
    DECLARE bookingExists INT;

    -- Check if the booking exists
    SELECT COUNT(*) INTO bookingExists
    FROM bookings
    WHERE BookingConfirmationNumber = bookingConfirmationNumber;

    IF bookingExists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Booking not found.';
    ELSE
        -- Retrieve flight details for the booking
        SELECT 
            f.FlightID,
            f.AirlineIATA,
            f.ScheduledDeparture,
            f.ScheduledArrival,
            f.Status,
            a1.AirportName AS DepartureAirport,
            a2.AirportName AS ArrivalAirport,
            t1.TerminalName AS DepartureTerminal,
            t2.TerminalName AS ArrivalTerminal
        FROM bookings b
        JOIN flights f ON b.FlightID = f.FlightID
        JOIN routes r ON f.RouteID = r.RouteID
        JOIN airports a1 ON r.DepartureAirport = a1.IATA_Code
        JOIN airports a2 ON r.ArrivalAirport = a2.IATA_Code
        LEFT JOIN terminals t1 ON f.DepartureTerminal = t1.TerminalID
        LEFT JOIN terminals t2 ON f.ArrivalTerminal = t2.TerminalID
        WHERE b.BookingConfirmationNumber = bookingConfirmationNumber;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPassengerBookings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPassengerBookings`(
    IN firstName VARCHAR(100),
    IN lastName VARCHAR(100)
)
BEGIN
    DECLARE passengerExists INT;

    -- Check if the passenger exists
    SELECT COUNT(*) INTO passengerExists
    FROM passengers
    WHERE FirstName = firstName AND LastName = lastName;

    IF passengerExists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Passenger not found.';
    ELSE
        -- Retrieve booking confirmation numbers for the passenger
        SELECT b.BookingConfirmationNumber
        FROM passengers p
        JOIN bookings b ON p.PassengerID = b.PassengerID
        WHERE p.FirstName = firstName AND p.LastName = lastName;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateFlightStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateFlightStatus`(
    IN flightID INT,
    IN newStatus ENUM('Scheduled', 'On Time', 'Delayed', 'Cancelled')
)
BEGIN
    DECLARE flightExists INT;

    -- Check if the FlightID exists
    SELECT COUNT(*) INTO flightExists
    FROM flights
    WHERE flightID = FlightID ;

    -- If the flight exists, update the status
    IF flightExists > 0 THEN
        -- Use LIMIT 1 to comply with safe mode requirements
        UPDATE flights
        SET Status = newStatus
        WHERE flightID = flights.FlightID
        LIMIT 1;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Flight not found.';
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

-- Dump completed on 2024-12-05 16:28:47
