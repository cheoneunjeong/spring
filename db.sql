-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.4-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- jung 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `jung` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `jung`;

-- 테이블 jung.answer 구조 내보내기
CREATE TABLE IF NOT EXISTS `answer` (
  `text` varchar(50) NOT NULL,
  `question` varchar(50) NOT NULL,
  PRIMARY KEY (`text`),
  KEY `question` (`question`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question`) REFERENCES `question` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jung.answer:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;

-- 테이블 jung.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `b_idx` int(10) NOT NULL AUTO_INCREMENT,
  `b_title` varchar(255) NOT NULL,
  `b_content` varchar(255) NOT NULL,
  `b_date` varchar(255) NOT NULL,
  `b_writer` varchar(255) NOT NULL,
  `u_idx` int(10) DEFAULT NULL,
  PRIMARY KEY (`b_idx`),
  KEY `u_idx` (`u_idx`),
  CONSTRAINT `board_ibfk_1` FOREIGN KEY (`u_idx`) REFERENCES `user` (`u_idx`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jung.board:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`b_idx`, `b_title`, `b_content`, `b_date`, `b_writer`, `u_idx`) VALUES
	(1, '제목', '내용입니다.', '2021-11-09', '작성자', 1);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 jung.lc_auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `lc_auth` (
  `u_id` varchar(50) NOT NULL,
  `u_auth` varchar(50) NOT NULL,
  PRIMARY KEY (`u_id`,`u_auth`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jung.lc_auth:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lc_auth` DISABLE KEYS */;
INSERT INTO `lc_auth` (`u_id`, `u_auth`) VALUES
	('abc', 'ROLE_USER'),
	('c', 'ROLE_USER'),
	('test', 'ROLE_USER'),
	('tt', 'ROLE_USER'),
	('zaza', 'ROLE_USER');
/*!40000 ALTER TABLE `lc_auth` ENABLE KEYS */;

-- 테이블 jung.lc_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `lc_board` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_title` varchar(255) DEFAULT NULL,
  `b_content` varchar(255) DEFAULT NULL,
  `b_writer` varchar(50) NOT NULL,
  `b_datetime` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `b_hit` int(11) NOT NULL DEFAULT 0,
  `groups` int(11) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `fileName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `b_writer` (`b_writer`),
  CONSTRAINT `lc_board_ibfk_1` FOREIGN KEY (`b_writer`) REFERENCES `lc_user1` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jung.lc_board:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lc_board` DISABLE KEYS */;
INSERT INTO `lc_board` (`b_id`, `b_title`, `b_content`, `b_writer`, `b_datetime`, `b_hit`, `groups`, `orders`, `depth`, `fileName`) VALUES
	(66, 'y', 'tu', 'c', '2021-12-14 09:54:37', 1, 66, 1, 0, NULL),
	(67, 'ghgfj', 'yfju', 'c', '2021-12-14 12:05:11', 2, 67, 1, 0, NULL),
	(68, 'pl', 'p', 'c', '2021-12-14 11:38:54', 2, 68, 1, 0, NULL),
	(69, 'xx', 'i9o-', 'c', '2021-12-17 09:26:18', 7, 69, 1, 0, NULL),
	(97, 'test', 'test', 'c', '2021-12-15 11:21:55', 8, 97, 1, 0, NULL),
	(98, '안녕', 'ㄹㄹㄹ', 'c', '2021-12-16 09:12:09', 18, 98, 1, 0, NULL),
	(102, 'ㅇㅇㅇ', 'ㅇㅇㅇ', 'c', '2021-12-17 09:26:34', 5, 102, 1, 0, 'tte.txt'),
	(103, 'ddd', 'ddd', 'zaza', '2021-12-17 09:26:54', 2, 103, 1, 0, NULL),
	(104, 'aa', 'aa', 'zaza', '2021-12-17 09:28:14', 1, 104, 1, 0, NULL);
/*!40000 ALTER TABLE `lc_board` ENABLE KEYS */;

-- 테이블 jung.lc_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `lc_reply` (
  `bId` int(11) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `writer` varchar(50) DEFAULT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `groups` int(11) NOT NULL DEFAULT 0,
  `orders` int(11) NOT NULL DEFAULT 0,
  `depth` int(11) NOT NULL DEFAULT 0,
  `r_num` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`r_num`),
  KEY `writer` (`writer`),
  KEY `bId` (`bId`),
  CONSTRAINT `lc_reply_ibfk_1` FOREIGN KEY (`bId`) REFERENCES `lc_board` (`b_id`),
  CONSTRAINT `lc_reply_ibfk_2` FOREIGN KEY (`writer`) REFERENCES `lc_user1` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jung.lc_reply:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lc_reply` DISABLE KEYS */;
INSERT INTO `lc_reply` (`bId`, `content`, `writer`, `datetime`, `groups`, `orders`, `depth`, `r_num`) VALUES
	(97, '1', 'c', '2021-12-14 22:53:06', 1, 1, 0, 1),
	(97, '1', 'c', '2021-12-14 23:08:18', 2, 1, 0, 2),
	(97, '1', 'c', '2021-12-14 23:08:43', 3, 1, 0, 3),
	(98, 'ㅁㄴㄷㄱㄹ', 'c', '2021-12-15 10:27:37', 4, 1, 0, 4),
	(98, 'ㄴㄷㅇㄹ', 'c', '2021-12-15 10:33:24', 5, 1, 0, 5),
	(98, 'rr', 'c', '2021-12-15 12:07:10', 7, 1, 0, 7);
/*!40000 ALTER TABLE `lc_reply` ENABLE KEYS */;

-- 테이블 jung.lc_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `lc_user` (
  `u_id` varchar(50) DEFAULT NULL,
  `u_password` varchar(50) DEFAULT NULL,
  `u_name` varchar(50) DEFAULT NULL,
  `u_age` int(11) DEFAULT NULL,
  `u_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jung.lc_user:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lc_user` DISABLE KEYS */;
INSERT INTO `lc_user` (`u_id`, `u_password`, `u_name`, `u_age`, `u_datetime`) VALUES
	('aaa', 'aaa', 'aa', 10, '2021-12-01 00:00:00'),
	('test1', '1234', 'kim', 20, '2021-12-02 09:55:56'),
	('test1', '1234', 'kim', 20, '2021-12-03 16:36:58');
/*!40000 ALTER TABLE `lc_user` ENABLE KEYS */;

-- 테이블 jung.lc_user1 구조 내보내기
CREATE TABLE IF NOT EXISTS `lc_user1` (
  `u_id` varchar(50) NOT NULL,
  `u_password` varchar(200) DEFAULT NULL,
  `u_name` varchar(200) DEFAULT NULL,
  `u_datetime` datetime DEFAULT current_timestamp(),
  `u_isAccountNonExpired` tinyint(10) DEFAULT NULL,
  `u_isAccountNonLocked` tinyint(10) DEFAULT NULL,
  `u_isCredentialNonExpired` tinyint(10) DEFAULT NULL,
  `u_isEnabled` tinyint(10) DEFAULT NULL,
  `u_auth` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jung.lc_user1:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lc_user1` DISABLE KEYS */;
INSERT INTO `lc_user1` (`u_id`, `u_password`, `u_name`, `u_datetime`, `u_isAccountNonExpired`, `u_isAccountNonLocked`, `u_isCredentialNonExpired`, `u_isEnabled`, `u_auth`) VALUES
	('abc', '$2a$10$08XR0uPaiUX.YWh9pxGu8.suYdnnp/m2XsxPj0dxi7mbCRi8ej1Vq', 'abc', '2021-12-06 09:28:58', 1, 1, 1, 1, 0),
	('c', '$2a$10$OHE7XzHKtO25Vo5Hk4QTKOEW1ecLCrisEwdlh7HNIgUfxcu5fxNiK', 'c', '2021-12-06 09:32:58', 1, 1, 1, 1, 1),
	('qqq', '$2a$10$m84mPoZUFe0TNsuMs76Zh.qsYVRgwggh5FxyHS6xv6NKIcCH.G1Jy', 'qqq', '2021-12-10 11:29:09', 1, 1, 1, 1, 0),
	('test', '$2a$10$hUKBj0KXyq.LedcVeqv4YONVdE2yzwF7Uk.G2rYmcCsNBOQe3RXoG', 'test', '2021-12-04 14:25:02', 1, 1, 1, 1, 0),
	('tt', '$2a$10$QLbzS8zTg1.2WJ2LSdrMLOoU6FRzDXJGj8TyBoePrVK/3//ZTEswe', 'tt', '2021-12-04 14:25:23', 1, 1, 1, 1, 0),
	('zaza', '$2a$10$aKo6SCUkDM8OFvkAfB2dKegmqPgIE329b.FihTSsrmA5SLUbvVHwK', 'zaza', '2021-12-10 11:32:44', 1, 1, 1, 1, 0);
/*!40000 ALTER TABLE `lc_user1` ENABLE KEYS */;

-- 테이블 jung.question 구조 내보내기
CREATE TABLE IF NOT EXISTS `question` (
  `s_num` int(11) DEFAULT NULL,
  `question` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `answers` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`question`),
  KEY `s_num` (`s_num`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`s_num`) REFERENCES `survey` (`s_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jung.question:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;

-- 테이블 jung.spring_session 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jung.spring_session:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
	('d19bf1ac-9781-4308-a8c6-ce1c100e47e9', 'ffce2e81-d1c3-4eb4-91f8-afca14a12039', 1640179226440, 1640189562810, 7200, 1640196762810, 'c');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;

-- 테이블 jung.spring_session_attributes 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jung.spring_session_attributes:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`, `ATTRIBUTE_BYTES`) VALUES
	('d19bf1ac-9781-4308-a8c6-ce1c100e47e9', 'SPRING_SECURITY_CONTEXT', _binary 0xaced00057372003d6f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e636f6e746578742e5365637572697479436f6e74657874496d706c00000000000002300200014c000e61757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b78707372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000002300200024c000b63726564656e7469616c737400124c6a6176612f6c616e672f4f626a6563743b4c00097072696e636970616c71007e0004787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c7371007e0004787001737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00067870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000001770400000001737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000002300200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b7870740009524f4c455f555345527871007e000d737200486f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e61757468656e7469636174696f6e2e57656241757468656e7469636174696f6e44657461696c7300000000000002300200024c000d72656d6f74654164647265737371007e000f4c000973657373696f6e496471007e000f787074000f303a303a303a303a303a303a303a3174002465633262386330342d373433632d346461342d613761352d343931356462633362333364707372001e636f6d2e6578616d706c652e737072696e672e646f6d61696e2e55736572000000000000000102000b490006524f574e554d5a001369734163636f756e744e6f6e457870697265645a001269734163636f756e744e6f6e4c6f636b65645a0017697343726564656e7469616c734e6f6e457870697265645a00096973456e61626c65645a0006755f617574684c000b617574686f72697469657371007e00064c000870617373776f726471007e000f4c0009754461746554696d6571007e000f4c0005754e616d6571007e000f4c0008757365726e616d6571007e000f78700000000001010101007371007e000c0000000177040000000171007e00107874003c243261243130244f484537587a484b744f3235566f35486b3451544b4f45573165634c437269734577646c6837484e496755667863753566784e694b707400016374000163);
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;

-- 테이블 jung.survey 구조 내보내기
CREATE TABLE IF NOT EXISTS `survey` (
  `s_num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `disc` varchar(200) DEFAULT NULL,
  `questions` varchar(200) DEFAULT NULL,
  `writer` varchar(50) DEFAULT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `filename` varchar(50) DEFAULT NULL,
  `hit` int(100) NOT NULL DEFAULT 0,
  PRIMARY KEY (`s_num`),
  KEY `writer` (`writer`),
  CONSTRAINT `survey_ibfk_1` FOREIGN KEY (`writer`) REFERENCES `lc_user1` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jung.survey:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;

-- 테이블 jung.test 구조 내보내기
CREATE TABLE IF NOT EXISTS `test` (
  `b_idx` int(10) NOT NULL AUTO_INCREMENT,
  `b_title` varchar(255) NOT NULL,
  `b_content` varchar(255) NOT NULL,
  `b_date` datetime NOT NULL,
  `u_idx` int(10) NOT NULL,
  `b_hit` int(10) NOT NULL DEFAULT 0,
  `groups` int(11) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `b_file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`b_idx`),
  KEY `u_idx` (`u_idx`),
  CONSTRAINT `test_ibfk_1` FOREIGN KEY (`u_idx`) REFERENCES `user` (`u_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jung.test:~26 rows (대략적) 내보내기
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` (`b_idx`, `b_title`, `b_content`, `b_date`, `u_idx`, `b_hit`, `groups`, `orders`, `depth`, `b_file`) VALUES
	(99, '1', 'l', '2021-11-19 09:59:04', 11, 3, 99, 1, 0, NULL),
	(100, '3', 'ㅇㅇㅇ', '2021-11-19 05:22:50', 11, 44, 100, 1, 0, NULL),
	(101, '1-1', ';', '2021-11-19 09:59:15', 11, 3, 99, 5, 1, NULL),
	(102, '1-2', 'p0', '2021-11-19 09:59:22', 11, 2, 99, 3, 1, NULL),
	(103, '1-1 /1', 'jnj', '2021-11-19 10:06:22', 11, 0, 99, 9, 2, NULL),
	(104, '1-1 / 2', '[[', '2021-11-19 10:06:32', 11, 3, 99, 6, 2, NULL),
	(105, '112 -1', '[[', '2021-11-19 10:06:55', 11, 0, 99, 8, 3, NULL),
	(106, '112 -2', '[[', '2021-11-19 10:07:09', 11, 0, 99, 7, 3, NULL),
	(107, '2-1', '[', '2021-11-19 10:07:23', 11, 1, 100, 2, 1, NULL),
	(108, '1-3', '[[', '2021-11-19 10:07:34', 11, 2, 99, 2, 1, NULL),
	(109, '1-2 /1', '[[', '2021-11-19 10:07:57', 11, 0, 99, 4, 2, NULL),
	(113, '글', 'ㄹㄹㄹ', '2021-11-19 05:21:23', 11, 1, 113, 1, 0, NULL),
	(114, '글2', 'ㅇㅇㅇ', '2021-11-19 05:21:32', 11, 23, 114, 1, 0, NULL),
	(115, '답글', 'ㄴㄴㄴ', '2021-11-19 05:21:44', 11, 1, 113, 2, 1, NULL),
	(116, '수정', 'ㅇㅇ', '2021-11-19 05:22:16', 11, 3, 113, 3, 2, NULL),
	(117, 'tt', 'tt', '2021-11-19 07:45:40', 11, 3, 117, 1, 0, NULL),
	(121, 'zz', 'zz', '2021-11-25 04:16:13', 11, 0, 121, 1, 0, NULL),
	(122, 'zz', 'zz', '2021-11-25 04:58:11', 11, 4, 122, 1, 0, NULL),
	(123, 'f', 'f', '2021-11-25 04:59:30', 11, 7, 123, 1, 0, NULL),
	(135, 'TRYH', 'EY', '2021-11-26 10:07:19', 11, 1, 135, 1, 0, '추상.txt'),
	(136, 'ZZZ', 'ZZZZ', '2021-11-26 10:07:48', 11, 8, 136, 1, 0, '추상.txt,인터.txt'),
	(156, 'ㅇㄴㅇ', '9946A4505F5817A60D.png', '2021-11-26 11:22:13', 11, 4, 156, 1, 0, '9946A4505F5817A60D.png'),
	(157, 'ad', 'asd', '2021-12-13 10:42:37', 11, 0, 157, 1, 0, 'web - 복사본.xml'),
	(158, 'g', 'g', '2021-12-14 10:23:42', 11, 0, 158, 1, 0, 'ssawe.jpg'),
	(159, 'r', 'r', '2021-12-14 10:24:57', 11, 0, 159, 1, 0, 'ssawe.jpg'),
	(160, 'r', 'e', '2021-12-14 10:26:24', 11, 0, 160, 1, 0, 'ssawe.jpg');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

-- 테이블 jung.test_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `test_reply` (
  `c_num` int(10) NOT NULL AUTO_INCREMENT,
  `b_idx` int(11) NOT NULL DEFAULT 0,
  `u_idx` int(11) NOT NULL DEFAULT 0,
  `c_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `c_content` varchar(255) NOT NULL,
  `groups` int(11) NOT NULL DEFAULT 0,
  `orders` int(11) NOT NULL DEFAULT 0,
  `depth` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`c_num`),
  KEY `u_idx` (`u_idx`),
  KEY `b_idx` (`b_idx`),
  CONSTRAINT `test_reply_ibfk_1` FOREIGN KEY (`u_idx`) REFERENCES `user` (`u_idx`),
  CONSTRAINT `test_reply_ibfk_2` FOREIGN KEY (`b_idx`) REFERENCES `test` (`b_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jung.test_reply:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `test_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_reply` ENABLE KEYS */;

-- 테이블 jung.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `u_idx` int(10) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(255) NOT NULL,
  `u_pw` varchar(255) NOT NULL,
  `u_name` varchar(255) NOT NULL,
  `u_tel` varchar(255) NOT NULL,
  `u_age` varchar(255) NOT NULL,
  `manager` int(11) NOT NULL DEFAULT 0,
  `u_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`u_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 jung.user:~19 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`u_idx`, `u_id`, `u_pw`, `u_name`, `u_tel`, `u_age`, `manager`, `u_datetime`) VALUES
	(1, 'abc', '1234', 'NAME1', '010-0000-0000', '50', 1, '0000-00-00 00:00:00'),
	(3, 'rlaEodEOd', '111', '김땡땡', '010-1111-1111', '20', 0, '0000-00-00 00:00:00'),
	(4, 'b', '222', '이모씨', '010-2222-2222', '37', 0, '0000-00-00 00:00:00'),
	(5, 'ccc', '34343', '강하다', '010-2121-3232', '58', 0, '0000-00-00 00:00:00'),
	(6, 'dfdf', '545', '홍길동', '010-2898-4767', '44', 0, '0000-00-00 00:00:00'),
	(7, 'zyzy', '252d', '대한민국', '010-4747-3634', '88', 0, '0000-00-00 00:00:00'),
	(8, 'a1234', 'bbbb', '만세', '010-8487-7978', '69', 0, '0000-00-00 00:00:00'),
	(9, 'baba', 'cfdfd', '바비', '010-8787-1111', '56', 0, '0000-00-00 00:00:00'),
	(10, 'wew', 'qqqq', '박찬호', '010-7777-3232', '50', 0, '0000-00-00 00:00:00'),
	(11, 'a1', '5555', '강호동', '090-4343-4444', '32', 1, '0000-00-00 00:00:00'),
	(12, 'b1', '1111', '박길동', '090-3333-7777', '49', 0, '0000-00-00 00:00:00'),
	(13, 'bb1', '2222', '고길돌', '090-4444-6666', '61', 0, '0000-00-00 00:00:00'),
	(16, 'gbhuj', '1234', 'ok', '1-1-1', '11', 0, '0000-00-00 00:00:00'),
	(18, 'abcd', 'efg', 'abcd', '010-1234-1234', '30', 0, '0000-00-00 00:00:00'),
	(20, 'ttt', 'zxczxc', 'ttt', '010-7894-1412', '30', 0, '0000-00-00 00:00:00'),
	(21, 'zzxx', 'zzxx', 'zzxx', '010-1111-2222', '11', 0, '0000-00-00 00:00:00'),
	(22, 'gg', 'aa', 'aa', 'a-a-a', 'aa', 0, '0000-00-00 00:00:00'),
	(23, 'zxc', 'zxc', 'zxc', 'zxc-zxc-zxc', 'zxc', 0, '0000-00-00 00:00:00'),
	(24, 'ㅇㅇㅇ', '123123', 'ddd', '1231-1231-1231', '12', 0, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
