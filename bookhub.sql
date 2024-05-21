-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 18, 2024 at 12:12 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookhub`
--

-- --------------------------------------------------------

--
-- Table structure for table `Books`
--

CREATE TABLE `Books` (
  `bookID` int(11) NOT NULL,
  `bookName` varchar(30) NOT NULL,
  `bookAuthor` varchar(30) NOT NULL,
  `bookDescription` longtext DEFAULT NULL,
  `bookCourseId` int(10) NOT NULL,
  `book_photopath` varchar(50) NOT NULL,
  `book_rating` float NOT NULL,
  `BookDateCreated` datetime DEFAULT NULL,
  `BookDateModified` datetime DEFAULT NULL,
  `booksProfessorsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Books`
--

INSERT INTO `Books` (`bookID`, `bookName`, `bookAuthor`, `bookDescription`, `bookCourseId`, `book_photopath`, `book_rating`, `BookDateCreated`, `BookDateModified`, `booksProfessorsID`) VALUES
(1, 'Computer Network', 'Jk', NULL, 1, 'menu-book1.jpg', 2, '0000-00-00 00:00:00', NULL, 1),
(2, 'Computer & Internet Security', 'Eni', NULL, 1, 'menu-book3.jpg', 1, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(10) NOT NULL,
  `course_code` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `professor_id` int(100) NOT NULL,
  `course_grade` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_code`, `department`, `course_name`, `professor_id`, `course_grade`) VALUES
(1, '1234', 'Faculty of Architecture and Engineering', 'Computer Networks', 1, 'SWE-3');

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `professor_id` int(100) NOT NULL,
  `professor_name` varchar(100) NOT NULL,
  `professor_surname` varchar(50) NOT NULL,
  `professor_email` varchar(255) NOT NULL,
  `professor_pass` varchar(255) NOT NULL,
  `department` varchar(100) NOT NULL,
  `professor_lastlogin` datetime DEFAULT NULL,
  `accessLevel` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`professor_id`, `professor_name`, `professor_surname`, `professor_email`, `professor_pass`, `department`, `professor_lastlogin`, `accessLevel`) VALUES
(1, 'Ari', 'Gjerazi', 'arigjerazi@epoka.edu.al', '1234', 'Faculty of Architecture and Engineering', NULL, 2),
(2, 'klajdi', 'test', 'klajditest@epoka.edu.al', '7c9fad4228973f8f335d1a7dc39b1d95', 'option1', '2024-05-05 05:07:37', 2),
(3, 'tomi', 'deda', 'tomideda@epoka.edu.al', '08767d10c94125f26f95eaadb5ebb98a', 'Faculty of Engineering And Architecture', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(100) NOT NULL,
  `book_id` int(100) NOT NULL,
  `rating` int(11) NOT NULL,
  `review_text` varchar(255) NOT NULL,
  `review_userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `usersurname` varchar(25) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_accesslevel` int(11) NOT NULL DEFAULT 1,
  `user_password` varchar(250) NOT NULL,
  `LastLogIn` datetime DEFAULT NULL,
  `user_grade` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `usersurname`, `user_email`, `user_accesslevel`, `user_password`, `LastLogIn`, `user_grade`) VALUES
(3, 'klajdi', 'kopani', 'klajdi@epoka.edu.al', 1, '7c9fad4228973f8f335d1a7dc39b1d95', '2024-05-15 02:45:46', 'SWE-3'),
(28, 'eni', 'deda', 'ededa24@epoka.edu.al', 0, 'e810461448588437c44507a1749f3083', '2024-05-06 22:23:26', ''),
(29, 'spiderman', 'miles', 'miles@epoka.edu.al', 1, '6a81060b83b919bc115112bf840eca63', '2024-05-05 04:45:53', 'BINF-3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Books`
--
ALTER TABLE `Books`
  ADD PRIMARY KEY (`bookID`),
  ADD KEY `books_ibfk_1` (`bookCourseId`),
  ADD KEY `booksProfessorsID` (`booksProfessorsID`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `professor_id` (`professor_id`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`professor_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `review_userid` (`review_userid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Books`
--
ALTER TABLE `Books`
  MODIFY `bookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `professors`
--
ALTER TABLE `professors`
  MODIFY `professor_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Books`
--
ALTER TABLE `Books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`bookCourseId`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`booksProfessorsID`) REFERENCES `professors` (`professor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`professor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Books` (`bookID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`review_userid`) REFERENCES `users` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
