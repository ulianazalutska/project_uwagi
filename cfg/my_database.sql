-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2024 at 02:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `person_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`person_id`, `first_name`, `last_name`) VALUES
(1, 'John', 'Doe'),
(2, 'Alice', 'Smith'),
(3, 'Bob', 'Johnson'),
(4, 'Eve', 'Williams'),
(5, 'Chris', 'Brown'),
(6, 'Sophia', 'Davis'),
(7, 'Michael', 'Taylor'),
(8, 'Olivia', 'Miller'),
(9, 'Daniel', 'Wilson'),
(10, 'Emma', 'Anderson');

-- --------------------------------------------------------

--
-- Table structure for table `remarks`
--

CREATE TABLE `remarks` (
  `remark_id` int(11) NOT NULL,
  `offender_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `points` int(11) DEFAULT NULL CHECK (`points` between -100 and 100),
  `remark_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `remarks`
--

INSERT INTO `remarks` (`remark_id`, `offender_id`, `description`, `points`, `remark_date`) VALUES
(1, 3, 'Late submission of report', -20, '2024-10-26 12:33:47'),
(2, 1, 'Helped a colleague with a project', 15, '2024-10-26 12:33:47'),
(3, 4, 'Missed team meeting without notice', -10, '2024-10-26 12:33:47'),
(4, 2, 'Completed task ahead of schedule', 25, '2024-10-26 12:33:47'),
(5, 7, 'Poor quality of submitted work', -30, '2024-10-26 12:33:47'),
(6, 5, 'Excellent customer feedback', 40, '2024-10-26 12:33:47'),
(7, 10, 'Did not follow protocol', -15, '2024-10-26 12:33:47'),
(8, 3, 'Proposed a new idea that increased efficiency', 35, '2024-10-26 12:33:47'),
(9, 9, 'Repeated tardiness', -25, '2024-10-26 12:33:47'),
(10, 6, 'Volunteered for additional responsibilities', 20, '2024-10-26 12:33:47'),
(11, 8, 'Forgot to update task status', -5, '2024-10-26 12:33:47'),
(12, 2, 'Contributed to team brainstorming session', 10, '2024-10-26 12:33:47'),
(13, 5, 'Left early without notifying manager', -10, '2024-10-26 12:33:47'),
(14, 1, 'Managed client complaints effectively', 30, '2024-10-26 12:33:47'),
(15, 10, 'Unprepared for presentation', -20, '2024-10-26 12:33:47'),
(16, 7, 'Received excellent feedback from client', 45, '2024-10-26 12:33:47'),
(17, 3, 'Failed to meet project deadline', -35, '2024-10-26 12:33:47'),
(18, 9, 'Innovative approach to solving complex issue', 40, '2024-10-26 12:33:47'),
(19, 4, 'Ignored team emails', -10, '2024-10-26 12:33:47'),
(20, 6, 'Took initiative in organizing team meeting', 25, '2024-10-26 12:33:47'),
(21, 1, 'Completed training program', 15, '2024-10-26 12:33:47'),
(22, 8, 'Delayed response to important client email', -10, '2024-10-26 12:33:47'),
(23, 10, 'Positive interaction with new client', 20, '2024-10-26 12:33:47'),
(24, 5, 'Did not adhere to project guidelines', -15, '2024-10-26 12:33:47'),
(25, 2, 'Managed to secure a high-value client', 50, '2024-10-26 12:33:47'),
(26, 4, 'Lack of collaboration with team', -20, '2024-10-26 12:33:47'),
(27, 3, 'Provided useful feedback during review', 10, '2024-10-26 12:33:47'),
(28, 7, 'Missed project milestone', -25, '2024-10-26 12:33:47'),
(29, 8, 'Exceeded sales target', 35, '2024-10-26 12:33:47'),
(30, 9, 'Did not attend mandatory training', -10, '2024-10-26 12:33:47'),
(31, 10, 'Provided timely updates', 15, '2024-10-26 12:33:47'),
(32, 5, 'Repeatedly missed weekly meetings', -20, '2024-10-26 12:33:47'),
(33, 2, 'Implemented cost-saving measures', 30, '2024-10-26 12:33:47'),
(34, 1, 'High accuracy in data entry tasks', 20, '2024-10-26 12:33:47'),
(35, 6, 'Failed to submit required documentation', -15, '2024-10-26 12:33:47'),
(36, 4, 'Positive mentorship feedback from junior staff', 25, '2024-10-26 12:33:47'),
(37, 3, 'Late for work multiple times', -20, '2024-10-26 12:33:47'),
(38, 8, 'Resolved technical issue proactively', 30, '2024-10-26 12:33:47'),
(39, 9, 'Lack of engagement in team activities', -10, '2024-10-26 12:33:47'),
(40, 7, 'Excellent analytical report submission', 40, '2024-10-26 12:33:47'),
(41, 2, 'Contributed to team morale positively', 20, '2024-10-26 12:33:47'),
(42, 1, 'Lost company equipment', -30, '2024-10-26 12:33:47'),
(43, 4, 'Successfully led project task force', 35, '2024-10-26 12:33:47'),
(44, 10, 'Absent during key project meeting', -15, '2024-10-26 12:33:47'),
(45, 5, 'Exceeded expected performance metrics', 45, '2024-10-26 12:33:47'),
(46, 3, 'Unable to meet expectations on project', -25, '2024-10-26 12:33:47'),
(47, 6, 'Adapted well to new software tools', 20, '2024-10-26 12:33:47'),
(48, 9, 'Failed to update client on project status', -10, '2024-10-26 12:33:47'),
(49, 7, 'Provided valuable insights in survey', 30, '2024-10-26 12:33:47'),
(50, 8, 'Reported incorrect data', -15, '2024-10-26 12:33:47'),
(51, 3, 'Don\'t play football', -99, '2024-10-26 22:00:00'),
(52, 1, 'Don\'t play football', -99, '2024-10-26 22:00:00'),
(53, 5, 'Play football', 99, '2024-10-26 22:00:00'),
(54, 9, 'Play volleyball', 22, '2024-10-26 22:00:00'),
(55, 8, 'Don\'t play volleyball', -33, '2024-10-26 22:00:00'),
(56, 10, 'sasdas', -10, '2024-10-26 22:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`person_id`);

--
-- Indexes for table `remarks`
--
ALTER TABLE `remarks`
  ADD PRIMARY KEY (`remark_id`),
  ADD KEY `offender_id` (`offender_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `persons`
--
ALTER TABLE `persons`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `remarks`
--
ALTER TABLE `remarks`
  MODIFY `remark_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `remarks`
--
ALTER TABLE `remarks`
  ADD CONSTRAINT `remarks_ibfk_1` FOREIGN KEY (`offender_id`) REFERENCES `persons` (`person_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
