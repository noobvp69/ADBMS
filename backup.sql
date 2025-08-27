-- MySQL dump 10.13  Distrib 5.6.12, for Win64 (x86_64)
--
-- Host: localhost    Database: ayushv2
-- ------------------------------------------------------
-- Server version	5.6.12-log

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `Dname` varchar(50) NOT NULL,
  `Dnumber` varchar(10) NOT NULL,
  `ManagerID` int(11) DEFAULT NULL,
  `Mgr_start_date` date NOT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `Dname` (`Dname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Computer Science','D1',101,'2021-01-01'),('HR','D2',102,'2022-06-10'),('Finance','D3',103,'2023-03-15'),('Sales','D4',104,'2023-05-01'),('R&D','D5',105,'2023-07-20');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependent` (
  `EmployeeID` int(11) NOT NULL DEFAULT '0',
  `DependName` varchar(50) NOT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Relationship` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`,`DependName`),
  CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES (101,'Alice','Female','2010-05-01','Daughter'),(101,'George','Male','2016-06-25','Son'),(101,'Henry','Female','2012-08-10','Son'),(101,'Mary','Female','2014-09-12','Daughter'),(102,'Emma','Female','2020-11-05','Daughter'),(102,'Sydney','Male','2018-03-15','Daughter'),(103,'Michael','Male','2015-12-30','Son'),(103,'Sophia','Female','2013-04-18','Daughter');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deptlocations`
--

DROP TABLE IF EXISTS `deptlocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deptlocations` (
  `Dnumber` varchar(10) NOT NULL DEFAULT '',
  `Dlocation` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `deptlocations_ibfk_1` FOREIGN KEY (`Dnumber`) REFERENCES `department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deptlocations`
--

LOCK TABLES `deptlocations` WRITE;
/*!40000 ALTER TABLE `deptlocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `deptlocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `Name` varchar(50) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `BirthDate` date DEFAULT NULL,
  `HouseName` varchar(100) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  `SuperEID` int(11) DEFAULT NULL,
  `Dnumber` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `SuperEID` (`SuperEID`),
  KEY `Dnumber` (`Dnumber`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`SuperEID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Dnumber`) REFERENCES `department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('Alice',101,'1990-01-10','Rose Villa','Female',15000,NULL,'D1'),('Bob',102,'1988-02-20','Sunset House','Male',15000,101,'D1'),('Charlie',103,'1992-07-12','Lakeview','Male',9000,101,'D2'),('David',104,'1993-03-15','Palm Villa','Male',12000,101,'D2'),('Emma',105,'1995-06-22','Sunrise Villa','Female',18000,102,'D1'),('Frank',106,'1987-09-10','Hilltop House','Male',20000,101,'D3'),('Grace',107,'1991-12-05','Seaside Home','Female',17000,104,'D2'),('Helen',108,'1994-04-18','Garden House','Female',15500,105,'D1');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `Pname` varchar(100) NOT NULL,
  `Pnumber` varchar(10) NOT NULL,
  `Plocation` varchar(100) DEFAULT NULL,
  `Dnumber` varchar(10) NOT NULL,
  PRIMARY KEY (`Pnumber`),
  KEY `Dnumber` (`Dnumber`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`Dnumber`) REFERENCES `department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('IntelliSys','P1','Cochin','D2'),('Cloud Infra','P2','Bangalore','D2'),('TestProj','P3','Cochin','D1');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works_on` (
  `EmployeeID` int(11) DEFAULT NULL,
  `Pnumber` varchar(10) DEFAULT NULL,
  `Hours` decimal(5,2) NOT NULL,
  KEY `EmployeeID` (`EmployeeID`),
  KEY `Pnumber` (`Pnumber`),
  CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`Pnumber`) REFERENCES `project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES (102,'P2',8.00),(103,'P2',12.00),(102,'P3',5.00),(101,'P1',10.00),(104,'P2',15.50),(105,'P3',20.00),(106,'P1',12.00),(107,'P3',18.00);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-27 10:43:27
