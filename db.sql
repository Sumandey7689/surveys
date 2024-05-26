/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - shantelm_vhm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shantelm_vhm` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `shantelm_vhm`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `client` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `leads` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `log_table` */

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
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `menu_permissions` */

insert  into `menu_permissions`(`id`,`user_id`,`menu_id`,`add`,`edit`,`delete`,`print`,`created_at`,`updated_at`) values 
(221,4,1,0,0,0,0,'2024-05-20 18:56:44','2024-05-20 18:56:44'),
(222,4,2,0,0,0,0,'2024-05-20 18:56:44','2024-05-20 18:56:44'),
(223,4,5,0,0,0,0,'2024-05-20 18:56:44','2024-05-20 18:56:44'),
(233,1,1,0,0,0,0,'2024-05-25 12:20:02','2024-05-25 12:20:02'),
(234,1,2,0,0,0,0,'2024-05-25 12:20:02','2024-05-25 12:20:02'),
(235,1,3,0,0,0,0,'2024-05-25 12:20:02','2024-05-25 12:20:02'),
(236,1,4,0,0,0,0,'2024-05-25 12:20:02','2024-05-25 12:20:02'),
(237,1,5,0,0,0,0,'2024-05-25 12:20:02','2024-05-25 12:20:02'),
(238,1,6,0,0,0,0,'2024-05-25 12:20:02','2024-05-25 12:20:02'),
(239,1,7,0,0,0,0,'2024-05-25 12:20:02','2024-05-25 12:20:02'),
(240,1,8,0,0,0,0,'2024-05-25 12:20:02','2024-05-25 12:20:02'),
(241,1,9,0,0,0,0,'2024-05-25 12:20:02','2024-05-25 12:20:02'),
(242,1,10,0,0,0,0,'2024-05-25 12:20:02','2024-05-25 12:20:02');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(9,'Leads','leads','LeadsController','index','N',NULL,6,'Y','<i class=\"nav-icon far fa-image\"></i>','2024-05-18 11:37:00','2024-05-18 11:37:05'),
(10,'Payments','payments','PaymentsController','index','N',NULL,7,'Y','<i class=\"nav-icon far fa-image\"></i>','2024-05-18 11:37:00','2024-05-18 11:37:05');

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
  `status` enum('Pending','Paid','Rejected') DEFAULT 'Pending',
  `remarks` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `payments` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `projects` */

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
(2,'VI',6,'VENDOR',NULL,'2024-05-18 19:13:09','2024-05-25 12:07:25'),
(3,'PAY',20,'PAYMENT',NULL,'2024-05-19 19:12:41','2024-05-25 14:11:34');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `vendor` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
