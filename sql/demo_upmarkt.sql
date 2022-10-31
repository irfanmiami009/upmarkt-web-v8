-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 30, 2022 at 07:44 AM
-- Server version: 10.3.28-MariaDB
-- PHP Version: 7.4.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo_upmarkt`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Upmarkt', '09207361321', 1, 'def.png', 'admin@upmarkt.com', NULL, '$2y$10$DkQqn0YTAaQwmT7CRJ88NuUT5KuNJOya885kDWZN5hLGBq./ofu66', 'GDneSAKy1Mew0E8d9KXln8bqC5c4bCizOq6Fmd1EfXlFDm78IQzGOWJ62fVZ', '2021-11-20 15:18:05', '2022-08-02 18:26:17', 1),
(2, 'Keerthy Sundeep', '9809579888', 7, '2022-05-05-62738d484b043.png', 'keerthytkannan@gmail.com', NULL, '$2y$10$impJ3RhTeTBOM67pgwi0gunsC7Mru035EtYeqCbYyhUtRlAHI4iGm', NULL, '2022-05-05 08:39:36', '2022-05-05 08:39:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_access` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL),
(7, 'Operation Head', '[\"order_management\",\"product_management\"]', 1, '2022-05-05 08:33:35', '2022-05-05 08:36:23'),
(8, 'Marketing Manager', '[\"marketing_section\"]', 1, '2022-05-05 08:33:57', '2022-05-05 08:35:33');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `inhouse_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_earned`, `delivery_charge_earned`, `pending_amount`, `total_tax_collected`) VALUES
(3, 1, 0, 0, '2022-08-21 07:21:37', '2022-08-21 07:21:37', 0.00, 0.00, 6.72, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`) VALUES
(9, '2022-07-31-62e64fa34fc3d.png', 'Main Banner', 0, '2022-07-31 09:47:15', '2022-10-29 15:38:00', 'https://demo.upmarkt.in/products?id=174&data_from=category&page=1', 'product', 4917),
(10, '2022-07-31-62e6514e7a94c.png', 'Main Banner', 1, '2022-07-31 09:54:22', '2022-10-29 14:30:20', 'https://demo.upmarkt.in/products?id=175&data_from=category&page=1', 'product', 4915),
(11, '2022-10-29-635d4b4e45dc7.png', 'Main Banner', 1, '2022-08-09 08:34:52', '2022-10-29 15:48:50', 'https://demo.upmarkt.in/products?id=163&data_from=category&page=1', 'product', 4916),
(12, '2022-10-29-635d4989eedb7.png', 'Main Banner', 1, '2022-10-26 03:28:23', '2022-10-29 15:41:39', 'https://demo.upmarkt.in/products?id=160&data_from=category&page=1', 'product', 4918),
(13, '2022-10-29-635d3912809ef.png', 'Main Banner', 1, '2022-10-29 14:30:42', '2022-10-29 14:30:47', 'https://demo.upmarkt.in/products?id=163&data_from=category&page=1', 'product', 4919),
(14, '2022-10-29-635d48b977b43.png', 'Main Banner', 0, '2022-10-29 15:37:29', '2022-10-29 15:40:43', 'https://demo.upmarkt.in/products?id=160&data_from=category&page=1', 'product', 4920);

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` int(10) UNSIGNED DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bizlog_orders`
--

CREATE TABLE `bizlog_orders` (
  `id` bigint(20) NOT NULL,
  `order_id` int(11) NOT NULL,
  `ticket_number` varchar(255) NOT NULL,
  `bizlog_track_status` varchar(255) NOT NULL,
  `bizlog_track_remark` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bizlog_orders`
--

INSERT INTO `bizlog_orders` (`id`, `order_id`, `ticket_number`, `bizlog_track_status`, `bizlog_track_remark`, `created_at`, `updated_at`) VALUES
(15, 10, 'BST-CAS-102-63B9-57393244', 'TICKET_CREATED', 'Ticket is Created', NULL, NULL),
(16, 100005, 'BST-CAS-102-63B9-57393244', 'Order placed', 'Out for delivery', NULL, 2022);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`, `url`) VALUES
(132, 'Furnicom', '2022-07-31-62e652dddd3dd.png', 1, '2022-07-31 10:01:01', '2022-07-31 10:01:01', NULL),
(133, 'FURNITURE', '2022-07-31-62e652fae29e2.png', 1, '2022-07-31 10:01:30', '2022-07-31 10:01:30', NULL),
(134, 'Globe', '2022-07-31-62e6531e6e139.png', 1, '2022-07-31 10:02:06', '2022-07-31 10:02:06', NULL),
(135, 'Furniture2', '2022-07-31-62e6534d09ea4.png', 1, '2022-07-31 10:02:53', '2022-07-31 10:02:53', NULL),
(136, 'Furniture3', '2022-07-31-62e6536a61a40.png', 1, '2022-07-31 10:03:22', '2022-07-31 10:03:22', NULL),
(137, 'Furnicom2', '2022-07-31-62e6537ea733e.png', 1, '2022-07-31 10:03:42', '2022-07-31 10:03:42', NULL),
(138, 'CASALLURA', '2022-08-28-630b7fa7aaf0a.png', 1, '2022-08-06 09:01:24', '2022-08-28 14:45:59', NULL),
(139, 'Final Brand', '2022-09-03-6312d4e59ec7b.png', 1, '2022-09-03 04:15:33', '2022-09-03 04:26:55', 'https://api.bokehmall.com/api/test'),
(140, 'Upmarkt', '2022-10-25-6357f29109500.png', 1, '2022-10-25 14:28:33', '2022-10-25 14:28:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '3', '2020-10-11 07:43:44', '2021-11-22 07:29:54'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"code\":\"en\",\"status\":1}]', '2020-10-11 07:53:02', '2021-06-10 21:16:25'),
(3, 'mail_config', '{\"status\":0,\"name\":\"gmail\",\"host\":\"smtp.gmail.com\",\"driver\":\"SMTP\",\"port\":\"465\",\"username\":\"bigoppangadi26@gmail.com\",\"email_id\":\"bigoppangadi26@gmail.com\",\"encryption\":\"TLS\",\"password\":\"Angadi98@\"}', '2020-10-12 10:29:18', '2021-12-05 13:55:43'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 21:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"store_id\":null,\"store_password\":null}', '2020-11-09 08:36:51', '2021-07-06 12:29:46'),
(7, 'paypal', '{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}', '2020-11-09 08:51:39', '2021-07-06 12:29:57'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(9, 'paytm', '{\"status\":\"0\",\"paytm_merchant_key\":null,\"paytm_merchant_mid\":null,\"paytm_merchant_website\":\"dsfbsdf\",\"paytm_refund_url\":null}', '2020-11-09 09:19:08', '2022-08-21 06:38:31'),
(10, 'company_phone', '123456789', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'Upmarkt', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2022-08-01-62e78d509f796.png', NULL, '2022-08-01 08:22:40'),
(13, 'company_mobile_logo', '2021-12-01-61a70ec03ef07.png', NULL, '2021-12-01 05:57:20'),
(14, 'terms_condition', '<p>terms and conditions</p>', NULL, '2021-06-11 01:51:36'),
(15, 'about_us', '<p>this is about us page. hello and hi from about page description..</p>', NULL, '2021-06-11 01:42:53'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'info@upmarkt.com', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#000000\",\"secondary\":\"#f00000\"}', '2020-10-11 13:53:02', '2022-10-22 07:08:13'),
(19, 'company_footer_logo', '2021-02-20-6030c8a02a5f9.png', NULL, '2021-02-20 14:30:24'),
(20, 'company_copyright_text', 'CopyRight upmarkt@2021', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}', NULL, '2020-12-08 12:54:53'),
(22, 'download_app_google_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store\\/apps\\/details?id=com.bigoppangadi.ecommerce\"}', NULL, '2021-12-04 08:24:01'),
(23, 'company_fav_icon', '2021-03-02-603df1634614f.png', '2020-10-11 13:53:02', '2021-03-02 14:03:48'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'Put your firebase server key here.', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"order pen message\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"Order con Message\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"Order pro Message\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"Order ouut Message\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"Order del Message\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"1\",\"razor_key\":\"rzp_live_w7zywK20loKxIW\",\"razor_secret\":\"YvVrRHJ0W5BcAuAL4ndWbrc1\"}', NULL, '2022-08-21 07:21:13'),
(33, 'sales_commission', '0', NULL, '2021-06-11 18:13:13'),
(34, 'seller_registration', '1', NULL, '2021-06-04 21:02:48'),
(35, 'pnc_language', '[\"en\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"Order hh Message\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":null,\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<p>UPMARKT takes privacy protection very strongly and we set the highest standards in this regard. We value the trust you place in us and ensure the privacy protection of all its users. Please read this document regarding our privacy policy.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>When And What Information Does UPMARKT Collect?<br />\r\nWe collect basic information required to service your requests, including your name, mailing address, email and phone number. This information is gathered when you purchase products/gift certificates, or sign up for email notifications. Your card information is requested only when you place an order and submit via the highest level of encryption to make sure the greatest amount of safety and security.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Why Do We Collect This Information?<br />\r\nThe primary reason we gather information is for order processing, shipping and customer service. For example, we may contact you to provide an update on your purchase, information regarding the shipping status or to clarify questions related to your Purchase. Also, to provide customers a customized shopping experience/to notify them on updates, new activities, latest contents available on the website, special offers, schemes, other products/services. Along with that use this information to improve our products, services, website content and navigation.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>With whom your information will be shared:<br />\r\nUPMARKT will not use your personal information for any purpose other than to complete a transaction with you. UPMARKT does not rent, sell or share your personal information and will not disclose any of your personally identifiable information to third parties. In cases where it has your permission to provide products or services you&#39;ve requested and such information is necessary to provide these products or services the information may be shared with UPMARKT in-house team.</p>\r\n\r\n<p>We keep data of your previous transactions and orders including product, price, date of purchase, payment and transaction history etc.</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2022-10-26 07:01:41'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 12:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 12:30:23'),
(48, 'currency_model', 'single_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"1008738672029-b5he4kpjrf15r6m2263mt6b3duvbl2m0.apps.googleusercontent.com\",\"client_secret\":\"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\",\"status\":\"1\"},{\"login_medium\":\"facebook\",\"client_id\":\"638267797680873\",\"client_secret\":\"81ed01db1ebaa55088a46afd29af924c\",\"status\":\"1\"}]', NULL, '2022-10-22 07:01:46'),
(50, 'digital_payment', '{\"status\":\"0\"}', '2021-12-07 19:36:11', '2021-12-07 19:36:11'),
(51, 'phone_verification', '1', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'IN', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'inhouse_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'timezone', 'UTC', NULL, NULL),
(59, 'maintenance_mode', '0', '2021-11-20 09:26:40', '2022-07-09 10:45:58'),
(60, 'bkash', '{\"status\":\"0\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, NULL),
(61, 'forgot_password_verification', 'email', NULL, NULL),
(62, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-29 17:53:48'),
(63, 'currency_symbol_position', 'left', '2021-12-07 06:55:39', '2021-12-07 06:55:40'),
(64, 'stock_limit', '10', NULL, NULL),
(65, 'seller_pos', '0', NULL, NULL),
(66, 'refund_day_limit', '0', NULL, NULL),
(67, 'business_mode', 'multi', NULL, NULL),
(68, 'decimal_point_settings', '2', NULL, NULL),
(69, 'flutterwave', '{\"status\":\"0\",\"public_key\":null,\"secret_key\":null,\"hash\":null}', NULL, '2022-08-21 06:38:47'),
(70, 'mercadopago', '{\"status\":\"0\",\"public_key\":null,\"access_token\":null}', NULL, '2022-08-21 06:43:40'),
(71, 'announcement', '{\"status\":\"0\",\"color\":\"#000000\",\"text_color\":\"#000000\",\"announcement\":null}', NULL, NULL),
(72, 'mail_config_sendgrid', '{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}', NULL, NULL),
(73, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-05-02 12:09:09'),
(74, 'recaptcha', '{\"status\":\"0\",\"site_key\":null,\"secret_key\":null}', '2022-08-17 04:50:19', '2022-08-17 04:50:19'),
(75, 'liqpay', '{\"status\":0,\"public_key\":\"\",\"private_key\":\"\"}', NULL, NULL),
(76, 'default_location', '{\"lat\":null,\"lng\":null}', NULL, NULL),
(77, '2factor_sms', '{\"status\":\"1\",\"api_key\":\"10ffaa2a-3570-11ed-9c12-0200cd936042\"}', '2022-10-22 07:07:25', '2022-10-22 07:07:25'),
(78, 'return_policy', '<p>Return Policy</p>', NULL, '2022-10-22 18:23:03');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choices` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `tax` double NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 1,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `cart_group_id`, `product_id`, `color`, `choices`, `variations`, `variant`, `quantity`, `price`, `tax`, `discount`, `slug`, `name`, `thumbnail`, `seller_id`, `seller_is`, `created_at`, `updated_at`, `shop_info`, `shipping_cost`, `shipping_type`) VALUES
(209, 3, '3-7C1lj-1659343145', 4920, NULL, '[]', '[]', '', 2, 24, 0, 2, 'product-6-3B7FNz', 'Product 6', '2022-07-31-62e66490e820d.png', 1, 'admin', '2022-08-01 08:39:05', '2022-08-01 09:19:41', 'Upmarkt', 0.00, 'order_wise'),
(211, 3, '3-7C1lj-1659343145', 4915, NULL, '[]', '[]', '', 1, 100, 0, 20, 'product-1-WS2Rrd', 'Product 1', '2022-07-31-62e662ad73e42.png', 1, 'admin', '2022-08-01 09:19:14', '2022-08-01 09:19:14', 'Upmarkt', 0.00, 'order_wise'),
(212, 3, '3-7C1lj-1659343145', 4920, NULL, '[]', '[]', '', 1, 24, 0, 2, 'product-6-3B7FNz', 'Product 6', '2022-07-31-62e66490e820d.png', 1, 'admin', '2022-08-01 12:27:07', '2022-08-01 12:27:07', 'Upmarkt', 0.00, 'order_wise'),
(213, 3, '3-7C1lj-1659343145', 4918, NULL, '[]', '[]', '', 1, 5000, 0, 100, 'product-4-md5Rma', 'Product 4', '2022-07-31-62e6641577416.png', 1, 'admin', '2022-08-02 04:31:00', '2022-08-02 04:31:00', 'Upmarkt', 0.00, 'order_wise'),
(214, 3, '3-7C1lj-1659343145', 4920, NULL, '[]', '[]', '', 1, 24, 0, 2, 'product-6-3B7FNz', 'Product 6', '2022-07-31-62e66490e820d.png', 1, 'admin', '2022-08-02 12:35:16', '2022-08-02 12:35:16', 'Upmarkt', 0.00, 'order_wise'),
(217, 3, '3-7C1lj-1659343145', 4918, NULL, '[]', '[]', '', 1, 5000, 0, 100, 'product-4-md5Rma', 'Product 4', '2022-07-31-62e6641577416.png', 1, 'admin', '2022-08-02 18:29:09', '2022-08-02 18:29:09', 'Upmarkt', 0.00, 'order_wise'),
(218, 3, '3-7C1lj-1659343145', 4920, NULL, '[]', '[]', '', 1, 24, 0, 2, 'product-6-3B7FNz', 'Product 6', '2022-07-31-62e66490e820d.png', 1, 'admin', '2022-08-02 18:29:09', '2022-08-02 18:29:09', 'Upmarkt', 0.00, 'order_wise'),
(219, 3, '3-7C1lj-1659343145', 4919, NULL, '[]', '[]', '', 1, 89, 0, 12, 'product-5-hDtfLa', 'Product 5', '2022-07-31-62e6645dc5c83.png', 1, 'admin', '2022-08-02 18:34:36', '2022-08-02 18:34:36', 'Upmarkt', 0.00, 'order_wise'),
(220, 3, '3-7C1lj-1659343145', 4920, NULL, '[]', '[]', '', 1, 24, 0, 2, 'product-6-3B7FNz', 'Product 6', '2022-07-31-62e66490e820d.png', 1, 'admin', '2022-08-02 18:34:36', '2022-08-02 18:34:36', 'Upmarkt', 0.00, 'order_wise'),
(233, 61, '61-vMgOF-1661240946', 4924, NULL, '[]', '[]', '', 6, 1, 0.18, 0.5, 'casallura-chair-ccBPUw', 'CASALLURA Chair', '2022-08-16-62fb4755baa48.png', 1, 'admin', '2022-08-23 10:47:40', '2022-08-23 10:47:59', 'Upmarkt', 0.00, 'order_wise'),
(234, 61, '61-vMgOF-1661240946', 4945, NULL, '[]', '[]', '', 1, 19999, 3599.82, 0, 'casallura-office-chair-g87gNY', 'CASALLURA Office Chair', '2022-08-27-6309d0b57397c.png', 1, 'admin', '2022-08-29 05:10:19', '2022-08-29 05:10:19', 'Upmarkt', 0.00, 'order_wise'),
(235, 61, '61-vMgOF-1661240946', 4922, NULL, '[]', '[]', '', 1, 12, 0, 1, 'table-HeTRhj', 'Table', '2022-08-13-62f795d1ead1d.png', 1, 'admin', '2022-08-30 07:10:29', '2022-08-30 07:10:29', 'Upmarkt', 0.00, 'order_wise'),
(236, 63, '63-0TYUr-1663387829', 4943, NULL, '[]', '[]', '', 1, 5, 0.9, 0, 'casallura-boss-chair-i7yhtl', 'CASALLURA Boss Chair', '2022-08-27-6309d06477a4e.png', 1, 'admin', '2022-09-17 04:10:29', '2022-09-17 04:10:29', 'Upmarkt', 0.00, 'order_wise'),
(237, 61, '61-vMgOF-1661240946', 4954, NULL, '[]', '[]', '', 1, 200000, 36000, 10, 'smart-bed-3-UmsCT0', 'Smart bed 3', '2022-10-18-634e3fa20875a.png', 1, 'admin', '2022-10-20 16:48:28', '2022-10-20 16:48:28', 'Upmarkt', 0.00, 'order_wise'),
(238, 61, '61-vMgOF-1661240946', 4957, NULL, '[]', '[]', '', 1, 1254125, 225742.5, 10, 'bed-eh7GGl', 'Bed', '2022-10-18-634e43a7610c6.png', 1, 'admin', '2022-10-20 16:48:28', '2022-10-20 16:48:28', 'Upmarkt', 0.00, 'order_wise'),
(240, 73, '73-alAAe-1667115342', 4935, NULL, '[]', '[]', '', 1, 28999, 5219.82, 0, 'casallura-boss-chair-designed-for-comfort-ergonomic-designer-chair-with-premium-looks-and-great-quality-woKxRe', 'CASALLURA Boss Chair designed for comfort. Ergonomic designer chair with premium', '2022-08-27-6309cb23e5caa.png', 1, 'admin', '2022-10-30 07:35:59', '2022-10-30 07:35:59', 'Upmarkt', 0.00, 'order_wise');

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_shippings`
--

INSERT INTO `cart_shippings` (`id`, `cart_group_id`, `shipping_method_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(84, '61-RgfMn-1660892202', 10, 30.00, '2022-08-21 06:24:40', '2022-08-21 06:24:40'),
(90, '61-vMgOF-1661240946', 10, 1.00, '2022-08-23 10:47:52', '2022-08-23 10:47:52'),
(92, '73-alAAe-1667115342', 10, 1.00, '2022-10-30 07:36:12', '2022-10-30 07:36:12');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`, `priority`) VALUES
(160, 'CHAIRS', 'chairs', '2022-08-09-62f2110dd54e9.png', 0, 0, '2022-08-09 07:47:25', '2022-08-09 07:47:54', 1, 1),
(161, 'LIVING', 'living', '2022-08-09-62f2116234faf.png', 0, 0, '2022-08-09 07:48:50', '2022-08-09 07:51:29', 1, 2),
(162, 'BEDROOM', 'bedroom', '2022-08-09-62f2122ee2cf8.png', 0, 0, '2022-08-09 07:52:14', '2022-08-09 08:05:45', 1, 4),
(163, 'DINING', 'dining', '2022-08-09-62f21241a831f.png', 0, 0, '2022-08-09 07:52:33', '2022-08-09 08:05:57', 1, 3),
(164, 'KITCHEN', 'kitchen', '2022-08-09-62f2125109345.png', 0, 0, '2022-08-09 07:52:49', '2022-10-20 02:57:28', 0, 5),
(165, 'BATHROOM', 'bathroom', '2022-08-09-62f212684d38a.png', 0, 0, '2022-08-09 07:53:12', '2022-08-09 07:58:26', 1, 6),
(166, 'OFFICE CHAIRS', 'office-chairs', NULL, 160, 1, '2022-08-09 07:55:24', '2022-08-09 07:56:37', 0, 4),
(167, 'GAMING CHAIRS', 'gaming-chairs', NULL, 160, 1, '2022-08-09 07:55:33', '2022-08-09 07:57:25', 0, 3),
(168, 'EXECUTIVE CHAIRS', 'executive-chairs', NULL, 160, 1, '2022-08-09 07:55:48', '2022-08-09 07:55:48', 0, 2),
(169, 'BASIC CHAIRS', 'basic-chairs', NULL, 160, 1, '2022-08-09 07:55:56', '2022-08-09 07:57:38', 0, 0),
(170, 'CENTER TABLE', 'center-table', NULL, 161, 1, '2022-08-09 07:59:34', '2022-08-09 07:59:34', 0, 10),
(171, 'TV TABLE', 'tv-table', NULL, 161, 1, '2022-08-09 07:59:46', '2022-08-09 07:59:46', 0, 9),
(172, 'COMPUTER TABLE', 'computer-table', NULL, 161, 1, '2022-08-09 08:03:00', '2022-08-09 08:03:00', 0, 8),
(173, 'HOME DECOR', 'home-decor', NULL, 161, 1, '2022-08-09 08:03:10', '2022-08-09 08:03:10', 0, 7),
(174, 'BED', 'bed', NULL, 162, 1, '2022-08-09 08:05:00', '2022-08-09 08:05:00', 0, 6),
(175, 'DINING TABLES', 'dining-tables', NULL, 163, 1, '2022-08-09 08:12:40', '2022-08-09 08:12:40', 0, 5),
(176, 'STORAGE', 'storage', NULL, 164, 1, '2022-08-09 08:13:05', '2022-08-09 08:13:05', 0, 5),
(177, 'RACKS', 'racks', NULL, 164, 1, '2022-08-09 08:13:22', '2022-08-09 08:13:22', 0, 4),
(179, 'WALL RACKS', 'wall-racks', NULL, 165, 1, '2022-08-09 08:14:08', '2022-08-09 08:14:08', 0, 3),
(180, 'CABINETS', 'cabinets', NULL, 165, 1, '2022-08-09 08:14:18', '2022-08-09 08:14:18', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `category_shipping_costs`
--

CREATE TABLE `category_shipping_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_shipping_costs`
--

INSERT INTO `category_shipping_costs` (`id`, `seller_id`, `category_id`, `cost`, `multiply_qty`, `created_at`, `updated_at`) VALUES
(26, 0, 160, 0.00, NULL, '2022-08-13 12:45:14', '2022-08-13 12:45:14'),
(27, 0, 161, 0.00, NULL, '2022-08-13 12:45:14', '2022-08-13 12:45:14'),
(28, 0, 162, 0.00, NULL, '2022-08-13 12:45:14', '2022-08-13 12:45:14'),
(29, 0, 163, 0.00, NULL, '2022-08-13 12:45:14', '2022-08-13 12:45:14'),
(30, 0, 164, 0.00, NULL, '2022-08-13 12:45:14', '2022-08-13 12:45:14'),
(31, 0, 165, 0.00, NULL, '2022-08-13 12:45:14', '2022-08-13 12:45:14'),
(32, 76, 160, 0.00, NULL, '2022-08-17 09:10:48', '2022-08-17 09:10:48'),
(33, 76, 161, 0.00, NULL, '2022-08-17 09:10:48', '2022-08-17 09:10:48'),
(34, 76, 162, 0.00, NULL, '2022-08-17 09:10:48', '2022-08-17 09:10:48'),
(35, 76, 163, 0.00, NULL, '2022-08-17 09:10:48', '2022-08-17 09:10:48'),
(36, 76, 164, 0.00, NULL, '2022-08-17 09:10:48', '2022-08-17 09:10:48'),
(37, 76, 165, 0.00, NULL, '2022-08-17 09:10:48', '2022-08-17 09:10:48');

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT 0,
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'USD', '1', 0, NULL, '2021-11-22 07:30:02'),
(2, 'BDT', '৳', 'BDT', '84', 0, NULL, '2021-11-22 07:29:27'),
(3, 'Indian Rupee', '₹', 'INR', '1', 1, '2020-10-15 17:23:04', '2022-05-05 08:22:39'),
(4, 'Euro', '€', 'EUR', '100', 0, '2021-05-25 21:00:23', '2021-11-22 07:29:42'),
(5, 'YEN', '¥', 'JPY', '110', 0, '2021-06-10 22:08:31', '2021-11-22 07:29:43'),
(6, 'Ringgit', 'RM', 'MYR', '4.16', 0, '2021-07-03 11:08:33', '2021-11-22 07:29:44'),
(7, 'Rand', 'R', 'ZAR', '14.26', 0, '2021-07-03 11:12:38', '2021-11-22 07:30:38');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `royality_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deal_of_the_days`
--

INSERT INTO `deal_of_the_days` (`id`, `title`, `product_id`, `discount`, `discount_type`, `status`, `created_at`, `updated_at`) VALUES
(1, '30% off of every Casallura chair', 4938, '0.00', 'flat', 1, '2022-08-28 14:47:13', '2022-08-28 14:47:18');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `deliveryman_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_locations`
--

CREATE TABLE `delivery_locations` (
  `id` int(11) NOT NULL,
  `Pincode` varchar(255) NOT NULL,
  `Location` varchar(25) NOT NULL,
  `RL Location` varchar(25) NOT NULL,
  `RM Control` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Service Type` varchar(50) NOT NULL,
  `Services` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_locations`
--

INSERT INTO `delivery_locations` (`id`, `Pincode`, `Location`, `RL Location`, `RM Control`, `State`, `Service Type`, `Services`) VALUES
(1, '110001', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(2, '110002', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(3, '110003', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(4, '110004', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(5, '110005', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(6, '110006', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(7, '110007', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(8, '110008', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(9, '110009', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(10, '110010', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(11, '110011', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(12, '110012', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(13, '110013', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(14, '110014', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(15, '110015', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(16, '110016', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(17, '110017', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(18, '110018', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(19, '110019', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(20, '110020', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(21, '110021', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(22, '110022', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(23, '110023', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(24, '110024', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(25, '110025', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(26, '110026', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(27, '110027', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(28, '110028', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(29, '110029', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(30, '110030', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(31, '110031', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(32, '110032', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(33, '110033', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(34, '110034', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(35, '110035', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(36, '110036', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(37, '110037', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(38, '110038', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(39, '110039', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(40, '110040', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(41, '110041', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(42, '110042', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(43, '110043', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(44, '110044', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(45, '110045', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(46, '110046', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(47, '110047', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(48, '110048', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(49, '110049', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(50, '110050', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(51, '110051', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(52, '110052', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(53, '110053', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(54, '110054', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(55, '110055', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(56, '110056', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(57, '110057', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(58, '110058', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(59, '110059', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(60, '110060', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(61, '110061', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(62, '110062', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(63, '110063', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(64, '110064', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(65, '110065', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(66, '110066', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(67, '110067', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(68, '110068', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(69, '110069', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(70, '110070', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(71, '110071', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(72, '110072', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(73, '110073', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(74, '110074', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(75, '110075', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(76, '110076', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(77, '110077', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(78, '110078', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(79, '110079', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(80, '110080', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(81, '110081', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(82, '110082', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(83, '110083', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(84, '110084', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(85, '110085', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(86, '110086', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(87, '110087', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(88, '110088', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(89, '110089', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(90, '110090', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(91, '110091', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(92, '110092', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(93, '110093', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(94, '110094', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(95, '110095', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(96, '110096', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(97, '110097', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(98, '110098', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(99, '110099', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(100, '110101', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(101, '110102', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(102, '110103', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(103, '110104', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(104, '110105', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(105, '110106', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(106, '110107', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(107, '110108', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(108, '110109', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(109, '110110', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(110, '110112', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(111, '110113', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(112, '110114', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(113, '110115', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(114, '110116', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(115, '110117', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(116, '110118', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(117, '110119', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(118, '110120', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(119, '110121', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(120, '110122', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(121, '110124', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(122, '110125', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(123, '110301', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(124, '110302', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(125, '110401', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(126, '110402', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(127, '110403', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(128, '110501', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(129, '110502', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(130, '110503', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(131, '110504', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(132, '110505', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(133, '110506', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(134, '110507', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(135, '110508', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(136, '110509', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(137, '110510', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(138, '110511', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(139, '110512', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(140, '110601', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(141, '110602', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(142, '110603', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(143, '110604', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(144, '110605', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(145, '110606', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(146, '110607', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(147, '110608', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(148, '110609', 'Delhi', 'Delhi', 'North', 'Delhi', 'Normal Service', 'All Services'),
(149, '121001', 'Faridabad', 'Faridabad', 'North', 'Haryana', 'Normal Service', 'All Services'),
(150, '121002', 'Faridabad', 'Faridabad', 'North', 'Haryana', 'Normal Service', 'All Services'),
(151, '121003', 'Faridabad', 'Faridabad', 'North', 'Haryana', 'Normal Service', 'All Services'),
(152, '121004', 'Faridabad', 'Faridabad', 'North', 'Haryana', 'Normal Service', 'All Services'),
(153, '121005', 'Faridabad', 'Faridabad', 'North', 'Haryana', 'Normal Service', 'All Services'),
(154, '121006', 'Faridabad', 'Faridabad', 'North', 'Haryana', 'Normal Service', 'All Services'),
(155, '121007', 'Faridabad', 'Faridabad', 'North', 'Haryana', 'Normal Service', 'All Services'),
(156, '121008', 'Faridabad', 'Faridabad', 'North', 'Haryana', 'Normal Service', 'All Services'),
(157, '121009', 'Faridabad', 'Faridabad', 'North', 'Haryana', 'Normal Service', 'All Services'),
(158, '121010', 'Faridabad', 'Faridabad', 'North', 'Haryana', 'Normal Service', 'All Services'),
(159, '121011', 'Faridabad', 'Faridabad', 'North', 'Haryana', 'Normal Service', 'All Services'),
(160, '121012', 'Faridabad', 'Faridabad', 'North', 'Haryana', 'Normal Service', 'All Services'),
(161, '121013', 'Faridabad', 'Faridabad', 'North', 'Haryana', 'Normal Service', 'All Services'),
(162, '122000', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(163, '122001', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(164, '122002', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(165, '122003', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(166, '122004', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(167, '122005', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(168, '122006', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(169, '122007', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(170, '122008', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(171, '122009', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(172, '122010', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(173, '122011', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(174, '122012', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(175, '122013', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(176, '122014', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(177, '122015', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(178, '122016', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(179, '122017', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(180, '122018', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(181, '122019', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(182, '122020', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(183, '122021', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(184, '122022', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(185, '122023', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(186, '122024', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(187, '122025', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(188, '122026', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(189, '122027', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(190, '122028', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(191, '122029', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(192, '122030', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(193, '122031', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(194, '122051', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(195, '122055', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Limited Services', 'Pick And Drop'),
(196, '122101', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(197, '122102', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(198, '122203', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(199, '122204', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(200, '122206', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(201, '122207', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(202, '122208', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(203, '122209', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(204, '122210', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(205, '122211', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(206, '122213', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(207, '122214', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(208, '122215', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(209, '122216', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(210, '122217', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(211, '122218', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(212, '122219', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(213, '122220', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(214, '122223', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(215, '122224', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(216, '122225', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(217, '122226', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(218, '122227', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(219, '122228', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(220, '122229', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(221, '122230', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(222, '122231', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(223, '122232', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(224, '122233', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(225, '122234', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(226, '122505', 'Gurgaon', 'Gurgaon', 'North', 'Haryana', 'Normal Service', 'All Services'),
(227, '133302', 'Chandigarh', 'Chandigarh', 'North', 'Haryana', 'Limited Services', 'Pick And Drop'),
(228, '134009', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(229, '134102', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(230, '134103', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(231, '134105', 'Chandigarh', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(232, '134107', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(233, '134108', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(234, '134109', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(235, '134110', 'Chandigarh', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(236, '134111', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(237, '134112', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(238, '134113', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(239, '134114', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(240, '134115', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(241, '134116', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(242, '134117', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(243, '134118', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(244, '134119', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(245, '134151', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(246, '134152', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(247, '134204', 'Chandigarh', 'Chandigarh', 'North', 'Haryana', 'Limited Services', 'Pick And Drop'),
(248, '134205', 'Panchkula', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(249, '134206', 'Chandigarh', 'Chandigarh', 'North', 'Haryana', 'Limited Services', 'Pick And Drop'),
(250, '140107', 'Zirakpur', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(251, '140603', 'Zirakpur', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(252, '140604', 'Zirakpur', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(253, '141001', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(254, '141002', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(255, '141003', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(256, '141004', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(257, '141005', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(258, '141006', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(259, '141007', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(260, '141008', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(261, '141009', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(262, '141010', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(263, '141011', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(264, '141012', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(265, '141013', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(266, '141014', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(267, '141015', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(268, '141016', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(269, '141017', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(270, '141021', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(271, '141022', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(272, '141027', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(273, '141101', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(274, '141102', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(275, '141103', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(276, '142021', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(277, '142022', 'Ludhiana', 'Ludhiana', 'North', 'Punjab', 'Normal Service', 'All Services'),
(278, '143402', 'Chandigarh', 'Chandigarh', 'North', 'Punjab', 'Limited Services', 'Pick And Drop'),
(279, '151215', 'Chandigarh', 'Chandigarh', 'North', 'Punjab', 'Limited Services', 'Pick And Drop'),
(280, '160001', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(281, '160002', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(282, '160003', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(283, '160004', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(284, '160005', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(285, '160006', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(286, '160007', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(287, '160008', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(288, '160009', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(289, '160010', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(290, '160011', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(291, '160012', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(292, '160013', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(293, '160014', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(294, '160015', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(295, '160016', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(296, '160017', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(297, '160018', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(298, '160019', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(299, '160020', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(300, '160021', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(301, '160022', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(302, '160023', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(303, '160024', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(304, '160025', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(305, '160026', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(306, '160027', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(307, '160028', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(308, '160029', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(309, '160030', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(310, '160031', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(311, '160032', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(312, '160033', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(313, '160034', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(314, '160035', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(315, '160036', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(316, '160037', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(317, '160038', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(318, '160039', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(319, '160040', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(320, '160041', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(321, '160042', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(322, '160043', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(323, '160044', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(324, '160045', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(325, '160046', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(326, '160047', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(327, '160048', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(328, '160049', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(329, '160050', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(330, '160051', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(331, '160052', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(332, '160053', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(333, '160054', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(334, '160055', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(335, '160056', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(336, '160057', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(337, '160058', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(338, '160059', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(339, '160060', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(340, '160061', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(341, '160062', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(342, '160063', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(343, '160064', 'Mohali', 'Chandigarh', 'North', 'Punjab', 'Normal Service', 'All Services'),
(344, '160065', 'Mohali', 'Chandigarh', 'North', 'Punjab', 'Normal Service', 'All Services'),
(345, '160066', 'Mohali', 'Chandigarh', 'North', 'Punjab', 'Normal Service', 'All Services'),
(346, '160067', 'Mohali', 'Chandigarh', 'North', 'Punjab', 'Normal Service', 'All Services'),
(347, '160068', 'Mohali', 'Chandigarh', 'North', 'Punjab', 'Normal Service', 'All Services'),
(348, '160069', 'Mohali', 'Chandigarh', 'North', 'Punjab', 'Normal Service', 'All Services'),
(349, '160070', 'Mohali', 'Chandigarh', 'North', 'Punjab', 'Normal Service', 'All Services'),
(350, '160071', 'Mohali', 'Chandigarh', 'North', 'Punjab', 'Normal Service', 'All Services'),
(351, '160073', 'Mohali', 'Chandigarh', 'North', 'Punjab', 'Normal Service', 'All Services'),
(352, '160074', 'Mohali', 'Chandigarh', 'North', 'Punjab', 'Normal Service', 'All Services'),
(353, '160079', 'Mohali', 'Chandigarh', 'North', 'Punjab', 'Normal Service', 'All Services'),
(354, '160101', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(355, '160102', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(356, '160103', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(357, '160104', 'Chandigarh', 'Chandigarh', 'North', 'Haryana', 'Normal Service', 'All Services'),
(358, '160106', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(359, '161101', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(360, '166031', 'Chandigarh', 'Chandigarh', 'North', 'Chandigarh', 'Normal Service', 'All Services'),
(361, '180001', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(362, '180002', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(363, '180003', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(364, '180004', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(365, '180005', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(366, '180006', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(367, '180007', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(368, '180008', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(369, '180009', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(370, '180010', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(371, '180011', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(372, '180012', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(373, '180013', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(374, '180015', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(375, '180016', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(376, '180017', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(377, '180018', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(378, '180019', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(379, '180020', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Normal Service', 'All Services'),
(380, '181008', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(381, '181101', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(382, '181102', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(383, '181104', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(384, '181105', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(385, '181111', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(386, '181113', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(387, '181114', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(388, '181121', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(389, '181122', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(390, '181123', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(391, '181124', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(392, '181131', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(393, '181132', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(394, '181133', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(395, '181134', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(396, '181141', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(397, '181143', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(398, '181144', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(399, '181145', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(400, '181151', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(401, '181152', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(402, '181201', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(403, '181202', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(404, '181203', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(405, '181204', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(406, '181205', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(407, '181206', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(408, '181207', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(409, '181208', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(410, '181209', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(411, '181221', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(412, '181223', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(413, '181224', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(414, '182222', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(415, '184102', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(416, '184141', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(417, '184142', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(418, '184143', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(419, '184144', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(420, '184145', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(421, '184146', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(422, '184148', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(423, '184151', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(424, '184152', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(425, '184201', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(426, '184202', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(427, '184203', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(428, '184204', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(429, '185101', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(430, '185131', 'Jammu', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(431, '190001', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(432, '190002', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(433, '190003', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(434, '190004', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(435, '190005', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(436, '190006', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(437, '190007', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(438, '190008', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(439, '190009', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(440, '190010', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(441, '190011', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(442, '190012', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(443, '190013', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(444, '190014', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(445, '190015', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(446, '190017', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(447, '190018', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(448, '190019', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(449, '190020', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(450, '190021', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(451, '190023', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(452, '190024', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(453, '190025', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(454, '191101', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(455, '191111', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(456, '191112', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(457, '191113', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(458, '191121', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(459, '191123', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(460, '191131', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(461, '191132', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(462, '191202', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(463, '191203', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(464, '192126', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(465, '192202', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(466, '192211', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(467, '192212', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(468, '192230', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(469, '192231', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(470, '192232', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(471, '192233', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(472, '192304', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(473, '192306', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(474, '192401', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(475, '193222', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(476, '193401', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(477, '193402', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(478, '193403', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(479, '193411', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(480, '193502', 'Srinagar', 'Jammu', 'North', 'Jammu & Kashmir', 'Limited Services', 'Pick And Drop'),
(481, '201001', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(482, '201002', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(483, '201003', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(484, '201004', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(485, '201005', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(486, '201006', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(487, '201007', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(488, '201008', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(489, '201009', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(490, '201010', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(491, '201011', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(492, '201012', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(493, '201013', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(494, '201014', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(495, '201015', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Limited Services', 'Pick And Drop'),
(496, '201016', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(497, '201017', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(498, '201019', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(499, '201103', 'Ghaziabad', 'Ghaziabad', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(500, '201301', 'Noida', 'Noida', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(501, '201302', 'Noida', 'Noida', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(502, '201303', 'Noida', 'Noida', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(503, '201304', 'Noida', 'Noida', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(504, '201305', 'Noida', 'Noida', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(505, '201306', 'Noida', 'Noida', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(506, '201307', 'Noida', 'Noida', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(507, '201308', 'Noida', 'Noida', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(508, '201309', 'Noida', 'Noida', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(509, '201310', 'Noida', 'Noida', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(510, '201311', 'Noida', 'Noida', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(511, '201312', 'Noida', 'Noida', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(512, '201313', 'Noida', 'Noida', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(513, '208001', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(514, '208002', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(515, '208003', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(516, '208004', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(517, '208005', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(518, '208006', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(519, '208007', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(520, '208008', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(521, '208009', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(522, '208010', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(523, '208011', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(524, '208012', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(525, '208013', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(526, '208014', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(527, '208015', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(528, '208016', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(529, '208017', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(530, '208018', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(531, '208019', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(532, '208020', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(533, '208021', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(534, '208022', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(535, '208023', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services');
INSERT INTO `delivery_locations` (`id`, `Pincode`, `Location`, `RL Location`, `RM Control`, `State`, `Service Type`, `Services`) VALUES
(536, '208024', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(537, '208025', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(538, '208026', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(539, '208027', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(540, '209201', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(541, '209214', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(542, '209217', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(543, '209304', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(544, '209305', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(545, '209401', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(546, '209402', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(547, '209407', 'Kanpur', 'Kanpur', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(548, '221001', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(549, '221002', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(550, '221003', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(551, '221004', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(552, '221005', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(553, '221006', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(554, '221007', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(555, '221008', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(556, '221010', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(557, '221011', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(558, '221101', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(559, '221102', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(560, '221103', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(561, '221104', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(562, '221105', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(563, '221106', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(564, '221107', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(565, '221108', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(566, '221109', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(567, '221202', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(568, '221204', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(569, '221206', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(570, '221208', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(571, '221210', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(572, '221311', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(573, '221405', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(574, '226001', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(575, '226002', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(576, '226003', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(577, '226004', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(578, '226005', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(579, '226006', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(580, '226007', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(581, '226008', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(582, '226009', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(583, '226010', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(584, '226011', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(585, '226012', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(586, '226013', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(587, '226014', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(588, '226015', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(589, '226016', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(590, '226017', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(591, '226018', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(592, '226019', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(593, '226020', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(594, '226021', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(595, '226022', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(596, '226023', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(597, '226024', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(598, '226025', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(599, '226026', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(600, '226027', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(601, '226028', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(602, '226029', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(603, '226030', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(604, '226031', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(605, '227105', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(606, '227106', 'Lucknow', 'Lucknow', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(607, '232102', 'Varanasi', 'Varanasi', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(608, '234001', 'Bareilly', 'Bareilly', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(609, '243001', 'Bareilly', 'Bareilly', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(610, '243002', 'Bareilly', 'Bareilly', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(611, '243003', 'Bareilly', 'Bareilly', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(612, '243004', 'Bareilly', 'Bareilly', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(613, '243005', 'Bareilly', 'Bareilly', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(614, '243006', 'Bareilly', 'Bareilly', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(615, '243122', 'Bareilly', 'Bareilly', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(616, '243123', 'Bareilly', 'Bareilly', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(617, '243201', 'Bareilly', 'Bareilly', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(618, '243202', 'Bareilly', 'Bareilly', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(619, '243203', 'Bareilly', 'Bareilly', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(620, '243503', 'Bareilly', 'Bareilly', 'North', 'Uttar Pradesh', 'Limited Services', 'Pick And Drop'),
(621, '246001', 'Rishikesh', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(622, '246171', 'Rishikesh', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(623, '246444', 'Rishikesh', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(624, '247470', 'Roorkee', 'Dehradun', 'North', 'Uttarakhand', 'Limited Services', 'Pick And Drop'),
(625, '247656', 'Hardwar', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(626, '247661', 'Hardwar', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(627, '247663', 'Hardwar', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(628, '247664', 'Hardwar', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(629, '247665', 'Roorkee', 'Dehradun', 'North', 'Uttarakhand', 'Limited Services', 'Pick And Drop'),
(630, '247666', 'Roorkee', 'Dehradun', 'North', 'Uttarakhand', 'Limited Services', 'Pick And Drop'),
(631, '247667', 'Roorkee', 'Dehradun', 'North', 'Uttarakhand', 'Limited Services', 'Pick And Drop'),
(632, '247668', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(633, '247670', 'Roorkee', 'Dehradun', 'North', 'Uttarakhand', 'Limited Services', 'Pick And Drop'),
(634, '247671', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(635, '248001', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(636, '248002', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(637, '248003', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(638, '248004', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(639, '248005', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(640, '248006', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(641, '248007', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(642, '248008', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(643, '248009', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(644, '248010', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(645, '248011', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(646, '248012', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(647, '248013', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(648, '248014', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(649, '248015', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(650, '248018', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(651, '248102', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(652, '248110', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(653, '248115', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(654, '248116', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(655, '248119', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(656, '248121', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(657, '248122', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(658, '248125', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(659, '248126', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(660, '248140', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(661, '248141', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(662, '248142', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(663, '248143', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(664, '248144', 'Rishikesh', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(665, '248145', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(666, '248146', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(667, '248147', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(668, '248160', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(669, '248161', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(670, '248171', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(671, '248195', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(672, '248197', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(673, '248198', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(674, '248201', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(675, '248203', 'Dehradun', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(676, '249137', 'Rishikesh', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(677, '249191', 'Rishikesh', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(678, '249201', 'Rishikesh', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(679, '249202', 'Rishikesh', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(680, '249203', 'Rishikesh', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(681, '249204', 'Rishikesh', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(682, '249205', 'Rishikesh', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(683, '249206', 'Rishikesh', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(684, '249302', 'Rishikesh', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(685, '249401', 'Hardwar', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(686, '249402', 'Hardwar', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(687, '249403', 'Hardwar', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(688, '249404', 'Hardwar', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(689, '249405', 'Hardwar', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(690, '249407', 'Hardwar', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(691, '249408', 'Hardwar', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(692, '249409', 'Hardwar', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(693, '249410', 'Hardwar', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(694, '249411', 'Hardwar', 'Dehradun', 'North', 'Uttarakhand', 'Normal Service', 'All Services'),
(695, '282001', 'Agra', 'Agra', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(696, '282002', 'Agra', 'Agra', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(697, '282003', 'Agra', 'Agra', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(698, '282004', 'Agra', 'Agra', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(699, '282005', 'Agra', 'Agra', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(700, '282006', 'Agra', 'Agra', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(701, '282007', 'Agra', 'Agra', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(702, '282008', 'Agra', 'Agra', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(703, '282009', 'Agra', 'Agra', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(704, '282010', 'Agra', 'Agra', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(705, '283102', 'Agra', 'Agra', 'North', 'Uttar Pradesh', 'Normal Service', 'All Services'),
(706, '302001', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(707, '302002', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(708, '302003', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(709, '302004', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(710, '302005', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(711, '302006', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(712, '302007', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(713, '302008', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(714, '302009', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(715, '302010', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(716, '302011', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(717, '302012', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(718, '302013', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(719, '302014', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(720, '302015', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(721, '302016', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(722, '302017', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(723, '302018', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(724, '302019', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(725, '302020', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(726, '302021', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(727, '302022', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(728, '302023', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(729, '302024', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(730, '302025', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(731, '302026', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(732, '302027', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(733, '302028', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(734, '302029', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(735, '302030', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(736, '302031', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(737, '302032', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(738, '302033', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(739, '302034', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(740, '302035', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(741, '302036', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(742, '302038', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(743, '302039', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(744, '302040', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(745, '302043', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(746, '303012', 'Jaipur', 'Jaipur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(747, '324001', 'Kota', 'Kota', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(748, '324002', 'Kota', 'Kota', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(749, '324003', 'Kota', 'Kota', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(750, '324004', 'Kota', 'Kota', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(751, '324005', 'Kota', 'Kota', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(752, '324006', 'Kota', 'Kota', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(753, '324007', 'Kota', 'Kota', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(754, '324008', 'Kota', 'Kota', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(755, '324009', 'Kota', 'Kota', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(756, '324010', 'Kota', 'Kota', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(757, '325003', 'Kota', 'Kota', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(758, '334001', 'Bikaner', 'Bikaner', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(759, '334003', 'Bikaner', 'Bikaner', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(760, '334004', 'Bikaner', 'Bikaner', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(761, '334005', 'Bikaner', 'Bikaner', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(762, '334006', 'Bikaner', 'Bikaner', 'North', 'Rajasthan', 'Limited Services', 'Pick And Drop'),
(763, '342001', 'Jodhpur', 'Jodhpur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(764, '342002', 'Jodhpur', 'Jodhpur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(765, '342003', 'Jodhpur', 'Jodhpur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(766, '342004', 'Jodhpur', 'Jodhpur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(767, '342005', 'Jodhpur', 'Jodhpur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(768, '342006', 'Jodhpur', 'Jodhpur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(769, '342007', 'Jodhpur', 'Jodhpur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(770, '342008', 'Jodhpur', 'Jodhpur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(771, '342009', 'Jodhpur', 'Jodhpur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(772, '342010', 'Jodhpur', 'Jodhpur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(773, '342011', 'Jodhpur', 'Jodhpur', 'North', 'Rajasthan', 'Normal Service', 'All Services'),
(774, '360001', 'Rajkot', 'Rajkot', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(775, '360002', 'Rajkot', 'Rajkot', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(776, '360003', 'Rajkot', 'Rajkot', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(777, '360004', 'Rajkot', 'Rajkot', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(778, '360005', 'Rajkot', 'Rajkot', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(779, '360006', 'Rajkot', 'Rajkot', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(780, '360007', 'Rajkot', 'Rajkot', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(781, '360008', 'Rajkot', 'Rajkot', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(782, '360009', 'Rajkot', 'Rajkot', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(783, '360020', 'Rajkot', 'Rajkot', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(784, '360022', 'Rajkot', 'Rajkot', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(785, '380001', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(786, '380002', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(787, '380003', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(788, '380004', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(789, '380005', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(790, '380006', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(791, '380007', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(792, '380008', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(793, '380009', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(794, '380010', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(795, '380013', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(796, '380014', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(797, '380015', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(798, '380016', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(799, '380018', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(800, '380019', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(801, '380021', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(802, '380022', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(803, '380023', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(804, '380024', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(805, '380025', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(806, '380026', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(807, '380027', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(808, '380028', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(809, '380030', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(810, '380038', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(811, '380045', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(812, '380049', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(813, '380050', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(814, '380051', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(815, '380052', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(816, '380053', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(817, '380054', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(818, '380055', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(819, '380056', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(820, '380057', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(821, '380058', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(822, '380059', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(823, '380060', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(824, '380061', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(825, '380062', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(826, '380063', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(827, '380330', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(828, '382001', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(829, '382002', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(830, '382003', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(831, '382004', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(832, '382005', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(833, '382006', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(834, '382007', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(835, '382008', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(836, '382009', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(837, '382010', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(838, '382011', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(839, '382012', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(840, '382013', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(841, '382014', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(842, '382015', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(843, '382016', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(844, '382017', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(845, '382018', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(846, '382019', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(847, '382020', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(848, '382021', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(849, '382022', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(850, '382023', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(851, '382024', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(852, '382025', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(853, '382026', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(854, '382028', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(855, '382029', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(856, '382041', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(857, '382210', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(858, '382324', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(859, '382325', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(860, '382330', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Limited Services', 'Pick And Drop'),
(861, '382340', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(862, '382345', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(863, '382346', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(864, '382350', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(865, '382352', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(866, '382405', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(867, '382410', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(868, '382415', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(869, '382418', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(870, '382421', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(871, '382422', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(872, '382423', 'Gandhinagar', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(873, '382424', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(874, '382427', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(875, '382428', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(876, '382440', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(877, '382442', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(878, '382443', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(879, '382470', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(880, '382475', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(881, '382480', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(882, '382481', 'Ahmedabad', 'Ahmedabad', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(883, '390001', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(884, '390002', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(885, '390003', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(886, '390006', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(887, '390007', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(888, '390008', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(889, '390009', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(890, '390010', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(891, '390011', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(892, '390012', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(893, '390013', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(894, '390014', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(895, '390016', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(896, '390017', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(897, '390018', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(898, '390019', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(899, '390020', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(900, '390021', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(901, '390022', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(902, '390023', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(903, '390025', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(904, '391101', 'Vadodara', 'Vadodara', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(905, '394010', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(906, '394101', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(907, '394105', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(908, '394107', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(909, '394185', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(910, '394210', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(911, '394211', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(912, '394212', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(913, '394220', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(914, '394221', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(915, '394229', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(916, '394230', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(917, '394235', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(918, '394305', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(919, '394325', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(920, '394500', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(921, '394510', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(922, '394516', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(923, '394518', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(924, '394520', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(925, '394550', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(926, '395001', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(927, '395002', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(928, '395003', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(929, '395004', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(930, '395005', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(931, '395006', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(932, '395007', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(933, '395008', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(934, '395009', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(935, '395010', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(936, '395011', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(937, '395012', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(938, '395017', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(939, '395023', 'Surat', 'Surat', 'Row', 'Gujarat', 'Normal Service', 'All Services'),
(940, '400001', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(941, '400002', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(942, '400003', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(943, '400004', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(944, '400005', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(945, '400006', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(946, '400007', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(947, '400008', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(948, '400009', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(949, '400010', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(950, '400011', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(951, '400012', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(952, '400013', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(953, '400014', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(954, '400015', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(955, '400016', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(956, '400017', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(957, '400018', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(958, '400019', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(959, '400020', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(960, '400021', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(961, '400022', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(962, '400023', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(963, '400024', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(964, '400025', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(965, '400026', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(966, '400027', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(967, '400028', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(968, '400029', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(969, '400030', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(970, '400031', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(971, 'Pincode', 'Location', 'RL Location', 'RM Control', 'State', 'Service Type', 'Services'),
(972, '400032', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(973, '400033', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(974, '400034', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(975, '400035', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(976, '400036', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(977, '400037', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(978, '400038', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(979, '400039', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(980, '400040', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(981, '400041', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(982, '400042', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(983, '400043', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(984, '400044', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(985, '400045', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(986, '400046', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(987, '400047', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(988, '400048', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(989, '400049', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(990, '400050', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(991, '400051', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(992, '400052', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(993, '400053', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(994, '400054', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(995, '400055', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(996, '400056', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(997, '400057', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(998, '400058', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(999, '400059', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1000, '400060', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1001, '400061', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1002, '400062', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1003, '400063', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1004, '400064', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1005, '400065', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1006, '400066', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1007, '400067', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1008, '400068', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1009, '400069', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1010, '400070', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1011, '400071', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1012, '400072', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1013, '400073', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1014, '400074', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1015, '400075', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1016, '400076', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1017, '400077', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1018, '400078', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1019, '400079', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1020, '400080', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1021, '400081', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1022, '400082', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1023, '400083', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1024, '400084', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1025, '400085', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1026, '400086', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1027, '400087', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1028, '400088', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1029, '400089', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1030, '400090', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1031, '400091', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1032, '400092', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1033, '400093', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1034, '400094', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1035, '400095', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1036, '400096', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1037, '400097', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1038, '400098', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1039, '400099', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1040, '400100', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1041, '400101', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1042, '400102', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1043, '400103', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1044, '400104', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1045, '400105', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1046, '400601', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1047, '400602', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1048, '400603', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1049, '400604', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1050, '400605', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1051, '400606', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1052, '400607', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1053, '400608', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1054, '400609', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1055, '400610', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1056, '400611', 'Navi Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'Pick And Drop'),
(1057, '400612', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1058, '400613', 'Navi Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1059, '400614', 'Navi Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1060, '400615', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1061, '400701', 'Navi Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1062, '400703', 'Navi Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1063, '400705', 'Navi Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1064, '400706', 'Navi Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1065, '400708', 'Navi Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1066, '400709', 'Navi Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1067, '400710', 'Navi Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1068, '400901', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services');
INSERT INTO `delivery_locations` (`id`, `Pincode`, `Location`, `RL Location`, `RM Control`, `State`, `Service Type`, `Services`) VALUES
(1069, '401101', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1070, '401102', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1071, '401104', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1072, '401105', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1073, '401107', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1074, '401201', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1075, '401202', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1076, '401203', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1077, '401205', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1078, '401207', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1079, '401208', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1080, '401209', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1081, '401301', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1082, '401303', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1083, '401305', 'Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1084, '403001', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1085, '403002', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1086, '403003', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1087, '403004', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1088, '403005', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1089, '403006', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1090, '403101', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1091, '403107', 'Goa', 'Goa', 'West', 'Goa', 'Limited Services', 'Pick And Drop'),
(1092, '403108', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1093, '403110', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1094, '403114', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1095, '403201', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1096, '403502', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1097, '403503', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1098, '403504', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1099, '403507', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1100, '403508', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1101, '403509', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1102, '403510', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1103, '403512', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1104, '403513', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1105, '403514', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1106, '403515', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1107, '403516', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1108, '403517', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1109, '403518', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1110, '403519', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1111, '403521', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1112, '403524', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1113, '403531', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1114, '403710', 'Goa', 'Goa', 'West', 'Goa', 'Normal Service', 'All Services'),
(1115, '410208', 'Navi Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1116, '410210', 'Navi Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1117, '410218', 'Navi Mumbai', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1118, '411000', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1119, '411001', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1120, '411002', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1121, '411003', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1122, '411004', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1123, '411005', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1124, '411006', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1125, '411007', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1126, '411008', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1127, '411009', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1128, '411010', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1129, '411011', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1130, '411012', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1131, '411013', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1132, '411014', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1133, '411015', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1134, '411016', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1135, '411017', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1136, '411018', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1137, '411019', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1138, '411020', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1139, '411021', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1140, '411022', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1141, '411023', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1142, '411024', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1143, '411026', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1144, '411027', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1145, '411028', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1146, '411029', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1147, '411030', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1148, '411031', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1149, '411032', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1150, '411033', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1151, '411034', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1152, '411035', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1153, '411036', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1154, '411037', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1155, '411038', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1156, '411039', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1157, '411040', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1158, '411041', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1159, '411042', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1160, '411043', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1161, '411044', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1162, '411045', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1163, '411046', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1164, '411047', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1165, '411048', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1166, '411049', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1167, '411050', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1168, '411051', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1169, '411052', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1170, '411053', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1171, '411054', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1172, '411055', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1173, '411056', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1174, '411057', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1175, '411058', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1176, '411060', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1177, '411061', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1178, '412307', 'Pune', 'Pune', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1179, '421001', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1180, '421002', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1181, '421003', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1182, '421004', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1183, '421005', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1184, '421101', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1185, '421102', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1186, '421103', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1187, '421201', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1188, '421202', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1189, '421203', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1190, '421204', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1191, '421205', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1192, '421206', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1193, '421301', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1194, '421302', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1195, '421305', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1196, '421308', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Normal Service', 'All Services'),
(1197, '421311', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1198, '421501', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1199, '421502', 'Bhiwandi', 'Mumbai', 'West', 'Maharashtra', 'Limited Services', 'Pick And Drop'),
(1200, '431001', 'Aurangabad', 'Aurangabad', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1201, '431002', 'Aurangabad', 'Aurangabad', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1202, '431003', 'Aurangabad', 'Aurangabad', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1203, '431004', 'Aurangabad', 'Aurangabad', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1204, '431005', 'Aurangabad', 'Aurangabad', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1205, '431006', 'Aurangabad', 'Aurangabad', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1206, '431007', 'Aurangabad', 'Aurangabad', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1207, '431008', 'Aurangabad', 'Aurangabad', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1208, '431009', 'Aurangabad', 'Aurangabad', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1209, '431010', 'Aurangabad', 'Aurangabad', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1210, '431136', 'Aurangabad', 'Aurangabad', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1211, '440001', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1212, '440002', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1213, '440003', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1214, '440004', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1215, '440005', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1216, '440006', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1217, '440007', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1218, '440008', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1219, '440009', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1220, '440010', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1221, '440012', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1222, '440013', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1223, '440014', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1224, '440015', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1225, '440016', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1226, '440017', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1227, '440018', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1228, '440019', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1229, '440020', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1230, '440021', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1231, '440022', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1232, '440023', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1233, '440024', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1234, '440025', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1235, '440026', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1236, '440027', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1237, '440028', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1238, '440030', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1239, '440032', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1240, '440033', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1241, '440034', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1242, '440035', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1243, '441001', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1244, '441002', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1245, '441105', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1246, '441106', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1247, '441107', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1248, '441108', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1249, '441110', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1250, '441122', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1251, '441501', 'Nagpur', 'Nagpur', 'Row', 'Maharashtra', 'Normal Service', 'All Services'),
(1252, '452001', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1253, '452002', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1254, '452003', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1255, '452004', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1256, '452005', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1257, '452006', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1258, '452007', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1259, '452008', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1260, '452009', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1261, '452010', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1262, '452011', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1263, '452012', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1264, '452014', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1265, '452015', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1266, '452016', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1267, '452017', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1268, '452018', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1269, '453112', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1270, '453331', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1271, '453555', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1272, '453556', 'Indore', 'Indore', 'Row', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1273, '462001', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1274, '462003', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1275, '462008', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1276, '462010', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1277, '462011', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1278, '462013', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1279, '462016', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1280, '462021', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1281, '462022', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1282, '462023', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1283, '462024', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1284, '462026', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1285, '462030', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1286, '462038', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1287, '462041', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1288, '462042', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1289, '462043', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1290, '462044', 'Bhopal', 'Bhopal', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1291, '472001', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Limited Services', 'Pick And Drop'),
(1292, '474001', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1293, '474002', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1294, '474003', 'Gwalior', 'Gwalior', 'North', 'Madhyapradesh', 'Normal Service', 'All Services'),
(1295, '474004', 'Gwalior', 'Gwalior', 'North', 'Madhyapradesh', 'Normal Service', 'All Services'),
(1296, '474005', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1297, '474006', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1298, '474007', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1299, '474008', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1300, '474009', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1301, '474010', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1302, '474011', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1303, '474012', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1304, '474013', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1305, '474015', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1306, '474020', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1307, '474040', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1308, '474041', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1309, '474042', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1310, '474050', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1311, '474055', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1312, '475001', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1313, '475002', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1314, '475005', 'Gwalior', 'Gwalior', 'North', 'Madhya Pradesh', 'Normal Service', 'All Services'),
(1315, '490042', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1316, '492001', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1317, '492002', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1318, '492003', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1319, '492004', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1320, '492005', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1321, '492006', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1322, '492007', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1323, '492008', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1324, '492009', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1325, '492010', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1326, '492011', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1327, '492012', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1328, '492013', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1329, '492015', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1330, '492016', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1331, '492017', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1332, '492021', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1333, '492099', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1334, '492100', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1335, '492102', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1336, '492105', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1337, '492106', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1338, '492107', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1339, '493002', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1340, '493114', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1341, '493221', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1342, '493661', 'Raipur', 'Raipur', 'Row', 'Chhatisgarh', 'Normal Service', 'All Services'),
(1343, '500001', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1344, '500002', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1345, '500003', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1346, '500004', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1347, '500005', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1348, '500006', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1349, '500007', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1350, '500008', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1351, '500009', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1352, '500010', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1353, '500011', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1354, '500012', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1355, '500013', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1356, '500014', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1357, '500015', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1358, '500016', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1359, '500017', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1360, '500018', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1361, '500019', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1362, '500020', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1363, '500021', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1364, '500022', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1365, '500023', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1366, '500024', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1367, '500025', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1368, '500026', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1369, '500027', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1370, '500028', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1371, '500029', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1372, '500030', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1373, '500031', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1374, '500032', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1375, '500033', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1376, '500034', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1377, '500035', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1378, '500036', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1379, '500037', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1380, '500038', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1381, '500039', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1382, '500040', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1383, '500041', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1384, '500042', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1385, '500044', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1386, '500045', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1387, '500046', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1388, '500047', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1389, '500048', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1390, '500049', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1391, '500050', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1392, '500051', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1393, '500052', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1394, '500053', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1395, '500054', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1396, '500055', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1397, '500056', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1398, '500057', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1399, '500058', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1400, '500059', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1401, '500060', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1402, '500061', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1403, '500062', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1404, '500063', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1405, '500064', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1406, '500065', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1407, '500066', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1408, '500067', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1409, '500068', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1410, '500069', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1411, '500070', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1412, '500071', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1413, '500072', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1414, '500073', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1415, '500074', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1416, '500075', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1417, '500076', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1418, '500077', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1419, '500079', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1420, '500080', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1421, '500081', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1422, '500082', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1423, '500083', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1424, '500084', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1425, '500085', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1426, '500086', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1427, '500087', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1428, '500088', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1429, '500089', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1430, '500090', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1431, '500091', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1432, '500092', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1433, '500093', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1434, '500094', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1435, '500095', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1436, '500096', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1437, '500097', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1438, '500098', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Normal Service', 'All Services'),
(1439, '502032', 'Hyderabad', 'Hyderabad', 'South', 'Telengana', 'Limited Services', 'Pick And Drop'),
(1440, '506001', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1441, '506002', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1442, '506003', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1443, '506004', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1444, '506005', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1445, '506006', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1446, '506007', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1447, '506008', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1448, '506009', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1449, '506010', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1450, '506011', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1451, '506012', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1452, '506013', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1453, '506015', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1454, '506370', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1455, '506371', 'Warangal', 'Warangal', 'South', 'Telangana', 'Limited Services', 'Pick And Drop'),
(1456, '520001', 'Vijayawada', 'Vijayawada', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1457, '520002', 'Vijayawada', 'Vijayawada', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1458, '520003', 'Vijayawada', 'Vijayawada', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1459, '520004', 'Vijayawada', 'Vijayawada', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1460, '520005', 'Vijayawada', 'Vijayawada', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1461, '520006', 'Vijayawada', 'Vijayawada', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1462, '520007', 'Vijayawada', 'Vijayawada', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1463, '520008', 'Vijayawada', 'Vijayawada', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1464, '520009', 'Vijayawada', 'Vijayawada', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1465, '520010', 'Vijayawada', 'Vijayawada', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1466, '520011', 'Vijayawada', 'Vijayawada', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1467, '520012', 'Vijayawada', 'Vijayawada', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1468, '520013', 'Vijayawada', 'Vijayawada', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1469, '520015', 'Vijayawada', 'Vijayawada', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1470, '530001', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1471, '530002', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1472, '530003', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1473, '530004', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1474, '530005', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1475, '530007', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1476, '530008', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1477, '530009', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1478, '530011', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1479, '530012', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1480, '530013', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1481, '530014', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1482, '530015', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1483, '530016', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1484, '530017', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1485, '530018', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1486, '530020', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1487, '530022', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1488, '530024', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1489, '530026', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1490, '530027', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1491, '530029', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1492, '530031', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1493, '530032', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1494, '530035', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1495, '530040', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1496, '530044', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1497, '530046', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1498, '530047', 'Visakhapatnam', 'Visakhapatnam', 'South', 'Andhra Pradesh', 'Normal Service', 'All Services'),
(1499, '533101', 'Rajamundri', 'Hyderabad', 'South', 'Telengana', 'Limited Services', 'Pick And Drop'),
(1500, '533102', 'Rajamundri', 'Hyderabad', 'South', 'Telengana', 'Limited Services', 'Pick And Drop'),
(1501, '533103', 'Rajamundri', 'Hyderabad', 'South', 'Telengana', 'Limited Services', 'Pick And Drop'),
(1502, '533104', 'Rajamundri', 'Hyderabad', 'South', 'Telengana', 'Limited Services', 'Pick And Drop'),
(1503, '533105', 'Rajamundri', 'Hyderabad', 'South', 'Telengana', 'Limited Services', 'Pick And Drop'),
(1504, '533106', 'Rajamundri', 'Hyderabad', 'South', 'Telengana', 'Limited Services', 'Pick And Drop'),
(1505, '533107', 'Rajamundri', 'Hyderabad', 'South', 'Telengana', 'Limited Services', 'Pick And Drop'),
(1506, '560001', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1507, '560002', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1508, '560003', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1509, '560004', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1510, '560005', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1511, '560006', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1512, '560007', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1513, '560008', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1514, '560009', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1515, '560010', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1516, '560011', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1517, '560012', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1518, '560013', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1519, '560014', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1520, '560015', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1521, '560016', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1522, '560017', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1523, '560018', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1524, '560019', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1525, '560020', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1526, '560021', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1527, '560022', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1528, '560023', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1529, '560024', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1530, '560025', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1531, '560026', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1532, '560027', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1533, '560028', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1534, '560029', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1535, '560030', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1536, '560031', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1537, '560032', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1538, '560033', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1539, '560034', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1540, '560035', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1541, '560036', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1542, '560037', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1543, '560038', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1544, '560039', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1545, '560040', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1546, '560041', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1547, '560042', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1548, '560043', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1549, '560044', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1550, '560045', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1551, '560046', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1552, '560047', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1553, '560048', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1554, '560049', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1555, '560050', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1556, '560051', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1557, '560052', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1558, '560053', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1559, '560054', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1560, '560055', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1561, '560056', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1562, '560057', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1563, '560058', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1564, '560059', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1565, '560060', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1566, '560061', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1567, '560062', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1568, '560063', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1569, '560064', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1570, '560065', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1571, '560066', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1572, '560067', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1573, '560068', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1574, '560069', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1575, '560070', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1576, '560071', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1577, '560072', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1578, '560073', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1579, '560074', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1580, '560075', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1581, '560076', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1582, '560077', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1583, '560078', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1584, '560079', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1585, '560080', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1586, '560081', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1587, '560082', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1588, '560083', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1589, '560084', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services');
INSERT INTO `delivery_locations` (`id`, `Pincode`, `Location`, `RL Location`, `RM Control`, `State`, `Service Type`, `Services`) VALUES
(1590, '560085', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1591, '560086', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1592, '560087', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1593, '560090', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1594, '560091', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1595, '560092', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1596, '560093', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1597, '560094', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1598, '560095', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1599, '560096', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1600, '560097', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1601, '560098', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1602, '560099', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1603, '560100', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1604, '560102', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1605, '560103', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1606, '560104', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1607, '560105', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1608, '560106', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1609, '560107', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1610, '560109', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1611, '560110', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1612, '560111', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1613, '560113', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1614, '560115', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1615, '561229', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1616, '562149', 'Bangalore', 'Bangalore', 'South', 'Karnataka', 'Limited Services', 'Pick And Drop'),
(1617, '570001', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1618, '570002', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1619, '570003', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1620, '570004', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1621, '570005', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1622, '570006', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1623, '570007', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1624, '570008', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1625, '570009', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1626, '570010', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1627, '570011', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1628, '570012', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1629, '570013', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1630, '570014', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1631, '570015', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1632, '570016', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1633, '570017', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1634, '570018', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1635, '570019', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1636, '570020', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1637, '570021', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1638, '570022', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1639, '570023', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1640, '570024', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1641, '570025', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1642, '570026', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1643, '570027', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1644, '570028', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1645, '570029', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1646, '570030', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1647, '570031', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1648, '570032', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1649, '570033', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1650, '570034', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1651, '571130', 'Mysore', 'Mysore', 'South', 'Karnataka', 'Normal Service', 'All Services'),
(1652, '600001', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1653, '600002', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1654, '600003', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1655, '600004', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1656, '600005', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1657, '600006', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1658, '600007', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1659, '600008', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1660, '600009', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1661, '600010', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1662, '600011', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1663, '600012', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1664, '600013', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1665, '600014', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1666, '600015', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1667, '600016', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1668, '600017', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1669, '600018', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1670, '600019', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1671, '600020', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1672, '600021', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1673, '600022', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1674, '600023', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1675, '600024', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1676, '600025', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1677, '600026', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1678, '600027', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1679, '600028', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1680, '600029', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1681, '600030', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1682, '600031', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1683, '600032', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1684, '600033', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1685, '600034', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1686, '600035', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1687, '600036', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1688, '600037', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1689, '600038', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1690, '600039', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1691, '600040', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1692, '600041', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1693, '600042', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1694, '600043', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1695, '600044', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1696, '600045', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1697, '600046', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1698, '600047', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1699, '600048', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1700, '600049', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1701, '600050', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1702, '600051', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1703, '600052', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1704, '600053', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1705, '600054', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1706, '600055', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1707, '600056', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1708, '600057', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1709, '600058', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1710, '600059', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1711, '600060', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1712, '600061', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1713, '600062', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1714, '600063', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1715, '600064', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1716, '600065', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1717, '600066', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1718, '600067', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1719, '600068', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1720, '600069', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1721, '600070', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1722, '600071', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1723, '600072', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1724, '600073', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1725, '600074', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1726, '600075', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1727, '600076', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1728, '600077', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1729, '600078', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1730, '600079', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1731, '600080', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1732, '600081', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1733, '600082', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1734, '600083', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1735, '600084', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1736, '600085', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1737, '600086', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1738, '600087', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1739, '600088', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1740, '600089', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1741, '600090', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1742, '600091', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1743, '600092', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1744, '600093', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1745, '600094', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1746, '600095', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1747, '600096', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1748, '600097', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1749, '600098', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1750, '600099', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1751, '600100', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1752, '600101', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1753, '600102', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1754, '600103', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1755, '600104', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1756, '600105', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1757, '600106', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1758, '600107', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1759, '600108', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1760, '600109', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1761, '600110', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1762, '600111', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1763, '600112', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1764, '600113', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1765, '600114', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1766, '600115', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1767, '600116', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1768, '600117', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1769, '600118', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1770, '600119', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1771, '600123', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1772, '600125', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1773, '600126', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1774, '601206', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1775, '602101', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1776, '602102', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1777, '603103', 'Chennai', 'Chennai', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1778, '605001', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1779, '605002', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1780, '605003', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1781, '605004', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1782, '605005', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1783, '605006', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1784, '605007', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1785, '605008', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1786, '605009', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1787, '605010', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1788, '605011', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1789, '605013', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1790, '605014', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1791, '605101', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1792, '605102', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1793, '605104', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1794, '605105', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1795, '605106', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1796, '605107', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1797, '605110', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1798, '605111', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1799, '605501', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1800, '605502', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1801, '607402', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1802, '607403', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(1803, '625001', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1804, '625002', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1805, '625003', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1806, '625004', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1807, '625007', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1808, '625008', 'Madurai', 'Madurai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1809, '625009', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1810, '625010', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1811, '625011', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1812, '625012', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1813, '625013', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1814, '625014', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1815, '625015', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1816, '625016', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1817, '625017', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1818, '625018', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1819, '625020', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1820, '625062', 'Madurai', 'Chennai', 'South', 'Tamil Nadu', 'Limited Services', 'Pick And Drop'),
(1821, '641001', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1822, '641002', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1823, '641003', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1824, '641004', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1825, '641005', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1826, '641006', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1827, '641007', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1828, '641008', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1829, '641009', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1830, '641010', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1831, '641011', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1832, '641012', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1833, '641013', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1834, '641014', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1835, '641015', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1836, '641016', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1837, '641017', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1838, '641018', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1839, '641019', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1840, '641020', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1841, '641021', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1842, '641022', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1843, '641023', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1844, '641024', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1845, '641025', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1846, '641026', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1847, '641027', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1848, '641028', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1849, '641029', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1850, '641030', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1851, '641031', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1852, '641032', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1853, '641033', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1854, '641034', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1855, '641035', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1856, '641036', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1857, '641037', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1858, '641038', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1859, '641039', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1860, '641041', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1861, '641042', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1862, '641043', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1863, '641044', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1864, '641045', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1865, '641046', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1866, '641047', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1867, '641048', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1868, '641049', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1869, '641050', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1870, '641062', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1871, '641101', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1872, '641103', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1873, '641104', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1874, '641105', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1875, '641107', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1876, '641108', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1877, '641109', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1878, '641110', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1879, '641111', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1880, '641112', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1881, '641113', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1882, '641201', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1883, '641202', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1884, '641401', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1885, '641402', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1886, '641602', 'Tirupur', 'Tirupur', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1887, '641603', 'Tirupur', 'Tirupur', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1888, '641604', 'Tirupur', 'Tirupur', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1889, '641605', 'Tirupur', 'Tirupur', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1890, '641606', 'Tirupur', 'Tirupur', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1891, '641607', 'Tirupur', 'Tirupur', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1892, '641608', 'Tirupur', 'Tirupur', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1893, '641633', 'Tirupur', 'Tirupur', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1894, '641652', 'Tirupur', 'Tirupur', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1895, '641659', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1896, '641662', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1897, '641666', 'Tirupur', 'Tirupur', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1898, '641687', 'Tirupur', 'Tirupur', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1899, '641697', 'Coimbatore', 'Coimbatore', 'South', 'Tamil Nadu', 'Normal Service', 'All Services'),
(1900, '670001', 'Kannur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1901, '670002', 'Kannur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1902, '670003', 'Kannur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1903, '670004', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1904, '670005', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1905, '670006', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1906, '670007', 'Kannur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1907, '670008', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1908, '670009', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1909, '670010', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1910, '670011', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1911, '670012', 'Kannur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1912, '670013', 'Kannur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1913, '670014', 'Kannur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1914, '670015', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1915, '670016', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1916, '670017', 'Kannur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1917, '670018', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1918, '670101', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1919, '670102', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1920, '670103', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1921, '670104', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1922, '670105', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1923, '670106', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1924, '670107', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1925, '670109', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1926, '670110', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1927, '670141', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1928, '670142', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1929, '670143', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1930, '670144', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1931, '670301', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1932, '670302', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1933, '670303', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1934, '670304', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1935, '670305', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1936, '670306', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1937, '670307', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1938, '670308', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1939, '670309', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1940, '670325', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1941, '670327', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1942, '670330', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1943, '670331', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1944, '670332', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1945, '670333', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1946, '670334', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1947, '670337', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1948, '670339', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1949, '670343', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1950, '670346', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1951, '670354', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1952, '670358', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1953, '670501', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1954, '670502', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1955, '670503', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1956, '670511', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1957, '670521', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1958, '670522', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1959, '670561', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1960, '670562', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1961, '670563', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1962, '670564', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1963, '670565', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1964, '670566', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1965, '670567', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1966, '670571', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1967, '670581', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1968, '670582', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1969, '670591', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1970, '670592', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1971, '670593', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1972, '670594', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1973, '670595', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1974, '670597', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1975, '670601', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1976, '670602', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1977, '670603', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1978, '670604', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1979, '670611', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1980, '670612', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1981, '670613', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1982, '670614', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1983, '670621', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1984, '670622', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1985, '670631', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1986, '670632', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1987, '670633', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1988, '670641', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1989, '670642', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1990, '670643', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1991, '670644', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1992, '670645', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1993, '670646', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1994, '670647', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1995, '670649', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1996, '670650', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1997, '670651', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1998, '670661', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(1999, '670662', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2000, '670663', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2001, '670671', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2002, '670672', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2003, '670673', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2004, '670674', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2005, '670675', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2006, '670676', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2007, '670677', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2008, '670678', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2009, '670679', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2010, '670691', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2011, '670692', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2012, '670693', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2013, '670694', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2014, '670701', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2015, '670702', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2016, '670703', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2017, '670704', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2018, '670705', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2019, '670706', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2020, '670721', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2021, '670731', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2022, '670732', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2023, '670741', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2024, '671121', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2025, '671122', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2026, '671123', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2027, '671124', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2028, '671310', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2029, '671311', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2030, '671312', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2031, '671313', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2032, '671314', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2033, '671315', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2034, '671316', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2035, '671317', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2036, '671318', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2037, '671319', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2038, '671321', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2039, '671322', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2040, '671323', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2041, '671324', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2042, '671326', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2043, '671328', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2044, '671329', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2045, '671341', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2046, '671348', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2047, '671349', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2048, '671350', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2049, '671351', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2050, '671353', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2051, '671357', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2052, '671531', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2053, '671532', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2054, '671533', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2055, '671541', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2056, '671542', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2057, '671543', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2058, '671544', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2059, '671545', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2060, '671551', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2061, '671552', 'Kasargod', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2062, '673001', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2063, '673002', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2064, '673003', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2065, '673004', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2066, '673005', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2067, '673006', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2068, '673007', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2069, '673008', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2070, '673009', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2071, '673010', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2072, '673011', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2073, '673012', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2074, '673013', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2075, '673014', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2076, '673015', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2077, '673016', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2078, '673017', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2079, '673018', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2080, '673019', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2081, '673020', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2082, '673021', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2083, '673023', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2084, '673024', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2085, '673025', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2086, '673026', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2087, '673027', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2088, '673028', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2089, '673029', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2090, '673032', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2091, '673101', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2092, '673102', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2093, '673103', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2094, '673104', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2095, '673105', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2096, '673106', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2097, '673107', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2098, '673108', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2099, '673109', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2100, '673110', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2101, '673111', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2102, '673112', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2103, '673121', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2104, '673122', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2105, '673123', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2106, '673124', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2107, '673301', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2108, '673302', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2109, '673303', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2110, '673304', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services');
INSERT INTO `delivery_locations` (`id`, `Pincode`, `Location`, `RL Location`, `RM Control`, `State`, `Service Type`, `Services`) VALUES
(2111, '673305', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2112, '673306', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2113, '673307', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2114, '673308', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2115, '673309', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2116, '673310', 'Pondicherry', 'Pondicherry', 'South', 'Pondicherry', 'Normal Service', 'All Services'),
(2117, '673311', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2118, '673312', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2119, '673313', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2120, '673314', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2121, '673315', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2122, '673316', 'Kannur', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2123, '673317', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2124, '673318', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2125, '673321', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2126, '673323', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2127, '673325', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2128, '673326', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2129, '673327', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2130, '673328', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2131, '673501', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2132, '673502', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2133, '673503', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2134, '673504', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2135, '673505', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2136, '673506', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2137, '673507', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2138, '673508', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2139, '673509', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2140, '673510', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2141, '673511', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2142, '673512', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2143, '673513', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2144, '673514', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2145, '673515', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2146, '673516', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2147, '673517', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2148, '673518', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2149, '673519', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2150, '673520', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2151, '673521', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2152, '673522', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2153, '673523', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2154, '673524', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2155, '673525', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2156, '673526', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2157, '673527', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2158, '673528', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2159, '673529', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2160, '673530', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2161, '673532', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2162, '673534', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2163, '673541', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2164, '673542', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2165, '673544', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2166, '673570', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2167, '673571', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2168, '673572', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2169, '673573', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2170, '673574', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2171, '673575', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2172, '673576', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2173, '673577', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2174, '673578', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2175, '673579', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2176, '673580', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2177, '673581', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2178, '673583', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2179, '673585', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2180, '673586', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2181, '673589', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2182, '673591', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2183, '673592', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2184, '673593', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2185, '673595', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2186, '673596', 'Wayanad', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2187, '673601', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2188, '673602', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2189, '673603', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2190, '673604', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2191, '673611', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2192, '673612', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2193, '673613', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2194, '673614', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2195, '673615', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2196, '673616', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2197, '673617', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2198, '673618', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2199, '673619', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2200, '673620', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2201, '673621', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2202, '673623', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2203, '673624', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2204, '673631', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2205, '673632', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2206, '673633', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2207, '673634', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2208, '673635', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2209, '673636', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2210, '673637', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2211, '673638', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2212, '673639', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2213, '673640', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2214, '673641', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2215, '673642', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2216, '673643', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2217, '673644', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2218, '673645', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2219, '673647', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2220, '673648', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2221, '673649', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2222, '673651', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2223, '673652', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2224, '673653', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2225, '673655', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2226, '673661', 'Kozhikode', 'Calicut', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2227, '676101', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2228, '676102', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2229, '676103', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2230, '676104', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2231, '676105', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2232, '676106', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2233, '676107', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2234, '676108', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2235, '676109', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2236, '676110', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2237, '676111', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2238, '676121', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2239, '676122', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2240, '676123', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2241, '676126', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2242, '676127', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2243, '676301', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2244, '676302', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2245, '676303', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2246, '676304', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2247, '676305', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2248, '676306', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2249, '676307', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2250, '676308', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2251, '676309', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2252, '676310', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2253, '676311', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2254, '676312', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2255, '676313', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2256, '676315', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2257, '676317', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2258, '676318', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2259, '676319', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2260, '676320', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2261, '676501', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2262, '676502', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2263, '676503', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2264, '676504', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2265, '676505', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2266, '676506', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2267, '676507', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2268, '676508', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2269, '676509', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2270, '676510', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2271, '676511', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2272, '676513', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2273, '676514', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2274, '676515', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2275, '676517', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2276, '676519', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2277, '676521', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2278, '676522', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2279, '676523', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2280, '676525', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2281, '676528', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2282, '676541', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2283, '676542', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2284, '676551', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2285, '676552', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2286, '676553', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2287, '676554', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2288, '676556', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2289, '676557', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2290, '676561', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2291, '676562', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2292, '678001', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2293, '678002', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2294, '678003', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2295, '678004', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2296, '678005', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2297, '678006', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2298, '678007', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2299, '678008', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2300, '678009', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2301, '678010', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2302, '678011', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2303, '678012', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2304, '678013', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2305, '678014', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2306, '678015', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2307, '678017', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2308, '678018', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2309, '678019', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2310, '678020', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2311, '678101', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2312, '678102', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2313, '678103', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2314, '678104', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2315, '678501', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2316, '678502', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2317, '678503', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2318, '678504', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2319, '678505', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2320, '678506', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2321, '678507', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2322, '678508', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2323, '678510', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2324, '678512', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2325, '678531', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2326, '678532', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2327, '678534', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2328, '678541', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2329, '678542', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2330, '678543', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2331, '678544', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2332, '678545', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2333, '678546', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2334, '678547', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2335, '678548', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2336, '678551', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2337, '678552', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2338, '678553', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2339, '678554', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2340, '678555', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2341, '678556', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2342, '678557', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2343, '678558', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2344, '678559', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2345, '678571', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2346, '678572', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2347, '678573', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2348, '678574', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2349, '678575', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2350, '678581', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2351, '678582', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2352, '678583', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2353, '678589', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2354, '678591', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2355, '678592', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2356, '678593', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2357, '678594', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2358, '678595', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2359, '678596', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2360, '678597', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2361, '678598', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2362, '678600', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2363, '678601', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2364, '678605', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2365, '678609', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2366, '678611', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2367, '678612', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2368, '678613', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2369, '678614', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2370, '678615', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2371, '678616', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2372, '678621', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2373, '678622', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2374, '678623', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2375, '678624', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2376, '678631', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2377, '678632', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2378, '678633', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2379, '678634', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2380, '678635', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2381, '678637', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2382, '678641', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2383, '678642', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2384, '678651', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2385, '678661', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2386, '678671', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2387, '678681', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2388, '678682', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2389, '678683', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2390, '678684', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2391, '678685', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2392, '678686', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2393, '678687', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2394, '678688', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2395, '678689', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2396, '678701', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2397, '678702', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2398, '678703', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2399, '678704', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2400, '678705', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2401, '678706', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2402, '678707', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2403, '678709', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2404, '678721', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2405, '678722', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2406, '678731', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2407, '678732', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2408, '678733', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2409, '678752', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2410, '678761', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2411, '678762', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2412, '679101', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2413, '679102', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2414, '679103', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2415, '679104', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2416, '679105', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2417, '679106', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2418, '679121', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2419, '679122', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2420, '679123', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2421, '679124', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2422, '679125', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2423, '679301', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2424, '679302', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2425, '679303', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2426, '679304', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2427, '679305', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2428, '679306', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2429, '679307', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2430, '679308', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2431, '679309', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2432, '679310', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2433, '679311', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2434, '679312', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2435, '679313', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2436, '679314', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2437, '679321', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2438, '679322', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2439, '679323', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2440, '679324', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2441, '679325', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2442, '679326', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2443, '679327', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2444, '679328', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2445, '679329', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2446, '679330', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2447, '679331', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2448, '679332', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2449, '679333', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2450, '679334', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2451, '679335', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2452, '679336', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2453, '679337', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2454, '679338', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2455, '679339', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2456, '679340', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2457, '679342', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2458, '679343', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2459, '679344', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2460, '679348', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2461, '679350', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2462, '679351', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2463, '679352', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2464, '679354', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2465, '679355', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2466, '679357', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2467, '679501', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2468, '679502', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2469, '679503', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2470, '679504', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2471, '679505', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2472, '679506', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2473, '679511', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2474, '679512', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2475, '679513', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2476, '679514', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2477, '679515', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2478, '679516', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2479, '679517', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2480, '679518', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2481, '679521', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2482, '679522', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2483, '679523', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2484, '679531', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2485, '679532', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2486, '679533', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2487, '679534', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2488, '679535', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2489, '679536', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2490, '679537', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2491, '679538', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2492, '679551', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2493, '679552', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2494, '679553', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2495, '679554', 'Palakkad', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2496, '679561', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2497, '679562', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2498, '679563', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2499, '679564', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2500, '679571', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2501, '679572', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2502, '679573', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2503, '679574', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2504, '679575', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2505, '679576', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2506, '679577', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2507, '679578', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2508, '679579', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2509, '679580', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2510, '679581', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2511, '679582', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2512, '679583', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2513, '679584', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2514, '679585', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2515, '679586', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2516, '679587', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2517, '679588', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2518, '679589', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2519, '679591', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2520, '679592', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2521, '679594', 'Malappuram', 'Calicut', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2522, '680001', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2523, '680002', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2524, '680003', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2525, '680004', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2526, '680005', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2527, '680006', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2528, '680007', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2529, '680008', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2530, '680009', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2531, '680010', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2532, '680011', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2533, '680012', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2534, '680013', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2535, '680014', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2536, '680015', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2537, '680016', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2538, '680017', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2539, '680018', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2540, '680020', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2541, '680021', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2542, '680022', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2543, '680026', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2544, '680027', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2545, '680028', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2546, '680101', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2547, '680102', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2548, '680103', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2549, '680104', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2550, '680121', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2551, '680122', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2552, '680123', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2553, '680124', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2554, '680125', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2555, '680301', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2556, '680302', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2557, '680303', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2558, '680304', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2559, '680305', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2560, '680306', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2561, '680307', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2562, '680308', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2563, '680309', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2564, '680310', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2565, '680311', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2566, '680312', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2567, '680313', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2568, '680314', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2569, '680316', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2570, '680317', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2571, '680319', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2572, '680321', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2573, '680322', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2574, '680323', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2575, '680325', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2576, '680501', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2577, '680502', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2578, '680503', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2579, '680504', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2580, '680505', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2581, '680506', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2582, '680507', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2583, '680508', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2584, '680509', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2585, '680510', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2586, '680511', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2587, '680512', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2588, '680513', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2589, '680514', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2590, '680515', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2591, '680516', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2592, '680517', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2593, '680518', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2594, '680519', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2595, '680520', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2596, '680521', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2597, '680522', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2598, '680523', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2599, '680524', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2600, '680541', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2601, '680542', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2602, '680543', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2603, '680544', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2604, '680545', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2605, '680546', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2606, '680547', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2607, '680549', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2608, '680551', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2609, '680552', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2610, '680553', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2611, '680554', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2612, '680555', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2613, '680561', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2614, '680562', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2615, '680563', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2616, '680564', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2617, '680565', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2618, '680566', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2619, '680567', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2620, '680568', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2621, '680569', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2622, '680570', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2623, '680571', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2624, '680573', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2625, '680574', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2626, '680575', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2627, '680581', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2628, '680582', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2629, '680583', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2630, '680584', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2631, '680585', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2632, '680586', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2633, '680587', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2634, '680588', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2635, '680589', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2636, '680590', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2637, '680591', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop');
INSERT INTO `delivery_locations` (`id`, `Pincode`, `Location`, `RL Location`, `RM Control`, `State`, `Service Type`, `Services`) VALUES
(2638, '680592', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2639, '680593', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2640, '680594', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2641, '680595', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2642, '680596', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2643, '680597', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2644, '680600', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2645, '680601', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2646, '680602', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2647, '680603', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2648, '680604', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2649, '680608', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2650, '680610', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2651, '680611', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2652, '680612', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2653, '680613', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2654, '680614', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2655, '680615', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2656, '680616', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2657, '680617', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2658, '680618', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2659, '680619', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2660, '680620', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2661, '680621', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2662, '680623', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2663, '680631', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2664, '680641', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2665, '680642', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2666, '680651', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2667, '680652', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2668, '680653', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2669, '680654', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2670, '680655', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2671, '680656', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2672, '680657', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2673, '680661', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2674, '680662', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2675, '680663', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2676, '680664', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2677, '680665', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2678, '680666', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2679, '680667', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2680, '680668', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2681, '680669', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2682, '680670', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2683, '680671', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2684, '680672', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2685, '680673', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2686, '680681', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2687, '680682', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2688, '680683', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2689, '680684', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2690, '680685', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2691, '680686', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2692, '680687', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2693, '680688', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2694, '680689', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2695, '680691', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2696, '680693', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2697, '680695', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2698, '680697', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2699, '680699', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2700, '680701', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2701, '680702', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2702, '680703', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2703, '680711', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2704, '680712', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2705, '680721', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2706, '680722', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2707, '680724', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2708, '680731', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2709, '680732', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2710, '680733', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2711, '680734', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2712, '680735', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2713, '680741', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2714, '680751', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2715, '680752', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2716, '680771', 'Thrissur', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2717, '682001', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2718, '682002', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2719, '682003', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2720, '682004', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2721, '682005', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2722, '682006', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2723, '682007', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2724, '682008', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2725, '682009', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2726, '682010', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2727, '682011', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2728, '682012', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2729, '682013', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2730, '682014', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2731, '682015', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2732, '682016', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2733, '682017', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2734, '682018', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2735, '682019', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2736, '682020', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2737, '682021', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2738, '682022', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2739, '682023', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2740, '682024', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2741, '682025', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2742, '682026', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2743, '682027', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2744, '682028', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2745, '682029', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2746, '682030', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2747, '682031', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2748, '682032', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2749, '682033', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2750, '682034', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2751, '682035', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2752, '682036', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2753, '682037', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2754, '682038', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2755, '682039', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2756, '682040', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2757, '682041', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2758, '682042', 'Cochin', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2759, '682301', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2760, '682302', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2761, '682303', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2762, '682304', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2763, '682305', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2764, '682306', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2765, '682307', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2766, '682308', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2767, '682309', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2768, '682310', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2769, '682311', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2770, '682312', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2771, '682313', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2772, '682314', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2773, '682315', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2774, '682316', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2775, '682319', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2776, '682320', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2777, '682501', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2778, '682502', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2779, '682503', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2780, '682504', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2781, '682505', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2782, '682506', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2783, '682507', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2784, '682508', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2785, '682509', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2786, '682510', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2787, '682511', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2788, '683101', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2789, '683102', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2790, '683104', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2791, '683105', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2792, '683106', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2793, '683107', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2794, '683108', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2795, '683109', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2796, '683110', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2797, '683111', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2798, '683112', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2799, '683501', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2800, '683502', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2801, '683503', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2802, '683511', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2803, '683512', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2804, '683513', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2805, '683514', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2806, '683515', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2807, '683516', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2808, '683517', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2809, '683518', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2810, '683519', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2811, '683520', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2812, '683521', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2813, '683522', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2814, '683524', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2815, '683541', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2816, '683542', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2817, '683543', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2818, '683544', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2819, '683545', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2820, '683546', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2821, '683547', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2822, '683548', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2823, '683549', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2824, '683550', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2825, '683553', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2826, '683554', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2827, '683556', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2828, '683557', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2829, '683561', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2830, '683562', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2831, '683563', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2832, '683564', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2833, '683565', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2834, '683571', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2835, '683572', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2836, '683573', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2837, '683574', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2838, '683575', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2839, '683576', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2840, '683577', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2841, '683578', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2842, '683579', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2843, '683580', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2844, '683581', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2845, '683582', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2846, '683583', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2847, '683584', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2848, '683585', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2849, '683586', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2850, '683587', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2851, '683589', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2852, '683593', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2853, '683594', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(2854, '685501', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2855, '685502', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2856, '685503', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2857, '685505', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2858, '685506', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2859, '685507', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2860, '685508', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2861, '685509', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2862, '685510', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2863, '685511', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2864, '685512', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2865, '685514', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2866, '685515', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2867, '685531', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2868, '685532', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2869, '685533', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2870, '685535', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2871, '685536', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2872, '685537', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2873, '685538', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2874, '685539', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2875, '685551', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2876, '685552', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2877, '685553', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2878, '685554', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2879, '685556', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2880, '685561', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2881, '685562', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2882, '685563', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2883, '685564', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2884, '685565', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2885, '685566', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2886, '685569', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2887, '685571', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2888, '685581', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2889, '685582', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2890, '685583', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2891, '685584', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2892, '685585', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2893, '685586', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2894, '685587', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2895, '685588', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2896, '685589', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2897, '685590', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2898, '685591', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2899, '685592', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2900, '685595', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2901, '685601', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2902, '685602', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2903, '685603', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2904, '685604', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2905, '685605', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2906, '685606', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2907, '685611', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2908, '685612', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2909, '685613', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2910, '685614', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2911, '685615', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2912, '685616', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2913, '685617', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2914, '685618', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2915, '685619', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2916, '685620', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2917, '685621', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2918, '686001', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2919, '686002', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2920, '686003', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2921, '686004', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2922, '686005', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2923, '686006', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2924, '686007', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2925, '686008', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2926, '686009', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2927, '686010', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2928, '686011', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2929, '686012', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2930, '686013', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2931, '686014', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2932, '686015', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2933, '686016', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2934, '686017', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2935, '686018', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2936, '686019', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2937, '686020', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2938, '686021', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2939, '686022', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2940, '686023', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2941, '686024', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2942, '686025', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2943, '686026', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2944, '686027', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2945, '686029', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2946, '686030', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2947, '686032', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2948, '686033', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2949, '686034', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2950, '686035', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2951, '686036', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2952, '686037', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2953, '686038', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2954, '686039', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2955, '686041', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2956, '686101', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2957, '686102', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2958, '686103', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2959, '686104', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2960, '686105', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2961, '686106', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2962, '686107', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2963, '686121', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2964, '686122', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2965, '686123', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2966, '686124', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2967, '686141', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2968, '686142', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2969, '686143', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2970, '686144', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2971, '686145', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2972, '686146', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2973, '686501', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2974, '686502', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2975, '686503', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2976, '686504', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2977, '686505', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2978, '686506', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2979, '686507', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2980, '686508', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2981, '686509', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2982, '686510', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2983, '686511', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2984, '686512', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2985, '686513', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2986, '686514', 'Idukki', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2987, '686515', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2988, '686516', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2989, '686517', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2990, '686518', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2991, '686519', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2992, '686520', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2993, '686521', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2994, '686522', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2995, '686523', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2996, '686531', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2997, '686532', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2998, '686533', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(2999, '686534', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3000, '686535', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3001, '686536', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3002, '686537', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3003, '686538', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3004, '686539', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3005, '686540', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3006, '686541', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3007, '686542', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3008, '686543', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3009, '686545', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3010, '686546', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3011, '686547', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3012, '686548', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3013, '686549', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3014, '686550', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3015, '686552', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3016, '686553', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3017, '686555', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3018, '686560', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3019, '686561', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3020, '686562', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3021, '686563', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3022, '686564', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3023, '686566', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3024, '686568', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3025, '686571', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3026, '686572', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3027, '686573', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3028, '686574', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3029, '686575', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3030, '686576', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3031, '686577', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3032, '686578', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3033, '686579', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3034, '686580', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3035, '686581', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3036, '686582', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3037, '686583', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3038, '686584', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3039, '686585', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3040, '686586', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3041, '686587', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3042, '686588', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3043, '686589', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3044, '686591', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3045, '686592', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3046, '686594', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3047, '686595', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3048, '686596', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3049, '686597', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3050, '686600', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3051, '686601', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3052, '686602', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3053, '686603', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3054, '686604', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3055, '686605', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3056, '686606', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3057, '686607', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3058, '686608', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3059, '686609', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3060, '686610', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3061, '686611', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3062, '686612', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3063, '686613', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3064, '686614', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3065, '686615', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3066, '686616', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3067, '686617', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3068, '686620', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3069, '686631', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3070, '686632', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3071, '686634', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3072, '686635', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3073, '686636', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3074, '686637', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3075, '686638', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3076, '686640', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3077, '686641', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3078, '686642', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3079, '686651', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3080, '686652', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3081, '686653', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3082, '686655', 'Kottayam', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3083, '686661', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3084, '686662', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3085, '686663', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3086, '686664', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3087, '686665', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3088, '686666', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3089, '686667', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3090, '686668', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3091, '686669', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3092, '686670', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3093, '686671', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3094, '686672', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3095, '686673', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3096, '686674', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3097, '686676', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3098, '686677', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3099, '686679', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3100, '686681', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3101, '686686', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3102, '686687', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3103, '686689', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3104, '686691', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3105, '686692', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3106, '686693', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3107, '686695', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3108, '686698', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3109, '686721', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3110, '686723', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3111, '686726', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3112, '686730', 'Ernakulam', 'Cochin', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3113, '688001', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3114, '688002', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3115, '688003', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3116, '688004', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3117, '688005', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3118, '688006', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3119, '688007', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3120, '688008', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3121, '688009', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3122, '688011', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3123, '688012', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3124, '688013', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3125, '688014', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3126, '688501', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3127, '688502', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3128, '688503', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3129, '688504', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3130, '688505', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3131, '688506', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3132, '688508', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3133, '688521', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3134, '688522', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3135, '688523', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3136, '688524', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3137, '688525', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3138, '688526', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3139, '688527', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3140, '688528', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3141, '688529', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3142, '688530', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3143, '688531', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3144, '688532', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3145, '688533', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3146, '688534', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3147, '688535', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3148, '688536', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3149, '688538', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3150, '688539', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3151, '688540', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3152, '688541', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3153, '688542', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3154, '688543', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3155, '688544', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3156, '688545', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3157, '688546', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3158, '688547', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3159, '688548', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3160, '688549', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3161, '688550', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3162, '688552', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3163, '688554', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3164, '688555', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3165, '688556', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3166, '688557', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3167, '688558', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3168, '688559', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3169, '688561', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3170, '688562', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3171, '688563', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3172, '688564', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop');
INSERT INTO `delivery_locations` (`id`, `Pincode`, `Location`, `RL Location`, `RM Control`, `State`, `Service Type`, `Services`) VALUES
(3173, '688565', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3174, '688566', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3175, '688567', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3176, '688570', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3177, '688581', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3178, '688582', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3179, '688583', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3180, '688584', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3181, '688587', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3182, '689101', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3183, '689102', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3184, '689103', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3185, '689104', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3186, '689105', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3187, '689106', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3188, '689107', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3189, '689108', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3190, '689109', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3191, '689110', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3192, '689111', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3193, '689112', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3194, '689113', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3195, '689114', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3196, '689115', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3197, '689121', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3198, '689122', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3199, '689123', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3200, '689124', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3201, '689125', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3202, '689126', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3203, '689501', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3204, '689502', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3205, '689503', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3206, '689504', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3207, '689505', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3208, '689506', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3209, '689507', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3210, '689508', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3211, '689509', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3212, '689510', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3213, '689511', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3214, '689512', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3215, '689513', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3216, '689514', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3217, '689515', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3218, '689516', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3219, '689517', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3220, '689518', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3221, '689519', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3222, '689520', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3223, '689521', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3224, '689531', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3225, '689532', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3226, '689533', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3227, '689541', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3228, '689542', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3229, '689543', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3230, '689544', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3231, '689545', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3232, '689546', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3233, '689547', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3234, '689548', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3235, '689549', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3236, '689550', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3237, '689551', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3238, '689571', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3239, '689572', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3240, '689573', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3241, '689575', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3242, '689576', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3243, '689577', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3244, '689578', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3245, '689579', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3246, '689581', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3247, '689582', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3248, '689583', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3249, '689584', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3250, '689585', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3251, '689586', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3252, '689587', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3253, '689588', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3254, '689589', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3255, '689590', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3256, '689591', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3257, '689592', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3258, '689594', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3259, '689595', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3260, '689596', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3261, '689598', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3262, '689602', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3263, '689603', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3264, '689611', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3265, '689612', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3266, '689613', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3267, '689614', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3268, '689615', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3269, '689616', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3270, '689620', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3271, '689621', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3272, '689622', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3273, '689624', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3274, '689625', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3275, '689626', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3276, '689627', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3277, '689629', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3278, '689630', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3279, '689632', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3280, '689641', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3281, '689642', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3282, '689643', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3283, '689644', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3284, '689645', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3285, '689646', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3286, '689647', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3287, '689648', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3288, '689649', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3289, '689650', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3290, '689652', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3291, '689653', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3292, '689654', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3293, '689656', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3294, '689657', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3295, '689659', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3296, '689660', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3297, '689661', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3298, '689662', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3299, '689663', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3300, '689664', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3301, '689665', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3302, '689666', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3303, '689667', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3304, '689668', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3305, '689671', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3306, '689672', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3307, '689673', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3308, '689674', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3309, '689675', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3310, '689676', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3311, '689677', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3312, '689678', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3313, '689680', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3314, '689681', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3315, '689682', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3316, '689691', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3317, '689692', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3318, '689693', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3319, '689694', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3320, '689695', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3321, '689696', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3322, '689698', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3323, '689699', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3324, '689703', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3325, '689706', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3326, '689711', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3327, '689721', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3328, '689722', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3329, '689723', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3330, '690101', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3331, '690102', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3332, '690103', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3333, '690104', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3334, '690105', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3335, '690106', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3336, '690107', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3337, '690108', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3338, '690109', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3339, '690110', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3340, '690501', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3341, '690502', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3342, '690503', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3343, '690504', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3344, '690505', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3345, '690506', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3346, '690507', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3347, '690508', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3348, '690509', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3349, '690510', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3350, '690511', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3351, '690512', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3352, '690513', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3353, '690514', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3354, '690515', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3355, '690516', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3356, '690517', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3357, '690518', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3358, '690519', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3359, '690520', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3360, '690521', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3361, '690522', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3362, '690523', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3363, '690524', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3364, '690525', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3365, '690527', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3366, '690528', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3367, '690529', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3368, '690530', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3369, '690531', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3370, '690532', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3371, '690533', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3372, '690534', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3373, '690535', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3374, '690536', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3375, '690537', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3376, '690538', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3377, '690539', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3378, '690540', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3379, '690541', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3380, '690542', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3381, '690543', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3382, '690544', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3383, '690546', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3384, '690547', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3385, '690548', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3386, '690549', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3387, '690550', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3388, '690551', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3389, '690552', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3390, '690553', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3391, '690555', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3392, '690556', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3393, '690557', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3394, '690558', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3395, '690559', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3396, '690560', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3397, '690561', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3398, '690563', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3399, '690564', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3400, '690565', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3401, '690566', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3402, '690567', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3403, '690568', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3404, '690569', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3405, '690570', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3406, '690571', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3407, '690572', 'Alappuzha', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3408, '690573', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3409, '690574', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3410, '691001', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3411, '691002', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3412, '691003', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3413, '691004', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3414, '691005', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3415, '691006', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3416, '691007', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3417, '691008', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3418, '691009', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3419, '691010', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3420, '691011', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3421, '691012', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3422, '691013', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3423, '691014', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3424, '691015', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3425, '691016', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3426, '691017', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3427, '691018', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3428, '691019', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3429, '691020', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3430, '691021', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3431, '691301', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3432, '691302', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3433, '691303', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3434, '691304', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3435, '691305', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3436, '691306', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3437, '691307', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3438, '691308', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3439, '691309', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3440, '691310', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3441, '691311', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3442, '691312', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3443, '691315', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3444, '691316', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3445, '691317', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3446, '691318', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3447, '691320', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3448, '691321', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3449, '691322', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3450, '691324', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3451, '691326', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3452, '691329', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3453, '691330', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3454, '691331', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3455, '691332', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3456, '691333', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3457, '691334', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3458, '691500', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3459, '691501', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3460, '691502', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3461, '691503', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3462, '691504', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3463, '691505', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3464, '691506', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3465, '691507', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3466, '691508', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3467, '691509', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3468, '691510', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3469, '691511', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3470, '691512', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3471, '691513', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3472, '691514', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3473, '691515', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3474, '691516', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3475, '691517', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3476, '691518', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3477, '691519', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3478, '691520', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3479, '691521', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3480, '691523', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3481, '691524', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3482, '691525', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3483, '691526', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3484, '691528', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3485, '691529', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3486, '691530', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3487, '691531', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3488, '691532', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3489, '691534', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3490, '691535', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3491, '691536', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3492, '691537', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3493, '691538', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3494, '691539', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3495, '691540', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3496, '691541', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3497, '691542', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3498, '691543', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3499, '691544', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3500, '691545', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3501, '691546', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3502, '691547', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3503, '691548', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3504, '691550', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3505, '691551', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3506, '691552', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3507, '691553', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3508, '691554', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3509, '691555', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3510, '691556', 'Pathanamthitta', 'Cochin', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3511, '691557', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3512, '691559', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3513, '691560', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3514, '691562', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3515, '691566', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3516, '691571', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3517, '691572', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3518, '691573', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3519, '691574', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3520, '691576', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3521, '691577', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3522, '691578', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3523, '691580', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3524, '691581', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3525, '691582', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3526, '691583', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3527, '691584', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3528, '691585', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3529, '691587', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3530, '691588', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3531, '691589', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3532, '691590', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3533, '691601', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3534, '691602', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3535, '691604', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3536, '691623', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3537, '691625', 'Kollam', 'Trivandrum', 'South', 'Kerala', 'Limited Services', 'Pick And Drop'),
(3538, '695001', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3539, '695002', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3540, '695003', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3541, '695004', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3542, '695005', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3543, '695006', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3544, '695007', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3545, '695008', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3546, '695009', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3547, '695010', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3548, '695011', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3549, '695012', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3550, '695013', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3551, '695014', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3552, '695015', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3553, '695016', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3554, '695017', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3555, '695018', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3556, '695019', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3557, '695020', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3558, '695021', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3559, '695022', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3560, '695023', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3561, '695024', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3562, '695025', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3563, '695026', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3564, '695027', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3565, '695028', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3566, '695029', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3567, '695030', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3568, '695031', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3569, '695032', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3570, '695033', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3571, '695034', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3572, '695035', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3573, '695036', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3574, '695038', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3575, '695039', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3576, '695040', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3577, '695042', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3578, '695043', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3579, '695099', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3580, '695101', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3581, '695102', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3582, '695103', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3583, '695104', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3584, '695120', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3585, '695121', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3586, '695122', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3587, '695123', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3588, '695124', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3589, '695125', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3590, '695126', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3591, '695127', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3592, '695130', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3593, '695131', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3594, '695132', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3595, '695133', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3596, '695141', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3597, '695142', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3598, '695143', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3599, '695144', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3600, '695145', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3601, '695146', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3602, '695301', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3603, '695302', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3604, '695303', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3605, '695304', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3606, '695305', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3607, '695306', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3608, '695307', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3609, '695308', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3610, '695309', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3611, '695310', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3612, '695311', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3613, '695312', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3614, '695313', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3615, '695314', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3616, '695315', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3617, '695316', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3618, '695317', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3619, '695318', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3620, '695501', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3621, '695502', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3622, '695503', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3623, '695504', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3624, '695505', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3625, '695506', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3626, '695507', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3627, '695508', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3628, '695509', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3629, '695510', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3630, '695512', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3631, '695513', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3632, '695521', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3633, '695522', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3634, '695523', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3635, '695524', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3636, '695525', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3637, '695526', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3638, '695527', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3639, '695528', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3640, '695541', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3641, '695542', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3642, '695543', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3643, '695544', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3644, '695547', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3645, '695551', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3646, '695557', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3647, '695560', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3648, '695561', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3649, '695562', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3650, '695563', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3651, '695564', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3652, '695571', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3653, '695572', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3654, '695573', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3655, '695574', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3656, '695575', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3657, '695581', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3658, '695582', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3659, '695583', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3660, '695584', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3661, '695585', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3662, '695586', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3663, '695587', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3664, '695588', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3665, '695589', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3666, '695601', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3667, '695602', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3668, '695603', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3669, '695604', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3670, '695605', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3671, '695606', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3672, '695607', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3673, '695608', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3674, '695609', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3675, '695610', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3676, '695611', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3677, '695612', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3678, '695614', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3679, '695615', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3680, '695616', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3681, '695618', 'Trivandrum', 'Trivandrum', 'South', 'Kerala', 'Normal Service', 'All Services'),
(3682, '700000', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3683, '700001', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3684, '700002', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3685, '700003', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3686, '700004', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services');
INSERT INTO `delivery_locations` (`id`, `Pincode`, `Location`, `RL Location`, `RM Control`, `State`, `Service Type`, `Services`) VALUES
(3687, '700005', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3688, '700006', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3689, '700007', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3690, '700008', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3691, '700009', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3692, '700010', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3693, '700011', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3694, '700012', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3695, '700013', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3696, '700014', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3697, '700015', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3698, '700016', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3699, '700017', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3700, '700018', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3701, '700019', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3702, '700020', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3703, '700021', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3704, '700022', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3705, '700023', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3706, '700024', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3707, '700025', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3708, '700026', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3709, '700027', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3710, '700028', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3711, '700029', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3712, '700030', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3713, '700031', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3714, '700032', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3715, '700033', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3716, '700034', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3717, '700035', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3718, '700036', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3719, '700037', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3720, '700038', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3721, '700039', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3722, '700040', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3723, '700041', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3724, '700042', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3725, '700043', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3726, '700044', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3727, '700045', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3728, '700046', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3729, '700047', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3730, '700048', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3731, '700049', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3732, '700050', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3733, '700051', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3734, '700052', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3735, '700053', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3736, '700054', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3737, '700055', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3738, '700056', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3739, '700057', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3740, '700058', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3741, '700059', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3742, '700060', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3743, '700061', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3744, '700062', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3745, '700063', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3746, '700064', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3747, '700065', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3748, '700066', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3749, '700067', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3750, '700068', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3751, '700069', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3752, '700070', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3753, '700071', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3754, '700072', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3755, '700073', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3756, '700074', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3757, '700075', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3758, '700076', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3759, '700077', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3760, '700078', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3761, '700079', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3762, '700080', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3763, '700081', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3764, '700082', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3765, '700083', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3766, '700084', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3767, '700085', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3768, '700086', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3769, '700087', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3770, '700088', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3771, '700089', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3772, '700090', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3773, '700091', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3774, '700092', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3775, '700093', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3776, '700094', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3777, '700095', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3778, '700096', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3779, '700097', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3780, '700098', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3781, '700099', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3782, '700100', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3783, '700101', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3784, '700102', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3785, '700103', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3786, '700104', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Limited Services', 'Pick And Drop'),
(3787, '700105', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3788, '700106', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3789, '700107', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3790, '700108', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Limited Services', 'Pick And Drop'),
(3791, '700109', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3792, '700110', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3793, '700111', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3794, '700112', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3795, '700113', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3796, '700114', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3797, '700115', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3798, '700116', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3799, '700117', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3800, '700118', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3801, '700120', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Limited Services', 'Pick And Drop'),
(3802, '700121', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3803, '700122', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Limited Services', 'Pick And Drop'),
(3804, '700123', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3805, '700124', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Limited Services', 'Pick And Drop'),
(3806, '700125', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3807, '700126', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3808, '700127', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3809, '700128', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Limited Services', 'Pick And Drop'),
(3810, '700129', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3811, '700130', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3812, '700131', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3813, '700132', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Limited Services', 'Pick And Drop'),
(3814, '700133', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3815, '700134', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3816, '700135', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3817, '700136', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3818, '700141', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3819, '700143', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3820, '700147', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3821, '700148', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3822, '700149', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3823, '700150', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3824, '700151', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3825, '700152', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3826, '700153', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3827, '700154', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3828, '700155', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3829, '700156', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3830, '700157', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3831, '700159', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3832, '700160', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3833, '700161', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3834, '700162', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3835, '700731', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Limited Services', 'Pick And Drop'),
(3836, '701101', 'Howrah', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3837, '701102', 'Howrah', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3838, '711001', 'Howrah', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3839, '711101', 'Howrah', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3840, '711102', 'Howrah', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3841, '711103', 'Howrah', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3842, '711104', 'Howrah', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3843, '711106', 'Howrah', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3844, '711108', 'Howrah', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3845, '711111', 'Howrah', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3846, '711113', 'Howrah', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3847, '713301', 'Asansol', 'Asansol', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3848, '713302', 'Asansol', 'Asansol', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3849, '713303', 'Asansol', 'Asansol', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3850, '713304', 'Asansol', 'Asansol', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3851, '713305', 'Asansol', 'Asansol', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3852, '713325', 'Asansol', 'Asansol', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3853, '713332', 'Asansol', 'Asansol', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3854, '713334', 'Asansol', 'Asansol', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3855, '713336', 'Asansol', 'Asansol', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3856, '713340', 'Asansol', 'Asansol', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3857, '713359', 'Asansol', 'Asansol', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3858, '713371', 'Asansol', 'Asansol', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3859, '732101', 'Malda', 'Malda', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3860, '732102', 'Malda', 'Malda', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3861, '732103', 'Malda', 'Malda', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3862, '732124', 'Malda', 'Malda', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3863, '732128', 'Malda', 'Malda', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3864, '732142', 'Malda', 'Malda', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3865, '732201', 'Malda', 'Malda', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3866, '732206', 'Malda', 'Malda', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3867, '734001', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3868, '734002', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3869, '734003', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3870, '734004', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3871, '734005', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3872, '734006', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3873, '734007', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3874, '734008', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3875, '734009', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3876, '734010', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3877, '734011', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3878, '734012', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3879, '734013', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3880, '734014', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3881, '734015', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3882, '735135', 'Siliguri', 'Siliguri', 'East', 'West Bengal', 'Limited Services', 'Pick And Drop'),
(3883, '741159', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3884, '741167', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3885, '741505', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3886, '743120', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3887, '743121', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3888, '743122', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3889, '743155', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3890, '743170', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3891, '743175', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3892, '743176', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3893, '743177', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3894, '743178', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3895, '743179', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3896, '743180', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3897, '743186', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3898, '743187', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3899, '743188', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3900, '743200', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3901, '743201', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3902, '743202', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3903, '743203', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3904, '743204', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3905, '743211', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3906, '743212', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3907, '743221', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3908, '743232', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3909, '743234', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3910, '743244', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3911, '743247', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3912, '743248', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3913, '743249', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3914, '743250', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3915, '743251', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3916, '743270', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3917, '743274', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3918, '743276', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3919, '743287', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3920, '743288', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3921, '743290', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3922, '743291', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3923, '743293', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3924, '743294', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Limited Services', 'Pick And Drop'),
(3925, '743295', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3926, '743296', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3927, '743297', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3928, '743298', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Limited Services', 'Pick And Drop'),
(3929, '743299', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3930, '743383', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3931, '743401', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3932, '743405', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3933, '743423', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3934, '743427', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3935, '743428', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3936, '743435', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3937, '743437', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3938, '743438', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3939, '743439', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3940, '743441', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3941, '743442', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3942, '743445', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3943, '743446', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3944, '743456', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3945, '743486', 'North 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3946, '743510', 'South 24 Parganas', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3947, '743700', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3948, '743701', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3949, '743702', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3950, '743704', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3951, '743706', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3952, '743707', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3953, '743708', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3954, '743710', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3955, '743711', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3956, '743744', 'Kolkata', 'Kolkata', 'East', 'West Bengal', 'Normal Service', 'All Services'),
(3957, '750017', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3958, '750019', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Limited Services', 'Pick And Drop'),
(3959, '751001', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3960, '751002', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3961, '751003', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3962, '751004', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3963, '751005', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3964, '751006', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3965, '751007', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3966, '751008', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3967, '751009', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3968, '751010', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3969, '751011', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3970, '751012', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3971, '751013', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3972, '751014', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3973, '751015', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3974, '751016', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3975, '751017', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3976, '751018', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3977, '751019', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3978, '751020', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3979, '751021', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3980, '751022', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3981, '751023', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3982, '751024', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3983, '751025', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3984, '751029', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3985, '751030', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3986, '751031', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3987, '751038', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Normal Service', 'All Services'),
(3988, '751051', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Limited Services', 'Pick And Drop'),
(3989, '752054', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Limited Services', 'Pick And Drop'),
(3990, '752101', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Limited Services', 'Pick And Drop'),
(3991, '754001', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Limited Services', 'Pick And Drop'),
(3992, '754005', 'Bhubaneshwar', 'Bhubaneshwar', 'East', 'Orissa', 'Limited Services', 'Pick And Drop'),
(3993, '781001', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(3994, '781002', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(3995, '781003', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(3996, '781004', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(3997, '781005', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(3998, '781006', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(3999, '781007', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4000, '781008', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4001, '781009', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4002, '781010', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4003, '781011', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4004, '781012', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4005, '781013', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4006, '781014', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4007, '781015', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Limited Services', 'Pick And Drop'),
(4008, '781016', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4009, '781017', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Limited Services', 'Pick And Drop'),
(4010, '781018', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4011, '781019', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4012, '781020', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Limited Services', 'Pick And Drop'),
(4013, '781021', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4014, '781022', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4015, '781023', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Limited Services', 'Pick And Drop'),
(4016, '781024', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4017, '781025', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4018, '781026', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4019, '781027', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Limited Services', 'Pick And Drop'),
(4020, '781028', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4021, '781029', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4022, '781030', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Limited Services', 'Pick And Drop'),
(4023, '781031', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Limited Services', 'Pick And Drop'),
(4024, '781032', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4025, '781033', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Limited Services', 'Pick And Drop'),
(4026, '781034', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4027, '781035', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4028, '781036', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4029, '781037', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4030, '781038', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4031, '781039', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Limited Services', 'Pick And Drop'),
(4032, '781040', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Limited Services', 'Pick And Drop'),
(4033, '781171', 'Guwahati', 'Guwahati', 'East', 'Assam', 'Normal Service', 'All Services'),
(4034, '800001', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4035, '800002', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4036, '800003', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4037, '800004', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4038, '800005', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4039, '800006', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4040, '800007', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4041, '800008', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4042, '800009', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4043, '800010', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4044, '800011', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4045, '800012', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4046, '800013', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4047, '800014', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4048, '800015', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4049, '800016', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4050, '800017', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4051, '800018', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4052, '800019', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4053, '800020', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4054, '800021', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4055, '800022', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4056, '800023', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4057, '800024', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4058, '800025', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4059, '800026', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4060, '800027', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4061, '800028', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4062, '800029', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4063, '801105', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4064, '801501', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4065, '801502', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4066, '801503', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4067, '801504', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4068, '801505', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4069, '801506', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4070, '801507', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4071, '803201', 'Patna', 'Patna', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4072, '823001', 'Gaya', 'Gaya', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4073, '823002', 'Gaya', 'Gaya', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4074, '823003', 'Gaya', 'Gaya', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4075, '823004', 'Gaya', 'Gaya', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4076, '823005', 'Gaya', 'Gaya', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4077, '824231', 'Gaya', 'Gaya', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4078, '824234', 'Gaya', 'Gaya', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4079, '834001', 'Ranchi', 'Ranchi', 'East', 'Jharkhand', 'Normal Service', 'All Services'),
(4080, '834002', 'Ranchi', 'Ranchi', 'East', 'Jharkhand', 'Normal Service', 'All Services'),
(4081, '834003', 'Ranchi', 'Ranchi', 'East', 'Jharkhand', 'Normal Service', 'All Services'),
(4082, '834004', 'Ranchi', 'Ranchi', 'East', 'Jharkhand', 'Normal Service', 'All Services'),
(4083, '834005', 'Ranchi', 'Ranchi', 'East', 'Jharkhand', 'Normal Service', 'All Services'),
(4084, '834006', 'Ranchi', 'Ranchi', 'East', 'Jharkhand', 'Normal Service', 'All Services'),
(4085, '834008', 'Ranchi', 'Ranchi', 'East', 'Jharkhand', 'Normal Service', 'All Services'),
(4086, '834009', 'Ranchi', 'Ranchi', 'East', 'Jharkhand', 'Normal Service', 'All Services'),
(4087, '834010', 'Ranchi', 'Ranchi', 'East', 'Jharkhand', 'Normal Service', 'All Services'),
(4088, '834011', 'Ranchi', 'Ranchi', 'East', 'Jharkhand', 'Normal Service', 'All Services'),
(4089, '835202', 'Ranchi', 'Ranchi', 'East', 'Jharkhand', 'Normal Service', 'All Services'),
(4090, '835204', 'Ranchi', 'Ranchi', 'East', 'Jharkhand', 'Normal Service', 'All Services'),
(4091, '835215', 'Ranchi', 'Ranchi', 'East', 'Jharkhand', 'Normal Service', 'All Services'),
(4092, '835217', 'Ranchi', 'Ranchi', 'East', 'Jharkhand', 'Normal Service', 'All Services'),
(4093, '835222', 'Ranchi', 'Ranchi', 'East', 'Jharkhand', 'Normal Service', 'All Services'),
(4094, '846001', 'Darbhanga', 'Darbhanga', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4095, '846002', 'Darbhanga', 'Darbhanga', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4096, '846003', 'Darbhanga', 'Darbhanga', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4097, '846004', 'Darbhanga', 'Darbhanga', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4098, '846005', 'Darbhanga', 'Darbhanga', 'East', 'Bihar', 'Normal Service', 'All Services'),
(4099, '847115', 'Darbhanga', 'Darbhanga', 'East', 'Bihar', 'Normal Service', 'All Services');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'e3bTIJSA6OHaAnT7zPn2OISgZ2IBP1JtKRhVJAF4',
  `fcm_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`, `product_id`, `deal_type`) VALUES
(1, 'AUTUMN SALE', '2022-08-15', '2022-08-18', 1, 0, NULL, NULL, '2022-08-28-630b818d4cdf3.png', 'autumn-sale', '2022-08-15 15:11:07', '2022-08-28 14:54:05', NULL, 'flash_deal');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ranking` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add__state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(89, '2019_09_29_154000_create_payment_cards_table', 57),
(90, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(91, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(92, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(93, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(94, '2021_08_22_184834_add_publish_to_products_table', 57),
(95, '2021_09_08_211832_add_social_column_to_users_table', 57),
(96, '2021_09_13_165535_add_col_to_user', 57),
(97, '2021_09_19_061647_add_limit_to_coupons_table', 57),
(98, '2021_09_20_020716_add_coupon_code_to_orders_table', 57),
(99, '2021_09_23_003059_add_gst_to_sellers_table', 57),
(100, '2021_09_28_025411_create_order_transactions_table', 57),
(101, '2021_10_02_185124_create_carts_table', 57),
(102, '2021_10_02_190207_create_cart_shippings_table', 57),
(103, '2021_10_03_194334_add_col_order_table', 57),
(104, '2021_10_03_200536_add_shipping_cost', 57),
(105, '2021_10_04_153201_add_col_to_order_table', 57),
(106, '2021_10_07_172701_add_col_cart_shop_info', 57),
(107, '2021_10_07_184442_create_phone_or_email_verifications_table', 57),
(108, '2021_10_07_185416_add_user_table_email_verified', 57),
(109, '2021_10_11_192739_add_transaction_amount_table', 57),
(110, '2021_10_11_200850_add_order_verification_code', 57),
(111, '2021_10_12_083241_add_col_to_order_transaction', 57),
(112, '2021_10_12_084440_add_seller_id_to_order', 57),
(113, '2021_10_12_102853_change_col_type', 57),
(114, '2021_10_12_110434_add_col_to_admin_wallet', 57),
(115, '2021_10_12_110829_add_col_to_seller_wallet', 57),
(116, '2021_10_13_091801_add_col_to_admin_wallets', 57),
(117, '2021_10_13_092000_add_col_to_seller_wallets_tax', 57),
(118, '2021_10_13_165947_rename_and_remove_col_seller_wallet', 57),
(119, '2021_10_13_170258_rename_and_remove_col_admin_wallet', 57),
(120, '2021_10_14_061603_column_update_order_transaction', 57),
(121, '2021_10_15_103339_remove_col_from_seller_wallet', 57),
(122, '2021_10_15_104419_add_id_col_order_tran', 57),
(123, '2021_10_15_213454_update_string_limit', 57),
(124, '2021_10_16_234037_change_col_type_translation', 57),
(125, '2021_10_16_234329_change_col_type_translation_1', 57),
(126, '2021_10_27_091250_add_shipping_address_in_order', 58),
(127, '2021_01_24_205114_create_paytabs_invoices_table', 59),
(128, '2021_11_20_043814_change_pass_reset_email_col', 59),
(129, '2021_11_25_043109_create_delivery_men_table', 60),
(130, '2021_11_25_062242_add_auth_token_delivery_man', 60),
(131, '2021_11_27_043405_add_deliveryman_in_order_table', 60),
(132, '2021_11_27_051432_create_delivery_histories_table', 60),
(133, '2021_11_27_051512_add_fcm_col_for_delivery_man', 60),
(134, '2021_12_15_123216_add_columns_to_banner', 60),
(135, '2022_01_04_100543_add_order_note_to_orders_table', 60),
(136, '2022_01_10_034952_add_lat_long_to_shipping_addresses_table', 60),
(137, '2022_01_10_045517_create_billing_addresses_table', 60),
(138, '2022_01_11_040755_add_is_billing_to_shipping_addresses_table', 60),
(139, '2022_01_11_053404_add_billing_to_orders_table', 60),
(140, '2022_01_11_234310_add_firebase_toke_to_sellers_table', 60),
(141, '2022_01_16_121801_change_colu_type', 60),
(142, '2022_01_22_101601_change_cart_col_type', 60),
(143, '2022_01_23_031359_add_column_to_orders_table', 60),
(144, '2022_01_28_235054_add_status_to_admins_table', 60),
(145, '2022_02_01_214654_add_pos_status_to_sellers_table', 60),
(146, '2022_02_11_225355_add_checked_to_orders_table', 60),
(147, '2022_02_14_114359_create_refund_requests_table', 60),
(148, '2022_02_14_115757_add_refund_request_to_order_details_table', 60),
(149, '2022_02_15_092604_add_order_details_id_to_transactions_table', 60),
(150, '2022_02_15_121410_create_refund_transactions_table', 60),
(151, '2022_02_24_091236_add_multiple_column_to_refund_requests_table', 60),
(152, '2022_02_24_103827_create_refund_statuses_table', 60),
(153, '2022_03_01_121420_add_refund_id_to_refund_transactions_table', 60),
(154, '2022_03_10_091943_add_priority_to_categories_table', 60),
(155, '2022_03_13_111914_create_shipping_types_table', 60),
(156, '2022_03_13_121514_create_category_shipping_costs_table', 60),
(157, '2022_03_14_074413_add_four_column_to_products_table', 60),
(158, '2022_03_15_105838_add_shipping_to_carts_table', 60),
(159, '2022_03_16_070327_add_shipping_type_to_orders_table', 60),
(160, '2022_03_17_070200_add_delivery_info_to_orders_table', 60),
(161, '2022_03_18_143339_add_shipping_type_to_carts_table', 60);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `name`, `content`, `image`, `status`, `created_at`, `updated_at`) VALUES
(9, 'News 3', '<p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>', '2022-08-15-62fa7d615ec1b.png', 1, '2022-08-08 11:14:11', '2022-08-15 17:19:45'),
(10, 'News 2', '<p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>', '2022-08-09-62f20ce43e15e.png', 1, '2022-08-08 11:20:53', '2022-08-15 17:20:03'),
(11, 'News 1', '<p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>', '2022-08-09-62f20cca0fdb9.png', 1, '2022-08-08 11:42:56', '2022-08-15 17:20:15');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('039b64238f7560065eb3d28d6ef707998af6b1826b6d7b85dded65cd2184f31ca33d9835e0b15d30', 52, 1, 'LaravelAuthApp', '[]', 0, '2022-07-03 12:40:57', '2022-07-03 12:40:57', '2023-07-03 12:40:57'),
('0420842e9e77298e2a1ba7b88270be1b4d7497c4b0b1171a7c287c21dfa64dca491069caa73814c4', 30, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 17:12:11', '2022-05-17 17:12:11', '2023-05-17 17:12:11'),
('07765efe458d563ed4210bace4555f728fdab2161916a69020a13977a02ae7d6a63005d8cb2427af', 8, 1, 'LaravelAuthApp', '[]', 0, '2021-12-06 04:24:29', '2021-12-06 04:24:29', '2022-12-06 04:24:29'),
('0b6c624d2accf4a656fbbe8b7f19ad8e20ae479839030fbc46174a278306ac17b9bef74bb31c1295', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-06-14 06:36:34', '2022-06-14 06:36:34', '2023-06-14 06:36:34'),
('1002a90f5c650ce813296ea0cf53c2139919aa24b5b273d758b5cdb065348534ad3cdb15c3e27b04', 76, 1, 'LaravelAuthApp', '[]', 0, '2022-10-23 01:20:59', '2022-10-23 01:20:59', '2023-10-23 01:20:59'),
('100802f67637faf3fb21b8f60619439e8da7879b2763075431b7516182baed47a7cfbda3c7215a21', 54, 1, 'LaravelAuthApp', '[]', 0, '2022-07-11 11:45:40', '2022-07-11 11:45:40', '2023-07-11 11:45:40'),
('114708b922ad48a29299b8c1f17d8a2118b4618a1c2229eb63597181ea56adb9c1cca199ee827428', 49, 1, 'LaravelAuthApp', '[]', 0, '2022-06-25 05:38:45', '2022-06-25 05:38:45', '2023-06-25 05:38:45'),
('1315809d88db6889b93d395e32ad44a77a19cee14b0b31d19e1aa8937cf4a7747e7fba56b521e19b', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-03-02 09:13:22', '2022-03-02 09:13:22', '2023-03-02 09:13:22'),
('1512c756d0340dfe877cc87bbcf215bfb0c6b3b3829a1d778ce607b25b9525c914f7b904575d1b9f', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-06-13 08:27:21', '2022-06-13 08:27:21', '2023-06-13 08:27:21'),
('224410f55ad6284aeb93ac261aa231976e5072907eafdca775166a721ef7e5c8fcfb3f629afec748', 2, 1, 'LaravelAuthApp', '[]', 0, '2021-12-03 07:30:29', '2021-12-03 07:30:29', '2022-12-03 07:30:29'),
('22d47a8575bf18d21d232b09534ff92b685d4f363e1b5450289d820ea5c1ba0b8db86563cc845a26', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-06-14 11:51:29', '2022-06-14 11:51:29', '2023-06-14 11:51:29'),
('239cdb54182ba3f609d2202949bfad70c9db548f2d9dd348b01ba09177925953972233875d7cb021', 7, 1, 'LaravelAuthApp', '[]', 0, '2021-12-04 10:51:06', '2021-12-04 10:51:06', '2022-12-04 10:51:06'),
('261b1d404e83e92974e29ed0e816fd4bba9b16f30548755220e21e08a5ce3aaff43fc79501251a8c', 4, 1, 'LaravelAuthApp', '[]', 0, '2021-12-02 11:41:55', '2021-12-02 11:41:55', '2022-12-02 11:41:55'),
('27063f2f1ba116960319ef0f8bbb1516be7d738a38f5b364ed25c3dd0e439a2dce304005dc6ac873', 8, 1, 'LaravelAuthApp', '[]', 0, '2021-12-08 04:38:11', '2021-12-08 04:38:11', '2022-12-08 04:38:11'),
('29a2d5a6b8668f21c0ff2b659fb08a42284e34fc69ef99f0f6bec5f5aa5278764f49d3343e921f8e', 8, 1, 'LaravelAuthApp', '[]', 0, '2021-12-05 14:00:23', '2021-12-05 14:00:23', '2022-12-05 14:00:23'),
('2e2db367c3611c1bfa13753ddbc3a42c1027fc08aa530a81d3f86184288a6347f66b581b1c5d411f', 55, 1, 'LaravelAuthApp', '[]', 0, '2022-07-14 08:25:36', '2022-07-14 08:25:36', '2023-07-14 08:25:36'),
('2e52f6e7aef3aac8ea9773d24606d59e13888131f31560489498a31840422b98c913dfc8d9383c9e', 31, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 17:17:18', '2022-05-17 17:17:18', '2023-05-17 17:17:18'),
('31d3ffddb067fcdc814fbae4d78783b2eede2c31359217663e8adb0468e17e4caa10921070adc1d1', 43, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 18:14:11', '2022-05-17 18:14:11', '2023-05-17 18:14:11'),
('3470515c30ed5300c0134e5a2a016c964e3f8c4e42969da202a6fbb44066ce2e9c2412e657b1d2c7', 56, 1, 'LaravelAuthApp', '[]', 0, '2022-07-15 07:46:38', '2022-07-15 07:46:38', '2023-07-15 07:46:38'),
('377ac18cd948a25de54cf57a697a446dd7e7ae5f4fb0487be069529a05919f4788842dc91b8ef17d', 4, 1, 'LaravelAuthApp', '[]', 0, '2022-05-04 07:39:54', '2022-05-04 07:39:54', '2023-05-04 07:39:54'),
('394ac71e943481d5873f322bc16a8aef06e947251926bb1e9dbd343e9c668c0a3ef44ce12439ab71', 44, 1, 'LaravelAuthApp', '[]', 0, '2022-06-05 18:41:23', '2022-06-05 18:41:23', '2023-06-05 18:41:23'),
('3b18466558eae27f2da85ded12a02fda148669ab7476787ed93d199be6ca33a2de853419c86b815e', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-05-04 17:45:06', '2022-05-04 17:45:06', '2023-05-04 17:45:06'),
('3b6c81295ac7608f3a97c1dfa8321412a70fcc55577db30e383febfabc4de84fb7a8f6d21d8805f8', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-06-14 07:35:43', '2022-06-14 07:35:43', '2023-06-14 07:35:43'),
('3f3504c0b36a8b9538485f57bba03cc1958e7b8a161883110b42c769a09a7be75d6bdaf8c2e25f92', 51, 1, 'LaravelAuthApp', '[]', 0, '2022-06-28 08:43:07', '2022-06-28 08:43:07', '2023-06-28 08:43:07'),
('3f7ca3e4d0a568f1803c9e1e9915f9d1e863098eaf3b2122b7f7b2513188fad70e0fec5f6a7594cd', 8, 1, 'LaravelAuthApp', '[]', 0, '2021-12-16 14:22:06', '2021-12-16 14:22:06', '2022-12-16 14:22:06'),
('40967771dce32f754036cbe7477db8f6d4c4156891c2239d32ee4e75eda99b206449ac11ac3c7145', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-05-03 17:09:05', '2022-05-03 17:09:05', '2023-05-03 17:09:05'),
('416ba57c6e84502cd00a5d0489be681ba8690c9ed1e52d0a512c9f9934c21af60008bbeaa2ab65b2', 50, 1, 'LaravelAuthApp', '[]', 0, '2022-06-26 03:45:32', '2022-06-26 03:45:32', '2023-06-26 03:45:32'),
('418a54a7176fb1fe26e7e919641570f4fcf68a9d12f550827025049e449073792f5b6b1c3d712a52', 3, 1, 'LaravelAuthApp', '[]', 0, '2021-11-24 10:13:48', '2021-11-24 10:13:48', '2022-11-24 10:13:48'),
('42e42883099f8378793f7c32870443b0fd6ba1702b61ae1652e89ffabe0357969aaf952ccc045937', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-06-13 05:41:59', '2022-06-13 05:41:59', '2023-06-13 05:41:59'),
('43792989daa3e33efe6bdc46cc931573afce660563129eee3273ddcab21355b9bc1b460288732b7f', 28, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 16:54:36', '2022-05-17 16:54:36', '2023-05-17 16:54:36'),
('4ebad7ea60b8cb4836398d439bc508211762d5d061b294bbff43275ba6301ab53e20e6728732b8c2', 21, 1, 'LaravelAuthApp', '[]', 0, '2022-04-08 15:54:31', '2022-04-08 15:54:31', '2023-04-08 15:54:31'),
('505c05b8810abc4779cb15440f68ad1f83cbf1362d3b2bee34f52bd643c6467effa9e9003f1693c4', 59, 1, 'LaravelAuthApp', '[]', 0, '2022-07-20 13:18:00', '2022-07-20 13:18:00', '2023-07-20 13:18:00'),
('51bb578693a5ec04bf079cd9adc93f2351b65b02333a1dfab88c93124c6888710e9f875b2594b482', 10, 1, 'LaravelAuthApp', '[]', 0, '2021-12-06 11:03:31', '2021-12-06 11:03:31', '2022-12-06 11:03:31'),
('601d173c8ee297f9f21b354ff326be441267373e50f845db49a6b5b36f0d9b46370f98f011575500', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 16:34:34', '2022-05-17 16:34:34', '2023-05-17 16:34:34'),
('609f5b1ebe6684708ef00460f60bb566310c238fbf43288444ecb4492ed0893782469fb896c0bfa1', 48, 1, 'LaravelAuthApp', '[]', 0, '2022-06-23 09:54:10', '2022-06-23 09:54:10', '2023-06-23 09:54:10'),
('623c4665617bc97aa02ba0be19ac43383110ea5892b7b45259ca0156077fcdcaca40bd678ddaea6b', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-06-13 06:44:54', '2022-06-13 06:44:54', '2023-06-13 06:44:54'),
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:25:41', '2021-07-05 09:25:41', '2022-07-05 15:25:41'),
('69dad359631a1d68978bdb51a99eb3f19053388374e27ff16e558f8b5892179287f25137d26b7429', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-05-04 10:52:04', '2022-05-04 10:52:04', '2023-05-04 10:52:04'),
('6ad48b9d28b50c68845b2ca2f6e69709e59c56181f778ccbc83cde294c938f997823f62765ce5af4', 5, 1, 'LaravelAuthApp', '[]', 0, '2021-12-04 09:40:20', '2021-12-04 09:40:20', '2022-12-04 09:40:20'),
('70e03cbbe1a95c1fd2780093f6401513fb3805cda7b8410fa572f245ef51cb982a8121996749fa66', 32, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 17:22:35', '2022-05-17 17:22:35', '2023-05-17 17:22:35'),
('75cecdfd9226dae0aa853b3e835a4c8a962087a9a3392487f2810dc96483c4c9e483dbb01b7bcdf5', 41, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 18:10:32', '2022-05-17 18:10:32', '2023-05-17 18:10:32'),
('7d5901c621d596b05f8b3feb099440a981b786cbf9fe0cef62d1a911add745842500a006b1c3fba6', 2, 1, 'LaravelAuthApp', '[]', 0, '2021-11-24 07:22:27', '2021-11-24 07:22:27', '2022-11-24 07:22:27'),
('7eff94397db437ab01d9dce59247d92f0cb92b3a62ba868b580125ee9fbb557b2d941e4e69b5e90a', 25, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 16:42:14', '2022-05-17 16:42:14', '2023-05-17 16:42:14'),
('80cce43119166b45980d8882593c334f2c875502dd4a515a3983531737e2c8a4b0fb8ef38a1a37b0', 47, 1, 'LaravelAuthApp', '[]', 0, '2022-06-14 09:54:15', '2022-06-14 09:54:15', '2023-06-14 09:54:15'),
('81c60543dd928ebb2d9efa505c38e80a72e991dfdca3e8d336dc115f53007d506fd61faef9e5b6ea', 2, 1, 'LaravelAuthApp', '[]', 0, '2021-12-03 06:34:37', '2021-12-03 06:34:37', '2022-12-03 06:34:37'),
('83364f0a8da6ceed5ed2f2bc2f212d53c5a136e226fc0e651172154d213033dfa8d072d40d6976b3', 38, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 17:50:58', '2022-05-17 17:50:58', '2023-05-17 17:50:58'),
('843411e065eb8c0957f0a48f3b4dd5390deb7c8380137178923b35576fc9ea0e0eede33546bd84cb', 8, 1, 'LaravelAuthApp', '[]', 0, '2021-12-08 04:57:41', '2021-12-08 04:57:41', '2022-12-08 04:57:41'),
('84f0d8227e5d6751af5e6b9128f7ef1ffbd34886014ca4b784bedad105fec39f58f8256eb36b0452', 24, 1, 'LaravelAuthApp', '[]', 0, '2022-05-04 09:54:36', '2022-05-04 09:54:36', '2023-05-04 09:54:36'),
('897a3544a7a5212745d66da463998bb1c1eadcf9be51ed335127741a160e47e9248921bfd057c973', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-06-16 08:59:37', '2022-06-16 08:59:37', '2023-06-16 08:59:37'),
('898cb34c7ad768eb25a4ba69b1c27b96e59efa80d75e837ef2815416c0470a46ee7cc98118093050', 8, 1, 'LaravelAuthApp', '[]', 0, '2021-12-10 18:01:21', '2021-12-10 18:01:21', '2022-12-10 18:01:21'),
('8c6f78067882f6be6a0dc71c0033635b03a4b2a7e601e3aceb42055248c2c612ed5b3793067bab50', 8, 1, 'LaravelAuthApp', '[]', 0, '2021-12-07 19:33:05', '2021-12-07 19:33:05', '2022-12-07 19:33:05'),
('8d0d8cdc3b4f79671431549a22837f2b23a2bb55aad228c3869b577a73e1a2d6b9ecba96e3e659a4', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-05-03 16:02:16', '2022-05-03 16:02:16', '2023-05-03 16:02:16'),
('8f3609fa7014e189b5738c6d3b413c0dc16a331161413c9439f68f9ed86c8c98ba9e4b90df599bfe', 2, 1, 'LaravelAuthApp', '[]', 0, '2022-05-04 07:35:54', '2022-05-04 07:35:54', '2023-05-04 07:35:54'),
('994cfc877a81e00b4f223335d40c32e8be7b6ae38ef7331c8b5720667553ec5617fbc4ec796d3dd9', 8, 1, 'LaravelAuthApp', '[]', 0, '2021-12-05 06:29:50', '2021-12-05 06:29:50', '2022-12-05 06:29:50'),
('99baa20dcec2abec2abc1ee9b6fe1fd362ebc0b971fa634d3abc0d784ccfc2ddb55929dd6a00b618', 40, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 18:00:11', '2022-05-17 18:00:11', '2023-05-17 18:00:11'),
('9b5ca6cb00e227dee8615e012293e14ffae4e3400094279268351b9bf14d22d3e84df1ab80d072d6', 11, 1, 'LaravelAuthApp', '[]', 0, '2021-12-10 10:13:53', '2021-12-10 10:13:53', '2022-12-10 10:13:53'),
('9d69953ace531862d094c6e6b98f9e916ad179fd682bace2a937cfb2386c23450eadb63a7cab5ebc', 16, 1, 'LaravelAuthApp', '[]', 0, '2022-02-19 12:41:34', '2022-02-19 12:41:34', '2023-02-19 12:41:34'),
('9de6c8741cfe10e2bfdebb9ccd029398cc8f120e3fbfa1b089381ae27f8192217e110aadcdb0befe', 4, 1, 'LaravelAuthApp', '[]', 0, '2022-06-14 09:19:13', '2022-06-14 09:19:13', '2023-06-14 09:19:13'),
('9f96b8590d803a006fd786269a884fbfcb4828bc0c2985247911f09d2051fe0b7ff6fd8bc5d60fff', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-05-07 10:16:51', '2022-05-07 10:16:51', '2023-05-07 10:16:51'),
('9fac30a471abcb44e525cd54da9c0552da11ec0d60c5189bd25753ca9cf1426118042bf81d78785e', 58, 1, 'LaravelAuthApp', '[]', 0, '2022-07-20 05:33:07', '2022-07-20 05:33:07', '2023-07-20 05:33:07'),
('a989c00297cce0a7a70dd44a0ae6ec92a76b618de1bfcc661e7cc5c36fa1d7a6676be12bb6e2e7bd', 8, 1, 'LaravelAuthApp', '[]', 0, '2021-12-05 14:04:41', '2021-12-05 14:04:41', '2022-12-05 14:04:41'),
('aab91670563ce915b14871461052792df3afe2acac0c43b87fad43b66129f090dd96340c4919e9af', 1, 1, 'LaravelAuthApp', '[]', 0, '2021-11-24 06:59:07', '2021-11-24 06:59:07', '2022-11-24 06:59:07'),
('abebe77e3cc9596f1de5c061540e23f0df9eef0aa76299f069531f4c40d149ebc9fbc20c3f73adef', 33, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 17:41:58', '2022-05-17 17:41:58', '2023-05-17 17:41:58'),
('ac6f218f1ab21d99ec1698c2bff14722933cddf4e9b15db69dc9e20240c3a63b2a6672d1beccc186', 46, 1, 'LaravelAuthApp', '[]', 0, '2022-06-14 07:46:53', '2022-06-14 07:46:53', '2023-06-14 07:46:53'),
('ad161746a8e7929be8305210706863adc643cd6d061bc59513e5fb4d2f1a2d0183cbf0f4bf756f2c', 35, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 17:44:38', '2022-05-17 17:44:38', '2023-05-17 17:44:38'),
('b1ae0f0fd7fb97db4ec60293730f128a4bac5b4d42d8c315980d019b584ef7d305d5945f86ce64ef', 4, 1, 'LaravelAuthApp', '[]', 0, '2022-06-14 10:18:41', '2022-06-14 10:18:41', '2023-06-14 10:18:41'),
('b6473e26ca4f6bf9e32d4e6383649216914f10787544c07f339617bd69c7d6e533bca30bece08e4c', 29, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 16:58:24', '2022-05-17 16:58:24', '2023-05-17 16:58:24'),
('b64e7c1b9a2ac3455671476931dfe5b80eea448b5cc51e5f97262ac7b171c05d02ba4f93070995b4', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-05-04 04:30:14', '2022-05-04 04:30:14', '2023-05-04 04:30:14'),
('bfd9d2edaf82321771fe92408a4f02a246da9957f543c1b81ce1ac92fc48014a78142c111034a76b', 8, 1, 'LaravelAuthApp', '[]', 0, '2021-12-08 04:13:11', '2021-12-08 04:13:11', '2022-12-08 04:13:11'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:24:36', '2021-07-05 09:24:36', '2022-07-05 15:24:36'),
('c46d96d973a9b191cb3357dbe537e6dd0915dabc2332085d5723ff5ba3396c202fb6b963581fc4bd', 8, 1, 'LaravelAuthApp', '[]', 0, '2021-12-07 19:40:33', '2021-12-07 19:40:33', '2022-12-07 19:40:33'),
('c824899bdbacddc1d8210a2888c59bca5c9abc207b3c3b18292333bf92cb8374454c1f31aead15de', 37, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 17:49:36', '2022-05-17 17:49:36', '2023-05-17 17:49:36'),
('d87b26333f46b986fd900ef3b7f45cc64659fcf98c4cb16adc6034c7ca8b4fe9875be497de1181b5', 36, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 17:45:46', '2022-05-17 17:45:46', '2023-05-17 17:45:46'),
('d92b3e57fa185783162d3d18a4a32758d394df44e181e7ecaf60b0170543c47208e43b794faf752e', 42, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 18:12:39', '2022-05-17 18:12:39', '2023-05-17 18:12:39'),
('dd2701136836fee948b0b2c96324b566fbd7d389228197f9ca1589444f6497c150ee0b4299ef29ff', 53, 1, 'LaravelAuthApp', '[]', 0, '2022-07-08 11:48:02', '2022-07-08 11:48:02', '2023-07-08 11:48:02'),
('dea462861c5df89e4d072933d0a209f3243d5a66ee6e1f289a70b70c7be54d61fcbdfe0a1e542f6f', 27, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 16:51:54', '2022-05-17 16:51:54', '2023-05-17 16:51:54'),
('e01c49ac67cd140281dac8ef5b624d9cf7c0d1d5f0b06273a0e862ec74ef37153ab0927395476f30', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-05-09 18:17:40', '2022-05-09 18:17:40', '2023-05-09 18:17:40'),
('e06c9d3a19f69ef9752c76f9ca535835be2b40388344f97c45cc331ed491f8165e1631c62eb8501a', 4, 1, 'LaravelAuthApp', '[]', 0, '2022-03-26 07:50:15', '2022-03-26 07:50:15', '2023-03-26 07:50:15'),
('e1d7b22905f6ab644c13f8975677f7dce22c3bdc2899818e6ea01666cc5dc249d45611a23c90d31c', 39, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 17:54:33', '2022-05-17 17:54:33', '2023-05-17 17:54:33'),
('e508cb482862834185ac510c626cc387facdc277e555eaa0abe6e3fecb94b706ac6ef3df52c29d8d', 26, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 16:47:50', '2022-05-17 16:47:50', '2023-05-17 16:47:50'),
('e620ddd4a8f3c987c32db6ae356eb77e726a94f93f251b7a8f32b61decf700c7be876bf620921fd4', 34, 1, 'LaravelAuthApp', '[]', 0, '2022-05-17 17:43:19', '2022-05-17 17:43:19', '2023-05-17 17:43:19'),
('e7159dbe367c691277dc5c39d6e08afc14058c2d9d2350c929cdbacb6f27228ec708cf84ff8c95e3', 14, 1, 'LaravelAuthApp', '[]', 0, '2022-01-20 14:13:55', '2022-01-20 14:13:55', '2023-01-20 14:13:55'),
('e71ec4673de9b21e230de96b472b64cbff45c17fab0bf6c27241412fa79adaf072197429a2261420', 57, 1, 'LaravelAuthApp', '[]', 0, '2022-07-19 17:16:40', '2022-07-19 17:16:40', '2023-07-19 17:16:40'),
('ed30d6993fef7f932c0596ef3fc669636c1a3c2d9b81d9868470a048d48c77475a46cf9de5758081', 4, 1, 'LaravelAuthApp', '[]', 0, '2022-05-03 09:18:16', '2022-05-03 09:18:16', '2023-05-03 09:18:16'),
('f121c3e07d833f206f3b5297778d8036a7b237f219e64d866a1200c6f83e1dc15bf98f7ee6ab6d46', 8, 1, 'LaravelAuthApp', '[]', 0, '2021-12-05 06:11:38', '2021-12-05 06:11:38', '2022-12-05 06:11:38'),
('f27e0490153f0af9aabca0ae009397287faed88332b73fe0b9101da0e842c3a693b0e392947300ff', 2, 1, 'LaravelAuthApp', '[]', 0, '2021-12-02 13:11:39', '2021-12-02 13:11:39', '2022-12-02 13:11:39'),
('f4a0855506e8ff2dca552949a5e386d0ae956639026054a0a8814b66b2b0d0c93324f77320eeec5a', 13, 1, 'LaravelAuthApp', '[]', 0, '2022-01-10 13:39:14', '2022-01-10 13:39:14', '2023-01-10 13:39:14'),
('f5b3ce32f328755a9cb87ec9294975edcfbb47484e78fd3933f873a9d0dfcd3c9e5716c765966b12', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-06-13 05:38:38', '2022-06-13 05:38:38', '2023-06-13 05:38:38'),
('fb7530c11206bf240fb7616b03ecc50ec55b2c19e6891c6c8e24f4f84d8f02a5597810729dffe2b2', 9, 1, 'LaravelAuthApp', '[]', 0, '2021-12-05 06:04:56', '2021-12-05 06:04:56', '2022-12-05 06:04:56'),
('fce4c13acc981f4b4d043f2693fe8dd85a0ab6394795a49f8baa69446ae62a26148bd70e631d6558', 8, 1, 'LaravelAuthApp', '[]', 0, '2021-12-05 03:55:10', '2021-12-05 03:55:10', '2022-12-05 03:55:10'),
('fea20fbc36c4d8b62d4e5a3f6bd6011e12c8f57786b4ca6c372349dcc8943e8e91896cda9e2be65f', 8, 1, 'LaravelAuthApp', '[]', 0, '2021-12-10 17:48:13', '2021-12-10 17:48:13', '2022-12-10 17:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, '6amtech', 'GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI', 'http://localhost', 1, 0, 0, '2020-10-21 18:27:22', '2020-10-21 18:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-21 18:27:23', '2020-10-21 18:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `bizlog_ticket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bizlog_ticket_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `order_group_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_service_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `order_status`, `bizlog_ticket`, `bizlog_ticket_status`, `payment_method`, `transaction_ref`, `order_amount`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `delivery_service_name`, `third_party_delivery_tracking_id`) VALUES
(100001, '61', 'customer', 'unpaid', 'processing', NULL, NULL, 'cash_on_delivery', '', 11.56, '24', '2022-08-21 06:47:29', '2022-10-20 14:37:06', 0, NULL, '0', 10, 1.00, '2037-l0IFv-1661064449', '153089', 1, 'admin', '{\"id\":24,\"customer_id\":61,\"contact_person_name\":\"test muhammed\",\"address_type\":\"permanent\",\"address\":\"test\",\"city\":\"kannur\",\"zip\":\"670595\",\"phone\":\"09207361321\",\"created_at\":\"2022-08-21T06:30:25.000000Z\",\"updated_at\":\"2022-08-21T06:30:25.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, 24, '{\"id\":24,\"customer_id\":61,\"contact_person_name\":\"test muhammed\",\"address_type\":\"permanent\",\"address\":\"test\",\"city\":\"kannur\",\"zip\":\"670595\",\"phone\":\"09207361321\",\"created_at\":\"2022-08-21T06:30:25.000000Z\",\"updated_at\":\"2022-08-21T06:30:25.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100002, '61', 'customer', 'paid', 'confirmed', NULL, NULL, 'razor_pay', 'pay_K8CLZzZuvxuzmM', 1.68, '24', '2022-08-21 07:21:37', '2022-08-21 07:39:57', 0, NULL, '0', 10, 1.00, '2196-QlidQ-1661066497', '621915', 1, 'admin', '{\"id\":24,\"customer_id\":61,\"contact_person_name\":\"test muhammed\",\"address_type\":\"permanent\",\"address\":\"test\",\"city\":\"kannur\",\"zip\":\"670595\",\"phone\":\"09207361321\",\"created_at\":\"2022-08-21T06:30:25.000000Z\",\"updated_at\":\"2022-08-21T06:30:25.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, 24, '{\"id\":24,\"customer_id\":61,\"contact_person_name\":\"test muhammed\",\"address_type\":\"permanent\",\"address\":\"test\",\"city\":\"kannur\",\"zip\":\"670595\",\"phone\":\"09207361321\",\"created_at\":\"2022-08-21T06:30:25.000000Z\",\"updated_at\":\"2022-08-21T06:30:25.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100003, '61', 'customer', 'paid', 'canceled', NULL, NULL, 'razor_pay', 'pay_K8Cj3QxKXbSe88', 1.68, '24', '2022-08-21 07:42:00', '2022-10-20 16:35:27', 0, NULL, '0', 10, 1.00, '1517-sf9nu-1661067720', '874479', 1, 'admin', '{\"id\":24,\"customer_id\":61,\"contact_person_name\":\"test muhammed\",\"address_type\":\"permanent\",\"address\":\"test\",\"city\":\"kannur\",\"zip\":\"670595\",\"phone\":\"09207361321\",\"created_at\":\"2022-08-21T06:30:25.000000Z\",\"updated_at\":\"2022-08-21T06:30:25.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, 24, '{\"id\":24,\"customer_id\":61,\"contact_person_name\":\"test muhammed\",\"address_type\":\"permanent\",\"address\":\"test\",\"city\":\"kannur\",\"zip\":\"670595\",\"phone\":\"09207361321\",\"created_at\":\"2022-08-21T06:30:25.000000Z\",\"updated_at\":\"2022-08-21T06:30:25.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100004, '61', 'customer', 'paid', 'out_for_delivery', NULL, NULL, 'razor_pay', 'pay_K8CmkA1zh0sstk', 1.68, '24', '2022-08-21 07:45:01', '2022-08-21 07:49:46', 0, NULL, '0', 10, 1.00, '9723-Nkzol-1661067901', '392439', 1, 'admin', '{\"id\":24,\"customer_id\":61,\"contact_person_name\":\"test muhammed\",\"address_type\":\"permanent\",\"address\":\"test\",\"city\":\"kannur\",\"zip\":\"670595\",\"phone\":\"09207361321\",\"created_at\":\"2022-08-21T06:30:25.000000Z\",\"updated_at\":\"2022-08-21T06:30:25.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, 24, '{\"id\":24,\"customer_id\":61,\"contact_person_name\":\"test muhammed\",\"address_type\":\"permanent\",\"address\":\"test\",\"city\":\"kannur\",\"zip\":\"670595\",\"phone\":\"09207361321\",\"created_at\":\"2022-08-21T06:30:25.000000Z\",\"updated_at\":\"2022-08-21T06:30:25.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100005, '61', 'customer', 'paid', 'processing', 'BST-CAS-102-63B9-57393244', 'Created', 'razor_pay', 'pay_K8hqc3vXK7P1bM', 1.68, '24', '2022-08-22 14:08:25', '2022-10-27 06:34:04', 0, NULL, '0', 10, 1.00, '9426-jicDN-1661177305', '941767', 1, 'admin', '{\"id\":24,\"customer_id\":61,\"contact_person_name\":\"test muhammed\",\"address_type\":\"permanent\",\"address\":\"test\",\"city\":\"kannur\",\"zip\":\"670595\",\"phone\":\"09207361321\",\"created_at\":\"2022-08-21T06:30:25.000000Z\",\"updated_at\":\"2022-08-21T06:30:25.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, 24, '{\"id\":24,\"customer_id\":61,\"contact_person_name\":\"test muhammed\",\"address_type\":\"permanent\",\"address\":\"test\",\"city\":\"kannur\",\"zip\":\"670595\",\"phone\":\"09207361321\",\"created_at\":\"2022-08-21T06:30:25.000000Z\",\"updated_at\":\"2022-08-21T06:30:25.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100006, '72', 'customer', 'paid', 'processing', NULL, NULL, 'cash_on_delivery', '', 1.68, '25', '2022-10-22 18:43:30', '2022-10-27 06:15:09', 0, NULL, '0', 10, 1.00, '1666-VcWIL-1666464210', '618345', 1, 'admin', '{\"id\":25,\"customer_id\":72,\"contact_person_name\":\"Muhammed\",\"address_type\":\"permanent\",\"address\":\"Bismilla House\",\"city\":\"kannur\",\"zip\":\"670595\",\"phone\":\"123456789\",\"created_at\":\"2022-10-22T18:25:08.000000Z\",\"updated_at\":\"2022-10-22T18:25:08.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, 25, '{\"id\":25,\"customer_id\":72,\"contact_person_name\":\"Muhammed\",\"address_type\":\"permanent\",\"address\":\"Bismilla House\",\"city\":\"kannur\",\"zip\":\"670595\",\"phone\":\"123456789\",\"created_at\":\"2022-10-22T18:25:08.000000Z\",\"updated_at\":\"2022-10-22T18:25:08.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `product_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `delivery_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(114, 100001, 4921, 1, '{\"id\":4921,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"chair\",\"slug\":\"chair-Gb2Kja\",\"category_ids\":\"[{\\\"id\\\":\\\"160\\\",\\\"position\\\":1},{\\\"id\\\":\\\"166\\\",\\\"position\\\":2}]\",\"brand_id\":138,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-13-62f79575ef66f.png\\\"]\",\"thumbnail\":\"2022-08-13-62f79575efa87.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":12,\"purchase_price\":1,\"tax\":0,\"tax_type\":\"percent\",\"discount\":12,\"discount_type\":\"percent\",\"current_stock\":1,\"details\":\"<p>chair<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-13T12:13:41.000000Z\",\"updated_at\":\"2022-08-13T12:13:41.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 12, 0, 1.44, 'pending', 'unpaid', '2022-08-21 06:47:29', '2022-08-21 06:47:29', NULL, '', '[]', 'discount_on_product', 1, 0),
(115, 100002, 4924, 1, '{\"id\":4924,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"CASALLURA Chair\",\"slug\":\"casallura-chair-ccBPUw\",\"category_ids\":\"[{\\\"id\\\":\\\"160\\\",\\\"position\\\":1},{\\\"id\\\":\\\"167\\\",\\\"position\\\":2}]\",\"brand_id\":138,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-16-62fb4755ba5cf.png\\\",\\\"2022-08-16-62fb477aa8274.png\\\",\\\"2022-08-16-62fb477aa85dc.png\\\",\\\"2022-08-16-62fb477aa86c2.png\\\"]\",\"thumbnail\":\"2022-08-16-62fb4755baa48.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1,\"purchase_price\":1,\"tax\":18,\"tax_type\":\"percent\",\"discount\":50,\"discount_type\":\"percent\",\"current_stock\":35,\"details\":\"<p>chair<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-16T07:29:25.000000Z\",\"updated_at\":\"2022-08-21T07:07:49.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":300,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1, 0.18, 0.5, 'pending', 'unpaid', '2022-08-21 07:21:37', '2022-08-21 07:21:37', NULL, '', '[]', 'discount_on_product', 1, 0),
(116, 100003, 4924, 1, '{\"id\":4924,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"CASALLURA Chair\",\"slug\":\"casallura-chair-ccBPUw\",\"category_ids\":\"[{\\\"id\\\":\\\"160\\\",\\\"position\\\":1},{\\\"id\\\":\\\"167\\\",\\\"position\\\":2}]\",\"brand_id\":138,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-16-62fb4755ba5cf.png\\\",\\\"2022-08-16-62fb477aa8274.png\\\",\\\"2022-08-16-62fb477aa85dc.png\\\",\\\"2022-08-16-62fb477aa86c2.png\\\"]\",\"thumbnail\":\"2022-08-16-62fb4755baa48.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1,\"purchase_price\":1,\"tax\":18,\"tax_type\":\"percent\",\"discount\":50,\"discount_type\":\"percent\",\"current_stock\":34,\"details\":\"<p>chair<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-16T07:29:25.000000Z\",\"updated_at\":\"2022-08-21T07:21:37.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":300,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1, 0.18, 0.5, 'pending', 'unpaid', '2022-08-21 07:42:00', '2022-10-20 16:35:27', NULL, '', '[]', 'discount_on_product', 0, 0),
(117, 100004, 4924, 1, '{\"id\":4924,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"CASALLURA Chair\",\"slug\":\"casallura-chair-ccBPUw\",\"category_ids\":\"[{\\\"id\\\":\\\"160\\\",\\\"position\\\":1},{\\\"id\\\":\\\"167\\\",\\\"position\\\":2}]\",\"brand_id\":138,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-16-62fb4755ba5cf.png\\\",\\\"2022-08-16-62fb477aa8274.png\\\",\\\"2022-08-16-62fb477aa85dc.png\\\",\\\"2022-08-16-62fb477aa86c2.png\\\"]\",\"thumbnail\":\"2022-08-16-62fb4755baa48.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1,\"purchase_price\":1,\"tax\":18,\"tax_type\":\"percent\",\"discount\":50,\"discount_type\":\"percent\",\"current_stock\":33,\"details\":\"<p>chair<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-16T07:29:25.000000Z\",\"updated_at\":\"2022-08-21T07:42:00.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":300,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1, 0.18, 0.5, 'pending', 'unpaid', '2022-08-21 07:45:01', '2022-08-21 07:45:01', NULL, '', '[]', 'discount_on_product', 1, 0),
(118, 100005, 4924, 1, '{\"id\":4924,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"CASALLURA Chair\",\"slug\":\"casallura-chair-ccBPUw\",\"category_ids\":\"[{\\\"id\\\":\\\"160\\\",\\\"position\\\":1},{\\\"id\\\":\\\"167\\\",\\\"position\\\":2}]\",\"brand_id\":138,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-16-62fb4755ba5cf.png\\\",\\\"2022-08-16-62fb477aa8274.png\\\",\\\"2022-08-16-62fb477aa85dc.png\\\",\\\"2022-08-16-62fb477aa86c2.png\\\"]\",\"thumbnail\":\"2022-08-16-62fb4755baa48.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1,\"purchase_price\":1,\"tax\":18,\"tax_type\":\"percent\",\"discount\":50,\"discount_type\":\"percent\",\"current_stock\":32,\"details\":\"<p>chair<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-16T07:29:25.000000Z\",\"updated_at\":\"2022-08-21T07:45:01.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":300,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1, 0.18, 0.5, 'pending', 'unpaid', '2022-08-22 14:08:25', '2022-10-27 06:28:32', NULL, '', '[]', 'discount_on_product', 1, 0),
(119, 100006, 4924, 1, '{\"id\":4924,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"CASALLURA Chair\",\"slug\":\"casallura-chair-ccBPUw\",\"category_ids\":\"[{\\\"id\\\":\\\"160\\\",\\\"position\\\":1},{\\\"id\\\":\\\"167\\\",\\\"position\\\":2}]\",\"brand_id\":138,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-08-16-62fb4755ba5cf.png\\\",\\\"2022-08-16-62fb477aa8274.png\\\",\\\"2022-08-16-62fb477aa85dc.png\\\",\\\"2022-08-16-62fb477aa86c2.png\\\"]\",\"thumbnail\":\"2022-08-16-62fb4755baa48.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1,\"purchase_price\":1,\"tax\":18,\"tax_type\":\"percent\",\"discount\":50,\"discount_type\":\"percent\",\"current_stock\":33,\"details\":\"<p>chair<\\/p>\",\"warranty\":\"\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-08-16T07:29:25.000000Z\",\"updated_at\":\"2022-10-20T16:35:27.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":300,\"multiply_qty\":1,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1, 0.18, 0.5, 'pending', 'unpaid', '2022-10-22 18:43:30', '2022-10-22 18:43:30', NULL, '', '[]', 'discount_on_product', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `seller_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(8,2) NOT NULL DEFAULT 0.00,
  `received_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`seller_id`, `order_id`, `order_amount`, `seller_amount`, `admin_commission`, `received_by`, `status`, `delivery_charge`, `tax`, `created_at`, `updated_at`, `customer_id`, `seller_is`, `delivered_by`, `payment_method`, `transaction_id`, `id`) VALUES
(1, 100002, '0.50', '0.50', '0.00', 'admin', 'hold', '1.00', '0.18', '2022-08-21 07:21:37', '2022-08-21 07:21:37', 61, 'admin', 'admin', 'razor_pay', '1335-DOduL-1661066497', 36),
(1, 100003, '0.50', '0.50', '0.00', 'admin', 'hold', '1.00', '0.18', '2022-08-21 07:42:00', '2022-08-21 07:42:00', 61, 'admin', 'admin', 'razor_pay', '6024-yYKGh-1661067720', 37),
(1, 100004, '0.50', '0.50', '0.00', 'admin', 'hold', '1.00', '0.18', '2022-08-21 07:45:01', '2022-08-21 07:45:01', 61, 'admin', 'admin', 'razor_pay', '5322-r3agS-1661067901', 38),
(1, 100005, '0.50', '0.50', '0.00', 'admin', 'hold', '1.00', '0.18', '2022-08-22 14:08:25', '2022-08-22 14:08:25', 61, 'admin', 'admin', 'razor_pay', '5779-HUZUv-1661177305', 39);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`identity`, `token`, `created_at`) VALUES
('keerthytkannan@gmail.com', 'mIkBJ4qZF0DHQPknW1IMTwOnt0T49V3dfgMpZEtIWCfaVtKjpOC39NHkOBPAIlcIkpi8LOtFooXWN9JTWTNwxpLloygISGsNZFHmZCGWLLLpA9bt440dTFHi', '2022-06-14 06:54:15'),
('irfan.oat@gmail.com', 'CLAbEkRyIGH0O7RN2QVfThW4QxSE3SoeSnhJvozT2xWpqheUGZPOOaMIsSqsLiBJE8ADYlYx7LcZZ0wgxfdKVHd4Vfs8ScvjsttObPiUTypREXUOC1N9ezBf', '2022-06-14 06:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `result` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_code` int(10) UNSIGNED NOT NULL,
  `pt_invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_first_six_digits` int(10) UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_or_email_verifications`
--

CREATE TABLE `phone_or_email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_or_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_or_email_verifications`
--

INSERT INTO `phone_or_email_verifications` (`id`, `phone_or_email`, `token`, `created_at`, `updated_at`) VALUES
(1, 'irfan.oat@gmail.com', '2638', '2021-12-01 14:03:56', '2021-12-01 14:03:56'),
(2, 'irfan.oat@gmail.com', '9943', '2021-12-03 18:34:12', '2021-12-03 18:34:12'),
(3, 'info@upmarkt.com', '8133', '2022-09-08 10:40:39', '2022-09-08 10:40:39'),
(4, 'info@upmarkt.com', '9709', '2022-09-08 10:56:55', '2022-09-08 10:56:55'),
(5, 'info@upmarkt.com', '7545', '2022-09-08 10:57:00', '2022-09-08 10:57:00'),
(6, 'nandhinis1993@yahoo.in', '7881', '2022-09-15 14:35:32', '2022-09-15 14:35:32'),
(7, '+923415951293', '2231', '2022-09-17 12:45:54', '2022-09-17 12:45:54'),
(8, 'afnan@gmail.com', '9014', '2022-09-20 09:26:15', '2022-09-20 09:26:15'),
(9, '+917676301863', '2639', '2022-10-19 08:24:08', '2022-10-19 08:24:08'),
(10, 'afnan@gmail.com', '5821', '2022-10-20 16:28:23', '2022-10-20 16:28:23'),
(11, 'saleel@gmail.com', '2851', '2022-10-20 16:44:27', '2022-10-20 16:44:27'),
(12, 'afnan@gmail.com', '1097', '2022-10-20 16:47:39', '2022-10-20 16:47:39'),
(13, 'afnan@gmail.com', '9451', '2022-10-20 16:48:16', '2022-10-20 16:48:16');

-- --------------------------------------------------------

--
-- Table structure for table `posters`
--

CREATE TABLE `posters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poster_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `display_orders` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posters`
--

INSERT INTO `posters` (`id`, `photo`, `poster_type`, `published`, `display_orders`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`) VALUES
(21, '2022-10-29-635d7a912f283.png', 'Categories 1', 1, 1, '2022-08-15 17:34:06', '2022-10-29 19:10:09', 'https://demo.upmarkt.in/products?id=163&data_from=category&page=1', 'category', 161),
(22, '2022-10-29-635d772b8db4e.png', 'Categories 1', 1, 2, '2022-08-15 17:45:08', '2022-10-29 18:55:39', 'https://demo.upmarkt.in/products?id=166&data_from=category&page=1', 'category', 163),
(23, '2022-10-29-635d6c82f05e0.png', 'Categories 1', 1, 3, '2022-08-15 17:46:08', '2022-10-29 18:10:10', 'https://demo.upmarkt.in/products?id=167&data_from=category&page=1', 'product', 4916),
(24, '2022-08-15-62fa86df81769.png', 'Categories 1', 1, 4, '2022-08-15 17:48:15', '2022-08-15 17:48:18', '#', 'product', 4916),
(25, '2022-08-16-62fbd008215f4.png', 'Categories 2', 1, 1, '2022-08-16 17:12:40', '2022-08-28 14:31:36', 'http://debug.upmarkt.in/products?id=170&data_from=category&page=1', 'category', 160),
(26, '2022-08-16-62fbd0524fe08.png', 'Categories 2', 1, 2, '2022-08-16 17:13:54', '2022-08-28 14:19:30', 'http://debug.upmarkt.in/products?id=170&data_from=category&page=1', 'category', 163),
(27, '2022-08-16-62fbd39420dfa.png', 'Categories 2', 1, 3, '2022-08-16 17:27:48', '2022-08-28 14:28:06', 'http://debug.upmarkt.in/products?id=166&data_from=category&page=1', 'product', 4916),
(28, '2022-08-16-62fbd3ba7cfc9.png', 'Categories 2', 1, 4, '2022-08-16 17:28:26', '2022-08-28 14:27:34', 'http://debug.upmarkt.in/products?id=166&data_from=category&page=1', 'product', 4916),
(29, '2022-08-16-62fbe9bb26e43.png', 'Deals', 1, 1, '2022-08-16 18:00:06', '2022-08-20 11:06:48', NULL, 'category', 165),
(30, '2022-08-16-62fbdb9d1d8f0.png', 'Deals', 1, 2, '2022-08-16 18:02:05', '2022-08-20 11:19:12', NULL, 'category', 163),
(31, '2022-08-16-62fbdbc756c7a.png', 'Deals', 1, 3, '2022-08-16 18:02:47', '2022-08-20 11:20:37', NULL, 'category', 162),
(32, '2022-08-16-62fbdc7f3c7c9.png', 'Deals', 1, 4, '2022-08-16 18:05:51', '2022-08-20 11:22:11', NULL, 'category', 160),
(33, '2022-08-16-62fbdd1f3e7c8.png', 'Deals', 1, 5, '2022-08-16 18:08:31', '2022-08-20 11:23:44', NULL, 'category', 163),
(34, '2022-08-16-62fbdd915b6a1.png', 'Deals', 1, 6, '2022-08-16 18:10:25', '2022-08-28 14:32:27', 'http://debug.upmarkt.in/products?id=166&data_from=category&page=1', 'product', 4916),
(35, '2022-08-16-62fbdddfafe01.png', 'Deals', 1, 7, '2022-08-16 18:11:43', '2022-08-28 14:32:06', 'http://debug.upmarkt.in/products?id=166&data_from=category&page=1', 'category', 160),
(36, '2022-08-16-62fbddfbde020.png', 'Deals', 1, 8, '2022-08-16 18:12:11', '2022-08-28 14:31:18', 'http://debug.upmarkt.in/products?id=166&data_from=category&page=1', 'category', 164),
(37, '2022-08-16-62fbdebb8254c.png', 'Pick of the week', 1, 1, '2022-08-16 18:15:23', '2022-08-28 14:41:57', 'http://debug.upmarkt.in/products?id=166&data_from=category&page=1', 'product', 4916),
(38, '2022-08-16-62fbdf7ec0cd1.png', 'Pick of the week', 1, 2, '2022-08-16 18:18:38', '2022-08-28 14:41:56', 'http://debug.upmarkt.in/products?id=166&data_from=category&page=1', 'product', 4916),
(39, '2022-08-16-62fbe058c2e89.png', 'Discount of the week', 1, 1, '2022-08-16 18:22:16', '2022-08-28 14:38:53', 'http://debug.upmarkt.in/products?id=166&data_from=category&page=1', 'product', 4916),
(40, '2022-08-16-62fbe07f21337.png', 'Discount of the week', 1, 2, '2022-08-16 18:22:55', '2022-08-28 14:38:54', 'http://debug.upmarkt.in/products?id=166&data_from=category&page=1', 'product', 4916),
(41, '2022-08-16-62fbe204c465a.png', 'Trending', 1, 1, '2022-08-16 18:29:24', '2022-08-28 14:42:34', 'http://debug.upmarkt.in/products?id=166&data_from=category&page=1', 'product', 4916),
(42, '2022-08-16-62fbe227991a3.png', 'Trending', 1, 2, '2022-08-16 18:29:59', '2022-08-28 14:42:47', 'http://debug.upmarkt.in/products?id=166&data_from=category&page=1', 'product', 4916),
(44, '2022-08-27-6309d191bf88a.png', 'Trending', 1, 3, '2022-08-16 18:33:06', '2022-08-28 14:33:33', 'http://debug.upmarkt.in/products?id=166&data_from=category&page=1', 'category', 160),
(45, '2022-08-18-62fdb78009f22.png', 'Discount of the week', 0, 1, '2022-08-18 03:52:32', '2022-08-28 14:37:41', 'http://debug.upmarkt.in/products?id=166&data_from=category&page=1', 'category', 160),
(46, '2022-08-18-62fdc11e74489.png', 'Discount of the week', 0, 2, '2022-08-18 04:33:34', '2022-08-28 14:37:40', 'http://debug.upmarkt.in/products?id=166&data_from=category&page=1', 'category', 164),
(47, '2022-08-27-6309d15a5eadb.png', 'Categories 1', 0, 1, '2022-08-27 08:08:46', '2022-08-28 14:20:01', 'http://debug.upmarkt.in/products?id=166&data_from=category&page=1', 'category', 160);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_ids` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flash_deal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_provider` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colors` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `tax` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warranty` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `details`, `warranty`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`) VALUES
(4915, 'admin', 1, 'CASALLURA Multi-Functional Ergonomic Gaming Chair with Adjustable Armrests, Wear', 'product-1-WS2Rrd', '[{\"id\":\"160\",\"position\":1}]', 132, 'kg', 1, 1, '[\"2022-08-03-62ea832a9d017.png\",\"2022-08-03-62ea833265196.png\",\"2022-08-03-62ea8338036c2.png\",\"2022-08-03-62ea83459c8a0.png\"]', '2022-07-31-62e662ad73e42.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 12000, 11589, '18', 'percent', '15', 'percent', 5, '<p>① Attention about duty</p>\r\n\r\n<p>From China maybe will request rates to some country.Each country has different policies</p>\r\n\r\n<p>② Package Includes:</p>\r\n\r\n<p>1 x Gaming Chair 1 x Assembly Tool (You need to assemble it by yourself ! )</p>\r\n\r\n<p>③ Product description</p>\r\n\r\n<p>Each color has pedals and without pedals, you can choose according to your needs，The version without pedal is sent by default. If you need the version with pedal, please contact customer service to make up the difference to buy;</p>\r\n\r\n<p>The latest version of the lantern custom model has been launched, if you need specific information, please contact customer service</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>④ Model A vs Model B</p>\r\n\r\n<p>Model B:Steel castor Model A:PA (polyamide) material castor PA casters are not easy to rust, are more durable, and can be washed. Steel wheels are prone to rust in humid environments, but they are cheaper. We recommend choosing modal B even more. Wheels are not easy to rust.</p>\r\n\r\n<p>We send Model A by default, please note if you need to replace it</p>\r\n\r\n<p>⑤ Products Show</p>\r\n\r\n<p><img src=\"https://ae01.alicdn.com/kf/Sa879572cff824f219c509432ac73b48fD.jpg\" style=\"float:right\" /></p>\r\n\r\n<p><img src=\"https://ae01.alicdn.com/kf/H8e93779447324a45b4fa362f7357b8fdH.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H3a6d78d698b343c2a502acf6c7722b93w.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H7e277764a71845b390c280f944ceeaa6Y.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H036d65e852ef47f1be612790948eb760G.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Ha6d4549a169647b28cda0b3efd4fa9523.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Ha0675380269e4b40a6e28ff60e07620fY.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H73b797fa1cb14d2d8d3429fe0c1e34a07.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H13629d27fad74639b621c1369aaac51ec.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Hdcfd4b221f22446e8f3ed2552e0cae57r.jpg\" /></p>\r\n\r\n<p><img src=\"https://ae01.alicdn.com/kf/H9d49ffdaa52d478d8978b59a5131212fW.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Hfe069d7103f7401fb54631ba39bf1773p.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Hcfa6b6ef6c9d4f98951c63ca9b2ff4631.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H53a701f73fcd43db8f834b04a77de576J.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Hbe129d7dfa9b4646a7aadd8ccc667005X.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H9386791f54214e2a80f63b75010f1923o.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Ha8793645365d4ca8a79e2a2e2d4df5dfh.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H766511d705334d4cabad068c0cda6c4cC.jpg\" /></p>\r\n\r\n<p>(PA) polyamide castor + footrest +Dual Bluetooth speaker</p>\r\n\r\n<p><img src=\"https://ae01.alicdn.com/kf/Hc00e1534b62c427b986dc5772c117a7bA.jpg\" /></p>\r\n\r\n<p>With Pedal</p>\r\n\r\n<p>Latex cushion +（PA) polyamide castor</p>\r\n\r\n<p><img src=\"https://ae01.alicdn.com/kf/Haf17e7cbc8de483584361f4c6d9c0781v.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H1c11eaf7032142318bb0890c3fa2c3114.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H8746267654a54803af651c1adba1563cN.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H2bf8bf57b0544392afd89678845fb4e91.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H751da8920a394d2aac25714fd6f0886dw.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H3f01d0c3cd7145f6add0246e254fc683U.jpg\" /></p>\r\n\r\n<p>Without pedal</p>\r\n\r\n<p>Latex cushion +（PA) polyamide castor</p>\r\n\r\n<p><img src=\"https://ae01.alicdn.com/kf/Hc6890df20fd84dbe834d48adf417533dG.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H9922e8926b4c41a0a9b9041d97c91a62Q.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H050c56d569ac46cda7052b2a00c1a5663.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Hd10031c58f824814b2689d8285901cb1J.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Hd20d179bfa784403b6480dff19a67018B.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H2cd8b1ff4e1b4b03875b05bfc02d0fb7j.jpg\" /></p>\r\n\r\n<p>window.adminAccountId=239744239;</p>\r\n\r\n<p>&nbsp;</p>', '', 0, NULL, '2022-07-31 11:08:29', '2022-08-13 12:31:25', 1, 1, NULL, NULL, '2022-08-03-62ea85ce82059.png', 1, NULL, 300.00, 1, NULL, NULL),
(4916, 'admin', 1, 'Product 2', 'product-2-lptrnt', '[{\"id\":\"153\",\"position\":1}]', 137, 'kg', 1, 1, '[\"2022-07-31-62e663095e917.png\"]', '2022-07-31-62e663095f58f.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 20, 100, '0', 'percent', '1', 'flat', 0, '<p>① Attention about duty</p>\r\n<p>From China maybe will request rates to some country.Each country has different policies</p>\r\n<p>② Package Includes:</p>\r\n<p>1 x Gaming Chair 1 x Assembly Tool (You need to assemble it by yourself ! )</p>\r\n<p>③ Product description</p>\r\n<p>Each color has pedals and without pedals, you can choose according to your needs，The version without pedal is sent by default. If you need the version with pedal, please contact customer service to make up the difference to buy;</p>\r\n<p>The latest version of the lantern custom model has been launched, if you need specific information, please contact customer service</p>\r\n<p>&nbsp;</p>\r\n<p>④ Model A vs Model B</p>\r\n<p>Model B:Steel castor Model A:PA (polyamide) material castor PA casters are not easy to rust, are more durable, and can be washed. Steel wheels are prone to rust in humid environments, but they are cheaper. We recommend choosing modal B even more. Wheels are not easy to rust.</p>\r\n<p>We send Model A by default, please note if you need to replace it</p>\r\n<p>⑤ Products Show</p>\r\n<p style=\"text-align: justify;\"><img src=\"https://ae01.alicdn.com/kf/Sa879572cff824f219c509432ac73b48fD.jpg\" /></p>\r\n<p style=\"text-align: justify;\"><img src=\"https://ae01.alicdn.com/kf/H8e93779447324a45b4fa362f7357b8fdH.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H3a6d78d698b343c2a502acf6c7722b93w.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H7e277764a71845b390c280f944ceeaa6Y.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H036d65e852ef47f1be612790948eb760G.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Ha6d4549a169647b28cda0b3efd4fa9523.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Ha0675380269e4b40a6e28ff60e07620fY.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H73b797fa1cb14d2d8d3429fe0c1e34a07.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H13629d27fad74639b621c1369aaac51ec.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Hdcfd4b221f22446e8f3ed2552e0cae57r.jpg\" /></p>\r\n<p style=\"text-align: justify;\"><img src=\"https://ae01.alicdn.com/kf/H9d49ffdaa52d478d8978b59a5131212fW.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Hfe069d7103f7401fb54631ba39bf1773p.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Hcfa6b6ef6c9d4f98951c63ca9b2ff4631.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H53a701f73fcd43db8f834b04a77de576J.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Hbe129d7dfa9b4646a7aadd8ccc667005X.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H9386791f54214e2a80f63b75010f1923o.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Ha8793645365d4ca8a79e2a2e2d4df5dfh.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H766511d705334d4cabad068c0cda6c4cC.jpg\" /></p>\r\n<p style=\"text-align: justify;\">(PA) polyamide castor + footrest +Dual Bluetooth speaker</p>\r\n<p style=\"text-align: justify;\"><img src=\"https://ae01.alicdn.com/kf/Hc00e1534b62c427b986dc5772c117a7bA.jpg\" /></p>\r\n<p style=\"text-align: justify;\">With Pedal</p>\r\n<p style=\"text-align: justify;\">Latex cushion +（PA) polyamide castor</p>\r\n<p style=\"text-align: justify;\"><img src=\"https://ae01.alicdn.com/kf/Haf17e7cbc8de483584361f4c6d9c0781v.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H1c11eaf7032142318bb0890c3fa2c3114.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H8746267654a54803af651c1adba1563cN.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H2bf8bf57b0544392afd89678845fb4e91.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H751da8920a394d2aac25714fd6f0886dw.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H3f01d0c3cd7145f6add0246e254fc683U.jpg\" /></p>\r\n<p style=\"text-align: justify;\">Without pedal</p>\r\n<p style=\"text-align: justify;\">Latex cushion +（PA) polyamide castor</p>\r\n<p style=\"text-align: justify;\"><img src=\"https://ae01.alicdn.com/kf/Hc6890df20fd84dbe834d48adf417533dG.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H9922e8926b4c41a0a9b9041d97c91a62Q.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H050c56d569ac46cda7052b2a00c1a5663.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Hd10031c58f824814b2689d8285901cb1J.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/Hd20d179bfa784403b6480dff19a67018B.jpg\" />&nbsp;<img src=\"https://ae01.alicdn.com/kf/H2cd8b1ff4e1b4b03875b05bfc02d0fb7j.jpg\" /></p>\r\n<p style=\"text-align: justify;\">window.adminAccountId=239744239;</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>', '', 0, NULL, '2022-07-31 11:10:01', '2022-08-07 05:00:38', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4917, 'admin', 1, 'Product 3', 'product-3-mEgLww', '[{\"id\":\"153\",\"position\":1}]', 133, 'kg', 1, 1, '[\"2022-07-31-62e6636057277.png\"]', '2022-07-31-62e66360597cc.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 1600, 1000, '0', 'percent', '2', 'flat', 200, '<p>Product 3</p>', '', 0, NULL, '2022-07-31 11:11:28', '2022-08-01 11:49:32', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4918, 'admin', 1, 'Product 4', 'product-4-md5Rma', '[{\"id\":\"153\",\"position\":1}]', 133, 'kg', 1, 1, '[\"2022-07-31-62e6641575681.png\"]', '2022-07-31-62e6641577416.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 5000, 2000, '0', 'percent', '100', 'flat', 100, '<p>Product 4</p>', '', 0, NULL, '2022-07-31 11:14:29', '2022-08-01 09:31:54', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4919, 'admin', 1, 'Product 5', 'product-5-hDtfLa', '[{\"id\":\"153\",\"position\":1}]', 137, 'kg', 1, 1, '[\"2022-07-31-62e6645dc4eb9.png\"]', '2022-07-31-62e6645dc5c83.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 89, 45, '0', 'percent', '12', 'flat', 100, '<p>Product 5</p>', '', 0, NULL, '2022-07-31 11:15:41', '2022-08-01 09:31:37', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4920, 'admin', 1, 'Product 6', 'product-6-3B7FNz', '[{\"id\":\"154\",\"position\":1}]', 137, 'kg', 1, 1, '[\"2022-07-31-62e66490e745d.png\"]', '2022-07-31-62e66490e820d.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 24, 23, '0', 'percent', '2', 'flat', 200, '<p>Product 6</p>', '', 0, NULL, '2022-07-31 11:16:32', '2022-08-08 06:22:02', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4922, 'admin', 1, 'Table', 'table-HeTRhj', '[{\"id\":\"161\",\"position\":1},{\"id\":\"170\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-13-62f795d1ea937.png\"]', '2022-08-13-62f795d1ead1d.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 12, 1, '0', 'percent', '1', 'flat', 1, '<p>Table</p>', '', 0, NULL, '2022-08-13 12:15:13', '2022-08-13 12:15:13', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4924, 'admin', 1, 'CASALLURA Chair', 'casallura-chair-ccBPUw', '[{\"id\":\"160\",\"position\":1},{\"id\":\"167\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-16-62fb4755ba5cf.png\",\"2022-08-16-62fb477aa8274.png\",\"2022-08-16-62fb477aa85dc.png\",\"2022-08-16-62fb477aa86c2.png\"]', '2022-08-16-62fb4755baa48.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 1, 1, '18', 'percent', '50', 'percent', 31, '<p>chair</p>', '', 0, NULL, '2022-08-16 07:29:25', '2022-10-27 06:28:32', 1, 1, NULL, NULL, 'def.png', 1, NULL, 300.00, 1, NULL, NULL),
(4925, 'seller', 76, 'test', 'test-uug5jm', '[{\"id\":\"161\",\"position\":1},{\"id\":\"171\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-22-6303262eb772c.png\"]', '2022-08-22-6303262eb9194.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 1, 1, '0', 'percent', '0', 'flat', 0, '<p>test</p>', '', 0, NULL, '2022-08-22 06:46:06', '2022-08-22 06:46:27', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4926, 'admin', 1, 'Casallura Gaming Chair', 'casallura-gaming-chair-z0SN0m', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-27-6309b172a35fb.png\",\"2022-08-27-6309b172a37d6.png\",\"2022-08-27-6309b172a38b7.png\",\"2022-08-27-6309b172a394a.png\"]', '2022-08-27-6309b172a3a24.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 18999, 9999, '18', 'percent', '10', 'percent', 3, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<h2><strong>SPECIFICATION</strong></h2>\r\n			</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>BRAND</strong></td>\r\n			<td>CASALLURA</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>PRODUCT</strong></td>\r\n			<td>HIGH BACK CHAIR</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>WEIGHT</strong></td>\r\n			<td>22 KG</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>CAPACITY</strong></td>\r\n			<td>180 KG</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>SEAT HEIGHT</strong></td>\r\n			<td>17.91&quot;-21.85&quot; (from seat to floor)</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>WIDTH/DEPTH</strong></td>\r\n			<td>(W)20.87&quot; (D)17.82&quot;</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>BACKREST HEIGHT</strong></td>\r\n			<td>26.38&quot;</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>PACKING DIMENSIONS</strong></td>\r\n			<td>(W)29.53&quot; (D)13.39&quot; (H)20.87&quot;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<h2><strong>PACKAGE CONTENTS</strong></h2>\r\n			</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td><strong>MESH CHAIR</strong></td>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>HARDWARE BAG</strong></td>\r\n			<td>1</td>\r\n		</tr>\r\n		<tr>\r\n			<td><strong>MANUAL</strong></td>\r\n			<td>1</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Dynamic Back Support</h2>\r\n\r\n<h3>The new lumbar designed with copolymer has 2.5 times more flex for contoured lower back support. With insights from extensive pressure mapping, the slats add additional fluidity for dynamic back support.​</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Celebrating the Everyday</h2>\r\n\r\n<h3>Personality&trade; Plus, a configurable and eco-friendly task chair incorporating Steelcase&#39;s Seating Insights and the industry&#39;s highest quality standards, the goal of our re-design efforts was to elevate the everyday comfort, performance and experience of people at work while offering a more sustainable approach to materials and design.</h3>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.accentuate.io/7377741742230/1659955648725/feature_1.png?v=1659955648725\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Everyday&nbsp;Ease+</h2>\r\n\r\n<p>It&rsquo;s not just about that initial feeling when you first sit down, dynamic comfort is about encouraging healthy movement throughout your day &ndash; to keep you engaged and focused without sacrificing support.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.accentuate.io/7377741742230/1659955703353/feature_2.png?v=1659955703354\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Everyday&nbsp;Mileage+</h2>\r\n\r\n<p>With a 12 year warranty and performance that endures, Personality&trade; Plus is a task chair made to last and tested and certified for leading industry standards.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.accentuate.io/7377741742230/1659955761541/feature_3.png?v=1659955761541\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', '', 0, NULL, '2022-08-27 05:53:54', '2022-09-17 05:08:15', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4927, 'admin', 1, 'CASALLURA  Ergonomic High Back Chair', 'casallura-ergonomic-high-back-chair-Vs1RIV', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-27-6309b342a62f7.png\",\"2022-08-27-6309b342a64e2.png\",\"2022-08-27-6309b35e13224.png\"]', '2022-08-27-6309babf510fc.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 9999, 9999, '18', 'percent', '10', 'percent', 2, NULL, '', 0, NULL, '2022-08-27 06:01:38', '2022-10-26 03:19:12', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4928, 'admin', 1, 'Casallura designer office chair', 'casallura-designer-office-chair-GjOPLF', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-27-6309b9f55be19.png\",\"2022-08-27-6309b9f55c0ef.png\",\"2022-08-27-6309b9f55c1dc.png\",\"2022-08-27-6309b9f55c373.png\"]', '2022-08-27-6309b9f55c47a.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 11999, 11999, '18', 'percent', '0', 'percent', 3, NULL, '', 0, NULL, '2022-08-27 06:30:13', '2022-08-27 06:32:23', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4929, 'admin', 1, 'CASALLURA Ergonomic designer chair', 'casallura-ergonomic-designer-chair-5ExxcS', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-27-6309ba6aabf22.png\",\"2022-08-27-6309ba6aac11f.png\",\"2022-08-27-6309ba6aac1c4.png\",\"2022-08-27-6309ba6aac243.png\"]', '2022-08-27-6309ba6aac371.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 19999, 19999, '18', 'percent', '0', 'flat', 3, NULL, '', 0, NULL, '2022-08-27 06:32:10', '2022-08-27 06:34:32', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4930, 'admin', 1, 'Casallura Designer chair', 'casallura-designer-chair-erL7Bx', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-27-6309bbd847cb7.png\",\"2022-08-27-6309bbd847e4f.png\",\"2022-08-27-6309bbd847f69.png\",\"2022-08-27-6309bbd8480a6.png\"]', '2022-08-27-6309bbd8481d0.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 11999, 11999, '18', 'percent', '0', 'flat', 3, NULL, '', 0, NULL, '2022-08-27 06:38:16', '2022-08-27 06:38:16', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4931, 'admin', 1, 'Casallura Feature Chair', 'casallura-feature-chair-u523qY', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-27-6309bcb94bcdd.png\",\"2022-08-27-6309bcb94bf13.png\",\"2022-08-27-6309bcb94bfc6.png\"]', '2022-08-27-6309bcb94c083.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 9999, 9999, '18', 'percent', '0', 'flat', 3, NULL, '', 0, NULL, '2022-08-27 06:42:01', '2022-08-27 06:42:01', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4932, 'admin', 1, 'Casallura ergonomic chair', 'casallura-ergonomic-chair-B4hrtg', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-27-6309bd17eb509.png\",\"2022-08-27-6309bd17eb709.png\",\"2022-08-27-6309bd17eb78f.png\",\"2022-08-27-6309bd17eb80c.png\"]', '2022-08-27-6309bd17eb8ea.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 11999, 18999, '18', 'percent', '40', 'percent', 3, NULL, '', 0, NULL, '2022-08-27 06:43:35', '2022-08-27 06:43:35', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4933, 'admin', 1, 'Casallura office Chair', 'casallura-office-chair-3FwCPm', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-27-6309bd662eed2.png\",\"2022-08-27-6309bd662f085.png\",\"2022-08-27-6309bd662f125.png\",\"2022-08-27-6309bd662f213.png\"]', '2022-08-27-6309bd662f2c2.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 9999, 12999, '18', 'percent', '30', 'percent', 3, NULL, '', 0, NULL, '2022-08-27 06:44:54', '2022-08-27 06:44:54', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4934, 'admin', 1, 'CASALLURA Boss Chair', 'casallura-boss-chair-XzQ9Le', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-27-6309caaf6631f.png\"]', '2022-08-27-6309caaf6651b.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 18999, 18999, '18', 'percent', '0', 'flat', 1, NULL, '', 0, NULL, '2022-08-27 07:41:35', '2022-08-27 07:45:06', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4935, 'admin', 1, 'CASALLURA Boss Chair designed for comfort. Ergonomic designer chair with premium', 'casallura-boss-chair-designed-for-comfort-ergonomic-designer-chair-with-premium-looks-and-great-quality-woKxRe', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 132, 'kg', 1, 1, '[\"2022-08-27-6309cb23e5a07.png\"]', '2022-08-27-6309cb23e5caa.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 28999, 28999, '18', 'percent', '0', 'flat', 1, '<p><img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABAAAAAQACAYAAAB/HSuDAAAACXBIWXMAAAsSAAALEgHS3X78AAAgAElEQVR42uzdza80WWHYYTv4D+g/oXfOwkSdyF4ZQycWsl4hTCNDxhICdUYGYsGIHmPMO0aWywiNgLFIMzNIWSClNlG2vbB3KKpFdlakVlaxskgrItLIE1BtmFnedI3r4jt37kffe7vO57N4NgbGc6u6q8/51alTv3JxcfErAAAAQNkcBAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAQABwEAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAHAQQAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAAAQABwEAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAAHAQAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAEAAcBAAAABAAAAAAAAEAAAAAEAAAAAAAAQAAAAAQAAAAAAABAAAAABAAAAAAAAEAAAAABAAAAABAAAAA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AAAAAAIAAAAAIAAAAAAAAgAAAAAgAAAAAAACAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAAAAAgAAAAAgAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAAAAAgAAAAAgAAAAAIAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAAAAAgAAAAAgAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAAAAAgAAAAAgAAAAAIAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAAAAAgAAAAAIAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAAAAAgAAAAAgAAAAAIAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAAAAAgAAAAAIAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAAAAAgAAAAAIAAAAAIAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAAAAAgAAAAAIAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAAAAAgAAAAAIAAAAAIAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAAAAAIAAAAAIAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAAAAAgAAAAAIAAAAAIAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAAAAAIAAAAAIAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAACAAAAAAAAIAAAAAIAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAAAAAIAAAAAIAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAAAIAAAAACAAAAAAAAIAAAAAIAAAAAAAAgAAAAAgAAAAAAACAAAAACAAAAAAAAIAAAA8P/bsUMCAAAAAEH/X9vdQOCAUQADAAAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAADAAAAADAAAAAAABEAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAADAAAAADAAAAAAAAMAAAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAADAAAAADAAAAAAAAMAAAAADAAAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAADAAAAADAAAAAAAADQAQAAAAwAAAAAAADAAAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAADAAAAAAwAAAAAwAAAAAAADAAAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAAAwAAAAAwAAAAAAADAAAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAMAAEAEAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAADAAAAADAAAAAAAAMAAAAAMAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAADAAAAADAAAAAAAAMAAAAAMAAAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAADAAAAADAAAAAAAAMAAAAADAARAAAAAADAAAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAADAAAAADAAAAAAwAAAAAAADAAAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAADAAAAAAwAAAAAAADAAAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAADAAAAAAwAAAAAwAAAAAAADAAAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAADAAAAAAwAAAAAAADAAAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAADAAAAAAwAAAAAwAAAAAAADAAAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAAAwAAAAAwAAAAAAADAAAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAwAAAAAAADAAAAAAwAAAAAwAAAAAAADAAAAADAAAAAAAAMAAAAAMAAAAAAAAwAAAAAYAJftE+ZfCxVTgAAAABJRU5ErkJggg==\" /></p>\r\n<p>&nbsp;</p>', NULL, 0, NULL, '2022-08-27 07:43:31', '2022-10-28 10:52:09', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4936, 'admin', 1, 'CASALLURA Boss Chair', 'casallura-boss-chair-JpE21p', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 132, 'kg', 1, 1, '[\"2022-08-27-6309cb614395c.png\"]', '2022-08-27-6309cb6143bf6.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 18999, 18999, '18', 'percent', '0', 'flat', 2, NULL, '', 0, NULL, '2022-08-27 07:44:33', '2022-08-27 07:45:04', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4937, 'admin', 1, 'CASALLURA Metal frame office chair', 'casallura-metal-frame-office-chair-8SGJ1d', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 132, 'kg', 1, 1, '[\"2022-08-27-6309cc4bb2387.png\",\"2022-08-27-6309cc4bb25ad.png\",\"2022-08-27-6309cc4bb2688.png\"]', '2022-08-27-6309cc4bb27a2.png', NULL, NULL, 'youtube', NULL, '[\"#000000\",\"#00008B\",\"#FFC0CB\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":9999,\"sku\":\"CMfoc-Black\",\"qty\":1},{\"type\":\"DarkBlue\",\"price\":9999,\"sku\":\"CMfoc-DarkBlue\",\"qty\":1},{\"type\":\"Pink\",\"price\":9999,\"sku\":\"CMfoc-Pink\",\"qty\":1}]', 0, 9999, 9999, '18', 'percent', '0', 'flat', 3, NULL, '', 0, NULL, '2022-08-27 07:48:27', '2022-08-27 07:48:27', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4938, 'admin', 1, 'CASALLURA  Ergonomic Boss Chair', 'casallura-ergonomic-boss-chair-crSTfw', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 132, 'kg', 1, 1, '[\"2022-08-27-6309ce1a69ac3.png\",\"2022-08-27-6309ce1a69ca8.png\",\"2022-08-27-6309ce1a69d3c.png\"]', '2022-08-27-6309ce1a69e03.png', NULL, NULL, 'youtube', NULL, '[\"#000000\",\"#D3D3D3\",\"#BC8F8F\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":6000,\"sku\":\"CEBC-Black\",\"qty\":1},{\"type\":\"LightGrey\",\"price\":7000,\"sku\":\"CEBC-LightGrey\",\"qty\":1},{\"type\":\"RosyBrown\",\"price\":5999,\"sku\":\"CEBC-RosyBrown\",\"qty\":1}]', 0, 6000, 6000, '18', 'percent', '0', 'flat', 3, NULL, '', 0, NULL, '2022-08-27 07:56:10', '2022-08-27 07:56:10', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4939, 'admin', 1, 'CASALLURA Boss Chair', 'casallura-boss-chair-pnmSkm', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-27-6309ce4d1a001.png\",\"2022-08-27-6309ce4d1a1ef.png\",\"2022-08-27-6309ce4d1a26b.png\",\"2022-08-27-6309ce4d1a2d7.png\"]', '2022-08-27-6309ce4d1a361.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 29999, 29999, '18', 'percent', '0', 'flat', 2, NULL, '', 0, NULL, '2022-08-27 07:57:01', '2022-08-27 07:57:01', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4940, 'admin', 1, 'CASALLURA Boss Chair', 'casallura-boss-chair-Tdc2jz', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 132, 'kg', 1, 1, '[\"2022-08-27-6309ce781d011.png\"]', '2022-08-27-6309ce781d1cf.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 29011, 29011, '18', 'percent', '0', 'flat', 2, NULL, '', 0, NULL, '2022-08-27 07:57:44', '2022-08-27 07:57:44', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4941, 'admin', 1, 'CASALLURA Multi-Functional Ergonomic Gaming Chair with Adjustable Armrests, Wear', 'casallura-multi-functional-ergonomic-gaming-chair-with-adjustable-armrests-wear-resistant-faux-leather-adjustable-neck-l', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 132, 'kg', 1, 1, '[\"2022-08-27-6309ceb789baf.png\"]', '2022-08-27-6309ceb789dba.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 56022, 56022, '18', 'percent', '0', 'flat', 2, NULL, '', 0, NULL, '2022-08-27 07:58:47', '2022-08-27 07:58:47', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4942, 'admin', 1, 'CASALLURA Office Chair', 'casallura-office-chair-pnaW92', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 132, 'kg', 1, 1, '[\"2022-08-27-6309cf4b62911.png\",\"2022-08-27-6309cf4b62b8c.png\"]', '2022-08-27-6309cf4b62caf.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 5666, 5666, '18', 'percent', '0', 'flat', 2, NULL, '', 0, NULL, '2022-08-27 08:01:15', '2022-08-27 08:01:15', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4943, 'admin', 1, 'CASALLURA Boss Chair', 'casallura-boss-chair-i7yhtl', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-27-6309d0647785d.png\"]', '2022-08-27-6309d06477a4e.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 5, 10, '18', 'percent', '0', 'flat', 1, NULL, '', 0, NULL, '2022-08-27 08:05:56', '2022-09-17 04:08:52', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4944, 'admin', 1, 'CASALLURA  Ergonomic Boss Chair', 'casallura-ergonomic-boss-chair-4srqqJ', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-27-6309d08698e70.png\"]', '2022-08-27-6309d0869908a.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 19999, 19999, '18', 'percent', '0', 'flat', 1, NULL, '', 0, NULL, '2022-08-27 08:06:30', '2022-08-27 08:06:30', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4945, 'admin', 1, 'CASALLURA Office Chair', 'casallura-office-chair-g87gNY', '[{\"id\":\"160\",\"position\":1},{\"id\":\"166\",\"position\":2}]', 138, 'kg', 1, 1, '[\"2022-08-27-6309d0b573791.png\"]', '2022-08-27-6309d0b57397c.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 19999, 19999, '18', 'percent', '0', 'flat', 1, NULL, '', 0, NULL, '2022-08-27 08:07:17', '2022-08-27 08:07:17', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4946, 'admin', 1, 'Dining Table', 'dining-table-PPWOAN', '[{\"id\":\"163\",\"position\":1},{\"id\":\"175\",\"position\":2}]', 133, 'kg', 1, 1, '[\"2022-10-18-634e20dfa6159.png\",\"2022-10-18-634e20dfa8ace.png\",\"2022-10-18-634e20dfa8bad.png\"]', '2022-10-18-634e20dfa8c9e.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 120000, 78000, '18', 'percent', '10', 'flat', 2, NULL, '', 0, NULL, '2022-10-18 03:43:27', '2022-10-18 03:43:27', 1, 1, NULL, NULL, 'def.png', 1, NULL, 200.00, 0, NULL, NULL),
(4947, 'admin', 1, 'Classic Dining Table', 'classic-dining-table-xkmkr7', '[{\"id\":\"163\",\"position\":1},{\"id\":\"175\",\"position\":2}]', 133, 'kg', 1, 1, '[\"2022-10-18-634e212f757d8.png\",\"2022-10-18-634e212f75a2d.png\",\"2022-10-18-634e212f75b04.png\",\"2022-10-18-634e212f75bb7.png\"]', '2022-10-18-634e212f75c7e.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 50000, 45000, '18', 'percent', '10', 'flat', 2, NULL, '', 0, NULL, '2022-10-18 03:44:47', '2022-10-18 03:44:47', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4948, 'admin', 1, 'Dining table', 'dining-table-vNgGl3', '[{\"id\":\"163\",\"position\":1},{\"id\":\"175\",\"position\":2}]', 133, 'kg', 1, 1, '[\"2022-10-18-634e217ba9795.png\",\"2022-10-18-634e217ba99e0.png\",\"2022-10-18-634e217ba9a9a.png\"]', '2022-10-18-634e217ba9b61.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150000, 89900, '18', 'percent', '10', 'flat', 2, NULL, '', 0, NULL, '2022-10-18 03:46:03', '2022-10-18 03:46:03', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL);
INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `details`, `warranty`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`) VALUES
(4949, 'admin', 1, 'Dining table Classic', 'dining-table-classic-TJTgCS', '[{\"id\":\"163\",\"position\":1},{\"id\":\"175\",\"position\":2}]', 133, 'kg', 1, 1, '[\"2022-10-18-634e23c52a19c.png\"]', '2022-10-18-634e23c52ac1d.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 15000, 12000, '18', 'percent', '10', 'flat', 10, NULL, '', 0, NULL, '2022-10-18 03:55:49', '2022-10-18 03:55:49', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4950, 'admin', 1, 'Japanese Dining Table', 'japanese-dining-table-89q9RX', '[{\"id\":\"163\",\"position\":1},{\"id\":\"175\",\"position\":2}]', 133, 'kg', 1, 1, '[\"2022-10-18-634e23f9b3cb1.png\"]', '2022-10-18-634e23f9b3f6d.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 20000, 20000, '18', 'percent', '10', 'flat', 2, NULL, '', 0, NULL, '2022-10-18 03:56:41', '2022-10-18 03:56:41', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4951, 'admin', 1, 'Dining Table 2', 'dining-table-2-8NEBWm', '[{\"id\":\"163\",\"position\":1},{\"id\":\"175\",\"position\":2}]', 133, 'kg', 1, 1, '[\"2022-10-18-634e242bc6c9f.png\"]', '2022-10-18-634e242bc6f35.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 20000, 10000, '18', 'percent', '10', 'flat', 12, NULL, '', 0, NULL, '2022-10-18 03:57:31', '2022-10-18 03:57:31', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4952, 'admin', 1, 'Smart Bed 1', 'smart-bed-1-GL5COL', '[{\"id\":\"162\",\"position\":1},{\"id\":\"174\",\"position\":2}]', 139, 'kg', 1, 1, '[\"2022-10-18-634e28ca28629.png\"]', '2022-10-18-634e28ca2888b.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150000, 120000, '18', 'percent', '10', 'flat', 2, NULL, '', 0, NULL, '2022-10-18 04:17:14', '2022-10-18 04:17:14', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4953, 'admin', 1, 'Smart Bed 2', 'smart-bed-2-uAMpKD', '[{\"id\":\"162\",\"position\":1},{\"id\":\"174\",\"position\":2}]', 132, 'kg', 1, 1, '[\"2022-10-18-634e3dc8adc12.png\"]', '2022-10-18-634e3dc8ae464.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 20000, 20000, '18', 'percent', '10', 'flat', 2, NULL, '', 0, NULL, '2022-10-18 05:46:48', '2022-10-18 05:46:48', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4954, 'admin', 1, 'Smart bed 3', 'smart-bed-3-UmsCT0', '[{\"id\":\"162\",\"position\":1},{\"id\":\"174\",\"position\":2}]', 132, 'kg', 1, 1, '[\"2022-10-18-634e3fa2084e7.png\"]', '2022-10-18-634e3fa20875a.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 200000, 1500000, '18', 'percent', '10', 'flat', 2, NULL, '', 0, NULL, '2022-10-18 05:54:42', '2022-10-18 05:54:42', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4955, 'admin', 1, 'smart bed 4', 'smart-bed-4-pJx5Bh', '[{\"id\":\"162\",\"position\":1},{\"id\":\"174\",\"position\":2}]', 132, 'kg', 1, 1, '[\"2022-10-18-634e3fc8442e2.png\"]', '2022-10-18-634e3fc8445a2.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 1200022, 120001, '18', 'percent', '10', 'flat', 1, NULL, '', 0, NULL, '2022-10-18 05:55:20', '2022-10-18 05:55:20', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL),
(4956, 'admin', 1, 'King size Bed', 'king-size-bed-sqRVaw', '[{\"id\":\"162\",\"position\":1},{\"id\":\"174\",\"position\":2}]', 132, 'kg', 1, 1, '[\"2022-10-18-634e40006602e.png\",\"2022-10-18-634e40006627f.png\"]', '2022-10-18-634e4000663c9.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 124578, 124545, '18', 'percent', '10', 'flat', 2, '<p>&nbsp;</p>\r\n<p>SPECIFICATION:</p>\r\n<p><video style=\"display: block; margin-left: auto; margin-right: auto;\" controls=\"controls\" width=\"786\" height=\"393\">\r\n<source src=\"https://video.wixstatic.com/video/126aba_c2532f9f891e4a5cb7bfc1888aaa0347/480p/mp4/file.mp4\" type=\"video/mp4\" /></video></p>\r\n<p><img src=\"/public/uploads/editor/cas3a-1667028193.jpg\" alt=\"\" width=\"1920\" height=\"779\" /><img src=\"/public/uploads/editor/cas2-1667028163.jpg\" alt=\"\" width=\"1280\" height=\"718\" /></p>', '<p>warranty</p>\r\n<p>&nbsp;</p>', 0, NULL, '2022-10-18 05:56:16', '2022-10-29 07:25:40', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL);
INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `details`, `warranty`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`) VALUES
(4957, 'admin', 1, 'Bed', 'bed-eh7GGl', '[{\"id\":\"162\",\"position\":1},{\"id\":\"174\",\"position\":2}]', 132, 'kg', 1, 1, '[\"2022-10-18-634e43a760e5f.png\"]', '2022-10-18-634e43a7610c6.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 1254125, 125412, '18', 'percent', '10', 'flat', 2, '<p>Description for bed 11</p>\r\n<p style=\"text-align: center;\"><img src=\"data:image/jpeg;base64,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', '<p>Warranty for bed</p>', 0, NULL, '2022-10-18 06:11:51', '2022-10-28 09:07:10', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL);
INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `details`, `warranty`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`) VALUES
(4958, 'admin', 1, 'Upmarkt Urban Computer Desk', 'upmarkt-urban-computer-desk-VIVruc', '[{\"id\":\"161\",\"position\":1},{\"id\":\"172\",\"position\":2}]', 140, 'kg', 1, 1, '[\"2022-10-26-6358dde2ecbf4.png\"]', '2022-10-26-6358dde2ed33f.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 7800, 7800, '18', 'percent', '10', 'percent', 2, '<table>\r\n<tbody>\r\n<tr>\r\n<td>\r\n<h2><strong>SPECIFICATION</strong></h2>\r\n</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td><strong>BRAND</strong></td>\r\n<td>CASALLURA</td>\r\n</tr>\r\n<tr>\r\n<td><strong>PRODUCT</strong></td>\r\n<td>HIGH BACK CHAIR</td>\r\n</tr>\r\n<tr>\r\n<td><strong>WEIGHT</strong></td>\r\n<td>22 KG</td>\r\n</tr>\r\n<tr>\r\n<td><strong>CAPACITY</strong></td>\r\n<td>180 KG</td>\r\n</tr>\r\n<tr>\r\n<td><strong>SEAT HEIGHT</strong></td>\r\n<td>17.91\"-21.85\" (from seat to floor)</td>\r\n</tr>\r\n<tr>\r\n<td><strong>WIDTH/DEPTH</strong></td>\r\n<td>(W)20.87\" (D)17.82\"</td>\r\n</tr>\r\n<tr>\r\n<td><strong>BACKREST HEIGHT</strong></td>\r\n<td>26.38\"</td>\r\n</tr>\r\n<tr>\r\n<td><strong>PACKING DIMENSIONS</strong></td>\r\n<td>(W)29.53\" (D)13.39\" (H)20.87\"</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>\r\n<h2><strong>PACKAGE CONTENTS</strong></h2>\r\n</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td><strong>MESH CHAIR</strong></td>\r\n<td>1</td>\r\n</tr>\r\n<tr>\r\n<td><strong>HARDWARE BAG</strong></td>\r\n<td>1</td>\r\n</tr>\r\n<tr>\r\n<td><strong>MANUAL</strong></td>\r\n<td>1</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><video style=\"display: block; margin-left: auto; margin-right: auto;\" controls=\"controls\" width=\"769\" height=\"379\">\r\n<source src=\"https://video.wixstatic.com/video/126aba_c2532f9f891e4a5cb7bfc1888aaa0347/480p/mp4/file.mp4\" type=\"video/mp4\" /></video></p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://static.wixstatic.com/media/126aba_031dfcd5683a4e26b3d35e672d61545c~mv2.jpg\" alt=\"\" width=\"640\" height=\"779\" /><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://static.wixstatic.com/media/126aba_4dafa71d8d5e48f39c3df84d91ee5017~mv2.jpg\" alt=\"\" width=\"640\" height=\"805\" /><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://static.wixstatic.com/media/126aba_4f14eb56c0bf4cda8606e35e0a31cd83~mv2.jpg\" alt=\"\" width=\"640\" height=\"942\" /></p>\r\n<p>&nbsp;</p>', '<p>Product warranty</p>', 0, NULL, '2022-10-26 07:12:34', '2022-10-29 06:47:04', 1, 1, NULL, NULL, '2022-10-26-635916459a340.png', 1, NULL, 0.00, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `refund_reason` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rejected_note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_info` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_statuses`
--

CREATE TABLE `refund_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refund_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_transactions`
--

CREATE TABLE `refund_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_for` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `section`, `published`, `created_at`, `updated_at`) VALUES
(1, 'Categories 1', 1, '2022-08-17 06:31:14', '2022-09-02 15:09:24'),
(2, 'Categories 2', 0, '2022-08-17 06:31:14', '2022-10-30 02:00:17'),
(3, 'Deals', 0, '2022-08-17 06:31:14', '2022-10-30 01:50:44'),
(4, 'Pick of the week', 1, '2022-08-17 06:31:14', '2022-08-17 06:31:14'),
(5, 'Discount of the week', 1, '2022-08-17 06:31:14', '2022-10-30 01:48:22'),
(6, 'Trending', 1, '2022-08-17 06:31:14', '2022-10-30 01:48:20'),
(7, 'New Arrival', 1, '2022-08-21 06:45:38', '2022-09-11 05:09:09'),
(8, 'Brands', 0, '2022-08-21 06:45:38', '2022-10-23 13:06:40'),
(9, 'News', 1, '2022-08-21 06:45:38', '2022-09-11 05:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `f_name`, `l_name`, `phone`, `image`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `account_no`, `holder_name`, `auth_token`, `sales_commission_percentage`, `gst`, `cm_firebase_token`, `pos_status`) VALUES
(76, 'Seller', 'afnan', '919207361321', 'def.png', 'afnann@gmail.com', '$2y$10$9KZ1pzjnofqa2PRNA9VbE.yEWZ5KB3e8gqSHK2m01zkCDjtdWUIF6', 'approved', NULL, '2022-08-17 06:31:14', '2022-08-21 07:52:37', 'KJ', 'JK', '545', 'KL', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `collected_cash` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_wallets`
--

INSERT INTO `seller_wallets` (`id`, `seller_id`, `total_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_given`, `pending_withdraw`, `delivery_charge_earned`, `collected_cash`, `total_tax_collected`) VALUES
(50, 76, 0, 0, '2022-08-17 06:31:14', '2022-08-17 06:31:14', 0.00, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'home',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`, `latitude`, `longitude`, `is_billing`) VALUES
(24, '61', 'test muhammed', 'permanent', 'test', 'kannur', '670595', '09207361321', '2022-08-21 06:30:25', '2022-08-21 06:30:25', NULL, 'India', '', '', 0),
(25, '72', 'Muhammed', 'permanent', 'Bismilla House', 'kannur', '670595', '123456789', '2022-10-22 18:25:08', '2022-10-22 18:25:08', NULL, 'India', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(10, 1, 'admin', 'Express', '1.00', '4 to 5 Days', 1, '2022-08-21 06:45:38', '2022-08-21 06:45:38');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_types`
--

INSERT INTO `shipping_types` (`id`, `seller_id`, `shipping_type`, `created_at`, `updated_at`) VALUES
(2, 0, 'order_wise', '2022-08-21 06:24:06', '2022-08-21 06:24:18');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `seller_id`, `name`, `address`, `contact`, `image`, `created_at`, `updated_at`, `banner`) VALUES
(50, 76, 'afnan', 'irikkur', '919207361321', 'def.png', '2022-08-17 06:31:14', '2022-08-17 06:31:14', 'def.png');

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twitter', 'https://www.w3schools.com/howto/howto_css_table_responsive.asp', 'fa fa-twitter', 1, 1, '2020-12-31 21:18:03', '2020-12-31 21:18:25'),
(2, 'linkedin', 'https://dev.6amtech.com/', 'fa fa-linkedin', 1, 1, '2021-02-27 16:23:01', '2021-02-27 16:23:05'),
(3, 'google-plus', 'https://dev.6amtech.com/', 'fa fa-google-plus-square', 1, 1, '2021-02-27 16:23:30', '2021-02-27 16:23:33'),
(4, 'pinterest', 'https://dev.6amtech.com/', 'fa fa-pinterest', 1, 1, '2021-02-27 16:24:14', '2021-02-27 16:24:26'),
(5, 'instagram', 'https://dev.6amtech.com/', 'fa fa-instagram', 1, 1, '2021-02-27 16:24:36', '2021-02-27 16:24:41'),
(6, 'facebook', 'facebook.com', 'fa fa-facebook', 1, 1, '2021-02-27 19:19:42', '2021-06-11 17:41:59');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'low',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_to` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `agent_id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_card_fawry_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `temporary_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `agent_id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `temporary_token`, `is_email_verified`) VALUES
(0, 0, 'walking customer', 'walking', 'customer', '000000000000', 'def.png', 'walking@customer.com', NULL, '', NULL, NULL, '2022-05-02 12:09:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(1, 0, NULL, 'Aromal', 'Manoharan', '+917907153356', 'def.png', 'aromalmanoharan@gmail.com', NULL, '$2y$10$fU5P.o0wlD/D5FN5PnSbSuKpez5KwkL93J2fMCe1K41Zd.qtLFV0u', NULL, '2021-11-24 06:59:07', '2021-11-24 06:59:07', NULL, NULL, NULL, NULL, NULL, NULL, 'cB2VEfHsRxG-yvYm6T6eE5:APA91bFwAFEyiJFdC-P9o8qiltZk_VcSMvsEmBJrwrb6inoFPhJe-DCeYLu1NdehgNCCc5Lb2y1b4L-krlOqAWMB4t7zHRglYlf5tXM4vnF0Vu9m-473W5AT5w35yKJG4lWe9cYcg90T', 1, NULL, NULL, NULL, NULL, NULL, 0, 'BhlVj5RwF6A62nmATQcREJSPdI2MRYbEW8Es2Ewl', 0),
(2, 0, NULL, 'Sundeep', 'Moozhi', '919496023613', 'def.png', 'sundeepmoozhiyil@gmail.com', NULL, '$2y$10$EKTDHImYntbpnKRo9iexE.t5Vx4XdKcM69ZBXMEnApMcmj/fYEh5i', NULL, '2021-11-24 07:22:27', '2022-05-04 10:52:04', NULL, NULL, NULL, NULL, NULL, NULL, 'fznhW0QURtStCvVa4OM7iF:APA91bFBQoxlRDUg-LLZoLY6o6n94j6GFwtsd5KyWdDKTDxLTXH7r3zMiR4oHatLgAW3UuSv_yKgNhw60qZrtqDRxJkGuFrW1hLlSTbTyZ6HBlx-pC7AsG7KbDqsPzpR9JFv2o_TghSx', 1, NULL, NULL, NULL, NULL, NULL, 0, 'hoJOLlbR23GLVBCQ3mhr7aJh8uvaEZij3Wvu9bE2', 0),
(3, 0, NULL, 'Muhammed', 'Irfan', '+919207361321', 'def.png', 'irfan.oat@gmail.com', NULL, '$2y$10$32NydqYzTrOFYATw2h.AVuVBKQ2BUM8z3gigUYpO5oWXf7At77ExO', 'yLsMb9ppJJo8zJeYSZNDFq50LAuoD05ra7hfXZlug73Mj8SffhtXEnYFkcl4', '2021-11-24 10:13:48', '2022-10-22 07:04:23', NULL, NULL, NULL, NULL, NULL, NULL, 'feDNESa1TeyeruypTPZkd_:APA91bH7cJ5SEH6lxGcJNL53UIzJzCw9BBG0hFdkpDq7bulFud2u3cP6fL_6H950R1CmnlFD1Le9i33zCsgfRlekSaqq2PiTn8wHcX-2ptwkqmFM56M2GWPSKq0zSSKq3McB3GFCrW-9', 1, NULL, NULL, NULL, NULL, NULL, 0, 'l82ACfagJZdeP9TFXjtkM163bloGBNYB3z941RbE', 0),
(4, 0, NULL, 'Keerthy', 'Sundeep', '+8808281583613', 'def.png', 'keerthytkannan@gmail.com', NULL, '$2y$10$q9ba9VI0MIdYp76/5O0A/ualEIXRGh4lkC1urlaOuQWAAJSM3z2KC', NULL, '2021-12-02 11:41:55', '2022-06-14 10:18:41', NULL, NULL, NULL, NULL, NULL, NULL, 'c832hVxrRvqt8i4vIMOPzD:APA91bFrPzRi-def4jGUIfgkWjvVAP8Yr-5G75eradF2YpEi3W-Hr0nlRQDxY6CACRI-s_GN9SuHhpIOLYT_gxIGr9PPyPWYJuPiJpodAbZwhxNDSLc52MTMybW6GtSa2pLXGBAAgCvu', 1, NULL, NULL, NULL, NULL, NULL, 0, 'jaJhGJCe1hBIqmanpNXsPDwxPqvyK1EQ8pf4biN8', 0),
(6, 0, NULL, 'kamrujjaman', 'joy', '01632381820', 'def.png', 'joy25896@gmail.com', NULL, '$2y$10$Hg0hZXZl7LdFIAV9x9fapuZOHGJ0gQDyajAky2YgRtpToc/Qa2Cu.', NULL, '2021-12-04 10:48:52', '2021-12-04 10:48:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(7, 0, NULL, 'kamrujjaman', 'joy', '+880123456789', 'def.png', 'joy@gmail.com', NULL, '$2y$10$saSQAynosY8RUkwknRnrmOUUX.4d.oBbJj8eJNKUoZiZlKNqE7U92', NULL, '2021-12-04 10:51:06', '2021-12-04 10:51:06', NULL, NULL, NULL, NULL, NULL, NULL, 'dZgv9TQwS-KaXvNQItsb9m:APA91bG0kLzrmHjLZ6dQR5W__a8gMnxsWMyoypekc5VEd4GtmRNBj17KreD9D0c_a2SAqYhCMxclwq87mEQTZiLwGV-4GJLFT5AUN9urLXuRFhUVDeHK6vbrnYNPZ2WCKd7tf7Coml4C', 1, NULL, NULL, NULL, NULL, NULL, 0, 'j5xHRN5Nr0E7q8hkUASKAZwpF8C5sL6zZsenRX5r', 0),
(8, 0, NULL, 'Muhammed', 'Irfan', '+919778353192', 'def.png', 'thedevshore@gmail.com', NULL, '$2y$10$VOzHMwr.gd8iUiMGrvXE0OTcGRq6NCZ9pTo83q3D7UFlOnjQtx62G', NULL, '2021-12-05 03:55:10', '2021-12-16 14:22:06', NULL, NULL, NULL, NULL, NULL, NULL, 'c8we6mLQRmadqHch9GB17Z:APA91bELnSloNmVkgfOVTOWSeAZznHorY0NZSkMD2YsVo0_GSoXU9GwzeNUykA8PrH54yX-cDmgKGM_PHEeMtugEK2kdRyqxr8gyxbZTSaFvgkFREP2tgnkh4vQIbAoM0pF18gqcUpya', 1, NULL, NULL, NULL, NULL, NULL, 0, 'QfgpBL0C5cp1Ixxq3CwoW1uS7q9WWtkihBuRloyX', 0),
(9, 0, NULL, 'Gbh', 'Bbb', '+8809207361321', 'def.png', 'ggg@ggh.com', NULL, '$2y$10$1U4Kt0/fgukmz9hAujaErOD3UksLsoAZPUm3bMSDDsjky3nVKC/uK', NULL, '2021-12-05 06:04:56', '2021-12-05 06:04:56', NULL, NULL, NULL, NULL, NULL, NULL, 'cgl_addmQMKe8h_d920mFD:APA91bHTwmeYNpjRICeOD-NpLCffOjZMmiMK1bBftDQrgumt8yE1LemyVQ_R1SpSXKi0fXNLCEUfn3ARQUJmCX3OudvnGGzqCkUe3nXBXiU8lgHT0KVmFjGbhNznlzxVxdHtqVcUgqkA', 1, NULL, NULL, NULL, NULL, NULL, 0, 'MJ6CRkNb4e4M9OJgl24Un72j3AxlsK3HAXfgdk9w', 0),
(10, 0, NULL, 'Asish', 'Sasi', '+8808129075721', 'def.png', 'ranju.sasi@gmail.com', NULL, '$2y$10$O1Ug7C/fQKqE3EM0IfkZG.3cTKiPZ232lwCVzMl.7riBOGhDqEkLm', NULL, '2021-12-06 11:03:31', '2021-12-06 11:03:31', NULL, NULL, NULL, NULL, NULL, NULL, 'dElm4qtdTNKXmUSKjRrYfP:APA91bGg00jVbKeiRDwvti_ifHHHLKgg0CZ9dY4mFjHM9A_giHaQHGEQNKlZAtwLbcHdg1v4BZkbN76xOUKv8caE6CYAp7DGx6yyaZxvkjZ7296cu4ItrBn2gB73599m2EZWx7o2meY_', 1, NULL, NULL, NULL, NULL, NULL, 0, 'jyTZmavh2liuLsAZCYqy854YkzkJsUEPYHaQzy7A', 0),
(11, 0, NULL, 'Sujith', 'MS', '+8809028560930', 'def.png', 'sujithmoozhi@gmail.com', NULL, '$2y$10$/X.rNmLcmR8bFchdwpGKS.m2rR5ilHbFG4ItfeLFyBApIg3D9TTG6', NULL, '2021-12-10 10:13:53', '2021-12-10 10:13:53', NULL, NULL, NULL, NULL, NULL, NULL, 'fKtJQlAkRqi91n0ewM8rTH:APA91bHnzqQ8uFL9JdJ4w8Iplu74khlDsHwMXWoT00gM4h4tb2uADCVxEjDFh2bNjX4Te0f5my34PbjxN52hk2IJMtwoAYU1AeqfHyzMZavxsfhFsmlon1Y4oaeQ2oPa3tcwvy_7wKmP', 1, NULL, NULL, NULL, NULL, NULL, 0, 'd9opA13ZWwMvdz8RvbiqZLGJJ6Y6fLtuYeIA6ieT', 0),
(12, 0, NULL, 'Jayesh', 'Keedayi', '+8808113852578', 'def.png', 'jay2008cusat@gmail.com', NULL, '$2y$10$Z4OJfLOj1ntLc9HhOmyfGeN2EKrrtY2tlt33t7ZefMrWYtkyW3T0i', NULL, '2021-12-25 03:39:44', '2022-01-07 10:39:55', NULL, NULL, NULL, NULL, NULL, NULL, 'fR9P84VwQ6yRI3XL16PmN6:APA91bEfsppbDWt8SfIwHiDyEfhr0kfiZxZkfVvYXli8PHMaWdmXU7VhXAJvfOjJxRyfZhaLFjyqEe6v48Eu5mTyxPvZe1GXISe__ll7-xhUkKz3btyJHPyYc6tb1W3urWbx9n3uQQvl', 1, NULL, NULL, NULL, NULL, NULL, 0, 'VgXFbYOdFI2cyP4BigeYBAui6ysHvQ2ZBNCISBON', 0),
(13, 0, NULL, 'Anson', 'Anto', '+8809567237524', 'def.png', 'ansonea32@gmail.com', NULL, '$2y$10$N2OUrhKSbUeKo2GfxQGOQe4W3yfefcM1P9NyT0Uegs18VmcB81eDC', NULL, '2022-01-10 13:39:14', '2022-01-10 13:39:14', NULL, NULL, NULL, NULL, NULL, NULL, 'eK2qqVBsT5uAbaq1e51dW9:APA91bErHKravI9uxFlxpib6eZR1R5IkhssBbO69XDQ7FC9v49V19tF89xIsB_2PwBJe37NpVT9qvuFOOQTnoOB3gdl3od-tAllDKlvr5099KlidtdyAhDVlresbeBIPLFi79YyBMTCl', 1, NULL, NULL, NULL, NULL, NULL, 0, 'ZhI0V9HQugdVw7w6TPPMhWW6pm5nIAk658gHjfF7', 0),
(14, 0, NULL, 'Ranjana', 'Ammu', '+8807510927083', 'def.png', 'ranjanaparu968@gmail.com', NULL, '$2y$10$W6noJf6naHJhbS7o9ofCdO5OoyBDhQ7z1SNRohxu6aZ9zikItTuZa', NULL, '2022-01-20 14:13:55', '2022-01-20 14:13:55', NULL, NULL, NULL, NULL, NULL, NULL, 'fPKfiX-pRt67dN1Z1E7laj:APA91bGgcI4GZTNEjTsspBCoKREvg5S4IlorOI1h11XQzOFLQEUII06IOQv_vVUamLSx-6BGcYlKiRqRbmqrAGvAlIHZkSs-5jUC2POLUWk0siQmN9telk8RJ_Vz3cAXZ7Ou29fr5ChQ', 1, NULL, NULL, NULL, NULL, NULL, 0, '1DneR3yaeY99slm3Ewj6eGg1Lh8aJY0EYVwwOlpx', 0),
(15, 0, NULL, 'bigoppangadi.com bbbdnwkdowifhrdokpwoeiyutrieowsowddfbvksodkasofjgiekwskfieghrhjkfejfegigofwkdkbhbgiejfwokdd', 'bigoppangadi.com bbbdnwkdowifhrdokpwoeiyutrieowsowddfbvksodkasofjgiekwskfieghrhjkfejfegigofwkdkbhbgiejfwokdd', '86997195677', 'def.png', 'dimafokin199506780tx+z3q3@inbox.ru', NULL, '$2y$10$fbudNUpCn15VjSEzl5jmo.1oIJRGgmmn7HXuxY0c346n1zxL6o35S', NULL, '2022-02-05 02:50:17', '2022-02-05 02:50:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(16, 0, NULL, 'Ambadi', 'K P', '+8808289872067', 'def.png', 'ambadikp123@gmail.com', NULL, '$2y$10$cAu4yWngzuWKHeUL7ctoGeY6zKo6lEUqwshy2ttHV3WOM4Ncv8nGq', NULL, '2022-02-19 12:41:34', '2022-02-19 12:41:34', NULL, NULL, NULL, NULL, NULL, NULL, 'cGwcNy_fTVGv3bUdvZbZi0:APA91bFBwqC_z0MhxfAXk6UMKlU5WdLNFwdni715jWE2MyAUJMImLT3XrnR2uJt_PVYYOm5XcPcI4HqT4SqJOadZu0CqgdSTOtxKlLv35fvcCn9uT2v0ZYdn96HhGSqIRnE68soeB_Ld', 1, NULL, NULL, NULL, NULL, NULL, 0, 'atNmf4KIAOswuq3VJSFGrWjn6tVartbwAmCUYbQw', 0),
(17, 0, NULL, 'r7u6jfythjyfcj4eue75ditkjydgfhkdftuktsdj4 https://forms.yandex.by/u/620ea6fd92ff045939062e15 Low', 'r7u6jfythjyfcj4eue75ditkjydgfhkdftuktsdj4 https://forms.yandex.by/u/620ea6fd92ff045939062e15 Low', 'gisttetbitaskulip@gmx.net', 'def.png', 'gisttetbitaskulip@gmx.net', NULL, '$2y$10$aRCZXpMGYB5yR40MCuqjAuPgipIEVv0wxXB9heJ3o3ahdDEcmSDKy', NULL, '2022-02-22 09:19:50', '2022-02-22 09:19:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(18, 0, NULL, 'Rickyendum', 'Rickyendum', '88485415146', 'def.png', 'k.a.eem.c.co.y1.9.97@gmail.com', NULL, '$2y$10$CPA7lqXCTqIzBnBP9.r43e2nB1nJRguCRQxMTfPglvERsLbuSmide', NULL, '2022-02-24 04:23:08', '2022-02-24 04:23:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(19, 0, NULL, 'Nijo', 'Kallukaran', '+8809744511154', 'def.png', 'nijojkallukaran248499@gmail.commlm', NULL, '$2y$10$wgJOfNDiQ/Hr6Xd7BocwaeD6FgoCHMR1tXSRyA8RJhejJ2t8gtpMS', NULL, '2022-03-02 09:13:22', '2022-03-02 09:13:22', NULL, NULL, NULL, NULL, NULL, NULL, 'dntgm68CRj6ez3V4WZRC0N:APA91bHnXhOshv4A8LVqURcrSwqSlQbGBWOOPtmPAC8FF6s9X3Z_Eelk53w_yYEBSr1bZ-6BeZn0N__x5Xh8m1K4eqs0ZBteO6ZxsEgHk7Ig1GI3X4xkdMsRDHxdov9NhKQCGwiqL-3Y', 1, NULL, NULL, NULL, NULL, NULL, 0, 'ZPMS0kcsRXbgKkwAy0naPL5LoCSdfV1wR1Nt7q8r', 0),
(20, 0, NULL, 'Dream', 'Store', '9446616844', 'def.png', 'francisalen@gmail.com', NULL, '$2y$10$3NgC08pbelr.SwTqVCAhI.NY9OR6gca.01SxdDz4iYwx7XFiFehnK', '578Xiwj8sP7wtPoJisen4iMAcz7EcPaQVWCQY4INF9bRIEgST0RV6vqLy5NP', '2022-03-12 00:01:41', '2022-03-12 00:01:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(21, 0, NULL, 'Mannamparambil', 'Computers', '+8809388001654', 'def.png', 'mannamparambilcomputers@gmail.com', NULL, '$2y$10$kHDEIX3MvunKWK6ClrsXi.XQTKkwmmfhJRgPr4HsW/GC0rkW4ItCK', NULL, '2022-04-08 15:54:31', '2022-04-08 15:54:31', NULL, NULL, NULL, NULL, NULL, NULL, 'fURX1KQLRMW0z8RSkt_0ye:APA91bEahIRFm68Yaw6K7wOFOp-UnglDZ4VgLxW_Rw-UXKxJ5usToNrbb76EJmzuX1BP1HDA7pUP7Wpo15ImYfQQG8ZNrF4yU-KXtUKeTotuGUEwCX_FGlmJ2NOwmlxqqiJKmHRoIkhC', 1, NULL, NULL, NULL, NULL, NULL, 0, '7d0EcW8udxK4OgFZGckrbVJCl8GWiYGCKtrwwqws', 0),
(22, 0, NULL, 'Документ номер WLR246941WLR2 подготовлен. Смотрите документ12 далее на странице http://apple.com', 'Документ номер WLR246941WLR2 подготовлен. Смотрите документ12 далее на странице http://apple.com', 'danilovaianajee@mail.ru', 'def.png', 'danilovaianajee@mail.ru', NULL, '$2y$10$CT3X99uNe5riTlnLNhSnX.QlYCw.XwQRGZKUhDG6QVu3kK/xuHpW2', NULL, '2022-04-15 03:34:03', '2022-04-15 03:34:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(24, 0, NULL, 'Vasantha', 'Ravindran', '+8809605575067', 'def.png', 'vasantharavindran8@gmail.com', NULL, '$2y$10$WSJENTHzzW.oD4eagUDs0ufUlqG/GCPAWCgUGrTMWmQsYyOtGb.pu', NULL, '2022-05-04 09:54:36', '2022-05-04 09:54:36', NULL, NULL, NULL, NULL, NULL, NULL, 'eQvJpETqTpyeTy9pBewkIV:APA91bHRfADmmpqiHAN0NymYmvjmagO9j4yYVmcg01Bzl6GNS_QswscbjiQPhmu_uWE9La_Y_Awpt1HCCfKc7bKfjYtW6zIPArJT3ATTck-5fX-fJ5fLQLgNdo0bgGCyTlqNQnzedWRI', 1, NULL, NULL, NULL, NULL, NULL, 0, 'u2lBUUBc50TQ5bH8HhA492apXl5rLB36f8X6zVmr', 0),
(26, 0, NULL, 'Amina', 'Irfan', '+911234567890', 'def.png', 'hhh@fmail.com', NULL, '$2y$10$v5i9eIUWXp0KB6nlus68Q.gpdtb9HvY8OyHi8lJpSPCoP51q7vwTq', NULL, '2022-05-17 16:47:50', '2022-05-17 16:47:50', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'w069Ofl9SlEOrhJazMOCKaitpMeZaLZV9U83cmEy', 0),
(27, 0, NULL, 'Nashi', 'Ghbn', '+9132659838', 'def.png', 'ghh@hhj.com', NULL, '$2y$10$0VcO8eWS2lPAkb3gT38EpOLMUMC3lyPsyolqfxwIGAmiBEOU/SUH6', NULL, '2022-05-17 16:51:54', '2022-05-17 16:51:54', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'CEnd24VrUiLV6NfZWHR2uHA93oXiXaRzSKcYK1pS', 0),
(28, 0, NULL, 'Gghhh', 'Ghhh', '+913692581473', 'def.png', 'fgf@ghh.com', NULL, '$2y$10$7jpYHaxdD5TWWjhdLQPEh.VtDuA2aU2GevrOPC/MHJQoxx58lusoG', NULL, '2022-05-17 16:54:36', '2022-05-17 16:54:36', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, '5R1NOo88KI5GeiyShgf6OYvRhl4loOtA9u58XWTt', 0),
(29, 0, NULL, 'Fasila', 'Ggf', '+911234567892', 'def.png', 'gggg@fhh.com', NULL, '$2y$10$I/LFpf8MKF1.5R0LtFsL/OxNoL.qCXwPST.zaDB571G4Z5tjqvNYK', NULL, '2022-05-17 16:58:24', '2022-05-17 16:58:24', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'SZD58OENjf7V34iASyrSbf2Onx68cVAchPEw5tm2', 0),
(30, 0, NULL, 'Tg', 'Gg', '+911234567891', 'def.png', 'fgg@fgg.com', NULL, '$2y$10$0N.thnk5XbM2mxnIdRQhSeH6.m1IzgXQJeo4V/KpoyJ7QAnqnjhRm', NULL, '2022-05-17 17:12:11', '2022-05-17 17:12:11', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'uWYXrySpRKsywTtaTeADo1tDfI4UONcPwR4J9zxu', 0),
(31, 0, NULL, 'Vhh', 'Bbb', '+911234567893', 'def.png', 'ghhh@gmail.com', NULL, '$2y$10$S7DgbjAxWnOXoHmuZXxreOf3UZft7guEgnCb3kStnbOdwZMKUf73G', NULL, '2022-05-17 17:17:18', '2022-05-17 17:17:18', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'dBO60njFGiXdL3jPtKLu5JpbMh3ieBknC22ZvKUf', 0),
(32, 0, NULL, 'Bha', 'Bbsbs', '+911234567823', 'def.png', 'hhh@hh.com', NULL, '$2y$10$6j7wJEiYVjyrg2/K5sSuneDFra9mP7mtrCm62Axob7o5y7crKRF.K', NULL, '2022-05-17 17:22:35', '2022-05-17 17:22:35', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'dpbW2KBn9Hvw4EzCe6LpWKarDvcRQLxMIjDweIfF', 0),
(33, 0, NULL, 'Hhhh', 'Vbnn', '+91123456987', 'def.png', 'gggg@ffg.com', NULL, '$2y$10$lefeDgb.9989zSoXNjCuKueRY4n0U0Em1d4u9FZ6rcqUcg9qDfzhq', NULL, '2022-05-17 17:41:58', '2022-05-17 17:41:58', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'WfUp3ixnpjuvukMtnYCa9ceWPqvnKS2eqGzPFkUE', 0),
(34, 0, NULL, 'Hjk', 'Hhj', '+91852369741', 'def.png', 'ghh@ghh.com', NULL, '$2y$10$0PZjFLH5RBStx6lDxcYvT.vjSCrCEm3mUgZ3xarOkXLPMntdmoaQa', NULL, '2022-05-17 17:43:19', '2022-05-17 17:43:19', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'TIJl28avf5Xc6INDIRgrCbnazvb97ZGT9E131fic', 0),
(35, 0, NULL, 'Ghj', 'Yhh', '+91159357258', 'def.png', 'ccgv@ffg.com', NULL, '$2y$10$jNEMgsY8u1CTblt7P/iMhOIF3F1MPK6nEQ9wG1i/rN.rWhdJ9ghi2', NULL, '2022-05-17 17:44:38', '2022-05-17 17:44:38', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'jlzbK26FL8JTST94SnaTPhbVszyi7vsZgTvewOB4', 0),
(36, 0, NULL, 'Fh', 'Tyy', '+91123789456', 'def.png', 'rfg@ff.com', NULL, '$2y$10$ZE4NWVnwjKS9EfFm1J0pE.xya2.q/S7j/AX3Yk9yovex2TYojhhOi', NULL, '2022-05-17 17:45:46', '2022-05-17 17:45:46', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'ksFY5oA6JBI4HzmK5mQcDuG6tzPSI7QupSuTkVxu', 0),
(37, 0, NULL, 'Fvg', 'Gg', '+913692581470', 'def.png', 'fcvv@hh.com', NULL, '$2y$10$ZRy/ZhOcp3vj99M8w4N.5e4M5HvqhEuXh/cT4eNsDNguwjUHKwn.C', NULL, '2022-05-17 17:49:36', '2022-05-17 17:49:36', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'MXscKlJn4Ohm6I9CE8z7fXSryLXqTXBuA3FbXdcn', 0),
(38, 0, NULL, 'imirfan', 'Hhh', '+911232587890', 'def.png', 'ggggg@fhh.com', NULL, '$2y$10$sbiddoe1Bi/RYy3eqmOareCkVSaeEw0rZ/VaLO.Zgso4MrT.tTulu', NULL, '2022-05-17 17:50:58', '2022-05-17 17:50:58', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'L2WefvSxVRUcEIIokSZbmyRg2t6vjqeKRU8DAiZU', 0),
(39, 0, NULL, 'Hhb', 'Vvv', '+917893691472', 'def.png', 'fff@gg.com', NULL, '$2y$10$1R66fCUNyhZgZFwkvzlUY.xQ8SCcuSJZcjaH3i/jR4NyMPzdUqYVe', NULL, '2022-05-17 17:54:33', '2022-05-17 17:54:33', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 10, NULL, NULL, NULL, NULL, NULL, 0, 'fc9a9M1hJlFS4Yo4nVzzGerYIb9Y0WJBshBmT95k', 0),
(40, 44, NULL, 'Gvv', 'Gggfggh', '+913214566542', 'def.png', 'ghrggh@ghh.com', NULL, '$2y$10$Kc6F1EUvUGOlD1dykDz98uLm5zhfOGFujEN5pBv/U4A9K0oUkafDy', NULL, '2022-05-17 18:00:11', '2022-05-17 18:00:11', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'rVo035zqy6dPPIyXV5YTvRWbqDPxAktebJVttLPi', 0),
(41, 44, NULL, 'Myttd', 'Ghkkj', '+913214567890', 'def.png', 'ghhrerfghhh@fg.com', NULL, '$2y$10$24ufoDXCZExPuf/AYoKaJeD/SS9CRx2GqcDmq4H89jI4RDxouk8oW', NULL, '2022-05-17 18:10:32', '2022-05-17 18:10:32', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'dYFRMWyuEIEOtEVOtM4YHKva2xQQR86QD1WQMIcv', 0),
(42, 10, NULL, 'Kumar', 'Vhh', '+911593572583', 'def.png', 'vhhh@frr.com', NULL, '$2y$10$m5t2qflxBnmlh/2eZ6Be2.Qu.mIgoFtRGrY1Cd1OnopCgsdyeHYbS', NULL, '2022-05-17 18:12:39', '2022-05-17 18:12:39', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'J8iju52CB39CzhlzTLrWo2H55sNrS7oMOySgVSQG', 0),
(43, 10, NULL, 'Afra', 'Irfan', '+911472583692', 'def.png', 'irfdv@fgh.com', NULL, '$2y$10$MjIH.tDt/WkB3eyHqdvJdudGrY0RtvHpMirmOWhkRUzp76VLOVhLS', NULL, '2022-05-17 18:14:11', '2022-05-17 18:14:11', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'vvpOLb5yk1IlDNuy7AG4T3yvIi0gNfbtHoyScjsN', 0),
(44, 10, NULL, 'Amina', 'Irfan', '+919895999564', 'def.png', 'amina@gmail.com', NULL, '$2y$10$zxKP3x3u8y81Mh1aNYTw4exH1GYXaU2JMxLxFJH9Dfn.wFXmBuStG', NULL, '2022-06-05 18:41:23', '2022-06-05 18:41:23', NULL, NULL, NULL, NULL, NULL, NULL, 'dFqFR1yqSQ6EaB150xE35n:APA91bHXOGYvZ92NXToVAPOLyhJPdgQEn03muuCj0MorpDHv_-FD0i4sYJ0mKASXSWSSNWZBTLs2w4uvOVSRZOlmirxfG7H487NMoIaqFp8r12EAPIcKuipUKNTQy6Js6BMExU6x5Gig', 1, NULL, NULL, NULL, NULL, NULL, 0, 'TBwLDGWUbgD7wKM1lDjClhu9xuADCbUCdYbt0LZc', 0),
(45, 0, NULL, 'rer', 'ergerg', '9207361326', 'def.png', 'ergergerg@gmail.com', NULL, '$2y$10$oBZFQSNeeonGplEobNvnFeEZ9Ci0HhD8iYj326LBkstVl.RDDEq1i', NULL, '2022-06-14 07:37:21', '2022-06-14 07:37:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(46, 0, NULL, 'BOKEHMALL TESTING CE', 'BOKEHMALL TESTING CE', '9207361325', 'def.png', 'bokehamalltesting@gmail.com', NULL, '$2y$10$yspOPQVK1/vLOzyHJFAQreCd0mKUOb84eIpaoKWIOZfebUmxnThq6', NULL, '2022-06-14 07:46:53', '2022-06-14 07:46:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 'MKQIno3Fjj76smMpv9QfAUJVcLmkCS7d1jlytKBF', 0),
(47, 0, NULL, 'Chithrabhanu', 'N S', '+919745441503', 'def.png', 'chithrabhanu196@gmail.com', NULL, '$2y$10$9x0wmLCQXrm6Pt5j0JDSUuOwm/spOKuMMrPz3pdfan/J/ehrPhgbS', NULL, '2022-06-14 09:54:15', '2022-06-14 09:54:15', NULL, NULL, NULL, NULL, NULL, NULL, 'c9bkgFtKTE2Wmw27LM5MGT:APA91bGbJYnJzOJCyHKzHD6POoj7SxxjnBu10W5XvoK4yd2i0VZMdYlS_4wTHQMwcp93WqM25GjoO1dXqbdeKNeqQwy8rLMwU6iVlEFldFLMUcH0Jyru9YbPLhTGorlJdWPguTpvmauB', 1, NULL, NULL, NULL, NULL, NULL, 0, '8IJPxBs8JRm8Md4UXFNVguylvaHUQsRixPWBwxXm', 0),
(48, 0, NULL, 'Sinto', 'Sebastian', '+918301085541', 'def.png', 'sintosebastian2@gmail.com', NULL, '$2y$10$3bKKJfiCyQy.l0h1OF.ia.z5jY9RumDSnDjJPd.LkoNN82bv2BLvq', NULL, '2022-06-23 09:54:10', '2022-06-23 09:54:10', NULL, NULL, NULL, NULL, NULL, NULL, 'eAGpez_7Rd-LV35jTaTa85:APA91bH4aBpCQWATYuiabaLTiLLbRN6BGCs3LkRrZmtSbPJAzvOTt1Z0biTH2COC067kbXe4zw3qm4_niD4oNHkgjbrmRZfobmMAEJCt45EIepmihveWGrT04WuDFaDxfy3YjREfIFte', 1, NULL, NULL, NULL, NULL, NULL, 0, 'UZK9HRyoFDPZzqTMtLvQG7zgI8QbbCCBhrxl9bUe', 0),
(49, 0, NULL, 'Jinoy', 'T', '+919895171509', 'def.png', 'jinoytom.manjaly@gmail.com', NULL, '$2y$10$uZifYRAqJsWM8JcuDP1Kee6YmFlBVlDtPCF4RNzg0iVoVtgwqdvBW', NULL, '2022-06-25 05:38:45', '2022-06-25 05:38:45', NULL, NULL, NULL, NULL, NULL, NULL, 'c1IYZdTxSsGtdplFaP0ien:APA91bHiKcFyQDfk_xMuOzp21FHIbbH1ohPXya1xJKavOzou1XV47D0vVJb0_r5jtr5EmOX6RR2oN-HxxsRUXWBesWaNgw-Xkhry6vftaP5qqeYT4KlBTYGME7nASfi2dMtfBdFOJaow', 1, NULL, NULL, NULL, NULL, NULL, 0, 'NbgMRmnsalJlPrZhzbOZfMxW8pxICGu8f8JcD2T7', 0),
(50, 0, NULL, 'Vinu', 'Menoly', '+919048803998', 'def.png', 'vinusivaram5@gmail.com', NULL, '$2y$10$QuGozcYu3h4MtoiQnIKZ..kSfXM5bxwtqa7E1BbEOtw36/NF1ImJe', NULL, '2022-06-26 03:45:32', '2022-06-26 03:45:32', NULL, NULL, NULL, NULL, NULL, NULL, 'fUbAvBNNRyeNUzS44KdRCt:APA91bFoOATgk-6my01qfVhM4qUc9yjFvApVat_ZXjYEGgGcwXbLXhAj8cl-psbMjcUOQizKk1F6Z5-c2rhnNcLi-p0YuTrgT1wtuRFgD86emJ8AIP2PR4c9BddrOxSvJeVlve2YwT3c', 1, NULL, NULL, NULL, NULL, NULL, 0, 'wUjsJ86JWbL5MPDCV8x9m1L5Wd4xRxkPzFevLB4K', 0),
(51, 0, NULL, 'Thomas', 'Raju', '+919745767785', 'def.png', 'thomasraju390@gmail.com', NULL, '$2y$10$3BZn7Rft/C32yC7w8X7n8uymi/oilYMhd8DIdP.aNKhjsWgiHH3PO', NULL, '2022-06-28 08:43:07', '2022-06-28 08:43:07', NULL, NULL, NULL, NULL, NULL, NULL, 'eo6zO3kqSVOh0FXCaIP7fQ:APA91bFBp1AZ7YooXpLNypN05VyNK2sZDz9YuCIN7n_ePabZmQ47_NqJrj36GG-acOpSixTtuX8l8bh97Ku2tHQRDZwDw3i8geoJlYUAfwHE6CzvfMJ-ovoAo1ITpxrq8UL-h4ktAAvO', 1, NULL, NULL, NULL, NULL, NULL, 0, 'avgxuSu3hS5EnsYveTkUcfArxruIC3cXO37lcEMQ', 0),
(52, 0, NULL, 'Jayanthi', 'KB', '+918606549440', 'def.png', 'jayanthikb123@gmail.com', NULL, '$2y$10$CswoNBdkWPQlYtDpBSmdH.Awqfqlep4/2mfarsGWkK1aRqpUm/6q6', NULL, '2022-07-03 12:40:57', '2022-07-03 12:40:57', NULL, NULL, NULL, NULL, NULL, NULL, 'fPBLDYKFSLOoHEu12cO_4n:APA91bEqrQYF4F42ik07OSCMhBVBguawoWKYo5bGXH4bsqfxS-tajJ8UTsDfAoM49iJiVCKHiDPFlNGIZpNbSVq0pAW7qChtvXNklOC0jI3EVUCLcMw_9CpsWXtFs1ZyWu4UBSKAAvL-', 1, NULL, NULL, NULL, NULL, NULL, 0, 'eIz8ZfEPOfDSPgtOe5NMDtcwKDrNhviiBlbQVmQ9', 0),
(53, 0, NULL, 'Rejin', 'PR', '+919496840572', 'def.png', 'rejinpr456@gmail.com', NULL, '$2y$10$s9TKBIwnYBDhzRku7GNiEedKkCEz0CuFDqzsPh2iLs92IlR3ba3wC', NULL, '2022-07-08 11:48:01', '2022-07-08 11:48:01', NULL, NULL, NULL, NULL, NULL, NULL, 'cjispZfzRvKtvYPL0u7Jsu:APA91bHxLmHNn172uLQc8OUajvMmWyQIhJTzZMswu4G6De3GwsSZC5NzipRLBBkCmFtQI_g1R2ih_Dwps2tMy28yMtnKHH4SR3uhcuehTF77APPDjz9Q-vbzEhDHxdPm7GBmH4EwCHha', 1, NULL, NULL, NULL, NULL, NULL, 0, 'tbAO3PkyzojTAIF17IcHfCF06SGLrSGma6fvMSxH', 0),
(54, 0, NULL, 'Shemil', 'Prakash', '+919995774565', 'def.png', 'shemilachan@gmail.com', NULL, '$2y$10$h7380IT/oR3dVM1FOTtfFuEfqTlE/MQOTG4iYHP2ffjdwJTXQxFxm', NULL, '2022-07-11 11:45:39', '2022-07-11 11:45:39', NULL, NULL, NULL, NULL, NULL, NULL, 'f9Ip8bQ3QAydWnGEP7Hesq:APA91bG6EYRU6hzZaqBKqVl-82WEPYVTv5ri1YqpMwr3LjF-VWWhV0HRZPEEnbTIlh96PnoxH-d9TeNwFxAcwYw-KKVVdcJscitgXgSIuJgS6lYzmPLSWU8LpYq5jAs-piMd8s8m6Ger', 1, NULL, NULL, NULL, NULL, NULL, 0, 'WWsWPBUCWU6dA80TtTh0bSeNuu3fFEKvqKCO0k3x', 0),
(55, 0, NULL, 'Kiran R', 'Menon', '+919645935813', 'def.png', 'rajanakiran412621@gmail.com', NULL, '$2y$10$IJRKZRd5OCaLOGf8EEs90e3gLBnTab70yX81JTRZiBNAewi1xBk8y', NULL, '2022-07-14 08:25:36', '2022-07-14 08:25:36', NULL, NULL, NULL, NULL, NULL, NULL, 'fEgww8mGR0SLHrzQErn3uE:APA91bHfsJRMpe6gWzdu7Xmq_jZccKqr5Xr5tYfWC7CkfbxrqcRM_2RTILjbOT_1Cf9VQcin42ETGOn5wVblt5uUkEA-JsE-RKAHaEDzebDhH0s9l8LbulTdtRl8mkzX6JItA-BUvVam', 1, NULL, NULL, NULL, NULL, NULL, 0, 't3pF1uWrXKwAZaNLdd35wfk9M7j5VUPjwpRgioGD', 0),
(56, 0, NULL, 'Sanil', 'Jose', '+919072927490', 'def.png', 'saniljs06@gmail.com', NULL, '$2y$10$3rbDs9b5bdFDzwjC2YjSXu1Nwo/wIJntPETRm/7prWT.cFVNTIl/G', NULL, '2022-07-15 07:46:38', '2022-07-15 07:46:38', NULL, NULL, NULL, NULL, NULL, NULL, 'f-nKHvsBQKWuO-bxp3MwjU:APA91bE7WzDkZdqhIGhZsj-TreOxOGZ44dqudt9gpQMokKwR22np_nmMoWIXHYJPCz65E6rQKnUcGia78CUL31U4XLIgs-ijhWc2Xq2csZWeJE3dqhyYxKv6NsfyRylM3uI3aQQBtsrk', 1, NULL, NULL, NULL, NULL, NULL, 0, 'omkABb3DEGTbi5MavrcWfSxpqurQnbMWsAX1EgJF', 0),
(57, 0, NULL, 'Albin', 'Joseph', '+918086317921', 'def.png', 'anattporumattam1996@gmail.com', NULL, '$2y$10$MQd5ZUSUSCqtd0.Hny22pOqTCBG1TwtrlRHKEyLkeqBD5y3OVNO6m', NULL, '2022-07-19 17:16:40', '2022-07-19 17:16:40', NULL, NULL, NULL, NULL, NULL, NULL, 'fKDEaJZiT1iFf8aOXhm-B9:APA91bEqchNu90oa9nYE7FvQwvRpLL1DodQjkrnpGMXwXlAnsGnkfsn62ZTEOpKnkK_nt9evhK-eO_po4EqvzxJqs3Xop5IN2RzaK25PjMqBlNOSZpSZGPTECr7r3GEuFyvMO-bRZnR6', 1, NULL, NULL, NULL, NULL, NULL, 0, 'CA6yQ9FqxTDZjO4ur6JylmgNTAtTt1VB4uwH9gnY', 0),
(58, 0, NULL, 'Arjun', 'P', '+919744665232', 'def.png', 'arjukkp91@gmail.com', NULL, '$2y$10$7/jr8EOE2KoihGuGCkGJU.OCbwLNMjgfsThWN6dTmAEIMtHllNTjK', NULL, '2022-07-20 05:33:07', '2022-07-20 05:33:07', NULL, NULL, NULL, NULL, NULL, NULL, 'cPOx_LHMQASbOhKYwDgVbJ:APA91bEpvUGKI6Xu0GzY67Uwmvjr_mjBe14AKV6RCTL9UcbwAOWNItLrmqks_waRlnCSQUHlnU81s9zkaL5x8AvMR9MvfM6czX5hAAzRw_vUgN2FvbQaduw8i-ybpbQ1lf-l1CVb_WaT', 1, NULL, NULL, NULL, NULL, NULL, 0, '8XGRpU0viz3wpIhbi4nLNzJmtMwwysrNVjqZRPqw', 0),
(59, 0, NULL, 'Vijesh', 'Gopi', '+919496973708', 'def.png', 'vijeshgopi1984@gmail.com', NULL, '$2y$10$A9k/VgbHmlbppIm7z6IbGetXXJUku4BRLx.q6pyqO1eGPLYhX0Nlm', NULL, '2022-07-20 13:18:00', '2022-07-20 13:18:00', NULL, NULL, NULL, NULL, NULL, NULL, 'dz4YiRZ4TJ6iqnrx6EgNHe:APA91bGD-7nPN8ohQoXsnwWuSCkiWAfkmRYGMkdH4NWT70cYlyvBhw8broyu0AnAk0d4mQmOMwWEB1Kp7uLYUxCTu8YXo2bGLf7EDfi2nauftUTxgoWO5fu2cQ2plaTiJObjJWjKPdDf', 1, NULL, NULL, NULL, NULL, NULL, 0, 'iCkFv2SbF5VUBqfNU9teo0aDiKeYrBz3KniGoIbc', 0),
(60, 0, NULL, 'PARTH', 'SHAH', '9423516596', 'def.png', 'parthshah94@rediffmail.com', NULL, '$2y$10$JhSJ6G5qlFyzW2If4eARVOUVz2omtBnU7am4P93cssJF7aXkDguX.', NULL, '2022-07-26 10:35:49', '2022-07-26 10:35:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(61, 0, NULL, 'Muhammed', 'Afnan', '+919207361321', 'def.png', 'afnan@gmail.com', NULL, '$2y$10$BhFZrv9Ao9InLU02iAQnqutz9DduA2d6obCjeRKqDaQXB7iP7L53.', 'cnlI8abYEId6OUGMj92v2QwMi3ODKUtYN39pRuwUAlfkWdhT3zYypOKNF9ML', '2022-08-17 04:57:52', '2022-10-22 07:08:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0),
(62, 0, NULL, 'Test1', 'test', '7894561231', 'def.png', 'testing@test.com', NULL, '$2y$10$7qfEdxcirisvGDTI4g7J.OGO4jJdBNDSg3CJOq6eWEIifd3bT6HgK', NULL, '2022-09-06 03:19:45', '2022-09-06 03:19:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(63, 0, NULL, 'testing', 'test', '7676301863', 'def.png', 'leisuresoul@gmail.com', NULL, '$2y$10$d41dEdOlKniQoqSgjseMWeU.4Xo0GUzIwkw.RfFxubKWJhSZwAWJ.', 'vPGmOHbyDPBmYdgfhn4JWRDUAJGE1s1alVu3i5yUqeO8iEjVxcJjRQVAyd97', '2022-09-06 03:21:43', '2022-10-22 09:21:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 'iWm8nnel7kfq9F8YeG4wKJAwT9T1LARbQNP2n3wH', 0),
(64, 0, NULL, 'Nandy', 'sathy', '8056890388', '2022-09-08-6319b63ae24a3.png', 'nansnandy44@gmail.com', NULL, '$2y$10$J8sBqfRVq/YVNFfpSV7ile4Gp8KaHDrAYcn05zfCAAUxQmWLJf19q', 'bzkAtShTcZQj29brQ4fPLbGVw1al5JC2LUJg0F5BUCycu4hyWKW8jr0I9vMK', '2022-09-08 09:27:50', '2022-09-08 09:31:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(65, 0, NULL, 'Bharathi1', 'jeya1', '9600749619', 'def.png', 'bharathisathiyamoorthy@gmail.com', NULL, '$2y$10$ISmEiLnx7ZnpojxRtm5O9OFaG3zCigds32MtmxeYLrsFA5i2/TTvm', NULL, '2022-09-08 09:35:50', '2022-09-08 09:35:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(66, 0, NULL, 'INFO', 'UPMARKT', '9207361321', 'def.png', 'info@upmarkt.com', NULL, '$2y$10$WsuzhEOszigJAB2icvsAUeunbCvP17qq4YLmOGzZVwSJQG/A6lYUm', NULL, '2022-09-08 10:40:38', '2022-09-08 10:40:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(67, 0, NULL, 'Nandy', 's', '9500435789', 'def.png', 'nandhinis1993@yahoo.in', NULL, '$2y$10$dkMFdRIyO.NdbGVz3NQP8.LzwGOOH4M5I8Xl6/S./Hs/BA0QSgiva', NULL, '2022-09-15 14:35:30', '2022-09-15 14:35:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(68, 0, NULL, 'Khalid', 'Ali', '+923415951293', 'def.png', 'khalidchaudry130@gmail.com', NULL, '$2y$10$jdpAzP.hS960PkYwcMOVLeGpfmZVUSamO..NAI8pi4WeridJltUuS', NULL, '2022-09-17 12:45:53', '2022-09-17 12:45:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 'yvv35tKNV5CtDNzZHQlG65knpiIhpgUjWjFbeK9Z', 0),
(69, 0, NULL, 'Adil', 'A', '+917676301863', 'def.png', 'luxtondecor@gmail.comcom', NULL, '$2y$10$sMgsVttpw5ci/EHR0wik3uU/vTAtH6A.sc2lTSHGwrfnBSIooLhNS', NULL, '2022-10-19 08:24:08', '2022-10-19 08:24:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, '06BLIUsjYYGKC95vb8f47m4QsyD7tr68xEN2eGSR', 0),
(70, 0, NULL, 'Muhammed', 'Irfan', '8050570353', 'def.png', 'saleel@gmail.com', NULL, '$2y$10$89QsLIjLJMAzPKzpsEiGZe8C2t6xOBfx5dlAToExd3RMq5e.s4baK', NULL, '2022-10-20 16:44:27', '2022-10-20 16:44:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0),
(72, 0, NULL, 'Irfan', 'Muhammed', '', '2022-10-22-63543355770b5.png', 'irfanmiamik@gmail.com', NULL, '$2y$10$LHvkq0SAd7UCx./33yG3QO6v6RHJfA4AaVrO9nhU91DfZJfCJhpam', 'xkdSygZrIVZP7pxQUWYh8Oy4ZsnjRhqEd3FuXAbZTvXGjSr6sv3CQlHdXmQn', '2022-10-22 03:41:29', '2022-10-22 18:15:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'facebook', '5649010558454011', 0, 'wsucOdWCjpwpG2rHR01RAj3EsJ3DLnNJ6DfsbgiX', 0),
(73, 0, NULL, 'Muhammed', 'Irfan', '', 'def.png', 'irfan.fullstacks@gmail.com', NULL, '$2y$10$lKTjA/Vu.cejh8.MJ9sQ8u8keNgGXOrYVaRlQCTcQSHx9H1YtLPgy', 'UdDHo0uHv2IcpEdZeVhSwAOUMJcIvnC16uSOOryjf0KYOSq2K8jw3PPEjFkf', '2022-10-22 07:02:06', '2022-10-30 07:35:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'google', '108030724352659097019', 0, 'cnQpKWveTXXoShXepDsXxB3MsBW2i996cuoMPMZO', 0),
(74, 0, NULL, 'Muhmmed', 'Kabeer', '8301078116', 'def.png', 'irfan.fullstack@gmail.com', NULL, '$2y$10$Et94zO29EbbWSjiyaBiwleLdlZ9NACf2ub6qStWL75YfkVgvMyyWm', NULL, '2022-10-22 07:15:28', '2022-10-22 07:15:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0),
(75, 0, NULL, 'adil', 'ahmed', '', 'def.png', 'adildesign@gmail.com', NULL, '$2y$10$P/4GT9p3kvGmcc7IoWNMmODQH15l.26u2acIqgkk4jg3V9u0bdGo6', 'C4XUHlHBMYow8RCLJqsKnC7QshXK2cPcmX9X2ZnmPQhF2V693XIJ80kWAm9C', '2022-10-22 09:22:20', '2022-10-22 09:22:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'google', '111805883093261531886', 0, 'jZZvEYmT8pZKn8STxFHQMz67n7n6XnUrFYTcwhhe', 0),
(76, 0, NULL, 'Eee', 'Ttt', '+917406380207', 'def.png', 'rty@dfg.com', NULL, '$2y$10$as9a4apL7CpN7JDXM1gT6.vtxJl1Zd1iBKHp/R4VtSQiS4plAsJsi', NULL, '2022-10-23 01:20:29', '2022-10-23 01:20:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, '7qSy7VGLBXSQRVzlK1C6Df1glJNkQraQ20V90u7p', 0),
(77, 0, NULL, 'homechoice', '', '', 'def.png', 'hcinfo2022@gmail.com', NULL, '$2y$10$aqsqKApxPF2r1ygvo8a11OKnERL98vw9Iqmd6Ogqelb5/85c5yKPy', '3UEQg4RevDZV2qZS19xCddJRtqiKeT07dxVlPIcyAEQvoI1GCFL1dClY1xmP', '2022-10-25 05:56:37', '2022-10-25 05:56:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'google', '114130865033355298543', 0, 'eNT5dWbW3xMJ0CZxsWLv3cHjWuw6vb2nTEdsWbDf', 0),
(78, 0, NULL, 'Illyas', 'A', '', 'def.png', 'ivaradesign@gmail.com', NULL, '$2y$10$E277ohtqV4LInKeJiE2PeuV1m6nXiLOy7.ghgYg1tNVM5ZvEGez66', 'G8VuC0xsRgMso58uFzr4M5pCfIvC5Z6HMlu6sLNehZHan4zwXsbM5jp1weSv', '2022-10-26 07:21:08', '2022-10-26 10:37:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'facebook', '1545729002551567', 0, 'jhfCRhazD4u94xXZXLb36lRyHOYcsMIo7BxCFS1B', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(6, 3, 4918, '2022-08-02 12:52:01', '2022-08-02 12:52:01'),
(10, 63, 4926, '2022-09-06 03:22:48', '2022-09-06 03:22:48');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `transaction_note` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bizlog_orders`
--
ALTER TABLE `bizlog_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_locations`
--
ALTER TABLE `delivery_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`identity`);

--
-- Indexes for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posters`
--
ALTER TABLE `posters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bizlog_orders`
--
ALTER TABLE `bizlog_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_locations`
--
ALTER TABLE `delivery_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4100;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100007;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `posters`
--
ALTER TABLE `posters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4959;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
