-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.18 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table westbengal_ramp.investor_opportunity
CREATE TABLE IF NOT EXISTS `investor_opportunity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip_id` int(11) DEFAULT NULL COMMENT 'investor profile ID',
  `company_name` varchar(200) DEFAULT NULL,
  `company_logo` varchar(200) DEFAULT NULL,
  `fund_name` varchar(100) DEFAULT NULL,
  `fund_size` double(16,2) DEFAULT NULL,
  `stage` varchar(50) DEFAULT NULL,
  `about_investment` text,
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table westbengal_ramp.investor_opportunity: ~3 rows (approximately)
/*!40000 ALTER TABLE `investor_opportunity` DISABLE KEYS */;
INSERT INTO `investor_opportunity` (`id`, `user_id`, `ip_id`, `company_name`, `company_logo`, `fund_name`, `fund_size`, `stage`, `about_investment`, `expiry_date`) VALUES
	(1, 10, 2, 'Zen Max Industies', '/uploads/investor opportunity/10/io_1745402013.jpeg', 'ABC', 5000000000.00, 'Seed', 'This portal has been developed merely for the purpose of introducing Investors and Startups to enable Startups get required investments. The portal does not participate in the online or offline buying, selling or any other transactions of securities, or settlement of trades of securities. It is not a platform for trading and should not be viewed as a Stock Exchange set up under the Securities Contract Regulation Act, 1956.\r\n', '2029-01-09'),
	(2, 10, 2, 'Udaan Pasand', '/uploads/investor opportunity/10/io_1745475878.jpeg', 'Facisse', 12200000.00, 'Series A', 'Advertising,Media & Entertainment,Automotive,Financial Services,Aviation & Aerospace,Agriculture,Consumer Packaged Goods,Education & Training,Energy & Utilities,Healthcare & Pharmaceuticals,IT & ITES,Manufacturing,Retail,Telecom,Transportation & Logistics,Travel & Hospitality', '2032-10-12'),
	(3, 11, 3, 'Hill Stone', '/uploads/investor opportunity/11/io_1745485601.jpeg', 'XYZ', 120000000.00, 'Series A', 'kashjcfjksnckjdas vjksa jk jkad jdjkafjka ', '2027-06-09');
/*!40000 ALTER TABLE `investor_opportunity` ENABLE KEYS */;

-- Dumping structure for table westbengal_ramp.investor_opportunity_startup_connect
CREATE TABLE IF NOT EXISTS `investor_opportunity_startup_connect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `io_id` int(11) DEFAULT NULL COMMENT 'investor opportunity',
  `stqartup_user_id` int(11) DEFAULT NULL,
  `pitch_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `applied_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table westbengal_ramp.investor_opportunity_startup_connect: ~3 rows (approximately)
/*!40000 ALTER TABLE `investor_opportunity_startup_connect` DISABLE KEYS */;
INSERT INTO `investor_opportunity_startup_connect` (`id`, `io_id`, `stqartup_user_id`, `pitch_id`, `status`, `applied_on`) VALUES
	(1, 1, 9, 6, 'pending', '2025-04-24 11:39:21'),
	(2, 3, 9, 6, 'pending', '2025-04-24 14:39:13'),
	(3, 2, 9, 6, 'pending', '2025-04-24 15:40:50');
/*!40000 ALTER TABLE `investor_opportunity_startup_connect` ENABLE KEYS */;

-- Dumping structure for table westbengal_ramp.investor_profile
CREATE TABLE IF NOT EXISTS `investor_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `industries` varchar(500) DEFAULT NULL,
  `technologies` varchar(500) DEFAULT NULL,
  `insta` varchar(500) DEFAULT NULL,
  `facebook` varchar(500) DEFAULT NULL,
  `twitter` varchar(500) DEFAULT NULL,
  `linkedin` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table westbengal_ramp.investor_profile: ~3 rows (approximately)
/*!40000 ALTER TABLE `investor_profile` DISABLE KEYS */;
INSERT INTO `investor_profile` (`id`, `user_id`, `role`, `industries`, `technologies`, `insta`, `facebook`, `twitter`, `linkedin`) VALUES
	(2, 10, 'Angel Investor', 'Healthcare,Agriculture', 'AI,IoT,AR/VR,Blockchain', 'https://www.instagram.com/startupindia.gov.in', 'https://www.facebook.com/StartupIndia/', 'https://x.com/startupindia', 'https://www.linkedin.com/company/startup-india'),
	(3, 11, 'Venture Capitalist', 'Healthcare,FinTech,E-Commerce,EdTech,Agriculture', 'AI,Blockchain,IoT,AR/VR,Cloud Computing,Web3', 'https://www.instagram.com/startupindia.gov.in', 'https://www.facebook.com/StartupIndia/', '', ''),
	(4, 12, 'Angel Investor', 'Healthcare,FinTech,E-Commerce,EdTech,Agriculture', 'AI,Blockchain,IoT,AR/VR,Cloud Computing', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `investor_profile` ENABLE KEYS */;

-- Dumping structure for table westbengal_ramp.mpr
CREATE TABLE IF NOT EXISTS `mpr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT NULL,
  `applicant_id` int(11) DEFAULT NULL,
  `month` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `remark` text,
  `file` varchar(500) DEFAULT NULL,
  `uploaded_on` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending',
  `progress_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='pitch monthly progress report metadata';

-- Dumping data for table westbengal_ramp.mpr: ~4 rows (approximately)
/*!40000 ALTER TABLE `mpr` DISABLE KEYS */;
INSERT INTO `mpr` (`id`, `p_id`, `applicant_id`, `month`, `year`, `remark`, `file`, `uploaded_on`, `status`, `progress_status`) VALUES
	(1, 4, 4, 'April', 2025, 'Check test dummay', '/uploads/pitches/4/mpr_1745223571.pdf', '2025-04-21 13:49:31', 'pending', ''),
	(2, 5, 8, 'April', 2025, 'this is monthly progress report ', '/uploads/pitches/8/mpr_1745238356.pdf', '2025-04-21 17:55:56', 'pending', ''),
	(3, 6, 9, 'April', 2025, 'dummy data', '/uploads/pitches/9/mpr_1745298825.pdf', '2025-04-22 10:43:45', 'pending', ''),
	(4, 6, 9, 'March', 2025, 'Test', '/uploads/pitches/9/mpr_1745312098.pdf', '2025-04-22 14:24:58', 'pending', 'Ready To Launch');
/*!40000 ALTER TABLE `mpr` ENABLE KEYS */;

-- Dumping structure for table westbengal_ramp.msme_dms
CREATE TABLE IF NOT EXISTS `msme_dms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msme_id` int(11) DEFAULT NULL,
  `document` varchar(200) DEFAULT NULL,
  `remark` text,
  `created_on` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__msme_registration` (`msme_id`),
  KEY `FK__mst_option_value` (`document`),
  CONSTRAINT `FK__msme_registration` FOREIGN KEY (`msme_id`) REFERENCES `msme_registration` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table westbengal_ramp.msme_dms: ~0 rows (approximately)
/*!40000 ALTER TABLE `msme_dms` DISABLE KEYS */;
/*!40000 ALTER TABLE `msme_dms` ENABLE KEYS */;

-- Dumping structure for table westbengal_ramp.msme_registration
CREATE TABLE IF NOT EXISTS `msme_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(200) DEFAULT NULL,
  `owner_name` varchar(200) DEFAULT NULL,
  `contact` char(50) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `business_type` varchar(500) DEFAULT NULL,
  `reg_no` varchar(50) DEFAULT NULL,
  `service_type` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `description` text,
  `status` varchar(50) DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `FK_msme_registration_mst_option_value` (`business_type`),
  KEY `FK_msme_registration_mst_option_value_2` (`service_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table westbengal_ramp.msme_registration: ~0 rows (approximately)
/*!40000 ALTER TABLE `msme_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `msme_registration` ENABLE KEYS */;

-- Dumping structure for table westbengal_ramp.mst_option
CREATE TABLE IF NOT EXISTS `mst_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- Dumping data for table westbengal_ramp.mst_option: ~33 rows (approximately)
/*!40000 ALTER TABLE `mst_option` DISABLE KEYS */;
INSERT INTO `mst_option` (`id`, `name`, `created_by`, `created_on`, `updated_by`, `updated_on`, `is_active`) VALUES
	(1, 'Country', 1, '2023-02-22 12:50:25', 1, '2023-09-06 18:14:38', 1),
	(2, 'State', 1, '2023-02-22 12:50:25', NULL, '2023-02-22 12:50:25', 1),
	(3, 'Entity', 1, '2023-02-22 12:50:25', NULL, '2023-02-22 12:50:25', 1),
	(4, 'Document', 1, '2023-02-22 12:50:25', NULL, '2023-02-22 12:50:25', 1),
	(5, 'Gender', 1, '2023-02-22 12:50:25', NULL, '2023-02-23 01:20:25', 1),
	(6, 'Religion', 1, '2023-02-22 12:50:25', NULL, '2023-02-23 01:20:25', 1),
	(7, 'Relationship', 1, '2023-10-04 18:43:52', NULL, NULL, 1),
	(8, 'DMS Type', 1, '2024-01-10 21:02:06', 1, '2024-01-10 21:02:06', 1),
	(9, 'CMS', 1, '2024-01-10 21:07:35', 1, '2024-01-10 21:07:35', 1),
	(10, 'Dashboard', 1, '2024-01-10 21:11:04', 1, '2024-01-10 21:11:04', 1),
	(11, 'MIS Reports', 1, '2024-01-10 21:13:57', 1, '2024-01-10 21:13:57', 1),
	(12, 'Integrations ', 1, '2024-01-11 15:24:55', 1, '2024-01-11 15:24:55', 1),
	(13, 'Notification Services', 1, '2024-01-11 15:24:55', 1, '2024-01-11 15:24:55', 1),
	(14, 'Help Desk', 1, '2024-01-11 15:24:55', 1, '2024-01-11 15:24:55', 1),
	(15, 'Certificate Verification', 1, '2024-01-11 15:24:55', 1, '2024-01-11 15:24:55', 1),
	(16, 'Common Features', 1, '2024-01-11 15:24:55', 1, '2024-01-11 15:24:55', 1),
	(17, 'Design UI/UX', 1, '2024-01-11 15:24:55', 1, '2024-01-11 15:24:55', 1),
	(18, 'Bo User Actions', 1, '2024-07-01 18:11:52', NULL, NULL, 0),
	(19, 'BO Workflow', 1, '2024-07-05 10:56:39', NULL, NULL, 1),
	(20, 'District', 1, '2024-07-21 19:53:00', NULL, NULL, 1),
	(21, 'Company Type', 6, '2024-07-23 11:40:45', NULL, NULL, 1),
	(22, 'Number List', 6, '2024-07-23 11:45:03', NULL, NULL, 1),
	(23, 'Type of Shares', 6, '2024-07-23 11:47:12', NULL, NULL, 1),
	(24, 'Yes-No', 6, '2024-07-23 11:51:56', NULL, NULL, 1),
	(25, 'Building where project is proposed', 6, '2024-07-23 11:51:56', NULL, NULL, 1),
	(26, 'Bank Account Type', 1, '2023-02-22 12:50:25', NULL, '2023-02-22 12:50:25', 1),
	(27, 'Type of the Project', 1, '2023-02-22 12:50:25', NULL, '2023-02-22 12:50:25', 1),
	(28, 'Other Modules', 1, '2024-10-07 18:16:49', NULL, NULL, 1),
	(29, 'Industry Type', 6, '2024-10-09 12:39:07', 2, '2025-02-27 11:36:31', 1),
	(30, 'Industrial Areas', 2, '2025-02-26 17:10:04', NULL, NULL, 1),
	(31, 'Type of Unit', 2, '2025-02-27 11:34:26', NULL, NULL, 1),
	(32, 'Sector Type', 2, '2025-02-27 11:35:08', NULL, NULL, 1),
	(33, 'Electricity Load', 2, '2025-02-27 11:35:31', NULL, NULL, 1),
	(34, 'Business Type', 0, '0000-00-00 00:00:00', NULL, NULL, 1),
	(35, 'Service Type', 0, '0000-00-00 00:00:00', NULL, NULL, 1);
/*!40000 ALTER TABLE `mst_option` ENABLE KEYS */;

-- Dumping structure for table westbengal_ramp.mst_option_value
CREATE TABLE IF NOT EXISTS `mst_option_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) DEFAULT NULL COMMENT 'mst option id',
  `parent_option_value_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `name_hindi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `code` varchar(55) DEFAULT NULL,
  `preference_order` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT '1',
  `updated_on` datetime DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_option_value_id`),
  KEY `option_tag_id` (`option_id`),
  CONSTRAINT `mst_option_value_ibfk_1` FOREIGN KEY (`option_id`) REFERENCES `mst_option` (`id`),
  CONSTRAINT `mst_option_value_ibfk_2` FOREIGN KEY (`parent_option_value_id`) REFERENCES `mst_option_value` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1088 DEFAULT CHARSET=latin1;

-- Dumping data for table westbengal_ramp.mst_option_value: ~434 rows (approximately)
/*!40000 ALTER TABLE `mst_option_value` DISABLE KEYS */;
INSERT INTO `mst_option_value` (`id`, `option_id`, `parent_option_value_id`, `name`, `name_hindi`, `code`, `preference_order`, `created_by`, `created_on`, `updated_by`, `updated_on`, `is_active`) VALUES
	(644, 1, NULL, 'Afghanistan', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(645, 1, NULL, 'Albania', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(646, 1, NULL, 'Algeria', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(647, 1, NULL, 'American Samoa', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(648, 1, NULL, 'Andorra', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(649, 1, NULL, 'Angola', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(650, 1, NULL, 'Anguilla', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(651, 1, NULL, 'Antarctica', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(652, 1, NULL, 'Antigua and Barbuda', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(653, 1, NULL, 'Argentina', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(654, 1, NULL, 'Armenia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(655, 1, NULL, 'Aruba', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(656, 1, NULL, 'Australia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(657, 1, NULL, 'Austria', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(658, 1, NULL, 'Azerbaijan', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(659, 1, NULL, 'Bahamas', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(660, 1, NULL, 'Bahrain', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(661, 1, NULL, 'Bangladesh', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(662, 1, NULL, 'Barbados', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(663, 1, NULL, 'Belarus', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(664, 1, NULL, 'Belgium', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(665, 1, NULL, 'Belize', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(666, 1, NULL, 'Benin', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(667, 1, NULL, 'Bermuda', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(668, 1, NULL, 'Bhutan', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(669, 1, NULL, 'Bolivia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(670, 1, NULL, 'Bosnia and Herzegovina', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(671, 1, NULL, 'Botswana', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(672, 1, NULL, 'Bouvet Island', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(673, 1, NULL, 'Brazil', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(674, 1, NULL, 'British Indian Ocean Territory', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(675, 1, NULL, 'Brunei Darussalam', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(676, 1, NULL, 'Bulgaria', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(677, 1, NULL, 'Burkina Faso', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(678, 1, NULL, 'Burundi', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(679, 1, NULL, 'Cambodia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(680, 1, NULL, 'Cameroon', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(681, 1, NULL, 'Canada', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(682, 1, NULL, 'Cape Verde', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(683, 1, NULL, 'Cayman Islands', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(684, 1, NULL, 'Central African Republic', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(685, 1, NULL, 'Chad', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(686, 1, NULL, 'Chile', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(687, 1, NULL, 'China', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(688, 1, NULL, 'Christmas Island', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(689, 1, NULL, 'Cocos (Keeling) Islands', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(690, 1, NULL, 'Colombia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(691, 1, NULL, 'Comoros', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(692, 1, NULL, 'Congo', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(693, 1, NULL, 'Congo, the Democratic Republic of the', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(694, 1, NULL, 'Cook Islands', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(695, 1, NULL, 'Costa Rica', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(696, 1, NULL, 'Cote D\'Ivoire', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(697, 1, NULL, 'Croatia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(698, 1, NULL, 'Cuba', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(699, 1, NULL, 'Cyprus', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(700, 1, NULL, 'Czech Republic', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(701, 1, NULL, 'Denmark', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(702, 1, NULL, 'Djibouti', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(703, 1, NULL, 'Dominica', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(704, 1, NULL, 'Dominican Republic', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(705, 1, NULL, 'Ecuador', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(706, 1, NULL, 'Egypt', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(707, 1, NULL, 'El Salvador', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(708, 1, NULL, 'Equatorial Guinea', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(709, 1, NULL, 'Eritrea', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(710, 1, NULL, 'Estonia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(711, 1, NULL, 'Ethiopia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(712, 1, NULL, 'Falkland Islands (Malvinas)', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(713, 1, NULL, 'Faroe Islands', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(714, 1, NULL, 'Fiji', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(715, 1, NULL, 'Finland', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(716, 1, NULL, 'France', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(717, 1, NULL, 'French Guiana', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(718, 1, NULL, 'French Polynesia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(719, 1, NULL, 'French Southern Territories', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(720, 1, NULL, 'Gabon', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(721, 1, NULL, 'Gambia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(722, 1, NULL, 'Georgia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(723, 1, NULL, 'Germany', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(724, 1, NULL, 'Ghana', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(725, 1, NULL, 'Gibraltar', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(726, 1, NULL, 'Greece', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(727, 1, NULL, 'Greenland', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(728, 1, NULL, 'Grenada', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(729, 1, NULL, 'Guadeloupe', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(730, 1, NULL, 'Guam', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(731, 1, NULL, 'Guatemala', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(732, 1, NULL, 'Guinea', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(733, 1, NULL, 'Guinea-Bissau', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(734, 1, NULL, 'Guyana', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(735, 1, NULL, 'Haiti', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(736, 1, NULL, 'Heard Island and Mcdonald Islands', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(737, 1, NULL, 'Holy See (Vatican City State)', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(738, 1, NULL, 'Honduras', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(739, 1, NULL, 'Hong Kong', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(740, 1, NULL, 'Hungary', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(741, 1, NULL, 'Iceland', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(742, 1, NULL, 'India', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(743, 1, NULL, 'Indonesia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(744, 1, NULL, 'Iran, Islamic Republic of', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(745, 1, NULL, 'Iraq', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(746, 1, NULL, 'Ireland', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(747, 1, NULL, 'Israel', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(748, 1, NULL, 'Italy', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(749, 1, NULL, 'Jamaica', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(750, 1, NULL, 'Japan', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(751, 1, NULL, 'Jordan', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(752, 1, NULL, 'Kazakhstan', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(753, 1, NULL, 'Kenya', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(754, 1, NULL, 'Kiribati', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(755, 1, NULL, 'Korea, Democratic People\'s Republic of', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(756, 1, NULL, 'Korea, Republic of', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(757, 1, NULL, 'Kuwait', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(758, 1, NULL, 'Kyrgyzstan', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(759, 1, NULL, 'Lao People\'s Democratic Republic', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(760, 1, NULL, 'Latvia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(761, 1, NULL, 'Lebanon', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(762, 1, NULL, 'Lesotho', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(763, 1, NULL, 'Liberia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(764, 1, NULL, 'Libyan Arab Jamahiriya', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(765, 1, NULL, 'Liechtenstein', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(766, 1, NULL, 'Lithuania', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(767, 1, NULL, 'Luxembourg', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(768, 1, NULL, 'Macao', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(769, 1, NULL, 'Madagascar', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(770, 1, NULL, 'Malawi', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(771, 1, NULL, 'Malaysia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(772, 1, NULL, 'Maldives', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(773, 1, NULL, 'Mali', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(774, 1, NULL, 'Malta', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(775, 1, NULL, 'Marshall Islands', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(776, 1, NULL, 'Martinique', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(777, 1, NULL, 'Mauritania', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(778, 1, NULL, 'Mauritius', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(779, 1, NULL, 'Mayotte', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(780, 1, NULL, 'Mexico', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(781, 1, NULL, 'Micronesia, Federated States of', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(782, 1, NULL, 'Moldova, Republic of', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(783, 1, NULL, 'Monaco', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(784, 1, NULL, 'Mongolia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(785, 1, NULL, 'Montserrat', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(786, 1, NULL, 'Morocco', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(787, 1, NULL, 'Mozambique', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(788, 1, NULL, 'Myanmar', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(789, 1, NULL, 'Namibia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(790, 1, NULL, 'Nauru', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(791, 1, NULL, 'Nepal', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(792, 1, NULL, 'Netherlands', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(793, 1, NULL, 'Netherlands Antilles', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(794, 1, NULL, 'New Caledonia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(795, 1, NULL, 'New Zealand', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(796, 1, NULL, 'Nicaragua', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(797, 1, NULL, 'Niger', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(798, 1, NULL, 'Nigeria', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(799, 1, NULL, 'Niue', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(800, 1, NULL, 'Norfolk Island', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(801, 1, NULL, 'Norway', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(802, 1, NULL, 'Oman', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(803, 1, NULL, 'Pakistan', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(804, 1, NULL, 'Palau', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(805, 1, NULL, 'Panama', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(806, 1, NULL, 'Papua New Guinea', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(807, 1, NULL, 'Paraguay', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(808, 1, NULL, 'Peru', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(809, 1, NULL, 'Philippines', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(810, 1, NULL, 'Pitcairn', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(811, 1, NULL, 'Poland', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(812, 1, NULL, 'Portugal', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(813, 1, NULL, 'Puerto Rico', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(814, 1, NULL, 'Qatar', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(815, 1, NULL, 'Reunion', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(816, 1, NULL, 'Romania', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(817, 1, NULL, 'Russian Federation', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(818, 1, NULL, 'Rwanda', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(819, 1, NULL, 'Saint Helena', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(820, 1, NULL, 'Saint Kitts and Nevis', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(821, 1, NULL, 'Saint Lucia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(822, 1, NULL, 'Saint Pierre and Miquelon', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(823, 1, NULL, 'Samoa', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(824, 1, NULL, 'San Marino', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(825, 1, NULL, 'Sao Tome and Principe', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(826, 1, NULL, 'Saudi Arabia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(827, 1, NULL, 'Senegal', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(828, 1, NULL, 'Serbia and Montenegro', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(829, 1, NULL, 'Seychelles', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(830, 1, NULL, 'Sierra Leone', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(831, 1, NULL, 'Singapore', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(832, 1, NULL, 'Slovakia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(833, 1, NULL, 'Slovenia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(834, 1, NULL, 'Solomon Islands', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(835, 1, NULL, 'Somalia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(836, 1, NULL, 'South Africa', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(837, 1, NULL, 'Spain', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(838, 1, NULL, 'Sri Lanka', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(839, 1, NULL, 'Sudan', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(840, 1, NULL, 'Suriname', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(841, 1, NULL, 'Svalbard and Jan Mayen', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(842, 1, NULL, 'Swaziland', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(843, 1, NULL, 'Sweden', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(844, 1, NULL, 'Switzerland', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(845, 1, NULL, 'Syrian Arab Republic', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(846, 1, NULL, 'Taiwan, Province of China', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(847, 1, NULL, 'Tajikistan', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(848, 1, NULL, 'Tanzania, United Republic of', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(849, 1, NULL, 'Thailand', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(850, 1, NULL, 'Timor-Leste', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(851, 1, NULL, 'Togo', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(852, 1, NULL, 'Tokelau', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(853, 1, NULL, 'Tonga', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(854, 1, NULL, 'Trinidad and Tobago', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(855, 1, NULL, 'Tunisia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(856, 1, NULL, 'Turkey', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(857, 1, NULL, 'Turkmenistan', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(858, 1, NULL, 'Turks and Caicos Islands', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(859, 1, NULL, 'Tuvalu', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(860, 1, NULL, 'Uganda', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(861, 1, NULL, 'Ukraine', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(862, 1, NULL, 'United Arab Emirates', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(863, 1, NULL, 'United Kingdom', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(864, 1, NULL, 'United States', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(865, 1, NULL, 'United States Minor Outlying Islands', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(866, 1, NULL, 'Uruguay', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(867, 1, NULL, 'Uzbekistan', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(868, 1, NULL, 'Vanuatu', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(869, 1, NULL, 'Venezuela', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(870, 1, NULL, 'Viet Nam', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(871, 1, NULL, 'Virgin Islands, British', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(872, 1, NULL, 'Virgin Islands, U.s.', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(873, 1, NULL, 'Wallis and Futuna', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(874, 1, NULL, 'Western Sahara', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(875, 1, NULL, 'Yemen', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(876, 1, NULL, 'Zambia', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(877, 1, NULL, 'Zimbabwe', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(878, 2, 742, 'Andhra Pradesh', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(879, 2, 742, 'Arunachal Pradesh', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(880, 2, 742, 'Assam', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(881, 2, 742, 'Bihar', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(882, 2, 742, 'Chhattisgarh', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(883, 2, 742, 'Goa', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(884, 2, 742, 'Gujrat', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(885, 2, 742, 'Haryana', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(886, 2, 742, 'Himachal Pradesh', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(887, 2, 742, 'Jharkhand', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(888, 2, 742, 'Karnatka', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(889, 2, 742, 'Kerla', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(890, 2, 742, 'Madhya Pradesh', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(891, 2, 742, 'Maharashtra', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(892, 2, 742, 'Manipur', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(893, 2, 742, 'Meghalaya', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(894, 2, 742, 'Mizoram', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(895, 2, 742, 'Nagaland', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-15 11:59:37', 1),
	(896, 2, 742, 'Odisha', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:07:47', 1),
	(897, 2, 742, 'Punjab', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:07:47', 1),
	(898, 2, 742, 'Rajasthan', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:07:47', 1),
	(899, 2, 742, 'Sikkim', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:07:47', 1),
	(900, 2, 742, 'Tamil Nadu', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:07:47', 1),
	(901, 2, 742, 'Telangana', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:07:47', 1),
	(902, 2, 742, 'Tripura', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:07:47', 1),
	(903, 2, 742, 'Uttarakhand', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:07:47', 1),
	(904, 2, 742, 'Uttar Pradesh', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:07:47', 1),
	(905, 2, 742, 'West Bengal', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:07:47', 1),
	(906, 2, 742, 'Andaman and Nicobar Islands (UT)', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:28:55', 1),
	(907, 2, 742, 'Dadra and Nagar Haveli and Daman & Diu (UT)', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:28:55', 1),
	(908, 2, 742, 'Jammu & Kashmir (UT)', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:28:55', 1),
	(909, 2, 742, 'Lakshadweep (UT)', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:28:55', 1),
	(910, 2, 742, 'Chandigarh (UT)', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:28:55', 1),
	(911, 2, 742, 'Delhi (UT)', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:28:55', 1),
	(912, 2, 742, 'Ladakh (UT)', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:28:55', 1),
	(913, 2, 742, 'Puducherry (UT)', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-22 13:28:55', 1),
	(914, 3, NULL, 'Central Ministries', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-03-02 14:04:55', 1),
	(915, 3, NULL, 'State Departments', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-23 16:28:42', 1),
	(916, 4, NULL, 'Aadhar Card', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-23 16:28:42', 1),
	(917, 4, NULL, 'PAN Card', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-23 16:28:42', 1),
	(918, 3, NULL, 'NGO', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-23 16:28:42', 1),
	(920, 3, NULL, 'Societies', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-23 16:28:42', 1),
	(921, 3, NULL, 'Corporate', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-23 16:28:42', 1),
	(922, 3, NULL, 'Companies', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-23 16:28:42', 1),
	(923, 3, NULL, 'Federal Government', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-23 16:28:42', 1),
	(924, 4, NULL, 'Passport', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-23 16:28:42', 1),
	(925, 4, NULL, 'Voter ID', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-23 16:28:42', 1),
	(926, 4, NULL, 'Others', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-02-23 16:28:42', 1),
	(927, 5, NULL, 'Male', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-16 00:29:37', 1),
	(928, 5, NULL, 'Female', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-16 00:29:37', 1),
	(929, 5, NULL, 'Transgender', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2023-03-11 13:40:08', 1),
	(930, 6, NULL, 'Hindu', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-16 00:29:37', 1),
	(931, 6, NULL, 'Sikh', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-16 00:29:37', 1),
	(932, 6, NULL, 'Muslim', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-16 00:29:37', 1),
	(933, 6, NULL, 'Budh', NULL, NULL, NULL, 1, '2022-12-15 11:59:37', NULL, '2022-12-16 00:29:37', 1),
	(936, 4, NULL, 'sd', 'sd', 'sd', NULL, 1, '2023-03-15 03:28:49', NULL, '2023-03-15 15:58:49', 1),
	(937, 4, NULL, 'dffdfdf', '', '', NULL, 1, '2023-03-15 03:33:37', NULL, '2023-03-15 16:03:37', 1),
	(938, 4, NULL, 'Letter From HOF/Gram Pradhan/Hospital Discharge Slip', '', '', NULL, 1, '2023-03-15 03:44:41', NULL, '2023-03-15 16:14:41', 1),
	(939, 4, NULL, 'Discharge report / Primary report', '', '', NULL, 1, '2023-03-15 03:45:36', NULL, '2023-03-15 16:15:36', 1),
	(940, 4, NULL, 'Self declaration letter by head of family', '', '', NULL, 1, '2023-03-15 03:46:08', NULL, '2023-03-15 16:16:08', 1),
	(941, 4, NULL, 'Joint Photograph of Bride and Groom', '', '', NULL, 1, '2023-03-15 03:47:36', NULL, '2023-03-15 16:17:36', 1),
	(942, 4, NULL, 'Resident proof', '', '', NULL, 1, '2023-03-15 03:48:02', NULL, '2023-03-15 16:18:02', 1),
	(943, 4, NULL, 'Certificate from the priest who solemnized the marriage', '', '', NULL, 1, '2023-03-15 03:48:38', NULL, '2023-03-15 16:18:38', 1),
	(944, 4, NULL, 'Bride Affidavit', '', '', NULL, 1, '2023-03-15 03:49:12', NULL, '2023-03-15 16:19:12', 1),
	(945, 4, NULL, 'Bridegroom Affidavit', '', '', NULL, 1, '2023-03-15 03:49:38', NULL, '2023-03-15 16:19:38', 1),
	(946, 4, NULL, 'Bridegrooms Age Proof Certificate', '', '', NULL, 1, '2023-03-15 03:50:02', NULL, '2023-03-15 16:20:02', 1),
	(947, 4, NULL, 'Brides Age Proof Certificate', '', '', NULL, 1, '2023-03-15 03:50:30', NULL, '2023-03-15 16:20:30', 1),
	(948, 4, NULL, 'Marriage Card', '', '', NULL, 1, '2023-03-15 03:51:00', NULL, '2023-03-15 16:21:00', 1),
	(949, 4, NULL, 'Memorandum of Marriage', '', '', NULL, 1, '2023-03-15 03:51:37', NULL, '2023-03-15 16:21:37', 1),
	(950, 4, NULL, 'Proof of Date of Birth', '', '', NULL, 1, '2023-03-15 03:54:33', NULL, '2023-03-15 16:24:33', 1),
	(951, 4, NULL, 'Address Proof', '', '', NULL, 1, '2023-03-15 03:55:17', NULL, '2023-03-15 16:25:17', 1),
	(952, 4, NULL, 'BPL Certificate', '', '', NULL, 1, '2023-03-15 03:55:38', NULL, '2023-03-15 16:25:38', 1),
	(953, 4, NULL, 'Panchayat Resolution copy for selection of beneficiary', '', '', NULL, 1, '2023-03-15 03:57:37', NULL, '2023-03-15 16:27:37', 1),
	(954, 4, NULL, 'Photocopy of Bonafide Himachali Certificate', '', '', NULL, 1, '2023-03-15 03:58:07', NULL, '2023-03-15 16:28:07', 1),
	(955, 4, NULL, 'Proof of Death of Parents', '', '', NULL, 1, '2023-03-15 04:02:29', NULL, '2023-03-15 16:32:29', 1),
	(956, 4, NULL, 'Proof of Annual Family Income', '', '', NULL, 1, '2023-03-15 04:02:57', NULL, '2023-03-15 16:32:57', 1),
	(957, 4, NULL, 'Affidavit by Mother', '', '', NULL, 1, '2023-03-15 04:03:55', NULL, '2023-03-15 16:33:55', 1),
	(958, 4, NULL, 'Anganwadi report', '', '', NULL, 1, '2023-03-15 04:04:16', NULL, '2023-03-15 16:34:16', 1),
	(959, 4, NULL, 'Proof of Date / year of the first marriage', '', '', NULL, 1, '2023-03-15 04:06:08', NULL, '2023-03-15 16:36:08', 1),
	(960, 4, NULL, 'Proof of Date / year which she became widow', '', '', NULL, 1, '2023-03-15 04:06:47', NULL, '2023-03-15 16:36:47', 1),
	(961, 4, NULL, 'Proof of Date of Re-Marriage', '', '', NULL, 1, '2023-03-15 04:07:17', NULL, '2023-03-15 16:37:17', 1),
	(962, 4, NULL, 'Proof of Name and Address of person to whom widow is marrying', '', '', NULL, 1, '2023-03-15 04:10:28', NULL, '2023-03-17 10:49:18', 1),
	(963, 4, NULL, 'Proof of the Date of Marriage', '', '', NULL, 1, '2023-03-15 04:15:00', NULL, '2023-03-15 16:45:00', 1),
	(964, 7, NULL, 'Father', NULL, NULL, NULL, 1, '2023-10-04 18:44:50', NULL, NULL, 1),
	(965, 7, NULL, 'Mother', NULL, NULL, NULL, 1, '2023-10-04 18:45:09', NULL, NULL, 1),
	(966, 7, NULL, 'Brother', NULL, NULL, NULL, 1, '2023-10-04 18:45:26', NULL, NULL, 1),
	(967, 7, NULL, 'Sister', NULL, NULL, NULL, 1, '2023-10-04 18:45:41', NULL, NULL, 1),
	(968, 7, NULL, 'Spouse', NULL, NULL, NULL, 1, '2023-10-04 18:45:57', NULL, NULL, 1),
	(969, 7, NULL, 'Son', NULL, NULL, NULL, 1, '2023-10-04 18:46:08', NULL, NULL, 1),
	(970, 7, NULL, 'Daughter', NULL, NULL, NULL, 1, '2023-10-04 18:46:26', NULL, NULL, 1),
	(971, 8, NULL, 'Custom', NULL, NULL, NULL, 1, '2024-01-10 21:02:40', 1, '2024-01-10 21:02:40', 1),
	(972, 8, NULL, 'Open KM', NULL, NULL, NULL, 1, '2024-01-10 21:02:40', 1, '2024-01-10 21:02:40', 1),
	(973, 9, NULL, 'Drupal', NULL, NULL, NULL, 1, '2024-01-10 21:08:04', 1, '2024-07-30 16:04:45', 0),
	(974, 9, NULL, 'Wordpress', NULL, NULL, NULL, 1, '2024-01-10 21:08:04', 1, '2024-01-10 21:08:04', 1),
	(975, 9, NULL, 'React', NULL, NULL, NULL, 1, '2024-01-10 21:08:04', 1, '2024-07-30 16:04:40', 0),
	(976, 9, NULL, 'Angular', NULL, NULL, NULL, 1, '2024-01-10 21:08:04', 1, '2024-07-30 16:04:37', 0),
	(977, 9, NULL, 'Custom', NULL, NULL, NULL, 1, '2024-01-10 21:08:04', 1, '2024-01-10 21:08:04', 1),
	(978, 10, NULL, 'Apache Superset', NULL, NULL, NULL, 1, '2024-01-10 21:08:04', 1, '2024-01-10 21:08:04', 1),
	(979, 10, NULL, 'amCharts', NULL, NULL, NULL, 1, '2024-01-10 21:08:04', 1, '2024-07-30 16:05:12', 1),
	(980, 10, NULL, 'Custom', NULL, NULL, NULL, 1, '2024-01-10 21:08:04', 1, '2024-01-10 21:08:04', 1),
	(981, 11, NULL, 'Drill Down Reports', NULL, NULL, NULL, 1, '2024-01-10 21:08:04', 1, '2024-01-10 21:08:04', 1),
	(982, 11, NULL, 'Export To Excel', NULL, NULL, NULL, 1, '2024-01-10 21:08:04', 1, '2024-01-10 21:08:04', 1),
	(983, 11, NULL, 'Export To PDF', NULL, NULL, NULL, 1, '2024-01-10 21:08:04', 1, '2024-01-10 21:08:04', 1),
	(984, 11, NULL, 'GIS', NULL, NULL, NULL, 1, '2024-01-10 21:08:04', 1, '2024-07-30 16:05:30', 0),
	(985, 12, NULL, 'PAN', NULL, NULL, 1, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(986, 12, NULL, 'GSTN', NULL, NULL, 2, 1, '2024-01-11 15:28:38', 1, '2024-07-30 16:06:22', 1),
	(987, 12, NULL, 'BANK', NULL, NULL, NULL, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 0),
	(988, 12, NULL, 'Payment Gateway', NULL, NULL, 7, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(989, 12, NULL, 'Login With SSO', NULL, NULL, 8, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(990, 12, NULL, 'Bhashini', NULL, NULL, 9, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(991, 12, NULL, 'GenAI Chatbot', NULL, NULL, 10, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(992, 13, NULL, 'SMS', NULL, NULL, NULL, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(993, 13, NULL, 'Email', NULL, NULL, NULL, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(994, 13, NULL, 'WhatsApp', NULL, NULL, NULL, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(995, 14, NULL, 'Query', NULL, NULL, NULL, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(996, 14, NULL, 'Ticket', NULL, NULL, NULL, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(997, 14, NULL, 'Grievance', NULL, NULL, NULL, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(998, 15, NULL, 'QR Code', NULL, NULL, NULL, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(999, 15, NULL, 'E-sign', NULL, NULL, NULL, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(1000, 15, NULL, 'Third Party Verification', NULL, NULL, NULL, 1, '2024-01-11 15:28:38', 1, '2024-07-30 16:06:59', 0),
	(1001, 16, NULL, 'Inspections', NULL, NULL, NULL, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(1002, 16, NULL, 'Appeal', NULL, NULL, NULL, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(1003, 17, NULL, 'Colour Code', NULL, NULL, NULL, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(1004, 17, NULL, 'Theme', NULL, NULL, NULL, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(1005, 17, NULL, 'Font', NULL, NULL, NULL, 1, '2024-01-11 15:28:38', 1, '2024-01-11 15:28:38', 1),
	(1006, 18, NULL, 'reverted', NULL, NULL, NULL, 1, '2024-07-01 18:32:09', NULL, NULL, 0),
	(1007, 18, NULL, 'forward', NULL, NULL, NULL, 1, '2024-07-01 18:33:05', NULL, NULL, 0),
	(1008, 18, NULL, 'approved', NULL, NULL, NULL, 1, '2024-07-01 18:34:49', 1, '2024-07-01 18:38:24', 0),
	(1009, 18, NULL, 'reject', NULL, NULL, NULL, 1, '2024-07-01 18:35:26', 1, '2024-07-01 18:35:46', 0),
	(1010, 19, NULL, 'Sequential Without Departments', NULL, NULL, NULL, 1, '2024-07-05 10:59:24', NULL, NULL, 1),
	(1011, 19, NULL, 'Random With or Without Departments', NULL, NULL, NULL, 1, '2024-07-05 10:59:47', NULL, NULL, 1),
	(1012, 20, 893, 'East Garo Hills', NULL, '424001', NULL, 1, '2024-07-21 16:24:47', 1, '2025-02-27 12:11:18', 1),
	(1013, 20, 893, 'North Garo Hills', NULL, NULL, NULL, 1, '2024-07-21 16:26:11', 1, '2025-02-27 12:11:18', 1),
	(1014, 21, NULL, 'Private Company', NULL, NULL, NULL, 1, '2024-07-23 11:41:39', NULL, NULL, 1),
	(1015, 21, NULL, 'Public Company', NULL, NULL, NULL, 1, '2024-07-23 11:41:49', NULL, NULL, 1),
	(1016, 22, NULL, '1', NULL, NULL, NULL, 1, '2024-07-23 11:45:35', NULL, NULL, 1),
	(1017, 22, NULL, '2', NULL, NULL, NULL, 1, '2024-07-23 11:45:39', NULL, NULL, 1),
	(1018, 22, NULL, '3', NULL, NULL, NULL, 1, '2024-07-23 11:45:42', NULL, NULL, 1),
	(1019, 22, NULL, '4', NULL, NULL, NULL, 1, '2024-07-23 11:45:46', NULL, NULL, 1),
	(1020, 22, NULL, '5', NULL, NULL, NULL, 1, '2024-07-23 11:45:49', NULL, NULL, 1),
	(1021, 22, NULL, '6', NULL, NULL, NULL, 1, '2024-07-23 11:45:54', NULL, NULL, 1),
	(1022, 22, NULL, '7', NULL, NULL, NULL, 1, '2024-07-23 11:45:57', NULL, NULL, 1),
	(1023, 22, NULL, '8', NULL, NULL, NULL, 1, '2024-07-23 11:46:00', NULL, NULL, 1),
	(1024, 22, NULL, '9', NULL, NULL, NULL, 1, '2024-07-23 11:46:03', NULL, NULL, 1),
	(1025, 22, NULL, '10', NULL, NULL, NULL, 1, '2024-07-23 11:46:10', NULL, NULL, 1),
	(1026, 23, NULL, 'Comman Share', NULL, NULL, NULL, 1, '2024-07-23 11:48:44', NULL, NULL, 1),
	(1027, 23, NULL, 'Preference Share', NULL, NULL, NULL, 1, '2024-07-23 11:48:52', NULL, NULL, 1),
	(1028, 23, NULL, 'Others', NULL, NULL, NULL, 1, '2024-07-23 11:48:59', 6, '2024-07-23 15:42:09', 1),
	(1029, 24, NULL, 'Yes', NULL, NULL, NULL, 1, '2024-07-23 11:52:25', NULL, NULL, 1),
	(1030, 24, NULL, 'No', NULL, NULL, NULL, 1, '2024-07-23 11:52:29', NULL, NULL, 1),
	(1031, 22, NULL, '11', NULL, NULL, NULL, 6, '2024-07-23 15:42:53', NULL, NULL, 1),
	(1032, 22, NULL, '12', NULL, NULL, NULL, 6, '2024-07-23 15:43:06', 6, '2024-07-23 15:43:43', 1),
	(1033, 22, NULL, '13', NULL, NULL, NULL, 6, '2024-07-23 15:44:32', NULL, NULL, 1),
	(1034, 22, NULL, '14', NULL, NULL, NULL, 6, '2024-07-23 15:48:14', NULL, NULL, 1),
	(1035, 22, NULL, '15', NULL, NULL, NULL, 6, '2024-07-23 15:51:22', NULL, NULL, 1),
	(1036, 22, NULL, '16', NULL, NULL, NULL, 6, '2024-07-23 15:51:28', NULL, NULL, 1),
	(1037, 22, NULL, '17', NULL, NULL, NULL, 6, '2024-07-23 15:51:37', 6, '2024-07-23 15:51:48', 1),
	(1038, 22, NULL, '18', NULL, NULL, NULL, 6, '2024-07-23 16:03:33', NULL, NULL, 1),
	(1039, 22, NULL, '19', NULL, NULL, NULL, 6, '2024-07-23 16:03:40', 6, '2024-07-23 16:03:47', 1),
	(1040, 12, NULL, 'Aadhar Vault', NULL, NULL, 5, 1, '2024-07-24 17:31:12', NULL, NULL, 1),
	(1041, 8, NULL, 'DigiLocker', NULL, NULL, NULL, 1, '2024-07-25 11:46:54', 1, '2024-07-30 16:04:24', 0),
	(1042, 25, NULL, 'Provided Free of cost by State /DC/DM', NULL, NULL, NULL, 1, '2024-07-23 11:45:39', NULL, NULL, 1),
	(1043, 25, NULL, 'Orgnisation Own building/donated', NULL, NULL, NULL, 1, '2024-07-23 11:45:42', NULL, NULL, 1),
	(1044, 25, NULL, 'Building taken on rent and rent will be paid by the Orgnisation', NULL, NULL, NULL, 1, '2024-07-23 11:45:42', NULL, NULL, 1),
	(1045, 26, NULL, 'Salary Account', NULL, NULL, NULL, 1, '2024-07-24 17:31:12', NULL, NULL, 1),
	(1046, 26, NULL, 'Fixed Deposit Account', NULL, NULL, NULL, 1, '2024-07-24 17:31:12', NULL, NULL, 1),
	(1047, 26, NULL, 'Current Account', NULL, NULL, NULL, 1, '2024-07-24 17:31:12', NULL, NULL, 1),
	(1048, 26, NULL, 'Saving Account', NULL, NULL, NULL, 1, '2024-07-24 17:31:12', NULL, NULL, 1),
	(1049, 27, NULL, 'Ongoing', NULL, NULL, NULL, 1, '2024-07-24 17:31:12', NULL, NULL, 1),
	(1050, 27, NULL, 'New', NULL, NULL, NULL, 1, '2024-07-24 17:31:12', NULL, NULL, 1),
	(1051, 12, NULL, 'PFMS', NULL, NULL, 3, 1, '2024-07-24 17:31:12', NULL, NULL, 1),
	(1052, 12, NULL, 'DBT', NULL, NULL, 4, 1, '2024-07-24 17:31:12', NULL, NULL, 1),
	(1053, 12, NULL, 'Google Analytics', NULL, NULL, 6, 1, '2024-07-26 11:57:20', 6, '2024-09-17 11:56:13', 1),
	(1054, 15, NULL, 'Digital Signing Process', NULL, NULL, NULL, 6, '2024-09-18 12:21:09', NULL, NULL, 1),
	(1055, 28, NULL, 'Incentive Calculator ', NULL, NULL, NULL, 1, '2024-10-07 18:17:44', NULL, NULL, 1),
	(1056, 28, NULL, 'Know Your Approvals', NULL, NULL, NULL, 1, '2024-10-07 18:23:59', NULL, NULL, 1),
	(1057, 29, NULL, 'New', NULL, NULL, NULL, 6, '2024-10-09 12:39:16', NULL, NULL, 1),
	(1058, 29, NULL, 'Expansion', NULL, NULL, NULL, 6, '2024-10-09 12:39:21', NULL, NULL, 1),
	(1059, 29, NULL, 'Existing', NULL, NULL, NULL, 6, '2024-10-09 12:39:27', NULL, NULL, 1),
	(1060, 30, NULL, 'Shilllong', NULL, NULL, NULL, 2, '2025-02-26 17:10:14', NULL, NULL, 1),
	(1061, 30, NULL, 'Tura', NULL, NULL, NULL, 2, '2025-02-26 17:10:19', NULL, NULL, 1),
	(1062, 31, NULL, 'Manufacturing', NULL, NULL, NULL, 2, '2025-02-27 11:34:38', NULL, NULL, 1),
	(1063, 31, NULL, 'Service', NULL, NULL, NULL, 2, '2025-02-27 11:34:43', NULL, NULL, 1),
	(1064, 32, NULL, 'Industries', NULL, NULL, NULL, 2, '2025-02-27 11:35:16', NULL, NULL, 1),
	(1065, 32, NULL, 'Food Processing', NULL, NULL, NULL, 2, '2025-02-27 11:35:21', NULL, NULL, 1),
	(1066, 33, NULL, 'Supply voltage exceeding 33 KVA', NULL, NULL, NULL, 2, '2025-02-27 11:35:38', NULL, NULL, 1),
	(1067, 33, NULL, 'Connected demand above 100 KW and supply voltage not exceeding 33 KVA', NULL, NULL, NULL, 2, '2025-02-27 11:35:43', NULL, NULL, 1),
	(1068, 33, NULL, ' Connected demand between 51 to 100 KVA', NULL, NULL, NULL, 2, '2025-02-27 11:35:50', NULL, NULL, 1),
	(1069, 33, NULL, 'Connected demand upto 50 KVA', NULL, NULL, NULL, 2, '2025-02-27 11:35:55', NULL, NULL, 1),
	(1070, 20, 893, 'South Garo Hills', NULL, NULL, NULL, 1, '2025-02-27 12:11:13', 1, '2025-02-27 12:11:16', 1),
	(1071, 20, 893, 'West Garo Hills', NULL, NULL, NULL, 1, '2025-02-27 12:11:46', 1, '2025-02-27 12:11:47', 1),
	(1072, 20, 893, 'South West Garo Hills', NULL, NULL, NULL, 1, '2025-02-27 12:12:34', 1, NULL, 1),
	(1073, 20, 893, 'East Khasi Hills', NULL, NULL, NULL, 1, '2025-02-27 12:12:51', 1, '2025-02-27 12:12:53', 1),
	(1074, 20, 893, 'West Khasi Hills', NULL, NULL, NULL, 1, '2025-02-27 12:13:09', 1, '2025-02-27 12:13:10', 1),
	(1075, 20, 893, 'South West Khasi Hills', NULL, NULL, NULL, 1, '2025-02-27 12:13:22', 1, '2025-02-27 12:13:23', 1),
	(1076, 20, 893, 'Ri-Bhoi', NULL, NULL, NULL, 1, '2025-02-27 12:13:43', 1, '2025-02-27 12:13:43', 1),
	(1077, 20, 893, 'East Jaintia Hills', NULL, NULL, NULL, 1, '2025-02-27 12:13:55', 1, '2025-02-27 12:13:55', 1),
	(1078, 20, 893, 'West Jaintia Hills', NULL, NULL, NULL, 1, '2025-02-27 12:14:12', 1, '2025-02-27 12:14:12', 1),
	(1079, 20, 893, 'Eastern West Khasi Hills', NULL, NULL, NULL, 1, '2025-02-27 12:14:26', 1, '2025-02-27 12:14:26', 1),
	(1080, 30, NULL, 'MendiPathar', NULL, NULL, NULL, 1, '2025-02-27 12:21:21', 1, '2025-02-27 12:21:22', 1),
	(1081, 34, NULL, 'Sole Proprietorship', NULL, NULL, NULL, 1, '0000-00-00 00:00:00', 1, NULL, 1),
	(1082, 34, NULL, 'Partnership', NULL, NULL, NULL, 1, '0000-00-00 00:00:00', 1, NULL, 1),
	(1083, 34, NULL, 'Pvt Ltd', NULL, NULL, NULL, 1, '0000-00-00 00:00:00', 1, NULL, 1),
	(1084, 35, NULL, 'IT Services', NULL, NULL, NULL, 1, '0000-00-00 00:00:00', 1, NULL, 1),
	(1085, 35, NULL, 'Manufacturing', NULL, NULL, NULL, 1, '0000-00-00 00:00:00', 1, NULL, 1),
	(1086, 35, NULL, 'Consulting', NULL, NULL, NULL, 1, '0000-00-00 00:00:00', 1, NULL, 1),
	(1087, 35, NULL, 'Trading', NULL, NULL, NULL, 1, '0000-00-00 00:00:00', 1, NULL, 1);
/*!40000 ALTER TABLE `mst_option_value` ENABLE KEYS */;

-- Dumping structure for table westbengal_ramp.pitch
CREATE TABLE IF NOT EXISTS `pitch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `description` text,
  `status` varchar(50) DEFAULT NULL,
  `pitch_file` varchar(500) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table westbengal_ramp.pitch: ~2 rows (approximately)
/*!40000 ALTER TABLE `pitch` DISABLE KEYS */;
INSERT INTO `pitch` (`id`, `user_id`, `company_name`, `description`, `status`, `pitch_file`, `location`, `website`, `created_on`, `updated_on`) VALUES
	(4, 4, 'zenmax', 'Cleaning products', 'approved', '/uploads/pitches/pitch_1745071227.pdf', 'dhule', 'zainweb.in', '2025-04-19 19:30:27', '2025-04-21 12:29:31'),
	(5, 8, 'blue stone', 'trading startup', 'approved', '/uploads/pitches/pitch_1745238115.pdf', 'shimla', '', '2025-04-21 17:51:55', '2025-04-21 17:54:43'),
	(6, 9, 'Ocean Black', 'pipe manufacturing', 'approved', '/uploads/pitches/pitch_1745298430.pdf', 'shilma HP', '', '2025-04-22 10:37:10', '2025-04-22 10:39:42');
/*!40000 ALTER TABLE `pitch` ENABLE KEYS */;

-- Dumping structure for table westbengal_ramp.pitch_log
CREATE TABLE IF NOT EXISTS `pitch_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `user_type` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `log_string` varchar(500) DEFAULT NULL,
  `bo_remark` varchar(500) DEFAULT NULL,
  `uploaded_file` varchar(200) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table westbengal_ramp.pitch_log: ~8 rows (approximately)
/*!40000 ALTER TABLE `pitch_log` DISABLE KEYS */;
INSERT INTO `pitch_log` (`id`, `user_id`, `p_id`, `user_type`, `status`, `log_string`, `bo_remark`, `uploaded_file`, `created_on`) VALUES
	(1, 4, 4, 'FO', 'pending', 'Pitch Deck was submitted', NULL, NULL, '2025-04-19 19:30:27'),
	(2, 7, 4, 'BO', 'forward', 'Form was forwarded to approver', 'FOrward to approver to approve the pitch deck form', NULL, '2025-04-21 12:21:05'),
	(5, 1, 4, 'BO', 'approved', 'Form was approved', 'approved this pitch deck', NULL, '2025-04-21 12:29:31'),
	(6, 8, 5, 'FO', 'pending', 'Pitch Deck was submitted', NULL, NULL, '2025-04-21 17:51:55'),
	(7, 7, 5, 'BO', 'forward', 'Form was forwarded to approver', 'forwar this to approval', NULL, '2025-04-21 17:53:25'),
	(8, 1, 5, 'BO', 'approved', 'Form was approved', 'i am apprived this application', NULL, '2025-04-21 17:54:43'),
	(9, 9, 6, 'FO', 'pending', 'Pitch Deck was submitted', NULL, NULL, '2025-04-22 10:37:10'),
	(10, 7, 6, 'BO', 'forward', 'Form was forwarded to approver', 'forward for approval', NULL, '2025-04-22 10:38:50'),
	(11, 1, 6, 'BO', 'approved', 'Form was approved', 'approve', NULL, '2025-04-22 10:39:42');
/*!40000 ALTER TABLE `pitch_log` ENABLE KEYS */;

-- Dumping structure for table westbengal_ramp.pitch_status
CREATE TABLE IF NOT EXISTS `pitch_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table westbengal_ramp.pitch_status: ~4 rows (approximately)
/*!40000 ALTER TABLE `pitch_status` DISABLE KEYS */;
INSERT INTO `pitch_status` (`id`, `is_active`, `status`) VALUES
	(1, 1, 'Ready To Launch'),
	(2, 1, 'Go To Market State'),
	(3, 1, 'Required Funding'),
	(4, 1, 'Looking For Angel Investment'),
	(5, 1, 'Venture Funding');
/*!40000 ALTER TABLE `pitch_status` ENABLE KEYS */;

-- Dumping structure for table westbengal_ramp.userrole
CREATE TABLE IF NOT EXISTS `userrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_type` varchar(2) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `role_name_label` varchar(255) NOT NULL,
  `short_code` varchar(20) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table westbengal_ramp.userrole: 5 rows
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` (`id`, `role_type`, `role_name`, `role_name_label`, `short_code`, `created_on`, `is_active`) VALUES
	(1, 'BO', 'admin', 'Admin', 'ADMIN', '2025-04-12 21:04:46', 1),
	(2, 'FO', 'msme', 'MSME', 'MSME', '2025-04-17 14:37:28', 1),
	(3, 'FO', 'investor', 'Investor', 'INV', '2025-04-17 14:37:59', 1),
	(4, 'FO', 'startup', 'StartUp', 'START', '2025-04-19 11:48:17', 1),
	(5, 'BO', 'scrutiny_committee', 'Scrutiny Committee', NULL, '2025-04-19 19:21:29', 1);
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;

-- Dumping structure for table westbengal_ramp.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `auth_key` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `user_image` varchar(200) DEFAULT NULL,
  `otp_number` int(11) DEFAULT NULL,
  `otp_expiry` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table westbengal_ramp.users: ~11 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `mobile_no`, `auth_key`, `password_hash`, `password_reset_token`, `status`, `user_image`, `otp_number`, `otp_expiry`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`) VALUES
	(1, 'Admin', 'admin@email.com', '9999999999', 'i9xiiyUPi3cHknzXgFoyi-0WYhOvcL5z', '$2y$13$hY.3LvUGBn0g9s8paoxdCuIsv6YlMGJ4r4LaYyUqjAd6fUDEPnxDC', NULL, 1, NULL, NULL, NULL, '2022-10-21 10:16:08', NULL, '2022-10-21 10:16:08', NULL, NULL),
	(2, 'MSME', 'msme@email.com', '4545454545', NULL, '$2y$13$hY.3LvUGBn0g9s8paoxdCuIsv6YlMGJ4r4LaYyUqjAd6fUDEPnxDC', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 'Investor', 'investor@email.com', '5256325412', NULL, '$2y$13$hY.3LvUGBn0g9s8paoxdCuIsv6YlMGJ4r4LaYyUqjAd6fUDEPnxDC', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 'Start Up', 'startup@email.com', '1236545623', NULL, '$2y$13$hY.3LvUGBn0g9s8paoxdCuIsv6YlMGJ4r4LaYyUqjAd6fUDEPnxDC', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 'Amir', 'amir@email.com', '7878787878', NULL, '$2y$13$C5jJRy6PFXTCyehIYcYU3eI8lnKw7C64q/.gwCF76Ex4dwoADjCDS', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 'Scrutiny Committee', 'sc@email.com', '8541236595', NULL, '$2y$13$C5jJRy6PFXTCyehIYcYU3eI8lnKw7C64q/.gwCF76Ex4dwoADjCDS', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 'sahil', 'test@email.com', '4562365412', NULL, '$2y$13$Ugy2W/x.qtQFT6Ud/bcvO.y0bpW8ulNUjN/nWA1l/b6pz5OW/qk8a', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 'kumar', 'kumar@email.com', '8989898787', NULL, '$2y$13$K0Co5pigFu.c8MZQz32qx.k7V9/r1M5Hd.qfN5Js7BRJBDoWjGmlu', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'Amma', 'zenmax@email.com', '9271439613', NULL, '$2y$13$jmT3mhhC.ELVhsAY8i1ObudkhOiPkrB/ZGwYPU0gWz.PT5dlSSJCW', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'Pranjal', 'p@email.com', '7878787878', NULL, '$2y$13$A76LH2Sr110Na/D23PLdD.Qui9.u5Ft29IH.tCCOWdD7gwXM3SBbO', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 'Sunil', 'in@email.com', '8787878787', NULL, '$2y$13$YPZ68rSV3TqIhEIEXye.EOpDfMnMSTZbwdoShpWhK5rLyTCe0qjH.', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table westbengal_ramp.user_profile
CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `full_address` varchar(500) DEFAULT NULL,
  `is_default` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk-user_id` (`user_id`),
  CONSTRAINT `fk-user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table westbengal_ramp.user_profile: ~11 rows (approximately)
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` (`id`, `user_id`, `role_id`, `dept_id`, `state_id`, `district_id`, `gender`, `dob`, `full_address`, `is_default`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`) VALUES
	(1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-10-21 10:16:08', NULL, '2022-10-21 10:30:11', 1, NULL),
	(2, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 8, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(9, 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 11, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
