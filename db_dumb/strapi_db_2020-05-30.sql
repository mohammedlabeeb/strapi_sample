# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.4.13-MariaDB)
# Database: strapi_db
# Generation Time: 2020-05-30 17:37:02 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table activities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activities`;

CREATE TABLE `activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;

INSERT INTO `activities` (`id`, `Price`, `created_at`, `updated_at`)
VALUES
	(1,332.5,'2020-05-30 17:06:28','2020-05-30 17:06:28'),
	(2,188.1,'2020-05-30 17:33:31','2020-05-30 17:33:31');

/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table activities_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activities_components`;

CREATE TABLE `activities_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `component_type` varchar(255) NOT NULL,
  `component_id` int(11) NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_id_fk` (`activity_id`),
  CONSTRAINT `activity_id_fk` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `activities_components` WRITE;
/*!40000 ALTER TABLE `activities_components` DISABLE KEYS */;

INSERT INTO `activities_components` (`id`, `field`, `order`, `component_type`, `component_id`, `activity_id`)
VALUES
	(1,'ActivitiesContent',1,'components_cms_activities',1,1),
	(2,'ActivitiesContent',1,'components_cms_activities',2,2);

/*!40000 ALTER TABLE `activities_components` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table components_cms_activities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_cms_activities`;

CREATE TABLE `components_cms_activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `SubTitle` varchar(255) DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `Language` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `components_cms_activities` WRITE;
/*!40000 ALTER TABLE `components_cms_activities` DISABLE KEYS */;

INSERT INTO `components_cms_activities` (`id`, `Title`, `SubTitle`, `Description`, `Language`)
VALUES
	(1,'Activity 1','Sub Title 1','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','EN'),
	(2,'test','dasdasda','asdasdasdas asdsadasd asadasdasdas ','EN');

/*!40000 ALTER TABLE `components_cms_activities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table components_cms_languages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `components_cms_languages`;

CREATE TABLE `components_cms_languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Language` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table core_store
# ------------------------------------------------------------

DROP TABLE IF EXISTS `core_store`;

CREATE TABLE `core_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `core_store` WRITE;
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;

INSERT INTO `core_store` (`id`, `key`, `value`, `type`, `environment`, `tag`)
VALUES
	(1,'db_model_activities','{\"ActivitiesContent\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"cms.activities\"},\"Pictures\":{\"collection\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\"],\"plugin\":\"upload\",\"required\":false},\"Price\":{\"type\":\"float\"},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),
	(2,'db_model_users-permissions_permission','{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false}}','object',NULL,NULL),
	(3,'db_model_components_cms_languages','{\"Language\":{\"type\":\"enumeration\",\"enum\":[\"EN\",\"ES\",\"DE\"],\"required\":true,\"default\":\"EN\"}}','object',NULL,NULL),
	(4,'db_model_components_cms_activities','{\"Title\":{\"type\":\"string\",\"required\":false},\"SubTitle\":{\"type\":\"string\"},\"Description\":{\"type\":\"richtext\"},\"Language\":{\"type\":\"enumeration\",\"enum\":[\"EN\",\"ES\",\"DE\"],\"default\":\"EN\",\"required\":true}}','object',NULL,NULL),
	(5,'db_model_core_store','{\"key\":{\"type\":\"string\"},\"value\":{\"type\":\"text\"},\"type\":{\"type\":\"string\"},\"environment\":{\"type\":\"string\"},\"tag\":{\"type\":\"string\"}}','object',NULL,NULL),
	(6,'db_model_strapi_webhooks','{\"name\":{\"type\":\"string\"},\"url\":{\"type\":\"text\"},\"headers\":{\"type\":\"json\"},\"events\":{\"type\":\"json\"},\"enabled\":{\"type\":\"boolean\"}}','object',NULL,NULL),
	(7,'db_model_email_settings','{\"From\":{\"type\":\"email\",\"required\":true},\"To\":{\"type\":\"email\",\"required\":true},\"Name\":{\"type\":\"string\",\"required\":true},\"SMTP_Password\":{\"type\":\"password\",\"required\":true},\"SMTP_Email\":{\"type\":\"email\",\"required\":true},\"SMTP_Provider\":{\"type\":\"enumeration\",\"enum\":[\"Gmail\",\"outlook\"],\"default\":\"Gmail\",\"required\":true},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),
	(8,'db_model_upload_file','{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),
	(9,'db_model_users-permissions_role','{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"configurable\":false,\"plugin\":\"users-permissions\",\"isVirtual\":true}}','object',NULL,NULL),
	(10,'db_model_strapi_administrator','{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"required\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false}}','object',NULL,NULL),
	(11,'db_model_users-permissions_user','{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_at\":{\"type\":\"currentTimestamp\"},\"updated_at\":{\"type\":\"currentTimestamp\"}}','object',NULL,NULL),
	(12,'db_model_upload_file_morph','{\"upload_file_id\":{\"type\":\"integer\"},\"related_id\":{\"type\":\"integer\"},\"related_type\":{\"type\":\"text\"},\"field\":{\"type\":\"text\"},\"order\":{\"type\":\"integer\"}}','object',NULL,NULL),
	(13,'plugin_upload_settings','{\"sizeOptimization\":true,\"responsiveDimensions\":true}','object','development',''),
	(14,'plugin_users-permissions_grant','{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/instagram/callback\"},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitch/callback\",\"scope\":[\"user:read:email\"]}}','object','',''),
	(15,'plugin_content_manager_configuration_content_types::application::activities.activities','{\"uid\":\"application::activities.activities\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"ActivitiesContent\":{\"edit\":{\"label\":\"ActivitiesContent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ActivitiesContent\",\"searchable\":false,\"sortable\":false}},\"Pictures\":{\"edit\":{\"label\":\"Pictures\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Pictures\",\"searchable\":false,\"sortable\":false}},\"Price\":{\"edit\":{\"label\":\"Price\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Price\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"Pictures\",\"Price\",\"created_at\"],\"editRelations\":[],\"edit\":[[{\"name\":\"ActivitiesContent\",\"size\":12}],[{\"name\":\"Pictures\",\"size\":6},{\"name\":\"Price\",\"size\":4}]]}}','object','',''),
	(16,'plugin_content_manager_configuration_content_types::application::email-settings.email-settings','{\"uid\":\"application::email-settings.email-settings\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"Name\",\"defaultSortBy\":\"Name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"SMTP_Password\":{\"edit\":{\"label\":\"SMTP_Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"SMTP_Password\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"From\":{\"edit\":{\"label\":\"From\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"From\",\"searchable\":true,\"sortable\":true}},\"Name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"SMTP_Email\":{\"edit\":{\"label\":\"SMTP_Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"SMTP_Email\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}},\"SMTP_Provider\":{\"edit\":{\"label\":\"SMTP_Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"SMTP_Provider\",\"searchable\":true,\"sortable\":true}},\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"To\":{\"edit\":{\"label\":\"To\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"To\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"From\",\"To\",\"Name\"],\"editRelations\":[],\"edit\":[[{\"name\":\"SMTP_Provider\",\"size\":6}],[{\"name\":\"SMTP_Email\",\"size\":6},{\"name\":\"SMTP_Password\",\"size\":6}],[{\"name\":\"From\",\"size\":6},{\"name\":\"Name\",\"size\":6}],[{\"name\":\"To\",\"size\":6}]]}}','object','',''),
	(17,'plugin_content_manager_configuration_content_types::plugins::upload.file','{\"uid\":\"plugins::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"AlternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"AlternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"Caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"Width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"Height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"Formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"Hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"Ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"Mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"Size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"Url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"PreviewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PreviewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"Provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider_metadata\",\"searchable\":false,\"sortable\":false}},\"related\":{\"edit\":{\"label\":\"Related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"Related\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"editRelations\":[\"related\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}]]}}','object','',''),
	(18,'plugin_content_manager_configuration_content_types::plugins::users-permissions.permission','{\"uid\":\"plugins::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"type\",\"defaultSortBy\":\"type\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"controller\":{\"edit\":{\"label\":\"Controller\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Controller\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"enabled\":{\"edit\":{\"label\":\"Enabled\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Enabled\",\"searchable\":true,\"sortable\":true}},\"policy\":{\"edit\":{\"label\":\"Policy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Policy\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"type\",\"controller\",\"action\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"controller\",\"size\":6}],[{\"name\":\"action\",\"size\":6},{\"name\":\"enabled\",\"size\":4}],[{\"name\":\"policy\",\"size\":6}]]}}','object','',''),
	(19,'plugin_content_manager_configuration_content_types::plugins::users-permissions.role','{\"uid\":\"plugins::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"type\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"editRelations\":[\"permissions\",\"users\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]]}}','object','',''),
	(20,'plugin_content_manager_configuration_content_types::strapi::administrator','{\"uid\":\"strapi::administrator\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"blocked\"],\"editRelations\":[],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"blocked\",\"size\":4}]]}}','object','',''),
	(21,'plugin_content_manager_configuration_content_types::plugins::users-permissions.user','{\"uid\":\"plugins::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"Confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4}]]}}','object','',''),
	(22,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}','object','',''),
	(23,'plugin_content_manager_configuration_components::cms.activities','{\"uid\":\"cms.activities\",\"isComponent\":true,\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"Title\",\"defaultSortBy\":\"Title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":false,\"sortable\":false}},\"Title\":{\"edit\":{\"label\":\"Title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Title\",\"searchable\":true,\"sortable\":true}},\"SubTitle\":{\"edit\":{\"label\":\"SubTitle\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"SubTitle\",\"searchable\":true,\"sortable\":true}},\"Description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":false,\"sortable\":false}},\"Language\":{\"edit\":{\"label\":\"Language\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Language\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"Title\",\"SubTitle\",\"Language\"],\"edit\":[[{\"name\":\"Language\",\"size\":6}],[{\"name\":\"Title\",\"size\":6},{\"name\":\"SubTitle\",\"size\":6}],[{\"name\":\"Description\",\"size\":12}]],\"editRelations\":[]}}','object','',''),
	(25,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_confirmation_redirection\":\"/admin/admin\",\"email_reset_password\":\"/admin/admin\",\"default_role\":\"authenticated\"}','object','','');

/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table email_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_settings`;

CREATE TABLE `email_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `From` varchar(255) NOT NULL,
  `To` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `SMTP_Password` varchar(255) NOT NULL,
  `SMTP_Email` varchar(255) NOT NULL,
  `SMTP_Provider` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `email_settings` WRITE;
/*!40000 ALTER TABLE `email_settings` DISABLE KEYS */;

INSERT INTO `email_settings` (`id`, `From`, `To`, `Name`, `SMTP_Password`, `SMTP_Email`, `SMTP_Provider`, `created_at`, `updated_at`)
VALUES
	(1,'noreply@mallocard.com','mohammedlabeeb@gmail.com','Mallocard Admin','mallorcard123','strapitest20200530@gmail.com','Gmail','2020-05-30 17:03:54','2020-05-30 17:03:54');

/*!40000 ALTER TABLE `email_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table strapi_administrator
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_administrator`;

CREATE TABLE `strapi_administrator` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_administrator_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `strapi_administrator` WRITE;
/*!40000 ALTER TABLE `strapi_administrator` DISABLE KEYS */;

INSERT INTO `strapi_administrator` (`id`, `username`, `email`, `password`, `resetPasswordToken`, `blocked`)
VALUES
	(1,'strapi_admin','strapitest20200530@gmail.com','$2a$10$C65DidHHIO06frOVWKZCXuGsnbkNr.0MizoDMg9GaiUBXyLKRW6/W',NULL,NULL);

/*!40000 ALTER TABLE `strapi_administrator` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table strapi_webhooks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strapi_webhooks`;

CREATE TABLE `strapi_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext DEFAULT NULL,
  `headers` longtext DEFAULT NULL,
  `events` longtext DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table upload_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `upload_file`;

CREATE TABLE `upload_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alternativeText` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext DEFAULT NULL,
  `hash` varchar(255) NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` decimal(10,2) NOT NULL,
  `url` varchar(255) NOT NULL,
  `previewUrl` varchar(255) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `provider_metadata` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `upload_file` WRITE;
/*!40000 ALTER TABLE `upload_file` DISABLE KEYS */;

INSERT INTO `upload_file` (`id`, `name`, `alternativeText`, `caption`, `width`, `height`, `formats`, `hash`, `ext`, `mime`, `size`, `url`, `previewUrl`, `provider`, `provider_metadata`, `created_at`, `updated_at`)
VALUES
	(1,'3017c37203e8c8cf828f4f3dec91a18c','','',1279,960,'{\"thumbnail\":{\"hash\":\"thumbnail_3017c37203e8c8cf828f4f3dec91a18c_7e410d403f\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"width\":208,\"height\":156,\"size\":9.35,\"path\":null,\"url\":\"/uploads/thumbnail_3017c37203e8c8cf828f4f3dec91a18c_7e410d403f.jpeg\"},\"large\":{\"hash\":\"large_3017c37203e8c8cf828f4f3dec91a18c_7e410d403f\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"width\":1000,\"height\":751,\"size\":187.07,\"path\":null,\"url\":\"/uploads/large_3017c37203e8c8cf828f4f3dec91a18c_7e410d403f.jpeg\"},\"medium\":{\"hash\":\"medium_3017c37203e8c8cf828f4f3dec91a18c_7e410d403f\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"width\":750,\"height\":563,\"size\":112.86,\"path\":null,\"url\":\"/uploads/medium_3017c37203e8c8cf828f4f3dec91a18c_7e410d403f.jpeg\"},\"small\":{\"hash\":\"small_3017c37203e8c8cf828f4f3dec91a18c_7e410d403f\",\"ext\":\".jpeg\",\"mime\":\"image/jpeg\",\"width\":500,\"height\":375,\"size\":49.33,\"path\":null,\"url\":\"/uploads/small_3017c37203e8c8cf828f4f3dec91a18c_7e410d403f.jpeg\"}}','3017c37203e8c8cf828f4f3dec91a18c_7e410d403f','.jpeg','image/jpeg',163.93,'/uploads/3017c37203e8c8cf828f4f3dec91a18c_7e410d403f.jpeg',NULL,'local',NULL,'2020-05-30 17:06:23','2020-05-30 17:06:23');

/*!40000 ALTER TABLE `upload_file` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table upload_file_morph
# ------------------------------------------------------------

DROP TABLE IF EXISTS `upload_file_morph`;

CREATE TABLE `upload_file_morph` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext DEFAULT NULL,
  `field` longtext DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `upload_file_morph` WRITE;
/*!40000 ALTER TABLE `upload_file_morph` DISABLE KEYS */;

INSERT INTO `upload_file_morph` (`id`, `upload_file_id`, `related_id`, `related_type`, `field`, `order`)
VALUES
	(1,1,1,'activities','Pictures',1);

/*!40000 ALTER TABLE `upload_file_morph` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users-permissions_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users-permissions_permission`;

CREATE TABLE `users-permissions_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `users-permissions_permission` WRITE;
/*!40000 ALTER TABLE `users-permissions_permission` DISABLE KEYS */;

INSERT INTO `users-permissions_permission` (`id`, `type`, `controller`, `action`, `enabled`, `policy`, `role`)
VALUES
	(1,'application','activities','count',0,'',1),
	(2,'application','activities','count',1,'',2),
	(3,'application','activities','create',0,'',1),
	(4,'application','activities','create',1,'',2),
	(5,'application','activities','delete',0,'',1),
	(6,'application','activities','delete',0,'',2),
	(7,'application','activities','find',0,'',1),
	(8,'application','activities','find',1,'',2),
	(9,'application','activities','findone',0,'',1),
	(10,'application','activities','findone',0,'',2),
	(11,'application','activities','update',0,'',1),
	(12,'application','activities','update',0,'',2),
	(13,'application','activities','updateprice',0,'',1),
	(14,'application','activities','updateprice',1,'',2),
	(15,'application','email-settings','delete',0,'',1),
	(16,'application','email-settings','delete',0,'',2),
	(17,'application','email-settings','find',0,'',1),
	(18,'application','email-settings','find',0,'',2),
	(19,'application','email-settings','update',0,'',1),
	(20,'application','email-settings','update',0,'',2),
	(21,'content-manager','components','findcomponent',0,'',1),
	(22,'content-manager','components','findcomponent',0,'',2),
	(23,'content-manager','components','listcomponents',0,'',1),
	(24,'content-manager','components','listcomponents',0,'',2),
	(25,'content-manager','components','updatecomponent',0,'',1),
	(26,'content-manager','components','updatecomponent',0,'',2),
	(27,'content-manager','contentmanager','checkuidavailability',0,'',1),
	(28,'content-manager','contentmanager','checkuidavailability',0,'',2),
	(29,'content-manager','contentmanager','count',0,'',1),
	(30,'content-manager','contentmanager','count',0,'',2),
	(31,'content-manager','contentmanager','create',0,'',1),
	(32,'content-manager','contentmanager','create',0,'',2),
	(33,'content-manager','contentmanager','delete',0,'',1),
	(34,'content-manager','contentmanager','delete',0,'',2),
	(35,'content-manager','contentmanager','deletemany',0,'',1),
	(36,'content-manager','contentmanager','deletemany',0,'',2),
	(37,'content-manager','contentmanager','find',0,'',1),
	(38,'content-manager','contentmanager','find',0,'',2),
	(39,'content-manager','contentmanager','findone',0,'',1),
	(40,'content-manager','contentmanager','findone',0,'',2),
	(41,'content-manager','contentmanager','generateuid',0,'',1),
	(42,'content-manager','contentmanager','generateuid',0,'',2),
	(43,'content-manager','contentmanager','update',0,'',1),
	(44,'content-manager','contentmanager','update',0,'',2),
	(45,'content-manager','contenttypes','findcontenttype',0,'',1),
	(46,'content-manager','contenttypes','findcontenttype',0,'',2),
	(47,'content-manager','contenttypes','listcontenttypes',0,'',1),
	(48,'content-manager','contenttypes','listcontenttypes',0,'',2),
	(49,'content-manager','contenttypes','updatecontenttype',0,'',1),
	(50,'content-manager','contenttypes','updatecontenttype',0,'',2),
	(51,'content-type-builder','builder','getreservednames',0,'',1),
	(52,'content-type-builder','builder','getreservednames',0,'',2),
	(53,'content-type-builder','componentcategories','deletecategory',0,'',1),
	(54,'content-type-builder','componentcategories','deletecategory',0,'',2),
	(55,'content-type-builder','componentcategories','editcategory',0,'',1),
	(56,'content-type-builder','componentcategories','editcategory',0,'',2),
	(57,'content-type-builder','components','createcomponent',0,'',1),
	(58,'content-type-builder','components','createcomponent',0,'',2),
	(59,'content-type-builder','components','deletecomponent',0,'',1),
	(60,'content-type-builder','components','deletecomponent',0,'',2),
	(61,'content-type-builder','components','getcomponent',0,'',1),
	(62,'content-type-builder','components','getcomponent',0,'',2),
	(63,'content-type-builder','components','getcomponents',0,'',1),
	(64,'content-type-builder','components','getcomponents',0,'',2),
	(65,'content-type-builder','components','updatecomponent',0,'',1),
	(66,'content-type-builder','components','updatecomponent',0,'',2),
	(67,'content-type-builder','connections','getconnections',0,'',1),
	(68,'content-type-builder','connections','getconnections',0,'',2),
	(69,'content-type-builder','contenttypes','createcontenttype',0,'',1),
	(70,'content-type-builder','contenttypes','createcontenttype',0,'',2),
	(71,'content-type-builder','contenttypes','deletecontenttype',0,'',1),
	(72,'content-type-builder','contenttypes','deletecontenttype',0,'',2),
	(73,'content-type-builder','contenttypes','getcontenttype',0,'',1),
	(74,'content-type-builder','contenttypes','getcontenttype',0,'',2),
	(75,'content-type-builder','contenttypes','getcontenttypes',0,'',1),
	(76,'content-type-builder','contenttypes','getcontenttypes',0,'',2),
	(77,'content-type-builder','contenttypes','updatecontenttype',0,'',1),
	(78,'content-type-builder','contenttypes','updatecontenttype',0,'',2),
	(79,'email','email','send',0,'',1),
	(80,'email','email','send',0,'',2),
	(81,'upload','proxy','uploadproxy',0,'',1),
	(82,'upload','proxy','uploadproxy',0,'',2),
	(83,'upload','upload','count',0,'',1),
	(84,'upload','upload','count',0,'',2),
	(85,'upload','upload','destroy',0,'',1),
	(86,'upload','upload','destroy',0,'',2),
	(87,'upload','upload','find',0,'',1),
	(88,'upload','upload','find',0,'',2),
	(89,'upload','upload','findone',0,'',1),
	(90,'upload','upload','findone',0,'',2),
	(91,'upload','upload','getsettings',0,'',1),
	(92,'upload','upload','getsettings',0,'',2),
	(93,'upload','upload','search',0,'',1),
	(94,'upload','upload','search',0,'',2),
	(95,'upload','upload','updatesettings',0,'',1),
	(96,'upload','upload','updatesettings',0,'',2),
	(97,'upload','upload','upload',0,'',1),
	(98,'upload','upload','upload',0,'',2),
	(99,'users-permissions','auth','callback',0,'',1),
	(100,'users-permissions','auth','callback',1,'',2),
	(101,'users-permissions','auth','connect',1,'',1),
	(102,'users-permissions','auth','connect',1,'',2),
	(103,'users-permissions','auth','emailconfirmation',0,'',1),
	(104,'users-permissions','auth','emailconfirmation',1,'',2),
	(105,'users-permissions','auth','forgotpassword',0,'',1),
	(106,'users-permissions','auth','forgotpassword',1,'',2),
	(107,'users-permissions','auth','register',0,'',1),
	(108,'users-permissions','auth','register',1,'',2),
	(109,'users-permissions','auth','resetpassword',0,'',1),
	(110,'users-permissions','auth','resetpassword',0,'',2),
	(121,'users-permissions','auth','sendemailconfirmation',0,'',1),
	(122,'users-permissions','auth','sendemailconfirmation',0,'',2),
	(123,'users-permissions','user','count',0,'',1),
	(124,'users-permissions','user','count',0,'',2),
	(125,'users-permissions','user','create',0,'',1),
	(126,'users-permissions','user','create',0,'',2),
	(127,'users-permissions','user','destroy',0,'',1),
	(128,'users-permissions','user','destroy',0,'',2),
	(129,'users-permissions','user','destroyall',0,'',1),
	(130,'users-permissions','user','destroyall',0,'',2),
	(131,'users-permissions','user','find',0,'',1),
	(132,'users-permissions','user','find',0,'',2),
	(133,'users-permissions','user','findone',0,'',1),
	(134,'users-permissions','user','findone',0,'',2),
	(135,'users-permissions','user','me',1,'',1),
	(136,'users-permissions','user','me',1,'',2),
	(137,'users-permissions','user','update',0,'',1),
	(138,'users-permissions','user','update',0,'',2),
	(139,'users-permissions','userspermissions','createrole',0,'',1),
	(140,'users-permissions','userspermissions','createrole',0,'',2),
	(141,'users-permissions','userspermissions','deleteprovider',0,'',1),
	(142,'users-permissions','userspermissions','deleteprovider',0,'',2),
	(143,'users-permissions','userspermissions','deleterole',0,'',1),
	(144,'users-permissions','userspermissions','deleterole',0,'',2),
	(145,'users-permissions','userspermissions','getadvancedsettings',0,'',1),
	(146,'users-permissions','userspermissions','getadvancedsettings',0,'',2),
	(147,'users-permissions','userspermissions','getemailtemplate',0,'',1),
	(148,'users-permissions','userspermissions','getemailtemplate',0,'',2),
	(149,'users-permissions','userspermissions','getpermissions',0,'',1),
	(150,'users-permissions','userspermissions','getpermissions',0,'',2),
	(151,'users-permissions','userspermissions','getpolicies',0,'',1),
	(152,'users-permissions','userspermissions','getpolicies',0,'',2),
	(153,'users-permissions','userspermissions','getproviders',0,'',1),
	(154,'users-permissions','userspermissions','getproviders',0,'',2),
	(155,'users-permissions','userspermissions','getrole',0,'',1),
	(156,'users-permissions','userspermissions','getrole',0,'',2),
	(157,'users-permissions','userspermissions','getroles',0,'',1),
	(158,'users-permissions','userspermissions','getroles',0,'',2),
	(159,'users-permissions','userspermissions','getroutes',0,'',1),
	(160,'users-permissions','userspermissions','getroutes',0,'',2),
	(161,'users-permissions','userspermissions','index',0,'',1),
	(162,'users-permissions','userspermissions','index',0,'',2),
	(163,'users-permissions','userspermissions','init',1,'',1),
	(164,'users-permissions','userspermissions','init',1,'',2),
	(165,'users-permissions','userspermissions','searchusers',0,'',1),
	(166,'users-permissions','userspermissions','searchusers',0,'',2),
	(167,'users-permissions','userspermissions','updateadvancedsettings',0,'',1),
	(168,'users-permissions','userspermissions','updateadvancedsettings',0,'',2),
	(169,'users-permissions','userspermissions','updateemailtemplate',0,'',1),
	(170,'users-permissions','userspermissions','updateemailtemplate',0,'',2),
	(171,'users-permissions','userspermissions','updateproviders',0,'',1),
	(172,'users-permissions','userspermissions','updateproviders',0,'',2),
	(173,'users-permissions','userspermissions','updaterole',0,'',1),
	(174,'users-permissions','userspermissions','updaterole',0,'',2);

/*!40000 ALTER TABLE `users-permissions_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users-permissions_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users-permissions_role`;

CREATE TABLE `users-permissions_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_role_type_unique` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `users-permissions_role` WRITE;
/*!40000 ALTER TABLE `users-permissions_role` DISABLE KEYS */;

INSERT INTO `users-permissions_role` (`id`, `name`, `description`, `type`)
VALUES
	(1,'Authenticated','Default role given to authenticated user.','authenticated'),
	(2,'Public','Default role given to unauthenticated user.','public');

/*!40000 ALTER TABLE `users-permissions_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users-permissions_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users-permissions_user`;

CREATE TABLE `users-permissions_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_user_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
