-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 
-- 伺服器版本： 10.4.8-MariaDB
-- PHP 版本： 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `itp4511_assignment`
--
CREATE DATABASE IF NOT EXISTS `itp4511_assignment` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `itp4511_assignment`;

-- --------------------------------------------------------

--
-- 資料表結構 `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `cid` varchar(9) NOT NULL,
  `sid` varchar(9) NOT NULL,
  `attendance` int(11) DEFAULT NULL,
  `absence` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`,`sid`),
  KEY `a_fk2_idx` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 資料表新增資料前，先清除舊資料 `attendance`
--

TRUNCATE TABLE `attendance`;
--
-- 傾印資料表的資料 `attendance`
--

INSERT INTO `attendance` (`cid`, `sid`, `attendance`, `absence`) VALUES
('ITP4511', '180099876', 300, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `cid` varchar(9) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `hours` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 資料表新增資料前，先清除舊資料 `class`
--

TRUNCATE TABLE `class`;
--
-- 傾印資料表的資料 `class`
--

INSERT INTO `class` (`cid`, `name`, `hours`) VALUES
('ITP4511', 'Enterprise Systems Development', '60');

-- --------------------------------------------------------

--
-- 資料表結構 `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `sid` varchar(9) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lattName` varchar(45) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 資料表新增資料前，先清除舊資料 `student`
--

TRUNCATE TABLE `student`;
--
-- 傾印資料表的資料 `student`
--

INSERT INTO `student` (`sid`, `firstName`, `lattName`) VALUES
('180099876', 'Ngai Kuen', 'POON');

-- --------------------------------------------------------

--
-- 資料表結構 `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `tid` varchar(9) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 資料表新增資料前，先清除舊資料 `teacher`
--

TRUNCATE TABLE `teacher`;
--
-- 傾印資料表的資料 `teacher`
--

INSERT INTO `teacher` (`tid`, `name`) VALUES
('jesse', 'Jesse');

-- --------------------------------------------------------

--
-- 資料表結構 `teach_class`
--

DROP TABLE IF EXISTS `teach_class`;
CREATE TABLE IF NOT EXISTS `teach_class` (
  `cid` varchar(9) NOT NULL,
  `tid` varchar(45) NOT NULL,
  PRIMARY KEY (`cid`,`tid`),
  KEY `tc_fk2_idx` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 資料表新增資料前，先清除舊資料 `teach_class`
--

TRUNCATE TABLE `teach_class`;
--
-- 傾印資料表的資料 `teach_class`
--

INSERT INTO `teach_class` (`cid`, `tid`) VALUES
('ITP4511', 'jesse');

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `uid` varchar(9) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 資料表新增資料前，先清除舊資料 `user`
--

TRUNCATE TABLE `user`;
--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`uid`, `username`, `password`, `type`) VALUES
('180099876', 'test', 'test', 1),
('admin', 'admin', 'admin', 3),
('jesse', 'jesse', 'jesse', 2);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `a_fk1` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `a_fk2` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的限制式 `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `u_fk1` FOREIGN KEY (`sid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的限制式 `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `t_fk1` FOREIGN KEY (`tid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的限制式 `teach_class`
--
ALTER TABLE `teach_class`
  ADD CONSTRAINT `tc_fk1` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tc_fk2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
