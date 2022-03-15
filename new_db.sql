-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2022 at 06:30 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `milk`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(7, 'MilkProd', 'milkprod', 'active', '2022-03-02 06:22:10', '2022-03-02 06:22:10'),
(8, 'Metallic', 'metallic', 'active', '2022-03-03 12:24:54', '2022-03-03 12:24:54'),
(9, 'Milk Cap', 'milk-cap', 'active', '2022-03-03 12:25:24', '2022-03-03 12:25:24'),
(10, 'JOJOBA', 'jojoba', 'active', '2022-03-03 12:25:46', '2022-03-03 12:25:46'),
(11, 'Milk cool', 'milk-cool', 'active', '2022-03-04 22:00:23', '2022-03-04 22:00:23'),
(12, 'milku', 'milku', 'active', '2022-03-04 22:00:34', '2022-03-04 22:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(19, 11, 9, 30, 69.00, 'new', 7, 483.00, '2022-03-02 11:47:38', '2022-03-02 22:39:17'),
(22, 15, NULL, 1, 1400.00, 'new', 1, 1400.00, '2022-03-05 22:24:02', '2022-03-05 22:24:02');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(12, 'Fresh Milk', 'fresh-milk', '<p>This is Fresh milk</p>', '/storage/photos/1/mitions-logo.png', 1, NULL, NULL, 'active', '2022-03-02 06:21:35', '2022-03-02 06:21:35'),
(13, 'Glass Bottles', 'glass-bottles', '<p>Glass Bottles<br></p>', '/storage/photos/1/product/31BZmuaA3YL.jpg', 1, NULL, NULL, 'active', '2022-03-03 12:23:47', '2022-03-03 12:23:47'),
(14, 'Storing Milk', 'storing-milk', '<h1 id=\"title\" class=\"a-size-large a-spacing-none\" style=\"padding: 0px; margin-right: 0px; margin-left: 0px; text-rendering: optimizelegibility; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; margin-bottom: 0px !important; font-size: 24px !important; line-height: 32px !important;\"><span id=\"productTitle\" class=\"a-size-large product-title-word-break\" style=\"text-rendering: optimizelegibility; word-break: break-word; line-height: 32px !important;\">Storing Milk</span></h1>', '/storage/photos/1/product/6148.jpg', 1, NULL, NULL, 'active', '2022-03-03 12:24:30', '2022-03-03 12:24:30'),
(15, 'Milk Ghee Storage', 'milk-ghee-storage', '<p>Milk Ghee Storage<br></p>', '/storage/photos/1/mitions-logo.png', 1, NULL, NULL, 'active', '2022-03-04 21:58:53', '2022-03-04 21:58:53'),
(16, 'Stainless Steel', 'stainless-steel', '<p><span style=\"color: rgb(133, 135, 150);\">Stainless Steel</span><br></p>', '/storage/photos/1/mitions-logo.png', 1, NULL, NULL, 'active', '2022-03-04 21:59:20', '2022-03-04 21:59:20');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(4, 'jone duo', 'fghfh', 'bob@gmail.com', NULL, '56465646456', 'fghfghfhfghfhfghfghfgh', NULL, '2022-03-03 00:59:40', '2022-03-03 00:59:40'),
(5, 'jone duo', 'fghfh', 'bob@gmail.com', NULL, '34534543', 'dfgdfgdfgdfgdfgfggfdgdfgdfgdfgdfg', NULL, '2022-03-03 01:02:50', '2022-03-03 01:02:50'),
(6, 'jone duo', 'fghfh', 'bob@gmail.com', NULL, '34534543', 'dfgdfgdfgdfgdfgfggfdgdfgdfgdfgdfg', NULL, '2022-03-03 01:04:45', '2022-03-03 01:04:45'),
(7, 'jone duo', 'fghfh', 'bob@gmail.com', NULL, '34534543', 'dfgdfgdfgdfgdfgfggfdgdfgdfgdfgdfg', NULL, '2022-03-03 01:06:02', '2022-03-03 01:06:02'),
(8, 'jone duo', 'fghfh', 'bob@gmail.com', NULL, '2534535345', '3534534534534534534534545', NULL, '2022-03-03 01:06:23', '2022-03-03 01:06:23'),
(9, 'jone duo', 'fghfh', 'bob@gmail.com', NULL, '2534535345', '3534534534534534534534545', NULL, '2022-03-03 01:09:24', '2022-03-03 01:09:24');

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
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('030640b3-bfb9-48e2-a26d-d8f4d7d36ec4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/party-pack-1-60-ltrs\",\"fas\":\"fa-star\"}', NULL, '2022-03-02 22:34:18', '2022-03-02 22:34:18'),
('031bf568-034e-4b4a-9fcd-fc2538cbf909', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2022-03-02 22:10:15', '2022-03-02 22:10:15'),
('3a38e87a-e617-40a9-ad3e-88efb363b79b', 'App\\Notifications\\StatusNotification', 'App\\User', 30, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/printed-glass-bottle\",\"fas\":\"fa-star\"}', NULL, '2022-03-04 03:33:49', '2022-03-04 03:33:49'),
('4c87ee9c-20ee-4ccb-be3a-880c36eaead3', 'App\\Notifications\\StatusNotification', 'App\\User', 30, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/plastic-milk-can-1-piece-red\",\"fas\":\"fa-star\"}', NULL, '2022-03-04 04:01:43', '2022-03-04 04:01:43'),
('55757a7f-e8c5-491f-a3b5-96c820d48e7f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}', NULL, '2022-03-02 22:39:17', '2022-03-02 22:39:17'),
('55cbb12e-7161-469d-bb45-135e7789b213', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/printed-glass-bottle\",\"fas\":\"fa-star\"}', NULL, '2022-03-04 03:33:48', '2022-03-04 03:33:48'),
('cf67111c-b662-46ef-9197-d1d2f064d913', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', NULL, '2022-03-02 22:30:43', '2022-03-02 22:30:43'),
('f75f09ea-245d-48ac-8662-c3f3c975f6da', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/plastic-milk-can-1-piece-red\",\"fas\":\"fa-star\"}', NULL, '2022-03-04 04:01:43', '2022-03-04 04:01:43');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(9, 'ORD-QJXBYBITXD', 30, 483.00, NULL, NULL, 483.00, 7, 'paypal', 'paid', 'new', 'hahs', 'bsbsb', 'bob@gmail.com', '67676', 'ffghfhf', '6767', 'tyututyu', 'tyutyu', '2022-03-02 22:39:17', '2022-03-02 22:39:17');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Stainless Steel', 'stainless-steel', 'active', '2022-03-04 21:57:48', '2022-03-04 21:57:48'),
(7, 'Milk Ghee Storage', 'milk-ghee-storage', 'active', '2022-03-04 21:58:08', '2022-03-04 21:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `flavor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maximum_shelf_life` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `container_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nutrient_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ingredients` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`, `flavor`, `type`, `model_name`, `maximum_shelf_life`, `organic`, `container_type`, `nutrient_content`, `ingredients`) VALUES
(11, 'Aluminum Milk Can Capacity: (40 Littre)', 'party-pack-1-60-ltrs', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">The product is made from Quality stainless steel making it highly durable.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">It\'s a very durable and long lasting products. Beautifully designed barni</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Ideal option as storage for butter milk, oil, ghee, milk, etc</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">The product is made from Quality stainless steel making it highly durable.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">It\'s a very durable and long lasting products. Beautifully designed barni</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Ideal option as storage for butter milk, oil, ghee, milk, etc</span></li></ul>', '/storage/photos/1/new/mi.jpg', 60, 'S', 'new', 'active', 1000.00, 0.00, 1, 12, NULL, 7, '2022-03-02 06:25:15', '2022-03-05 22:17:20', 'Plain', 'UHT', 'Promo Milk', NULL, 'Yes', NULL, NULL, NULL),
(15, '1-Liter Milk Bottle, Black Top', '1-liter-milk-bottle-black-top', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Timeless retro milk bottle by make my day , 1 liter capacity</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Use it for milk, freshly squeezed juice, or even sake</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Silicone cap has an airtight seal to keep content fresh</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Dishwasher-safe</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Measures 5-inches by 5-inches by 10-inches</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Timeless retro milk bottle by make my day , 1 liter capacity</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Use it for milk, freshly squeezed juice, or even sake</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Silicone cap has an airtight seal to keep content fresh</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Dishwasher-safe</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Measures 5-inches by 5-inches by 10-inches</span></li></ul>', '/storage/photos/1/new/6148.jpg', 77, 'M', 'new', 'active', 1400.00, 0.00, 1, 12, NULL, 7, '2022-03-03 12:10:46', '2022-03-05 22:17:15', 'Plain', 'MSG', 'Promo Milk', NULL, 'Yes', NULL, NULL, NULL),
(16, 'Hygienic Leak Proof Beverage Glass Bottle 1L', 'hygienic-leak-proof-beverage-glass-bottle-1l', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">ARTH-FRIENDLY BEVERAGE BOTTLES: Your fresh-squeezed juices look gorgeous on your table and in your fridge in these classy air-tight and Eco-friendly bottles.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">BE HEALTHY, WHEREVER YOU GO: It’s easier than ever to take your healthy homemade juices and smoothies with you when you carry them in your Bottles.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">DURABLE, LEAD-FREE GLASS CONSTRUCTION WITH EXTRA-WIDE MOUTH: Most water and juice bottles are a pain to fill and wash but the wide mouth on these Bottles make everything from filling to clean up easy.</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">ARTH-FRIENDLY BEVERAGE BOTTLES: Your fresh-squeezed juices look gorgeous on your table and in your fridge in these classy air-tight and Eco-friendly bottles.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">BE HEALTHY, WHEREVER YOU GO: It’s easier than ever to take your healthy homemade juices and smoothies with you when you carry them in your Bottles.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">DURABLE, LEAD-FREE GLASS CONSTRUCTION WITH EXTRA-WIDE MOUTH: Most water and juice bottles are a pain to fill and wash but the wide mouth on these Bottles make everything from filling to clean up easy.</span></li></ul>', '/storage/photos/1/new/51qRNwQIViS._SL1500_.jpg', 500, 'M,L', 'new', 'active', 3000.00, 0.00, 1, 12, NULL, 7, '2022-03-03 12:18:11', '2022-03-05 22:17:09', 'Plain', 'Airtight', 'Blue Lid', NULL, 'Yes', NULL, NULL, NULL),
(17, 'Basic Glass Milk/ Juice/ Water Bottle 1400 ml', 'basic-glass-milk-juice-water-bottle-1400-ml', '<p><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Basic Glass Milk/ Juice/ Water Bottle 1400 ml 1 Pc, 100% Clarity, Air Tight Lid, Wooden Lid, No Sharp Edges, No Woobling, 100% Food Grade, Freezer Safe</span><br></p>', '<p><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Basic Glass Milk/ Juice/ Water Bottle 1400 ml 1 Pc, 100% Clarity, Air Tight Lid, Wooden Lid, No Sharp Edges, No Woobling, 100% Food Grade, Freezer Safe</span><br></p>', '/storage/photos/1/new/31BZmuaA3YL.jpg', 800, 'S', 'new', 'active', 700.00, 0.00, 1, 12, NULL, 7, '2022-03-03 12:21:36', '2022-03-05 22:17:06', 'Juice', 'UHT', 'Beverage', NULL, 'NO', NULL, NULL, NULL),
(18, 'Milk Bottles With Metal Cap', 'milk-bottles-with-metal-cap', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Capacity : 1000ml | Color : Transparent | Material : Glass | Metal Lids Included (Black or Gold) | Pack of 1piece</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Capacity : 1000ml | Color : Transparent | Material : Glass | Metal Lids Included (Black or Gold) | Pack of 1piece</span></li></ul>', '/storage/photos/1/new/51KDdj5ZRgL.jpg', 756, 'M', 'new', 'active', 1100.00, 0.00, 1, 13, NULL, 9, '2022-03-03 12:29:13', '2022-03-05 22:17:02', 'Gold Cap', 'Transparent', 'Blue Chip', NULL, 'yes', NULL, NULL, NULL),
(19, 'Printed Glass Bottle', 'printed-glass-bottle', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\">AIR AND WATER TIGHT STAINLESS STEEL CAP REFUSES TO LEAK:</li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\">BOTTLES FIT ANY LUNCH BAG OR CUP HOLDER: Take your bottles with you wherever you go - in the car, school or work, they fit in most car cup holders and refrigerator easily.<br></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\">AIR AND WATER TIGHT STAINLESS STEEL CAP REFUSES TO LEAK:</li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\">BOTTLES FIT ANY LUNCH BAG OR CUP HOLDER: Take your bottles with you wherever you go - in the car, school or work, they fit in most car cup holders and refrigerator easily.</li></ul>', '/storage/photos/1/new/81Vh7B5mWrL._SL1500_.jpg', 500, 'L', 'new', 'active', 1500.00, 0.00, 1, 14, NULL, 8, '2022-03-03 12:33:38', '2022-03-05 22:16:58', 'Juice', 'Transparent', 'Leak  Cap', NULL, 'yes', NULL, NULL, NULL),
(20, 'Milk Water and Juice Glass Bottle Cap -300 ml', 'milk-water-and-juice-glass-bottle-cap-300-ml', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Freeze safe glass Bottle to keep your water, milk, juice safe and to avoid use of plastic.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Very Good option to store your kitchen items in it , just stop using plastic containers .</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Freeze safe glass Bottle to keep your water, milk, juice safe and to avoid use of plastic.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Very Good option to store your kitchen items in it , just stop using plastic containers .</span></li></ul>', '/storage/photos/1/new/istockphoto-1210169562-170667a.jpg', 607, 'L', 'new', 'active', 3000.00, 0.00, 1, 13, NULL, 8, '2022-03-03 12:37:18', '2022-03-05 22:16:54', 'Juice', 'UHT', 'Promo Milk', NULL, 'Yes', NULL, NULL, NULL),
(21, 'Juice Glass Bottle with Air Tight Cap -300 ml', 'juice-glass-bottle-with-air-tight-cap-300-ml', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Water bottle with air tight rust-proof black color cap to provide you most healthy drinking experience</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Water bottle with air tight rust-proof black color cap to provide you most healthy drinking experience</span></li></ul>', '/storage/photos/1/new/product2.jpg', 79, 'M', 'new', 'active', 900.00, 0.00, 1, 14, NULL, 7, '2022-03-03 12:40:02', '2022-03-05 22:16:51', 'Gold Cap', 'MSG', 'Beverage', NULL, 'Yes', NULL, NULL, NULL),
(22, 'Plastic Milk Can - 1 Piece, Red', 'plastic-milk-can-1-piece-red', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Volume (Capacity): 20 Liters</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Package Contents: 1 Milk Can</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Care Instructions: Keep away from fire</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Food Grade</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Volume (Capacity): 20 Liters</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Package Contents: 1 Milk Can</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Care Instructions: Keep away from fire</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Food Grade</span></li></ul>', '/storage/photos/1/new/21XglhU2LkL.jpg', 900, 'L', 'new', 'active', 1200.00, 0.00, 1, 12, NULL, 9, '2022-03-03 12:43:14', '2022-03-05 22:16:47', 'Gold Cap', 'UHT', 'Red Chip', NULL, 'yes', NULL, NULL, NULL),
(23, 'stainless steel ghee barni - milk storage can - 1 litre', 'stainless-steel-ghee-barni-milk-storage-can-1-litre', '<ul><li><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">1 litre stainless steel milk storage cane | bharni for kitchen</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">CAPACITY- 1 litre ..The product is corrosion resistant.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Available in various sizes to suit your kitchen requirements.<br></span></li></ul><p><br></p>', '<ul><li><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">1 litre stainless steel milk storage cane | bharni for kitchen</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">CAPACITY- 1 litre ..The product is corrosion resistant.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Available in various sizes to suit your kitchen requirements.<br></span></li></ul><p><br></p>', '/storage/photos/1/new/2004.w019.n001.97A.p30.97.jpg', 140, 'M', 'new', 'active', 997.00, 0.00, 1, 15, NULL, 7, '2022-03-04 22:09:40', '2022-03-05 22:09:43', 'ghee', 'UHT', 'Beverage', NULL, 'Yes', NULL, NULL, NULL),
(24, 'Milk and Juice Bottle (1000 Ml)', 'milk-and-juice-bottle-1000-ml', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">1 Piece Glass Bottle with capacity of 1000 ml water.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Freeze Bottle to keep your water safe and to avoid use of plastic.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Water Container in various colors to make your kitchen more beautiful.</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">1 Piece Glass Bottle with capacity of 1000 ml water.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Freeze Bottle to keep your water safe and to avoid use of plastic.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Water Container in various colors to make your kitchen more beautiful.</span></li></ul>', '/storage/photos/1/new/dairy-products-wooden-table.jpg', 250, 'M', 'new', 'active', 999.00, 0.00, 1, 12, NULL, 11, '2022-03-04 22:18:12', '2022-03-05 22:16:38', 'Juice', 'etet', 'Blue Lid', NULL, 'Yes', NULL, NULL, NULL),
(25, 'Best Suitable For Milk, Juice, Water and Every Type of Liquid', 'best-suitable-for-milk-juice-water-and-every-type-of-liquid', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">DURABLE, LEAD-FREE GLASS CONSTRUCTION WITH EXTRA-WIDE MOUTH: Most water and juice bottles are a pain to fill and wash but the wide mouth on these Bottles make everything from filling to clean up easy.</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">DURABLE, LEAD-FREE GLASS CONSTRUCTION WITH EXTRA-WIDE MOUTH: Most water and juice bottles are a pain to fill and wash but the wide mouth on these Bottles make everything from filling to clean up easy.</span></li></ul>', '/storage/photos/1/new/high-angle-milk-bottle-with-empty-glass.jpg', 150, 'M', 'new', 'active', 1499.00, 0.00, 1, 13, NULL, 9, '2022-03-04 22:21:54', '2022-03-05 22:08:16', 'Plain', 'Transparent', 'CCI', NULL, 'yes', NULL, NULL, NULL),
(26, 'Milk and Water Glass Bottle, Clear, 1000 ml', 'milk-and-water-glass-bottle-clear-1000-ml', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Freeze safe glass bottle to keep your water, milk, juice safe and to avoid use of plastic. Store beverages in style packed in world class inflatable packaging for safe shipping</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Water bottle with air tight rust proof lid to provide you most healthy drinking experience</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Freeze safe glass bottle to keep your water, milk, juice safe and to avoid use of plastic. Store beverages in style packed in world class inflatable packaging for safe shipping</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Water bottle with air tight rust proof lid to provide you most healthy drinking experience</span></li></ul>', '/storage/photos/1/new/1009.jpg', 120, 'M', 'new', 'active', 1200.00, 0.00, 1, 13, NULL, 7, '2022-03-04 22:23:46', '2022-03-05 22:16:31', 'Plain', 'UHT', 'Promo Milk', NULL, 'Yes', NULL, NULL, NULL),
(27, 'Glass Milk/ Juice/ Water Bottle 1400 ml 1 Pc', 'glass-milk-juice-water-bottle-1400-ml-1-pc', '<ul><li><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Available in various sizes to suit your kitchen requirements.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Water bottle with airtight rust-proof lid to provide you a most healthy drinking experience</span></li></ul><p><br></p>', '<ul><li><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Available in various sizes to suit your kitchen requirements.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Water bottle with airtight rust-proof lid to provide you a most healthy drinking experience</span></li></ul><p><br></p>', '/storage/photos/1/new/147.jpg', 99, 'L', 'new', 'active', 1500.00, 0.00, 1, 13, NULL, 9, '2022-03-04 22:26:37', '2022-03-05 22:16:26', 'Gold Cap', 'UHT', 'milkZX', NULL, 'Yes', NULL, NULL, NULL),
(28, 'Plastic Milk Container - 3000 ml', 'plastic-milk-container-3000-ml', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Material - Plastic</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Capacity - 3000 ml</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Material - Plastic</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Capacity - 3000 ml</span></li></ul>', '/storage/photos/1/new/plastic-milk-bucket-5ltr-glass-world-original-imafmuvnzyuppuhk.jpg', 130, 'S,L', 'new', 'active', 1200.00, 0.00, 1, 12, NULL, 12, '2022-03-04 22:31:33', '2022-03-05 22:16:23', 'milk', 'Container', 'milk Container', NULL, 'Yes', NULL, NULL, NULL),
(29, 'Transparent Solid Glass Milk Bottles - 1000ml', 'transparent-solid-glass-milk-bottles-1000ml', '<ul id=\"product-details-list1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; color: rgb(61, 70, 77); font-family: SofiaPro, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><li id=\"product-details-list-item1\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Product: 4 Milk Bottles</li><li id=\"product-details-list-item2\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Type: Bottles</li><li id=\"product-details-list-item3\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Material: Glass</li><li id=\"product-details-list-item4\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Shape: Round</li></ul>', '<ul id=\"product-details-list1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; color: rgb(61, 70, 77); font-family: SofiaPro, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><li id=\"product-details-list-item1\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Product : 4 Milk Bottles</li><li id=\"product-details-list-item2\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Type: Bottles</li><li id=\"product-details-list-item3\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Material: Glass</li><li id=\"product-details-list-item4\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Shape : Round</li></ul>', '/storage/photos/1/new/1000008264722-1000008264721_01-710.jpg', 200, 'S', 'new', 'active', 900.00, 0.00, 1, 13, NULL, 7, '2022-03-04 22:34:00', '2022-03-05 22:16:19', 'milk', 'Transparent', 'Promo Milk', NULL, 'Yes', NULL, NULL, NULL),
(30, 'Plastic Milk Can (10 L, Multicolour)', 'plastic-milk-can-10-l-multicolour', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Unbreakable Plastic</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Milk container capacity 10 L</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Unbreakable Plastic</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Milk container capacity 10 L</span></li></ul>', '/storage/photos/1/new/21XglhU2LkL (1).jpg', 159, 'L', 'new', 'active', 1600.00, 0.00, 1, 14, NULL, 7, '2022-03-04 22:36:42', '2022-03-05 22:16:14', 'milk', 'Container', 'milk Container', NULL, 'Yes', NULL, NULL, NULL),
(31, 'Milk Pot - 2 L Plastic Milk Container  (Blue)', 'milk-pot-2-l-plastic-milk-container-blue', '<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_21Ahn-\" style=\"margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">Type: Milk Container</li><li class=\"_21Ahn-\" style=\"margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">Material: Plastic</li><li class=\"_21Ahn-\" style=\"margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">Airtight</li><li class=\"_21Ahn-\" style=\"margin: 0px; padding: 0px 0px 0px 16px; list-style: none; position: relative;\">Safety Features: BPA Free, Dishwasher Safe</li></ul>', '<ul style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\"><li class=\"_21Ahn-\" style=\"margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">Type: Milk Container</li><li class=\"_21Ahn-\" style=\"margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">Material: Plastic</li><li class=\"_21Ahn-\" style=\"margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;\">Airtight</li><li class=\"_21Ahn-\" style=\"margin: 0px; padding: 0px 0px 0px 16px; list-style: none; position: relative;\">Safety Features: BPA Free, Dishwasher Safe</li></ul>', '/storage/photos/1/new/0111.jpg', 160, 'M', 'new', 'active', 1000.00, 0.00, 1, 12, NULL, 11, '2022-03-04 22:39:17', '2022-03-05 22:16:11', 'milk', 'UHT', 'milk Container', NULL, 'Yes', NULL, NULL, NULL),
(32, 'Unbreakable Plastic Milk Container, 10L (Orange)', 'unbreakable-plastic-milk-container-10l-orange', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Capacity: 10 L</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Colour - Orange</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Capacity: 10 L</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Colour - Orange</span></li></ul>', '/storage/photos/1/new/21XglhU2LkL.jpg', 140, 'L', 'new', 'active', 1200.00, 0.00, 1, 14, NULL, 8, '2022-03-04 22:41:15', '2022-03-05 22:15:56', 'milk', 'UHT', 'milk Container', NULL, 'Yes', NULL, NULL, NULL),
(33, 'Milk Cans', 'milk-cans', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">The product is made from high quality stainless steel making it highly durable.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">The product is ideal for storing and carrying milk during travelling.</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">The product is made from high quality stainless steel making it highly durable.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">The product is ideal for storing and carrying milk during travelling.</span></li></ul>', '/storage/photos/1/new/milk-cans-00.jpg', 160, 'XL', 'new', 'active', 1000.00, 0.00, 1, 14, NULL, 7, '2022-03-04 22:45:39', '2022-03-05 22:15:52', 'milk', 'UHT', 'milk Container', NULL, 'Yes', NULL, NULL, NULL),
(34, 'Stainless Steel Milk Can Pot Storage with Lid Ghee Can Milk', 'stainless-steel-milk-can-pot-storage-with-lid-ghee-can-milk', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">The handle provided at the neck of the body is welded strongly to the body which makes sure long life of the pot.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">The neck of the pot is broad enough to provide easy cleaning of the product. Daily utility, long life, easy to use, easy to clean.</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">The handle provided at the neck of the body is welded strongly to the body which makes sure long life of the pot.</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">The neck of the pot is broad enough to provide easy cleaning of the product. Daily utility, long life, easy to use, easy to clean.</span></li></ul>', '/storage/photos/1/new/313ZZQHroPL.jpg', 150, 'M', 'new', 'active', 1400.00, 0.00, 1, 15, NULL, 11, '2022-03-04 22:47:36', '2022-03-05 22:15:48', 'ghee', 'UHT', 'ghee Container', NULL, 'Yes', NULL, NULL, NULL),
(35, 'Solid Transparent Glass Bottle Set of 4 -1000ml', 'solid-transparent-glass-bottle-set-of-4-1000ml', '<ul id=\"product-details-list1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; color: rgb(61, 70, 77); font-family: SofiaPro, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><li id=\"product-details-list-item1\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Product : 4 Milk Bottles</li><li id=\"product-details-list-item2\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Type : Bottles</li><li id=\"product-details-list-item3\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Material : Glass</li><li id=\"product-details-list-item4\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Shape : Round</li></ul>', '<ul id=\"product-details-list1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; color: rgb(61, 70, 77); font-family: SofiaPro, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\"><li id=\"product-details-list-item1\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Product : 4 Milk Bottles</li><li id=\"product-details-list-item2\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Type : Bottles</li><li id=\"product-details-list-item3\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Material : Glass</li><li id=\"product-details-list-item4\" style=\"position: relative; list-style: disc; margin-left: 17px; padding: 0px 0px 0px 7px;\">Shape : Round</li></ul>', '/storage/photos/1/new/000-milk.jpg', 120, 'S,M', 'new', 'active', 1400.00, 0.00, 1, 13, NULL, 9, '2022-03-04 22:50:22', '2022-03-05 22:15:45', 'milk', 'Container', 'Promo Milk', NULL, 'Yes', NULL, NULL, NULL),
(36, 'Glass Milk Bottles with Metal Lids (Set of 4)', 'glass-milk-bottles-with-metal-lids-set-of-4', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Milk bottles are dishwasher safe. Hand wash is recommended for lids</span></li><li>Bottles capacity is 33.8 oz (1000 ml). makes a great gift idea</li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Milk bottles are dishwasher safe. Hand wash is recommended for lids</span></li><li>Bottles capacity is 33.8 oz (1000 ml). makes a great gift idea</li></ul>', '/storage/photos/1/new/01-milk.jpg', 170, 'M', 'new', 'active', 1000.00, 0.00, 1, 13, NULL, 9, '2022-03-04 22:52:53', '2022-03-05 22:15:39', 'Juice', 'Transparent', 'milkZX', NULL, 'Yes', NULL, NULL, NULL),
(37, 'Set of 4 300ml Milk Bottle - Transparent 300 Bottle', 'set-of-4-300ml-milk-bottle-transparent-300-bottle', '<p><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">great for any event, durable for daily use. • Easy to wash: the Glass is super smooth, which is very easy to wash just by clear water.</span><br></p>', '<p><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">great for any event, durable for daily use. • Easy to wash: the Glass is super smooth, which is very easy to wash just by clear water.</span><br></p>', '/storage/photos/1/new/4-PACK.jpg', 190, 'S', 'new', 'active', 1000.00, 0.00, 1, 12, NULL, 8, '2022-03-04 22:55:16', '2022-03-05 22:15:33', 'milk', 'UHT', 'Promo Milk', NULL, 'Yes', NULL, NULL, NULL),
(38, '330ml Square Glass Milk Bottle', '330ml-square-glass-milk-bottle', '<p>330ml Square Glass Milk Bottle&nbsp;<span style=\"color: rgb(51, 51, 51); font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; font-size: 1rem;\">With Cork Transparent Glass</span><span style=\"color: rgb(51, 51, 51); font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; font-size: 1rem;\">&nbsp;.</span><br></p>', '<p>330ml Square Glass Milk Bottle&nbsp;<span style=\"font-size: 1rem; color: rgb(51, 51, 51); font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;;\">With Cork Transparent Glass</span><span style=\"font-size: 1rem; color: rgb(51, 51, 51); font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;;\">&nbsp;.</span><br></p>', '/storage/photos/1/new/5-MILK.jpg', 150, 'M', 'new', 'active', 1200.00, 0.00, 1, 13, NULL, 7, '2022-03-04 22:58:12', '2022-03-05 22:15:21', 'Juice', 'Transparent', 'Promo Milk', NULL, 'Yes', NULL, NULL, NULL),
(39, 'Glass Water/Milk Bottle', 'glass-watermilk-bottle', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Item: Glass bottle with airtight cap 1 Piece</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Made from 100% pure food grade glass Free from harmful chemicals like lead and cadmium</span></li></ul>', '<ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Item: Glass bottle with airtight cap 1 Piece</span></li><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\">Made from 100% pure food grade glass Free from harmful chemicals like lead and cadmium</span></li></ul>', '/storage/photos/1/new/1.png', 240, 'S', 'new', 'active', 1.00, 0.00, 1, 13, NULL, 11, '2022-03-05 23:06:52', '2022-03-05 23:06:52', 'milk', 'Transparent', 'Promo Milk', NULL, 'yes', NULL, NULL, NULL),
(40, '500ml Glass Milk Bottle - Transparent 500 ml Bottle', '500ml-glass-milk-bottle-transparent-500-ml-bottle', '<ul><li><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Reusable glass bottle- the same used by dairies for return and reuse. </span></li><li><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Reduces waste and preserves the great taste and life of your milk and juices.</span><br></li></ul>', '<ul><li><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Reusable glass bottle- the same used by dairies for return and reuse.</span></li><li><span style=\"color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;\">Reduces waste and preserves the great taste and life of your milk and juices.</span></li></ul>', '/storage/photos/1/new/10.png', 199, 'M', 'new', 'active', 10.00, 0.00, 1, 13, NULL, 7, '2022-03-05 23:12:35', '2022-03-05 23:12:35', 'Juice', 'Transparent', 'Promo Milk', NULL, 'Yes', NULL, NULL, NULL),
(41, 'Round Printed Milk Bottle - 1L', 'round-printed-milk-bottle-1l', '<p><font color=\"#333333\" face=\"Metropolis, serif, sans-serif\"><span style=\"letter-spacing: 0.5px;\">Check out this bottle, which has a cap so that you can carry it with ease. It is made of a fine quality material that not only makes it sturdy but also renders it durable. The print pattern that it comes with further renders it trendier.</span></font><br></p>', '<p><font color=\"#333333\" face=\"Metropolis, serif, sans-serif\"><span style=\"letter-spacing: 0.5px;\">Check out this bottle, which has a cap so that you can carry it with ease. It is made of a fine quality material that not only makes it sturdy but also renders it durable. The print pattern that it comes with further renders it trendier.</span></font><br></p>', '/storage/photos/1/new/100.png', 270, 'L', 'new', 'active', 100.00, 0.00, 1, 13, NULL, 7, '2022-03-05 23:15:35', '2022-03-05 23:15:35', 'milk', 'printed', 'milkZX', NULL, 'Yes', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(6, 30, 11, 2, 'dffgdfgdfgf', 'active', '2022-03-02 22:34:18', '2022-03-02 22:34:18'),
(7, 30, 19, 4, 'wow', 'active', '2022-03-04 03:33:47', '2022-03-04 03:33:47'),
(8, 30, 22, 2, 'wow nice product !', 'active', '2022-03-04 04:01:43', '2022-03-04 04:01:43');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(2, 'Describe', 'short_des	', '/storage/photos/1/logo.png', '/storage/photos/1/blog3.jpg', 'United Kingdom', '+000 (000) 000-000', 'example@example.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(5, 'abc', '45.00', 'active', '2022-03-03 01:32:16', '2022-03-03 01:32:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mitions', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', '/storage/photos/1/profile_dummy.png', 'admin', NULL, NULL, 'active', 'aq76Dm6Sw8JJAhut3jbO1lvLqt0R7Mg7O4TruyyXRV2bVfnEjoVJ1OF9ICkl', NULL, '2022-03-04 21:51:39'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', '/storage/photos/1/users/user2.jpg', 'user', NULL, NULL, 'active', NULL, NULL, '2020-08-15 07:30:07'),
(30, 'bob loion', 'bob@gmail.com', NULL, '$2y$10$OM/bVaTIlemwIuLRVxlqQOpRnsQCq/.5OJKnhjfMNQL1PeJSsBoFu', '/storage/photos/30/User/testimonial3.jpg', 'admin', NULL, NULL, 'active', NULL, '2022-03-01 11:09:29', '2022-03-02 22:49:36'),
(31, 'tom', 'tom@gmail.com', NULL, '$2y$10$GC2D3h4kjic8bvRmFhhPhOPYS2TWc.Tov4h/1RRzwup2/wxuGgQSu', NULL, 'user', NULL, NULL, 'active', NULL, '2022-03-01 11:11:29', '2022-03-01 11:11:29'),
(32, 'jone duo', 'bob@hjkgmail.com', NULL, '$2y$10$Q46us7W22nynQhoZjv/43.fSwuRF8DShoKfaWzZooImnKOZcO5o.u', NULL, 'user', NULL, NULL, 'active', NULL, '2022-03-02 10:30:14', '2022-03-02 10:30:14'),
(33, 'jone duo', 'jone@gmail.com', NULL, '$2y$10$947P4Ro0sRTPIxf4cSTMnOXz2pJ0wV2nSZ/.6Aci0dgNTTd4025Pm', NULL, 'user', NULL, NULL, 'active', NULL, '2022-03-02 23:41:10', '2022-03-02 23:41:10'),
(34, 'jone duo', 'jonesign@gmail.com', NULL, '$2y$10$sz/4EtLc00LdK0px7k7JuuOvl3EF7i9Pg8yr.iWqZc8RnuXG2QCqi', NULL, 'user', NULL, NULL, 'active', NULL, '2022-03-04 07:03:39', '2022-03-04 07:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
