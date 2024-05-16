/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - surveys
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`surveys` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `surveys`;

/*Table structure for table `card_category_master` */

DROP TABLE IF EXISTS `card_category_master`;

CREATE TABLE `card_category_master` (
  `tier_id` int(20) NOT NULL AUTO_INCREMENT,
  `tier_name` varchar(50) DEFAULT NULL,
  `tier_code` char(5) DEFAULT NULL,
  `loyalty_reward_pt_lower_limit` int(20) DEFAULT NULL,
  `loyalty_reward_pt_upper_limit` int(20) DEFAULT NULL,
  `minimum_order_value` int(20) DEFAULT NULL,
  `payment_condition` varchar(255) DEFAULT NULL,
  `welcome_rewards_point` int(11) DEFAULT NULL,
  `validity_of_rewards_in_days` int(11) DEFAULT NULL,
  `point_per_unit_in_inr` decimal(10,2) DEFAULT NULL,
  `points_on_parts_srvc_purchase_in_prcntg` decimal(10,2) DEFAULT NULL,
  `online_purchase_benifit_prcntg` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

/*Data for the table `card_category_master` */

insert  into `card_category_master`(`tier_id`,`tier_name`,`tier_code`,`loyalty_reward_pt_lower_limit`,`loyalty_reward_pt_upper_limit`,`minimum_order_value`,`payment_condition`,`welcome_rewards_point`,`validity_of_rewards_in_days`,`point_per_unit_in_inr`,`points_on_parts_srvc_purchase_in_prcntg`,`online_purchase_benifit_prcntg`,`created_at`,`updated_at`) values 
(1,'Silver','SL',0,2499,1000,'100',100,180,1.00,1.00,0.50,NULL,'2024-05-16 07:31:39'),
(2,'Gold','GD',2500,9999,1000,'100',NULL,365,1.00,1.25,0.50,NULL,NULL),
(3,'Platinum','PL',10000,NULL,1000,'100',NULL,365,1.00,1.50,0.50,NULL,NULL);

/*Table structure for table `company_master` */

DROP TABLE IF EXISTS `company_master`;

CREATE TABLE `company_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Sap customer master regular data fetch',
  `company_code` int(11) DEFAULT NULL COMMENT 'CustomerSAPID',
  `company_name` text DEFAULT NULL,
  `sales_office` text DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `customer_address1` varchar(255) DEFAULT NULL,
  `customer_address2` varchar(255) DEFAULT NULL,
  `customer_city` varchar(255) DEFAULT NULL,
  `customer_state` varchar(255) DEFAULT NULL,
  `pin_code` varchar(255) DEFAULT NULL,
  `division_code` varchar(255) DEFAULT NULL,
  `contact_sapid` varchar(255) DEFAULT NULL,
  `contact_city` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `contact_state` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `company_master` */

insert  into `company_master`(`id`,`company_code`,`company_name`,`sales_office`,`contact_name`,`customer_address1`,`customer_address2`,`customer_city`,`customer_state`,`pin_code`,`division_code`,`contact_sapid`,`contact_city`,`mobile_no`,`postal_code`,`designation`,`department`,`contact_state`,`created_at`,`updated_at`) values 
(1,905793,'VOLTAS LTD','Kolkata Branch','SANJAY JADAV','C/O- TOTAL LOGISTIC INDIA PVT. LTD.','BEHIND HP GAS GODOWN','ORISSA','ORISSA','758038','PSS','3435','Bardhaman','7478699659','713148',NULL,'Machine Sales','West Bengal','2024-05-14 15:23:15','2024-05-16 11:18:16'),
(2,805798,'LG LTD','Kolkata Branch','AJAY JADAV','C/O- TOTAL LOGISTIC INDIA PVT. LTD.','BEHIND HP GAS GODOWN','ORISSA','ORISSA','758038','PSS','3436','Bardhaman','7478699660','713148',NULL,'Machine Sales','West Bengal','2024-05-14 15:23:15','2024-05-16 11:18:18'),
(3,909257,'MAA ENGINEERING','Kolkata Branch','S.K.SARKAR','RAJ APPARTMENT, FLAT NO. 4','41/3 P.G.H.SHAH ROAD','WEST BENGAL','WEST BENGAL','700032',NULL,'3437',NULL,'9432914839',NULL,NULL,'Machine Sale','WEST BENGAL','2024-05-15 18:02:33','2024-05-15 18:17:16'),
(4,909514,'MK Engineering','Guwahati Branch','MAHESH JI','Assam University, Silchar',NULL,'Kamrup','Assam','781011',NULL,'3438','Silchar2','9435045430','781011',NULL,'Purchase','Assam','2024-05-15 18:13:02','2024-05-15 19:48:46');

/*Table structure for table `customer_details` */

DROP TABLE IF EXISTS `customer_details`;

CREATE TABLE `customer_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `customersapid` int(11) DEFAULT NULL,
  `customer_name` text DEFAULT NULL,
  `contact_name` text DEFAULT NULL,
  `phone_no` text DEFAULT NULL,
  `contact_phno` text DEFAULT NULL,
  `contact_email` text DEFAULT NULL,
  `contact_department` text DEFAULT NULL,
  `contact_designation` text DEFAULT NULL,
  `customer_address1` text DEFAULT NULL,
  `customer_address2` text DEFAULT NULL,
  `customer_city` text DEFAULT NULL,
  `customer_state` text DEFAULT NULL,
  `salesoffice` text DEFAULT NULL,
  `pin` text DEFAULT NULL,
  `country` text DEFAULT NULL,
  `pan` text DEFAULT NULL,
  `tan` text DEFAULT NULL,
  `certificate` text DEFAULT NULL,
  `gstin` text DEFAULT NULL,
  `redemption_authorization` text DEFAULT NULL,
  `pan_no` varchar(255) DEFAULT NULL,
  `tan_no` varchar(255) DEFAULT NULL,
  `certificate_no` varchar(255) DEFAULT NULL,
  `gstin_no` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4427 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `customer_details` */

insert  into `customer_details`(`id`,`user_id`,`customersapid`,`customer_name`,`contact_name`,`phone_no`,`contact_phno`,`contact_email`,`contact_department`,`contact_designation`,`customer_address1`,`customer_address2`,`customer_city`,`customer_state`,`salesoffice`,`pin`,`country`,`pan`,`tan`,`certificate`,`gstin`,`redemption_authorization`,`pan_no`,`tan_no`,`certificate_no`,`gstin_no`,`status`,`created_at`,`updated_at`) values 
(4423,19,905793,'VOLTAS LTD','SANJAY KUMAR','7003319369','7003319369','shankha@softhought.com','Machine Sales','sales Person','C/O- TOTAL LOGISTIC INDIA PVT. LTD.','BEHIND HP GAS GODOWN','ORISSA','ANDAMAN AND NICOBAR ISLANDS','Kolkata Branch','758038','India','panAHJPM7796H1715843075.jpg',NULL,NULL,NULL,NULL,'AHJPM7796H',NULL,NULL,NULL,1,'2024-05-16 07:04:35','2024-05-16 08:47:35'),
(4424,20,909514,'MK Engineering','MAHESH JIA','9717125259','9717125259','shivam@gmail.com','Purchase','Manager','Assam University, Silchar',NULL,'Kamrup','ANDAMAN AND NICOBAR ISLANDS','Kolkata Branch','781011','India',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2024-05-16 07:22:40','2024-05-16 08:54:54'),
(4425,21,909257,'MAA ENGINEERING','S.K.SARKAR','9153575808','9153575808','devsofthought@gmail.com','Machine Sale','Test','RAJ APPARTMENT, FLAT NO. 4','41/3 P.G.H.SHAH ROAD','WEST BENGAL','ANDAMAN AND NICOBAR ISLANDS','Kolkata Branch','700032','India',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'2024-05-16 07:26:57','2024-05-16 07:26:57');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `log_table` */

DROP TABLE IF EXISTS `log_table`;

CREATE TABLE `log_table` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `row_id` bigint(20) unsigned DEFAULT NULL,
  `table_name` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `data_array` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data_array`)),
  `user_browser` varchar(255) DEFAULT NULL,
  `user_platform` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `member_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `log_table` */

insert  into `log_table`(`id`,`log_date`,`row_id`,`table_name`,`action`,`data_array`,`user_browser`,`user_platform`,`ip_address`,`member_id`,`user_id`,`created_at`,`updated_at`) values 
(3,'2024-05-07 17:40:00',15,'user_account_activitys','Update','{\"logout_time\":\"2024-05-07T12:10:00.598379Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-07 12:10:00','2024-05-07 12:10:00'),
(4,'2024-05-07 17:51:42',16,'user_account_activitys','Update','{\"logout_time\":\"2024-05-07T12:21:42.700810Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-07 12:21:42','2024-05-07 12:21:42'),
(5,'2024-05-07 18:29:23',17,'user_account_activitys','Update','{\"logout_time\":\"2024-05-07T12:59:23.144759Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-07 12:59:23','2024-05-07 12:59:23'),
(6,'2024-05-07 18:56:40',18,'user_account_activitys','Update','{\"logout_time\":\"2024-05-07T13:26:40.239940Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-07 13:26:40','2024-05-07 13:26:40'),
(7,'2024-05-07 18:56:44',19,'user_account_activitys','Update','{\"logout_time\":\"2024-05-07T13:26:44.373206Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-07 13:26:44','2024-05-07 13:26:44'),
(8,'2024-05-07 18:56:51',20,'user_account_activitys','Update','{\"logout_time\":\"2024-05-07T13:26:51.255243Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-07 13:26:51','2024-05-07 13:26:51'),
(9,'2024-05-08 11:16:42',22,'user_account_activitys','Update','{\"logout_time\":\"2024-05-08T05:46:42.391653Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-08 05:46:42','2024-05-08 05:46:42'),
(10,'2024-05-08 13:38:21',25,'user_account_activitys','Update','{\"logout_time\":\"2024-05-08T08:08:21.451323Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-08 08:08:21','2024-05-08 08:08:21'),
(11,'2024-05-08 17:13:27',2,'user_account_activitys','Update','{\"logout_time\":\"2024-05-08T11:43:27.051720Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-08 11:43:27','2024-05-08 11:43:27'),
(12,'2024-05-09 15:52:19',1,'card_category_master','Update','{\"tier_id\":1,\"tier_name\":\"Silver\",\"tier_code\":\"SL\",\"loyalty_reward_pt_lower_limit\":\"0\",\"loyalty_reward_pt_upper_limit\":\"2499\",\"minimum_order_value\":\"1000\",\"payment_condition\":\"100\",\"is_applicable_all_parts\":\"Y\",\"is_applicable_for_all_service\":\"Y\",\"welcome_rewards_point\":\"100\",\"validity_of_rewards_in_days\":\"365\",\"point_per_unit_in_inr\":\"1.00\",\"is_piority_service_avail\":\"Y\",\"is_facility_visit_on_invition\":\"N\",\"free_machine_engine_health_check_in_year\":0,\"is_priority_customer_help_desk\":\"Y\",\"points_on_parts_srvc_purchase_in_prcntg\":\"1.00\",\"online_purchase_benifit_prcntg\":\"0.50\",\"is_enrol_certified_two_Operator_servic_each_year\":\"N\",\"bonus_points_new_machine_purchase_online\":5000,\"created_at\":null,\"updated_at\":\"2024-05-09T09:47:46.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-09 10:22:19','2024-05-09 10:22:19'),
(15,'2024-05-13 17:25:41',5,'user_account_activitys','Update','{\"logout_time\":\"2024-05-13T11:58:36.643638Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-13 11:58:36','2024-05-13 11:58:36'),
(16,'2024-05-13 18:12:56',2,'users','Insert','{\"name\":\"Suman Dey\",\"username\":\"8944961893\",\"mobile_no\":\"8944961893\",\"email\":\"sumandey7689@gmail.com\",\"address\":\"Kolkata\",\"role_id\":4,\"otp\":0,\"updated_at\":\"2024-05-13T12:45:52.000000Z\",\"created_at\":\"2024-05-13T12:45:52.000000Z\",\"id\":2}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-13 12:45:52','2024-05-13 12:45:52'),
(17,'2024-05-13 18:12:56',4406,'customer_details','Insert','{\"user_id\":2,\"customer_name\":\"Suman Dey\",\"contact_name\":\"Suman Dey\",\"phone_no\":\"8944961893\",\"contact_phno\":\"8944961893\",\"contact_department\":\"IT\",\"contact_designation\":\"Backend Developer\",\"customer_address1\":\"Kolkata\",\"customer_address2\":\"Kolkata\",\"customer_city\":\"Kolkata\",\"customer_state\":\"35\",\"salesoffice\":\"2\",\"pin\":\"700073\",\"country\":\"India\",\"pan_no\":\"GFCPD7142P\",\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"pan\":\"panGFCPD7142P1715604352.jpg\",\"updated_at\":\"2024-05-13T12:45:52.000000Z\",\"created_at\":\"2024-05-13T12:45:52.000000Z\",\"id\":4406}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-13 12:45:52','2024-05-13 12:45:52'),
(18,'2024-05-13 18:21:05',3,'users','Insert','{\"name\":\"Suman Dey\",\"username\":\"8944961893\",\"mobile_no\":\"8944961893\",\"email\":\"sumandey7689@gmail.com\",\"address\":\"Kolkata\",\"role_id\":4,\"new\":\"Yes\",\"otp\":\"scTMob\",\"updated_at\":\"2024-05-13T12:54:00.000000Z\",\"created_at\":\"2024-05-13T12:54:00.000000Z\",\"id\":3}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-13 12:54:00','2024-05-13 12:54:00'),
(19,'2024-05-13 18:21:05',4407,'customer_details','Insert','{\"user_id\":3,\"customer_name\":\"Suman Dey\",\"customersapid\":null,\"contact_name\":\"Suman Dey\",\"phone_no\":\"8944961893\",\"contact_phno\":\"8944961893\",\"contact_email\":\"sumandey7689@gmail.com\",\"contact_department\":\"IT\",\"contact_designation\":\"Backend Developer\",\"customer_address1\":\"Kolkata\",\"customer_address2\":\"Kolkata\",\"customer_city\":\"Kolkata\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"700073\",\"country\":\"India\",\"pan_no\":\"GFCPD7142P\",\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"pan\":\"panGFCPD7142P1715604840.jpg\",\"updated_at\":\"2024-05-13T12:54:00.000000Z\",\"created_at\":\"2024-05-13T12:54:00.000000Z\",\"id\":4407}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-13 12:54:00','2024-05-13 12:54:00'),
(20,'2024-05-13 18:23:19',4,'users','Insert','{\"name\":\"Suman Dey\",\"username\":\"8944961893\",\"mobile_no\":\"8944961893\",\"email\":\"sumandey7689@gmail.com\",\"address\":\"Kolkata\",\"role_id\":4,\"new\":\"Yes\",\"otp\":\"AdF2IF\",\"updated_at\":\"2024-05-13T12:56:14.000000Z\",\"created_at\":\"2024-05-13T12:56:14.000000Z\",\"id\":4}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-13 12:56:14','2024-05-13 12:56:14'),
(21,'2024-05-13 18:23:19',4408,'customer_details','Insert','{\"user_id\":4,\"customer_name\":\"Suman Dey\",\"customersapid\":null,\"contact_name\":\"Suman Dey\",\"phone_no\":\"8944961893\",\"contact_phno\":\"8944961893\",\"contact_email\":\"sumandey7689@gmail.com\",\"contact_department\":\"IT\",\"contact_designation\":\"Backend Developer\",\"customer_address1\":\"Kolkata\",\"customer_address2\":\"Kolkata\",\"customer_city\":\"Kolkata\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"700073\",\"country\":\"India\",\"pan_no\":\"GFCPD7142P\",\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"pan\":\"panGFCPD7142P1715604974.jpg\",\"updated_at\":\"2024-05-13T12:56:14.000000Z\",\"created_at\":\"2024-05-13T12:56:14.000000Z\",\"id\":4408}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-13 12:56:14','2024-05-13 12:56:14'),
(23,'2024-05-14 16:43:26',5,'users','Insert','{\"name\":\"VOLTAS LTD905793\",\"username\":\"7478699658\",\"mobile_no\":\"7478699658\",\"email\":\"devsofthought@gmail.com\",\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"new\":\"Yes\",\"otp\":251345,\"mobile_hash\":\"65fe547ef9e75aa802f52bfbe11d9fd2\",\"updated_at\":\"2024-05-14T11:16:23.000000Z\",\"created_at\":\"2024-05-14T11:16:23.000000Z\",\"id\":5}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-14 11:16:23','2024-05-14 11:16:23'),
(24,'2024-05-14 16:43:26',4409,'customer_details','Insert','{\"user_id\":5,\"customer_name\":\"VOLTAS LTD905793\",\"customersapid\":\"0000030740\",\"contact_name\":\"SANJAY JADAV\",\"phone_no\":\"7478699658\",\"contact_phno\":\"7478699658\",\"contact_email\":\"devsofthought@gmail.com\",\"contact_department\":\"Machine Sales\",\"contact_designation\":\"IT\",\"customer_address1\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"customer_address2\":\"BEHIND HP GAS GODOWN\",\"customer_city\":\"Bardhaman\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"758038\",\"country\":\"India\",\"pan_no\":null,\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"updated_at\":\"2024-05-14T11:16:23.000000Z\",\"created_at\":\"2024-05-14T11:16:23.000000Z\",\"id\":4409}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-14 11:16:23','2024-05-14 11:16:23'),
(25,'2024-05-14 16:53:45',6,'users','Insert','{\"name\":\"Suman Dey\",\"username\":\"7478699658\",\"mobile_no\":\"7478699658\",\"email\":\"sumanvar405@gmail.com\",\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"new\":\"Yes\",\"otp\":524034,\"mobile_hash\":\"65fe547ef9e75aa802f52bfbe11d9fd2\",\"updated_at\":\"2024-05-14T11:26:42.000000Z\",\"created_at\":\"2024-05-14T11:26:42.000000Z\",\"id\":6}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-14 11:26:42','2024-05-14 11:26:42'),
(26,'2024-05-14 16:53:45',4410,'customer_details','Insert','{\"user_id\":6,\"customer_name\":\"VOLTAS LTD\",\"customersapid\":\"0000030740\",\"contact_name\":\"Suman Dey\",\"phone_no\":\"7478699658\",\"contact_phno\":\"7478699658\",\"contact_email\":\"sumanvar405@gmail.com\",\"contact_department\":\"Machine Sales\",\"contact_designation\":\"IT\",\"customer_address1\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"customer_address2\":\"BEHIND HP GAS GODOWN\",\"customer_city\":\"Bardhaman\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"758038\",\"country\":\"India\",\"pan_no\":null,\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"updated_at\":\"2024-05-14T11:26:42.000000Z\",\"created_at\":\"2024-05-14T11:26:42.000000Z\",\"id\":4410}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-14 11:26:42','2024-05-14 11:26:42'),
(27,'2024-05-14 17:27:04',7,'users','Insert','{\"name\":\"SUMAN DEY\",\"username\":\"7478699658\",\"mobile_no\":\"7478699658\",\"email\":\"sumanvar405@gmail.com\",\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"new\":\"Yes\",\"otp\":619852,\"mobile_hash\":\"65fe547ef9e75aa802f52bfbe11d9fd2\",\"updated_at\":\"2024-05-14T12:00:01.000000Z\",\"created_at\":\"2024-05-14T12:00:01.000000Z\",\"id\":7}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-14 12:00:01','2024-05-14 12:00:01'),
(28,'2024-05-14 17:27:04',4411,'customer_details','Insert','{\"user_id\":7,\"customer_name\":\"VOLTAS LTD\",\"customersapid\":\"0000030740\",\"contact_name\":\"SUMAN DEY\",\"phone_no\":\"7478699658\",\"contact_phno\":\"7478699658\",\"contact_email\":\"sumanvar405@gmail.com\",\"contact_department\":\"Machine Sales\",\"contact_designation\":\"IT\",\"customer_address1\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"customer_address2\":\"BEHIND HP GAS GODOWN\",\"customer_city\":\"Bardhaman\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"758038\",\"country\":\"India\",\"pan_no\":null,\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"updated_at\":\"2024-05-14T12:00:01.000000Z\",\"created_at\":\"2024-05-14T12:00:01.000000Z\",\"id\":4411}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-14 12:00:01','2024-05-14 12:00:01'),
(29,'2024-05-14 17:29:05',8,'user_account_activitys','Update','{\"logout_time\":\"2024-05-14T12:02:02.637909Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-14 12:02:02','2024-05-14 12:02:02'),
(30,'2024-05-14 17:31:14',10,'user_account_activitys','Update','{\"logout_time\":\"2024-05-14T12:04:11.282061Z\"}','Firefox','Windows','127.0.0.1',NULL,7,'2024-05-14 12:04:11','2024-05-14 12:04:11'),
(31,'2024-05-14 17:37:28',11,'user_account_activitys','Update','{\"logout_time\":\"2024-05-14T12:10:25.118787Z\"}','Firefox','Windows','127.0.0.1',NULL,7,'2024-05-14 12:10:25','2024-05-14 12:10:25'),
(32,'2024-05-14 17:37:54',12,'user_account_activitys','Update','{\"logout_time\":\"2024-05-14T12:10:51.764947Z\"}','Firefox','Windows','127.0.0.1',NULL,7,'2024-05-14 12:10:51','2024-05-14 12:10:51'),
(33,'2024-05-14 18:42:23',7,'customer_details','Update','{\"id\":7,\"name\":\"SUMAN DEY\",\"username\":\"7478699658\",\"loyality_card_no\":null,\"mobile_no\":\"7478699658\",\"email\":\"sumanvar405@gmail.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":619852,\"mobile_hash\":\"65fe547ef9e75aa802f52bfbe11d9fd2\",\"status\":2,\"otp_verify_date\":\"2024-05-14T13:15:20.355308Z\",\"user_activation_date\":null,\"created_at\":\"2024-05-14T12:00:01.000000Z\",\"updated_at\":\"2024-05-14T13:15:20.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-14 13:15:20','2024-05-14 13:15:20'),
(34,'2024-05-14 18:45:33',7,'customer_details','Update','{\"id\":7,\"name\":\"SUMAN DEY\",\"username\":\"7478699658\",\"loyality_card_no\":null,\"mobile_no\":\"7478699658\",\"email\":\"sumanvar405@gmail.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":619852,\"mobile_hash\":\"65fe547ef9e75aa802f52bfbe11d9fd2\",\"status\":2,\"otp_verify_date\":\"2024-05-14T13:18:30.742730Z\",\"user_activation_date\":null,\"created_at\":\"2024-05-14T12:00:01.000000Z\",\"updated_at\":\"2024-05-14T13:18:30.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-14 13:18:30','2024-05-14 13:18:30'),
(35,'2024-05-14 18:45:42',7,'customer_details','Update','{\"id\":7,\"name\":\"SUMAN DEY\",\"username\":\"7478699658\",\"loyality_card_no\":null,\"mobile_no\":\"7478699658\",\"email\":\"sumanvar405@gmail.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":619852,\"mobile_hash\":\"65fe547ef9e75aa802f52bfbe11d9fd2\",\"status\":2,\"otp_verify_date\":\"2024-05-14T13:18:39.173018Z\",\"user_activation_date\":null,\"created_at\":\"2024-05-14T12:00:01.000000Z\",\"updated_at\":\"2024-05-14T13:18:39.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-14 13:18:39','2024-05-14 13:18:39'),
(36,'2024-05-14 19:03:31',7,'customer_details','Update','{\"id\":7,\"name\":\"SUMAN DEY\",\"username\":\"7478699658\",\"loyality_card_no\":null,\"mobile_no\":\"7478699658\",\"email\":\"sumanvar405@gmail.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":5252,\"mobile_hash\":\"65fe547ef9e75aa802f52bfbe11d9fd2\",\"status\":2,\"otp_verify_date\":\"2024-05-14T13:36:27.829543Z\",\"user_activation_date\":null,\"created_at\":\"2024-05-14T12:00:01.000000Z\",\"updated_at\":\"2024-05-14T13:36:27.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-14 13:36:27','2024-05-14 13:36:27'),
(37,'2024-05-14 19:08:23',7,'customer_details','Update','{\"id\":7,\"name\":\"SUMAN DEY\",\"username\":\"7478699658\",\"loyality_card_no\":null,\"mobile_no\":\"7478699658\",\"email\":\"sumanvar405@gmail.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":5252,\"mobile_hash\":\"65fe547ef9e75aa802f52bfbe11d9fd2\",\"status\":2,\"otp_verify_date\":\"2024-05-14T13:41:19.986202Z\",\"user_activation_date\":null,\"created_at\":\"2024-05-14T12:00:01.000000Z\",\"updated_at\":\"2024-05-14T13:41:19.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-14 13:41:20','2024-05-14 13:41:20'),
(38,'2024-05-14 19:16:05',7,'customer_details','Update','{\"id\":7,\"name\":\"SUMAN DEY\",\"username\":\"7478699658\",\"loyality_card_no\":null,\"mobile_no\":\"7478699658\",\"email\":\"sumanvar405@gmail.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":5252,\"mobile_hash\":\"65fe547ef9e75aa802f52bfbe11d9fd2\",\"status\":2,\"otp_verify_date\":\"2024-05-14T13:49:02.113906Z\",\"user_activation_date\":null,\"created_at\":\"2024-05-14T12:00:01.000000Z\",\"updated_at\":\"2024-05-14T13:49:02.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-14 13:49:02','2024-05-14 13:49:02'),
(39,'2024-05-14 19:18:05',7,'customer_details','Update','{\"id\":7,\"name\":\"SUMAN DEY\",\"username\":\"7478699658\",\"loyality_card_no\":null,\"mobile_no\":\"7478699658\",\"email\":\"sumanvar405@gmail.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":5252,\"mobile_hash\":\"65fe547ef9e75aa802f52bfbe11d9fd2\",\"status\":2,\"otp_verify_date\":\"2024-05-14T13:51:01.909400Z\",\"user_activation_date\":null,\"created_at\":\"2024-05-14T12:00:01.000000Z\",\"updated_at\":\"2024-05-14T13:51:01.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-14 13:51:01','2024-05-14 13:51:01'),
(40,'2024-05-14 19:18:48',7,'customer_details','Update','{\"id\":7,\"name\":\"SUMAN DEY\",\"username\":\"7478699658\",\"loyality_card_no\":null,\"mobile_no\":\"7478699658\",\"email\":\"sumanvar405@gmail.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":5252,\"mobile_hash\":\"65fe547ef9e75aa802f52bfbe11d9fd2\",\"status\":2,\"otp_verify_date\":\"2024-05-14T13:51:45.227187Z\",\"user_activation_date\":null,\"created_at\":\"2024-05-14T12:00:01.000000Z\",\"updated_at\":\"2024-05-14T13:51:45.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-14 13:51:45','2024-05-14 13:51:45'),
(42,'2024-05-15 15:41:48',22,'user_account_activitys','Update','{\"logout_time\":\"2024-05-15T10:11:48.313339Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 10:11:48','2024-05-15 10:11:48'),
(43,'2024-05-15 16:26:08',9,'customer_details','Update','{\"id\":9,\"name\":\"SANJAY JADAV\",\"username\":\"7478699658\",\"loyality_card_no\":null,\"mobile_no\":\"7478699658\",\"email\":\"sumanvar405@gmail.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"N\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":1378,\"mobile_hash\":\"65fe547ef9e75aa802f52bfbe11d9fd2\",\"status\":2,\"otp_verify_date\":\"2024-05-15T10:59:05.634842Z\",\"user_activation_date\":null,\"created_at\":\"2024-05-15T10:53:39.000000Z\",\"updated_at\":\"2024-05-15T10:59:05.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 10:59:05','2024-05-15 10:59:05'),
(44,'2024-05-15 16:37:49',10,'users','Insert','{\"name\":\"SANJAY JADAV\",\"username\":\"7478699659\",\"mobile_no\":\"7478699659\",\"email\":\"sumanvar405@gmail.com\",\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"new\":\"Yes\",\"otp\":2969,\"mobile_hash\":\"a1b6161d9f78af3aa239e63fb0ba863b\",\"updated_at\":\"2024-05-15T11:10:46.000000Z\",\"created_at\":\"2024-05-15T11:10:46.000000Z\",\"id\":10}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 11:10:46','2024-05-15 11:10:46'),
(45,'2024-05-15 16:37:49',4414,'customer_details','Insert','{\"user_id\":10,\"customer_name\":\"VOLTAS LTD\",\"customersapid\":\"905793\",\"contact_name\":\"SANJAY JADAV\",\"phone_no\":\"7478699659\",\"contact_phno\":\"7478699659\",\"contact_email\":\"sumanvar405@gmail.com\",\"contact_department\":\"Machine Sales\",\"contact_designation\":\"Developer\",\"customer_address1\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"customer_address2\":\"BEHIND HP GAS GODOWN\",\"customer_city\":\"Bardhaman\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"758038\",\"country\":\"India\",\"pan_no\":null,\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"updated_at\":\"2024-05-15T11:10:46.000000Z\",\"created_at\":\"2024-05-15T11:10:46.000000Z\",\"id\":4414}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 11:10:46','2024-05-15 11:10:46'),
(46,'2024-05-15 16:39:00',10,'customer_details','Update','{\"id\":10,\"name\":\"SANJAY JADAV\",\"username\":\"7478699659\",\"loyality_card_no\":null,\"mobile_no\":\"7478699659\",\"email\":\"sumanvar405@gmail.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"N\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":2969,\"mobile_hash\":\"a1b6161d9f78af3aa239e63fb0ba863b\",\"status\":2,\"otp_verify_date\":\"2024-05-15T11:11:57.522502Z\",\"user_activation_date\":null,\"created_at\":\"2024-05-15T11:10:46.000000Z\",\"updated_at\":\"2024-05-15T11:11:57.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 11:11:57','2024-05-15 11:11:57'),
(47,'2024-05-15 16:52:00',23,'user_account_activitys','Update','{\"logout_time\":\"2024-05-15T11:24:57.647983Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 11:24:57','2024-05-15 11:24:57'),
(48,'2024-05-15 17:02:17',26,'user_account_activitys','Update','{\"logout_time\":\"2024-05-15T11:35:14.231387Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 11:35:14','2024-05-15 11:35:14'),
(49,'2024-05-15 17:02:23',27,'user_account_activitys','Update','{\"logout_time\":\"2024-05-15T11:35:20.740423Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 11:35:20','2024-05-15 11:35:20'),
(50,'2024-05-15 17:02:47',28,'user_account_activitys','Update','{\"logout_time\":\"2024-05-15T11:35:44.348927Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 11:35:44','2024-05-15 11:35:44'),
(51,'2024-05-15 17:17:43',30,'user_account_activitys','Update','{\"logout_time\":\"2024-05-15T11:50:40.812527Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 11:50:40','2024-05-15 11:50:40'),
(52,'2024-05-15 17:17:51',31,'user_account_activitys','Update','{\"logout_time\":\"2024-05-15T11:50:48.297447Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 11:50:48','2024-05-15 11:50:48'),
(53,'2024-05-15 17:19:14',32,'user_account_activitys','Update','{\"logout_time\":\"2024-05-15T11:52:11.622329Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 11:52:11','2024-05-15 11:52:11'),
(54,'2024-05-15 17:40:57',24,'user_account_activitys','Update','{\"logout_time\":\"2024-05-15T12:10:57.303237Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 12:10:57','2024-05-15 12:10:57'),
(55,'2024-05-15 18:41:52',29,'user_account_activitys','Update','{\"logout_time\":\"2024-05-15T13:14:48.735016Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 13:14:48','2024-05-15 13:14:48'),
(56,'2024-05-15 19:36:43',12,'users','Update','{\"id\":12,\"name\":\"SANJAY JADAV\",\"username\":\"7003319369\",\"loyality_card_no\":259993765,\"mobile_no\":\"7003319369\",\"email\":\"shankha@softhought.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"N\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":6085,\"mobile_hash\":\"b7b70786319b3d88b90835c4abaef19f\",\"status\":\"1\",\"otp_verify_date\":\"2024-05-15 14:05:35\",\"user_activation_date\":null,\"created_at\":\"2024-05-15T14:03:42.000000Z\",\"updated_at\":\"2024-05-15T14:06:43.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 14:06:43','2024-05-15 14:06:43'),
(57,'2024-05-15 19:38:29',12,'users','Update','{\"id\":12,\"name\":\"SANJAY JADAV\",\"username\":\"7003319369\",\"loyality_card_no\":259993766,\"mobile_no\":\"7003319369\",\"email\":\"shankha@softhought.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"N\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":6085,\"mobile_hash\":\"b7b70786319b3d88b90835c4abaef19f\",\"status\":\"1\",\"otp_verify_date\":\"2024-05-15 14:05:35\",\"user_activation_date\":null,\"created_at\":\"2024-05-15T14:03:42.000000Z\",\"updated_at\":\"2024-05-15T14:08:29.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 14:08:29','2024-05-15 14:08:29'),
(58,'2024-05-15 19:39:45',12,'users','Update','{\"id\":12,\"name\":\"SANJAY JADAV\",\"username\":\"7003319369\",\"loyality_card_no\":259993767,\"mobile_no\":\"7003319369\",\"email\":\"shankha@softhought.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"N\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":6085,\"mobile_hash\":\"b7b70786319b3d88b90835c4abaef19f\",\"status\":\"1\",\"otp_verify_date\":\"2024-05-15 14:05:35\",\"user_activation_date\":null,\"created_at\":\"2024-05-15T14:03:42.000000Z\",\"updated_at\":\"2024-05-15T14:09:45.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 14:09:45','2024-05-15 14:09:45'),
(59,'2024-05-15 19:41:06',38,'user_account_activitys','Update','{\"logout_time\":\"2024-05-15T14:11:06.574814Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 14:11:06','2024-05-15 14:11:06'),
(60,'2024-05-15 19:51:53',13,'users','Insert','{\"name\":\"S.K.SARKAR\",\"username\":\"9153575808\",\"mobile_no\":\"9153575808\",\"email\":\"shankhacse@gmail.com\",\"address\":\"RAJ APPARTMENT, FLAT NO. 4\",\"role_id\":4,\"new\":\"Yes\",\"otp\":8965,\"mobile_hash\":\"a1bf1d3540f36a9f670588b1b6fee58b\",\"updated_at\":\"2024-05-15T14:21:53.000000Z\",\"created_at\":\"2024-05-15T14:21:53.000000Z\",\"id\":13}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 14:21:53','2024-05-15 14:21:53'),
(61,'2024-05-15 19:51:53',4417,'customer_details','Insert','{\"user_id\":13,\"customer_name\":\"MAA ENGINEERING\",\"customersapid\":\"909257\",\"contact_name\":\"S.K.SARKAR\",\"phone_no\":\"9153575808\",\"contact_phno\":\"9153575808\",\"contact_email\":\"shankhacse@gmail.com\",\"contact_department\":\"Machine Sale\",\"contact_designation\":\"sales Person\",\"customer_address1\":\"RAJ APPARTMENT, FLAT NO. 4\",\"customer_address2\":\"41\\/3 P.G.H.SHAH ROAD\",\"customer_city\":\"WEST BENGAL\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"700032\",\"country\":\"India\",\"pan_no\":\"AHJPM7796H\",\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"pan\":\"panAHJPM7796H1715782913.jpg\",\"updated_at\":\"2024-05-15T14:21:53.000000Z\",\"created_at\":\"2024-05-15T14:21:53.000000Z\",\"id\":4417}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-15 14:21:53','2024-05-15 14:21:53'),
(64,'2024-05-16 11:05:32',3,'card_category_master','Update','{\"tier_id\":3,\"tier_name\":\"Platinum\",\"tier_code\":\"PL\",\"loyalty_reward_pt_lower_limit\":\"10000\",\"loyalty_reward_pt_upper_limit\":null,\"minimum_order_value\":\"1000\",\"payment_condition\":\"100\",\"welcome_rewards_point\":null,\"validity_of_rewards_in_days\":\"365\",\"point_per_unit_in_inr\":\"1.00\",\"points_on_parts_srvc_purchase_in_prcntg\":\"1.50\",\"online_purchase_benifit_prcntg\":\"0.50\",\"created_at\":null,\"updated_at\":null}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 05:35:32','2024-05-16 05:35:32'),
(65,'2024-05-16 11:18:48',14,'users','Insert','{\"name\":\"SANJAY JADAV\",\"username\":\"7003319369\",\"mobile_no\":\"7003319369\",\"email\":\"shankha@softhought.com\",\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"new\":\"Yes\",\"otp\":5202,\"mobile_hash\":\"b7b70786319b3d88b90835c4abaef19f\",\"updated_at\":\"2024-05-16T05:48:47.000000Z\",\"created_at\":\"2024-05-16T05:48:47.000000Z\",\"id\":14}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 05:48:48','2024-05-16 05:48:48'),
(66,'2024-05-16 11:18:48',4418,'customer_details','Insert','{\"user_id\":14,\"customer_name\":\"VOLTAS LTD\",\"customersapid\":\"905793\",\"contact_name\":\"SANJAY JADAV\",\"phone_no\":\"7003319369\",\"contact_phno\":\"7003319369\",\"contact_email\":\"shankha@softhought.com\",\"contact_department\":\"Machine Sales\",\"contact_designation\":\"Sales Person\",\"customer_address1\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"customer_address2\":\"BEHIND HP GAS GODOWN\",\"customer_city\":\"ORISSA\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"758038\",\"country\":\"India\",\"pan_no\":null,\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"updated_at\":\"2024-05-16T05:48:48.000000Z\",\"created_at\":\"2024-05-16T05:48:48.000000Z\",\"id\":4418}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 05:48:48','2024-05-16 05:48:48'),
(67,'2024-05-16 11:20:22',14,'customer_details','Update','{\"id\":14,\"name\":\"SANJAY JADAV\",\"username\":\"7003319369\",\"loyality_card_no\":null,\"mobile_no\":\"7003319369\",\"email\":\"shankha@softhought.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"N\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":5202,\"mobile_hash\":\"b7b70786319b3d88b90835c4abaef19f\",\"status\":2,\"otp_verify_date\":\"2024-05-16T05:50:22.629206Z\",\"user_activation_date\":null,\"created_at\":\"2024-05-16T05:48:47.000000Z\",\"updated_at\":\"2024-05-16T05:50:22.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 05:50:22','2024-05-16 05:50:22'),
(68,'2024-05-16 11:20:42',14,'users','Update','{\"id\":14,\"name\":\"SANJAY JADAV\",\"username\":\"7003319369\",\"loyality_card_no\":259993768,\"mobile_no\":\"7003319369\",\"email\":\"shankha@softhought.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"N\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":5202,\"mobile_hash\":\"b7b70786319b3d88b90835c4abaef19f\",\"status\":\"1\",\"otp_verify_date\":\"2024-05-16 05:50:22\",\"user_activation_date\":null,\"created_at\":\"2024-05-16T05:48:47.000000Z\",\"updated_at\":\"2024-05-16T05:50:42.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 05:50:42','2024-05-16 05:50:42'),
(69,'2024-05-16 11:25:22',41,'user_account_activitys','Update','{\"logout_time\":\"2024-05-16T05:58:20.168918Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 05:58:20','2024-05-16 05:58:20'),
(70,'2024-05-16 11:31:17',15,'users','Insert','{\"name\":\"AJAY JADAV\",\"username\":\"8944961893\",\"mobile_no\":\"8944961893\",\"email\":\"manikpal457@gmail.com\",\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"new\":\"Yes\",\"otp\":4373,\"mobile_hash\":\"6b37d6e70b960dff6023b0ebbfc5354b\",\"updated_at\":\"2024-05-16T06:04:14.000000Z\",\"created_at\":\"2024-05-16T06:04:14.000000Z\",\"id\":15}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 06:04:14','2024-05-16 06:04:14'),
(71,'2024-05-16 11:31:17',4419,'customer_details','Insert','{\"user_id\":15,\"customer_name\":\"LG LTD\",\"customersapid\":\"805798\",\"contact_name\":\"AJAY JADAV\",\"phone_no\":\"8944961893\",\"contact_phno\":\"8944961893\",\"contact_email\":\"manikpal457@gmail.com\",\"contact_department\":\"Machine Sales\",\"contact_designation\":\"Developer\",\"customer_address1\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"customer_address2\":\"BEHIND HP GAS GODOWN\",\"customer_city\":\"ORISSA\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"758038\",\"country\":\"India\",\"pan_no\":null,\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"updated_at\":\"2024-05-16T06:04:14.000000Z\",\"created_at\":\"2024-05-16T06:04:14.000000Z\",\"id\":4419}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 06:04:14','2024-05-16 06:04:14'),
(73,'2024-05-16 11:42:20',2,'card_category_master','Update','{\"tier_id\":2,\"tier_name\":\"Gold\",\"tier_code\":\"GD\",\"loyalty_reward_pt_lower_limit\":\"2500\",\"loyalty_reward_pt_upper_limit\":\"9999\",\"minimum_order_value\":\"1000\",\"payment_condition\":\"100\",\"welcome_rewards_point\":null,\"validity_of_rewards_in_days\":\"365\",\"point_per_unit_in_inr\":\"1.00\",\"points_on_parts_srvc_purchase_in_prcntg\":\"1.25\",\"online_purchase_benifit_prcntg\":\"0.50\",\"created_at\":null,\"updated_at\":null}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 06:15:18','2024-05-16 06:15:18'),
(74,'2024-05-16 11:58:26',16,'users','Insert','{\"name\":\"AJAY JADAV\",\"username\":\"9933306818\",\"mobile_no\":\"9933306818\",\"email\":\"manikpal457@gmail.com\",\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"new\":\"Yes\",\"otp\":2389,\"mobile_hash\":\"c2e92efa207a428fff6e35c935192f93\",\"updated_at\":\"2024-05-16T06:31:23.000000Z\",\"created_at\":\"2024-05-16T06:31:23.000000Z\",\"id\":16}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 06:31:23','2024-05-16 06:31:23'),
(75,'2024-05-16 11:58:26',4420,'customer_details','Insert','{\"user_id\":16,\"customer_name\":\"LG LTD\",\"customersapid\":\"805798\",\"contact_name\":\"AJAY JADAV\",\"phone_no\":\"9933306818\",\"contact_phno\":\"9933306818\",\"contact_email\":\"manikpal457@gmail.com\",\"contact_department\":\"Machine Sales\",\"contact_designation\":\"IT\",\"customer_address1\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"customer_address2\":\"BEHIND HP GAS GODOWN\",\"customer_city\":\"ORISSA\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"758038\",\"country\":\"India\",\"pan_no\":null,\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"updated_at\":\"2024-05-16T06:31:23.000000Z\",\"created_at\":\"2024-05-16T06:31:23.000000Z\",\"id\":4420}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 06:31:23','2024-05-16 06:31:23'),
(76,'2024-05-16 12:00:26',17,'users','Insert','{\"name\":\"SANJAY JADAV\",\"username\":\"7003319369\",\"mobile_no\":\"7003319369\",\"email\":\"shankha@softhought.com\",\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"new\":\"Yes\",\"otp\":5491,\"mobile_hash\":\"b7b70786319b3d88b90835c4abaef19f\",\"updated_at\":\"2024-05-16T06:30:26.000000Z\",\"created_at\":\"2024-05-16T06:30:26.000000Z\",\"id\":17}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 06:30:26','2024-05-16 06:30:26'),
(77,'2024-05-16 12:00:27',4421,'customer_details','Insert','{\"user_id\":17,\"customer_name\":\"VOLTAS LTD\",\"customersapid\":\"905793\",\"contact_name\":\"SANJAY JADAV\",\"phone_no\":\"7003319369\",\"contact_phno\":\"7003319369\",\"contact_email\":\"shankha@softhought.com\",\"contact_department\":\"Machine Sales\",\"contact_designation\":\"Sales person\",\"customer_address1\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"customer_address2\":\"BEHIND HP GAS GODOWN\",\"customer_city\":\"ORISSA\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"758038\",\"country\":\"India\",\"pan_no\":\"AHJPM7796H\",\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"pan\":\"panAHJPM7796H1715841026.jpg\",\"updated_at\":\"2024-05-16T06:30:27.000000Z\",\"created_at\":\"2024-05-16T06:30:27.000000Z\",\"id\":4421}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 06:30:27','2024-05-16 06:30:27'),
(78,'2024-05-16 12:08:37',18,'users','Insert','{\"name\":\"S.K.SARKAR\",\"username\":\"9153575808\",\"mobile_no\":\"9153575808\",\"email\":\"anilk89100@gmail.com\",\"address\":\"RAJ APPARTMENT, FLAT NO. 4\",\"role_id\":4,\"new\":\"Yes\",\"otp\":4204,\"mobile_hash\":\"a1bf1d3540f36a9f670588b1b6fee58b\",\"updated_at\":\"2024-05-16T06:38:37.000000Z\",\"created_at\":\"2024-05-16T06:38:37.000000Z\",\"id\":18}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 06:38:37','2024-05-16 06:38:37'),
(79,'2024-05-16 12:08:37',4422,'customer_details','Insert','{\"user_id\":18,\"customer_name\":\"MAA ENGINEERING\",\"customersapid\":\"909257\",\"contact_name\":\"S.K.SARKAR\",\"phone_no\":\"9153575808\",\"contact_phno\":\"9153575808\",\"contact_email\":\"anilk89100@gmail.com\",\"contact_department\":\"Machine Sale\",\"contact_designation\":\"a\",\"customer_address1\":\"RAJ APPARTMENT, FLAT NO. 4\",\"customer_address2\":\"41\\/3 P.G.H.SHAH ROAD\",\"customer_city\":\"WEST BENGAL\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"700032\",\"country\":\"India\",\"pan_no\":null,\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"updated_at\":\"2024-05-16T06:38:37.000000Z\",\"created_at\":\"2024-05-16T06:38:37.000000Z\",\"id\":4422}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 06:38:37','2024-05-16 06:38:37'),
(80,'2024-05-16 12:12:13',39,'user_account_activitys','Update','{\"logout_time\":\"2024-05-16T06:42:13.874098Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 06:42:13','2024-05-16 06:42:13'),
(81,'2024-05-16 12:36:35',19,'customer_details','Update','{\"id\":19,\"name\":\"SANJAY JADAV\",\"username\":\"7003319369\",\"loyality_card_no\":null,\"mobile_no\":\"7003319369\",\"email\":\"shankha@softhought.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"N\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":1205,\"mobile_hash\":\"b7b70786319b3d88b90835c4abaef19f\",\"status\":2,\"otp_verify_date\":\"2024-05-16T07:06:35.302982Z\",\"user_activation_date\":null,\"created_at\":\"2024-05-16T07:04:35.000000Z\",\"updated_at\":\"2024-05-16T07:06:35.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 07:06:35','2024-05-16 07:06:35'),
(82,'2024-05-16 12:38:29',19,'users','Update','{\"id\":19,\"name\":\"SANJAY JADAV\",\"username\":\"7003319369\",\"loyality_card_no\":259993769,\"mobile_no\":\"7003319369\",\"email\":\"shankha@softhought.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"N\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":1205,\"mobile_hash\":\"b7b70786319b3d88b90835c4abaef19f\",\"status\":\"1\",\"otp_verify_date\":\"2024-05-16 07:06:35\",\"user_activation_date\":null,\"created_at\":\"2024-05-16T07:04:35.000000Z\",\"updated_at\":\"2024-05-16T07:08:29.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 07:08:29','2024-05-16 07:08:29'),
(83,'2024-05-16 12:52:40',20,'users','Insert','{\"name\":\"MAHESH JI\",\"username\":\"9717125259\",\"mobile_no\":\"9717125259\",\"email\":\"shivam@gmail.com\",\"address\":\"Assam University, Silchar\",\"role_id\":4,\"new\":\"Yes\",\"otp\":7963,\"mobile_hash\":\"0eb5caed80673e7c1bfeff43468f9850\",\"updated_at\":\"2024-05-16T07:22:40.000000Z\",\"created_at\":\"2024-05-16T07:22:40.000000Z\",\"id\":20}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 07:22:40','2024-05-16 07:22:40'),
(84,'2024-05-16 12:52:40',4424,'customer_details','Insert','{\"user_id\":20,\"customer_name\":\"MK Engineering\",\"customersapid\":\"909514\",\"contact_name\":\"MAHESH JI\",\"phone_no\":\"9717125259\",\"contact_phno\":\"9717125259\",\"contact_email\":\"shivam@gmail.com\",\"contact_department\":\"Purchase\",\"contact_designation\":\"Manager\",\"customer_address1\":\"Assam University, Silchar\",\"customer_address2\":null,\"customer_city\":\"Kamrup\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"781011\",\"country\":\"India\",\"pan_no\":null,\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"updated_at\":\"2024-05-16T07:22:40.000000Z\",\"created_at\":\"2024-05-16T07:22:40.000000Z\",\"id\":4424}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 07:22:40','2024-05-16 07:22:40'),
(85,'2024-05-16 12:54:26',43,'user_account_activitys','Update','{\"logout_time\":\"2024-05-16T07:24:26.906640Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 07:24:26','2024-05-16 07:24:26'),
(86,'2024-05-16 12:56:57',21,'users','Insert','{\"name\":\"S.K.SARKAR\",\"username\":\"9153575808\",\"mobile_no\":\"9153575808\",\"email\":\"devsofthought@gmail.com\",\"address\":\"RAJ APPARTMENT, FLAT NO. 4\",\"role_id\":4,\"new\":\"Yes\",\"otp\":8144,\"mobile_hash\":\"a1bf1d3540f36a9f670588b1b6fee58b\",\"updated_at\":\"2024-05-16T07:26:57.000000Z\",\"created_at\":\"2024-05-16T07:26:57.000000Z\",\"id\":21}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 07:26:57','2024-05-16 07:26:57'),
(87,'2024-05-16 12:56:57',4425,'customer_details','Insert','{\"user_id\":21,\"customer_name\":\"MAA ENGINEERING\",\"customersapid\":\"909257\",\"contact_name\":\"S.K.SARKAR\",\"phone_no\":\"9153575808\",\"contact_phno\":\"9153575808\",\"contact_email\":\"devsofthought@gmail.com\",\"contact_department\":\"Machine Sale\",\"contact_designation\":\"Test\",\"customer_address1\":\"RAJ APPARTMENT, FLAT NO. 4\",\"customer_address2\":\"41\\/3 P.G.H.SHAH ROAD\",\"customer_city\":\"WEST BENGAL\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"700032\",\"country\":\"India\",\"pan_no\":null,\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"updated_at\":\"2024-05-16T07:26:57.000000Z\",\"created_at\":\"2024-05-16T07:26:57.000000Z\",\"id\":4425}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 07:26:57','2024-05-16 07:26:57'),
(88,'2024-05-16 13:01:39',1,'card_category_master','Update','{\"tier_id\":1,\"tier_name\":\"Silver\",\"tier_code\":\"SL\",\"loyalty_reward_pt_lower_limit\":\"0\",\"loyalty_reward_pt_upper_limit\":\"2499\",\"minimum_order_value\":\"1000\",\"payment_condition\":\"100\",\"welcome_rewards_point\":\"100\",\"validity_of_rewards_in_days\":\"180\",\"point_per_unit_in_inr\":\"1.00\",\"points_on_parts_srvc_purchase_in_prcntg\":\"1.00\",\"online_purchase_benifit_prcntg\":\"0.50\",\"created_at\":null,\"updated_at\":\"2024-05-16T07:31:39.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 07:31:39','2024-05-16 07:31:39'),
(89,'2024-05-16 13:28:24',42,'user_account_activitys','Update','{\"logout_time\":\"2024-05-16T07:58:24.803049Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 07:58:24','2024-05-16 07:58:24'),
(90,'2024-05-16 13:50:55',44,'user_account_activitys','Update','{\"logout_time\":\"2024-05-16T08:23:52.674795Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 08:23:52','2024-05-16 08:23:52'),
(91,'2024-05-16 14:08:45',19,'users','Insert','{\"id\":19,\"name\":\"SANJAY KUMAR\",\"username\":\"7003319369\",\"loyality_card_no\":\"259993769\",\"mobile_no\":\"7003319369\",\"email\":\"shankha@softhought.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":3383,\"mobile_hash\":\"b7b70786319b3d88b90835c4abaef19f\",\"status\":1,\"otp_verify_date\":\"2024-05-16 07:06:35\",\"user_activation_date\":null,\"created_at\":\"2024-05-16T07:04:35.000000Z\",\"updated_at\":\"2024-05-16T08:41:43.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 08:41:43','2024-05-16 08:41:43'),
(92,'2024-05-16 14:08:45',4426,'customer_details','Insert','{\"user_id\":19,\"customer_name\":\"VOLTAS LTD\",\"customersapid\":\"905793\",\"contact_name\":\"SANJAY KUMAR\",\"phone_no\":\"7003319369\",\"contact_phno\":\"7003319369\",\"contact_email\":\"shankha@softhought.com\",\"contact_department\":\"Machine Sales\",\"contact_designation\":\"sales Person\",\"customer_address1\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"customer_address2\":\"BEHIND HP GAS GODOWN\",\"customer_city\":\"ORISSA\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"758038\",\"country\":\"India\",\"pan_no\":\"AHJPM7796H\",\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"updated_at\":\"2024-05-16T08:41:43.000000Z\",\"created_at\":\"2024-05-16T08:41:43.000000Z\",\"id\":4426}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 08:41:43','2024-05-16 08:41:43'),
(93,'2024-05-16 14:14:38',19,'users','Update','{\"id\":19,\"name\":\"SANJAY KUMAR\",\"username\":\"7003319369\",\"loyality_card_no\":\"259993769\",\"mobile_no\":\"7003319369\",\"email\":\"shankha@softhought.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":3383,\"mobile_hash\":\"b7b70786319b3d88b90835c4abaef19f\",\"status\":1,\"otp_verify_date\":\"2024-05-16 07:06:35\",\"user_activation_date\":null,\"created_at\":\"2024-05-16T07:04:35.000000Z\",\"updated_at\":\"2024-05-16T08:47:35.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 08:47:35','2024-05-16 08:47:35'),
(94,'2024-05-16 14:14:38',4423,'customer_details','Update','{\"id\":4423,\"user_id\":19,\"customersapid\":\"905793\",\"customer_name\":\"VOLTAS LTD\",\"contact_name\":\"SANJAY KUMAR\",\"phone_no\":\"7003319369\",\"contact_phno\":\"7003319369\",\"contact_email\":\"shankha@softhought.com\",\"contact_department\":\"Machine Sales\",\"contact_designation\":\"sales Person\",\"customer_address1\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"customer_address2\":\"BEHIND HP GAS GODOWN\",\"customer_city\":\"ORISSA\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"758038\",\"country\":\"India\",\"pan\":\"panAHJPM7796H1715843075.jpg\",\"tan\":null,\"certificate\":null,\"gstin\":null,\"redemption_authorization\":null,\"pan_no\":\"AHJPM7796H\",\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"status\":1,\"created_at\":\"2024-05-16T07:04:35.000000Z\",\"updated_at\":\"2024-05-16T08:47:35.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 08:47:35','2024-05-16 08:47:35'),
(95,'2024-05-16 14:16:25',19,'users','Update','{\"id\":19,\"name\":\"SANJAY KUMAR\",\"username\":\"7003319369\",\"loyality_card_no\":\"259993769\",\"mobile_no\":\"7003319369\",\"email\":\"shankha@softhought.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":3383,\"mobile_hash\":\"b7b70786319b3d88b90835c4abaef19f\",\"status\":1,\"otp_verify_date\":\"2024-05-16 07:06:35\",\"user_activation_date\":null,\"created_at\":\"2024-05-16T07:04:35.000000Z\",\"updated_at\":\"2024-05-16T08:49:23.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 08:49:23','2024-05-16 08:49:23'),
(96,'2024-05-16 14:16:25',4423,'customer_details','Update','{\"id\":4423,\"user_id\":19,\"customersapid\":\"905793\",\"customer_name\":\"VOLTAS LTD\",\"contact_name\":\"SANJAY KUMAR\",\"phone_no\":\"7003319369\",\"contact_phno\":\"7003319369\",\"contact_email\":\"shankha@softhought.com\",\"contact_department\":\"Machine Sales\",\"contact_designation\":\"sales Person\",\"customer_address1\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"customer_address2\":\"BEHIND HP GAS GODOWN\",\"customer_city\":\"ORISSA\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"758038\",\"country\":\"India\",\"pan\":\"panAHJPM7796H1715843075.jpg\",\"tan\":null,\"certificate\":null,\"gstin\":null,\"redemption_authorization\":null,\"pan_no\":\"AHJPM7796H\",\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"status\":1,\"created_at\":\"2024-05-16T07:04:35.000000Z\",\"updated_at\":\"2024-05-16T08:47:35.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 08:49:23','2024-05-16 08:49:23'),
(97,'2024-05-16 14:21:33',19,'users','Update','{\"id\":19,\"name\":\"SANJAY KUMAR\",\"username\":\"7003319369\",\"loyality_card_no\":\"259993769\",\"mobile_no\":\"7003319369\",\"email\":\"shankha@softhought.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":3383,\"mobile_hash\":\"b7b70786319b3d88b90835c4abaef19f\",\"status\":1,\"otp_verify_date\":\"2024-05-16 07:06:35\",\"user_activation_date\":null,\"created_at\":\"2024-05-16T07:04:35.000000Z\",\"updated_at\":\"2024-05-16T08:54:30.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 08:54:30','2024-05-16 08:54:30'),
(98,'2024-05-16 14:21:33',4423,'customer_details','Update','{\"id\":4423,\"user_id\":19,\"customersapid\":\"905793\",\"customer_name\":\"VOLTAS LTD\",\"contact_name\":\"SANJAY KUMAR\",\"phone_no\":\"7003319369\",\"contact_phno\":\"7003319369\",\"contact_email\":\"shankha@softhought.com\",\"contact_department\":\"Machine Sales\",\"contact_designation\":\"sales Person\",\"customer_address1\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"customer_address2\":\"BEHIND HP GAS GODOWN\",\"customer_city\":\"ORISSA\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"758038\",\"country\":\"India\",\"pan\":\"panAHJPM7796H1715843075.jpg\",\"tan\":null,\"certificate\":null,\"gstin\":null,\"redemption_authorization\":null,\"pan_no\":\"AHJPM7796H\",\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"status\":1,\"created_at\":\"2024-05-16T07:04:35.000000Z\",\"updated_at\":\"2024-05-16T08:47:35.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 08:54:30','2024-05-16 08:54:30'),
(99,'2024-05-16 14:21:40',19,'users','Update','{\"id\":19,\"name\":\"SANJAY KUMAR\",\"username\":\"7003319369\",\"loyality_card_no\":\"259993769\",\"mobile_no\":\"7003319369\",\"email\":\"shankha@softhought.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":3383,\"mobile_hash\":\"b7b70786319b3d88b90835c4abaef19f\",\"status\":1,\"otp_verify_date\":\"2024-05-16 07:06:35\",\"user_activation_date\":null,\"created_at\":\"2024-05-16T07:04:35.000000Z\",\"updated_at\":\"2024-05-16T08:54:37.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 08:54:37','2024-05-16 08:54:37'),
(100,'2024-05-16 14:21:40',4423,'customer_details','Update','{\"id\":4423,\"user_id\":19,\"customersapid\":\"905793\",\"customer_name\":\"VOLTAS LTD\",\"contact_name\":\"SANJAY KUMAR\",\"phone_no\":\"7003319369\",\"contact_phno\":\"7003319369\",\"contact_email\":\"shankha@softhought.com\",\"contact_department\":\"Machine Sales\",\"contact_designation\":\"sales Person\",\"customer_address1\":\"C\\/O- TOTAL LOGISTIC INDIA PVT. LTD.\",\"customer_address2\":\"BEHIND HP GAS GODOWN\",\"customer_city\":\"ORISSA\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"758038\",\"country\":\"India\",\"pan\":\"panAHJPM7796H1715843075.jpg\",\"tan\":null,\"certificate\":null,\"gstin\":null,\"redemption_authorization\":null,\"pan_no\":\"AHJPM7796H\",\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"status\":1,\"created_at\":\"2024-05-16T07:04:35.000000Z\",\"updated_at\":\"2024-05-16T08:47:35.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 08:54:37','2024-05-16 08:54:37'),
(101,'2024-05-16 14:21:56',20,'users','Update','{\"id\":20,\"name\":\"MAHESH JIA\",\"username\":\"9717125259\",\"loyality_card_no\":null,\"mobile_no\":\"9717125259\",\"email\":\"shivam@gmail.com\",\"email_verified_at\":null,\"profile_image\":null,\"address\":\"Assam University, Silchar\",\"role_id\":4,\"is_active\":\"Y\",\"is_online\":\"N\",\"old_user_id\":null,\"new\":\"Yes\",\"otp\":7963,\"mobile_hash\":\"0eb5caed80673e7c1bfeff43468f9850\",\"status\":2,\"otp_verify_date\":null,\"user_activation_date\":null,\"created_at\":\"2024-05-16T07:22:40.000000Z\",\"updated_at\":\"2024-05-16T08:54:54.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 08:54:54','2024-05-16 08:54:54'),
(102,'2024-05-16 14:21:56',4424,'customer_details','Update','{\"id\":4424,\"user_id\":20,\"customersapid\":\"909514\",\"customer_name\":\"MK Engineering\",\"contact_name\":\"MAHESH JIA\",\"phone_no\":\"9717125259\",\"contact_phno\":\"9717125259\",\"contact_email\":\"shivam@gmail.com\",\"contact_department\":\"Purchase\",\"contact_designation\":\"Manager\",\"customer_address1\":\"Assam University, Silchar\",\"customer_address2\":null,\"customer_city\":\"Kamrup\",\"customer_state\":\"ANDAMAN AND NICOBAR ISLANDS\",\"salesoffice\":\"Kolkata Branch\",\"pin\":\"781011\",\"country\":\"India\",\"pan\":null,\"tan\":null,\"certificate\":null,\"gstin\":null,\"redemption_authorization\":null,\"pan_no\":null,\"tan_no\":null,\"certificate_no\":null,\"gstin_no\":null,\"status\":1,\"created_at\":\"2024-05-16T07:22:40.000000Z\",\"updated_at\":\"2024-05-16T08:54:54.000000Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 08:54:54','2024-05-16 08:54:54');

/*Table structure for table `menu_permissions` */

DROP TABLE IF EXISTS `menu_permissions`;

CREATE TABLE `menu_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `menu_id` bigint(20) unsigned NOT NULL,
  `add` int(11) NOT NULL DEFAULT 0,
  `edit` int(11) NOT NULL DEFAULT 0,
  `delete` int(11) NOT NULL DEFAULT 0,
  `print` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_permissions_user_id_foreign` (`user_id`),
  KEY `menu_permissions_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_permissions_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  CONSTRAINT `menu_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menu_permissions` */

insert  into `menu_permissions`(`id`,`user_id`,`menu_id`,`add`,`edit`,`delete`,`print`,`created_at`,`updated_at`) values 
(270,1,1,0,0,0,0,'2024-05-16 09:42:11','2024-05-16 09:42:11'),
(271,1,2,0,0,0,0,'2024-05-16 09:42:12','2024-05-16 09:42:12'),
(272,1,3,0,0,0,0,'2024-05-16 09:42:12','2024-05-16 09:42:12'),
(273,1,4,0,0,0,0,'2024-05-16 09:42:12','2024-05-16 09:42:12'),
(274,1,5,0,0,0,0,'2024-05-16 09:42:12','2024-05-16 09:42:12'),
(275,1,6,0,0,0,0,'2024-05-16 09:42:12','2024-05-16 09:42:12'),
(276,1,7,0,0,0,0,'2024-05-16 09:42:12','2024-05-16 09:42:12'),
(277,1,8,0,0,0,0,'2024-05-16 09:42:12','2024-05-16 09:42:12');

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `is_parent` enum('Y','N') NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `menu_srl` int(11) NOT NULL,
  `is_active` enum('Y','N') NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menus` */

insert  into `menus`(`id`,`name`,`route`,`controller`,`method`,`is_parent`,`parent_id`,`menu_srl`,`is_active`,`icon`,`created_at`,`updated_at`) values 
(1,'Dashboard','dashboard','DashboardController','index','Y',NULL,1,'Y','<i class=\"nav-icon far fa-image\"></i>','2024-03-14 18:26:45','2024-03-14 18:26:51'),
(2,'User Management',NULL,NULL,NULL,'Y',NULL,2,'Y','<i class=\"nav-icon fas fa-user-shield \"></i>','2023-11-15 16:07:39','2023-11-15 16:07:41'),
(3,'User','user','UserController','index','N',2,1,'Y','<i class=\"nav-icon far fa-dot-circle ?>\"></i>','2023-11-15 16:08:17','2023-11-15 16:08:18'),
(4,'Menu Permission','menupermission','MenuController','index','Y',2,2,'Y','<i class=\"nav-icon far fa-dot-circle ?>\"></i>','2023-11-15 16:09:20','2023-11-15 16:09:21'),
(5,'Settings',NULL,NULL,NULL,'Y',NULL,3,'Y','<i class=\"nav-icon fas fa-user-shield \"></i>','2024-05-08 19:06:44','2024-05-08 19:06:46'),
(6,'Card Category','cardcategory','MasterController','cardCategoryView','N',5,1,'Y','<i class=\"nav-icon far fa-dot-circle ?>\"></i>','2024-05-08 19:08:36','2024-05-08 19:08:38'),
(7,'Change Password','changepassword','LoginController','renderChangePassword','N',2,3,'Y','<i class=\"nav-icon far fa-dot-circle ?>\"></i>','2024-05-08 19:16:18','2024-05-08 19:16:20'),
(8,'Customer List','customer','CustomerController','index','N',NULL,4,'Y','<i class=\"nav-icon far fa-image\"></i>','2023-11-15 16:08:17','2023-11-15 16:08:18');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_100000_create_password_reset_tokens_table',1),
(2,'2019_08_19_000000_create_failed_jobs_table',1),
(3,'2019_12_14_000001_create_personal_access_tokens_table',1),
(4,'2024_02_23_101026_create_roles_table',1),
(5,'2024_02_23_101027_create_users_table',1),
(6,'2024_02_23_101028_create_menus_table',1),
(7,'2024_02_23_101029_create_menu_permissions_table',1),
(8,'2024_03_10_131445_create_user_account_activitys_table',1),
(9,'2024_05_07_103702_alter_users_table',2),
(10,'2024_05_08_115909_create_card_category_master_table',3);

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  `is_active` enum('1','0') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`role`,`is_active`) values 
(1,'Developer','1'),
(2,'Admin','1'),
(3,'User','1'),
(4,'Customer','1');

/*Table structure for table `sales_office` */

DROP TABLE IF EXISTS `sales_office`;

CREATE TABLE `sales_office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_office_code` text DEFAULT NULL,
  `sales_office` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sales_office` */

insert  into `sales_office`(`id`,`sales_office_code`,`sales_office`,`location`,`created_at`,`updated_at`) values 
(2,'1001','Kolkata Branch','002','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(3,'1011','Jorhat Branch','011','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(4,'1021','Siliguri Branch','014','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(5,'1031','Sibsagar Branch','018','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(6,'1041','Krishnanagar Branch','032','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(7,'1051','Mazaffarpur Branch','041','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(8,'1061','Durgapur Branch ','042','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(9,'1071','Rampurhat Branch','043','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(10,'1091','Asansol Branch ','051','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(11,'109E','Asansol Branch -MFG PARTS','051','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(12,'109T','Asansol Branch -TRD EMS','051','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(13,'1111','Shillong Branch','064','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(14,'112N','Kharagpur Branch','069','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(15,'1131','Patna Branch','070','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(16,'1151','Guwahati Branch','090','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(17,'1161','Tinsukia Branch','091','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(18,'1171','Kolkata Port','062','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(19,'1191','Mayabandar (Andaman&Nicobar)','096','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(20,'1221','Purnia Branch','007','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(21,'1231','Sasaram Branch','013','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(22,'1241','Bankura Branch','036','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(23,'1251','Begusarai Branch','097','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(24,'1261','Gaya Branch','092','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(25,'1271','Aliporeduar Branch','094','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(26,'1281','Haldia Branch','115','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(27,'1291','Siwan Branch','116','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(28,'1301','Darbhanga Branch','119','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(29,'1311','Purulia Branch','121','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(30,'1321','Asansol Manufacturing Branch','135','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(31,'1341','Barpeta Branch','144','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(32,'1351','Guwahati Stockyard Branch','151','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(33,'1361','Asansol-Parts Cap','159','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(34,'2002','Jamshedpur Branch','012','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(35,'2012','Ranchi Branch','054','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(36,'201E','Ranchi Branch-MFG PARTS','054','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(37,'201T','Ranchi Branch','054','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(38,'2022','Bhubaneswar Branch','016','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(39,'202E','Bhubaneswar Branch-MFG P','016','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(40,'2042','Talcher Branch','019','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(41,'2052','Crc - Asansol Branch ','023','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(42,'2072','Talcher-MARC Branch','031','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(43,'2082','Bccl-Dhanbad-MARC Branch','034','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(44,'2092','Kodarma Branch','049','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(45,'2102','Dhanbad Branch','052','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(46,'210E','Dhanbad Branch-MFG PARTS','052','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(47,'210T','Dhanbad Branch-TRD PARTS','052','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(48,'2112','W BKR-S/T East Bl MARC','057','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(49,'211E','W BKR-S/TEast Bl BRN-MFG','057','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(50,'2122','Jharsuguda Branch','055','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(51,'2132','Barbil Branch','056','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(52,'2142','West Bokaro Branch','053','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(53,'214E','WestBokaro BRN MFG PARTS','053','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(54,'2152','Paradeep Branch','067','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(55,'2162','Noamundi Branch','082','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(56,'216E','Noamundi Branch -MFG PART','082','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(57,'2172','ECL Sonepur Bazari','005','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(58,'2182','ECl-Jhanjra','029','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(59,'2192','BARBIL JSPL MARC Bucyrus','081','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(60,'2202','Bargarh Branch','086','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(61,'2212','Balasore Branch','098','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(62,'2222','Berhampur Branch','004','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(63,'2232','Jeypore Branch','118','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(64,'2242','Pakur Branch','105','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(65,'2262','RCMLRajmahal MARC','124','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(66,'2272','Lodhna SIML MARC','127','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(67,'2282','ECL Rajmahal','129','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(68,'2292','Jajpur-NSPL Branch','130','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(69,'2302','Jhanjra-II ECL','131','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(70,'2312','Khurda Branch','132','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(71,'2322','Manguli Branch','133','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(72,'2332','Daltonganj Branch','143','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(73,'2342','Sahibganj Branch','145','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(74,'2352','Khordha Stockyard','152','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(75,'2362','Rajganjpur,DCBL','157','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(76,'2372','Dhanbad-Parts Cap','158','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(77,'3003','Agucha Mines Branch MARC ','003','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(78,'3013','Jodhpur Branch','006','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(79,'3023','Jammu Branch','008','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(80,'3033','Kota Branch','009','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(81,'3043','Udaipur Branch','025','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(82,'304E','Udaipur Branch-MFG PARTS','025','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(83,'3053','Chandigarh Branch','027','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(84,'3063','Jaipur Branch','028','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(85,'3073','Bhatinda Branch','033','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(86,'3083','Bikaner Branch','040','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(87,'3093','Koldam Project Branch','045','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(88,'3103','Barmer Branch','058','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(89,'3113','Srinagar Branch','059','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(90,'3123','Bhilwara Branch','060','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(91,'3133','Shajahanpur Branch','063','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(92,'313T','Shajahanpur Branch -TRD E','063','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(93,'3143','Ludhiana Branch','075','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(94,'3153','Sikar Branch','077','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(95,'3163','Karnal Branch','079','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(96,'3173','Amritsar Branch','073','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(97,'3183','Hanumangarh Branch','085','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(98,'3193','Udaipur Branch workshop','083','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(99,'3203','Mumbai Port','026','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(100,'3213','Ajmer Branch','039','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(101,'3223','Agucha Mines Branch BUC','061','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(102,'3233','Rajouri Branch','066','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(103,'3243','Shimla Branch','095','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(104,'3253','Kolihan MARC Branch','117','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(105,'3263','Chanderia Branch','120','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(106,'3273','ACL Rabriyawas MARC Branch','122','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(107,'3283','Hissar Branch','125','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(108,'3293','Bhiwadi Branch','126','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(109,'3313','Zawar MARC Branch','134','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(110,'3323','Darlaghat - ACL','137','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(111,'3333','Ganganagar Branch','139','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(112,'3343','Rohtak Branch','140','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(113,'3353','Nagaur Branch','141','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(114,'3363','Jhajjar Branch','142','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(115,'3373','Nimbahera Branch','150','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(116,'3383','Karoli Branch','149','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(117,'3393','Jaipur Stockyard','148','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(118,'3403','Neem Ka Thana Branch','153','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(119,'3413','Dariba Branch','146','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(120,'4004','Dehradun Branch','010','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(121,'4014','Delhi (Okhla) Branch','020','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(122,'4034','Greater Noida Branch','022','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(123,'403E','Sahibabad Branch','022','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(124,'4044','Varanasi Branch','030','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(125,'4054','Behat Branch','035','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(126,'4064','Jhansi Branch','037','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(127,'4074','Mohaba Branch','038','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(128,'4104','Haridwar Branch','048','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(129,'4114','Haldwani Branch','050','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(130,'4124','Kishanganga Branch','065','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(131,'4134','Lucknow Branch','074','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(132,'4144','Manesar Branch','078','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(133,'4154','Bangalore Branch','080','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(134,'415N','BANGALORE BRANCH - NON EXCISE','080','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(135,'4164','Kanpur Branch','093','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(136,'4174','Unnati Workshop','046','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(137,'4194','Allahabad Branch','068','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(138,'4204','Gorakhpur Branch','084','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(139,'4214','Kosi Branch','087','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(140,'4224','DLF SEZ Gurgaon','114','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(141,'4234','Unnati Manufacturing','138','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(142,'4244','Anpara Branch','108','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(143,'4254','Greater Noida (SBP) Branch','154','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(144,'5015','Bicharpur','147','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(145,'5025','Kothagudem-PVK-5','156','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(146,'6006','GCPL-GWS','000','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(147,'6016','Dankuni Warehouse','128','2021-11-10 05:46:29','2021-11-10 05:46:29'),
(148,'6026','Dankuni Manufacturing Branch','155','2021-11-10 05:46:29','2021-11-10 05:46:29');

/*Table structure for table `serialmaster` */

DROP TABLE IF EXISTS `serialmaster`;

CREATE TABLE `serialmaster` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `moduleTag` varchar(50) DEFAULT NULL,
  `lastnumber` int(20) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `serialmaster` */

insert  into `serialmaster`(`id`,`moduleTag`,`lastnumber`,`module`,`comments`,`created_at`,`updated_at`) values 
(1,NULL,259993769,'LOYALTY_NO',NULL,'2024-05-15 18:10:25','2024-05-16 07:08:25');

/*Table structure for table `state_list` */

DROP TABLE IF EXISTS `state_list`;

CREATE TABLE `state_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `state_list` */

insert  into `state_list`(`id`,`state`) values 
(1,'ANDAMAN AND NICOBAR ISLANDS'),
(2,'ANDHRA PRADESH'),
(3,'ARUNACHAL PRADESH'),
(4,'ASSAM'),
(5,'BIHAR'),
(6,'CHATTISGARH'),
(7,'CHANDIGARH'),
(8,'DAMAN AND DIU'),
(9,'DELHI'),
(10,'DADRA AND NAGAR HAVELI'),
(11,'GOA'),
(12,'GUJARAT'),
(13,'HIMACHAL PRADESH'),
(14,'HARYANA'),
(15,'JAMMU AND KASHMIR'),
(16,'JHARKHAND'),
(17,'KERALA'),
(18,'KARNATAKA'),
(19,'LAKSHADWEEP'),
(20,'MEGHALAYA'),
(21,'MAHARASHTRA'),
(22,'MANIPUR'),
(23,'MADHYA PRADESH'),
(24,'MIZORAM'),
(25,'NAGALAND'),
(26,'ORISSA'),
(27,'PUNJAB'),
(28,'PONDICHERRY'),
(29,'RAJASTHAN'),
(30,'SIKKIM'),
(31,'TAMIL NADU'),
(32,'TRIPURA'),
(33,'UTTARAKHAND'),
(34,'UTTAR PRADESH'),
(35,'WEST BENGAL'),
(36,'TELANGANA');

/*Table structure for table `user_account_activitys` */

DROP TABLE IF EXISTS `user_account_activitys`;

CREATE TABLE `user_account_activitys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_browser` varchar(255) NOT NULL,
  `user_platform` varchar(255) NOT NULL,
  `login_time` datetime NOT NULL,
  `logout_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_account_activitys_user_id_foreign` (`user_id`),
  CONSTRAINT `user_account_activitys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_account_activitys` */

insert  into `user_account_activitys`(`id`,`user_id`,`ip_address`,`user_browser`,`user_platform`,`login_time`,`logout_time`,`created_at`,`updated_at`) values 
(42,1,'127.0.0.1','Firefox','Windows','2024-05-16 07:06:00','2024-05-16 07:58:24',NULL,NULL),
(43,19,'127.0.0.1','Firefox','Windows','2024-05-16 07:09:20','2024-05-16 07:24:26',NULL,NULL),
(44,19,'127.0.0.1','Firefox','Windows','2024-05-16 07:51:20','2024-05-16 08:23:52',NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `loyality_card_no` varchar(255) DEFAULT NULL COMMENT 'old',
  `mobile_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `is_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `is_online` enum('Y','N') NOT NULL DEFAULT 'N',
  `remember_token` varchar(100) DEFAULT NULL,
  `old_user_id` int(10) DEFAULT NULL COMMENT 'old LME user table id',
  `new` enum('Yes','No') DEFAULT 'No' COMMENT 'ref old table',
  `otp` int(6) DEFAULT NULL COMMENT 'ref old table',
  `mobile_hash` varchar(255) DEFAULT NULL COMMENT 'MD5',
  `status` int(11) DEFAULT 2 COMMENT 'ref old table',
  `otp_verify_date` datetime DEFAULT NULL COMMENT 'ref old table',
  `user_activation_date` datetime DEFAULT NULL COMMENT 'ref old table',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`username`,`loyality_card_no`,`mobile_no`,`email`,`email_verified_at`,`password`,`profile_image`,`address`,`role_id`,`is_active`,`is_online`,`remember_token`,`old_user_id`,`new`,`otp`,`mobile_hash`,`status`,`otp_verify_date`,`user_activation_date`,`created_at`,`updated_at`) values 
(1,'Developer','dev',NULL,NULL,NULL,NULL,'$2y$10$W5hmQ3cWloGx0DSlQqOlv.pj1HK9oevwPwLeElLWXzBB7OfNcdZB2',NULL,NULL,1,'Y','',NULL,NULL,'No',NULL,NULL,1,NULL,NULL,'2024-03-14 18:28:35','2024-05-16 07:58:24'),
(19,'SANJAY KUMAR','7003319369','259993769','7003319369','shankha@softhought.com',NULL,'$2y$10$hpCrz7PdgGxtjDIKnkSFl.RiO/wQFXOhnd.akeKjzrY3pL2v.zieW',NULL,'C/O- TOTAL LOGISTIC INDIA PVT. LTD.',4,'Y','',NULL,NULL,'Yes',3383,'b7b70786319b3d88b90835c4abaef19f',1,'2024-05-16 07:06:35',NULL,'2024-05-16 07:04:35','2024-05-16 08:54:37'),
(20,'MAHESH JIA','9717125259',NULL,'9717125259','shivam@gmail.com',NULL,'$2y$10$3HRx5KYqR3.dCHj80.8r6eUPDNTWWlOsH46X.pDjk7VAafQbfz5Gy',NULL,'Assam University, Silchar',4,'Y','N',NULL,NULL,'Yes',7963,'0eb5caed80673e7c1bfeff43468f9850',2,NULL,NULL,'2024-05-16 07:22:40','2024-05-16 08:54:54'),
(21,'S.K.SARKAR','9153575808',NULL,'9153575808','devsofthought@gmail.com',NULL,'$2y$10$yctyHoE1C.aOrl3izFwzm.fc606bYxIPfQi8iDnfk0onWIFixaHsG',NULL,'RAJ APPARTMENT, FLAT NO. 4',4,'Y','N',NULL,NULL,'Yes',8144,'a1bf1d3540f36a9f670588b1b6fee58b',2,'2024-05-16 07:27:29',NULL,'2024-05-16 07:26:57','2024-05-16 07:27:29');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
