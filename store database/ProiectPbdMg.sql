-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: proiectpbd
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorii`
--

DROP TABLE IF EXISTS `categorii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categorii` (
  `idcateg` int(11) NOT NULL,
  `denumire` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcateg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorii`
--

LOCK TABLES `categorii` WRITE;
/*!40000 ALTER TABLE `categorii` DISABLE KEYS */;
INSERT INTO `categorii` VALUES (1,'adidasi'),(2,'tricouri'),(3,'camasi'),(4,'hanorace');
/*!40000 ALTER TABLE `categorii` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clienti` (
  `idclient` int(11) NOT NULL,
  `nume` varchar(45) DEFAULT NULL,
  `prenume` varchar(45) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `adresa` varchar(200) DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idclient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti` VALUES (1,'muresan','george','gggg@gmail.com','Bucium 17-19 apartamentul 9','0754683376'),(2,'test1','test1','test1@gmail.com','test1','0000000000'),(3,'test2','test2','test2@gmail.com','test2','1111111111'),(4,'test3','test3','test3@gmail.com','test3','2222222222');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comenzi`
--

DROP TABLE IF EXISTS `comenzi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comenzi` (
  `idcomanda` int(11) NOT NULL,
  `ziua` date DEFAULT NULL,
  `idclient` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcomanda`),
  KEY `f20_idx` (`idclient`),
  CONSTRAINT `f20` FOREIGN KEY (`idclient`) REFERENCES `clienti` (`idclient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comenzi`
--

LOCK TABLES `comenzi` WRITE;
/*!40000 ALTER TABLE `comenzi` DISABLE KEYS */;
INSERT INTO `comenzi` VALUES (1,'2019-05-23',1),(2,'2019-05-23',1),(3,'2019-05-24',2),(4,'2019-05-24',3);
/*!40000 ALTER TABLE `comenzi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalii_comenzi`
--

DROP TABLE IF EXISTS `detalii_comenzi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detalii_comenzi` (
  `iddetalii_comanda` int(11) NOT NULL,
  `idcomanda` int(11) DEFAULT NULL,
  `idprodus` int(11) DEFAULT NULL,
  `cantitate` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddetalii_comanda`),
  KEY `f21_idx` (`idcomanda`),
  KEY `f22_idx` (`idprodus`),
  CONSTRAINT `f21` FOREIGN KEY (`idcomanda`) REFERENCES `comenzi` (`idcomanda`),
  CONSTRAINT `f22` FOREIGN KEY (`idprodus`) REFERENCES `produse` (`idprodus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalii_comenzi`
--

LOCK TABLES `detalii_comenzi` WRITE;
/*!40000 ALTER TABLE `detalii_comenzi` DISABLE KEYS */;
INSERT INTO `detalii_comenzi` VALUES (1,1,1,2),(2,2,3,1),(3,3,4,1),(4,4,2,1);
/*!40000 ALTER TABLE `detalii_comenzi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `furnizori`
--

DROP TABLE IF EXISTS `furnizori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `furnizori` (
  `idfurnizor` int(11) NOT NULL,
  `nume` varchar(45) DEFAULT NULL,
  `adresa` varchar(200) DEFAULT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `idtara` int(11) DEFAULT NULL,
  PRIMARY KEY (`idfurnizor`),
  KEY `f1_idx` (`idtara`),
  CONSTRAINT `f1` FOREIGN KEY (`idtara`) REFERENCES `tari` (`idtara`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `furnizori`
--

LOCK TABLES `furnizori` WRITE;
/*!40000 ALTER TABLE `furnizori` DISABLE KEYS */;
INSERT INTO `furnizori` VALUES (1,'furnizor1','furnizor1','1111111111','f2@gmail.com',1),(2,'furnizor2','furnizor2','2222222222','f2@gmail.com',3),(3,'furnizor3','furnizor3','3333333333','f3@gmail.com',3),(4,'furnizor4','furnizor4','4444444444','f4@gmail.com',4),(5,'furnizor5','adresa5','555555555555','f5@gmail.com',3),(6,'frunizordinAfrica','a','b','f6@gmail.com',5);
/*!40000 ALTER TABLE `furnizori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `furnizori_europa`
--

DROP TABLE IF EXISTS `furnizori_europa`;
/*!50001 DROP VIEW IF EXISTS `furnizori_europa`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `furnizori_europa` AS SELECT 
 1 AS `nume`,
 1 AS `adresa`,
 1 AS `telefon`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `produse`
--

DROP TABLE IF EXISTS `produse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produse` (
  `idprodus` int(11) NOT NULL,
  `denumire` varchar(45) DEFAULT NULL,
  `pret` varchar(45) DEFAULT NULL,
  `stoc` varchar(45) DEFAULT NULL,
  `idcateg` int(11) DEFAULT NULL,
  `idfurnizor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idprodus`),
  KEY `f23_idx` (`idcateg`),
  KEY `f24_idx` (`idfurnizor`),
  CONSTRAINT `f23` FOREIGN KEY (`idcateg`) REFERENCES `categorii` (`idcateg`),
  CONSTRAINT `f24` FOREIGN KEY (`idfurnizor`) REFERENCES `furnizori` (`idfurnizor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produse`
--

LOCK TABLES `produse` WRITE;
/*!40000 ALTER TABLE `produse` DISABLE KEYS */;
INSERT INTO `produse` VALUES (1,'nike air force 1','450','50',1,2),(2,'nike air presto','499','20',1,2),(3,'nike sb','35','10',4,1),(4,'nike air','120','20',2,4);
/*!40000 ALTER TABLE `produse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `produse_categoria_adidasi`
--

DROP TABLE IF EXISTS `produse_categoria_adidasi`;
/*!50001 DROP VIEW IF EXISTS `produse_categoria_adidasi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `produse_categoria_adidasi` AS SELECT 
 1 AS `idprodus`,
 1 AS `denumire`,
 1 AS `stoc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `produse_categoria_hanorace`
--

DROP TABLE IF EXISTS `produse_categoria_hanorace`;
/*!50001 DROP VIEW IF EXISTS `produse_categoria_hanorace`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `produse_categoria_hanorace` AS SELECT 
 1 AS `idprodus`,
 1 AS `denumire`,
 1 AS `stoc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `produse_categoria_tricouri`
--

DROP TABLE IF EXISTS `produse_categoria_tricouri`;
/*!50001 DROP VIEW IF EXISTS `produse_categoria_tricouri`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `produse_categoria_tricouri` AS SELECT 
 1 AS `idprodus`,
 1 AS `denumire`,
 1 AS `stoc`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `retururi`
--

DROP TABLE IF EXISTS `retururi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `retururi` (
  `idretur` int(11) NOT NULL,
  `idprod` int(11) DEFAULT NULL,
  `idclient` int(11) DEFAULT NULL,
  `motiv` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idretur`),
  KEY `f25_idx` (`idprod`),
  KEY `f26_idx` (`idclient`),
  CONSTRAINT `f25` FOREIGN KEY (`idprod`) REFERENCES `produse` (`idprodus`),
  CONSTRAINT `f26` FOREIGN KEY (`idclient`) REFERENCES `clienti` (`idclient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retururi`
--

LOCK TABLES `retururi` WRITE;
/*!40000 ALTER TABLE `retururi` DISABLE KEYS */;
INSERT INTO `retururi` VALUES (1,4,2,'prea mic'),(2,1,1,'prea mare');
/*!40000 ALTER TABLE `retururi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tari`
--

DROP TABLE IF EXISTS `tari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tari` (
  `idtara` int(11) NOT NULL,
  `denumire` varchar(45) DEFAULT NULL,
  `continent` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtara`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tari`
--

LOCK TABLES `tari` WRITE;
/*!40000 ALTER TABLE `tari` DISABLE KEYS */;
INSERT INTO `tari` VALUES (1,'Romania','Europa'),(2,'Austria','Europa'),(3,'Belgia','Europa'),(4,'Bulgaria','Europa'),(5,'TaraAfrica','Africa');
/*!40000 ALTER TABLE `tari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `furnizori_europa`
--

/*!50001 DROP VIEW IF EXISTS `furnizori_europa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `furnizori_europa` AS select `furnizori`.`nume` AS `nume`,`furnizori`.`adresa` AS `adresa`,`furnizori`.`telefon` AS `telefon` from (`furnizori` join `tari` on((`tari`.`idtara` = `furnizori`.`idtara`))) where (`tari`.`continent` = 'Europa') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `produse_categoria_adidasi`
--

/*!50001 DROP VIEW IF EXISTS `produse_categoria_adidasi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `produse_categoria_adidasi` AS select `produse`.`idprodus` AS `idprodus`,`produse`.`denumire` AS `denumire`,`produse`.`stoc` AS `stoc` from (`produse` join `categorii` on((`categorii`.`idcateg` = `produse`.`idcateg`))) where (`categorii`.`denumire` = 'adidasi') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `produse_categoria_hanorace`
--

/*!50001 DROP VIEW IF EXISTS `produse_categoria_hanorace`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `produse_categoria_hanorace` AS select `produse`.`idprodus` AS `idprodus`,`produse`.`denumire` AS `denumire`,`produse`.`stoc` AS `stoc` from (`produse` join `categorii` on((`categorii`.`idcateg` = `produse`.`idcateg`))) where (`categorii`.`denumire` = 'hanorace') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `produse_categoria_tricouri`
--

/*!50001 DROP VIEW IF EXISTS `produse_categoria_tricouri`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `produse_categoria_tricouri` AS select `produse`.`idprodus` AS `idprodus`,`produse`.`denumire` AS `denumire`,`produse`.`stoc` AS `stoc` from (`produse` join `categorii` on((`categorii`.`idcateg` = `produse`.`idcateg`))) where (`categorii`.`denumire` = 'tricouri') */;
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

-- Dump completed on 2019-06-02 20:13:36
