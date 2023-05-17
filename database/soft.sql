-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 27, 2022 at 12:08 PM
-- Server version: 8.0.31-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soft`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type_id` int DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int UNSIGNED NOT NULL,
  `account_id` int NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int NOT NULL,
  `transaction_id` int DEFAULT NULL,
  `transaction_payment_id` int DEFAULT NULL,
  `transfer_transaction_id` int DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int DEFAULT NULL,
  `business_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_continuous` tinyint(1) NOT NULL DEFAULT '0',
  `stickers_in_one_sheet` int DEFAULT NULL,
  `business_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 4\" x 1\"\\r\\nLabels per sheet: 20', 3.7500, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.1562, 2, 0, 0, 20, NULL, '2017-12-18 06:13:44', '2017-12-18 06:13:44'),
(2, '30 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2.625\" x 1\"\\r\\nLabels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.2198, 0.0000, 0.1400, 3, 0, 0, 30, NULL, '2017-12-18 06:04:39', '2017-12-18 06:10:40'),
(3, '32 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1.25\"\\r\\nLabels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-18 05:55:40', '2017-12-18 05:55:40'),
(4, '40 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1\"\\r\\nLabels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-18 05:58:40', '2017-12-18 05:58:40'),
(5, '50 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 1.5\" x 1\"\\r\\nLabels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-18 05:51:10', '2017-12-18 05:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm\\r\\nGap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-18 05:51:10', '2017-12-18 05:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int UNSIGNED NOT NULL,
  `contact_id` int UNSIGNED NOT NULL,
  `waiter_id` int UNSIGNED DEFAULT NULL,
  `table_id` int UNSIGNED DEFAULT NULL,
  `correspondent_id` int DEFAULT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `booking_status` enum('booked','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT '0.00',
  `owner_id` int UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint NOT NULL DEFAULT '1',
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT '1',
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `transaction_edit_days` int UNSIGNED NOT NULL DEFAULT '30',
  `stock_expiry_alert_days` int UNSIGNED NOT NULL DEFAULT '30',
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci,
  `pos_settings` text COLLATE utf8mb4_unicode_ci,
  `weighing_scale_setting` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT '1',
  `enable_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT '1',
  `enable_purchase_status` tinyint(1) DEFAULT '1',
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT '0',
  `default_unit` int DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT '0',
  `enable_racks` tinyint(1) NOT NULL DEFAULT '0',
  `enable_row` tinyint(1) NOT NULL DEFAULT '0',
  `enable_position` tinyint(1) NOT NULL DEFAULT '0',
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT '1',
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT '1',
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT '1',
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text COLLATE utf8mb4_unicode_ci,
  `sms_settings` text COLLATE utf8mb4_unicode_ci,
  `custom_labels` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Soft Glow Cosmetics Ltd', 133, '2022-07-13', NULL, NULL, NULL, NULL, NULL, 25.00, 1, 'Africa/Nairobi', 1, 'fifo', '0.00', 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null}', NULL, NULL, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":\"softglow\",\"mail_password\":\"password\",\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":\"Mpesa Till\",\"custom_pay_2\":null,\"custom_pay_3\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"product\":{\"custom_field_1\":\"Description\",\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null}}', '{\"default_datatable_page_entries\":\"25\"}', 1, '2022-07-13 11:14:33', '2022-11-26 10:31:36');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int UNSIGNED NOT NULL,
  `invoice_layout_id` int UNSIGNED NOT NULL,
  `selling_price_group_id` int DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT '1',
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_products` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `default_payment_accounts` text COLLATE utf8mb4_unicode_ci,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'Soft Glow Cosmetics Ltd', 'KITUI', 'kenya', 'Kitui', 'KITUI', '254', 1, 1, NULL, 1, 'browser', NULL, '+254705141355', NULL, NULL, 'http://www.softglowcosmetics.co.ke', NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"},\"card\":{\"is_enabled\":\"1\"},\"cheque\":{\"is_enabled\":\"1\"},\"bank_transfer\":{\"is_enabled\":\"1\"},\"other\":{\"is_enabled\":\"1\"},\"custom_pay_1\":{\"is_enabled\":\"1\"},\"custom_pay_2\":{\"is_enabled\":\"1\"},\"custom_pay_3\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2022-07-13 11:14:34', '2022-11-18 12:55:04');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_card_slips` int NOT NULL DEFAULT '0',
  `total_cheques` int NOT NULL DEFAULT '0',
  `closing_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 'open', NULL, '0.0000', 0, 0, NULL, '2022-11-16 18:25:00', '2022-11-16 18:25:37'),
(2, 1, 1, 1, 'close', '2022-11-23 21:41:58', '1642.1800', 0, 0, NULL, '2022-11-18 12:14:00', '2022-11-23 21:41:58'),
(3, 1, 1, 1, 'open', NULL, '0.0000', 0, 0, NULL, '2022-11-24 22:37:00', '2022-11-24 22:37:53');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int UNSIGNED NOT NULL,
  `cash_register_id` int UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pay_method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` enum('initial','sell','transfer','refund') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, '0.0000', 'cash', 'credit', 'initial', NULL, '2022-11-16 18:25:38', '2022-11-16 18:25:38'),
(2, 2, '0.0000', 'cash', 'credit', 'initial', NULL, '2022-11-18 12:14:26', '2022-11-18 12:14:26'),
(3, 2, '65.0000', 'cash', 'credit', 'sell', 334, '2022-11-18 12:44:45', '2022-11-18 12:44:45'),
(4, 2, '0.0000', 'cash', 'credit', 'sell', 334, '2022-11-18 12:44:45', '2022-11-18 12:44:45'),
(5, 2, '100.0000', 'cash', 'credit', 'sell', 335, '2022-11-18 13:38:47', '2022-11-18 13:38:47'),
(6, 2, '0.0000', 'cash', 'credit', 'sell', 335, '2022-11-18 13:38:47', '2022-11-18 13:38:47'),
(7, 2, '1392.1800', 'cash', 'credit', 'sell', 337, '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(8, 2, '0.0000', 'cash', 'credit', 'sell', 337, '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(9, 2, '85.0000', 'cash', 'credit', 'sell', 338, '2022-11-23 21:36:02', '2022-11-23 21:36:02'),
(10, 2, '0.0000', 'cash', 'credit', 'sell', 338, '2022-11-23 21:36:02', '2022-11-23 21:36:02'),
(11, 3, '0.0000', 'cash', 'credit', 'initial', NULL, '2022-11-24 22:37:53', '2022-11-24 22:37:53'),
(12, 3, '250.0000', 'cash', 'credit', 'sell', 378, '2022-11-26 10:46:06', '2022-11-26 10:46:06'),
(13, 3, '0.0000', 'cash', 'credit', 'sell', 378, '2022-11-26 10:46:06', '2022-11-26 10:46:06'),
(14, 3, '250.0000', 'cash', 'credit', 'sell', 379, '2022-11-26 10:47:23', '2022-11-26 10:47:23'),
(15, 3, '0.0000', 'cash', 'credit', 'sell', 379, '2022-11-26 10:47:23', '2022-11-26 10:47:23'),
(16, 3, '250.0000', 'cash', 'credit', 'sell', 380, '2022-11-26 11:25:15', '2022-11-26 11:25:15'),
(17, 3, '0.0000', 'cash', 'credit', 'sell', 380, '2022-11-26 11:25:15', '2022-11-26 11:25:15'),
(18, 3, '215.0000', 'cash', 'credit', 'sell', 381, '2022-11-26 15:14:51', '2022-11-26 15:14:51'),
(19, 3, '0.0000', 'cash', 'credit', 'sell', 381, '2022-11-26 15:14:51', '2022-11-26 15:14:51'),
(20, 3, '200.0000', 'cash', 'credit', 'sell', 382, '2022-11-26 17:59:54', '2022-11-26 17:59:54'),
(21, 3, '0.0000', 'cash', 'credit', 'sell', 382, '2022-11-26 17:59:54', '2022-11-26 17:59:54'),
(22, 3, '200.0000', 'cash', 'credit', 'sell', 383, '2022-11-26 18:23:50', '2022-11-26 18:23:50'),
(23, 3, '0.0000', 'cash', 'credit', 'sell', 383, '2022-11-26 18:23:50', '2022-11-26 18:23:50'),
(24, 3, '465.0000', 'cash', 'credit', 'sell', 384, '2022-11-26 18:39:54', '2022-11-26 18:39:54'),
(25, 3, '0.0000', 'cash', 'credit', 'sell', 384, '2022-11-26 18:39:54', '2022-11-26 18:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `category_type`, `description`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Cosmetics', 1, '001', 0, 1, 'product', NULL, NULL, NULL, '2022-11-13 20:45:08', '2022-11-13 20:45:08'),
(2, 'Earings', 1, 'er', 0, 1, 'product', NULL, NULL, NULL, '2022-11-16 14:25:16', '2022-11-16 14:25:16'),
(3, 'Hair Accesories', 1, 'HA', 0, 1, 'product', NULL, NULL, NULL, '2022-11-16 14:46:55', '2022-11-16 14:46:55'),
(4, 'FOUNDATION', 1, 'FD', 0, 1, 'product', NULL, NULL, NULL, '2022-11-16 15:24:51', '2022-11-16 15:24:51'),
(5, 'MAKEUP', 1, 'MK', 0, 1, 'product', NULL, NULL, NULL, '2022-11-16 15:26:25', '2022-11-16 15:26:25'),
(6, 'POWDER', 1, 'PD', 0, 1, 'product', NULL, NULL, NULL, '2022-11-16 15:34:08', '2022-11-16 15:34:08'),
(7, 'LIPSTICK', 1, 'LP', 0, 1, 'product', NULL, NULL, NULL, '2022-11-16 15:52:37', '2022-11-16 15:52:37'),
(8, 'PERFUMES', 1, 'PF', 0, 1, 'product', NULL, NULL, NULL, '2022-11-16 16:01:15', '2022-11-16 16:01:15'),
(9, 'CHAINS', 1, 'CH', 0, 1, 'product', NULL, NULL, NULL, '2022-11-16 16:18:52', '2022-11-16 16:18:52'),
(10, 'COMBS', 1, 'CMB', 0, 1, 'product', NULL, NULL, NULL, '2022-11-16 16:32:37', '2022-11-16 16:32:37'),
(11, 'SOCK', 1, 'SKS', 0, 1, 'product', NULL, NULL, NULL, '2022-11-16 16:55:01', '2022-11-16 16:55:01'),
(12, 'PERFUMES', 1, 'PF', 0, 1, 'product', NULL, NULL, NULL, '2022-11-16 16:59:29', '2022-11-16 16:59:29'),
(13, 'NAILS', 1, 'NL', 0, 1, 'product', NULL, NULL, NULL, '2022-11-16 17:05:00', '2022-11-16 17:05:00'),
(14, 'HAIRBAND', 1, 'HB', 0, 1, 'product', NULL, NULL, NULL, '2022-11-16 17:12:41', '2022-11-16 17:12:41'),
(15, 'BANDS', 1, 'BND', 0, 1, 'product', NULL, NULL, NULL, '2022-11-16 17:32:36', '2022-11-16 17:32:36'),
(16, 'BRAIDS', 1, 'BR', 0, 1, 'product', NULL, NULL, NULL, '2022-11-18 09:30:09', '2022-11-18 09:30:09'),
(17, 'Weaves', 1, 'wv', 0, 1, 'product', NULL, NULL, NULL, '2022-11-18 10:29:10', '2022-11-18 10:29:10');

-- --------------------------------------------------------

--
-- Table structure for table `categorizables`
--

CREATE TABLE `categorizables` (
  `category_id` int NOT NULL,
  `categorizable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorizable_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` text COLLATE utf8mb4_unicode_ci,
  `address_line_2` text COLLATE utf8mb4_unicode_ci,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `total_rp` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_used` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `position`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-13 11:14:34', '2022-07-13 11:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHC', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NG', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_configurations`
--

CREATE TABLE `dashboard_configurations` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `created_by` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int NOT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `applicable_in_spg` tinyint(1) DEFAULT '0',
  `applicable_in_cg` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `notable_id` int NOT NULL,
  `notable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int UNSIGNED NOT NULL,
  `tax_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT '0',
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT '1',
  `show_brand` tinyint(1) NOT NULL DEFAULT '0',
  `show_sku` tinyint(1) NOT NULL DEFAULT '1',
  `show_cat_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `show_lot` tinyint(1) NOT NULL DEFAULT '0',
  `show_image` tinyint(1) NOT NULL DEFAULT '0',
  `show_sale_description` tinyint(1) NOT NULL DEFAULT '0',
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT '0',
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT '0',
  `show_business_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_location_name` tinyint(1) NOT NULL DEFAULT '1',
  `show_landmark` tinyint(1) NOT NULL DEFAULT '1',
  `show_city` tinyint(1) NOT NULL DEFAULT '1',
  `show_state` tinyint(1) NOT NULL DEFAULT '1',
  `show_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_country` tinyint(1) NOT NULL DEFAULT '1',
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT '1',
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT '0',
  `show_email` tinyint(1) NOT NULL DEFAULT '0',
  `show_tax_1` tinyint(1) NOT NULL DEFAULT '1',
  `show_tax_2` tinyint(1) NOT NULL DEFAULT '0',
  `show_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `show_payments` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer` tinyint(1) NOT NULL DEFAULT '0',
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT '0',
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `module_info` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `business_id` int UNSIGNED NOT NULL,
  `design` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT '0',
  `prev_bal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `contact_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `location_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Sales/Invoice', NULL, '#:.', NULL, 'Cash/Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Due', 'Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'Item', 'Qnty', '@', 'Total', NULL, NULL, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', NULL, NULL, '{\"due_date_label\":null,\"total_quantity_label\":null}', 1, 1, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, '[\"product_custom_field1\"]', NULL, NULL, '2022-07-13 11:14:34', '2022-11-26 10:45:09');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int DEFAULT NULL,
  `invoice_count` int NOT NULL DEFAULT '0',
  `total_digits` int DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sales/Invoice', 'year', NULL, 1, 11, 4, 1, '2022-07-13 11:14:34', '2022-11-26 18:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `uploaded_by` int DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_07_05_071953_create_currencies_table', 1),
(4, '2017_07_05_073658_create_business_table', 1),
(5, '2017_07_22_075923_add_business_id_users_table', 1),
(6, '2017_07_23_113209_create_brands_table', 1),
(7, '2017_07_26_083429_create_permission_tables', 1),
(8, '2017_07_26_110000_create_tax_rates_table', 1),
(9, '2017_07_26_122313_create_units_table', 1),
(10, '2017_07_27_075706_create_contacts_table', 1),
(11, '2017_08_04_071038_create_categories_table', 1),
(12, '2017_08_08_115903_create_products_table', 1),
(13, '2017_08_09_061616_create_variation_templates_table', 1),
(14, '2017_08_09_061638_create_variation_value_templates_table', 1),
(15, '2017_08_10_061146_create_product_variations_table', 1),
(16, '2017_08_10_061216_create_variations_table', 1),
(17, '2017_08_19_054827_create_transactions_table', 1),
(18, '2017_08_31_073533_create_purchase_lines_table', 1),
(19, '2017_10_15_064638_create_transaction_payments_table', 1),
(20, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(21, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(22, '2017_11_20_063603_create_transaction_sell_lines', 1),
(23, '2017_11_21_064540_create_barcodes_table', 1),
(24, '2017_11_23_181237_create_invoice_schemes_table', 1),
(25, '2017_12_25_122822_create_business_locations_table', 1),
(26, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(27, '2017_12_25_163227_create_variation_location_details_table', 1),
(28, '2018_01_04_115627_create_sessions_table', 1),
(29, '2018_01_05_112817_create_invoice_layouts_table', 1),
(30, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(31, '2018_01_08_104124_create_expense_categories_table', 1),
(32, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(33, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(34, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(35, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(36, '2018_01_27_184322_create_printers_table', 1),
(37, '2018_01_30_181442_create_cash_registers_table', 1),
(38, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(39, '2018_02_07_173326_modify_business_table', 1),
(40, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(41, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(42, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(43, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(44, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(45, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(46, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(47, '2018_02_13_183323_alter_decimal_fields_size', 1),
(48, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(49, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(50, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(51, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(52, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(53, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(54, '2018_02_21_105329_create_system_table', 1),
(55, '2018_02_23_100549_version_1_2', 1),
(56, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(57, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(58, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(59, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(60, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(61, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(62, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(63, '2018_03_06_210206_modify_product_barcode_types', 1),
(64, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(65, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(66, '2018_03_19_113601_add_business_settings_options', 1),
(67, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(68, '2018_03_26_165350_create_customer_groups_table', 1),
(69, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(70, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(71, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(72, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(73, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(74, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(75, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(76, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(77, '2018_04_17_123122_add_lot_number_to_business', 1),
(78, '2018_04_17_160845_add_product_racks_table', 1),
(79, '2018_04_20_182015_create_res_tables_table', 1),
(80, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(81, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(82, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(83, '2018_04_27_132653_quotation_related_change', 1),
(84, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(85, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(86, '2018_05_14_114027_add_rows_positions_for_products', 1),
(87, '2018_05_14_125223_add_weight_to_products_table', 1),
(88, '2018_05_14_164754_add_opening_stock_permission', 1),
(89, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(90, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(91, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(92, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(93, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(94, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(95, '2018_05_22_123527_create_reference_counts_table', 1),
(96, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(97, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(98, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(99, '2018_05_25_180603_create_modifiers_related_table', 1),
(100, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(101, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(102, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(103, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(104, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(105, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(106, '2018_06_07_182258_add_image_field_to_products_table', 1),
(107, '2018_06_13_133705_create_bookings_table', 1),
(108, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(109, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(110, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(111, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(112, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(113, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(114, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(115, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(116, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(117, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(118, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(119, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(120, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(121, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(122, '2018_09_04_155900_create_accounts_table', 1),
(123, '2018_09_06_114438_create_selling_price_groups_table', 1),
(124, '2018_09_06_154057_create_variation_group_prices_table', 1),
(125, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(126, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(127, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(128, '2018_09_10_152703_create_account_transactions_table', 1),
(129, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(130, '2018_09_19_123914_create_notification_templates_table', 1),
(131, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(132, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(133, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(134, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(135, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(136, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(137, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(138, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(139, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(140, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(141, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(142, '2018_10_22_134428_modify_variable_product_data', 1),
(143, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(144, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(145, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(146, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(147, '2018_10_31_175627_add_user_contact_access', 1),
(148, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(149, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(150, '2018_11_08_105621_add_role_permissions', 1),
(151, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(152, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(153, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(154, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(155, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(156, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(157, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(158, '2018_12_14_103307_modify_system_table', 1),
(159, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(160, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(161, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(162, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(163, '2018_12_24_154933_create_notifications_table', 1),
(164, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(165, '2019_01_10_124645_add_account_permission', 1),
(166, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(167, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(168, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(169, '2019_02_19_103118_create_discounts_table', 1),
(170, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(171, '2019_02_21_134324_add_permission_for_discount', 1),
(172, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(173, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(174, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(175, '2019_03_12_120336_create_activity_log_table', 1),
(176, '2019_03_15_132925_create_media_table', 1),
(177, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(178, '2019_05_10_132311_add_missing_column_indexing', 1),
(179, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(180, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(181, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(182, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(183, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(184, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(185, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(186, '2019_07_15_165136_add_fields_for_combo_product', 1),
(187, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(188, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(189, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(190, '2019_08_08_162302_add_sub_units_related_fields', 1),
(191, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(192, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(193, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(194, '2019_09_04_163141_add_location_id_to_cash_registers_table', 1),
(195, '2019_09_04_184008_create_types_of_services_table', 1),
(196, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 1),
(197, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 1),
(198, '2019_09_12_105616_create_product_locations_table', 1),
(199, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(200, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1),
(201, '2019_09_19_170927_close_all_active_registers', 1),
(202, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1),
(203, '2019_10_18_155633_create_account_types_table', 1),
(204, '2019_10_22_163335_add_common_settings_column_to_business_table', 1),
(205, '2019_10_29_132521_add_update_purchase_status_permission', 1),
(206, '2019_11_09_110522_add_indexing_to_lot_number', 1),
(207, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1),
(208, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1),
(209, '2019_11_25_160340_modify_categories_table_for_polymerphic_relationship', 1),
(210, '2019_12_02_105025_create_warranties_table', 1),
(211, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 1),
(212, '2019_12_05_183955_add_more_fields_to_users_table', 1),
(213, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 1),
(214, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 1),
(215, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 1),
(216, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 1),
(217, '2019_12_25_173413_create_dashboard_configurations_table', 1),
(218, '2020_01_08_133506_create_document_and_notes_table', 1),
(219, '2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table', 1),
(220, '2020_01_16_174818_add_round_off_amount_field_to_transactions_table', 1),
(221, '2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table', 1),
(222, '2020_02_18_172447_add_import_fields_to_transactions_table', 1),
(223, '2020_03_13_135844_add_is_active_column_to_selling_price_groups_table', 1),
(224, '2020_03_16_115449_add_contact_status_field_to_contacts_table', 1),
(225, '2020_03_26_124736_add_allow_login_column_in_users_table', 1),
(226, '2020_04_13_154150_add_feature_products_column_to_business_loactions', 1),
(227, '2020_04_15_151802_add_user_type_to_users_table', 1),
(228, '2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table', 1),
(229, '2020_04_28_111436_add_shipping_address_to_contacts_table', 1),
(230, '2020_06_01_094654_add_max_sale_discount_column_to_users_table', 1),
(231, '2020_06_12_162245_modify_contacts_table', 1),
(232, '2020_06_22_103104_change_recur_interval_default_to_one', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(77, 'App\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', NULL, NULL, 0, 0, '2022-07-13 11:14:34', '2022-07-13 11:14:34'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', 'Payment Received, from {business_name}', NULL, NULL, 0, 0, '2022-07-13 11:14:34', '2022-07-13 11:14:34'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, '2022-07-13 11:14:34', '2022-07-13 11:14:34'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, '2022-07-13 11:14:34', '2022-07-13 11:14:34'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', NULL, NULL, 0, 0, '2022-07-13 11:14:34', '2022-07-13 11:14:34'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, '2022-07-13 11:14:34', '2022-07-13 11:14:34'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', NULL, NULL, 0, 0, '2022-07-13 11:14:34', '2022-07-13 11:14:34'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', NULL, NULL, 0, 0, '2022-07-13 11:14:34', '2022-07-13 11:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('softglow389@gmail.com', '$2y$10$mrIlitaPGxbkhzSX4YYg2OibPt9iXhJj6h3QNWwX0H.ojw4ilcIYq', '2022-11-13 22:48:05');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2022-07-13 10:05:42', NULL),
(2, 'direct_sell.access', 'web', '2022-07-13 10:05:42', NULL),
(3, 'product.opening_stock', 'web', '2022-07-13 10:05:45', '2022-07-13 10:05:45'),
(4, 'crud_all_bookings', 'web', '2022-07-13 10:05:46', '2022-07-13 10:05:46'),
(5, 'crud_own_bookings', 'web', '2022-07-13 10:05:46', '2022-07-13 10:05:46'),
(6, 'access_default_selling_price', 'web', '2022-07-13 10:05:47', '2022-07-13 10:05:47'),
(7, 'purchase.payments', 'web', '2022-07-13 10:05:47', '2022-07-13 10:05:47'),
(8, 'sell.payments', 'web', '2022-07-13 10:05:47', '2022-07-13 10:05:47'),
(9, 'edit_product_price_from_sale_screen', 'web', '2022-07-13 10:05:47', '2022-07-13 10:05:47'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2022-07-13 10:05:47', '2022-07-13 10:05:47'),
(11, 'roles.view', 'web', '2022-07-13 10:05:47', '2022-07-13 10:05:47'),
(12, 'roles.create', 'web', '2022-07-13 10:05:47', '2022-07-13 10:05:47'),
(13, 'roles.update', 'web', '2022-07-13 10:05:47', '2022-07-13 10:05:47'),
(14, 'roles.delete', 'web', '2022-07-13 10:05:47', '2022-07-13 10:05:47'),
(15, 'account.access', 'web', '2022-07-13 10:05:48', '2022-07-13 10:05:48'),
(16, 'discount.access', 'web', '2022-07-13 10:05:49', '2022-07-13 10:05:49'),
(17, 'view_purchase_price', 'web', '2022-07-13 10:05:49', '2022-07-13 10:05:49'),
(18, 'view_own_sell_only', 'web', '2022-07-13 10:05:49', '2022-07-13 10:05:49'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2022-07-13 10:05:51', '2022-07-13 10:05:51'),
(20, 'edit_product_price_from_pos_screen', 'web', '2022-07-13 10:05:51', '2022-07-13 10:05:51'),
(21, 'access_shipping', 'web', '2022-07-13 10:05:51', '2022-07-13 10:05:51'),
(22, 'purchase.update_status', 'web', '2022-07-13 10:05:51', '2022-07-13 10:05:51'),
(23, 'list_drafts', 'web', '2022-07-13 10:05:52', '2022-07-13 10:05:52'),
(24, 'list_quotations', 'web', '2022-07-13 10:05:52', '2022-07-13 10:05:52'),
(25, 'user.view', 'web', '2022-07-13 10:57:41', NULL),
(26, 'user.create', 'web', '2022-07-13 10:57:41', NULL),
(27, 'user.update', 'web', '2022-07-13 10:57:41', NULL),
(28, 'user.delete', 'web', '2022-07-13 10:57:41', NULL),
(29, 'supplier.view', 'web', '2022-07-13 10:57:41', NULL),
(30, 'supplier.create', 'web', '2022-07-13 10:57:41', NULL),
(31, 'supplier.update', 'web', '2022-07-13 10:57:41', NULL),
(32, 'supplier.delete', 'web', '2022-07-13 10:57:41', NULL),
(33, 'customer.view', 'web', '2022-07-13 10:57:41', NULL),
(34, 'customer.create', 'web', '2022-07-13 10:57:41', NULL),
(35, 'customer.update', 'web', '2022-07-13 10:57:41', NULL),
(36, 'customer.delete', 'web', '2022-07-13 10:57:41', NULL),
(37, 'product.view', 'web', '2022-07-13 10:57:41', NULL),
(38, 'product.create', 'web', '2022-07-13 10:57:41', NULL),
(39, 'product.update', 'web', '2022-07-13 10:57:41', NULL),
(40, 'product.delete', 'web', '2022-07-13 10:57:41', NULL),
(41, 'purchase.view', 'web', '2022-07-13 10:57:41', NULL),
(42, 'purchase.create', 'web', '2022-07-13 10:57:41', NULL),
(43, 'purchase.update', 'web', '2022-07-13 10:57:41', NULL),
(44, 'purchase.delete', 'web', '2022-07-13 10:57:41', NULL),
(45, 'sell.view', 'web', '2022-07-13 10:57:41', NULL),
(46, 'sell.create', 'web', '2022-07-13 10:57:41', NULL),
(47, 'sell.update', 'web', '2022-07-13 10:57:41', NULL),
(48, 'sell.delete', 'web', '2022-07-13 10:57:41', NULL),
(49, 'purchase_n_sell_report.view', 'web', '2022-07-13 10:57:41', NULL),
(50, 'contacts_report.view', 'web', '2022-07-13 10:57:41', NULL),
(51, 'stock_report.view', 'web', '2022-07-13 10:57:41', NULL),
(52, 'tax_report.view', 'web', '2022-07-13 10:57:41', NULL),
(53, 'trending_product_report.view', 'web', '2022-07-13 10:57:41', NULL),
(54, 'register_report.view', 'web', '2022-07-13 10:57:41', NULL),
(55, 'sales_representative.view', 'web', '2022-07-13 10:57:41', NULL),
(56, 'expense_report.view', 'web', '2022-07-13 10:57:41', NULL),
(57, 'business_settings.access', 'web', '2022-07-13 10:57:41', NULL),
(58, 'barcode_settings.access', 'web', '2022-07-13 10:57:41', NULL),
(59, 'invoice_settings.access', 'web', '2022-07-13 10:57:41', NULL),
(60, 'brand.view', 'web', '2022-07-13 10:57:41', NULL),
(61, 'brand.create', 'web', '2022-07-13 10:57:41', NULL),
(62, 'brand.update', 'web', '2022-07-13 10:57:41', NULL),
(63, 'brand.delete', 'web', '2022-07-13 10:57:41', NULL),
(64, 'tax_rate.view', 'web', '2022-07-13 10:57:41', NULL),
(65, 'tax_rate.create', 'web', '2022-07-13 10:57:41', NULL),
(66, 'tax_rate.update', 'web', '2022-07-13 10:57:41', NULL),
(67, 'tax_rate.delete', 'web', '2022-07-13 10:57:41', NULL),
(68, 'unit.view', 'web', '2022-07-13 10:57:41', NULL),
(69, 'unit.create', 'web', '2022-07-13 10:57:41', NULL),
(70, 'unit.update', 'web', '2022-07-13 10:57:41', NULL),
(71, 'unit.delete', 'web', '2022-07-13 10:57:41', NULL),
(72, 'category.view', 'web', '2022-07-13 10:57:41', NULL),
(73, 'category.create', 'web', '2022-07-13 10:57:41', NULL),
(74, 'category.update', 'web', '2022-07-13 10:57:41', NULL),
(75, 'category.delete', 'web', '2022-07-13 10:57:41', NULL),
(76, 'expense.access', 'web', '2022-07-13 10:57:41', NULL),
(77, 'access_all_locations', 'web', '2022-07-13 10:57:41', NULL),
(78, 'dashboard.data', 'web', '2022-07-13 10:57:41', NULL),
(79, 'location.1', 'web', '2022-07-13 11:14:34', '2022-07-13 11:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int UNSIGNED DEFAULT NULL,
  `sub_unit_ids` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int UNSIGNED DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `sub_category_id` int UNSIGNED DEFAULT NULL,
  `tax` int UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT '0',
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT '0',
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED NOT NULL,
  `warranty_id` int DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT '0',
  `not_for_selling` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(1, 'SKALLA SPRAY -50ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0001', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 20:47:03', '2022-11-23 21:42:53'),
(2, 'BODYLUX SPRAY', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '12.0000', '0002', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 21:49:50', '2022-11-23 21:44:25'),
(4, 'GIRL FRIEND ROLLON', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0004', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 21:56:14', '2022-11-13 21:56:14'),
(5, 'REXONA- 25ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0005', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:02:08', '2022-11-26 18:55:06'),
(6, 'BODYLUX GLYCELINE-50ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0006', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:16:59', '2022-11-23 21:43:37'),
(7, 'SILK CARE GLYCELINE-50ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0007', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:18:45', '2022-11-13 22:18:45'),
(8, 'CARD CYCELINE-30ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '0.0000', '0008', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:20:17', '2022-11-13 22:20:17'),
(9, 'NICE GLYCERINE-40ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0009', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:25:45', '2022-11-13 22:25:45'),
(10, 'NICE GLYCERINE-65ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0010', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:27:56', '2022-11-13 22:27:56'),
(11, 'BAMSI GLYCELINE-50ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0011', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:29:44', '2022-11-13 22:29:44'),
(12, 'MASSAGE OIL-300ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0012', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:30:43', '2022-11-26 17:54:48'),
(13, 'KALUMA-9ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0013', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:34:35', '2022-11-16 18:13:21'),
(14, 'MENTHOL-9ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0014', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:35:54', '2022-11-13 22:35:54'),
(15, 'OLIVE OIL-25ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0015', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:37:28', '2022-11-13 22:39:44'),
(16, 'COCONUT OIL-150ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0016', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:38:39', '2022-11-13 22:38:39'),
(17, 'OLIVE OIL-50ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0017', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:40:53', '2022-11-13 22:40:53'),
(18, 'ARIMIS-50G', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '5.0000', '0018', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:43:01', '2022-11-23 21:34:40'),
(19, 'ARIMIS-100G', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0019', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:44:45', '2022-11-13 22:44:45'),
(20, 'ARIMIS-200G', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0020', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:45:42', '2022-11-23 21:48:11'),
(21, 'TIPTOP-50GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0021', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:46:42', '2022-11-18 16:47:50'),
(22, 'BABY CARE-55G', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0022', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:49:53', '2022-11-13 22:49:53'),
(23, 'BABY CARE-100G', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0023', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:56:17', '2022-11-13 22:56:17'),
(24, 'BABYCARE-200G', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0024', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:57:24', '2022-11-13 22:57:24'),
(25, 'BABY LOVE-60GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0025', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:58:12', '2022-11-13 22:58:12'),
(26, 'BABY LOVE-110GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0026', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 22:59:26', '2022-11-13 22:59:26'),
(27, 'BABY LOVE ANTIDANDRUF-60GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0027', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:00:35', '2022-11-13 23:00:35'),
(28, 'BABY LOVE-500-GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0028', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:01:47', '2022-11-13 23:01:47'),
(29, 'BAMSI HAIRFOOD-5OOGM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0029', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:03:10', '2022-11-13 23:03:10'),
(30, 'BABY CARE-25G', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0030', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:09:10', '2022-11-16 18:10:58'),
(31, 'BABY CARE-25G', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0031', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:09:12', '2022-11-13 23:09:12'),
(32, 'BABY LOVE-250ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0032', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:11:03', '2022-11-13 23:11:03'),
(33, 'SLEEPING BABY-250GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0033', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:13:09', '2022-11-13 23:13:09'),
(34, 'SLEEPING BABY-100GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0034', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:14:02', '2022-11-13 23:14:02'),
(35, 'SLEEPING BABY-50GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0035', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:15:12', '2022-11-13 23:15:12'),
(36, 'BAMSI HAIRFOOD-60GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0036', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:16:10', '2022-11-13 23:16:10'),
(37, 'AMARA LOTION-200ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0037', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:17:05', '2022-11-13 23:17:05'),
(38, 'ZOE-200ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0038', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:17:54', '2022-11-13 23:17:54'),
(39, 'LADYGAY-200ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0039', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:18:41', '2022-11-13 23:18:41'),
(40, 'NICE LOTION-200ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0040', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:23:27', '2022-11-13 23:23:27'),
(41, 'AMARA LOTION-100ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0041', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:25:01', '2022-11-13 23:25:01'),
(42, 'AMARA LOTION-400ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0042', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:26:02', '2022-11-13 23:26:02'),
(43, 'NICE LOTION-100ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0043', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:26:56', '2022-11-26 18:57:19'),
(44, 'NICE LOTION-400ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0044', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:27:54', '2022-11-13 23:27:54'),
(45, 'VESROSE POWDER', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0045', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:28:56', '2022-11-13 23:28:56'),
(46, 'VERSMAN LOTION-100ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0046', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:29:47', '2022-11-13 23:29:47'),
(47, 'VERSMAN LOTION-400ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0047', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:30:42', '2022-11-13 23:30:42'),
(48, 'VERSMAN-200GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0048', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:31:55', '2022-11-13 23:31:55'),
(49, 'VENUS LOTION-100ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0049', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:32:49', '2022-11-13 23:34:02'),
(50, 'VENUS LOTION-200ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0050', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:35:47', '2022-11-13 23:35:47'),
(51, 'VENUS LOTION-50ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0051', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:36:57', '2022-11-13 23:36:57'),
(52, 'BODYLUX LOTION MIX 50ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0052', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:38:01', '2022-11-13 23:38:01'),
(53, 'HAIR REMOVER BLUE VALLEY', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0053', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:38:56', '2022-11-13 23:38:56'),
(54, 'VEET CREAM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0054', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:39:40', '2022-11-13 23:39:40'),
(55, 'COTTONWOOL-50G', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0055', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:40:38', '2022-11-13 23:40:38'),
(56, 'SEDOSO WAX-70ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0056', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:41:43', '2022-11-13 23:41:43'),
(57, 'MOULDING WAX SEDO/ADORA -125ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0057', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:44:17', '2022-11-13 23:44:17'),
(58, 'MOULDING WAX SEDO/ADORA-250ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0058', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:46:34', '2022-11-13 23:46:34'),
(59, 'FAITHLIGHT SPIRIT-500ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0059', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:47:46', '2022-11-13 23:47:46'),
(60, 'FAITHLIGHT SPIRIT-300ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0060', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:48:33', '2022-11-13 23:48:33'),
(61, 'SIRI', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0061', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:49:30', '2022-11-13 23:49:30'),
(62, 'ADORA HAIR GEL-80GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0062', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:50:55', '2022-11-13 23:50:55'),
(63, 'MOVIT GEL- 80GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0063', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '<p>11</p>', 1, NULL, 0, 0, '2022-11-13 23:52:05', '2022-11-13 23:52:05'),
(64, 'MOVIT GEL-140GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0064', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:52:57', '2022-11-13 23:52:57'),
(65, 'MOVIT GEL-360GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0065', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:54:10', '2022-11-13 23:54:10'),
(66, 'STYLING SEDOSO-80GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0066', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:55:17', '2022-11-13 23:55:17'),
(67, 'STYLING SEDOSO', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0067', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-13 23:57:16', '2022-11-13 23:57:16'),
(68, 'MOVIT BRIGHTER-50GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0068', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:05:19', '2022-11-14 00:05:19'),
(69, 'NICE CHEMICAL MIX-100GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0069', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:06:49', '2022-11-14 00:21:35'),
(70, 'STYLING GEL S FREE-125ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0070', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:08:31', '2022-11-14 00:08:31'),
(71, 'NICE STYLING GEL-100GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0071', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:09:28', '2022-11-14 00:09:28'),
(72, 'VENUS CURL-110GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0072', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:10:24', '2022-11-14 00:10:24'),
(73, 'VENUS CURL-60GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0073', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:11:15', '2022-11-14 00:11:15'),
(74, 'MIADI HAIRFOOD-85GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0074', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:14:49', '2022-11-14 00:14:49'),
(75, 'VENUS HAIRFOOD -110GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0075', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:15:37', '2022-11-14 00:15:37'),
(76, 'OLIVE SPRAY-85ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0076', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:17:05', '2022-11-14 00:17:05'),
(77, 'OLIVE SPRAY- 250ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0077', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:18:12', '2022-11-14 00:18:12'),
(78, 'OLIVE OIL PERFUMES 120', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0078', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:19:11', '2022-11-14 00:19:11'),
(79, 'VASELINE -50ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0079', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:20:14', '2022-11-14 00:20:14'),
(80, 'VASELINE MEN PURE MIX-100ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0080', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:22:43', '2022-11-14 00:22:43'),
(81, 'VASELINE MEN-50GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0081', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:23:38', '2022-11-14 00:23:38'),
(82, 'CLARE CREAM-125ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0082', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:24:33', '2022-11-14 00:24:33'),
(83, 'KOTEX PANTY LINERS', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0083', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:25:25', '2022-11-14 00:25:25'),
(84, 'SUNYGIRL', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0084', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:26:08', '2022-11-14 00:26:08'),
(85, 'SOFTCARE PADS', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0085', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:26:46', '2022-11-14 00:26:46'),
(86, 'FEMISTYLE PADS', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0086', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:27:36', '2022-11-14 00:27:36'),
(87, 'ALWAYS maxi', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0087', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:28:40', '2022-11-14 08:50:35'),
(88, 'KOPTEX ULTRA PAD', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0088', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:30:10', '2022-11-14 00:30:10'),
(89, 'SUBARU', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0089', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:30:47', '2022-11-14 00:30:47'),
(90, 'MOVIT LEAVE-IN-120ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0090', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:32:21', '2022-11-14 00:32:21'),
(91, 'MOVIT LEAVE IN-50ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0091', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:33:22', '2022-11-14 00:33:22'),
(92, 'SHAMPOO-250ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0092', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:34:15', '2022-11-14 00:34:15'),
(93, 'SHAMPOO-500ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0093', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:35:14', '2022-11-14 00:35:14'),
(94, 'GILLETTE', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0094', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:36:06', '2022-11-26 19:40:04'),
(95, 'BIC RAZOR', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '3.0000', '0095', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:36:51', '2022-11-26 17:40:04'),
(96, 'GOLD TOUCH', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0096', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:37:35', '2022-11-26 18:56:43'),
(97, 'GOLD TOUCH-50GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0097', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:38:34', '2022-11-14 00:38:34'),
(98, 'SALAMA ndume', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0098', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:39:22', '2022-11-14 00:39:22'),
(99, 'Earbuds', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '5.0000', '0099', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:40:16', '2022-11-16 18:06:29'),
(100, 'MENENGAI-200GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0100', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:41:04', '2022-11-14 00:41:04'),
(101, 'GEISHA-100GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0101', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:41:53', '2022-11-14 00:41:53'),
(102, 'GEISHA-225GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0102', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:42:41', '2022-11-14 00:42:41'),
(103, 'IMPERIAL-175GM', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0103', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:43:30', '2022-11-14 00:43:30'),
(104, 'SUNLIGHT-175G', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0104', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:44:44', '2022-11-14 00:44:44'),
(105, 'SUNLIGHT-50G', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0105', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:45:47', '2022-11-14 00:45:47'),
(106, 'DETTOL SOAP 60G', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, 'inclusive', 1, '1.0000', '0106', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:46:42', '2022-11-14 00:46:42'),
(107, 'PROTEX', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'inclusive', 1, '1.0000', '0107', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-14 00:47:28', '2022-11-14 00:47:28'),
(108, 'CAFLON EARINGS', 1, 'single', 1, NULL, NULL, 2, NULL, NULL, 'exclusive', 1, NULL, '0108', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 14:27:27', '2022-11-16 14:27:27'),
(109, 'STAINLESS CROSS EARINGS', 1, 'single', 1, NULL, NULL, 2, NULL, NULL, 'exclusive', 1, NULL, '0109', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 14:28:42', '2022-11-16 14:28:42'),
(110, 'EARINGS COATTED-GOLD/SILVER', 1, 'single', 1, NULL, NULL, 2, NULL, NULL, 'exclusive', 1, NULL, '0110', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 14:33:27', '2022-11-16 14:33:27'),
(111, 'EARINGS LOOP', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, NULL, '0111', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 14:35:10', '2022-11-16 14:35:10'),
(112, 'NOSE RING', 1, 'single', 1, NULL, NULL, 2, NULL, NULL, 'exclusive', 1, NULL, '.50', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 14:36:21', '2022-11-16 14:36:21'),
(113, 'EARINGS GOLD/SILVER', 1, 'single', 1, NULL, NULL, 2, NULL, NULL, 'exclusive', 1, NULL, '0113', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 14:37:53', '2022-11-16 14:37:53'),
(114, 'EARINGS STAINLESS-GOLD/SILVER', 1, 'single', 1, NULL, NULL, 2, NULL, NULL, 'exclusive', 1, NULL, '0114', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 14:39:00', '2022-11-16 14:39:00'),
(115, 'STUD', 1, 'single', 1, NULL, NULL, 2, NULL, NULL, 'exclusive', 1, NULL, '0115', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 14:46:22', '2022-11-16 14:52:31'),
(116, 'SHOWER CAP', 1, 'single', 1, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0116', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 14:48:24', '2022-11-16 14:48:24'),
(117, 'KIDS BAND', 1, 'single', 1, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0117', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:00:16', '2022-11-16 15:04:07'),
(118, 'Hardkerchiefs', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0118', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:07:37', '2022-11-16 15:07:37'),
(119, 'UZI ROBIN BLACK', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0119', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:10:11', '2022-11-16 15:10:11'),
(120, 'POLISH REMOVER BEULA-30ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0120', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:13:41', '2022-11-16 15:13:41'),
(121, 'POLISH REMOVER PARADISE -30ML', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0121', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:14:37', '2022-11-16 15:14:37'),
(122, 'WEAVING CAP', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0122', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:15:33', '2022-11-16 15:15:33'),
(123, 'NOORANI HENNA BLACK', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0123', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:19:06', '2022-11-16 15:19:06'),
(124, 'BLACK SHAMPOO', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0124', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:19:53', '2022-11-16 15:19:53'),
(125, 'NAIL HENNA SHAGUN', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0125', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:21:03', '2022-11-16 15:21:03'),
(126, 'CROTCHET', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0126', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:22:05', '2022-11-16 18:21:08'),
(127, 'HAIR PIN', 1, 'single', 1, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0127', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:23:51', '2022-11-16 15:23:51'),
(128, 'BLACK OPAL MATTE', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0128', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '<p>BLACK OPAL MATTE</p>', 1, NULL, 0, 0, '2022-11-16 15:30:43', '2022-11-16 15:30:43'),
(129, 'SLEEK LUCK', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0129', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:31:39', '2022-11-16 15:31:39'),
(130, 'STUDIO FIX KISS BEUTY-POWDER', 1, 'single', 1, NULL, NULL, 6, NULL, NULL, 'exclusive', 1, NULL, '0130', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:35:33', '2022-11-16 15:35:33'),
(131, 'KISS BEUTY MINERAL NUDE', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0131', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:36:25', '2022-11-16 15:36:25'),
(132, 'COMPACT PLUS FOUNDATION SLEEK', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0132', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:39:59', '2022-11-16 15:41:20'),
(133, 'ROSELEAF SUPER SMALL', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0133', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:43:52', '2022-11-16 15:49:44'),
(134, 'AFACE', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '3.00', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:45:45', '2022-11-16 15:45:45'),
(135, 'ROSELEAF SUPER  BIG', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '0135', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:49:13', '2022-11-16 15:49:13'),
(136, 'GREEN TEA POWDER', 1, 'single', 1, NULL, NULL, 6, NULL, NULL, 'exclusive', 1, NULL, '0136', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:51:19', '2022-11-16 15:51:19'),
(137, 'SIGNATURE LIPSTICK', 1, 'single', 1, NULL, NULL, 7, NULL, NULL, 'exclusive', 1, NULL, '0137', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:53:19', '2022-11-16 15:53:19'),
(138, 'POLISH REMOVER PARADISE -60ML', 1, 'single', 1, NULL, NULL, 5, NULL, NULL, 'exclusive', 1, NULL, 'POLISH REMOVER PARADISE -60ML', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:55:06', '2022-11-16 15:55:06'),
(139, 'LUYISI EYESHANDOW BLACK', 1, 'single', 1, NULL, NULL, 5, NULL, NULL, 'exclusive', 1, NULL, '0139', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 15:59:54', '2022-11-16 15:59:54'),
(140, 'LUYISI EYESHANDOW WHITE', 1, 'single', 1, NULL, NULL, 5, NULL, NULL, 'exclusive', 1, NULL, '0140', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:00:27', '2022-11-16 16:00:27'),
(141, 'EYE PENCIL DAVIS', 1, 'single', 1, NULL, NULL, 5, NULL, NULL, 'exclusive', 1, NULL, '0141', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:02:58', '2022-11-16 16:04:54'),
(142, 'EYE PENCIL AIRWOMAN', 1, 'single', 1, NULL, NULL, 5, NULL, NULL, 'exclusive', 1, NULL, '0142', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:04:05', '2022-11-16 16:04:05'),
(143, 'CONCEALER', 1, 'single', 1, NULL, NULL, 5, NULL, NULL, 'exclusive', 1, NULL, '0143', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:07:02', '2022-11-16 16:07:02'),
(144, 'NAIL POLISH CHARM MAX-SMALL', 1, 'single', 1, NULL, NULL, 5, NULL, NULL, 'exclusive', 1, NULL, '0144', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:08:52', '2022-11-16 16:08:52'),
(145, 'NAIL POLISH CHARM MAX-BIG', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, NULL, '0145', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:13:11', '2022-11-16 16:13:11'),
(146, 'NAIL POLISH DODWELL', 1, 'single', 1, NULL, NULL, 5, NULL, NULL, 'exclusive', 1, NULL, '0146', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:14:26', '2022-11-16 16:14:26'),
(147, 'NAIL POLISH BASE/TOP/HARDENER', 1, 'single', 1, NULL, NULL, 5, NULL, NULL, 'exclusive', 1, NULL, '0147', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:16:16', '2022-11-16 16:16:16'),
(148, 'NAIL POLISH CHARM MAX-MEDIUM', 1, 'single', 1, NULL, NULL, 5, NULL, NULL, 'exclusive', 1, NULL, '0148', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:17:09', '2022-11-16 16:17:09'),
(149, 'CHAIN GOLD', 1, 'single', 1, NULL, NULL, 9, NULL, NULL, 'exclusive', 1, NULL, '0149', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:19:32', '2022-11-16 16:19:32'),
(150, 'MASCARA', 1, 'single', 1, NULL, NULL, 5, NULL, NULL, 'exclusive', 1, NULL, '0150', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:20:35', '2022-11-16 16:20:35'),
(151, 'JACKELIN LIPSTICK MATTE', 1, 'single', 1, NULL, NULL, 7, NULL, NULL, 'exclusive', 1, NULL, '0151', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:24:16', '2022-11-16 16:24:16'),
(152, 'LIPSTICK LOVE GLOSEE', 1, 'single', 1, NULL, NULL, 7, NULL, NULL, 'exclusive', 1, NULL, '0152', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:25:21', '2022-11-16 16:25:21'),
(153, 'LIPSTICK 2 IN 1 MATTE GLOSS', 1, 'single', 1, NULL, NULL, 7, NULL, NULL, 'exclusive', 1, NULL, '0153', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:26:32', '2022-11-16 16:26:32'),
(154, 'LIPSHINER GLOSS', 1, 'single', 1, NULL, NULL, 7, NULL, NULL, 'exclusive', 1, NULL, '0154', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:28:12', '2022-11-16 16:30:21'),
(155, 'LIPGROSS', 1, 'single', 1, NULL, NULL, 7, NULL, NULL, 'exclusive', 1, NULL, '0155', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:29:36', '2022-11-16 16:29:36'),
(156, 'LIP BALM', 1, 'single', 1, NULL, NULL, 7, NULL, NULL, 'exclusive', 1, NULL, '0156', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:31:25', '2022-11-16 16:31:25'),
(157, 'WOODEN COMB', 1, 'single', 1, NULL, NULL, 10, NULL, NULL, 'exclusive', 1, NULL, '0157', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:33:28', '2022-11-16 16:33:28'),
(158, 'AFRO COMB', 1, 'single', 1, NULL, NULL, 10, NULL, NULL, 'exclusive', 1, NULL, '0158', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:34:10', '2022-11-16 16:34:10'),
(159, 'COMB 2 IN 1', 1, 'single', 1, NULL, NULL, 10, NULL, NULL, 'exclusive', 1, NULL, 'Default Purchase Price 	x Margin(%) 	Default Selling Price 	Product imageExc. tax:*Inc. tax:*		Exc. Tax 	Product image:Max File size: 1MBAspect ratio should be 1:1', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:48:23', '2022-11-16 16:48:23'),
(160, 'AFRO COMB TEEPEE', 1, 'single', 1, NULL, NULL, 10, NULL, NULL, 'exclusive', 1, NULL, '0160', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:49:40', '2022-11-16 16:49:40'),
(161, 'ALEX COMB', 1, 'single', 1, NULL, NULL, 10, NULL, NULL, 'exclusive', 1, NULL, '0161', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:50:24', '2022-11-16 16:50:24'),
(162, 'TAIL COMB', 1, 'single', 1, NULL, NULL, 10, NULL, NULL, 'exclusive', 1, NULL, '0162', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:51:08', '2022-11-16 16:51:08'),
(163, 'TRINITY COMB', 1, 'single', 1, NULL, NULL, 10, NULL, NULL, 'exclusive', 1, NULL, '0163', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:51:41', '2022-11-16 16:51:41'),
(164, 'ANKLE SOCKS', 1, 'single', 1, NULL, NULL, 11, NULL, NULL, 'exclusive', 1, NULL, '0164', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:56:48', '2022-11-16 16:56:48'),
(165, 'OVAL HAIR CLIP', 1, 'single', 1, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '0165', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 16:57:46', '2022-11-16 16:57:46'),
(166, 'BODY SPRAY', 1, 'single', 1, NULL, NULL, 8, NULL, NULL, 'exclusive', 1, NULL, 'CT', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 17:01:17', '2022-11-16 17:01:17'),
(167, 'PUFF SPONGE', 1, 'single', 1, NULL, NULL, 5, NULL, NULL, 'exclusive', 1, NULL, '0167', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 17:02:27', '2022-11-16 17:02:27'),
(168, 'SPONGE SMALL', 1, 'single', 1, NULL, NULL, 5, NULL, NULL, 'exclusive', 1, NULL, '0168', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 17:03:03', '2022-11-16 17:03:03'),
(169, 'BANGLE KIDS', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, '0169', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 17:04:17', '2022-11-16 17:04:17'),
(170, 'NAILS TIPS', 1, 'single', 1, NULL, NULL, 13, NULL, NULL, 'exclusive', 1, NULL, '0170', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 17:06:29', '2022-11-16 17:06:29'),
(171, 'ART NAILS', 1, 'single', 1, NULL, NULL, 13, NULL, NULL, 'exclusive', 1, NULL, '0171', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 17:11:28', '2022-11-16 17:11:28'),
(172, 'HAIRBAND BOWTIE', 1, 'single', 1, NULL, NULL, 14, NULL, NULL, 'exclusive', 1, NULL, '0172', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 17:13:26', '2022-11-16 17:13:26'),
(173, 'HAIRBAND PUSHBACK WIRE', 1, 'single', 1, NULL, NULL, 14, NULL, NULL, 'exclusive', 1, NULL, '0173', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 17:15:21', '2022-11-16 17:15:21'),
(174, 'HAIRBAND CLIP FLOWER', 1, 'single', 1, NULL, NULL, 14, NULL, NULL, 'exclusive', 1, NULL, '0174', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 17:16:28', '2022-11-16 17:16:28'),
(175, 'HAIRBAND REGULAR', 1, 'single', 1, NULL, NULL, 14, NULL, NULL, 'exclusive', 1, NULL, '0175', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '<p><span class=\"selectable-text copyable-text\" data-lexical-text=\"true\">i</span></p>', 1, NULL, 0, 0, '2022-11-16 17:20:02', '2022-11-16 17:20:02'),
(176, 'HAIRBAND BEADED', 1, 'single', 1, NULL, NULL, 14, NULL, NULL, 'exclusive', 1, NULL, '0176', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 17:21:34', '2022-11-16 17:21:34'),
(177, 'FLOWER CLIP', 1, 'single', 1, NULL, NULL, 14, NULL, NULL, 'exclusive', 1, NULL, '0177', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 17:31:48', '2022-11-16 17:31:48'),
(178, 'RUBBER BAND', 1, 'single', 1, NULL, NULL, 15, NULL, NULL, 'exclusive', 1, NULL, '0178', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 17:33:24', '2022-11-16 17:33:24'),
(179, 'RUBBER BLADDER', 1, 'single', 1, NULL, NULL, 15, NULL, NULL, 'exclusive', 1, NULL, '0179', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 17:35:21', '2022-11-16 17:35:21'),
(180, 'KOREAN BAND', 1, 'single', 1, NULL, NULL, 15, NULL, NULL, 'exclusive', 1, NULL, '0180', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-16 17:36:00', '2022-11-16 17:36:00'),
(223, 'Darling Twinkle Braid-2/27', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0223', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:32:23', '2022-11-18 09:32:23'),
(224, 'Darling Twinkle Braid-30', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0224', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:33:14', '2022-11-18 09:33:14'),
(225, 'Darling Twinkle Braid-2/30', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0225', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:34:08', '2022-11-18 09:34:08'),
(226, 'Darling Twinkle Braid-33', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0226', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:34:52', '2022-11-18 09:34:52'),
(227, 'Darling Twinkle Braid-1/350', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0227', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:35:35', '2022-11-18 09:35:35'),
(228, 'Darling Twinkle Braid-1', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0228', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:37:44', '2022-11-18 09:41:11'),
(229, 'Darling Twinkle Braid-2', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0229', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:38:41', '2022-11-18 09:38:41'),
(230, 'Darling Twinkle Braid-133', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0230', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:39:49', '2022-11-18 09:39:49'),
(231, 'Angels Jibambe 2/30 -Short', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0231', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:46:22', '2022-11-18 09:46:22'),
(232, 'Angels Jibambe -1 (Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0232', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:47:35', '2022-11-18 09:47:35'),
(233, 'Angels Jibambe -2(Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0233', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:49:33', '2022-11-18 09:49:33'),
(234, 'Angels Jibambe -133(Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0234', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:50:19', '2022-11-18 09:50:19'),
(235, 'Angels Jibambe -127(Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0235', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:51:24', '2022-11-18 09:51:24'),
(236, 'Angels Jibambe -900(Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0236', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:52:12', '2022-11-18 09:52:12'),
(237, 'Angels Jibambe -1/350(Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0237', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:52:53', '2022-11-18 09:52:53'),
(238, 'Angels Jibambe -30(Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0238', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:53:55', '2022-11-18 09:53:55'),
(239, 'Angels Jibambe -99J(Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0239', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:54:50', '2022-11-18 09:54:50'),
(240, 'Angels Jibambe -GREY(Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0240', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:56:26', '2022-11-18 09:56:26'),
(241, 'Angels Jibambe -1 (Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0241', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:57:12', '2022-11-18 09:57:12'),
(242, 'Angels Jibambe -2 (Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0242', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:57:56', '2022-11-18 09:57:56'),
(243, 'Angels Jibambe -133(Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0243', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 09:59:39', '2022-11-18 09:59:39'),
(244, 'Angels Jibambe -127(Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0244', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:00:16', '2022-11-18 10:00:16'),
(245, 'Angels Jibambe -1/900 (Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0245', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:01:15', '2022-11-18 10:01:15'),
(246, 'Angels Jibambe -1/350 (Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0246', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:02:03', '2022-11-18 10:02:03'),
(247, 'Angels Jibambe -30 (Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0247', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:02:45', '2022-11-18 10:02:45'),
(248, 'Angels Jibambe -995 (Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0248', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:03:34', '2022-11-18 10:03:34'),
(249, 'Darling Pamoja -Pink (Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0249', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:07:33', '2022-11-18 10:07:33'),
(250, 'Darling Pamoja -Grey (Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0250', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:08:29', '2022-11-18 10:08:29'),
(251, 'Darling Pamoja -Red (Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0251', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:10:01', '2022-11-18 10:10:01'),
(252, 'Darling Pamoja -1 (Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0252', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:10:42', '2022-11-18 10:10:42'),
(253, 'Darling Pamoja -2 (Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0253', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:11:20', '2022-11-18 10:11:20'),
(254, 'Darling Pamoja -133 (Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0254', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:11:50', '2022-11-18 10:11:50'),
(255, 'Darling Pamoja -1/900 (Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0255', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:12:41', '2022-11-18 10:12:41'),
(256, 'Darling Pamoja -1/350 (Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0256', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:13:21', '2022-11-18 10:13:21'),
(257, 'Darling Pamoja -30 (Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0257', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:13:57', '2022-11-18 12:42:20'),
(258, 'Darling Pamoja -BLUE (Short)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0258', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:14:29', '2022-11-18 10:14:29'),
(259, 'Darling Pamoja -1 (Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0259', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:15:19', '2022-11-23 21:45:11');
INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(260, 'Darling Pamoja -2 (Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0260', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:15:56', '2022-11-18 10:15:56'),
(261, 'Darling Pamoja -133 (Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0261', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:16:39', '2022-11-18 10:16:39'),
(262, 'Darling Pamoja -127 (Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0262', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:17:10', '2022-11-18 10:17:10'),
(263, 'Darling Pamoja -1/900 (Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0263', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:17:56', '2022-11-18 10:17:56'),
(264, 'Darling Pamoja -1/350 (Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0264', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:18:32', '2022-11-18 10:18:32'),
(265, 'Darling Pamoja -30 (Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0265', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:19:16', '2022-11-18 10:19:16'),
(266, 'Darling Pamoja -99J (Long)', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0266', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:19:52', '2022-11-18 10:19:52'),
(267, 'Darling Afro Baby Weave  -1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0267', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:29:32', '2022-11-24 16:13:33'),
(268, 'Darling Afro Baby Weave  -2', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0268', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:30:14', '2022-11-18 10:30:14'),
(269, 'Darling Afro Baby Weave  -1/900', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0269', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:31:03', '2022-11-18 10:31:03'),
(270, 'Darling Afro Baby Weave  -1/350', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0270', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:32:05', '2022-11-24 16:14:06'),
(271, 'Darling Pixie Star Weave  -1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0271', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:33:35', '2022-11-18 10:33:35'),
(272, 'Darling Pixie Star Weave  -2/30', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0272', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:34:02', '2022-11-18 10:34:02'),
(273, 'Darling Pixie Star Weave  -2/27', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0273', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:34:34', '2022-11-18 10:34:34'),
(274, 'Darling Pixie Star Weave  -1/900', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0274', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:35:04', '2022-11-18 10:35:04'),
(275, 'Darling Pixie Star Weave  -1/350', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0275', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:35:45', '2022-11-18 10:35:45'),
(276, 'Darling Fancy Curls Weave  -1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0276', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:38:02', '2022-11-18 10:38:02'),
(277, 'Darling Fancy Curls Weave  -2/30', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0277', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:38:37', '2022-11-18 10:38:37'),
(278, 'Darling Fancy Curls Weave  -1/900', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0278', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:39:11', '2022-11-18 10:39:11'),
(279, 'Darling Fancy Curls Weave  -1/350', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0279', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:39:37', '2022-11-18 10:39:37'),
(280, 'Darling Fancy Curls Weave  -133', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0280', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:40:08', '2022-11-18 10:40:08'),
(281, 'Darling Fabiana Weave  -1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0281', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:41:47', '2022-11-18 10:41:47'),
(282, 'Darling Fifi Weave  -2', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0282', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:43:35', '2022-11-18 10:43:35'),
(283, 'Darling Fifi Weave  -1/900', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0283', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:45:37', '2022-11-18 10:47:09'),
(284, 'Darling Fiona Weave  -1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0284', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:48:39', '2022-11-18 10:48:39'),
(285, 'Darling Fiona Weave  -133', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0285', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:49:09', '2022-11-18 10:49:09'),
(286, 'Angels Rhumba Weave  -1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0286', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:50:38', '2022-11-18 10:50:38'),
(287, 'Angels Rhumba Weave  -133', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0287', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:51:07', '2022-11-18 10:51:07'),
(288, 'Angels Rhumba Weave  -2/30', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0288', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:51:44', '2022-11-18 10:51:44'),
(289, 'Angels Rhumba Weave  -1/350', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0289', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:52:28', '2022-11-18 10:52:28'),
(290, 'Angels Rhumba Weave  -1/900', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0290', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:52:58', '2022-11-18 10:52:58'),
(291, 'Darling Eve Weave  -2', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0291', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:53:56', '2022-11-18 10:53:56'),
(292, 'Darling Eve Weave  -2/30', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0292', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:54:22', '2022-11-18 10:54:22'),
(293, 'Darling Eve Weave  -1/900', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0293', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:54:48', '2022-11-18 10:54:48'),
(294, 'Darling Wrap Around Weave  -1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0294', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:56:00', '2022-11-18 10:57:07'),
(295, 'Darling Wrap Around Weave  -133', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0295', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:56:40', '2022-11-18 10:56:40'),
(296, 'Darling Adara Weave  -1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0296', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 10:59:49', '2022-11-18 10:59:49'),
(297, 'Darling Adara Weave  -1/350', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0297', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:01:10', '2022-11-18 11:01:10'),
(298, 'Darling Adara Weave  -2/30', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0298', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:01:44', '2022-11-18 11:01:44'),
(299, 'Darling Adara Weave  -1/900', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0299', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:02:16', '2022-11-18 11:02:16'),
(300, 'Darling Supa Maya Weave  -133', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0300', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:03:27', '2022-11-18 11:03:27'),
(301, 'Darling Supa Maya Weave  -1/900', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0301', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:03:54', '2022-11-18 11:03:54'),
(302, 'Darling Supa Maya Weave  -2/30', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0302', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:04:36', '2022-11-18 11:04:36'),
(303, 'Darling Supa Maya Weave  -1/350', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0303', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:06:35', '2022-11-18 11:07:06'),
(304, 'Darling Sorento Weave  -1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0304', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:08:21', '2022-11-18 11:08:21'),
(305, 'Darling Sorento Weave  -133', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0305', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:08:49', '2022-11-18 11:08:49'),
(306, 'Darling Sorento Weave  -1/350', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0306', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:09:18', '2022-11-18 11:09:18'),
(307, 'Darling Sorento Weave  -1/900', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0307', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:10:12', '2022-11-18 11:10:12'),
(308, 'Darling Sorento Weave  -2/30', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0308', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:11:06', '2022-11-18 11:11:06'),
(309, 'Angels Ballerina Pink', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0309', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:13:33', '2022-11-18 11:14:59'),
(310, 'Angels Ballerina Blue', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0310', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:14:06', '2022-11-18 11:14:06'),
(311, 'Angels Ballerina -1/900', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0311', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:14:30', '2022-11-18 11:14:30'),
(312, 'Angels Temple Curls Weave-1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0312', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:15:55', '2022-11-18 11:15:55'),
(313, 'Angels Temple Curls Weave-2/30', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0313', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:16:24', '2022-11-18 11:16:24'),
(314, 'Angels Temple Curls Weave-Pink', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0314', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:16:51', '2022-11-18 11:16:51'),
(315, 'Angels Temple Curls Weave-Purple', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0315', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:17:21', '2022-11-18 11:17:21'),
(316, 'Angels Elsa Twinkle Weave-2', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0316', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:18:38', '2022-11-18 11:18:38'),
(317, 'Angels Mambo Twist Long-1/900', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0317', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:20:10', '2022-11-18 11:20:10'),
(318, 'Angels Mambo Twist Short-1/350', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0318', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:21:00', '2022-11-18 11:21:00'),
(319, 'Angels NATURAL LOCS-1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0319', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:22:26', '2022-11-18 11:22:26'),
(320, 'Angels NATURAL LOCS-2/30', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0320', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:23:06', '2022-11-18 11:23:06'),
(321, 'Darling Fluffy Kinky Short-1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0321', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:25:12', '2022-11-24 16:14:39'),
(322, 'Darling Fluffy Kinky Short-900', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0322', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:25:59', '2022-11-18 11:25:59'),
(323, 'Darling Jambo Locks -P0', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0323', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:28:56', '2022-11-18 11:28:56'),
(324, 'Darling Jambo Locks -P2', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0324', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:29:24', '2022-11-18 11:29:24'),
(325, 'Angels BOY CUT -1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0325', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:30:55', '2022-11-18 11:30:55'),
(326, 'Angels BOY CUT -133', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0326', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:31:32', '2022-11-18 11:31:32'),
(327, 'Angels BOY CUT -2', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0327', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:31:57', '2022-11-18 11:31:57'),
(328, 'Olivia Hebesha 1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0328', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:36:15', '2022-11-18 11:36:15'),
(329, 'Olivia SABRINA -1/900', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0329', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:37:07', '2022-11-18 11:37:07'),
(330, 'Olivia SABRINA -144', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0330', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:37:41', '2022-11-18 11:37:41'),
(331, 'Olivia SABRINA -1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0331', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:38:08', '2022-11-18 11:38:08'),
(332, 'Darling Kinky Dread-1/900', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0332', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:39:13', '2022-11-18 15:07:50'),
(333, 'Darling Kinky Dread-1', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0333', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:39:44', '2022-11-18 11:39:44'),
(334, 'Darling Daniella Plus -350', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0334', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:42:10', '2022-11-18 11:42:10'),
(335, 'Angels Sunny Girl -350', 1, 'single', 1, NULL, NULL, 17, NULL, NULL, 'exclusive', 1, NULL, '0335', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 11:43:11', '2022-11-18 11:43:11'),
(336, 'testproduct', 1, 'single', 1, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, '4.0000', '0336', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-18 13:47:59', '2022-11-18 13:47:59'),
(337, 'Angels Avvis long -1/33', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0337', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 13:11:25', '2022-11-24 13:11:25'),
(338, 'Angels Avvis long -1/60', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0338', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 13:12:07', '2022-11-24 13:12:07'),
(339, 'Angels Avvis long -1/blue', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0339', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 13:12:59', '2022-11-24 13:12:59'),
(340, 'Angels Avvis long -27', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0340', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 13:13:52', '2022-11-24 13:13:52'),
(341, 'Angels Avvis long -30', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0341', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 13:16:56', '2022-11-24 13:16:56'),
(342, 'Angels Avvis long -33', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0342', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 13:17:37', '2022-11-24 13:17:37'),
(343, 'Angels Avvis long Dpurple', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0343', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 13:18:20', '2022-11-24 13:18:20'),
(344, 'Angels Avvis long Pink', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0344', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 15:57:21', '2022-11-24 15:57:21'),
(345, 'Angels Avvis Short -1/33', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0345', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 15:58:17', '2022-11-24 15:58:17'),
(346, 'Angels Avvis Short -1/60', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0346', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 15:58:56', '2022-11-24 15:58:56'),
(347, 'Angels Avvis Short 2', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0347', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 15:59:39', '2022-11-24 15:59:39'),
(348, 'Angels Avvis Short -27', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0348', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:00:21', '2022-11-24 16:00:21'),
(349, 'Angels Avvis Short -30', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0349', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:00:58', '2022-11-24 16:00:58'),
(350, 'Angels Avvis Short -33', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0350', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:01:33', '2022-11-24 16:01:33'),
(351, 'Angels Avvis Short Dpurple', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0351', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:02:08', '2022-11-24 16:02:08'),
(352, 'Angels Avvis Short Pink', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0352', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:02:49', '2022-11-24 16:02:49'),
(353, 'Angels Barbie 1', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0353', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:03:32', '2022-11-24 16:03:32'),
(354, 'Angels Barbie -1/33', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0354', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:04:19', '2022-11-24 16:04:19'),
(355, 'Angels Fluffy Extra -1', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0355', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:05:05', '2022-11-24 16:05:05'),
(356, 'Angels Fluffy Extra -1/33', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0356', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:05:45', '2022-11-24 16:05:45'),
(357, 'Angels Kali Curl -1', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0357', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:06:41', '2022-11-24 16:06:41'),
(358, 'Angels Natural Locs -1', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0358', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:07:33', '2022-11-24 16:07:33'),
(359, 'Angels Natural Locs -1/33', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0359', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:08:17', '2022-11-24 16:08:17'),
(360, 'Angels Regge -1', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0360', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:08:55', '2022-11-24 16:08:55'),
(361, 'Angels Sasha -1/350', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0361', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:09:40', '2022-11-24 16:09:40'),
(362, 'Angels Sasha -1/900', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0362', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:10:20', '2022-11-24 16:10:20'),
(363, 'Angels Spanish Bulk -1', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0363', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:10:57', '2022-11-24 16:10:57'),
(364, 'Angels Spanish Bulk -1/33', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0364', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:11:35', '2022-11-24 16:11:35'),
(365, 'Angels Spanish Bulk -30', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0365', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:12:12', '2022-11-24 16:12:12'),
(366, 'Darling Fluffy Kinky -30', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0366', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:15:19', '2022-11-24 16:15:19'),
(367, 'Darling Fluffy Kinky -33', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0367', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:15:54', '2022-11-24 16:15:54'),
(368, 'Darling New Viva -1', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0368', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:16:27', '2022-11-24 16:16:27'),
(369, 'Darling New Viva -1/900', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0369', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:17:05', '2022-11-24 16:17:05'),
(370, 'Darling New Viva -2/30', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0370', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:17:40', '2022-11-24 16:17:40'),
(371, 'Darling Nikita -1', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0371', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:18:13', '2022-11-24 16:18:13'),
(372, 'Darling Nikita -1/900', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0372', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:19:02', '2022-11-24 16:19:02'),
(373, 'Hair Extension', 1, 'single', 1, NULL, NULL, 16, NULL, NULL, 'exclusive', 1, NULL, '0373', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-24 16:19:53', '2022-11-24 16:19:53'),
(375, '4895180756535', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, NULL, '0375', 'C128', NULL, NULL, 0, NULL, 'oraimo23', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-11-26 10:35:26', '2022-11-26 11:24:09');

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int NOT NULL,
  `location_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 1),
(209, 1),
(210, 1),
(211, 1),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(238, 1),
(239, 1),
(240, 1),
(241, 1),
(242, 1),
(243, 1),
(244, 1),
(245, 1),
(246, 1),
(247, 1),
(248, 1),
(249, 1),
(250, 1),
(251, 1),
(252, 1),
(253, 1),
(254, 1),
(255, 1),
(256, 1),
(257, 1),
(258, 1),
(259, 1),
(260, 1),
(261, 1),
(262, 1),
(263, 1),
(264, 1),
(265, 1),
(266, 1),
(267, 1),
(268, 1),
(269, 1),
(270, 1),
(271, 1),
(272, 1),
(273, 1),
(274, 1),
(275, 1),
(276, 1),
(277, 1),
(278, 1),
(279, 1),
(280, 1),
(281, 1),
(282, 1),
(283, 1),
(284, 1),
(285, 1),
(286, 1),
(287, 1),
(288, 1),
(289, 1),
(290, 1),
(291, 1),
(292, 1),
(293, 1),
(294, 1),
(295, 1),
(296, 1),
(297, 1),
(298, 1),
(299, 1),
(300, 1),
(301, 1),
(302, 1),
(303, 1),
(304, 1),
(305, 1),
(306, 1),
(307, 1),
(308, 1),
(309, 1),
(310, 1),
(311, 1),
(312, 1),
(313, 1),
(314, 1),
(315, 1),
(316, 1),
(317, 1),
(318, 1),
(319, 1),
(320, 1),
(321, 1),
(322, 1),
(323, 1),
(324, 1),
(325, 1),
(326, 1),
(327, 1),
(328, 1),
(329, 1),
(330, 1),
(331, 1),
(332, 1),
(333, 1),
(334, 1),
(335, 1),
(336, 1),
(337, 1),
(338, 1),
(339, 1),
(340, 1),
(341, 1),
(342, 1),
(343, 1),
(344, 1),
(345, 1),
(346, 1),
(347, 1),
(348, 1),
(349, 1),
(350, 1),
(351, 1),
(352, 1),
(353, 1),
(354, 1),
(355, 1),
(356, 1),
(357, 1),
(358, 1),
(359, 1),
(360, 1),
(361, 1),
(362, 1),
(363, 1),
(364, 1),
(365, 1),
(366, 1),
(367, 1),
(368, 1),
(369, 1),
(370, 1),
(371, 1),
(372, 1),
(373, 1),
(374, 1),
(375, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int UNSIGNED NOT NULL,
  `variation_template_id` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DUMMY', 1, 1, '2022-11-13 20:47:03', '2022-11-13 20:47:03'),
(2, NULL, 'DUMMY', 2, 1, '2022-11-13 21:49:50', '2022-11-13 21:49:50'),
(4, NULL, 'DUMMY', 4, 1, '2022-11-13 21:56:14', '2022-11-13 21:56:14'),
(5, NULL, 'DUMMY', 5, 1, '2022-11-13 22:02:08', '2022-11-13 22:02:08'),
(6, NULL, 'DUMMY', 6, 1, '2022-11-13 22:16:59', '2022-11-13 22:16:59'),
(7, NULL, 'DUMMY', 7, 1, '2022-11-13 22:18:45', '2022-11-13 22:18:45'),
(8, NULL, 'DUMMY', 8, 1, '2022-11-13 22:20:17', '2022-11-13 22:20:17'),
(9, NULL, 'DUMMY', 9, 1, '2022-11-13 22:25:45', '2022-11-13 22:25:45'),
(10, NULL, 'DUMMY', 10, 1, '2022-11-13 22:27:57', '2022-11-13 22:27:57'),
(11, NULL, 'DUMMY', 11, 1, '2022-11-13 22:29:44', '2022-11-13 22:29:44'),
(12, NULL, 'DUMMY', 12, 1, '2022-11-13 22:30:43', '2022-11-13 22:30:43'),
(13, NULL, 'DUMMY', 13, 1, '2022-11-13 22:34:35', '2022-11-13 22:34:35'),
(14, NULL, 'DUMMY', 14, 1, '2022-11-13 22:35:54', '2022-11-13 22:35:54'),
(15, NULL, 'DUMMY', 15, 1, '2022-11-13 22:37:28', '2022-11-13 22:37:28'),
(16, NULL, 'DUMMY', 16, 1, '2022-11-13 22:38:39', '2022-11-13 22:38:39'),
(17, NULL, 'DUMMY', 17, 1, '2022-11-13 22:40:53', '2022-11-13 22:40:53'),
(18, NULL, 'DUMMY', 18, 1, '2022-11-13 22:43:01', '2022-11-13 22:43:01'),
(19, NULL, 'DUMMY', 19, 1, '2022-11-13 22:44:45', '2022-11-13 22:44:45'),
(20, NULL, 'DUMMY', 20, 1, '2022-11-13 22:45:42', '2022-11-13 22:45:42'),
(21, NULL, 'DUMMY', 21, 1, '2022-11-13 22:46:42', '2022-11-13 22:46:42'),
(22, NULL, 'DUMMY', 22, 1, '2022-11-13 22:49:53', '2022-11-13 22:49:53'),
(23, NULL, 'DUMMY', 23, 1, '2022-11-13 22:56:17', '2022-11-13 22:56:17'),
(24, NULL, 'DUMMY', 24, 1, '2022-11-13 22:57:24', '2022-11-13 22:57:24'),
(25, NULL, 'DUMMY', 25, 1, '2022-11-13 22:58:12', '2022-11-13 22:58:12'),
(26, NULL, 'DUMMY', 26, 1, '2022-11-13 22:59:26', '2022-11-13 22:59:26'),
(27, NULL, 'DUMMY', 27, 1, '2022-11-13 23:00:35', '2022-11-13 23:00:35'),
(28, NULL, 'DUMMY', 28, 1, '2022-11-13 23:01:47', '2022-11-13 23:01:47'),
(29, NULL, 'DUMMY', 29, 1, '2022-11-13 23:03:10', '2022-11-13 23:03:10'),
(30, NULL, 'DUMMY', 30, 1, '2022-11-13 23:09:10', '2022-11-13 23:09:10'),
(31, NULL, 'DUMMY', 31, 1, '2022-11-13 23:09:12', '2022-11-13 23:09:12'),
(32, NULL, 'DUMMY', 32, 1, '2022-11-13 23:11:03', '2022-11-13 23:11:03'),
(33, NULL, 'DUMMY', 33, 1, '2022-11-13 23:13:09', '2022-11-13 23:13:09'),
(34, NULL, 'DUMMY', 34, 1, '2022-11-13 23:14:02', '2022-11-13 23:14:02'),
(35, NULL, 'DUMMY', 35, 1, '2022-11-13 23:15:12', '2022-11-13 23:15:12'),
(36, NULL, 'DUMMY', 36, 1, '2022-11-13 23:16:10', '2022-11-13 23:16:10'),
(37, NULL, 'DUMMY', 37, 1, '2022-11-13 23:17:05', '2022-11-13 23:17:05'),
(38, NULL, 'DUMMY', 38, 1, '2022-11-13 23:17:54', '2022-11-13 23:17:54'),
(39, NULL, 'DUMMY', 39, 1, '2022-11-13 23:18:41', '2022-11-13 23:18:41'),
(40, NULL, 'DUMMY', 40, 1, '2022-11-13 23:23:27', '2022-11-13 23:23:27'),
(41, NULL, 'DUMMY', 41, 1, '2022-11-13 23:25:01', '2022-11-13 23:25:01'),
(42, NULL, 'DUMMY', 42, 1, '2022-11-13 23:26:02', '2022-11-13 23:26:02'),
(43, NULL, 'DUMMY', 43, 1, '2022-11-13 23:26:56', '2022-11-13 23:26:56'),
(44, NULL, 'DUMMY', 44, 1, '2022-11-13 23:27:54', '2022-11-13 23:27:54'),
(45, NULL, 'DUMMY', 45, 1, '2022-11-13 23:28:56', '2022-11-13 23:28:56'),
(46, NULL, 'DUMMY', 46, 1, '2022-11-13 23:29:47', '2022-11-13 23:29:47'),
(47, NULL, 'DUMMY', 47, 1, '2022-11-13 23:30:42', '2022-11-13 23:30:42'),
(48, NULL, 'DUMMY', 48, 1, '2022-11-13 23:31:55', '2022-11-13 23:31:55'),
(49, NULL, 'DUMMY', 49, 1, '2022-11-13 23:32:49', '2022-11-13 23:32:49'),
(50, NULL, 'DUMMY', 50, 1, '2022-11-13 23:35:47', '2022-11-13 23:35:47'),
(51, NULL, 'DUMMY', 51, 1, '2022-11-13 23:36:57', '2022-11-13 23:36:57'),
(52, NULL, 'DUMMY', 52, 1, '2022-11-13 23:38:01', '2022-11-13 23:38:01'),
(53, NULL, 'DUMMY', 53, 1, '2022-11-13 23:38:56', '2022-11-13 23:38:56'),
(54, NULL, 'DUMMY', 54, 1, '2022-11-13 23:39:40', '2022-11-13 23:39:40'),
(55, NULL, 'DUMMY', 55, 1, '2022-11-13 23:40:38', '2022-11-13 23:40:38'),
(56, NULL, 'DUMMY', 56, 1, '2022-11-13 23:41:43', '2022-11-13 23:41:43'),
(57, NULL, 'DUMMY', 57, 1, '2022-11-13 23:44:17', '2022-11-13 23:44:17'),
(58, NULL, 'DUMMY', 58, 1, '2022-11-13 23:46:34', '2022-11-13 23:46:34'),
(59, NULL, 'DUMMY', 59, 1, '2022-11-13 23:47:46', '2022-11-13 23:47:46'),
(60, NULL, 'DUMMY', 60, 1, '2022-11-13 23:48:33', '2022-11-13 23:48:33'),
(61, NULL, 'DUMMY', 61, 1, '2022-11-13 23:49:30', '2022-11-13 23:49:30'),
(62, NULL, 'DUMMY', 62, 1, '2022-11-13 23:50:55', '2022-11-13 23:50:55'),
(63, NULL, 'DUMMY', 63, 1, '2022-11-13 23:52:05', '2022-11-13 23:52:05'),
(64, NULL, 'DUMMY', 64, 1, '2022-11-13 23:52:57', '2022-11-13 23:52:57'),
(65, NULL, 'DUMMY', 65, 1, '2022-11-13 23:54:10', '2022-11-13 23:54:10'),
(66, NULL, 'DUMMY', 66, 1, '2022-11-13 23:55:17', '2022-11-13 23:55:17'),
(67, NULL, 'DUMMY', 67, 1, '2022-11-13 23:57:16', '2022-11-13 23:57:16'),
(68, NULL, 'DUMMY', 68, 1, '2022-11-14 00:05:19', '2022-11-14 00:05:19'),
(69, NULL, 'DUMMY', 69, 1, '2022-11-14 00:06:49', '2022-11-14 00:06:49'),
(70, NULL, 'DUMMY', 70, 1, '2022-11-14 00:08:31', '2022-11-14 00:08:31'),
(71, NULL, 'DUMMY', 71, 1, '2022-11-14 00:09:28', '2022-11-14 00:09:28'),
(72, NULL, 'DUMMY', 72, 1, '2022-11-14 00:10:24', '2022-11-14 00:10:24'),
(73, NULL, 'DUMMY', 73, 1, '2022-11-14 00:11:15', '2022-11-14 00:11:15'),
(74, NULL, 'DUMMY', 74, 1, '2022-11-14 00:14:49', '2022-11-14 00:14:49'),
(75, NULL, 'DUMMY', 75, 1, '2022-11-14 00:15:37', '2022-11-14 00:15:37'),
(76, NULL, 'DUMMY', 76, 1, '2022-11-14 00:17:05', '2022-11-14 00:17:05'),
(77, NULL, 'DUMMY', 77, 1, '2022-11-14 00:18:12', '2022-11-14 00:18:12'),
(78, NULL, 'DUMMY', 78, 1, '2022-11-14 00:19:11', '2022-11-14 00:19:11'),
(79, NULL, 'DUMMY', 79, 1, '2022-11-14 00:20:14', '2022-11-14 00:20:14'),
(80, NULL, 'DUMMY', 80, 1, '2022-11-14 00:22:43', '2022-11-14 00:22:43'),
(81, NULL, 'DUMMY', 81, 1, '2022-11-14 00:23:38', '2022-11-14 00:23:38'),
(82, NULL, 'DUMMY', 82, 1, '2022-11-14 00:24:33', '2022-11-14 00:24:33'),
(83, NULL, 'DUMMY', 83, 1, '2022-11-14 00:25:25', '2022-11-14 00:25:25'),
(84, NULL, 'DUMMY', 84, 1, '2022-11-14 00:26:08', '2022-11-14 00:26:08'),
(85, NULL, 'DUMMY', 85, 1, '2022-11-14 00:26:46', '2022-11-14 00:26:46'),
(86, NULL, 'DUMMY', 86, 1, '2022-11-14 00:27:36', '2022-11-14 00:27:36'),
(87, NULL, 'DUMMY', 87, 1, '2022-11-14 00:28:40', '2022-11-14 00:28:40'),
(88, NULL, 'DUMMY', 88, 1, '2022-11-14 00:30:10', '2022-11-14 00:30:10'),
(89, NULL, 'DUMMY', 89, 1, '2022-11-14 00:30:47', '2022-11-14 00:30:47'),
(90, NULL, 'DUMMY', 90, 1, '2022-11-14 00:32:21', '2022-11-14 00:32:21'),
(91, NULL, 'DUMMY', 91, 1, '2022-11-14 00:33:23', '2022-11-14 00:33:23'),
(92, NULL, 'DUMMY', 92, 1, '2022-11-14 00:34:15', '2022-11-14 00:34:15'),
(93, NULL, 'DUMMY', 93, 1, '2022-11-14 00:35:14', '2022-11-14 00:35:14'),
(94, NULL, 'DUMMY', 94, 1, '2022-11-14 00:36:06', '2022-11-14 00:36:06'),
(95, NULL, 'DUMMY', 95, 1, '2022-11-14 00:36:51', '2022-11-14 00:36:51'),
(96, NULL, 'DUMMY', 96, 1, '2022-11-14 00:37:35', '2022-11-14 00:37:35'),
(97, NULL, 'DUMMY', 97, 1, '2022-11-14 00:38:34', '2022-11-14 00:38:34'),
(98, NULL, 'DUMMY', 98, 1, '2022-11-14 00:39:22', '2022-11-14 00:39:22'),
(99, NULL, 'DUMMY', 99, 1, '2022-11-14 00:40:16', '2022-11-14 00:40:16'),
(100, NULL, 'DUMMY', 100, 1, '2022-11-14 00:41:04', '2022-11-14 00:41:04'),
(101, NULL, 'DUMMY', 101, 1, '2022-11-14 00:41:53', '2022-11-14 00:41:53'),
(102, NULL, 'DUMMY', 102, 1, '2022-11-14 00:42:41', '2022-11-14 00:42:41'),
(103, NULL, 'DUMMY', 103, 1, '2022-11-14 00:43:30', '2022-11-14 00:43:30'),
(104, NULL, 'DUMMY', 104, 1, '2022-11-14 00:44:44', '2022-11-14 00:44:44'),
(105, NULL, 'DUMMY', 105, 1, '2022-11-14 00:45:47', '2022-11-14 00:45:47'),
(106, NULL, 'DUMMY', 106, 1, '2022-11-14 00:46:42', '2022-11-14 00:46:42'),
(107, NULL, 'DUMMY', 107, 1, '2022-11-14 00:47:28', '2022-11-14 00:47:28'),
(108, NULL, 'DUMMY', 108, 1, '2022-11-16 14:27:27', '2022-11-16 14:27:27'),
(109, NULL, 'DUMMY', 109, 1, '2022-11-16 14:28:42', '2022-11-16 14:28:42'),
(110, NULL, 'DUMMY', 110, 1, '2022-11-16 14:33:27', '2022-11-16 14:33:27'),
(111, NULL, 'DUMMY', 111, 1, '2022-11-16 14:35:10', '2022-11-16 14:35:10'),
(112, NULL, 'DUMMY', 112, 1, '2022-11-16 14:36:21', '2022-11-16 14:36:21'),
(113, NULL, 'DUMMY', 113, 1, '2022-11-16 14:37:53', '2022-11-16 14:37:53'),
(114, NULL, 'DUMMY', 114, 1, '2022-11-16 14:39:00', '2022-11-16 14:39:00'),
(115, NULL, 'DUMMY', 115, 1, '2022-11-16 14:46:22', '2022-11-16 14:46:22'),
(116, NULL, 'DUMMY', 116, 1, '2022-11-16 14:48:24', '2022-11-16 14:48:24'),
(117, NULL, 'DUMMY', 117, 1, '2022-11-16 15:00:16', '2022-11-16 15:00:16'),
(118, NULL, 'DUMMY', 118, 1, '2022-11-16 15:07:37', '2022-11-16 15:07:37'),
(119, NULL, 'DUMMY', 119, 1, '2022-11-16 15:10:11', '2022-11-16 15:10:11'),
(120, NULL, 'DUMMY', 120, 1, '2022-11-16 15:13:41', '2022-11-16 15:13:41'),
(121, NULL, 'DUMMY', 121, 1, '2022-11-16 15:14:37', '2022-11-16 15:14:37'),
(122, NULL, 'DUMMY', 122, 1, '2022-11-16 15:15:33', '2022-11-16 15:15:33'),
(123, NULL, 'DUMMY', 123, 1, '2022-11-16 15:19:06', '2022-11-16 15:19:06'),
(124, NULL, 'DUMMY', 124, 1, '2022-11-16 15:19:53', '2022-11-16 15:19:53'),
(125, NULL, 'DUMMY', 125, 1, '2022-11-16 15:21:03', '2022-11-16 15:21:03'),
(126, NULL, 'DUMMY', 126, 1, '2022-11-16 15:22:05', '2022-11-16 15:22:05'),
(127, NULL, 'DUMMY', 127, 1, '2022-11-16 15:23:51', '2022-11-16 15:23:51'),
(128, NULL, 'DUMMY', 128, 1, '2022-11-16 15:30:43', '2022-11-16 15:30:43'),
(129, NULL, 'DUMMY', 129, 1, '2022-11-16 15:31:39', '2022-11-16 15:31:39'),
(130, NULL, 'DUMMY', 130, 1, '2022-11-16 15:35:33', '2022-11-16 15:35:33'),
(131, NULL, 'DUMMY', 131, 1, '2022-11-16 15:36:25', '2022-11-16 15:36:25'),
(132, NULL, 'DUMMY', 132, 1, '2022-11-16 15:39:59', '2022-11-16 15:39:59'),
(133, NULL, 'DUMMY', 133, 1, '2022-11-16 15:43:52', '2022-11-16 15:43:52'),
(134, NULL, 'DUMMY', 134, 1, '2022-11-16 15:45:45', '2022-11-16 15:45:45'),
(135, NULL, 'DUMMY', 135, 1, '2022-11-16 15:49:13', '2022-11-16 15:49:13'),
(136, NULL, 'DUMMY', 136, 1, '2022-11-16 15:51:19', '2022-11-16 15:51:19'),
(137, NULL, 'DUMMY', 137, 1, '2022-11-16 15:53:19', '2022-11-16 15:53:19'),
(138, NULL, 'DUMMY', 138, 1, '2022-11-16 15:55:06', '2022-11-16 15:55:06'),
(139, NULL, 'DUMMY', 139, 1, '2022-11-16 15:59:54', '2022-11-16 15:59:54'),
(140, NULL, 'DUMMY', 140, 1, '2022-11-16 16:00:27', '2022-11-16 16:00:27'),
(141, NULL, 'DUMMY', 141, 1, '2022-11-16 16:02:58', '2022-11-16 16:02:58'),
(142, NULL, 'DUMMY', 142, 1, '2022-11-16 16:04:05', '2022-11-16 16:04:05'),
(143, NULL, 'DUMMY', 143, 1, '2022-11-16 16:07:02', '2022-11-16 16:07:02'),
(144, NULL, 'DUMMY', 144, 1, '2022-11-16 16:08:52', '2022-11-16 16:08:52'),
(145, NULL, 'DUMMY', 145, 1, '2022-11-16 16:13:11', '2022-11-16 16:13:11'),
(146, NULL, 'DUMMY', 146, 1, '2022-11-16 16:14:26', '2022-11-16 16:14:26'),
(147, NULL, 'DUMMY', 147, 1, '2022-11-16 16:16:16', '2022-11-16 16:16:16'),
(148, NULL, 'DUMMY', 148, 1, '2022-11-16 16:17:09', '2022-11-16 16:17:09'),
(149, NULL, 'DUMMY', 149, 1, '2022-11-16 16:19:32', '2022-11-16 16:19:32'),
(150, NULL, 'DUMMY', 150, 1, '2022-11-16 16:20:35', '2022-11-16 16:20:35'),
(151, NULL, 'DUMMY', 151, 1, '2022-11-16 16:24:16', '2022-11-16 16:24:16'),
(152, NULL, 'DUMMY', 152, 1, '2022-11-16 16:25:21', '2022-11-16 16:25:21'),
(153, NULL, 'DUMMY', 153, 1, '2022-11-16 16:26:32', '2022-11-16 16:26:32'),
(154, NULL, 'DUMMY', 154, 1, '2022-11-16 16:28:12', '2022-11-16 16:28:12'),
(155, NULL, 'DUMMY', 155, 1, '2022-11-16 16:29:36', '2022-11-16 16:29:36'),
(156, NULL, 'DUMMY', 156, 1, '2022-11-16 16:31:25', '2022-11-16 16:31:25'),
(157, NULL, 'DUMMY', 157, 1, '2022-11-16 16:33:28', '2022-11-16 16:33:28'),
(158, NULL, 'DUMMY', 158, 1, '2022-11-16 16:34:10', '2022-11-16 16:34:10'),
(159, NULL, 'DUMMY', 159, 1, '2022-11-16 16:48:23', '2022-11-16 16:48:23'),
(160, NULL, 'DUMMY', 160, 1, '2022-11-16 16:49:40', '2022-11-16 16:49:40'),
(161, NULL, 'DUMMY', 161, 1, '2022-11-16 16:50:24', '2022-11-16 16:50:24'),
(162, NULL, 'DUMMY', 162, 1, '2022-11-16 16:51:08', '2022-11-16 16:51:08'),
(163, NULL, 'DUMMY', 163, 1, '2022-11-16 16:51:41', '2022-11-16 16:51:41'),
(164, NULL, 'DUMMY', 164, 1, '2022-11-16 16:56:48', '2022-11-16 16:56:48'),
(165, NULL, 'DUMMY', 165, 1, '2022-11-16 16:57:46', '2022-11-16 16:57:46'),
(166, NULL, 'DUMMY', 166, 1, '2022-11-16 17:01:17', '2022-11-16 17:01:17'),
(167, NULL, 'DUMMY', 167, 1, '2022-11-16 17:02:27', '2022-11-16 17:02:27'),
(168, NULL, 'DUMMY', 168, 1, '2022-11-16 17:03:03', '2022-11-16 17:03:03'),
(169, NULL, 'DUMMY', 169, 1, '2022-11-16 17:04:17', '2022-11-16 17:04:17'),
(170, NULL, 'DUMMY', 170, 1, '2022-11-16 17:06:29', '2022-11-16 17:06:29'),
(171, NULL, 'DUMMY', 171, 1, '2022-11-16 17:11:28', '2022-11-16 17:11:28'),
(172, NULL, 'DUMMY', 172, 1, '2022-11-16 17:13:26', '2022-11-16 17:13:26'),
(173, NULL, 'DUMMY', 173, 1, '2022-11-16 17:15:21', '2022-11-16 17:15:21'),
(174, NULL, 'DUMMY', 174, 1, '2022-11-16 17:16:28', '2022-11-16 17:16:28'),
(175, NULL, 'DUMMY', 175, 1, '2022-11-16 17:20:02', '2022-11-16 17:20:02'),
(176, NULL, 'DUMMY', 176, 1, '2022-11-16 17:21:34', '2022-11-16 17:21:34'),
(177, NULL, 'DUMMY', 177, 1, '2022-11-16 17:31:48', '2022-11-16 17:31:48'),
(178, NULL, 'DUMMY', 178, 1, '2022-11-16 17:33:24', '2022-11-16 17:33:24'),
(179, NULL, 'DUMMY', 179, 1, '2022-11-16 17:35:21', '2022-11-16 17:35:21'),
(180, NULL, 'DUMMY', 180, 1, '2022-11-16 17:36:00', '2022-11-16 17:36:00'),
(223, NULL, 'DUMMY', 223, 1, '2022-11-18 09:32:23', '2022-11-18 09:32:23'),
(224, NULL, 'DUMMY', 224, 1, '2022-11-18 09:33:14', '2022-11-18 09:33:14'),
(225, NULL, 'DUMMY', 225, 1, '2022-11-18 09:34:08', '2022-11-18 09:34:08'),
(226, NULL, 'DUMMY', 226, 1, '2022-11-18 09:34:52', '2022-11-18 09:34:52'),
(227, NULL, 'DUMMY', 227, 1, '2022-11-18 09:35:35', '2022-11-18 09:35:35'),
(228, NULL, 'DUMMY', 228, 1, '2022-11-18 09:37:44', '2022-11-18 09:37:44'),
(229, NULL, 'DUMMY', 229, 1, '2022-11-18 09:38:41', '2022-11-18 09:38:41'),
(230, NULL, 'DUMMY', 230, 1, '2022-11-18 09:39:49', '2022-11-18 09:39:49'),
(231, NULL, 'DUMMY', 231, 1, '2022-11-18 09:46:22', '2022-11-18 09:46:22'),
(232, NULL, 'DUMMY', 232, 1, '2022-11-18 09:47:35', '2022-11-18 09:47:35'),
(233, NULL, 'DUMMY', 233, 1, '2022-11-18 09:49:33', '2022-11-18 09:49:33'),
(234, NULL, 'DUMMY', 234, 1, '2022-11-18 09:50:19', '2022-11-18 09:50:19'),
(235, NULL, 'DUMMY', 235, 1, '2022-11-18 09:51:24', '2022-11-18 09:51:24'),
(236, NULL, 'DUMMY', 236, 1, '2022-11-18 09:52:12', '2022-11-18 09:52:12'),
(237, NULL, 'DUMMY', 237, 1, '2022-11-18 09:52:53', '2022-11-18 09:52:53'),
(238, NULL, 'DUMMY', 238, 1, '2022-11-18 09:53:55', '2022-11-18 09:53:55'),
(239, NULL, 'DUMMY', 239, 1, '2022-11-18 09:54:50', '2022-11-18 09:54:50'),
(240, NULL, 'DUMMY', 240, 1, '2022-11-18 09:56:26', '2022-11-18 09:56:26'),
(241, NULL, 'DUMMY', 241, 1, '2022-11-18 09:57:12', '2022-11-18 09:57:12'),
(242, NULL, 'DUMMY', 242, 1, '2022-11-18 09:57:56', '2022-11-18 09:57:56'),
(243, NULL, 'DUMMY', 243, 1, '2022-11-18 09:59:39', '2022-11-18 09:59:39'),
(244, NULL, 'DUMMY', 244, 1, '2022-11-18 10:00:16', '2022-11-18 10:00:16'),
(245, NULL, 'DUMMY', 245, 1, '2022-11-18 10:01:15', '2022-11-18 10:01:15'),
(246, NULL, 'DUMMY', 246, 1, '2022-11-18 10:02:03', '2022-11-18 10:02:03'),
(247, NULL, 'DUMMY', 247, 1, '2022-11-18 10:02:45', '2022-11-18 10:02:45'),
(248, NULL, 'DUMMY', 248, 1, '2022-11-18 10:03:34', '2022-11-18 10:03:34'),
(249, NULL, 'DUMMY', 249, 1, '2022-11-18 10:07:33', '2022-11-18 10:07:33'),
(250, NULL, 'DUMMY', 250, 1, '2022-11-18 10:08:29', '2022-11-18 10:08:29'),
(251, NULL, 'DUMMY', 251, 1, '2022-11-18 10:10:01', '2022-11-18 10:10:01'),
(252, NULL, 'DUMMY', 252, 1, '2022-11-18 10:10:42', '2022-11-18 10:10:42'),
(253, NULL, 'DUMMY', 253, 1, '2022-11-18 10:11:20', '2022-11-18 10:11:20'),
(254, NULL, 'DUMMY', 254, 1, '2022-11-18 10:11:50', '2022-11-18 10:11:50'),
(255, NULL, 'DUMMY', 255, 1, '2022-11-18 10:12:41', '2022-11-18 10:12:41'),
(256, NULL, 'DUMMY', 256, 1, '2022-11-18 10:13:21', '2022-11-18 10:13:21'),
(257, NULL, 'DUMMY', 257, 1, '2022-11-18 10:13:57', '2022-11-18 10:13:57'),
(258, NULL, 'DUMMY', 258, 1, '2022-11-18 10:14:29', '2022-11-18 10:14:29'),
(259, NULL, 'DUMMY', 259, 1, '2022-11-18 10:15:19', '2022-11-18 10:15:19'),
(260, NULL, 'DUMMY', 260, 1, '2022-11-18 10:15:56', '2022-11-18 10:15:56'),
(261, NULL, 'DUMMY', 261, 1, '2022-11-18 10:16:39', '2022-11-18 10:16:39'),
(262, NULL, 'DUMMY', 262, 1, '2022-11-18 10:17:10', '2022-11-18 10:17:10'),
(263, NULL, 'DUMMY', 263, 1, '2022-11-18 10:17:56', '2022-11-18 10:17:56'),
(264, NULL, 'DUMMY', 264, 1, '2022-11-18 10:18:32', '2022-11-18 10:18:32'),
(265, NULL, 'DUMMY', 265, 1, '2022-11-18 10:19:16', '2022-11-18 10:19:16'),
(266, NULL, 'DUMMY', 266, 1, '2022-11-18 10:19:52', '2022-11-18 10:19:52'),
(267, NULL, 'DUMMY', 267, 1, '2022-11-18 10:29:32', '2022-11-18 10:29:32'),
(268, NULL, 'DUMMY', 268, 1, '2022-11-18 10:30:14', '2022-11-18 10:30:14'),
(269, NULL, 'DUMMY', 269, 1, '2022-11-18 10:31:03', '2022-11-18 10:31:03'),
(270, NULL, 'DUMMY', 270, 1, '2022-11-18 10:32:05', '2022-11-18 10:32:05'),
(271, NULL, 'DUMMY', 271, 1, '2022-11-18 10:33:35', '2022-11-18 10:33:35'),
(272, NULL, 'DUMMY', 272, 1, '2022-11-18 10:34:02', '2022-11-18 10:34:02'),
(273, NULL, 'DUMMY', 273, 1, '2022-11-18 10:34:34', '2022-11-18 10:34:34'),
(274, NULL, 'DUMMY', 274, 1, '2022-11-18 10:35:04', '2022-11-18 10:35:04'),
(275, NULL, 'DUMMY', 275, 1, '2022-11-18 10:35:45', '2022-11-18 10:35:45'),
(276, NULL, 'DUMMY', 276, 1, '2022-11-18 10:38:02', '2022-11-18 10:38:02'),
(277, NULL, 'DUMMY', 277, 1, '2022-11-18 10:38:37', '2022-11-18 10:38:37'),
(278, NULL, 'DUMMY', 278, 1, '2022-11-18 10:39:11', '2022-11-18 10:39:11'),
(279, NULL, 'DUMMY', 279, 1, '2022-11-18 10:39:37', '2022-11-18 10:39:37'),
(280, NULL, 'DUMMY', 280, 1, '2022-11-18 10:40:08', '2022-11-18 10:40:08'),
(281, NULL, 'DUMMY', 281, 1, '2022-11-18 10:41:47', '2022-11-18 10:41:47'),
(282, NULL, 'DUMMY', 282, 1, '2022-11-18 10:43:35', '2022-11-18 10:43:35'),
(283, NULL, 'DUMMY', 283, 1, '2022-11-18 10:45:37', '2022-11-18 10:45:37'),
(284, NULL, 'DUMMY', 284, 1, '2022-11-18 10:48:39', '2022-11-18 10:48:39'),
(285, NULL, 'DUMMY', 285, 1, '2022-11-18 10:49:09', '2022-11-18 10:49:09'),
(286, NULL, 'DUMMY', 286, 1, '2022-11-18 10:50:38', '2022-11-18 10:50:38'),
(287, NULL, 'DUMMY', 287, 1, '2022-11-18 10:51:07', '2022-11-18 10:51:07'),
(288, NULL, 'DUMMY', 288, 1, '2022-11-18 10:51:44', '2022-11-18 10:51:44'),
(289, NULL, 'DUMMY', 289, 1, '2022-11-18 10:52:28', '2022-11-18 10:52:28'),
(290, NULL, 'DUMMY', 290, 1, '2022-11-18 10:52:58', '2022-11-18 10:52:58'),
(291, NULL, 'DUMMY', 291, 1, '2022-11-18 10:53:56', '2022-11-18 10:53:56'),
(292, NULL, 'DUMMY', 292, 1, '2022-11-18 10:54:22', '2022-11-18 10:54:22'),
(293, NULL, 'DUMMY', 293, 1, '2022-11-18 10:54:48', '2022-11-18 10:54:48'),
(294, NULL, 'DUMMY', 294, 1, '2022-11-18 10:56:00', '2022-11-18 10:56:00'),
(295, NULL, 'DUMMY', 295, 1, '2022-11-18 10:56:40', '2022-11-18 10:56:40'),
(296, NULL, 'DUMMY', 296, 1, '2022-11-18 10:59:49', '2022-11-18 10:59:49'),
(297, NULL, 'DUMMY', 297, 1, '2022-11-18 11:01:10', '2022-11-18 11:01:10'),
(298, NULL, 'DUMMY', 298, 1, '2022-11-18 11:01:44', '2022-11-18 11:01:44'),
(299, NULL, 'DUMMY', 299, 1, '2022-11-18 11:02:16', '2022-11-18 11:02:16'),
(300, NULL, 'DUMMY', 300, 1, '2022-11-18 11:03:27', '2022-11-18 11:03:27'),
(301, NULL, 'DUMMY', 301, 1, '2022-11-18 11:03:54', '2022-11-18 11:03:54'),
(302, NULL, 'DUMMY', 302, 1, '2022-11-18 11:04:36', '2022-11-18 11:04:36'),
(303, NULL, 'DUMMY', 303, 1, '2022-11-18 11:06:35', '2022-11-18 11:06:35'),
(304, NULL, 'DUMMY', 304, 1, '2022-11-18 11:08:21', '2022-11-18 11:08:21'),
(305, NULL, 'DUMMY', 305, 1, '2022-11-18 11:08:49', '2022-11-18 11:08:49'),
(306, NULL, 'DUMMY', 306, 1, '2022-11-18 11:09:18', '2022-11-18 11:09:18'),
(307, NULL, 'DUMMY', 307, 1, '2022-11-18 11:10:12', '2022-11-18 11:10:12'),
(308, NULL, 'DUMMY', 308, 1, '2022-11-18 11:11:06', '2022-11-18 11:11:06'),
(309, NULL, 'DUMMY', 309, 1, '2022-11-18 11:13:33', '2022-11-18 11:13:33'),
(310, NULL, 'DUMMY', 310, 1, '2022-11-18 11:14:06', '2022-11-18 11:14:06'),
(311, NULL, 'DUMMY', 311, 1, '2022-11-18 11:14:30', '2022-11-18 11:14:30'),
(312, NULL, 'DUMMY', 312, 1, '2022-11-18 11:15:55', '2022-11-18 11:15:55'),
(313, NULL, 'DUMMY', 313, 1, '2022-11-18 11:16:24', '2022-11-18 11:16:24'),
(314, NULL, 'DUMMY', 314, 1, '2022-11-18 11:16:51', '2022-11-18 11:16:51'),
(315, NULL, 'DUMMY', 315, 1, '2022-11-18 11:17:21', '2022-11-18 11:17:21'),
(316, NULL, 'DUMMY', 316, 1, '2022-11-18 11:18:38', '2022-11-18 11:18:38'),
(317, NULL, 'DUMMY', 317, 1, '2022-11-18 11:20:10', '2022-11-18 11:20:10'),
(318, NULL, 'DUMMY', 318, 1, '2022-11-18 11:21:00', '2022-11-18 11:21:00'),
(319, NULL, 'DUMMY', 319, 1, '2022-11-18 11:22:26', '2022-11-18 11:22:26'),
(320, NULL, 'DUMMY', 320, 1, '2022-11-18 11:23:06', '2022-11-18 11:23:06'),
(321, NULL, 'DUMMY', 321, 1, '2022-11-18 11:25:12', '2022-11-18 11:25:12'),
(322, NULL, 'DUMMY', 322, 1, '2022-11-18 11:25:59', '2022-11-18 11:25:59'),
(323, NULL, 'DUMMY', 323, 1, '2022-11-18 11:28:56', '2022-11-18 11:28:56'),
(324, NULL, 'DUMMY', 324, 1, '2022-11-18 11:29:24', '2022-11-18 11:29:24'),
(325, NULL, 'DUMMY', 325, 1, '2022-11-18 11:30:55', '2022-11-18 11:30:55'),
(326, NULL, 'DUMMY', 326, 1, '2022-11-18 11:31:32', '2022-11-18 11:31:32'),
(327, NULL, 'DUMMY', 327, 1, '2022-11-18 11:31:57', '2022-11-18 11:31:57'),
(328, NULL, 'DUMMY', 328, 1, '2022-11-18 11:36:15', '2022-11-18 11:36:15'),
(329, NULL, 'DUMMY', 329, 1, '2022-11-18 11:37:07', '2022-11-18 11:37:07'),
(330, NULL, 'DUMMY', 330, 1, '2022-11-18 11:37:41', '2022-11-18 11:37:41'),
(331, NULL, 'DUMMY', 331, 1, '2022-11-18 11:38:08', '2022-11-18 11:38:08'),
(332, NULL, 'DUMMY', 332, 1, '2022-11-18 11:39:13', '2022-11-18 11:39:13'),
(333, NULL, 'DUMMY', 333, 1, '2022-11-18 11:39:44', '2022-11-18 11:39:44'),
(334, NULL, 'DUMMY', 334, 1, '2022-11-18 11:42:10', '2022-11-18 11:42:10'),
(335, NULL, 'DUMMY', 335, 1, '2022-11-18 11:43:11', '2022-11-18 11:43:11'),
(336, NULL, 'DUMMY', 336, 1, '2022-11-18 13:47:59', '2022-11-18 13:47:59'),
(337, NULL, 'DUMMY', 337, 1, '2022-11-24 13:11:25', '2022-11-24 13:11:25'),
(338, NULL, 'DUMMY', 338, 1, '2022-11-24 13:12:07', '2022-11-24 13:12:07'),
(339, NULL, 'DUMMY', 339, 1, '2022-11-24 13:12:59', '2022-11-24 13:12:59'),
(340, NULL, 'DUMMY', 340, 1, '2022-11-24 13:13:52', '2022-11-24 13:13:52'),
(341, NULL, 'DUMMY', 341, 1, '2022-11-24 13:16:56', '2022-11-24 13:16:56'),
(342, NULL, 'DUMMY', 342, 1, '2022-11-24 13:17:37', '2022-11-24 13:17:37'),
(343, NULL, 'DUMMY', 343, 1, '2022-11-24 13:18:20', '2022-11-24 13:18:20'),
(344, NULL, 'DUMMY', 344, 1, '2022-11-24 15:57:21', '2022-11-24 15:57:21'),
(345, NULL, 'DUMMY', 345, 1, '2022-11-24 15:58:17', '2022-11-24 15:58:17'),
(346, NULL, 'DUMMY', 346, 1, '2022-11-24 15:58:56', '2022-11-24 15:58:56'),
(347, NULL, 'DUMMY', 347, 1, '2022-11-24 15:59:39', '2022-11-24 15:59:39'),
(348, NULL, 'DUMMY', 348, 1, '2022-11-24 16:00:21', '2022-11-24 16:00:21'),
(349, NULL, 'DUMMY', 349, 1, '2022-11-24 16:00:58', '2022-11-24 16:00:58'),
(350, NULL, 'DUMMY', 350, 1, '2022-11-24 16:01:33', '2022-11-24 16:01:33'),
(351, NULL, 'DUMMY', 351, 1, '2022-11-24 16:02:08', '2022-11-24 16:02:08'),
(352, NULL, 'DUMMY', 352, 1, '2022-11-24 16:02:49', '2022-11-24 16:02:49'),
(353, NULL, 'DUMMY', 353, 1, '2022-11-24 16:03:32', '2022-11-24 16:03:32'),
(354, NULL, 'DUMMY', 354, 1, '2022-11-24 16:04:19', '2022-11-24 16:04:19'),
(355, NULL, 'DUMMY', 355, 1, '2022-11-24 16:05:05', '2022-11-24 16:05:05'),
(356, NULL, 'DUMMY', 356, 1, '2022-11-24 16:05:45', '2022-11-24 16:05:45'),
(357, NULL, 'DUMMY', 357, 1, '2022-11-24 16:06:41', '2022-11-24 16:06:41'),
(358, NULL, 'DUMMY', 358, 1, '2022-11-24 16:07:33', '2022-11-24 16:07:33'),
(359, NULL, 'DUMMY', 359, 1, '2022-11-24 16:08:17', '2022-11-24 16:08:17'),
(360, NULL, 'DUMMY', 360, 1, '2022-11-24 16:08:55', '2022-11-24 16:08:55'),
(361, NULL, 'DUMMY', 361, 1, '2022-11-24 16:09:40', '2022-11-24 16:09:40'),
(362, NULL, 'DUMMY', 362, 1, '2022-11-24 16:10:20', '2022-11-24 16:10:20'),
(363, NULL, 'DUMMY', 363, 1, '2022-11-24 16:10:57', '2022-11-24 16:10:57'),
(364, NULL, 'DUMMY', 364, 1, '2022-11-24 16:11:35', '2022-11-24 16:11:35'),
(365, NULL, 'DUMMY', 365, 1, '2022-11-24 16:12:12', '2022-11-24 16:12:12'),
(366, NULL, 'DUMMY', 366, 1, '2022-11-24 16:15:19', '2022-11-24 16:15:19'),
(367, NULL, 'DUMMY', 367, 1, '2022-11-24 16:15:54', '2022-11-24 16:15:54'),
(368, NULL, 'DUMMY', 368, 1, '2022-11-24 16:16:27', '2022-11-24 16:16:27'),
(369, NULL, 'DUMMY', 369, 1, '2022-11-24 16:17:05', '2022-11-24 16:17:05'),
(370, NULL, 'DUMMY', 370, 1, '2022-11-24 16:17:40', '2022-11-24 16:17:40'),
(371, NULL, 'DUMMY', 371, 1, '2022-11-24 16:18:13', '2022-11-24 16:18:13'),
(372, NULL, 'DUMMY', 372, 1, '2022-11-24 16:19:02', '2022-11-24 16:19:02'),
(373, NULL, 'DUMMY', 373, 1, '2022-11-24 16:19:53', '2022-11-24 16:19:53'),
(375, NULL, 'DUMMY', 375, 1, '2022-11-26 10:35:26', '2022-11-26 10:35:26');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int UNSIGNED DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '6.0000', '75.0000', '0.00', '75.0000', '75.0000', '0.0000', NULL, '3.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 20:47:10', '2022-11-26 15:14:51'),
(2, 2, 2, 2, '12.0000', '75.0000', '0.00', '75.0000', '75.0000', '0.0000', NULL, '2.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 21:51:12', '2022-11-23 21:25:08'),
(3, 3, 4, 4, '12.0000', '120.0000', '0.00', '120.0000', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 21:56:25', '2022-11-13 21:56:25'),
(4, 4, 5, 5, '12.0000', '130.0000', '0.00', '130.0000', '130.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:02:21', '2022-11-26 18:39:54'),
(5, 5, 6, 6, '12.0000', '43.3400', '0.00', '43.3400', '43.3400', '0.0000', NULL, '2.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:17:10', '2022-11-23 21:36:02'),
(6, 6, 7, 7, '6.0000', '41.6700', '0.00', '41.6700', '41.6700', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:18:59', '2022-11-13 22:18:59'),
(7, 7, 8, 8, '6.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:20:26', '2022-11-13 22:20:26'),
(8, 8, 9, 9, '6.0000', '55.0000', '0.00', '55.0000', '55.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:26:03', '2022-11-13 22:26:03'),
(9, 9, 10, 10, '6.0000', '75.0000', '0.00', '75.0000', '75.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:28:14', '2022-11-13 22:28:14'),
(10, 10, 11, 11, '6.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:29:55', '2022-11-13 22:29:55'),
(11, 11, 12, 12, '6.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:30:55', '2022-11-26 17:53:56'),
(12, 12, 13, 13, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:34:45', '2022-11-16 18:14:26'),
(13, 13, 14, 14, '12.0000', '32.5000', '0.00', '32.5000', '32.5000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:36:06', '2022-11-13 22:36:06'),
(14, 14, 15, 15, '6.0000', '70.0000', '0.00', '70.0000', '70.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:37:38', '2022-11-13 22:37:38'),
(15, 15, 16, 16, '12.0000', '65.0000', '0.00', '65.0000', '65.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:38:51', '2022-11-13 22:38:51'),
(16, 16, 17, 17, '6.0000', '120.0000', '0.00', '120.0000', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:41:03', '2022-11-13 22:41:03'),
(17, 17, 18, 18, '12.0000', '29.1700', '0.00', '29.1700', '29.1700', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:43:20', '2022-11-23 21:36:02'),
(18, 18, 19, 19, '12.0000', '48.3400', '0.00', '48.3400', '48.3400', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:44:57', '2022-11-13 22:44:57'),
(19, 19, 20, 20, '6.0000', '95.0000', '0.00', '95.0000', '95.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:45:49', '2022-11-13 22:45:49'),
(20, 20, 21, 21, '12.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:46:56', '2022-11-18 16:48:05'),
(21, 21, 22, 22, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:50:00', '2022-11-13 22:50:00'),
(22, 22, 23, 23, '12.0000', '48.3400', '0.00', '48.3400', '48.3400', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:56:31', '2022-11-13 22:56:31'),
(23, 23, 24, 24, '12.0000', '90.0000', '0.00', '90.0000', '90.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:57:34', '2022-11-23 21:25:08'),
(24, 24, 25, 25, '12.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:58:21', '2022-11-13 22:58:21'),
(25, 25, 26, 26, '12.0000', '65.0000', '0.00', '65.0000', '65.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 22:59:33', '2022-11-13 22:59:33'),
(26, 26, 27, 27, '12.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:00:43', '2022-11-13 23:00:43'),
(27, 27, 28, 28, '6.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:01:59', '2022-11-13 23:01:59'),
(28, 28, 29, 29, '6.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:03:23', '2022-11-13 23:03:23'),
(29, 29, 31, 31, '12.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:09:27', '2022-11-13 23:09:27'),
(30, 30, 32, 32, '6.0000', '130.0000', '0.00', '130.0000', '130.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:11:17', '2022-11-13 23:11:17'),
(31, 31, 33, 33, '6.0000', '130.0000', '0.00', '130.0000', '130.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:13:16', '2022-11-13 23:13:16'),
(32, 32, 34, 34, '12.0000', '70.0000', '0.00', '70.0000', '70.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:14:11', '2022-11-13 23:14:11'),
(33, 33, 35, 35, '12.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:15:21', '2022-11-13 23:15:21'),
(34, 34, 36, 36, '12.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:16:19', '2022-11-13 23:16:19'),
(35, 35, 37, 37, '6.0000', '120.0000', '0.00', '120.0000', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:17:16', '2022-11-13 23:17:16'),
(36, 36, 38, 38, '6.0000', '120.0000', '0.00', '120.0000', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:18:03', '2022-11-13 23:18:03'),
(37, 37, 39, 39, '6.0000', '130.0000', '0.00', '130.0000', '130.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:18:47', '2022-11-13 23:18:47'),
(38, 38, 40, 40, '6.0000', '120.0000', '0.00', '120.0000', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:23:36', '2022-11-13 23:23:36'),
(39, 39, 41, 41, '6.0000', '80.0000', '0.00', '80.0000', '80.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:25:09', '2022-11-13 23:25:09'),
(40, 40, 42, 42, '6.0000', '210.0000', '0.00', '210.0000', '210.0000', '0.0000', NULL, '2.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:26:12', '2022-11-23 21:25:08'),
(41, 41, 43, 43, '6.0000', '90.0000', '0.00', '90.0000', '90.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:27:05', '2022-11-26 18:39:54'),
(42, 42, 44, 44, '6.0000', '210.0000', '0.00', '210.0000', '210.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:28:02', '2022-11-13 23:28:02'),
(43, 43, 45, 45, '12.0000', '18.3400', '0.00', '18.3400', '18.3400', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:29:02', '2022-11-13 23:29:02'),
(44, 44, 46, 46, '6.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:29:53', '2022-11-13 23:29:53'),
(45, 45, 47, 47, '6.0000', '260.0000', '0.00', '260.0000', '260.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:30:49', '2022-11-13 23:30:49'),
(46, 46, 48, 48, '6.0000', '160.0000', '0.00', '160.0000', '160.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:32:04', '2022-11-13 23:32:04'),
(47, 47, 49, 49, '12.0000', '90.0000', '0.00', '90.0000', '90.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:32:56', '2022-11-13 23:34:10'),
(48, 48, 50, 50, '12.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:36:09', '2022-11-13 23:36:09'),
(49, 49, 51, 51, '6.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:37:02', '2022-11-13 23:37:02'),
(50, 50, 52, 52, '36.0000', '35.0000', '0.00', '35.0000', '35.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:38:10', '2022-11-13 23:38:10'),
(51, 51, 53, 53, '6.0000', '140.0000', '0.00', '140.0000', '140.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:39:03', '2022-11-13 23:39:03'),
(52, 52, 54, 54, '3.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:39:52', '2022-11-13 23:39:52'),
(53, 53, 55, 55, '12.0000', '43.3400', '0.00', '43.3400', '43.3400', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:40:46', '2022-11-13 23:40:46'),
(54, 54, 56, 56, '6.0000', '130.0000', '0.00', '130.0000', '130.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:41:55', '2022-11-13 23:41:55'),
(55, 55, 57, 57, '6.0000', '250.0000', '0.00', '250.0000', '250.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:44:25', '2022-11-13 23:44:25'),
(56, 56, 58, 58, '6.0000', '350.0000', '0.00', '350.0000', '350.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:46:43', '2022-11-13 23:46:43'),
(57, 57, 59, 59, '6.0000', '75.0000', '0.00', '75.0000', '75.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:47:52', '2022-11-13 23:47:52'),
(58, 58, 60, 60, '6.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:48:46', '2022-11-13 23:48:46'),
(59, 59, 61, 61, '6.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:49:37', '2022-11-13 23:49:37'),
(60, 60, 62, 62, '12.0000', '35.0000', '0.00', '35.0000', '35.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:51:01', '2022-11-13 23:51:01'),
(61, 61, 63, 63, '6.0000', '55.0000', '0.00', '55.0000', '55.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:52:11', '2022-11-13 23:52:11'),
(62, 62, 64, 64, '6.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:53:03', '2022-11-13 23:53:03'),
(63, 63, 65, 65, '6.0000', '190.0000', '0.00', '190.0000', '190.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:54:21', '2022-11-13 23:54:21'),
(64, 64, 66, 66, '12.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:55:30', '2022-11-13 23:55:30'),
(65, 65, 67, 67, '6.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-13 23:57:23', '2022-11-13 23:57:23'),
(66, 66, 68, 68, '18.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:05:50', '2022-11-14 00:05:50'),
(67, 67, 69, 69, '18.0000', '145.0000', '0.00', '145.0000', '145.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:06:58', '2022-11-14 00:21:45'),
(68, 68, 70, 70, '6.0000', '120.0000', '0.00', '120.0000', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:08:46', '2022-11-14 00:08:46'),
(69, 69, 71, 71, '6.0000', '145.0000', '0.00', '145.0000', '145.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:09:38', '2022-11-14 00:09:38'),
(70, 70, 72, 72, '6.0000', '110.0000', '0.00', '110.0000', '110.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:10:34', '2022-11-14 00:10:34'),
(71, 71, 73, 73, '6.0000', '65.0000', '0.00', '65.0000', '65.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:11:23', '2022-11-14 00:11:23'),
(72, 72, 74, 74, '6.0000', '120.0000', '0.00', '120.0000', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:14:56', '2022-11-14 00:14:56'),
(73, 73, 75, 75, '6.0000', '125.0000', '0.00', '125.0000', '125.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:15:46', '2022-11-14 00:15:46'),
(74, 74, 76, 76, '6.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:17:13', '2022-11-14 00:17:13'),
(75, 75, 77, 77, '6.0000', '280.0000', '0.00', '280.0000', '280.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:18:19', '2022-11-14 00:18:19'),
(76, 76, 78, 78, '3.0000', '140.0000', '0.00', '140.0000', '140.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:19:19', '2022-11-14 00:19:19'),
(77, 77, 79, 79, '6.0000', '56.6700', '0.00', '56.6700', '56.6700', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:20:20', '2022-11-14 00:20:20'),
(78, 78, 80, 80, '18.0000', '110.0000', '0.00', '110.0000', '110.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:22:52', '2022-11-14 00:22:52'),
(79, 79, 81, 81, '6.0000', '70.0000', '0.00', '70.0000', '70.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:23:44', '2022-11-14 00:23:44'),
(80, 80, 82, 82, '6.0000', '80.0000', '0.00', '80.0000', '80.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:24:39', '2022-11-14 00:24:39'),
(81, 81, 83, 83, '3.0000', '140.0000', '0.00', '140.0000', '140.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:25:31', '2022-11-14 00:25:31'),
(82, 82, 84, 84, '12.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:26:15', '2022-11-14 00:26:15'),
(83, 83, 85, 85, '12.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:26:53', '2022-11-14 00:26:53'),
(84, 84, 86, 86, '12.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:27:42', '2022-11-14 00:27:42'),
(85, 85, 87, 87, '6.0000', '95.0000', '0.00', '95.0000', '95.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:29:18', '2022-11-14 00:29:18'),
(86, 86, 88, 88, '6.0000', '95.0000', '0.00', '95.0000', '95.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:30:16', '2022-11-14 00:30:16'),
(87, 87, 89, 89, '6.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:30:54', '2022-11-14 00:30:54'),
(88, 88, 90, 90, '6.0000', '120.0000', '0.00', '120.0000', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:32:28', '2022-11-14 00:32:28'),
(89, 89, 91, 91, '6.0000', '70.0000', '0.00', '70.0000', '70.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:33:30', '2022-11-14 00:33:30'),
(90, 90, 92, 92, '6.0000', '55.0000', '0.00', '55.0000', '55.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:34:22', '2022-11-14 00:34:22'),
(91, 91, 93, 93, '12.0000', '80.0000', '0.00', '80.0000', '80.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:35:30', '2022-11-14 00:35:30'),
(92, 92, 94, 94, '12.0000', '340.0000', '0.00', '340.0000', '340.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:36:15', '2022-11-26 19:38:48'),
(93, 93, 95, 95, '12.0000', '18.3333', '0.00', '18.3333', '18.3333', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:36:57', '2022-11-26 17:46:30'),
(94, 94, 96, 96, '12.0000', '90.0000', '0.00', '90.0000', '90.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:37:48', '2022-11-26 18:39:54'),
(95, 95, 97, 97, '6.0000', '130.0000', '0.00', '130.0000', '130.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:38:41', '2022-11-14 00:38:41'),
(96, 96, 98, 98, '2.0000', '450.0000', '0.00', '450.0000', '450.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:39:29', '2022-11-14 00:39:29'),
(97, 97, 99, 99, '12.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:40:21', '2022-11-16 18:06:42'),
(98, 98, 100, 100, '6.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:41:11', '2022-11-14 00:41:11'),
(99, 99, 101, 101, '6.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:42:01', '2022-11-14 00:42:01'),
(100, 100, 102, 102, '6.0000', '90.0000', '0.00', '90.0000', '90.0000', '0.0000', NULL, '2.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:42:48', '2022-11-26 15:14:51'),
(101, 101, 103, 103, '6.0000', '95.0000', '0.00', '95.0000', '95.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:43:36', '2022-11-14 00:43:36'),
(102, 102, 104, 104, '6.0000', '70.0000', '0.00', '70.0000', '70.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:44:51', '2022-11-14 00:44:51'),
(103, 103, 105, 105, '12.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:45:56', '2022-11-14 00:45:56'),
(104, 104, 106, 106, '6.0000', '65.0000', '0.00', '65.0000', '65.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:46:50', '2022-11-14 00:46:50'),
(105, 105, 107, 107, '6.0000', '95.0000', '0.00', '95.0000', '95.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-14 00:47:36', '2022-11-14 00:47:36'),
(106, 106, 108, 108, '24.0000', '70.0000', '0.00', '70.0000', '70.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 14:27:34', '2022-11-16 14:27:34'),
(107, 107, 109, 109, '12.0000', '35.0000', '0.00', '35.0000', '35.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 14:28:47', '2022-11-16 14:28:47'),
(108, 108, 110, 110, '12.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 14:33:36', '2022-11-16 14:33:36'),
(109, 109, 111, 111, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 14:35:18', '2022-11-16 14:35:18'),
(110, 110, 112, 112, '24.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 14:36:27', '2022-11-16 14:36:27'),
(111, 111, 113, 113, '36.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 14:37:59', '2022-11-16 14:37:59'),
(112, 112, 114, 114, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 14:39:07', '2022-11-16 14:39:07'),
(113, 113, 115, 115, '144.0000', '5.0000', '0.00', '5.0000', '5.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 14:46:31', '2022-11-16 14:52:53'),
(114, 114, 116, 116, '12.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 14:48:31', '2022-11-16 14:48:31'),
(116, 115, 117, 117, '84.0000', '24.0000', '0.00', '24.0000', '24.0000', '0.0000', NULL, '2.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:07:03', '2022-11-18 13:38:47'),
(117, 116, 118, 118, '36.0000', '33.0000', '0.00', '33.0000', '33.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:07:46', '2022-11-16 15:07:46'),
(118, 117, 119, 119, '24.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:10:19', '2022-11-16 15:10:19'),
(119, 118, 120, 120, '12.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:13:54', '2022-11-16 15:13:54'),
(120, 119, 121, 121, '6.0000', '35.0000', '0.00', '35.0000', '35.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:14:44', '2022-11-16 15:14:44'),
(121, 120, 122, 122, '24.0000', '18.0000', '0.00', '18.0000', '18.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:15:39', '2022-11-16 15:15:39'),
(122, 121, 123, 123, '20.0000', '22.0000', '0.00', '22.0000', '22.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:19:13', '2022-11-16 15:19:13'),
(123, 122, 124, 124, '20.0000', '22.0000', '0.00', '22.0000', '22.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:19:59', '2022-11-16 15:19:59'),
(124, 123, 125, 125, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:21:09', '2022-11-16 15:21:09'),
(125, 124, 126, 126, '12.0000', '35.0000', '0.00', '35.0000', '35.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:22:11', '2022-11-16 15:22:11'),
(126, 125, 127, 127, '60.0000', '3.0000', '0.00', '3.0000', '3.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:23:58', '2022-11-16 15:23:58'),
(127, 126, 128, 128, '12.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:30:48', '2022-11-16 15:30:48'),
(128, 127, 129, 129, '12.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:31:44', '2022-11-16 15:31:44'),
(129, 128, 130, 130, '6.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:35:42', '2022-11-16 15:35:42'),
(130, 129, 131, 131, '6.0000', '150.0000', '0.00', '150.0000', '150.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:36:31', '2022-11-26 18:23:50'),
(131, 130, 132, 132, '6.0000', '240.0000', '0.00', '240.0000', '240.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:40:08', '2022-11-16 15:41:34'),
(132, 131, 133, 133, '12.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:43:59', '2022-11-16 15:47:53'),
(133, 132, 134, 134, '12.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:45:50', '2022-11-16 15:45:50'),
(134, 133, 135, 135, '6.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:49:18', '2022-11-16 15:49:18'),
(135, 134, 136, 136, '3.0000', '120.0000', '0.00', '120.0000', '120.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:51:28', '2022-11-16 15:51:28'),
(136, 135, 137, 137, '24.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:53:26', '2022-11-16 15:53:26'),
(137, 136, 138, 138, '12.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 15:55:14', '2022-11-16 15:55:14'),
(138, 137, 139, 139, '6.0000', '80.0000', '0.00', '80.0000', '80.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:00:00', '2022-11-16 16:00:00'),
(139, 138, 140, 140, '6.0000', '80.0000', '0.00', '80.0000', '80.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:00:34', '2022-11-16 16:00:34'),
(140, 139, 141, 141, '24.0000', '33.0000', '0.00', '33.0000', '33.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:03:04', '2022-11-16 16:05:02'),
(141, 140, 142, 142, '12.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:04:12', '2022-11-16 16:04:12'),
(142, 141, 143, 143, '12.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:07:07', '2022-11-26 18:39:54'),
(143, 142, 144, 144, '12.0000', '18.0000', '0.00', '18.0000', '18.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:09:00', '2022-11-16 16:09:00'),
(144, 143, 145, 145, '12.0000', '35.0000', '0.00', '35.0000', '35.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:13:27', '2022-11-16 16:13:27'),
(145, 144, 146, 146, '12.0000', '35.0000', '0.00', '35.0000', '35.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:14:30', '2022-11-16 16:14:30'),
(146, 145, 147, 147, '12.0000', '35.0000', '0.00', '35.0000', '35.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:16:23', '2022-11-16 16:16:23'),
(147, 146, 148, 148, '24.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:17:17', '2022-11-16 16:17:17'),
(148, 147, 149, 149, '12.0000', '100.0000', '0.00', '100.0000', '100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:19:37', '2022-11-16 16:19:37'),
(149, 148, 150, 150, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:20:41', '2022-11-16 16:20:41'),
(150, 149, 151, 151, '12.0000', '35.0000', '0.00', '35.0000', '35.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:24:21', '2022-11-16 16:24:21'),
(151, 150, 152, 152, '12.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:25:27', '2022-11-16 16:25:27'),
(152, 151, 153, 153, '12.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:26:46', '2022-11-16 16:26:46'),
(153, 152, 154, 154, '24.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:28:23', '2022-11-16 16:30:47'),
(154, 153, 155, 155, '12.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:29:49', '2022-11-16 16:29:49'),
(155, 154, 156, 156, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:31:30', '2022-11-16 16:31:30'),
(156, 155, 157, 157, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:33:34', '2022-11-16 16:33:34'),
(157, 156, 158, 158, '12.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:34:16', '2022-11-16 16:34:16'),
(158, 157, 159, 159, '12.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:48:31', '2022-11-16 16:48:31'),
(159, 158, 160, 160, '12.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:49:45', '2022-11-16 16:49:45'),
(160, 159, 161, 161, '12.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:50:29', '2022-11-16 16:50:29'),
(161, 160, 162, 162, '12.0000', '8.0000', '0.00', '8.0000', '8.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:51:11', '2022-11-16 16:51:11'),
(162, 161, 163, 163, '12.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:51:46', '2022-11-16 16:51:46'),
(163, 162, 164, 164, '24.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:56:59', '2022-11-16 16:56:59'),
(164, 163, 165, 165, '12.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 16:58:02', '2022-11-16 16:58:02'),
(165, 164, 166, 166, '12.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 17:01:23', '2022-11-16 17:01:23'),
(166, 165, 167, 167, '12.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 17:02:33', '2022-11-16 17:02:33'),
(167, 166, 168, 168, '12.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 17:03:09', '2022-11-16 17:03:09'),
(168, 167, 169, 169, '12.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 17:04:22', '2022-11-16 17:04:22'),
(169, 168, 170, 170, '48.0000', '18.0000', '0.00', '18.0000', '18.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 17:06:47', '2022-11-16 17:06:47'),
(170, 169, 171, 171, '24.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 17:11:35', '2022-11-16 17:11:35'),
(171, 170, 172, 172, '12.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 17:13:32', '2022-11-16 17:13:32'),
(172, 171, 173, 173, '12.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 17:15:26', '2022-11-16 17:15:26'),
(173, 172, 174, 174, '12.0000', '130.0000', '0.00', '130.0000', '130.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 17:16:33', '2022-11-16 17:16:33'),
(174, 173, 175, 175, '12.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 17:20:44', '2022-11-16 17:20:44'),
(175, 174, 176, 176, '12.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 17:21:59', '2022-11-16 17:21:59'),
(176, 175, 177, 177, '12.0000', '30.0000', '0.00', '30.0000', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 17:31:53', '2022-11-16 17:31:53'),
(177, 176, 178, 178, '24.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 17:33:30', '2022-11-16 17:33:30'),
(178, 177, 179, 179, '12.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 17:35:26', '2022-11-16 17:35:26'),
(179, 178, 180, 180, '12.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 17:36:05', '2022-11-16 17:36:05'),
(180, 179, 30, 30, '12.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-16 18:11:19', '2022-11-16 18:11:19'),
(222, 221, 223, 223, '10.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:32:30', '2022-11-18 09:32:30'),
(223, 222, 224, 224, '10.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:33:24', '2022-11-18 09:33:24'),
(224, 223, 225, 225, '10.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:34:17', '2022-11-18 09:34:17'),
(225, 224, 226, 226, '10.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:34:59', '2022-11-18 09:34:59'),
(226, 225, 227, 227, '10.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:35:42', '2022-11-18 09:35:42'),
(227, 226, 228, 228, '20.0000', '52.0000', '0.00', '52.0000', '52.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:37:51', '2022-11-18 09:41:23'),
(228, 227, 229, 229, '20.0000', '52.0000', '0.00', '52.0000', '52.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:38:59', '2022-11-18 09:38:59'),
(229, 228, 230, 230, '10.0000', '52.0000', '0.00', '52.0000', '52.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:40:02', '2022-11-18 09:40:02'),
(230, 229, 231, 231, '10.0000', '55.0000', '0.00', '55.0000', '55.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:46:40', '2022-11-18 09:46:40'),
(231, 230, 232, 232, '20.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:47:46', '2022-11-18 09:47:46'),
(232, 231, 233, 233, '20.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:49:45', '2022-11-18 09:49:45'),
(233, 232, 234, 234, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:50:36', '2022-11-18 09:50:36'),
(234, 233, 235, 235, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:51:32', '2022-11-18 09:51:32'),
(235, 234, 236, 236, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:52:20', '2022-11-18 09:52:20'),
(236, 235, 237, 237, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:53:03', '2022-11-18 09:53:03'),
(237, 236, 238, 238, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:54:12', '2022-11-18 09:54:12'),
(238, 237, 239, 239, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:54:59', '2022-11-18 09:54:59'),
(239, 238, 240, 240, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:56:37', '2022-11-18 09:56:37'),
(240, 239, 241, 241, '20.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:57:22', '2022-11-18 09:57:22'),
(241, 240, 242, 242, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:58:03', '2022-11-18 09:58:03'),
(242, 241, 243, 243, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 09:59:45', '2022-11-18 09:59:45'),
(243, 242, 244, 244, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:00:28', '2022-11-18 10:00:28'),
(244, 243, 245, 245, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:01:25', '2022-11-18 10:01:25'),
(245, 244, 246, 246, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:02:10', '2022-11-18 10:02:10'),
(246, 245, 247, 247, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:03:00', '2022-11-18 10:03:00'),
(247, 246, 248, 248, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:03:45', '2022-11-18 10:03:45'),
(248, 247, 249, 249, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:07:40', '2022-11-18 10:07:40'),
(249, 248, 250, 250, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:08:34', '2022-11-18 10:08:34'),
(250, 249, 251, 251, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:10:09', '2022-11-18 10:10:09'),
(251, 250, 252, 252, '20.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:10:52', '2022-11-18 10:10:52'),
(252, 251, 253, 253, '20.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:11:25', '2022-11-18 10:11:25'),
(253, 252, 254, 254, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:11:57', '2022-11-18 10:11:57'),
(254, 253, 255, 255, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:12:49', '2022-11-18 10:12:49'),
(255, 254, 256, 256, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:13:28', '2022-11-18 10:13:28'),
(256, 255, 257, 257, '14.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:14:03', '2022-11-18 12:44:45'),
(257, 256, 258, 258, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:14:34', '2022-11-18 10:14:34'),
(258, 257, 259, 259, '20.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:15:24', '2022-11-18 10:15:24'),
(259, 258, 260, 260, '20.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:16:02', '2022-11-18 10:16:02'),
(260, 259, 261, 261, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:16:45', '2022-11-18 10:16:45'),
(261, 260, 262, 262, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:17:17', '2022-11-18 10:17:17'),
(262, 261, 263, 263, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:18:06', '2022-11-18 10:18:06'),
(263, 262, 264, 264, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:18:41', '2022-11-18 10:18:41'),
(264, 263, 265, 265, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:19:21', '2022-11-18 10:19:21'),
(265, 264, 266, 266, '10.0000', '50.0000', '0.00', '50.0000', '50.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:19:59', '2022-11-18 10:19:59'),
(266, 265, 267, 267, '4.0000', '585.0000', '0.00', '585.0000', '585.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:29:42', '2022-11-24 16:13:38'),
(267, 266, 268, 268, '1.0000', '585.0000', '0.00', '585.0000', '585.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:30:24', '2022-11-18 10:30:24'),
(268, 267, 269, 269, '1.0000', '585.0000', '0.00', '585.0000', '585.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:31:13', '2022-11-18 10:31:13'),
(269, 268, 270, 270, '2.0000', '585.0000', '0.00', '585.0000', '585.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:32:15', '2022-11-24 16:14:11'),
(270, 269, 271, 271, '2.0000', '390.0000', '0.00', '390.0000', '390.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:33:41', '2022-11-18 10:33:41'),
(271, 270, 272, 272, '2.0000', '390.0000', '0.00', '390.0000', '390.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:34:09', '2022-11-18 10:34:09'),
(272, 271, 273, 273, '2.0000', '390.0000', '0.00', '390.0000', '390.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:34:39', '2022-11-18 10:34:39'),
(273, 272, 274, 274, '2.0000', '390.0000', '0.00', '390.0000', '390.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:35:09', '2022-11-18 10:35:09'),
(274, 273, 275, 275, '2.0000', '390.0000', '0.00', '390.0000', '390.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:35:55', '2022-11-18 10:35:55'),
(275, 274, 276, 276, '1.0000', '600.0000', '0.00', '600.0000', '600.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:38:07', '2022-11-18 10:38:07'),
(276, 275, 277, 277, '1.0000', '600.0000', '0.00', '600.0000', '600.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:38:42', '2022-11-18 10:38:42'),
(277, 276, 278, 278, '1.0000', '600.0000', '0.00', '600.0000', '600.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:39:16', '2022-11-18 10:39:16'),
(278, 277, 279, 279, '1.0000', '600.0000', '0.00', '600.0000', '600.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:39:43', '2022-11-18 10:39:43'),
(279, 278, 280, 280, '1.0000', '600.0000', '0.00', '600.0000', '600.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:40:14', '2022-11-18 10:40:14'),
(280, 279, 281, 281, '5.0000', '1500.0000', '0.00', '1500.0000', '1500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:41:55', '2022-11-18 10:41:55'),
(281, 280, 282, 282, '3.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:43:44', '2022-11-18 10:43:44'),
(282, 281, 283, 283, '2.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:45:50', '2022-11-18 10:45:50'),
(283, 282, 284, 284, '1.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:48:45', '2022-11-18 10:48:45'),
(284, 283, 285, 285, '2.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:49:13', '2022-11-18 10:49:13'),
(285, 284, 286, 286, '1.0000', '535.0000', '0.00', '535.0000', '535.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:50:45', '2022-11-18 10:50:45'),
(286, 285, 287, 287, '1.0000', '535.0000', '0.00', '535.0000', '535.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:51:12', '2022-11-18 10:51:12'),
(287, 286, 288, 288, '1.0000', '535.0000', '0.00', '535.0000', '535.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:51:48', '2022-11-18 10:51:48'),
(288, 287, 289, 289, '1.0000', '585.0000', '0.00', '585.0000', '585.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:52:38', '2022-11-18 10:52:38'),
(289, 288, 290, 290, '1.0000', '535.0000', '0.00', '535.0000', '535.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:53:03', '2022-11-18 10:53:03'),
(290, 289, 291, 291, '1.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:54:01', '2022-11-18 10:54:01'),
(291, 290, 292, 292, '2.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:54:26', '2022-11-18 10:54:26'),
(292, 291, 293, 293, '2.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:54:54', '2022-11-18 10:54:54'),
(293, 292, 294, 294, '2.0000', '500.0000', '0.00', '500.0000', '500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:56:07', '2022-11-18 10:57:12'),
(294, 293, 295, 295, '1.0000', '500.0000', '0.00', '500.0000', '500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:56:45', '2022-11-18 10:56:45');
INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(295, 294, 296, 296, '2.0000', '350.0000', '0.00', '350.0000', '350.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 10:59:55', '2022-11-18 10:59:55'),
(296, 295, 297, 297, '1.0000', '560.0000', '0.00', '560.0000', '560.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:01:15', '2022-11-18 11:01:15'),
(297, 296, 298, 298, '1.0000', '560.0000', '0.00', '560.0000', '560.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:01:49', '2022-11-18 11:01:49'),
(298, 297, 299, 299, '1.0000', '560.0000', '0.00', '560.0000', '560.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:02:21', '2022-11-18 11:02:21'),
(299, 298, 300, 300, '1.0000', '470.0000', '0.00', '470.0000', '470.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:03:34', '2022-11-18 11:03:34'),
(300, 299, 301, 301, '1.0000', '470.0000', '0.00', '470.0000', '470.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:03:58', '2022-11-18 11:03:58'),
(301, 300, 302, 302, '1.0000', '470.0000', '0.00', '470.0000', '470.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:04:50', '2022-11-18 11:04:50'),
(302, 301, 303, 303, '1.0000', '1.0000', '0.00', '1.0000', '1.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:06:41', '2022-11-18 11:06:41'),
(303, 302, 304, 304, '1.0000', '450.0000', '0.00', '450.0000', '450.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:08:26', '2022-11-18 11:08:26'),
(304, 303, 305, 305, '1.0000', '450.0000', '0.00', '450.0000', '450.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:08:54', '2022-11-18 11:08:54'),
(305, 304, 306, 306, '1.0000', '470.0000', '0.00', '470.0000', '470.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:09:26', '2022-11-18 11:09:26'),
(306, 305, 307, 307, '1.0000', '470.0000', '0.00', '470.0000', '470.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:10:17', '2022-11-18 11:10:17'),
(307, 306, 308, 308, '1.0000', '470.0000', '0.00', '470.0000', '470.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:11:10', '2022-11-18 11:11:10'),
(308, 307, 309, 309, '3.0000', '135.0000', '0.00', '135.0000', '135.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:13:38', '2022-11-18 11:15:03'),
(309, 308, 310, 310, '2.0000', '135.0000', '0.00', '135.0000', '135.0000', '0.0000', NULL, '1.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:14:10', '2022-11-26 17:59:54'),
(310, 309, 311, 311, '1.0000', '135.0000', '0.00', '135.0000', '135.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:14:35', '2022-11-18 11:14:35'),
(311, 310, 312, 312, '1.0000', '170.0000', '0.00', '170.0000', '170.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:16:01', '2022-11-18 11:16:01'),
(312, 311, 313, 313, '1.0000', '170.0000', '0.00', '170.0000', '170.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:16:29', '2022-11-18 11:16:29'),
(313, 312, 314, 314, '2.0000', '170.0000', '0.00', '170.0000', '170.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:16:56', '2022-11-18 11:16:56'),
(314, 313, 315, 315, '1.0000', '170.0000', '0.00', '170.0000', '170.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:17:26', '2022-11-18 11:17:26'),
(315, 314, 316, 316, '5.0000', '750.0000', '0.00', '750.0000', '750.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:18:43', '2022-11-18 11:18:43'),
(316, 315, 317, 317, '3.0000', '1065.0000', '0.00', '1065.0000', '1065.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:20:15', '2022-11-18 11:20:15'),
(317, 316, 318, 318, '3.0000', '1065.0000', '0.00', '1065.0000', '1065.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:21:04', '2022-11-18 11:21:04'),
(318, 317, 319, 319, '1.0000', '430.0000', '0.00', '430.0000', '430.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:22:31', '2022-11-18 11:22:31'),
(319, 318, 320, 320, '3.0000', '430.0000', '0.00', '430.0000', '430.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:23:14', '2022-11-18 11:23:14'),
(320, 319, 321, 321, '8.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:25:19', '2022-11-24 16:14:49'),
(321, 320, 322, 322, '2.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:26:05', '2022-11-18 11:26:05'),
(322, 321, 323, 323, '3.0000', '475.0000', '0.00', '475.0000', '475.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:29:05', '2022-11-18 11:29:05'),
(323, 322, 324, 324, '2.0000', '475.0000', '0.00', '475.0000', '475.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:29:50', '2022-11-18 11:29:50'),
(324, 323, 325, 325, '2.0000', '365.0000', '0.00', '365.0000', '365.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:31:15', '2022-11-18 11:31:15'),
(325, 324, 326, 326, '2.0000', '365.0000', '0.00', '365.0000', '365.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:31:36', '2022-11-18 11:31:36'),
(326, 325, 327, 327, '1.0000', '365.0000', '0.00', '365.0000', '365.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:32:06', '2022-11-18 11:32:06'),
(327, 326, 328, 328, '1.0000', '365.0000', '0.00', '365.0000', '365.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:36:20', '2022-11-18 11:36:20'),
(328, 327, 329, 329, '2.0000', '485.0000', '0.00', '485.0000', '485.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:37:12', '2022-11-18 11:37:12'),
(329, 328, 330, 330, '1.0000', '485.0000', '0.00', '485.0000', '485.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:37:46', '2022-11-18 11:37:46'),
(330, 329, 331, 331, '2.0000', '485.0000', '0.00', '485.0000', '485.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:38:13', '2022-11-18 11:38:13'),
(331, 330, 332, 332, '2.0000', '265.0000', '0.00', '265.0000', '265.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:39:18', '2022-11-18 11:39:18'),
(332, 331, 333, 333, '3.0000', '265.0000', '0.00', '265.0000', '265.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:39:48', '2022-11-18 11:39:48'),
(333, 332, 334, 334, '3.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:42:17', '2022-11-18 11:42:17'),
(334, 333, 335, 335, '2.0000', '350.0000', '0.00', '350.0000', '350.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 11:43:17', '2022-11-18 11:43:17'),
(335, 336, 336, 336, '3.0000', '45.0000', '0.00', '45.0000', '45.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-18 13:48:10', '2022-11-18 13:48:10'),
(336, 339, 337, 337, '1.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 13:11:32', '2022-11-24 13:11:32'),
(337, 340, 338, 338, '3.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 13:12:12', '2022-11-24 13:12:12'),
(338, 341, 339, 339, '6.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 13:13:15', '2022-11-24 13:13:15'),
(339, 342, 340, 340, '4.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 13:14:00', '2022-11-24 13:14:00'),
(340, 343, 341, 341, '1.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 13:17:03', '2022-11-24 13:17:03'),
(341, 344, 342, 342, '4.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 13:17:44', '2022-11-24 13:17:44'),
(342, 345, 343, 343, '6.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 13:18:29', '2022-11-24 13:18:29'),
(343, 346, 344, 344, '6.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 15:57:29', '2022-11-24 15:57:29'),
(344, 347, 345, 345, '3.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 15:58:26', '2022-11-24 15:58:26'),
(345, 348, 346, 346, '6.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 15:59:03', '2022-11-24 15:59:03'),
(346, 349, 347, 347, '1.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 15:59:49', '2022-11-24 15:59:49'),
(347, 350, 348, 348, '6.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:00:27', '2022-11-24 16:00:27'),
(348, 351, 349, 349, '6.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:01:04', '2022-11-24 16:01:04'),
(349, 352, 350, 350, '4.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:01:39', '2022-11-24 16:01:39'),
(350, 353, 351, 351, '4.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:02:16', '2022-11-24 16:02:16'),
(351, 354, 352, 352, '6.0000', '54.0000', '0.00', '54.0000', '54.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:02:55', '2022-11-24 16:02:55'),
(352, 355, 353, 353, '4.0000', '285.0000', '0.00', '285.0000', '285.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:03:38', '2022-11-24 16:03:38'),
(353, 356, 354, 354, '2.0000', '285.0000', '0.00', '285.0000', '285.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:04:25', '2022-11-24 16:04:25'),
(354, 357, 355, 355, '6.0000', '265.0000', '0.00', '265.0000', '265.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:05:13', '2022-11-24 16:05:13'),
(355, 358, 356, 356, '2.0000', '265.0000', '0.00', '265.0000', '265.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:05:51', '2022-11-24 16:05:51'),
(356, 359, 357, 357, '1.0000', '365.0000', '0.00', '365.0000', '365.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:06:47', '2022-11-24 16:06:47'),
(357, 360, 358, 358, '2.0000', '2.0000', '0.00', '2.0000', '2.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:07:40', '2022-11-24 16:07:40'),
(358, 361, 359, 359, '2.0000', '405.0000', '0.00', '405.0000', '405.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:08:23', '2022-11-24 16:08:23'),
(359, 362, 360, 360, '1.0000', '395.0000', '0.00', '395.0000', '395.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:09:01', '2022-11-24 16:09:01'),
(360, 363, 361, 361, '4.0000', '145.0000', '0.00', '145.0000', '145.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:09:46', '2022-11-24 16:09:46'),
(361, 364, 362, 362, '2.0000', '145.0000', '0.00', '145.0000', '145.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:10:27', '2022-11-24 16:10:27'),
(362, 365, 363, 363, '2.0000', '155.0000', '0.00', '155.0000', '155.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:11:03', '2022-11-24 16:11:03'),
(363, 366, 364, 364, '2.0000', '155.0000', '0.00', '155.0000', '155.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:11:41', '2022-11-24 16:11:41'),
(364, 367, 365, 365, '2.0000', '155.0000', '0.00', '155.0000', '155.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:12:19', '2022-11-24 16:12:19'),
(365, 368, 366, 366, '2.0000', '300.0000', '0.00', '300.0000', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:15:25', '2022-11-24 16:15:25'),
(366, 369, 367, 367, '1.0000', '265.0000', '0.00', '265.0000', '265.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:16:01', '2022-11-24 16:16:01'),
(367, 370, 368, 368, '1.0000', '475.0000', '0.00', '475.0000', '475.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:16:33', '2022-11-24 16:16:33'),
(368, 371, 369, 369, '2.0000', '475.0000', '0.00', '475.0000', '475.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:17:11', '2022-11-24 16:17:11'),
(369, 372, 370, 370, '1.0000', '475.0000', '0.00', '475.0000', '475.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:17:46', '2022-11-24 16:17:46'),
(370, 373, 371, 371, '2.0000', '475.0000', '0.00', '475.0000', '475.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:18:18', '2022-11-24 16:18:18'),
(371, 374, 372, 372, '2.0000', '475.0000', '0.00', '475.0000', '475.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:19:07', '2022-11-24 16:19:07'),
(372, 375, 373, 373, '2.0000', '125.0000', '0.00', '125.0000', '125.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-24 16:20:00', '2022-11-24 16:20:00'),
(374, 377, 375, 375, '4.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, '3.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-11-26 10:35:36', '2022-11-26 11:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int UNSIGNED NOT NULL,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int NOT NULL,
  `business_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 1, 1, '2022-07-13 11:14:34', '2022-07-13 11:14:34'),
(2, 'business_location', 1, 1, '2022-07-13 11:14:34', '2022-07-13 11:14:34'),
(3, 'username', 1, 1, '2022-11-16 18:23:39', '2022-11-16 18:23:39'),
(4, 'sell_payment', 11, 1, '2022-11-18 12:44:45', '2022-11-26 18:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_service_staff` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2022-07-13 11:14:33', '2022-07-13 11:14:33'),
(2, 'Cashier#1', 'web', 1, 0, 0, '2022-07-13 11:14:34', '2022-07-13 11:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(77, 2);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int NOT NULL,
  `warranty_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int DEFAULT NULL,
  `lot_no_line_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '3.4'),
(2, 'default_business_active_status', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED DEFAULT NULL,
  `res_table_id` int UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('received','pending','ordered','draft','final') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int UNSIGNED DEFAULT NULL,
  `customer_group_id` int DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_repeat_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT '0.0000',
  `rp_redeemed` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_notes` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Difference of rounded total and actual total',
  `final_total` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `expense_category_id` int UNSIGNED DEFAULT NULL,
  `expense_for` int UNSIGNED DEFAULT NULL,
  `commission_agent` int DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspend` tinyint(1) NOT NULL DEFAULT '0',
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int DEFAULT NULL,
  `return_parent_id` int DEFAULT NULL,
  `opening_stock_product_id` int DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `import_batch` int DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_1` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_2` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_3` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_4` text COLLATE utf8mb4_unicode_ci,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT '0',
  `rp_earned` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `order_addresses` text COLLATE utf8mb4_unicode_ci,
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int DEFAULT NULL,
  `invoice_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 20:47:10', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 20:47:10', '2022-11-13 20:47:10'),
(2, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:51:12', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 21:51:12', '2022-11-13 21:51:12'),
(3, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:56:25', '1440.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1440.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 21:56:25', '2022-11-13 21:56:25'),
(4, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:02:21', '1560.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1560.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:02:21', '2022-11-13 22:02:21'),
(5, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:17:10', '520.0800', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '520.0800', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:17:10', '2022-11-13 22:17:10'),
(6, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:18:59', '250.0200', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '250.0200', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:18:59', '2022-11-13 22:18:59'),
(7, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:20:26', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:20:26', '2022-11-13 22:20:26'),
(8, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:26:03', '330.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '330.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:26:03', '2022-11-13 22:26:03'),
(9, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:28:14', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:28:14', '2022-11-13 22:28:14'),
(10, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:29:55', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:29:55', '2022-11-13 22:29:55'),
(11, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:30:55', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:30:55', '2022-11-26 17:53:56'),
(12, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:34:45', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:34:45', '2022-11-16 18:14:26'),
(13, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:36:06', '390.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '390.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:36:06', '2022-11-13 22:36:06'),
(14, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:37:38', '420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 15, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:37:38', '2022-11-13 22:37:38'),
(15, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:38:51', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 16, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:38:51', '2022-11-13 22:38:51'),
(16, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:41:03', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:41:03', '2022-11-13 22:41:03'),
(17, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:43:20', '350.0400', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '350.0400', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 18, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:43:20', '2022-11-23 21:33:01'),
(18, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:44:57', '580.0800', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '580.0800', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:44:57', '2022-11-13 22:44:57'),
(19, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:45:49', '570.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '570.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:45:49', '2022-11-13 22:45:49'),
(20, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:46:56', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:46:56', '2022-11-18 16:48:05'),
(21, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:50:00', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:50:00', '2022-11-13 22:50:00'),
(22, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:56:31', '580.0800', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '580.0800', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 23, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:56:31', '2022-11-13 22:56:31'),
(23, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:57:34', '1080.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1080.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 24, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:57:34', '2022-11-13 22:57:34'),
(24, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:58:21', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:58:21', '2022-11-13 22:58:21'),
(25, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:59:33', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 26, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 22:59:33', '2022-11-13 22:59:33'),
(26, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:00:43', '540.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '540.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:00:43', '2022-11-13 23:00:43'),
(27, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:01:59', '1500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:01:59', '2022-11-13 23:01:59'),
(28, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:03:23', '1500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:03:23', '2022-11-13 23:03:23'),
(29, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:09:27', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 31, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:09:27', '2022-11-13 23:09:27'),
(30, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:11:17', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:11:17', '2022-11-13 23:11:17'),
(31, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:13:16', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:13:16', '2022-11-13 23:13:16'),
(32, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:14:11', '840.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '840.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 34, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:14:11', '2022-11-13 23:14:11'),
(33, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:15:21', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 35, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:15:21', '2022-11-13 23:15:21'),
(34, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:16:19', '540.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '540.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 36, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:16:19', '2022-11-13 23:16:19'),
(35, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:17:16', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 37, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:17:16', '2022-11-13 23:17:16'),
(36, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:18:03', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 38, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:18:03', '2022-11-13 23:18:03'),
(37, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:18:47', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 39, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:18:47', '2022-11-13 23:18:47'),
(38, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:23:36', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 40, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:23:36', '2022-11-13 23:23:36'),
(39, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:25:09', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 41, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:25:09', '2022-11-13 23:25:09'),
(40, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:26:12', '1260.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1260.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 42, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:26:12', '2022-11-13 23:26:12'),
(41, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:27:05', '540.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '540.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 43, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:27:05', '2022-11-13 23:27:05'),
(42, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:28:02', '1260.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1260.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 44, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:28:02', '2022-11-13 23:28:02'),
(43, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:29:02', '220.0800', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '220.0800', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 45, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:29:02', '2022-11-13 23:29:02'),
(44, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:29:53', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 46, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:29:53', '2022-11-13 23:29:53'),
(45, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:30:49', '1560.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1560.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 47, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:30:49', '2022-11-13 23:30:49'),
(46, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:32:04', '960.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '960.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 48, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:32:04', '2022-11-13 23:32:04'),
(47, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:32:56', '1080.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1080.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 49, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:32:56', '2022-11-13 23:34:10'),
(48, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:36:09', '1800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 50, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:36:09', '2022-11-13 23:36:09'),
(49, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:37:02', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 51, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:37:02', '2022-11-13 23:37:02'),
(50, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:38:10', '1260.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1260.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 52, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:38:10', '2022-11-13 23:38:10'),
(51, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:39:03', '840.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '840.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 53, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:39:03', '2022-11-13 23:39:03'),
(52, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:39:52', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 54, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:39:52', '2022-11-13 23:39:52'),
(53, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:40:46', '520.0800', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '520.0800', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 55, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:40:46', '2022-11-13 23:40:46'),
(54, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:41:55', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:41:55', '2022-11-13 23:41:55'),
(55, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:44:25', '1500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 57, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:44:25', '2022-11-13 23:44:25'),
(56, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:46:43', '2100.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 58, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:46:43', '2022-11-13 23:46:43'),
(57, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:47:52', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 59, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:47:52', '2022-11-13 23:47:52'),
(58, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:48:46', '270.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '270.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 60, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:48:46', '2022-11-13 23:48:46'),
(59, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:49:37', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 61, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:49:37', '2022-11-13 23:49:37'),
(60, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:51:01', '420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 62, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:51:01', '2022-11-13 23:51:01'),
(61, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:52:11', '330.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '330.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 63, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:52:11', '2022-11-13 23:52:11'),
(62, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:53:03', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 64, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:53:03', '2022-11-13 23:53:03'),
(63, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:54:21', '1140.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1140.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 65, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:54:21', '2022-11-13 23:54:21'),
(64, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:55:30', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 66, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:55:30', '2022-11-13 23:55:30'),
(65, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 23:57:23', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 67, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-13 23:57:23', '2022-11-13 23:57:23'),
(66, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:05:50', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 68, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:05:50', '2022-11-14 00:05:50'),
(67, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:06:58', '2610.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2610.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 69, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:06:58', '2022-11-14 00:21:45'),
(68, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:08:46', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 70, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:08:46', '2022-11-14 00:08:46'),
(69, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:09:38', '870.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '870.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 71, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:09:38', '2022-11-14 00:09:38'),
(70, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:10:34', '660.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '660.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 72, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:10:34', '2022-11-14 00:10:34'),
(71, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:11:23', '390.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '390.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 73, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:11:23', '2022-11-14 00:11:23'),
(72, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:14:56', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 74, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:14:56', '2022-11-14 00:14:56'),
(73, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:15:46', '750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 75, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:15:46', '2022-11-14 00:15:46'),
(74, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:17:13', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 76, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:17:13', '2022-11-14 00:17:13'),
(75, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:18:19', '1680.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1680.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 77, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:18:19', '2022-11-14 00:18:19'),
(76, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:19:19', '420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 78, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:19:19', '2022-11-14 00:19:19'),
(77, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:20:20', '340.0200', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '340.0200', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 79, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:20:20', '2022-11-14 00:20:20'),
(78, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:22:52', '1980.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1980.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 80, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:22:52', '2022-11-14 00:22:52'),
(79, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:23:44', '420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 81, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:23:44', '2022-11-14 00:23:44'),
(80, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:24:39', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 82, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:24:39', '2022-11-14 00:24:39'),
(81, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:25:31', '420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 83, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:25:31', '2022-11-14 00:25:31'),
(82, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:26:15', '540.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '540.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 84, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:26:15', '2022-11-14 00:26:15'),
(83, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:26:53', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 85, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:26:53', '2022-11-14 00:26:53'),
(84, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:27:42', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 86, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:27:42', '2022-11-14 00:27:42'),
(85, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:29:18', '570.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '570.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 87, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:29:18', '2022-11-14 00:29:18'),
(86, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:30:16', '570.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '570.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 88, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:30:16', '2022-11-14 00:30:16'),
(87, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:30:54', '270.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '270.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 89, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:30:54', '2022-11-14 00:30:54'),
(88, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:32:28', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 90, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:32:28', '2022-11-14 00:32:28'),
(89, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:33:30', '420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 91, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:33:30', '2022-11-14 00:33:30'),
(90, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:34:22', '330.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '330.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 92, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:34:22', '2022-11-14 00:34:22'),
(91, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:35:30', '960.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '960.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 93, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:35:30', '2022-11-14 00:35:30'),
(92, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:36:15', '4080.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4080.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 94, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:36:15', '2022-11-26 19:38:48'),
(93, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:36:57', '220.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '220.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 95, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:36:57', '2022-11-26 17:46:30'),
(94, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:37:48', '1080.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1080.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 96, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:37:48', '2022-11-14 00:37:48'),
(95, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:38:41', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 97, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:38:41', '2022-11-14 00:38:41'),
(96, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:39:29', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 98, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:39:29', '2022-11-14 00:39:29'),
(97, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:40:21', '3600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 99, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:40:21', '2022-11-16 18:06:42');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(98, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:41:11', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 100, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:41:11', '2022-11-14 00:41:11'),
(99, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:42:01', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 101, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:42:01', '2022-11-14 00:42:01'),
(100, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:42:48', '540.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '540.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 102, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:42:48', '2022-11-14 00:42:48'),
(101, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:43:36', '570.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '570.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 103, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:43:36', '2022-11-14 00:43:36'),
(102, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:44:51', '420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 104, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:44:51', '2022-11-14 00:44:51'),
(103, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:45:56', '240.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '240.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 105, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:45:56', '2022-11-14 00:45:56'),
(104, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:46:50', '390.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '390.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 106, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:46:50', '2022-11-14 00:46:50'),
(105, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 00:47:36', '570.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '570.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 107, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-14 00:47:36', '2022-11-14 00:47:36'),
(106, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 14:27:34', '1680.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1680.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 108, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 14:27:34', '2022-11-16 14:27:34'),
(107, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 14:28:47', '420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 109, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 14:28:47', '2022-11-16 14:28:47'),
(108, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 14:33:36', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 110, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 14:33:36', '2022-11-16 14:33:36'),
(109, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 14:35:18', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 111, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 14:35:18', '2022-11-16 14:35:18'),
(110, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 14:36:27', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 112, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 14:36:27', '2022-11-16 14:36:27'),
(111, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 14:37:59', '1080.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1080.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 113, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 14:37:59', '2022-11-16 14:37:59'),
(112, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 14:39:07', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 114, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 14:39:07', '2022-11-16 14:39:07'),
(113, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 14:46:31', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 115, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 14:46:31', '2022-11-16 14:52:53'),
(114, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 14:48:31', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 116, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 14:48:31', '2022-11-16 14:48:31'),
(115, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:04:14', '2016.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2016.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 117, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:04:14', '2022-11-16 15:07:03'),
(116, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:07:46', '1188.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1188.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 118, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:07:46', '2022-11-16 15:07:46'),
(117, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:10:19', '1080.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1080.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 119, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:10:19', '2022-11-16 15:10:19'),
(118, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:13:54', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 120, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:13:54', '2022-11-16 15:13:54'),
(119, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:14:44', '210.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '210.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 121, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:14:44', '2022-11-16 15:14:44'),
(120, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:15:39', '432.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '432.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 122, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:15:39', '2022-11-16 15:15:39'),
(121, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:19:13', '440.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '440.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 123, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:19:13', '2022-11-16 15:19:13'),
(122, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:19:59', '440.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '440.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 124, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:19:59', '2022-11-16 15:19:59'),
(123, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:21:09', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 125, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:21:09', '2022-11-16 15:21:09'),
(124, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:22:11', '420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 126, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:22:11', '2022-11-16 15:22:11'),
(125, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:23:58', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 127, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:23:58', '2022-11-16 15:23:58'),
(126, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:30:48', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 128, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:30:48', '2022-11-16 15:30:48'),
(127, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:31:44', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 129, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:31:44', '2022-11-16 15:31:44'),
(128, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:35:42', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 130, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:35:42', '2022-11-16 15:35:42'),
(129, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:36:31', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 131, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:36:31', '2022-11-16 15:36:31'),
(130, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:40:08', '1440.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1440.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 132, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:40:08', '2022-11-16 15:41:34'),
(131, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:43:59', '540.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '540.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 133, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:43:59', '2022-11-16 15:47:53'),
(132, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:45:50', '540.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '540.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 134, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:45:50', '2022-11-16 15:45:50'),
(133, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:49:18', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 135, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:49:18', '2022-11-16 15:49:18'),
(134, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:51:28', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 136, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:51:28', '2022-11-16 15:51:28'),
(135, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:53:26', '960.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '960.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 137, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:53:26', '2022-11-16 15:53:26'),
(136, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:55:14', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 138, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 15:55:14', '2022-11-16 15:55:14'),
(137, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:00:00', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 139, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:00:00', '2022-11-16 16:00:00'),
(138, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:00:34', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 140, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:00:34', '2022-11-16 16:00:34'),
(139, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:03:04', '792.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '792.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 141, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:03:04', '2022-11-16 16:05:02'),
(140, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:04:12', '144.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '144.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 142, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:04:12', '2022-11-16 16:04:12'),
(141, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:07:07', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 143, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:07:07', '2022-11-16 16:07:07'),
(142, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:09:00', '216.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '216.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 144, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:09:00', '2022-11-16 16:09:00'),
(143, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:13:27', '420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 145, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:13:27', '2022-11-16 16:13:27'),
(144, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:14:30', '420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 146, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:14:30', '2022-11-16 16:14:30'),
(145, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:16:23', '420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 147, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:16:23', '2022-11-16 16:16:23'),
(146, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:17:17', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 148, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:17:17', '2022-11-16 16:17:17'),
(147, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:19:37', '1200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 149, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:19:37', '2022-11-16 16:19:37'),
(148, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:20:41', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 150, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:20:41', '2022-11-16 16:20:41'),
(149, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:24:21', '420.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '420.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 151, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:24:21', '2022-11-16 16:24:21'),
(150, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:25:27', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 152, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:25:27', '2022-11-16 16:25:27'),
(151, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:26:46', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 153, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:26:46', '2022-11-16 16:26:46'),
(152, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:28:23', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 154, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:28:23', '2022-11-16 16:30:47'),
(153, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:29:49', '144.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '144.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 155, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:29:49', '2022-11-16 16:29:49'),
(154, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:31:30', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 156, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:31:30', '2022-11-16 16:31:30'),
(155, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:33:34', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 157, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:33:34', '2022-11-16 16:33:34'),
(156, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:34:16', '120.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 158, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:34:16', '2022-11-16 16:34:16'),
(157, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:48:31', '240.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '240.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 159, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:48:31', '2022-11-16 16:48:31'),
(158, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:49:45', '192.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '192.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 160, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:49:45', '2022-11-16 16:49:45'),
(159, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:50:29', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 161, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:50:29', '2022-11-16 16:50:29'),
(160, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:51:11', '96.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '96.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 162, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:51:11', '2022-11-16 16:51:11'),
(161, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:51:46', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 163, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:51:46', '2022-11-16 16:51:46'),
(162, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:56:59', '288.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '288.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 164, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:56:59', '2022-11-16 16:56:59'),
(163, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:58:02', '240.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '240.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 165, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 16:58:02', '2022-11-16 16:58:02'),
(164, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:01:23', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 166, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 17:01:23', '2022-11-16 17:01:23'),
(165, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:02:33', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 167, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 17:02:33', '2022-11-16 17:02:33'),
(166, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:03:09', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 168, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 17:03:09', '2022-11-16 17:03:09'),
(167, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:04:22', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 169, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 17:04:22', '2022-11-16 17:04:22'),
(168, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:06:47', '864.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '864.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 170, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 17:06:47', '2022-11-16 17:06:47'),
(169, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:11:35', '720.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '720.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 171, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 17:11:35', '2022-11-16 17:11:35'),
(170, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:13:32', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 172, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 17:13:32', '2022-11-16 17:13:32'),
(171, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:15:26', '480.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '480.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 173, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 17:15:26', '2022-11-16 17:15:26'),
(172, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:16:33', '1560.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1560.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 174, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 17:16:33', '2022-11-16 17:16:33'),
(173, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:20:44', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 175, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 17:20:44', '2022-11-16 17:20:44'),
(174, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:21:59', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 176, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 17:21:59', '2022-11-16 17:21:59'),
(175, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:31:53', '360.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '360.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 177, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 17:31:53', '2022-11-16 17:31:53'),
(176, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:33:30', '240.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '240.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 178, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 17:33:30', '2022-11-16 17:33:30'),
(177, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:35:26', '240.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '240.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 179, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 17:35:26', '2022-11-16 17:35:26'),
(178, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 17:36:05', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 180, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 17:36:05', '2022-11-16 17:36:05'),
(179, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 18:11:19', '180.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '180.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-16 18:11:19', '2022-11-16 18:11:19'),
(180, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 20:31:12', '54.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '54.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 181, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 20:31:12', '2022-11-17 20:31:12'),
(181, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 20:34:48', '162.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '162.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 182, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 20:34:48', '2022-11-17 20:34:48'),
(182, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 20:37:07', '324.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '324.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 183, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 20:37:07', '2022-11-17 20:37:07'),
(183, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 20:38:20', '216.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '216.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 184, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 20:38:20', '2022-11-17 20:38:20'),
(184, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 20:39:36', '54.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '54.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 185, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 20:39:36', '2022-11-17 20:39:36'),
(185, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 20:41:04', '216.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '216.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 186, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 20:41:04', '2022-11-17 20:41:04'),
(186, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 20:42:02', '324.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '324.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 187, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 20:42:02', '2022-11-17 20:42:02'),
(187, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 20:43:17', '324.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '324.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 188, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 20:43:17', '2022-11-17 20:43:17'),
(188, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 20:56:05', '162.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '162.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 189, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 20:56:05', '2022-11-17 20:56:05'),
(189, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:11:03', '324.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '324.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 190, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:11:03', '2022-11-17 21:11:03'),
(190, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:13:12', '54.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '54.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 191, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:13:12', '2022-11-17 21:13:12'),
(191, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:21:42', '324.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '324.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 192, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:21:42', '2022-11-17 21:21:42'),
(192, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:22:57', '324.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '324.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 193, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:22:57', '2022-11-17 21:22:57'),
(193, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:24:05', '216.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '216.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 194, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:24:05', '2022-11-17 21:24:05'),
(194, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:25:00', '216.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '216.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 195, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:25:00', '2022-11-17 21:25:00');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(195, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:27:55', '324.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '324.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 196, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:27:55', '2022-11-17 21:27:55'),
(196, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:30:51', '1140.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1140.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 197, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:30:51', '2022-11-17 21:32:33'),
(197, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:33:59', '570.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '570.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 198, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:33:59', '2022-11-17 21:33:59'),
(198, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:35:22', '1590.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1590.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 199, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:35:22', '2022-11-17 21:35:22'),
(199, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:36:18', '530.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '530.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 200, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:36:18', '2022-11-17 21:36:18'),
(200, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:37:25', '365.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '365.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 201, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:37:25', '2022-11-17 21:37:25'),
(201, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:38:43', '810.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '810.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 202, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:38:43', '2022-11-17 21:38:43'),
(202, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:39:40', '810.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '810.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 203, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:39:40', '2022-11-17 21:39:40'),
(203, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:40:40', '395.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '395.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 204, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:40:40', '2022-11-17 21:40:40'),
(204, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:42:10', '580.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '580.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 205, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:42:10', '2022-11-17 21:42:10'),
(205, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:57:06', '290.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '290.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 206, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:57:06', '2022-11-17 21:57:06'),
(206, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:58:22', '310.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '310.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 207, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:58:22', '2022-11-17 21:58:22'),
(207, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 21:59:59', '310.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '310.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 208, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 21:59:59', '2022-11-17 21:59:59'),
(208, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:01:08', '310.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '310.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 209, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 22:01:08', '2022-11-17 22:01:08'),
(209, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:02:01', '1040.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1040.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 210, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 22:02:01', '2022-11-17 22:02:01'),
(210, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:03:04', '520.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '520.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 212, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 22:03:04', '2022-11-17 22:03:04'),
(211, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:03:53', '1325.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1325.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 213, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 22:03:53', '2022-11-17 22:03:53'),
(212, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:04:53', '530.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '530.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 214, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 22:04:53', '2022-11-17 22:04:53'),
(213, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:05:51', '265.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '265.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 215, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 22:05:51', '2022-11-17 22:05:51'),
(214, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:06:53', '475.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '475.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 216, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 22:06:53', '2022-11-17 22:06:53'),
(215, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:07:36', '950.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '950.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 217, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 22:07:36', '2022-11-17 22:07:36'),
(216, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:08:19', '475.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '475.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 218, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 22:08:19', '2022-11-17 22:08:19'),
(217, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:09:12', '950.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '950.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 219, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 22:09:12', '2022-11-17 22:09:12'),
(218, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:10:21', '950.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '950.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 220, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 22:10:21', '2022-11-17 22:10:21'),
(219, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:11:15', '365.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '365.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 221, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 22:11:15', '2022-11-17 22:11:15'),
(220, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 22:12:15', '250.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 222, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-17 22:12:15', '2022-11-17 22:12:15'),
(221, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:32:30', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 223, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:32:30', '2022-11-18 09:32:30'),
(222, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:33:24', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 224, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:33:24', '2022-11-18 09:33:24'),
(223, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:34:17', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 225, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:34:17', '2022-11-18 09:34:17'),
(224, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:34:59', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 226, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:34:59', '2022-11-18 09:34:59'),
(225, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:35:42', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 227, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:35:42', '2022-11-18 09:35:42'),
(226, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:37:51', '1040.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1040.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 228, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:37:51', '2022-11-18 09:41:23'),
(227, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:38:59', '1040.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1040.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 229, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:38:59', '2022-11-18 09:38:59'),
(228, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:40:02', '520.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '520.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 230, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:40:02', '2022-11-18 09:40:02'),
(229, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:46:40', '550.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '550.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 231, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:46:40', '2022-11-18 09:46:40'),
(230, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:47:46', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 232, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:47:46', '2022-11-18 09:47:46'),
(231, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:49:44', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 233, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:49:45', '2022-11-18 09:49:45'),
(232, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:50:36', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 234, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:50:36', '2022-11-18 09:50:36'),
(233, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:51:32', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 235, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:51:32', '2022-11-18 09:51:32'),
(234, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:52:20', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 236, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:52:20', '2022-11-18 09:52:20'),
(235, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:53:03', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 237, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:53:03', '2022-11-18 09:53:03'),
(236, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:54:12', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 238, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:54:12', '2022-11-18 09:54:12'),
(237, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:54:59', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 239, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:54:59', '2022-11-18 09:54:59'),
(238, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:56:37', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 240, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:56:37', '2022-11-18 09:56:37'),
(239, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:57:22', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 241, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:57:22', '2022-11-18 09:57:22'),
(240, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:58:03', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 242, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:58:03', '2022-11-18 09:58:03'),
(241, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:59:45', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 243, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 09:59:45', '2022-11-18 09:59:45'),
(242, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:00:28', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 244, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:00:28', '2022-11-18 10:00:28'),
(243, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:01:25', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 245, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:01:25', '2022-11-18 10:01:25'),
(244, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:02:10', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 246, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:02:10', '2022-11-18 10:02:10'),
(245, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:03:00', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 247, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:03:00', '2022-11-18 10:03:00'),
(246, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:03:45', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 248, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:03:45', '2022-11-18 10:03:45'),
(247, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:07:40', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 249, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:07:40', '2022-11-18 10:07:40'),
(248, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:08:34', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 250, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:08:34', '2022-11-18 10:08:34'),
(249, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:10:09', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 251, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:10:09', '2022-11-18 10:10:09'),
(250, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:10:52', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 252, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:10:52', '2022-11-18 10:10:52'),
(251, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:11:25', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 253, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:11:25', '2022-11-18 10:11:25'),
(252, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:11:57', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 254, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:11:57', '2022-11-18 10:11:57'),
(253, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:12:49', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 255, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:12:49', '2022-11-18 10:12:49'),
(254, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:13:28', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 256, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:13:28', '2022-11-18 10:13:28'),
(255, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:14:03', '700.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '700.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 257, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:14:03', '2022-11-18 12:42:30'),
(256, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:14:34', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 258, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:14:34', '2022-11-18 10:14:34'),
(257, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:15:24', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 259, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:15:24', '2022-11-18 10:15:24'),
(258, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:16:02', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 260, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:16:02', '2022-11-18 10:16:02'),
(259, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:16:45', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 261, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:16:45', '2022-11-18 10:16:45'),
(260, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:17:17', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 262, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:17:17', '2022-11-18 10:17:17'),
(261, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:18:06', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 263, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:18:06', '2022-11-18 10:18:06'),
(262, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:18:41', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 264, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:18:41', '2022-11-18 10:18:41'),
(263, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:19:21', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 265, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:19:21', '2022-11-18 10:19:21'),
(264, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:19:59', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 266, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:19:59', '2022-11-18 10:19:59'),
(265, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:29:42', '2340.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2340.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 267, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:29:42', '2022-11-24 16:13:38'),
(266, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:30:24', '585.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '585.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 268, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:30:24', '2022-11-18 10:30:24'),
(267, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:31:13', '585.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '585.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 269, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:31:13', '2022-11-18 10:31:13'),
(268, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:32:15', '1170.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1170.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 270, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:32:15', '2022-11-24 16:14:11'),
(269, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:33:41', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 271, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:33:41', '2022-11-18 10:33:41'),
(270, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:34:09', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 272, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:34:09', '2022-11-18 10:34:09'),
(271, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:34:39', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 273, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:34:39', '2022-11-18 10:34:39'),
(272, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:35:09', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 274, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:35:09', '2022-11-18 10:35:09'),
(273, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:35:55', '780.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '780.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 275, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:35:55', '2022-11-18 10:35:55'),
(274, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:38:07', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 276, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:38:07', '2022-11-18 10:38:07'),
(275, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:38:42', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 277, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:38:42', '2022-11-18 10:38:42'),
(276, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:39:16', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 278, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:39:16', '2022-11-18 10:39:16'),
(277, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:39:43', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 279, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:39:43', '2022-11-18 10:39:43'),
(278, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:40:14', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 280, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:40:14', '2022-11-18 10:40:14'),
(279, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:41:55', '7500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '7500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 281, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:41:55', '2022-11-18 10:41:55'),
(280, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:43:44', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 282, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:43:44', '2022-11-18 10:43:44'),
(281, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:45:50', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 283, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:45:50', '2022-11-18 10:45:50'),
(282, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:48:45', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 284, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:48:45', '2022-11-18 10:48:45'),
(283, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:49:13', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 285, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:49:13', '2022-11-18 10:49:13'),
(284, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:50:45', '535.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '535.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 286, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:50:45', '2022-11-18 10:50:45'),
(285, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:51:12', '535.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '535.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 287, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:51:12', '2022-11-18 10:51:12'),
(286, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:51:48', '535.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '535.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 288, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:51:48', '2022-11-18 10:51:48'),
(287, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:52:38', '585.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '585.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 289, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:52:38', '2022-11-18 10:52:38'),
(288, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:53:03', '535.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '535.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 290, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:53:03', '2022-11-18 10:53:03'),
(289, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:54:01', '300.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 291, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:54:01', '2022-11-18 10:54:01'),
(290, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:54:26', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 292, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:54:26', '2022-11-18 10:54:26'),
(291, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:54:54', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 293, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:54:54', '2022-11-18 10:54:54');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(292, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:56:07', '1000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 294, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:56:07', '2022-11-18 10:57:12'),
(293, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:56:45', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 295, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:56:45', '2022-11-18 10:56:45'),
(294, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:59:55', '700.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '700.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 296, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 10:59:55', '2022-11-18 10:59:55'),
(295, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:01:15', '560.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '560.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 297, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:01:15', '2022-11-18 11:01:15'),
(296, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:01:49', '560.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '560.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 298, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:01:49', '2022-11-18 11:01:49'),
(297, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:02:21', '560.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '560.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 299, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:02:21', '2022-11-18 11:02:21'),
(298, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:03:34', '470.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '470.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 300, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:03:34', '2022-11-18 11:03:34'),
(299, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:03:58', '470.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '470.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 301, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:03:58', '2022-11-18 11:03:58'),
(300, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:04:50', '470.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '470.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 302, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:04:50', '2022-11-18 11:04:50'),
(301, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:06:41', '1.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 303, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:06:41', '2022-11-18 11:06:41'),
(302, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:08:26', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 304, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:08:26', '2022-11-18 11:08:26'),
(303, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:08:54', '450.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '450.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 305, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:08:54', '2022-11-18 11:08:54'),
(304, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:09:26', '470.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '470.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 306, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:09:26', '2022-11-18 11:09:26'),
(305, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:10:17', '470.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '470.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 307, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:10:17', '2022-11-18 11:10:17'),
(306, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:11:10', '470.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '470.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 308, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:11:10', '2022-11-18 11:11:10'),
(307, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:13:38', '405.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '405.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 309, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:13:38', '2022-11-18 11:15:03'),
(308, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:14:10', '270.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '270.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 310, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:14:10', '2022-11-18 11:14:10'),
(309, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:14:35', '135.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '135.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 311, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:14:35', '2022-11-18 11:14:35'),
(310, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:16:01', '170.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '170.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 312, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:16:01', '2022-11-18 11:16:01'),
(311, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:16:29', '170.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '170.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 313, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:16:29', '2022-11-18 11:16:29'),
(312, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:16:56', '340.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '340.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 314, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:16:56', '2022-11-18 11:16:56'),
(313, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:17:26', '170.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '170.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 315, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:17:26', '2022-11-18 11:17:26'),
(314, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:18:43', '3750.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3750.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 316, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:18:43', '2022-11-18 11:18:43'),
(315, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:20:15', '3195.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3195.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 317, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:20:15', '2022-11-18 11:20:15'),
(316, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:21:04', '3195.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '3195.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 318, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:21:04', '2022-11-18 11:21:04'),
(317, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:22:31', '430.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '430.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 319, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:22:31', '2022-11-18 11:22:31'),
(318, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:23:14', '1290.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1290.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 320, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:23:14', '2022-11-18 11:23:14'),
(319, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:25:19', '2400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '2400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 321, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:25:19', '2022-11-24 16:14:49'),
(320, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:26:05', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 322, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:26:05', '2022-11-18 11:26:05'),
(321, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:29:04', '1425.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1425.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 323, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:29:05', '2022-11-18 11:29:05'),
(322, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:29:50', '950.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '950.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 324, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:29:50', '2022-11-18 11:29:50'),
(323, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:31:15', '730.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '730.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 325, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:31:15', '2022-11-18 11:31:15'),
(324, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:31:36', '730.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '730.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 326, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:31:36', '2022-11-18 11:31:36'),
(325, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:32:06', '365.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '365.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 327, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:32:06', '2022-11-18 11:32:06'),
(326, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:36:20', '365.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '365.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 328, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:36:20', '2022-11-18 11:36:20'),
(327, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:37:12', '970.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '970.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 329, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:37:12', '2022-11-18 11:37:12'),
(328, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:37:46', '485.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '485.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 330, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:37:46', '2022-11-18 11:37:46'),
(329, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:38:13', '970.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '970.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 331, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:38:13', '2022-11-18 11:38:13'),
(330, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:39:18', '530.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '530.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 332, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:39:18', '2022-11-18 11:39:18'),
(331, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:39:48', '795.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '795.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 333, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:39:48', '2022-11-18 11:39:48'),
(332, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:42:17', '900.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 334, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:42:17', '2022-11-18 11:42:17'),
(333, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 11:43:17', '700.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '700.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 335, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 11:43:17', '2022-11-18 11:43:17'),
(334, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '0001', '', NULL, NULL, '2022-11-18 12:44:45', '65.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '65.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-11-18 12:44:45', '2022-11-18 12:44:45'),
(335, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2022-0002', '', NULL, NULL, '2022-11-18 13:38:47', '100.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-11-18 13:38:47', '2022-11-18 13:38:47'),
(336, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 13:48:10', '135.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '135.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 336, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 13:48:10', '2022-11-18 13:48:10'),
(337, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2022-0003', '', NULL, NULL, '2022-11-23 21:25:08', '1392.1800', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1392.1800', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(338, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2022-0004', '', NULL, NULL, '2022-11-23 21:36:02', '85.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '85.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-11-23 21:36:02', '2022-11-23 21:36:02'),
(339, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 13:11:32', '54.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '54.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 337, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 13:11:32', '2022-11-24 13:11:32'),
(340, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 13:12:12', '162.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '162.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 338, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 13:12:12', '2022-11-24 13:12:12'),
(341, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 13:13:15', '324.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '324.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 339, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 13:13:15', '2022-11-24 13:13:15'),
(342, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 13:13:59', '216.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '216.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 340, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 13:14:00', '2022-11-24 13:14:00'),
(343, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 13:17:03', '54.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '54.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 341, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 13:17:03', '2022-11-24 13:17:03'),
(344, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 13:17:44', '216.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '216.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 342, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 13:17:44', '2022-11-24 13:17:44'),
(345, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 13:18:29', '324.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '324.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 343, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 13:18:29', '2022-11-24 13:18:29'),
(346, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:57:29', '324.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '324.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 344, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 15:57:29', '2022-11-24 15:57:29'),
(347, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:58:26', '162.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '162.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 345, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 15:58:26', '2022-11-24 15:58:26'),
(348, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:59:03', '324.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '324.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 346, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 15:59:03', '2022-11-24 15:59:03'),
(349, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 15:59:49', '54.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '54.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 347, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 15:59:49', '2022-11-24 15:59:49'),
(350, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:00:27', '324.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '324.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 348, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:00:27', '2022-11-24 16:00:27'),
(351, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:01:04', '324.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '324.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 349, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:01:04', '2022-11-24 16:01:04'),
(352, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:01:39', '216.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '216.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 350, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:01:39', '2022-11-24 16:01:39'),
(353, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:02:16', '216.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '216.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 351, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:02:16', '2022-11-24 16:02:16'),
(354, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:02:55', '324.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '324.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 352, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:02:55', '2022-11-24 16:02:55'),
(355, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:03:38', '1140.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1140.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 353, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:03:38', '2022-11-24 16:03:38'),
(356, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:04:25', '570.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '570.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 354, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:04:25', '2022-11-24 16:04:25'),
(357, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:05:13', '1590.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1590.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 355, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:05:13', '2022-11-24 16:05:13'),
(358, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:05:51', '530.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '530.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 356, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:05:51', '2022-11-24 16:05:51'),
(359, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:06:47', '365.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '365.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 357, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:06:47', '2022-11-24 16:06:47'),
(360, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:07:40', '4.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '4.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 358, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:07:40', '2022-11-24 16:07:40'),
(361, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:08:23', '810.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '810.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 359, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:08:23', '2022-11-24 16:08:23'),
(362, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:09:01', '395.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '395.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 360, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:09:01', '2022-11-24 16:09:01'),
(363, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:09:46', '580.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '580.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 361, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:09:46', '2022-11-24 16:09:46'),
(364, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:10:27', '290.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '290.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 362, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:10:27', '2022-11-24 16:10:27'),
(365, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:11:03', '310.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '310.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 363, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:11:03', '2022-11-24 16:11:03'),
(366, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:11:41', '310.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '310.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 364, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:11:41', '2022-11-24 16:11:41'),
(367, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:12:19', '310.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '310.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 365, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:12:19', '2022-11-24 16:12:19'),
(368, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:15:25', '600.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 366, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:15:25', '2022-11-24 16:15:25'),
(369, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:16:01', '265.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '265.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 367, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:16:01', '2022-11-24 16:16:01'),
(370, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:16:33', '475.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '475.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 368, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:16:33', '2022-11-24 16:16:33'),
(371, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:17:11', '950.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '950.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 369, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:17:11', '2022-11-24 16:17:11'),
(372, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:17:46', '475.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '475.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 370, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:17:46', '2022-11-24 16:17:46'),
(373, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:18:18', '950.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '950.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 371, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:18:18', '2022-11-24 16:18:18'),
(374, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:19:07', '950.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '950.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 372, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:19:07', '2022-11-24 16:19:07'),
(375, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 16:20:00', '250.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 373, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-24 16:20:00', '2022-11-24 16:20:00'),
(376, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 09:09:20', '20.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '20.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 374, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-26 09:09:20', '2022-11-26 09:09:20'),
(377, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 10:35:36', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 375, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-26 10:35:36', '2022-11-26 11:24:23'),
(378, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2022-0005', '', NULL, NULL, '2022-11-26 10:46:06', '250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-11-26 10:46:06', '2022-11-26 10:46:06'),
(379, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2022-0006', '', NULL, NULL, '2022-11-26 10:47:23', '250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-11-26 10:47:23', '2022-11-26 10:47:23'),
(380, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2022-0007', '', NULL, NULL, '2022-11-26 11:25:15', '250.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '250.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-11-26 11:25:15', '2022-11-26 11:25:15'),
(381, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2022-0008', '', NULL, NULL, '2022-11-26 15:14:51', '215.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '215.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-11-26 15:14:51', '2022-11-26 15:14:51'),
(382, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2022-0009', '', NULL, NULL, '2022-11-26 17:59:54', '200.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-11-26 17:59:54', '2022-11-26 17:59:54'),
(383, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2022-0010', '', NULL, NULL, '2022-11-26 18:23:50', '200.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-11-26 18:23:50', '2022-11-26 18:23:50'),
(384, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', 0, 'paid', NULL, 1, NULL, '2022-0011', '', NULL, NULL, '2022-11-26 18:39:54', '465.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '465.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-11-26 18:39:54', '2022-11-26 18:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED DEFAULT NULL,
  `business_id` int DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `payment_for` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(1, 334, 1, 0, '65.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 12:44:45', 1, 1, NULL, NULL, NULL, 'SP2022/0001', NULL, '2022-11-18 12:44:45', '2022-11-18 12:44:45'),
(2, 335, 1, 0, '100.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-18 13:38:47', 1, 1, NULL, NULL, NULL, 'SP2022/0002', NULL, '2022-11-18 13:38:47', '2022-11-18 13:38:47'),
(3, 337, 1, 0, '1392.1800', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-23 21:25:08', 1, 1, NULL, NULL, NULL, 'SP2022/0003', NULL, '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(4, 338, 1, 0, '85.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-23 21:36:02', 1, 1, NULL, NULL, NULL, 'SP2022/0004', NULL, '2022-11-23 21:36:02', '2022-11-23 21:36:02'),
(5, 378, 1, 0, '250.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-26 10:46:06', 1, 1, NULL, NULL, NULL, 'SP2022/0005', NULL, '2022-11-26 10:46:06', '2022-11-26 10:46:06'),
(6, 379, 1, 0, '250.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-26 10:47:23', 1, 1, NULL, NULL, NULL, 'SP2022/0006', NULL, '2022-11-26 10:47:23', '2022-11-26 10:47:23'),
(7, 380, 1, 0, '250.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-26 11:25:15', 1, 1, NULL, NULL, NULL, 'SP2022/0007', NULL, '2022-11-26 11:25:15', '2022-11-26 11:25:15'),
(8, 381, 1, 0, '215.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-26 15:14:51', 1, 1, NULL, NULL, NULL, 'SP2022/0008', NULL, '2022-11-26 15:14:51', '2022-11-26 15:14:51'),
(9, 382, 1, 0, '200.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-26 17:59:54', 1, 1, NULL, NULL, NULL, 'SP2022/0009', NULL, '2022-11-26 17:59:54', '2022-11-26 17:59:54'),
(10, 383, 1, 0, '200.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-26 18:23:50', 1, 1, NULL, NULL, NULL, 'SP2022/0010', NULL, '2022-11-26 18:23:50', '2022-11-26 18:23:50'),
(11, 384, 1, 0, '465.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-26 18:39:54', 1, 1, NULL, NULL, NULL, 'SP2022/0011', NULL, '2022-11-26 18:39:54', '2022-11-26 18:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int UNSIGNED DEFAULT NULL,
  `discount_id` int DEFAULT NULL,
  `lot_no_line_id` int DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci,
  `res_service_staff_id` int DEFAULT NULL,
  `res_line_order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int DEFAULT NULL,
  `children_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 334, 257, 257, '1.0000', '0.0000', '65.0000', '65.0000', 'fixed', '0.0000', '65.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-18 12:44:45', '2022-11-18 12:44:45'),
(2, 335, 117, 117, '2.0000', '0.0000', '50.0000', '50.0000', 'fixed', '0.0000', '50.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-18 13:38:47', '2022-11-18 13:38:47'),
(3, 337, 1, 1, '2.0000', '0.0000', '100.0000', '100.0000', 'fixed', '0.0000', '100.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(4, 337, 12, 12, '1.0000', '0.0000', '188.0000', '188.0000', 'fixed', '0.0000', '188.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(5, 337, 2, 2, '2.0000', '0.0000', '100.0000', '100.0000', 'fixed', '0.0000', '100.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(6, 337, 24, 24, '1.0000', '0.0000', '112.5000', '112.5000', 'fixed', '0.0000', '112.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(7, 337, 42, 42, '2.0000', '0.0000', '262.5000', '262.5000', 'fixed', '0.0000', '262.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(8, 337, 6, 6, '1.0000', '0.0000', '54.1800', '54.1800', 'fixed', '0.0000', '54.1800', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(9, 337, 102, 102, '1.0000', '0.0000', '112.5000', '112.5000', 'fixed', '0.0000', '112.5000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(10, 338, 18, 18, '1.0000', '0.0000', '35.0000', '35.0000', 'fixed', '0.0000', '35.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-23 21:36:02', '2022-11-23 21:36:02'),
(11, 338, 6, 6, '1.0000', '0.0000', '50.0000', '50.0000', 'fixed', '0.0000', '50.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-23 21:36:02', '2022-11-23 21:36:02'),
(12, 378, 375, 375, '1.0000', '0.0000', '250.0000', '250.0000', 'fixed', '0.0000', '250.0000', '0.0000', NULL, NULL, NULL, 'oraimo', NULL, NULL, NULL, '', NULL, '2022-11-26 10:46:06', '2022-11-26 10:46:06'),
(13, 379, 375, 375, '1.0000', '0.0000', '250.0000', '250.0000', 'fixed', '0.0000', '250.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-26 10:47:23', '2022-11-26 10:47:23'),
(14, 380, 375, 375, '1.0000', '0.0000', '250.0000', '250.0000', 'fixed', '0.0000', '250.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-26 11:25:15', '2022-11-26 11:25:15'),
(15, 381, 1, 1, '1.0000', '0.0000', '100.0000', '100.0000', 'fixed', '0.0000', '100.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-26 15:14:51', '2022-11-26 15:14:51'),
(16, 381, 102, 102, '1.0000', '0.0000', '115.0000', '115.0000', 'fixed', '0.0000', '115.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-26 15:14:51', '2022-11-26 15:14:51'),
(17, 382, 310, 310, '1.0000', '0.0000', '200.0000', '200.0000', 'fixed', '0.0000', '200.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-26 17:59:54', '2022-11-26 17:59:54'),
(18, 383, 131, 131, '1.0000', '0.0000', '200.0000', '200.0000', 'fixed', '0.0000', '200.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-26 18:23:50', '2022-11-26 18:23:50'),
(19, 384, 143, 143, '1.0000', '0.0000', '75.0000', '75.0000', 'fixed', '0.0000', '75.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-26 18:39:54', '2022-11-26 18:39:54'),
(20, 384, 96, 96, '1.0000', '0.0000', '110.0000', '110.0000', 'fixed', '0.0000', '110.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-26 18:39:54', '2022-11-26 18:39:54'),
(21, 384, 5, 5, '1.0000', '0.0000', '165.0000', '165.0000', 'fixed', '0.0000', '165.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-26 18:39:54', '2022-11-26 18:39:54'),
(22, 384, 43, 43, '1.0000', '0.0000', '115.0000', '115.0000', 'fixed', '0.0000', '115.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2022-11-26 18:39:54', '2022-11-26 18:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int UNSIGNED NOT NULL,
  `sell_line_id` int UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 256, '1.0000', '0.0000', '2022-11-18 12:44:45', '2022-11-18 12:44:45'),
(2, 2, NULL, 116, '2.0000', '0.0000', '2022-11-18 13:38:47', '2022-11-18 13:38:47'),
(3, 3, NULL, 1, '2.0000', '0.0000', '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(4, 4, NULL, 11, '1.0000', '0.0000', '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(5, 5, NULL, 2, '2.0000', '0.0000', '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(6, 6, NULL, 23, '1.0000', '0.0000', '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(7, 7, NULL, 40, '2.0000', '0.0000', '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(8, 8, NULL, 5, '1.0000', '0.0000', '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(9, 9, NULL, 100, '1.0000', '0.0000', '2022-11-23 21:25:08', '2022-11-23 21:25:08'),
(10, 10, NULL, 17, '1.0000', '0.0000', '2022-11-23 21:36:02', '2022-11-23 21:36:02'),
(11, 11, NULL, 5, '1.0000', '0.0000', '2022-11-23 21:36:02', '2022-11-23 21:36:02'),
(12, 12, NULL, 374, '1.0000', '0.0000', '2022-11-26 10:46:06', '2022-11-26 10:46:06'),
(13, 13, NULL, 374, '1.0000', '0.0000', '2022-11-26 10:47:23', '2022-11-26 10:47:23'),
(14, 14, NULL, 374, '1.0000', '0.0000', '2022-11-26 11:25:15', '2022-11-26 11:25:15'),
(15, 15, NULL, 1, '1.0000', '0.0000', '2022-11-26 15:14:51', '2022-11-26 15:14:51'),
(16, 16, NULL, 100, '1.0000', '0.0000', '2022-11-26 15:14:51', '2022-11-26 15:14:51'),
(17, 17, NULL, 309, '1.0000', '0.0000', '2022-11-26 17:59:54', '2022-11-26 17:59:54'),
(18, 18, NULL, 130, '1.0000', '0.0000', '2022-11-26 18:23:50', '2022-11-26 18:23:50'),
(19, 19, NULL, 142, '1.0000', '0.0000', '2022-11-26 18:39:54', '2022-11-26 18:39:54'),
(20, 20, NULL, 94, '1.0000', '0.0000', '2022-11-26 18:39:54', '2022-11-26 18:39:54'),
(21, 21, NULL, 4, '1.0000', '0.0000', '2022-11-26 18:39:54', '2022-11-26 18:39:54'),
(22, 22, NULL, 41, '1.0000', '0.0000', '2022-11-26 18:39:54', '2022-11-26 18:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int NOT NULL,
  `location_price_group` text COLLATE utf8mb4_unicode_ci,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int UNSIGNED NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, NULL, NULL, 1, NULL, '2022-07-13 11:14:34', '2022-07-13 11:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int UNSIGNED DEFAULT NULL,
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT '0',
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `selected_contacts` tinyint(1) NOT NULL DEFAULT '0',
  `dob` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci,
  `current_address` text COLLATE utf8mb4_unicode_ci,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext COLLATE utf8mb4_unicode_ci,
  `id_proof_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `max_sales_discount_percent`, `allow_login`, `status`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'user', 'Ms', 'Dorcas', 'Mukungua', 'softglow', 'softglow389@gmail.com', '$2y$10$y55OfpUiDupBz169jOBAfO7corTXqJAfXv5oibAyauVx5goTZb2wC', 'en', NULL, NULL, 'LH5f8VUDCdDgKJYG13B6J5ZBZu2kiehS2vhN8cE4LEXjLNBM49XxVD3w7q0n', 1, NULL, 1, 'active', 0, '0.00', 0, NULL, 'female', 'unmarried', 'O+', '+254705141355', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-07-13 11:14:33', '2022-11-13 20:35:53'),
(2, 'user', NULL, 'anne', NULL, 'annem', 'anne@gmail.com', '$2y$10$nJBJh9Sq9ZJvnWWtwD4jvuO2pCgsbT5cFo7LZME1aQ7I6BuILit6e', 'en', NULL, NULL, NULL, 1, NULL, 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-11-16 18:23:39', '2022-11-16 18:23:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `contact_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int UNSIGNED NOT NULL,
  `variation_value_id` int DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `profit_percent` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text COLLATE utf8mb4_unicode_ci COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(1, 'DUMMY', 1, '0001', 1, NULL, '75.0000', '75.0000', '33.3300', '100.0000', '100.0000', '2022-11-13 20:47:03', '2022-11-23 21:42:53', NULL, '[]'),
(2, 'DUMMY', 2, '0002', 2, NULL, '75.0000', '75.0000', '33.3300', '100.0000', '100.0000', '2022-11-13 21:49:50', '2022-11-23 21:44:25', NULL, '[]'),
(4, 'DUMMY', 4, '0004', 4, NULL, '120.0000', '120.0000', '25.0000', '150.0000', '150.0000', '2022-11-13 21:56:14', '2022-11-13 21:56:14', NULL, '[]'),
(5, 'DUMMY', 5, '0005', 5, NULL, '130.0000', '130.0000', '26.9200', '165.0000', '165.0000', '2022-11-13 22:02:08', '2022-11-26 18:55:06', NULL, '[]'),
(6, 'DUMMY', 6, '0006', 6, NULL, '43.3400', '43.3400', '26.9000', '55.0000', '55.0000', '2022-11-13 22:16:59', '2022-11-23 21:43:37', NULL, '[]'),
(7, 'DUMMY', 7, '0007', 7, NULL, '41.6700', '41.6700', '25.0000', '52.0900', '52.0900', '2022-11-13 22:18:45', '2022-11-13 22:18:45', NULL, '[]'),
(8, 'DUMMY', 8, '0008', 8, NULL, '30.0000', '30.0000', '25.0000', '37.5000', '37.5000', '2022-11-13 22:20:17', '2022-11-13 22:20:17', NULL, '[]'),
(9, 'DUMMY', 9, '0009', 9, NULL, '55.0000', '55.0000', '25.0000', '68.7500', '68.7500', '2022-11-13 22:25:45', '2022-11-13 22:25:45', NULL, '[]'),
(10, 'DUMMY', 10, '0010', 10, NULL, '75.0000', '75.0000', '25.0000', '93.7500', '93.7500', '2022-11-13 22:27:57', '2022-11-13 22:27:57', NULL, '[]'),
(11, 'DUMMY', 11, '0011', 11, NULL, '30.0000', '30.0000', '25.0000', '37.5000', '37.5000', '2022-11-13 22:29:44', '2022-11-13 22:29:44', NULL, '[]'),
(12, 'DUMMY', 12, '0012', 12, NULL, '150.0000', '150.0000', '66.6700', '250.0000', '250.0000', '2022-11-13 22:30:43', '2022-11-26 17:54:48', NULL, '[]'),
(13, 'DUMMY', 13, '0013', 13, NULL, '360.0000', '360.0000', '25.0000', '450.0000', '450.0000', '2022-11-13 22:34:35', '2022-11-16 18:13:21', NULL, '[]'),
(14, 'DUMMY', 14, '0014', 14, NULL, '32.5000', '32.5000', '25.0000', '40.6300', '40.6300', '2022-11-13 22:35:54', '2022-11-13 22:35:54', NULL, '[]'),
(15, 'DUMMY', 15, '0015', 15, NULL, '70.0000', '70.0000', '25.0000', '87.5000', '87.5000', '2022-11-13 22:37:28', '2022-11-13 22:39:44', NULL, '[]'),
(16, 'DUMMY', 16, '0016', 16, NULL, '65.0000', '65.0000', '25.0000', '81.2500', '81.2500', '2022-11-13 22:38:39', '2022-11-13 22:38:39', NULL, '[]'),
(17, 'DUMMY', 17, '0017', 17, NULL, '120.0000', '120.0000', '25.0000', '150.0000', '150.0000', '2022-11-13 22:40:53', '2022-11-13 22:40:53', NULL, '[]'),
(18, 'DUMMY', 18, '0018', 18, NULL, '30.0000', '30.0000', '25.0000', '37.5000', '37.5000', '2022-11-13 22:43:01', '2022-11-23 21:34:40', NULL, '[]'),
(19, 'DUMMY', 19, '0019', 19, NULL, '48.3400', '48.3400', '25.0000', '60.4300', '60.4300', '2022-11-13 22:44:45', '2022-11-13 22:44:45', NULL, '[]'),
(20, 'DUMMY', 20, '0020', 20, NULL, '95.0000', '95.0000', '21.0500', '115.0000', '115.0000', '2022-11-13 22:45:42', '2022-11-23 21:48:11', NULL, '[]'),
(21, 'DUMMY', 21, '0021', 21, NULL, '25.0000', '25.0000', '25.0000', '31.2500', '31.2500', '2022-11-13 22:46:42', '2022-11-18 16:47:50', NULL, '[]'),
(22, 'DUMMY', 22, '0022', 22, NULL, '30.0000', '30.0000', '25.0000', '37.5000', '37.5000', '2022-11-13 22:49:53', '2022-11-13 22:49:53', NULL, '[]'),
(23, 'DUMMY', 23, '0023', 23, NULL, '48.3400', '48.3400', '25.0000', '60.4300', '60.4300', '2022-11-13 22:56:17', '2022-11-13 22:56:17', NULL, '[]'),
(24, 'DUMMY', 24, '0024', 24, NULL, '90.0000', '90.0000', '25.0000', '112.5000', '112.5000', '2022-11-13 22:57:24', '2022-11-13 22:57:24', NULL, '[]'),
(25, 'DUMMY', 25, '0025', 25, NULL, '40.0000', '40.0000', '25.0000', '50.0000', '50.0000', '2022-11-13 22:58:12', '2022-11-13 22:58:12', NULL, '[]'),
(26, 'DUMMY', 26, '0026', 26, NULL, '65.0000', '65.0000', '25.0000', '81.2500', '81.2500', '2022-11-13 22:59:26', '2022-11-13 22:59:26', NULL, '[]'),
(27, 'DUMMY', 27, '0027', 27, NULL, '45.0000', '45.0000', '25.0000', '56.2500', '56.2500', '2022-11-13 23:00:35', '2022-11-13 23:00:35', NULL, '[]'),
(28, 'DUMMY', 28, '0028', 28, NULL, '250.0000', '250.0000', '25.0000', '312.5000', '312.5000', '2022-11-13 23:01:47', '2022-11-13 23:01:47', NULL, '[]'),
(29, 'DUMMY', 29, '0029', 29, NULL, '250.0000', '250.0000', '25.0000', '312.5000', '312.5000', '2022-11-13 23:03:10', '2022-11-13 23:03:10', NULL, '[]'),
(30, 'DUMMY', 30, '0030', 30, NULL, '15.0000', '15.0000', '25.0000', '18.7500', '18.7500', '2022-11-13 23:09:10', '2022-11-16 18:10:58', NULL, '[]'),
(31, 'DUMMY', 31, '0031', 31, NULL, '15.0000', '15.0000', '25.0000', '18.7500', '18.7500', '2022-11-13 23:09:12', '2022-11-13 23:09:12', NULL, '[]'),
(32, 'DUMMY', 32, '0032', 32, NULL, '130.0000', '130.0000', '25.0000', '162.5000', '162.5000', '2022-11-13 23:11:03', '2022-11-13 23:11:03', NULL, '[]'),
(33, 'DUMMY', 33, '0033', 33, NULL, '130.0000', '130.0000', '25.0000', '162.5000', '162.5000', '2022-11-13 23:13:09', '2022-11-13 23:13:09', NULL, '[]'),
(34, 'DUMMY', 34, '0034', 34, NULL, '70.0000', '70.0000', '25.0000', '87.5000', '87.5000', '2022-11-13 23:14:02', '2022-11-13 23:14:02', NULL, '[]'),
(35, 'DUMMY', 35, '0035', 35, NULL, '40.0000', '40.0000', '25.0000', '50.0000', '50.0000', '2022-11-13 23:15:12', '2022-11-13 23:15:12', NULL, '[]'),
(36, 'DUMMY', 36, '0036', 36, NULL, '45.0000', '45.0000', '25.0000', '56.2500', '56.2500', '2022-11-13 23:16:10', '2022-11-13 23:16:10', NULL, '[]'),
(37, 'DUMMY', 37, '0037', 37, NULL, '120.0000', '120.0000', '25.0000', '150.0000', '150.0000', '2022-11-13 23:17:05', '2022-11-13 23:17:05', NULL, '[]'),
(38, 'DUMMY', 38, '0038', 38, NULL, '120.0000', '120.0000', '25.0000', '150.0000', '150.0000', '2022-11-13 23:17:54', '2022-11-13 23:17:54', NULL, '[]'),
(39, 'DUMMY', 39, '0039', 39, NULL, '130.0000', '130.0000', '25.0000', '162.5000', '162.5000', '2022-11-13 23:18:41', '2022-11-13 23:18:41', NULL, '[]'),
(40, 'DUMMY', 40, '0040', 40, NULL, '120.0000', '120.0000', '25.0000', '150.0000', '150.0000', '2022-11-13 23:23:27', '2022-11-13 23:23:27', NULL, '[]'),
(41, 'DUMMY', 41, '0041', 41, NULL, '80.0000', '80.0000', '25.0000', '100.0000', '100.0000', '2022-11-13 23:25:01', '2022-11-13 23:25:01', NULL, '[]'),
(42, 'DUMMY', 42, '0042', 42, NULL, '210.0000', '210.0000', '25.0000', '262.5000', '262.5000', '2022-11-13 23:26:02', '2022-11-13 23:26:02', NULL, '[]'),
(43, 'DUMMY', 43, '0043', 43, NULL, '90.0000', '90.0000', '27.7800', '115.0000', '115.0000', '2022-11-13 23:26:56', '2022-11-26 18:57:19', NULL, '[]'),
(44, 'DUMMY', 44, '0044', 44, NULL, '210.0000', '210.0000', '25.0000', '262.5000', '262.5000', '2022-11-13 23:27:54', '2022-11-13 23:27:54', NULL, '[]'),
(45, 'DUMMY', 45, '0045', 45, NULL, '18.3400', '18.3400', '25.0000', '22.9300', '22.9300', '2022-11-13 23:28:56', '2022-11-13 23:28:56', NULL, '[]'),
(46, 'DUMMY', 46, '0046', 46, NULL, '100.0000', '100.0000', '25.0000', '125.0000', '125.0000', '2022-11-13 23:29:47', '2022-11-13 23:29:47', NULL, '[]'),
(47, 'DUMMY', 47, '0047', 47, NULL, '260.0000', '260.0000', '25.0000', '325.0000', '325.0000', '2022-11-13 23:30:42', '2022-11-13 23:30:42', NULL, '[]'),
(48, 'DUMMY', 48, '0048', 48, NULL, '160.0000', '160.0000', '25.0000', '200.0000', '200.0000', '2022-11-13 23:31:55', '2022-11-13 23:31:55', NULL, '[]'),
(49, 'DUMMY', 49, '0049', 49, NULL, '80.0000', '80.0000', '25.0000', '100.0000', '100.0000', '2022-11-13 23:32:49', '2022-11-13 23:34:02', NULL, '[]'),
(50, 'DUMMY', 50, '0050', 50, NULL, '150.0000', '150.0000', '25.0000', '187.5000', '187.5000', '2022-11-13 23:35:47', '2022-11-13 23:35:47', NULL, '[]'),
(51, 'DUMMY', 51, '0051', 51, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-13 23:36:57', '2022-11-13 23:36:57', NULL, '[]'),
(52, 'DUMMY', 52, '0052', 52, NULL, '35.0000', '35.0000', '25.0000', '43.7500', '43.7500', '2022-11-13 23:38:01', '2022-11-13 23:38:01', NULL, '[]'),
(53, 'DUMMY', 53, '0053', 53, NULL, '140.0000', '140.0000', '25.0000', '175.0000', '175.0000', '2022-11-13 23:38:56', '2022-11-13 23:38:56', NULL, '[]'),
(54, 'DUMMY', 54, '0054', 54, NULL, '250.0000', '250.0000', '25.0000', '312.5000', '312.5000', '2022-11-13 23:39:40', '2022-11-13 23:39:40', NULL, '[]'),
(55, 'DUMMY', 55, '0055', 55, NULL, '43.3400', '43.3400', '25.0000', '54.1800', '54.1800', '2022-11-13 23:40:38', '2022-11-13 23:40:38', NULL, '[]'),
(56, 'DUMMY', 56, '0056', 56, NULL, '130.0000', '130.0000', '25.0000', '162.5000', '162.5000', '2022-11-13 23:41:43', '2022-11-13 23:41:43', NULL, '[]'),
(57, 'DUMMY', 57, '0057', 57, NULL, '250.0000', '250.0000', '25.0000', '312.5000', '312.5000', '2022-11-13 23:44:17', '2022-11-13 23:44:17', NULL, '[]'),
(58, 'DUMMY', 58, '0058', 58, NULL, '350.0000', '350.0000', '25.0000', '437.5000', '437.5000', '2022-11-13 23:46:34', '2022-11-13 23:46:34', NULL, '[]'),
(59, 'DUMMY', 59, '0059', 59, NULL, '75.0000', '75.0000', '25.0000', '93.7500', '93.7500', '2022-11-13 23:47:46', '2022-11-13 23:47:46', NULL, '[]'),
(60, 'DUMMY', 60, '0060', 60, NULL, '45.0000', '45.0000', '25.0000', '56.2500', '56.2500', '2022-11-13 23:48:33', '2022-11-13 23:48:33', NULL, '[]'),
(61, 'DUMMY', 61, '0061', 61, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2022-11-13 23:49:30', '2022-11-13 23:49:30', NULL, '[]'),
(62, 'DUMMY', 62, '0062', 62, NULL, '35.0000', '35.0000', '25.0000', '43.7500', '43.7500', '2022-11-13 23:50:55', '2022-11-13 23:50:55', NULL, '[]'),
(63, 'DUMMY', 63, '0063', 63, NULL, '55.0000', '55.0000', '25.0000', '68.7500', '68.7500', '2022-11-13 23:52:05', '2022-11-13 23:52:05', NULL, '[]'),
(64, 'DUMMY', 64, '0064', 64, NULL, '100.0000', '100.0000', '25.0000', '125.0000', '125.0000', '2022-11-13 23:52:57', '2022-11-13 23:52:57', NULL, '[]'),
(65, 'DUMMY', 65, '0065', 65, NULL, '190.0000', '190.0000', '25.0000', '237.5000', '237.5000', '2022-11-13 23:54:10', '2022-11-13 23:54:10', NULL, '[]'),
(66, 'DUMMY', 66, '0066', 66, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2022-11-13 23:55:17', '2022-11-13 23:55:17', NULL, '[]'),
(67, 'DUMMY', 67, '0067', 67, NULL, '100.0000', '100.0000', '25.0000', '125.0000', '125.0000', '2022-11-13 23:57:16', '2022-11-13 23:57:16', NULL, '[]'),
(68, 'DUMMY', 68, '0068', 68, NULL, '40.0000', '40.0000', '25.0000', '50.0000', '50.0000', '2022-11-14 00:05:19', '2022-11-14 00:05:19', NULL, '[]'),
(69, 'DUMMY', 69, '0069', 69, NULL, '145.0000', '145.0000', '25.0000', '181.2500', '181.2500', '2022-11-14 00:06:49', '2022-11-14 00:21:35', NULL, '[]'),
(70, 'DUMMY', 70, '0070', 70, NULL, '120.0000', '120.0000', '25.0000', '150.0000', '150.0000', '2022-11-14 00:08:31', '2022-11-14 00:08:31', NULL, '[]'),
(71, 'DUMMY', 71, '0071', 71, NULL, '145.0000', '145.0000', '25.0000', '181.2500', '181.2500', '2022-11-14 00:09:28', '2022-11-14 00:09:28', NULL, '[]'),
(72, 'DUMMY', 72, '0072', 72, NULL, '110.0000', '110.0000', '25.0000', '137.5000', '137.5000', '2022-11-14 00:10:24', '2022-11-14 00:10:24', NULL, '[]'),
(73, 'DUMMY', 73, '0073', 73, NULL, '65.0000', '65.0000', '25.0000', '81.2500', '81.2500', '2022-11-14 00:11:15', '2022-11-14 00:11:15', NULL, '[]'),
(74, 'DUMMY', 74, '0074', 74, NULL, '120.0000', '120.0000', '25.0000', '150.0000', '150.0000', '2022-11-14 00:14:49', '2022-11-14 00:14:49', NULL, '[]'),
(75, 'DUMMY', 75, '0075', 75, NULL, '125.0000', '125.0000', '25.0000', '156.2500', '156.2500', '2022-11-14 00:15:37', '2022-11-14 00:15:37', NULL, '[]'),
(76, 'DUMMY', 76, '0076', 76, NULL, '150.0000', '150.0000', '25.0000', '187.5000', '187.5000', '2022-11-14 00:17:05', '2022-11-14 00:17:05', NULL, '[]'),
(77, 'DUMMY', 77, '0077', 77, NULL, '280.0000', '280.0000', '25.0000', '350.0000', '350.0000', '2022-11-14 00:18:12', '2022-11-14 00:18:12', NULL, '[]'),
(78, 'DUMMY', 78, '0078', 78, NULL, '140.0000', '140.0000', '25.0000', '175.0000', '175.0000', '2022-11-14 00:19:11', '2022-11-14 00:19:11', NULL, '[]'),
(79, 'DUMMY', 79, '0079', 79, NULL, '56.6700', '56.6700', '25.0000', '70.8400', '70.8400', '2022-11-14 00:20:14', '2022-11-14 00:20:14', NULL, '[]'),
(80, 'DUMMY', 80, '0080', 80, NULL, '110.0000', '110.0000', '25.0000', '137.5000', '137.5000', '2022-11-14 00:22:43', '2022-11-14 00:22:43', NULL, '[]'),
(81, 'DUMMY', 81, '0081', 81, NULL, '70.0000', '70.0000', '25.0000', '87.5000', '87.5000', '2022-11-14 00:23:38', '2022-11-14 00:23:38', NULL, '[]'),
(82, 'DUMMY', 82, '0082', 82, NULL, '80.0000', '80.0000', '25.0000', '100.0000', '100.0000', '2022-11-14 00:24:33', '2022-11-14 00:24:33', NULL, '[]'),
(83, 'DUMMY', 83, '0083', 83, NULL, '140.0000', '140.0000', '25.0000', '175.0000', '175.0000', '2022-11-14 00:25:25', '2022-11-14 00:25:25', NULL, '[]'),
(84, 'DUMMY', 84, '0084', 84, NULL, '45.0000', '45.0000', '25.0000', '56.2500', '56.2500', '2022-11-14 00:26:08', '2022-11-14 00:26:08', NULL, '[]'),
(85, 'DUMMY', 85, '0085', 85, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2022-11-14 00:26:46', '2022-11-14 00:26:46', NULL, '[]'),
(86, 'DUMMY', 86, '0086', 86, NULL, '40.0000', '40.0000', '25.0000', '50.0000', '50.0000', '2022-11-14 00:27:36', '2022-11-14 00:27:36', NULL, '[]'),
(87, 'DUMMY', 87, '0087', 87, NULL, '95.0000', '95.0000', '25.0000', '118.7500', '118.7500', '2022-11-14 00:28:40', '2022-11-14 08:50:35', NULL, '[]'),
(88, 'DUMMY', 88, '0088', 88, NULL, '95.0000', '95.0000', '25.0000', '118.7500', '118.7500', '2022-11-14 00:30:10', '2022-11-14 00:30:10', NULL, '[]'),
(89, 'DUMMY', 89, '0089', 89, NULL, '45.0000', '45.0000', '25.0000', '56.2500', '56.2500', '2022-11-14 00:30:47', '2022-11-14 00:30:47', NULL, '[]'),
(90, 'DUMMY', 90, '0090', 90, NULL, '120.0000', '120.0000', '25.0000', '150.0000', '150.0000', '2022-11-14 00:32:21', '2022-11-14 00:32:21', NULL, '[]'),
(91, 'DUMMY', 91, '0091', 91, NULL, '70.0000', '70.0000', '25.0000', '87.5000', '87.5000', '2022-11-14 00:33:23', '2022-11-14 00:33:23', NULL, '[]'),
(92, 'DUMMY', 92, '0092', 92, NULL, '55.0000', '55.0000', '25.0000', '68.7500', '68.7500', '2022-11-14 00:34:15', '2022-11-14 00:34:15', NULL, '[]'),
(93, 'DUMMY', 93, '0093', 93, NULL, '80.0000', '80.0000', '25.0000', '100.0000', '100.0000', '2022-11-14 00:35:14', '2022-11-14 00:35:14', NULL, '[]'),
(94, 'DUMMY', 94, '0094', 94, NULL, '28.3300', '28.3300', '41.1900', '40.0000', '40.0000', '2022-11-14 00:36:06', '2022-11-26 19:40:04', NULL, '[]'),
(95, 'DUMMY', 95, '0095', 95, NULL, '19.0000', '19.0000', '25.0000', '23.7500', '23.7500', '2022-11-14 00:36:51', '2022-11-26 17:40:04', NULL, '[]'),
(96, 'DUMMY', 96, '0096', 96, NULL, '90.0000', '90.0000', '33.3300', '120.0000', '120.0000', '2022-11-14 00:37:35', '2022-11-26 18:56:43', NULL, '[]'),
(97, 'DUMMY', 97, '0097', 97, NULL, '130.0000', '130.0000', '25.0000', '162.5000', '162.5000', '2022-11-14 00:38:34', '2022-11-14 00:38:34', NULL, '[]'),
(98, 'DUMMY', 98, '0098', 98, NULL, '450.0000', '450.0000', '25.0000', '562.5000', '562.5000', '2022-11-14 00:39:22', '2022-11-14 00:39:22', NULL, '[]'),
(99, 'DUMMY', 99, '0099', 99, NULL, '300.0000', '300.0000', '25.0000', '375.0000', '375.0000', '2022-11-14 00:40:16', '2022-11-16 18:06:29', NULL, '[]'),
(100, 'DUMMY', 100, '0100', 100, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-14 00:41:04', '2022-11-14 00:41:04', NULL, '[]'),
(101, 'DUMMY', 101, '0101', 101, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-14 00:41:53', '2022-11-14 00:41:53', NULL, '[]'),
(102, 'DUMMY', 102, '0102', 102, NULL, '90.0000', '90.0000', '25.0000', '112.5000', '112.5000', '2022-11-14 00:42:41', '2022-11-14 00:42:41', NULL, '[]'),
(103, 'DUMMY', 103, '0103', 103, NULL, '95.0000', '95.0000', '25.0000', '118.7500', '118.7500', '2022-11-14 00:43:30', '2022-11-14 00:43:30', NULL, '[]'),
(104, 'DUMMY', 104, '0104', 104, NULL, '70.0000', '70.0000', '25.0000', '87.5000', '87.5000', '2022-11-14 00:44:44', '2022-11-14 00:44:44', NULL, '[]'),
(105, 'DUMMY', 105, '0105', 105, NULL, '20.0000', '20.0000', '25.0000', '25.0000', '25.0000', '2022-11-14 00:45:47', '2022-11-14 00:45:47', NULL, '[]'),
(106, 'DUMMY', 106, '0106', 106, NULL, '65.0000', '65.0000', '25.0000', '81.2500', '81.2500', '2022-11-14 00:46:42', '2022-11-14 00:46:42', NULL, '[]'),
(107, 'DUMMY', 107, '0107', 107, NULL, '95.0000', '95.0000', '25.0000', '118.7500', '118.7500', '2022-11-14 00:47:28', '2022-11-14 00:47:28', NULL, '[]'),
(108, 'DUMMY', 108, '0108', 108, NULL, '70.0000', '70.0000', '114.2900', '150.0000', '150.0000', '2022-11-16 14:27:27', '2022-11-16 14:27:27', NULL, '[]'),
(109, 'DUMMY', 109, '0109', 109, NULL, '35.0000', '35.0000', '25.0000', '43.7500', '43.7500', '2022-11-16 14:28:42', '2022-11-16 14:28:42', NULL, '[]'),
(110, 'DUMMY', 110, '0110', 110, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-16 14:33:27', '2022-11-16 14:33:27', NULL, '[]'),
(111, 'DUMMY', 111, '0111', 111, NULL, '30.0000', '30.0000', '25.0000', '37.5000', '37.5000', '2022-11-16 14:35:10', '2022-11-16 14:35:10', NULL, '[]'),
(112, 'DUMMY', 112, '.50', 112, NULL, '30.0000', '30.0000', '25.0000', '37.5000', '37.5000', '2022-11-16 14:36:21', '2022-11-16 14:36:21', NULL, '[]'),
(113, 'DUMMY', 113, '0113', 113, NULL, '30.0000', '30.0000', '25.0000', '37.5000', '37.5000', '2022-11-16 14:37:53', '2022-11-16 14:37:53', NULL, '[]'),
(114, 'DUMMY', 114, '0114', 114, NULL, '30.0000', '30.0000', '25.0000', '37.5000', '37.5000', '2022-11-16 14:39:00', '2022-11-16 14:39:00', NULL, '[]'),
(115, 'DUMMY', 115, '0115', 115, NULL, '5.0000', '5.0000', '25.0000', '6.2500', '6.2500', '2022-11-16 14:46:22', '2022-11-16 14:52:31', NULL, '[]'),
(116, 'DUMMY', 116, '0116', 116, NULL, '25.0000', '25.0000', '25.0000', '31.2500', '31.2500', '2022-11-16 14:48:24', '2022-11-16 14:48:24', NULL, '[]'),
(117, 'DUMMY', 117, '0117', 117, NULL, '24.0000', '24.0000', '25.0000', '30.0000', '30.0000', '2022-11-16 15:00:16', '2022-11-16 15:04:07', NULL, '[]'),
(118, 'DUMMY', 118, '0118', 118, NULL, '33.0000', '33.0000', '25.0000', '41.2500', '41.2500', '2022-11-16 15:07:37', '2022-11-16 15:07:37', NULL, '[]'),
(119, 'DUMMY', 119, '0119', 119, NULL, '45.0000', '45.0000', '25.0000', '56.2500', '56.2500', '2022-11-16 15:10:11', '2022-11-16 15:10:11', NULL, '[]'),
(120, 'DUMMY', 120, '0120', 120, NULL, '40.0000', '40.0000', '25.0000', '50.0000', '50.0000', '2022-11-16 15:13:41', '2022-11-16 15:13:41', NULL, '[]'),
(121, 'DUMMY', 121, '0121', 121, NULL, '35.0000', '35.0000', '25.0000', '43.7500', '43.7500', '2022-11-16 15:14:37', '2022-11-16 15:14:37', NULL, '[]'),
(122, 'DUMMY', 122, '0122', 122, NULL, '18.0000', '18.0000', '25.0000', '22.5000', '22.5000', '2022-11-16 15:15:33', '2022-11-16 15:15:33', NULL, '[]'),
(123, 'DUMMY', 123, '0123', 123, NULL, '22.0000', '22.0000', '25.0000', '27.5000', '27.5000', '2022-11-16 15:19:06', '2022-11-16 15:19:06', NULL, '[]'),
(124, 'DUMMY', 124, '0124', 124, NULL, '22.0000', '22.0000', '25.0000', '27.5000', '27.5000', '2022-11-16 15:19:53', '2022-11-16 15:19:53', NULL, '[]'),
(125, 'DUMMY', 125, '0125', 125, NULL, '30.0000', '30.0000', '25.0000', '37.5000', '37.5000', '2022-11-16 15:21:03', '2022-11-16 15:21:03', NULL, '[]'),
(126, 'DUMMY', 126, '0126', 126, NULL, '35.0000', '35.0000', '42.8600', '50.0000', '50.0000', '2022-11-16 15:22:05', '2022-11-16 18:21:08', NULL, '[]'),
(127, 'DUMMY', 127, '0127', 127, NULL, '3.0000', '3.0000', '25.0000', '3.7500', '3.7500', '2022-11-16 15:23:51', '2022-11-16 15:23:51', NULL, '[]'),
(128, 'DUMMY', 128, '0128', 128, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2022-11-16 15:30:43', '2022-11-16 15:30:43', NULL, '[]'),
(129, 'DUMMY', 129, '0129', 129, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2022-11-16 15:31:39', '2022-11-16 15:31:39', NULL, '[]'),
(130, 'DUMMY', 130, '0130', 130, NULL, '150.0000', '150.0000', '25.0000', '187.5000', '187.5000', '2022-11-16 15:35:33', '2022-11-16 15:35:33', NULL, '[]'),
(131, 'DUMMY', 131, '0131', 131, NULL, '150.0000', '150.0000', '25.0000', '187.5000', '187.5000', '2022-11-16 15:36:25', '2022-11-16 15:36:25', NULL, '[]'),
(132, 'DUMMY', 132, '0132', 132, NULL, '120.0000', '120.0000', '25.0000', '150.0000', '150.0000', '2022-11-16 15:39:59', '2022-11-16 15:41:20', NULL, '[]'),
(133, 'DUMMY', 133, '0133', 133, NULL, '45.0000', '45.0000', '25.0000', '56.2500', '56.2500', '2022-11-16 15:43:52', '2022-11-16 15:49:44', NULL, '[]'),
(134, 'DUMMY', 134, '3.00', 134, NULL, '45.0000', '45.0000', '25.0000', '56.2500', '56.2500', '2022-11-16 15:45:45', '2022-11-16 15:45:45', NULL, '[]'),
(135, 'DUMMY', 135, '0135', 135, NULL, '100.0000', '100.0000', '25.0000', '125.0000', '125.0000', '2022-11-16 15:49:13', '2022-11-16 15:49:13', NULL, '[]'),
(136, 'DUMMY', 136, '0136', 136, NULL, '120.0000', '120.0000', '25.0000', '150.0000', '150.0000', '2022-11-16 15:51:19', '2022-11-16 15:51:19', NULL, '[]'),
(137, 'DUMMY', 137, '0137', 137, NULL, '40.0000', '40.0000', '25.0000', '50.0000', '50.0000', '2022-11-16 15:53:19', '2022-11-16 15:53:19', NULL, '[]'),
(138, 'DUMMY', 138, 'POLISH REMOVER PARADISE -60ML', 138, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-16 15:55:06', '2022-11-16 15:55:06', NULL, '[]'),
(139, 'DUMMY', 139, '0139', 139, NULL, '80.0000', '80.0000', '25.0000', '100.0000', '100.0000', '2022-11-16 15:59:54', '2022-11-16 15:59:54', NULL, '[]'),
(140, 'DUMMY', 140, '0140', 140, NULL, '80.0000', '80.0000', '25.0000', '100.0000', '100.0000', '2022-11-16 16:00:27', '2022-11-16 16:00:27', NULL, '[]'),
(141, 'DUMMY', 141, '0141', 141, NULL, '16.0000', '16.0000', '25.0000', '20.0000', '20.0000', '2022-11-16 16:02:58', '2022-11-16 16:04:54', NULL, '[]'),
(142, 'DUMMY', 142, '0142', 142, NULL, '12.0000', '12.0000', '25.0000', '15.0000', '15.0000', '2022-11-16 16:04:05', '2022-11-16 16:04:05', NULL, '[]'),
(143, 'DUMMY', 143, '0143', 143, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2022-11-16 16:07:02', '2022-11-16 16:07:02', NULL, '[]'),
(144, 'DUMMY', 144, '0144', 144, NULL, '18.0000', '18.0000', '25.0000', '22.5000', '22.5000', '2022-11-16 16:08:52', '2022-11-16 16:08:52', NULL, '[]'),
(145, 'DUMMY', 145, '0145', 145, NULL, '35.0000', '35.0000', '25.0000', '43.7500', '43.7500', '2022-11-16 16:13:11', '2022-11-16 16:13:11', NULL, '[]'),
(146, 'DUMMY', 146, '0146', 146, NULL, '35.0000', '35.0000', '25.0000', '43.7500', '43.7500', '2022-11-16 16:14:26', '2022-11-16 16:14:26', NULL, '[]'),
(147, 'DUMMY', 147, '0147', 147, NULL, '35.0000', '35.0000', '25.0000', '43.7500', '43.7500', '2022-11-16 16:16:16', '2022-11-16 16:16:16', NULL, '[]'),
(148, 'DUMMY', 148, '0148', 148, NULL, '20.0000', '20.0000', '25.0000', '25.0000', '25.0000', '2022-11-16 16:17:09', '2022-11-16 16:17:09', NULL, '[]'),
(149, 'DUMMY', 149, '0149', 149, NULL, '100.0000', '100.0000', '25.0000', '125.0000', '125.0000', '2022-11-16 16:19:32', '2022-11-16 16:19:32', NULL, '[]'),
(150, 'DUMMY', 150, '0150', 150, NULL, '30.0000', '30.0000', '25.0000', '37.5000', '37.5000', '2022-11-16 16:20:35', '2022-11-16 16:20:35', NULL, '[]'),
(151, 'DUMMY', 151, '0151', 151, NULL, '35.0000', '35.0000', '25.0000', '43.7500', '43.7500', '2022-11-16 16:24:16', '2022-11-16 16:24:16', NULL, '[]'),
(152, 'DUMMY', 152, '0152', 152, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-16 16:25:21', '2022-11-16 16:25:21', NULL, '[]'),
(153, 'DUMMY', 153, '0153', 153, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2022-11-16 16:26:32', '2022-11-16 16:26:32', NULL, '[]'),
(154, 'DUMMY', 154, '0154', 154, NULL, '15.0000', '15.0000', '25.0000', '18.7500', '18.7500', '2022-11-16 16:28:12', '2022-11-16 16:30:21', NULL, '[]'),
(155, 'DUMMY', 155, '0155', 155, NULL, '12.0000', '12.0000', '25.0000', '15.0000', '15.0000', '2022-11-16 16:29:36', '2022-11-16 16:29:36', NULL, '[]'),
(156, 'DUMMY', 156, '0156', 156, NULL, '30.0000', '30.0000', '25.0000', '37.5000', '37.5000', '2022-11-16 16:31:25', '2022-11-16 16:31:25', NULL, '[]'),
(157, 'DUMMY', 157, '0157', 157, NULL, '30.0000', '30.0000', '25.0000', '37.5000', '37.5000', '2022-11-16 16:33:28', '2022-11-16 16:33:28', NULL, '[]'),
(158, 'DUMMY', 158, '0158', 158, NULL, '10.0000', '10.0000', '25.0000', '12.5000', '12.5000', '2022-11-16 16:34:10', '2022-11-16 16:34:10', NULL, '[]'),
(159, 'DUMMY', 159, 'Default Purchase Price 	x Margin(%) 	Default Selling Price 	Product imageExc. tax:*Inc. tax:*		Exc. Tax 	Product image:Max File size: 1MBAspect ratio should be 1:1', 159, NULL, '20.0000', '20.0000', '25.0000', '25.0000', '25.0000', '2022-11-16 16:48:23', '2022-11-16 16:48:23', NULL, '[]'),
(160, 'DUMMY', 160, '0160', 160, NULL, '16.0000', '16.0000', '25.0000', '20.0000', '20.0000', '2022-11-16 16:49:40', '2022-11-16 16:49:40', NULL, '[]'),
(161, 'DUMMY', 161, '0161', 161, NULL, '25.0000', '25.0000', '25.0000', '31.2500', '31.2500', '2022-11-16 16:50:24', '2022-11-16 16:50:24', NULL, '[]'),
(162, 'DUMMY', 162, '0162', 162, NULL, '8.0000', '8.0000', '25.0000', '10.0000', '10.0000', '2022-11-16 16:51:08', '2022-11-16 16:51:08', NULL, '[]'),
(163, 'DUMMY', 163, '0163', 163, NULL, '15.0000', '15.0000', '25.0000', '18.7500', '18.7500', '2022-11-16 16:51:41', '2022-11-16 16:51:41', NULL, '[]'),
(164, 'DUMMY', 164, '0164', 164, NULL, '12.0000', '12.0000', '25.0000', '15.0000', '15.0000', '2022-11-16 16:56:48', '2022-11-16 16:56:48', NULL, '[]'),
(165, 'DUMMY', 165, '0165', 165, NULL, '20.0000', '20.0000', '25.0000', '25.0000', '25.0000', '2022-11-16 16:57:46', '2022-11-16 16:57:46', NULL, '[]'),
(166, 'DUMMY', 166, 'CT', 166, NULL, '60.0000', '60.0000', '25.0000', '75.0000', '75.0000', '2022-11-16 17:01:17', '2022-11-16 17:01:17', NULL, '[]'),
(167, 'DUMMY', 167, '0167', 167, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-16 17:02:27', '2022-11-16 17:02:27', NULL, '[]'),
(168, 'DUMMY', 168, '0168', 168, NULL, '25.0000', '25.0000', '25.0000', '31.2500', '31.2500', '2022-11-16 17:03:03', '2022-11-16 17:03:03', NULL, '[]'),
(169, 'DUMMY', 169, '0169', 169, NULL, '25.0000', '25.0000', '25.0000', '31.2500', '31.2500', '2022-11-16 17:04:17', '2022-11-16 17:04:17', NULL, '[]'),
(170, 'DUMMY', 170, '0170', 170, NULL, '18.0000', '18.0000', '25.0000', '22.5000', '22.5000', '2022-11-16 17:06:29', '2022-11-16 17:06:29', NULL, '[]'),
(171, 'DUMMY', 171, '0171', 171, NULL, '30.0000', '30.0000', '25.0000', '37.5000', '37.5000', '2022-11-16 17:11:28', '2022-11-16 17:11:28', NULL, '[]'),
(172, 'DUMMY', 172, '0172', 172, NULL, '40.0000', '40.0000', '25.0000', '50.0000', '50.0000', '2022-11-16 17:13:26', '2022-11-16 17:13:26', NULL, '[]'),
(173, 'DUMMY', 173, '0173', 173, NULL, '40.0000', '40.0000', '25.0000', '50.0000', '50.0000', '2022-11-16 17:15:21', '2022-11-16 17:15:21', NULL, '[]'),
(174, 'DUMMY', 174, '0174', 174, NULL, '130.0000', '130.0000', '25.0000', '162.5000', '162.5000', '2022-11-16 17:16:28', '2022-11-16 17:16:28', NULL, '[]'),
(175, 'DUMMY', 175, '0175', 175, NULL, '15.0000', '15.0000', '25.0000', '18.7500', '18.7500', '2022-11-16 17:20:02', '2022-11-16 17:20:02', NULL, '[]'),
(176, 'DUMMY', 176, '0176', 176, NULL, '15.0000', '15.0000', '25.0000', '18.7500', '18.7500', '2022-11-16 17:21:34', '2022-11-16 17:21:34', NULL, '[]'),
(177, 'DUMMY', 177, '0177', 177, NULL, '30.0000', '30.0000', '25.0000', '37.5000', '37.5000', '2022-11-16 17:31:48', '2022-11-16 17:31:48', NULL, '[]'),
(178, 'DUMMY', 178, '0178', 178, NULL, '10.0000', '10.0000', '25.0000', '12.5000', '12.5000', '2022-11-16 17:33:24', '2022-11-16 17:33:24', NULL, '[]'),
(179, 'DUMMY', 179, '0179', 179, NULL, '20.0000', '20.0000', '25.0000', '25.0000', '25.0000', '2022-11-16 17:35:21', '2022-11-16 17:35:21', NULL, '[]'),
(180, 'DUMMY', 180, '0180', 180, NULL, '25.0000', '25.0000', '25.0000', '31.2500', '31.2500', '2022-11-16 17:36:00', '2022-11-16 17:36:00', NULL, '[]'),
(223, 'DUMMY', 223, '0223', 223, NULL, '45.0000', '45.0000', '25.0000', '56.2500', '56.2500', '2022-11-18 09:32:23', '2022-11-18 09:32:23', NULL, '[]'),
(224, 'DUMMY', 224, '0224', 224, NULL, '45.0000', '45.0000', '25.0000', '56.2500', '56.2500', '2022-11-18 09:33:14', '2022-11-18 09:33:14', NULL, '[]'),
(225, 'DUMMY', 225, '0225', 225, NULL, '45.0000', '45.0000', '25.0000', '56.2500', '56.2500', '2022-11-18 09:34:08', '2022-11-18 09:34:08', NULL, '[]'),
(226, 'DUMMY', 226, '0226', 226, NULL, '45.0000', '45.0000', '25.0000', '56.2500', '56.2500', '2022-11-18 09:34:52', '2022-11-18 09:34:52', NULL, '[]'),
(227, 'DUMMY', 227, '0227', 227, NULL, '45.0000', '45.0000', '25.0000', '56.2500', '56.2500', '2022-11-18 09:35:35', '2022-11-18 09:35:35', NULL, '[]'),
(228, 'DUMMY', 228, '0228', 228, NULL, '52.0000', '52.0000', '25.0000', '65.0000', '65.0000', '2022-11-18 09:37:44', '2022-11-18 09:41:11', NULL, '[]'),
(229, 'DUMMY', 229, '0229', 229, NULL, '52.0000', '52.0000', '25.0000', '65.0000', '65.0000', '2022-11-18 09:38:41', '2022-11-18 09:38:41', NULL, '[]'),
(230, 'DUMMY', 230, '0230', 230, NULL, '52.0000', '52.0000', '25.0000', '65.0000', '65.0000', '2022-11-18 09:39:49', '2022-11-18 09:39:49', NULL, '[]'),
(231, 'DUMMY', 231, '0231', 231, NULL, '55.0000', '55.0000', '25.0000', '68.7500', '68.7500', '2022-11-18 09:46:22', '2022-11-18 09:46:22', NULL, '[]'),
(232, 'DUMMY', 232, '0232', 232, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 09:47:35', '2022-11-18 09:47:35', NULL, '[]'),
(233, 'DUMMY', 233, '0233', 233, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 09:49:33', '2022-11-18 09:49:33', NULL, '[]'),
(234, 'DUMMY', 234, '0234', 234, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 09:50:19', '2022-11-18 09:50:19', NULL, '[]'),
(235, 'DUMMY', 235, '0235', 235, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 09:51:24', '2022-11-18 09:51:24', NULL, '[]'),
(236, 'DUMMY', 236, '0236', 236, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 09:52:12', '2022-11-18 09:52:12', NULL, '[]'),
(237, 'DUMMY', 237, '0237', 237, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 09:52:53', '2022-11-18 09:52:53', NULL, '[]'),
(238, 'DUMMY', 238, '0238', 238, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 09:53:55', '2022-11-18 09:53:55', NULL, '[]'),
(239, 'DUMMY', 239, '0239', 239, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 09:54:50', '2022-11-18 09:54:50', NULL, '[]'),
(240, 'DUMMY', 240, '0240', 240, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 09:56:26', '2022-11-18 09:56:26', NULL, '[]'),
(241, 'DUMMY', 241, '0241', 241, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 09:57:12', '2022-11-18 09:57:12', NULL, '[]'),
(242, 'DUMMY', 242, '0242', 242, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 09:57:56', '2022-11-18 09:57:56', NULL, '[]'),
(243, 'DUMMY', 243, '0243', 243, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 09:59:39', '2022-11-18 09:59:39', NULL, '[]'),
(244, 'DUMMY', 244, '0244', 244, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:00:16', '2022-11-18 10:00:16', NULL, '[]'),
(245, 'DUMMY', 245, '0245', 245, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:01:15', '2022-11-18 10:01:15', NULL, '[]'),
(246, 'DUMMY', 246, '0246', 246, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:02:03', '2022-11-18 10:02:03', NULL, '[]'),
(247, 'DUMMY', 247, '0247', 247, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:02:45', '2022-11-18 10:02:45', NULL, '[]'),
(248, 'DUMMY', 248, '0248', 248, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:03:34', '2022-11-18 10:03:34', NULL, '[]'),
(249, 'DUMMY', 249, '0249', 249, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:07:33', '2022-11-18 10:07:33', NULL, '[]'),
(250, 'DUMMY', 250, '0250', 250, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:08:29', '2022-11-18 10:08:29', NULL, '[]'),
(251, 'DUMMY', 251, '0251', 251, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:10:01', '2022-11-18 10:10:01', NULL, '[]'),
(252, 'DUMMY', 252, '0252', 252, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:10:42', '2022-11-18 10:10:42', NULL, '[]'),
(253, 'DUMMY', 253, '0253', 253, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:11:20', '2022-11-18 10:11:20', NULL, '[]'),
(254, 'DUMMY', 254, '0254', 254, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:11:50', '2022-11-18 10:11:50', NULL, '[]'),
(255, 'DUMMY', 255, '0255', 255, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:12:41', '2022-11-18 10:12:41', NULL, '[]'),
(256, 'DUMMY', 256, '0256', 256, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:13:21', '2022-11-18 10:13:21', NULL, '[]'),
(257, 'DUMMY', 257, '0257', 257, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:13:57', '2022-11-18 12:42:20', NULL, '[]'),
(258, 'DUMMY', 258, '0258', 258, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:14:29', '2022-11-18 10:14:29', NULL, '[]'),
(259, 'DUMMY', 259, '0259', 259, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:15:19', '2022-11-23 21:45:11', NULL, '[]'),
(260, 'DUMMY', 260, '0260', 260, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:15:56', '2022-11-18 10:15:56', NULL, '[]'),
(261, 'DUMMY', 261, '0261', 261, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:16:39', '2022-11-18 10:16:39', NULL, '[]'),
(262, 'DUMMY', 262, '0262', 262, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:17:10', '2022-11-18 10:17:10', NULL, '[]'),
(263, 'DUMMY', 263, '0263', 263, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:17:56', '2022-11-18 10:17:56', NULL, '[]'),
(264, 'DUMMY', 264, '0264', 264, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:18:32', '2022-11-18 10:18:32', NULL, '[]'),
(265, 'DUMMY', 265, '0265', 265, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:19:16', '2022-11-18 10:19:16', NULL, '[]'),
(266, 'DUMMY', 266, '0266', 266, NULL, '50.0000', '50.0000', '25.0000', '62.5000', '62.5000', '2022-11-18 10:19:52', '2022-11-18 10:19:52', NULL, '[]'),
(267, 'DUMMY', 267, '0267', 267, NULL, '585.0000', '585.0000', '25.0000', '731.2500', '731.2500', '2022-11-18 10:29:32', '2022-11-24 16:13:33', NULL, '[]'),
(268, 'DUMMY', 268, '0268', 268, NULL, '585.0000', '585.0000', '25.0000', '731.2500', '731.2500', '2022-11-18 10:30:14', '2022-11-18 10:30:14', NULL, '[]'),
(269, 'DUMMY', 269, '0269', 269, NULL, '585.0000', '585.0000', '25.0000', '731.2500', '731.2500', '2022-11-18 10:31:03', '2022-11-18 10:31:03', NULL, '[]'),
(270, 'DUMMY', 270, '0270', 270, NULL, '585.0000', '585.0000', '25.0000', '731.2500', '731.2500', '2022-11-18 10:32:05', '2022-11-24 16:14:06', NULL, '[]'),
(271, 'DUMMY', 271, '0271', 271, NULL, '390.0000', '390.0000', '25.0000', '487.5000', '487.5000', '2022-11-18 10:33:35', '2022-11-18 10:33:35', NULL, '[]'),
(272, 'DUMMY', 272, '0272', 272, NULL, '390.0000', '390.0000', '25.0000', '487.5000', '487.5000', '2022-11-18 10:34:02', '2022-11-18 10:34:02', NULL, '[]'),
(273, 'DUMMY', 273, '0273', 273, NULL, '390.0000', '390.0000', '25.0000', '487.5000', '487.5000', '2022-11-18 10:34:34', '2022-11-18 10:34:34', NULL, '[]'),
(274, 'DUMMY', 274, '0274', 274, NULL, '390.0000', '390.0000', '25.0000', '487.5000', '487.5000', '2022-11-18 10:35:04', '2022-11-18 10:35:04', NULL, '[]'),
(275, 'DUMMY', 275, '0275', 275, NULL, '390.0000', '390.0000', '25.0000', '487.5000', '487.5000', '2022-11-18 10:35:45', '2022-11-18 10:35:45', NULL, '[]'),
(276, 'DUMMY', 276, '0276', 276, NULL, '600.0000', '600.0000', '25.0000', '750.0000', '750.0000', '2022-11-18 10:38:02', '2022-11-18 10:38:02', NULL, '[]'),
(277, 'DUMMY', 277, '0277', 277, NULL, '600.0000', '600.0000', '25.0000', '750.0000', '750.0000', '2022-11-18 10:38:37', '2022-11-18 10:38:37', NULL, '[]'),
(278, 'DUMMY', 278, '0278', 278, NULL, '600.0000', '600.0000', '25.0000', '750.0000', '750.0000', '2022-11-18 10:39:11', '2022-11-18 10:39:11', NULL, '[]'),
(279, 'DUMMY', 279, '0279', 279, NULL, '600.0000', '600.0000', '25.0000', '750.0000', '750.0000', '2022-11-18 10:39:37', '2022-11-18 10:39:37', NULL, '[]'),
(280, 'DUMMY', 280, '0280', 280, NULL, '600.0000', '600.0000', '25.0000', '750.0000', '750.0000', '2022-11-18 10:40:08', '2022-11-18 10:40:08', NULL, '[]'),
(281, 'DUMMY', 281, '0281', 281, NULL, '1500.0000', '1500.0000', '25.0000', '1875.0000', '1875.0000', '2022-11-18 10:41:47', '2022-11-18 10:41:47', NULL, '[]'),
(282, 'DUMMY', 282, '0282', 282, NULL, '300.0000', '300.0000', '25.0000', '375.0000', '375.0000', '2022-11-18 10:43:35', '2022-11-18 10:43:35', NULL, '[]'),
(283, 'DUMMY', 283, '0283', 283, NULL, '300.0000', '300.0000', '25.0000', '375.0000', '375.0000', '2022-11-18 10:45:37', '2022-11-18 10:47:09', NULL, '[]'),
(284, 'DUMMY', 284, '0284', 284, NULL, '300.0000', '300.0000', '25.0000', '375.0000', '375.0000', '2022-11-18 10:48:39', '2022-11-18 10:48:39', NULL, '[]'),
(285, 'DUMMY', 285, '0285', 285, NULL, '300.0000', '300.0000', '25.0000', '375.0000', '375.0000', '2022-11-18 10:49:09', '2022-11-18 10:49:09', NULL, '[]'),
(286, 'DUMMY', 286, '0286', 286, NULL, '535.0000', '535.0000', '25.0000', '668.7500', '668.7500', '2022-11-18 10:50:38', '2022-11-18 10:50:38', NULL, '[]'),
(287, 'DUMMY', 287, '0287', 287, NULL, '535.0000', '535.0000', '25.0000', '668.7500', '668.7500', '2022-11-18 10:51:07', '2022-11-18 10:51:07', NULL, '[]'),
(288, 'DUMMY', 288, '0288', 288, NULL, '535.0000', '535.0000', '25.0000', '668.7500', '668.7500', '2022-11-18 10:51:44', '2022-11-18 10:51:44', NULL, '[]'),
(289, 'DUMMY', 289, '0289', 289, NULL, '585.0000', '585.0000', '25.0000', '731.2500', '731.2500', '2022-11-18 10:52:28', '2022-11-18 10:52:28', NULL, '[]'),
(290, 'DUMMY', 290, '0290', 290, NULL, '535.0000', '535.0000', '25.0000', '668.7500', '668.7500', '2022-11-18 10:52:58', '2022-11-18 10:52:58', NULL, '[]'),
(291, 'DUMMY', 291, '0291', 291, NULL, '300.0000', '300.0000', '25.0000', '375.0000', '375.0000', '2022-11-18 10:53:56', '2022-11-18 10:53:56', NULL, '[]'),
(292, 'DUMMY', 292, '0292', 292, NULL, '300.0000', '300.0000', '25.0000', '375.0000', '375.0000', '2022-11-18 10:54:22', '2022-11-18 10:54:22', NULL, '[]'),
(293, 'DUMMY', 293, '0293', 293, NULL, '300.0000', '300.0000', '25.0000', '375.0000', '375.0000', '2022-11-18 10:54:48', '2022-11-18 10:54:48', NULL, '[]'),
(294, 'DUMMY', 294, '0294', 294, NULL, '500.0000', '500.0000', '25.0000', '625.0000', '625.0000', '2022-11-18 10:56:00', '2022-11-18 10:57:07', NULL, '[]'),
(295, 'DUMMY', 295, '0295', 295, NULL, '500.0000', '500.0000', '25.0000', '625.0000', '625.0000', '2022-11-18 10:56:40', '2022-11-18 10:56:40', NULL, '[]'),
(296, 'DUMMY', 296, '0296', 296, NULL, '350.0000', '350.0000', '25.0000', '437.5000', '437.5000', '2022-11-18 10:59:49', '2022-11-18 10:59:49', NULL, '[]'),
(297, 'DUMMY', 297, '0297', 297, NULL, '560.0000', '560.0000', '25.0000', '700.0000', '700.0000', '2022-11-18 11:01:10', '2022-11-18 11:01:10', NULL, '[]'),
(298, 'DUMMY', 298, '0298', 298, NULL, '560.0000', '560.0000', '25.0000', '700.0000', '700.0000', '2022-11-18 11:01:44', '2022-11-18 11:01:44', NULL, '[]'),
(299, 'DUMMY', 299, '0299', 299, NULL, '560.0000', '560.0000', '25.0000', '700.0000', '700.0000', '2022-11-18 11:02:16', '2022-11-18 11:02:16', NULL, '[]'),
(300, 'DUMMY', 300, '0300', 300, NULL, '470.0000', '470.0000', '25.0000', '587.5000', '587.5000', '2022-11-18 11:03:27', '2022-11-18 11:03:27', NULL, '[]'),
(301, 'DUMMY', 301, '0301', 301, NULL, '470.0000', '470.0000', '25.0000', '587.5000', '587.5000', '2022-11-18 11:03:54', '2022-11-18 11:03:54', NULL, '[]'),
(302, 'DUMMY', 302, '0302', 302, NULL, '470.0000', '470.0000', '25.0000', '587.5000', '587.5000', '2022-11-18 11:04:36', '2022-11-18 11:04:36', NULL, '[]'),
(303, 'DUMMY', 303, '0303', 303, NULL, '470.0000', '470.0000', '25.0000', '587.5000', '587.5000', '2022-11-18 11:06:35', '2022-11-18 11:07:06', NULL, '[]'),
(304, 'DUMMY', 304, '0304', 304, NULL, '450.0000', '450.0000', '25.0000', '562.5000', '562.5000', '2022-11-18 11:08:21', '2022-11-18 11:08:21', NULL, '[]'),
(305, 'DUMMY', 305, '0305', 305, NULL, '450.0000', '450.0000', '25.0000', '562.5000', '562.5000', '2022-11-18 11:08:49', '2022-11-18 11:08:49', NULL, '[]'),
(306, 'DUMMY', 306, '0306', 306, NULL, '470.0000', '470.0000', '25.0000', '587.5000', '587.5000', '2022-11-18 11:09:18', '2022-11-18 11:09:18', NULL, '[]'),
(307, 'DUMMY', 307, '0307', 307, NULL, '470.0000', '470.0000', '25.0000', '587.5000', '587.5000', '2022-11-18 11:10:12', '2022-11-18 11:10:12', NULL, '[]'),
(308, 'DUMMY', 308, '0308', 308, NULL, '470.0000', '470.0000', '25.0000', '587.5000', '587.5000', '2022-11-18 11:11:06', '2022-11-18 11:11:06', NULL, '[]'),
(309, 'DUMMY', 309, '0309', 309, NULL, '135.0000', '135.0000', '25.0000', '168.7500', '168.7500', '2022-11-18 11:13:33', '2022-11-18 11:14:59', NULL, '[]'),
(310, 'DUMMY', 310, '0310', 310, NULL, '135.0000', '135.0000', '25.0000', '168.7500', '168.7500', '2022-11-18 11:14:06', '2022-11-18 11:14:06', NULL, '[]'),
(311, 'DUMMY', 311, '0311', 311, NULL, '135.0000', '135.0000', '25.0000', '168.7500', '168.7500', '2022-11-18 11:14:30', '2022-11-18 11:14:30', NULL, '[]'),
(312, 'DUMMY', 312, '0312', 312, NULL, '170.0000', '170.0000', '25.0000', '212.5000', '212.5000', '2022-11-18 11:15:55', '2022-11-18 11:15:55', NULL, '[]'),
(313, 'DUMMY', 313, '0313', 313, NULL, '170.0000', '170.0000', '25.0000', '212.5000', '212.5000', '2022-11-18 11:16:24', '2022-11-18 11:16:24', NULL, '[]'),
(314, 'DUMMY', 314, '0314', 314, NULL, '170.0000', '170.0000', '25.0000', '212.5000', '212.5000', '2022-11-18 11:16:51', '2022-11-18 11:16:51', NULL, '[]'),
(315, 'DUMMY', 315, '0315', 315, NULL, '170.0000', '170.0000', '25.0000', '212.5000', '212.5000', '2022-11-18 11:17:21', '2022-11-18 11:17:21', NULL, '[]'),
(316, 'DUMMY', 316, '0316', 316, NULL, '750.0000', '750.0000', '25.0000', '937.5000', '937.5000', '2022-11-18 11:18:38', '2022-11-18 11:18:38', NULL, '[]'),
(317, 'DUMMY', 317, '0317', 317, NULL, '1065.0000', '1065.0000', '25.0000', '1331.2500', '1331.2500', '2022-11-18 11:20:10', '2022-11-18 11:20:10', NULL, '[]'),
(318, 'DUMMY', 318, '0318', 318, NULL, '1065.0000', '1065.0000', '25.0000', '1331.2500', '1331.2500', '2022-11-18 11:21:00', '2022-11-18 11:21:00', NULL, '[]'),
(319, 'DUMMY', 319, '0319', 319, NULL, '430.0000', '430.0000', '25.0000', '537.5000', '537.5000', '2022-11-18 11:22:26', '2022-11-18 11:22:26', NULL, '[]'),
(320, 'DUMMY', 320, '0320', 320, NULL, '430.0000', '430.0000', '25.0000', '537.5000', '537.5000', '2022-11-18 11:23:06', '2022-11-18 11:23:06', NULL, '[]'),
(321, 'DUMMY', 321, '0321', 321, NULL, '300.0000', '300.0000', '25.0000', '375.0000', '375.0000', '2022-11-18 11:25:12', '2022-11-24 16:14:39', NULL, '[]'),
(322, 'DUMMY', 322, '0322', 322, NULL, '300.0000', '300.0000', '25.0000', '375.0000', '375.0000', '2022-11-18 11:25:59', '2022-11-18 11:25:59', NULL, '[]'),
(323, 'DUMMY', 323, '0323', 323, NULL, '475.0000', '475.0000', '25.0000', '593.7500', '593.7500', '2022-11-18 11:28:56', '2022-11-18 11:28:56', NULL, '[]'),
(324, 'DUMMY', 324, '0324', 324, NULL, '475.0000', '475.0000', '25.0000', '593.7500', '593.7500', '2022-11-18 11:29:24', '2022-11-18 11:29:24', NULL, '[]'),
(325, 'DUMMY', 325, '0325', 325, NULL, '365.0000', '365.0000', '25.0000', '456.2500', '456.2500', '2022-11-18 11:30:55', '2022-11-18 11:30:55', NULL, '[]'),
(326, 'DUMMY', 326, '0326', 326, NULL, '365.0000', '365.0000', '25.0000', '456.2500', '456.2500', '2022-11-18 11:31:32', '2022-11-18 11:31:32', NULL, '[]'),
(327, 'DUMMY', 327, '0327', 327, NULL, '365.0000', '365.0000', '25.0000', '456.2500', '456.2500', '2022-11-18 11:31:57', '2022-11-18 11:31:57', NULL, '[]'),
(328, 'DUMMY', 328, '0328', 328, NULL, '365.0000', '365.0000', '25.0000', '456.2500', '456.2500', '2022-11-18 11:36:15', '2022-11-18 11:36:15', NULL, '[]'),
(329, 'DUMMY', 329, '0329', 329, NULL, '485.0000', '485.0000', '25.0000', '606.2500', '606.2500', '2022-11-18 11:37:07', '2022-11-18 11:37:07', NULL, '[]'),
(330, 'DUMMY', 330, '0330', 330, NULL, '485.0000', '485.0000', '25.0000', '606.2500', '606.2500', '2022-11-18 11:37:41', '2022-11-18 11:37:41', NULL, '[]'),
(331, 'DUMMY', 331, '0331', 331, NULL, '485.0000', '485.0000', '25.0000', '606.2500', '606.2500', '2022-11-18 11:38:08', '2022-11-18 11:38:08', NULL, '[]'),
(332, 'DUMMY', 332, '0332', 332, NULL, '265.0000', '265.0000', '25.0000', '331.2500', '331.2500', '2022-11-18 11:39:13', '2022-11-18 15:07:50', NULL, '[]'),
(333, 'DUMMY', 333, '0333', 333, NULL, '265.0000', '265.0000', '25.0000', '331.2500', '331.2500', '2022-11-18 11:39:44', '2022-11-18 11:39:44', NULL, '[]'),
(334, 'DUMMY', 334, '0334', 334, NULL, '300.0000', '300.0000', '25.0000', '375.0000', '375.0000', '2022-11-18 11:42:10', '2022-11-18 11:42:10', NULL, '[]'),
(335, 'DUMMY', 335, '0335', 335, NULL, '350.0000', '350.0000', '25.0000', '437.5000', '437.5000', '2022-11-18 11:43:11', '2022-11-18 11:43:11', NULL, '[]'),
(336, 'DUMMY', 336, '0336', 336, NULL, '45.0000', '45.0000', '25.0000', '56.2500', '56.2500', '2022-11-18 13:47:59', '2022-11-18 13:47:59', NULL, '[]'),
(337, 'DUMMY', 337, '0337', 337, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 13:11:25', '2022-11-24 13:11:25', NULL, '[]'),
(338, 'DUMMY', 338, '0338', 338, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 13:12:07', '2022-11-24 13:12:07', NULL, '[]'),
(339, 'DUMMY', 339, '0339', 339, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 13:12:59', '2022-11-24 13:12:59', NULL, '[]'),
(340, 'DUMMY', 340, '0340', 340, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 13:13:52', '2022-11-24 13:13:52', NULL, '[]'),
(341, 'DUMMY', 341, '0341', 341, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 13:16:56', '2022-11-24 13:16:56', NULL, '[]'),
(342, 'DUMMY', 342, '0342', 342, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 13:17:37', '2022-11-24 13:17:37', NULL, '[]'),
(343, 'DUMMY', 343, '0343', 343, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 13:18:20', '2022-11-24 13:18:20', NULL, '[]'),
(344, 'DUMMY', 344, '0344', 344, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 15:57:21', '2022-11-24 15:57:21', NULL, '[]'),
(345, 'DUMMY', 345, '0345', 345, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 15:58:17', '2022-11-24 15:58:17', NULL, '[]'),
(346, 'DUMMY', 346, '0346', 346, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 15:58:56', '2022-11-24 15:58:56', NULL, '[]'),
(347, 'DUMMY', 347, '0347', 347, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 15:59:39', '2022-11-24 15:59:39', NULL, '[]'),
(348, 'DUMMY', 348, '0348', 348, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 16:00:21', '2022-11-24 16:00:21', NULL, '[]'),
(349, 'DUMMY', 349, '0349', 349, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 16:00:58', '2022-11-24 16:00:58', NULL, '[]'),
(350, 'DUMMY', 350, '0350', 350, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 16:01:33', '2022-11-24 16:01:33', NULL, '[]'),
(351, 'DUMMY', 351, '0351', 351, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 16:02:08', '2022-11-24 16:02:08', NULL, '[]'),
(352, 'DUMMY', 352, '0352', 352, NULL, '54.0000', '54.0000', '25.0000', '67.5000', '67.5000', '2022-11-24 16:02:49', '2022-11-24 16:02:49', NULL, '[]'),
(353, 'DUMMY', 353, '0353', 353, NULL, '285.0000', '285.0000', '25.0000', '356.2500', '356.2500', '2022-11-24 16:03:32', '2022-11-24 16:03:32', NULL, '[]'),
(354, 'DUMMY', 354, '0354', 354, NULL, '285.0000', '285.0000', '25.0000', '356.2500', '356.2500', '2022-11-24 16:04:19', '2022-11-24 16:04:19', NULL, '[]'),
(355, 'DUMMY', 355, '0355', 355, NULL, '265.0000', '265.0000', '25.0000', '331.2500', '331.2500', '2022-11-24 16:05:05', '2022-11-24 16:05:05', NULL, '[]'),
(356, 'DUMMY', 356, '0356', 356, NULL, '265.0000', '265.0000', '25.0000', '331.2500', '331.2500', '2022-11-24 16:05:45', '2022-11-24 16:05:45', NULL, '[]'),
(357, 'DUMMY', 357, '0357', 357, NULL, '365.0000', '365.0000', '25.0000', '456.2500', '456.2500', '2022-11-24 16:06:41', '2022-11-24 16:06:41', NULL, '[]'),
(358, 'DUMMY', 358, '0358', 358, NULL, '2.0000', '2.0000', '25.0000', '2.5000', '2.5000', '2022-11-24 16:07:33', '2022-11-24 16:07:33', NULL, '[]'),
(359, 'DUMMY', 359, '0359', 359, NULL, '405.0000', '405.0000', '25.0000', '506.2500', '506.2500', '2022-11-24 16:08:17', '2022-11-24 16:08:17', NULL, '[]'),
(360, 'DUMMY', 360, '0360', 360, NULL, '395.0000', '395.0000', '25.0000', '493.7500', '493.7500', '2022-11-24 16:08:55', '2022-11-24 16:08:55', NULL, '[]'),
(361, 'DUMMY', 361, '0361', 361, NULL, '145.0000', '145.0000', '25.0000', '181.2500', '181.2500', '2022-11-24 16:09:40', '2022-11-24 16:09:40', NULL, '[]'),
(362, 'DUMMY', 362, '0362', 362, NULL, '145.0000', '145.0000', '25.0000', '181.2500', '181.2500', '2022-11-24 16:10:20', '2022-11-24 16:10:20', NULL, '[]'),
(363, 'DUMMY', 363, '0363', 363, NULL, '155.0000', '155.0000', '25.0000', '193.7500', '193.7500', '2022-11-24 16:10:57', '2022-11-24 16:10:57', NULL, '[]'),
(364, 'DUMMY', 364, '0364', 364, NULL, '155.0000', '155.0000', '25.0000', '193.7500', '193.7500', '2022-11-24 16:11:35', '2022-11-24 16:11:35', NULL, '[]'),
(365, 'DUMMY', 365, '0365', 365, NULL, '155.0000', '155.0000', '25.0000', '193.7500', '193.7500', '2022-11-24 16:12:12', '2022-11-24 16:12:12', NULL, '[]'),
(366, 'DUMMY', 366, '0366', 366, NULL, '300.0000', '300.0000', '25.0000', '375.0000', '375.0000', '2022-11-24 16:15:19', '2022-11-24 16:15:19', NULL, '[]'),
(367, 'DUMMY', 367, '0367', 367, NULL, '265.0000', '265.0000', '25.0000', '331.2500', '331.2500', '2022-11-24 16:15:54', '2022-11-24 16:15:54', NULL, '[]'),
(368, 'DUMMY', 368, '0368', 368, NULL, '475.0000', '475.0000', '25.0000', '593.7500', '593.7500', '2022-11-24 16:16:27', '2022-11-24 16:16:27', NULL, '[]'),
(369, 'DUMMY', 369, '0369', 369, NULL, '475.0000', '475.0000', '25.0000', '593.7500', '593.7500', '2022-11-24 16:17:05', '2022-11-24 16:17:05', NULL, '[]');
INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(370, 'DUMMY', 370, '0370', 370, NULL, '475.0000', '475.0000', '25.0000', '593.7500', '593.7500', '2022-11-24 16:17:40', '2022-11-24 16:17:40', NULL, '[]'),
(371, 'DUMMY', 371, '0371', 371, NULL, '475.0000', '475.0000', '25.0000', '593.7500', '593.7500', '2022-11-24 16:18:13', '2022-11-24 16:18:13', NULL, '[]'),
(372, 'DUMMY', 372, '0372', 372, NULL, '475.0000', '475.0000', '25.0000', '593.7500', '593.7500', '2022-11-24 16:19:02', '2022-11-24 16:19:02', NULL, '[]'),
(373, 'DUMMY', 373, '0373', 373, NULL, '125.0000', '125.0000', '25.0000', '156.2500', '156.2500', '2022-11-24 16:19:53', '2022-11-24 16:19:53', NULL, '[]'),
(375, 'DUMMY', 375, '0375', 375, NULL, '200.0000', '200.0000', '25.0000', '250.0000', '250.0000', '2022-11-26 10:35:26', '2022-11-26 11:24:09', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int UNSIGNED NOT NULL,
  `variation_id` int UNSIGNED NOT NULL,
  `price_group_id` int UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `product_variation_id` int UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int UNSIGNED NOT NULL,
  `location_id` int UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, '3.0000', '2022-11-13 20:47:10', '2022-11-26 15:14:51'),
(2, 2, 2, 2, 1, '10.0000', '2022-11-13 21:51:12', '2022-11-23 21:25:08'),
(3, 4, 4, 4, 1, '12.0000', '2022-11-13 21:56:25', '2022-11-13 21:56:25'),
(4, 5, 5, 5, 1, '11.0000', '2022-11-13 22:02:21', '2022-11-26 18:39:54'),
(5, 6, 6, 6, 1, '10.0000', '2022-11-13 22:17:10', '2022-11-23 21:36:02'),
(6, 7, 7, 7, 1, '6.0000', '2022-11-13 22:18:59', '2022-11-13 22:18:59'),
(7, 8, 8, 8, 1, '6.0000', '2022-11-13 22:20:26', '2022-11-13 22:20:26'),
(8, 9, 9, 9, 1, '6.0000', '2022-11-13 22:26:03', '2022-11-13 22:26:03'),
(9, 10, 10, 10, 1, '6.0000', '2022-11-13 22:28:14', '2022-11-13 22:28:14'),
(10, 11, 11, 11, 1, '6.0000', '2022-11-13 22:29:55', '2022-11-13 22:29:55'),
(11, 12, 12, 12, 1, '5.0000', '2022-11-13 22:30:55', '2022-11-23 21:25:08'),
(12, 13, 13, 13, 1, '12.0000', '2022-11-13 22:34:45', '2022-11-16 18:14:26'),
(13, 14, 14, 14, 1, '12.0000', '2022-11-13 22:36:06', '2022-11-13 22:36:06'),
(14, 15, 15, 15, 1, '6.0000', '2022-11-13 22:37:38', '2022-11-13 22:37:38'),
(15, 16, 16, 16, 1, '12.0000', '2022-11-13 22:38:51', '2022-11-13 22:38:51'),
(16, 17, 17, 17, 1, '6.0000', '2022-11-13 22:41:03', '2022-11-13 22:41:03'),
(17, 18, 18, 18, 1, '11.0000', '2022-11-13 22:43:20', '2022-11-23 21:36:02'),
(18, 19, 19, 19, 1, '12.0000', '2022-11-13 22:44:57', '2022-11-13 22:44:57'),
(19, 20, 20, 20, 1, '6.0000', '2022-11-13 22:45:49', '2022-11-13 22:45:49'),
(20, 21, 21, 21, 1, '12.0000', '2022-11-13 22:46:56', '2022-11-18 16:48:05'),
(21, 22, 22, 22, 1, '12.0000', '2022-11-13 22:50:00', '2022-11-13 22:50:00'),
(22, 23, 23, 23, 1, '12.0000', '2022-11-13 22:56:31', '2022-11-13 22:56:31'),
(23, 24, 24, 24, 1, '11.0000', '2022-11-13 22:57:34', '2022-11-23 21:25:08'),
(24, 25, 25, 25, 1, '12.0000', '2022-11-13 22:58:21', '2022-11-13 22:58:21'),
(25, 26, 26, 26, 1, '12.0000', '2022-11-13 22:59:33', '2022-11-13 22:59:33'),
(26, 27, 27, 27, 1, '12.0000', '2022-11-13 23:00:43', '2022-11-13 23:00:43'),
(27, 28, 28, 28, 1, '6.0000', '2022-11-13 23:01:59', '2022-11-13 23:01:59'),
(28, 29, 29, 29, 1, '6.0000', '2022-11-13 23:03:23', '2022-11-13 23:03:23'),
(29, 31, 31, 31, 1, '12.0000', '2022-11-13 23:09:27', '2022-11-13 23:09:27'),
(30, 32, 32, 32, 1, '6.0000', '2022-11-13 23:11:17', '2022-11-13 23:11:17'),
(31, 33, 33, 33, 1, '6.0000', '2022-11-13 23:13:16', '2022-11-13 23:13:16'),
(32, 34, 34, 34, 1, '12.0000', '2022-11-13 23:14:11', '2022-11-13 23:14:11'),
(33, 35, 35, 35, 1, '12.0000', '2022-11-13 23:15:21', '2022-11-13 23:15:21'),
(34, 36, 36, 36, 1, '12.0000', '2022-11-13 23:16:19', '2022-11-13 23:16:19'),
(35, 37, 37, 37, 1, '6.0000', '2022-11-13 23:17:16', '2022-11-13 23:17:16'),
(36, 38, 38, 38, 1, '6.0000', '2022-11-13 23:18:03', '2022-11-13 23:18:03'),
(37, 39, 39, 39, 1, '6.0000', '2022-11-13 23:18:47', '2022-11-13 23:18:47'),
(38, 40, 40, 40, 1, '6.0000', '2022-11-13 23:23:36', '2022-11-13 23:23:36'),
(39, 41, 41, 41, 1, '6.0000', '2022-11-13 23:25:09', '2022-11-13 23:25:09'),
(40, 42, 42, 42, 1, '4.0000', '2022-11-13 23:26:12', '2022-11-23 21:25:08'),
(41, 43, 43, 43, 1, '5.0000', '2022-11-13 23:27:05', '2022-11-26 18:39:54'),
(42, 44, 44, 44, 1, '6.0000', '2022-11-13 23:28:02', '2022-11-13 23:28:02'),
(43, 45, 45, 45, 1, '12.0000', '2022-11-13 23:29:02', '2022-11-13 23:29:02'),
(44, 46, 46, 46, 1, '6.0000', '2022-11-13 23:29:53', '2022-11-13 23:29:53'),
(45, 47, 47, 47, 1, '6.0000', '2022-11-13 23:30:49', '2022-11-13 23:30:49'),
(46, 48, 48, 48, 1, '6.0000', '2022-11-13 23:32:04', '2022-11-13 23:32:04'),
(47, 49, 49, 49, 1, '12.0000', '2022-11-13 23:32:56', '2022-11-13 23:32:56'),
(48, 50, 50, 50, 1, '12.0000', '2022-11-13 23:36:09', '2022-11-13 23:36:09'),
(49, 51, 51, 51, 1, '6.0000', '2022-11-13 23:37:02', '2022-11-13 23:37:02'),
(50, 52, 52, 52, 1, '36.0000', '2022-11-13 23:38:10', '2022-11-13 23:38:10'),
(51, 53, 53, 53, 1, '6.0000', '2022-11-13 23:39:03', '2022-11-13 23:39:03'),
(52, 54, 54, 54, 1, '3.0000', '2022-11-13 23:39:52', '2022-11-13 23:39:52'),
(53, 55, 55, 55, 1, '12.0000', '2022-11-13 23:40:46', '2022-11-13 23:40:46'),
(54, 56, 56, 56, 1, '6.0000', '2022-11-13 23:41:55', '2022-11-13 23:41:55'),
(55, 57, 57, 57, 1, '6.0000', '2022-11-13 23:44:25', '2022-11-13 23:44:25'),
(56, 58, 58, 58, 1, '6.0000', '2022-11-13 23:46:43', '2022-11-13 23:46:43'),
(57, 59, 59, 59, 1, '6.0000', '2022-11-13 23:47:52', '2022-11-13 23:47:52'),
(58, 60, 60, 60, 1, '6.0000', '2022-11-13 23:48:46', '2022-11-13 23:48:46'),
(59, 61, 61, 61, 1, '6.0000', '2022-11-13 23:49:37', '2022-11-13 23:49:37'),
(60, 62, 62, 62, 1, '12.0000', '2022-11-13 23:51:01', '2022-11-13 23:51:01'),
(61, 63, 63, 63, 1, '6.0000', '2022-11-13 23:52:11', '2022-11-13 23:52:11'),
(62, 64, 64, 64, 1, '6.0000', '2022-11-13 23:53:03', '2022-11-13 23:53:03'),
(63, 65, 65, 65, 1, '6.0000', '2022-11-13 23:54:21', '2022-11-13 23:54:21'),
(64, 66, 66, 66, 1, '12.0000', '2022-11-13 23:55:30', '2022-11-13 23:55:30'),
(65, 67, 67, 67, 1, '6.0000', '2022-11-13 23:57:23', '2022-11-13 23:57:23'),
(66, 68, 68, 68, 1, '18.0000', '2022-11-14 00:05:50', '2022-11-14 00:05:50'),
(67, 69, 69, 69, 1, '18.0000', '2022-11-14 00:06:58', '2022-11-14 00:06:58'),
(68, 70, 70, 70, 1, '6.0000', '2022-11-14 00:08:46', '2022-11-14 00:08:46'),
(69, 71, 71, 71, 1, '6.0000', '2022-11-14 00:09:38', '2022-11-14 00:09:38'),
(70, 72, 72, 72, 1, '6.0000', '2022-11-14 00:10:34', '2022-11-14 00:10:34'),
(71, 73, 73, 73, 1, '6.0000', '2022-11-14 00:11:23', '2022-11-14 00:11:23'),
(72, 74, 74, 74, 1, '6.0000', '2022-11-14 00:14:56', '2022-11-14 00:14:56'),
(73, 75, 75, 75, 1, '6.0000', '2022-11-14 00:15:46', '2022-11-14 00:15:46'),
(74, 76, 76, 76, 1, '6.0000', '2022-11-14 00:17:13', '2022-11-14 00:17:13'),
(75, 77, 77, 77, 1, '6.0000', '2022-11-14 00:18:19', '2022-11-14 00:18:19'),
(76, 78, 78, 78, 1, '3.0000', '2022-11-14 00:19:19', '2022-11-14 00:19:19'),
(77, 79, 79, 79, 1, '6.0000', '2022-11-14 00:20:20', '2022-11-14 00:20:20'),
(78, 80, 80, 80, 1, '18.0000', '2022-11-14 00:22:52', '2022-11-14 00:22:52'),
(79, 81, 81, 81, 1, '6.0000', '2022-11-14 00:23:44', '2022-11-14 00:23:44'),
(80, 82, 82, 82, 1, '6.0000', '2022-11-14 00:24:39', '2022-11-14 00:24:39'),
(81, 83, 83, 83, 1, '3.0000', '2022-11-14 00:25:31', '2022-11-14 00:25:31'),
(82, 84, 84, 84, 1, '12.0000', '2022-11-14 00:26:15', '2022-11-14 00:26:15'),
(83, 85, 85, 85, 1, '12.0000', '2022-11-14 00:26:53', '2022-11-14 00:26:53'),
(84, 86, 86, 86, 1, '12.0000', '2022-11-14 00:27:42', '2022-11-14 00:27:42'),
(85, 87, 87, 87, 1, '6.0000', '2022-11-14 00:29:18', '2022-11-14 00:29:18'),
(86, 88, 88, 88, 1, '6.0000', '2022-11-14 00:30:16', '2022-11-14 00:30:16'),
(87, 89, 89, 89, 1, '6.0000', '2022-11-14 00:30:54', '2022-11-14 00:30:54'),
(88, 90, 90, 90, 1, '6.0000', '2022-11-14 00:32:28', '2022-11-14 00:32:28'),
(89, 91, 91, 91, 1, '6.0000', '2022-11-14 00:33:30', '2022-11-14 00:33:30'),
(90, 92, 92, 92, 1, '6.0000', '2022-11-14 00:34:22', '2022-11-14 00:34:22'),
(91, 93, 93, 93, 1, '12.0000', '2022-11-14 00:35:30', '2022-11-14 00:35:30'),
(92, 94, 94, 94, 1, '12.0000', '2022-11-14 00:36:15', '2022-11-26 19:38:48'),
(93, 95, 95, 95, 1, '12.0000', '2022-11-14 00:36:57', '2022-11-26 17:46:30'),
(94, 96, 96, 96, 1, '11.0000', '2022-11-14 00:37:48', '2022-11-26 18:39:54'),
(95, 97, 97, 97, 1, '6.0000', '2022-11-14 00:38:41', '2022-11-14 00:38:41'),
(96, 98, 98, 98, 1, '2.0000', '2022-11-14 00:39:29', '2022-11-14 00:39:29'),
(97, 99, 99, 99, 1, '12.0000', '2022-11-14 00:40:21', '2022-11-16 18:06:42'),
(98, 100, 100, 100, 1, '6.0000', '2022-11-14 00:41:11', '2022-11-14 00:41:11'),
(99, 101, 101, 101, 1, '6.0000', '2022-11-14 00:42:01', '2022-11-14 00:42:01'),
(100, 102, 102, 102, 1, '4.0000', '2022-11-14 00:42:48', '2022-11-26 15:14:51'),
(101, 103, 103, 103, 1, '6.0000', '2022-11-14 00:43:36', '2022-11-14 00:43:36'),
(102, 104, 104, 104, 1, '6.0000', '2022-11-14 00:44:51', '2022-11-14 00:44:51'),
(103, 105, 105, 105, 1, '12.0000', '2022-11-14 00:45:56', '2022-11-14 00:45:56'),
(104, 106, 106, 106, 1, '6.0000', '2022-11-14 00:46:50', '2022-11-14 00:46:50'),
(105, 107, 107, 107, 1, '6.0000', '2022-11-14 00:47:36', '2022-11-14 00:47:36'),
(106, 108, 108, 108, 1, '24.0000', '2022-11-16 14:27:34', '2022-11-16 14:27:34'),
(107, 109, 109, 109, 1, '12.0000', '2022-11-16 14:28:47', '2022-11-16 14:28:47'),
(108, 110, 110, 110, 1, '12.0000', '2022-11-16 14:33:36', '2022-11-16 14:33:36'),
(109, 111, 111, 111, 1, '12.0000', '2022-11-16 14:35:18', '2022-11-16 14:35:18'),
(110, 112, 112, 112, 1, '24.0000', '2022-11-16 14:36:27', '2022-11-16 14:36:27'),
(111, 113, 113, 113, 1, '36.0000', '2022-11-16 14:37:59', '2022-11-16 14:37:59'),
(112, 114, 114, 114, 1, '12.0000', '2022-11-16 14:39:07', '2022-11-16 14:39:07'),
(113, 115, 115, 115, 1, '144.0000', '2022-11-16 14:46:31', '2022-11-16 14:52:53'),
(114, 116, 116, 116, 1, '12.0000', '2022-11-16 14:48:31', '2022-11-16 14:48:31'),
(115, 117, 117, 117, 1, '82.0000', '2022-11-16 15:04:14', '2022-11-18 13:38:47'),
(116, 118, 118, 118, 1, '36.0000', '2022-11-16 15:07:46', '2022-11-16 15:07:46'),
(117, 119, 119, 119, 1, '24.0000', '2022-11-16 15:10:19', '2022-11-16 15:10:19'),
(118, 120, 120, 120, 1, '12.0000', '2022-11-16 15:13:54', '2022-11-16 15:13:54'),
(119, 121, 121, 121, 1, '6.0000', '2022-11-16 15:14:44', '2022-11-16 15:14:44'),
(120, 122, 122, 122, 1, '24.0000', '2022-11-16 15:15:39', '2022-11-16 15:15:39'),
(121, 123, 123, 123, 1, '20.0000', '2022-11-16 15:19:13', '2022-11-16 15:19:13'),
(122, 124, 124, 124, 1, '20.0000', '2022-11-16 15:19:59', '2022-11-16 15:19:59'),
(123, 125, 125, 125, 1, '12.0000', '2022-11-16 15:21:09', '2022-11-16 15:21:09'),
(124, 126, 126, 126, 1, '12.0000', '2022-11-16 15:22:11', '2022-11-16 15:22:11'),
(125, 127, 127, 127, 1, '60.0000', '2022-11-16 15:23:58', '2022-11-16 15:23:58'),
(126, 128, 128, 128, 1, '12.0000', '2022-11-16 15:30:48', '2022-11-16 15:30:48'),
(127, 129, 129, 129, 1, '12.0000', '2022-11-16 15:31:44', '2022-11-16 15:31:44'),
(128, 130, 130, 130, 1, '6.0000', '2022-11-16 15:35:42', '2022-11-16 15:35:42'),
(129, 131, 131, 131, 1, '5.0000', '2022-11-16 15:36:31', '2022-11-26 18:23:50'),
(130, 132, 132, 132, 1, '6.0000', '2022-11-16 15:40:08', '2022-11-16 15:41:34'),
(131, 133, 133, 133, 1, '12.0000', '2022-11-16 15:43:59', '2022-11-16 15:47:53'),
(132, 134, 134, 134, 1, '12.0000', '2022-11-16 15:45:50', '2022-11-16 15:45:50'),
(133, 135, 135, 135, 1, '6.0000', '2022-11-16 15:49:18', '2022-11-16 15:49:18'),
(134, 136, 136, 136, 1, '3.0000', '2022-11-16 15:51:28', '2022-11-16 15:51:28'),
(135, 137, 137, 137, 1, '24.0000', '2022-11-16 15:53:26', '2022-11-16 15:53:26'),
(136, 138, 138, 138, 1, '12.0000', '2022-11-16 15:55:14', '2022-11-16 15:55:14'),
(137, 139, 139, 139, 1, '6.0000', '2022-11-16 16:00:00', '2022-11-16 16:00:00'),
(138, 140, 140, 140, 1, '6.0000', '2022-11-16 16:00:34', '2022-11-16 16:00:34'),
(139, 141, 141, 141, 1, '24.0000', '2022-11-16 16:03:04', '2022-11-16 16:05:02'),
(140, 142, 142, 142, 1, '12.0000', '2022-11-16 16:04:12', '2022-11-16 16:04:12'),
(141, 143, 143, 143, 1, '11.0000', '2022-11-16 16:07:07', '2022-11-26 18:39:54'),
(142, 144, 144, 144, 1, '12.0000', '2022-11-16 16:09:00', '2022-11-16 16:09:00'),
(143, 145, 145, 145, 1, '12.0000', '2022-11-16 16:13:27', '2022-11-16 16:13:27'),
(144, 146, 146, 146, 1, '12.0000', '2022-11-16 16:14:30', '2022-11-16 16:14:30'),
(145, 147, 147, 147, 1, '12.0000', '2022-11-16 16:16:23', '2022-11-16 16:16:23'),
(146, 148, 148, 148, 1, '24.0000', '2022-11-16 16:17:17', '2022-11-16 16:17:17'),
(147, 149, 149, 149, 1, '12.0000', '2022-11-16 16:19:37', '2022-11-16 16:19:37'),
(148, 150, 150, 150, 1, '12.0000', '2022-11-16 16:20:41', '2022-11-16 16:20:41'),
(149, 151, 151, 151, 1, '12.0000', '2022-11-16 16:24:21', '2022-11-16 16:24:21'),
(150, 152, 152, 152, 1, '12.0000', '2022-11-16 16:25:27', '2022-11-16 16:25:27'),
(151, 153, 153, 153, 1, '12.0000', '2022-11-16 16:26:46', '2022-11-16 16:26:46'),
(152, 154, 154, 154, 1, '24.0000', '2022-11-16 16:28:23', '2022-11-16 16:30:47'),
(153, 155, 155, 155, 1, '12.0000', '2022-11-16 16:29:49', '2022-11-16 16:29:49'),
(154, 156, 156, 156, 1, '12.0000', '2022-11-16 16:31:30', '2022-11-16 16:31:30'),
(155, 157, 157, 157, 1, '12.0000', '2022-11-16 16:33:34', '2022-11-16 16:33:34'),
(156, 158, 158, 158, 1, '12.0000', '2022-11-16 16:34:16', '2022-11-16 16:34:16'),
(157, 159, 159, 159, 1, '12.0000', '2022-11-16 16:48:31', '2022-11-16 16:48:31'),
(158, 160, 160, 160, 1, '12.0000', '2022-11-16 16:49:45', '2022-11-16 16:49:45'),
(159, 161, 161, 161, 1, '12.0000', '2022-11-16 16:50:29', '2022-11-16 16:50:29'),
(160, 162, 162, 162, 1, '12.0000', '2022-11-16 16:51:11', '2022-11-16 16:51:11'),
(161, 163, 163, 163, 1, '12.0000', '2022-11-16 16:51:46', '2022-11-16 16:51:46'),
(162, 164, 164, 164, 1, '24.0000', '2022-11-16 16:56:59', '2022-11-16 16:56:59'),
(163, 165, 165, 165, 1, '12.0000', '2022-11-16 16:58:02', '2022-11-16 16:58:02'),
(164, 166, 166, 166, 1, '12.0000', '2022-11-16 17:01:23', '2022-11-16 17:01:23'),
(165, 167, 167, 167, 1, '12.0000', '2022-11-16 17:02:33', '2022-11-16 17:02:33'),
(166, 168, 168, 168, 1, '12.0000', '2022-11-16 17:03:09', '2022-11-16 17:03:09'),
(167, 169, 169, 169, 1, '12.0000', '2022-11-16 17:04:22', '2022-11-16 17:04:22'),
(168, 170, 170, 170, 1, '48.0000', '2022-11-16 17:06:47', '2022-11-16 17:06:47'),
(169, 171, 171, 171, 1, '24.0000', '2022-11-16 17:11:35', '2022-11-16 17:11:35'),
(170, 172, 172, 172, 1, '12.0000', '2022-11-16 17:13:32', '2022-11-16 17:13:32'),
(171, 173, 173, 173, 1, '12.0000', '2022-11-16 17:15:26', '2022-11-16 17:15:26'),
(172, 174, 174, 174, 1, '12.0000', '2022-11-16 17:16:33', '2022-11-16 17:16:33'),
(173, 175, 175, 175, 1, '12.0000', '2022-11-16 17:20:44', '2022-11-16 17:20:44'),
(174, 176, 176, 176, 1, '12.0000', '2022-11-16 17:21:59', '2022-11-16 17:21:59'),
(175, 177, 177, 177, 1, '12.0000', '2022-11-16 17:31:53', '2022-11-16 17:31:53'),
(176, 178, 178, 178, 1, '24.0000', '2022-11-16 17:33:30', '2022-11-16 17:33:30'),
(177, 179, 179, 179, 1, '12.0000', '2022-11-16 17:35:26', '2022-11-16 17:35:26'),
(178, 180, 180, 180, 1, '12.0000', '2022-11-16 17:36:05', '2022-11-16 17:36:05'),
(179, 30, 30, 30, 1, '12.0000', '2022-11-16 18:11:19', '2022-11-16 18:11:19'),
(221, 223, 223, 223, 1, '10.0000', '2022-11-18 09:32:30', '2022-11-18 09:32:30'),
(222, 224, 224, 224, 1, '10.0000', '2022-11-18 09:33:24', '2022-11-18 09:33:24'),
(223, 225, 225, 225, 1, '10.0000', '2022-11-18 09:34:17', '2022-11-18 09:34:17'),
(224, 226, 226, 226, 1, '10.0000', '2022-11-18 09:34:59', '2022-11-18 09:34:59'),
(225, 227, 227, 227, 1, '10.0000', '2022-11-18 09:35:42', '2022-11-18 09:35:42'),
(226, 228, 228, 228, 1, '20.0000', '2022-11-18 09:37:51', '2022-11-18 09:41:23'),
(227, 229, 229, 229, 1, '20.0000', '2022-11-18 09:38:59', '2022-11-18 09:38:59'),
(228, 230, 230, 230, 1, '10.0000', '2022-11-18 09:40:02', '2022-11-18 09:40:02'),
(229, 231, 231, 231, 1, '10.0000', '2022-11-18 09:46:40', '2022-11-18 09:46:40'),
(230, 232, 232, 232, 1, '20.0000', '2022-11-18 09:47:46', '2022-11-18 09:47:46'),
(231, 233, 233, 233, 1, '20.0000', '2022-11-18 09:49:44', '2022-11-18 09:49:44'),
(232, 234, 234, 234, 1, '10.0000', '2022-11-18 09:50:36', '2022-11-18 09:50:36'),
(233, 235, 235, 235, 1, '10.0000', '2022-11-18 09:51:32', '2022-11-18 09:51:32'),
(234, 236, 236, 236, 1, '10.0000', '2022-11-18 09:52:20', '2022-11-18 09:52:20'),
(235, 237, 237, 237, 1, '10.0000', '2022-11-18 09:53:03', '2022-11-18 09:53:03'),
(236, 238, 238, 238, 1, '10.0000', '2022-11-18 09:54:12', '2022-11-18 09:54:12'),
(237, 239, 239, 239, 1, '10.0000', '2022-11-18 09:54:59', '2022-11-18 09:54:59'),
(238, 240, 240, 240, 1, '10.0000', '2022-11-18 09:56:37', '2022-11-18 09:56:37'),
(239, 241, 241, 241, 1, '20.0000', '2022-11-18 09:57:22', '2022-11-18 09:57:22'),
(240, 242, 242, 242, 1, '10.0000', '2022-11-18 09:58:03', '2022-11-18 09:58:03'),
(241, 243, 243, 243, 1, '10.0000', '2022-11-18 09:59:45', '2022-11-18 09:59:45'),
(242, 244, 244, 244, 1, '10.0000', '2022-11-18 10:00:28', '2022-11-18 10:00:28'),
(243, 245, 245, 245, 1, '10.0000', '2022-11-18 10:01:25', '2022-11-18 10:01:25'),
(244, 246, 246, 246, 1, '10.0000', '2022-11-18 10:02:10', '2022-11-18 10:02:10'),
(245, 247, 247, 247, 1, '10.0000', '2022-11-18 10:03:00', '2022-11-18 10:03:00'),
(246, 248, 248, 248, 1, '10.0000', '2022-11-18 10:03:45', '2022-11-18 10:03:45'),
(247, 249, 249, 249, 1, '10.0000', '2022-11-18 10:07:40', '2022-11-18 10:07:40'),
(248, 250, 250, 250, 1, '10.0000', '2022-11-18 10:08:34', '2022-11-18 10:08:34'),
(249, 251, 251, 251, 1, '10.0000', '2022-11-18 10:10:09', '2022-11-18 10:10:09'),
(250, 252, 252, 252, 1, '20.0000', '2022-11-18 10:10:52', '2022-11-18 10:10:52'),
(251, 253, 253, 253, 1, '20.0000', '2022-11-18 10:11:25', '2022-11-18 10:11:25'),
(252, 254, 254, 254, 1, '10.0000', '2022-11-18 10:11:57', '2022-11-18 10:11:57'),
(253, 255, 255, 255, 1, '10.0000', '2022-11-18 10:12:49', '2022-11-18 10:12:49'),
(254, 256, 256, 256, 1, '10.0000', '2022-11-18 10:13:28', '2022-11-18 10:13:28'),
(255, 257, 257, 257, 1, '13.0000', '2022-11-18 10:14:03', '2022-11-18 12:44:45'),
(256, 258, 258, 258, 1, '10.0000', '2022-11-18 10:14:34', '2022-11-18 10:14:34'),
(257, 259, 259, 259, 1, '20.0000', '2022-11-18 10:15:24', '2022-11-18 10:15:24'),
(258, 260, 260, 260, 1, '20.0000', '2022-11-18 10:16:02', '2022-11-18 10:16:02'),
(259, 261, 261, 261, 1, '10.0000', '2022-11-18 10:16:45', '2022-11-18 10:16:45'),
(260, 262, 262, 262, 1, '10.0000', '2022-11-18 10:17:17', '2022-11-18 10:17:17'),
(261, 263, 263, 263, 1, '10.0000', '2022-11-18 10:18:06', '2022-11-18 10:18:06'),
(262, 264, 264, 264, 1, '10.0000', '2022-11-18 10:18:41', '2022-11-18 10:18:41'),
(263, 265, 265, 265, 1, '10.0000', '2022-11-18 10:19:21', '2022-11-18 10:19:21'),
(264, 266, 266, 266, 1, '10.0000', '2022-11-18 10:19:59', '2022-11-18 10:19:59'),
(265, 267, 267, 267, 1, '4.0000', '2022-11-18 10:29:42', '2022-11-24 16:13:38'),
(266, 268, 268, 268, 1, '1.0000', '2022-11-18 10:30:24', '2022-11-18 10:30:24'),
(267, 269, 269, 269, 1, '1.0000', '2022-11-18 10:31:13', '2022-11-18 10:31:13'),
(268, 270, 270, 270, 1, '2.0000', '2022-11-18 10:32:15', '2022-11-24 16:14:11'),
(269, 271, 271, 271, 1, '2.0000', '2022-11-18 10:33:41', '2022-11-18 10:33:41'),
(270, 272, 272, 272, 1, '2.0000', '2022-11-18 10:34:09', '2022-11-18 10:34:09'),
(271, 273, 273, 273, 1, '2.0000', '2022-11-18 10:34:39', '2022-11-18 10:34:39'),
(272, 274, 274, 274, 1, '2.0000', '2022-11-18 10:35:09', '2022-11-18 10:35:09'),
(273, 275, 275, 275, 1, '2.0000', '2022-11-18 10:35:55', '2022-11-18 10:35:55'),
(274, 276, 276, 276, 1, '1.0000', '2022-11-18 10:38:07', '2022-11-18 10:38:07'),
(275, 277, 277, 277, 1, '1.0000', '2022-11-18 10:38:42', '2022-11-18 10:38:42'),
(276, 278, 278, 278, 1, '1.0000', '2022-11-18 10:39:16', '2022-11-18 10:39:16'),
(277, 279, 279, 279, 1, '1.0000', '2022-11-18 10:39:43', '2022-11-18 10:39:43'),
(278, 280, 280, 280, 1, '1.0000', '2022-11-18 10:40:14', '2022-11-18 10:40:14'),
(279, 281, 281, 281, 1, '5.0000', '2022-11-18 10:41:55', '2022-11-18 10:41:55'),
(280, 282, 282, 282, 1, '3.0000', '2022-11-18 10:43:44', '2022-11-18 10:43:44'),
(281, 283, 283, 283, 1, '2.0000', '2022-11-18 10:45:50', '2022-11-18 10:45:50'),
(282, 284, 284, 284, 1, '1.0000', '2022-11-18 10:48:45', '2022-11-18 10:48:45'),
(283, 285, 285, 285, 1, '2.0000', '2022-11-18 10:49:13', '2022-11-18 10:49:13'),
(284, 286, 286, 286, 1, '1.0000', '2022-11-18 10:50:45', '2022-11-18 10:50:45'),
(285, 287, 287, 287, 1, '1.0000', '2022-11-18 10:51:12', '2022-11-18 10:51:12'),
(286, 288, 288, 288, 1, '1.0000', '2022-11-18 10:51:48', '2022-11-18 10:51:48'),
(287, 289, 289, 289, 1, '1.0000', '2022-11-18 10:52:38', '2022-11-18 10:52:38'),
(288, 290, 290, 290, 1, '1.0000', '2022-11-18 10:53:03', '2022-11-18 10:53:03'),
(289, 291, 291, 291, 1, '1.0000', '2022-11-18 10:54:01', '2022-11-18 10:54:01'),
(290, 292, 292, 292, 1, '2.0000', '2022-11-18 10:54:26', '2022-11-18 10:54:26'),
(291, 293, 293, 293, 1, '2.0000', '2022-11-18 10:54:54', '2022-11-18 10:54:54'),
(292, 294, 294, 294, 1, '2.0000', '2022-11-18 10:56:07', '2022-11-18 10:57:11'),
(293, 295, 295, 295, 1, '1.0000', '2022-11-18 10:56:45', '2022-11-18 10:56:45'),
(294, 296, 296, 296, 1, '2.0000', '2022-11-18 10:59:55', '2022-11-18 10:59:55'),
(295, 297, 297, 297, 1, '1.0000', '2022-11-18 11:01:15', '2022-11-18 11:01:15'),
(296, 298, 298, 298, 1, '1.0000', '2022-11-18 11:01:49', '2022-11-18 11:01:49'),
(297, 299, 299, 299, 1, '1.0000', '2022-11-18 11:02:21', '2022-11-18 11:02:21'),
(298, 300, 300, 300, 1, '1.0000', '2022-11-18 11:03:34', '2022-11-18 11:03:34'),
(299, 301, 301, 301, 1, '1.0000', '2022-11-18 11:03:58', '2022-11-18 11:03:58'),
(300, 302, 302, 302, 1, '1.0000', '2022-11-18 11:04:50', '2022-11-18 11:04:50'),
(301, 303, 303, 303, 1, '1.0000', '2022-11-18 11:06:41', '2022-11-18 11:06:41'),
(302, 304, 304, 304, 1, '1.0000', '2022-11-18 11:08:26', '2022-11-18 11:08:26'),
(303, 305, 305, 305, 1, '1.0000', '2022-11-18 11:08:54', '2022-11-18 11:08:54'),
(304, 306, 306, 306, 1, '1.0000', '2022-11-18 11:09:26', '2022-11-18 11:09:26'),
(305, 307, 307, 307, 1, '1.0000', '2022-11-18 11:10:17', '2022-11-18 11:10:17'),
(306, 308, 308, 308, 1, '1.0000', '2022-11-18 11:11:10', '2022-11-18 11:11:10'),
(307, 309, 309, 309, 1, '3.0000', '2022-11-18 11:13:38', '2022-11-18 11:15:03'),
(308, 310, 310, 310, 1, '1.0000', '2022-11-18 11:14:10', '2022-11-26 17:59:54'),
(309, 311, 311, 311, 1, '1.0000', '2022-11-18 11:14:35', '2022-11-18 11:14:35'),
(310, 312, 312, 312, 1, '1.0000', '2022-11-18 11:16:01', '2022-11-18 11:16:01'),
(311, 313, 313, 313, 1, '1.0000', '2022-11-18 11:16:29', '2022-11-18 11:16:29'),
(312, 314, 314, 314, 1, '2.0000', '2022-11-18 11:16:56', '2022-11-18 11:16:56'),
(313, 315, 315, 315, 1, '1.0000', '2022-11-18 11:17:26', '2022-11-18 11:17:26'),
(314, 316, 316, 316, 1, '5.0000', '2022-11-18 11:18:43', '2022-11-18 11:18:43'),
(315, 317, 317, 317, 1, '3.0000', '2022-11-18 11:20:15', '2022-11-18 11:20:15'),
(316, 318, 318, 318, 1, '3.0000', '2022-11-18 11:21:04', '2022-11-18 11:21:04'),
(317, 319, 319, 319, 1, '1.0000', '2022-11-18 11:22:31', '2022-11-18 11:22:31'),
(318, 320, 320, 320, 1, '3.0000', '2022-11-18 11:23:14', '2022-11-18 11:23:14'),
(319, 321, 321, 321, 1, '8.0000', '2022-11-18 11:25:19', '2022-11-24 16:14:49'),
(320, 322, 322, 322, 1, '2.0000', '2022-11-18 11:26:05', '2022-11-18 11:26:05'),
(321, 323, 323, 323, 1, '3.0000', '2022-11-18 11:29:04', '2022-11-18 11:29:04'),
(322, 324, 324, 324, 1, '2.0000', '2022-11-18 11:29:50', '2022-11-18 11:29:50'),
(323, 325, 325, 325, 1, '2.0000', '2022-11-18 11:31:15', '2022-11-18 11:31:15'),
(324, 326, 326, 326, 1, '2.0000', '2022-11-18 11:31:36', '2022-11-18 11:31:36'),
(325, 327, 327, 327, 1, '1.0000', '2022-11-18 11:32:06', '2022-11-18 11:32:06'),
(326, 328, 328, 328, 1, '1.0000', '2022-11-18 11:36:20', '2022-11-18 11:36:20'),
(327, 329, 329, 329, 1, '2.0000', '2022-11-18 11:37:12', '2022-11-18 11:37:12'),
(328, 330, 330, 330, 1, '1.0000', '2022-11-18 11:37:46', '2022-11-18 11:37:46'),
(329, 331, 331, 331, 1, '2.0000', '2022-11-18 11:38:13', '2022-11-18 11:38:13'),
(330, 332, 332, 332, 1, '2.0000', '2022-11-18 11:39:18', '2022-11-18 11:39:18'),
(331, 333, 333, 333, 1, '3.0000', '2022-11-18 11:39:48', '2022-11-18 11:39:48'),
(332, 334, 334, 334, 1, '3.0000', '2022-11-18 11:42:17', '2022-11-18 11:42:17'),
(333, 335, 335, 335, 1, '2.0000', '2022-11-18 11:43:17', '2022-11-18 11:43:17'),
(334, 336, 336, 336, 1, '3.0000', '2022-11-18 13:48:10', '2022-11-18 13:48:10'),
(335, 337, 337, 337, 1, '1.0000', '2022-11-24 13:11:32', '2022-11-24 13:11:32'),
(336, 338, 338, 338, 1, '3.0000', '2022-11-24 13:12:12', '2022-11-24 13:12:12'),
(337, 339, 339, 339, 1, '6.0000', '2022-11-24 13:13:15', '2022-11-24 13:13:15'),
(338, 340, 340, 340, 1, '4.0000', '2022-11-24 13:14:00', '2022-11-24 13:14:00'),
(339, 341, 341, 341, 1, '1.0000', '2022-11-24 13:17:03', '2022-11-24 13:17:03'),
(340, 342, 342, 342, 1, '4.0000', '2022-11-24 13:17:44', '2022-11-24 13:17:44'),
(341, 343, 343, 343, 1, '6.0000', '2022-11-24 13:18:29', '2022-11-24 13:18:29'),
(342, 344, 344, 344, 1, '6.0000', '2022-11-24 15:57:29', '2022-11-24 15:57:29'),
(343, 345, 345, 345, 1, '3.0000', '2022-11-24 15:58:26', '2022-11-24 15:58:26'),
(344, 346, 346, 346, 1, '6.0000', '2022-11-24 15:59:03', '2022-11-24 15:59:03'),
(345, 347, 347, 347, 1, '1.0000', '2022-11-24 15:59:49', '2022-11-24 15:59:49'),
(346, 348, 348, 348, 1, '6.0000', '2022-11-24 16:00:27', '2022-11-24 16:00:27'),
(347, 349, 349, 349, 1, '6.0000', '2022-11-24 16:01:04', '2022-11-24 16:01:04'),
(348, 350, 350, 350, 1, '4.0000', '2022-11-24 16:01:39', '2022-11-24 16:01:39'),
(349, 351, 351, 351, 1, '4.0000', '2022-11-24 16:02:16', '2022-11-24 16:02:16'),
(350, 352, 352, 352, 1, '6.0000', '2022-11-24 16:02:55', '2022-11-24 16:02:55'),
(351, 353, 353, 353, 1, '4.0000', '2022-11-24 16:03:38', '2022-11-24 16:03:38'),
(352, 354, 354, 354, 1, '2.0000', '2022-11-24 16:04:25', '2022-11-24 16:04:25'),
(353, 355, 355, 355, 1, '6.0000', '2022-11-24 16:05:13', '2022-11-24 16:05:13'),
(354, 356, 356, 356, 1, '2.0000', '2022-11-24 16:05:51', '2022-11-24 16:05:51'),
(355, 357, 357, 357, 1, '1.0000', '2022-11-24 16:06:47', '2022-11-24 16:06:47'),
(356, 358, 358, 358, 1, '2.0000', '2022-11-24 16:07:40', '2022-11-24 16:07:40'),
(357, 359, 359, 359, 1, '2.0000', '2022-11-24 16:08:23', '2022-11-24 16:08:23'),
(358, 360, 360, 360, 1, '1.0000', '2022-11-24 16:09:01', '2022-11-24 16:09:01'),
(359, 361, 361, 361, 1, '4.0000', '2022-11-24 16:09:46', '2022-11-24 16:09:46'),
(360, 362, 362, 362, 1, '2.0000', '2022-11-24 16:10:27', '2022-11-24 16:10:27'),
(361, 363, 363, 363, 1, '2.0000', '2022-11-24 16:11:03', '2022-11-24 16:11:03'),
(362, 364, 364, 364, 1, '2.0000', '2022-11-24 16:11:41', '2022-11-24 16:11:41'),
(363, 365, 365, 365, 1, '2.0000', '2022-11-24 16:12:19', '2022-11-24 16:12:19'),
(364, 366, 366, 366, 1, '2.0000', '2022-11-24 16:15:25', '2022-11-24 16:15:25'),
(365, 367, 367, 367, 1, '1.0000', '2022-11-24 16:16:01', '2022-11-24 16:16:01'),
(366, 368, 368, 368, 1, '1.0000', '2022-11-24 16:16:33', '2022-11-24 16:16:33'),
(367, 369, 369, 369, 1, '2.0000', '2022-11-24 16:17:11', '2022-11-24 16:17:11'),
(368, 370, 370, 370, 1, '1.0000', '2022-11-24 16:17:46', '2022-11-24 16:17:46'),
(369, 371, 371, 371, 1, '2.0000', '2022-11-24 16:18:18', '2022-11-24 16:18:18'),
(370, 372, 372, 372, 1, '2.0000', '2022-11-24 16:19:07', '2022-11-24 16:19:07'),
(371, 373, 373, 373, 1, '2.0000', '2022-11-24 16:20:00', '2022-11-24 16:20:00'),
(373, 375, 375, 375, 1, '1.0000', '2022-11-26 10:35:36', '2022-11-26 11:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `duration` int NOT NULL,
  `duration_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`);

--
-- Indexes for table `categorizables`
--
ALTER TABLE `categorizables`
  ADD KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_type_index` (`type`),
  ADD KEY `contacts_contact_status_index` (`contact_status`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_configurations_business_id_foreign` (`business_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`);

--
-- Indexes for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`),
  ADD KEY `users_user_type_index` (`user_type`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=375;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=385;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=374;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
