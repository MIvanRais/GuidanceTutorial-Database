-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2023 at 04:49 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `guidancetutorialdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `activity` varchar(150) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `date`, `activity`, `admin_id`, `lesson_id`) VALUES
(3, '2023-04-27 19:35:55', 'INSERT LESSON: TUTORIAL HTML DASAR (BAHASA INDONESIA)', 1, 1),
(4, '2023-04-27 19:36:50', 'INSERT LESSON: CSS Tutorial – Full Course for Beginners', 3, 2),
(5, '2023-04-27 19:39:33', 'UPDATE LESSON: TUTORIAL HTML DASAR (BAHASA INDONESIA)', 3, 1),
(6, '2023-04-27 19:40:04', 'UPDATE LESSON: TUTORIAL HTML DASAR (BAHASA INDONESIA)', 1, 1),
(7, '2023-04-27 19:40:38', 'UPDATE LESSON: TUTORIAL HTML DASAR (BAHASA INDONESIA)', 1, 1),
(8, '2023-04-27 19:41:04', 'UPDATE LESSON: CSS Tutorial – Full Course for Beginners', 1, 2),
(9, '2023-04-27 22:08:05', 'INSERT LESSON: The 50 Most Popular Linux & Terminal Commands - Full Course for Beginners', 1, 4),
(10, '2023-04-28 09:46:47', 'INSERT LESSON: Figma tutorial for Beginners: Complete Website from Start to Finish', 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `status` enum('Active','Non-active') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `email`, `first_name`, `last_name`, `gender`, `phone_number`, `status`) VALUES
(1, 'ivan', 'ivan123', 'ivan@gmail.com', 'Mochammad', 'Ivan Ra\'is', 'Male', '09876532121', 'Active'),
(3, 'joni', 'joni123', 'joni@gmail.com', 'Joni', 'Iskandar', 'Male', '23456789', 'Active');

-- --------------------------------------------------------

--
-- Stand-in structure for view `admin_activity`
-- (See below for the actual view)
--
CREATE TABLE `admin_activity` (
`activity` varchar(150)
,`date` datetime
,`manage_by` varchar(31)
);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(2, 'Back-end Developer'),
(1, 'Front-end Developer'),
(3, 'JavaScript');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `lesson_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`id`, `date`, `lesson_id`, `student_id`) VALUES
(1, '2023-04-27 21:16:45', 2, 1),
(2, '2023-04-27 21:16:45', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `feedback` text NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `date`, `feedback`, `lesson_id`, `student_id`) VALUES
(1, '2023-04-27 21:04:05', 'Thank you for your effort!', 2, 1),
(2, '2023-04-27 21:04:05', 'Amazing tutorial.', 2, 1),
(3, '2023-04-27 21:04:27', 'Mantap', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `thumbnail` varchar(30) NOT NULL,
  `link` char(41) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`id`, `name`, `description`, `thumbnail`, `link`) VALUES
(1, 'TUTORIAL HTML DASAR (BAHASA INDONESIA)', '🔥 Promo Unlimited Hosting Niagahoster http://bit.ly/3RUEr3A : diskon up to 75% + gratis domain + SSL 🔥\r\n👍🏼 Gunakan kode kupon “PZN” untuk tambahan DISKON 10% khusus member baru\r\n\r\n#Niagahoster #UnlimitedHosting #WebHosting #WebHostingIndonesia #programmerzamannow #html #htmldasar #web #belajarhtml #tutorialhtml\r\n\r\nHi guys, di video kali ini, kita akan bahas tentang materi HTML Dasar. Ini adalah materi awal untuk teman-teman yang mau belajar menjadi Web Developer\r\n\r\nSlide : https://docs.google.com/presentation/...\r\n\r\nSource Code : https://github.com/ProgrammerZamanNow...\r\n', 'html.png', 'https://www.youtube.com/embed/hMDJyb7VkYw'),
(2, 'CSS Tutorial – Full Course for Beginners', 'In this in-depth course, you will learn about all the key features of CSS. This is the most comprehensive CSS course we\'ve published to date. So if you want to become an expert in Cascading Style Sheets, this is the course for you.\r\n\r\n✏️ Course from Dave Gray. Check out his channel:   \r\n\r\n / davegrayteachescode   \r\n\r\n💻 Course Resources: https://github.com/gitdagray/css_course\r\n\r\n🎥 Dave\'s HTML course:   \r\n\r\n • Learn HTML – Full...  \r\n\r\n⭐️ Course Contents ⭐️\r\n(0:00:00) Intro\r\n(0:01:08) Chapter 1: Start Here\r\n(0:14:50) Chapter 2: Selectors\r\n(0:34:41) Chapter 3: Colors\r\n(0:51:13) Chapter 4: Units & Sizes\r\n(1:11:56) Chapter 5: Box Model\r\n(1:37:08) Chapter 6: Typography\r\n(2:00:29) Chapter 7: Styling Links\r\n(2:16:37) Chapter 8: List Styles\r\n(2:32:31) Chapter 9: Mini Project\r\n(2:45:04) Chapter 10: Display\r\n(3:00:21) Chapter 11: Floats\r\n(3:12:46) Chapter 12: Columns\r\n(3:34:30) Chapter 13: Position\r\n(3:57:53) Chapter 14: Flexbox\r\n(4:21:39) Chapter 15: Grid Layout\r\n(4:46:33) Chapter 16: Images\r\n(5:32:40) Chapter 17: Media Queries\r\n(5:58:59) Chapter 18: Card Project\r\n(6:33:21) Chapter 19: Pseudo\r\n(6:52:56) Chapter 20: Variables\r\n(7:20:28) Chapter 21: Functions\r\n(7:50:05) Chapter 22: Animations\r\n(8:37:33) Chapter 23: Organization\r\n(8:57:23) Chapter 24: Final Project\r\n\r\n🎉 Thanks to our Champion and Sponsor supporters:\r\n👾 Raymond Odero\r\n👾 Agustín Kussrow\r\n👾 aldo ferretti\r\n👾 Otis Morgan\r\n👾 DeezMaster\r\n\r\n--\r\n\r\nLearn to code for free and get a developer job: https://www.freecodecamp.org\r\n\r\nRead hundreds of articles on programming: https://freecodecamp.org/news', 'css.png', 'https://www.youtube.com/embed/OXGznpKZ_sA'),
(4, 'The 50 Most Popular Linux & Terminal Commands - Full Course for Beginners', 'Learn the 50 most popular Linux commands from Colt Steele. All these commands work on Linux, macOS, WSL, and anywhere you have a UNIX environment. 🐱\r\n\r\n✏️ Colt Steele developed this course.\r\n\r\n🔗 The Linux Command Handbook by Flavio Copes: https://www.freecodecamp.org/news/the...\r\n\r\n🔗 If you want to learn more about terminal commands and become a software engineer, check out the bootcamp Colt built with Springboard: https://www.springboard.com/courses/s...\r\n\r\n⭐️ Course Contents ⭐️\r\n⌨️ (0:00:00) Introduction\r\n⌨️ (0:04:37) Why use the command line?\r\n⌨️ (0:06:56) The world of operating systems\r\n⌨️ (0:10:56) What is Linux?\r\n⌨️ (0:16:58) Shells and Bash\r\n⌨️ (0:19:28) Setup For Linux Users\r\n⌨️ (0:20:28) Setup For Mac Users\r\n⌨️ (0:21:05) Setup For Windows (WSL)\r\n⌨️ (0:29:43) Using The Terminal\r\n⌨️ (0:31:12) whoami\r\n⌨️ (0:32:34) man\r\n⌨️ (0:33:40) clear\r\n⌨️ (0:36:42) intro to options\r\n⌨️ (0:39:05) pwd\r\n⌨️ (0:41:07) ls\r\n⌨️ (0:49:21) cd\r\n⌨️ (1:00:40) mkdir\r\n⌨️ (1:06:33) touch\r\n⌨️ (1:12:03) rmdir\r\n⌨️ (1:13:05) rm\r\n⌨️ (1:21:26) open\r\n⌨️ (1:23:55) mv\r\n⌨️ (1:27:51) cp\r\n⌨️ (1:31:56) head\r\n⌨️ (1:33:02) tail\r\n⌨️ (1:35:27) date\r\n⌨️ (1:36:02) redirecting standard output\r\n⌨️ (1:41:48) cat\r\n⌨️ (1:46:15) less\r\n⌨️ (1:49:17) echo\r\n⌨️ (1:51:38) wc\r\n⌨️ (1:53:52) piping\r\n⌨️ (1:56:43) sort\r\n⌨️ (2:01:09) uniq\r\n⌨️ (2:06:59) expansions\r\n⌨️ (2:17:08) diff\r\n⌨️ (2:21:01) find\r\n⌨️ (2:32:10) grep\r\n⌨️ (2:36:52) du\r\n⌨️ (2:40:55) df\r\n⌨️ (2:44:04) history\r\n⌨️ (2:47:32) ps\r\n⌨️ (2:51:50) top\r\n⌨️ (2:54:02) kill\r\n⌨️ (3:00:13) killall\r\n⌨️ (3:01:37) jobs, bg, and fg\r\n⌨️ (3:09:40) gzip\r\n⌨️ (3:12:18) gunzip\r\n⌨️ (3:15:27) tar\r\n⌨️ (3:23:36) nano\r\n⌨️ (3:31:17) alias\r\n⌨️ (3:42:48) xargs\r\n⌨️ (3:50:57) ln\r\n⌨️ (4:01:49) who\r\n⌨️ (4:03:47) su\r\n⌨️ (4:08:32) sudo\r\n⌨️ (4:18:36) passwd\r\n⌨️ (4:21:54) chown\r\n⌨️ (4:31:08) Understanding permissions\r\n⌨️ (4:47:15) chmod\r\n\r\n🎉 Thanks to our Champion and Sponsor supporters:\r\n👾 Wong Voon jinq\r\n👾 hexploitation\r\n👾 Katia Moran\r\n👾 BlckPhantom\r\n👾 Nick Raker\r\n👾 Otis Morgan\r\n👾 DeezMaster\r\n👾 AppWrite\r\n\r\n--\r\n\r\nLearn to code for free and get a developer job: https://www.freecodecamp.org\r\n\r\nRead hundreds of articles on programming: https://freecodecamp.org/news', 'linux-command.png', 'https://www.youtube.com/embed/ZtqBQ68cfJc'),
(5, 'Figma tutorial for Beginners: Complete Website from Start to Finish', 'Build alongside Ran by downloading the starter file here 👉  https://bit.ly/3LrnwR5\r\nLearn to design high end websites with our Web Design Pro course - https://bit.ly/3WaPu9D\r\n\r\nSee part 2 on how to build this site with Webflow:   \r\n\r\n • Figma to Webflow ...  \r\n\r\n📽️ CHAPTERS \r\n00:00 - Introduction\r\n01:00 - Figma interface overview \r\n04:30 - Page & grid setup \r\n09:30 - Designing the hero & navigation \r\n21:20 - Creating the background effect \r\n25:00 - Building the content section \r\n30:50 - Masking & blend modes \r\n36:30 - Using Gradients \r\n39:00 - Building the footer\r\n40:40 - Designing a form\r\n42:00 - Next steps\r\n\r\n⬇ If you would like to watch more Figma Tutorials, please let us know in the comments ⬇\r\n\r\nDon\'t forget to subscribe to our channel for more Design Content. Click here 👉 https://bit.ly/33byV7L\r\n\r\n🎨 Learn the Art & Business of Web Design. Check out all our courses  👉 https://bit.ly/3jMxocU\r\n\r\n📱 Find us on SOCIAL MEDIA\r\nFlux Academy\'s Instagram 👉 https://www.instagram.com/flux.academy/\r\nRan\'s Instagram 👉 https://www.instagram.com/ransegall/\r\n\r\nThanks for watching our video!\r\n\r\n#Figma #WebDesign #FluxAcademy\r\n', 'figma-thumbnail.png', 'https://www.youtube.com/embed/HZuk6Wkx_Eg');

-- --------------------------------------------------------

--
-- Stand-in structure for view `lesson_detail`
-- (See below for the actual view)
--
CREATE TABLE `lesson_detail` (
`lesson` varchar(100)
,`description` text
,`thumbnail` varchar(30)
,`link` char(41)
,`category` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `lesson_suggestion`
--

CREATE TABLE `lesson_suggestion` (
  `id` int(11) NOT NULL,
  `topic` varchar(100) NOT NULL,
  `reason` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('New','Responded','Declined') NOT NULL DEFAULT 'New',
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lesson_suggestion`
--

INSERT INTO `lesson_suggestion` (`id`, `topic`, `reason`, `date`, `status`, `student_id`) VALUES
(1, 'JavaScript DOM', 'Because I want to be able manipulate a document which is HTML.', '2023-04-27 21:52:06', 'Declined', 1),
(2, 'Linux Commands', 'Because many senior developers said \"beginner developer must can Linux commands\"', '2023-04-27 21:55:08', 'Responded', 2),
(4, 'Figma tutorial for Beginners', 'Kepo', '2023-04-28 09:44:52', 'Responded', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `lesson_suggestion_list`
-- (See below for the actual view)
--
CREATE TABLE `lesson_suggestion_list` (
`topic` varchar(100)
,`reason` text
,`date` datetime
,`status` enum('New','Responded','Declined')
,`requested_by` varchar(31)
);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `admin_id` int(11) NOT NULL,
  `lesson_suggestion_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `date`, `admin_id`, `lesson_suggestion_id`, `lesson_id`) VALUES
(1, '2023-04-28 10:30:58', 1, 2, 4),
(2, '2023-04-28 10:33:51', 3, 4, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `notification_list`
-- (See below for the actual view)
--
CREATE TABLE `notification_list` (
`message` varchar(132)
,`date` datetime
,`link` char(41)
,`responded_by` varchar(31)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `profile_admin`
-- (See below for the actual view)
--
CREATE TABLE `profile_admin` (
`first_name` varchar(15)
,`last_name` varchar(15)
,`email` varchar(40)
,`gender` enum('Male','Female')
,`phone_number` varchar(13)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `profile_student`
-- (See below for the actual view)
--
CREATE TABLE `profile_student` (
`first_name` varchar(15)
,`last_name` varchar(15)
,`email` varchar(40)
,`gender` enum('Male','Female')
,`phone_number` varchar(13)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `related_feedback`
-- (See below for the actual view)
--
CREATE TABLE `related_feedback` (
`lesson` varchar(100)
,`feedback` text
,`date` datetime
,`feedback_by` varchar(31)
);

-- --------------------------------------------------------

--
-- Table structure for table `roadmap`
--

CREATE TABLE `roadmap` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roadmap`
--

INSERT INTO `roadmap` (`id`, `category_id`, `lesson_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(9, 1, 4),
(10, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `status` enum('Active','Non-active') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `username`, `password`, `email`, `first_name`, `last_name`, `gender`, `phone_number`, `status`) VALUES
(1, 'ronaldo', 'ronaldo123', 'ronaldo@gmail.com', 'Cristiano', 'Ronaldo', 'Male', '456789', 'Active'),
(2, 'messi', 'messi123', 'messi@gmail.com', 'Lionel', 'Messi', 'Male', '3246214', 'Active');

-- --------------------------------------------------------

--
-- Structure for view `admin_activity`
--
DROP TABLE IF EXISTS `admin_activity`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `admin_activity`  AS SELECT `activity_log`.`activity` AS `activity`, `activity_log`.`date` AS `date`, concat(`admin`.`first_name`,' ',`admin`.`last_name`) AS `manage_by` FROM (`admin` join `activity_log` on(`admin`.`id` = `activity_log`.`admin_id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `lesson_detail`
--
DROP TABLE IF EXISTS `lesson_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lesson_detail`  AS SELECT `lesson`.`name` AS `lesson`, `lesson`.`description` AS `description`, `lesson`.`thumbnail` AS `thumbnail`, `lesson`.`link` AS `link`, ifnull(`category`.`name`,'None') AS `category` FROM ((`lesson` left join `roadmap` on(`roadmap`.`lesson_id` = `lesson`.`id`)) left join `category` on(`roadmap`.`category_id` = `category`.`id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `lesson_suggestion_list`
--
DROP TABLE IF EXISTS `lesson_suggestion_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lesson_suggestion_list`  AS SELECT `lesson_suggestion`.`topic` AS `topic`, `lesson_suggestion`.`reason` AS `reason`, `lesson_suggestion`.`date` AS `date`, `lesson_suggestion`.`status` AS `status`, concat(`student`.`first_name`,' ',`student`.`last_name`) AS `requested_by` FROM (`lesson_suggestion` join `student` on(`lesson_suggestion`.`student_id` = `student`.`id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `notification_list`
--
DROP TABLE IF EXISTS `notification_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `notification_list`  AS SELECT concat('Your request has been approved: ',`lesson_suggestion`.`topic`) AS `message`, `notification`.`date` AS `date`, `lesson`.`link` AS `link`, concat(`admin`.`first_name`,' ',`admin`.`last_name`) AS `responded_by` FROM (((`lesson_suggestion` join `notification` on(`lesson_suggestion`.`id` = `notification`.`lesson_suggestion_id`)) join `lesson` on(`notification`.`lesson_id` = `lesson`.`id`)) join `admin` on(`notification`.`admin_id` = `admin`.`id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `profile_admin`
--
DROP TABLE IF EXISTS `profile_admin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `profile_admin`  AS SELECT `admin`.`first_name` AS `first_name`, `admin`.`last_name` AS `last_name`, `admin`.`email` AS `email`, `admin`.`gender` AS `gender`, `admin`.`phone_number` AS `phone_number` FROM `admin`;

-- --------------------------------------------------------

--
-- Structure for view `profile_student`
--
DROP TABLE IF EXISTS `profile_student`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `profile_student`  AS SELECT `student`.`first_name` AS `first_name`, `student`.`last_name` AS `last_name`, `student`.`email` AS `email`, `student`.`gender` AS `gender`, `student`.`phone_number` AS `phone_number` FROM `student`;

-- --------------------------------------------------------

--
-- Structure for view `related_feedback`
--
DROP TABLE IF EXISTS `related_feedback`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `related_feedback`  AS SELECT `lesson`.`name` AS `lesson`, `feedback`.`feedback` AS `feedback`, `feedback`.`date` AS `date`, concat(`student`.`first_name`,' ',`student`.`last_name`) AS `feedback_by` FROM ((`lesson` join `feedback` on(`lesson`.`id` = `feedback`.`lesson_id`)) join `student` on(`feedback`.`student_id` = `student`.`id`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ActivityLog_Admin` (`admin_id`),
  ADD KEY `FK_ActivityLog_Lesson` (`lesson_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UC_Username` (`username`),
  ADD UNIQUE KEY `UC_Email` (`email`),
  ADD UNIQUE KEY `UC_PhoneNumber` (`phone_number`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UC_Name` (`name`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UC_LessonStudent` (`lesson_id`,`student_id`),
  ADD KEY `FK_Enrollment_Student` (`student_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Feedback_Lesson` (`lesson_id`),
  ADD KEY `FK_Feedback_Student` (`student_id`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UC_Link` (`link`);

--
-- Indexes for table `lesson_suggestion`
--
ALTER TABLE `lesson_suggestion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_LessonSuggestion_Student` (`student_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UC_LessonSuggestionId_LessonId` (`lesson_id`,`lesson_suggestion_id`),
  ADD KEY `FK_Notification_LessonSuggestion` (`lesson_suggestion_id`),
  ADD KEY `FK_Notification_Admin` (`admin_id`);

--
-- Indexes for table `roadmap`
--
ALTER TABLE `roadmap`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UC_CategoryLesson` (`category_id`,`lesson_id`),
  ADD KEY `FK_Roadmap_Lesson` (`lesson_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UC_Username` (`username`),
  ADD UNIQUE KEY `UC_Email` (`email`),
  ADD UNIQUE KEY `UC_PhoneNumber` (`phone_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lesson_suggestion`
--
ALTER TABLE `lesson_suggestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roadmap`
--
ALTER TABLE `roadmap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `FK_ActivityLog_Admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `FK_ActivityLog_Lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`);

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `FK_Enrollment_Lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`),
  ADD CONSTRAINT `FK_Enrollment_Student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `FK_Feedback_Lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`),
  ADD CONSTRAINT `FK_Feedback_Student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `lesson_suggestion`
--
ALTER TABLE `lesson_suggestion`
  ADD CONSTRAINT `FK_LessonSuggestion_Student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `FK_Notification_Admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `FK_Notification_Lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`),
  ADD CONSTRAINT `FK_Notification_LessonSuggestion` FOREIGN KEY (`lesson_suggestion_id`) REFERENCES `lesson_suggestion` (`id`);

--
-- Constraints for table `roadmap`
--
ALTER TABLE `roadmap`
  ADD CONSTRAINT `FK_Roadmap_Category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_Roadmap_Lesson` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
