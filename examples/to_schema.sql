-- MySQL dump 10.13  Distrib 5.6.26, for Win64 (x86_64)
--
-- Host: localhost    Database: vega8_all
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Current Database: `vega8_all`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `vega8_all` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;

USE `vega8_all`;

--
-- Table structure for table `asn_applicationconfig`
--

DROP TABLE IF EXISTS `asn_applicationconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_applicationconfig` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_Configuration_Id` int(10) NOT NULL COMMENT 'set by application',
  `inv_CommonEntityAttributeValue_Id` int(10) NOT NULL COMMENT 'set by application',
  `inv_CommonEntityAttributeValue_AttrId` int(10) NOT NULL DEFAULT '0' COMMENT 'composite FK set by Trigger',
  `inv_CommonEntityAttributeValue_AttrRowId` int(10) NOT NULL DEFAULT '0' COMMENT 'composite FK set by Trigger',
  `Value` double DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_asn_ConfigurationAttributes_Id` (`inv_Configuration_Id`,`inv_CommonEntityAttributeValue_Id`) COMMENT 'disallow several attributes of same type',
  KEY `IXFK_asn_ConfigurationAttributes_inv_Configuration` (`inv_Configuration_Id`),
  KEY `IXFK_asn_ConfigurationAttributes_inv_CommonEntityAttributeValue` (`inv_CommonEntityAttributeValue_Id`),
  KEY `IXFK_asn_ConfigurationAttributes_inv_CommonEntityAttributeValue2` (`inv_CommonEntityAttributeValue_AttrId`,`inv_CommonEntityAttributeValue_AttrRowId`),
  CONSTRAINT `FK_asn_ConfigurationAttributes_inv_CommonEntityAttributeValue` FOREIGN KEY (`inv_CommonEntityAttributeValue_Id`) REFERENCES `inv_commonentityattributevalue` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_asn_ConfigurationAttributes_inv_Configuration` FOREIGN KEY (`inv_Configuration_Id`) REFERENCES `inv_configuration` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_asn_ConfigurationAttributes_inv_commonentityAttributevalue2` FOREIGN KEY (`inv_CommonEntityAttributeValue_AttrId`, `inv_CommonEntityAttributeValue_AttrRowId`) REFERENCES `inv_commonentityattributevalue` (`inv_CommonEntityAttribute_Id`, `AttrRowId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `asn_applicationconfiguration_before_insert` BEFORE INSERT
    ON `asn_applicationconfig` FOR EACH ROW
BEGIN

  DECLARE vAttrId int;
  DECLARE  vAttrRowId int;

  SELECT 
     `inv_CommonEntityAttribute_Id`, `AttrRowId`
  INTO vAttrId , vAttrRowId FROM
      inv_commonentityattributevalue attrVal
  WHERE
      id = NEW.inv_CommonEntityAttributeValue_Id;   

 SET new.inv_CommonEntityAttributeValue_AttrId = vAttrId;   
 SET new.inv_CommonEntityAttributeValue_AttrRowId = vAttrRowId;   

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`asn_applicationconfiguration_BEFORE_UPDATE` BEFORE UPDATE ON `asn_applicationconfig` FOR EACH ROW

BEGIN

  DECLARE vAttrId int;
  DECLARE  vAttrRowId int;

  SELECT 
     `inv_CommonEntityAttribute_Id`, `AttrRowId`
  INTO vAttrId , vAttrRowId FROM
      inv_commonentityattributevalue attrVal
  WHERE
      id = NEW.inv_CommonEntityAttributeValue_Id;   

 SET new.inv_CommonEntityAttributeValue_AttrId = vAttrId;   
 SET new.inv_CommonEntityAttributeValue_AttrRowId = vAttrRowId;  
 

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `asn_channelconfig`
--

DROP TABLE IF EXISTS `asn_channelconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_channelconfig` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_CommChannel_Id` int(10) NOT NULL COMMENT 'set by application',
  `inv_CommonEntityAttributeValue_Id` int(10) NOT NULL COMMENT 'Main FK column set by application since DevEpxress cannot cope with composite FKs. The actual composite FK cols are set by trigger.',
  `inv_CommonEntityAttributeValue_AttrId` int(10) NOT NULL DEFAULT '0' COMMENT 'composite FK set by Trigger',
  `inv_CommonEntityAttributeValue_AttrRowId` int(10) NOT NULL DEFAULT '0' COMMENT 'composite FK set by Trigger',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_asn_channelconfig_Id` (`inv_CommChannel_Id`,`inv_CommonEntityAttributeValue_Id`) COMMENT 'disallow several attributes of same type',
  KEY `IXFK_asn_ChannelConfig_inv_CommChannel` (`inv_CommChannel_Id`),
  KEY `IXFK_asn_ChannelConfig_inv_CommonEntityAttributeValue` (`inv_CommonEntityAttributeValue_Id`),
  KEY `IXFK_asn_ChannelConfig_inv_CommonEntityAttributeValue2` (`inv_CommonEntityAttributeValue_AttrId`,`inv_CommonEntityAttributeValue_AttrRowId`),
  CONSTRAINT `FK_asn_ChannelConfig_inv_CommChannel` FOREIGN KEY (`inv_CommChannel_Id`) REFERENCES `inv_commchannel` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_ChannelConfig_inv_CommonEntityAttributeValue` FOREIGN KEY (`inv_CommonEntityAttributeValue_Id`) REFERENCES `inv_commonentityattributevalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_ChannelConfig_inv_commonentityAttributevalue2` FOREIGN KEY (`inv_CommonEntityAttributeValue_AttrId`, `inv_CommonEntityAttributeValue_AttrRowId`) REFERENCES `inv_commonentityattributevalue` (`inv_CommonEntityAttribute_Id`, `AttrRowId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Lists additional properties (generic attributes) of communication channels.';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `asn_channelconfig_before_insert` BEFORE INSERT
    ON asn_channelconfig FOR EACH ROW
BEGIN

  DECLARE vAttrId int;
  DECLARE  vAttrRowId int;

  SELECT 
     `inv_CommonEntityAttribute_Id`, `AttrRowId`
  INTO vAttrId , vAttrRowId FROM
      inv_commonentityattributevalue attrVal
  WHERE
      id = NEW.inv_CommonEntityAttributeValue_Id;   

 SET new.inv_CommonEntityAttributeValue_AttrId = vAttrId;   
 SET new.inv_CommonEntityAttributeValue_AttrRowId = vAttrRowId;   

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `asn_channelconfig_before_update` BEFORE UPDATE
    ON asn_channelconfig FOR EACH ROW
BEGIN

  DECLARE vAttrId int;
  DECLARE  vAttrRowId int;

  SELECT 
     `inv_CommonEntityAttribute_Id`, `AttrRowId`
  INTO vAttrId , vAttrRowId FROM
      inv_commonentityattributevalue attrVal
  WHERE
      id = NEW.inv_CommonEntityAttributeValue_Id;   

 SET new.inv_CommonEntityAttributeValue_AttrId = vAttrId;   
 SET new.inv_CommonEntityAttributeValue_AttrRowId = vAttrRowId;   

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `asn_commchannelstate`
--

DROP TABLE IF EXISTS `asn_commchannelstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_commchannelstate` (
  `inv_commchannel_id` int(10) NOT NULL,
  `inv_entitystate_id` int(10) NOT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inv_commchannel_id_UNIQUE` (`inv_commchannel_id`,`inv_entitystate_id`),
  KEY `FK_asn_commchannelstate_inv_entitystate_id_idx` (`inv_entitystate_id`),
  CONSTRAINT `FK_asn_commchannelstate_inv_commchannel_id` FOREIGN KEY (`inv_commchannel_id`) REFERENCES `inv_commchannel` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_commchannelstate_inv_entitystate_id` FOREIGN KEY (`inv_entitystate_id`) REFERENCES `inv_entitystate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='state indication for commchannel items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_deviceconfig`
--

DROP TABLE IF EXISTS `asn_deviceconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_deviceconfig` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_deviceNode_Id` int(10) NOT NULL COMMENT 'FK set by DevExpress',
  `inv_CommonEntityAttributeValue_Id` int(10) NOT NULL COMMENT 'FK set by DevExpress',
  `inv_CommonEntityAttributeValue_AttrId` int(10) NOT NULL DEFAULT '0' COMMENT 'composite FK set by Trigger',
  `inv_CommonEntityAttributeValue_AttrRowId` int(10) NOT NULL DEFAULT '0' COMMENT 'composite FK set by Trigger',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_asn_deviceNode_Id` (`inv_deviceNode_Id`,`inv_CommonEntityAttributeValue_Id`) COMMENT 'disallow several attributes of same type',
  KEY `IXFK_asn_DeviceConfig_inv_DeviceNode` (`inv_deviceNode_Id`),
  KEY `IXFK_asn_DeviceConfig_inv_CommonEntityAttributeValue` (`inv_CommonEntityAttributeValue_Id`),
  KEY `IXFK_asnDeviceConfig_inv_CommonEntityAttributeValue2` (`inv_CommonEntityAttributeValue_AttrId`,`inv_CommonEntityAttributeValue_AttrRowId`),
  CONSTRAINT `FK_asn_DeviceConfig_inv_CommonEntityAttributeValue` FOREIGN KEY (`inv_CommonEntityAttributeValue_Id`) REFERENCES `inv_commonentityattributevalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_DeviceConfig_inv_CommonentityAttributeValue2` FOREIGN KEY (`inv_CommonEntityAttributeValue_AttrId`, `inv_CommonEntityAttributeValue_AttrRowId`) REFERENCES `inv_commonentityattributevalue` (`inv_CommonEntityAttribute_Id`, `AttrRowId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_DeviceConfig_inv_DeviceNode` FOREIGN KEY (`inv_deviceNode_Id`) REFERENCES `inv_devicenode` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1286 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `asn_deviceconfig_BEFORE_INSERT` BEFORE INSERT ON `asn_deviceconfig` FOR EACH ROW
BEGIN
  DECLARE vAttrId int;
  DECLARE  vAttrRowId int;

  SELECT 
     `inv_CommonEntityAttribute_Id`, `AttrRowId`
  INTO vAttrId , vAttrRowId FROM
      inv_commonentityattributevalue attrVal
  WHERE
      id = NEW.inv_CommonEntityAttributeValue_Id;  


 SET new.inv_CommonEntityAttributeValue_AttrId =   vAttrId;   
 SET new.inv_CommonEntityAttributeValue_AttrRowId =  vAttrRowId; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`asn_deviceconfig_BEFORE_UPDATE` BEFORE UPDATE ON `asn_deviceconfig` FOR EACH ROW
BEGIN
   DECLARE vAttrId int;
  DECLARE  vAttrRowId int;

  SELECT 
     `inv_CommonEntityAttribute_Id`, `AttrRowId`
  INTO vAttrId , vAttrRowId FROM
      inv_commonentityattributevalue attrVal
  WHERE
      id = NEW.inv_CommonEntityAttributeValue_Id;  


 SET new.inv_CommonEntityAttributeValue_AttrId =   vAttrId;   
 SET new.inv_CommonEntityAttributeValue_AttrRowId =  vAttrRowId; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `asn_devicenodestate`
--

DROP TABLE IF EXISTS `asn_devicenodestate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_devicenodestate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_devicenode_id` int(10) NOT NULL,
  `inv_entitystate_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_asn_devicenodestate_inv_entitystate_id_idx` (`inv_entitystate_id`),
  KEY `FK_asn_devicenodestate_inv_devicenode_id_idx` (`inv_devicenode_id`),
  CONSTRAINT `FK_asn_devicenodestate_inv_devicenode_id` FOREIGN KEY (`inv_devicenode_id`) REFERENCES `inv_devicenode` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_asn_devicenodestate_inv_entitystate_id` FOREIGN KEY (`inv_entitystate_id`) REFERENCES `inv_entitystate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='state indication for devicenode items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_dndcontrolconfig`
--

DROP TABLE IF EXISTS `asn_dndcontrolconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_dndcontrolconfig` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_draganddropcontrol_id` int(10) NOT NULL COMMENT 'set by application',
  `inv_CommonEntityAttributeValue_Id` int(10) NOT NULL COMMENT 'set by application',
  `inv_CommonEntityAttributeValue_AttrId` int(10) NOT NULL DEFAULT '0' COMMENT 'composite FK set by Trigger',
  `inv_CommonEntityAttributeValue_AttrRowId` int(10) NOT NULL DEFAULT '0' COMMENT 'composite FK set by Trigger',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_asn_DndCfgAttributes_Id` (`inv_draganddropcontrol_id`,`inv_CommonEntityAttributeValue_Id`) COMMENT 'disallow several attributes of same type',
  KEY `IXFK_asn_DndCfgAttributes_inv_Configuration` (`inv_draganddropcontrol_id`),
  KEY `IXFK_asn_DndCfgAttributes_inv_CommonEntityAttributeValue` (`inv_CommonEntityAttributeValue_Id`),
  KEY `IXFK_asn_DndCfgAttributes_inv_CommonEntityAttributeValue2` (`inv_CommonEntityAttributeValue_AttrId`,`inv_CommonEntityAttributeValue_AttrRowId`),
  CONSTRAINT `FK_asn_DndCfgAttributes_inv_CommonEntityAttributeValue` FOREIGN KEY (`inv_CommonEntityAttributeValue_Id`) REFERENCES `inv_commonentityattributevalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_DndCfgAttributes_inv_commonentityAttributevalue2` FOREIGN KEY (`inv_CommonEntityAttributeValue_AttrId`, `inv_CommonEntityAttributeValue_AttrRowId`) REFERENCES `inv_commonentityattributevalue` (`inv_CommonEntityAttribute_Id`, `AttrRowId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_DndCfgAttributes_inv_dncontrol` FOREIGN KEY (`inv_draganddropcontrol_id`) REFERENCES `inv_draganddropcontrol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`asn_dndcontrolconfig_BEFORE_INSERT` BEFORE INSERT ON `asn_dndcontrolconfig` FOR EACH ROW
BEGIN
  DECLARE vAttrId int;
  DECLARE  vAttrRowId int;

  SELECT 
     `inv_CommonEntityAttribute_Id`, `AttrRowId`
  INTO vAttrId , vAttrRowId FROM
      inv_commonentityattributevalue attrVal
  WHERE
      id = NEW.inv_CommonEntityAttributeValue_Id;  


 SET new.inv_CommonEntityAttributeValue_AttrId =   vAttrId;   
 SET new.inv_CommonEntityAttributeValue_AttrRowId =  vAttrRowId; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`asn_dndcontrolconfig_BEFORE_UPDATE` BEFORE UPDATE ON `asn_dndcontrolconfig` FOR EACH ROW
BEGIN
  DECLARE vAttrId int;
  DECLARE  vAttrRowId int;

  SELECT 
     `inv_CommonEntityAttribute_Id`, `AttrRowId`
  INTO vAttrId , vAttrRowId FROM
      inv_commonentityattributevalue attrVal
  WHERE
      id = NEW.inv_CommonEntityAttributeValue_Id;  


 SET new.inv_CommonEntityAttributeValue_AttrId =   vAttrId;   
 SET new.inv_CommonEntityAttributeValue_AttrRowId =  vAttrRowId; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `asn_draganddropcontrolstate`
--

DROP TABLE IF EXISTS `asn_draganddropcontrolstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_draganddropcontrolstate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_draganddropcontrol_id` int(10) NOT NULL,
  `inv_entitystate_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inv_script_id_UNIQUE` (`inv_draganddropcontrol_id`,`inv_entitystate_id`),
  KEY `FK_draganddropcontrol_inv_entitystate_id_idx` (`inv_entitystate_id`),
  CONSTRAINT `FK_asn_draganddropcontrolstate_inv_draganddropcontrol` FOREIGN KEY (`inv_draganddropcontrol_id`) REFERENCES `inv_draganddropcontrol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_asn_draganddropcontrolstate_inv_entitiyState` FOREIGN KEY (`inv_entitystate_id`) REFERENCES `inv_entitystate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='state indication for script items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_enduranceruntime`
--

DROP TABLE IF EXISTS `asn_enduranceruntime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_enduranceruntime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inv_devicenode_id` int(10) DEFAULT NULL,
  `startTime` int(10) DEFAULT NULL,
  `endTime` int(10) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_asn_enduraceruntime_inv_devicenode_id_idx` (`inv_devicenode_id`),
  CONSTRAINT `FK_asn_enduraceruntime_inv_devicenode_id` FOREIGN KEY (`inv_devicenode_id`) REFERENCES `inv_devicenode` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_endurancetestitem`
--

DROP TABLE IF EXISTS `asn_endurancetestitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_endurancetestitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inv_endurancetest_id` int(11) NOT NULL,
  `inv_hwgroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inv_hwgroup_id_UNIQUE` (`inv_hwgroup_id`),
  KEY `asn_endurancetestitem_inv_hwgroup_id_idx` (`inv_hwgroup_id`),
  KEY `asn_endurancetestitem_inv_endurancetest_id_idx` (`inv_endurancetest_id`),
  CONSTRAINT `asn_endurancetestitem_inv_endurancetest_id` FOREIGN KEY (`inv_endurancetest_id`) REFERENCES `inv_endurancetest` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asn_endurancetestitem_inv_hwgroup_id` FOREIGN KEY (`inv_hwgroup_id`) REFERENCES `inv_hwgroup` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_exhaustpiperow`
--

DROP TABLE IF EXISTS `asn_exhaustpiperow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_exhaustpiperow` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `RowPosition` int(10) NOT NULL,
  `inv_ExhaustPipe_Id` int(10) NOT NULL,
  `Diameter` double NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RowPosition_UNIQUE` (`RowPosition`,`inv_ExhaustPipe_Id`),
  KEY `IXFK_asn_ExhaustPipeRow_inv_ExhaustPipe` (`inv_ExhaustPipe_Id`),
  CONSTRAINT `FK_inv_ExhaustPipe_asn_ExhaustPipeRow` FOREIGN KEY (`inv_ExhaustPipe_Id`) REFERENCES `inv_exhaustpipe` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1416 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_exportschedulesignaltag`
--

DROP TABLE IF EXISTS `asn_exportschedulesignaltag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_exportschedulesignaltag` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_exportschedule_id` int(10) NOT NULL,
  `inv_signaltag_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_asn_exportschedulesignaltag_inv_Signaltag_idx` (`inv_signaltag_id`),
  KEY `FK_asn_exportschedulesignaltag_inv_exportschedule_idx` (`inv_exportschedule_id`),
  CONSTRAINT `FK_asn_exportschedulesignaltag_inv_Signaltag` FOREIGN KEY (`inv_signaltag_id`) REFERENCES `inv_signaltag` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_exportschedulesignaltag_inv_exportschedule` FOREIGN KEY (`inv_exportschedule_id`) REFERENCES `inv_exportschedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23538 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Defines which signal tags are exported in a export.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_groupchanneldriver`
--

DROP TABLE IF EXISTS `asn_groupchanneldriver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_groupchanneldriver` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_commchannel_id` int(10) NOT NULL COMMENT 'Without this column it would not be possible to know to which commchannel the group belongs, because one driver can be used for different channels. In example is this used for different CAN-Channels: \n4 Channels with 4 different Baudrates require 4 communication, but the groups underneath must be configured seperatly.',
  `inv_hwdriver_id` int(10) NOT NULL,
  `inv_hwgroup_id` int(10) NOT NULL COMMENT 'The group which is assigned to the communication channel. The group is not necessarily a top-level group. It might have parent groups which do not match the comm channel connection model.',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `inv_hwgroup_id_UNIQUE` (`inv_hwgroup_id`),
  KEY `FK_asn_drivergroupconfig_inv_hwdriver_idx` (`inv_commchannel_id`,`inv_hwdriver_id`),
  KEY `iinv_commchannel_id_asn_groupchanneldriver` (`inv_commchannel_id`),
  CONSTRAINT `FK_asn_drivergroupconfig_inv_hwgroup` FOREIGN KEY (`inv_hwgroup_id`) REFERENCES `inv_hwgroup` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_groupchanneldriver_inv_commchannel` FOREIGN KEY (`inv_commchannel_id`, `inv_hwdriver_id`) REFERENCES `inv_commchannel` (`Id`, `inv_hwdriver_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_groupchanneldriver_inv_commchannel_id` FOREIGN KEY (`inv_commchannel_id`) REFERENCES `inv_commchannel` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=547 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Connects the hardware group with a driver. \nOne driver can have multiple groups. \nBut a group can only have 1 driver			';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`asn_groupchanneldriver_AFTER_INSERT` AFTER INSERT ON `asn_groupchanneldriver` FOR EACH ROW
BEGIN
   
   
   
   Update inv_hwgroup grp SET grp.id = NEW.inv_hwgroup_id where grp.id = NEW.inv_hwgroup_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`asn_groupchanneldriver_AFTER_UPDATE` AFTER UPDATE ON `asn_groupchanneldriver` FOR EACH ROW
BEGIN

   
   
  Update inv_hwgroup grp SET grp.id = NEW.inv_hwgroup_id where grp.id = NEW.inv_hwgroup_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `asn_hwgroupconfig`
--

DROP TABLE IF EXISTS `asn_hwgroupconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_hwgroupconfig` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_HwGroup_Id` int(10) NOT NULL COMMENT 'set by application',
  `inv_CommonEntityAttributeValue_Id` int(10) NOT NULL COMMENT 'Main FK column set by application since DevEpxress cannot cope with composite FKs. The actual composite FK cols are set by trigger.',
  `inv_CommonEntityAttributeValue_AttrId` int(10) NOT NULL DEFAULT '0' COMMENT 'composite FK set by Trigger',
  `inv_CommonEntityAttributeValue_AttrRowId` int(10) NOT NULL DEFAULT '0' COMMENT 'composite FK set by Trigger',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_asn_hwgroupconfig_Id` (`inv_HwGroup_Id`,`inv_CommonEntityAttributeValue_Id`) COMMENT 'disallow several attributes of same type',
  KEY `IXFK_asn_HwGroupConfig_inv_HwGroup` (`inv_HwGroup_Id`),
  KEY `IXFK_asn_HwGroupConfig_inv_CommonEntityAttributeValue` (`inv_CommonEntityAttributeValue_Id`),
  KEY `IXFK_asn_HwGroupConfig_inv_CommonEntityAttributeValue2` (`inv_CommonEntityAttributeValue_AttrId`,`inv_CommonEntityAttributeValue_AttrRowId`),
  CONSTRAINT `FK_asn_HwGroupConfig_inv_CommonEntityAttributeValue` FOREIGN KEY (`inv_CommonEntityAttributeValue_Id`) REFERENCES `inv_commonentityattributevalue` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_HwGroupConfig_inv_HwGroup` FOREIGN KEY (`inv_HwGroup_Id`) REFERENCES `inv_hwgroup` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_HwGroupConfig_inv_commonentityAttributevalue2` FOREIGN KEY (`inv_CommonEntityAttributeValue_AttrId`, `inv_CommonEntityAttributeValue_AttrRowId`) REFERENCES `inv_commonentityattributevalue` (`inv_CommonEntityAttribute_Id`, `AttrRowId`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1222 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Lists additional properties (generic attributes) of hardware groups.';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`asn_hwgroupconfig_BEFORE_INSERT` BEFORE INSERT ON `asn_hwgroupconfig` FOR EACH ROW
BEGIN
  DECLARE vAttrId int;
  DECLARE  vAttrRowId int;

  SELECT 
     `inv_CommonEntityAttribute_Id`, `AttrRowId`
  INTO vAttrId , vAttrRowId FROM
      inv_commonentityattributevalue attrVal
  WHERE
      id = NEW.inv_CommonEntityAttributeValue_Id;   

 SET new.inv_CommonEntityAttributeValue_AttrId = vAttrId;   
 SET new.inv_CommonEntityAttributeValue_AttrRowId = vAttrRowId;   

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`asn_hwgroupconfig_BEFORE_UPDATE` BEFORE UPDATE ON `asn_hwgroupconfig` FOR EACH ROW
BEGIN
  DECLARE vAttrId int;
  DECLARE  vAttrRowId int;

SELECT 
    `inv_CommonEntityAttribute_Id`, `AttrRowId`
INTO vAttrId , vAttrRowId FROM
    inv_commonentityattributevalue attrVal
WHERE
    id = NEW.inv_CommonEntityAttributeValue_Id;   

SET new.inv_CommonEntityAttributeValue_AttrId = vAttrId;   
SET new.inv_CommonEntityAttributeValue_AttrRowId = vAttrRowId;   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `asn_hwgroupstate`
--

DROP TABLE IF EXISTS `asn_hwgroupstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_hwgroupstate` (
  `inv_hwgroup_id` int(10) NOT NULL,
  `inv_entitystate_id` int(10) NOT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inv_hwgroup_id_UNIQUE` (`inv_hwgroup_id`,`inv_entitystate_id`),
  KEY `FK_asn_hwgroupstate_inv_entitystate_id_idx` (`inv_entitystate_id`),
  CONSTRAINT `FK_asn_hwgroupstate_inv_entitystate_id` FOREIGN KEY (`inv_entitystate_id`) REFERENCES `inv_entitystate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_hwgroupstate_inv_hwgroup_id` FOREIGN KEY (`inv_hwgroup_id`) REFERENCES `inv_hwgroup` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='state indication for hwgroup items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_hwioportconfig`
--

DROP TABLE IF EXISTS `asn_hwioportconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_hwioportconfig` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_hwioport_id` int(10) NOT NULL,
  `inv_CommonEntityAttributeValue_Id` int(10) NOT NULL,
  `inv_CommonEntityAttributeValue_AttrId` int(10) NOT NULL DEFAULT '0' COMMENT 'composite FK set by Trigger',
  `inv_CommonEntityAttributeValue_AttrRowId` int(10) NOT NULL DEFAULT '0' COMMENT 'composite FK set by Trigger',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_asn_HwIoPortconfig_inv_hwioport_id` (`inv_hwioport_id`,`inv_CommonEntityAttributeValue_Id`) COMMENT 'disallow several attributes of same type',
  KEY `IXFK_asn_HwIoPortConfig_inv_HwIoPort` (`inv_hwioport_id`),
  KEY `IXFK_asn_HwIoPortConfig_inv_CommonEntityAttributeValue` (`inv_CommonEntityAttributeValue_Id`),
  KEY `IXFK_asn_HwIoPortConfig_inv_CommonEntityAttributeValue2` (`inv_CommonEntityAttributeValue_AttrId`,`inv_CommonEntityAttributeValue_AttrRowId`),
  CONSTRAINT `FK_asn_HwIoPortConfig_inv_CommonEntityAttributeValue` FOREIGN KEY (`inv_CommonEntityAttributeValue_Id`) REFERENCES `inv_commonentityattributevalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_HwIoPortConfig_inv_HwIoPort` FOREIGN KEY (`inv_hwioport_id`) REFERENCES `inv_hwioport` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_HwIoPortConfig_inv_commonentityattributevalue2` FOREIGN KEY (`inv_CommonEntityAttributeValue_AttrId`, `inv_CommonEntityAttributeValue_AttrRowId`) REFERENCES `inv_commonentityattributevalue` (`inv_CommonEntityAttribute_Id`, `AttrRowId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2607 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`asn_hwioportconfig_BEFORE_INSERT` BEFORE INSERT ON `asn_hwioportconfig` FOR EACH ROW
BEGIN
  DECLARE vAttrId int;
  DECLARE  vAttrRowId int;

  SELECT 
     `inv_CommonEntityAttribute_Id`, `AttrRowId`
  INTO vAttrId , vAttrRowId FROM
      inv_commonentityattributevalue attrVal
  WHERE
      id = NEW.inv_CommonEntityAttributeValue_Id;   

 SET new.inv_CommonEntityAttributeValue_AttrId = vAttrId;   
 SET new.inv_CommonEntityAttributeValue_AttrRowId = vAttrRowId;   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`asn_hwioportconfig_BEFORE_UPDATE` BEFORE UPDATE ON `asn_hwioportconfig` FOR EACH ROW
BEGIN
  DECLARE vAttrId int;
  DECLARE  vAttrRowId int;

  SELECT 
     `inv_CommonEntityAttribute_Id`, `AttrRowId`
  INTO vAttrId , vAttrRowId FROM
      inv_commonentityattributevalue attrVal
  WHERE
      id = NEW.inv_CommonEntityAttributeValue_Id;   

 SET new.inv_CommonEntityAttributeValue_AttrId = vAttrId;   
 SET new.inv_CommonEntityAttributeValue_AttrRowId = vAttrRowId;   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `asn_hwioportconnection`
--

DROP TABLE IF EXISTS `asn_hwioportconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_hwioportconnection` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_hwioport_source_id` int(10) NOT NULL COMMENT 'source is e.g.  io ports of an SCU which must be connected to destination = BNC port on NI hardware.\nsource is hotplug device, destination or target  is not.\nbe aware of signalmode !',
  `inv_hwioport_target_id` int(10) NOT NULL COMMENT 'source is e.g.  io ports of an SCU which must be connected to destination = BNC port on NI hardware.\nsource is hotplug device, destination or target  is not.',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `inv_hwioport_source_target_UNIQUE` (`inv_hwioport_source_id`,`inv_hwioport_target_id`),
  UNIQUE KEY `inv_hwioport_source_id_UNIQUE` (`inv_hwioport_source_id`),
  UNIQUE KEY `inv_hwioport_target_id_UNIQUE` (`inv_hwioport_target_id`),
  CONSTRAINT `asn_hwioportconnection_inv_hwioport_source` FOREIGN KEY (`inv_hwioport_source_id`) REFERENCES `inv_hwioport` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `asn_hwioportconnection_inv_hwioport_target` FOREIGN KEY (`inv_hwioport_target_id`) REFERENCES `inv_hwioport` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='This table may be used to connect one io port to another.\nThis is used to connect the io port of a probe to the io port of a hardware device.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_listsource`
--

DROP TABLE IF EXISTS `asn_listsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_listsource` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `TableName` varchar(250) COLLATE latin1_general_ci NOT NULL DEFAULT 'inv_commonentityattributevalue',
  `ValueMember` varchar(250) COLLATE latin1_general_ci NOT NULL DEFAULT 'inv_CommonEntityAttribute_Id' COMMENT 'e.g. `inv_CommonEntityAttribute_Id''  of inv_commonentityattributevalue',
  `DisplayMember` varchar(250) COLLATE latin1_general_ci NOT NULL DEFAULT 'RowId' COMMENT 'e.g. RowId of inv_commonentityattributevalue',
  `inv_commonentity_Id` int(10) DEFAULT NULL COMMENT 'Id of entity which is processed to find the values to display. Do not confuse with entity id of attribute which referenced this table, i.e. which leads to this list source. This is set only if destination table is generic (common entity attribute).',
  `FilterString` varchar(2500) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'String Filter for non-Generic Lookups. This String is appended to the where clause.',
  PRIMARY KEY (`Id`),
  KEY `FK_asn_listsource_idx` (`inv_commonentity_Id`),
  CONSTRAINT `FK_asn_listsource_inv_commonEntity` FOREIGN KEY (`inv_commonentity_Id`) REFERENCES `inv_commonentity` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='This table is used to have a common approach to find list items (for comboboxes) from catalogs.\nThe source of the list can be any oridnary table or the common entity attributes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_processingblockioports`
--

DROP TABLE IF EXISTS `asn_processingblockioports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_processingblockioports` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_BlockIoPort_Id` int(10) NOT NULL,
  `cat_ProcessingBlock_Id` int(10) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_asn_processingblockioports_cat_ProcessingBlock_Id` (`cat_ProcessingBlock_Id`,`cat_BlockIoPort_Id`),
  KEY `IXFK_asn_ProcessingBlockIoPorts_cat_BlockIoPorts` (`cat_BlockIoPort_Id`),
  KEY `IXFK_asn_ProcessingBlockIoPorts_cat_ProcessingBlock` (`cat_ProcessingBlock_Id`),
  CONSTRAINT `FK_asn_ProcessingBlockIoPorts_cat_BlockIoPorts` FOREIGN KEY (`cat_BlockIoPort_Id`) REFERENCES `cat_blockioport` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_asn_ProcessingBlockIoPorts_cat_ProcessingBlock` FOREIGN KEY (`cat_ProcessingBlock_Id`) REFERENCES `cat_processingblock` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_scriptioportconnection`
--

DROP TABLE IF EXISTS `asn_scriptioportconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_scriptioportconnection` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_scriptioport_id` int(10) NOT NULL COMMENT 'A port of a script to which the signal should be collected.',
  `inv_signaltag_id` int(10) NOT NULL COMMENT 'The signal which will be connected to the given port.',
  PRIMARY KEY (`Id`),
  KEY `asn_scriptioportconnection_inv_scriptioport_source` (`inv_scriptioport_id`),
  KEY `asn_scriptioportconnection_inv_scriptioport_target` (`inv_signaltag_id`),
  CONSTRAINT `asn_scriptioportconnection_inv_scriptioport_source` FOREIGN KEY (`inv_scriptioport_id`) REFERENCES `inv_scriptioport` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `asn_scriptioportconnection_inv_scriptioport_target` FOREIGN KEY (`inv_signaltag_id`) REFERENCES `inv_signaltag` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5467 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='This table may be used to connect one io port to another.\nThis is used to connect the io port of a probe to the io port of a hardware device.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_scriptporttoportconnection`
--

DROP TABLE IF EXISTS `asn_scriptporttoportconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_scriptporttoportconnection` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_scriptioport_source_id` int(10) NOT NULL,
  `inv_scriptioport_target_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_asn_scriptporttoportconnection_source_idx` (`inv_scriptioport_source_id`),
  KEY `FK_asn_scriptporttoportconnection_target_idx` (`inv_scriptioport_target_id`),
  CONSTRAINT `FK_asn_scriptporttoportconnection_source` FOREIGN KEY (`inv_scriptioport_source_id`) REFERENCES `inv_scriptioport` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_asn_scriptporttoportconnection_target` FOREIGN KEY (`inv_scriptioport_target_id`) REFERENCES `inv_scriptioport` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='This table connects 2 io ports of a script together. \nIn the application this is used for triggers. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_scriptstate`
--

DROP TABLE IF EXISTS `asn_scriptstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_scriptstate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_script_id` int(10) NOT NULL,
  `inv_entitystate_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inv_script_id_UNIQUE` (`inv_script_id`,`inv_entitystate_id`),
  KEY `FK_asn_scriptstate_inv_entitystate_id_idx` (`inv_entitystate_id`),
  CONSTRAINT `FK_asn_scriptstate_inv_entitystate_id` FOREIGN KEY (`inv_entitystate_id`) REFERENCES `inv_entitystate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_scriptstate_inv_script_id` FOREIGN KEY (`inv_script_id`) REFERENCES `inv_script` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='state indication for script items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_signalconfig`
--

DROP TABLE IF EXISTS `asn_signalconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_signalconfig` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_signalTag_Id` int(10) NOT NULL,
  `inv_CommonEntityAttributeValue_Id` int(10) NOT NULL,
  `inv_CommonEntityAttributeValue_AttrId` int(10) NOT NULL DEFAULT '0' COMMENT 'composite FK set by Trigger',
  `inv_CommonEntityAttributeValue_AttrRowId` int(10) NOT NULL DEFAULT '0' COMMENT 'composite FK set by Trigger',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_asn_signalconfig_inv_signalTag_Id` (`inv_signalTag_Id`,`inv_CommonEntityAttributeValue_Id`) COMMENT 'disallow several attributes of same type',
  KEY `IXFK_asn_SignalConfig_inv_SignalTag` (`inv_signalTag_Id`),
  KEY `IXFK_asn_SignalConfig_inv_CommonEntityAttributeValue` (`inv_CommonEntityAttributeValue_Id`),
  KEY `IXFK_asn_SignalConfig_inv_CommonEntityAttributeValue2` (`inv_CommonEntityAttributeValue_AttrId`,`inv_CommonEntityAttributeValue_AttrRowId`),
  CONSTRAINT `FK_asn_SignalConfig_inv_CommonEntityAttributeValue` FOREIGN KEY (`inv_CommonEntityAttributeValue_Id`) REFERENCES `inv_commonentityattributevalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_SignalConfig_inv_SignalTag` FOREIGN KEY (`inv_signalTag_Id`) REFERENCES `inv_signaltag` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_SignalConfig_inv_commonentityattributevalue2` FOREIGN KEY (`inv_CommonEntityAttributeValue_AttrId`, `inv_CommonEntityAttributeValue_AttrRowId`) REFERENCES `inv_commonentityattributevalue` (`inv_CommonEntityAttribute_Id`, `AttrRowId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10871 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`asn_signalconfig_BEFORE_INSERT` BEFORE INSERT ON `asn_signalconfig` FOR EACH ROW
BEGIN
  DECLARE vAttrId int;
  DECLARE  vAttrRowId int;

  SELECT 
     `inv_CommonEntityAttribute_Id`, `AttrRowId`
  INTO vAttrId , vAttrRowId FROM
      inv_commonentityattributevalue attrVal
  WHERE
      id = NEW.inv_CommonEntityAttributeValue_Id;   

 SET new.inv_CommonEntityAttributeValue_AttrId = vAttrId;   
 SET new.inv_CommonEntityAttributeValue_AttrRowId = vAttrRowId;   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`asn_signalconfig_BEFORE_UPDATE` BEFORE UPDATE ON `asn_signalconfig` FOR EACH ROW
BEGIN
  DECLARE vAttrId int;
  DECLARE  vAttrRowId int;

  SELECT 
     `inv_CommonEntityAttribute_Id`, `AttrRowId`
  INTO vAttrId , vAttrRowId FROM
      inv_commonentityattributevalue attrVal
  WHERE
      id = NEW.inv_CommonEntityAttributeValue_Id;   

 SET new.inv_CommonEntityAttributeValue_AttrId = vAttrId;   
 SET new.inv_CommonEntityAttributeValue_AttrRowId = vAttrRowId;   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `asn_signalstoblockio`
--

DROP TABLE IF EXISTS `asn_signalstoblockio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_signalstoblockio` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_BlockIo_Id` int(10) NOT NULL,
  `inv_SignalTag_Id` int(10) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_asn_signalstoblockio_inv_BlockIo_Id` (`inv_BlockIo_Id`,`inv_SignalTag_Id`),
  KEY `IXFK_asn_SignalsToBlockIo_inv_ProcessingBlock` (`inv_BlockIo_Id`),
  KEY `IXFK_asn_SignalsToBlockIo_inv_SignalTag` (`inv_SignalTag_Id`),
  CONSTRAINT `FK_asn_SignalsToBlockIo_inv_SignalTag` FOREIGN KEY (`inv_SignalTag_Id`) REFERENCES `inv_signaltag` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_stubendposition`
--

DROP TABLE IF EXISTS `asn_stubendposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_stubendposition` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_stubendPosition_Id` int(10) NOT NULL,
  `inv_deviceNode_Id` int(10) NOT NULL,
  `inv_enduranceTest_Id` int(10) NOT NULL,
  `AssembleDate` datetime NOT NULL,
  `DisassembleDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_asn_stubendposition_inv_deviceNode_Id_idx` (`inv_deviceNode_Id`),
  KEY `FK_asn_stubendposition_inv_stubendPosition_idx` (`inv_stubendPosition_Id`),
  KEY `FK_asn_stubendposition_inv_enduranceTest_idx` (`inv_enduranceTest_Id`),
  CONSTRAINT `FK_asn_stubendposition_inv_deviceNode` FOREIGN KEY (`inv_deviceNode_Id`) REFERENCES `inv_devicenode` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_stubendposition_inv_enduranceTest` FOREIGN KEY (`inv_enduranceTest_Id`) REFERENCES `inv_endurancetest` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_asn_stubendposition_inv_stubendPosition` FOREIGN KEY (`inv_stubendPosition_Id`) REFERENCES `inv_stubendposition` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=915 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_taggroupsignaltag`
--

DROP TABLE IF EXISTS `asn_taggroupsignaltag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_taggroupsignaltag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inv_taggroup_id` int(11) NOT NULL,
  `inv_signaltag_id` int(11) NOT NULL COMMENT 'Creates the relationship between the taggroup and its signals. \nA signal can be in 1 or many taggroups.',
  PRIMARY KEY (`id`),
  KEY `asn_tagggroupsignaltag_inv_signaltag_id_idx` (`inv_signaltag_id`),
  KEY `asn_tagggroupsignaltag_inv_taggroup_id_idx` (`inv_taggroup_id`),
  CONSTRAINT `asn_tagggroupsignaltag` FOREIGN KEY (`inv_signaltag_id`) REFERENCES `inv_signaltag` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `asn_tagggroupsignaltag_inv_taggroup` FOREIGN KEY (`inv_taggroup_id`) REFERENCES `inv_taggroup` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21846 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='This table exists to freely group signals and tags.';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`asn_taggroupsignaltag_BEOFRE_INSERT` BEFORE INSERT
    ON vega8_all.asn_taggroupsignaltag FOR EACH ROW
BEGIN

	SET @tgDevCount=0;
	select count(*) into @tgDevCount from inv_taggroup taggroup  
		inner join inv_devicenode device on device.inv_taggroup_id= taggroup.id
	where taggroup.id in (
		select inv_taggroup_id from asn_taggroupsignaltag
		where inv_signaltag_id = new.inv_signaltag_id);
   
   IF ( @tgDevCount > 0 ) THEN
		signal sqlstate '45000' set message_text = 'A signaltag can only be assigned to 1 taggroup which is assigned to a device.';
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`asn_taggroupsignaltag_AFTER_INSERT` AFTER INSERT ON `asn_taggroupsignaltag` FOR EACH ROW
BEGIN
    
    UPDATE inv_signaltag sig SET sig.id =NEW.inv_signaltag_id  WHERE sig.id=NEW.inv_signaltag_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`asn_taggroupsignaltag_AFTER_UPDATE` AFTER UPDATE
    ON vega8_all.asn_taggroupsignaltag FOR EACH ROW
BEGIN

    SET @tgDevCount=0;
	select count(*) from inv_taggroup taggroup 
		inner join inv_devicenode device on device.inv_taggroup_id= taggroup.id
	where taggroup.id in (
		select inv_taggroup_id from asn_taggroupsignaltag
		where inv_signaltag_id = new.inv_signaltag_id) into @tgDevCount;
    
     UPDATE inv_signaltag sig SET sig.id =NEW.inv_signaltag_id  WHERE sig.id=NEW.inv_signaltag_id;
    
   IF ( @tgDevCount > 1 ) THEN
		signal sqlstate '45000' set message_text = 'Update failed, A signaltag can only be assigned to 1 taggroup which is assigned to a device.';
   END IF; 
   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `asn_taggroupstate`
--

DROP TABLE IF EXISTS `asn_taggroupstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_taggroupstate` (
  `inv_taggroup_id` int(10) NOT NULL,
  `inv_entitystate_id` int(10) NOT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inv_taggroup_id_UNIQUE` (`inv_taggroup_id`,`inv_entitystate_id`),
  KEY `FK_asn_taggroupstate_inv_entitystate_id_idx` (`inv_entitystate_id`),
  CONSTRAINT `FK_asn_taggroupstate_inv_entitystate_id` FOREIGN KEY (`inv_entitystate_id`) REFERENCES `inv_entitystate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_taggroupstate_inv_taggroup_id` FOREIGN KEY (`inv_taggroup_id`) REFERENCES `inv_taggroup` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='state indication for taggroup items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `asn_testfacilitystate`
--

DROP TABLE IF EXISTS `asn_testfacilitystate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asn_testfacilitystate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_testfacility_id` int(10) NOT NULL,
  `inv_entitystate_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inv_testfacility_id_UNIQUE` (`inv_testfacility_id`),
  KEY `FK_asn_testfacilitystate_inv_entitystate_id_idx` (`inv_entitystate_id`),
  KEY `FK_asn_testfacilitystate_inv_testfacility_id_idx` (`inv_testfacility_id`),
  CONSTRAINT `FK_asn_testfacilitystate_inv_entitystate_id` FOREIGN KEY (`inv_entitystate_id`) REFERENCES `inv_entitystate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_asn_testfacilitystate_inv_testfacility_id` FOREIGN KEY (`inv_testfacility_id`) REFERENCES `inv_testfacility` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='state indication for test facility items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_application`
--

DROP TABLE IF EXISTS `cat_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_application` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `programmName` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `heartbeatUpdateIntervall` int(10) NOT NULL COMMENT 'Defines how many seconds are in between the updates of the application heartbeat. \nThis is the intervall in ms',
  PRIMARY KEY (`id`),
  UNIQUE KEY `programmName_UNIQUE` (`programmName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Defines which application are accessing the database.\nI.e. we  use this to verify if the hw io service is running or not instead or matching a hardcoded string in the application we just check this table.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_applicationcommand`
--

DROP TABLE IF EXISTS `cat_applicationcommand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_applicationcommand` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(2000) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='This table defines which commands can be exchanged between the applications. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_attributevaluecolumn`
--

DROP TABLE IF EXISTS `cat_attributevaluecolumn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_attributevaluecolumn` (
  `Name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `Deprecated` date DEFAULT NULL,
  `SortOrder` int(10) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_blockgroup`
--

DROP TABLE IF EXISTS `cat_blockgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_blockgroup` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `Deprecated` date DEFAULT NULL,
  `SortOrder` int(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Used to group multiple blocks together in a group. \nI.e. this could be used to Have an multiplication and an addition blocked grouped together and called linearisation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_blockioport`
--

DROP TABLE IF EXISTS `cat_blockioport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_blockioport` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `IsInput` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'DevExpress uses .NET Boolean type for MySQL tinyint(1) type',
  `IoPurpose_Id` int(10) NOT NULL,
  `Deprecated` date DEFAULT NULL,
  `SortOrder` int(10) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IXFK_asn_IoPortPurpose_cat_BlockIoPorts` (`IoPurpose_Id`),
  CONSTRAINT `FK_asn_IoPortPurpose_cat_BlockIoPorts` FOREIGN KEY (`IoPurpose_Id`) REFERENCES `cat_blockioportpurpose` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='defines the list of inputs and outputs\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_blockioportpurpose`
--

DROP TABLE IF EXISTS `cat_blockioportpurpose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_blockioportpurpose` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `Deprecated` date DEFAULT NULL,
  `SortOrder` int(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='defines special purposes of block i/o ports, e.g.\nSet\nReset\nHLimit\nLLimit\nDefaultValue\nAlarm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_commonattribute`
--

DROP TABLE IF EXISTS `cat_commonattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_commonattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EnumValue` int(10) NOT NULL,
  `EnumName` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `OptimisticLockField` int(11) DEFAULT NULL,
  `GCRecord` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cat_commonattribute` (`EnumValue`),
  KEY `iGCRecord_cat_commonattribute` (`GCRecord`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_componentcondition`
--

DROP TABLE IF EXISTS `cat_componentcondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_componentcondition` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `Deprecated` date DEFAULT NULL,
  `SortOrder` int(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='do not mix component condition like "damaged" with condition transition like "in repair"';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_connectionmodel`
--

DROP TABLE IF EXISTS `cat_connectionmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_connectionmodel` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL DEFAULT '<Empty>',
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `Physical_Id` int(10) DEFAULT NULL,
  `DataLink_Id` int(10) DEFAULT NULL,
  `Network_Id` int(10) DEFAULT NULL,
  `Transport_Id` int(10) DEFAULT NULL,
  `Session_Id` int(10) DEFAULT NULL,
  `Presentation_Id` int(10) DEFAULT NULL,
  `Application_Id` int(10) DEFAULT NULL,
  `InitDevices` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'indicates if the drivers are initialized at communication channel level or at driver level\nCAN-Devices in Hw Service are not configured at device level as Ni-DAQ Multiplexers are handled.',
  `Deprecated` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Name` (`Name`),
  UNIQUE KEY `UQ_LayerSet` (`Physical_Id`,`DataLink_Id`,`Network_Id`,`Transport_Id`,`Session_Id`,`Presentation_Id`,`Application_Id`),
  KEY `FK_cat_connectionmodel_inv_commonentityattributevalue_Physi_Idx` (`Physical_Id`),
  KEY `FK_cat_connectionmodel_inv_commonentityattributevalue_DataL_Idx` (`DataLink_Id`),
  KEY `FK_cat_connectionmodel_inv_commonentityattributevalue_Netwo_Idx` (`Network_Id`),
  KEY `FK_cat_connectionmodel_inv_commonentityattributevalue_Trans_Idx` (`Transport_Id`),
  KEY `FK_cat_connectionmodel_inv_commonentityattributevalue_Sessi_Idx` (`Session_Id`),
  KEY `FK_cat_connectionmodel_inv_commonentityattributevalue_Prese_Idx` (`Presentation_Id`),
  KEY `FK_cat_connectionmodel_inv_commonentityattributevalue_Appli_Idx` (`Application_Id`),
  CONSTRAINT `FK_cat_connectionmodel_inv_commonentityattributevalue_App` FOREIGN KEY (`Application_Id`) REFERENCES `inv_commonentityattributevalue` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cat_connectionmodel_inv_commonentityattributevalue_DataLink` FOREIGN KEY (`DataLink_Id`) REFERENCES `inv_commonentityattributevalue` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cat_connectionmodel_inv_commonentityattributevalue_Network` FOREIGN KEY (`Network_Id`) REFERENCES `inv_commonentityattributevalue` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cat_connectionmodel_inv_commonentityattributevalue_Physical` FOREIGN KEY (`Physical_Id`) REFERENCES `inv_commonentityattributevalue` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cat_connectionmodel_inv_commonentityattributevalue_Presenter` FOREIGN KEY (`Presentation_Id`) REFERENCES `inv_commonentityattributevalue` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cat_connectionmodel_inv_commonentityattributevalue_Session` FOREIGN KEY (`Session_Id`) REFERENCES `inv_commonentityattributevalue` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cat_connectionmodel_inv_commonentityattributevalue_Transport` FOREIGN KEY (`Transport_Id`) REFERENCES `inv_commonentityattributevalue` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_datatypes`
--

DROP TABLE IF EXISTS `cat_datatypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_datatypes` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `dotnet` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `mysql` varchar(64) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'e.g. smallint(6), varchar(40), etc.',
  `storagebytes` smallint(5) NOT NULL,
  `oracle` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `mssql` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `columnname` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `deprecated` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `dotnet_UNIQUE` (`dotnet`),
  UNIQUE KEY `data_type_UNIQUE` (`mysql`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='reference table for system data types, refer to INFORMATION_SCHEMA.COLUMNS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_documenttype`
--

DROP TABLE IF EXISTS `cat_documenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_documenttype` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `FileExtension` varchar(8) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `Deprecated` date DEFAULT NULL,
  `SortOrder` int(10) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_cat_documenttype` (`Name`,`FileExtension`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_draganddropcontrol`
--

DROP TABLE IF EXISTS `cat_draganddropcontrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_draganddropcontrol` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL DEFAULT '<Driver>',
  `Guid` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `MaxIoPorts` int(10) NOT NULL DEFAULT '1',
  `ToolBoxLabel` varchar(500) CHARACTER SET latin1 NOT NULL,
  `inv_ConfigOptionSet_Id` int(10) NOT NULL,
  `cat_connectionmodel_Id` int(10) NOT NULL,
  `MinWidth` int(10) NOT NULL,
  `MinHeight` int(10) NOT NULL,
  `InActive` tinyint(1) DEFAULT '0' COMMENT 'DevExpress uses .NET Boolean type for MySQL tinyint(1) type',
  `Deprecated` date DEFAULT NULL,
  `AllowSignalTagEditing` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Defines if the user can edit the signal tags of the control.',
  PRIMARY KEY (`Id`),
  KEY `FK_cat_draganddropcontrol_inv_ConfigOptionSet_idx` (`inv_ConfigOptionSet_Id`,`cat_connectionmodel_Id`),
  KEY `iinv_ConfigOptionSet_Id_cat_draganddropcontrol` (`inv_ConfigOptionSet_Id`),
  KEY `FK_cat_draganddropcontrol_cat_connectionmodel_Id_idx` (`cat_connectionmodel_Id`),
  CONSTRAINT `FK_cat_draganddropcontrol_cat_connectionmodel_Id` FOREIGN KEY (`cat_connectionmodel_Id`) REFERENCES `cat_connectionmodel` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cat_draganddropcontrol_inv_ConfigOptionSet_Id` FOREIGN KEY (`inv_ConfigOptionSet_Id`) REFERENCES `inv_configoptionset` (`Id`),
  CONSTRAINT `FK_cat_draganddropcontrol_inv_configOptionSet` FOREIGN KEY (`inv_ConfigOptionSet_Id`, `cat_connectionmodel_Id`) REFERENCES `inv_configoptionset` (`Id`, `cat_ConnectionModel_Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Lists the software to load (.dll) in order to access the hardware';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_editorcontrol`
--

DROP TABLE IF EXISTS `cat_editorcontrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_editorcontrol` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `InActive` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'DevExpress uses .NET Boolean type for MySQL tinyint(1) type',
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_filtertype`
--

DROP TABLE IF EXISTS `cat_filtertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_filtertype` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Obsolete use commonattribute "Signal Filter" -  CH, 07.09.2016\n\nDefines how a signal is filtered.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_grouptype`
--

DROP TABLE IF EXISTS `cat_grouptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_grouptype` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT NULL,
  `HotPlug` tinyint(1) NOT NULL COMMENT 'Defines whether this group is designed for hotplug devices or not. \nSet it to 1 to enable hotplug. ',
  `inv_ConfigOptionSet_Id` int(10) NOT NULL,
  `cat_connectionmodel_id` int(10) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `FK_cat_GroupType_inv_configoptionset_idx` (`inv_ConfigOptionSet_Id`,`cat_connectionmodel_id`),
  KEY `IX_cat_grouptype_id_connModel` (`Id`,`cat_connectionmodel_id`),
  KEY `FK_cat_GroupType_cat_connectionmodel_idx` (`cat_connectionmodel_id`),
  CONSTRAINT `FK_cat_GroupType_cat_connectionmodel` FOREIGN KEY (`cat_connectionmodel_id`) REFERENCES `cat_connectionmodel` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cat_GroupType_inv_configoptionset` FOREIGN KEY (`inv_ConfigOptionSet_Id`, `cat_connectionmodel_id`) REFERENCES `inv_configoptionset` (`Id`, `cat_ConnectionModel_Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Group types have a common entity but no attribute values associated.\nThe available attributes are restricted by the connection model.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_hwioportpurpose`
--

DROP TABLE IF EXISTS `cat_hwioportpurpose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_hwioportpurpose` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `deprecated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='i/o purpose of ports: trigger out, trigger in, set, reset, current or voltage measuring, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_inactivereason`
--

DROP TABLE IF EXISTS `cat_inactivereason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_inactivereason` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE latin1_general_ci NOT NULL COMMENT 'reasons for inactivity: "error", "user", "wrong workstation"',
  `description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `color` int(10) unsigned NOT NULL COMMENT 'The ARGB value of the colour. \nRemember to add the alpha value to the colour!',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_localization`
--

DROP TABLE IF EXISTS `cat_localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_localization` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `en_US` varchar(2500) COLLATE latin1_general_ci NOT NULL,
  `de_DE` varchar(2500) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='This table will later contain string for localizing stuff. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_processingblock`
--

DROP TABLE IF EXISTS `cat_processingblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_processingblock` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `InputCntMin` int(10) NOT NULL DEFAULT '2',
  `OutputCntMin` int(10) NOT NULL DEFAULT '1',
  `BlockGroup_Id` int(10) NOT NULL,
  `Deprecated` date DEFAULT NULL,
  `SortOrder` int(10) DEFAULT NULL,
  `InputCntMax` int(10) DEFAULT '-1' COMMENT '-1 Means unbound / unlimited.',
  `OutputCntMax` int(10) DEFAULT '-1',
  `inv_configoptionset_id` int(10) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IXFK_asn_ProcessingBlockGroup_cat_ProcessingBlock` (`BlockGroup_Id`),
  KEY `FK_inv_configoptionset_cat_processingblock_idx` (`inv_configoptionset_id`),
  CONSTRAINT `FK_asn_ProcessingBlockGroup_cat_ProcessingBlock` FOREIGN KEY (`BlockGroup_Id`) REFERENCES `cat_blockgroup` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_inv_configoptionset_cat_processingblock` FOREIGN KEY (`inv_configoptionset_id`) REFERENCES `inv_processingblock` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_scheduletype`
--

DROP TABLE IF EXISTS `cat_scheduletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_scheduletype` (
  `id` int(10) NOT NULL,
  `name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_script`
--

DROP TABLE IF EXISTS `cat_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_script` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `scriptType` int(10) DEFAULT NULL,
  `scriptBinary` int(10) NOT NULL,
  `author` varchar(500) CHARACTER SET latin1 NOT NULL COMMENT 'The username which authored the script. \nSome day this will be a foreign key to the user table',
  `changeTimestamp` datetime NOT NULL,
  `version` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `guid` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cat_script_cat_scripttype_idx` (`scriptType`),
  KEY `FK_cat_script_cat_scriptbinary_idx` (`scriptBinary`),
  CONSTRAINT `FK_cat_script_cat_scriptbinary` FOREIGN KEY (`scriptBinary`) REFERENCES `cat_scriptbinary` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_cat_script_cat_scripttype` FOREIGN KEY (`scriptType`) REFERENCES `cat_scripttype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=828 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_scriptbinary`
--

DROP TABLE IF EXISTS `cat_scriptbinary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_scriptbinary` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `binary` longblob NOT NULL,
  `binaryMd5Sum` varchar(500) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Contains the binary data for scripts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_scripttype`
--

DROP TABLE IF EXISTS `cat_scripttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_scripttype` (
  `id` int(10) NOT NULL,
  `name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Defines the type of a script. \nDepending on this the userinterface will display the script in different situations.\nFor example if the script is configured for DuControl it will be possible to select this script as "emps" method for probes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_signalmode`
--

DROP TABLE IF EXISTS `cat_signalmode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_signalmode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `modevalue` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `value_UNIQUE` (`modevalue`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Defines the modes a signal can have. Consider using linux file rights mechanism: r=4, w=2,x=1 , i.e. binary coded values which can be combined via bit operations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_siunit`
--

DROP TABLE IF EXISTS `cat_siunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_siunit` (
  `Symbol` varchar(50) COLLATE latin1_general_cs NOT NULL,
  `Name` varchar(500) COLLATE latin1_general_cs NOT NULL DEFAULT '',
  `MeasuredQuantity` varchar(500) COLLATE latin1_general_cs NOT NULL DEFAULT '',
  `BaseUnitFormula` varchar(500) COLLATE latin1_general_cs NOT NULL DEFAULT '',
  `Deprecated` date DEFAULT NULL,
  `SortOrder` int(10) DEFAULT NULL,
  PRIMARY KEY (`Symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_siunitprefix`
--

DROP TABLE IF EXISTS `cat_siunitprefix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_siunitprefix` (
  `Symbol` varchar(20) COLLATE latin1_general_cs NOT NULL,
  `Factor` double NOT NULL DEFAULT '1',
  `Name` varchar(500) COLLATE latin1_general_cs NOT NULL,
  `Deprecated` date DEFAULT NULL,
  `SortOrder` int(10) DEFAULT NULL,
  PRIMARY KEY (`Symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_tabletype`
--

DROP TABLE IF EXISTS `cat_tabletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_tabletype` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `StorageEngine` varchar(45) COLLATE latin1_general_ci NOT NULL DEFAULT 'InnoDB' COMMENT 'storage engine name of table',
  `Deprecated` date DEFAULT NULL,
  `SortOrder` int(10) DEFAULT NULL,
  `cat_filtertype_id` int(10) NOT NULL DEFAULT '1',
  `cat_datatypes_id` int(10) NOT NULL DEFAULT '11',
  `schema` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'vega8_meas',
  `createstatement` varchar(2500) COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'Enter the statement which is used to create the database table here.',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Name` (`Name`),
  KEY `FK_cat_tabletype_cat_filtertype_idx` (`cat_filtertype_id`),
  KEY `FK_cat_tabletype_cat_datatypes_id_idx` (`cat_datatypes_id`),
  CONSTRAINT `FK_cat_tabletype_cat_datatypes_id` FOREIGN KEY (`cat_datatypes_id`) REFERENCES `cat_datatypes` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cat_tabletype_cat_filtertype` FOREIGN KEY (`cat_filtertype_id`) REFERENCES `cat_filtertype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cat_taggrouptype`
--

DROP TABLE IF EXISTS `cat_taggrouptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_taggrouptype` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `inv_ConfigOptionSet_Id` int(10) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `FK_cat_taggrouptype_inv_configoptionset_idx` (`inv_ConfigOptionSet_Id`),
  CONSTRAINT `FK_cat_taggroupType_inv_configoptionset` FOREIGN KEY (`inv_ConfigOptionSet_Id`) REFERENCES `inv_configoptionset` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Group types have a common entity but no attribute values associated.\nThe available attributes are restricted by the connection model.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `endurancetest-to-devices-view`
--

DROP TABLE IF EXISTS `endurancetest-to-devices-view`;
/*!50001 DROP VIEW IF EXISTS `endurancetest-to-devices-view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `endurancetest-to-devices-view` AS SELECT 
 1 AS `Test id`,
 1 AS `Test name`,
 1 AS `Device name`,
 1 AS `Path`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `inv_applicationcommandrequest`
--

DROP TABLE IF EXISTS `inv_applicationcommandrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_applicationcommandrequest` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_application_id` int(10) NOT NULL,
  `cat_applicationcommand_id` int(10) NOT NULL,
  `RequestTime` datetime NOT NULL,
  `ExecutionTime` datetime DEFAULT NULL,
  `exitCode` int(10) NOT NULL DEFAULT '2147483647' COMMENT 'The default of the column is Int32 maxvalue ( 2^31  - 1) \nWith this value we know when a command is not run yet.',
  PRIMARY KEY (`id`),
  KEY `FK_inv_applicationcommandrequests_cat_application_idx` (`cat_application_id`),
  KEY `FK_inv_applicationcommandrequests_cat_applicationcommand_idx` (`cat_applicationcommand_id`),
  CONSTRAINT `FK_inv_applicationcommandrequests_cat_application` FOREIGN KEY (`cat_application_id`) REFERENCES `cat_application` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_inv_applicationcommandrequests_cat_applicationcommand` FOREIGN KEY (`cat_applicationcommand_id`) REFERENCES `cat_applicationcommand` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Manages the commands requested for an application. \nThe client polls this database and acts accordingly to the requested command.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_applicationruntime`
--

DROP TABLE IF EXISTS `inv_applicationruntime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_applicationruntime` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_application_id` int(10) NOT NULL,
  `loginTime` datetime(4) DEFAULT NULL,
  `heartbeatCounter` int(10) NOT NULL COMMENT 'This column has to be updated in the defined intervall. ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `programmName_UNIQUE` (`cat_application_id`),
  CONSTRAINT `fk_inv_applicationruntime_cat_applications` FOREIGN KEY (`cat_application_id`) REFERENCES `cat_application` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Tells which applications are running at the moment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_assignmentschedule`
--

DROP TABLE IF EXISTS `inv_assignmentschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_assignmentschedule` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `DateTime` datetime NOT NULL,
  `inv_devicenode_Id` int(10) NOT NULL,
  `Position_Id` int(10) NOT NULL,
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IXFK_asn_PositionAssignment_inv_AssignmentSchedule` (`Position_Id`),
  KEY `IXFK_asn_TesteeSchedule_inv_AssignmentSchedule` (`inv_devicenode_Id`),
  CONSTRAINT `FK_asn_PositionAssignment_inv_AssignmentSchedule` FOREIGN KEY (`Position_Id`) REFERENCES `inv_stubendposition` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_asn_TesteeSchedule_inv_AssignmentSchedule` FOREIGN KEY (`inv_devicenode_Id`) REFERENCES `inv_devicenode` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_changelog`
--

DROP TABLE IF EXISTS `inv_changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_changelog` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `User` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Occurrence` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '6 means nanosecond resolution',
  `ChangeType` char(1) COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_commchannel`
--

DROP TABLE IF EXISTS `inv_commchannel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_commchannel` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `inv_hwdriver_Id` int(10) NOT NULL,
  `SortOrder` int(10) NOT NULL DEFAULT '0',
  `InActive` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'DevExpress uses .NET Boolean type for MySQL tinyint(1) type',
  `Deprecated` date DEFAULT NULL,
  `inv_testfacility_Id` int(10) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_inv_commchannel_invhwdriver_idx` (`inv_hwdriver_Id`),
  KEY `IX_inv_commchannel_IdDriver` (`Id`,`inv_hwdriver_Id`),
  KEY `FK_inv_commchannel_inv_testfacility_idx` (`inv_testfacility_Id`),
  CONSTRAINT `FK_inv_commchannel_inv_hwDriver` FOREIGN KEY (`inv_hwdriver_Id`) REFERENCES `inv_hwdriver` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_commchannel_inv_testfacility` FOREIGN KEY (`inv_testfacility_Id`) REFERENCES `inv_testfacility` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Defines in which test facility the commchannel is located.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_commonentity`
--

DROP TABLE IF EXISTS `inv_commonentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_commonentity` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL DEFAULT '<Entity>',
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `cat_connectionModel_Id` int(10) NOT NULL,
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `FK_inv_commonentity_cat_connectionmodel_idx` (`cat_connectionModel_Id`),
  CONSTRAINT `FK_inv_commonentity_cat_connectionmodel` FOREIGN KEY (`cat_connectionModel_Id`) REFERENCES `cat_connectionmodel` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_commonentity_AFTER_UPDATE` AFTER UPDATE ON `inv_commonentity` FOR EACH ROW
BEGIN
     
     
UPDATE inv_ConfigOptionSet cfg 
SET 
    cfg.cat_connectionModel_Id = NEW.cat_connectionModel_Id
WHERE
    cfg.cat_connectionModel_Id = OLD.cat_connectionModel_Id
        AND cfg.Id IN (SELECT 
            opt.inv_ConfigOptionSet_Id
        FROM
            inv_ConfigOption opt
        WHERE
            opt.inv_CommonEntityAttribute_EntityId = OLD.Id);
     
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inv_commonentityattribute`
--

DROP TABLE IF EXISTS `inv_commonentityattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_commonentityattribute` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(2500) CHARACTER SET latin1 DEFAULT '',
  `cat_commonattribute` int(10) DEFAULT NULL COMMENT 'Displayformat adopted from https://msdn.microsoft.com/en-us/library/dwhawy9k(v=vs.110).aspx',
  `inv_commonentity_Id` int(10) NOT NULL,
  `cat_SIUnit_Symbol` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL DEFAULT 'n.a.',
  `cat_AttributeValueColumn_Name` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `asn_listsource_Id` int(10) DEFAULT NULL,
  `cat_editorcontrol_Id` int(10) DEFAULT NULL,
  `DisplayFormat` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT 'G',
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_inv_commonentityattribute` (`Name`,`inv_commonentity_Id`,`cat_AttributeValueColumn_Name`),
  KEY `FK_inv_commonentityattribute_inv_commonentity_Id_Idx` (`inv_commonentity_Id`),
  KEY `FK_inv_commonentityattribute_cat_AttributeValueColumn_Name_Idx` (`cat_AttributeValueColumn_Name`),
  KEY `UQ_inv_commonentityattribute_IdAttrId` (`Id`,`inv_commonentity_Id`),
  KEY `FK_inv_commonentityattribute_asn_listsource_idx` (`asn_listsource_Id`),
  KEY `FK_inv_commonentityattribute_SiUnitIdx` (`cat_SIUnit_Symbol`),
  KEY `FK_inv_commonentityattribute_cat_commonAttribute_Id_idx` (`cat_commonattribute`),
  CONSTRAINT `FK_inv_commonentityattribute_asn_listsource` FOREIGN KEY (`asn_listsource_Id`) REFERENCES `asn_listsource` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_commonentityattribute_cat_AttributeValueColumn_Name` FOREIGN KEY (`cat_AttributeValueColumn_Name`) REFERENCES `cat_attributevaluecolumn` (`Name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_commonentityattribute_cat_commonAttribute_Id` FOREIGN KEY (`cat_commonattribute`) REFERENCES `cat_commonattribute` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_commonentityattribute_cat_siunit` FOREIGN KEY (`cat_SIUnit_Symbol`) REFERENCES `cat_siunit` (`Symbol`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_commonentityattribute_inv_commonentity_Id` FOREIGN KEY (`inv_commonentity_Id`) REFERENCES `inv_commonentity` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_commonentityattributevalue`
--

DROP TABLE IF EXISTS `inv_commonentityattributevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_commonentityattributevalue` (
  `Id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'exists only since devexpress cannot cope with compund PKs.\nThis id actually represents a cell value of a row.',
  `AttrRowId` int(10) NOT NULL DEFAULT '1' COMMENT 'Incremented when an new attribute value row, i.e. a  set of compound items,  is set.',
  `inv_CommonEntityAttribute_Id` int(10) NOT NULL,
  `cat_SIUnitPrefix_Symbol` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL DEFAULT 'n.a.',
  `StringValue` varchar(2500) COLLATE latin1_general_ci DEFAULT NULL,
  `FloatValue` double DEFAULT NULL,
  `IntValue` int(10) DEFAULT NULL,
  `BitValue` bit(8) DEFAULT NULL COMMENT 'DevExpress uses .NET Byte type for MySQL bit type',
  `ListValue_AttrRowId` int(10) DEFAULT NULL,
  `inActive` tinyint(1) NOT NULL DEFAULT '0',
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_AttrId_AttrRowId` (`inv_CommonEntityAttribute_Id`,`AttrRowId`),
  KEY `IXFK_inv_CommonEntityValue_inv_CommonEntityAttribute` (`inv_CommonEntityAttribute_Id`),
  KEY `IXFK_inv_commonentityattributevalue_cat_SiUnitPrefix` (`cat_SIUnitPrefix_Symbol`),
  CONSTRAINT `FK_inv_commonentityattributevalue_cat_siunitprefix` FOREIGN KEY (`cat_SIUnitPrefix_Symbol`) REFERENCES `cat_siunitprefix` (`Symbol`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_commonentityattributevalue_inv_CommonEntityAttribute` FOREIGN KEY (`inv_CommonEntityAttribute_Id`) REFERENCES `inv_commonentityattribute` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27957 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Ersetzt KatalogTabellen ohne weitere Abhaengigkeiten. Also : Keine Beziehungen wie Land und Stadt. aber Einfache Auflistungen wie : Farben, Zustaende, Gewinde,....\nWird ein Eintrag pro Entity eingefügt, muss die gesamte Zeile eingefügt werden, wie in gewöhnlichen Tabellen.';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_commonentityattributevalue_BEFORE_INSERT` BEFORE INSERT ON `inv_commonentityattributevalue` FOR EACH ROW
BEGIN
  DECLARE  vMaxAttrRowId int;

    
	SELECT 
		MAX(attrVal.AttrRowId) INTO vMaxAttrRowId
	FROM
		inv_commonentityattributevalue attrVal
	JOIN
		inv_commonentityattribute attr ON attr.id = attrVal.inv_commonentityattribute_id
	WHERE
		attr.inv_CommonEntity_Id IN (SELECT 
            attr.inv_CommonEntity_Id
        FROM
            inv_commonentityattribute attr
        WHERE
            attr.id = NEW.inv_CommonEntityAttribute_Id);
      
      
  IF( vMaxAttrRowId IS NULL ) THEN
      SET NEW.AttrRowId = 1;
  ELSE
      SET NEW.AttrRowId  =  vMaxAttrRowId + 1;
  END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inv_configoption`
--

DROP TABLE IF EXISTS `inv_configoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_configoption` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_ConfigOptionSet_Id` int(10) NOT NULL,
  `inv_CommonEntityAttribute_AttrId` int(10) DEFAULT NULL COMMENT 'This column can be null, to apply all attributes of an entity',
  `inv_CommonEntityAttribute_EntityId` int(10) NOT NULL,
  `mandatory` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'is this configuration value required to be set?',
  PRIMARY KEY (`Id`),
  KEY `FK_inv_configoption_inv_configoptionset_idx` (`inv_ConfigOptionSet_Id`),
  KEY `FK_inv_configoption_idx` (`inv_CommonEntityAttribute_AttrId`,`inv_CommonEntityAttribute_EntityId`),
  KEY `iinv_CommonEntityAttribute_AttrId_inv_configoption` (`inv_CommonEntityAttribute_AttrId`),
  CONSTRAINT `FK_inv_configoption_inv_CommonEntityAttribute_AttrId` FOREIGN KEY (`inv_CommonEntityAttribute_AttrId`) REFERENCES `inv_commonentityattribute` (`Id`),
  CONSTRAINT `FK_inv_configoption_inv_commonentityAttribute` FOREIGN KEY (`inv_CommonEntityAttribute_AttrId`, `inv_CommonEntityAttribute_EntityId`) REFERENCES `inv_commonentityattribute` (`Id`, `inv_commonentity_Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_configoption_inv_configoptionset` FOREIGN KEY (`inv_ConfigOptionSet_Id`) REFERENCES `inv_configoptionset` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Lists available configuration combinations for a given config set.';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_configoption_BEFORE_INSERT` BEFORE INSERT ON `inv_configoption` FOR EACH ROW
BEGIN
  DECLARE vId int;
  

  
  SELECT c2.id INTO vId
	FROM
		cat_connectionmodel c1
			JOIN
		cat_connectionmodel c2 
			 ON COALESCE(c1.Physical_Id,     c2.Physical_Id, 1)     = COALESCE(c2.Physical_Id,     c1.Physical_Id,  1)
			AND COALESCE(c1.DataLink_Id,     c2.DataLink_Id, 1)     = COALESCE(c2.DataLink_Id,     c1.DataLink_Id, 1)
			AND COALESCE(c1.Network_Id,      c2.Network_Id, 1)      = COALESCE(c2.Network_Id,      c1.Network_Id, 1)
			AND COALESCE(c1.Transport_Id,    c2.Transport_Id, 1)    = COALESCE(c2.Transport_Id,    c1.Transport_Id, 1)
			AND COALESCE(c1.Session_Id,      c2.Session_Id, 1)      = COALESCE(c2.Session_Id,      c1.Session_Id, 1)
			AND COALESCE(c1.Presentation_Id, c2.Presentation_Id, 1) = COALESCE(c2.Presentation_Id, c1.Presentation_Id, 1)
			AND COALESCE(c1.Application_Id,  c2.Application_Id, 1)  = COALESCE(c2.Application_Id,  c1.Application_Id, 1)
	WHERE
		c1.Id = (SELECT 
				cat_connectionmodel_Id
			FROM
				inv_configoptionset
			WHERE
				id = NEW.inv_ConfigOptionSet_Id)
            
	AND c2.id = (
		SELECT cat_connectionmodel_Id FROM inv_commonentity 
		WHERE id= NEW.inv_CommonEntityAttribute_EntityId
		);
  
  
  IF ( vId IS NULL ) THEN
      
      signal sqlstate '45000' set message_text = 'connection model of config set does not match common entity or wrong IDs specified';
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_configoption_BEFORE_UPDATE` BEFORE UPDATE ON `inv_configoption` FOR EACH ROW
BEGIN
  DECLARE vId int;

  

 SELECT c2.id INTO vId
	FROM
		cat_connectionmodel c1
			JOIN
		cat_connectionmodel c2 
			 ON COALESCE(c1.Physical_Id,     c2.Physical_Id, 1)     = COALESCE(c2.Physical_Id,     c1.Physical_Id,  1)
			AND COALESCE(c1.DataLink_Id,     c2.DataLink_Id, 1)     = COALESCE(c2.DataLink_Id,     c1.DataLink_Id, 1)
			AND COALESCE(c1.Network_Id,      c2.Network_Id, 1)      = COALESCE(c2.Network_Id,      c1.Network_Id, 1)
			AND COALESCE(c1.Transport_Id,    c2.Transport_Id, 1)    = COALESCE(c2.Transport_Id,    c1.Transport_Id, 1)
			AND COALESCE(c1.Session_Id,      c2.Session_Id, 1)      = COALESCE(c2.Session_Id,      c1.Session_Id, 1)
			AND COALESCE(c1.Presentation_Id, c2.Presentation_Id, 1) = COALESCE(c2.Presentation_Id, c1.Presentation_Id, 1)
			AND COALESCE(c1.Application_Id,  c2.Application_Id, 1)  = COALESCE(c2.Application_Id,  c1.Application_Id, 1)
	WHERE
		c1.Id = (SELECT 
				cat_connectionmodel_Id
			FROM
				inv_configoptionset
			WHERE
				id = NEW.inv_ConfigOptionSet_Id)
            
	AND c2.id = (
		SELECT cat_connectionmodel_Id FROM inv_commonentity 
		WHERE id= NEW.inv_CommonEntityAttribute_EntityId
		);
  

  IF ( vId IS NULL ) THEN
      
      signal sqlstate '45000' set message_text = 'connection model of config set does not match common entity or wrong IDs specified';
   END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inv_configoptionset`
--

DROP TABLE IF EXISTS `inv_configoptionset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_configoptionset` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `cat_ConnectionModel_Id` int(10) NOT NULL COMMENT 'unique (id, connModel) is used for HW driver which requires a compound FK on  (id, connModel)',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_inv_configoptionset_name` (`Name`),
  UNIQUE KEY `UQ_inv_configoptionset_idConnModel` (`Id`,`cat_ConnectionModel_Id`),
  KEY `FK_inv_configoptionset_cat_connectionmodel_idx` (`cat_ConnectionModel_Id`),
  CONSTRAINT `FK_inv_configoptionset_cat_connectionmodel_id` FOREIGN KEY (`cat_ConnectionModel_Id`) REFERENCES `cat_connectionmodel` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Lists Sets of configurations. The conncetion model is filled by a trigger from inv_commonEntity.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_configuration`
--

DROP TABLE IF EXISTS `inv_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_configuration` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ConfigurationOwner` varchar(500) COLLATE latin1_general_ci NOT NULL DEFAULT 'Application' COMMENT 'This should contain a foreign key to the users table but for now as long as there is not defined how this will look like and we use application wide configuration anyway.',
  `Value` double DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='This table contains the configuration foreach user and for the application.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_dbinfo`
--

DROP TABLE IF EXISTS `inv_dbinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_dbinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Version in hex form: 0x7FAABBCC, AA=major,BB=minor, CC=patch',
  `major` int(10) NOT NULL,
  `minor` int(10) NOT NULL,
  `patch` int(10) NOT NULL,
  `VersionDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ChangeLog` varchar(5000) CHARACTER SET latin1 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_devicenode`
--

DROP TABLE IF EXISTS `inv_devicenode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_devicenode` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `Hotpluggable` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'DevExpress uses .NET Boolean type for MySQL tinyint(1) type',
  `Path` varchar(20000) CHARACTER SET latin1 DEFAULT NULL,
  `UqPathHash` char(32) CHARACTER SET latin1 DEFAULT '' COMMENT 'must not be null since Devexpress xpo can not handle',
  `inv_hwgroup_Id` int(10) NOT NULL,
  `inv_taggroup_id` int(10) NOT NULL,
  `inv_configoptionset_id` int(10) NOT NULL COMMENT 'each device, e.g. sensor, has its own connection model which must match when grouped together or assigned to a communication channel',
  `cat_connectionmodel_Id` int(10) NOT NULL,
  `cat_hwioportconfigoptionset_id` int(10) NOT NULL,
  `InActive` tinyint(1) DEFAULT '0' COMMENT 'DevExpress uses .NET Boolean type for MySQL tinyint(1) type',
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_inv_devicenode_NameHwGroup` (`Name`,`inv_hwgroup_Id`),
  UNIQUE KEY `UQ_inv_devicenode_ inv_taggroup_id` (`inv_taggroup_id`),
  UNIQUE KEY `UqPathHash_UNIQUE` (`UqPathHash`),
  KEY `FK_inv_devicenode_inv_configoptionset_hwioport_id_idx` (`cat_hwioportconfigoptionset_id`),
  KEY `FK_inv_devicenode_inv_hwgroup_Idx` (`inv_hwgroup_Id`),
  KEY `FK_inv_devicenode_cat_connectionmodel_Idx` (`cat_connectionmodel_Id`),
  KEY `FK_inv_devicenode_inv_configoptionset_idx` (`inv_configoptionset_id`),
  KEY `FK_inv_devicenode_inv_tagggroup_idx` (`inv_taggroup_id`),
  CONSTRAINT `FK_inv_devicenode_cat_connectionmodel_id` FOREIGN KEY (`cat_connectionmodel_Id`) REFERENCES `cat_connectionmodel` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_devicenode_inv_configoptionset_hwioport_id` FOREIGN KEY (`cat_hwioportconfigoptionset_id`) REFERENCES `inv_configoptionset` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_devicenode_inv_configoptionset_id` FOREIGN KEY (`inv_configoptionset_id`) REFERENCES `inv_configoptionset` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_inv_devicenode_inv_hwgroup_id` FOREIGN KEY (`inv_hwgroup_Id`) REFERENCES `inv_hwgroup` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_devicenode_inv_taggroup_id` FOREIGN KEY (`inv_taggroup_id`) REFERENCES `inv_taggroup` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2502 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_devicenode_BEFORE_INSERT` BEFORE INSERT ON `inv_devicenode` FOR EACH ROW
BEGIN
 DECLARE vNewPath varchar(20000); 
 DECLARE vConnModel int(10);
 
 
  
 if (new.cat_connectionmodel_id = 1)then
	signal sqlstate '45000' set message_text = 'Not posible to add a device node to this group with connection model "None"';
 end if;
 
 
 
  
 SELECT CONCAT( path, '/', NEW.name)  INTO vNewPath FROM  
  inv_hwgroup  WHERE id = NEW.inv_hwgroup_id;
 

 SET NEW.Path = vNewPath;  
 SET NEW.UqPathHash = MD5(vNewPath); 
 
 
  
  
  
  UPDATE inv_taggroup SET id=id WHERE id = NEW.inv_taggroup_id;
 
 
 
 
 
IF ( NEW.cat_connectionmodel_id IS NOT NULL ) THEN

	SELECT 
		c2.id INTO vConnModel 
	FROM
		cat_connectionmodel c1
	JOIN
		cat_connectionmodel c2 
		 ON COALESCE(c1.Physical_Id,     c2.Physical_Id, 1)     = COALESCE(c2.Physical_Id,     c1.Physical_Id,  1)
		AND COALESCE(c1.DataLink_Id,     c2.DataLink_Id, 1)     = COALESCE(c2.DataLink_Id,     c1.DataLink_Id, 1)
		AND COALESCE(c1.Network_Id,      c2.Network_Id, 1)      = COALESCE(c2.Network_Id,      c1.Network_Id, 1)
		AND COALESCE(c1.Transport_Id,    c2.Transport_Id, 1)    = COALESCE(c2.Transport_Id,    c1.Transport_Id, 1)
		AND COALESCE(c1.Session_Id,      c2.Session_Id, 1)      = COALESCE(c2.Session_Id,      c1.Session_Id, 1)
		AND COALESCE(c1.Presentation_Id, c2.Presentation_Id, 1) = COALESCE(c2.Presentation_Id, c1.Presentation_Id, 1)
		AND COALESCE(c1.Application_Id,  c2.Application_Id, 1)  = COALESCE(c2.Application_Id,  c1.Application_Id, 1)
	WHERE
		c1.Id = NEW.cat_connectionmodel_id
		AND
		c2.Id = (
             SELECT cat_connectionmodel_Id
			 FROM inv_hwgroup 
			 WHERE id = NEW.inv_hwgroup_id
		);


	IF ( vConnModel IS NULL ) THEN
	   
		signal sqlstate '45000' set message_text = 'connection model of device node does not match group';
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_devicenode_AFTER_INSERT` AFTER INSERT ON `inv_devicenode` FOR EACH ROW
BEGIN
	UPDATE inv_taggroup SET id=id WHERE id = NEW.inv_taggroup_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_devicenode_BEFORE_UPDATE` BEFORE UPDATE ON `inv_devicenode` FOR EACH ROW
BEGIN
 DECLARE vNewPath varchar(20000); 
 DECLARE vConnModel int(10);
 
 
 
 
 
 
  
  SELECT CONCAT( path, '/', NEW.name)  INTO vNewPath FROM  
  inv_hwgroup  WHERE id = NEW.inv_hwgroup_id;
  
  SET NEW.Path = vNewPath;  
  SET NEW.UqPathHash = MD5(vNewPath); 
 
 
  
  
  
  UPDATE inv_taggroup SET id=id WHERE id = NEW.inv_taggroup_id;
 
 
 
 
 
 IF ( NEW.cat_connectionmodel_id IS NOT NULL ) THEN

	SELECT 
		c2.id INTO vConnModel 
	FROM
		cat_connectionmodel c1
	JOIN
		cat_connectionmodel c2 
		 ON COALESCE(c1.Physical_Id,     c2.Physical_Id, 1)     = COALESCE(c2.Physical_Id,     c1.Physical_Id,  1)
		AND COALESCE(c1.DataLink_Id,     c2.DataLink_Id, 1)     = COALESCE(c2.DataLink_Id,     c1.DataLink_Id, 1)
		AND COALESCE(c1.Network_Id,      c2.Network_Id, 1)      = COALESCE(c2.Network_Id,      c1.Network_Id, 1)
		AND COALESCE(c1.Transport_Id,    c2.Transport_Id, 1)    = COALESCE(c2.Transport_Id,    c1.Transport_Id, 1)
		AND COALESCE(c1.Session_Id,      c2.Session_Id, 1)      = COALESCE(c2.Session_Id,      c1.Session_Id, 1)
		AND COALESCE(c1.Presentation_Id, c2.Presentation_Id, 1) = COALESCE(c2.Presentation_Id, c1.Presentation_Id, 1)
		AND COALESCE(c1.Application_Id,  c2.Application_Id, 1)  = COALESCE(c2.Application_Id,  c1.Application_Id, 1)
	WHERE
		c1.Id = NEW.cat_connectionmodel_id
		AND
		c2.Id = (
             SELECT cat_connectionmodel_Id
			 FROM inv_hwgroup 
			 WHERE id = NEW.inv_hwgroup_id
		);


	IF ( vConnModel IS NULL ) THEN
	   
		signal sqlstate '45000' set message_text = 'connection model of device node does not match group';
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_devicenode_AFTER_UPDATE` AFTER UPDATE ON `inv_devicenode` FOR EACH ROW
BEGIN
	UPDATE inv_taggroup SET id=id WHERE id = NEW.inv_taggroup_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inv_dndcontrolioport`
--

DROP TABLE IF EXISTS `inv_dndcontrolioport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_dndcontrolioport` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `cat_signalmode_id` int(10) NOT NULL DEFAULT '1' COMMENT 'This defines how a signal is handled. Note that this is from device view. \n1 readonly, 2 writeonly, 3 read/write',
  `cat_hwioportpurpose` int(10) NOT NULL DEFAULT '1' COMMENT 'voltage, current measuring, etc.',
  `inv_draganddropcontrol` int(10) NOT NULL,
  `inv_signaltag_id` int(10) DEFAULT NULL COMMENT 'each i/o port must have a signal tag assigned. port - signaltag = 0..1:1 relation. But not every tag has a port, e.g. intermediate variables.',
  `deprecated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`,`inv_draganddropcontrol`),
  KEY `FK_inv_dndcontrolioport_cat_signalmode_idx` (`cat_signalmode_id`),
  KEY `FK_inv_dndcontrolioport_inv_draganddropcontrol_idx` (`inv_draganddropcontrol`),
  KEY `FK_inv_dndcontrolioport_cat_hwioportpurpose_idx` (`cat_hwioportpurpose`),
  KEY `FK_inv_dndcontrolioport_inv_signaltag_idx` (`inv_signaltag_id`),
  CONSTRAINT `FK_inv_dndcontrolioport_cat_hwioportpurpose` FOREIGN KEY (`cat_hwioportpurpose`) REFERENCES `cat_hwioportpurpose` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_dndcontrolioport_cat_signalmode` FOREIGN KEY (`cat_signalmode_id`) REFERENCES `cat_signalmode` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_dndcontrolioport_inv_draganddropcontrol` FOREIGN KEY (`inv_draganddropcontrol`) REFERENCES `inv_draganddropcontrol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_dndcontrolioport_inv_signaltag` FOREIGN KEY (`inv_signaltag_id`) REFERENCES `inv_signaltag` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53217 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='This trigger will validate the connection to port id column to verify that if object A references object B, then B must reference A as well.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_document`
--

DROP TABLE IF EXISTS `inv_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_document` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL COMMENT 'original file name or document name to use',
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `Version` varchar(20) COLLATE latin1_general_ci NOT NULL COMMENT 'major.minor.patch',
  `Content` longblob NOT NULL,
  `cat_documenttype_id` int(10) NOT NULL,
  `SerializedData` longtext COLLATE latin1_general_ci COMMENT 'contains serialized objects, e.g. data structures of a parsed CANdb file',
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_inv_document` (`Name`,`Version`,`cat_documenttype_id`),
  KEY `IXFK_cat_documenttype_inv_document` (`cat_documenttype_id`),
  CONSTRAINT `FK_cat_documenttype_inv_document` FOREIGN KEY (`cat_documenttype_id`) REFERENCES `cat_documenttype` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_draganddropcontainer`
--

DROP TABLE IF EXISTS `inv_draganddropcontainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_draganddropcontainer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `isHidden` tinyint(1) DEFAULT '0',
  `serializedUI` longtext CHARACTER SET latin1 NOT NULL COMMENT 'longtext because the string saved here gets big, here quickly because it''s a xml.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1664 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_draganddropcontrol`
--

DROP TABLE IF EXISTS `inv_draganddropcontrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_draganddropcontrol` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_draganddropcontrol_id` int(10) NOT NULL,
  `inv_draganddropcontrolcontainer_id` int(10) NOT NULL,
  `guid` varchar(255) CHARACTER SET latin1 NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `serializedui` longtext CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_inv_draganddropcontrol_cat_dndcontrol_idx` (`cat_draganddropcontrol_id`),
  KEY `FK_inv_draganddropcontrol:inv_draganddropcontrolcontainer_idx` (`inv_draganddropcontrolcontainer_id`),
  CONSTRAINT `FK_inv_draganddropcontrol_cat_draganddropcontrol` FOREIGN KEY (`cat_draganddropcontrol_id`) REFERENCES `cat_draganddropcontrol` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_inv_draganddropcontrol_inv_Draganddropcopntrolcontainer` FOREIGN KEY (`inv_draganddropcontrolcontainer_id`) REFERENCES `inv_draganddropcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4328 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_endurancetest`
--

DROP TABLE IF EXISTS `inv_endurancetest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_endurancetest` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `PlannedHoursTag` int(10) DEFAULT NULL,
  `StatusTag` int(10) DEFAULT NULL,
  `StartedOn` datetime DEFAULT NULL,
  `Deprecated` date DEFAULT NULL,
  `PlannedHours` int(10) DEFAULT NULL COMMENT 'Column is necessary because planing and assignment are 2 seperate things.\nThe tag can only be assigned as soon as the testfacility is set. ',
  `inv_testfacility_Id` int(10) DEFAULT NULL,
  `PlannedStartDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `inv_endurancetest.planedhours_inv_signaltag_idx` (`PlannedHoursTag`),
  KEY `inv_endurancetest.statustag_inv_signaltag_idx` (`StatusTag`),
  KEY `FK_inv_endurancetest_inv_testfacility_idx` (`inv_testfacility_Id`),
  CONSTRAINT `FK_inv_endurancetest_inv_testfacility` FOREIGN KEY (`inv_testfacility_Id`) REFERENCES `inv_testfacility` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `inv_endurancetest.planedhours_inv_signaltag` FOREIGN KEY (`PlannedHoursTag`) REFERENCES `inv_signaltag` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `inv_endurancetest.statustag_inv_signaltag` FOREIGN KEY (`StatusTag`) REFERENCES `inv_signaltag` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_entitystate`
--

DROP TABLE IF EXISTS `inv_entitystate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_entitystate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inactive` tinyint(1) DEFAULT NULL COMMENT 'DevExpress uses .NET Boolean type for MySQL tinyint(1) type. Inactive is used to skip the entity during windows service processing. The entity is still shown on GUIs but greyed out or tagged by a special icon to indicate that it is disabled.',
  `description` varchar(2500) COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT 'the descriptive text shown in the GUI for the user. e.g. "manually set", "error occured", "invalid value" and so on',
  `cat_inactivereason_id` int(10) NOT NULL COMMENT 'reason for inactivity: manually set by user, ',
  `deprecated` datetime DEFAULT NULL COMMENT 'the entity which is associated to this item id has been marked deprecated with the given date. This means starting from that date the associated entity is logically deleted and not shown anymore in GUIs. After some global (to be defined) grace period that item is deleted permanently.',
  PRIMARY KEY (`id`),
  KEY `FK_inv_entitystate_cat_inactivereason_id_idx` (`cat_inactivereason_id`),
  CONSTRAINT `FK_inv_entitystate_cat_inactivereason_id` FOREIGN KEY (`cat_inactivereason_id`) REFERENCES `cat_inactivereason` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Global table which holds the state of various entities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_exhaustpipe`
--

DROP TABLE IF EXISTS `inv_exhaustpipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_exhaustpipe` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `ProductionDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Length` double NOT NULL,
  `Comment` varchar(500) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `DiameterBegin` double NOT NULL,
  `DiameterEnd` double NOT NULL,
  `DiameterMax` double NOT NULL,
  `PressureTappingPoint1` double NOT NULL DEFAULT '0',
  `PressureTappingPoint2` double NOT NULL DEFAULT '0',
  `PressureTappingPoint3` double NOT NULL DEFAULT '0',
  `inv_TestFacility_Id` int(10) DEFAULT '0',
  `cat_ComponentCondition_Id` int(10) NOT NULL DEFAULT '1',
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `IXFK_asn_ExhaustPipeCondition_cat_ComponentCondition` (`cat_ComponentCondition_Id`),
  KEY `IXFK_asn_ExhaustPipeLocation_inv_TestFacility` (`inv_TestFacility_Id`),
  CONSTRAINT `FK_asn_ExhaustPipeCondition_cat_ComponentCondition` FOREIGN KEY (`cat_ComponentCondition_Id`) REFERENCES `cat_componentcondition` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_asn_ExhaustPipeLocation_inv_TestFacility` FOREIGN KEY (`inv_TestFacility_Id`) REFERENCES `inv_testfacility` (`Id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_exhaustpipe_BEFORE_DELETE` BEFORE DELETE
    ON vega8_all.inv_exhaustpipe FOR EACH ROW
BEGIN
    DECLARE vFacility int(10);

SELECT 
    inv_TestFacility_Id
INTO vFacility FROM
    inv_exhaustpipe
WHERE
    id = OLD.id;
   
   IF ( vFacility IS NOT NULL ) THEN
      signal sqlstate '45000' set message_text = 'Exhaustpipe is assembled in TestFacility';
   END IF;
   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inv_exports`
--

DROP TABLE IF EXISTS `inv_exports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_exports` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_exportschedule_Id` int(11) NOT NULL,
  `ExportDate` datetime DEFAULT NULL,
  `DeletionDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_inv_exports_inv_exportschedule_idx` (`inv_exportschedule_Id`),
  CONSTRAINT `FK_inv_exports_inv_exportschedule` FOREIGN KEY (`inv_exportschedule_Id`) REFERENCES `inv_exportschedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_exportschedule`
--

DROP TABLE IF EXISTS `inv_exportschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_exportschedule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_testfacility_id` int(10) NOT NULL,
  `exportpath` varchar(2500) COLLATE latin1_general_ci NOT NULL,
  `filename` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `InActive` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'DevExpress uses .NET Boolean type for MySQL tinyint(1) type',
  `DeletionAfterDays` int(10) DEFAULT NULL,
  `StartTime` datetime NOT NULL,
  `maximumfilesize` int(10) NOT NULL,
  `TaskName` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TaskGuid` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `TriggerGuid` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `LastExportDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TriggerGuid_UNIQUE` (`TriggerGuid`),
  UNIQUE KEY `TaskGuid_UNIQUE` (`TaskGuid`),
  UNIQUE KEY `TaskName_UNIQUE` (`TaskName`),
  KEY `FK_inv_exportschedule_inv_testfacility_idx` (`inv_testfacility_id`),
  CONSTRAINT `FK_inv_exportschedule_inv_testfacility` FOREIGN KEY (`inv_testfacility_id`) REFERENCES `inv_testfacility` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_hwdriver`
--

DROP TABLE IF EXISTS `inv_hwdriver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_hwdriver` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL DEFAULT '<Driver>',
  `Guid` varchar(40) COLLATE latin1_general_ci DEFAULT NULL,
  `SharedInstance` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'This setting is predetermined by the driver. \nIt means a  driver must not be instantiated multiple times. I.e. shared=1 => only one instance allowed\nshared=0 => multiple instances allowed',
  `inv_ConfigOptionSet_Id` int(10) NOT NULL,
  `cat_connectionmodel_Id` int(10) NOT NULL,
  `InActive` bit(1) NOT NULL DEFAULT b'0' COMMENT 'DevExpress uses .NET Boolean type for MySQL tinyint(1) type',
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_inv_hwdriver_inv_ConfigOptionSet_idx` (`inv_ConfigOptionSet_Id`,`cat_connectionmodel_Id`),
  KEY `iinv_ConfigOptionSet_Id_inv_hwdriver` (`inv_ConfigOptionSet_Id`),
  KEY `FK_inv_hwdriver_cat_connectionmodel_id_idx` (`cat_connectionmodel_Id`),
  CONSTRAINT `FK_inv_hwdriver_cat_connectionmodel_id` FOREIGN KEY (`cat_connectionmodel_Id`) REFERENCES `cat_connectionmodel` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_inv_hwdriver_inv_ConfigOptionSet_Id` FOREIGN KEY (`inv_ConfigOptionSet_Id`) REFERENCES `inv_configoptionset` (`Id`),
  CONSTRAINT `FK_inv_hwdriver_inv_configOptionSet` FOREIGN KEY (`inv_ConfigOptionSet_Id`, `cat_connectionmodel_Id`) REFERENCES `inv_configoptionset` (`Id`, `cat_ConnectionModel_Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Lists the software to load (.dll) in order to access the hardware';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_hwgroup`
--

DROP TABLE IF EXISTS `inv_hwgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_hwgroup` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `Hotpluggable` tinyint(1) DEFAULT '0' COMMENT 'DevExpress uses .NET Boolean type for MySQL tinyint(1) type',
  `Path` varchar(20000) CHARACTER SET latin1 DEFAULT NULL,
  `UqPathHash` char(32) CHARACTER SET latin1 DEFAULT NULL,
  `HwGroupParent_Id` int(10) DEFAULT NULL,
  `cat_grouptype_id` int(10) NOT NULL,
  `cat_connectionmodel_id` int(10) NOT NULL,
  `SortOrder` int(10) DEFAULT NULL,
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `HwGroupParent_Id_UNIQUE` (`HwGroupParent_Id`,`Id`),
  UNIQUE KEY `UqPathHash_UNIQUE` (`UqPathHash`),
  KEY `FK_inv_hwgroup_cat_grouptype_id_idx` (`cat_grouptype_id`,`cat_connectionmodel_id`),
  KEY `iHwGroupParent_Id_inv_hwgroup` (`HwGroupParent_Id`),
  KEY `icat_grouptype_id_inv_hwgroup` (`cat_grouptype_id`),
  KEY `FK_inv_hwgroup_cat_connectionmodel_id_idx` (`cat_connectionmodel_id`),
  CONSTRAINT `FK_inv_hwgroup_HwGroupParent` FOREIGN KEY (`HwGroupParent_Id`) REFERENCES `inv_hwgroup` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_hwgroup_cat_connectionmodel_id` FOREIGN KEY (`cat_connectionmodel_id`) REFERENCES `cat_connectionmodel` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_inv_hwgroup_cat_grouptype_id` FOREIGN KEY (`cat_grouptype_id`, `cat_connectionmodel_id`) REFERENCES `cat_grouptype` (`Id`, `cat_connectionmodel_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1973 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT=' ';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_hwgroup_BEFORE_INSERT` BEFORE INSERT ON `inv_hwgroup` FOR EACH ROW
BEGIN

 DECLARE vNewPath varchar(20000); 
 DECLARE vConnModelParent int;
 DECLARE vConnModelChild int;
 
  
    
    
    
	SELECT 
		cfgSet.cat_connectionmodel_Id
	INTO vConnModelChild FROM	cat_grouptype grpType
		JOIN inv_configoptionset cfgSet ON grpType.inv_ConfigOptionSet_Id = cfgSet.Id
	WHERE
		grpType.id = NEW.cat_groupType_Id;

	IF ( NEW.cat_connectionmodel_id != vConnModelChild ) THEN
		signal sqlstate '45000' set message_text = 'connection model of group does not match config set of group type';
	END IF;
 
 
  
	IF (NEW.hwgroupparent_id IS NULL) THEN
    
		
        
        
		SET vNewPath =  CONCAT( '/', NEW.name); 
        
    ELSE

        
		SELECT CONCAT( `path`, '/', NEW.name ) INTO vNewPath FROM inv_hwgroup WHERE id = NEW.hwgroupparent_id;


        
		SELECT 
			c2.id INTO vConnModelParent 
		FROM
			cat_connectionmodel c1
		JOIN
			cat_connectionmodel c2 
			 ON COALESCE(c1.Physical_Id,     c2.Physical_Id, 1)     = COALESCE(c2.Physical_Id,     c1.Physical_Id,  1)
			AND COALESCE(c1.DataLink_Id,     c2.DataLink_Id, 1)     = COALESCE(c2.DataLink_Id,     c1.DataLink_Id, 1)
			AND COALESCE(c1.Network_Id,      c2.Network_Id, 1)      = COALESCE(c2.Network_Id,      c1.Network_Id, 1)
			AND COALESCE(c1.Transport_Id,    c2.Transport_Id, 1)    = COALESCE(c2.Transport_Id,    c1.Transport_Id, 1)
			AND COALESCE(c1.Session_Id,      c2.Session_Id, 1)      = COALESCE(c2.Session_Id,      c1.Session_Id, 1)
			AND COALESCE(c1.Presentation_Id, c2.Presentation_Id, 1) = COALESCE(c2.Presentation_Id, c1.Presentation_Id, 1)
			AND COALESCE(c1.Application_Id,  c2.Application_Id, 1)  = COALESCE(c2.Application_Id,  c1.Application_Id, 1)
		 WHERE
			c1.Id = NEW.cat_connectionmodel_id
			AND
			c2.Id = (
				
				SELECT hwgrpParent.cat_connectionmodel_Id 
				FROM  inv_hwGroup hwgrpParent
				WHERE hwgrpParent.Id = NEW.HwGroupParent_Id
			);


		IF ( vConnModelParent IS NULL ) THEN
			signal sqlstate '45000' set message_text = 'connection model of child group does not match parent group';
		END IF;
		
		
	END IF;
 
	SET NEW.Path = vNewPath;  
	SET NEW.UqPathHash = MD5(vNewPath); 
 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_hwgroup_BEFORE_UPDATE` BEFORE UPDATE ON `inv_hwgroup` FOR EACH ROW
BEGIN

 DECLARE vNewPath varchar(20000); 
 DECLARE vConnModelParent int;
 DECLARE vConnModelChild int;
 DECLARE vCommChannel int;

    
    
  
    
  
    
    
    
	SELECT 
		cfgSet.cat_connectionmodel_Id
	INTO vConnModelChild FROM	cat_grouptype grpType
		JOIN inv_configoptionset cfgSet ON grpType.inv_ConfigOptionSet_Id = cfgSet.Id
	WHERE
		grpType.id = NEW.cat_groupType_Id;

	IF ( NEW.cat_connectionmodel_id != vConnModelChild ) THEN
		signal sqlstate '45000' set message_text = 'connection model of group does not match config set of group type';
	END IF;
 
 
  
	IF (NEW.hwgroupparent_id IS NULL) THEN
    
    	
        
        
        SELECT CONCAT( '/', fac.name, '/', chn.name, '/', NEW.name) INTO vNewPath FROM asn_groupchanneldriver asn 
		JOIN inv_commchannel chn ON asn.inv_commchannel_id = chn.id
		JOIN inv_testfacility fac ON chn.inv_testfacility_id = fac.id
		WHERE inv_hwgroup_id = NEW.id; 
        
        IF ( vNewPath IS NULL ) THEN 
            SELECT CONCAT( '/', NEW.name) INTO vNewPath;
        END IF;
        
    ELSE

        
        
		
        
        
        
        
		SELECT CONCAT( `path`, '/', NEW.name ) INTO vNewPath FROM inv_hwgroup WHERE id = NEW.hwgroupparent_id;



        
		SELECT 
			c2.id INTO vConnModelParent 
		FROM
			cat_connectionmodel c1
		JOIN
			cat_connectionmodel c2 
			 ON COALESCE(c1.Physical_Id,     c2.Physical_Id, 1)     = COALESCE(c2.Physical_Id,     c1.Physical_Id,  1)
			AND COALESCE(c1.DataLink_Id,     c2.DataLink_Id, 1)     = COALESCE(c2.DataLink_Id,     c1.DataLink_Id, 1)
			AND COALESCE(c1.Network_Id,      c2.Network_Id, 1)      = COALESCE(c2.Network_Id,      c1.Network_Id, 1)
			AND COALESCE(c1.Transport_Id,    c2.Transport_Id, 1)    = COALESCE(c2.Transport_Id,    c1.Transport_Id, 1)
			AND COALESCE(c1.Session_Id,      c2.Session_Id, 1)      = COALESCE(c2.Session_Id,      c1.Session_Id, 1)
			AND COALESCE(c1.Presentation_Id, c2.Presentation_Id, 1) = COALESCE(c2.Presentation_Id, c1.Presentation_Id, 1)
			AND COALESCE(c1.Application_Id,  c2.Application_Id, 1)  = COALESCE(c2.Application_Id,  c1.Application_Id, 1)
		 WHERE
			c1.Id = NEW.cat_connectionmodel_id
			AND
			c2.Id = (
				
				SELECT hwgrpParent.cat_connectionmodel_Id 
				FROM  inv_hwGroup hwgrpParent
				WHERE hwgrpParent.Id = NEW.HwGroupParent_Id
			);


		IF ( vConnModelParent IS NULL ) THEN
		   
			signal sqlstate '45000' set message_text = 'connection model of child group does not match parent group';
		END IF;
		
		
	END IF;
 
	SET NEW.Path = vNewPath;  
	SET NEW.UqPathHash = MD5(vNewPath); 
    
    
    
    
    UPDATE inv_devicenode SET id=id WHERE inv_hwgroup_id = NEW.id;
 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_hwgroup_AFTER_UPDATE` AFTER UPDATE ON `inv_hwgroup` FOR EACH ROW
BEGIN
	UPDATE inv_devicenode SET id=id WHERE inv_hwgroup_id = NEW.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inv_hwioport`
--

DROP TABLE IF EXISTS `inv_hwioport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_hwioport` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `cat_signalmode_id` int(10) NOT NULL DEFAULT '1' COMMENT 'This defines how a signal is handled. Note that this is from device view. \n1 readonly, 2 writeonly, 3 read/write',
  `cat_hwioportpurpose` int(10) NOT NULL DEFAULT '1' COMMENT 'voltage, current measuring, etc.',
  `inv_devicenode` int(10) NOT NULL,
  `inv_signaltag_id` int(10) DEFAULT NULL COMMENT 'each hw i/o port must have a signal tag assigned. port - signaltag = 0..1:1 relation. But not every tag has a port, e.g. intermediate variables.',
  `deprecated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`,`inv_devicenode`),
  UNIQUE KEY `inv_signaltag_id_UNIQUE` (`inv_signaltag_id`),
  KEY `FK_inv_hwioport_cat_signalmode_idx` (`cat_signalmode_id`),
  KEY `FK_inv_hwioport_inv_devicenode_idx` (`inv_devicenode`),
  KEY `FK_inv_hwioport_cat_hwioportpurpose_idx` (`cat_hwioportpurpose`),
  KEY `FK_inv_hwioport_inv_signaltag_idx` (`inv_signaltag_id`),
  CONSTRAINT `FK_inv_hwioport_cat_hwioportpurpose` FOREIGN KEY (`cat_hwioportpurpose`) REFERENCES `cat_hwioportpurpose` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_hwioport_cat_signalmode` FOREIGN KEY (`cat_signalmode_id`) REFERENCES `cat_signalmode` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_hwioport_inv_devicenode` FOREIGN KEY (`inv_devicenode`) REFERENCES `inv_devicenode` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_hwioport_inv_signaltag` FOREIGN KEY (`inv_signaltag_id`) REFERENCES `inv_signaltag` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22732 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='This trigger will validate the connection to port id column to verify that if object A references object B, then B must reference A as well.';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_hwioport_AFTER_INSERT` AFTER INSERT
    ON vega8_all.inv_hwioport FOR EACH ROW
BEGIN
    DECLARE vTagGroupIdOfDevice int(10);
    DECLARE vErrMsg VARCHAR(250);
    
    
    IF (NEW.inv_signaltag_id is not null) then 
    
		SELECT inv_taggroup_id into vTagGroupIdOfDevice 
		FROM inv_devicenode dn 
		inner join inv_hwioport iop 
		on iop.inv_devicenode = dn.id
		where iop.id = NEW.id;
        
        
        IF ( vTagGroupIdOfDevice IS NULL ) THEN
              SET vErrMsg = CONCAT('No taggroup assigned to device node of ioport id=', NEW.id);
		      signal sqlstate '45000' set message_text = vErrMsg;
	    END IF; 
   
       
       INSERT INTO asn_taggroupsignaltag (inv_taggroup_id, inv_signaltag_id) VALUES (vTagGroupIdOfDevice, NEW.inv_signaltag_id )
		   ON DUPLICATE KEY UPDATE inv_taggroup_id=vTagGroupIdOfDevice, inv_signaltag_id=NEW.inv_signaltag_id;
           
       
       UPDATE inv_signaltag SET id=id WHERE id=NEW.inv_signaltag_id;
    end if; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_hwioport_AFTER_UPDATE` AFTER UPDATE ON `inv_hwioport` FOR EACH ROW
BEGIN
  DECLARE vTagGroupIdOfDevice int(10);
    
    IF (NEW.inv_signaltag_id is not null) then 
    
		if (NEW.inv_signaltag_id != OLD.inv_signaltag_id and OLD.inv_signaltag_id is not null) then 
			DELETE FROM asn_taggroupsignaltag where inv_signaltag_id = OLD.inv_signaltag_id; 
        end if; 
        
        if (NEW.inv_signaltag_id != OLD.inv_signaltag_id) then 
			SELECT inv_taggroup_id INTO vTagGroupIdOfDevice FROM inv_devicenode dev WHERE dev.id = NEW.inv_devicenode;
			
		
		   INSERT INTO asn_taggroupsignaltag (inv_taggroup_id, inv_signaltag_id) VALUES (vTagGroupIdOfDevice, NEW.inv_signaltag_id )
		   ON DUPLICATE KEY UPDATE inv_taggroup_id=vTagGroupIdOfDevice, inv_signaltag_id=NEW.inv_signaltag_id;
        end if;
        
	   
       UPDATE inv_signaltag SET id=id WHERE id=NEW.inv_signaltag_id;
    
    ELSE
       
       UPDATE inv_signaltag SET id=id WHERE id=OLD.inv_signaltag_id;
    END IF; 
    
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inv_layout`
--

DROP TABLE IF EXISTS `inv_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_layout` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Layoutname` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `LayoutBinary` blob,
  `LayoutOf` int(10) DEFAULT NULL,
  `SystemLayout` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `FilterString` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `AllowFilterPanel` tinyint(1) DEFAULT NULL COMMENT 'DevExpress uses .NET Boolean type for MySQL tinyint(1) type',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_measurement`
--

DROP TABLE IF EXISTS `inv_measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_measurement` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `StartDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DataTableName` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `cat_tabletype_id` int(10) NOT NULL,
  `inv_SignalTag_Id` int(10) DEFAULT NULL,
  `inv_devicenode_id` int(10) DEFAULT NULL,
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_inv_measurement` (`StartDateTime`,`DataTableName`,`cat_tabletype_id`),
  KEY `FK_asn_MeasuredDataFilter_inv_Measurement` (`cat_tabletype_id`),
  KEY `FK_asn_SignalMeasurements_inv_SignalTag` (`inv_SignalTag_Id`),
  KEY `FK_inv_devicenode_inv_measurement_idx` (`inv_devicenode_id`),
  CONSTRAINT `FK_cat_tabletype_inv_Measurement` FOREIGN KEY (`cat_tabletype_id`) REFERENCES `cat_tabletype` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_devicenode_inv_measurement` FOREIGN KEY (`inv_devicenode_id`) REFERENCES `inv_devicenode` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_signaltag_inv_measurement` FOREIGN KEY (`inv_SignalTag_Id`) REFERENCES `inv_signaltag` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Tables may be grouped by device nodes for efficient writing to devices.\nIt enables us to collect all signal changes for one devices and bulk write them to the hardware / usercontrol / script. \n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_processingblock`
--

DROP TABLE IF EXISTS `inv_processingblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_processingblock` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `ExecutionOrder` int(10) NOT NULL DEFAULT '1',
  `ExecutionIntervallms` int(10) NOT NULL DEFAULT '100',
  `cat_ProcessingBlock_Id` int(10) NOT NULL,
  `InActive` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'DevExpress uses .NET Boolean type for MySQL tinyint(1) type',
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IXFK_cat_ProcessingBlock_Id` (`cat_ProcessingBlock_Id`),
  CONSTRAINT `FK_cat_ProcessingBlock_inv_processingblock` FOREIGN KEY (`cat_ProcessingBlock_Id`) REFERENCES `cat_processingblock` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_runtimelog`
--

DROP TABLE IF EXISTS `inv_runtimelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_runtimelog` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `RunTimeHours` double NOT NULL,
  `LastUpdated` datetime NOT NULL,
  `inv_devicenode_Id` int(10) NOT NULL,
  `inv_endurancetest_Id` int(10) NOT NULL,
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IXFK_inv_endurancetest_Id` (`inv_endurancetest_Id`),
  KEY `IXFK_inv_ItemUnderTest_Id` (`inv_devicenode_Id`),
  CONSTRAINT `FK_inv_endurancetest_inv_runtimelog` FOREIGN KEY (`inv_endurancetest_Id`) REFERENCES `inv_endurancetest` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_inv_itemundertest_inv_runtimelog` FOREIGN KEY (`inv_devicenode_Id`) REFERENCES `inv_devicenode` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_script`
--

DROP TABLE IF EXISTS `inv_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_script` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inv_testfacility_id` int(10) NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `cat_script_id` int(10) DEFAULT NULL,
  `name` varchar(500) CHARACTER SET latin1 NOT NULL,
  `guid` varchar(255) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'a unique identifier we can we use in the application to track the script before the object got an id.',
  PRIMARY KEY (`id`),
  KEY `FK_inv_script_inv_tesfacility_idx` (`inv_testfacility_id`),
  KEY `FK_inv_script_cat_script_idx` (`cat_script_id`),
  CONSTRAINT `FK_inv_script_cat_script` FOREIGN KEY (`cat_script_id`) REFERENCES `cat_script` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_script_inv_tesfacility` FOREIGN KEY (`inv_testfacility_id`) REFERENCES `inv_testfacility` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1466 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_scriptioport`
--

DROP TABLE IF EXISTS `inv_scriptioport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_scriptioport` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `cat_signalmode_id` int(10) NOT NULL DEFAULT '1' COMMENT 'This defines how a signal is handled. Note that this is from device view. \n1 readonly, 2 writeonly, 3 read/write',
  `cat_hwioportpurpose` int(10) NOT NULL DEFAULT '1' COMMENT 'voltage, current measuring, etc.',
  `inv_script_id` int(10) NOT NULL,
  `deprecated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_inv_scriptioport_cat_signalmode_idx` (`cat_signalmode_id`),
  KEY `FK_inv_scriptioport_inv_draganddropcontrol_idx` (`inv_script_id`),
  KEY `FK_inv_scriptioport_cat_hwioportpurpose_idx` (`cat_hwioportpurpose`),
  CONSTRAINT `FK_inv_scriptioport_cat_hwioportpurpose` FOREIGN KEY (`cat_hwioportpurpose`) REFERENCES `cat_hwioportpurpose` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_scriptioport_cat_signalmode` FOREIGN KEY (`cat_signalmode_id`) REFERENCES `cat_signalmode` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_scriptioport_inv_signaltag_id` FOREIGN KEY (`inv_script_id`) REFERENCES `inv_script` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2428 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='This trigger will validate the connection to port id column to verify that if object A references object B, then B must reference A as well.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_signaltag`
--

DROP TABLE IF EXISTS `inv_signaltag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_signaltag` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(1500) COLLATE latin1_general_ci NOT NULL COMMENT 'This column is non unique because the name is too long to be unique. This is what the UqNameHash column is for.',
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `RangeLL` double NOT NULL DEFAULT '0',
  `RangeHL` double NOT NULL DEFAULT '0',
  `Path` varchar(20000) COLLATE latin1_general_ci DEFAULT '',
  `UqPathHash` char(32) CHARACTER SET latin1 NOT NULL DEFAULT '' COMMENT 'is nullable because the value will be set by trigger and Xpo does check the value before commit.',
  `cat_SIUnitPrefix_Symbol` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL DEFAULT '1',
  `cat_SIUnit_Symbol` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL DEFAULT '1',
  `cat_DataType_Id` int(10) NOT NULL,
  `cat_signalmode_Id` int(10) NOT NULL DEFAULT '1' COMMENT 'This defines how a signal is handled. Note that this is from device view. \n1 readonly, 2 writeonly, 3 read/write',
  `cat_hwioportpurpose_Id` int(10) NOT NULL DEFAULT '1',
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UqPathHash_UNIQUE` (`UqPathHash`),
  KEY `FK_cat_datatypes_inv_SignalTag_idx` (`cat_DataType_Id`),
  KEY `FK_cat_signalmode_inv_SignalTag_idx` (`cat_signalmode_Id`),
  KEY `FK_inv_SignalTag_asn_SIUnit` (`cat_SIUnit_Symbol`),
  KEY `FK_inv_SignalTag_asn_SIUnitPrefix` (`cat_SIUnitPrefix_Symbol`),
  KEY `Fk_inv_SignalTag_cat_hwioportpurpose_idx` (`cat_hwioportpurpose_Id`),
  CONSTRAINT `FK_inv_SignalTag_asn_SIUnit` FOREIGN KEY (`cat_SIUnit_Symbol`) REFERENCES `cat_siunit` (`Symbol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_inv_SignalTag_asn_SIUnitPrefix` FOREIGN KEY (`cat_SIUnitPrefix_Symbol`) REFERENCES `cat_siunitprefix` (`Symbol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_inv_SignalTag_cat_datatypes_id` FOREIGN KEY (`cat_DataType_Id`) REFERENCES `cat_datatypes` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_SignalTag_cat_signalmode` FOREIGN KEY (`cat_signalmode_Id`) REFERENCES `cat_signalmode` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Fk_inv_SignalTag_cat_hwioportpurpose` FOREIGN KEY (`cat_hwioportpurpose_Id`) REFERENCES `cat_hwioportpurpose` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30598 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_signaltag_BEFORE_INSERT` BEFORE INSERT ON `inv_signaltag` FOR EACH ROW
BEGIN
  DECLARE vNewPath varchar(2000);
 
 
 
 
 SELECT CONCAT(node.path, '/', hwport.name, '/', tag.name) INTO vNewPath FROM vega8_all.inv_hwioport hwport 
 JOIN inv_devicenode node on node.id = hwport.inv_devicenode 
 JOIN inv_signaltag tag on tag.id = hwport.inv_signaltag_id
 WHERE inv_signaltag_id = NEW.id;

 
 IF (vNewPath IS NULL ) THEN
   SET vNewPath = CONCAT( '/', New.name);
 END IF;
 

 SET NEW.Path = vNewPath;
 SET NEW.UqPathHash = MD5(vNewPath); 
 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_signaltag_BEFORE_UPDATE` BEFORE UPDATE ON `inv_signaltag` FOR EACH ROW
BEGIN
 DECLARE vNewPath varchar(4000);
 
 
 
 
 SELECT CONCAT(node.path, '/', hwport.name, '/', tag.name) INTO vNewPath FROM vega8_all.inv_hwioport hwport 
 JOIN inv_devicenode node on node.id = hwport.inv_devicenode 
 JOIN inv_signaltag tag on tag.id = hwport.inv_signaltag_id
 WHERE inv_signaltag_id = NEW.id;

 
 IF (vNewPath IS NULL ) THEN
   SET vNewPath = CONCAT( '/', New.name);
 END IF;
 

 SET NEW.Path = vNewPath;
 SET NEW.UqPathHash = MD5(vNewPath); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inv_stubendposition`
--

DROP TABLE IF EXISTS `inv_stubendposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_stubendposition` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `PositionAngle` double NOT NULL,
  `InflowAngle` double NOT NULL DEFAULT '0' COMMENT 'angle of inflow or incoming exhaust flow, which depends on angle of stub end relative to tube service (usually 90°)',
  `cat_ScrewThread_Id` int(10) NOT NULL COMMENT 'cat_screwthread table does not exist anymore, it is integrated in inv_commonentityatributevalue therefore cat_screwthread_id is not a foreign key',
  `asn_ExhaustPipeRow_Id` int(10) NOT NULL,
  `asn_ExhaustPipeRow_RowPosition` int(10) DEFAULT NULL COMMENT 'composite FK set by Trigger',
  `inv_exhaustpipe_Id` int(10) DEFAULT NULL COMMENT 'composite FK set by Trigger',
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Id_RowPosition_PositionAngle` (`inv_exhaustpipe_Id`,`asn_ExhaustPipeRow_RowPosition`,`PositionAngle`),
  KEY `IX_StubEndScrewThread` (`cat_ScrewThread_Id`),
  KEY `IXFK_inv_stubendposition_asn_exhaustpiperow_Id` (`asn_ExhaustPipeRow_Id`),
  KEY `IXFK_inv_stubendposition_asn_exhaustpiperow_IdPos` (`asn_ExhaustPipeRow_RowPosition`,`inv_exhaustpipe_Id`),
  KEY `FK_inv_stubendposition_asn_exhaustpiperow_IdDiameter_idx` (`inv_exhaustpipe_Id`),
  CONSTRAINT `FK_inv_stubendposition_asn_exhaustpiperow_Id` FOREIGN KEY (`asn_ExhaustPipeRow_Id`) REFERENCES `asn_exhaustpiperow` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_stubendposition_asn_exhaustpiperow_IdPos` FOREIGN KEY (`asn_ExhaustPipeRow_RowPosition`, `inv_exhaustpipe_Id`) REFERENCES `asn_exhaustpiperow` (`RowPosition`, `inv_ExhaustPipe_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4982 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_stubendposition_BEFORE_INSERT` BEFORE INSERT ON `inv_stubendposition` FOR EACH ROW
BEGIN
DECLARE exrow int;

DECLARE  expipe int;


SELECT 

    RowPosition, inv_exhaustpipe_Id

INTO exrow , expipe FROM

    asn_exhaustpiperow asn

WHERE

    id = NEW.asn_exhaustpiperow_Id;   


 SET new.asn_exhaustpiperow_Rowposition = exrow;   

 SET new.inv_exhaustpipe_Id = expipe;   

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_stubendposition_BEFORE_UPDATE` BEFORE UPDATE ON `inv_stubendposition` FOR EACH ROW
BEGIN
DECLARE exrow int;

DECLARE  expipe int;


SELECT 

    RowPosition, inv_exhaustpipe_Id

INTO exrow , expipe FROM

    asn_exhaustpiperow asn

WHERE

    id = NEW.asn_exhaustpiperow_Id;   


 SET new.asn_exhaustpiperow_Rowposition = exrow;   

 SET new.inv_exhaustpipe_Id = expipe;   

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inv_taggroup`
--

DROP TABLE IF EXISTS `inv_taggroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_taggroup` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `CommonTime` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'DevExpress uses .NET Boolean type for MySQL tinyint(1) type',
  `Path` varchar(20000) CHARACTER SET latin1 DEFAULT '' COMMENT 'path is unique but accomplished via hashed column UqPathHash, refer to trigger statements',
  `UqPathHash` char(32) COLLATE latin1_general_ci NOT NULL DEFAULT '''''',
  `inv_TagGroupParent_Id` int(10) DEFAULT NULL COMMENT 'enables building of hierarchical tag groups',
  `cat_taggrouptype_id` int(10) NOT NULL,
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UqPathHash_UNIQUE` (`UqPathHash`),
  KEY `FK_inv_taggroup_cat_taggrouptype_id_idx` (`cat_taggrouptype_id`),
  KEY `FK_inv_taggroup_inv_taggroupparent_id_idx` (`inv_TagGroupParent_Id`),
  CONSTRAINT `FK_inv_taggroup_cat_taggrouptype_id` FOREIGN KEY (`cat_taggrouptype_id`) REFERENCES `cat_taggrouptype` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_inv_taggroup_inv_taggroupparent_id` FOREIGN KEY (`inv_TagGroupParent_Id`) REFERENCES `inv_taggroup` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2611 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='a tag group contains 0..n signals';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_taggroup_BEFORE_INSERT` BEFORE INSERT ON `inv_taggroup` FOR EACH ROW
BEGIN

 DECLARE vNewPath varchar(20000); 
 
  
  
 SELECT path INTO vNewPath from inv_devicenode where inv_taggroup_id = NEW.id;
 
 if (vNewPath is null) then
	 IF (NEW.inv_TagGroupParent_Id IS NOT NULL) THEN
		SELECT CONCAT( `path`, '/', NEW.name ) INTO vNewPath FROM inv_taggroup WHERE id = NEW.inv_TagGroupParent_Id;
	 ELSE 
		 
		SET vNewPath =  CONCAT( '/', NEW.name); 
	 END IF; 
 else
	set vNewPath = CONCAT(vNewPath, '/', NEW.name); 
 end if;


 SET NEW.Path = vNewPath;  
 SET NEW.UqPathHash = MD5(vNewPath); 
 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`vega`@`%`*/ /*!50003 TRIGGER `vega8_all`.`inv_taggroup_BEFORE_UPDATE` BEFORE UPDATE ON `inv_taggroup` FOR EACH ROW
BEGIN
DECLARE vNewPath varchar(20000); 
 
 
  SELECT CONCAT( path, '/', NEW.name) INTO vNewPath FROM  
  inv_devicenode WHERE inv_taggroup_id = NEW.id;
  
  
  IF (vNewPath IS NULL) THEN	
	IF (NEW.inv_TagGroupParent_Id IS NOT NULL) THEN
		SELECT CONCAT( `path`, '/', NEW.name ) INTO vNewPath FROM inv_taggroup WHERE id = NEW.inv_TagGroupParent_Id;
	ELSE 
		SET vNewPath =  CONCAT( '/', NEW.name); 
	END IF; 
  END IF;
  

  SET NEW.Path = vNewPath;  
  SET NEW.UqPathHash = MD5(vNewPath); 
  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inv_testfacility`
--

DROP TABLE IF EXISTS `inv_testfacility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_testfacility` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `cat_ComponentCondition_Id` int(10) NOT NULL DEFAULT '1',
  `Workstation` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `ScriptDebugging` tinyint(1) NOT NULL DEFAULT '0',
  `EngineStatusTag` int(10) DEFAULT NULL COMMENT 'Defines the engine state of the testfacility. \nWe''ll safe on ( 1 ) or off ( 0 ) in there. ',
  `ApprovalTag` int(10) DEFAULT NULL COMMENT 'Defines that the testfacility can be used for tests and is ready for measurements.',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `Fk_cat_ComponentCondition_inv_testfacility_Idx` (`cat_ComponentCondition_Id`),
  KEY `FK_inv_signaltag_inv_testfacility_approval` (`ApprovalTag`),
  KEY `FK_inv_signaltag_inv_testfacility_engine_idx` (`EngineStatusTag`),
  CONSTRAINT `FK_inv_signaltag_inv_testfacility_aproval` FOREIGN KEY (`ApprovalTag`) REFERENCES `inv_signaltag` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_inv_signaltag_inv_testfacility_engine` FOREIGN KEY (`EngineStatusTag`) REFERENCES `inv_signaltag` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_cat_ComponentCondition_inv_testfacility` FOREIGN KEY (`cat_ComponentCondition_Id`) REFERENCES `cat_componentcondition` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_todolist`
--

DROP TABLE IF EXISTS `inv_todolist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_todolist` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inv_usersettings`
--

DROP TABLE IF EXISTS `inv_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inv_usersettings` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) CHARACTER SET latin1 NOT NULL COMMENT 'Logon name can be up oto 104 chars long and this is what we use here.',
  `language` varchar(45) COLLATE latin1_general_ci NOT NULL DEFAULT 'en-US',
  `mainapplayout` longtext COLLATE latin1_general_ci COMMENT 'Contains the serialized layout.\n',
  `mainappplugins` longtext COLLATE latin1_general_ci,
  `mainappwindow` longtext COLLATE latin1_general_ci COMMENT 'Saves where the main app window was located.',
  `supervisorysettings` longtext COLLATE latin1_general_ci COMMENT 'Contains settings for the supervisory plugin.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='This table contains various usersettings.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unb_idgeneration`
--

DROP TABLE IF EXISTS `unb_idgeneration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unb_idgeneration` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='This unb(ound) table helps us to generate ids on the database. \nYou can draw a new id by running the corresponding stored procedure.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unb_sequence_data`
--

DROP TABLE IF EXISTS `unb_sequence_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unb_sequence_data` (
  `sequence_name` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `sequence_increment` int(11) unsigned NOT NULL DEFAULT '1',
  `sequence_min_value` int(11) unsigned NOT NULL DEFAULT '1',
  `sequence_max_value` bigint(20) unsigned NOT NULL DEFAULT '18446744073709551615',
  `sequence_cur_value` bigint(20) unsigned DEFAULT '1',
  `sequence_cycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'DevExpress uses .NET Boolean type for MySQL tinyint(1) type',
  PRIMARY KEY (`sequence_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unb_stubendposition`
--

DROP TABLE IF EXISTS `unb_stubendposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unb_stubendposition` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(500) COLLATE latin1_general_ci NOT NULL,
  `Description` varchar(2500) COLLATE latin1_general_ci DEFAULT '',
  `PositionAngle` double NOT NULL,
  `StubEndAngle` double NOT NULL,
  `cat_ScrewThread_Id` int(10) NOT NULL COMMENT 'cat_screwthread table does not exist anymore, it is integrated in inv_commonentityatributevalue therefore cat_screwthread_id is not a foreign key',
  `Deprecated` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`,`PositionAngle`,`StubEndAngle`),
  KEY `IXFK_cat_ScrewThread_Id` (`cat_ScrewThread_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `v_currenttables`
--

DROP TABLE IF EXISTS `v_currenttables`;
/*!50001 DROP VIEW IF EXISTS `v_currenttables`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_currenttables` AS SELECT 
 1 AS `startdatetime`,
 1 AS `DataTableName`,
 1 AS `cat_tabletype_id`,
 1 AS `inv_signaltag_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_latestvalues`
--

DROP TABLE IF EXISTS `v_latestvalues`;
/*!50001 DROP VIEW IF EXISTS `v_latestvalues`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_latestvalues` AS SELECT 
 1 AS `startdatetime`,
 1 AS `DataTableName`,
 1 AS `cat_tabletype_id`,
 1 AS `inv_signaltag_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_testfacility_overview`
--

DROP TABLE IF EXISTS `v_testfacility_overview`;
/*!50001 DROP VIEW IF EXISTS `v_testfacility_overview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_testfacility_overview` AS SELECT 
 1 AS `inv_Testfacility_Id`,
 1 AS `cat_ScrewThread_Id`,
 1 AS `ScrewThread_Count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_testfacility_stubendpositions`
--

DROP TABLE IF EXISTS `v_testfacility_stubendpositions`;
/*!50001 DROP VIEW IF EXISTS `v_testfacility_stubendpositions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_testfacility_stubendpositions` AS SELECT 
 1 AS `Id`,
 1 AS `PositionAngle`,
 1 AS `StubEndAngle`,
 1 AS `cat_ScrewThread_Id`,
 1 AS `asn_ExhaustPipeRow_Id`,
 1 AS `asn_ExhaustPipeRow_RowPosition`,
 1 AS `inv_exhaustpipe_Id`,
 1 AS `Deprecated`,
 1 AS `inv_ExhqaustPipe_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `xpobjecttype`
--

DROP TABLE IF EXISTS `xpobjecttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xpobjecttype` (
  `OID` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(254) COLLATE latin1_general_ci DEFAULT NULL,
  `AssemblyName` varchar(254) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`OID`),
  UNIQUE KEY `iTypeName_XPObjectType` (`TypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'vega8_all'
--

--
-- Dumping routines for database 'vega8_all'
--
/*!50003 DROP FUNCTION IF EXISTS `FileTimeUtc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,NO_AUTO_VALUE_ON_ZERO,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` FUNCTION `FileTimeUtc`(utcTime DateTime(6)) RETURNS bigint(64)
    DETERMINISTIC
BEGIN
  
  
  
  
  
  

  
  
  
  RETURN (unix_timestamp(utcTime) + 11644473600) * 1.0E7;
  
  
  
  
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TicksToDateTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` FUNCTION `TicksToDateTime`(ticks BIGINT) RETURNS datetime
    DETERMINISTIC
RETURN CAST(DATE_ADD('2001-01-01 00:00:00', 
   INTERVAL (ticks - 631139040000000000)/10 MICROSECOND) AS DATETIME) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckIfConnModelOfConfigSetMatchEntity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `CheckIfConnModelOfConfigSetMatchEntity`(IN configSet_Id INT(10), IN entity_Id INT(10))
    SQL SECURITY INVOKER
BEGIN

    
SELECT 
    c2.id
FROM
    cat_connectionmodel c1
        JOIN
    cat_connectionmodel c2 
         ON COALESCE(c1.Physical_Id,     c2.Physical_Id, 1)     = COALESCE(c2.Physical_Id,     c1.Physical_Id,  1)
        AND COALESCE(c1.DataLink_Id,     c2.DataLink_Id, 1)     = COALESCE(c2.DataLink_Id,     c1.DataLink_Id, 1)
        AND COALESCE(c1.Network_Id,      c2.Network_Id, 1)      = COALESCE(c2.Network_Id,      c1.Network_Id, 1)
        AND COALESCE(c1.Transport_Id,    c2.Transport_Id, 1)    = COALESCE(c2.Transport_Id,    c1.Transport_Id, 1)
        AND COALESCE(c1.Session_Id,      c2.Session_Id, 1)      = COALESCE(c2.Session_Id,      c1.Session_Id, 1)
        AND COALESCE(c1.Presentation_Id, c2.Presentation_Id, 1) = COALESCE(c2.Presentation_Id, c1.Presentation_Id, 1)
        AND COALESCE(c1.Application_Id,  c2.Application_Id, 1)  = COALESCE(c2.Application_Id,  c1.Application_Id, 1)
WHERE
    c1.Id = (SELECT 
            cat_connectionmodel_Id
        FROM
            inv_configoptionset
        WHERE
            id = configSet_Id)
            
AND c2.id = (
		SELECT cat_connectionmodel_Id FROM inv_commonentity 
		WHERE id= entity_Id
		);
            

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CleanupMeasurementData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `CleanupMeasurementData`(in pDbMeasSchema varchar(255))
    SQL SECURITY INVOKER
BEGIN
	DECLARE vFinished INT DEFAULT 0;
	DECLARE vResultRow VARCHAR(255) DEFAULT "";


	DECLARE cur1 CURSOR FOR    
		select `table_name` from information_schema.tables 
		where table_schema = pDbMeasSchema;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET vFinished = 1;
	
		
        
	OPEN cur1;    

	   
	WHILE vFinished = 0 DO    

		FETCH cur1 INTO vResultRow;    
		
		IF vFinished = 0 THEN
		
            START TRANSACTION;
        
			SET @DeleteSql = concat ('DROP TABLE `', pDbMeasSchema, '`.`', vResultRow, '`');
						
			PREPARE stmt1 FROM @DeleteSql;
			EXECUTE stmt1; 
			DEALLOCATE PREPARE stmt1; 
            
            
            
            COMMIT;
		END IF;    
		
	END WHILE;    
    
    CLOSE cur1;       
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateExportTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `CreateExportTable`(in tableName varchar(255), in signalTags varchar(255))
BEGIN
	
    
    declare i int default 0;
      
    set @countCmd = concat('select count(*) from ', signalTags, ' into @numberOfSignalTags');
	PREPARE stmt from @countCmd;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
    
    set @cmd = CONCAT('CREATE TABLE if not exists ',tableName, ' (device_timemark bigint(64)');
    
    set i=0;
    while i<@numberOfSignalTags do
		
		set @dataTableNameCmd = concat('select SignalTagIdHex into @signalTagId from ', signalTags, ' limit ', i , ',1');
        
        
		PREPARE stmt from @dataTableNameCmd;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt; 
        
        
		set @SignalTagIdHex = concat('`' , @signalTagId , '`');                
		set @cmd = concat(@cmd, ', ', @SignalTagIdHex, ' LONGBLOB ');  	
		set i = i+1;
    end while;
	set @cmd = concat(@cmd, ', PRIMARY KEY (`device_timemark`), UNIQUE INDEX `device_timemark_UNIQUE` (`device_timemark` ASC)');        
    set @cmd = concat(@cmd, ' )');
    
	PREPARE stmt from @cmd;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
    
	set @command = concat('ALTER TABLE ', tableName, ' ADD UNIQUE INDEX `UQ_DeviceTime` (`device_timemark` ASC)');        
	PREPARE stmt1 from @command;        
	execute stmt1;       
	DEALLOCATE PREPARE stmt1;             		
    
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EmptyMeasurementData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `EmptyMeasurementData`(in pDbMeasSchema varchar(255) )
    SQL SECURITY INVOKER
BEGIN

	DECLARE vFinished INT DEFAULT 0;
	DECLARE vResultRow VARCHAR(255) DEFAULT "";


	DECLARE cur1 CURSOR FOR    
		select `table_name` from information_schema.tables 
		where table_schema = pDbMeasSchema;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET vFinished = 1;
	
		
        
	OPEN cur1;    
	   
	WHILE vFinished = 0 DO    

		FETCH cur1 INTO vResultRow;    
		
		IF vFinished = 0 THEN
		
            START TRANSACTION;
        
			SET @DeleteSql = concat ('DELETE FROM `', pDbMeasSchema, '`.`', vResultRow, '` WHERE device_timemark > 1');
						
			PREPARE stmt1 FROM @DeleteSql;
			EXECUTE stmt1; 
			DEALLOCATE PREPARE stmt1; 
            
            COMMIT;
		END IF;    
		
	END WHILE;    
    
    CLOSE cur1;       

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ExportSignalTagsToCsv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `ExportSignalTagsToCsv`(in invExportScheduleId int(10), in resultTableName varchar(200), in exportSchema varchar(200))
ExportSignalTagsToCsvProc:BEGIN
	declare n int default 0;
    declare i int default 0;
    declare j int default 0;
    declare k int default 0;
    declare NumberOfJoinsToDo int default 0;
    declare NumberOfSignalTags int default 0;
    declare timeStep bigint default 0;
    declare tableWithHochSampleRate varchar(200) default null;
    declare signalTagWithHochSampleRate varchar(200) default null;
    declare measSchema varchar(200) default 'vega8_meas';   
    declare SignalTagNameHex varchar(200);
    declare tableName varchar(200);
    declare isFistTableFound bool default true;
    declare timeNow datetime default now();
      
    
    drop temporary table if exists vega8_meas.signalsTagsTablesToExport;   
    create temporary table if not exists vega8_meas.signalsTagsTablesToExport(SignalTagIdHex varchar(10),  DataTableName varchar(255), SignalTagName varchar(255) );
	 	
    
	insert into vega8_meas.signalsTagsTablesToExport(SignalTagIdHex, DataTableName, SignalTagName) select concat('0x', LOWER(LPAD(hex(a.inv_signaltag_id), 8,0))), a.DataTableName , (select c.Name from inv_signaltag as c where c.id = b.inv_signaltag_id) from inv_measurement as a join asn_exportschedulesignaltag as b on a.inv_signaltag_id = b.inv_signaltag_id where b.inv_exportschedule_id = invExportScheduleId;
    
    
    update vega8_meas.signalsTagsTablesToExport set SignalTagName = replace(SignalTagName, ' ', '_');
              
    drop temporary table if exists vega8_meas.SignalTags;
    create temporary table if not exists vega8_meas.SignalTags(SignalTagIdHex varchar(255));
    insert into vega8_meas.SignalTags select concat('0x', LOWER(LPAD(hex(inv_signaltag_id), 8,0))) from asn_exportschedulesignaltag where inv_exportschedule_id = invExportScheduleId;
              
	
    
    
    
    
    select StartTime into @timemarkStart from inv_exportschedule where id = invExportScheduleId;
    select LastExportDateTime into @timemark from inv_exportschedule where id = invExportScheduleId;
    if (@timemark is null) then set @timemark = @timemarkStart;
    end if;
	
	
    select count(*) from vega8_meas.SignalTags into NumberOfSignalTags;	
	if NumberOfSignalTags = 0 then Leave ExportSignalTagsToCsvProc;
    end if;
     
    
	drop temporary table if exists vega8_meas.tablesToIterate;   
    create temporary table if not exists vega8_meas.tablesToIterate(DataTableName varchar(255));
    
	
    set i = 0;
	while i < NumberOfSignalTags do 
		select * into SignalTagNameHex from vega8_meas.SignalTags order by SignalTagIdHex asc limit i,1;
        set @fullSignalTagTableName = concat(measSchema ,'.', SignalTagNameHex);		
		set @createViewCommand = concat('create or replace view ', @fullSignalTagTableName, ' as');        
        
        truncate vega8_meas.tablesToIterate;
        insert into vega8_meas.tablesToIterate select DataTableName from vega8_meas.signalsTagsTablesToExport where SignalTagIdHex = SignalTagNameHex;
        
        select count(*) from vega8_meas.tablesToIterate into NumberOfJoinsToDo;
        
        if (NumberOfJoinsToDo = 0) then
			delete from vega8_meas.SignalTags where SignalTagIdHex = SignalTagNameHex;            
            select count(*) into NumberOfSignalTags from vega8_meas.SignalTags;
		else
			set j = 0;
            set isFistTableFound = true;
			While j < NumberOfJoinsToDo do	
				
				select * into @tableToExport from vega8_meas.tablesToIterate limit j,1; 
                set @fullSignalTagTableName = concat(measSchema ,'.', @tableToExport);                                
                set @tableExistCommand = concat ('select count(*) into @tableExist from information_schema.tables where table_schema = "', measSchema, '" and table_name = "', @tableToExport, '"');								                
                PREPARE stmt1 from @tableExistCommand;        
				execute stmt1;       
				DEALLOCATE PREPARE stmt1;  				
                if (@tableExist > 0) then
					if (isFistTableFound) then
						set @createViewCommand = concat(@createViewCommand, ' select * from ' , @fullSignalTagTableName);
                        set isFistTableFound = false;
					else
						set @createViewCommand = concat(@createViewCommand, ' union select * from ' , @fullSignalTagTableName);
					end if;			                    
				end if;				
                set j = j + 1;
			end while;
            set @createViewCommand = concat(@createViewCommand, ' where db_timemark > "', @timemark, '"');		
            set @createViewCommand = concat(@createViewCommand, ' and db_timemark < "', timeNow, '"');
			PREPARE stmt1 from @createViewCommand;        
			execute stmt1;       
			DEALLOCATE PREPARE stmt1;  
            set i = i + 1;
        end if;      		
    end while;	
    
    update inv_exportschedule set LastExportDateTime = timeNow where id = invExportScheduleId;

	
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllRootHwGroupsForTestFacility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `GetAllRootHwGroupsForTestFacility`(IN facilityId INT(10))
    SQL SECURITY INVOKER
BEGIN

	select id from (
		
		
		select hwg.id from inv_hwgroup as hwg
		left outer join inv_devicenode as devn on hwg.id = devn.inv_hwgroup_Id
		union
		select inv_hwgroup_Id  from inv_devicenode as devn
		right outer join inv_hwgroup as hwg on hwg.id = devn.inv_hwgroup_Id
	) as all_root_hwgroups
	
	where  id in 
	(
		select inv_hwgroup_id from asn_groupchanneldriver
		where inv_commchannel_id in 
		( 
			select id from inv_commchannel 
			where inv_testfacility_Id = facilityId
		) 
	);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLatestValue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,NO_AUTO_VALUE_ON_ZERO,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `GetLatestValue`(
						 in pSignalTag_Id INT(10),
                         in pTableType_Id INT(10),
                         out pTime bigint(64),
						 out pValue LongBlob
				      )
    SQL SECURITY INVOKER
BEGIN


DECLARE vCurrentTableName NVARCHAR(500);
DECLARE vMeasSchema NVARCHAR(500) DEFAULT  '`vega8_meas`';
DECLARE vAdminSchema NVARCHAR(500) DEFAULT  '`vega8_all`';
DECLARE vStartTime BigInt(64) DEFAULT 10000;


 if isnull(pSignalTag_Id)  then 
 	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Signal tag id is invalid';
 end if;

   SELECT FileTimeUtc(NOW()) INTO vStartTime;
  

	
   SELECT  FileTimeUtc(startdatetime), datatablename into vStartTime, vCurrentTableName
    FROM v_currenttables 
	WHERE cat_tabletype_id = pTableType_Id 
        AND inv_signaltag_id = pSignalTag_Id;

   SET @sTime = pTime;
   SET @sValue = pValue;
 
   

	IF vCurrentTableName IS NOT NULL THEN
        
         SET @sTime = 0;
         SET @sValue = 0;
         SET @vTimestamp = 0; 
		 SET @vRowCount = 0; 
         
         
         SET @stmtCreate = CONCAT('SELECT MAX(device_timemark), count(device_timemark) INTO @vTimestamp, @vRowCount FROM ',
								   vCurrentTableName);
         
         
		 PREPARE meCreateTable FROM @stmtCreate;
	     EXECUTE meCreateTable;
		 DEALLOCATE PREPARE meCreateTable;
         
         IF 0 = @vRowCount THEN 
			 SET pTime = 0;
			 SET pValue = 0;
         ELSE
				
			 
			 SET @stmtCreate = CONCAT('SELECT device_timemark, measurementvalue INTO @sTime, @sValue FROM ', vCurrentTableName, 
									  ' WHERE device_timemark = ',@vTimestamp );
                                      
			
			 PREPARE meCreateTable FROM @stmtCreate;
			 
			 EXECUTE meCreateTable; 
			 
			 SET pTime = @sTime;
			 SET pValue = @sValue;
			 
			 DEALLOCATE PREPARE meCreateTable;
		END IF; 
	ELSE 
		 SET pTime = 0;
		 SET pValue = 0;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMVTablename` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `GetMVTablename`(
						 in pSignalTag_Id INT(10),
                         in pDeviceNode_Id INT(10), 
						 in pTypeId int(10), 
						 in pRecreateflag int(10),  
                         in pMaxRowsInMeasTable int(10),
						 out poTablename varchar(2505)
				      )
    SQL SECURITY INVOKER
BEGIN


START TRANSACTION;


if isnull(pSignalTag_Id)  then 
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Signal tag id is invalid';
end if;


if isnull(pDeviceNode_Id) then 
   SET pDeviceNode_Id = -1;
end if;


SET @tableNameId='';
if pDeviceNode_Id > 0 then
    set @tableNameId = LOWER(HEX(pDeviceNode_Id));
else 
    set @tableNameId = LOWER(HEX(pSignalTag_Id));
end if; 


SET @cTableSpacer = '_'; 
SET @cTablePrefix = concat('zz', @cTableSpacer, LPAD(hex(pTypeId), 2,0));
SELECT LOWER(HEX(UNIX_TIMESTAMP())) INTO @vTimeStamp;
SET @vCreateTableName = concat(@cTablePrefix, @cTableSpacer, @tableNameId, @cTableSpacer, @vTimeStamp);  

select REPLACE(REPLACE(REPLACE(createstatement, '{0}', `schema`), '{1}', @vCreateTableName)
	, '{3}', (select  `mysql` from vega8_all.cat_datatypes where id = `cat_datatypes_id`)), `schema`
from vega8_all.cat_tabletype
where id = pTypeId
into @vCreateTableStatement, @vMeasSchema;
SET poTablename = @vInsertTableIntoInvMeas;



SET @vInsertTableIntoInvMeas =''; 
if pDeviceNode_Id < 0 then 
	
    SET @vInsertTableIntoInvMeas = concat('INSERT INTO `vega8_all`.`inv_measurement` 
	( `DataTableName`,`cat_tabletype_id`, `inv_SignalTag_Id` )
		VALUES( ''', @vCreateTableName, ''',',pTypeId, ',',pSignalTag_Id, ')');
else
	
	SET @vInsertTableIntoInvMeas = concat('INSERT INTO `vega8_all`.`inv_measurement` 
	( `DataTableName`,`cat_tabletype_id`, `inv_devicenode_id` )
		VALUES( ''', @vCreateTableName, ''',',pTypeId, ',', pDeviceNode_Id, ')');
end if;


PREPARE createTable FROM @vCreateTableStatement;
PREPARE insertNewTableInInvMeas FROM @vInsertTableIntoInvMeas;

set @vTableCount =''; 
set @vCurrentTableName='';

SELECT 
	COUNT(id), DataTableName INTO @vTableCount , @vCurrentTableName
FROM
	`inv_measurement`
WHERE
	cat_tabletype_id = pTypeId
    and (inv_SignalTag_Id = pSignalTag_Id
    OR inv_devicenode_id = pDeviceNode_Id)
    GROUP BY id
ORDER BY StartDateTime DESC
LIMIT 1 ;


if pRecreateflag > 0 or @vTableCount = 0 then 

	EXECUTE insertNewTableInInvMeas;
	EXECUTE createTable;
	SET poTablename = @vCreateTableName;
else 
	
	set poTablename = @vCurrentTableName;
    
    
	SELECT  COUNT(*)
	INTO @vTableCount FROM
		information_schema.tables
	WHERE
		table_name = poTablename;
			
		
		if @vTableCount < 1 then
			EXECUTE insertNewTableInInvMeas;
            EXECUTE createTable;
			SET poTablename = @vCreateTableName;
		else 
			
			SET @vCheckRows = concat('Select count(*) into @vRowCount from ',  @vMeasSchema, '.', poTablename, ';');

            PREPARE checkRowCount FROM @vCheckRows;
			EXECUTE checkRowCount;
			DEALLOCATE PREPARE checkRowCount;
		
			
            if @vRowCount >= pMaxRowsInMeasTable then 
				
                EXECUTE insertNewTableInInvMeas;
                EXECUTE createTable;
                SET poTablename = @vCreateTableName;
            end if; 
		end if;	
end if; 


DEALLOCATE PREPARE createTable;
DEALLOCATE PREPARE insertNewTableInInvMeas;

COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMVTablename2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,NO_AUTO_VALUE_ON_ZERO,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `GetMVTablename2`(
						 in pSignalTag_Id INT(10),
                         in pDeviceNode_Id INT(10), 
						 in pTypeId int(10), 
						 in pRecreateflag int(10),  
                         in pMaxRowsInMeasTable int(10),
						 out poTablename varchar(2505)
				      )
    SQL SECURITY INVOKER
LBL_PRC: BEGIN

DECLARE tableNameId VARCHAR(100);
DECLARE cTableSpacer VARCHAR(100);
DECLARE cTablePrefix VARCHAR(100);

DECLARE vTableCount INT;
DECLARE vRowCount INT;



DECLARE vCreateTable VARCHAR(5000);
DECLARE vCreateTableName NVARCHAR(500);
DECLARE vCreateTableStatement VARCHAR(5000);
DECLARE vCreatestatement VARCHAR(5000);

DECLARE vTimeStamp VARCHAR(100);



DECLARE vCurrentTableName NVARCHAR(500);
DECLARE insertNewTableInInvMeas VARCHAR(5000);
DECLARE vInsertTableIntoInvMeas VARCHAR(5000);
DECLARE vCheckRows VARCHAR(5000);

DECLARE vMeasSchema NVARCHAR(500);
DECLARE vAdminSchema NVARCHAR(500);


 
 
 
 


SET vMeasSchema = '`vega8_meas`';
SET vAdminSchema = '`vega8_all`';



 if isnull(pSignalTag_Id)  then 
 	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Signal tag id is invalid';
 end if;


if isnull(pDeviceNode_Id) then 
   SET pDeviceNode_Id = -1;
end if;



set vTableCount = 0; 
set vCurrentTableName='';




IF pRecreateflag <= 0 THEN


	
   SELECT 
	  
      DataTableName INTO poTablename
	FROM
		`vega8_all`.`inv_measurement`
	WHERE
		cat_tabletype_id = pTypeId
		and (inv_SignalTag_Id = pSignalTag_Id
		OR inv_devicenode_id = pDeviceNode_Id)
		GROUP BY id
	ORDER BY StartDateTime DESC
	LIMIT 1 ;


	IF poTablename IS NOT NULL THEN
        
		SELECT  table_rows INTO vTableCount 
        FROM information_schema.tables
		WHERE
			table_name = poTablename;
			
		IF vTableCount < pMaxRowsInMeasTable THEN
			LEAVE LBL_PRC; 
		END IF;
			
	END IF;

END IF;


SET poTablename = '';





	SET tableNameId='';
    
	IF pDeviceNode_Id > 0 THEN
		set tableNameId = LOWER(HEX(pDeviceNode_Id));
	else 
		set tableNameId = LOWER(HEX(pSignalTag_Id));
	END IF; 

	SET cTableSpacer = '_'; 
    
	SET cTablePrefix = concat('zz', cTableSpacer, LPAD(hex(pTypeId), 2,0));
    
	SELECT LOWER(HEX(UNIX_TIMESTAMP())) INTO vTimeStamp;
    
	SET vCreateTableName = concat(cTablePrefix, cTableSpacer, tableNameId, cTableSpacer, vTimeStamp);


   


    
    

    
    

	SELECT 
      REPLACE(REPLACE( REPLACE(createstatement,'{0}',`schema`), '{1}', vCreateTableName), '{3}', (SELECT `mysql` FROM vega8_all.cat_datatypes
                       WHERE id = `cat_datatypes_id`)), 
                       
	  `schema` INTO vCreateTableStatement , vMeasSchema
	FROM
		vega8_all.cat_tabletype
	WHERE
		id = pTypeId ;
    
    
    
    
    
   
    
	SET vInsertTableIntoInvMeas =''; 
	if pDeviceNode_Id < 0 then 
		
		SET vInsertTableIntoInvMeas = concat('INSERT INTO `vega8_all`.`inv_measurement` ( `DataTableName`,`cat_tabletype_id`, `inv_SignalTag_Id` ) VALUES( ''', 
        vCreateTableName, ''',',pTypeId, ',', pSignalTag_Id, ')');
	else
		
		SET vInsertTableIntoInvMeas = concat('INSERT INTO `vega8_all`.`inv_measurement` ( `DataTableName`,`cat_tabletype_id`, `inv_devicenode_id` )	VALUES( ''', 
        vCreateTableName, ''',',pTypeId, ',', pDeviceNode_Id, ')');
	end if;


     
	
	
   
    
    
	
   
    
START TRANSACTION;
    SET @stmtCreate = vCreateTableStatement;
    SET @stmtInsert = vInsertTableIntoInvMeas;

    
	 PREPARE meCreateTable FROM @stmtCreate;
	 PREPARE meInsertNewTableInInvMeas FROM @stmtInsert;
	 EXECUTE meCreateTable; 
	 EXECUTE meInsertNewTableInInvMeas; 
     DEALLOCATE PREPARE meCreateTable;
     DEALLOCATE PREPARE meInsertNewTableInInvMeas;
    
	SET poTablename = vCreateTableName;

COMMIT;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRuntimeSignaltagsForEnduranceTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `GetRuntimeSignaltagsForEnduranceTest`(IN endurancetestId INT(10))
BEGIN

set session sql_mode = '';

select distinct
	et.id 'test_id'
	, sp.assembledate
    , sp.disassembledate
	, st.id 'signaltag_id'
    , st.name 'signaltag_name'
    , tst.id 'taggroupsignaltag_id'
	
    
from vega8_all.inv_endurancetest et
	inner join vega8_all.asn_stubendposition sp on sp.inv_endurancetest_id = et.id
	inner join vega8_all.inv_devicenode d on d.id = sp.inv_devicenode_id
	inner join vega8_all.inv_taggroup tg on tg.id = d.inv_taggroup_id
	inner join vega8_all.asn_taggroupsignaltag tst on tst.inv_taggroup_id = tg.id
	inner join vega8_all.inv_signaltag st on st.id = tst.inv_signaltag_id
	inner join vega8_all.cat_signalmode sm on sm.id = st.cat_signalmode_id

where
	et.id = endurancetestId
    and st.name = 'Runtime'
	

group by 
	st.id

order by
	st.name, sp.AssembleDate desc;

set sql_mode = 'only_full_group_by';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `NextVal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `NextVal`( in seq_name varchar(255),
							 out cur_val bigint(20))
    SQL SECURITY INVOKER
BEGIN
    
 
    SELECT
        sequence_cur_value INTO cur_val
    FROM
       unb_sequence_data
    WHERE
        sequence_name = seq_name
    ;
 
    IF cur_val IS NOT NULL THEN
        UPDATE
            unb_sequence_data
        SET
            sequence_cur_value = IF (
                (sequence_cur_value + sequence_increment) > sequence_max_value,
                IF (
                    sequence_cycle = TRUE,
                    sequence_min_value,
                    NULL
                ),
                sequence_cur_value + sequence_increment
            )
        WHERE
            sequence_name = seq_name
        ;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReturnAllParentHwGroups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `ReturnAllParentHwGroups`(IN hwGroupId INT(10))
    SQL SECURITY INVOKER
BEGIN

DECLARE parentId int(10);

SELECT 
    HwGroupParent_Id
INTO parentId FROM
    inv_hwgroup
WHERE
    id = hwGroupId;

SELECT 
    `id`
FROM
    inv_hwgroup
WHERE
    id IN (SELECT 
            tree.item_id
        FROM
            (SELECT 
                t.id AS item_id, @pv:=t.HwGroupParent_Id AS parent
            FROM
                (SELECT 
                id, HwGroupParent_Id
            FROM
                inv_hwgroup
            ORDER BY id DESC) t
            JOIN (SELECT @pv:=parentId) tmp
            WHERE
                t.id = @pv) AS tree);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReturnAllParentTagGroups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `ReturnAllParentTagGroups`(IN tagGroupId INT(10))
    SQL SECURITY INVOKER
BEGIN

DECLARE parentId int(10);

SELECT 
    inv_TagGroupParent_Id
INTO parentId FROM
    inv_taggroup
WHERE
    id = tagGroupId;

SELECT 
    `id`
FROM
    inv_taggroup
WHERE
    id IN (SELECT 
            tree.item_id
        FROM
            (SELECT 
                t.id AS item_id, @pv:=t.inv_TagGroupParent_Id AS parent
            FROM
                (SELECT 
                id, inv_TagGroupParent_Id
            FROM
                inv_taggroup
            ORDER BY id DESC) t
            JOIN (SELECT @pv:=parentId) tmp
            WHERE
                t.id = @pv) AS tree);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReturnMatchingConnectionModels` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `ReturnMatchingConnectionModels`(IN connModel_Id INT(10))
    SQL SECURITY INVOKER
BEGIN

IF ( connModel_Id IS NULL ) THEN
  SELECT id FROM cat_connectionmodel;
ELSE

	SELECT 
		c2.id
	FROM
		cat_connectionmodel c1
	JOIN
	    cat_connectionmodel c2 
         ON COALESCE(c1.Physical_Id,     c2.Physical_Id, 1)     = COALESCE(c2.Physical_Id,     c1.Physical_Id,  1)
        AND COALESCE(c1.DataLink_Id,     c2.DataLink_Id, 1)     = COALESCE(c2.DataLink_Id,     c1.DataLink_Id, 1)
        AND COALESCE(c1.Network_Id,      c2.Network_Id, 1)      = COALESCE(c2.Network_Id,      c1.Network_Id, 1)
        AND COALESCE(c1.Transport_Id,    c2.Transport_Id, 1)    = COALESCE(c2.Transport_Id,    c1.Transport_Id, 1)
        AND COALESCE(c1.Session_Id,      c2.Session_Id, 1)      = COALESCE(c2.Session_Id,      c1.Session_Id, 1)
        AND COALESCE(c1.Presentation_Id, c2.Presentation_Id, 1) = COALESCE(c2.Presentation_Id, c1.Presentation_Id, 1)
        AND COALESCE(c1.Application_Id,  c2.Application_Id, 1)  = COALESCE(c2.Application_Id,  c1.Application_Id, 1)
	WHERE
		c1.Id = connModel_Id

	;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReturnMatchingGroupTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `ReturnMatchingGroupTypes`(IN groupType_Id INT(10))
    SQL SECURITY INVOKER
BEGIN

 
IF ( groupType_Id  IS NULL ) THEN

	SELECT 
		id
	FROM
		cat_groupType;
        
ELSE

	SELECT grpType.id	
    FROM
		cat_groupType grpType
	JOIN inv_configoptionset cfgSet 
       ON grpType.inv_configoptionset_id = cfgSet.Id
    WHERE     
        cfgSet.cat_connectionmodel_id IN 
        (
			SELECT 
				c2.id
			FROM cat_connectionmodel c1
			JOIN cat_connectionmodel c2 
				 ON COALESCE(c1.Physical_Id,     c2.Physical_Id, 1)     = COALESCE(c2.Physical_Id,     c1.Physical_Id,  1)
				AND COALESCE(c1.DataLink_Id,     c2.DataLink_Id, 1)     = COALESCE(c2.DataLink_Id,     c1.DataLink_Id, 1)
				AND COALESCE(c1.Network_Id,      c2.Network_Id, 1)      = COALESCE(c2.Network_Id,      c1.Network_Id, 1)
				AND COALESCE(c1.Transport_Id,    c2.Transport_Id, 1)    = COALESCE(c2.Transport_Id,    c1.Transport_Id, 1)
				AND COALESCE(c1.Session_Id,      c2.Session_Id, 1)      = COALESCE(c2.Session_Id,      c1.Session_Id, 1)
				AND COALESCE(c1.Presentation_Id, c2.Presentation_Id, 1) = COALESCE(c2.Presentation_Id, c1.Presentation_Id, 1)
				AND COALESCE(c1.Application_Id,  c2.Application_Id, 1)  = COALESCE(c2.Application_Id,  c1.Application_Id, 1)
			WHERE
				c1.Id = (	SELECT 
								cfgSet.cat_connectionmodel_id 
							FROM cat_groupType grpType
							JOIN inv_configoptionset cfgSet 
							  ON grpType.inv_configoptionset_id = cfgSet.Id    
							WHERE
								grpType.id = groupType_Id
						)
		) ;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SelectMVTables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vega`@`%` PROCEDURE `SelectMVTables`()
    SQL SECURITY INVOKER
BEGIN
SELECT 
   meas.inv_signaltag_id,meas.DataTableName
FROM
    inv_measurement meas
        INNER JOIN
    (SELECT 
        inv_signaltag_id, MAX(StartDateTime) startDate
    FROM
        inv_measurement
    GROUP BY inv_signaltag_id) sub on sub.startDate = meas.StartDateTime and sub.inv_signaltag_id = meas.inv_signaltag_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `vega8_all`
--

USE `vega8_all`;

--
-- Final view structure for view `endurancetest-to-devices-view`
--

/*!50001 DROP VIEW IF EXISTS `endurancetest-to-devices-view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`vega`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `endurancetest-to-devices-view` AS select distinct `et`.`Id` AS `Test id`,`et`.`Name` AS `Test name`,`d`.`Name` AS `Device name`,`d`.`Path` AS `Path` from ((`inv_endurancetest` `et` join `asn_stubendposition` `sep` on((`sep`.`inv_enduranceTest_Id` = `et`.`Id`))) join `inv_devicenode` `d` on((`d`.`Id` = `sep`.`inv_deviceNode_Id`))) order by `et`.`Id`,`d`.`Path` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_currenttables`
--

/*!50001 DROP VIEW IF EXISTS `v_currenttables`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`vega`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `v_currenttables` AS select `meas`.`StartDateTime` AS `startdatetime`,concat('`vega8_meas`.`',`meas`.`DataTableName`,'`') AS `DataTableName`,`meas`.`cat_tabletype_id` AS `cat_tabletype_id`,`meas`.`inv_SignalTag_Id` AS `inv_signaltag_id` from (`vega8_all`.`inv_measurement` `meas` join (select `vega8_all`.`inv_measurement`.`inv_SignalTag_Id` AS `inv_signaltag_id`,max(`vega8_all`.`inv_measurement`.`StartDateTime`) AS `startDate` from `vega8_all`.`inv_measurement` group by `vega8_all`.`inv_measurement`.`inv_SignalTag_Id`) `sub` on(((`sub`.`startDate` = `meas`.`StartDateTime`) and (`sub`.`inv_signaltag_id` = `meas`.`inv_SignalTag_Id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_latestvalues`
--

/*!50001 DROP VIEW IF EXISTS `v_latestvalues`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`vega`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `v_latestvalues` AS select `meas`.`StartDateTime` AS `startdatetime`,concat('`vega8_meas`.`',`meas`.`DataTableName`,'`') AS `DataTableName`,`meas`.`cat_tabletype_id` AS `cat_tabletype_id`,`meas`.`inv_SignalTag_Id` AS `inv_signaltag_id` from (`vega8_all`.`inv_measurement` `meas` join (select `vega8_all`.`inv_measurement`.`inv_SignalTag_Id` AS `inv_signaltag_id`,max(`vega8_all`.`inv_measurement`.`StartDateTime`) AS `startDate` from `vega8_all`.`inv_measurement` group by `vega8_all`.`inv_measurement`.`inv_SignalTag_Id`) `sub` on(((`sub`.`startDate` = `meas`.`StartDateTime`) and (`sub`.`inv_signaltag_id` = `meas`.`inv_SignalTag_Id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_testfacility_overview`
--

/*!50001 DROP VIEW IF EXISTS `v_testfacility_overview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`vega`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `v_testfacility_overview` AS select `ex`.`inv_TestFacility_Id` AS `inv_Testfacility_Id`,`sep`.`cat_ScrewThread_Id` AS `cat_ScrewThread_Id`,count(`sep`.`cat_ScrewThread_Id`) AS `ScrewThread_Count` from ((`inv_stubendposition` `sep` join `asn_exhaustpiperow` `asn_exrow` on((`asn_exrow`.`Id` = `sep`.`asn_ExhaustPipeRow_Id`))) join `inv_exhaustpipe` `ex` on((`ex`.`Id` = `asn_exrow`.`inv_ExhaustPipe_Id`))) group by `ex`.`inv_TestFacility_Id`,`sep`.`cat_ScrewThread_Id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_testfacility_stubendpositions`
--

/*!50001 DROP VIEW IF EXISTS `v_testfacility_stubendpositions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`vega`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `v_testfacility_stubendpositions` AS select `sp`.`Id` AS `Id`,`sp`.`PositionAngle` AS `PositionAngle`,`sp`.`InflowAngle` AS `StubEndAngle`,`sp`.`cat_ScrewThread_Id` AS `cat_ScrewThread_Id`,`sp`.`asn_ExhaustPipeRow_Id` AS `asn_ExhaustPipeRow_Id`,`sp`.`asn_ExhaustPipeRow_RowPosition` AS `asn_ExhaustPipeRow_RowPosition`,`sp`.`inv_exhaustpipe_Id` AS `inv_exhaustpipe_Id`,`sp`.`Deprecated` AS `Deprecated`,`pipe`.`Id` AS `inv_ExhqaustPipe_ID` from ((`inv_stubendposition` `sp` join `asn_exhaustpiperow` `ex` on((`ex`.`Id` = `sp`.`asn_ExhaustPipeRow_Id`))) join `inv_exhaustpipe` `pipe` on((`pipe`.`Id` = `ex`.`inv_ExhaustPipe_Id`))) */;
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

-- Dump completed on 2017-02-21 11:55:43
