-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2024 at 05:04 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nhc`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(3, 'admins'),
(1, 'client'),
(2, 'officer');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add nationality', 7, 'add_nationality'),
(26, 'Can change nationality', 7, 'change_nationality'),
(27, 'Can delete nationality', 7, 'delete_nationality'),
(28, 'Can view nationality', 7, 'view_nationality'),
(29, 'Can add applicant', 8, 'add_applicant'),
(30, 'Can change applicant', 8, 'change_applicant'),
(31, 'Can delete applicant', 8, 'delete_applicant'),
(32, 'Can view applicant', 8, 'view_applicant'),
(33, 'Can add contact', 9, 'add_contact'),
(34, 'Can change contact', 9, 'change_contact'),
(35, 'Can delete contact', 9, 'delete_contact'),
(36, 'Can view contact', 9, 'view_contact'),
(37, 'Can add employment', 10, 'add_employment'),
(38, 'Can change employment', 10, 'change_employment'),
(39, 'Can delete employment', 10, 'delete_employment'),
(40, 'Can view employment', 10, 'view_employment'),
(41, 'Can add financial information', 11, 'add_financialinformation'),
(42, 'Can change financial information', 11, 'change_financialinformation'),
(43, 'Can delete financial information', 11, 'delete_financialinformation'),
(44, 'Can view financial information', 11, 'view_financialinformation'),
(45, 'Can add referee', 12, 'add_referee'),
(46, 'Can change referee', 12, 'change_referee'),
(47, 'Can delete referee', 12, 'delete_referee'),
(48, 'Can view referee', 12, 'view_referee'),
(49, 'Can add project', 13, 'add_project'),
(50, 'Can change project', 13, 'change_project'),
(51, 'Can delete project', 13, 'delete_project'),
(52, 'Can view project', 13, 'view_project'),
(53, 'Can add house', 14, 'add_house'),
(54, 'Can change house', 14, 'change_house'),
(55, 'Can delete house', 14, 'delete_house'),
(56, 'Can view house', 14, 'view_house'),
(57, 'Can add declaration', 15, 'add_declaration'),
(58, 'Can change declaration', 15, 'change_declaration'),
(59, 'Can delete declaration', 15, 'delete_declaration'),
(60, 'Can view declaration', 15, 'view_declaration'),
(61, 'Can add dependant', 16, 'add_dependant'),
(62, 'Can change dependant', 16, 'change_dependant'),
(63, 'Can delete dependant', 16, 'delete_dependant'),
(64, 'Can view dependant', 16, 'view_dependant'),
(65, 'Can add payment', 17, 'add_payment'),
(66, 'Can change payment', 17, 'change_payment'),
(67, 'Can delete payment', 17, 'delete_payment'),
(68, 'Can view payment', 17, 'view_payment');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$raAoIVOl3LETwsjHRcgBqn$9dgcK8i4eVHRABFh4W1LFA7eXi0CAPoNPUIrdp3iJhs=', '2024-05-26 11:50:30.663697', 1, 'admin', '', '', '', 1, 1, '2024-04-10 07:29:07.376501'),
(2, 'pbkdf2_sha256$720000$THDHuvjU2OSz7BOdyKGtYx$Muo+BAAzfndeuBr51lmYMDviU7U+wohSYlxS8vQHaOI=', '2024-05-26 12:46:29.571473', 0, 'client', '', '', 'c@gmail.com', 0, 1, '2024-04-10 07:30:18.658554'),
(3, 'pbkdf2_sha256$720000$aIZZARV9FuwaAjhyvwKUtK$YzTlGCU2o8KOKd6IZbBFEYYCoQ0FQNbC9/UrIoas4PE=', '2024-05-26 16:34:32.849250', 0, 'officer', '', '', '', 0, 1, '2024-04-10 07:49:20.000000'),
(4, 'pbkdf2_sha256$720000$dhJQwIWftL2qzk7dRVPTaE$Bh8J4BtJCnTViPXumB6vi/WqqOc9wlUEGDfNcVgs0JE=', '2024-05-26 16:33:59.447541', 0, 'client1', '', '', 'client@gmail.com', 0, 1, '2024-05-14 07:14:30.108671'),
(6, 'pbkdf2_sha256$720000$cou18IzQvsJSQRleLBOyQC$Kn7yYI8iblEqaPHtwNKYmm/uWQSrIndzf9QPsCZfWUg=', '2024-05-26 12:54:32.693024', 0, 'admins', '', '', '', 0, 1, '2024-05-26 11:22:31.000000'),
(7, 'pbkdf2_sha256$720000$YuxTgUrmhUJJVLONO3wbQe$fE/Mvj0m7v8okXa0BAmsUjF++YCyfJstNxB+4Va7hHI=', '2024-05-26 11:43:38.151067', 0, 'client2', '', '', '', 0, 1, '2024-05-26 11:40:27.306870');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 1),
(5, 6, 3),
(6, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-04-10 07:29:29.092273', '1', 'client', 1, '[{\"added\": {}}]', 3, 1),
(2, '2024-04-10 07:29:38.754753', '2', 'officer', 1, '[{\"added\": {}}]', 3, 1),
(3, '2024-04-10 07:33:52.628136', '1', 'Kisenvule', 1, '[{\"added\": {}}]', 13, 1),
(4, '2024-04-10 07:33:54.891300', '2', 'Kiluvya', 1, '[{\"added\": {}}]', 13, 1),
(5, '2024-04-10 07:33:57.176761', '3', 'Masaki', 1, '[{\"added\": {}}]', 13, 1),
(6, '2024-04-10 07:34:18.951024', '1', 'Kenya', 1, '[{\"added\": {}}]', 7, 1),
(7, '2024-04-10 07:34:20.785766', '2', 'Uganda', 1, '[{\"added\": {}}]', 7, 1),
(8, '2024-04-10 07:34:26.622401', '3', 'Tanzania', 1, '[{\"added\": {}}]', 7, 1),
(9, '2024-04-10 07:34:29.276528', '4', 'Somalia', 1, '[{\"added\": {}}]', 7, 1),
(10, '2024-04-10 07:34:34.304160', '5', 'Uganda', 1, '[{\"added\": {}}]', 7, 1),
(11, '2024-04-10 07:34:42.124945', '2', 'Uganda', 3, '', 7, 1),
(12, '2024-04-10 07:49:21.481320', '3', 'officer', 1, '[{\"added\": {}}]', 4, 1),
(13, '2024-04-10 07:49:27.829753', '3', 'officer', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(14, '2024-05-12 19:38:01.669582', '1', 'credit_card', 1, '[{\"added\": {}}]', 17, 1),
(15, '2024-05-12 19:38:09.317496', '1', 'credit_card', 2, '[]', 17, 1),
(16, '2024-05-12 19:51:14.027179', '1', 'credit_card', 3, '', 17, 1),
(17, '2024-05-14 07:29:07.766081', '2', 'Declaration object (2)', 1, '[{\"added\": {}}]', 15, 1),
(18, '2024-05-14 07:45:06.482234', '4', 'bank_transfer', 2, '[{\"changed\": {\"fields\": [\"Amount\"]}}]', 17, 1),
(19, '2024-05-14 07:55:19.584420', '5', 'credit_card', 3, '', 17, 1),
(20, '2024-05-14 07:58:06.787313', '6', 'credit_card', 3, '', 17, 1),
(21, '2024-05-26 11:21:49.035000', '3', 'admins', 1, '[{\"added\": {}}]', 3, 1),
(22, '2024-05-26 11:22:32.549128', '6', 'admins', 1, '[{\"added\": {}}]', 4, 1),
(23, '2024-05-26 11:22:39.901144', '6', 'admins', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'mainapp', 'applicant'),
(9, 'mainapp', 'contact'),
(15, 'mainapp', 'declaration'),
(16, 'mainapp', 'dependant'),
(10, 'mainapp', 'employment'),
(11, 'mainapp', 'financialinformation'),
(14, 'mainapp', 'house'),
(7, 'mainapp', 'nationality'),
(17, 'mainapp', 'payment'),
(13, 'mainapp', 'project'),
(12, 'mainapp', 'referee'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-04-10 07:27:29.142707'),
(2, 'auth', '0001_initial', '2024-04-10 07:27:36.197215'),
(3, 'admin', '0001_initial', '2024-04-10 07:27:37.745312'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-04-10 07:27:37.776695'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-04-10 07:27:37.823511'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-04-10 07:27:38.323200'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-04-10 07:27:39.043004'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-04-10 07:27:39.167729'),
(9, 'auth', '0004_alter_user_username_opts', '2024-04-10 07:27:39.214684'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-04-10 07:27:39.633364'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-04-10 07:27:39.648990'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-04-10 07:27:39.711307'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-04-10 07:27:40.340861'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-04-10 07:27:40.903065'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-04-10 07:27:41.169787'),
(16, 'auth', '0011_update_proxy_permissions', '2024-04-10 07:27:41.232313'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-04-10 07:27:41.326115'),
(18, 'mainapp', '0001_initial', '2024-04-10 07:27:42.872999'),
(19, 'mainapp', '0002_alter_applicant_nida_birth', '2024-04-10 07:27:42.904375'),
(20, 'mainapp', '0003_applicant_status', '2024-04-10 07:27:43.060702'),
(21, 'mainapp', '0004_alter_applicant_nationality_alter_applicant_status', '2024-04-10 07:27:45.527936'),
(22, 'mainapp', '0005_contact_alter_applicant_status', '2024-04-10 07:27:46.156619'),
(23, 'mainapp', '0006_alter_applicant_status_and_more', '2024-04-10 07:27:46.465461'),
(24, 'mainapp', '0007_employment_alter_applicant_status', '2024-04-10 07:27:46.700632'),
(25, 'mainapp', '0008_rename_business_employment_employer_and_more', '2024-04-10 07:27:47.131279'),
(26, 'mainapp', '0009_financialinformation_alter_applicant_status', '2024-04-10 07:27:47.331314'),
(27, 'mainapp', '0010_referee_alter_applicant_status', '2024-04-10 07:27:47.545332'),
(28, 'mainapp', '0011_project_alter_applicant_status', '2024-04-10 07:27:47.767851'),
(29, 'mainapp', '0012_alter_project_project_code', '2024-04-10 07:27:48.375981'),
(30, 'mainapp', '0013_alter_applicant_status_house', '2024-04-10 07:27:49.376560'),
(31, 'mainapp', '0014_alter_applicant_status', '2024-04-10 07:27:49.502214'),
(32, 'mainapp', '0015_declaration_alter_applicant_status', '2024-04-10 07:27:49.733728'),
(33, 'mainapp', '0016_dependant_alter_applicant_status', '2024-04-10 07:27:49.957329'),
(34, 'mainapp', '0017_rename_date_ofbirth_dependant_date_of_birth_and_more', '2024-04-10 07:27:50.035661'),
(35, 'mainapp', '0018_applicant_user_contact_user_dependant_user_and_more', '2024-04-10 07:27:56.244673'),
(36, 'mainapp', '0019_declaration_user_alter_applicant_status', '2024-04-10 07:27:57.090725'),
(37, 'mainapp', '0020_alter_applicant_status', '2024-04-10 07:27:57.148716'),
(38, 'sessions', '0001_initial', '2024-04-10 07:27:57.806609'),
(39, 'mainapp', '0021_payment_alter_applicant_status', '2024-05-12 19:35:57.920903'),
(40, 'mainapp', '0022_payment_user_alter_applicant_status', '2024-05-12 19:50:17.528641'),
(41, 'mainapp', '0023_alter_applicant_status', '2024-05-14 06:24:20.469317'),
(42, 'mainapp', '0024_alter_applicant_status', '2024-05-14 06:25:01.242964');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('bx1a8rknveg8stgxdh1pyl7gg46gznz0', '.eJxVjMsOgjAUBf-la9NQCreNS_d-A7lPQU1JKKyM_64kLHR7Zua83IDbOg5b1WWYxJ1d606_GyE_tOxA7lhus-e5rMtEflf8Qau_zqLPy-H-HYxYx2-NAVCAU5NSjkgYg5ha3xlSD9SiWGo4BIgWwJo-qnbAOZuBRGUi9_4ABO85GQ:1rzKPa:qcyfULT8v3rhZ-PfAPjQ8K_BHk3TIoPWY8JfxBiZksQ', '2024-05-07 17:58:34.799679'),
('hsb047l2tpq0y3dl9jffyxag597o7r0v', '.eJxVjMsOwiAQRf-FtSEMw0Dj0r3fQHgMUjWQlHZl_Hdt0oVu7znnvoQP21r9NnjxcxZnQeL0u8WQHtx2kO-h3bpMva3LHOWuyIMOee2Zn5fD_TuoYdRvzQWLhlDYuRBVVASUgVwsOWlKGi1NeQKLpCwYiggJtHNsEhsiRBTvD-qJNzE:1s6mrN:L7m7lpi9SbQRJNsuXdATXfAj1n2cPAaVUL9SoBrjidk', '2024-05-28 07:46:05.274373'),
('kyoihcmwltvpaax1egmnla7j0y9xq1px', '.eJxVjMEOwiAQRP-FsyGwbEvr0bvf0CzsYqsGktKejP-uJD3oaZJ5b-alJtq3edqrrNPC6qycOv12geJDcgN8p3wrOpa8rUvQTdEHrfpaWJ6Xw_07mKnObQ0CwDIgYgjM3kmPVvyYxs4CfiN4hGgNuYE4JugwGTEd9QijUEjq_QHrSTg1:1s6nGM:AsDKEv8E5Xqa1jUO2JU2rRrFNLpmX0ZyytD3Q5jgHlU', '2024-05-28 08:11:54.228320');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_applicant`
--

CREATE TABLE `mainapp_applicant` (
  `id` bigint(20) NOT NULL,
  `surname` varchar(200) DEFAULT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `other_name` varchar(200) NOT NULL,
  `date_of_birth` date NOT NULL,
  `passport_size` varchar(100) NOT NULL,
  `nida_birth` varchar(100) NOT NULL,
  `marital_status` varchar(50) NOT NULL,
  `nationality_id` bigint(20) DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_applicant`
--

INSERT INTO `mainapp_applicant` (`id`, `surname`, `first_name`, `other_name`, `date_of_birth`, `passport_size`, `nida_birth`, `marital_status`, `nationality_id`, `status`, `user_id`) VALUES
(2, 'jesie', 'Raj', 'J', '2024-05-14', 'pictures/ph_passport.jpg', 'pictures/AGCCI_Binti_Dijitali_Creative_Challange.pdf', 'Single', 3, 'Maombi yako yamekubaliwa,fika ofisini kesho saa mbili asubuhi kwa maelezo zaidi.', 2),
(3, 'client1', 'm2', 'c', '1991-02-14', 'pictures/Sam-Sundar-Singh-E.JPG.jpg', 'pictures/AGCCI_Binti_Dijitali_Creative_Challange_mkBdckP.pdf', 'Married', 3, 'pending', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_contact`
--

CREATE TABLE `mainapp_contact` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `home_phone_number` varchar(13) NOT NULL,
  `office_phone_number` varchar(13) NOT NULL,
  `your_phone_number` varchar(13) NOT NULL,
  `office_email` varchar(255) DEFAULT NULL,
  `your_email` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_contact`
--

INSERT INTO `mainapp_contact` (`id`, `address`, `home_phone_number`, `office_phone_number`, `your_phone_number`, `office_email`, `your_email`, `user_id`) VALUES
(1, 'P.O.Box 8788', '+255062345666', '+255062345666', '+255062345666', 'dg@gmail.com', 'fdd@gmail.com', 2),
(2, 'P.O.Box 8788', '+255062345666', '+255062345666', '+255062345666', 'dg@gmail.com', 'fdd@gmail.com', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_declaration`
--

CREATE TABLE `mainapp_declaration` (
  `id` bigint(20) NOT NULL,
  `signature` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_declaration`
--

INSERT INTO `mainapp_declaration` (`id`, `signature`, `user_id`) VALUES
(1, 1, 2),
(2, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_dependant`
--

CREATE TABLE `mainapp_dependant` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `relationship_to_applicant` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `date_of_birth` date NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_dependant`
--

INSERT INTO `mainapp_dependant` (`id`, `full_name`, `relationship_to_applicant`, `gender`, `date_of_birth`, `user_id`) VALUES
(1, 'charles', 'auncle', 'male', '2024-05-14', 2),
(2, 'charles', 'auncle', 'male', '1985-02-14', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_employment`
--

CREATE TABLE `mainapp_employment` (
  `id` bigint(20) NOT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `employer` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `physical_address` varchar(255) NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `business_duration` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_employment`
--

INSERT INTO `mainapp_employment` (`id`, `occupation`, `employer`, `address`, `physical_address`, `phone_number`, `business_duration`, `user_id`) VALUES
(1, 'mkulima', 'self-employed', 'P.O.Box 8788', 'Kiluvya', '+255623425558', '20 years', 2),
(2, 'Programmer', 'self-employed', 'P.O.Box 8788', 'Kiluvya', '+255623425558', '10 years', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_financialinformation`
--

CREATE TABLE `mainapp_financialinformation` (
  `id` bigint(20) NOT NULL,
  `income_per_month` decimal(10,2) NOT NULL,
  `income_per_annum` decimal(12,2) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `house_allowance` decimal(10,2) NOT NULL,
  `spouse_income` decimal(10,2) NOT NULL,
  `any_other_allowance` decimal(10,2) NOT NULL,
  `total_income` decimal(12,2) NOT NULL,
  `have_any_loan` tinyint(1) NOT NULL,
  `amount_of_loan` decimal(10,2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_financialinformation`
--

INSERT INTO `mainapp_financialinformation` (`id`, `income_per_month`, `income_per_annum`, `salary`, `house_allowance`, `spouse_income`, `any_other_allowance`, `total_income`, `have_any_loan`, `amount_of_loan`, `user_id`) VALUES
(1, '600000.00', '5000000.00', '0.00', '0.00', '0.00', '0.00', '1100000.00', 0, NULL, 2),
(2, '300000.00', '200000.00', '7000.00', '7000000.00', '3000000.00', '9000000.00', '70000000.00', 1, '60000.00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_house`
--

CREATE TABLE `mainapp_house` (
  `id` bigint(20) NOT NULL,
  `house_location` varchar(200) NOT NULL,
  `house_type` varchar(200) NOT NULL,
  `number_of_rooms` int(11) NOT NULL,
  `house_price` decimal(10,2) NOT NULL,
  `mode_of_payment` varchar(200) NOT NULL,
  `project_name_id` bigint(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_house`
--

INSERT INTO `mainapp_house` (`id`, `house_location`, `house_type`, `number_of_rooms`, `house_price`, `mode_of_payment`, `project_name_id`, `user_id`) VALUES
(1, 'Kiluvya', 'ya kawaida', 5, '50000000.00', 'Bank', 2, 2),
(2, 'Kiluvya', 'ghorofa', 20, '300000.00', 'Bank', 3, 4),
(4, 'Kibaha', 'ya kawaida', 3, '50000000.00', 'Bank', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_nationality`
--

CREATE TABLE `mainapp_nationality` (
  `id` bigint(20) NOT NULL,
  `country_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_nationality`
--

INSERT INTO `mainapp_nationality` (`id`, `country_name`) VALUES
(1, 'Kenya'),
(3, 'Tanzania'),
(4, 'Somalia'),
(5, 'Uganda');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_payment`
--

CREATE TABLE `mainapp_payment` (
  `id` bigint(20) NOT NULL,
  `payment_method` varchar(200) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_payment`
--

INSERT INTO `mainapp_payment` (`id`, `payment_method`, `amount`, `user_id`) VALUES
(2, 'credit_card', '40000.00', 1),
(3, 'credit_card', '400000.00', 2),
(4, 'bank_transfer', '2000.00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_project`
--

CREATE TABLE `mainapp_project` (
  `id` bigint(20) NOT NULL,
  `project_name` varchar(100) NOT NULL,
  `project_code` varchar(100) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_project`
--

INSERT INTO `mainapp_project` (`id`, `project_name`, `project_code`, `date`) VALUES
(1, 'Kisenvule', 'NHC-2024-Kisenvule-81', '2024-04-10'),
(2, 'Kiluvya', 'NHC-2024-Kiluvya-34', '2024-04-10'),
(3, 'Masaki', 'NHC-2024-Masaki-20', '2024-04-10'),
(4, 'KibahaProjects', 'NHC-2024-KibahaProject-62', '2024-05-26');

-- --------------------------------------------------------

--
-- Table structure for table `mainapp_referee`
--

CREATE TABLE `mainapp_referee` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `position` varchar(200) NOT NULL,
  `address` varchar(50) NOT NULL,
  `mobile` varchar(13) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mainapp_referee`
--

INSERT INTO `mainapp_referee` (`id`, `name`, `position`, `address`, `mobile`, `email`, `user_id`) VALUES
(1, 'admins', 'S/Developer', 'P.O.Box 8788', '+255074803477', 'user1@gmail.com', 2),
(2, 'referee1', 'Teacher', 'P.O.Box 8788', '+255074803477', 'user1@gmail.com', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `mainapp_applicant`
--
ALTER TABLE `mainapp_applicant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_applicant_nationality_id_0b5aecc9_fk_mainapp_n` (`nationality_id`),
  ADD KEY `mainapp_applicant_user_id_ec01d447_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `mainapp_contact`
--
ALTER TABLE `mainapp_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_contact_user_id_2988bc83_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `mainapp_declaration`
--
ALTER TABLE `mainapp_declaration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_declaration_user_id_6d9c9579_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `mainapp_dependant`
--
ALTER TABLE `mainapp_dependant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_dependant_user_id_cf50d0d7_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `mainapp_employment`
--
ALTER TABLE `mainapp_employment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_employment_user_id_45626027_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `mainapp_financialinformation`
--
ALTER TABLE `mainapp_financialinformation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_financialinformation_user_id_fc1bdb4a_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `mainapp_house`
--
ALTER TABLE `mainapp_house`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_house_project_name_id_da9e82b7_fk_mainapp_project_id` (`project_name_id`),
  ADD KEY `mainapp_house_user_id_b2963fb9_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `mainapp_nationality`
--
ALTER TABLE `mainapp_nationality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mainapp_payment`
--
ALTER TABLE `mainapp_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_payment_user_id_c08d347b_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `mainapp_project`
--
ALTER TABLE `mainapp_project`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_code` (`project_code`);

--
-- Indexes for table `mainapp_referee`
--
ALTER TABLE `mainapp_referee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mainapp_referee_user_id_963c6ba0_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `mainapp_applicant`
--
ALTER TABLE `mainapp_applicant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mainapp_contact`
--
ALTER TABLE `mainapp_contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mainapp_declaration`
--
ALTER TABLE `mainapp_declaration`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mainapp_dependant`
--
ALTER TABLE `mainapp_dependant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mainapp_employment`
--
ALTER TABLE `mainapp_employment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mainapp_financialinformation`
--
ALTER TABLE `mainapp_financialinformation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mainapp_house`
--
ALTER TABLE `mainapp_house`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mainapp_nationality`
--
ALTER TABLE `mainapp_nationality`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mainapp_payment`
--
ALTER TABLE `mainapp_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mainapp_project`
--
ALTER TABLE `mainapp_project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mainapp_referee`
--
ALTER TABLE `mainapp_referee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_applicant`
--
ALTER TABLE `mainapp_applicant`
  ADD CONSTRAINT `mainapp_applicant_nationality_id_0b5aecc9_fk_mainapp_n` FOREIGN KEY (`nationality_id`) REFERENCES `mainapp_nationality` (`id`),
  ADD CONSTRAINT `mainapp_applicant_user_id_ec01d447_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_contact`
--
ALTER TABLE `mainapp_contact`
  ADD CONSTRAINT `mainapp_contact_user_id_2988bc83_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_declaration`
--
ALTER TABLE `mainapp_declaration`
  ADD CONSTRAINT `mainapp_declaration_user_id_6d9c9579_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_dependant`
--
ALTER TABLE `mainapp_dependant`
  ADD CONSTRAINT `mainapp_dependant_user_id_cf50d0d7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_employment`
--
ALTER TABLE `mainapp_employment`
  ADD CONSTRAINT `mainapp_employment_user_id_45626027_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_financialinformation`
--
ALTER TABLE `mainapp_financialinformation`
  ADD CONSTRAINT `mainapp_financialinformation_user_id_fc1bdb4a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_house`
--
ALTER TABLE `mainapp_house`
  ADD CONSTRAINT `mainapp_house_project_name_id_da9e82b7_fk_mainapp_project_id` FOREIGN KEY (`project_name_id`) REFERENCES `mainapp_project` (`id`),
  ADD CONSTRAINT `mainapp_house_user_id_b2963fb9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_payment`
--
ALTER TABLE `mainapp_payment`
  ADD CONSTRAINT `mainapp_payment_user_id_c08d347b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mainapp_referee`
--
ALTER TABLE `mainapp_referee`
  ADD CONSTRAINT `mainapp_referee_user_id_963c6ba0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
