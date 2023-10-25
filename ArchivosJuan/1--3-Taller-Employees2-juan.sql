CREATE TABLE `Type`(
    `privateGetfed_id` BIGINT NOT NULL,
    `publicSetfed_id` BIGINT NOT NULL
);
ALTER TABLE
    `Type` ADD PRIMARY KEY(`privateGetfed_id`);
CREATE TABLE `Employee`(
    `employeeName` VARCHAR(255) NULL,
    `employeeLastName` VARCHAR(255) NOT NULL,
    `employeePhone` INT NULL,
    `employeeEmail` VARCHAR(255) NOT NULL,
    `class_id` BIGINT NOT NULL,
    `employee_id` BIGINT NOT NULL
);
CREATE TABLE `Register`(
    `newEmployee_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nameEmployee` VARCHAR(255) NULL,
    `lastNameEmployee` VARCHAR(255) NOT NULL,
    `phoneEmployee` INT NULL,
    `employee_id` BIGINT NOT NULL
);
CREATE TABLE `Class Employee`(
    `publicString_id` VARCHAR(255) NOT NULL,
    `privateString_id` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Class Employee` ADD PRIMARY KEY(`publicString_id`);
ALTER TABLE
    `Employee` ADD CONSTRAINT `employee_employee_id_foreign` FOREIGN KEY(`employee_id`) REFERENCES `Register`(`newEmployee_id`);
ALTER TABLE
    `Employee` ADD CONSTRAINT `employee_class_id_foreign` FOREIGN KEY(`class_id`) REFERENCES `Class Employee`(`privateString_id`);
ALTER TABLE
    `Type` ADD CONSTRAINT `type_publicsetfed_id_foreign` FOREIGN KEY(`publicSetfed_id`) REFERENCES `Class Employee`(`publicString_id`);
ALTER TABLE
    `Class Employee` ADD CONSTRAINT `class employee_privatestring_id_foreign` FOREIGN KEY(`privateString_id`) REFERENCES `Type`(`privateGetfed_id`);
ALTER TABLE
    `Employee` ADD CONSTRAINT `employee_class_id_foreign` FOREIGN KEY(`class_id`) REFERENCES `Class Employee`(`publicString_id`);