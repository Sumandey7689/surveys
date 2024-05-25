/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - surveys
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`surveys` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `surveys`;

/*Table structure for table `client` */

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(255) DEFAULT NULL,
  `client_name` varbinary(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `complete_url` text DEFAULT NULL,
  `terminate_url` text DEFAULT NULL,
  `quotafull_url` text DEFAULT NULL,
  `is_active` enum('Y','N') DEFAULT 'Y',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `client` */

insert  into `client`(`id`,`client_id`,`client_name`,`description`,`complete_url`,`terminate_url`,`quotafull_url`,`is_active`,`date`) values 
(1,'9e04fa4544fd2ca192fc20c2be2528e2','Google','<h2>Benefits</h2>\r\n\r\n<ul>\r\n	<li><strong>Increased site engagement</strong>: Related search can drive more site engagement by helping users discover ads and content relevant to what they&#39;re viewing.</li>\r\n	<li><strong>Incremental revenue</strong>: Related search can help you generate incremental revenue by driving more traffic to your search pages, which you can monetize with relevant ads.</li>\r\n	<li><strong>Relevant search ads</strong>: On your search page, Google can deliver high-quality search ads that are relevant to the selected related search term.</li>\r\n	<li><strong>Better user experience</strong>: You control the look and feel of your related search units, allowing you to maintain a quality user experience for your site.</li>\r\n</ul>','redirects/c/9e04fa4544fd2ca192fc20c2be2528e2/complete?username=xxxx','redirects/c/9e04fa4544fd2ca192fc20c2be2528e2/terminate?username=xxxx','redirects/c/9e04fa4544fd2ca192fc20c2be2528e2/quotafull?username=xxxx','Y','2024-05-20 18:59:40');

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

/*Table structure for table `leads` */

DROP TABLE IF EXISTS `leads`;

CREATE TABLE `leads` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) DEFAULT NULL,
  `vendor_id` int(10) DEFAULT NULL,
  `client_id` int(10) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `user_info` text DEFAULT NULL,
  `status` enum('Pending','Complete','Terminates','Quota Full') DEFAULT 'Pending',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `leads` */

insert  into `leads`(`id`,`project_id`,`vendor_id`,`client_id`,`uid`,`user_info`,`status`,`date`) values 
(1,1,1,1,'xxxx','{\"user_agent\":{\"browser\":\"Firefox\",\"platform\":\"Windows\",\"device\":false},\"ip_address\":\"127.0.0.1\"}','Terminates','2024-05-25 10:56:53');

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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `log_table` */

insert  into `log_table`(`id`,`log_date`,`row_id`,`table_name`,`action`,`data_array`,`user_browser`,`user_platform`,`ip_address`,`member_id`,`user_id`,`created_at`,`updated_at`) values 
(1,'2024-05-16 23:22:41',2,'user_account_activitys','Update','{\"logout_time\":\"2024-05-16T17:52:41.504091Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-16 17:52:41','2024-05-16 17:52:41'),
(2,'2024-05-18 13:31:59',1,'client','Insert','{\"client_id\":\"6ef686b32faf3c870b16770ecf4de086\",\"client_name\":\"MICROSOFT\",\"description\":\"<h3>Power Pages in a Day - Koenig Solutions - New Zealand<\\/h3>\\r\\n\\r\\n<p><img alt=\\\"Date and time\\\" src=\\\"https:\\/\\/cdn-profile-eventcatalogprod-endpoint.azureedge.net\\/eventcatalogblobcontainer\\/icon_calendar.png?sv=2022-11-02&amp;ss=b&amp;srt=co&amp;sp=r&amp;se=2024-06-30T11:17:28Z&amp;st=2024-02-15T03:17:28Z&amp;spr=https&amp;sig=fxeSuArS%2FqK6Ap56lhicZ%2FpxCbtQ3IsIjqjGhcisfRY%3D\\\" \\/><\\/p>\\r\\n\\r\\n<p>05\\/21\\/2024 | 02:30 - 10:30 (IST)<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Event format\\\" src=\\\"https:\\/\\/cdn-profile-eventcatalogprod-endpoint.azureedge.net\\/eventcatalogblobcontainer\\/Icon-digital.png?sv=2022-11-02&amp;ss=b&amp;srt=co&amp;sp=r&amp;se=2024-06-30T11:17:28Z&amp;st=2024-02-15T03:17:28Z&amp;spr=https&amp;sig=fxeSuArS%2FqK6Ap56lhicZ%2FpxCbtQ3IsIjqjGhcisfRY%3D\\\" \\/> Digital<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Event delivery language\\\" src=\\\"https:\\/\\/cdn-profile-eventcatalogprod-endpoint.azureedge.net\\/eventcatalogblobcontainer\\/Icon-digital.png?sv=2022-11-02&amp;ss=b&amp;srt=co&amp;sp=r&amp;se=2024-06-30T11:17:28Z&amp;st=2024-02-15T03:17:28Z&amp;spr=https&amp;sig=fxeSuArS%2FqK6Ap56lhicZ%2FpxCbtQ3IsIjqjGhcisfRY%3D\\\" \\/> English (United States)<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Event type\\\" src=\\\"https:\\/\\/cdn-profile-eventcatalogprod-endpoint.azureedge.net\\/eventcatalogblobcontainer\\/Icon-digital.png?sv=2022-11-02&amp;ss=b&amp;srt=co&amp;sp=r&amp;se=2024-06-30T11:17:28Z&amp;st=2024-02-15T03:17:28Z&amp;spr=https&amp;sig=fxeSuArS%2FqK6Ap56lhicZ%2FpxCbtQ3IsIjqjGhcisfRY%3D\\\" \\/> Training<\\/p>\",\"complete_url\":\"redirects\\/c\\/6ef686b32faf3c870b16770ecf4de086\\/complete?username=xxxx\",\"terminate_url\":\"redirects\\/c\\/6ef686b32faf3c870b16770ecf4de086\\/terminate?username=xxxx\",\"quotafull_url\":\"redirects\\/c\\/6ef686b32faf3c870b16770ecf4de086\\/quotafull?username=xxxx\",\"date\":\"2024-05-18T08:01:59.174125Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 08:01:59','2024-05-18 08:01:59'),
(3,'2024-05-18 13:32:44',2,'client','Insert','{\"client_id\":\"6ef686b32faf3c870b16770ecf4de086\",\"client_name\":\"MICROSOFT\",\"description\":\"<h3>Power Pages in a Day - Koenig Solutions - New Zealand<\\/h3>\\r\\n\\r\\n<p><img alt=\\\"Date and time\\\" src=\\\"https:\\/\\/cdn-profile-eventcatalogprod-endpoint.azureedge.net\\/eventcatalogblobcontainer\\/icon_calendar.png?sv=2022-11-02&amp;ss=b&amp;srt=co&amp;sp=r&amp;se=2024-06-30T11:17:28Z&amp;st=2024-02-15T03:17:28Z&amp;spr=https&amp;sig=fxeSuArS%2FqK6Ap56lhicZ%2FpxCbtQ3IsIjqjGhcisfRY%3D\\\" \\/><\\/p>\\r\\n\\r\\n<p>05\\/21\\/2024 | 02:30 - 10:30 (IST)<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Event format\\\" src=\\\"https:\\/\\/cdn-profile-eventcatalogprod-endpoint.azureedge.net\\/eventcatalogblobcontainer\\/Icon-digital.png?sv=2022-11-02&amp;ss=b&amp;srt=co&amp;sp=r&amp;se=2024-06-30T11:17:28Z&amp;st=2024-02-15T03:17:28Z&amp;spr=https&amp;sig=fxeSuArS%2FqK6Ap56lhicZ%2FpxCbtQ3IsIjqjGhcisfRY%3D\\\" \\/> Digital<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Event delivery language\\\" src=\\\"https:\\/\\/cdn-profile-eventcatalogprod-endpoint.azureedge.net\\/eventcatalogblobcontainer\\/Icon-digital.png?sv=2022-11-02&amp;ss=b&amp;srt=co&amp;sp=r&amp;se=2024-06-30T11:17:28Z&amp;st=2024-02-15T03:17:28Z&amp;spr=https&amp;sig=fxeSuArS%2FqK6Ap56lhicZ%2FpxCbtQ3IsIjqjGhcisfRY%3D\\\" \\/> English (United States)<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Event type\\\" src=\\\"https:\\/\\/cdn-profile-eventcatalogprod-endpoint.azureedge.net\\/eventcatalogblobcontainer\\/Icon-digital.png?sv=2022-11-02&amp;ss=b&amp;srt=co&amp;sp=r&amp;se=2024-06-30T11:17:28Z&amp;st=2024-02-15T03:17:28Z&amp;spr=https&amp;sig=fxeSuArS%2FqK6Ap56lhicZ%2FpxCbtQ3IsIjqjGhcisfRY%3D\\\" \\/> Training<\\/p>\",\"complete_url\":\"redirects\\/c\\/6ef686b32faf3c870b16770ecf4de086\\/complete?username=xxxx\",\"terminate_url\":\"redirects\\/c\\/6ef686b32faf3c870b16770ecf4de086\\/terminate?username=xxxx\",\"quotafull_url\":\"redirects\\/c\\/6ef686b32faf3c870b16770ecf4de086\\/quotafull?username=xxxx\",\"date\":\"2024-05-18T08:02:43.742020Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 08:02:44','2024-05-18 08:02:44'),
(4,'2024-05-18 13:54:58',3,'client','Insert','{\"client_id\":\"cfa106b1bbd76575e6ba6700f55cd6bf\",\"client_name\":\"MICROSOFT\",\"description\":\"<p>June 10, 2024<\\/p>\\r\\n\\r\\n<h2><a href=\\\"https:\\/\\/www.serverless360.com\\/events\\/integrate-2024\\/?utm_source=Cloudtango&amp;utm_medium=referral&amp;utm_campaign=Cloudtango\\\" target=\\\"_blank\\\">INTEGRATE 2024 <\\/a><\\/h2>\\r\\n\\r\\n<p>London, United Kingdom<\\/p>\\r\\n\\r\\n<p>Join us at the World&#39;s Largest Microsoft Integration Tech Conference. Hear from industry leaders, network with peers, and learn about the latest trends and updates from the Microsoft Product Group and the Global Integration Community. Register now to secure your spot at this premier event!<\\/p>\",\"complete_url\":\"redirects\\/c\\/cfa106b1bbd76575e6ba6700f55cd6bf\\/complete?username=xxxx\",\"terminate_url\":\"redirects\\/c\\/cfa106b1bbd76575e6ba6700f55cd6bf\\/terminate?username=xxxx\",\"quotafull_url\":\"redirects\\/c\\/cfa106b1bbd76575e6ba6700f55cd6bf\\/quotafull?username=xxxx\",\"date\":\"2024-05-18T08:24:57.788053Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 08:24:58','2024-05-18 08:24:58'),
(5,'2024-05-18 14:07:35',4,'client','Insert','{\"client_id\":\"4d5aea8ea8653c640f255d4a9a0b2168\",\"client_name\":\"MICROSOFT\",\"description\":\"<p>Text<\\/p>\",\"complete_url\":\"redirects\\/c\\/4d5aea8ea8653c640f255d4a9a0b2168\\/complete?username=xxxx\",\"terminate_url\":\"redirects\\/c\\/4d5aea8ea8653c640f255d4a9a0b2168\\/terminate?username=xxxx\",\"quotafull_url\":\"redirects\\/c\\/4d5aea8ea8653c640f255d4a9a0b2168\\/quotafull?username=xxxx\",\"date\":\"2024-05-18T08:37:34.896540Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 08:37:35','2024-05-18 08:37:35'),
(6,'2024-05-18 14:11:57',3,'client','Update','{\"client_name\":\"MICROSOFT\",\"description\":\"<p>June 10, 2024<\\/p>\\r\\n\\r\\n<h2><a href=\\\"https:\\/\\/www.serverless360.com\\/events\\/integrate-2024\\/?utm_source=Cloudtango&amp;utm_medium=referral&amp;utm_campaign=Cloudtango\\\" target=\\\"_blank\\\">INTEGRATE 2024 <\\/a><\\/h2>\\r\\n\\r\\n<p>London, United Kingdom<\\/p>\\r\\n\\r\\n<p>Join us at the World&#39;s Largest Microsoft Integration Tech Conference. Hear from industry leaders, network with peers, and learn about the latest trends and updates from the Microsoft Product Group and the Global Integration Community. Register now to secure your spot at this premier event!<\\/p>\",\"date\":\"2024-05-18T08:41:56.729086Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 08:41:57','2024-05-18 08:41:57'),
(7,'2024-05-18 14:37:01',5,'client','Insert','{\"client_id\":\"a1c6bcf7fec656315e06b78cdd20118c\",\"client_name\":\"MICROSOFT\",\"description\":\"<p>test<\\/p>\",\"complete_url\":\"redirects\\/c\\/a1c6bcf7fec656315e06b78cdd20118c\\/complete?username=xxxx\",\"terminate_url\":\"redirects\\/c\\/a1c6bcf7fec656315e06b78cdd20118c\\/terminate?username=xxxx\",\"quotafull_url\":\"redirects\\/c\\/a1c6bcf7fec656315e06b78cdd20118c\\/quotafull?username=xxxx\",\"date\":\"2024-05-18T09:07:00.655641Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 09:07:01','2024-05-18 09:07:01'),
(8,'2024-05-18 14:38:34',6,'client','Insert','{\"client_id\":\"4d3037255524e2839046a7f74bf4d453\",\"client_name\":\"MICROSOFT\",\"description\":\"<p>Test<\\/p>\",\"complete_url\":\"redirects\\/c\\/4d3037255524e2839046a7f74bf4d453\\/complete?username=xxxx\",\"terminate_url\":\"redirects\\/c\\/4d3037255524e2839046a7f74bf4d453\\/terminate?username=xxxx\",\"quotafull_url\":\"redirects\\/c\\/4d3037255524e2839046a7f74bf4d453\\/quotafull?username=xxxx\",\"date\":\"2024-05-18T09:08:33.930412Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 09:08:34','2024-05-18 09:08:34'),
(9,'2024-05-18 18:15:44',1,'client','Update','{\"is_active\":\"N\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 12:45:44','2024-05-18 12:45:44'),
(10,'2024-05-18 18:15:48',1,'client','Update','{\"is_active\":\"Y\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 12:45:48','2024-05-18 12:45:48'),
(11,'2024-05-18 18:15:50',1,'client','Update','{\"is_active\":\"N\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 12:45:50','2024-05-18 12:45:50'),
(12,'2024-05-18 18:15:51',1,'client','Update','{\"is_active\":\"Y\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 12:45:51','2024-05-18 12:45:51'),
(13,'2024-05-18 18:15:58',1,'client','Update','{\"is_active\":\"N\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 12:45:58','2024-05-18 12:45:58'),
(14,'2024-05-18 18:16:04',1,'client','Update','{\"is_active\":\"Y\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 12:46:04','2024-05-18 12:46:04'),
(15,'2024-05-18 19:40:01',1,'projects','Insert','{\"project_id\":\"PI_00002_2024\",\"client_id\":\"1\",\"name\":\"Surface AI event\",\"cost_per_complete\":\"1\",\"max_limit\":\"100\",\"live_url\":\"https:\\/\\/nadianotout.com\\/PID=\",\"description\":\"<h1>Microsoft to hold a special Windows and Surface AI event in May<\\/h1>\\r\\n\\r\\n<h2>Ahead of Build 2024, Microsoft CEO Satya Nadella will share the company&rsquo;s &lsquo;AI vision&rsquo; for both software and hardware.<\\/h2>\",\"date\":\"2024-05-18T14:10:00.873177Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 14:10:01','2024-05-18 14:10:01'),
(16,'2024-05-18 19:41:24',1,'client','Update','{\"is_active\":\"N\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 14:11:24','2024-05-18 14:11:24'),
(17,'2024-05-18 19:41:25',1,'client','Update','{\"is_active\":\"Y\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 14:11:25','2024-05-18 14:11:25'),
(18,'2024-05-18 19:42:59',1,'projects','Update','{\"name\":\"Surface AI event\",\"cost_per_complete\":\"1\",\"max_limit\":\"100\",\"live_url\":\"https:\\/\\/nadianotout.com\\/PID=\",\"description\":\"<h1>Microsoft to hold a special Windows and Surface AI event in May<\\/h1>\\r\\n\\r\\n<h2>Ahead of Build 2024, Microsoft CEO Satya Nadella will share the company&rsquo;s &lsquo;AI vision&rsquo; for both software and hardware.<\\/h2>\",\"date\":\"2024-05-18T14:12:59.560084Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 14:12:59','2024-05-18 14:12:59'),
(19,'2024-05-18 19:46:46',2,'client','Insert','{\"client_id\":\"f9c5f64a1ae5448d71c65ae57ca52a34\",\"client_name\":\"Google\",\"description\":\"<p>Our approach to Search<\\/p>\\r\\n\\r\\n<p>People around the world turn to Search to find information, learn about topics of interest, and make important decisions. We know that people rely on us, so our commitment will never waver. As technology evolves, we will continue to help everyone find the information that they&rsquo;re looking for.<\\/p>\\r\\n\\r\\n<p>We believe that Search should:<\\/p>\",\"complete_url\":\"redirects\\/c\\/f9c5f64a1ae5448d71c65ae57ca52a34\\/complete?username=xxxx\",\"terminate_url\":\"redirects\\/c\\/f9c5f64a1ae5448d71c65ae57ca52a34\\/terminate?username=xxxx\",\"quotafull_url\":\"redirects\\/c\\/f9c5f64a1ae5448d71c65ae57ca52a34\\/quotafull?username=xxxx\",\"date\":\"2024-05-18T14:16:45.692936Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 14:16:46','2024-05-18 14:16:46'),
(20,'2024-05-18 19:54:39',1,'projects','Update','{\"name\":\"Surface AI event\",\"cost_per_complete\":\"1\",\"max_limit\":\"100\",\"live_url\":\"https:\\/\\/nadianotout.com\\/PID=\",\"description\":\"<h1>Microsoft to hold a special Windows and Surface AI event in May<\\/h1>\\r\\n\\r\\n<h2>Ahead of Build 2024, Microsoft CEO Satya Nadella will share the company&rsquo;s &lsquo;AI vision&rsquo; for both software and hardware.<\\/h2>\",\"date\":\"2024-05-18T14:24:39.688864Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 14:24:39','2024-05-18 14:24:39'),
(21,'2024-05-18 20:04:23',1,'projects','Update','{\"is_active\":\"N\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 14:34:23','2024-05-18 14:34:23'),
(22,'2024-05-18 20:04:33',1,'projects','Update','{\"is_active\":\"Y\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 14:34:33','2024-05-18 14:34:33'),
(23,'2024-05-18 20:04:34',1,'projects','Update','{\"is_active\":\"N\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 14:34:34','2024-05-18 14:34:34'),
(24,'2024-05-18 20:04:36',1,'projects','Update','{\"is_active\":\"Y\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 14:34:36','2024-05-18 14:34:36'),
(25,'2024-05-18 20:32:12',1,'projects','Update','{\"name\":\"Surface AI event\",\"cost_per_complete\":\"1\",\"max_limit\":\"100\",\"live_url\":\"https:\\/\\/nadianotout.com\\/PID=\",\"description\":\"<h6>Microsoft to hold a special Windows and Surface AI event in May<\\/h6>\\r\\n\\r\\n<h4>Ahead of Build 2024, Microsoft CEO Satya Nadella will share the company&rsquo;s &lsquo;AI vision&rsquo; for both software and hardware.<\\/h4>\",\"date\":\"2024-05-18T15:02:12.592380Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 15:02:12','2024-05-18 15:02:12'),
(26,'2024-05-18 20:32:54',1,'projects','Update','{\"name\":\"Surface AI event\",\"cost_per_complete\":\"1\",\"max_limit\":\"100\",\"live_url\":\"https:\\/\\/nadianotout.com\\/PID=\",\"description\":\"<h3><strong>Microsoft to hold a special Windows and Surface AI event in May<\\/strong><\\/h3>\\r\\n\\r\\n<p>Ahead of Build 2024, Microsoft CEO Satya Nadella will share the company&rsquo;s &lsquo;AI vision&rsquo; for both software and hardware.<\\/p>\",\"date\":\"2024-05-18T15:02:54.540153Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 15:02:54','2024-05-18 15:02:54'),
(27,'2024-05-18 20:36:44',1,'projects','Update','{\"name\":\"Surface AI event\",\"cost_per_complete\":\"1\",\"max_limit\":\"100\",\"live_url\":\"https:\\/\\/nadianotout.com\\/PID=\",\"description\":\"<h1>Arvind Kejriwal Aide Bibhav Kumar Arrested In Swati Maliwal Assault Case<\\/h1>\\r\\n\\r\\n<h2>Bibhav Kumar News: Swati Maliwal in her FIR had alleged that Bibhav Kumar, the Delhi Chief Minister&#39;s secretary, assaulted her.<\\/h2>\\r\\n\\r\\n<p><a href=\\\"https:\\/\\/www.ndtv.com\\/india\\\">India News<\\/a>Edited by <a href=\\\"https:\\/\\/www.ndtv.com\\/topic\\/abhimanyu-kulkarni\\\">Abhimanyu Kulkarni<\\/a>Updated: May 18, 2024 4:53 pm IST<\\/p>\\r\\n\\r\\n<p>Bibhav Kumar Arrest: He was arrested from Arvind Kejriwal&#39;s residence today. (File)<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><strong>New Delhi: <\\/strong><\\/p>\\r\\n\\r\\n<p>Arvind Kejriwal&#39;s aide, accused of assaulting Rajya Sabha MP <a href=\\\"https:\\/\\/www.ndtv.com\\/india-news\\/swati-maliwal-assault-case-strategy-changed-to-victim-shaming-bjp-snubs-aap-over-swati-maliwal-row-5690537\\\">Swati Maliwal<\\/a>, has been taken in custody by Delhi Police in connection with the assault case filed against him. Ms Maliwal in her FIR had alleged that <a href=\\\"https:\\/\\/www.ndtv.com\\/india-news\\/swati-maliwal-arvind-kejriwal-bibhav-kumar-new-cctv-footage-shows-swati-maliwal-walking-out-of-arvind-kejriwals-home-5689688\\\">Bibhav Kumar<\\/a>, the Delhi Chief Minister&#39;s secretary, assaulted her when she visited Mr Kejriwal&#39;s<\\/p>\",\"date\":\"2024-05-18T15:06:43.820331Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 15:06:44','2024-05-18 15:06:44'),
(28,'2024-05-18 20:55:18',1,'projects','Update','{\"name\":\"Surface AI event\",\"cost_per_complete\":\"1\",\"max_limit\":\"100\",\"live_url\":\"https:\\/\\/nadianotout.com\\/PID=\",\"description\":\"<h3><strong>Microsoft to hold a special Windows and Surface AI event in May<\\/strong><\\/h3> <p>Ahead of Build 2024, Microsoft CEO Satya Nadella will share the company&rsquo;s &lsquo;AI vision&rsquo; for both software and hardware.<\\/p>\",\"date\":\"2024-05-18T15:25:18.134398Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-18 15:25:18','2024-05-18 15:25:18'),
(29,'2024-05-19 11:59:22',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:29:22','2024-05-19 06:29:22'),
(30,'2024-05-19 11:59:44',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:29:44','2024-05-19 06:29:44'),
(31,'2024-05-19 11:59:45',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:29:45','2024-05-19 06:29:45'),
(32,'2024-05-19 11:59:46',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:29:46','2024-05-19 06:29:46'),
(33,'2024-05-19 11:59:53',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:29:53','2024-05-19 06:29:53'),
(34,'2024-05-19 12:00:01',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:30:01','2024-05-19 06:30:01'),
(35,'2024-05-19 12:02:08',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:32:08','2024-05-19 06:32:08'),
(36,'2024-05-19 12:02:11',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:32:11','2024-05-19 06:32:11'),
(37,'2024-05-19 12:02:36',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:32:36','2024-05-19 06:32:36'),
(38,'2024-05-19 12:02:44',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:32:44','2024-05-19 06:32:44'),
(39,'2024-05-19 12:02:56',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:32:56','2024-05-19 06:32:56'),
(40,'2024-05-19 12:02:58',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:32:58','2024-05-19 06:32:58'),
(41,'2024-05-19 12:03:10',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:33:10','2024-05-19 06:33:10'),
(42,'2024-05-19 12:03:18',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:33:18','2024-05-19 06:33:18'),
(43,'2024-05-19 12:03:29',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:33:29','2024-05-19 06:33:29'),
(44,'2024-05-19 12:03:30',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:33:30','2024-05-19 06:33:30'),
(45,'2024-05-19 12:06:08',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:36:08','2024-05-19 06:36:08'),
(46,'2024-05-19 12:06:18',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:36:18','2024-05-19 06:36:18'),
(47,'2024-05-19 12:06:21',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:36:21','2024-05-19 06:36:21'),
(48,'2024-05-19 12:06:24',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:36:24','2024-05-19 06:36:24'),
(49,'2024-05-19 12:07:01',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:37:01','2024-05-19 06:37:01'),
(50,'2024-05-19 12:07:03',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:37:03','2024-05-19 06:37:03'),
(51,'2024-05-19 12:07:17',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:37:17','2024-05-19 06:37:17'),
(52,'2024-05-19 12:07:22',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:37:22','2024-05-19 06:37:22'),
(53,'2024-05-19 12:07:26',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:37:26','2024-05-19 06:37:26'),
(54,'2024-05-19 12:07:28',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:37:28','2024-05-19 06:37:28'),
(55,'2024-05-19 12:07:33',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:37:33','2024-05-19 06:37:33'),
(56,'2024-05-19 12:07:38',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:37:38','2024-05-19 06:37:38'),
(57,'2024-05-19 12:16:48',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:46:48','2024-05-19 06:46:48'),
(58,'2024-05-19 12:16:50',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 06:46:50','2024-05-19 06:46:50'),
(59,'2024-05-19 12:39:11',2,'projects','Insert','{\"project_id\":\"PI000152024\",\"client_id\":1,\"name\":\"Surface AI event\",\"description\":\"<h3><strong>Microsoft to hold a special Windows and Surface AI event in May<\\/strong><\\/h3> <p>Ahead of Build 2024, Microsoft CEO Satya Nadella will share the company&rsquo;s &lsquo;AI vision&rsquo; for both software and hardware.<\\/p>\",\"cost_per_complete\":1,\"max_limit\":100,\"live_url\":\"https:\\/\\/nadianotout.com\\/PID=\",\"status\":\"Live\",\"date\":\"2024-05-18 15:25:18\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 07:09:11','2024-05-19 07:09:11'),
(60,'2024-05-19 12:42:24',2,'projects','Insert','{\"project_id\":\"PI000162024\",\"client_id\":1,\"name\":\"Surface AI event\",\"description\":\"<h3><strong>Microsoft to hold a special Windows and Surface AI event in May<\\/strong><\\/h3> <p>Ahead of Build 2024, Microsoft CEO Satya Nadella will share the company&rsquo;s &lsquo;AI vision&rsquo; for both software and hardware.<\\/p>\",\"cost_per_complete\":1,\"max_limit\":100,\"live_url\":\"https:\\/\\/nadianotout.com\\/PID=\",\"status\":\"Live\",\"date\":\"2024-05-18 15:25:18\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 07:12:24','2024-05-19 07:12:24'),
(61,'2024-05-19 12:43:33',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 07:13:33','2024-05-19 07:13:33'),
(62,'2024-05-19 12:43:34',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 07:13:34','2024-05-19 07:13:34'),
(63,'2024-05-19 12:45:50',2,'projects','Insert','{\"project_id\":\"PI000172024\",\"client_id\":1,\"name\":\"Surface AI event\",\"description\":\"<h3><strong>Microsoft to hold a special Windows and Surface AI event in May<\\/strong><\\/h3> <p>Ahead of Build 2024, Microsoft CEO Satya Nadella will share the company&rsquo;s &lsquo;AI vision&rsquo; for both software and hardware.<\\/p>\",\"cost_per_complete\":1,\"max_limit\":100,\"live_url\":\"https:\\/\\/nadianotout.com\\/PID=\",\"status\":\"Live\",\"date\":\"2024-05-18 15:25:18\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 07:15:50','2024-05-19 07:15:50'),
(64,'2024-05-19 12:53:22',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 07:23:22','2024-05-19 07:23:22'),
(65,'2024-05-19 12:53:25',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 07:23:25','2024-05-19 07:23:25'),
(66,'2024-05-19 13:33:56',1,'vendor','Insert','{\"vendor_id\":\"VI000022024\",\"name\":\"Suman Dey\",\"email\":\"sumandey7689@gmail.com\",\"date\":\"2024-05-19T08:03:56.438367Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 08:03:56','2024-05-19 08:03:56'),
(67,'2024-05-19 13:34:16',1,'vendor','Update','{\"is_active\":\"N\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 08:04:16','2024-05-19 08:04:16'),
(68,'2024-05-19 13:34:19',1,'vendor','Update','{\"is_active\":\"Y\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 08:04:19','2024-05-19 08:04:19'),
(69,'2024-05-19 16:36:50',2,'projects','Insert','{\"project_id\":\"PI000182024\",\"client_id\":\"2\",\"name\":\"Google Bard\",\"cost_per_complete\":\"2\",\"max_limit\":\"100\",\"live_url\":\"https:\\/\\/gemini.google.com\\/?PID=\",\"description\":\"<p><img alt=\\\"\\\" src=\\\"https:\\/\\/www.gstatic.com\\/lamda\\/images\\/gemini_wordmark_landing_page_238102af073d0ae2763aa5.svg\\\" \\/><\\/p>\\r\\n\\r\\n<h2>Supercharge your creativity and productivity<\\/h2>\\r\\n\\r\\n<p>Chat to start writing, planning, learning and more with Google AI<\\/p>\",\"date\":\"2024-05-19T11:06:49.679162Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 11:06:50','2024-05-19 11:06:50'),
(70,'2024-05-19 16:55:36',4,'vendor','Insert','{\"vendor_id\":\"VI000032024\",\"name\":\"Manik Pal\",\"email\":\"manikpal457@gmail.com\",\"date\":\"2024-05-19T11:25:35.743434Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 11:25:36','2024-05-19 11:25:36'),
(71,'2024-05-19 19:07:25',4,'vendor','Update','{\"project_id\":\"2\",\"client_id\":\"2\",\"entry_link\":\"vendor\\/auth\\/4\\/project\\/PI000182024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:37:25','2024-05-19 13:37:25'),
(72,'2024-05-19 19:21:54',1,'vendor','Update','{\"project_id\":\"2\",\"client_id\":\"2\",\"entry_link\":\"vendor\\/auth\\/1\\/project\\/PI000182024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:51:54','2024-05-19 13:51:54'),
(73,'2024-05-19 19:21:55',1,'payments','Insert','{\"payment_id\":\"PAY000022024\",\"project_id\":\"2\",\"vendor_id\":\"1\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:51:55','2024-05-19 13:51:55'),
(74,'2024-05-19 19:22:41',2,'vendor','Insert','{\"vendor_id\":\"VI000042024\",\"name\":\"Suman Dey\",\"email\":\"sumandey7689@gmail.com\",\"date\":\"2024-05-19T13:52:41.422422Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:52:41','2024-05-19 13:52:41'),
(75,'2024-05-19 19:23:09',1,'vendor','Update','{\"project_id\":\"2\",\"client_id\":\"2\",\"entry_link\":\"vendor\\/auth\\/1\\/project\\/PI000182024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:53:09','2024-05-19 13:53:09'),
(76,'2024-05-19 19:23:09',2,'payments','Insert','{\"payment_id\":\"PAY000032024\",\"project_id\":\"2\",\"vendor_id\":\"1\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:53:09','2024-05-19 13:53:09'),
(77,'2024-05-19 19:23:09',2,'vendor','Update','{\"project_id\":\"2\",\"client_id\":\"2\",\"entry_link\":\"vendor\\/auth\\/2\\/project\\/PI000182024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:53:09','2024-05-19 13:53:09'),
(78,'2024-05-19 19:23:09',3,'payments','Insert','{\"payment_id\":\"PAY000042024\",\"project_id\":\"2\",\"vendor_id\":\"2\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:53:09','2024-05-19 13:53:09'),
(79,'2024-05-19 19:27:55',1,'vendor','Update','{\"project_id\":\"2\",\"client_id\":\"2\",\"entry_link\":\"vendor\\/auth\\/1\\/project\\/PI000182024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:57:55','2024-05-19 13:57:55'),
(80,'2024-05-19 19:27:55',4,'payments','Insert','{\"payment_id\":\"PAY000052024\",\"project_id\":\"2\",\"vendor_id\":\"1\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:57:55','2024-05-19 13:57:55'),
(81,'2024-05-19 19:27:55',2,'vendor','Update','{\"project_id\":\"2\",\"client_id\":\"2\",\"entry_link\":\"vendor\\/auth\\/2\\/project\\/PI000182024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:57:55','2024-05-19 13:57:55'),
(82,'2024-05-19 19:27:55',5,'payments','Insert','{\"payment_id\":\"PAY000062024\",\"project_id\":\"2\",\"vendor_id\":\"2\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:57:55','2024-05-19 13:57:55'),
(83,'2024-05-19 19:29:07',1,'vendor','Update','{\"project_id\":\"2\",\"client_id\":\"2\",\"entry_link\":\"vendor\\/auth\\/1\\/project\\/PI000182024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:59:07','2024-05-19 13:59:07'),
(84,'2024-05-19 19:29:07',6,'payments','Insert','{\"payment_id\":\"PAY000072024\",\"project_id\":\"2\",\"vendor_id\":\"1\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:59:07','2024-05-19 13:59:07'),
(85,'2024-05-19 19:29:08',2,'vendor','Update','{\"project_id\":\"2\",\"client_id\":\"2\",\"entry_link\":\"vendor\\/auth\\/2\\/project\\/PI000182024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:59:08','2024-05-19 13:59:08'),
(86,'2024-05-19 19:29:08',7,'payments','Insert','{\"payment_id\":\"PAY000082024\",\"project_id\":\"2\",\"vendor_id\":\"2\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 13:59:08','2024-05-19 13:59:08'),
(87,'2024-05-19 19:50:06',1,'vendor','Update','{\"project_id\":\"2\",\"client_id\":\"2\",\"entry_link\":\"vendor\\/auth\\/1\\/project\\/PI000182024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 14:20:06','2024-05-19 14:20:06'),
(88,'2024-05-19 19:50:06',1,'payments','Insert','{\"payment_id\":\"PAY000092024\",\"project_id\":\"2\",\"vendor_id\":\"1\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 14:20:06','2024-05-19 14:20:06'),
(89,'2024-05-19 19:50:06',2,'vendor','Update','{\"project_id\":\"2\",\"client_id\":\"2\",\"entry_link\":\"vendor\\/auth\\/2\\/project\\/PI000182024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 14:20:06','2024-05-19 14:20:06'),
(90,'2024-05-19 19:50:07',2,'payments','Insert','{\"payment_id\":\"PAY000102024\",\"project_id\":\"2\",\"vendor_id\":\"2\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-19 14:20:07','2024-05-19 14:20:07'),
(91,'2024-05-20 21:24:04',6,'user_account_activitys','Update','{\"logout_time\":\"2024-05-20T15:54:03.683173Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 15:54:04','2024-05-20 15:54:04'),
(92,'2024-05-20 21:26:55',2,'client','Update','{\"is_active\":\"N\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 15:56:55','2024-05-20 15:56:55'),
(93,'2024-05-20 21:27:18',3,'client','Insert','{\"client_id\":\"7165c95abfe743a2015858b16db84c3c\",\"client_name\":\"Facebook\",\"description\":\"<p>Test<\\/p>\",\"complete_url\":\"redirects\\/c\\/7165c95abfe743a2015858b16db84c3c\\/complete?username=xxxx\",\"terminate_url\":\"redirects\\/c\\/7165c95abfe743a2015858b16db84c3c\\/terminate?username=xxxx\",\"quotafull_url\":\"redirects\\/c\\/7165c95abfe743a2015858b16db84c3c\\/quotafull?username=xxxx\",\"date\":\"2024-05-20T15:57:18.818296Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 15:57:18','2024-05-20 15:57:18'),
(94,'2024-05-20 21:29:46',3,'projects','Insert','{\"project_id\":\"PI000192024\",\"client_id\":\"3\",\"name\":\"Surface AI event\",\"cost_per_complete\":\"1\",\"max_limit\":\"100\",\"live_url\":\"http:\\/\\/nadianotout.com\\/PID=\",\"description\":\"<p>Test<\\/p>\",\"date\":\"2024-05-20T15:59:45.909010Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 15:59:46','2024-05-20 15:59:46'),
(95,'2024-05-20 21:30:12',3,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 16:00:12','2024-05-20 16:00:12'),
(96,'2024-05-20 21:30:18',3,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 16:00:18','2024-05-20 16:00:18'),
(97,'2024-05-20 21:30:40',3,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 16:00:40','2024-05-20 16:00:40'),
(98,'2024-05-20 21:30:48',3,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 16:00:48','2024-05-20 16:00:48'),
(99,'2024-05-20 21:31:33',2,'vendor','Update','{\"is_active\":\"N\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 16:01:33','2024-05-20 16:01:33'),
(100,'2024-05-20 21:31:38',2,'vendor','Update','{\"is_active\":\"Y\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 16:01:38','2024-05-20 16:01:38'),
(101,'2024-05-20 21:31:57',3,'vendor','Insert','{\"vendor_id\":\"VI000052024\",\"name\":\"Drhubo\",\"email\":\"dhurubo@gmail.com\",\"date\":\"2024-05-20T16:01:57.216548Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 16:01:57','2024-05-20 16:01:57'),
(102,'2024-05-20 21:33:32',3,'vendor','Update','{\"project_id\":\"3\",\"client_id\":\"3\",\"entry_link\":\"vendor\\/auth\\/3\\/project\\/PI000192024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 16:03:32','2024-05-20 16:03:32'),
(103,'2024-05-20 21:33:32',3,'payments','Insert','{\"payment_id\":\"PAY000112024\",\"project_id\":\"3\",\"vendor_id\":\"3\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 16:03:32','2024-05-20 16:03:32'),
(104,'2024-05-20 21:43:30',4,'projects','Insert','{\"project_id\":\"PI000202024\",\"client_id\":3,\"name\":\"Surface AI event\",\"description\":\"<p>Test<\\/p>\",\"cost_per_complete\":1,\"max_limit\":100,\"live_url\":\"http:\\/\\/nadianotout.com\\/PID=\",\"status\":\"Live\",\"date\":\"2024-05-20 15:59:45\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 16:13:30','2024-05-20 16:13:30'),
(105,'2024-05-20 21:47:06',7,'user_account_activitys','Update','{\"logout_time\":\"2024-05-20T16:17:06.152689Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 16:17:06','2024-05-20 16:17:06'),
(106,'2024-05-21 00:05:11',2,'user_account_activitys','Update','{\"logout_time\":\"2024-05-20T18:35:10.955253Z\"}','Firefox','Windows','127.0.0.1',NULL,3,'2024-05-20 18:35:11','2024-05-20 18:35:11'),
(107,'2024-05-21 00:05:46',3,'user_account_activitys','Update','{\"logout_time\":\"2024-05-20T18:35:46.269825Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 18:35:46','2024-05-20 18:35:46'),
(108,'2024-05-21 00:06:28',4,'user_account_activitys','Update','{\"logout_time\":\"2024-05-20T18:36:28.060288Z\"}','Firefox','Windows','127.0.0.1',NULL,3,'2024-05-20 18:36:28','2024-05-20 18:36:28'),
(109,'2024-05-21 00:07:11',5,'user_account_activitys','Update','{\"logout_time\":\"2024-05-20T18:37:11.516860Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 18:37:11','2024-05-20 18:37:11'),
(110,'2024-05-21 00:25:33',6,'user_account_activitys','Update','{\"logout_time\":\"2024-05-20T18:55:33.101754Z\"}','Firefox','Windows','127.0.0.1',NULL,3,'2024-05-20 18:55:33','2024-05-20 18:55:33'),
(111,'2024-05-21 00:26:52',1,'user_account_activitys','Update','{\"logout_time\":\"2024-05-20T18:56:52.878586Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 18:56:52','2024-05-20 18:56:52'),
(112,'2024-05-21 00:27:09',2,'user_account_activitys','Update','{\"logout_time\":\"2024-05-20T18:57:09.472643Z\"}','Firefox','Windows','127.0.0.1',NULL,4,'2024-05-20 18:57:09','2024-05-20 18:57:09'),
(113,'2024-05-21 00:29:41',1,'client','Insert','{\"client_id\":\"9e04fa4544fd2ca192fc20c2be2528e2\",\"client_name\":\"Google\",\"description\":\"<h2>Benefits<\\/h2>\\r\\n\\r\\n<ul>\\r\\n\\t<li><strong>Increased site engagement<\\/strong>: Related search can drive more site engagement by helping users discover ads and content relevant to what they&#39;re viewing.<\\/li>\\r\\n\\t<li><strong>Incremental revenue<\\/strong>: Related search can help you generate incremental revenue by driving more traffic to your search pages, which you can monetize with relevant ads.<\\/li>\\r\\n\\t<li><strong>Relevant search ads<\\/strong>: On your search page, Google can deliver high-quality search ads that are relevant to the selected related search term.<\\/li>\\r\\n\\t<li><strong>Better user experience<\\/strong>: You control the look and feel of your related search units, allowing you to maintain a quality user experience for your site.<\\/li>\\r\\n<\\/ul>\",\"complete_url\":\"redirects\\/c\\/9e04fa4544fd2ca192fc20c2be2528e2\\/complete?username=xxxx\",\"terminate_url\":\"redirects\\/c\\/9e04fa4544fd2ca192fc20c2be2528e2\\/terminate?username=xxxx\",\"quotafull_url\":\"redirects\\/c\\/9e04fa4544fd2ca192fc20c2be2528e2\\/quotafull?username=xxxx\",\"date\":\"2024-05-20T18:59:40.928094Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 18:59:41','2024-05-20 18:59:41'),
(114,'2024-05-21 00:33:09',1,'projects','Insert','{\"project_id\":\"PI000022024\",\"client_id\":\"1\",\"name\":\"Google Bard\",\"cost_per_complete\":\"1\",\"max_limit\":\"100\",\"live_url\":\"https:\\/\\/gemini.google.com\\/?PID=\",\"description\":\"<p><img alt=\\\"\\\" src=\\\"https:\\/\\/www.gstatic.com\\/lamda\\/images\\/gemini_wordmark_landing_page_238102af073d0ae2763aa5.svg\\\" \\/><\\/p>\\r\\n\\r\\n<h2>Supercharge your creativity and productivity<\\/h2>\\r\\n\\r\\n<p>Chat to start writing, planning, learning and more with Google AI<\\/p>\",\"date\":\"2024-05-20T19:03:09.737764Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 19:03:09','2024-05-20 19:03:09'),
(115,'2024-05-21 00:33:48',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 19:03:48','2024-05-20 19:03:48'),
(116,'2024-05-21 00:33:50',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 19:03:50','2024-05-20 19:03:50'),
(117,'2024-05-21 00:34:07',1,'vendor','Insert','{\"vendor_id\":\"VI000022024\",\"name\":\"Suman Dey\",\"email\":\"sumandey7689@gmail.com\",\"date\":\"2024-05-20T19:04:07.029781Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 19:04:07','2024-05-20 19:04:07'),
(118,'2024-05-21 00:34:25',1,'vendor','Update','{\"project_id\":\"1\",\"client_id\":\"1\",\"entry_link\":\"vendor\\/auth\\/1\\/project\\/PI000022024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 19:04:25','2024-05-20 19:04:25'),
(119,'2024-05-21 00:34:25',1,'payments','Insert','{\"payment_id\":\"PAY000022024\",\"project_id\":\"1\",\"vendor_id\":\"1\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 19:04:25','2024-05-20 19:04:25'),
(120,'2024-05-21 01:26:59',1,'vendor','Insert','{\"vendor_id\":\"VI000032024\",\"name\":\"Suman Dey\",\"email\":\"sumandey7689@gmail.com\",\"date\":\"2024-05-20T19:56:59.771547Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 19:56:59','2024-05-20 19:56:59'),
(121,'2024-05-21 01:27:19',1,'vendor','Update','{\"project_id\":\"1\",\"client_id\":\"1\",\"entry_link\":\"vendor\\/auth\\/1\\/project\\/PI000022024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 19:57:19','2024-05-20 19:57:19'),
(122,'2024-05-21 01:27:19',1,'payments','Insert','{\"payment_id\":\"PAY000032024\",\"project_id\":\"1\",\"vendor_id\":\"1\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 19:57:19','2024-05-20 19:57:19'),
(123,'2024-05-21 01:33:03',1,'vendor','Update','{\"project_id\":\"1\",\"client_id\":\"1\",\"entry_link\":\"vendor\\/auth\\/1\\/project\\/PI000022024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 20:03:03','2024-05-20 20:03:03'),
(124,'2024-05-21 01:33:03',1,'payments','Insert','{\"payment_id\":\"PAY000042024\",\"project_id\":\"1\",\"vendor_id\":\"1\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 20:03:03','2024-05-20 20:03:03'),
(125,'2024-05-21 01:34:41',1,'vendor','Update','{\"project_id\":\"1\",\"client_id\":\"1\",\"entry_link\":\"vendor\\/auth\\/1\\/project\\/PI000022024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 20:04:41','2024-05-20 20:04:41'),
(126,'2024-05-21 01:34:41',2,'payments','Insert','{\"payment_id\":\"PAY000052024\",\"project_id\":\"1\",\"vendor_id\":\"1\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-20 20:04:41','2024-05-20 20:04:41'),
(127,'2024-05-25 12:41:22',2,'vendor','Insert','{\"vendor_id\":\"VI000042024\",\"name\":\"Sumanta\",\"email\":\"sumantamandal75352@gmail.com\",\"date\":\"2024-05-25T07:11:22.233406Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 07:11:22','2024-05-25 07:11:22'),
(128,'2024-05-25 12:41:48',2,'vendor','Update','{\"project_id\":\"1\",\"client_id\":\"1\",\"entry_link\":\"vendor\\/auth\\/2\\/project\\/PI000022024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 07:11:48','2024-05-25 07:11:48'),
(129,'2024-05-25 12:41:48',3,'payments','Insert','{\"payment_id\":\"PAY000062024\",\"project_id\":\"1\",\"vendor_id\":\"2\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 07:11:48','2024-05-25 07:11:48'),
(130,'2024-05-25 12:44:36',2,'vendor','Update','{\"project_id\":\"1\",\"client_id\":\"1\",\"entry_link\":\"vendor\\/auth\\/2\\/project\\/PI000022024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 07:14:36','2024-05-25 07:14:36'),
(131,'2024-05-25 12:44:36',4,'payments','Insert','{\"payment_id\":\"PAY000072024\",\"project_id\":\"1\",\"vendor_id\":\"2\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 07:14:36','2024-05-25 07:14:36'),
(132,'2024-05-25 12:45:21',2,'vendor','Update','{\"project_id\":\"1\",\"client_id\":\"1\",\"entry_link\":\"vendor\\/auth\\/2\\/project\\/PI000022024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 07:15:21','2024-05-25 07:15:21'),
(133,'2024-05-25 12:45:21',5,'payments','Insert','{\"payment_id\":\"PAY000082024\",\"project_id\":\"1\",\"vendor_id\":\"2\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 07:15:21','2024-05-25 07:15:21'),
(134,'2024-05-25 12:47:05',1,'vendor','Update','{\"project_id\":\"1\",\"client_id\":\"1\",\"entry_link\":\"vendor\\/auth\\/1\\/project\\/PI000022024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 07:17:05','2024-05-25 07:17:05'),
(135,'2024-05-25 12:47:05',6,'payments','Insert','{\"payment_id\":\"PAY000092024\",\"project_id\":\"1\",\"vendor_id\":\"1\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 07:17:05','2024-05-25 07:17:05'),
(136,'2024-05-25 12:48:51',2,'vendor','Update','{\"name\":\"Sumanta Mandal\",\"email\":\"sumantamandal728@gmail.com\",\"date\":\"2024-05-25T07:18:51.413156Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 07:18:51','2024-05-25 07:18:51'),
(137,'2024-05-25 12:49:16',2,'vendor','Update','{\"project_id\":\"1\",\"client_id\":\"1\",\"entry_link\":\"vendor\\/auth\\/2\\/project\\/PI000022024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 07:19:16','2024-05-25 07:19:16'),
(138,'2024-05-25 12:49:16',7,'payments','Insert','{\"payment_id\":\"PAY000102024\",\"project_id\":\"1\",\"vendor_id\":\"2\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 07:19:16','2024-05-25 07:19:16'),
(139,'2024-05-25 14:09:05',2,'leads','Insert','{\"project_id\":1,\"vendor_id\":1,\"uid\":\"xxxx\",\"user_info\":\"{\\\"user_agent\\\":{\\\"browser\\\":\\\"Firefox\\\",\\\"platform\\\":\\\"Windows\\\",\\\"device\\\":false},\\\"ip_address\\\":\\\"127.0.0.1\\\"}\",\"date\":\"2024-05-25T08:39:05.253048Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 08:39:05','2024-05-25 08:39:05'),
(140,'2024-05-25 14:16:00',3,'leads','Insert','{\"project_id\":1,\"vendor_id\":1,\"uid\":\"xxxx\",\"user_info\":\"{\\\"user_agent\\\":{\\\"browser\\\":\\\"Firefox\\\",\\\"platform\\\":\\\"Windows\\\",\\\"device\\\":false},\\\"ip_address\\\":\\\"127.0.0.1\\\"}\",\"date\":\"2024-05-25T08:46:00.590278Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 08:46:00','2024-05-25 08:46:00'),
(141,'2024-05-25 14:16:17',4,'leads','Insert','{\"project_id\":1,\"vendor_id\":1,\"uid\":\"xxxx\",\"user_info\":\"{\\\"user_agent\\\":{\\\"browser\\\":\\\"Firefox\\\",\\\"platform\\\":\\\"Windows\\\",\\\"device\\\":false},\\\"ip_address\\\":\\\"127.0.0.1\\\"}\",\"date\":\"2024-05-25T08:46:17.879119Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 08:46:17','2024-05-25 08:46:17'),
(142,'2024-05-25 14:28:52',5,'leads','Insert','{\"project_id\":1,\"vendor_id\":1,\"uid\":\"efhjwgu\",\"user_info\":\"{\\\"user_agent\\\":{\\\"browser\\\":\\\"Firefox\\\",\\\"platform\\\":\\\"Windows\\\",\\\"device\\\":false},\\\"ip_address\\\":\\\"127.0.0.1\\\"}\",\"date\":\"2024-05-25T08:58:52.565983Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 08:58:52','2024-05-25 08:58:52'),
(143,'2024-05-25 14:42:01',6,'leads','Insert','{\"project_id\":1,\"vendor_id\":2,\"uid\":\"xxxx\",\"user_info\":\"{\\\"user_agent\\\":{\\\"browser\\\":\\\"Firefox\\\",\\\"platform\\\":\\\"Windows\\\",\\\"device\\\":false},\\\"ip_address\\\":\\\"127.0.0.1\\\"}\",\"date\":\"2024-05-25T09:12:01.088357Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 09:12:01','2024-05-25 09:12:01'),
(144,'2024-05-25 14:44:57',3,'vendor','Insert','{\"vendor_id\":\"VI000052024\",\"name\":\"Dhrubojyoti Mondal\",\"email\":\"00000dhrubojyoti@gmail.com\",\"date\":\"2024-05-25T09:14:57.763193Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 09:14:57','2024-05-25 09:14:57'),
(145,'2024-05-25 14:45:19',3,'vendor','Update','{\"project_id\":\"1\",\"client_id\":\"1\",\"entry_link\":\"vendor\\/auth\\/3\\/project\\/PI000022024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 09:15:19','2024-05-25 09:15:19'),
(146,'2024-05-25 14:45:19',8,'payments','Insert','{\"payment_id\":\"PAY000112024\",\"project_id\":\"1\",\"vendor_id\":\"3\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 09:15:19','2024-05-25 09:15:19'),
(147,'2024-05-25 14:54:42',3,'vendor','Update','{\"project_id\":\"1\",\"client_id\":\"1\",\"entry_link\":\"vendor\\/auth\\/3\\/project\\/PI000022024?user=xxxx\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 09:24:42','2024-05-25 09:24:42'),
(148,'2024-05-25 14:54:42',9,'payments','Insert','{\"payment_id\":\"PAY000122024\",\"project_id\":\"1\",\"vendor_id\":\"3\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 09:24:42','2024-05-25 09:24:42'),
(149,'2024-05-25 14:55:52',7,'leads','Insert','{\"project_id\":1,\"vendor_id\":3,\"uid\":\"xxxx\",\"user_info\":\"{\\\"user_agent\\\":{\\\"browser\\\":\\\"Firefox\\\",\\\"platform\\\":\\\"Windows\\\",\\\"device\\\":false},\\\"ip_address\\\":\\\"127.0.0.1\\\"}\",\"date\":\"2024-05-25T09:25:51.938918Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 09:25:51','2024-05-25 09:25:51'),
(150,'2024-05-25 15:03:19',8,'leads','Insert','{\"project_id\":1,\"vendor_id\":1,\"uid\":\"xxxx\",\"user_info\":\"{\\\"user_agent\\\":{\\\"browser\\\":\\\"Firefox\\\",\\\"platform\\\":\\\"Windows\\\",\\\"device\\\":false},\\\"ip_address\\\":\\\"127.0.0.1\\\"}\",\"date\":\"2024-05-25T09:33:19.760525Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 09:33:19','2024-05-25 09:33:19'),
(151,'2024-05-25 15:21:21',8,'leads','Update','{\"status\":\"Complete\",\"client_id\":1}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 09:51:21','2024-05-25 09:51:21'),
(152,'2024-05-25 16:01:50',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 10:31:50','2024-05-25 10:31:50'),
(153,'2024-05-25 16:02:44',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 10:32:44','2024-05-25 10:32:44'),
(154,'2024-05-25 16:02:55',1,'projects','Update','{\"status\":\"Pause\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 10:32:55','2024-05-25 10:32:55'),
(155,'2024-05-25 16:06:59',1,'projects','Update','{\"status\":\"Live\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 10:36:59','2024-05-25 10:36:59'),
(156,'2024-05-25 16:09:07',9,'leads','Insert','{\"project_id\":1,\"vendor_id\":3,\"uid\":\"xxxx\",\"user_info\":\"{\\\"user_agent\\\":{\\\"browser\\\":\\\"Firefox\\\",\\\"platform\\\":\\\"Windows\\\",\\\"device\\\":false},\\\"ip_address\\\":\\\"127.0.0.1\\\"}\",\"date\":\"2024-05-25T10:39:07.852859Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 10:39:07','2024-05-25 10:39:07'),
(157,'2024-05-25 16:26:53',1,'leads','Insert','{\"project_id\":1,\"vendor_id\":1,\"uid\":\"xxxx\",\"user_info\":\"{\\\"user_agent\\\":{\\\"browser\\\":\\\"Firefox\\\",\\\"platform\\\":\\\"Windows\\\",\\\"device\\\":false},\\\"ip_address\\\":\\\"127.0.0.1\\\"}\",\"date\":\"2024-05-25T10:56:53.360261Z\"}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 10:56:53','2024-05-25 10:56:53'),
(158,'2024-05-25 16:27:17',1,'leads','Update','{\"status\":\"Terminates\",\"client_id\":1}','Firefox','Windows','127.0.0.1',NULL,1,'2024-05-25 10:57:17','2024-05-25 10:57:17');

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
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menu_permissions` */

insert  into `menu_permissions`(`id`,`user_id`,`menu_id`,`add`,`edit`,`delete`,`print`,`created_at`,`updated_at`) values 
(221,4,1,0,0,0,0,'2024-05-20 18:56:44','2024-05-20 18:56:44'),
(222,4,2,0,0,0,0,'2024-05-20 18:56:44','2024-05-20 18:56:44'),
(223,4,5,0,0,0,0,'2024-05-20 18:56:44','2024-05-20 18:56:44'),
(224,1,1,0,0,0,0,'2024-05-25 11:02:07','2024-05-25 11:02:07'),
(225,1,2,0,0,0,0,'2024-05-25 11:02:07','2024-05-25 11:02:07'),
(226,1,3,0,0,0,0,'2024-05-25 11:02:08','2024-05-25 11:02:08'),
(227,1,4,0,0,0,0,'2024-05-25 11:02:08','2024-05-25 11:02:08'),
(228,1,5,0,0,0,0,'2024-05-25 11:02:08','2024-05-25 11:02:08'),
(229,1,6,0,0,0,0,'2024-05-25 11:02:08','2024-05-25 11:02:08'),
(230,1,7,0,0,0,0,'2024-05-25 11:02:08','2024-05-25 11:02:08'),
(231,1,8,0,0,0,0,'2024-05-25 11:02:08','2024-05-25 11:02:08'),
(232,1,9,0,0,0,0,'2024-05-25 11:02:08','2024-05-25 11:02:08');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menus` */

insert  into `menus`(`id`,`name`,`route`,`controller`,`method`,`is_parent`,`parent_id`,`menu_srl`,`is_active`,`icon`,`created_at`,`updated_at`) values 
(1,'Dashboard','dashboard','DashboardController','index','Y',NULL,1,'Y','<i class=\"nav-icon far fa-image\"></i>','2024-03-14 18:26:45','2024-03-14 18:26:51'),
(2,'User Management',NULL,NULL,NULL,'Y',NULL,2,'Y','<i class=\"nav-icon fas fa-user-shield \"></i>','2023-11-15 16:07:39','2023-11-15 16:07:41'),
(3,'User','user','UserController','index','N',2,1,'Y','<i class=\"nav-icon far fa-dot-circle ?>\"></i>','2023-11-15 16:08:17','2023-11-15 16:08:18'),
(4,'Menu Permission','menupermission','MenuController','index','Y',2,2,'Y','<i class=\"nav-icon far fa-dot-circle ?>\"></i>','2023-11-15 16:09:20','2023-11-15 16:09:21'),
(5,'Change Password','changepassword','LoginController','renderChangePassword','N',2,3,'Y','<i class=\"nav-icon far fa-dot-circle ?>\"></i>','2024-05-08 19:16:18','2024-05-08 19:16:20'),
(6,'Client','client','ClientController','index','N',NULL,3,'Y','<i class=\"nav-icon far fa-image\"></i>','2024-05-18 11:37:00','2024-05-18 11:37:05'),
(7,'Projects','projects','ProjectController','index','N',NULL,4,'Y','<i class=\"nav-icon far fa-image\"></i>','2024-05-18 11:37:00','2024-05-18 11:37:05'),
(8,'Vendor','vendor','VendorController','index','N',NULL,5,'Y','<i class=\"nav-icon far fa-image\"></i>','2024-05-18 11:37:00','2024-05-18 11:37:05'),
(9,'Leads','leads','LeadsController','index','N',NULL,6,'Y','<i class=\"nav-icon far fa-image\"></i>','2024-05-18 11:37:00','2024-05-18 11:37:05');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(40) DEFAULT NULL,
  `project_id` int(10) DEFAULT NULL,
  `vendor_id` int(10) DEFAULT NULL,
  `amount` int(10) DEFAULT 0,
  `status` enum('Pending','Paid') DEFAULT 'Pending',
  `remarks` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `payments` */

insert  into `payments`(`id`,`payment_id`,`project_id`,`vendor_id`,`amount`,`status`,`remarks`,`date`) values 
(1,'PAY000042024',1,1,0,'Pending',NULL,NULL),
(2,'PAY000052024',1,1,0,'Pending',NULL,NULL),
(3,'PAY000062024',1,2,0,'Pending',NULL,NULL),
(4,'PAY000072024',1,2,0,'Pending',NULL,NULL),
(5,'PAY000082024',1,2,0,'Pending',NULL,NULL),
(6,'PAY000092024',1,1,0,'Pending',NULL,NULL),
(7,'PAY000102024',1,2,0,'Pending',NULL,NULL),
(8,'PAY000112024',1,3,0,'Pending',NULL,NULL),
(9,'PAY000122024',1,3,0,'Pending',NULL,NULL);

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

/*Table structure for table `projects` */

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` varbinary(40) DEFAULT NULL,
  `client_id` int(10) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cost_per_complete` int(11) DEFAULT NULL,
  `max_limit` int(11) DEFAULT NULL,
  `live_url` text DEFAULT NULL,
  `status` enum('Live','Pause') DEFAULT 'Live',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `projects` */

insert  into `projects`(`id`,`project_id`,`client_id`,`name`,`description`,`cost_per_complete`,`max_limit`,`live_url`,`status`,`date`) values 
(1,'PI000022024',1,'Google Bard','<p><img alt=\"\" src=\"https://www.gstatic.com/lamda/images/gemini_wordmark_landing_page_238102af073d0ae2763aa5.svg\" /></p>\r\n\r\n<h2>Supercharge your creativity and productivity</h2>\r\n\r\n<p>Chat to start writing, planning, learning and more with Google AI</p>',1,100,'https://gemini.google.com/?PID=','Live','2024-05-20 19:03:09');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `serialmaster` */

insert  into `serialmaster`(`id`,`moduleTag`,`lastnumber`,`module`,`comments`,`created_at`,`updated_at`) values 
(1,'PI',2,'PROJECT',NULL,'2024-05-18 19:13:09','2024-05-20 19:03:09'),
(2,'VI',5,'VENDOR',NULL,'2024-05-18 19:13:09','2024-05-25 09:14:57'),
(3,'PAY',12,'PAYMENT',NULL,'2024-05-19 19:12:41','2024-05-25 09:24:41');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_account_activitys` */

insert  into `user_account_activitys`(`id`,`user_id`,`ip_address`,`user_browser`,`user_platform`,`login_time`,`logout_time`,`created_at`,`updated_at`) values 
(1,1,'127.0.0.1','Firefox','Windows','2024-05-20 18:55:46','2024-05-20 18:56:52',NULL,NULL),
(2,4,'127.0.0.1','Firefox','Windows','2024-05-20 18:57:00','2024-05-20 18:57:09',NULL,NULL),
(3,1,'127.0.0.1','Firefox','Windows','2024-05-20 18:57:17',NULL,NULL,NULL),
(4,1,'127.0.0.1','Firefox','Windows','2024-05-25 07:10:07',NULL,NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `is_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `is_online` enum('Y','N') NOT NULL DEFAULT 'N',
  `remember_token` varchar(100) DEFAULT NULL,
  `user_activation_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`username`,`mobile_no`,`email`,`password`,`profile_image`,`role_id`,`is_active`,`is_online`,`remember_token`,`user_activation_date`,`created_at`,`updated_at`) values 
(1,'Developer','dev',NULL,NULL,'$2y$10$W5hmQ3cWloGx0DSlQqOlv.pj1HK9oevwPwLeElLWXzBB7OfNcdZB2',NULL,1,'Y','Y',NULL,NULL,'2024-03-14 18:28:35','2024-05-25 07:10:07'),
(4,'Suman Dey','sumandey7689','8944961893','sumandey7689@gmail.com','$2y$10$JGJyUbc6ymx9q6z0ll2r0eQ/e60vVA5EB14Dir9i8jNESvgGfC4E.',NULL,2,'Y','',NULL,NULL,'2024-05-20 18:56:44','2024-05-25 10:37:50');

/*Table structure for table `vendor` */

DROP TABLE IF EXISTS `vendor`;

CREATE TABLE `vendor` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vendor_id` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `clicks_count` int(10) DEFAULT 0,
  `complete_count` int(10) DEFAULT 0,
  `terminates_count` int(10) DEFAULT 0,
  `entry_link` varchar(255) DEFAULT NULL,
  `project_id` int(10) DEFAULT NULL,
  `client_id` int(10) DEFAULT NULL,
  `is_active` enum('Y','N') DEFAULT 'Y',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `vendor` */

insert  into `vendor`(`id`,`vendor_id`,`name`,`email`,`clicks_count`,`complete_count`,`terminates_count`,`entry_link`,`project_id`,`client_id`,`is_active`,`date`) values 
(1,'VI000032024','Suman Dey','sumandey7689@gmail.com',1,0,1,'vendor/auth/1/project/PI000022024?user=xxxx',1,1,'Y','2024-05-20 19:56:59'),
(2,'VI000042024','Sumanta Mandal','sumantamandal728@gmail.com',0,0,0,'vendor/auth/2/project/PI000022024?user=xxxx',1,1,'Y','2024-05-25 07:18:51'),
(3,'VI000052024','Dhrubojyoti Mondal','madpubg07@gmail.com',0,0,0,'vendor/auth/3/project/PI000022024?user=xxxx',1,1,'Y','2024-05-25 09:14:57');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
