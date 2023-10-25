CREATE TABLE `Student`(
    `student_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nameStudent` TEXT NOT NULL,
    `phoneStudent` BIGINT NOT NULL,
    `emailStudent` TEXT NOT NULL,
    `numberOfCurses` BIGINT NOT NULL
);
CREATE TABLE `Follow Up`(
    `teacher_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `registerOfEstudent` BIGINT NOT NULL
);
CREATE TABLE `Registro`(`InfoStudiant` TEXT NOT NULL);
ALTER TABLE
    `Registro` ADD PRIMARY KEY(`InfoStudiant`);
CREATE TABLE `Faculty`(
    `faculty_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `department` BIGINT NOT NULL,
    `city` BIGINT NOT NULL
);
CREATE TABLE `Exam`(
    `Exam_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `subjects` TEXT NOT NULL,
    `notes` BIGINT NOT NULL
);
CREATE TABLE `Course`(
    `course_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `student_id` BIGINT NOT NULL,
    `teacher_id` BIGINT NOT NULL,
    `nameCourse` TEXT NOT NULL,
    `credits` BIGINT NULL
);
CREATE TABLE `Parent Information`(
    `infoParents_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `studentRelation` TEXT NOT NULL,
    `nameParent` TEXT NOT NULL,
    `phoneParent` BIGINT NOT NULL
);
CREATE TABLE `Number Of Courses`(
    `courses_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `column_2` BIGINT NOT NULL
);
CREATE TABLE `Teacher`(
    `course_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE `Assists`(
    `student_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `assists` BIGINT NOT NULL
);
CREATE TABLE `Departament`(
    `department_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `courses` TEXT NOT NULL,
    `teachers` TEXT NOT NULL,
    `column_4` BIGINT NOT NULL
);