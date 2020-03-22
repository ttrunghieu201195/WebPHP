-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 22, 2020 lúc 05:41 AM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `warehouse`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_addresses`
--

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_adjustment_items`
--

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_agency_levels`
--

CREATE TABLE `sma_agency_levels` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_agency_levels`
--

INSERT INTO `sma_agency_levels` (`id`, `name`) VALUES
(2, '444'),
(3, '444'),
(1, 'ssss');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_api_keys`
--

CREATE TABLE `sma_api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reference` varchar(40) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_api_limits`
--

CREATE TABLE `sma_api_limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_api_logs`
--

CREATE TABLE `sma_api_logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_brands`
--

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `active_flag` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_brands`
--

INSERT INTO `sma_brands` (`id`, `code`, `name`, `image`, `slug`, `active_flag`) VALUES
(1, '893614327', 'Nutshealth', 'home_brand-1.png', 'nutshealth', 1),
(2, '', 'Brand 12', 'home_brand-2.png', 'brand-12', 1),
(3, 'test_3', 'test_3', 'home_brand-2.png', 'test_3', 1),
(4, 'test_4', 'test_4', 'home_brand-2.png', 'test_4', 1),
(5, 'test_5', 'test_5', 'home_brand-2.png', 'test_5', 1),
(6, 'test_6', 'test_6', 'home_brand-2.png', 'test_6', 1),
(7, 'test_7', 'test_7', 'home_brand-2.png', 'test_7', 1),
(8, 'test_8', 'test 8', 'home_brand-2.png', 'test-8', 1),
(14, 'test_9', 'test 9', 'ac2311fdd431d059a4db58909ce28890.png', 'test-9', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_cart`
--

CREATE TABLE `sma_cart` (
  `id` varchar(40) NOT NULL,
  `time` varchar(30) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_cart`
--

INSERT INTO `sma_cart` (`id`, `time`, `user_id`, `data`) VALUES
('1b2a8f0eb79a794e8cb9502daf93bdbe', '1578583374', 1, '{\"cart_total\":832968,\"total_item_tax\":0,\"total_items\":18,\"total_unique_items\":18,\"8b73b899ca64d9c13a95a12ef360588f\":{\"id\":\"7dc75b7d063203395f149bd9f3ffb775\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"8b73b899ca64d9c13a95a12ef360588f\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"cc955d90d4c8e0fc6e69b78032a1d378\":{\"id\":\"930c6c28168c13120797ac103b4cb468\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"cc955d90d4c8e0fc6e69b78032a1d378\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"192484f810f86a2ced515147926e6965\":{\"id\":\"5e4c5ea5aa9bfb87c77d22d3534b81a0\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"192484f810f86a2ced515147926e6965\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"9ab83651c4c5e7264bf8a8c8ba0e7c54\":{\"id\":\"87a8c364700c42e1afb4198d1aa090ad\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"9ab83651c4c5e7264bf8a8c8ba0e7c54\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"95199e70d065db6d81db087f425a1b31\":{\"id\":\"4aca614eb2c76d82ff8cc29c099d708e\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"95199e70d065db6d81db087f425a1b31\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"effb6b9e7d8fe6cc7a940d353dc2e94e\":{\"id\":\"ab27a5426e5217279e76b0b743531680\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"effb6b9e7d8fe6cc7a940d353dc2e94e\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"9c35325b8396aedd348f7245c51fea1d\":{\"id\":\"24bcaedea391dc86cf3edf2cc76c4ce4\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"9c35325b8396aedd348f7245c51fea1d\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"4cd6b5256087f30dd4650880c132aea9\":{\"id\":\"cd2f9ffe23f1b8a79a6d9cf43e362ece\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"4cd6b5256087f30dd4650880c132aea9\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"5aba14190d120ee397b01254fa959fcf\":{\"id\":\"a7189ca95230761f86f1b1f3c43cf99f\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"5aba14190d120ee397b01254fa959fcf\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"cf1c59cc345a37acbec61f0e03ec1590\":{\"id\":\"c4577c4b691429f7d8c3f139487c28fa\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"cf1c59cc345a37acbec61f0e03ec1590\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"5cd8526fe8c1914eae5cbbb80171e604\":{\"id\":\"f2127e291b45030b780098e3bc6596a3\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"5cd8526fe8c1914eae5cbbb80171e604\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"9a4e68117181866e8447f71792265a60\":{\"id\":\"2feeb916cd937ca829b4c90a468afd97\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"9a4e68117181866e8447f71792265a60\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"9d524149b7e29891c6dc150cf013b56a\":{\"id\":\"40847987dedfa154dbae453b41b43c36\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"9d524149b7e29891c6dc150cf013b56a\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"b9a108332ae07b75698e85270d72704f\":{\"id\":\"69915667a380db228e8da0f7b8747503\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"b9a108332ae07b75698e85270d72704f\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"dade8396a7701f3e5dbbc6812659f254\":{\"id\":\"12d366545f5d1eafda43e03ce80028bc\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"dade8396a7701f3e5dbbc6812659f254\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"5307e90822770f648a43dc562e90d309\":{\"id\":\"c263e8345a2258d49db6ef93e38033db\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"5307e90822770f648a43dc562e90d309\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"a4f03b39826d1e75bdf3880755a8b5cd\":{\"id\":\"893f1190c21bc95fdb47dec0b3c6034a\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"a4f03b39826d1e75bdf3880755a8b5cd\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"9d9d221169427d7991a507575dbac780\":{\"id\":\"a00b84099bd1c23e4c70b5bc2f584e56\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"9d9d221169427d7991a507575dbac780\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"}}'),
('2ff98f65533f1a9f163dc5085fb62bee', '1537147184', NULL, '{\"cart_total\":43000,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"95dbc936482ca0e31d39e301e89d8982\":{\"id\":\"a6a3c0ec96d8ebcdb84377f5a2dd04f0\",\"product_id\":\"6\",\"qty\":1,\"name\":\"&Oacute;c ch&oacute; v\\u1ecf\",\"slug\":\"oc-cho-vo-100gr\",\"code\":\"893614327006\",\"price\":43000,\"tax\":\"0.00\",\"image\":\"a329ceec9d6ca29af3e326c1027c98f1.jpg\",\"option\":false,\"options\":null,\"rowid\":\"95dbc936482ca0e31d39e301e89d8982\",\"row_tax\":\"0.0000\",\"subtotal\":\"43000.0000\"}}'),
('49057feed2d960e0f16531a0fb29d172', '1523864926', NULL, '{\"cart_total\":45000,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"356b521e377d7e2ca53c507f63083951\":{\"id\":\"c6ddf862cf7b69e94d3380b99d94d3dd\",\"product_id\":\"2\",\"qty\":1,\"name\":\"Macca v\\u1ecf\",\"slug\":\"macca-vo\",\"code\":\"893614327090\",\"price\":45000,\"tax\":\"0.00\",\"image\":\"ef6baae6ae669f4ea96cb784713e535e.jpg\",\"option\":false,\"options\":null,\"rowid\":\"356b521e377d7e2ca53c507f63083951\",\"row_tax\":\"0.0000\",\"subtotal\":\"45000.0000\"}}'),
('688a9042eba28fd0b5a6d67ebb199d7d', '1567463272', 1, '{\"cart_total\":610000,\"total_item_tax\":0,\"total_items\":4,\"total_unique_items\":3,\"c3f458569dc890aacb4f53553e398de7\":{\"id\":\"166ed78bb47d024fef03f5e95dedab83\",\"product_id\":\"25\",\"qty\":1,\"name\":\"Test aaaaa 2\",\"slug\":\"aaaaa-2333\",\"code\":null,\"price\":200000,\"tax\":\"0.00\",\"image\":\"ttr-accommodation-4.jpg\",\"option\":false,\"options\":null,\"rowid\":\"c3f458569dc890aacb4f53553e398de7\",\"row_tax\":\"0.0000\",\"subtotal\":\"200000.0000\"},\"4a175f2263cc433d48eb8df7b16c69bf\":{\"id\":\"57ef13004eb810e4649be12dd8660c4c\",\"product_id\":\"25\",\"qty\":2,\"name\":\"Test aaaaa 2\",\"slug\":\"aaaaa-2333\",\"code\":null,\"price\":200000,\"tax\":\"0.00\",\"image\":\"ttr-accommodation-4.jpg\",\"option\":false,\"options\":null,\"rowid\":\"4a175f2263cc433d48eb8df7b16c69bf\",\"row_tax\":\"0.0000\",\"subtotal\":\"400000.0000\"},\"f1ac427ee882772948962e9762279514\":{\"id\":\"25386b386528fe555323c187e12e4387\",\"product_id\":\"15\",\"qty\":1,\"name\":\"CPU Intel\",\"slug\":\"cpu-intel\",\"code\":null,\"price\":10000,\"tax\":\"0.00\",\"image\":\"products\\/1366-768-beautiful-nature-wallpaper-big-size-widescreen.jpg\",\"option\":false,\"options\":null,\"rowid\":\"f1ac427ee882772948962e9762279514\",\"row_tax\":\"0.0000\",\"subtotal\":\"10000.0000\"}}'),
('81ab5efec1de16aa51e5c790f2eafbd1', '1559992285', 1, '{\"cart_total\":10012552,\"total_item_tax\":0,\"total_items\":22,\"total_unique_items\":7,\"1c183ca7b5ffad8f8a1049eb93983a2b\":{\"id\":\"50a63e9982d78ebfd89e74aba7c3ae80\",\"product_id\":\"14\",\"qty\":16,\"name\":\"Gi\\u1ecf qu&agrave; t\\u1ebft ABC\",\"slug\":\"gio-qua-tet-abc\",\"code\":\"45617641\",\"price\":530000,\"tax\":\"0.00\",\"image\":\"\",\"option\":false,\"options\":null,\"rowid\":\"1c183ca7b5ffad8f8a1049eb93983a2b\",\"row_tax\":\"0.0000\",\"subtotal\":\"8480000.0000\"},\"89d22107ef52041350150f8be3de5876\":{\"id\":\"00f8cf9b82a11b1af6c30d3e14d35fbe\",\"product_id\":\"8\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 500gr\",\"slug\":\"hanh-nhan-vo-500gr\",\"code\":\"893614327008\",\"price\":190000,\"tax\":\"0.00\",\"image\":\"no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"89d22107ef52041350150f8be3de5876\",\"row_tax\":\"0.0000\",\"subtotal\":\"190000.0000\"},\"f41bac8573554aeb1c31513d2aa4065e\":{\"id\":\"cc931edca9d8d3f39fd4e63b61b8a4e3\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"f41bac8573554aeb1c31513d2aa4065e\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"61738b2d9a228a27a0ae018e946d9261\":{\"id\":\"6f40de0eef32bcd6ca9c4a59262a0101\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"61738b2d9a228a27a0ae018e946d9261\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"},\"3ac422dd605df36aabceeaf936dc2fea\":{\"id\":\"1d07788c8e793d7d6f691b50acef7c5f\",\"product_id\":\"14\",\"qty\":1,\"name\":\"Gi\\u1ecf qu&agrave; t\\u1ebft ABC\",\"slug\":\"gio-qua-tet-abc\",\"code\":\"45617641\",\"price\":530000,\"tax\":\"0.00\",\"image\":\"\",\"option\":false,\"options\":null,\"rowid\":\"3ac422dd605df36aabceeaf936dc2fea\",\"row_tax\":\"0.0000\",\"subtotal\":\"530000.0000\"},\"c74c3d1e5fb6b1272ed488080fc8b945\":{\"id\":\"d38d677e89984ed70d57460e58dc7d0f\",\"product_id\":\"14\",\"qty\":1,\"name\":\"Gi\\u1ecf qu&agrave; t\\u1ebft ABC\",\"slug\":\"gio-qua-tet-abc\",\"code\":\"45617641\",\"price\":530000,\"tax\":\"0.00\",\"image\":\"\",\"option\":false,\"options\":null,\"rowid\":\"c74c3d1e5fb6b1272ed488080fc8b945\",\"row_tax\":\"0.0000\",\"subtotal\":\"530000.0000\"},\"2d1c6b7262a5c0bc116abcdeaa9cebfe\":{\"id\":\"9d31f97c2ff09addeb05a1c4a2c2417c\",\"product_id\":\"8\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 500gr\",\"slug\":\"hanh-nhan-vo-500gr\",\"code\":\"893614327008\",\"price\":190000,\"tax\":\"0.00\",\"image\":\"no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"2d1c6b7262a5c0bc116abcdeaa9cebfe\",\"row_tax\":\"0.0000\",\"subtotal\":\"190000.0000\"}}'),
('ad66556e1271f4c3b4d388ee381a4dec', '1560096467', NULL, '{\"cart_total\":190000,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"4a41bef1f4751e7caccf3ad285d2cee4\":{\"id\":\"88dbc148efbec18900a8850aa3e75fc8\",\"product_id\":\"8\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 500gr\",\"slug\":\"hanh-nhan-vo-500gr\",\"code\":\"893614327008\",\"price\":190000,\"tax\":\"0.00\",\"image\":\"no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"4a41bef1f4751e7caccf3ad285d2cee4\",\"row_tax\":\"0.0000\",\"subtotal\":\"190000.0000\"}}'),
('bd457db6eb36400e25afe76507481ca8', '1577719762', 1, '{\"cart_total\":196276,\"total_item_tax\":0,\"total_items\":2,\"total_unique_items\":2,\"b7416daa7321027f64e044e8d61e4410\":{\"id\":\"ed2c782fb55e56c9a0044ea99abb52f4\",\"product_id\":\"40\",\"qty\":1,\"name\":\"Test add new main dell with variants Tett add new main dell with variants Test add new main dell with variants\",\"slug\":\"test-add-new-main-dell-with-variants-tett-add-new-main-dell-with-variants-test-add-new-main-dell-with-variants\",\"code\":null,\"price\":150000,\"tax\":\"0.00\",\"image\":\"2019\\/10\\/main-p-probook-640-g1.jpg\",\"option\":false,\"options\":null,\"rowid\":\"b7416daa7321027f64e044e8d61e4410\",\"row_tax\":\"0.0000\",\"subtotal\":\"150000.0000\"},\"8a8078a83db95d49c718e586a913f082\":{\"id\":\"7f23f4cf0a57e09198bdd72f90840305\",\"product_id\":\"9\",\"qty\":1,\"name\":\"H\\u1ea1nh nh&acirc;n v\\u1ecf 100gr\",\"slug\":\"hanh-nhan-vo-100gr\",\"code\":\"893614327349\",\"price\":46276,\"tax\":\"0.00\",\"image\":\"2019\\/09\\/1569171474156917115015691214281568988790no_image.png\",\"option\":false,\"options\":null,\"rowid\":\"8a8078a83db95d49c718e586a913f082\",\"row_tax\":\"0.0000\",\"subtotal\":\"46276.0000\"}}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `order` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `keywords`, `meta_description`, `short_description`, `description`, `order`, `group_id`) VALUES
(2, '893614327', 'Hạt Dinh Dưỡng', NULL, 0, 'hat-dinh-duong', '', '', '', '', 0, 0),
(3, 'laptop', 'Laptop', NULL, 0, 'laptop', '', '', '', '', 0, 183),
(4, 'laptopmini', 'Laptop Mini', NULL, 3, 'laptop-mini', '', '', '', '', 0, 0),
(5, 'test', 'Test', NULL, 0, 'test', '', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_category_groups`
--

CREATE TABLE `sma_category_groups` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `keywords` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `order` int(11) NOT NULL,
  `active_flag` tinyint(1) DEFAULT NULL,
  `icon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_category_groups`
--

INSERT INTO `sma_category_groups` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `keywords`, `meta_description`, `short_description`, `description`, `order`, `active_flag`, `icon`) VALUES
(8, 'linh-kien-laptop', 'LINH KIEN LAPTOP', 'mt-1390_home_bg04.png', 0, 'linh-kien-laptop', '', '', '', '', 4, 1, 'fa-bars '),
(9, 'dung-cu-sua-chua', 'Dụng Cụ Sữa Chữa', 'mt-1390_home_bg04.png', 0, 'dung-cu-sua-chua', '', '', '', '', 2, 1, ''),
(11, 'ic-chipset', 'IC CHIPSET', 'mt-1390_home_bg04.png', 0, 'ic-chipset', '', '', '', '', 1, 1, ''),
(183, 'main-laptop', 'Main Laptop', 'mt-1390_home_bg04.png', 0, 'main-laptop', '', '', '', '', 0, 1, ''),
(230, 'cpu-ram-hdd-ssd', 'CPU-RAM-HDD-SSD', 'mt-1390_home_bg04.png', 0, 'cpu-ram-hdd-ssd', '', '', '', '', 3, 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_combo_items`
--

INSERT INTO `sma_combo_items` (`id`, `product_id`, `item_code`, `quantity`, `unit_price`) VALUES
(1, 14, '893614327003', '1.0000', '485000.0000'),
(2, 14, '893614327090', '1.0000', '45000.0000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`) VALUES
(1, 3, 'customer', 1, 'General', 'Walk-in Customer', 'Walk-in Customer', '', 'Customer Address', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', '0123456789', 'customer@tecdiary.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, 3, 'aaaa'),
(2, 4, 'supplier', NULL, NULL, 'Nutshealth', 'Nutshealth', '', '644/4 Đường 3 tháng 2', 'Hồ Chí Minh', '', '70000', 'Việt Nam', '0905529384', 'info@nutshealth.com.vn', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(3, NULL, 'biller', NULL, NULL, 'Đỗ Thị Kim Chi', 'Nutshealth', '5555', '644/4 Đường 3 tháng 2', 'Hồ Chí Minh', '', '', 'Country', '01237720112', 'kimchi@nutshealth.com.vn', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'header_logo.png', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`) VALUES
(3, '2018-12-04', 2, 3, 1, 1, '1.0000', '30000.0000', '30000.0000', '12000.0000', '12000.0000', '998.0000', 1, 0, NULL),
(35, '2018-12-04', 2, 35, 2, 1, '1.0000', '30000.0000', '30000.0000', '12000.0000', '12000.0000', '1033.0000', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0',
  `symbol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(1, 'USD', 'US Dollar', '1.0000', 0, '$'),
(2, 'EUR', 'Euro', '0.7340', 0, '€'),
(3, 'VND', 'Việt Nam Đồng', '1.0000', 1, 'đ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'General', 0),
(2, 'Reseller', -5),
(3, 'Distributor', -15),
(4, 'New Customer (+10)', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_gift_card_topups`
--

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, '<p>Thank you for purchasing Stock Manager Advance. Please don\'t forget to check the documentation in help folder. If you find any error/bug, please email to support@tecdiary.com with details. You can send us your valued suggestions/feedback too.</p><p>Please rate Stock Manager Advance on your download page of codecanyon.net</p>', '2014-08-14 23:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1',
  `ppay` int(11) NOT NULL DEFAULT '1',
  `qa` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2018-03-01', 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_pages`
--

CREATE TABLE `sma_pages` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `title` varchar(60) NOT NULL,
  `description` varchar(180) NOT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `body` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_no` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_pages`
--

INSERT INTO `sma_pages` (`id`, `name`, `title`, `description`, `slug`, `body`, `active`, `updated_at`, `order_no`) VALUES
(1, 'About Us', 'About Us', 'About Us', 'about-us', 'About Us', 1, '2019-06-09 23:20:31', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0',
  `products-stock_count` tinyint(1) DEFAULT '0',
  `edit_price` tinyint(1) DEFAULT '0',
  `returns-index` tinyint(1) DEFAULT '0',
  `returns-add` tinyint(1) DEFAULT '0',
  `returns-edit` tinyint(1) DEFAULT '0',
  `returns-delete` tinyint(1) DEFAULT '0',
  `returns-email` tinyint(1) DEFAULT '0',
  `returns-pdf` tinyint(1) DEFAULT '0',
  `reports-tax` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`, `returns-index`, `returns-add`, `returns-edit`, `returns-delete`, `returns-email`, `returns-pdf`, `reports-tax`) VALUES
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2018-03-28 22:55:19', 1, '0.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.3.0',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES
(1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.3.0', 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_price_groups`
--

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(3, 'aaaa'),
(1, 'Default');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_printers`
--

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sku` varchar(50) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `price_range` varchar(50) DEFAULT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `product_gallery` text,
  `shopee_id` varchar(30) DEFAULT NULL,
  `lazada_id` varchar(30) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `badge` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `short_description` text,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `length` decimal(10,4) DEFAULT NULL,
  `width` decimal(10,4) DEFAULT NULL,
  `height` decimal(10,4) DEFAULT NULL,
  `hsn_code` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `second_name` varchar(255) DEFAULT NULL,
  `warranty` int(11) DEFAULT NULL,
  `variants` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `created_date`, `updated_time`, `sku`, `unit`, `cost`, `price`, `price_range`, `alert_quantity`, `image`, `product_gallery`, `shopee_id`, `lazada_id`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `badge`, `keywords`, `meta_description`, `short_description`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `length`, `width`, `height`, `hsn_code`, `views`, `hide`, `second_name`, `warranty`, `variants`) VALUES
(1, '893614327341', 'Hạt Mixed Nut', NULL, '2020-02-16 05:59:12', '', 1, '100000.0000', '180000.0000', NULL, '20.0000', '1.jpg', '', '', '', 2, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', '', '', '', '', NULL, '', NULL, 'standard', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1, 'hat-mixed-nut', 1, '500.0000', '0.0000', '0.0000', '0.0000', NULL, 9, 0, '', NULL, 0),
(2, '893614327090', 'Macca vỏ', NULL, '2020-02-21 14:04:37', '', 1, '30000.0000', '45000.0000', NULL, '20.0000', '1.jpg', '', '', '', 2, NULL, '', '', '', '', '', '', '1033.0000', NULL, 1, '', NULL, 'code128', '', '', '', '', NULL, '', NULL, 'standard', 2, '30000.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1, 'macca-vo', 1, '100.0000', '0.0000', '0.0000', '0.0000', NULL, 10, 0, '', NULL, 0),
(3, NULL, 'Macca nhân', NULL, '2020-02-21 13:28:39', '', NULL, NULL, '485000.0000', NULL, NULL, '1.jpg', '', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '300.0000', NULL, 0, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'macca-nhan', NULL, '500.0000', NULL, '0.0000', '0.0000', NULL, 15, 0, NULL, 0, NULL),
(4, '893614327004', 'Macca nhân', NULL, '2020-02-16 05:59:12', '', 1, '80000.0000', '95000.0000', NULL, '20.0000', '1.jpg', '', '', '', 2, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', '', '', '', '', NULL, '', NULL, 'standard', 2, '80000.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 1, 'macca-nhan-100gr', 1, '100.0000', '0.0000', '0.0000', '0.0000', NULL, 1, 0, '', NULL, 0),
(5, '893614327005', 'Óc chó vỏ', NULL, '2020-02-16 05:59:12', '', 1, NULL, '160000.0000', NULL, '20.0000', '1.jpg', '', '', '', 2, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', '', '', '', '', NULL, '', NULL, 'standard', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1, 'oc-cho-vo', 1, '500.0000', '0.0000', '0.0000', '0.0000', NULL, 10, 0, '', NULL, 0),
(6, '893614327006', 'Óc chó vỏ', NULL, '2020-02-16 05:59:12', '', 1, '30000.0000', '43000.0000', NULL, '20.0000', '1.jpg', '', '', '', 2, NULL, '', '', '', '', '', '', '2000.0000', NULL, 1, '', NULL, 'code128', '', '', '', '', NULL, '', NULL, 'standard', 2, '30000.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1, 'oc-cho-vo-100gr', 1, '100.0000', '0.0000', '0.0000', '0.0000', NULL, 1, 0, '', NULL, 0),
(7, '893614327007', 'Óc chó nhân', NULL, '2020-02-16 05:59:12', '', 1, '0.0000', '0.0000', NULL, '20.0000', '1.jpg', '', '', '', 2, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', '', '', '', '', NULL, '', NULL, 'standard', 2, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1, 'oc-cho-nhan-300gr', NULL, '300.0000', '0.0000', '0.0000', '0.0000', NULL, 0, 0, '', NULL, 0),
(8, NULL, 'Hạnh nhân vỏ 500gr', NULL, '2020-02-16 05:59:12', 'TEST789', NULL, NULL, '190000.0000', NULL, NULL, '1.jpg', '', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 0, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'hanh-nhan-vo-500gr', NULL, '500.0000', NULL, '0.0000', '0.0000', NULL, 1, 0, NULL, 0, NULL),
(9, '893614327349', 'Hạnh nhân vỏ 100gr', NULL, '2020-02-16 05:59:12', '', 1, '43471.0000', '46276.0000', NULL, '20.0000', '1.jpg', '', '', '', 2, NULL, '', '', '', '', '', '', '2000.0000', NULL, 1, '', NULL, 'code128', '', '', '', '', NULL, '', NULL, 'standard', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1, 'hanh-nhan-vo-100gr', NULL, '100.0000', '0.0000', '0.0000', '0.0000', NULL, 7, 0, '', NULL, 0),
(10, NULL, 'Test product 123', NULL, '2020-02-16 05:59:12', '', NULL, NULL, '1200000.0000', NULL, NULL, '1.jpg', '', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 0, NULL, NULL, NULL, '', '', '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test-product-123', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, 1, 0, NULL, NULL, 0),
(11, '83762168', 'Test product', NULL, '2020-02-16 05:59:12', '', 1, '150000.0000', '200000.0000', NULL, '0.0000', '1.jpg', '', '', '', 2, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', '', '', '', '', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'test-product', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, 0, 0, '', NULL, 0),
(12, '84909447', 'Test Product Variants', NULL, '2020-02-16 05:59:12', '', 1, '1000.0000', '1000.0000', NULL, '0.0000', '1.jpg', '', '', '', 2, NULL, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', '', '', '', '', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1, 'test-product-variants', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, 1, 0, '', NULL, 0),
(13, '57148408', 'Test product variants', NULL, '2020-02-16 05:59:12', '', 1, '1000.0000', '1000.0000', NULL, '0.0000', '1.jpg', '', '', '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 1, '', NULL, 'code128', '', '', '', '', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 1, 'test-product-variants-9', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, 0, 0, '', NULL, 0),
(14, NULL, 'Giỏ quà tết ABC', NULL, '2020-02-16 05:59:12', '', NULL, NULL, '530000.0000', NULL, NULL, '1.jpg', '2019/09/1569171474156917115015691214281568988790bd.jpg', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 0, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'gio-qua-tet-abc', NULL, '0.0000', NULL, '0.0000', '0.0000', NULL, 11, 0, NULL, 0, 1),
(15, NULL, 'Test update main dell with 2 variants', NULL, '2020-02-16 05:59:12', '', NULL, NULL, '10000.0000', '0', NULL, '1.jpg', '2019/09/15692088791569171474156917115015691214281568988790banner2.jpg,2019/09/156920887915691714741569171150156912142815689887901a8884c232e89def7a0751f3d32a4cb6.jpg', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 0, NULL, NULL, NULL, '', '', '', '', '<p>Test</p>', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test-update-main-dell-with-variants', NULL, '0.0000', NULL, '0.0000', '0.0000', NULL, 44, 0, NULL, 3, 1),
(16, NULL, 'Test update main dell with no variants', NULL, '2020-02-16 05:59:12', 'TEST456', NULL, NULL, '150000.0000', NULL, NULL, '1.jpg', '', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 0, NULL, NULL, NULL, '', '', '', '', 'Test', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test-update-main-dell-with-no-variants', NULL, '0.0000', NULL, '0.0000', '0.0000', NULL, 5, 0, NULL, 3, 0),
(17, NULL, 'Test update 2 (import)', NULL, '2020-02-16 05:59:12', '', NULL, NULL, '120000.0000', NULL, NULL, '1.jpg', '2019/09/1569171474156917115015691214281568988791ttr-accommodation-4.jpg', NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 0, NULL, NULL, NULL, '', '', '', '', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, '0.0000', NULL, '0.0000', '0.0000', NULL, 17, 0, NULL, 0, 1),
(18, '12984302', 'Test AAA', NULL, '2020-02-16 05:59:12', '', 1, '100000.0000', '120000.0000', NULL, '0.0000', '1.jpg', '', '', '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 1, '', NULL, 'code128', '', '', '', '', NULL, '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'test-aaa-123', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, 2, 0, NULL, NULL, 0),
(19, NULL, 'Test', NULL, '2020-02-16 05:59:12', '', NULL, NULL, '120000.0000', NULL, NULL, '1.jpg', '', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 0, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, 0),
(20, NULL, 'test-9999 (import)', NULL, '2020-02-16 05:59:12', '', 1, '0.0000', '120000.0000', NULL, NULL, '1.jpg', '2019/09/1569171474156917115015691214281568988791O1CN01D8nuGk1o19nu9UWqT_!!141195164.jpg_400x400.jpg,2019/09/1569171474156917115015691214281568988791O1CN01zHr3eO1o19nw0vsD4_!!141195164.jpg_400x400.jpg,2019/09/1569171474156917115015691214281568988792O1CN01h5Su3i1o19phkkmEg_!!141195164.jpg_400x400.jpg', NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '10.0000', NULL, 0, NULL, NULL, NULL, NULL, '', '', '', '<ul><li>Hàng Linh kiện new 100% chuẩn tiếng anh</li><li>Phí Lắp đặt miễn phí hoặc có phí 30.000 - 200.000 VNĐ</li><li>Chuẩn tiếng anh, hàng linh kiện mới 100%</li></ul><p>&nbsp;</p><ul><li>Bán theo giá niên yết, mua số lượng vui lòng&nbsp;Call <strong><span class=\"moto-color_custom4\">Lâm 0933 35 83 85</span></strong>&nbsp;Zalo 0933 358 385</li><li>Bảo hành: 6 tháng, bảo hành 1 đổi 1 suốt thời gian bảo hành</li><li>Công ty không bảo hành mất nút, rách thủng cáp, nước vào, thiên tai… mất tem đại lý và nhà phân phối.</li><li>Mọi chi phí đổi trả bảo hành khách hàng tự thanh toán</li><li>Hàng bán ra test cẩn thận trước khi xuất cho khách hàng, yên tâm khi mua hang từ shop nhé</li></ul><p>&nbsp;</p><ul><li>Nhận ship hàng toàn quốc.</li><li>Với đơn đặt có thể bán&nbsp;COD:&nbsp;<a href=\"https://shopee.vn/shop/110710859/search\" target=\"_blank\" data-action=\"url\" class=\"moto-link\">https://shopee.vn/mainlaptop.vn</a></li><li>Địa chỉ: 109/1 Lạc Long Quân Phường 1, Quận 11, Tp.HCM</li></ul><p>&nbsp;</p>', '', NULL, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test-9999', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, 2, 0, NULL, NULL, 0),
(21, NULL, 'Test', NULL, '2020-02-16 05:59:12', '', 1, '0.0000', '200000.0000', NULL, NULL, '1.jpg', '', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10.0000', NULL, 0, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test111', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, 0, 1, NULL, NULL, 0),
(22, NULL, 'aaaaa', NULL, '2020-02-16 05:59:12', 'fdsafa', NULL, NULL, '200000.0000', NULL, NULL, '1.jpg', '2019/09/1569171474156917115015691214281568988791ttr-accommodation-4.jpg', NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 0, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'aaaaa', NULL, '0.0000', NULL, '0.0000', '0.0000', NULL, 0, 1, NULL, NULL, 0),
(23, NULL, 'aaaaa 2', NULL, '2020-02-16 05:59:12', 'fdsafa', 1, '0.0000', '200000.0000', NULL, NULL, '1.jpg', '', NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'aaaaa-2', NULL, '0.0000', NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, 0),
(24, NULL, 'Test import', NULL, '2020-02-16 05:59:12', '', NULL, NULL, '200000.0000', NULL, '20.0000', '1.jpg', '', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10.0000', NULL, 1, NULL, NULL, 'code128', NULL, '', NULL, NULL, NULL, NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test1115', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 0),
(25, NULL, 'aaaa test-9999 (import)', NULL, '2020-02-16 05:59:12', '', NULL, NULL, '200000.0000', NULL, NULL, '1.jpg', '2019/09/1569171474156917115015691214281568988791ttr-accommodation-4.jpg,2019/09/1569171474156917115015691214281568988791bd.jpg,2019/09/15691714741569171150156912142815689887911366-768-beautiful-nature-wallpaper-big-size-widescreen.jpg', NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, '<p>Mô tả sản phẩm RAM SAM SUNG SK HYNIX DDR3 4GB PC3 -12800S BUS 1600MHZ RAM SAM SUNG , SK HYNIX DDR3 4GB PC3 -12800S BUS 1600MHZ Chủng loại Ram Hynix , sam sung Dung lượng 4GB Kiểu Ram DDR3 - PC12800Bus Ram hỗ trợ 1600MHz (tốc độ ram) Độ trễ N/ATản nhiệt Loại Ram không sử dụng tản nhiệt Điện áp 1.5V ram tháo máy đồng bộ như mới bảo hành 1 tháng 1 đổi 1 Cam kết hàng chất, đã test rất kĩ, không bán hàng qua sửa chữa có thể giao băng thương hiệu khác nahu cùng bus và dung lượng mong quý khác thông cảm.</p>', '<p>Mô tả sản phẩm RAM SAM SUNG SK HYNIX DDR3 4GB PC3 -12800S BUS 1600MHZ RAM SAM SUNG , SK HYNIX DDR3 4GB PC3 -12800S BUS 1600MHZ Chủng loại Ram Hynix , sam sung Dung lượng 4GB Kiểu Ram DDR3 - PC12800Bus Ram hỗ trợ 1600MHz (tốc độ ram) Độ trễ N/ATản nhiệt Loại Ram không sử dụng tản nhiệt Điện áp 1.5V ram tháo máy đồng bộ như mới bảo hành 1 tháng 1 đổi 1 Cam kết hàng chất, đã test rất kĩ, không bán hàng qua sửa chữa có thể giao băng thương hiệu khác nahu cùng bus và dung lượng mong quý khác thông cảm.</p>', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 102, 0, NULL, 3, 0),
(26, NULL, 'qaaa', NULL, '2020-02-16 05:59:12', '', 1, '0.0000', '120000.0000', NULL, NULL, '1.jpg', '', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10.0000', NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'qaaa', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(27, NULL, 'fdasf', NULL, '2020-02-16 05:59:12', '', 1, '0.0000', '200000.0000', NULL, NULL, '1.jpg', '', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10.0000', NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'fdasf', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(28, NULL, '1aaaa', NULL, '2020-02-16 05:59:12', '', NULL, NULL, '200000.0000', NULL, NULL, '1.jpg', '', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10.0000', NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'aaaa', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1),
(29, NULL, 'gfsdfg', NULL, '2020-02-22 12:50:21', '', 1, '0.0000', '242000.0000', NULL, NULL, '1.jpg', '', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '231.0000', NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'gfsdfg', NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, NULL, 0, NULL),
(30, NULL, 'Test quantity', NULL, '2020-02-16 05:59:12', 'TEST4567', NULL, NULL, '200000.0000', NULL, NULL, '1.jpg', '', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10.0000', NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test-quantity', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(31, NULL, 'aaaaa', NULL, '2020-02-16 05:59:12', 'fdsafa', NULL, NULL, '200000.0000', NULL, '20.0000', '1.jpg', '', NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, '', NULL, NULL, NULL, '', 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Test insert (import)', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL),
(32, NULL, 'aaaaa 2', NULL, '2020-02-16 05:59:12', 'fdsafa', NULL, NULL, '200000.0000', NULL, '20.0000', '1.jpg', '', NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, '', NULL, NULL, NULL, '', 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Test insert 2 (import)', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL),
(33, NULL, 'Test insert (import)', NULL, '2020-02-16 05:59:12', 'fdsafa', NULL, NULL, '200000.0000', NULL, '20.0000', '1.jpg', '', NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, '', NULL, NULL, NULL, '', 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL),
(34, NULL, 'Test insert 2 (import)', NULL, '2020-02-16 05:59:12', 'fdsafa', NULL, NULL, '200000.0000', NULL, '20.0000', '1.jpg', '', NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, '', NULL, NULL, NULL, '', 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL),
(35, NULL, 'Test insert (import)', NULL, '2020-02-16 05:59:12', 'fdsafa', NULL, NULL, '200000.0000', NULL, '20.0000', '1.jpg', '2019/09/1569171474156917115015691214281568988791ttr-accommodation-4.jpg', NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, '', NULL, NULL, NULL, '', 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL),
(36, NULL, 'Test insert 2 (import)', NULL, '2020-02-16 05:59:12', 'fdsafa', NULL, NULL, '200000.0000', NULL, '20.0000', '1.jpg', '', NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, '', NULL, NULL, NULL, '', 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL),
(37, NULL, 'Test insert (import)', NULL, '2020-02-16 05:59:12', 'fdsafa', NULL, NULL, '200000.0000', NULL, '20.0000', '1.jpg', '2019/09/1569171474156917115015691214281568988791ttr-accommodation-4.jpg', NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, '', NULL, NULL, NULL, '', 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL),
(38, NULL, 'Test insert 2 (import)', NULL, '2020-02-16 05:59:12', 'fdsafa', NULL, NULL, '200000.0000', NULL, '20.0000', '1.jpg', '', NULL, NULL, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, '', NULL, NULL, NULL, '', 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL),
(39, NULL, 'dssss', NULL, '2020-02-16 05:59:12', '', 1, '0.0000', '10000.0000', NULL, NULL, '1.jpg', '', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10.0000', NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'dssss', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(40, NULL, 'Test add new main dell with variants Tett add new main dell with variants Test add new main dell with variants', NULL, '2020-02-16 05:59:12', 'TEST456', NULL, NULL, '150000.0000', '2300000-2500000', NULL, '1.jpg', '', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '19.0000', NULL, 0, NULL, NULL, NULL, NULL, '', NULL, NULL, '<p>Test</p>', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test-add-new-main-dell-with-variants-tett-add-new-main-dell-with-variants-test-add-new-main-dell-with-variants', NULL, NULL, NULL, NULL, NULL, NULL, 145, 0, NULL, 5, 1),
(41, NULL, 'Test add new main dell with variants', NULL, '2020-02-16 05:59:12', 'TEST456', NULL, NULL, '150000.0000', NULL, '20.0000', '1.jpg', '', NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, '', NULL, NULL, 'Test', NULL, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test-add-new-main-dell-with-variants', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 5, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_product_photos`
--

INSERT INTO `sma_product_photos` (`id`, `product_id`, `photo`) VALUES
(1, 15, 'c956a14ddaaa35f68df354c7c6b182dd.png'),
(2, 15, 'computer.png'),
(3, 15, 'cpu.png'),
(4, 16, 'c956a14ddaaa35f68df354c7c6b182dd.png'),
(5, 16, 'comp_set.png'),
(6, 16, 'computer_7.png'),
(7, 17, 'c956a14ddaaa35f68df354c7c6b182dd.png'),
(8, 17, 'computer_7.png'),
(9, 17, 'c956a14ddaaa35f68df354c7c6b182dd.png'),
(10, 17, 'computer_7.png'),
(11, 17, 'c956a14ddaaa35f68df354c7c6b182dd.png'),
(12, 17, 'computer_7.png'),
(13, 22, 'banner2.jpg'),
(14, 22, 'ttr-accommodation-4.jpg'),
(15, 22, 'ttr-accommodation-4.jpg'),
(16, 14, ''),
(17, 14, 'ttr-accommodation-4.jpg'),
(18, 14, 'bd.jpg'),
(19, 14, 'banner2.jpg'),
(20, 14, 'ttr-accommodation-4.jpg'),
(21, 14, 'bd.jpg'),
(22, 14, 'ttr-accommodation-4.jpg'),
(23, 14, 'bd.jpg'),
(24, 17, 'ttr-accommodation-4.jpg'),
(25, 25, ''),
(26, 25, 'ttr-accommodation-4.jpg'),
(27, 25, 'bd.jpg'),
(28, 25, 'ttr-accommodation-4.jpg'),
(29, 25, 'bd.jpg'),
(30, 25, 'products/1366-768-beautiful-nature-wallpaper-big-size-widescreen.jpg'),
(31, 25, 'ttr-accommodation-4.jpg'),
(32, 25, 'bd.jpg'),
(33, 25, 'products/1366-768-beautiful-nature-wallpaper-big-size-widescreen.jpg'),
(34, 25, 'ttr-accommodation-4.jpg'),
(35, 25, 'bd.jpg'),
(36, 25, 'products/1366-768-beautiful-nature-wallpaper-big-size-widescreen.jpg'),
(37, 25, 'ttr-accommodation-4.jpg'),
(38, 25, 'bd.jpg'),
(39, 25, 'products/1366-768-beautiful-nature-wallpaper-big-size-widescreen.jpg'),
(40, 25, 'ttr-accommodation-4.jpg'),
(41, 25, 'bd.jpg'),
(42, 25, 'products/1366-768-beautiful-nature-wallpaper-big-size-widescreen.jpg'),
(43, 25, 'ttr-accommodation-4.jpg'),
(44, 25, 'bd.jpg'),
(45, 25, 'products/1366-768-beautiful-nature-wallpaper-big-size-widescreen.jpg'),
(46, 25, 'ttr-accommodation-4.jpg'),
(47, 25, 'bd.jpg'),
(48, 25, 'products/1366-768-beautiful-nature-wallpaper-big-size-widescreen.jpg'),
(49, 14, 'ttr-accommodation-4.jpg'),
(50, 14, 'bd.jpg'),
(51, 14, 'ttr-accommodation-4.jpg'),
(52, 14, 'bd.jpg'),
(53, 14, '2019/09/main-hp-probook-450-g6.jpg'),
(54, 14, '2019/09/main-hp-probook-450-g7.jpg'),
(55, 14, '2019/09/main-hp-probook-450-g8.jpg'),
(56, 14, 'ttr-accommodation-4.jpg'),
(57, 14, 'bd.jpg'),
(58, 14, '2019/09/main-hp-probook-450-g6.jpg'),
(59, 14, '2019/09/main-hp-probook-450-g7.jpg'),
(60, 14, '2019/09/main-hp-probook-450-g8.jpg'),
(61, 14, '2019/09/main-hp-probook-450-g9.jpg'),
(62, 14, '2019/09/main-hp-probook-450-g10.jpg'),
(63, 14, '2019/09/main-hp-probook-450-g11.jpg'),
(64, 14, '2019/09/MARKET-588_IPM_EASTER2.jpg'),
(65, 17, 'ttr-accommodation-4.jpg'),
(66, 15, ''),
(67, 15, 'banner-1_635x225.jpg'),
(68, 15, 'banner-1_635x2251.jpg'),
(69, 15, '2019/09/banner-1_1600x600.jpg'),
(70, 15, '2019/09/banner-1_1600x600.jpg'),
(71, 15, 'banner-1_635x225.jpg'),
(72, 15, 'banner-1_635x225.jpg'),
(73, 15, '2019/09/banner-1_1600x600.jpg'),
(74, 15, 'banner2.jpg'),
(75, 15, 'banner2.jpg'),
(76, 15, 'banner-1_635x225.jpg'),
(77, 15, '2019/09/banner-1_1600x600.jpg'),
(78, 15, 'bd.jpg'),
(79, 15, 'banner2.jpg'),
(80, 15, 'banner-1_635x225.jpg'),
(81, 15, '1a8884c232e89def7a0751f3d32a4cb6.jpg'),
(82, 15, 'banner2.jpg'),
(83, 15, '1a8884c232e89def7a0751f3d32a4cb6.jpg'),
(84, 15, 'banner-1_635x225.jpg'),
(85, 15, 'banner-1_635x225.jpg'),
(86, 15, 'banner2.jpg'),
(87, 15, '1a8884c232e89def7a0751f3d32a4cb6.jpg'),
(88, 15, '2019/09/1568988790banner-1_635x225.jpg'),
(89, 15, '2019/09/1568988790banner2.jpg'),
(90, 15, '2019/09/15689887901a8884c232e89def7a0751f3d32a4cb6.jpg'),
(91, 15, '2019/09/1568988790banner-1_635x225.jpg'),
(92, 15, '2019/09/1568988790banner2.jpg'),
(93, 15, '2019/09/15689887901a8884c232e89def7a0751f3d32a4cb6.jpg'),
(94, 15, '2019/09/1568988790banner-1_635x225.jpg'),
(95, 15, '2019/09/1568988790banner2.jpg'),
(96, 15, '2019/09/15689887901a8884c232e89def7a0751f3d32a4cb6.jpg'),
(97, 15, '2019/09/1568988790banner-1_635x225.jpg'),
(98, 15, '2019/09/1568988790banner2.jpg'),
(99, 15, '2019/09/15689887901a8884c232e89def7a0751f3d32a4cb6.jpg'),
(100, 15, '2019/09/1569171474156917115015691214281568988790banner-1_635x225.jpg'),
(101, 15, '2019/09/1569171474156917115015691214281568988790banner2.jpg'),
(102, 15, '2019/09/15691714741569171150156912142815689887901a8884c232e89def7a0751f3d32a4cb6.jpg'),
(103, 15, '2019/09/1569171474156917115015691214281568988790banner-1_635x225.jpg'),
(104, 15, '2019/09/1569171474156917115015691214281568988790banner2.jpg'),
(105, 15, '2019/09/15691714741569171150156912142815689887901a8884c232e89def7a0751f3d32a4cb6.jpg'),
(106, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g5.jpg'),
(107, 14, '2019/09/1569171474156917115015691214281568988790ttr-accommodation-4.jpg'),
(108, 14, '2019/09/1569171474156917115015691214281568988790bd.jpg'),
(109, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g6.jpg'),
(110, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g7.jpg'),
(111, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g8.jpg'),
(112, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g5.jpg'),
(113, 14, '2019/09/1569171474156917115015691214281568988790ttr-accommodation-4.jpg'),
(114, 14, '2019/09/1569171474156917115015691214281568988790bd.jpg'),
(115, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g6.jpg'),
(116, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g7.jpg'),
(117, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g8.jpg'),
(118, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g5.jpg'),
(119, 14, '2019/09/1569171474156917115015691214281568988790ttr-accommodation-4.jpg'),
(120, 14, '2019/09/1569171474156917115015691214281568988790bd.jpg'),
(121, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g6.jpg'),
(122, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g7.jpg'),
(123, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g8.jpg'),
(124, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g5.jpg'),
(125, 14, '2019/09/1569171474156917115015691214281568988790ttr-accommodation-4.jpg'),
(126, 14, '2019/09/1569171474156917115015691214281568988790bd.jpg'),
(127, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g6.jpg'),
(128, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g7.jpg'),
(129, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g8.jpg'),
(130, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g5.jpg'),
(131, 14, '2019/09/1569171474156917115015691214281568988790ttr-accommodation-4.jpg'),
(132, 14, '2019/09/1569171474156917115015691214281568988790bd.jpg'),
(133, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g6.jpg'),
(134, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g7.jpg'),
(135, 14, '2019/09/1569171474156917115015691214281568988790main-hp-probook-450-g8.jpg'),
(136, 14, '2019/09/1569171474156917115015691214281568988790ttr-accommodation-4.jpg'),
(137, 14, '2019/09/1569171474156917115015691214281568988790bd.jpg'),
(138, 40, '2019/09/8be67d3388923076550b04d85eff70e8'),
(139, 40, '2019/09/8be67d3388923076550b04d85eff70e8'),
(140, 40, ''),
(141, 40, '2019/10/main-p-probook-640-g1.jpg'),
(142, 40, '2019/10/main-p-probook-640-g1.jpg'),
(143, 40, '2019/10/main-p-probook-640-g1.jpg'),
(144, 40, '2019/10/main-p-probook-640-g1.jpg'),
(145, 40, '2019/10/main-p-probook-640-g1.jpg'),
(146, 40, '2019/10/main-p-probook-640-g1.jpg'),
(147, 40, '2019/10/main-p-probook-640-g1.jpg'),
(148, 40, '2019/10/main-p-probook-640-g1.jpg'),
(149, 40, '2019/10/main-p-probook-640-g1.jpg'),
(150, 40, '2019/10/main-p-probook-640-g1.jpg'),
(151, 15, '2019/09/15692088791569171474156917115015691214281568988790banner-1_635x225.jpg'),
(152, 15, '2019/09/15692088791569171474156917115015691214281568988790banner2.jpg'),
(153, 15, '2019/09/156920887915691714741569171150156912142815689887901a8884c232e89def7a0751f3d32a4cb6.jpg'),
(154, 15, '2019/09/15692088791569171474156917115015691214281568988790banner-1_635x225.jpg'),
(155, 15, '2019/09/15692088791569171474156917115015691214281568988790banner2.jpg'),
(156, 15, '2019/09/156920887915691714741569171150156912142815689887901a8884c232e89def7a0751f3d32a4cb6.jpg'),
(157, 15, '2019/09/15692088791569171474156917115015691214281568988790banner-1_635x225.jpg'),
(158, 15, '2019/09/15692088791569171474156917115015691214281568988790banner2.jpg'),
(159, 15, '2019/09/156920887915691714741569171150156912142815689887901a8884c232e89def7a0751f3d32a4cb6.jpg'),
(160, 3, ''),
(161, 3, 'SpDemo/the-nho-microsd-32gb-lexar-class-10-uhs-i-5-600x600.jpg'),
(162, 3, ''),
(163, 3, 'SpDemo/the-nho-microsd-32gb-lexar-class-10-uhs-i-5-600x600.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_product_prices`
--

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_product_prices`
--

INSERT INTO `sma_product_prices` (`id`, `product_id`, `price_group_id`, `price`) VALUES
(1, 3, 3, '12000.0000'),
(2, 4, 3, '45000.0000'),
(3, 3, 1, '2000.0000'),
(4, 2, 3, '12000.0000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `parent_type_id` int(11) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price_extra` decimal(25,0) DEFAULT NULL,
  `store` int(11) DEFAULT NULL,
  `depot` int(11) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_product_variants`
--

INSERT INTO `sma_product_variants` (`id`, `product_id`, `type_id`, `parent_type_id`, `name`, `cost`, `price_extra`, `store`, `depot`, `sku`, `photo`) VALUES
(1, 15, 45, NULL, 'CPU Core i5', NULL, '0', 0, NULL, 'ggg', '2019/09/156920887915691714741569171150156887699315688744581.jpg'),
(4, 16, 6, 4, 'Core i3 | Mới', NULL, '12000', 12, NULL, 'aaaa', NULL),
(5, 16, 7, 4, 'Core i3 | Đã qua sử dụng', NULL, '12000', 11, NULL, 'sss', NULL),
(6, 16, 6, 5, 'Core i5 | Mới', NULL, '13000', 13, NULL, 'ssss', NULL),
(7, 16, 7, 5, 'Core i5 | Đã qua sử dụng', NULL, '14000', 15, NULL, 'sss', NULL),
(8, 18, 9, NULL, 'Test import variant 6', NULL, '120000', 134, NULL, 'ssss', NULL),
(9, 13, 16, 14, 'Core i7 | Mới 100%', NULL, '120000', 1, NULL, NULL, NULL),
(10, 13, 17, 14, 'Core i7 | Mới 90%', NULL, '120000', 1, NULL, NULL, NULL),
(11, 13, 16, 15, 'Core i5 | Mới 100%', NULL, '120000', 1, NULL, NULL, NULL),
(12, 13, 17, 15, 'Core i5 | Mới 90%', NULL, '120000', 1, NULL, NULL, NULL),
(13, 28, 32, NULL, 'a 111', NULL, '0', 0, NULL, NULL, NULL),
(14, 28, 33, NULL, 'a222', NULL, '0', 0, NULL, NULL, NULL),
(15, 25, 24, 22, 'Core i3 | Nguyên hộp', NULL, '1500000', 10, NULL, '12', NULL),
(16, 25, 25, 22, 'Core i3 | Mới 90%', NULL, '1300000', 1, NULL, NULL, NULL),
(17, 25, 24, 23, 'Core i5 | Nguyên hộp', NULL, '1800000', 15, NULL, NULL, NULL),
(18, 25, 25, 23, 'Core i5 | Mới 90%', NULL, '1600000', 14, NULL, NULL, NULL),
(19, 17, 34, NULL, 'Core i7', NULL, '1200000', 12, NULL, 'fdsa', '2019/09/15691714741569171150MARKET-588_IPM_EASTER5.jpg'),
(20, 17, 35, NULL, 'aaa', NULL, '1500000', 10, NULL, 'ffff', '2019/09/15691714741569171150main-hp-probook-450-g18.jpg'),
(23, 41, 52, 51, 'Core i3 | Mới', NULL, '12000', 12, NULL, 'aaaa', NULL),
(24, 41, 53, 51, 'Core i3 | Đã qua sử dụng', NULL, '12000', 11, NULL, 'sss', '2019/09/156920888065fa0eb00b8c83e5f4082e9815ea25a1'),
(28, 14, 57, NULL, 'Core i7', NULL, '0', 0, NULL, '', '2019/09/156917147415691711501.jpg'),
(29, 14, 58, NULL, 'Core i5', NULL, '0', 0, NULL, '', '2019/09/1569171474156917115011.jpg'),
(34, 40, 65, NULL, 'Core i3', NULL, '2300000', 10, NULL, '', '2019/10/main-p-probook-640-g14.jpg'),
(35, 40, 66, NULL, 'core i5', NULL, '2500000', 9, NULL, '', '2019/10/main-p-probook-640-g15.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_product_variant_type`
--

CREATE TABLE `sma_product_variant_type` (
  `type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_product_variant_type`
--

INSERT INTO `sma_product_variant_type` (`type_id`, `name`, `group_id`, `product_id`) VALUES
(4, 'Core i3', 3, 16),
(5, 'Core i5', 3, 16),
(6, 'Mới', 33, 16),
(7, 'Đã qua sử dụng', 33, 16),
(9, 'Test import variant 6', 6, 18),
(14, 'Core i7', 9, 13),
(15, 'Core i5', 9, 13),
(16, 'Mới 100%', 34, 13),
(17, 'Mới 90%', 34, 13),
(22, 'Core i3', 13, 25),
(23, 'Core i5', 13, 25),
(24, 'Nguyên hộp', 35, 25),
(25, 'Mới 90%', 35, 25),
(32, 'a 111', 18, 28),
(33, 'a222', 18, 28),
(34, 'Core i7', 19, 17),
(35, 'aaa', 19, 17),
(45, 'CPU Core i5', 23, 15),
(51, 'Core i3', 38, 41),
(52, 'Mới', 39, 41),
(53, 'Đã qua sử dụng', 39, 41),
(57, 'Core i7', 41, 14),
(58, 'Core i5', 41, 14),
(65, 'Core i3', 46, 40),
(66, 'core i5', 46, 40);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_product_variant_type_group`
--

CREATE TABLE `sma_product_variant_type_group` (
  `group_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(2) NOT NULL DEFAULT '1',
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_product_variant_type_group`
--

INSERT INTO `sma_product_variant_type_group` (`group_id`, `name`, `level`, `product_id`) VALUES
(3, 'CPU', 1, 16),
(6, 'aaa', 1, 18),
(9, 'CPU', 1, 13),
(13, 'CPU', 1, 25),
(18, 'test 123', 1, 28),
(19, 'CPU', 1, 17),
(23, 'Loại CPU', 1, 15),
(33, 'Tình trạng', 2, 16),
(34, 'Tình trạng', 2, 13),
(35, 'Tình trạng', 2, 25),
(38, 'CPU', 1, 41),
(39, 'Tình trạng', 2, 41),
(41, 'Dòng CPU', 1, 14),
(46, 'CPU', 1, 40);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(1, NULL, NULL, 2, '893614327002', 'Macca vỏ', NULL, '30000.0000', '1000.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '30000000.0000', '1033.0000', '2018-04-12', 'received', '30000.0000', '30000.0000', '1000.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(2, NULL, NULL, 6, '893614327006', 'Óc chó vỏ', NULL, '30000.0000', '1000.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '30000000.0000', '1000.0000', '2018-04-12', 'received', '30000.0000', '30000.0000', '1000.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(3, NULL, NULL, 6, '893614327006', 'Óc chó vỏ', NULL, '30000.0000', '1000.0000', 2, '0.0000', NULL, NULL, NULL, NULL, NULL, '30000000.0000', '1000.0000', '2018-04-12', 'received', '30000.0000', '30000.0000', '1000.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(4, NULL, NULL, 8, '893614327008', 'Hạnh nhân vỏ 500gr', NULL, '155000.0000', '100.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '15500000.0000', '100.0000', '2018-04-28', 'received', '155000.0000', '155000.0000', '100.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(5, NULL, NULL, 8, '893614327008', 'Hạnh nhân vỏ 500gr', NULL, '155000.0000', '100.0000', 2, '0.0000', NULL, NULL, NULL, NULL, NULL, '15500000.0000', '100.0000', '2018-04-28', 'received', '155000.0000', '155000.0000', '100.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(6, NULL, NULL, 9, '893614327349', 'Hạnh nhân vỏ 100gr', NULL, '43471.0000', '1000.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '43471000.0000', '1000.0000', '2018-04-28', 'received', '43471.0000', '43471.0000', '1000.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL),
(7, NULL, NULL, 9, '893614327349', 'Hạnh nhân vỏ 100gr', NULL, '43471.0000', '1000.0000', 2, '0.0000', NULL, NULL, NULL, NULL, NULL, '43471000.0000', '1000.0000', '2018-04-28', 'received', '43471.0000', '43471.0000', '1000.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_redirect`
--

CREATE TABLE `sma_redirect` (
  `id` int(11) NOT NULL,
  `old_url` varchar(250) NOT NULL,
  `new_url` varchar(250) NOT NULL,
  `type` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `sma_redirect`
--

INSERT INTO `sma_redirect` (`id`, `old_url`, `new_url`, `type`) VALUES
(3, 'aaaa', 'abc', NULL),
(4, 'test-redirect', 'http://mainlaptop.local/linh-kien-laptop', NULL),
(5, 'http://mainlaptop.local/test-full-url', 'http://mainlaptop.local/linh-kien-laptop', NULL),
(6, 'test-full-url-rd', 'http://mainlaptop.local/linh-kien-laptop', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_returns`
--

CREATE TABLE `sma_returns` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT '0.0000',
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_return_items`
--

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT '0',
  `shop` tinyint(1) DEFAULT '0',
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`, `rounding`, `suspend_note`, `api`, `shop`, `address_id`, `reserve_id`, `hash`, `manual_payment`, `cgst`, `sgst`, `igst`, `payment_method`) VALUES
(1, '2018-12-04 15:01:00', 'SALE2018/12/0001', 1, 'Walk-in Customer', 3, 'Nutshealth', 1, '', '', '12000.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '12000.0000', 'completed', 'due', 0, NULL, 1, 1, '2018-12-04 15:08:30', 1, 0, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', NULL, NULL, 0, 0, NULL, NULL, '137d8b306500a7205bbd38353cc156b990fa753cc961faf84554a136def7ac76', NULL, NULL, NULL, NULL, NULL),
(2, '2018-12-04 15:57:00', 'SALE2018/12/0002', 1, 'Walk-in Customer', 3, 'Nutshealth', 1, '', '', '12000.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '12000.0000', 'completed', 'due', 0, NULL, 1, 1, '2018-12-05 14:51:01', 1, 0, '0.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', NULL, NULL, 0, 0, NULL, NULL, '8c87146bc749d57ff93383ff9bf9b6ca8d7e5753bfa5eeef16e53bb8c90e109a', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `sale_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `comment`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(3, 1, 2, '893614327090', 'Macca vỏ', 'standard', NULL, '12000.0000', '12000.0000', '1.0000', 1, '0.0000', NULL, '', '0', '0.0000', '12000.0000', '', '12000.0000', NULL, 1, '893614327', '1.0000', NULL, NULL, NULL, NULL, NULL),
(35, 2, 2, '893614327090', 'Macca vỏ', 'standard', NULL, '12000.0000', '12000.0000', '1.0000', 1, '0.0000', NULL, '', '0', '0.0000', '12000.0000', '', '12000.0000', NULL, 1, '893614327', '1.0000', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('07qg2c0smnb18nt90emg73cdmlt2v6bj', '127.0.0.1', 1581845623, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313834353632333b),
('09kisc2lusm3vrtrls9mun2253ml31ga', '127.0.0.1', 1582293644, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323239333634343b),
('0nru94v91ppgipak3a28o00vug2c3bd3', '127.0.0.1', 1582378016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323337383031363b),
('1kbrqv8fbonkmai3tdqd4n3pljljs82o', '127.0.0.1', 1582969176, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323936393137363b6572726f727c733a3231343a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f77617265686f7573652e6c6f63616c2f7468656d65732f64656661756c742f73686f702f6173736574732f666f6e74732f7562756e74752f7562756e74752d76392d637972696c6c69632d6578745f677265656b2d6578745f6c6174696e2d6578745f677265656b5f6c6174696e5f637972696c6c69632d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('1rjr97492qbeaksb4chs2vap4htsdghv', '127.0.0.1', 1581845966, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313834353936363b),
('21demronm5mee54d2rlrbstkcgqddjli', '127.0.0.1', 1582375737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323337353733373b),
('368jmsfkeea158almsmlca592tjle7af', '127.0.0.1', 1582969163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323936393136333b),
('43i0qqvqjgpo6rl81adu2ku59icb5fla', '127.0.0.1', 1581843547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313834333534373b),
('4jmbhnq95ckpg3pcq2a6dr3879nucc5p', '127.0.0.1', 1582377645, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323337373634353b),
('58622i0d154du81nukco0gns46trsm9v', '127.0.0.1', 1582376049, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323337363034393b),
('5a9diinvb2644jvodso9ots1vduiono6', '127.0.0.1', 1582969176, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323936393137363b6572726f727c733a3231303a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f77617265686f7573652e6c6f63616c2f7468656d65732f64656661756c742f73686f702f6173736574732f666f6e74732f7562756e74752f7562756e74752d76392d637972696c6c69632d6578745f677265656b2d6578745f6c6174696e2d6578745f677265656b5f6c6174696e5f637972696c6c69632d3730302e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7c2iu50gl5lbsq9ol3tn65anupfrv3ei', '127.0.0.1', 1582969180, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323936393138303b6572726f727c733a3231343a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f77617265686f7573652e6c6f63616c2f7468656d65732f64656661756c742f73686f702f6173736574732f666f6e74732f7562756e74752f7562756e74752d76392d637972696c6c69632d6578745f677265656b2d6578745f6c6174696e2d6578745f677265656b5f6c6174696e5f637972696c6c69632d726567756c61722e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('7uovou3n47n1q9lpl0d4ketua3ill8kk', '127.0.0.1', 1582376661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323337363636313b),
('8knfhi224l95plf0ia3ut2ro6g7aep0n', '127.0.0.1', 1582359514, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323335393531343b),
('91m18s856bh2ng7egjtgmc7ucopgg9pp', '127.0.0.1', 1582293301, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323239333330313b),
('a6210lvelbhnmvn2e3d7rp4kk06e35j2', '127.0.0.1', 1581844560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313834343536303b),
('aifsd9ftlu76r595bs2hmgk73ags0n85', '127.0.0.1', 1581844207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313834343230373b),
('b4k3sm2ede0hbuohrpce8ohvt58jp94f', '127.0.0.1', 1582291710, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323239313731303b),
('bu244631tp975dmhnq67gddsknuiakab', '127.0.0.1', 1582359088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323335393038383b),
('buv293rbe073vgg2qksphbdkueu7k3lf', '127.0.0.1', 1582358660, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323335383636303b),
('cljo8h2dcc9uer19ceo10bmdvnn5rvod', '127.0.0.1', 1582377296, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323337373239363b),
('d0mlch3vt86ctgug7jehm7bolji01h8i', '127.0.0.1', 1582969165, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323936393136333b),
('dmqsiner9ftggjt0r6af00kdcvbi2q22', '127.0.0.1', 1582290695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323239303639353b),
('etkcpjisj50pl56dadcl1ns9qa67drn3', '127.0.0.1', 1582967988, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323936373935383b6572726f727c733a3130353a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f77617265686f7573652e6c6f63616c2f7075626c6963223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('fr4g1h9ks1gsgffn275ee0itg90ge9jt', '::1', 1582969625, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323936393632353b),
('gkuioeebg7jaf077csof1kg38ls73tm9', '127.0.0.1', 1581820426, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313832303432363b),
('gq9cjq8t362suvf0kurdi5f02d6t0nts', '192.168.1.4', 1581832049, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313833313831323b),
('h86n4qn3vvmlsoeclbj13hcueetq0eil', '127.0.0.1', 1582293953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323239333935333b),
('hj6nv2loqdbigkvdj9bacjacs65q8gm7', '127.0.0.1', 1581863223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313836333230333b),
('hke9vc86npekm235m0o45j63tuafekui', '127.0.0.1', 1582378356, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323337383335363b),
('i7clclvhmu46h3b2chkgq6caapjfcj3i', '127.0.0.1', 1582376982, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323337363938323b),
('jqdfu9gvk6tibr35guv1fpfqe3nrvoii', '127.0.0.1', 1581818277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313831383237373b),
('p58klvpdmrkkonpra2fvh9o62qv5fkbp', '127.0.0.1', 1582969180, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323936393138303b6572726f727c733a3231303a223c68343e343034204e6f7420466f756e64213c2f68343e3c703e546865207061676520796f7520617265206c6f6f6b696e6720666f722063616e206e6f7420626520666f756e642e3c2f703e687474703a2f2f77617265686f7573652e6c6f63616c2f7468656d65732f64656661756c742f73686f702f6173736574732f666f6e74732f7562756e74752f7562756e74752d76392d637972696c6c69632d6578745f677265656b2d6578745f6c6174696e2d6578745f677265656b5f6c6174696e5f637972696c6c69632d3730302e747466223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('po0cm0i2hod0fnj8jfar8ekd6s19i604', '127.0.0.1', 1581863203, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313836333230333b),
('q1e3823mnqj0pbpambn34h0t89651hql', '127.0.0.1', 1582376357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323337363335373b),
('q224va2v94ake8bj0qer8dfcua1p2pn3', '::1', 1582969625, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323936393632353b),
('rp20856kpd7q9knm33r25fs9j5kq4nt8', '127.0.0.1', 1581831564, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313833313536343b),
('rtpaeguhjdftrcc7rpo86glqeai954de', '127.0.0.1', 1582967958, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323936373935383b),
('t96vt6n3ffghoa4m7f5g3kp3fl224069', '127.0.0.1', 1581845071, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313834353037313b),
('uhke5r1bl55onp1g31mksq0no2cjl2s1', '127.0.0.1', 1581832870, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313833323837303b);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT '0',
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`, `state`, `pdf_lib`) VALUES
(1, 'logo2.png', 'logo3.png', 'Nutshealth Stock Manager Advance', 'vietnamese', 1, 0, 'VND', 0, 10, '3.3.0', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 0, 1, 0, 1, 0, 'Asia/Ho_Chi_Minh', 1600, 1600, 320, 320, 0, 0, 0, 0, NULL, 'sendmail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', 'Admin@2019', '25', NULL, NULL, 1, 'contact@tecdiary.com', 0, 4, 1, 0, 2, 1, 1, 0, 2, 2, '.', ',', 0, 3, 'nhiemth1985', '626a09a8-bed9-4623-a4f0-841b1847f6bc', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'đ', 0, '-', 0, 1, 1, 'POP', 90, '', 0, 0, 'AN', 'dompdf');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_shop_settings`
--

CREATE TABLE `sma_shop_settings` (
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(55) NOT NULL,
  `description` varchar(160) NOT NULL,
  `warehouse` int(11) NOT NULL,
  `biller` int(11) NOT NULL,
  `about_link` varchar(55) NOT NULL,
  `terms_link` varchar(55) NOT NULL,
  `privacy_link` varchar(55) NOT NULL,
  `contact_link` varchar(55) NOT NULL,
  `payment_text` varchar(100) NOT NULL,
  `follow_text` varchar(100) NOT NULL,
  `facebook` varchar(55) NOT NULL,
  `twitter` varchar(55) DEFAULT NULL,
  `google_plus` varchar(55) DEFAULT NULL,
  `instagram` varchar(55) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `cookie_message` varchar(180) DEFAULT NULL,
  `cookie_link` varchar(55) DEFAULT NULL,
  `slider` text,
  `shipping` int(11) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.3.0',
  `logo` varchar(55) DEFAULT NULL,
  `bank_details` varchar(255) DEFAULT NULL,
  `products_page` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_shop_settings`
--

INSERT INTO `sma_shop_settings` (`shop_id`, `shop_name`, `description`, `warehouse`, `biller`, `about_link`, `terms_link`, `privacy_link`, `contact_link`, `payment_text`, `follow_text`, `facebook`, `twitter`, `google_plus`, `instagram`, `phone`, `email`, `cookie_message`, `cookie_link`, `slider`, `shipping`, `purchase_code`, `envato_username`, `version`, `logo`, `bank_details`, `products_page`) VALUES
(1, 'Nutshealth Shop', 'Dinh Dưỡng Cho Mẹ - Sức Khỏe cho bé', 1, 3, 'about-us', '', '', '', 'We accept PayPal or you can pay with your credit/debit cards.', 'Please click the link below to follow us on social media.', 'http://facebook.com/nutshealth.com.vn/', '', '', '', '0905529384', 'info@nutshealth.com.vn', 'We use cookies to improve your experience on our website. By browsing this website, you agree to our use of cookies.', '', '[{\"image\":\"e67507f00524db4c29670e65d747eacf.jpg\",\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"}]', 0, 'f05b1887-ff16-4215-b4e0-8a992e585517', 'nhiemth1985', '3.3.0', 'sma-shop.png', '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_sms_settings`
--

CREATE TABLE `sma_sms_settings` (
  `id` int(11) NOT NULL,
  `auto_send` tinyint(1) DEFAULT NULL,
  `config` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_sms_settings`
--

INSERT INTO `sma_sms_settings` (`id`, `auto_send`, `config`) VALUES
(1, NULL, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_stock_counts`
--

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_stock_counts`
--

INSERT INTO `sma_stock_counts` (`id`, `date`, `reference_no`, `warehouse_id`, `type`, `initial_file`, `final_file`, `brands`, `brand_names`, `categories`, `category_names`, `note`, `products`, `rows`, `differences`, `matches`, `missing`, `created_by`, `updated_by`, `updated_at`, `finalized`) VALUES
(1, '2019-03-16 15:30:00', '', 1, 'full', 'a0869551f247d313a6198ee653d2eed2.csv', NULL, '', '', '', '', NULL, 6, 6, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(2, '2019-03-16 15:44:00', '', 1, 'full', '7f77598b0685fd350135fb48d7ad8304.csv', NULL, '', '', '', '', NULL, 6, 6, NULL, NULL, NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_stock_count_items`
--

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', '0.0000', '2'),
(2, 'VAT @10%', 'VAT10', '10.0000', '1'),
(3, 'GST @6%', 'GST', '6.0000', '1'),
(4, 'VAT @20%', 'VT20', '20.0000', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_units`
--

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(1, '893614327', 'Hộp', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(1, 0x3132372e302e302e31, 0x0000, 'admin', '9dea9865ae8bf010b323c2da7f23172791121c75', NULL, 'info@nutshealth.com.vn', NULL, NULL, NULL, NULL, 1351661704, 1578494080, 1, 'Nutshealth', 'Manager', 'Nutshealth', '012345678', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0),
(2, NULL, 0x3131352e37392e32362e3330, 'kimchi', '6b387ee5c19d04a5f0e38943c9abf2985b9574b1', NULL, 'kimchi@nutshealth.com.vn', NULL, NULL, NULL, NULL, 1523344354, 1523344354, 1, 'Đỗ Thị', 'Kim Chi', 'Nutshealth', '01237720112', NULL, 'female', 5, 1, 3, NULL, 0, 0, 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(11, 1, NULL, 0x3131352e37392e32362e3330, 'info@nutshealth.com.vn', '2018-05-02 18:54:02'),
(12, 1, NULL, 0x31342e3138372e3137302e323530, 'info@nutshealth.com.vn', '2018-05-02 18:56:02'),
(13, 1, NULL, 0x3131352e37392e32362e3330, 'info@nutshealth.com.vn', '2018-05-02 18:59:46'),
(14, 1, NULL, 0x3131352e37392e32362e3330, 'info@nutshealth.com.vn', '2018-05-03 00:12:20'),
(15, 1, NULL, 0x3132372e302e302e31, 'info@nutshealth.com.vn', '2018-05-10 12:49:19'),
(16, 1, NULL, 0x3132372e302e302e31, 'info@nutshealth.com.vn', '2018-05-11 00:53:06'),
(17, 1, NULL, 0x3132372e302e302e31, 'info@nutshealth.com.vn', '2018-05-11 22:27:56'),
(18, 1, NULL, 0x3132372e302e302e31, 'info@nutshealth.com.vn', '2018-05-13 18:52:46'),
(19, 1, NULL, 0x3132372e302e302e31, 'info@nutshealth.com.vn', '2018-09-17 01:13:40'),
(20, 1, NULL, 0x3132372e302e302e31, 'info@nutshealth.com.vn', '2018-12-04 15:00:55'),
(21, 1, NULL, 0x3132372e302e302e31, 'info@nutshealth.com.vn', '2018-12-05 11:37:26'),
(22, 1, NULL, 0x3132372e302e302e31, 'info@nutshealth.com.vn', '2018-12-11 14:25:58'),
(23, 1, NULL, 0x3132372e302e302e31, 'info@nutshealth.com.vn', '2019-03-15 23:21:47'),
(24, 1, NULL, 0x3132372e302e302e31, 'info@nutshealth.com.vn', '2019-03-16 14:29:13'),
(25, 1, NULL, 0x3132372e302e302e31, 'info@nutshealth.com.vn', '2019-03-18 08:52:06'),
(26, 1, NULL, 0x3132372e302e302e31, 'info@nutshealth.com.vn', '2019-04-03 03:56:29'),
(27, 1, NULL, 0x3132372e302e302e31, 'info@nutshealth.com.vn', '2019-04-03 04:26:28'),
(28, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-05-05 17:04:15'),
(29, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-05-06 02:14:55'),
(30, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-06-02 22:00:02'),
(31, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-06-02 22:01:56'),
(32, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-06-06 22:57:40'),
(33, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-06-06 22:58:40'),
(34, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-06-07 02:28:45'),
(35, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-06-23 11:15:30'),
(36, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-06-25 00:13:18'),
(37, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-07-08 03:00:11'),
(38, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-07-10 23:14:24'),
(39, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-08-11 11:15:17'),
(40, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-08-18 16:36:14'),
(41, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-09-01 08:05:05'),
(42, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-10-26 09:32:32'),
(43, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-11-16 12:11:00'),
(44, 1, NULL, 0x3132372e302e302e31, 'admin', '2019-12-29 03:20:10'),
(45, 1, NULL, 0x3132372e302e302e31, 'admin', '2020-01-08 14:34:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_variants`
--

INSERT INTO `sma_variants` (`id`, `name`) VALUES
(1, 'aaaaa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(1, 'WHI', 'Warehouse 1', '<p>Address, City</p>', NULL, '012345678', 'whi@tecdiary.com', NULL),
(2, 'WHII', 'Warehouse 2', '<p>Warehouse 2, Jalan Sultan Ismail, 54000, Kuala Lumpur</p>', NULL, '0105292122', 'whii@tecdiary.com', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(1, 2, 1, '1033.0000', NULL, '30000.0000'),
(2, 6, 1, '1000.0000', NULL, '30000.0000'),
(3, 6, 2, '1000.0000', NULL, '30000.0000'),
(4, 2, 2, '0.0000', NULL, '30000.0000'),
(5, 1, 1, '0.0000', NULL, '100000.0000'),
(6, 1, 2, '0.0000', NULL, '100000.0000'),
(7, 8, 1, '100.0000', '100', '155000.0000'),
(8, 8, 2, '100.0000', '100', '155000.0000'),
(9, 9, 1, '1000.0000', NULL, '43471.0000'),
(10, 9, 2, '1000.0000', NULL, '43471.0000'),
(11, 10, 1, '0.0000', NULL, '100000.0000'),
(12, 10, 2, '0.0000', NULL, '100000.0000'),
(13, 14, 1, '0.0000', NULL, '0.0000'),
(14, 14, 2, '0.0000', NULL, '0.0000'),
(15, 18, 1, '0.0000', NULL, '100000.0000'),
(16, 18, 2, '0.0000', NULL, '100000.0000'),
(17, 17, 1, '0.0000', NULL, '100000.0000'),
(18, 17, 2, '0.0000', NULL, '100000.0000'),
(19, 13, 1, '0.0000', NULL, '1000.0000'),
(20, 13, 2, '0.0000', NULL, '1000.0000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sma_wishlist`
--

CREATE TABLE `sma_wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sma_wishlist`
--

INSERT INTO `sma_wishlist` (`id`, `user_id`, `product_id`) VALUES
(1, 1, 14),
(2, 1, 25);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Chỉ mục cho bảng `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Chỉ mục cho bảng `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Chỉ mục cho bảng `sma_agency_levels`
--
ALTER TABLE `sma_agency_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Chỉ mục cho bảng `sma_api_keys`
--
ALTER TABLE `sma_api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_api_limits`
--
ALTER TABLE `sma_api_limits`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_api_logs`
--
ALTER TABLE `sma_api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Chỉ mục cho bảng `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Chỉ mục cho bảng `sma_cart`
--
ALTER TABLE `sma_cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_category_groups`
--
ALTER TABLE `sma_category_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Chỉ mục cho bảng `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Chỉ mục cho bảng `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Chỉ mục cho bảng `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Chỉ mục cho bảng `sma_pages`
--
ALTER TABLE `sma_pages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Chỉ mục cho bảng `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Chỉ mục cho bảng `sma_printers`
--
ALTER TABLE `sma_printers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `brand` (`brand`);

--
-- Chỉ mục cho bảng `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `price_group_id` (`price_group_id`);

--
-- Chỉ mục cho bảng `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_product_variant_type`
--
ALTER TABLE `sma_product_variant_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Chỉ mục cho bảng `sma_product_variant_type_group`
--
ALTER TABLE `sma_product_variant_type_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Chỉ mục cho bảng `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `sma_redirect`
--
ALTER TABLE `sma_redirect`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_returns`
--
ALTER TABLE `sma_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_return_items`
--
ALTER TABLE `sma_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`return_id`),
  ADD KEY `return_id_2` (`return_id`,`product_id`);

--
-- Chỉ mục cho bảng `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Chỉ mục cho bảng `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Chỉ mục cho bảng `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Chỉ mục cho bảng `sma_shop_settings`
--
ALTER TABLE `sma_shop_settings`
  ADD PRIMARY KEY (`shop_id`);

--
-- Chỉ mục cho bảng `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_sms_settings`
--
ALTER TABLE `sma_sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Chỉ mục cho bảng `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_count_id` (`stock_count_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `sma_units`
--
ALTER TABLE `sma_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Chỉ mục cho bảng `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Chỉ mục cho bảng `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Chỉ mục cho bảng `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Chỉ mục cho bảng `sma_wishlist`
--
ALTER TABLE `sma_wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `sma_addresses`
--
ALTER TABLE `sma_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_agency_levels`
--
ALTER TABLE `sma_agency_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sma_api_keys`
--
ALTER TABLE `sma_api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_api_limits`
--
ALTER TABLE `sma_api_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_api_logs`
--
ALTER TABLE `sma_api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_brands`
--
ALTER TABLE `sma_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `sma_category_groups`
--
ALTER TABLE `sma_category_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT cho bảng `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sma_pages`
--
ALTER TABLE `sma_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sma_printers`
--
ALTER TABLE `sma_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT cho bảng `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `sma_product_variant_type`
--
ALTER TABLE `sma_product_variant_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `sma_product_variant_type_group`
--
ALTER TABLE `sma_product_variant_type_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_redirect`
--
ALTER TABLE `sma_redirect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `sma_returns`
--
ALTER TABLE `sma_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_return_items`
--
ALTER TABLE `sma_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `sma_sms_settings`
--
ALTER TABLE `sma_sms_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_units`
--
ALTER TABLE `sma_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sma_wishlist`
--
ALTER TABLE `sma_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
