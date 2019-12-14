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

-- --------------------------------------------------------

--
-- 資料表結構 `attendance`
--

CREATE TABLE `attendance` (
  `cid` varchar(9) NOT NULL,
  `sid` varchar(9) NOT NULL,
  `attended_time` time DEFAULT NULL,
  `class_day` date DEFAULT NULL,
  `is_late` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `attendance`
--

INSERT INTO `attendance` (`cid`, `sid`, `attended_time`, `class_day`, `is_late`) VALUES
('ITP4511', '180000000', '13:41:00', '2019-12-13', 1),
('ITP4511', '180000001', '13:40:00', '2019-12-13', 0),
('ITP4511', '180099876', '13:30:00', '2019-12-13', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `class`
--

CREATE TABLE `class` (
  `cid` varchar(9) NOT NULL,
  `sid` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `class`
--

INSERT INTO `class` (`cid`, `sid`) VALUES
('ITP4511', '180000000'),
('ITP4511', '180000001'),
('ITP4511', '180000002'),
('ITP4511', '180000003'),
('ITP4511', '180099876');

-- --------------------------------------------------------

--
-- 資料表結構 `course`
--

CREATE TABLE `course` (
  `cid` varchar(9) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `hours` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `course`
--

INSERT INTO `course` (`cid`, `name`, `hours`) VALUES
('ITP4511', 'Enterprise Systems Development', '60');

-- --------------------------------------------------------

--
-- 資料表結構 `student`
--

CREATE TABLE `student` (
  `sid` varchar(9) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `student`
--

INSERT INTO `student` (`sid`, `firstName`, `lastName`) VALUES
('180000000', 'Amy', 'Chan'),
('180000001', 'Andy', 'Chan'),
('180000002', 'Kitty', 'Wong'),
('180000003', 'John', 'Wong'),
('180099876', 'Ngai Kuen', 'POON');

-- --------------------------------------------------------

--
-- 資料表結構 `teacher`
--

CREATE TABLE `teacher` (
  `tid` varchar(9) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `teacher`
--

INSERT INTO `teacher` (`tid`, `name`) VALUES
('jesse', 'Jesse');

-- --------------------------------------------------------

--
-- 資料表結構 `teach_class`
--

CREATE TABLE `teach_class` (
  `cid` varchar(9) NOT NULL,
  `tid` varchar(45) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `teach_class`
--

INSERT INTO `teach_class` (`cid`, `tid`, `start_time`, `end_time`) VALUES
('ITP4511', 'jesse', '15:30:00', '17:30:00');

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `uid` varchar(9) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`uid`, `username`, `password`, `type`) VALUES
('180000000', 'test2', 'test2', 1),
('180000001', 'test3', 'test3', 1),
('180000002', 'test4', 'test4', 1),
('180000003', 'test5', 'test5', 1),
('180099876', 'test', 'test', 1),
('admin', 'admin', 'admin', 3),
('jesse', 'jesse', 'jesse', 2);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`cid`,`sid`),
  ADD KEY `a_fk2_idx` (`sid`);

--
-- 資料表索引 `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`cid`,`sid`),
  ADD KEY `class_fk2` (`sid`);

--
-- 資料表索引 `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`cid`);

--
-- 資料表索引 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`tid`);

--
-- 資料表索引 `teach_class`
--
ALTER TABLE `teach_class`
  ADD PRIMARY KEY (`cid`,`tid`),
  ADD KEY `tc_fk2_idx` (`tid`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `a_fk1` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `a_fk2` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 資料表的限制式 `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_fk1` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `class_fk2` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `tc_fk1` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tc_fk2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
