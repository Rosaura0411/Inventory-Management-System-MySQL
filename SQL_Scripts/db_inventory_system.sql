CREATE DATABASE  IF NOT EXISTS `db_inventory_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_inventory_system`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 192.168.56.101    Database: db_inventory_system
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.22.04.1

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
-- Table structure for table `Credential`
--

DROP TABLE IF EXISTS `Credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Credential` (
  `credential_id` int NOT NULL AUTO_INCREMENT,
  `password` char(64) NOT NULL,
  `salt` char(64) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`credential_id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `email` FOREIGN KEY (`email`) REFERENCES `Employee` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Credential`
--

LOCK TABLES `Credential` WRITE;
/*!40000 ALTER TABLE `Credential` DISABLE KEYS */;
INSERT INTO `Credential` VALUES (1,'decd6c8aef0c6faa11cf4d29f4ac9833c0c1ee643e89788ffc9e0788baaf878b','90A59FA8ECD9D39DB07F289EB7652736B52730BBBF97524674436AC33760A2EE','Amy5613@gmail.com'),(2,'d98dbaa77e1560f692a69bcb6edb52321901d2745796afa76703b3a3257a42cb','7FD46E7ABFA88C8AC4A7A8630B363E52A222B0320671D2241D64047402CD6111','Josh923@outlook.com'),(3,'0969578e4b73f41accef304c291febe861eb6db151c0b578e92bb83201a18d55','7FD46E7ABFA88C8AC4A7A8630B363E52A222B0320671D2241D64047402CD6111','Irene7598@hotmail.com'),(4,'c341bb2c910f60f1415ac3c39487872b87d25874de8c0841c40f6709cd1b4090','90A59FA8ECD9D39DB07F289EB7652736B52730BBBF97524674436AC33760A2EE','Amber2032@gmail.com'),(5,'7f73da347249656fde78aca2172ebd15a1f0024f7d38b3f591201edb106ef64e','0507E3B5FEA4175D28C8F095CA43F3A7E48E084E1C900F648BC15B6D890FB945','Tom5634@gmail.com');
/*!40000 ALTER TABLE `Credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `position` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `report_to` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `email` (`email`),
  KEY `Employee_ibfk_1` (`report_to`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`report_to`) REFERENCES `Employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Amy','Address 1','972900384','Managing Director','Amy5613@gmail.com',NULL),(2,'Josh','Address 2','932808498','Manager','Josh923@outlook.com',1),(3,'Irene','Address 3','943583056','Staff','Irene7598@hotmail.com',2),(4,'Amber','Address 4','926015800','Staff','Amber2032@gmail.com',5),(5,'Tom','Address 5','976673812','Manager','Tom5634@gmail.com',1);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Material`
--

DROP TABLE IF EXISTS `Material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Material` (
  `material_id` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `material_name` varchar(100) NOT NULL,
  `reorder_level` int NOT NULL,
  `material_created_at` datetime NOT NULL,
  `material_updated_at` datetime NOT NULL,
  `overall_quantity` int NOT NULL DEFAULT '0',
  `initial_quantity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Material`
--

LOCK TABLES `Material` WRITE;
/*!40000 ALTER TABLE `Material` DISABLE KEYS */;
INSERT INTO `Material` VALUES (1,90.40,'銅基板 PCB',99,'2023-10-13 13:15:29','2024-01-05 10:52:00',523,500),(2,33.00,'智慧溫感器',75,'2024-02-25 09:48:13','2024-02-28 15:35:00',545,500),(3,43.20,'鋁合金外殼',75,'2023-05-31 15:59:53','2023-12-09 12:24:00',79,110),(4,35.00,'工業級電容',11,'2023-05-09 14:56:33','2023-10-14 11:28:00',20,110),(5,93.00,'RFID 讀取模組',24,'2023-05-17 11:12:46','2023-10-13 17:56:00',501,500),(6,280.00,'低功耗IoT專用晶圓',50,'2023-06-01 09:55:23','2023-12-15 09:58:00',557,500),(7,165.00,'環境光感測鏡頭模組',60,'2023-07-19 10:26:56','2023-11-30 15:47:00',505,500),(8,230.00,'先進封裝微控制器',40,'2023-09-12 16:18:22','2024-01-02 11:33:00',532,500),(9,190.00,'紅外線影像感測模組',55,'2023-10-05 14:15:47','2024-02-18 14:20:00',504,500);
/*!40000 ALTER TABLE `Material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Procurement_Order`
--

DROP TABLE IF EXISTS `Procurement_Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Procurement_Order` (
  `procurement_order_id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `order_created_at` datetime NOT NULL,
  PRIMARY KEY (`procurement_order_id`),
  KEY `Procurement_Order_ibfk_1` (`supplier_id`),
  KEY `fk_proc_order_employee` (`employee_id`),
  CONSTRAINT `fk_proc_order_employee` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`),
  CONSTRAINT `Procurement_Order_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `Supplier` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Procurement_Order`
--

LOCK TABLES `Procurement_Order` WRITE;
/*!40000 ALTER TABLE `Procurement_Order` DISABLE KEYS */;
INSERT INTO `Procurement_Order` VALUES (1,2,5,3,'2023-10-31 16:26:59'),(2,3,2,3,'2024-02-28 14:08:03'),(3,3,5,2,'2023-07-17 09:42:06'),(4,1,2,3,'2023-09-11 12:13:19'),(5,2,1,3,'2023-08-18 14:55:20'),(6,1,4,0,'2023-11-02 11:58:36'),(7,3,3,1,'2024-05-27 13:36:36'),(8,1,2,0,'2023-06-30 10:24:29'),(9,2,5,3,'2023-05-22 08:30:02'),(10,2,1,2,'2023-05-25 10:45:49'),(11,2,4,0,'2023-02-27 15:23:24'),(12,1,3,3,'2023-03-19 15:40:20'),(13,3,2,3,'2023-01-05 13:45:26');
/*!40000 ALTER TABLE `Procurement_Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Procurement_Order_Detail`
--

DROP TABLE IF EXISTS `Procurement_Order_Detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Procurement_Order_Detail` (
  `procurement_order_detail_id` int NOT NULL AUTO_INCREMENT,
  `material_id` int NOT NULL,
  `procurement_order_id` int NOT NULL,
  `purchase_volume` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`procurement_order_detail_id`),
  KEY `material_id` (`material_id`),
  KEY `Procurement_Order_Detail_ibfk_2` (`procurement_order_id`),
  CONSTRAINT `Procurement_Order_Detail_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `Material` (`material_id`),
  CONSTRAINT `Procurement_Order_Detail_ibfk_2` FOREIGN KEY (`procurement_order_id`) REFERENCES `Procurement_Order` (`procurement_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Procurement_Order_Detail`
--

LOCK TABLES `Procurement_Order_Detail` WRITE;
/*!40000 ALTER TABLE `Procurement_Order_Detail` DISABLE KEYS */;
INSERT INTO `Procurement_Order_Detail` VALUES (1,4,1,14,35.00),(2,4,5,11,35.00),(3,7,3,9,165.00),(4,3,5,43,43.20),(5,9,3,27,190.00),(6,8,4,36,230.00),(7,1,1,1,90.40),(8,1,5,22,90.40),(9,2,4,14,33.00),(10,6,4,38,280.00),(11,6,6,25,280.00),(12,8,6,12,230.00),(13,7,7,30,165.00),(14,8,8,17,230.00),(15,1,9,20,90.40),(16,3,9,10,43.20),(17,5,9,35,93.00),(18,3,10,28,43.20),(19,4,11,15,35.00),(20,5,11,22,93.00),(21,6,12,18,280.00),(22,2,12,31,33.00),(23,9,13,8,190.00),(24,7,2,5,165.00);
/*!40000 ALTER TABLE `Procurement_Order_Detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Product` (
  `product_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `product_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'智慧電機規格表','包含電機功率、轉速、電壓等技術參數',365.52),(2,'溫度感測器技術文件','支援 I2C & SPI，測量範圍 -40°C ~ 125°C',308.40),(3,'高頻電路板規格','適用於 5G 通訊設備，低延遲高穩定性',669.84),(4,'智能倉儲 RFID 配置表','詳細列出 RFID 標籤讀取距離與數據傳輸速率',650.40),(5,'倉儲安防監控標籤','智慧倉儲防盜標籤',615.60);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Material`
--

DROP TABLE IF EXISTS `Product_Material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Product_Material` (
  `product_id` int NOT NULL,
  `material_id` int NOT NULL,
  `material_quantity` int NOT NULL,
  PRIMARY KEY (`product_id`,`material_id`),
  KEY `material_id` (`material_id`),
  CONSTRAINT `Product_Material_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`),
  CONSTRAINT `Product_Material_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `Material` (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Material`
--

LOCK TABLES `Product_Material` WRITE;
/*!40000 ALTER TABLE `Product_Material` DISABLE KEYS */;
INSERT INTO `Product_Material` VALUES (1,3,3),(1,4,5),(2,1,2),(2,2,1),(2,3,1),(3,1,2),(3,3,2),(3,4,3),(3,5,2),(4,3,5),(4,4,4),(4,5,2),(5,5,1),(5,8,1),(5,9,1);
/*!40000 ALTER TABLE `Product_Material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Order`
--

DROP TABLE IF EXISTS `Product_Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Product_Order` (
  `product_order_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `order_created_at` datetime NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`product_order_id`),
  KEY `fk_prod_order_employee` (`employee_id`),
  CONSTRAINT `fk_prod_order_employee` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Order`
--

LOCK TABLES `Product_Order` WRITE;
/*!40000 ALTER TABLE `Product_Order` DISABLE KEYS */;
INSERT INTO `Product_Order` VALUES (1,4,'2023-08-07 09:22:00','alex.chen@gmail.com',3),(2,3,'2022-04-14 16:10:00','ivy.wang@yahoo.com',3),(3,3,'2022-11-15 15:23:00','tony.liu@outlook.com',2),(4,1,'2022-11-24 13:58:00','rachel.hsu@icloud.com',1),(5,2,'2023-07-24 09:54:00','kevin.lin@gmail.com',0);
/*!40000 ALTER TABLE `Product_Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Order_Detail`
--

DROP TABLE IF EXISTS `Product_Order_Detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Product_Order_Detail` (
  `pruduct_order_detail_id` int NOT NULL AUTO_INCREMENT,
  `product_order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_quantity` int NOT NULL,
  PRIMARY KEY (`pruduct_order_detail_id`),
  KEY `Product_Order_Detail_ibfk_1` (`product_order_id`),
  KEY `Product_Order_Detail_ibfk_2` (`product_id`),
  CONSTRAINT `Product_Order_Detail_ibfk_1` FOREIGN KEY (`product_order_id`) REFERENCES `Product_Order` (`product_order_id`),
  CONSTRAINT `Product_Order_Detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Order_Detail`
--

LOCK TABLES `Product_Order_Detail` WRITE;
/*!40000 ALTER TABLE `Product_Order_Detail` DISABLE KEYS */;
INSERT INTO `Product_Order_Detail` VALUES (6,1,3,10),(7,2,4,5),(8,3,1,3),(9,4,5,4),(10,5,1,2);
/*!40000 ALTER TABLE `Product_Order_Detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reorder_Alert_Log`
--

DROP TABLE IF EXISTS `Reorder_Alert_Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Reorder_Alert_Log` (
  `alert_id` int NOT NULL AUTO_INCREMENT,
  `material_id` int DEFAULT NULL,
  `expected_quantity_after_order` int DEFAULT NULL,
  `reorder_level` int DEFAULT NULL,
  `alert_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`alert_id`),
  KEY `material_id_idx` (`material_id`),
  CONSTRAINT `material_id` FOREIGN KEY (`material_id`) REFERENCES `Material` (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reorder_Alert_Log`
--

LOCK TABLES `Reorder_Alert_Log` WRITE;
/*!40000 ALTER TABLE `Reorder_Alert_Log` DISABLE KEYS */;
INSERT INTO `Reorder_Alert_Log` VALUES (1,3,73,75,'2025-06-12 05:17:26'),(2,4,10,11,'2025-06-12 05:17:26');
/*!40000 ALTER TABLE `Reorder_Alert_Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Supplier` (
  `supplier_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`supplier_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES (1,'台矽電','mullally9914@gmail.com','提供高品質半導體材料，專注於微電子製造'),(2,'聯發料','andy4367@icloud.com','生產高效能工業用晶片與智慧製造設備'),(3,'大立光能','katie586@hotmail.com','提供高精度光學元件，適用於監控與自動化');
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplies`
--

DROP TABLE IF EXISTS `Supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Supplies` (
  `supplier_id` int NOT NULL,
  `material_id` int NOT NULL,
  PRIMARY KEY (`supplier_id`,`material_id`),
  KEY `material_id` (`material_id`),
  CONSTRAINT `Supplies_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `Supplier` (`supplier_id`),
  CONSTRAINT `Supplies_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `Material` (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplies`
--

LOCK TABLES `Supplies` WRITE;
/*!40000 ALTER TABLE `Supplies` DISABLE KEYS */;
INSERT INTO `Supplies` VALUES (2,1),(1,2),(2,3),(2,4),(2,5),(1,6),(3,7),(1,8),(3,9);
/*!40000 ALTER TABLE `Supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_inventory_system'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_CheckInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`CURRENT_USER`@`%` PROCEDURE `sp_CheckInventory`(
    IN in_product_order_id INT
)
BEGIN
    DECLARE v_product_id INT;
    DECLARE v_quantity INT;
    DECLARE v_low_stock_count INT DEFAULT 0;

    SELECT product_id, product_quantity INTO v_product_id, v_quantity
    FROM Product_Order_Detail
    WHERE product_order_id = in_product_order_id;

    CREATE TEMPORARY TABLE IF NOT EXISTS temp_low_stock AS
	SELECT 
		m.material_id,
		m.material_name,
		GREATEST(overall_quantity - (pm.material_quantity * v_quantity), 0) AS overall_quantity,
		m.reorder_level
	FROM Material m
	JOIN Product_Material pm ON m.material_id = pm.material_id
	WHERE pm.product_id = v_product_id
	  AND (m.overall_quantity - (pm.material_quantity * v_quantity)) < m.reorder_level;

    SELECT COUNT(*) INTO v_low_stock_count FROM temp_low_stock;

    IF v_low_stock_count > 0 THEN
		-- 如果有庫存低於reorder_level的原料，就插入警示紀錄表
        INSERT INTO Reorder_Alert_Log (material_id, expected_quantity_after_order, reorder_level, alert_time)
        SELECT material_id, overall_quantity, reorder_level, NOW()
        FROM temp_low_stock;
        
        SELECT 
            in_product_order_id AS product_order_id,
            material_id,
            material_name,
            overall_quantity,
            reorder_level
        FROM temp_low_stock;
    ELSE
        SELECT '該商品的零件庫存充足' AS message;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS temp_low_stock;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ComputeInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`CURRENT_USER`@`%` PROCEDURE `sp_ComputeInventory`(
    IN in_material_id INT
)
BEGIN
    DECLARE v_base_quantity INT DEFAULT 0;         
    DECLARE v_completed_quantity INT DEFAULT 0;    
    DECLARE v_reserved_quantity INT DEFAULT 0;    
    DECLARE v_final_quantity INT DEFAULT 0;       

    SELECT 
        m.initial_quantity, 
        m.material_name 
    INTO 
        v_base_quantity, 
        @material_name
    FROM Material m
    WHERE m.material_id = in_material_id;

    SELECT IFNULL(SUM(pod.purchase_volume), 0)
    INTO v_completed_quantity
    FROM Procurement_Order po
    JOIN Procurement_Order_Detail pod 
        ON po.procurement_order_id = pod.procurement_order_id
    WHERE pod.material_id = in_material_id
      AND po.status = 3;

    SELECT IFNULL(SUM(pod.product_quantity * pm.material_quantity), 0)
    INTO v_reserved_quantity
    FROM Product_Order po
    JOIN Product_Order_Detail pod 
        ON po.product_order_id = pod.product_order_id
    JOIN Product_Material pm 
        ON pod.product_id = pm.product_id
    WHERE pm.material_id = in_material_id
      AND po.status <> 0;

    SET v_final_quantity = v_base_quantity + v_completed_quantity - v_reserved_quantity;

	UPDATE Material
    SET 
        overall_quantity = GREATEST(v_final_quantity, 0),
        material_updated_at = NOW()
    WHERE material_id = in_material_id;
    
    SELECT 
        in_material_id AS material_id,
        @material_name AS material_name,
        GREATEST(v_final_quantity, 0) AS overall_quantity;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConfirmSupervisor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`CURRENT_USER`@`%` PROCEDURE `sp_ConfirmSupervisor`(
    IN in_employee_id INT
)
BEGIN
    WITH RECURSIVE SupervisorHierarchy AS (
        SELECT 
            e.employee_id,
            e.position,
            e.name,
            1 AS level
        FROM Employee e
        WHERE e.employee_id = (
            SELECT report_to FROM Employee WHERE employee_id = in_employee_id
        )
        
        UNION ALL
        
        SELECT 
            e.employee_id,
            e.position,
            e.name,
            sh.level + 1
        FROM Employee e
        JOIN SupervisorHierarchy sh ON e.employee_id = (
            SELECT report_to FROM Employee WHERE employee_id = sh.employee_id
        )
        WHERE sh.level < 3 
    )
    SELECT 
        employee_id,
        position,
        name
    FROM SupervisorHierarchy
    ORDER BY level DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateProcurementOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`CURRENT_USER`@`%` PROCEDURE `sp_CreateProcurementOrder`(
    IN in_supplier_id INT,
    IN in_employee_id INT,
    IN in_purchase_volume INT,
    IN in_material_id INT,
    OUT affected_row_num INT
)
BEGIN
    DECLARE v_unit_price DECIMAL(10,2);
    DECLARE v_procurement_order_id INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET affected_row_num = 0;
    END;

    IF NOT EXISTS (
        SELECT 1 FROM Supplies
        WHERE supplier_id = in_supplier_id AND material_id = in_material_id
    ) THEN
        SET affected_row_num = 0;
	
    ELSEIF in_purchase_volume <= 0 THEN
        SET affected_row_num = 0;     

    ELSE
        START TRANSACTION;

        SELECT unit_price INTO v_unit_price
        FROM Material
        WHERE material_id = in_material_id;

        INSERT INTO Procurement_Order (supplier_id, employee_id, status, order_created_at)
        VALUES (in_supplier_id, in_employee_id, 1, NOW());

        SET v_procurement_order_id = LAST_INSERT_ID();

        INSERT INTO Procurement_Order_Detail (procurement_order_id, material_id, purchase_volume, unit_price)
        VALUES (v_procurement_order_id, in_material_id, in_purchase_volume, v_unit_price);

        COMMIT;
        SET affected_row_num = 1;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateProductOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`CURRENT_USER`@`%` PROCEDURE `sp_CreateProductOrder`(
    IN in_product_id INT,
    IN in_product_quantity INT,
    IN in_employee_id INT,
    OUT affected_row_num INT
)
proc: BEGIN
    DECLARE v_product_order_id INT;
    DECLARE v_product_exists INT;
    DECLARE v_employee_exists INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET affected_row_num = 0;
    END;

    SET affected_row_num = 0;

    SELECT COUNT(*) INTO v_employee_exists 
    FROM Employee 
    WHERE employee_id = in_employee_id;

    IF v_employee_exists = 0 THEN
        LEAVE proc;
    END IF;

    SELECT COUNT(*) INTO v_product_exists 
    FROM Product 
    WHERE product_id = in_product_id;

    IF v_product_exists = 0 OR in_product_quantity <= 0 THEN
        LEAVE proc;
    END IF;

    START TRANSACTION;

    INSERT INTO Product_Order (employee_id, order_created_at, status)
    VALUES (in_employee_id, NOW(), 1);

    SET v_product_order_id = LAST_INSERT_ID();

    INSERT INTO Product_Order_Detail (product_order_id, product_id, product_quantity)
    VALUES (v_product_order_id, in_product_id, in_product_quantity);

    COMMIT;

    SET affected_row_num = 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`CURRENT_USER`@`%` PROCEDURE `sp_DeleteEmployee`(
    IN in_employee_id INT
)
proc: BEGIN
    DECLARE status_code INT DEFAULT 1;
    DECLARE v_supervisor_id INT;
    DECLARE v_new_manager_id INT DEFAULT NULL;
    DECLARE v_has_active_orders BOOLEAN DEFAULT FALSE;
    DECLARE v_position VARCHAR(100);
    DECLARE v_email VARCHAR(100);
    DECLARE v_employee_id INT;
    DECLARE v_name VARCHAR(100);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET status_code = 2; 
        SELECT status_code, NULL AS employee_id, NULL AS name; 
    END;

    START TRANSACTION;

    IF NOT EXISTS (SELECT 1 FROM Employee WHERE employee_id = in_employee_id) THEN
        SET status_code = 2; 
        ROLLBACK;
        SELECT status_code, NULL AS employee_id, NULL AS name;
        LEAVE proc;
    END IF;

    SELECT name, employee_id, position, email 
    INTO v_name, v_employee_id, v_position, v_email
    FROM Employee
    WHERE employee_id = in_employee_id
    LIMIT 1;

    SELECT report_to INTO v_supervisor_id
    FROM Employee
    WHERE employee_id = in_employee_id
    LIMIT 1;

    IF v_supervisor_id IS NULL THEN
        SET status_code = 2; 
        ROLLBACK;
        SELECT status_code, v_employee_id AS employee_id, v_name AS name;
        LEAVE proc;
    END IF;

    SET v_has_active_orders = 
        EXISTS (SELECT 1 FROM Procurement_Order WHERE employee_id = in_employee_id AND status IN (1, 2))
        OR EXISTS (SELECT 1 FROM Product_Order WHERE employee_id = in_employee_id AND status IN (1, 2));

    IF v_has_active_orders THEN
        UPDATE Procurement_Order
        SET employee_id = v_supervisor_id
        WHERE employee_id = in_employee_id AND status IN (1, 2);

        UPDATE Product_Order
        SET employee_id = v_supervisor_id
        WHERE employee_id = in_employee_id AND status IN (1, 2);
    END IF;

    IF v_position = 'Manager' THEN
        IF EXISTS (SELECT 1 FROM Employee WHERE report_to = in_employee_id) THEN
            SELECT employee_id INTO v_new_manager_id
            FROM Employee
            WHERE employee_id NOT IN (in_employee_id, v_supervisor_id)
              AND position = 'Manager'
            ORDER BY RAND()
            LIMIT 1;

            IF v_new_manager_id IS NOT NULL THEN
                UPDATE Employee
                SET report_to = v_new_manager_id
                WHERE report_to = in_employee_id;
            ELSE
                SET status_code = 2; 
                ROLLBACK;
                SELECT status_code, v_employee_id AS employee_id, v_name AS name;
                LEAVE proc;
            END IF;
        END IF;
    END IF;

    UPDATE Procurement_Order
    SET employee_id = NULL
    WHERE employee_id = in_employee_id AND status NOT IN (1, 2);

    UPDATE Product_Order
    SET employee_id = NULL
    WHERE employee_id = in_employee_id AND status NOT IN (1, 2);

    DELETE FROM Credential WHERE email = v_email;
    DELETE FROM Employee WHERE employee_id = in_employee_id;

    COMMIT;

    SELECT status_code, v_employee_id AS employee_id, v_name AS name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetRecentOrdersBySupplier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`CURRENT_USER`@`%` PROCEDURE `sp_GetRecentOrdersBySupplier`(
    IN in_supplier_id INT,
    IN in_start_date DATETIME,
    IN in_end_date DATETIME
)
BEGIN
    IF in_start_date IS NULL OR in_end_date IS NULL OR in_start_date > in_end_date THEN
        SELECT 'Invalid date range' AS error_message;
    ELSE
        SELECT 
            po.supplier_id,
            po.procurement_order_id,
            po.employee_id,
            po.status,
            po.order_created_at,
            ROUND(SUM(pod.purchase_volume * pod.unit_price), 2) AS total_order_price
        FROM Procurement_Order po
        JOIN Procurement_Order_Detail pod 
            ON po.procurement_order_id = pod.procurement_order_id
        WHERE po.supplier_id = in_supplier_id
            AND po.status = 3 
            AND po.order_created_at BETWEEN in_start_date AND in_end_date
        GROUP BY 
            po.procurement_order_id,
            po.supplier_id,
            po.employee_id,
            po.status,
            po.order_created_at
        ORDER BY po.order_created_at DESC;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetSupplierPerformanceReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`CURRENT_USER`@`%` PROCEDURE `sp_GetSupplierPerformanceReport`(
    IN in_start_date DATETIME,
    IN in_end_date DATETIME
)
BEGIN
    SELECT
        s.supplier_id,
        s.name AS supplier_name,
        COUNT(po.procurement_order_id) AS total_orders,
        ROUND(
            SUM(CASE WHEN po.status = 3 THEN 1 ELSE 0 END) / 
            NULLIF(SUM(CASE WHEN po.status IN (0, 3) THEN 1 ELSE 0 END), 0) * 100, 
            2
        ) AS complete_rate
    FROM Supplier s
    LEFT JOIN Procurement_Order po 
        ON s.supplier_id = po.supplier_id
        AND po.order_created_at BETWEEN in_start_date AND in_end_date
    GROUP BY s.supplier_id, s.name
    HAVING total_orders > 0
    ORDER BY complete_rate ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUnreceivedOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`CURRENT_USER`@`%` PROCEDURE `sp_GetUnreceivedOrders`(
    IN in_start_date DATETIME,
    IN in_end_date DATETIME
)
BEGIN
    SELECT 
        po.procurement_order_id,
        po.supplier_id,
        s.name AS supplier_name,
        pod.material_id,
        m.material_name,
        CASE 
            WHEN po.status = 3 THEN 0  
            ELSE pod.purchase_volume   
        END AS unreceived_amount,
        po.order_created_at,
        CASE 
            WHEN po.status = 3 THEN 1  
            ELSE 2                     
        END AS delivery_status
    FROM Procurement_Order po
    JOIN Procurement_Order_Detail pod 
        ON po.procurement_order_id = pod.procurement_order_id
    JOIN Supplier s 
        ON po.supplier_id = s.supplier_id
    JOIN Material m 
        ON pod.material_id = m.material_id
    WHERE po.order_created_at BETWEEN in_start_date AND in_end_date
      AND po.status != 0  
    ORDER BY unreceived_amount DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`CURRENT_USER`@`%` PROCEDURE `sp_Login`(
    IN in_email VARCHAR(100),
    IN in_original_hashpwd CHAR(64),
    OUT status_code INT
)
BEGIN
    DECLARE v_stored_hash CHAR(64);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET status_code = 3;
    END;
    
    IF NOT EXISTS (SELECT 1 FROM Credential WHERE email = in_email) THEN
        SET status_code = 3;
    ELSE
        SELECT password INTO v_stored_hash
        FROM Credential
        WHERE email = in_email;
        
        IF v_stored_hash = in_original_hashpwd THEN
            SET status_code = 1;
        ELSE
            SET status_code = 2;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`CURRENT_USER`@`%` PROCEDURE `sp_RegisterEmployee`(
    IN in_email VARCHAR(100),
    IN in_hashedPwd CHAR(64),
    IN in_salt CHAR(64),
    IN in_name VARCHAR(100),
    IN in_address VARCHAR(255),
    IN in_phone VARCHAR(20),
    IN in_position VARCHAR(50),
    OUT status_code INT
)
proc:BEGIN
    DECLARE v_employee_id INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		ROLLBACK;
        SET status_code = 3;
    END;
    
    START TRANSACTION;
    
    IF TRIM(in_email) = '' OR TRIM(in_hashedPwd) = '' OR TRIM(in_salt) = '' 
       OR TRIM(in_name) = '' OR TRIM(in_address) = ''OR TRIM(in_phone) = '' OR TRIM(in_position) = '' THEN
        SET status_code = 3;
        LEAVE proc; 
    END IF;
    
    IF EXISTS (SELECT 1 FROM Employee WHERE email = in_email) THEN
        SET status_code = 2;
	ELSEIF in_position NOT IN ('Managing Director', 'Manager', 'Staff') THEN
		ROLLBACK;
        SET status_code = 3;
    ELSE
        INSERT INTO Employee (name, address, phone, position, email)
        VALUES (in_name, in_address, in_phone, in_position, in_email);

        SET v_employee_id = LAST_INSERT_ID();

        INSERT INTO Credential (email, password, salt)
        VALUES (in_email, in_hashedPwd, in_salt);

		COMMIT;
        SET status_code = 1;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateOrderStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`CURRENT_USER`@`%` PROCEDURE `sp_UpdateOrderStatus`(
    IN in_order_id INT,              
    IN in_status INT,                 
    IN in_order_type VARCHAR(20),   
    OUT affected_row_num INT       
)
BEGIN
    DECLARE v_current_status INT;              
    DECLARE v_valid_transition BOOLEAN DEFAULT FALSE;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET affected_row_num = 0;
    END;

    SET affected_row_num = 0;

    IF in_order_type = 'PocurementOrder' THEN

        SELECT status INTO v_current_status
        FROM Procurement_Order
        WHERE procurement_order_id = in_order_id;

        IF v_current_status != 0 AND v_current_status != 3 AND in_status = 0 THEN
            SET v_valid_transition = TRUE;
        ELSEIF v_current_status = 1 AND in_status = 2 THEN
            SET v_valid_transition = TRUE;
        ELSEIF v_current_status = 2 AND in_status = 3 THEN
            SET v_valid_transition = TRUE;
        END IF;

        IF v_valid_transition THEN
            UPDATE Procurement_Order
            SET status = p_status
            WHERE procurement_order_id = in_order_id;

            SET affected_row_num = 1;
        END IF;

    ELSEIF in_order_type = 'ProductOrder' THEN

        SELECT status INTO v_current_status
        FROM Product_Order
        WHERE product_order_id = in_order_id;

        IF v_current_status != 0 AND v_current_status != 3 AND in_status = 0 THEN
            SET v_valid_transition = TRUE;
        ELSEIF v_current_status = 1 AND in_status = 2 THEN
            SET v_valid_transition = TRUE;
        ELSEIF v_current_status = 2 AND in_status = 3 THEN
            SET v_valid_transition = TRUE;
        END IF;

        IF v_valid_transition THEN
            UPDATE Product_Order
            SET status = in_status
            WHERE product_order_id = in_order_id;

            SET affected_row_num = 1;
        END IF;

    ELSE
        SET affected_row_num = 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdatePwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`CURRENT_USER`@`%` PROCEDURE `sp_UpdatePwd`(
    IN in_email VARCHAR(100),
    IN in_original_hashPwd CHAR(64),
    IN in_hashedPwd CHAR(64),
    IN in_salt CHAR(64),
    OUT status_code INT
)
proc: BEGIN
    DECLARE v_current_hash CHAR(64);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET status_code = 3;
    END;

    START TRANSACTION;

    IF TRIM(in_email) = '' OR TRIM(in_original_hashPwd) = '' OR TRIM(in_hashedPwd) = '' OR TRIM(in_salt) = '' THEN
        SET status_code = 3;
        LEAVE proc;
    END IF;

    SELECT password INTO v_current_hash
    FROM Credential
    WHERE email = in_email;

    IF v_current_hash IS NULL THEN
        SET status_code = 3; 
        ROLLBACK;
    ELSEIF v_current_hash = in_original_hashPwd THEN
        UPDATE Credential
        SET password = in_hashedPwd, salt = in_salt
        WHERE email = in_email;

        COMMIT;
        SET status_code = 1; 
    ELSE
        SET status_code = 2;
        ROLLBACK;
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

-- Dump completed on 2025-06-12 18:29:49
