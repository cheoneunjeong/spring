-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- jung 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `jung` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `jung`;

-- 테이블 jung.answer 구조 내보내기
CREATE TABLE IF NOT EXISTS `answer` (
  `a` varchar(50) NOT NULL,
  `q_num` int(11) NOT NULL,
  `a_num` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`a_num`),
  KEY `q_num` (`q_num`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`q_num`) REFERENCES `question` (`q_num`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.answer:~14 rows (대략적) 내보내기
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` (`a`, `q_num`, `a_num`) VALUES
	('객1', 49, 42),
	('객2', 49, 43),
	('객3', 49, 44),
	('객4', 49, 45),
	('체크옵션1', 50, 46),
	('체크옵션2', 50, 47),
	('체크옵션3', 50, 48),
	('체크옵션4', 50, 49),
	('체크옵션5', 50, 50),
	('드롭1', 51, 51),
	('드롭2', 51, 52),
	('드롭3', 51, 53),
	('드롭4', 51, 54),
	('드롭5', 51, 55),
	('test1', 56, 56),
	('test2', 56, 57),
	('test3', 56, 58),
	('c1', 57, 59),
	('c2', 57, 60),
	('c3', 57, 61),
	('c4', 57, 62),
	('test d1', 58, 63),
	('test d5', 58, 64),
	('test d2', 58, 65),
	('test d6', 58, 66);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.lc_auth:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lc_auth` DISABLE KEYS */;
INSERT INTO `lc_auth` (`u_id`, `u_auth`) VALUES
	('abc', 'ROLE_USER'),
	('c', 'ROLE_ADMIN'),
	('c', 'ROLE_USER'),
	('test', 'ROLE_USER'),
	('tt', 'ROLE_USER'),
	('zaza', 'ROLE_ADMIN'),
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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.lc_board:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lc_board` DISABLE KEYS */;
INSERT INTO `lc_board` (`b_id`, `b_title`, `b_content`, `b_writer`, `b_datetime`, `b_hit`, `groups`, `orders`, `depth`, `fileName`) VALUES
	(66, 'y', 'tu', 'c', '2021-12-14 09:54:37', 1, 66, 1, 0, NULL),
	(67, 'ghgfj', 'yfju', 'c', '2021-12-14 12:05:11', 2, 67, 1, 0, NULL),
	(68, 'pl', 'p', 'c', '2021-12-14 11:38:54', 2, 68, 1, 0, NULL),
	(69, 'xx', 'i9o-', 'c', '2021-12-17 09:26:18', 7, 69, 1, 0, NULL),
	(97, 'test', 'test', 'c', '2021-12-15 11:21:55', 8, 97, 1, 0, NULL),
	(98, '안녕', 'ㄹㄹㄹ', 'c', '2021-12-16 09:12:09', 18, 98, 1, 0, NULL),
	(102, 'ㅇㅇㅇ', 'ㅇㅇㅇ', 'c', '2021-12-27 11:23:39', 7, 102, 1, 0, 'tte.txt'),
	(103, 'ddd', 'ddd', 'zaza', '2021-12-27 11:23:29', 3, 103, 1, 0, NULL),
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `q_num` int(11) NOT NULL AUTO_INCREMENT,
  `t` varchar(50) DEFAULT NULL,
  `q` varchar(50) DEFAULT NULL,
  `filename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`q_num`) USING BTREE,
  KEY `s_num` (`s_num`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`s_num`) REFERENCES `survey` (`s_num`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.question:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`s_num`, `q_num`, `t`, `q`, `filename`) VALUES
	(48, 47, '1', '단답형질문', NULL),
	(48, 48, '2', '장문형질문', NULL),
	(48, 49, '3', '객관식질문', NULL),
	(48, 50, '4', '체크박스질문', NULL),
	(48, 51, '5', '드롭다운 질문', NULL),
	(49, 52, '1', 'ff', NULL),
	(50, 53, '1', 'dd', NULL),
	(51, 54, '1', 'ee', NULL),
	(56, 55, '1', '단답test', NULL),
	(56, 56, '3', '객관test', NULL),
	(56, 57, '4', '체크박스test', NULL),
	(56, 58, '5', '드롭다운test', NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;

-- 테이블 jung.sanswer 구조 내보내기
CREATE TABLE IF NOT EXISTS `sanswer` (
  `a` varchar(50) DEFAULT NULL,
  `que_num` int(11) NOT NULL,
  `ans_num` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ans_num`),
  KEY `que_num` (`que_num`),
  CONSTRAINT `sanswer_ibfk_1` FOREIGN KEY (`que_num`) REFERENCES `squestion` (`que_num`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.sanswer:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sanswer` DISABLE KEYS */;
INSERT INTO `sanswer` (`a`, `que_num`, `ans_num`) VALUES
	('단답답', 1, 1),
	('장문답', 2, 2),
	('객1', 3, 3),
	('체크옵션3', 4, 4),
	('체크옵션4', 4, 5),
	('드롭5', 5, 6),
	('ㅎㅎ', 6, 7),
	('ㅎㅎ', 7, 8),
	('객4', 8, 9),
	('체크옵션2', 9, 10),
	('드롭1', 10, 11);
/*!40000 ALTER TABLE `sanswer` ENABLE KEYS */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.spring_session:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` (`PRIMARY_ID`, `SESSION_ID`, `CREATION_TIME`, `LAST_ACCESS_TIME`, `MAX_INACTIVE_INTERVAL`, `EXPIRY_TIME`, `PRINCIPAL_NAME`) VALUES
	('ff60f9f3-ede5-4b82-9210-38d96f85c17a', '63412b38-1316-43c0-b0a3-5b5d11eca8c9', 1640649837503, 1640660634580, 7200, 1640667834580, 'c');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;

-- 테이블 jung.spring_session_attributes 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.spring_session_attributes:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`, `ATTRIBUTE_BYTES`) VALUES
	('ff60f9f3-ede5-4b82-9210-38d96f85c17a', 'SPRING_SECURITY_CONTEXT', _binary 0xACED00057372003D6F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E636F6E746578742E5365637572697479436F6E74657874496D706C00000000000002300200014C000E61757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B78707372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000002300200024C000B63726564656E7469616C737400124C6A6176612F6C616E672F4F626A6563743B4C00097072696E636970616C71007E0004787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C7371007E0004787001737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00067870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000002770400000002737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000002300200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000A524F4C455F41444D494E7371007E000E740009524F4C455F555345527871007E000D737200486F72672E737072696E676672616D65776F726B2E73656375726974792E7765622E61757468656E7469636174696F6E2E57656241757468656E7469636174696F6E44657461696C7300000000000002300200024C000D72656D6F74654164647265737371007E000F4C000973657373696F6E496471007E000F787074000F303A303A303A303A303A303A303A3174002436393937616632302D613139342D346465332D613564352D643466313762333563363934707372001E636F6D2E6578616D706C652E737072696E672E646F6D61696E2E55736572000000000000000102000B490006524F574E554D5A001369734163636F756E744E6F6E457870697265645A001269734163636F756E744E6F6E4C6F636B65645A0017697343726564656E7469616C734E6F6E457870697265645A00096973456E61626C65645A0006755F617574684C000B617574686F72697469657371007E00064C000870617373776F726471007E000F4C0009754461746554696D6571007E000F4C0005754E616D6571007E000F4C0008757365726E616D6571007E000F78700000000001010101007371007E000C0000000277040000000271007E001071007E00127874003C243261243130244F484537587A484B744F3235566F35486B3451544B4F45573165634C437269734577646C6837484E496755667863753566784E694B707400016374000163);
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;

-- 테이블 jung.squestion 구조 내보내기
CREATE TABLE IF NOT EXISTS `squestion` (
  `q` varchar(50) NOT NULL,
  `t` varchar(50) NOT NULL,
  `sub_num` int(11) NOT NULL,
  `que_num` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`que_num`) USING BTREE,
  KEY `sub_num` (`sub_num`),
  CONSTRAINT `squestion_ibfk_1` FOREIGN KEY (`sub_num`) REFERENCES `submission` (`sub_num`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.squestion:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `squestion` DISABLE KEYS */;
INSERT INTO `squestion` (`q`, `t`, `sub_num`, `que_num`) VALUES
	('단답형질문', '1', 1, 1),
	('장문형질문', '2', 1, 2),
	('객관식질문', '3', 1, 3),
	('체크박스질문', '4', 1, 4),
	('드롭다운 질문', '5', 1, 5),
	('단답형질문', '1', 2, 6),
	('장문형질문', '2', 2, 7),
	('객관식질문', '3', 2, 8),
	('체크박스질문', '4', 2, 9),
	('드롭다운 질문', '5', 2, 10);
/*!40000 ALTER TABLE `squestion` ENABLE KEYS */;

-- 테이블 jung.submission 구조 내보내기
CREATE TABLE IF NOT EXISTS `submission` (
  `s_num` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `disc` varchar(50) NOT NULL,
  `writer` varchar(50) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `sub_num` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sub_num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.submission:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
INSERT INTO `submission` (`s_num`, `title`, `disc`, `writer`, `datetime`, `sub_num`) VALUES
	(48, '제목', '설문지설명', 'c', '2021-12-28 11:51:25', 1),
	(48, '제목', '설문지설명', 'c', '2021-12-28 11:52:35', 2);
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;

-- 테이블 jung.survey 구조 내보내기
CREATE TABLE IF NOT EXISTS `survey` (
  `s_num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `disc` varchar(200) DEFAULT NULL,
  `writer` varchar(50) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `hit` int(100) NOT NULL DEFAULT 0,
  PRIMARY KEY (`s_num`),
  KEY `writer` (`writer`),
  CONSTRAINT `survey_ibfk_1` FOREIGN KEY (`writer`) REFERENCES `lc_user1` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.survey:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` (`s_num`, `title`, `disc`, `writer`, `datetime`, `hit`) VALUES
	(48, '제목', '설문지설명', 'c', '2021-12-27 10:31:12', 0),
	(49, 'ff', 'ff', 'c', '2021-12-27 18:02:16', 0),
	(50, 'dd', 'dd', 'c', '2021-12-27 18:02:21', 0),
	(51, 'ee', 'ee', 'c', '2021-12-27 18:18:05', 0),
	(52, 'q', '', 'c', '2021-12-27 18:18:08', 0),
	(53, 'r', '', 'c', '2021-12-27 18:18:15', 0),
	(54, 'd', '', 'c', '2021-12-27 18:18:17', 0),
	(56, 'test', 'test설명', 'c', '2021-12-28 11:27:48', 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

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
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
