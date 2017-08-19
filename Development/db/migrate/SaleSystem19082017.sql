-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: sale_system
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `adjust_stock_details`
--

DROP TABLE IF EXISTS `adjust_stock_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjust_stock_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjust_stock_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `serial_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `um_id` int(11) DEFAULT NULL,
  `multiplier` decimal(18,6) DEFAULT NULL,
  `total_qty` float DEFAULT NULL,
  `cost` decimal(18,6) DEFAULT NULL,
  `adjust_type_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjust_stock_details`
--

LOCK TABLES `adjust_stock_details` WRITE;
/*!40000 ALTER TABLE `adjust_stock_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjust_stock_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjust_stock_types`
--

DROP TABLE IF EXISTS `adjust_stock_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjust_stock_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjust_stock_types`
--

LOCK TABLES `adjust_stock_types` WRITE;
/*!40000 ALTER TABLE `adjust_stock_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjust_stock_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjust_stocks`
--

DROP TABLE IF EXISTS `adjust_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjust_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `auto_code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjust_stocks`
--

LOCK TABLES `adjust_stocks` WRITE;
/*!40000 ALTER TABLE `adjust_stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjust_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'PP','Phnom Penh','2017-07-26 00:59:27','2017-07-26 00:59:27');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditable_id` int(11) DEFAULT NULL,
  `auditable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `associated_id` int(11) DEFAULT NULL,
  `associated_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `audited_changes` text COLLATE utf8_unicode_ci,
  `version` int(11) DEFAULT '0',
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remote_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `associated_index` (`associated_id`,`associated_type`) USING BTREE,
  KEY `auditable_index` (`auditable_id`,`auditable_type`) USING BTREE,
  KEY `index_audits_on_created_at` (`created_at`) USING BTREE,
  KEY `index_audits_on_request_uuid` (`request_uuid`) USING BTREE,
  KEY `user_index` (`user_id`,`user_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
INSERT INTO `audits` VALUES (1,1,'InvoiceDetail',1,'Invoice',NULL,NULL,NULL,'create','---\ninvoice_id: 1\nitem_id: 1\nitem_group_id: \ndescription: \'\'\nserial: \nqty: 2.0\num_id: 1\nmultiplier: 1.0\ntotal_qty: 2.0\nprice: 12.0\nextent_price: 24.0\ncreated_by: \nmodify_by: \n',1,NULL,'127.0.0.1','50750eec-fb82-4c11-8444-64c61a2553fa','2017-07-26 01:00:20'),(2,1,'Invoice',NULL,NULL,NULL,NULL,NULL,'create','---\ninvoice_no: \'0001\'\nsale_quotation_id: \nlocation_id: \ncustomer_id: 1\ndate: 2017-07-26\ndue_date: 2017-07-26\nref_no: \'\'\ntotal_amount: 24.0\ndiscount_percentag: \ndiscount_amount: 0.0\ntax_percentag: 0.0\ntax_amount: \ngrand_total_amount: 24.0\nunpaid_amount: 24.0\npaid_amount: 0.0\nmemo: \'\'\npayment_flag: 1\nstatus: S\ncreated_by: 1\nmodify_by: \n',1,NULL,'127.0.0.1','50750eec-fb82-4c11-8444-64c61a2553fa','2017-07-26 01:00:20'),(3,1,'StockTransaction',NULL,NULL,NULL,NULL,NULL,'create','---\ntransaction_id: 1\ntransaction_type_id: 2\nref_no: \'0001\'\ndate: 2017-07-26\nitem_id: 1\nserial_no: \nopen_qty: 0\nremain_qty: 0\nqty: 2.0\num_id: 1\ntotal_qty: -2.0\ninput_cost: 0.0\nlast_value: 0\ntotal_value: 0.0\nlocation_id: \ncreated_by: 1\navg_cost: 0.0\nmodify_by: \n',1,NULL,'127.0.0.1','50750eec-fb82-4c11-8444-64c61a2553fa','2017-07-26 01:00:20'),(4,2,'InvoiceDetail',2,'Invoice',NULL,NULL,NULL,'create','---\ninvoice_id: 2\nitem_id: 2\nitem_group_id: \ndescription: \'\'\nserial: \nqty: 1.0\num_id: 1\nmultiplier: 24.0\ntotal_qty: 24.0\nprice: 230.0\nextent_price: 230.0\ncreated_by: \nmodify_by: \n',1,NULL,'127.0.0.1','cc6f2ff4-84e4-42ff-a6f7-4bd30f0acf1c','2017-07-26 14:34:49'),(5,2,'Invoice',NULL,NULL,NULL,NULL,NULL,'create','---\ninvoice_no: \'0002\'\nsale_quotation_id: \nlocation_id: \ncustomer_id: 1\ndate: 2017-07-26\ndue_date: 2017-07-26\nref_no: \'\'\ntotal_amount: 230.0\ndiscount_percentag: \ndiscount_amount: 0.0\ntax_percentag: 0.0\ntax_amount: \ngrand_total_amount: 230.0\nunpaid_amount: 230.0\npaid_amount: 0.0\nmemo: \'\'\npayment_flag: 1\nstatus: S\ncreated_by: 1\nmodify_by: \n',1,NULL,'127.0.0.1','cc6f2ff4-84e4-42ff-a6f7-4bd30f0acf1c','2017-07-26 14:34:49'),(6,2,'StockTransaction',NULL,NULL,NULL,NULL,NULL,'create','---\ntransaction_id: 2\ntransaction_type_id: 2\nref_no: \'0002\'\ndate: 2017-07-26\nitem_id: 2\nserial_no: \nopen_qty: 0\nremain_qty: 0\nqty: 1.0\num_id: 1\ntotal_qty: -24.0\ninput_cost: 0.0\nlast_value: 0\ntotal_value: 0.0\nlocation_id: \ncreated_by: 1\navg_cost: 0.0\nmodify_by: \n',1,NULL,'127.0.0.1','cc6f2ff4-84e4-42ff-a6f7-4bd30f0acf1c','2017-07-26 14:34:49'),(7,1,'Invoice',NULL,NULL,NULL,NULL,NULL,'update','---\npaid_amount:\n- 0.0\n- 24.0\nunpaid_amount:\n- 24.0\n- 0.0\npayment_flag:\n- 1\n- 3\n',2,NULL,'127.0.0.1','4c1e277c-b612-4b9f-ab19-d3a1d9fb27da','2017-07-26 14:35:04'),(8,2,'Invoice',NULL,NULL,NULL,NULL,NULL,'update','---\npaid_amount:\n- 0.0\n- 230.0\nunpaid_amount:\n- 230.0\n- 0.0\npayment_flag:\n- 1\n- 3\n',2,NULL,'127.0.0.1','4c1e277c-b612-4b9f-ab19-d3a1d9fb27da','2017-07-26 14:35:04'),(9,3,'InvoiceDetail',3,'Invoice',NULL,NULL,NULL,'create','---\ninvoice_id: 3\nitem_id: 2\nitem_group_id: \ndescription: \'\'\nserial: \nqty: 1.0\num_id: 2\nmultiplier: 1.0\ntotal_qty: 1.0\nprice: 10.0\nextent_price: 10.0\ncreated_by: \nmodify_by: \n',1,NULL,'127.0.0.1','77a29e3b-ce5e-43fb-bb68-ec34892251d5','2017-07-26 14:38:32'),(10,3,'Invoice',NULL,NULL,NULL,NULL,NULL,'create','---\ninvoice_no: \'0003\'\nsale_quotation_id: \nlocation_id: \ncustomer_id: 1\ndate: 2017-07-26\ndue_date: 2017-07-26\nref_no: \'\'\ntotal_amount: 10.0\ndiscount_percentag: \ndiscount_amount: 0.0\ntax_percentag: 0.0\ntax_amount: \ngrand_total_amount: 10.0\nunpaid_amount: 10.0\npaid_amount: 0.0\nmemo: \'\'\npayment_flag: 1\nstatus: S\ncreated_by: 1\nmodify_by: \n',1,NULL,'127.0.0.1','77a29e3b-ce5e-43fb-bb68-ec34892251d5','2017-07-26 14:38:32'),(11,3,'StockTransaction',NULL,NULL,NULL,NULL,NULL,'create','---\ntransaction_id: 3\ntransaction_type_id: 2\nref_no: \'0003\'\ndate: 2017-07-26\nitem_id: 2\nserial_no: \nopen_qty: 0\nremain_qty: -1\nqty: 1.0\num_id: 2\ntotal_qty: -1.0\ninput_cost: 0.0\nlast_value: 0\ntotal_value: 0.0\nlocation_id: \ncreated_by: 1\navg_cost: 0.0\nmodify_by: \n',1,NULL,'127.0.0.1','77a29e3b-ce5e-43fb-bb68-ec34892251d5','2017-07-26 14:38:32'),(12,3,'Invoice',NULL,NULL,NULL,NULL,NULL,'update','---\npaid_amount:\n- 0.0\n- 2.0\nunpaid_amount:\n- 10.0\n- 8.0\npayment_flag:\n- 1\n- 2\n',2,NULL,'127.0.0.1','f391150d-1fe1-459f-bf34-a2c20fd680c3','2017-07-26 14:39:20'),(13,3,'Invoice',NULL,NULL,NULL,NULL,NULL,'update','---\npaid_amount:\n- 2.0\n- 10.0\nunpaid_amount:\n- 8.0\n- 0.0\npayment_flag:\n- 2\n- 3\n',3,NULL,'127.0.0.1','302345ce-76f3-493f-95eb-92f1ad1ac139','2017-07-26 14:39:34');
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_profiles`
--

DROP TABLE IF EXISTS `company_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `legal_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `update_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `account_no` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vat_tin` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_profiles`
--

LOCK TABLES `company_profiles` WRITE;
/*!40000 ALTER TABLE `company_profiles` DISABLE KEYS */;
INSERT INTO `company_profiles` VALUES (1,'សារីមុន្នីតារា','Sary Monydara','12356','(017/081/066) 73 83 93','023 882 717 / (017/081/066) 73 83 93','company@domain.com','www.website.com','Phnom Penh',NULL,'2017-07-23 05:24:20','2017-07-28 08:43:07','/system/company_profiles/images/000/000/001/original/Coca.jpeg?1501231387','image/jpeg',10061,'2017-07-28 08:43:07','11-2021-031993-3','Dara','Cathay United Bank','105007390');
/*!40000 ALTER TABLE `company_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_id_card` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Sary Mony Dara','069808433','','','',NULL,'2017-07-26 01:00:02','2017-07-26 01:00:02');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fraction_unit` decimal(10,0) DEFAULT NULL,
  `rate_in` decimal(18,6) DEFAULT NULL,
  `rate_out` decimal(18,6) DEFAULT NULL,
  `is_base` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'Riel','៛','KHR',100,1.000000,1.000000,NULL,'2017-07-27 18:45:12','2017-07-27 18:45:12'),(2,'Dollar','$','USD',1,4000.000000,4100.000000,NULL,'2017-07-27 18:45:42','2017-07-27 18:45:42');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_balances`
--

DROP TABLE IF EXISTS `customer_balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_balances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `balance` decimal(18,6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_balances`
--

LOCK TABLES `customer_balances` WRITE;
/*!40000 ALTER TABLE `customer_balances` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_balances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_transactions`
--

DROP TABLE IF EXISTS `customer_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `transaction_type_id` int(11) DEFAULT NULL,
  `ref_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(18,6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_transactions`
--

LOCK TABLES `customer_transactions` WRITE;
/*!40000 ALTER TABLE `customer_transactions` DISABLE KEYS */;
INSERT INTO `customer_transactions` VALUES (1,1,1,'2017-07-26',2,'0001',24.000000,1,NULL,'2017-07-26 01:00:20','2017-07-26 01:00:20'),(2,2,1,'2017-07-26',2,'0002',230.000000,1,NULL,'2017-07-26 14:34:49','2017-07-26 14:34:49'),(3,1,1,'2017-07-26',6,'0001',-254.000000,1,NULL,'2017-07-26 14:35:04','2017-07-26 14:35:04'),(4,3,1,'2017-07-26',2,'0003',10.000000,1,NULL,'2017-07-26 14:38:32','2017-07-26 14:38:32'),(5,2,1,'2017-07-26',6,'0002',-2.000000,1,NULL,'2017-07-26 14:39:20','2017-07-26 14:39:20'),(6,3,1,'2017-07-26',6,'0003',-8.000000,1,NULL,'2017-07-26 14:39:34','2017-07-26 14:39:34');
/*!40000 ALTER TABLE `customer_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_types`
--

DROP TABLE IF EXISTS `customer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_types`
--

LOCK TABLES `customer_types` WRITE;
/*!40000 ALTER TABLE `customer_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `legal_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_area_id` int(11) DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `is_system_created` tinyint(1) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `vat_tin` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'0001',' សារីមុន្នី តារា',' សារីមុន្នី តារា','Individual',1,'','','','','',1,NULL,NULL,NULL,NULL,'2017-07-26 01:00:10','2017-07-26 01:00:10','');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Sale Department','','2017-07-23 05:24:20','2017-07-23 05:24:20');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eods`
--

DROP TABLE IF EXISTS `eods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memo` text COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eods`
--

LOCK TABLES `eods` WRITE;
/*!40000 ALTER TABLE `eods` DISABLE KEYS */;
/*!40000 ALTER TABLE `eods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eoms`
--

DROP TABLE IF EXISTS `eoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `encrypted_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encrypted_last_close_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encrypted_password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memo` text COLLATE utf8_unicode_ci,
  `encrypted_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eoms`
--

LOCK TABLES `eoms` WRITE;
/*!40000 ALTER TABLE `eoms` DISABLE KEYS */;
INSERT INTO `eoms` VALUES (1,'9AIvfGsi2DTr5JmkwAwWVA==\n',NULL,'VVHflm+4xHcrLSfAtMxW+Q==\n','this is for close testing','tvmotGBZrSKZD09r2G+cag==\n',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(2,'9AIvfGsi2DTr5JmkwAwWVA==\n','9AIvfGsi2DTr5JmkwAwWVA==\n','VVHflm+4xHcrLSfAtMxW+Q==\n','this is for close testing','zWPTOl3jRZ39deMwXtk/4A==\n',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21');
/*!40000 ALTER TABLE `eoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'2017-07-23 05:24:21','2017-07-23 05:24:21','Tablet_pion.svg.png','image/png',163391,'2016-01-29 01:49:18'),(2,'2017-07-23 05:24:21','2017-07-23 05:24:21','10647863_225730171094557_242167111_n.jpg','image/jpeg',110002,'2016-01-29 02:38:15'),(3,'2017-07-23 05:24:21','2017-07-23 05:24:21','image_(14)_副本.jpg','image/jpeg',84511,'2016-01-29 07:50:18'),(4,'2017-07-23 05:24:21','2017-07-23 05:24:21','image_.jpg','image/jpeg',84511,'2016-01-29 07:50:32'),(5,'2017-07-27 11:15:25','2017-07-27 11:15:25','Scan_2.jpeg','image/jpeg',493298,'2017-07-27 11:15:25'),(6,'2017-07-27 11:16:08','2017-07-27 11:16:08','Coca.jpeg','image/jpeg',10061,'2017-07-27 11:16:08');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_details`
--

DROP TABLE IF EXISTS `invoice_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_group_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `um_id` int(11) DEFAULT NULL,
  `multiplier` decimal(18,6) DEFAULT NULL,
  `total_qty` float DEFAULT NULL,
  `price` decimal(18,6) DEFAULT NULL,
  `extent_price` decimal(18,6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_details`
--

LOCK TABLES `invoice_details` WRITE;
/*!40000 ALTER TABLE `invoice_details` DISABLE KEYS */;
INSERT INTO `invoice_details` VALUES (1,1,1,NULL,'',NULL,2,1,1.000000,2,12.000000,24.000000,NULL,NULL,'2017-07-26 01:00:20','2017-07-26 01:00:20'),(2,2,2,NULL,'',NULL,1,1,24.000000,24,230.000000,230.000000,NULL,NULL,'2017-07-26 14:34:49','2017-07-26 14:34:49'),(3,3,2,NULL,'',NULL,1,2,1.000000,1,10.000000,10.000000,NULL,NULL,'2017-07-26 14:38:32','2017-07-26 14:38:32');
/*!40000 ALTER TABLE `invoice_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sale_quotation_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `ref_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` decimal(18,6) DEFAULT NULL,
  `discount_percentag` decimal(18,6) DEFAULT NULL,
  `discount_amount` decimal(18,6) DEFAULT NULL,
  `tax_percentag` decimal(18,6) DEFAULT NULL,
  `tax_amount` decimal(18,6) DEFAULT NULL,
  `grand_total_amount` decimal(18,6) DEFAULT NULL,
  `unpaid_amount` decimal(18,6) DEFAULT NULL,
  `paid_amount` decimal(18,6) DEFAULT NULL,
  `memo` text COLLATE utf8_unicode_ci,
  `payment_flag` tinyint(4) DEFAULT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,'0001',NULL,NULL,1,'2017-07-26','2017-07-26','',24.000000,NULL,0.000000,0.000000,NULL,24.000000,0.000000,24.000000,'',3,'S',1,NULL,'2017-07-26 01:00:20','2017-07-26 14:35:04'),(2,'0002',NULL,NULL,1,'2017-07-26','2017-07-26','',230.000000,NULL,0.000000,0.000000,NULL,230.000000,0.000000,230.000000,'',3,'S',1,NULL,'2017-07-26 14:34:49','2017-07-26 14:35:04'),(3,'0003',NULL,NULL,1,'2017-07-26','2017-07-26','',10.000000,NULL,0.000000,0.000000,NULL,10.000000,0.000000,10.000000,'',3,'S',1,NULL,'2017-07-26 14:38:32','2017-07-26 14:39:34');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_rental_details`
--

DROP TABLE IF EXISTS `issue_rental_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_rental_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `serial` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `um_id` int(11) DEFAULT NULL,
  `total_qty` float DEFAULT NULL,
  `is_free` tinyint(1) DEFAULT NULL,
  `price` decimal(18,6) DEFAULT NULL,
  `total_amount` decimal(18,6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_rental_details`
--

LOCK TABLES `issue_rental_details` WRITE;
/*!40000 ALTER TABLE `issue_rental_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_rental_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_rentals`
--

DROP TABLE IF EXISTS `issue_rentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_rentals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rental_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(18,6) DEFAULT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_rentals`
--

LOCK TABLES `issue_rentals` WRITE;
/*!40000 ALTER TABLE `issue_rentals` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_rentals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_categories`
--

DROP TABLE IF EXISTS `item_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_of_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_categories`
--

LOCK TABLES `item_categories` WRITE;
/*!40000 ALTER TABLE `item_categories` DISABLE KEYS */;
INSERT INTO `item_categories` VALUES (1,2,'Inventory Software','',1,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(2,NULL,'Hospital  Software','',1,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(3,0,'Service','',1,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(4,NULL,'Drink','',1,'2017-07-23 05:26:48','2017-07-23 05:26:48'),(5,NULL,'Beer','',1,'2017-07-23 05:27:11','2017-07-23 05:27:11');
/*!40000 ALTER TABLE `item_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_group_details`
--

DROP TABLE IF EXISTS `item_group_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_group_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `qty` decimal(10,0) DEFAULT NULL,
  `um_id` int(11) DEFAULT NULL,
  `multiplier` decimal(10,0) DEFAULT NULL,
  `total_qty` decimal(10,0) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_group_details`
--

LOCK TABLES `item_group_details` WRITE;
/*!40000 ALTER TABLE `item_group_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_group_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_prices`
--

DROP TABLE IF EXISTS `item_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `um_id` int(11) DEFAULT NULL,
  `multiplier` decimal(18,6) DEFAULT NULL,
  `price` decimal(18,6) DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_prices`
--

LOCK TABLES `item_prices` WRITE;
/*!40000 ALTER TABLE `item_prices` DISABLE KEYS */;
INSERT INTO `item_prices` VALUES (1,1,1,1.000000,0.000000,NULL,NULL,NULL,'2017-07-23 05:34:56','2017-07-23 05:34:56'),(2,2,1,24.000000,230.000000,NULL,NULL,NULL,'2017-07-26 14:34:09','2017-07-26 14:34:09'),(3,2,2,1.000000,10.000000,'',NULL,NULL,'2017-07-26 14:34:09','2017-07-26 14:34:22');
/*!40000 ALTER TABLE `item_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_types`
--

DROP TABLE IF EXISTS `item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_types`
--

LOCK TABLES `item_types` WRITE;
/*!40000 ALTER TABLE `item_types` DISABLE KEYS */;
INSERT INTO `item_types` VALUES (1,'Invetory','001',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(2,'Service','002',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(3,'Fix Asset','003',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(4,'Asset','004',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(5,'Group Item','005',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21');
/*!40000 ALTER TABLE `item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `barcode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_type_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `um_id` int(11) DEFAULT NULL,
  `price` decimal(18,6) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `cost_avc` decimal(18,6) DEFAULT NULL,
  `re_order_point` decimal(18,6) DEFAULT NULL,
  `is_use_serial` tinyint(1) DEFAULT NULL,
  `image_url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `series_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `color` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depreciation_method_id` int(11) DEFAULT NULL,
  `depreciation_type_id` int(11) DEFAULT NULL,
  `depreciation_rate` decimal(18,6) DEFAULT NULL,
  `memo` text COLLATE utf8_unicode_ci,
  `sale_description` text COLLATE utf8_unicode_ci,
  `purchase_description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Coca','0001','',1,1,1,0.000000,1,0.000000,0.000000,0,'',NULL,NULL,NULL,NULL,NULL,NULL,'','','',1,1,1,'2017-07-23 05:34:56','2017-07-27 18:58:19'),(2,'Pepsi','0002','',1,1,2,10.000000,2,0.000000,10.000000,0,'',NULL,NULL,NULL,NULL,NULL,NULL,'','','',1,1,1,'2017-07-26 14:34:09','2017-07-27 18:58:25');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_flag`
--

DROP TABLE IF EXISTS `lead_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_flag`
--

LOCK TABLES `lead_flag` WRITE;
/*!40000 ALTER TABLE `lead_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_opportunities`
--

DROP TABLE IF EXISTS `lead_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_opportunities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oppunity_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oppunity_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `next_contact_by` int(11) DEFAULT NULL,
  `next_contact_date` datetime DEFAULT NULL,
  `to_discuss` text COLLATE utf8_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `is_with_item` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_opportunities`
--

LOCK TABLES `lead_opportunities` WRITE;
/*!40000 ALTER TABLE `lead_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_opportunity_details`
--

DROP TABLE IF EXISTS `lead_opportunity_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_opportunity_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oppunity_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `um_id` int(11) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_opportunity_details`
--

LOCK TABLES `lead_opportunity_details` WRITE;
/*!40000 ALTER TABLE `lead_opportunity_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_opportunity_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `legal_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `industry` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_area_id` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `lead_owner` int(11) DEFAULT NULL,
  `next_contact_by` int(11) DEFAULT NULL,
  `next_contact_date` date DEFAULT NULL,
  `lead_purpose` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Phone Penh','','','','','','',1,NULL,NULL,'2017-07-23 05:26:23','2017-07-23 05:26:23'),(2,'Takeo','','','','','','',1,NULL,NULL,'2017-07-23 05:26:28','2017-07-23 05:26:28');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `look_ups`
--

DROP TABLE IF EXISTS `look_ups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `look_ups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `look_ups`
--

LOCK TABLES `look_ups` WRITE;
/*!40000 ALTER TABLE `look_ups` DISABLE KEYS */;
INSERT INTO `look_ups` VALUES (1,'LEAD STATUS','L','Lead',NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(2,'LEAD STATUS','O','Open',NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(3,'LEAD STATUS','R','Reply',NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(4,'LEAD STATUS','OP','Opportunity',NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(5,'LEAD STATUS','I','Interest',NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(6,'LEAD STATUS','C','Converted',NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(7,'LEAD STATUS','N','Not Interest',NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(8,'LEAD STATUS','CA','Cancel',NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(9,'OPPORTUNITY TYPE',NULL,'Open',NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(10,'OPPORTUNITY TYPE',NULL,'Quotation',NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(11,'OPPORTUNITY TYPE',NULL,'Lost',NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(12,'OPPORTUNITY TYPE',NULL,'Replied',NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(13,'OPPORTUNITY TYPE',NULL,'Closed',NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21');
/*!40000 ALTER TABLE `look_ups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_details`
--

DROP TABLE IF EXISTS `maintenance_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maintenance_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `serial_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `multiplier` float DEFAULT NULL,
  `um_id` int(11) DEFAULT NULL,
  `total_qty` float DEFAULT NULL,
  `is_free` tinyint(1) DEFAULT NULL,
  `price` decimal(18,6) DEFAULT NULL,
  `extend_price` decimal(18,6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_details`
--

LOCK TABLES `maintenance_details` WRITE;
/*!40000 ALTER TABLE `maintenance_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances`
--

DROP TABLE IF EXISTS `maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maintenance_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `amount` decimal(18,6) DEFAULT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances`
--

LOCK TABLES `maintenances` WRITE;
/*!40000 ALTER TABLE `maintenances` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `next_versions`
--

DROP TABLE IF EXISTS `next_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `next_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `n_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `next_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `degit` int(11) DEFAULT NULL,
  `is_manaul` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `next_versions`
--

LOCK TABLES `next_versions` WRITE;
/*!40000 ALTER TABLE `next_versions` DISABLE KEYS */;
INSERT INTO `next_versions` VALUES (1,'LEAD','','1',4,0,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(2,'CUSTOMER','','2',4,0,'2017-07-23 05:24:21','2017-07-26 01:00:10'),(3,'SALE ORDER','SO','1',4,1,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(4,'QUOTATION','QT-','1',4,0,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(5,'INVOICE INCLUDE TAX','','1',4,1,'2017-07-23 05:24:21','2017-08-12 12:06:12'),(6,'INVOICE NOT INCLUDE TAX','','4',4,0,'2017-07-23 05:24:21','2017-07-26 14:38:32'),(7,'RECIEPT NOT INCLUDE TAX','','4',4,0,'2017-07-23 05:24:21','2017-07-26 14:39:34'),(8,'ITEM','','3',4,0,'2017-07-23 05:24:21','2017-07-26 14:34:09'),(9,'PURCHASE ORDER',NULL,'1',4,0,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(10,'PURCHASE RECIEVE BILL',NULL,'1',4,0,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(11,'PURCHASE PAYMENT',NULL,'1',4,0,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(12,'ISSUE RENTAL',NULL,'1',4,0,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(13,'ISSUE MAINTENANCE',NULL,'1',4,0,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(14,'RECIEPT INCLUDE TAX','','1',6,0,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(15,'OPPORTUNITY ','','1',4,0,'2017-07-23 05:24:21','2017-07-23 05:24:21');
/*!40000 ALTER TABLE `next_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opening_stock_details`
--

DROP TABLE IF EXISTS `opening_stock_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opening_stock_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opening_stock_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `serial_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `um_id` int(11) DEFAULT NULL,
  `multiplier` decimal(18,6) DEFAULT NULL,
  `total_qty` float DEFAULT NULL,
  `cost` decimal(18,6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opening_stock_details`
--

LOCK TABLES `opening_stock_details` WRITE;
/*!40000 ALTER TABLE `opening_stock_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `opening_stock_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opening_stocks`
--

DROP TABLE IF EXISTS `opening_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opening_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ref_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opening_stocks`
--

LOCK TABLES `opening_stocks` WRITE;
/*!40000 ALTER TABLE `opening_stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `opening_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_terms`
--

DROP TABLE IF EXISTS `payment_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_term_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_term_description` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_terms`
--

LOCK TABLES `payment_terms` WRITE;
/*!40000 ALTER TABLE `payment_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_voucher_details`
--

DROP TABLE IF EXISTS `payment_voucher_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_voucher_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_bill_id` int(11) DEFAULT NULL,
  `amount` decimal(18,6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_voucher_details`
--

LOCK TABLES `payment_voucher_details` WRITE;
/*!40000 ALTER TABLE `payment_voucher_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_voucher_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_vouchers`
--

DROP TABLE IF EXISTS `payment_vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_voucher_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vender_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ref_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` decimal(18,6) DEFAULT NULL,
  `discount_percentag` decimal(18,6) DEFAULT NULL,
  `discount_amount` decimal(18,6) DEFAULT NULL,
  `grand_total_amount` decimal(18,6) DEFAULT NULL,
  `memo` text COLLATE utf8_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_vouchers`
--

LOCK TABLES `payment_vouchers` WRITE;
/*!40000 ALTER TABLE `payment_vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Administrator','For System Adminsdf',0,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(2,'Sale Supervisor','for sale supervisor',0,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(3,'Sale Executive','',0,1,'2017-07-23 05:24:21','2017-07-23 05:24:21');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_bills`
--

DROP TABLE IF EXISTS `purchase_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_order_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `ref_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` decimal(18,6) DEFAULT NULL,
  `discount_percentag` decimal(18,6) DEFAULT NULL,
  `discount_amount` decimal(18,6) DEFAULT NULL,
  `grand_total_amount` decimal(18,6) DEFAULT NULL,
  `memo` text COLLATE utf8_unicode_ci,
  `payment_flag` tinyint(4) DEFAULT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_bills`
--

LOCK TABLES `purchase_bills` WRITE;
/*!40000 ALTER TABLE `purchase_bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_details`
--

DROP TABLE IF EXISTS `purchase_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `qty` decimal(18,6) DEFAULT NULL,
  `um_id` int(11) DEFAULT NULL,
  `total_qty` decimal(18,6) DEFAULT NULL,
  `cost` decimal(18,6) DEFAULT NULL,
  `extend_price` decimal(18,6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_details`
--

LOCK TABLES `purchase_order_details` WRITE;
/*!40000 ALTER TABLE `purchase_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_orders`
--

DROP TABLE IF EXISTS `purchase_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `expect_date` date DEFAULT NULL,
  `ref_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` decimal(18,6) DEFAULT NULL,
  `memo` text COLLATE utf8_unicode_ci,
  `status` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_orders`
--

LOCK TABLES `purchase_orders` WRITE;
/*!40000 ALTER TABLE `purchase_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receive_payment_details`
--

DROP TABLE IF EXISTS `receive_payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receive_payment_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receive_payment_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `amount` decimal(18,6) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receive_payment_details`
--

LOCK TABLES `receive_payment_details` WRITE;
/*!40000 ALTER TABLE `receive_payment_details` DISABLE KEYS */;
INSERT INTO `receive_payment_details` VALUES (1,1,1,24.000000,NULL,NULL,NULL,'2017-07-26 14:35:04','2017-07-26 14:35:04'),(2,1,2,230.000000,NULL,NULL,NULL,'2017-07-26 14:35:04','2017-07-26 14:35:04'),(3,2,3,2.000000,NULL,NULL,NULL,'2017-07-26 14:39:20','2017-07-26 14:39:20'),(4,3,3,8.000000,NULL,NULL,NULL,'2017-07-26 14:39:34','2017-07-26 14:39:34');
/*!40000 ALTER TABLE `receive_payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receive_payments`
--

DROP TABLE IF EXISTS `receive_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receive_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receipt_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `payment_type` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `check_no` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` decimal(18,6) DEFAULT NULL,
  `discount_percentag` decimal(18,6) DEFAULT NULL,
  `discount_amount` decimal(18,6) DEFAULT NULL,
  `grand_total_amount` decimal(18,6) DEFAULT NULL,
  `memo` text COLLATE utf8_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receive_payments`
--

LOCK TABLES `receive_payments` WRITE;
/*!40000 ALTER TABLE `receive_payments` DISABLE KEYS */;
INSERT INTO `receive_payments` VALUES (1,'0001',1,'2017-07-26','CA',NULL,'',254.000000,NULL,NULL,254.000000,'',1,NULL,'2017-07-26 14:35:04','2017-07-26 14:35:04'),(2,'0002',1,'2017-07-26','CA',NULL,'',2.000000,NULL,NULL,2.000000,'',1,NULL,'2017-07-26 14:39:20','2017-07-26 14:39:20'),(3,'0003',1,'2017-07-26','CA',NULL,'',8.000000,NULL,NULL,8.000000,'',1,NULL,'2017-07-26 14:39:34','2017-07-26 14:39:34');
/*!40000 ALTER TABLE `receive_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_menu_roles`
--

DROP TABLE IF EXISTS `rel_menu_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_menu_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_menu_roles`
--

LOCK TABLES `rel_menu_roles` WRITE;
/*!40000 ALTER TABLE `rel_menu_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_menu_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Sale','',1,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(2,'System Admin','Default System Role',1,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_order_details`
--

DROP TABLE IF EXISTS `sale_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `qty` float DEFAULT NULL,
  `um_id` int(11) DEFAULT NULL,
  `total_qty` decimal(18,6) DEFAULT NULL,
  `price` decimal(18,6) DEFAULT NULL,
  `extent_price` decimal(18,6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_order_details`
--

LOCK TABLES `sale_order_details` WRITE;
/*!40000 ALTER TABLE `sale_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_orders`
--

DROP TABLE IF EXISTS `sale_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_order_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `expect_date` date DEFAULT NULL,
  `ref_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` decimal(18,6) DEFAULT NULL,
  `deposit_note` decimal(18,6) DEFAULT NULL,
  `memo` text COLLATE utf8_unicode_ci,
  `status` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_orders`
--

LOCK TABLES `sale_orders` WRITE;
/*!40000 ALTER TABLE `sale_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_quotation_details`
--

DROP TABLE IF EXISTS `sale_quotation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_quotation_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_quotation_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_group_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `qty` float DEFAULT NULL,
  `um_id` int(11) DEFAULT NULL,
  `total_qty` decimal(18,6) DEFAULT NULL,
  `price` decimal(18,6) DEFAULT NULL,
  `extent_price` decimal(18,6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_quotation_details`
--

LOCK TABLES `sale_quotation_details` WRITE;
/*!40000 ALTER TABLE `sale_quotation_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_quotation_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_quotations`
--

DROP TABLE IF EXISTS `sale_quotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_quotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_quotation_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quotation_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `ref_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_term_id` int(11) DEFAULT NULL,
  `payment_term` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sale_representative_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `total_amount` decimal(18,6) DEFAULT NULL,
  `tax_percentag` decimal(18,6) DEFAULT NULL,
  `tax_amount` decimal(18,6) DEFAULT NULL,
  `grand_total_amount` decimal(18,6) DEFAULT NULL,
  `memo` text COLLATE utf8_unicode_ci,
  `status` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_quotations`
--

LOCK TABLES `sale_quotations` WRITE;
/*!40000 ALTER TABLE `sale_quotations` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_quotations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_representatives`
--

DROP TABLE IF EXISTS `sale_representatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_representatives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `remark` text COLLATE utf8_unicode_ci,
  `status` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_representatives`
--

LOCK TABLES `sale_representatives` WRITE;
/*!40000 ALTER TABLE `sale_representatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_representatives` ENABLE KEYS */;
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
INSERT INTO `schema_migrations` VALUES ('1'),('20160208022914'),('20160219064157'),('20160219072645'),('20160219073242'),('20170727113533'),('20170727160749'),('20170727182509'),('20170727184726');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,'c45e808e21c12172964eb4727b95d953','BAh7CUkiEGV4cGlyeV90aW1lBjoGRUZJdToJVGltZQ3lWh2ASY+Gmgc6C29m\nZnNldGkCcGI6CXpvbmVJIggrMDcGOwBUSSIKZmxhc2gGOwBUewdJIgxkaXNj\nYXJkBjsAVFsASSIMZmxhc2hlcwY7AFR7BjoMd2FybmluZ0kiFFlvdSB3YXMg\nbG9nb3V0LgY7AFRJIgx1c2VyX2lkBjsARmkGSSIJdXNlcgY7AEZvOglVc2Vy\nFjoQQGF0dHJpYnV0ZXN7FUkiB2lkBjsAVGkGSSIJY29kZQY7AFRJIggwMDEG\nOwBUSSIOZGF0ZV9qb2luBjsAVFU6CURhdGVbC2kAaQNRfyVpAGkAaQBmDDIy\nOTkxNjFJIg9maXJzdF9uYW1lBjsAVEkiC1N5c3RlbQY7AFRJIg5sYXN0X25h\nbWUGOwBUSSITQWRtaW5pc3RyYXRpb24GOwBUSSIMcm9sZV9pZAY7AFRpB0ki\nEmRlcGFydG1lbnRfaWQGOwBUaQZJIgpwaG9uZQY7AFRJIghOL0EGOwBUSSIK\nZW1haWwGOwBUSSIABjsAVEkiDXVzZXJuYW1lBjsAVEkiCmFkbWluBjsAVEki\nF2VuY3J5cHRlZF9wYXNzd29yZAY7AFRJIh54clhnUFgvWUl4WG43VEE1M2J4\nM0VRPT0KBjsAVEkiDmlzX2FjdGl2ZQY7AFRpBkkiDWlzX2FkbWluBjsAVGkG\nSSIMYWRkcmVzcwY7AFRJIgAGOwBUSSIPY3JlYXRlZF9hdAY7AFRJdTsGDeVa\nHcAAAFBhBjsISSIIVVRDBjsAVEkiD3VwZGF0ZWRfYXQGOwBUSXU7Bg3lWh3A\nAABQYQY7CEkiCFVUQwY7AFQ6EkBjb2x1bW5zX2hhc2h7FUkiB2lkBjsAVG86\nPEFjdGl2ZVJlY29yZDo6Q29ubmVjdGlvbkFkYXB0ZXJzOjpNeXNxbDJBZGFw\ndGVyOjpDb2x1bW4SOgxAc3RyaWN0VDoPQGNvbGxhdGlvbjA6C0BleHRyYUki\nE2F1dG9faW5jcmVtZW50BjsAVDoKQG5hbWVJIgdpZAY7AFQ6DkBzcWxfdHlw\nZUkiDGludCgxMSkGOwBUOgpAbnVsbEY6C0BsaW1pdGkJOg9AcHJlY2lzaW9u\nMDoLQHNjYWxlMDoKQHR5cGU6DGludGVnZXI6DUBkZWZhdWx0MDoNQHByaW1h\ncnlUOgtAY29kZXIwSSIJY29kZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNv\nZGVfY2kGOwBUOxFJIgAGOwBUOxJJIgljb2RlBjsAVDsTSSIRdmFyY2hhcigy\nNTUpBjsAVDsUVDsVaQH/OxYwOxcwOxg6C3N0cmluZzsaMDsbRjscMEkiDmRh\ndGVfam9pbgY7AFRvOw4SOw9UOxAwOxFJIgAGOwBUOxJJIg5kYXRlX2pvaW4G\nOwBUOxNJIglkYXRlBjsAVDsUVDsVMDsWMDsXMDsYOglkYXRlOxowOxtGOxww\nSSIPZmlyc3RfbmFtZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kG\nOwBUOxFJIgAGOwBUOxJJIg9maXJzdF9uYW1lBjsAVDsTSSIRdmFyY2hhcigy\nNTUpBjsAVDsUVDsVaQH/OxYwOxcwOxg7HTsaMDsbRjscMEkiDmxhc3RfbmFt\nZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAGOwBU\nOxJJIg5sYXN0X25hbWUGOwBUOxNJIhF2YXJjaGFyKDI1NSkGOwBUOxRUOxVp\nAf87FjA7FzA7GDsdOxowOxtGOxwwSSIMcm9sZV9pZAY7AFRvOw4SOw9UOxAw\nOxFJIgAGOwBUOxJJIgxyb2xlX2lkBjsAVDsTSSIMaW50KDExKQY7AFQ7FFQ7\nFWkJOxYwOxcwOxg7GTsaMDsbRjscMEkiEmRlcGFydG1lbnRfaWQGOwBUbzsO\nEjsPVDsQMDsRSSIABjsAVDsSSSISZGVwYXJ0bWVudF9pZAY7AFQ7E0kiDGlu\ndCgxMSkGOwBUOxRUOxVpCTsWMDsXMDsYOxk7GjA7G0Y7HDBJIgpwaG9uZQY7\nAFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAGOwBUOxJJ\nIgpwaG9uZQY7AFQ7E0kiEXZhcmNoYXIoMjU1KQY7AFQ7FFQ7FWkB/zsWMDsX\nMDsYOx07GjA7G0Y7HDBJIgplbWFpbAY7AFRvOw4SOw9UOxBJIhR1dGY4X3Vu\naWNvZGVfY2kGOwBUOxFJIgAGOwBUOxJJIgplbWFpbAY7AFQ7E0kiEXZhcmNo\nYXIoMjU1KQY7AFQ7FFQ7FWkB/zsWMDsXMDsYOx07GjA7G0Y7HDBJIg11c2Vy\nbmFtZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAG\nOwBUOxJJIg11c2VybmFtZQY7AFQ7E0kiEXZhcmNoYXIoMjU1KQY7AFQ7FFQ7\nFWkB/zsWMDsXMDsYOx07GjA7G0Y7HDBJIhdlbmNyeXB0ZWRfcGFzc3dvcmQG\nOwBUbzsOEjsPVDsQSSIUdXRmOF91bmljb2RlX2NpBjsAVDsRSSIABjsAVDsS\nSSIXZW5jcnlwdGVkX3Bhc3N3b3JkBjsAVDsTSSIRdmFyY2hhcigyNTUpBjsA\nVDsUVDsVaQH/OxYwOxcwOxg7HTsaMDsbRjscMEkiDmlzX2FjdGl2ZQY7AFRv\nOw4SOw9UOxAwOxFJIgAGOwBUOxJJIg5pc19hY3RpdmUGOwBUOxNJIg90aW55\naW50KDEpBjsAVDsUVDsVaQY7FjA7FzA7GDoMYm9vbGVhbjsaMDsbRjscMEki\nDWlzX2FkbWluBjsAVG87DhI7D1Q7EDA7EUkiAAY7AFQ7EkkiDWlzX2FkbWlu\nBjsAVDsTSSIPdGlueWludCgxKQY7AFQ7FFQ7FWkGOxYwOxcwOxg7HzsaMDsb\nRjscMEkiDGFkZHJlc3MGOwBUbzsOEjsPVDsQSSIUdXRmOF91bmljb2RlX2Np\nBjsAVDsRSSIABjsAVDsSSSIMYWRkcmVzcwY7AFQ7E0kiCXRleHQGOwBUOxRU\nOxUwOxYwOxcwOxg6CXRleHQ7GjA7G0Y7HDBJIg9jcmVhdGVkX2F0BjsAVG86\nPUFjdGl2ZVJlY29yZDo6QXR0cmlidXRlTWV0aG9kczo6VGltZVpvbmVDb252\nZXJzaW9uOjpUeXBlBjoMQGNvbHVtbm87DhI7D1Q7EDA7EUkiAAY7AFQ7Ekki\nD2NyZWF0ZWRfYXQGOwBUOxNJIg1kYXRldGltZQY7AFQ7FFQ7FTA7FjA7FzA7\nGDoNZGF0ZXRpbWU7GjA7G0Y7HDBJIg91cGRhdGVkX2F0BjsAVG87IQY7Im87\nDhI7D1Q7EDA7EUkiAAY7AFQ7EkkiD3VwZGF0ZWRfYXQGOwBUOxNJIg1kYXRl\ndGltZQY7AFQ7FFQ7FTA7FjA7FzA7GDsjOxowOxtGOxwwOhdAYWdncmVnYXRp\nb25fY2FjaGV7ADoXQGFzc29jaWF0aW9uX2NhY2hlewA6FkBhdHRyaWJ1dGVz\nX2NhY2hlewgiF2VuY3J5cHRlZF9wYXNzd29yZEAoIg5pc19hY3RpdmVUIgdp\nZGkGOhhAcHJldmlvdXNseV9jaGFuZ2VkewA6GEBjaGFuZ2VkX2F0dHJpYnV0\nZXN7ADoOQHJlYWRvbmx5RjoPQGRlc3Ryb3llZEY6HEBtYXJrZWRfZm9yX2Rl\nc3RydWN0aW9uRjoeQGRlc3Ryb3llZF9ieV9hc3NvY2lhdGlvbjA6EEBuZXdf\ncmVjb3JkRjoJQHR4bjA6HkBfc3RhcnRfdHJhbnNhY3Rpb25fc3RhdGV7ADoX\nQHRyYW5zYWN0aW9uX3N0YXRlMDoUQHJlZmxlY3RzX3N0YXRlWwZGOg5AcGFz\nc3dvcmRJIgphZG1pbgY7AFQ=\n','2017-07-23 05:24:48','2017-07-23 05:38:40'),(2,'9831c0c38cd3e47a805c45eab03a1934','BAh7CUkiEGV4cGlyeV90aW1lBjoGRUZJdToJVGltZQ3lWh2AIjmRwgc6C29m\nZnNldGkCcGI6CXpvbmVJIggrMDcGOwBUSSIKZmxhc2gGOwBUewdJIgxkaXNj\nYXJkBjsAVFsASSIMZmxhc2hlcwY7AFR7BjoMd2FybmluZ0kiFFlvdSB3YXMg\nbG9nb3V0LgY7AFRJIgx1c2VyX2lkBjsARmkGSSIJdXNlcgY7AEZvOglVc2Vy\nFjoQQGF0dHJpYnV0ZXN7FUkiB2lkBjsAVGkGSSIJY29kZQY7AFRJIggwMDEG\nOwBUSSIOZGF0ZV9qb2luBjsAVFU6CURhdGVbC2kAaQNRfyVpAGkAaQBmDDIy\nOTkxNjFJIg9maXJzdF9uYW1lBjsAVEkiC1N5c3RlbQY7AFRJIg5sYXN0X25h\nbWUGOwBUSSITQWRtaW5pc3RyYXRpb24GOwBUSSIMcm9sZV9pZAY7AFRpB0ki\nEmRlcGFydG1lbnRfaWQGOwBUaQZJIgpwaG9uZQY7AFRJIghOL0EGOwBUSSIK\nZW1haWwGOwBUSSIABjsAVEkiDXVzZXJuYW1lBjsAVEkiCmFkbWluBjsAVEki\nF2VuY3J5cHRlZF9wYXNzd29yZAY7AFRJIh54clhnUFgvWUl4WG43VEE1M2J4\nM0VRPT0KBjsAVEkiDmlzX2FjdGl2ZQY7AFRpBkkiDWlzX2FkbWluBjsAVGkG\nSSIMYWRkcmVzcwY7AFRJIgAGOwBUSSIPY3JlYXRlZF9hdAY7AFRJdTsGDeVa\nHcAAAFBhBjsISSIIVVRDBjsAVEkiD3VwZGF0ZWRfYXQGOwBUSXU7Bg3lWh3A\nAABQYQY7CEkiCFVUQwY7AFQ6EkBjb2x1bW5zX2hhc2h7FUkiB2lkBjsAVG86\nPEFjdGl2ZVJlY29yZDo6Q29ubmVjdGlvbkFkYXB0ZXJzOjpNeXNxbDJBZGFw\ndGVyOjpDb2x1bW4SOgxAc3RyaWN0VDoPQGNvbGxhdGlvbjA6C0BleHRyYUki\nE2F1dG9faW5jcmVtZW50BjsAVDoKQG5hbWVJIgdpZAY7AFQ6DkBzcWxfdHlw\nZUkiDGludCgxMSkGOwBUOgpAbnVsbEY6C0BsaW1pdGkJOg9AcHJlY2lzaW9u\nMDoLQHNjYWxlMDoKQHR5cGU6DGludGVnZXI6DUBkZWZhdWx0MDoNQHByaW1h\ncnlUOgtAY29kZXIwSSIJY29kZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNv\nZGVfY2kGOwBUOxFJIgAGOwBUOxJJIgljb2RlBjsAVDsTSSIRdmFyY2hhcigy\nNTUpBjsAVDsUVDsVaQH/OxYwOxcwOxg6C3N0cmluZzsaMDsbRjscMEkiDmRh\ndGVfam9pbgY7AFRvOw4SOw9UOxAwOxFJIgAGOwBUOxJJIg5kYXRlX2pvaW4G\nOwBUOxNJIglkYXRlBjsAVDsUVDsVMDsWMDsXMDsYOglkYXRlOxowOxtGOxww\nSSIPZmlyc3RfbmFtZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kG\nOwBUOxFJIgAGOwBUOxJJIg9maXJzdF9uYW1lBjsAVDsTSSIRdmFyY2hhcigy\nNTUpBjsAVDsUVDsVaQH/OxYwOxcwOxg7HTsaMDsbRjscMEkiDmxhc3RfbmFt\nZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAGOwBU\nOxJJIg5sYXN0X25hbWUGOwBUOxNJIhF2YXJjaGFyKDI1NSkGOwBUOxRUOxVp\nAf87FjA7FzA7GDsdOxowOxtGOxwwSSIMcm9sZV9pZAY7AFRvOw4SOw9UOxAw\nOxFJIgAGOwBUOxJJIgxyb2xlX2lkBjsAVDsTSSIMaW50KDExKQY7AFQ7FFQ7\nFWkJOxYwOxcwOxg7GTsaMDsbRjscMEkiEmRlcGFydG1lbnRfaWQGOwBUbzsO\nEjsPVDsQMDsRSSIABjsAVDsSSSISZGVwYXJ0bWVudF9pZAY7AFQ7E0kiDGlu\ndCgxMSkGOwBUOxRUOxVpCTsWMDsXMDsYOxk7GjA7G0Y7HDBJIgpwaG9uZQY7\nAFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAGOwBUOxJJ\nIgpwaG9uZQY7AFQ7E0kiEXZhcmNoYXIoMjU1KQY7AFQ7FFQ7FWkB/zsWMDsX\nMDsYOx07GjA7G0Y7HDBJIgplbWFpbAY7AFRvOw4SOw9UOxBJIhR1dGY4X3Vu\naWNvZGVfY2kGOwBUOxFJIgAGOwBUOxJJIgplbWFpbAY7AFQ7E0kiEXZhcmNo\nYXIoMjU1KQY7AFQ7FFQ7FWkB/zsWMDsXMDsYOx07GjA7G0Y7HDBJIg11c2Vy\nbmFtZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAG\nOwBUOxJJIg11c2VybmFtZQY7AFQ7E0kiEXZhcmNoYXIoMjU1KQY7AFQ7FFQ7\nFWkB/zsWMDsXMDsYOx07GjA7G0Y7HDBJIhdlbmNyeXB0ZWRfcGFzc3dvcmQG\nOwBUbzsOEjsPVDsQSSIUdXRmOF91bmljb2RlX2NpBjsAVDsRSSIABjsAVDsS\nSSIXZW5jcnlwdGVkX3Bhc3N3b3JkBjsAVDsTSSIRdmFyY2hhcigyNTUpBjsA\nVDsUVDsVaQH/OxYwOxcwOxg7HTsaMDsbRjscMEkiDmlzX2FjdGl2ZQY7AFRv\nOw4SOw9UOxAwOxFJIgAGOwBUOxJJIg5pc19hY3RpdmUGOwBUOxNJIg90aW55\naW50KDEpBjsAVDsUVDsVaQY7FjA7FzA7GDoMYm9vbGVhbjsaMDsbRjscMEki\nDWlzX2FkbWluBjsAVG87DhI7D1Q7EDA7EUkiAAY7AFQ7EkkiDWlzX2FkbWlu\nBjsAVDsTSSIPdGlueWludCgxKQY7AFQ7FFQ7FWkGOxYwOxcwOxg7HzsaMDsb\nRjscMEkiDGFkZHJlc3MGOwBUbzsOEjsPVDsQSSIUdXRmOF91bmljb2RlX2Np\nBjsAVDsRSSIABjsAVDsSSSIMYWRkcmVzcwY7AFQ7E0kiCXRleHQGOwBUOxRU\nOxUwOxYwOxcwOxg6CXRleHQ7GjA7G0Y7HDBJIg9jcmVhdGVkX2F0BjsAVG86\nPUFjdGl2ZVJlY29yZDo6QXR0cmlidXRlTWV0aG9kczo6VGltZVpvbmVDb252\nZXJzaW9uOjpUeXBlBjoMQGNvbHVtbm87DhI7D1Q7EDA7EUkiAAY7AFQ7Ekki\nD2NyZWF0ZWRfYXQGOwBUOxNJIg1kYXRldGltZQY7AFQ7FFQ7FTA7FjA7FzA7\nGDoNZGF0ZXRpbWU7GjA7G0Y7HDBJIg91cGRhdGVkX2F0BjsAVG87IQY7Im87\nDhI7D1Q7EDA7EUkiAAY7AFQ7EkkiD3VwZGF0ZWRfYXQGOwBUOxNJIg1kYXRl\ndGltZQY7AFQ7FFQ7FTA7FjA7FzA7GDsjOxowOxtGOxwwOhdAYWdncmVnYXRp\nb25fY2FjaGV7ADoXQGFzc29jaWF0aW9uX2NhY2hlewA6FkBhdHRyaWJ1dGVz\nX2NhY2hlewgiF2VuY3J5cHRlZF9wYXNzd29yZEAoIg5pc19hY3RpdmVUIgdp\nZGkGOhhAcHJldmlvdXNseV9jaGFuZ2VkewA6GEBjaGFuZ2VkX2F0dHJpYnV0\nZXN7ADoOQHJlYWRvbmx5RjoPQGRlc3Ryb3llZEY6HEBtYXJrZWRfZm9yX2Rl\nc3RydWN0aW9uRjoeQGRlc3Ryb3llZF9ieV9hc3NvY2lhdGlvbjA6EEBuZXdf\ncmVjb3JkRjoJQHR4bjA6HkBfc3RhcnRfdHJhbnNhY3Rpb25fc3RhdGV7ADoX\nQHRyYW5zYWN0aW9uX3N0YXRlMDoUQHJlZmxlY3RzX3N0YXRlWwZGOg5AcGFz\nc3dvcmRJIgphZG1pbgY7AFQ=\n','2017-07-23 05:44:14','2017-07-23 05:48:41'),(8,'f0ae6b7a015ffe044a61f9eb01fe69f6','BAh7CUkiCmZsYXNoBjoGRVR7B0kiDGRpc2NhcmQGOwBUWwBJIgxmbGFzaGVz\nBjsAVHsGOgx3YXJuaW5nSSIUWW91IHdhcyBsb2dvdXQuBjsAVEkiDHVzZXJf\naWQGOwBGaQZJIgl1c2VyBjsARm86CVVzZXIWOhBAYXR0cmlidXRlc3sVSSIH\naWQGOwBUaQZJIgljb2RlBjsAVEkiCDAwMQY7AFRJIg5kYXRlX2pvaW4GOwBU\nVToJRGF0ZVsLaQBpA1F/JWkAaQBpAGYMMjI5OTE2MUkiD2ZpcnN0X25hbWUG\nOwBUSSILU3lzdGVtBjsAVEkiDmxhc3RfbmFtZQY7AFRJIhNBZG1pbmlzdHJh\ndGlvbgY7AFRJIgxyb2xlX2lkBjsAVGkHSSISZGVwYXJ0bWVudF9pZAY7AFRp\nBkkiCnBob25lBjsAVEkiCE4vQQY7AFRJIgplbWFpbAY7AFRJIgAGOwBUSSIN\ndXNlcm5hbWUGOwBUSSIKYWRtaW4GOwBUSSIXZW5jcnlwdGVkX3Bhc3N3b3Jk\nBjsAVEkiHnhyWGdQWC9ZSXhYbjdUQTUzYngzRVE9PQoGOwBUSSIOaXNfYWN0\naXZlBjsAVGkGSSINaXNfYWRtaW4GOwBUaQZJIgxhZGRyZXNzBjsAVEkiAAY7\nAFRJIg9jcmVhdGVkX2F0BjsAVEl1OglUaW1lDeVaHcAAAFBhBjoJem9uZUki\nCFVUQwY7AFRJIg91cGRhdGVkX2F0BjsAVEl1OwoN5VodwAAAUGEGOwtJIghV\nVEMGOwBUOhJAY29sdW1uc19oYXNoexVJIgdpZAY7AFRvOjxBY3RpdmVSZWNv\ncmQ6OkNvbm5lY3Rpb25BZGFwdGVyczo6TXlzcWwyQWRhcHRlcjo6Q29sdW1u\nEjoMQHN0cmljdFQ6D0Bjb2xsYXRpb24wOgtAZXh0cmFJIhNhdXRvX2luY3Jl\nbWVudAY7AFQ6CkBuYW1lSSIHaWQGOwBUOg5Ac3FsX3R5cGVJIgxpbnQoMTEp\nBjsAVDoKQG51bGxGOgtAbGltaXRpCToPQHByZWNpc2lvbjA6C0BzY2FsZTA6\nCkB0eXBlOgxpbnRlZ2VyOg1AZGVmYXVsdDA6DUBwcmltYXJ5VDoLQGNvZGVy\nMEkiCWNvZGUGOwBUbzsNEjsOVDsPSSIUdXRmOF91bmljb2RlX2NpBjsAVDsQ\nSSIABjsAVDsRSSIJY29kZQY7AFQ7EkkiEXZhcmNoYXIoMjU1KQY7AFQ7E1Q7\nFGkB/zsVMDsWMDsXOgtzdHJpbmc7GTA7GkY7GzBJIg5kYXRlX2pvaW4GOwBU\nbzsNEjsOVDsPMDsQSSIABjsAVDsRSSIOZGF0ZV9qb2luBjsAVDsSSSIJZGF0\nZQY7AFQ7E1Q7FDA7FTA7FjA7FzoJZGF0ZTsZMDsaRjsbMEkiD2ZpcnN0X25h\nbWUGOwBUbzsNEjsOVDsPSSIUdXRmOF91bmljb2RlX2NpBjsAVDsQSSIABjsA\nVDsRSSIPZmlyc3RfbmFtZQY7AFQ7EkkiEXZhcmNoYXIoMjU1KQY7AFQ7E1Q7\nFGkB/zsVMDsWMDsXOxw7GTA7GkY7GzBJIg5sYXN0X25hbWUGOwBUbzsNEjsO\nVDsPSSIUdXRmOF91bmljb2RlX2NpBjsAVDsQSSIABjsAVDsRSSIObGFzdF9u\nYW1lBjsAVDsSSSIRdmFyY2hhcigyNTUpBjsAVDsTVDsUaQH/OxUwOxYwOxc7\nHDsZMDsaRjsbMEkiDHJvbGVfaWQGOwBUbzsNEjsOVDsPMDsQSSIABjsAVDsR\nSSIMcm9sZV9pZAY7AFQ7EkkiDGludCgxMSkGOwBUOxNUOxRpCTsVMDsWMDsX\nOxg7GTA7GkY7GzBJIhJkZXBhcnRtZW50X2lkBjsAVG87DRI7DlQ7DzA7EEki\nAAY7AFQ7EUkiEmRlcGFydG1lbnRfaWQGOwBUOxJJIgxpbnQoMTEpBjsAVDsT\nVDsUaQk7FTA7FjA7FzsYOxkwOxpGOxswSSIKcGhvbmUGOwBUbzsNEjsOVDsP\nSSIUdXRmOF91bmljb2RlX2NpBjsAVDsQSSIABjsAVDsRSSIKcGhvbmUGOwBU\nOxJJIhF2YXJjaGFyKDI1NSkGOwBUOxNUOxRpAf87FTA7FjA7FzscOxkwOxpG\nOxswSSIKZW1haWwGOwBUbzsNEjsOVDsPSSIUdXRmOF91bmljb2RlX2NpBjsA\nVDsQSSIABjsAVDsRSSIKZW1haWwGOwBUOxJJIhF2YXJjaGFyKDI1NSkGOwBU\nOxNUOxRpAf87FTA7FjA7FzscOxkwOxpGOxswSSINdXNlcm5hbWUGOwBUbzsN\nEjsOVDsPSSIUdXRmOF91bmljb2RlX2NpBjsAVDsQSSIABjsAVDsRSSINdXNl\ncm5hbWUGOwBUOxJJIhF2YXJjaGFyKDI1NSkGOwBUOxNUOxRpAf87FTA7FjA7\nFzscOxkwOxpGOxswSSIXZW5jcnlwdGVkX3Bhc3N3b3JkBjsAVG87DRI7DlQ7\nD0kiFHV0ZjhfdW5pY29kZV9jaQY7AFQ7EEkiAAY7AFQ7EUkiF2VuY3J5cHRl\nZF9wYXNzd29yZAY7AFQ7EkkiEXZhcmNoYXIoMjU1KQY7AFQ7E1Q7FGkB/zsV\nMDsWMDsXOxw7GTA7GkY7GzBJIg5pc19hY3RpdmUGOwBUbzsNEjsOVDsPMDsQ\nSSIABjsAVDsRSSIOaXNfYWN0aXZlBjsAVDsSSSIPdGlueWludCgxKQY7AFQ7\nE1Q7FGkGOxUwOxYwOxc6DGJvb2xlYW47GTA7GkY7GzBJIg1pc19hZG1pbgY7\nAFRvOw0SOw5UOw8wOxBJIgAGOwBUOxFJIg1pc19hZG1pbgY7AFQ7EkkiD3Rp\nbnlpbnQoMSkGOwBUOxNUOxRpBjsVMDsWMDsXOx47GTA7GkY7GzBJIgxhZGRy\nZXNzBjsAVG87DRI7DlQ7D0kiFHV0ZjhfdW5pY29kZV9jaQY7AFQ7EEkiAAY7\nAFQ7EUkiDGFkZHJlc3MGOwBUOxJJIgl0ZXh0BjsAVDsTVDsUMDsVMDsWMDsX\nOgl0ZXh0OxkwOxpGOxswSSIPY3JlYXRlZF9hdAY7AFRvOj1BY3RpdmVSZWNv\ncmQ6OkF0dHJpYnV0ZU1ldGhvZHM6OlRpbWVab25lQ29udmVyc2lvbjo6VHlw\nZQY6DEBjb2x1bW5vOw0SOw5UOw8wOxBJIgAGOwBUOxFJIg9jcmVhdGVkX2F0\nBjsAVDsSSSINZGF0ZXRpbWUGOwBUOxNUOxQwOxUwOxYwOxc6DWRhdGV0aW1l\nOxkwOxpGOxswSSIPdXBkYXRlZF9hdAY7AFRvOyAGOyFvOw0SOw5UOw8wOxBJ\nIgAGOwBUOxFJIg91cGRhdGVkX2F0BjsAVDsSSSINZGF0ZXRpbWUGOwBUOxNU\nOxQwOxUwOxYwOxc7IjsZMDsaRjsbMDoXQGFnZ3JlZ2F0aW9uX2NhY2hlewA6\nF0Bhc3NvY2lhdGlvbl9jYWNoZXsAOhZAYXR0cmlidXRlc19jYWNoZXsIIhdl\nbmNyeXB0ZWRfcGFzc3dvcmRAJSIOaXNfYWN0aXZlVCIHaWRpBjoYQHByZXZp\nb3VzbHlfY2hhbmdlZHsAOhhAY2hhbmdlZF9hdHRyaWJ1dGVzewA6DkByZWFk\nb25seUY6D0BkZXN0cm95ZWRGOhxAbWFya2VkX2Zvcl9kZXN0cnVjdGlvbkY6\nHkBkZXN0cm95ZWRfYnlfYXNzb2NpYXRpb24wOhBAbmV3X3JlY29yZEY6CUB0\neG4wOh5AX3N0YXJ0X3RyYW5zYWN0aW9uX3N0YXRlewA6F0B0cmFuc2FjdGlv\nbl9zdGF0ZTA6FEByZWZsZWN0c19zdGF0ZVsGRjoOQHBhc3N3b3JkSSIKYWRt\naW4GOwBUSSIQZXhwaXJ5X3RpbWUGOwBGSXU7Cg1yWx2A+bwDCQc6C29mZnNl\ndGkCcGI7C0kiCCswNwY7AFQ=\n','2017-07-27 17:54:43','2017-07-27 18:02:16'),(9,'3e5b4183c4b638c7b0c9611144f7a8c7','BAh7CUkiEGV4cGlyeV90aW1lBjoGRUZJdToJVGltZQ1zWx2ATjOqCgc6C29m\nZnNldGkCcGI6CXpvbmVJIggrMDcGOwBUSSIKZmxhc2gGOwBUewdJIgxkaXNj\nYXJkBjsAVFsASSIMZmxhc2hlcwY7AFR7BjoMd2FybmluZ0kiFFlvdSB3YXMg\nbG9nb3V0LgY7AFRJIgx1c2VyX2lkBjsARmkGSSIJdXNlcgY7AEZvOglVc2Vy\nFjoQQGF0dHJpYnV0ZXN7FUkiB2lkBjsAVGkGSSIJY29kZQY7AFRJIggwMDEG\nOwBUSSIOZGF0ZV9qb2luBjsAVFU6CURhdGVbC2kAaQNRfyVpAGkAaQBmDDIy\nOTkxNjFJIg9maXJzdF9uYW1lBjsAVEkiC1N5c3RlbQY7AFRJIg5sYXN0X25h\nbWUGOwBUSSITQWRtaW5pc3RyYXRpb24GOwBUSSIMcm9sZV9pZAY7AFRpB0ki\nEmRlcGFydG1lbnRfaWQGOwBUaQZJIgpwaG9uZQY7AFRJIghOL0EGOwBUSSIK\nZW1haWwGOwBUSSIABjsAVEkiDXVzZXJuYW1lBjsAVEkiCmFkbWluBjsAVEki\nF2VuY3J5cHRlZF9wYXNzd29yZAY7AFRJIh54clhnUFgvWUl4WG43VEE1M2J4\nM0VRPT0KBjsAVEkiDmlzX2FjdGl2ZQY7AFRpBkkiDWlzX2FkbWluBjsAVGkG\nSSIMYWRkcmVzcwY7AFRJIgAGOwBUSSIPY3JlYXRlZF9hdAY7AFRJdTsGDeVa\nHcAAAFBhBjsISSIIVVRDBjsAVEkiD3VwZGF0ZWRfYXQGOwBUSXU7Bg3lWh3A\nAABQYQY7CEkiCFVUQwY7AFQ6EkBjb2x1bW5zX2hhc2h7FUkiB2lkBjsAVG86\nPEFjdGl2ZVJlY29yZDo6Q29ubmVjdGlvbkFkYXB0ZXJzOjpNeXNxbDJBZGFw\ndGVyOjpDb2x1bW4SOgxAc3RyaWN0VDoPQGNvbGxhdGlvbjA6C0BleHRyYUki\nE2F1dG9faW5jcmVtZW50BjsAVDoKQG5hbWVJIgdpZAY7AFQ6DkBzcWxfdHlw\nZUkiDGludCgxMSkGOwBUOgpAbnVsbEY6C0BsaW1pdGkJOg9AcHJlY2lzaW9u\nMDoLQHNjYWxlMDoKQHR5cGU6DGludGVnZXI6DUBkZWZhdWx0MDoNQHByaW1h\ncnlUOgtAY29kZXIwSSIJY29kZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNv\nZGVfY2kGOwBUOxFJIgAGOwBUOxJJIgljb2RlBjsAVDsTSSIRdmFyY2hhcigy\nNTUpBjsAVDsUVDsVaQH/OxYwOxcwOxg6C3N0cmluZzsaMDsbRjscMEkiDmRh\ndGVfam9pbgY7AFRvOw4SOw9UOxAwOxFJIgAGOwBUOxJJIg5kYXRlX2pvaW4G\nOwBUOxNJIglkYXRlBjsAVDsUVDsVMDsWMDsXMDsYOglkYXRlOxowOxtGOxww\nSSIPZmlyc3RfbmFtZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kG\nOwBUOxFJIgAGOwBUOxJJIg9maXJzdF9uYW1lBjsAVDsTSSIRdmFyY2hhcigy\nNTUpBjsAVDsUVDsVaQH/OxYwOxcwOxg7HTsaMDsbRjscMEkiDmxhc3RfbmFt\nZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAGOwBU\nOxJJIg5sYXN0X25hbWUGOwBUOxNJIhF2YXJjaGFyKDI1NSkGOwBUOxRUOxVp\nAf87FjA7FzA7GDsdOxowOxtGOxwwSSIMcm9sZV9pZAY7AFRvOw4SOw9UOxAw\nOxFJIgAGOwBUOxJJIgxyb2xlX2lkBjsAVDsTSSIMaW50KDExKQY7AFQ7FFQ7\nFWkJOxYwOxcwOxg7GTsaMDsbRjscMEkiEmRlcGFydG1lbnRfaWQGOwBUbzsO\nEjsPVDsQMDsRSSIABjsAVDsSSSISZGVwYXJ0bWVudF9pZAY7AFQ7E0kiDGlu\ndCgxMSkGOwBUOxRUOxVpCTsWMDsXMDsYOxk7GjA7G0Y7HDBJIgpwaG9uZQY7\nAFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAGOwBUOxJJ\nIgpwaG9uZQY7AFQ7E0kiEXZhcmNoYXIoMjU1KQY7AFQ7FFQ7FWkB/zsWMDsX\nMDsYOx07GjA7G0Y7HDBJIgplbWFpbAY7AFRvOw4SOw9UOxBJIhR1dGY4X3Vu\naWNvZGVfY2kGOwBUOxFJIgAGOwBUOxJJIgplbWFpbAY7AFQ7E0kiEXZhcmNo\nYXIoMjU1KQY7AFQ7FFQ7FWkB/zsWMDsXMDsYOx07GjA7G0Y7HDBJIg11c2Vy\nbmFtZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAG\nOwBUOxJJIg11c2VybmFtZQY7AFQ7E0kiEXZhcmNoYXIoMjU1KQY7AFQ7FFQ7\nFWkB/zsWMDsXMDsYOx07GjA7G0Y7HDBJIhdlbmNyeXB0ZWRfcGFzc3dvcmQG\nOwBUbzsOEjsPVDsQSSIUdXRmOF91bmljb2RlX2NpBjsAVDsRSSIABjsAVDsS\nSSIXZW5jcnlwdGVkX3Bhc3N3b3JkBjsAVDsTSSIRdmFyY2hhcigyNTUpBjsA\nVDsUVDsVaQH/OxYwOxcwOxg7HTsaMDsbRjscMEkiDmlzX2FjdGl2ZQY7AFRv\nOw4SOw9UOxAwOxFJIgAGOwBUOxJJIg5pc19hY3RpdmUGOwBUOxNJIg90aW55\naW50KDEpBjsAVDsUVDsVaQY7FjA7FzA7GDoMYm9vbGVhbjsaMDsbRjscMEki\nDWlzX2FkbWluBjsAVG87DhI7D1Q7EDA7EUkiAAY7AFQ7EkkiDWlzX2FkbWlu\nBjsAVDsTSSIPdGlueWludCgxKQY7AFQ7FFQ7FWkGOxYwOxcwOxg7HzsaMDsb\nRjscMEkiDGFkZHJlc3MGOwBUbzsOEjsPVDsQSSIUdXRmOF91bmljb2RlX2Np\nBjsAVDsRSSIABjsAVDsSSSIMYWRkcmVzcwY7AFQ7E0kiCXRleHQGOwBUOxRU\nOxUwOxYwOxcwOxg6CXRleHQ7GjA7G0Y7HDBJIg9jcmVhdGVkX2F0BjsAVG86\nPUFjdGl2ZVJlY29yZDo6QXR0cmlidXRlTWV0aG9kczo6VGltZVpvbmVDb252\nZXJzaW9uOjpUeXBlBjoMQGNvbHVtbm87DhI7D1Q7EDA7EUkiAAY7AFQ7Ekki\nD2NyZWF0ZWRfYXQGOwBUOxNJIg1kYXRldGltZQY7AFQ7FFQ7FTA7FjA7FzA7\nGDoNZGF0ZXRpbWU7GjA7G0Y7HDBJIg91cGRhdGVkX2F0BjsAVG87IQY7Im87\nDhI7D1Q7EDA7EUkiAAY7AFQ7EkkiD3VwZGF0ZWRfYXQGOwBUOxNJIg1kYXRl\ndGltZQY7AFQ7FFQ7FTA7FjA7FzA7GDsjOxowOxtGOxwwOhdAYWdncmVnYXRp\nb25fY2FjaGV7ADoXQGFzc29jaWF0aW9uX2NhY2hlewA6FkBhdHRyaWJ1dGVz\nX2NhY2hlewgiF2VuY3J5cHRlZF9wYXNzd29yZEAoIg5pc19hY3RpdmVUIgdp\nZGkGOhhAcHJldmlvdXNseV9jaGFuZ2VkewA6GEBjaGFuZ2VkX2F0dHJpYnV0\nZXN7ADoOQHJlYWRvbmx5RjoPQGRlc3Ryb3llZEY6HEBtYXJrZWRfZm9yX2Rl\nc3RydWN0aW9uRjoeQGRlc3Ryb3llZF9ieV9hc3NvY2lhdGlvbjA6EEBuZXdf\ncmVjb3JkRjoJQHR4bjA6HkBfc3RhcnRfdHJhbnNhY3Rpb25fc3RhdGV7ADoX\nQHRyYW5zYWN0aW9uX3N0YXRlMDoUQHJlZmxlY3RzX3N0YXRlWwZGOg5AcGFz\nc3dvcmRJIgphZG1pbgY7AFQ=\n','2017-07-27 18:07:42','2017-07-27 19:02:42'),(11,'ed47e8acea1e20eca0df2f29c8577b17','BAh7BkkiCmZsYXNoBjoGRVR7B0kiDGRpc2NhcmQGOwBUWwBJIgxmbGFzaGVz\nBjsAVHsGOgx3YXJuaW5nSSIUWW91IHdhcyBsb2dvdXQuBjsAVA==\n','2017-07-28 08:37:44','2017-07-28 08:37:44'),(12,'5d33dd1c4b7b419da451f321b3f9bee9','BAh7B0kiEGV4cGlyeV90aW1lBjoGRUZJdToJVGltZQ2IWx2AMyrPlgc6C29m\nZnNldGkCcGI6CXpvbmVJIggrMDcGOwBUSSIKZmxhc2gGOwBUewdJIgxkaXNj\nYXJkBjsAVFsASSIMZmxhc2hlcwY7AFR7BjoMd2FybmluZ0kiFFlvdSB3YXMg\nbG9nb3V0LgY7AFQ=\n','2017-07-28 08:37:44','2017-07-28 08:37:44'),(13,'a5ffc9eb6c2d3d638fc73d19ab1bbfce','BAh7B0kiEGV4cGlyeV90aW1lBjoGRUZJdToJVGltZQ2IWx2AxBLQlgc6C29m\nZnNldGkCcGI6CXpvbmVJIggrMDcGOwBUSSIKZmxhc2gGOwBUewdJIgxkaXNj\nYXJkBjsAVFsASSIMZmxhc2hlcwY7AFR7BjoMd2FybmluZ0kiFFlvdSB3YXMg\nbG9nb3V0LgY7AFQ=\n','2017-07-28 08:37:45','2017-07-28 08:37:45'),(14,'34867579157811d22a40708838ae5a52','BAh7B0kiEGV4cGlyeV90aW1lBjoGRUZJdToJVGltZQ2IWx2AjknQlgc6C29m\nZnNldGkCcGI6CXpvbmVJIggrMDcGOwBUSSIKZmxhc2gGOwBUewdJIgxkaXNj\nYXJkBjsAVFsASSIMZmxhc2hlcwY7AFR7BjoMd2FybmluZ0kiFFlvdSB3YXMg\nbG9nb3V0LgY7AFQ=\n','2017-07-28 08:37:45','2017-07-28 08:37:45'),(15,'2925d00e24ee1ff8007b5b0ee7d3fcb0','BAh7B0kiEGV4cGlyeV90aW1lBjoGRUZJdToJVGltZQ2IWx2AIXrQlgc6C29m\nZnNldGkCcGI6CXpvbmVJIggrMDcGOwBUSSIKZmxhc2gGOwBUewdJIgxkaXNj\nYXJkBjsAVFsASSIMZmxhc2hlcwY7AFR7BjoMd2FybmluZ0kiFFlvdSB3YXMg\nbG9nb3V0LgY7AFQ=\n','2017-07-28 08:37:45','2017-07-28 08:37:45'),(16,'d545faebe19cbec31beb92527fa93db7','BAh7B0kiEGV4cGlyeV90aW1lBjoGRUZJdToJVGltZQ2IWx2A9aLQlgc6CXpv\nbmVJIggrMDcGOwBUOgtvZmZzZXRpAnBiSSIKZmxhc2gGOwBUewdJIgxkaXNj\nYXJkBjsAVFsASSIMZmxhc2hlcwY7AFR7BjoMd2FybmluZ0kiFFlvdSB3YXMg\nbG9nb3V0LgY7AFQ=\n','2017-07-28 08:37:45','2017-07-28 08:37:45'),(17,'29b71f7e2e91e46a4fb83d8ed6a81c33','BAh7CUkiEGV4cGlyeV90aW1lBjoGRUZJdToJVGltZQ2IWx2AzKybrAc6C29m\nZnNldGkCcGI6CXpvbmVJIggrMDcGOwBUSSIKZmxhc2gGOwBUewdJIgxkaXNj\nYXJkBjsAVFsASSIMZmxhc2hlcwY7AFR7BjoMd2FybmluZ0kiFFlvdSB3YXMg\nbG9nb3V0LgY7AFRJIgx1c2VyX2lkBjsARmkGSSIJdXNlcgY7AEZvOglVc2Vy\nFjoQQGF0dHJpYnV0ZXN7FUkiB2lkBjsAVGkGSSIJY29kZQY7AFRJIggwMDEG\nOwBUSSIOZGF0ZV9qb2luBjsAVFU6CURhdGVbC2kAaQNRfyVpAGkAaQBmDDIy\nOTkxNjFJIg9maXJzdF9uYW1lBjsAVEkiC1N5c3RlbQY7AFRJIg5sYXN0X25h\nbWUGOwBUSSITQWRtaW5pc3RyYXRpb24GOwBUSSIMcm9sZV9pZAY7AFRpB0ki\nEmRlcGFydG1lbnRfaWQGOwBUaQZJIgpwaG9uZQY7AFRJIghOL0EGOwBUSSIK\nZW1haWwGOwBUSSIABjsAVEkiDXVzZXJuYW1lBjsAVEkiCmFkbWluBjsAVEki\nF2VuY3J5cHRlZF9wYXNzd29yZAY7AFRJIh54clhnUFgvWUl4WG43VEE1M2J4\nM0VRPT0KBjsAVEkiDmlzX2FjdGl2ZQY7AFRpBkkiDWlzX2FkbWluBjsAVGkG\nSSIMYWRkcmVzcwY7AFRJIgAGOwBUSSIPY3JlYXRlZF9hdAY7AFRJdTsGDeVa\nHcAAAFBhBjsISSIIVVRDBjsAVEkiD3VwZGF0ZWRfYXQGOwBUSXU7Bg3lWh3A\nAABQYQY7CEkiCFVUQwY7AFQ6EkBjb2x1bW5zX2hhc2h7FUkiB2lkBjsAVG86\nPEFjdGl2ZVJlY29yZDo6Q29ubmVjdGlvbkFkYXB0ZXJzOjpNeXNxbDJBZGFw\ndGVyOjpDb2x1bW4SOgxAc3RyaWN0VDoPQGNvbGxhdGlvbjA6C0BleHRyYUki\nE2F1dG9faW5jcmVtZW50BjsAVDoKQG5hbWVJIgdpZAY7AFQ6DkBzcWxfdHlw\nZUkiDGludCgxMSkGOwBUOgpAbnVsbEY6C0BsaW1pdGkJOg9AcHJlY2lzaW9u\nMDoLQHNjYWxlMDoKQHR5cGU6DGludGVnZXI6DUBkZWZhdWx0MDoNQHByaW1h\ncnlUOgtAY29kZXIwSSIJY29kZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNv\nZGVfY2kGOwBUOxFJIgAGOwBUOxJJIgljb2RlBjsAVDsTSSIRdmFyY2hhcigy\nNTUpBjsAVDsUVDsVaQH/OxYwOxcwOxg6C3N0cmluZzsaMDsbRjscMEkiDmRh\ndGVfam9pbgY7AFRvOw4SOw9UOxAwOxFJIgAGOwBUOxJJIg5kYXRlX2pvaW4G\nOwBUOxNJIglkYXRlBjsAVDsUVDsVMDsWMDsXMDsYOglkYXRlOxowOxtGOxww\nSSIPZmlyc3RfbmFtZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kG\nOwBUOxFJIgAGOwBUOxJJIg9maXJzdF9uYW1lBjsAVDsTSSIRdmFyY2hhcigy\nNTUpBjsAVDsUVDsVaQH/OxYwOxcwOxg7HTsaMDsbRjscMEkiDmxhc3RfbmFt\nZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAGOwBU\nOxJJIg5sYXN0X25hbWUGOwBUOxNJIhF2YXJjaGFyKDI1NSkGOwBUOxRUOxVp\nAf87FjA7FzA7GDsdOxowOxtGOxwwSSIMcm9sZV9pZAY7AFRvOw4SOw9UOxAw\nOxFJIgAGOwBUOxJJIgxyb2xlX2lkBjsAVDsTSSIMaW50KDExKQY7AFQ7FFQ7\nFWkJOxYwOxcwOxg7GTsaMDsbRjscMEkiEmRlcGFydG1lbnRfaWQGOwBUbzsO\nEjsPVDsQMDsRSSIABjsAVDsSSSISZGVwYXJ0bWVudF9pZAY7AFQ7E0kiDGlu\ndCgxMSkGOwBUOxRUOxVpCTsWMDsXMDsYOxk7GjA7G0Y7HDBJIgpwaG9uZQY7\nAFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAGOwBUOxJJ\nIgpwaG9uZQY7AFQ7E0kiEXZhcmNoYXIoMjU1KQY7AFQ7FFQ7FWkB/zsWMDsX\nMDsYOx07GjA7G0Y7HDBJIgplbWFpbAY7AFRvOw4SOw9UOxBJIhR1dGY4X3Vu\naWNvZGVfY2kGOwBUOxFJIgAGOwBUOxJJIgplbWFpbAY7AFQ7E0kiEXZhcmNo\nYXIoMjU1KQY7AFQ7FFQ7FWkB/zsWMDsXMDsYOx07GjA7G0Y7HDBJIg11c2Vy\nbmFtZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAG\nOwBUOxJJIg11c2VybmFtZQY7AFQ7E0kiEXZhcmNoYXIoMjU1KQY7AFQ7FFQ7\nFWkB/zsWMDsXMDsYOx07GjA7G0Y7HDBJIhdlbmNyeXB0ZWRfcGFzc3dvcmQG\nOwBUbzsOEjsPVDsQSSIUdXRmOF91bmljb2RlX2NpBjsAVDsRSSIABjsAVDsS\nSSIXZW5jcnlwdGVkX3Bhc3N3b3JkBjsAVDsTSSIRdmFyY2hhcigyNTUpBjsA\nVDsUVDsVaQH/OxYwOxcwOxg7HTsaMDsbRjscMEkiDmlzX2FjdGl2ZQY7AFRv\nOw4SOw9UOxAwOxFJIgAGOwBUOxJJIg5pc19hY3RpdmUGOwBUOxNJIg90aW55\naW50KDEpBjsAVDsUVDsVaQY7FjA7FzA7GDoMYm9vbGVhbjsaMDsbRjscMEki\nDWlzX2FkbWluBjsAVG87DhI7D1Q7EDA7EUkiAAY7AFQ7EkkiDWlzX2FkbWlu\nBjsAVDsTSSIPdGlueWludCgxKQY7AFQ7FFQ7FWkGOxYwOxcwOxg7HzsaMDsb\nRjscMEkiDGFkZHJlc3MGOwBUbzsOEjsPVDsQSSIUdXRmOF91bmljb2RlX2Np\nBjsAVDsRSSIABjsAVDsSSSIMYWRkcmVzcwY7AFQ7E0kiCXRleHQGOwBUOxRU\nOxUwOxYwOxcwOxg6CXRleHQ7GjA7G0Y7HDBJIg9jcmVhdGVkX2F0BjsAVG86\nPUFjdGl2ZVJlY29yZDo6QXR0cmlidXRlTWV0aG9kczo6VGltZVpvbmVDb252\nZXJzaW9uOjpUeXBlBjoMQGNvbHVtbm87DhI7D1Q7EDA7EUkiAAY7AFQ7Ekki\nD2NyZWF0ZWRfYXQGOwBUOxNJIg1kYXRldGltZQY7AFQ7FFQ7FTA7FjA7FzA7\nGDoNZGF0ZXRpbWU7GjA7G0Y7HDBJIg91cGRhdGVkX2F0BjsAVG87IQY7Im87\nDhI7D1Q7EDA7EUkiAAY7AFQ7EkkiD3VwZGF0ZWRfYXQGOwBUOxNJIg1kYXRl\ndGltZQY7AFQ7FFQ7FTA7FjA7FzA7GDsjOxowOxtGOxwwOhdAYWdncmVnYXRp\nb25fY2FjaGV7ADoXQGFzc29jaWF0aW9uX2NhY2hlewA6FkBhdHRyaWJ1dGVz\nX2NhY2hlewgiF2VuY3J5cHRlZF9wYXNzd29yZEAoIg5pc19hY3RpdmVUIgdp\nZGkGOhhAcHJldmlvdXNseV9jaGFuZ2VkewA6GEBjaGFuZ2VkX2F0dHJpYnV0\nZXN7ADoOQHJlYWRvbmx5RjoPQGRlc3Ryb3llZEY6HEBtYXJrZWRfZm9yX2Rl\nc3RydWN0aW9uRjoeQGRlc3Ryb3llZF9ieV9hc3NvY2lhdGlvbjA6EEBuZXdf\ncmVjb3JkRjoJQHR4bjA6HkBfc3RhcnRfdHJhbnNhY3Rpb25fc3RhdGV7ADoX\nQHRyYW5zYWN0aW9uX3N0YXRlMDoUQHJlZmxlY3RzX3N0YXRlWwZGOg5AcGFz\nc3dvcmRJIgphZG1pbgY7AFQ=\n','2017-07-28 08:37:45','2017-07-28 08:43:09'),(18,'975ab178da829c955eebdf5b13a7f6de','BAh7CUkiEGV4cGlyeV90aW1lBjoGRUZJdToJVGltZQ2MXR2AQQNMGQc6C29m\nZnNldGkCcGI6CXpvbmVJIggrMDcGOwBUSSIKZmxhc2gGOwBUewdJIgxkaXNj\nYXJkBjsAVFsASSIMZmxhc2hlcwY7AFR7BjoMd2FybmluZ0kiFFlvdSB3YXMg\nbG9nb3V0LgY7AFRJIgx1c2VyX2lkBjsARmkGSSIJdXNlcgY7AEZvOglVc2Vy\nFjoQQGF0dHJpYnV0ZXN7FUkiB2lkBjsAVGkGSSIJY29kZQY7AFRJIggwMDEG\nOwBUSSIOZGF0ZV9qb2luBjsAVFU6CURhdGVbC2kAaQNRfyVpAGkAaQBmDDIy\nOTkxNjFJIg9maXJzdF9uYW1lBjsAVEkiC1N5c3RlbQY7AFRJIg5sYXN0X25h\nbWUGOwBUSSITQWRtaW5pc3RyYXRpb24GOwBUSSIMcm9sZV9pZAY7AFRpB0ki\nEmRlcGFydG1lbnRfaWQGOwBUaQZJIgpwaG9uZQY7AFRJIghOL0EGOwBUSSIK\nZW1haWwGOwBUSSIABjsAVEkiDXVzZXJuYW1lBjsAVEkiCmFkbWluBjsAVEki\nF2VuY3J5cHRlZF9wYXNzd29yZAY7AFRJIh54clhnUFgvWUl4WG43VEE1M2J4\nM0VRPT0KBjsAVEkiDmlzX2FjdGl2ZQY7AFRpBkkiDWlzX2FkbWluBjsAVGkG\nSSIMYWRkcmVzcwY7AFRJIgAGOwBUSSIPY3JlYXRlZF9hdAY7AFRJdTsGDeVa\nHcAAAFBhBjsISSIIVVRDBjsAVEkiD3VwZGF0ZWRfYXQGOwBUSXU7Bg3lWh3A\nAABQYQY7CEkiCFVUQwY7AFQ6EkBjb2x1bW5zX2hhc2h7FUkiB2lkBjsAVG86\nPEFjdGl2ZVJlY29yZDo6Q29ubmVjdGlvbkFkYXB0ZXJzOjpNeXNxbDJBZGFw\ndGVyOjpDb2x1bW4SOgxAc3RyaWN0VDoPQGNvbGxhdGlvbjA6C0BleHRyYUki\nE2F1dG9faW5jcmVtZW50BjsAVDoKQG5hbWVJIgdpZAY7AFQ6DkBzcWxfdHlw\nZUkiDGludCgxMSkGOwBUOgpAbnVsbEY6C0BsaW1pdGkJOg9AcHJlY2lzaW9u\nMDoLQHNjYWxlMDoKQHR5cGU6DGludGVnZXI6DUBkZWZhdWx0MDoNQHByaW1h\ncnlUOgtAY29kZXIwSSIJY29kZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNv\nZGVfY2kGOwBUOxFJIgAGOwBUOxJJIgljb2RlBjsAVDsTSSIRdmFyY2hhcigy\nNTUpBjsAVDsUVDsVaQH/OxYwOxcwOxg6C3N0cmluZzsaMDsbRjscMEkiDmRh\ndGVfam9pbgY7AFRvOw4SOw9UOxAwOxFJIgAGOwBUOxJJIg5kYXRlX2pvaW4G\nOwBUOxNJIglkYXRlBjsAVDsUVDsVMDsWMDsXMDsYOglkYXRlOxowOxtGOxww\nSSIPZmlyc3RfbmFtZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kG\nOwBUOxFJIgAGOwBUOxJJIg9maXJzdF9uYW1lBjsAVDsTSSIRdmFyY2hhcigy\nNTUpBjsAVDsUVDsVaQH/OxYwOxcwOxg7HTsaMDsbRjscMEkiDmxhc3RfbmFt\nZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAGOwBU\nOxJJIg5sYXN0X25hbWUGOwBUOxNJIhF2YXJjaGFyKDI1NSkGOwBUOxRUOxVp\nAf87FjA7FzA7GDsdOxowOxtGOxwwSSIMcm9sZV9pZAY7AFRvOw4SOw9UOxAw\nOxFJIgAGOwBUOxJJIgxyb2xlX2lkBjsAVDsTSSIMaW50KDExKQY7AFQ7FFQ7\nFWkJOxYwOxcwOxg7GTsaMDsbRjscMEkiEmRlcGFydG1lbnRfaWQGOwBUbzsO\nEjsPVDsQMDsRSSIABjsAVDsSSSISZGVwYXJ0bWVudF9pZAY7AFQ7E0kiDGlu\ndCgxMSkGOwBUOxRUOxVpCTsWMDsXMDsYOxk7GjA7G0Y7HDBJIgpwaG9uZQY7\nAFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAGOwBUOxJJ\nIgpwaG9uZQY7AFQ7E0kiEXZhcmNoYXIoMjU1KQY7AFQ7FFQ7FWkB/zsWMDsX\nMDsYOx07GjA7G0Y7HDBJIgplbWFpbAY7AFRvOw4SOw9UOxBJIhR1dGY4X3Vu\naWNvZGVfY2kGOwBUOxFJIgAGOwBUOxJJIgplbWFpbAY7AFQ7E0kiEXZhcmNo\nYXIoMjU1KQY7AFQ7FFQ7FWkB/zsWMDsXMDsYOx07GjA7G0Y7HDBJIg11c2Vy\nbmFtZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAG\nOwBUOxJJIg11c2VybmFtZQY7AFQ7E0kiEXZhcmNoYXIoMjU1KQY7AFQ7FFQ7\nFWkB/zsWMDsXMDsYOx07GjA7G0Y7HDBJIhdlbmNyeXB0ZWRfcGFzc3dvcmQG\nOwBUbzsOEjsPVDsQSSIUdXRmOF91bmljb2RlX2NpBjsAVDsRSSIABjsAVDsS\nSSIXZW5jcnlwdGVkX3Bhc3N3b3JkBjsAVDsTSSIRdmFyY2hhcigyNTUpBjsA\nVDsUVDsVaQH/OxYwOxcwOxg7HTsaMDsbRjscMEkiDmlzX2FjdGl2ZQY7AFRv\nOw4SOw9UOxAwOxFJIgAGOwBUOxJJIg5pc19hY3RpdmUGOwBUOxNJIg90aW55\naW50KDEpBjsAVDsUVDsVaQY7FjA7FzA7GDoMYm9vbGVhbjsaMDsbRjscMEki\nDWlzX2FkbWluBjsAVG87DhI7D1Q7EDA7EUkiAAY7AFQ7EkkiDWlzX2FkbWlu\nBjsAVDsTSSIPdGlueWludCgxKQY7AFQ7FFQ7FWkGOxYwOxcwOxg7HzsaMDsb\nRjscMEkiDGFkZHJlc3MGOwBUbzsOEjsPVDsQSSIUdXRmOF91bmljb2RlX2Np\nBjsAVDsRSSIABjsAVDsSSSIMYWRkcmVzcwY7AFQ7E0kiCXRleHQGOwBUOxRU\nOxUwOxYwOxcwOxg6CXRleHQ7GjA7G0Y7HDBJIg9jcmVhdGVkX2F0BjsAVG86\nPUFjdGl2ZVJlY29yZDo6QXR0cmlidXRlTWV0aG9kczo6VGltZVpvbmVDb252\nZXJzaW9uOjpUeXBlBjoMQGNvbHVtbm87DhI7D1Q7EDA7EUkiAAY7AFQ7Ekki\nD2NyZWF0ZWRfYXQGOwBUOxNJIg1kYXRldGltZQY7AFQ7FFQ7FTA7FjA7FzA7\nGDoNZGF0ZXRpbWU7GjA7G0Y7HDBJIg91cGRhdGVkX2F0BjsAVG87IQY7Im87\nDhI7D1Q7EDA7EUkiAAY7AFQ7EkkiD3VwZGF0ZWRfYXQGOwBUOxNJIg1kYXRl\ndGltZQY7AFQ7FFQ7FTA7FjA7FzA7GDsjOxowOxtGOxwwOhdAYWdncmVnYXRp\nb25fY2FjaGV7ADoXQGFzc29jaWF0aW9uX2NhY2hlewA6FkBhdHRyaWJ1dGVz\nX2NhY2hlewgiF2VuY3J5cHRlZF9wYXNzd29yZEAoIg5pc19hY3RpdmVUIgdp\nZGkGOhhAcHJldmlvdXNseV9jaGFuZ2VkewA6GEBjaGFuZ2VkX2F0dHJpYnV0\nZXN7ADoOQHJlYWRvbmx5RjoPQGRlc3Ryb3llZEY6HEBtYXJrZWRfZm9yX2Rl\nc3RydWN0aW9uRjoeQGRlc3Ryb3llZF9ieV9hc3NvY2lhdGlvbjA6EEBuZXdf\ncmVjb3JkRjoJQHR4bjA6HkBfc3RhcnRfdHJhbnNhY3Rpb25fc3RhdGV7ADoX\nQHRyYW5zYWN0aW9uX3N0YXRlMDoUQHJlZmxlY3RzX3N0YXRlWwZGOg5AcGFz\nc3dvcmRJIgphZG1pbgY7AFQ=\n','2017-08-12 12:04:14','2017-08-12 12:06:20'),(19,'60190cb1be84d2bbcabd18294c4dffe0','BAh7B0kiEGV4cGlyeV90aW1lBjoGRUZJdToJVGltZQ1mXh2A1BJ3swc6CXpv\nbmVJIggrMDcGOwBUOgtvZmZzZXRpAnBiSSIKZmxhc2gGOwBUewdJIgxkaXNj\nYXJkBjsAVFsASSIMZmxhc2hlcwY7AFR7BjoMd2FybmluZ0kiFFlvdSB3YXMg\nbG9nb3V0LgY7AFQ=\n','2017-08-19 06:44:55','2017-08-19 06:44:55'),(20,'38af493cc33638675107dc185e594821','BAh7CUkiEGV4cGlyeV90aW1lBjoGRUZJdToJVGltZQ1mXh2Avz8rwAc6C29m\nZnNldGkCcGI6CXpvbmVJIggrMDcGOwBUSSIKZmxhc2gGOwBUewdJIgxkaXNj\nYXJkBjsAVFsASSIMZmxhc2hlcwY7AFR7BjoMd2FybmluZ0kiFFlvdSB3YXMg\nbG9nb3V0LgY7AFRJIgx1c2VyX2lkBjsARmkGSSIJdXNlcgY7AEZvOglVc2Vy\nFjoQQGF0dHJpYnV0ZXN7FUkiB2lkBjsAVGkGSSIJY29kZQY7AFRJIggwMDEG\nOwBUSSIOZGF0ZV9qb2luBjsAVFU6CURhdGVbC2kAaQNRfyVpAGkAaQBmDDIy\nOTkxNjFJIg9maXJzdF9uYW1lBjsAVEkiC1N5c3RlbQY7AFRJIg5sYXN0X25h\nbWUGOwBUSSITQWRtaW5pc3RyYXRpb24GOwBUSSIMcm9sZV9pZAY7AFRpB0ki\nEmRlcGFydG1lbnRfaWQGOwBUaQZJIgpwaG9uZQY7AFRJIghOL0EGOwBUSSIK\nZW1haWwGOwBUSSIABjsAVEkiDXVzZXJuYW1lBjsAVEkiCmFkbWluBjsAVEki\nF2VuY3J5cHRlZF9wYXNzd29yZAY7AFRJIh54clhnUFgvWUl4WG43VEE1M2J4\nM0VRPT0KBjsAVEkiDmlzX2FjdGl2ZQY7AFRpBkkiDWlzX2FkbWluBjsAVGkG\nSSIMYWRkcmVzcwY7AFRJIgAGOwBUSSIPY3JlYXRlZF9hdAY7AFRJdTsGDeVa\nHcAAAFBhBjsISSIIVVRDBjsAVEkiD3VwZGF0ZWRfYXQGOwBUSXU7Bg3lWh3A\nAABQYQY7CEkiCFVUQwY7AFQ6EkBjb2x1bW5zX2hhc2h7FUkiB2lkBjsAVG86\nPEFjdGl2ZVJlY29yZDo6Q29ubmVjdGlvbkFkYXB0ZXJzOjpNeXNxbDJBZGFw\ndGVyOjpDb2x1bW4SOgxAc3RyaWN0VDoPQGNvbGxhdGlvbjA6C0BleHRyYUki\nE2F1dG9faW5jcmVtZW50BjsAVDoKQG5hbWVJIgdpZAY7AFQ6DkBzcWxfdHlw\nZUkiDGludCgxMSkGOwBUOgpAbnVsbEY6C0BsaW1pdGkJOg9AcHJlY2lzaW9u\nMDoLQHNjYWxlMDoKQHR5cGU6DGludGVnZXI6DUBkZWZhdWx0MDoNQHByaW1h\ncnlUOgtAY29kZXIwSSIJY29kZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNv\nZGVfY2kGOwBUOxFJIgAGOwBUOxJJIgljb2RlBjsAVDsTSSIRdmFyY2hhcigy\nNTUpBjsAVDsUVDsVaQH/OxYwOxcwOxg6C3N0cmluZzsaMDsbRjscMEkiDmRh\ndGVfam9pbgY7AFRvOw4SOw9UOxAwOxFJIgAGOwBUOxJJIg5kYXRlX2pvaW4G\nOwBUOxNJIglkYXRlBjsAVDsUVDsVMDsWMDsXMDsYOglkYXRlOxowOxtGOxww\nSSIPZmlyc3RfbmFtZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kG\nOwBUOxFJIgAGOwBUOxJJIg9maXJzdF9uYW1lBjsAVDsTSSIRdmFyY2hhcigy\nNTUpBjsAVDsUVDsVaQH/OxYwOxcwOxg7HTsaMDsbRjscMEkiDmxhc3RfbmFt\nZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAGOwBU\nOxJJIg5sYXN0X25hbWUGOwBUOxNJIhF2YXJjaGFyKDI1NSkGOwBUOxRUOxVp\nAf87FjA7FzA7GDsdOxowOxtGOxwwSSIMcm9sZV9pZAY7AFRvOw4SOw9UOxAw\nOxFJIgAGOwBUOxJJIgxyb2xlX2lkBjsAVDsTSSIMaW50KDExKQY7AFQ7FFQ7\nFWkJOxYwOxcwOxg7GTsaMDsbRjscMEkiEmRlcGFydG1lbnRfaWQGOwBUbzsO\nEjsPVDsQMDsRSSIABjsAVDsSSSISZGVwYXJ0bWVudF9pZAY7AFQ7E0kiDGlu\ndCgxMSkGOwBUOxRUOxVpCTsWMDsXMDsYOxk7GjA7G0Y7HDBJIgpwaG9uZQY7\nAFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAGOwBUOxJJ\nIgpwaG9uZQY7AFQ7E0kiEXZhcmNoYXIoMjU1KQY7AFQ7FFQ7FWkB/zsWMDsX\nMDsYOx07GjA7G0Y7HDBJIgplbWFpbAY7AFRvOw4SOw9UOxBJIhR1dGY4X3Vu\naWNvZGVfY2kGOwBUOxFJIgAGOwBUOxJJIgplbWFpbAY7AFQ7E0kiEXZhcmNo\nYXIoMjU1KQY7AFQ7FFQ7FWkB/zsWMDsXMDsYOx07GjA7G0Y7HDBJIg11c2Vy\nbmFtZQY7AFRvOw4SOw9UOxBJIhR1dGY4X3VuaWNvZGVfY2kGOwBUOxFJIgAG\nOwBUOxJJIg11c2VybmFtZQY7AFQ7E0kiEXZhcmNoYXIoMjU1KQY7AFQ7FFQ7\nFWkB/zsWMDsXMDsYOx07GjA7G0Y7HDBJIhdlbmNyeXB0ZWRfcGFzc3dvcmQG\nOwBUbzsOEjsPVDsQSSIUdXRmOF91bmljb2RlX2NpBjsAVDsRSSIABjsAVDsS\nSSIXZW5jcnlwdGVkX3Bhc3N3b3JkBjsAVDsTSSIRdmFyY2hhcigyNTUpBjsA\nVDsUVDsVaQH/OxYwOxcwOxg7HTsaMDsbRjscMEkiDmlzX2FjdGl2ZQY7AFRv\nOw4SOw9UOxAwOxFJIgAGOwBUOxJJIg5pc19hY3RpdmUGOwBUOxNJIg90aW55\naW50KDEpBjsAVDsUVDsVaQY7FjA7FzA7GDoMYm9vbGVhbjsaMDsbRjscMEki\nDWlzX2FkbWluBjsAVG87DhI7D1Q7EDA7EUkiAAY7AFQ7EkkiDWlzX2FkbWlu\nBjsAVDsTSSIPdGlueWludCgxKQY7AFQ7FFQ7FWkGOxYwOxcwOxg7HzsaMDsb\nRjscMEkiDGFkZHJlc3MGOwBUbzsOEjsPVDsQSSIUdXRmOF91bmljb2RlX2Np\nBjsAVDsRSSIABjsAVDsSSSIMYWRkcmVzcwY7AFQ7E0kiCXRleHQGOwBUOxRU\nOxUwOxYwOxcwOxg6CXRleHQ7GjA7G0Y7HDBJIg9jcmVhdGVkX2F0BjsAVG86\nPUFjdGl2ZVJlY29yZDo6QXR0cmlidXRlTWV0aG9kczo6VGltZVpvbmVDb252\nZXJzaW9uOjpUeXBlBjoMQGNvbHVtbm87DhI7D1Q7EDA7EUkiAAY7AFQ7Ekki\nD2NyZWF0ZWRfYXQGOwBUOxNJIg1kYXRldGltZQY7AFQ7FFQ7FTA7FjA7FzA7\nGDoNZGF0ZXRpbWU7GjA7G0Y7HDBJIg91cGRhdGVkX2F0BjsAVG87IQY7Im87\nDhI7D1Q7EDA7EUkiAAY7AFQ7EkkiD3VwZGF0ZWRfYXQGOwBUOxNJIg1kYXRl\ndGltZQY7AFQ7FFQ7FTA7FjA7FzA7GDsjOxowOxtGOxwwOhdAYWdncmVnYXRp\nb25fY2FjaGV7ADoXQGFzc29jaWF0aW9uX2NhY2hlewA6FkBhdHRyaWJ1dGVz\nX2NhY2hlewgiF2VuY3J5cHRlZF9wYXNzd29yZEAoIg5pc19hY3RpdmVUIgdp\nZGkGOhhAcHJldmlvdXNseV9jaGFuZ2VkewA6GEBjaGFuZ2VkX2F0dHJpYnV0\nZXN7ADoOQHJlYWRvbmx5RjoPQGRlc3Ryb3llZEY6HEBtYXJrZWRfZm9yX2Rl\nc3RydWN0aW9uRjoeQGRlc3Ryb3llZF9ieV9hc3NvY2lhdGlvbjA6EEBuZXdf\ncmVjb3JkRjoJQHR4bjA6HkBfc3RhcnRfdHJhbnNhY3Rpb25fc3RhdGV7ADoX\nQHRyYW5zYWN0aW9uX3N0YXRlMDoUQHJlZmxlY3RzX3N0YXRlWwZGOg5AcGFz\nc3dvcmRJIgphZG1pbgY7AFQ=\n','2017-08-19 06:45:24','2017-08-19 06:48:02');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sources`
--

LOCK TABLES `sources` WRITE;
/*!40000 ALTER TABLE `sources` DISABLE KEYS */;
INSERT INTO `sources` VALUES (1,'Advertisement ',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(2,'Blog Post',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(3,'Campaing',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(4,'Call ',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(5,'Customer',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(6,'Supplier',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(7,'Website',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(8,'Email',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(9,'Facebook',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(10,'Proposal',NULL,NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21');
/*!40000 ALTER TABLE `sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_balances`
--

DROP TABLE IF EXISTS `stock_balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_balances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `balance` decimal(18,6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_balances`
--

LOCK TABLES `stock_balances` WRITE;
/*!40000 ALTER TABLE `stock_balances` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_balances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_transactions`
--

DROP TABLE IF EXISTS `stock_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_type_id` int(11) DEFAULT NULL,
  `ref_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `serial_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `open_qty` decimal(10,0) DEFAULT NULL,
  `remain_qty` decimal(10,0) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `um_id` int(11) DEFAULT NULL,
  `total_qty` float DEFAULT NULL,
  `input_cost` decimal(18,6) DEFAULT NULL,
  `last_value` decimal(10,0) DEFAULT NULL,
  `total_value` decimal(18,6) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `avg_cost` decimal(18,6) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_transactions`
--

LOCK TABLES `stock_transactions` WRITE;
/*!40000 ALTER TABLE `stock_transactions` DISABLE KEYS */;
INSERT INTO `stock_transactions` VALUES (1,1,2,'0001','2017-07-26',1,NULL,0,0,2,1,-2,0.000000,0,0.000000,NULL,1,0.000000,NULL,'2017-07-26 01:00:20','2017-07-26 01:00:20'),(2,2,2,'0002','2017-07-26',2,NULL,0,0,1,1,-24,0.000000,0,0.000000,NULL,1,0.000000,NULL,'2017-07-26 14:34:49','2017-07-26 14:34:49'),(3,3,2,'0003','2017-07-26',2,NULL,0,-1,1,2,-1,0.000000,0,0.000000,NULL,1,0.000000,NULL,'2017-07-26 14:38:32','2017-07-26 14:38:32');
/*!40000 ALTER TABLE `stock_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menus`
--

DROP TABLE IF EXISTS `sys_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_cls` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expand` tinyint(1) DEFAULT NULL,
  `is_leaf` tinyint(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `view_index` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menus`
--

LOCK TABLES `sys_menus` WRITE;
/*!40000 ALTER TABLE `sys_menus` DISABLE KEYS */;
INSERT INTO `sys_menus` VALUES (1,'General Setup',NULL,1,0,NULL,NULL,1,NULL,NULL,'2017-07-23 05:24:22','2017-07-23 05:24:22'),(2,'Area','icon-customer',0,1,1,'',1,'setup.area','setup.Area','2017-07-23 05:24:22','2017-07-23 05:24:22'),(3,'Payment Term','icon-customer',0,1,1,'',1,'setup.paymentTerm','setup.PaymentTerm','2017-07-23 05:24:22','2017-07-23 05:24:22'),(4,'Code','icon-customer',0,1,1,'',1,'setup.code','setup.Code','2017-07-23 05:24:22','2017-07-23 05:24:22'),(5,'Company Profile','icon-customer',0,1,1,'',1,'setup.companyProfile','setup.CompanyProfile','2017-07-23 05:24:22','2017-07-23 05:24:22'),(6,'Position','icon-customer',0,1,1,'',1,'setup.position','setup.Position','2017-07-23 05:24:22','2017-07-23 05:24:22'),(7,'System Administration',NULL,1,0,NULL,NULL,1,NULL,NULL,'2017-07-23 05:24:22','2017-07-23 05:24:22'),(8,'User','icon-customer',0,1,7,'',1,'admin.user','admin.User','2017-07-23 05:24:22','2017-07-23 05:24:22'),(9,'Role','icon-customer',0,1,7,'',1,'admin.role','admin.Role','2017-07-23 05:24:22','2017-07-23 05:24:22'),(10,'Department','icon-customer',0,1,7,'',1,'admin.department','admin.Department','2017-07-23 05:24:22','2017-07-23 05:24:22'),(11,'Items',NULL,1,0,NULL,NULL,1,NULL,NULL,'2017-07-23 05:24:22','2017-07-23 05:24:22'),(12,'UOM','icon-customer',0,1,11,'',1,'item.um','item.UM','2017-07-23 05:24:22','2017-07-23 05:24:22'),(13,'Location','icon-customer',0,1,11,'',1,'item.location','item.Location','2017-07-23 05:24:22','2017-07-23 05:24:22'),(14,'Item Category','icon-customer',0,1,11,'',1,'item.itemcategory','item.ItemCategory','2017-07-23 05:24:22','2017-07-23 05:24:22'),(15,'Item','icon-customer',0,1,11,'',1,'item.item','item.Item','2017-07-23 05:24:22','2017-07-23 05:24:22'),(16,'Adjust Stock','icon-customer',0,1,11,'',1,'item.adjuststock','item.AdjustStock','2017-07-23 05:24:22','2017-07-23 05:24:22'),(17,'Opening Stock','icon-customer',0,1,11,'',1,'item.openingstock','item.OpeningStock','2017-07-23 05:24:22','2017-07-23 05:24:22'),(18,'Sale',NULL,1,0,NULL,NULL,1,NULL,NULL,'2017-07-23 05:24:22','2017-07-23 05:24:22'),(19,'Lead','icon-customer',0,1,18,'',1,'sale.lead','sale.Lead','2017-07-23 05:24:22','2017-07-23 05:24:22'),(20,'Lead Opportunity','icon-customer',0,1,18,'',1,'sale.leadOpportunity','sale.LeadOpportunity','2017-07-23 05:24:22','2017-07-23 05:24:22'),(21,'Customer','icon-customer',0,1,18,'',1,'sale.customer','sale.Customer','2017-07-23 05:24:22','2017-07-23 05:24:22'),(22,'Quotation','icon-customer',0,1,18,'',1,'sale.quotation','sale.Quotation','2017-07-23 05:24:22','2017-07-23 05:24:22'),(23,'Sale Invoice','icon-customer',0,1,18,'',1,'sale.invoice','sale.Invoice','2017-07-23 05:24:22','2017-07-23 05:24:22'),(24,'Customer Payment','icon-customer',0,1,18,'',1,'sale.customerPayment','sale.CustomerPayment','2017-07-23 05:24:22','2017-07-23 05:24:22'),(25,'Sale Representative','icon-customer',0,1,18,'',1,'sale.saleRepresentative','sale.SaleRepresentative','2017-07-23 05:24:22','2017-07-23 05:24:22'),(26,'Contact','icon-customer',0,1,18,'',1,'sale.contact','sale.Contact','2017-07-23 05:24:22','2017-07-23 05:24:22'),(27,'Service',NULL,1,0,NULL,NULL,1,NULL,NULL,'2017-07-23 05:24:22','2017-07-23 05:24:22'),(28,'Maintenance List','icon-customer',0,1,27,'',1,'service.maintenance','service.Maintenance','2017-07-23 05:24:22','2017-07-23 05:24:22'),(29,'Teminate Maintenance List','icon-customer',0,1,27,'',1,'service.terminateMaintenance','service.TerminateMaintenance','2017-07-23 05:24:22','2017-07-23 05:24:22'),(30,'Rental List','icon-customer',0,1,27,'',1,'service.rental','service.Rental','2017-07-23 05:24:22','2017-07-23 05:24:22'),(31,'Teminate Rental List','icon-customer',0,1,27,'',1,'service.terminaeRental','service.TerminaeRental','2017-07-23 05:24:22','2017-07-23 05:24:22'),(32,'Purchase',NULL,1,0,NULL,NULL,1,NULL,NULL,'2017-07-23 05:24:22','2017-07-23 05:24:22'),(33,'Vendor','icon-customer',0,1,32,'',1,'purchase.vender','purchase.Vender','2017-07-23 05:24:22','2017-07-23 05:24:22'),(34,'Fix Asset',NULL,1,0,NULL,NULL,1,NULL,NULL,'2017-07-23 05:24:22','2017-07-23 05:24:22'),(35,'Transfer Asset','icon-customer',0,1,34,'',1,'fixAsset.transferFixAsset','fixAsset.Transfer','2017-07-23 05:24:22','2017-07-23 05:24:22'),(36,'Depreciation','icon-customer',0,1,34,'',1,'fixAsset.depreciation','fixAsset.Depreciation','2017-07-23 05:24:22','2017-07-23 05:24:22'),(37,'Menu','icon-customer',0,1,1,NULL,1,'setup.menu','setup.Menu','2017-07-23 05:24:22','2017-07-23 05:24:22'),(38,'Currency','icon-customer',NULL,1,1,'update',1,'setup.currency','setup.Currency','2017-07-27 16:03:12','2017-07-27 18:28:35');
/*!40000 ALTER TABLE `sys_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_types`
--

DROP TABLE IF EXISTS `transaction_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `flag` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_types`
--

LOCK TABLES `transaction_types` WRITE;
/*!40000 ALTER TABLE `transaction_types` DISABLE KEYS */;
INSERT INTO `transaction_types` VALUES (1,'Bill','Payment on Bill From vender',1,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(2,'Invoice','issue invoice to customer',-1,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(3,'Adjust Stock','flag null because it will increase or descrease depend on adjust type',NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(4,'Opening Stock','when opening balance',1,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(5,'Transfer Stock','flag null because it will increase or descrease depend transfer to location ',NULL,'2017-07-23 05:24:21','2017-07-23 05:24:21'),(6,'Customer Payment','Customer Pay on invoice',-1,'2017-07-23 05:24:21','2017-07-23 05:24:21');
/*!40000 ALTER TABLE `transaction_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_stock_details`
--

DROP TABLE IF EXISTS `transfer_stock_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_stock_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_stock_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `um_id` int(11) DEFAULT NULL,
  `total_qty` decimal(18,6) DEFAULT NULL,
  `serial_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_stock_details`
--

LOCK TABLES `transfer_stock_details` WRITE;
/*!40000 ALTER TABLE `transfer_stock_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfer_stock_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_stocks`
--

DROP TABLE IF EXISTS `transfer_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auto_code` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ref_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_location_id` int(11) DEFAULT NULL,
  `to_location_id` int(11) DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_stocks`
--

LOCK TABLES `transfer_stocks` WRITE;
/*!40000 ALTER TABLE `transfer_stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfer_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums`
--

DROP TABLE IF EXISTS `ums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums`
--

LOCK TABLES `ums` WRITE;
/*!40000 ALTER TABLE `ums` DISABLE KEYS */;
INSERT INTO `ums` VALUES (1,'001','large','L','',NULL,NULL,'2017-07-23 05:25:53','2017-07-23 05:25:53'),(2,'2','Small','S','',NULL,NULL,'2017-07-23 05:26:03','2017-07-23 05:26:03'),(3,'3','Medium','M','',NULL,NULL,'2017-07-23 05:26:15','2017-07-23 05:26:15'),(4,'03','កំប៉ុង','កំប៉ុង','',NULL,NULL,'2017-07-27 11:16:54','2017-07-27 11:17:39'),(5,'04','កេស','កេស','',NULL,NULL,'2017-07-27 11:17:09','2017-07-27 11:18:26'),(6,'05','យូរ','យូរ','',NULL,NULL,'2017-07-27 11:18:41','2017-07-27 11:18:41');
/*!40000 ALTER TABLE `ums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_join` date DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'001','2016-02-06','System','Administration',2,1,'N/A','','admin','xrXgPX/YIxXn7TA53bx3EQ==\n',1,1,'','2017-07-23 05:24:21','2017-07-23 05:24:21');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vender_balances`
--

DROP TABLE IF EXISTS `vender_balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vender_balances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vernder_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `balance` decimal(18,6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vender_balances`
--

LOCK TABLES `vender_balances` WRITE;
/*!40000 ALTER TABLE `vender_balances` DISABLE KEYS */;
/*!40000 ALTER TABLE `vender_balances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vender_transactions`
--

DROP TABLE IF EXISTS `vender_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vender_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `transactioin_type_id` int(11) DEFAULT NULL,
  `ref_no` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(18,6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vender_transactions`
--

LOCK TABLES `vender_transactions` WRITE;
/*!40000 ALTER TABLE `vender_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `vender_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venders`
--

DROP TABLE IF EXISTS `venders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `legal_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `contact_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_mobile` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_id_card` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_address` text COLLATE utf8_unicode_ci,
  `create_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venders`
--

LOCK TABLES `venders` WRITE;
/*!40000 ALTER TABLE `venders` DISABLE KEYS */;
/*!40000 ALTER TABLE `venders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-19 13:49:15
