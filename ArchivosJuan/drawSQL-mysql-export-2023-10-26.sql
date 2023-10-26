CREATE TABLE `Employee`(
    `nameEmployee` VARCHAR(255) NOT NULL,
    `emailEmployee` VARCHAR(255) NULL,
    `positionEmployee` VARCHAR(255) NULL,
    `phoneEmployee` INT NULL,
    `typeContract_id` BIGINT NOT NULL
);
ALTER TABLE
    `Employee` ADD PRIMARY KEY(`nameEmployee`);
CREATE TABLE `Contract of part time`(
    `contract-id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `positionManager` VARCHAR(255) NOT NULL,
    `positionAccountant` VARCHAR(255) NOT NULL
);
CREATE TABLE `Contract of full time`(
    `contract_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
ALTER TABLE
    `Employee` ADD CONSTRAINT `employee_typecontract_id_foreign` FOREIGN KEY(`typeContract_id`) REFERENCES `Contract of full time`(`contract_id`);
ALTER TABLE
    `Employee` ADD CONSTRAINT `employee_typecontract_id_foreign` FOREIGN KEY(`typeContract_id`) REFERENCES `Contract of part time`(`contract-id`);