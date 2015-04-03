-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2015 at 07:11 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kancolle`
--
CREATE DATABASE IF NOT EXISTS `kancolle` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `kancolle`;

-- --------------------------------------------------------

--
-- Table structure for table `constructions`
--

DROP TABLE IF EXISTS `constructions`;
CREATE TABLE IF NOT EXISTS `constructions` (
`id` int(10) unsigned NOT NULL,
  `recipe` int(11) unsigned NOT NULL,
  `ship` varchar(16) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `constructions`
--

INSERT INTO `constructions` (`id`, `recipe`, `ship`, `count`) VALUES
(1, 1, 'Nenohi', 1),
(2, 1, 'Shiratsuyu', 1),
(3, 1, 'Inazuma', 1),
(4, 1, 'Yura', 1),
(5, 3, 'Kongou', 1),
(6, 2, 'Tama', 1);

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
CREATE TABLE IF NOT EXISTS `recipes` (
`id` int(10) unsigned NOT NULL,
  `fuel` int(11) NOT NULL DEFAULT '0',
  `ammo` int(11) NOT NULL DEFAULT '0',
  `steel` int(11) NOT NULL DEFAULT '0',
  `bauxite` int(11) NOT NULL DEFAULT '0',
  `devmats` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `fuel`, `ammo`, `steel`, `bauxite`, `devmats`) VALUES
(1, 30, 30, 30, 30, 1),
(2, 250, 30, 200, 30, 1),
(3, 400, 100, 600, 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ships`
--

DROP TABLE IF EXISTS `ships`;
CREATE TABLE IF NOT EXISTS `ships` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(16) NOT NULL,
  `japanese` varchar(16) CHARACTER SET ujis NOT NULL,
  `type` varchar(4) NOT NULL DEFAULT 'DD'
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ships`
--

INSERT INTO `ships` (`id`, `name`, `japanese`, `type`) VALUES
(1, 'Nagato', '長門', 'BB'),
(2, 'Mutsu', '陸奥', 'BB'),
(3, 'Ise', '伊勢', 'BB'),
(4, 'Hyuuga', '日向', 'BB'),
(5, 'Yukikaze', '雪風', 'DD'),
(6, 'Akagi', '赤城', 'CV'),
(7, 'Kaga', '加賀', 'CV'),
(8, 'Souryuu', '蒼龍', 'CV'),
(9, 'Hiryuu', '飛龍', 'CV'),
(10, 'Shimakaze', '島風', 'DD'),
(11, 'Fubuki', '吹雪', 'DD'),
(12, 'Shirayuki', '白雪', 'DD'),
(13, 'Hatsuyuki', '初雪', 'DD'),
(14, 'Miyuki', '深雪', 'DD'),
(15, 'Murakumo', '叢雲', 'DD'),
(16, 'Isonami', '磯波', 'DD'),
(17, 'Ayanami', '綾波', 'DD'),
(18, 'Shikinami', '敷波', 'DD'),
(19, 'Ooi', '大井', 'CL'),
(20, 'Kitakami', '北上', 'CL'),
(21, 'Kongou', '金剛', 'FBB'),
(22, 'Hiei', '比叡', 'FBB'),
(23, 'Haruna', '榛名', 'FBB'),
(24, 'Kirishima', '霧島', 'FBB'),
(25, 'Houshou', '鳳翔', 'CVL'),
(26, 'Fusou', '扶桑', 'BB'),
(27, 'Yamashiro', '山城', 'BB'),
(28, 'Tenryuu', '天龍', 'CL'),
(29, 'Tatsuta', '龍田', 'CL'),
(30, 'Ryuujou', '龍驤', 'CVL'),
(31, 'Mutsuki', '睦月', 'DD'),
(32, 'Kisaragi', '如月', 'DD'),
(33, 'Satsuki', '皐月', 'DD'),
(34, 'Fumizuki', '文月', 'DD'),
(35, 'Nagatsuki', '長月', 'DD'),
(36, 'Kikuzuki', '菊月', 'DD'),
(37, 'Mikazuki', '三日月', 'DD'),
(38, 'Mochizuki', '望月', 'DD'),
(39, 'Kuma', '球磨', 'CL'),
(40, 'Tama', '多摩', 'CL'),
(41, 'Kiso', '木曾', 'CL'),
(42, 'Nagara', '長良', 'CL'),
(43, 'Isuzu', '五十鈴', 'CL'),
(44, 'Natori', '名取', 'CL'),
(45, 'Yura', '由良', 'CL'),
(46, 'Sendai', '川内', 'CL'),
(47, 'Jintsuu', '神通', 'CL'),
(48, 'Naka', '那珂', 'CL'),
(49, 'Chitose', '千歳', 'AV'),
(50, 'Chiyoda', '千代田', 'AV'),
(51, 'Mogami', '最上', 'CA'),
(52, 'Furutaka', '古鷹', 'CA'),
(53, 'Kako', '加古', 'CA'),
(54, 'Aoba', '青葉', 'CA'),
(55, 'Myoukou', '妙高', 'CA'),
(56, 'Nachi', '那智', 'CA'),
(57, 'Ashigara', '足柄', 'CA'),
(58, 'Haguro', '羽黒', 'CA'),
(59, 'Takao', '高雄', 'CA'),
(60, 'Atago', '愛宕', 'CA'),
(61, 'Maya', '摩耶', 'CA'),
(62, 'Choukai', '鳥海', 'CA'),
(63, 'Tone', '利根', 'CA'),
(64, 'Chikuma', '筑摩', 'CA'),
(65, 'Hiyou', '飛鷹', 'CVL'),
(66, 'Junyou', '隼鷹', 'CVL'),
(67, 'Oboro', '朧', 'DD'),
(68, 'Akebono', '曙', 'DD'),
(69, 'Sazanami', '漣', 'DD'),
(70, 'Ushio', '潮', 'DD'),
(71, 'Akatsuki', '暁', 'DD'),
(72, 'Hibiki', '響', 'DD'),
(73, 'Ikazuchi', '雷', 'DD'),
(74, 'Inazuma', '電', 'DD'),
(75, 'Hatsuharu', '初春', 'DD'),
(76, 'Nenohi', '子日', 'DD'),
(77, 'Wakaba', '若葉', 'DD'),
(78, 'Hatsushimo', '初霜', 'DD'),
(79, 'Shiratsuyu', '白露', 'DD'),
(80, 'Shigure', '時雨', 'DD'),
(81, 'Murasame', '村雨', 'DD'),
(82, 'Yuudachi', '夕立', 'DD'),
(83, 'Samidare', '五月雨', 'DD'),
(84, 'Suzukaze', '涼風', 'DD'),
(85, 'Asashio', '朝潮', 'DD'),
(86, 'Ooshio', '大潮', 'DD'),
(87, 'Michishio', '満潮', 'DD'),
(88, 'Arashio', '荒潮', 'DD'),
(89, 'Arare', '霰', 'DD'),
(90, 'Kasumi', '霞', 'DD'),
(91, 'Kagerou', '陽炎', 'DD'),
(92, 'Shiranui', '不知火', 'DD'),
(93, 'Kuroshio', '黒潮', 'DD'),
(94, 'Shouhou', '祥鳳', 'CVL'),
(95, 'Chitose Kai', '千歳改', 'AV'),
(96, 'Chiyoda Kai', '千代田改', 'AV'),
(97, 'Ooi Kai', '大井改', 'CLT'),
(98, 'Kitakami Kai', '北上改', 'CLT'),
(99, 'Chitose A', '千歳甲', 'AV'),
(100, 'Chiyoda A', '千代田甲', 'AV'),
(101, 'Mogami Kai', '最上改', 'CAV'),
(102, 'Ise Kai', '伊勢改', 'BBV'),
(103, 'Hyuuga Kai', '日向改', 'BBV'),
(104, 'Chitose Carrier', '千歳航', 'CVL'),
(105, 'Chiyoda Carrier', '千代田航', 'CVL'),
(106, 'Shoukaku', '翔鶴', 'CV'),
(107, 'Zuikaku', '瑞鶴', 'CV'),
(108, 'Zuikaku Kai', '瑞鶴改', 'CV'),
(109, 'Kinu', '鬼怒', 'CL'),
(110, 'Abukuma', '阿武隈', 'CL'),
(111, 'Yuubari', '夕張', 'CL'),
(112, 'Zuihou', '瑞鳳', 'CVL'),
(113, 'Zuihou Kai', '瑞鳳改', 'CVL'),
(114, 'Ooi Kai Ni', '大井改二', 'CLT'),
(115, 'Kitakami Kai Ni', '北上改二', 'CLT'),
(116, 'Mikuma', '三隈', 'CA'),
(117, 'Mikuma Kai', '三隈改', 'CAV'),
(118, 'Hatsukaze', '初風', 'DD'),
(119, 'Maikaze', '舞風', 'DD'),
(120, 'Kinugasa', '衣笠', 'CA'),
(121, 'Chitose Carrier2', '千歳航改二', 'CVL'),
(122, 'Chiyoda Carrier2', '千代田航改二', 'CVL'),
(123, 'I-19', '伊19', 'SS'),
(124, 'Suzuya', '鈴谷', 'CA'),
(125, 'Kumano', '熊野', 'CA'),
(126, 'I-168', '伊168', 'SS'),
(127, 'I-58', '伊58', 'SS'),
(128, 'I-8', '伊8', 'SS'),
(129, 'Suzuya Kai', '鈴谷改', 'CAV'),
(130, 'Kumano Kai', '熊野改', 'CAV'),
(131, 'Yamato', '大和', 'BB'),
(132, 'Akigumo', '秋雲', 'DD'),
(133, 'Yuugumo', '夕雲', 'DD'),
(134, 'Makigumo', '巻雲', 'DD'),
(135, 'Naganami', '長波', 'DD'),
(136, 'Yamato Kai', '大和改', 'BB'),
(137, 'Agano', '阿賀野', 'CL'),
(138, 'Noshiro', '能代', 'CL'),
(139, 'Yahagi', '矢矧', 'CL'),
(140, 'Sakawa', '酒匂', 'CL'),
(141, 'Isuzu Kai Ni', '五十鈴改二', 'CL'),
(142, 'Kinugasa Kai Ni', '衣笠改二', 'CA'),
(143, 'Musashi', '武蔵', 'BB'),
(144, 'Yuudachi Kai Ni', '夕立改二', 'DD'),
(145, 'Shigure Kai Ni', '時雨改二', 'DD'),
(146, 'Kiso Kai Ni', '木曾改二', 'CLT'),
(147, 'Verniy', 'ヴェールヌイ', 'DD'),
(148, 'Musashi Kai', '武蔵改', 'BB'),
(149, 'Kongou Kai Ni', '金剛改二', 'FBB'),
(150, 'Hiei Kai Ni', '比叡改二', 'FBB'),
(151, 'Haruna Kai Ni', '榛名改二', 'FBB'),
(152, 'Kirishima Kai Ni', '霧島改二', 'FBB'),
(153, 'Taihou', '大鳳', 'CVB'),
(155, 'I-401', '伊401', 'SS'),
(156, 'Taihou Kai', '大鳳改', 'CVB'),
(157, 'Ryuujou Kai Ni', '龍驤改二', 'CVL'),
(158, 'Sendai Kai Ni', '川内改二', 'CL'),
(159, 'Jintsuu Kai Ni', '神通改二', 'CL'),
(160, 'Naka Kai Ni', '那珂改二', 'CL'),
(161, 'Akitsu Maru', 'あきつ丸', 'LHA'),
(163, 'Maruyu', 'まるゆ', 'SS'),
(164, 'Yayoi', '弥生', 'DD'),
(165, 'Uzuki', '卯月', 'DD'),
(166, 'Akitsu Maru Kai', 'あきつ丸改', 'LHA'),
(167, 'Isokaze', '磯風', 'DD'),
(168, 'Urakaze', '浦風', 'DD'),
(169, 'Tanikaze', '谷風', 'DD'),
(170, 'Hamakaze', '浜風', 'DD'),
(171, 'Bismarck', 'ビスマルク', 'FBB'),
(172, 'Bismarck Kai', 'ビスマルク改', 'FBB'),
(173, 'Bismarck Zwei', 'ビスマルクzwei', 'FBB'),
(174, 'Z1', 'Z1 レーベレヒト・マース', 'DD'),
(175, 'Z3', 'Z3 マックス・ シュルツ', 'DD'),
(176, 'Prinz Eugen', 'Prinz Eugen', 'CA'),
(177, 'Prinz Eugen Kai', 'Prinz Eugen Kai', 'CA'),
(178, 'Bismarck Drei', 'ビスマルク drei', 'FBB'),
(179, 'Z1 Zwei', 'Z1 zwei', 'DD'),
(180, 'Z3 Zwei', 'Z3 zwei', 'DD'),
(181, 'Amatsukaze', '天津風', 'DD'),
(182, 'Akashi', '明石', 'AR'),
(183, 'Ooyodo', '大淀', 'CL'),
(184, 'Taigei', '大鯨', 'AS'),
(185, 'Ryuuhou', '龍鳳', 'CVL'),
(186, 'Tokitsukaze', '時津風', 'DD'),
(187, 'Akashi Kai', '明石改', 'AR'),
(188, 'Tone Kai Ni', '利根改二', 'CAV'),
(189, 'Chikuma Kai Ni', '筑摩改二', 'CAV'),
(190, 'Ryuuhou Kai', '龍鳳改', 'CVL'),
(191, 'Myoukou Kai Ni', '妙高改二', 'CA'),
(194, 'Haguro Kai Ni', '羽黒改二', 'CA'),
(195, 'Ayanami Kai Ni', '綾波改二', 'DD'),
(196, 'Hiryuu Kai Ni', '飛龍改二', 'CV'),
(197, 'Souryuu Kai Ni', '蒼龍改二', 'CV'),
(201, 'Unryuu', '雲龍', 'CV'),
(204, 'Hatsuharu Kai Ni', '初春改二', 'DD'),
(205, 'Harusame', '春雨', 'DD'),
(206, 'Unryuu Kai', '雲龍改', 'CV'),
(207, 'Ushio Kai Ni', '潮改二', 'DD'),
(208, 'Junyou Kai Ni', '隼鷹改二', 'CVL'),
(209, 'Hayashimo', '早霜', 'DD'),
(210, 'Kiyoshimo', '清霜', 'DD'),
(211, 'Fusou Kai Ni', '扶桑改二', 'BBV'),
(212, 'Yamashiro Kai Ni', '山城改二', 'BBV'),
(213, 'Asagumo', '朝雲', 'DD'),
(214, 'Yamagumo', '山雲', 'DD'),
(215, 'Nowaki', '野分', 'DD'),
(216, 'Furutaka Kai Ni', '古鷹改二', 'CA'),
(221, 'Akizuki', '秋月', 'DD'),
(231, 'U-511', 'U-511', 'SS');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
`id` int(11) NOT NULL,
  `type` varchar(4) NOT NULL,
  `full` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `type`, `full`) VALUES
(1, 'DD', 'Destroyer'),
(2, 'CL', 'Light Cruiser'),
(3, 'CLT', 'Torpedo Cruiser'),
(4, 'CA', 'Heavy Cruiser'),
(5, 'CAV', 'Aviation Cruiser'),
(6, 'BB', 'Battleship'),
(7, 'FBB', 'Fast Battleship'),
(8, 'BBV', 'Aviation Battleship'),
(9, 'CV', 'Standard Aircraft Carrier'),
(10, 'CVB', 'Armored Aircraft Carrier'),
(11, 'CVL', 'Light Aircraft Carrier'),
(12, 'AV', 'Seaplane Tender'),
(13, 'SS', 'Submarine'),
(14, 'SSV', 'Submarine Aircraft Carrier'),
(15, 'LHA', 'Amphibious Assault Ship'),
(16, 'AR', 'Repair Ship'),
(17, 'AS', 'Submarine Tender');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `constructions`
--
ALTER TABLE `constructions`
 ADD PRIMARY KEY (`id`), ADD KEY `recipe` (`recipe`), ADD KEY `ship` (`ship`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ships`
--
ALTER TABLE `ships`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD UNIQUE KEY `japanese` (`japanese`), ADD KEY `type` (`type`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `type` (`type`), ADD UNIQUE KEY `full` (`full`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `constructions`
--
ALTER TABLE `constructions`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ships`
--
ALTER TABLE `ships`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=232;
--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `constructions`
--
ALTER TABLE `constructions`
ADD CONSTRAINT `constructions_ibfk_1` FOREIGN KEY (`recipe`) REFERENCES `recipes` (`id`),
ADD CONSTRAINT `constructions_ibfk_2` FOREIGN KEY (`ship`) REFERENCES `ships` (`name`);

--
-- Constraints for table `ships`
--
ALTER TABLE `ships`
ADD CONSTRAINT `ships_ibfk_1` FOREIGN KEY (`type`) REFERENCES `types` (`type`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
