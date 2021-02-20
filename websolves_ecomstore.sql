-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 20, 2021 at 11:07 AM
-- Server version: 10.3.27-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `websolves_ecomstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Admin','Sub Admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Admin',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_view_access` tinyint(4) NOT NULL,
  `categories_edit_access` tinyint(4) NOT NULL,
  `categories_full_access` tinyint(4) NOT NULL,
  `products_access` tinyint(4) NOT NULL,
  `orders_access` tinyint(4) NOT NULL,
  `users_access` tinyint(4) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `type`, `mobile`, `categories_view_access`, `categories_edit_access`, `categories_full_access`, `products_access`, `orders_access`, `users_access`, `email_verified_at`, `password`, `image`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'razibhossen8566@gmail.com', 'Admin', '01848178478', 0, 0, 0, 0, 0, 0, NULL, '$2y$10$8oU0jznkoIDiN0hBCNMOA.wd0ez6FzIIjhL27IFTV1Sdd4jiMlNJG', '', 1, NULL, NULL, NULL),
(2, 'john', 'john@gmail.com', '', '01848178478', 0, 0, 0, 0, 0, 0, NULL, '$2y$10$8oU0jznkoIDiN0hBCNMOA.wd0ez6FzIIjhL27IFTV1Sdd4jiMlNJG', '', 1, NULL, NULL, NULL),
(3, 'steve', 'steve@gmail.com', 'Sub Admin', '01848178478', 1, 1, 1, 1, 0, 0, NULL, '$2y$10$8oU0jznkoIDiN0hBCNMOA.wd0ez6FzIIjhL27IFTV1Sdd4jiMlNJG', '', 1, NULL, NULL, NULL),
(4, 'amit', 'amit@gmail.com', 'Admin', '01848178478', 0, 0, 0, 0, 0, 0, NULL, '$2y$10$8oU0jznkoIDiN0hBCNMOA.wd0ez6FzIIjhL27IFTV1Sdd4jiMlNJG', '', 1, NULL, NULL, NULL),
(5, 'rakib Ahmed', 'rakib@gmail.com', '', '01848178478', 0, 0, 0, 0, 0, 0, NULL, '5f4dcc3b5aa765d61d8327deb882cf99', NULL, 0, NULL, '2020-11-11 14:43:56', '2020-11-11 14:43:56'),
(6, 'dddd', 'ddd@gmail.com', '', '01477', 0, 0, 0, 0, 0, 0, NULL, '5f4dcc3b5aa765d61d8327deb882cf99', NULL, 1, NULL, '2020-11-11 14:44:56', '2020-11-11 14:44:56'),
(7, 'Rakib', 'd@gmail.com', 'Sub Admin', '014545', 0, 0, 0, 0, 1, 1, NULL, '67180bafcc63efe3865b219fe0a61009', NULL, 1, NULL, '2020-11-12 05:35:26', '2020-11-12 10:29:49');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `price_image`, `title`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, '45155.jpg', '615.png', 'Free E-Commerce Template', 'free-e-commerce-template', 1, '2020-10-12 03:49:58', '2020-10-12 08:22:28'),
(2, '67667.jpg', '89721.png', '100% Responsive Design', 'responsive-design', 1, '2020-10-12 03:51:34', '2020-10-12 08:22:29'),
(3, '14203.jpg', '44443.png', 'Free Ecommerce Template', 'free-ecommerce-template', 1, '2020-10-12 03:56:13', '2020-10-12 08:22:31'),
(5, '31084.jpg', '95767.png', 'sss', 'ggggg', 0, '2020-10-12 08:12:41', '2020-10-12 08:25:43');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `product_name`, `product_code`, `product_color`, `size`, `price`, `quantity`, `user_email`, `session_id`, `created_at`, `updated_at`) VALUES
(31, 7, 'Pink Casual T-Shirt', 'PCT001-S', 'Pink', 'Small', 450.00, 2, '', 'z2UzR2w9H8alknVcvpWR8cAyeu9UKN3dxrw4NrUB', NULL, NULL),
(42, 3, 'Green Casual T-shirt', 'GT001-M', 'Green', 'Medium', 550.00, 1, 'qullommelosso-5720@yopmail.com', 'lhlpOZlxNg0cDeqKrzAxG8dwYqf81rnhvsGWshzC', NULL, NULL),
(43, 8, 'Sky Blue Women Tops', 'SBWT001-S', 'Sky Blue', 'Small', 1200.00, 1, 'qullommelosso-5720@yopmail.com', 'lhlpOZlxNg0cDeqKrzAxG8dwYqf81rnhvsGWshzC', NULL, NULL),
(44, 8, 'Sky Blue Women Tops', 'SBWT001-S', 'Sky Blue', 'Small', 1200.00, 1, '', 'EI8zUkCtakUm1D4GBuyIwnn5k4GOVM6NskPi0VSP', NULL, NULL),
(45, 5, 'Sports Shoes', 'SS001-M', 'Black', 'Medium', 1100.00, 1, '', 'EI8zUkCtakUm1D4GBuyIwnn5k4GOVM6NskPi0VSP', NULL, NULL),
(47, 7, 'Pink Casual T-Shirt', 'PCT001-M', 'Pink', 'Medium', 450.00, 1, '', 's9VVqZx42cujjFJ6Bx8nYVKP2C4StLlrC1aAzhTR', NULL, NULL),
(51, 7, 'Pink Casual T-Shirt', 'PCT001-M', 'Pink', 'Medium', 450.00, 1, 'ra@gmail.com', 'PQh3at1gZx7kdvv9HWNM10sON4w3Hcnle5HJuBzM', NULL, NULL),
(52, 4, 'Casual Shoes', 'CS001-M', 'gray', 'Medium', 850.00, 1, 'razibhossen@yopmail.com', 'lfRP4OKWSsXfmVfC3WCdeg8Hz7xzhObZrjnjuLPo', NULL, NULL),
(53, 2, 'Casual Red T-Shirt', 'RT001-S', 'Red', 'Small', 500.00, 1, '', 'V2moUl7GEFYsIykOtz7F3jUl4JkvYTCEzkdn2mjo', NULL, NULL),
(54, 2, 'Casual Red T-Shirt', 'RT001-L', 'Red', 'Large', 500.00, 1, '', '8bIll6IcNOCxQdn93c7QopqQ1nps7wDwJUklJnqW', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `category_name`, `description`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Women Tops', 'Women Tops', 'women-tops', 'Women Tops', 'This product is now new updated', 'women tops', 1, NULL, '2020-11-24 09:45:54'),
(2, 3, 'Casual T-Shirts', 'nice Casual t-shirts', 'casual-t-shirts', '', '', '', 1, NULL, '2020-11-24 09:09:48'),
(3, 0, 'T-Shirt', 'nice t-shirt', 't-shirt', '', '', '', 1, '2020-10-03 09:48:05', '2020-10-06 04:29:36'),
(4, 0, 'Shoes', '', 'shoes', '', '', '', 1, '2020-10-05 19:07:27', '2020-10-05 19:07:27'),
(5, 4, 'Casual Shoes', '', 'casual-shoes', '', '', '', 1, '2020-10-05 19:08:01', '2020-10-05 19:08:01'),
(6, 4, 'Sports Shoes', 'nice shoes', 'sports-shoes', '', '', '', 1, '2020-10-05 19:08:24', '2020-10-06 02:36:51'),
(7, 1, 'Casual Tops', '', 'casual-tops', '', '', '', 1, '2020-10-05 19:17:16', '2020-10-05 19:17:16'),
(8, 1, 'T-shirt', '<p>nice women t-shirt</p>', 'women-t-shirt', '', '', '', 1, '2020-11-24 09:09:29', '2020-11-24 09:09:29');

-- --------------------------------------------------------

--
-- Table structure for table `cms_pages`
--

CREATE TABLE `cms_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_pages`
--

INSERT INTO `cms_pages` (`id`, `title`, `description`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 'About Us', 'About us page is coming soon', 'about-us', '', '', '', 1, '2020-10-29 08:01:09', '2020-10-30 03:58:34'),
(3, 'Terms & Conditions', 'Terms & Condition coming soon', 'terms-conditions', '', '', '', 1, '2020-10-30 03:39:20', '2020-10-30 03:39:20'),
(4, 'Privacy & Policy', 'Privacy & Policy is coming soon', 'privacy-policy', '', '', '', 1, '2020-10-30 04:01:04', '2020-10-30 04:03:56'),
(5, 'Refund Policy', 'Page is coming soon', 'refund-policy', 'Refund Policy of E-com Website', 'Please read refund policy of our e-com website before apply for refund', 'refund policy e-com website', 1, '2020-10-31 06:55:35', '2020-10-31 07:06:14');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `country_name` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `phonecode` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `iso`, `country_name`, `iso3`, `phonecode`) VALUES
(1, 'AF', 'Afghanistan', 'AFG', 93),
(2, 'AX', 'Aland Islands', 'ALA', 358),
(3, 'AL', 'Albania', 'ALB', 355),
(4, 'DZ', 'Algeria', 'DZA', 213),
(5, 'AS', 'American Samoa', 'ASM', 1684),
(6, 'AD', 'Andorra', 'AND', 376),
(7, 'AO', 'Angola', 'AGO', 244),
(8, 'AI', 'Anguilla', 'AIA', 1264),
(9, 'AQ', 'Antarctica', 'ATA', 0),
(10, 'AG', 'Antigua and Barbuda', 'ATG', 1268),
(11, 'AR', 'Argentina', 'ARG', 54),
(12, 'AM', 'Armenia', 'ARM', 374),
(13, 'AW', 'Aruba', 'ABW', 297),
(14, 'AU', 'Australia', 'AUS', 61),
(15, 'AT', 'Austria', 'AUT', 43),
(16, 'AZ', 'Azerbaijan', 'AZE', 994),
(17, 'BS', 'Bahamas', 'BHS', 1242),
(18, 'BH', 'Bahrain', 'BHR', 973),
(19, 'BD', 'Bangladesh', 'BGD', 880),
(20, 'BB', 'Barbados', 'BRB', 1246),
(21, 'BY', 'Belarus', 'BLR', 375),
(22, 'BE', 'Belgium', 'BEL', 32),
(23, 'BZ', 'Belize', 'BLZ', 501),
(24, 'BJ', 'Benin', 'BEN', 229),
(25, 'BM', 'Bermuda', 'BMU', 1441),
(26, 'BT', 'Bhutan', 'BTN', 975),
(27, 'BO', 'Bolivia', 'BOL', 591),
(28, 'BQ', 'Bonaire, Sint Eustatius and Saba', 'BES', 599),
(29, 'BA', 'Bosnia and Herzegovina', 'BIH', 387),
(30, 'BW', 'Botswana', 'BWA', 267),
(31, 'BV', 'Bouvet Island', 'BVT', 0),
(32, 'BR', 'Brazil', 'BRA', 55),
(33, 'IO', 'British Indian Ocean Territory', 'IOT', 246),
(34, 'BN', 'Brunei Darussalam', 'BRN', 673),
(35, 'BG', 'Bulgaria', 'BGR', 359),
(36, 'BF', 'Burkina Faso', 'BFA', 226),
(37, 'BI', 'Burundi', 'BDI', 257),
(38, 'KH', 'Cambodia', 'KHM', 855),
(39, 'CM', 'Cameroon', 'CMR', 237),
(40, 'CA', 'Canada', 'CAN', 1),
(41, 'CV', 'Cape Verde', 'CPV', 238),
(42, 'KY', 'Cayman Islands', 'CYM', 1345),
(43, 'CF', 'Central African Republic', 'CAF', 236),
(44, 'TD', 'Chad', 'TCD', 235),
(45, 'CL', 'Chile', 'CHL', 56),
(46, 'CN', 'China', 'CHN', 86),
(47, 'CX', 'Christmas Island', 'CXR', 61),
(48, 'CC', 'Cocos (Keeling) Islands', 'CCK', 672),
(49, 'CO', 'Colombia', 'COL', 57),
(50, 'KM', 'Comoros', 'COM', 269),
(51, 'CG', 'Congo', 'COG', 242),
(52, 'CD', 'Congo, the Democratic Republic of the', 'COD', 242),
(53, 'CK', 'Cook Islands', 'COK', 682),
(54, 'CR', 'Costa Rica', 'CRI', 506),
(55, 'CI', 'Cote D\'Ivoire', 'CIV', 225),
(56, 'HR', 'Croatia', 'HRV', 385),
(57, 'CU', 'Cuba', 'CUB', 53),
(58, 'CW', 'Curacao', 'CUW', 599),
(59, 'CY', 'Cyprus', 'CYP', 357),
(60, 'CZ', 'Czech Republic', 'CZE', 420),
(61, 'DK', 'Denmark', 'DNK', 45),
(62, 'DJ', 'Djibouti', 'DJI', 253),
(63, 'DM', 'Dominica', 'DMA', 1767),
(64, 'DO', 'Dominican Republic', 'DOM', 1809),
(65, 'EC', 'Ecuador', 'ECU', 593),
(66, 'EG', 'Egypt', 'EGY', 20),
(67, 'SV', 'El Salvador', 'SLV', 503),
(68, 'GQ', 'Equatorial Guinea', 'GNQ', 240),
(69, 'ER', 'Eritrea', 'ERI', 291),
(70, 'EE', 'Estonia', 'EST', 372),
(71, 'ET', 'Ethiopia', 'ETH', 251),
(72, 'FK', 'Falkland Islands (Malvinas)', 'FLK', 500),
(73, 'FO', 'Faroe Islands', 'FRO', 298),
(74, 'FJ', 'Fiji', 'FJI', 679),
(75, 'FI', 'Finland', 'FIN', 358),
(76, 'FR', 'France', 'FRA', 33),
(77, 'GF', 'French Guiana', 'GUF', 594),
(78, 'PF', 'French Polynesia', 'PYF', 689),
(79, 'TF', 'French Southern Territories', 'ATF', 0),
(80, 'GA', 'Gabon', 'GAB', 241),
(81, 'GM', 'Gambia', 'GMB', 220),
(82, 'GE', 'Georgia', 'GEO', 995),
(83, 'DE', 'Germany', 'DEU', 49),
(84, 'GH', 'Ghana', 'GHA', 233),
(85, 'GI', 'Gibraltar', 'GIB', 350),
(86, 'GR', 'Greece', 'GRC', 30),
(87, 'GL', 'Greenland', 'GRL', 299),
(88, 'GD', 'Grenada', 'GRD', 1473),
(89, 'GP', 'Guadeloupe', 'GLP', 590),
(90, 'GU', 'Guam', 'GUM', 1671),
(91, 'GT', 'Guatemala', 'GTM', 502),
(92, 'GG', 'Guernsey', 'GGY', 44),
(93, 'GN', 'Guinea', 'GIN', 224),
(94, 'GW', 'Guinea-Bissau', 'GNB', 245),
(95, 'GY', 'Guyana', 'GUY', 592),
(96, 'HT', 'Haiti', 'HTI', 509),
(97, 'HM', 'Heard Island and Mcdonald Islands', 'HMD', 0),
(98, 'VA', 'Holy See (Vatican City State)', 'VAT', 39),
(99, 'HN', 'Honduras', 'HND', 504),
(100, 'HK', 'Hong Kong', 'HKG', 852),
(101, 'HU', 'Hungary', 'HUN', 36),
(102, 'IS', 'Iceland', 'ISL', 354),
(103, 'IN', 'India', 'IND', 91),
(104, 'ID', 'Indonesia', 'IDN', 62),
(105, 'IR', 'Iran, Islamic Republic of', 'IRN', 98),
(106, 'IQ', 'Iraq', 'IRQ', 964),
(107, 'IE', 'Ireland', 'IRL', 353),
(108, 'IM', 'Isle of Man', 'IMN', 44),
(109, 'IL', 'Israel', 'ISR', 972),
(110, 'IT', 'Italy', 'ITA', 39),
(111, 'JM', 'Jamaica', 'JAM', 1876),
(112, 'JP', 'Japan', 'JPN', 81),
(113, 'JE', 'Jersey', 'JEY', 44),
(114, 'JO', 'Jordan', 'JOR', 962),
(115, 'KZ', 'Kazakhstan', 'KAZ', 7),
(116, 'KE', 'Kenya', 'KEN', 254),
(117, 'KI', 'Kiribati', 'KIR', 686),
(118, 'KP', 'Korea, Democratic People\"s Republic of', 'PRK', 850),
(119, 'KR', 'Korea, Republic of', 'KOR', 82),
(120, 'XK', 'Kosovo', 'XKX', 381),
(121, 'KW', 'Kuwait', 'KWT', 965),
(122, 'KG', 'Kyrgyzstan', 'KGZ', 996),
(123, 'LA', 'Lao People\'s Democratic Republic', 'LAO', 856),
(124, 'LV', 'Latvia', 'LVA', 371),
(125, 'LB', 'Lebanon', 'LBN', 961),
(126, 'LS', 'Lesotho', 'LSO', 266),
(127, 'LR', 'Liberia', 'LBR', 231),
(128, 'LY', 'Libyan Arab Jamahiriya', 'LBY', 218),
(129, 'LI', 'Liechtenstein', 'LIE', 423),
(130, 'LT', 'Lithuania', 'LTU', 370),
(131, 'LU', 'Luxembourg', 'LUX', 352),
(132, 'MO', 'Macao', 'MAC', 853),
(133, 'MK', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 389),
(134, 'MG', 'Madagascar', 'MDG', 261),
(135, 'MW', 'Malawi', 'MWI', 265),
(136, 'MY', 'Malaysia', 'MYS', 60),
(137, 'MV', 'Maldives', 'MDV', 960),
(138, 'ML', 'Mali', 'MLI', 223),
(139, 'MT', 'Malta', 'MLT', 356),
(140, 'MH', 'Marshall Islands', 'MHL', 692),
(141, 'MQ', 'Martinique', 'MTQ', 596),
(142, 'MR', 'Mauritania', 'MRT', 222),
(143, 'MU', 'Mauritius', 'MUS', 230),
(144, 'YT', 'Mayotte', 'MYT', 269),
(145, 'MX', 'Mexico', 'MEX', 52),
(146, 'FM', 'Micronesia, Federated States of', 'FSM', 691),
(147, 'MD', 'Moldova, Republic of', 'MDA', 373),
(148, 'MC', 'Monaco', 'MCO', 377),
(149, 'MN', 'Mongolia', 'MNG', 976),
(150, 'ME', 'Montenegro', 'MNE', 382),
(151, 'MS', 'Montserrat', 'MSR', 1664),
(152, 'MA', 'Morocco', 'MAR', 212),
(153, 'MZ', 'Mozambique', 'MOZ', 258),
(154, 'MM', 'Myanmar', 'MMR', 95),
(155, 'NA', 'Namibia', 'NAM', 264),
(156, 'NR', 'Nauru', 'NRU', 674),
(157, 'NP', 'Nepal', 'NPL', 977),
(158, 'NL', 'Netherlands', 'NLD', 31),
(159, 'AN', 'Netherlands Antilles', 'ANT', 599),
(160, 'NC', 'New Caledonia', 'NCL', 687),
(161, 'NZ', 'New Zealand', 'NZL', 64),
(162, 'NI', 'Nicaragua', 'NIC', 505),
(163, 'NE', 'Niger', 'NER', 227),
(164, 'NG', 'Nigeria', 'NGA', 234),
(165, 'NU', 'Niue', 'NIU', 683),
(166, 'NF', 'Norfolk Island', 'NFK', 672),
(167, 'MP', 'Northern Mariana Islands', 'MNP', 1670),
(168, 'NO', 'Norway', 'NOR', 47),
(169, 'OM', 'Oman', 'OMN', 968),
(170, 'PK', 'Pakistan', 'PAK', 92),
(171, 'PW', 'Palau', 'PLW', 680),
(172, 'PS', 'Palestinian Territory, Occupied', 'PSE', 970),
(173, 'PA', 'Panama', 'PAN', 507),
(174, 'PG', 'Papua New Guinea', 'PNG', 675),
(175, 'PY', 'Paraguay', 'PRY', 595),
(176, 'PE', 'Peru', 'PER', 51),
(177, 'PH', 'Philippines', 'PHL', 63),
(178, 'PN', 'Pitcairn', 'PCN', 0),
(179, 'PL', 'Poland', 'POL', 48),
(180, 'PT', 'Portugal', 'PRT', 351),
(181, 'PR', 'Puerto Rico', 'PRI', 1787),
(182, 'QA', 'Qatar', 'QAT', 974),
(183, 'RE', 'Reunion', 'REU', 262),
(184, 'RO', 'Romania', 'ROM', 40),
(185, 'RU', 'Russian Federation', 'RUS', 70),
(186, 'RW', 'Rwanda', 'RWA', 250),
(187, 'BL', 'Saint Barthelemy', 'BLM', 590),
(188, 'SH', 'Saint Helena', 'SHN', 290),
(189, 'KN', 'Saint Kitts and Nevis', 'KNA', 1869),
(190, 'LC', 'Saint Lucia', 'LCA', 1758),
(191, 'MF', 'Saint Martin', 'MAF', 590),
(192, 'PM', 'Saint Pierre and Miquelon', 'SPM', 508),
(193, 'VC', 'Saint Vincent and the Grenadines', 'VCT', 1784),
(194, 'WS', 'Samoa', 'WSM', 684),
(195, 'SM', 'San Marino', 'SMR', 378),
(196, 'ST', 'Sao Tome and Principe', 'STP', 239),
(197, 'SA', 'Saudi Arabia', 'SAU', 966),
(198, 'SN', 'Senegal', 'SEN', 221),
(199, 'RS', 'Serbia', 'SRB', 381),
(200, 'CS', 'Serbia and Montenegro', 'SCG', 381),
(201, 'SC', 'Seychelles', 'SYC', 248),
(202, 'SL', 'Sierra Leone', 'SLE', 232),
(203, 'SG', 'Singapore', 'SGP', 65),
(204, 'SX', 'Sint Maarten', 'SXM', 1),
(205, 'SK', 'Slovakia', 'SVK', 421),
(206, 'SI', 'Slovenia', 'SVN', 386),
(207, 'SB', 'Solomon Islands', 'SLB', 677),
(208, 'SO', 'Somalia', 'SOM', 252),
(209, 'ZA', 'South Africa', 'ZAF', 27),
(210, 'GS', 'South Georgia and the South Sandwich Islands', 'SGS', 0),
(211, 'SS', 'South Sudan', 'SSD', 211),
(212, 'ES', 'Spain', 'ESP', 34),
(213, 'LK', 'Sri Lanka', 'LKA', 94),
(214, 'SD', 'Sudan', 'SDN', 249),
(215, 'SR', 'Suriname', 'SUR', 597),
(216, 'SJ', 'Svalbard and Jan Mayen', 'SJM', 47),
(217, 'SZ', 'Swaziland', 'SWZ', 268),
(218, 'SE', 'Sweden', 'SWE', 46),
(219, 'CH', 'Switzerland', 'CHE', 41),
(220, 'SY', 'Syrian Arab Republic', 'SYR', 963),
(221, 'TW', 'Taiwan, Province of China', 'TWN', 886),
(222, 'TJ', 'Tajikistan', 'TJK', 992),
(223, 'TZ', 'Tanzania, United Republic of', 'TZA', 255),
(224, 'TH', 'Thailand', 'THA', 66),
(225, 'TL', 'Timor-Leste', 'TLS', 670),
(226, 'TG', 'Togo', 'TGO', 228),
(227, 'TK', 'Tokelau', 'TKL', 690),
(228, 'TO', 'Tonga', 'TON', 676),
(229, 'TT', 'Trinidad and Tobago', 'TTO', 1868),
(230, 'TN', 'Tunisia', 'TUN', 216),
(231, 'TR', 'Turkey', 'TUR', 90),
(232, 'TM', 'Turkmenistan', 'TKM', 7370),
(233, 'TC', 'Turks and Caicos Islands', 'TCA', 1649),
(234, 'TV', 'Tuvalu', 'TUV', 688),
(235, 'UG', 'Uganda', 'UGA', 256),
(236, 'UA', 'Ukraine', 'UKR', 380),
(237, 'AE', 'United Arab Emirates', 'ARE', 971),
(238, 'GB', 'United Kingdom', 'GBR', 44),
(239, 'US', 'United States', 'USA', 1),
(240, 'UM', 'United States Minor Outlying Islands', 'UMI', 1),
(241, 'UY', 'Uruguay', 'URY', 598),
(242, 'UZ', 'Uzbekistan', 'UZB', 998),
(243, 'VU', 'Vanuatu', 'VUT', 678),
(244, 'VE', 'Venezuela', 'VEN', 58),
(245, 'VN', 'Viet Nam', 'VNM', 84),
(246, 'VG', 'Virgin Islands, British', 'VGB', 1284),
(247, 'VI', 'Virgin Islands, U.s.', 'VIR', 1340),
(248, 'WF', 'Wallis and Futuna', 'WLF', 681),
(249, 'EH', 'Western Sahara', 'ESH', 212),
(250, 'YE', 'Yemen', 'YEM', 967),
(251, 'ZM', 'Zambia', 'ZMB', 260),
(252, 'ZW', 'Zimbabwe', 'ZWE', 263);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `amount_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `amount`, `amount_type`, `expiry_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'test101', 10, 'Percentage', '2020-10-11', 1, '2020-10-10 17:53:04', '2020-10-10 23:58:03'),
(2, '4547855', 200, 'Fixed', '2020-10-11', 1, '2020-10-10 18:35:36', '2020-10-10 18:35:36'),
(4, 'test10', 5, 'Percentage', '2020-10-31', 1, '2020-10-18 08:09:49', '2020-10-18 08:09:49'),
(5, 'oiiujkjjj', 15, 'Fixed', '2020-10-29', 1, '2020-10-23 03:23:31', '2020-10-23 03:23:31');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double(8,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', 80.00, 1, '2020-11-02 08:14:18', '2020-11-02 09:22:28'),
(2, 'GBP', 109.00, 1, '2020-11-03 02:08:04', '2020-11-03 02:08:04'),
(3, 'EUR', 99.00, 1, '2020-11-03 02:08:50', '2020-11-03 02:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_addresses`
--

CREATE TABLE `delivery_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_addresses`
--

INSERT INTO `delivery_addresses` (`id`, `user_id`, `user_email`, `name`, `address`, `city`, `state`, `country`, `pincode`, `mobile`, `created_at`, `updated_at`) VALUES
(1, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Cyprus', '8710', '01848178478', '2020-10-17 06:20:20', '2020-11-24 15:31:21'),
(2, 53, 'qullommelosso-5720@yopmail.com', 'Razib Hossen', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '8710', '01848178478', '2020-10-25 05:04:51', '2020-11-13 15:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_10_01_105953_create_admins_table', 2),
(5, '2020_10_03_004529_create_sections_table', 3),
(7, '2020_10_03_014146_create_categories_table', 4),
(8, '2020_10_04_063132_create_products_table', 5),
(9, '2020_10_05_021852_create_product_attributes_table', 6),
(10, '2020_10_07_124814_create_product_images_table', 7),
(11, '2020_10_08_142446_create_cart_table', 8),
(12, '2020_10_10_100941_create_coupons_table', 9),
(13, '2020_10_12_014937_create_banners_table', 10),
(14, '2020_10_16_150336_create_delivery_addresses_table', 11),
(15, '2020_10_18_104009_create_orders_table', 12),
(16, '2020_10_18_105023_create_order_products_table', 13),
(17, '2020_10_18_125210_add_product_color_to_order_products_table', 14),
(19, '2020_10_23_035325_create_admins_table', 15),
(20, '2020_10_27_095549_create_cms_pages', 16),
(21, '2020_11_02_123826_create_currencies_table', 17),
(22, '2020_11_16_145510_create_newletter_subscribers_table', 18),
(23, '2020_11_21_214734_create_wish_lists_table', 19);

-- --------------------------------------------------------

--
-- Table structure for table `newletter_subscribers`
--

CREATE TABLE `newletter_subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newletter_subscribers`
--

INSERT INTO `newletter_subscribers` (`id`, `email`, `status`, `created_at`, `updated_at`) VALUES
(3, 'razibhossen856@gmail.com', 1, '2020-11-17 09:19:46', '2020-11-17 09:19:46'),
(4, 'ratul@gmail.com', 1, '2020-11-17 09:20:20', '2020-11-17 09:20:20'),
(5, 'razibhossen@gmail.com', 1, '2020-11-26 10:51:47', '2020-11-26 10:51:47'),
(6, 'razibhossen111@gmail.com', 1, '2020-11-26 10:53:53', '2020-11-26 10:53:53');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_charges` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_amount` double(8,2) NOT NULL,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grand_total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `user_email`, `name`, `address`, `city`, `state`, `country`, `pincode`, `mobile`, `shipping_charges`, `coupon_code`, `coupon_amount`, `order_status`, `payment_method`, `grand_total`, `created_at`, `updated_at`) VALUES
(1, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'COD', 1400.00, '2020-10-18 08:05:21', '2020-10-18 08:05:21'),
(2, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 1330.00, '2020-10-18 08:17:55', '2020-10-18 08:17:55'),
(3, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 950.00, '2020-10-18 09:41:32', '2020-10-18 09:41:32'),
(4, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 1400.00, '2020-10-19 19:17:28', '2020-10-19 19:17:28'),
(5, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 1850.00, '2020-10-19 19:29:55', '2020-10-19 19:29:55'),
(6, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 2350.00, '2020-10-19 19:31:33', '2020-10-19 19:31:33'),
(7, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 450.00, '2020-10-19 19:33:42', '2020-10-19 19:33:42'),
(8, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 450.00, '2020-10-19 19:36:16', '2020-10-19 19:36:16'),
(9, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 1200.00, '2020-10-19 19:38:01', '2020-10-19 19:38:01'),
(10, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 1200.00, '2020-10-20 06:05:18', '2020-10-20 06:05:18'),
(11, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 600.00, '2020-10-20 07:03:15', '2020-10-20 07:03:15'),
(12, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 450.00, '2020-10-20 07:11:29', '2020-10-20 07:11:29'),
(13, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 450.00, '2020-10-20 07:18:52', '2020-10-20 07:18:52'),
(14, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 500.00, '2020-10-21 01:11:14', '2020-10-21 01:11:14'),
(15, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 850.00, '2020-10-21 01:15:06', '2020-10-21 01:15:06'),
(16, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 500.00, '2020-10-21 01:58:16', '2020-10-21 01:58:16'),
(17, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 500.00, '2020-10-21 02:05:34', '2020-10-21 02:05:34'),
(18, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 0.00, '2020-10-21 05:58:09', '2020-10-21 05:58:09'),
(19, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 450.00, '2020-10-21 06:33:00', '2020-10-21 06:33:00'),
(20, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 1200.00, '2020-10-21 07:13:54', '2020-10-21 07:13:54'),
(21, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 450.00, '2020-10-21 08:10:29', '2020-10-21 08:10:29'),
(22, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 450.00, '2020-10-21 08:39:07', '2020-10-21 08:39:07'),
(23, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Canada', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 450.00, '2020-10-21 08:55:07', '2020-10-21 08:55:07'),
(24, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Cyprus', '1329', '01848178478', '0', '', 0.00, 'In-Process', 'Paypal', 1000.00, '2020-10-21 09:00:45', '2020-10-22 21:14:09'),
(25, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Cyprus', '1329', '01848178478', '0', '', 0.00, 'New', 'Paypal', 1500.00, '2020-10-23 03:10:19', '2020-10-23 03:10:19'),
(26, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Cyprus', '1329', '01848178478', '0', 'oiiujkjjj', 15.00, 'Paid', 'Paypal', 435.00, '2020-10-23 03:25:16', '2020-10-23 03:27:08'),
(27, 53, 'qullommelosso-5720@yopmail.com', 'Razib Hossen', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'COD', 450.00, '2020-10-25 05:04:59', '2020-10-25 05:04:59'),
(28, 53, 'qullommelosso-5720@yopmail.com', 'Razib Hossen', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'COD', 1000.00, '2020-10-25 06:45:12', '2020-10-25 06:45:12'),
(29, 53, 'qullommelosso-5720@yopmail.com', 'Razib Hossen', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'COD', 500.00, '2020-10-25 07:02:59', '2020-10-25 07:02:59'),
(30, 53, 'qullommelosso-5720@yopmail.com', 'Razib Hossen', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '1329', '01848178478', '0', '', 0.00, 'New', 'COD', 1500.00, '2020-10-25 08:10:52', '2020-10-25 08:10:52'),
(31, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Cyprus', '8710', '01848178478', '0', '', 0.00, 'New', 'COD', 1200.00, '2020-11-02 06:31:12', '2020-11-02 06:31:12'),
(32, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Cyprus', '8710', '01848178478', '0', '', 0.00, 'New', 'COD', 1700.00, '2020-11-07 08:08:00', '2020-11-07 08:08:00'),
(33, 53, 'qullommelosso-5720@yopmail.com', 'Razib Hossen', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Bangladesh', '8710', '01848178478', '100', '', 0.00, 'New', 'COD', 600.00, '2020-11-10 08:56:17', '2020-11-10 08:56:17'),
(34, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Cyprus', '8710', '01848178478', '0', '', 0.00, 'New', 'COD', 1100.00, '2020-11-24 10:09:11', '2020-11-24 10:09:11'),
(35, 2, 'razibhossens8566@gmail.com', 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Cyprus', '8710', '01848178478', '0', '', 0.00, 'New', 'COD', 600.00, '2020-11-24 15:31:50', '2020-11-24 15:31:50');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double(8,2) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `user_id`, `product_id`, `product_name`, `product_code`, `product_size`, `product_price`, `product_qty`, `created_at`, `updated_at`, `product_color`) VALUES
(1, 3, 2, 2, 'Casual Red T-Shirt', 'RT001-S', 'Small', 500.00, 1, '2020-10-18 09:41:32', '2020-10-18 09:41:32', '0'),
(2, 3, 2, 7, 'Pink Casual T-Shirt', 'PCT001-S', 'Small', 450.00, 1, '2020-10-18 09:41:32', '2020-10-18 09:41:32', '0'),
(3, 4, 2, 2, 'Casual Red T-Shirt', 'RT001-S', 'Small', 500.00, 1, '2020-10-19 19:17:28', '2020-10-19 19:17:28', 'Red'),
(4, 4, 2, 7, 'Pink Casual T-Shirt', 'PCT001-S', 'Small', 450.00, 1, '2020-10-19 19:17:28', '2020-10-19 19:17:28', 'Pink'),
(5, 4, 2, 7, 'Pink Casual T-Shirt', 'PCT001-S', 'Small', 450.00, 1, '2020-10-19 19:17:28', '2020-10-19 19:17:28', 'Pink'),
(6, 5, 2, 2, 'Casual Red T-Shirt', 'RT001-S', 'Small', 500.00, 1, '2020-10-19 19:29:55', '2020-10-19 19:29:55', 'Red'),
(7, 5, 2, 7, 'Pink Casual T-Shirt', 'PCT001-S', 'Small', 450.00, 1, '2020-10-19 19:29:55', '2020-10-19 19:29:55', 'Pink'),
(8, 5, 2, 7, 'Pink Casual T-Shirt', 'PCT001-S', 'Small', 450.00, 1, '2020-10-19 19:29:55', '2020-10-19 19:29:55', 'Pink'),
(9, 5, 2, 3, 'Green Casual T-shirt', 'GT001-S', 'Small', 450.00, 1, '2020-10-19 19:29:55', '2020-10-19 19:29:55', 'Green'),
(10, 6, 2, 2, 'Casual Red T-Shirt', 'RT001-S', 'Small', 500.00, 1, '2020-10-19 19:31:33', '2020-10-19 19:31:33', 'Red'),
(11, 6, 2, 7, 'Pink Casual T-Shirt', 'PCT001-S', 'Small', 450.00, 1, '2020-10-19 19:31:33', '2020-10-19 19:31:33', 'Pink'),
(12, 6, 2, 7, 'Pink Casual T-Shirt', 'PCT001-S', 'Small', 450.00, 1, '2020-10-19 19:31:33', '2020-10-19 19:31:33', 'Pink'),
(13, 6, 2, 3, 'Green Casual T-shirt', 'GT001-S', 'Small', 450.00, 1, '2020-10-19 19:31:34', '2020-10-19 19:31:34', 'Green'),
(14, 6, 2, 6, 'Blue Casual T-Shirts', 'BCT001', 'Small', 500.00, 1, '2020-10-19 19:31:34', '2020-10-19 19:31:34', 'Blue'),
(15, 7, 2, 3, 'Green Casual T-shirt', 'GT001-S', 'Small', 450.00, 1, '2020-10-19 19:33:42', '2020-10-19 19:33:42', 'Green'),
(16, 8, 2, 3, 'Green Casual T-shirt', 'GT001-S', 'Small', 450.00, 1, '2020-10-19 19:36:16', '2020-10-19 19:36:16', 'Green'),
(17, 9, 2, 8, 'Sky Blue Women Tops', 'SBWT001-S', 'Small', 1200.00, 1, '2020-10-19 19:38:01', '2020-10-19 19:38:01', 'Sky Blue'),
(18, 10, 2, 8, 'Sky Blue Women Tops', 'SBWT001-S', 'Small', 1200.00, 1, '2020-10-20 06:05:18', '2020-10-20 06:05:18', 'Sky Blue'),
(19, 11, 2, 6, 'Blue Casual T-Shirts', 'BCT001', 'Medium', 600.00, 1, '2020-10-20 07:03:15', '2020-10-20 07:03:15', 'Blue'),
(20, 12, 2, 7, 'Pink Casual T-Shirt', 'PCT001-S', 'Small', 450.00, 1, '2020-10-20 07:11:30', '2020-10-20 07:11:30', 'Pink'),
(21, 14, 2, 6, 'Blue Casual T-Shirts', 'BCT001', 'Small', 500.00, 1, '2020-10-21 01:11:14', '2020-10-21 01:11:14', 'Blue'),
(22, 15, 2, 4, 'Casual Shoes', 'CS001-S', 'Small', 850.00, 1, '2020-10-21 01:15:06', '2020-10-21 01:15:06', 'gray'),
(23, 16, 2, 6, 'Blue Casual T-Shirts', 'BCT001', 'Small', 500.00, 1, '2020-10-21 01:58:16', '2020-10-21 01:58:16', 'Blue'),
(24, 17, 2, 6, 'Blue Casual T-Shirts', 'BCT001', 'Small', 500.00, 1, '2020-10-21 02:05:34', '2020-10-21 02:05:34', 'Blue'),
(25, 19, 2, 7, 'Pink Casual T-Shirt', 'PCT001-S', 'Small', 450.00, 1, '2020-10-21 06:33:00', '2020-10-21 06:33:00', 'Pink'),
(26, 20, 2, 8, 'Sky Blue Women Tops', 'SBWT001-S', 'Small', 1200.00, 1, '2020-10-21 07:13:54', '2020-10-21 07:13:54', 'Sky Blue'),
(27, 21, 2, 3, 'Green Casual T-shirt', 'GT001-S', 'Small', 450.00, 1, '2020-10-21 08:10:29', '2020-10-21 08:10:29', 'Green'),
(28, 22, 2, 7, 'Pink Casual T-Shirt', 'PCT001-S', 'Small', 450.00, 1, '2020-10-21 08:39:07', '2020-10-21 08:39:07', 'Pink'),
(29, 23, 2, 3, 'Green Casual T-shirt', 'GT001-S', 'Small', 450.00, 1, '2020-10-21 08:55:07', '2020-10-21 08:55:07', 'Green'),
(30, 24, 2, 5, 'Sports Shoes', 'SS001-S', 'Small', 1000.00, 1, '2020-10-21 09:00:45', '2020-10-21 09:00:45', 'Black'),
(31, 25, 2, 2, 'Casual Red T-Shirt', 'RT001-S', 'Small', 500.00, 3, '2020-10-23 03:10:19', '2020-10-23 03:10:19', 'Red'),
(32, 26, 2, 7, 'Pink Casual T-Shirt', 'PCT001-S', 'Small', 450.00, 1, '2020-10-23 03:25:16', '2020-10-23 03:25:16', 'Pink'),
(33, 27, 53, 7, 'Pink Casual T-Shirt', 'PCT001-S', 'Small', 450.00, 1, '2020-10-25 05:04:59', '2020-10-25 05:04:59', 'Pink'),
(34, 28, 53, 5, 'Sports Shoes', 'SS001-S', 'Small', 1000.00, 1, '2020-10-25 06:45:12', '2020-10-25 06:45:12', 'Black'),
(35, 29, 53, 2, 'Casual Red T-Shirt', 'RT001-S', 'Small', 500.00, 1, '2020-10-25 07:02:59', '2020-10-25 07:02:59', 'Red'),
(36, 30, 53, 5, 'Sports Shoes', 'SS001-S', 'Small', 1000.00, 1, '2020-10-25 08:10:52', '2020-10-25 08:10:52', 'Black'),
(37, 30, 53, 6, 'Blue Casual T-Shirts', 'BCT001', 'Small', 500.00, 1, '2020-10-25 08:10:52', '2020-10-25 08:10:52', 'Blue'),
(38, 31, 2, 8, 'Sky Blue Women Tops', 'SBWT001-S', 'Small', 1200.00, 1, '2020-11-02 06:31:12', '2020-11-02 06:31:12', 'Sky Blue'),
(39, 32, 2, 8, 'Sky Blue Women Tops', 'SBWT001-S', 'Small', 1200.00, 1, '2020-11-07 08:08:01', '2020-11-07 08:08:01', 'Sky Blue'),
(40, 32, 2, 2, 'Casual Red T-Shirt', 'RT001-S', 'Small', 500.00, 1, '2020-11-07 08:08:01', '2020-11-07 08:08:01', 'Red'),
(41, 33, 53, 2, 'Casual Red T-Shirt', 'RT001-S', 'Small', 500.00, 1, '2020-11-10 08:56:18', '2020-11-10 08:56:18', 'Red'),
(42, 34, 2, 6, 'Blue Casual T-Shirts', 'BCT001', 'Small', 500.00, 1, '2020-11-24 10:09:11', '2020-11-24 10:09:11', 'Blue'),
(43, 34, 2, 2, 'Casual Red T-Shirt', 'RT001-M', 'Medium', 600.00, 1, '2020-11-24 10:09:11', '2020-11-24 10:09:11', 'Red'),
(44, 35, 2, 2, 'Casual Red T-Shirt', 'RT001-M', 'Medium', 600.00, 1, '2020-11-24 15:31:50', '2020-11-24 15:31:50', 'Red');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pincodes`
--

CREATE TABLE `pincodes` (
  `id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `thana` varchar(255) NOT NULL,
  `suboffice` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pincodes`
--

INSERT INTO `pincodes` (`id`, `city`, `thana`, `suboffice`, `pincode`, `created_at`, `updated_at`) VALUES
(1, 'Barguna', 'Amtali', 'Amtali', '8710', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Barguna', 'Bamna', 'Bamna', '8730', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Barguna', 'Barguna Sadar', 'Barguna Sadar', '8700', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Barguna', 'Barguna Sadar', 'Nali Bandar', '8701', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Barguna', 'Betagi', 'Betagi', '8740', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Barguna', 'Betagi', 'Darul Ulam', '8741', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Barguna', 'Patharghata', 'Kakchira', '8721', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Barguna', 'Patharghata', 'Patharghata', '8720', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Barishal', 'Agailzhara', 'Agailzhara', '8240', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Barishal', 'Agailzhara', 'Gaila', '8241', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Barishal', 'Agailzhara', 'Paisarhat', '8242', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Barishal', 'Babuganj', 'Babuganj', '8210', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Barishal', 'Babuganj', 'Barishal Cadet', '8216', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Barishal', 'Babuganj', 'Chandpasha', '8212', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Barishal', 'Babuganj', 'Madhabpasha', '8213', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Barishal', 'Babuganj', 'Nizamuddin College', '8215', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Barishal', 'Babuganj', 'Rahamatpur', '8211', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Barishal', 'Babuganj', 'Thakur Mallik', '8214', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Barishal', 'Barajalia', 'Barajalia', '8260', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Barishal', 'Barajalia', 'Osman Manjil', '8261', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'Barishal', 'Barishal Sadar', 'Barishal Sadar', '8200', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'Barishal', 'Barishal Sadar', 'Bukhainagar', '8201', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'Barishal', 'Barishal Sadar', 'Jaguarhat', '8206', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'Barishal', 'Barishal Sadar', 'Kashipur', '8205', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'Barishal', 'Barishal Sadar', 'Patang', '8204', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'Barishal', 'Barishal Sadar', 'Saheberhat', '8202', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'Barishal', 'Barishal Sadar', 'Sugandia', '8203', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'Barishal', 'Gouranadi', 'Batajor', '8233', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'Barishal', 'Gouranadi', 'Gouranadi', '8230', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'Barishal', 'Gouranadi', 'Kashemabad', '8232', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'Barishal', 'Gouranadi', 'Tarki Bandar', '8231', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'Barishal', 'Mahendiganj', 'Langutia', '8274', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'Barishal', 'Mahendiganj', 'Laskarpur', '8271', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'Barishal', 'Mahendiganj', 'Mahendiganj', '8270', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'Barishal', 'Mahendiganj', 'Nalgora', '8273', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'Barishal', 'Mahendiganj', 'Ulania', '8272', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'Barishal', 'Muladi', 'Charkalekhan', '8252', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'Barishal', 'Muladi', 'Kazirchar', '8251', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'Barishal', 'Muladi', 'Muladi', '8250', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'Barishal', 'Sahebganj', 'Charamandi', '8281', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'Barishal', 'Sahebganj', 'kalaskati', '8284', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'Barishal', 'Sahebganj', 'Padri Shibpur', '8282', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'Barishal', 'Sahebganj', 'Sahebganj', '8280', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'Barishal', 'Sahebganj', 'Shialguni', '8283', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'Barishal', 'Uzirpur', 'Dakuarhat', '8223', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'Barishal', 'Uzirpur', 'Dhamura', '8221', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'Barishal', 'Uzirpur', 'Jugirkanda', '8222', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'Barishal', 'Uzirpur', 'Shikarpur', '8224', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'Barishal', 'Uzirpur', 'Uzirpur', '8220', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'Bhola', 'Bhola Sadar', 'Bhola Sadar', '8300', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'Bhola', 'Bhola Sadar', 'Joynagar', '8301', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'Bhola', 'Borhanuddin UPO', 'Borhanuddin UPO', '8320', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'Bhola', 'Borhanuddin UPO', 'Mirzakalu', '8321', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'Bhola', 'Charfashion', 'Charfashion', '8340', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'Bhola', 'Charfashion', 'Dularhat', '8341', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'Bhola', 'Charfashion', 'Keramatganj', '8342', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'Bhola', 'Doulatkhan', 'Doulatkhan', '8310', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'Bhola', 'Doulatkhan', 'Hajipur', '8311', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'Bhola', 'Hajirhat', 'Hajirhat', '8360', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'Bhola', 'Hatshoshiganj', 'Hatshoshiganj', '8350', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'Bhola', 'Lalmohan UPO', 'Daurihat', '8331', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'Bhola', 'Lalmohan UPO', 'Gazaria', '8332', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'Bhola', 'Lalmohan UPO', 'Lalmohan UPO', '8330', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'Jhalokathi', 'Jhalokathi Sadar', 'Baukathi', '8402', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'Jhalokathi', 'Jhalokathi Sadar', 'Gabha', '8403', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'Jhalokathi', 'Jhalokathi Sadar', 'Jhalokathi Sadar', '8400', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'Jhalokathi', 'Jhalokathi Sadar', 'Nabagram', '8401', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'Jhalokathi', 'Jhalokathi Sadar', 'Shekherhat', '8404', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'Jhalokathi', 'Kathalia', 'Amua', '8431', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'Jhalokathi', 'Kathalia', 'Kathalia', '8430', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'Jhalokathi', 'Kathalia', 'Niamatee', '8432', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'Jhalokathi', 'Kathalia', 'Shoulajalia', '8433', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'Jhalokathi', 'Nalchhiti', 'Beerkathi', '8421', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'Jhalokathi', 'Nalchhiti', 'Nalchhiti', '8420', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'Jhalokathi', 'Rajapur', 'Rajapur', '8410', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'Patuakhali', 'Bauphal', 'Bagabandar', '8621', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'Patuakhali', 'Bauphal', 'Bauphal', '8620', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'Patuakhali', 'Bauphal', 'Birpasha', '8622', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'Patuakhali', 'Bauphal', 'Kalaia', '8624', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'Patuakhali', 'Bauphal', 'Kalishari', '8623', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'Patuakhali', 'Dashmina', 'Dashmina', '8630', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'Patuakhali', 'Galachipa', 'Galachipa', '8640', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'Patuakhali', 'Galachipa', 'Gazipur Bandar', '8641', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'Patuakhali', 'Khepupara', 'Khepupara', '8650', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'Patuakhali', 'Khepupara', 'Mahipur', '8651', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'Patuakhali', 'Patuakhali Sadar', 'Dumkee', '8602', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'Patuakhali', 'Patuakhali Sadar', 'Moukaran', '8601', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'Patuakhali', 'Patuakhali Sadar', 'Patuakhali Sadar', '8600', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'Patuakhali', 'Patuakhali Sadar', 'Rahimabad', '8603', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'Patuakhali', 'Subidkhali', 'Subidkhali', '8610', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'Pirojpur', 'Banaripara', 'Banaripara', '8530', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'Pirojpur', 'Banaripara', 'Chakhar', '8531', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'Pirojpur', 'Bhandaria', 'Bhandaria', '8550', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'Pirojpur', 'Bhandaria', 'Dhaoa', '8552', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'Pirojpur', 'Bhandaria', 'Kanudashkathi', '8551', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'Pirojpur', 'kaukhali', 'Jolagati', '8513', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'Pirojpur', 'kaukhali', 'Joykul', '8512', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'Pirojpur', 'kaukhali', 'Kaukhali', '8510', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'Pirojpur', 'kaukhali', 'Keundia', '8511', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'Pirojpur', 'Mathbaria', 'Betmor Natun Hat', '8565', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'Pirojpur', 'Mathbaria', 'Gulishakhali', '8563', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'Pirojpur', 'Mathbaria', 'Halta', '8562', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'Pirojpur', 'Mathbaria', 'Mathbaria', '8560', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'Pirojpur', 'Mathbaria', 'Shilarganj', '8566', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'Pirojpur', 'Mathbaria', 'Tiarkhali', '8564', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'Pirojpur', 'Mathbaria', 'Tushkhali', '8561', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'Pirojpur', 'Nazirpur', 'Nazirpur', '8540', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'Pirojpur', 'Nazirpur', 'Sriramkathi', '8541', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'Pirojpur', 'Pirojpur Sadar', 'Hularhat', '8501', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'Pirojpur', 'Pirojpur Sadar', 'Parerhat', '8502', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'Pirojpur', 'Pirojpur Sadar', 'Pirojpur Sadar', '8500', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'Pirojpur', 'Swarupkathi', 'Darus Sunnat', '8521', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'Pirojpur', 'Swarupkathi', 'Jalabari', '8523', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'Pirojpur', 'Swarupkathi', 'Kaurikhara', '8522', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'Pirojpur', 'Swarupkathi', 'Swarupkathi', '8520', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'Bandarban', 'Alikadam', 'Alikadam', '4650', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'Bandarban', 'Bandarban Sadar', 'Bandarban Sadar', '4600', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'Bandarban', 'Naikhong', 'Naikhong', '4660', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'Bandarban', 'Roanchhari', 'Roanchhari', '4610', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'Bandarban', 'Ruma', 'Ruma', '4620', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'Bandarban', 'Thanchi', 'Lama', '4641', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'Bandarban', 'Thanchi', 'Thanchi', '4630', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'Brahmanbaria', 'Akhaura', 'Akhaura', '3450', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'Brahmanbaria', 'Akhaura', 'Azampur', '3451', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'Brahmanbaria', 'Akhaura', 'Gangasagar', '3452', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'Brahmanbaria', 'Banchharampur', 'Banchharampur', '3420', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'Brahmanbaria', 'Brahamanbaria Sadar', 'Ashuganj', '3402', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'Brahmanbaria', 'Brahamanbaria Sadar', 'Ashuganj Share', '3403', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'Brahmanbaria', 'Brahamanbaria Sadar', 'Brahamanbaria Sadar', '3400', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'Brahmanbaria', 'Brahamanbaria Sadar', 'Poun', '3404', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'Brahmanbaria', 'Brahamanbaria Sadar', 'Talshahar', '3401', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'Brahmanbaria', 'Kasba', 'Chandidar', '3462', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'Brahmanbaria', 'Kasba', 'Chargachh', '3463', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'Brahmanbaria', 'Kasba', 'Gopinathpur', '3464', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'Brahmanbaria', 'Kasba', 'Kasba', '3460', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'Brahmanbaria', 'Kasba', 'Kuti', '3461', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'Brahmanbaria', 'Nabinagar', 'Jibanganj', '3419', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'Brahmanbaria', 'Nabinagar', 'Kaitala', '3417', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'Brahmanbaria', 'Nabinagar', 'Laubfatehpur', '3411', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'Brahmanbaria', 'Nabinagar', 'Nabinagar', '3410', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'Brahmanbaria', 'Nabinagar', 'Rasullabad', '3412', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'Brahmanbaria', 'Nabinagar', 'Ratanpur', '3414', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'Brahmanbaria', 'Nabinagar', 'Salimganj', '3418', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'Brahmanbaria', 'Nabinagar', 'Shahapur', '3415', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'Brahmanbaria', 'Nabinagar', 'Shamgram', '3413', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'Brahmanbaria', 'Nasirnagar', 'Fandauk', '3441', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'Brahmanbaria', 'Nasirnagar', 'Nasirnagar', '3440', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'Brahmanbaria', 'Sarail', 'Chandura', '3432', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'Brahmanbaria', 'Sarail', 'Sarial', '3430', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'Brahmanbaria', 'Sarail', 'Shahbajpur', '3431', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'Chandpur', 'Chandpur Sadar', 'Baburhat', '3602', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'Chandpur', 'Chandpur Sadar', 'Chandpur Sadar', '3600', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'Chandpur', 'Chandpur Sadar', 'Puranbazar', '3601', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'Chandpur', 'Chandpur Sadar', 'Sahatali', '3603', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'Chandpur', 'Faridganj', 'Chandra', '3651', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'Chandpur', 'Faridganj', 'Faridganj', '3650', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'Chandpur', 'Faridganj', 'Gridkaliandia', '3653', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'Chandpur', 'Faridganj', 'Islampur Shah Isain ', '3655', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'Chandpur', 'Faridganj', 'Rampurbazar', '3654', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'Chandpur', 'Faridganj', 'Rupsha', '3652', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'Chandpur', 'Hajiganj', 'Bolakhal', '3611', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'Chandpur', 'Hajiganj', 'Hajiganj', '3610', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'Chandpur', 'Hayemchar', 'Gandamara', '3661', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'Chandpur', 'Hayemchar', 'Hayemchar', '3660', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'Chandpur', 'Kachua', 'Kachua', '3630', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'Chandpur', 'Kachua', 'Pak Shrirampur', '3631', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'Chandpur', 'Kachua', 'Rahima Nagar', '3632', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'Chandpur', 'Kachua', 'Shachar', '3633', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'Chandpur', 'Matlobganj', 'Kalipur', '3642', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'Chandpur', 'Matlobganj', 'Matlobganj', '3640', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'Chandpur', 'Matlobganj', 'Mohanpur', '3641', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'Chandpur', 'Shahrasti', 'Chotoshi', '3623', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'Chandpur', 'Shahrasti', 'Islamia Madrasha', '3624', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'Chandpur', 'Shahrasti', 'Khilabazar', '3621', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'Chandpur', 'Shahrasti', 'Pashchim Kherihar Al', '3622', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'Chandpur', 'Shahrasti', 'Shahrasti', '3620', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'Chittagong', 'Anawara', 'Anowara', '4376', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'Chittagong', 'Anawara', 'Battali', '4378', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'Chittagong', 'Anawara', 'Paroikora', '4377', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'Chittagong', 'Boalkhali', 'Boalkhali', '4366', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'Chittagong', 'Boalkhali', 'Charandwip', '4369', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'Chittagong', 'Boalkhali', 'Iqbal Park', '4365', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'Chittagong', 'Boalkhali', 'Kadurkhal', '4368', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'Chittagong', 'Boalkhali', 'Kanungopara', '4363', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'Chittagong', 'Boalkhali', 'Sakpura', '4367', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'Chittagong', 'Boalkhali', 'Saroatoli', '4364', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 'Chittagong', 'Chittagong Sadar', 'Al- Amin Baria Madra', '4221', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'Chittagong', 'Chittagong Sadar', 'Amin Jute Mills', '4211', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'Chittagong', 'Chittagong Sadar', 'Anandabazar', '4215', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'Chittagong', 'Chittagong Sadar', 'Bayezid Bostami', '4210', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 'Chittagong', 'Chittagong Sadar', 'Chandgaon', '4212', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'Chittagong', 'Chittagong Sadar', 'Chawkbazar', '4203', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'Chittagong', 'Chittagong Sadar', 'Chitt. Cantonment', '4220', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'Chittagong', 'Chittagong Sadar', 'Chitt. Customs Acca', '4219', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'Chittagong', 'Chittagong Sadar', 'Chitt. Politechnic In', '4209', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'Chittagong', 'Chittagong Sadar', 'Chitt. Sailers Colon', '4218', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'Chittagong', 'Chittagong Sadar', 'Chittagong Airport', '4205', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'Chittagong', 'Chittagong Sadar', 'Chittagong Bandar', '4100', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'Chittagong', 'Chittagong Sadar', 'Chittagong GPO', '4000', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'Chittagong', 'Chittagong Sadar', 'Export Processing', '4223', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'Chittagong', 'Chittagong Sadar', 'Firozshah', '4207', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'Chittagong', 'Chittagong Sadar', 'Halishahar', '4216', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'Chittagong', 'Chittagong Sadar', 'Halishshar', '4225', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 'Chittagong', 'Chittagong Sadar', 'Jalalabad', '4214', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'Chittagong', 'Chittagong Sadar', 'Jaldia Merine Accade', '4206', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'Chittagong', 'Chittagong Sadar', 'Middle Patenga', '4222', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'Chittagong', 'Chittagong Sadar', 'Mohard', '4208', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'Chittagong', 'Chittagong Sadar', 'North Halishahar', '4226', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 'Chittagong', 'Chittagong Sadar', 'North Katuli', '4217', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'Chittagong', 'Chittagong Sadar', 'Pahartoli', '4202', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'Chittagong', 'Chittagong Sadar', 'Patenga', '4204', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'Chittagong', 'Chittagong Sadar', 'Rampura TSO', '4224', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'Chittagong', 'Chittagong Sadar', 'Wazedia', '4213', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'Chittagong', 'East Joara', 'Barma', '4383', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'Chittagong', 'East Joara', 'Dohazari', '4382', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 'Chittagong', 'East Joara', 'East Joara', '4380', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 'Chittagong', 'East Joara', 'Gachbaria', '4381', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'Chittagong', 'Fatikchhari', 'Bhandar Sharif', '4352', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'Chittagong', 'Fatikchhari', 'Fatikchhari', '4350', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'Chittagong', 'Fatikchhari', 'Harualchhari', '4354', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'Chittagong', 'Fatikchhari', 'Najirhat', '4353', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'Chittagong', 'Fatikchhari', 'Nanupur', '4351', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'Chittagong', 'Fatikchhari', 'Narayanhat', '4355', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'Chittagong', 'Hathazari', 'Chitt.University', '4331', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'Chittagong', 'Hathazari', 'Fatahabad', '4335', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'Chittagong', 'Hathazari', 'Gorduara', '4332', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 'Chittagong', 'Hathazari', 'Hathazari', '4330', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'Chittagong', 'Hathazari', 'Katirhat', '4333', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'Chittagong', 'Hathazari', 'Madrasa', '4339', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 'Chittagong', 'Hathazari', 'Mirzapur', '4334', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'Chittagong', 'Hathazari', 'Nuralibari', '4337', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'Chittagong', 'Hathazari', 'Yunus Nagar', '4338', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'Chittagong', 'Jaldi', 'Banigram', '4393', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'Chittagong', 'Jaldi', 'Gunagari', '4392', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'Chittagong', 'Jaldi', 'Jaldi', '4390', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'Chittagong', 'Jaldi', 'Khan Bahadur', '4391', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'Chittagong', 'Lohagara', 'Chunti', '4398', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'Chittagong', 'Lohagara', 'Lohagara', '4396', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'Chittagong', 'Lohagara', 'Padua', '4397', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'Chittagong', 'Mirsharai', 'Abutorab', '4321', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'Chittagong', 'Mirsharai', 'Azampur', '4325', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'Chittagong', 'Mirsharai', 'Bharawazhat', '4323', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 'Chittagong', 'Mirsharai', 'Darrogahat', '4322', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'Chittagong', 'Mirsharai', 'Joarganj', '4324', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'Chittagong', 'Mirsharai', 'Korerhat', '4327', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 'Chittagong', 'Mirsharai', 'Mirsharai', '4320', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 'Chittagong', 'Mirsharai', 'Mohazanhat', '4328', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 'Chittagong', 'Patiya', 'Budhpara', '4371', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 'Chittagong', 'Patiya', 'Patiya Head Office', '4370', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 'Chittagong', 'Rangunia', 'Dhamair', '4361', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 'Chittagong', 'Rangunia', 'Rangunia', '4360', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 'Chittagong', 'Rouzan', 'B.I.T Post Office', '4349', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 'Chittagong', 'Rouzan', 'Beenajuri', '4341', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 'Chittagong', 'Rouzan', 'Dewanpur', '4347', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 'Chittagong', 'Rouzan', 'Fatepur', '4345', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 'Chittagong', 'Rouzan', 'Gahira', '4343', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 'Chittagong', 'Rouzan', 'Guzra Noapara', '4346', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 'Chittagong', 'Rouzan', 'jagannath Hat', '4344', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 'Chittagong', 'Rouzan', 'Kundeshwari', '4342', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 'Chittagong', 'Rouzan', 'Mohamuni', '4348', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 'Chittagong', 'Rouzan', 'Rouzan', '4340', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 'Chittagong', 'Sandwip', 'Sandwip', '4300', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 'Chittagong', 'Sandwip', 'Shiberhat', '4301', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 'Chittagong', 'Sandwip', 'Urirchar', '4302', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 'Chittagong', 'Satkania', 'Baitul Ijjat', '4387', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 'Chittagong', 'Satkania', 'Bazalia', '4388', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 'Chittagong', 'Satkania', 'Satkania', '4386', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 'Chittagong', 'Sitakunda', 'Barabkunda', '4312', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 'Chittagong', 'Sitakunda', 'Baroidhala', '4311', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 'Chittagong', 'Sitakunda', 'Bawashbaria', '4313', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 'Chittagong', 'Sitakunda', 'Bhatiari', '4315', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 'Chittagong', 'Sitakunda', 'Fouzdarhat', '4316', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 'Chittagong', 'Sitakunda', 'Jafrabad', '4317', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 'Chittagong', 'Sitakunda', 'Kumira', '4314', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 'Chittagong', 'Sitakunda', 'Sitakunda', '4310', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 'Comilla', 'Barura', 'Barura', '3560', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 'Comilla', 'Barura', 'Murdafarganj', '3562', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 'Comilla', 'Barura', 'Poyalgachha', '3561', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 'Comilla', 'Brahmanpara', 'Brahmanpara', '3526', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 'Comilla', 'Burichang', 'Burichang', '3520', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 'Comilla', 'Burichang', 'Maynamoti bazar', '3521', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 'Comilla', 'Chandina', 'Chandia', '3510', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 'Comilla', 'Chandina', 'Madhaiabazar', '3511', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 'Comilla', 'Chouddagram', 'Batisa', '3551', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 'Comilla', 'Chouddagram', 'Chiora', '3552', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 'Comilla', 'Chouddagram', 'Chouddagram', '3550', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 'Comilla', 'Comilla Sadar', 'Comilla Contoment', '3501', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 'Comilla', 'Comilla Sadar', 'Comilla Sadar', '3500', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 'Comilla', 'Comilla Sadar', 'Courtbari', '3503', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 'Comilla', 'Comilla Sadar', 'Halimanagar', '3502', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 'Comilla', 'Comilla Sadar', 'Suaganj', '3504', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 'Comilla', 'Daudkandi', 'Dashpara', '3518', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 'Comilla', 'Daudkandi', 'Daudkandi', '3516', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 'Comilla', 'Daudkandi', 'Eliotganj', '3519', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 'Comilla', 'Daudkandi', 'Gouripur', '3517', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 'Comilla', 'Davidhar', 'Barashalghar', '3532', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 'Comilla', 'Davidhar', 'Davidhar', '3530', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 'Comilla', 'Davidhar', 'Dhamtee', '3533', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 'Comilla', 'Davidhar', 'Gangamandal', '3531', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 'Comilla', 'Homna', 'Homna', '3546', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 'Comilla', 'Laksam', 'Bipulasar', '3572', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 'Comilla', 'Laksam', 'Laksam', '3570', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 'Comilla', 'Laksam', 'Lakshamanpur', '3571', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 'Comilla', 'Langalkot', 'Chhariabazar', '3582', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 'Comilla', 'Langalkot', 'Dhalua', '3581', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 'Comilla', 'Langalkot', 'Gunabati', '3583', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 'Comilla', 'Langalkot', 'Langalkot', '3580', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 'Comilla', 'Muradnagar', 'Bangra', '3543', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 'Comilla', 'Muradnagar', 'Companyganj', '3542', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 'Comilla', 'Muradnagar', 'Muradnagar', '3540', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 'Comilla', 'Muradnagar', 'Pantibazar', '3545', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 'Comilla', 'Muradnagar', 'Ramchandarpur', '3541', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 'Comilla', 'Muradnagar', 'Sonakanda', '3544', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 'Coxs Bazar', 'Chiringga', 'Badarkali', '4742', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 'Coxs Bazar', 'Chiringga', 'Chiringga', '4740', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 'Coxs Bazar', 'Chiringga', 'Chiringga S.O', '4741', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 'Coxs Bazar', 'Chiringga', 'Malumghat', '4743', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 'Coxs Bazar', 'Coxs Bazar Sadar', 'Coxs Bazar Sadar', '4700', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 'Coxs Bazar', 'Coxs Bazar Sadar', 'Eidga', '4702', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 'Coxs Bazar', 'Coxs Bazar Sadar', 'Zhilanja', '4701', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 'Coxs Bazar', 'Gorakghat', 'Gorakghat', '4710', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 'Coxs Bazar', 'Kutubdia', 'Kutubdia', '4720', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 'Coxs Bazar', 'Ramu', 'Ramu', '4730', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 'Coxs Bazar', 'Teknaf', 'Hnila', '4761', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 'Coxs Bazar', 'Teknaf', 'St.Martin', '4762', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 'Coxs Bazar', 'Teknaf', 'Teknaf', '4760', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 'Coxs Bazar', 'Ukhia', 'Ukhia', '4750', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 'Feni', 'Chhagalnaia', 'Chhagalnaia', '3910', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 'Feni', 'Chhagalnaia', 'Daraga Hat', '3912', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, 'Feni', 'Chhagalnaia', 'Maharajganj', '3911', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 'Feni', 'Chhagalnaia', 'Puabashimulia', '3913', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 'Feni', 'Dagonbhuia', 'Chhilonia', '3922', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 'Feni', 'Dagonbhuia', 'Dagondhuia', '3920', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 'Feni', 'Dagonbhuia', 'Dudmukha', '3921', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, 'Feni', 'Dagonbhuia', 'Rajapur', '3923', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, 'Feni', 'Feni Sadar', 'Fazilpur', '3901', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, 'Feni', 'Feni Sadar', 'Feni Sadar', '3900', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, 'Feni', 'Feni Sadar', 'Laskarhat', '3903', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, 'Feni', 'Feni Sadar', 'Sharshadie', '3902', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, 'Feni', 'Pashurampur', 'Fulgazi', '3942', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, 'Feni', 'Pashurampur', 'Munshirhat', '3943', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, 'Feni', 'Pashurampur', 'Pashurampur', '3940', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, 'Feni', 'Pashurampur', 'Shuarbazar', '3941', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, 'Feni', 'Sonagazi', 'Ahmadpur', '3932', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, 'Feni', 'Sonagazi', 'Kazirhat', '3933', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, 'Feni', 'Sonagazi', 'Motiganj', '3931', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, 'Feni', 'Sonagazi', 'Sonagazi', '3930', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, 'Khagrachari', 'Diginala', 'Diginala', '4420', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, 'Khagrachari', 'Khagrachari Sadar', 'Khagrachari Sadar', '4400', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, 'Khagrachari', 'Laxmichhari', 'Laxmichhari', '4470', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, 'Khagrachari', 'Mahalchhari', 'Mahalchhari', '4430', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, 'Khagrachari', 'Manikchhari', 'Manikchhari', '4460', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, 'Khagrachari', 'Matiranga', 'Matiranga', '4450', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, 'Khagrachari', 'Panchhari', 'Panchhari', '4410', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, 'Khagrachari', 'Ramghar Head Office', 'Ramghar Head Office', '4440', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, 'Lakshmipur', 'Char Alexgander', 'Char Alexgander ', '3730', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, 'Lakshmipur', 'Char Alexgander', 'Hajirghat', '3731', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 'Lakshmipur', 'Char Alexgander', 'Ramgatirhat', '3732', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, 'Lakshmipur', 'Lakshimpur Sadar', 'Amani Lakshimpur', '3709', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(360, 'Lakshmipur', 'Lakshimpur Sadar', 'Bhabaniganj', '3702', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(361, 'Lakshmipur', 'Lakshimpur Sadar', 'Chandraganj', '3708', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, 'Lakshmipur', 'Lakshimpur Sadar', 'Choupalli', '3707', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, 'Lakshmipur', 'Lakshimpur Sadar', 'Dalal Bazar', '3701', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, 'Lakshmipur', 'Lakshimpur Sadar', 'Duttapara', '3706', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(365, 'Lakshmipur', 'Lakshimpur Sadar', 'Keramatganj', '3704', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(366, 'Lakshmipur', 'Lakshimpur Sadar', 'Lakshimpur Sadar', '3700', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(367, 'Lakshmipur', 'Lakshimpur Sadar', 'Mandari', '3703', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, 'Lakshmipur', 'Lakshimpur Sadar', 'Rupchara', '3705', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, 'Lakshmipur', 'Ramganj', 'Alipur', '3721', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(370, 'Lakshmipur', 'Ramganj', 'Dolta', '3725', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(371, 'Lakshmipur', 'Ramganj', 'Kanchanpur', '3723', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(372, 'Lakshmipur', 'Ramganj', 'Naagmud', '3724', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, 'Lakshmipur', 'Ramganj', 'Panpara', '3722', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, 'Lakshmipur', 'Ramganj', 'Ramganj', '3720', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, 'Lakshmipur', 'Raypur', 'Bhuabari', '3714', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, 'Lakshmipur', 'Raypur', 'Haydarganj', '3713', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, 'Lakshmipur', 'Raypur', 'Nagerdighirpar', '3712', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, 'Lakshmipur', 'Raypur', 'Rakhallia', '3711', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(379, 'Lakshmipur', 'Raypur', 'Raypur', '3710', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(380, 'Noakhali', 'Basurhat', 'Basur Hat', '3850', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(381, 'Noakhali', 'Basurhat', 'Charhajari', '3851', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(382, 'Noakhali', 'Begumganj', 'Alaiarpur', '3831', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(383, 'Noakhali', 'Begumganj', 'Amisha Para', '3847', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(384, 'Noakhali', 'Begumganj', 'Banglabazar', '3822', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, 'Noakhali', 'Begumganj', 'Bazra', '3824', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(386, 'Noakhali', 'Begumganj', 'Begumganj', '3820', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(387, 'Noakhali', 'Begumganj', 'Bhabani Jibanpur', '3837', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, 'Noakhali', 'Begumganj', 'Choumohani', '3821', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, 'Noakhali', 'Begumganj', 'Dauti', '3843', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, 'Noakhali', 'Begumganj', 'Durgapur', '3848', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, 'Noakhali', 'Begumganj', 'Gopalpur', '3828', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, 'Noakhali', 'Begumganj', 'Jamidar Hat', '3825', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, 'Noakhali', 'Begumganj', 'Joyag', '3844', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, 'Noakhali', 'Begumganj', 'Joynarayanpur', '3829', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, 'Noakhali', 'Begumganj', 'Khalafat Bazar', '3833', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, 'Noakhali', 'Begumganj', 'Khalishpur', '3842', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, 'Noakhali', 'Begumganj', 'Maheshganj', '3838', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, 'Noakhali', 'Begumganj', 'Mir Owarishpur', '3823', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, 'Noakhali', 'Begumganj', 'Nadona', '3839', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, 'Noakhali', 'Begumganj', 'Nandiapara', '3841', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, 'Noakhali', 'Begumganj', 'Oachhekpur', '3835', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, 'Noakhali', 'Begumganj', 'Rajganj', '3834', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, 'Noakhali', 'Begumganj', 'Sonaimuri', '3827', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(404, 'Noakhali', 'Begumganj', 'Tangirpar', '3832', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, 'Noakhali', 'Begumganj', 'Thanar Hat', '3845', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, 'Noakhali', 'Chatkhil', 'Bansa Bazar', '3879', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, 'Noakhali', 'Chatkhil', 'Bodalcourt', '3873', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, 'Noakhali', 'Chatkhil', 'Chatkhil', '3870', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, 'Noakhali', 'Chatkhil', 'Dosh Gharia', '3878', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(410, 'Noakhali', 'Chatkhil', 'Karihati', '3877', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, 'Noakhali', 'Chatkhil', 'Khilpara', '3872', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, 'Noakhali', 'Chatkhil', 'Palla', '3871', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, 'Noakhali', 'Chatkhil', 'Rezzakpur', '3874', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, 'Noakhali', 'Chatkhil', 'Sahapur', '3881', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, 'Noakhali', 'Chatkhil', 'Sampara', '3882', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(416, 'Noakhali', 'Chatkhil', 'Shingbahura', '3883', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(417, 'Noakhali', 'Chatkhil', 'Solla', '3875', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(418, 'Noakhali', 'Hatiya', 'Afazia', '3891', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, 'Noakhali', 'Hatiya', 'Hatiya', '3890', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(420, 'Noakhali', 'Hatiya', 'Tamoraddi', '3892', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(421, 'Noakhali', 'Noakhali Sadar', 'Chaprashir Hat', '3811', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, 'Noakhali', 'Noakhali Sadar', 'Char Jabbar', '3812', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(423, 'Noakhali', 'Noakhali Sadar', 'Charam Tua', '3809', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(424, 'Noakhali', 'Noakhali Sadar', 'Din Monir Hat', '3803', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(425, 'Noakhali', 'Noakhali Sadar', 'Kabirhat', '3807', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(426, 'Noakhali', 'Noakhali Sadar', 'Khalifar Hat', '3808', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(427, 'Noakhali', 'Noakhali Sadar', 'Mriddarhat', '3806', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(428, 'Noakhali', 'Noakhali Sadar', 'Noakhali College', '3801', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(429, 'Noakhali', 'Noakhali Sadar', 'Noakhali Sadar', '3800', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(430, 'Noakhali', 'Noakhali Sadar', 'Pak Kishoreganj', '3804', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(431, 'Noakhali', 'Noakhali Sadar', 'Sonapur', '3802', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, 'Noakhali', 'Senbag', 'Beezbag', '3862', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, 'Noakhali', 'Senbag', 'Chatarpaia', '3864', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(434, 'Noakhali', 'Senbag', 'Kallyandi', '3861', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(435, 'Noakhali', 'Senbag', 'Kankirhat', '3863', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(436, 'Noakhali', 'Senbag', 'Senbag', '3860', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(437, 'Noakhali', 'Senbag', 'T.P. Lamua', '3865', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(438, 'Rangamati', 'Barakal', 'Barakal', '4570', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, 'Rangamati', 'Bilaichhari', 'Bilaichhari', '4550', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(440, 'Rangamati', 'Jarachhari', 'Jarachhari', '4560', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, 'Rangamati', 'Kalampati', 'Betbunia', '4511', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(442, 'Rangamati', 'Kalampati', 'Kalampati', '4510', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(443, 'Rangamati', 'kaptai', 'Chandraghona', '4531', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(444, 'Rangamati', 'kaptai', 'Kaptai', '4530', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(445, 'Rangamati', 'kaptai', 'Kaptai Nuton Bazar', '4533', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(446, 'Rangamati', 'kaptai', 'Kaptai Project', '4532', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(447, 'Rangamati', 'Longachh', 'Longachh', '4580', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(448, 'Rangamati', 'Marishya', 'Marishya', '4590', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(449, 'Rangamati', 'Naniachhar', 'Nanichhar', '4520', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(450, 'Rangamati', 'Rajsthali', 'Rajsthali', '4540', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(451, 'Rangamati', 'Rangamati Sadar', 'Rangamati Sadar', '4500', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, 'Dhaka', 'Demra', 'Demra', '1360', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, 'Dhaka', 'Demra', 'Matuail', '1362', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(454, 'Dhaka', 'Demra', 'Sarulia', '1361', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(455, 'Dhaka', 'Dhaka Cantt.', 'Dhaka CantonmentTSO', '1206', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(456, 'Dhaka', 'Dhamrai', 'Dhamrai', '1350', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(457, 'Dhaka', 'Dhamrai', 'Kamalpur', '1351', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(458, 'Dhaka', 'Dhanmondi', 'Jigatala TSO', '1209', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(459, 'Dhaka', 'Gulshan', 'Banani TSO', '1213', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(460, 'Dhaka', 'Gulshan', 'Gulshan Model Town ', '1212', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(461, 'Dhaka', 'Jatrabari', 'Dhania TSO', '1232', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(462, 'Dhaka', 'Joypara', 'Joypara', '1330', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(463, 'Dhaka', 'Joypara', 'Narisha', '1332', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(464, 'Dhaka', 'Joypara', 'Palamganj', '1331', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(465, 'Dhaka', 'Keraniganj', 'Ati', '1312', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(466, 'Dhaka', 'Keraniganj', 'Dhaka Jute Mills', '1311', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(467, 'Dhaka', 'Keraniganj', 'Kalatia', '1313', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(468, 'Dhaka', 'Keraniganj', 'Keraniganj', '1310', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(469, 'Dhaka', 'Khilgaon', 'KhilgaonTSO', '1219', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(470, 'Dhaka', 'Khilkhet', 'KhilkhetTSO', '1229', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(471, 'Dhaka', 'Lalbag', 'Posta TSO', '1211', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(472, 'Dhaka', 'Mirpur', 'Mirpur TSO', '1216', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(473, 'Dhaka', 'Mohammadpur', 'Mohammadpur Housing ', '1207', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(474, 'Dhaka', 'Mohammadpur', 'Sangsad BhabanTSO', '1225', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(475, 'Dhaka', 'Motijheel', 'BangabhabanTSO', '1222', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(476, 'Dhaka', 'Motijheel', 'DilkushaTSO', '1223', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(477, 'Dhaka', 'Nawabganj', 'Agla', '1323', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(478, 'Dhaka', 'Nawabganj', 'Churain', '1325', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(479, 'Dhaka', 'Nawabganj', 'Daudpur', '1322', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(480, 'Dhaka', 'Nawabganj', 'Hasnabad', '1321', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(481, 'Dhaka', 'Nawabganj', 'Khalpar', '1324', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(482, 'Dhaka', 'Nawabganj', 'Nawabganj', '1320', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(483, 'Dhaka', 'New market', 'New Market TSO', '1205', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(484, 'Dhaka', 'Palton', 'Dhaka GPO', '1000', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(485, 'Dhaka', 'Ramna', 'Shantinagr TSO', '1217', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(486, 'Dhaka', 'Sabujbag', 'Basabo TSO', '1214', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(487, 'Dhaka', 'Savar', 'Amin Bazar', '1348', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(488, 'Dhaka', 'Savar', 'Dairy Farm', '1341', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(489, 'Dhaka', 'Savar', 'EPZ', '1349', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(490, 'Dhaka', 'Savar', 'Jahangirnagar Univer', '1342', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(491, 'Dhaka', 'Savar', 'Kashem Cotton Mills', '1346', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(492, 'Dhaka', 'Savar', 'Rajphulbaria', '1347', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(493, 'Dhaka', 'Savar', 'Savar', '1340', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(494, 'Dhaka', 'Savar', 'Savar Canttonment', '1344', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(495, 'Dhaka', 'Savar', 'Saver P.A.T.C', '1343', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(496, 'Dhaka', 'Savar', 'Shimulia', '1345', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(497, 'Dhaka', 'Sutrapur', 'Dhaka Sadar HO', '1100', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(498, 'Dhaka', 'Sutrapur', 'Gendaria TSO', '1204', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(499, 'Dhaka', 'Sutrapur', 'Wari TSO', '1203', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(500, 'Dhaka', 'Tejgaon', 'Tejgaon TSO', '1215', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(501, 'Dhaka', 'Tejgaon Industrial Area', 'Dhaka Politechnic ', '1208', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(502, 'Dhaka', 'Uttara', 'Uttara Model TwonTSO', '1230', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(503, 'Faridpur', 'Alfadanga', 'Alfadanga', '7870', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(504, 'Faridpur', 'Bhanga', 'Bhanga', '7830', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(505, 'Faridpur', 'Boalmari', 'Boalmari', '7860', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(506, 'Faridpur', 'Boalmari', 'Rupatpat', '7861', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pincodes` (`id`, `city`, `thana`, `suboffice`, `pincode`, `created_at`, `updated_at`) VALUES
(507, 'Faridpur', 'Charbhadrasan', 'Charbadrashan', '7810', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(508, 'Faridpur', 'Faridpur Sadar', 'Ambikapur', '7802', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(509, 'Faridpur', 'Faridpur Sadar', 'Baitulaman Politecni', '7803', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(510, 'Faridpur', 'Faridpur Sadar', 'Faridpursadar', '7800', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(511, 'Faridpur', 'Faridpur Sadar', 'Kanaipur', '7801', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(512, 'Faridpur', 'Madukhali', 'Kamarkali', '7851', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(513, 'Faridpur', 'Madukhali', 'Madukhali', '7850', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(514, 'Faridpur', 'Nagarkanda', 'Nagarkanda', '7840', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(515, 'Faridpur', 'Nagarkanda', 'Talma', '7841', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(516, 'Faridpur', 'Sadarpur', 'Bishwa jaker Manjil', '7822', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(517, 'Faridpur', 'Sadarpur', 'Hat Krishapur', '7821', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(518, 'Faridpur', 'Sadarpur', 'Sadarpur', '7820', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(519, 'Faridpur', 'Shriangan', 'Shriangan', '7804', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(520, 'Gazipur', 'Gazipur Sadar', 'B.O.F', '1703', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(521, 'Gazipur', 'Gazipur Sadar', 'B.R.R', '1701', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(522, 'Gazipur', 'Gazipur Sadar', 'Chandna', '1702', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(523, 'Gazipur', 'Gazipur Sadar', 'Gazipur Sadar', '1700', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(524, 'Gazipur', 'Gazipur Sadar', 'National University', '1704', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(525, 'Gazipur', 'Kaliakaar', 'Kaliakaar', '1750', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(526, 'Gazipur', 'Kaliakaar', 'Safipur', '1751', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(527, 'Gazipur', 'Kaliganj', 'Kaliganj', '1720', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(528, 'Gazipur', 'Kaliganj', 'Pubail', '1721', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(529, 'Gazipur', 'Kaliganj', 'Santanpara', '1722', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(530, 'Gazipur', 'Kaliganj', 'Vaoal Jamalpur', '1723', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(531, 'Gazipur', 'Kapashia', 'kapashia', '1730', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(532, 'Gazipur', 'Monnunagar', 'Ershad Nagar', '1712', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(533, 'Gazipur', 'Monnunagar', 'Monnunagar', '1710', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(534, 'Gazipur', 'Monnunagar', 'Nishat Nagar', '1711', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(535, 'Gazipur', 'Sreepur', 'Barmi', '1743', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(536, 'Gazipur', 'Sreepur', 'Bashamur', '1747', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(537, 'Gazipur', 'Sreepur', 'Boubi', '1748', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(538, 'Gazipur', 'Sreepur', 'Kawraid', '1745', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(539, 'Gazipur', 'Sreepur', 'Satkhamair', '1744', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(540, 'Gazipur', 'Sreepur', 'Sreepur', '1740', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(541, 'Gazipur', 'Sripur', 'Rajendrapur', '1741', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(542, 'Gazipur', 'Sripur', 'Rajendrapur Canttome', '1742', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(543, 'Gopalganj', 'Gopalganj Sadar', 'Barfa', '8102', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(544, 'Gopalganj', 'Gopalganj Sadar', 'Chandradighalia', '8013', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(545, 'Gopalganj', 'Gopalganj Sadar', 'Gopalganj Sadar', '8100', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(546, 'Gopalganj', 'Gopalganj Sadar', 'Ulpur', '8101', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(547, 'Gopalganj', 'Kashiani', 'Jonapur', '8133', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(548, 'Gopalganj', 'Kashiani', 'Kashiani', '8130', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(549, 'Gopalganj', 'Kashiani', 'Ramdia College', '8131', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(550, 'Gopalganj', 'Kashiani', 'Ratoil', '8132', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(551, 'Gopalganj', 'Kotalipara', 'Kotalipara', '8110', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(552, 'Gopalganj', 'Maksudpur', 'Batkiamari', '8141', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(553, 'Gopalganj', 'Maksudpur', 'Khandarpara', '8142', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(554, 'Gopalganj', 'Maksudpur', 'Maksudpur', '8140', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(555, 'Gopalganj', 'Tungipara', 'Patgati', '8121', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(556, 'Gopalganj', 'Tungipara', 'Tungipara', '8120', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(557, 'Jamalpur', 'Dewangonj', 'Dewangonj', '2030', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(558, 'Jamalpur', 'Dewangonj', 'Dewangonj S. Mills', '2031', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(559, 'Jamalpur', 'Islampur', 'Durmoot', '2021', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(560, 'Jamalpur', 'Islampur', 'Gilabari', '2022', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(561, 'Jamalpur', 'Islampur', 'Islampur', '2020', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(562, 'Jamalpur', 'Jamalpur', 'Jamalpur', '2000', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(563, 'Jamalpur', 'Jamalpur', 'Nandina', '2001', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(564, 'Jamalpur', 'Jamalpur', 'Narundi', '2002', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(565, 'Jamalpur', 'Malandah', 'Jamalpur', '2011', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(566, 'Jamalpur', 'Malandah', 'Mahmoodpur', '2013', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(567, 'Jamalpur', 'Malandah', 'Malancha', '2012', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(568, 'Jamalpur', 'Malandah', 'Malandah', '2010', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(569, 'Jamalpur', 'Mathargonj', 'Balijhuri', '2041', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(570, 'Jamalpur', 'Mathargonj', 'Mathargonj', '2040', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(571, 'Jamalpur', 'Shorishabari', 'Bausee', '2052', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(572, 'Jamalpur', 'Shorishabari', 'Gunerbari', '2051', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(573, 'Jamalpur', 'Shorishabari', 'Jagannath Ghat', '2053', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(574, 'Jamalpur', 'Shorishabari', 'Jamuna Sar Karkhana', '2055', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(575, 'Jamalpur', 'Shorishabari', 'Pingna', '2054', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(576, 'Jamalpur', 'Shorishabari', 'Shorishabari', '2050', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(577, 'Kishoreganj', 'Bajitpur', 'Bajitpur', '2336', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(578, 'Kishoreganj', 'Bajitpur', 'Laksmipur', '2338', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(579, 'Kishoreganj', 'Bajitpur', 'Sararchar', '2337', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(580, 'Kishoreganj', 'Bhairob', 'Bhairab', '2350', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(581, 'Kishoreganj', 'Hossenpur', 'Hossenpur', '2320', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(582, 'Kishoreganj', 'Itna', 'Itna', '2390', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(583, 'Kishoreganj', 'Karimganj', 'Karimganj', '2310', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(584, 'Kishoreganj', 'Katiadi', 'Gochhihata', '2331', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(585, 'Kishoreganj', 'Katiadi', 'Katiadi', '2330', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(586, 'Kishoreganj', 'Kishoreganj Sadar', 'Kishoreganj S.Mills', '2301', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(587, 'Kishoreganj', 'Kishoreganj Sadar', 'Kishoreganj Sadar', '2300', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(588, 'Kishoreganj', 'Kishoreganj Sadar', 'Maizhati', '2302', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(589, 'Kishoreganj', 'Kishoreganj Sadar', 'Nilganj', '2303', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(590, 'Kishoreganj', 'Kuliarchar', 'Chhoysuti', '2341', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(591, 'Kishoreganj', 'Kuliarchar', 'Kuliarchar', '2340', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(592, 'Kishoreganj', 'Mithamoin', 'Abdullahpur', '2371', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(593, 'Kishoreganj', 'Mithamoin', 'MIthamoin', '2370', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(594, 'Kishoreganj', 'Nikli', 'Nikli', '2360', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(595, 'Kishoreganj', 'Ostagram', 'Ostagram', '2380', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(596, 'Kishoreganj', 'Pakundia', 'Pakundia', '2326', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(597, 'Kishoreganj', 'Tarial', 'Tarial', '2316', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(598, 'Madaripur', 'Barhamganj', 'Bahadurpur', '7932', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(599, 'Madaripur', 'Barhamganj', 'Barhamganj', '7930', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(600, 'Madaripur', 'Barhamganj', 'Nilaksmibandar', '7931', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(601, 'Madaripur', 'Barhamganj', 'Umedpur', '7933', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(602, 'Madaripur', 'kalkini', 'Kalkini', '7920', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(603, 'Madaripur', 'kalkini', 'Sahabrampur', '7921', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(604, 'Madaripur', 'Madaripur Sadar', 'Charmugria', '7901', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(605, 'Madaripur', 'Madaripur Sadar', 'Habiganj', '7903', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(606, 'Madaripur', 'Madaripur Sadar', 'Kulpaddi', '7902', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(607, 'Madaripur', 'Madaripur Sadar', 'Madaripur Sadar', '7900', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(608, 'Madaripur', 'Madaripur Sadar', 'Mustafapur', '7904', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(609, 'Madaripur', 'Rajoir', 'Khalia', '7911', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(610, 'Madaripur', 'Rajoir', 'Rajoir', '7910', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(611, 'Manikganj', 'Doulatpur', 'Doulatpur', '1860', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(612, 'Manikganj', 'Gheor', 'Gheor', '1840', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(613, 'Manikganj', 'Lechhraganj', 'Jhitka', '1831', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(614, 'Manikganj', 'Lechhraganj', 'Lechhraganj', '1830', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(615, 'Manikganj', 'Manikganj Sadar', 'Barangail', '1804', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(616, 'Manikganj', 'Manikganj Sadar', 'Gorpara', '1802', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(617, 'Manikganj', 'Manikganj Sadar', 'Mahadebpur', '1803', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(618, 'Manikganj', 'Manikganj Sadar', 'Manikganj Bazar', '1801', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(619, 'Manikganj', 'Manikganj Sadar', 'Manikganj Sadar', '1800', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(620, 'Manikganj', 'Saturia', 'Baliati', '1811', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(621, 'Manikganj', 'Saturia', 'Saturia', '1810', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(622, 'Manikganj', 'Shibloya', 'Aricha', '1851', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(623, 'Manikganj', 'Shibloya', 'Shibaloy', '1850', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(624, 'Manikganj', 'Shibloya', 'Tewta', '1852', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(625, 'Manikganj', 'Shibloya', 'Uthli', '1853', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(626, 'Manikganj', 'Singari', 'Baira', '1821', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(627, 'Manikganj', 'Singari', 'joymantop', '1822', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(628, 'Manikganj', 'Singari', 'Singair', '1820', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(629, 'Munshiganj', 'Gajaria', 'Gajaria', '1510', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(630, 'Munshiganj', 'Gajaria', 'Hossendi', '1511', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(631, 'Munshiganj', 'Gajaria', 'Rasulpur', '1512', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(632, 'Munshiganj', 'Lohajong', 'Gouragonj', '1334', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(633, 'Munshiganj', 'Lohajong', 'Gouragonj', '1534', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(634, 'Munshiganj', 'Lohajong', 'Haldia SO', '1532', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(635, 'Munshiganj', 'Lohajong', 'Haridia', '1333', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(636, 'Munshiganj', 'Lohajong', 'Haridia DESO', '1533', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(637, 'Munshiganj', 'Lohajong', 'Korhati', '1531', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(638, 'Munshiganj', 'Lohajong', 'Lohajang', '1530', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(639, 'Munshiganj', 'Lohajong', 'Madini Mandal', '1335', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(640, 'Munshiganj', 'Lohajong', 'Medini Mandal EDSO', '1535', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(641, 'Munshiganj', 'Munshiganj Sadar', 'Kathakhali', '1503', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(642, 'Munshiganj', 'Munshiganj Sadar', 'Mirkadim', '1502', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(643, 'Munshiganj', 'Munshiganj Sadar', 'Munshiganj Sadar', '1500', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(644, 'Munshiganj', 'Munshiganj Sadar', 'Rikabibazar', '1501', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(645, 'Munshiganj', 'Sirajdikhan', 'Ichapur', '1542', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(646, 'Munshiganj', 'Sirajdikhan', 'Kola', '1541', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(647, 'Munshiganj', 'Sirajdikhan', 'Malkha Nagar', '1543', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(648, 'Munshiganj', 'Sirajdikhan', 'Shekher Nagar', '1544', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(649, 'Munshiganj', 'Sirajdikhan', 'Sirajdikhan', '1540', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(650, 'Munshiganj', 'Srinagar', 'Baghra', '1557', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(651, 'Munshiganj', 'Srinagar', 'Barikhal', '1551', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(652, 'Munshiganj', 'Srinagar', 'Bhaggyakul', '1558', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(653, 'Munshiganj', 'Srinagar', 'Hashara', '1553', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(654, 'Munshiganj', 'Srinagar', 'Kolapara', '1554', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(655, 'Munshiganj', 'Srinagar', 'Kumarbhog', '1555', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(656, 'Munshiganj', 'Srinagar', 'Mazpara', '1552', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(657, 'Munshiganj', 'Srinagar', 'Srinagar', '1550', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(658, 'Munshiganj', 'Srinagar', 'Vaggyakul SO', '1556', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(659, 'Munshiganj', 'Tangibari', 'Bajrajugini', '1523', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(660, 'Munshiganj', 'Tangibari', 'Baligao', '1522', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(661, 'Munshiganj', 'Tangibari', 'Betkahat', '1521', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(662, 'Munshiganj', 'Tangibari', 'Dighirpar', '1525', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(663, 'Munshiganj', 'Tangibari', 'Hasail', '1524', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(664, 'Munshiganj', 'Tangibari', 'Pura', '1527', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(665, 'Munshiganj', 'Tangibari', 'Pura EDSO', '1526', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(666, 'Munshiganj', 'Tangibari', 'Tangibari', '1520', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(667, 'Mymensingh', 'Bhaluka', 'Bhaluka', '2240', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(668, 'Mymensingh', 'Fulbaria', 'Fulbaria', '2216', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(669, 'Mymensingh', 'Gaforgaon', 'Duttarbazar', '2234', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(670, 'Mymensingh', 'Gaforgaon', 'Gaforgaon', '2230', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(671, 'Mymensingh', 'Gaforgaon', 'Kandipara', '2233', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(672, 'Mymensingh', 'Gaforgaon', 'Shibganj', '2231', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(673, 'Mymensingh', 'Gaforgaon', 'Usti', '2232', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(674, 'Mymensingh', 'Gouripur', 'Gouripur', '2270', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(675, 'Mymensingh', 'Gouripur', 'Ramgopalpur', '2271', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(676, 'Mymensingh', 'Haluaghat', 'Dhara', '2261', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(677, 'Mymensingh', 'Haluaghat', 'Haluaghat', '2260', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(678, 'Mymensingh', 'Haluaghat', 'Munshirhat', '2262', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(679, 'Mymensingh', 'Isshwargonj', 'Atharabari', '2282', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(680, 'Mymensingh', 'Isshwargonj', 'Isshwargonj', '2280', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(681, 'Mymensingh', 'Isshwargonj', 'Sohagi', '2281', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(682, 'Mymensingh', 'Muktagachha', 'Muktagachha', '2210', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(683, 'Mymensingh', 'Mymensingh Sadar', 'Agriculture Universi', '2202', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(684, 'Mymensingh', 'Mymensingh Sadar', 'Biddyaganj', '2204', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(685, 'Mymensingh', 'Mymensingh Sadar', 'Kawatkhali', '2201', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(686, 'Mymensingh', 'Mymensingh Sadar', 'Mymensingh Sadar', '2200', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(687, 'Mymensingh', 'Mymensingh Sadar', 'Pearpur', '2205', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(688, 'Mymensingh', 'Mymensingh Sadar', 'Shombhuganj', '2203', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(689, 'Mymensingh', 'Nandail', 'Gangail', '2291', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(690, 'Mymensingh', 'Nandail', 'Nandail', '2290', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(691, 'Mymensingh', 'Phulpur', 'Beltia', '2251', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(692, 'Mymensingh', 'Phulpur', 'Phulpur', '2250', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(693, 'Mymensingh', 'Phulpur', 'Tarakanda', '2252', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(694, 'Mymensingh', 'Trishal', 'Ahmadbad', '2221', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(695, 'Mymensingh', 'Trishal', 'Dhala', '2223', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(696, 'Mymensingh', 'Trishal', 'Ram Amritaganj', '2222', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(697, 'Mymensingh', 'Trishal', 'Trishal', '2220', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(698, 'Narayanganj', 'Araihazar', 'Araihazar', '1450', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(699, 'Narayanganj', 'Araihazar', 'Gopaldi', '1451', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(700, 'Narayanganj', 'Baidder Bazar', 'Baidder Bazar', '1440', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(701, 'Narayanganj', 'Baidder Bazar', 'Bara Nagar', '1441', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(702, 'Narayanganj', 'Baidder Bazar', 'Barodi', '1442', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(703, 'Narayanganj', 'Bandar', 'Bandar', '1410', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(704, 'Narayanganj', 'Bandar', 'BIDS', '1413', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(705, 'Narayanganj', 'Bandar', 'D.C Mills', '1411', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(706, 'Narayanganj', 'Bandar', 'Madanganj', '1414', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(707, 'Narayanganj', 'Bandar', 'Nabiganj', '1412', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(708, 'Narayanganj', 'Fatullah', 'Fatulla Bazar', '1421', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(709, 'Narayanganj', 'Fatullah', 'Fatullah', '1420', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(710, 'Narayanganj', 'Narayanganj Sadar', 'Narayanganj Sadar', '1400', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(711, 'Narayanganj', 'Rupganj', 'Bhulta', '1462', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(712, 'Narayanganj', 'Rupganj', 'Kanchan', '1461', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(713, 'Narayanganj', 'Rupganj', 'Murapara', '1464', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(714, 'Narayanganj', 'Rupganj', 'Nagri', '1463', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(715, 'Narayanganj', 'Rupganj', 'Rupganj', '1460', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(716, 'Narayanganj', 'Siddirganj', 'Adamjeenagar', '1431', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(717, 'Narayanganj', 'Siddirganj', 'LN Mills', '1432', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(718, 'Narayanganj', 'Siddirganj', 'Siddirganj', '1430', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(719, 'Narshingdi', 'Belabo', 'Belabo', '1640', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(720, 'Narshingdi', 'Monohordi', 'Hatirdia', '1651', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(721, 'Narshingdi', 'Monohordi', 'Katabaria', '1652', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(722, 'Narshingdi', 'Monohordi', 'Monohordi', '1650', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(723, 'Narshingdi', 'Narshingdi Sadar', 'Karimpur', '1605', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(724, 'Narshingdi', 'Narshingdi Sadar', 'Madhabdi', '1604', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(725, 'Narshingdi', 'Narshingdi Sadar', 'Narshingdi College', '1602', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(726, 'Narshingdi', 'Narshingdi Sadar', 'Narshingdi Sadar', '1600', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(727, 'Narshingdi', 'Narshingdi Sadar', 'Panchdona', '1603', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(728, 'Narshingdi', 'Narshingdi Sadar', 'UMC Jute Mills', '1601', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(729, 'Narshingdi', 'Palash', 'Char Sindhur', '1612', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(730, 'Narshingdi', 'Palash', 'Ghorashal', '1613', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(731, 'Narshingdi', 'Palash', 'Ghorashal Urea Facto', '1611', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(732, 'Narshingdi', 'Palash', 'Palash', '1610', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(733, 'Narshingdi', 'Raypura', 'Bazar Hasnabad', '1631', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(734, 'Narshingdi', 'Raypura', 'Radhaganj bazar', '1632', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(735, 'Narshingdi', 'Raypura', 'Raypura', '1630', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(736, 'Narshingdi', 'Shibpur', 'Shibpur', '1620', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(737, 'Netrakona', ' Susung Durgapur', 'Susnng Durgapur', '2420', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(738, 'Netrakona', 'Atpara', 'Atpara', '2470', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(739, 'Netrakona', 'Barhatta', 'Barhatta', '2440', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(740, 'Netrakona', 'Dharmapasha', 'Dharampasha', '2450', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(741, 'Netrakona', 'Dhobaura', 'Dhobaura', '2416', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(742, 'Netrakona', 'Dhobaura', 'Sakoai', '2417', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(743, 'Netrakona', 'Kalmakanda', 'Kalmakanda', '2430', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(744, 'Netrakona', 'Kendua', 'Kendua', '2480', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(745, 'Netrakona', 'Khaliajuri', 'Khaliajhri', '2460', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(746, 'Netrakona', 'Khaliajuri', 'Shaldigha', '2462', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(747, 'Netrakona', 'Madan', 'Madan', '2490', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(748, 'Netrakona', 'Moddhynagar', 'Moddoynagar', '2456', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(749, 'Netrakona', 'Mohanganj', 'Mohanganj', '2446', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(750, 'Netrakona', 'Netrakona Sadar', 'Baikherhati', '2401', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(751, 'Netrakona', 'Netrakona Sadar', 'Netrakona Sadar', '2400', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(752, 'Netrakona', 'Purbadhola', 'Jaria Jhanjhail', '2412', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(753, 'Netrakona', 'Purbadhola', 'Purbadhola', '2410', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(754, 'Netrakona', 'Purbadhola', 'Shamgonj', '2411', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(755, 'Rajbari', 'Baliakandi', 'Baliakandi', '7730', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(756, 'Rajbari', 'Baliakandi', 'Nalia', '7731', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(757, 'Rajbari', 'Pangsha', 'Mrigibazar', '7723', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(758, 'Rajbari', 'Pangsha', 'Pangsha', '7720', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(759, 'Rajbari', 'Pangsha', 'Ramkol', '7721', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(760, 'Rajbari', 'Pangsha', 'Ratandia', '7722', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(761, 'Rajbari', 'Rajbari Sadar', 'Goalanda', '7710', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(762, 'Rajbari', 'Rajbari Sadar', 'Khankhanapur', '7711', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(763, 'Rajbari', 'Rajbari Sadar', 'Rajbari Sadar', '7700', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(764, 'Shariatpur', 'Bhedorganj', 'Bhedorganj', '8030', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(765, 'Shariatpur', 'Damudhya', 'Damudhya', '8040', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(766, 'Shariatpur', 'Gosairhat', 'Gosairhat', '8050', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(767, 'Shariatpur', 'Jajira', 'Jajira', '8010', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(768, 'Shariatpur', 'Naria', 'Bhozeshwar', '8021', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(769, 'Shariatpur', 'Naria', 'Gharisar', '8022', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(770, 'Shariatpur', 'Naria', 'Kartikpur', '8024', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(771, 'Shariatpur', 'Naria', 'Naria', '8020', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(772, 'Shariatpur', 'Naria', 'Upshi', '8023', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(773, 'Shariatpur', 'Shariatpur Sadar', 'Angaria', '8001', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(774, 'Shariatpur', 'Shariatpur Sadar', 'Chikandi', '8002', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(775, 'Shariatpur', 'Shariatpur Sadar', 'Shariatpur Sadar', '8000', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(776, 'Sherpur', 'Bakshigonj', 'Bakshigonj', '2140', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(777, 'Sherpur', 'Jhinaigati', 'Jhinaigati', '2120', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(778, 'Sherpur', 'Nakla', 'Gonopaddi', '2151', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(779, 'Sherpur', 'Nakla', 'Nakla', '2150', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(780, 'Sherpur', 'Nalitabari', 'Hatibandha', '2111', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(781, 'Sherpur', 'Nalitabari', 'Nalitabari', '2110', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(782, 'Sherpur', 'Sherpur Shadar', 'Sherpur Shadar', '2100', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(783, 'Sherpur', 'Shribardi', 'Shribardi', '2130', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(784, 'Tangail', 'Basail', 'Basail', '1920', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(785, 'Tangail', 'Bhuapur', 'Bhuapur', '1960', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(786, 'Tangail', 'Delduar', 'Delduar', '1910', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(787, 'Tangail', 'Delduar', 'Elasin', '1913', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(788, 'Tangail', 'Delduar', 'Hinga Nagar', '1914', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(789, 'Tangail', 'Delduar', 'Jangalia', '1911', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(790, 'Tangail', 'Delduar', 'Lowhati', '1915', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(791, 'Tangail', 'Delduar', 'Patharail', '1912', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(792, 'Tangail', 'Ghatail', 'D. Pakutia', '1982', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(793, 'Tangail', 'Ghatail', 'Dhalapara', '1983', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(794, 'Tangail', 'Ghatail', 'Ghatial', '1980', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(795, 'Tangail', 'Ghatail', 'Lohani', '1984', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(796, 'Tangail', 'Ghatail', 'Zahidganj', '1981', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(797, 'Tangail', 'Gopalpur', 'Gopalpur', '1990', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(798, 'Tangail', 'Gopalpur', 'Hemnagar', '1992', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(799, 'Tangail', 'Gopalpur', 'Jhowail', '1991', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(800, 'Tangail', 'Kalihati', 'Ballabazar', '1973', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(801, 'Tangail', 'Kalihati', 'Elinga', '1974', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(802, 'Tangail', 'Kalihati', 'Kalihati', '1970', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(803, 'Tangail', 'Kalihati', 'Nagarbari', '1977', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(804, 'Tangail', 'Kalihati', 'Nagarbari SO', '1976', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(805, 'Tangail', 'Kalihati', 'Nagbari', '1972', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(806, 'Tangail', 'Kalihati', 'Palisha', '1975', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(807, 'Tangail', 'Kalihati', 'Rajafair', '1971', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(808, 'Tangail', 'Kashkaolia', 'Kashkawlia', '1930', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(809, 'Tangail', 'Madhupur', 'Dhobari', '1997', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(810, 'Tangail', 'Madhupur', 'Madhupur', '1996', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(811, 'Tangail', 'Mirzapur', 'Gorai', '1941', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(812, 'Tangail', 'Mirzapur', 'Jarmuki', '1944', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(813, 'Tangail', 'Mirzapur', 'M.C. College', '1942', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(814, 'Tangail', 'Mirzapur', 'Mirzapur', '1940', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(815, 'Tangail', 'Mirzapur', 'Mohera', '1945', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(816, 'Tangail', 'Mirzapur', 'Warri paikpara', '1943', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(817, 'Tangail', 'Nagarpur', 'Dhuburia', '1937', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(818, 'Tangail', 'Nagarpur', 'Nagarpur', '1936', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(819, 'Tangail', 'Nagarpur', 'Salimabad', '1938', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(820, 'Tangail', 'Sakhipur', 'Kochua', '1951', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(821, 'Tangail', 'Sakhipur', 'Sakhipur', '1950', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(822, 'Tangail', 'Tangail Sadar', 'Kagmari', '1901', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(823, 'Tangail', 'Tangail Sadar', 'Korotia', '1903', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(824, 'Tangail', 'Tangail Sadar', 'Purabari', '1904', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(825, 'Tangail', 'Tangail Sadar', 'Santosh', '1902', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(826, 'Tangail', 'Tangail Sadar', 'Tangail Sadar', '1900', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(827, 'Bagherhat', 'Bagerhat Sadar', 'Bagerhat Sadar', '9300', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(828, 'Bagherhat', 'Bagerhat Sadar', 'P.C College', '9301', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(829, 'Bagherhat', 'Bagerhat Sadar', 'Rangdia', '9302', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(830, 'Bagherhat', 'Chalna Ankorage', 'Chalna Ankorage', '9350', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(831, 'Bagherhat', 'Chalna Ankorage', 'Mongla Port', '9351', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(832, 'Bagherhat', 'Chitalmari', 'Barabaria', '9361', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(833, 'Bagherhat', 'Chitalmari', 'Chitalmari', '9360', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(834, 'Bagherhat', 'Fakirhat', 'Bhanganpar Bazar', '9372', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(835, 'Bagherhat', 'Fakirhat', 'Fakirhat', '9370', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(836, 'Bagherhat', 'Fakirhat', 'Mansa', '9371', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(837, 'Bagherhat', 'Kachua UPO', 'Kachua', '9310', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(838, 'Bagherhat', 'Kachua UPO', 'Sonarkola', '9311', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(839, 'Bagherhat', 'Mollahat', 'Charkulia', '9383', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(840, 'Bagherhat', 'Mollahat', 'Dariala', '9382', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(841, 'Bagherhat', 'Mollahat', 'Kahalpur', '9381', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(842, 'Bagherhat', 'Mollahat', 'Mollahat', '9380', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(843, 'Bagherhat', 'Mollahat', 'Nagarkandi', '9384', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(844, 'Bagherhat', 'Mollahat', 'Pak Gangni', '9385', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(845, 'Bagherhat', 'Morelganj', 'Morelganj', '9320', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(846, 'Bagherhat', 'Morelganj', 'Sannasi Bazar', '9321', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(847, 'Bagherhat', 'Morelganj', 'Telisatee', '9322', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(848, 'Bagherhat', 'Rampal', 'Foylahat', '9341', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(849, 'Bagherhat', 'Rampal', 'Gourambha', '9343', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(850, 'Bagherhat', 'Rampal', 'Rampal', '9340', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(851, 'Bagherhat', 'Rampal', 'Sonatunia', '9342', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(852, 'Bagherhat', 'Rayenda', 'Rayenda', '9330', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(853, 'Chuadanga', 'Alamdanga', 'Alamdanga', '7210', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(854, 'Chuadanga', 'Alamdanga', 'Hardi', '7211', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(855, 'Chuadanga', 'Chuadanga Sadar', 'Chuadanga Sadar', '7200', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(856, 'Chuadanga', 'Chuadanga Sadar', 'Munshiganj', '7201', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(857, 'Chuadanga', 'Damurhuda', 'Andulbaria', '7222', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(858, 'Chuadanga', 'Damurhuda', 'Damurhuda', '7220', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(859, 'Chuadanga', 'Damurhuda', 'Darshana', '7221', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(860, 'Chuadanga', 'Doulatganj', 'Doulatganj', '7230', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(861, 'Jessore', 'Bagharpara', 'Bagharpara', '7470', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(862, 'Jessore', 'Bagharpara', 'Gouranagar', '7471', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(863, 'Jessore', 'Chaugachha', 'Chougachha', '7410', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(864, 'Jessore', 'Jessore Sadar', 'Basundia', '7406', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(865, 'Jessore', 'Jessore Sadar', 'Chanchra', '7402', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(866, 'Jessore', 'Jessore Sadar', 'Churamankathi', '7407', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(867, 'Jessore', 'Jessore Sadar', 'Jessore Airbach', '7404', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(868, 'Jessore', 'Jessore Sadar', 'Jessore canttonment', '7403', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(869, 'Jessore', 'Jessore Sadar', 'Jessore Sadar', '7400', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(870, 'Jessore', 'Jessore Sadar', 'Jessore Upa-Shahar', '7401', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(871, 'Jessore', 'Jessore Sadar', 'Rupdia', '7405', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(872, 'Jessore', 'Jhikargachha', 'Jhikargachha', '7420', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(873, 'Jessore', 'Keshabpur', 'Keshobpur', '7450', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(874, 'Jessore', 'Monirampur', 'Monirampur', '7440', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(875, 'Jessore', 'Noapara', 'Bhugilhat', '7462', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(876, 'Jessore', 'Noapara', 'Noapara', '7460', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(877, 'Jessore', 'Noapara', 'Rajghat', '7461', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(878, 'Jessore', 'Sarsa', 'Bag Achra', '7433', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(879, 'Jessore', 'Sarsa', 'Benapole', '7431', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(880, 'Jessore', 'Sarsa', 'Jadabpur', '7432', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(881, 'Jessore', 'Sarsa', 'Sarsa', '7430', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(882, 'Jinaidaha', 'Harinakundu', 'Harinakundu', '7310', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(883, 'Jinaidaha', 'Jinaidaha Sadar', 'Jinaidaha Cadet College', '7301', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(884, 'Jinaidaha', 'Jinaidaha Sadar', 'Jinaidaha Sadar', '7300', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(885, 'Jinaidaha', 'Kotchandpur', 'Kotchandpur', '7330', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(886, 'Jinaidaha', 'Maheshpur', 'Maheshpur', '7340', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(887, 'Jinaidaha', 'Naldanga', 'Hatbar Bazar', '7351', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(888, 'Jinaidaha', 'Naldanga', 'Naldanga', '7350', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(889, 'Jinaidaha', 'Shailakupa', 'Kumiradaha', '7321', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(890, 'Jinaidaha', 'Shailakupa', 'Shailakupa', '7320', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(891, 'Khulna', 'Alaipur', 'Alaipur', '9240', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(892, 'Khulna', 'Alaipur', 'Belphulia', '9242', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(893, 'Khulna', 'Alaipur', 'Rupsha', '9241', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(894, 'Khulna', 'Batiaghat', 'Batiaghat', '9260', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(895, 'Khulna', 'Batiaghat', 'Surkalee', '9261', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(896, 'Khulna', 'Chalna Bazar', 'Bajua', '9272', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(897, 'Khulna', 'Chalna Bazar', 'Chalna Bazar', '9270', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(898, 'Khulna', 'Chalna Bazar', 'Dakup', '9271', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(899, 'Khulna', 'Chalna Bazar', 'Nalian', '9273', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(900, 'Khulna', 'Digalia', 'Chandni Mahal', '9221', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(901, 'Khulna', 'Digalia', 'Digalia', '9220', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(902, 'Khulna', 'Digalia', 'Gazirhat', '9224', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(903, 'Khulna', 'Digalia', 'Ghoshghati', '9223', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(904, 'Khulna', 'Digalia', 'Senhati', '9222', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(905, 'Khulna', 'Khulna Sadar', 'Atra Shilpa Area', '9207', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(906, 'Khulna', 'Khulna Sadar', 'BIT Khulna', '9203', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(907, 'Khulna', 'Khulna Sadar', 'Doulatpur', '9202', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(908, 'Khulna', 'Khulna Sadar', 'Jahanabad Canttonmen', '9205', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(909, 'Khulna', 'Khulna Sadar', 'Khula Sadar', '9100', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(910, 'Khulna', 'Khulna Sadar', 'Khulna G.P.O', '9000', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(911, 'Khulna', 'Khulna Sadar', 'Khulna Shipyard', '9201', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(912, 'Khulna', 'Khulna Sadar', 'Khulna University', '9208', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(913, 'Khulna', 'Khulna Sadar', 'Siramani', '9204', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(914, 'Khulna', 'Khulna Sadar', 'Sonali Jute Mills', '9206', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(915, 'Khulna', 'Madinabad', 'Amadee', '9291', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(916, 'Khulna', 'Madinabad', 'Madinabad', '9290', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(917, 'Khulna', 'Paikgachha', 'Chandkhali', '9284', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(918, 'Khulna', 'Paikgachha', 'Garaikhali', '9285', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(919, 'Khulna', 'Paikgachha', 'Godaipur', '9281', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(920, 'Khulna', 'Paikgachha', 'Kapilmoni', '9282', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(921, 'Khulna', 'Paikgachha', 'Katipara', '9283', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(922, 'Khulna', 'Paikgachha', 'Paikgachha', '9280', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(923, 'Khulna', 'Phultala', 'Phultala', '9210', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(924, 'Khulna', 'Sajiara', 'Chuknagar', '9252', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(925, 'Khulna', 'Sajiara', 'Ghonabanda', '9251', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(926, 'Khulna', 'Sajiara', 'Sajiara', '9250', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(927, 'Khulna', 'Sajiara', 'Shahapur', '9253', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(928, 'Khulna', 'Terakhada', 'Pak Barasat', '9231', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(929, 'Khulna', 'Terakhada', 'Terakhada', '9230', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(930, 'Kustia', 'Bheramara', 'Allardarga', '7042', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(931, 'Kustia', 'Bheramara', 'Bheramara', '7040', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(932, 'Kustia', 'Bheramara', 'Ganges Bheramara', '7041', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(933, 'Kustia', 'Janipur', 'Janipur', '7020', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(934, 'Kustia', 'Janipur', 'Khoksa', '7021', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(935, 'Kustia', 'Kumarkhali', 'Kumarkhali', '7010', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(936, 'Kustia', 'Kumarkhali', 'Panti', '7011', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(937, 'Kustia', 'Kustia Sadar', 'Islami University', '7003', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(938, 'Kustia', 'Kustia Sadar', 'Jagati', '7002', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(939, 'Kustia', 'Kustia Sadar', 'Kushtia Mohini', '7001', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(940, 'Kustia', 'Kustia Sadar', 'Kustia Sadar', '7000', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(941, 'Kustia', 'Mirpur', 'Amla Sadarpur', '7032', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(942, 'Kustia', 'Mirpur', 'Mirpur', '7030', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(943, 'Kustia', 'Mirpur', 'Poradaha', '7031', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(944, 'Kustia', 'Rafayetpur', 'Khasmathurapur', '7052', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(945, 'Kustia', 'Rafayetpur', 'Rafayetpur', '7050', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(946, 'Kustia', 'Rafayetpur', 'Taragunia', '7051', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(947, 'Magura', 'Arpara', 'Arpara', '7620', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(948, 'Magura', 'Magura Sadar', 'Magura Sadar', '7600', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(949, 'Magura', 'Mohammadpur', 'Binodpur', '7631', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(950, 'Magura', 'Mohammadpur', 'Mohammadpur', '7630', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(951, 'Magura', 'Mohammadpur', 'Nahata', '7632', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(952, 'Magura', 'Shripur', 'Langalbadh', '7611', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(953, 'Magura', 'Shripur', 'Nachol', '7612', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(954, 'Magura', 'Shripur', 'Shripur', '7610', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(955, 'Meherpur', 'Gangni', 'Gangni', '7110', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(956, 'Meherpur', 'Meherpur Sadar', 'Amjhupi', '7101', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(957, 'Meherpur', 'Meherpur Sadar', 'Amjhupi', '7152', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(958, 'Meherpur', 'Meherpur Sadar', 'Meherpur Sadar', '7100', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(959, 'Meherpur', 'Meherpur Sadar', 'Mujib Nagar Complex', '7102', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(960, 'Narail', 'Kalia', 'Kalia', '7520', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(961, 'Narail', 'Laxmipasha', 'Baradia', '7514', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(962, 'Narail', 'Laxmipasha', 'Itna', '7512', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(963, 'Narail', 'Laxmipasha', 'Laxmipasha', '7510', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(964, 'Narail', 'Laxmipasha', 'Lohagora', '7511', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(965, 'Narail', 'Laxmipasha', 'Naldi', '7513', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(966, 'Narail', 'Mohajan', 'Mohajan', '7521', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(967, 'Narail', 'Narail Sadar', 'Narail Sadar', '7500', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(968, 'Narail', 'Narail Sadar', 'Ratanganj', '7501', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(969, 'Satkhira', 'Ashashuni', 'Ashashuni', '9460', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(970, 'Satkhira', 'Ashashuni', 'Baradal', '9461', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(971, 'Satkhira', 'Debbhata', 'Debbhata', '9430', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(972, 'Satkhira', 'Debbhata', 'Gurugram', '9431', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(973, 'Satkhira', 'kalaroa', 'Chandanpur', '9415', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(974, 'Satkhira', 'kalaroa', 'Hamidpur', '9413', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(975, 'Satkhira', 'kalaroa', 'Jhaudanga', '9412', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(976, 'Satkhira', 'kalaroa', 'kalaroa', '9410', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(977, 'Satkhira', 'kalaroa', 'Khordo', '9414', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(978, 'Satkhira', 'kalaroa', 'Murarikati', '9411', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(979, 'Satkhira', 'Kaliganj UPO', 'Kaliganj UPO', '9440', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(980, 'Satkhira', 'Kaliganj UPO', 'Nalta Mubaroknagar', '9441', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(981, 'Satkhira', 'Kaliganj UPO', 'Ratanpur ', '9442', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(982, 'Satkhira', 'Nakipur', 'Buri Goalini', '9453', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(983, 'Satkhira', 'Nakipur', 'Gabura', '9454', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(984, 'Satkhira', 'Nakipur', 'Habinagar', '9455', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(985, 'Satkhira', 'Nakipur', 'Nakipur', '9450', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(986, 'Satkhira', 'Nakipur', 'Naobeki', '9452', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(987, 'Satkhira', 'Nakipur', 'Noornagar', '9451', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(988, 'Satkhira', 'Satkhira Sadar', 'Budhhat', '9403', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(989, 'Satkhira', 'Satkhira Sadar', 'Gunakar kati', '9402', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(990, 'Satkhira', 'Satkhira Sadar', 'Satkhira Islamia Acc', '9401', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(991, 'Satkhira', 'Satkhira Sadar', 'Satkhira Sadar', '9400', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(992, 'Satkhira', 'Taala', 'Patkelghata', '9421', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(993, 'Satkhira', 'Taala', 'Taala', '9420', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(994, 'Bogra', 'Alamdighi', 'Adamdighi', '5890', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(995, 'Bogra', 'Alamdighi', 'Nasharatpur', '5892', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(996, 'Bogra', 'Alamdighi', 'Santahar', '5891', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(997, 'Bogra', 'Bogra Sadar', 'Bogra Canttonment', '5801', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(998, 'Bogra', 'Bogra Sadar', 'Bogra Sadar', '5800', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(999, 'Bogra', 'Dhunat', 'Dhunat', '5850', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1000, 'Bogra', 'Dhunat', 'Gosaibari', '5851', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1001, 'Bogra', 'Dupchachia', 'Dupchachia', '5880', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1002, 'Bogra', 'Dupchachia', 'Talora', '5881', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1003, 'Bogra', 'Gabtoli', 'Gabtoli', '5820', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1004, 'Bogra', 'Gabtoli', 'Sukhanpukur', '5821', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1005, 'Bogra', 'Kahalu', 'Kahalu', '5870', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1006, 'Bogra', 'Nandigram', 'Nandigram', '5860', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1007, 'Bogra', 'Sariakandi', 'Chandan Baisha', '5831', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1008, 'Bogra', 'Sariakandi', 'Sariakandi', '5830', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1009, 'Bogra', 'Sherpur', 'Chandaikona', '5841', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1010, 'Bogra', 'Sherpur', 'Palli Unnyan Accadem', '5842', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1011, 'Bogra', 'Sherpur', 'Sherpur', '5840', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1012, 'Bogra', 'Shibganj', 'Shibganj', '5810', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1013, 'Bogra', 'Sonatola', 'Sonatola', '5826', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1014, 'Chapinawabganj', 'Bholahat', 'Bholahat', '6330', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pincodes` (`id`, `city`, `thana`, `suboffice`, `pincode`, `created_at`, `updated_at`) VALUES
(1015, 'Chapinawabganj', 'Chapinawabganj Sadar', 'Amnura', '6303', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1016, 'Chapinawabganj', 'Chapinawabganj Sadar', 'Chapinawbganj Sadar', '6300', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1017, 'Chapinawabganj', 'Chapinawabganj Sadar', 'Rajarampur', '6301', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1018, 'Chapinawabganj', 'Chapinawabganj Sadar', 'Ramchandrapur', '6302', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1019, 'Chapinawabganj', 'Nachol', 'Mandumala', '6311', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1020, 'Chapinawabganj', 'Nachol', 'Nachol', '6310', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1021, 'Chapinawabganj', 'Rohanpur', 'Gomashtapur', '6321', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1022, 'Chapinawabganj', 'Rohanpur', 'Rohanpur', '6320', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1023, 'Chapinawabganj', 'Shibganj U.P.O', 'Kansart', '6341', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1024, 'Chapinawabganj', 'Shibganj U.P.O', 'Manaksha', '6342', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1025, 'Chapinawabganj', 'Shibganj U.P.O', 'Shibganj U.P.O', '6340', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1026, 'Joypurhat', 'Akkelpur', 'Akklepur', '5940', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1027, 'Joypurhat', 'Akkelpur', 'jamalganj', '5941', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1028, 'Joypurhat', 'Akkelpur', 'Tilakpur', '5942', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1029, 'Joypurhat', 'Joypurhat Sadar', 'Joypurhat Sadar', '5900', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1030, 'Joypurhat', 'kalai', 'kalai', '5930', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1031, 'Joypurhat', 'Khetlal', 'Khetlal', '5920', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1032, 'Joypurhat', 'panchbibi', 'Panchbibi', '5910', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1033, 'Naogaon', 'Ahsanganj', 'Ahsanganj', '6596', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1034, 'Naogaon', 'Ahsanganj', 'Bandai', '6597', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1035, 'Naogaon', 'Badalgachhi', 'Badalgachhi', '6570', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1036, 'Naogaon', 'Dhamuirhat', 'Dhamuirhat', '6580', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1037, 'Naogaon', 'Mahadebpur', 'Mahadebpur', '6530', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1038, 'Naogaon', 'Naogaon Sadar', 'Naogaon Sadar', '6500', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1039, 'Naogaon', 'Niamatpur', 'Niamatpur', '6520', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1040, 'Naogaon', 'Nitpur', 'Nitpur', '6550', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1041, 'Naogaon', 'Nitpur', 'Panguria', '6552', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1042, 'Naogaon', 'Nitpur', 'Porsa', '6551', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1043, 'Naogaon', 'Patnitala', 'Patnitala', '6540', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1044, 'Naogaon', 'Prasadpur', 'Balihar', '6512', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1045, 'Naogaon', 'Prasadpur', 'Manda', '6511', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1046, 'Naogaon', 'Prasadpur', 'Prasadpur', '6510', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1047, 'Naogaon', 'Raninagar', 'Kashimpur', '6591', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1048, 'Naogaon', 'Raninagar', 'Raninagar', '6590', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1049, 'Naogaon', 'Sapahar', 'Moduhil', '6561', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1050, 'Naogaon', 'Sapahar', 'Sapahar', '6560', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1051, 'Natore', 'Gopalpur UPO', 'Abdulpur', '6422', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1052, 'Natore', 'Gopalpur UPO', 'Gopalpur U.P.O', '6420', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1053, 'Natore', 'Gopalpur UPO', 'Lalpur S.O', '6421', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1054, 'Natore', 'Harua', 'Baraigram', '6432', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1055, 'Natore', 'Harua', 'Dayarampur', '6431', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1056, 'Natore', 'Harua', 'Harua', '6430', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1057, 'Natore', 'Hatgurudaspur', 'Hatgurudaspur', '6440', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1058, 'Natore', 'Laxman', 'Laxman', '6410', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1059, 'Natore', 'Natore Sadar', 'Baiddyabal Gharia', '6402', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1060, 'Natore', 'Natore Sadar', 'Digapatia', '6401', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1061, 'Natore', 'Natore Sadar', 'Madhnagar', '6403', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1062, 'Natore', 'Natore Sadar', 'Natore Sadar', '6400', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1063, 'Natore', 'Singra', 'Singra', '6450', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1064, 'Pabna', 'Banwarinagar', 'Banwarinagar', '6650', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1065, 'Pabna', 'Bera', 'Bera', '6680', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1066, 'Pabna', 'Bera', 'Kashinathpur', '6682', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1067, 'Pabna', 'Bera', 'Nakalia', '6681', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1068, 'Pabna', 'Bera', 'Puran Bharenga', '6683', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1069, 'Pabna', 'Bhangura', 'Bhangura', '6640', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1070, 'Pabna', 'Chatmohar', 'Chatmohar', '6630', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1071, 'Pabna', 'Debottar', 'Debottar', '6610', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1072, 'Pabna', 'Ishwardi', 'Dhapari', '6621', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1073, 'Pabna', 'Ishwardi', 'Ishwardi', '6620', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1074, 'Pabna', 'Ishwardi', 'Pakshi', '6622', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1075, 'Pabna', 'Ishwardi', 'Rajapur', '6623', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1076, 'Pabna', 'Pabna Sadar', 'Hamayetpur', '6602', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1077, 'Pabna', 'Pabna Sadar', 'Kaliko Cotton Mills', '6601', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1078, 'Pabna', 'Pabna Sadar', 'Pabna Sadar', '6600', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1079, 'Pabna', 'Sathia', 'Sathia', '6670', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1080, 'Pabna', 'Sujanagar', 'Sagarkandi', '6661', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1081, 'Pabna', 'Sujanagar', 'Sujanagar', '6660', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1082, 'Rajshahi', 'Bagha', 'Arani', '6281', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1083, 'Rajshahi', 'Bagha', 'Bagha', '6280', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1084, 'Rajshahi', 'Bhabaniganj', 'Bhabaniganj', '6250', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1085, 'Rajshahi', 'Bhabaniganj', 'Taharpur', '6251', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1086, 'Rajshahi', 'Charghat', 'Charghat', '6270', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1087, 'Rajshahi', 'Charghat', 'Sarda', '6271', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1088, 'Rajshahi', 'Durgapur', 'Durgapur', '6240', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1089, 'Rajshahi', 'Godagari', 'Godagari', '6290', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1090, 'Rajshahi', 'Godagari', 'Premtoli', '6291', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1091, 'Rajshahi', 'Khod Mohanpur', 'Khodmohanpur', '6220', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1092, 'Rajshahi', 'Lalitganj', 'Lalitganj', '6210', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1093, 'Rajshahi', 'Lalitganj', 'Rajshahi Sugar Mills', '6211', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1094, 'Rajshahi', 'Lalitganj', 'Shyampur', '6212', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1095, 'Rajshahi', 'Putia', 'Putia', '6260', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1096, 'Rajshahi', 'Rajshahi Sadar', 'Binodpur Bazar', '6206', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1097, 'Rajshahi', 'Rajshahi Sadar', 'Ghuramara', '6100', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1098, 'Rajshahi', 'Rajshahi Sadar', 'Kazla', '6204', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1099, 'Rajshahi', 'Rajshahi Sadar', 'Rajshahi Canttonment', '6202', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1100, 'Rajshahi', 'Rajshahi Sadar', 'Rajshahi Court', '6201', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1101, 'Rajshahi', 'Rajshahi Sadar', 'Rajshahi Sadar', '6000', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1102, 'Rajshahi', 'Rajshahi Sadar', 'Rajshahi University', '6205', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1103, 'Rajshahi', 'Rajshahi Sadar', 'Sapura', '6203', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1104, 'Rajshahi', 'Tanor', 'Tanor', '6230', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1105, 'Sirajganj', 'Baiddya Jam Toil', 'Baiddya Jam Toil', '6730', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1106, 'Sirajganj', 'Belkuchi', 'Belkuchi', '6740', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1107, 'Sirajganj', 'Belkuchi', 'Enayetpur', '6751', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1108, 'Sirajganj', 'Belkuchi', 'Rajapur', '6742', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1109, 'Sirajganj', 'Belkuchi', 'Sohagpur', '6741', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1110, 'Sirajganj', 'Belkuchi', 'Sthal', '6752', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1111, 'Sirajganj', 'Dhangora', 'Dhangora', '6720', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1112, 'Sirajganj', 'Dhangora', 'Malonga', '6721', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1113, 'Sirajganj', 'Kazipur', 'Gandail', '6712', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1114, 'Sirajganj', 'Kazipur', 'Kazipur', '6710', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1115, 'Sirajganj', 'Kazipur', 'Shuvgachha', '6711', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1116, 'Sirajganj', 'Shahjadpur', 'Jamirta', '6772', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1117, 'Sirajganj', 'Shahjadpur', 'Kaijuri', '6773', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1118, 'Sirajganj', 'Shahjadpur', 'Porjana', '6771', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1119, 'Sirajganj', 'Shahjadpur', 'Shahjadpur', '6770', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1120, 'Sirajganj', 'Sirajganj Sadar', 'Raipur', '6701', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1121, 'Sirajganj', 'Sirajganj Sadar', 'Rashidabad', '6702', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1122, 'Sirajganj', 'Sirajganj Sadar', 'Sirajganj Sadar', '6700', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1123, 'Sirajganj', 'Tarash', 'Tarash', '6780', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1124, 'Sirajganj', 'Ullapara', 'Lahiri Mohanpur', '6762', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1125, 'Sirajganj', 'Ullapara', 'Salap', '6763', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1126, 'Sirajganj', 'Ullapara', 'Ullapara', '6760', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1127, 'Sirajganj', 'Ullapara', 'Ullapara R.S', '6761', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1128, 'Hobiganj', 'Azmireeganj', 'Azmireeganj', '3360', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1129, 'Hobiganj', 'Bahubal', 'Bahubal', '3310', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1130, 'Hobiganj', 'Baniachang', 'Baniachang', '3350', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1131, 'Hobiganj', 'Baniachang', 'Jatrapasha', '3351', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1132, 'Hobiganj', 'Baniachang', 'Kadirganj', '3352', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1133, 'Hobiganj', 'Chunarughat', 'Chandpurbagan', '3321', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1134, 'Hobiganj', 'Chunarughat', 'Chunarughat', '3320', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1135, 'Hobiganj', 'Chunarughat', 'Narapati', '3322', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1136, 'Hobiganj', 'Hobiganj Sadar', 'Gopaya', '3302', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1137, 'Hobiganj', 'Hobiganj Sadar', 'Hobiganj Sadar', '3300', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1138, 'Hobiganj', 'Hobiganj Sadar', 'Shaestaganj', '3301', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1139, 'Hobiganj', 'Kalauk', 'Kalauk', '3340', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1140, 'Hobiganj', 'Kalauk', 'Lakhai', '3341', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1141, 'Hobiganj', 'Madhabpur', 'Itakhola', '3331', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1142, 'Hobiganj', 'Madhabpur', 'Madhabpur', '3330', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1143, 'Hobiganj', 'Madhabpur', 'Saihamnagar', '3333', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1144, 'Hobiganj', 'Madhabpur', 'Shahajibazar', '3332', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1145, 'Hobiganj', 'Nabiganj', 'Digalbak', '3373', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1146, 'Hobiganj', 'Nabiganj', 'Golduba', '3372', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1147, 'Hobiganj', 'Nabiganj', 'Goplarbazar', '3371', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1148, 'Hobiganj', 'Nabiganj', 'Inathganj', '3374', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1149, 'Hobiganj', 'Nabiganj', 'Nabiganj', '3370', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1150, 'Moulvibazar', 'Baralekha', 'Baralekha', '3250', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1151, 'Moulvibazar', 'Baralekha', 'Dhakkhinbag', '3252', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1152, 'Moulvibazar', 'Baralekha', 'Juri', '3251', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1153, 'Moulvibazar', 'Baralekha', 'Purbashahabajpur', '3253', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1154, 'Moulvibazar', 'Kamalganj', 'Kamalganj', '3220', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1155, 'Moulvibazar', 'Kamalganj', 'Keramatnaga', '3221', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1156, 'Moulvibazar', 'Kamalganj', 'Munshibazar', '3224', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1157, 'Moulvibazar', 'Kamalganj', 'Patrakhola', '3222', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1158, 'Moulvibazar', 'Kamalganj', 'Shamsher Nagar', '3223', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1159, 'Moulvibazar', 'Kulaura', 'Baramchal', '3237', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1160, 'Moulvibazar', 'Kulaura', 'Kajaldhara', '3234', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1161, 'Moulvibazar', 'Kulaura', 'Karimpur', '3235', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1162, 'Moulvibazar', 'Kulaura', 'Kulaura', '3230', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1163, 'Moulvibazar', 'Kulaura', 'Langla', '3232', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1164, 'Moulvibazar', 'Kulaura', 'Prithimpasha', '3233', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1165, 'Moulvibazar', 'Kulaura', 'Tillagaon', '3231', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1166, 'Moulvibazar', 'Moulvibazar Sadar', 'Afrozganj', '3203', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1167, 'Moulvibazar', 'Moulvibazar Sadar', 'Barakapan', '3201', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1168, 'Moulvibazar', 'Moulvibazar Sadar', 'Monumukh', '3202', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1169, 'Moulvibazar', 'Moulvibazar Sadar', 'Moulvibazar Sadar', '3200', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1170, 'Moulvibazar', 'Rajnagar', 'Rajnagar', '3240', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1171, 'Moulvibazar', 'Srimangal', 'Kalighat', '3212', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1172, 'Moulvibazar', 'Srimangal', 'Khejurichhara', '3213', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1173, 'Moulvibazar', 'Srimangal', 'Narain Chora', '3211', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1174, 'Moulvibazar', 'Srimangal', 'Satgaon', '3214', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1175, 'Moulvibazar', 'Srimangal', 'Srimangal', '3210', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1176, 'Sunamganj', 'Bishamsarpur', 'Bishamsapur', '3010', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1177, 'Sunamganj', 'Chhatak', 'Chhatak', '3080', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1178, 'Sunamganj', 'Chhatak', 'Chhatak Cement Facto', '3081', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1179, 'Sunamganj', 'Chhatak', 'Chhatak Paper Mills', '3082', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1180, 'Sunamganj', 'Chhatak', 'Chourangi Bazar', '3893', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1181, 'Sunamganj', 'Chhatak', 'Gabindaganj', '3083', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1182, 'Sunamganj', 'Chhatak', 'Gabindaganj Natun Ba', '3084', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1183, 'Sunamganj', 'Chhatak', 'Islamabad', '3088', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1184, 'Sunamganj', 'Chhatak', 'jahidpur', '3087', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1185, 'Sunamganj', 'Chhatak', 'Khurma', '3085', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1186, 'Sunamganj', 'Chhatak', 'Moinpur', '3086', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1187, 'Sunamganj', 'Dhirai Chandpur', 'Dhirai Chandpur', '3040', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1188, 'Sunamganj', 'Dhirai Chandpur', 'Jagdal', '3041', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1189, 'Sunamganj', 'Duara bazar', 'Duara bazar', '3070', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1190, 'Sunamganj', 'Ghungiar', 'Ghungiar', '3050', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1191, 'Sunamganj', 'Jagnnathpur', 'Atuajan', '3062', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1192, 'Sunamganj', 'Jagnnathpur', 'Hasan Fatemapur', '3063', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1193, 'Sunamganj', 'Jagnnathpur', 'Jagnnathpur', '3060', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1194, 'Sunamganj', 'Jagnnathpur', 'Rasulganj', '3064', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1195, 'Sunamganj', 'Jagnnathpur', 'Shiramsi', '3065', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1196, 'Sunamganj', 'Jagnnathpur', 'Syedpur', '3061', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1197, 'Sunamganj', 'Sachna', 'Sachna', '3020', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1198, 'Sunamganj', 'Sunamganj Sadar', 'Pagla', '3001', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1199, 'Sunamganj', 'Sunamganj Sadar', 'Patharia', '3002', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1200, 'Sunamganj', 'Sunamganj Sadar', 'Sunamganj Sadar', '3000', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1201, 'Sunamganj', 'Tahirpur', 'Tahirpur', '3030', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1202, 'Sylhet', 'Balaganj', 'Balaganj', '3120', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1203, 'Sylhet', 'Balaganj', 'Begumpur', '3125', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1204, 'Sylhet', 'Balaganj', 'Brahman Shashon', '3122', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1205, 'Sylhet', 'Balaganj', 'Gaharpur', '3128', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1206, 'Sylhet', 'Balaganj', 'Goala Bazar', '3124', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1207, 'Sylhet', 'Balaganj', 'Karua', '3121', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1208, 'Sylhet', 'Balaganj', 'Kathal Khair', '3127', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1209, 'Sylhet', 'Balaganj', 'Natun Bazar', '3129', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1210, 'Sylhet', 'Balaganj', 'Omarpur', '3126', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1211, 'Sylhet', 'Balaganj', 'Tajpur', '3123', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1212, 'Sylhet', 'Bianibazar', 'Bianibazar', '3170', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1213, 'Sylhet', 'Bianibazar', 'Churkai ', '3175', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1214, 'Sylhet', 'Bianibazar', 'jaldup', '3171', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1215, 'Sylhet', 'Bianibazar', 'Kurar bazar', '3173', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1216, 'Sylhet', 'Bianibazar', 'Mathiura', '3172', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1217, 'Sylhet', 'Bianibazar', 'Salia bazar', '3174', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1218, 'Sylhet', 'Bishwanath', 'Bishwanath', '3130', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1219, 'Sylhet', 'Bishwanath', 'Dashghar', '3131', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1220, 'Sylhet', 'Bishwanath', 'Deokalas', '3133', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1221, 'Sylhet', 'Bishwanath', 'Doulathpur', '3132', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1222, 'Sylhet', 'Bishwanath', 'Singer kanch', '3134', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1223, 'Sylhet', 'Fenchuganj', 'Fenchuganj', '3116', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1224, 'Sylhet', 'Fenchuganj', 'Fenchuganj SareKarkh', '3117', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1225, 'Sylhet', 'Goainhat', 'Chiknagul', '3152', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1226, 'Sylhet', 'Goainhat', 'Goainhat', '3150', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1227, 'Sylhet', 'Goainhat', 'Jaflong', '3151', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1228, 'Sylhet', 'Gopalganj', 'banigram', '3164', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1229, 'Sylhet', 'Gopalganj', 'Chandanpur', '3165', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1230, 'Sylhet', 'Gopalganj', 'Dakkhin Bhadashore', '3162', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1231, 'Sylhet', 'Gopalganj', 'Dhaka Dakkhin', '3161', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1232, 'Sylhet', 'Gopalganj', 'Gopalgannj', '3160', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1233, 'Sylhet', 'Gopalganj', 'Ranaping', '3163', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1234, 'Sylhet', 'Jaintapur', 'Jainthapur', '3156', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1235, 'Sylhet', 'Jakiganj', 'Ichhamati', '3191', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1236, 'Sylhet', 'Jakiganj', 'Jakiganj', '3190', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1237, 'Sylhet', 'Kanaighat', 'Chatulbazar', '3181', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1238, 'Sylhet', 'Kanaighat', 'Gachbari', '3183', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1239, 'Sylhet', 'Kanaighat', 'Kanaighat', '3180', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1240, 'Sylhet', 'Kanaighat', 'Manikganj', '3182', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1241, 'Sylhet', 'Kompanyganj', 'Kompanyganj', '3140', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1242, 'Sylhet', 'Sylhet Sadar', 'Birahimpur', '3106', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1243, 'Sylhet', 'Sylhet Sadar', 'Jalalabad', '3107', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1244, 'Sylhet', 'Sylhet Sadar', 'Jalalabad Cantoment', '3104', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1245, 'Sylhet', 'Sylhet Sadar', 'Kadamtali', '3111', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1246, 'Sylhet', 'Sylhet Sadar', 'Kamalbazer', '3112', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1247, 'Sylhet', 'Sylhet Sadar', 'Khadimnagar', '3103', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1248, 'Sylhet', 'Sylhet Sadar', 'Lalbazar', '3113', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1249, 'Sylhet', 'Sylhet Sadar', 'Mogla', '3108', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1250, 'Sylhet', 'Sylhet Sadar', 'Ranga Hajiganj', '3109', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1251, 'Sylhet', 'Sylhet Sadar', 'Shahajalal Science &', '3114', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1252, 'Sylhet', 'Sylhet Sadar', 'Silam', '3105', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1253, 'Sylhet', 'Sylhet Sadar', 'Sylhe Sadar', '3100', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1254, 'Sylhet', 'Sylhet Sadar', 'Sylhet Biman Bondar', '3102', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1255, 'Sylhet', 'Sylhet Sadar', 'Sylhet Cadet Col', '3101', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1256, 'Dinajpur', 'Bangla Hili', 'Bangla Hili', '5270', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1257, 'Dinajpur', 'Biral', 'Biral', '5210', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1258, 'Dinajpur', 'Birampur', 'Birampur', '5266', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1259, 'Dinajpur', 'Birganj', 'Birganj', '5220', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1260, 'Dinajpur', 'Chrirbandar', 'Chrirbandar', '5240', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1261, 'Dinajpur', 'Chrirbandar', 'Ranirbandar', '5241', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1262, 'Dinajpur', 'Dinajpur Sadar', 'Dinajpur Rajbari', '5201', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1263, 'Dinajpur', 'Dinajpur Sadar', 'Dinajpur Sadar', '5200', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1264, 'Dinajpur', 'Khansama', 'Khansama', '5230', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1265, 'Dinajpur', 'Khansama', 'Pakarhat', '5231', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1266, 'Dinajpur', 'Maharajganj', 'Maharajganj', '5226', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1267, 'Dinajpur', 'Nababganj', 'Daudpur', '5281', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1268, 'Dinajpur', 'Nababganj', 'Gopalpur', '5282', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1269, 'Dinajpur', 'Nababganj', 'Nababganj', '5280', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1270, 'Dinajpur', 'Osmanpur', 'Ghoraghat', '5291', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1271, 'Dinajpur', 'Osmanpur', 'Osmanpur', '5290', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1272, 'Dinajpur', 'Parbatipur', 'Parbatipur', '5250', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1273, 'Dinajpur', 'Phulbari', 'Phulbari', '5260', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1274, 'Dinajpur', 'Setabganj', 'Setabganj', '5216', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1275, 'Gaibandha', 'Bonarpara', 'Bonarpara', '5750', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1276, 'Gaibandha', 'Bonarpara', 'saghata', '5751', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1277, 'Gaibandha', 'Gaibandha Sadar', 'Gaibandha Sadar', '5700', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1278, 'Gaibandha', 'Gobindaganj', 'Gobindhaganj', '5740', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1279, 'Gaibandha', 'Gobindaganj', 'Mahimaganj', '5741', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1280, 'Gaibandha', 'Palashbari', 'Palashbari', '5730', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1281, 'Gaibandha', 'Phulchhari', 'Bharatkhali', '5761', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1282, 'Gaibandha', 'Phulchhari', 'Phulchhari', '5760', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1283, 'Gaibandha', 'Saadullapur', 'Naldanga', '5711', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1284, 'Gaibandha', 'Saadullapur', 'Saadullapur', '5710', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1285, 'Gaibandha', 'Sundarganj', 'Bamandanga', '5721', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1286, 'Gaibandha', 'Sundarganj', 'Sundarganj', '5720', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1287, 'Kurigram', 'Bhurungamari', 'Bhurungamari', '5670', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1288, 'Kurigram', 'Chilmari', 'Chilmari', '5630', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1289, 'Kurigram', 'Chilmari', 'Jorgachh', '5631', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1290, 'Kurigram', 'Kurigram Sadar', 'Kurigram Sadar', '5600', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1291, 'Kurigram', 'Kurigram Sadar', 'Pandul', '5601', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1292, 'Kurigram', 'Kurigram Sadar', 'Phulbari', '5680', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1293, 'Kurigram', 'Nageshwar', 'Nageshwar', '5660', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1294, 'Kurigram', 'Rajarhat', 'Nazimkhan', '5611', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1295, 'Kurigram', 'Rajarhat', 'Rajarhat', '5610', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1296, 'Kurigram', 'Rajibpur', 'Rajibpur', '5650', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1297, 'Kurigram', 'Roumari', 'Roumari', '5640', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1298, 'Kurigram', 'Ulipur', 'Bazarhat', '5621', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1299, 'Kurigram', 'Ulipur', 'Ulipur', '5620', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1300, 'Lalmonirhat', 'Aditmari', 'Aditmari', '5510', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1301, 'Lalmonirhat', 'Hatibandha', 'Hatibandha', '5530', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1302, 'Lalmonirhat', 'Lalmonirhat Sadar', 'Kulaghat SO', '5502', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1303, 'Lalmonirhat', 'Lalmonirhat Sadar', 'Lalmonirhat Sadar', '5500', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1304, 'Lalmonirhat', 'Lalmonirhat Sadar', 'Moghalhat', '5501', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1305, 'Lalmonirhat', 'Patgram', 'Baura', '5541', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1306, 'Lalmonirhat', 'Patgram', 'Burimari', '5542', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1307, 'Lalmonirhat', 'Patgram', 'Patgram', '5540', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1308, 'Lalmonirhat', 'Tushbhandar', 'Tushbhandar', '5520', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1309, 'Nilphamari', 'Dimla', 'Dimla', '5350', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1310, 'Nilphamari', 'Dimla', 'Ghaga Kharibari', '5351', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1311, 'Nilphamari', 'Domar', 'Chilahati', '5341', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1312, 'Nilphamari', 'Domar', 'Domar', '5340', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1313, 'Nilphamari', 'Jaldhaka', 'Jaldhaka', '5330', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1314, 'Nilphamari', 'Kishoriganj', 'Kishoriganj', '5320', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1315, 'Nilphamari', 'Nilphamari Sadar', 'Nilphamari Sadar', '5300', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1316, 'Nilphamari', 'Nilphamari Sadar', 'Nilphamari Sugar Mil', '5301', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1317, 'Nilphamari', 'Syedpur', 'Syedpur', '5310', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1318, 'Nilphamari', 'Syedpur', 'Syedpur Upashahar', '5311', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1319, 'Panchagarh', 'Boda', 'Boda', '5010', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1320, 'Panchagarh', 'Chotto Dab', 'Chotto Dab', '5040', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1321, 'Panchagarh', 'Chotto Dab', 'Mirjapur', '5041', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1322, 'Panchagarh', 'Dabiganj', 'Dabiganj', '5020', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1323, 'Panchagarh', 'Panchagra Sadar', 'Panchagar Sadar', '5000', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1324, 'Panchagarh', 'Tetulia', 'Tetulia', '5030', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1325, 'Rangpur', 'Badarganj', 'Badarganj', '5430', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1326, 'Rangpur', 'Badarganj', 'Shyampur', '5431', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1327, 'Rangpur', 'Gangachara', 'Gangachara', '5410', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1328, 'Rangpur', 'Kaunia', 'Haragachh', '5441', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1329, 'Rangpur', 'Kaunia', 'Kaunia', '5440', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1330, 'Rangpur', 'Mithapukur', 'Mithapukur', '5460', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1331, 'Rangpur', 'Pirgachha', 'Pirgachha', '5450', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1332, 'Rangpur', 'Rangpur Sadar', 'Alamnagar', '5402', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1333, 'Rangpur', 'Rangpur Sadar', 'Mahiganj', '5403', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1334, 'Rangpur', 'Rangpur Sadar', 'Rangpur Cadet Colleg', '5404', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1335, 'Rangpur', 'Rangpur Sadar', 'Rangpur Carmiecal Col', '5405', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1336, 'Rangpur', 'Rangpur Sadar', 'Rangpur Sadar', '5400', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1337, 'Rangpur', 'Rangpur Sadar', 'Rangpur Upa-Shahar', '5401', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1338, 'Rangpur', 'Taraganj', 'Taraganj', '5420', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1339, 'Thakurgaon', 'Baliadangi', 'Baliadangi', '5140', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1340, 'Thakurgaon', 'Baliadangi', 'Lahiri', '5141', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1341, 'Thakurgaon', 'Jibanpur', 'Jibanpur', '5130', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1342, 'Thakurgaon', 'Pirganj', 'Pirganj', '5110', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1343, 'Thakurgaon', 'Pirganj', 'Pirganj', '5470', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1344, 'Thakurgaon', 'Rani Sankail', 'Nekmarad', '5121', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1345, 'Thakurgaon', 'Rani Sankail', 'Rani Sankail', '5120', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1346, 'Thakurgaon', 'Thakurgaon Sadar', 'Ruhia', '5103', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1347, 'Thakurgaon', 'Thakurgaon Sadar', 'Shibganj', '5102', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1348, 'Thakurgaon', 'Thakurgaon Sadar', 'Thakurgaon Road', '5101', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1349, 'Thakurgaon', 'Thakurgaon Sadar', 'Thakurgaon Sadar', '5100', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `care` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sleeve` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pattern` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `price` double(8,2) NOT NULL,
  `weight` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature_item` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `product_code`, `product_color`, `description`, `care`, `sleeve`, `pattern`, `status`, `price`, `weight`, `image`, `video`, `feature_item`, `created_at`, `updated_at`) VALUES
(2, 2, 'Casual Red T-Shirt', 'RT001', 'Red', '<p><font color=\"#00ffff\">Nice red casual t-shirt﻿</font></p>', '<ol><li>Not Washable</li><li>100% Cotton</li></ol>', 'Short Sleeve', 'Plain', 1, 500.00, 200, '13078.jpg', '', 1, '2020-10-04 20:05:20', '2020-11-24 17:06:31'),
(3, 2, 'Green Casual T-shirt', 'GT001', 'Green', 'Nice Green Casual T-shirt', '', '', '', 1, 450.00, 0, '55266.jpg', '', 1, '2020-10-04 20:07:34', '2020-10-08 08:13:24'),
(4, 5, 'Casual Shoes', 'CS001', 'gray', 'nice shoe', '', '', '', 1, 850.00, 0, '37242.jpg', '', 1, '2020-10-05 19:11:10', '2020-10-08 07:17:47'),
(5, 6, 'Sports Shoes', 'SS001', 'Black', 'Nice Black sports shoes', '', '', '', 1, 1000.00, 0, '62868.jpg', '', 1, '2020-10-05 19:13:33', '2020-10-08 07:17:47'),
(6, 2, 'Blue Casual T-Shirts', 'BCT001', 'Blue', 'Nice Blue Casual t-shirt', '', '', '', 1, 500.00, 0, '68871.jpg', '', 1, '2020-10-05 19:15:01', '2020-10-08 07:33:28'),
(7, 2, 'Pink Casual T-Shirt', 'PCT001', 'Pink', '', '', '', '', 1, 450.00, 0, '37193.jpg', '', 1, '2020-10-05 19:16:24', '2020-10-08 08:13:18'),
(8, 7, 'Sky Blue Women Tops', 'SBWT001', 'Sky Blue', 'Nice Women tops', '', '', '', 1, 1200.00, 0, '31352.jpg', '', 1, '2020-10-05 19:19:45', '2020-10-08 07:17:16'),
(9, 2, 'Grand blue shirt', 'GBS001', 'Blue', '', '', '', '', 1, 1050.00, 0, '12858.jpg', '', 1, '2020-10-08 06:50:46', '2020-10-08 08:13:19'),
(10, 7, 'Gray T-Shirt', 'GTS001', 'Gray', 'Nice', 'Wash and Cotton', '', '', 1, 1000.00, 0, '8924.png', 'big_buck_bunny_720p_2mb.mp4', 1, '2020-10-26 08:20:01', '2020-11-02 04:09:04');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `sku`, `size`, `price`, `stock`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'RT001-S', 'Small', 500.00, 9, 1, '2020-10-05 03:08:02', '2020-11-10 08:56:18'),
(2, 2, 'RT001-M', 'Medium', 600.00, 13, 1, '2020-10-05 03:08:03', '2020-11-24 15:31:50'),
(3, 2, 'RT001-L', 'Large', 700.00, 1, 1, '2020-10-05 03:08:03', '2020-11-08 02:49:28'),
(4, 3, 'GT001-S', 'Small', 450.00, 10, 1, '2020-10-05 03:12:03', '2020-10-06 19:50:42'),
(5, 3, 'GT001-M', 'Medium', 550.00, 20, 1, '2020-10-05 03:12:03', '2020-10-06 19:50:42'),
(7, 3, 'GT001-L', 'Large', 650.00, 10, 1, '2020-10-05 03:45:49', '2020-10-06 19:50:42'),
(8, 4, 'CS001-S', 'Small', 850.00, 10, 1, '2020-10-06 19:52:07', '2020-10-06 19:52:07'),
(9, 4, 'CS001-M', 'Medium', 950.00, 20, 1, '2020-10-06 19:52:08', '2020-10-06 19:52:08'),
(10, 4, 'CS001-L', 'Large', 1050.00, 10, 1, '2020-10-06 19:52:08', '2020-10-06 19:52:08'),
(11, 5, 'SS001-S', 'Small', 1000.00, 10, 1, '2020-10-06 19:53:55', '2020-10-06 19:53:55'),
(12, 5, 'SS001-M', 'Medium', 1100.00, 15, 1, '2020-10-06 19:53:55', '2020-10-06 19:53:55'),
(13, 5, 'SS001-L', 'Large', 1200.00, 10, 1, '2020-10-06 19:53:55', '2020-10-06 19:53:55'),
(14, 6, 'BCT001', 'Small', 500.00, 9, 1, '2020-10-06 19:55:40', '2020-11-24 10:09:11'),
(15, 6, 'BCT001', 'Medium', 600.00, 9, 1, '2020-10-06 19:55:40', '2020-11-24 10:09:11'),
(16, 6, 'BCT001', 'Large', 700.00, 9, 1, '2020-10-06 19:55:40', '2020-11-24 10:09:11'),
(17, 7, 'PCT001-S', 'Small', 450.00, 2, 1, '2020-10-06 19:57:45', '2020-10-10 03:29:16'),
(18, 7, 'PCT001-M', 'Medium', 550.00, 5, 1, '2020-10-06 19:57:45', '2020-10-10 03:29:16'),
(19, 7, 'PCT001-L', 'Large', 650.00, 15, 1, '2020-10-06 19:57:45', '2020-10-10 03:29:16'),
(20, 8, 'SBWT001-S', 'Small', 1200.00, 10, 1, '2020-10-06 20:00:00', '2020-10-06 20:00:00'),
(21, 8, 'SBWT001-M', 'Medium', 1300.00, 15, 1, '2020-10-06 20:00:00', '2020-10-06 20:00:00'),
(22, 8, 'SBWT001-L', 'Large', 1400.00, 10, 1, '2020-10-06 20:00:00', '2020-10-06 20:00:00'),
(23, 2, 'RT001-XL', 'Extra Large', 800.00, 5, 1, '2020-10-07 04:08:46', '2020-11-08 02:49:28');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(4, 4, '68497.jpg', '2020-10-07 08:24:44', '2020-10-07 08:24:44'),
(9, 2, '18540.jpg', '2020-10-07 19:47:25', '2020-10-07 19:47:25'),
(10, 2, '81561.jpg', '2020-10-07 19:47:25', '2020-10-07 19:47:25'),
(11, 8, '17224.jpg', '2020-10-07 19:57:38', '2020-10-07 19:57:38');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Men', 1, NULL, '2020-11-24 11:20:08'),
(2, 'Women', 1, NULL, NULL),
(3, 'Kids', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_charges`
--

CREATE TABLE `shipping_charges` (
  `id` int(11) NOT NULL,
  `country` varchar(80) NOT NULL,
  `shipping_charges0_500g` int(11) NOT NULL,
  `shipping_charges501_1000g` int(11) NOT NULL,
  `shipping_charges1001_2000g` int(11) NOT NULL,
  `shipping_charges2001_3000g` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipping_charges`
--

INSERT INTO `shipping_charges` (`id`, `country`, `shipping_charges0_500g`, `shipping_charges501_1000g`, `shipping_charges1001_2000g`, `shipping_charges2001_3000g`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 100, 100, 100, 100, NULL, '2020-11-10 03:57:30'),
(2, 'Aland Islands', 0, 0, 0, 0, NULL, NULL),
(3, 'Albania', 0, 0, 0, 0, NULL, NULL),
(4, 'Algeria', 0, 0, 0, 0, NULL, NULL),
(5, 'American Samoa', 0, 0, 0, 0, NULL, NULL),
(6, 'Andorra', 0, 0, 0, 0, NULL, NULL),
(7, 'Angola', 0, 0, 0, 0, NULL, NULL),
(8, 'Anguilla', 0, 0, 0, 0, NULL, NULL),
(9, 'Antarctica', 0, 0, 0, 0, NULL, NULL),
(10, 'Antigua and Barbuda', 0, 0, 0, 0, NULL, NULL),
(11, 'Argentina', 0, 0, 0, 0, NULL, NULL),
(12, 'Armenia', 0, 0, 0, 0, NULL, NULL),
(13, 'Aruba', 0, 0, 0, 0, NULL, NULL),
(14, 'Australia', 0, 0, 0, 0, NULL, NULL),
(15, 'Austria', 0, 0, 0, 0, NULL, NULL),
(16, 'Azerbaijan', 0, 0, 0, 0, NULL, NULL),
(17, 'Bahamas', 0, 0, 0, 0, NULL, NULL),
(18, 'Bahrain', 0, 0, 0, 0, NULL, NULL),
(19, 'Bangladesh', 100, 200, 300, 400, NULL, '2020-11-10 08:24:39'),
(20, 'Barbados', 0, 0, 0, 0, NULL, NULL),
(21, 'Belarus', 0, 0, 0, 0, NULL, NULL),
(22, 'Belgium', 0, 0, 0, 0, NULL, NULL),
(23, 'Belize', 0, 0, 0, 0, NULL, NULL),
(24, 'Benin', 0, 0, 0, 0, NULL, NULL),
(25, 'Bermuda', 0, 0, 0, 0, NULL, NULL),
(26, 'Bhutan', 0, 0, 0, 0, NULL, NULL),
(27, 'Bolivia', 0, 0, 0, 0, NULL, NULL),
(28, 'Bonaire, Sint Eustatius and Saba', 0, 0, 0, 0, NULL, NULL),
(29, 'Bosnia and Herzegovina', 0, 0, 0, 0, NULL, NULL),
(30, 'Botswana', 0, 0, 0, 0, NULL, NULL),
(31, 'Bouvet Island', 0, 0, 0, 0, NULL, NULL),
(32, 'Brazil', 0, 0, 0, 0, NULL, NULL),
(33, 'British Indian Ocean Territory', 0, 0, 0, 0, NULL, NULL),
(34, 'Brunei Darussalam', 0, 0, 0, 0, NULL, NULL),
(35, 'Bulgaria', 0, 0, 0, 0, NULL, NULL),
(36, 'Burkina Faso', 0, 0, 0, 0, NULL, NULL),
(37, 'Burundi', 0, 0, 0, 0, NULL, NULL),
(38, 'Cambodia', 0, 0, 0, 0, NULL, NULL),
(39, 'Cameroon', 0, 0, 0, 0, NULL, NULL),
(40, 'Canada', 0, 0, 0, 0, NULL, NULL),
(41, 'Cape Verde', 0, 0, 0, 0, NULL, NULL),
(42, 'Cayman Islands', 0, 0, 0, 0, NULL, NULL),
(43, 'Central African Republic', 0, 0, 0, 0, NULL, NULL),
(44, 'Chad', 0, 0, 0, 0, NULL, NULL),
(45, 'Chile', 0, 0, 0, 0, NULL, NULL),
(46, 'China', 0, 0, 0, 0, NULL, NULL),
(47, 'Christmas Island', 0, 0, 0, 0, NULL, NULL),
(48, 'Cocos (Keeling) Islands', 0, 0, 0, 0, NULL, NULL),
(49, 'Colombia', 0, 0, 0, 0, NULL, NULL),
(50, 'Comoros', 0, 0, 0, 0, NULL, NULL),
(51, 'Congo', 0, 0, 0, 0, NULL, NULL),
(52, 'Congo, the Democratic Republic of the', 0, 0, 0, 0, NULL, NULL),
(53, 'Cook Islands', 0, 0, 0, 0, NULL, NULL),
(54, 'Costa Rica', 0, 0, 0, 0, NULL, NULL),
(55, 'Cote D\'Ivoire', 0, 0, 0, 0, NULL, NULL),
(56, 'Croatia', 0, 0, 0, 0, NULL, NULL),
(57, 'Cuba', 0, 0, 0, 0, NULL, NULL),
(58, 'Curacao', 0, 0, 0, 0, NULL, NULL),
(59, 'Cyprus', 0, 0, 0, 0, NULL, NULL),
(60, 'Czech Republic', 0, 0, 0, 0, NULL, NULL),
(61, 'Denmark', 0, 0, 0, 0, NULL, NULL),
(62, 'Djibouti', 0, 0, 0, 0, NULL, NULL),
(63, 'Dominica', 0, 0, 0, 0, NULL, NULL),
(64, 'Dominican Republic', 0, 0, 0, 0, NULL, NULL),
(65, 'Ecuador', 0, 0, 0, 0, NULL, NULL),
(66, 'Egypt', 0, 0, 0, 0, NULL, NULL),
(67, 'El Salvador', 0, 0, 0, 0, NULL, NULL),
(68, 'Equatorial Guinea', 0, 0, 0, 0, NULL, NULL),
(69, 'Eritrea', 0, 0, 0, 0, NULL, NULL),
(70, 'Estonia', 0, 0, 0, 0, NULL, NULL),
(71, 'Ethiopia', 0, 0, 0, 0, NULL, NULL),
(72, 'Falkland Islands (Malvinas)', 0, 0, 0, 0, NULL, NULL),
(73, 'Faroe Islands', 0, 0, 0, 0, NULL, NULL),
(74, 'Fiji', 0, 0, 0, 0, NULL, NULL),
(75, 'Finland', 0, 0, 0, 0, NULL, NULL),
(76, 'France', 0, 0, 0, 0, NULL, NULL),
(77, 'French Guiana', 0, 0, 0, 0, NULL, NULL),
(78, 'French Polynesia', 0, 0, 0, 0, NULL, NULL),
(79, 'French Southern Territories', 0, 0, 0, 0, NULL, NULL),
(80, 'Gabon', 0, 0, 0, 0, NULL, NULL),
(81, 'Gambia', 0, 0, 0, 0, NULL, NULL),
(82, 'Georgia', 0, 0, 0, 0, NULL, NULL),
(83, 'Germany', 0, 0, 0, 0, NULL, NULL),
(84, 'Ghana', 0, 0, 0, 0, NULL, NULL),
(85, 'Gibraltar', 0, 0, 0, 0, NULL, NULL),
(86, 'Greece', 0, 0, 0, 0, NULL, NULL),
(87, 'Greenland', 0, 0, 0, 0, NULL, NULL),
(88, 'Grenada', 0, 0, 0, 0, NULL, NULL),
(89, 'Guadeloupe', 0, 0, 0, 0, NULL, NULL),
(90, 'Guam', 0, 0, 0, 0, NULL, NULL),
(91, 'Guatemala', 0, 0, 0, 0, NULL, NULL),
(92, 'Guernsey', 0, 0, 0, 0, NULL, NULL),
(93, 'Guinea', 0, 0, 0, 0, NULL, NULL),
(94, 'Guinea-Bissau', 0, 0, 0, 0, NULL, NULL),
(95, 'Guyana', 0, 0, 0, 0, NULL, NULL),
(96, 'Haiti', 0, 0, 0, 0, NULL, NULL),
(97, 'Heard Island and Mcdonald Islands', 0, 0, 0, 0, NULL, NULL),
(98, 'Holy See (Vatican City State)', 0, 0, 0, 0, NULL, NULL),
(99, 'Honduras', 0, 0, 0, 0, NULL, NULL),
(100, 'Hong Kong', 0, 0, 0, 0, NULL, NULL),
(101, 'Hungary', 0, 0, 0, 0, NULL, NULL),
(102, 'Iceland', 0, 0, 0, 0, NULL, NULL),
(103, 'India', 0, 0, 0, 0, NULL, NULL),
(104, 'Indonesia', 0, 0, 0, 0, NULL, NULL),
(105, 'Iran, Islamic Republic of', 0, 0, 0, 0, NULL, NULL),
(106, 'Iraq', 0, 0, 0, 0, NULL, NULL),
(107, 'Ireland', 0, 0, 0, 0, NULL, NULL),
(108, 'Isle of Man', 0, 0, 0, 0, NULL, NULL),
(109, 'Israel', 0, 0, 0, 0, NULL, NULL),
(110, 'Italy', 0, 0, 0, 0, NULL, NULL),
(111, 'Jamaica', 0, 0, 0, 0, NULL, NULL),
(112, 'Japan', 0, 0, 0, 0, NULL, NULL),
(113, 'Jersey', 0, 0, 0, 0, NULL, NULL),
(114, 'Jordan', 0, 0, 0, 0, NULL, NULL),
(115, 'Kazakhstan', 0, 0, 0, 0, NULL, NULL),
(116, 'Kenya', 0, 0, 0, 0, NULL, NULL),
(117, 'Kiribati', 0, 0, 0, 0, NULL, NULL),
(118, 'Korea, Democratic People\"s Republic of', 0, 0, 0, 0, NULL, NULL),
(119, 'Korea, Republic of', 0, 0, 0, 0, NULL, NULL),
(120, 'Kosovo', 0, 0, 0, 0, NULL, NULL),
(121, 'Kuwait', 0, 0, 0, 0, NULL, NULL),
(122, 'Kyrgyzstan', 0, 0, 0, 0, NULL, NULL),
(123, 'Lao People\'s Democratic Republic', 0, 0, 0, 0, NULL, NULL),
(124, 'Latvia', 0, 0, 0, 0, NULL, NULL),
(125, 'Lebanon', 0, 0, 0, 0, NULL, NULL),
(126, 'Lesotho', 0, 0, 0, 0, NULL, NULL),
(127, 'Liberia', 0, 0, 0, 0, NULL, NULL),
(128, 'Libyan Arab Jamahiriya', 0, 0, 0, 0, NULL, NULL),
(129, 'Liechtenstein', 0, 0, 0, 0, NULL, NULL),
(130, 'Lithuania', 0, 0, 0, 0, NULL, NULL),
(131, 'Luxembourg', 0, 0, 0, 0, NULL, NULL),
(132, 'Macao', 0, 0, 0, 0, NULL, NULL),
(133, 'Macedonia, the Former Yugoslav Republic of', 0, 0, 0, 0, NULL, NULL),
(134, 'Madagascar', 0, 0, 0, 0, NULL, NULL),
(135, 'Malawi', 0, 0, 0, 0, NULL, NULL),
(136, 'Malaysia', 0, 0, 0, 0, NULL, NULL),
(137, 'Maldives', 0, 0, 0, 0, NULL, NULL),
(138, 'Mali', 0, 0, 0, 0, NULL, NULL),
(139, 'Malta', 0, 0, 0, 0, NULL, NULL),
(140, 'Marshall Islands', 0, 0, 0, 0, NULL, NULL),
(141, 'Martinique', 0, 0, 0, 0, NULL, NULL),
(142, 'Mauritania', 0, 0, 0, 0, NULL, NULL),
(143, 'Mauritius', 0, 0, 0, 0, NULL, NULL),
(144, 'Mayotte', 0, 0, 0, 0, NULL, NULL),
(145, 'Mexico', 0, 0, 0, 0, NULL, NULL),
(146, 'Micronesia, Federated States of', 0, 0, 0, 0, NULL, NULL),
(147, 'Moldova, Republic of', 0, 0, 0, 0, NULL, NULL),
(148, 'Monaco', 0, 0, 0, 0, NULL, NULL),
(149, 'Mongolia', 0, 0, 0, 0, NULL, NULL),
(150, 'Montenegro', 0, 0, 0, 0, NULL, NULL),
(151, 'Montserrat', 0, 0, 0, 0, NULL, NULL),
(152, 'Morocco', 0, 0, 0, 0, NULL, NULL),
(153, 'Mozambique', 0, 0, 0, 0, NULL, NULL),
(154, 'Myanmar', 0, 0, 0, 0, NULL, NULL),
(155, 'Namibia', 0, 0, 0, 0, NULL, NULL),
(156, 'Nauru', 0, 0, 0, 0, NULL, NULL),
(157, 'Nepal', 0, 0, 0, 0, NULL, NULL),
(158, 'Netherlands', 0, 0, 0, 0, NULL, NULL),
(159, 'Netherlands Antilles', 0, 0, 0, 0, NULL, NULL),
(160, 'New Caledonia', 0, 0, 0, 0, NULL, NULL),
(161, 'New Zealand', 0, 0, 0, 0, NULL, NULL),
(162, 'Nicaragua', 0, 0, 0, 0, NULL, NULL),
(163, 'Niger', 0, 0, 0, 0, NULL, NULL),
(164, 'Nigeria', 0, 0, 0, 0, NULL, NULL),
(165, 'Niue', 0, 0, 0, 0, NULL, NULL),
(166, 'Norfolk Island', 0, 0, 0, 0, NULL, NULL),
(167, 'Northern Mariana Islands', 0, 0, 0, 0, NULL, NULL),
(168, 'Norway', 0, 0, 0, 0, NULL, NULL),
(169, 'Oman', 0, 0, 0, 0, NULL, NULL),
(170, 'Pakistan', 0, 0, 0, 0, NULL, NULL),
(171, 'Palau', 0, 0, 0, 0, NULL, NULL),
(172, 'Palestinian Territory, Occupied', 0, 0, 0, 0, NULL, NULL),
(173, 'Panama', 0, 0, 0, 0, NULL, NULL),
(174, 'Papua New Guinea', 0, 0, 0, 0, NULL, NULL),
(175, 'Paraguay', 0, 0, 0, 0, NULL, NULL),
(176, 'Peru', 0, 0, 0, 0, NULL, NULL),
(177, 'Philippines', 0, 0, 0, 0, NULL, NULL),
(178, 'Pitcairn', 0, 0, 0, 0, NULL, NULL),
(179, 'Poland', 0, 0, 0, 0, NULL, NULL),
(180, 'Portugal', 0, 0, 0, 0, NULL, NULL),
(181, 'Puerto Rico', 0, 0, 0, 0, NULL, NULL),
(182, 'Qatar', 0, 0, 0, 0, NULL, NULL),
(183, 'Reunion', 0, 0, 0, 0, NULL, NULL),
(184, 'Romania', 0, 0, 0, 0, NULL, NULL),
(185, 'Russian Federation', 0, 0, 0, 0, NULL, NULL),
(186, 'Rwanda', 0, 0, 0, 0, NULL, NULL),
(187, 'Saint Barthelemy', 0, 0, 0, 0, NULL, NULL),
(188, 'Saint Helena', 0, 0, 0, 0, NULL, NULL),
(189, 'Saint Kitts and Nevis', 0, 0, 0, 0, NULL, NULL),
(190, 'Saint Lucia', 0, 0, 0, 0, NULL, NULL),
(191, 'Saint Martin', 0, 0, 0, 0, NULL, NULL),
(192, 'Saint Pierre and Miquelon', 0, 0, 0, 0, NULL, NULL),
(193, 'Saint Vincent and the Grenadines', 0, 0, 0, 0, NULL, NULL),
(194, 'Samoa', 0, 0, 0, 0, NULL, NULL),
(195, 'San Marino', 0, 0, 0, 0, NULL, NULL),
(196, 'Sao Tome and Principe', 0, 0, 0, 0, NULL, NULL),
(197, 'Saudi Arabia', 0, 0, 0, 0, NULL, NULL),
(198, 'Senegal', 0, 0, 0, 0, NULL, NULL),
(199, 'Serbia', 0, 0, 0, 0, NULL, NULL),
(200, 'Serbia and Montenegro', 0, 0, 0, 0, NULL, NULL),
(201, 'Seychelles', 0, 0, 0, 0, NULL, NULL),
(202, 'Sierra Leone', 0, 0, 0, 0, NULL, NULL),
(203, 'Singapore', 0, 0, 0, 0, NULL, NULL),
(204, 'Sint Maarten', 0, 0, 0, 0, NULL, NULL),
(205, 'Slovakia', 0, 0, 0, 0, NULL, NULL),
(206, 'Slovenia', 0, 0, 0, 0, NULL, NULL),
(207, 'Solomon Islands', 0, 0, 0, 0, NULL, NULL),
(208, 'Somalia', 0, 0, 0, 0, NULL, NULL),
(209, 'South Africa', 0, 0, 0, 0, NULL, NULL),
(210, 'South Georgia and the South Sandwich Islands', 0, 0, 0, 0, NULL, NULL),
(211, 'South Sudan', 0, 0, 0, 0, NULL, NULL),
(212, 'Spain', 0, 0, 0, 0, NULL, NULL),
(213, 'Sri Lanka', 0, 0, 0, 0, NULL, NULL),
(214, 'Sudan', 0, 0, 0, 0, NULL, NULL),
(215, 'Suriname', 0, 0, 0, 0, NULL, NULL),
(216, 'Svalbard and Jan Mayen', 0, 0, 0, 0, NULL, NULL),
(217, 'Swaziland', 0, 0, 0, 0, NULL, NULL),
(218, 'Sweden', 0, 0, 0, 0, NULL, NULL),
(219, 'Switzerland', 0, 0, 0, 0, NULL, NULL),
(220, 'Syrian Arab Republic', 0, 0, 0, 0, NULL, NULL),
(221, 'Taiwan, Province of China', 0, 0, 0, 0, NULL, NULL),
(222, 'Tajikistan', 0, 0, 0, 0, NULL, NULL),
(223, 'Tanzania, United Republic of', 0, 0, 0, 0, NULL, NULL),
(224, 'Thailand', 0, 0, 0, 0, NULL, NULL),
(225, 'Timor-Leste', 0, 0, 0, 0, NULL, NULL),
(226, 'Togo', 0, 0, 0, 0, NULL, NULL),
(227, 'Tokelau', 0, 0, 0, 0, NULL, NULL),
(228, 'Tonga', 0, 0, 0, 0, NULL, NULL),
(229, 'Trinidad and Tobago', 0, 0, 0, 0, NULL, NULL),
(230, 'Tunisia', 0, 0, 0, 0, NULL, NULL),
(231, 'Turkey', 0, 0, 0, 0, NULL, NULL),
(232, 'Turkmenistan', 0, 0, 0, 0, NULL, NULL),
(233, 'Turks and Caicos Islands', 0, 0, 0, 0, NULL, NULL),
(234, 'Tuvalu', 0, 0, 0, 0, NULL, NULL),
(235, 'Uganda', 0, 0, 0, 0, NULL, NULL),
(236, 'Ukraine', 0, 0, 0, 0, NULL, NULL),
(237, 'United Arab Emirates', 0, 0, 0, 0, NULL, NULL),
(238, 'United Kingdom', 0, 0, 0, 0, NULL, NULL),
(239, 'United States', 0, 0, 0, 0, NULL, NULL),
(240, 'United States Minor Outlying Islands', 0, 0, 0, 0, NULL, NULL),
(241, 'Uruguay', 0, 0, 0, 0, NULL, NULL),
(242, 'Uzbekistan', 0, 0, 0, 0, NULL, NULL),
(243, 'Vanuatu', 0, 0, 0, 0, NULL, NULL),
(244, 'Venezuela', 0, 0, 0, 0, NULL, NULL),
(245, 'Viet Nam', 0, 0, 0, 0, NULL, NULL),
(246, 'Virgin Islands, British', 0, 0, 0, 0, NULL, NULL),
(247, 'Virgin Islands, U.s.', 0, 0, 0, 0, NULL, NULL),
(248, 'Wallis and Futuna', 0, 0, 0, 0, NULL, NULL),
(249, 'Western Sahara', 0, 0, 0, 0, NULL, NULL),
(250, 'Yemen', 0, 0, 0, 0, NULL, NULL),
(251, 'Zambia', 0, 0, 0, 0, NULL, NULL),
(252, 'Zimbabwe', 0, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(4) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `address`, `city`, `state`, `country`, `pincode`, `mobile`, `email`, `email_verified_at`, `password`, `admin`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Razib Ahmed', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'Cyprus', '8710', '01848178478', 'razibhossens8566@gmail.com', NULL, '$2y$10$buHh0egyWBLhOnbFVIU41.FPC4HVcRDnhY15uxIjal4Lf9QxGSfqO', 1, 1, NULL, '2020-10-13 18:55:44', '2020-11-24 15:31:21'),
(42, 'fffff', '', '', '', 'Bangladesh', '', '', 'razibhossen62776@gmail.com', NULL, '$2y$10$zrpTw2.Eaf06y.zalUHvJe.tLihoB0CZfwXiGEZrNWRHUW8IVFsKK', 1, 1, NULL, '2020-10-23 08:00:51', '2020-10-23 08:00:51'),
(51, 'ddddddd', '', '', '', 'Bangladesh', '', '', 'aminurrahman1140@gmail.com', NULL, '$2y$10$W0dD.AEAmQFgtceKxpCSieyiw3ohCwBq01uRDrkM.b5LhVyDdcgAK', 1, 1, NULL, '2020-10-23 09:03:37', '2020-10-23 09:03:37'),
(53, 'Razib Hossen', 'Savar, Dhaka', 'Dhaka', 'Dhaka', 'India', '8710', '01848178478', 'qullommelosso-5720@yopmail.com', NULL, '$2y$10$UBIxZXgpqv5XrL16H/qFMubmi0F5w66XLXpLtn/CM5azCQGzldZGu', 1, 1, NULL, '2020-09-10 07:52:33', '2020-11-13 15:24:12'),
(54, 'razib', '', '', '', 'USA', '', '', 'razib@yopmail.com', NULL, '$2y$10$5j4PQnL3nUcYfC5gwFRlKuaeqzPspzsCfxDiYxg/QW3TiggkKaCjG', 1, 0, NULL, '2020-11-10 15:21:39', '2020-11-10 15:21:39'),
(55, 'RAzib', '', '', '', '', '', '', 'aupo@gmail.com', NULL, '$2y$10$OVN4zSOp0dQWzu8Z4mPqfOJ2WUcCKMCTVJ/wXCeDNtxYnXKk4Qtze', 1, 0, NULL, '2020-11-24 10:38:28', '2020-11-24 10:38:28'),
(62, 'dddd', '', '', '', '', '', '', 'd@gmail.com', NULL, '$2y$10$y1OXbNwIy6kzVKF.H1gLWuqi/.vERZK9OL30CtcaC/ix76rdm4Uhe', 1, 0, NULL, '2020-11-24 12:12:46', '2020-11-24 12:12:46'),
(63, 'dddd', '', '', '', '', '', '', 'ddd@gmail.com', NULL, '$2y$10$NMXxbfVYDlsFZ8KzEJbbiOKuJod9o1U7MTl7OTg0WNjFfYg1OW35q', 1, 0, NULL, '2020-11-24 12:14:54', '2020-11-24 12:14:54'),
(64, 'rrrr', '', '', '', '', '', '', 'r@gmal.com', NULL, '$2y$10$LfQXIdhVvOVcRc8rB.C4qecSTDtDYQAGSqvx/GHpTwpJRl9MVbM8K', 1, 0, NULL, '2020-11-24 12:17:12', '2020-11-24 12:17:12'),
(66, 'fffff', '', '', '', '', '', '', 'razibhossen8566@gmail.com', NULL, '$2y$10$j8u7YSVz/68QVuNemRYz4OzDF8mIThiypppfPvvw.m.uWvebqYA6e', 1, 0, NULL, '2020-11-24 12:22:05', '2020-11-24 12:22:05'),
(67, 'dddd', '', '', '', '', '', '', 'razibhossen856dd6@gmail.com', NULL, '$2y$10$uaUjRbRf9V6ERX8FfiN58eW9DQDaevzd7hzcp2ZkSNoNuiNOkdrvu', 1, 0, NULL, '2020-11-24 12:23:54', '2020-11-24 12:23:54'),
(68, 'Razib', '', '', '', '', '', '', 'ra@gmail.com', NULL, '$2y$10$RhsorGIq8CkBNKYHgiwB7.ac4c0ZXLTxah8pZVfBHQGiw9d9qFezC', 1, 1, NULL, '2020-11-24 17:25:21', '2020-11-24 17:25:21'),
(70, 'sssss', '', '', '', '', '', '', 'razibhossenmna@gmail.com', NULL, '$2y$10$6/rLNw60Pfit9nthrRcFtOvws7ULZuzzzXqbQf6OsMlVqBYnRCEeS', 1, 0, NULL, '2020-11-24 20:19:24', '2020-11-24 20:19:24'),
(71, 'ratul ahmed', '', '', '', '', '', '', 'razibhossen@yopmail.com', NULL, '$2y$10$QAgFxIPh9kQgfoSDB14oy.0AVLhLzALFylbUj8dQpoVGr/FWuD6im', 1, 1, NULL, '2020-11-25 11:34:41', '2020-11-25 11:34:41'),
(72, 'Ratul Ahmed', '', '', '', '', '', '', 'razibhossen12@yopmail.com', NULL, '$2y$10$puCMtYDRi6lE4RlJkv.tmu.WhObzbvctv8SuTTECs2DVtWJ87oAg2', 1, 1, NULL, '2020-11-25 11:43:03', '2020-11-25 11:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

CREATE TABLE `wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_pages`
--
ALTER TABLE `cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

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
-- Indexes for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newletter_subscribers`
--
ALTER TABLE `newletter_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pincodes`
--
ALTER TABLE `pincodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cms_pages`
--
ALTER TABLE `cms_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `newletter_subscribers`
--
ALTER TABLE `newletter_subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `pincodes`
--
ALTER TABLE `pincodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1350;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
