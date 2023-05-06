CREATE DATABASE guidancetutorialdb;

-- Tables

CREATE TABLE admin(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    username VARCHAR(20) NOT NULL, 
    password VARCHAR(20) NOT NULL, 
    email VARCHAR(40) NOT NULL, 
    first_name VARCHAR(15) NOT NULL, 
    last_name VARCHAR(15) NOT NULL, 
    gender ENUM('Male', 'Female') NOT NULL, 
    phone_number VARCHAR(13) NOT NULL, 
    photo_profile VARCHAR(20) NOT NULL,
    status ENUM('Active', 'Non-active') NOT NULL DEFAULT 'Active', 
    CONSTRAINT UC_Username UNIQUE(username), 
    CONSTRAINT UC_Email UNIQUE(email),
    CONSTRAINT UC_PhoneNumber UNIQUE(phone_number) 
);

CREATE TABLE lesson(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL, 
    description TEXT NOT NULL, 
    thumbnail VARCHAR(30) NOT NULL, 
    link CHAR(41) NOT NULL,
    CONSTRAINT UC_Link UNIQUE(link)
);

CREATE TABLE category(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL, 
    CONSTRAINT UC_Name UNIQUE(name)
);

CREATE TABLE activity_log(
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    activity VARCHAR(150) NOT NULL, 
    admin_id INT NOT NULL, 
    lesson_id INT NOT NULL, 
    CONSTRAINT FK_ActivityLog_Admin FOREIGN KEY(admin_id) REFERENCES admin(id),
    CONSTRAINT FK_ActivityLog_Lesson FOREIGN KEY(lesson_id) REFERENCES lesson(id)
);

CREATE TABLE roadmap(
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    lesson_id INT NOT NULL, 
    CONSTRAINT FK_Roadmap_Category FOREIGN KEY(category_id) REFERENCES category(id), 
    CONSTRAINT FK_Roadmap_Lesson FOREIGN KEY(lesson_id) REFERENCES lesson(id) 
);

ALTER TABLE roadmap ADD CONSTRAINT UC_CategoryLesson UNIQUE(category_id,lesson_id);

CREATE TABLE student(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    username VARCHAR(20) NOT NULL, 
    password VARCHAR(20) NOT NULL, 
    email VARCHAR(40) NOT NULL, 
    first_name VARCHAR(15) NOT NULL, 
    last_name VARCHAR(15) NOT NULL, 
    gender ENUM('Male', 'Female') NOT NULL, 
    phone_number VARCHAR(13) NOT NULL, 
    photo_profile VARCHAR(20) NOT NULL,
    status ENUM('Active', 'Non-active') NOT NULL DEFAULT 'Active', 
    CONSTRAINT UC_Username UNIQUE(username), 
    CONSTRAINT UC_Email UNIQUE(email),
    CONSTRAINT UC_PhoneNumber UNIQUE(phone_number) 
);

CREATE TABLE feedback(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    feedback TEXT NOT NULL,
    lesson_id INT NOT NULL, 
    student_id INT NOT NULL,
    CONSTRAINT FK_Feedback_Lesson FOREIGN KEY(lesson_id) REFERENCES lesson(id), 
    CONSTRAINT FK_Feedback_Student FOREIGN KEY(student_id) REFERENCES student(id)
);

CREATE TABLE enrollment(
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    lesson_id INT NOT NULL,
    student_id INT NOT NULL, 
    CONSTRAINT FK_Enrollment_Lesson FOREIGN KEY(lesson_id) REFERENCES lesson(id), 
    CONSTRAINT FK_Enrollment_Student FOREIGN KEY(student_id) REFERENCES student(id)
);

ALTER TABLE enrollment ADD CONSTRAINT UC_LessonStudent UNIQUE(lesson_id, student_id);

CREATE TABLE lesson_suggestion(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    topic VARCHAR(100) NOT NULL, 
    reason TEXT NOT NULL, 
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    status ENUM('New', 'Responded', 'Declined') NOT NULL DEFAULT 'New', 
    student_id INT NOT NULL, 
    CONSTRAINT FK_LessonSuggestion_Student FOREIGN KEY(student_id) REFERENCES student(id)
);

CREATE TABLE notification(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    lesson_suggestion_id INT NOT NULL, 
    lesson_id INT NOT NULL,
    CONSTRAINT UC_LessonSuggestionId UNIQUE(lesson_suggestion_id), 
    CONSTRAINT UC_LessonId UNIQUE(lesson_id), 
    CONSTRAINT FK_Notification_LessonSuggestion FOREIGN KEY(lesson_suggestion_id) REFERENCES lesson_suggestion(id), 
    CONSTRAINT FK_Notification_Lesson FOREIGN KEY(lesson_id) REFERENCES lesson(id)
);

-- Views

CREATE VIEW profile_admin AS
SELECT first_name, last_name, email, gender, phone_number, photo_profile FROM admin;

CREATE VIEW profile_student AS
SELECT first_name, last_name, email, gender, phone_number, photo_profile FROM student;

CREATE VIEW admin_activity AS
SELECT activity, date, CONCAT(first_name, ' ', last_name) AS manage_by FROM admin
INNER JOIN activity_log ON admin.id = activity_log.admin_id;

-------------------- 
CREATE VIEW lesson_detail AS
SELECT lesson.name AS lesson, description, thumbnail, link, IFNULL(category.name, 'None') AS category  FROM lesson
LEFT JOIN roadmap ON roadmap.lesson_id = lesson.id
LEFT JOIN category ON roadmap.category_id = category.id 

SELECT * FROM lesson_detail WHERE category = 'Front-end Developer';
-------------------- 

-------------------- 
CREATE VIEW related_feedback AS 
SELECT name AS lesson, feedback, date, CONCAT(first_name, ' ', last_name) AS 'feedback_by' FROM lesson
INNER JOIN feedback ON lesson.id = feedback.lesson_id
INNER JOIN student ON feedback.student_id = student.id;

SELECT * FROM related_feedback WHERE lesson = 'CSS Tutorial – Full Course for Beginners';
-------------------- 

-------------------- 
CREATE VIEW lesson_suggestion_list AS
SELECT topic, reason, date, lesson_suggestion.status, CONCAT(first_name, ' ', last_name) AS requested_by FROM lesson_suggestion
INNER JOIN student ON lesson_suggestion.student_id = student.id

SELECT * FROM lesson_suggestion_list WHERE requested_by = 'Cristiano Ronaldo';
-------------------- 

-------------------- 
CREATE VIEW notification_list AS
SELECT CONCAT('Your request has been approved: ', topic) AS message, notification.date, link, CONCAT(first_name, ' ', last_name) AS responded_by FROM notification 
INNER JOIN lesson_suggestion ON notification.lesson_suggestion_id = lesson_suggestion.id
INNER JOIN lesson ON notification.lesson_id = lesson.id
INNER JOIN activity_log ON activity_log.lesson_id = lesson.id
INNER JOIN admin ON activity_log.admin_id = admin.id
WHERE activity_log.activity LIKE "INSERT LESSON%"
-------------------- 

