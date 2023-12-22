-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: localhost    Database: Entry_task
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add grade',6,'add_grade'),(22,'Can change grade',6,'change_grade'),(23,'Can delete grade',6,'delete_grade'),(24,'Can view grade',6,'view_grade'),(25,'Can add employee',7,'add_employee'),(26,'Can change employee',7,'change_employee'),(27,'Can delete employee',7,'delete_employee'),(28,'Can view employee',7,'view_employee'),(29,'Can add user',8,'add_user'),(30,'Can change user',8,'change_user'),(31,'Can delete user',8,'delete_user'),(32,'Can view user',8,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_Entry_task__main_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_Entry_task__main_user_id` FOREIGN KEY (`user_id`) REFERENCES `Entry_task__main_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-12-22 09:52:26.099132','1','__Mary__, email: (mary@test.com)',3,'',8,2),(2,'2023-12-22 10:51:57.367709','1','Employee: Ron Tecno; Grade: Middle',3,'',7,2),(3,'2023-12-22 10:52:17.786892','3','__Mary__, email: (mary@test.com)',3,'',8,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'Entry_task__main','employee'),(6,'Entry_task__main','grade'),(8,'Entry_task__main','user'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-22 09:04:16.494878'),(2,'contenttypes','0002_remove_content_type_name','2023-12-22 09:04:16.510266'),(3,'auth','0001_initial','2023-12-22 09:04:16.551965'),(4,'auth','0002_alter_permission_name_max_length','2023-12-22 09:04:16.561877'),(5,'auth','0003_alter_user_email_max_length','2023-12-22 09:04:16.564330'),(6,'auth','0004_alter_user_username_opts','2023-12-22 09:04:16.567738'),(7,'auth','0005_alter_user_last_login_null','2023-12-22 09:04:16.569975'),(8,'auth','0006_require_contenttypes_0002','2023-12-22 09:04:16.570854'),(9,'auth','0007_alter_validators_add_error_messages','2023-12-22 09:04:16.573287'),(10,'auth','0008_alter_user_username_max_length','2023-12-22 09:04:16.575435'),(11,'auth','0009_alter_user_last_name_max_length','2023-12-22 09:04:16.577550'),(12,'auth','0010_alter_group_name_max_length','2023-12-22 09:04:16.581966'),(13,'auth','0011_update_proxy_permissions','2023-12-22 09:04:16.585295'),(14,'auth','0012_alter_user_first_name_max_length','2023-12-22 09:04:16.587736'),(15,'Entry_task__main','0001_initial','2023-12-22 09:04:16.602316'),(16,'Entry_task__main','0002_alter_employee_grade','2023-12-22 09:04:16.624436'),(17,'Entry_task__main','0003_alter_employee_date_of_employment','2023-12-22 09:04:16.626252'),(18,'Entry_task__main','0004_user','2023-12-22 09:04:16.671488'),(19,'admin','0001_initial','2023-12-22 09:04:16.693608'),(20,'admin','0002_logentry_remove_auto_add','2023-12-22 09:04:16.697927'),(21,'admin','0003_logentry_add_action_flag_choices','2023-12-22 09:04:16.702089'),(22,'sessions','0001_initial','2023-12-22 09:04:16.709179'),(23,'Entry_task__main','0005_alter_user_phone','2023-12-22 09:53:55.456480');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('k899xa0jxw22lkyc8tezosjwi8jp4sgs','.eJxVjDsOwjAQBe_iGlnetfGHkp4zRLtZmwSQLcVJhbg7ipQC2jcz760G2tZp2HpehlnURVl1-t2YxmeuO5AH1XvTY6vrMrPeFX3Qrm9N8ut6uH8HE_VpryUBZhA2xkowOVnkQAW8xUhc6MzC4NAkY6N3EBE8Ogueix8JAqrPF9yINx4:1rGcS3:z0-1c92leWI-hSSqW1vqRT9erArbk8T-92HxPvpsWC4','2024-01-05 10:08:19.903124'),('vlyirlukhvu5x43tt3h3gxh4bpmsfi6i','.eJxVjEEOwiAQRe_C2pAGmDJ16d4zNDMMSNVAUtpV490NSRe6_e-9f6iZ9i3Pe4vrvIi6KqMuvxtTeMXSgTypPKoOtWzrwror-qRN36vE9-10_w4ytdxrKyDGobUTI7FnQAcELGmYRssQAE0M5DHalDwBDIFDxDG5RAijqM8X8rI4qQ:1rGd7c:fQDdBtNP2GqtJlG0Ljqivlma_UVZodRzM9L1B_2kP88','2024-01-05 10:51:16.487530'),('y9su4mmzn8epey60gsetlz96rvac6ly0','.eJxVjDsOwjAQBe_iGlnetfGHkp4zRLtZmwSQLcVJhbg7ipQC2jcz760G2tZp2HpehlnURVl1-t2YxmeuO5AH1XvTY6vrMrPeFX3Qrm9N8ut6uH8HE_VpryUBZhA2xkowOVnkQAW8xUhc6MzC4NAkY6N3EBE8Ogueix8JAqrPF9yINx4:1rGcgs:unUkbbI1Gbe47bKcP6R7Ms1lla7ooqxRQh85-VXb4nk','2024-01-05 10:23:38.825489');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entry_task__main_employee`
--

DROP TABLE IF EXISTS `Entry_task__main_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entry_task__main_employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `second_name` varchar(50) DEFAULT NULL,
  `date_of_employment` date NOT NULL,
  `grade_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Entry_task__main_emp_grade_id_1522bc3a_fk_Entry_tas` (`grade_id`),
  CONSTRAINT `Entry_task__main_emp_grade_id_1522bc3a_fk_Entry_tas` FOREIGN KEY (`grade_id`) REFERENCES `Entry_task__main_grade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entry_task__main_employee`
--

LOCK TABLES `Entry_task__main_employee` WRITE;
/*!40000 ALTER TABLE `Entry_task__main_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Entry_task__main_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entry_task__main_grade`
--

DROP TABLE IF EXISTS `Entry_task__main_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entry_task__main_grade` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entry_task__main_grade`
--

LOCK TABLES `Entry_task__main_grade` WRITE;
/*!40000 ALTER TABLE `Entry_task__main_grade` DISABLE KEYS */;
INSERT INTO `Entry_task__main_grade` VALUES (1,'Intern'),(2,'Junior'),(3,'Middle'),(4,'Senior'),(5,'TeamLead');
/*!40000 ALTER TABLE `Entry_task__main_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entry_task__main_user`
--

DROP TABLE IF EXISTS `Entry_task__main_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entry_task__main_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entry_task__main_user`
--

LOCK TABLES `Entry_task__main_user` WRITE;
/*!40000 ALTER TABLE `Entry_task__main_user` DISABLE KEYS */;
INSERT INTO `Entry_task__main_user` VALUES (2,'pbkdf2_sha256$600000$U5JXhy7xwZ38dRhVwTO98c$vpFt+rJwEqha8b8TTZrcBdWltbhmIShnzFRcPmSPvHo=','2023-12-22 10:51:16.486218',1,'admin','','','',1,1,'2023-12-22 09:51:52.081555',NULL);
/*!40000 ALTER TABLE `Entry_task__main_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entry_task__main_user_groups`
--

DROP TABLE IF EXISTS `Entry_task__main_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entry_task__main_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Entry_task__main_user_groups_user_id_group_id_c9f59cd4_uniq` (`user_id`,`group_id`),
  KEY `Entry_task__main_user_groups_group_id_f9e26a0d_fk_auth_group_id` (`group_id`),
  CONSTRAINT `Entry_task__main_use_user_id_4262bcf8_fk_Entry_tas` FOREIGN KEY (`user_id`) REFERENCES `Entry_task__main_user` (`id`),
  CONSTRAINT `Entry_task__main_user_groups_group_id_f9e26a0d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entry_task__main_user_groups`
--

LOCK TABLES `Entry_task__main_user_groups` WRITE;
/*!40000 ALTER TABLE `Entry_task__main_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `Entry_task__main_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entry_task__main_user_user_permissions`
--

DROP TABLE IF EXISTS `Entry_task__main_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entry_task__main_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Entry_task__main_user_us_user_id_permission_id_896473ee_uniq` (`user_id`,`permission_id`),
  KEY `Entry_task__main_use_permission_id_66ab9fdd_fk_auth_perm` (`permission_id`),
  CONSTRAINT `Entry_task__main_use_permission_id_66ab9fdd_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `Entry_task__main_use_user_id_81b5b1ee_fk_Entry_tas` FOREIGN KEY (`user_id`) REFERENCES `Entry_task__main_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entry_task__main_user_user_permissions`
--

LOCK TABLES `Entry_task__main_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `Entry_task__main_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Entry_task__main_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-22 13:53:26
