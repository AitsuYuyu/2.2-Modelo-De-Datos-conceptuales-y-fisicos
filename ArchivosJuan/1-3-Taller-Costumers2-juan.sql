CREATE TABLE `Account`(
    `account_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE `Costumer`(
    `costumer_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `costumerName` VARCHAR(255) NOT NULL,
    `costumerLastName` VARCHAR(255) NULL,
    `costumerPhone` INT NULL,
    `branch_id` BIGINT NOT NULL,
    `account_id` BIGINT NOT NULL
);
CREATE TABLE `Branch`(
    `department` VARCHAR(255) NOT NULL,
    `city` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Branch` ADD PRIMARY KEY(`department`);
ALTER TABLE
    `Costumer` ADD CONSTRAINT `costumer_account_id_foreign` FOREIGN KEY(`account_id`) REFERENCES `Account`(`account_id`);
ALTER TABLE
    `Costumer` ADD CONSTRAINT `costumer_branch_id_foreign` FOREIGN KEY(`branch_id`) REFERENCES `Branch`(`city`);