/*
 Navicat Premium Data Transfer

 Source Server         : czz
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : 202103_CZ_Mis

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 08/06/2023 01:57:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for CZ_Admin_account
-- ----------------------------
DROP TABLE IF EXISTS `CZ_Admin_account`;
CREATE TABLE `CZ_Admin_account` (
  `Admno` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Admpwd` char(20) NOT NULL,
  PRIMARY KEY (`Admno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of CZ_Admin_account
-- ----------------------------
BEGIN;
INSERT INTO `CZ_Admin_account` (`Admno`, `Admpwd`) VALUES ('admin', '12345678');
COMMIT;

-- ----------------------------
-- Table structure for CZ_Class
-- ----------------------------
DROP TABLE IF EXISTS `CZ_Class`;
CREATE TABLE `CZ_Class` (
  `Clsno` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Clsname` char(20) DEFAULT NULL,
  `Mno` char(10) DEFAULT NULL,
  PRIMARY KEY (`Clsno`),
  UNIQUE KEY `Mno_CLno` (`Clsno`,`Mno`),
  KEY `Major_Class` (`Mno`),
  CONSTRAINT `Major_Class` FOREIGN KEY (`Mno`) REFERENCES `CZ_Major` (`Mno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of CZ_Class
-- ----------------------------
BEGIN;
INSERT INTO `CZ_Class` (`Clsno`, `Clsname`, `Mno`) VALUES ('033101', '软件工程01班', '0331');
INSERT INTO `CZ_Class` (`Clsno`, `Clsname`, `Mno`) VALUES ('033401', '软件工程（中外合办）01班', '0334');
INSERT INTO `CZ_Class` (`Clsno`, `Clsname`, `Mno`) VALUES ('033402', '软件工程（中外合办）02班', '0334');
INSERT INTO `CZ_Class` (`Clsno`, `Clsname`, `Mno`) VALUES ('033403', '软件工程（中外合办）03班', '0334');
COMMIT;

-- ----------------------------
-- Table structure for CZ_Class_Course
-- ----------------------------
DROP TABLE IF EXISTS `CZ_Class_Course`;
CREATE TABLE `CZ_Class_Course` (
  `Clsno` char(20) NOT NULL,
  `Cno` char(20) NOT NULL,
  PRIMARY KEY (`Clsno`,`Cno`),
  KEY `clas_cor` (`Cno`),
  CONSTRAINT `clas_cor` FOREIGN KEY (`Cno`) REFERENCES `CZ_Courses` (`Cno`),
  CONSTRAINT `cls_cou` FOREIGN KEY (`Clsno`) REFERENCES `CZ_Class` (`Clsno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of CZ_Class_Course
-- ----------------------------
BEGIN;
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033403', '1');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033403', '10');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033401', '11');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033402', '11');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033403', '11');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033403', '12');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033401', '13');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033402', '13');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033401', '2');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033402', '2');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033403', '2');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033403', '3');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033401', '5');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033402', '5');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033403', '5');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033401', '6');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033402', '6');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033403', '6');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033401', '8');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033402', '8');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033403', '8');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033401', '9');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033402', '9');
INSERT INTO `CZ_Class_Course` (`Clsno`, `Cno`) VALUES ('033403', '9');
COMMIT;

-- ----------------------------
-- Table structure for CZ_Courses
-- ----------------------------
DROP TABLE IF EXISTS `CZ_Courses`;
CREATE TABLE `CZ_Courses` (
  `Cno` char(10) NOT NULL,
  `Cname` char(20) DEFAULT NULL,
  `Cterm` char(20) DEFAULT NULL,
  `Cduration` int DEFAULT NULL,
  `Casmtd` char(10) DEFAULT NULL,
  `Ccredits` float DEFAULT NULL,
  `Tname` char(10) DEFAULT NULL,
  PRIMARY KEY (`Cno`),
  UNIQUE KEY `Cour_Cno` (`Cno`),
  CONSTRAINT `cz_courses_chk_1` CHECK ((`Cduration` > 0)),
  CONSTRAINT `cz_courses_chk_2` CHECK ((`Ccredits` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of CZ_Courses
-- ----------------------------
BEGIN;
INSERT INTO `CZ_Courses` (`Cno`, `Cname`, `Cterm`, `Cduration`, `Casmtd`, `Ccredits`, `Tname`) VALUES ('1', '数据结构', '2022上', 64, '考试', 4, '蒋莉');
INSERT INTO `CZ_Courses` (`Cno`, `Cname`, `Cterm`, `Cduration`, `Casmtd`, `Ccredits`, `Tname`) VALUES ('10', '大学英语', '2021上', 64, '考试', 4, '王吉民');
INSERT INTO `CZ_Courses` (`Cno`, `Cname`, `Cterm`, `Cduration`, `Casmtd`, `Ccredits`, `Tname`) VALUES ('11', '高等数学II', '2021下', 96, '考试', 6, '练晓鹏');
INSERT INTO `CZ_Courses` (`Cno`, `Cname`, `Cterm`, `Cduration`, `Casmtd`, `Ccredits`, `Tname`) VALUES ('12', '面向对象java编程', '2021下', 64, '考试', 4, '丁维龙');
INSERT INTO `CZ_Courses` (`Cno`, `Cname`, `Cterm`, `Cduration`, `Casmtd`, `Ccredits`, `Tname`) VALUES ('13', '面向对象java编程', '2021下', 64, '考试', 4, '徐利锋');
INSERT INTO `CZ_Courses` (`Cno`, `Cname`, `Cterm`, `Cduration`, `Casmtd`, `Ccredits`, `Tname`) VALUES ('2', '面向对象程序设计I', '2021下', 64, '考试', 4, '吕慧强');
INSERT INTO `CZ_Courses` (`Cno`, `Cname`, `Cterm`, `Cduration`, `Casmtd`, `Ccredits`, `Tname`) VALUES ('20', '数据库原理与技术', '2022下', 64, '考试', 64, '张元鸣');
INSERT INTO `CZ_Courses` (`Cno`, `Cname`, `Cterm`, `Cduration`, `Casmtd`, `Ccredits`, `Tname`) VALUES ('3', '面向对象程序设计II', '2022上', 64, '考试', 4, '姜娓娓');
INSERT INTO `CZ_Courses` (`Cno`, `Cname`, `Cterm`, `Cduration`, `Casmtd`, `Ccredits`, `Tname`) VALUES ('4', '数据结构', '2022上', 64, '考试', 4, '王海霞');
INSERT INTO `CZ_Courses` (`Cno`, `Cname`, `Cterm`, `Cduration`, `Casmtd`, `Ccredits`, `Tname`) VALUES ('5', '概率论与数理统计', '2022上', 48, '考试', 3, '徐敏强');
INSERT INTO `CZ_Courses` (`Cno`, `Cname`, `Cterm`, `Cduration`, `Casmtd`, `Ccredits`, `Tname`) VALUES ('6', '离散数学', '2022上', 64, '考试', 4, '张敏霞');
INSERT INTO `CZ_Courses` (`Cno`, `Cname`, `Cterm`, `Cduration`, `Casmtd`, `Ccredits`, `Tname`) VALUES ('7', 'html和php编写', '2022上', 64, '考察', 4, '周艳波');
INSERT INTO `CZ_Courses` (`Cno`, `Cname`, `Cterm`, `Cduration`, `Casmtd`, `Ccredits`, `Tname`) VALUES ('8', '高等数学I', '2021上', 80, '考试', 5, '陆建芳');
INSERT INTO `CZ_Courses` (`Cno`, `Cname`, `Cterm`, `Cduration`, `Casmtd`, `Ccredits`, `Tname`) VALUES ('9', '程序设计基础C', '2021上', 64, '考试', 4, '陈久军');
COMMIT;

-- ----------------------------
-- Table structure for CZ_Major
-- ----------------------------
DROP TABLE IF EXISTS `CZ_Major`;
CREATE TABLE `CZ_Major` (
  `Mno` char(10) NOT NULL,
  `Mname` char(20) DEFAULT NULL,
  PRIMARY KEY (`Mno`),
  UNIQUE KEY `Majo_Mno` (`Mno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of CZ_Major
-- ----------------------------
BEGIN;
INSERT INTO `CZ_Major` (`Mno`, `Mname`) VALUES ('0331', '软件工程');
INSERT INTO `CZ_Major` (`Mno`, `Mname`) VALUES ('0334', '软件工程（中外合办）');
COMMIT;

-- ----------------------------
-- Table structure for CZ_Reports
-- ----------------------------
DROP TABLE IF EXISTS `CZ_Reports`;
CREATE TABLE `CZ_Reports` (
  `Sno` char(20) NOT NULL,
  `Cno` char(20) NOT NULL,
  `term` char(10) DEFAULT NULL,
  `score` int DEFAULT NULL,
  `Tname` char(20) DEFAULT NULL,
  PRIMARY KEY (`Sno`,`Cno`),
  UNIQUE KEY `Cno_Sno` (`Sno`,`Cno`),
  KEY `fk_cno` (`Cno`),
  CONSTRAINT `fk_cno` FOREIGN KEY (`Cno`) REFERENCES `CZ_Courses` (`Cno`),
  CONSTRAINT `fk_sno` FOREIGN KEY (`Sno`) REFERENCES `CZ_Students` (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of CZ_Reports
-- ----------------------------
BEGIN;
INSERT INTO `CZ_Reports` (`Sno`, `Cno`, `term`, `score`, `Tname`) VALUES ('202103340118', '7', '2022上', 95, '周艳波');
INSERT INTO `CZ_Reports` (`Sno`, `Cno`, `term`, `score`, `Tname`) VALUES ('202103340306', '1', '2022上', 95, '蒋莉');
INSERT INTO `CZ_Reports` (`Sno`, `Cno`, `term`, `score`, `Tname`) VALUES ('202103340306', '10', '2021上', 70, '王吉民');
INSERT INTO `CZ_Reports` (`Sno`, `Cno`, `term`, `score`, `Tname`) VALUES ('202103340306', '11', '2021下', 80, '练晓鹏');
INSERT INTO `CZ_Reports` (`Sno`, `Cno`, `term`, `score`, `Tname`) VALUES ('202103340306', '12', '2021下', 89, '丁维龙');
INSERT INTO `CZ_Reports` (`Sno`, `Cno`, `term`, `score`, `Tname`) VALUES ('202103340306', '2', '2021下', 96, '吕慧强');
INSERT INTO `CZ_Reports` (`Sno`, `Cno`, `term`, `score`, `Tname`) VALUES ('202103340306', '3', '2022上', 79, '姜娓娓');
INSERT INTO `CZ_Reports` (`Sno`, `Cno`, `term`, `score`, `Tname`) VALUES ('202103340306', '5', '2022上', 86, '徐敏强');
INSERT INTO `CZ_Reports` (`Sno`, `Cno`, `term`, `score`, `Tname`) VALUES ('202103340306', '6', '2022上', 88, '张敏霞');
INSERT INTO `CZ_Reports` (`Sno`, `Cno`, `term`, `score`, `Tname`) VALUES ('202103340306', '7', '2022上', 95, '周艳波');
INSERT INTO `CZ_Reports` (`Sno`, `Cno`, `term`, `score`, `Tname`) VALUES ('202103340306', '8', '2021上', 93, '陆建芳');
INSERT INTO `CZ_Reports` (`Sno`, `Cno`, `term`, `score`, `Tname`) VALUES ('202103340306', '9', '2021上', 93, '陈久军');
INSERT INTO `CZ_Reports` (`Sno`, `Cno`, `term`, `score`, `Tname`) VALUES ('202103340308', '2', '2021下', 91, '吕慧强');
INSERT INTO `CZ_Reports` (`Sno`, `Cno`, `term`, `score`, `Tname`) VALUES ('202103340308', '4', '2022上', 85, '王海霞');
COMMIT;

-- ----------------------------
-- Table structure for CZ_Student_account
-- ----------------------------
DROP TABLE IF EXISTS `CZ_Student_account`;
CREATE TABLE `CZ_Student_account` (
  `Sno` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Spwd` char(20) NOT NULL,
  PRIMARY KEY (`Sno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of CZ_Student_account
-- ----------------------------
BEGIN;
INSERT INTO `CZ_Student_account` (`Sno`, `Spwd`) VALUES ('202103340118', '340118');
INSERT INTO `CZ_Student_account` (`Sno`, `Spwd`) VALUES ('202103340306', '131313');
INSERT INTO `CZ_Student_account` (`Sno`, `Spwd`) VALUES ('202103340308', '340308');
INSERT INTO `CZ_Student_account` (`Sno`, `Spwd`) VALUES ('202103340309', '340309');
COMMIT;

-- ----------------------------
-- Table structure for CZ_Students
-- ----------------------------
DROP TABLE IF EXISTS `CZ_Students`;
CREATE TABLE `CZ_Students` (
  `Sno` char(20) NOT NULL,
  `Sname` char(20) NOT NULL,
  `Ssex` char(2) DEFAULT NULL,
  `Sage` int DEFAULT NULL,
  `Sarea` char(20) DEFAULT NULL,
  `Scredits` int DEFAULT NULL,
  `Clsno` char(20) DEFAULT NULL,
  PRIMARY KEY (`Sno`),
  UNIQUE KEY `CLno_Sno` (`Sno`,`Clsno`),
  KEY `Class_Student` (`Clsno`),
  CONSTRAINT `Class_Student` FOREIGN KEY (`Clsno`) REFERENCES `CZ_Class` (`Clsno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of CZ_Students
-- ----------------------------
BEGIN;
INSERT INTO `CZ_Students` (`Sno`, `Sname`, `Ssex`, `Sage`, `Sarea`, `Scredits`, `Clsno`) VALUES ('202103340118', '吴越锴', '男', 20, '浙江杭州', 4, '033401');
INSERT INTO `CZ_Students` (`Sno`, `Sname`, `Ssex`, `Sage`, `Sarea`, `Scredits`, `Clsno`) VALUES ('202103340306', '陈正', '男', 20, '浙江温州', 46, '033403');
INSERT INTO `CZ_Students` (`Sno`, `Sname`, `Ssex`, `Sage`, `Sarea`, `Scredits`, `Clsno`) VALUES ('202103340308', '戴楷轩', '男', 20, '浙江台州', 8, '033403');
INSERT INTO `CZ_Students` (`Sno`, `Sname`, `Ssex`, `Sage`, `Sarea`, `Scredits`, `Clsno`) VALUES ('202103340309', '邓永熙', '男', 20, '湖南长沙', 0, '033403');
COMMIT;

-- ----------------------------
-- Table structure for CZ_Teacher_account
-- ----------------------------
DROP TABLE IF EXISTS `CZ_Teacher_account`;
CREATE TABLE `CZ_Teacher_account` (
  `Tno` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Tpwd` char(20) NOT NULL,
  PRIMARY KEY (`Tno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of CZ_Teacher_account
-- ----------------------------
BEGIN;
INSERT INTO `CZ_Teacher_account` (`Tno`, `Tpwd`) VALUES ('1', '1');
INSERT INTO `CZ_Teacher_account` (`Tno`, `Tpwd`) VALUES ('1000000', '000000');
INSERT INTO `CZ_Teacher_account` (`Tno`, `Tpwd`) VALUES ('1000001', 'lvhuiqiang');
INSERT INTO `CZ_Teacher_account` (`Tno`, `Tpwd`) VALUES ('1000002', '000002');
INSERT INTO `CZ_Teacher_account` (`Tno`, `Tpwd`) VALUES ('1000003', '000003');
INSERT INTO `CZ_Teacher_account` (`Tno`, `Tpwd`) VALUES ('1000004', '000004');
INSERT INTO `CZ_Teacher_account` (`Tno`, `Tpwd`) VALUES ('1000005', '000005');
INSERT INTO `CZ_Teacher_account` (`Tno`, `Tpwd`) VALUES ('1000006', '000006');
INSERT INTO `CZ_Teacher_account` (`Tno`, `Tpwd`) VALUES ('1000007', '000007');
INSERT INTO `CZ_Teacher_account` (`Tno`, `Tpwd`) VALUES ('1000008', '000008');
INSERT INTO `CZ_Teacher_account` (`Tno`, `Tpwd`) VALUES ('1000009', '000009');
INSERT INTO `CZ_Teacher_account` (`Tno`, `Tpwd`) VALUES ('1000010', '000010');
INSERT INTO `CZ_Teacher_account` (`Tno`, `Tpwd`) VALUES ('1000011', '000011');
INSERT INTO `CZ_Teacher_account` (`Tno`, `Tpwd`) VALUES ('1000012', '000012');
INSERT INTO `CZ_Teacher_account` (`Tno`, `Tpwd`) VALUES ('1000020', '000020');
COMMIT;

-- ----------------------------
-- Table structure for CZ_Teacher_Class
-- ----------------------------
DROP TABLE IF EXISTS `CZ_Teacher_Class`;
CREATE TABLE `CZ_Teacher_Class` (
  `Tno` char(20) NOT NULL,
  `Clsno` char(20) NOT NULL,
  PRIMARY KEY (`Tno`,`Clsno`),
  KEY `tea_cls` (`Clsno`),
  CONSTRAINT `tea_cls` FOREIGN KEY (`Clsno`) REFERENCES `CZ_Class` (`Clsno`),
  CONSTRAINT `teacher_class` FOREIGN KEY (`Tno`) REFERENCES `CZ_Teachers` (`Tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of CZ_Teacher_Class
-- ----------------------------
BEGIN;
INSERT INTO `CZ_Teacher_Class` (`Tno`, `Clsno`) VALUES ('1000001', '033401');
INSERT INTO `CZ_Teacher_Class` (`Tno`, `Clsno`) VALUES ('1000002', '033401');
INSERT INTO `CZ_Teacher_Class` (`Tno`, `Clsno`) VALUES ('1000001', '033402');
INSERT INTO `CZ_Teacher_Class` (`Tno`, `Clsno`) VALUES ('1000002', '033402');
INSERT INTO `CZ_Teacher_Class` (`Tno`, `Clsno`) VALUES ('1000000', '033403');
INSERT INTO `CZ_Teacher_Class` (`Tno`, `Clsno`) VALUES ('1000001', '033403');
INSERT INTO `CZ_Teacher_Class` (`Tno`, `Clsno`) VALUES ('1000002', '033403');
COMMIT;

-- ----------------------------
-- Table structure for CZ_Teacher_course
-- ----------------------------
DROP TABLE IF EXISTS `CZ_Teacher_course`;
CREATE TABLE `CZ_Teacher_course` (
  `Tno` char(20) NOT NULL,
  `Cno` char(20) NOT NULL,
  PRIMARY KEY (`Tno`,`Cno`),
  KEY `tea_cor` (`Cno`),
  CONSTRAINT `tea_cor` FOREIGN KEY (`Cno`) REFERENCES `CZ_Courses` (`Cno`),
  CONSTRAINT `teacher_course` FOREIGN KEY (`Tno`) REFERENCES `CZ_Teachers` (`Tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of CZ_Teacher_course
-- ----------------------------
BEGIN;
INSERT INTO `CZ_Teacher_course` (`Tno`, `Cno`) VALUES ('1000000', '1');
INSERT INTO `CZ_Teacher_course` (`Tno`, `Cno`) VALUES ('1000009', '10');
INSERT INTO `CZ_Teacher_course` (`Tno`, `Cno`) VALUES ('1000010', '11');
INSERT INTO `CZ_Teacher_course` (`Tno`, `Cno`) VALUES ('1000011', '12');
INSERT INTO `CZ_Teacher_course` (`Tno`, `Cno`) VALUES ('1000012', '13');
INSERT INTO `CZ_Teacher_course` (`Tno`, `Cno`) VALUES ('1000001', '2');
INSERT INTO `CZ_Teacher_course` (`Tno`, `Cno`) VALUES ('1000004', '3');
INSERT INTO `CZ_Teacher_course` (`Tno`, `Cno`) VALUES ('1000005', '4');
INSERT INTO `CZ_Teacher_course` (`Tno`, `Cno`) VALUES ('1000002', '5');
INSERT INTO `CZ_Teacher_course` (`Tno`, `Cno`) VALUES ('1000003', '6');
INSERT INTO `CZ_Teacher_course` (`Tno`, `Cno`) VALUES ('1000006', '7');
INSERT INTO `CZ_Teacher_course` (`Tno`, `Cno`) VALUES ('1000007', '8');
INSERT INTO `CZ_Teacher_course` (`Tno`, `Cno`) VALUES ('1000008', '9');
COMMIT;

-- ----------------------------
-- Table structure for CZ_Teachers
-- ----------------------------
DROP TABLE IF EXISTS `CZ_Teachers`;
CREATE TABLE `CZ_Teachers` (
  `Tno` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Tname` char(10) DEFAULT NULL,
  `Tsex` char(5) DEFAULT NULL,
  `Tage` int DEFAULT NULL,
  `Tjobtitle` char(10) DEFAULT NULL,
  `Tphone` char(20) DEFAULT NULL,
  PRIMARY KEY (`Tno`),
  UNIQUE KEY `Tea_Tno` (`Tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of CZ_Teachers
-- ----------------------------
BEGIN;
INSERT INTO `CZ_Teachers` (`Tno`, `Tname`, `Tsex`, `Tage`, `Tjobtitle`, `Tphone`) VALUES ('1000000', '蒋莉', '女', 38, '讲师', '13777777777');
INSERT INTO `CZ_Teachers` (`Tno`, `Tname`, `Tsex`, `Tage`, `Tjobtitle`, `Tphone`) VALUES ('1000001', '吕慧强', '男', 50, '讲师', '15166668888');
INSERT INTO `CZ_Teachers` (`Tno`, `Tname`, `Tsex`, `Tage`, `Tjobtitle`, `Tphone`) VALUES ('1000002', '徐敏强', '男', 30, '讲师', '13888888888');
INSERT INTO `CZ_Teachers` (`Tno`, `Tname`, `Tsex`, `Tage`, `Tjobtitle`, `Tphone`) VALUES ('1000003', '张敏霞', '女', 55, '讲师', '13556788765');
INSERT INTO `CZ_Teachers` (`Tno`, `Tname`, `Tsex`, `Tage`, `Tjobtitle`, `Tphone`) VALUES ('1000004', '姜娓娓', '女', 38, '副教授', '13787655678');
INSERT INTO `CZ_Teachers` (`Tno`, `Tname`, `Tsex`, `Tage`, `Tjobtitle`, `Tphone`) VALUES ('1000005', '王海霞', '女', 39, '副教授', '13767899876');
INSERT INTO `CZ_Teachers` (`Tno`, `Tname`, `Tsex`, `Tage`, `Tjobtitle`, `Tphone`) VALUES ('1000006', '周艳波', '女', 37, '讲师', '13667899876');
INSERT INTO `CZ_Teachers` (`Tno`, `Tname`, `Tsex`, `Tage`, `Tjobtitle`, `Tphone`) VALUES ('1000007', '陆建芳', '女', 55, '副教授', '13766667777');
INSERT INTO `CZ_Teachers` (`Tno`, `Tname`, `Tsex`, `Tage`, `Tjobtitle`, `Tphone`) VALUES ('1000008', '陈久军', '男', 45, '副教授', '13888886666');
INSERT INTO `CZ_Teachers` (`Tno`, `Tname`, `Tsex`, `Tage`, `Tjobtitle`, `Tphone`) VALUES ('1000009', '王吉民', '男', 58, '副教授', '13656567878');
INSERT INTO `CZ_Teachers` (`Tno`, `Tname`, `Tsex`, `Tage`, `Tjobtitle`, `Tphone`) VALUES ('1000010', '练晓鹏', '男', 45, '讲师', '13787879090');
INSERT INTO `CZ_Teachers` (`Tno`, `Tname`, `Tsex`, `Tage`, `Tjobtitle`, `Tphone`) VALUES ('1000011', '丁维龙', '男', 52, '副教授', '13678786767');
INSERT INTO `CZ_Teachers` (`Tno`, `Tname`, `Tsex`, `Tage`, `Tjobtitle`, `Tphone`) VALUES ('1000012', '徐利锋', '男', 47, '讲师', '13978789090');
INSERT INTO `CZ_Teachers` (`Tno`, `Tname`, `Tsex`, `Tage`, `Tjobtitle`, `Tphone`) VALUES ('1000020', '张元鸣', '男', 44, '副教授', '18888888888');
COMMIT;

-- ----------------------------
-- View structure for 学生成绩统计
-- ----------------------------
DROP VIEW IF EXISTS `学生成绩统计`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `学生成绩统计` AS select `cz_students`.`Sno` AS `Sno`,`cz_students`.`Sname` AS `Sname`,`cz_courses`.`Cname` AS `Cname`,`cz_class`.`Clsname` AS `Clsname`,`cz_reports`.`Tname` AS `Tname`,`cz_courses`.`Ccredits` AS `Ccredits`,`cz_courses`.`Cterm` AS `Cterm`,`cz_reports`.`score` AS `score` from (((`cz_reports` join `cz_students`) join `cz_courses`) join `cz_class`) where ((`cz_students`.`Sno` = `cz_reports`.`Sno`) and (`cz_reports`.`Cno` = `cz_courses`.`Cno`) and (`cz_class`.`Clsno` = `cz_students`.`Clsno`));

-- ----------------------------
-- View structure for 教师课程成绩
-- ----------------------------
DROP VIEW IF EXISTS `教师课程成绩`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `教师课程成绩` AS select `cz_teachers`.`Tno` AS `Tno`,`cz_teachers`.`Tname` AS `Tname`,`cz_reports`.`Cno` AS `Cno`,`cz_reports`.`Sno` AS `Sno`,`cz_reports`.`score` AS `score` from (`cz_teachers` join `cz_reports`) where (`cz_teachers`.`Tname` = `cz_reports`.`Tname`);

-- ----------------------------
-- View structure for 教师课表
-- ----------------------------
DROP VIEW IF EXISTS `教师课表`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `教师课表` AS select `cz_teachers`.`Tno` AS `Tno`,`cz_teachers`.`Tname` AS `Tname`,`cz_courses`.`Cno` AS `Cno`,`cz_courses`.`Cname` AS `Cname`,`cz_courses`.`Ccredits` AS `Ccredits`,`cz_courses`.`Cduration` AS `Cduration` from (`cz_teachers` join `cz_courses`) where (`cz_teachers`.`Tname` = `cz_courses`.`Tname`);

-- ----------------------------
-- View structure for 班级课表
-- ----------------------------
DROP VIEW IF EXISTS `班级课表`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `班级课表` AS select `cz_class`.`Clsno` AS `clsno`,`cz_class`.`Clsname` AS `Clsname`,`cz_courses`.`Cno` AS `Cno`,`cz_courses`.`Cname` AS `Cname`,`cz_courses`.`Cterm` AS `Cterm`,`cz_courses`.`Ccredits` AS `Ccredits`,`cz_courses`.`Cduration` AS `Cduration` from ((`cz_class` join `cz_courses`) join `cz_class_course`) where ((`cz_class`.`Clsno` = `cz_class_course`.`Clsno`) and (`cz_class_course`.`Cno` = `cz_courses`.`Cno`));

-- ----------------------------
-- View structure for 课程和学分统计
-- ----------------------------
DROP VIEW IF EXISTS `课程和学分统计`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `课程和学分统计` AS select `学生成绩统计`.`Sno` AS `Sno`,`学生成绩统计`.`Cname` AS `Cname`,`学生成绩统计`.`Ccredits` AS `Ccredits` from `学生成绩统计`;

-- ----------------------------
-- View structure for 课程平均成绩
-- ----------------------------
DROP VIEW IF EXISTS `课程平均成绩`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `课程平均成绩` AS select `cz_reports`.`Cno` AS `Cno`,avg(`cz_reports`.`score`) AS `平均分` from `cz_reports` group by `cz_reports`.`Cno`;

-- ----------------------------
-- Procedure structure for InsertTeacherCourse
-- ----------------------------
DROP PROCEDURE IF EXISTS `InsertTeacherCourse`;
delimiter ;;
CREATE PROCEDURE `InsertTeacherCourse`()
BEGIN
  INSERT INTO CZ_Teacher_course (Tno, Cno)
  SELECT CZ_Teachers.Tno, CZ_Courses.Cno
  FROM CZ_Courses
  JOIN CZ_Teachers ON CZ_Courses.Tname = CZ_Teachers.Tname
  LEFT JOIN CZ_Teacher_course ON CZ_Courses.Cno = CZ_Teacher_course.Cno AND CZ_Teachers.Tno = CZ_Teacher_course.Tno
  WHERE CZ_Teacher_course.Cno IS NULL;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for pro_插入新学生
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_插入新学生`;
delimiter ;;
CREATE PROCEDURE `pro_插入新学生`(IN sno CHAR(20),
    IN sname CHAR(20),
    IN ssex CHAR(5),
    IN sage INT,
    IN sarea CHAR(20),
    IN scredits INT,
    IN clsno CHAR(20))
BEGIN
    INSERT INTO CZ_Students(Sno, Sname, Ssex, Sage, Sarea, Scredits, Clsno)
    VALUES (sno, sname, ssex, sage, sarea, scredits, clsno);
    
    SELECT * FROM CZ_Students;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table CZ_Reports
-- ----------------------------
DROP TRIGGER IF EXISTS `学分统计`;
delimiter ;;
CREATE TRIGGER `学分统计` AFTER INSERT ON `CZ_Reports` FOR EACH ROW BEGIN
    UPDATE CZ_Students
    SET Scredits = (
        SELECT SUM(Ccredits)
        FROM CZ_Courses
        WHERE Cno IN (
            SELECT Cno
            FROM CZ_Reports
            WHERE score >= 60 
            AND CZ_Reports.Sno = NEW.Sno
        )
    )
    WHERE CZ_Students.Sno = NEW.Sno;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table CZ_Students
-- ----------------------------
DROP TRIGGER IF EXISTS `学生删除`;
delimiter ;;
CREATE TRIGGER `学生删除` BEFORE DELETE ON `CZ_Students` FOR EACH ROW BEGIN
	DELETE FROM CZ_Reports WHERE Sno = OLD.Sno;
	DELETE FROM CZ_Student_account WHERE Sno = OLD.Sno;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table CZ_Students
-- ----------------------------
DROP TRIGGER IF EXISTS `插入学生自动注册用户`;
delimiter ;;
CREATE TRIGGER `插入学生自动注册用户` AFTER INSERT ON `CZ_Students` FOR EACH ROW BEGIN
   DECLARE sno CHAR(20);
   DECLARE pwd CHAR(6);
   SELECT NEW.Sno INTO sno;
   SET pwd = RIGHT(sno, 6);
   INSERT INTO CZ_Student_account
   VALUES (sno, pwd);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table CZ_Teachers
-- ----------------------------
DROP TRIGGER IF EXISTS `教师删除`;
delimiter ;;
CREATE TRIGGER `教师删除` BEFORE DELETE ON `CZ_Teachers` FOR EACH ROW BEGIN
	DELETE FROM CZ_Teacher_Class WHERE Tno = OLD.Tno;
	DELETE FROM CZ_Teacher_course WHERE Tno = OLD.Tno;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table CZ_Teachers
-- ----------------------------
DROP TRIGGER IF EXISTS `教师更新`;
delimiter ;;
CREATE TRIGGER `教师更新` AFTER UPDATE ON `CZ_Teachers` FOR EACH ROW BEGIN
   IF NEW.Tno <> OLD.Tno THEN
      UPDATE CZ_Teacher_course
      SET Tno18 = NEW.Tno
      WHERE Tno = OLD.Tno;
			UPDATE CZ_Teacher_Class
			SET Tno18 = NEW.Tno
			WHERE Tno = OLD.Tno;
	 END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table CZ_Teachers
-- ----------------------------
DROP TRIGGER IF EXISTS `插入教师自动注册用户`;
delimiter ;;
CREATE TRIGGER `插入教师自动注册用户` AFTER INSERT ON `CZ_Teachers` FOR EACH ROW BEGIN
   DECLARE Tno CHAR(20);
   DECLARE pwd CHAR(6);
   SELECT NEW.Tno INTO Tno;
   SET pwd = RIGHT(Tno, 6);
   INSERT INTO CZ_Teacher_account
   VALUES (Tno, pwd);
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
