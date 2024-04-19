-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2024 at 08:56 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

-- DROP DATABASE tinytots;
CREATE DATABASE tinytots;
USE tinytots;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21952505_tinytots_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `adviser`
--

CREATE TABLE `adviser` (
  `adviser_ID` int(11) NOT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `ps_id` int(11) DEFAULT NULL,
  `school_year` varchar(50) DEFAULT NULL,
  `section` varchar(50) DEFAULT NULL,
  `grade_level` varchar(50) NOT NULL CHECK (`grade_level` in ('Kindergarten 1','Kindergarten 2')),
  `class_sched` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adviser`
--

INSERT INTO `adviser` (`adviser_ID`, `faculty_id`, `ps_id`, `school_year`, `section`, `grade_level`, `class_sched`, `created_at`) VALUES
(1, 1, 1, '2023-2024', 'Rizal', 'Kindergarten 1', '8:00 AM to 11:30 AM', '2024-02-29 08:33:27'),
(2, 2, 1, '2023-2024', 'Bonifacio', 'Kindergarten 1', '12:30 PM to 4:00 PM', '2024-02-29 08:33:27'),
(3, 3, 1, '2023-2024', 'Luna', 'Kindergarten 2', '7:45 AM to 11:30 AM', '2024-02-29 08:33:27'),
(4, 4, 1, '2023-2024', 'Mabini', 'Kindergarten 2', '12:15 PM to 4:00 PM', '2024-02-29 08:33:27'),
(5, 5, 2, '2023-2024', 'Rizal', 'Kindergarten 1', '8:00 AM to 11:30 AM', '2024-02-29 08:33:27'),
(6, 6, 2, '2023-2024', 'Bonifacio', 'Kindergarten 1', '12:30 PM to 4:00 PM', '2024-02-29 08:33:27'),
(7, 7, 2, '2023-2024', 'Luna', 'Kindergarten 2', '7:45 AM to 11:30 AM', '2024-02-29 08:33:27'),
(8, 8, 2, '2023-2024', 'Mabini', 'Kindergarten 2', '12:15 PM to 4:00 PM', '2024-02-29 08:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `month_for_attendance` varchar(50) NOT NULL CHECK (`month_for_attendance` in ('January','February','March ','April','May','June','July','August','September','October','November','December')),
  `number_of_present` int(11) NOT NULL,
  `number_of_absence` int(11) NOT NULL,
  `number_of_scdays` int(11) NOT NULL,
  `adviser_ID` int(11) DEFAULT NULL,
  `SR_ID` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `month_for_attendance`, `number_of_present`, `number_of_absence`, `number_of_scdays`, `adviser_ID`, `SR_ID`, `created_at`) VALUES
(1, 'October', 18, 2, 20, 1, 1, '2024-02-29 08:33:27'),
(2, 'November', 20, 0, 20, 1, 1, '2024-02-29 08:33:27'),
(3, 'December', 19, 1, 20, 1, 1, '2024-02-29 08:33:27'),
(4, 'January', 20, 0, 20, 1, 1, '2024-02-29 08:33:27'),
(5, 'October', 18, 2, 20, 2, 2, '2024-02-29 08:33:27'),
(6, 'November', 20, 0, 20, 2, 2, '2024-02-29 08:33:27'),
(7, 'December', 19, 1, 20, 2, 2, '2024-02-29 08:33:27'),
(8, 'January', 20, 0, 20, 2, 2, '2024-02-29 08:33:27'),
(9, 'October', 18, 2, 20, 1, 3, '2024-02-29 08:33:27'),
(10, 'November', 20, 0, 20, 1, 3, '2024-02-29 08:33:27'),
(11, 'December', 19, 1, 20, 1, 3, '2024-02-29 08:33:27'),
(12, 'January', 20, 0, 20, 1, 3, '2024-02-29 08:33:27'),
(13, 'October', 18, 2, 20, 2, 4, '2024-02-29 08:33:27'),
(14, 'November', 20, 0, 20, 2, 4, '2024-02-29 08:33:27'),
(15, 'December', 19, 1, 20, 2, 4, '2024-02-29 08:33:27'),
(16, 'January', 20, 0, 20, 2, 4, '2024-02-29 08:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `bd_fees_ps`
--

CREATE TABLE `bd_fees_ps` (
  `bdf_id` int(11) NOT NULL,
  `bdf_glevel` varchar(50) NOT NULL CHECK (`bdf_glevel` in ('Kindergarten 1','Kindergarten 2')),
  `fee_desc` varchar(100) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `ps_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bd_fees_ps`
--

INSERT INTO `bd_fees_ps` (`bdf_id`, `bdf_glevel`, `fee_desc`, `amount`, `ps_id`) VALUES
(1, 'Kindergarten 1', 'Registration Fee', 500, 1),
(2, 'Kindergarten 1', 'Monthly Tuition Fee', 5000, 1),
(3, 'Kindergarten 1', 'Miscellaneous Fee', 2000, 1),
(4, 'Kindergarten 2', 'Registration Fee', 500, 1),
(5, 'Kindergarten 2', 'Monthly Tuition Fee', 6000, 1),
(6, 'Kindergarten 2', 'Miscellaneous Fee', 2000, 1),
(7, 'Kindergarten 1', 'Registration Fee', 0, 2),
(8, 'Kindergarten 1', 'Monthly Tuition Fee', 0, 2),
(9, 'Kindergarten 1', 'Miscellaneous Fee', 0, 2),
(10, 'Kindergarten 2', 'Registration Fee', 0, 2),
(11, 'Kindergarten 2', 'Monthly Tuition Fee', 0, 2),
(12, 'Kindergarten 2', 'Miscellaneous Fee', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
  `en_id` int(11) NOT NULL,
  `enrollID` varchar(50) DEFAULT NULL,
  `stud_fname` varchar(50) NOT NULL,
  `stud_lname` varchar(50) NOT NULL,
  `year_level` varchar(50) NOT NULL CHECK (`year_level` in ('Kindergarten 1','Kindergarten 2')),
  `stud_DOB` date NOT NULL,
  `sy` varchar(50) NOT NULL,
  `lrn_status` varchar(50) NOT NULL CHECK (`lrn_status` in ('No LRN','With LRN','Returning/Balik-Aral')),
  `last_gradelevel` varchar(50) NOT NULL,
  `last_sy` varchar(50) NOT NULL,
  `last_school_name` varchar(50) NOT NULL,
  `stud_age` varchar(50) NOT NULL,
  `stud_sex` varchar(50) NOT NULL CHECK (`stud_sex` in ('Male','Female')),
  `e_email` varchar(50) NOT NULL,
  `IP` varchar(50) NOT NULL CHECK (`IP` in ('Yes','No')),
  `SP` varchar(50) NOT NULL CHECK (`SP` in ('Yes','No')),
  `stud_address` varchar(50) NOT NULL,
  `father_name` varchar(50) NOT NULL,
  `f_contact` varchar(50) NOT NULL DEFAULT 'NULL',
  `mother_name` varchar(50) NOT NULL DEFAULT 'NULL',
  `m_contact` varchar(50) NOT NULL DEFAULT 'NULL',
  `enrollment_date` date NOT NULL,
  `PSA_file` text DEFAULT NULL,
  `prev_RepCard` text DEFAULT NULL,
  `WD_Form` text DEFAULT NULL,
  `ps_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL,
  `fees` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `en_status` varchar(50) NOT NULL DEFAULT 'Pending for Payment' CHECK (`en_status` in ('Enrolled','Pending with Admin','Pending for Payment','Denied','Pending Withdrawal','Withdrawn')),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `lrn` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`en_id`, `enrollID`, `stud_fname`, `stud_lname`, `year_level`, `stud_DOB`, `sy`, `lrn_status`, `last_gradelevel`, `last_sy`, `last_school_name`, `stud_age`, `stud_sex`, `e_email`, `IP`, `SP`, `stud_address`, `father_name`, `f_contact`, `mother_name`, `m_contact`, `enrollment_date`, `PSA_file`, `prev_RepCard`, `WD_Form`, `ps_id`, `user_id`, `details`, `fees`, `balance`, `en_status`, `created_at`, `lrn`) VALUES
(1, '2024-01-0001-00', 'Rebecca', 'Solis', 'Kindergarten 1', '2018-09-23', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'mae_solis@gmail.com', 'No', 'No', 'Dasma, Cavite', 'James Solis', '09163487794', 'Mae Solis', '09154457789', '2023-09-24', 'default-photo.png', NULL, NULL, 1, 1000, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:33:27', NULL),
(2, '2024-01-0002-00', 'Mary', 'Solis', 'Kindergarten 2', '2018-02-09', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '5 years old', 'Female', 'mae_solis@gmail.com', 'No', 'No', 'Dasma, Cavite', 'James Solis', '09163487794', 'Mae Solis', '09154457789', '2023-09-24', 'default-photo.png', NULL, NULL, 2, 1000, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:33:27', 105068240001),
(3, '2024-01-0003-00', 'John', 'Solis', 'Kindergarten 1', '2018-09-02', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'mae_solis@gmail.com', 'No', 'No', 'Dasma, Cavite', 'James Solis', '09163487794', 'Mae Solis', '09154457789', '2023-09-24', 'default-photo.png', NULL, NULL, 1, 1000, NULL, '7500', NULL, 'Pending with Admin', '2024-02-29 08:33:27', NULL),
(4, '2024-01-0004-00', 'Finn', 'Gomez', 'Kindergarten 1', '2018-06-01', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'mark_bautista@gmail.com', 'No', 'No', 'Dasma, Cavite', 'Mark Bautista', '09458261195', 'Anne Bautista', '09163487794', '2023-09-24', 'default-photo.png', NULL, NULL, 1, 1001, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:33:27', NULL),
(5, '2024-01-0005-00', 'Peter', 'Gomez', 'Kindergarten 1', '2018-05-06', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'mark_bautista@gmail.com', 'No', 'No', 'Dasma, Cavite', 'Mark Bautista', '09458261195', 'Anne Bautista', '09163487794', '2023-09-24', 'default-photo.png', NULL, NULL, 2, 1001, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:33:27', NULL),
(6, '2024-01-0006-00', 'Diana', 'Gomez', 'Kindergarten 2', '2018-05-06', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '5 years old', 'Female', 'mark_bautista@gmail.com', 'No', 'No', 'Dasma, Cavite', 'Mark Bautista', '09458261195', 'Anne Bautista', '09163487794', '2023-09-24', 'default-photo.png', NULL, NULL, 2, 1001, NULL, '0', NULL, 'Pending for Payment', '2024-02-29 08:33:27', 105068240002),
(7, '2024-01-0007-00', 'StudentFirstName0', 'StudentLastName0', 'Kindergarten 1', '2018-05-12', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user0@example.com', 'No', 'No', 'Cavite', 'FatherName0', '091234567800', 'MotherName0', '098765432100', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1006, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(8, '2024-01-0008-00', 'StudentFirstName1', 'StudentLastName1', 'Kindergarten 1', '2018-12-27', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user1@example.com', 'No', 'No', 'Cavite', 'FatherName1', '091234567801', 'MotherName1', '098765432101', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1007, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(9, '2024-01-0009-00', 'StudentFirstName2', 'StudentLastName2', 'Kindergarten 1', '2018-09-10', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user2@example.com', 'No', 'No', 'Cavite', 'FatherName2', '091234567802', 'MotherName2', '098765432102', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1008, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(10, '2024-01-0010-00', 'StudentFirstName3', 'StudentLastName3', 'Kindergarten 1', '2018-05-04', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user3@example.com', 'No', 'No', 'Cavite', 'FatherName3', '091234567803', 'MotherName3', '098765432103', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1009, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(11, '2024-01-0011-00', 'StudentFirstName4', 'StudentLastName4', 'Kindergarten 1', '2018-06-17', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user4@example.com', 'No', 'No', 'Cavite', 'FatherName4', '091234567804', 'MotherName4', '098765432104', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1010, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(12, '2024-01-0012-00', 'StudentFirstName5', 'StudentLastName5', 'Kindergarten 1', '2019-02-09', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user5@example.com', 'No', 'No', 'Cavite', 'FatherName5', '091234567805', 'MotherName5', '098765432105', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1011, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(13, '2024-01-0013-00', 'StudentFirstName6', 'StudentLastName6', 'Kindergarten 1', '2019-01-03', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user6@example.com', 'No', 'No', 'Cavite', 'FatherName6', '091234567806', 'MotherName6', '098765432106', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1012, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(14, '2024-01-0014-00', 'StudentFirstName7', 'StudentLastName7', 'Kindergarten 1', '2018-07-21', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user7@example.com', 'No', 'No', 'Cavite', 'FatherName7', '091234567807', 'MotherName7', '098765432107', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1013, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(15, '2024-01-0015-00', 'StudentFirstName8', 'StudentLastName8', 'Kindergarten 1', '2018-07-28', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user8@example.com', 'No', 'No', 'Cavite', 'FatherName8', '091234567808', 'MotherName8', '098765432108', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1014, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(16, '2024-01-0016-00', 'StudentFirstName9', 'StudentLastName9', 'Kindergarten 1', '2019-01-15', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user9@example.com', 'No', 'No', 'Cavite', 'FatherName9', '091234567809', 'MotherName9', '098765432109', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1015, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(17, '2024-01-0017-00', 'StudentFirstName10', 'StudentLastName10', 'Kindergarten 1', '2018-04-27', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user10@example.com', 'No', 'No', 'Cavite', 'FatherName10', '091234567810', 'MotherName10', '098765432110', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1016, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(18, '2024-01-0018-00', 'StudentFirstName11', 'StudentLastName11', 'Kindergarten 1', '2018-04-28', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user11@example.com', 'No', 'No', 'Cavite', 'FatherName11', '091234567811', 'MotherName11', '098765432111', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1017, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(19, '2024-01-0019-00', 'StudentFirstName12', 'StudentLastName12', 'Kindergarten 1', '2018-06-28', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user12@example.com', 'No', 'No', 'Cavite', 'FatherName12', '091234567812', 'MotherName12', '098765432112', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1018, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(20, '2024-01-0020-00', 'StudentFirstName13', 'StudentLastName13', 'Kindergarten 1', '2018-04-26', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user13@example.com', 'No', 'No', 'Cavite', 'FatherName13', '091234567813', 'MotherName13', '098765432113', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1019, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(21, '2024-01-0021-00', 'StudentFirstName14', 'StudentLastName14', 'Kindergarten 1', '2018-12-16', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user14@example.com', 'No', 'No', 'Cavite', 'FatherName14', '091234567814', 'MotherName14', '098765432114', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1020, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(22, '2024-01-0022-00', 'StudentFirstName15', 'StudentLastName15', 'Kindergarten 1', '2018-09-02', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user15@example.com', 'No', 'No', 'Cavite', 'FatherName15', '091234567815', 'MotherName15', '098765432115', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1021, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(23, '2024-01-0023-00', 'StudentFirstName16', 'StudentLastName16', 'Kindergarten 1', '2018-04-25', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user16@example.com', 'No', 'No', 'Cavite', 'FatherName16', '091234567816', 'MotherName16', '098765432116', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1022, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(24, '2024-01-0024-00', 'StudentFirstName17', 'StudentLastName17', 'Kindergarten 1', '2018-05-27', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user17@example.com', 'No', 'No', 'Cavite', 'FatherName17', '091234567817', 'MotherName17', '098765432117', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1023, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(25, '2024-01-0025-00', 'StudentFirstName18', 'StudentLastName18', 'Kindergarten 1', '2018-11-25', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user18@example.com', 'No', 'No', 'Cavite', 'FatherName18', '091234567818', 'MotherName18', '098765432118', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1024, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(26, '2024-01-0026-00', 'StudentFirstName19', 'StudentLastName19', 'Kindergarten 1', '2019-02-20', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user19@example.com', 'No', 'No', 'Cavite', 'FatherName19', '091234567819', 'MotherName19', '098765432119', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1025, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(27, '2024-01-0027-00', 'StudentFirstName20', 'StudentLastName20', 'Kindergarten 1', '2018-10-29', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user20@example.com', 'No', 'No', 'Cavite', 'FatherName20', '091234567820', 'MotherName20', '098765432120', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1026, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(28, '2024-01-0028-00', 'StudentFirstName21', 'StudentLastName21', 'Kindergarten 1', '2018-07-22', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user21@example.com', 'No', 'No', 'Cavite', 'FatherName21', '091234567821', 'MotherName21', '098765432121', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1027, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(29, '2024-01-0029-00', 'StudentFirstName22', 'StudentLastName22', 'Kindergarten 1', '2019-02-21', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user22@example.com', 'No', 'No', 'Cavite', 'FatherName22', '091234567822', 'MotherName22', '098765432122', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1028, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(30, '2024-01-0030-00', 'StudentFirstName23', 'StudentLastName23', 'Kindergarten 1', '2018-11-14', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user23@example.com', 'No', 'No', 'Cavite', 'FatherName23', '091234567823', 'MotherName23', '098765432123', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1029, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(31, '2024-01-0031-00', 'StudentFirstName24', 'StudentLastName24', 'Kindergarten 1', '2018-10-07', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user24@example.com', 'No', 'No', 'Cavite', 'FatherName24', '091234567824', 'MotherName24', '098765432124', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1030, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(32, '2024-01-0032-00', 'StudentFirstName25', 'StudentLastName25', 'Kindergarten 1', '2019-01-23', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user25@example.com', 'No', 'No', 'Cavite', 'FatherName25', '091234567825', 'MotherName25', '098765432125', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1031, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(33, '2024-01-0033-00', 'StudentFirstName26', 'StudentLastName26', 'Kindergarten 1', '2018-11-05', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user26@example.com', 'No', 'No', 'Cavite', 'FatherName26', '091234567826', 'MotherName26', '098765432126', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1032, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(34, '2024-01-0034-00', 'StudentFirstName27', 'StudentLastName27', 'Kindergarten 1', '2018-11-19', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user27@example.com', 'No', 'No', 'Cavite', 'FatherName27', '091234567827', 'MotherName27', '098765432127', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1033, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(35, '2024-01-0035-00', 'StudentFirstName28', 'StudentLastName28', 'Kindergarten 1', '2018-09-18', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user28@example.com', 'No', 'No', 'Cavite', 'FatherName28', '091234567828', 'MotherName28', '098765432128', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1034, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(36, '2024-01-0036-00', 'StudentFirstName29', 'StudentLastName29', 'Kindergarten 1', '2018-10-07', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user29@example.com', 'No', 'No', 'Cavite', 'FatherName29', '091234567829', 'MotherName29', '098765432129', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1035, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(37, '2024-01-0037-00', 'StudentFirstName30', 'StudentLastName30', 'Kindergarten 1', '2018-07-09', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user30@example.com', 'No', 'No', 'Cavite', 'FatherName30', '091234567830', 'MotherName30', '098765432130', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1036, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(38, '2024-01-0038-00', 'StudentFirstName31', 'StudentLastName31', 'Kindergarten 1', '2019-02-19', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user31@example.com', 'No', 'No', 'Cavite', 'FatherName31', '091234567831', 'MotherName31', '098765432131', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1037, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(39, '2024-01-0039-00', 'StudentFirstName32', 'StudentLastName32', 'Kindergarten 1', '2018-12-18', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user32@example.com', 'No', 'No', 'Cavite', 'FatherName32', '091234567832', 'MotherName32', '098765432132', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1038, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(40, '2024-01-0040-00', 'StudentFirstName33', 'StudentLastName33', 'Kindergarten 1', '2018-04-01', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user33@example.com', 'No', 'No', 'Cavite', 'FatherName33', '091234567833', 'MotherName33', '098765432133', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1039, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(41, '2024-01-0041-00', 'StudentFirstName34', 'StudentLastName34', 'Kindergarten 1', '2018-03-11', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user34@example.com', 'No', 'No', 'Cavite', 'FatherName34', '091234567834', 'MotherName34', '098765432134', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1040, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(42, '2024-01-0042-00', 'StudentFirstName35', 'StudentLastName35', 'Kindergarten 1', '2019-01-18', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user35@example.com', 'No', 'No', 'Cavite', 'FatherName35', '091234567835', 'MotherName35', '098765432135', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1041, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(43, '2024-01-0043-00', 'StudentFirstName36', 'StudentLastName36', 'Kindergarten 1', '2018-07-03', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user36@example.com', 'No', 'No', 'Cavite', 'FatherName36', '091234567836', 'MotherName36', '098765432136', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1042, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(44, '2024-01-0044-00', 'StudentFirstName37', 'StudentLastName37', 'Kindergarten 1', '2018-03-19', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user37@example.com', 'No', 'No', 'Cavite', 'FatherName37', '091234567837', 'MotherName37', '098765432137', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1043, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(45, '2024-01-0045-00', 'StudentFirstName38', 'StudentLastName38', 'Kindergarten 1', '2018-05-21', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user38@example.com', 'No', 'No', 'Cavite', 'FatherName38', '091234567838', 'MotherName38', '098765432138', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1044, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(46, '2024-01-0046-00', 'StudentFirstName39', 'StudentLastName39', 'Kindergarten 1', '2019-02-19', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user39@example.com', 'No', 'No', 'Cavite', 'FatherName39', '091234567839', 'MotherName39', '098765432139', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1045, NULL, '7500', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(47, '2024-01-0047-00', 'StudentFirstName40', 'StudentLastName40', 'Kindergarten 2', '2017-10-11', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user40@example.com', 'No', 'No', 'Cavite', 'FatherName40', '091234567840', 'MotherName40', '098765432140', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1046, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240001),
(48, '2024-01-0048-00', 'StudentFirstName41', 'StudentLastName41', 'Kindergarten 2', '2017-07-28', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user41@example.com', 'No', 'No', 'Cavite', 'FatherName41', '091234567841', 'MotherName41', '098765432141', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1047, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240002),
(49, '2024-01-0049-00', 'StudentFirstName42', 'StudentLastName42', 'Kindergarten 2', '2017-05-15', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user42@example.com', 'No', 'No', 'Cavite', 'FatherName42', '091234567842', 'MotherName42', '098765432142', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1048, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240003),
(50, '2024-01-0050-00', 'StudentFirstName43', 'StudentLastName43', 'Kindergarten 2', '2017-12-19', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user43@example.com', 'No', 'No', 'Cavite', 'FatherName43', '091234567843', 'MotherName43', '098765432143', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1049, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240004),
(51, '2024-01-0051-00', 'StudentFirstName44', 'StudentLastName44', 'Kindergarten 2', '2017-07-24', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user44@example.com', 'No', 'No', 'Cavite', 'FatherName44', '091234567844', 'MotherName44', '098765432144', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1050, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240005),
(52, '2024-01-0052-00', 'StudentFirstName45', 'StudentLastName45', 'Kindergarten 2', '2017-09-27', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user45@example.com', 'No', 'No', 'Cavite', 'FatherName45', '091234567845', 'MotherName45', '098765432145', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1051, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240006),
(53, '2024-01-0053-00', 'StudentFirstName46', 'StudentLastName46', 'Kindergarten 2', '2017-11-08', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user46@example.com', 'No', 'No', 'Cavite', 'FatherName46', '091234567846', 'MotherName46', '098765432146', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1052, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240007),
(54, '2024-01-0054-00', 'StudentFirstName47', 'StudentLastName47', 'Kindergarten 2', '2017-11-21', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user47@example.com', 'No', 'No', 'Cavite', 'FatherName47', '091234567847', 'MotherName47', '098765432147', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1053, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240008),
(55, '2024-01-0055-00', 'StudentFirstName48', 'StudentLastName48', 'Kindergarten 2', '2017-09-22', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user48@example.com', 'No', 'No', 'Cavite', 'FatherName48', '091234567848', 'MotherName48', '098765432148', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1054, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240009),
(56, '2024-01-0056-00', 'StudentFirstName49', 'StudentLastName49', 'Kindergarten 2', '2017-10-16', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user49@example.com', 'No', 'No', 'Cavite', 'FatherName49', '091234567849', 'MotherName49', '098765432149', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1055, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240010),
(57, '2024-01-0057-00', 'StudentFirstName50', 'StudentLastName50', 'Kindergarten 2', '2017-08-15', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user50@example.com', 'No', 'No', 'Cavite', 'FatherName50', '091234567850', 'MotherName50', '098765432150', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1056, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240011),
(58, '2024-01-0058-00', 'StudentFirstName51', 'StudentLastName51', 'Kindergarten 2', '2017-07-25', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user51@example.com', 'No', 'No', 'Cavite', 'FatherName51', '091234567851', 'MotherName51', '098765432151', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1057, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240012),
(59, '2024-01-0059-00', 'StudentFirstName52', 'StudentLastName52', 'Kindergarten 2', '2017-10-19', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user52@example.com', 'No', 'No', 'Cavite', 'FatherName52', '091234567852', 'MotherName52', '098765432152', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1058, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240013),
(60, '2024-01-0060-00', 'StudentFirstName53', 'StudentLastName53', 'Kindergarten 2', '2018-02-20', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user53@example.com', 'No', 'No', 'Cavite', 'FatherName53', '091234567853', 'MotherName53', '098765432153', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1059, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240014),
(61, '2024-01-0061-00', 'StudentFirstName54', 'StudentLastName54', 'Kindergarten 2', '2018-02-20', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user54@example.com', 'No', 'No', 'Cavite', 'FatherName54', '091234567854', 'MotherName54', '098765432154', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1060, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240015),
(62, '2024-01-0062-00', 'StudentFirstName55', 'StudentLastName55', 'Kindergarten 2', '2018-02-12', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user55@example.com', 'No', 'No', 'Cavite', 'FatherName55', '091234567855', 'MotherName55', '098765432155', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1061, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240016),
(63, '2024-01-0063-00', 'StudentFirstName56', 'StudentLastName56', 'Kindergarten 2', '2018-01-04', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user56@example.com', 'No', 'No', 'Cavite', 'FatherName56', '091234567856', 'MotherName56', '098765432156', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1062, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240017),
(64, '2024-01-0064-00', 'StudentFirstName57', 'StudentLastName57', 'Kindergarten 2', '2017-07-12', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user57@example.com', 'No', 'No', 'Cavite', 'FatherName57', '091234567857', 'MotherName57', '098765432157', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1063, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240018),
(65, '2024-01-0065-00', 'StudentFirstName58', 'StudentLastName58', 'Kindergarten 2', '2017-06-15', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user58@example.com', 'No', 'No', 'Cavite', 'FatherName58', '091234567858', 'MotherName58', '098765432158', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1064, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240019),
(66, '2024-01-0066-00', 'StudentFirstName59', 'StudentLastName59', 'Kindergarten 2', '2017-07-11', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user59@example.com', 'No', 'No', 'Cavite', 'FatherName59', '091234567859', 'MotherName59', '098765432159', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1065, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240020),
(67, '2024-01-0067-00', 'StudentFirstName60', 'StudentLastName60', 'Kindergarten 2', '2018-02-08', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user60@example.com', 'No', 'No', 'Cavite', 'FatherName60', '091234567860', 'MotherName60', '098765432160', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1066, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240021),
(68, '2024-01-0068-00', 'StudentFirstName61', 'StudentLastName61', 'Kindergarten 2', '2017-10-13', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user61@example.com', 'No', 'No', 'Cavite', 'FatherName61', '091234567861', 'MotherName61', '098765432161', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1067, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240022),
(69, '2024-01-0069-00', 'StudentFirstName62', 'StudentLastName62', 'Kindergarten 2', '2017-06-08', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user62@example.com', 'No', 'No', 'Cavite', 'FatherName62', '091234567862', 'MotherName62', '098765432162', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1068, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240023),
(70, '2024-01-0070-00', 'StudentFirstName63', 'StudentLastName63', 'Kindergarten 2', '2017-08-30', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user63@example.com', 'No', 'No', 'Cavite', 'FatherName63', '091234567863', 'MotherName63', '098765432163', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1069, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240024),
(71, '2024-01-0071-00', 'StudentFirstName64', 'StudentLastName64', 'Kindergarten 2', '2017-11-06', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user64@example.com', 'No', 'No', 'Cavite', 'FatherName64', '091234567864', 'MotherName64', '098765432164', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1070, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240025),
(72, '2024-01-0072-00', 'StudentFirstName65', 'StudentLastName65', 'Kindergarten 2', '2018-02-05', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user65@example.com', 'No', 'No', 'Cavite', 'FatherName65', '091234567865', 'MotherName65', '098765432165', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1071, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240026),
(73, '2024-01-0073-00', 'StudentFirstName66', 'StudentLastName66', 'Kindergarten 2', '2017-10-09', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user66@example.com', 'No', 'No', 'Cavite', 'FatherName66', '091234567866', 'MotherName66', '098765432166', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1072, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240027),
(74, '2024-01-0074-00', 'StudentFirstName67', 'StudentLastName67', 'Kindergarten 2', '2017-05-31', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user67@example.com', 'No', 'No', 'Cavite', 'FatherName67', '091234567867', 'MotherName67', '098765432167', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1073, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240028),
(75, '2024-01-0075-00', 'StudentFirstName68', 'StudentLastName68', 'Kindergarten 2', '2017-07-30', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user68@example.com', 'No', 'No', 'Cavite', 'FatherName68', '091234567868', 'MotherName68', '098765432168', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1074, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240029),
(76, '2024-01-0076-00', 'StudentFirstName69', 'StudentLastName69', 'Kindergarten 2', '2017-06-29', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user69@example.com', 'No', 'No', 'Cavite', 'FatherName69', '091234567869', 'MotherName69', '098765432169', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1075, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240030),
(77, '2024-01-0077-00', 'StudentFirstName70', 'StudentLastName70', 'Kindergarten 2', '2017-07-28', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user70@example.com', 'No', 'No', 'Cavite', 'FatherName70', '091234567870', 'MotherName70', '098765432170', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1076, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240031),
(78, '2024-01-0078-00', 'StudentFirstName71', 'StudentLastName71', 'Kindergarten 2', '2017-03-19', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user71@example.com', 'No', 'No', 'Cavite', 'FatherName71', '091234567871', 'MotherName71', '098765432171', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1077, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240032),
(79, '2024-01-0079-00', 'StudentFirstName72', 'StudentLastName72', 'Kindergarten 2', '2017-03-11', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user72@example.com', 'No', 'No', 'Cavite', 'FatherName72', '091234567872', 'MotherName72', '098765432172', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1078, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240033),
(80, '2024-01-0080-00', 'StudentFirstName73', 'StudentLastName73', 'Kindergarten 2', '2018-02-26', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user73@example.com', 'No', 'No', 'Cavite', 'FatherName73', '091234567873', 'MotherName73', '098765432173', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1079, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240034),
(81, '2024-01-0081-00', 'StudentFirstName74', 'StudentLastName74', 'Kindergarten 2', '2018-01-13', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user74@example.com', 'No', 'No', 'Cavite', 'FatherName74', '091234567874', 'MotherName74', '098765432174', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1080, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240035),
(82, '2024-01-0082-00', 'StudentFirstName75', 'StudentLastName75', 'Kindergarten 2', '2017-07-21', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user75@example.com', 'No', 'No', 'Cavite', 'FatherName75', '091234567875', 'MotherName75', '098765432175', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1081, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240036),
(83, '2024-01-0083-00', 'StudentFirstName76', 'StudentLastName76', 'Kindergarten 2', '2017-06-28', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user76@example.com', 'No', 'No', 'Cavite', 'FatherName76', '091234567876', 'MotherName76', '098765432176', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1082, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240037),
(84, '2024-01-0084-00', 'StudentFirstName77', 'StudentLastName77', 'Kindergarten 2', '2017-08-18', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user77@example.com', 'No', 'No', 'Cavite', 'FatherName77', '091234567877', 'MotherName77', '098765432177', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1083, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240038),
(85, '2024-01-0085-00', 'StudentFirstName78', 'StudentLastName78', 'Kindergarten 2', '2017-07-09', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Female', 'user78@example.com', 'No', 'No', 'Cavite', 'FatherName78', '091234567878', 'MotherName78', '098765432178', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1084, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240039),
(86, '2024-01-0086-00', 'StudentFirstName79', 'StudentLastName79', 'Kindergarten 2', '2017-07-17', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Children of Mary Academy of Dasmariñas Cavite', '6 years old', 'Male', 'user79@example.com', 'No', 'No', 'Cavite', 'FatherName79', '091234567879', 'MotherName79', '098765432179', '2024-02-29', 'default-photo.png', NULL, NULL, 1, 1085, NULL, '8500', NULL, 'Enrolled', '2024-02-29 08:40:39', 405068240040),
(87, '2024-01-0087-00', 'StudentFirstName80', 'StudentLastName80', 'Kindergarten 1', '2018-08-03', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user80@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName80', '091234567880', 'MotherName80', '098765432180', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1086, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(88, '2024-01-0088-00', 'StudentFirstName81', 'StudentLastName81', 'Kindergarten 1', '2018-11-29', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user81@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName81', '091234567881', 'MotherName81', '098765432181', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1087, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(89, '2024-01-0089-00', 'StudentFirstName82', 'StudentLastName82', 'Kindergarten 1', '2018-08-18', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user82@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName82', '091234567882', 'MotherName82', '098765432182', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1088, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(90, '2024-01-0090-00', 'StudentFirstName83', 'StudentLastName83', 'Kindergarten 1', '2018-04-02', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user83@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName83', '091234567883', 'MotherName83', '098765432183', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1089, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(91, '2024-01-0091-00', 'StudentFirstName84', 'StudentLastName84', 'Kindergarten 1', '2018-03-17', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user84@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName84', '091234567884', 'MotherName84', '098765432184', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1090, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(92, '2024-01-0092-00', 'StudentFirstName85', 'StudentLastName85', 'Kindergarten 1', '2019-02-12', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user85@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName85', '091234567885', 'MotherName85', '098765432185', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1091, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(93, '2024-01-0093-00', 'StudentFirstName86', 'StudentLastName86', 'Kindergarten 1', '2018-10-20', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user86@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName86', '091234567886', 'MotherName86', '098765432186', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1092, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(94, '2024-01-0094-00', 'StudentFirstName87', 'StudentLastName87', 'Kindergarten 1', '2018-06-30', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user87@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName87', '091234567887', 'MotherName87', '098765432187', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1093, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(95, '2024-01-0095-00', 'StudentFirstName88', 'StudentLastName88', 'Kindergarten 1', '2018-11-27', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user88@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName88', '091234567888', 'MotherName88', '098765432188', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1094, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(96, '2024-01-0096-00', 'StudentFirstName89', 'StudentLastName89', 'Kindergarten 1', '2018-11-18', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user89@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName89', '091234567889', 'MotherName89', '098765432189', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1095, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(97, '2024-01-0097-00', 'StudentFirstName90', 'StudentLastName90', 'Kindergarten 1', '2018-07-12', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user90@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName90', '091234567890', 'MotherName90', '098765432190', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1096, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(98, '2024-01-0098-00', 'StudentFirstName91', 'StudentLastName91', 'Kindergarten 1', '2018-10-30', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user91@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName91', '091234567891', 'MotherName91', '098765432191', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1097, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(99, '2024-01-0099-00', 'StudentFirstName92', 'StudentLastName92', 'Kindergarten 1', '2018-05-27', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user92@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName92', '091234567892', 'MotherName92', '098765432192', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1098, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(100, '2024-01-0100-00', 'StudentFirstName93', 'StudentLastName93', 'Kindergarten 1', '2018-05-13', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user93@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName93', '091234567893', 'MotherName93', '098765432193', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1099, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(101, '2024-01-0101-00', 'StudentFirstName94', 'StudentLastName94', 'Kindergarten 1', '2018-06-12', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user94@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName94', '091234567894', 'MotherName94', '098765432194', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1100, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(102, '2024-01-0102-00', 'StudentFirstName95', 'StudentLastName95', 'Kindergarten 1', '2018-12-24', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user95@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName95', '091234567895', 'MotherName95', '098765432195', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1101, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(103, '2024-01-0103-00', 'StudentFirstName96', 'StudentLastName96', 'Kindergarten 1', '2018-05-28', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user96@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName96', '091234567896', 'MotherName96', '098765432196', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1102, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(104, '2024-01-0104-00', 'StudentFirstName97', 'StudentLastName97', 'Kindergarten 1', '2018-12-01', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user97@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName97', '091234567897', 'MotherName97', '098765432197', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1103, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(105, '2024-01-0105-00', 'StudentFirstName98', 'StudentLastName98', 'Kindergarten 1', '2018-03-16', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user98@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName98', '091234567898', 'MotherName98', '098765432198', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1104, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(106, '2024-01-0106-00', 'StudentFirstName99', 'StudentLastName99', 'Kindergarten 1', '2019-02-11', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user99@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName99', '091234567899', 'MotherName99', '098765432199', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1105, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(107, '2024-01-0107-00', 'StudentFirstName100', 'StudentLastName100', 'Kindergarten 1', '2018-10-17', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user100@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName100', '091234567810', 'MotherName100', '098765432110', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1106, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(108, '2024-01-0108-00', 'StudentFirstName101', 'StudentLastName101', 'Kindergarten 1', '2018-06-19', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user101@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName101', '091234567810', 'MotherName101', '098765432110', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1107, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(109, '2024-01-0109-00', 'StudentFirstName102', 'StudentLastName102', 'Kindergarten 1', '2018-10-11', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user102@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName102', '091234567810', 'MotherName102', '098765432110', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1108, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(110, '2024-01-0110-00', 'StudentFirstName103', 'StudentLastName103', 'Kindergarten 1', '2018-04-30', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user103@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName103', '091234567810', 'MotherName103', '098765432110', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1109, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(111, '2024-01-0111-00', 'StudentFirstName104', 'StudentLastName104', 'Kindergarten 1', '2019-02-26', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user104@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName104', '091234567810', 'MotherName104', '098765432110', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1110, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(112, '2024-01-0112-00', 'StudentFirstName105', 'StudentLastName105', 'Kindergarten 1', '2018-08-15', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user105@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName105', '091234567810', 'MotherName105', '098765432110', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1111, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(113, '2024-01-0113-00', 'StudentFirstName106', 'StudentLastName106', 'Kindergarten 1', '2018-06-23', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user106@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName106', '091234567810', 'MotherName106', '098765432110', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1112, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(114, '2024-01-0114-00', 'StudentFirstName107', 'StudentLastName107', 'Kindergarten 1', '2018-05-11', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user107@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName107', '091234567810', 'MotherName107', '098765432110', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1113, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(115, '2024-01-0115-00', 'StudentFirstName108', 'StudentLastName108', 'Kindergarten 1', '2018-03-14', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user108@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName108', '091234567810', 'MotherName108', '098765432110', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1114, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(116, '2024-01-0116-00', 'StudentFirstName109', 'StudentLastName109', 'Kindergarten 1', '2018-10-04', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user109@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName109', '091234567810', 'MotherName109', '098765432110', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1115, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(117, '2024-01-0117-00', 'StudentFirstName110', 'StudentLastName110', 'Kindergarten 1', '2019-01-13', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user110@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName110', '091234567811', 'MotherName110', '098765432111', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1116, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(118, '2024-01-0118-00', 'StudentFirstName111', 'StudentLastName111', 'Kindergarten 1', '2018-09-26', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user111@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName111', '091234567811', 'MotherName111', '098765432111', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1117, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL);
INSERT INTO `enroll` (`en_id`, `enrollID`, `stud_fname`, `stud_lname`, `year_level`, `stud_DOB`, `sy`, `lrn_status`, `last_gradelevel`, `last_sy`, `last_school_name`, `stud_age`, `stud_sex`, `e_email`, `IP`, `SP`, `stud_address`, `father_name`, `f_contact`, `mother_name`, `m_contact`, `enrollment_date`, `PSA_file`, `prev_RepCard`, `WD_Form`, `ps_id`, `user_id`, `details`, `fees`, `balance`, `en_status`, `created_at`, `lrn`) VALUES
(119, '2024-01-0119-00', 'StudentFirstName112', 'StudentLastName112', 'Kindergarten 1', '2018-05-31', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user112@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName112', '091234567811', 'MotherName112', '098765432111', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1118, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(120, '2024-01-0120-00', 'StudentFirstName113', 'StudentLastName113', 'Kindergarten 1', '2018-09-13', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user113@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName113', '091234567811', 'MotherName113', '098765432111', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1119, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(121, '2024-01-0121-00', 'StudentFirstName114', 'StudentLastName114', 'Kindergarten 1', '2019-02-03', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user114@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName114', '091234567811', 'MotherName114', '098765432111', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1120, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(122, '2024-01-0122-00', 'StudentFirstName115', 'StudentLastName115', 'Kindergarten 1', '2018-03-16', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user115@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName115', '091234567811', 'MotherName115', '098765432111', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1121, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(123, '2024-01-0123-00', 'StudentFirstName116', 'StudentLastName116', 'Kindergarten 1', '2018-08-02', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user116@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName116', '091234567811', 'MotherName116', '098765432111', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1122, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(124, '2024-01-0124-00', 'StudentFirstName117', 'StudentLastName117', 'Kindergarten 1', '2019-02-22', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user117@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName117', '091234567811', 'MotherName117', '098765432111', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1123, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(125, '2024-01-0125-00', 'StudentFirstName118', 'StudentLastName118', 'Kindergarten 1', '2018-10-23', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Female', 'user118@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName118', '091234567811', 'MotherName118', '098765432111', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1124, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(126, '2024-01-0126-00', 'StudentFirstName119', 'StudentLastName119', 'Kindergarten 1', '2018-06-15', '2024-2025', 'No LRN', 'N/A', 'N/A', 'N/A', '5 years old', 'Male', 'user119@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName119', '091234567811', 'MotherName119', '098765432111', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1125, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', NULL),
(127, '2024-01-0127-00', 'StudentFirstName120', 'StudentLastName120', 'Kindergarten 2', '2017-05-05', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user120@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName120', '091234567812', 'MotherName120', '098765432112', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1126, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240003),
(128, '2024-01-0128-00', 'StudentFirstName121', 'StudentLastName121', 'Kindergarten 2', '2017-10-18', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user121@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName121', '091234567812', 'MotherName121', '098765432112', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1127, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240004),
(129, '2024-01-0129-00', 'StudentFirstName122', 'StudentLastName122', 'Kindergarten 2', '2017-10-19', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user122@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName122', '091234567812', 'MotherName122', '098765432112', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1128, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240005),
(130, '2024-01-0130-00', 'StudentFirstName123', 'StudentLastName123', 'Kindergarten 2', '2017-06-09', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user123@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName123', '091234567812', 'MotherName123', '098765432112', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1129, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240006),
(131, '2024-01-0131-00', 'StudentFirstName124', 'StudentLastName124', 'Kindergarten 2', '2017-08-18', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user124@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName124', '091234567812', 'MotherName124', '098765432112', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1130, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240007),
(132, '2024-01-0132-00', 'StudentFirstName125', 'StudentLastName125', 'Kindergarten 2', '2017-09-05', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user125@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName125', '091234567812', 'MotherName125', '098765432112', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1131, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240008),
(133, '2024-01-0133-00', 'StudentFirstName126', 'StudentLastName126', 'Kindergarten 2', '2017-05-02', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user126@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName126', '091234567812', 'MotherName126', '098765432112', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1132, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240009),
(134, '2024-01-0134-00', 'StudentFirstName127', 'StudentLastName127', 'Kindergarten 2', '2017-06-22', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user127@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName127', '091234567812', 'MotherName127', '098765432112', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1133, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240010),
(135, '2024-01-0135-00', 'StudentFirstName128', 'StudentLastName128', 'Kindergarten 2', '2017-03-17', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user128@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName128', '091234567812', 'MotherName128', '098765432112', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1134, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240011),
(136, '2024-01-0136-00', 'StudentFirstName129', 'StudentLastName129', 'Kindergarten 2', '2017-06-14', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user129@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName129', '091234567812', 'MotherName129', '098765432112', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1135, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240012),
(137, '2024-01-0137-00', 'StudentFirstName130', 'StudentLastName130', 'Kindergarten 2', '2017-06-22', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user130@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName130', '091234567813', 'MotherName130', '098765432113', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1136, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240013),
(138, '2024-01-0138-00', 'StudentFirstName131', 'StudentLastName131', 'Kindergarten 2', '2017-11-07', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user131@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName131', '091234567813', 'MotherName131', '098765432113', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1137, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240014),
(139, '2024-01-0139-00', 'StudentFirstName132', 'StudentLastName132', 'Kindergarten 2', '2017-09-02', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user132@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName132', '091234567813', 'MotherName132', '098765432113', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1138, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240015),
(140, '2024-01-0140-00', 'StudentFirstName133', 'StudentLastName133', 'Kindergarten 2', '2017-08-23', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user133@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName133', '091234567813', 'MotherName133', '098765432113', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1139, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240016),
(141, '2024-01-0141-00', 'StudentFirstName134', 'StudentLastName134', 'Kindergarten 2', '2018-01-14', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user134@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName134', '091234567813', 'MotherName134', '098765432113', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1140, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240017),
(142, '2024-01-0142-00', 'StudentFirstName135', 'StudentLastName135', 'Kindergarten 2', '2018-02-05', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user135@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName135', '091234567813', 'MotherName135', '098765432113', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1141, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240018),
(143, '2024-01-0143-00', 'StudentFirstName136', 'StudentLastName136', 'Kindergarten 2', '2017-03-18', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user136@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName136', '091234567813', 'MotherName136', '098765432113', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1142, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240019),
(144, '2024-01-0144-00', 'StudentFirstName137', 'StudentLastName137', 'Kindergarten 2', '2017-08-08', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user137@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName137', '091234567813', 'MotherName137', '098765432113', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1143, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240020),
(145, '2024-01-0145-00', 'StudentFirstName138', 'StudentLastName138', 'Kindergarten 2', '2017-03-18', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user138@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName138', '091234567813', 'MotherName138', '098765432113', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1144, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240021),
(146, '2024-01-0146-00', 'StudentFirstName139', 'StudentLastName139', 'Kindergarten 2', '2018-02-01', '2024-2025', 'With LRN', 'Kindergarten 1', '2023-2024', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user139@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName139', '091234567813', 'MotherName139', '098765432113', '2024-02-29', 'default-photo.png', NULL, NULL, 2, 1145, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240022),
(147, '2024-01-0147-00', 'StudentFirstName140', 'StudentLastName140', 'Kindergarten 2', '2017-08-20', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user140@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName140', '091234567814', 'MotherName140', '098765432114', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1146, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240023),
(148, '2024-01-0148-00', 'StudentFirstName141', 'StudentLastName141', 'Kindergarten 2', '2017-10-05', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user141@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName141', '091234567814', 'MotherName141', '098765432114', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1147, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240024),
(149, '2024-01-0149-00', 'StudentFirstName142', 'StudentLastName142', 'Kindergarten 2', '2017-09-25', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user142@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName142', '091234567814', 'MotherName142', '098765432114', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1148, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240025),
(150, '2024-01-0150-00', 'StudentFirstName143', 'StudentLastName143', 'Kindergarten 2', '2017-03-21', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user143@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName143', '091234567814', 'MotherName143', '098765432114', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1149, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240026),
(151, '2024-01-0151-00', 'StudentFirstName144', 'StudentLastName144', 'Kindergarten 2', '2017-09-24', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user144@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName144', '091234567814', 'MotherName144', '098765432114', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1150, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240027),
(152, '2024-01-0152-00', 'StudentFirstName145', 'StudentLastName145', 'Kindergarten 2', '2017-10-31', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user145@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName145', '091234567814', 'MotherName145', '098765432114', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1151, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240028),
(153, '2024-01-0153-00', 'StudentFirstName146', 'StudentLastName146', 'Kindergarten 2', '2017-10-24', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user146@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName146', '091234567814', 'MotherName146', '098765432114', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1152, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240029),
(154, '2024-01-0154-00', 'StudentFirstName147', 'StudentLastName147', 'Kindergarten 2', '2017-05-28', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user147@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName147', '091234567814', 'MotherName147', '098765432114', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1153, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240030),
(155, '2024-01-0155-00', 'StudentFirstName148', 'StudentLastName148', 'Kindergarten 2', '2017-06-02', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user148@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName148', '091234567814', 'MotherName148', '098765432114', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1154, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240031),
(156, '2024-01-0156-00', 'StudentFirstName149', 'StudentLastName149', 'Kindergarten 2', '2017-09-22', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user149@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName149', '091234567814', 'MotherName149', '098765432114', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1155, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240032),
(157, '2024-01-0157-00', 'StudentFirstName150', 'StudentLastName150', 'Kindergarten 2', '2017-03-14', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user150@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName150', '091234567815', 'MotherName150', '098765432115', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1156, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240033),
(158, '2024-01-0158-00', 'StudentFirstName151', 'StudentLastName151', 'Kindergarten 2', '2017-08-28', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user151@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName151', '091234567815', 'MotherName151', '098765432115', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1157, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240034),
(159, '2024-01-0159-00', 'StudentFirstName152', 'StudentLastName152', 'Kindergarten 2', '2017-07-13', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user152@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName152', '091234567815', 'MotherName152', '098765432115', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1158, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240035),
(160, '2024-01-0160-00', 'StudentFirstName153', 'StudentLastName153', 'Kindergarten 2', '2017-07-10', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user153@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName153', '091234567815', 'MotherName153', '098765432115', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1159, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240036),
(161, '2024-01-0161-00', 'StudentFirstName154', 'StudentLastName154', 'Kindergarten 2', '2017-11-09', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user154@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName154', '091234567815', 'MotherName154', '098765432115', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1160, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240037),
(162, '2024-01-0162-00', 'StudentFirstName155', 'StudentLastName155', 'Kindergarten 2', '2017-07-20', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user155@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName155', '091234567815', 'MotherName155', '098765432115', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1161, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240038),
(163, '2024-01-0163-00', 'StudentFirstName156', 'StudentLastName156', 'Kindergarten 2', '2018-01-09', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user156@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName156', '091234567815', 'MotherName156', '098765432115', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1162, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240039),
(164, '2024-01-0164-00', 'StudentFirstName157', 'StudentLastName157', 'Kindergarten 2', '2017-04-22', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user157@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName157', '091234567815', 'MotherName157', '098765432115', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1163, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240040),
(165, '2024-01-0165-00', 'StudentFirstName158', 'StudentLastName158', 'Kindergarten 2', '2017-04-19', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Female', 'user158@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName158', '091234567815', 'MotherName158', '098765432115', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1164, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240041),
(166, '2024-01-0166-00', 'StudentFirstName159', 'StudentLastName159', 'Kindergarten 2', '2017-05-30', '2023-2024', 'With LRN', 'Kindergarten 1', '2022-2023', 'Luke 19:4 Child Development Center Incorporated', '6 years old', 'Male', 'user159@example.com', 'No', 'No', 'San Felipe, Zambales', 'FatherName159', '091234567815', 'MotherName159', '098765432115', '2023-03-02', 'default-photo.png', NULL, NULL, 2, 1165, NULL, '0', NULL, 'Enrolled', '2024-02-29 08:40:39', 105068240042);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(50) NOT NULL,
  `event_date` date DEFAULT NULL,
  `event_type` varchar(50) NOT NULL CHECK (`event_type` in ('Announcement','Orientation','Parent and Faculty Meeting','Others')),
  `sca_id` int(11) DEFAULT NULL,
  `ps_id` int(11) DEFAULT NULL,
  `event_photo` text DEFAULT NULL,
  `infotext` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `event_title`, `event_date`, `event_type`, `sca_id`, `ps_id`, `event_photo`, `infotext`, `created_at`) VALUES
(1, 'Brigada Eskwela', '2023-07-22', 'Others', 2, 2, 'Brigada.jpg', '', '2024-02-29 08:33:27'),
(2, 'BSP & GSP Activities', '2023-11-12', 'Others', 2, 2, 'BSP & GSP Activities-1.jpg', '', '2024-02-29 08:33:27'),
(3, 'Earthquake Drill', '2023-09-11', 'Others', 2, 2, 'Earthquake Drill.jpg', '', '2024-02-29 08:33:27'),
(4, 'United Nations Celebration', '2023-10-24', 'Others', 2, 2, 'United Nations Celebration - Luke.jpg', '', '2024-02-29 08:33:27'),
(5, 'Buwan ng Wika', '2023-08-01', 'Others', 1, 1, 'Buwan ng Wika - CMAD.jpg', '', '2024-02-29 08:33:27'),
(6, 'Graduation 2023', '2023-04-17', 'Others', 1, 1, 'Graduation 2023 - CMAD.jpg', '', '2024-02-29 08:33:27'),
(7, 'Educational Field Trip', '2023-12-08', 'Others', 1, 1, 'Educational Field Trip - CMAD.jpg', '', '2024-02-29 08:33:27'),
(8, 'United Nations Celebration', '2023-10-24', 'Others', 1, 1, 'United Nations Celebration - CMAD.jpg', '', '2024-02-29 08:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `faculty_id` int(11) NOT NULL,
  `fac_id` varchar(50) DEFAULT NULL,
  `verification_code` text DEFAULT NULL,
  `ps_id` int(11) DEFAULT NULL,
  `sca_id` int(11) DEFAULT NULL,
  `f_fname` varchar(50) NOT NULL,
  `f_lname` varchar(50) NOT NULL,
  `f_DOB` date NOT NULL,
  `f_address` varchar(50) NOT NULL,
  `f_m_status` varchar(50) NOT NULL CHECK (`f_m_status` in ('Single','Married','Others')),
  `f_nationality` varchar(50) NOT NULL,
  `f_religion` varchar(50) NOT NULL,
  `f_gender` varchar(50) NOT NULL CHECK (`f_gender` in ('Female','Male')),
  `f_licenseNo` varchar(50) NOT NULL,
  `f_phonenumber` varchar(50) NOT NULL,
  `f_email` varchar(50) NOT NULL,
  `f_username` varchar(50) NOT NULL,
  `f_password` varchar(50) NOT NULL,
  `f_profile` text DEFAULT 'f_p_default.png',
  `f_status` varchar(50) NOT NULL DEFAULT 'Pending' CHECK (`f_status` in ('Registered','Pending','Deleted')),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`faculty_id`, `fac_id`, `verification_code`, `ps_id`, `sca_id`, `f_fname`, `f_lname`, `f_DOB`, `f_address`, `f_m_status`, `f_nationality`, `f_religion`, `f_gender`, `f_licenseNo`, `f_phonenumber`, `f_email`, `f_username`, `f_password`, `f_profile`, `f_status`, `created_at`) VALUES
(1, 'FID-2024-1234-00', NULL, 1, 1, 'Vanessa', 'Flint', '1990-05-06', 'Bacoor, Cavite', 'Single', 'Filipino', 'Catholic', 'Female', '2018FID023835', '09948165549', 'vanessa_flint@gmail.com', 'V.Flint.04', 'Va04Flint', 'Vanessa.jpeg', 'Registered', '2024-02-29 08:33:27'),
(2, 'FID-2024-1235-00', NULL, 1, 1, 'Ciara', 'Summer', '1990-05-07', 'Dasma, Cavite', 'Single', 'Filipino', 'Catholic', 'Female', '2018FID023836', '0985649916', 'ciara_summer@gmail.com', 'C.Summer.05', 'Ci05Summer', 'Ciara.png', 'Registered', '2024-02-29 08:33:27'),
(3, 'FID-2024-1236-00', NULL, 1, 1, 'Rommel', 'Garcia', '1990-05-10', 'Dasma, Cavite', 'Single', 'Filipino', 'Catholic', 'Male', '2018FID023837', '09684962269', 'rommel_garcia@gmail.com', 'R.Garcia.31', 'Ro31Garcia', 'Rommel.jpg', 'Registered', '2024-02-29 08:33:27'),
(4, 'FID-2024-1237-00', NULL, 1, 1, 'Maria', 'Perez', '1990-07-12', 'Dasma, Cavite', 'Single', 'Filipino', 'Catholic', 'Female', '2018FID023838', '0984631695', 'maria_perez@gmail.com', 'M.Perez.32', 'Ma32Perez', 'Maria.jpg', 'Registered', '2024-02-29 08:33:27'),
(5, 'FID-2024-1238-00', NULL, 2, 2, 'James', 'Walker', '1990-05-08', 'San Felipe, Zambales', 'Single', 'Filipino', 'Catholic', 'Male', '2018FID023839', '09948165549', 'james_walker@gmail.com', 'J.Walker.06', 'Ja06Walker', 'James.jpg', 'Registered', '2024-02-29 08:33:27'),
(6, 'FID-2024-1239-00', NULL, 2, 2, 'Zack', 'Dela Cruz', '1990-05-10', 'San Felipe, Zambales', 'Single', 'Filipino', 'Catholic', 'Male', '2018FID023840', '09649856631', 'zack_delacruz@gmail.com', 'Z.Delacruz.07', 'Za07Delacruz', 'Zack.jpg', 'Registered', '2024-02-29 08:33:27'),
(7, 'FID-2024-2213-00', NULL, 2, 2, 'Luna', 'David', '1990-04-18', 'San Felipe, Zambales', 'Single', 'Filipino', 'Catholic', 'Female', '2018FID023841', '096487136694', 'luna_david@gmail.com', 'L.David.33', 'Lu33David', 'Luna.jpg', 'Registered', '2024-02-29 08:33:27'),
(8, 'FID-2024-3214-00', NULL, 2, 2, 'Mirna', 'Santos', '1990-05-10', 'San Felipe, Zambales', 'Single', 'Filipino', 'Catholic', 'Female', '2018FID023842', '096485239916', 'mirna_santos@gmail.com', 'M.Santos.34', 'Mi34Santos', 'Mirna.jpg', 'Registered', '2024-02-29 08:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `fees_ps`
--

CREATE TABLE `fees_ps` (
  `psf_id` int(11) NOT NULL,
  `fee_glevel` varchar(50) NOT NULL CHECK (`fee_glevel` in ('Kindergarten 1','Kindergarten 2')),
  `fee_totalcost` int(11) DEFAULT NULL,
  `ps_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fees_ps`
--

INSERT INTO `fees_ps` (`psf_id`, `fee_glevel`, `fee_totalcost`, `ps_id`) VALUES
(1, 'Kindergarten 1', 7500, 1),
(2, 'Kindergarten 2', 8500, 1),
(3, 'Kindergarten 1', 0, 2),
(4, 'Kindergarten 2', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `grades_per_subject`
--

CREATE TABLE `grades_per_subject` (
  `grades_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `f_grading` varchar(10) DEFAULT NULL,
  `s_grading` varchar(10) DEFAULT NULL,
  `t_grading` varchar(10) DEFAULT NULL,
  `fourth_grading` varchar(10) DEFAULT NULL,
  `SR_ID` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades_per_subject`
--

INSERT INTO `grades_per_subject` (`grades_id`, `subject_id`, `f_grading`, `s_grading`, `t_grading`, `fourth_grading`, `SR_ID`, `created_at`) VALUES
(1, 1, '92', '92', '91', '90', 1, '2024-02-29 08:33:27'),
(2, 2, '93', '92', '89', '90', 1, '2024-02-29 08:33:27'),
(3, 3, '93', '92', '88', '90', 1, '2024-02-29 08:33:27'),
(4, 4, '92', '92', '89', '88', 1, '2024-02-29 08:33:27'),
(5, 5, '92', '92', '92', '93', 1, '2024-02-29 08:33:27'),
(6, 6, '92', '92', '89', '90', 1, '2024-02-29 08:33:27'),
(7, 1, '92', '92', NULL, NULL, 2, '2024-02-29 08:33:27'),
(8, 2, '93', '92', NULL, NULL, 2, '2024-02-29 08:33:27'),
(9, 3, '93', '92', NULL, NULL, 2, '2024-02-29 08:33:27'),
(10, 4, '92', '92', NULL, NULL, 2, '2024-02-29 08:33:27'),
(11, 5, '92', '92', NULL, NULL, 2, '2024-02-29 08:33:27'),
(12, 6, '92', '92', NULL, NULL, 2, '2024-02-29 08:33:27'),
(13, 1, NULL, NULL, NULL, NULL, 5, '2024-03-02 03:09:49'),
(14, 2, NULL, NULL, NULL, NULL, 5, '2024-03-02 03:09:49'),
(15, 3, NULL, NULL, NULL, NULL, 5, '2024-03-02 03:09:49'),
(16, 4, NULL, NULL, NULL, NULL, 5, '2024-03-02 03:09:49'),
(17, 5, NULL, NULL, NULL, NULL, 5, '2024-03-02 03:09:49'),
(18, 6, NULL, NULL, NULL, NULL, 5, '2024-03-02 03:09:49'),
(19, 1, NULL, NULL, NULL, NULL, 6, '2024-03-02 03:09:49'),
(20, 2, NULL, NULL, NULL, NULL, 6, '2024-03-02 03:09:49'),
(21, 3, NULL, NULL, NULL, NULL, 6, '2024-03-02 03:09:49'),
(22, 4, NULL, NULL, NULL, NULL, 6, '2024-03-02 03:09:49'),
(23, 5, NULL, NULL, NULL, NULL, 6, '2024-03-02 03:09:49'),
(24, 6, NULL, NULL, NULL, NULL, 6, '2024-03-02 03:09:49'),
(25, 1, NULL, NULL, NULL, NULL, 7, '2024-03-02 03:09:49'),
(26, 2, NULL, NULL, NULL, NULL, 7, '2024-03-02 03:09:49'),
(27, 3, NULL, NULL, NULL, NULL, 7, '2024-03-02 03:09:49'),
(28, 4, NULL, NULL, NULL, NULL, 7, '2024-03-02 03:09:49'),
(29, 5, NULL, NULL, NULL, NULL, 7, '2024-03-02 03:09:49'),
(30, 6, NULL, NULL, NULL, NULL, 7, '2024-03-02 03:09:49'),
(31, 1, NULL, NULL, NULL, NULL, 8, '2024-03-02 03:09:49'),
(32, 2, NULL, NULL, NULL, NULL, 8, '2024-03-02 03:09:49'),
(33, 3, NULL, NULL, NULL, NULL, 8, '2024-03-02 03:09:49'),
(34, 4, NULL, NULL, NULL, NULL, 8, '2024-03-02 03:09:49'),
(35, 5, NULL, NULL, NULL, NULL, 8, '2024-03-02 03:09:49'),
(36, 6, NULL, NULL, NULL, NULL, 8, '2024-03-02 03:09:49'),
(37, 1, NULL, NULL, NULL, NULL, 9, '2024-03-02 03:09:49'),
(38, 2, NULL, NULL, NULL, NULL, 9, '2024-03-02 03:09:49'),
(39, 3, NULL, NULL, NULL, NULL, 9, '2024-03-02 03:09:49'),
(40, 4, NULL, NULL, NULL, NULL, 9, '2024-03-02 03:09:49'),
(41, 5, NULL, NULL, NULL, NULL, 9, '2024-03-02 03:09:49'),
(42, 6, NULL, NULL, NULL, NULL, 9, '2024-03-02 03:09:49'),
(43, 1, NULL, NULL, NULL, NULL, 10, '2024-03-02 03:09:49'),
(44, 2, NULL, NULL, NULL, NULL, 10, '2024-03-02 03:09:49'),
(45, 3, NULL, NULL, NULL, NULL, 10, '2024-03-02 03:09:49'),
(46, 4, NULL, NULL, NULL, NULL, 10, '2024-03-02 03:09:49'),
(47, 5, NULL, NULL, NULL, NULL, 10, '2024-03-02 03:09:49'),
(48, 6, NULL, NULL, NULL, NULL, 10, '2024-03-02 03:09:49'),
(49, 1, NULL, NULL, NULL, NULL, 11, '2024-03-02 03:09:49'),
(50, 2, NULL, NULL, NULL, NULL, 11, '2024-03-02 03:09:49'),
(51, 3, NULL, NULL, NULL, NULL, 11, '2024-03-02 03:09:49'),
(52, 4, NULL, NULL, NULL, NULL, 11, '2024-03-02 03:09:49'),
(53, 5, NULL, NULL, NULL, NULL, 11, '2024-03-02 03:09:49'),
(54, 6, NULL, NULL, NULL, NULL, 11, '2024-03-02 03:09:49'),
(55, 1, NULL, NULL, NULL, NULL, 12, '2024-03-02 03:09:49'),
(56, 2, NULL, NULL, NULL, NULL, 12, '2024-03-02 03:09:49'),
(57, 3, NULL, NULL, NULL, NULL, 12, '2024-03-02 03:09:49'),
(58, 4, NULL, NULL, NULL, NULL, 12, '2024-03-02 03:09:49'),
(59, 5, NULL, NULL, NULL, NULL, 12, '2024-03-02 03:09:49'),
(60, 6, NULL, NULL, NULL, NULL, 12, '2024-03-02 03:09:49'),
(61, 1, NULL, NULL, NULL, NULL, 13, '2024-03-02 03:09:49'),
(62, 2, NULL, NULL, NULL, NULL, 13, '2024-03-02 03:09:49'),
(63, 3, NULL, NULL, NULL, NULL, 13, '2024-03-02 03:09:49'),
(64, 4, NULL, NULL, NULL, NULL, 13, '2024-03-02 03:09:49'),
(65, 5, NULL, NULL, NULL, NULL, 13, '2024-03-02 03:09:49'),
(66, 6, NULL, NULL, NULL, NULL, 13, '2024-03-02 03:09:49'),
(67, 1, NULL, NULL, NULL, NULL, 14, '2024-03-02 03:09:49'),
(68, 2, NULL, NULL, NULL, NULL, 14, '2024-03-02 03:09:49'),
(69, 3, NULL, NULL, NULL, NULL, 14, '2024-03-02 03:09:49'),
(70, 4, NULL, NULL, NULL, NULL, 14, '2024-03-02 03:09:49'),
(71, 5, NULL, NULL, NULL, NULL, 14, '2024-03-02 03:09:49'),
(72, 6, NULL, NULL, NULL, NULL, 14, '2024-03-02 03:09:49'),
(73, 1, NULL, NULL, NULL, NULL, 15, '2024-03-02 03:09:49'),
(74, 2, NULL, NULL, NULL, NULL, 15, '2024-03-02 03:09:49'),
(75, 3, NULL, NULL, NULL, NULL, 15, '2024-03-02 03:09:49'),
(76, 4, NULL, NULL, NULL, NULL, 15, '2024-03-02 03:09:49'),
(77, 5, NULL, NULL, NULL, NULL, 15, '2024-03-02 03:09:49'),
(78, 6, NULL, NULL, NULL, NULL, 15, '2024-03-02 03:09:49'),
(79, 1, NULL, NULL, NULL, NULL, 16, '2024-03-02 03:09:49'),
(80, 2, NULL, NULL, NULL, NULL, 16, '2024-03-02 03:09:49'),
(81, 3, NULL, NULL, NULL, NULL, 16, '2024-03-02 03:09:49'),
(82, 4, NULL, NULL, NULL, NULL, 16, '2024-03-02 03:09:49'),
(83, 5, NULL, NULL, NULL, NULL, 16, '2024-03-02 03:09:49'),
(84, 6, NULL, NULL, NULL, NULL, 16, '2024-03-02 03:09:49'),
(85, 1, NULL, NULL, NULL, NULL, 17, '2024-03-02 03:09:49'),
(86, 2, NULL, NULL, NULL, NULL, 17, '2024-03-02 03:09:49'),
(87, 3, NULL, NULL, NULL, NULL, 17, '2024-03-02 03:09:49'),
(88, 4, NULL, NULL, NULL, NULL, 17, '2024-03-02 03:09:49'),
(89, 5, NULL, NULL, NULL, NULL, 17, '2024-03-02 03:09:49'),
(90, 6, NULL, NULL, NULL, NULL, 17, '2024-03-02 03:09:49'),
(91, 1, NULL, NULL, NULL, NULL, 18, '2024-03-02 03:09:49'),
(92, 2, NULL, NULL, NULL, NULL, 18, '2024-03-02 03:09:49'),
(93, 3, NULL, NULL, NULL, NULL, 18, '2024-03-02 03:09:49'),
(94, 4, NULL, NULL, NULL, NULL, 18, '2024-03-02 03:09:49'),
(95, 5, NULL, NULL, NULL, NULL, 18, '2024-03-02 03:09:49'),
(96, 6, NULL, NULL, NULL, NULL, 18, '2024-03-02 03:09:49'),
(97, 1, NULL, NULL, NULL, NULL, 19, '2024-03-02 03:09:49'),
(98, 2, NULL, NULL, NULL, NULL, 19, '2024-03-02 03:09:49'),
(99, 3, NULL, NULL, NULL, NULL, 19, '2024-03-02 03:09:49'),
(100, 4, NULL, NULL, NULL, NULL, 19, '2024-03-02 03:09:49'),
(101, 5, NULL, NULL, NULL, NULL, 19, '2024-03-02 03:09:49'),
(102, 6, NULL, NULL, NULL, NULL, 19, '2024-03-02 03:09:49'),
(103, 1, NULL, NULL, NULL, NULL, 20, '2024-03-02 03:09:49'),
(104, 2, NULL, NULL, NULL, NULL, 20, '2024-03-02 03:09:49'),
(105, 3, NULL, NULL, NULL, NULL, 20, '2024-03-02 03:09:49'),
(106, 4, NULL, NULL, NULL, NULL, 20, '2024-03-02 03:09:49'),
(107, 5, NULL, NULL, NULL, NULL, 20, '2024-03-02 03:09:49'),
(108, 6, NULL, NULL, NULL, NULL, 20, '2024-03-02 03:09:49'),
(109, 1, NULL, NULL, NULL, NULL, 21, '2024-03-02 03:09:49'),
(110, 2, NULL, NULL, NULL, NULL, 21, '2024-03-02 03:09:49'),
(111, 3, NULL, NULL, NULL, NULL, 21, '2024-03-02 03:09:49'),
(112, 4, NULL, NULL, NULL, NULL, 21, '2024-03-02 03:09:49'),
(113, 5, NULL, NULL, NULL, NULL, 21, '2024-03-02 03:09:49'),
(114, 6, NULL, NULL, NULL, NULL, 21, '2024-03-02 03:09:49'),
(115, 1, NULL, NULL, NULL, NULL, 22, '2024-03-02 03:09:49'),
(116, 2, NULL, NULL, NULL, NULL, 22, '2024-03-02 03:09:49'),
(117, 3, NULL, NULL, NULL, NULL, 22, '2024-03-02 03:09:49'),
(118, 4, NULL, NULL, NULL, NULL, 22, '2024-03-02 03:09:49'),
(119, 5, NULL, NULL, NULL, NULL, 22, '2024-03-02 03:09:49'),
(120, 6, NULL, NULL, NULL, NULL, 22, '2024-03-02 03:09:49'),
(121, 1, NULL, NULL, NULL, NULL, 23, '2024-03-02 03:09:49'),
(122, 2, NULL, NULL, NULL, NULL, 23, '2024-03-02 03:09:49'),
(123, 3, NULL, NULL, NULL, NULL, 23, '2024-03-02 03:09:49'),
(124, 4, NULL, NULL, NULL, NULL, 23, '2024-03-02 03:09:49'),
(125, 5, NULL, NULL, NULL, NULL, 23, '2024-03-02 03:09:49'),
(126, 6, NULL, NULL, NULL, NULL, 23, '2024-03-02 03:09:49'),
(127, 1, NULL, NULL, NULL, NULL, 24, '2024-03-02 03:09:49'),
(128, 2, NULL, NULL, NULL, NULL, 24, '2024-03-02 03:09:49'),
(129, 3, NULL, NULL, NULL, NULL, 24, '2024-03-02 03:09:49'),
(130, 4, NULL, NULL, NULL, NULL, 24, '2024-03-02 03:09:49'),
(131, 5, NULL, NULL, NULL, NULL, 24, '2024-03-02 03:09:49'),
(132, 6, NULL, NULL, NULL, NULL, 24, '2024-03-02 03:09:49'),
(164, 7, NULL, NULL, NULL, NULL, 25, '2024-03-02 03:17:00'),
(165, 8, NULL, NULL, NULL, NULL, 25, '2024-03-02 03:17:00'),
(166, 9, NULL, NULL, NULL, NULL, 25, '2024-03-02 03:17:00'),
(167, 10, NULL, NULL, NULL, NULL, 25, '2024-03-02 03:17:00'),
(168, 11, NULL, NULL, NULL, NULL, 25, '2024-03-02 03:17:00'),
(169, 12, NULL, NULL, NULL, NULL, 25, '2024-03-02 03:17:00'),
(170, 7, NULL, NULL, NULL, NULL, 26, '2024-03-02 03:17:00'),
(171, 8, NULL, NULL, NULL, NULL, 26, '2024-03-02 03:17:00'),
(172, 9, NULL, NULL, NULL, NULL, 26, '2024-03-02 03:17:00'),
(173, 10, NULL, NULL, NULL, NULL, 26, '2024-03-02 03:17:00'),
(174, 11, NULL, NULL, NULL, NULL, 26, '2024-03-02 03:17:00'),
(175, 12, NULL, NULL, NULL, NULL, 26, '2024-03-02 03:17:00'),
(176, 7, NULL, NULL, NULL, NULL, 27, '2024-03-02 03:17:00'),
(177, 8, NULL, NULL, NULL, NULL, 27, '2024-03-02 03:17:00'),
(178, 9, NULL, NULL, NULL, NULL, 27, '2024-03-02 03:17:00'),
(179, 10, NULL, NULL, NULL, NULL, 27, '2024-03-02 03:17:00'),
(180, 11, NULL, NULL, NULL, NULL, 27, '2024-03-02 03:17:00'),
(181, 12, NULL, NULL, NULL, NULL, 27, '2024-03-02 03:17:00'),
(182, 7, NULL, NULL, NULL, NULL, 28, '2024-03-02 03:17:00'),
(183, 8, NULL, NULL, NULL, NULL, 28, '2024-03-02 03:17:00'),
(184, 9, NULL, NULL, NULL, NULL, 28, '2024-03-02 03:17:00'),
(185, 10, NULL, NULL, NULL, NULL, 28, '2024-03-02 03:17:00'),
(186, 11, NULL, NULL, NULL, NULL, 28, '2024-03-02 03:17:00'),
(187, 12, NULL, NULL, NULL, NULL, 28, '2024-03-02 03:17:00'),
(188, 7, NULL, NULL, NULL, NULL, 29, '2024-03-02 03:17:00'),
(189, 8, NULL, NULL, NULL, NULL, 29, '2024-03-02 03:17:00'),
(190, 9, NULL, NULL, NULL, NULL, 29, '2024-03-02 03:17:00'),
(191, 10, NULL, NULL, NULL, NULL, 29, '2024-03-02 03:17:00'),
(192, 11, NULL, NULL, NULL, NULL, 29, '2024-03-02 03:17:00'),
(193, 12, NULL, NULL, NULL, NULL, 29, '2024-03-02 03:17:00'),
(194, 7, NULL, NULL, NULL, NULL, 30, '2024-03-02 03:17:00'),
(195, 8, NULL, NULL, NULL, NULL, 30, '2024-03-02 03:17:00'),
(196, 9, NULL, NULL, NULL, NULL, 30, '2024-03-02 03:17:00'),
(197, 10, NULL, NULL, NULL, NULL, 30, '2024-03-02 03:17:00'),
(198, 11, NULL, NULL, NULL, NULL, 30, '2024-03-02 03:17:00'),
(199, 12, NULL, NULL, NULL, NULL, 30, '2024-03-02 03:17:00'),
(200, 7, NULL, NULL, NULL, NULL, 31, '2024-03-02 03:17:00'),
(201, 8, NULL, NULL, NULL, NULL, 31, '2024-03-02 03:17:00'),
(202, 9, NULL, NULL, NULL, NULL, 31, '2024-03-02 03:17:00'),
(203, 10, NULL, NULL, NULL, NULL, 31, '2024-03-02 03:17:00'),
(204, 11, NULL, NULL, NULL, NULL, 31, '2024-03-02 03:17:00'),
(205, 12, NULL, NULL, NULL, NULL, 31, '2024-03-02 03:17:00'),
(206, 7, NULL, NULL, NULL, NULL, 32, '2024-03-02 03:17:00'),
(207, 8, NULL, NULL, NULL, NULL, 32, '2024-03-02 03:17:00'),
(208, 9, NULL, NULL, NULL, NULL, 32, '2024-03-02 03:17:00'),
(209, 10, NULL, NULL, NULL, NULL, 32, '2024-03-02 03:17:00'),
(210, 11, NULL, NULL, NULL, NULL, 32, '2024-03-02 03:17:00'),
(211, 12, NULL, NULL, NULL, NULL, 32, '2024-03-02 03:17:00'),
(212, 7, NULL, NULL, NULL, NULL, 33, '2024-03-02 03:17:00'),
(213, 8, NULL, NULL, NULL, NULL, 33, '2024-03-02 03:17:00'),
(214, 9, NULL, NULL, NULL, NULL, 33, '2024-03-02 03:17:00'),
(215, 10, NULL, NULL, NULL, NULL, 33, '2024-03-02 03:17:00'),
(216, 11, NULL, NULL, NULL, NULL, 33, '2024-03-02 03:17:00'),
(217, 12, NULL, NULL, NULL, NULL, 33, '2024-03-02 03:17:00'),
(218, 7, NULL, NULL, NULL, NULL, 34, '2024-03-02 03:17:00'),
(219, 8, NULL, NULL, NULL, NULL, 34, '2024-03-02 03:17:00'),
(220, 9, NULL, NULL, NULL, NULL, 34, '2024-03-02 03:17:00'),
(221, 10, NULL, NULL, NULL, NULL, 34, '2024-03-02 03:17:00'),
(222, 11, NULL, NULL, NULL, NULL, 34, '2024-03-02 03:17:00'),
(223, 12, NULL, NULL, NULL, NULL, 34, '2024-03-02 03:17:00'),
(224, 7, NULL, NULL, NULL, NULL, 35, '2024-03-02 03:17:00'),
(225, 8, NULL, NULL, NULL, NULL, 35, '2024-03-02 03:17:00'),
(226, 9, NULL, NULL, NULL, NULL, 35, '2024-03-02 03:17:00'),
(227, 10, NULL, NULL, NULL, NULL, 35, '2024-03-02 03:17:00'),
(228, 11, NULL, NULL, NULL, NULL, 35, '2024-03-02 03:17:00'),
(229, 12, NULL, NULL, NULL, NULL, 35, '2024-03-02 03:17:00'),
(230, 7, NULL, NULL, NULL, NULL, 36, '2024-03-02 03:17:00'),
(231, 8, NULL, NULL, NULL, NULL, 36, '2024-03-02 03:17:00'),
(232, 9, NULL, NULL, NULL, NULL, 36, '2024-03-02 03:17:00'),
(233, 10, NULL, NULL, NULL, NULL, 36, '2024-03-02 03:17:00'),
(234, 11, NULL, NULL, NULL, NULL, 36, '2024-03-02 03:17:00'),
(235, 12, NULL, NULL, NULL, NULL, 36, '2024-03-02 03:17:00'),
(236, 7, NULL, NULL, NULL, NULL, 37, '2024-03-02 03:17:00'),
(237, 8, NULL, NULL, NULL, NULL, 37, '2024-03-02 03:17:00'),
(238, 9, NULL, NULL, NULL, NULL, 37, '2024-03-02 03:17:00'),
(239, 10, NULL, NULL, NULL, NULL, 37, '2024-03-02 03:17:00'),
(240, 11, NULL, NULL, NULL, NULL, 37, '2024-03-02 03:17:00'),
(241, 12, NULL, NULL, NULL, NULL, 37, '2024-03-02 03:17:00'),
(242, 7, NULL, NULL, NULL, NULL, 38, '2024-03-02 03:17:00'),
(243, 8, NULL, NULL, NULL, NULL, 38, '2024-03-02 03:17:00'),
(244, 9, NULL, NULL, NULL, NULL, 38, '2024-03-02 03:17:00'),
(245, 10, NULL, NULL, NULL, NULL, 38, '2024-03-02 03:17:00'),
(246, 11, NULL, NULL, NULL, NULL, 38, '2024-03-02 03:17:00'),
(247, 12, NULL, NULL, NULL, NULL, 38, '2024-03-02 03:17:00'),
(248, 7, NULL, NULL, NULL, NULL, 39, '2024-03-02 03:17:00'),
(249, 8, NULL, NULL, NULL, NULL, 39, '2024-03-02 03:17:00'),
(250, 9, NULL, NULL, NULL, NULL, 39, '2024-03-02 03:17:00'),
(251, 10, NULL, NULL, NULL, NULL, 39, '2024-03-02 03:17:00'),
(252, 11, NULL, NULL, NULL, NULL, 39, '2024-03-02 03:17:00'),
(253, 12, NULL, NULL, NULL, NULL, 39, '2024-03-02 03:17:00'),
(254, 7, NULL, NULL, NULL, NULL, 40, '2024-03-02 03:17:00'),
(255, 8, NULL, NULL, NULL, NULL, 40, '2024-03-02 03:17:00'),
(256, 9, NULL, NULL, NULL, NULL, 40, '2024-03-02 03:17:00'),
(257, 10, NULL, NULL, NULL, NULL, 40, '2024-03-02 03:17:00'),
(258, 11, NULL, NULL, NULL, NULL, 40, '2024-03-02 03:17:00'),
(259, 12, NULL, NULL, NULL, NULL, 40, '2024-03-02 03:17:00'),
(260, 7, NULL, NULL, NULL, NULL, 41, '2024-03-02 03:17:00'),
(261, 8, NULL, NULL, NULL, NULL, 41, '2024-03-02 03:17:00'),
(262, 9, NULL, NULL, NULL, NULL, 41, '2024-03-02 03:17:00'),
(263, 10, NULL, NULL, NULL, NULL, 41, '2024-03-02 03:17:00'),
(264, 11, NULL, NULL, NULL, NULL, 41, '2024-03-02 03:17:00'),
(265, 12, NULL, NULL, NULL, NULL, 41, '2024-03-02 03:17:00'),
(266, 7, NULL, NULL, NULL, NULL, 42, '2024-03-02 03:17:00'),
(267, 8, NULL, NULL, NULL, NULL, 42, '2024-03-02 03:17:00'),
(268, 9, NULL, NULL, NULL, NULL, 42, '2024-03-02 03:17:00'),
(269, 10, NULL, NULL, NULL, NULL, 42, '2024-03-02 03:17:00'),
(270, 11, NULL, NULL, NULL, NULL, 42, '2024-03-02 03:17:00'),
(271, 12, NULL, NULL, NULL, NULL, 42, '2024-03-02 03:17:00'),
(272, 7, NULL, NULL, NULL, NULL, 43, '2024-03-02 03:17:00'),
(273, 8, NULL, NULL, NULL, NULL, 43, '2024-03-02 03:17:00'),
(274, 9, NULL, NULL, NULL, NULL, 43, '2024-03-02 03:17:00'),
(275, 10, NULL, NULL, NULL, NULL, 43, '2024-03-02 03:17:00'),
(276, 11, NULL, NULL, NULL, NULL, 43, '2024-03-02 03:17:00'),
(277, 12, NULL, NULL, NULL, NULL, 43, '2024-03-02 03:17:00'),
(278, 7, NULL, NULL, NULL, NULL, 44, '2024-03-02 03:17:00'),
(279, 8, NULL, NULL, NULL, NULL, 44, '2024-03-02 03:17:00'),
(280, 9, NULL, NULL, NULL, NULL, 44, '2024-03-02 03:17:00'),
(281, 10, NULL, NULL, NULL, NULL, 44, '2024-03-02 03:17:00'),
(282, 11, NULL, NULL, NULL, NULL, 44, '2024-03-02 03:17:00'),
(283, 12, NULL, NULL, NULL, NULL, 44, '2024-03-02 03:17:00'),
(284, 13, NULL, NULL, NULL, NULL, 45, '2024-03-02 03:19:40'),
(285, 14, NULL, NULL, NULL, NULL, 45, '2024-03-02 03:19:40'),
(286, 15, NULL, NULL, NULL, NULL, 45, '2024-03-02 03:19:40'),
(287, 16, NULL, NULL, NULL, NULL, 45, '2024-03-02 03:19:40'),
(288, 17, NULL, NULL, NULL, NULL, 45, '2024-03-02 03:19:40'),
(289, 18, NULL, NULL, NULL, NULL, 45, '2024-03-02 03:19:40'),
(290, 19, NULL, NULL, NULL, NULL, 45, '2024-03-02 03:19:40'),
(291, 13, NULL, NULL, NULL, NULL, 46, '2024-03-02 03:19:40'),
(292, 14, NULL, NULL, NULL, NULL, 46, '2024-03-02 03:19:40'),
(293, 15, NULL, NULL, NULL, NULL, 46, '2024-03-02 03:19:40'),
(294, 16, NULL, NULL, NULL, NULL, 46, '2024-03-02 03:19:40'),
(295, 17, NULL, NULL, NULL, NULL, 46, '2024-03-02 03:19:40'),
(296, 18, NULL, NULL, NULL, NULL, 46, '2024-03-02 03:19:40'),
(297, 19, NULL, NULL, NULL, NULL, 46, '2024-03-02 03:19:40'),
(298, 13, NULL, NULL, NULL, NULL, 47, '2024-03-02 03:19:40'),
(299, 14, NULL, NULL, NULL, NULL, 47, '2024-03-02 03:19:40'),
(300, 15, NULL, NULL, NULL, NULL, 47, '2024-03-02 03:19:40'),
(301, 16, NULL, NULL, NULL, NULL, 47, '2024-03-02 03:19:40'),
(302, 17, NULL, NULL, NULL, NULL, 47, '2024-03-02 03:19:40'),
(303, 18, NULL, NULL, NULL, NULL, 47, '2024-03-02 03:19:40'),
(304, 19, NULL, NULL, NULL, NULL, 47, '2024-03-02 03:19:40'),
(305, 13, NULL, NULL, NULL, NULL, 48, '2024-03-02 03:19:40'),
(306, 14, NULL, NULL, NULL, NULL, 48, '2024-03-02 03:19:40'),
(307, 15, NULL, NULL, NULL, NULL, 48, '2024-03-02 03:19:40'),
(308, 16, NULL, NULL, NULL, NULL, 48, '2024-03-02 03:19:40'),
(309, 17, NULL, NULL, NULL, NULL, 48, '2024-03-02 03:19:40'),
(310, 18, NULL, NULL, NULL, NULL, 48, '2024-03-02 03:19:40'),
(311, 19, NULL, NULL, NULL, NULL, 48, '2024-03-02 03:19:40'),
(312, 13, NULL, NULL, NULL, NULL, 49, '2024-03-02 03:19:40'),
(313, 14, NULL, NULL, NULL, NULL, 49, '2024-03-02 03:19:40'),
(314, 15, NULL, NULL, NULL, NULL, 49, '2024-03-02 03:19:40'),
(315, 16, NULL, NULL, NULL, NULL, 49, '2024-03-02 03:19:40'),
(316, 17, NULL, NULL, NULL, NULL, 49, '2024-03-02 03:19:40'),
(317, 18, NULL, NULL, NULL, NULL, 49, '2024-03-02 03:19:40'),
(318, 19, NULL, NULL, NULL, NULL, 49, '2024-03-02 03:19:40'),
(319, 13, NULL, NULL, NULL, NULL, 50, '2024-03-02 03:19:40'),
(320, 14, NULL, NULL, NULL, NULL, 50, '2024-03-02 03:19:40'),
(321, 15, NULL, NULL, NULL, NULL, 50, '2024-03-02 03:19:40'),
(322, 16, NULL, NULL, NULL, NULL, 50, '2024-03-02 03:19:40'),
(323, 17, NULL, NULL, NULL, NULL, 50, '2024-03-02 03:19:40'),
(324, 18, NULL, NULL, NULL, NULL, 50, '2024-03-02 03:19:40'),
(325, 19, NULL, NULL, NULL, NULL, 50, '2024-03-02 03:19:40'),
(326, 13, NULL, NULL, NULL, NULL, 51, '2024-03-02 03:19:40'),
(327, 14, NULL, NULL, NULL, NULL, 51, '2024-03-02 03:19:40'),
(328, 15, NULL, NULL, NULL, NULL, 51, '2024-03-02 03:19:40'),
(329, 16, NULL, NULL, NULL, NULL, 51, '2024-03-02 03:19:40'),
(330, 17, NULL, NULL, NULL, NULL, 51, '2024-03-02 03:19:40'),
(331, 18, NULL, NULL, NULL, NULL, 51, '2024-03-02 03:19:40'),
(332, 19, NULL, NULL, NULL, NULL, 51, '2024-03-02 03:19:40'),
(333, 13, NULL, NULL, NULL, NULL, 52, '2024-03-02 03:19:40'),
(334, 14, NULL, NULL, NULL, NULL, 52, '2024-03-02 03:19:40'),
(335, 15, NULL, NULL, NULL, NULL, 52, '2024-03-02 03:19:40'),
(336, 16, NULL, NULL, NULL, NULL, 52, '2024-03-02 03:19:40'),
(337, 17, NULL, NULL, NULL, NULL, 52, '2024-03-02 03:19:40'),
(338, 18, NULL, NULL, NULL, NULL, 52, '2024-03-02 03:19:40'),
(339, 19, NULL, NULL, NULL, NULL, 52, '2024-03-02 03:19:40'),
(340, 13, NULL, NULL, NULL, NULL, 53, '2024-03-02 03:19:40'),
(341, 14, NULL, NULL, NULL, NULL, 53, '2024-03-02 03:19:40'),
(342, 15, NULL, NULL, NULL, NULL, 53, '2024-03-02 03:19:40'),
(343, 16, NULL, NULL, NULL, NULL, 53, '2024-03-02 03:19:40'),
(344, 17, NULL, NULL, NULL, NULL, 53, '2024-03-02 03:19:40'),
(345, 18, NULL, NULL, NULL, NULL, 53, '2024-03-02 03:19:40'),
(346, 19, NULL, NULL, NULL, NULL, 53, '2024-03-02 03:19:40'),
(347, 13, NULL, NULL, NULL, NULL, 54, '2024-03-02 03:19:40'),
(348, 14, NULL, NULL, NULL, NULL, 54, '2024-03-02 03:19:40'),
(349, 15, NULL, NULL, NULL, NULL, 54, '2024-03-02 03:19:40'),
(350, 16, NULL, NULL, NULL, NULL, 54, '2024-03-02 03:19:40'),
(351, 17, NULL, NULL, NULL, NULL, 54, '2024-03-02 03:19:40'),
(352, 18, NULL, NULL, NULL, NULL, 54, '2024-03-02 03:19:40'),
(353, 19, NULL, NULL, NULL, NULL, 54, '2024-03-02 03:19:40'),
(354, 13, NULL, NULL, NULL, NULL, 55, '2024-03-02 03:19:40'),
(355, 14, NULL, NULL, NULL, NULL, 55, '2024-03-02 03:19:40'),
(356, 15, NULL, NULL, NULL, NULL, 55, '2024-03-02 03:19:40'),
(357, 16, NULL, NULL, NULL, NULL, 55, '2024-03-02 03:19:40'),
(358, 17, NULL, NULL, NULL, NULL, 55, '2024-03-02 03:19:40'),
(359, 18, NULL, NULL, NULL, NULL, 55, '2024-03-02 03:19:40'),
(360, 19, NULL, NULL, NULL, NULL, 55, '2024-03-02 03:19:40'),
(361, 13, NULL, NULL, NULL, NULL, 56, '2024-03-02 03:19:40'),
(362, 14, NULL, NULL, NULL, NULL, 56, '2024-03-02 03:19:40'),
(363, 15, NULL, NULL, NULL, NULL, 56, '2024-03-02 03:19:40'),
(364, 16, NULL, NULL, NULL, NULL, 56, '2024-03-02 03:19:40'),
(365, 17, NULL, NULL, NULL, NULL, 56, '2024-03-02 03:19:40'),
(366, 18, NULL, NULL, NULL, NULL, 56, '2024-03-02 03:19:40'),
(367, 19, NULL, NULL, NULL, NULL, 56, '2024-03-02 03:19:40'),
(368, 13, NULL, NULL, NULL, NULL, 57, '2024-03-02 03:19:40'),
(369, 14, NULL, NULL, NULL, NULL, 57, '2024-03-02 03:19:40'),
(370, 15, NULL, NULL, NULL, NULL, 57, '2024-03-02 03:19:40'),
(371, 16, NULL, NULL, NULL, NULL, 57, '2024-03-02 03:19:40'),
(372, 17, NULL, NULL, NULL, NULL, 57, '2024-03-02 03:19:40'),
(373, 18, NULL, NULL, NULL, NULL, 57, '2024-03-02 03:19:40'),
(374, 19, NULL, NULL, NULL, NULL, 57, '2024-03-02 03:19:40'),
(375, 13, NULL, NULL, NULL, NULL, 58, '2024-03-02 03:19:40'),
(376, 14, NULL, NULL, NULL, NULL, 58, '2024-03-02 03:19:40'),
(377, 15, NULL, NULL, NULL, NULL, 58, '2024-03-02 03:19:40'),
(378, 16, NULL, NULL, NULL, NULL, 58, '2024-03-02 03:19:40'),
(379, 17, NULL, NULL, NULL, NULL, 58, '2024-03-02 03:19:40'),
(380, 18, NULL, NULL, NULL, NULL, 58, '2024-03-02 03:19:40'),
(381, 19, NULL, NULL, NULL, NULL, 58, '2024-03-02 03:19:40'),
(382, 13, NULL, NULL, NULL, NULL, 59, '2024-03-02 03:19:40'),
(383, 14, NULL, NULL, NULL, NULL, 59, '2024-03-02 03:19:40'),
(384, 15, NULL, NULL, NULL, NULL, 59, '2024-03-02 03:19:40'),
(385, 16, NULL, NULL, NULL, NULL, 59, '2024-03-02 03:19:40'),
(386, 17, NULL, NULL, NULL, NULL, 59, '2024-03-02 03:19:40'),
(387, 18, NULL, NULL, NULL, NULL, 59, '2024-03-02 03:19:40'),
(388, 19, NULL, NULL, NULL, NULL, 59, '2024-03-02 03:19:40'),
(389, 13, NULL, NULL, NULL, NULL, 60, '2024-03-02 03:19:40'),
(390, 14, NULL, NULL, NULL, NULL, 60, '2024-03-02 03:19:40'),
(391, 15, NULL, NULL, NULL, NULL, 60, '2024-03-02 03:19:40'),
(392, 16, NULL, NULL, NULL, NULL, 60, '2024-03-02 03:19:40'),
(393, 17, NULL, NULL, NULL, NULL, 60, '2024-03-02 03:19:40'),
(394, 18, NULL, NULL, NULL, NULL, 60, '2024-03-02 03:19:40'),
(395, 19, NULL, NULL, NULL, NULL, 60, '2024-03-02 03:19:40'),
(396, 13, NULL, NULL, NULL, NULL, 61, '2024-03-02 03:19:40'),
(397, 14, NULL, NULL, NULL, NULL, 61, '2024-03-02 03:19:40'),
(398, 15, NULL, NULL, NULL, NULL, 61, '2024-03-02 03:19:40'),
(399, 16, NULL, NULL, NULL, NULL, 61, '2024-03-02 03:19:40'),
(400, 17, NULL, NULL, NULL, NULL, 61, '2024-03-02 03:19:40'),
(401, 18, NULL, NULL, NULL, NULL, 61, '2024-03-02 03:19:40'),
(402, 19, NULL, NULL, NULL, NULL, 61, '2024-03-02 03:19:40'),
(403, 13, NULL, NULL, NULL, NULL, 62, '2024-03-02 03:19:40'),
(404, 14, NULL, NULL, NULL, NULL, 62, '2024-03-02 03:19:40'),
(405, 15, NULL, NULL, NULL, NULL, 62, '2024-03-02 03:19:40'),
(406, 16, NULL, NULL, NULL, NULL, 62, '2024-03-02 03:19:40'),
(407, 17, NULL, NULL, NULL, NULL, 62, '2024-03-02 03:19:40'),
(408, 18, NULL, NULL, NULL, NULL, 62, '2024-03-02 03:19:40'),
(409, 19, NULL, NULL, NULL, NULL, 62, '2024-03-02 03:19:40'),
(410, 13, NULL, NULL, NULL, NULL, 63, '2024-03-02 03:19:40'),
(411, 14, NULL, NULL, NULL, NULL, 63, '2024-03-02 03:19:40'),
(412, 15, NULL, NULL, NULL, NULL, 63, '2024-03-02 03:19:40'),
(413, 16, NULL, NULL, NULL, NULL, 63, '2024-03-02 03:19:40'),
(414, 17, NULL, NULL, NULL, NULL, 63, '2024-03-02 03:19:40'),
(415, 18, NULL, NULL, NULL, NULL, 63, '2024-03-02 03:19:40'),
(416, 19, NULL, NULL, NULL, NULL, 63, '2024-03-02 03:19:40'),
(417, 13, NULL, NULL, NULL, NULL, 64, '2024-03-02 03:19:40'),
(418, 14, NULL, NULL, NULL, NULL, 64, '2024-03-02 03:19:40'),
(419, 15, NULL, NULL, NULL, NULL, 64, '2024-03-02 03:19:40'),
(420, 16, NULL, NULL, NULL, NULL, 64, '2024-03-02 03:19:40'),
(421, 17, NULL, NULL, NULL, NULL, 64, '2024-03-02 03:19:40'),
(422, 18, NULL, NULL, NULL, NULL, 64, '2024-03-02 03:19:40'),
(423, 19, NULL, NULL, NULL, NULL, 64, '2024-03-02 03:19:40'),
(424, 20, NULL, NULL, NULL, NULL, 65, '2024-03-02 03:22:49'),
(425, 21, NULL, NULL, NULL, NULL, 65, '2024-03-02 03:22:49'),
(426, 22, NULL, NULL, NULL, NULL, 65, '2024-03-02 03:22:49'),
(427, 23, NULL, NULL, NULL, NULL, 65, '2024-03-02 03:22:49'),
(428, 24, NULL, NULL, NULL, NULL, 65, '2024-03-02 03:22:49'),
(429, 25, NULL, NULL, NULL, NULL, 65, '2024-03-02 03:22:49'),
(430, 26, NULL, NULL, NULL, NULL, 65, '2024-03-02 03:22:49'),
(431, 20, NULL, NULL, NULL, NULL, 66, '2024-03-02 03:22:49'),
(432, 21, NULL, NULL, NULL, NULL, 66, '2024-03-02 03:22:49'),
(433, 22, NULL, NULL, NULL, NULL, 66, '2024-03-02 03:22:49'),
(434, 23, NULL, NULL, NULL, NULL, 66, '2024-03-02 03:22:49'),
(435, 24, NULL, NULL, NULL, NULL, 66, '2024-03-02 03:22:49'),
(436, 25, NULL, NULL, NULL, NULL, 66, '2024-03-02 03:22:49'),
(437, 26, NULL, NULL, NULL, NULL, 66, '2024-03-02 03:22:49'),
(438, 20, NULL, NULL, NULL, NULL, 67, '2024-03-02 03:22:49'),
(439, 21, NULL, NULL, NULL, NULL, 67, '2024-03-02 03:22:49'),
(440, 22, NULL, NULL, NULL, NULL, 67, '2024-03-02 03:22:49'),
(441, 23, NULL, NULL, NULL, NULL, 67, '2024-03-02 03:22:49'),
(442, 24, NULL, NULL, NULL, NULL, 67, '2024-03-02 03:22:49'),
(443, 25, NULL, NULL, NULL, NULL, 67, '2024-03-02 03:22:49'),
(444, 26, NULL, NULL, NULL, NULL, 67, '2024-03-02 03:22:49'),
(445, 20, NULL, NULL, NULL, NULL, 68, '2024-03-02 03:22:49'),
(446, 21, NULL, NULL, NULL, NULL, 68, '2024-03-02 03:22:49'),
(447, 22, NULL, NULL, NULL, NULL, 68, '2024-03-02 03:22:49'),
(448, 23, NULL, NULL, NULL, NULL, 68, '2024-03-02 03:22:49'),
(449, 24, NULL, NULL, NULL, NULL, 68, '2024-03-02 03:22:49'),
(450, 25, NULL, NULL, NULL, NULL, 68, '2024-03-02 03:22:49'),
(451, 26, NULL, NULL, NULL, NULL, 68, '2024-03-02 03:22:49'),
(452, 20, NULL, NULL, NULL, NULL, 69, '2024-03-02 03:22:49'),
(453, 21, NULL, NULL, NULL, NULL, 69, '2024-03-02 03:22:49'),
(454, 22, NULL, NULL, NULL, NULL, 69, '2024-03-02 03:22:49'),
(455, 23, NULL, NULL, NULL, NULL, 69, '2024-03-02 03:22:49'),
(456, 24, NULL, NULL, NULL, NULL, 69, '2024-03-02 03:22:49'),
(457, 25, NULL, NULL, NULL, NULL, 69, '2024-03-02 03:22:49'),
(458, 26, NULL, NULL, NULL, NULL, 69, '2024-03-02 03:22:49'),
(459, 20, NULL, NULL, NULL, NULL, 70, '2024-03-02 03:22:49'),
(460, 21, NULL, NULL, NULL, NULL, 70, '2024-03-02 03:22:49'),
(461, 22, NULL, NULL, NULL, NULL, 70, '2024-03-02 03:22:49'),
(462, 23, NULL, NULL, NULL, NULL, 70, '2024-03-02 03:22:49'),
(463, 24, NULL, NULL, NULL, NULL, 70, '2024-03-02 03:22:49'),
(464, 25, NULL, NULL, NULL, NULL, 70, '2024-03-02 03:22:49'),
(465, 26, NULL, NULL, NULL, NULL, 70, '2024-03-02 03:22:49'),
(466, 20, NULL, NULL, NULL, NULL, 71, '2024-03-02 03:22:49'),
(467, 21, NULL, NULL, NULL, NULL, 71, '2024-03-02 03:22:49'),
(468, 22, NULL, NULL, NULL, NULL, 71, '2024-03-02 03:22:49'),
(469, 23, NULL, NULL, NULL, NULL, 71, '2024-03-02 03:22:49'),
(470, 24, NULL, NULL, NULL, NULL, 71, '2024-03-02 03:22:49'),
(471, 25, NULL, NULL, NULL, NULL, 71, '2024-03-02 03:22:49'),
(472, 26, NULL, NULL, NULL, NULL, 71, '2024-03-02 03:22:49'),
(473, 20, NULL, NULL, NULL, NULL, 72, '2024-03-02 03:22:49'),
(474, 21, NULL, NULL, NULL, NULL, 72, '2024-03-02 03:22:49'),
(475, 22, NULL, NULL, NULL, NULL, 72, '2024-03-02 03:22:49'),
(476, 23, NULL, NULL, NULL, NULL, 72, '2024-03-02 03:22:49'),
(477, 24, NULL, NULL, NULL, NULL, 72, '2024-03-02 03:22:49'),
(478, 25, NULL, NULL, NULL, NULL, 72, '2024-03-02 03:22:49'),
(479, 26, NULL, NULL, NULL, NULL, 72, '2024-03-02 03:22:49'),
(480, 20, NULL, NULL, NULL, NULL, 73, '2024-03-02 03:22:49'),
(481, 21, NULL, NULL, NULL, NULL, 73, '2024-03-02 03:22:49'),
(482, 22, NULL, NULL, NULL, NULL, 73, '2024-03-02 03:22:49'),
(483, 23, NULL, NULL, NULL, NULL, 73, '2024-03-02 03:22:49'),
(484, 24, NULL, NULL, NULL, NULL, 73, '2024-03-02 03:22:49'),
(485, 25, NULL, NULL, NULL, NULL, 73, '2024-03-02 03:22:49'),
(486, 26, NULL, NULL, NULL, NULL, 73, '2024-03-02 03:22:49'),
(487, 20, NULL, NULL, NULL, NULL, 74, '2024-03-02 03:22:49'),
(488, 21, NULL, NULL, NULL, NULL, 74, '2024-03-02 03:22:49'),
(489, 22, NULL, NULL, NULL, NULL, 74, '2024-03-02 03:22:49'),
(490, 23, NULL, NULL, NULL, NULL, 74, '2024-03-02 03:22:49'),
(491, 24, NULL, NULL, NULL, NULL, 74, '2024-03-02 03:22:49'),
(492, 25, NULL, NULL, NULL, NULL, 74, '2024-03-02 03:22:49'),
(493, 26, NULL, NULL, NULL, NULL, 74, '2024-03-02 03:22:49'),
(494, 20, NULL, NULL, NULL, NULL, 75, '2024-03-02 03:22:49'),
(495, 21, NULL, NULL, NULL, NULL, 75, '2024-03-02 03:22:49'),
(496, 22, NULL, NULL, NULL, NULL, 75, '2024-03-02 03:22:49'),
(497, 23, NULL, NULL, NULL, NULL, 75, '2024-03-02 03:22:49'),
(498, 24, NULL, NULL, NULL, NULL, 75, '2024-03-02 03:22:49'),
(499, 25, NULL, NULL, NULL, NULL, 75, '2024-03-02 03:22:49'),
(500, 26, NULL, NULL, NULL, NULL, 75, '2024-03-02 03:22:49'),
(501, 20, NULL, NULL, NULL, NULL, 76, '2024-03-02 03:22:49'),
(502, 21, NULL, NULL, NULL, NULL, 76, '2024-03-02 03:22:49'),
(503, 22, NULL, NULL, NULL, NULL, 76, '2024-03-02 03:22:49'),
(504, 23, NULL, NULL, NULL, NULL, 76, '2024-03-02 03:22:49'),
(505, 24, NULL, NULL, NULL, NULL, 76, '2024-03-02 03:22:49'),
(506, 25, NULL, NULL, NULL, NULL, 76, '2024-03-02 03:22:49'),
(507, 26, NULL, NULL, NULL, NULL, 76, '2024-03-02 03:22:49'),
(508, 20, NULL, NULL, NULL, NULL, 77, '2024-03-02 03:22:49'),
(509, 21, NULL, NULL, NULL, NULL, 77, '2024-03-02 03:22:49'),
(510, 22, NULL, NULL, NULL, NULL, 77, '2024-03-02 03:22:49'),
(511, 23, NULL, NULL, NULL, NULL, 77, '2024-03-02 03:22:49'),
(512, 24, NULL, NULL, NULL, NULL, 77, '2024-03-02 03:22:49'),
(513, 25, NULL, NULL, NULL, NULL, 77, '2024-03-02 03:22:49'),
(514, 26, NULL, NULL, NULL, NULL, 77, '2024-03-02 03:22:49'),
(515, 20, NULL, NULL, NULL, NULL, 78, '2024-03-02 03:22:49'),
(516, 21, NULL, NULL, NULL, NULL, 78, '2024-03-02 03:22:49'),
(517, 22, NULL, NULL, NULL, NULL, 78, '2024-03-02 03:22:49'),
(518, 23, NULL, NULL, NULL, NULL, 78, '2024-03-02 03:22:49'),
(519, 24, NULL, NULL, NULL, NULL, 78, '2024-03-02 03:22:49'),
(520, 25, NULL, NULL, NULL, NULL, 78, '2024-03-02 03:22:49'),
(521, 26, NULL, NULL, NULL, NULL, 78, '2024-03-02 03:22:49'),
(522, 20, NULL, NULL, NULL, NULL, 79, '2024-03-02 03:22:49'),
(523, 21, NULL, NULL, NULL, NULL, 79, '2024-03-02 03:22:49'),
(524, 22, NULL, NULL, NULL, NULL, 79, '2024-03-02 03:22:49'),
(525, 23, NULL, NULL, NULL, NULL, 79, '2024-03-02 03:22:49'),
(526, 24, NULL, NULL, NULL, NULL, 79, '2024-03-02 03:22:49'),
(527, 25, NULL, NULL, NULL, NULL, 79, '2024-03-02 03:22:49'),
(528, 26, NULL, NULL, NULL, NULL, 79, '2024-03-02 03:22:49'),
(529, 20, NULL, NULL, NULL, NULL, 80, '2024-03-02 03:22:49'),
(530, 21, NULL, NULL, NULL, NULL, 80, '2024-03-02 03:22:49'),
(531, 22, NULL, NULL, NULL, NULL, 80, '2024-03-02 03:22:49'),
(532, 23, NULL, NULL, NULL, NULL, 80, '2024-03-02 03:22:49'),
(533, 24, NULL, NULL, NULL, NULL, 80, '2024-03-02 03:22:49'),
(534, 25, NULL, NULL, NULL, NULL, 80, '2024-03-02 03:22:49'),
(535, 26, NULL, NULL, NULL, NULL, 80, '2024-03-02 03:22:49'),
(536, 20, NULL, NULL, NULL, NULL, 81, '2024-03-02 03:22:49'),
(537, 21, NULL, NULL, NULL, NULL, 81, '2024-03-02 03:22:49'),
(538, 22, NULL, NULL, NULL, NULL, 81, '2024-03-02 03:22:49'),
(539, 23, NULL, NULL, NULL, NULL, 81, '2024-03-02 03:22:49'),
(540, 24, NULL, NULL, NULL, NULL, 81, '2024-03-02 03:22:49'),
(541, 25, NULL, NULL, NULL, NULL, 81, '2024-03-02 03:22:49'),
(542, 26, NULL, NULL, NULL, NULL, 81, '2024-03-02 03:22:49'),
(543, 20, NULL, NULL, NULL, NULL, 82, '2024-03-02 03:22:49'),
(544, 21, NULL, NULL, NULL, NULL, 82, '2024-03-02 03:22:49'),
(545, 22, NULL, NULL, NULL, NULL, 82, '2024-03-02 03:22:49'),
(546, 23, NULL, NULL, NULL, NULL, 82, '2024-03-02 03:22:49'),
(547, 24, NULL, NULL, NULL, NULL, 82, '2024-03-02 03:22:49'),
(548, 25, NULL, NULL, NULL, NULL, 82, '2024-03-02 03:22:49'),
(549, 26, NULL, NULL, NULL, NULL, 82, '2024-03-02 03:22:49'),
(550, 20, NULL, NULL, NULL, NULL, 83, '2024-03-02 03:22:49'),
(551, 21, NULL, NULL, NULL, NULL, 83, '2024-03-02 03:22:49'),
(552, 22, NULL, NULL, NULL, NULL, 83, '2024-03-02 03:22:49'),
(553, 23, NULL, NULL, NULL, NULL, 83, '2024-03-02 03:22:49'),
(554, 24, NULL, NULL, NULL, NULL, 83, '2024-03-02 03:22:49'),
(555, 25, NULL, NULL, NULL, NULL, 83, '2024-03-02 03:22:49'),
(556, 26, NULL, NULL, NULL, NULL, 83, '2024-03-02 03:22:49'),
(557, 20, NULL, NULL, NULL, NULL, 84, '2024-03-02 03:22:49'),
(558, 21, NULL, NULL, NULL, NULL, 84, '2024-03-02 03:22:49'),
(559, 22, NULL, NULL, NULL, NULL, 84, '2024-03-02 03:22:49'),
(560, 23, NULL, NULL, NULL, NULL, 84, '2024-03-02 03:22:49'),
(561, 24, NULL, NULL, NULL, NULL, 84, '2024-03-02 03:22:49'),
(562, 25, NULL, NULL, NULL, NULL, 84, '2024-03-02 03:22:49'),
(563, 26, NULL, NULL, NULL, NULL, 84, '2024-03-02 03:22:49'),
(564, 27, NULL, NULL, NULL, NULL, 85, '2024-03-02 03:27:24'),
(565, 28, NULL, NULL, NULL, NULL, 85, '2024-03-02 03:27:24'),
(566, 29, NULL, NULL, NULL, NULL, 85, '2024-03-02 03:27:24'),
(567, 30, NULL, NULL, NULL, NULL, 85, '2024-03-02 03:27:24'),
(568, 31, NULL, NULL, NULL, NULL, 85, '2024-03-02 03:27:24'),
(569, 32, NULL, NULL, NULL, NULL, 85, '2024-03-02 03:27:24'),
(570, 27, NULL, NULL, NULL, NULL, 86, '2024-03-02 03:27:24'),
(571, 28, NULL, NULL, NULL, NULL, 86, '2024-03-02 03:27:24'),
(572, 29, NULL, NULL, NULL, NULL, 86, '2024-03-02 03:27:24'),
(573, 30, NULL, NULL, NULL, NULL, 86, '2024-03-02 03:27:24'),
(574, 31, NULL, NULL, NULL, NULL, 86, '2024-03-02 03:27:24'),
(575, 32, NULL, NULL, NULL, NULL, 86, '2024-03-02 03:27:24'),
(576, 27, NULL, NULL, NULL, NULL, 87, '2024-03-02 03:27:24'),
(577, 28, NULL, NULL, NULL, NULL, 87, '2024-03-02 03:27:24'),
(578, 29, NULL, NULL, NULL, NULL, 87, '2024-03-02 03:27:24'),
(579, 30, NULL, NULL, NULL, NULL, 87, '2024-03-02 03:27:24'),
(580, 31, NULL, NULL, NULL, NULL, 87, '2024-03-02 03:27:24'),
(581, 32, NULL, NULL, NULL, NULL, 87, '2024-03-02 03:27:24'),
(582, 27, NULL, NULL, NULL, NULL, 88, '2024-03-02 03:27:24'),
(583, 28, NULL, NULL, NULL, NULL, 88, '2024-03-02 03:27:24'),
(584, 29, NULL, NULL, NULL, NULL, 88, '2024-03-02 03:27:24'),
(585, 30, NULL, NULL, NULL, NULL, 88, '2024-03-02 03:27:24'),
(586, 31, NULL, NULL, NULL, NULL, 88, '2024-03-02 03:27:24'),
(587, 32, NULL, NULL, NULL, NULL, 88, '2024-03-02 03:27:24'),
(588, 27, NULL, NULL, NULL, NULL, 89, '2024-03-02 03:27:24'),
(589, 28, NULL, NULL, NULL, NULL, 89, '2024-03-02 03:27:24'),
(590, 29, NULL, NULL, NULL, NULL, 89, '2024-03-02 03:27:24'),
(591, 30, NULL, NULL, NULL, NULL, 89, '2024-03-02 03:27:24'),
(592, 31, NULL, NULL, NULL, NULL, 89, '2024-03-02 03:27:24'),
(593, 32, NULL, NULL, NULL, NULL, 89, '2024-03-02 03:27:24'),
(594, 27, NULL, NULL, NULL, NULL, 90, '2024-03-02 03:27:24'),
(595, 28, NULL, NULL, NULL, NULL, 90, '2024-03-02 03:27:24'),
(596, 29, NULL, NULL, NULL, NULL, 90, '2024-03-02 03:27:24'),
(597, 30, NULL, NULL, NULL, NULL, 90, '2024-03-02 03:27:24'),
(598, 31, NULL, NULL, NULL, NULL, 90, '2024-03-02 03:27:24'),
(599, 32, NULL, NULL, NULL, NULL, 90, '2024-03-02 03:27:24'),
(600, 27, NULL, NULL, NULL, NULL, 91, '2024-03-02 03:27:24'),
(601, 28, NULL, NULL, NULL, NULL, 91, '2024-03-02 03:27:24'),
(602, 29, NULL, NULL, NULL, NULL, 91, '2024-03-02 03:27:24'),
(603, 30, NULL, NULL, NULL, NULL, 91, '2024-03-02 03:27:24'),
(604, 31, NULL, NULL, NULL, NULL, 91, '2024-03-02 03:27:24'),
(605, 32, NULL, NULL, NULL, NULL, 91, '2024-03-02 03:27:24'),
(606, 27, NULL, NULL, NULL, NULL, 92, '2024-03-02 03:27:24'),
(607, 28, NULL, NULL, NULL, NULL, 92, '2024-03-02 03:27:24'),
(608, 29, NULL, NULL, NULL, NULL, 92, '2024-03-02 03:27:24'),
(609, 30, NULL, NULL, NULL, NULL, 92, '2024-03-02 03:27:24'),
(610, 31, NULL, NULL, NULL, NULL, 92, '2024-03-02 03:27:24'),
(611, 32, NULL, NULL, NULL, NULL, 92, '2024-03-02 03:27:24'),
(612, 27, NULL, NULL, NULL, NULL, 93, '2024-03-02 03:27:24'),
(613, 28, NULL, NULL, NULL, NULL, 93, '2024-03-02 03:27:24'),
(614, 29, NULL, NULL, NULL, NULL, 93, '2024-03-02 03:27:24'),
(615, 30, NULL, NULL, NULL, NULL, 93, '2024-03-02 03:27:24'),
(616, 31, NULL, NULL, NULL, NULL, 93, '2024-03-02 03:27:24'),
(617, 32, NULL, NULL, NULL, NULL, 93, '2024-03-02 03:27:24'),
(618, 27, NULL, NULL, NULL, NULL, 94, '2024-03-02 03:27:24'),
(619, 28, NULL, NULL, NULL, NULL, 94, '2024-03-02 03:27:24'),
(620, 29, NULL, NULL, NULL, NULL, 94, '2024-03-02 03:27:24'),
(621, 30, NULL, NULL, NULL, NULL, 94, '2024-03-02 03:27:24'),
(622, 31, NULL, NULL, NULL, NULL, 94, '2024-03-02 03:27:24'),
(623, 32, NULL, NULL, NULL, NULL, 94, '2024-03-02 03:27:24'),
(624, 27, NULL, NULL, NULL, NULL, 95, '2024-03-02 03:27:24'),
(625, 28, NULL, NULL, NULL, NULL, 95, '2024-03-02 03:27:24'),
(626, 29, NULL, NULL, NULL, NULL, 95, '2024-03-02 03:27:24'),
(627, 30, NULL, NULL, NULL, NULL, 95, '2024-03-02 03:27:24'),
(628, 31, NULL, NULL, NULL, NULL, 95, '2024-03-02 03:27:24'),
(629, 32, NULL, NULL, NULL, NULL, 95, '2024-03-02 03:27:24'),
(630, 27, NULL, NULL, NULL, NULL, 96, '2024-03-02 03:27:24'),
(631, 28, NULL, NULL, NULL, NULL, 96, '2024-03-02 03:27:24'),
(632, 29, NULL, NULL, NULL, NULL, 96, '2024-03-02 03:27:24'),
(633, 30, NULL, NULL, NULL, NULL, 96, '2024-03-02 03:27:24'),
(634, 31, NULL, NULL, NULL, NULL, 96, '2024-03-02 03:27:24'),
(635, 32, NULL, NULL, NULL, NULL, 96, '2024-03-02 03:27:24'),
(636, 27, NULL, NULL, NULL, NULL, 97, '2024-03-02 03:27:24'),
(637, 28, NULL, NULL, NULL, NULL, 97, '2024-03-02 03:27:24'),
(638, 29, NULL, NULL, NULL, NULL, 97, '2024-03-02 03:27:24'),
(639, 30, NULL, NULL, NULL, NULL, 97, '2024-03-02 03:27:24'),
(640, 31, NULL, NULL, NULL, NULL, 97, '2024-03-02 03:27:24'),
(641, 32, NULL, NULL, NULL, NULL, 97, '2024-03-02 03:27:24'),
(642, 27, NULL, NULL, NULL, NULL, 98, '2024-03-02 03:27:24'),
(643, 28, NULL, NULL, NULL, NULL, 98, '2024-03-02 03:27:24'),
(644, 29, NULL, NULL, NULL, NULL, 98, '2024-03-02 03:27:24'),
(645, 30, NULL, NULL, NULL, NULL, 98, '2024-03-02 03:27:24'),
(646, 31, NULL, NULL, NULL, NULL, 98, '2024-03-02 03:27:24'),
(647, 32, NULL, NULL, NULL, NULL, 98, '2024-03-02 03:27:24'),
(648, 27, NULL, NULL, NULL, NULL, 99, '2024-03-02 03:27:24'),
(649, 28, NULL, NULL, NULL, NULL, 99, '2024-03-02 03:27:24'),
(650, 29, NULL, NULL, NULL, NULL, 99, '2024-03-02 03:27:24'),
(651, 30, NULL, NULL, NULL, NULL, 99, '2024-03-02 03:27:24'),
(652, 31, NULL, NULL, NULL, NULL, 99, '2024-03-02 03:27:24'),
(653, 32, NULL, NULL, NULL, NULL, 99, '2024-03-02 03:27:24'),
(654, 27, NULL, NULL, NULL, NULL, 100, '2024-03-02 03:27:24'),
(655, 28, NULL, NULL, NULL, NULL, 100, '2024-03-02 03:27:24'),
(656, 29, NULL, NULL, NULL, NULL, 100, '2024-03-02 03:27:24'),
(657, 30, NULL, NULL, NULL, NULL, 100, '2024-03-02 03:27:24'),
(658, 31, NULL, NULL, NULL, NULL, 100, '2024-03-02 03:27:24'),
(659, 32, NULL, NULL, NULL, NULL, 100, '2024-03-02 03:27:24'),
(660, 27, NULL, NULL, NULL, NULL, 101, '2024-03-02 03:27:24'),
(661, 28, NULL, NULL, NULL, NULL, 101, '2024-03-02 03:27:24'),
(662, 29, NULL, NULL, NULL, NULL, 101, '2024-03-02 03:27:24'),
(663, 30, NULL, NULL, NULL, NULL, 101, '2024-03-02 03:27:24'),
(664, 31, NULL, NULL, NULL, NULL, 101, '2024-03-02 03:27:24'),
(665, 32, NULL, NULL, NULL, NULL, 101, '2024-03-02 03:27:24'),
(666, 27, NULL, NULL, NULL, NULL, 102, '2024-03-02 03:27:24'),
(667, 28, NULL, NULL, NULL, NULL, 102, '2024-03-02 03:27:24'),
(668, 29, NULL, NULL, NULL, NULL, 102, '2024-03-02 03:27:24'),
(669, 30, NULL, NULL, NULL, NULL, 102, '2024-03-02 03:27:24'),
(670, 31, NULL, NULL, NULL, NULL, 102, '2024-03-02 03:27:24'),
(671, 32, NULL, NULL, NULL, NULL, 102, '2024-03-02 03:27:24'),
(672, 27, NULL, NULL, NULL, NULL, 103, '2024-03-02 03:27:24'),
(673, 28, NULL, NULL, NULL, NULL, 103, '2024-03-02 03:27:24'),
(674, 29, NULL, NULL, NULL, NULL, 103, '2024-03-02 03:27:24'),
(675, 30, NULL, NULL, NULL, NULL, 103, '2024-03-02 03:27:24'),
(676, 31, NULL, NULL, NULL, NULL, 103, '2024-03-02 03:27:24'),
(677, 32, NULL, NULL, NULL, NULL, 103, '2024-03-02 03:27:24'),
(678, 27, NULL, NULL, NULL, NULL, 104, '2024-03-02 03:27:24'),
(679, 28, NULL, NULL, NULL, NULL, 104, '2024-03-02 03:27:24'),
(680, 29, NULL, NULL, NULL, NULL, 104, '2024-03-02 03:27:24'),
(681, 30, NULL, NULL, NULL, NULL, 104, '2024-03-02 03:27:24'),
(682, 31, NULL, NULL, NULL, NULL, 104, '2024-03-02 03:27:24'),
(683, 32, NULL, NULL, NULL, NULL, 104, '2024-03-02 03:27:24'),
(684, 27, NULL, NULL, NULL, NULL, 85, '2024-03-02 03:27:25'),
(685, 28, NULL, NULL, NULL, NULL, 85, '2024-03-02 03:27:25'),
(686, 29, NULL, NULL, NULL, NULL, 85, '2024-03-02 03:27:25'),
(687, 30, NULL, NULL, NULL, NULL, 85, '2024-03-02 03:27:25'),
(688, 31, NULL, NULL, NULL, NULL, 85, '2024-03-02 03:27:25'),
(689, 32, NULL, NULL, NULL, NULL, 85, '2024-03-02 03:27:25'),
(690, 27, NULL, NULL, NULL, NULL, 86, '2024-03-02 03:27:25'),
(691, 28, NULL, NULL, NULL, NULL, 86, '2024-03-02 03:27:25'),
(692, 29, NULL, NULL, NULL, NULL, 86, '2024-03-02 03:27:25'),
(693, 30, NULL, NULL, NULL, NULL, 86, '2024-03-02 03:27:25'),
(694, 31, NULL, NULL, NULL, NULL, 86, '2024-03-02 03:27:25'),
(695, 32, NULL, NULL, NULL, NULL, 86, '2024-03-02 03:27:25'),
(696, 27, NULL, NULL, NULL, NULL, 87, '2024-03-02 03:27:25'),
(697, 28, NULL, NULL, NULL, NULL, 87, '2024-03-02 03:27:25'),
(698, 29, NULL, NULL, NULL, NULL, 87, '2024-03-02 03:27:25'),
(699, 30, NULL, NULL, NULL, NULL, 87, '2024-03-02 03:27:25'),
(700, 31, NULL, NULL, NULL, NULL, 87, '2024-03-02 03:27:25'),
(701, 32, NULL, NULL, NULL, NULL, 87, '2024-03-02 03:27:25'),
(702, 27, NULL, NULL, NULL, NULL, 88, '2024-03-02 03:27:25'),
(703, 28, NULL, NULL, NULL, NULL, 88, '2024-03-02 03:27:25'),
(704, 29, NULL, NULL, NULL, NULL, 88, '2024-03-02 03:27:25'),
(705, 30, NULL, NULL, NULL, NULL, 88, '2024-03-02 03:27:25'),
(706, 31, NULL, NULL, NULL, NULL, 88, '2024-03-02 03:27:25'),
(707, 32, NULL, NULL, NULL, NULL, 88, '2024-03-02 03:27:25'),
(708, 27, NULL, NULL, NULL, NULL, 89, '2024-03-02 03:27:25'),
(709, 28, NULL, NULL, NULL, NULL, 89, '2024-03-02 03:27:25'),
(710, 29, NULL, NULL, NULL, NULL, 89, '2024-03-02 03:27:25'),
(711, 30, NULL, NULL, NULL, NULL, 89, '2024-03-02 03:27:25'),
(712, 31, NULL, NULL, NULL, NULL, 89, '2024-03-02 03:27:25'),
(713, 32, NULL, NULL, NULL, NULL, 89, '2024-03-02 03:27:25'),
(714, 27, NULL, NULL, NULL, NULL, 90, '2024-03-02 03:27:25'),
(715, 28, NULL, NULL, NULL, NULL, 90, '2024-03-02 03:27:25'),
(716, 29, NULL, NULL, NULL, NULL, 90, '2024-03-02 03:27:25'),
(717, 30, NULL, NULL, NULL, NULL, 90, '2024-03-02 03:27:25'),
(718, 31, NULL, NULL, NULL, NULL, 90, '2024-03-02 03:27:25'),
(719, 32, NULL, NULL, NULL, NULL, 90, '2024-03-02 03:27:25'),
(720, 27, NULL, NULL, NULL, NULL, 91, '2024-03-02 03:27:25'),
(721, 28, NULL, NULL, NULL, NULL, 91, '2024-03-02 03:27:25'),
(722, 29, NULL, NULL, NULL, NULL, 91, '2024-03-02 03:27:25'),
(723, 30, NULL, NULL, NULL, NULL, 91, '2024-03-02 03:27:25'),
(724, 31, NULL, NULL, NULL, NULL, 91, '2024-03-02 03:27:25'),
(725, 32, NULL, NULL, NULL, NULL, 91, '2024-03-02 03:27:25'),
(726, 27, NULL, NULL, NULL, NULL, 92, '2024-03-02 03:27:25'),
(727, 28, NULL, NULL, NULL, NULL, 92, '2024-03-02 03:27:25'),
(728, 29, NULL, NULL, NULL, NULL, 92, '2024-03-02 03:27:25'),
(729, 30, NULL, NULL, NULL, NULL, 92, '2024-03-02 03:27:25'),
(730, 31, NULL, NULL, NULL, NULL, 92, '2024-03-02 03:27:25'),
(731, 32, NULL, NULL, NULL, NULL, 92, '2024-03-02 03:27:25'),
(732, 27, NULL, NULL, NULL, NULL, 93, '2024-03-02 03:27:25'),
(733, 28, NULL, NULL, NULL, NULL, 93, '2024-03-02 03:27:25'),
(734, 29, NULL, NULL, NULL, NULL, 93, '2024-03-02 03:27:25'),
(735, 30, NULL, NULL, NULL, NULL, 93, '2024-03-02 03:27:25'),
(736, 31, NULL, NULL, NULL, NULL, 93, '2024-03-02 03:27:25'),
(737, 32, NULL, NULL, NULL, NULL, 93, '2024-03-02 03:27:25'),
(738, 27, NULL, NULL, NULL, NULL, 94, '2024-03-02 03:27:25'),
(739, 28, NULL, NULL, NULL, NULL, 94, '2024-03-02 03:27:25'),
(740, 29, NULL, NULL, NULL, NULL, 94, '2024-03-02 03:27:25'),
(741, 30, NULL, NULL, NULL, NULL, 94, '2024-03-02 03:27:25'),
(742, 31, NULL, NULL, NULL, NULL, 94, '2024-03-02 03:27:25'),
(743, 32, NULL, NULL, NULL, NULL, 94, '2024-03-02 03:27:25'),
(744, 27, NULL, NULL, NULL, NULL, 95, '2024-03-02 03:27:25'),
(745, 28, NULL, NULL, NULL, NULL, 95, '2024-03-02 03:27:25'),
(746, 29, NULL, NULL, NULL, NULL, 95, '2024-03-02 03:27:25'),
(747, 30, NULL, NULL, NULL, NULL, 95, '2024-03-02 03:27:25'),
(748, 31, NULL, NULL, NULL, NULL, 95, '2024-03-02 03:27:25'),
(749, 32, NULL, NULL, NULL, NULL, 95, '2024-03-02 03:27:25'),
(750, 27, NULL, NULL, NULL, NULL, 96, '2024-03-02 03:27:25'),
(751, 28, NULL, NULL, NULL, NULL, 96, '2024-03-02 03:27:25'),
(752, 29, NULL, NULL, NULL, NULL, 96, '2024-03-02 03:27:25'),
(753, 30, NULL, NULL, NULL, NULL, 96, '2024-03-02 03:27:25'),
(754, 31, NULL, NULL, NULL, NULL, 96, '2024-03-02 03:27:25'),
(755, 32, NULL, NULL, NULL, NULL, 96, '2024-03-02 03:27:25'),
(756, 27, NULL, NULL, NULL, NULL, 97, '2024-03-02 03:27:25'),
(757, 28, NULL, NULL, NULL, NULL, 97, '2024-03-02 03:27:25'),
(758, 29, NULL, NULL, NULL, NULL, 97, '2024-03-02 03:27:25'),
(759, 30, NULL, NULL, NULL, NULL, 97, '2024-03-02 03:27:25'),
(760, 31, NULL, NULL, NULL, NULL, 97, '2024-03-02 03:27:25'),
(761, 32, NULL, NULL, NULL, NULL, 97, '2024-03-02 03:27:25'),
(762, 27, NULL, NULL, NULL, NULL, 98, '2024-03-02 03:27:25'),
(763, 28, NULL, NULL, NULL, NULL, 98, '2024-03-02 03:27:25'),
(764, 29, NULL, NULL, NULL, NULL, 98, '2024-03-02 03:27:25'),
(765, 30, NULL, NULL, NULL, NULL, 98, '2024-03-02 03:27:25'),
(766, 31, NULL, NULL, NULL, NULL, 98, '2024-03-02 03:27:25'),
(767, 32, NULL, NULL, NULL, NULL, 98, '2024-03-02 03:27:25'),
(768, 27, NULL, NULL, NULL, NULL, 99, '2024-03-02 03:27:25'),
(769, 28, NULL, NULL, NULL, NULL, 99, '2024-03-02 03:27:25'),
(770, 29, NULL, NULL, NULL, NULL, 99, '2024-03-02 03:27:25'),
(771, 30, NULL, NULL, NULL, NULL, 99, '2024-03-02 03:27:25'),
(772, 31, NULL, NULL, NULL, NULL, 99, '2024-03-02 03:27:25'),
(773, 32, NULL, NULL, NULL, NULL, 99, '2024-03-02 03:27:25'),
(774, 27, NULL, NULL, NULL, NULL, 100, '2024-03-02 03:27:25'),
(775, 28, NULL, NULL, NULL, NULL, 100, '2024-03-02 03:27:25'),
(776, 29, NULL, NULL, NULL, NULL, 100, '2024-03-02 03:27:25'),
(777, 30, NULL, NULL, NULL, NULL, 100, '2024-03-02 03:27:25'),
(778, 31, NULL, NULL, NULL, NULL, 100, '2024-03-02 03:27:25'),
(779, 32, NULL, NULL, NULL, NULL, 100, '2024-03-02 03:27:25'),
(780, 27, NULL, NULL, NULL, NULL, 101, '2024-03-02 03:27:25'),
(781, 28, NULL, NULL, NULL, NULL, 101, '2024-03-02 03:27:25'),
(782, 29, NULL, NULL, NULL, NULL, 101, '2024-03-02 03:27:25'),
(783, 30, NULL, NULL, NULL, NULL, 101, '2024-03-02 03:27:25'),
(784, 31, NULL, NULL, NULL, NULL, 101, '2024-03-02 03:27:25'),
(785, 32, NULL, NULL, NULL, NULL, 101, '2024-03-02 03:27:25'),
(786, 27, NULL, NULL, NULL, NULL, 102, '2024-03-02 03:27:25'),
(787, 28, NULL, NULL, NULL, NULL, 102, '2024-03-02 03:27:25'),
(788, 29, NULL, NULL, NULL, NULL, 102, '2024-03-02 03:27:25'),
(789, 30, NULL, NULL, NULL, NULL, 102, '2024-03-02 03:27:25'),
(790, 31, NULL, NULL, NULL, NULL, 102, '2024-03-02 03:27:25'),
(791, 32, NULL, NULL, NULL, NULL, 102, '2024-03-02 03:27:25'),
(792, 27, NULL, NULL, NULL, NULL, 103, '2024-03-02 03:27:25'),
(793, 28, NULL, NULL, NULL, NULL, 103, '2024-03-02 03:27:25'),
(794, 29, NULL, NULL, NULL, NULL, 103, '2024-03-02 03:27:25'),
(795, 30, NULL, NULL, NULL, NULL, 103, '2024-03-02 03:27:25'),
(796, 31, NULL, NULL, NULL, NULL, 103, '2024-03-02 03:27:25'),
(797, 32, NULL, NULL, NULL, NULL, 103, '2024-03-02 03:27:25'),
(798, 27, NULL, NULL, NULL, NULL, 104, '2024-03-02 03:27:25'),
(799, 28, NULL, NULL, NULL, NULL, 104, '2024-03-02 03:27:25'),
(800, 29, NULL, NULL, NULL, NULL, 104, '2024-03-02 03:27:25'),
(801, 30, NULL, NULL, NULL, NULL, 104, '2024-03-02 03:27:25'),
(802, 31, NULL, NULL, NULL, NULL, 104, '2024-03-02 03:27:25'),
(803, 32, NULL, NULL, NULL, NULL, 104, '2024-03-02 03:27:25'),
(804, 33, NULL, NULL, NULL, NULL, 105, '2024-03-02 03:28:50'),
(805, 34, NULL, NULL, NULL, NULL, 105, '2024-03-02 03:28:50'),
(806, 35, NULL, NULL, NULL, NULL, 105, '2024-03-02 03:28:50'),
(807, 36, NULL, NULL, NULL, NULL, 105, '2024-03-02 03:28:50'),
(808, 37, NULL, NULL, NULL, NULL, 105, '2024-03-02 03:28:50'),
(809, 38, NULL, NULL, NULL, NULL, 105, '2024-03-02 03:28:50'),
(810, 33, NULL, NULL, NULL, NULL, 106, '2024-03-02 03:28:50'),
(811, 34, NULL, NULL, NULL, NULL, 106, '2024-03-02 03:28:50'),
(812, 35, NULL, NULL, NULL, NULL, 106, '2024-03-02 03:28:50'),
(813, 36, NULL, NULL, NULL, NULL, 106, '2024-03-02 03:28:50'),
(814, 37, NULL, NULL, NULL, NULL, 106, '2024-03-02 03:28:50'),
(815, 38, NULL, NULL, NULL, NULL, 106, '2024-03-02 03:28:50'),
(816, 33, NULL, NULL, NULL, NULL, 107, '2024-03-02 03:28:50'),
(817, 34, NULL, NULL, NULL, NULL, 107, '2024-03-02 03:28:50'),
(818, 35, NULL, NULL, NULL, NULL, 107, '2024-03-02 03:28:50'),
(819, 36, NULL, NULL, NULL, NULL, 107, '2024-03-02 03:28:50'),
(820, 37, NULL, NULL, NULL, NULL, 107, '2024-03-02 03:28:50'),
(821, 38, NULL, NULL, NULL, NULL, 107, '2024-03-02 03:28:50'),
(822, 33, NULL, NULL, NULL, NULL, 108, '2024-03-02 03:28:50'),
(823, 34, NULL, NULL, NULL, NULL, 108, '2024-03-02 03:28:50'),
(824, 35, NULL, NULL, NULL, NULL, 108, '2024-03-02 03:28:50'),
(825, 36, NULL, NULL, NULL, NULL, 108, '2024-03-02 03:28:50'),
(826, 37, NULL, NULL, NULL, NULL, 108, '2024-03-02 03:28:50'),
(827, 38, NULL, NULL, NULL, NULL, 108, '2024-03-02 03:28:50'),
(828, 33, NULL, NULL, NULL, NULL, 109, '2024-03-02 03:28:50'),
(829, 34, NULL, NULL, NULL, NULL, 109, '2024-03-02 03:28:50'),
(830, 35, NULL, NULL, NULL, NULL, 109, '2024-03-02 03:28:50'),
(831, 36, NULL, NULL, NULL, NULL, 109, '2024-03-02 03:28:50'),
(832, 37, NULL, NULL, NULL, NULL, 109, '2024-03-02 03:28:50'),
(833, 38, NULL, NULL, NULL, NULL, 109, '2024-03-02 03:28:50'),
(834, 33, NULL, NULL, NULL, NULL, 110, '2024-03-02 03:28:50'),
(835, 34, NULL, NULL, NULL, NULL, 110, '2024-03-02 03:28:50'),
(836, 35, NULL, NULL, NULL, NULL, 110, '2024-03-02 03:28:50'),
(837, 36, NULL, NULL, NULL, NULL, 110, '2024-03-02 03:28:50'),
(838, 37, NULL, NULL, NULL, NULL, 110, '2024-03-02 03:28:50'),
(839, 38, NULL, NULL, NULL, NULL, 110, '2024-03-02 03:28:50'),
(840, 33, NULL, NULL, NULL, NULL, 111, '2024-03-02 03:28:50'),
(841, 34, NULL, NULL, NULL, NULL, 111, '2024-03-02 03:28:50'),
(842, 35, NULL, NULL, NULL, NULL, 111, '2024-03-02 03:28:50'),
(843, 36, NULL, NULL, NULL, NULL, 111, '2024-03-02 03:28:50'),
(844, 37, NULL, NULL, NULL, NULL, 111, '2024-03-02 03:28:50'),
(845, 38, NULL, NULL, NULL, NULL, 111, '2024-03-02 03:28:50'),
(846, 33, NULL, NULL, NULL, NULL, 112, '2024-03-02 03:28:50'),
(847, 34, NULL, NULL, NULL, NULL, 112, '2024-03-02 03:28:50'),
(848, 35, NULL, NULL, NULL, NULL, 112, '2024-03-02 03:28:50'),
(849, 36, NULL, NULL, NULL, NULL, 112, '2024-03-02 03:28:50'),
(850, 37, NULL, NULL, NULL, NULL, 112, '2024-03-02 03:28:50'),
(851, 38, NULL, NULL, NULL, NULL, 112, '2024-03-02 03:28:50'),
(852, 33, NULL, NULL, NULL, NULL, 113, '2024-03-02 03:28:50'),
(853, 34, NULL, NULL, NULL, NULL, 113, '2024-03-02 03:28:50'),
(854, 35, NULL, NULL, NULL, NULL, 113, '2024-03-02 03:28:50'),
(855, 36, NULL, NULL, NULL, NULL, 113, '2024-03-02 03:28:50'),
(856, 37, NULL, NULL, NULL, NULL, 113, '2024-03-02 03:28:50'),
(857, 38, NULL, NULL, NULL, NULL, 113, '2024-03-02 03:28:50'),
(858, 33, NULL, NULL, NULL, NULL, 114, '2024-03-02 03:28:50'),
(859, 34, NULL, NULL, NULL, NULL, 114, '2024-03-02 03:28:50'),
(860, 35, NULL, NULL, NULL, NULL, 114, '2024-03-02 03:28:50'),
(861, 36, NULL, NULL, NULL, NULL, 114, '2024-03-02 03:28:50'),
(862, 37, NULL, NULL, NULL, NULL, 114, '2024-03-02 03:28:50'),
(863, 38, NULL, NULL, NULL, NULL, 114, '2024-03-02 03:28:50'),
(864, 33, NULL, NULL, NULL, NULL, 115, '2024-03-02 03:28:50'),
(865, 34, NULL, NULL, NULL, NULL, 115, '2024-03-02 03:28:50');
INSERT INTO `grades_per_subject` (`grades_id`, `subject_id`, `f_grading`, `s_grading`, `t_grading`, `fourth_grading`, `SR_ID`, `created_at`) VALUES
(866, 35, NULL, NULL, NULL, NULL, 115, '2024-03-02 03:28:50'),
(867, 36, NULL, NULL, NULL, NULL, 115, '2024-03-02 03:28:50'),
(868, 37, NULL, NULL, NULL, NULL, 115, '2024-03-02 03:28:50'),
(869, 38, NULL, NULL, NULL, NULL, 115, '2024-03-02 03:28:50'),
(870, 33, NULL, NULL, NULL, NULL, 116, '2024-03-02 03:28:50'),
(871, 34, NULL, NULL, NULL, NULL, 116, '2024-03-02 03:28:50'),
(872, 35, NULL, NULL, NULL, NULL, 116, '2024-03-02 03:28:50'),
(873, 36, NULL, NULL, NULL, NULL, 116, '2024-03-02 03:28:50'),
(874, 37, NULL, NULL, NULL, NULL, 116, '2024-03-02 03:28:50'),
(875, 38, NULL, NULL, NULL, NULL, 116, '2024-03-02 03:28:50'),
(876, 33, NULL, NULL, NULL, NULL, 117, '2024-03-02 03:28:50'),
(877, 34, NULL, NULL, NULL, NULL, 117, '2024-03-02 03:28:50'),
(878, 35, NULL, NULL, NULL, NULL, 117, '2024-03-02 03:28:50'),
(879, 36, NULL, NULL, NULL, NULL, 117, '2024-03-02 03:28:50'),
(880, 37, NULL, NULL, NULL, NULL, 117, '2024-03-02 03:28:50'),
(881, 38, NULL, NULL, NULL, NULL, 117, '2024-03-02 03:28:50'),
(882, 33, NULL, NULL, NULL, NULL, 118, '2024-03-02 03:28:50'),
(883, 34, NULL, NULL, NULL, NULL, 118, '2024-03-02 03:28:50'),
(884, 35, NULL, NULL, NULL, NULL, 118, '2024-03-02 03:28:50'),
(885, 36, NULL, NULL, NULL, NULL, 118, '2024-03-02 03:28:50'),
(886, 37, NULL, NULL, NULL, NULL, 118, '2024-03-02 03:28:50'),
(887, 38, NULL, NULL, NULL, NULL, 118, '2024-03-02 03:28:50'),
(888, 33, NULL, NULL, NULL, NULL, 119, '2024-03-02 03:28:50'),
(889, 34, NULL, NULL, NULL, NULL, 119, '2024-03-02 03:28:50'),
(890, 35, NULL, NULL, NULL, NULL, 119, '2024-03-02 03:28:50'),
(891, 36, NULL, NULL, NULL, NULL, 119, '2024-03-02 03:28:50'),
(892, 37, NULL, NULL, NULL, NULL, 119, '2024-03-02 03:28:50'),
(893, 38, NULL, NULL, NULL, NULL, 119, '2024-03-02 03:28:50'),
(894, 33, NULL, NULL, NULL, NULL, 120, '2024-03-02 03:28:50'),
(895, 34, NULL, NULL, NULL, NULL, 120, '2024-03-02 03:28:50'),
(896, 35, NULL, NULL, NULL, NULL, 120, '2024-03-02 03:28:50'),
(897, 36, NULL, NULL, NULL, NULL, 120, '2024-03-02 03:28:50'),
(898, 37, NULL, NULL, NULL, NULL, 120, '2024-03-02 03:28:50'),
(899, 38, NULL, NULL, NULL, NULL, 120, '2024-03-02 03:28:50'),
(900, 33, NULL, NULL, NULL, NULL, 121, '2024-03-02 03:28:50'),
(901, 34, NULL, NULL, NULL, NULL, 121, '2024-03-02 03:28:50'),
(902, 35, NULL, NULL, NULL, NULL, 121, '2024-03-02 03:28:50'),
(903, 36, NULL, NULL, NULL, NULL, 121, '2024-03-02 03:28:50'),
(904, 37, NULL, NULL, NULL, NULL, 121, '2024-03-02 03:28:50'),
(905, 38, NULL, NULL, NULL, NULL, 121, '2024-03-02 03:28:50'),
(906, 33, NULL, NULL, NULL, NULL, 122, '2024-03-02 03:28:50'),
(907, 34, NULL, NULL, NULL, NULL, 122, '2024-03-02 03:28:50'),
(908, 35, NULL, NULL, NULL, NULL, 122, '2024-03-02 03:28:50'),
(909, 36, NULL, NULL, NULL, NULL, 122, '2024-03-02 03:28:50'),
(910, 37, NULL, NULL, NULL, NULL, 122, '2024-03-02 03:28:50'),
(911, 38, NULL, NULL, NULL, NULL, 122, '2024-03-02 03:28:50'),
(912, 33, NULL, NULL, NULL, NULL, 123, '2024-03-02 03:28:50'),
(913, 34, NULL, NULL, NULL, NULL, 123, '2024-03-02 03:28:50'),
(914, 35, NULL, NULL, NULL, NULL, 123, '2024-03-02 03:28:50'),
(915, 36, NULL, NULL, NULL, NULL, 123, '2024-03-02 03:28:50'),
(916, 37, NULL, NULL, NULL, NULL, 123, '2024-03-02 03:28:50'),
(917, 38, NULL, NULL, NULL, NULL, 123, '2024-03-02 03:28:50'),
(918, 33, NULL, NULL, NULL, NULL, 124, '2024-03-02 03:28:50'),
(919, 34, NULL, NULL, NULL, NULL, 124, '2024-03-02 03:28:50'),
(920, 35, NULL, NULL, NULL, NULL, 124, '2024-03-02 03:28:50'),
(921, 36, NULL, NULL, NULL, NULL, 124, '2024-03-02 03:28:50'),
(922, 37, NULL, NULL, NULL, NULL, 124, '2024-03-02 03:28:50'),
(923, 38, NULL, NULL, NULL, NULL, 124, '2024-03-02 03:28:50'),
(924, 39, NULL, NULL, NULL, NULL, 125, '2024-03-02 03:30:27'),
(925, 40, NULL, NULL, NULL, NULL, 125, '2024-03-02 03:30:27'),
(926, 41, NULL, NULL, NULL, NULL, 125, '2024-03-02 03:30:27'),
(927, 42, NULL, NULL, NULL, NULL, 125, '2024-03-02 03:30:27'),
(928, 43, NULL, NULL, NULL, NULL, 125, '2024-03-02 03:30:27'),
(929, 44, NULL, NULL, NULL, NULL, 125, '2024-03-02 03:30:27'),
(930, 45, NULL, NULL, NULL, NULL, 125, '2024-03-02 03:30:27'),
(931, 39, NULL, NULL, NULL, NULL, 126, '2024-03-02 03:30:27'),
(932, 40, NULL, NULL, NULL, NULL, 126, '2024-03-02 03:30:27'),
(933, 41, NULL, NULL, NULL, NULL, 126, '2024-03-02 03:30:27'),
(934, 42, NULL, NULL, NULL, NULL, 126, '2024-03-02 03:30:27'),
(935, 43, NULL, NULL, NULL, NULL, 126, '2024-03-02 03:30:27'),
(936, 44, NULL, NULL, NULL, NULL, 126, '2024-03-02 03:30:27'),
(937, 45, NULL, NULL, NULL, NULL, 126, '2024-03-02 03:30:27'),
(938, 39, NULL, NULL, NULL, NULL, 127, '2024-03-02 03:30:27'),
(939, 40, NULL, NULL, NULL, NULL, 127, '2024-03-02 03:30:27'),
(940, 41, NULL, NULL, NULL, NULL, 127, '2024-03-02 03:30:27'),
(941, 42, NULL, NULL, NULL, NULL, 127, '2024-03-02 03:30:27'),
(942, 43, NULL, NULL, NULL, NULL, 127, '2024-03-02 03:30:27'),
(943, 44, NULL, NULL, NULL, NULL, 127, '2024-03-02 03:30:27'),
(944, 45, NULL, NULL, NULL, NULL, 127, '2024-03-02 03:30:27'),
(945, 39, NULL, NULL, NULL, NULL, 128, '2024-03-02 03:30:27'),
(946, 40, NULL, NULL, NULL, NULL, 128, '2024-03-02 03:30:27'),
(947, 41, NULL, NULL, NULL, NULL, 128, '2024-03-02 03:30:27'),
(948, 42, NULL, NULL, NULL, NULL, 128, '2024-03-02 03:30:27'),
(949, 43, NULL, NULL, NULL, NULL, 128, '2024-03-02 03:30:27'),
(950, 44, NULL, NULL, NULL, NULL, 128, '2024-03-02 03:30:27'),
(951, 45, NULL, NULL, NULL, NULL, 128, '2024-03-02 03:30:27'),
(952, 39, NULL, NULL, NULL, NULL, 129, '2024-03-02 03:30:27'),
(953, 40, NULL, NULL, NULL, NULL, 129, '2024-03-02 03:30:27'),
(954, 41, NULL, NULL, NULL, NULL, 129, '2024-03-02 03:30:27'),
(955, 42, NULL, NULL, NULL, NULL, 129, '2024-03-02 03:30:27'),
(956, 43, NULL, NULL, NULL, NULL, 129, '2024-03-02 03:30:27'),
(957, 44, NULL, NULL, NULL, NULL, 129, '2024-03-02 03:30:27'),
(958, 45, NULL, NULL, NULL, NULL, 129, '2024-03-02 03:30:27'),
(959, 39, NULL, NULL, NULL, NULL, 130, '2024-03-02 03:30:27'),
(960, 40, NULL, NULL, NULL, NULL, 130, '2024-03-02 03:30:27'),
(961, 41, NULL, NULL, NULL, NULL, 130, '2024-03-02 03:30:27'),
(962, 42, NULL, NULL, NULL, NULL, 130, '2024-03-02 03:30:27'),
(963, 43, NULL, NULL, NULL, NULL, 130, '2024-03-02 03:30:27'),
(964, 44, NULL, NULL, NULL, NULL, 130, '2024-03-02 03:30:27'),
(965, 45, NULL, NULL, NULL, NULL, 130, '2024-03-02 03:30:27'),
(966, 39, NULL, NULL, NULL, NULL, 131, '2024-03-02 03:30:27'),
(967, 40, NULL, NULL, NULL, NULL, 131, '2024-03-02 03:30:27'),
(968, 41, NULL, NULL, NULL, NULL, 131, '2024-03-02 03:30:27'),
(969, 42, NULL, NULL, NULL, NULL, 131, '2024-03-02 03:30:27'),
(970, 43, NULL, NULL, NULL, NULL, 131, '2024-03-02 03:30:27'),
(971, 44, NULL, NULL, NULL, NULL, 131, '2024-03-02 03:30:27'),
(972, 45, NULL, NULL, NULL, NULL, 131, '2024-03-02 03:30:27'),
(973, 39, NULL, NULL, NULL, NULL, 132, '2024-03-02 03:30:27'),
(974, 40, NULL, NULL, NULL, NULL, 132, '2024-03-02 03:30:27'),
(975, 41, NULL, NULL, NULL, NULL, 132, '2024-03-02 03:30:27'),
(976, 42, NULL, NULL, NULL, NULL, 132, '2024-03-02 03:30:27'),
(977, 43, NULL, NULL, NULL, NULL, 132, '2024-03-02 03:30:27'),
(978, 44, NULL, NULL, NULL, NULL, 132, '2024-03-02 03:30:27'),
(979, 45, NULL, NULL, NULL, NULL, 132, '2024-03-02 03:30:27'),
(980, 39, NULL, NULL, NULL, NULL, 133, '2024-03-02 03:30:27'),
(981, 40, NULL, NULL, NULL, NULL, 133, '2024-03-02 03:30:27'),
(982, 41, NULL, NULL, NULL, NULL, 133, '2024-03-02 03:30:27'),
(983, 42, NULL, NULL, NULL, NULL, 133, '2024-03-02 03:30:27'),
(984, 43, NULL, NULL, NULL, NULL, 133, '2024-03-02 03:30:27'),
(985, 44, NULL, NULL, NULL, NULL, 133, '2024-03-02 03:30:27'),
(986, 45, NULL, NULL, NULL, NULL, 133, '2024-03-02 03:30:27'),
(987, 39, NULL, NULL, NULL, NULL, 134, '2024-03-02 03:30:27'),
(988, 40, NULL, NULL, NULL, NULL, 134, '2024-03-02 03:30:27'),
(989, 41, NULL, NULL, NULL, NULL, 134, '2024-03-02 03:30:27'),
(990, 42, NULL, NULL, NULL, NULL, 134, '2024-03-02 03:30:27'),
(991, 43, NULL, NULL, NULL, NULL, 134, '2024-03-02 03:30:27'),
(992, 44, NULL, NULL, NULL, NULL, 134, '2024-03-02 03:30:27'),
(993, 45, NULL, NULL, NULL, NULL, 134, '2024-03-02 03:30:27'),
(994, 39, NULL, NULL, NULL, NULL, 135, '2024-03-02 03:30:27'),
(995, 40, NULL, NULL, NULL, NULL, 135, '2024-03-02 03:30:27'),
(996, 41, NULL, NULL, NULL, NULL, 135, '2024-03-02 03:30:27'),
(997, 42, NULL, NULL, NULL, NULL, 135, '2024-03-02 03:30:27'),
(998, 43, NULL, NULL, NULL, NULL, 135, '2024-03-02 03:30:27'),
(999, 44, NULL, NULL, NULL, NULL, 135, '2024-03-02 03:30:27'),
(1000, 45, NULL, NULL, NULL, NULL, 135, '2024-03-02 03:30:27'),
(1001, 39, NULL, NULL, NULL, NULL, 136, '2024-03-02 03:30:27'),
(1002, 40, NULL, NULL, NULL, NULL, 136, '2024-03-02 03:30:27'),
(1003, 41, NULL, NULL, NULL, NULL, 136, '2024-03-02 03:30:27'),
(1004, 42, NULL, NULL, NULL, NULL, 136, '2024-03-02 03:30:27'),
(1005, 43, NULL, NULL, NULL, NULL, 136, '2024-03-02 03:30:27'),
(1006, 44, NULL, NULL, NULL, NULL, 136, '2024-03-02 03:30:27'),
(1007, 45, NULL, NULL, NULL, NULL, 136, '2024-03-02 03:30:27'),
(1008, 39, NULL, NULL, NULL, NULL, 137, '2024-03-02 03:30:27'),
(1009, 40, NULL, NULL, NULL, NULL, 137, '2024-03-02 03:30:27'),
(1010, 41, NULL, NULL, NULL, NULL, 137, '2024-03-02 03:30:27'),
(1011, 42, NULL, NULL, NULL, NULL, 137, '2024-03-02 03:30:27'),
(1012, 43, NULL, NULL, NULL, NULL, 137, '2024-03-02 03:30:27'),
(1013, 44, NULL, NULL, NULL, NULL, 137, '2024-03-02 03:30:27'),
(1014, 45, NULL, NULL, NULL, NULL, 137, '2024-03-02 03:30:27'),
(1015, 39, NULL, NULL, NULL, NULL, 138, '2024-03-02 03:30:27'),
(1016, 40, NULL, NULL, NULL, NULL, 138, '2024-03-02 03:30:27'),
(1017, 41, NULL, NULL, NULL, NULL, 138, '2024-03-02 03:30:27'),
(1018, 42, NULL, NULL, NULL, NULL, 138, '2024-03-02 03:30:27'),
(1019, 43, NULL, NULL, NULL, NULL, 138, '2024-03-02 03:30:27'),
(1020, 44, NULL, NULL, NULL, NULL, 138, '2024-03-02 03:30:27'),
(1021, 45, NULL, NULL, NULL, NULL, 138, '2024-03-02 03:30:27'),
(1022, 39, NULL, NULL, NULL, NULL, 139, '2024-03-02 03:30:27'),
(1023, 40, NULL, NULL, NULL, NULL, 139, '2024-03-02 03:30:27'),
(1024, 41, NULL, NULL, NULL, NULL, 139, '2024-03-02 03:30:27'),
(1025, 42, NULL, NULL, NULL, NULL, 139, '2024-03-02 03:30:27'),
(1026, 43, NULL, NULL, NULL, NULL, 139, '2024-03-02 03:30:27'),
(1027, 44, NULL, NULL, NULL, NULL, 139, '2024-03-02 03:30:27'),
(1028, 45, NULL, NULL, NULL, NULL, 139, '2024-03-02 03:30:27'),
(1029, 39, NULL, NULL, NULL, NULL, 140, '2024-03-02 03:30:27'),
(1030, 40, NULL, NULL, NULL, NULL, 140, '2024-03-02 03:30:27'),
(1031, 41, NULL, NULL, NULL, NULL, 140, '2024-03-02 03:30:27'),
(1032, 42, NULL, NULL, NULL, NULL, 140, '2024-03-02 03:30:27'),
(1033, 43, NULL, NULL, NULL, NULL, 140, '2024-03-02 03:30:27'),
(1034, 44, NULL, NULL, NULL, NULL, 140, '2024-03-02 03:30:27'),
(1035, 45, NULL, NULL, NULL, NULL, 140, '2024-03-02 03:30:27'),
(1036, 39, NULL, NULL, NULL, NULL, 141, '2024-03-02 03:30:27'),
(1037, 40, NULL, NULL, NULL, NULL, 141, '2024-03-02 03:30:27'),
(1038, 41, NULL, NULL, NULL, NULL, 141, '2024-03-02 03:30:27'),
(1039, 42, NULL, NULL, NULL, NULL, 141, '2024-03-02 03:30:27'),
(1040, 43, NULL, NULL, NULL, NULL, 141, '2024-03-02 03:30:27'),
(1041, 44, NULL, NULL, NULL, NULL, 141, '2024-03-02 03:30:27'),
(1042, 45, NULL, NULL, NULL, NULL, 141, '2024-03-02 03:30:27'),
(1043, 39, NULL, NULL, NULL, NULL, 142, '2024-03-02 03:30:27'),
(1044, 40, NULL, NULL, NULL, NULL, 142, '2024-03-02 03:30:27'),
(1045, 41, NULL, NULL, NULL, NULL, 142, '2024-03-02 03:30:27'),
(1046, 42, NULL, NULL, NULL, NULL, 142, '2024-03-02 03:30:27'),
(1047, 43, NULL, NULL, NULL, NULL, 142, '2024-03-02 03:30:27'),
(1048, 44, NULL, NULL, NULL, NULL, 142, '2024-03-02 03:30:27'),
(1049, 45, NULL, NULL, NULL, NULL, 142, '2024-03-02 03:30:27'),
(1050, 39, NULL, NULL, NULL, NULL, 143, '2024-03-02 03:30:27'),
(1051, 40, NULL, NULL, NULL, NULL, 143, '2024-03-02 03:30:27'),
(1052, 41, NULL, NULL, NULL, NULL, 143, '2024-03-02 03:30:27'),
(1053, 42, NULL, NULL, NULL, NULL, 143, '2024-03-02 03:30:27'),
(1054, 43, NULL, NULL, NULL, NULL, 143, '2024-03-02 03:30:27'),
(1055, 44, NULL, NULL, NULL, NULL, 143, '2024-03-02 03:30:27'),
(1056, 45, NULL, NULL, NULL, NULL, 143, '2024-03-02 03:30:27'),
(1057, 39, NULL, NULL, NULL, NULL, 144, '2024-03-02 03:30:27'),
(1058, 40, NULL, NULL, NULL, NULL, 144, '2024-03-02 03:30:27'),
(1059, 41, NULL, NULL, NULL, NULL, 144, '2024-03-02 03:30:27'),
(1060, 42, NULL, NULL, NULL, NULL, 144, '2024-03-02 03:30:27'),
(1061, 43, NULL, NULL, NULL, NULL, 144, '2024-03-02 03:30:27'),
(1062, 44, NULL, NULL, NULL, NULL, 144, '2024-03-02 03:30:27'),
(1063, 45, NULL, NULL, NULL, NULL, 144, '2024-03-02 03:30:27'),
(1064, 46, '95', '95', '95', '95', 145, '2024-03-02 03:32:18'),
(1065, 47, '95', '95', '95', '95', 145, '2024-03-02 03:32:18'),
(1066, 48, '95', '95', '95', '95', 145, '2024-03-02 03:32:18'),
(1067, 49, '95', '95', '95', '95', 145, '2024-03-02 03:32:18'),
(1068, 50, '95', '95', '95', '95', 145, '2024-03-02 03:32:18'),
(1069, 51, '95', '95', '95', '95', 145, '2024-03-02 03:32:18'),
(1070, 52, '95', '95', '95', '95', 145, '2024-03-02 03:32:18'),
(1071, 46, '95', '95', '95', '95', 146, '2024-03-02 03:32:18'),
(1072, 47, '95', '95', '95', '95', 146, '2024-03-02 03:32:18'),
(1073, 48, '95', '95', '95', '95', 146, '2024-03-02 03:32:18'),
(1074, 49, '95', '95', '95', '95', 146, '2024-03-02 03:32:18'),
(1075, 50, '95', '95', '95', '95', 146, '2024-03-02 03:32:18'),
(1076, 51, '95', '95', '95', '95', 146, '2024-03-02 03:32:18'),
(1077, 52, '95', '95', '95', '95', 146, '2024-03-02 03:32:18'),
(1078, 46, '95', '95', '95', '95', 147, '2024-03-02 03:32:18'),
(1079, 47, '95', '95', '95', '95', 147, '2024-03-02 03:32:18'),
(1080, 48, '95', '95', '95', '95', 147, '2024-03-02 03:32:18'),
(1081, 49, '95', '95', '95', '95', 147, '2024-03-02 03:32:18'),
(1082, 50, '95', '95', '95', '95', 147, '2024-03-02 03:32:18'),
(1083, 51, '95', '95', '95', '95', 147, '2024-03-02 03:32:18'),
(1084, 52, '95', '95', '95', '95', 147, '2024-03-02 03:32:18'),
(1085, 46, '95', '95', '95', '95', 148, '2024-03-02 03:32:18'),
(1086, 47, '95', '95', '95', '95', 148, '2024-03-02 03:32:18'),
(1087, 48, '95', '95', '95', '95', 148, '2024-03-02 03:32:18'),
(1088, 49, '95', '95', '95', '95', 148, '2024-03-02 03:32:18'),
(1089, 50, '95', '95', '95', '95', 148, '2024-03-02 03:32:18'),
(1090, 51, '95', '95', '95', '95', 148, '2024-03-02 03:32:18'),
(1091, 52, '95', '95', '95', '95', 148, '2024-03-02 03:32:18'),
(1092, 46, '95', '95', '95', '95', 149, '2024-03-02 03:32:18'),
(1093, 47, '95', '95', '95', '95', 149, '2024-03-02 03:32:18'),
(1094, 48, '95', '95', '95', '95', 149, '2024-03-02 03:32:18'),
(1095, 49, '95', '95', '95', '95', 149, '2024-03-02 03:32:18'),
(1096, 50, '95', '95', '95', '95', 149, '2024-03-02 03:32:18'),
(1097, 51, '95', '95', '95', '95', 149, '2024-03-02 03:32:18'),
(1098, 52, '95', '95', '95', '95', 149, '2024-03-02 03:32:18'),
(1099, 46, '95', '95', '95', '95', 150, '2024-03-02 03:32:18'),
(1100, 47, '95', '95', '95', '95', 150, '2024-03-02 03:32:18'),
(1101, 48, '95', '95', '95', '95', 150, '2024-03-02 03:32:18'),
(1102, 49, '95', '95', '95', '95', 150, '2024-03-02 03:32:18'),
(1103, 50, '95', '95', '95', '95', 150, '2024-03-02 03:32:18'),
(1104, 51, '95', '95', '95', '95', 150, '2024-03-02 03:32:18'),
(1105, 52, '95', '95', '95', '95', 150, '2024-03-02 03:32:18'),
(1106, 46, '95', '95', '95', '95', 151, '2024-03-02 03:32:18'),
(1107, 47, '95', '95', '95', '95', 151, '2024-03-02 03:32:18'),
(1108, 48, '95', '95', '95', '95', 151, '2024-03-02 03:32:18'),
(1109, 49, '95', '95', '95', '95', 151, '2024-03-02 03:32:18'),
(1110, 50, '95', '95', '95', '95', 151, '2024-03-02 03:32:18'),
(1111, 51, '95', '95', '95', '95', 151, '2024-03-02 03:32:18'),
(1112, 52, '95', '95', '95', '95', 151, '2024-03-02 03:32:18'),
(1113, 46, '95', '95', '95', '95', 152, '2024-03-02 03:32:18'),
(1114, 47, '95', '95', '95', '95', 152, '2024-03-02 03:32:18'),
(1115, 48, '95', '95', '95', '95', 152, '2024-03-02 03:32:18'),
(1116, 49, '95', '95', '95', '95', 152, '2024-03-02 03:32:18'),
(1117, 50, '95', '95', '95', '95', 152, '2024-03-02 03:32:18'),
(1118, 51, '95', '95', '95', '95', 152, '2024-03-02 03:32:18'),
(1119, 52, '95', '95', '95', '95', 152, '2024-03-02 03:32:18'),
(1120, 46, '95', '95', '95', '95', 153, '2024-03-02 03:32:18'),
(1121, 47, '95', '95', '95', '95', 153, '2024-03-02 03:32:18'),
(1122, 48, '95', '95', '95', '95', 153, '2024-03-02 03:32:18'),
(1123, 49, '95', '95', '95', '95', 153, '2024-03-02 03:32:18'),
(1124, 50, '95', '95', '95', '95', 153, '2024-03-02 03:32:18'),
(1125, 51, '95', '95', '95', '95', 153, '2024-03-02 03:32:18'),
(1126, 52, '95', '95', '95', '95', 153, '2024-03-02 03:32:18'),
(1127, 46, '95', '95', '95', '95', 154, '2024-03-02 03:32:18'),
(1128, 47, '95', '95', '95', '95', 154, '2024-03-02 03:32:18'),
(1129, 48, '95', '95', '95', '95', 154, '2024-03-02 03:32:18'),
(1130, 49, '95', '95', '95', '95', 154, '2024-03-02 03:32:18'),
(1131, 50, '95', '95', '95', '95', 154, '2024-03-02 03:32:18'),
(1132, 51, '95', '95', '95', '95', 154, '2024-03-02 03:32:18'),
(1133, 52, '95', '95', '95', '95', 154, '2024-03-02 03:32:18'),
(1134, 46, '95', '95', '95', '95', 155, '2024-03-02 03:32:18'),
(1135, 47, '95', '95', '95', '95', 155, '2024-03-02 03:32:18'),
(1136, 48, '95', '95', '95', '95', 155, '2024-03-02 03:32:18'),
(1137, 49, '95', '95', '95', '95', 155, '2024-03-02 03:32:18'),
(1138, 50, '95', '95', '95', '95', 155, '2024-03-02 03:32:18'),
(1139, 51, '95', '95', '95', '95', 155, '2024-03-02 03:32:18'),
(1140, 52, '95', '95', '95', '95', 155, '2024-03-02 03:32:18'),
(1141, 46, '95', '95', '95', '95', 156, '2024-03-02 03:32:18'),
(1142, 47, '95', '95', '95', '95', 156, '2024-03-02 03:32:18'),
(1143, 48, '95', '95', '95', '95', 156, '2024-03-02 03:32:18'),
(1144, 49, '95', '95', '95', '95', 156, '2024-03-02 03:32:18'),
(1145, 50, '95', '95', '95', '95', 156, '2024-03-02 03:32:18'),
(1146, 51, '95', '95', '95', '95', 156, '2024-03-02 03:32:18'),
(1147, 52, '95', '95', '95', '95', 156, '2024-03-02 03:32:18'),
(1148, 46, '95', '95', '95', '95', 157, '2024-03-02 03:32:18'),
(1149, 47, '95', '95', '95', '95', 157, '2024-03-02 03:32:18'),
(1150, 48, '95', '95', '95', '95', 157, '2024-03-02 03:32:18'),
(1151, 49, '95', '95', '95', '95', 157, '2024-03-02 03:32:18'),
(1152, 50, '95', '95', '95', '95', 157, '2024-03-02 03:32:18'),
(1153, 51, '95', '95', '95', '95', 157, '2024-03-02 03:32:18'),
(1154, 52, '95', '95', '95', '95', 157, '2024-03-02 03:32:18'),
(1155, 46, '95', '95', '95', '95', 158, '2024-03-02 03:32:18'),
(1156, 47, '95', '95', '95', '95', 158, '2024-03-02 03:32:18'),
(1157, 48, '95', '95', '95', '95', 158, '2024-03-02 03:32:18'),
(1158, 49, '95', '95', '95', '95', 158, '2024-03-02 03:32:18'),
(1159, 50, '95', '95', '95', '95', 158, '2024-03-02 03:32:18'),
(1160, 51, '95', '95', '95', '95', 158, '2024-03-02 03:32:18'),
(1161, 52, '95', '95', '95', '95', 158, '2024-03-02 03:32:18'),
(1162, 46, '95', '95', '95', '95', 159, '2024-03-02 03:32:18'),
(1163, 47, '95', '95', '95', '95', 159, '2024-03-02 03:32:18'),
(1164, 48, '95', '95', '95', '95', 159, '2024-03-02 03:32:18'),
(1165, 49, '95', '95', '95', '95', 159, '2024-03-02 03:32:18'),
(1166, 50, '95', '95', '95', '95', 159, '2024-03-02 03:32:18'),
(1167, 51, '95', '95', '95', '95', 159, '2024-03-02 03:32:18'),
(1168, 52, '95', '95', '95', '95', 159, '2024-03-02 03:32:18'),
(1169, 46, '95', '95', '95', '95', 160, '2024-03-02 03:32:18'),
(1170, 47, '95', '95', '95', '95', 160, '2024-03-02 03:32:18'),
(1171, 48, '95', '95', '95', '95', 160, '2024-03-02 03:32:18'),
(1172, 49, '95', '95', '95', '95', 160, '2024-03-02 03:32:18'),
(1173, 50, '95', '95', '95', '95', 160, '2024-03-02 03:32:18'),
(1174, 51, '95', '95', '95', '95', 160, '2024-03-02 03:32:18'),
(1175, 52, '95', '95', '95', '95', 160, '2024-03-02 03:32:18'),
(1176, 46, '95', '95', '95', '95', 161, '2024-03-02 03:32:18'),
(1177, 47, '95', '95', '95', '95', 161, '2024-03-02 03:32:18'),
(1178, 48, '95', '95', '95', '95', 161, '2024-03-02 03:32:18'),
(1179, 49, '95', '95', '95', '95', 161, '2024-03-02 03:32:18'),
(1180, 50, '95', '95', '95', '95', 161, '2024-03-02 03:32:18'),
(1181, 51, '95', '95', '95', '95', 161, '2024-03-02 03:32:18'),
(1182, 52, '95', '95', '95', '95', 161, '2024-03-02 03:32:18'),
(1183, 46, '95', '95', '95', '95', 162, '2024-03-02 03:32:18'),
(1184, 47, '95', '95', '95', '95', 162, '2024-03-02 03:32:18'),
(1185, 48, '95', '95', '95', '95', 162, '2024-03-02 03:32:18'),
(1186, 49, '95', '95', '95', '95', 162, '2024-03-02 03:32:18'),
(1187, 50, '95', '95', '95', '95', 162, '2024-03-02 03:32:18'),
(1188, 51, '95', '95', '95', '95', 162, '2024-03-02 03:32:18'),
(1189, 52, '95', '95', '95', '95', 162, '2024-03-02 03:32:18'),
(1190, 46, '95', '95', '95', '95', 163, '2024-03-02 03:32:18'),
(1191, 47, '95', '95', '95', '95', 163, '2024-03-02 03:32:18'),
(1192, 48, '95', '95', '95', '95', 163, '2024-03-02 03:32:18'),
(1193, 49, '95', '95', '95', '95', 163, '2024-03-02 03:32:18'),
(1194, 50, '95', '95', '95', '95', 163, '2024-03-02 03:32:18'),
(1195, 51, '95', '95', '95', '95', 163, '2024-03-02 03:32:18'),
(1196, 52, '95', '95', '95', '95', 163, '2024-03-02 03:32:18'),
(1197, 46, '95', '95', '95', '95', 164, '2024-03-02 03:32:18'),
(1198, 47, '95', '95', '95', '95', 164, '2024-03-02 03:32:18'),
(1199, 48, '95', '95', '95', '95', 164, '2024-03-02 03:32:18'),
(1200, 49, '95', '95', '95', '95', 164, '2024-03-02 03:32:18'),
(1201, 50, '95', '95', '95', '95', 164, '2024-03-02 03:32:18'),
(1202, 51, '95', '95', '95', '95', 164, '2024-03-02 03:32:18'),
(1203, 52, '95', '95', '95', '95', 164, '2024-03-02 03:32:18');

-- --------------------------------------------------------

--
-- Table structure for table `markers`
--

CREATE TABLE `markers` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `type` varchar(30) NOT NULL,
  `ps_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `markers`
--

INSERT INTO `markers` (`id`, `name`, `address`, `lat`, `lng`, `type`, `ps_id`) VALUES
(1, 'Children of Mary Academy of Dasmarinas', 'B-26 L-6, Dasma 1, Golden City', 14.349243, 120.981590, 'School', 1),
(2, 'Luke 19:4 Child Development Center Incorporated', '131 Rizal St, San Felipe, 2204 Zambales', 15.059027, 120.072044, 'School', 2);

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `meetings_id` int(11) NOT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `ps_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `meeting_date` date NOT NULL,
  `meeting_time` time NOT NULL,
  `meet_topic` varchar(100) DEFAULT NULL,
  `meet_desc` varchar(100) DEFAULT NULL,
  `meetstatus` varchar(50) NOT NULL CHECK (`meetstatus` in ('Scheduled','Completed','Requested by Parent','Requested by Faculty','Approved by Parent')),
  `setup` varchar(50) NOT NULL CHECK (`setup` in ('Online','Personal/Face to Face')),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`meetings_id`, `faculty_id`, `ps_id`, `user_id`, `meeting_date`, `meeting_time`, `meet_topic`, `meet_desc`, `meetstatus`, `setup`, `created_at`) VALUES
(1, 1, 1, 1000, '2023-09-20', '12:00:00', 'Inquities', 'I have inquiries', 'Scheduled', 'Online', '2024-02-29 08:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `ps_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `en_id` int(11) DEFAULT NULL,
  `FOP` varchar(50) DEFAULT NULL CHECK (`FOP` in ('EPayment','Cash','System Generated')),
  `p_mode` varchar(50) DEFAULT NULL CHECK (`p_mode` in ('Monthly','Full Payment','Partial Payment', 'Quarterly')),
  `payment_for` varchar(50) NOT NULL CHECK (`payment_for` in ('Tuition','Down payment/Enrollment Fee','Others')),
  `payment_status` varchar(50) DEFAULT 'Pending' CHECK (`payment_status` in ('Paid','Pending','Unpaid','Refunded')),
  `amount_paid` varchar(50) DEFAULT NULL,
  `due_amount` varchar(50) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `deadline` date NOT NULL,
  `transact_no` varchar(100) DEFAULT NULL,
  `p_proof` text DEFAULT NULL,
  `paid_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `ps_id`, `user_id`, `en_id`, `FOP`, `p_mode`, `payment_for`, `payment_status`, `amount_paid`, `due_amount`, `payment_date`, `deadline`, `transact_no`, `p_proof`, `paid_at`) VALUES
(1, 1, 1006, 7, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '47488879549', NULL, '2024-03-01 09:19:33'),
(2, 1, 1007, 8, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(3, 1, 1008, 9, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '67095148904', NULL, '2024-03-01 09:19:33'),
(4, 1, 1009, 10, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(5, 1, 1010, 11, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '93009108949', NULL, '2024-03-01 09:19:33'),
(6, 1, 1011, 12, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(7, 1, 1012, 13, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '63760101108', NULL, '2024-03-01 09:19:33'),
(8, 1, 1013, 14, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(9, 1, 1014, 15, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '39773181769', NULL, '2024-03-01 09:19:33'),
(10, 1, 1015, 16, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(11, 1, 1016, 17, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '07585608593', NULL, '2024-03-01 09:19:33'),
(12, 1, 1017, 18, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(13, 1, 1018, 19, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '18608500732', NULL, '2024-03-01 09:19:33'),
(14, 1, 1019, 20, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(15, 1, 1020, 21, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '70285680954', NULL, '2024-03-01 09:19:33'),
(16, 1, 1021, 22, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(17, 1, 1022, 23, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '95602905652', NULL, '2024-03-01 09:19:33'),
(18, 1, 1023, 24, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(19, 1, 1024, 25, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '67157488471', NULL, '2024-03-01 09:19:33'),
(20, 1, 1025, 26, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(21, 1, 1026, 27, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '48978728473', NULL, '2024-03-01 09:19:33'),
(22, 1, 1027, 28, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(23, 1, 1028, 29, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '43421180027', NULL, '2024-03-01 09:19:33'),
(24, 1, 1029, 30, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(25, 1, 1030, 31, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '70169717790', NULL, '2024-03-01 09:19:33'),
(26, 1, 1031, 32, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(27, 1, 1032, 33, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '20585051942', NULL, '2024-03-01 09:19:33'),
(28, 1, 1033, 34, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(29, 1, 1034, 35, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '92416109416', NULL, '2024-03-01 09:19:33'),
(30, 1, 1035, 36, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(31, 1, 1036, 37, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '00325394328', NULL, '2024-03-01 09:19:33'),
(32, 1, 1037, 38, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(33, 1, 1038, 39, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '24378646466', NULL, '2024-03-01 09:19:33'),
(34, 1, 1039, 40, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(35, 1, 1040, 41, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '20917052422', NULL, '2024-03-01 09:19:33'),
(36, 1, 1041, 42, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(37, 1, 1042, 43, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '31449325784', NULL, '2024-03-01 09:19:33'),
(38, 1, 1043, 44, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(39, 1, 1044, 45, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '94495474727', NULL, '2024-03-01 09:19:33'),
(40, 1, 1045, 46, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(41, 1, 1046, 47, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '78129399360', NULL, '2024-03-01 09:19:33'),
(42, 1, 1047, 48, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(43, 1, 1048, 49, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '07160575694', NULL, '2024-03-01 09:19:33'),
(44, 1, 1049, 50, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(45, 1, 1050, 51, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', '01414683462', NULL, '2024-03-01 09:19:33'),
(46, 1, 1051, 52, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '7500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(47, 1, 1052, 53, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '85591693301', NULL, '2024-03-01 09:19:33'),
(48, 1, 1053, 54, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(49, 1, 1054, 55, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '23714419196', NULL, '2024-03-01 09:19:33'),
(50, 1, 1055, 56, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(51, 1, 1056, 57, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '61797019151', NULL, '2024-03-01 09:19:33'),
(52, 1, 1057, 58, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(53, 1, 1058, 59, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '37841841240', NULL, '2024-03-01 09:19:33'),
(54, 1, 1059, 60, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(55, 1, 1060, 61, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '03818151823', NULL, '2024-03-01 09:19:33'),
(56, 1, 1061, 62, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(57, 1, 1062, 63, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '05565238469', NULL, '2024-03-01 09:19:33'),
(58, 1, 1063, 64, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(59, 1, 1064, 65, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '16371739950', NULL, '2024-03-01 09:19:33'),
(60, 1, 1065, 66, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(61, 1, 1066, 67, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '65162987415', NULL, '2024-03-01 09:19:33'),
(62, 1, 1067, 68, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(63, 1, 1068, 69, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '76699720300', NULL, '2024-03-01 09:19:33'),
(64, 1, 1069, 70, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(65, 1, 1070, 71, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '88009642331', NULL, '2024-03-01 09:19:33'),
(66, 1, 1071, 72, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(67, 1, 1072, 73, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '09949053833', NULL, '2024-03-01 09:19:33'),
(68, 1, 1073, 74, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(69, 1, 1074, 75, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '85716345240', NULL, '2024-03-01 09:19:33'),
(70, 1, 1075, 76, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(71, 1, 1076, 77, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '98734567777', NULL, '2024-03-01 09:19:33'),
(72, 1, 1077, 78, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(73, 1, 1078, 79, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '36523806244', NULL, '2024-03-01 09:19:33'),
(74, 1, 1079, 80, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(75, 1, 1080, 81, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '86415330959', NULL, '2024-03-01 09:19:33'),
(76, 1, 1081, 82, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(77, 1, 1082, 83, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '22505239138', NULL, '2024-03-01 09:19:33'),
(78, 1, 1083, 84, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(79, 1, 1084, 85, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '53280205887', NULL, '2024-03-01 09:19:33'),
(80, 1, 1085, 86, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:19:33'),
(81, 2, 1086, 87, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '69265056651', NULL, '2024-03-01 09:25:06'),
(82, 2, 1087, 88, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(83, 2, 1088, 89, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '89606730349', NULL, '2024-03-01 09:25:06'),
(84, 2, 1089, 90, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(85, 2, 1090, 91, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', '40238484870', NULL, '2024-03-01 09:25:06'),
(86, 2, 1091, 92, 'Cash', 'Full Payment', 'Tuition', 'Paid', '10000', '8500', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(87, 2, 1092, 93, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '32372236374', NULL, '2024-03-01 09:25:06'),
(88, 2, 1093, 94, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(89, 2, 1094, 95, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '41145730335', NULL, '2024-03-01 09:25:06'),
(90, 2, 1095, 96, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(91, 2, 1096, 97, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '08611945629', NULL, '2024-03-01 09:25:06'),
(92, 2, 1097, 98, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(93, 2, 1098, 99, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '19622540212', NULL, '2024-03-01 09:25:06'),
(94, 2, 1099, 100, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(95, 2, 1100, 101, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '72276867247', NULL, '2024-03-01 09:25:06'),
(96, 2, 1101, 102, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(97, 2, 1102, 103, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '02516718676', NULL, '2024-03-01 09:25:06'),
(98, 2, 1103, 104, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(99, 2, 1104, 105, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '95752994711', NULL, '2024-03-01 09:25:06'),
(100, 2, 1105, 106, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(101, 2, 1106, 107, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '71214820603', NULL, '2024-03-01 09:25:06'),
(102, 2, 1107, 108, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(103, 2, 1108, 109, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '68815121956', NULL, '2024-03-01 09:25:06'),
(104, 2, 1109, 110, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(105, 2, 1110, 111, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '30431151045', NULL, '2024-03-01 09:25:06'),
(106, 2, 1111, 112, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(107, 2, 1112, 113, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '45710392431', NULL, '2024-03-01 09:25:06'),
(108, 2, 1113, 114, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(109, 2, 1114, 115, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '37258512095', NULL, '2024-03-01 09:25:06'),
(110, 2, 1115, 116, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(111, 2, 1116, 117, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '49161386255', NULL, '2024-03-01 09:25:06'),
(112, 2, 1117, 118, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(113, 2, 1118, 119, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '34031398066', NULL, '2024-03-01 09:25:06'),
(114, 2, 1119, 120, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(115, 2, 1120, 121, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '22672834640', NULL, '2024-03-01 09:25:06'),
(116, 2, 1121, 122, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(117, 2, 1122, 123, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '11269982076', NULL, '2024-03-01 09:25:06'),
(118, 2, 1123, 124, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(119, 2, 1124, 125, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '88331409532', NULL, '2024-03-01 09:25:06'),
(120, 2, 1125, 126, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(121, 2, 1126, 127, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '07847104508', NULL, '2024-03-01 09:25:06'),
(122, 2, 1127, 128, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(123, 2, 1128, 129, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '74241297015', NULL, '2024-03-01 09:25:06'),
(124, 2, 1129, 130, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(125, 2, 1130, 131, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '47665174628', NULL, '2024-03-01 09:25:06'),
(126, 2, 1131, 132, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(127, 2, 1132, 133, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '15601985170', NULL, '2024-03-01 09:25:06'),
(128, 2, 1133, 134, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(129, 2, 1134, 135, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '35014405040', NULL, '2024-03-01 09:25:06'),
(130, 2, 1135, 136, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(131, 2, 1136, 137, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '28266072764', NULL, '2024-03-01 09:25:06'),
(132, 2, 1137, 138, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(133, 2, 1138, 139, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '36287151776', NULL, '2024-03-01 09:25:06'),
(134, 2, 1139, 140, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(135, 2, 1140, 141, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '96637543659', NULL, '2024-03-01 09:25:06'),
(136, 2, 1141, 142, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(137, 2, 1142, 143, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '74326266044', NULL, '2024-03-01 09:25:06'),
(138, 2, 1143, 144, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(139, 2, 1144, 145, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', '81718702317', NULL, '2024-03-01 09:25:06'),
(140, 2, 1145, 146, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2024-03-01', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(141, 2, 1146, 147, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', '85614716526', NULL, '2024-03-01 09:25:06'),
(142, 2, 1147, 148, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(143, 2, 1148, 149, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', '82917478757', NULL, '2024-03-01 09:25:06'),
(144, 2, 1149, 150, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(145, 2, 1150, 151, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', '57743247279', NULL, '2024-03-01 09:25:06'),
(146, 2, 1151, 152, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(147, 2, 1152, 153, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', '39963803197', NULL, '2024-03-01 09:25:06'),
(148, 2, 1153, 154, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(149, 2, 1154, 155, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', '26589277224', NULL, '2024-03-01 09:25:06'),
(150, 2, 1155, 156, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(151, 2, 1156, 157, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', '13054979604', NULL, '2024-03-01 09:25:06'),
(152, 2, 1157, 158, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(153, 2, 1158, 159, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', '85507069420', NULL, '2024-03-01 09:25:06'),
(154, 2, 1159, 160, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(155, 2, 1160, 161, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', '88370411365', NULL, '2024-03-01 09:25:06'),
(156, 2, 1161, 162, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(157, 2, 1162, 163, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', '85330851640', NULL, '2024-03-01 09:25:06'),
(158, 2, 1163, 164, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(159, 2, 1164, 165, 'EPayment', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', '61543027181', NULL, '2024-03-01 09:25:06'),
(160, 2, 1165, 166, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(161, 2, 1000, 2, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'), 
(162, 1, 1000, 3, 'Cash', 'Full Payment', 'Tuition', 'Paid', '7500', '7500', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(163, 2, 1001, 5, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'), 
(164, 2, 1001, 6, 'Cash', 'Full Payment', 'Tuition', 'Paid', '0', '0', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(165, 1, 1000, 1, 'Cash', 'Partial Payment', 'Down payment/Enrollment Fee', 'Paid', '500', '7500', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06'),
(166, 1, 1001, 4, 'Cash', 'Partial Payment', 'Down payment/Enrollment Fee', 'Paid', '500', '7500', '2023-03-02', '2024-04-04', NULL, NULL, '2024-03-01 09:25:06');

INSERT INTO `payment` (`payment_id`, `ps_id`, `user_id`, `en_id`, `p_mode`, `payment_for`, `payment_status`, `due_amount`, `deadline`) VALUES
(167, 1, 1000, 1, 'Partial Payment', 'Tuition', 'Unpaid', '3500', '2023-04-02'),
(168, 1, 1000, 1, 'Partial Payment', 'Tuition', 'Unpaid', '3500', '2023-05-02'),
(169, 1, 1001, 4, 'Partial Payment', 'Tuition', 'Unpaid', '3500', '2023-04-02'),
(170, 1, 1001, 4, 'Partial Payment', 'Tuition', 'Unpaid', '3500', '2023-05-02');

-- --------------------------------------------------------

--
-- Table structure for table `preschool`
--

CREATE TABLE `preschool` (
  `ps_id` int(11) NOT NULL,
  `verification_code` text DEFAULT NULL,
  `school_name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `hours` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `website` varchar(50) DEFAULT NULL,
  `ratings` int(11) DEFAULT NULL,
  `accreditation` text DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Pending' CHECK (`status` in ('Registered','Pending','Deleted')),
  `ps_zoom` text DEFAULT NULL,
  `ps_profile` text DEFAULT 'default-pp.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `preschool`
--

INSERT INTO `preschool` (`ps_id`, `verification_code`, `school_name`, `address`, `hours`, `phone_number`, `email`, `website`, `ratings`, `accreditation`, `status`, `ps_zoom`, `ps_profile`, `created_at`) VALUES
(1, NULL, 'Children of Mary Academy of Dasmariñas Cavite', 'Golden City, Salawag, Dasmariñas Cavite', '8:00 AM - 5:00 PM', '09456706471', 'CMAD@gmail.com', 'cmadph.com', NULL, NULL, 'Registered', 'https://us05web.zoom.us/j/6063549379?pwd=elczSjB2bzN2MWxrYjVGNHV4ckxXUT09', 'cmad.jpg', '2024-02-29 08:33:27'),
(2, NULL, 'Luke 19:4 Child Development Center Incorporated', 'San Felipe, Zambales', '8:00 AM - 5:00 PM', '09183214444', 'lcdc@gmail.com', 'https://www.facebook.com/profile.php?id=1000841468', NULL, NULL, 'Registered', 'https://us05web.zoom.us/j/6063549379?pwd=elczSjB2bzN2MWxrYjVGNHV4ckxXUT09', 'luke.jpg', '2024-02-29 08:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `ps_books`
--

CREATE TABLE `ps_books` (
  `psb_id` int(11) NOT NULL,
  `b_name` varchar(50) DEFAULT NULL,
  `b_author` varchar(50) DEFAULT NULL,
  `b_publisher` varchar(50) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `ps_id` int(11) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ps_books`
--

INSERT INTO `ps_books` (`psb_id`, `b_name`, `b_author`, `b_publisher`, `subject_id`, `ps_id`, `uploaded_at`) VALUES
(1, 'Soaring High in MAPEH', 'Elsa Rivera Mallare', 'St. Augustine Publications, Inc.', 3, 1, '2024-02-29 08:33:27'),
(2, 'Soaring High in MAPEH', 'Elsa Rivera Mallare', 'St. Augustine Publications, Inc.', 29, 2, '2024-02-29 08:33:27'),
(3, 'Step by Step Process in Learning Reading', 'Alexandria H. Reyes', 'St. Augustine Publications, Inc.', 4, 1, '2024-02-29 08:33:27'),
(4, 'Step by Step Process in Learning Reading', 'Alexandria H. Reyes', 'St. Augustine Publications, Inc.', 30, 2, '2024-02-29 08:33:27'),
(5, 'Math Smart', 'Criselle Española-Robes', 'St. Augustine Publications, Inc.', 5, 1, '2024-02-29 08:33:27'),
(6, 'Math Smart', 'Criselle Española-Robes', 'St. Augustine Publications, Inc.', 31, 2, '2024-02-29 08:33:27'),
(7, 'Hiyas—Ang Ating Sibika at Kulturat', 'Julita V. Adame', 'St. Augustine Publications, Inc.', 6, 1, '2024-02-29 08:33:27'),
(8, 'Hiyas—Ang Ating Sibika at Kultura', 'Julita V. Adame', 'St. Augustine Publications, Inc.', 32, 2, '2024-02-29 08:33:27'),
(9, 'Alpabetong Filipino sa Tamang Panahon', 'Jasmin V. Salvador', 'St. Augustine Publications, Inc.', 19, 1, '2024-02-29 08:33:27'),
(10, 'Alpabetong Filipino sa Tamang Panahon', 'Jasmin V. Salvador', 'St. Augustine Publications, Inc.', 45, 2, '2024-02-29 08:33:27'),
(11, 'Learning the World of Language', 'Delia A. Sarmiento', 'St. Augustine Publications, Inc.', 1, 1, '2024-02-29 08:33:27'),
(12, 'Learning the World of Language', 'Delia A. Sarmiento', 'St. Augustine Publications, Inc.', 27, 2, '2024-02-29 08:33:27'),
(13, 'Learning Experiences through Science Exploration', 'Elsa R. Mallare', 'St. Augustine Publications, Inc.', 2, 1, '2024-02-29 08:33:27'),
(14, 'Learning Experiences through Science Exploration', 'Elsa R. Mallare', 'St. Augustine Publications, Inc.', 28, 2, '2024-02-29 08:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `ps_information`
--

CREATE TABLE `ps_information` (
  `psi_id` int(11) NOT NULL,
  `ps_desc` varchar(500) DEFAULT NULL,
  `ps_mission` varchar(500) DEFAULT NULL,
  `ps_vision` varchar(500) DEFAULT NULL,
  `ps_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ps_information`
--

INSERT INTO `ps_information` (`psi_id`, `ps_desc`, `ps_mission`, `ps_vision`, `ps_id`) VALUES
(1, 'Our preschool is dedicated to providing a nurturing environment for young minds to explore, learn, and grow. With a team of passionate educators and a curriculum designed to inspire curiosity, your child will embark on a journey of discovery. Join us in shaping a bright future for your little one!', 'Our mission is to provide a safe and supportive environment that encourages exploration, curiosity, and the development of social and cognitive skills. We aim to instill a lifelong love for learning in each child through engaging activities and a well-rounded curriculum.', 'To be a leading preschool that fosters creativity, critical thinking, and a love for learning in every child.', 2),
(2, 'The Chidlren of Mary School of Cavite is to serve as venue for social transformation through system of education.', 'Our mission is to provide adequate services and functional facilities supportive and conducive for quality education.', 'A caring and commited institutuins thats aims to develop and product a well-disciplined and well-equiped basic skills, attitude and values needed for becoming of children.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ps_media`
--

CREATE TABLE `ps_media` (
  `psm_id` int(11) NOT NULL,
  `photo_name` text DEFAULT NULL,
  `ps_id` int(11) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ps_media`
--

INSERT INTO `ps_media` (`psm_id`, `photo_name`, `ps_id`, `uploaded_at`) VALUES
(1, 'Class-1.jpg', 2, '2024-02-29 08:33:27'),
(2, 'Class.jpg', 2, '2024-02-29 08:33:27'),
(3, 'Flag Ceremony-1.jpg', 2, '2024-02-29 08:33:27'),
(4, 'PARENT ORIENTATION-1.jpg', 2, '2024-02-29 08:33:27'),
(5, 'classrooms - luke.jpg', 2, '2024-02-29 08:33:27'),
(6, 'classroom 2 - luke.jpg', 2, '2024-02-29 08:33:27'),
(7, 'room - cmad.jpg', 1, '2024-02-29 08:33:27'),
(8, 'CMAD front view.jpg', 1, '2024-02-29 08:33:27'),
(9, 'Classroom - CMAD.jpg', 1, '2024-02-29 08:33:27'),
(10, 'classroom1- CMAD.jpg', 1, '2024-02-29 08:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `ratings_id` int(11) NOT NULL,
  `ps_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating_number` decimal(5,2) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`ratings_id`, `ps_id`, `user_id`, `rating_number`, `comments`, `created_at`) VALUES
(1, 1, 1000, 5.00, NULL, '2024-02-29 08:33:27'),
(2, 1, 1001, 1.00, NULL, '2024-02-29 08:33:27'),
(3, 1, 1002, 5.00, NULL, '2024-02-29 08:33:27'),
(4, 1, 1003, 1.00, NULL, '2024-02-29 08:33:27'),
(5, 1, 1004, 5.00, NULL, '2024-02-29 08:33:27'),
(6, 2, 1000, 5.00, NULL, '2024-02-29 08:33:27'),
(7, 2, 1001, 1.00, NULL, '2024-02-29 08:33:27'),
(8, 2, 1002, 5.00, NULL, '2024-02-29 08:33:27'),
(9, 2, 1003, 1.00, NULL, '2024-02-29 08:33:27'),
(10, 2, 1004, 5.00, NULL, '2024-02-29 08:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `scadmins`
--

CREATE TABLE `scadmins` (
  `sca_id` int(11) NOT NULL,
  `sca_username` varchar(50) NOT NULL,
  `sca_password` varchar(50) NOT NULL,
  `verification_code` text DEFAULT NULL,
  `sca_first_name` varchar(50) NOT NULL,
  `sca_last_name` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL CHECK (`role` in ('Admin','Accountant')),
  `ps_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scadmins`
--

INSERT INTO `scadmins` (`sca_id`, `sca_username`, `sca_password`, `verification_code`, `sca_first_name`, `sca_last_name`, `ps_id`, `created_at`, `role`) VALUES
(1, 'A.Carr.03', 'An03Carr', NULL, 'Anne', 'Carr', 1, '2024-02-29 08:33:27', 'Admin'),
(2, 'C.Santos.13', 'Ca13Santos', NULL, 'Carl', 'Santos', 2, '2024-02-29 08:33:27', 'Admin'),
(3, 'I.Phillips.04', 'Iv04Phillips', NULL, 'Iva', 'Phillips', 1, '2024-02-29 08:33:27', 'Accountant'),
(4, 'E.Mendoza.05', 'Eu05Mendoza', NULL, 'Eunice', 'Mendoza', 2, '2024-02-29 08:33:27', 'Accountant');

-- --------------------------------------------------------

--
-- Table structure for table `studrec`
--

CREATE TABLE `studrec` (
  `SR_ID` int(11) NOT NULL,
  `t_present` int(5) DEFAULT NULL,
  `t_absent` int(5) DEFAULT NULL,
  `t_SCDays` int(5) DEFAULT NULL,
  `adviser_ID` int(11) DEFAULT NULL,
  `GWA` varchar(50) DEFAULT NULL,
  `ps_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `en_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studrec`
--

INSERT INTO `studrec` (`SR_ID`, `t_present`, `t_absent`, `t_SCDays`, `adviser_ID`, `GWA`, `ps_id`, `user_id`, `en_id`, `created_at`) VALUES
(1, NULL, NULL, NULL, 1, NULL, 1, 1000, 1, '2024-02-29 08:33:27'),
(2, NULL, NULL, NULL, 2, NULL, 2, 1000, 2, '2024-02-29 08:33:27'),
(3, NULL, NULL, NULL, 1, NULL, 1, 1001, 4, '2024-02-29 08:33:27'),
(4, NULL, NULL, NULL, 2, NULL, 2, 1001, 5, '2024-02-29 08:33:27'),
(5, NULL, NULL, NULL, 1, NULL, 1, 1006, 7, '2024-03-02 02:29:38'),
(6, NULL, NULL, NULL, 1, NULL, 1, 1007, 8, '2024-03-02 02:29:38'),
(7, NULL, NULL, NULL, 1, NULL, 1, 1008, 9, '2024-03-02 02:29:38'),
(8, NULL, NULL, NULL, 1, NULL, 1, 1009, 10, '2024-03-02 02:29:38'),
(9, NULL, NULL, NULL, 1, NULL, 1, 1010, 11, '2024-03-02 02:29:38'),
(10, NULL, NULL, NULL, 1, NULL, 1, 1011, 12, '2024-03-02 02:29:38'),
(11, NULL, NULL, NULL, 1, NULL, 1, 1012, 13, '2024-03-02 02:29:38'),
(12, NULL, NULL, NULL, 1, NULL, 1, 1013, 14, '2024-03-02 02:29:38'),
(13, NULL, NULL, NULL, 1, NULL, 1, 1014, 15, '2024-03-02 02:29:38'),
(14, NULL, NULL, NULL, 1, NULL, 1, 1015, 16, '2024-03-02 02:29:38'),
(15, NULL, NULL, NULL, 1, NULL, 1, 1016, 17, '2024-03-02 02:29:38'),
(16, NULL, NULL, NULL, 1, NULL, 1, 1017, 18, '2024-03-02 02:29:38'),
(17, NULL, NULL, NULL, 1, NULL, 1, 1018, 19, '2024-03-02 02:29:38'),
(18, NULL, NULL, NULL, 1, NULL, 1, 1019, 20, '2024-03-02 02:29:38'),
(19, NULL, NULL, NULL, 1, NULL, 1, 1020, 21, '2024-03-02 02:29:38'),
(20, NULL, NULL, NULL, 1, NULL, 1, 1021, 22, '2024-03-02 02:29:38'),
(21, NULL, NULL, NULL, 1, NULL, 1, 1022, 23, '2024-03-02 02:29:38'),
(22, NULL, NULL, NULL, 1, NULL, 1, 1023, 24, '2024-03-02 02:29:38'),
(23, NULL, NULL, NULL, 1, NULL, 1, 1024, 25, '2024-03-02 02:29:38'),
(24, NULL, NULL, NULL, 1, NULL, 1, 1025, 26, '2024-03-02 02:29:38'),
(25, NULL, NULL, NULL, 2, NULL, 1, 1026, 27, '2024-03-02 02:29:45'),
(26, NULL, NULL, NULL, 2, NULL, 1, 1027, 28, '2024-03-02 02:29:45'),
(27, NULL, NULL, NULL, 2, NULL, 1, 1028, 29, '2024-03-02 02:29:45'),
(28, NULL, NULL, NULL, 2, NULL, 1, 1029, 30, '2024-03-02 02:29:45'),
(29, NULL, NULL, NULL, 2, NULL, 1, 1030, 31, '2024-03-02 02:29:45'),
(30, NULL, NULL, NULL, 2, NULL, 1, 1031, 32, '2024-03-02 02:29:45'),
(31, NULL, NULL, NULL, 2, NULL, 1, 1032, 33, '2024-03-02 02:29:45'),
(32, NULL, NULL, NULL, 2, NULL, 1, 1033, 34, '2024-03-02 02:29:45'),
(33, NULL, NULL, NULL, 2, NULL, 1, 1034, 35, '2024-03-02 02:29:45'),
(34, NULL, NULL, NULL, 2, NULL, 1, 1035, 36, '2024-03-02 02:29:45'),
(35, NULL, NULL, NULL, 2, NULL, 1, 1036, 37, '2024-03-02 02:29:45'),
(36, NULL, NULL, NULL, 2, NULL, 1, 1037, 38, '2024-03-02 02:29:45'),
(37, NULL, NULL, NULL, 2, NULL, 1, 1038, 39, '2024-03-02 02:29:45'),
(38, NULL, NULL, NULL, 2, NULL, 1, 1039, 40, '2024-03-02 02:29:45'),
(39, NULL, NULL, NULL, 2, NULL, 1, 1040, 41, '2024-03-02 02:29:45'),
(40, NULL, NULL, NULL, 2, NULL, 1, 1041, 42, '2024-03-02 02:29:45'),
(41, NULL, NULL, NULL, 2, NULL, 1, 1042, 43, '2024-03-02 02:29:45'),
(42, NULL, NULL, NULL, 2, NULL, 1, 1043, 44, '2024-03-02 02:29:45'),
(43, NULL, NULL, NULL, 2, NULL, 1, 1044, 45, '2024-03-02 02:29:45'),
(44, NULL, NULL, NULL, 2, NULL, 1, 1045, 46, '2024-03-02 02:29:45'),
(45, NULL, NULL, NULL, 3, NULL, 1, 1046, 47, '2024-03-02 02:29:45'),
(46, NULL, NULL, NULL, 3, NULL, 1, 1047, 48, '2024-03-02 02:29:45'),
(47, NULL, NULL, NULL, 3, NULL, 1, 1048, 49, '2024-03-02 02:29:45'),
(48, NULL, NULL, NULL, 3, NULL, 1, 1049, 50, '2024-03-02 02:29:45'),
(49, NULL, NULL, NULL, 3, NULL, 1, 1050, 51, '2024-03-02 02:29:45'),
(50, NULL, NULL, NULL, 3, NULL, 1, 1051, 52, '2024-03-02 02:29:45'),
(51, NULL, NULL, NULL, 3, NULL, 1, 1052, 53, '2024-03-02 02:29:45'),
(52, NULL, NULL, NULL, 3, NULL, 1, 1053, 54, '2024-03-02 02:29:45'),
(53, NULL, NULL, NULL, 3, NULL, 1, 1054, 55, '2024-03-02 02:29:45'),
(54, NULL, NULL, NULL, 3, NULL, 1, 1055, 56, '2024-03-02 02:29:45'),
(55, NULL, NULL, NULL, 3, NULL, 1, 1056, 57, '2024-03-02 02:29:45'),
(56, NULL, NULL, NULL, 3, NULL, 1, 1057, 58, '2024-03-02 02:29:45'),
(57, NULL, NULL, NULL, 3, NULL, 1, 1058, 59, '2024-03-02 02:29:45'),
(58, NULL, NULL, NULL, 3, NULL, 1, 1059, 60, '2024-03-02 02:29:45'),
(59, NULL, NULL, NULL, 3, NULL, 1, 1060, 61, '2024-03-02 02:29:45'),
(60, NULL, NULL, NULL, 3, NULL, 1, 1061, 62, '2024-03-02 02:29:45'),
(61, NULL, NULL, NULL, 3, NULL, 1, 1062, 63, '2024-03-02 02:29:45'),
(62, NULL, NULL, NULL, 3, NULL, 1, 1063, 64, '2024-03-02 02:29:45'),
(63, NULL, NULL, NULL, 3, NULL, 1, 1064, 65, '2024-03-02 02:29:45'),
(64, NULL, NULL, NULL, 3, NULL, 1, 1065, 66, '2024-03-02 02:29:45'),
(65, NULL, NULL, NULL, 4, NULL, 1, 1066, 67, '2024-03-02 02:29:45'),
(66, NULL, NULL, NULL, 4, NULL, 1, 1067, 68, '2024-03-02 02:29:45'),
(67, NULL, NULL, NULL, 4, NULL, 1, 1068, 69, '2024-03-02 02:29:45'),
(68, NULL, NULL, NULL, 4, NULL, 1, 1069, 70, '2024-03-02 02:29:45'),
(69, NULL, NULL, NULL, 4, NULL, 1, 1070, 71, '2024-03-02 02:29:45'),
(70, NULL, NULL, NULL, 4, NULL, 1, 1071, 72, '2024-03-02 02:29:45'),
(71, NULL, NULL, NULL, 4, NULL, 1, 1072, 73, '2024-03-02 02:29:45'),
(72, NULL, NULL, NULL, 4, NULL, 1, 1073, 74, '2024-03-02 02:29:45'),
(73, NULL, NULL, NULL, 4, NULL, 1, 1074, 75, '2024-03-02 02:29:45'),
(74, NULL, NULL, NULL, 4, NULL, 1, 1075, 76, '2024-03-02 02:29:45'),
(75, NULL, NULL, NULL, 4, NULL, 1, 1076, 77, '2024-03-02 02:29:45'),
(76, NULL, NULL, NULL, 4, NULL, 1, 1077, 78, '2024-03-02 02:29:45'),
(77, NULL, NULL, NULL, 4, NULL, 1, 1078, 79, '2024-03-02 02:29:45'),
(78, NULL, NULL, NULL, 4, NULL, 1, 1079, 80, '2024-03-02 02:29:45'),
(79, NULL, NULL, NULL, 4, NULL, 1, 1080, 81, '2024-03-02 02:29:45'),
(80, NULL, NULL, NULL, 4, NULL, 1, 1081, 82, '2024-03-02 02:29:45'),
(81, NULL, NULL, NULL, 4, NULL, 1, 1082, 83, '2024-03-02 02:29:45'),
(82, NULL, NULL, NULL, 4, NULL, 1, 1083, 84, '2024-03-02 02:29:45'),
(83, NULL, NULL, NULL, 4, NULL, 1, 1084, 85, '2024-03-02 02:29:45'),
(84, NULL, NULL, NULL, 4, NULL, 1, 1085, 86, '2024-03-02 02:29:45'),
(85, NULL, NULL, NULL, 5, NULL, 2, 1086, 87, '2024-03-02 02:29:45'),
(86, NULL, NULL, NULL, 5, NULL, 2, 1087, 88, '2024-03-02 02:29:45'),
(87, NULL, NULL, NULL, 5, NULL, 2, 1088, 89, '2024-03-02 02:29:45'),
(88, NULL, NULL, NULL, 5, NULL, 2, 1089, 90, '2024-03-02 02:29:45'),
(89, NULL, NULL, NULL, 5, NULL, 2, 1090, 91, '2024-03-02 02:29:45'),
(90, NULL, NULL, NULL, 5, NULL, 2, 1091, 92, '2024-03-02 02:29:45'),
(91, NULL, NULL, NULL, 5, NULL, 2, 1092, 93, '2024-03-02 02:29:45'),
(92, NULL, NULL, NULL, 5, NULL, 2, 1093, 94, '2024-03-02 02:29:45'),
(93, NULL, NULL, NULL, 5, NULL, 2, 1094, 95, '2024-03-02 02:29:45'),
(94, NULL, NULL, NULL, 5, NULL, 2, 1095, 96, '2024-03-02 02:29:45'),
(95, NULL, NULL, NULL, 5, NULL, 2, 1096, 97, '2024-03-02 02:29:45'),
(96, NULL, NULL, NULL, 5, NULL, 2, 1097, 98, '2024-03-02 02:29:45'),
(97, NULL, NULL, NULL, 5, NULL, 2, 1098, 99, '2024-03-02 02:29:45'),
(98, NULL, NULL, NULL, 5, NULL, 2, 1099, 100, '2024-03-02 02:29:45'),
(99, NULL, NULL, NULL, 5, NULL, 2, 1100, 101, '2024-03-02 02:29:45'),
(100, NULL, NULL, NULL, 5, NULL, 2, 1101, 102, '2024-03-02 02:29:45'),
(101, NULL, NULL, NULL, 5, NULL, 2, 1102, 103, '2024-03-02 02:29:45'),
(102, NULL, NULL, NULL, 5, NULL, 2, 1103, 104, '2024-03-02 02:29:45'),
(103, NULL, NULL, NULL, 5, NULL, 2, 1104, 105, '2024-03-02 02:29:45'),
(104, NULL, NULL, NULL, 5, NULL, 2, 1105, 106, '2024-03-02 02:29:45'),
(105, NULL, NULL, NULL, 6, NULL, 2, 1106, 107, '2024-03-02 02:29:45'),
(106, NULL, NULL, NULL, 6, NULL, 2, 1107, 108, '2024-03-02 02:29:45'),
(107, NULL, NULL, NULL, 6, NULL, 2, 1108, 109, '2024-03-02 02:29:45'),
(108, NULL, NULL, NULL, 6, NULL, 2, 1109, 110, '2024-03-02 02:29:45'),
(109, NULL, NULL, NULL, 6, NULL, 2, 1110, 111, '2024-03-02 02:29:45'),
(110, NULL, NULL, NULL, 6, NULL, 2, 1111, 112, '2024-03-02 02:29:45'),
(111, NULL, NULL, NULL, 6, NULL, 2, 1112, 113, '2024-03-02 02:29:45'),
(112, NULL, NULL, NULL, 6, NULL, 2, 1113, 114, '2024-03-02 02:29:45'),
(113, NULL, NULL, NULL, 6, NULL, 2, 1114, 115, '2024-03-02 02:29:45'),
(114, NULL, NULL, NULL, 6, NULL, 2, 1115, 116, '2024-03-02 02:29:45'),
(115, NULL, NULL, NULL, 6, NULL, 2, 1116, 117, '2024-03-02 02:29:45'),
(116, NULL, NULL, NULL, 6, NULL, 2, 1117, 118, '2024-03-02 02:29:45'),
(117, NULL, NULL, NULL, 6, NULL, 2, 1118, 119, '2024-03-02 02:29:45'),
(118, NULL, NULL, NULL, 6, NULL, 2, 1119, 120, '2024-03-02 02:29:45'),
(119, NULL, NULL, NULL, 6, NULL, 2, 1120, 121, '2024-03-02 02:29:45'),
(120, NULL, NULL, NULL, 6, NULL, 2, 1121, 122, '2024-03-02 02:29:45'),
(121, NULL, NULL, NULL, 6, NULL, 2, 1122, 123, '2024-03-02 02:29:45'),
(122, NULL, NULL, NULL, 6, NULL, 2, 1123, 124, '2024-03-02 02:29:45'),
(123, NULL, NULL, NULL, 6, NULL, 2, 1124, 125, '2024-03-02 02:29:45'),
(124, NULL, NULL, NULL, 6, NULL, 2, 1125, 126, '2024-03-02 02:29:45'),
(125, NULL, NULL, NULL, 7, NULL, 2, 1126, 127, '2024-03-02 02:29:45'),
(126, NULL, NULL, NULL, 7, NULL, 2, 1127, 128, '2024-03-02 02:29:45'),
(127, NULL, NULL, NULL, 7, NULL, 2, 1128, 129, '2024-03-02 02:29:45'),
(128, NULL, NULL, NULL, 7, NULL, 2, 1129, 130, '2024-03-02 02:29:45'),
(129, NULL, NULL, NULL, 7, NULL, 2, 1130, 131, '2024-03-02 02:29:45'),
(130, NULL, NULL, NULL, 7, NULL, 2, 1131, 132, '2024-03-02 02:29:45'),
(131, NULL, NULL, NULL, 7, NULL, 2, 1132, 133, '2024-03-02 02:29:45'),
(132, NULL, NULL, NULL, 7, NULL, 2, 1133, 134, '2024-03-02 02:29:45'),
(133, NULL, NULL, NULL, 7, NULL, 2, 1134, 135, '2024-03-02 02:29:45'),
(134, NULL, NULL, NULL, 7, NULL, 2, 1135, 136, '2024-03-02 02:29:45'),
(135, NULL, NULL, NULL, 7, NULL, 2, 1136, 137, '2024-03-02 02:29:45'),
(136, NULL, NULL, NULL, 7, NULL, 2, 1137, 138, '2024-03-02 02:29:45'),
(137, NULL, NULL, NULL, 7, NULL, 2, 1138, 139, '2024-03-02 02:29:45'),
(138, NULL, NULL, NULL, 7, NULL, 2, 1139, 140, '2024-03-02 02:29:45'),
(139, NULL, NULL, NULL, 7, NULL, 2, 1140, 141, '2024-03-02 02:29:45'),
(140, NULL, NULL, NULL, 7, NULL, 2, 1141, 142, '2024-03-02 02:29:45'),
(141, NULL, NULL, NULL, 7, NULL, 2, 1142, 143, '2024-03-02 02:29:45'),
(142, NULL, NULL, NULL, 7, NULL, 2, 1143, 144, '2024-03-02 02:29:45'),
(143, NULL, NULL, NULL, 7, NULL, 2, 1144, 145, '2024-03-02 02:29:45'),
(144, NULL, NULL, NULL, 7, NULL, 2, 1145, 146, '2024-03-02 02:29:45'),
(145, 180, 0, 180, 8, '95', 2, 1146, 147, '2024-03-02 02:29:45'),
(146, 180, 0, 180, 8, '95', 2, 1147, 148, '2024-03-02 02:29:45'),
(147, 180, 0, 180, 8, '95', 2, 1148, 149, '2024-03-02 02:29:45'),
(148, 180, 0, 180, 8, '95', 2, 1149, 150, '2024-03-02 02:29:45'),
(149, 180, 0, 180, 8, '95', 2, 1150, 151, '2024-03-02 02:29:45'),
(150, 180, 0, 180, 8, '95', 2, 1151, 152, '2024-03-02 02:29:45'),
(151, 180, 0, 180, 8, '95', 2, 1152, 153, '2024-03-02 02:29:45'),
(152, 180, 0, 180, 8, '95', 2, 1153, 154, '2024-03-02 02:29:45'),
(153, 180, 0, 180, 8, '95', 2, 1154, 155, '2024-03-02 02:29:45'),
(154, 180, 0, 180, 8, '95', 2, 1155, 156, '2024-03-02 02:29:45'),
(155, 180, 0, 180, 8, '95', 2, 1156, 157, '2024-03-02 02:29:45'),
(156, 180, 0, 180, 8, '95', 2, 1157, 158, '2024-03-02 02:29:45'),
(157, 180, 0, 180, 8, '95', 2, 1158, 159, '2024-03-02 02:29:45'),
(158, 180, 0, 180, 8, '95', 2, 1159, 160, '2024-03-02 02:29:45'),
(159, 180, 0, 180, 8, '95', 2, 1160, 161, '2024-03-02 02:29:45'),
(160, 180, 0, 180, 8, '95', 2, 1161, 162, '2024-03-02 02:29:45'),
(161, 180, 0, 180, 8, '95', 2, 1162, 163, '2024-03-02 02:29:45'),
(162, 180, 0, 180, 8, '95', 2, 1163, 164, '2024-03-02 02:29:45'),
(163, 180, 0, 180, 8, '95', 2, 1164, 165, '2024-03-02 02:29:45'),
(164, 180, 0, 180, 8, '95', 2, 1165, 166, '2024-03-02 02:29:45');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subjects` varchar(50) NOT NULL CHECK (`subjects` in ('Language','Science','MAPEH','Reading','Mathematics','Araling Panlipunan','Filipino','Christian Living')),
  `adviser_ID` int(11) DEFAULT NULL,
  `ps_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subjects`, `adviser_ID`, `ps_id`, `created_at`) VALUES
(1, 'Language', 1, 1, '2024-02-29 08:33:27'),
(2, 'Science', 1, 1, '2024-02-29 08:33:27'),
(3, 'MAPEH', 1, 1, '2024-02-29 08:33:27'),
(4, 'Reading', 1, 1, '2024-02-29 08:33:27'),
(5, 'Mathematics', 1, 1, '2024-02-29 08:33:27'),
(6, 'Araling Panlipunan', 1, 1, '2024-02-29 08:33:27'),
(7, 'Language', 2, 1, '2024-02-29 08:33:27'),
(8, 'Science', 2, 1, '2024-02-29 08:33:27'),
(9, 'MAPEH', 2, 1, '2024-02-29 08:33:27'),
(10, 'Reading', 2, 1, '2024-02-29 08:33:27'),
(11, 'Mathematics', 2, 1, '2024-02-29 08:33:27'),
(12, 'Araling Panlipunan', 2, 1, '2024-02-29 08:33:27'),
(13, 'Language', 3, 1, '2024-02-29 08:33:27'),
(14, 'Science', 3, 1, '2024-02-29 08:33:27'),
(15, 'MAPEH', 3, 1, '2024-02-29 08:33:27'),
(16, 'Reading', 3, 1, '2024-02-29 08:33:27'),
(17, 'Mathematics', 3, 1, '2024-02-29 08:33:27'),
(18, 'Araling Panlipunan', 3, 1, '2024-02-29 08:33:27'),
(19, 'Filipino', 3, 1, '2024-02-29 08:33:27'),
(20, 'Language', 4, 1, '2024-02-29 08:33:27'),
(21, 'Science', 4, 1, '2024-02-29 08:33:27'),
(22, 'MAPEH', 4, 1, '2024-02-29 08:33:27'),
(23, 'Reading', 4, 1, '2024-02-29 08:33:27'),
(24, 'Mathematics', 4, 1, '2024-02-29 08:33:27'),
(25, 'Araling Panlipunan', 4, 1, '2024-02-29 08:33:27'),
(26, 'Filipino', 4, 1, '2024-02-29 08:33:27'),
(27, 'Language', 5, 2, '2024-02-29 08:33:27'),
(28, 'Science', 5, 2, '2024-02-29 08:33:27'),
(29, 'MAPEH', 5, 2, '2024-02-29 08:33:27'),
(30, 'Reading', 5, 2, '2024-02-29 08:33:27'),
(31, 'Mathematics', 5, 2, '2024-02-29 08:33:27'),
(32, 'Araling Panlipunan', 5, 2, '2024-02-29 08:33:27'),
(33, 'Language', 6, 2, '2024-02-29 08:33:27'),
(34, 'Science', 6, 2, '2024-02-29 08:33:27'),
(35, 'MAPEH', 6, 2, '2024-02-29 08:33:27'),
(36, 'Reading', 6, 2, '2024-02-29 08:33:27'),
(37, 'Mathematics', 6, 2, '2024-02-29 08:33:27'),
(38, 'Araling Panlipunan', 6, 2, '2024-02-29 08:33:27'),
(39, 'Language', 7, 2, '2024-02-29 08:33:27'),
(40, 'Science', 7, 2, '2024-02-29 08:33:27'),
(41, 'MAPEH', 7, 2, '2024-02-29 08:33:27'),
(42, 'Reading', 7, 2, '2024-02-29 08:33:27'),
(43, 'Mathematics', 7, 2, '2024-02-29 08:33:27'),
(44, 'Araling Panlipunan', 7, 2, '2024-02-29 08:33:27'),
(45, 'Filipino', 7, 2, '2024-02-29 08:33:27'),
(46, 'Language', 8, 2, '2024-02-29 08:33:27'),
(47, 'Science', 8, 2, '2024-02-29 08:33:27'),
(48, 'MAPEH', 8, 2, '2024-02-29 08:33:27'),
(49, 'Reading', 8, 2, '2024-02-29 08:33:27'),
(50, 'Mathematics', 8, 2, '2024-02-29 08:33:27'),
(51, 'Araling Panlipunan', 8, 2, '2024-02-29 08:33:27'),
(52, 'Filipino', 8, 2, '2024-02-29 08:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `verification_code` text DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `sex` varchar(50) NOT NULL CHECK (`sex` in ('Male','Female')),
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `user_username` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `pp` text DEFAULT 'default-pp.jpg',
  `verification_token` varchar(255) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `verification_code`, `first_name`, `last_name`, `sex`, `email`, `phone_number`, `user_username`, `user_password`, `pp`, `verification_token`, `verified`, `created_at`) VALUES
(1000, NULL, 'Mae', 'Solis', 'Female', 'mae_solis@gmail.com', '09154457789', 'M.Solis.01', 'Ma01Solis', 'Mae.jpg', NULL, 1, '2024-02-29 08:33:27'),
(1001, NULL, 'Mark', 'Bautista', 'Male', 'mark_bautista@gmail.com', '09629986645', 'M.Bautista.02', 'Ma02Bautista', 'Mark.jpg', NULL, 1, '2024-02-29 08:33:27'),
(1002, NULL, 'Alina', 'Gomez', 'Female', 'alina_gomez@gmail.com', '097585166490', 'A.Gomez.20', 'Al20Gomez', 'Alina.png', NULL, 1, '2024-02-29 08:33:27'),
(1003, NULL, 'Ron', 'Osteo', 'Male', 'ron_osteo@gmail.com', '09854616697', 'R.Osteo.21', 'Ro21Osteo', 'Ron.jpg', NULL, 1, '2024-02-29 08:33:27'),
(1004, NULL, 'Lin', 'Guzman', 'Female', 'lin_guzman@gmail.com', '096458266130', 'L.Guzman.22', 'Li22Guzman', 'Lin.png', NULL, 1, '2024-02-29 08:33:27'),
(1005, NULL, 'Juan', 'Cruz', 'Male', 'juan_cruz@gmail.com', '09864259975', 'J.Cruz.23', 'Ju23Cruz', 'Juan.jpg', NULL, 1, '2024-02-29 08:33:27'),
(1006, NULL, 'FirstName0', 'LastName0', 'Female', 'user0@example.com', '091234567800', 'user0', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1007, NULL, 'FirstName1', 'LastName1', 'Male', 'user1@example.com', '091234567801', 'user1', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1008, NULL, 'FirstName2', 'LastName2', 'Female', 'user2@example.com', '091234567802', 'user2', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1009, NULL, 'FirstName3', 'LastName3', 'Male', 'user3@example.com', '091234567803', 'user3', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1010, NULL, 'FirstName4', 'LastName4', 'Female', 'user4@example.com', '091234567804', 'user4', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1011, NULL, 'FirstName5', 'LastName5', 'Male', 'user5@example.com', '091234567805', 'user5', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1012, NULL, 'FirstName6', 'LastName6', 'Female', 'user6@example.com', '091234567806', 'user6', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1013, NULL, 'FirstName7', 'LastName7', 'Male', 'user7@example.com', '091234567807', 'user7', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1014, NULL, 'FirstName8', 'LastName8', 'Female', 'user8@example.com', '091234567808', 'user8', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1015, NULL, 'FirstName9', 'LastName9', 'Male', 'user9@example.com', '091234567809', 'user9', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1016, NULL, 'FirstName10', 'LastName10', 'Female', 'user10@example.com', '091234567810', 'user10', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1017, NULL, 'FirstName11', 'LastName11', 'Male', 'user11@example.com', '091234567811', 'user11', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1018, NULL, 'FirstName12', 'LastName12', 'Female', 'user12@example.com', '091234567812', 'user12', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1019, NULL, 'FirstName13', 'LastName13', 'Male', 'user13@example.com', '091234567813', 'user13', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1020, NULL, 'FirstName14', 'LastName14', 'Female', 'user14@example.com', '091234567814', 'user14', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1021, NULL, 'FirstName15', 'LastName15', 'Male', 'user15@example.com', '091234567815', 'user15', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1022, NULL, 'FirstName16', 'LastName16', 'Female', 'user16@example.com', '091234567816', 'user16', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1023, NULL, 'FirstName17', 'LastName17', 'Male', 'user17@example.com', '091234567817', 'user17', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1024, NULL, 'FirstName18', 'LastName18', 'Female', 'user18@example.com', '091234567818', 'user18', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1025, NULL, 'FirstName19', 'LastName19', 'Male', 'user19@example.com', '091234567819', 'user19', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1026, NULL, 'FirstName20', 'LastName20', 'Female', 'user20@example.com', '091234567820', 'user20', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1027, NULL, 'FirstName21', 'LastName21', 'Male', 'user21@example.com', '091234567821', 'user21', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1028, NULL, 'FirstName22', 'LastName22', 'Female', 'user22@example.com', '091234567822', 'user22', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1029, NULL, 'FirstName23', 'LastName23', 'Male', 'user23@example.com', '091234567823', 'user23', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1030, NULL, 'FirstName24', 'LastName24', 'Female', 'user24@example.com', '091234567824', 'user24', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1031, NULL, 'FirstName25', 'LastName25', 'Male', 'user25@example.com', '091234567825', 'user25', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1032, NULL, 'FirstName26', 'LastName26', 'Female', 'user26@example.com', '091234567826', 'user26', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1033, NULL, 'FirstName27', 'LastName27', 'Male', 'user27@example.com', '091234567827', 'user27', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1034, NULL, 'FirstName28', 'LastName28', 'Female', 'user28@example.com', '091234567828', 'user28', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1035, NULL, 'FirstName29', 'LastName29', 'Male', 'user29@example.com', '091234567829', 'user29', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1036, NULL, 'FirstName30', 'LastName30', 'Female', 'user30@example.com', '091234567830', 'user30', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1037, NULL, 'FirstName31', 'LastName31', 'Male', 'user31@example.com', '091234567831', 'user31', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1038, NULL, 'FirstName32', 'LastName32', 'Female', 'user32@example.com', '091234567832', 'user32', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1039, NULL, 'FirstName33', 'LastName33', 'Male', 'user33@example.com', '091234567833', 'user33', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1040, NULL, 'FirstName34', 'LastName34', 'Female', 'user34@example.com', '091234567834', 'user34', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1041, NULL, 'FirstName35', 'LastName35', 'Male', 'user35@example.com', '091234567835', 'user35', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1042, NULL, 'FirstName36', 'LastName36', 'Female', 'user36@example.com', '091234567836', 'user36', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1043, NULL, 'FirstName37', 'LastName37', 'Male', 'user37@example.com', '091234567837', 'user37', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1044, NULL, 'FirstName38', 'LastName38', 'Female', 'user38@example.com', '091234567838', 'user38', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1045, NULL, 'FirstName39', 'LastName39', 'Male', 'user39@example.com', '091234567839', 'user39', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1046, NULL, 'FirstName40', 'LastName40', 'Female', 'user40@example.com', '091234567840', 'user40', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1047, NULL, 'FirstName41', 'LastName41', 'Male', 'user41@example.com', '091234567841', 'user41', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1048, NULL, 'FirstName42', 'LastName42', 'Female', 'user42@example.com', '091234567842', 'user42', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1049, NULL, 'FirstName43', 'LastName43', 'Male', 'user43@example.com', '091234567843', 'user43', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1050, NULL, 'FirstName44', 'LastName44', 'Female', 'user44@example.com', '091234567844', 'user44', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1051, NULL, 'FirstName45', 'LastName45', 'Male', 'user45@example.com', '091234567845', 'user45', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1052, NULL, 'FirstName46', 'LastName46', 'Female', 'user46@example.com', '091234567846', 'user46', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1053, NULL, 'FirstName47', 'LastName47', 'Male', 'user47@example.com', '091234567847', 'user47', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1054, NULL, 'FirstName48', 'LastName48', 'Female', 'user48@example.com', '091234567848', 'user48', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1055, NULL, 'FirstName49', 'LastName49', 'Male', 'user49@example.com', '091234567849', 'user49', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1056, NULL, 'FirstName50', 'LastName50', 'Female', 'user50@example.com', '091234567850', 'user50', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1057, NULL, 'FirstName51', 'LastName51', 'Male', 'user51@example.com', '091234567851', 'user51', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1058, NULL, 'FirstName52', 'LastName52', 'Female', 'user52@example.com', '091234567852', 'user52', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1059, NULL, 'FirstName53', 'LastName53', 'Male', 'user53@example.com', '091234567853', 'user53', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1060, NULL, 'FirstName54', 'LastName54', 'Female', 'user54@example.com', '091234567854', 'user54', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1061, NULL, 'FirstName55', 'LastName55', 'Male', 'user55@example.com', '091234567855', 'user55', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1062, NULL, 'FirstName56', 'LastName56', 'Female', 'user56@example.com', '091234567856', 'user56', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1063, NULL, 'FirstName57', 'LastName57', 'Male', 'user57@example.com', '091234567857', 'user57', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1064, NULL, 'FirstName58', 'LastName58', 'Female', 'user58@example.com', '091234567858', 'user58', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1065, NULL, 'FirstName59', 'LastName59', 'Male', 'user59@example.com', '091234567859', 'user59', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1066, NULL, 'FirstName60', 'LastName60', 'Female', 'user60@example.com', '091234567860', 'user60', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1067, NULL, 'FirstName61', 'LastName61', 'Male', 'user61@example.com', '091234567861', 'user61', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1068, NULL, 'FirstName62', 'LastName62', 'Female', 'user62@example.com', '091234567862', 'user62', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1069, NULL, 'FirstName63', 'LastName63', 'Male', 'user63@example.com', '091234567863', 'user63', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1070, NULL, 'FirstName64', 'LastName64', 'Female', 'user64@example.com', '091234567864', 'user64', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1071, NULL, 'FirstName65', 'LastName65', 'Male', 'user65@example.com', '091234567865', 'user65', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1072, NULL, 'FirstName66', 'LastName66', 'Female', 'user66@example.com', '091234567866', 'user66', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1073, NULL, 'FirstName67', 'LastName67', 'Male', 'user67@example.com', '091234567867', 'user67', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1074, NULL, 'FirstName68', 'LastName68', 'Female', 'user68@example.com', '091234567868', 'user68', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1075, NULL, 'FirstName69', 'LastName69', 'Male', 'user69@example.com', '091234567869', 'user69', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1076, NULL, 'FirstName70', 'LastName70', 'Female', 'user70@example.com', '091234567870', 'user70', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1077, NULL, 'FirstName71', 'LastName71', 'Male', 'user71@example.com', '091234567871', 'user71', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1078, NULL, 'FirstName72', 'LastName72', 'Female', 'user72@example.com', '091234567872', 'user72', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1079, NULL, 'FirstName73', 'LastName73', 'Male', 'user73@example.com', '091234567873', 'user73', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1080, NULL, 'FirstName74', 'LastName74', 'Female', 'user74@example.com', '091234567874', 'user74', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1081, NULL, 'FirstName75', 'LastName75', 'Male', 'user75@example.com', '091234567875', 'user75', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1082, NULL, 'FirstName76', 'LastName76', 'Female', 'user76@example.com', '091234567876', 'user76', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1083, NULL, 'FirstName77', 'LastName77', 'Male', 'user77@example.com', '091234567877', 'user77', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1084, NULL, 'FirstName78', 'LastName78', 'Female', 'user78@example.com', '091234567878', 'user78', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1085, NULL, 'FirstName79', 'LastName79', 'Male', 'user79@example.com', '091234567879', 'user79', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1086, NULL, 'FirstName80', 'LastName80', 'Female', 'user80@example.com', '091234567880', 'user80', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1087, NULL, 'FirstName81', 'LastName81', 'Male', 'user81@example.com', '091234567881', 'user81', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1088, NULL, 'FirstName82', 'LastName82', 'Female', 'user82@example.com', '091234567882', 'user82', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1089, NULL, 'FirstName83', 'LastName83', 'Male', 'user83@example.com', '091234567883', 'user83', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1090, NULL, 'FirstName84', 'LastName84', 'Female', 'user84@example.com', '091234567884', 'user84', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1091, NULL, 'FirstName85', 'LastName85', 'Male', 'user85@example.com', '091234567885', 'user85', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1092, NULL, 'FirstName86', 'LastName86', 'Female', 'user86@example.com', '091234567886', 'user86', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1093, NULL, 'FirstName87', 'LastName87', 'Male', 'user87@example.com', '091234567887', 'user87', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1094, NULL, 'FirstName88', 'LastName88', 'Female', 'user88@example.com', '091234567888', 'user88', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1095, NULL, 'FirstName89', 'LastName89', 'Male', 'user89@example.com', '091234567889', 'user89', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1096, NULL, 'FirstName90', 'LastName90', 'Female', 'user90@example.com', '091234567890', 'user90', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1097, NULL, 'FirstName91', 'LastName91', 'Male', 'user91@example.com', '091234567891', 'user91', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1098, NULL, 'FirstName92', 'LastName92', 'Female', 'user92@example.com', '091234567892', 'user92', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1099, NULL, 'FirstName93', 'LastName93', 'Male', 'user93@example.com', '091234567893', 'user93', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1100, NULL, 'FirstName94', 'LastName94', 'Female', 'user94@example.com', '091234567894', 'user94', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1101, NULL, 'FirstName95', 'LastName95', 'Male', 'user95@example.com', '091234567895', 'user95', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1102, NULL, 'FirstName96', 'LastName96', 'Female', 'user96@example.com', '091234567896', 'user96', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1103, NULL, 'FirstName97', 'LastName97', 'Male', 'user97@example.com', '091234567897', 'user97', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1104, NULL, 'FirstName98', 'LastName98', 'Female', 'user98@example.com', '091234567898', 'user98', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1105, NULL, 'FirstName99', 'LastName99', 'Male', 'user99@example.com', '091234567899', 'user99', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1106, NULL, 'FirstName100', 'LastName100', 'Female', 'user100@example.com', '091234567810', 'user100', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1107, NULL, 'FirstName101', 'LastName101', 'Male', 'user101@example.com', '091234567810', 'user101', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1108, NULL, 'FirstName102', 'LastName102', 'Female', 'user102@example.com', '091234567810', 'user102', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1109, NULL, 'FirstName103', 'LastName103', 'Male', 'user103@example.com', '091234567810', 'user103', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1110, NULL, 'FirstName104', 'LastName104', 'Female', 'user104@example.com', '091234567810', 'user104', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1111, NULL, 'FirstName105', 'LastName105', 'Male', 'user105@example.com', '091234567810', 'user105', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1112, NULL, 'FirstName106', 'LastName106', 'Female', 'user106@example.com', '091234567810', 'user106', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1113, NULL, 'FirstName107', 'LastName107', 'Male', 'user107@example.com', '091234567810', 'user107', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1114, NULL, 'FirstName108', 'LastName108', 'Female', 'user108@example.com', '091234567810', 'user108', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1115, NULL, 'FirstName109', 'LastName109', 'Male', 'user109@example.com', '091234567810', 'user109', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1116, NULL, 'FirstName110', 'LastName110', 'Female', 'user110@example.com', '091234567811', 'user110', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1117, NULL, 'FirstName111', 'LastName111', 'Male', 'user111@example.com', '091234567811', 'user111', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1118, NULL, 'FirstName112', 'LastName112', 'Female', 'user112@example.com', '091234567811', 'user112', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1119, NULL, 'FirstName113', 'LastName113', 'Male', 'user113@example.com', '091234567811', 'user113', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1120, NULL, 'FirstName114', 'LastName114', 'Female', 'user114@example.com', '091234567811', 'user114', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1121, NULL, 'FirstName115', 'LastName115', 'Male', 'user115@example.com', '091234567811', 'user115', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1122, NULL, 'FirstName116', 'LastName116', 'Female', 'user116@example.com', '091234567811', 'user116', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1123, NULL, 'FirstName117', 'LastName117', 'Male', 'user117@example.com', '091234567811', 'user117', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1124, NULL, 'FirstName118', 'LastName118', 'Female', 'user118@example.com', '091234567811', 'user118', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1125, NULL, 'FirstName119', 'LastName119', 'Male', 'user119@example.com', '091234567811', 'user119', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1126, NULL, 'FirstName120', 'LastName120', 'Female', 'user120@example.com', '091234567812', 'user120', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1127, NULL, 'FirstName121', 'LastName121', 'Male', 'user121@example.com', '091234567812', 'user121', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1128, NULL, 'FirstName122', 'LastName122', 'Female', 'user122@example.com', '091234567812', 'user122', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1129, NULL, 'FirstName123', 'LastName123', 'Male', 'user123@example.com', '091234567812', 'user123', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1130, NULL, 'FirstName124', 'LastName124', 'Female', 'user124@example.com', '091234567812', 'user124', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1131, NULL, 'FirstName125', 'LastName125', 'Male', 'user125@example.com', '091234567812', 'user125', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1132, NULL, 'FirstName126', 'LastName126', 'Female', 'user126@example.com', '091234567812', 'user126', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1133, NULL, 'FirstName127', 'LastName127', 'Male', 'user127@example.com', '091234567812', 'user127', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1134, NULL, 'FirstName128', 'LastName128', 'Female', 'user128@example.com', '091234567812', 'user128', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1135, NULL, 'FirstName129', 'LastName129', 'Male', 'user129@example.com', '091234567812', 'user129', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1136, NULL, 'FirstName130', 'LastName130', 'Female', 'user130@example.com', '091234567813', 'user130', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1137, NULL, 'FirstName131', 'LastName131', 'Male', 'user131@example.com', '091234567813', 'user131', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1138, NULL, 'FirstName132', 'LastName132', 'Female', 'user132@example.com', '091234567813', 'user132', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1139, NULL, 'FirstName133', 'LastName133', 'Male', 'user133@example.com', '091234567813', 'user133', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1140, NULL, 'FirstName134', 'LastName134', 'Female', 'user134@example.com', '091234567813', 'user134', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1141, NULL, 'FirstName135', 'LastName135', 'Male', 'user135@example.com', '091234567813', 'user135', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1142, NULL, 'FirstName136', 'LastName136', 'Female', 'user136@example.com', '091234567813', 'user136', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1143, NULL, 'FirstName137', 'LastName137', 'Male', 'user137@example.com', '091234567813', 'user137', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1144, NULL, 'FirstName138', 'LastName138', 'Female', 'user138@example.com', '091234567813', 'user138', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1145, NULL, 'FirstName139', 'LastName139', 'Male', 'user139@example.com', '091234567813', 'user139', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1146, NULL, 'FirstName140', 'LastName140', 'Female', 'user140@example.com', '091234567814', 'user140', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1147, NULL, 'FirstName141', 'LastName141', 'Male', 'user141@example.com', '091234567814', 'user141', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1148, NULL, 'FirstName142', 'LastName142', 'Female', 'user142@example.com', '091234567814', 'user142', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1149, NULL, 'FirstName143', 'LastName143', 'Male', 'user143@example.com', '091234567814', 'user143', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1150, NULL, 'FirstName144', 'LastName144', 'Female', 'user144@example.com', '091234567814', 'user144', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1151, NULL, 'FirstName145', 'LastName145', 'Male', 'user145@example.com', '091234567814', 'user145', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1152, NULL, 'FirstName146', 'LastName146', 'Female', 'user146@example.com', '091234567814', 'user146', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1153, NULL, 'FirstName147', 'LastName147', 'Male', 'user147@example.com', '091234567814', 'user147', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1154, NULL, 'FirstName148', 'LastName148', 'Female', 'user148@example.com', '091234567814', 'user148', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1155, NULL, 'FirstName149', 'LastName149', 'Male', 'user149@example.com', '091234567814', 'user149', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1156, NULL, 'FirstName150', 'LastName150', 'Female', 'user150@example.com', '091234567815', 'user150', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1157, NULL, 'FirstName151', 'LastName151', 'Male', 'user151@example.com', '091234567815', 'user151', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1158, NULL, 'FirstName152', 'LastName152', 'Female', 'user152@example.com', '091234567815', 'user152', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1159, NULL, 'FirstName153', 'LastName153', 'Male', 'user153@example.com', '091234567815', 'user153', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1160, NULL, 'FirstName154', 'LastName154', 'Female', 'user154@example.com', '091234567815', 'user154', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1161, NULL, 'FirstName155', 'LastName155', 'Male', 'user155@example.com', '091234567815', 'user155', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1162, NULL, 'FirstName156', 'LastName156', 'Female', 'user156@example.com', '091234567815', 'user156', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1163, NULL, 'FirstName157', 'LastName157', 'Male', 'user157@example.com', '091234567815', 'user157', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1164, NULL, 'FirstName158', 'LastName158', 'Female', 'user158@example.com', '091234567815', 'user158', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12'),
(1165, NULL, 'FirstName159', 'LastName159', 'Male', 'user159@example.com', '091234567815', 'user159', 'password123', 'default-pp.jpg', NULL, 1, '2024-02-29 08:35:12');

-- --------------------------------------------------------

--
-- Table structure for table `webadmins`
--

CREATE TABLE `webadmins` (
  `wba_id` int(11) NOT NULL,
  `wba_username` varchar(50) NOT NULL,
  `wba_password` varchar(50) NOT NULL,
  `wba_first_name` varchar(50) NOT NULL,
  `wba_last_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `webadmins`
--

INSERT INTO `webadmins` (`wba_id`, `wba_username`, `wba_password`, `wba_first_name`, `wba_last_name`, `created_at`) VALUES
(1, 'J.Bautista.05', 'Ja05Bautista', 'Jaymar', 'Bautista', '2024-02-29 08:33:27'),
(2, 'N.Magtalas.06', 'Ne06Magtalas', 'Neariah', 'Magtalas', '2024-02-29 08:33:27'),
(3, 'E.Ganiban.07', 'Er07Ganiban', 'Ericka', ' Ganiban', '2024-02-29 08:33:27'),
(4, 'D.Namoro.08', 'De08Namoro', 'Delby', 'Namoro', '2024-02-29 08:33:27');

--
-- Indexes for dumped tables
--

CREATE TABLE IF NOT EXISTS archive_enroll LIKE enroll;
CREATE TABLE IF NOT EXISTS archive_payment LIKE payment;
CREATE TABLE IF NOT EXISTS archive_studrec LIKE studrec;
CREATE TABLE IF NOT EXISTS archive_grades_per_subject LIKE grades_per_subject;
CREATE TABLE IF NOT EXISTS archive_attendance LIKE attendance;

--
-- Indexes for table `adviser`
--
ALTER TABLE `adviser`
  ADD PRIMARY KEY (`adviser_ID`),
  ADD KEY `faculty_id` (`faculty_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `SR_ID` (`SR_ID`),
  ADD KEY `adviser_ID` (`adviser_ID`);

--
-- Indexes for table `bd_fees_ps`
--
ALTER TABLE `bd_fees_ps`
  ADD PRIMARY KEY (`bdf_id`),
  ADD KEY `ps_id` (`ps_id`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`en_id`),
  ADD UNIQUE KEY `lrn` (`lrn`),
  ADD KEY `ps_id` (`ps_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `sca_id` (`sca_id`),
  ADD KEY `ps_id` (`ps_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`faculty_id`),
  ADD KEY `sca_id` (`sca_id`),
  ADD KEY `ps_id` (`ps_id`);

--
-- Indexes for table `fees_ps`
--
ALTER TABLE `fees_ps`
  ADD PRIMARY KEY (`psf_id`),
  ADD KEY `ps_id` (`ps_id`);

--
-- Indexes for table `grades_per_subject`
--
ALTER TABLE `grades_per_subject`
  ADD PRIMARY KEY (`grades_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `SR_ID` (`SR_ID`);

--
-- Indexes for table `markers`
--
ALTER TABLE `markers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ps_id` (`ps_id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`meetings_id`),
  ADD KEY `faculty_id` (`faculty_id`),
  ADD KEY `ps_id` (`ps_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `ps_id` (`ps_id`),
  ADD KEY `en_id` (`en_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `preschool`
--
ALTER TABLE `preschool`
  ADD PRIMARY KEY (`ps_id`);

--
-- Indexes for table `ps_books`
--
ALTER TABLE `ps_books`
  ADD PRIMARY KEY (`psb_id`),
  ADD KEY `ps_id` (`ps_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `ps_information`
--
ALTER TABLE `ps_information`
  ADD PRIMARY KEY (`psi_id`),
  ADD KEY `ps_id` (`ps_id`);

--
-- Indexes for table `ps_media`
--
ALTER TABLE `ps_media`
  ADD PRIMARY KEY (`psm_id`),
  ADD KEY `ps_id` (`ps_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`ratings_id`),
  ADD KEY `ps_id` (`ps_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `scadmins`
--
ALTER TABLE `scadmins`
  ADD PRIMARY KEY (`sca_id`),
  ADD KEY `ps_id` (`ps_id`);

--
-- Indexes for table `studrec`
--
ALTER TABLE `studrec`
  ADD PRIMARY KEY (`SR_ID`),
  ADD KEY `adviser_ID` (`adviser_ID`),
  ADD KEY `ps_id` (`ps_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `en_id` (`en_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `adviser_ID` (`adviser_ID`),
  ADD KEY `ps_id` (`ps_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `webadmins`
--
ALTER TABLE `webadmins`
  ADD PRIMARY KEY (`wba_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adviser`
--
ALTER TABLE `adviser`
  MODIFY `adviser_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `bd_fees_ps`
--
ALTER TABLE `bd_fees_ps`
  MODIFY `bdf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `enroll`
--
ALTER TABLE `enroll`
  MODIFY `en_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `faculty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fees_ps`
--
ALTER TABLE `fees_ps`
  MODIFY `psf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `grades_per_subject`
--
ALTER TABLE `grades_per_subject`
  MODIFY `grades_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1204;

--
-- AUTO_INCREMENT for table `markers`
--
ALTER TABLE `markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `meetings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `preschool`
--
ALTER TABLE `preschool`
  MODIFY `ps_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ps_books`
--
ALTER TABLE `ps_books`
  MODIFY `psb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ps_information`
--
ALTER TABLE `ps_information`
  MODIFY `psi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ps_media`
--
ALTER TABLE `ps_media`
  MODIFY `psm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `ratings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `scadmins`
--
ALTER TABLE `scadmins`
  MODIFY `sca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `studrec`
--
ALTER TABLE `studrec`
  MODIFY `SR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1166;

--
-- AUTO_INCREMENT for table `webadmins`
--
ALTER TABLE `webadmins`
  MODIFY `wba_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adviser`
--
ALTER TABLE `adviser`
  ADD CONSTRAINT `adviser_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`SR_ID`) REFERENCES `studrec` (`SR_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`adviser_ID`) REFERENCES `adviser` (`adviser_ID`) ON DELETE CASCADE;

--
-- Constraints for table `bd_fees_ps`
--
ALTER TABLE `bd_fees_ps`
  ADD CONSTRAINT `bd_fees_ps_ibfk_1` FOREIGN KEY (`ps_id`) REFERENCES `preschool` (`ps_id`) ON DELETE CASCADE;

--
-- Constraints for table `enroll`
--
ALTER TABLE `enroll`
  ADD CONSTRAINT `enroll_ibfk_1` FOREIGN KEY (`ps_id`) REFERENCES `preschool` (`ps_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `enroll_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`sca_id`) REFERENCES `scadmins` (`sca_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`ps_id`) REFERENCES `preschool` (`ps_id`) ON DELETE CASCADE;

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`sca_id`) REFERENCES `scadmins` (`sca_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `faculty_ibfk_2` FOREIGN KEY (`ps_id`) REFERENCES `preschool` (`ps_id`) ON DELETE CASCADE;

--
-- Constraints for table `fees_ps`
--
ALTER TABLE `fees_ps`
  ADD CONSTRAINT `fees_ps_ibfk_1` FOREIGN KEY (`ps_id`) REFERENCES `preschool` (`ps_id`) ON DELETE CASCADE;

--
-- Constraints for table `grades_per_subject`
--
ALTER TABLE `grades_per_subject`
  ADD CONSTRAINT `grades_per_subject_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grades_per_subject_ibfk_2` FOREIGN KEY (`SR_ID`) REFERENCES `studrec` (`SR_ID`) ON DELETE CASCADE;

--
-- Constraints for table `markers`
--
ALTER TABLE `markers`
  ADD CONSTRAINT `markers_ibfk_1` FOREIGN KEY (`ps_id`) REFERENCES `preschool` (`ps_id`) ON DELETE CASCADE;

--
-- Constraints for table `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meetings_ibfk_2` FOREIGN KEY (`ps_id`) REFERENCES `preschool` (`ps_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meetings_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`ps_id`) REFERENCES `preschool` (`ps_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`en_id`) REFERENCES `enroll` (`en_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `ps_books`
--
ALTER TABLE `ps_books`
  ADD CONSTRAINT `ps_books_ibfk_1` FOREIGN KEY (`ps_id`) REFERENCES `preschool` (`ps_id`),
  ADD CONSTRAINT `ps_books_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE;

--
-- Constraints for table `ps_information`
--
ALTER TABLE `ps_information`
  ADD CONSTRAINT `ps_information_ibfk_1` FOREIGN KEY (`ps_id`) REFERENCES `preschool` (`ps_id`) ON DELETE CASCADE;

--
-- Constraints for table `ps_media`
--
ALTER TABLE `ps_media`
  ADD CONSTRAINT `ps_media_ibfk_1` FOREIGN KEY (`ps_id`) REFERENCES `preschool` (`ps_id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`ps_id`) REFERENCES `preschool` (`ps_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `scadmins`
--
ALTER TABLE `scadmins`
  ADD CONSTRAINT `scadmins_ibfk_1` FOREIGN KEY (`ps_id`) REFERENCES `preschool` (`ps_id`) ON DELETE CASCADE;

--
-- Constraints for table `studrec`
--
ALTER TABLE `studrec`
  ADD CONSTRAINT `studrec_ibfk_1` FOREIGN KEY (`adviser_ID`) REFERENCES `adviser` (`adviser_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `studrec_ibfk_2` FOREIGN KEY (`ps_id`) REFERENCES `preschool` (`ps_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `studrec_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `studrec_ibfk_4` FOREIGN KEY (`en_id`) REFERENCES `enroll` (`en_id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`adviser_ID`) REFERENCES `adviser` (`adviser_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `subjects_ibfk_2` FOREIGN KEY (`ps_id`) REFERENCES `preschool` (`ps_id`) ON DELETE CASCADE;
COMMIT;

ALTER TABLE enroll 
ADD COLUMN specify VARCHAR (100);

ALTER TABLE preschool 
ADD COLUMN gcash_number VARCHAR (100);

ALTER TABLE preschool 
ADD COLUMN qr_code TEXT;

ALTER TABLE adviser 
ADD COLUMN max_capacity INT; 

UPDATE adviser
SET max_capacity = 30
WHERE adviser_ID = 1; 

UPDATE adviser
SET max_capacity = 30
WHERE adviser_ID = 2; 

UPDATE adviser
SET max_capacity = 30
WHERE adviser_ID = 3; 

UPDATE adviser
SET max_capacity = 30
WHERE adviser_ID = 4; 

UPDATE adviser
SET max_capacity = 30
WHERE adviser_ID = 5; 

UPDATE adviser
SET max_capacity = 30
WHERE adviser_ID = 6; 

UPDATE adviser
SET max_capacity = 30
WHERE adviser_ID = 7; 

UPDATE adviser
SET max_capacity = 30
WHERE adviser_ID = 8; 

UPDATE studrec SET adviser_ID = 1 WHERE SR_ID = 25; 
UPDATE studrec SET adviser_ID = 1 WHERE SR_ID = 26; 
UPDATE studrec SET adviser_ID = 1 WHERE SR_ID = 27; 
UPDATE studrec SET adviser_ID = 1 WHERE SR_ID = 28; 
UPDATE studrec SET adviser_ID = 1 WHERE SR_ID = 29; 
UPDATE studrec SET adviser_ID = 1 WHERE SR_ID = 30; 
UPDATE studrec SET adviser_ID = 1 WHERE SR_ID = 31; 
UPDATE studrec SET adviser_ID = 1 WHERE SR_ID = 32; 

ALTER TABLE payment 
ADD COLUMN remarks VARCHAR (200); 

CREATE TABLE `discounts` (
  `discount_id` int(11) NOT NULL,	
  `ps_id` INT,
  `percent` varchar(50) NOT NULL,
  `discount_name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  FOREIGN KEY (ps_id) REFERENCES preschool(ps_id)
);

INSERT INTO discounts (ps_id, percent, discount_name, description)
VALUES (1, 5, "Early Bird Discount", "5% off if enrolled early"),
(2, 5, "Early Bird Discount", "5% off if enrolled early"),
(1, 5, "Sibling Discount", "5% off for the next student enrolled"),
(2, 5, "Sibling Discount", "5% off for the next student enrolled");


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
