-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 09, 2026 at 05:06 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_mima_hoa`
--

-- --------------------------------------------------------

--
-- Table structure for table `table_attributes`
--

CREATE TABLE `table_attributes` (
  `id` int UNSIGNED NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `color` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_show` tinyint(1) DEFAULT '0',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0',
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_attribute_options`
--

CREATE TABLE `table_attribute_options` (
  `id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numb` int DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_city`
--

CREATE TABLE `table_city` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provinceid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0',
  `countryid` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_city`
--

INSERT INTO `table_city` (`id`, `name`, `slug`, `level`, `provinceid`, `code`, `numb`, `status`, `date_created`, `date_updated`, `countryid`) VALUES
(1, 'Thành phố Hà Nội', 'thanh-pho-ha-noi', 'thành phố trung ương', '1', '1', 1, 'hienthi', 1759490174, 1759490759, 1),
(4, 'Cao Bằng', 'cao_bang', 'tỉnh', '4', '4', 2, 'hienthi', 1759490174, 0, 1),
(8, 'Tuyên Quang', 'tuyen_quang', 'tỉnh', '8', '8', 3, 'hienthi', 1759490174, 0, 1),
(11, 'Điện Biên', 'dien_bien', 'tỉnh', '11', '11', 4, 'hienthi', 1759490174, 0, 1),
(12, 'Lai Châu', 'lai_chau', 'tỉnh', '12', '12', 5, 'hienthi', 1759490174, 0, 1),
(14, 'Sơn La', 'son_la', 'tỉnh', '14', '14', 6, 'hienthi', 1759490174, 0, 1),
(15, 'Lào Cai', 'lao_cai', 'tỉnh', '15', '15', 7, 'hienthi', 1759490174, 0, 1),
(19, 'Thái Nguyên', 'thai_nguyen', 'tỉnh', '19', '19', 8, 'hienthi', 1759490174, 0, 1),
(20, 'Lạng Sơn', 'lang_son', 'tỉnh', '20', '20', 9, 'hienthi', 1759490174, 0, 1),
(22, 'Quảng Ninh', 'quang_ninh', 'tỉnh', '22', '22', 10, 'hienthi', 1759490174, 0, 1),
(24, 'Bắc Ninh', 'bac_ninh', 'tỉnh', '24', '24', 11, 'hienthi', 1759490174, 0, 1),
(25, 'Phú Thọ', 'phu_tho', 'tỉnh', '25', '25', 12, 'hienthi', 1759490174, 0, 1),
(31, 'Thành phố Hải Phòng', 'hai_phong', 'thành phố trung ương', '31', '31', 13, 'hienthi', 1759490174, 0, 1),
(33, 'Hưng Yên', 'hung_yen', 'tỉnh', '33', '33', 14, 'hienthi', 1759490174, 0, 1),
(37, 'Ninh Bình', 'ninh_binh', 'tỉnh', '37', '37', 15, 'hienthi', 1759490174, 0, 1),
(38, 'Thanh Hóa', 'thanh_hoa', 'tỉnh', '38', '38', 16, 'hienthi', 1759490174, 0, 1),
(40, 'Nghệ An', 'nghe_an', 'tỉnh', '40', '40', 17, 'hienthi', 1759490174, 0, 1),
(42, 'Hà Tĩnh', 'ha_tinh', 'tỉnh', '42', '42', 18, 'hienthi', 1759490174, 0, 1),
(44, 'Quảng Trị', 'quang_tri', 'tỉnh', '44', '44', 19, 'hienthi', 1759490174, 0, 1),
(46, 'Thành phố Huế', 'hue', 'thành phố trung ương', '46', '46', 20, 'hienthi', 1759490174, 0, 1),
(48, 'Thành phố Đà Nẵng', 'da_nang', 'thành phố trung ương', '48', '48', 21, 'hienthi', 1759490174, 0, 1),
(51, 'Quảng Ngãi', 'quang_ngai', 'tỉnh', '51', '51', 22, 'hienthi', 1759490174, 0, 1),
(52, 'Gia Lai', 'gia_lai', 'tỉnh', '52', '52', 23, 'hienthi', 1759490174, 0, 1),
(56, 'Khánh Hòa', 'khanh_hoa', 'tỉnh', '56', '56', 24, 'hienthi', 1759490174, 0, 1),
(66, 'Đắk Lắk', 'dak_lak', 'tỉnh', '66', '66', 25, 'hienthi', 1759490174, 0, 1),
(68, 'Lâm Đồng', 'lam_dong', 'tỉnh', '68', '68', 26, 'hienthi', 1759490174, 0, 1),
(75, 'Đồng Nai', 'dong_nai', 'tỉnh', '75', '75', 27, 'hienthi', 1759490174, 0, 1),
(79, 'Thành phố Hồ Chí Minh', 'ho_chi_minh', 'thành phố trung ương', '79', '79', 28, 'hienthi', 1759490174, 0, 1),
(80, 'Tây Ninh', 'tay_ninh', 'tỉnh', '80', '80', 29, 'hienthi', 1759490174, 0, 1),
(82, 'Đồng Tháp', 'dong_thap', 'tỉnh', '82', '82', 30, 'hienthi', 1759490174, 0, 1),
(86, 'Vĩnh Long', 'vinh_long', 'tỉnh', '86', '86', 31, 'hienthi', 1759490174, 0, 1),
(91, 'An Giang', 'an_giang', 'tỉnh', '91', '91', 32, 'hienthi', 1759490174, 0, 1),
(92, 'Thành phố Cần Thơ', 'can_tho', 'thành phố trung ương', '92', '92', 33, 'hienthi', 1759490174, 0, 1),
(96, 'Cà Mau', 'ca_mau', 'tỉnh', '96', '96', 34, 'hienthi', 1759490174, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_color`
--

CREATE TABLE `table_color` (
  `id` int UNSIGNED NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_show` tinyint(1) DEFAULT '0',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_comment`
--

CREATE TABLE `table_comment` (
  `id` int NOT NULL,
  `id_parent` int DEFAULT '0',
  `id_variant` int DEFAULT '0',
  `star` int DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poster` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_posted` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_comment_photo`
--

CREATE TABLE `table_comment_photo` (
  `id` int NOT NULL,
  `id_parent` int DEFAULT '0',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_comment_video`
--

CREATE TABLE `table_comment_video` (
  `id` int NOT NULL,
  `id_parent` int DEFAULT '0',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_contact`
--

CREATE TABLE `table_contact` (
  `id` int UNSIGNED NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_attach` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `address` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0',
  `numb` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_counter`
--

CREATE TABLE `table_counter` (
  `id` int NOT NULL,
  `tm` int DEFAULT '0',
  `ip` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '0.0.0.0',
  `user_agent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `devicetype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country` varchar(245) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(245) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `table_counter`
--

INSERT INTO `table_counter` (`id`, `tm`, `ip`, `user_agent`, `devicetype`, `type`, `country`, `city`, `created_at`) VALUES
(1, 1777690721, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'computer', 'unknown', 'Unknown', 'Unknown', '2026-05-02 09:58:41'),
(2, 1777696833, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'computer', 'unknown', 'Unknown', 'Unknown', '2026-05-02 11:40:33'),
(3, 1777697734, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', 'computer', 'unknown', 'Unknown', 'Unknown', '2026-05-02 11:55:34'),
(4, 1778288929, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0', 'computer', 'unknown', 'Unknown', 'Unknown', '2026-05-09 08:08:49'),
(5, 1778289850, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0', 'computer', 'unknown', 'Unknown', 'Unknown', '2026-05-09 08:24:10'),
(6, 1778291470, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0', 'computer', 'unknown', 'Unknown', 'Unknown', '2026-05-09 08:51:10'),
(7, 1778292379, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0', 'computer', 'unknown', 'Unknown', 'Unknown', '2026-05-09 09:06:19'),
(8, 1778294785, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0', 'computer', 'unknown', 'Unknown', 'Unknown', '2026-05-09 09:46:25'),
(9, 1778295717, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0', 'computer', 'unknown', 'Unknown', 'Unknown', '2026-05-09 10:01:57'),
(10, 1778302847, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0', 'computer', 'unknown', 'Unknown', 'Unknown', '2026-05-09 12:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `table_district`
--

CREATE TABLE `table_district` (
  `id` int NOT NULL,
  `id_city` int DEFAULT '0',
  `districtid` int DEFAULT '0',
  `provinceid` int DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_excel`
--

CREATE TABLE `table_excel` (
  `id` int UNSIGNED NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numb` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_gallery`
--

CREATE TABLE `table_gallery` (
  `id` int UNSIGNED NOT NULL,
  `id_parent` int DEFAULT '0',
  `id_tags` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_multiple` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `hash` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contentvi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contenten` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descvi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_color` int DEFAULT '0',
  `id_size` int NOT NULL DEFAULT '0',
  `regular_price` double NOT NULL DEFAULT '0',
  `sale_price` double NOT NULL DEFAULT '0',
  `discount` int NOT NULL DEFAULT '0',
  `file_attach` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_video` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `numb` int DEFAULT '0',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `com` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kind` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0',
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contentja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_keyword_rank`
--

CREATE TABLE `table_keyword_rank` (
  `id` int UNSIGNED NOT NULL,
  `ngay` date NOT NULL,
  `tukhoa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `luotnhap` int NOT NULL DEFAULT '0',
  `thu_hang` int NOT NULL DEFAULT '0',
  `luothienthi` int NOT NULL DEFAULT '0',
  `linktop` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hienthi` tinyint(1) NOT NULL DEFAULT '1',
  `stt` int NOT NULL DEFAULT '0',
  `ngaytao` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_lang`
--

CREATE TABLE `table_lang` (
  `id` int UNSIGNED NOT NULL,
  `lang_define` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `langvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `langen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `langja` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `numb` int UNSIGNED DEFAULT '0',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_lang`
--

INSERT INTO `table_lang` (`id`, `lang_define`, `langvi`, `langen`, `langja`, `numb`, `type`) VALUES
(5, 'trangchu', 'Trang chủ', 'Home', NULL, 1, 'web'),
(6, 'gioithieu', 'Giới thiệu', 'About us', NULL, 2, 'web'),
(8, 'tintuc', 'Tin tức', 'News', NULL, 4, 'web'),
(9, 'lienhe', 'Liên hệ', 'Contact us', NULL, 5, 'web'),
(34, 'motasanpham', 'Mô tả', 'Description', NULL, 5, 'web'),
(46, 'sanpham', 'Sản phẩm', 'Product', NULL, 2, 'web'),
(31, 'luotxem', 'Lượt xem', 'Views', NULL, 2, 'web'),
(30, 'masp', 'Mã sản phẩm', 'Product code', NULL, 1, 'web'),
(26, 'ngaydang', 'Ngày đăng', 'Date Submitted', NULL, 2, 'web'),
(27, 'tintuckhac', 'Tin tức khác', 'Other news', NULL, 3, 'web'),
(40, 'hotrotructuyen', 'Hổ trợ trực tuyến', 'Support Online', NULL, 1, 'web'),
(50, 'dangonline', 'Đang online', 'Online', NULL, 1, 'web'),
(51, 'tongtruycap', 'Tổng truy cập', 'Total', NULL, 2, 'web'),
(52, 'diachi', 'Địa chỉ', 'Address', NULL, 3, 'web'),
(53, 'thongtinlienhe', 'Thông tin liên hệ', 'Information Contact', NULL, 4, 'web'),
(54, 'sodienthoai', 'Số điện thoại', 'Phone', NULL, 5, 'web'),
(55, 'hovaten', 'Họ và tên', 'Full name', NULL, 1, 'web'),
(56, 'chude', 'Chủ đề', 'Subject', NULL, 2, 'web'),
(57, 'noidung', 'Nội dung', 'Content', NULL, 3, 'web'),
(224, 'matkhaumoi', 'Mật khẩu mới', 'New password', NULL, 1, 'web'),
(225, 'nhaplaimatkhaumoi', 'Nhập lại mật khẩu mới', 'Re-new password', NULL, 1, 'web'),
(65, 'gui', 'Gửi', 'Send', NULL, 1, 'web'),
(66, 'nhaplai', 'Nhập lại', 'Reset', NULL, 2, 'web'),
(76, 'dangky', 'Đăng ký', 'Sign Up', NULL, 1, 'web'),
(78, 'khongtimthayketqua', 'Không tìm thấy kết quả', 'No results found', NULL, 1, 'web'),
(197, 'timduongdi', 'Tìm đường đi', 'Find a way', NULL, 1, 'web'),
(198, 'dinhkemtaptin', 'Đính kèm file', 'Attachment file', NULL, 1, 'web'),
(199, 'mabaomat', 'Mã bảo mật', 'Security code', NULL, 1, 'web'),
(86, 'dichvu', 'Dịch vụ', 'Service', NULL, 1, 'web'),
(87, 'timkiem', 'Tìm kiếm', 'Search', NULL, 1, 'web'),
(226, 'capnhat', 'Cập nhật', 'Update', NULL, 1, 'web'),
(227, 'boqua', 'Bỏ qua', 'Cancel', NULL, 1, 'web'),
(228, 'phuongxa', 'Phường/xã', 'Ward', NULL, 1, 'web'),
(92, 'truycapngay', 'Truy cập ngày', 'Today', NULL, 1, 'web'),
(93, 'dangkynhantin', 'Đăng ký nhận tin', 'Sign up to get information', NULL, 0, 'web'),
(218, 'quanhuyen', 'Quận/huyện', 'District', NULL, 1, 'web'),
(302, 'vuilongchonquanhuyen', 'Vui lòng chọn quận huyện', 'Please select a district', NULL, 0, 'web'),
(220, 'soluongqualon', 'Số lượng không được lớn hơn 999', 'Quantity is not greater than 999', NULL, 1, 'web'),
(96, 'hoten', 'Họ và tên', 'Full name', NULL, 1, 'web'),
(97, 'chitietsanpham', 'Chi tiết sản phẩm', 'Product Details', NULL, 1, 'web'),
(99, 'xemthem', 'Xem thêm', 'View more', NULL, 1, 'web'),
(102, 'tuyendung', 'Tuyển dụng', 'Recruitment', NULL, 1, 'web'),
(108, 'gia', 'Giá', 'Price', NULL, 1, 'web'),
(221, 'thongtincanhan', 'Thông tin cá nhân', 'Information personal', NULL, 1, 'web'),
(193, 'thuvienanh', 'Thư viện ảnh', 'Album', NULL, 1, 'web'),
(194, 'sanphamnoibat', 'Sản phẩm nổi bật', 'Featured products', NULL, 1, 'web'),
(112, 'ketquatimkiem', 'Kết quả tìm kiếm', 'Search results', NULL, 1, 'web'),
(230, 'dathang', 'Đặt hàng', 'Add to cart', NULL, 1, 'web'),
(223, 'matkhaucu', 'Mật khẩu cũ', 'Old password', NULL, 1, 'web'),
(250, 'giohang', 'Giỏ hàng', 'My cart', NULL, 1, 'web'),
(212, 'hinh', 'Hình', 'Picture', NULL, 1, 'web'),
(213, 'soluong', 'Số lượng', 'Number', NULL, 1, 'web'),
(214, 'thanhtien', 'Thành tiền', 'Amount', NULL, 1, 'web'),
(216, 'tinhthanh', 'Tỉnh/thành phố', 'City', NULL, 1, 'web'),
(128, 'nhaptukhoatimkiem', 'Nhập từ khóa cần tìm...', 'Enter the keyword...', NULL, 1, 'web'),
(205, 'tinhtrang', 'Tình trạng', 'Status', NULL, 1, 'web'),
(206, 'hethang', 'Hết hàng', 'Out of stock', NULL, 1, 'web'),
(207, 'dangcapnhat', 'Đang cập nhật', 'Updating', NULL, 1, 'web'),
(132, 'danhmucsanpham', 'Danh mục sản phẩm', 'Product portfolio', NULL, 1, 'web'),
(134, 'trongtuan', 'Tuần', 'Week', NULL, 1, 'web'),
(222, 'thaydoimatkhau', 'Thay đổi mật khẩu', 'Change password', NULL, 1, 'web'),
(137, 'thongketruycap', 'Thống kê truy cập', 'Statistical access', NULL, 1, 'web'),
(146, 'thongtinsanpham', 'Thông tin sản phẩm', 'Products Information', NULL, 1, 'web'),
(303, 'vuilongchonphuongxa', 'Vui lòng chọn phường xã', 'Please select a ward', NULL, 0, 'web'),
(156, 'traloi', 'Trả lời', 'Answer', NULL, 1, 'web'),
(157, 'huy', 'Hủy', 'Cancel', NULL, 1, 'web'),
(151, 'binhluanve', 'bình luận về', 'comments about', NULL, 1, 'web'),
(152, 'moibanthaoluan', 'Mời bạn thảo luận. Vui lòng nhập Tiếng Việt có dấu, tối thiểu 10 ký tự.', 'Please discuss. Please enter Vietnamese accented, minimum 10 characters.', NULL, 1, 'web'),
(200, 'co', 'Có', 'Have', NULL, 1, 'web'),
(201, 'danhgia', 'Đánh giá', 'Review', NULL, 1, 'web'),
(202, 'xacnhan', 'Xác nhận', 'Confirm', NULL, 1, 'web'),
(203, 'sanphamcungloai', 'Sản phẩm cùng loại', 'Product Similar', NULL, 1, 'web'),
(204, 'conhang', 'Còn hàng', 'Stocking', NULL, 1, 'web'),
(165, 'thanhtoan', 'Thanh toán', 'Pay', NULL, 1, 'web'),
(167, 'chonvideo', 'Chọn video', 'Choose video', NULL, 1, 'web'),
(168, 'slogandangkynhantin', 'Để lại thông tin để nhận tin tức mới nhất từ chúng tôi', 'Leave information to receive the latest news from us', NULL, 1, 'web'),
(208, 'giamoi', 'Giá mới', 'New price', NULL, 1, 'web'),
(209, 'giacu', 'Giá cũ', 'Old price', NULL, 1, 'web'),
(171, 'binhluan', 'Bình luận', 'Comment', NULL, 1, 'web'),
(172, 'baivietkhac', 'Bài viết khác', 'Other news', NULL, 1, 'web'),
(174, 'banmuonxoasanphamnay', 'Bạn muốn xóa sản phẩm này khỏi giỏ hàng ? ', 'Do you want to remove this product from your shopping cart?', NULL, 1, 'web'),
(176, 'soluongkhongnhohonkhong', 'Số lượng đặt mua không được nhỏ hơn 0', 'Order quantity must not be less than 0', NULL, 1, 'web'),
(178, 'muatiep', 'Mua tiếp', 'Buy more', NULL, 1, 'web'),
(179, 'xoatatca', 'Xóa tất cả', 'Delete all', NULL, 1, 'web'),
(181, 'kichthuoc', 'Kích thước', 'Size', NULL, 1, 'web'),
(183, 'dangnhap', 'Đăng nhập', 'Login', NULL, 1, 'web'),
(184, 'taikhoan', 'Tài khoản', 'Username', NULL, 1, 'web'),
(185, 'matkhau', 'Mật khẩu', 'Password', NULL, 1, 'web'),
(186, 'nhomatkhau', 'Nhớ mật khẩu', 'Remember password', NULL, 1, 'web'),
(187, 'quenmatkhau', 'Quên mật khẩu', 'Forget password', NULL, 1, 'web'),
(188, 'nhaplaimatkhau', 'Nhập lại mật khẩu', 'Confirm password', NULL, 1, 'web'),
(189, 'dienthoai', 'Điện thoại', 'Phone', NULL, 1, 'web'),
(190, 'banchuacotaikhoan', 'Bạn chưa có tài khoản ', 'You don\'t have a account', NULL, 1, 'web'),
(192, 'laymatkhau', 'Lấy mật khẩu', 'Get password', NULL, 1, 'web'),
(231, 'apdung', 'Áp dụng', 'Apply', NULL, 1, 'web'),
(232, 'phivanchuyen', 'Phí vận chuyển', ' Transport fee', NULL, 1, 'web'),
(296, 'tamtinh', 'Tạm tính', 'Provisional', NULL, 0, 'web'),
(234, 'tongtien', 'Tổng tiền', 'Total price', NULL, 1, 'web'),
(235, 'map', 'Bản đồ', 'Map', NULL, 1, 'web'),
(236, 'donhang', 'Đơn hàng', 'Order', NULL, 1, 'web'),
(237, 'lichsudonhang', 'Lịch sử đơn hàng', 'Order history', NULL, 1, 'web'),
(238, 'trangdau', 'Trang đầu', 'First page', NULL, 1, 'web'),
(239, 'trangcuoi', 'Trang cuối', 'Last page', NULL, 1, 'web'),
(240, 'trangbantruycapkhongtontai', 'Trang bạn truy cập không tồn tại.', 'The page you visited does not exist.', NULL, 1, 'web'),
(241, 'vetrangchu', 'Về trang chủ', 'Back to homepage', NULL, 1, 'web'),
(242, 'chiase', 'Chia sẻ', 'Share', NULL, 1, 'web'),
(244, 'xoa', 'Xóa', 'Delete', NULL, 1, 'web'),
(245, 'mausac', 'Màu sắc', 'Color', NULL, 1, 'web'),
(247, 'thongtingiaohang', 'Thông tin giao hàng', 'Shipment Details', NULL, 1, 'web'),
(301, 'vuilongchontinhthanh', 'Vui lòng chọn tỉnh thành', 'Please select a province', NULL, 0, 'web'),
(253, 'yeucaukhac', 'Yêu cầu khác (không bắt buộc)', 'Other (Optional)', NULL, 1, 'web'),
(254, 'khongtontaisanphamtronggiohang', 'Không tồn tại sản phẩm nào trong giỏ hàng !', 'No products in your shopping cart !', NULL, 1, 'web'),
(256, 'giohangcuaban', 'Giỏ hàng của bạn', 'Your cart', NULL, 1, 'web'),
(257, 'vuilongchonsizevamau', 'Vui lòng chọn size và màu !', 'Please select size and color !', NULL, 1, 'web'),
(258, 'dangkytaiday', 'Đăng ký', 'Sign up here', NULL, 1, 'web'),
(259, 'nhaphoten', 'Nhập họ tên của bạn', 'Enter your full name', NULL, 1, 'web'),
(260, 'nhaptaikhoan', 'Nhập tài khoản của bạn', 'Enter your account', NULL, 1, 'web'),
(261, 'nhapmatkhau', 'Nhập mật khẩu (5-15 ký tự)', 'Choose password (5-15 chars)', NULL, 1, 'web'),
(262, 'nhapemail', 'Nhập địa chỉ email của bạn', 'Enter your email address', NULL, 1, 'web'),
(263, 'nhapdienthoai', 'Nhập số điện thoại', 'Enter your number phone', NULL, 1, 'web'),
(264, 'nhapdiachi', 'Nhập địa chỉ của bạn', 'Enter your address', NULL, 1, 'web'),
(265, 'nhapngaysinh', 'Nhập ngày sinh', 'Enter your birthday', NULL, 1, 'web'),
(266, 'gioitinh', 'Giới tính', 'Gender', NULL, 1, 'web'),
(267, 'nam', 'Nam', 'Male', NULL, 1, 'web'),
(268, 'nu', 'Nữ', 'Female', NULL, 1, 'web'),
(269, 'kichhoat', 'Kích hoạt', 'Active', NULL, 1, 'web'),
(270, 'nhapmakichhoat', 'Nhập mã kích hoạt', 'Enter your active code', NULL, 1, 'web'),
(271, 'nhapmatkhaucu', 'Nhập mật khẩu cũ', 'Enter old password', NULL, 1, 'web'),
(272, 'nhapmatkhaumoi', 'Nhập mật khẩu mới', 'Enter new password', NULL, 1, 'web'),
(273, 'thich', 'Thích', 'Like', NULL, 1, 'web'),
(274, 'dathich', 'Đã thích', 'Liked', NULL, 1, 'web'),
(275, 'taithembinhluan', 'Tải thêm bình luận', 'Get more comments', NULL, 1, 'web'),
(276, 'trangke', 'Trang kế', 'Next page', NULL, 1, 'web'),
(277, 'trangtruoc', 'Trang trước', 'Prev page', NULL, 1, 'web'),
(279, 'hinhanh', 'Hình ảnh', 'Image', NULL, 0, 'web'),
(280, 'tensanpham', 'Tên sản phẩm', 'Product name', NULL, 0, 'web'),
(282, 'duong', 'Đường phố', 'Street', NULL, 1, 'web'),
(283, 'hinhthucthanhtoan', 'Hình thức thanh toán', 'Payments', NULL, 0, 'web'),
(284, 'vuilongnhaphoten', 'Vui lòng nhập họ và tên', 'Please enter your first and last name', NULL, 0, 'web'),
(285, 'vuilongnhapsodienthoai', 'Vui lòng nhập số điện thoại', 'Please enter the phone number', NULL, 0, 'web'),
(286, 'vuilongnhapdiachi', 'Vui lòng nhập địa chỉ', 'Please enter your address', NULL, 0, 'web'),
(287, 'vuilongnhapdiachiemail', 'Vui lòng nhập địa chỉ email', 'Please enter email address', NULL, 0, 'web'),
(288, 'vuilongnhapchude', 'Vui lòng nhập chủ đề', 'Please enter subject', NULL, 0, 'web'),
(289, 'vuilongnhapnoidung', 'Vui lòng nhập nội dung', 'Please enter content', NULL, 0, 'web'),
(290, 'chon', 'Chọn', 'Choose', NULL, 0, 'web'),
(292, 'tieptucmuahang', 'Tiếp tục mua hàng', 'Continue shopping', NULL, 0, 'web'),
(293, 'trongthang', 'Tháng', 'Month', NULL, 0, 'web'),
(294, 'chinhsach', 'Chính sách hỗ trợ', 'Supporting policies', NULL, 0, 'web'),
(295, 'thuonghieu', 'Thương hiệu', 'Brand', NULL, 0, 'web'),
(304, 'vuilongnhaptaikhoan', 'Vui lòng nhập tài khoản', 'Please enter an account', NULL, 0, 'web'),
(305, 'vuilongnhapmatkhau', 'Vui lòng nhập mật khẩu', 'Please enter a password', NULL, 0, 'web'),
(306, 'vuilongnhaplaimatkhau', 'Vui lòng nhập lại mật khẩu', 'Please enter the password again', NULL, 0, 'web'),
(307, 'vuilongnhapngaysinh', 'Vui lòng nhập ngày sinh', 'Please enter your birthday', NULL, 0, 'web'),
(308, 'ngaysinh', 'Ngày sinh', 'Date of birth', NULL, 0, 'web'),
(312, 'vuilongnhapmakichhoat', 'Vui lòng nhập mã kích hoạt', 'Please enter the activation code', NULL, 0, 'web'),
(315, 'dangxuat', 'Đăng xuất', 'Logout', NULL, 0, 'web'),
(316, 'homnay', 'Hôm nay', 'Today', NULL, 0, 'web'),
(317, 'homqua', 'Hôm qua', 'Yesterday', NULL, 0, 'web'),
(318, 'thongbao', 'Thông báo', 'Notify', NULL, 0, 'web'),
(319, 'thoat', 'Thoát', 'Exit', NULL, 0, 'web'),
(320, 'chuanhaptukhoatimkiem', 'Chưa nhập từ khóa tìm kiếm', 'No search keywords entered', NULL, 0, 'web'),
(322, 'capnhatthongtin', 'Cập nhật thông tin', 'Update information', NULL, 0, 'web'),
(323, 'noidungdangcapnhat', 'Nội dung đang cập nhật', 'Content is updating', NULL, 0, 'web'),
(325, 'dangcapnhatdulieu', 'Đang cập nhật dữ liệu', 'Updating data', NULL, 0, 'web'),
(326, 'themvaogiohang', 'Thêm vào giỏ', 'add to cart', NULL, 0, 'web'),
(327, 'muangay', 'Mua ngay', 'buy now', NULL, 0, 'web'),
(328, 'goingay', 'Gọi ngay', 'Call now', NULL, 0, 'web'),
(329, 'nhantin', 'Nhắn tin', 'SMS', NULL, 0, 'web'),
(330, 'zalochat', 'Zalo Chat', 'Zalo Chat', NULL, 0, 'web'),
(331, 'facebookchat', 'Facebook Chat', 'Facebook Chat', NULL, 0, 'web'),
(332, 'chiduong', 'Chỉ đường', 'Maps', NULL, 0, 'web'),
(333, 'tinlienquan', 'Tin liên quan', 'Related news', NULL, 0, 'web'),
(334, 'hotenkhongduoctrong', 'Họ tên không được trống', 'Name cannot be blank', NULL, 0, 'web'),
(335, 'sodienthoaikhongduoctrong', 'Số điện thoại không được trống', 'Phone number cannot be empty', NULL, 0, 'web'),
(336, 'sodienthoaikhonghople', 'Số điện thoại không hợp lệ', 'invalid phone number', NULL, 0, 'web'),
(337, 'diachikhongduoctrong', 'Địa chỉ không được trống', 'Address cannot be empty', NULL, 0, 'web'),
(338, 'emailkhongduoctrong', 'Email không được trống', 'Email cannot be empty', NULL, 0, 'web'),
(339, 'emailkhonghople', 'Email không hợp lệ', 'Invalid email', NULL, 0, 'web'),
(340, 'chudekhongduoctrong', 'Chủ đề không được trống', 'Topics can&#039;t be empty', NULL, 0, 'web'),
(341, 'noidungkhongduoctrong', 'Nội dung không được trống', 'Content cannot be empty', NULL, 0, 'web'),
(342, 'guilienhethanhcong', 'Gửi liên hệ thành công', 'Contact sent successfully', NULL, 0, 'web'),
(343, 'guilienhethatbai', 'Gửi liên hệ thất bại. Vui lòng thử lại sau', 'Contact sending failed. Please try again later', NULL, 0, 'web'),
(344, 'dangkynhantinthanhcong', 'Đăng ký nhận tin thành công. Chúng tôi sẽ liên hệ với bạn sớm.', 'Sign up to receive news successfully. We will contact you soon.', NULL, 0, 'web'),
(345, 'dangkynhantinthatbai', 'Đăng ký nhận tin thất bại. Vui lòng thử lại sau.', 'Sign up for newsletter failed. Please try again later.', NULL, 0, 'web'),
(346, 'datlichhenthatbai', 'Đặt lịch hẹn thất bại. Vui lòng thử lại sau.', 'Appointment failed. Please try again later.', NULL, 0, 'web'),
(347, 'datlichthanhcong', 'Đặt lịch hẹn thành công', 'Successful appointment booking', NULL, 0, 'web'),
(348, 'datlichhenthatbaivuilongthulaisauvaiphut', 'Đặt lịch hẹn thất bại. Vui lòng thử lại sau vài phút', 'Appointment failed. Please try again in a few minutes', NULL, 0, 'web'),
(349, 'donhangkhonghoplevuilongthulaisau', 'Đơn hàng không hợp lệ. Vui lòng thử lại sau.', 'Invalid order. Please try again later.', NULL, 0, 'web'),
(350, 'chuachonhinhthucthanhtoan', 'Chưa chọn hình thức thanh toán', 'No payment method selected', NULL, 0, 'web'),
(351, 'chuachontinhthanhpho', 'Chưa chọn tỉnh/thành phố', 'No province/city selected', NULL, 0, 'web'),
(352, 'chuachonquanhuyen', 'Chưa chọn quận/huyện', 'No district/district selected yet', NULL, 0, 'web'),
(353, 'chuachonphuongxa', 'Chưa chọn phường/xã', 'No ward/commune selected yet', NULL, 0, 'web'),
(354, 'thongtindonhangdaduocguithanhcong', 'Thông tin đơn hàng đã được gửi thành công.', 'Order information has been sent successfully.', NULL, 0, 'web'),
(355, 'thongbao', 'Thông báo', 'Notification', NULL, 0, 'web'),
(356, 'dongy', 'Đồng ý', 'OK', NULL, 0, 'web'),
(357, 'dungluonghinhanhlon', 'Dung lượng hình ảnh lớn. Dung lượng cho phép &lt;= 4MB ~ 4096KB', 'Large image capacity. Allowed capacity &lt;= 4MB ~ 4096KB', NULL, 0, 'web'),
(358, 'dinhdanghinhanhkhonghople', 'Định dạng hình ảnh không hợp lệ', 'Invalid image format', NULL, 0, 'web'),
(359, 'banchiduocchon1hinhanhdeuplen', 'Bạn chỉ được chọn 1 hình ảnh để upload', 'You can only choose 1 image to upload', NULL, 0, 'web'),
(360, 'dulieukhonghople', 'Dữ liệu không hợp lệ', 'Invalid data', NULL, 0, 'web'),
(361, 'datlich', 'Đặt lịch', 'Booking', NULL, 0, 'web'),
(362, 'noibat', 'Nổi bật', 'Outstanding', NULL, 0, 'admin'),
(363, 'hienthi', 'Hiển thị', 'Show', NULL, 0, 'admin'),
(364, 'trangchu', 'Trang chủ', 'Home', NULL, 0, 'admin'),
(365, 'sanpham', 'Sản phẩm', 'Product', NULL, 0, 'admin'),
(366, 'tintuc', 'Tin tức', 'News', NULL, 0, 'admin'),
(367, 'tuyendung', 'Tuyển dụng', 'Recruitment', NULL, 0, 'admin'),
(368, 'thuvienanh', 'Thư viện ảnh', 'Photo library', NULL, 0, 'admin'),
(369, 'video', 'Video', 'Video', NULL, 0, 'admin'),
(370, 'lienhe', 'Liên hệ', 'Contact', NULL, 0, 'admin'),
(371, 'kichhoat', 'Kích hoạt', 'Activated', NULL, 0, 'admin'),
(372, 'xacnhan', 'Xác nhận', 'Confirm', NULL, 0, 'admin'),
(373, 'linkredirect', 'Điều hướng link', 'Link redirect', NULL, 0, 'admin'),
(374, 'groupsanpham', 'Group Sản Phẩm', 'Product Group', NULL, 0, 'admin'),
(375, 'grouptintuc', 'Group Tin Tức', 'Group News', NULL, 0, 'admin'),
(376, 'dashboard', 'Bảng điều khiển', 'Dashboard', NULL, 0, 'admin'),
(377, 'danhmuccap1', 'Danh mục cấp 1', 'Category level 1', NULL, 0, 'admin'),
(378, 'danhmuccap2', 'Danh mục cấp 2', 'Category level 2', NULL, 0, 'admin'),
(379, 'danhmuccap3', 'Danh mục cấp 3', 'Category level 3', NULL, 0, 'admin'),
(380, 'danhmuccap4', 'Danh mục cấp 4', 'Category level 4', NULL, 0, 'admin'),
(381, 'danhmuchang', 'Danh mục hãng', 'Brand Directory', NULL, 0, 'admin'),
(634, 'quanlykichthuoc', 'Quản lý kích thước', 'Size Management', NULL, 0, 'admin'),
(383, 'danhmuckichthuoc', 'Danh mục kích thước', 'Size List', NULL, 0, 'admin'),
(384, 'danhsachbaiviet', 'Danh sách bài viết', 'List of articles', NULL, 0, 'admin'),
(385, 'quanlydonhang', 'Quản lý đơn hàng', 'Order Management', NULL, 0, 'admin'),
(386, 'quanlytags', 'Quản lý tags', 'Tags Management', NULL, 0, 'admin'),
(387, 'quanlynhantin', 'Quản lý nhận tin', 'Newsletter', NULL, 0, 'admin'),
(388, 'quanlytrangtinh', 'Quản lý trang tĩnh', 'Static site management', NULL, 0, 'admin'),
(389, 'quanlyhinhanhvideo', 'Quản lý hình ảnh - video', 'Manage photos - videos', NULL, 0, 'admin'),
(390, 'quanlydiadiem', 'Quản lý địa điểm', 'Location Management', NULL, 0, 'admin'),
(391, 'tinhthanh', 'Tỉnh thành', 'Province', NULL, 0, 'admin'),
(392, 'quanhuyen', 'Quận huyện', 'District', NULL, 0, 'admin'),
(393, 'phuongxa', 'Phường xã', 'Wards', NULL, 0, 'admin'),
(394, 'quanlyuser', 'Quản lý user', 'User management', NULL, 0, 'admin'),
(395, 'nhomquyen', 'Nhóm quyền', 'Rights group', NULL, 0, 'admin'),
(396, 'thongtinadmin', 'Thông tin admin', 'Admin information', NULL, 0, 'admin'),
(397, 'taikhoanadmin', 'Tài khoản admin', 'Admin account', NULL, 0, 'admin'),
(398, 'taikhoankhach', 'Tài khoản khách', 'Guest account', NULL, 0, 'admin'),
(399, 'quanlythongbaoday', 'Quản lý thông báo đẩy', 'Manage push notifications', NULL, 0, 'admin'),
(400, 'quanlyseopage', 'Quản lý seo page', 'Manage seo page', NULL, 0, 'admin'),
(401, 'thietlapthongtin', 'Thiết lập thông tin', 'Information setting', NULL, 0, 'admin'),
(402, 'diachi', 'Địa chỉ', 'Address', NULL, 0, 'admin'),
(403, 'xinchao', 'Xin chào', 'Hi', NULL, 0, 'admin'),
(404, 'doimatkhau', 'Đổi mật khẩu', 'Change Password', NULL, 0, 'admin'),
(405, 'xoabonhocache', 'Xóa bộ nhớ cache', 'Clear cache', NULL, 0, 'admin'),
(406, 'thongbao', 'Thông báo', 'Notification', NULL, 0, 'admin'),
(407, 'donhang', 'Đơn hàng', 'Order', NULL, 0, 'admin'),
(408, 'binhluan', 'Bình luận', 'Comment', NULL, 0, 'admin'),
(409, 'dangxuat', 'Đăng xuất', 'Logout', NULL, 0, 'admin'),
(410, 'thongketruycapthang', 'Thống kê truy cập tháng', 'Statistics for', NULL, 0, 'admin'),
(411, 'taikhoan', 'Tài khoản', 'Account', NULL, 0, 'admin'),
(412, 'cauhinhwebsite', 'Cấu hình website', 'Website config', NULL, 0, 'admin'),
(413, 'xemthem', 'Xem thêm', 'View more', NULL, 0, 'admin'),
(414, 'thulienhe', 'Thư liên hệ', 'Contact letter', NULL, 0, 'admin'),
(415, 'thongke', 'Thống Kê', 'Statistical', NULL, 0, 'admin'),
(416, 'thang', 'Tháng', 'Month', NULL, 0, 'admin'),
(417, 'year', 'Năm', 'Year', NULL, 0, 'admin'),
(418, 'trangkhongtontai', 'Trang không tồn tại', 'Page does not exist', NULL, 0, 'admin'),
(419, 'dulieukhongcothuc', 'Dữ liệu không có thực', 'Unreal data', NULL, 0, 'admin'),
(420, 'khongnhanduocdulieu', 'Không nhận được dữ liệu', 'Unreal data', NULL, 0, 'admin'),
(421, 'capnhatdulieuthanhcong', 'Cập nhật dữ liệu thành công', 'Data update successful', NULL, 0, 'admin'),
(422, 'capnhatdulieubiloi', 'Cập nhật dữ liệu bị lỗi', 'Update error data', NULL, 0, 'admin'),
(423, 'saochepdulieuthanhcong', 'Sao chép dữ liệu thành công', 'Copy data successful', NULL, 0, 'admin'),
(636, 'chitietkichthuoc', 'Chi tiết kích thước', 'Size details', NULL, 0, 'admin'),
(425, 'saochepdulieubiloi', 'Sao chép dữ liệu bị lỗi', 'Copy data error', NULL, 0, 'admin'),
(426, 'luudulieubiloi', 'Lưu dữ liệu bị lỗi', 'Save data error', NULL, 0, 'admin'),
(427, 'xoadulieuthanhcong', 'Xóa dữ liệu thành công', 'Delete data successfully', NULL, 0, 'admin'),
(428, 'xoadulieubiloi', 'Xóa dữ liệu bị lỗi', 'Delete corrupted data', NULL, 0, 'admin'),
(429, 'giabankhonghople', 'Giá bán không hợp lệ', 'Invalid sale price', NULL, 0, 'admin'),
(430, 'giamoikhonghople', 'Giá mới không hợp lệ', 'New price is not valid', NULL, 0, 'admin'),
(431, 'chieckhaukhonghople', 'Chiết khấu không hợp lệ', 'Invalid discount', NULL, 0, 'admin'),
(432, 'duongdandatontai', 'Đường dẫn đã tồn tại', 'Link already exists', NULL, 0, 'admin'),
(433, 'duongdankhongduoctrong', 'Đường dẫn không được trống', 'Link cannot be empty', NULL, 0, 'admin'),
(434, 'xoacachethanhcong', 'Xóa cache thành công', 'Clear cache successfully', NULL, 0, 'admin'),
(435, 'xoacachethatbai', 'Xóa cache thất bại', 'Clear cache failed', NULL, 0, 'admin'),
(436, 'hotenkhongthetrong', 'Họ tên không được trống', 'Name cannot empty', NULL, 0, 'admin'),
(437, 'sodienthoaikhongduoctrong', 'Số điện thoại không được trống', 'Phone number cannot be empty', NULL, 0, 'admin'),
(438, 'dulieurong', 'Dữ liệu rỗng', 'Empty data', NULL, 0, 'admin'),
(439, 'sodienthoaikhonghople', 'Số điện thoại không hợp lệ', 'Invalid phone number', NULL, 0, 'admin'),
(440, 'diachikhongduoctrong', 'Địa chỉ không được trống', 'Address cannot be empty', NULL, 0, 'admin'),
(441, 'emailkhongduoctrong', 'Email không được trống', 'Email cannot be empty', NULL, 0, 'admin'),
(442, 'emailkhonghople', 'Email không hợp lệ', 'Invalid email', NULL, 0, 'admin'),
(443, 'chudekhongduoctrong', 'Chủ đề không được trống', 'Topics can&#039;t be empty', NULL, 0, 'admin'),
(444, 'noidungkhongduoctrong', 'Nội dung không được trống', 'Content cannot be empty', NULL, 0, 'admin'),
(445, 'hoten', 'Họ tên', 'Full name', NULL, 0, 'admin'),
(446, 'dienthoai', 'Điện thoại', 'Phone', NULL, 0, 'admin'),
(447, 'madonhang', 'Mã đơn hàng', 'Code orders', NULL, 0, 'admin'),
(448, 'ngaydat', 'Ngày đặt', 'Booking date', NULL, 0, 'admin'),
(450, 'soluong', 'Số lượng', 'Quantity', NULL, 0, 'admin'),
(451, 'gia', 'Giá', 'Price', NULL, 0, 'admin'),
(452, 'giamoi', 'Giá mới', 'New price', NULL, 0, 'admin'),
(453, 'tamtinh', 'Tạm tính', 'Provisional', NULL, 0, 'admin'),
(454, 'phivanchuyen', 'Phí vận chuyển', 'Transport fee', NULL, 0, 'admin'),
(455, 'tonggiatridonhang', 'Tổng giá trị đơn hàng', 'Total order value', NULL, 0, 'admin'),
(456, 'hinhthucthanhtoan', 'Hình thức thanh toán', 'Payments', NULL, 0, 'admin'),
(457, 'danhsachdonhang', 'Danh sách đơn hàng', 'Orders List', NULL, 0, 'admin'),
(458, 'masanpham', 'Mã sản phẩm', 'Product code', NULL, 0, 'admin'),
(459, 'mota', 'Mô tả', 'Describe', NULL, 0, 'admin'),
(460, 'noidung', 'Nội dung', 'Content', NULL, 0, 'admin'),
(461, 'hinhanh', 'Hình ảnh', 'Photo', NULL, 0, 'admin'),
(462, 'luudulieuthatbai', 'Lưu dữ liệu thất bại', 'Data save failed', NULL, 0, 'admin'),
(463, 'luudulieuthanhcong', 'Lưu dữ liệu thành công', 'Save data successfully', NULL, 0, 'admin'),
(464, 'khongnhanduochinhanhmoi', 'Không nhận được hình ảnh mới', 'Didn&#039;t receive new pictures', NULL, 0, 'admin'),
(465, 'luuhinhanhbiloi', 'Lưu hình ảnh bị lỗi', 'Save the wrong image', NULL, 0, 'admin'),
(466, 'luuhinhanhthanhcong', 'Lưu hình ảnh thành công', 'Save image successfully', NULL, 0, 'admin'),
(467, 'taotaptinngonnguthatbai', 'Tạo tập tin ngôn ngữ thất bại', 'Language file creation failed', NULL, 0, 'admin'),
(468, 'taotaptinngonnguthanhcong', 'Tạo tập tin ngôn ngữ thành công', 'Language file creation successful', NULL, 0, 'admin'),
(469, 'tenbienkhongduoctrong', 'Tên biến không được trống', 'Variable name cannot be empty', NULL, 0, 'admin'),
(470, 'thuphanhoitu', 'Thư phản hồi từ', 'Feedback letter from', NULL, 0, 'admin'),
(471, 'emaildaduocguithanhcong', 'Email đã được gửi thành công', 'Email has been sent successfully', NULL, 0, 'admin'),
(472, 'emailguibiloi', 'Email gửi bị lỗi. Vui lòng thử lại sau', 'The email sent was corrupted. Please try again later', NULL, 0, 'admin'),
(473, 'duongdankhonghople', 'Đường dẫn không hợp lệ', 'Invalid link', NULL, 0, 'admin'),
(474, 'duongdanvideokhonghople', 'Đường dẫn video không hợp lệ', 'Invalid video link', NULL, 0, 'admin'),
(475, 'duongdanvideokhongduoctrong', 'Đường dẫn video không được trống', 'Video link cannot be empty', NULL, 0, 'admin'),
(476, 'kichthuoctoithieukhonghople', 'Kích thước tối thiểu không hợp lệ', 'Invalid min size', NULL, 0, 'admin'),
(477, 'kichthuoctoithieukhongduoctrong', 'Kích thước tối thiểu không được trống', 'Minimum size cannot be empty', NULL, 0, 'admin'),
(478, 'kichthuoctoidakhonghople', 'Kích thước tối đa không hợp lệ', 'Invalid max size', NULL, 0, 'admin'),
(479, 'kichthuoctoidakhongduoctrong', 'Kích thước tối đa không được trống', 'Maximum size cannot be empty', NULL, 0, 'admin'),
(480, 'tilelt300khonghople', 'Tỉ lệ &lt; 300 không hợp lệ', 'Odds &lt; 300 are not valid', NULL, 0, 'admin'),
(481, 'tilelt300khongduoctrong', 'Tỉ lệ &lt; 300 không được trống', 'Scale &lt; 300 can&#039;t be empty', NULL, 0, 'admin'),
(482, 'tilegt300khonghople', 'Tỉ lệ &gt; 300 không hợp lệ', 'Odds &gt; 300 are invalid', NULL, 0, 'admin'),
(483, 'tilegt300khongduoctrong', 'Tỉ lệ &gt; 300 không được trống', 'Scale &gt; 300 can&#039;t be empty', NULL, 0, 'admin'),
(484, 'chuachonvitridongdau', 'Chưa chọn vị trí đóng dấu', 'Stamp location has not been selected', NULL, 0, 'admin'),
(485, 'tieudekhongduoctrong', 'Tiêu đề không được trống', 'Title cannot be empty', NULL, 0, 'admin'),
(486, 'chuachontinhthanhpho', 'Chưa chọn tỉnh/thành phố', 'No province/city selected', NULL, 0, 'admin'),
(487, 'chuachonquanhuyen', 'Chưa chọn quận/huyện', 'No district/district selected yet', NULL, 0, 'admin'),
(488, 'phivanchuyenkhonghople', 'Phí vận chuyển không hợp lệ', 'Invalid shipping fee', NULL, 0, 'admin'),
(489, 'lienketkhongduoctrong', 'Liên kết không được trống', 'Link cannot be empty', NULL, 0, 'admin'),
(490, 'motakhongduoctrong', 'Mô tả không được trống', 'Description cannot be empty', NULL, 0, 'admin'),
(491, 'guithongbaothanhcong', 'Gửi thông báo thành công', 'Successful message sent', NULL, 0, 'admin'),
(492, 'bankhongcoquyentruycapvaokhuvucnay', 'Bạn không có quyền truy cập vào khu vực này', 'You do not have access to this area', NULL, 0, 'admin'),
(493, 'nhomquyennaykhongtontai', 'Nhóm quyền này không tồn tại', 'This permission group does not exist', NULL, 0, 'admin'),
(494, 'vuilongchonquyenchonhomnay', 'Vui lòng chọn quyền cho nhóm này', 'Please select permissions for this group', NULL, 0, 'admin'),
(495, 'capnhatnhomquyenthanhcong', 'Cập nhật nhóm quyền thành công', 'Update permission group successfully', NULL, 0, 'admin'),
(496, 'capnhatnhomquyenthatbai', 'Cập nhật nhóm quyền thất bại', 'Permission group update failed', NULL, 0, 'admin'),
(497, 'taonhomquyenthanhcong', 'Tạo nhóm quyền thành công', 'Create a successful permission group', NULL, 0, 'admin'),
(498, 'taonhomquyenthatbai', 'Tạo nhóm quyền thất bại', 'Permission group creation failed', NULL, 0, 'admin'),
(499, 'matkhaucukhongchinhxac', 'Mật khẩu cũ không chính xác', 'Old password is incorrect', NULL, 0, 'admin'),
(500, 'matkhaumoikhongduoctrong', 'Mật khẩu mới không được trống', 'New password cannot be blank', NULL, 0, 'admin'),
(501, 'matkhaubandatquadongian', 'Mật khẩu bạn đặt quá đơn giãn', 'The password you set is too simple', NULL, 0, 'admin'),
(502, 'xacnhanmatkhaumoikhongduoctrong', 'Xác nhận mật khẩu mới không được trống', 'Confirm new password cannot be empty', NULL, 0, 'admin'),
(503, 'matkhaumoikhongtrungkhop', 'Mật khẩu mới không trùng khớp', 'New password does not match', NULL, 0, 'admin'),
(504, 'taikhoankhongduoctrong', 'Tài khoản không được trống', 'Account cannot be empty', NULL, 0, 'admin'),
(505, 'taikhoanchiduocnhapchuthuongvaso', 'Tài khoản chỉ được nhập chữ thường và số (chữ thường không dấu, ghi liền nhau, không khoảng trắng)', 'Accounts can only enter lowercase letters and numbers (lowercase without accents, contiguous, no spaces)', NULL, 0, 'admin'),
(506, 'taikhoandatontai', 'Tài khoản đã tồn tại', 'Account already exists', NULL, 0, 'admin'),
(507, 'emaildatontai', 'Email đã tồn tại', 'Email already exists', NULL, 0, 'admin'),
(508, 'chuachongioitinh', 'Chưa chọn giới tính', 'No gender selected', NULL, 0, 'admin'),
(509, 'ngaysinhkhongduoctrong', 'Ngày sinh không được trống', 'Date of birth cannot be empty', NULL, 0, 'admin'),
(510, 'ngaysinhkhonghople', 'Ngày sinh không hợp lệ', 'Invalid date of birth', NULL, 0, 'admin'),
(511, 'chuachonnhomquyen', 'Chưa chọn nhóm quyền', 'The permission group has not been selected', NULL, 0, 'admin'),
(512, 'matkhaukhongduoctrong', 'Mật khẩu không được trống', 'Password cannot empty', NULL, 0, 'admin'),
(513, 'xacnhanmatkhaukhongduoctrong', 'Xác nhận mật khẩu không được trống', 'Confirm password cannot be empty', NULL, 0, 'admin'),
(514, 'matkhaukhongtrungkhop', 'Mật khẩu không trùng khớp', 'Password does not match', NULL, 0, 'admin'),
(515, 'bankhongcoquyentrentaikhoannaymoithacmacxinlienhequantriwebsite', 'Bạn không có quyền trên tài khoản này. Mọi thắc mắc xin liên hệ quản trị website', 'You do not have permissions on this account. If you have any questions, please contact the website administrator', NULL, 0, 'admin'),
(516, 'quanlybinhluan', 'Quản lý bình luận', 'Manage comments', NULL, 0, 'admin'),
(517, 'thoat', 'Thoát', 'Exit', NULL, 0, 'admin'),
(518, 'xemchitiet', 'Xem chi tiết', 'See details', NULL, 0, 'admin'),
(519, 'danhgiatrungbinh', 'Đánh Giá Trung Bình', 'Average Rating', NULL, 0, 'admin'),
(520, 'nhanxet', 'nhận xét', 'comment', NULL, 0, 'admin'),
(521, 'danhsachbinhluan', 'Danh sách bình luận', 'Comments List', NULL, 0, 'admin'),
(635, 'danhsachkichthuoc', 'Danh sách kích thước', 'Size List', NULL, 0, 'admin'),
(523, 'xoatatca', 'Xóa tất cả', 'Delete all', NULL, 0, 'admin'),
(524, 'khongcodulieu', 'Không có dữ liệu', 'No data', NULL, 0, 'admin'),
(525, 'timkiem', 'Tìm kiếm', 'Search', NULL, 0, 'admin'),
(526, 'danhsachlienhe', 'Danh sách liên hệ', 'Contact list', NULL, 0, 'admin'),
(527, 'thaotac', 'Thao tác', 'Operation', NULL, 0, 'admin'),
(528, 'quanlylienhe', 'Quản lý liên hệ', 'Contact Management', NULL, 0, 'admin'),
(529, 'chitietlienhe', 'Chi tiết liên hệ', 'Contact Details', NULL, 0, 'admin'),
(530, 'luu', 'Lưu', 'Save', NULL, 0, 'admin'),
(531, 'lamlai', 'Làm lại', 'Reset', NULL, 0, 'admin'),
(532, 'thongtinlienhe', 'Thông tin liên hệ', 'Contact Info', NULL, 0, 'admin'),
(633, 'chieckhau', 'Chiếc khấu', 'Discount', NULL, 0, 'admin'),
(534, 'downloadtaptinhientai', 'Download tập tin hiện tại', 'Download current file', NULL, 0, 'admin'),
(535, 'taptintrong', 'Tập tin trống', 'Empty file', NULL, 0, 'admin'),
(536, 'noidungseo', 'Nội dung SEO', 'SEO Content', NULL, 0, 'admin'),
(537, 'ghichu', 'Ghi chú', 'Note', NULL, 0, 'admin'),
(538, 'sothutu', 'Số thứ tự', 'Ordinal number', NULL, 0, 'admin'),
(539, 'exportdanhsachdulieu', 'Export danh sách dữ liệu', 'Export data list', NULL, 0, 'admin'),
(540, 'xuatdanhsachsanphamthanhtaptinexcel', 'Xuất danh sách sản phẩm thành tập tin excel', 'Export product list to excel file', NULL, 0, 'admin'),
(541, 'capnhat', 'Cập nhật', 'Update', NULL, 0, 'admin'),
(542, 'themmoi', 'Thêm mới', 'Add', NULL, 0, 'admin'),
(543, 'danhsach', 'Danh sách', 'List', NULL, 0, 'admin'),
(544, 'danhmucmausac', 'Danh mục màu sắc', 'Color catalog', NULL, 0, 'admin'),
(545, 'khongcomausac', 'Không có màu sắc', 'No color', NULL, 0, 'admin'),
(546, 'uploadhinhanh', 'Upload hình ảnh', 'Upload photo', NULL, 0, 'admin'),
(547, 'uploadtaptin', 'Upload tập tin', 'Upload files', NULL, 0, 'admin'),
(548, 'chitiet', 'Chi tiết', 'Detail', NULL, 0, 'admin'),
(549, 'tieude', 'Tiêu đề', 'Title', NULL, 0, 'admin'),
(550, 'quanlyhinhanhimportexcel', 'Quản lý hình ảnh import excel', 'Manage images import excel', NULL, 0, 'admin'),
(551, 'chitiethinhanh', 'Chi tiết hình ảnh', 'Detail photo', NULL, 0, 'admin'),
(552, 'chonfile', 'Chọn file', 'Choose file', NULL, 0, 'admin'),
(553, 'hinhanhimport', 'Hình ảnh import', 'Imported photo', NULL, 0, 'admin'),
(554, 'cach1', 'Cách 1', 'Way 1', NULL, 0, 'admin'),
(555, 'bancothenhaphinhbangcachcopyduongdanhinhonlinevaotaptinexcel', 'Bạn có thể nhập hình bằng cách copy đường dẫn hình online vào tập tin excel', 'You can import the image by copying the image link online into the excel file', NULL, 0, 'admin'),
(556, 'vidu', 'Ví dụ', 'For example', NULL, 0, 'admin'),
(557, 'copyduongdannhuvidutrenvaotaptinexceldeimporthinhanh', 'Copy đường dẫn như ví dụ trên vào tập tin excel để import hình ảnh', 'Copy the path as the example above into the excel file to import the image', NULL, 0, 'admin'),
(558, 'cach2', 'Cách 2', 'Way 2', NULL, 0, 'admin'),
(559, 'danhsachhinhanhimport', 'Danh sách hình ảnh import', 'List of imported images', NULL, 0, 'admin'),
(560, 'hinh', 'Hình', 'Photo', NULL, 0, 'admin'),
(561, 'importdanhsachdulieu', 'Import danh sách dữ liệu', 'Import data list', NULL, 0, 'admin'),
(562, 'loai', 'Loại', 'Type', NULL, 0, 'admin'),
(563, 'keovathahinhvaoday', 'Kéo và thả hình vào đây', 'Drag and drop image here', NULL, 0, 'admin'),
(564, 'hoac', 'hoặc', 'or', NULL, 0, 'admin'),
(565, 'chonhinh', 'Chọn hình', 'Choose photo', NULL, 0, 'admin'),
(566, 'neuquykhachkhongbietcachsudungdatastructurevuilongkhongnhapnoidungvaokhungnaydetranhphatsinhloi', 'Nếu quý khách không biết cách sử dụng Data Structure vui lòng không nhập nội dung vào khung này để tránh phát sinh lỗi...', 'If you do not know how to use Data Structure, please do not enter content in this box to avoid errors...', NULL, 0, 'admin'),
(567, 'kytu', 'ký tự', 'characters', NULL, 0, 'admin'),
(568, 'duongdan', 'Đường dẫn', 'Slug', NULL, 0, 'admin'),
(569, 'vuilongkhongnhaptrungtieude', 'Vui lòng không nhập trùng tiêu đề', 'Please do not enter the same title', NULL, 0, 'admin'),
(570, 'thaydoiduongdantheotieudemoi', 'Thay đổi đường dẫn theo tiêu đề mới', 'Change path under new title', NULL, 0, 'admin'),
(571, 'duongdanmau', 'Đường dẫn mẫu', 'Sample path', NULL, 0, 'admin'),
(572, 'duongdandatontaiduongdantruycapmucnaycothebitrunglap', 'Đường dẫn đã tồn tại. Đường dẫn truy cập mục này có thể bị trùng lặp', 'The path already exists. The path to access this item may be duplicated', NULL, 0, 'admin'),
(573, 'duongdanhople', 'Đường dẫn hợp lệ', 'Valid path', NULL, 0, 'admin'),
(574, 'clickvaodayneukhongmuondoilau', 'Click vào đây nếu không muốn đợi lâu', 'Click here if you don&#039;t want to wait', NULL, 0, 'admin'),
(575, 'danhmuc', 'Danh mục', 'Category', NULL, 0, 'admin'),
(576, 'bosuutap', 'Bộ sưu tập', 'Attached photo', NULL, 0, 'admin'),
(577, 'taoseo', 'Tạo SEO', 'Create SEO', NULL, 0, 'admin'),
(578, 'albumhientai', 'Album hiện tại', 'Current album', NULL, 0, 'admin'),
(579, 'chontatca', 'Chọn tất cả', 'Select all', NULL, 0, 'admin'),
(580, 'sapxep', 'Sắp xếp', 'Arrange', NULL, 0, 'admin'),
(581, 'cothechonnhieuhinhdedichuyen', 'Có thể chọn nhiều hình để di chuyển', 'Can select multiple images to move', NULL, 0, 'admin'),
(582, 'them', 'Thêm', 'Add', NULL, 0, 'admin'),
(583, 'tailieuthamkhao', 'Tài liệu tham khảo', 'Reference material', NULL, 0, 'admin'),
(584, 'luuvataotudongschema', 'Lưu và tạo tự động Schema', 'Save and auto-generate Schema', NULL, 0, 'admin'),
(585, 'luutaitrang', 'Lưu tại trang', 'Saved at page', NULL, 0, 'admin'),
(586, 'saochepngay', 'Sao chép ngay', 'Copy now', NULL, 0, 'admin'),
(587, 'chinhsuathongtin', 'Chỉnh sửa thông tin', 'Edit information', NULL, 0, 'admin'),
(588, 'chude', 'Chủ đề', 'Topic', NULL, 0, 'admin'),
(589, 'tinhtrang', 'Tình trạng', 'Status', NULL, 0, 'admin'),
(590, 'capnhattinhtrang', 'Cập nhật tình trạng', 'Update status', NULL, 0, 'admin'),
(591, 'guiemail', 'Gửi email', 'Send email', NULL, 0, 'admin'),
(592, 'chonemailsaudokeoxuongduoicungdanhsachnaydecothethietlapnoidungemailmuonguidi', 'Chọn email sau đó kéo xuống dưới cùng danh sách này để có thể thiết lập nội dung email muốn gửi đi', 'Select the email then scroll down to the bottom of this list to be able to set the email content you want to send', NULL, 0, 'admin'),
(593, 'ngaytao', 'Ngày tạo', 'Date created', NULL, 0, 'admin'),
(594, 'chinhsua', 'Chỉnh sửa', 'Edit', NULL, 0, 'admin'),
(595, 'thongtindonhang', 'Thông tin đơn hàng', 'Orders', NULL, 0, 'admin'),
(596, 'thongtinchinh', 'Thông tin chính', 'Main information', NULL, 0, 'admin'),
(597, 'yeucaukhac', 'Yêu cầu khác', 'Other requirements', NULL, 0, 'admin'),
(598, 'chitietdonhang', 'Chi tiết đơn hàng', 'Order details', NULL, 0, 'admin'),
(599, 'tensanpham', 'Tên sản phẩm', 'Product&#039;s name', NULL, 0, 'admin'),
(600, 'dongia', 'Đơn giá', 'Unit price', NULL, 0, 'admin'),
(601, 'tonggia', 'Tổng giá', 'Total price', NULL, 0, 'admin'),
(602, 'moidat', 'Mới đặt', 'Just ordered', NULL, 0, 'admin'),
(603, 'daxacnhan', 'Đã xác nhận', 'Confirmed', NULL, 0, 'admin'),
(604, 'dagiao', 'Đã giao', 'Delivered', NULL, 0, 'admin'),
(605, 'dahuy', 'Đã hủy', 'Cancelled', NULL, 0, 'admin'),
(606, 'timkiemdonhang', 'Tìm kiếm đơn hàng', 'Order search', NULL, 0, 'admin'),
(607, 'khoanggia', 'Khoảng giá', 'Price range', NULL, 0, 'admin'),
(608, 'huyloc', 'Hủy lọc', 'Cancel filter', NULL, 0, 'admin'),
(609, 'xuatfileexcel', 'Xuất file Excel', 'Export Excel file', NULL, 0, 'admin'),
(610, 'xuatfileword', 'Xuất file Word', 'Export Word file', NULL, 0, 'admin'),
(611, 'chuyenhuongtoilink', 'Chuyển hướng tới link', 'Redirect to link', NULL, 0, 'admin'),
(612, 'chuyenhuong', 'Chuyển hướng', 'Redirect', NULL, 0, 'admin'),
(613, 'loaidieuhuong', 'Loại điều hướng', 'Redirect  type', NULL, 0, 'admin'),
(614, 'linkmoi', 'Link mới', 'New link', NULL, 0, 'admin'),
(615, 'vitridongdau', 'Vị trí đóng dấu', 'Stamp position', NULL, 0, 'admin'),
(616, 'tile', 'Tỉ lệ', 'Ratio', NULL, 0, 'admin'),
(617, 'kichthuoctoida', 'Kích thước tối đa', 'Maximum size', NULL, 0, 'admin'),
(618, 'kichthuoctoithieu', 'Kích thước tối thiểu', 'Minimum size', NULL, 0, 'admin'),
(619, 'tuychonlap', 'Tùy chọn lặp', 'Repeat option', NULL, 0, 'admin'),
(620, 'khonglaplai', 'Không lặp lại', 'Do not repeat', NULL, 0, 'admin'),
(621, 'chonthuoctinh', 'Chọn thuộc tính', 'Select properties', NULL, 0, 'admin'),
(622, 'taptinsanpham', 'Tập tin sản phẩm', 'Product file', NULL, 0, 'admin'),
(623, 'taptin', 'Tập tin', 'File', NULL, 0, 'admin'),
(624, 'hinhanhsanpham', 'Hình ảnh sản phẩm', 'Product photo', NULL, 0, 'admin'),
(625, 'videosanpham', 'Video sản phẩm', 'Product videos', NULL, 0, 'admin'),
(626, 'hinhanhsanphamcap1', 'Hình ảnh sản phẩm cấp 1', 'Product image level 1', NULL, 0, 'admin'),
(627, 'videosanphamcap1', 'Video sản phẩm cấp 1', 'Product video level 1', NULL, 0, 'admin'),
(628, 'hinhanhthuvienanh', 'Hình ảnh thư viện ảnh', 'Photo gallery image', NULL, 0, 'admin'),
(631, 'danhmuctags', 'Danh mục tags', 'Category tags', NULL, 0, 'admin'),
(632, 'masp', 'Mã sản phẩm', 'Product code', NULL, 0, 'admin'),
(637, 'kichthuoc', 'kích thước', 'size', NULL, 0, 'admin'),
(638, 'quanlymausac', 'Quản lý màu sắc', 'Color Management', NULL, 0, 'admin'),
(639, 'danhsachmausac', 'Danh sách màu sắc', 'Color list', NULL, 0, 'admin'),
(640, 'chitietmausac', 'Chi tiết màu sắc', 'Color details', NULL, 0, 'admin'),
(641, 'mausac', 'màu sắc', 'color', NULL, 0, 'admin'),
(642, 'loaihienthi', 'Loại hiển thị', 'Display Type', NULL, 0, 'admin'),
(643, 'chonloaihienthi', 'Chọn loại hiển thị', 'Select display type', NULL, 0, 'admin'),
(644, 'traloi', 'Trả lời', 'Reply', NULL, 0, 'admin'),
(645, 'xoa', 'Xóa', 'Delete', NULL, 0, 'admin'),
(646, 'boduyet', 'Bỏ duyệt', 'Quit browsing', NULL, 0, 'admin'),
(647, 'duyet', 'Duyệt', 'Browser', NULL, 0, 'admin'),
(648, 'moi', 'Mới', 'New', NULL, 0, 'admin'),
(649, 'xemthembinhluan', 'Xem thêm bình luận', 'See more comments', NULL, 0, 'admin'),
(650, 'phanhoiboibanquantri', 'Phản hồi bởi Ban Quản Trị', 'Response by the Board of Directors', NULL, 0, 'admin'),
(651, 'guitraloi', 'Gửi trả lời', 'Send reply', NULL, 0, 'admin'),
(652, 'huybo', 'Hủy bỏ', 'Cancel', NULL, 0, 'admin'),
(653, 'vietcautraloicuaban', 'Viết câu trả lời của bạn', 'Write your answer', NULL, 0, 'admin'),
(654, 'taithembinhluan', 'Tải thêm bình luận', 'Download more comments', NULL, 0, 'admin'),
(655, 'giohang', 'Giỏ hàng', 'Cart', NULL, 0, 'admin'),
(656, 'tagssanpham', 'Tags sản phẩm', 'Product Tags', NULL, 0, 'admin'),
(657, 'tagstintuc', 'Tags tin tức', 'News tags', NULL, 0, 'admin'),
(658, 'thongtin', 'Thông tin', 'Information', NULL, 0, 'admin'),
(659, 'laplai', 'Lặp lại', 'Repeat', NULL, 0, 'admin'),
(660, 'laplaitheochieungang', 'Lặp lại theo chiều ngang', 'Repeat horizontally', NULL, 0, 'admin'),
(661, 'laplaitheochieudoc', 'Lặp lại theo chiều dọc', 'Repeat vertically', NULL, 0, 'admin'),
(662, 'toanmanhinh', 'Toàn màn hình', 'Full screen', NULL, 0, 'admin'),
(663, 'toanmanhinhtheochieungang', 'Toàn màn hình theo chiều ngang', 'Horizontal full screen', NULL, 0, 'admin'),
(664, 'toanmanhinhtheochieudoc', 'Toàn màn hình theo chiều dọc', 'Full screen vertically', NULL, 0, 'admin'),
(665, 'vitri', 'Vị trí', 'Location', NULL, 0, 'admin'),
(666, 'chontinhtrang', 'Chọn tình trạng', 'Select status', NULL, 0, 'admin'),
(667, 'canhtraicanhtren', 'Canh Trái - Canh Trên', 'Left Soup - Top Soup', NULL, 0, 'admin'),
(668, 'canhtraicanhduoi', 'Canh Trái - Canh Dưới', 'Left Soup - Bottom Soup', NULL, 0, 'admin'),
(669, 'canhtraicanhgiua', 'Canh Trái - Canh Giữa', 'Left Side - Center Soup', NULL, 0, 'admin'),
(670, 'canhphaicanhtren', 'Canh Phải - Canh Trên', 'Right Side - Upper Side', NULL, 0, 'admin'),
(671, 'canhphaicanhduoi', 'Canh Phải - Canh Dưới', 'Right Side - Bottom Side', NULL, 0, 'admin'),
(672, 'canhphaicanhgiua', 'Canh Phải - Canh Giữa', 'Right Sided - Middle Side', NULL, 0, 'admin'),
(673, 'canhgiuacanhtren', 'Canh Giữa - Canh Trên', 'Canh Giữa - Canh Trên', NULL, 0, 'admin'),
(674, 'canhgiuacanhduoi', 'Canh Giữa - Canh Dưới', 'Middle Soup - Bottom Soup', NULL, 0, 'admin'),
(675, 'canhgiuacanhgiua', 'Canh Giữa - Canh Giữa', 'Mid-Stitch - Mid-Stitch', NULL, 0, 'admin'),
(676, 'codinh', 'Cố định', 'Permanent', NULL, 0, 'admin'),
(677, 'khongcodinh', 'Không cố định', 'Unstable', NULL, 0, 'admin'),
(678, 'maunen', 'Màu nền', 'Background color', NULL, 0, 'admin'),
(679, 'hinhnen', 'Hình nền', 'Background image', NULL, 0, 'admin'),
(680, 'dangkynhantin', 'Đăng ký nhận tin', 'Sign up for', NULL, 0, 'admin'),
(681, 'daxem', 'Đã xem', 'Watched', NULL, 0, 'admin'),
(682, 'dalienhe', 'Đã liên hệ', 'Contacted', NULL, 0, 'admin'),
(683, 'dathongbao', 'Đã thông báo', 'Announced', NULL, 0, 'admin'),
(684, 'tuyendung', 'Tuyển dụng', 'Recruitment', NULL, 0, 'admin'),
(685, 'hinhanhtintuccap1', 'Hình ảnh Tin tức cấp 1', 'Image News Level 1', NULL, 0, 'admin'),
(686, 'videotintuccap1', 'Video Tin tức cấp 1', 'Video News Level 1', NULL, 0, 'admin'),
(687, 'chinhsach', 'Chính sách', 'Policy', NULL, 0, 'admin'),
(688, 'hinhthucthanhtoan', 'Hình thức thanh toán', 'Payments', NULL, 0, 'admin'),
(689, 'doitac', 'Đối tác', 'Partner', NULL, 0, 'admin'),
(690, 'watermarktintuc', 'Watermark tin tức', 'News watermark', NULL, 0, 'admin'),
(691, 'lienhe', 'Liên hệ', 'Contact', NULL, 0, 'admin'),
(692, 'gioithieu', 'Giới thiệu', 'About us', NULL, 0, 'admin'),
(693, 'chitiettinhthanh', 'Chi tiết tỉnh thành', 'Province details', NULL, 0, 'admin'),
(694, 'quanlytinhthanh', 'Quản lý tỉnh thành', 'Provincial management', NULL, 0, 'admin'),
(695, 'danhsachtinhthanh', 'Danh sách tỉnh thành', 'List of provinces', NULL, 0, 'admin'),
(696, 'quanlyquanhuyen', 'Quản lý quận huyên', 'District Manager', NULL, 0, 'admin'),
(697, 'danhsachquanhuyen', 'Danh sách quận huyện', 'List of districts', NULL, 0, 'admin'),
(699, 'chitietquanhuyen', 'Chi tiết quận huyện', 'District details', NULL, 0, 'admin'),
(700, 'chitietphuongxa', 'Chi tiết phường xã', 'Ward details', NULL, 0, 'admin'),
(701, 'danhsachthongbaoday', 'Danh sách thông báo đẩy', 'List of push notifications', NULL, 0, 'admin'),
(702, 'daytin', 'Đẩy tin', 'Push news', NULL, 0, 'admin'),
(703, 'chitietthongbaoday', 'Chi tiết thông báo đẩy', 'Push notification details', NULL, 0, 'admin'),
(704, 'thongtinseopage', 'Thông tin SEO page', 'Page SEO information', NULL, 0, 'admin'),
(705, 'thongtincongty', 'Thông tin công ty', 'Company information', NULL, 0, 'admin'),
(706, 'cauhinh', 'Cấu hình', 'Configuration', NULL, 0, 'admin'),
(707, 'thongtinchung', 'Thông tin chung', 'General information', NULL, 0, 'admin'),
(708, 'ngonngumacdinh', 'Ngôn ngữ mặc định', 'Default language', NULL, 0, 'admin'),
(709, 'toadogooglemap', 'Tọa độ google map', 'Google map coordinates', NULL, 0, 'admin'),
(710, 'giolamviec', 'Giờ làm việc', 'Work time', NULL, 0, 'admin'),
(711, 'toadogooglemapiframe', 'Tọa độ google map iframe', 'Coordinates google map iframe', NULL, 0, 'admin'),
(712, 'laymanhunggooglemap', 'Lấy mã nhúng google map', 'Get google map embed code', NULL, 0, 'admin'),
(713, 'laymanhung', 'Lấy mã nhúng', 'Get the embed code', NULL, 0, 'admin'),
(714, 'thongtintaikhoan', 'Thông tin tài khoản', 'Account information', NULL, 0, 'admin'),
(715, 'thongtinadmin', 'Thông tin admin', 'Admin information', NULL, 0, 'admin'),
(716, 'matkhaucu', 'Mật khẩu cũ', 'Old password', NULL, 0, 'admin'),
(717, 'matkhaumoi', 'Mật khẩu mới', 'A new password', NULL, 0, 'admin'),
(718, 'taomatkhau', 'Tạo mật khẩu', 'Create a password', NULL, 0, 'admin'),
(719, 'nhaplaimatkhaumoi', 'Nhập lại mật khẩu mới', 'Enter a new password', NULL, 0, 'admin'),
(720, 'taikhoan', 'Tài khoản', 'Account', NULL, 0, 'admin'),
(721, 'gioitinh', 'Giới tính', 'Sex', NULL, 0, 'admin'),
(722, 'nam', 'Nam', 'Male', NULL, 0, 'admin'),
(723, 'nu', 'Nữ', 'Female', NULL, 0, 'admin'),
(724, 'ngaysinh', 'Ngày sinh', 'Date of birth', NULL, 0, 'admin'),
(725, 'chitiettaikhoanadmin', 'Chi tiết tài khoản admin', 'Admin account details', NULL, 0, 'admin'),
(726, 'nhaplaimatkhau', 'Nhập lại mật khẩu', 'Enter the password', NULL, 0, 'admin'),
(727, 'chongioitinh', 'Chọn giới tính', 'Choose your gender', NULL, 0, 'admin'),
(728, 'quanlytaikhoanadmin', 'Quản lý tài khoản admin', 'Manage admin account', NULL, 0, 'admin'),
(729, 'danhsachtaikhoanadmin', 'Danh sách tài khoản admin', 'List of admin accounts', NULL, 0, 'admin'),
(730, 'chitiettaikhoankhach', 'Chi tiết tài khoản khách', 'Guest account details', NULL, 0, 'admin'),
(731, 'quanlytaikhoankhach', 'Quản lý tài khoản khách', 'Manage guest accounts', NULL, 0, 'admin'),
(732, 'danhsachtaikhoankhach', 'Danh sách tài khoản khách', 'List of guest accounts', NULL, 0, 'admin'),
(733, 'tennhomquyen', 'Tên nhóm quyền', 'Permission group name', NULL, 0, 'admin'),
(734, 'quanly', 'Quản lý', 'Manage', NULL, 0, 'admin'),
(735, 'xemdanhsach', 'Xem danh sách', 'View list', NULL, 0, 'admin'),
(736, 'quanlybaiviet', 'Quản lý bài viết', 'Manage Posts', NULL, 0, 'admin'),
(737, 'quanlythongtincongty', 'Quản lý thông tin công ty', 'Company information management', NULL, 0, 'admin'),
(738, 'quanlyseopage', 'Quản lý SEO page', 'Manage SEO page', NULL, 0, 'admin'),
(739, 'quanlynhomquyen', 'Quản lý nhóm quyền', 'Manage group permissions', NULL, 0, 'admin'),
(740, 'danhsachnhomquyen', 'Danh sách nhóm quyền', 'List of permission groups', NULL, 0, 'admin'),
(741, 'dangnhap', 'Đăng nhập', 'Log in', NULL, 0, 'admin'),
(742, 'dangnhaphethong', 'Đăng nhập hệ thống', 'Sign in', NULL, 0, 'admin'),
(743, 'chondanhmuc', 'Chọn danh mục', 'Select a category', NULL, 0, 'admin'),
(744, 'uploadthatbai', 'Upload thất bại', 'Upload failed', NULL, 0, 'admin'),
(745, 'uploadthanhcong', 'Upload thành công', 'Upload successfully', NULL, 0, 'admin'),
(746, 'xinloivuilongthulaisau', 'Xin lỗi..! Vui lòng thử lại sau', 'Sorry..! Please try again later', NULL, 0, 'admin'),
(747, 'phut', 'phút', 'minute', NULL, 0, 'admin'),
(748, 'chuanhaptendangnhapvamatkhau', 'Chưa nhập tên đăng nhập và mật khẩu', 'No username and password entered', NULL, 0, 'admin'),
(749, 'chuanhaptendangnhap', 'Chưa nhập tên đăng nhập', 'Username not entered', NULL, 0, 'admin'),
(750, 'chuanhapmatkhau', 'Chưa nhập mật khẩu', 'Password not entered', NULL, 0, 'admin'),
(751, 'dangnhapthanhcong', 'Đăng nhập thành công', 'Logged in successfully', NULL, 0, 'admin'),
(752, 'matkhaukhongchinhxac', 'Mật khẩu không chính xác', 'Incorrect password', NULL, 0, 'admin'),
(753, 'tendangnhapkhongtontai', 'Tên đăng nhập không tồn tại', 'Username does not exist', NULL, 0, 'admin'),
(754, 'saithongtincon', 'Sai thông tin. Còn', 'Wrong information. Still', NULL, 0, 'admin'),
(755, 'lanthu', 'lần thử', 'try', NULL, 0, 'admin'),
(756, 'bandahetlanthuvuilongthulaisau', 'Bạn đã hết lần thử. Vui lòng thử lại sau', 'You have run out of attempts. Please try again later', NULL, 0, 'admin'),
(757, 'dangtai', 'Đang tải', 'Loading', NULL, 0, 'admin'),
(758, 'phanhoithanhcong', 'Phản hồi thành công', 'Successful response', NULL, 0, 'admin'),
(759, 'hethongbiloivuilongthulaisau', 'Hệ thống bị lỗi. Vui lòng thử lại sau.', 'Error. Please try again later.', NULL, 0, 'admin'),
(760, 'capnhattrangthaithanhcong', 'Cập nhật trạng thái thành công', 'Status update successful', NULL, 0, 'admin'),
(761, 'banmuonxoabinhluannay', 'Bạn muốn xóa bình luận này ?', 'Want to delete this comment?', NULL, 0, 'admin'),
(762, 'xoabinhluanthanhcong', 'Xóa bình luận thành công', 'Comment deleted successfully', NULL, 0, 'admin'),
(763, 'chonhinhthucthanhtoan', 'Chọn hình thức thanh toán', 'Choose a form of payment', NULL, 0, 'admin'),
(764, 'banhaychonitnhat1mucdegui', 'Bạn hãy chọn ít nhất 1 mục để gửi', 'Please select at least 1 item to send', NULL, 0, 'admin'),
(765, 'banhaychonitnhat1mucdexoa', 'Bạn hãy chọn ít nhất 1 mục để xóa', 'Please select at least 1 item to delete', NULL, 0, 'admin'),
(766, 'dongy', 'Đồng ý', 'Agree', NULL, 0, 'admin'),
(767, 'dungluonghinhanhlondungluongchopheplt4mb4096kb', 'Dung lượng hình ảnh lớn. Dung lượng cho phép &lt;= 4MB ~ 4096KB', 'Large image capacity. Allowed capacity &lt;= 4MB ~ 4096KB', NULL, 0, 'admin'),
(768, 'dinhdanghinhanhkhonghople', 'Định dạng hình ảnh không hợp lệ', 'Invalid image format', NULL, 0, 'admin'),
(769, 'dulieukhonghople', 'Dữ liệu không hợp lệ', 'Invalid data', NULL, 0, 'admin'),
(770, 'banchiduocchon1hinhanhdeupload', 'Bạn chỉ được chọn 1 hình ảnh để upload', 'You can only choose 1 image to upload', NULL, 0, 'admin'),
(771, 'banmuonxoahinhanhnay', 'Bạn muốn xóa hình ảnh này ?', 'Want to delete this image?', NULL, 0, 'admin'),
(772, 'xulythatbaivuilongthulaisau', 'Xử lý thất bại. Vui lòng thử lại sau.', 'Handling failure. Please try again later.', NULL, 0, 'admin'),
(773, 'banmuondaytinnay', 'Bạn muốn đẩy tin này ?', 'Want to push this message?', NULL, 0, 'admin');
INSERT INTO `table_lang` (`id`, `lang_define`, `langvi`, `langen`, `langja`, `numb`, `type`) VALUES
(774, 'banmuonguithongtinchocacmucdachon', 'Bạn muốn gửi thông tin cho các mục đã chọn ?', 'Want to send information for selected items ?', NULL, 0, 'admin'),
(775, 'bancochacmuonxoamucnay', 'Bạn có chắc muốn xóa mục này ?', 'Are you sure you want to delete this entry?', NULL, 0, 'admin'),
(776, 'bancochacmuonxoanhungmucnay', 'Bạn có chắc muốn xóa những mục này ?', 'Are you sure you want to delete these items?', NULL, 0, 'admin'),
(777, 'dulieuhinhanhkhonghople', 'Dữ liệu hình ảnh không hợp lệ', 'Invalid image data', NULL, 0, 'admin'),
(778, 'noidungseodaduocthietlapbanmuontaolainoidungseo', 'Nội dung SEO đã được thiết lập. Bạn muốn tạo lại nội dung SEO ?', 'SEO content is already set up. Want to recreate SEO content?', NULL, 0, 'admin'),
(779, 'bancochacmuonxoahinhanhnay', 'Bạn có chắc muốn xóa hình ảnh này ?', 'Are you sure you want to delete this image?', NULL, 0, 'admin'),
(780, 'bancochacmuonxoacachinhanhdachon', 'Bạn có chắc muốn xóa các hình ảnh đã chọn ?', 'Are you sure you want to delete the selected images ?', NULL, 0, 'admin'),
(781, 'themhinh', 'Thêm hình', 'Add pictures', NULL, 0, 'admin'),
(782, 'vuilongchonhinhanh', 'Vui lòng chọn hình ảnh', 'Please choose an image', NULL, 0, 'admin'),
(783, 'nhunghinhdaduocchon', 'Những hình đã được chọn', 'Selected images', NULL, 0, 'admin'),
(784, 'keohinhvaodaydeupload', 'Kéo hình vào đây để upload', 'Drag the picture here to upload', NULL, 0, 'admin'),
(785, 'banmuonloaibohinhanhnay', 'Bạn muốn loại bỏ hình ảnh này ?', 'You want to remove this image ?', NULL, 0, 'admin'),
(786, 'chihotrotaptinlahinhanhcodinhdang', 'Chỉ hỗ trợ tập tin là hình ảnh có định dạng', 'Only files that are images are supported', NULL, 0, 'admin'),
(787, 'chiduocuploadmoilan', 'Chỉ được upload mỗi lần', 'Can only be uploaded at a time', NULL, 0, 'admin'),
(788, 'cokichthuocqualonvuilonguploadhinhanhcokichthuoctoida', 'có kích thước quá lớn. Vui lòng upload hình ảnh có kích thước tối đa', 'size is too large. Please upload the maximum size image', NULL, 0, 'admin'),
(789, 'nhunghinhanhbanchoncokichthuocqualonvuilongchonnhunghinhanhcokichthuoctoida', 'Những hình ảnh bạn chọn có kích thước quá lớn. Vui lòng chọn những hình ảnh có kích thước tối đa', 'The images you selected are too large in size. Please choose the maximum size images', NULL, 0, 'admin'),
(790, 'chon', 'Chọn', 'Choose', NULL, 0, 'admin'),
(791, 'quanlysanpham', 'Quản lý sản phẩm', 'Products', NULL, 0, 'admin'),
(792, 'matkhau', 'Mật khẩu', 'Password', NULL, 0, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `table_member`
--

CREATE TABLE `table_member` (
  `id` int UNSIGNED NOT NULL,
  `id_social` tinyint(1) DEFAULT '0',
  `username` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT '0',
  `login_session` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastlogin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` int DEFAULT '0',
  `numb` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_news`
--

CREATE TABLE `table_news` (
  `id` int UNSIGNED NOT NULL,
  `id_list` int DEFAULT '0',
  `id_item` int DEFAULT '0',
  `id_cat` int DEFAULT '0',
  `id_sub` int DEFAULT '0',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugvi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenten` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subnamevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subnameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `iframe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0',
  `date_timeline` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` int DEFAULT '0',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_attach` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zalo` int DEFAULT '0',
  `phone` int DEFAULT '0',
  `thoiluongvi` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soluongvi` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thoigianvi` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cackhoavi` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thoiluongja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soluongja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thoigianja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cackhoaja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subnameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thoiluongen` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soluongen` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thoigianen` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cackhoaen` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_news`
--

INSERT INTO `table_news` (`id`, `id_list`, `id_item`, `id_cat`, `id_sub`, `photo`, `options`, `slugvi`, `slugen`, `contenten`, `contentvi`, `descen`, `descvi`, `nameen`, `namevi`, `subnamevi`, `subnameen`, `attributes`, `link`, `iframe`, `numb`, `status`, `type`, `date_created`, `date_updated`, `date_timeline`, `view`, `icon`, `file_attach`, `position`, `zalo`, `phone`, `thoiluongvi`, `soluongvi`, `thoigianvi`, `cackhoavi`, `thoiluongja`, `soluongja`, `thoigianja`, `cackhoaja`, `nameja`, `descja`, `contentja`, `subnameja`, `slugja`, `thoiluongen`, `soluongen`, `thoigianen`, `cackhoaen`) VALUES
(1, 0, 0, 0, 0, 'chatgpt-image-may-9-2026-090020-am-4127.png', '', '', '', '', '', '', '&lt;p&gt;&lt;strong&gt;Lorem Ipsum&lt;/strong&gt; chỉ đơn giản là một đoạn văn bản giả, được dùng vào việc trình bày và dàn trang phục vụ cho in ấn. Lorem Ipsum đã được sử dụng như một văn bản chuẩn cho ngành công nghiệp in ấn từ những năm 1500, khi một họa sĩ vô danh ghép nhiều đoạn văn bản với nhau để tạo thành một bản mẫu văn bản. Đoạn văn bản này không những đã tồn tại năm thế kỉ, mà khi được áp dụng vào tin học văn phòng, nội dung của nó vẫn không hề bị thay đổi. Nó đã được phổ biến trong những năm 1960 nhờ việc bán những bản giấy Letraset in những đoạn Lorem Ipsum, và gần đây hơn, được sử dụng trong các ứng dụng dàn trang, như Aldus PageMaker.&lt;/p&gt;\r\n', '', 'Lorem Ipsum là gì?', '', '', '{\"list\":\"\"}', '', '', 1, 'hienthi', 'lich-su-hinh-thanh', 1778289270, 1778292216, '2023', 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, 0, 0, 0, 0, '1920x1125fg21-07651001slovakf-16graphic-3copy-8189.jpg', '', '', '', '', '', '', '&lt;p&gt;Chúng ta vẫn biết rằng, làm việc với một đoạn văn bản dễ đọc và rõ nghĩa dễ gây rối trí và cản trở việc tập trung vào yếu tố trình bày văn bản. Lorem Ipsum có ưu điểm hơn so với đoạn văn bản chỉ gồm nội dung kiểu &quot;Nội dung, nội dung, nội dung&quot; là nó khiến văn bản giống thật hơn, bình thường hơn. Nhiều phần mềm thiết kế giao diện web và dàn trang ngày nay đã sử dụng Lorem Ipsum làm đoạn văn bản giả, và nếu bạn thử tìm các đoạn &quot;Lorem ipsum&quot; trên mạng thì sẽ khám phá ra nhiều trang web hiện vẫn đang trong quá trình xây dựng. Có nhiều phiên bản khác nhau đã xuất hiện, đôi khi do vô tình, nhiều khi do cố ý (xen thêm vào những câu hài hước hay thông tục).&lt;/p&gt;\r\n', '', 'Tại sao lại sử dụng nó?', '', '', '{\"list\":\"\"}', '', '', 2, 'hienthi', 'lich-su-hinh-thanh', 1778289272, 1778289427, '2023-2024', 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, 0, 0, 0, 0, '220125195944-f-35c-file-exlarge-169730438399-3069.jpeg', '', '', '', '', '', '', '&lt;p&gt;Trái với quan điểm chung của số đông, Lorem Ipsum không phải chỉ là một đoạn văn bản ngẫu nhiên. Người ta tìm thấy nguồn gốc của nó từ những tác phẩm văn học la-tinh cổ điển xuất hiện từ năm 45 trước Công Nguyên, nghĩa là nó đã có khoảng hơn 2000 tuổi. Một giáo sư của trường Hampden-Sydney College (bang Virginia - Mỹ) quan tâm tới một trong những từ la-tinh khó hiểu nhất, &quot;consectetur&quot;, trích từ một đoạn của Lorem Ipsum, và đã nghiên cứu tất cả các ứng dụng của từ này trong văn học cổ điển, để từ đó tìm ra nguồn gốc không thể chối cãi của Lorem Ipsum. Thật ra, nó được tìm thấy trong các đoạn 1.10.32 và 1.10.33 của &quot;De Finibus Bonorum et Malorum&quot; (Đỉnh tối thượng của Cái Tốt và Cái Xấu) viết bởi Cicero vào năm 45 trước Công Nguyên. Cuốn sách này là một luận thuyết đạo lí rất phổ biến trong thời kì Phục Hưng. Dòng đầu tiên của Lorem Ipsum, &quot;Lorem ipsum dolor sit amet...&quot; được trích từ một câu trong đoạn thứ 1.10.32.&lt;/p&gt;\r\n', '', 'Nó đến từ đâu?', '', '', '{\"list\":\"\"}', '', '', 3, 'hienthi', 'lich-su-hinh-thanh', 1778289273, 1778289317, '2024', 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(4, 0, 0, 0, 0, 'dong-co-hydro-3190.jpg', '', '', '', '', '', '', '&lt;p&gt;Có rất nhiều biến thể của Lorem Ipsum mà bạn có thể tìm thấy, nhưng đa số được biến đổi bằng cách thêm các yếu tố hài hước, các từ ngẫu nhiên có khi không có vẻ gì là có ý nghĩa. Nếu bạn định sử dụng một đoạn Lorem Ipsum, bạn nên kiểm tra kĩ để chắn chắn là không có gì nhạy cảm được giấu ở giữa đoạn văn bản. Tất cả các công cụ sản xuất văn bản mẫu Lorem Ipsum đều được làm theo cách lặp đi lặp lại các đoạn chữ cho tới đủ thì thôi, khiến cho lipsum.com trở thành công cụ sản xuất Lorem Ipsum đáng giá nhất trên mạng. Trang web này sử dụng hơn 200 từ la-tinh, kết hợp thuần thục nhiều cấu trúc câu để tạo ra văn bản Lorem Ipsum trông có vẻ thật sự hợp lí. Nhờ thế, văn bản Lorem Ipsum được tạo ra mà không cần một sự lặp lại nào, cũng không cần chèn thêm các từ ngữ hóm hỉnh hay thiếu trật tự.&lt;/p&gt;\r\n', '', 'Làm thế nào để có nó?', '', '', '{\"list\":\"\"}', '', '', 4, 'hienthi', 'lich-su-hinh-thanh', 1778289274, 1778289341, '2025', 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(5, 0, 0, 0, 0, '20-9992.jpg', '', '', '', '', '', '', '&lt;p&gt;Trích đoạn chuẩn của Lorem Ipsum được sử dụng từ thế kỉ thứ 16 và được tái bản sau đó cho những người quan tâm đến nó. Đoạn 1.10.32 và 1.10.33 trong cuốn &quot;De Finibus Bonorum et Malorum&quot; của Cicero cũng được tái bản lại theo đúng cấu trúc gốc, kèm theo phiên bản tiếng Anh được dịch bởi H. Rackham vào năm 1914.&lt;/p&gt;\r\n', '', 'Không có ai muốn khổ đau cho chính mình', '', '', '{\"list\":\"\"}', '', '', 5, 'hienthi', 'lich-su-hinh-thanh', 1778289275, 1778289402, '2026', 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `table_newsletter`
--

CREATE TABLE `table_newsletter` (
  `id` int UNSIGNED NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_attach` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notes` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `confirm_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0',
  `numb` int DEFAULT '0',
  `id_chuongtrinh` int DEFAULT '0',
  `id_khoahoc` int DEFAULT '0',
  `trinhdo` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `table_news_cat`
--

CREATE TABLE `table_news_cat` (
  `id` int UNSIGNED NOT NULL,
  `id_list` int DEFAULT '0',
  `slugvi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenten` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0',
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_news_item`
--

CREATE TABLE `table_news_item` (
  `id` int UNSIGNED NOT NULL,
  `id_list` int DEFAULT '0',
  `id_cat` int DEFAULT '0',
  `slugvi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenten` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_updated` int DEFAULT '0',
  `date_created` int DEFAULT '0',
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_news_list`
--

CREATE TABLE `table_news_list` (
  `id` int UNSIGNED NOT NULL,
  `slugvi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenten` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0',
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_news_sub`
--

CREATE TABLE `table_news_sub` (
  `id` int UNSIGNED NOT NULL,
  `id_list` int DEFAULT '0',
  `id_cat` int DEFAULT '0',
  `id_item` int DEFAULT '0',
  `slugvi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenten` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_updated` int DEFAULT '0',
  `date_created` int DEFAULT '0',
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_news_tags`
--

CREATE TABLE `table_news_tags` (
  `id` int UNSIGNED NOT NULL,
  `id_parent` int DEFAULT '0',
  `id_tags` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_order`
--

CREATE TABLE `table_order` (
  `id` int UNSIGNED NOT NULL,
  `id_user` int DEFAULT '0',
  `code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_payment` int DEFAULT '0',
  `temp_price` double DEFAULT '0',
  `total_price` double DEFAULT '0',
  `city` int DEFAULT '0',
  `district` int DEFAULT '0',
  `ward` int DEFAULT '0',
  `ship_price` double DEFAULT '0',
  `requirements` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_created` int DEFAULT '0',
  `order_status` int DEFAULT '0',
  `numb` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_order_detail`
--

CREATE TABLE `table_order_detail` (
  `id` int UNSIGNED NOT NULL,
  `id_order` int DEFAULT '0',
  `id_product` int DEFAULT '0',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regular_price` double DEFAULT '0',
  `sale_price` double DEFAULT '0',
  `quantity` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_order_status`
--

CREATE TABLE `table_order_status` (
  `id` int NOT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_order` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_order_status`
--

INSERT INTO `table_order_status` (`id`, `namevi`, `nameen`, `class_order`, `nameja`) VALUES
(1, 'Mới đặt', 'New order', 'text-primary', ''),
(2, 'Đã xác nhận', 'Confirmed order', 'text-info', ''),
(3, 'Đang giao hàng', 'Delivering order', 'text-warning', ''),
(4, 'Đã giao', 'Delivered order', 'text-success', ''),
(5, 'Đã hủy', 'Canceled order', 'text-danger', '');

-- --------------------------------------------------------

--
-- Table structure for table `table_permission`
--

CREATE TABLE `table_permission` (
  `id` int UNSIGNED NOT NULL,
  `id_permission_group` int DEFAULT '0',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_permission`
--

INSERT INTO `table_permission` (`id`, `id_permission_group`, `permission`) VALUES
(1995, 4, 'news_delete_tin-tuc'),
(1994, 4, 'news_edit_tin-tuc'),
(1993, 4, 'news_add_tin-tuc'),
(1992, 4, 'news_man_tin-tuc'),
(1991, 4, 'news_delete_list_tin-tuc'),
(1990, 4, 'news_edit_list_tin-tuc'),
(1989, 4, 'news_add_list_tin-tuc'),
(1988, 4, 'news_man_list_tin-tuc'),
(1987, 3, 'product_delete_photo_san-pham'),
(1986, 3, 'product_edit_photo_san-pham'),
(1985, 3, 'product_add_photo_san-pham'),
(1984, 3, 'product_man_photo_san-pham'),
(1983, 3, 'product_delete_san-pham'),
(1982, 3, 'product_edit_san-pham'),
(1981, 3, 'product_add_san-pham'),
(1980, 3, 'product_man_san-pham'),
(1979, 3, 'product_delete_sub_san-pham'),
(1978, 3, 'product_edit_sub_san-pham'),
(1977, 3, 'product_add_sub_san-pham'),
(1976, 3, 'product_man_sub_san-pham'),
(1975, 3, 'product_delete_item_san-pham'),
(1974, 3, 'product_edit_item_san-pham'),
(1973, 3, 'product_add_item_san-pham'),
(1972, 3, 'product_man_item_san-pham'),
(1971, 3, 'product_delete_cat_san-pham'),
(1970, 3, 'product_edit_cat_san-pham'),
(1969, 3, 'product_add_cat_san-pham'),
(1968, 3, 'product_man_cat_san-pham'),
(1967, 3, 'product_delete_list_san-pham'),
(1966, 3, 'product_edit_list_san-pham'),
(1965, 3, 'product_add_list_san-pham'),
(1964, 3, 'product_man_list_san-pham'),
(1963, 1, 'product_delete_photo_san-pham'),
(1962, 1, 'product_edit_photo_san-pham'),
(1961, 1, 'product_add_photo_san-pham'),
(1960, 1, 'product_man_photo_san-pham'),
(1959, 1, 'product_delete_san-pham'),
(1958, 1, 'product_edit_san-pham'),
(1957, 1, 'product_add_san-pham'),
(1956, 1, 'product_man_san-pham'),
(1955, 1, 'product_delete_size_san-pham'),
(1954, 1, 'product_edit_size_san-pham'),
(1953, 1, 'product_add_size_san-pham'),
(1952, 1, 'product_man_size_san-pham'),
(1951, 1, 'product_delete_color_san-pham'),
(1950, 1, 'product_edit_color_san-pham'),
(1949, 1, 'product_add_color_san-pham'),
(1948, 1, 'product_man_color_san-pham'),
(1947, 1, 'product_delete_brand_san-pham'),
(1946, 1, 'product_edit_brand_san-pham'),
(1945, 1, 'product_add_brand_san-pham'),
(1944, 1, 'product_man_brand_san-pham'),
(1943, 1, 'product_delete_sub_san-pham'),
(1942, 1, 'product_edit_sub_san-pham'),
(1941, 1, 'product_add_sub_san-pham'),
(1940, 1, 'product_man_sub_san-pham'),
(1939, 1, 'product_delete_item_san-pham'),
(1938, 1, 'product_edit_item_san-pham'),
(1937, 1, 'product_add_item_san-pham'),
(1936, 1, 'product_man_item_san-pham'),
(1935, 1, 'product_delete_cat_san-pham'),
(1934, 1, 'product_edit_cat_san-pham'),
(1933, 1, 'product_add_cat_san-pham'),
(1932, 1, 'product_man_cat_san-pham'),
(1927, 2, 'news_edit_tin-tuc'),
(1931, 1, 'product_delete_list_san-pham'),
(1930, 1, 'product_edit_list_san-pham'),
(1929, 1, 'product_add_list_san-pham'),
(1928, 1, 'product_man_list_san-pham'),
(1926, 2, 'news_add_tin-tuc'),
(1925, 2, 'news_man_tin-tuc'),
(1924, 2, 'news_edit_list_tin-tuc'),
(1923, 2, 'news_add_list_tin-tuc'),
(1922, 2, 'news_man_list_tin-tuc');

-- --------------------------------------------------------

--
-- Table structure for table `table_permission_group`
--

CREATE TABLE `table_permission_group` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_permission_group`
--

INSERT INTO `table_permission_group` (`id`, `name`, `numb`, `status`, `date_created`, `date_updated`) VALUES
(1, 'Nhóm quyền cấp cao', 1, 'hienthi', 1609288475, 1758643004),
(2, 'Nhóm quyền cơ bản', 2, 'hienthi', 1609288536, 1758642925),
(3, 'Sản phẩm', 1, 'hienthi', 1758770724, 0),
(4, 'tin tuc', 1, 'hienthi', 1758770743, 0);

-- --------------------------------------------------------

--
-- Table structure for table `table_photo`
--

CREATE TABLE `table_photo` (
  `id` int UNSIGNED NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenten` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link_video` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `act` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0',
  `link2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loaidieuhuong` int DEFAULT NULL,
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_photo`
--

INSERT INTO `table_photo` (`id`, `photo`, `contenten`, `contentvi`, `descen`, `descvi`, `nameen`, `namevi`, `link`, `link_video`, `file_video`, `options`, `type`, `act`, `numb`, `status`, `date_created`, `date_updated`, `link2`, `loaidieuhuong`, `nameja`, `descja`, `contentja`, `slugja`) VALUES
(1, 'facebook-50590.png', '', '', '', '', '', 'Facebook', '', '', '', '', 'social', 'photo_multi', 1, 'hienthi', 1777690963, 0, '', 0, '', '', '', ''),
(2, 'icon-messenger-17921.png', '', '', '', '', '', 'Message', '', '', '', '', 'social', 'photo_multi', 2, 'hienthi', 1777690963, 0, '', 0, '', '', '', ''),
(3, 'instagram-71502.png', '', '', '', '', '', 'Instargam', '', '', '', '', 'social', 'photo_multi', 3, 'hienthi', 1777690963, 0, '', 0, '', '', '', ''),
(4, 'tiktok-83913.png', '', '', '', '', '', 'Tiktok', 'https://vt.tiktok.com/ZS9nuW1De/', '', '', '', 'social', 'photo_multi', 4, 'hienthi', 1777690963, 1778290700, '', 0, '', '', '', ''),
(5, 'youtube-86714.png', '', '', '', '', '', 'Youtobe', '', '', '', '', 'social', 'photo_multi', 5, 'hienthi', 1777690963, 0, '', 0, '', '', '', ''),
(6, 'bannerfaq-7475.png', '', '', '', '', '', '', '', '', '', '', 'banner-faq', 'photo_static', 0, 'hienthi', 1777697558, 1778294993, '', 0, '', '', '', ''),
(7, 'mimaoke-1596.png', '', '', '', '', '', '', '', '', '', '', 'popup', 'photo_static', 0, 'hienthi', 1777697613, 0, '', 0, '', '', '', ''),
(8, 'logomima-8683.png', '', '', '', '', '', '', '', '', '', '', 'logo', 'photo_static', 0, 'hienthi', 1777697722, 1778291486, '', 0, '', '', '', ''),
(9, 'logomima-4765.png', '', '', '', '', '', '', '', '', '', '', 'logo-footer', 'photo_static', 0, 'hienthi', 1777697728, 1778295792, '', 0, '', '', '', ''),
(10, '1920x1125fg21-07651001slovakf-16graphic-3copy-80190.jpg', '', '', '', '', '', '', '', '', '', '', 'slide', 'photo_multi', 1, 'hienthi', 1778289798, 1778289834, '', 0, '', '', '', ''),
(11, 'may-bay-chien-dau-t-50-ma-nga-muon-ban-cho-viet-nam-1-76020.jpg', '', '', '', '', '', '', '', '', '', '', 'slide', 'photo_multi', 1, 'hienthi', 1778289850, 0, '', 0, '', '', '', ''),
(12, 'w-tau-san-bay1-1-1178-4162.jpg', '', '', '', '', '', '', '', '', '', '', 'slide', 'photo_multi', 1, 'hienthi', 1778289864, 1778289893, '', 0, '', '', '', ''),
(13, 'logo-shopee-764x800-2487.png', '', '', '', '', '', 'Shoppee', 'https://s.shopee.vn/2LO7k4zLQF', '', '', '', 'social', 'photo_multi', 6, 'hienthi', 1778290191, 1778290525, '', 0, '', '', '', ''),
(14, '1920x1125fg21-07651001slovakf-16graphic-3copy-2521.jpg', '', '', '', '', '', '', '', '', '', '', 'banner-top', 'photo_static', 0, 'hienthi', 1778291526, 0, '', 0, '', '', '', ''),
(15, 'chatgpt-image-may-9-2026-090020-am-6602.png', '', '', '', '', '', '', '', '', '', '', 'favicon', 'photo_static', 0, 'hienthi', 1778291574, 1778292115, '', 0, '', '', '', ''),
(16, 'bannertuvan-8840.png', '', '', '', '', '', '', '', '', '', '', 'banner-form', 'photo_static', 0, 'hienthi', 1778292802, 0, '', 0, '', '', '', ''),
(17, 'adidas-logo-86380.png', '', '', '', '', '', '', '', '', '', '', 'doi-tac', 'photo_multi', 1, 'hienthi', 1778295716, 0, '', 0, '', '', '', ''),
(18, 'amazon-logo-75451.png', '', '', '', '', '', '', '', '', '', '', 'doi-tac', 'photo_multi', 1, 'hienthi', 1778295716, 0, '', 0, '', '', '', ''),
(19, 'apple-logo-40732.png', '', '', '', '', '', '', '', '', '', '', 'doi-tac', 'photo_multi', 1, 'hienthi', 1778295716, 0, '', 0, '', '', '', ''),
(20, 'audi-logo-92043.png', '', '', '', '', '', '', '', '', '', '', 'doi-tac', 'photo_multi', 1, 'hienthi', 1778295716, 0, '', 0, '', '', '', ''),
(21, 'chatgpt-image-may-9-2026-090020-am-58664.png', '', '', '', '', '', '', '', '', '', '', 'doi-tac', 'photo_multi', 1, 'hienthi', 1778295716, 0, '', 0, '', '', '', ''),
(22, 'dove-logo-84645.png', '', '', '', '', '', '', '', '', '', '', 'doi-tac', 'photo_multi', 1, 'hienthi', 1778295716, 0, '', 0, '', '', '', ''),
(23, 'gucci-logo-66346.png', '', '', '', '', '', '', '', '', '', '', 'doi-tac', 'photo_multi', 1, 'hienthi', 1778295716, 0, '', 0, '', '', '', ''),
(24, 'harvard-university-logo-79847.png', '', '', '', '', '', '', '', '', '', '', 'doi-tac', 'photo_multi', 1, 'hienthi', 1778295716, 0, '', 0, '', '', '', ''),
(25, 'puma-logo-37298.png', '', '', '', '', '', '', '', '', '', '', 'doi-tac', 'photo_multi', 1, 'hienthi', 1778295716, 0, '', 0, '', '', '', ''),
(26, 'pittsburgh-zoo-logo-53139.png', '', '', '', '', '', '', '', '', '', '', 'doi-tac', 'photo_multi', 1, 'hienthi', 1778295716, 0, '', 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `table_product`
--

CREATE TABLE `table_product` (
  `id` int UNSIGNED NOT NULL,
  `id_danhmuc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_muakem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_list` int DEFAULT '0',
  `id_item` int DEFAULT '0',
  `id_cat` int DEFAULT '0',
  `id_sub` int DEFAULT '0',
  `id_brand` int DEFAULT '0',
  `id_size` int DEFAULT '0',
  `id_city` int DEFAULT '0',
  `id_ward` int DEFAULT '0',
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugvi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quatangvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quatangen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `thongsovi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `thongsoen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contenten` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regular_price` double DEFAULT '0',
  `discount` double DEFAULT '0',
  `sale_price` double DEFAULT '0',
  `pre_price` double DEFAULT '0',
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0',
  `view` int DEFAULT '0',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quick_search` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `area` double DEFAULT '0',
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quatangja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `thongsoja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `baohanh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `congsuat` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bass` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `treble` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cautrucloa` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `daitanso` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `donhay` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soluong` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_product_attributes`
--

CREATE TABLE `table_product_attributes` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `attribute_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` int DEFAULT '0',
  `updated_at` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_product_attribute_options`
--

CREATE TABLE `table_product_attribute_options` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `attribute_id` int NOT NULL,
  `option_id` int UNSIGNED DEFAULT NULL,
  `option_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT '0',
  `created_at` int DEFAULT '0',
  `updated_at` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_product_brand`
--

CREATE TABLE `table_product_brand` (
  `id` int NOT NULL,
  `id_lists` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugvi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenten` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0',
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_product_cat`
--

CREATE TABLE `table_product_cat` (
  `id` int NOT NULL,
  `id_list` int DEFAULT '0',
  `id_brands` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugvi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenten` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0',
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_product_item`
--

CREATE TABLE `table_product_item` (
  `id` int UNSIGNED NOT NULL,
  `id_list` int DEFAULT '0',
  `id_cat` int DEFAULT '0',
  `id_brands` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugvi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenten` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_updated` int DEFAULT '0',
  `date_created` int DEFAULT '0',
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_product_list`
--

CREATE TABLE `table_product_list` (
  `id` int NOT NULL,
  `id_brands` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugvi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenten` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0',
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_product_sale`
--

CREATE TABLE `table_product_sale` (
  `id` int UNSIGNED NOT NULL,
  `id_parent` int DEFAULT '0',
  `id_color` int DEFAULT '0',
  `id_size` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_product_sub`
--

CREATE TABLE `table_product_sub` (
  `id` int UNSIGNED NOT NULL,
  `id_list` int DEFAULT '0',
  `id_cat` int DEFAULT '0',
  `id_item` int DEFAULT '0',
  `slugvi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenten` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_updated` int DEFAULT '0',
  `date_created` int DEFAULT '0',
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_product_tags`
--

CREATE TABLE `table_product_tags` (
  `id` int UNSIGNED NOT NULL,
  `id_parent` int DEFAULT '0',
  `id_tags` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_product_variants`
--

CREATE TABLE `table_product_variants` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `combination_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `combo_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `discount_price` double DEFAULT '0',
  `weight` double DEFAULT '0',
  `percent_discount` int DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT '0',
  `stock` int DEFAULT '0',
  `created_at` int DEFAULT '0',
  `updated_at` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_product_variant_options`
--

CREATE TABLE `table_product_variant_options` (
  `id` int NOT NULL,
  `variant_id` int NOT NULL,
  `option_id` int UNSIGNED DEFAULT NULL,
  `option_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_pushonesignal`
--

CREATE TABLE `table_pushonesignal` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_created` int DEFAULT '0',
  `numb` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_search`
--

CREATE TABLE `table_search` (
  `id` int NOT NULL,
  `namevi` varchar(255) DEFAULT NULL,
  `nameen` varchar(255) DEFAULT NULL,
  `nameja` varchar(245) DEFAULT NULL,
  `min` double DEFAULT '0',
  `max` double DEFAULT '0',
  `tygia` double DEFAULT '0',
  `type` varchar(30) DEFAULT NULL,
  `hienthi` tinyint(1) DEFAULT '0',
  `stt` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `table_seo`
--

CREATE TABLE `table_seo` (
  `id` int UNSIGNED NOT NULL,
  `id_parent` int DEFAULT '0',
  `com` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `act` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `titlevi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `keywordsvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `titleen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `keywordsen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `schemavi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `schemaen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `titleja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywordsja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `schemaja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `table_seo`
--

INSERT INTO `table_seo` (`id`, `id_parent`, `com`, `act`, `type`, `titlevi`, `keywordsvi`, `descriptionvi`, `titleen`, `keywordsen`, `descriptionen`, `schemavi`, `schemaen`, `titleja`, `keywordsja`, `descriptionja`, `schemaja`) VALUES
(486, 22, 'news', 'man', 'chinh-sach', '', '', '', '', '', '', '', '', '', '', '', ''),
(478, 25, 'tags', 'man', 'giai-phap', '', '', '', '', '', '', '', '', '', '', '', ''),
(479, 15, 'news', 'man', 'giai-phap', '', '', '', '', '', '', '', '', '', '', '', ''),
(480, 16, 'news', 'man', 'giai-phap', '', '', '', '', '', '', '', '', '', '', '', ''),
(481, 17, 'news', 'man', 'giai-phap', '', '', '', '', '', '', '', '', '', '', '', ''),
(482, 18, 'news', 'man', 'giai-phap', '', '', '', '', '', '', '', '', '', '', '', ''),
(483, 19, 'news', 'man', 'chinh-sach', '', '', '', '', '', '', '', '', '', '', '', ''),
(484, 20, 'news', 'man', 'chinh-sach', '', '', '', '', '', '', '', '', '', '', '', ''),
(485, 21, 'news', 'man', 'chinh-sach', '', '', '', '', '', '', '', '', '', '', '', ''),
(465, 7, 'news', 'man', 'du-an', '', '', '', '', '', '', '', '', '', '', '', ''),
(474, 12, 'news', 'man', 'du-an', '', '', '', '', '', '', '', '', '', '', '', ''),
(475, 11, 'news', 'man', 'du-an', '', '', '', '', '', '', '', '', '', '', '', ''),
(473, 10, 'news', 'man', 'du-an', '', '', '', '', '', '', '', '', '', '', '', ''),
(469, 9, 'news', 'man', 'du-an', '', '', '', '', '', '', '', '', '', '', '', ''),
(470, 8, 'news', 'man', 'du-an', '', '', '', '', '', '', '', '', '', '', '', ''),
(471, 14, 'news', 'man', 'du-an', '', '', '', '', '', '', '', '', '', '', '', ''),
(472, 13, 'news', 'man', 'du-an', '', '', '', '', '', '', '', '', '', '', '', ''),
(476, 23, 'tags', 'man', 'giai-phap', '', '', '', '', '', '', '', '', '', '', '', ''),
(477, 24, 'tags', 'man', 'giai-phap', '', '', '', '', '', '', '', '', '', '', '', ''),
(487, 0, 'setting', 'update', 'setting', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `table_seopage`
--

CREATE TABLE `table_seopage` (
  `id` int UNSIGNED NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `titlevi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `keywordsvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `titleen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `keywordsen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descriptionen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `table_setting`
--

CREATE TABLE `table_setting` (
  `id` int NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mastertool` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `headjs` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bodyjs` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressvi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `analytics` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `color_logo` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_header` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_main` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `themes_main` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tokenoauth` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tokengsc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_setting`
--

INSERT INTO `table_setting` (`id`, `options`, `mastertool`, `headjs`, `bodyjs`, `namevi`, `nameen`, `addressvi`, `addressen`, `analytics`, `color_logo`, `color_header`, `color_main`, `themes_main`, `tokenoauth`, `tokengsc`, `nameja`, `addressja`) VALUES
(1, '{\"mailertype\":\"1\",\"ip_host\":\"mail.mimadigi.com\",\"port_host\":\"465\",\"secure_host\":\"ssl\",\"email_host\":\"noreply@mimadigi.com\",\"password_host\":\"aR3}~[dRtlS5u|@\",\"host_gmail\":\"mail.mimadigi.com\",\"port_gmail\":\"465\",\"secure_gmail\":\"ssl\",\"email_gmail\":\"noreply@mimadigi.com\",\"password_gmail\":\"aR3}~[dRtlS5u|@\",\"lang_default\":\"vi\",\"address\":\"S\\u1ed1 L22-23, \\u0111\\u01b0\\u1eddng N1, Khu ph\\u1ed1 1, Ph\\u01b0\\u1eddng Tr\\u1ea5n Bi\\u00ean, \\u0110\\u1ed3ng Nai\",\"email\":\"hoahd98.mima@gmail.com\",\"hotline\":\"0888080138\",\"phone\":\"0888080138\",\"zalo\":\"0888080138\",\"oaidzalo\":\"\",\"website\":\"0\",\"fanpage\":\"\",\"toado\":\"\",\"toado_iframe\":\"<iframe src=\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3919.4481760094527!2d106.68480041483649!3d10.776945462130913!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f3b27d8a7fd%3A0xdb0d92470911a699!2sThe%20Box%20Market!5e0!3m2!1svi!2s!4v1589339784678!5m2!1svi!2s\\\" width=\\\"600\\\" height=\\\"450\\\" frameborder=\\\"0\\\" style=\\\"border:0;\\\" allowfullscreen=\\\"\\\" aria-hidden=\\\"false\\\" tabindex=\\\"0\\\"><\\/iframe>\",\"coords\":\"10.9553352,106.8026958\",\"coords_iframe\":\"<iframe src=\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d3917.1063948005913!2d106.80269577480766!3d10.955335189204542!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d98a2bfdadb5%3A0xcdbc96951b7064e7!2zQ8O0bmcgdHkgVE5ISCBUxrAgduG6pW4gdGhp4bq_dCBr4bq_IFjDonkgZOG7sW5nIFRy4bqnbiBRdcO9!5e0!3m2!1svi!2s!4v1776478010217!5m2!1svi!2s\\\" width=\\\"600\\\" height=\\\"450\\\" style=\\\"border:0;\\\" allowfullscreen=\\\"\\\" loading=\\\"lazy\\\" referrerpolicy=\\\"no-referrer-when-downgrade\\\"><\\/iframe>\",\"link_googlemaps\":\"https:\\/\\/maps.app.goo.gl\\/JD2W7Ho6mb8Hrmsw6\",\"worktime\":\"T2 - CN, 8:00 \\u0111\\u1ebfn 17:30\",\"khcanhan\":\"\",\"khdoanhnghiep\":\"\",\"mst\":\"3603869726\",\"cskh\":\"0975 188 488\",\"hotrokt\":\"0975 188 488\",\"subtitle\":\"TR\\u1ea6N QU\\u00dd X\\u00c2Y D\\u1ef0NG\",\"sanpham\":\"1001\",\"khachhang\":\"1500\",\"tinhthanh\":\"50\",\"duan\":\"1000\",\"doitac\":\"900\",\"nhansu\":\"100\",\"prompt_apikey\":\"AIzaSyARHLBBuPhEoWJcznOLojx9W_zhSYdfXc4,AIzaSyDBlTZT4PGl3-Y-2bwcSxfDRB76oUZC7rM,AIzaSyAIiTESzCWIVaabc3A82ikH65O3CwbaixM,AIzaSyCBIyzb3RowNwxZ7wSDUUzRo8CILajMz78,AIzaSyBFhs_4k6ygQnunlGFaa8CZsEWj8M44cAw\",\"prompt_linhvuc\":\"THI\\u1ebe K\\u1ebe N\\u1ed8I TH\\u1ea4T, THI C\\u00d4NG X\\u00c2Y D\\u1ef0NG\",\"prompt_namthanhlap\":\"2015\",\"prompt_sanpham\":\"N\\u1ed8I TH\\u1ea4T\",\"prompt_tamnhin\":\"\",\"prompt_sumenh\":\"\",\"prompt_cotloi\":\"\",\"prompt_thanhtuu\":\"\",\"prompt_dichvu\":\"THI C\\u00d4NG , THI\\u1ebeT K\\u1ebe N\\u1ed8I TH\\u1ea4T, THI C\\u00d4NG X\\u00c2Y D\\u1ef0NG\",\"prompt_colorh2\":\"#b77345\",\"youtube\":\"\",\"footer\":\"<div aria-hidden=\\\"true\\\" class=\\\"content-text mm-panel mm-hidden\\\" id=\\\"mm-3\\\" style=\\\"display: block !important; padding: 10px !important\\\">\\r\\n<p><span style=\\\"font-size:16px;\\\"><strong>C\\u00f4ng Ty TNHH Th\\u01b0\\u01a1ng M\\u1ea1i D\\u1ecbch V\\u1ee5 MIMA<\\/strong><\\/span>\\u00a0<br \\/>\\r\\nMST<strong>:<\\/strong> <span style=\\\"color:#f39c12;\\\">0318672839<\\/span><br \\/>\\r\\n<strong>\\u0110\\u1ecba ch\\u1ec9:<\\/strong> <a href=\\\"https:\\/\\/maps.app.goo.gl\\/rA8evCuRwT3Go6bR9\\\" target=\\\"_blank\\\">31\\/3B \\u1ea4p Th\\u1edbi T\\u1ee9 1, X\\u00e3 \\u0110\\u00f4ng Th\\u1ea1nh, TP H\\u1ed3 Ch\\u00ed Minh<\\/a>, Vi\\u1ec7t Nam<br \\/>\\r\\n<strong>Hotline:<\\/strong> <span style=\\\"color:#e74c3c;\\\">0909 035 333<\\/span><br \\/>\\r\\n<strong>Website:<\\/strong>\\u00a0<a href=\\\"https:\\/\\/mimadigi.com\\\"><span style=\\\"color:#f39c12;\\\">https:\\/\\/<\\/span><\\/a><a href=\\\"https:\\/\\/mimadigi.com\\\"><span style=\\\"color:#f39c12;\\\">mimadigi.com<\\/span><\\/a><br \\/>\\r\\n<strong>Email:<\\/strong> info@mimadigi.com<br \\/>\\r\\n<a class=\\\"dmca-badge\\\" href=\\\"\\/\\/www.dmca.com\\/Protection\\/Status.aspx?ID=2f39ff2a-7db5-4e53-9bb6-15ee8957080c&amp;refurl=https:\\/\\/mimadigi.com\\/\\\" title=\\\"DMCA.com Protection Status\\\"><img alt=\\\"DMCA.com Protection Status\\\" src=\\\"https:\\/\\/images.dmca.com\\/Badges\\/dmca_protected_sml_120m.png?ID=5b6c8569-9906-4da5-b127-9ee16ae93ce9\\\" \\/><\\/a>\\u00a0<a href=\\\"http:\\/\\/online.gov.vn\\/Website\\/chi-tiet-134906\\\" target=\\\"_blank\\\"><img alt=\\\"B\\u1ed9 C\\u00f4ng Th\\u01b0\\u01a1ng MIMA\\\" src=\\\"https:\\/\\/mimadigi.com\\/upload\\/elfinder\\/Chinh-sach\\/bo-cong-thuong-mimadigi.png\\\" style=\\\"width: 80px; height: 23px;\\\" \\/><\\/a>\\u00a0<\\/p>\\r\\n<\\/div>\\r\\n\"}', '', '', '', 'Lorem Ipsum', 'name company', 'Số L22-23, đường N1, Khu phố 1, Phường Trấn Biên, Đồng Nai', 'address en', '', 'white', 'white', 'white', 'theme-default', '{&quot;web&quot;:{&quot;client_id&quot;:&quot;73170159106-vob1evfucmj33anoifp2h04r1lnm5npt.apps.googleusercontent.com&quot;,&quot;project_id&quot;:&quot;my-project-keyword-482516&quot;,&quot;auth_uri&quot;:&quot;https://accounts.google.com/o/oauth2/auth&quot;,&quot;token_uri&quot;:&quot;https://oauth2.googleapis.com/token&quot;,&quot;auth_provider_x509_cert_url&quot;:&quot;https://www.googleapis.com/oauth2/v1/certs&quot;,&quot;client_secret&quot;:&quot;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&quot;,&quot;redirect_uris&quot;:[&quot;https://phukiennoithatbep.com/madmin/api/gsc_auth.php&quot;],&quot;javascript_origins&quot;:[&quot;https://phukiennoithatbep.com&quot;]}}', '    &quot;access_token&quot;: &quot;ya29.a0Aa7pCA-n1Dv2UItM7tuUG_gu5wvKPydKljmGubnIsgxStmRG5R06Fu2rVJRAkFKGMvoxYK2reWroAN8JaRvsYPgpHOFINvI3UvgKke5AfMuqWjwsoZhMtJUL9XgNkMQRK_0Jwbc_EVyJNGUzWcjW_cB0OydFTn9GO7JMzuFOC8Gy3fH4H8jKAxYgd49ixUGtXy1xQHAaCgYKAZkSARISFQHGX2Mie4Mj9cesB7YLbMAcTtJL_w0206&quot;,\r\n', 'CÔNG TY TNHH CUNG ỨNG TẤT CẢ', '');

-- --------------------------------------------------------

--
-- Table structure for table `table_size`
--

CREATE TABLE `table_size` (
  `id` int UNSIGNED NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `table_static`
--

CREATE TABLE `table_static` (
  `id` int UNSIGNED NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugvi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenten` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_attach` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0',
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_static`
--

INSERT INTO `table_static` (`id`, `photo`, `photo1`, `options`, `slugvi`, `slugen`, `contenten`, `contentvi`, `descen`, `descvi`, `nameen`, `namevi`, `file_attach`, `type`, `status`, `date_created`, `date_updated`, `video`, `nameja`, `descja`, `contentja`, `slugja`, `link`) VALUES
(29, '', '', '', 'cong-ty-tnhh-cung-ung-noi-that-handi', '', '', '&lt;p&gt;Chi nhánh 2 Công ty TNHH Cung Ứng Nội Thất Hân Di - Mã số chi nhánh: 0315524871-002 - Ngày cấp: 24/11/2022 - Địa chỉ: 314 Trần Thị Năm, Khu phố 9, Phường Trung Mỹ Tây, Thành phố Hồ Chí Minh, Việt Nam - Người đại diện theo pháp luật: Ngô Kim Sang - Điện thoại: 0934004552&lt;/p&gt;\r\n', '', '&lt;p&gt;Chi nhánh 2 Công ty TNHH Cung Ứng Nội Thất Hân Di - Mã số chi nhánh: 0315524871-002 - Ngày cấp: 24/11/2022 - Địa chỉ: 314 Trần Thị Năm, Khu phố 9, Phường Trung Mỹ Tây, Thành phố Hồ Chí Minh, Việt Nam - Người đại diện theo pháp luật: Ngô Kim Sang - Điện thoại: 0934004552&lt;/p&gt;\r\n', '', 'CÔNG TY TNHH CUNG ỨNG  NỘI THẤT HANDI', '', 'footer', 'hienthi', 1777089455, 0, '', '', '', '', '', ''),
(30, '', '', '', 'copyright-2026web-mima-all-rights-reserved', '', '', '', '', '', '', 'Copyright ©2026 Web Mima. All Rights Reserved', '', 'copyright', 'hienthi', 1777090098, 1778292939, '', '', '', '', '', ''),
(31, 'group-1000005920-9986.png', '', '', 'phu-kien-noi-that-bep-ltspangthandiltspangt-kien-tao-khong-gian-bep-ly-tuong', '', '', '', '', '&lt;p&gt;Hân Di tự hào là đơn vị tiên phong mang đến các giải pháp tổng thể cho không gian bếp hiện đại. Chúng tôi không chỉ cung cấp phụ kiện phần cứng cao cấp mà còn trực tiếp tư vấn, thiết kế và thi công trọn gói nội thất bếp. Với sự am hiểu sâu sắc về nhân trắc học và thói quen sinh hoạt của người Việt, Hân Di cam kết tối ưu hóa công năng sử dụng, biến mọi góc nhỏ trong bếp trở nên thông minh, tinh tế và bền bỉ cùng thời gian.&lt;/p&gt;\r\n', '', 'Phụ Kiện Nội Thất Bếp &lt;span&gt;HanDi&lt;/span&gt; Kiến tạo không gian bếp lý tưởng', '', 'ly-tuong', 'hienthi', 1777132530, 0, '', '', '', '', '', ''),
(32, 'banner-6755.png', 'anhviber2025-07-1110-03-18-788-8451.png', '', 'lorem-ipsum-la-gi', '', '', '', '', '&lt;p&gt;&lt;strong&gt;Lorem Ipsum&lt;/strong&gt; chỉ đơn giản là một đoạn văn bản giả, được dùng vào việc trình bày và dàn trang phục vụ cho in ấn. Lorem Ipsum đã được sử dụng như một văn bản chuẩn cho ngành công nghiệp in ấn từ những năm 1500, khi một họa sĩ vô danh ghép nhiều đoạn văn bản với nhau để tạo thành một bản mẫu văn bản. Đoạn văn bản này không những đã tồn tại năm thế kỉ, mà khi được áp dụng vào tin học văn phòng, nội dung của nó vẫn không hề bị thay đổi. Nó đã được phổ biến trong những năm 1960 nhờ việc bán những bản giấy Letraset in những đoạn Lorem Ipsum, và gần đây hơn, được sử dụng trong các ứng dụng dàn trang, như Aldus PageMaker.&lt;/p&gt;\r\n', '', 'Lorem Ipsum là gì?', '', 'gioi-thieu', 'hienthi', 1777207113, 1778292376, '', '', '', '', '', ''),
(33, 'banner-tamnhin-7020.png', '', '', 'tam-nhin', '', '', '', '', '&lt;h3 data-end=&quot;207&quot; data-start=&quot;126&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;Dẫn đầu chuyển đổi số – Nâng tầm thương hiệu Việt&lt;/span&gt;&lt;/strong&gt;&lt;/h3&gt;\r\n\r\n&lt;p data-end=&quot;697&quot; data-start=&quot;209&quot;&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;MIMA Digi hướng đến trở thành thương hiệu Việt dẫn đầu trong lĩnh vực công nghệ số và marketing toàn diện, là biểu tượng sáng tạo trong thiết kế website và chuyển đổi số. Chúng tôi nỗ lực tạo dựng giá trị bền vững cho doanh nghiệp thông qua các giải pháp số hóa toàn diện, giúp doanh nghiệp Việt vươn tầm quốc tế.&lt;/span&gt;&lt;/p&gt;\r\n', '', 'Tầm Nhìn', '', 'tam-nhin', 'hienthi', 1778289512, 1778295228, '', '', '', '', '', ''),
(34, 'banner-3983.png', '', '', 'su-menh', '', '', '', '', '&lt;h3 data-end=&quot;172&quot; data-start=&quot;108&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px;&quot;&gt;Kiến tạo giải pháp số – Gia tăng giá trị bền vững&lt;/span&gt;&lt;/strong&gt;&lt;/h3&gt;\r\n\r\n&lt;p data-end=&quot;636&quot; data-start=&quot;174&quot;&gt;&lt;span style=&quot;font-size:16px;&quot;&gt;MIMA Digi không chỉ thiết kế website mà còn kiến tạo giải pháp số toàn diện, giúp doanh nghiệp vận hành, quảng bá và kinh doanh hiệu quả trong môi trường trực tuyến. Chúng tôi mang công nghệ đến gần hơn với doanh nghiệp Việt, bằng dịch vụ chuẩn SEO, marketing thông minh và hạ tầng số ổn định, hướng đến hiệu quả thực tế và giá trị lâu dài.&lt;/span&gt;&lt;/p&gt;\r\n', '', 'Sứ mệnh', '', 'su-menh', 'hienthi', 1778289534, 1778295506, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `table_tags`
--

CREATE TABLE `table_tags` (
  `id` int UNSIGNED NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugvi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slugen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contenten` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descen` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `descvi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `nameen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namevi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content1vi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content1en` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content2vi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content2en` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content3vi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content3en` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attributes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price_from` double NOT NULL DEFAULT '0',
  `price_to` double NOT NULL DEFAULT '0',
  `numb` int DEFAULT '0',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` int DEFAULT '0',
  `date_updated` int DEFAULT '0',
  `nameja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contentja` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slugja` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_tags`
--

INSERT INTO `table_tags` (`id`, `photo`, `options`, `slugvi`, `slugen`, `contenten`, `contentvi`, `descen`, `descvi`, `nameen`, `namevi`, `content1vi`, `content1en`, `content2vi`, `content2en`, `content3vi`, `content3en`, `attributes`, `price_from`, `price_to`, `numb`, `type`, `status`, `date_created`, `date_updated`, `nameja`, `descja`, `contentja`, `slugja`) VALUES
(25, '', '', 'thi-cong-lap-dat-tron-goi', '', '', '', '', '', '', 'Thi công lắp đặt trọn gói', '', '', '', '', '', '', 'null', 0, 0, 1, 'giai-phap', 'noibat,hienthi', 1777109829, 0, '', '', '', ''),
(23, '', '', 'tu-van-bo-tri-bep', '', '', '', '', '', '', 'Tư vấn bố trí bếp', '', '', '', '', '', '', 'null', 0, 0, 1, 'giai-phap', 'noibat,hienthi', 1777109817, 0, '', '', '', ''),
(24, '', '', 'thiet-ke-tu-bep', '', '', '', '', '', '', 'Thiết kế tủ bếp', '', '', '', '', '', '', 'null', 0, 0, 1, 'giai-phap', 'noibat,hienthi', 1777109823, 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `table_user`
--

CREATE TABLE `table_user` (
  `id` int UNSIGNED NOT NULL,
  `id_permission` int DEFAULT '0',
  `username` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_expired` datetime DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullname` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT '0',
  `login_session` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastlogin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` tinyint(1) DEFAULT '1',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` int DEFAULT '0',
  `numb` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_user`
--

INSERT INTO `table_user` (`id`, `id_permission`, `username`, `password`, `confirm_code`, `reset_code`, `reset_expired`, `avatar`, `fullname`, `phone`, `email`, `address`, `gender`, `login_session`, `user_token`, `lastlogin`, `status`, `role`, `secret_key`, `birthday`, `numb`) VALUES
(1, 0, 'admin', '6b7816453522498d1b03f81969ca87a9', '', '123113', '2025-09-13 15:55:05', 'mimaflast-6609.png', 'Administrator', '', 'hoahd98.mima@gmail.com', 'TPHCM', 1, 'cd3487c7e5db2ea970670677ea91baa0', 'cd3487c7e5db2ea970670677ea91baa0', '1778302859', 'hienthi', 3, 'cd3487c7e5db2ea970670677ea91baa0', 1608051600, 0);

-- --------------------------------------------------------

--
-- Table structure for table `table_user_limit`
--

CREATE TABLE `table_user_limit` (
  `id` int NOT NULL,
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_attempts` int NOT NULL,
  `attempt_time` int NOT NULL,
  `locked_time` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_user_limit`
--

INSERT INTO `table_user_limit` (`id`, `login_ip`, `login_attempts`, `attempt_time`, `locked_time`) VALUES
(1, '::1', 0, 1759738931, 0),
(2, '1.53.27.43', 0, 1776314066, 0);

-- --------------------------------------------------------

--
-- Table structure for table `table_user_log`
--

CREATE TABLE `table_user_log` (
  `id` int UNSIGNED NOT NULL,
  `id_user` int DEFAULT '0',
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0.0.0.0',
  `timelog` int DEFAULT '0',
  `user_agent` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_user_log`
--

INSERT INTO `table_user_log` (`id`, `id_user`, `ip`, `timelog`, `user_agent`) VALUES
(1, 1, '::1', 1759738974, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0'),
(2, 1, '::1', 1759739430, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0'),
(3, 1, '::1', 1759740240, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0'),
(4, 1, '::1', 1759741668, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0'),
(5, 1, '::1', 1761235307, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0'),
(6, 1, '::1', 1762937907, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0'),
(7, 1, '::1', 1774865805, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0'),
(8, 1, '::1', 1775872823, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0'),
(9, 1, '1.53.27.43', 1776249805, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0'),
(10, 1, '1.53.27.43', 1776307806, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(11, 1, '1.53.27.43', 1776314074, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0'),
(12, 1, '1.53.27.43', 1776319917, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(13, 1, '1.53.27.43', 1776328110, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(14, 1, '1.53.27.43', 1776332540, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(15, 1, '1.53.27.43', 1776408851, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(16, 1, '1.53.27.43', 1776409496, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(17, 1, '58.186.65.153', 1776477856, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(18, 1, '58.186.65.153', 1776479102, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(19, 1, '58.186.65.153', 1776479246, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(20, 1, '58.186.65.153', 1776484260, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(21, 1, '1.52.83.76', 1776655702, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(22, 1, '58.186.65.153', 1776658448, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(23, 1, '58.186.65.153', 1776757049, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(24, 1, '58.186.65.153', 1776757895, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(25, 1, '58.186.65.153', 1776758111, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(26, 1, '::1', 1777088558, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36'),
(27, 1, '::1', 1777690742, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `table_user_online`
--

CREATE TABLE `table_user_online` (
  `session` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` int DEFAULT '0',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_user_online`
--

INSERT INTO `table_user_online` (`session`, `time`, `ip`) VALUES
('2i6uuji4s74t0o8cjcg4np22ja', 1778302847, '::1');

-- --------------------------------------------------------

--
-- Table structure for table `table_ward`
--

CREATE TABLE `table_ward` (
  `id` int UNSIGNED NOT NULL,
  `id_city` int DEFAULT '0',
  `id_district` int DEFAULT '0',
  `districtid` int DEFAULT '0',
  `wardcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numb` int DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_updated` int DEFAULT '0',
  `date_created` int DEFAULT '0',
  `ship_price` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `table_ward`
--

INSERT INTO `table_ward` (`id`, `id_city`, `id_district`, `districtid`, `wardcode`, `name`, `slug`, `code`, `level`, `numb`, `status`, `date_updated`, `date_created`, `ship_price`) VALUES
(70, 1, 0, 0, 'phuong_hoan_kiem', 'Phường Hoàn Kiếm', 'phuong-hoan-kiem', '70', 'phường', 1, 'hienthi', 1759491404, 1759490174, 0),
(73, 1, 0, 0, 'phuong_cua_nam', 'Phường Cửa Nam', 'cua_nam', '73', 'phường', 2, 'hienthi', 0, 1759490174, NULL),
(4, 1, 0, 0, 'phuong_ba_dinh', 'Phường Ba Đình', 'ba_dinh', '4', 'phường', 3, 'hienthi', 0, 1759490174, NULL),
(8, 1, 0, 0, 'phuong_ngoc_ha', 'Phường Ngọc Hà', 'ngoc_ha', '8', 'phường', 4, 'hienthi', 0, 1759490174, NULL),
(25, 1, 0, 0, 'phuong_giang_vo', 'Phường Giảng Võ', 'giang_vo', '25', 'phường', 5, 'hienthi', 0, 1759490174, NULL),
(256, 1, 0, 0, 'phuong_hai_ba_trung', 'Phường Hai Bà Trưng', 'hai_ba_trung', '256', 'phường', 6, 'hienthi', 0, 1759490174, NULL),
(283, 1, 0, 0, 'phuong_vinh_tuy', 'Phường Vĩnh Tuy', 'vinh_tuy', '283', 'phường', 7, 'hienthi', 0, 1759490174, NULL),
(277, 1, 0, 0, 'phuong_bach_mai', 'Phường Bạch Mai', 'bach_mai', '277', 'phường', 8, 'hienthi', 0, 1759490174, NULL),
(235, 1, 0, 0, 'phuong_dong_da', 'Phường Đống Đa', 'dong_da', '235', 'phường', 9, 'hienthi', 0, 1759490174, NULL),
(226, 1, 0, 0, 'phuong_kim_lien', 'Phường Kim Liên', 'kim_lien', '226', 'phường', 10, 'hienthi', 0, 1759490174, NULL),
(196, 1, 0, 0, 'phuong_van_mieu_quoc_tu_giam', 'Phường Văn Miếu - Quốc Tử Giám', 'van_mieu_quoc_tu_giam', '196', 'phường', 11, 'hienthi', 0, 1759490174, NULL),
(187, 1, 0, 0, 'phuong_lang', 'Phường Láng', 'lang', '187', 'phường', 12, 'hienthi', 0, 1759490174, NULL),
(190, 1, 0, 0, 'phuong_o_cho_dua', 'Phường Ô Chợ Dừa', 'o_cho_dua', '190', 'phường', 13, 'hienthi', 0, 1759490174, NULL),
(97, 1, 0, 0, 'phuong_hong_ha', 'Phường Hồng Hà', 'hong_ha', '97', 'phường', 14, 'hienthi', 0, 1759490174, NULL),
(328, 1, 0, 0, 'phuong_linh_nam', 'Phường Lĩnh Nam', 'linh_nam', '328', 'phường', 15, 'hienthi', 0, 1759490174, NULL),
(319, 1, 0, 0, 'phuong_hoang_mai', 'Phường Hoàng Mai', 'hoang_mai', '319', 'phường', 16, 'hienthi', 0, 1759490174, NULL),
(304, 1, 0, 0, 'phuong_vinh_hung', 'Phường Vĩnh Hưng', 'vinh_hung', '304', 'phường', 17, 'hienthi', 0, 1759490174, NULL),
(313, 1, 0, 0, 'phuong_tuong_mai', 'Phường Tương Mai', 'tuong_mai', '313', 'phường', 18, 'hienthi', 0, 1759490174, NULL),
(316, 1, 0, 0, 'phuong_dinh_cong', 'Phường Định Công', 'dinh_cong', '316', 'phường', 19, 'hienthi', 0, 1759490174, NULL),
(337, 1, 0, 0, 'phuong_hoang_liet', 'Phường Hoàng Liệt', 'hoang_liet', '337', 'phường', 20, 'hienthi', 0, 1759490174, NULL),
(331, 1, 0, 0, 'phuong_yen_so', 'Phường Yên Sở', 'yen_so', '331', 'phường', 21, 'hienthi', 0, 1759490174, NULL),
(367, 1, 0, 0, 'phuong_thanh_xuan', 'Phường Thanh Xuân', 'thanh_xuan', '367', 'phường', 22, 'hienthi', 0, 1759490174, NULL),
(364, 1, 0, 0, 'phuong_khuong_dinh', 'Phường Khương Đình', 'khuong_dinh', '364', 'phường', 23, 'hienthi', 0, 1759490174, NULL),
(352, 1, 0, 0, 'phuong_phuong_liet', 'Phường Phương Liệt', 'phuong_liet', '352', 'phường', 24, 'hienthi', 0, 1759490174, NULL),
(167, 1, 0, 0, 'phuong_cau_giay', 'Phường Cầu Giấy', 'cau_giay', '167', 'phường', 25, 'hienthi', 0, 1759490174, NULL),
(160, 1, 0, 0, 'phuong_nghia_do', 'Phường Nghĩa Đô', 'nghia_do', '160', 'phường', 26, 'hienthi', 0, 1759490174, NULL),
(175, 1, 0, 0, 'phuong_yen_hoa', 'Phường Yên Hòa', 'yen_hoa', '175', 'phường', 27, 'hienthi', 0, 1759490174, NULL),
(103, 1, 0, 0, 'phuong_tay_ho', 'Phường Tây Hồ', 'tay_ho', '103', 'phường', 28, 'hienthi', 0, 1759490174, NULL),
(91, 1, 0, 0, 'phuong_phu_thuong', 'Phường Phú Thượng', 'phu_thuong', '91', 'phường', 29, 'hienthi', 0, 1759490174, NULL),
(613, 1, 0, 0, 'phuong_tay_tuu', 'Phường Tây Tựu', 'tay_tuu', '613', 'phường', 30, 'hienthi', 0, 1759490174, NULL),
(619, 1, 0, 0, 'phuong_phu_dien', 'Phường Phú Diễn', 'phu_dien', '619', 'phường', 31, 'hienthi', 0, 1759490174, NULL),
(611, 1, 0, 0, 'phuong_xuan_dinh', 'Phường Xuân Đỉnh', 'xuan_dinh', '611', 'phường', 32, 'hienthi', 0, 1759490174, NULL),
(602, 1, 0, 0, 'phuong_dong_ngac', 'Phường Đông Ngạc', 'dong_ngac', '602', 'phường', 33, 'hienthi', 0, 1759490174, NULL),
(598, 1, 0, 0, 'phuong_thuong_cat', 'Phường Thượng Cát', 'thuong_cat', '598', 'phường', 34, 'hienthi', 0, 1759490174, NULL),
(592, 1, 0, 0, 'phuong_tu_liem', 'Phường Từ Liêm', 'tu_liem', '592', 'phường', 35, 'hienthi', 0, 1759490174, NULL),
(622, 1, 0, 0, 'phuong_xuan_phuong', 'Phường Xuân Phương', 'xuan_phuong', '622', 'phường', 36, 'hienthi', 0, 1759490174, NULL),
(634, 1, 0, 0, 'phuong_tay_mo', 'Phường Tây Mỗ', 'tay_mo', '634', 'phường', 37, 'hienthi', 0, 1759490174, NULL),
(637, 1, 0, 0, 'phuong_dai_mo', 'Phường Đại Mỗ', 'dai_mo', '637', 'phường', 38, 'hienthi', 0, 1759490174, NULL),
(148, 1, 0, 0, 'phuong_long_bien', 'Phường Long Biên', 'long_bien', '148', 'phường', 39, 'hienthi', 0, 1759490174, NULL),
(130, 1, 0, 0, 'phuong_bo_de', 'Phường Bồ Đề', 'bo_de', '130', 'phường', 40, 'hienthi', 0, 1759490174, NULL),
(127, 1, 0, 0, 'phuong_viet_hung', 'Phường Việt Hưng', 'viet_hung', '127', 'phường', 41, 'hienthi', 0, 1759490174, NULL),
(136, 1, 0, 0, 'phuong_phuc_loi', 'Phường Phúc Lợi', 'phuc_loi', '136', 'phường', 42, 'hienthi', 0, 1759490174, NULL),
(9556, 1, 0, 0, 'phuong_ha_dong', 'Phường Hà Đông', 'ha_dong', '9556', 'phường', 43, 'hienthi', 0, 1759490174, NULL),
(9886, 1, 0, 0, 'phuong_duong_noi', 'Phường Dương Nội', 'duong_noi', '9886', 'phường', 44, 'hienthi', 0, 1759490174, NULL),
(9562, 1, 0, 0, 'phuong_yen_nghia', 'Phường Yên Nghĩa', 'yen_nghia', '9562', 'phường', 45, 'hienthi', 0, 1759490174, NULL),
(9568, 1, 0, 0, 'phuong_phu_luong', 'Phường Phú Lương', 'phu_luong', '9568', 'phường', 46, 'hienthi', 0, 1759490174, NULL),
(9552, 1, 0, 0, 'phuong_kien_hung', 'Phường Kiến Hưng', 'kien_hung', '9552', 'phường', 47, 'hienthi', 0, 1759490174, NULL),
(640, 1, 0, 0, 'xa_thanh_tri', 'Xã Thanh Trì', 'thanh_tri', '640', 'xã', 48, 'hienthi', 0, 1759490174, NULL),
(664, 1, 0, 0, 'xa_dai_thanh', 'Xã Đại Thanh', 'dai_thanh', '664', 'xã', 49, 'hienthi', 0, 1759490174, NULL),
(685, 1, 0, 0, 'xa_nam_phu', 'Xã Nam Phù', 'nam_phu', '685', 'xã', 50, 'hienthi', 0, 1759490174, NULL),
(679, 1, 0, 0, 'xa_ngoc_hoi', 'Xã Ngọc Hồi', 'ngoc_hoi', '679', 'xã', 51, 'hienthi', 0, 1759490174, NULL),
(646, 1, 0, 0, 'phuong_thanh_liet', 'Phường Thanh Liệt', 'thanh_liet', '646', 'phường', 52, 'hienthi', 0, 1759490174, NULL),
(10231, 1, 0, 0, 'xa_thuong_phuc', 'Xã Thượng Phúc', 'thuong_phuc', '10231', 'xã', 53, 'hienthi', 0, 1759490174, NULL),
(10183, 1, 0, 0, 'xa_thuong_tin', 'Xã Thường Tín', 'thuong_tin', '10183', 'xã', 54, 'hienthi', 0, 1759490174, NULL),
(10237, 1, 0, 0, 'xa_chuong_duong', 'Xã Chương Dương', 'chuong_duong', '10237', 'xã', 55, 'hienthi', 0, 1759490174, NULL),
(10210, 1, 0, 0, 'xa_hong_van', 'Xã Hồng Vân', 'hong_van', '10210', 'xã', 56, 'hienthi', 0, 1759490174, NULL),
(10273, 1, 0, 0, 'xa_phu_xuyen', 'Xã Phú Xuyên', 'phu_xuyen', '10273', 'xã', 57, 'hienthi', 0, 1759490174, NULL),
(10279, 1, 0, 0, 'xa_phuong_duc', 'Xã Phượng Dực', 'duc', '10279', 'xã', 58, 'hienthi', 0, 1759490174, NULL),
(10330, 1, 0, 0, 'xa_chuyen_my', 'Xã Chuyên Mỹ', 'chuyen_my', '10330', 'xã', 59, 'hienthi', 0, 1759490174, NULL),
(10333, 1, 0, 0, 'xa_dai_xuyen', 'Xã Đại Xuyên', 'dai_xuyen', '10333', 'xã', 60, 'hienthi', 0, 1759490174, NULL),
(10114, 1, 0, 0, 'xa_thanh_oai', 'Xã Thanh Oai', 'thanh_oai', '10114', 'xã', 61, 'hienthi', 0, 1759490174, NULL),
(10141, 1, 0, 0, 'xa_binh_minh', 'Xã Bình Minh', 'binh_minh', '10141', 'xã', 62, 'hienthi', 0, 1759490174, NULL),
(10144, 1, 0, 0, 'xa_tam_hung', 'Xã Tam Hưng', 'tam_hung', '10144', 'xã', 63, 'hienthi', 0, 1759490174, NULL),
(10180, 1, 0, 0, 'xa_dan_hoa', 'Xã Dân Hòa', 'dan_hoa', '10180', 'xã', 64, 'hienthi', 0, 1759490174, NULL),
(10354, 1, 0, 0, 'xa_van_dinh', 'Xã Vân Đình', 'van_dinh', '10354', 'xã', 65, 'hienthi', 0, 1759490174, NULL),
(10369, 1, 0, 0, 'xa_ung_thien', 'Xã Ứng Thiên', 'ung_thien', '10369', 'xã', 66, 'hienthi', 0, 1759490174, NULL),
(10417, 1, 0, 0, 'xa_hoa_xa', 'Xã Hòa Xá', 'hoa_xa', '10417', 'xã', 67, 'hienthi', 0, 1759490174, NULL),
(10402, 1, 0, 0, 'xa_ung_hoa', 'Xã Ứng Hòa', 'ung_hoa', '10402', 'xã', 68, 'hienthi', 0, 1759490174, NULL),
(10441, 1, 0, 0, 'xa_my_duc', 'Xã Mỹ Đức', 'my_duc', '10441', 'xã', 69, 'hienthi', 0, 1759490174, NULL),
(10465, 1, 0, 0, 'xa_hong_son', 'Xã Hồng Sơn', 'hong_son', '10465', 'xã', 70, 'hienthi', 0, 1759490174, NULL),
(10459, 1, 0, 0, 'xa_phuc_son', 'Xã Phúc Sơn', 'phuc_son', '10459', 'xã', 71, 'hienthi', 0, 1759490174, NULL),
(10489, 1, 0, 0, 'xa_huong_son', 'Xã Hương Sơn', 'huong_son', '10489', 'xã', 72, 'hienthi', 0, 1759490174, NULL),
(10015, 1, 0, 0, 'phuong_chuong_my', 'Phường Chương Mỹ', 'chuong_my', '10015', 'phường', 73, 'hienthi', 0, 1759490174, NULL),
(10030, 1, 0, 0, 'xa_phu_nghia', 'Xã Phú Nghĩa', 'phu_nghia', '10030', 'xã', 74, 'hienthi', 0, 1759490174, NULL),
(10018, 1, 0, 0, 'xa_xuan_mai', 'Xã Xuân Mai', 'xuan_mai', '10018', 'xã', 75, 'hienthi', 0, 1759490174, NULL),
(10081, 1, 0, 0, 'xa_tran_phu', 'Xã Trần Phú', 'tran_phu', '10081', 'xã', 76, 'hienthi', 0, 1759490174, NULL),
(10108, 1, 0, 0, 'xa_hoa_phu', 'Xã Hòa Phú', 'hoa_phu', '10108', 'xã', 77, 'hienthi', 0, 1759490174, NULL),
(10084, 1, 0, 0, 'xa_quang_bi', 'Xã Quảng Bị', 'quang_bi', '10084', 'xã', 78, 'hienthi', 0, 1759490174, NULL),
(9661, 1, 0, 0, 'xa_minh_chau', 'Xã Minh Châu', 'minh_chau', '9661', 'xã', 79, 'hienthi', 0, 1759490174, NULL),
(9619, 1, 0, 0, 'xa_quang_oai', 'Xã Quảng Oai', 'quang_oai', '9619', 'xã', 80, 'hienthi', 0, 1759490174, NULL),
(9664, 1, 0, 0, 'xa_vat_lai', 'Xã Vật Lại', 'vat_lai', '9664', 'xã', 81, 'hienthi', 0, 1759490174, NULL),
(9634, 1, 0, 0, 'xa_co_do', 'Xã Cổ Đô', 'co_do', '9634', 'xã', 82, 'hienthi', 0, 1759490174, NULL),
(9676, 1, 0, 0, 'xa_bat_bat', 'Xã Bất Bạt', 'bat_bat', '9676', 'xã', 83, 'hienthi', 0, 1759490174, NULL),
(9694, 1, 0, 0, 'xa_suoi_hai', 'Xã Suối Hai', 'suoi_hai', '9694', 'xã', 84, 'hienthi', 0, 1759490174, NULL),
(9700, 1, 0, 0, 'xa_ba_vi', 'Xã Ba Vì', 'ba_vi', '9700', 'xã', 85, 'hienthi', 0, 1759490174, NULL),
(9706, 1, 0, 0, 'xa_yen_bai', 'Xã Yên Bài', 'yen_bai', '9706', 'xã', 86, 'hienthi', 0, 1759490174, NULL),
(9574, 1, 0, 0, 'phuong_son_tay', 'Phường Sơn Tây', 'son_tay', '9574', 'phường', 87, 'hienthi', 0, 1759490174, NULL),
(9604, 1, 0, 0, 'phuong_tung_thien', 'Phường Tùng Thiện', 'tung_thien', '9604', 'phường', 88, 'hienthi', 0, 1759490174, NULL),
(9616, 1, 0, 0, 'xa_doai_phuong', 'Xã Đoài Phương', 'doai_phuong', '9616', 'xã', 89, 'hienthi', 0, 1759490174, NULL),
(9715, 1, 0, 0, 'xa_phuc_tho', 'Xã Phúc Thọ', 'phuc_tho', '9715', 'xã', 90, 'hienthi', 0, 1759490174, NULL),
(9739, 1, 0, 0, 'xa_phuc_loc', 'Xã Phúc Lộc', 'phuc_loc', '9739', 'xã', 91, 'hienthi', 0, 1759490174, NULL),
(9772, 1, 0, 0, 'xa_hat_mon', 'Xã Hát Môn', 'hat_mon', '9772', 'xã', 92, 'hienthi', 0, 1759490174, NULL),
(9955, 1, 0, 0, 'xa_thach_that', 'Xã Thạch Thất', 'thach_that', '9955', 'xã', 93, 'hienthi', 0, 1759490174, NULL),
(10009, 1, 0, 0, 'xa_ha_bang', 'Xã Hạ Bằng', 'ha_bang', '10009', 'xã', 94, 'hienthi', 0, 1759490174, NULL),
(10006, 1, 0, 0, 'xa_tay_phuong', 'Xã Tây Phương', 'tay_phuong', '10006', 'xã', 95, 'hienthi', 0, 1759490174, NULL),
(9988, 1, 0, 0, 'xa_hoa_lac', 'Xã Hòa Lạc', 'hoa_lac', '9988', 'xã', 96, 'hienthi', 0, 1759490174, NULL),
(4936, 1, 0, 0, 'xa_yen_xuan', 'Xã Yên Xuân', 'yen_xuan', '4936', 'xã', 97, 'hienthi', 0, 1759490174, NULL),
(9895, 1, 0, 0, 'xa_quoc_oai', 'Xã Quốc Oai', 'quoc_oai', '9895', 'xã', 98, 'hienthi', 0, 1759490174, NULL),
(9931, 1, 0, 0, 'xa_hung_dao', 'Xã Hưng Đạo', 'hung_dao', '9931', 'xã', 99, 'hienthi', 0, 1759490174, NULL),
(9928, 1, 0, 0, 'xa_kieu_phu', 'Xã Kiều Phú', 'kieu_phu', '9928', 'xã', 100, 'hienthi', 0, 1759490174, NULL),
(9922, 1, 0, 0, 'xa_phu_cat', 'Xã Phú Cát', 'phu_cat', '9922', 'xã', 101, 'hienthi', 0, 1759490174, NULL),
(9832, 1, 0, 0, 'xa_hoai_duc', 'Xã Hoài Đức', 'hoai_duc', '9832', 'xã', 102, 'hienthi', 0, 1759490174, NULL),
(9838, 1, 0, 0, 'xa_duong_hoa', 'Xã Dương Hòa', 'duong_hoa', '9838', 'xã', 103, 'hienthi', 0, 1759490174, NULL),
(9859, 1, 0, 0, 'xa_son_dong', 'Xã Sơn Đồng', 'son_dong', '9859', 'xã', 104, 'hienthi', 0, 1759490174, NULL),
(9877, 1, 0, 0, 'xa_an_khanh', 'Xã An Khánh', 'an_khanh', '9877', 'xã', 105, 'hienthi', 0, 1759490174, NULL),
(9784, 1, 0, 0, 'xa_dan_phuong', 'Xã Đan Phượng', 'dan_phuong', '9784', 'xã', 106, 'hienthi', 0, 1759490174, NULL),
(9817, 1, 0, 0, 'xa_o_dien', 'Xã Ô Diên', 'o_dien', '9817', 'xã', 107, 'hienthi', 0, 1759490174, NULL),
(9793, 1, 0, 0, 'xa_lien_minh', 'Xã Liên Minh', 'lien_minh', '9793', 'xã', 108, 'hienthi', 0, 1759490174, NULL),
(565, 1, 0, 0, 'xa_gia_lam', 'Xã Gia Lâm', 'gia_lam', '565', 'xã', 109, 'hienthi', 0, 1759490174, NULL),
(562, 1, 0, 0, 'xa_thuan_an', 'Xã Thuận An', 'thuan_an', '562', 'xã', 110, 'hienthi', 0, 1759490174, NULL),
(583, 1, 0, 0, 'xa_bat_trang', 'Xã Bát Tràng', 'bat_trang', '583', 'xã', 111, 'hienthi', 0, 1759490174, NULL),
(541, 1, 0, 0, 'xa_phu_dong', 'Xã Phù Đổng', 'phu_dong', '541', 'xã', 112, 'hienthi', 0, 1759490174, NULL),
(484, 1, 0, 0, 'xa_thu_lam', 'Xã Thư Lâm', 'thu_lam', '484', 'xã', 113, 'hienthi', 0, 1759490174, NULL),
(454, 1, 0, 0, 'xa_dong_anh', 'Xã Đông Anh', 'dong_anh', '454', 'xã', 114, 'hienthi', 0, 1759490174, NULL),
(466, 1, 0, 0, 'xa_phuc_thinh', 'Xã Phúc Thịnh', 'phuc_thinh', '466', 'xã', 115, 'hienthi', 0, 1759490174, NULL),
(493, 1, 0, 0, 'xa_thien_loc', 'Xã Thiên Lộc', 'thien_loc', '493', 'xã', 116, 'hienthi', 0, 1759490174, NULL),
(508, 1, 0, 0, 'xa_vinh_thanh', 'Xã Vĩnh Thanh', 'vinh_thanh', '508', 'xã', 117, 'hienthi', 0, 1759490174, NULL),
(9022, 1, 0, 0, 'xa_me_linh', 'Xã Mê Linh', 'me_linh', '9022', 'xã', 118, 'hienthi', 0, 1759490174, NULL),
(8980, 1, 0, 0, 'xa_yen_lang', 'Xã Yên Lãng', 'yen_lang', '8980', 'xã', 119, 'hienthi', 0, 1759490174, NULL),
(8995, 1, 0, 0, 'xa_tien_thang', 'Xã Tiến Thắng', 'tien_thang', '8995', 'xã', 120, 'hienthi', 0, 1759490174, NULL),
(8974, 1, 0, 0, 'xa_quang_minh', 'Xã Quang Minh', 'quang_minh', '8974', 'xã', 121, 'hienthi', 0, 1759490174, NULL),
(376, 1, 0, 0, 'xa_soc_son', 'Xã Sóc Sơn', 'soc_son', '376', 'xã', 122, 'hienthi', 0, 1759490174, NULL),
(424, 1, 0, 0, 'xa_da_phuc', 'Xã Đa Phúc', 'da_phuc', '424', 'xã', 123, 'hienthi', 0, 1759490174, NULL),
(433, 1, 0, 0, 'xa_noi_bai', 'Xã Nội Bài', 'noi_bai', '433', 'xã', 124, 'hienthi', 0, 1759490174, NULL),
(385, 1, 0, 0, 'xa_trung_gia', 'Xã Trung Giã', 'trung_gia', '385', 'xã', 125, 'hienthi', 0, 1759490174, NULL),
(382, 1, 0, 0, 'xa_kim_anh', 'Xã Kim Anh', 'kim_anh', '382', 'xã', 126, 'hienthi', 0, 1759490174, NULL),
(1273, 4, 0, 0, 'phuong_thuc_phan', 'Phường Thục Phán', 'thuc_phan', '1273', 'phường', 127, 'hienthi', 0, 1759490174, NULL),
(1279, 4, 0, 0, 'phuong_nung_tri_cao', 'Phường Nùng Trí Cao', 'nung_tri_cao', '1279', 'phường', 128, 'hienthi', 0, 1759490174, NULL),
(1288, 4, 0, 0, 'phuong_tan_giang', 'Phường Tân Giang', 'tan_giang', '1288', 'phường', 129, 'hienthi', 0, 1759490174, NULL),
(1304, 4, 0, 0, 'xa_quang_lam', 'Xã Quảng Lâm', 'quang_lam', '1304', 'xã', 130, 'hienthi', 0, 1759490174, NULL),
(1297, 4, 0, 0, 'xa_nam_quang', 'Xã Nam Quang', 'nam_quang', '1297', 'xã', 131, 'hienthi', 0, 1759490174, NULL),
(1294, 4, 0, 0, 'xa_ly_bon', 'Xã Lý Bôn', 'ly_bon', '1294', 'xã', 132, 'hienthi', 0, 1759490174, NULL),
(1290, 4, 0, 0, 'xa_bao_lam', 'Xã Bảo Lâm', 'bao_lam', '1290', 'xã', 133, 'hienthi', 0, 1759490174, NULL),
(1318, 4, 0, 0, 'xa_yen_tho', 'Xã Yên Thổ', 'yen_tho', '1318', 'xã', 134, 'hienthi', 0, 1759490174, NULL),
(1360, 4, 0, 0, 'xa_son_lo', 'Xã Sơn Lộ', 'son_lo', '1360', 'xã', 135, 'hienthi', 0, 1759490174, NULL),
(1351, 4, 0, 0, 'xa_hung_dao', 'Xã Hưng Đạo', 'hung_dao', '1351', 'xã', 136, 'hienthi', 0, 1759490174, NULL),
(1321, 4, 0, 0, 'xa_bao_lac', 'Xã Bảo Lạc', 'bao_lac', '1321', 'xã', 137, 'hienthi', 0, 1759490174, NULL),
(1324, 4, 0, 0, 'xa_coc_pang', 'Xã Cốc Pàng', 'coc_pang', '1324', 'xã', 138, 'hienthi', 0, 1759490174, NULL),
(1327, 4, 0, 0, 'xa_co_ba', 'Xã Cô Ba', 'co_ba', '1327', 'xã', 139, 'hienthi', 0, 1759490174, NULL),
(1336, 4, 0, 0, 'xa_khanh_xuan', 'Xã Khánh Xuân', 'khanh_xuan', '1336', 'xã', 140, 'hienthi', 0, 1759490174, NULL),
(1339, 4, 0, 0, 'xa_xuan_truong', 'Xã Xuân Trường', 'xuan_truong', '1339', 'xã', 141, 'hienthi', 0, 1759490174, NULL),
(1354, 4, 0, 0, 'xa_huy_giap', 'Xã Huy Giáp', 'huy_giap', '1354', 'xã', 142, 'hienthi', 0, 1759490174, NULL),
(1738, 4, 0, 0, 'xa_ca_thanh', 'Xã Ca Thành', 'ca_thanh', '1738', 'xã', 143, 'hienthi', 0, 1759490174, NULL),
(1768, 4, 0, 0, 'xa_phan_thanh', 'Xã Phan Thanh', 'phan_thanh', '1768', 'xã', 144, 'hienthi', 0, 1759490174, NULL),
(1777, 4, 0, 0, 'xa_thanh_cong', 'Xã Thành Công', 'thanh_cong', '1777', 'xã', 145, 'hienthi', 0, 1759490174, NULL),
(1729, 4, 0, 0, 'xa_tinh_tuc', 'Xã Tĩnh Túc', 'tinh_tuc', '1729', 'xã', 146, 'hienthi', 0, 1759490174, NULL),
(1774, 4, 0, 0, 'xa_tam_kim', 'Xã Tam Kim', 'tam_kim', '1774', 'xã', 147, 'hienthi', 0, 1759490174, NULL),
(1726, 4, 0, 0, 'xa_nguyen_binh', 'Xã Nguyên Bình', 'nguyen_binh', '1726', 'xã', 148, 'hienthi', 0, 1759490174, NULL),
(1747, 4, 0, 0, 'xa_minh_tam', 'Xã Minh Tâm', 'minh_tam', '1747', 'xã', 149, 'hienthi', 0, 1759490174, NULL),
(1387, 4, 0, 0, 'xa_thanh_long', 'Xã Thanh Long', 'thanh_long', '1387', 'xã', 150, 'hienthi', 0, 1759490174, NULL),
(1366, 4, 0, 0, 'xa_can_yen', 'Xã Cần Yên', 'can_yen', '1366', 'xã', 151, 'hienthi', 0, 1759490174, NULL),
(1363, 4, 0, 0, 'xa_thong_nong', 'Xã Thông Nông', 'thong_nong', '1363', 'xã', 152, 'hienthi', 0, 1759490174, NULL),
(1392, 4, 0, 0, 'xa_truong_ha', 'Xã Trường Hà', 'truong_ha', '1392', 'xã', 153, 'hienthi', 0, 1759490174, NULL),
(1438, 4, 0, 0, 'xa_ha_quang', 'Xã Hà Quảng', 'ha_quang', '1438', 'xã', 154, 'hienthi', 0, 1759490174, NULL),
(1393, 4, 0, 0, 'xa_lung_nam', 'Xã Lũng Nặm', 'lung_nam', '1393', 'xã', 155, 'hienthi', 0, 1759490174, NULL),
(1414, 4, 0, 0, 'xa_tong_cot', 'Xã Tổng Cọt', 'tong_cot', '1414', 'xã', 156, 'hienthi', 0, 1759490174, NULL),
(1660, 4, 0, 0, 'xa_nam_tuan', 'Xã Nam Tuấn', 'nam_tuan', '1660', 'xã', 157, 'hienthi', 0, 1759490174, NULL),
(1654, 4, 0, 0, 'xa_hoa_an', 'Xã Hòa An', 'hoa_an', '1654', 'xã', 158, 'hienthi', 0, 1759490174, NULL),
(1708, 4, 0, 0, 'xa_bach_dang', 'Xã Bạch Đằng', 'bach_dang', '1708', 'xã', 159, 'hienthi', 0, 1759490174, NULL),
(1699, 4, 0, 0, 'xa_nguyen_hue', 'Xã Nguyễn Huệ', 'nguyen_hue', '1699', 'xã', 160, 'hienthi', 0, 1759490174, NULL),
(1795, 4, 0, 0, 'xa_minh_khai', 'Xã Minh Khai', 'minh_khai', '1795', 'xã', 161, 'hienthi', 0, 1759490174, NULL),
(1789, 4, 0, 0, 'xa_canh_tan', 'Xã Canh Tân', 'canh_tan', '1789', 'xã', 162, 'hienthi', 0, 1759490174, NULL),
(1792, 4, 0, 0, 'xa_kim_dong', 'Xã Kim Đồng', 'kim_dong', '1792', 'xã', 163, 'hienthi', 0, 1759490174, NULL),
(1807, 4, 0, 0, 'xa_thach_an', 'Xã Thạch An', 'thach_an', '1807', 'xã', 164, 'hienthi', 0, 1759490174, NULL),
(1786, 4, 0, 0, 'xa_dong_khe', 'Xã Đông Khê', 'dong_khe', '1786', 'xã', 165, 'hienthi', 0, 1759490174, NULL),
(1822, 4, 0, 0, 'xa_duc_long', 'Xã Đức Long', 'duc_long', '1822', 'xã', 166, 'hienthi', 0, 1759490174, NULL),
(1648, 4, 0, 0, 'xa_phuc_hoa', 'Xã Phục Hòa', 'phuc_hoa', '1648', 'xã', 167, 'hienthi', 0, 1759490174, NULL),
(1636, 4, 0, 0, 'xa_be_van_dan', 'Xã Bế Văn Đàn', 'be_van_dan', '1636', 'xã', 168, 'hienthi', 0, 1759490174, NULL),
(1594, 4, 0, 0, 'xa_doc_lap', 'Xã Độc Lập', 'doc_lap', '1594', 'xã', 169, 'hienthi', 0, 1759490174, NULL),
(1576, 4, 0, 0, 'xa_quang_uyen', 'Xã Quảng Uyên', 'quang_uyen', '1576', 'xã', 170, 'hienthi', 0, 1759490174, NULL),
(1618, 4, 0, 0, 'xa_hanh_phuc', 'Xã Hạnh Phúc', 'hanh_phuc', '1618', 'xã', 171, 'hienthi', 0, 1759490174, NULL),
(1456, 4, 0, 0, 'xa_quang_han', 'Xã Quang Hán', 'quang_han', '1456', 'xã', 172, 'hienthi', 0, 1759490174, NULL),
(1447, 4, 0, 0, 'xa_tra_linh', 'Xã Trà Lĩnh', 'tra_linh', '1447', 'xã', 173, 'hienthi', 0, 1759490174, NULL),
(1465, 4, 0, 0, 'xa_quang_trung', 'Xã Quang Trung', 'quang_trung', '1465', 'xã', 174, 'hienthi', 0, 1759490174, NULL),
(1525, 4, 0, 0, 'xa_doai_duong', 'Xã Đoài Dương', 'doai_duong', '1525', 'xã', 175, 'hienthi', 0, 1759490174, NULL),
(1477, 4, 0, 0, 'xa_trung_khanh', 'Xã Trùng Khánh', 'trung_khanh', '1477', 'xã', 176, 'hienthi', 0, 1759490174, NULL),
(1501, 4, 0, 0, 'xa_dam_thuy', 'Xã Đàm Thuỷ', 'dam_thuy', '1501', 'xã', 177, 'hienthi', 0, 1759490174, NULL),
(1489, 4, 0, 0, 'xa_dinh_phong', 'Xã Đình Phong', 'dinh_phong', '1489', 'xã', 178, 'hienthi', 0, 1759490174, NULL),
(1558, 4, 0, 0, 'xa_ly_quoc', 'Xã Lý Quốc', 'ly_quoc', '1558', 'xã', 179, 'hienthi', 0, 1759490174, NULL),
(1561, 4, 0, 0, 'xa_ha_lang', 'Xã Hạ Lang', 'ha_lang', '1561', 'xã', 180, 'hienthi', 0, 1759490174, NULL),
(1537, 4, 0, 0, 'xa_vinh_quy', 'Xã Vinh Quý', 'vinh_quy', '1537', 'xã', 181, 'hienthi', 0, 1759490174, NULL),
(1552, 4, 0, 0, 'xa_quang_long', 'Xã Quang Long', 'quang_long', '1552', 'xã', 182, 'hienthi', 0, 1759490174, NULL),
(2269, 8, 0, 0, 'xa_thuong_lam', 'Xã Thượng Lâm', 'thuong_lam', '2269', 'xã', 183, 'hienthi', 0, 1759490174, NULL),
(2266, 8, 0, 0, 'xa_lam_binh', 'Xã Lâm Bình', 'lam_binh', '2266', 'xã', 184, 'hienthi', 0, 1759490174, NULL),
(2302, 8, 0, 0, 'xa_minh_quang', 'Xã Minh Quang', 'minh_quang', '2302', 'xã', 185, 'hienthi', 0, 1759490174, NULL),
(2296, 8, 0, 0, 'xa_binh_an', 'Xã Bình An', 'binh_an', '2296', 'xã', 186, 'hienthi', 0, 1759490174, NULL),
(2245, 8, 0, 0, 'xa_con_lon', 'Xã Côn Lôn', 'con_lon', '2245', 'xã', 187, 'hienthi', 0, 1759490174, NULL),
(2248, 8, 0, 0, 'xa_yen_hoa', 'Xã Yên Hoa', 'yen_hoa', '2248', 'xã', 188, 'hienthi', 0, 1759490174, NULL),
(2239, 8, 0, 0, 'xa_thuong_nong', 'Xã Thượng Nông', 'thuong_nong', '2239', 'xã', 189, 'hienthi', 0, 1759490174, NULL),
(2260, 8, 0, 0, 'xa_hong_thai', 'Xã Hồng Thái', 'hong_thai', '2260', 'xã', 190, 'hienthi', 0, 1759490174, NULL),
(2221, 8, 0, 0, 'xa_na_hang', 'Xã Nà Hang', 'na_hang', '2221', 'xã', 191, 'hienthi', 0, 1759490174, NULL),
(2308, 8, 0, 0, 'xa_tan_my', 'Xã Tân Mỹ', 'tan_my', '2308', 'xã', 192, 'hienthi', 0, 1759490174, NULL),
(2317, 8, 0, 0, 'xa_yen_lap', 'Xã Yên Lập', 'yen_lap', '2317', 'xã', 193, 'hienthi', 0, 1759490174, NULL),
(2320, 8, 0, 0, 'xa_tan_an', 'Xã Tân An', 'tan_an', '2320', 'xã', 194, 'hienthi', 0, 1759490174, NULL),
(2287, 8, 0, 0, 'xa_chiem_hoa', 'Xã Chiêm Hoá', 'chiem_hoa', '2287', 'xã', 195, 'hienthi', 0, 1759490174, NULL),
(2353, 8, 0, 0, 'xa_hoa_an', 'Xã Hoà An', 'hoa_an', '2353', 'xã', 196, 'hienthi', 0, 1759490174, NULL),
(2332, 8, 0, 0, 'xa_kien_dai', 'Xã Kiên Đài', 'kien_dai', '2332', 'xã', 197, 'hienthi', 0, 1759490174, NULL),
(2359, 8, 0, 0, 'xa_tri_phu', 'Xã Tri Phú', 'tri_phu', '2359', 'xã', 198, 'hienthi', 0, 1759490174, NULL),
(2350, 8, 0, 0, 'xa_kim_binh', 'Xã Kim Bình', 'kim_binh', '2350', 'xã', 199, 'hienthi', 0, 1759490174, NULL),
(2365, 8, 0, 0, 'xa_yen_nguyen', 'Xã Yên Nguyên', 'yen_nguyen', '2365', 'xã', 200, 'hienthi', 0, 1759490174, NULL),
(2305, 8, 0, 0, 'xa_trung_ha', 'Xã Trung Hà', 'trung_ha', '2305', 'xã', 201, 'hienthi', 0, 1759490174, NULL),
(2398, 8, 0, 0, 'xa_yen_phu', 'Xã Yên Phú', 'yen_phu', '2398', 'xã', 202, 'hienthi', 0, 1759490174, NULL),
(2380, 8, 0, 0, 'xa_bach_xa', 'Xã Bạch Xa', 'bach_xa', '2380', 'xã', 203, 'hienthi', 0, 1759490174, NULL),
(2392, 8, 0, 0, 'xa_phu_luu', 'Xã Phù Lưu', 'phu_luu', '2392', 'xã', 204, 'hienthi', 0, 1759490174, NULL),
(2374, 8, 0, 0, 'xa_ham_yen', 'Xã Hàm Yên', 'ham_yen', '2374', 'xã', 205, 'hienthi', 0, 1759490174, NULL),
(2404, 8, 0, 0, 'xa_binh_xa', 'Xã Bình Xa', 'binh_xa', '2404', 'xã', 206, 'hienthi', 0, 1759490174, NULL),
(2407, 8, 0, 0, 'xa_thai_son', 'Xã Thái Sơn', 'thai_son', '2407', 'xã', 207, 'hienthi', 0, 1759490174, NULL),
(2419, 8, 0, 0, 'xa_thai_hoa', 'Xã Thái Hoà', 'thai_hoa', '2419', 'xã', 208, 'hienthi', 0, 1759490174, NULL),
(2425, 8, 0, 0, 'xa_hung_duc', 'Xã Hùng Đức', 'hung_duc', '2425', 'xã', 209, 'hienthi', 0, 1759490174, NULL),
(2455, 8, 0, 0, 'xa_hung_loi', 'Xã Hùng Lợi', 'hung_loi', '2455', 'xã', 210, 'hienthi', 0, 1759490174, NULL),
(2458, 8, 0, 0, 'xa_trung_son', 'Xã Trung Sơn', 'trung_son', '2458', 'xã', 211, 'hienthi', 0, 1759490174, NULL),
(2494, 8, 0, 0, 'xa_thai_binh', 'Xã Thái Bình', 'thai_binh', '2494', 'xã', 212, 'hienthi', 0, 1759490174, NULL),
(2470, 8, 0, 0, 'xa_tan_long', 'Xã Tân Long', 'tan_long', '2470', 'xã', 213, 'hienthi', 0, 1759490174, NULL),
(2449, 8, 0, 0, 'xa_xuan_van', 'Xã Xuân Vân', 'xuan_van', '2449', 'xã', 214, 'hienthi', 0, 1759490174, NULL),
(2434, 8, 0, 0, 'xa_luc_hanh', 'Xã Lực Hành', 'luc_hanh', '2434', 'xã', 215, 'hienthi', 0, 1759490174, NULL),
(2473, 8, 0, 0, 'xa_yen_son', 'Xã Yên Sơn', 'yen_son', '2473', 'xã', 216, 'hienthi', 0, 1759490174, NULL),
(2530, 8, 0, 0, 'xa_nhu_khe', 'Xã Nhữ Khê', 'nhu_khe', '2530', 'xã', 217, 'hienthi', 0, 1759490174, NULL),
(2437, 8, 0, 0, 'xa_kien_thiet', 'Xã Kiến Thiết', 'kien_thiet', '2437', 'xã', 218, 'hienthi', 0, 1759490174, NULL),
(2545, 8, 0, 0, 'xa_tan_trao', 'Xã Tân Trào', 'tan_trao', '2545', 'xã', 219, 'hienthi', 0, 1759490174, NULL),
(2554, 8, 0, 0, 'xa_minh_thanh', 'Xã Minh Thanh', 'minh_thanh', '2554', 'xã', 220, 'hienthi', 0, 1759490174, NULL),
(2536, 8, 0, 0, 'xa_son_duong', 'Xã Sơn Dương', 'son_duong', '2536', 'xã', 221, 'hienthi', 0, 1759490174, NULL),
(2548, 8, 0, 0, 'xa_binh_ca', 'Xã Bình Ca', 'binh_ca', '2548', 'xã', 222, 'hienthi', 0, 1759490174, NULL),
(2578, 8, 0, 0, 'xa_tan_thanh', 'Xã Tân Thanh', 'tan_thanh', '2578', 'xã', 223, 'hienthi', 0, 1759490174, NULL),
(2620, 8, 0, 0, 'xa_son_thuy', 'Xã Sơn Thuỷ', 'son_thuy', '2620', 'xã', 224, 'hienthi', 0, 1759490174, NULL),
(2611, 8, 0, 0, 'xa_phu_luong', 'Xã Phú Lương', 'phu_luong', '2611', 'xã', 225, 'hienthi', 0, 1759490174, NULL),
(2623, 8, 0, 0, 'xa_truong_sinh', 'Xã Trường Sinh', 'truong_sinh', '2623', 'xã', 226, 'hienthi', 0, 1759490174, NULL),
(2608, 8, 0, 0, 'xa_hong_son', 'Xã Hồng Sơn', 'hong_son', '2608', 'xã', 227, 'hienthi', 0, 1759490174, NULL),
(2572, 8, 0, 0, 'xa_dong_tho', 'Xã Đông Thọ', 'dong_tho', '2572', 'xã', 228, 'hienthi', 0, 1759490174, NULL),
(2509, 8, 0, 0, 'phuong_my_lam', 'Phường Mỹ Lâm', 'my_lam', '2509', 'phường', 229, 'hienthi', 0, 1759490174, NULL),
(2215, 8, 0, 0, 'phuong_minh_xuan', 'Phường Minh Xuân', 'minh_xuan', '2215', 'phường', 230, 'hienthi', 0, 1759490174, NULL),
(2212, 8, 0, 0, 'phuong_nong_tien', 'Phường Nông Tiến', 'nong_tien', '2212', 'phường', 231, 'hienthi', 0, 1759490174, NULL),
(2512, 8, 0, 0, 'phuong_an_tuong', 'Phường An Tường', 'an_tuong', '2512', 'phường', 232, 'hienthi', 0, 1759490174, NULL),
(2524, 8, 0, 0, 'phuong_binh_thuan', 'Phường Bình Thuận', 'binh_thuan', '2524', 'phường', 233, 'hienthi', 0, 1759490174, NULL),
(715, 8, 0, 0, 'xa_lung_cu', 'Xã Lũng Cú', 'lung_cu', '715', 'xã', 234, 'hienthi', 0, 1759490174, NULL),
(721, 8, 0, 0, 'xa_dong_van', 'Xã Đồng Văn', 'dong_van', '721', 'xã', 235, 'hienthi', 0, 1759490174, NULL),
(733, 8, 0, 0, 'xa_sa_phin', 'Xã Sà Phìn', 'sa_phin', '733', 'xã', 236, 'hienthi', 0, 1759490174, NULL),
(745, 8, 0, 0, 'xa_pho_bang', 'Xã Phố Bảng', 'pho_bang', '745', 'xã', 237, 'hienthi', 0, 1759490174, NULL),
(763, 8, 0, 0, 'xa_lung_phin', 'Xã Lũng Phìn', 'lung_phin', '763', 'xã', 238, 'hienthi', 0, 1759490174, NULL),
(787, 8, 0, 0, 'xa_sung_mang', 'Xã Sủng Máng', 'sung_mang', '787', 'xã', 239, 'hienthi', 0, 1759490174, NULL),
(778, 8, 0, 0, 'xa_son_vi', 'Xã Sơn Vĩ', 'son_vi', '778', 'xã', 240, 'hienthi', 0, 1759490174, NULL),
(769, 8, 0, 0, 'xa_meo_vac', 'Xã Mèo Vạc', 'meo_vac', '769', 'xã', 241, 'hienthi', 0, 1759490174, NULL),
(802, 8, 0, 0, 'xa_khau_vai', 'Xã Khâu Vai', 'khau_vai', '802', 'xã', 242, 'hienthi', 0, 1759490174, NULL),
(817, 8, 0, 0, 'xa_niem_son', 'Xã Niêm Sơn', 'niem_son', '817', 'xã', 243, 'hienthi', 0, 1759490174, NULL),
(808, 8, 0, 0, 'xa_tat_nga', 'Xã Tát Ngà', 'tat_nga', '808', 'xã', 244, 'hienthi', 0, 1759490174, NULL),
(829, 8, 0, 0, 'xa_thang_mo', 'Xã Thắng Mố', 'thang_mo', '829', 'xã', 245, 'hienthi', 0, 1759490174, NULL),
(832, 8, 0, 0, 'xa_bach_dich', 'Xã Bạch Đích', 'bach_dich', '832', 'xã', 246, 'hienthi', 0, 1759490174, NULL),
(820, 8, 0, 0, 'xa_yen_minh', 'Xã Yên Minh', 'yen_minh', '820', 'xã', 247, 'hienthi', 0, 1759490174, NULL),
(847, 8, 0, 0, 'xa_mau_due', 'Xã Mậu Duệ', 'mau_due', '847', 'xã', 248, 'hienthi', 0, 1759490174, NULL),
(859, 8, 0, 0, 'xa_ngoc_long', 'Xã Ngọc Long', 'ngoc_long', '859', 'xã', 249, 'hienthi', 0, 1759490174, NULL),
(871, 8, 0, 0, 'xa_du_gia', 'Xã Du Già', 'du_gia', '871', 'xã', 250, 'hienthi', 0, 1759490174, NULL),
(865, 8, 0, 0, 'xa_duong_thuong', 'Xã Đường Thượng', 'duong_thuong', '865', 'xã', 251, 'hienthi', 0, 1759490174, NULL),
(901, 8, 0, 0, 'xa_lung_tam', 'Xã Lùng Tám', 'lung_tam', '901', 'xã', 252, 'hienthi', 0, 1759490174, NULL),
(883, 8, 0, 0, 'xa_can_ty', 'Xã Cán Tỷ', 'can_ty', '883', 'xã', 253, 'hienthi', 0, 1759490174, NULL),
(889, 8, 0, 0, 'xa_nghia_thuan', 'Xã Nghĩa Thuận', 'nghia_thuan', '889', 'xã', 254, 'hienthi', 0, 1759490174, NULL),
(874, 8, 0, 0, 'xa_quan_ba', 'Xã Quản Bạ', 'quan_ba', '874', 'xã', 255, 'hienthi', 0, 1759490174, NULL),
(892, 8, 0, 0, 'xa_tung_vai', 'Xã Tùng Vài', 'tung_vai', '892', 'xã', 256, 'hienthi', 0, 1759490174, NULL),
(1006, 8, 0, 0, 'xa_yen_cuong', 'Xã Yên Cường', 'yen_cuong', '1006', 'xã', 257, 'hienthi', 0, 1759490174, NULL),
(1012, 8, 0, 0, 'xa_duong_hong', 'Xã Đường Hồng', 'duong_hong', '1012', 'xã', 258, 'hienthi', 0, 1759490174, NULL),
(991, 8, 0, 0, 'xa_bac_me', 'Xã Bắc Mê', 'bac_me', '991', 'xã', 259, 'hienthi', 0, 1759490174, NULL),
(985, 8, 0, 0, 'xa_giap_trung', 'Xã Giáp Trung', 'giap_trung', '985', 'xã', 260, 'hienthi', 0, 1759490174, NULL),
(982, 8, 0, 0, 'xa_minh_son', 'Xã Minh Sơn', 'minh_son', '982', 'xã', 261, 'hienthi', 0, 1759490174, NULL),
(994, 8, 0, 0, 'xa_minh_ngoc', 'Xã Minh Ngọc', 'minh_ngoc', '994', 'xã', 262, 'hienthi', 0, 1759490174, NULL),
(700, 8, 0, 0, 'xa_ngoc_duong', 'Xã Ngọc Đường', 'ngoc_duong', '700', 'xã', 263, 'hienthi', 0, 1759490174, NULL),
(694, 8, 0, 0, 'phuong_ha_giang_1', 'Phường Hà Giang 1', 'ha_giang_1', '694', 'phường', 264, 'hienthi', 0, 1759490174, NULL),
(691, 8, 0, 0, 'phuong_ha_giang_2', 'Phường Hà Giang 2', 'ha_giang_2', '691', 'phường', 265, 'hienthi', 0, 1759490174, NULL),
(937, 8, 0, 0, 'xa_lao_chai', 'Xã Lao Chải', 'lao_chai', '937', 'xã', 266, 'hienthi', 0, 1759490174, NULL),
(928, 8, 0, 0, 'xa_thanh_thuy', 'Xã Thanh Thuỷ', 'thanh_thuy', '928', 'xã', 267, 'hienthi', 0, 1759490174, NULL),
(919, 8, 0, 0, 'xa_minh_tan', 'Xã Minh Tân', 'minh_tan', '919', 'xã', 268, 'hienthi', 0, 1759490174, NULL),
(922, 8, 0, 0, 'xa_thuan_hoa', 'Xã Thuận Hoà', 'thuan_hoa', '922', 'xã', 269, 'hienthi', 0, 1759490174, NULL),
(925, 8, 0, 0, 'xa_tung_ba', 'Xã Tùng Bá', 'tung_ba', '925', 'xã', 270, 'hienthi', 0, 1759490174, NULL),
(706, 8, 0, 0, 'xa_phu_linh', 'Xã Phú Linh', 'phu_linh', '706', 'xã', 271, 'hienthi', 0, 1759490174, NULL),
(970, 8, 0, 0, 'xa_linh_ho', 'Xã Linh Hồ', 'linh_ho', '970', 'xã', 272, 'hienthi', 0, 1759490174, NULL),
(976, 8, 0, 0, 'xa_bach_ngoc', 'Xã Bạch Ngọc', 'bach_ngoc', '976', 'xã', 273, 'hienthi', 0, 1759490174, NULL),
(913, 8, 0, 0, 'xa_vi_xuyen', 'Xã Vị Xuyên', 'vi_xuyen', '913', 'xã', 274, 'hienthi', 0, 1759490174, NULL),
(967, 8, 0, 0, 'xa_viet_lam', 'Xã Việt Lâm', 'viet_lam', '967', 'xã', 275, 'hienthi', 0, 1759490174, NULL),
(952, 8, 0, 0, 'xa_cao_bo', 'Xã Cao Bồ', 'cao_bo', '952', 'xã', 276, 'hienthi', 0, 1759490174, NULL),
(958, 8, 0, 0, 'xa_thuong_son', 'Xã Thượng Sơn', 'thuong_son', '958', 'xã', 277, 'hienthi', 0, 1759490174, NULL),
(1171, 8, 0, 0, 'xa_tan_quang', 'Xã Tân Quang', 'tan_quang', '1171', 'xã', 278, 'hienthi', 0, 1759490174, NULL),
(1165, 8, 0, 0, 'xa_dong_tam', 'Xã Đồng Tâm', 'dong_tam', '1165', 'xã', 279, 'hienthi', 0, 1759490174, NULL),
(1192, 8, 0, 0, 'xa_lien_hiep', 'Xã Liên Hiệp', 'lien_hiep', '1192', 'xã', 280, 'hienthi', 0, 1759490174, NULL),
(1180, 8, 0, 0, 'xa_bang_hanh', 'Xã Bằng Hành', 'bang_hanh', '1180', 'xã', 281, 'hienthi', 0, 1759490174, NULL),
(1153, 8, 0, 0, 'xa_bac_quang', 'Xã Bắc Quang', 'bac_quang', '1153', 'xã', 282, 'hienthi', 0, 1759490174, NULL),
(1201, 8, 0, 0, 'xa_hung_an', 'Xã Hùng An', 'hung_an', '1201', 'xã', 283, 'hienthi', 0, 1759490174, NULL),
(1156, 8, 0, 0, 'xa_vinh_tuy', 'Xã Vĩnh Tuy', 'vinh_tuy', '1156', 'xã', 284, 'hienthi', 0, 1759490174, NULL),
(1216, 8, 0, 0, 'xa_dong_yen', 'Xã Đồng Yên', 'dong_yen', '1216', 'xã', 285, 'hienthi', 0, 1759490174, NULL),
(1261, 8, 0, 0, 'xa_tien_yen', 'Xã Tiên Yên', 'tien_yen', '1261', 'xã', 286, 'hienthi', 0, 1759490174, NULL),
(1255, 8, 0, 0, 'xa_xuan_giang', 'Xã Xuân Giang', 'xuan_giang', '1255', 'xã', 287, 'hienthi', 0, 1759490174, NULL),
(1246, 8, 0, 0, 'xa_bang_lang', 'Xã Bằng Lang', 'bang_lang', '1246', 'xã', 288, 'hienthi', 0, 1759490174, NULL),
(1234, 8, 0, 0, 'xa_yen_thanh', 'Xã Yên Thành', 'yen_thanh', '1234', 'xã', 289, 'hienthi', 0, 1759490174, NULL),
(1237, 8, 0, 0, 'xa_quang_binh', 'Xã Quang Bình', 'quang_binh', '1237', 'xã', 290, 'hienthi', 0, 1759490174, NULL),
(1243, 8, 0, 0, 'xa_tan_trinh', 'Xã Tân Trịnh', 'tan_trinh', '1243', 'xã', 291, 'hienthi', 0, 1759490174, NULL),
(1225, 8, 0, 0, 'xa_tien_nguyen', 'Xã Tiên Nguyên', 'tien_nguyen', '1225', 'xã', 292, 'hienthi', 0, 1759490174, NULL),
(1090, 8, 0, 0, 'xa_thong_nguyen', 'Xã Thông Nguyên', 'thong_nguyen', '1090', 'xã', 293, 'hienthi', 0, 1759490174, NULL),
(1084, 8, 0, 0, 'xa_ho_thau', 'Xã Hồ Thầu', 'ho_thau', '1084', 'xã', 294, 'hienthi', 0, 1759490174, NULL),
(1075, 8, 0, 0, 'xa_nam_dich', 'Xã Nậm Dịch', 'nam_dich', '1075', 'xã', 295, 'hienthi', 0, 1759490174, NULL),
(1051, 8, 0, 0, 'xa_tan_tien', 'Xã Tân Tiến', 'tan_tien', '1051', 'xã', 296, 'hienthi', 0, 1759490174, NULL),
(1021, 8, 0, 0, 'xa_hoang_su_phi', 'Xã Hoàng Su Phì', 'hoang_su_phi', '1021', 'xã', 297, 'hienthi', 0, 1759490174, NULL),
(1033, 8, 0, 0, 'xa_thang_tin', 'Xã Thàng Tín', 'thang_tin', '1033', 'xã', 298, 'hienthi', 0, 1759490174, NULL),
(1024, 8, 0, 0, 'xa_ban_may', 'Xã Bản Máy', 'ban_may', '1024', 'xã', 299, 'hienthi', 0, 1759490174, NULL),
(1057, 8, 0, 0, 'xa_po_ly_ngai', 'Xã Pờ Ly Ngài', 'po_ly_ngai', '1057', 'xã', 300, 'hienthi', 0, 1759490174, NULL),
(1108, 8, 0, 0, 'xa_xin_man', 'Xã Xín Mần', 'xin_man', '1108', 'xã', 301, 'hienthi', 0, 1759490174, NULL),
(1096, 8, 0, 0, 'xa_pa_vay_su', 'Xã Pà Vầy Sủ', 'pa_vay_su', '1096', 'xã', 302, 'hienthi', 0, 1759490174, NULL),
(1141, 8, 0, 0, 'xa_nam_dan', 'Xã Nấm Dẩn', 'nam_dan', '1141', 'xã', 303, 'hienthi', 0, 1759490174, NULL),
(1117, 8, 0, 0, 'xa_trung_thinh', 'Xã Trung Thịnh', 'trung_thinh', '1117', 'xã', 304, 'hienthi', 0, 1759490174, NULL),
(1144, 8, 0, 0, 'xa_quang_nguyen', 'Xã Quảng Nguyên', 'quang_nguyen', '1144', 'xã', 305, 'hienthi', 0, 1759490174, NULL),
(1147, 8, 0, 0, 'xa_khuon_lung', 'Xã Khuôn Lùng', 'khuon_lung', '1147', 'xã', 306, 'hienthi', 0, 1759490174, NULL),
(3325, 11, 0, 0, 'xa_muong_phang', 'Xã Mường Phăng', 'muong_phang', '3325', 'xã', 307, 'hienthi', 0, 1759490174, NULL),
(3127, 11, 0, 0, 'phuong_dien_bien_phu', 'Phường Điện Biên Phủ', 'dien_bien_phu', '3127', 'phường', 308, 'hienthi', 0, 1759490174, NULL),
(3334, 11, 0, 0, 'phuong_muong_thanh', 'Phường Mường Thanh', 'muong_thanh', '3334', 'phường', 309, 'hienthi', 0, 1759490174, NULL),
(3151, 11, 0, 0, 'phuong_muong_lay', 'Phường Mường Lay', 'muong_lay', '3151', 'phường', 310, 'hienthi', 0, 1759490174, NULL),
(3328, 11, 0, 0, 'xa_thanh_nua', 'Xã Thanh Nưa', 'thanh_nua', '3328', 'xã', 311, 'hienthi', 0, 1759490174, NULL),
(3352, 11, 0, 0, 'xa_thanh_an', 'Xã Thanh An', 'thanh_an', '3352', 'xã', 312, 'hienthi', 0, 1759490174, NULL),
(3349, 11, 0, 0, 'xa_thanh_yen', 'Xã Thanh Yên', 'thanh_yen', '3349', 'xã', 313, 'hienthi', 0, 1759490174, NULL),
(3356, 11, 0, 0, 'xa_sam_mun', 'Xã Sam Mứn', 'sam_mun', '3356', 'xã', 314, 'hienthi', 0, 1759490174, NULL),
(3358, 11, 0, 0, 'xa_nua_ngam', 'Xã Núa Ngam', 'nua_ngam', '3358', 'xã', 315, 'hienthi', 0, 1759490174, NULL),
(3368, 11, 0, 0, 'xa_muong_nha', 'Xã Mường Nhà', 'muong_nha', '3368', 'xã', 316, 'hienthi', 0, 1759490174, NULL),
(3253, 11, 0, 0, 'xa_tuan_giao', 'Xã Tuần Giáo', 'tuan_giao', '3253', 'xã', 317, 'hienthi', 0, 1759490174, NULL),
(3295, 11, 0, 0, 'xa_quai_to', 'Xã Quài Tở', 'quai_to', '3295', 'xã', 318, 'hienthi', 0, 1759490174, NULL),
(3268, 11, 0, 0, 'xa_muong_mun', 'Xã Mường Mùn', 'muong_mun', '3268', 'xã', 319, 'hienthi', 0, 1759490174, NULL),
(3260, 11, 0, 0, 'xa_pu_nhung', 'Xã Pú Nhung', 'pu_nhung', '3260', 'xã', 320, 'hienthi', 0, 1759490174, NULL),
(3283, 11, 0, 0, 'xa_chieng_sinh', 'Xã Chiềng Sinh', 'chieng_sinh', '3283', 'xã', 321, 'hienthi', 0, 1759490174, NULL),
(3217, 11, 0, 0, 'xa_tua_chua', 'Xã Tủa Chùa', 'tua_chua', '3217', 'xã', 322, 'hienthi', 0, 1759490174, NULL),
(3226, 11, 0, 0, 'xa_sin_chai', 'Xã Sín Chải', 'sin_chai', '3226', 'xã', 323, 'hienthi', 0, 1759490174, NULL),
(3241, 11, 0, 0, 'xa_sinh_phinh', 'Xã Sính Phình', 'sinh_phinh', '3241', 'xã', 324, 'hienthi', 0, 1759490174, NULL),
(3220, 11, 0, 0, 'xa_tua_thang', 'Xã Tủa Thàng', 'tua_thang', '3220', 'xã', 325, 'hienthi', 0, 1759490174, NULL),
(3244, 11, 0, 0, 'xa_sang_nhe', 'Xã Sáng Nhè', 'sang_nhe', '3244', 'xã', 326, 'hienthi', 0, 1759490174, NULL),
(3172, 11, 0, 0, 'xa_na_sang', 'Xã Na Sang', 'na_sang', '3172', 'xã', 327, 'hienthi', 0, 1759490174, NULL),
(3181, 11, 0, 0, 'xa_muong_tung', 'Xã Mường Tùng', 'muong_tung', '3181', 'xã', 328, 'hienthi', 0, 1759490174, NULL),
(3193, 11, 0, 0, 'xa_pa_ham', 'Xã Pa Ham', 'pa_ham', '3193', 'xã', 329, 'hienthi', 0, 1759490174, NULL),
(3194, 11, 0, 0, 'xa_nam_nen', 'Xã Nậm Nèn', 'nam_nen', '3194', 'xã', 330, 'hienthi', 0, 1759490174, NULL),
(3202, 11, 0, 0, 'xa_muong_pon', 'Xã Mường Pồn', 'muong_pon', '3202', 'xã', 331, 'hienthi', 0, 1759490174, NULL),
(3203, 11, 0, 0, 'xa_na_son', 'Xã Na Son', 'na_son', '3203', 'xã', 332, 'hienthi', 0, 1759490174, NULL),
(3208, 11, 0, 0, 'xa_xa_dung', 'Xã Xa Dung', 'xa_dung', '3208', 'xã', 333, 'hienthi', 0, 1759490174, NULL),
(3370, 11, 0, 0, 'xa_pu_nhi', 'Xã Pu Nhi', 'pu_nhi', '3370', 'xã', 334, 'hienthi', 0, 1759490174, NULL),
(3214, 11, 0, 0, 'xa_muong_luan', 'Xã Mường Luân', 'muong_luan', '3214', 'xã', 335, 'hienthi', 0, 1759490174, NULL),
(3385, 11, 0, 0, 'xa_tia_dinh', 'Xã Tìa Dình', 'tia_dinh', '3385', 'xã', 336, 'hienthi', 0, 1759490174, NULL),
(3382, 11, 0, 0, 'xa_phinh_giang', 'Xã Phình Giàng', 'phinh_giang', '3382', 'xã', 337, 'hienthi', 0, 1759490174, NULL),
(3166, 11, 0, 0, 'xa_muong_cha', 'Xã Mường Chà', 'muong_cha', '3166', 'xã', 338, 'hienthi', 0, 1759490174, NULL),
(3169, 11, 0, 0, 'xa_na_hy', 'Xã Nà Hỳ', 'na_hy', '3169', 'xã', 339, 'hienthi', 0, 1759490174, NULL),
(3176, 11, 0, 0, 'xa_na_bung', 'Xã Nà Bủng', 'na_bung', '3176', 'xã', 340, 'hienthi', 0, 1759490174, NULL),
(3175, 11, 0, 0, 'xa_cha_to', 'Xã Chà Tở', 'cha_to', '3175', 'xã', 341, 'hienthi', 0, 1759490174, NULL),
(3199, 11, 0, 0, 'xa_si_pa_phin', 'Xã Si Pa Phìn', 'si_pa_phin', '3199', 'xã', 342, 'hienthi', 0, 1759490174, NULL),
(3160, 11, 0, 0, 'xa_muong_nhe', 'Xã Mường Nhé', 'muong_nhe', '3160', 'xã', 343, 'hienthi', 0, 1759490174, NULL),
(3158, 11, 0, 0, 'xa_sin_thau', 'Xã Sín Thầu', 'sin_thau', '3158', 'xã', 344, 'hienthi', 0, 1759490174, NULL),
(3163, 11, 0, 0, 'xa_muong_toong', 'Xã Mường Toong', 'muong_toong', '3163', 'xã', 345, 'hienthi', 0, 1759490174, NULL),
(3162, 11, 0, 0, 'xa_nam_ke', 'Xã Nậm Kè', 'nam_ke', '3162', 'xã', 346, 'hienthi', 0, 1759490174, NULL),
(3164, 11, 0, 0, 'xa_quang_lam', 'Xã Quảng Lâm', 'quang_lam', '3164', 'xã', 347, 'hienthi', 0, 1759490174, NULL),
(3256, 11, 0, 0, 'xa_muong_ang', 'Xã Mường Ảng', 'muong_ang', '3256', 'xã', 348, 'hienthi', 0, 1759490174, NULL),
(3316, 11, 0, 0, 'xa_na_tau', 'Xã Nà Tấu', 'na_tau', '3316', 'xã', 349, 'hienthi', 0, 1759490174, NULL),
(3301, 11, 0, 0, 'xa_bung_lao', 'Xã Búng Lao', 'bung_lao', '3301', 'xã', 350, 'hienthi', 0, 1759490174, NULL),
(3313, 11, 0, 0, 'xa_muong_lan', 'Xã Mường Lạn', 'muong_lan', '3313', 'xã', 351, 'hienthi', 0, 1759490174, NULL),
(3637, 12, 0, 0, 'xa_muong_kim', 'Xã Mường Kim', 'muong_kim', '3637', 'xã', 352, 'hienthi', 0, 1759490174, NULL),
(3640, 12, 0, 0, 'xa_khoen_on', 'Xã Khoen On', 'khoen_on', '3640', 'xã', 353, 'hienthi', 0, 1759490174, NULL),
(3595, 12, 0, 0, 'xa_than_uyen', 'Xã Than Uyên', 'than_uyen', '3595', 'xã', 354, 'hienthi', 0, 1759490174, NULL),
(3618, 12, 0, 0, 'xa_muong_than', 'Xã Mường Than', 'muong_than', '3618', 'xã', 355, 'hienthi', 0, 1759490174, NULL),
(3616, 12, 0, 0, 'xa_pac_ta', 'Xã Pắc Ta', 'pac_ta', '3616', 'xã', 356, 'hienthi', 0, 1759490174, NULL),
(3613, 12, 0, 0, 'xa_nam_so', 'Xã Nậm Sỏ', 'nam_so', '3613', 'xã', 357, 'hienthi', 0, 1759490174, NULL),
(3598, 12, 0, 0, 'xa_tan_uyen', 'Xã Tân Uyên', 'tan_uyen', '3598', 'xã', 358, 'hienthi', 0, 1759490174, NULL),
(3601, 12, 0, 0, 'xa_muong_khoa', 'Xã Mường Khoa', 'muong_khoa', '3601', 'xã', 359, 'hienthi', 0, 1759490174, NULL),
(3424, 12, 0, 0, 'xa_ban_bo', 'Xã Bản Bo', 'ban_bo', '3424', 'xã', 360, 'hienthi', 0, 1759490174, NULL),
(3390, 12, 0, 0, 'xa_binh_lu', 'Xã Bình Lư', 'binh_lu', '3390', 'xã', 361, 'hienthi', 0, 1759490174, NULL),
(3405, 12, 0, 0, 'xa_ta_leng', 'Xã Tả Lèng', 'ta_leng', '3405', 'xã', 362, 'hienthi', 0, 1759490174, NULL),
(3430, 12, 0, 0, 'xa_khun_ha', 'Xã Khun Há', 'khun_ha', '3430', 'xã', 363, 'hienthi', 0, 1759490174, NULL),
(3408, 12, 0, 0, 'phuong_tan_phong', 'Phường Tân Phong', 'tan_phong', '3408', 'phường', 364, 'hienthi', 0, 1759490174, NULL),
(3388, 12, 0, 0, 'phuong_doan_ket', 'Phường Đoàn Kết', 'doan_ket', '3388', 'phường', 365, 'hienthi', 0, 1759490174, NULL),
(3394, 12, 0, 0, 'xa_sin_suoi_ho', 'Xã Sin Suối Hồ', 'sin_suoi_ho', '3394', 'xã', 366, 'hienthi', 0, 1759490174, NULL),
(3549, 12, 0, 0, 'xa_phong_tho', 'Xã Phong Thổ', 'phong_tho', '3549', 'xã', 367, 'hienthi', 0, 1759490174, NULL),
(3562, 12, 0, 0, 'xa_si_lo_lau', 'Xã Sì Lở Lầu', 'si_lo_lau', '3562', 'xã', 368, 'hienthi', 0, 1759490174, NULL),
(3571, 12, 0, 0, 'xa_dao_san', 'Xã Dào San', 'dao_san', '3571', 'xã', 369, 'hienthi', 0, 1759490174, NULL),
(3583, 12, 0, 0, 'xa_khong_lao', 'Xã Khổng Lào', 'khong_lao', '3583', 'xã', 370, 'hienthi', 0, 1759490174, NULL),
(3529, 12, 0, 0, 'xa_tua_sin_chai', 'Xã Tủa Sín Chải', 'tua_sin_chai', '3529', 'xã', 371, 'hienthi', 0, 1759490174, NULL),
(3478, 12, 0, 0, 'xa_sin_ho', 'Xã Sìn Hồ', 'sin_ho', '3478', 'xã', 372, 'hienthi', 0, 1759490174, NULL),
(3508, 12, 0, 0, 'xa_hong_thu', 'Xã Hồng Thu', 'hong_thu', '3508', 'xã', 373, 'hienthi', 0, 1759490174, NULL),
(3517, 12, 0, 0, 'xa_nam_tam', 'Xã Nậm Tăm', 'nam_tam', '3517', 'xã', 374, 'hienthi', 0, 1759490174, NULL),
(3532, 12, 0, 0, 'xa_pu_sam_cap', 'Xã Pu Sam Cáp', 'pu_sam_cap', '3532', 'xã', 375, 'hienthi', 0, 1759490174, NULL),
(3544, 12, 0, 0, 'xa_nam_cuoi', 'Xã Nậm Cuổi', 'nam_cuoi', '3544', 'xã', 376, 'hienthi', 0, 1759490174, NULL),
(3538, 12, 0, 0, 'xa_nam_ma', 'Xã Nậm Mạ', 'nam_ma', '3538', 'xã', 377, 'hienthi', 0, 1759490174, NULL),
(3487, 12, 0, 0, 'xa_le_loi', 'Xã Lê Lợi', 'le_loi', '3487', 'xã', 378, 'hienthi', 0, 1759490174, NULL),
(3434, 12, 0, 0, 'xa_nam_hang', 'Xã Nậm Hàng', 'nam_hang', '3434', 'xã', 379, 'hienthi', 0, 1759490174, NULL),
(3472, 12, 0, 0, 'xa_muong_mo', 'Xã Mường Mô', 'muong_mo', '3472', 'xã', 380, 'hienthi', 0, 1759490174, NULL),
(3460, 12, 0, 0, 'xa_hua_bum', 'Xã Hua Bum', 'hua_bum', '3460', 'xã', 381, 'hienthi', 0, 1759490174, NULL),
(3503, 12, 0, 0, 'xa_pa_tan', 'Xã Pa Tần', 'pa_tan', '3503', 'xã', 382, 'hienthi', 0, 1759490174, NULL),
(3466, 12, 0, 0, 'xa_bum_nua', 'Xã Bum Nưa', 'bum_nua', '3466', 'xã', 383, 'hienthi', 0, 1759490174, NULL),
(3433, 12, 0, 0, 'xa_bum_to', 'Xã Bum Tở', 'bum_to', '3433', 'xã', 384, 'hienthi', 0, 1759490174, NULL),
(3445, 12, 0, 0, 'xa_muong_te', 'Xã Mường Tè', 'muong_te', '3445', 'xã', 385, 'hienthi', 0, 1759490174, NULL),
(3439, 12, 0, 0, 'xa_thu_lum', 'Xã Thu Lũm', 'thu_lum', '3439', 'xã', 386, 'hienthi', 0, 1759490174, NULL),
(3442, 12, 0, 0, 'xa_pa_u', 'Xã Pa Ủ', 'pa_u', '3442', 'xã', 387, 'hienthi', 0, 1759490174, NULL),
(3463, 12, 0, 0, 'xa_ta_tong', 'Xã Tà Tổng', 'ta_tong', '3463', 'xã', 388, 'hienthi', 0, 1759490174, NULL),
(3451, 12, 0, 0, 'xa_mu_ca', 'Xã Mù Cả', 'mu_ca', '3451', 'xã', 389, 'hienthi', 0, 1759490174, NULL),
(3646, 14, 0, 0, 'phuong_to_hieu', 'Phường Tô Hiệu', 'to_hieu', '3646', 'phường', 390, 'hienthi', 0, 1759490174, NULL),
(3667, 14, 0, 0, 'phuong_chieng_an', 'Phường Chiềng An', 'chieng_an', '3667', 'phường', 391, 'hienthi', 0, 1759490174, NULL),
(3670, 14, 0, 0, 'phuong_chieng_coi', 'Phường Chiềng Cơi', 'chieng_coi', '3670', 'phường', 392, 'hienthi', 0, 1759490174, NULL),
(3679, 14, 0, 0, 'phuong_chieng_sinh', 'Phường Chiềng Sinh', 'chieng_sinh', '3679', 'phường', 393, 'hienthi', 0, 1759490174, NULL),
(3980, 14, 0, 0, 'phuong_moc_chau', 'Phường Mộc Châu', 'moc_chau', '3980', 'phường', 394, 'hienthi', 0, 1759490174, NULL),
(3979, 14, 0, 0, 'phuong_moc_son', 'Phường Mộc Sơn', 'moc_son', '3979', 'phường', 395, 'hienthi', 0, 1759490174, NULL),
(4033, 14, 0, 0, 'phuong_van_son', 'Phường Vân Sơn', 'van_son', '4033', 'phường', 396, 'hienthi', 0, 1759490174, NULL),
(3982, 14, 0, 0, 'phuong_thao_nguyen', 'Phường Thảo Nguyên', 'thao_nguyen', '3982', 'phường', 397, 'hienthi', 0, 1759490174, NULL),
(4000, 14, 0, 0, 'xa_doan_ket', 'Xã Đoàn Kết', 'doan_ket', '4000', 'xã', 398, 'hienthi', 0, 1759490174, NULL),
(4045, 14, 0, 0, 'xa_long_sap', 'Xã Lóng Sập', 'long_sap', '4045', 'xã', 399, 'hienthi', 0, 1759490174, NULL),
(3985, 14, 0, 0, 'xa_chieng_son', 'Xã Chiềng Sơn', 'chieng_son', '3985', 'xã', 400, 'hienthi', 0, 1759490174, NULL),
(4048, 14, 0, 0, 'xa_van_ho', 'Xã Vân Hồ', 'van_ho', '4048', 'xã', 401, 'hienthi', 0, 1759490174, NULL),
(4006, 14, 0, 0, 'xa_song_khua', 'Xã Song Khủa', 'song_khua', '4006', 'xã', 402, 'hienthi', 0, 1759490174, NULL),
(4018, 14, 0, 0, 'xa_to_mua', 'Xã Tô Múa', 'to_mua', '4018', 'xã', 403, 'hienthi', 0, 1759490174, NULL),
(4057, 14, 0, 0, 'xa_xuan_nha', 'Xã Xuân Nha', 'xuan_nha', '4057', 'xã', 404, 'hienthi', 0, 1759490174, NULL),
(3703, 14, 0, 0, 'xa_quynh_nhai', 'Xã Quỳnh Nhai', 'quynh_nhai', '3703', 'xã', 405, 'hienthi', 0, 1759490174, NULL),
(3688, 14, 0, 0, 'xa_muong_chien', 'Xã Mường Chiên', 'muong_chien', '3688', 'xã', 406, 'hienthi', 0, 1759490174, NULL),
(3694, 14, 0, 0, 'xa_muong_gion', 'Xã Mường Giôn', 'muong_gion', '3694', 'xã', 407, 'hienthi', 0, 1759490174, NULL),
(3712, 14, 0, 0, 'xa_muong_sai', 'Xã Mường Sại', 'muong_sai', '3712', 'xã', 408, 'hienthi', 0, 1759490174, NULL),
(3721, 14, 0, 0, 'xa_thuan_chau', 'Xã Thuận Châu', 'thuan_chau', '3721', 'xã', 409, 'hienthi', 0, 1759490174, NULL),
(3754, 14, 0, 0, 'xa_chieng_la', 'Xã Chiềng La', 'chieng_la', '3754', 'xã', 410, 'hienthi', 0, 1759490174, NULL),
(3784, 14, 0, 0, 'xa_nam_lau', 'Xã Nậm Lầu', 'nam_lau', '3784', 'xã', 411, 'hienthi', 0, 1759490174, NULL),
(3799, 14, 0, 0, 'xa_muoi_noi', 'Xã Muổi Nọi', 'muoi_noi', '3799', 'xã', 412, 'hienthi', 0, 1759490174, NULL),
(3757, 14, 0, 0, 'xa_muong_khieng', 'Xã Mường Khiêng', 'muong_khieng', '3757', 'xã', 413, 'hienthi', 0, 1759490174, NULL),
(3781, 14, 0, 0, 'xa_co_ma', 'Xã Co Mạ', 'co_ma', '3781', 'xã', 414, 'hienthi', 0, 1759490174, NULL),
(3724, 14, 0, 0, 'xa_binh_thuan', 'Xã Bình Thuận', 'binh_thuan', '3724', 'xã', 415, 'hienthi', 0, 1759490174, NULL),
(3727, 14, 0, 0, 'xa_muong_e', 'Xã Mường É', 'muong_e', '3727', 'xã', 416, 'hienthi', 0, 1759490174, NULL),
(3763, 14, 0, 0, 'xa_long_he', 'Xã Long Hẹ', 'long_he', '3763', 'xã', 417, 'hienthi', 0, 1759490174, NULL),
(3808, 14, 0, 0, 'xa_muong_la', 'Xã Mường La', 'muong_la', '3808', 'xã', 418, 'hienthi', 0, 1759490174, NULL),
(3814, 14, 0, 0, 'xa_chieng_lao', 'Xã Chiềng Lao', 'chieng_lao', '3814', 'xã', 419, 'hienthi', 0, 1759490174, NULL),
(3847, 14, 0, 0, 'xa_muong_bu', 'Xã Mường Bú', 'muong_bu', '3847', 'xã', 420, 'hienthi', 0, 1759490174, NULL),
(3850, 14, 0, 0, 'xa_chieng_hoa', 'Xã Chiềng Hoa', 'chieng_hoa', '3850', 'xã', 421, 'hienthi', 0, 1759490174, NULL),
(3856, 14, 0, 0, 'xa_bac_yen', 'Xã Bắc Yên', 'bac_yen', '3856', 'xã', 422, 'hienthi', 0, 1759490174, NULL),
(3868, 14, 0, 0, 'xa_ta_xua', 'Xã Tà Xùa', 'ta_xua', '3868', 'xã', 423, 'hienthi', 0, 1759490174, NULL),
(3880, 14, 0, 0, 'xa_ta_khoa', 'Xã Tạ Khoa', 'ta_khoa', '3880', 'xã', 424, 'hienthi', 0, 1759490174, NULL),
(3862, 14, 0, 0, 'xa_xim_vang', 'Xã Xím Vàng', 'xim_vang', '3862', 'xã', 425, 'hienthi', 0, 1759490174, NULL),
(3871, 14, 0, 0, 'xa_pac_nga', 'Xã Pắc Ngà', 'pac_nga', '3871', 'xã', 426, 'hienthi', 0, 1759490174, NULL),
(3892, 14, 0, 0, 'xa_chieng_sai', 'Xã Chiềng Sại', 'chieng_sai', '3892', 'xã', 427, 'hienthi', 0, 1759490174, NULL),
(3910, 14, 0, 0, 'xa_phu_yen', 'Xã Phù Yên', 'phu_yen', '3910', 'xã', 428, 'hienthi', 0, 1759490174, NULL),
(3922, 14, 0, 0, 'xa_gia_phu', 'Xã Gia Phù', 'gia_phu', '3922', 'xã', 429, 'hienthi', 0, 1759490174, NULL),
(3958, 14, 0, 0, 'xa_tuong_ha', 'Xã Tường Hạ', 'tuong_ha', '3958', 'xã', 430, 'hienthi', 0, 1759490174, NULL),
(3907, 14, 0, 0, 'xa_muong_coi', 'Xã Mường Cơi', 'muong_coi', '3907', 'xã', 431, 'hienthi', 0, 1759490174, NULL),
(3943, 14, 0, 0, 'xa_muong_bang', 'Xã Mường Bang', 'muong_bang', '3943', 'xã', 432, 'hienthi', 0, 1759490174, NULL),
(3970, 14, 0, 0, 'xa_tan_phong', 'Xã Tân Phong', 'tan_phong', '3970', 'xã', 433, 'hienthi', 0, 1759490174, NULL),
(3961, 14, 0, 0, 'xa_kim_bon', 'Xã Kim Bon', 'kim_bon', '3961', 'xã', 434, 'hienthi', 0, 1759490174, NULL),
(4075, 14, 0, 0, 'xa_yen_chau', 'Xã Yên Châu', 'yen_chau', '4075', 'xã', 435, 'hienthi', 0, 1759490174, NULL),
(4078, 14, 0, 0, 'xa_chieng_hac', 'Xã Chiềng Hặc', 'chieng_hac', '4078', 'xã', 436, 'hienthi', 0, 1759490174, NULL),
(4096, 14, 0, 0, 'xa_long_phieng', 'Xã Lóng Phiêng', 'long_phieng', '4096', 'xã', 437, 'hienthi', 0, 1759490174, NULL),
(4087, 14, 0, 0, 'xa_yen_son', 'Xã Yên Sơn', 'yen_son', '4087', 'xã', 438, 'hienthi', 0, 1759490174, NULL),
(4132, 14, 0, 0, 'xa_chieng_mai', 'Xã Chiềng Mai', 'chieng_mai', '4132', 'xã', 439, 'hienthi', 0, 1759490174, NULL),
(4105, 14, 0, 0, 'xa_mai_son', 'Xã Mai Sơn', 'mai_son', '4105', 'xã', 440, 'hienthi', 0, 1759490174, NULL),
(4159, 14, 0, 0, 'xa_phieng_pan', 'Xã Phiêng Pằn', 'phieng_pan', '4159', 'xã', 441, 'hienthi', 0, 1759490174, NULL),
(4123, 14, 0, 0, 'xa_chieng_mung', 'Xã Chiềng Mung', 'chieng_mung', '4123', 'xã', 442, 'hienthi', 0, 1759490174, NULL),
(4144, 14, 0, 0, 'xa_phieng_cam', 'Xã Phiêng Cằm', 'phieng_cam', '4144', 'xã', 443, 'hienthi', 0, 1759490174, NULL),
(4117, 14, 0, 0, 'xa_muong_chanh', 'Xã Mường Chanh', 'muong_chanh', '4117', 'xã', 444, 'hienthi', 0, 1759490174, NULL),
(4136, 14, 0, 0, 'xa_ta_hoc', 'Xã Tà Hộc', 'ta_hoc', '4136', 'xã', 445, 'hienthi', 0, 1759490174, NULL),
(4108, 14, 0, 0, 'xa_chieng_sung', 'Xã Chiềng Sung', 'chieng_sung', '4108', 'xã', 446, 'hienthi', 0, 1759490174, NULL),
(4171, 14, 0, 0, 'xa_bo_sinh', 'Xã Bó Sinh', 'bo_sinh', '4171', 'xã', 447, 'hienthi', 0, 1759490174, NULL),
(4222, 14, 0, 0, 'xa_chieng_khuong', 'Xã Chiềng Khương', 'chieng_khuong', '4222', 'xã', 448, 'hienthi', 0, 1759490174, NULL),
(4219, 14, 0, 0, 'xa_muong_hung', 'Xã Mường Hung', 'muong_hung', '4219', 'xã', 449, 'hienthi', 0, 1759490174, NULL);
INSERT INTO `table_ward` (`id`, `id_city`, `id_district`, `districtid`, `wardcode`, `name`, `slug`, `code`, `level`, `numb`, `status`, `date_updated`, `date_created`, `ship_price`) VALUES
(4204, 14, 0, 0, 'xa_chieng_khoong', 'Xã Chiềng Khoong', 'chieng_khoong', '4204', 'xã', 450, 'hienthi', 0, 1759490174, NULL),
(4183, 14, 0, 0, 'xa_muong_lam', 'Xã Mường Lầm', 'muong_lam', '4183', 'xã', 451, 'hienthi', 0, 1759490174, NULL),
(4186, 14, 0, 0, 'xa_nam_ty', 'Xã Nậm Ty', 'nam_ty', '4186', 'xã', 452, 'hienthi', 0, 1759490174, NULL),
(4168, 14, 0, 0, 'xa_song_ma', 'Xã Sông Mã', 'song_ma', '4168', 'xã', 453, 'hienthi', 0, 1759490174, NULL),
(4210, 14, 0, 0, 'xa_huoi_mot', 'Xã Huổi Một', 'huoi_mot', '4210', 'xã', 454, 'hienthi', 0, 1759490174, NULL),
(4195, 14, 0, 0, 'xa_chieng_so', 'Xã Chiềng Sơ', 'chieng_so', '4195', 'xã', 455, 'hienthi', 0, 1759490174, NULL),
(4231, 14, 0, 0, 'xa_sop_cop', 'Xã Sốp Cộp', 'sop_cop', '4231', 'xã', 456, 'hienthi', 0, 1759490174, NULL),
(4228, 14, 0, 0, 'xa_pung_banh', 'Xã Púng Bánh', 'pung_banh', '4228', 'xã', 457, 'hienthi', 0, 1759490174, NULL),
(3997, 14, 0, 0, 'xa_tan_yen', 'Xã Tân Yên', 'tan_yen', '3997', 'xã', 458, 'hienthi', 0, 1759490174, NULL),
(3760, 14, 0, 0, 'xa_muong_bam', 'Xã Mường Bám', 'muong_bam', '3760', 'xã', 459, 'hienthi', 0, 1759490174, NULL),
(3820, 14, 0, 0, 'xa_ngoc_chien', 'Xã Ngọc Chiến', 'ngoc_chien', '3820', 'xã', 460, 'hienthi', 0, 1759490174, NULL),
(3901, 14, 0, 0, 'xa_suoi_to', 'Xã Suối Tọ', 'suoi_to', '3901', 'xã', 461, 'hienthi', 0, 1759490174, NULL),
(4099, 14, 0, 0, 'xa_phieng_khoai', 'Xã Phiêng Khoài', 'phieng_khoai', '4099', 'xã', 462, 'hienthi', 0, 1759490174, NULL),
(4246, 14, 0, 0, 'xa_muong_lan', 'Xã Mường Lạn', 'muong_lan', '4246', 'xã', 463, 'hienthi', 0, 1759490174, NULL),
(4240, 14, 0, 0, 'xa_muong_leo', 'Xã Mường Lèo', 'muong_leo', '4240', 'xã', 464, 'hienthi', 0, 1759490174, NULL),
(4465, 15, 0, 0, 'xa_khao_mang', 'Xã Khao Mang', 'khao_mang', '4465', 'xã', 465, 'hienthi', 0, 1759490174, NULL),
(4456, 15, 0, 0, 'xa_mu_cang_chai', 'Xã Mù Cang Chải', 'mu_cang_chai', '4456', 'xã', 466, 'hienthi', 0, 1759490174, NULL),
(4492, 15, 0, 0, 'xa_pung_luong', 'Xã Púng Luông', 'pung_luong', '4492', 'xã', 467, 'hienthi', 0, 1759490174, NULL),
(4630, 15, 0, 0, 'xa_tu_le', 'Xã Tú Lệ', 'tu_le', '4630', 'xã', 468, 'hienthi', 0, 1759490174, NULL),
(4591, 15, 0, 0, 'xa_tram_tau', 'Xã Trạm Tấu', 'tram_tau', '4591', 'xã', 469, 'hienthi', 0, 1759490174, NULL),
(4585, 15, 0, 0, 'xa_hanh_phuc', 'Xã Hạnh Phúc', 'hanh_phuc', '4585', 'xã', 470, 'hienthi', 0, 1759490174, NULL),
(4609, 15, 0, 0, 'xa_phinh_ho', 'Xã Phình Hồ', 'phinh_ho', '4609', 'xã', 471, 'hienthi', 0, 1759490174, NULL),
(4288, 15, 0, 0, 'phuong_nghia_lo', 'Phường Nghĩa Lộ', 'nghia_lo', '4288', 'phường', 472, 'hienthi', 0, 1759490174, NULL),
(4663, 15, 0, 0, 'phuong_trung_tam', 'Phường Trung Tâm', 'trung_tam', '4663', 'phường', 473, 'hienthi', 0, 1759490174, NULL),
(4678, 15, 0, 0, 'phuong_cau_thia', 'Phường Cầu Thia', 'cau_thia', '4678', 'phường', 474, 'hienthi', 0, 1759490174, NULL),
(4660, 15, 0, 0, 'xa_lien_son', 'Xã Liên Sơn', 'lien_son', '4660', 'xã', 475, 'hienthi', 0, 1759490174, NULL),
(4636, 15, 0, 0, 'xa_gia_hoi', 'Xã Gia Hội', 'gia_hoi', '4636', 'xã', 476, 'hienthi', 0, 1759490174, NULL),
(4651, 15, 0, 0, 'xa_son_luong', 'Xã Sơn Lương', 'son_luong', '4651', 'xã', 477, 'hienthi', 0, 1759490174, NULL),
(4705, 15, 0, 0, 'xa_thuong_bang_la', 'Xã Thượng Bằng La', 'thuong_bang_la', '4705', 'xã', 478, 'hienthi', 0, 1759490174, NULL),
(4699, 15, 0, 0, 'xa_chan_thinh', 'Xã Chấn Thịnh', 'chan_thinh', '4699', 'xã', 479, 'hienthi', 0, 1759490174, NULL),
(4711, 15, 0, 0, 'xa_nghia_tam', 'Xã Nghĩa Tâm', 'nghia_tam', '4711', 'xã', 480, 'hienthi', 0, 1759490174, NULL),
(4672, 15, 0, 0, 'xa_van_chan', 'Xã Văn Chấn', 'van_chan', '4672', 'xã', 481, 'hienthi', 0, 1759490174, NULL),
(4402, 15, 0, 0, 'xa_phong_du_ha', 'Xã Phong Dụ Hạ', 'phong_du_ha', '4402', 'xã', 482, 'hienthi', 0, 1759490174, NULL),
(4387, 15, 0, 0, 'xa_chau_que', 'Xã Châu Quế', 'chau_que', '4387', 'xã', 483, 'hienthi', 0, 1759490174, NULL),
(4381, 15, 0, 0, 'xa_lam_giang', 'Xã Lâm Giang', 'lam_giang', '4381', 'xã', 484, 'hienthi', 0, 1759490174, NULL),
(4399, 15, 0, 0, 'xa_dong_cuong', 'Xã Đông Cuông', 'dong_cuong', '4399', 'xã', 485, 'hienthi', 0, 1759490174, NULL),
(4429, 15, 0, 0, 'xa_tan_hop', 'Xã Tân Hợp', 'tan_hop', '4429', 'xã', 486, 'hienthi', 0, 1759490174, NULL),
(4375, 15, 0, 0, 'xa_mau_a', 'Xã Mậu A', 'mau_a', '4375', 'xã', 487, 'hienthi', 0, 1759490174, NULL),
(4441, 15, 0, 0, 'xa_xuan_ai', 'Xã Xuân Ái', 'xuan_ai', '4441', 'xã', 488, 'hienthi', 0, 1759490174, NULL),
(4450, 15, 0, 0, 'xa_mo_vang', 'Xã Mỏ Vàng', 'mo_vang', '4450', 'xã', 489, 'hienthi', 0, 1759490174, NULL),
(4318, 15, 0, 0, 'xa_lam_thuong', 'Xã Lâm Thượng', 'lam_thuong', '4318', 'xã', 490, 'hienthi', 0, 1759490174, NULL),
(4303, 15, 0, 0, 'xa_luc_yen', 'Xã Lục Yên', 'luc_yen', '4303', 'xã', 491, 'hienthi', 0, 1759490174, NULL),
(4336, 15, 0, 0, 'xa_tan_linh', 'Xã Tân Lĩnh', 'tan_linh', '4336', 'xã', 492, 'hienthi', 0, 1759490174, NULL),
(4333, 15, 0, 0, 'xa_khanh_hoa', 'Xã Khánh Hòa', 'khanh_hoa', '4333', 'xã', 493, 'hienthi', 0, 1759490174, NULL),
(4363, 15, 0, 0, 'xa_phuc_loi', 'Xã Phúc Lợi', 'phuc_loi', '4363', 'xã', 494, 'hienthi', 0, 1759490174, NULL),
(4345, 15, 0, 0, 'xa_muong_lai', 'Xã Mường Lai', 'muong_lai', '4345', 'xã', 495, 'hienthi', 0, 1759490174, NULL),
(4726, 15, 0, 0, 'xa_cam_nhan', 'Xã Cảm Nhân', 'cam_nhan', '4726', 'xã', 496, 'hienthi', 0, 1759490174, NULL),
(4744, 15, 0, 0, 'xa_yen_thanh', 'Xã Yên Thành', 'yen_thanh', '4744', 'xã', 497, 'hienthi', 0, 1759490174, NULL),
(4717, 15, 0, 0, 'xa_thac_ba', 'Xã Thác Bà', 'thac_ba', '4717', 'xã', 498, 'hienthi', 0, 1759490174, NULL),
(4714, 15, 0, 0, 'xa_yen_binh', 'Xã Yên Bình', 'yen_binh', '4714', 'xã', 499, 'hienthi', 0, 1759490174, NULL),
(4750, 15, 0, 0, 'xa_bao_ai', 'Xã Bảo Ái', 'bao_ai', '4750', 'xã', 500, 'hienthi', 0, 1759490174, NULL),
(4279, 15, 0, 0, 'phuong_van_phu', 'Phường Văn Phú', 'van_phu', '4279', 'phường', 501, 'hienthi', 0, 1759490174, NULL),
(4252, 15, 0, 0, 'phuong_yen_bai', 'Phường Yên Bái', 'yen_bai', '4252', 'phường', 502, 'hienthi', 0, 1759490174, NULL),
(4273, 15, 0, 0, 'phuong_nam_cuong', 'Phường Nam Cường', 'nam_cuong', '4273', 'phường', 503, 'hienthi', 0, 1759490174, NULL),
(4543, 15, 0, 0, 'phuong_au_lau', 'Phường Âu Lâu', 'au_lau', '4543', 'phường', 504, 'hienthi', 0, 1759490174, NULL),
(4498, 15, 0, 0, 'xa_tran_yen', 'Xã Trấn Yên', 'tran_yen', '4498', 'xã', 505, 'hienthi', 0, 1759490174, NULL),
(4576, 15, 0, 0, 'xa_hung_khanh', 'Xã Hưng Khánh', 'hung_khanh', '4576', 'xã', 506, 'hienthi', 0, 1759490174, NULL),
(4537, 15, 0, 0, 'xa_luong_thinh', 'Xã Lương Thịnh', 'luong_thinh', '4537', 'xã', 507, 'hienthi', 0, 1759490174, NULL),
(4564, 15, 0, 0, 'xa_viet_hong', 'Xã Việt Hồng', 'viet_hong', '4564', 'xã', 508, 'hienthi', 0, 1759490174, NULL),
(4531, 15, 0, 0, 'xa_quy_mong', 'Xã Quy Mông', 'quy_mong', '4531', 'xã', 509, 'hienthi', 0, 1759490174, NULL),
(2902, 15, 0, 0, 'xa_phong_hai', 'Xã Phong Hải', 'phong_hai', '2902', 'xã', 510, 'hienthi', 0, 1759490174, NULL),
(2926, 15, 0, 0, 'xa_xuan_quang', 'Xã Xuân Quang', 'xuan_quang', '2926', 'xã', 511, 'hienthi', 0, 1759490174, NULL),
(2905, 15, 0, 0, 'xa_bao_thang', 'Xã Bảo Thắng', 'bao_thang', '2905', 'xã', 512, 'hienthi', 0, 1759490174, NULL),
(2908, 15, 0, 0, 'xa_tang_loong', 'Xã Tằng Loỏng', 'tang_loong', '2908', 'xã', 513, 'hienthi', 0, 1759490174, NULL),
(2923, 15, 0, 0, 'xa_gia_phu', 'Xã Gia Phú', 'gia_phu', '2923', 'xã', 514, 'hienthi', 0, 1759490174, NULL),
(2746, 15, 0, 0, 'xa_coc_san', 'Xã Cốc San', 'coc_san', '2746', 'xã', 515, 'hienthi', 0, 1759490174, NULL),
(2680, 15, 0, 0, 'xa_hop_thanh', 'Xã Hợp Thành', 'hop_thanh', '2680', 'xã', 516, 'hienthi', 0, 1759490174, NULL),
(2674, 15, 0, 0, 'phuong_cam_duong', 'Phường Cam Đường', 'cam_duong', '2674', 'phường', 517, 'hienthi', 0, 1759490174, NULL),
(2647, 15, 0, 0, 'phuong_lao_cai', 'Phường Lào Cai', 'lao_cai', '2647', 'phường', 518, 'hienthi', 0, 1759490174, NULL),
(2728, 15, 0, 0, 'xa_muong_hum', 'Xã Mường Hum', 'muong_hum', '2728', 'xã', 519, 'hienthi', 0, 1759490174, NULL),
(2707, 15, 0, 0, 'xa_den_sang', 'Xã Dền Sáng', 'den_sang', '2707', 'xã', 520, 'hienthi', 0, 1759490174, NULL),
(2701, 15, 0, 0, 'xa_y_ty', 'Xã Y Tý', 'y_ty', '2701', 'xã', 521, 'hienthi', 0, 1759490174, NULL),
(2686, 15, 0, 0, 'xa_a_mu_sung', 'Xã A Mú Sung', 'a_mu_sung', '2686', 'xã', 522, 'hienthi', 0, 1759490174, NULL),
(2695, 15, 0, 0, 'xa_trinh_tuong', 'Xã Trịnh Tường', 'trinh_tuong', '2695', 'xã', 523, 'hienthi', 0, 1759490174, NULL),
(2725, 15, 0, 0, 'xa_ban_xeo', 'Xã Bản Xèo', 'ban_xeo', '2725', 'xã', 524, 'hienthi', 0, 1759490174, NULL),
(2683, 15, 0, 0, 'xa_bat_xat', 'Xã Bát Xát', 'bat_xat', '2683', 'xã', 525, 'hienthi', 0, 1759490174, NULL),
(2953, 15, 0, 0, 'xa_nghia_do', 'Xã Nghĩa Đô', 'nghia_do', '2953', 'xã', 526, 'hienthi', 0, 1759490174, NULL),
(2968, 15, 0, 0, 'xa_thuong_ha', 'Xã Thượng Hà', 'thuong_ha', '2968', 'xã', 527, 'hienthi', 0, 1759490174, NULL),
(2947, 15, 0, 0, 'xa_bao_yen', 'Xã Bảo Yên', 'bao_yen', '2947', 'xã', 528, 'hienthi', 0, 1759490174, NULL),
(2962, 15, 0, 0, 'xa_xuan_hoa', 'Xã Xuân Hòa', 'xuan_hoa', '2962', 'xã', 529, 'hienthi', 0, 1759490174, NULL),
(2998, 15, 0, 0, 'xa_phuc_khanh', 'Xã Phúc Khánh', 'phuc_khanh', '2998', 'xã', 530, 'hienthi', 0, 1759490174, NULL),
(2989, 15, 0, 0, 'xa_bao_ha', 'Xã Bảo Hà', 'bao_ha', '2989', 'xã', 531, 'hienthi', 0, 1759490174, NULL),
(3061, 15, 0, 0, 'xa_vo_lao', 'Xã Võ Lao', 'vo_lao', '3061', 'xã', 532, 'hienthi', 0, 1759490174, NULL),
(3103, 15, 0, 0, 'xa_khanh_yen', 'Xã Khánh Yên', 'khanh_yen', '3103', 'xã', 533, 'hienthi', 0, 1759490174, NULL),
(3082, 15, 0, 0, 'xa_van_ban', 'Xã Văn Bàn', 'van_ban', '3082', 'xã', 534, 'hienthi', 0, 1759490174, NULL),
(3106, 15, 0, 0, 'xa_duong_quy', 'Xã Dương Quỳ', 'duong_quy', '3106', 'xã', 535, 'hienthi', 0, 1759490174, NULL),
(3091, 15, 0, 0, 'xa_chieng_ken', 'Xã Chiềng Ken', 'chieng_ken', '3091', 'xã', 536, 'hienthi', 0, 1759490174, NULL),
(3121, 15, 0, 0, 'xa_minh_luong', 'Xã Minh Lương', 'minh_luong', '3121', 'xã', 537, 'hienthi', 0, 1759490174, NULL),
(3076, 15, 0, 0, 'xa_nam_chay', 'Xã Nậm Chày', 'nam_chay', '3076', 'xã', 538, 'hienthi', 0, 1759490174, NULL),
(3043, 15, 0, 0, 'xa_muong_bo', 'Xã Mường Bo', 'muong_bo', '3043', 'xã', 539, 'hienthi', 0, 1759490174, NULL),
(3046, 15, 0, 0, 'xa_ban_ho', 'Xã Bản Hồ', 'ban_ho', '3046', 'xã', 540, 'hienthi', 0, 1759490174, NULL),
(3013, 15, 0, 0, 'xa_ta_phin', 'Xã Tả Phìn', 'ta_phin', '3013', 'xã', 541, 'hienthi', 0, 1759490174, NULL),
(3037, 15, 0, 0, 'xa_ta_van', 'Xã Tả Van', 'ta_van', '3037', 'xã', 542, 'hienthi', 0, 1759490174, NULL),
(3006, 15, 0, 0, 'phuong_sa_pa', 'Phường Sa Pa', 'sa_pa', '3006', 'phường', 543, 'hienthi', 0, 1759490174, NULL),
(2896, 15, 0, 0, 'xa_coc_lau', 'Xã Cốc Lầu', 'coc_lau', '2896', 'xã', 544, 'hienthi', 0, 1759490174, NULL),
(2890, 15, 0, 0, 'xa_bao_nhai', 'Xã Bảo Nhai', 'bao_nhai', '2890', 'xã', 545, 'hienthi', 0, 1759490174, NULL),
(2869, 15, 0, 0, 'xa_ban_lien', 'Xã Bản Liền', 'ban_lien', '2869', 'xã', 546, 'hienthi', 0, 1759490174, NULL),
(2839, 15, 0, 0, 'xa_bac_ha', 'Xã Bắc Hà', 'bac_ha', '2839', 'xã', 547, 'hienthi', 0, 1759490174, NULL),
(2842, 15, 0, 0, 'xa_ta_cu_ty', 'Xã Tả Củ Tỷ', 'ta_cu_ty', '2842', 'xã', 548, 'hienthi', 0, 1759490174, NULL),
(2848, 15, 0, 0, 'xa_lung_phinh', 'Xã Lùng Phình', 'lung_phinh', '2848', 'xã', 549, 'hienthi', 0, 1759490174, NULL),
(2752, 15, 0, 0, 'xa_pha_long', 'Xã Pha Long', 'pha_long', '2752', 'xã', 550, 'hienthi', 0, 1759490174, NULL),
(2761, 15, 0, 0, 'xa_muong_khuong', 'Xã Mường Khương', 'muong_khuong', '2761', 'xã', 551, 'hienthi', 0, 1759490174, NULL),
(2788, 15, 0, 0, 'xa_ban_lau', 'Xã Bản Lầu', 'ban_lau', '2788', 'xã', 552, 'hienthi', 0, 1759490174, NULL),
(2791, 15, 0, 0, 'xa_cao_son', 'Xã Cao Sơn', 'cao_son', '2791', 'xã', 553, 'hienthi', 0, 1759490174, NULL),
(2809, 15, 0, 0, 'xa_si_ma_cai', 'Xã Si Ma Cai', 'si_ma_cai', '2809', 'xã', 554, 'hienthi', 0, 1759490174, NULL),
(2824, 15, 0, 0, 'xa_sin_cheng', 'Xã Sín Chéng', 'sin_cheng', '2824', 'xã', 555, 'hienthi', 0, 1759490174, NULL),
(4474, 15, 0, 0, 'xa_lao_chai', 'Xã Lao Chải', 'lao_chai', '4474', 'xã', 556, 'hienthi', 0, 1759490174, NULL),
(4489, 15, 0, 0, 'xa_che_tao', 'Xã Chế Tạo', 'che_tao', '4489', 'xã', 557, 'hienthi', 0, 1759490174, NULL),
(4462, 15, 0, 0, 'xa_nam_co', 'Xã Nậm Có', 'nam_co', '4462', 'xã', 558, 'hienthi', 0, 1759490174, NULL),
(4603, 15, 0, 0, 'xa_ta_xi_lang', 'Xã Tà Xi Láng', 'ta_xi_lang', '4603', 'xã', 559, 'hienthi', 0, 1759490174, NULL),
(4423, 15, 0, 0, 'xa_phong_du_thuong', 'Xã Phong Dụ Thượng', 'phong_du_thuong', '4423', 'xã', 560, 'hienthi', 0, 1759490174, NULL),
(4693, 15, 0, 0, 'xa_cat_thinh', 'Xã Cát Thịnh', 'cat_thinh', '4693', 'xã', 561, 'hienthi', 0, 1759490174, NULL),
(3085, 15, 0, 0, 'xa_nam_xe', 'Xã Nậm Xé', 'nam_xe', '3085', 'xã', 562, 'hienthi', 0, 1759490174, NULL),
(3004, 15, 0, 0, 'xa_ngu_chi_son', 'Xã Ngũ Chỉ Sơn', 'ngu_chi_son', '3004', 'xã', 563, 'hienthi', 0, 1759490174, NULL),
(5443, 19, 0, 0, 'phuong_phan_dinh_phung', 'Phường Phan Đình Phùng', 'phan_dinh_phung', '5443', 'phường', 564, 'hienthi', 0, 1759490174, NULL),
(5710, 19, 0, 0, 'phuong_linh_son', 'Phường Linh Sơn', 'linh_son', '5710', 'phường', 565, 'hienthi', 0, 1759490174, NULL),
(5500, 19, 0, 0, 'phuong_tich_luong', 'Phường Tích Lương', 'tich_luong', '5500', 'phường', 566, 'hienthi', 0, 1759490174, NULL),
(5467, 19, 0, 0, 'phuong_gia_sang', 'Phường Gia Sàng', 'gia_sang', '5467', 'phường', 567, 'hienthi', 0, 1759490174, NULL),
(5455, 19, 0, 0, 'phuong_quyet_thang', 'Phường Quyết Thắng', 'quyet_thang', '5455', 'phường', 568, 'hienthi', 0, 1759490174, NULL),
(5482, 19, 0, 0, 'phuong_quan_trieu', 'Phường Quan Triều', 'quan_trieu', '5482', 'phường', 569, 'hienthi', 0, 1759490174, NULL),
(5503, 19, 0, 0, 'xa_tan_cuong', 'Xã Tân Cương', 'tan_cuong', '5503', 'xã', 570, 'hienthi', 0, 1759490174, NULL),
(5488, 19, 0, 0, 'xa_dai_phuc', 'Xã Đại Phúc', 'dai_phuc', '5488', 'xã', 571, 'hienthi', 0, 1759490174, NULL),
(5830, 19, 0, 0, 'xa_dai_tu', 'Xã Đại Từ', 'dai_tu', '5830', 'xã', 572, 'hienthi', 0, 1759490174, NULL),
(5776, 19, 0, 0, 'xa_duc_luong', 'Xã Đức Lương', 'duc_luong', '5776', 'xã', 573, 'hienthi', 0, 1759490174, NULL),
(5800, 19, 0, 0, 'xa_phu_thinh', 'Xã Phú Thịnh', 'phu_thinh', '5800', 'xã', 574, 'hienthi', 0, 1759490174, NULL),
(5818, 19, 0, 0, 'xa_la_bang', 'Xã La Bằng', 'la_bang', '5818', 'xã', 575, 'hienthi', 0, 1759490174, NULL),
(5794, 19, 0, 0, 'xa_phu_lac', 'Xã Phú Lạc', 'phu_lac', '5794', 'xã', 576, 'hienthi', 0, 1759490174, NULL),
(5809, 19, 0, 0, 'xa_an_khanh', 'Xã An Khánh', 'an_khanh', '5809', 'xã', 577, 'hienthi', 0, 1759490174, NULL),
(5851, 19, 0, 0, 'xa_quan_chu', 'Xã Quân Chu', 'quan_chu', '5851', 'xã', 578, 'hienthi', 0, 1759490174, NULL),
(5845, 19, 0, 0, 'xa_van_phu', 'Xã Vạn Phú', 'van_phu', '5845', 'xã', 579, 'hienthi', 0, 1759490174, NULL),
(5773, 19, 0, 0, 'xa_phu_xuyen', 'Xã Phú Xuyên', 'phu_xuyen', '5773', 'xã', 580, 'hienthi', 0, 1759490174, NULL),
(5860, 19, 0, 0, 'phuong_pho_yen', 'Phường Phổ Yên', 'pho_yen', '5860', 'phường', 581, 'hienthi', 0, 1759490174, NULL),
(5890, 19, 0, 0, 'phuong_van_xuan', 'Phường Vạn Xuân', 'van_xuan', '5890', 'phường', 582, 'hienthi', 0, 1759490174, NULL),
(5899, 19, 0, 0, 'phuong_trung_thanh', 'Phường Trung Thành', 'trung_thanh', '5899', 'phường', 583, 'hienthi', 0, 1759490174, NULL),
(5857, 19, 0, 0, 'phuong_phuc_thuan', 'Phường Phúc Thuận', 'phuc_thuan', '5857', 'phường', 584, 'hienthi', 0, 1759490174, NULL),
(5881, 19, 0, 0, 'xa_thanh_cong', 'Xã Thành Công', 'thanh_cong', '5881', 'xã', 585, 'hienthi', 0, 1759490174, NULL),
(5908, 19, 0, 0, 'xa_phu_binh', 'Xã Phú Bình', 'phu_binh', '5908', 'xã', 586, 'hienthi', 0, 1759490174, NULL),
(5923, 19, 0, 0, 'xa_tan_thanh', 'Xã Tân Thành', 'tan_thanh', '5923', 'xã', 587, 'hienthi', 0, 1759490174, NULL),
(5941, 19, 0, 0, 'xa_diem_thuy', 'Xã Điềm Thụy', 'diem_thuy', '5941', 'xã', 588, 'hienthi', 0, 1759490174, NULL),
(5953, 19, 0, 0, 'xa_kha_son', 'Xã Kha Sơn', 'kha_son', '5953', 'xã', 589, 'hienthi', 0, 1759490174, NULL),
(5917, 19, 0, 0, 'xa_tan_khanh', 'Xã Tân Khánh', 'tan_khanh', '5917', 'xã', 590, 'hienthi', 0, 1759490174, NULL),
(5692, 19, 0, 0, 'xa_dong_hy', 'Xã Đồng Hỷ', 'dong_hy', '5692', 'xã', 591, 'hienthi', 0, 1759490174, NULL),
(5674, 19, 0, 0, 'xa_quang_son', 'Xã Quang Sơn', 'quang_son', '5674', 'xã', 592, 'hienthi', 0, 1759490174, NULL),
(5662, 19, 0, 0, 'xa_trai_cau', 'Xã Trại Cau', 'trai_cau', '5662', 'xã', 593, 'hienthi', 0, 1759490174, NULL),
(5707, 19, 0, 0, 'xa_nam_hoa', 'Xã Nam Hòa', 'nam_hoa', '5707', 'xã', 594, 'hienthi', 0, 1759490174, NULL),
(5680, 19, 0, 0, 'xa_van_han', 'Xã Văn Hán', 'van_han', '5680', 'xã', 595, 'hienthi', 0, 1759490174, NULL),
(5665, 19, 0, 0, 'xa_van_lang', 'Xã Văn Lăng', 'van_lang', '5665', 'xã', 596, 'hienthi', 0, 1759490174, NULL),
(5518, 19, 0, 0, 'phuong_song_cong', 'Phường Sông Công', 'song_cong', '5518', 'phường', 597, 'hienthi', 0, 1759490174, NULL),
(5533, 19, 0, 0, 'phuong_ba_xuyen', 'Phường Bá Xuyên', 'ba_xuyen', '5533', 'phường', 598, 'hienthi', 0, 1759490174, NULL),
(5528, 19, 0, 0, 'phuong_bach_quang', 'Phường Bách Quang', 'bach_quang', '5528', 'phường', 599, 'hienthi', 0, 1759490174, NULL),
(5611, 19, 0, 0, 'xa_phu_luong', 'Xã Phú Lương', 'phu_luong', '5611', 'xã', 600, 'hienthi', 0, 1759490174, NULL),
(5641, 19, 0, 0, 'xa_vo_tranh', 'Xã Vô Tranh', 'vo_tranh', '5641', 'xã', 601, 'hienthi', 0, 1759490174, NULL),
(5620, 19, 0, 0, 'xa_yen_trach', 'Xã Yên Trạch', 'yen_trach', '5620', 'xã', 602, 'hienthi', 0, 1759490174, NULL),
(5632, 19, 0, 0, 'xa_hop_thanh', 'Xã Hợp Thành', 'hop_thanh', '5632', 'xã', 603, 'hienthi', 0, 1759490174, NULL),
(5569, 19, 0, 0, 'xa_dinh_hoa', 'Xã Định Hóa', 'dinh_hoa', '5569', 'xã', 604, 'hienthi', 0, 1759490174, NULL),
(5587, 19, 0, 0, 'xa_binh_yen', 'Xã Bình Yên', 'binh_yen', '5587', 'xã', 605, 'hienthi', 0, 1759490174, NULL),
(5581, 19, 0, 0, 'xa_trung_hoi', 'Xã Trung Hội', 'trung_hoi', '5581', 'xã', 606, 'hienthi', 0, 1759490174, NULL),
(5563, 19, 0, 0, 'xa_phuong_tien', 'Xã Phượng Tiến', 'tien', '5563', 'xã', 607, 'hienthi', 0, 1759490174, NULL),
(5602, 19, 0, 0, 'xa_phu_dinh', 'Xã Phú Đình', 'phu_dinh', '5602', 'xã', 608, 'hienthi', 0, 1759490174, NULL),
(5605, 19, 0, 0, 'xa_binh_thanh', 'Xã Bình Thành', 'binh_thanh', '5605', 'xã', 609, 'hienthi', 0, 1759490174, NULL),
(5551, 19, 0, 0, 'xa_kim_phuong', 'Xã Kim Phượng', 'kim_phuong', '5551', 'xã', 610, 'hienthi', 0, 1759490174, NULL),
(5542, 19, 0, 0, 'xa_lam_vy', 'Xã Lam Vỹ', 'lam_vy', '5542', 'xã', 611, 'hienthi', 0, 1759490174, NULL),
(5716, 19, 0, 0, 'xa_vo_nhai', 'Xã Võ Nhai', 'vo_nhai', '5716', 'xã', 612, 'hienthi', 0, 1759490174, NULL),
(5755, 19, 0, 0, 'xa_dan_tien', 'Xã Dân Tiến', 'dan_tien', '5755', 'xã', 613, 'hienthi', 0, 1759490174, NULL),
(5722, 19, 0, 0, 'xa_nghinh_tuong', 'Xã Nghinh Tường', 'nghinh_tuong', '5722', 'xã', 614, 'hienthi', 0, 1759490174, NULL),
(5725, 19, 0, 0, 'xa_than_sa', 'Xã Thần Sa', 'than_sa', '5725', 'xã', 615, 'hienthi', 0, 1759490174, NULL),
(5740, 19, 0, 0, 'xa_la_hien', 'Xã La Hiên', 'la_hien', '5740', 'xã', 616, 'hienthi', 0, 1759490174, NULL),
(5746, 19, 0, 0, 'xa_trang_xa', 'Xã Tràng Xá', 'trang_xa', '5746', 'xã', 617, 'hienthi', 0, 1759490174, NULL),
(1864, 19, 0, 0, 'xa_bang_thanh', 'Xã Bằng Thành', 'bang_thanh', '1864', 'xã', 618, 'hienthi', 0, 1759490174, NULL),
(1882, 19, 0, 0, 'xa_nghien_loan', 'Xã Nghiên Loan', 'nghien_loan', '1882', 'xã', 619, 'hienthi', 0, 1759490174, NULL),
(1879, 19, 0, 0, 'xa_cao_minh', 'Xã Cao Minh', 'cao_minh', '1879', 'xã', 620, 'hienthi', 0, 1759490174, NULL),
(1906, 19, 0, 0, 'xa_ba_be', 'Xã Ba Bể', 'ba_be', '1906', 'xã', 621, 'hienthi', 0, 1759490174, NULL),
(1912, 19, 0, 0, 'xa_cho_ra', 'Xã Chợ Rã', 'cho_ra', '1912', 'xã', 622, 'hienthi', 0, 1759490174, NULL),
(1894, 19, 0, 0, 'xa_phuc_loc', 'Xã Phúc Lộc', 'phuc_loc', '1894', 'xã', 623, 'hienthi', 0, 1759490174, NULL),
(1921, 19, 0, 0, 'xa_thuong_minh', 'Xã Thượng Minh', 'thuong_minh', '1921', 'xã', 624, 'hienthi', 0, 1759490174, NULL),
(1933, 19, 0, 0, 'xa_dong_phuc', 'Xã Đồng Phúc', 'dong_phuc', '1933', 'xã', 625, 'hienthi', 0, 1759490174, NULL),
(2116, 19, 0, 0, 'xa_yen_binh', 'Xã Yên Bình', 'yen_binh', '2116', 'xã', 626, 'hienthi', 0, 1759490174, NULL),
(1942, 19, 0, 0, 'xa_bang_van', 'Xã Bằng Vân', 'bang_van', '1942', 'xã', 627, 'hienthi', 0, 1759490174, NULL),
(1954, 19, 0, 0, 'xa_ngan_son', 'Xã Ngân Sơn', 'ngan_son', '1954', 'xã', 628, 'hienthi', 0, 1759490174, NULL),
(1936, 19, 0, 0, 'xa_na_phac', 'Xã Nà Phặc', 'na_phac', '1936', 'xã', 629, 'hienthi', 0, 1759490174, NULL),
(1960, 19, 0, 0, 'xa_hiep_luc', 'Xã Hiệp Lực', 'hiep_luc', '1960', 'xã', 630, 'hienthi', 0, 1759490174, NULL),
(2026, 19, 0, 0, 'xa_nam_cuong', 'Xã Nam Cường', 'nam_cuong', '2026', 'xã', 631, 'hienthi', 0, 1759490174, NULL),
(2038, 19, 0, 0, 'xa_quang_bach', 'Xã Quảng Bạch', 'quang_bach', '2038', 'xã', 632, 'hienthi', 0, 1759490174, NULL),
(2044, 19, 0, 0, 'xa_yen_thinh', 'Xã Yên Thịnh', 'yen_thinh', '2044', 'xã', 633, 'hienthi', 0, 1759490174, NULL),
(2020, 19, 0, 0, 'xa_cho_don', 'Xã Chợ Đồn', 'cho_don', '2020', 'xã', 634, 'hienthi', 0, 1759490174, NULL),
(2083, 19, 0, 0, 'xa_yen_phong', 'Xã Yên Phong', 'yen_phong', '2083', 'xã', 635, 'hienthi', 0, 1759490174, NULL),
(2071, 19, 0, 0, 'xa_nghia_ta', 'Xã Nghĩa Tá', 'nghia_ta', '2071', 'xã', 636, 'hienthi', 0, 1759490174, NULL),
(1969, 19, 0, 0, 'xa_phu_thong', 'Xã Phủ Thông', 'phu_thong', '1969', 'xã', 637, 'hienthi', 0, 1759490174, NULL),
(2008, 19, 0, 0, 'xa_cam_giang', 'Xã Cẩm Giàng', 'cam_giang', '2008', 'xã', 638, 'hienthi', 0, 1759490174, NULL),
(1981, 19, 0, 0, 'xa_vinh_thong', 'Xã Vĩnh Thông', 'vinh_thong', '1981', 'xã', 639, 'hienthi', 0, 1759490174, NULL),
(2014, 19, 0, 0, 'xa_bach_thong', 'Xã Bạch Thông', 'bach_thong', '2014', 'xã', 640, 'hienthi', 0, 1759490174, NULL),
(1849, 19, 0, 0, 'xa_phong_quang', 'Xã Phong Quang', 'phong_quang', '1849', 'xã', 641, 'hienthi', 0, 1759490174, NULL),
(1840, 19, 0, 0, 'phuong_duc_xuan', 'Phường Đức Xuân', 'duc_xuan', '1840', 'phường', 642, 'hienthi', 0, 1759490174, NULL),
(1843, 19, 0, 0, 'phuong_bac_kan', 'Phường Bắc Kạn', 'bac_kan', '1843', 'phường', 643, 'hienthi', 0, 1759490174, NULL),
(2143, 19, 0, 0, 'xa_van_lang', 'Xã Văn Lang', 'van_lang', '2143', 'xã', 644, 'hienthi', 0, 1759490174, NULL),
(2152, 19, 0, 0, 'xa_cuong_loi', 'Xã Cường Lợi', 'cuong_loi', '2152', 'xã', 645, 'hienthi', 0, 1759490174, NULL),
(2155, 19, 0, 0, 'xa_na_ri', 'Xã Na Rì', 'na_ri', '2155', 'xã', 646, 'hienthi', 0, 1759490174, NULL),
(2176, 19, 0, 0, 'xa_tran_phu', 'Xã Trần Phú', 'tran_phu', '2176', 'xã', 647, 'hienthi', 0, 1759490174, NULL),
(2185, 19, 0, 0, 'xa_con_minh', 'Xã Côn Minh', 'con_minh', '2185', 'xã', 648, 'hienthi', 0, 1759490174, NULL),
(2191, 19, 0, 0, 'xa_xuan_duong', 'Xã Xuân Dương', 'xuan_duong', '2191', 'xã', 649, 'hienthi', 0, 1759490174, NULL),
(2104, 19, 0, 0, 'xa_tan_ky', 'Xã Tân Kỳ', 'tan_ky', '2104', 'xã', 650, 'hienthi', 0, 1759490174, NULL),
(2101, 19, 0, 0, 'xa_thanh_mai', 'Xã Thanh Mai', 'thanh_mai', '2101', 'xã', 651, 'hienthi', 0, 1759490174, NULL),
(2107, 19, 0, 0, 'xa_thanh_thinh', 'Xã Thanh Thịnh', 'thanh_thinh', '2107', 'xã', 652, 'hienthi', 0, 1759490174, NULL),
(2086, 19, 0, 0, 'xa_cho_moi', 'Xã Chợ Mới', 'cho_moi', '2086', 'xã', 653, 'hienthi', 0, 1759490174, NULL),
(5719, 19, 0, 0, 'xa_sang_moc', 'Xã Sảng Mộc', 'sang_moc', '5719', 'xã', 654, 'hienthi', 0, 1759490174, NULL),
(1957, 19, 0, 0, 'xa_thuong_quan', 'Xã Thượng Quan', 'thuong_quan', '1957', 'xã', 655, 'hienthi', 0, 1759490174, NULL),
(6040, 20, 0, 0, 'xa_that_khe', 'Xã Thất Khê', 'that_khe', '6040', 'xã', 656, 'hienthi', 0, 1759490174, NULL),
(6001, 20, 0, 0, 'xa_doan_ket', 'Xã Đoàn Kết', 'doan_ket', '6001', 'xã', 657, 'hienthi', 0, 1759490174, NULL),
(6019, 20, 0, 0, 'xa_tan_tien', 'Xã Tân Tiến', 'tan_tien', '6019', 'xã', 658, 'hienthi', 0, 1759490174, NULL),
(6046, 20, 0, 0, 'xa_trang_dinh', 'Xã Tràng Định', 'trang_dinh', '6046', 'xã', 659, 'hienthi', 0, 1759490174, NULL),
(6016, 20, 0, 0, 'xa_quoc_khanh', 'Xã Quốc Khánh', 'quoc_khanh', '6016', 'xã', 660, 'hienthi', 0, 1759490174, NULL),
(6037, 20, 0, 0, 'xa_khang_chien', 'Xã Kháng Chiến', 'khang_chien', '6037', 'xã', 661, 'hienthi', 0, 1759490174, NULL),
(6058, 20, 0, 0, 'xa_quoc_viet', 'Xã Quốc Việt', 'quoc_viet', '6058', 'xã', 662, 'hienthi', 0, 1759490174, NULL),
(6112, 20, 0, 0, 'xa_binh_gia', 'Xã Bình Gia', 'binh_gia', '6112', 'xã', 663, 'hienthi', 0, 1759490174, NULL),
(6115, 20, 0, 0, 'xa_tan_van', 'Xã Tân Văn', 'tan_van', '6115', 'xã', 664, 'hienthi', 0, 1759490174, NULL),
(6079, 20, 0, 0, 'xa_hong_phong', 'Xã Hồng Phong', 'hong_phong', '6079', 'xã', 665, 'hienthi', 0, 1759490174, NULL),
(6073, 20, 0, 0, 'xa_hoa_tham', 'Xã Hoa Thám', 'hoa_tham', '6073', 'xã', 666, 'hienthi', 0, 1759490174, NULL),
(6076, 20, 0, 0, 'xa_quy_hoa', 'Xã Quý Hòa', 'quy_hoa', '6076', 'xã', 667, 'hienthi', 0, 1759490174, NULL),
(6085, 20, 0, 0, 'xa_thien_hoa', 'Xã Thiện Hòa', 'thien_hoa', '6085', 'xã', 668, 'hienthi', 0, 1759490174, NULL),
(6091, 20, 0, 0, 'xa_thien_thuat', 'Xã Thiện Thuật', 'thien_thuat', '6091', 'xã', 669, 'hienthi', 0, 1759490174, NULL),
(6103, 20, 0, 0, 'xa_thien_long', 'Xã Thiện Long', 'thien_long', '6103', 'xã', 670, 'hienthi', 0, 1759490174, NULL),
(6325, 20, 0, 0, 'xa_bac_son', 'Xã Bắc Sơn', 'bac_son', '6325', 'xã', 671, 'hienthi', 0, 1759490174, NULL),
(6349, 20, 0, 0, 'xa_hung_vu', 'Xã Hưng Vũ', 'hung_vu', '6349', 'xã', 672, 'hienthi', 0, 1759490174, NULL),
(6367, 20, 0, 0, 'xa_vu_lang', 'Xã Vũ Lăng', 'vu_lang', '6367', 'xã', 673, 'hienthi', 0, 1759490174, NULL),
(6376, 20, 0, 0, 'xa_nhat_hoa', 'Xã Nhất Hòa', 'nhat_hoa', '6376', 'xã', 674, 'hienthi', 0, 1759490174, NULL),
(6364, 20, 0, 0, 'xa_vu_le', 'Xã Vũ Lễ', 'vu_le', '6364', 'xã', 675, 'hienthi', 0, 1759490174, NULL),
(6337, 20, 0, 0, 'xa_tan_tri', 'Xã Tân Tri', 'tan_tri', '6337', 'xã', 676, 'hienthi', 0, 1759490174, NULL),
(6253, 20, 0, 0, 'xa_van_quan', 'Xã Văn Quan', 'van_quan', '6253', 'xã', 677, 'hienthi', 0, 1759490174, NULL),
(6280, 20, 0, 0, 'xa_diem_he', 'Xã Điềm He', 'diem_he', '6280', 'xã', 678, 'hienthi', 0, 1759490174, NULL),
(6313, 20, 0, 0, 'xa_tri_le', 'Xã Tri Lễ', 'tri_le', '6313', 'xã', 679, 'hienthi', 0, 1759490174, NULL),
(6298, 20, 0, 0, 'xa_yen_phuc', 'Xã Yên Phúc', 'yen_phuc', '6298', 'xã', 680, 'hienthi', 0, 1759490174, NULL),
(6316, 20, 0, 0, 'xa_tan_doan', 'Xã Tân Đoàn', 'tan_doan', '6316', 'xã', 681, 'hienthi', 0, 1759490174, NULL),
(6286, 20, 0, 0, 'xa_khanh_khe', 'Xã Khánh Khê', 'khanh_khe', '6286', 'xã', 682, 'hienthi', 0, 1759490174, NULL),
(6214, 20, 0, 0, 'xa_na_sam', 'Xã Na Sầm', 'na_sam', '6214', 'xã', 683, 'hienthi', 0, 1759490174, NULL),
(6154, 20, 0, 0, 'xa_van_lang', 'Xã Văn Lãng', 'van_lang', '6154', 'xã', 684, 'hienthi', 0, 1759490174, NULL),
(6151, 20, 0, 0, 'xa_hoi_hoan', 'Xã Hội Hoan', 'hoi_hoan', '6151', 'xã', 685, 'hienthi', 0, 1759490174, NULL),
(6148, 20, 0, 0, 'xa_thuy_hung', 'Xã Thụy Hùng', 'thuy_hung', '6148', 'xã', 686, 'hienthi', 0, 1759490174, NULL),
(6172, 20, 0, 0, 'xa_tan_thanh', 'Xã Tân Thanh', 'tan_thanh', '6172', 'xã', 687, 'hienthi', 0, 1759490174, NULL),
(6529, 20, 0, 0, 'xa_loc_binh', 'Xã Lộc Bình', 'loc_binh', '6529', 'xã', 688, 'hienthi', 0, 1759490174, NULL),
(6541, 20, 0, 0, 'xa_mau_son', 'Xã Mẫu Sơn', 'mau_son', '6541', 'xã', 689, 'hienthi', 0, 1759490174, NULL),
(6526, 20, 0, 0, 'xa_na_duong', 'Xã Na Dương', 'na_duong', '6526', 'xã', 690, 'hienthi', 0, 1759490174, NULL),
(6601, 20, 0, 0, 'xa_loi_bac', 'Xã Lợi Bác', 'loi_bac', '6601', 'xã', 691, 'hienthi', 0, 1759490174, NULL),
(6577, 20, 0, 0, 'xa_thong_nhat', 'Xã Thống Nhất', 'thong_nhat', '6577', 'xã', 692, 'hienthi', 0, 1759490174, NULL),
(6607, 20, 0, 0, 'xa_xuan_duong', 'Xã Xuân Dương', 'xuan_duong', '6607', 'xã', 693, 'hienthi', 0, 1759490174, NULL),
(6565, 20, 0, 0, 'xa_khuat_xa', 'Xã Khuất Xá', 'khuat_xa', '6565', 'xã', 694, 'hienthi', 0, 1759490174, NULL),
(6613, 20, 0, 0, 'xa_dinh_lap', 'Xã Đình Lập', 'dinh_lap', '6613', 'xã', 695, 'hienthi', 0, 1759490174, NULL),
(6637, 20, 0, 0, 'xa_chau_son', 'Xã Châu Sơn', 'chau_son', '6637', 'xã', 696, 'hienthi', 0, 1759490174, NULL),
(6625, 20, 0, 0, 'xa_kien_moc', 'Xã Kiên Mộc', 'kien_moc', '6625', 'xã', 697, 'hienthi', 0, 1759490174, NULL),
(6616, 20, 0, 0, 'xa_thai_binh', 'Xã Thái Bình', 'thai_binh', '6616', 'xã', 698, 'hienthi', 0, 1759490174, NULL),
(6385, 20, 0, 0, 'xa_huu_lung', 'Xã Hữu Lũng', 'huu_lung', '6385', 'xã', 699, 'hienthi', 0, 1759490174, NULL),
(6457, 20, 0, 0, 'xa_tuan_son', 'Xã Tuấn Sơn', 'tuan_son', '6457', 'xã', 700, 'hienthi', 0, 1759490174, NULL),
(6445, 20, 0, 0, 'xa_tan_thanh', 'Xã Tân Thành', 'tan_thanh', '6445', 'xã', 701, 'hienthi', 0, 1759490174, NULL),
(6415, 20, 0, 0, 'xa_van_nham', 'Xã Vân Nham', 'van_nham', '6415', 'xã', 702, 'hienthi', 0, 1759490174, NULL),
(6421, 20, 0, 0, 'xa_thien_tan', 'Xã Thiện Tân', 'thien_tan', '6421', 'xã', 703, 'hienthi', 0, 1759490174, NULL),
(6391, 20, 0, 0, 'xa_yen_binh', 'Xã Yên Bình', 'yen_binh', '6391', 'xã', 704, 'hienthi', 0, 1759490174, NULL),
(6400, 20, 0, 0, 'xa_huu_lien', 'Xã Hữu Liên', 'huu_lien', '6400', 'xã', 705, 'hienthi', 0, 1759490174, NULL),
(6427, 20, 0, 0, 'xa_cai_kinh', 'Xã Cai Kinh', 'cai_kinh', '6427', 'xã', 706, 'hienthi', 0, 1759490174, NULL),
(6463, 20, 0, 0, 'xa_chi_lang', 'Xã Chi Lăng', 'chi_lang', '6463', 'xã', 707, 'hienthi', 0, 1759490174, NULL),
(6496, 20, 0, 0, 'xa_nhan_ly', 'Xã Nhân Lý', 'nhan_ly', '6496', 'xã', 708, 'hienthi', 0, 1759490174, NULL),
(6481, 20, 0, 0, 'xa_chien_thang', 'Xã Chiến Thắng', 'chien_thang', '6481', 'xã', 709, 'hienthi', 0, 1759490174, NULL),
(6517, 20, 0, 0, 'xa_quan_son', 'Xã Quan Sơn', 'quan_son', '6517', 'xã', 710, 'hienthi', 0, 1759490174, NULL),
(6475, 20, 0, 0, 'xa_bang_mac', 'Xã Bằng Mạc', 'bang_mac', '6475', 'xã', 711, 'hienthi', 0, 1759490174, NULL),
(6505, 20, 0, 0, 'xa_van_linh', 'Xã Vạn Linh', 'van_linh', '6505', 'xã', 712, 'hienthi', 0, 1759490174, NULL),
(6184, 20, 0, 0, 'xa_dong_dang', 'Xã Đồng Đăng', 'dong_dang', '6184', 'xã', 713, 'hienthi', 0, 1759490174, NULL),
(6193, 20, 0, 0, 'xa_cao_loc', 'Xã Cao Lộc', 'cao_loc', '6193', 'xã', 714, 'hienthi', 0, 1759490174, NULL),
(6220, 20, 0, 0, 'xa_cong_son', 'Xã Công Sơn', 'cong_son', '6220', 'xã', 715, 'hienthi', 0, 1759490174, NULL),
(6202, 20, 0, 0, 'xa_ba_son', 'Xã Ba Sơn', 'ba_son', '6202', 'xã', 716, 'hienthi', 0, 1759490174, NULL),
(5986, 20, 0, 0, 'phuong_tam_thanh', 'Phường Tam Thanh', 'tam_thanh', '5986', 'phường', 717, 'hienthi', 0, 1759490174, NULL),
(5983, 20, 0, 0, 'phuong_luong_van_tri', 'Phường Lương Văn Tri', 'luong_van_tri', '5983', 'phường', 718, 'hienthi', 0, 1759490174, NULL),
(6187, 20, 0, 0, 'phuong_hoang_van_thu', 'Phường Hoàng Văn Thụ', 'hoang_van_thu', '6187', 'phường', 719, 'hienthi', 0, 1759490174, NULL),
(5977, 20, 0, 0, 'phuong_dong_kinh', 'Phường Đông Kinh', 'dong_kinh', '5977', 'phường', 720, 'hienthi', 0, 1759490174, NULL),
(7090, 22, 0, 0, 'phuong_an_sinh', 'Phường An Sinh', 'an_sinh', '7090', 'phường', 721, 'hienthi', 0, 1759490174, NULL),
(7093, 22, 0, 0, 'phuong_dong_trieu', 'Phường Đông Triều', 'dong_trieu', '7093', 'phường', 722, 'hienthi', 0, 1759490174, NULL),
(7081, 22, 0, 0, 'phuong_binh_khe', 'Phường Bình Khê', 'binh_khe', '7081', 'phường', 723, 'hienthi', 0, 1759490174, NULL),
(7069, 22, 0, 0, 'phuong_mao_khe', 'Phường Mạo Khê', 'mao_khe', '7069', 'phường', 724, 'hienthi', 0, 1759490174, NULL),
(7114, 22, 0, 0, 'phuong_hoang_que', 'Phường Hoàng Quế', 'hoang_que', '7114', 'phường', 725, 'hienthi', 0, 1759490174, NULL),
(6832, 22, 0, 0, 'phuong_yen_tu', 'Phường Yên Tử', 'yen_tu', '6832', 'phường', 726, 'hienthi', 0, 1759490174, NULL),
(6820, 22, 0, 0, 'phuong_vang_danh', 'Phường Vàng Danh', 'vang_danh', '6820', 'phường', 727, 'hienthi', 0, 1759490174, NULL),
(6811, 22, 0, 0, 'phuong_uong_bi', 'Phường Uông Bí', 'uong_bi', '6811', 'phường', 728, 'hienthi', 0, 1759490174, NULL),
(7135, 22, 0, 0, 'phuong_dong_mai', 'Phường Đông Mai', 'dong_mai', '7135', 'phường', 729, 'hienthi', 0, 1759490174, NULL),
(7147, 22, 0, 0, 'phuong_hiep_hoa', 'Phường Hiệp Hòa', 'hiep_hoa', '7147', 'phường', 730, 'hienthi', 0, 1759490174, NULL),
(7132, 22, 0, 0, 'phuong_quang_yen', 'Phường Quảng Yên', 'quang_yen', '7132', 'phường', 731, 'hienthi', 0, 1759490174, NULL),
(7168, 22, 0, 0, 'phuong_ha_an', 'Phường Hà An', 'ha_an', '7168', 'phường', 732, 'hienthi', 0, 1759490174, NULL),
(7183, 22, 0, 0, 'phuong_phong_coc', 'Phường Phong Cốc', 'phong_coc', '7183', 'phường', 733, 'hienthi', 0, 1759490174, NULL),
(7180, 22, 0, 0, 'phuong_lien_hoa', 'Phường Liên Hòa', 'lien_hoa', '7180', 'phường', 734, 'hienthi', 0, 1759490174, NULL),
(6706, 22, 0, 0, 'phuong_tuan_chau', 'Phường Tuần Châu', 'tuan_chau', '6706', 'phường', 735, 'hienthi', 0, 1759490174, NULL),
(6661, 22, 0, 0, 'phuong_viet_hung', 'Phường Việt Hưng', 'viet_hung', '6661', 'phường', 736, 'hienthi', 0, 1759490174, NULL),
(6673, 22, 0, 0, 'phuong_bai_chay', 'Phường Bãi Cháy', 'bai_chay', '6673', 'phường', 737, 'hienthi', 0, 1759490174, NULL),
(6652, 22, 0, 0, 'phuong_ha_tu', 'Phường Hà Tu', 'ha_tu', '6652', 'phường', 738, 'hienthi', 0, 1759490174, NULL),
(6676, 22, 0, 0, 'phuong_ha_lam', 'Phường Hà Lầm', 'ha_lam', '6676', 'phường', 739, 'hienthi', 0, 1759490174, NULL),
(6658, 22, 0, 0, 'phuong_cao_xanh', 'Phường Cao Xanh', 'cao_xanh', '6658', 'phường', 740, 'hienthi', 0, 1759490174, NULL),
(6685, 22, 0, 0, 'phuong_hong_gai', 'Phường Hồng Gai', 'hong_gai', '6685', 'phường', 741, 'hienthi', 0, 1759490174, NULL),
(6688, 22, 0, 0, 'phuong_ha_long', 'Phường Hạ Long', 'ha_long', '6688', 'phường', 742, 'hienthi', 0, 1759490174, NULL),
(7030, 22, 0, 0, 'phuong_hoanh_bo', 'Phường Hoành Bồ', 'hoanh_bo', '7030', 'phường', 743, 'hienthi', 0, 1759490174, NULL),
(7054, 22, 0, 0, 'xa_quang_la', 'Xã Quảng La', 'quang_la', '7054', 'xã', 744, 'hienthi', 0, 1759490174, NULL),
(7060, 22, 0, 0, 'xa_thong_nhat', 'Xã Thống Nhất', 'thong_nhat', '7060', 'xã', 745, 'hienthi', 0, 1759490174, NULL),
(6760, 22, 0, 0, 'phuong_mong_duong', 'Phường Mông Dương', 'mong_duong', '6760', 'phường', 746, 'hienthi', 0, 1759490174, NULL),
(6778, 22, 0, 0, 'phuong_quang_hanh', 'Phường Quang Hanh', 'quang_hanh', '6778', 'phường', 747, 'hienthi', 0, 1759490174, NULL),
(6793, 22, 0, 0, 'phuong_cam_pha', 'Phường Cẩm Phả', 'cam_pha', '6793', 'phường', 748, 'hienthi', 0, 1759490174, NULL),
(6781, 22, 0, 0, 'phuong_cua_ong', 'Phường Cửa Ông', 'cua_ong', '6781', 'phường', 749, 'hienthi', 0, 1759490174, NULL),
(6799, 22, 0, 0, 'xa_hai_hoa', 'Xã Hải Hòa', 'hai_hoa', '6799', 'xã', 750, 'hienthi', 0, 1759490174, NULL),
(6862, 22, 0, 0, 'xa_tien_yen', 'Xã Tiên Yên', 'tien_yen', '6862', 'xã', 751, 'hienthi', 0, 1759490174, NULL),
(6874, 22, 0, 0, 'xa_dien_xa', 'Xã Điền Xá', 'dien_xa', '6874', 'xã', 752, 'hienthi', 0, 1759490174, NULL),
(6877, 22, 0, 0, 'xa_dong_ngu', 'Xã Đông Ngũ', 'dong_ngu', '6877', 'xã', 753, 'hienthi', 0, 1759490174, NULL),
(6886, 22, 0, 0, 'xa_hai_lang', 'Xã Hải Lạng', 'hai_lang', '6886', 'xã', 754, 'hienthi', 0, 1759490174, NULL),
(6985, 22, 0, 0, 'xa_luong_minh', 'Xã Lương Minh', 'luong_minh', '6985', 'xã', 755, 'hienthi', 0, 1759490174, NULL),
(6979, 22, 0, 0, 'xa_ky_thuong', 'Xã Kỳ Thượng', 'ky_thuong', '6979', 'xã', 756, 'hienthi', 0, 1759490174, NULL),
(6970, 22, 0, 0, 'xa_ba_che', 'Xã Ba Chẽ', 'ba_che', '6970', 'xã', 757, 'hienthi', 0, 1759490174, NULL),
(6913, 22, 0, 0, 'xa_quang_tan', 'Xã Quảng Tân', 'quang_tan', '6913', 'xã', 758, 'hienthi', 0, 1759490174, NULL),
(6895, 22, 0, 0, 'xa_dam_ha', 'Xã Đầm Hà', 'dam_ha', '6895', 'xã', 759, 'hienthi', 0, 1759490174, NULL),
(6922, 22, 0, 0, 'xa_quang_ha', 'Xã Quảng Hà', 'quang_ha', '6922', 'xã', 760, 'hienthi', 0, 1759490174, NULL),
(6946, 22, 0, 0, 'xa_duong_hoa', 'Xã Đường Hoa', 'duong_hoa', '6946', 'xã', 761, 'hienthi', 0, 1759490174, NULL),
(6931, 22, 0, 0, 'xa_quang_duc', 'Xã Quảng Đức', 'quang_duc', '6931', 'xã', 762, 'hienthi', 0, 1759490174, NULL),
(6841, 22, 0, 0, 'xa_hoanh_mo', 'Xã Hoành Mô', 'hoanh_mo', '6841', 'xã', 763, 'hienthi', 0, 1759490174, NULL),
(6856, 22, 0, 0, 'xa_luc_hon', 'Xã Lục Hồn', 'luc_hon', '6856', 'xã', 764, 'hienthi', 0, 1759490174, NULL),
(6838, 22, 0, 0, 'xa_binh_lieu', 'Xã Bình Liêu', 'binh_lieu', '6838', 'xã', 765, 'hienthi', 0, 1759490174, NULL),
(6724, 22, 0, 0, 'xa_hai_son', 'Xã Hải Sơn', 'hai_son', '6724', 'xã', 766, 'hienthi', 0, 1759490174, NULL),
(6733, 22, 0, 0, 'xa_hai_ninh', 'Xã Hải Ninh', 'hai_ninh', '6733', 'xã', 767, 'hienthi', 0, 1759490174, NULL),
(6757, 22, 0, 0, 'xa_vinh_thuc', 'Xã Vĩnh Thực', 'vinh_thuc', '6757', 'xã', 768, 'hienthi', 0, 1759490174, NULL),
(6712, 22, 0, 0, 'phuong_mong_cai_1', 'Phường Móng Cái 1', 'mong_cai_1', '6712', 'phường', 769, 'hienthi', 0, 1759490174, NULL),
(6709, 22, 0, 0, 'phuong_mong_cai_2', 'Phường Móng Cái 2', 'mong_cai_2', '6709', 'phường', 770, 'hienthi', 0, 1759490174, NULL),
(6736, 22, 0, 0, 'phuong_mong_cai_3', 'Phường Móng Cái 3', 'mong_cai_3', '6736', 'phường', 771, 'hienthi', 0, 1759490174, NULL),
(6994, 22, 0, 0, 'dac_khu_van_don', 'Đặc khu Vân Đồn', 'van_don', '6994', 'đặc khu', 772, 'hienthi', 0, 1759490174, NULL),
(7192, 22, 0, 0, 'dac_khu_co_to', 'Đặc khu Cô Tô', 'co_to', '7192', 'đặc khu', 773, 'hienthi', 0, 1759490174, NULL),
(6967, 22, 0, 0, 'xa_cai_chien', 'Xã Cái Chiên', 'cai_chien', '6967', 'xã', 774, 'hienthi', 0, 1759490174, NULL),
(7627, 24, 0, 0, 'xa_dai_son', 'Xã Đại Sơn', 'dai_son', '7627', 'xã', 775, 'hienthi', 0, 1759490174, NULL),
(7615, 24, 0, 0, 'xa_son_dong', 'Xã Sơn Động', 'son_dong', '7615', 'xã', 776, 'hienthi', 0, 1759490174, NULL),
(7616, 24, 0, 0, 'xa_tay_yen_tu', 'Xã Tây Yên Tử', 'tay_yen_tu', '7616', 'xã', 777, 'hienthi', 0, 1759490174, NULL),
(7672, 24, 0, 0, 'xa_duong_huu', 'Xã Dương Hưu', 'duong_huu', '7672', 'xã', 778, 'hienthi', 0, 1759490174, NULL),
(7642, 24, 0, 0, 'xa_yen_dinh', 'Xã Yên Định', 'yen_dinh', '7642', 'xã', 779, 'hienthi', 0, 1759490174, NULL),
(7654, 24, 0, 0, 'xa_an_lac', 'Xã An Lạc', 'an_lac', '7654', 'xã', 780, 'hienthi', 0, 1759490174, NULL),
(7621, 24, 0, 0, 'xa_van_son', 'Xã Vân Sơn', 'van_son', '7621', 'xã', 781, 'hienthi', 0, 1759490174, NULL),
(7573, 24, 0, 0, 'xa_bien_dong', 'Xã Biển Động', 'bien_dong', '7573', 'xã', 782, 'hienthi', 0, 1759490174, NULL),
(7582, 24, 0, 0, 'xa_luc_ngan', 'Xã Lục Ngạn', 'luc_ngan', '7582', 'xã', 783, 'hienthi', 0, 1759490174, NULL),
(7594, 24, 0, 0, 'xa_deo_gia', 'Xã Đèo Gia', 'deo_gia', '7594', 'xã', 784, 'hienthi', 0, 1759490174, NULL),
(7543, 24, 0, 0, 'xa_son_hai', 'Xã Sơn Hải', 'son_hai', '7543', 'xã', 785, 'hienthi', 0, 1759490174, NULL),
(7531, 24, 0, 0, 'xa_tan_son', 'Xã Tân Sơn', 'tan_son', '7531', 'xã', 786, 'hienthi', 0, 1759490174, NULL),
(7537, 24, 0, 0, 'xa_bien_son', 'Xã Biên Sơn', 'bien_son', '7537', 'xã', 787, 'hienthi', 0, 1759490174, NULL),
(7534, 24, 0, 0, 'xa_sa_ly', 'Xã Sa Lý', 'sa_ly', '7534', 'xã', 788, 'hienthi', 0, 1759490174, NULL),
(7603, 24, 0, 0, 'xa_nam_duong', 'Xã Nam Dương', 'nam_duong', '7603', 'xã', 789, 'hienthi', 0, 1759490174, NULL),
(7552, 24, 0, 0, 'xa_kien_lao', 'Xã Kiên Lao', 'kien_lao', '7552', 'xã', 790, 'hienthi', 0, 1759490174, NULL),
(7525, 24, 0, 0, 'phuong_chu', 'Phường Chũ', 'chu', '7525', 'phường', 791, 'hienthi', 0, 1759490174, NULL),
(7612, 24, 0, 0, 'phuong_phuong_son', 'Phường Phượng Sơn', 'phuong_son', '7612', 'phường', 792, 'hienthi', 0, 1759490174, NULL),
(7492, 24, 0, 0, 'xa_luc_son', 'Xã Lục Sơn', 'luc_son', '7492', 'xã', 793, 'hienthi', 0, 1759490174, NULL),
(7489, 24, 0, 0, 'xa_truong_son', 'Xã Trường Sơn', 'truong_son', '7489', 'xã', 794, 'hienthi', 0, 1759490174, NULL),
(7519, 24, 0, 0, 'xa_cam_ly', 'Xã Cẩm Lý', 'cam_ly', '7519', 'xã', 795, 'hienthi', 0, 1759490174, NULL),
(7450, 24, 0, 0, 'xa_dong_phu', 'Xã Đông Phú', 'dong_phu', '7450', 'xã', 796, 'hienthi', 0, 1759490174, NULL),
(7486, 24, 0, 0, 'xa_nghia_phuong', 'Xã Nghĩa Phương', 'nghia_phuong', '7486', 'xã', 797, 'hienthi', 0, 1759490174, NULL),
(7444, 24, 0, 0, 'xa_luc_nam', 'Xã Lục Nam', 'luc_nam', '7444', 'xã', 798, 'hienthi', 0, 1759490174, NULL),
(7498, 24, 0, 0, 'xa_bac_lung', 'Xã Bắc Lũng', 'bac_lung', '7498', 'xã', 799, 'hienthi', 0, 1759490174, NULL),
(7462, 24, 0, 0, 'xa_bao_dai', 'Xã Bảo Đài', 'bao_dai', '7462', 'xã', 800, 'hienthi', 0, 1759490174, NULL),
(7375, 24, 0, 0, 'xa_lang_giang', 'Xã Lạng Giang', 'lang_giang', '7375', 'xã', 801, 'hienthi', 0, 1759490174, NULL),
(7420, 24, 0, 0, 'xa_my_thai', 'Xã Mỹ Thái', 'my_thai', '7420', 'xã', 802, 'hienthi', 0, 1759490174, NULL),
(7399, 24, 0, 0, 'xa_kep', 'Xã Kép', 'kep', '7399', 'xã', 803, 'hienthi', 0, 1759490174, NULL),
(7432, 24, 0, 0, 'xa_tan_dinh', 'Xã Tân Dĩnh', 'tan_dinh', '7432', 'xã', 804, 'hienthi', 0, 1759490174, NULL),
(7381, 24, 0, 0, 'xa_tien_luc', 'Xã Tiên Lục', 'tien_luc', '7381', 'xã', 805, 'hienthi', 0, 1759490174, NULL),
(7288, 24, 0, 0, 'xa_yen_the', 'Xã Yên Thế', 'yen_the', '7288', 'xã', 806, 'hienthi', 0, 1759490174, NULL),
(7294, 24, 0, 0, 'xa_bo_ha', 'Xã Bố Hạ', 'bo_ha', '7294', 'xã', 807, 'hienthi', 0, 1759490174, NULL),
(7282, 24, 0, 0, 'xa_dong_ky', 'Xã Đồng Kỳ', 'dong_ky', '7282', 'xã', 808, 'hienthi', 0, 1759490174, NULL),
(7246, 24, 0, 0, 'xa_xuan_luong', 'Xã Xuân Lương', 'xuan_luong', '7246', 'xã', 809, 'hienthi', 0, 1759490174, NULL),
(7264, 24, 0, 0, 'xa_tam_tien', 'Xã Tam Tiến', 'tam_tien', '7264', 'xã', 810, 'hienthi', 0, 1759490174, NULL),
(7339, 24, 0, 0, 'xa_tan_yen', 'Xã Tân Yên', 'tan_yen', '7339', 'xã', 811, 'hienthi', 0, 1759490174, NULL),
(7351, 24, 0, 0, 'xa_ngoc_thien', 'Xã Ngọc Thiện', 'ngoc_thien', '7351', 'xã', 812, 'hienthi', 0, 1759490174, NULL),
(7306, 24, 0, 0, 'xa_nha_nam', 'Xã Nhã Nam', 'nha_nam', '7306', 'xã', 813, 'hienthi', 0, 1759490174, NULL),
(7330, 24, 0, 0, 'xa_phuc_hoa', 'Xã Phúc Hòa', 'phuc_hoa', '7330', 'xã', 814, 'hienthi', 0, 1759490174, NULL),
(7333, 24, 0, 0, 'xa_quang_trung', 'Xã Quang Trung', 'quang_trung', '7333', 'xã', 815, 'hienthi', 0, 1759490174, NULL),
(7864, 24, 0, 0, 'xa_hop_thinh', 'Xã Hợp Thịnh', 'hop_thinh', '7864', 'xã', 816, 'hienthi', 0, 1759490174, NULL),
(7840, 24, 0, 0, 'xa_hiep_hoa', 'Xã Hiệp Hoà', 'hiep_hoa', '7840', 'xã', 817, 'hienthi', 0, 1759490174, NULL),
(7822, 24, 0, 0, 'xa_hoang_van', 'Xã Hoàng Vân', 'hoang_van', '7822', 'xã', 818, 'hienthi', 0, 1759490174, NULL),
(7870, 24, 0, 0, 'xa_xuan_cam', 'Xã Xuân Cẩm', 'xuan_cam', '7870', 'xã', 819, 'hienthi', 0, 1759490174, NULL),
(7774, 24, 0, 0, 'phuong_tu_lan', 'Phường Tự Lạn', 'tu_lan', '7774', 'phường', 820, 'hienthi', 0, 1759490174, NULL),
(7777, 24, 0, 0, 'phuong_viet_yen', 'Phường Việt Yên', 'viet_yen', '7777', 'phường', 821, 'hienthi', 0, 1759490174, NULL),
(7795, 24, 0, 0, 'phuong_nenh', 'Phường Nếnh', 'nenh', '7795', 'phường', 822, 'hienthi', 0, 1759490174, NULL),
(7798, 24, 0, 0, 'phuong_van_ha', 'Phường Vân Hà', 'van_ha', '7798', 'phường', 823, 'hienthi', 0, 1759490174, NULL),
(7735, 24, 0, 0, 'xa_dong_viet', 'Xã Đồng Việt', 'dong_viet', '7735', 'xã', 824, 'hienthi', 0, 1759490174, NULL),
(7210, 24, 0, 0, 'phuong_bac_giang', 'Phường Bắc Giang', 'bac_giang', '7210', 'phường', 825, 'hienthi', 0, 1759490174, NULL),
(7228, 24, 0, 0, 'phuong_da_mai', 'Phường Đa Mai', 'da_mai', '7228', 'phường', 826, 'hienthi', 0, 1759490174, NULL),
(7696, 24, 0, 0, 'phuong_tien_phong', 'Phường Tiền Phong', 'tien_phong', '7696', 'phường', 827, 'hienthi', 0, 1759490174, NULL),
(7682, 24, 0, 0, 'phuong_tan_an', 'Phường Tân An', 'tan_an', '7682', 'phường', 828, 'hienthi', 0, 1759490174, NULL),
(7681, 24, 0, 0, 'phuong_yen_dung', 'Phường Yên Dũng', 'yen_dung', '7681', 'phường', 829, 'hienthi', 0, 1759490174, NULL),
(7699, 24, 0, 0, 'phuong_tan_tien', 'Phường Tân Tiến', 'tan_tien', '7699', 'phường', 830, 'hienthi', 0, 1759490174, NULL),
(7738, 24, 0, 0, 'phuong_canh_thuy', 'Phường Cảnh Thụy', 'canh_thuy', '7738', 'phường', 831, 'hienthi', 0, 1759490174, NULL),
(9187, 24, 0, 0, 'phuong_kinh_bac', 'Phường Kinh Bắc', 'kinh_bac', '9187', 'phường', 832, 'hienthi', 0, 1759490174, NULL),
(9190, 24, 0, 0, 'phuong_vo_cuong', 'Phường Võ Cường', 'vo_cuong', '9190', 'phường', 833, 'hienthi', 0, 1759490174, NULL),
(9169, 24, 0, 0, 'phuong_vu_ninh', 'Phường Vũ Ninh', 'vu_ninh', '9169', 'phường', 834, 'hienthi', 0, 1759490174, NULL),
(9325, 24, 0, 0, 'phuong_hap_linh', 'Phường Hạp Lĩnh', 'hap_linh', '9325', 'phường', 835, 'hienthi', 0, 1759490174, NULL),
(9286, 24, 0, 0, 'phuong_nam_son', 'Phường Nam Sơn', 'nam_son', '9286', 'phường', 836, 'hienthi', 0, 1759490174, NULL),
(9367, 24, 0, 0, 'phuong_tu_son', 'Phường Từ Sơn', 'tu_son', '9367', 'phường', 837, 'hienthi', 0, 1759490174, NULL),
(9376, 24, 0, 0, 'phuong_tam_son', 'Phường Tam Sơn', 'tam_son', '9376', 'phường', 838, 'hienthi', 0, 1759490174, NULL),
(9382, 24, 0, 0, 'phuong_dong_nguyen', 'Phường Đồng Nguyên', 'dong_nguyen', '9382', 'phường', 839, 'hienthi', 0, 1759490174, NULL),
(9373, 24, 0, 0, 'phuong_phu_khe', 'Phường Phù Khê', 'phu_khe', '9373', 'phường', 840, 'hienthi', 0, 1759490174, NULL),
(9400, 24, 0, 0, 'phuong_thuan_thanh', 'Phường Thuận Thành', 'thuan_thanh', '9400', 'phường', 841, 'hienthi', 0, 1759490174, NULL),
(9409, 24, 0, 0, 'phuong_mao_dien', 'Phường Mão Điền', 'mao_dien', '9409', 'phường', 842, 'hienthi', 0, 1759490174, NULL),
(9430, 24, 0, 0, 'phuong_tram_lo', 'Phường Trạm Lộ', 'tram_lo', '9430', 'phường', 843, 'hienthi', 0, 1759490174, NULL),
(9427, 24, 0, 0, 'phuong_tri_qua', 'Phường Trí Quả', 'tri_qua', '9427', 'phường', 844, 'hienthi', 0, 1759490174, NULL),
(9433, 24, 0, 0, 'phuong_song_lieu', 'Phường Song Liễu', 'song_lieu', '9433', 'phường', 845, 'hienthi', 0, 1759490174, NULL),
(9445, 24, 0, 0, 'phuong_ninh_xa', 'Phường Ninh Xá', 'ninh_xa', '9445', 'phường', 846, 'hienthi', 0, 1759490174, NULL),
(9247, 24, 0, 0, 'phuong_que_vo', 'Phường Quế Võ', 'que_vo', '9247', 'phường', 847, 'hienthi', 0, 1759490174, NULL),
(9265, 24, 0, 0, 'phuong_phuong_lieu', 'Phường Phương Liễu', 'phuong_lieu', '9265', 'phường', 848, 'hienthi', 0, 1759490174, NULL),
(9253, 24, 0, 0, 'phuong_nhan_hoa', 'Phường Nhân Hòa', 'nhan_hoa', '9253', 'phường', 849, 'hienthi', 0, 1759490174, NULL),
(9301, 24, 0, 0, 'phuong_dao_vien', 'Phường Đào Viên', 'dao_vien', '9301', 'phường', 850, 'hienthi', 0, 1759490174, NULL),
(9295, 24, 0, 0, 'phuong_bong_lai', 'Phường Bồng Lai', 'bong_lai', '9295', 'phường', 851, 'hienthi', 0, 1759490174, NULL),
(9313, 24, 0, 0, 'xa_chi_lang', 'Xã Chi Lăng', 'chi_lang', '9313', 'xã', 852, 'hienthi', 0, 1759490174, NULL),
(9292, 24, 0, 0, 'xa_phu_lang', 'Xã Phù Lãng', 'phu_lang', '9292', 'xã', 853, 'hienthi', 0, 1759490174, NULL),
(9193, 24, 0, 0, 'xa_yen_phong', 'Xã Yên Phong', 'yen_phong', '9193', 'xã', 854, 'hienthi', 0, 1759490174, NULL),
(9238, 24, 0, 0, 'xa_van_mon', 'Xã Văn Môn', 'van_mon', '9238', 'xã', 855, 'hienthi', 0, 1759490174, NULL),
(9202, 24, 0, 0, 'xa_tam_giang', 'Xã Tam Giang', 'tam_giang', '9202', 'xã', 856, 'hienthi', 0, 1759490174, NULL),
(9205, 24, 0, 0, 'xa_yen_trung', 'Xã Yên Trung', 'yen_trung', '9205', 'xã', 857, 'hienthi', 0, 1759490174, NULL),
(9208, 24, 0, 0, 'xa_tam_da', 'Xã Tam Đa', 'tam_da', '9208', 'xã', 858, 'hienthi', 0, 1759490174, NULL),
(9319, 24, 0, 0, 'xa_tien_du', 'Xã Tiên Du', 'tien_du', '9319', 'xã', 859, 'hienthi', 0, 1759490174, NULL),
(9334, 24, 0, 0, 'xa_lien_bao', 'Xã Liên Bão', 'lien_bao', '9334', 'xã', 860, 'hienthi', 0, 1759490174, NULL),
(9343, 24, 0, 0, 'xa_tan_chi', 'Xã Tân Chi', 'tan_chi', '9343', 'xã', 861, 'hienthi', 0, 1759490174, NULL),
(9340, 24, 0, 0, 'xa_dai_dong', 'Xã Đại Đồng', 'dai_dong', '9340', 'xã', 862, 'hienthi', 0, 1759490174, NULL),
(9349, 24, 0, 0, 'xa_phat_tich', 'Xã Phật Tích', 'phat_tich', '9349', 'xã', 863, 'hienthi', 0, 1759490174, NULL),
(9454, 24, 0, 0, 'xa_gia_binh', 'Xã Gia Bình', 'gia_binh', '9454', 'xã', 864, 'hienthi', 0, 1759490174, NULL),
(9475, 24, 0, 0, 'xa_nhan_thang', 'Xã Nhân Thắng', 'nhan_thang', '9475', 'xã', 865, 'hienthi', 0, 1759490174, NULL),
(9469, 24, 0, 0, 'xa_dai_lai', 'Xã Đại Lai', 'dai_lai', '9469', 'xã', 866, 'hienthi', 0, 1759490174, NULL),
(9466, 24, 0, 0, 'xa_cao_duc', 'Xã Cao Đức', 'cao_duc', '9466', 'xã', 867, 'hienthi', 0, 1759490174, NULL),
(9487, 24, 0, 0, 'xa_dong_cuu', 'Xã Đông Cứu', 'dong_cuu', '9487', 'xã', 868, 'hienthi', 0, 1759490174, NULL),
(9496, 24, 0, 0, 'xa_luong_tai', 'Xã Lương Tài', 'luong_tai', '9496', 'xã', 869, 'hienthi', 0, 1759490174, NULL),
(9529, 24, 0, 0, 'xa_lam_thao', 'Xã Lâm Thao', 'lam_thao', '9529', 'xã', 870, 'hienthi', 0, 1759490174, NULL),
(9523, 24, 0, 0, 'xa_trung_chinh', 'Xã Trung Chính', 'trung_chinh', '9523', 'xã', 871, 'hienthi', 0, 1759490174, NULL),
(9499, 24, 0, 0, 'xa_trung_kenh', 'Xã Trung Kênh', 'trung_kenh', '9499', 'xã', 872, 'hienthi', 0, 1759490174, NULL),
(7663, 24, 0, 0, 'xa_tuan_dao', 'Xã Tuấn Đạo', 'tuan_dao', '7663', 'xã', 873, 'hienthi', 0, 1759490174, NULL),
(7900, 25, 0, 0, 'phuong_viet_tri', 'Phường Việt Trì', 'viet_tri', '7900', 'phường', 874, 'hienthi', 0, 1759490174, NULL),
(7894, 25, 0, 0, 'phuong_nong_trang', 'Phường Nông Trang', 'nong_trang', '7894', 'phường', 875, 'hienthi', 0, 1759490174, NULL),
(7909, 25, 0, 0, 'phuong_thanh_mieu', 'Phường Thanh Miếu', 'thanh_mieu', '7909', 'phường', 876, 'hienthi', 0, 1759490174, NULL),
(7918, 25, 0, 0, 'phuong_van_phu', 'Phường Vân Phú', 'van_phu', '7918', 'phường', 877, 'hienthi', 0, 1759490174, NULL),
(8515, 25, 0, 0, 'xa_hy_cuong', 'Xã Hy Cương', 'hy_cuong', '8515', 'xã', 878, 'hienthi', 0, 1759490174, NULL),
(8494, 25, 0, 0, 'xa_lam_thao', 'Xã Lâm Thao', 'lam_thao', '8494', 'xã', 879, 'hienthi', 0, 1759490174, NULL),
(8497, 25, 0, 0, 'xa_xuan_lung', 'Xã Xuân Lũng', 'xuan_lung', '8497', 'xã', 880, 'hienthi', 0, 1759490174, NULL),
(8521, 25, 0, 0, 'xa_phung_nguyen', 'Xã Phùng Nguyên', 'phung_nguyen', '8521', 'xã', 881, 'hienthi', 0, 1759490174, NULL),
(8527, 25, 0, 0, 'xa_ban_nguyen', 'Xã Bản Nguyên', 'ban_nguyen', '8527', 'xã', 882, 'hienthi', 0, 1759490174, NULL),
(7954, 25, 0, 0, 'phuong_phong_chau', 'Phường Phong Châu', 'phong_chau', '7954', 'phường', 883, 'hienthi', 0, 1759490174, NULL),
(7942, 25, 0, 0, 'phuong_phu_tho', 'Phường Phú Thọ', 'phu_tho', '7942', 'phường', 884, 'hienthi', 0, 1759490174, NULL),
(7948, 25, 0, 0, 'phuong_au_co', 'Phường Âu Cơ', 'au_co', '7948', 'phường', 885, 'hienthi', 0, 1759490174, NULL),
(8230, 25, 0, 0, 'xa_phu_ninh', 'Xã Phù Ninh', 'phu_ninh', '8230', 'xã', 886, 'hienthi', 0, 1759490174, NULL),
(8254, 25, 0, 0, 'xa_dan_chu', 'Xã Dân Chủ', 'dan_chu', '8254', 'xã', 887, 'hienthi', 0, 1759490174, NULL),
(8236, 25, 0, 0, 'xa_phu_my', 'Xã Phú Mỹ', 'phu_my', '8236', 'xã', 888, 'hienthi', 0, 1759490174, NULL),
(8245, 25, 0, 0, 'xa_tram_than', 'Xã Trạm Thản', 'tram_than', '8245', 'xã', 889, 'hienthi', 0, 1759490174, NULL),
(8275, 25, 0, 0, 'xa_binh_phu', 'Xã Bình Phú', 'binh_phu', '8275', 'xã', 890, 'hienthi', 0, 1759490174, NULL),
(8152, 25, 0, 0, 'xa_thanh_ba', 'Xã Thanh Ba', 'thanh_ba', '8152', 'xã', 891, 'hienthi', 0, 1759490174, NULL);
INSERT INTO `table_ward` (`id`, `id_city`, `id_district`, `districtid`, `wardcode`, `name`, `slug`, `code`, `level`, `numb`, `status`, `date_updated`, `date_created`, `ship_price`) VALUES
(8161, 25, 0, 0, 'xa_quang_yen', 'Xã Quảng Yên', 'quang_yen', '8161', 'xã', 892, 'hienthi', 0, 1759490174, NULL),
(8203, 25, 0, 0, 'xa_hoang_cuong', 'Xã Hoàng Cương', 'hoang_cuong', '8203', 'xã', 893, 'hienthi', 0, 1759490174, NULL),
(8209, 25, 0, 0, 'xa_dong_thanh', 'Xã Đông Thành', 'dong_thanh', '8209', 'xã', 894, 'hienthi', 0, 1759490174, NULL),
(8215, 25, 0, 0, 'xa_chi_tien', 'Xã Chí Tiên', 'chi_tien', '8215', 'xã', 895, 'hienthi', 0, 1759490174, NULL),
(8227, 25, 0, 0, 'xa_lien_minh', 'Xã Liên Minh', 'lien_minh', '8227', 'xã', 896, 'hienthi', 0, 1759490174, NULL),
(7969, 25, 0, 0, 'xa_doan_hung', 'Xã Đoan Hùng', 'doan_hung', '7969', 'xã', 897, 'hienthi', 0, 1759490174, NULL),
(8023, 25, 0, 0, 'xa_tay_coc', 'Xã Tây Cốc', 'tay_coc', '8023', 'xã', 898, 'hienthi', 0, 1759490174, NULL),
(8035, 25, 0, 0, 'xa_chan_mong', 'Xã Chân Mộng', 'chan_mong', '8035', 'xã', 899, 'hienthi', 0, 1759490174, NULL),
(7999, 25, 0, 0, 'xa_chi_dam', 'Xã Chí Đám', 'chi_dam', '7999', 'xã', 900, 'hienthi', 0, 1759490174, NULL),
(7996, 25, 0, 0, 'xa_bang_luan', 'Xã Bằng Luân', 'bang_luan', '7996', 'xã', 901, 'hienthi', 0, 1759490174, NULL),
(8053, 25, 0, 0, 'xa_ha_hoa', 'Xã Hạ Hòa', 'ha_hoa', '8053', 'xã', 902, 'hienthi', 0, 1759490174, NULL),
(8071, 25, 0, 0, 'xa_dan_thuong', 'Xã Đan Thượng', 'dan_thuong', '8071', 'xã', 903, 'hienthi', 0, 1759490174, NULL),
(8113, 25, 0, 0, 'xa_yen_ky', 'Xã Yên Kỳ', 'yen_ky', '8113', 'xã', 904, 'hienthi', 0, 1759490174, NULL),
(8143, 25, 0, 0, 'xa_vinh_chan', 'Xã Vĩnh Chân', 'vinh_chan', '8143', 'xã', 905, 'hienthi', 0, 1759490174, NULL),
(8134, 25, 0, 0, 'xa_van_lang', 'Xã Văn Lang', 'van_lang', '8134', 'xã', 906, 'hienthi', 0, 1759490174, NULL),
(8110, 25, 0, 0, 'xa_hien_luong', 'Xã Hiền Lương', 'hien_luong', '8110', 'xã', 907, 'hienthi', 0, 1759490174, NULL),
(8341, 25, 0, 0, 'xa_cam_khe', 'Xã Cẩm Khê', 'cam_khe', '8341', 'xã', 908, 'hienthi', 0, 1759490174, NULL),
(8398, 25, 0, 0, 'xa_phu_khe', 'Xã Phú Khê', 'phu_khe', '8398', 'xã', 909, 'hienthi', 0, 1759490174, NULL),
(8416, 25, 0, 0, 'xa_hung_viet', 'Xã Hùng Việt', 'hung_viet', '8416', 'xã', 910, 'hienthi', 0, 1759490174, NULL),
(8431, 25, 0, 0, 'xa_dong_luong', 'Xã Đồng Lương', 'dong_luong', '8431', 'xã', 911, 'hienthi', 0, 1759490174, NULL),
(8344, 25, 0, 0, 'xa_tien_luong', 'Xã Tiên Lương', 'tien_luong', '8344', 'xã', 912, 'hienthi', 0, 1759490174, NULL),
(8380, 25, 0, 0, 'xa_van_ban', 'Xã Vân Bán', 'van_ban', '8380', 'xã', 913, 'hienthi', 0, 1759490174, NULL),
(8434, 25, 0, 0, 'xa_tam_nong', 'Xã Tam Nông', 'tam_nong', '8434', 'xã', 914, 'hienthi', 0, 1759490174, NULL),
(8479, 25, 0, 0, 'xa_tho_van', 'Xã Thọ Văn', 'tho_van', '8479', 'xã', 915, 'hienthi', 0, 1759490174, NULL),
(8461, 25, 0, 0, 'xa_van_xuan', 'Xã Vạn Xuân', 'van_xuan', '8461', 'xã', 916, 'hienthi', 0, 1759490174, NULL),
(8443, 25, 0, 0, 'xa_hien_quan', 'Xã Hiền Quan', 'hien_quan', '8443', 'xã', 917, 'hienthi', 0, 1759490174, NULL),
(8674, 25, 0, 0, 'xa_thanh_thuy', 'Xã Thanh Thuỷ', 'thanh_thuy', '8674', 'xã', 918, 'hienthi', 0, 1759490174, NULL),
(8662, 25, 0, 0, 'xa_dao_xa', 'Xã Đào Xá', 'dao_xa', '8662', 'xã', 919, 'hienthi', 0, 1759490174, NULL),
(8686, 25, 0, 0, 'xa_tu_vu', 'Xã Tu Vũ', 'tu_vu', '8686', 'xã', 920, 'hienthi', 0, 1759490174, NULL),
(8542, 25, 0, 0, 'xa_thanh_son', 'Xã Thanh Sơn', 'thanh_son', '8542', 'xã', 921, 'hienthi', 0, 1759490174, NULL),
(8584, 25, 0, 0, 'xa_vo_mieu', 'Xã Võ Miếu', 'vo_mieu', '8584', 'xã', 922, 'hienthi', 0, 1759490174, NULL),
(8611, 25, 0, 0, 'xa_van_mieu', 'Xã Văn Miếu', 'van_mieu', '8611', 'xã', 923, 'hienthi', 0, 1759490174, NULL),
(8614, 25, 0, 0, 'xa_cu_dong', 'Xã Cự Đồng', 'cu_dong', '8614', 'xã', 924, 'hienthi', 0, 1759490174, NULL),
(8632, 25, 0, 0, 'xa_huong_can', 'Xã Hương Cần', 'huong_can', '8632', 'xã', 925, 'hienthi', 0, 1759490174, NULL),
(8656, 25, 0, 0, 'xa_yen_son', 'Xã Yên Sơn', 'yen_son', '8656', 'xã', 926, 'hienthi', 0, 1759490174, NULL),
(8635, 25, 0, 0, 'xa_kha_cuu', 'Xã Khả Cửu', 'kha_cuu', '8635', 'xã', 927, 'hienthi', 0, 1759490174, NULL),
(8566, 25, 0, 0, 'xa_tan_son', 'Xã Tân Sơn', 'tan_son', '8566', 'xã', 928, 'hienthi', 0, 1759490174, NULL),
(8593, 25, 0, 0, 'xa_minh_dai', 'Xã Minh Đài', 'minh_dai', '8593', 'xã', 929, 'hienthi', 0, 1759490174, NULL),
(8560, 25, 0, 0, 'xa_lai_dong', 'Xã Lai Đồng', 'lai_dong', '8560', 'xã', 930, 'hienthi', 0, 1759490174, NULL),
(8545, 25, 0, 0, 'xa_thu_cuc', 'Xã Thu Cúc', 'thu_cuc', '8545', 'xã', 931, 'hienthi', 0, 1759490174, NULL),
(8590, 25, 0, 0, 'xa_xuan_dai', 'Xã Xuân Đài', 'xuan_dai', '8590', 'xã', 932, 'hienthi', 0, 1759490174, NULL),
(8620, 25, 0, 0, 'xa_long_coc', 'Xã Long Cốc', 'long_coc', '8620', 'xã', 933, 'hienthi', 0, 1759490174, NULL),
(8290, 25, 0, 0, 'xa_yen_lap', 'Xã Yên Lập', 'yen_lap', '8290', 'xã', 934, 'hienthi', 0, 1759490174, NULL),
(8323, 25, 0, 0, 'xa_thuong_long', 'Xã Thượng Long', 'thuong_long', '8323', 'xã', 935, 'hienthi', 0, 1759490174, NULL),
(8296, 25, 0, 0, 'xa_son_luong', 'Xã Sơn Lương', 'son_luong', '8296', 'xã', 936, 'hienthi', 0, 1759490174, NULL),
(8305, 25, 0, 0, 'xa_xuan_vien', 'Xã Xuân Viên', 'xuan_vien', '8305', 'xã', 937, 'hienthi', 0, 1759490174, NULL),
(8338, 25, 0, 0, 'xa_minh_hoa', 'Xã Minh Hòa', 'minh_hoa', '8338', 'xã', 938, 'hienthi', 0, 1759490174, NULL),
(8311, 25, 0, 0, 'xa_trung_son', 'Xã Trung Sơn', 'trung_son', '8311', 'xã', 939, 'hienthi', 0, 1759490174, NULL),
(8824, 25, 0, 0, 'xa_tam_son', 'Xã Tam Sơn', 'tam_son', '8824', 'xã', 940, 'hienthi', 0, 1759490174, NULL),
(8848, 25, 0, 0, 'xa_song_lo', 'Xã Sông Lô', 'song_lo', '8848', 'xã', 941, 'hienthi', 0, 1759490174, NULL),
(8782, 25, 0, 0, 'xa_hai_luu', 'Xã Hải Lựu', 'hai_luu', '8782', 'xã', 942, 'hienthi', 0, 1759490174, NULL),
(8773, 25, 0, 0, 'xa_yen_lang', 'Xã Yên Lãng', 'yen_lang', '8773', 'xã', 943, 'hienthi', 0, 1759490174, NULL),
(8761, 25, 0, 0, 'xa_lap_thach', 'Xã Lập Thạch', 'lap_thach', '8761', 'xã', 944, 'hienthi', 0, 1759490174, NULL),
(8842, 25, 0, 0, 'xa_tien_lu', 'Xã Tiên Lữ', 'tien_lu', '8842', 'xã', 945, 'hienthi', 0, 1759490174, NULL),
(8788, 25, 0, 0, 'xa_thai_hoa', 'Xã Thái Hòa', 'thai_hoa', '8788', 'xã', 946, 'hienthi', 0, 1759490174, NULL),
(8812, 25, 0, 0, 'xa_lien_hoa', 'Xã Liên Hòa', 'lien_hoa', '8812', 'xã', 947, 'hienthi', 0, 1759490174, NULL),
(8770, 25, 0, 0, 'xa_hop_ly', 'Xã Hợp Lý', 'hop_ly', '8770', 'xã', 948, 'hienthi', 0, 1759490174, NULL),
(8866, 25, 0, 0, 'xa_son_dong', 'Xã Sơn Đông', 'son_dong', '8866', 'xã', 949, 'hienthi', 0, 1759490174, NULL),
(8911, 25, 0, 0, 'xa_tam_dao', 'Xã Tam Đảo', 'tam_dao', '8911', 'xã', 950, 'hienthi', 0, 1759490174, NULL),
(8923, 25, 0, 0, 'xa_dai_dinh', 'Xã Đại Đình', 'dai_dinh', '8923', 'xã', 951, 'hienthi', 0, 1759490174, NULL),
(8914, 25, 0, 0, 'xa_dao_tru', 'Xã Đạo Trù', 'dao_tru', '8914', 'xã', 952, 'hienthi', 0, 1759490174, NULL),
(8869, 25, 0, 0, 'xa_tam_duong', 'Xã Tam Dương', 'tam_duong', '8869', 'xã', 953, 'hienthi', 0, 1759490174, NULL),
(8905, 25, 0, 0, 'xa_hoi_thinh', 'Xã Hội Thịnh', 'hoi_thinh', '8905', 'xã', 954, 'hienthi', 0, 1759490174, NULL),
(8896, 25, 0, 0, 'xa_hoang_an', 'Xã Hoàng An', 'hoang_an', '8896', 'xã', 955, 'hienthi', 0, 1759490174, NULL),
(8872, 25, 0, 0, 'xa_tam_duong_bac', 'Xã Tam Dương Bắc', 'tam_duong_bac', '8872', 'xã', 956, 'hienthi', 0, 1759490174, NULL),
(9076, 25, 0, 0, 'xa_vinh_tuong', 'Xã Vĩnh Tường', 'vinh_tuong', '9076', 'xã', 957, 'hienthi', 0, 1759490174, NULL),
(9112, 25, 0, 0, 'xa_tho_tang', 'Xã Thổ Tang', 'tho_tang', '9112', 'xã', 958, 'hienthi', 0, 1759490174, NULL),
(9100, 25, 0, 0, 'xa_vinh_hung', 'Xã Vĩnh Hưng', 'vinh_hung', '9100', 'xã', 959, 'hienthi', 0, 1759490174, NULL),
(9079, 25, 0, 0, 'xa_vinh_an', 'Xã Vĩnh An', 'vinh_an', '9079', 'xã', 960, 'hienthi', 0, 1759490174, NULL),
(9154, 25, 0, 0, 'xa_vinh_phu', 'Xã Vĩnh Phú', 'vinh_phu', '9154', 'xã', 961, 'hienthi', 0, 1759490174, NULL),
(9106, 25, 0, 0, 'xa_vinh_thanh', 'Xã Vĩnh Thành', 'vinh_thanh', '9106', 'xã', 962, 'hienthi', 0, 1759490174, NULL),
(9025, 25, 0, 0, 'xa_yen_lac', 'Xã Yên Lạc', 'yen_lac', '9025', 'xã', 963, 'hienthi', 0, 1759490174, NULL),
(9040, 25, 0, 0, 'xa_te_lo', 'Xã Tề Lỗ', 'te_lo', '9040', 'xã', 964, 'hienthi', 0, 1759490174, NULL),
(9064, 25, 0, 0, 'xa_lien_chau', 'Xã Liên Châu', 'lien_chau', '9064', 'xã', 965, 'hienthi', 0, 1759490174, NULL),
(9043, 25, 0, 0, 'xa_tam_hong', 'Xã Tam Hồng', 'tam_hong', '9043', 'xã', 966, 'hienthi', 0, 1759490174, NULL),
(9052, 25, 0, 0, 'xa_nguyet_duc', 'Xã Nguyệt Đức', 'nguyet_duc', '9052', 'xã', 967, 'hienthi', 0, 1759490174, NULL),
(8935, 25, 0, 0, 'xa_binh_nguyen', 'Xã Bình Nguyên', 'binh_nguyen', '8935', 'xã', 968, 'hienthi', 0, 1759490174, NULL),
(8971, 25, 0, 0, 'xa_xuan_lang', 'Xã Xuân Lãng', 'xuan_lang', '8971', 'xã', 969, 'hienthi', 0, 1759490174, NULL),
(8950, 25, 0, 0, 'xa_binh_xuyen', 'Xã Bình Xuyên', 'binh_xuyen', '8950', 'xã', 970, 'hienthi', 0, 1759490174, NULL),
(8944, 25, 0, 0, 'xa_binh_tuyen', 'Xã Bình Tuyền', 'binh_tuyen', '8944', 'xã', 971, 'hienthi', 0, 1759490174, NULL),
(8716, 25, 0, 0, 'phuong_vinh_phuc', 'Phường Vĩnh Phúc', 'vinh_phuc', '8716', 'phường', 972, 'hienthi', 0, 1759490174, NULL),
(8707, 25, 0, 0, 'phuong_vinh_yen', 'Phường Vĩnh Yên', 'vinh_yen', '8707', 'phường', 973, 'hienthi', 0, 1759490174, NULL),
(8740, 25, 0, 0, 'phuong_phuc_yen', 'Phường Phúc Yên', 'phuc_yen', '8740', 'phường', 974, 'hienthi', 0, 1759490174, NULL),
(8749, 25, 0, 0, 'phuong_xuan_hoa', 'Phường Xuân Hòa', 'xuan_hoa', '8749', 'phường', 975, 'hienthi', 0, 1759490174, NULL),
(5089, 25, 0, 0, 'xa_cao_phong', 'Xã Cao Phong', 'cao_phong', '5089', 'xã', 976, 'hienthi', 0, 1759490174, NULL),
(5116, 25, 0, 0, 'xa_muong_thang', 'Xã Mường Thàng', 'muong_thang', '5116', 'xã', 977, 'hienthi', 0, 1759490174, NULL),
(5098, 25, 0, 0, 'xa_thung_nai', 'Xã Thung Nai', 'thung_nai', '5098', 'xã', 978, 'hienthi', 0, 1759490174, NULL),
(4831, 25, 0, 0, 'xa_da_bac', 'Xã Đà Bắc', 'da_bac', '4831', 'xã', 979, 'hienthi', 0, 1759490174, NULL),
(4876, 25, 0, 0, 'xa_cao_son', 'Xã Cao Sơn', 'cao_son', '4876', 'xã', 980, 'hienthi', 0, 1759490174, NULL),
(4846, 25, 0, 0, 'xa_duc_nhan', 'Xã Đức Nhàn', 'duc_nhan', '4846', 'xã', 981, 'hienthi', 0, 1759490174, NULL),
(4873, 25, 0, 0, 'xa_quy_duc', 'Xã Quy Đức', 'quy_duc', '4873', 'xã', 982, 'hienthi', 0, 1759490174, NULL),
(4849, 25, 0, 0, 'xa_tan_pheo', 'Xã Tân Pheo', 'tan_pheo', '4849', 'xã', 983, 'hienthi', 0, 1759490174, NULL),
(4891, 25, 0, 0, 'xa_tien_phong', 'Xã Tiền Phong', 'tien_phong', '4891', 'xã', 984, 'hienthi', 0, 1759490174, NULL),
(4978, 25, 0, 0, 'xa_kim_boi', 'Xã Kim Bôi', 'kim_boi', '4978', 'xã', 985, 'hienthi', 0, 1759490174, NULL),
(5014, 25, 0, 0, 'xa_muong_dong', 'Xã Mường Động', 'muong_dong', '5014', 'xã', 986, 'hienthi', 0, 1759490174, NULL),
(5086, 25, 0, 0, 'xa_dung_tien', 'Xã Dũng Tiến', 'dung_tien', '5086', 'xã', 987, 'hienthi', 0, 1759490174, NULL),
(5068, 25, 0, 0, 'xa_hop_kim', 'Xã Hợp Kim', 'hop_kim', '5068', 'xã', 988, 'hienthi', 0, 1759490174, NULL),
(4990, 25, 0, 0, 'xa_nat_son', 'Xã Nật Sơn', 'nat_son', '4990', 'xã', 989, 'hienthi', 0, 1759490174, NULL),
(5266, 25, 0, 0, 'xa_lac_son', 'Xã Lạc Sơn', 'lac_son', '5266', 'xã', 990, 'hienthi', 0, 1759490174, NULL),
(5287, 25, 0, 0, 'xa_muong_vang', 'Xã Mường Vang', 'muong_vang', '5287', 'xã', 991, 'hienthi', 0, 1759490174, NULL),
(5347, 25, 0, 0, 'xa_dai_dong', 'Xã Đại Đồng', 'dai_dong', '5347', 'xã', 992, 'hienthi', 0, 1759490174, NULL),
(5329, 25, 0, 0, 'xa_ngoc_son', 'Xã Ngọc Sơn', 'ngoc_son', '5329', 'xã', 993, 'hienthi', 0, 1759490174, NULL),
(5290, 25, 0, 0, 'xa_nhan_nghia', 'Xã Nhân Nghĩa', 'nhan_nghia', '5290', 'xã', 994, 'hienthi', 0, 1759490174, NULL),
(5323, 25, 0, 0, 'xa_quyet_thang', 'Xã Quyết Thắng', 'quyet_thang', '5323', 'xã', 995, 'hienthi', 0, 1759490174, NULL),
(5293, 25, 0, 0, 'xa_thuong_coc', 'Xã Thượng Cốc', 'thuong_coc', '5293', 'xã', 996, 'hienthi', 0, 1759490174, NULL),
(5305, 25, 0, 0, 'xa_yen_phu', 'Xã Yên Phú', 'yen_phu', '5305', 'xã', 997, 'hienthi', 0, 1759490174, NULL),
(5392, 25, 0, 0, 'xa_lac_thuy', 'Xã Lạc Thủy', 'lac_thuy', '5392', 'xã', 998, 'hienthi', 0, 1759490174, NULL),
(5425, 25, 0, 0, 'xa_an_binh', 'Xã An Bình', 'an_binh', '5425', 'xã', 999, 'hienthi', 0, 1759490174, NULL),
(5395, 25, 0, 0, 'xa_an_nghia', 'Xã An Nghĩa', 'an_nghia', '5395', 'xã', 1000, 'hienthi', 0, 1759490174, NULL),
(4924, 25, 0, 0, 'xa_luong_son', 'Xã Lương Sơn', 'luong_son', '4924', 'xã', 1001, 'hienthi', 0, 1759490174, NULL),
(5047, 25, 0, 0, 'xa_cao_duong', 'Xã Cao Dương', 'cao_duong', '5047', 'xã', 1002, 'hienthi', 0, 1759490174, NULL),
(4960, 25, 0, 0, 'xa_lien_son', 'Xã Liên Sơn', 'lien_son', '4960', 'xã', 1003, 'hienthi', 0, 1759490174, NULL),
(5200, 25, 0, 0, 'xa_mai_chau', 'Xã Mai Châu', 'mai_chau', '5200', 'xã', 1004, 'hienthi', 0, 1759490174, NULL),
(5245, 25, 0, 0, 'xa_bao_la', 'Xã Bao La', 'bao_la', '5245', 'xã', 1005, 'hienthi', 0, 1759490174, NULL),
(5251, 25, 0, 0, 'xa_mai_ha', 'Xã Mai Hạ', 'mai_ha', '5251', 'xã', 1006, 'hienthi', 0, 1759490174, NULL),
(5212, 25, 0, 0, 'xa_pa_co', 'Xã Pà Cò', 'pa_co', '5212', 'xã', 1007, 'hienthi', 0, 1759490174, NULL),
(5206, 25, 0, 0, 'xa_tan_mai', 'Xã Tân Mai', 'tan_mai', '5206', 'xã', 1008, 'hienthi', 0, 1759490174, NULL),
(5128, 25, 0, 0, 'xa_tan_lac', 'Xã Tân Lạc', 'tan_lac', '5128', 'xã', 1009, 'hienthi', 0, 1759490174, NULL),
(5158, 25, 0, 0, 'xa_muong_bi', 'Xã Mường Bi', 'muong_bi', '5158', 'xã', 1010, 'hienthi', 0, 1759490174, NULL),
(5134, 25, 0, 0, 'xa_muong_hoa', 'Xã Mường Hoa', 'muong_hoa', '5134', 'xã', 1011, 'hienthi', 0, 1759490174, NULL),
(5191, 25, 0, 0, 'xa_toan_thang', 'Xã Toàn Thắng', 'toan_thang', '5191', 'xã', 1012, 'hienthi', 0, 1759490174, NULL),
(5152, 25, 0, 0, 'xa_van_son', 'Xã Vân Sơn', 'van_son', '5152', 'xã', 1013, 'hienthi', 0, 1759490174, NULL),
(5353, 25, 0, 0, 'xa_yen_thuy', 'Xã Yên Thủy', 'yen_thuy', '5353', 'xã', 1014, 'hienthi', 0, 1759490174, NULL),
(5362, 25, 0, 0, 'xa_lac_luong', 'Xã Lạc Lương', 'lac_luong', '5362', 'xã', 1015, 'hienthi', 0, 1759490174, NULL),
(5386, 25, 0, 0, 'xa_yen_tri', 'Xã Yên Trị', 'yen_tri', '5386', 'xã', 1016, 'hienthi', 0, 1759490174, NULL),
(4897, 25, 0, 0, 'xa_thinh_minh', 'Xã Thịnh Minh', 'thinh_minh', '4897', 'xã', 1017, 'hienthi', 0, 1759490174, NULL),
(4795, 25, 0, 0, 'phuong_hoa_binh', 'Phường Hòa Bình', 'hoa_binh', '4795', 'phường', 1018, 'hienthi', 0, 1759490174, NULL),
(4894, 25, 0, 0, 'phuong_ky_son', 'Phường Kỳ Sơn', 'ky_son', '4894', 'phường', 1019, 'hienthi', 0, 1759490174, NULL),
(4792, 25, 0, 0, 'phuong_tan_hoa', 'Phường Tân Hòa', 'tan_hoa', '4792', 'phường', 1020, 'hienthi', 0, 1759490174, NULL),
(4828, 25, 0, 0, 'phuong_thong_nhat', 'Phường Thống Nhất', 'thong_nhat', '4828', 'phường', 1021, 'hienthi', 0, 1759490174, NULL),
(11560, 31, 0, 0, 'phuong_thuy_nguyen', 'Phường Thuỷ Nguyên', 'thuy_nguyen', '11560', 'phường', 1022, 'hienthi', 0, 1759490174, NULL),
(11557, 31, 0, 0, 'phuong_thien_huong', 'Phường Thiên Hương', 'thien_huong', '11557', 'phường', 1023, 'hienthi', 0, 1759490174, NULL),
(11533, 31, 0, 0, 'phuong_hoa_binh', 'Phường Hoà Bình', 'hoa_binh', '11533', 'phường', 1024, 'hienthi', 0, 1759490174, NULL),
(11542, 31, 0, 0, 'phuong_nam_trieu', 'Phường Nam Triệu', 'nam_trieu', '11542', 'phường', 1025, 'hienthi', 0, 1759490174, NULL),
(11473, 31, 0, 0, 'phuong_bach_dang', 'Phường Bạch Đằng', 'bach_dang', '11473', 'phường', 1026, 'hienthi', 0, 1759490174, NULL),
(11488, 31, 0, 0, 'phuong_luu_kiem', 'Phường Lưu Kiếm', 'luu_kiem', '11488', 'phường', 1027, 'hienthi', 0, 1759490174, NULL),
(11506, 31, 0, 0, 'phuong_le_ich_moc', 'Phường Lê Ích Mộc', 'le_ich_moc', '11506', 'phường', 1028, 'hienthi', 0, 1759490174, NULL),
(11311, 31, 0, 0, 'phuong_hong_bang', 'Phường Hồng Bàng', 'hong_bang', '11311', 'phường', 1029, 'hienthi', 0, 1759490174, NULL),
(11602, 31, 0, 0, 'phuong_hong_an', 'Phường Hồng An', 'hong_an', '11602', 'phường', 1030, 'hienthi', 0, 1759490174, NULL),
(11341, 31, 0, 0, 'phuong_ngo_quyen', 'Phường Ngô Quyền', 'ngo_quyen', '11341', 'phường', 1031, 'hienthi', 0, 1759490174, NULL),
(11359, 31, 0, 0, 'phuong_gia_vien', 'Phường Gia Viên', 'gia_vien', '11359', 'phường', 1032, 'hienthi', 0, 1759490174, NULL),
(11383, 31, 0, 0, 'phuong_le_chan', 'Phường Lê Chân', 'le_chan', '11383', 'phường', 1033, 'hienthi', 0, 1759490174, NULL),
(11407, 31, 0, 0, 'phuong_an_bien', 'Phường An Biên', 'an_bien', '11407', 'phường', 1034, 'hienthi', 0, 1759490174, NULL),
(11413, 31, 0, 0, 'phuong_hai_an', 'Phường Hải An', 'hai_an', '11413', 'phường', 1035, 'hienthi', 0, 1759490174, NULL),
(11411, 31, 0, 0, 'phuong_dong_hai', 'Phường Đông Hải', 'dong_hai', '11411', 'phường', 1036, 'hienthi', 0, 1759490174, NULL),
(11443, 31, 0, 0, 'phuong_kien_an', 'Phường Kiến An', 'kien_an', '11443', 'phường', 1037, 'hienthi', 0, 1759490174, NULL),
(11446, 31, 0, 0, 'phuong_phu_lien', 'Phường Phù Liễn', 'phu_lien', '11446', 'phường', 1038, 'hienthi', 0, 1759490174, NULL),
(11737, 31, 0, 0, 'phuong_nam_do_son', 'Phường Nam Đồ Sơn', 'nam_do_son', '11737', 'phường', 1039, 'hienthi', 0, 1759490174, NULL),
(11455, 31, 0, 0, 'phuong_do_son', 'Phường Đồ Sơn', 'do_son', '11455', 'phường', 1040, 'hienthi', 0, 1759490174, NULL),
(11689, 31, 0, 0, 'phuong_hung_dao', 'Phường Hưng Đạo', 'hung_dao', '11689', 'phường', 1041, 'hienthi', 0, 1759490174, NULL),
(11692, 31, 0, 0, 'phuong_duong_kinh', 'Phường Dương Kinh', 'duong_kinh', '11692', 'phường', 1042, 'hienthi', 0, 1759490174, NULL),
(11581, 31, 0, 0, 'phuong_an_duong', 'Phường An Dương', 'an_duong', '11581', 'phường', 1043, 'hienthi', 0, 1759490174, NULL),
(11617, 31, 0, 0, 'phuong_an_hai', 'Phường An Hải', 'an_hai', '11617', 'phường', 1044, 'hienthi', 0, 1759490174, NULL),
(11593, 31, 0, 0, 'phuong_an_phong', 'Phường An Phong', 'an_phong', '11593', 'phường', 1045, 'hienthi', 0, 1759490174, NULL),
(11674, 31, 0, 0, 'xa_an_hung', 'Xã An Hưng', 'an_hung', '11674', 'xã', 1046, 'hienthi', 0, 1759490174, NULL),
(11668, 31, 0, 0, 'xa_an_khanh', 'Xã An Khánh', 'an_khanh', '11668', 'xã', 1047, 'hienthi', 0, 1759490174, NULL),
(11647, 31, 0, 0, 'xa_an_quang', 'Xã An Quang', 'an_quang', '11647', 'xã', 1048, 'hienthi', 0, 1759490174, NULL),
(11635, 31, 0, 0, 'xa_an_truong', 'Xã An Trường', 'an_truong', '11635', 'xã', 1049, 'hienthi', 0, 1759490174, NULL),
(11629, 31, 0, 0, 'xa_an_lao', 'Xã An Lão', 'an_lao', '11629', 'xã', 1050, 'hienthi', 0, 1759490174, NULL),
(11680, 31, 0, 0, 'xa_kien_thuy', 'Xã Kiến Thụy', 'kien_thuy', '11680', 'xã', 1051, 'hienthi', 0, 1759490174, NULL),
(11725, 31, 0, 0, 'xa_kien_minh', 'Xã Kiến Minh', 'kien_minh', '11725', 'xã', 1052, 'hienthi', 0, 1759490174, NULL),
(11749, 31, 0, 0, 'xa_kien_hai', 'Xã Kiến Hải', 'kien_hai', '11749', 'xã', 1053, 'hienthi', 0, 1759490174, NULL),
(11728, 31, 0, 0, 'xa_kien_hung', 'Xã Kiến Hưng', 'kien_hung', '11728', 'xã', 1054, 'hienthi', 0, 1759490174, NULL),
(11713, 31, 0, 0, 'xa_nghi_duong', 'Xã Nghi Dương', 'nghi_duong', '11713', 'xã', 1055, 'hienthi', 0, 1759490174, NULL),
(11761, 31, 0, 0, 'xa_quyet_thang', 'Xã Quyết Thắng', 'quyet_thang', '11761', 'xã', 1056, 'hienthi', 0, 1759490174, NULL),
(11755, 31, 0, 0, 'xa_tien_lang', 'Xã Tiên Lãng', 'tien_lang', '11755', 'xã', 1057, 'hienthi', 0, 1759490174, NULL),
(11779, 31, 0, 0, 'xa_tan_minh', 'Xã Tân Minh', 'tan_minh', '11779', 'xã', 1058, 'hienthi', 0, 1759490174, NULL),
(11791, 31, 0, 0, 'xa_tien_minh', 'Xã Tiên Minh', 'tien_minh', '11791', 'xã', 1059, 'hienthi', 0, 1759490174, NULL),
(11806, 31, 0, 0, 'xa_chan_hung', 'Xã Chấn Hưng', 'chan_hung', '11806', 'xã', 1060, 'hienthi', 0, 1759490174, NULL),
(11809, 31, 0, 0, 'xa_hung_thang', 'Xã Hùng Thắng', 'hung_thang', '11809', 'xã', 1061, 'hienthi', 0, 1759490174, NULL),
(11824, 31, 0, 0, 'xa_vinh_bao', 'Xã Vĩnh Bảo', 'vinh_bao', '11824', 'xã', 1062, 'hienthi', 0, 1759490174, NULL),
(11911, 31, 0, 0, 'xa_nguyen_binh_khiem', 'Xã Nguyễn Bỉnh Khiêm', 'nguyen_binh_khiem', '11911', 'xã', 1063, 'hienthi', 0, 1759490174, NULL),
(11887, 31, 0, 0, 'xa_vinh_am', 'Xã Vĩnh Am', 'vinh_am', '11887', 'xã', 1064, 'hienthi', 0, 1759490174, NULL),
(11875, 31, 0, 0, 'xa_vinh_hai', 'Xã Vĩnh Hải', 'vinh_hai', '11875', 'xã', 1065, 'hienthi', 0, 1759490174, NULL),
(11848, 31, 0, 0, 'xa_vinh_hoa', 'Xã Vĩnh Hòa', 'vinh_hoa', '11848', 'xã', 1066, 'hienthi', 0, 1759490174, NULL),
(11836, 31, 0, 0, 'xa_vinh_thinh', 'Xã Vĩnh Thịnh', 'vinh_thinh', '11836', 'xã', 1067, 'hienthi', 0, 1759490174, NULL),
(11842, 31, 0, 0, 'xa_vinh_thuan', 'Xã Vĩnh Thuận', 'vinh_thuan', '11842', 'xã', 1068, 'hienthi', 0, 1759490174, NULL),
(11503, 31, 0, 0, 'xa_viet_khe', 'Xã Việt Khê', 'viet_khe', '11503', 'xã', 1069, 'hienthi', 0, 1759490174, NULL),
(11914, 31, 0, 0, 'dac_khu_cat_hai', 'Đặc khu Cát Hải', 'cat_hai', '11914', 'đặc khu', 1070, 'hienthi', 0, 1759490174, NULL),
(11948, 31, 0, 0, 'dac_khu_bach_long_vi', 'Đặc khu Bạch Long Vĩ', 'bach_long_vi', '11948', 'đặc khu', 1071, 'hienthi', 0, 1759490174, NULL),
(10525, 31, 0, 0, 'phuong_hai_duong', 'Phường Hải Dương', 'hai_duong', '10525', 'phường', 1072, 'hienthi', 0, 1759490174, NULL),
(10532, 31, 0, 0, 'phuong_le_thanh_nghi', 'Phường Lê Thanh Nghị', 'le_thanh_nghi', '10532', 'phường', 1073, 'hienthi', 0, 1759490174, NULL),
(10543, 31, 0, 0, 'phuong_viet_hoa', 'Phường Việt Hòa', 'viet_hoa', '10543', 'phường', 1074, 'hienthi', 0, 1759490174, NULL),
(10510, 31, 0, 0, 'phuong_thanh_dong', 'Phường Thành Đông', 'thanh_dong', '10510', 'phường', 1075, 'hienthi', 0, 1759490174, NULL),
(10672, 31, 0, 0, 'phuong_nam_dong', 'Phường Nam Đồng', 'nam_dong', '10672', 'phường', 1076, 'hienthi', 0, 1759490174, NULL),
(10537, 31, 0, 0, 'phuong_tan_hung', 'Phường Tân Hưng', 'tan_hung', '10537', 'phường', 1077, 'hienthi', 0, 1759490174, NULL),
(11002, 31, 0, 0, 'phuong_thach_khoi', 'Phường Thạch Khôi', 'thach_khoi', '11002', 'phường', 1078, 'hienthi', 0, 1759490174, NULL),
(10540, 31, 0, 0, 'phuong_tu_minh', 'Phường Tứ Minh', 'tu_minh', '10540', 'phường', 1079, 'hienthi', 0, 1759490174, NULL),
(10660, 31, 0, 0, 'phuong_ai_quoc', 'Phường Ái Quốc', 'ai_quoc', '10660', 'phường', 1080, 'hienthi', 0, 1759490174, NULL),
(10549, 31, 0, 0, 'phuong_chu_van_an', 'Phường Chu Văn An', 'chu_van_an', '10549', 'phường', 1081, 'hienthi', 0, 1759490174, NULL),
(10546, 31, 0, 0, 'phuong_chi_linh', 'Phường Chí Linh', 'chi_linh', '10546', 'phường', 1082, 'hienthi', 0, 1759490174, NULL),
(10570, 31, 0, 0, 'phuong_tran_hung_dao', 'Phường Trần Hưng Đạo', 'tran_hung_dao', '10570', 'phường', 1083, 'hienthi', 0, 1759490174, NULL),
(10552, 31, 0, 0, 'phuong_nguyen_trai', 'Phường Nguyễn Trãi', 'nguyen_trai', '10552', 'phường', 1084, 'hienthi', 0, 1759490174, NULL),
(10573, 31, 0, 0, 'phuong_tran_nhan_tong', 'Phường Trần Nhân Tông', 'tran_nhan_tong', '10573', 'phường', 1085, 'hienthi', 0, 1759490174, NULL),
(10603, 31, 0, 0, 'phuong_le_dai_hanh', 'Phường Lê Đại Hành', 'le_dai_hanh', '10603', 'phường', 1086, 'hienthi', 0, 1759490174, NULL),
(10675, 31, 0, 0, 'phuong_kinh_mon', 'Phường Kinh Môn', 'kinh_mon', '10675', 'phường', 1087, 'hienthi', 0, 1759490174, NULL),
(10744, 31, 0, 0, 'phuong_nguyen_dai_nang', 'Phường Nguyễn Đại Năng', 'nguyen_dai_nang', '10744', 'phường', 1088, 'hienthi', 0, 1759490174, NULL),
(10729, 31, 0, 0, 'phuong_tran_lieu', 'Phường Trần Liễu', 'tran_lieu', '10729', 'phường', 1089, 'hienthi', 0, 1759490174, NULL),
(10678, 31, 0, 0, 'phuong_bac_an_phu', 'Phường Bắc An Phụ', 'bac_an_phu', '10678', 'phường', 1090, 'hienthi', 0, 1759490174, NULL),
(10726, 31, 0, 0, 'phuong_pham_su_manh', 'Phường Phạm Sư Mạnh', 'pham_su_manh', '10726', 'phường', 1091, 'hienthi', 0, 1759490174, NULL),
(10714, 31, 0, 0, 'phuong_nhi_chieu', 'Phường Nhị Chiểu', 'nhi_chieu', '10714', 'phường', 1092, 'hienthi', 0, 1759490174, NULL),
(10705, 31, 0, 0, 'xa_nam_an_phu', 'Xã Nam An Phụ', 'nam_an_phu', '10705', 'xã', 1093, 'hienthi', 0, 1759490174, NULL),
(10606, 31, 0, 0, 'xa_nam_sach', 'Xã Nam Sách', 'nam_sach', '10606', 'xã', 1094, 'hienthi', 0, 1759490174, NULL),
(10642, 31, 0, 0, 'xa_thai_tan', 'Xã Thái Tân', 'thai_tan', '10642', 'xã', 1095, 'hienthi', 0, 1759490174, NULL),
(10615, 31, 0, 0, 'xa_hop_tien', 'Xã Hợp Tiến', 'hop_tien', '10615', 'xã', 1096, 'hienthi', 0, 1759490174, NULL),
(10633, 31, 0, 0, 'xa_tran_phu', 'Xã Trần Phú', 'tran_phu', '10633', 'xã', 1097, 'hienthi', 0, 1759490174, NULL),
(10645, 31, 0, 0, 'xa_an_phu', 'Xã An Phú', 'an_phu', '10645', 'xã', 1098, 'hienthi', 0, 1759490174, NULL),
(10813, 31, 0, 0, 'xa_thanh_ha', 'Xã Thanh Hà', 'thanh_ha', '10813', 'xã', 1099, 'hienthi', 0, 1759490174, NULL),
(10846, 31, 0, 0, 'xa_ha_tay', 'Xã Hà Tây', 'ha_tay', '10846', 'xã', 1100, 'hienthi', 0, 1759490174, NULL),
(10816, 31, 0, 0, 'xa_ha_bac', 'Xã Hà Bắc', 'ha_bac', '10816', 'xã', 1101, 'hienthi', 0, 1759490174, NULL),
(10843, 31, 0, 0, 'xa_ha_nam', 'Xã Hà Nam', 'ha_nam', '10843', 'xã', 1102, 'hienthi', 0, 1759490174, NULL),
(10882, 31, 0, 0, 'xa_ha_dong', 'Xã Hà Đông', 'ha_dong', '10882', 'xã', 1103, 'hienthi', 0, 1759490174, NULL),
(10888, 31, 0, 0, 'xa_cam_giang', 'Xã Cẩm Giang', 'cam_giang', '10888', 'xã', 1104, 'hienthi', 0, 1759490174, NULL),
(10909, 31, 0, 0, 'xa_tue_tinh', 'Xã Tuệ Tĩnh', 'tue_tinh', '10909', 'xã', 1105, 'hienthi', 0, 1759490174, NULL),
(10930, 31, 0, 0, 'xa_mao_dien', 'Xã Mao Điền', 'mao_dien', '10930', 'xã', 1106, 'hienthi', 0, 1759490174, NULL),
(10903, 31, 0, 0, 'xa_cam_giang', 'Xã Cẩm Giàng', 'cam_giang', '10903', 'xã', 1107, 'hienthi', 0, 1759490174, NULL),
(10945, 31, 0, 0, 'xa_ke_sat', 'Xã Kẻ Sặt', 'ke_sat', '10945', 'xã', 1108, 'hienthi', 0, 1759490174, NULL),
(10966, 31, 0, 0, 'xa_binh_giang', 'Xã Bình Giang', 'binh_giang', '10966', 'xã', 1109, 'hienthi', 0, 1759490174, NULL),
(10972, 31, 0, 0, 'xa_duong_an', 'Xã Đường An', 'duong_an', '10972', 'xã', 1110, 'hienthi', 0, 1759490174, NULL),
(10993, 31, 0, 0, 'xa_thuong_hong', 'Xã Thượng Hồng', 'thuong_hong', '10993', 'xã', 1111, 'hienthi', 0, 1759490174, NULL),
(10999, 31, 0, 0, 'xa_gia_loc', 'Xã Gia Lộc', 'gia_loc', '10999', 'xã', 1112, 'hienthi', 0, 1759490174, NULL),
(11020, 31, 0, 0, 'xa_yet_kieu', 'Xã Yết Kiêu', 'yet_kieu', '11020', 'xã', 1113, 'hienthi', 0, 1759490174, NULL),
(11050, 31, 0, 0, 'xa_gia_phuc', 'Xã Gia Phúc', 'gia_phuc', '11050', 'xã', 1114, 'hienthi', 0, 1759490174, NULL),
(11065, 31, 0, 0, 'xa_truong_tan', 'Xã Trường Tân', 'truong_tan', '11065', 'xã', 1115, 'hienthi', 0, 1759490174, NULL),
(11074, 31, 0, 0, 'xa_tu_ky', 'Xã Tứ Kỳ', 'tu_ky', '11074', 'xã', 1116, 'hienthi', 0, 1759490174, NULL),
(11113, 31, 0, 0, 'xa_tan_ky', 'Xã Tân Kỳ', 'tan_ky', '11113', 'xã', 1117, 'hienthi', 0, 1759490174, NULL),
(11086, 31, 0, 0, 'xa_dai_son', 'Xã Đại Sơn', 'dai_son', '11086', 'xã', 1118, 'hienthi', 0, 1759490174, NULL),
(11131, 31, 0, 0, 'xa_chi_minh', 'Xã Chí Minh', 'chi_minh', '11131', 'xã', 1119, 'hienthi', 0, 1759490174, NULL),
(11140, 31, 0, 0, 'xa_lac_phuong', 'Xã Lạc Phượng', 'lac_phuong', '11140', 'xã', 1120, 'hienthi', 0, 1759490174, NULL),
(11146, 31, 0, 0, 'xa_nguyen_giap', 'Xã Nguyên Giáp', 'nguyen_giap', '11146', 'xã', 1121, 'hienthi', 0, 1759490174, NULL),
(11203, 31, 0, 0, 'xa_ninh_giang', 'Xã Ninh Giang', 'ninh_giang', '11203', 'xã', 1122, 'hienthi', 0, 1759490174, NULL),
(11164, 31, 0, 0, 'xa_vinh_lai', 'Xã Vĩnh Lại', 'vinh_lai', '11164', 'xã', 1123, 'hienthi', 0, 1759490174, NULL),
(11224, 31, 0, 0, 'xa_khuc_thua_du', 'Xã Khúc Thừa Dụ', 'khuc_thua_du', '11224', 'xã', 1124, 'hienthi', 0, 1759490174, NULL),
(11167, 31, 0, 0, 'xa_tan_an', 'Xã Tân An', 'tan_an', '11167', 'xã', 1125, 'hienthi', 0, 1759490174, NULL),
(11218, 31, 0, 0, 'xa_hong_chau', 'Xã Hồng Châu', 'hong_chau', '11218', 'xã', 1126, 'hienthi', 0, 1759490174, NULL),
(11239, 31, 0, 0, 'xa_thanh_mien', 'Xã Thanh Miện', 'thanh_mien', '11239', 'xã', 1127, 'hienthi', 0, 1759490174, NULL),
(11254, 31, 0, 0, 'xa_bac_thanh_mien', 'Xã Bắc Thanh Miện', 'bac_thanh_mien', '11254', 'xã', 1128, 'hienthi', 0, 1759490174, NULL),
(11257, 31, 0, 0, 'xa_hai_hung', 'Xã Hải Hưng', 'hai_hung', '11257', 'xã', 1129, 'hienthi', 0, 1759490174, NULL),
(11242, 31, 0, 0, 'xa_nguyen_luong_bang', 'Xã Nguyễn Lương Bằng', 'nguyen_luong_bang', '11242', 'xã', 1130, 'hienthi', 0, 1759490174, NULL),
(11284, 31, 0, 0, 'xa_nam_thanh_mien', 'Xã Nam Thanh Miện', 'nam_thanh_mien', '11284', 'xã', 1131, 'hienthi', 0, 1759490174, NULL),
(10750, 31, 0, 0, 'xa_phu_thai', 'Xã Phú Thái', 'phu_thai', '10750', 'xã', 1132, 'hienthi', 0, 1759490174, NULL),
(10756, 31, 0, 0, 'xa_lai_khe', 'Xã Lai Khê', 'lai_khe', '10756', 'xã', 1133, 'hienthi', 0, 1759490174, NULL),
(10777, 31, 0, 0, 'xa_an_thanh', 'Xã An Thành', 'an_thanh', '10777', 'xã', 1134, 'hienthi', 0, 1759490174, NULL),
(10804, 31, 0, 0, 'xa_kim_thanh', 'Xã Kim Thành', 'kim_thanh', '10804', 'xã', 1135, 'hienthi', 0, 1759490174, NULL),
(11953, 33, 0, 0, 'phuong_pho_hien', 'Phường Phố Hiến', 'pho_hien', '11953', 'phường', 1136, 'hienthi', 0, 1759490174, NULL),
(11983, 33, 0, 0, 'phuong_son_nam', 'Phường Sơn Nam', 'son_nam', '11983', 'phường', 1137, 'hienthi', 0, 1759490174, NULL),
(11980, 33, 0, 0, 'phuong_hong_chau', 'Phường Hồng Châu', 'hong_chau', '11980', 'phường', 1138, 'hienthi', 0, 1759490174, NULL),
(12103, 33, 0, 0, 'phuong_my_hao', 'Phường Mỹ Hào', 'my_hao', '12103', 'phường', 1139, 'hienthi', 0, 1759490174, NULL),
(12133, 33, 0, 0, 'phuong_duong_hao', 'Phường Đường Hào', 'duong_hao', '12133', 'phường', 1140, 'hienthi', 0, 1759490174, NULL),
(12127, 33, 0, 0, 'phuong_thuong_hong', 'Phường Thượng Hồng', 'thuong_hong', '12127', 'phường', 1141, 'hienthi', 0, 1759490174, NULL),
(11977, 33, 0, 0, 'xa_tan_hung', 'Xã Tân Hưng', 'tan_hung', '11977', 'xã', 1142, 'hienthi', 0, 1759490174, NULL),
(12337, 33, 0, 0, 'xa_hoang_hoa_tham', 'Xã Hoàng Hoa Thám', 'hoang_hoa_tham', '12337', 'xã', 1143, 'hienthi', 0, 1759490174, NULL),
(12364, 33, 0, 0, 'xa_tien_lu', 'Xã Tiên Lữ', 'tien_lu', '12364', 'xã', 1144, 'hienthi', 0, 1759490174, NULL),
(12361, 33, 0, 0, 'xa_tien_hoa', 'Xã Tiên Hoa', 'tien_hoa', '12361', 'xã', 1145, 'hienthi', 0, 1759490174, NULL),
(12391, 33, 0, 0, 'xa_quang_hung', 'Xã Quang Hưng', 'quang_hung', '12391', 'xã', 1146, 'hienthi', 0, 1759490174, NULL),
(12406, 33, 0, 0, 'xa_doan_dao', 'Xã Đoàn Đào', 'doan_dao', '12406', 'xã', 1147, 'hienthi', 0, 1759490174, NULL),
(12424, 33, 0, 0, 'xa_tien_tien', 'Xã Tiên Tiến', 'tien_tien', '12424', 'xã', 1148, 'hienthi', 0, 1759490174, NULL),
(12427, 33, 0, 0, 'xa_tong_tran', 'Xã Tống Trân', 'tong_tran', '12427', 'xã', 1149, 'hienthi', 0, 1759490174, NULL),
(12280, 33, 0, 0, 'xa_luong_bang', 'Xã Lương Bằng', 'luong_bang', '12280', 'xã', 1150, 'hienthi', 0, 1759490174, NULL),
(12286, 33, 0, 0, 'xa_nghia_dan', 'Xã Nghĩa Dân', 'nghia_dan', '12286', 'xã', 1151, 'hienthi', 0, 1759490174, NULL),
(12322, 33, 0, 0, 'xa_hiep_cuong', 'Xã Hiệp Cường', 'hiep_cuong', '12322', 'xã', 1152, 'hienthi', 0, 1759490174, NULL),
(12313, 33, 0, 0, 'xa_duc_hop', 'Xã Đức Hợp', 'duc_hop', '12313', 'xã', 1153, 'hienthi', 0, 1759490174, NULL),
(12142, 33, 0, 0, 'xa_an_thi', 'Xã Ân Thi', 'an_thi', '12142', 'xã', 1154, 'hienthi', 0, 1759490174, NULL),
(12166, 33, 0, 0, 'xa_xuan_truc', 'Xã Xuân Trúc', 'xuan_truc', '12166', 'xã', 1155, 'hienthi', 0, 1759490174, NULL),
(12148, 33, 0, 0, 'xa_pham_ngu_lao', 'Xã Phạm Ngũ Lão', 'pham_ngu_lao', '12148', 'xã', 1156, 'hienthi', 0, 1759490174, NULL),
(12184, 33, 0, 0, 'xa_nguyen_trai', 'Xã Nguyễn Trãi', 'nguyen_trai', '12184', 'xã', 1157, 'hienthi', 0, 1759490174, NULL),
(12196, 33, 0, 0, 'xa_hong_quang', 'Xã Hồng Quang', 'hong_quang', '12196', 'xã', 1158, 'hienthi', 0, 1759490174, NULL),
(12205, 33, 0, 0, 'xa_khoai_chau', 'Xã Khoái Châu', 'khoai_chau', '12205', 'xã', 1159, 'hienthi', 0, 1759490174, NULL),
(12220, 33, 0, 0, 'xa_trieu_viet_vuong', 'Xã Triệu Việt Vương', 'trieu_viet_vuong', '12220', 'xã', 1160, 'hienthi', 0, 1759490174, NULL),
(12238, 33, 0, 0, 'xa_viet_tien', 'Xã Việt Tiến', 'viet_tien', '12238', 'xã', 1161, 'hienthi', 0, 1759490174, NULL),
(12271, 33, 0, 0, 'xa_chi_minh', 'Xã Chí Minh', 'chi_minh', '12271', 'xã', 1162, 'hienthi', 0, 1759490174, NULL),
(12247, 33, 0, 0, 'xa_chau_ninh', 'Xã Châu Ninh', 'chau_ninh', '12247', 'xã', 1163, 'hienthi', 0, 1759490174, NULL),
(12052, 33, 0, 0, 'xa_yen_my', 'Xã Yên Mỹ', 'yen_my', '12052', 'xã', 1164, 'hienthi', 0, 1759490174, NULL),
(12091, 33, 0, 0, 'xa_viet_yen', 'Xã Việt Yên', 'viet_yen', '12091', 'xã', 1165, 'hienthi', 0, 1759490174, NULL),
(12070, 33, 0, 0, 'xa_hoan_long', 'Xã Hoàn Long', 'hoan_long', '12070', 'xã', 1166, 'hienthi', 0, 1759490174, NULL),
(12064, 33, 0, 0, 'xa_nguyen_van_linh', 'Xã Nguyễn Văn Linh', 'nguyen_van_linh', '12064', 'xã', 1167, 'hienthi', 0, 1759490174, NULL),
(11986, 33, 0, 0, 'xa_nhu_quynh', 'Xã Như Quỳnh', 'nhu_quynh', '11986', 'xã', 1168, 'hienthi', 0, 1759490174, NULL),
(11992, 33, 0, 0, 'xa_lac_dao', 'Xã Lạc Đạo', 'lac_dao', '11992', 'xã', 1169, 'hienthi', 0, 1759490174, NULL),
(11995, 33, 0, 0, 'xa_dai_dong', 'Xã Đại Đồng', 'dai_dong', '11995', 'xã', 1170, 'hienthi', 0, 1759490174, NULL),
(12031, 33, 0, 0, 'xa_nghia_tru', 'Xã Nghĩa Trụ', 'nghia_tru', '12031', 'xã', 1171, 'hienthi', 0, 1759490174, NULL),
(12025, 33, 0, 0, 'xa_phung_cong', 'Xã Phụng Công', 'phung_cong', '12025', 'xã', 1172, 'hienthi', 0, 1759490174, NULL),
(12019, 33, 0, 0, 'xa_van_giang', 'Xã Văn Giang', 'van_giang', '12019', 'xã', 1173, 'hienthi', 0, 1759490174, NULL),
(12049, 33, 0, 0, 'xa_me_so', 'Xã Mễ Sở', 'me_so', '12049', 'xã', 1174, 'hienthi', 0, 1759490174, NULL),
(13225, 33, 0, 0, 'phuong_thai_binh', 'Phường Thái Bình', 'thai_binh', '13225', 'phường', 1175, 'hienthi', 0, 1759490174, NULL),
(12454, 33, 0, 0, 'phuong_tran_lam', 'Phường Trần Lãm', 'tran_lam', '12454', 'phường', 1176, 'hienthi', 0, 1759490174, NULL),
(12452, 33, 0, 0, 'phuong_tran_hung_dao', 'Phường Trần Hưng Đạo', 'tran_hung_dao', '12452', 'phường', 1177, 'hienthi', 0, 1759490174, NULL),
(12817, 33, 0, 0, 'phuong_tra_ly', 'Phường Trà Lý', 'tra_ly', '12817', 'phường', 1178, 'hienthi', 0, 1759490174, NULL),
(12466, 33, 0, 0, 'phuong_vu_phuc', 'Phường Vũ Phúc', 'vu_phuc', '12466', 'phường', 1179, 'hienthi', 0, 1759490174, NULL),
(12826, 33, 0, 0, 'xa_thai_thuy', 'Xã Thái Thụy', 'thai_thuy', '12826', 'xã', 1180, 'hienthi', 0, 1759490174, NULL),
(12862, 33, 0, 0, 'xa_dong_thuy_anh', 'Xã Đông Thụy Anh', 'dong_thuy_anh', '12862', 'xã', 1181, 'hienthi', 0, 1759490174, NULL),
(12859, 33, 0, 0, 'xa_bac_thuy_anh', 'Xã Bắc Thụy Anh', 'bac_thuy_anh', '12859', 'xã', 1182, 'hienthi', 0, 1759490174, NULL),
(12865, 33, 0, 0, 'xa_thuy_anh', 'Xã Thụy Anh', 'thuy_anh', '12865', 'xã', 1183, 'hienthi', 0, 1759490174, NULL),
(12904, 33, 0, 0, 'xa_nam_thuy_anh', 'Xã Nam Thụy Anh', 'nam_thuy_anh', '12904', 'xã', 1184, 'hienthi', 0, 1759490174, NULL),
(12841, 33, 0, 0, 'xa_bac_thai_ninh', 'Xã Bắc Thái Ninh', 'bac_thai_ninh', '12841', 'xã', 1185, 'hienthi', 0, 1759490174, NULL),
(12922, 33, 0, 0, 'xa_thai_ninh', 'Xã Thái Ninh', 'thai_ninh', '12922', 'xã', 1186, 'hienthi', 0, 1759490174, NULL),
(12943, 33, 0, 0, 'xa_dong_thai_ninh', 'Xã Đông Thái Ninh', 'dong_thai_ninh', '12943', 'xã', 1187, 'hienthi', 0, 1759490174, NULL),
(12961, 33, 0, 0, 'xa_nam_thai_ninh', 'Xã Nam Thái Ninh', 'nam_thai_ninh', '12961', 'xã', 1188, 'hienthi', 0, 1759490174, NULL),
(12919, 33, 0, 0, 'xa_tay_thai_ninh', 'Xã Tây Thái Ninh', 'tay_thai_ninh', '12919', 'xã', 1189, 'hienthi', 0, 1759490174, NULL),
(12850, 33, 0, 0, 'xa_tay_thuy_anh', 'Xã Tây Thụy Anh', 'tay_thuy_anh', '12850', 'xã', 1190, 'hienthi', 0, 1759490174, NULL),
(12970, 33, 0, 0, 'xa_tien_hai', 'Xã Tiền Hải', 'tien_hai', '12970', 'xã', 1191, 'hienthi', 0, 1759490174, NULL),
(13039, 33, 0, 0, 'xa_tay_tien_hai', 'Xã Tây Tiền Hải', 'tay_tien_hai', '13039', 'xã', 1192, 'hienthi', 0, 1759490174, NULL),
(13021, 33, 0, 0, 'xa_ai_quoc', 'Xã Ái Quốc', 'ai_quoc', '13021', 'xã', 1193, 'hienthi', 0, 1759490174, NULL),
(13003, 33, 0, 0, 'xa_dong_chau', 'Xã Đồng Châu', 'dong_chau', '13003', 'xã', 1194, 'hienthi', 0, 1759490174, NULL),
(12988, 33, 0, 0, 'xa_dong_tien_hai', 'Xã Đông Tiền Hải', 'dong_tien_hai', '12988', 'xã', 1195, 'hienthi', 0, 1759490174, NULL),
(13057, 33, 0, 0, 'xa_nam_cuong', 'Xã Nam Cường', 'nam_cuong', '13057', 'xã', 1196, 'hienthi', 0, 1759490174, NULL),
(13066, 33, 0, 0, 'xa_hung_phu', 'Xã Hưng Phú', 'hung_phu', '13066', 'xã', 1197, 'hienthi', 0, 1759490174, NULL),
(13063, 33, 0, 0, 'xa_nam_tien_hai', 'Xã Nam Tiền Hải', 'nam_tien_hai', '13063', 'xã', 1198, 'hienthi', 0, 1759490174, NULL),
(12472, 33, 0, 0, 'xa_quynh_phu', 'Xã Quỳnh Phụ', 'quynh_phu', '12472', 'xã', 1199, 'hienthi', 0, 1759490174, NULL),
(12511, 33, 0, 0, 'xa_minh_tho', 'Xã Minh Thọ', 'minh_tho', '12511', 'xã', 1200, 'hienthi', 0, 1759490174, NULL),
(12532, 33, 0, 0, 'xa_nguyen_du', 'Xã Nguyễn Du', 'nguyen_du', '12532', 'xã', 1201, 'hienthi', 0, 1759490174, NULL),
(12577, 33, 0, 0, 'xa_quynh_an', 'Xã Quỳnh An', 'quynh_an', '12577', 'xã', 1202, 'hienthi', 0, 1759490174, NULL),
(12517, 33, 0, 0, 'xa_ngoc_lam', 'Xã Ngọc Lâm', 'ngoc_lam', '12517', 'xã', 1203, 'hienthi', 0, 1759490174, NULL),
(12526, 33, 0, 0, 'xa_dong_bang', 'Xã Đồng Bằng', 'dong_bang', '12526', 'xã', 1204, 'hienthi', 0, 1759490174, NULL),
(12499, 33, 0, 0, 'xa_a_sao', 'Xã A Sào', 'a_sao', '12499', 'xã', 1205, 'hienthi', 0, 1759490174, NULL),
(12523, 33, 0, 0, 'xa_phu_duc', 'Xã Phụ Dực', 'phu_duc', '12523', 'xã', 1206, 'hienthi', 0, 1759490174, NULL),
(12478, 33, 0, 0, 'xa_tan_tien', 'Xã Tân Tiến', 'tan_tien', '12478', 'xã', 1207, 'hienthi', 0, 1759490174, NULL),
(12586, 33, 0, 0, 'xa_hung_ha', 'Xã Hưng Hà', 'hung_ha', '12586', 'xã', 1208, 'hienthi', 0, 1759490174, NULL),
(12634, 33, 0, 0, 'xa_tien_la', 'Xã Tiên La', 'tien_la', '12634', 'xã', 1209, 'hienthi', 0, 1759490174, NULL),
(12676, 33, 0, 0, 'xa_le_quy_don', 'Xã Lê Quý Đôn', 'le_quy_don', '12676', 'xã', 1210, 'hienthi', 0, 1759490174, NULL),
(12685, 33, 0, 0, 'xa_hong_minh', 'Xã Hồng Minh', 'hong_minh', '12685', 'xã', 1211, 'hienthi', 0, 1759490174, NULL),
(12631, 33, 0, 0, 'xa_than_khe', 'Xã Thần Khê', 'than_khe', '12631', 'xã', 1212, 'hienthi', 0, 1759490174, NULL),
(12619, 33, 0, 0, 'xa_dien_ha', 'Xã Diên Hà', 'dien_ha', '12619', 'xã', 1213, 'hienthi', 0, 1759490174, NULL),
(12595, 33, 0, 0, 'xa_ngu_thien', 'Xã Ngự Thiên', 'ngu_thien', '12595', 'xã', 1214, 'hienthi', 0, 1759490174, NULL),
(12613, 33, 0, 0, 'xa_long_hung', 'Xã Long Hưng', 'long_hung', '12613', 'xã', 1215, 'hienthi', 0, 1759490174, NULL),
(12688, 33, 0, 0, 'xa_dong_hung', 'Xã Đông Hưng', 'dong_hung', '12688', 'xã', 1216, 'hienthi', 0, 1759490174, NULL),
(12700, 33, 0, 0, 'xa_bac_tien_hung', 'Xã Bắc Tiên Hưng', 'bac_tien_hung', '12700', 'xã', 1217, 'hienthi', 0, 1759490174, NULL),
(12736, 33, 0, 0, 'xa_dong_tien_hung', 'Xã Đông Tiên Hưng', 'dong_tien_hung', '12736', 'xã', 1218, 'hienthi', 0, 1759490174, NULL),
(12775, 33, 0, 0, 'xa_nam_dong_hung', 'Xã Nam Đông Hưng', 'nam_dong_hung', '12775', 'xã', 1219, 'hienthi', 0, 1759490174, NULL),
(12745, 33, 0, 0, 'xa_bac_dong_quan', 'Xã  Bắc Đông Quan', 'bac_dong_quan', '12745', 'xã', 1220, 'hienthi', 0, 1759490174, NULL),
(12694, 33, 0, 0, 'xa_bac_dong_hung', 'Xã Bắc Đông Hưng', 'bac_dong_hung', '12694', 'xã', 1221, 'hienthi', 0, 1759490174, NULL),
(12793, 33, 0, 0, 'xa_dong_quan', 'Xã Đông Quan', 'dong_quan', '12793', 'xã', 1222, 'hienthi', 0, 1759490174, NULL),
(12763, 33, 0, 0, 'xa_nam_tien_hung', 'Xã Nam Tiên Hưng', 'nam_tien_hung', '12763', 'xã', 1223, 'hienthi', 0, 1759490174, NULL),
(12754, 33, 0, 0, 'xa_tien_hung', 'Xã Tiên Hưng', 'tien_hung', '12754', 'xã', 1224, 'hienthi', 0, 1759490174, NULL),
(13120, 33, 0, 0, 'xa_le_loi', 'Xã Lê Lợi', 'le_loi', '13120', 'xã', 1225, 'hienthi', 0, 1759490174, NULL),
(13075, 33, 0, 0, 'xa_kien_xuong', 'Xã Kiến Xương', 'kien_xuong', '13075', 'xã', 1226, 'hienthi', 0, 1759490174, NULL),
(13132, 33, 0, 0, 'xa_quang_lich', 'Xã Quang Lịch', 'quang_lich', '13132', 'xã', 1227, 'hienthi', 0, 1759490174, NULL),
(13141, 33, 0, 0, 'xa_vu_quy', 'Xã Vũ Quý', 'vu_quy', '13141', 'xã', 1228, 'hienthi', 0, 1759490174, NULL),
(13183, 33, 0, 0, 'xa_binh_thanh', 'Xã Bình Thanh', 'binh_thanh', '13183', 'xã', 1229, 'hienthi', 0, 1759490174, NULL),
(13186, 33, 0, 0, 'xa_binh_dinh', 'Xã Bình Định', 'binh_dinh', '13186', 'xã', 1230, 'hienthi', 0, 1759490174, NULL),
(13159, 33, 0, 0, 'xa_hong_vu', 'Xã Hồng Vũ', 'hong_vu', '13159', 'xã', 1231, 'hienthi', 0, 1759490174, NULL),
(13096, 33, 0, 0, 'xa_binh_nguyen', 'Xã Bình Nguyên', 'binh_nguyen', '13096', 'xã', 1232, 'hienthi', 0, 1759490174, NULL),
(13093, 33, 0, 0, 'xa_tra_giang', 'Xã Trà Giang', 'tra_giang', '13093', 'xã', 1233, 'hienthi', 0, 1759490174, NULL),
(13192, 33, 0, 0, 'xa_vu_thu', 'Xã Vũ Thư', 'vu_thu', '13192', 'xã', 1234, 'hienthi', 0, 1759490174, NULL),
(13222, 33, 0, 0, 'xa_thu_tri', 'Xã Thư Trì', 'thu_tri', '13222', 'xã', 1235, 'hienthi', 0, 1759490174, NULL),
(13246, 33, 0, 0, 'xa_tan_thuan', 'Xã Tân Thuận', 'tan_thuan', '13246', 'xã', 1236, 'hienthi', 0, 1759490174, NULL),
(13264, 33, 0, 0, 'xa_thu_vu', 'Xã Thư Vũ', 'thu_vu', '13264', 'xã', 1237, 'hienthi', 0, 1759490174, NULL),
(13279, 33, 0, 0, 'xa_vu_tien', 'Xã Vũ Tiên', 'vu_tien', '13279', 'xã', 1238, 'hienthi', 0, 1759490174, NULL),
(13219, 33, 0, 0, 'xa_van_xuan', 'Xã Vạn Xuân', 'van_xuan', '13219', 'xã', 1239, 'hienthi', 0, 1759490174, NULL),
(14464, 37, 0, 0, 'xa_gia_vien', 'Xã Gia Viễn', 'gia_vien', '14464', 'xã', 1240, 'hienthi', 0, 1759490174, NULL),
(14500, 37, 0, 0, 'xa_dai_hoang', 'Xã Đại Hoàng', 'dai_hoang', '14500', 'xã', 1241, 'hienthi', 0, 1759490174, NULL),
(14482, 37, 0, 0, 'xa_gia_hung', 'Xã Gia Hưng', 'gia_hung', '14482', 'xã', 1242, 'hienthi', 0, 1759490174, NULL),
(14524, 37, 0, 0, 'xa_gia_phong', 'Xã Gia Phong', 'gia_phong', '14524', 'xã', 1243, 'hienthi', 0, 1759490174, NULL),
(14488, 37, 0, 0, 'xa_gia_van', 'Xã Gia Vân', 'gia_van', '14488', 'xã', 1244, 'hienthi', 0, 1759490174, NULL),
(14494, 37, 0, 0, 'xa_gia_tran', 'Xã Gia Trấn', 'gia_tran', '14494', 'xã', 1245, 'hienthi', 0, 1759490174, NULL),
(14428, 37, 0, 0, 'xa_nho_quan', 'Xã Nho Quan', 'nho_quan', '14428', 'xã', 1246, 'hienthi', 0, 1759490174, NULL),
(14389, 37, 0, 0, 'xa_gia_lam', 'Xã Gia Lâm', 'gia_lam', '14389', 'xã', 1247, 'hienthi', 0, 1759490174, NULL),
(14401, 37, 0, 0, 'xa_gia_tuong', 'Xã Gia Tường', 'gia_tuong', '14401', 'xã', 1248, 'hienthi', 0, 1759490174, NULL),
(14407, 37, 0, 0, 'xa_phu_son', 'Xã Phú Sơn', 'phu_son', '14407', 'xã', 1249, 'hienthi', 0, 1759490174, NULL),
(14404, 37, 0, 0, 'xa_cuc_phuong', 'Xã Cúc Phương', 'cuc_phuong', '14404', 'xã', 1250, 'hienthi', 0, 1759490174, NULL),
(14458, 37, 0, 0, 'xa_phu_long', 'Xã Phú Long', 'phu_long', '14458', 'xã', 1251, 'hienthi', 0, 1759490174, NULL),
(14434, 37, 0, 0, 'xa_thanh_son', 'Xã Thanh Sơn', 'thanh_son', '14434', 'xã', 1252, 'hienthi', 0, 1759490174, NULL),
(14452, 37, 0, 0, 'xa_quynh_luu', 'Xã Quỳnh Lưu', 'quynh_luu', '14452', 'xã', 1253, 'hienthi', 0, 1759490174, NULL),
(14560, 37, 0, 0, 'xa_yen_khanh', 'Xã Yên Khánh', 'yen_khanh', '14560', 'xã', 1254, 'hienthi', 0, 1759490174, NULL),
(14611, 37, 0, 0, 'xa_khanh_nhac', 'Xã Khánh Nhạc', 'khanh_nhac', '14611', 'xã', 1255, 'hienthi', 0, 1759490174, NULL),
(14563, 37, 0, 0, 'xa_khanh_thien', 'Xã Khánh Thiện', 'khanh_thien', '14563', 'xã', 1256, 'hienthi', 0, 1759490174, NULL),
(14599, 37, 0, 0, 'xa_khanh_hoi', 'Xã Khánh Hội', 'khanh_hoi', '14599', 'xã', 1257, 'hienthi', 0, 1759490174, NULL),
(14608, 37, 0, 0, 'xa_khanh_trung', 'Xã Khánh Trung', 'khanh_trung', '14608', 'xã', 1258, 'hienthi', 0, 1759490174, NULL),
(14701, 37, 0, 0, 'xa_yen_mo', 'Xã Yên Mô', 'yen_mo', '14701', 'xã', 1259, 'hienthi', 0, 1759490174, NULL),
(14728, 37, 0, 0, 'xa_yen_tu', 'Xã Yên Từ', 'yen_tu', '14728', 'xã', 1260, 'hienthi', 0, 1759490174, NULL),
(14743, 37, 0, 0, 'xa_yen_mac', 'Xã Yên Mạc', 'yen_mac', '14743', 'xã', 1261, 'hienthi', 0, 1759490174, NULL),
(14746, 37, 0, 0, 'xa_dong_thai', 'Xã Đồng Thái', 'dong_thai', '14746', 'xã', 1262, 'hienthi', 0, 1759490174, NULL),
(14653, 37, 0, 0, 'xa_chat_binh', 'Xã Chất Bình', 'chat_binh', '14653', 'xã', 1263, 'hienthi', 0, 1759490174, NULL),
(14638, 37, 0, 0, 'xa_kim_son', 'Xã Kim Sơn', 'kim_son', '14638', 'xã', 1264, 'hienthi', 0, 1759490174, NULL),
(14647, 37, 0, 0, 'xa_quang_thien', 'Xã Quang Thiện', 'quang_thien', '14647', 'xã', 1265, 'hienthi', 0, 1759490174, NULL),
(14620, 37, 0, 0, 'xa_phat_diem', 'Xã Phát Diệm', 'phat_diem', '14620', 'xã', 1266, 'hienthi', 0, 1759490174, NULL),
(14674, 37, 0, 0, 'xa_lai_thanh', 'Xã Lai Thành', 'lai_thanh', '14674', 'xã', 1267, 'hienthi', 0, 1759490174, NULL),
(14677, 37, 0, 0, 'xa_dinh_hoa', 'Xã Định Hóa', 'dinh_hoa', '14677', 'xã', 1268, 'hienthi', 0, 1759490174, NULL),
(14623, 37, 0, 0, 'xa_binh_minh', 'Xã Bình Minh', 'binh_minh', '14623', 'xã', 1269, 'hienthi', 0, 1759490174, NULL),
(14698, 37, 0, 0, 'xa_kim_dong', 'Xã Kim Đông', 'kim_dong', '14698', 'xã', 1270, 'hienthi', 0, 1759490174, NULL),
(13504, 37, 0, 0, 'xa_binh_luc', 'Xã Bình Lục', 'binh_luc', '13504', 'xã', 1271, 'hienthi', 0, 1759490174, NULL),
(13501, 37, 0, 0, 'xa_binh_my', 'Xã Bình Mỹ', 'binh_my', '13501', 'xã', 1272, 'hienthi', 0, 1759490174, NULL),
(13540, 37, 0, 0, 'xa_binh_an', 'Xã Bình An', 'binh_an', '13540', 'xã', 1273, 'hienthi', 0, 1759490174, NULL),
(13531, 37, 0, 0, 'xa_binh_giang', 'Xã Bình Giang', 'binh_giang', '13531', 'xã', 1274, 'hienthi', 0, 1759490174, NULL),
(13558, 37, 0, 0, 'xa_binh_son', 'Xã Bình Sơn', 'binh_son', '13558', 'xã', 1275, 'hienthi', 0, 1759490174, NULL),
(13456, 37, 0, 0, 'xa_liem_ha', 'Xã Liêm Hà', 'liem_ha', '13456', 'xã', 1276, 'hienthi', 0, 1759490174, NULL),
(13474, 37, 0, 0, 'xa_tan_thanh', 'Xã Tân Thanh', 'tan_thanh', '13474', 'xã', 1277, 'hienthi', 0, 1759490174, NULL),
(13483, 37, 0, 0, 'xa_thanh_binh', 'Xã Thanh Bình', 'thanh_binh', '13483', 'xã', 1278, 'hienthi', 0, 1759490174, NULL),
(13489, 37, 0, 0, 'xa_thanh_lam', 'Xã Thanh Lâm', 'thanh_lam', '13489', 'xã', 1279, 'hienthi', 0, 1759490174, NULL),
(13495, 37, 0, 0, 'xa_thanh_liem', 'Xã Thanh Liêm', 'thanh_liem', '13495', 'xã', 1280, 'hienthi', 0, 1759490174, NULL),
(13573, 37, 0, 0, 'xa_ly_nhan', 'Xã Lý Nhân', 'ly_nhan', '13573', 'xã', 1281, 'hienthi', 0, 1759490174, NULL),
(13591, 37, 0, 0, 'xa_nam_xang', 'Xã Nam Xang', 'nam_xang', '13591', 'xã', 1282, 'hienthi', 0, 1759490174, NULL),
(13579, 37, 0, 0, 'xa_bac_ly', 'Xã Bắc Lý', 'bac_ly', '13579', 'xã', 1283, 'hienthi', 0, 1759490174, NULL),
(13597, 37, 0, 0, 'xa_vinh_tru', 'Xã Vĩnh Trụ', 'vinh_tru', '13597', 'xã', 1284, 'hienthi', 0, 1759490174, NULL),
(13594, 37, 0, 0, 'xa_tran_thuong', 'Xã Trần Thương', 'tran_thuong', '13594', 'xã', 1285, 'hienthi', 0, 1759490174, NULL),
(13609, 37, 0, 0, 'xa_nhan_ha', 'Xã Nhân Hà', 'nhan_ha', '13609', 'xã', 1286, 'hienthi', 0, 1759490174, NULL),
(13627, 37, 0, 0, 'xa_nam_ly', 'Xã Nam Lý', 'nam_ly', '13627', 'xã', 1287, 'hienthi', 0, 1759490174, NULL),
(13966, 37, 0, 0, 'xa_nam_truc', 'Xã Nam Trực', 'nam_truc', '13966', 'xã', 1288, 'hienthi', 0, 1759490174, NULL),
(14011, 37, 0, 0, 'xa_nam_minh', 'Xã Nam Minh', 'nam_minh', '14011', 'xã', 1289, 'hienthi', 0, 1759490174, NULL),
(14014, 37, 0, 0, 'xa_nam_dong', 'Xã Nam Đồng', 'nam_dong', '14014', 'xã', 1290, 'hienthi', 0, 1759490174, NULL),
(14005, 37, 0, 0, 'xa_nam_ninh', 'Xã Nam Ninh', 'nam_ninh', '14005', 'xã', 1291, 'hienthi', 0, 1759490174, NULL),
(13987, 37, 0, 0, 'xa_nam_hong', 'Xã Nam Hồng', 'nam_hong', '13987', 'xã', 1292, 'hienthi', 0, 1759490174, NULL),
(13750, 37, 0, 0, 'xa_minh_tan', 'Xã Minh Tân', 'minh_tan', '13750', 'xã', 1293, 'hienthi', 0, 1759490174, NULL),
(13753, 37, 0, 0, 'xa_hien_khanh', 'Xã Hiển Khánh', 'hien_khanh', '13753', 'xã', 1294, 'hienthi', 0, 1759490174, NULL),
(13741, 37, 0, 0, 'xa_vu_ban', 'Xã Vụ Bản', 'vu_ban', '13741', 'xã', 1295, 'hienthi', 0, 1759490174, NULL),
(13786, 37, 0, 0, 'xa_lien_minh', 'Xã Liên Minh', 'lien_minh', '13786', 'xã', 1296, 'hienthi', 0, 1759490174, NULL),
(13795, 37, 0, 0, 'xa_y_yen', 'Xã Ý Yên', 'y_yen', '13795', 'xã', 1297, 'hienthi', 0, 1759490174, NULL),
(13879, 37, 0, 0, 'xa_yen_dong', 'Xã Yên Đồng', 'yen_dong', '13879', 'xã', 1298, 'hienthi', 0, 1759490174, NULL),
(13870, 37, 0, 0, 'xa_yen_cuong', 'Xã Yên Cường', 'yen_cuong', '13870', 'xã', 1299, 'hienthi', 0, 1759490174, NULL),
(13864, 37, 0, 0, 'xa_van_thang', 'Xã Vạn Thắng', 'van_thang', '13864', 'xã', 1300, 'hienthi', 0, 1759490174, NULL),
(13834, 37, 0, 0, 'xa_vu_duong', 'Xã Vũ Dương', 'vu_duong', '13834', 'xã', 1301, 'hienthi', 0, 1759490174, NULL),
(13807, 37, 0, 0, 'xa_tan_minh', 'Xã Tân Minh', 'tan_minh', '13807', 'xã', 1302, 'hienthi', 0, 1759490174, NULL),
(13822, 37, 0, 0, 'xa_phong_doanh', 'Xã Phong Doanh', 'phong_doanh', '13822', 'xã', 1303, 'hienthi', 0, 1759490174, NULL),
(14026, 37, 0, 0, 'xa_co_le', 'Xã Cổ Lễ', 'co_le', '14026', 'xã', 1304, 'hienthi', 0, 1759490174, NULL),
(14038, 37, 0, 0, 'xa_ninh_giang', 'Xã Ninh Giang', 'ninh_giang', '14038', 'xã', 1305, 'hienthi', 0, 1759490174, NULL),
(14056, 37, 0, 0, 'xa_cat_thanh', 'Xã Cát Thành', 'cat_thanh', '14056', 'xã', 1306, 'hienthi', 0, 1759490174, NULL),
(14053, 37, 0, 0, 'xa_truc_ninh', 'Xã Trực Ninh', 'truc_ninh', '14053', 'xã', 1307, 'hienthi', 0, 1759490174, NULL),
(14062, 37, 0, 0, 'xa_quang_hung', 'Xã Quang Hưng', 'quang_hung', '14062', 'xã', 1308, 'hienthi', 0, 1759490174, NULL),
(14071, 37, 0, 0, 'xa_minh_thai', 'Xã Minh Thái', 'minh_thai', '14071', 'xã', 1309, 'hienthi', 0, 1759490174, NULL),
(14077, 37, 0, 0, 'xa_ninh_cuong', 'Xã Ninh Cường', 'ninh_cuong', '14077', 'xã', 1310, 'hienthi', 0, 1759490174, NULL),
(14089, 37, 0, 0, 'xa_xuan_truong', 'Xã Xuân Trường', 'xuan_truong', '14089', 'xã', 1311, 'hienthi', 0, 1759490174, NULL),
(14122, 37, 0, 0, 'xa_xuan_hung', 'Xã Xuân Hưng', 'xuan_hung', '14122', 'xã', 1312, 'hienthi', 0, 1759490174, NULL),
(14104, 37, 0, 0, 'xa_xuan_giang', 'Xã  Xuân Giang', 'xuan_giang', '14104', 'xã', 1313, 'hienthi', 0, 1759490174, NULL),
(14095, 37, 0, 0, 'xa_xuan_hong', 'Xã Xuân Hồng', 'xuan_hong', '14095', 'xã', 1314, 'hienthi', 0, 1759490174, NULL),
(14215, 37, 0, 0, 'xa_hai_hau', 'Xã Hải Hậu', 'hai_hau', '14215', 'xã', 1315, 'hienthi', 0, 1759490174, NULL),
(14236, 37, 0, 0, 'xa_hai_anh', 'Xã Hải Anh', 'hai_anh', '14236', 'xã', 1316, 'hienthi', 0, 1759490174, NULL),
(14218, 37, 0, 0, 'xa_hai_tien', 'Xã Hải Tiến', 'hai_tien', '14218', 'xã', 1317, 'hienthi', 0, 1759490174, NULL),
(14248, 37, 0, 0, 'xa_hai_hung', 'Xã Hải Hưng', 'hai_hung', '14248', 'xã', 1318, 'hienthi', 0, 1759490174, NULL),
(14281, 37, 0, 0, 'xa_hai_an', 'Xã Hải An', 'hai_an', '14281', 'xã', 1319, 'hienthi', 0, 1759490174, NULL),
(14287, 37, 0, 0, 'xa_hai_quang', 'Xã Hải Quang', 'hai_quang', '14287', 'xã', 1320, 'hienthi', 0, 1759490174, NULL),
(14308, 37, 0, 0, 'xa_hai_xuan', 'Xã Hải Xuân', 'hai_xuan', '14308', 'xã', 1321, 'hienthi', 0, 1759490174, NULL),
(14221, 37, 0, 0, 'xa_hai_thinh', 'Xã Hải Thịnh', 'hai_thinh', '14221', 'xã', 1322, 'hienthi', 0, 1759490174, NULL),
(14161, 37, 0, 0, 'xa_giao_minh', 'Xã Giao Minh', 'giao_minh', '14161', 'xã', 1323, 'hienthi', 0, 1759490174, NULL),
(14182, 37, 0, 0, 'xa_giao_hoa', 'Xã Giao Hoà', 'giao_hoa', '14182', 'xã', 1324, 'hienthi', 0, 1759490174, NULL);
INSERT INTO `table_ward` (`id`, `id_city`, `id_district`, `districtid`, `wardcode`, `name`, `slug`, `code`, `level`, `numb`, `status`, `date_updated`, `date_created`, `ship_price`) VALUES
(14167, 37, 0, 0, 'xa_giao_thuy', 'Xã Giao Thuỷ', 'giao_thuy', '14167', 'xã', 1325, 'hienthi', 0, 1759490174, NULL),
(14203, 37, 0, 0, 'xa_giao_phuc', 'Xã Giao Phúc', 'giao_phuc', '14203', 'xã', 1326, 'hienthi', 0, 1759490174, NULL),
(14179, 37, 0, 0, 'xa_giao_hung', 'Xã Giao Hưng', 'giao_hung', '14179', 'xã', 1327, 'hienthi', 0, 1759490174, NULL),
(14194, 37, 0, 0, 'xa_giao_binh', 'Xã Giao Bình', 'giao_binh', '14194', 'xã', 1328, 'hienthi', 0, 1759490174, NULL),
(14212, 37, 0, 0, 'xa_giao_ninh', 'Xã Giao Ninh', 'giao_ninh', '14212', 'xã', 1329, 'hienthi', 0, 1759490174, NULL),
(13900, 37, 0, 0, 'xa_dong_thinh', 'Xã Đồng Thịnh', 'dong_thinh', '13900', 'xã', 1330, 'hienthi', 0, 1759490174, NULL),
(13891, 37, 0, 0, 'xa_nghia_hung', 'Xã Nghĩa Hưng', 'nghia_hung', '13891', 'xã', 1331, 'hienthi', 0, 1759490174, NULL),
(13918, 37, 0, 0, 'xa_nghia_son', 'Xã Nghĩa Sơn', 'nghia_son', '13918', 'xã', 1332, 'hienthi', 0, 1759490174, NULL),
(13927, 37, 0, 0, 'xa_hong_phong', 'Xã Hồng Phong', 'hong_phong', '13927', 'xã', 1333, 'hienthi', 0, 1759490174, NULL),
(13939, 37, 0, 0, 'xa_quy_nhat', 'Xã Quỹ Nhất', 'quy_nhat', '13939', 'xã', 1334, 'hienthi', 0, 1759490174, NULL),
(13957, 37, 0, 0, 'xa_nghia_lam', 'Xã Nghĩa Lâm', 'nghia_lam', '13957', 'xã', 1335, 'hienthi', 0, 1759490174, NULL),
(13894, 37, 0, 0, 'xa_rang_dong', 'Xã Rạng Đông', 'rang_dong', '13894', 'xã', 1336, 'hienthi', 0, 1759490174, NULL),
(14533, 37, 0, 0, 'phuong_tay_hoa_lu', 'Phường Tây Hoa Lư', 'tay_hoa_lu', '14533', 'phường', 1337, 'hienthi', 0, 1759490174, NULL),
(14329, 37, 0, 0, 'phuong_hoa_lu', 'Phường Hoa Lư', 'hoa_lu', '14329', 'phường', 1338, 'hienthi', 0, 1759490174, NULL),
(14359, 37, 0, 0, 'phuong_nam_hoa_lu', 'Phường Nam Hoa Lư', 'nam_hoa_lu', '14359', 'phường', 1339, 'hienthi', 0, 1759490174, NULL),
(14566, 37, 0, 0, 'phuong_dong_hoa_lu', 'Phường Đông Hoa Lư', 'dong_hoa_lu', '14566', 'phường', 1340, 'hienthi', 0, 1759490174, NULL),
(14362, 37, 0, 0, 'phuong_tam_diep', 'Phường Tam Điệp', 'tam_diep', '14362', 'phường', 1341, 'hienthi', 0, 1759490174, NULL),
(14371, 37, 0, 0, 'phuong_yen_son', 'Phường Yên Sơn', 'yen_son', '14371', 'phường', 1342, 'hienthi', 0, 1759490174, NULL),
(14365, 37, 0, 0, 'phuong_trung_son', 'Phường Trung Sơn', 'trung_son', '14365', 'phường', 1343, 'hienthi', 0, 1759490174, NULL),
(14725, 37, 0, 0, 'phuong_yen_thang', 'Phường Yên Thắng', 'yen_thang', '14725', 'phường', 1344, 'hienthi', 0, 1759490174, NULL),
(13366, 37, 0, 0, 'phuong_ha_nam', 'Phường Hà Nam', 'ha_nam', '13366', 'phường', 1345, 'hienthi', 0, 1759490174, NULL),
(13291, 37, 0, 0, 'phuong_phu_ly', 'Phường Phủ Lý', 'phu_ly', '13291', 'phường', 1346, 'hienthi', 0, 1759490174, NULL),
(13318, 37, 0, 0, 'phuong_phu_van', 'Phường Phù Vân', 'phu_van', '13318', 'phường', 1347, 'hienthi', 0, 1759490174, NULL),
(13285, 37, 0, 0, 'phuong_chau_son', 'Phường Châu Sơn', 'chau_son', '13285', 'phường', 1348, 'hienthi', 0, 1759490174, NULL),
(13444, 37, 0, 0, 'phuong_liem_tuyen', 'Phường Liêm Tuyền', 'liem_tuyen', '13444', 'phường', 1349, 'hienthi', 0, 1759490174, NULL),
(13324, 37, 0, 0, 'phuong_duy_tien', 'Phường Duy Tiên', 'duy_tien', '13324', 'phường', 1350, 'hienthi', 0, 1759490174, NULL),
(13330, 37, 0, 0, 'phuong_duy_tan', 'Phường Duy Tân', 'duy_tan', '13330', 'phường', 1351, 'hienthi', 0, 1759490174, NULL),
(13348, 37, 0, 0, 'phuong_dong_van', 'Phường Đồng Văn', 'dong_van', '13348', 'phường', 1352, 'hienthi', 0, 1759490174, NULL),
(13336, 37, 0, 0, 'phuong_duy_ha', 'Phường Duy Hà', 'duy_ha', '13336', 'phường', 1353, 'hienthi', 0, 1759490174, NULL),
(13363, 37, 0, 0, 'phuong_tien_son', 'Phường Tiên Sơn', 'tien_son', '13363', 'phường', 1354, 'hienthi', 0, 1759490174, NULL),
(13393, 37, 0, 0, 'phuong_le_ho', 'Phường Lê Hồ', 'le_ho', '13393', 'phường', 1355, 'hienthi', 0, 1759490174, NULL),
(13396, 37, 0, 0, 'phuong_nguyen_uy', 'Phường Nguyễn Uý', 'nguyen_uy', '13396', 'phường', 1356, 'hienthi', 0, 1759490174, NULL),
(13435, 37, 0, 0, 'phuong_ly_thuong_kiet', 'Phường Lý Thường Kiệt', 'ly_thuong_kiet', '13435', 'phường', 1357, 'hienthi', 0, 1759490174, NULL),
(13402, 37, 0, 0, 'phuong_kim_thanh', 'Phường Kim Thanh', 'kim_thanh', '13402', 'phường', 1358, 'hienthi', 0, 1759490174, NULL),
(13420, 37, 0, 0, 'phuong_tam_chuc', 'Phường Tam Chúc', 'tam_chuc', '13420', 'phường', 1359, 'hienthi', 0, 1759490174, NULL),
(13384, 37, 0, 0, 'phuong_kim_bang', 'Phường Kim Bảng', 'kim_bang', '13384', 'phường', 1360, 'hienthi', 0, 1759490174, NULL),
(13666, 37, 0, 0, 'phuong_nam_dinh', 'Phường Nam Định', 'nam_dinh', '13666', 'phường', 1361, 'hienthi', 0, 1759490174, NULL),
(13684, 37, 0, 0, 'phuong_thien_truong', 'Phường Thiên Trường', 'thien_truong', '13684', 'phường', 1362, 'hienthi', 0, 1759490174, NULL),
(13693, 37, 0, 0, 'phuong_dong_a', 'Phường Đông A', 'dong_a', '13693', 'phường', 1363, 'hienthi', 0, 1759490174, NULL),
(13972, 37, 0, 0, 'phuong_vi_khe', 'Phường Vị Khê', 'vi_khe', '13972', 'phường', 1364, 'hienthi', 0, 1759490174, NULL),
(13699, 37, 0, 0, 'phuong_thanh_nam', 'Phường Thành Nam', 'thanh_nam', '13699', 'phường', 1365, 'hienthi', 0, 1759490174, NULL),
(13777, 37, 0, 0, 'phuong_truong_thi', 'Phường Trường Thi', 'truong_thi', '13777', 'phường', 1366, 'hienthi', 0, 1759490174, NULL),
(13984, 37, 0, 0, 'phuong_hong_quang', 'Phường Hồng Quang', 'hong_quang', '13984', 'phường', 1367, 'hienthi', 0, 1759490174, NULL),
(13735, 37, 0, 0, 'phuong_my_loc', 'Phường Mỹ Lộc', 'my_loc', '13735', 'phường', 1368, 'hienthi', 0, 1759490174, NULL),
(14797, 38, 0, 0, 'phuong_hac_thanh', 'Phường Hạc Thành', 'hac_thanh', '14797', 'phường', 1369, 'hienthi', 0, 1759490174, NULL),
(16522, 38, 0, 0, 'phuong_quang_phu', 'Phường Quảng Phú', 'quang_phu', '16522', 'phường', 1370, 'hienthi', 0, 1759490174, NULL),
(16417, 38, 0, 0, 'phuong_dong_quang', 'Phường Đông Quang', 'dong_quang', '16417', 'phường', 1371, 'hienthi', 0, 1759490174, NULL),
(16378, 38, 0, 0, 'phuong_dong_son', 'Phường Đông Sơn', 'dong_son', '16378', 'phường', 1372, 'hienthi', 0, 1759490174, NULL),
(15853, 38, 0, 0, 'phuong_dong_tien', 'Phường Đông Tiến', 'dong_tien', '15853', 'phường', 1373, 'hienthi', 0, 1759490174, NULL),
(14758, 38, 0, 0, 'phuong_ham_rong', 'Phường Hàm Rồng', 'ham_rong', '14758', 'phường', 1374, 'hienthi', 0, 1759490174, NULL),
(15925, 38, 0, 0, 'phuong_nguyet_vien', 'Phường Nguyệt Viên', 'nguyet_vien', '15925', 'phường', 1375, 'hienthi', 0, 1759490174, NULL),
(16531, 38, 0, 0, 'phuong_sam_son', 'Phường Sầm Sơn', 'sam_son', '16531', 'phường', 1376, 'hienthi', 0, 1759490174, NULL),
(16516, 38, 0, 0, 'phuong_nam_sam_son', 'Phường Nam Sầm Sơn', 'nam_sam_son', '16516', 'phường', 1377, 'hienthi', 0, 1759490174, NULL),
(14812, 38, 0, 0, 'phuong_bim_son', 'Phường Bỉm Sơn', 'bim_son', '14812', 'phường', 1378, 'hienthi', 0, 1759490174, NULL),
(14818, 38, 0, 0, 'phuong_quang_trung', 'Phường Quang Trung', 'quang_trung', '14818', 'phường', 1379, 'hienthi', 0, 1759490174, NULL),
(16576, 38, 0, 0, 'phuong_ngoc_son', 'Phường Ngọc Sơn', 'ngoc_son', '16576', 'phường', 1380, 'hienthi', 0, 1759490174, NULL),
(16594, 38, 0, 0, 'phuong_tan_dan', 'Phường Tân Dân', 'tan_dan', '16594', 'phường', 1381, 'hienthi', 0, 1759490174, NULL),
(16597, 38, 0, 0, 'phuong_hai_linh', 'Phường Hải Lĩnh', 'hai_linh', '16597', 'phường', 1382, 'hienthi', 0, 1759490174, NULL),
(16561, 38, 0, 0, 'phuong_tinh_gia', 'Phường Tĩnh Gia', 'tinh_gia', '16561', 'phường', 1383, 'hienthi', 0, 1759490174, NULL),
(16609, 38, 0, 0, 'phuong_dao_duy_tu', 'Phường Đào Duy Tư', 'dao_duy_tu', '16609', 'phường', 1384, 'hienthi', 0, 1759490174, NULL),
(16645, 38, 0, 0, 'phuong_hai_binh', 'Phường Hải Bình', 'hai_binh', '16645', 'phường', 1385, 'hienthi', 0, 1759490174, NULL),
(16624, 38, 0, 0, 'phuong_truc_lam', 'Phường Trúc Lâm', 'truc_lam', '16624', 'phường', 1386, 'hienthi', 0, 1759490174, NULL),
(16654, 38, 0, 0, 'phuong_nghi_son', 'Phường Nghi Sơn', 'nghi_son', '16654', 'phường', 1387, 'hienthi', 0, 1759490174, NULL),
(16591, 38, 0, 0, 'xa_cac_son', 'Xã Các Sơn', 'cac_son', '16591', 'xã', 1388, 'hienthi', 0, 1759490174, NULL),
(16636, 38, 0, 0, 'xa_truong_lam', 'Xã Trường Lâm', 'truong_lam', '16636', 'xã', 1389, 'hienthi', 0, 1759490174, NULL),
(15271, 38, 0, 0, 'xa_ha_trung', 'Xã Hà Trung', 'ha_trung', '15271', 'xã', 1390, 'hienthi', 0, 1759490174, NULL),
(15316, 38, 0, 0, 'xa_tong_son', 'Xã Tống Sơn', 'tong_son', '15316', 'xã', 1391, 'hienthi', 0, 1759490174, NULL),
(15274, 38, 0, 0, 'xa_ha_long', 'Xã Hà Long', 'ha_long', '15274', 'xã', 1392, 'hienthi', 0, 1759490174, NULL),
(15286, 38, 0, 0, 'xa_hoat_giang', 'Xã Hoạt Giang', 'hoat_giang', '15286', 'xã', 1393, 'hienthi', 0, 1759490174, NULL),
(15298, 38, 0, 0, 'xa_linh_toai', 'Xã Lĩnh Toại', 'linh_toai', '15298', 'xã', 1394, 'hienthi', 0, 1759490174, NULL),
(16021, 38, 0, 0, 'xa_trieu_loc', 'Xã Triệu Lộc', 'trieu_loc', '16021', 'xã', 1395, 'hienthi', 0, 1759490174, NULL),
(16033, 38, 0, 0, 'xa_dong_thanh', 'Xã Đông Thành', 'dong_thanh', '16033', 'xã', 1396, 'hienthi', 0, 1759490174, NULL),
(16012, 38, 0, 0, 'xa_hau_loc', 'Xã Hậu Lộc', 'hau_loc', '16012', 'xã', 1397, 'hienthi', 0, 1759490174, NULL),
(16063, 38, 0, 0, 'xa_hoa_loc', 'Xã Hoa Lộc', 'hoa_loc', '16063', 'xã', 1398, 'hienthi', 0, 1759490174, NULL),
(16078, 38, 0, 0, 'xa_van_loc', 'Xã Vạn Lộc', 'van_loc', '16078', 'xã', 1399, 'hienthi', 0, 1759490174, NULL),
(16093, 38, 0, 0, 'xa_nga_son', 'Xã Nga Sơn', 'nga_son', '16093', 'xã', 1400, 'hienthi', 0, 1759490174, NULL),
(16114, 38, 0, 0, 'xa_nga_thang', 'Xã Nga Thắng', 'nga_thang', '16114', 'xã', 1401, 'hienthi', 0, 1759490174, NULL),
(16138, 38, 0, 0, 'xa_ho_vuong', 'Xã Hồ Vương', 'ho_vuong', '16138', 'xã', 1402, 'hienthi', 0, 1759490174, NULL),
(16108, 38, 0, 0, 'xa_tan_tien', 'Xã Tân Tiến', 'tan_tien', '16108', 'xã', 1403, 'hienthi', 0, 1759490174, NULL),
(16144, 38, 0, 0, 'xa_nga_an', 'Xã Nga An', 'nga_an', '16144', 'xã', 1404, 'hienthi', 0, 1759490174, NULL),
(16171, 38, 0, 0, 'xa_ba_dinh', 'Xã Ba Đình', 'ba_dinh', '16171', 'xã', 1405, 'hienthi', 0, 1759490174, NULL),
(15865, 38, 0, 0, 'xa_hoang_hoa', 'Xã Hoằng Hóa', 'hoang_hoa', '15865', 'xã', 1406, 'hienthi', 0, 1759490174, NULL),
(15991, 38, 0, 0, 'xa_hoang_tien', 'Xã Hoằng Tiến', 'hoang_tien', '15991', 'xã', 1407, 'hienthi', 0, 1759490174, NULL),
(16000, 38, 0, 0, 'xa_hoang_thanh', 'Xã Hoằng Thanh', 'hoang_thanh', '16000', 'xã', 1408, 'hienthi', 0, 1759490174, NULL),
(15961, 38, 0, 0, 'xa_hoang_loc', 'Xã Hoằng Lộc', 'hoang_loc', '15961', 'xã', 1409, 'hienthi', 0, 1759490174, NULL),
(15976, 38, 0, 0, 'xa_hoang_chau', 'Xã Hoằng Châu', 'hoang_chau', '15976', 'xã', 1410, 'hienthi', 0, 1759490174, NULL),
(15910, 38, 0, 0, 'xa_hoang_son', 'Xã Hoằng Sơn', 'hoang_son', '15910', 'xã', 1411, 'hienthi', 0, 1759490174, NULL),
(15889, 38, 0, 0, 'xa_hoang_phu', 'Xã Hoằng Phú', 'hoang_phu', '15889', 'xã', 1412, 'hienthi', 0, 1759490174, NULL),
(15880, 38, 0, 0, 'xa_hoang_giang', 'Xã Hoằng Giang', 'hoang_giang', '15880', 'xã', 1413, 'hienthi', 0, 1759490174, NULL),
(16438, 38, 0, 0, 'xa_luu_ve', 'Xã Lưu Vệ', 'luu_ve', '16438', 'xã', 1414, 'hienthi', 0, 1759490174, NULL),
(16480, 38, 0, 0, 'xa_quang_yen', 'Xã Quảng Yên', 'quang_yen', '16480', 'xã', 1415, 'hienthi', 0, 1759490174, NULL),
(16498, 38, 0, 0, 'xa_quang_ngoc', 'Xã Quảng Ngọc', 'quang_ngoc', '16498', 'xã', 1416, 'hienthi', 0, 1759490174, NULL),
(16540, 38, 0, 0, 'xa_quang_ninh', 'Xã Quảng Ninh', 'quang_ninh', '16540', 'xã', 1417, 'hienthi', 0, 1759490174, NULL),
(16543, 38, 0, 0, 'xa_quang_binh', 'Xã Quảng Bình', 'quang_binh', '16543', 'xã', 1418, 'hienthi', 0, 1759490174, NULL),
(16549, 38, 0, 0, 'xa_tien_trang', 'Xã Tiên Trang', 'tien_trang', '16549', 'xã', 1419, 'hienthi', 0, 1759490174, NULL),
(16489, 38, 0, 0, 'xa_quang_chinh', 'Xã Quảng Chính', 'quang_chinh', '16489', 'xã', 1420, 'hienthi', 0, 1759490174, NULL),
(16279, 38, 0, 0, 'xa_nong_cong', 'Xã Nông Cống', 'nong_cong', '16279', 'xã', 1421, 'hienthi', 0, 1759490174, NULL),
(16309, 38, 0, 0, 'xa_thang_loi', 'Xã Thắng Lợi', 'thang_loi', '16309', 'xã', 1422, 'hienthi', 0, 1759490174, NULL),
(16297, 38, 0, 0, 'xa_trung_chinh', 'Xã Trung Chính', 'trung_chinh', '16297', 'xã', 1423, 'hienthi', 0, 1759490174, NULL),
(16348, 38, 0, 0, 'xa_truong_van', 'Xã Trường Văn', 'truong_van', '16348', 'xã', 1424, 'hienthi', 0, 1759490174, NULL),
(16342, 38, 0, 0, 'xa_thang_binh', 'Xã Thăng Bình', 'thang_binh', '16342', 'xã', 1425, 'hienthi', 0, 1759490174, NULL),
(16363, 38, 0, 0, 'xa_tuong_linh', 'Xã Tượng Lĩnh', 'tuong_linh', '16363', 'xã', 1426, 'hienthi', 0, 1759490174, NULL),
(16369, 38, 0, 0, 'xa_cong_chinh', 'Xã Công Chính', 'cong_chinh', '16369', 'xã', 1427, 'hienthi', 0, 1759490174, NULL),
(15772, 38, 0, 0, 'xa_thieu_hoa', 'Xã Thiệu Hóa', 'thieu_hoa', '15772', 'xã', 1428, 'hienthi', 0, 1759490174, NULL),
(15796, 38, 0, 0, 'xa_thieu_quang', 'Xã Thiệu Quang', 'thieu_quang', '15796', 'xã', 1429, 'hienthi', 0, 1759490174, NULL),
(15778, 38, 0, 0, 'xa_thieu_tien', 'Xã Thiệu Tiến', 'thieu_tien', '15778', 'xã', 1430, 'hienthi', 0, 1759490174, NULL),
(15820, 38, 0, 0, 'xa_thieu_toan', 'Xã Thiệu Toán', 'thieu_toan', '15820', 'xã', 1431, 'hienthi', 0, 1759490174, NULL),
(15835, 38, 0, 0, 'xa_thieu_trung', 'Xã Thiệu Trung', 'thieu_trung', '15835', 'xã', 1432, 'hienthi', 0, 1759490174, NULL),
(15469, 38, 0, 0, 'xa_yen_dinh', 'Xã Yên Định', 'yen_dinh', '15469', 'xã', 1433, 'hienthi', 0, 1759490174, NULL),
(15421, 38, 0, 0, 'xa_yen_truong', 'Xã Yên Trường', 'yen_truong', '15421', 'xã', 1434, 'hienthi', 0, 1759490174, NULL),
(15409, 38, 0, 0, 'xa_yen_phu', 'Xã Yên Phú', 'yen_phu', '15409', 'xã', 1435, 'hienthi', 0, 1759490174, NULL),
(15412, 38, 0, 0, 'xa_quy_loc', 'Xã Quý Lộc', 'quy_loc', '15412', 'xã', 1436, 'hienthi', 0, 1759490174, NULL),
(15442, 38, 0, 0, 'xa_yen_ninh', 'Xã Yên Ninh', 'yen_ninh', '15442', 'xã', 1437, 'hienthi', 0, 1759490174, NULL),
(15457, 38, 0, 0, 'xa_dinh_tan', 'Xã Định Tân', 'dinh_tan', '15457', 'xã', 1438, 'hienthi', 0, 1759490174, NULL),
(15448, 38, 0, 0, 'xa_dinh_hoa', 'Xã Định Hòa', 'dinh_hoa', '15448', 'xã', 1439, 'hienthi', 0, 1759490174, NULL),
(15499, 38, 0, 0, 'xa_tho_xuan', 'Xã Thọ Xuân', 'tho_xuan', '15499', 'xã', 1440, 'hienthi', 0, 1759490174, NULL),
(15505, 38, 0, 0, 'xa_tho_long', 'Xã Thọ Long', 'tho_long', '15505', 'xã', 1441, 'hienthi', 0, 1759490174, NULL),
(15520, 38, 0, 0, 'xa_xuan_hoa', 'Xã Xuân Hòa', 'xuan_hoa', '15520', 'xã', 1442, 'hienthi', 0, 1759490174, NULL),
(15553, 38, 0, 0, 'xa_sao_vang', 'Xã Sao Vàng', 'sao_vang', '15553', 'xã', 1443, 'hienthi', 0, 1759490174, NULL),
(15544, 38, 0, 0, 'xa_lam_son', 'Xã Lam Sơn', 'lam_son', '15544', 'xã', 1444, 'hienthi', 0, 1759490174, NULL),
(15568, 38, 0, 0, 'xa_tho_lap', 'Xã Thọ Lập', 'tho_lap', '15568', 'xã', 1445, 'hienthi', 0, 1759490174, NULL),
(15574, 38, 0, 0, 'xa_xuan_tin', 'Xã Xuân Tín', 'xuan_tin', '15574', 'xã', 1446, 'hienthi', 0, 1759490174, NULL),
(15592, 38, 0, 0, 'xa_xuan_lap', 'Xã Xuân Lập', 'xuan_lap', '15592', 'xã', 1447, 'hienthi', 0, 1759490174, NULL),
(15349, 38, 0, 0, 'xa_vinh_loc', 'Xã Vĩnh Lộc', 'vinh_loc', '15349', 'xã', 1448, 'hienthi', 0, 1759490174, NULL),
(15361, 38, 0, 0, 'xa_tay_do', 'Xã Tây Đô', 'tay_do', '15361', 'xã', 1449, 'hienthi', 0, 1759490174, NULL),
(15382, 38, 0, 0, 'xa_bien_thuong', 'Xã Biện Thượng', 'bien_thuong', '15382', 'xã', 1450, 'hienthi', 0, 1759490174, NULL),
(15664, 38, 0, 0, 'xa_trieu_son', 'Xã Triệu Sơn', 'trieu_son', '15664', 'xã', 1451, 'hienthi', 0, 1759490174, NULL),
(15667, 38, 0, 0, 'xa_tho_binh', 'Xã Thọ Bình', 'tho_binh', '15667', 'xã', 1452, 'hienthi', 0, 1759490174, NULL),
(15754, 38, 0, 0, 'xa_tho_ngoc', 'Xã Thọ Ngọc', 'tho_ngoc', '15754', 'xã', 1453, 'hienthi', 0, 1759490174, NULL),
(15763, 38, 0, 0, 'xa_tho_phu', 'Xã Thọ Phú', 'tho_phu', '15763', 'xã', 1454, 'hienthi', 0, 1759490174, NULL),
(15682, 38, 0, 0, 'xa_hop_tien', 'Xã Hợp Tiến', 'hop_tien', '15682', 'xã', 1455, 'hienthi', 0, 1759490174, NULL),
(15766, 38, 0, 0, 'xa_an_nong', 'Xã An Nông', 'an_nong', '15766', 'xã', 1456, 'hienthi', 0, 1759490174, NULL),
(15718, 38, 0, 0, 'xa_tan_ninh', 'Xã Tân Ninh', 'tan_ninh', '15718', 'xã', 1457, 'hienthi', 0, 1759490174, NULL),
(15724, 38, 0, 0, 'xa_dong_tien', 'Xã Đồng Tiến', 'dong_tien', '15724', 'xã', 1458, 'hienthi', 0, 1759490174, NULL),
(14866, 38, 0, 0, 'xa_muong_chanh', 'Xã Mường Chanh', 'muong_chanh', '14866', 'xã', 1459, 'hienthi', 0, 1759490174, NULL),
(14860, 38, 0, 0, 'xa_quang_chieu', 'Xã Quang Chiểu', 'quang_chieu', '14860', 'xã', 1460, 'hienthi', 0, 1759490174, NULL),
(14848, 38, 0, 0, 'xa_tam_chung', 'Xã Tam Chung', 'tam_chung', '14848', 'xã', 1461, 'hienthi', 0, 1759490174, NULL),
(14845, 38, 0, 0, 'xa_muong_lat', 'Xã Mường Lát', 'muong_lat', '14845', 'xã', 1462, 'hienthi', 0, 1759490174, NULL),
(14863, 38, 0, 0, 'xa_pu_nhi', 'Xã Pù Nhi', 'pu_nhi', '14863', 'xã', 1463, 'hienthi', 0, 1759490174, NULL),
(14864, 38, 0, 0, 'xa_nhi_son', 'Xã Nhi Sơn', 'nhi_son', '14864', 'xã', 1464, 'hienthi', 0, 1759490174, NULL),
(14854, 38, 0, 0, 'xa_muong_ly', 'Xã Mường Lý', 'muong_ly', '14854', 'xã', 1465, 'hienthi', 0, 1759490174, NULL),
(14857, 38, 0, 0, 'xa_trung_ly', 'Xã Trung Lý', 'trung_ly', '14857', 'xã', 1466, 'hienthi', 0, 1759490174, NULL),
(14869, 38, 0, 0, 'xa_hoi_xuan', 'Xã Hồi Xuân', 'hoi_xuan', '14869', 'xã', 1467, 'hienthi', 0, 1759490174, NULL),
(14902, 38, 0, 0, 'xa_nam_xuan', 'Xã Nam Xuân', 'nam_xuan', '14902', 'xã', 1468, 'hienthi', 0, 1759490174, NULL),
(14908, 38, 0, 0, 'xa_thien_phu', 'Xã Thiên Phủ', 'thien_phu', '14908', 'xã', 1469, 'hienthi', 0, 1759490174, NULL),
(14896, 38, 0, 0, 'xa_hien_kiet', 'Xã Hiền Kiệt', 'hien_kiet', '14896', 'xã', 1470, 'hienthi', 0, 1759490174, NULL),
(14890, 38, 0, 0, 'xa_phu_xuan', 'Xã Phú Xuân', 'phu_xuan', '14890', 'xã', 1471, 'hienthi', 0, 1759490174, NULL),
(14878, 38, 0, 0, 'xa_phu_le', 'Xã Phú Lệ', 'phu_le', '14878', 'xã', 1472, 'hienthi', 0, 1759490174, NULL),
(14872, 38, 0, 0, 'xa_trung_thanh', 'Xã Trung Thành', 'trung_thanh', '14872', 'xã', 1473, 'hienthi', 0, 1759490174, NULL),
(14875, 38, 0, 0, 'xa_trung_son', 'Xã Trung Sơn', 'trung_son', '14875', 'xã', 1474, 'hienthi', 0, 1759490174, NULL),
(15013, 38, 0, 0, 'xa_na_meo', 'Xã Na Mèo', 'na_meo', '15013', 'xã', 1475, 'hienthi', 0, 1759490174, NULL),
(15010, 38, 0, 0, 'xa_son_thuy', 'Xã Sơn Thủy', 'son_thuy', '15010', 'xã', 1476, 'hienthi', 0, 1759490174, NULL),
(15022, 38, 0, 0, 'xa_son_dien', 'Xã Sơn Điện', 'son_dien', '15022', 'xã', 1477, 'hienthi', 0, 1759490174, NULL),
(15025, 38, 0, 0, 'xa_muong_min', 'Xã Mường Mìn', 'muong_min', '15025', 'xã', 1478, 'hienthi', 0, 1759490174, NULL),
(15007, 38, 0, 0, 'xa_tam_thanh', 'Xã Tam Thanh', 'tam_thanh', '15007', 'xã', 1479, 'hienthi', 0, 1759490174, NULL),
(15019, 38, 0, 0, 'xa_tam_lu', 'Xã Tam Lư', 'tam_lu', '15019', 'xã', 1480, 'hienthi', 0, 1759490174, NULL),
(15016, 38, 0, 0, 'xa_quan_son', 'Xã Quan Sơn', 'quan_son', '15016', 'xã', 1481, 'hienthi', 0, 1759490174, NULL),
(15001, 38, 0, 0, 'xa_trung_ha', 'Xã Trung Hạ', 'trung_ha', '15001', 'xã', 1482, 'hienthi', 0, 1759490174, NULL),
(15055, 38, 0, 0, 'xa_linh_son', 'Xã Linh Sơn', 'linh_son', '15055', 'xã', 1483, 'hienthi', 0, 1759490174, NULL),
(15058, 38, 0, 0, 'xa_dong_luong', 'Xã Đồng Lương', 'dong_luong', '15058', 'xã', 1484, 'hienthi', 0, 1759490174, NULL),
(15049, 38, 0, 0, 'xa_van_phu', 'Xã Văn Phú', 'van_phu', '15049', 'xã', 1485, 'hienthi', 0, 1759490174, NULL),
(15043, 38, 0, 0, 'xa_giao_an', 'Xã Giao An', 'giao_an', '15043', 'xã', 1486, 'hienthi', 0, 1759490174, NULL),
(15031, 38, 0, 0, 'xa_yen_khuong', 'Xã Yên Khương', 'yen_khuong', '15031', 'xã', 1487, 'hienthi', 0, 1759490174, NULL),
(15034, 38, 0, 0, 'xa_yen_thang', 'Xã Yên Thắng', 'yen_thang', '15034', 'xã', 1488, 'hienthi', 0, 1759490174, NULL),
(14974, 38, 0, 0, 'xa_van_nho', 'Xã Văn Nho', 'van_nho', '14974', 'xã', 1489, 'hienthi', 0, 1759490174, NULL),
(14980, 38, 0, 0, 'xa_thiet_ong', 'Xã Thiết Ống', 'thiet_ong', '14980', 'xã', 1490, 'hienthi', 0, 1759490174, NULL),
(14923, 38, 0, 0, 'xa_ba_thuoc', 'Xã Bá Thước', 'ba_thuoc', '14923', 'xã', 1491, 'hienthi', 0, 1759490174, NULL),
(14959, 38, 0, 0, 'xa_co_lung', 'Xã Cổ Lũng', 'co_lung', '14959', 'xã', 1492, 'hienthi', 0, 1759490174, NULL),
(14956, 38, 0, 0, 'xa_pu_luong', 'Xã Pù Luông', 'pu_luong', '14956', 'xã', 1493, 'hienthi', 0, 1759490174, NULL),
(14950, 38, 0, 0, 'xa_dien_lu', 'Xã Điền Lư', 'dien_lu', '14950', 'xã', 1494, 'hienthi', 0, 1759490174, NULL),
(14932, 38, 0, 0, 'xa_dien_quang', 'Xã Điền Quang', 'dien_quang', '14932', 'xã', 1495, 'hienthi', 0, 1759490174, NULL),
(14953, 38, 0, 0, 'xa_quy_luong', 'Xã Quý Lương', 'quy_luong', '14953', 'xã', 1496, 'hienthi', 0, 1759490174, NULL),
(15061, 38, 0, 0, 'xa_ngoc_lac', 'Xã Ngọc Lặc', 'ngoc_lac', '15061', 'xã', 1497, 'hienthi', 0, 1759490174, NULL),
(15085, 38, 0, 0, 'xa_thach_lap', 'Xã Thạch Lập', 'thach_lap', '15085', 'xã', 1498, 'hienthi', 0, 1759490174, NULL),
(15091, 38, 0, 0, 'xa_ngoc_lien', 'Xã Ngọc Liên', 'ngoc_lien', '15091', 'xã', 1499, 'hienthi', 0, 1759490174, NULL),
(15124, 38, 0, 0, 'xa_minh_son', 'Xã Minh Sơn', 'minh_son', '15124', 'xã', 1500, 'hienthi', 0, 1759490174, NULL),
(15115, 38, 0, 0, 'xa_nguyet_an', 'Xã Nguyệt Ấn', 'nguyet_an', '15115', 'xã', 1501, 'hienthi', 0, 1759490174, NULL),
(15118, 38, 0, 0, 'xa_kien_tho', 'Xã Kiên Thọ', 'kien_tho', '15118', 'xã', 1502, 'hienthi', 0, 1759490174, NULL),
(15142, 38, 0, 0, 'xa_cam_thach', 'Xã Cẩm Thạch', 'cam_thach', '15142', 'xã', 1503, 'hienthi', 0, 1759490174, NULL),
(15127, 38, 0, 0, 'xa_cam_thuy', 'Xã Cẩm Thủy', 'cam_thuy', '15127', 'xã', 1504, 'hienthi', 0, 1759490174, NULL),
(15148, 38, 0, 0, 'xa_cam_tu', 'Xã Cẩm Tú', 'cam_tu', '15148', 'xã', 1505, 'hienthi', 0, 1759490174, NULL),
(15163, 38, 0, 0, 'xa_cam_van', 'Xã Cẩm Vân', 'cam_van', '15163', 'xã', 1506, 'hienthi', 0, 1759490174, NULL),
(15178, 38, 0, 0, 'xa_cam_tan', 'Xã Cẩm Tân', 'cam_tan', '15178', 'xã', 1507, 'hienthi', 0, 1759490174, NULL),
(15187, 38, 0, 0, 'xa_kim_tan', 'Xã Kim Tân', 'kim_tan', '15187', 'xã', 1508, 'hienthi', 0, 1759490174, NULL),
(15190, 38, 0, 0, 'xa_van_du', 'Xã Vân Du', 'van_du', '15190', 'xã', 1509, 'hienthi', 0, 1759490174, NULL),
(15250, 38, 0, 0, 'xa_ngoc_trao', 'Xã Ngọc Trạo', 'ngoc_trao', '15250', 'xã', 1510, 'hienthi', 0, 1759490174, NULL),
(15211, 38, 0, 0, 'xa_thach_binh', 'Xã Thạch Bình', 'thach_binh', '15211', 'xã', 1511, 'hienthi', 0, 1759490174, NULL),
(15229, 38, 0, 0, 'xa_thanh_vinh', 'Xã Thành Vinh', 'thanh_vinh', '15229', 'xã', 1512, 'hienthi', 0, 1759490174, NULL),
(15199, 38, 0, 0, 'xa_thach_quang', 'Xã Thạch Quảng', 'thach_quang', '15199', 'xã', 1513, 'hienthi', 0, 1759490174, NULL),
(16174, 38, 0, 0, 'xa_nhu_xuan', 'Xã Như Xuân', 'nhu_xuan', '16174', 'xã', 1514, 'hienthi', 0, 1759490174, NULL),
(16225, 38, 0, 0, 'xa_thuong_ninh', 'Xã Thượng Ninh', 'thuong_ninh', '16225', 'xã', 1515, 'hienthi', 0, 1759490174, NULL),
(16177, 38, 0, 0, 'xa_xuan_binh', 'Xã Xuân Bình', 'xuan_binh', '16177', 'xã', 1516, 'hienthi', 0, 1759490174, NULL),
(16186, 38, 0, 0, 'xa_hoa_quy', 'Xã Hóa Quỳ', 'hoa_quy', '16186', 'xã', 1517, 'hienthi', 0, 1759490174, NULL),
(16207, 38, 0, 0, 'xa_thanh_quan', 'Xã Thanh Quân', 'thanh_quan', '16207', 'xã', 1518, 'hienthi', 0, 1759490174, NULL),
(16219, 38, 0, 0, 'xa_thanh_phong', 'Xã Thanh Phong', 'thanh_phong', '16219', 'xã', 1519, 'hienthi', 0, 1759490174, NULL),
(16234, 38, 0, 0, 'xa_xuan_du', 'Xã Xuân Du', 'xuan_du', '16234', 'xã', 1520, 'hienthi', 0, 1759490174, NULL),
(16249, 38, 0, 0, 'xa_mau_lam', 'Xã Mậu Lâm', 'mau_lam', '16249', 'xã', 1521, 'hienthi', 0, 1759490174, NULL),
(16228, 38, 0, 0, 'xa_nhu_thanh', 'Xã Như Thanh', 'nhu_thanh', '16228', 'xã', 1522, 'hienthi', 0, 1759490174, NULL),
(16264, 38, 0, 0, 'xa_yen_tho', 'Xã Yên Thọ', 'yen_tho', '16264', 'xã', 1523, 'hienthi', 0, 1759490174, NULL),
(16258, 38, 0, 0, 'xa_xuan_thai', 'Xã Xuân Thái', 'xuan_thai', '16258', 'xã', 1524, 'hienthi', 0, 1759490174, NULL),
(16273, 38, 0, 0, 'xa_thanh_ky', 'Xã Thanh Kỳ', 'thanh_ky', '16273', 'xã', 1525, 'hienthi', 0, 1759490174, NULL),
(15607, 38, 0, 0, 'xa_bat_mot', 'Xã Bát Mọt', 'bat_mot', '15607', 'xã', 1526, 'hienthi', 0, 1759490174, NULL),
(15610, 38, 0, 0, 'xa_yen_nhan', 'Xã Yên Nhân', 'yen_nhan', '15610', 'xã', 1527, 'hienthi', 0, 1759490174, NULL),
(15628, 38, 0, 0, 'xa_luong_son', 'Xã Lương Sơn', 'luong_son', '15628', 'xã', 1528, 'hienthi', 0, 1759490174, NULL),
(15646, 38, 0, 0, 'xa_thuong_xuan', 'Xã Thường Xuân', 'thuong_xuan', '15646', 'xã', 1529, 'hienthi', 0, 1759490174, NULL),
(15634, 38, 0, 0, 'xa_luan_thanh', 'Xã Luận Thành', 'luan_thanh', '15634', 'xã', 1530, 'hienthi', 0, 1759490174, NULL),
(15661, 38, 0, 0, 'xa_tan_thanh', 'Xã Tân Thành', 'tan_thanh', '15661', 'xã', 1531, 'hienthi', 0, 1759490174, NULL),
(15622, 38, 0, 0, 'xa_van_xuan', 'Xã Vạn Xuân', 'van_xuan', '15622', 'xã', 1532, 'hienthi', 0, 1759490174, NULL),
(15643, 38, 0, 0, 'xa_thang_loc', 'Xã Thắng Lộc', 'thang_loc', '15643', 'xã', 1533, 'hienthi', 0, 1759490174, NULL),
(15658, 38, 0, 0, 'xa_xuan_chinh', 'Xã Xuân Chinh', 'xuan_chinh', '15658', 'xã', 1534, 'hienthi', 0, 1759490174, NULL),
(17329, 40, 0, 0, 'xa_anh_son', 'Xã Anh Sơn', 'anh_son', '17329', 'xã', 1535, 'hienthi', 0, 1759490174, NULL),
(17380, 40, 0, 0, 'xa_yen_xuan', 'Xã Yên Xuân', 'yen_xuan', '17380', 'xã', 1536, 'hienthi', 0, 1759490174, NULL),
(17344, 40, 0, 0, 'xa_nhan_hoa', 'Xã Nhân Hòa', 'nhan_hoa', '17344', 'xã', 1537, 'hienthi', 0, 1759490174, NULL),
(17365, 40, 0, 0, 'xa_anh_son_dong', 'Xã Anh Sơn Đông', 'anh_son_dong', '17365', 'xã', 1538, 'hienthi', 0, 1759490174, NULL),
(17357, 40, 0, 0, 'xa_vinh_tuong', 'Xã Vĩnh Tường', 'vinh_tuong', '17357', 'xã', 1539, 'hienthi', 0, 1759490174, NULL),
(17335, 40, 0, 0, 'xa_thanh_binh_tho', 'Xã Thành Bình Thọ', 'thanh_binh_tho', '17335', 'xã', 1540, 'hienthi', 0, 1759490174, NULL),
(17254, 40, 0, 0, 'xa_con_cuong', 'Xã Con Cuông', 'con_cuong', '17254', 'xã', 1541, 'hienthi', 0, 1759490174, NULL),
(17263, 40, 0, 0, 'xa_mon_son', 'Xã Môn Sơn', 'mon_son', '17263', 'xã', 1542, 'hienthi', 0, 1759490174, NULL),
(17239, 40, 0, 0, 'xa_mau_thach', 'Xã Mậu Thạch', 'mau_thach', '17239', 'xã', 1543, 'hienthi', 0, 1759490174, NULL),
(17242, 40, 0, 0, 'xa_cam_phuc', 'Xã Cam Phục', 'cam_phuc', '17242', 'xã', 1544, 'hienthi', 0, 1759490174, NULL),
(17248, 40, 0, 0, 'xa_chau_khe', 'Xã Châu Khê', 'chau_khe', '17248', 'xã', 1545, 'hienthi', 0, 1759490174, NULL),
(17230, 40, 0, 0, 'xa_binh_chuan', 'Xã Bình Chuẩn', 'binh_chuan', '17230', 'xã', 1546, 'hienthi', 0, 1759490174, NULL),
(17464, 40, 0, 0, 'xa_dien_chau', 'Xã Diễn Châu', 'dien_chau', '17464', 'xã', 1547, 'hienthi', 0, 1759490174, NULL),
(17416, 40, 0, 0, 'xa_duc_chau', 'Xã Đức Châu', 'duc_chau', '17416', 'xã', 1548, 'hienthi', 0, 1759490174, NULL),
(17443, 40, 0, 0, 'xa_quang_chau', 'Xã Quảng Châu', 'quang_chau', '17443', 'xã', 1549, 'hienthi', 0, 1759490174, NULL),
(17419, 40, 0, 0, 'xa_hai_chau', 'Xã Hải Châu', 'hai_chau', '17419', 'xã', 1550, 'hienthi', 0, 1759490174, NULL),
(17488, 40, 0, 0, 'xa_tan_chau', 'Xã Tân Châu', 'tan_chau', '17488', 'xã', 1551, 'hienthi', 0, 1759490174, NULL),
(17479, 40, 0, 0, 'xa_an_chau', 'Xã An Châu', 'an_chau', '17479', 'xã', 1552, 'hienthi', 0, 1759490174, NULL),
(17476, 40, 0, 0, 'xa_minh_chau', 'Xã Minh Châu', 'minh_chau', '17476', 'xã', 1553, 'hienthi', 0, 1759490174, NULL),
(17395, 40, 0, 0, 'xa_hung_chau', 'Xã Hùng Châu', 'hung_chau', '17395', 'xã', 1554, 'hienthi', 0, 1759490174, NULL),
(17662, 40, 0, 0, 'xa_do_luong', 'Xã Đô Lương', 'do_luong', '17662', 'xã', 1555, 'hienthi', 0, 1759490174, NULL),
(17623, 40, 0, 0, 'xa_bach_ngoc', 'Xã Bạch Ngọc', 'bach_ngoc', '17623', 'xã', 1556, 'hienthi', 0, 1759490174, NULL),
(17677, 40, 0, 0, 'xa_van_hien', 'Xã Văn Hiến', 'van_hien', '17677', 'xã', 1557, 'hienthi', 0, 1759490174, NULL),
(17707, 40, 0, 0, 'xa_bach_ha', 'Xã Bạch Hà', 'bach_ha', '17707', 'xã', 1558, 'hienthi', 0, 1759490174, NULL),
(17689, 40, 0, 0, 'xa_thuan_trung', 'Xã Thuần Trung', 'thuan_trung', '17689', 'xã', 1559, 'hienthi', 0, 1759490174, NULL),
(17641, 40, 0, 0, 'xa_luong_son', 'Xã Lương Sơn', 'luong_son', '17641', 'xã', 1560, 'hienthi', 0, 1759490174, NULL),
(17110, 40, 0, 0, 'phuong_hoang_mai', 'Phường Hoàng Mai', 'hoang_mai', '17110', 'phường', 1561, 'hienthi', 0, 1759490174, NULL),
(17128, 40, 0, 0, 'phuong_tan_mai', 'Phường Tân Mai', 'tan_mai', '17128', 'phường', 1562, 'hienthi', 0, 1759490174, NULL),
(17125, 40, 0, 0, 'phuong_quynh_mai', 'Phường Quỳnh Mai', 'quynh_mai', '17125', 'phường', 1563, 'hienthi', 0, 1759490174, NULL),
(18001, 40, 0, 0, 'xa_hung_nguyen', 'Xã Hưng Nguyên', 'hung_nguyen', '18001', 'xã', 1564, 'hienthi', 0, 1759490174, NULL),
(18007, 40, 0, 0, 'xa_yen_trung', 'Xã Yên Trung', 'yen_trung', '18007', 'xã', 1565, 'hienthi', 0, 1759490174, NULL),
(18028, 40, 0, 0, 'xa_hung_nguyen_nam', 'Xã Hưng Nguyên Nam', 'hung_nguyen_nam', '18028', 'xã', 1566, 'hienthi', 0, 1759490174, NULL),
(18040, 40, 0, 0, 'xa_lam_thanh', 'Xã Lam Thành', 'lam_thanh', '18040', 'xã', 1567, 'hienthi', 0, 1759490174, NULL),
(16813, 40, 0, 0, 'xa_muong_xen', 'Xã Mường Xén', 'muong_xen', '16813', 'xã', 1568, 'hienthi', 0, 1759490174, NULL),
(16849, 40, 0, 0, 'xa_huu_kiem', 'Xã Hữu Kiệm', 'huu_kiem', '16849', 'xã', 1569, 'hienthi', 0, 1759490174, NULL),
(16837, 40, 0, 0, 'xa_nam_can', 'Xã Nậm Cắn', 'nam_can', '16837', 'xã', 1570, 'hienthi', 0, 1759490174, NULL),
(16855, 40, 0, 0, 'xa_chieu_luu', 'Xã Chiêu Lưu', 'chieu_luu', '16855', 'xã', 1571, 'hienthi', 0, 1759490174, NULL),
(16834, 40, 0, 0, 'xa_na_loi', 'Xã Na Loi', 'na_loi', '16834', 'xã', 1572, 'hienthi', 0, 1759490174, NULL),
(16858, 40, 0, 0, 'xa_muong_tip', 'Xã Mường Típ', 'muong_tip', '16858', 'xã', 1573, 'hienthi', 0, 1759490174, NULL),
(16870, 40, 0, 0, 'xa_na_ngoi', 'Xã Na Ngoi', 'na_ngoi', '16870', 'xã', 1574, 'hienthi', 0, 1759490174, NULL),
(16816, 40, 0, 0, 'xa_my_ly', 'Xã Mỹ Lý', 'my_ly', '16816', 'xã', 1575, 'hienthi', 0, 1759490174, NULL),
(16819, 40, 0, 0, 'xa_bac_ly', 'Xã Bắc Lý', 'bac_ly', '16819', 'xã', 1576, 'hienthi', 0, 1759490174, NULL),
(16822, 40, 0, 0, 'xa_keng_du', 'Xã Keng Đu', 'keng_du', '16822', 'xã', 1577, 'hienthi', 0, 1759490174, NULL),
(16828, 40, 0, 0, 'xa_huoi_tu', 'Xã Huồi Tụ', 'huoi_tu', '16828', 'xã', 1578, 'hienthi', 0, 1759490174, NULL),
(16831, 40, 0, 0, 'xa_muong_long', 'Xã Mường Lống', 'muong_long', '16831', 'xã', 1579, 'hienthi', 0, 1759490174, NULL),
(17950, 40, 0, 0, 'xa_van_an', 'Xã Vạn An', 'van_an', '17950', 'xã', 1580, 'hienthi', 0, 1759490174, NULL),
(17935, 40, 0, 0, 'xa_nam_dan', 'Xã Nam Đàn', 'nam_dan', '17935', 'xã', 1581, 'hienthi', 0, 1759490174, NULL),
(17944, 40, 0, 0, 'xa_dai_hue', 'Xã Đại Huệ', 'dai_hue', '17944', 'xã', 1582, 'hienthi', 0, 1759490174, NULL),
(17989, 40, 0, 0, 'xa_thien_nhan', 'Xã Thiên Nhẫn', 'thien_nhan', '17989', 'xã', 1583, 'hienthi', 0, 1759490174, NULL),
(17971, 40, 0, 0, 'xa_kim_lien', 'Xã Kim Liên', 'kim_lien', '17971', 'xã', 1584, 'hienthi', 0, 1759490174, NULL),
(16941, 40, 0, 0, 'xa_nghia_dan', 'Xã Nghĩa Đàn', 'nghia_dan', '16941', 'xã', 1585, 'hienthi', 0, 1759490174, NULL),
(16969, 40, 0, 0, 'xa_nghia_tho', 'Xã Nghĩa Thọ', 'nghia_tho', '16969', 'xã', 1586, 'hienthi', 0, 1759490174, NULL),
(16951, 40, 0, 0, 'xa_nghia_lam', 'Xã Nghĩa Lâm', 'nghia_lam', '16951', 'xã', 1587, 'hienthi', 0, 1759490174, NULL),
(16975, 40, 0, 0, 'xa_nghia_mai', 'Xã Nghĩa Mai', 'nghia_mai', '16975', 'xã', 1588, 'hienthi', 0, 1759490174, NULL),
(16972, 40, 0, 0, 'xa_nghia_hung', 'Xã Nghĩa Hưng', 'nghia_hung', '16972', 'xã', 1589, 'hienthi', 0, 1759490174, NULL),
(17032, 40, 0, 0, 'xa_nghia_khanh', 'Xã Nghĩa Khánh', 'nghia_khanh', '17032', 'xã', 1590, 'hienthi', 0, 1759490174, NULL),
(17029, 40, 0, 0, 'xa_nghia_loc', 'Xã Nghĩa Lộc', 'nghia_loc', '17029', 'xã', 1591, 'hienthi', 0, 1759490174, NULL),
(17827, 40, 0, 0, 'xa_nghi_loc', 'Xã Nghi Lộc', 'nghi_loc', '17827', 'xã', 1592, 'hienthi', 0, 1759490174, NULL),
(17857, 40, 0, 0, 'xa_phuc_loc', 'Xã Phúc Lộc', 'phuc_loc', '17857', 'xã', 1593, 'hienthi', 0, 1759490174, NULL),
(17878, 40, 0, 0, 'xa_dong_loc', 'Xã Đông Lộc', 'dong_loc', '17878', 'xã', 1594, 'hienthi', 0, 1759490174, NULL),
(17866, 40, 0, 0, 'xa_trung_loc', 'Xã Trung Lộc', 'trung_loc', '17866', 'xã', 1595, 'hienthi', 0, 1759490174, NULL),
(17842, 40, 0, 0, 'xa_than_linh', 'Xã Thần Lĩnh', 'than_linh', '17842', 'xã', 1596, 'hienthi', 0, 1759490174, NULL),
(17833, 40, 0, 0, 'xa_hai_loc', 'Xã Hải Lộc', 'hai_loc', '17833', 'xã', 1597, 'hienthi', 0, 1759490174, NULL),
(17854, 40, 0, 0, 'xa_van_kieu', 'Xã Văn Kiều', 'van_kieu', '17854', 'xã', 1598, 'hienthi', 0, 1759490174, NULL),
(16738, 40, 0, 0, 'xa_que_phong', 'Xã Quế Phong', 'que_phong', '16738', 'xã', 1599, 'hienthi', 0, 1759490174, NULL),
(16750, 40, 0, 0, 'xa_tien_phong', 'Xã Tiền Phong', 'tien_phong', '16750', 'xã', 1600, 'hienthi', 0, 1759490174, NULL),
(16756, 40, 0, 0, 'xa_tri_le', 'Xã Tri Lễ', 'tri_le', '16756', 'xã', 1601, 'hienthi', 0, 1759490174, NULL),
(16774, 40, 0, 0, 'xa_muong_quang', 'Xã Mường Quàng', 'muong_quang', '16774', 'xã', 1602, 'hienthi', 0, 1759490174, NULL),
(16744, 40, 0, 0, 'xa_thong_thu', 'Xã Thông Thụ', 'thong_thu', '16744', 'xã', 1603, 'hienthi', 0, 1759490174, NULL),
(16777, 40, 0, 0, 'xa_quy_chau', 'Xã Quỳ Châu', 'quy_chau', '16777', 'xã', 1604, 'hienthi', 0, 1759490174, NULL),
(16792, 40, 0, 0, 'xa_chau_tien', 'Xã Châu Tiến', 'chau_tien', '16792', 'xã', 1605, 'hienthi', 0, 1759490174, NULL),
(16801, 40, 0, 0, 'xa_hung_chan', 'Xã Hùng Chân', 'hung_chan', '16801', 'xã', 1606, 'hienthi', 0, 1759490174, NULL),
(16804, 40, 0, 0, 'xa_chau_binh', 'Xã Châu Bình', 'chau_binh', '16804', 'xã', 1607, 'hienthi', 0, 1759490174, NULL),
(17035, 40, 0, 0, 'xa_quy_hop', 'Xã Quỳ Hợp', 'quy_hop', '17035', 'xã', 1608, 'hienthi', 0, 1759490174, NULL),
(17059, 40, 0, 0, 'xa_tam_hop', 'Xã Tam Hợp', 'tam_hop', '17059', 'xã', 1609, 'hienthi', 0, 1759490174, NULL),
(17056, 40, 0, 0, 'xa_chau_loc', 'Xã Châu Lộc', 'chau_loc', '17056', 'xã', 1610, 'hienthi', 0, 1759490174, NULL),
(17044, 40, 0, 0, 'xa_chau_hong', 'Xã Châu Hồng', 'chau_hong', '17044', 'xã', 1611, 'hienthi', 0, 1759490174, NULL),
(17077, 40, 0, 0, 'xa_muong_ham', 'Xã Mường Ham', 'muong_ham', '17077', 'xã', 1612, 'hienthi', 0, 1759490174, NULL),
(17089, 40, 0, 0, 'xa_muong_chong', 'Xã Mường Chọng', 'muong_chong', '17089', 'xã', 1613, 'hienthi', 0, 1759490174, NULL),
(17071, 40, 0, 0, 'xa_minh_hop', 'Xã Minh Hợp', 'minh_hop', '17071', 'xã', 1614, 'hienthi', 0, 1759490174, NULL),
(17179, 40, 0, 0, 'xa_quynh_luu', 'Xã Quỳnh Lưu', 'quynh_luu', '17179', 'xã', 1615, 'hienthi', 0, 1759490174, NULL),
(17143, 40, 0, 0, 'xa_quynh_van', 'Xã Quỳnh Văn', 'quynh_van', '17143', 'xã', 1616, 'hienthi', 0, 1759490174, NULL),
(17176, 40, 0, 0, 'xa_quynh_anh', 'Xã Quỳnh Anh', 'quynh_anh', '17176', 'xã', 1617, 'hienthi', 0, 1759490174, NULL),
(17149, 40, 0, 0, 'xa_quynh_tam', 'Xã Quỳnh Tam', 'quynh_tam', '17149', 'xã', 1618, 'hienthi', 0, 1759490174, NULL),
(17212, 40, 0, 0, 'xa_quynh_phu', 'Xã Quỳnh Phú', 'quynh_phu', '17212', 'xã', 1619, 'hienthi', 0, 1759490174, NULL),
(17152, 40, 0, 0, 'xa_quynh_son', 'Xã Quỳnh Sơn', 'quynh_son', '17152', 'xã', 1620, 'hienthi', 0, 1759490174, NULL),
(17224, 40, 0, 0, 'xa_quynh_thang', 'Xã Quỳnh Thắng', 'quynh_thang', '17224', 'xã', 1621, 'hienthi', 0, 1759490174, NULL),
(17266, 40, 0, 0, 'xa_tan_ky', 'Xã Tân Kỳ', 'tan_ky', '17266', 'xã', 1622, 'hienthi', 0, 1759490174, NULL),
(17272, 40, 0, 0, 'xa_tan_phu', 'Xã Tân Phú', 'tan_phu', '17272', 'xã', 1623, 'hienthi', 0, 1759490174, NULL),
(17305, 40, 0, 0, 'xa_tan_an', 'Xã Tân An', 'tan_an', '17305', 'xã', 1624, 'hienthi', 0, 1759490174, NULL),
(17284, 40, 0, 0, 'xa_nghia_dong', 'Xã Nghĩa Đồng', 'nghia_dong', '17284', 'xã', 1625, 'hienthi', 0, 1759490174, NULL),
(17278, 40, 0, 0, 'xa_giai_xuan', 'Xã Giai Xuân', 'giai_xuan', '17278', 'xã', 1626, 'hienthi', 0, 1759490174, NULL),
(17326, 40, 0, 0, 'xa_nghia_hanh', 'Xã Nghĩa Hành', 'nghia_hanh', '17326', 'xã', 1627, 'hienthi', 0, 1759490174, NULL),
(17287, 40, 0, 0, 'xa_tien_dong', 'Xã Tiên Đồng', 'tien_dong', '17287', 'xã', 1628, 'hienthi', 0, 1759490174, NULL),
(16939, 40, 0, 0, 'phuong_thai_hoa', 'Phường Thái Hòa', 'thai_hoa', '16939', 'phường', 1629, 'hienthi', 0, 1759490174, NULL),
(16994, 40, 0, 0, 'phuong_tay_hieu', 'Phường Tây Hiếu', 'tay_hieu', '16994', 'phường', 1630, 'hienthi', 0, 1759490174, NULL),
(17017, 40, 0, 0, 'xa_dong_hieu', 'Xã Đông Hiếu', 'dong_hieu', '17017', 'xã', 1631, 'hienthi', 0, 1759490174, NULL),
(17728, 40, 0, 0, 'xa_cat_ngan', 'Xã Cát Ngạn', 'cat_ngan', '17728', 'xã', 1632, 'hienthi', 0, 1759490174, NULL),
(17743, 40, 0, 0, 'xa_tam_dong', 'Xã Tam Đồng', 'tam_dong', '17743', 'xã', 1633, 'hienthi', 0, 1759490174, NULL),
(17722, 40, 0, 0, 'xa_hanh_lam', 'Xã Hạnh Lâm', 'hanh_lam', '17722', 'xã', 1634, 'hienthi', 0, 1759490174, NULL),
(17759, 40, 0, 0, 'xa_son_lam', 'Xã Sơn Lâm', 'son_lam', '17759', 'xã', 1635, 'hienthi', 0, 1759490174, NULL),
(17770, 40, 0, 0, 'xa_hoa_quan', 'Xã Hoa Quân', 'hoa_quan', '17770', 'xã', 1636, 'hienthi', 0, 1759490174, NULL),
(17791, 40, 0, 0, 'xa_kim_bang', 'Xã Kim Bảng', 'kim_bang', '17791', 'xã', 1637, 'hienthi', 0, 1759490174, NULL),
(17818, 40, 0, 0, 'xa_bich_hao', 'Xã Bích Hào', 'bich_hao', '17818', 'xã', 1638, 'hienthi', 0, 1759490174, NULL),
(17713, 40, 0, 0, 'xa_dai_dong', 'Xã Đại Đồng', 'dai_dong', '17713', 'xã', 1639, 'hienthi', 0, 1759490174, NULL),
(17779, 40, 0, 0, 'xa_xuan_lam', 'Xã Xuân Lâm', 'xuan_lam', '17779', 'xã', 1640, 'hienthi', 0, 1759490174, NULL),
(16933, 40, 0, 0, 'xa_tam_quang', 'Xã Tam Quang', 'tam_quang', '16933', 'xã', 1641, 'hienthi', 0, 1759490174, NULL),
(16936, 40, 0, 0, 'xa_tam_thai', 'Xã Tam Thái', 'tam_thai', '16936', 'xã', 1642, 'hienthi', 0, 1759490174, NULL),
(16876, 40, 0, 0, 'xa_tuong_duong', 'Xã Tương Dương', 'tuong_duong', '16876', 'xã', 1643, 'hienthi', 0, 1759490174, NULL),
(16906, 40, 0, 0, 'xa_luong_minh', 'Xã Lượng Minh', 'luong_minh', '16906', 'xã', 1644, 'hienthi', 0, 1759490174, NULL),
(16912, 40, 0, 0, 'xa_yen_na', 'Xã Yên Na', 'yen_na', '16912', 'xã', 1645, 'hienthi', 0, 1759490174, NULL),
(16909, 40, 0, 0, 'xa_yen_hoa', 'Xã Yên Hòa', 'yen_hoa', '16909', 'xã', 1646, 'hienthi', 0, 1759490174, NULL),
(16903, 40, 0, 0, 'xa_nga_my', 'Xã Nga My', 'nga_my', '16903', 'xã', 1647, 'hienthi', 0, 1759490174, NULL),
(16885, 40, 0, 0, 'xa_huu_khuong', 'Xã Hữu Khuông', 'huu_khuong', '16885', 'xã', 1648, 'hienthi', 0, 1759490174, NULL),
(16882, 40, 0, 0, 'xa_nhon_mai', 'Xã Nhôn Mai', 'nhon_mai', '16882', 'xã', 1649, 'hienthi', 0, 1759490174, NULL),
(16690, 40, 0, 0, 'phuong_truong_vinh', 'Phường Trường Vinh', 'truong_vinh', '16690', 'phường', 1650, 'hienthi', 0, 1759490174, NULL),
(16681, 40, 0, 0, 'phuong_thanh_vinh', 'Phường Thành Vinh', 'thanh_vinh', '16681', 'phường', 1651, 'hienthi', 0, 1759490174, NULL),
(17920, 40, 0, 0, 'phuong_vinh_hung', 'Phường Vinh Hưng', 'vinh_hung', '17920', 'phường', 1652, 'hienthi', 0, 1759490174, NULL),
(16702, 40, 0, 0, 'phuong_vinh_phu', 'Phường Vinh Phú', 'vinh_phu', '16702', 'phường', 1653, 'hienthi', 0, 1759490174, NULL),
(16708, 40, 0, 0, 'phuong_vinh_loc', 'Phường Vinh Lộc', 'vinh_loc', '16708', 'phường', 1654, 'hienthi', 0, 1759490174, NULL),
(16732, 40, 0, 0, 'phuong_cua_lo', 'Phường Cửa Lò', 'cua_lo', '16732', 'phường', 1655, 'hienthi', 0, 1759490174, NULL),
(17506, 40, 0, 0, 'xa_yen_thanh', 'Xã Yên Thành', 'yen_thanh', '17506', 'xã', 1656, 'hienthi', 0, 1759490174, NULL),
(17569, 40, 0, 0, 'xa_quan_thanh', 'Xã Quan Thành', 'quan_thanh', '17569', 'xã', 1657, 'hienthi', 0, 1759490174, NULL),
(17605, 40, 0, 0, 'xa_hop_minh', 'Xã Hợp Minh', 'hop_minh', '17605', 'xã', 1658, 'hienthi', 0, 1759490174, NULL),
(17611, 40, 0, 0, 'xa_van_tu', 'Xã Vân Tụ', 'van_tu', '17611', 'xã', 1659, 'hienthi', 0, 1759490174, NULL),
(17560, 40, 0, 0, 'xa_van_du', 'Xã Vân Du', 'van_du', '17560', 'xã', 1660, 'hienthi', 0, 1759490174, NULL),
(17521, 40, 0, 0, 'xa_quang_dong', 'Xã Quang Đồng', 'quang_dong', '17521', 'xã', 1661, 'hienthi', 0, 1759490174, NULL),
(17524, 40, 0, 0, 'xa_giai_lac', 'Xã Giai Lạc', 'giai_lac', '17524', 'xã', 1662, 'hienthi', 0, 1759490174, NULL),
(17515, 40, 0, 0, 'xa_binh_minh', 'Xã Bình Minh', 'binh_minh', '17515', 'xã', 1663, 'hienthi', 0, 1759490174, NULL),
(17530, 40, 0, 0, 'xa_dong_thanh', 'Xã Đông Thành', 'dong_thanh', '17530', 'xã', 1664, 'hienthi', 0, 1759490174, NULL),
(18754, 42, 0, 0, 'phuong_song_tri', 'Phường Sông Trí', 'song_tri', '18754', 'phường', 1665, 'hienthi', 0, 1759490174, NULL),
(18781, 42, 0, 0, 'phuong_hai_ninh', 'Phường Hải Ninh', 'hai_ninh', '18781', 'phường', 1666, 'hienthi', 0, 1759490174, NULL),
(18832, 42, 0, 0, 'phuong_hoanh_son', 'Phường Hoành Sơn', 'hoanh_son', '18832', 'phường', 1667, 'hienthi', 0, 1759490174, NULL),
(18823, 42, 0, 0, 'phuong_vung_ang', 'Phường Vũng Áng', 'vung_ang', '18823', 'phường', 1668, 'hienthi', 0, 1759490174, NULL),
(18766, 42, 0, 0, 'xa_ky_xuan', 'Xã Kỳ Xuân', 'ky_xuan', '18766', 'xã', 1669, 'hienthi', 0, 1759490174, NULL),
(18775, 42, 0, 0, 'xa_ky_anh', 'Xã Kỳ Anh', 'ky_anh', '18775', 'xã', 1670, 'hienthi', 0, 1759490174, NULL),
(18814, 42, 0, 0, 'xa_ky_hoa', 'Xã Kỳ Hoa', 'ky_hoa', '18814', 'xã', 1671, 'hienthi', 0, 1759490174, NULL),
(18787, 42, 0, 0, 'xa_ky_van', 'Xã Kỳ Văn', 'ky_van', '18787', 'xã', 1672, 'hienthi', 0, 1759490174, NULL),
(18790, 42, 0, 0, 'xa_ky_khang', 'Xã Kỳ Khang', 'ky_khang', '18790', 'xã', 1673, 'hienthi', 0, 1759490174, NULL),
(18838, 42, 0, 0, 'xa_ky_lac', 'Xã Kỳ Lạc', 'ky_lac', '18838', 'xã', 1674, 'hienthi', 0, 1759490174, NULL),
(18844, 42, 0, 0, 'xa_ky_thuong', 'Xã Kỳ Thượng', 'ky_thuong', '18844', 'xã', 1675, 'hienthi', 0, 1759490174, NULL),
(18673, 42, 0, 0, 'xa_cam_xuyen', 'Xã Cẩm Xuyên', 'cam_xuyen', '18673', 'xã', 1676, 'hienthi', 0, 1759490174, NULL),
(18676, 42, 0, 0, 'xa_thien_cam', 'Xã Thiên Cầm', 'thien_cam', '18676', 'xã', 1677, 'hienthi', 0, 1759490174, NULL),
(18739, 42, 0, 0, 'xa_cam_due', 'Xã Cẩm Duệ', 'cam_due', '18739', 'xã', 1678, 'hienthi', 0, 1759490174, NULL),
(18736, 42, 0, 0, 'xa_cam_hung', 'Xã Cẩm Hưng', 'cam_hung', '18736', 'xã', 1679, 'hienthi', 0, 1759490174, NULL),
(18748, 42, 0, 0, 'xa_cam_lac', 'Xã Cẩm Lạc', 'cam_lac', '18748', 'xã', 1680, 'hienthi', 0, 1759490174, NULL),
(18742, 42, 0, 0, 'xa_cam_trung', 'Xã Cẩm Trung', 'cam_trung', '18742', 'xã', 1681, 'hienthi', 0, 1759490174, NULL),
(18682, 42, 0, 0, 'xa_yen_hoa', 'Xã Yên Hòa', 'yen_hoa', '18682', 'xã', 1682, 'hienthi', 0, 1759490174, NULL),
(18073, 42, 0, 0, 'phuong_thanh_sen', 'Phường Thành Sen', 'thanh_sen', '18073', 'phường', 1683, 'hienthi', 0, 1759490174, NULL),
(18100, 42, 0, 0, 'phuong_tran_phu', 'Phường Trần Phú', 'tran_phu', '18100', 'phường', 1684, 'hienthi', 0, 1759490174, NULL),
(18652, 42, 0, 0, 'phuong_ha_huy_tap', 'Phường Hà Huy Tập', 'ha_huy_tap', '18652', 'phường', 1685, 'hienthi', 0, 1759490174, NULL),
(18628, 42, 0, 0, 'xa_thach_lac', 'Xã Thạch Lạc', 'thach_lac', '18628', 'xã', 1686, 'hienthi', 0, 1759490174, NULL),
(18619, 42, 0, 0, 'xa_dong_tien', 'Xã Đồng Tiến', 'dong_tien', '18619', 'xã', 1687, 'hienthi', 0, 1759490174, NULL),
(18604, 42, 0, 0, 'xa_thach_khe', 'Xã Thạch Khê', 'thach_khe', '18604', 'xã', 1688, 'hienthi', 0, 1759490174, NULL),
(18685, 42, 0, 0, 'xa_cam_binh', 'Xã Cẩm Bình', 'cam_binh', '18685', 'xã', 1689, 'hienthi', 0, 1759490174, NULL),
(18562, 42, 0, 0, 'xa_thach_ha', 'Xã Thạch Hà', 'thach_ha', '18562', 'xã', 1690, 'hienthi', 0, 1759490174, NULL),
(18634, 42, 0, 0, 'xa_toan_luu', 'Xã Toàn Lưu', 'toan_luu', '18634', 'xã', 1691, 'hienthi', 0, 1759490174, NULL),
(18601, 42, 0, 0, 'xa_viet_xuyen', 'Xã Việt Xuyên', 'viet_xuyen', '18601', 'xã', 1692, 'hienthi', 0, 1759490174, NULL),
(18586, 42, 0, 0, 'xa_dong_kinh', 'Xã Đông Kinh', 'dong_kinh', '18586', 'xã', 1693, 'hienthi', 0, 1759490174, NULL),
(18667, 42, 0, 0, 'xa_thach_xuan', 'Xã Thạch Xuân', 'thach_xuan', '18667', 'xã', 1694, 'hienthi', 0, 1759490174, NULL),
(18568, 42, 0, 0, 'xa_loc_ha', 'Xã Lộc Hà', 'loc_ha', '18568', 'xã', 1695, 'hienthi', 0, 1759490174, NULL),
(18409, 42, 0, 0, 'xa_hong_loc', 'Xã Hồng Lộc', 'hong_loc', '18409', 'xã', 1696, 'hienthi', 0, 1759490174, NULL),
(18583, 42, 0, 0, 'xa_mai_phu', 'Xã Mai Phụ', 'mai_phu', '18583', 'xã', 1697, 'hienthi', 0, 1759490174, NULL),
(18406, 42, 0, 0, 'xa_can_loc', 'Xã Can Lộc', 'can_loc', '18406', 'xã', 1698, 'hienthi', 0, 1759490174, NULL),
(18418, 42, 0, 0, 'xa_tung_loc', 'Xã Tùng Lộc', 'tung_loc', '18418', 'xã', 1699, 'hienthi', 0, 1759490174, NULL),
(18466, 42, 0, 0, 'xa_gia_hanh', 'Xã Gia Hanh', 'gia_hanh', '18466', 'xã', 1700, 'hienthi', 0, 1759490174, NULL),
(18436, 42, 0, 0, 'xa_truong_luu', 'Xã Trường Lưu', 'truong_luu', '18436', 'xã', 1701, 'hienthi', 0, 1759490174, NULL),
(18481, 42, 0, 0, 'xa_xuan_loc', 'Xã Xuân Lộc', 'xuan_loc', '18481', 'xã', 1702, 'hienthi', 0, 1759490174, NULL),
(18484, 42, 0, 0, 'xa_dong_loc', 'Xã Đồng Lộc', 'dong_loc', '18484', 'xã', 1703, 'hienthi', 0, 1759490174, NULL),
(18115, 42, 0, 0, 'phuong_bac_hong_linh', 'Phường Bắc Hồng Lĩnh', 'bac_hong_linh', '18115', 'phường', 1704, 'hienthi', 0, 1759490174, NULL),
(18118, 42, 0, 0, 'phuong_nam_hong_linh', 'Phường Nam Hồng Lĩnh', 'nam_hong_linh', '18118', 'phường', 1705, 'hienthi', 0, 1759490174, NULL),
(18373, 42, 0, 0, 'xa_tien_dien', 'Xã Tiên Điền', 'tien_dien', '18373', 'xã', 1706, 'hienthi', 0, 1759490174, NULL),
(18352, 42, 0, 0, 'xa_nghi_xuan', 'Xã Nghi Xuân', 'nghi_xuan', '18352', 'xã', 1707, 'hienthi', 0, 1759490174, NULL),
(18394, 42, 0, 0, 'xa_co_dam', 'Xã Cổ Đạm', 'co_dam', '18394', 'xã', 1708, 'hienthi', 0, 1759490174, NULL),
(18364, 42, 0, 0, 'xa_dan_hai', 'Xã Đan Hải', 'dan_hai', '18364', 'xã', 1709, 'hienthi', 0, 1759490174, NULL),
(18229, 42, 0, 0, 'xa_duc_tho', 'Xã Đức Thọ', 'duc_tho', '18229', 'xã', 1710, 'hienthi', 0, 1759490174, NULL),
(18262, 42, 0, 0, 'xa_duc_quang', 'Xã Đức Quang', 'duc_quang', '18262', 'xã', 1711, 'hienthi', 0, 1759490174, NULL),
(18304, 42, 0, 0, 'xa_duc_dong', 'Xã Đức Đồng', 'duc_dong', '18304', 'xã', 1712, 'hienthi', 0, 1759490174, NULL),
(18277, 42, 0, 0, 'xa_duc_thinh', 'Xã Đức Thịnh', 'duc_thinh', '18277', 'xã', 1713, 'hienthi', 0, 1759490174, NULL),
(18244, 42, 0, 0, 'xa_duc_minh', 'Xã Đức Minh', 'duc_minh', '18244', 'xã', 1714, 'hienthi', 0, 1759490174, NULL),
(18133, 42, 0, 0, 'xa_huong_son', 'Xã Hương Sơn', 'huong_son', '18133', 'xã', 1715, 'hienthi', 0, 1759490174, NULL),
(18172, 42, 0, 0, 'xa_son_tay', 'Xã Sơn Tây', 'son_tay', '18172', 'xã', 1716, 'hienthi', 0, 1759490174, NULL),
(18202, 42, 0, 0, 'xa_tu_my', 'Xã Tứ Mỹ', 'tu_my', '18202', 'xã', 1717, 'hienthi', 0, 1759490174, NULL),
(18184, 42, 0, 0, 'xa_son_giang', 'Xã Sơn Giang', 'son_giang', '18184', 'xã', 1718, 'hienthi', 0, 1759490174, NULL),
(18163, 42, 0, 0, 'xa_son_tien', 'Xã Sơn Tiến', 'son_tien', '18163', 'xã', 1719, 'hienthi', 0, 1759490174, NULL),
(18160, 42, 0, 0, 'xa_son_hong', 'Xã Sơn Hồng', 'son_hong', '18160', 'xã', 1720, 'hienthi', 0, 1759490174, NULL),
(18223, 42, 0, 0, 'xa_kim_hoa', 'Xã Kim Hoa', 'kim_hoa', '18223', 'xã', 1721, 'hienthi', 0, 1759490174, NULL),
(18313, 42, 0, 0, 'xa_vu_quang', 'Xã Vũ Quang', 'vu_quang', '18313', 'xã', 1722, 'hienthi', 0, 1759490174, NULL),
(18322, 42, 0, 0, 'xa_mai_hoa', 'Xã Mai Hoa', 'mai_hoa', '18322', 'xã', 1723, 'hienthi', 0, 1759490174, NULL),
(18328, 42, 0, 0, 'xa_thuong_duc', 'Xã Thượng Đức', 'thuong_duc', '18328', 'xã', 1724, 'hienthi', 0, 1759490174, NULL),
(18496, 42, 0, 0, 'xa_huong_khe', 'Xã Hương Khê', 'huong_khe', '18496', 'xã', 1725, 'hienthi', 0, 1759490174, NULL),
(18532, 42, 0, 0, 'xa_huong_pho', 'Xã Hương Phố', 'huong_pho', '18532', 'xã', 1726, 'hienthi', 0, 1759490174, NULL),
(18550, 42, 0, 0, 'xa_huong_do', 'Xã Hương Đô', 'huong_do', '18550', 'xã', 1727, 'hienthi', 0, 1759490174, NULL),
(18502, 42, 0, 0, 'xa_ha_linh', 'Xã Hà Linh', 'ha_linh', '18502', 'xã', 1728, 'hienthi', 0, 1759490174, NULL),
(18523, 42, 0, 0, 'xa_huong_binh', 'Xã Hương Bình', 'huong_binh', '18523', 'xã', 1729, 'hienthi', 0, 1759490174, NULL),
(18547, 42, 0, 0, 'xa_phuc_trach', 'Xã Phúc Trạch', 'phuc_trach', '18547', 'xã', 1730, 'hienthi', 0, 1759490174, NULL),
(18544, 42, 0, 0, 'xa_huong_xuan', 'Xã Hương Xuân', 'huong_xuan', '18544', 'xã', 1731, 'hienthi', 0, 1759490174, NULL),
(18196, 42, 0, 0, 'xa_son_kim_1', 'Xã Sơn Kim 1', 'son_kim_1', '18196', 'xã', 1732, 'hienthi', 0, 1759490174, NULL),
(18199, 42, 0, 0, 'xa_son_kim_2', 'Xã Sơn Kim 2', 'son_kim_2', '18199', 'xã', 1733, 'hienthi', 0, 1759490174, NULL),
(18880, 44, 0, 0, 'phuong_dong_hoi', 'Phường Đồng Hới', 'dong_hoi', '18880', 'phường', 1734, 'hienthi', 0, 1759490174, NULL),
(18859, 44, 0, 0, 'phuong_dong_thuan', 'Phường Đồng Thuận', 'dong_thuan', '18859', 'phường', 1735, 'hienthi', 0, 1759490174, NULL),
(18871, 44, 0, 0, 'phuong_dong_son', 'Phường Đồng Sơn', 'dong_son', '18871', 'phường', 1736, 'hienthi', 0, 1759490174, NULL),
(19093, 44, 0, 0, 'xa_nam_gianh', 'Xã Nam Gianh', 'nam_gianh', '19093', 'xã', 1737, 'hienthi', 0, 1759490174, NULL),
(19075, 44, 0, 0, 'xa_nam_ba_don', 'Xã Nam Ba Đồn', 'nam_ba_don', '19075', 'xã', 1738, 'hienthi', 0, 1759490174, NULL),
(19009, 44, 0, 0, 'phuong_ba_don', 'Phường Ba Đồn', 'ba_don', '19009', 'phường', 1739, 'hienthi', 0, 1759490174, NULL),
(19066, 44, 0, 0, 'phuong_bac_gianh', 'Phường Bắc Gianh', 'bac_gianh', '19066', 'phường', 1740, 'hienthi', 0, 1759490174, NULL),
(18904, 44, 0, 0, 'xa_dan_hoa', 'Xã Dân Hóa', 'dan_hoa', '18904', 'xã', 1741, 'hienthi', 0, 1759490174, NULL),
(18922, 44, 0, 0, 'xa_kim_dien', 'Xã Kim Điền', 'kim_dien', '18922', 'xã', 1742, 'hienthi', 0, 1759490174, NULL),
(18943, 44, 0, 0, 'xa_kim_phu', 'Xã Kim Phú', 'kim_phu', '18943', 'xã', 1743, 'hienthi', 0, 1759490174, NULL),
(18901, 44, 0, 0, 'xa_minh_hoa', 'Xã Minh Hóa', 'minh_hoa', '18901', 'xã', 1744, 'hienthi', 0, 1759490174, NULL),
(18919, 44, 0, 0, 'xa_tan_thanh', 'Xã Tân Thành', 'tan_thanh', '18919', 'xã', 1745, 'hienthi', 0, 1759490174, NULL),
(18958, 44, 0, 0, 'xa_tuyen_lam', 'Xã Tuyên Lâm', 'tuyen_lam', '18958', 'xã', 1746, 'hienthi', 0, 1759490174, NULL),
(18952, 44, 0, 0, 'xa_tuyen_son', 'Xã Tuyên Sơn', 'tuyen_son', '18952', 'xã', 1747, 'hienthi', 0, 1759490174, NULL),
(18949, 44, 0, 0, 'xa_dong_le', 'Xã Đồng Lê', 'dong_le', '18949', 'xã', 1748, 'hienthi', 0, 1759490174, NULL),
(18985, 44, 0, 0, 'xa_tuyen_phu', 'Xã Tuyên Phú', 'tuyen_phu', '18985', 'xã', 1749, 'hienthi', 0, 1759490174, NULL),
(18991, 44, 0, 0, 'xa_tuyen_binh', 'Xã Tuyên Bình', 'tuyen_binh', '18991', 'xã', 1750, 'hienthi', 0, 1759490174, NULL),
(18997, 44, 0, 0, 'xa_tuyen_hoa', 'Xã Tuyên Hóa', 'tuyen_hoa', '18997', 'xã', 1751, 'hienthi', 0, 1759490174, NULL),
(19051, 44, 0, 0, 'xa_tan_gianh', 'Xã Tân Gianh', 'tan_gianh', '19051', 'xã', 1752, 'hienthi', 0, 1759490174, NULL),
(19030, 44, 0, 0, 'xa_trung_thuan', 'Xã Trung Thuần', 'trung_thuan', '19030', 'xã', 1753, 'hienthi', 0, 1759490174, NULL),
(19057, 44, 0, 0, 'xa_quang_trach', 'Xã Quảng Trạch', 'quang_trach', '19057', 'xã', 1754, 'hienthi', 0, 1759490174, NULL);
INSERT INTO `table_ward` (`id`, `id_city`, `id_district`, `districtid`, `wardcode`, `name`, `slug`, `code`, `level`, `numb`, `status`, `date_updated`, `date_created`, `ship_price`) VALUES
(19033, 44, 0, 0, 'xa_hoa_trach', 'Xã Hòa Trạch', 'hoa_trach', '19033', 'xã', 1755, 'hienthi', 0, 1759490174, NULL),
(19021, 44, 0, 0, 'xa_phu_trach', 'Xã Phú Trạch', 'phu_trach', '19021', 'xã', 1756, 'hienthi', 0, 1759490174, NULL),
(19147, 44, 0, 0, 'xa_thuong_trach', 'Xã Thượng Trạch', 'thuong_trach', '19147', 'xã', 1757, 'hienthi', 0, 1759490174, NULL),
(19165, 44, 0, 0, 'xa_phong_nha', 'Xã Phong Nha', 'phong_nha', '19165', 'xã', 1758, 'hienthi', 0, 1759490174, NULL),
(19126, 44, 0, 0, 'xa_bac_trach', 'Xã Bắc Trạch', 'bac_trach', '19126', 'xã', 1759, 'hienthi', 0, 1759490174, NULL),
(19159, 44, 0, 0, 'xa_dong_trach', 'Xã Đông Trạch', 'dong_trach', '19159', 'xã', 1760, 'hienthi', 0, 1759490174, NULL),
(19111, 44, 0, 0, 'xa_hoan_lao', 'Xã Hoàn Lão', 'hoan_lao', '19111', 'xã', 1761, 'hienthi', 0, 1759490174, NULL),
(19141, 44, 0, 0, 'xa_bo_trach', 'Xã Bố Trạch', 'bo_trach', '19141', 'xã', 1762, 'hienthi', 0, 1759490174, NULL),
(19198, 44, 0, 0, 'xa_nam_trach', 'Xã Nam Trạch', 'nam_trach', '19198', 'xã', 1763, 'hienthi', 0, 1759490174, NULL),
(19207, 44, 0, 0, 'xa_quang_ninh', 'Xã Quảng Ninh', 'quang_ninh', '19207', 'xã', 1764, 'hienthi', 0, 1759490174, NULL),
(19225, 44, 0, 0, 'xa_ninh_chau', 'Xã Ninh Châu', 'ninh_chau', '19225', 'xã', 1765, 'hienthi', 0, 1759490174, NULL),
(19237, 44, 0, 0, 'xa_truong_ninh', 'Xã Trường Ninh', 'truong_ninh', '19237', 'xã', 1766, 'hienthi', 0, 1759490174, NULL),
(19204, 44, 0, 0, 'xa_truong_son', 'Xã Trường Sơn', 'truong_son', '19204', 'xã', 1767, 'hienthi', 0, 1759490174, NULL),
(19249, 44, 0, 0, 'xa_le_thuy', 'Xã Lệ Thủy', 'le_thuy', '19249', 'xã', 1768, 'hienthi', 0, 1759490174, NULL),
(19255, 44, 0, 0, 'xa_cam_hong', 'Xã Cam Hồng', 'cam_hong', '19255', 'xã', 1769, 'hienthi', 0, 1759490174, NULL),
(19288, 44, 0, 0, 'xa_sen_ngu', 'Xã Sen Ngư', 'sen_ngu', '19288', 'xã', 1770, 'hienthi', 0, 1759490174, NULL),
(19291, 44, 0, 0, 'xa_tan_my', 'Xã Tân Mỹ', 'tan_my', '19291', 'xã', 1771, 'hienthi', 0, 1759490174, NULL),
(19309, 44, 0, 0, 'xa_truong_phu', 'Xã Trường Phú', 'truong_phu', '19309', 'xã', 1772, 'hienthi', 0, 1759490174, NULL),
(19246, 44, 0, 0, 'xa_le_ninh', 'Xã Lệ Ninh', 'le_ninh', '19246', 'xã', 1773, 'hienthi', 0, 1759490174, NULL),
(19318, 44, 0, 0, 'xa_kim_ngan', 'Xã Kim Ngân', 'kim_ngan', '19318', 'xã', 1774, 'hienthi', 0, 1759490174, NULL),
(19333, 44, 0, 0, 'phuong_dong_ha', 'Phường Đông Hà', 'dong_ha', '19333', 'phường', 1775, 'hienthi', 0, 1759490174, NULL),
(19351, 44, 0, 0, 'phuong_nam_dong_ha', 'Phường Nam Đông Hà', 'nam_dong_ha', '19351', 'phường', 1776, 'hienthi', 0, 1759490174, NULL),
(19360, 44, 0, 0, 'phuong_quang_tri', 'Phường Quảng Trị', 'quang_tri', '19360', 'phường', 1777, 'hienthi', 0, 1759490174, NULL),
(19363, 44, 0, 0, 'xa_vinh_linh', 'Xã Vĩnh Linh', 'vinh_linh', '19363', 'xã', 1778, 'hienthi', 0, 1759490174, NULL),
(19414, 44, 0, 0, 'xa_cua_tung', 'Xã Cửa Tùng', 'cua_tung', '19414', 'xã', 1779, 'hienthi', 0, 1759490174, NULL),
(19372, 44, 0, 0, 'xa_vinh_hoang', 'Xã Vĩnh Hoàng', 'vinh_hoang', '19372', 'xã', 1780, 'hienthi', 0, 1759490174, NULL),
(19405, 44, 0, 0, 'xa_vinh_thuy', 'Xã Vĩnh Thủy', 'vinh_thuy', '19405', 'xã', 1781, 'hienthi', 0, 1759490174, NULL),
(19366, 44, 0, 0, 'xa_ben_quan', 'Xã Bến Quan', 'ben_quan', '19366', 'xã', 1782, 'hienthi', 0, 1759490174, NULL),
(19537, 44, 0, 0, 'xa_con_tien', 'Xã Cồn Tiên', 'con_tien', '19537', 'xã', 1783, 'hienthi', 0, 1759490174, NULL),
(19496, 44, 0, 0, 'xa_cua_viet', 'Xã Cửa Việt', 'cua_viet', '19496', 'xã', 1784, 'hienthi', 0, 1759490174, NULL),
(19495, 44, 0, 0, 'xa_gio_linh', 'Xã Gio Linh', 'gio_linh', '19495', 'xã', 1785, 'hienthi', 0, 1759490174, NULL),
(19501, 44, 0, 0, 'xa_ben_hai', 'Xã Bến Hải', 'ben_hai', '19501', 'xã', 1786, 'hienthi', 0, 1759490174, NULL),
(19435, 44, 0, 0, 'xa_huong_lap', 'Xã Hướng Lập', 'huong_lap', '19435', 'xã', 1787, 'hienthi', 0, 1759490174, NULL),
(19441, 44, 0, 0, 'xa_huong_phung', 'Xã Hướng Phùng', 'huong_phung', '19441', 'xã', 1788, 'hienthi', 0, 1759490174, NULL),
(19429, 44, 0, 0, 'xa_khe_sanh', 'Xã Khe Sanh', 'khe_sanh', '19429', 'xã', 1789, 'hienthi', 0, 1759490174, NULL),
(19462, 44, 0, 0, 'xa_tan_lap', 'Xã Tân Lập', 'tan_lap', '19462', 'xã', 1790, 'hienthi', 0, 1759490174, NULL),
(19432, 44, 0, 0, 'xa_lao_bao', 'Xã Lao Bảo', 'lao_bao', '19432', 'xã', 1791, 'hienthi', 0, 1759490174, NULL),
(19489, 44, 0, 0, 'xa_lia', 'Xã Lìa', 'lia', '19489', 'xã', 1792, 'hienthi', 0, 1759490174, NULL),
(19483, 44, 0, 0, 'xa_a_doi', 'Xã A Dơi', 'a_doi', '19483', 'xã', 1793, 'hienthi', 0, 1759490174, NULL),
(19594, 44, 0, 0, 'xa_la_lay', 'Xã La Lay', 'la_lay', '19594', 'xã', 1794, 'hienthi', 0, 1759490174, NULL),
(19588, 44, 0, 0, 'xa_ta_rut', 'Xã Tà Rụt', 'ta_rut', '19588', 'xã', 1795, 'hienthi', 0, 1759490174, NULL),
(19564, 44, 0, 0, 'xa_dakrong', 'Xã Đakrông', 'dakrong', '19564', 'xã', 1796, 'hienthi', 0, 1759490174, NULL),
(19567, 44, 0, 0, 'xa_ba_long', 'Xã Ba Lòng', 'ba_long', '19567', 'xã', 1797, 'hienthi', 0, 1759490174, NULL),
(19555, 44, 0, 0, 'xa_huong_hiep', 'Xã Hướng Hiệp', 'huong_hiep', '19555', 'xã', 1798, 'hienthi', 0, 1759490174, NULL),
(19597, 44, 0, 0, 'xa_cam_lo', 'Xã Cam Lộ', 'cam_lo', '19597', 'xã', 1799, 'hienthi', 0, 1759490174, NULL),
(19603, 44, 0, 0, 'xa_hieu_giang', 'Xã Hiếu Giang', 'hieu_giang', '19603', 'xã', 1800, 'hienthi', 0, 1759490174, NULL),
(19624, 44, 0, 0, 'xa_trieu_phong', 'Xã Triệu Phong', 'trieu_phong', '19624', 'xã', 1801, 'hienthi', 0, 1759490174, NULL),
(19669, 44, 0, 0, 'xa_ai_tu', 'Xã Ái Tử', 'ai_tu', '19669', 'xã', 1802, 'hienthi', 0, 1759490174, NULL),
(19645, 44, 0, 0, 'xa_trieu_binh', 'Xã Triệu Bình', 'trieu_binh', '19645', 'xã', 1803, 'hienthi', 0, 1759490174, NULL),
(19654, 44, 0, 0, 'xa_trieu_co', 'Xã Triệu Cơ', 'trieu_co', '19654', 'xã', 1804, 'hienthi', 0, 1759490174, NULL),
(19639, 44, 0, 0, 'xa_nam_cua_viet', 'Xã Nam Cửa Việt', 'nam_cua_viet', '19639', 'xã', 1805, 'hienthi', 0, 1759490174, NULL),
(19681, 44, 0, 0, 'xa_dien_sanh', 'Xã Diên Sanh', 'dien_sanh', '19681', 'xã', 1806, 'hienthi', 0, 1759490174, NULL),
(19741, 44, 0, 0, 'xa_my_thuy', 'Xã Mỹ Thủy', 'my_thuy', '19741', 'xã', 1807, 'hienthi', 0, 1759490174, NULL),
(19702, 44, 0, 0, 'xa_hai_lang', 'Xã Hải Lăng', 'hai_lang', '19702', 'xã', 1808, 'hienthi', 0, 1759490174, NULL),
(19699, 44, 0, 0, 'xa_vinh_dinh', 'Xã Vĩnh Định', 'vinh_dinh', '19699', 'xã', 1809, 'hienthi', 0, 1759490174, NULL),
(19735, 44, 0, 0, 'xa_nam_hai_lang', 'Xã Nam Hải Lăng', 'nam_hai_lang', '19735', 'xã', 1810, 'hienthi', 0, 1759490174, NULL),
(19742, 44, 0, 0, 'dac_khu_con_co', 'Đặc khu Cồn Cỏ', 'con_co', '19742', 'đặc khu', 1811, 'hienthi', 0, 1759490174, NULL),
(19900, 46, 0, 0, 'phuong_thuan_an', 'Phường Thuận An', 'thuan_an', '19900', 'phường', 1812, 'hienthi', 0, 1759490174, NULL),
(20014, 46, 0, 0, 'phuong_hoa_chau', 'Phường Hóa Châu', 'hoa_chau', '20014', 'phường', 1813, 'hienthi', 0, 1759490174, NULL),
(19930, 46, 0, 0, 'phuong_my_thuong', 'Phường Mỹ Thượng', 'my_thuong', '19930', 'phường', 1814, 'hienthi', 0, 1759490174, NULL),
(19777, 46, 0, 0, 'phuong_vy_da', 'Phường Vỹ Dạ', 'vy_da', '19777', 'phường', 1815, 'hienthi', 0, 1759490174, NULL),
(19786, 46, 0, 0, 'phuong_thuan_hoa', 'Phường Thuận Hóa', 'thuan_hoa', '19786', 'phường', 1816, 'hienthi', 0, 1759490174, NULL),
(19815, 46, 0, 0, 'phuong_an_cuu', 'Phường An Cựu', 'an_cuu', '19815', 'phường', 1817, 'hienthi', 0, 1759490174, NULL),
(19813, 46, 0, 0, 'phuong_thuy_xuan', 'Phường Thủy Xuân', 'thuy_xuan', '19813', 'phường', 1818, 'hienthi', 0, 1759490174, NULL),
(19810, 46, 0, 0, 'phuong_kim_long', 'Phường Kim Long', 'kim_long', '19810', 'phường', 1819, 'hienthi', 0, 1759490174, NULL),
(20023, 46, 0, 0, 'phuong_huong_an', 'Phường Hương An', 'huong_an', '20023', 'phường', 1820, 'hienthi', 0, 1759490174, NULL),
(19768, 46, 0, 0, 'phuong_phu_xuan', 'Phường Phú Xuân', 'phu_xuan', '19768', 'phường', 1821, 'hienthi', 0, 1759490174, NULL),
(19996, 46, 0, 0, 'phuong_huong_tra', 'Phường Hương Trà', 'huong_tra', '19996', 'phường', 1822, 'hienthi', 0, 1759490174, NULL),
(20017, 46, 0, 0, 'phuong_kim_tra', 'Phường Kim Trà', 'kim_tra', '20017', 'phường', 1823, 'hienthi', 0, 1759490174, NULL),
(19969, 46, 0, 0, 'phuong_thanh_thuy', 'Phường Thanh Thủy', 'thanh_thuy', '19969', 'phường', 1824, 'hienthi', 0, 1759490174, NULL),
(19975, 46, 0, 0, 'phuong_huong_thuy', 'Phường Hương Thủy', 'huong_thuy', '19975', 'phường', 1825, 'hienthi', 0, 1759490174, NULL),
(19960, 46, 0, 0, 'phuong_phu_bai', 'Phường Phú Bài', 'phu_bai', '19960', 'phường', 1826, 'hienthi', 0, 1759490174, NULL),
(19819, 46, 0, 0, 'phuong_phong_dien', 'Phường Phong Điền', 'phong_dien', '19819', 'phường', 1827, 'hienthi', 0, 1759490174, NULL),
(19864, 46, 0, 0, 'phuong_phong_thai', 'Phường Phong Thái', 'phong_thai', '19864', 'phường', 1828, 'hienthi', 0, 1759490174, NULL),
(19831, 46, 0, 0, 'phuong_phong_dinh', 'Phường Phong Dinh', 'phong_dinh', '19831', 'phường', 1829, 'hienthi', 0, 1759490174, NULL),
(19828, 46, 0, 0, 'phuong_phong_phu', 'Phường Phong Phú', 'phong_phu', '19828', 'phường', 1830, 'hienthi', 0, 1759490174, NULL),
(19873, 46, 0, 0, 'phuong_phong_quang', 'Phường Phong Quảng', 'phong_quang', '19873', 'phường', 1831, 'hienthi', 0, 1759490174, NULL),
(19885, 46, 0, 0, 'xa_dan_dien', 'Xã Đan Điền', 'dan_dien', '19885', 'xã', 1832, 'hienthi', 0, 1759490174, NULL),
(19867, 46, 0, 0, 'xa_quang_dien', 'Xã Quảng Điền', 'quang_dien', '19867', 'xã', 1833, 'hienthi', 0, 1759490174, NULL),
(19945, 46, 0, 0, 'xa_phu_vinh', 'Xã Phú Vinh', 'phu_vinh', '19945', 'xã', 1834, 'hienthi', 0, 1759490174, NULL),
(19918, 46, 0, 0, 'xa_phu_ho', 'Xã Phú Hồ', 'phu_ho', '19918', 'xã', 1835, 'hienthi', 0, 1759490174, NULL),
(19942, 46, 0, 0, 'xa_phu_vang', 'Xã Phú Vang', 'phu_vang', '19942', 'xã', 1836, 'hienthi', 0, 1759490174, NULL),
(20122, 46, 0, 0, 'xa_vinh_loc', 'Xã Vinh Lộc', 'vinh_loc', '20122', 'xã', 1837, 'hienthi', 0, 1759490174, NULL),
(20131, 46, 0, 0, 'xa_hung_loc', 'Xã Hưng Lộc', 'hung_loc', '20131', 'xã', 1838, 'hienthi', 0, 1759490174, NULL),
(20140, 46, 0, 0, 'xa_loc_an', 'Xã Lộc An', 'loc_an', '20140', 'xã', 1839, 'hienthi', 0, 1759490174, NULL),
(20107, 46, 0, 0, 'xa_phu_loc', 'Xã Phú Lộc', 'phu_loc', '20107', 'xã', 1840, 'hienthi', 0, 1759490174, NULL),
(20152, 46, 0, 0, 'xa_chan_may_lang_co', 'Xã Chân Mây – Lăng Cô', 'chan_may_lang_co', '20152', 'xã', 1841, 'hienthi', 0, 1759490174, NULL),
(20182, 46, 0, 0, 'xa_long_quang', 'Xã Long Quảng', 'long_quang', '20182', 'xã', 1842, 'hienthi', 0, 1759490174, NULL),
(20179, 46, 0, 0, 'xa_nam_dong', 'Xã Nam Đông', 'nam_dong', '20179', 'xã', 1843, 'hienthi', 0, 1759490174, NULL),
(20161, 46, 0, 0, 'xa_khe_tre', 'Xã Khe Tre', 'khe_tre', '20161', 'xã', 1844, 'hienthi', 0, 1759490174, NULL),
(20035, 46, 0, 0, 'xa_binh_dien', 'Xã Bình Điền', 'binh_dien', '20035', 'xã', 1845, 'hienthi', 0, 1759490174, NULL),
(20056, 46, 0, 0, 'xa_a_luoi_1', 'Xã A Lưới 1', 'a_luoi_1', '20056', 'xã', 1846, 'hienthi', 0, 1759490174, NULL),
(20044, 46, 0, 0, 'xa_a_luoi_2', 'Xã A Lưới 2', 'a_luoi_2', '20044', 'xã', 1847, 'hienthi', 0, 1759490174, NULL),
(20071, 46, 0, 0, 'xa_a_luoi_3', 'Xã A Lưới 3', 'a_luoi_3', '20071', 'xã', 1848, 'hienthi', 0, 1759490174, NULL),
(20101, 46, 0, 0, 'xa_a_luoi_4', 'Xã A Lưới 4', 'a_luoi_4', '20101', 'xã', 1849, 'hienthi', 0, 1759490174, NULL),
(20050, 46, 0, 0, 'xa_a_luoi_5', 'Xã A Lưới 5', 'a_luoi_5', '20050', 'xã', 1850, 'hienthi', 0, 1759490174, NULL),
(19909, 46, 0, 0, 'phuong_duong_no', 'Phường Dương Nỗ', 'duong_no', '19909', 'phường', 1851, 'hienthi', 0, 1759490174, NULL),
(20242, 48, 0, 0, 'phuong_hai_chau', 'Phường Hải Châu', 'hai_chau', '20242', 'phường', 1852, 'hienthi', 0, 1759490174, NULL),
(20257, 48, 0, 0, 'phuong_hoa_cuong', 'Phường Hòa Cường', 'hoa_cuong', '20257', 'phường', 1853, 'hienthi', 0, 1759490174, NULL),
(20209, 48, 0, 0, 'phuong_thanh_khe', 'Phường Thanh Khê', 'thanh_khe', '20209', 'phường', 1854, 'hienthi', 0, 1759490174, NULL),
(20224, 48, 0, 0, 'phuong_an_khe', 'Phường An Khê', 'an_khe', '20224', 'phường', 1855, 'hienthi', 0, 1759490174, NULL),
(20275, 48, 0, 0, 'phuong_an_hai', 'Phường An Hải', 'an_hai', '20275', 'phường', 1856, 'hienthi', 0, 1759490174, NULL),
(20263, 48, 0, 0, 'phuong_son_tra', 'Phường Sơn Trà', 'son_tra', '20263', 'phường', 1857, 'hienthi', 0, 1759490174, NULL),
(20285, 48, 0, 0, 'phuong_ngu_hanh_son', 'Phường Ngũ Hành Sơn', 'ngu_hanh_son', '20285', 'phường', 1858, 'hienthi', 0, 1759490174, NULL),
(20200, 48, 0, 0, 'phuong_hoa_khanh', 'Phường Hòa Khánh', 'hoa_khanh', '20200', 'phường', 1859, 'hienthi', 0, 1759490174, NULL),
(20195, 48, 0, 0, 'phuong_hai_van', 'Phường Hải Vân', 'hai_van', '20195', 'phường', 1860, 'hienthi', 0, 1759490174, NULL),
(20197, 48, 0, 0, 'phuong_lien_chieu', 'Phường Liên Chiểu', 'lien_chieu', '20197', 'phường', 1861, 'hienthi', 0, 1759490174, NULL),
(20260, 48, 0, 0, 'phuong_cam_le', 'Phường Cẩm Lệ', 'cam_le', '20260', 'phường', 1862, 'hienthi', 0, 1759490174, NULL),
(20314, 48, 0, 0, 'phuong_hoa_xuan', 'Phường Hòa Xuân', 'hoa_xuan', '20314', 'phường', 1863, 'hienthi', 0, 1759490174, NULL),
(20320, 48, 0, 0, 'xa_hoa_vang', 'Xã Hòa Vang', 'hoa_vang', '20320', 'xã', 1864, 'hienthi', 0, 1759490174, NULL),
(20332, 48, 0, 0, 'xa_hoa_tien', 'Xã Hòa Tiến', 'hoa_tien', '20332', 'xã', 1865, 'hienthi', 0, 1759490174, NULL),
(20308, 48, 0, 0, 'xa_ba_na', 'Xã Bà Nà', 'ba_na', '20308', 'xã', 1866, 'hienthi', 0, 1759490174, NULL),
(20333, 48, 0, 0, 'dac_khu_hoang_sa', 'Đặc khu Hoàng Sa', 'hoang_sa', '20333', 'đặc khu', 1867, 'hienthi', 0, 1759490174, NULL),
(20965, 48, 0, 0, 'xa_nui_thanh', 'Xã Núi Thành', 'nui_thanh', '20965', 'xã', 1868, 'hienthi', 0, 1759490174, NULL),
(21004, 48, 0, 0, 'xa_tam_my', 'Xã Tam Mỹ', 'tam_my', '21004', 'xã', 1869, 'hienthi', 0, 1759490174, NULL),
(20984, 48, 0, 0, 'xa_tam_anh', 'Xã Tam Anh', 'tam_anh', '20984', 'xã', 1870, 'hienthi', 0, 1759490174, NULL),
(20977, 48, 0, 0, 'xa_duc_phu', 'Xã Đức Phú', 'duc_phu', '20977', 'xã', 1871, 'hienthi', 0, 1759490174, NULL),
(20971, 48, 0, 0, 'xa_tam_xuan', 'Xã Tam Xuân', 'tam_xuan', '20971', 'xã', 1872, 'hienthi', 0, 1759490174, NULL),
(20992, 48, 0, 0, 'xa_tam_hai', 'Xã Tam Hải', 'tam_hai', '20992', 'xã', 1873, 'hienthi', 0, 1759490174, NULL),
(20341, 48, 0, 0, 'phuong_tam_ky', 'Phường Tam Kỳ', 'tam_ky', '20341', 'phường', 1874, 'hienthi', 0, 1759490174, NULL),
(20356, 48, 0, 0, 'phuong_quang_phu', 'Phường Quảng Phú', 'quang_phu', '20356', 'phường', 1875, 'hienthi', 0, 1759490174, NULL),
(20350, 48, 0, 0, 'phuong_huong_tra', 'Phường Hương Trà', 'huong_tra', '20350', 'phường', 1876, 'hienthi', 0, 1759490174, NULL),
(20335, 48, 0, 0, 'phuong_ban_thach', 'Phường Bàn Thạch', 'ban_thach', '20335', 'phường', 1877, 'hienthi', 0, 1759490174, NULL),
(20380, 48, 0, 0, 'xa_tay_ho', 'Xã Tây Hồ', 'tay_ho', '20380', 'xã', 1878, 'hienthi', 0, 1759490174, NULL),
(20364, 48, 0, 0, 'xa_chien_dan', 'Xã Chiên Đàn', 'chien_dan', '20364', 'xã', 1879, 'hienthi', 0, 1759490174, NULL),
(20392, 48, 0, 0, 'xa_phu_ninh', 'Xã Phú Ninh', 'phu_ninh', '20392', 'xã', 1880, 'hienthi', 0, 1759490174, NULL),
(20872, 48, 0, 0, 'xa_lanh_ngoc', 'Xã Lãnh Ngọc', 'lanh_ngoc', '20872', 'xã', 1881, 'hienthi', 0, 1759490174, NULL),
(20854, 48, 0, 0, 'xa_tien_phuoc', 'Xã Tiên Phước', 'tien_phuoc', '20854', 'xã', 1882, 'hienthi', 0, 1759490174, NULL),
(20878, 48, 0, 0, 'xa_thanh_binh', 'Xã Thạnh Bình', 'thanh_binh', '20878', 'xã', 1883, 'hienthi', 0, 1759490174, NULL),
(20857, 48, 0, 0, 'xa_son_cam_ha', 'Xã Sơn Cẩm Hà', 'son_cam_ha', '20857', 'xã', 1884, 'hienthi', 0, 1759490174, NULL),
(20908, 48, 0, 0, 'xa_tra_lien', 'Xã Trà Liên', 'tra_lien', '20908', 'xã', 1885, 'hienthi', 0, 1759490174, NULL),
(20929, 48, 0, 0, 'xa_tra_giap', 'Xã Trà Giáp', 'tra_giap', '20929', 'xã', 1886, 'hienthi', 0, 1759490174, NULL),
(20923, 48, 0, 0, 'xa_tra_tan', 'Xã Trà Tân', 'tra_tan', '20923', 'xã', 1887, 'hienthi', 0, 1759490174, NULL),
(20920, 48, 0, 0, 'xa_tra_doc', 'Xã Trà Đốc', 'tra_doc', '20920', 'xã', 1888, 'hienthi', 0, 1759490174, NULL),
(20900, 48, 0, 0, 'xa_tra_my', 'Xã Trà My', 'tra_my', '20900', 'xã', 1889, 'hienthi', 0, 1759490174, NULL),
(20944, 48, 0, 0, 'xa_nam_tra_my', 'Xã Nam Trà My', 'nam_tra_my', '20944', 'xã', 1890, 'hienthi', 0, 1759490174, NULL),
(20941, 48, 0, 0, 'xa_tra_tap', 'Xã Trà Tập', 'tra_tap', '20941', 'xã', 1891, 'hienthi', 0, 1759490174, NULL),
(20959, 48, 0, 0, 'xa_tra_van', 'Xã Trà Vân', 'tra_van', '20959', 'xã', 1892, 'hienthi', 0, 1759490174, NULL),
(20950, 48, 0, 0, 'xa_tra_linh', 'Xã Trà Linh', 'tra_linh', '20950', 'xã', 1893, 'hienthi', 0, 1759490174, NULL),
(20938, 48, 0, 0, 'xa_tra_leng', 'Xã Trà Leng', 'tra_leng', '20938', 'xã', 1894, 'hienthi', 0, 1759490174, NULL),
(20791, 48, 0, 0, 'xa_thang_binh', 'Xã Thăng Bình', 'thang_binh', '20791', 'xã', 1895, 'hienthi', 0, 1759490174, NULL),
(20794, 48, 0, 0, 'xa_thang_an', 'Xã Thăng An', 'thang_an', '20794', 'xã', 1896, 'hienthi', 0, 1759490174, NULL),
(20836, 48, 0, 0, 'xa_thang_truong', 'Xã Thăng Trường', 'thang_truong', '20836', 'xã', 1897, 'hienthi', 0, 1759490174, NULL),
(20848, 48, 0, 0, 'xa_thang_dien', 'Xã Thăng Điền', 'thang_dien', '20848', 'xã', 1898, 'hienthi', 0, 1759490174, NULL),
(20827, 48, 0, 0, 'xa_thang_phu', 'Xã Thăng Phú', 'thang_phu', '20827', 'xã', 1899, 'hienthi', 0, 1759490174, NULL),
(20818, 48, 0, 0, 'xa_dong_duong', 'Xã Đồng Dương', 'dong_duong', '20818', 'xã', 1900, 'hienthi', 0, 1759490174, NULL),
(20662, 48, 0, 0, 'xa_que_son_trung', 'Xã Quế Sơn Trung', 'que_son_trung', '20662', 'xã', 1901, 'hienthi', 0, 1759490174, NULL),
(20641, 48, 0, 0, 'xa_que_son', 'Xã Quế Sơn', 'que_son', '20641', 'xã', 1902, 'hienthi', 0, 1759490174, NULL),
(20650, 48, 0, 0, 'xa_xuan_phu', 'Xã Xuân Phú', 'xuan_phu', '20650', 'xã', 1903, 'hienthi', 0, 1759490174, NULL),
(20656, 48, 0, 0, 'xa_nong_son', 'Xã Nông Sơn', 'nong_son', '20656', 'xã', 1904, 'hienthi', 0, 1759490174, NULL),
(20669, 48, 0, 0, 'xa_que_phuoc', 'Xã Quế Phước', 'que_phuoc', '20669', 'xã', 1905, 'hienthi', 0, 1759490174, NULL),
(20635, 48, 0, 0, 'xa_duy_nghia', 'Xã Duy Nghĩa', 'duy_nghia', '20635', 'xã', 1906, 'hienthi', 0, 1759490174, NULL),
(20599, 48, 0, 0, 'xa_nam_phuoc', 'Xã Nam Phước', 'nam_phuoc', '20599', 'xã', 1907, 'hienthi', 0, 1759490174, NULL),
(20623, 48, 0, 0, 'xa_duy_xuyen', 'Xã Duy Xuyên', 'duy_xuyen', '20623', 'xã', 1908, 'hienthi', 0, 1759490174, NULL),
(20611, 48, 0, 0, 'xa_thu_bon', 'Xã Thu Bồn', 'thu_bon', '20611', 'xã', 1909, 'hienthi', 0, 1759490174, NULL),
(20551, 48, 0, 0, 'phuong_dien_ban', 'Phường Điện Bàn', 'dien_ban', '20551', 'phường', 1910, 'hienthi', 0, 1759490174, NULL),
(20579, 48, 0, 0, 'phuong_dien_ban_dong', 'Phường Điện Bàn Đông', 'dien_ban_dong', '20579', 'phường', 1911, 'hienthi', 0, 1759490174, NULL),
(20575, 48, 0, 0, 'phuong_an_thang', 'Phường An Thắng', 'an_thang', '20575', 'phường', 1912, 'hienthi', 0, 1759490174, NULL),
(20557, 48, 0, 0, 'phuong_dien_ban_bac', 'Phường Điện Bàn Bắc', 'dien_ban_bac', '20557', 'phường', 1913, 'hienthi', 0, 1759490174, NULL),
(20569, 48, 0, 0, 'xa_dien_ban_tay', 'Xã Điện Bàn Tây', 'dien_ban_tay', '20569', 'xã', 1914, 'hienthi', 0, 1759490174, NULL),
(20587, 48, 0, 0, 'xa_go_noi', 'Xã Gò Nổi', 'go_noi', '20587', 'xã', 1915, 'hienthi', 0, 1759490174, NULL),
(20410, 48, 0, 0, 'phuong_hoi_an', 'Phường Hội An', 'hoi_an', '20410', 'phường', 1916, 'hienthi', 0, 1759490174, NULL),
(20413, 48, 0, 0, 'phuong_hoi_an_dong', 'Phường Hội An Đông', 'hoi_an_dong', '20413', 'phường', 1917, 'hienthi', 0, 1759490174, NULL),
(20401, 48, 0, 0, 'phuong_hoi_an_tay', 'Phường Hội An Tây', 'hoi_an_tay', '20401', 'phường', 1918, 'hienthi', 0, 1759490174, NULL),
(20434, 48, 0, 0, 'xa_tan_hiep', 'Xã Tân Hiệp', 'tan_hiep', '20434', 'xã', 1919, 'hienthi', 0, 1759490174, NULL),
(20500, 48, 0, 0, 'xa_dai_loc', 'Xã Đại Lộc', 'dai_loc', '20500', 'xã', 1920, 'hienthi', 0, 1759490174, NULL),
(20515, 48, 0, 0, 'xa_ha_nha', 'Xã Hà Nha', 'ha_nha', '20515', 'xã', 1921, 'hienthi', 0, 1759490174, NULL),
(20506, 48, 0, 0, 'xa_thuong_duc', 'Xã Thượng Đức', 'thuong_duc', '20506', 'xã', 1922, 'hienthi', 0, 1759490174, NULL),
(20539, 48, 0, 0, 'xa_vu_gia', 'Xã Vu Gia', 'vu_gia', '20539', 'xã', 1923, 'hienthi', 0, 1759490174, NULL),
(20542, 48, 0, 0, 'xa_phu_thuan', 'Xã Phú Thuận', 'phu_thuan', '20542', 'xã', 1924, 'hienthi', 0, 1759490174, NULL),
(20695, 48, 0, 0, 'xa_thanh_my', 'Xã Thạnh Mỹ', 'thanh_my', '20695', 'xã', 1925, 'hienthi', 0, 1759490174, NULL),
(20710, 48, 0, 0, 'xa_ben_giang', 'Xã Bến Giằng', 'ben_giang', '20710', 'xã', 1926, 'hienthi', 0, 1759490174, NULL),
(20707, 48, 0, 0, 'xa_nam_giang', 'Xã Nam Giang', 'nam_giang', '20707', 'xã', 1927, 'hienthi', 0, 1759490174, NULL),
(20716, 48, 0, 0, 'xa_dac_pring', 'Xã Đắc Pring', 'dac_pring', '20716', 'xã', 1928, 'hienthi', 0, 1759490174, NULL),
(20704, 48, 0, 0, 'xa_la_dee', 'Xã La Dêê', 'la_dee', '20704', 'xã', 1929, 'hienthi', 0, 1759490174, NULL),
(20698, 48, 0, 0, 'xa_la_ee', 'Xã La Êê', 'la_ee', '20698', 'xã', 1930, 'hienthi', 0, 1759490174, NULL),
(20485, 48, 0, 0, 'xa_song_vang', 'Xã Sông Vàng', 'song_vang', '20485', 'xã', 1931, 'hienthi', 0, 1759490174, NULL),
(20476, 48, 0, 0, 'xa_song_kon', 'Xã Sông Kôn', 'song_kon', '20476', 'xã', 1932, 'hienthi', 0, 1759490174, NULL),
(20467, 48, 0, 0, 'xa_dong_giang', 'Xã Đông Giang', 'dong_giang', '20467', 'xã', 1933, 'hienthi', 0, 1759490174, NULL),
(20494, 48, 0, 0, 'xa_ben_hien', 'Xã Bến Hiên', 'ben_hien', '20494', 'xã', 1934, 'hienthi', 0, 1759490174, NULL),
(20458, 48, 0, 0, 'xa_avuong', 'Xã Avương', 'avuong', '20458', 'xã', 1935, 'hienthi', 0, 1759490174, NULL),
(20455, 48, 0, 0, 'xa_tay_giang', 'Xã Tây Giang', 'tay_giang', '20455', 'xã', 1936, 'hienthi', 0, 1759490174, NULL),
(20443, 48, 0, 0, 'xa_hung_son', 'Xã Hùng Sơn', 'hung_son', '20443', 'xã', 1937, 'hienthi', 0, 1759490174, NULL),
(20779, 48, 0, 0, 'xa_hiep_duc', 'Xã Hiệp Đức', 'hiep_duc', '20779', 'xã', 1938, 'hienthi', 0, 1759490174, NULL),
(20767, 48, 0, 0, 'xa_viet_an', 'Xã Việt An', 'viet_an', '20767', 'xã', 1939, 'hienthi', 0, 1759490174, NULL),
(20770, 48, 0, 0, 'xa_phuoc_tra', 'Xã Phước Trà', 'phuoc_tra', '20770', 'xã', 1940, 'hienthi', 0, 1759490174, NULL),
(20722, 48, 0, 0, 'xa_kham_duc', 'Xã Khâm Đức', 'kham_duc', '20722', 'xã', 1941, 'hienthi', 0, 1759490174, NULL),
(20734, 48, 0, 0, 'xa_phuoc_nang', 'Xã Phước Năng', 'phuoc_nang', '20734', 'xã', 1942, 'hienthi', 0, 1759490174, NULL),
(20740, 48, 0, 0, 'xa_phuoc_chanh', 'Xã Phước Chánh', 'phuoc_chanh', '20740', 'xã', 1943, 'hienthi', 0, 1759490174, NULL),
(20752, 48, 0, 0, 'xa_phuoc_thanh', 'Xã Phước Thành', 'phuoc_thanh', '20752', 'xã', 1944, 'hienthi', 0, 1759490174, NULL),
(20728, 48, 0, 0, 'xa_phuoc_hiep', 'Xã Phước Hiệp', 'phuoc_hiep', '20728', 'xã', 1945, 'hienthi', 0, 1759490174, NULL),
(21211, 51, 0, 0, 'xa_tinh_khe', 'Xã Tịnh Khê', 'tinh_khe', '21211', 'xã', 1946, 'hienthi', 0, 1759490174, NULL),
(21172, 51, 0, 0, 'phuong_truong_quang_trong', 'Phường Trương Quang Trọng', 'truong_quang_trong', '21172', 'phường', 1947, 'hienthi', 0, 1759490174, NULL),
(21034, 51, 0, 0, 'xa_an_phu', 'Xã An Phú', 'an_phu', '21034', 'xã', 1948, 'hienthi', 0, 1759490174, NULL),
(21025, 51, 0, 0, 'phuong_cam_thanh', 'Phường Cẩm Thành', 'cam_thanh', '21025', 'phường', 1949, 'hienthi', 0, 1759490174, NULL),
(21028, 51, 0, 0, 'phuong_nghia_lo', 'Phường Nghĩa Lộ', 'nghia_lo', '21028', 'phường', 1950, 'hienthi', 0, 1759490174, NULL),
(21451, 51, 0, 0, 'phuong_tra_cau', 'Phường Trà Câu', 'tra_cau', '21451', 'phường', 1951, 'hienthi', 0, 1759490174, NULL),
(21457, 51, 0, 0, 'xa_nguyen_nghiem', 'Xã Nguyễn Nghiêm', 'nguyen_nghiem', '21457', 'xã', 1952, 'hienthi', 0, 1759490174, NULL),
(21439, 51, 0, 0, 'phuong_duc_pho', 'Phường Đức Phổ', 'duc_pho', '21439', 'phường', 1953, 'hienthi', 0, 1759490174, NULL),
(21472, 51, 0, 0, 'xa_khanh_cuong', 'Xã Khánh Cường', 'khanh_cuong', '21472', 'xã', 1954, 'hienthi', 0, 1759490174, NULL),
(21478, 51, 0, 0, 'phuong_sa_huynh', 'Phường Sa Huỳnh', 'sa_huynh', '21478', 'phường', 1955, 'hienthi', 0, 1759490174, NULL),
(21085, 51, 0, 0, 'xa_binh_minh', 'Xã Bình Minh', 'binh_minh', '21085', 'xã', 1956, 'hienthi', 0, 1759490174, NULL),
(21100, 51, 0, 0, 'xa_binh_chuong', 'Xã Bình Chương', 'binh_chuong', '21100', 'xã', 1957, 'hienthi', 0, 1759490174, NULL),
(21040, 51, 0, 0, 'xa_binh_son', 'Xã Bình Sơn', 'binh_son', '21040', 'xã', 1958, 'hienthi', 0, 1759490174, NULL),
(21061, 51, 0, 0, 'xa_van_tuong', 'Xã Vạn Tường', 'van_tuong', '21061', 'xã', 1959, 'hienthi', 0, 1759490174, NULL),
(21109, 51, 0, 0, 'xa_dong_son', 'Xã Đông Sơn', 'dong_son', '21109', 'xã', 1960, 'hienthi', 0, 1759490174, NULL),
(21196, 51, 0, 0, 'xa_truong_giang', 'Xã Trường Giang', 'truong_giang', '21196', 'xã', 1961, 'hienthi', 0, 1759490174, NULL),
(21205, 51, 0, 0, 'xa_ba_gia', 'Xã Ba Gia', 'ba_gia', '21205', 'xã', 1962, 'hienthi', 0, 1759490174, NULL),
(21220, 51, 0, 0, 'xa_son_tinh', 'Xã Sơn Tịnh', 'son_tinh', '21220', 'xã', 1963, 'hienthi', 0, 1759490174, NULL),
(21181, 51, 0, 0, 'xa_tho_phong', 'Xã Thọ Phong', 'tho_phong', '21181', 'xã', 1964, 'hienthi', 0, 1759490174, NULL),
(21235, 51, 0, 0, 'xa_tu_nghia', 'Xã Tư Nghĩa', 'tu_nghia', '21235', 'xã', 1965, 'hienthi', 0, 1759490174, NULL),
(21238, 51, 0, 0, 'xa_ve_giang', 'Xã Vệ Giang', 've_giang', '21238', 'xã', 1966, 'hienthi', 0, 1759490174, NULL),
(21250, 51, 0, 0, 'xa_nghia_giang', 'Xã Nghĩa Giang', 'nghia_giang', '21250', 'xã', 1967, 'hienthi', 0, 1759490174, NULL),
(21244, 51, 0, 0, 'xa_tra_giang', 'Xã Trà Giang', 'tra_giang', '21244', 'xã', 1968, 'hienthi', 0, 1759490174, NULL),
(21364, 51, 0, 0, 'xa_nghia_hanh', 'Xã Nghĩa Hành', 'nghia_hanh', '21364', 'xã', 1969, 'hienthi', 0, 1759490174, NULL),
(21385, 51, 0, 0, 'xa_dinh_cuong', 'Xã Đình Cương', 'dinh_cuong', '21385', 'xã', 1970, 'hienthi', 0, 1759490174, NULL),
(21388, 51, 0, 0, 'xa_thien_tin', 'Xã Thiện Tín', 'thien_tin', '21388', 'xã', 1971, 'hienthi', 0, 1759490174, NULL),
(21370, 51, 0, 0, 'xa_phuoc_giang', 'Xã Phước Giang', 'phuoc_giang', '21370', 'xã', 1972, 'hienthi', 0, 1759490174, NULL),
(21409, 51, 0, 0, 'xa_long_phung', 'Xã Long Phụng', 'long_phung', '21409', 'xã', 1973, 'hienthi', 0, 1759490174, NULL),
(21421, 51, 0, 0, 'xa_mo_cay', 'Xã Mỏ Cày', 'mo_cay', '21421', 'xã', 1974, 'hienthi', 0, 1759490174, NULL),
(21400, 51, 0, 0, 'xa_mo_duc', 'Xã Mộ Đức', 'mo_duc', '21400', 'xã', 1975, 'hienthi', 0, 1759490174, NULL),
(21433, 51, 0, 0, 'xa_lan_phong', 'Xã Lân Phong', 'lan_phong', '21433', 'xã', 1976, 'hienthi', 0, 1759490174, NULL),
(21115, 51, 0, 0, 'xa_tra_bong', 'Xã Trà Bồng', 'tra_bong', '21115', 'xã', 1977, 'hienthi', 0, 1759490174, NULL),
(21127, 51, 0, 0, 'xa_dong_tra_bong', 'Xã Đông Trà Bồng', 'dong_tra_bong', '21127', 'xã', 1978, 'hienthi', 0, 1759490174, NULL),
(21154, 51, 0, 0, 'xa_tay_tra', 'Xã Tây Trà', 'tay_tra', '21154', 'xã', 1979, 'hienthi', 0, 1759490174, NULL),
(21124, 51, 0, 0, 'xa_thanh_bong', 'Xã Thanh Bồng', 'thanh_bong', '21124', 'xã', 1980, 'hienthi', 0, 1759490174, NULL),
(21136, 51, 0, 0, 'xa_ca_dam', 'Xã Cà Đam', 'ca_dam', '21136', 'xã', 1981, 'hienthi', 0, 1759490174, NULL),
(21157, 51, 0, 0, 'xa_tay_tra_bong', 'Xã Tây Trà Bồng', 'tay_tra_bong', '21157', 'xã', 1982, 'hienthi', 0, 1759490174, NULL),
(21292, 51, 0, 0, 'xa_son_ha', 'Xã Sơn Hạ', 'son_ha', '21292', 'xã', 1983, 'hienthi', 0, 1759490174, NULL),
(21307, 51, 0, 0, 'xa_son_linh', 'Xã Sơn Linh', 'son_linh', '21307', 'xã', 1984, 'hienthi', 0, 1759490174, NULL),
(21289, 51, 0, 0, 'xa_son_ha', 'Xã Sơn Hà', 'son_ha', '21289', 'xã', 1985, 'hienthi', 0, 1759490174, NULL),
(21319, 51, 0, 0, 'xa_son_thuy', 'Xã Sơn Thủy', 'son_thuy', '21319', 'xã', 1986, 'hienthi', 0, 1759490174, NULL),
(21325, 51, 0, 0, 'xa_son_ky', 'Xã Sơn Kỳ', 'son_ky', '21325', 'xã', 1987, 'hienthi', 0, 1759490174, NULL),
(21340, 51, 0, 0, 'xa_son_tay', 'Xã Sơn Tây', 'son_tay', '21340', 'xã', 1988, 'hienthi', 0, 1759490174, NULL),
(21334, 51, 0, 0, 'xa_son_tay_thuong', 'Xã Sơn Tây Thượng', 'son_tay_thuong', '21334', 'xã', 1989, 'hienthi', 0, 1759490174, NULL),
(21343, 51, 0, 0, 'xa_son_tay_ha', 'Xã Sơn Tây Hạ', 'son_tay_ha', '21343', 'xã', 1990, 'hienthi', 0, 1759490174, NULL),
(21361, 51, 0, 0, 'xa_minh_long', 'Xã Minh Long', 'minh_long', '21361', 'xã', 1991, 'hienthi', 0, 1759490174, NULL),
(21349, 51, 0, 0, 'xa_son_mai', 'Xã Sơn Mai', 'son_mai', '21349', 'xã', 1992, 'hienthi', 0, 1759490174, NULL),
(21529, 51, 0, 0, 'xa_ba_vi', 'Xã Ba Vì', 'ba_vi', '21529', 'xã', 1993, 'hienthi', 0, 1759490174, NULL),
(21523, 51, 0, 0, 'xa_ba_to', 'Xã Ba Tô', 'ba_to', '21523', 'xã', 1994, 'hienthi', 0, 1759490174, NULL),
(21499, 51, 0, 0, 'xa_ba_dinh', 'Xã Ba Dinh', 'ba_dinh', '21499', 'xã', 1995, 'hienthi', 0, 1759490174, NULL),
(21484, 51, 0, 0, 'xa_ba_to', 'Xã Ba Tơ', 'ba_to', '21484', 'xã', 1996, 'hienthi', 0, 1759490174, NULL),
(21490, 51, 0, 0, 'xa_ba_vinh', 'Xã Ba Vinh', 'ba_vinh', '21490', 'xã', 1997, 'hienthi', 0, 1759490174, NULL),
(21496, 51, 0, 0, 'xa_ba_dong', 'Xã Ba Động', 'ba_dong', '21496', 'xã', 1998, 'hienthi', 0, 1759490174, NULL),
(21520, 51, 0, 0, 'xa_dang_thuy_tram', 'Xã Đặng Thùy Trâm', 'dang_thuy_tram', '21520', 'xã', 1999, 'hienthi', 0, 1759490174, NULL),
(21538, 51, 0, 0, 'xa_ba_xa', 'Xã Ba Xa', 'ba_xa', '21538', 'xã', 2000, 'hienthi', 0, 1759490174, NULL),
(21548, 51, 0, 0, 'dac_khu_ly_son', 'Đặc khu Lý Sơn', 'ly_son', '21548', 'đặc khu', 2001, 'hienthi', 0, 1759490174, NULL),
(23293, 51, 0, 0, 'phuong_kon_tum', 'Phường Kon Tum', 'kon_tum', '23293', 'phường', 2002, 'hienthi', 0, 1759490174, NULL),
(23284, 51, 0, 0, 'phuong_dak_cam', 'Phường Đăk Cấm', 'dak_cam', '23284', 'phường', 2003, 'hienthi', 0, 1759490174, NULL),
(23302, 51, 0, 0, 'phuong_dak_bla', 'Phường Đăk BLa', 'dak_bla', '23302', 'phường', 2004, 'hienthi', 0, 1759490174, NULL),
(23317, 51, 0, 0, 'xa_ngok_bay', 'Xã Ngọk Bay', 'ngok_bay', '23317', 'xã', 2005, 'hienthi', 0, 1759490174, NULL),
(23326, 51, 0, 0, 'xa_ia_chim', 'Xã Ia Chim', 'ia_chim', '23326', 'xã', 2006, 'hienthi', 0, 1759490174, NULL),
(23332, 51, 0, 0, 'xa_dak_ro_wa', 'Xã Đăk Rơ Wa', 'dak_ro_wa', '23332', 'xã', 2007, 'hienthi', 0, 1759490174, NULL),
(23504, 51, 0, 0, 'xa_dak_pxi', 'Xã Đăk Pxi', 'dak_pxi', '23504', 'xã', 2008, 'hienthi', 0, 1759490174, NULL),
(23512, 51, 0, 0, 'xa_dak_mar', 'Xã Đăk Mar', 'dak_mar', '23512', 'xã', 2009, 'hienthi', 0, 1759490174, NULL),
(23510, 51, 0, 0, 'xa_dak_ui', 'Xã Đăk Ui', 'dak_ui', '23510', 'xã', 2010, 'hienthi', 0, 1759490174, NULL),
(23515, 51, 0, 0, 'xa_ngok_reo', 'Xã Ngọk Réo', 'ngok_reo', '23515', 'xã', 2011, 'hienthi', 0, 1759490174, NULL),
(23500, 51, 0, 0, 'xa_dak_ha', 'Xã Đăk Hà', 'dak_ha', '23500', 'xã', 2012, 'hienthi', 0, 1759490174, NULL),
(23428, 51, 0, 0, 'xa_ngok_tu', 'Xã Ngọk Tụ', 'ngok_tu', '23428', 'xã', 2013, 'hienthi', 0, 1759490174, NULL),
(23401, 51, 0, 0, 'xa_dak_to', 'Xã Đăk Tô', 'dak_to', '23401', 'xã', 2014, 'hienthi', 0, 1759490174, NULL),
(23430, 51, 0, 0, 'xa_kon_dao', 'Xã Kon Đào', 'kon_dao', '23430', 'xã', 2015, 'hienthi', 0, 1759490174, NULL),
(23416, 51, 0, 0, 'xa_dak_sao', 'Xã Đăk Sao', 'dak_sao', '23416', 'xã', 2016, 'hienthi', 0, 1759490174, NULL),
(23419, 51, 0, 0, 'xa_dak_to_kan', 'Xã Đăk Tờ Kan', 'dak_to_kan', '23419', 'xã', 2017, 'hienthi', 0, 1759490174, NULL),
(23425, 51, 0, 0, 'xa_tu_mo_rong', 'Xã Tu Mơ Rông', 'tu_mo_rong', '23425', 'xã', 2018, 'hienthi', 0, 1759490174, NULL),
(23446, 51, 0, 0, 'xa_mang_ri', 'Xã Măng Ri', 'mang_ri', '23446', 'xã', 2019, 'hienthi', 0, 1759490174, NULL),
(23377, 51, 0, 0, 'xa_bo_y', 'Xã Bờ Y', 'bo_y', '23377', 'xã', 2020, 'hienthi', 0, 1759490174, NULL),
(23392, 51, 0, 0, 'xa_sa_loong', 'Xã Sa Loong', 'sa_loong', '23392', 'xã', 2021, 'hienthi', 0, 1759490174, NULL),
(23383, 51, 0, 0, 'xa_duc_nong', 'Xã Dục Nông', 'duc_nong', '23383', 'xã', 2022, 'hienthi', 0, 1759490174, NULL),
(23356, 51, 0, 0, 'xa_xop', 'Xã Xốp', 'xop', '23356', 'xã', 2023, 'hienthi', 0, 1759490174, NULL),
(23365, 51, 0, 0, 'xa_ngoc_linh', 'Xã Ngọc Linh', 'ngoc_linh', '23365', 'xã', 2024, 'hienthi', 0, 1759490174, NULL),
(23344, 51, 0, 0, 'xa_dak_plo', 'Xã Đăk Plô', 'dak_plo', '23344', 'xã', 2025, 'hienthi', 0, 1759490174, NULL),
(23341, 51, 0, 0, 'xa_dak_pek', 'Xã Đăk Pék', 'dak_pek', '23341', 'xã', 2026, 'hienthi', 0, 1759490174, NULL),
(23374, 51, 0, 0, 'xa_dak_mon', 'Xã Đăk Môn', 'dak_mon', '23374', 'xã', 2027, 'hienthi', 0, 1759490174, NULL),
(23527, 51, 0, 0, 'xa_sa_thay', 'Xã Sa Thầy', 'sa_thay', '23527', 'xã', 2028, 'hienthi', 0, 1759490174, NULL),
(23534, 51, 0, 0, 'xa_sa_binh', 'Xã Sa Bình', 'sa_binh', '23534', 'xã', 2029, 'hienthi', 0, 1759490174, NULL),
(23548, 51, 0, 0, 'xa_ya_ly', 'Xã Ya Ly', 'ya_ly', '23548', 'xã', 2030, 'hienthi', 0, 1759490174, NULL),
(23538, 51, 0, 0, 'xa_ia_toi', 'Xã Ia Tơi', 'ia_toi', '23538', 'xã', 2031, 'hienthi', 0, 1759490174, NULL),
(23485, 51, 0, 0, 'xa_dak_koi', 'Xã Đăk Kôi', 'dak_koi', '23485', 'xã', 2032, 'hienthi', 0, 1759490174, NULL),
(23497, 51, 0, 0, 'xa_kon_braih', 'Xã Kon Braih', 'kon_braih', '23497', 'xã', 2033, 'hienthi', 0, 1759490174, NULL),
(23479, 51, 0, 0, 'xa_dak_rve', 'Xã Đăk Rve', 'dak_rve', '23479', 'xã', 2034, 'hienthi', 0, 1759490174, NULL),
(23473, 51, 0, 0, 'xa_mang_den', 'Xã Măng Đen', 'mang_den', '23473', 'xã', 2035, 'hienthi', 0, 1759490174, NULL),
(23455, 51, 0, 0, 'xa_mang_but', 'Xã Măng Bút', 'mang_but', '23455', 'xã', 2036, 'hienthi', 0, 1759490174, NULL),
(23476, 51, 0, 0, 'xa_kon_plong', 'Xã Kon Plông', 'kon_plong', '23476', 'xã', 2037, 'hienthi', 0, 1759490174, NULL),
(23368, 51, 0, 0, 'xa_dak_long', 'Xã Đăk Long', 'dak_long', '23368', 'xã', 2038, 'hienthi', 0, 1759490174, NULL),
(23530, 51, 0, 0, 'xa_ro_koi', 'Xã Rờ Kơi', 'ro_koi', '23530', 'xã', 2039, 'hienthi', 0, 1759490174, NULL),
(23536, 51, 0, 0, 'xa_mo_rai', 'Xã Mô Rai', 'mo_rai', '23536', 'xã', 2040, 'hienthi', 0, 1759490174, NULL),
(23535, 51, 0, 0, 'xa_ia_dal', 'Xã Ia Đal', 'ia_dal', '23535', 'xã', 2041, 'hienthi', 0, 1759490174, NULL),
(21583, 52, 0, 0, 'phuong_quy_nhon', 'Phường Quy Nhơn', 'quy_nhon', '21583', 'phường', 2042, 'hienthi', 0, 1759490174, NULL),
(21601, 52, 0, 0, 'phuong_quy_nhon_dong', 'Phường Quy Nhơn Đông', 'quy_nhon_dong', '21601', 'phường', 2043, 'hienthi', 0, 1759490174, NULL),
(21589, 52, 0, 0, 'phuong_quy_nhon_tay', 'Phường Quy Nhơn Tây', 'quy_nhon_tay', '21589', 'phường', 2044, 'hienthi', 0, 1759490174, NULL),
(21592, 52, 0, 0, 'phuong_quy_nhon_nam', 'Phường Quy Nhơn Nam', 'quy_nhon_nam', '21592', 'phường', 2045, 'hienthi', 0, 1759490174, NULL),
(21553, 52, 0, 0, 'phuong_quy_nhon_bac', 'Phường Quy Nhơn Bắc', 'quy_nhon_bac', '21553', 'phường', 2046, 'hienthi', 0, 1759490174, NULL),
(21907, 52, 0, 0, 'phuong_binh_dinh', 'Phường Bình Định', 'binh_dinh', '21907', 'phường', 2047, 'hienthi', 0, 1759490174, NULL),
(21910, 52, 0, 0, 'phuong_an_nhon', 'Phường An Nhơn', 'an_nhon', '21910', 'phường', 2048, 'hienthi', 0, 1759490174, NULL),
(21934, 52, 0, 0, 'phuong_an_nhon_dong', 'Phường An Nhơn Đông', 'an_nhon_dong', '21934', 'phường', 2049, 'hienthi', 0, 1759490174, NULL),
(21943, 52, 0, 0, 'phuong_an_nhon_nam', 'Phường An Nhơn Nam', 'an_nhon_nam', '21943', 'phường', 2050, 'hienthi', 0, 1759490174, NULL),
(21925, 52, 0, 0, 'phuong_an_nhon_bac', 'Phường An Nhơn Bắc', 'an_nhon_bac', '21925', 'phường', 2051, 'hienthi', 0, 1759490174, NULL),
(21940, 52, 0, 0, 'xa_an_nhon_tay', 'Xã An Nhơn Tây', 'an_nhon_tay', '21940', 'xã', 2052, 'hienthi', 0, 1759490174, NULL),
(21640, 52, 0, 0, 'phuong_bong_son', 'Phường Bồng Sơn', 'bong_son', '21640', 'phường', 2053, 'hienthi', 0, 1759490174, NULL),
(21664, 52, 0, 0, 'phuong_hoai_nhon', 'Phường Hoài Nhơn', 'hoai_nhon', '21664', 'phường', 2054, 'hienthi', 0, 1759490174, NULL),
(21637, 52, 0, 0, 'phuong_tam_quan', 'Phường Tam Quan', 'tam_quan', '21637', 'phường', 2055, 'hienthi', 0, 1759490174, NULL),
(21670, 52, 0, 0, 'phuong_hoai_nhon_dong', 'Phường Hoài Nhơn Đông', 'hoai_nhon_dong', '21670', 'phường', 2056, 'hienthi', 0, 1759490174, NULL),
(21661, 52, 0, 0, 'phuong_hoai_nhon_tay', 'Phường Hoài Nhơn Tây', 'hoai_nhon_tay', '21661', 'phường', 2057, 'hienthi', 0, 1759490174, NULL),
(21673, 52, 0, 0, 'phuong_hoai_nhon_nam', 'Phường Hoài Nhơn Nam', 'hoai_nhon_nam', '21673', 'phường', 2058, 'hienthi', 0, 1759490174, NULL),
(21655, 52, 0, 0, 'phuong_hoai_nhon_bac', 'Phường Hoài Nhơn Bắc', 'hoai_nhon_bac', '21655', 'phường', 2059, 'hienthi', 0, 1759490174, NULL),
(21853, 52, 0, 0, 'xa_phu_cat', 'Xã Phù Cát', 'phu_cat', '21853', 'xã', 2060, 'hienthi', 0, 1759490174, NULL),
(21892, 52, 0, 0, 'xa_xuan_an', 'Xã Xuân An', 'xuan_an', '21892', 'xã', 2061, 'hienthi', 0, 1759490174, NULL),
(21889, 52, 0, 0, 'xa_ngo_may', 'Xã Ngô Mây', 'ngo_may', '21889', 'xã', 2062, 'hienthi', 0, 1759490174, NULL),
(21898, 52, 0, 0, 'xa_cat_tien', 'Xã Cát Tiến', 'cat_tien', '21898', 'xã', 2063, 'hienthi', 0, 1759490174, NULL),
(21862, 52, 0, 0, 'xa_de_gi', 'Xã Đề Gi', 'de_gi', '21862', 'xã', 2064, 'hienthi', 0, 1759490174, NULL),
(21871, 52, 0, 0, 'xa_hoa_hoi', 'Xã Hòa Hội', 'hoa_hoi', '21871', 'xã', 2065, 'hienthi', 0, 1759490174, NULL),
(21868, 52, 0, 0, 'xa_hoi_son', 'Xã Hội Sơn', 'hoi_son', '21868', 'xã', 2066, 'hienthi', 0, 1759490174, NULL),
(21730, 52, 0, 0, 'xa_phu_my', 'Xã Phù Mỹ', 'phu_my', '21730', 'xã', 2067, 'hienthi', 0, 1759490174, NULL),
(21769, 52, 0, 0, 'xa_an_luong', 'Xã An Lương', 'an_luong', '21769', 'xã', 2068, 'hienthi', 0, 1759490174, NULL),
(21733, 52, 0, 0, 'xa_binh_duong', 'Xã Bình Dương', 'binh_duong', '21733', 'xã', 2069, 'hienthi', 0, 1759490174, NULL),
(21751, 52, 0, 0, 'xa_phu_my_dong', 'Xã Phù Mỹ Đông', 'phu_my_dong', '21751', 'xã', 2070, 'hienthi', 0, 1759490174, NULL),
(21757, 52, 0, 0, 'xa_phu_my_tay', 'Xã Phù Mỹ Tây', 'phu_my_tay', '21757', 'xã', 2071, 'hienthi', 0, 1759490174, NULL),
(21775, 52, 0, 0, 'xa_phu_my_nam', 'Xã Phù Mỹ Nam', 'phu_my_nam', '21775', 'xã', 2072, 'hienthi', 0, 1759490174, NULL),
(21739, 52, 0, 0, 'xa_phu_my_bac', 'Xã Phù Mỹ Bắc', 'phu_my_bac', '21739', 'xã', 2073, 'hienthi', 0, 1759490174, NULL),
(21952, 52, 0, 0, 'xa_tuy_phuoc', 'Xã Tuy Phước', 'tuy_phuoc', '21952', 'xã', 2074, 'hienthi', 0, 1759490174, NULL),
(21970, 52, 0, 0, 'xa_tuy_phuoc_dong', 'Xã Tuy Phước Đông', 'tuy_phuoc_dong', '21970', 'xã', 2075, 'hienthi', 0, 1759490174, NULL),
(21985, 52, 0, 0, 'xa_tuy_phuoc_tay', 'Xã Tuy Phước Tây', 'tuy_phuoc_tay', '21985', 'xã', 2076, 'hienthi', 0, 1759490174, NULL),
(21964, 52, 0, 0, 'xa_tuy_phuoc_bac', 'Xã Tuy Phước Bắc', 'tuy_phuoc_bac', '21964', 'xã', 2077, 'hienthi', 0, 1759490174, NULL),
(21808, 52, 0, 0, 'xa_tay_son', 'Xã Tây Sơn', 'tay_son', '21808', 'xã', 2078, 'hienthi', 0, 1759490174, NULL),
(21820, 52, 0, 0, 'xa_binh_khe', 'Xã Bình Khê', 'binh_khe', '21820', 'xã', 2079, 'hienthi', 0, 1759490174, NULL),
(21835, 52, 0, 0, 'xa_binh_phu', 'Xã Bình Phú', 'binh_phu', '21835', 'xã', 2080, 'hienthi', 0, 1759490174, NULL),
(21817, 52, 0, 0, 'xa_binh_hiep', 'Xã Bình Hiệp', 'binh_hiep', '21817', 'xã', 2081, 'hienthi', 0, 1759490174, NULL),
(21829, 52, 0, 0, 'xa_binh_an', 'Xã Bình An', 'binh_an', '21829', 'xã', 2082, 'hienthi', 0, 1759490174, NULL),
(21688, 52, 0, 0, 'xa_hoai_an', 'Xã Hoài Ân', 'hoai_an', '21688', 'xã', 2083, 'hienthi', 0, 1759490174, NULL),
(21715, 52, 0, 0, 'xa_an_tuong', 'Xã Ân Tường', 'an_tuong', '21715', 'xã', 2084, 'hienthi', 0, 1759490174, NULL),
(21727, 52, 0, 0, 'xa_kim_son', 'Xã Kim Sơn', 'kim_son', '21727', 'xã', 2085, 'hienthi', 0, 1759490174, NULL),
(21703, 52, 0, 0, 'xa_van_duc', 'Xã Vạn Đức', 'van_duc', '21703', 'xã', 2086, 'hienthi', 0, 1759490174, NULL),
(21697, 52, 0, 0, 'xa_an_hao', 'Xã Ân Hảo', 'an_hao', '21697', 'xã', 2087, 'hienthi', 0, 1759490174, NULL),
(21994, 52, 0, 0, 'xa_van_canh', 'Xã Vân Canh', 'van_canh', '21994', 'xã', 2088, 'hienthi', 0, 1759490174, NULL),
(22003, 52, 0, 0, 'xa_canh_vinh', 'Xã Canh Vinh', 'canh_vinh', '22003', 'xã', 2089, 'hienthi', 0, 1759490174, NULL),
(21997, 52, 0, 0, 'xa_canh_lien', 'Xã Canh Liên', 'canh_lien', '21997', 'xã', 2090, 'hienthi', 0, 1759490174, NULL),
(21786, 52, 0, 0, 'xa_vinh_thanh', 'Xã Vĩnh Thạnh', 'vinh_thanh', '21786', 'xã', 2091, 'hienthi', 0, 1759490174, NULL),
(21796, 52, 0, 0, 'xa_vinh_thinh', 'Xã Vĩnh Thịnh', 'vinh_thinh', '21796', 'xã', 2092, 'hienthi', 0, 1759490174, NULL),
(21805, 52, 0, 0, 'xa_vinh_quang', 'Xã Vĩnh Quang', 'vinh_quang', '21805', 'xã', 2093, 'hienthi', 0, 1759490174, NULL),
(21787, 52, 0, 0, 'xa_vinh_son', 'Xã Vĩnh Sơn', 'vinh_son', '21787', 'xã', 2094, 'hienthi', 0, 1759490174, NULL),
(21628, 52, 0, 0, 'xa_an_hoa', 'Xã An Hòa', 'an_hoa', '21628', 'xã', 2095, 'hienthi', 0, 1759490174, NULL),
(21609, 52, 0, 0, 'xa_an_lao', 'Xã An Lão', 'an_lao', '21609', 'xã', 2096, 'hienthi', 0, 1759490174, NULL),
(21616, 52, 0, 0, 'xa_an_vinh', 'Xã An Vinh', 'an_vinh', '21616', 'xã', 2097, 'hienthi', 0, 1759490174, NULL),
(21622, 52, 0, 0, 'xa_an_toan', 'Xã An Toàn', 'an_toan', '21622', 'xã', 2098, 'hienthi', 0, 1759490174, NULL),
(23575, 52, 0, 0, 'phuong_pleiku', 'Phường Pleiku', 'pleiku', '23575', 'phường', 2099, 'hienthi', 0, 1759490174, NULL),
(23586, 52, 0, 0, 'phuong_hoi_phu', 'Phường Hội Phú', 'hoi_phu', '23586', 'phường', 2100, 'hienthi', 0, 1759490174, NULL),
(23584, 52, 0, 0, 'phuong_thong_nhat', 'Phường Thống Nhất', 'thong_nhat', '23584', 'phường', 2101, 'hienthi', 0, 1759490174, NULL),
(23563, 52, 0, 0, 'phuong_dien_hong', 'Phường Diên Hồng', 'dien_hong', '23563', 'phường', 2102, 'hienthi', 0, 1759490174, NULL),
(23602, 52, 0, 0, 'phuong_an_phu', 'Phường An Phú', 'an_phu', '23602', 'phường', 2103, 'hienthi', 0, 1759490174, NULL),
(23590, 52, 0, 0, 'xa_bien_ho', 'Xã Biển Hồ', 'bien_ho', '23590', 'xã', 2104, 'hienthi', 0, 1759490174, NULL),
(23611, 52, 0, 0, 'xa_gao', 'Xã Gào', 'gao', '23611', 'xã', 2105, 'hienthi', 0, 1759490174, NULL),
(23734, 52, 0, 0, 'xa_ia_ly', 'Xã Ia Ly', 'ia_ly', '23734', 'xã', 2106, 'hienthi', 0, 1759490174, NULL),
(23722, 52, 0, 0, 'xa_chu_pah', 'Xã Chư Păh', 'chu_pah', '23722', 'xã', 2107, 'hienthi', 0, 1759490174, NULL),
(23728, 52, 0, 0, 'xa_ia_khuol', 'Xã Ia Khươl', 'ia_khuol', '23728', 'xã', 2108, 'hienthi', 0, 1759490174, NULL),
(23749, 52, 0, 0, 'xa_ia_phi', 'Xã Ia Phí', 'ia_phi', '23749', 'xã', 2109, 'hienthi', 0, 1759490174, NULL),
(23887, 52, 0, 0, 'xa_chu_prong', 'Xã Chư Prông', 'chu_prong', '23887', 'xã', 2110, 'hienthi', 0, 1759490174, NULL),
(23896, 52, 0, 0, 'xa_bau_can', 'Xã Bàu Cạn', 'bau_can', '23896', 'xã', 2111, 'hienthi', 0, 1759490174, NULL),
(23911, 52, 0, 0, 'xa_ia_boong', 'Xã Ia Boòng', 'ia_boong', '23911', 'xã', 2112, 'hienthi', 0, 1759490174, NULL),
(23935, 52, 0, 0, 'xa_ia_lau', 'Xã Ia Lâu', 'ia_lau', '23935', 'xã', 2113, 'hienthi', 0, 1759490174, NULL),
(23926, 52, 0, 0, 'xa_ia_pia', 'Xã Ia Pia', 'ia_pia', '23926', 'xã', 2114, 'hienthi', 0, 1759490174, NULL),
(23908, 52, 0, 0, 'xa_ia_tor', 'Xã Ia Tôr', 'ia_tor', '23908', 'xã', 2115, 'hienthi', 0, 1759490174, NULL),
(23941, 52, 0, 0, 'xa_chu_se', 'Xã Chư Sê', 'chu_se', '23941', 'xã', 2116, 'hienthi', 0, 1759490174, NULL),
(23947, 52, 0, 0, 'xa_bo_ngoong', 'Xã Bờ Ngoong', 'bo_ngoong', '23947', 'xã', 2117, 'hienthi', 0, 1759490174, NULL),
(23977, 52, 0, 0, 'xa_ia_ko', 'Xã Ia Ko', 'ia_ko', '23977', 'xã', 2118, 'hienthi', 0, 1759490174, NULL),
(23954, 52, 0, 0, 'xa_alba', 'Xã Albá', 'alba', '23954', 'xã', 2119, 'hienthi', 0, 1759490174, NULL),
(23942, 52, 0, 0, 'xa_chu_puh', 'Xã Chư Pưh', 'chu_puh', '23942', 'xã', 2120, 'hienthi', 0, 1759490174, NULL),
(23986, 52, 0, 0, 'xa_ia_le', 'Xã Ia Le', 'ia_le', '23986', 'xã', 2121, 'hienthi', 0, 1759490174, NULL),
(23971, 52, 0, 0, 'xa_ia_hru', 'Xã Ia Hrú', 'ia_hru', '23971', 'xã', 2122, 'hienthi', 0, 1759490174, NULL),
(23617, 52, 0, 0, 'phuong_an_khe', 'Phường An Khê', 'an_khe', '23617', 'phường', 2123, 'hienthi', 0, 1759490174, NULL),
(23614, 52, 0, 0, 'phuong_an_binh', 'Phường An Bình', 'an_binh', '23614', 'phường', 2124, 'hienthi', 0, 1759490174, NULL),
(23629, 52, 0, 0, 'xa_cuu_an', 'Xã Cửu An', 'cuu_an', '23629', 'xã', 2125, 'hienthi', 0, 1759490174, NULL),
(23995, 52, 0, 0, 'xa_dak_po', 'Xã Đak Pơ', 'dak_po', '23995', 'xã', 2126, 'hienthi', 0, 1759490174, NULL),
(24007, 52, 0, 0, 'xa_ya_hoi', 'Xã Ya Hội', 'ya_hoi', '24007', 'xã', 2127, 'hienthi', 0, 1759490174, NULL),
(23638, 52, 0, 0, 'xa_kbang', 'Xã Kbang', 'kbang', '23638', 'xã', 2128, 'hienthi', 0, 1759490174, NULL),
(23674, 52, 0, 0, 'xa_kong_bo_la', 'Xã Kông Bơ La', 'kong_bo_la', '23674', 'xã', 2129, 'hienthi', 0, 1759490174, NULL),
(23668, 52, 0, 0, 'xa_to_tung', 'Xã Tơ Tung', 'to_tung', '23668', 'xã', 2130, 'hienthi', 0, 1759490174, NULL),
(23647, 52, 0, 0, 'xa_son_lang', 'Xã Sơn Lang', 'son_lang', '23647', 'xã', 2131, 'hienthi', 0, 1759490174, NULL),
(23644, 52, 0, 0, 'xa_dak_rong', 'Xã Đak Rong', 'dak_rong', '23644', 'xã', 2132, 'hienthi', 0, 1759490174, NULL),
(23824, 52, 0, 0, 'xa_kong_chro', 'Xã Kông Chro', 'kong_chro', '23824', 'xã', 2133, 'hienthi', 0, 1759490174, NULL),
(23833, 52, 0, 0, 'xa_ya_ma', 'Xã Ya Ma', 'ya_ma', '23833', 'xã', 2134, 'hienthi', 0, 1759490174, NULL),
(23830, 52, 0, 0, 'xa_chu_krey', 'Xã Chư Krey', 'chu_krey', '23830', 'xã', 2135, 'hienthi', 0, 1759490174, NULL),
(23839, 52, 0, 0, 'xa_sro', 'Xã SRó', 'sro', '23839', 'xã', 2136, 'hienthi', 0, 1759490174, NULL),
(23842, 52, 0, 0, 'xa_dak_song', 'Xã Đăk Song', 'dak_song', '23842', 'xã', 2137, 'hienthi', 0, 1759490174, NULL),
(23851, 52, 0, 0, 'xa_cho_long', 'Xã Chơ Long', 'cho_long', '23851', 'xã', 2138, 'hienthi', 0, 1759490174, NULL),
(24044, 52, 0, 0, 'phuong_ayun_pa', 'Phường Ayun Pa', 'ayun_pa', '24044', 'phường', 2139, 'hienthi', 0, 1759490174, NULL),
(24065, 52, 0, 0, 'xa_ia_rbol', 'Xã Ia Rbol', 'ia_rbol', '24065', 'xã', 2140, 'hienthi', 0, 1759490174, NULL),
(24073, 52, 0, 0, 'xa_ia_sao', 'Xã Ia Sao', 'ia_sao', '24073', 'xã', 2141, 'hienthi', 0, 1759490174, NULL),
(24043, 52, 0, 0, 'xa_phu_thien', 'Xã Phú Thiện', 'phu_thien', '24043', 'xã', 2142, 'hienthi', 0, 1759490174, NULL),
(24049, 52, 0, 0, 'xa_chu_a_thai', 'Xã Chư A Thai', 'chu_a_thai', '24049', 'xã', 2143, 'hienthi', 0, 1759490174, NULL),
(24061, 52, 0, 0, 'xa_ia_hiao', 'Xã Ia Hiao', 'ia_hiao', '24061', 'xã', 2144, 'hienthi', 0, 1759490174, NULL),
(24013, 52, 0, 0, 'xa_po_to', 'Xã Pờ Tó', 'po_to', '24013', 'xã', 2145, 'hienthi', 0, 1759490174, NULL),
(24022, 52, 0, 0, 'xa_ia_pa', 'Xã Ia Pa', 'ia_pa', '24022', 'xã', 2146, 'hienthi', 0, 1759490174, NULL),
(24028, 52, 0, 0, 'xa_ia_tul', 'Xã Ia Tul', 'ia_tul', '24028', 'xã', 2147, 'hienthi', 0, 1759490174, NULL),
(24076, 52, 0, 0, 'xa_phu_tuc', 'Xã Phú Túc', 'phu_tuc', '24076', 'xã', 2148, 'hienthi', 0, 1759490174, NULL),
(24100, 52, 0, 0, 'xa_ia_dreh', 'Xã Ia Dreh', 'ia_dreh', '24100', 'xã', 2149, 'hienthi', 0, 1759490174, NULL),
(24112, 52, 0, 0, 'xa_ia_rsai', 'Xã Ia Rsai', 'ia_rsai', '24112', 'xã', 2150, 'hienthi', 0, 1759490174, NULL),
(24109, 52, 0, 0, 'xa_uar', 'Xã Uar', 'uar', '24109', 'xã', 2151, 'hienthi', 0, 1759490174, NULL),
(23677, 52, 0, 0, 'xa_dak_doa', 'Xã Đak Đoa', 'dak_doa', '23677', 'xã', 2152, 'hienthi', 0, 1759490174, NULL),
(23701, 52, 0, 0, 'xa_kon_gang', 'Xã Kon Gang', 'kon_gang', '23701', 'xã', 2153, 'hienthi', 0, 1759490174, NULL),
(23710, 52, 0, 0, 'xa_ia_bang', 'Xã Ia Băng', 'ia_bang', '23710', 'xã', 2154, 'hienthi', 0, 1759490174, NULL),
(23714, 52, 0, 0, 'xa_kdang', 'Xã KDang', 'kdang', '23714', 'xã', 2155, 'hienthi', 0, 1759490174, NULL),
(23683, 52, 0, 0, 'xa_dak_somei', 'Xã Đak Sơmei', 'dak_somei', '23683', 'xã', 2156, 'hienthi', 0, 1759490174, NULL),
(23794, 52, 0, 0, 'xa_mang_yang', 'Xã Mang Yang', 'mang_yang', '23794', 'xã', 2157, 'hienthi', 0, 1759490174, NULL),
(23812, 52, 0, 0, 'xa_lo_pang', 'Xã Lơ Pang', 'lo_pang', '23812', 'xã', 2158, 'hienthi', 0, 1759490174, NULL),
(23818, 52, 0, 0, 'xa_kon_chieng', 'Xã Kon Chiêng', 'kon_chieng', '23818', 'xã', 2159, 'hienthi', 0, 1759490174, NULL),
(23799, 52, 0, 0, 'xa_hra', 'Xã Hra', 'hra', '23799', 'xã', 2160, 'hienthi', 0, 1759490174, NULL),
(23798, 52, 0, 0, 'xa_ayun', 'Xã Ayun', 'ayun', '23798', 'xã', 2161, 'hienthi', 0, 1759490174, NULL),
(23764, 52, 0, 0, 'xa_ia_grai', 'Xã Ia Grai', 'ia_grai', '23764', 'xã', 2162, 'hienthi', 0, 1759490174, NULL),
(23776, 52, 0, 0, 'xa_ia_krai', 'Xã Ia Krái', 'ia_krai', '23776', 'xã', 2163, 'hienthi', 0, 1759490174, NULL),
(23767, 52, 0, 0, 'xa_ia_hrung', 'Xã Ia Hrung', 'ia_hrung', '23767', 'xã', 2164, 'hienthi', 0, 1759490174, NULL),
(23857, 52, 0, 0, 'xa_duc_co', 'Xã Đức Cơ', 'duc_co', '23857', 'xã', 2165, 'hienthi', 0, 1759490174, NULL),
(23869, 52, 0, 0, 'xa_ia_dok', 'Xã Ia Dơk', 'ia_dok', '23869', 'xã', 2166, 'hienthi', 0, 1759490174, NULL),
(23866, 52, 0, 0, 'xa_ia_krel', 'Xã Ia Krêl', 'ia_krel', '23866', 'xã', 2167, 'hienthi', 0, 1759490174, NULL),
(21607, 52, 0, 0, 'xa_nhon_chau', 'Xã Nhơn Châu', 'nhon_chau', '21607', 'xã', 2168, 'hienthi', 0, 1759490174, NULL),
(23917, 52, 0, 0, 'xa_ia_puch', 'Xã Ia Púch', 'ia_puch', '23917', 'xã', 2169, 'hienthi', 0, 1759490174, NULL),
(23737, 52, 0, 0, 'xa_ia_mo', 'Xã Ia Mơ', 'ia_mo', '23737', 'xã', 2170, 'hienthi', 0, 1759490174, NULL),
(23881, 52, 0, 0, 'xa_ia_pnon', 'Xã Ia Pnôn', 'ia_pnon', '23881', 'xã', 2171, 'hienthi', 0, 1759490174, NULL),
(23884, 52, 0, 0, 'xa_ia_nan', 'Xã Ia Nan', 'ia_nan', '23884', 'xã', 2172, 'hienthi', 0, 1759490174, NULL),
(23872, 52, 0, 0, 'xa_ia_dom', 'Xã Ia Dom', 'ia_dom', '23872', 'xã', 2173, 'hienthi', 0, 1759490174, NULL),
(23788, 52, 0, 0, 'xa_ia_chia', 'Xã Ia Chia', 'ia_chia', '23788', 'xã', 2174, 'hienthi', 0, 1759490174, NULL),
(23782, 52, 0, 0, 'xa_ia_o', 'Xã Ia O', 'ia_o', '23782', 'xã', 2175, 'hienthi', 0, 1759490174, NULL),
(23650, 52, 0, 0, 'xa_krong', 'Xã Krong', 'krong', '23650', 'xã', 2176, 'hienthi', 0, 1759490174, NULL),
(22366, 56, 0, 0, 'phuong_nha_trang', 'Phường Nha Trang', 'nha_trang', '22366', 'phường', 2177, 'hienthi', 0, 1759490174, NULL),
(22333, 56, 0, 0, 'phuong_bac_nha_trang', 'Phường Bắc Nha Trang', 'bac_nha_trang', '22333', 'phường', 2178, 'hienthi', 0, 1759490174, NULL),
(22390, 56, 0, 0, 'phuong_tay_nha_trang', 'Phường Tây Nha Trang', 'tay_nha_trang', '22390', 'phường', 2179, 'hienthi', 0, 1759490174, NULL),
(22402, 56, 0, 0, 'phuong_nam_nha_trang', 'Phường Nam Nha Trang', 'nam_nha_trang', '22402', 'phường', 2180, 'hienthi', 0, 1759490174, NULL),
(22408, 56, 0, 0, 'phuong_bac_cam_ranh', 'Phường Bắc Cam Ranh', 'bac_cam_ranh', '22408', 'phường', 2181, 'hienthi', 0, 1759490174, NULL),
(22420, 56, 0, 0, 'phuong_cam_ranh', 'Phường Cam Ranh', 'cam_ranh', '22420', 'phường', 2182, 'hienthi', 0, 1759490174, NULL),
(22432, 56, 0, 0, 'phuong_cam_linh', 'Phường Cam Linh', 'cam_linh', '22432', 'phường', 2183, 'hienthi', 0, 1759490174, NULL),
(22423, 56, 0, 0, 'phuong_ba_ngoi', 'Phường Ba Ngòi', 'ba_ngoi', '22423', 'phường', 2184, 'hienthi', 0, 1759490174, NULL),
(22480, 56, 0, 0, 'xa_nam_cam_ranh', 'Xã Nam Cam Ranh', 'nam_cam_ranh', '22480', 'xã', 2185, 'hienthi', 0, 1759490174, NULL),
(22546, 56, 0, 0, 'xa_bac_ninh_hoa', 'Xã Bắc Ninh Hòa', 'bac_ninh_hoa', '22546', 'xã', 2186, 'hienthi', 0, 1759490174, NULL),
(22528, 56, 0, 0, 'phuong_ninh_hoa', 'Phường Ninh Hòa', 'ninh_hoa', '22528', 'phường', 2187, 'hienthi', 0, 1759490174, NULL);
INSERT INTO `table_ward` (`id`, `id_city`, `id_district`, `districtid`, `wardcode`, `name`, `slug`, `code`, `level`, `numb`, `status`, `date_updated`, `date_created`, `ship_price`) VALUES
(22576, 56, 0, 0, 'xa_tan_dinh', 'Xã Tân Định', 'tan_dinh', '22576', 'xã', 2188, 'hienthi', 0, 1759490174, NULL),
(22561, 56, 0, 0, 'phuong_dong_ninh_hoa', 'Phường Đông Ninh Hòa', 'dong_ninh_hoa', '22561', 'xã', 2189, 'hienthi', 0, 1759490174, NULL),
(22591, 56, 0, 0, 'phuong_hoa_thang', 'Phường Hòa Thắng', 'hoa_thang', '22591', 'xã', 2190, 'hienthi', 0, 1759490174, NULL),
(22597, 56, 0, 0, 'xa_nam_ninh_hoa', 'Xã Nam Ninh Hòa', 'nam_ninh_hoa', '22597', 'xã', 2191, 'hienthi', 0, 1759490174, NULL),
(22552, 56, 0, 0, 'xa_tay_ninh_hoa', 'Xã Tây Ninh Hòa', 'tay_ninh_hoa', '22552', 'xã', 2192, 'hienthi', 0, 1759490174, NULL),
(22558, 56, 0, 0, 'xa_hoa_tri', 'Xã Hòa Trí', 'hoa_tri', '22558', 'xã', 2193, 'hienthi', 0, 1759490174, NULL),
(22504, 56, 0, 0, 'xa_dai_lanh', 'Xã Đại Lãnh', 'dai_lanh', '22504', 'xã', 2194, 'hienthi', 0, 1759490174, NULL),
(22498, 56, 0, 0, 'xa_tu_bong', 'Xã Tu Bông', 'tu_bong', '22498', 'xã', 2195, 'hienthi', 0, 1759490174, NULL),
(22516, 56, 0, 0, 'xa_van_thang', 'Xã Vạn Thắng', 'van_thang', '22516', 'xã', 2196, 'hienthi', 0, 1759490174, NULL),
(22489, 56, 0, 0, 'xa_van_ninh', 'Xã Vạn Ninh', 'van_ninh', '22489', 'xã', 2197, 'hienthi', 0, 1759490174, NULL),
(22525, 56, 0, 0, 'xa_van_hung', 'Xã Vạn Hưng', 'van_hung', '22525', 'xã', 2198, 'hienthi', 0, 1759490174, NULL),
(22651, 56, 0, 0, 'xa_dien_khanh', 'Xã Diên Khánh', 'dien_khanh', '22651', 'xã', 2199, 'hienthi', 0, 1759490174, NULL),
(22678, 56, 0, 0, 'xa_dien_lac', 'Xã Diên Lạc', 'dien_lac', '22678', 'xã', 2200, 'hienthi', 0, 1759490174, NULL),
(22657, 56, 0, 0, 'xa_dien_dien', 'Xã Diên Điền', 'dien_dien', '22657', 'xã', 2201, 'hienthi', 0, 1759490174, NULL),
(22660, 56, 0, 0, 'xa_dien_lam', 'Xã Diên Lâm', 'dien_lam', '22660', 'xã', 2202, 'hienthi', 0, 1759490174, NULL),
(22672, 56, 0, 0, 'xa_dien_tho', 'Xã Diên Thọ', 'dien_tho', '22672', 'xã', 2203, 'hienthi', 0, 1759490174, NULL),
(22702, 56, 0, 0, 'xa_suoi_hiep', 'Xã Suối Hiệp', 'suoi_hiep', '22702', 'xã', 2204, 'hienthi', 0, 1759490174, NULL),
(22453, 56, 0, 0, 'xa_cam_lam', 'Xã Cam Lâm', 'cam_lam', '22453', 'xã', 2205, 'hienthi', 0, 1759490174, NULL),
(22708, 56, 0, 0, 'xa_suoi_dau', 'Xã Suối Dầu', 'suoi_dau', '22708', 'xã', 2206, 'hienthi', 0, 1759490174, NULL),
(22435, 56, 0, 0, 'xa_cam_hiep', 'Xã Cam Hiệp', 'cam_hiep', '22435', 'xã', 2207, 'hienthi', 0, 1759490174, NULL),
(22465, 56, 0, 0, 'xa_cam_an', 'Xã Cam An', 'cam_an', '22465', 'xã', 2208, 'hienthi', 0, 1759490174, NULL),
(22615, 56, 0, 0, 'xa_bac_khanh_vinh', 'Xã Bắc Khánh Vĩnh', 'bac_khanh_vinh', '22615', 'xã', 2209, 'hienthi', 0, 1759490174, NULL),
(22612, 56, 0, 0, 'xa_trung_khanh_vinh', 'Xã Trung Khánh Vĩnh', 'trung_khanh_vinh', '22612', 'xã', 2210, 'hienthi', 0, 1759490174, NULL),
(22624, 56, 0, 0, 'xa_tay_khanh_vinh', 'Xã Tây Khánh Vĩnh', 'tay_khanh_vinh', '22624', 'xã', 2211, 'hienthi', 0, 1759490174, NULL),
(22648, 56, 0, 0, 'xa_nam_khanh_vinh', 'Xã Nam Khánh Vĩnh', 'nam_khanh_vinh', '22648', 'xã', 2212, 'hienthi', 0, 1759490174, NULL),
(22609, 56, 0, 0, 'xa_khanh_vinh', 'Xã Khánh Vĩnh', 'khanh_vinh', '22609', 'xã', 2213, 'hienthi', 0, 1759490174, NULL),
(22714, 56, 0, 0, 'xa_khanh_son', 'Xã Khánh Sơn', 'khanh_son', '22714', 'xã', 2214, 'hienthi', 0, 1759490174, NULL),
(22720, 56, 0, 0, 'xa_tay_khanh_son', 'Xã Tây Khánh Sơn', 'tay_khanh_son', '22720', 'xã', 2215, 'hienthi', 0, 1759490174, NULL),
(22732, 56, 0, 0, 'xa_dong_khanh_son', 'Xã Đông Khánh Sơn', 'dong_khanh_son', '22732', 'xã', 2216, 'hienthi', 0, 1759490174, NULL),
(22736, 56, 0, 0, 'dac_khu_truong_sa', 'Đặc khu Trường Sa', 'truong_sa', '22736', 'đặc khu', 2217, 'hienthi', 0, 1759490174, NULL),
(22759, 56, 0, 0, 'phuong_phan_rang', 'Phường Phan Rang', 'phan_rang', '22759', 'phường', 2218, 'hienthi', 0, 1759490174, NULL),
(22779, 56, 0, 0, 'phuong_dong_hai', 'Phường Đông Hải', 'dong_hai', '22779', 'phường', 2219, 'hienthi', 0, 1759490174, NULL),
(22834, 56, 0, 0, 'phuong_ninh_chu', 'Phường Ninh Chử', 'ninh_chu', '22834', 'phường', 2220, 'hienthi', 0, 1759490174, NULL),
(22741, 56, 0, 0, 'phuong_bao_an', 'Phường Bảo An', 'bao_an', '22741', 'phường', 2221, 'hienthi', 0, 1759490174, NULL),
(22738, 56, 0, 0, 'phuong_do_vinh', 'Phường Đô Vinh', 'do_vinh', '22738', 'phường', 2222, 'hienthi', 0, 1759490174, NULL),
(22870, 56, 0, 0, 'xa_ninh_phuoc', 'Xã Ninh Phước', 'ninh_phuoc', '22870', 'xã', 2223, 'hienthi', 0, 1759490174, NULL),
(22891, 56, 0, 0, 'xa_phuoc_huu', 'Xã Phước Hữu', 'phuoc_huu', '22891', 'xã', 2224, 'hienthi', 0, 1759490174, NULL),
(22873, 56, 0, 0, 'xa_phuoc_hau', 'Xã Phước Hậu', 'phuoc_hau', '22873', 'xã', 2225, 'hienthi', 0, 1759490174, NULL),
(22897, 56, 0, 0, 'xa_thuan_nam', 'Xã Thuận Nam', 'thuan_nam', '22897', 'xã', 2226, 'hienthi', 0, 1759490174, NULL),
(22910, 56, 0, 0, 'xa_ca_na', 'Xã Cà Ná', 'ca_na', '22910', 'xã', 2227, 'hienthi', 0, 1759490174, NULL),
(22885, 56, 0, 0, 'xa_phuoc_ha', 'Xã Phước Hà', 'phuoc_ha', '22885', 'xã', 2228, 'hienthi', 0, 1759490174, NULL),
(22903, 56, 0, 0, 'xa_phuoc_dinh', 'Xã Phước Dinh', 'phuoc_dinh', '22903', 'xã', 2229, 'hienthi', 0, 1759490174, NULL),
(22852, 56, 0, 0, 'xa_ninh_hai', 'Xã Ninh Hải', 'ninh_hai', '22852', 'xã', 2230, 'hienthi', 0, 1759490174, NULL),
(22858, 56, 0, 0, 'xa_xuan_hai', 'Xã Xuân Hải', 'xuan_hai', '22858', 'xã', 2231, 'hienthi', 0, 1759490174, NULL),
(22868, 56, 0, 0, 'xa_vinh_hai', 'Xã Vĩnh Hải', 'vinh_hai', '22868', 'xã', 2232, 'hienthi', 0, 1759490174, NULL),
(22849, 56, 0, 0, 'xa_thuan_bac', 'Xã Thuận Bắc', 'thuan_bac', '22849', 'xã', 2233, 'hienthi', 0, 1759490174, NULL),
(22840, 56, 0, 0, 'xa_cong_hai', 'Xã Công Hải', 'cong_hai', '22840', 'xã', 2234, 'hienthi', 0, 1759490174, NULL),
(22810, 56, 0, 0, 'xa_ninh_son', 'Xã Ninh Sơn', 'ninh_son', '22810', 'xã', 2235, 'hienthi', 0, 1759490174, NULL),
(22813, 56, 0, 0, 'xa_lam_son', 'Xã Lâm Sơn', 'lam_son', '22813', 'xã', 2236, 'hienthi', 0, 1759490174, NULL),
(22828, 56, 0, 0, 'xa_anh_dung', 'Xã Anh Dũng', 'anh_dung', '22828', 'xã', 2237, 'hienthi', 0, 1759490174, NULL),
(22822, 56, 0, 0, 'xa_my_son', 'Xã Mỹ Sơn', 'my_son', '22822', 'xã', 2238, 'hienthi', 0, 1759490174, NULL),
(22801, 56, 0, 0, 'xa_bac_ai_dong', 'Xã Bác Ái Đông', 'bac_ai_dong', '22801', 'xã', 2239, 'hienthi', 0, 1759490174, NULL),
(22795, 56, 0, 0, 'xa_bac_ai', 'Xã Bác Ái', 'bac_ai', '22795', 'xã', 2240, 'hienthi', 0, 1759490174, NULL),
(22786, 56, 0, 0, 'xa_bac_ai_tay', 'Xã Bác Ái Tây', 'bac_ai_tay', '22786', 'xã', 2241, 'hienthi', 0, 1759490174, NULL),
(24175, 66, 0, 0, 'xa_hoa_phu', 'Xã Hòa Phú', 'hoa_phu', '24175', 'xã', 2242, 'hienthi', 0, 1759490174, NULL),
(24133, 66, 0, 0, 'phuong_buon_ma_thuot', 'Phường  Buôn Ma Thuột', 'buon_ma_thuot', '24133', 'phường', 2243, 'hienthi', 0, 1759490174, NULL),
(24163, 66, 0, 0, 'phuong_tan_an', 'Phường  Tân An', 'tan_an', '24163', 'phường', 2244, 'hienthi', 0, 1759490174, NULL),
(24121, 66, 0, 0, 'phuong_tan_lap', 'Phường  Tân Lập', 'tan_lap', '24121', 'phường', 2245, 'hienthi', 0, 1759490174, NULL),
(24154, 66, 0, 0, 'phuong_thanh_nhat', 'Phường  Thành Nhất', 'thanh_nhat', '24154', 'phường', 2246, 'hienthi', 0, 1759490174, NULL),
(24169, 66, 0, 0, 'phuong_ea_kao', 'Phường Ea Kao', 'ea_kao', '24169', 'phường', 2247, 'hienthi', 0, 1759490174, NULL),
(24328, 66, 0, 0, 'xa_ea_drong', 'Xã Ea Drông', 'ea_drong', '24328', 'xã', 2248, 'hienthi', 0, 1759490174, NULL),
(24305, 66, 0, 0, 'phuong_buon_ho', 'Phường Buôn Hồ', 'buon_ho', '24305', 'phường', 2249, 'hienthi', 0, 1759490174, NULL),
(24340, 66, 0, 0, 'phuong_cu_bao', 'Phường Cư Bao', 'cu_bao', '24340', 'phường', 2250, 'hienthi', 0, 1759490174, NULL),
(24211, 66, 0, 0, 'xa_ea_sup', 'Xã Ea Súp', 'ea_sup', '24211', 'xã', 2251, 'hienthi', 0, 1759490174, NULL),
(24217, 66, 0, 0, 'xa_ea_rok', 'Xã Ea Rốk', 'ea_rok', '24217', 'xã', 2252, 'hienthi', 0, 1759490174, NULL),
(24229, 66, 0, 0, 'xa_ea_bung', 'Xã Ea Bung', 'ea_bung', '24229', 'xã', 2253, 'hienthi', 0, 1759490174, NULL),
(24221, 66, 0, 0, 'xa_ia_rve', 'Xã Ia Rvê', 'ia_rve', '24221', 'xã', 2254, 'hienthi', 0, 1759490174, NULL),
(24214, 66, 0, 0, 'xa_ia_lop', 'Xã Ia Lốp', 'ia_lop', '24214', 'xã', 2255, 'hienthi', 0, 1759490174, NULL),
(24241, 66, 0, 0, 'xa_ea_wer', 'Xã Ea Wer', 'ea_wer', '24241', 'xã', 2256, 'hienthi', 0, 1759490174, NULL),
(24250, 66, 0, 0, 'xa_ea_nuol', 'Xã Ea Nuôl', 'ea_nuol', '24250', 'xã', 2257, 'hienthi', 0, 1759490174, NULL),
(24235, 66, 0, 0, 'xa_buon_don', 'Xã Buôn Đôn', 'buon_don', '24235', 'xã', 2258, 'hienthi', 0, 1759490174, NULL),
(24265, 66, 0, 0, 'xa_ea_kiet', 'Xã Ea Kiết', 'ea_kiet', '24265', 'xã', 2259, 'hienthi', 0, 1759490174, NULL),
(24286, 66, 0, 0, 'xa_ea_mdroh', 'Xã Ea M’Droh', 'ea_mdroh', '24286', 'xã', 2260, 'hienthi', 0, 1759490174, NULL),
(24259, 66, 0, 0, 'xa_quang_phu', 'Xã Quảng Phú', 'quang_phu', '24259', 'xã', 2261, 'hienthi', 0, 1759490174, NULL),
(24301, 66, 0, 0, 'xa_cuor_dang', 'Xã Cuôr Đăng', 'cuor_dang', '24301', 'xã', 2262, 'hienthi', 0, 1759490174, NULL),
(24280, 66, 0, 0, 'xa_cu_mgar', 'Xã Cư M’gar', 'cu_mgar', '24280', 'xã', 2263, 'hienthi', 0, 1759490174, NULL),
(24277, 66, 0, 0, 'xa_ea_tul', 'Xã Ea Tul', 'ea_tul', '24277', 'xã', 2264, 'hienthi', 0, 1759490174, NULL),
(24316, 66, 0, 0, 'xa_pong_drang', 'Xã Pơng Drang', 'pong_drang', '24316', 'xã', 2265, 'hienthi', 0, 1759490174, NULL),
(24310, 66, 0, 0, 'xa_krong_buk', 'Xã Krông Búk', 'krong_buk', '24310', 'xã', 2266, 'hienthi', 0, 1759490174, NULL),
(24313, 66, 0, 0, 'xa_cu_pong', 'Xã Cư Pơng', 'cu_pong', '24313', 'xã', 2267, 'hienthi', 0, 1759490174, NULL),
(24208, 66, 0, 0, 'xa_ea_khal', 'Xã Ea Khăl', 'ea_khal', '24208', 'xã', 2268, 'hienthi', 0, 1759490174, NULL),
(24181, 66, 0, 0, 'xa_ea_drang', 'Xã Ea Drăng', 'ea_drang', '24181', 'xã', 2269, 'hienthi', 0, 1759490174, NULL),
(24193, 66, 0, 0, 'xa_ea_wy', 'Xã Ea Wy', 'ea_wy', '24193', 'xã', 2270, 'hienthi', 0, 1759490174, NULL),
(24184, 66, 0, 0, 'xa_ea_hleo', 'Xã Ea H’leo', 'ea_hleo', '24184', 'xã', 2271, 'hienthi', 0, 1759490174, NULL),
(24187, 66, 0, 0, 'xa_ea_hiao', 'Xã Ea Hiao', 'ea_hiao', '24187', 'xã', 2272, 'hienthi', 0, 1759490174, NULL),
(24343, 66, 0, 0, 'xa_krong_nang', 'Xã Krông Năng', 'krong_nang', '24343', 'xã', 2273, 'hienthi', 0, 1759490174, NULL),
(24346, 66, 0, 0, 'xa_dlie_ya', 'Xã Dliê Ya', 'dlie_ya', '24346', 'xã', 2274, 'hienthi', 0, 1759490174, NULL),
(24352, 66, 0, 0, 'xa_tam_giang', 'Xã Tam Giang', 'tam_giang', '24352', 'xã', 2275, 'hienthi', 0, 1759490174, NULL),
(24364, 66, 0, 0, 'xa_phu_xuan', 'Xã Phú Xuân', 'phu_xuan', '24364', 'xã', 2276, 'hienthi', 0, 1759490174, NULL),
(24490, 66, 0, 0, 'xa_krong_pac', 'Xã Krông Pắc', 'krong_pac', '24490', 'xã', 2277, 'hienthi', 0, 1759490174, NULL),
(24505, 66, 0, 0, 'xa_ea_knuec', 'Xã Ea Knuếc', 'ea_knuec', '24505', 'xã', 2278, 'hienthi', 0, 1759490174, NULL),
(24526, 66, 0, 0, 'xa_tan_tien', 'Xã Tân Tiến', 'tan_tien', '24526', 'xã', 2279, 'hienthi', 0, 1759490174, NULL),
(24502, 66, 0, 0, 'xa_ea_phe', 'Xã Ea Phê', 'ea_phe', '24502', 'xã', 2280, 'hienthi', 0, 1759490174, NULL),
(24496, 66, 0, 0, 'xa_ea_kly', 'Xã Ea Kly', 'ea_kly', '24496', 'xã', 2281, 'hienthi', 0, 1759490174, NULL),
(24529, 66, 0, 0, 'xa_vu_bon', 'Xã Vụ Bổn', 'vu_bon', '24529', 'xã', 2282, 'hienthi', 0, 1759490174, NULL),
(24373, 66, 0, 0, 'xa_ea_kar', 'Xã Ea Kar', 'ea_kar', '24373', 'xã', 2283, 'hienthi', 0, 1759490174, NULL),
(24403, 66, 0, 0, 'xa_ea_o', 'Xã Ea Ô', 'ea_o', '24403', 'xã', 2284, 'hienthi', 0, 1759490174, NULL),
(24376, 66, 0, 0, 'xa_ea_knop', 'Xã Ea Knốp', 'ea_knop', '24376', 'xã', 2285, 'hienthi', 0, 1759490174, NULL),
(24406, 66, 0, 0, 'xa_cu_yang', 'Xã Cư Yang', 'cu_yang', '24406', 'xã', 2286, 'hienthi', 0, 1759490174, NULL),
(24400, 66, 0, 0, 'xa_ea_pal', 'Xã Ea Păl', 'ea_pal', '24400', 'xã', 2287, 'hienthi', 0, 1759490174, NULL),
(24412, 66, 0, 0, 'xa_mdrak', 'Xã M’Drắk', 'mdrak', '24412', 'xã', 2288, 'hienthi', 0, 1759490174, NULL),
(24433, 66, 0, 0, 'xa_ea_rieng', 'Xã Ea Riêng', 'ea_rieng', '24433', 'xã', 2289, 'hienthi', 0, 1759490174, NULL),
(24436, 66, 0, 0, 'xa_cu_mta', 'Xã Cư M’ta', 'cu_mta', '24436', 'xã', 2290, 'hienthi', 0, 1759490174, NULL),
(24444, 66, 0, 0, 'xa_krong_a', 'Xã Krông Á', 'krong_a', '24444', 'xã', 2291, 'hienthi', 0, 1759490174, NULL),
(24415, 66, 0, 0, 'xa_cu_prao', 'Xã Cư Prao', 'cu_prao', '24415', 'xã', 2292, 'hienthi', 0, 1759490174, NULL),
(24445, 66, 0, 0, 'xa_ea_trang', 'Xã Ea Trang', 'ea_trang', '24445', 'xã', 2293, 'hienthi', 0, 1759490174, NULL),
(24481, 66, 0, 0, 'xa_hoa_son', 'Xã Hòa Sơn', 'hoa_son', '24481', 'xã', 2294, 'hienthi', 0, 1759490174, NULL),
(24454, 66, 0, 0, 'xa_dang_kang', 'Xã Dang Kang', 'dang_kang', '24454', 'xã', 2295, 'hienthi', 0, 1759490174, NULL),
(24448, 66, 0, 0, 'xa_krong_bong', 'Xã Krông Bông', 'krong_bong', '24448', 'xã', 2296, 'hienthi', 0, 1759490174, NULL),
(24484, 66, 0, 0, 'xa_yang_mao', 'Xã Yang Mao', 'yang_mao', '24484', 'xã', 2297, 'hienthi', 0, 1759490174, NULL),
(24478, 66, 0, 0, 'xa_cu_pui', 'Xã Cư Pui', 'cu_pui', '24478', 'xã', 2298, 'hienthi', 0, 1759490174, NULL),
(24580, 66, 0, 0, 'xa_lien_son_lak', 'Xã Liên Sơn Lắk', 'lien_son_lak', '24580', 'xã', 2299, 'hienthi', 0, 1759490174, NULL),
(24595, 66, 0, 0, 'xa_dak_lieng', 'Xã Đắk Liêng', 'dak_lieng', '24595', 'xã', 2300, 'hienthi', 0, 1759490174, NULL),
(24607, 66, 0, 0, 'xa_nam_ka', 'Xã Nam Ka', 'nam_ka', '24607', 'xã', 2301, 'hienthi', 0, 1759490174, NULL),
(24598, 66, 0, 0, 'xa_dak_phoi', 'Xã Đắk Phơi', 'dak_phoi', '24598', 'xã', 2302, 'hienthi', 0, 1759490174, NULL),
(24604, 66, 0, 0, 'xa_krong_no', 'Xã Krông Nô', 'krong_no', '24604', 'xã', 2303, 'hienthi', 0, 1759490174, NULL),
(24540, 66, 0, 0, 'xa_ea_ning', 'Xã Ea Ning', 'ea_ning', '24540', 'xã', 2304, 'hienthi', 0, 1759490174, NULL),
(24561, 66, 0, 0, 'xa_dray_bhang', 'Xã Dray Bhăng', 'dray_bhang', '24561', 'xã', 2305, 'hienthi', 0, 1759490174, NULL),
(24544, 66, 0, 0, 'xa_ea_ktur', 'Xã Ea Ktur', 'ea_ktur', '24544', 'xã', 2306, 'hienthi', 0, 1759490174, NULL),
(24538, 66, 0, 0, 'xa_krong_ana', 'Xã Krông Ana', 'krong_ana', '24538', 'xã', 2307, 'hienthi', 0, 1759490174, NULL),
(24568, 66, 0, 0, 'xa_dur_kmal', 'Xã Dur Kmăl', 'dur_kmal', '24568', 'xã', 2308, 'hienthi', 0, 1759490174, NULL),
(24559, 66, 0, 0, 'xa_ea_na', 'Xã Ea Na', 'ea_na', '24559', 'xã', 2309, 'hienthi', 0, 1759490174, NULL),
(22015, 66, 0, 0, 'phuong_tuy_hoa', 'Phường Tuy Hòa', 'tuy_hoa', '22015', 'phường', 2310, 'hienthi', 0, 1759490174, NULL),
(22240, 66, 0, 0, 'phuong_phu_yen', 'Phường Phú Yên', 'phu_yen', '22240', 'phường', 2311, 'hienthi', 0, 1759490174, NULL),
(22045, 66, 0, 0, 'phuong_binh_kien', 'Phường Bình Kiến', 'binh_kien', '22045', 'phường', 2312, 'hienthi', 0, 1759490174, NULL),
(22075, 66, 0, 0, 'xa_xuan_tho', 'Xã Xuân Thọ', 'xuan_tho', '22075', 'xã', 2313, 'hienthi', 0, 1759490174, NULL),
(22066, 66, 0, 0, 'xa_xuan_canh', 'Xã Xuân Cảnh', 'xuan_canh', '22066', 'xã', 2314, 'hienthi', 0, 1759490174, NULL),
(22057, 66, 0, 0, 'xa_xuan_loc', 'Xã Xuân Lộc', 'xuan_loc', '22057', 'xã', 2315, 'hienthi', 0, 1759490174, NULL),
(22076, 66, 0, 0, 'phuong_xuan_dai', 'Phường Xuân Đài', 'xuan_dai', '22076', 'phường', 2316, 'hienthi', 0, 1759490174, NULL),
(22051, 66, 0, 0, 'phuong_song_cau', 'Phường Sông Cầu', 'song_cau', '22051', 'phường', 2317, 'hienthi', 0, 1759490174, NULL),
(22291, 66, 0, 0, 'xa_hoa_xuan', 'Xã Hòa Xuân', 'hoa_xuan', '22291', 'xã', 2318, 'hienthi', 0, 1759490174, NULL),
(22258, 66, 0, 0, 'phuong_dong_hoa', 'Phường Đông Hòa', 'dong_hoa', '22258', 'phường', 2319, 'hienthi', 0, 1759490174, NULL),
(22261, 66, 0, 0, 'phuong_hoa_hiep', 'Phường Hòa Hiệp', 'hoa_hiep', '22261', 'phường', 2320, 'hienthi', 0, 1759490174, NULL),
(22114, 66, 0, 0, 'xa_tuy_an_bac', 'Xã Tuy An Bắc', 'tuy_an_bac', '22114', 'xã', 2321, 'hienthi', 0, 1759490174, NULL),
(22120, 66, 0, 0, 'xa_tuy_an_dong', 'Xã Tuy An Đông', 'tuy_an_dong', '22120', 'xã', 2322, 'hienthi', 0, 1759490174, NULL),
(22147, 66, 0, 0, 'xa_o_loan', 'Xã Ô Loan', 'o_loan', '22147', 'xã', 2323, 'hienthi', 0, 1759490174, NULL),
(22153, 66, 0, 0, 'xa_tuy_an_nam', 'Xã Tuy An Nam', 'tuy_an_nam', '22153', 'xã', 2324, 'hienthi', 0, 1759490174, NULL),
(22132, 66, 0, 0, 'xa_tuy_an_tay', 'Xã Tuy An Tây', 'tuy_an_tay', '22132', 'xã', 2325, 'hienthi', 0, 1759490174, NULL),
(22319, 66, 0, 0, 'xa_phu_hoa_1', 'Xã Phú Hòa 1', 'phu_hoa_1', '22319', 'xã', 2326, 'hienthi', 0, 1759490174, NULL),
(22306, 66, 0, 0, 'xa_phu_hoa_2', 'Xã Phú Hòa 2', 'phu_hoa_2', '22306', 'xã', 2327, 'hienthi', 0, 1759490174, NULL),
(22255, 66, 0, 0, 'xa_tay_hoa', 'Xã Tây Hòa', 'tay_hoa', '22255', 'xã', 2328, 'hienthi', 0, 1759490174, NULL),
(22276, 66, 0, 0, 'xa_hoa_thinh', 'Xã Hòa Thịnh', 'hoa_thinh', '22276', 'xã', 2329, 'hienthi', 0, 1759490174, NULL),
(22285, 66, 0, 0, 'xa_hoa_my', 'Xã Hòa Mỹ', 'hoa_my', '22285', 'xã', 2330, 'hienthi', 0, 1759490174, NULL),
(22250, 66, 0, 0, 'xa_son_thanh', 'Xã Sơn Thành', 'son_thanh', '22250', 'xã', 2331, 'hienthi', 0, 1759490174, NULL),
(22165, 66, 0, 0, 'xa_son_hoa', 'Xã Sơn Hòa', 'son_hoa', '22165', 'xã', 2332, 'hienthi', 0, 1759490174, NULL),
(22177, 66, 0, 0, 'xa_van_hoa', 'Xã Vân Hòa', 'van_hoa', '22177', 'xã', 2333, 'hienthi', 0, 1759490174, NULL),
(22171, 66, 0, 0, 'xa_tay_son', 'Xã Tây Sơn', 'tay_son', '22171', 'xã', 2334, 'hienthi', 0, 1759490174, NULL),
(22192, 66, 0, 0, 'xa_suoi_trai', 'Xã Suối Trai', 'suoi_trai', '22192', 'xã', 2335, 'hienthi', 0, 1759490174, NULL),
(22237, 66, 0, 0, 'xa_ea_ly', 'Xã Ea Ly', 'ea_ly', '22237', 'xã', 2336, 'hienthi', 0, 1759490174, NULL),
(22225, 66, 0, 0, 'xa_ea_ba', 'Xã Ea Bá', 'ea_ba', '22225', 'xã', 2337, 'hienthi', 0, 1759490174, NULL),
(22222, 66, 0, 0, 'xa_duc_binh', 'Xã Đức Bình', 'duc_binh', '22222', 'xã', 2338, 'hienthi', 0, 1759490174, NULL),
(22207, 66, 0, 0, 'xa_song_hinh', 'Xã Sông Hinh', 'song_hinh', '22207', 'xã', 2339, 'hienthi', 0, 1759490174, NULL),
(22090, 66, 0, 0, 'xa_xuan_lanh', 'Xã Xuân Lãnh', 'xuan_lanh', '22090', 'xã', 2340, 'hienthi', 0, 1759490174, NULL),
(22096, 66, 0, 0, 'xa_phu_mo', 'Xã Phú Mỡ', 'phu_mo', '22096', 'xã', 2341, 'hienthi', 0, 1759490174, NULL),
(22111, 66, 0, 0, 'xa_xuan_phuoc', 'Xã Xuân Phước', 'xuan_phuoc', '22111', 'xã', 2342, 'hienthi', 0, 1759490174, NULL),
(22081, 66, 0, 0, 'xa_dong_xuan', 'Xã Đồng Xuân', 'dong_xuan', '22081', 'xã', 2343, 'hienthi', 0, 1759490174, NULL),
(24781, 68, 0, 0, 'phuong_xuan_huong_da_lat', 'Phường Xuân Hương - Đà Lạt', 'xuan_huong_da_lat', '24781', 'phường', 2344, 'hienthi', 0, 1759490174, NULL),
(24787, 68, 0, 0, 'phuong_cam_ly_da_lat', 'Phường Cam Ly - Đà Lạt', 'cam_ly_da_lat', '24787', 'phường', 2345, 'hienthi', 0, 1759490174, NULL),
(24778, 68, 0, 0, 'phuong_lam_vien_da_lat', 'Phường Lâm Viên - Đà Lạt', 'lam_vien_da_lat', '24778', 'phường', 2346, 'hienthi', 0, 1759490174, NULL),
(24805, 68, 0, 0, 'phuong_xuan_truong_da_lat', 'Phường Xuân Trường - Đà Lạt', 'xuan_truong_da_lat', '24805', 'phường', 2347, 'hienthi', 0, 1759490174, NULL),
(24846, 68, 0, 0, 'phuong_lang_biang_da_lat', 'Phường Lang Biang - Đà Lạt', 'lang_biang_da_lat', '24846', 'phường', 2348, 'hienthi', 0, 1759490174, NULL),
(24823, 68, 0, 0, 'phuong_1_bao_loc', 'Phường 1 Bảo Lộc', '1_bao_loc', '24823', 'phường', 2349, 'hienthi', 0, 1759490174, NULL),
(24820, 68, 0, 0, 'phuong_2_bao_loc', 'Phường 2 Bảo Lộc', '2_bao_loc', '24820', 'phường', 2350, 'hienthi', 0, 1759490174, NULL),
(24841, 68, 0, 0, 'phuong_3_bao_loc', 'Phường 3 Bảo Lộc', '3_bao_loc', '24841', 'phường', 2351, 'hienthi', 0, 1759490174, NULL),
(24829, 68, 0, 0, 'phuong_blao', 'Phường B\'Lao', 'blao', '24829', 'phường', 2352, 'hienthi', 0, 1759490174, NULL),
(24848, 68, 0, 0, 'xa_lac_duong', 'Xã Lạc Dương', 'lac_duong', '24848', 'xã', 2353, 'hienthi', 0, 1759490174, NULL),
(24931, 68, 0, 0, 'xa_don_duong', 'Xã Đơn Dương', 'don_duong', '24931', 'xã', 2354, 'hienthi', 0, 1759490174, NULL),
(24943, 68, 0, 0, 'xa_ka_do', 'Xã Ka Đô', 'ka_do', '24943', 'xã', 2355, 'hienthi', 0, 1759490174, NULL),
(24955, 68, 0, 0, 'xa_quang_lap', 'Xã Quảng Lập', 'quang_lap', '24955', 'xã', 2356, 'hienthi', 0, 1759490174, NULL),
(24934, 68, 0, 0, 'xa_dran', 'Xã D\'Ran', 'dran', '24934', 'xã', 2357, 'hienthi', 0, 1759490174, NULL),
(24967, 68, 0, 0, 'xa_hiep_thanh', 'Xã Hiệp Thạnh', 'hiep_thanh', '24967', 'xã', 2358, 'hienthi', 0, 1759490174, NULL),
(24958, 68, 0, 0, 'xa_duc_trong', 'Xã Đức Trọng', 'duc_trong', '24958', 'xã', 2359, 'hienthi', 0, 1759490174, NULL),
(24976, 68, 0, 0, 'xa_tan_hoi', 'Xã Tân Hội', 'tan_hoi', '24976', 'xã', 2360, 'hienthi', 0, 1759490174, NULL),
(24991, 68, 0, 0, 'xa_ta_hine', 'Xã Tà Hine', 'ta_hine', '24991', 'xã', 2361, 'hienthi', 0, 1759490174, NULL),
(24988, 68, 0, 0, 'xa_ta_nang', 'Xã Tà Năng', 'ta_nang', '24988', 'xã', 2362, 'hienthi', 0, 1759490174, NULL),
(24871, 68, 0, 0, 'xa_dinh_van_lam_ha', 'Xã Đinh Văn Lâm Hà', 'dinh_van_lam_ha', '24871', 'xã', 2363, 'hienthi', 0, 1759490174, NULL),
(24895, 68, 0, 0, 'xa_phu_son_lam_ha', 'Xã Phú Sơn Lâm Hà', 'phu_son_lam_ha', '24895', 'xã', 2364, 'hienthi', 0, 1759490174, NULL),
(24883, 68, 0, 0, 'xa_nam_ha_lam_ha', 'Xã Nam Hà Lâm Hà', 'nam_ha_lam_ha', '24883', 'xã', 2365, 'hienthi', 0, 1759490174, NULL),
(24868, 68, 0, 0, 'xa_nam_ban_lam_ha', 'Xã Nam Ban Lâm Hà', 'nam_ban_lam_ha', '24868', 'xã', 2366, 'hienthi', 0, 1759490174, NULL),
(24916, 68, 0, 0, 'xa_tan_ha_lam_ha', 'Xã Tân Hà Lâm Hà', 'tan_ha_lam_ha', '24916', 'xã', 2367, 'hienthi', 0, 1759490174, NULL),
(24907, 68, 0, 0, 'xa_phuc_tho_lam_ha', 'Xã Phúc Thọ Lâm Hà', 'phuc_tho_lam_ha', '24907', 'xã', 2368, 'hienthi', 0, 1759490174, NULL),
(24886, 68, 0, 0, 'xa_dam_rong_1', 'Xã Đam Rông 1', 'dam_rong_1', '24886', 'xã', 2369, 'hienthi', 0, 1759490174, NULL),
(24877, 68, 0, 0, 'xa_dam_rong_2', 'Xã Đam Rông 2', 'dam_rong_2', '24877', 'xã', 2370, 'hienthi', 0, 1759490174, NULL),
(24875, 68, 0, 0, 'xa_dam_rong_3', 'Xã Đam Rông 3', 'dam_rong_3', '24875', 'xã', 2371, 'hienthi', 0, 1759490174, NULL),
(24853, 68, 0, 0, 'xa_dam_rong_4', 'Xã Đam Rông 4', 'dam_rong_4', '24853', 'xã', 2372, 'hienthi', 0, 1759490174, NULL),
(25000, 68, 0, 0, 'xa_di_linh', 'Xã Di Linh', 'di_linh', '25000', 'xã', 2373, 'hienthi', 0, 1759490174, NULL),
(25036, 68, 0, 0, 'xa_hoa_ninh', 'Xã Hòa Ninh', 'hoa_ninh', '25036', 'xã', 2374, 'hienthi', 0, 1759490174, NULL),
(25042, 68, 0, 0, 'xa_hoa_bac', 'Xã Hòa Bắc', 'hoa_bac', '25042', 'xã', 2375, 'hienthi', 0, 1759490174, NULL),
(25007, 68, 0, 0, 'xa_dinh_trang_thuong', 'Xã Đinh Trang Thượng', 'dinh_trang_thuong', '25007', 'xã', 2376, 'hienthi', 0, 1759490174, NULL),
(25018, 68, 0, 0, 'xa_bao_thuan', 'Xã Bảo Thuận', 'bao_thuan', '25018', 'xã', 2377, 'hienthi', 0, 1759490174, NULL),
(25051, 68, 0, 0, 'xa_son_dien', 'Xã Sơn Điền', 'son_dien', '25051', 'xã', 2378, 'hienthi', 0, 1759490174, NULL),
(25015, 68, 0, 0, 'xa_gia_hiep', 'Xã Gia Hiệp', 'gia_hiep', '25015', 'xã', 2379, 'hienthi', 0, 1759490174, NULL),
(25054, 68, 0, 0, 'xa_bao_lam_1', 'Xã Bảo Lâm 1', 'bao_lam_1', '25054', 'xã', 2380, 'hienthi', 0, 1759490174, NULL),
(25084, 68, 0, 0, 'xa_bao_lam_2', 'Xã Bảo Lâm 2', 'bao_lam_2', '25084', 'xã', 2381, 'hienthi', 0, 1759490174, NULL),
(25093, 68, 0, 0, 'xa_bao_lam_3', 'Xã Bảo Lâm 3', 'bao_lam_3', '25093', 'xã', 2382, 'hienthi', 0, 1759490174, NULL),
(25063, 68, 0, 0, 'xa_bao_lam_4', 'Xã Bảo Lâm 4', 'bao_lam_4', '25063', 'xã', 2383, 'hienthi', 0, 1759490174, NULL),
(25057, 68, 0, 0, 'xa_bao_lam_5', 'Xã Bảo Lâm 5', 'bao_lam_5', '25057', 'xã', 2384, 'hienthi', 0, 1759490174, NULL),
(25099, 68, 0, 0, 'xa_da_huoai', 'Xã Đạ Huoai', 'da_huoai', '25099', 'xã', 2385, 'hienthi', 0, 1759490174, NULL),
(25105, 68, 0, 0, 'xa_da_huoai_2', 'Xã Đạ Huoai 2', 'da_huoai_2', '25105', 'xã', 2386, 'hienthi', 0, 1759490174, NULL),
(25114, 68, 0, 0, 'xa_da_huoai_3', 'Xã Đạ Huoai 3', 'da_huoai_3', '25114', 'xã', 2387, 'hienthi', 0, 1759490174, NULL),
(25126, 68, 0, 0, 'xa_da_teh', 'Xã Đạ Tẻh', 'da_teh', '25126', 'xã', 2388, 'hienthi', 0, 1759490174, NULL),
(25138, 68, 0, 0, 'xa_da_teh_2', 'Xã Đạ Tẻh 2', 'da_teh_2', '25138', 'xã', 2389, 'hienthi', 0, 1759490174, NULL),
(25135, 68, 0, 0, 'xa_da_teh_3', 'Xã Đạ Tẻh 3', 'da_teh_3', '25135', 'xã', 2390, 'hienthi', 0, 1759490174, NULL),
(25159, 68, 0, 0, 'xa_cat_tien', 'Xã Cát Tiên', 'cat_tien', '25159', 'xã', 2391, 'hienthi', 0, 1759490174, NULL),
(25180, 68, 0, 0, 'xa_cat_tien_2', 'Xã Cát Tiên 2', 'cat_tien_2', '25180', 'xã', 2392, 'hienthi', 0, 1759490174, NULL),
(25162, 68, 0, 0, 'xa_cat_tien_3', 'Xã Cát Tiên 3', 'cat_tien_3', '25162', 'xã', 2393, 'hienthi', 0, 1759490174, NULL),
(22933, 68, 0, 0, 'phuong_ham_thang', 'Phường Hàm Thắng', 'ham_thang', '22933', 'phường', 2394, 'hienthi', 0, 1759490174, NULL),
(22960, 68, 0, 0, 'phuong_binh_thuan', 'Phường Bình Thuận', 'binh_thuan', '22960', 'phường', 2395, 'hienthi', 0, 1759490174, NULL),
(22918, 68, 0, 0, 'phuong_mui_ne', 'Phường Mũi Né', 'mui_ne', '22918', 'phường', 2396, 'hienthi', 0, 1759490174, NULL),
(22924, 68, 0, 0, 'phuong_phu_thuy', 'Phường Phú Thuỷ', 'phu_thuy', '22924', 'phường', 2397, 'hienthi', 0, 1759490174, NULL),
(22945, 68, 0, 0, 'phuong_phan_thiet', 'Phường Phan Thiết', 'phan_thiet', '22945', 'phường', 2398, 'hienthi', 0, 1759490174, NULL),
(22954, 68, 0, 0, 'phuong_tien_thanh', 'Phường Tiến Thành', 'tien_thanh', '22954', 'phường', 2399, 'hienthi', 0, 1759490174, NULL),
(23235, 68, 0, 0, 'phuong_la_gi', 'Phường La Gi', 'la_gi', '23235', 'phường', 2400, 'hienthi', 0, 1759490174, NULL),
(23231, 68, 0, 0, 'phuong_phuoc_hoi', 'Phường Phước Hội', 'phuoc_hoi', '23231', 'phường', 2401, 'hienthi', 0, 1759490174, NULL),
(22963, 68, 0, 0, 'xa_tuyen_quang', 'Xã Tuyên Quang', 'tuyen_quang', '22963', 'xã', 2402, 'hienthi', 0, 1759490174, NULL),
(23246, 68, 0, 0, 'xa_tan_hai', 'Xã Tân Hải', 'tan_hai', '23246', 'xã', 2403, 'hienthi', 0, 1759490174, NULL),
(22981, 68, 0, 0, 'xa_vinh_hao', 'Xã Vĩnh Hảo', 'vinh_hao', '22981', 'xã', 2404, 'hienthi', 0, 1759490174, NULL),
(22969, 68, 0, 0, 'xa_lien_huong', 'Xã Liên Hương', 'lien_huong', '22969', 'xã', 2405, 'hienthi', 0, 1759490174, NULL),
(22978, 68, 0, 0, 'xa_tuy_phong', 'Xã Tuy Phong', 'tuy_phong', '22978', 'xã', 2406, 'hienthi', 0, 1759490174, NULL),
(22972, 68, 0, 0, 'xa_phan_ri_cua', 'Xã Phan Rí Cửa', 'phan_ri_cua', '22972', 'xã', 2407, 'hienthi', 0, 1759490174, NULL),
(23005, 68, 0, 0, 'xa_bac_binh', 'Xã Bắc Bình', 'bac_binh', '23005', 'xã', 2408, 'hienthi', 0, 1759490174, NULL),
(23041, 68, 0, 0, 'xa_hong_thai', 'Xã Hồng Thái', 'hong_thai', '23041', 'xã', 2409, 'hienthi', 0, 1759490174, NULL),
(23020, 68, 0, 0, 'xa_hai_ninh', 'Xã Hải Ninh', 'hai_ninh', '23020', 'xã', 2410, 'hienthi', 0, 1759490174, NULL),
(23008, 68, 0, 0, 'xa_phan_son', 'Xã Phan Sơn', 'phan_son', '23008', 'xã', 2411, 'hienthi', 0, 1759490174, NULL),
(23023, 68, 0, 0, 'xa_song_luy', 'Xã Sông Lũy', 'song_luy', '23023', 'xã', 2412, 'hienthi', 0, 1759490174, NULL),
(23032, 68, 0, 0, 'xa_luong_son', 'Xã Lương Sơn', 'luong_son', '23032', 'xã', 2413, 'hienthi', 0, 1759490174, NULL),
(23053, 68, 0, 0, 'xa_hoa_thang', 'Xã Hòa Thắng', 'hoa_thang', '23053', 'xã', 2414, 'hienthi', 0, 1759490174, NULL),
(23074, 68, 0, 0, 'xa_dong_giang', 'Xã Đông Giang', 'dong_giang', '23074', 'xã', 2415, 'hienthi', 0, 1759490174, NULL),
(23065, 68, 0, 0, 'xa_la_da', 'Xã La Dạ', 'la_da', '23065', 'xã', 2416, 'hienthi', 0, 1759490174, NULL),
(23089, 68, 0, 0, 'xa_ham_thuan_bac', 'Xã Hàm Thuận Bắc', 'ham_thuan_bac', '23089', 'xã', 2417, 'hienthi', 0, 1759490174, NULL),
(23059, 68, 0, 0, 'xa_ham_thuan', 'Xã Hàm Thuận', 'ham_thuan', '23059', 'xã', 2418, 'hienthi', 0, 1759490174, NULL),
(23086, 68, 0, 0, 'xa_hong_son', 'Xã Hồng Sơn', 'hong_son', '23086', 'xã', 2419, 'hienthi', 0, 1759490174, NULL),
(23098, 68, 0, 0, 'xa_ham_liem', 'Xã Hàm Liêm', 'ham_liem', '23098', 'xã', 2420, 'hienthi', 0, 1759490174, NULL),
(23122, 68, 0, 0, 'xa_ham_thanh', 'Xã Hàm Thạnh', 'ham_thanh', '23122', 'xã', 2421, 'hienthi', 0, 1759490174, NULL),
(23128, 68, 0, 0, 'xa_ham_kiem', 'Xã Hàm Kiệm', 'ham_kiem', '23128', 'xã', 2422, 'hienthi', 0, 1759490174, NULL),
(23143, 68, 0, 0, 'xa_tan_thanh', 'Xã Tân Thành', 'tan_thanh', '23143', 'xã', 2423, 'hienthi', 0, 1759490174, NULL),
(23110, 68, 0, 0, 'xa_ham_thuan_nam', 'Xã Hàm Thuận Nam', 'ham_thuan_nam', '23110', 'xã', 2424, 'hienthi', 0, 1759490174, NULL),
(23134, 68, 0, 0, 'xa_tan_lap', 'Xã Tân Lập', 'tan_lap', '23134', 'xã', 2425, 'hienthi', 0, 1759490174, NULL),
(23230, 68, 0, 0, 'xa_tan_minh', 'Xã Tân Minh', 'tan_minh', '23230', 'xã', 2426, 'hienthi', 0, 1759490174, NULL),
(23236, 68, 0, 0, 'xa_ham_tan', 'Xã Hàm Tân', 'ham_tan', '23236', 'xã', 2427, 'hienthi', 0, 1759490174, NULL),
(23266, 68, 0, 0, 'xa_son_my', 'Xã Sơn Mỹ', 'son_my', '23266', 'xã', 2428, 'hienthi', 0, 1759490174, NULL),
(23152, 68, 0, 0, 'xa_bac_ruong', 'Xã Bắc Ruộng', 'bac_ruong', '23152', 'xã', 2429, 'hienthi', 0, 1759490174, NULL),
(23158, 68, 0, 0, 'xa_nghi_duc', 'Xã Nghị Đức', 'nghi_duc', '23158', 'xã', 2430, 'hienthi', 0, 1759490174, NULL),
(23173, 68, 0, 0, 'xa_dong_kho', 'Xã Đồng Kho', 'dong_kho', '23173', 'xã', 2431, 'hienthi', 0, 1759490174, NULL),
(23149, 68, 0, 0, 'xa_tanh_linh', 'Xã Tánh Linh', 'tanh_linh', '23149', 'xã', 2432, 'hienthi', 0, 1759490174, NULL),
(23188, 68, 0, 0, 'xa_suoi_kiet', 'Xã Suối Kiết', 'suoi_kiet', '23188', 'xã', 2433, 'hienthi', 0, 1759490174, NULL),
(23200, 68, 0, 0, 'xa_nam_thanh', 'Xã Nam Thành', 'nam_thanh', '23200', 'xã', 2434, 'hienthi', 0, 1759490174, NULL),
(23191, 68, 0, 0, 'xa_duc_linh', 'Xã Đức Linh', 'duc_linh', '23191', 'xã', 2435, 'hienthi', 0, 1759490174, NULL),
(23194, 68, 0, 0, 'xa_hoai_duc', 'Xã Hoài Đức', 'hoai_duc', '23194', 'xã', 2436, 'hienthi', 0, 1759490174, NULL),
(23227, 68, 0, 0, 'xa_tra_tan', 'Xã Trà Tân', 'tra_tan', '23227', 'xã', 2437, 'hienthi', 0, 1759490174, NULL),
(23272, 68, 0, 0, 'dac_khu_phu_quy', 'Đặc khu Phú Quý', 'phu_quy', '23272', 'đặc khu', 2438, 'hienthi', 0, 1759490174, NULL),
(24611, 68, 0, 0, 'phuong_bac_gia_nghia', 'Phường Bắc Gia Nghĩa', 'bac_gia_nghia', '24611', 'phường', 2439, 'hienthi', 0, 1759490174, NULL),
(24615, 68, 0, 0, 'phuong_nam_gia_nghia', 'Phường Nam Gia Nghĩa', 'nam_gia_nghia', '24615', 'phường', 2440, 'hienthi', 0, 1759490174, NULL),
(24617, 68, 0, 0, 'phuong_dong_gia_nghia', 'Phường Đông Gia Nghĩa', 'dong_gia_nghia', '24617', 'phường', 2441, 'hienthi', 0, 1759490174, NULL),
(24646, 68, 0, 0, 'xa_dak_wil', 'Xã Đắk Wil', 'dak_wil', '24646', 'xã', 2442, 'hienthi', 0, 1759490174, NULL),
(24649, 68, 0, 0, 'xa_nam_dong', 'Xã Nam Dong', 'nam_dong', '24649', 'xã', 2443, 'hienthi', 0, 1759490174, NULL),
(24640, 68, 0, 0, 'xa_cu_jut', 'Xã Cư Jút', 'cu_jut', '24640', 'xã', 2444, 'hienthi', 0, 1759490174, NULL),
(24682, 68, 0, 0, 'xa_thuan_an', 'Xã Thuận An', 'thuan_an', '24682', 'xã', 2445, 'hienthi', 0, 1759490174, NULL),
(24664, 68, 0, 0, 'xa_duc_lap', 'Xã Đức Lập', 'duc_lap', '24664', 'xã', 2446, 'hienthi', 0, 1759490174, NULL),
(24670, 68, 0, 0, 'xa_dak_mil', 'Xã Đắk Mil', 'dak_mil', '24670', 'xã', 2447, 'hienthi', 0, 1759490174, NULL),
(24678, 68, 0, 0, 'xa_dak_sak', 'Xã Đắk Sắk', 'dak_sak', '24678', 'xã', 2448, 'hienthi', 0, 1759490174, NULL),
(24697, 68, 0, 0, 'xa_nam_da', 'Xã Nam Đà', 'nam_da', '24697', 'xã', 2449, 'hienthi', 0, 1759490174, NULL),
(24688, 68, 0, 0, 'xa_krong_no', 'Xã Krông Nô', 'krong_no', '24688', 'xã', 2450, 'hienthi', 0, 1759490174, NULL),
(24703, 68, 0, 0, 'xa_nam_nung', 'Xã Nâm Nung', 'nam_nung', '24703', 'xã', 2451, 'hienthi', 0, 1759490174, NULL),
(24712, 68, 0, 0, 'xa_quang_phu', 'Xã Quảng Phú', 'quang_phu', '24712', 'xã', 2452, 'hienthi', 0, 1759490174, NULL),
(24718, 68, 0, 0, 'xa_dak_song', 'Xã Đắk song', 'dak_song', '24718', 'xã', 2453, 'hienthi', 0, 1759490174, NULL),
(24717, 68, 0, 0, 'xa_duc_an', 'Xã Đức An', 'duc_an', '24717', 'xã', 2454, 'hienthi', 0, 1759490174, NULL),
(24722, 68, 0, 0, 'xa_thuan_hanh', 'Xã Thuận Hạnh', 'thuan_hanh', '24722', 'xã', 2455, 'hienthi', 0, 1759490174, NULL),
(24730, 68, 0, 0, 'xa_truong_xuan', 'Xã Trường Xuân', 'truong_xuan', '24730', 'xã', 2456, 'hienthi', 0, 1759490174, NULL),
(24637, 68, 0, 0, 'xa_ta_dung', 'Xã Tà Đùng', 'ta_dung', '24637', 'xã', 2457, 'hienthi', 0, 1759490174, NULL),
(24631, 68, 0, 0, 'xa_quang_khe', 'Xã Quảng Khê', 'quang_khe', '24631', 'xã', 2458, 'hienthi', 0, 1759490174, NULL),
(24748, 68, 0, 0, 'xa_quang_tan', 'Xã Quảng Tân', 'quang_tan', '24748', 'xã', 2459, 'hienthi', 0, 1759490174, NULL),
(24739, 68, 0, 0, 'xa_tuy_duc', 'Xã Tuy Đức', 'tuy_duc', '24739', 'xã', 2460, 'hienthi', 0, 1759490174, NULL),
(24733, 68, 0, 0, 'xa_kien_duc', 'Xã Kiến Đức', 'kien_duc', '24733', 'xã', 2461, 'hienthi', 0, 1759490174, NULL),
(24751, 68, 0, 0, 'xa_nhan_co', 'Xã Nhân Cơ', 'nhan_co', '24751', 'xã', 2462, 'hienthi', 0, 1759490174, NULL),
(24760, 68, 0, 0, 'xa_quang_tin', 'Xã Quảng Tín', 'quang_tin', '24760', 'xã', 2463, 'hienthi', 0, 1759490174, NULL),
(24985, 68, 0, 0, 'xa_ninh_gia', 'Xã Ninh Gia', 'ninh_gia', '24985', 'xã', 2464, 'hienthi', 0, 1759490174, NULL),
(24620, 68, 0, 0, 'xa_quang_hoa', 'Xã Quảng Hòa', 'quang_hoa', '24620', 'xã', 2465, 'hienthi', 0, 1759490174, NULL),
(24616, 68, 0, 0, 'xa_quang_son', 'Xã Quảng Sơn', 'quang_son', '24616', 'xã', 2466, 'hienthi', 0, 1759490174, NULL),
(24736, 68, 0, 0, 'xa_quang_truc', 'Xã Quảng Trực', 'quang_truc', '24736', 'xã', 2467, 'hienthi', 0, 1759490174, NULL),
(26068, 75, 0, 0, 'phuong_bien_hoa', 'Phường Biên Hòa', 'bien_hoa', '26068', 'phường', 2468, 'hienthi', 0, 1759490174, NULL),
(26041, 75, 0, 0, 'phuong_tran_bien', 'Phường Trấn Biên', 'tran_bien', '26041', 'phường', 2469, 'hienthi', 0, 1759490174, NULL),
(26017, 75, 0, 0, 'phuong_tam_hiep', 'Phường Tam Hiệp', 'tam_hiep', '26017', 'phường', 2470, 'hienthi', 0, 1759490174, NULL),
(26020, 75, 0, 0, 'phuong_long_binh', 'Phường Long Bình', 'long_binh', '26020', 'phường', 2471, 'hienthi', 0, 1759490174, NULL),
(25993, 75, 0, 0, 'phuong_trang_dai', 'Phường Trảng Dài', 'trang_dai', '25993', 'phường', 2472, 'hienthi', 0, 1759490174, NULL),
(26005, 75, 0, 0, 'phuong_ho_nai', 'Phường Hố Nai', 'ho_nai', '26005', 'phường', 2473, 'hienthi', 0, 1759490174, NULL),
(26380, 75, 0, 0, 'phuong_long_hung', 'Phường Long Hưng', 'long_hung', '26380', 'phường', 2474, 'hienthi', 0, 1759490174, NULL),
(26491, 75, 0, 0, 'xa_dai_phuoc', 'Xã Đại Phước', 'dai_phuoc', '26491', 'xã', 2475, 'hienthi', 0, 1759490174, NULL),
(26485, 75, 0, 0, 'xa_nhon_trach', 'Xã Nhơn Trạch', 'nhon_trach', '26485', 'xã', 2476, 'hienthi', 0, 1759490174, NULL),
(26503, 75, 0, 0, 'xa_phuoc_an', 'Xã Phước An', 'phuoc_an', '26503', 'xã', 2477, 'hienthi', 0, 1759490174, NULL),
(26422, 75, 0, 0, 'xa_phuoc_thai', 'Xã Phước Thái', 'phuoc_thai', '26422', 'xã', 2478, 'hienthi', 0, 1759490174, NULL),
(26413, 75, 0, 0, 'xa_long_phuoc', 'Xã Long Phước', 'long_phuoc', '26413', 'xã', 2479, 'hienthi', 0, 1759490174, NULL),
(26389, 75, 0, 0, 'xa_binh_an', 'Xã Bình An', 'binh_an', '26389', 'xã', 2480, 'hienthi', 0, 1759490174, NULL),
(26368, 75, 0, 0, 'xa_long_thanh', 'Xã Long Thành', 'long_thanh', '26368', 'xã', 2481, 'hienthi', 0, 1759490174, NULL),
(26383, 75, 0, 0, 'xa_an_phuoc', 'Xã An Phước', 'an_phuoc', '26383', 'xã', 2482, 'hienthi', 0, 1759490174, NULL),
(26296, 75, 0, 0, 'xa_an_vien', 'Xã An Viễn', 'an_vien', '26296', 'xã', 2483, 'hienthi', 0, 1759490174, NULL),
(26278, 75, 0, 0, 'xa_binh_minh', 'Xã Bình Minh', 'binh_minh', '26278', 'xã', 2484, 'hienthi', 0, 1759490174, NULL),
(26248, 75, 0, 0, 'xa_trang_bom', 'Xã Trảng Bom', 'trang_bom', '26248', 'xã', 2485, 'hienthi', 0, 1759490174, NULL),
(26254, 75, 0, 0, 'xa_bau_ham', 'Xã Bàu Hàm', 'bau_ham', '26254', 'xã', 2486, 'hienthi', 0, 1759490174, NULL),
(26281, 75, 0, 0, 'xa_hung_thinh', 'Xã Hưng Thịnh', 'hung_thinh', '26281', 'xã', 2487, 'hienthi', 0, 1759490174, NULL),
(26326, 75, 0, 0, 'xa_dau_giay', 'Xã Dầu Giây', 'dau_giay', '26326', 'xã', 2488, 'hienthi', 0, 1759490174, NULL),
(26311, 75, 0, 0, 'xa_gia_kiem', 'Xã Gia Kiệm', 'gia_kiem', '26311', 'xã', 2489, 'hienthi', 0, 1759490174, NULL),
(26299, 75, 0, 0, 'xa_thong_nhat', 'Xã Thống Nhất', 'thong_nhat', '26299', 'xã', 2490, 'hienthi', 0, 1759490174, NULL),
(26089, 75, 0, 0, 'phuong_binh_loc', 'Phường Bình Lộc', 'binh_loc', '26089', 'phường', 2491, 'hienthi', 0, 1759490174, NULL),
(26098, 75, 0, 0, 'phuong_bao_vinh', 'Phường Bảo Vinh', 'bao_vinh', '26098', 'phường', 2492, 'hienthi', 0, 1759490174, NULL),
(26104, 75, 0, 0, 'phuong_xuan_lap', 'Phường Xuân Lập', 'xuan_lap', '26104', 'phường', 2493, 'hienthi', 0, 1759490174, NULL),
(26080, 75, 0, 0, 'phuong_long_khanh', 'Phường Long Khánh', 'long_khanh', '26080', 'phường', 2494, 'hienthi', 0, 1759490174, NULL),
(26113, 75, 0, 0, 'phuong_hang_gon', 'Phường Hàng Gòn', 'hang_gon', '26113', 'phường', 2495, 'hienthi', 0, 1759490174, NULL),
(26329, 75, 0, 0, 'xa_xuan_que', 'Xã Xuân Quế', 'xuan_que', '26329', 'xã', 2496, 'hienthi', 0, 1759490174, NULL),
(26347, 75, 0, 0, 'xa_xuan_duong', 'Xã Xuân Đường', 'xuan_duong', '26347', 'xã', 2497, 'hienthi', 0, 1759490174, NULL),
(26341, 75, 0, 0, 'xa_cam_my', 'Xã Cẩm Mỹ', 'cam_my', '26341', 'xã', 2498, 'hienthi', 0, 1759490174, NULL),
(26362, 75, 0, 0, 'xa_song_ray', 'Xã Sông Ray', 'song_ray', '26362', 'xã', 2499, 'hienthi', 0, 1759490174, NULL),
(26359, 75, 0, 0, 'xa_xuan_dong', 'Xã Xuân Đông', 'xuan_dong', '26359', 'xã', 2500, 'hienthi', 0, 1759490174, NULL),
(26461, 75, 0, 0, 'xa_xuan_dinh', 'Xã Xuân Định', 'xuan_dinh', '26461', 'xã', 2501, 'hienthi', 0, 1759490174, NULL),
(26458, 75, 0, 0, 'xa_xuan_phu', 'Xã Xuân Phú', 'xuan_phu', '26458', 'xã', 2502, 'hienthi', 0, 1759490174, NULL),
(26425, 75, 0, 0, 'xa_xuan_loc', 'Xã Xuân Lộc', 'xuan_loc', '26425', 'xã', 2503, 'hienthi', 0, 1759490174, NULL),
(26446, 75, 0, 0, 'xa_xuan_hoa', 'Xã Xuân Hòa', 'xuan_hoa', '26446', 'xã', 2504, 'hienthi', 0, 1759490174, NULL),
(26434, 75, 0, 0, 'xa_xuan_thanh', 'Xã Xuân Thành', 'xuan_thanh', '26434', 'xã', 2505, 'hienthi', 0, 1759490174, NULL),
(26428, 75, 0, 0, 'xa_xuan_bac', 'Xã Xuân Bắc', 'xuan_bac', '26428', 'xã', 2506, 'hienthi', 0, 1759490174, NULL),
(26227, 75, 0, 0, 'xa_la_nga', 'Xã La Ngà', 'la_nga', '26227', 'xã', 2507, 'hienthi', 0, 1759490174, NULL),
(26206, 75, 0, 0, 'xa_dinh_quan', 'Xã Định Quán', 'dinh_quan', '26206', 'xã', 2508, 'hienthi', 0, 1759490174, NULL),
(26215, 75, 0, 0, 'xa_phu_vinh', 'Xã Phú Vinh', 'phu_vinh', '26215', 'xã', 2509, 'hienthi', 0, 1759490174, NULL),
(26221, 75, 0, 0, 'xa_phu_hoa', 'Xã Phú Hòa', 'phu_hoa', '26221', 'xã', 2510, 'hienthi', 0, 1759490174, NULL),
(26134, 75, 0, 0, 'xa_ta_lai', 'Xã Tà Lài', 'ta_lai', '26134', 'xã', 2511, 'hienthi', 0, 1759490174, NULL),
(26122, 75, 0, 0, 'xa_nam_cat_tien', 'Xã Nam Cát Tiên', 'nam_cat_tien', '26122', 'xã', 2512, 'hienthi', 0, 1759490174, NULL),
(26116, 75, 0, 0, 'xa_tan_phu', 'Xã Tân Phú', 'tan_phu', '26116', 'xã', 2513, 'hienthi', 0, 1759490174, NULL),
(26158, 75, 0, 0, 'xa_phu_lam', 'Xã Phú Lâm', 'phu_lam', '26158', 'xã', 2514, 'hienthi', 0, 1759490174, NULL),
(26170, 75, 0, 0, 'xa_tri_an', 'Xã Trị An', 'tri_an', '26170', 'xã', 2515, 'hienthi', 0, 1759490174, NULL),
(26179, 75, 0, 0, 'xa_tan_an', 'Xã Tân An', 'tan_an', '26179', 'xã', 2516, 'hienthi', 0, 1759490174, NULL),
(26188, 75, 0, 0, 'phuong_tan_trieu', 'Phường Tân Triều', 'tan_trieu', '26188', 'phường', 2517, 'hienthi', 0, 1759490174, NULL),
(25441, 75, 0, 0, 'phuong_minh_hung', 'Phường Minh Hưng', 'minh_hung', '25441', 'phường', 2518, 'hienthi', 0, 1759490174, NULL),
(25432, 75, 0, 0, 'phuong_chon_thanh', 'Phường Chơn Thành', 'chon_thanh', '25432', 'phường', 2519, 'hienthi', 0, 1759490174, NULL),
(25453, 75, 0, 0, 'xa_nha_bich', 'Xã Nha Bích', 'nha_bich', '25453', 'xã', 2520, 'hienthi', 0, 1759490174, NULL),
(25351, 75, 0, 0, 'xa_tan_quan', 'Xã Tân Quan', 'tan_quan', '25351', 'xã', 2521, 'hienthi', 0, 1759490174, NULL),
(25345, 75, 0, 0, 'xa_tan_hung', 'Xã Tân Hưng', 'tan_hung', '25345', 'xã', 2522, 'hienthi', 0, 1759490174, NULL),
(25357, 75, 0, 0, 'xa_tan_khai', 'Xã Tân Khai', 'tan_khai', '25357', 'xã', 2523, 'hienthi', 0, 1759490174, NULL),
(25349, 75, 0, 0, 'xa_minh_duc', 'Xã Minh Đức', 'minh_duc', '25349', 'xã', 2524, 'hienthi', 0, 1759490174, NULL),
(25326, 75, 0, 0, 'phuong_binh_long', 'Phường Bình Long', 'binh_long', '25326', 'phường', 2525, 'hienthi', 0, 1759490174, NULL),
(25336, 75, 0, 0, 'phuong_an_loc', 'Phường An Lộc', 'an_loc', '25336', 'phường', 2526, 'hienthi', 0, 1759490174, NULL),
(25294, 75, 0, 0, 'xa_loc_thanh', 'Xã Lộc Thành', 'loc_thanh', '25294', 'xã', 2527, 'hienthi', 0, 1759490174, NULL),
(25270, 75, 0, 0, 'xa_loc_ninh', 'Xã Lộc Ninh', 'loc_ninh', '25270', 'xã', 2528, 'hienthi', 0, 1759490174, NULL),
(25303, 75, 0, 0, 'xa_loc_hung', 'Xã Lộc Hưng', 'loc_hung', '25303', 'xã', 2529, 'hienthi', 0, 1759490174, NULL),
(25279, 75, 0, 0, 'xa_loc_tan', 'Xã Lộc Tấn', 'loc_tan', '25279', 'xã', 2530, 'hienthi', 0, 1759490174, NULL),
(25280, 75, 0, 0, 'xa_loc_thanh', 'Xã Lộc Thạnh', 'loc_thanh', '25280', 'xã', 2531, 'hienthi', 0, 1759490174, NULL),
(25292, 75, 0, 0, 'xa_loc_quang', 'Xã Lộc Quang', 'loc_quang', '25292', 'xã', 2532, 'hienthi', 0, 1759490174, NULL),
(25318, 75, 0, 0, 'xa_tan_tien', 'Xã Tân Tiến', 'tan_tien', '25318', 'xã', 2533, 'hienthi', 0, 1759490174, NULL),
(25308, 75, 0, 0, 'xa_thien_hung', 'Xã Thiện Hưng', 'thien_hung', '25308', 'xã', 2534, 'hienthi', 0, 1759490174, NULL),
(25309, 75, 0, 0, 'xa_hung_phuoc', 'Xã Hưng Phước', 'hung_phuoc', '25309', 'xã', 2535, 'hienthi', 0, 1759490174, NULL),
(25267, 75, 0, 0, 'xa_phu_nghia', 'Xã Phú Nghĩa', 'phu_nghia', '25267', 'xã', 2536, 'hienthi', 0, 1759490174, NULL),
(25231, 75, 0, 0, 'xa_da_kia', 'Xã Đa Kia', 'da_kia', '25231', 'xã', 2537, 'hienthi', 0, 1759490174, NULL),
(25220, 75, 0, 0, 'phuong_phuoc_binh', 'Phường Phước Bình', 'phuoc_binh', '25220', 'phường', 2538, 'hienthi', 0, 1759490174, NULL),
(25217, 75, 0, 0, 'phuong_phuoc_long', 'Phường Phước Long', 'phuoc_long', '25217', 'phường', 2539, 'hienthi', 0, 1759490174, NULL),
(25246, 75, 0, 0, 'xa_binh_tan', 'Xã Bình Tân', 'binh_tan', '25246', 'xã', 2540, 'hienthi', 0, 1759490174, NULL),
(25255, 75, 0, 0, 'xa_long_ha', 'Xã Long Hà', 'long_ha', '25255', 'xã', 2541, 'hienthi', 0, 1759490174, NULL),
(25264, 75, 0, 0, 'xa_phu_rieng', 'Xã Phú Riềng', 'phu_rieng', '25264', 'xã', 2542, 'hienthi', 0, 1759490174, NULL),
(25261, 75, 0, 0, 'xa_phu_trung', 'Xã Phú Trung', 'phu_trung', '25261', 'xã', 2543, 'hienthi', 0, 1759490174, NULL),
(25210, 75, 0, 0, 'phuong_dong_xoai', 'Phường Đồng Xoài', 'dong_xoai', '25210', 'phường', 2544, 'hienthi', 0, 1759490174, NULL),
(25195, 75, 0, 0, 'phuong_binh_phuoc', 'Phường Bình Phước', 'binh_phuoc', '25195', 'phường', 2545, 'hienthi', 0, 1759490174, NULL),
(25387, 75, 0, 0, 'xa_thuan_loi', 'Xã Thuận Lợi', 'thuan_loi', '25387', 'xã', 2546, 'hienthi', 0, 1759490174, NULL),
(25390, 75, 0, 0, 'xa_dong_tam', 'Xã Đồng Tâm', 'dong_tam', '25390', 'xã', 2547, 'hienthi', 0, 1759490174, NULL),
(25378, 75, 0, 0, 'xa_tan_loi', 'Xã Tân Lợi', 'tan_loi', '25378', 'xã', 2548, 'hienthi', 0, 1759490174, NULL),
(25363, 75, 0, 0, 'xa_dong_phu', 'Xã Đồng Phú', 'dong_phu', '25363', 'xã', 2549, 'hienthi', 0, 1759490174, NULL),
(25420, 75, 0, 0, 'xa_phuoc_son', 'Xã Phước Sơn', 'phuoc_son', '25420', 'xã', 2550, 'hienthi', 0, 1759490174, NULL),
(25417, 75, 0, 0, 'xa_nghia_trung', 'Xã Nghĩa Trung', 'nghia_trung', '25417', 'xã', 2551, 'hienthi', 0, 1759490174, NULL),
(25396, 75, 0, 0, 'xa_bu_dang', 'Xã Bù Đăng', 'bu_dang', '25396', 'xã', 2552, 'hienthi', 0, 1759490174, NULL),
(25402, 75, 0, 0, 'xa_tho_son', 'Xã Thọ Sơn', 'tho_son', '25402', 'xã', 2553, 'hienthi', 0, 1759490174, NULL),
(25399, 75, 0, 0, 'xa_dak_nhau', 'Xã Đak Nhau', 'dak_nhau', '25399', 'xã', 2554, 'hienthi', 0, 1759490174, NULL),
(25405, 75, 0, 0, 'xa_bom_bo', 'Xã Bom Bo', 'bom_bo', '25405', 'xã', 2555, 'hienthi', 0, 1759490174, NULL),
(26374, 75, 0, 0, 'phuong_tam_phuoc', 'Phường Tam Phước', 'tam_phuoc', '26374', 'phường', 2556, 'hienthi', 0, 1759490174, NULL),
(26377, 75, 0, 0, 'phuong_phuoc_tan', 'Phường Phước Tân', 'phuoc_tan', '26377', 'phường', 2557, 'hienthi', 0, 1759490174, NULL),
(26209, 75, 0, 0, 'xa_thanh_son', 'Xã Thanh Sơn', 'thanh_son', '26209', 'xã', 2558, 'hienthi', 0, 1759490174, NULL),
(26119, 75, 0, 0, 'xa_dak_lua', 'Xã Đak Lua', 'dak_lua', '26119', 'xã', 2559, 'hienthi', 0, 1759490174, NULL),
(26173, 75, 0, 0, 'xa_phu_ly', 'Xã Phú Lý', 'phu_ly', '26173', 'xã', 2560, 'hienthi', 0, 1759490174, NULL),
(25222, 75, 0, 0, 'xa_bu_gia_map', 'Xã Bù Gia Mập', 'bu_gia_map', '25222', 'xã', 2561, 'hienthi', 0, 1759490174, NULL),
(25225, 75, 0, 0, 'xa_dak_o', 'Xã Đăk Ơ', 'dak_o', '25225', 'xã', 2562, 'hienthi', 0, 1759490174, NULL),
(26506, 79, 0, 0, 'phuong_vung_tau', 'Phường Vũng Tàu', 'vung_tau', '26506', 'phường', 2563, 'hienthi', 0, 1759490174, NULL),
(26526, 79, 0, 0, 'phuong_tam_thang', 'Phường Tam Thắng', 'tam_thang', '26526', 'phường', 2564, 'hienthi', 0, 1759490174, NULL),
(26536, 79, 0, 0, 'phuong_rach_dua', 'Phường  Rạch Dừa', 'rach_dua', '26536', 'phường', 2565, 'hienthi', 0, 1759490174, NULL),
(26542, 79, 0, 0, 'phuong_phuoc_thang', 'Phường Phước Thắng', 'phuoc_thang', '26542', 'phường', 2566, 'hienthi', 0, 1759490174, NULL),
(26560, 79, 0, 0, 'phuong_ba_ria', 'Phường Bà Rịa', 'ba_ria', '26560', 'phường', 2567, 'hienthi', 0, 1759490174, NULL),
(26566, 79, 0, 0, 'phuong_long_huong', 'Phường Long Hương', 'long_huong', '26566', 'phường', 2568, 'hienthi', 0, 1759490174, NULL),
(26704, 79, 0, 0, 'phuong_phu_my', 'Phường Phú Mỹ', 'phu_my', '26704', 'phường', 2569, 'hienthi', 0, 1759490174, NULL),
(26572, 79, 0, 0, 'phuong_tam_long', 'Phường Tam Long', 'tam_long', '26572', 'phường', 2570, 'hienthi', 0, 1759490174, NULL),
(26725, 79, 0, 0, 'phuong_tan_thanh', 'Phường Tân Thành', 'tan_thanh', '26725', 'phường', 2571, 'hienthi', 0, 1759490174, NULL),
(26713, 79, 0, 0, 'phuong_tan_phuoc', 'Phường Tân Phước', 'tan_phuoc', '26713', 'phường', 2572, 'hienthi', 0, 1759490174, NULL),
(26710, 79, 0, 0, 'phuong_tan_hai', 'Phường Tân Hải', 'tan_hai', '26710', 'phường', 2573, 'hienthi', 0, 1759490174, NULL),
(26728, 79, 0, 0, 'xa_chau_pha', 'Xã Châu Pha', 'chau_pha', '26728', 'xã', 2574, 'hienthi', 0, 1759490174, NULL),
(26575, 79, 0, 0, 'xa_ngai_giao', 'Xã Ngãi Giao', 'ngai_giao', '26575', 'xã', 2575, 'hienthi', 0, 1759490174, NULL),
(26590, 79, 0, 0, 'xa_binh_gia', 'Xã Bình Giã', 'binh_gia', '26590', 'xã', 2576, 'hienthi', 0, 1759490174, NULL),
(26608, 79, 0, 0, 'xa_kim_long', 'Xã Kim Long', 'kim_long', '26608', 'xã', 2577, 'hienthi', 0, 1759490174, NULL),
(26596, 79, 0, 0, 'xa_chau_duc', 'Xã Châu Đức', 'chau_duc', '26596', 'xã', 2578, 'hienthi', 0, 1759490174, NULL),
(26584, 79, 0, 0, 'xa_xuan_son', 'Xã Xuân Sơn', 'xuan_son', '26584', 'xã', 2579, 'hienthi', 0, 1759490174, NULL),
(26617, 79, 0, 0, 'xa_nghia_thanh', 'Xã Nghĩa Thành', 'nghia_thanh', '26617', 'xã', 2580, 'hienthi', 0, 1759490174, NULL),
(26620, 79, 0, 0, 'xa_ho_tram', 'Xã Hồ Tràm', 'ho_tram', '26620', 'xã', 2581, 'hienthi', 0, 1759490174, NULL),
(26632, 79, 0, 0, 'xa_xuyen_moc', 'Xã Xuyên Mộc', 'xuyen_moc', '26632', 'xã', 2582, 'hienthi', 0, 1759490174, NULL),
(26641, 79, 0, 0, 'xa_hoa_hoi', 'Xã Hòa Hội', 'hoa_hoi', '26641', 'xã', 2583, 'hienthi', 0, 1759490174, NULL),
(26638, 79, 0, 0, 'xa_bau_lam', 'Xã Bàu Lâm', 'bau_lam', '26638', 'xã', 2584, 'hienthi', 0, 1759490174, NULL),
(26686, 79, 0, 0, 'xa_phuoc_hai', 'Xã Phước Hải', 'phuoc_hai', '26686', 'xã', 2585, 'hienthi', 0, 1759490174, NULL),
(26662, 79, 0, 0, 'xa_long_hai', 'Xã Long Hải', 'long_hai', '26662', 'xã', 2586, 'hienthi', 0, 1759490174, NULL),
(26680, 79, 0, 0, 'xa_dat_do', 'Xã Đất Đỏ', 'dat_do', '26680', 'xã', 2587, 'hienthi', 0, 1759490174, NULL),
(26659, 79, 0, 0, 'xa_long_dien', 'Xã Long Điền', 'long_dien', '26659', 'xã', 2588, 'hienthi', 0, 1759490174, NULL),
(26732, 79, 0, 0, 'dac_khu_con_dao', 'Đặc khu Côn Đảo', 'con_dao', '26732', 'đặc khu', 2589, 'hienthi', 0, 1759490174, NULL),
(25951, 79, 0, 0, 'phuong_dong_hoa', 'Phường Đông Hòa', 'dong_hoa', '25951', 'phường', 2590, 'hienthi', 0, 1759490174, NULL),
(25942, 79, 0, 0, 'phuong_di_an', 'Phường Dĩ An', 'di_an', '25942', 'phường', 2591, 'hienthi', 0, 1759490174, NULL),
(25945, 79, 0, 0, 'phuong_tan_dong_hiep', 'Phường Tân Đông Hiệp', 'tan_dong_hiep', '25945', 'phường', 2592, 'hienthi', 0, 1759490174, NULL),
(25978, 79, 0, 0, 'phuong_thuan_an', 'Phường Thuận An', 'thuan_an', '25978', 'phường', 2593, 'hienthi', 0, 1759490174, NULL),
(25969, 79, 0, 0, 'phuong_thuan_giao', 'Phường Thuận Giao', 'thuan_giao', '25969', 'phường', 2594, 'hienthi', 0, 1759490174, NULL),
(25987, 79, 0, 0, 'phuong_binh_hoa', 'Phường Bình Hòa', 'binh_hoa', '25987', 'phường', 2595, 'hienthi', 0, 1759490174, NULL),
(25966, 79, 0, 0, 'phuong_lai_thieu', 'Phường Lái Thiêu', 'lai_thieu', '25966', 'phường', 2596, 'hienthi', 0, 1759490174, NULL),
(25975, 79, 0, 0, 'phuong_an_phu', 'Phường An Phú', 'an_phu', '25975', 'phường', 2597, 'hienthi', 0, 1759490174, NULL),
(25760, 79, 0, 0, 'phuong_binh_duong', 'Phường Bình Dương', 'binh_duong', '25760', 'phường', 2598, 'hienthi', 0, 1759490174, NULL),
(25771, 79, 0, 0, 'phuong_chanh_hiep', 'Phường Chánh Hiệp', 'chanh_hiep', '25771', 'phường', 2599, 'hienthi', 0, 1759490174, NULL),
(25747, 79, 0, 0, 'phuong_thu_dau_mot', 'Phường Thủ Dầu Một', 'thu_dau_mot', '25747', 'phường', 2600, 'hienthi', 0, 1759490174, NULL),
(25750, 79, 0, 0, 'phuong_phu_loi', 'Phường Phú Lợi', 'phu_loi', '25750', 'phường', 2601, 'hienthi', 0, 1759490174, NULL),
(25912, 79, 0, 0, 'phuong_vinh_tan', 'Phường Vĩnh Tân', 'vinh_tan', '25912', 'phường', 2602, 'hienthi', 0, 1759490174, NULL),
(25915, 79, 0, 0, 'phuong_binh_co', 'Phường Bình Cơ', 'binh_co', '25915', 'phường', 2603, 'hienthi', 0, 1759490174, NULL),
(25888, 79, 0, 0, 'phuong_tan_uyen', 'Phường Tân Uyên', 'tan_uyen', '25888', 'phường', 2604, 'hienthi', 0, 1759490174, NULL),
(25920, 79, 0, 0, 'phuong_tan_hiep', 'Phường Tân Hiệp', 'tan_hiep', '25920', 'phường', 2605, 'hienthi', 0, 1759490174, NULL),
(25891, 79, 0, 0, 'phuong_tan_khanh', 'Phường Tân Khánh', 'tan_khanh', '25891', 'phường', 2606, 'hienthi', 0, 1759490174, NULL),
(25849, 79, 0, 0, 'phuong_hoa_loi', 'Phường Hòa Lợi', 'hoa_loi', '25849', 'phường', 2607, 'hienthi', 0, 1759490174, NULL),
(25768, 79, 0, 0, 'phuong_phu_an', 'Phường Phú An', 'phu_an', '25768', 'phường', 2608, 'hienthi', 0, 1759490174, NULL),
(25843, 79, 0, 0, 'phuong_tay_nam', 'Phường Tây Nam', 'tay_nam', '25843', 'phường', 2609, 'hienthi', 0, 1759490174, NULL),
(25840, 79, 0, 0, 'phuong_long_nguyen', 'Phường Long Nguyên', 'long_nguyen', '25840', 'phường', 2610, 'hienthi', 0, 1759490174, NULL),
(25813, 79, 0, 0, 'phuong_ben_cat', 'Phường Bến Cát', 'ben_cat', '25813', 'phường', 2611, 'hienthi', 0, 1759490174, NULL),
(25837, 79, 0, 0, 'phuong_chanh_phu_hoa', 'Phường Chánh Phú Hòa', 'chanh_phu_hoa', '25837', 'phường', 2612, 'hienthi', 0, 1759490174, NULL),
(25906, 79, 0, 0, 'xa_bac_tan_uyen', 'Xã Bắc Tân Uyên', 'bac_tan_uyen', '25906', 'xã', 2613, 'hienthi', 0, 1759490174, NULL),
(25909, 79, 0, 0, 'xa_thuong_tan', 'Xã Thường Tân', 'thuong_tan', '25909', 'xã', 2614, 'hienthi', 0, 1759490174, NULL),
(25867, 79, 0, 0, 'xa_an_long', 'Xã An Long', 'an_long', '25867', 'xã', 2615, 'hienthi', 0, 1759490174, NULL);
INSERT INTO `table_ward` (`id`, `id_city`, `id_district`, `districtid`, `wardcode`, `name`, `slug`, `code`, `level`, `numb`, `status`, `date_updated`, `date_created`, `ship_price`) VALUES
(25864, 79, 0, 0, 'xa_phuoc_thanh', 'Xã Phước Thành', 'phuoc_thanh', '25864', 'xã', 2616, 'hienthi', 0, 1759490174, NULL),
(25882, 79, 0, 0, 'xa_phuoc_hoa', 'Xã Phước Hòa', 'phuoc_hoa', '25882', 'xã', 2617, 'hienthi', 0, 1759490174, NULL),
(25858, 79, 0, 0, 'xa_phu_giao', 'Xã Phú Giáo', 'phu_giao', '25858', 'xã', 2618, 'hienthi', 0, 1759490174, NULL),
(25819, 79, 0, 0, 'xa_tru_van_tho', 'Xã Trừ Văn Thố', 'tru_van_tho', '25819', 'xã', 2619, 'hienthi', 0, 1759490174, NULL),
(25822, 79, 0, 0, 'xa_bau_bang', 'Xã Bàu Bàng', 'bau_bang', '25822', 'xã', 2620, 'hienthi', 0, 1759490174, NULL),
(25780, 79, 0, 0, 'xa_minh_thanh', 'Xã Minh Thạnh', 'minh_thanh', '25780', 'xã', 2621, 'hienthi', 0, 1759490174, NULL),
(25792, 79, 0, 0, 'xa_long_hoa', 'Xã Long Hòa', 'long_hoa', '25792', 'xã', 2622, 'hienthi', 0, 1759490174, NULL),
(25777, 79, 0, 0, 'xa_dau_tieng', 'Xã Dầu Tiếng', 'dau_tieng', '25777', 'xã', 2623, 'hienthi', 0, 1759490174, NULL),
(25807, 79, 0, 0, 'xa_thanh_an', 'Xã Thanh An', 'thanh_an', '25807', 'xã', 2624, 'hienthi', 0, 1759490174, NULL),
(26740, 79, 0, 0, 'phuong_sai_gon', 'Phường Sài Gòn', 'sai_gon', '26740', 'phường', 2625, 'hienthi', 0, 1759490174, NULL),
(26737, 79, 0, 0, 'phuong_tan_dinh', 'Phường Tân Định', 'tan_dinh', '26737', 'phường', 2626, 'hienthi', 0, 1759490174, NULL),
(26743, 79, 0, 0, 'phuong_ben_thanh', 'Phường Bến Thành', 'ben_thanh', '26743', 'phường', 2627, 'hienthi', 0, 1759490174, NULL),
(26758, 79, 0, 0, 'phuong_cau_ong_lanh', 'Phường Cầu Ông Lãnh', 'cau_ong_lanh', '26758', 'phường', 2628, 'hienthi', 0, 1759490174, NULL),
(27160, 79, 0, 0, 'phuong_ban_co', 'Phường Bàn Cờ', 'ban_co', '27160', 'phường', 2629, 'hienthi', 0, 1759490174, NULL),
(27139, 79, 0, 0, 'phuong_xuan_hoa', 'Phường Xuân Hòa', 'xuan_hoa', '27139', 'phường', 2630, 'hienthi', 0, 1759490174, NULL),
(27142, 79, 0, 0, 'phuong_nhieu_loc', 'Phường Nhiêu Lộc', 'nhieu_loc', '27142', 'phường', 2631, 'hienthi', 0, 1759490174, NULL),
(27259, 79, 0, 0, 'phuong_xom_chieu', 'Phường Xóm Chiếu', 'xom_chieu', '27259', 'xã', 2632, 'hienthi', 0, 1759490174, NULL),
(27265, 79, 0, 0, 'phuong_khanh_hoi', 'Phường Khánh Hội', 'khanh_hoi', '27265', 'xã', 2633, 'hienthi', 0, 1759490174, NULL),
(27286, 79, 0, 0, 'phuong_vinh_hoi', 'Phường Vĩnh Hội', 'vinh_hoi', '27286', 'xã', 2634, 'hienthi', 0, 1759490174, NULL),
(27301, 79, 0, 0, 'phuong_cho_quan', 'Phường Chợ Quán', 'cho_quan', '27301', 'phường', 2635, 'hienthi', 0, 1759490174, NULL),
(27316, 79, 0, 0, 'phuong_an_dong', 'Phường An Đông', 'an_dong', '27316', 'phường', 2636, 'hienthi', 0, 1759490174, NULL),
(27343, 79, 0, 0, 'phuong_cho_lon', 'Phường Chợ Lớn', 'cho_lon', '27343', 'phường', 2637, 'hienthi', 0, 1759490174, NULL),
(27367, 79, 0, 0, 'phuong_binh_tay', 'Phường Bình Tây', 'binh_tay', '27367', 'phường', 2638, 'hienthi', 0, 1759490174, NULL),
(27373, 79, 0, 0, 'phuong_binh_tien', 'Phường Bình Tiên', 'binh_tien', '27373', 'phường', 2639, 'hienthi', 0, 1759490174, NULL),
(27385, 79, 0, 0, 'phuong_binh_phu', 'Phường Bình Phú', 'binh_phu', '27385', 'phường', 2640, 'hienthi', 0, 1759490174, NULL),
(27349, 79, 0, 0, 'phuong_phu_lam', 'Phường Phú Lâm', 'phu_lam', '27349', 'phường', 2641, 'hienthi', 0, 1759490174, NULL),
(27478, 79, 0, 0, 'phuong_tan_thuan', 'Phường Tân Thuận', 'tan_thuan', '27478', 'phường', 2642, 'hienthi', 0, 1759490174, NULL),
(27484, 79, 0, 0, 'phuong_phu_thuan', 'Phường Phú Thuận', 'phu_thuan', '27484', 'phường', 2643, 'hienthi', 0, 1759490174, NULL),
(27487, 79, 0, 0, 'phuong_tan_my', 'Phường Tân Mỹ', 'tan_my', '27487', 'phường', 2644, 'hienthi', 0, 1759490174, NULL),
(27475, 79, 0, 0, 'phuong_tan_hung', 'Phường Tân Hưng', 'tan_hung', '27475', 'phường', 2645, 'hienthi', 0, 1759490174, NULL),
(27418, 79, 0, 0, 'phuong_chanh_hung', 'Phường Chánh Hưng', 'chanh_hung', '27418', 'phường', 2646, 'hienthi', 0, 1759490174, NULL),
(27427, 79, 0, 0, 'phuong_phu_dinh', 'Phường Phú Định', 'phu_dinh', '27427', 'phường', 2647, 'hienthi', 0, 1759490174, NULL),
(27424, 79, 0, 0, 'phuong_binh_dong', 'Phường Bình Đông', 'binh_dong', '27424', 'phường', 2648, 'hienthi', 0, 1759490174, NULL),
(27169, 79, 0, 0, 'phuong_dien_hong', 'Phường Diên Hồng', 'dien_hong', '27169', 'phường', 2649, 'hienthi', 0, 1759490174, NULL),
(27190, 79, 0, 0, 'phuong_vuon_lai', 'Phường Vườn Lài', 'vuon_lai', '27190', 'phường', 2650, 'hienthi', 0, 1759490174, NULL),
(27163, 79, 0, 0, 'phuong_hoa_hung', 'Phường Hòa Hưng', 'hoa_hung', '27163', 'phường', 2651, 'hienthi', 0, 1759490174, NULL),
(27238, 79, 0, 0, 'phuong_minh_phung', 'Phường Minh Phụng', 'minh_phung', '27238', 'phường', 2652, 'hienthi', 0, 1759490174, NULL),
(27232, 79, 0, 0, 'phuong_binh_thoi', 'Phường Bình Thới', 'binh_thoi', '27232', 'phường', 2653, 'hienthi', 0, 1759490174, NULL),
(27211, 79, 0, 0, 'phuong_hoa_binh', 'Phường Hòa Bình', 'hoa_binh', '27211', 'phường', 2654, 'hienthi', 0, 1759490174, NULL),
(27226, 79, 0, 0, 'phuong_phu_tho', 'Phường Phú Thọ', 'phu_tho', '27226', 'phường', 2655, 'hienthi', 0, 1759490174, NULL),
(26791, 79, 0, 0, 'phuong_dong_hung_thuan', 'Phường Đông Hưng Thuận', 'dong_hung_thuan', '26791', 'phường', 2656, 'hienthi', 0, 1759490174, NULL),
(26785, 79, 0, 0, 'phuong_trung_my_tay', 'Phường Trung Mỹ Tây', 'trung_my_tay', '26785', 'phường', 2657, 'hienthi', 0, 1759490174, NULL),
(26782, 79, 0, 0, 'phuong_tan_thoi_hiep', 'Phường Tân Thới Hiệp', 'tan_thoi_hiep', '26782', 'phường', 2658, 'hienthi', 0, 1759490174, NULL),
(26773, 79, 0, 0, 'phuong_thoi_an', 'Phường Thới An', 'thoi_an', '26773', 'phường', 2659, 'hienthi', 0, 1759490174, NULL),
(26767, 79, 0, 0, 'phuong_an_phu_dong', 'Phường An Phú Đông', 'an_phu_dong', '26767', 'phường', 2660, 'hienthi', 0, 1759490174, NULL),
(27460, 79, 0, 0, 'phuong_an_lac', 'Phường An Lạc', 'an_lac', '27460', 'xã', 2661, 'hienthi', 0, 1759490174, NULL),
(27457, 79, 0, 0, 'phuong_tan_tao', 'Phường Tân Tạo', 'tan_tao', '27457', 'xã', 2662, 'hienthi', 0, 1759490174, NULL),
(27442, 79, 0, 0, 'phuong_binh_tan', 'Phường Bình Tân', 'binh_tan', '27442', 'xã', 2663, 'hienthi', 0, 1759490174, NULL),
(27448, 79, 0, 0, 'phuong_binh_tri_dong', 'Phường Bình Trị Đông', 'binh_tri_dong', '27448', 'xã', 2664, 'hienthi', 0, 1759490174, NULL),
(27439, 79, 0, 0, 'phuong_binh_hung_hoa', 'Phường Bình Hưng Hòa', 'binh_hung_hoa', '27439', 'xã', 2665, 'hienthi', 0, 1759490174, NULL),
(26944, 79, 0, 0, 'phuong_gia_dinh', 'Phường Gia Định', 'gia_dinh', '26944', 'phường', 2666, 'hienthi', 0, 1759490174, NULL),
(26929, 79, 0, 0, 'phuong_binh_thanh', 'Phường Bình Thạnh', 'binh_thanh', '26929', 'phường', 2667, 'hienthi', 0, 1759490174, NULL),
(26905, 79, 0, 0, 'phuong_binh_loi_trung', 'Phường Bình Lợi Trung', 'binh_loi_trung', '26905', 'phường', 2668, 'hienthi', 0, 1759490174, NULL),
(26956, 79, 0, 0, 'phuong_thanh_my_tay', 'Phường Thạnh Mỹ Tây', 'thanh_my_tay', '26956', 'phường', 2669, 'hienthi', 0, 1759490174, NULL),
(26911, 79, 0, 0, 'phuong_binh_quoi', 'Phường Bình Quới', 'binh_quoi', '26911', 'phường', 2670, 'hienthi', 0, 1759490174, NULL),
(26902, 79, 0, 0, 'phuong_hanh_thong', 'Phường Hạnh Thông', 'hanh_thong', '26902', 'xã', 2671, 'hienthi', 0, 1759490174, NULL),
(26887, 79, 0, 0, 'phuong_an_nhon', 'Phường  An Nhơn', 'an_nhon', '26887', 'xã', 2672, 'hienthi', 0, 1759490174, NULL),
(26884, 79, 0, 0, 'phuong_go_vap', 'Phường Gò Vấp', 'go_vap', '26884', 'xã', 2673, 'hienthi', 0, 1759490174, NULL),
(26878, 79, 0, 0, 'phuong_an_hoi_dong', 'Phường An Hội Đông', 'an_hoi_dong', '26878', 'xã', 2674, 'hienthi', 0, 1759490174, NULL),
(26899, 79, 0, 0, 'phuong_thong_tay_hoi', 'Phường Thông Tây Hội', 'thong_tay_hoi', '26899', 'xã', 2675, 'hienthi', 0, 1759490174, NULL),
(26882, 79, 0, 0, 'phuong_an_hoi_tay', 'Phường An Hội Tây', 'an_hoi_tay', '26882', 'xã', 2676, 'hienthi', 0, 1759490174, NULL),
(27043, 79, 0, 0, 'phuong_duc_nhuan', 'Phường Đức Nhuận', 'duc_nhuan', '27043', 'phường', 2677, 'hienthi', 0, 1759490174, NULL),
(27058, 79, 0, 0, 'phuong_cau_kieu', 'Phường Cầu Kiệu', 'cau_kieu', '27058', 'phường', 2678, 'hienthi', 0, 1759490174, NULL),
(27073, 79, 0, 0, 'phuong_phu_nhuan', 'Phường Phú Nhuận', 'phu_nhuan', '27073', 'phường', 2679, 'hienthi', 0, 1759490174, NULL),
(26977, 79, 0, 0, 'phuong_tan_son_hoa', 'Phường Tân Sơn Hòa', 'tan_son_hoa', '26977', 'xã', 2680, 'hienthi', 0, 1759490174, NULL),
(26968, 79, 0, 0, 'phuong_tan_son_nhat', 'Phường Tân Sơn Nhất', 'tan_son_nhat', '26968', 'xã', 2681, 'hienthi', 0, 1759490174, NULL),
(26995, 79, 0, 0, 'phuong_tan_hoa', 'Phường Tân Hòa', 'tan_hoa', '26995', 'xã', 2682, 'hienthi', 0, 1759490174, NULL),
(26983, 79, 0, 0, 'phuong_bay_hien', 'Phường Bảy Hiền', 'bay_hien', '26983', 'xã', 2683, 'hienthi', 0, 1759490174, NULL),
(27004, 79, 0, 0, 'phuong_tan_binh', 'Phường Tân Bình', 'tan_binh', '27004', 'xã', 2684, 'hienthi', 0, 1759490174, NULL),
(27007, 79, 0, 0, 'phuong_tan_son', 'Phường Tân Sơn', 'tan_son', '27007', 'xã', 2685, 'hienthi', 0, 1759490174, NULL),
(27013, 79, 0, 0, 'phuong_tay_thanh', 'Phường Tây Thạnh', 'tay_thanh', '27013', 'phường', 2686, 'hienthi', 0, 1759490174, NULL),
(27010, 79, 0, 0, 'phuong_tan_son_nhi', 'Phường Tân Sơn Nhì', 'tan_son_nhi', '27010', 'phường', 2687, 'hienthi', 0, 1759490174, NULL),
(27022, 79, 0, 0, 'phuong_phu_tho_hoa', 'Phường Phú Thọ Hòa', 'phu_tho_hoa', '27022', 'phường', 2688, 'hienthi', 0, 1759490174, NULL),
(27031, 79, 0, 0, 'phuong_tan_phu', 'Phường Tân Phú', 'tan_phu', '27031', 'phường', 2689, 'hienthi', 0, 1759490174, NULL),
(27028, 79, 0, 0, 'phuong_phu_thanh', 'Phường Phú Thạnh', 'phu_thanh', '27028', 'phường', 2690, 'hienthi', 0, 1759490174, NULL),
(26812, 79, 0, 0, 'phuong_hiep_binh', 'Phường Hiệp Bình', 'hiep_binh', '26812', 'phường', 2691, 'hienthi', 0, 1759490174, NULL),
(26824, 79, 0, 0, 'phuong_thu_duc', 'Phường Thủ Đức', 'thu_duc', '26824', 'phường', 2692, 'hienthi', 0, 1759490174, NULL),
(26797, 79, 0, 0, 'phuong_tam_binh', 'Phường Tam Bình', 'tam_binh', '26797', 'phường', 2693, 'hienthi', 0, 1759490174, NULL),
(26794, 79, 0, 0, 'phuong_linh_xuan', 'Phường Linh Xuân', 'linh_xuan', '26794', 'phường', 2694, 'hienthi', 0, 1759490174, NULL),
(26842, 79, 0, 0, 'phuong_tang_nhon_phu', 'Phường Tăng Nhơn Phú', 'tang_nhon_phu', '26842', 'phường', 2695, 'hienthi', 0, 1759490174, NULL),
(26833, 79, 0, 0, 'phuong_long_binh', 'Phường Long Bình', 'long_binh', '26833', 'phường', 2696, 'hienthi', 0, 1759490174, NULL),
(26857, 79, 0, 0, 'phuong_long_phuoc', 'Phường Long Phước', 'long_phuoc', '26857', 'phường', 2697, 'hienthi', 0, 1759490174, NULL),
(26860, 79, 0, 0, 'phuong_long_truong', 'Phường Long Trường', 'long_truong', '26860', 'phường', 2698, 'hienthi', 0, 1759490174, NULL),
(27112, 79, 0, 0, 'phuong_cat_lai', 'Phường Cát Lái', 'cat_lai', '27112', 'phường', 2699, 'hienthi', 0, 1759490174, NULL),
(27097, 79, 0, 0, 'phuong_binh_trung', 'Phường Bình Trưng', 'binh_trung', '27097', 'phường', 2700, 'hienthi', 0, 1759490174, NULL),
(26848, 79, 0, 0, 'phuong_phuoc_long', 'Phường Phước Long', 'phuoc_long', '26848', 'phường', 2701, 'hienthi', 0, 1759490174, NULL),
(27118, 79, 0, 0, 'phuong_an_khanh', 'Phường An Khánh', 'an_khanh', '27118', 'phường', 2702, 'hienthi', 0, 1759490174, NULL),
(27601, 79, 0, 0, 'xa_vinh_loc', 'Xã Vĩnh Lộc', 'vinh_loc', '27601', 'xã', 2703, 'hienthi', 0, 1759490174, NULL),
(27604, 79, 0, 0, 'xa_tan_vinh_loc', 'Xã Tân Vĩnh Lộc', 'tan_vinh_loc', '27604', 'xã', 2704, 'hienthi', 0, 1759490174, NULL),
(27610, 79, 0, 0, 'xa_binh_loi', 'Xã Bình Lợi', 'binh_loi', '27610', 'xã', 2705, 'hienthi', 0, 1759490174, NULL),
(27595, 79, 0, 0, 'xa_tan_nhut', 'Xã Tân Nhựt', 'tan_nhut', '27595', 'xã', 2706, 'hienthi', 0, 1759490174, NULL),
(27637, 79, 0, 0, 'xa_binh_chanh', 'Xã Bình Chánh', 'binh_chanh', '27637', 'xã', 2707, 'hienthi', 0, 1759490174, NULL),
(27628, 79, 0, 0, 'xa_hung_long', 'Xã Hưng Long', 'hung_long', '27628', 'xã', 2708, 'hienthi', 0, 1759490174, NULL),
(27619, 79, 0, 0, 'xa_binh_hung', 'Xã Bình Hưng', 'binh_hung', '27619', 'xã', 2709, 'hienthi', 0, 1759490174, NULL),
(27667, 79, 0, 0, 'xa_binh_khanh', 'Xã Bình Khánh', 'binh_khanh', '27667', 'xã', 2710, 'hienthi', 0, 1759490174, NULL),
(27673, 79, 0, 0, 'xa_an_thoi_dong', 'Xã An Thới Đông', 'an_thoi_dong', '27673', 'xã', 2711, 'hienthi', 0, 1759490174, NULL),
(27664, 79, 0, 0, 'xa_can_gio', 'Xã Cần Giờ', 'can_gio', '27664', 'xã', 2712, 'hienthi', 0, 1759490174, NULL),
(27553, 79, 0, 0, 'xa_cu_chi', 'Xã Củ Chi', 'cu_chi', '27553', 'xã', 2713, 'hienthi', 0, 1759490174, NULL),
(27496, 79, 0, 0, 'xa_tan_an_hoi', 'Xã Tân An Hội', 'tan_an_hoi', '27496', 'xã', 2714, 'hienthi', 0, 1759490174, NULL),
(27526, 79, 0, 0, 'xa_thai_my', 'Xã Thái Mỹ', 'thai_my', '27526', 'xã', 2715, 'hienthi', 0, 1759490174, NULL),
(27508, 79, 0, 0, 'xa_an_nhon_tay', 'Xã An Nhơn Tây', 'an_nhon_tay', '27508', 'xã', 2716, 'hienthi', 0, 1759490174, NULL),
(27511, 79, 0, 0, 'xa_nhuan_duc', 'Xã Nhuận Đức', 'nhuan_duc', '27511', 'xã', 2717, 'hienthi', 0, 1759490174, NULL),
(27541, 79, 0, 0, 'xa_phu_hoa_dong', 'Xã Phú Hòa Đông', 'phu_hoa_dong', '27541', 'xã', 2718, 'hienthi', 0, 1759490174, NULL),
(27544, 79, 0, 0, 'xa_binh_my', 'Xã Bình Mỹ', 'binh_my', '27544', 'xã', 2719, 'hienthi', 0, 1759490174, NULL),
(27568, 79, 0, 0, 'xa_dong_thanh', 'Xã Đông Thạnh', 'dong_thanh', '27568', 'xã', 2720, 'hienthi', 0, 1759490174, NULL),
(27559, 79, 0, 0, 'xa_hoc_mon', 'Xã Hóc Môn', 'hoc_mon', '27559', 'xã', 2721, 'hienthi', 0, 1759490174, NULL),
(27577, 79, 0, 0, 'xa_xuan_thoi_son', 'Xã Xuân Thới Sơn', 'xuan_thoi_son', '27577', 'xã', 2722, 'hienthi', 0, 1759490174, NULL),
(27592, 79, 0, 0, 'xa_ba_diem', 'Xã Bà Điểm', 'ba_diem', '27592', 'xã', 2723, 'hienthi', 0, 1759490174, NULL),
(27655, 79, 0, 0, 'xa_nha_be', 'Xã Nhà Bè', 'nha_be', '27655', 'xã', 2724, 'hienthi', 0, 1759490174, NULL),
(27658, 79, 0, 0, 'xa_hiep_phuoc', 'Xã Hiệp Phước', 'hiep_phuoc', '27658', 'xã', 2725, 'hienthi', 0, 1759490174, NULL),
(26545, 79, 0, 0, 'xa_long_son', 'Xã Long Sơn', 'long_son', '26545', 'xã', 2726, 'hienthi', 0, 1759490174, NULL),
(26647, 79, 0, 0, 'xa_hoa_hiep', 'Xã Hòa Hiệp', 'hoa_hiep', '26647', 'xã', 2727, 'hienthi', 0, 1759490174, NULL),
(26656, 79, 0, 0, 'xa_binh_chau', 'Xã Bình Châu', 'binh_chau', '26656', 'xã', 2728, 'hienthi', 0, 1759490174, NULL),
(25846, 79, 0, 0, 'phuong_thoi_hoa', 'Phường Thới Hòa', 'thoi_hoa', '25846', 'phường', 2729, 'hienthi', 0, 1759490174, NULL),
(27676, 79, 0, 0, 'xa_thanh_an', 'Xã Thạnh An', 'thanh_an', '27676', 'xã', 2730, 'hienthi', 0, 1759490174, NULL),
(27727, 80, 0, 0, 'xa_hung_dien', 'Xã Hưng Điền', 'hung_dien', '27727', 'xã', 2731, 'hienthi', 0, 1759490174, NULL),
(27736, 80, 0, 0, 'xa_vinh_thanh', 'Xã Vĩnh Thạnh', 'vinh_thanh', '27736', 'xã', 2732, 'hienthi', 0, 1759490174, NULL),
(27721, 80, 0, 0, 'xa_tan_hung', 'Xã Tân Hưng', 'tan_hung', '27721', 'xã', 2733, 'hienthi', 0, 1759490174, NULL),
(27748, 80, 0, 0, 'xa_vinh_chau', 'Xã Vĩnh Châu', 'vinh_chau', '27748', 'xã', 2734, 'hienthi', 0, 1759490174, NULL),
(27775, 80, 0, 0, 'xa_tuyen_binh', 'Xã Tuyên Bình', 'tuyen_binh', '27775', 'xã', 2735, 'hienthi', 0, 1759490174, NULL),
(27757, 80, 0, 0, 'xa_vinh_hung', 'Xã Vĩnh Hưng', 'vinh_hung', '27757', 'xã', 2736, 'hienthi', 0, 1759490174, NULL),
(27763, 80, 0, 0, 'xa_khanh_hung', 'Xã Khánh Hưng', 'khanh_hung', '27763', 'xã', 2737, 'hienthi', 0, 1759490174, NULL),
(27817, 80, 0, 0, 'xa_tuyen_thanh', 'Xã Tuyên Thạnh', 'tuyen_thanh', '27817', 'xã', 2738, 'hienthi', 0, 1759490174, NULL),
(27793, 80, 0, 0, 'xa_binh_hiep', 'Xã Bình Hiệp', 'binh_hiep', '27793', 'xã', 2739, 'hienthi', 0, 1759490174, NULL),
(27787, 80, 0, 0, 'phuong_kien_tuong', 'Phường Kiến Tường', 'kien_tuong', '27787', 'phường', 2740, 'hienthi', 0, 1759490174, NULL),
(27811, 80, 0, 0, 'xa_binh_hoa', 'Xã Bình Hoà', 'binh_hoa', '27811', 'xã', 2741, 'hienthi', 0, 1759490174, NULL),
(27823, 80, 0, 0, 'xa_moc_hoa', 'Xã Mộc Hoá', 'moc_hoa', '27823', 'xã', 2742, 'hienthi', 0, 1759490174, NULL),
(27841, 80, 0, 0, 'xa_hau_thanh', 'Xã Hậu Thạnh', 'hau_thanh', '27841', 'xã', 2743, 'hienthi', 0, 1759490174, NULL),
(27838, 80, 0, 0, 'xa_nhon_hoa_lap', 'Xã Nhơn Hòa Lập', 'nhon_hoa_lap', '27838', 'xã', 2744, 'hienthi', 0, 1759490174, NULL),
(27856, 80, 0, 0, 'xa_nhon_ninh', 'Xã Nhơn Ninh', 'nhon_ninh', '27856', 'xã', 2745, 'hienthi', 0, 1759490174, NULL),
(27826, 80, 0, 0, 'xa_tan_thanh', 'Xã Tân Thạnh', 'tan_thanh', '27826', 'xã', 2746, 'hienthi', 0, 1759490174, NULL),
(27868, 80, 0, 0, 'xa_binh_thanh', 'Xã Bình Thành', 'binh_thanh', '27868', 'xã', 2747, 'hienthi', 0, 1759490174, NULL),
(27877, 80, 0, 0, 'xa_thanh_phuoc', 'Xã Thạnh Phước', 'thanh_phuoc', '27877', 'xã', 2748, 'hienthi', 0, 1759490174, NULL),
(27865, 80, 0, 0, 'xa_thanh_hoa', 'Xã Thạnh Hóa', 'thanh_hoa', '27865', 'xã', 2749, 'hienthi', 0, 1759490174, NULL),
(27889, 80, 0, 0, 'xa_tan_tay', 'Xã Tân Tây', 'tan_tay', '27889', 'xã', 2750, 'hienthi', 0, 1759490174, NULL),
(28036, 80, 0, 0, 'xa_thu_thua', 'Xã Thủ Thừa', 'thu_thua', '28036', 'xã', 2751, 'hienthi', 0, 1759490174, NULL),
(28066, 80, 0, 0, 'xa_my_an', 'Xã Mỹ An', 'my_an', '28066', 'xã', 2752, 'hienthi', 0, 1759490174, NULL),
(28051, 80, 0, 0, 'xa_my_thanh', 'Xã Mỹ Thạnh', 'my_thanh', '28051', 'xã', 2753, 'hienthi', 0, 1759490174, NULL),
(28072, 80, 0, 0, 'xa_tan_long', 'Xã Tân Long', 'tan_long', '28072', 'xã', 2754, 'hienthi', 0, 1759490174, NULL),
(27907, 80, 0, 0, 'xa_my_quy', 'Xã Mỹ Quý', 'my_quy', '27907', 'xã', 2755, 'hienthi', 0, 1759490174, NULL),
(27898, 80, 0, 0, 'xa_dong_thanh', 'Xã Đông Thành', 'dong_thanh', '27898', 'xã', 2756, 'hienthi', 0, 1759490174, NULL),
(27925, 80, 0, 0, 'xa_duc_hue', 'Xã Đức Huệ', 'duc_hue', '27925', 'xã', 2757, 'hienthi', 0, 1759490174, NULL),
(27943, 80, 0, 0, 'xa_an_ninh', 'Xã An Ninh', 'an_ninh', '27943', 'xã', 2758, 'hienthi', 0, 1759490174, NULL),
(27952, 80, 0, 0, 'xa_hiep_hoa', 'Xã Hiệp Hoà', 'hiep_hoa', '27952', 'xã', 2759, 'hienthi', 0, 1759490174, NULL),
(27931, 80, 0, 0, 'xa_hau_nghia', 'Xã Hậu Nghĩa', 'hau_nghia', '27931', 'xã', 2760, 'hienthi', 0, 1759490174, NULL),
(27979, 80, 0, 0, 'xa_hoa_khanh', 'Xã Hoà Khánh', 'hoa_khanh', '27979', 'xã', 2761, 'hienthi', 0, 1759490174, NULL),
(27964, 80, 0, 0, 'xa_duc_lap', 'Xã Đức Lập', 'duc_lap', '27964', 'xã', 2762, 'hienthi', 0, 1759490174, NULL),
(27976, 80, 0, 0, 'xa_my_hanh', 'Xã Mỹ Hạnh', 'my_hanh', '27976', 'xã', 2763, 'hienthi', 0, 1759490174, NULL),
(27937, 80, 0, 0, 'xa_duc_hoa', 'Xã Đức Hòa', 'duc_hoa', '27937', 'xã', 2764, 'hienthi', 0, 1759490174, NULL),
(27994, 80, 0, 0, 'xa_thanh_loi', 'Xã Thạnh Lợi', 'thanh_loi', '27994', 'xã', 2765, 'hienthi', 0, 1759490174, NULL),
(28015, 80, 0, 0, 'xa_binh_duc', 'Xã Bình Đức', 'binh_duc', '28015', 'xã', 2766, 'hienthi', 0, 1759490174, NULL),
(28003, 80, 0, 0, 'xa_luong_hoa', 'Xã Lương Hoà', 'luong_hoa', '28003', 'xã', 2767, 'hienthi', 0, 1759490174, NULL),
(27991, 80, 0, 0, 'xa_ben_luc', 'Xã Bến Lức', 'ben_luc', '27991', 'xã', 2768, 'hienthi', 0, 1759490174, NULL),
(28018, 80, 0, 0, 'xa_my_yen', 'Xã Mỹ Yên', 'my_yen', '28018', 'xã', 2769, 'hienthi', 0, 1759490174, NULL),
(28126, 80, 0, 0, 'xa_long_cang', 'Xã Long Cang', 'long_cang', '28126', 'xã', 2770, 'hienthi', 0, 1759490174, NULL),
(28114, 80, 0, 0, 'xa_rach_kien', 'Xã Rạch Kiến', 'rach_kien', '28114', 'xã', 2771, 'hienthi', 0, 1759490174, NULL),
(28132, 80, 0, 0, 'xa_my_le', 'Xã Mỹ Lệ', 'my_le', '28132', 'xã', 2772, 'hienthi', 0, 1759490174, NULL),
(28138, 80, 0, 0, 'xa_tan_lan', 'Xã Tân Lân', 'tan_lan', '28138', 'xã', 2773, 'hienthi', 0, 1759490174, NULL),
(28108, 80, 0, 0, 'xa_can_duoc', 'Xã Cần Đước', 'can_duoc', '28108', 'xã', 2774, 'hienthi', 0, 1759490174, NULL),
(28144, 80, 0, 0, 'xa_long_huu', 'Xã Long Hựu', 'long_huu', '28144', 'xã', 2775, 'hienthi', 0, 1759490174, NULL),
(28165, 80, 0, 0, 'xa_phuoc_ly', 'Xã Phước Lý', 'phuoc_ly', '28165', 'xã', 2776, 'hienthi', 0, 1759490174, NULL),
(28177, 80, 0, 0, 'xa_my_loc', 'Xã Mỹ Lộc', 'my_loc', '28177', 'xã', 2777, 'hienthi', 0, 1759490174, NULL),
(28159, 80, 0, 0, 'xa_can_giuoc', 'Xã Cần Giuộc', 'can_giuoc', '28159', 'xã', 2778, 'hienthi', 0, 1759490174, NULL),
(28201, 80, 0, 0, 'xa_phuoc_vinh_tay', 'Xã Phước Vĩnh Tây', 'phuoc_vinh_tay', '28201', 'xã', 2779, 'hienthi', 0, 1759490174, NULL),
(28207, 80, 0, 0, 'xa_tan_tap', 'Xã Tân Tập', 'tan_tap', '28207', 'xã', 2780, 'hienthi', 0, 1759490174, NULL),
(28093, 80, 0, 0, 'xa_vam_co', 'Xã Vàm Cỏ', 'vam_co', '28093', 'xã', 2781, 'hienthi', 0, 1759490174, NULL),
(28075, 80, 0, 0, 'xa_tan_tru', 'Xã Tân Trụ', 'tan_tru', '28075', 'xã', 2782, 'hienthi', 0, 1759490174, NULL),
(28087, 80, 0, 0, 'xa_nhut_tao', 'Xã Nhựt Tảo', 'nhut_tao', '28087', 'xã', 2783, 'hienthi', 0, 1759490174, NULL),
(28225, 80, 0, 0, 'xa_thuan_my', 'Xã Thuận Mỹ', 'thuan_my', '28225', 'xã', 2784, 'hienthi', 0, 1759490174, NULL),
(28243, 80, 0, 0, 'xa_an_luc_long', 'Xã An Lục Long', 'an_luc_long', '28243', 'xã', 2785, 'hienthi', 0, 1759490174, NULL),
(28210, 80, 0, 0, 'xa_tam_vu', 'Xã Tầm Vu', 'tam_vu', '28210', 'xã', 2786, 'hienthi', 0, 1759490174, NULL),
(28222, 80, 0, 0, 'xa_vinh_cong', 'Xã Vĩnh Công', 'vinh_cong', '28222', 'xã', 2787, 'hienthi', 0, 1759490174, NULL),
(27694, 80, 0, 0, 'phuong_long_an', 'Phường Long An', 'long_an', '27694', 'phường', 2788, 'hienthi', 0, 1759490174, NULL),
(27712, 80, 0, 0, 'phuong_tan_an', 'Phường Tân An', 'tan_an', '27712', 'phường', 2789, 'hienthi', 0, 1759490174, NULL),
(27715, 80, 0, 0, 'phuong_khanh_hau', 'Phường Khánh Hậu', 'khanh_hau', '27715', 'phường', 2790, 'hienthi', 0, 1759490174, NULL),
(25459, 80, 0, 0, 'phuong_tan_ninh', 'Phường Tân Ninh', 'tan_ninh', '25459', 'phường', 2791, 'hienthi', 0, 1759490174, NULL),
(25480, 80, 0, 0, 'phuong_binh_minh', 'Phường Bình Minh', 'binh_minh', '25480', 'phường', 2792, 'hienthi', 0, 1759490174, NULL),
(25567, 80, 0, 0, 'phuong_ninh_thanh', 'Phường Ninh Thạnh', 'ninh_thanh', '25567', 'phường', 2793, 'hienthi', 0, 1759490174, NULL),
(25630, 80, 0, 0, 'phuong_long_hoa', 'Phường Long Hoa', 'long_hoa', '25630', 'phường', 2794, 'hienthi', 0, 1759490174, NULL),
(25645, 80, 0, 0, 'phuong_hoa_thanh', 'Phường Hoà Thành', 'hoa_thanh', '25645', 'phường', 2795, 'hienthi', 0, 1759490174, NULL),
(25633, 80, 0, 0, 'phuong_thanh_dien', 'Phường Thanh Điền', 'thanh_dien', '25633', 'phường', 2796, 'hienthi', 0, 1759490174, NULL),
(25708, 80, 0, 0, 'phuong_trang_bang', 'Phường Trảng Bàng', 'trang_bang', '25708', 'phường', 2797, 'hienthi', 0, 1759490174, NULL),
(25732, 80, 0, 0, 'phuong_an_tinh', 'Phường An Tịnh', 'an_tinh', '25732', 'phường', 2798, 'hienthi', 0, 1759490174, NULL),
(25654, 80, 0, 0, 'phuong_go_dau', 'Phường Gò Dầu', 'go_dau', '25654', 'phường', 2799, 'hienthi', 0, 1759490174, NULL),
(25672, 80, 0, 0, 'phuong_gia_loc', 'Phường Gia Lộc', 'gia_loc', '25672', 'phường', 2800, 'hienthi', 0, 1759490174, NULL),
(25711, 80, 0, 0, 'xa_hung_thuan', 'Xã Hưng Thuận', 'hung_thuan', '25711', 'xã', 2801, 'hienthi', 0, 1759490174, NULL),
(25729, 80, 0, 0, 'xa_phuoc_chi', 'Xã Phước Chỉ', 'phuoc_chi', '25729', 'xã', 2802, 'hienthi', 0, 1759490174, NULL),
(25657, 80, 0, 0, 'xa_thanh_duc', 'Xã Thạnh Đức', 'thanh_duc', '25657', 'xã', 2803, 'hienthi', 0, 1759490174, NULL),
(25663, 80, 0, 0, 'xa_phuoc_thanh', 'Xã Phước Thạnh', 'phuoc_thanh', '25663', 'xã', 2804, 'hienthi', 0, 1759490174, NULL),
(25666, 80, 0, 0, 'xa_truong_mit', 'Xã Truông Mít', 'truong_mit', '25666', 'xã', 2805, 'hienthi', 0, 1759490174, NULL),
(25579, 80, 0, 0, 'xa_loc_ninh', 'Xã Lộc Ninh', 'loc_ninh', '25579', 'xã', 2806, 'hienthi', 0, 1759490174, NULL),
(25573, 80, 0, 0, 'xa_cau_khoi', 'Xã Cầu Khởi', 'cau_khoi', '25573', 'xã', 2807, 'hienthi', 0, 1759490174, NULL),
(25552, 80, 0, 0, 'xa_duong_minh_chau', 'Xã Dương Minh Châu', 'duong_minh_chau', '25552', 'xã', 2808, 'hienthi', 0, 1759490174, NULL),
(25522, 80, 0, 0, 'xa_tan_dong', 'Xã Tân Đông', 'tan_dong', '25522', 'xã', 2809, 'hienthi', 0, 1759490174, NULL),
(25516, 80, 0, 0, 'xa_tan_chau', 'Xã Tân Châu', 'tan_chau', '25516', 'xã', 2810, 'hienthi', 0, 1759490174, NULL),
(25549, 80, 0, 0, 'xa_tan_phu', 'Xã Tân Phú', 'tan_phu', '25549', 'xã', 2811, 'hienthi', 0, 1759490174, NULL),
(25525, 80, 0, 0, 'xa_tan_hoi', 'Xã Tân Hội', 'tan_hoi', '25525', 'xã', 2812, 'hienthi', 0, 1759490174, NULL),
(25534, 80, 0, 0, 'xa_tan_thanh', 'Xã Tân Thành', 'tan_thanh', '25534', 'xã', 2813, 'hienthi', 0, 1759490174, NULL),
(25531, 80, 0, 0, 'xa_tan_hoa', 'Xã Tân Hòa', 'tan_hoa', '25531', 'xã', 2814, 'hienthi', 0, 1759490174, NULL),
(25489, 80, 0, 0, 'xa_tan_lap', 'Xã Tân Lập', 'tan_lap', '25489', 'xã', 2815, 'hienthi', 0, 1759490174, NULL),
(25486, 80, 0, 0, 'xa_tan_bien', 'Xã Tân Biên', 'tan_bien', '25486', 'xã', 2816, 'hienthi', 0, 1759490174, NULL),
(25498, 80, 0, 0, 'xa_thanh_binh', 'Xã Thạnh Bình', 'thanh_binh', '25498', 'xã', 2817, 'hienthi', 0, 1759490174, NULL),
(25510, 80, 0, 0, 'xa_tra_vong', 'Xã Trà Vong', 'tra_vong', '25510', 'xã', 2818, 'hienthi', 0, 1759490174, NULL),
(25591, 80, 0, 0, 'xa_phuoc_vinh', 'Xã Phước Vinh', 'phuoc_vinh', '25591', 'xã', 2819, 'hienthi', 0, 1759490174, NULL),
(25606, 80, 0, 0, 'xa_hoa_hoi', 'Xã Hoà Hội', 'hoa_hoi', '25606', 'xã', 2820, 'hienthi', 0, 1759490174, NULL),
(25621, 80, 0, 0, 'xa_ninh_dien', 'Xã Ninh Điền', 'ninh_dien', '25621', 'xã', 2821, 'hienthi', 0, 1759490174, NULL),
(25585, 80, 0, 0, 'xa_chau_thanh', 'Xã Châu Thành', 'chau_thanh', '25585', 'xã', 2822, 'hienthi', 0, 1759490174, NULL),
(25588, 80, 0, 0, 'xa_hao_duoc', 'Xã Hảo Đước', 'hao_duoc', '25588', 'xã', 2823, 'hienthi', 0, 1759490174, NULL),
(25684, 80, 0, 0, 'xa_long_chu', 'Xã Long Chữ', 'long_chu', '25684', 'xã', 2824, 'hienthi', 0, 1759490174, NULL),
(25702, 80, 0, 0, 'xa_long_thuan', 'Xã Long Thuận', 'long_thuan', '25702', 'xã', 2825, 'hienthi', 0, 1759490174, NULL),
(25681, 80, 0, 0, 'xa_ben_cau', 'Xã Bến Cầu', 'ben_cau', '25681', 'xã', 2826, 'hienthi', 0, 1759490174, NULL),
(28261, 82, 0, 0, 'phuong_my_tho', 'Phường Mỹ Tho', 'my_tho', '28261', 'phường', 2827, 'hienthi', 0, 1759490174, NULL),
(28249, 82, 0, 0, 'phuong_dao_thanh', 'Phường Đạo Thạnh', 'dao_thanh', '28249', 'phường', 2828, 'hienthi', 0, 1759490174, NULL),
(28273, 82, 0, 0, 'phuong_my_phong', 'Phường Mỹ Phong', 'my_phong', '28273', 'phường', 2829, 'hienthi', 0, 1759490174, NULL),
(28270, 82, 0, 0, 'phuong_thoi_son', 'Phường Thới Sơn', 'thoi_son', '28270', 'phường', 2830, 'hienthi', 0, 1759490174, NULL),
(28285, 82, 0, 0, 'phuong_trung_an', 'Phường Trung An', 'trung_an', '28285', 'phường', 2831, 'hienthi', 0, 1759490174, NULL),
(28306, 82, 0, 0, 'phuong_go_cong', 'Phường Gò Công', 'go_cong', '28306', 'phường', 2832, 'hienthi', 0, 1759490174, NULL),
(28297, 82, 0, 0, 'phuong_long_thuan', 'Phường Long Thuận', 'long_thuan', '28297', 'phường', 2833, 'hienthi', 0, 1759490174, NULL),
(28729, 82, 0, 0, 'phuong_son_qui', 'Phường Sơn Qui', 'son_qui', '28729', 'phường', 2834, 'hienthi', 0, 1759490174, NULL),
(28315, 82, 0, 0, 'phuong_binh_xuan', 'Phường Bình Xuân', 'binh_xuan', '28315', 'phường', 2835, 'hienthi', 0, 1759490174, NULL),
(28435, 82, 0, 0, 'phuong_my_phuoc_tay', 'Phường Mỹ Phước Tây', 'my_phuoc_tay', '28435', 'phường', 2836, 'hienthi', 0, 1759490174, NULL),
(28436, 82, 0, 0, 'phuong_thanh_hoa', 'Phường Thanh Hòa', 'thanh_hoa', '28436', 'phường', 2837, 'hienthi', 0, 1759490174, NULL),
(28439, 82, 0, 0, 'phuong_cai_lay', 'Phường Cai Lậy', 'cai_lay', '28439', 'phường', 2838, 'hienthi', 0, 1759490174, NULL),
(28477, 82, 0, 0, 'phuong_nhi_quy', 'Phường Nhị Quý', 'nhi_quy', '28477', 'phường', 2839, 'hienthi', 0, 1759490174, NULL),
(28468, 82, 0, 0, 'xa_tan_phu', 'Xã Tân Phú', 'tan_phu', '28468', 'xã', 2840, 'hienthi', 0, 1759490174, NULL),
(28426, 82, 0, 0, 'xa_thanh_hung', 'Xã Thanh Hưng', 'thanh_hung', '28426', 'xã', 2841, 'hienthi', 0, 1759490174, NULL),
(28429, 82, 0, 0, 'xa_an_huu', 'Xã An Hữu', 'an_huu', '28429', 'xã', 2842, 'hienthi', 0, 1759490174, NULL),
(28414, 82, 0, 0, 'xa_my_loi', 'Xã Mỹ Lợi', 'my_loi', '28414', 'xã', 2843, 'hienthi', 0, 1759490174, NULL),
(28405, 82, 0, 0, 'xa_my_duc_tay', 'Xã Mỹ Đức Tây', 'my_duc_tay', '28405', 'xã', 2844, 'hienthi', 0, 1759490174, NULL),
(28378, 82, 0, 0, 'xa_my_thien', 'Xã Mỹ Thiện', 'my_thien', '28378', 'xã', 2845, 'hienthi', 0, 1759490174, NULL),
(28366, 82, 0, 0, 'xa_hau_my', 'Xã Hậu Mỹ', 'hau_my', '28366', 'xã', 2846, 'hienthi', 0, 1759490174, NULL),
(28393, 82, 0, 0, 'xa_hoi_cu', 'Xã Hội Cư', 'hoi_cu', '28393', 'xã', 2847, 'hienthi', 0, 1759490174, NULL),
(28360, 82, 0, 0, 'xa_cai_be', 'Xã Cái Bè', 'cai_be', '28360', 'xã', 2848, 'hienthi', 0, 1759490174, NULL),
(28471, 82, 0, 0, 'xa_binh_phu', 'Xã Bình Phú', 'binh_phu', '28471', 'xã', 2849, 'hienthi', 0, 1759490174, NULL),
(28501, 82, 0, 0, 'xa_hiep_duc', 'Xã Hiệp Đức', 'hiep_duc', '28501', 'xã', 2850, 'hienthi', 0, 1759490174, NULL),
(28516, 82, 0, 0, 'xa_ngu_hiep', 'Xã Ngũ Hiệp', 'ngu_hiep', '28516', 'xã', 2851, 'hienthi', 0, 1759490174, NULL),
(28504, 82, 0, 0, 'xa_long_tien', 'Xã Long Tiên', 'long_tien', '28504', 'xã', 2852, 'hienthi', 0, 1759490174, NULL),
(28456, 82, 0, 0, 'xa_my_thanh', 'Xã Mỹ Thành', 'my_thanh', '28456', 'xã', 2853, 'hienthi', 0, 1759490174, NULL),
(28444, 82, 0, 0, 'xa_thanh_phu', 'Xã Thạnh Phú', 'thanh_phu', '28444', 'xã', 2854, 'hienthi', 0, 1759490174, NULL),
(28321, 82, 0, 0, 'xa_tan_phuoc_1', 'Xã Tân Phước 1', 'tan_phuoc_1', '28321', 'xã', 2855, 'hienthi', 0, 1759490174, NULL),
(28327, 82, 0, 0, 'xa_tan_phuoc_2', 'Xã Tân Phước 2', 'tan_phuoc_2', '28327', 'xã', 2856, 'hienthi', 0, 1759490174, NULL),
(28345, 82, 0, 0, 'xa_tan_phuoc_3', 'Xã Tân Phước 3', 'tan_phuoc_3', '28345', 'xã', 2857, 'hienthi', 0, 1759490174, NULL),
(28336, 82, 0, 0, 'xa_hung_thanh', 'Xã Hưng Thạnh', 'hung_thanh', '28336', 'xã', 2858, 'hienthi', 0, 1759490174, NULL),
(28525, 82, 0, 0, 'xa_tan_huong', 'Xã Tân Hương', 'tan_huong', '28525', 'xã', 2859, 'hienthi', 0, 1759490174, NULL),
(28519, 82, 0, 0, 'xa_chau_thanh', 'Xã Châu Thành', 'chau_thanh', '28519', 'xã', 2860, 'hienthi', 0, 1759490174, NULL),
(28537, 82, 0, 0, 'xa_long_hung', 'Xã Long Hưng', 'long_hung', '28537', 'xã', 2861, 'hienthi', 0, 1759490174, NULL),
(28543, 82, 0, 0, 'xa_long_dinh', 'Xã Long Định', 'long_dinh', '28543', 'xã', 2862, 'hienthi', 0, 1759490174, NULL),
(28576, 82, 0, 0, 'xa_vinh_kim', 'Xã Vĩnh Kim', 'vinh_kim', '28576', 'xã', 2863, 'hienthi', 0, 1759490174, NULL),
(28582, 82, 0, 0, 'xa_kim_son', 'Xã Kim Sơn', 'kim_son', '28582', 'xã', 2864, 'hienthi', 0, 1759490174, NULL),
(28564, 82, 0, 0, 'xa_binh_trung', 'Xã Bình Trưng', 'binh_trung', '28564', 'xã', 2865, 'hienthi', 0, 1759490174, NULL),
(28603, 82, 0, 0, 'xa_my_tinh_an', 'Xã Mỹ Tịnh An', 'my_tinh_an', '28603', 'xã', 2866, 'hienthi', 0, 1759490174, NULL),
(28615, 82, 0, 0, 'xa_luong_hoa_lac', 'Xã Lương Hòa Lạc', 'luong_hoa_lac', '28615', 'xã', 2867, 'hienthi', 0, 1759490174, NULL),
(28627, 82, 0, 0, 'xa_tan_thuan_binh', 'Xã Tân Thuận Bình', 'tan_thuan_binh', '28627', 'xã', 2868, 'hienthi', 0, 1759490174, NULL),
(28594, 82, 0, 0, 'xa_cho_gao', 'Xã Chợ Gạo', 'cho_gao', '28594', 'xã', 2869, 'hienthi', 0, 1759490174, NULL),
(28633, 82, 0, 0, 'xa_an_thanh_thuy', 'Xã An Thạnh Thủy', 'an_thanh_thuy', '28633', 'xã', 2870, 'hienthi', 0, 1759490174, NULL),
(28648, 82, 0, 0, 'xa_binh_ninh', 'Xã Bình Ninh', 'binh_ninh', '28648', 'xã', 2871, 'hienthi', 0, 1759490174, NULL),
(28651, 82, 0, 0, 'xa_vinh_binh', 'Xã Vĩnh Bình', 'vinh_binh', '28651', 'xã', 2872, 'hienthi', 0, 1759490174, NULL),
(28660, 82, 0, 0, 'xa_dong_son', 'Xã Đồng Sơn', 'dong_son', '28660', 'xã', 2873, 'hienthi', 0, 1759490174, NULL),
(28663, 82, 0, 0, 'xa_phu_thanh', 'Xã Phú Thành', 'phu_thanh', '28663', 'xã', 2874, 'hienthi', 0, 1759490174, NULL),
(28687, 82, 0, 0, 'xa_long_binh', 'Xã Long Bình', 'long_binh', '28687', 'xã', 2875, 'hienthi', 0, 1759490174, NULL),
(28678, 82, 0, 0, 'xa_vinh_huu', 'Xã Vĩnh Hựu', 'vinh_huu', '28678', 'xã', 2876, 'hienthi', 0, 1759490174, NULL),
(28747, 82, 0, 0, 'xa_go_cong_dong', 'Xã Gò Công Đông', 'go_cong_dong', '28747', 'xã', 2877, 'hienthi', 0, 1759490174, NULL),
(28738, 82, 0, 0, 'xa_tan_dien', 'Xã Tân Điền', 'tan_dien', '28738', 'xã', 2878, 'hienthi', 0, 1759490174, NULL),
(28702, 82, 0, 0, 'xa_tan_hoa', 'Xã Tân Hòa', 'tan_hoa', '28702', 'xã', 2879, 'hienthi', 0, 1759490174, NULL),
(28723, 82, 0, 0, 'xa_tan_dong', 'Xã Tân Đông', 'tan_dong', '28723', 'xã', 2880, 'hienthi', 0, 1759490174, NULL),
(28720, 82, 0, 0, 'xa_gia_thuan', 'Xã Gia Thuận', 'gia_thuan', '28720', 'xã', 2881, 'hienthi', 0, 1759490174, NULL),
(28693, 82, 0, 0, 'xa_tan_thoi', 'Xã Tân Thới', 'tan_thoi', '28693', 'xã', 2882, 'hienthi', 0, 1759490174, NULL),
(28696, 82, 0, 0, 'xa_tan_phu_dong', 'Xã Tân Phú Đông', 'tan_phu_dong', '28696', 'xã', 2883, 'hienthi', 0, 1759490174, NULL),
(29926, 82, 0, 0, 'xa_tan_hong', 'Xã Tân Hồng', 'tan_hong', '29926', 'xã', 2884, 'hienthi', 0, 1759490174, NULL),
(29938, 82, 0, 0, 'xa_tan_thanh', 'Xã Tân Thành', 'tan_thanh', '29938', 'xã', 2885, 'hienthi', 0, 1759490174, NULL),
(29929, 82, 0, 0, 'xa_tan_ho_co', 'Xã Tân Hộ Cơ', 'tan_ho_co', '29929', 'xã', 2886, 'hienthi', 0, 1759490174, NULL),
(29944, 82, 0, 0, 'xa_an_phuoc', 'Xã An Phước', 'an_phuoc', '29944', 'xã', 2887, 'hienthi', 0, 1759490174, NULL),
(29954, 82, 0, 0, 'phuong_an_binh', 'Phường An Bình', 'an_binh', '29954', 'phường', 2888, 'hienthi', 0, 1759490174, NULL),
(29955, 82, 0, 0, 'phuong_hong_ngu', 'Phường Hồng Ngự', 'hong_ngu', '29955', 'phường', 2889, 'hienthi', 0, 1759490174, NULL),
(29978, 82, 0, 0, 'phuong_thuong_lac', 'Phường Thường Lạc', 'thuong_lac', '29978', 'phường', 2890, 'hienthi', 0, 1759490174, NULL),
(29971, 82, 0, 0, 'xa_thuong_phuoc', 'Xã Thường Phước', 'thuong_phuoc', '29971', 'xã', 2891, 'hienthi', 0, 1759490174, NULL),
(29983, 82, 0, 0, 'xa_long_khanh', 'Xã Long Khánh', 'long_khanh', '29983', 'xã', 2892, 'hienthi', 0, 1759490174, NULL),
(29992, 82, 0, 0, 'xa_long_phu_thuan', 'Xã Long Phú Thuận', 'long_phu_thuan', '29992', 'xã', 2893, 'hienthi', 0, 1759490174, NULL),
(30019, 82, 0, 0, 'xa_an_hoa', 'Xã An Hòa', 'an_hoa', '30019', 'xã', 2894, 'hienthi', 0, 1759490174, NULL),
(30010, 82, 0, 0, 'xa_tam_nong', 'Xã Tam Nông', 'tam_nong', '30010', 'xã', 2895, 'hienthi', 0, 1759490174, NULL),
(30034, 82, 0, 0, 'xa_phu_tho', 'Xã Phú Thọ', 'phu_tho', '30034', 'xã', 2896, 'hienthi', 0, 1759490174, NULL),
(30001, 82, 0, 0, 'xa_tram_chim', 'Xã Tràm Chim', 'tram_chim', '30001', 'xã', 2897, 'hienthi', 0, 1759490174, NULL),
(30025, 82, 0, 0, 'xa_phu_cuong', 'Xã Phú Cường', 'phu_cuong', '30025', 'xã', 2898, 'hienthi', 0, 1759490174, NULL),
(30028, 82, 0, 0, 'xa_an_long', 'Xã An Long', 'an_long', '30028', 'xã', 2899, 'hienthi', 0, 1759490174, NULL),
(30130, 82, 0, 0, 'xa_thanh_binh', 'Xã Thanh Bình', 'thanh_binh', '30130', 'xã', 2900, 'hienthi', 0, 1759490174, NULL),
(30157, 82, 0, 0, 'xa_tan_thanh', 'Xã Tân Thạnh', 'tan_thanh', '30157', 'xã', 2901, 'hienthi', 0, 1759490174, NULL),
(30163, 82, 0, 0, 'xa_binh_thanh', 'Xã Bình Thành', 'binh_thanh', '30163', 'xã', 2902, 'hienthi', 0, 1759490174, NULL),
(30154, 82, 0, 0, 'xa_tan_long', 'Xã Tân Long', 'tan_long', '30154', 'xã', 2903, 'hienthi', 0, 1759490174, NULL),
(30037, 82, 0, 0, 'xa_thap_muoi', 'Xã Tháp Mười', 'thap_muoi', '30037', 'xã', 2904, 'hienthi', 0, 1759490174, NULL),
(30073, 82, 0, 0, 'xa_thanh_my', 'Xã Thanh Mỹ', 'thanh_my', '30073', 'xã', 2905, 'hienthi', 0, 1759490174, NULL),
(30055, 82, 0, 0, 'xa_my_qui', 'Xã Mỹ Quí', 'my_qui', '30055', 'xã', 2906, 'hienthi', 0, 1759490174, NULL),
(30061, 82, 0, 0, 'xa_doc_binh_kieu', 'Xã Đốc Binh Kiều', 'doc_binh_kieu', '30061', 'xã', 2907, 'hienthi', 0, 1759490174, NULL),
(30046, 82, 0, 0, 'xa_truong_xuan', 'Xã Trường Xuân', 'truong_xuan', '30046', 'xã', 2908, 'hienthi', 0, 1759490174, NULL),
(30043, 82, 0, 0, 'xa_phuong_thinh', 'Xã Phương Thịnh', 'thinh', '30043', 'xã', 2909, 'hienthi', 0, 1759490174, NULL),
(30088, 82, 0, 0, 'xa_phong_my', 'Xã Phong Mỹ', 'phong_my', '30088', 'xã', 2910, 'hienthi', 0, 1759490174, NULL),
(30085, 82, 0, 0, 'xa_ba_sao', 'Xã Ba Sao', 'ba_sao', '30085', 'xã', 2911, 'hienthi', 0, 1759490174, NULL),
(30076, 82, 0, 0, 'xa_my_tho', 'Xã Mỹ Thọ', 'my_tho', '30076', 'xã', 2912, 'hienthi', 0, 1759490174, NULL),
(30118, 82, 0, 0, 'xa_binh_hang_trung', 'Xã Bình Hàng Trung', 'binh_hang_trung', '30118', 'xã', 2913, 'hienthi', 0, 1759490174, NULL),
(30112, 82, 0, 0, 'xa_my_hiep', 'Xã Mỹ Hiệp', 'my_hiep', '30112', 'xã', 2914, 'hienthi', 0, 1759490174, NULL),
(29869, 82, 0, 0, 'phuong_cao_lanh', 'Phường Cao Lãnh', 'cao_lanh', '29869', 'phường', 2915, 'hienthi', 0, 1759490174, NULL),
(29884, 82, 0, 0, 'phuong_my_ngai', 'Phường Mỹ Ngãi', 'my_ngai', '29884', 'phường', 2916, 'hienthi', 0, 1759490174, NULL),
(29888, 82, 0, 0, 'phuong_my_tra', 'Phường Mỹ Trà', 'my_tra', '29888', 'phường', 2917, 'hienthi', 0, 1759490174, NULL),
(30178, 82, 0, 0, 'xa_my_an_hung', 'Xã Mỹ An Hưng', 'my_an_hung', '30178', 'xã', 2918, 'hienthi', 0, 1759490174, NULL),
(30184, 82, 0, 0, 'xa_tan_khanh_trung', 'Xã Tân Khánh Trung', 'tan_khanh_trung', '30184', 'xã', 2919, 'hienthi', 0, 1759490174, NULL),
(30169, 82, 0, 0, 'xa_lap_vo', 'Xã Lấp Vò', 'lap_vo', '30169', 'xã', 2920, 'hienthi', 0, 1759490174, NULL),
(30226, 82, 0, 0, 'xa_lai_vung', 'Xã Lai Vung', 'lai_vung', '30226', 'xã', 2921, 'hienthi', 0, 1759490174, NULL),
(30208, 82, 0, 0, 'xa_hoa_long', 'Xã Hòa Long', 'hoa_long', '30208', 'xã', 2922, 'hienthi', 0, 1759490174, NULL),
(30235, 82, 0, 0, 'xa_phong_hoa', 'Xã Phong Hòa', 'phong_hoa', '30235', 'xã', 2923, 'hienthi', 0, 1759490174, NULL),
(29905, 82, 0, 0, 'phuong_sa_dec', 'Phường Sa Đéc', 'sa_dec', '29905', 'phường', 2924, 'hienthi', 0, 1759490174, NULL),
(30214, 82, 0, 0, 'xa_tan_duong', 'Xã Tân Dương', 'tan_duong', '30214', 'xã', 2925, 'hienthi', 0, 1759490174, NULL),
(30244, 82, 0, 0, 'xa_phu_huu', 'Xã Phú Hựu', 'phu_huu', '30244', 'xã', 2926, 'hienthi', 0, 1759490174, NULL),
(30253, 82, 0, 0, 'xa_tan_nhuan_dong', 'Xã Tân Nhuận Đông', 'tan_nhuan_dong', '30253', 'xã', 2927, 'hienthi', 0, 1759490174, NULL),
(30259, 82, 0, 0, 'xa_tan_phu_trung', 'Xã Tân Phú Trung', 'tan_phu_trung', '30259', 'xã', 2928, 'hienthi', 0, 1759490174, NULL),
(29641, 86, 0, 0, 'xa_cai_nhum', 'Xã Cái Nhum', 'cai_nhum', '29641', 'xã', 2929, 'hienthi', 0, 1759490174, NULL),
(29653, 86, 0, 0, 'xa_tan_long_hoi', 'Xã Tân Long Hội', 'tan_long_hoi', '29653', 'xã', 2930, 'hienthi', 0, 1759490174, NULL),
(29623, 86, 0, 0, 'xa_nhon_phu', 'Xã Nhơn Phú', 'nhon_phu', '29623', 'xã', 2931, 'hienthi', 0, 1759490174, NULL),
(29638, 86, 0, 0, 'xa_binh_phuoc', 'Xã Bình Phước', 'binh_phuoc', '29638', 'xã', 2932, 'hienthi', 0, 1759490174, NULL),
(29584, 86, 0, 0, 'xa_an_binh', 'Xã An Bình', 'an_binh', '29584', 'xã', 2933, 'hienthi', 0, 1759490174, NULL),
(29602, 86, 0, 0, 'xa_long_ho', 'Xã Long Hồ', 'long_ho', '29602', 'xã', 2934, 'hienthi', 0, 1759490174, NULL),
(29611, 86, 0, 0, 'xa_phu_quoi', 'Xã Phú Quới', 'phu_quoi', '29611', 'xã', 2935, 'hienthi', 0, 1759490174, NULL),
(29590, 86, 0, 0, 'phuong_thanh_duc', 'Phường Thanh Đức', 'thanh_duc', '29590', 'xã', 2936, 'hienthi', 0, 1759490174, NULL),
(29551, 86, 0, 0, 'phuong_long_chau', 'Phường Long Châu', 'long_chau', '29551', 'xã', 2937, 'hienthi', 0, 1759490174, NULL),
(29557, 86, 0, 0, 'phuong_phuoc_hau', 'Phường Phước Hậu', 'phuoc_hau', '29557', 'xã', 2938, 'hienthi', 0, 1759490174, NULL),
(29593, 86, 0, 0, 'phuong_tan_hanh', 'Phường Tân Hạnh', 'tan_hanh', '29593', 'phường', 2939, 'hienthi', 0, 1759490174, NULL),
(29566, 86, 0, 0, 'phuong_tan_ngai', 'Phường Tân Ngãi', 'tan_ngai', '29566', 'phường', 2940, 'hienthi', 0, 1759490174, NULL),
(29677, 86, 0, 0, 'xa_quoi_thien', 'Xã Quới Thiện', 'quoi_thien', '29677', 'xã', 2941, 'hienthi', 0, 1759490174, NULL),
(29659, 86, 0, 0, 'xa_trung_thanh', 'Xã Trung Thành', 'trung_thanh', '29659', 'xã', 2942, 'hienthi', 0, 1759490174, NULL),
(29698, 86, 0, 0, 'xa_trung_ngai', 'Xã Trung Ngãi', 'trung_ngai', '29698', 'xã', 2943, 'hienthi', 0, 1759490174, NULL),
(29668, 86, 0, 0, 'xa_quoi_an', 'Xã Quới An', 'quoi_an', '29668', 'xã', 2944, 'hienthi', 0, 1759490174, NULL),
(29683, 86, 0, 0, 'xa_trung_hiep', 'Xã Trung Hiệp', 'trung_hiep', '29683', 'xã', 2945, 'hienthi', 0, 1759490174, NULL),
(29701, 86, 0, 0, 'xa_hieu_phung', 'Xã Hiếu Phụng', 'hieu_phung', '29701', 'xã', 2946, 'hienthi', 0, 1759490174, NULL),
(29713, 86, 0, 0, 'xa_hieu_thanh', 'Xã Hiếu Thành', 'hieu_thanh', '29713', 'xã', 2947, 'hienthi', 0, 1759490174, NULL),
(29857, 86, 0, 0, 'xa_luc_sy_thanh', 'Xã Lục Sỹ Thành', 'luc_sy_thanh', '29857', 'xã', 2948, 'hienthi', 0, 1759490174, NULL),
(29821, 86, 0, 0, 'xa_tra_on', 'Xã Trà Ôn', 'tra_on', '29821', 'xã', 2949, 'hienthi', 0, 1759490174, NULL),
(29836, 86, 0, 0, 'xa_tra_con', 'Xã Trà Côn', 'tra_con', '29836', 'xã', 2950, 'hienthi', 0, 1759490174, NULL),
(29845, 86, 0, 0, 'xa_vinh_xuan', 'Xã Vĩnh Xuân', 'vinh_xuan', '29845', 'xã', 2951, 'hienthi', 0, 1759490174, NULL),
(29830, 86, 0, 0, 'xa_hoa_binh', 'Xã Hòa Bình', 'hoa_binh', '29830', 'xã', 2952, 'hienthi', 0, 1759490174, NULL),
(29734, 86, 0, 0, 'xa_hoa_hiep', 'Xã Hòa Hiệp', 'hoa_hiep', '29734', 'xã', 2953, 'hienthi', 0, 1759490174, NULL),
(29719, 86, 0, 0, 'xa_tam_binh', 'Xã Tam Bình', 'tam_binh', '29719', 'xã', 2954, 'hienthi', 0, 1759490174, NULL),
(29767, 86, 0, 0, 'xa_ngai_tu', 'Xã Ngãi Tứ', 'ngai_tu', '29767', 'xã', 2955, 'hienthi', 0, 1759490174, NULL),
(29752, 86, 0, 0, 'xa_song_phu', 'Xã Song Phú', 'song_phu', '29752', 'xã', 2956, 'hienthi', 0, 1759490174, NULL),
(29728, 86, 0, 0, 'xa_cai_ngang', 'Xã Cái Ngang', 'cai_ngang', '29728', 'xã', 2957, 'hienthi', 0, 1759490174, NULL),
(29800, 86, 0, 0, 'xa_tan_quoi', 'Xã Tân Quới', 'tan_quoi', '29800', 'xã', 2958, 'hienthi', 0, 1759490174, NULL),
(29785, 86, 0, 0, 'xa_tan_luoc', 'Xã Tân Lược', 'tan_luoc', '29785', 'xã', 2959, 'hienthi', 0, 1759490174, NULL),
(29788, 86, 0, 0, 'xa_my_thuan', 'Xã Mỹ Thuận', 'my_thuan', '29788', 'xã', 2960, 'hienthi', 0, 1759490174, NULL),
(29771, 86, 0, 0, 'phuong_binh_minh', 'Phường Bình Minh', 'binh_minh', '29771', 'phường', 2961, 'hienthi', 0, 1759490174, NULL),
(29770, 86, 0, 0, 'phuong_cai_von', 'Phường Cái Vồn', 'cai_von', '29770', 'phường', 2962, 'hienthi', 0, 1759490174, NULL),
(29812, 86, 0, 0, 'phuong_dong_thanh', 'Phường Đông Thành', 'dong_thanh', '29812', 'phường', 2963, 'hienthi', 0, 1759490174, NULL),
(29263, 86, 0, 0, 'phuong_long_duc', 'Phường Long Đức', 'long_duc', '29263', 'phường', 2964, 'hienthi', 0, 1759490174, NULL),
(29242, 86, 0, 0, 'phuong_tra_vinh', 'Phường Trà Vinh', 'tra_vinh', '29242', 'phường', 2965, 'hienthi', 0, 1759490174, NULL),
(29254, 86, 0, 0, 'phuong_nguyet_hoa', 'Phường Nguyệt Hóa', 'nguyet_hoa', '29254', 'phường', 2966, 'hienthi', 0, 1759490174, NULL),
(29398, 86, 0, 0, 'phuong_hoa_thuan', 'Phường Hòa Thuận', 'hoa_thuan', '29398', 'phường', 2967, 'hienthi', 0, 1759490174, NULL),
(29275, 86, 0, 0, 'xa_an_truong', 'Xã An Trường', 'an_truong', '29275', 'xã', 2968, 'hienthi', 0, 1759490174, NULL),
(29278, 86, 0, 0, 'xa_tan_an', 'Xã Tân An', 'tan_an', '29278', 'xã', 2969, 'hienthi', 0, 1759490174, NULL),
(29266, 86, 0, 0, 'xa_cang_long', 'Xã Càng Long', 'cang_long', '29266', 'xã', 2970, 'hienthi', 0, 1759490174, NULL),
(29302, 86, 0, 0, 'xa_nhi_long', 'Xã Nhị Long', 'nhi_long', '29302', 'xã', 2971, 'hienthi', 0, 1759490174, NULL),
(29287, 86, 0, 0, 'xa_binh_phu', 'Xã Bình Phú', 'binh_phu', '29287', 'xã', 2972, 'hienthi', 0, 1759490174, NULL),
(29386, 86, 0, 0, 'xa_song_loc', 'Xã Song Lộc', 'song_loc', '29386', 'xã', 2973, 'hienthi', 0, 1759490174, NULL),
(29374, 86, 0, 0, 'xa_chau_thanh', 'Xã Châu Thành', 'chau_thanh', '29374', 'xã', 2974, 'hienthi', 0, 1759490174, NULL),
(29407, 86, 0, 0, 'xa_hung_my', 'Xã Hưng Mỹ', 'hung_my', '29407', 'xã', 2975, 'hienthi', 0, 1759490174, NULL),
(29410, 86, 0, 0, 'xa_hoa_minh', 'Xã Hòa Minh', 'hoa_minh', '29410', 'xã', 2976, 'hienthi', 0, 1759490174, NULL),
(29413, 86, 0, 0, 'xa_long_hoa', 'Xã Long Hòa', 'long_hoa', '29413', 'xã', 2977, 'hienthi', 0, 1759490174, NULL),
(29308, 86, 0, 0, 'xa_cau_ke', 'Xã Cầu Kè', 'cau_ke', '29308', 'xã', 2978, 'hienthi', 0, 1759490174, NULL),
(29329, 86, 0, 0, 'xa_phong_thanh', 'Xã Phong Thạnh', 'phong_thanh', '29329', 'xã', 2979, 'hienthi', 0, 1759490174, NULL),
(29317, 86, 0, 0, 'xa_an_phu_tan', 'Xã An Phú Tân', 'an_phu_tan', '29317', 'xã', 2980, 'hienthi', 0, 1759490174, NULL),
(29335, 86, 0, 0, 'xa_tam_ngai', 'Xã Tam Ngãi', 'tam_ngai', '29335', 'xã', 2981, 'hienthi', 0, 1759490174, NULL),
(29371, 86, 0, 0, 'xa_tan_hoa', 'Xã Tân Hòa', 'tan_hoa', '29371', 'xã', 2982, 'hienthi', 0, 1759490174, NULL),
(29362, 86, 0, 0, 'xa_hung_hoa', 'Xã Hùng Hòa', 'hung_hoa', '29362', 'xã', 2983, 'hienthi', 0, 1759490174, NULL),
(29341, 86, 0, 0, 'xa_tieu_can', 'Xã Tiểu Cần', 'tieu_can', '29341', 'xã', 2984, 'hienthi', 0, 1759490174, NULL),
(29365, 86, 0, 0, 'xa_tap_ngai', 'Xã Tập Ngãi', 'tap_ngai', '29365', 'xã', 2985, 'hienthi', 0, 1759490174, NULL),
(29419, 86, 0, 0, 'xa_my_long', 'Xã Mỹ Long', 'my_long', '29419', 'xã', 2986, 'hienthi', 0, 1759490174, NULL),
(29431, 86, 0, 0, 'xa_vinh_kim', 'Xã Vinh Kim', 'vinh_kim', '29431', 'xã', 2987, 'hienthi', 0, 1759490174, NULL),
(29416, 86, 0, 0, 'xa_cau_ngang', 'Xã Cầu Ngang', 'cau_ngang', '29416', 'xã', 2988, 'hienthi', 0, 1759490174, NULL),
(29446, 86, 0, 0, 'xa_nhi_truong', 'Xã Nhị Trường', 'nhi_truong', '29446', 'xã', 2989, 'hienthi', 0, 1759490174, NULL),
(29455, 86, 0, 0, 'xa_hiep_my', 'Xã Hiệp Mỹ', 'hiep_my', '29455', 'xã', 2990, 'hienthi', 0, 1759490174, NULL),
(29476, 86, 0, 0, 'xa_luu_nghiep_anh', 'Xã Lưu Nghiệp Anh', 'luu_nghiep_anh', '29476', 'xã', 2991, 'hienthi', 0, 1759490174, NULL),
(29491, 86, 0, 0, 'xa_dai_an', 'Xã Đại An', 'dai_an', '29491', 'xã', 2992, 'hienthi', 0, 1759490174, NULL),
(29489, 86, 0, 0, 'xa_ham_giang', 'Xã Hàm Giang', 'ham_giang', '29489', 'xã', 2993, 'hienthi', 0, 1759490174, NULL),
(29461, 86, 0, 0, 'xa_tra_cu', 'Xã Trà Cú', 'tra_cu', '29461', 'xã', 2994, 'hienthi', 0, 1759490174, NULL),
(29506, 86, 0, 0, 'xa_long_hiep', 'Xã Long Hiệp', 'long_hiep', '29506', 'xã', 2995, 'hienthi', 0, 1759490174, NULL),
(29467, 86, 0, 0, 'xa_tap_son', 'Xã Tập Sơn', 'tap_son', '29467', 'xã', 2996, 'hienthi', 0, 1759490174, NULL),
(29512, 86, 0, 0, 'phuong_duyen_hai', 'Phường Duyên Hải', 'duyen_hai', '29512', 'phường', 2997, 'hienthi', 0, 1759490174, NULL),
(29516, 86, 0, 0, 'phuong_truong_long_hoa', 'Phường Trường Long Hòa', 'truong_long_hoa', '29516', 'phường', 2998, 'hienthi', 0, 1759490174, NULL),
(29518, 86, 0, 0, 'xa_long_huu', 'Xã Long Hữu', 'long_huu', '29518', 'xã', 2999, 'hienthi', 0, 1759490174, NULL),
(29513, 86, 0, 0, 'xa_long_thanh', 'Xã Long Thành', 'long_thanh', '29513', 'xã', 3000, 'hienthi', 0, 1759490174, NULL),
(29536, 86, 0, 0, 'xa_dong_hai', 'Xã Đông Hải', 'dong_hai', '29536', 'xã', 3001, 'hienthi', 0, 1759490174, NULL),
(29533, 86, 0, 0, 'xa_long_vinh', 'Xã Long Vĩnh', 'long_vinh', '29533', 'xã', 3002, 'hienthi', 0, 1759490174, NULL),
(29497, 86, 0, 0, 'xa_don_chau', 'Xã Đôn Châu', 'don_chau', '29497', 'xã', 3003, 'hienthi', 0, 1759490174, NULL),
(29530, 86, 0, 0, 'xa_ngu_lac', 'Xã Ngũ Lạc', 'ngu_lac', '29530', 'xã', 3004, 'hienthi', 0, 1759490174, NULL),
(28777, 86, 0, 0, 'phuong_an_hoi', 'Phường An Hội', 'an_hoi', '28777', 'phường', 3005, 'hienthi', 0, 1759490174, NULL),
(28756, 86, 0, 0, 'phuong_phu_khuong', 'Phường Phú Khương', 'phu_khuong', '28756', 'phường', 3006, 'hienthi', 0, 1759490174, NULL),
(28789, 86, 0, 0, 'phuong_ben_tre', 'Phường Bến Tre', 'ben_tre', '28789', 'phường', 3007, 'hienthi', 0, 1759490174, NULL),
(28783, 86, 0, 0, 'phuong_son_dong', 'Phường Sơn Đông', 'son_dong', '28783', 'phường', 3008, 'hienthi', 0, 1759490174, NULL),
(28858, 86, 0, 0, 'phuong_phu_tan', 'Phường Phú Tân', 'phu_tan', '28858', 'phường', 3009, 'hienthi', 0, 1759490174, NULL),
(28810, 86, 0, 0, 'xa_phu_tuc', 'Xã Phú Túc', 'phu_tuc', '28810', 'xã', 3010, 'hienthi', 0, 1759490174, NULL),
(28807, 86, 0, 0, 'xa_giao_long', 'Xã Giao Long', 'giao_long', '28807', 'xã', 3011, 'hienthi', 0, 1759490174, NULL),
(28861, 86, 0, 0, 'xa_tien_thuy', 'Xã Tiên Thủy', 'tien_thuy', '28861', 'xã', 3012, 'hienthi', 0, 1759490174, NULL),
(28840, 86, 0, 0, 'xa_tan_phu', 'Xã Tân Phú', 'tan_phu', '28840', 'xã', 3013, 'hienthi', 0, 1759490174, NULL),
(28879, 86, 0, 0, 'xa_phu_phung', 'Xã Phú Phụng', 'phu_phung', '28879', 'xã', 3014, 'hienthi', 0, 1759490174, NULL),
(28870, 86, 0, 0, 'xa_cho_lach', 'Xã Chợ Lách', 'cho_lach', '28870', 'xã', 3015, 'hienthi', 0, 1759490174, NULL),
(28894, 86, 0, 0, 'xa_vinh_thanh', 'Xã Vĩnh Thành', 'vinh_thanh', '28894', 'xã', 3016, 'hienthi', 0, 1759490174, NULL),
(28901, 86, 0, 0, 'xa_hung_khanh_trung', 'Xã Hưng Khánh Trung', 'hung_khanh_trung', '28901', 'xã', 3017, 'hienthi', 0, 1759490174, NULL),
(28915, 86, 0, 0, 'xa_phuoc_my_trung', 'Xã Phước Mỹ Trung', 'phuoc_my_trung', '28915', 'xã', 3018, 'hienthi', 0, 1759490174, NULL),
(28921, 86, 0, 0, 'xa_tan_thanh_binh', 'Xã Tân Thành Bình', 'tan_thanh_binh', '28921', 'xã', 3019, 'hienthi', 0, 1759490174, NULL),
(28948, 86, 0, 0, 'xa_nhuan_phu_tan', 'Xã Nhuận Phú Tân', 'nhuan_phu_tan', '28948', 'xã', 3020, 'hienthi', 0, 1759490174, NULL),
(28945, 86, 0, 0, 'xa_dong_khoi', 'Xã Đồng Khởi', 'dong_khoi', '28945', 'xã', 3021, 'hienthi', 0, 1759490174, NULL),
(28903, 86, 0, 0, 'xa_mo_cay', 'Xã Mỏ Cày', 'mo_cay', '28903', 'xã', 3022, 'hienthi', 0, 1759490174, NULL),
(28969, 86, 0, 0, 'xa_thanh_thoi', 'Xã Thành Thới', 'thanh_thoi', '28969', 'xã', 3023, 'hienthi', 0, 1759490174, NULL),
(28957, 86, 0, 0, 'xa_an_dinh', 'Xã An Định', 'an_dinh', '28957', 'xã', 3024, 'hienthi', 0, 1759490174, NULL),
(28981, 86, 0, 0, 'xa_huong_my', 'Xã Hương Mỹ', 'huong_my', '28981', 'xã', 3025, 'hienthi', 0, 1759490174, NULL),
(29194, 86, 0, 0, 'xa_dai_dien', 'Xã Đại Điền', 'dai_dien', '29194', 'xã', 3026, 'hienthi', 0, 1759490174, NULL),
(29191, 86, 0, 0, 'xa_quoi_dien', 'Xã Quới Điền', 'quoi_dien', '29191', 'xã', 3027, 'hienthi', 0, 1759490174, NULL),
(29182, 86, 0, 0, 'xa_thanh_phu', 'Xã Thạnh Phú', 'thanh_phu', '29182', 'xã', 3028, 'hienthi', 0, 1759490174, NULL),
(29224, 86, 0, 0, 'xa_an_qui', 'Xã An Qui', 'an_qui', '29224', 'xã', 3029, 'hienthi', 0, 1759490174, NULL),
(29221, 86, 0, 0, 'xa_thanh_hai', 'Xã Thạnh Hải', 'thanh_hai', '29221', 'xã', 3030, 'hienthi', 0, 1759490174, NULL),
(29227, 86, 0, 0, 'xa_thanh_phong', 'Xã Thạnh Phong', 'thanh_phong', '29227', 'xã', 3031, 'hienthi', 0, 1759490174, NULL),
(29167, 86, 0, 0, 'xa_tan_thuy', 'Xã Tân Thủy', 'tan_thuy', '29167', 'xã', 3032, 'hienthi', 0, 1759490174, NULL),
(29125, 86, 0, 0, 'xa_bao_thanh', 'Xã Bảo Thạnh', 'bao_thanh', '29125', 'xã', 3033, 'hienthi', 0, 1759490174, NULL),
(29110, 86, 0, 0, 'xa_ba_tri', 'Xã Ba Tri', 'ba_tri', '29110', 'xã', 3034, 'hienthi', 0, 1759490174, NULL),
(29137, 86, 0, 0, 'xa_tan_xuan', 'Xã Tân Xuân', 'tan_xuan', '29137', 'xã', 3035, 'hienthi', 0, 1759490174, NULL),
(29122, 86, 0, 0, 'xa_my_chanh_hoa', 'Xã Mỹ Chánh Hòa', 'my_chanh_hoa', '29122', 'xã', 3036, 'hienthi', 0, 1759490174, NULL),
(29143, 86, 0, 0, 'xa_an_ngai_trung', 'Xã An Ngãi Trung', 'an_ngai_trung', '29143', 'xã', 3037, 'hienthi', 0, 1759490174, NULL);
INSERT INTO `table_ward` (`id`, `id_city`, `id_district`, `districtid`, `wardcode`, `name`, `slug`, `code`, `level`, `numb`, `status`, `date_updated`, `date_created`, `ship_price`) VALUES
(29158, 86, 0, 0, 'xa_an_hiep', 'Xã An Hiệp', 'an_hiep', '29158', 'xã', 3038, 'hienthi', 0, 1759490174, NULL),
(29044, 86, 0, 0, 'xa_hung_nhuong', 'Xã Hưng Nhượng', 'hung_nhuong', '29044', 'xã', 3039, 'hienthi', 0, 1759490174, NULL),
(28984, 86, 0, 0, 'xa_giong_trom', 'Xã Giồng Trôm', 'giong_trom', '28984', 'xã', 3040, 'hienthi', 0, 1759490174, NULL),
(29029, 86, 0, 0, 'xa_tan_hao', 'Xã Tân Hào', 'tan_hao', '29029', 'xã', 3041, 'hienthi', 0, 1759490174, NULL),
(29020, 86, 0, 0, 'xa_phuoc_long', 'Xã Phước Long', 'phuoc_long', '29020', 'xã', 3042, 'hienthi', 0, 1759490174, NULL),
(28993, 86, 0, 0, 'xa_luong_phu', 'Xã Lương Phú', 'luong_phu', '28993', 'xã', 3043, 'hienthi', 0, 1759490174, NULL),
(28996, 86, 0, 0, 'xa_chau_hoa', 'Xã Châu Hòa', 'chau_hoa', '28996', 'xã', 3044, 'hienthi', 0, 1759490174, NULL),
(28987, 86, 0, 0, 'xa_luong_hoa', 'Xã Lương Hòa', 'luong_hoa', '28987', 'xã', 3045, 'hienthi', 0, 1759490174, NULL),
(29107, 86, 0, 0, 'xa_thoi_thuan', 'Xã Thới Thuận', 'thoi_thuan', '29107', 'xã', 3046, 'hienthi', 0, 1759490174, NULL),
(29104, 86, 0, 0, 'xa_thanh_phuoc', 'Xã Thạnh Phước', 'thanh_phuoc', '29104', 'xã', 3047, 'hienthi', 0, 1759490174, NULL),
(29050, 86, 0, 0, 'xa_binh_dai', 'Xã Bình Đại', 'binh_dai', '29050', 'xã', 3048, 'hienthi', 0, 1759490174, NULL),
(29089, 86, 0, 0, 'xa_thanh_tri', 'Xã Thạnh Trị', 'thanh_tri', '29089', 'xã', 3049, 'hienthi', 0, 1759490174, NULL),
(29077, 86, 0, 0, 'xa_loc_thuan', 'Xã Lộc Thuận', 'loc_thuan', '29077', 'xã', 3050, 'hienthi', 0, 1759490174, NULL),
(29083, 86, 0, 0, 'xa_chau_hung', 'Xã Châu Hưng', 'chau_hung', '29083', 'xã', 3051, 'hienthi', 0, 1759490174, NULL),
(29062, 86, 0, 0, 'xa_phu_thuan', 'Xã Phú Thuận', 'phu_thuan', '29062', 'xã', 3052, 'hienthi', 0, 1759490174, NULL),
(30313, 91, 0, 0, 'xa_my_hoa_hung', 'Xã Mỹ Hòa Hưng', 'my_hoa_hung', '30313', 'xã', 3053, 'hienthi', 0, 1759490174, NULL),
(30307, 91, 0, 0, 'phuong_long_xuyen', 'Phường Long Xuyên', 'long_xuyen', '30307', 'phường', 3054, 'hienthi', 0, 1759490174, NULL),
(30292, 91, 0, 0, 'phuong_binh_duc', 'Phường Bình Đức', 'binh_duc', '30292', 'phường', 3055, 'hienthi', 0, 1759490174, NULL),
(30301, 91, 0, 0, 'phuong_my_thoi', 'Phường Mỹ Thới', 'my_thoi', '30301', 'phường', 3056, 'hienthi', 0, 1759490174, NULL),
(30316, 91, 0, 0, 'phuong_chau_doc', 'Phường Châu Đốc', 'chau_doc', '30316', 'phường', 3057, 'hienthi', 0, 1759490174, NULL),
(30325, 91, 0, 0, 'phuong_vinh_te', 'Phường Vĩnh Tế', 'vinh_te', '30325', 'phường', 3058, 'hienthi', 0, 1759490174, NULL),
(30337, 91, 0, 0, 'xa_an_phu', 'Xã An Phú', 'an_phu', '30337', 'xã', 3059, 'hienthi', 0, 1759490174, NULL),
(30367, 91, 0, 0, 'xa_vinh_hau', 'Xã Vĩnh Hậu', 'vinh_hau', '30367', 'xã', 3060, 'hienthi', 0, 1759490174, NULL),
(30346, 91, 0, 0, 'xa_nhon_hoi', 'Xã Nhơn Hội', 'nhon_hoi', '30346', 'xã', 3061, 'hienthi', 0, 1759490174, NULL),
(30341, 91, 0, 0, 'xa_khanh_binh', 'Xã Khánh Bình', 'khanh_binh', '30341', 'xã', 3062, 'hienthi', 0, 1759490174, NULL),
(30352, 91, 0, 0, 'xa_phu_huu', 'Xã Phú Hữu', 'phu_huu', '30352', 'xã', 3063, 'hienthi', 0, 1759490174, NULL),
(30388, 91, 0, 0, 'xa_tan_an', 'Xã Tân An', 'tan_an', '30388', 'xã', 3064, 'hienthi', 0, 1759490174, NULL),
(30403, 91, 0, 0, 'xa_chau_phong', 'Xã Châu Phong', 'chau_phong', '30403', 'xã', 3065, 'hienthi', 0, 1759490174, NULL),
(30385, 91, 0, 0, 'xa_vinh_xuong', 'Xã Vĩnh Xương', 'vinh_xuong', '30385', 'xã', 3066, 'hienthi', 0, 1759490174, NULL),
(30376, 91, 0, 0, 'phuong_tan_chau', 'Phường Tân Châu', 'tan_chau', '30376', 'phường', 3067, 'hienthi', 0, 1759490174, NULL),
(30377, 91, 0, 0, 'phuong_long_phu', 'Phường Long Phú', 'long_phu', '30377', 'phường', 3068, 'hienthi', 0, 1759490174, NULL),
(30406, 91, 0, 0, 'xa_phu_tan', 'Xã Phú Tân', 'phu_tan', '30406', 'xã', 3069, 'hienthi', 0, 1759490174, NULL),
(30436, 91, 0, 0, 'xa_phu_an', 'Xã Phú An', 'phu_an', '30436', 'xã', 3070, 'hienthi', 0, 1759490174, NULL),
(30445, 91, 0, 0, 'xa_binh_thanh_dong', 'Xã Bình Thạnh Đông', 'binh_thanh_dong', '30445', 'xã', 3071, 'hienthi', 0, 1759490174, NULL),
(30409, 91, 0, 0, 'xa_cho_vam', 'Xã Chợ Vàm', 'cho_vam', '30409', 'xã', 3072, 'hienthi', 0, 1759490174, NULL),
(30430, 91, 0, 0, 'xa_hoa_lac', 'Xã Hòa Lạc', 'hoa_lac', '30430', 'xã', 3073, 'hienthi', 0, 1759490174, NULL),
(30421, 91, 0, 0, 'xa_phu_lam', 'Xã Phú Lâm', 'phu_lam', '30421', 'xã', 3074, 'hienthi', 0, 1759490174, NULL),
(30463, 91, 0, 0, 'xa_chau_phu', 'Xã Châu Phú', 'chau_phu', '30463', 'xã', 3075, 'hienthi', 0, 1759490174, NULL),
(30469, 91, 0, 0, 'xa_my_duc', 'Xã Mỹ Đức', 'my_duc', '30469', 'xã', 3076, 'hienthi', 0, 1759490174, NULL),
(30478, 91, 0, 0, 'xa_vinh_thanh_trung', 'Xã Vĩnh Thạnh Trung', 'vinh_thanh_trung', '30478', 'xã', 3077, 'hienthi', 0, 1759490174, NULL),
(30487, 91, 0, 0, 'xa_binh_my', 'Xã Bình Mỹ', 'binh_my', '30487', 'xã', 3078, 'hienthi', 0, 1759490174, NULL),
(30481, 91, 0, 0, 'xa_thanh_my_tay', 'Xã Thạnh Mỹ Tây', 'thanh_my_tay', '30481', 'xã', 3079, 'hienthi', 0, 1759490174, NULL),
(30526, 91, 0, 0, 'xa_an_cu', 'Xã An Cư', 'an_cu', '30526', 'xã', 3080, 'hienthi', 0, 1759490174, NULL),
(30538, 91, 0, 0, 'xa_nui_cam', 'Xã Núi Cấm', 'nui_cam', '30538', 'xã', 3081, 'hienthi', 0, 1759490174, NULL),
(30520, 91, 0, 0, 'phuong_tinh_bien', 'Phường Tịnh Biên', 'tinh_bien', '30520', 'phường', 3082, 'hienthi', 0, 1759490174, NULL),
(30502, 91, 0, 0, 'phuong_thoi_son', 'Phường Thới Sơn', 'thoi_son', '30502', 'phường', 3083, 'hienthi', 0, 1759490174, NULL),
(30505, 91, 0, 0, 'phuong_chi_lang', 'Phường Chi Lăng', 'chi_lang', '30505', 'phường', 3084, 'hienthi', 0, 1759490174, NULL),
(30547, 91, 0, 0, 'xa_ba_chuc', 'Xã Ba Chúc', 'ba_chuc', '30547', 'xã', 3085, 'hienthi', 0, 1759490174, NULL),
(30544, 91, 0, 0, 'xa_tri_ton', 'Xã Tri Tôn', 'tri_ton', '30544', 'xã', 3086, 'hienthi', 0, 1759490174, NULL),
(30577, 91, 0, 0, 'xa_o_lam', 'Xã Ô Lâm', 'o_lam', '30577', 'xã', 3087, 'hienthi', 0, 1759490174, NULL),
(30580, 91, 0, 0, 'xa_co_to', 'Xã Cô Tô', 'co_to', '30580', 'xã', 3088, 'hienthi', 0, 1759490174, NULL),
(30568, 91, 0, 0, 'xa_vinh_gia', 'Xã Vĩnh Gia', 'vinh_gia', '30568', 'xã', 3089, 'hienthi', 0, 1759490174, NULL),
(30589, 91, 0, 0, 'xa_an_chau', 'Xã An Châu', 'an_chau', '30589', 'xã', 3090, 'hienthi', 0, 1759490174, NULL),
(30607, 91, 0, 0, 'xa_binh_hoa', 'Xã Bình Hòa', 'binh_hoa', '30607', 'xã', 3091, 'hienthi', 0, 1759490174, NULL),
(30595, 91, 0, 0, 'xa_can_dang', 'Xã Cần Đăng', 'can_dang', '30595', 'xã', 3092, 'hienthi', 0, 1759490174, NULL),
(30619, 91, 0, 0, 'xa_vinh_hanh', 'Xã Vĩnh Hanh', 'vinh_hanh', '30619', 'xã', 3093, 'hienthi', 0, 1759490174, NULL),
(30604, 91, 0, 0, 'xa_vinh_an', 'Xã Vĩnh An', 'vinh_an', '30604', 'xã', 3094, 'hienthi', 0, 1759490174, NULL),
(30628, 91, 0, 0, 'xa_cho_moi', 'Xã Chợ Mới', 'cho_moi', '30628', 'xã', 3095, 'hienthi', 0, 1759490174, NULL),
(30643, 91, 0, 0, 'xa_cu_lao_gieng', 'Xã Cù Lao Giêng', 'cu_lao_gieng', '30643', 'xã', 3096, 'hienthi', 0, 1759490174, NULL),
(30673, 91, 0, 0, 'xa_hoi_an', 'Xã Hội An', 'hoi_an', '30673', 'xã', 3097, 'hienthi', 0, 1759490174, NULL),
(30631, 91, 0, 0, 'xa_long_dien', 'Xã Long Điền', 'long_dien', '30631', 'xã', 3098, 'hienthi', 0, 1759490174, NULL),
(30658, 91, 0, 0, 'xa_nhon_my', 'Xã Nhơn Mỹ', 'nhon_my', '30658', 'xã', 3099, 'hienthi', 0, 1759490174, NULL),
(30664, 91, 0, 0, 'xa_long_kien', 'Xã Long Kiến', 'long_kien', '30664', 'xã', 3100, 'hienthi', 0, 1759490174, NULL),
(30682, 91, 0, 0, 'xa_thoai_son', 'Xã Thoại Sơn', 'thoai_son', '30682', 'xã', 3101, 'hienthi', 0, 1759490174, NULL),
(30688, 91, 0, 0, 'xa_oc_eo', 'Xã Óc Eo', 'oc_eo', '30688', 'xã', 3102, 'hienthi', 0, 1759490174, NULL),
(30709, 91, 0, 0, 'xa_dinh_my', 'Xã Định Mỹ', 'dinh_my', '30709', 'xã', 3103, 'hienthi', 0, 1759490174, NULL),
(30685, 91, 0, 0, 'xa_phu_hoa', 'Xã Phú Hòa', 'phu_hoa', '30685', 'xã', 3104, 'hienthi', 0, 1759490174, NULL),
(30697, 91, 0, 0, 'xa_vinh_trach', 'Xã Vĩnh Trạch', 'vinh_trach', '30697', 'xã', 3105, 'hienthi', 0, 1759490174, NULL),
(30691, 91, 0, 0, 'xa_tay_phu', 'Xã Tây Phú', 'tay_phu', '30691', 'xã', 3106, 'hienthi', 0, 1759490174, NULL),
(31064, 91, 0, 0, 'xa_vinh_binh', 'Xã Vĩnh Bình', 'vinh_binh', '31064', 'xã', 3107, 'hienthi', 0, 1759490174, NULL),
(31069, 91, 0, 0, 'xa_vinh_thuan', 'Xã Vĩnh Thuận', 'vinh_thuan', '31069', 'xã', 3108, 'hienthi', 0, 1759490174, NULL),
(31051, 91, 0, 0, 'xa_vinh_phong', 'Xã Vĩnh Phong', 'vinh_phong', '31051', 'xã', 3109, 'hienthi', 0, 1759490174, NULL),
(31012, 91, 0, 0, 'xa_vinh_hoa', 'Xã Vĩnh Hòa', 'vinh_hoa', '31012', 'xã', 3110, 'hienthi', 0, 1759490174, NULL),
(31027, 91, 0, 0, 'xa_u_minh_thuong', 'Xã U Minh Thượng', 'u_minh_thuong', '31027', 'xã', 3111, 'hienthi', 0, 1759490174, NULL),
(31024, 91, 0, 0, 'xa_dong_hoa', 'Xã Đông Hòa', 'dong_hoa', '31024', 'xã', 3112, 'hienthi', 0, 1759490174, NULL),
(31031, 91, 0, 0, 'xa_tan_thanh', 'Xã Tân Thạnh', 'tan_thanh', '31031', 'xã', 3113, 'hienthi', 0, 1759490174, NULL),
(31036, 91, 0, 0, 'xa_dong_hung', 'Xã Đông Hưng', 'dong_hung', '31036', 'xã', 3114, 'hienthi', 0, 1759490174, NULL),
(31018, 91, 0, 0, 'xa_an_minh', 'Xã An Minh', 'an_minh', '31018', 'xã', 3115, 'hienthi', 0, 1759490174, NULL),
(31042, 91, 0, 0, 'xa_van_khanh', 'Xã Vân Khánh', 'van_khanh', '31042', 'xã', 3116, 'hienthi', 0, 1759490174, NULL),
(30988, 91, 0, 0, 'xa_tay_yen', 'Xã Tây Yên', 'tay_yen', '30988', 'xã', 3117, 'hienthi', 0, 1759490174, NULL),
(31006, 91, 0, 0, 'xa_dong_thai', 'Xã Đông Thái', 'dong_thai', '31006', 'xã', 3118, 'hienthi', 0, 1759490174, NULL),
(30985, 91, 0, 0, 'xa_an_bien', 'Xã An Biên', 'an_bien', '30985', 'xã', 3119, 'hienthi', 0, 1759490174, NULL),
(30958, 91, 0, 0, 'xa_dinh_hoa', 'Xã Định Hòa', 'dinh_hoa', '30958', 'xã', 3120, 'hienthi', 0, 1759490174, NULL),
(30952, 91, 0, 0, 'xa_go_quao', 'Xã Gò Quao', 'go_quao', '30952', 'xã', 3121, 'hienthi', 0, 1759490174, NULL),
(30970, 91, 0, 0, 'xa_vinh_hoa_hung', 'Xã Vĩnh Hòa Hưng', 'vinh_hoa_hung', '30970', 'xã', 3122, 'hienthi', 0, 1759490174, NULL),
(30982, 91, 0, 0, 'xa_vinh_tuy', 'Xã Vĩnh Tuy', 'vinh_tuy', '30982', 'xã', 3123, 'hienthi', 0, 1759490174, NULL),
(30904, 91, 0, 0, 'xa_giong_rieng', 'Xã Giồng Riềng', 'giong_rieng', '30904', 'xã', 3124, 'hienthi', 0, 1759490174, NULL),
(30910, 91, 0, 0, 'xa_thanh_hung', 'Xã Thạnh Hưng', 'thanh_hung', '30910', 'xã', 3125, 'hienthi', 0, 1759490174, NULL),
(30943, 91, 0, 0, 'xa_long_thanh', 'Xã Long Thạnh', 'long_thanh', '30943', 'xã', 3126, 'hienthi', 0, 1759490174, NULL),
(30934, 91, 0, 0, 'xa_hoa_hung', 'Xã Hòa Hưng', 'hoa_hung', '30934', 'xã', 3127, 'hienthi', 0, 1759490174, NULL),
(30928, 91, 0, 0, 'xa_ngoc_chuc', 'Xã Ngọc Chúc', 'ngoc_chuc', '30928', 'xã', 3128, 'hienthi', 0, 1759490174, NULL),
(30949, 91, 0, 0, 'xa_hoa_thuan', 'Xã Hòa Thuận', 'hoa_thuan', '30949', 'xã', 3129, 'hienthi', 0, 1759490174, NULL),
(30856, 91, 0, 0, 'xa_tan_hoi', 'Xã Tân Hội', 'tan_hoi', '30856', 'xã', 3130, 'hienthi', 0, 1759490174, NULL),
(30850, 91, 0, 0, 'xa_tan_hiep', 'Xã Tân Hiệp', 'tan_hiep', '30850', 'xã', 3131, 'hienthi', 0, 1759490174, NULL),
(30874, 91, 0, 0, 'xa_thanh_dong', 'Xã Thạnh Đông', 'thanh_dong', '30874', 'xã', 3132, 'hienthi', 0, 1759490174, NULL),
(30886, 91, 0, 0, 'xa_thanh_loc', 'Xã Thạnh Lộc', 'thanh_loc', '30886', 'xã', 3133, 'hienthi', 0, 1759490174, NULL),
(30880, 91, 0, 0, 'xa_chau_thanh', 'Xã Châu Thành', 'chau_thanh', '30880', 'xã', 3134, 'hienthi', 0, 1759490174, NULL),
(30898, 91, 0, 0, 'xa_binh_an', 'Xã Bình An', 'binh_an', '30898', 'xã', 3135, 'hienthi', 0, 1759490174, NULL),
(30817, 91, 0, 0, 'xa_hon_dat', 'Xã Hòn Đất', 'hon_dat', '30817', 'xã', 3136, 'hienthi', 0, 1759490174, NULL),
(30835, 91, 0, 0, 'xa_son_kien', 'Xã Sơn Kiên', 'son_kien', '30835', 'xã', 3137, 'hienthi', 0, 1759490174, NULL),
(30838, 91, 0, 0, 'xa_my_thuan', 'Xã Mỹ Thuận', 'my_thuan', '30838', 'xã', 3138, 'hienthi', 0, 1759490174, NULL),
(30823, 91, 0, 0, 'xa_binh_son', 'Xã Bình Sơn', 'binh_son', '30823', 'xã', 3139, 'hienthi', 0, 1759490174, NULL),
(30826, 91, 0, 0, 'xa_binh_giang', 'Xã Bình Giang', 'binh_giang', '30826', 'xã', 3140, 'hienthi', 0, 1759490174, NULL),
(30796, 91, 0, 0, 'xa_giang_thanh', 'Xã Giang Thành', 'giang_thanh', '30796', 'xã', 3141, 'hienthi', 0, 1759490174, NULL),
(30793, 91, 0, 0, 'xa_vinh_dieu', 'Xã Vĩnh Điều', 'vinh_dieu', '30793', 'xã', 3142, 'hienthi', 0, 1759490174, NULL),
(30790, 91, 0, 0, 'xa_hoa_dien', 'Xã Hòa Điền', 'hoa_dien', '30790', 'xã', 3143, 'hienthi', 0, 1759490174, NULL),
(30787, 91, 0, 0, 'xa_kien_luong', 'Xã Kiên Lương', 'kien_luong', '30787', 'xã', 3144, 'hienthi', 0, 1759490174, NULL),
(30811, 91, 0, 0, 'xa_son_hai', 'Xã Sơn Hải', 'son_hai', '30811', 'xã', 3145, 'hienthi', 0, 1759490174, NULL),
(30814, 91, 0, 0, 'xa_hon_nghe', 'Xã Hòn Nghệ', 'hon_nghe', '30814', 'xã', 3146, 'hienthi', 0, 1759490174, NULL),
(31108, 91, 0, 0, 'dac_khu_kien_hai', 'Đặc khu Kiên Hải', 'kien_hai', '31108', 'đặc khu', 3147, 'hienthi', 0, 1759490174, NULL),
(30760, 91, 0, 0, 'phuong_vinh_thong', 'Phường Vĩnh Thông', 'vinh_thong', '30760', 'phường', 3148, 'hienthi', 0, 1759490174, NULL),
(30742, 91, 0, 0, 'phuong_rach_gia', 'Phường Rạch Giá', 'rach_gia', '30742', 'phường', 3149, 'hienthi', 0, 1759490174, NULL),
(30769, 91, 0, 0, 'phuong_ha_tien', 'Phường Hà Tiên', 'ha_tien', '30769', 'phường', 3150, 'hienthi', 0, 1759490174, NULL),
(30766, 91, 0, 0, 'phuong_to_chau', 'Phường Tô Châu', 'to_chau', '30766', 'phường', 3151, 'hienthi', 0, 1759490174, NULL),
(30781, 91, 0, 0, 'xa_tien_hai', 'Xã Tiên Hải', 'tien_hai', '30781', 'xã', 3152, 'hienthi', 0, 1759490174, NULL),
(31078, 91, 0, 0, 'dac_khu_phu_quoc', 'Đặc khu Phú Quốc', 'phu_quoc', '31078', 'đặc khu', 3153, 'hienthi', 0, 1759490174, NULL),
(31105, 91, 0, 0, 'dac_khu_tho_chau', 'Đặc khu Thổ Châu', 'tho_chau', '31105', 'đặc khu', 3154, 'hienthi', 0, 1759490174, NULL),
(31135, 92, 0, 0, 'phuong_ninh_kieu', 'Phường Ninh Kiều', 'ninh_kieu', '31135', 'phường', 3155, 'hienthi', 0, 1759490174, NULL),
(31120, 92, 0, 0, 'phuong_cai_khe', 'Phường Cái Khế', 'cai_khe', '31120', 'phường', 3156, 'hienthi', 0, 1759490174, NULL),
(31147, 92, 0, 0, 'phuong_tan_an', 'Phường Tân An', 'tan_an', '31147', 'phường', 3157, 'hienthi', 0, 1759490174, NULL),
(31150, 92, 0, 0, 'phuong_an_binh', 'Phường An Bình', 'an_binh', '31150', 'phường', 3158, 'hienthi', 0, 1759490174, NULL),
(31174, 92, 0, 0, 'phuong_thoi_an_dong', 'Phường Thới An Đông', 'thoi_an_dong', '31174', 'phường', 3159, 'hienthi', 0, 1759490174, NULL),
(31168, 92, 0, 0, 'phuong_binh_thuy', 'Phường Bình Thủy', 'binh_thuy', '31168', 'phường', 3160, 'hienthi', 0, 1759490174, NULL),
(31183, 92, 0, 0, 'phuong_long_tuyen', 'Phường Long Tuyền', 'long_tuyen', '31183', 'phường', 3161, 'hienthi', 0, 1759490174, NULL),
(31186, 92, 0, 0, 'phuong_cai_rang', 'Phường Cái Răng', 'cai_rang', '31186', 'phường', 3162, 'hienthi', 0, 1759490174, NULL),
(31201, 92, 0, 0, 'phuong_hung_phu', 'Phường Hưng Phú', 'hung_phu', '31201', 'phường', 3163, 'hienthi', 0, 1759490174, NULL),
(31153, 92, 0, 0, 'phuong_o_mon', 'Phường Ô Môn', 'o_mon', '31153', 'phường', 3164, 'hienthi', 0, 1759490174, NULL),
(31157, 92, 0, 0, 'phuong_thoi_long', 'Phường Thới Long', 'thoi_long', '31157', 'phường', 3165, 'hienthi', 0, 1759490174, NULL),
(31162, 92, 0, 0, 'phuong_phuoc_thoi', 'Phường Phước Thới', 'phuoc_thoi', '31162', 'phường', 3166, 'hienthi', 0, 1759490174, NULL),
(31217, 92, 0, 0, 'phuong_trung_nhut', 'Phường Trung Nhứt', 'trung_nhut', '31217', 'phường', 3167, 'hienthi', 0, 1759490174, NULL),
(31212, 92, 0, 0, 'phuong_thot_not', 'Phường Thốt Nốt', 'thot_not', '31212', 'phường', 3168, 'hienthi', 0, 1759490174, NULL),
(31207, 92, 0, 0, 'phuong_thuan_hung', 'Phường Thuận Hưng', 'thuan_hung', '31207', 'phường', 3169, 'hienthi', 0, 1759490174, NULL),
(31213, 92, 0, 0, 'phuong_tan_loc', 'Phường Tân Lộc', 'tan_loc', '31213', 'phường', 3170, 'hienthi', 0, 1759490174, NULL),
(31299, 92, 0, 0, 'xa_phong_dien', 'Xã Phong Điền', 'phong_dien', '31299', 'xã', 3171, 'hienthi', 0, 1759490174, NULL),
(31315, 92, 0, 0, 'xa_nhon_ai', 'Xã Nhơn Ái', 'nhon_ai', '31315', 'xã', 3172, 'hienthi', 0, 1759490174, NULL),
(31309, 92, 0, 0, 'xa_truong_long', 'Xã Trường Long', 'truong_long', '31309', 'xã', 3173, 'hienthi', 0, 1759490174, NULL),
(31258, 92, 0, 0, 'xa_thoi_lai', 'Xã Thới Lai', 'thoi_lai', '31258', 'xã', 3174, 'hienthi', 0, 1759490174, NULL),
(31282, 92, 0, 0, 'xa_dong_thuan', 'Xã Đông Thuận', 'dong_thuan', '31282', 'xã', 3175, 'hienthi', 0, 1759490174, NULL),
(31294, 92, 0, 0, 'xa_truong_xuan', 'Xã Trường Xuân', 'truong_xuan', '31294', 'xã', 3176, 'hienthi', 0, 1759490174, NULL),
(31288, 92, 0, 0, 'xa_truong_thanh', 'Xã Trường Thành', 'truong_thanh', '31288', 'xã', 3177, 'hienthi', 0, 1759490174, NULL),
(31261, 92, 0, 0, 'xa_co_do', 'Xã Cờ Đỏ', 'co_do', '31261', 'xã', 3178, 'hienthi', 0, 1759490174, NULL),
(31273, 92, 0, 0, 'xa_dong_hiep', 'Xã Đông Hiệp', 'dong_hiep', '31273', 'xã', 3179, 'hienthi', 0, 1759490174, NULL),
(31249, 92, 0, 0, 'xa_thanh_phu', 'Xã Thạnh Phú', 'thanh_phu', '31249', 'xã', 3180, 'hienthi', 0, 1759490174, NULL),
(31264, 92, 0, 0, 'xa_thoi_hung', 'Xã Thới Hưng', 'thoi_hung', '31264', 'xã', 3181, 'hienthi', 0, 1759490174, NULL),
(31255, 92, 0, 0, 'xa_trung_hung', 'Xã Trung Hưng', 'trung_hung', '31255', 'xã', 3182, 'hienthi', 0, 1759490174, NULL),
(31232, 92, 0, 0, 'xa_vinh_thanh', 'Xã Vĩnh Thạnh', 'vinh_thanh', '31232', 'xã', 3183, 'hienthi', 0, 1759490174, NULL),
(31237, 92, 0, 0, 'xa_vinh_trinh', 'Xã Vĩnh Trinh', 'vinh_trinh', '31237', 'xã', 3184, 'hienthi', 0, 1759490174, NULL),
(31231, 92, 0, 0, 'xa_thanh_an', 'Xã Thạnh An', 'thanh_an', '31231', 'xã', 3185, 'hienthi', 0, 1759490174, NULL),
(31246, 92, 0, 0, 'xa_thanh_quoi', 'Xã Thạnh Quới', 'thanh_quoi', '31246', 'xã', 3186, 'hienthi', 0, 1759490174, NULL),
(31338, 92, 0, 0, 'xa_hoa_luu', 'Xã Hỏa Lựu', 'hoa_luu', '31338', 'xã', 3187, 'hienthi', 0, 1759490174, NULL),
(31321, 92, 0, 0, 'phuong_vi_thanh', 'Phường Vị Thanh', 'vi_thanh', '31321', 'phường', 3188, 'hienthi', 0, 1759490174, NULL),
(31333, 92, 0, 0, 'phuong_vi_tan', 'Phường Vị Tân', 'vi_tan', '31333', 'phường', 3189, 'hienthi', 0, 1759490174, NULL),
(31441, 92, 0, 0, 'xa_vi_thuy', 'Xã Vị Thủy', 'vi_thuy', '31441', 'xã', 3190, 'hienthi', 0, 1759490174, NULL),
(31453, 92, 0, 0, 'xa_vinh_thuan_dong', 'Xã Vĩnh Thuận Đông', 'vinh_thuan_dong', '31453', 'xã', 3191, 'hienthi', 0, 1759490174, NULL),
(31465, 92, 0, 0, 'xa_vi_thanh_1', 'Xã Vị Thanh 1', 'vi_thanh_1', '31465', 'xã', 3192, 'hienthi', 0, 1759490174, NULL),
(31459, 92, 0, 0, 'xa_vinh_tuong', 'Xã Vĩnh Tường', 'vinh_tuong', '31459', 'xã', 3193, 'hienthi', 0, 1759490174, NULL),
(31489, 92, 0, 0, 'xa_vinh_vien', 'Xã Vĩnh Viễn', 'vinh_vien', '31489', 'xã', 3194, 'hienthi', 0, 1759490174, NULL),
(31495, 92, 0, 0, 'xa_xa_phien', 'Xã Xà Phiên', 'xa_phien', '31495', 'xã', 3195, 'hienthi', 0, 1759490174, NULL),
(31492, 92, 0, 0, 'xa_luong_tam', 'Xã Lương Tâm', 'luong_tam', '31492', 'xã', 3196, 'hienthi', 0, 1759490174, NULL),
(31473, 92, 0, 0, 'phuong_long_binh', 'Phường Long Bình', 'long_binh', '31473', 'phường', 3197, 'hienthi', 0, 1759490174, NULL),
(31471, 92, 0, 0, 'phuong_long_my', 'Phường Long Mỹ', 'long_my', '31471', 'phường', 3198, 'hienthi', 0, 1759490174, NULL),
(31480, 92, 0, 0, 'phuong_long_phu_1', 'Phường Long Phú 1', 'long_phu_1', '31480', 'phường', 3199, 'hienthi', 0, 1759490174, NULL),
(31360, 92, 0, 0, 'xa_thanh_xuan', 'Xã Thạnh Xuân', 'thanh_xuan', '31360', 'xã', 3200, 'hienthi', 0, 1759490174, NULL),
(31342, 92, 0, 0, 'xa_tan_hoa', 'Xã Tân Hòa', 'tan_hoa', '31342', 'xã', 3201, 'hienthi', 0, 1759490174, NULL),
(31348, 92, 0, 0, 'xa_truong_long_tay', 'Xã Trường Long Tây', 'truong_long_tay', '31348', 'xã', 3202, 'hienthi', 0, 1759490174, NULL),
(31366, 92, 0, 0, 'xa_chau_thanh', 'Xã Châu Thành', 'chau_thanh', '31366', 'xã', 3203, 'hienthi', 0, 1759490174, NULL),
(31369, 92, 0, 0, 'xa_dong_phuoc', 'Xã Đông Phước', 'dong_phuoc', '31369', 'xã', 3204, 'hienthi', 0, 1759490174, NULL),
(31378, 92, 0, 0, 'xa_phu_huu', 'Xã  Phú Hữu', 'phu_huu', '31378', 'xã', 3205, 'hienthi', 0, 1759490174, NULL),
(31411, 92, 0, 0, 'phuong_dai_thanh', 'Phường Đại Thành', 'dai_thanh', '31411', 'phường', 3206, 'hienthi', 0, 1759490174, NULL),
(31340, 92, 0, 0, 'phuong_nga_bay', 'Phường Ngã Bảy', 'nga_bay', '31340', 'phường', 3207, 'hienthi', 0, 1759490174, NULL),
(31399, 92, 0, 0, 'xa_tan_binh', 'Xã Tân Bình', 'tan_binh', '31399', 'xã', 3208, 'hienthi', 0, 1759490174, NULL),
(31393, 92, 0, 0, 'xa_hoa_an', 'Xã Hòa An', 'hoa_an', '31393', 'xã', 3209, 'hienthi', 0, 1759490174, NULL),
(31426, 92, 0, 0, 'xa_phuong_binh', 'Xã Phương Bình', 'binh', '31426', 'xã', 3210, 'hienthi', 0, 1759490174, NULL),
(31432, 92, 0, 0, 'xa_tan_phuoc_hung', 'Xã Tân Phước Hưng', 'tan_phuoc_hung', '31432', 'xã', 3211, 'hienthi', 0, 1759490174, NULL),
(31396, 92, 0, 0, 'xa_hiep_hung', 'Xã Hiệp Hưng', 'hiep_hung', '31396', 'xã', 3212, 'hienthi', 0, 1759490174, NULL),
(31420, 92, 0, 0, 'xa_phung_hiep', 'Xã Phụng Hiệp', 'phung_hiep', '31420', 'xã', 3213, 'hienthi', 0, 1759490174, NULL),
(31408, 92, 0, 0, 'xa_thanh_hoa', 'Xã Thạnh Hòa', 'thanh_hoa', '31408', 'xã', 3214, 'hienthi', 0, 1759490174, NULL),
(31510, 92, 0, 0, 'phuong_phu_loi', 'Phường Phú Lợi', 'phu_loi', '31510', 'phường', 3215, 'hienthi', 0, 1759490174, NULL),
(31507, 92, 0, 0, 'phuong_soc_trang', 'Phường Sóc Trăng', 'soc_trang', '31507', 'phường', 3216, 'hienthi', 0, 1759490174, NULL),
(31684, 92, 0, 0, 'phuong_my_xuyen', 'Phường Mỹ Xuyên', 'my_xuyen', '31684', 'phường', 3217, 'hienthi', 0, 1759490174, NULL),
(31717, 92, 0, 0, 'xa_hoa_tu', 'Xã Hòa Tú', 'hoa_tu', '31717', 'xã', 3218, 'hienthi', 0, 1759490174, NULL),
(31726, 92, 0, 0, 'xa_gia_hoa', 'Xã Gia Hòa', 'gia_hoa', '31726', 'xã', 3219, 'hienthi', 0, 1759490174, NULL),
(31708, 92, 0, 0, 'xa_nhu_gia', 'Xã Nhu Gia', 'nhu_gia', '31708', 'xã', 3220, 'hienthi', 0, 1759490174, NULL),
(31723, 92, 0, 0, 'xa_ngoc_to', 'Xã Ngọc Tố', 'ngoc_to', '31723', 'xã', 3221, 'hienthi', 0, 1759490174, NULL),
(31654, 92, 0, 0, 'xa_truong_khanh', 'Xã Trường Khánh', 'truong_khanh', '31654', 'xã', 3222, 'hienthi', 0, 1759490174, NULL),
(31645, 92, 0, 0, 'xa_dai_ngai', 'Xã Đại Ngãi', 'dai_ngai', '31645', 'xã', 3223, 'hienthi', 0, 1759490174, NULL),
(31666, 92, 0, 0, 'xa_tan_thanh', 'Xã Tân Thạnh', 'tan_thanh', '31666', 'xã', 3224, 'hienthi', 0, 1759490174, NULL),
(31639, 92, 0, 0, 'xa_long_phu', 'Xã Long Phú', 'long_phu', '31639', 'xã', 3225, 'hienthi', 0, 1759490174, NULL),
(31552, 92, 0, 0, 'xa_nhon_my', 'Xã Nhơn Mỹ', 'nhon_my', '31552', 'xã', 3226, 'hienthi', 0, 1759490174, NULL),
(31537, 92, 0, 0, 'xa_phong_nam', 'Xã Phong Nẫm', 'phong_nam', '31537', 'xã', 3227, 'hienthi', 0, 1759490174, NULL),
(31531, 92, 0, 0, 'xa_an_lac_thon', 'Xã An Lạc Thôn', 'an_lac_thon', '31531', 'xã', 3228, 'hienthi', 0, 1759490174, NULL),
(31528, 92, 0, 0, 'xa_ke_sach', 'Xã Kế Sách', 'ke_sach', '31528', 'xã', 3229, 'hienthi', 0, 1759490174, NULL),
(31540, 92, 0, 0, 'xa_thoi_an_hoi', 'Xã Thới An Hội', 'thoi_an_hoi', '31540', 'xã', 3230, 'hienthi', 0, 1759490174, NULL),
(31561, 92, 0, 0, 'xa_dai_hai', 'Xã  Đại Hải', 'dai_hai', '31561', 'xã', 3231, 'hienthi', 0, 1759490174, NULL),
(31569, 92, 0, 0, 'xa_phu_tam', 'Xã Phú Tâm', 'phu_tam', '31569', 'xã', 3232, 'hienthi', 0, 1759490174, NULL),
(31594, 92, 0, 0, 'xa_an_ninh', 'Xã An Ninh', 'an_ninh', '31594', 'xã', 3233, 'hienthi', 0, 1759490174, NULL),
(31582, 92, 0, 0, 'xa_thuan_hoa', 'Xã Thuận Hòa', 'thuan_hoa', '31582', 'xã', 3234, 'hienthi', 0, 1759490174, NULL),
(31570, 92, 0, 0, 'xa_ho_dac_kien', 'Xã Hồ Đắc Kiện', 'ho_dac_kien', '31570', 'xã', 3235, 'hienthi', 0, 1759490174, NULL),
(31567, 92, 0, 0, 'xa_my_tu', 'Xã Mỹ Tú', 'my_tu', '31567', 'xã', 3236, 'hienthi', 0, 1759490174, NULL),
(31579, 92, 0, 0, 'xa_long_hung', 'Xã Long Hưng', 'long_hung', '31579', 'xã', 3237, 'hienthi', 0, 1759490174, NULL),
(31603, 92, 0, 0, 'xa_my_phuoc', 'Xã Mỹ Phước', 'my_phuoc', '31603', 'xã', 3238, 'hienthi', 0, 1759490174, NULL),
(31591, 92, 0, 0, 'xa_my_huong', 'Xã Mỹ Hương', 'my_huong', '31591', 'xã', 3239, 'hienthi', 0, 1759490174, NULL),
(31795, 92, 0, 0, 'xa_vinh_hai', 'Xã Vĩnh Hải', 'vinh_hai', '31795', 'xã', 3240, 'hienthi', 0, 1759490174, NULL),
(31810, 92, 0, 0, 'xa_lai_hoa', 'Xã Lai Hòa', 'lai_hoa', '31810', 'xã', 3241, 'hienthi', 0, 1759490174, NULL),
(31804, 92, 0, 0, 'phuong_vinh_phuoc', 'Phường Vĩnh Phước', 'vinh_phuoc', '31804', 'phường', 3242, 'hienthi', 0, 1759490174, NULL),
(31783, 92, 0, 0, 'phuong_vinh_chau', 'Phường Vĩnh Châu', 'vinh_chau', '31783', 'phường', 3243, 'hienthi', 0, 1759490174, NULL),
(31789, 92, 0, 0, 'phuong_khanh_hoa', 'Phường Khánh Hòa', 'khanh_hoa', '31789', 'phường', 3244, 'hienthi', 0, 1759490174, NULL),
(31741, 92, 0, 0, 'xa_tan_long', 'Xã Tân Long', 'tan_long', '31741', 'xã', 3245, 'hienthi', 0, 1759490174, NULL),
(31732, 92, 0, 0, 'phuong_nga_nam', 'Phường Ngã Năm', 'nga_nam', '31732', 'phường', 3246, 'hienthi', 0, 1759490174, NULL),
(31753, 92, 0, 0, 'phuong_my_quoi', 'Phường Mỹ Quới', 'my_quoi', '31753', 'phường', 3247, 'hienthi', 0, 1759490174, NULL),
(31756, 92, 0, 0, 'xa_phu_loc', 'Xã Phú Lộc', 'phu_loc', '31756', 'xã', 3248, 'hienthi', 0, 1759490174, NULL),
(31777, 92, 0, 0, 'xa_vinh_loi', 'Xã Vĩnh Lợi', 'vinh_loi', '31777', 'xã', 3249, 'hienthi', 0, 1759490174, NULL),
(31759, 92, 0, 0, 'xa_lam_tan', 'Xã Lâm Tân', 'lam_tan', '31759', 'xã', 3250, 'hienthi', 0, 1759490174, NULL),
(31699, 92, 0, 0, 'xa_thanh_thoi_an', 'Xã Thạnh Thới An', 'thanh_thoi_an', '31699', 'xã', 3251, 'hienthi', 0, 1759490174, NULL),
(31687, 92, 0, 0, 'xa_tai_van', 'Xã Tài Văn', 'tai_van', '31687', 'xã', 3252, 'hienthi', 0, 1759490174, NULL),
(31675, 92, 0, 0, 'xa_lieu_tu', 'Xã Liêu Tú', 'lieu_tu', '31675', 'xã', 3253, 'hienthi', 0, 1759490174, NULL),
(31679, 92, 0, 0, 'xa_lich_hoi_thuong', 'Xã Lịch Hội Thượng', 'lich_hoi_thuong', '31679', 'xã', 3254, 'hienthi', 0, 1759490174, NULL),
(31673, 92, 0, 0, 'xa_tran_de', 'Xã Trần Đề', 'tran_de', '31673', 'xã', 3255, 'hienthi', 0, 1759490174, NULL),
(31615, 92, 0, 0, 'xa_an_thanh', 'Xã An Thạnh', 'an_thanh', '31615', 'xã', 3256, 'hienthi', 0, 1759490174, NULL),
(31633, 92, 0, 0, 'xa_cu_lao_dung', 'Xã Cù Lao Dung', 'cu_lao_dung', '31633', 'xã', 3257, 'hienthi', 0, 1759490174, NULL),
(32002, 96, 0, 0, 'phuong_an_xuyen', 'Phường An Xuyên', 'an_xuyen', '32002', 'phường', 3258, 'hienthi', 0, 1759490174, NULL),
(32014, 96, 0, 0, 'phuong_ly_van_lam', 'Phường Lý Văn Lâm', 'ly_van_lam', '32014', 'phường', 3259, 'hienthi', 0, 1759490174, NULL),
(32025, 96, 0, 0, 'phuong_tan_thanh', 'Phường Tân Thành', 'tan_thanh', '32025', 'phường', 3260, 'hienthi', 0, 1759490174, NULL),
(32041, 96, 0, 0, 'phuong_hoa_thanh', 'Phường Hòa Thành', 'hoa_thanh', '32041', 'phường', 3261, 'hienthi', 0, 1759490174, NULL),
(32167, 96, 0, 0, 'xa_tan_thuan', 'Xã Tân Thuận', 'tan_thuan', '32167', 'xã', 3262, 'hienthi', 0, 1759490174, NULL),
(32188, 96, 0, 0, 'xa_tan_tien', 'Xã Tân Tiến', 'tan_tien', '32188', 'xã', 3263, 'hienthi', 0, 1759490174, NULL),
(32155, 96, 0, 0, 'xa_ta_an_khuong', 'Xã Tạ An Khương', 'ta_an_khuong', '32155', 'xã', 3264, 'hienthi', 0, 1759490174, NULL),
(32161, 96, 0, 0, 'xa_tran_phan', 'Xã Trần Phán', 'tran_phan', '32161', 'xã', 3265, 'hienthi', 0, 1759490174, NULL),
(32185, 96, 0, 0, 'xa_thanh_tung', 'Xã Thanh Tùng', 'thanh_tung', '32185', 'xã', 3266, 'hienthi', 0, 1759490174, NULL),
(32152, 96, 0, 0, 'xa_dam_doi', 'Xã Đầm Dơi', 'dam_doi', '32152', 'xã', 3267, 'hienthi', 0, 1759490174, NULL),
(32182, 96, 0, 0, 'xa_quach_pham', 'Xã Quách Phẩm', 'quach_pham', '32182', 'xã', 3268, 'hienthi', 0, 1759490174, NULL),
(32047, 96, 0, 0, 'xa_u_minh', 'Xã U Minh', 'u_minh', '32047', 'xã', 3269, 'hienthi', 0, 1759490174, NULL),
(32044, 96, 0, 0, 'xa_nguyen_phich', 'Xã Nguyễn Phích', 'nguyen_phich', '32044', 'xã', 3270, 'hienthi', 0, 1759490174, NULL),
(32062, 96, 0, 0, 'xa_khanh_lam', 'Xã Khánh Lâm', 'khanh_lam', '32062', 'xã', 3271, 'hienthi', 0, 1759490174, NULL),
(32059, 96, 0, 0, 'xa_khanh_an', 'Xã Khánh An', 'khanh_an', '32059', 'xã', 3272, 'hienthi', 0, 1759490174, NULL),
(32244, 96, 0, 0, 'xa_phan_ngoc_hien', 'Xã Phan Ngọc Hiển', 'phan_ngoc_hien', '32244', 'xã', 3273, 'hienthi', 0, 1759490174, NULL),
(32248, 96, 0, 0, 'xa_dat_mui', 'Xã Đất Mũi', 'dat_mui', '32248', 'xã', 3274, 'hienthi', 0, 1759490174, NULL),
(32236, 96, 0, 0, 'xa_tan_an', 'Xã Tân Ân', 'tan_an', '32236', 'xã', 3275, 'hienthi', 0, 1759490174, NULL),
(32110, 96, 0, 0, 'xa_khanh_binh', 'Xã Khánh Bình', 'khanh_binh', '32110', 'xã', 3276, 'hienthi', 0, 1759490174, NULL),
(32104, 96, 0, 0, 'xa_da_bac', 'Xã Đá Bạc', 'da_bac', '32104', 'xã', 3277, 'hienthi', 0, 1759490174, NULL),
(32119, 96, 0, 0, 'xa_khanh_hung', 'Xã Khánh Hưng', 'khanh_hung', '32119', 'xã', 3278, 'hienthi', 0, 1759490174, NULL),
(32098, 96, 0, 0, 'xa_song_doc', 'Xã Sông Đốc', 'song_doc', '32098', 'xã', 3279, 'hienthi', 0, 1759490174, NULL),
(32095, 96, 0, 0, 'xa_tran_van_thoi', 'Xã Trần Văn Thời', 'tran_van_thoi', '32095', 'xã', 3280, 'hienthi', 0, 1759490174, NULL),
(32065, 96, 0, 0, 'xa_thoi_binh', 'Xã Thới Bình', 'thoi_binh', '32065', 'xã', 3281, 'hienthi', 0, 1759490174, NULL),
(32071, 96, 0, 0, 'xa_tri_phai', 'Xã Trí Phải', 'tri_phai', '32071', 'xã', 3282, 'hienthi', 0, 1759490174, NULL),
(32083, 96, 0, 0, 'xa_tan_loc', 'Xã Tân Lộc', 'tan_loc', '32083', 'xã', 3283, 'hienthi', 0, 1759490174, NULL),
(32092, 96, 0, 0, 'xa_ho_thi_ky', 'Xã Hồ Thị Kỷ', 'ho_thi_ky', '32092', 'xã', 3284, 'hienthi', 0, 1759490174, NULL),
(32069, 96, 0, 0, 'xa_bien_bach', 'Xã Biển Bạch', 'bien_bach', '32069', 'xã', 3285, 'hienthi', 0, 1759490174, NULL),
(32201, 96, 0, 0, 'xa_dat_moi', 'Xã Đất Mới', 'dat_moi', '32201', 'xã', 3286, 'hienthi', 0, 1759490174, NULL),
(32191, 96, 0, 0, 'xa_nam_can', 'Xã Năm Căn', 'nam_can', '32191', 'xã', 3287, 'hienthi', 0, 1759490174, NULL),
(32206, 96, 0, 0, 'xa_tam_giang', 'Xã Tam Giang', 'tam_giang', '32206', 'xã', 3288, 'hienthi', 0, 1759490174, NULL),
(32212, 96, 0, 0, 'xa_cai_doi_vam', 'Xã Cái Đôi Vàm', 'cai_doi_vam', '32212', 'xã', 3289, 'hienthi', 0, 1759490174, NULL),
(32227, 96, 0, 0, 'xa_nguyen_viet_khai', 'Xã Nguyễn Việt Khái', 'nguyen_viet_khai', '32227', 'xã', 3290, 'hienthi', 0, 1759490174, NULL),
(32218, 96, 0, 0, 'xa_phu_tan', 'Xã Phú Tân', 'phu_tan', '32218', 'xã', 3291, 'hienthi', 0, 1759490174, NULL),
(32214, 96, 0, 0, 'xa_phu_my', 'Xã Phú Mỹ', 'phu_my', '32214', 'xã', 3292, 'hienthi', 0, 1759490174, NULL),
(32134, 96, 0, 0, 'xa_luong_the_tran', 'Xã Lương Thế Trân', 'luong_the_tran', '32134', 'xã', 3293, 'hienthi', 0, 1759490174, NULL),
(32137, 96, 0, 0, 'xa_tan_hung', 'Xã Tân Hưng', 'tan_hung', '32137', 'xã', 3294, 'hienthi', 0, 1759490174, NULL),
(32140, 96, 0, 0, 'xa_hung_my', 'Xã Hưng Mỹ', 'hung_my', '32140', 'xã', 3295, 'hienthi', 0, 1759490174, NULL),
(32128, 96, 0, 0, 'xa_cai_nuoc', 'Xã Cái Nước', 'cai_nuoc', '32128', 'xã', 3296, 'hienthi', 0, 1759490174, NULL),
(31825, 96, 0, 0, 'phuong_bac_lieu', 'Phường Bạc Liêu', 'bac_lieu', '31825', 'phường', 3297, 'hienthi', 0, 1759490174, NULL),
(31834, 96, 0, 0, 'phuong_vinh_trach', 'Phường Vĩnh Trạch', 'vinh_trach', '31834', 'phường', 3298, 'hienthi', 0, 1759490174, NULL),
(31840, 96, 0, 0, 'phuong_hiep_thanh', 'Phường Hiệp Thành', 'hiep_thanh', '31840', 'phường', 3299, 'hienthi', 0, 1759490174, NULL),
(31942, 96, 0, 0, 'phuong_gia_rai', 'Phường Giá Rai', 'gia_rai', '31942', 'phường', 3300, 'hienthi', 0, 1759490174, NULL),
(31951, 96, 0, 0, 'phuong_lang_tron', 'Phường Láng Tròn', 'lang_tron', '31951', 'phường', 3301, 'hienthi', 0, 1759490174, NULL),
(31957, 96, 0, 0, 'xa_phong_thanh', 'Xã Phong Thạnh', 'phong_thanh', '31957', 'xã', 3302, 'hienthi', 0, 1759490174, NULL),
(31843, 96, 0, 0, 'xa_hong_dan', 'Xã Hồng Dân', 'hong_dan', '31843', 'xã', 3303, 'hienthi', 0, 1759490174, NULL),
(31858, 96, 0, 0, 'xa_vinh_loc', 'Xã Vĩnh Lộc', 'vinh_loc', '31858', 'xã', 3304, 'hienthi', 0, 1759490174, NULL),
(31864, 96, 0, 0, 'xa_ninh_thanh_loi', 'Xã Ninh Thạnh Lợi', 'ninh_thanh_loi', '31864', 'xã', 3305, 'hienthi', 0, 1759490174, NULL),
(31849, 96, 0, 0, 'xa_ninh_quoi', 'Xã Ninh Quới', 'ninh_quoi', '31849', 'xã', 3306, 'hienthi', 0, 1759490174, NULL),
(31972, 96, 0, 0, 'xa_ganh_hao', 'Xã Gành Hào', 'ganh_hao', '31972', 'xã', 3307, 'hienthi', 0, 1759490174, NULL),
(31993, 96, 0, 0, 'xa_dinh_thanh', 'Xã Định Thành', 'dinh_thanh', '31993', 'xã', 3308, 'hienthi', 0, 1759490174, NULL),
(31988, 96, 0, 0, 'xa_an_trach', 'Xã An Trạch', 'an_trach', '31988', 'xã', 3309, 'hienthi', 0, 1759490174, NULL),
(31985, 96, 0, 0, 'xa_long_dien', 'Xã Long Điền', 'long_dien', '31985', 'xã', 3310, 'hienthi', 0, 1759490174, NULL),
(31975, 96, 0, 0, 'xa_dong_hai', 'Xã Đông Hải', 'dong_hai', '31975', 'xã', 3311, 'hienthi', 0, 1759490174, NULL),
(31891, 96, 0, 0, 'xa_hoa_binh', 'Xã Hòa Bình', 'hoa_binh', '31891', 'xã', 3312, 'hienthi', 0, 1759490174, NULL),
(31918, 96, 0, 0, 'xa_vinh_my', 'Xã Vĩnh Mỹ', 'vinh_my', '31918', 'xã', 3313, 'hienthi', 0, 1759490174, NULL),
(31927, 96, 0, 0, 'xa_vinh_hau', 'Xã Vĩnh Hậu', 'vinh_hau', '31927', 'xã', 3314, 'hienthi', 0, 1759490174, NULL),
(31867, 96, 0, 0, 'xa_phuoc_long', 'Xã Phước Long', 'phuoc_long', '31867', 'xã', 3315, 'hienthi', 0, 1759490174, NULL),
(31876, 96, 0, 0, 'xa_vinh_phuoc', 'Xã Vĩnh Phước', 'vinh_phuoc', '31876', 'xã', 3316, 'hienthi', 0, 1759490174, NULL),
(31885, 96, 0, 0, 'xa_phong_hiep', 'Xã Phong Hiệp', 'phong_hiep', '31885', 'xã', 3317, 'hienthi', 0, 1759490174, NULL),
(31882, 96, 0, 0, 'xa_vinh_thanh', 'Xã Vĩnh Thanh', 'vinh_thanh', '31882', 'xã', 3318, 'hienthi', 0, 1759490174, NULL),
(31900, 96, 0, 0, 'xa_vinh_loi', 'Xã Vĩnh Lợi', 'vinh_loi', '31900', 'xã', 3319, 'hienthi', 0, 1759490174, NULL),
(31906, 96, 0, 0, 'xa_hung_hoi', 'Xã Hưng Hội', 'hung_hoi', '31906', 'xã', 3320, 'hienthi', 0, 1759490174, NULL),
(31894, 96, 0, 0, 'xa_chau_thoi', 'Xã Châu Thới', 'chau_thoi', '31894', 'xã', 3321, 'hienthi', 0, 1759490174, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `table_attributes`
--
ALTER TABLE `table_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_attribute_options`
--
ALTER TABLE `table_attribute_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `table_city`
--
ALTER TABLE `table_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_color`
--
ALTER TABLE `table_color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_comment`
--
ALTER TABLE `table_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_comment_photo`
--
ALTER TABLE `table_comment_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_comment_video`
--
ALTER TABLE `table_comment_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_contact`
--
ALTER TABLE `table_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_counter`
--
ALTER TABLE `table_counter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_district`
--
ALTER TABLE `table_district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_excel`
--
ALTER TABLE `table_excel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_gallery`
--
ALTER TABLE `table_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_keyword_rank`
--
ALTER TABLE `table_keyword_rank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_lang`
--
ALTER TABLE `table_lang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_member`
--
ALTER TABLE `table_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_news`
--
ALTER TABLE `table_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_newsletter`
--
ALTER TABLE `table_newsletter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_news_cat`
--
ALTER TABLE `table_news_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_news_item`
--
ALTER TABLE `table_news_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_news_list`
--
ALTER TABLE `table_news_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_news_sub`
--
ALTER TABLE `table_news_sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_news_tags`
--
ALTER TABLE `table_news_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_order`
--
ALTER TABLE `table_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_order_detail`
--
ALTER TABLE `table_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_order_status`
--
ALTER TABLE `table_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_permission`
--
ALTER TABLE `table_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_permission_group`
--
ALTER TABLE `table_permission_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_photo`
--
ALTER TABLE `table_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_product`
--
ALTER TABLE `table_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_product_attributes`
--
ALTER TABLE `table_product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `table_product_attribute_options`
--
ALTER TABLE `table_product_attribute_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `table_product_brand`
--
ALTER TABLE `table_product_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_product_cat`
--
ALTER TABLE `table_product_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_product_item`
--
ALTER TABLE `table_product_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_product_list`
--
ALTER TABLE `table_product_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_product_sale`
--
ALTER TABLE `table_product_sale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_product_sub`
--
ALTER TABLE `table_product_sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_product_tags`
--
ALTER TABLE `table_product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_product_variants`
--
ALTER TABLE `table_product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`combination_key`),
  ADD KEY `product_id_2` (`product_id`);

--
-- Indexes for table `table_product_variant_options`
--
ALTER TABLE `table_product_variant_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Indexes for table `table_pushonesignal`
--
ALTER TABLE `table_pushonesignal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_search`
--
ALTER TABLE `table_search`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_seo`
--
ALTER TABLE `table_seo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_seopage`
--
ALTER TABLE `table_seopage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_setting`
--
ALTER TABLE `table_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_size`
--
ALTER TABLE `table_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_static`
--
ALTER TABLE `table_static`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_tags`
--
ALTER TABLE `table_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_user`
--
ALTER TABLE `table_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_user_limit`
--
ALTER TABLE `table_user_limit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_user_log`
--
ALTER TABLE `table_user_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_ward`
--
ALTER TABLE `table_ward`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `table_attributes`
--
ALTER TABLE `table_attributes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `table_attribute_options`
--
ALTER TABLE `table_attribute_options`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `table_city`
--
ALTER TABLE `table_city`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `table_color`
--
ALTER TABLE `table_color`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `table_comment`
--
ALTER TABLE `table_comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_comment_photo`
--
ALTER TABLE `table_comment_photo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_comment_video`
--
ALTER TABLE `table_comment_video`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_contact`
--
ALTER TABLE `table_contact`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `table_counter`
--
ALTER TABLE `table_counter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `table_district`
--
ALTER TABLE `table_district`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_excel`
--
ALTER TABLE `table_excel`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_gallery`
--
ALTER TABLE `table_gallery`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3472;

--
-- AUTO_INCREMENT for table `table_keyword_rank`
--
ALTER TABLE `table_keyword_rank`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_lang`
--
ALTER TABLE `table_lang`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=793;

--
-- AUTO_INCREMENT for table `table_member`
--
ALTER TABLE `table_member`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_news`
--
ALTER TABLE `table_news`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `table_newsletter`
--
ALTER TABLE `table_newsletter`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `table_news_cat`
--
ALTER TABLE `table_news_cat`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_news_item`
--
ALTER TABLE `table_news_item`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_news_list`
--
ALTER TABLE `table_news_list`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `table_news_sub`
--
ALTER TABLE `table_news_sub`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_news_tags`
--
ALTER TABLE `table_news_tags`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `table_order`
--
ALTER TABLE `table_order`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `table_order_detail`
--
ALTER TABLE `table_order_detail`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `table_order_status`
--
ALTER TABLE `table_order_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `table_permission`
--
ALTER TABLE `table_permission`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1996;

--
-- AUTO_INCREMENT for table `table_permission_group`
--
ALTER TABLE `table_permission_group`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `table_photo`
--
ALTER TABLE `table_photo`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `table_product`
--
ALTER TABLE `table_product`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_product_attributes`
--
ALTER TABLE `table_product_attributes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_product_attribute_options`
--
ALTER TABLE `table_product_attribute_options`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_product_brand`
--
ALTER TABLE `table_product_brand`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_product_cat`
--
ALTER TABLE `table_product_cat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_product_item`
--
ALTER TABLE `table_product_item`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_product_list`
--
ALTER TABLE `table_product_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_product_sale`
--
ALTER TABLE `table_product_sale`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `table_product_sub`
--
ALTER TABLE `table_product_sub`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_product_tags`
--
ALTER TABLE `table_product_tags`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;

--
-- AUTO_INCREMENT for table `table_product_variants`
--
ALTER TABLE `table_product_variants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_product_variant_options`
--
ALTER TABLE `table_product_variant_options`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_pushonesignal`
--
ALTER TABLE `table_pushonesignal`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_search`
--
ALTER TABLE `table_search`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_seo`
--
ALTER TABLE `table_seo`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=488;

--
-- AUTO_INCREMENT for table `table_seopage`
--
ALTER TABLE `table_seopage`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `table_setting`
--
ALTER TABLE `table_setting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `table_size`
--
ALTER TABLE `table_size`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `table_static`
--
ALTER TABLE `table_static`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `table_tags`
--
ALTER TABLE `table_tags`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `table_user`
--
ALTER TABLE `table_user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `table_user_limit`
--
ALTER TABLE `table_user_limit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_user_log`
--
ALTER TABLE `table_user_log`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `table_ward`
--
ALTER TABLE `table_ward`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32249;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
