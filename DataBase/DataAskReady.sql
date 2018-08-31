-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for ask
CREATE DATABASE IF NOT EXISTS `ask` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ask`;

-- Dumping structure for table ask.amphur
CREATE TABLE IF NOT EXISTS `amphur` (
  `AMPHUR_ID` int(5) NOT NULL AUTO_INCREMENT,
  `AMPHUR_CODE` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `AMPHUR_NAME` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `POSTCODE` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `GEO_ID` int(5) NOT NULL DEFAULT '0',
  `PROVINCE_ID` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`AMPHUR_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=999 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางอำเภอ';

-- Data exporting was unselected.
-- Dumping structure for table ask.department
CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(3) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) DEFAULT NULL,
  `department_code` varchar(10) DEFAULT NULL,
  `faculty_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='ตารางภาควิชา';

-- Data exporting was unselected.
-- Dumping structure for table ask.district
CREATE TABLE IF NOT EXISTS `district` (
  `DISTRICT_ID` int(5) NOT NULL AUTO_INCREMENT,
  `DISTRICT_CODE` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `DISTRICT_NAME` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `AMPHUR_ID` int(5) NOT NULL DEFAULT '0',
  `PROVINCE_ID` int(5) NOT NULL DEFAULT '0',
  `GEO_ID` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DISTRICT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8861 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางตำบล';

-- Data exporting was unselected.
-- Dumping structure for table ask.expense_estimate
CREATE TABLE IF NOT EXISTS `expense_estimate` (
  `personnel_id` int(11) DEFAULT NULL,
  `permission_id` int(10) DEFAULT NULL COMMENT 'รหัส ใบขออนุญาต',
  `allowence` int(11) DEFAULT NULL COMMENT 'ค่าเบี้ยเลี้ยง',
  `allowence_perday` int(11) DEFAULT NULL COMMENT 'ค่าเบี้ยเลี้ยง/วัน',
  `allowence_sum` int(11) DEFAULT NULL COMMENT 'รวมค่าเบี้ยเลี้ยง',
  `rent_date` int(11) DEFAULT NULL COMMENT 'ค่าที่พัก',
  `rent_date_perday` int(11) DEFAULT NULL COMMENT 'ค่าที่พัก/วัน',
  `rent_date_sum` int(11) DEFAULT NULL COMMENT 'รวมค่าเช่าที่พัก',
  `travel_sum` int(11) DEFAULT NULL COMMENT 'รวมค่าพาหนะ',
  `other_sum` int(11) DEFAULT NULL COMMENT 'รวมค่าอื่นๆ',
  `expense_estimate_sum` int(11) DEFAULT NULL COMMENT 'รวมค่าใช้จ่าย ทั้งหมด',
  `create_date` timestamp NULL DEFAULT NULL,
  KEY `permission_id` (`permission_id`),
  KEY `create_by` (`personnel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ตาราง ประมาณการรายจ่าย';

-- Data exporting was unselected.
-- Dumping structure for table ask.expense_sumary
CREATE TABLE IF NOT EXISTS `expense_sumary` (
  `permission_id` int(11) DEFAULT NULL,
  `user_sum_total` varchar(50) DEFAULT NULL,
  `allowence_perday_total` varchar(50) DEFAULT NULL,
  `allowence_sum_total` varchar(50) DEFAULT NULL COMMENT 'รวมค่าเบี้ยเลี้ยง',
  `rent_date_perday_total` varchar(50) DEFAULT NULL,
  `rent_date_sum_total` varchar(50) DEFAULT NULL COMMENT 'รวมค่าที่พัก',
  `travel_sum_total` varchar(50) DEFAULT NULL COMMENT 'รวมค่าพาหนะ',
  `other_sum_total` varchar(50) DEFAULT NULL COMMENT 'รวมค่าอื่นๆ',
  `expense_estimate_sum_total` varchar(50) DEFAULT NULL COMMENT 'รวมค่าประมาณการทั้งหมด',
  `allowence_details` varchar(50) DEFAULT NULL,
  `rent_date_details` varchar(50) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  KEY `permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='สรูปค่าใช้จ่าย';

-- Data exporting was unselected.
-- Dumping structure for table ask.faculty
CREATE TABLE IF NOT EXISTS `faculty` (
  `faculty_id` int(2) NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(50) DEFAULT NULL,
  `faculty_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`faculty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='ตารางคณะ';

-- Data exporting was unselected.
-- Dumping structure for table ask.permission
CREATE TABLE IF NOT EXISTS `permission` (
  `permission_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'รหัสใบขออนุญาต',
  `personnel_id` int(11) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL COMMENT 'ตำบล',
  `purpose` varchar(50) NOT NULL COMMENT 'วัตถุประสงค์ ไปราชการ',
  `purpose1` varchar(50) NOT NULL COMMENT 'วัตถุประสงค์ ได้รับคำสั่ง',
  `purpose2` varchar(50) NOT NULL COMMENT 'วัตถุประสงค์ ขอนุญาต',
  `topics` varchar(50) NOT NULL COMMENT 'เรื่องที่ไปราชการ',
  `status` varchar(50) NOT NULL COMMENT 'ขอไปราชการในฐานะ',
  `object` text COMMENT 'วัตถุประสงค์ที่ไป',
  `destination_name` varchar(50) DEFAULT NULL COMMENT 'ชื่อสถานที่ไปราชการ',
  `go_date` date DEFAULT NULL COMMENT 'วัน  ไปราชการ',
  `go_time` varchar(50) DEFAULT NULL COMMENT 'เวลา ไปราชการ',
  `back_date` date DEFAULT NULL COMMENT 'วัน กลับราชการ',
  `back_time` char(50) DEFAULT NULL COMMENT 'เวลา กลับราชการ',
  `budget` varchar(50) DEFAULT NULL COMMENT 'งบประมาณ',
  `budget_expenses` varchar(50) DEFAULT NULL COMMENT 'เบิกค่าใช้จ่ายโดย',
  `budget_by` varchar(50) DEFAULT NULL COMMENT 'ใช้งบประมาณ',
  `budget_project` varchar(50) DEFAULT NULL COMMENT 'โครงการ',
  `budget_pass` varchar(50) DEFAULT NULL COMMENT 'รหัสโครงการ',
  `travel` varchar(50) DEFAULT NULL COMMENT 'การเดินทาง',
  `travel_idcard` varchar(50) DEFAULT NULL COMMENT 'หมายเลขทะเบียน',
  `commit_a` varchar(50) DEFAULT NULL COMMENT 'งานภาคปกติ',
  `commit_a_dt` varchar(50) DEFAULT NULL COMMENT 'งานภาคปกติ มอบหมาย',
  `commit_b` varchar(50) DEFAULT NULL COMMENT 'งานภาค กศ.บป',
  `commit_b_dt` varchar(50) DEFAULT NULL COMMENT 'งานภาค กศ.บป มอบหมาย',
  `commit_c` varchar(50) DEFAULT NULL COMMENT 'งานเวรประจำวัน',
  `commit_c_dt` varchar(50) DEFAULT NULL COMMENT 'งานเวรประจำวัน มอบหมาย',
  `commit_d` varchar(50) DEFAULT NULL COMMENT 'งานอื่นๆ',
  `other` varchar(50) DEFAULT NULL COMMENT 'อื่นๆ',
  `commit_d_dt` varchar(50) DEFAULT NULL COMMENT 'งานอื่นๆ มอบหมาย',
  `create_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `personnel_id` (`personnel_id`),
  KEY `district` (`district`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='ตารางแบบฟอร์ม การขออนุญาตไปราชการ';

-- Data exporting was unselected.
-- Dumping structure for table ask.personnel_list
CREATE TABLE IF NOT EXISTS `personnel_list` (
  `personnel_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT 'รหัส user',
  `department_code` varchar(10) DEFAULT NULL COMMENT 'รหัส สังกัด',
  `sub_position_code` varchar(10) DEFAULT NULL COMMENT 'รหัส ระดับ',
  `create_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`personnel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table ask.position
CREATE TABLE IF NOT EXISTS `position` (
  `position_id` int(2) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(50) DEFAULT NULL,
  `position_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='ทดลอง ตำแหน่ง';

-- Data exporting was unselected.
-- Dumping structure for table ask.province
CREATE TABLE IF NOT EXISTS `province` (
  `PROVINCE_ID` int(5) NOT NULL AUTO_INCREMENT,
  `PROVINCE_CODE` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `PROVINCE_NAME` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `GEO_ID` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PROVINCE_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ตารางจังหวัด';

-- Data exporting was unselected.
-- Dumping structure for table ask.sub_position
CREATE TABLE IF NOT EXISTS `sub_position` (
  `sub_position_id` int(2) NOT NULL AUTO_INCREMENT,
  `sub_position_name` varchar(50) DEFAULT NULL,
  `sub_position_code` varchar(50) DEFAULT NULL,
  `position_code` varchar(10) DEFAULT NULL,
  `allowence` int(11) DEFAULT NULL COMMENT 'ค่าเบี้ยเลี้ยง',
  `rent_date` int(11) DEFAULT NULL COMMENT 'ค่าที่พัก',
  PRIMARY KEY (`sub_position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='ตารางตำแหน่งย่อย';

-- Data exporting was unselected.
-- Dumping structure for table ask.travel
CREATE TABLE IF NOT EXISTS `travel` (
  `travel_id` int(4) NOT NULL COMMENT 'vehicle',
  `vehicle_name` varchar(25) DEFAULT NULL COMMENT 'vehicle name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ชื่อพาหนะ';

-- Data exporting was unselected.
-- Dumping structure for table ask.travel_expenses
CREATE TABLE IF NOT EXISTS `travel_expenses` (
  `permission_id` int(11) DEFAULT NULL COMMENT 'รหัสใบขออนุญาตไปราชการ',
  `travel_id` int(5) NOT NULL COMMENT 'รหัส',
  `number_per` int(4) NOT NULL COMMENT 'จำนวน/เที่ยว',
  `travel_expenses` int(8) NOT NULL COMMENT 'ค่าพาหนะ 1 เที่ยว',
  `user_sum` int(8) NOT NULL COMMENT 'บุคคลกรร่วมทั้งหมด',
  `sum` int(11) NOT NULL COMMENT 'รวมค่า พาหนะ',
  `vehicle_c` varchar(100) NOT NULL COMMENT 'หมายเหตุที่ขึ้นพาหนะ',
  `create_date` timestamp NULL DEFAULT NULL COMMENT 'เวลาบันทึก ใบขออนุญาตไปราชการ',
  KEY `travel_id` (`travel_id`),
  KEY `permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ตาราง ประมาณการรายจ่ายการเดินทาง โดยภาหนะ';

-- Data exporting was unselected.
-- Dumping structure for table ask.travel_expenses_fuel_cost
CREATE TABLE IF NOT EXISTS `travel_expenses_fuel_cost` (
  `travel_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL COMMENT 'รหัสใบขออนุญาตไปราชการ',
  `distance` int(11) DEFAULT NULL COMMENT 'ระยะทาง',
  `number_per` int(11) DEFAULT NULL COMMENT 'จำนวน/ต่อ',
  `fuel_cost` int(11) DEFAULT NULL COMMENT 'ค่าเชื้อเพลิง',
  `divide` int(11) DEFAULT NULL COMMENT 'หาร',
  `fuel_cost_sum` int(11) DEFAULT NULL COMMENT 'รวมค่าเชื้อเพลิง',
  `expressway_expenses` int(11) DEFAULT NULL COMMENT 'ค่าทางด่วน',
  `expressway_number_per` int(11) DEFAULT NULL COMMENT 'ค่าทางด่วน จำนวน/ต่อ',
  `expressway_expenses_sum` int(11) DEFAULT NULL COMMENT 'รวมค่าทางด่วน',
  `sum` varchar(50) DEFAULT NULL COMMENT 'รวม',
  `vehicle_c` varchar(50) DEFAULT NULL COMMENT 'หมายเหตุ',
  `create_date` timestamp NULL DEFAULT NULL COMMENT 'เวลาบันทึก ใบขออนุญาตไปราชการ',
  KEY `permission_id` (`permission_id`),
  KEY `travel_id` (`travel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ค่าน้ำมันเชื้อเพลิง';

-- Data exporting was unselected.
-- Dumping structure for table ask.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_username` varchar(50) DEFAULT NULL COMMENT 'IDUser',
  `user_password` varchar(50) DEFAULT NULL COMMENT 'รหัส',
  `sex` varchar(20) DEFAULT NULL COMMENT 'เพศ',
  `user_fname` varchar(50) DEFAULT NULL COMMENT 'ชื่อ',
  `user_lname` varchar(50) DEFAULT NULL COMMENT 'นามสกุล',
  `number_phone` char(10) DEFAULT NULL COMMENT 'เบอร์โทรศัพท์',
  `date` date DEFAULT NULL COMMENT 'วันเข้ารับราชการ',
  `role` int(1) DEFAULT NULL COMMENT 'สิทธิ',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COMMENT='ตารางผู้ใช้ระบบ';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
