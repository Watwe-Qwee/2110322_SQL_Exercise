-- MySQL dump 10.13  Distrib 5.6.27, for osx10.8 (x86_64)
--
-- Host: localhost    Database: metube
-- ------------------------------------------------------
-- Server version	5.6.27

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
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads` (
  `ads_id` varchar(10) NOT NULL,
  `ads_type` varchar(70) NOT NULL,
  `pay_per_view` float DEFAULT '1',
  PRIMARY KEY (`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES ('a001','gaming',5),('a002','gaming',10),('a003','gaming',15),('a004','gaming',20),('a005','gaming',25),('a006','IT',11),('a007','IT',12),('a008','IT',13),('a009','IT',14),('a010','IT',15),('a011','auto mobile',20),('a012','auto mobile',22),('a013','auto mobile',24),('a014','misc',0.5),('a015','misc',0.75),('a016','misc',1),('a017','garden',3),('a018','garden',5),('a019','garden',12),('a020','housing',5),('a021','housing',6),('a022','telecome',6),('a023','telecom',12),('a024','telecom',13);
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adsin`
--

DROP TABLE IF EXISTS `adsin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adsin` (
  `content_id` varchar(10) NOT NULL,
  `ads_id` varchar(10) NOT NULL,
  PRIMARY KEY (`content_id`,`ads_id`),
  KEY `adsin_FK2` (`ads_id`),
  CONSTRAINT `adsin_FK1` FOREIGN KEY (`content_id`) REFERENCES `content` (`content_id`),
  CONSTRAINT `adsin_FK2` FOREIGN KEY (`ads_id`) REFERENCES `ads` (`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adsin`
--

LOCK TABLES `adsin` WRITE;
/*!40000 ALTER TABLE `adsin` DISABLE KEYS */;
INSERT INTO `adsin` VALUES ('c001','a001'),('c003','a001'),('c011','a001'),('c050','a001'),('c062','a001'),('c008','a002'),('c011','a002'),('c013','a002'),('c018','a002'),('c020','a002'),('c026','a002'),('c050','a002'),('c052','a002'),('c059','a002'),('c062','a002'),('c024','a003'),('c030','a003'),('c039','a003'),('c067','a003'),('c014','a005'),('c001','a006'),('c032','a006'),('c052','a006'),('c003','a007'),('c020','a007'),('c025','a007'),('c055','a007'),('c009','a008'),('c059','a008'),('c068','a008'),('c012','a009'),('c016','a009'),('c025','a009'),('c032','a009'),('c051','a009'),('c013','a010'),('c015','a010'),('c019','a010'),('c032','a010'),('c037','a010'),('c068','a010'),('c003','a011'),('c008','a011'),('c024','a011'),('c034','a011'),('c016','a012'),('c018','a012'),('c029','a012'),('c041','a012'),('c066','a012'),('c063','a013'),('c007','a014'),('c009','a014'),('c037','a014'),('c041','a014'),('c009','a015'),('c030','a015'),('c037','a020'),('c057','a020'),('c058','a020'),('c003','a021'),('c057','a021');
/*!40000 ALTER TABLE `adsin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `content_id` varchar(10) NOT NULL,
  `content_name` varchar(70) NOT NULL,
  `upload_date` date NOT NULL,
  `likes` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `member_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  KEY `content_FK` (`member_id`),
  CONSTRAINT `content_FK` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES ('c001','pet care (1)','2020-01-10',100,150,'001'),('c002','pet care (2)','2020-01-10',150,200,'001'),('c003','pet care (3)','2020-01-10',350,5200,'001'),('c004','meow meow pet (1)','2020-01-11',450,2000,'001'),('c005','meow meow pet (2)','2020-01-12',15,120,'001'),('c006','cat feeding','2020-01-12',15,120,'001'),('c007','kitten food','2020-01-12',15,120,'001'),('c008','Tasmeow petpet (1)','2020-01-12',350,700,'002'),('c009','Tasmeow petpet (2)','2020-01-13',500,800,'002'),('c010','Tasmeow petpet (3)','2020-01-13',900,1200,'002'),('c011','Bird me (1)','2020-01-10',1100,3000,'002'),('c012','dogme pet','2020-01-05',15,30,'003'),('c013','doggy pet','2020-01-06',20,25,'003'),('c014','smart pet','2020-01-07',12,50,'003'),('c015','Thailand investment (1)','2020-01-05',1800,3500,'009'),('c016','Foreign investment (1)','2020-01-06',1400,3200,'009'),('c017','Thailand investment (2)','2020-01-07',1200,2500,'009'),('c018','Foreign investment (2)','2020-01-08',1000,3000,'009'),('c019','Thailand investment (3)','2020-01-09',800,1200,'009'),('c020','Foreign investment (3)','2020-01-10',400,2500,'009'),('c021','Thailand investment (4)','2020-01-11',200,1100,'009'),('c022','Thailand investment (4)','2020-01-12',100,900,'009'),('c023','Investment forecast (1)','2020-02-01',250,4000,'010'),('c024','Investment forecast (2)','2020-03-01',400,5200,'010'),('c025','Investment forecast (3)','2020-04-01',600,8000,'010'),('c026','Investment for beginner (1)','2020-04-01',2000,12000,'011'),('c027','Investment for beginner (2)','2020-04-15',1200,15000,'011'),('c028','Investment for beginner (3)','2020-05-01',1000,20000,'011'),('c029','Investment for beginner (4)','2020-05-15',500,7500,'011'),('c030','sunflower garden','2020-01-11',220,1200,'013'),('c031','daisy garden','0000-00-00',2020,1500,'013'),('c032','home and garden (1)','2020-02-01',20,120,'015'),('c033','home and garden (2)','2020-02-02',320,5200,'015'),('c034','home and garden (3)','2020-02-03',50,250,'015'),('c035','home and garden (4)','2020-02-04',150,600,'015'),('c036','home and garden (5)','2020-02-05',250,600,'015'),('c037','home and garden northeast (1)','2020-02-06',1000,5200,'015'),('c038','home and garden northeast (2)','2020-02-07',890,1500,'015'),('c039','tomato garden','2020-02-10',1100,12000,'017'),('c040','potato garden','2020-03-10',1200,13300,'017'),('c041','chilly garden','2020-04-10',900,12000,'017'),('c042','coconut garden','2020-01-01',200,1200,'018'),('c043','how to plant coconut garden','2020-01-02',240,1300,'018'),('c044','coconut gardening','2020-01-03',250,1400,'018'),('c045','banana in coconut garden','2020-01-04',300,1500,'018'),('c046','papaya in coconut garden','2020-01-05',230,1220,'018'),('c047','chilly in coconut garden','2020-01-06',125,1300,'018'),('c048','coconut garden (2)','2020-01-07',150,1400,'018'),('c049','coconut garden (3)','2020-01-08',160,1300,'018'),('c050','coconut garden (4)','2020-01-09',145,1540,'018'),('c051','coconut garden (5)','2020-01-10',123,1200,'018'),('c052','muffin bakery (1)','2020-01-10',10,120,'020'),('c053','muffin bakery (2)','2020-01-10',11,130,'020'),('c054','cupcake bakery (1)','2020-03-10',120,200,'022'),('c055','bakery funny cupcake (1)','2020-03-13',230,1100,'022'),('c056','bakery funny cupcake (2)','2020-03-16',120,3000,'022'),('c057','bakery funny cupcake (3)','2020-01-19',240,4500,'022'),('c058','funny bakery','2020-01-20',30,230,'025'),('c059','yummy cupcake (1)','2020-01-20',450,1230,'028'),('c060','yummy cupcake (2)','2020-01-22',300,1400,'028'),('c061','yummy cupcake (3)','2020-01-24',230,1800,'028'),('c062','pet pet','2020-01-20',10,25,'032'),('c063','bird pet','2020-01-24',10,120,'033'),('c064','feeding pet','2020-01-25',2,100,'033'),('c065','pet feeding','2020-01-26',50,240,'033'),('c066','eagle pet(1)','2020-01-27',12,450,'033'),('c067','eagle pet(2)','2020-01-28',23,340,'033'),('c068','seagull pet','2020-01-29',45,250,'033'),('c069','cute pet','0000-00-00',12,50,'003'),('c070','coco coconul','2020-02-01',30,120,'018'),('c071','coco coconul','2020-02-01',199,1650,'018'),('c072','coco coconul','2020-02-01',199,2450,'015'),('c073','garden garden','2020-02-01',199,2600,'015'),('c074','kitty pet pet','2020-02-02',100,2900,'001'),('c075','Local Investment','2020-02-02',100,4300,'009');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `content_w_total_income`
--

DROP TABLE IF EXISTS `content_w_total_income`;
/*!50001 DROP VIEW IF EXISTS `content_w_total_income`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `content_w_total_income` AS SELECT 
 1 AS `member_id`,
 1 AS `content_id`,
 1 AS `content_name`,
 1 AS `total_income`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `member_id` varchar(10) NOT NULL,
  `member_type` varchar(45) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `channel_name` varchar(70) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('001','standard','kitty@gmail.com','kittykitty pet','Thai'),('002','standard','meow@gmail.com','my pet meowmeow','Thai'),('003','standard','doggy@gmail.com','doggy pet care','Thai'),('004','standard','kinu@gmail.com','mykinu pet','Japanese'),('005','standard','corgi@gmail.com','corgicorgi pet','English'),('006','standard','puck@gmail.com','pet dramapug','English'),('007','silver','moneyhero@gmail.com','stock investment','Thai'),('008','silver','settrader@gmail.com','set investment','Thai'),('009','premium','landtrader@gmail.com','land investment','Thai'),('010','premium','invester_guy@gmail.com','foreign investment','English'),('011','premium','warren@gmail.com','warren investment','English'),('012','gold','rosey@gmail.com','rose garden','English'),('013','silver','dailyflowers@gmail.com','gardening daily','English'),('014','silver','modern_gargens@gmail.com','jasmin garden','English'),('015','gold','home_and_gargen@gmail.com','home and garden','English'),('016','standard','vegetables@gmail.com','hydrophonics garden','English'),('017','standard','tomoto@gmail.com','tomato garden','English'),('018','premium','coconuts@gmail.com','coconut garden','English'),('019','standard','bakebake@gmail.com','bakery top one','Thai'),('020','standard','muffin@gmail.com','muffin bakery','Thai'),('021','standard','cakecup@gmail.com','cupcake bakery','Thai'),('022','standard','cubcake@gmail.com','bakery cupcake','Thai'),('023','standard','bakery1@gmail.com','bakery 1','Thai'),('024','standard','bakedaily@gmail.com','daily bakery','Frensh'),('025','standard','bakefun@gmail.com','funny bakery','Frensh'),('026','standard','bakeme@gmail.com','basket bakery','Frensh'),('027','silver','custard@gmail.com','custard bakery','Japanese'),('028','gold','yummycupcake@gmail.com','Bakery yummy','Italian'),('029','gold','yummuyusu@gmail.com','Yummy Bakery','Itailian'),('030','gold','breadtalk@gmail.com','bread and bakery','Japanese'),('031','premium','breadme@gmail.com','bakery for all','Japanese'),('032','gold','catty@gmail.com','cat and pets','Thai'),('033','gold','birdbird@gmail.com','my bird pet','English'),('034','gold','goldfish@gmail.com','pet goldfish','Thai'),('035','gold','googoo@hotmail','pet birdy','Japanese');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribe` (
  `member_id1` varchar(10) NOT NULL,
  `member_id2` varchar(10) NOT NULL,
  `get_noti` char(1) DEFAULT NULL,
  PRIMARY KEY (`member_id1`,`member_id2`),
  KEY `subscribe_fk2` (`member_id2`),
  CONSTRAINT `subscribe_fk1` FOREIGN KEY (`member_id1`) REFERENCES `member` (`member_id`),
  CONSTRAINT `subscribe_fk2` FOREIGN KEY (`member_id2`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe`
--

LOCK TABLES `subscribe` WRITE;
/*!40000 ALTER TABLE `subscribe` DISABLE KEYS */;
INSERT INTO `subscribe` VALUES ('001','002','Y'),('001','003','Y'),('001','004','Y'),('001','005','Y'),('001','020','Y'),('001','030','Y'),('002','001','Y'),('002','008','N'),('003','001','Y'),('004','001','Y'),('004','002','Y'),('005','011','N'),('005','012','Y'),('005','013','N'),('008','012','Y'),('009','001','Y'),('009','006','Y'),('010','015','Y'),('010','016','Y'),('010','017','Y'),('010','018','Y'),('011','008','Y'),('015','016','Y'),('015','017','Y'),('015','018','Y'),('015','019','Y'),('016','015','Y'),('017','020','N'),('017','021','N'),('017','025','N'),('018','030','Y'),('018','033','Y'),('023','001','Y'),('023','002','Y'),('028','015','Y'),('028','020','Y'),('030','003','Y'),('030','031','Y'),('030','032','Y'),('032','015','N'),('032','016','N'),('033','032','Y');
/*!40000 ALTER TABLE `subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'metube'
--
/*!50003 DROP FUNCTION IF EXISTS `getContentRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getContentRating`(views int) RETURNS varchar(5) CHARSET latin1
    DETERMINISTIC
BEGIN
    DECLARE rating varchar(5);
    IF views > 10000 THEN
        SET rating = '*****';
    ELSEIF (views <= 10000 AND views > 5000) THEN
        SET rating = '****';
    ELSEIF (views <= 5000 AND views > 1000) THEN
        SET rating = '***';
    ELSEIF (views <= 1000 AND views > 500) THEN
        SET rating = '**';
    ELSEIF (views <= 500 AND views > 100) THEN
        SET rating = '*';
    ELSEIF (views <= 100) THEN
        SET rating = 'N/A';
    END IF;
    RETURN (rating);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetContentIncome` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetContentIncome`(IN incontent_id varchar(10), OUT income double)
BEGIN
    SELECT sum(C.views * A.pay_per_view) into income
    FROM content C NATURAL JOIN adsin AI NATURAL JOIN ADS A
    GROUP BY C.content_id
    HAVING C.content_id = incontent_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `content_w_total_income`
--

/*!50001 DROP VIEW IF EXISTS `content_w_total_income`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`wichadak`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `content_w_total_income` AS select `C`.`member_id` AS `member_id`,`C`.`content_id` AS `content_id`,`C`.`content_name` AS `content_name`,sum((`C`.`views` * `A`.`pay_per_view`)) AS `total_income` from ((`content` `C` join `adsin` `AI` on((`C`.`content_id` = `AI`.`content_id`))) join `ads` `A` on((`AI`.`ads_id` = `A`.`ads_id`))) group by `C`.`content_id` */;
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

-- Dump completed on 2021-10-28  0:06:11